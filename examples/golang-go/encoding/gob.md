# Package gob

Package gob manages streams of gobs - binary values exchanged between an Encoder (transmitter) and a Decoder (receiver). A typical use is transporting arguments and results of remote procedure calls (RPCs) such as those provided by package "net/rpc". 

The implementation compiles a custom codec for each data type in the stream and is most efficient when a single Encoder is used to transmit a stream of values, amortizing the cost of compilation. 

### hdr-BasicsBasics
A stream of gobs is self-describing. Each data item in the stream is preceded by a specification of its type, expressed in terms of a small set of predefined types. Pointers are not transmitted, but the things they point to are transmitted; that is, the values are flattened. Nil pointers are not permitted, as they have no value. Recursive types work fine, but recursive values (data with cycles) are problematic. This may change. 

To use gobs, create an Encoder and present it with a series of data items as values or addresses that can be dereferenced to values. The Encoder makes sure all type information is sent before it is needed. At the receive side, a Decoder retrieves values from the encoded stream and unpacks them into local variables. 

### hdr-Types_and_ValuesTypes and Values
The source and destination values/types need not correspond exactly. For structs, fields (identified by name) that are in the source but absent from the receiving variable will be ignored. Fields that are in the receiving variable but missing from the transmitted type or value will be ignored in the destination. If a field with the same name is present in both, their types must be compatible. Both the receiver and transmitter will do all necessary indirection and dereferencing to convert between gobs and actual Go values. For instance, a gob type that is schematically, 

```
struct { A, B int }

```
can be sent from or received into any of these Go types: 

```
struct { A, B int }	// the same
*struct { A, B int }	// extra indirection of the struct
struct { *A, **B int }	// extra indirection of the fields
struct { A, B int64 }	// different concrete value type; see below

```
It may also be received into any of these: 

```
struct { A, B int }	// the same
struct { B, A int }	// ordering doesn't matter; matching is by name
struct { A, B, C int }	// extra field (C) ignored
struct { B int }	// missing field (A) ignored; data will be dropped
struct { B, C int }	// missing field (A) ignored; extra field (C) ignored.

```
Attempting to receive into these types will draw a decode error: 

```
struct { A int; B uint }	// change of signedness for B
struct { A int; B float }	// change of type for B
struct { }			// no field names in common
struct { C, D int }		// no field names in common

```
Integers are transmitted two ways: arbitrary precision signed integers or arbitrary precision unsigned integers. There is no int8, int16 etc. discrimination in the gob format; there are only signed and unsigned integers. As described below, the transmitter sends the value in a variable-length encoding; the receiver accepts the value and stores it in the destination variable. Floating-point numbers are always sent using IEEE-754 64-bit precision (see below). 

Signed integers may be received into any signed integer variable: int, int16, etc.; unsigned integers may be received into any unsigned integer variable; and floating point values may be received into any floating point variable. However, the destination variable must be able to represent the value or the decode operation will fail. 

Structs, arrays and slices are also supported. Structs encode and decode only exported fields. Strings and arrays of bytes are supported with a special, efficient representation (see below). When a slice is decoded, if the existing slice has capacity the slice will be extended in place; if not, a new array is allocated. Regardless, the length of the resulting slice reports the number of elements decoded. 

In general, if allocation is required, the decoder will allocate memory. If not, it will update the destination variables with values read from the stream. It does not initialize them first, so if the destination is a compound value such as a map, struct, or slice, the decoded values will be merged elementwise into the existing variables. 

Functions and channels will not be sent in a gob. Attempting to encode such a value at the top level will fail. A struct field of chan or func type is treated exactly like an unexported field and is ignored. 

Gob can encode a value of any type implementing the GobEncoder or encoding.BinaryMarshaler interfaces by calling the corresponding method, in that order of preference. 

Gob can decode a value of any type implementing the GobDecoder or encoding.BinaryUnmarshaler interfaces by calling the corresponding method, again in that order of preference. 

### hdr-Encoding_DetailsEncoding Details
This section documents the encoding, details that are not important for most users. Details are presented bottom-up. 

An unsigned integer is sent one of two ways. If it is less than 128, it is sent as a byte with that value. Otherwise it is sent as a minimal-length big-endian (high byte first) byte stream holding the value, preceded by one byte holding the byte count, negated. Thus 0 is transmitted as (00), 7 is transmitted as (07) and 256 is transmitted as (FE 01 00). 

A boolean is encoded within an unsigned integer: 0 for false, 1 for true. 

A signed integer, i, is encoded within an unsigned integer, u. Within u, bits 1 upward contain the value; bit 0 says whether they should be complemented upon receipt. The encode algorithm looks like this: 

```
var u uint
if i < 0 {
	u = (^uint(i) << 1) | 1 // complement i, bit 0 is 1
} else {
	u = (uint(i) << 1) // do not complement i, bit 0 is 0
}
encodeUnsigned(u)

```
The low bit is therefore analogous to a sign bit, but making it the complement bit instead guarantees that the largest negative integer is not a special case. For example, -129=^128=(^256>>1) encodes as (FE 01 01). 

Floating-point numbers are always sent as a representation of a float64 value. That value is converted to a uint64 using math.Float64bits. The uint64 is then byte-reversed and sent as a regular unsigned integer. The byte-reversal means the exponent and high-precision part of the mantissa go first. Since the low bits are often zero, this can save encoding bytes. For instance, 17.0 is encoded in only three bytes (FE 31 40). 

Strings and slices of bytes are sent as an unsigned count followed by that many uninterpreted bytes of the value. 

All other slices and arrays are sent as an unsigned count followed by that many elements using the standard gob encoding for their type, recursively. 

Maps are sent as an unsigned count followed by that many key, element pairs. Empty but non-nil maps are sent, so if the receiver has not allocated one already, one will always be allocated on receipt unless the transmitted map is nil and not at the top level. 

In slices and arrays, as well as maps, all elements, even zero-valued elements, are transmitted, even if all the elements are zero. 

Structs are sent as a sequence of (field number, field value) pairs. The field value is sent using the standard gob encoding for its type, recursively. If a field has the zero value for its type (except for arrays; see above), it is omitted from the transmission. The field number is defined by the type of the encoded struct: the first field of the encoded type is field 0, the second is field 1, etc. When encoding a value, the field numbers are delta encoded for efficiency and the fields are always sent in order of increasing field number; the deltas are therefore unsigned. The initialization for the delta encoding sets the field number to -1, so an unsigned integer field 0 with value 7 is transmitted as unsigned delta = 1, unsigned value = 7 or (01 07). Finally, after all the fields have been sent a terminating mark denotes the end of the struct. That mark is a delta=0 value, which has representation (00). 

Interface types are not checked for compatibility; all interface types are treated, for transmission, as members of a single "interface" type, analogous to int or []byte - in effect they're all treated as interface{}. Interface values are transmitted as a string identifying the concrete type being sent (a name that must be pre-defined by calling Register), followed by a byte count of the length of the following data (so the value can be skipped if it cannot be stored), followed by the usual encoding of concrete (dynamic) value stored in the interface value. (A nil interface value is identified by the empty string and transmits no value.) Upon receipt, the decoder verifies that the unpacked concrete item satisfies the interface of the receiving variable. 

If a value is passed to Encode and the type is not a struct (or pointer to struct, etc.), for simplicity of processing it is represented as a struct of one field. The only visible effect of this is to encode a zero byte after the value, just as after the last field of an encoded struct, so that the decode algorithm knows when the top-level value is complete. 

The representation of types is described below. When a type is defined on a given connection between an Encoder and Decoder, it is assigned a signed integer type id. When Encoder.Encode(v) is called, it makes sure there is an id assigned for the type of v and all its elements and then it sends the pair (typeid, encoded-v) where typeid is the type id of the encoded type of v and encoded-v is the gob encoding of the value v. 

To define a type, the encoder chooses an unused, positive type id and sends the pair (-type id, encoded-type) where encoded-type is the gob encoding of a wireType description, constructed from these types: 

```
type wireType struct {
	ArrayT           *ArrayType
	SliceT           *SliceType
	StructT          *StructType
	MapT             *MapType
	GobEncoderT      *gobEncoderType
	BinaryMarshalerT *gobEncoderType
	TextMarshalerT   *gobEncoderType

}
type arrayType struct {
	CommonType
	Elem typeId
	Len  int
}
type CommonType struct {
	Name string // the name of the struct type
	Id  int    // the id of the type, repeated so it's inside the type
}
type sliceType struct {
	CommonType
	Elem typeId
}
type structType struct {
	CommonType
	Field []*fieldType // the fields of the struct.
}
type fieldType struct {
	Name string // the name of the field.
	Id   int    // the type id of the field, which must be already defined
}
type mapType struct {
	CommonType
	Key  typeId
	Elem typeId
}
type gobEncoderType struct {
	CommonType
}

```
If there are nested type ids, the types for all inner type ids must be defined before the top-level type id is used to describe an encoded-v. 

For simplicity in setup, the connection is defined to understand these types a priori, as well as the basic gob types int, uint, etc. Their ids are: 

```
bool        1
int         2
uint        3
float       4
[]byte      5
string      6
complex     7
interface   8
// gap for reserved ids.
WireType    16
ArrayType   17
CommonType  18
SliceType   19
StructType  20
FieldType   21
// 22 is slice of fieldType.
MapType     23

```
Finally, each message created by a call to Encode is preceded by an encoded unsigned integer count of the number of bytes remaining in the message. After the initial type name, interface values are wrapped the same way; in effect, the interface value acts like a recursive invocation of Encode. 

In summary, a gob stream looks like 

```
(byteCount (-type id, encoding of a wireType)* (type id, encoding of a value))*

```
where * signifies zero or more repetitions and the type id of a value must be predefined or be defined before the value in the stream. 

Compatibility: Any future changes to the package will endeavor to maintain compatibility with streams encoded using previous versions. That is, any released version of this package should be able to decode data written with any previously released version, subject to issues such as security fixes. See the Go compatibility document for background: [https://golang.org/doc/go1compat](https://golang.org/doc/go1compat) 

See "Gobs of data" for a design discussion of the gob wire format: [https://blog.golang.org/gobs-of-data](https://blog.golang.org/gobs-of-data) 

## Index

* [Constants](#const)
    * [const tooBig](#tooBig)
    * [const uint64Size](#uint64Size)
    * [const singletonField](#singletonField)
    * [const maxLength](#maxLength)
    * [const xGob](#xGob)
    * [const xBinary](#xBinary)
    * [const xText](#xText)
    * [const firstUserId](#firstUserId)
* [Variables](#var)
    * [var decArrayHelper](#decArrayHelper)
    * [var decSliceHelper](#decSliceHelper)
    * [var errBadUint](#errBadUint)
    * [var errBadType](#errBadType)
    * [var errRange](#errRange)
    * [var noValue](#noValue)
    * [var decOpTable](#decOpTable)
    * [var decIgnoreOpMap](#decIgnoreOpMap)
    * [var emptyStructType](#emptyStructType)
    * [var errBadCount](#errBadCount)
    * [var debugFunc](#debugFunc)
    * [var encArrayHelper](#encArrayHelper)
    * [var encSliceHelper](#encSliceHelper)
    * [var encBufferPool](#encBufferPool)
    * [var encOpTable](#encOpTable)
    * [var spaceForLength](#spaceForLength)
    * [var userTypeCache](#userTypeCache)
    * [var gobEncoderInterfaceType](#gobEncoderInterfaceType)
    * [var gobDecoderInterfaceType](#gobDecoderInterfaceType)
    * [var binaryMarshalerInterfaceType](#binaryMarshalerInterfaceType)
    * [var binaryUnmarshalerInterfaceType](#binaryUnmarshalerInterfaceType)
    * [var textMarshalerInterfaceType](#textMarshalerInterfaceType)
    * [var textUnmarshalerInterfaceType](#textUnmarshalerInterfaceType)
    * [var nextId](#nextId)
    * [var typeLock](#typeLock)
    * [var types](#types)
    * [var idToType](#idToType)
    * [var builtinIdToType](#builtinIdToType)
    * [var tBool](#tBool)
    * [var tInt](#tInt)
    * [var tUint](#tUint)
    * [var tFloat](#tFloat)
    * [var tBytes](#tBytes)
    * [var tString](#tString)
    * [var tComplex](#tComplex)
    * [var tInterface](#tInterface)
    * [var tReserved7](#tReserved7)
    * [var tReserved6](#tReserved6)
    * [var tReserved5](#tReserved5)
    * [var tReserved4](#tReserved4)
    * [var tReserved3](#tReserved3)
    * [var tReserved2](#tReserved2)
    * [var tReserved1](#tReserved1)
    * [var tWireType](#tWireType)
    * [var wireTypeUserInfo](#wireTypeUserInfo)
    * [var typeInfoMap](#typeInfoMap)
    * [var nameToConcreteType](#nameToConcreteType)
    * [var concreteTypeToName](#concreteTypeToName)
    * [var doFuzzTests](#doFuzzTests)
    * [var encodeT](#encodeT)
    * [var boolResult](#boolResult)
    * [var signedResult](#signedResult)
    * [var unsignedResult](#unsignedResult)
    * [var floatResult](#floatResult)
    * [var complexResult](#complexResult)
    * [var bytesResult](#bytesResult)
    * [var singletons](#singletons)
    * [var unsupportedValues](#unsupportedValues)
    * [var testInt](#testInt)
    * [var testFloat32](#testFloat32)
    * [var testString](#testString)
    * [var testSlice](#testSlice)
    * [var testMap](#testMap)
    * [var testArray](#testArray)
    * [var singleTests](#singleTests)
    * [var ignoreTests](#ignoreTests)
    * [var badDataTests](#badDataTests)
    * [var basicTypes](#basicTypes)
* [Types](#type)
    * [type decHelper func(state *std/encoding/gob.decoderState, v reflect.Value, length int, ovfl error) bool](#decHelper)
    * [type decoderState struct](#decoderState)
        * [func newDecodeState(buf *decBuffer) *decoderState](#newDecodeState)
        * [func newDecodeStateFromData(data []byte) *decoderState](#newDecodeStateFromData)
        * [func (state *decoderState) decodeUint() (x uint64)](#decoderState.decodeUint)
        * [func (state *decoderState) decodeInt() int64](#decoderState.decodeInt)
        * [func (state *decoderState) getLength() (int, bool)](#decoderState.getLength)
    * [type decBuffer struct](#decBuffer)
        * [func newDecBuffer(data []byte) *decBuffer](#newDecBuffer)
        * [func (d *decBuffer) Read(p []byte) (int, error)](#decBuffer.Read)
        * [func (d *decBuffer) Drop(n int)](#decBuffer.Drop)
        * [func (d *decBuffer) Size(n int)](#decBuffer.Size)
        * [func (d *decBuffer) ReadByte() (byte, error)](#decBuffer.ReadByte)
        * [func (d *decBuffer) Len() int](#decBuffer.Len)
        * [func (d *decBuffer) Bytes() []byte](#decBuffer.Bytes)
        * [func (d *decBuffer) Reset()](#decBuffer.Reset)
    * [type decOp func(i *std/encoding/gob.decInstr, state *std/encoding/gob.decoderState, v reflect.Value)](#decOp)
    * [type decInstr struct](#decInstr)
    * [type decEngine struct](#decEngine)
    * [type emptyStruct struct{}](#emptyStruct)
    * [type Decoder struct](#Decoder)
        * [func NewDecoder(r io.Reader) *Decoder](#NewDecoder)
        * [func (dec *Decoder) newDecoderState(buf *decBuffer) *decoderState](#Decoder.newDecoderState)
        * [func (dec *Decoder) freeDecoderState(d *decoderState)](#Decoder.freeDecoderState)
        * [func (dec *Decoder) decodeSingle(engine *decEngine, value reflect.Value)](#Decoder.decodeSingle)
        * [func (dec *Decoder) decodeStruct(engine *decEngine, value reflect.Value)](#Decoder.decodeStruct)
        * [func (dec *Decoder) ignoreStruct(engine *decEngine)](#Decoder.ignoreStruct)
        * [func (dec *Decoder) ignoreSingle(engine *decEngine)](#Decoder.ignoreSingle)
        * [func (dec *Decoder) decodeArrayHelper(state *decoderState, value reflect.Value, elemOp decOp, length int, ovfl error, helper decHelper)](#Decoder.decodeArrayHelper)
        * [func (dec *Decoder) decodeArray(state *decoderState, value reflect.Value, elemOp decOp, length int, ovfl error, helper decHelper)](#Decoder.decodeArray)
        * [func (dec *Decoder) decodeMap(mtyp reflect.Type, state *decoderState, value reflect.Value, keyOp, elemOp decOp, ovfl error)](#Decoder.decodeMap)
        * [func (dec *Decoder) ignoreArrayHelper(state *decoderState, elemOp decOp, length int)](#Decoder.ignoreArrayHelper)
        * [func (dec *Decoder) ignoreArray(state *decoderState, elemOp decOp, length int)](#Decoder.ignoreArray)
        * [func (dec *Decoder) ignoreMap(state *decoderState, keyOp, elemOp decOp)](#Decoder.ignoreMap)
        * [func (dec *Decoder) decodeSlice(state *decoderState, value reflect.Value, elemOp decOp, ovfl error, helper decHelper)](#Decoder.decodeSlice)
        * [func (dec *Decoder) ignoreSlice(state *decoderState, elemOp decOp)](#Decoder.ignoreSlice)
        * [func (dec *Decoder) decodeInterface(ityp reflect.Type, state *decoderState, value reflect.Value)](#Decoder.decodeInterface)
        * [func (dec *Decoder) ignoreInterface(state *decoderState)](#Decoder.ignoreInterface)
        * [func (dec *Decoder) decodeGobDecoder(ut *userTypeInfo, state *decoderState, value reflect.Value)](#Decoder.decodeGobDecoder)
        * [func (dec *Decoder) ignoreGobDecoder(state *decoderState)](#Decoder.ignoreGobDecoder)
        * [func (dec *Decoder) decOpFor(wireId typeId, rt reflect.Type, name string, inProgress map[reflect.Type]*decOp) *decOp](#Decoder.decOpFor)
        * [func (dec *Decoder) decIgnoreOpFor(wireId typeId, inProgress map[typeId]*decOp) *decOp](#Decoder.decIgnoreOpFor)
        * [func (dec *Decoder) gobDecodeOpFor(ut *userTypeInfo) *decOp](#Decoder.gobDecodeOpFor)
        * [func (dec *Decoder) compatibleType(fr reflect.Type, fw typeId, inProgress map[reflect.Type]typeId) bool](#Decoder.compatibleType)
        * [func (dec *Decoder) typeString(remoteId typeId) string](#Decoder.typeString)
        * [func (dec *Decoder) compileSingle(remoteId typeId, ut *userTypeInfo) (engine *decEngine, err error)](#Decoder.compileSingle)
        * [func (dec *Decoder) compileIgnoreSingle(remoteId typeId) *decEngine](#Decoder.compileIgnoreSingle)
        * [func (dec *Decoder) compileDec(remoteId typeId, ut *userTypeInfo) (engine *decEngine, err error)](#Decoder.compileDec)
        * [func (dec *Decoder) getDecEnginePtr(remoteId typeId, ut *userTypeInfo) (enginePtr **decEngine, err error)](#Decoder.getDecEnginePtr)
        * [func (dec *Decoder) getIgnoreEnginePtr(wireId typeId) (enginePtr **decEngine, err error)](#Decoder.getIgnoreEnginePtr)
        * [func (dec *Decoder) decodeValue(wireId typeId, value reflect.Value)](#Decoder.decodeValue)
        * [func (dec *Decoder) decodeIgnoredValue(wireId typeId)](#Decoder.decodeIgnoredValue)
        * [func (dec *Decoder) recvType(id typeId)](#Decoder.recvType)
        * [func (dec *Decoder) recvMessage() bool](#Decoder.recvMessage)
        * [func (dec *Decoder) readMessage(nbytes int)](#Decoder.readMessage)
        * [func (dec *Decoder) nextInt() int64](#Decoder.nextInt)
        * [func (dec *Decoder) nextUint() uint64](#Decoder.nextUint)
        * [func (dec *Decoder) decodeTypeSequence(isInterface bool) typeId](#Decoder.decodeTypeSequence)
        * [func (dec *Decoder) Decode(e interface{}) error](#Decoder.Decode)
        * [func (dec *Decoder) DecodeValue(v reflect.Value) error](#Decoder.DecodeValue)
    * [type encHelper func(state *std/encoding/gob.encoderState, v reflect.Value) bool](#encHelper)
    * [type encoderState struct](#encoderState)
        * [func newEncoderState(b *encBuffer) *encoderState](#newEncoderState)
        * [func (state *encoderState) encodeUint(x uint64)](#encoderState.encodeUint)
        * [func (state *encoderState) encodeInt(i int64)](#encoderState.encodeInt)
        * [func (state *encoderState) update(instr *encInstr)](#encoderState.update)
    * [type encBuffer struct](#encBuffer)
        * [func (e *encBuffer) writeByte(c byte)](#encBuffer.writeByte)
        * [func (e *encBuffer) Write(p []byte) (int, error)](#encBuffer.Write)
        * [func (e *encBuffer) WriteString(s string)](#encBuffer.WriteString)
        * [func (e *encBuffer) Len() int](#encBuffer.Len)
        * [func (e *encBuffer) Bytes() []byte](#encBuffer.Bytes)
        * [func (e *encBuffer) Reset()](#encBuffer.Reset)
    * [type encOp func(i *std/encoding/gob.encInstr, state *std/encoding/gob.encoderState, v reflect.Value)](#encOp)
        * [func encOpFor(rt reflect.Type, inProgress map[reflect.Type]*encOp, building map[*typeInfo]bool) (*encOp, int)](#encOpFor)
        * [func gobEncodeOpFor(ut *userTypeInfo) (*encOp, int)](#gobEncodeOpFor)
    * [type encInstr struct](#encInstr)
    * [type encEngine struct](#encEngine)
        * [func compileEnc(ut *userTypeInfo, building map[*typeInfo]bool) *encEngine](#compileEnc)
        * [func getEncEngine(ut *userTypeInfo, building map[*typeInfo]bool) *encEngine](#getEncEngine)
        * [func buildEncEngine(info *typeInfo, ut *userTypeInfo, building map[*typeInfo]bool) *encEngine](#buildEncEngine)
    * [type Encoder struct](#Encoder)
        * [func NewEncoder(w io.Writer) *Encoder](#NewEncoder)
        * [func (enc *Encoder) newEncoderState(b *encBuffer) *encoderState](#Encoder.newEncoderState)
        * [func (enc *Encoder) freeEncoderState(e *encoderState)](#Encoder.freeEncoderState)
        * [func (enc *Encoder) encodeSingle(b *encBuffer, engine *encEngine, value reflect.Value)](#Encoder.encodeSingle)
        * [func (enc *Encoder) encodeStruct(b *encBuffer, engine *encEngine, value reflect.Value)](#Encoder.encodeStruct)
        * [func (enc *Encoder) encodeArray(b *encBuffer, value reflect.Value, op encOp, elemIndir int, length int, helper encHelper)](#Encoder.encodeArray)
        * [func (enc *Encoder) encodeMap(b *encBuffer, mv reflect.Value, keyOp, elemOp encOp, keyIndir, elemIndir int)](#Encoder.encodeMap)
        * [func (enc *Encoder) encodeInterface(b *encBuffer, iv reflect.Value)](#Encoder.encodeInterface)
        * [func (enc *Encoder) encodeGobEncoder(b *encBuffer, ut *userTypeInfo, v reflect.Value)](#Encoder.encodeGobEncoder)
        * [func (enc *Encoder) encode(b *encBuffer, value reflect.Value, ut *userTypeInfo)](#Encoder.encode)
        * [func (enc *Encoder) writer() io.Writer](#Encoder.writer)
        * [func (enc *Encoder) pushWriter(w io.Writer)](#Encoder.pushWriter)
        * [func (enc *Encoder) popWriter()](#Encoder.popWriter)
        * [func (enc *Encoder) setError(err error)](#Encoder.setError)
        * [func (enc *Encoder) writeMessage(w io.Writer, b *encBuffer)](#Encoder.writeMessage)
        * [func (enc *Encoder) sendActualType(w io.Writer, state *encoderState, ut *userTypeInfo, actual reflect.Type) (sent bool)](#Encoder.sendActualType)
        * [func (enc *Encoder) sendType(w io.Writer, state *encoderState, origt reflect.Type) (sent bool)](#Encoder.sendType)
        * [func (enc *Encoder) Encode(e interface{}) error](#Encoder.Encode)
        * [func (enc *Encoder) sendTypeDescriptor(w io.Writer, state *encoderState, ut *userTypeInfo)](#Encoder.sendTypeDescriptor)
        * [func (enc *Encoder) sendTypeId(state *encoderState, ut *userTypeInfo)](#Encoder.sendTypeId)
        * [func (enc *Encoder) EncodeValue(value reflect.Value) error](#Encoder.EncodeValue)
    * [type gobError struct](#gobError)
    * [type userTypeInfo struct](#userTypeInfo)
        * [func validUserType(rt reflect.Type) (*userTypeInfo, error)](#validUserType)
        * [func userType(rt reflect.Type) *userTypeInfo](#userType)
    * [type typeId int32](#typeId)
        * [func bootstrapType(name string, e interface{}, expect typeId) typeId](#bootstrapType)
        * [func (t typeId) gobType() gobType](#typeId.gobType)
        * [func (t typeId) string() string](#typeId.string)
        * [func (t typeId) name() string](#typeId.name)
    * [type gobType interface](#gobType)
        * [func newTypeObject(name string, ut *userTypeInfo, rt reflect.Type) (gobType, error)](#newTypeObject)
        * [func getBaseType(name string, rt reflect.Type) (gobType, error)](#getBaseType)
        * [func getType(name string, ut *userTypeInfo, rt reflect.Type) (gobType, error)](#getType)
        * [func getTypeUnlocked(name string, rt reflect.Type) gobType](#getTypeUnlocked)
    * [type CommonType struct](#CommonType)
        * [func (t *CommonType) id() typeId](#CommonType.id)
        * [func (t *CommonType) setId(id typeId)](#CommonType.setId)
        * [func (t *CommonType) string() string](#CommonType.string)
        * [func (t *CommonType) safeString(seen map[typeId]bool) string](#CommonType.safeString)
        * [func (t *CommonType) name() string](#CommonType.name)
    * [type arrayType struct](#arrayType)
        * [func newArrayType(name string) *arrayType](#newArrayType)
        * [func (a *arrayType) init(elem gobType, len int)](#arrayType.init.type.go.0xc0579022e8)
        * [func (a *arrayType) safeString(seen map[typeId]bool) string](#arrayType.safeString)
        * [func (a *arrayType) string() string](#arrayType.string)
    * [type gobEncoderType struct](#gobEncoderType)
        * [func newGobEncoderType(name string) *gobEncoderType](#newGobEncoderType)
        * [func (g *gobEncoderType) safeString(seen map[typeId]bool) string](#gobEncoderType.safeString)
        * [func (g *gobEncoderType) string() string](#gobEncoderType.string)
    * [type mapType struct](#mapType)
        * [func newMapType(name string) *mapType](#newMapType)
        * [func (m *mapType) init(key, elem gobType)](#mapType.init.type.go.0xc0579022e8)
        * [func (m *mapType) safeString(seen map[typeId]bool) string](#mapType.safeString)
        * [func (m *mapType) string() string](#mapType.string)
    * [type sliceType struct](#sliceType)
        * [func newSliceType(name string) *sliceType](#newSliceType)
        * [func (s *sliceType) init(elem gobType)](#sliceType.init.type.go.0xc0579022e8)
        * [func (s *sliceType) safeString(seen map[typeId]bool) string](#sliceType.safeString)
        * [func (s *sliceType) string() string](#sliceType.string)
    * [type fieldType struct](#fieldType)
    * [type structType struct](#structType)
        * [func newStructType(name string) *structType](#newStructType)
        * [func (s *structType) safeString(seen map[typeId]bool) string](#structType.safeString)
        * [func (s *structType) string() string](#structType.string)
    * [type wireType struct](#wireType)
        * [func (w *wireType) string() string](#wireType.string)
    * [type typeInfo struct](#typeInfo)
        * [func lookupTypeInfo(rt reflect.Type) *typeInfo](#lookupTypeInfo)
        * [func getTypeInfo(ut *userTypeInfo) (*typeInfo, error)](#getTypeInfo)
        * [func buildTypeInfo(ut *userTypeInfo, rt reflect.Type) (*typeInfo, error)](#buildTypeInfo)
        * [func mustGetTypeInfo(rt reflect.Type) *typeInfo](#mustGetTypeInfo)
    * [type GobEncoder interface](#GobEncoder)
    * [type GobDecoder interface](#GobDecoder)
    * [type EncodeT struct](#EncodeT)
    * [type T0 struct](#T0)
    * [type T1 struct](#T1)
    * [type T2 struct](#T2)
    * [type RT0 struct](#RT0)
    * [type RT1 struct](#RT1)
    * [type IT0 struct](#IT0)
    * [type Indirect struct](#Indirect)
    * [type Direct struct](#Direct)
    * [type Squarer interface](#Squarer)
    * [type Int int](#Int)
        * [func (i Int) Square() int](#Int.Square)
    * [type Float float64](#Float)
        * [func (f Float) Square() int](#Float.Square)
    * [type Vector []int](#Vector)
        * [func (v Vector) Square() int](#Vector.Square)
    * [type Point struct](#Point)
        * [func (p Point) Square() int](#Point.Square)
    * [type InterfaceItem struct](#InterfaceItem)
    * [type NoInterfaceItem struct](#NoInterfaceItem)
    * [type BasicInterfaceItem struct](#BasicInterfaceItem)
    * [type String string](#String)
    * [type PtrInterfaceItem struct](#PtrInterfaceItem)
    * [type U struct](#U)
    * [type OnTheFly struct](#OnTheFly)
    * [type DT struct](#DT)
        * [func newDT() DT](#newDT)
    * [type ET0 struct](#ET0)
    * [type ET2 struct](#ET2)
    * [type ET1 struct](#ET1)
    * [type ET3 struct](#ET3)
    * [type ET4 struct](#ET4)
    * [type SingleTest struct](#SingleTest)
    * [type interfaceIndirectTestI interface](#interfaceIndirectTestI)
    * [type interfaceIndirectTestT struct{}](#interfaceIndirectTestT)
        * [func (this *interfaceIndirectTestT) F() bool](#interfaceIndirectTestT.F)
    * [type Struct0 struct](#Struct0)
    * [type NewType0 struct](#NewType0)
    * [type ignoreTest struct](#ignoreTest)
    * [type Bug0Outer struct](#Bug0Outer)
    * [type Bug0Inner struct](#Bug0Inner)
    * [type Bug1Elem struct](#Bug1Elem)
    * [type Bug1StructMap map[string]gob.Bug1Elem](#Bug1StructMap)
    * [type Bug2 struct](#Bug2)
    * [type Bug3 struct](#Bug3)
    * [type Bug4Public struct](#Bug4Public)
    * [type Bug4Secret struct](#Bug4Secret)
    * [type Z struct{}](#Z)
    * [type badDataTest struct](#badDataTest)
    * [type ByteStruct struct](#ByteStruct)
        * [func (g *ByteStruct) GobEncode() ([]byte, error)](#ByteStruct.GobEncode)
        * [func (g *ByteStruct) GobDecode(data []byte) error](#ByteStruct.GobDecode)
    * [type StringStruct struct](#StringStruct)
        * [func (g *StringStruct) GobEncode() ([]byte, error)](#StringStruct.GobEncode)
        * [func (g *StringStruct) GobDecode(data []byte) error](#StringStruct.GobDecode)
    * [type ArrayStruct struct](#ArrayStruct)
        * [func (a *ArrayStruct) GobEncode() ([]byte, error)](#ArrayStruct.GobEncode)
        * [func (a *ArrayStruct) GobDecode(data []byte) error](#ArrayStruct.GobDecode)
    * [type Gobber int](#Gobber)
        * [func (g *Gobber) GobEncode() ([]byte, error)](#Gobber.GobEncode)
        * [func (g *Gobber) GobDecode(data []byte) error](#Gobber.GobDecode)
    * [type ValueGobber string](#ValueGobber)
        * [func (v ValueGobber) GobEncode() ([]byte, error)](#ValueGobber.GobEncode)
        * [func (v *ValueGobber) GobDecode(data []byte) error](#ValueGobber.GobDecode)
    * [type BinaryGobber int](#BinaryGobber)
        * [func (g *BinaryGobber) MarshalBinary() ([]byte, error)](#BinaryGobber.MarshalBinary)
        * [func (g *BinaryGobber) UnmarshalBinary(data []byte) error](#BinaryGobber.UnmarshalBinary)
    * [type BinaryValueGobber string](#BinaryValueGobber)
        * [func (v BinaryValueGobber) MarshalBinary() ([]byte, error)](#BinaryValueGobber.MarshalBinary)
        * [func (v *BinaryValueGobber) UnmarshalBinary(data []byte) error](#BinaryValueGobber.UnmarshalBinary)
    * [type TextGobber int](#TextGobber)
        * [func (g *TextGobber) MarshalText() ([]byte, error)](#TextGobber.MarshalText)
        * [func (g *TextGobber) UnmarshalText(data []byte) error](#TextGobber.UnmarshalText)
    * [type TextValueGobber string](#TextValueGobber)
        * [func (v TextValueGobber) MarshalText() ([]byte, error)](#TextValueGobber.MarshalText)
        * [func (v *TextValueGobber) UnmarshalText(data []byte) error](#TextValueGobber.UnmarshalText)
    * [type GobTest0 struct](#GobTest0)
    * [type GobTest1 struct](#GobTest1)
    * [type GobTest2 struct](#GobTest2)
    * [type GobTest3 struct](#GobTest3)
    * [type GobTest4 struct](#GobTest4)
    * [type GobTest5 struct](#GobTest5)
    * [type GobTest6 struct](#GobTest6)
    * [type GobTest7 struct](#GobTest7)
    * [type GobTestIgnoreEncoder struct](#GobTestIgnoreEncoder)
    * [type GobTestValueEncDec struct](#GobTestValueEncDec)
    * [type GobTestIndirectEncDec struct](#GobTestIndirectEncDec)
    * [type GobTestArrayEncDec struct](#GobTestArrayEncDec)
    * [type GobTestIndirectArrayEncDec struct](#GobTestIndirectArrayEncDec)
    * [type gobDecoderBug0 struct](#gobDecoderBug0)
        * [func (br *gobDecoderBug0) String() string](#gobDecoderBug0.String)
        * [func (br *gobDecoderBug0) GobEncode() ([]byte, error)](#gobDecoderBug0.GobEncode)
        * [func (br *gobDecoderBug0) GobDecode(b []byte) error](#gobDecoderBug0.GobDecode)
    * [type isZeroBug struct](#isZeroBug)
    * [type isZeroBugArray [2]uint8](#isZeroBugArray)
        * [func (a isZeroBugArray) GobEncode() (b []byte, e error)](#isZeroBugArray.GobEncode)
        * [func (a *isZeroBugArray) GobDecode(data []byte) error](#isZeroBugArray.GobDecode)
    * [type isZeroBugInterface struct](#isZeroBugInterface)
        * [func (i isZeroBugInterface) GobEncode() (b []byte, e error)](#isZeroBugInterface.GobEncode)
        * [func (i *isZeroBugInterface) GobDecode(data []byte) error](#isZeroBugInterface.GobDecode)
    * [type Bench struct](#Bench)
    * [type benchmarkBuf struct](#benchmarkBuf)
        * [func (b *benchmarkBuf) Read(p []byte) (n int, err error)](#benchmarkBuf.Read)
        * [func (b *benchmarkBuf) ReadByte() (c byte, err error)](#benchmarkBuf.ReadByte)
        * [func (b *benchmarkBuf) reset()](#benchmarkBuf.reset)
    * [type typeT struct](#typeT)
    * [type Bar struct](#Bar)
    * [type Foo struct](#Foo)
    * [type N1 struct{}](#N1)
    * [type N2 struct{}](#N2)
* [Functions](#func)
    * [func decBoolArray(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decBoolArray)
    * [func decBoolSlice(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decBoolSlice)
    * [func decComplex64Array(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decComplex64Array)
    * [func decComplex64Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decComplex64Slice)
    * [func decComplex128Array(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decComplex128Array)
    * [func decComplex128Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decComplex128Slice)
    * [func decFloat32Array(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decFloat32Array)
    * [func decFloat32Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decFloat32Slice)
    * [func decFloat64Array(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decFloat64Array)
    * [func decFloat64Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decFloat64Slice)
    * [func decIntArray(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decIntArray)
    * [func decIntSlice(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decIntSlice)
    * [func decInt16Array(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decInt16Array)
    * [func decInt16Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decInt16Slice)
    * [func decInt32Array(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decInt32Array)
    * [func decInt32Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decInt32Slice)
    * [func decInt64Array(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decInt64Array)
    * [func decInt64Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decInt64Slice)
    * [func decInt8Array(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decInt8Array)
    * [func decInt8Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decInt8Slice)
    * [func decStringArray(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decStringArray)
    * [func decStringSlice(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decStringSlice)
    * [func decUintArray(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decUintArray)
    * [func decUintSlice(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decUintSlice)
    * [func decUint16Array(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decUint16Array)
    * [func decUint16Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decUint16Slice)
    * [func decUint32Array(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decUint32Array)
    * [func decUint32Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decUint32Slice)
    * [func decUint64Array(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decUint64Array)
    * [func decUint64Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decUint64Slice)
    * [func decUintptrArray(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decUintptrArray)
    * [func decUintptrSlice(state *decoderState, v reflect.Value, length int, ovfl error) bool](#decUintptrSlice)
    * [func overflow(name string) error](#overflow)
    * [func decodeUintReader(r io.Reader, buf []byte) (x uint64, width int, err error)](#decodeUintReader)
    * [func ignoreUint(i *decInstr, state *decoderState, v reflect.Value)](#ignoreUint)
    * [func ignoreTwoUints(i *decInstr, state *decoderState, v reflect.Value)](#ignoreTwoUints)
    * [func decAlloc(v reflect.Value) reflect.Value](#decAlloc)
    * [func decBool(i *decInstr, state *decoderState, value reflect.Value)](#decBool)
    * [func decInt8(i *decInstr, state *decoderState, value reflect.Value)](#decInt8)
    * [func decUint8(i *decInstr, state *decoderState, value reflect.Value)](#decUint8)
    * [func decInt16(i *decInstr, state *decoderState, value reflect.Value)](#decInt16)
    * [func decUint16(i *decInstr, state *decoderState, value reflect.Value)](#decUint16)
    * [func decInt32(i *decInstr, state *decoderState, value reflect.Value)](#decInt32)
    * [func decUint32(i *decInstr, state *decoderState, value reflect.Value)](#decUint32)
    * [func decInt64(i *decInstr, state *decoderState, value reflect.Value)](#decInt64)
    * [func decUint64(i *decInstr, state *decoderState, value reflect.Value)](#decUint64)
    * [func float64FromBits(u uint64) float64](#float64FromBits)
    * [func float32FromBits(u uint64, ovfl error) float64](#float32FromBits)
    * [func decFloat32(i *decInstr, state *decoderState, value reflect.Value)](#decFloat32)
    * [func decFloat64(i *decInstr, state *decoderState, value reflect.Value)](#decFloat64)
    * [func decComplex64(i *decInstr, state *decoderState, value reflect.Value)](#decComplex64)
    * [func decComplex128(i *decInstr, state *decoderState, value reflect.Value)](#decComplex128)
    * [func decUint8Slice(i *decInstr, state *decoderState, value reflect.Value)](#decUint8Slice)
    * [func decString(i *decInstr, state *decoderState, value reflect.Value)](#decString)
    * [func ignoreUint8Array(i *decInstr, state *decoderState, value reflect.Value)](#ignoreUint8Array)
    * [func decodeIntoValue(state *decoderState, op decOp, isPtr bool, value reflect.Value, instr *decInstr) reflect.Value](#decodeIntoValue)
    * [func init()](#init.decode.go)
    * [func allocValue(t reflect.Type) reflect.Value](#allocValue)
    * [func toInt(x uint64) int64](#toInt)
    * [func encBoolArray(state *encoderState, v reflect.Value) bool](#encBoolArray)
    * [func encBoolSlice(state *encoderState, v reflect.Value) bool](#encBoolSlice)
    * [func encComplex64Array(state *encoderState, v reflect.Value) bool](#encComplex64Array)
    * [func encComplex64Slice(state *encoderState, v reflect.Value) bool](#encComplex64Slice)
    * [func encComplex128Array(state *encoderState, v reflect.Value) bool](#encComplex128Array)
    * [func encComplex128Slice(state *encoderState, v reflect.Value) bool](#encComplex128Slice)
    * [func encFloat32Array(state *encoderState, v reflect.Value) bool](#encFloat32Array)
    * [func encFloat32Slice(state *encoderState, v reflect.Value) bool](#encFloat32Slice)
    * [func encFloat64Array(state *encoderState, v reflect.Value) bool](#encFloat64Array)
    * [func encFloat64Slice(state *encoderState, v reflect.Value) bool](#encFloat64Slice)
    * [func encIntArray(state *encoderState, v reflect.Value) bool](#encIntArray)
    * [func encIntSlice(state *encoderState, v reflect.Value) bool](#encIntSlice)
    * [func encInt16Array(state *encoderState, v reflect.Value) bool](#encInt16Array)
    * [func encInt16Slice(state *encoderState, v reflect.Value) bool](#encInt16Slice)
    * [func encInt32Array(state *encoderState, v reflect.Value) bool](#encInt32Array)
    * [func encInt32Slice(state *encoderState, v reflect.Value) bool](#encInt32Slice)
    * [func encInt64Array(state *encoderState, v reflect.Value) bool](#encInt64Array)
    * [func encInt64Slice(state *encoderState, v reflect.Value) bool](#encInt64Slice)
    * [func encInt8Array(state *encoderState, v reflect.Value) bool](#encInt8Array)
    * [func encInt8Slice(state *encoderState, v reflect.Value) bool](#encInt8Slice)
    * [func encStringArray(state *encoderState, v reflect.Value) bool](#encStringArray)
    * [func encStringSlice(state *encoderState, v reflect.Value) bool](#encStringSlice)
    * [func encUintArray(state *encoderState, v reflect.Value) bool](#encUintArray)
    * [func encUintSlice(state *encoderState, v reflect.Value) bool](#encUintSlice)
    * [func encUint16Array(state *encoderState, v reflect.Value) bool](#encUint16Array)
    * [func encUint16Slice(state *encoderState, v reflect.Value) bool](#encUint16Slice)
    * [func encUint32Array(state *encoderState, v reflect.Value) bool](#encUint32Array)
    * [func encUint32Slice(state *encoderState, v reflect.Value) bool](#encUint32Slice)
    * [func encUint64Array(state *encoderState, v reflect.Value) bool](#encUint64Array)
    * [func encUint64Slice(state *encoderState, v reflect.Value) bool](#encUint64Slice)
    * [func encUintptrArray(state *encoderState, v reflect.Value) bool](#encUintptrArray)
    * [func encUintptrSlice(state *encoderState, v reflect.Value) bool](#encUintptrSlice)
    * [func encIndirect(pv reflect.Value, indir int) reflect.Value](#encIndirect)
    * [func encBool(i *encInstr, state *encoderState, v reflect.Value)](#encBool)
    * [func encInt(i *encInstr, state *encoderState, v reflect.Value)](#encInt)
    * [func encUint(i *encInstr, state *encoderState, v reflect.Value)](#encUint)
    * [func floatBits(f float64) uint64](#floatBits)
    * [func encFloat(i *encInstr, state *encoderState, v reflect.Value)](#encFloat)
    * [func encComplex(i *encInstr, state *encoderState, v reflect.Value)](#encComplex)
    * [func encUint8Array(i *encInstr, state *encoderState, v reflect.Value)](#encUint8Array)
    * [func encString(i *encInstr, state *encoderState, v reflect.Value)](#encString)
    * [func encStructTerminator(i *encInstr, state *encoderState, v reflect.Value)](#encStructTerminator)
    * [func valid(v reflect.Value) bool](#valid)
    * [func encodeReflectValue(state *encoderState, v reflect.Value, op encOp, indir int)](#encodeReflectValue)
    * [func isZero(val reflect.Value) bool](#isZero)
    * [func errorf(format string, args ...interface{})](#errorf)
    * [func error_(err error)](#error_)
    * [func catchError(err *error)](#catchError)
    * [func implementsInterface(typ, gobEncDecType reflect.Type) (success bool, indir int8)](#implementsInterface)
    * [func setTypeId(typ gobType)](#setTypeId)
    * [func init()](#init.type.go)
    * [func isExported(name string) bool](#isExported)
    * [func isSent(field *reflect.StructField) bool](#isSent)
    * [func checkId(want, got typeId)](#checkId)
    * [func RegisterName(name string, value interface{})](#RegisterName)
    * [func Register(value interface{})](#Register)
    * [func registerBasics()](#registerBasics)
    * [func testError(t *testing.T)](#testError)
    * [func TestUintCodec(t *testing.T)](#TestUintCodec)
    * [func verifyInt(i int64, t *testing.T)](#verifyInt)
    * [func TestIntCodec(t *testing.T)](#TestIntCodec)
    * [func TestScalarEncInstructions(t *testing.T)](#TestScalarEncInstructions)
    * [func execDec(instr *decInstr, state *decoderState, t *testing.T, value reflect.Value)](#execDec)
    * [func TestScalarDecInstructions(t *testing.T)](#TestScalarDecInstructions)
    * [func TestEndToEnd(t *testing.T)](#TestEndToEnd)
    * [func TestOverflow(t *testing.T)](#TestOverflow)
    * [func TestNesting(t *testing.T)](#TestNesting)
    * [func TestAutoIndirection(t *testing.T)](#TestAutoIndirection)
    * [func TestReorderedFields(t *testing.T)](#TestReorderedFields)
    * [func TestIgnoredFields(t *testing.T)](#TestIgnoredFields)
    * [func TestBadRecursiveType(t *testing.T)](#TestBadRecursiveType)
    * [func TestIndirectSliceMapArray(t *testing.T)](#TestIndirectSliceMapArray)
    * [func TestInterface(t *testing.T)](#TestInterface)
    * [func TestInterfaceBasic(t *testing.T)](#TestInterfaceBasic)
    * [func TestInterfacePointer(t *testing.T)](#TestInterfacePointer)
    * [func TestIgnoreInterface(t *testing.T)](#TestIgnoreInterface)
    * [func TestUnexportedFields(t *testing.T)](#TestUnexportedFields)
    * [func TestDebugSingleton(t *testing.T)](#TestDebugSingleton)
    * [func TestDebugStruct(t *testing.T)](#TestDebugStruct)
    * [func encFuzzDec(rng *rand.Rand, in interface{}) error](#encFuzzDec)
    * [func TestFuzz(t *testing.T)](#TestFuzz)
    * [func TestFuzzRegressions(t *testing.T)](#TestFuzzRegressions)
    * [func testFuzz(t *testing.T, seed int64, n int, input ...interface{})](#testFuzz)
    * [func TestFuzzOneByte(t *testing.T)](#TestFuzzOneByte)
    * [func TestErrorInvalidTypeId(t *testing.T)](#TestErrorInvalidTypeId)
    * [func TestBasicEncoderDecoder(t *testing.T)](#TestBasicEncoderDecoder)
    * [func TestEncodeIntSlice(t *testing.T)](#TestEncodeIntSlice)
    * [func TestEncoderDecoder(t *testing.T)](#TestEncoderDecoder)
    * [func badTypeCheck(e interface{}, shouldFail bool, msg string, t *testing.T)](#badTypeCheck)
    * [func TestWrongTypeDecoder(t *testing.T)](#TestWrongTypeDecoder)
    * [func TestUnsupported(t *testing.T)](#TestUnsupported)
    * [func encAndDec(in, out interface{}) error](#encAndDec)
    * [func TestTypeToPtrType(t *testing.T)](#TestTypeToPtrType)
    * [func TestPtrTypeToType(t *testing.T)](#TestPtrTypeToType)
    * [func TestTypeToPtrPtrPtrPtrType(t *testing.T)](#TestTypeToPtrPtrPtrPtrType)
    * [func TestSlice(t *testing.T)](#TestSlice)
    * [func TestValueError(t *testing.T)](#TestValueError)
    * [func TestArray(t *testing.T)](#TestArray)
    * [func TestRecursiveMapType(t *testing.T)](#TestRecursiveMapType)
    * [func TestRecursiveSliceType(t *testing.T)](#TestRecursiveSliceType)
    * [func TestDefaultsInArray(t *testing.T)](#TestDefaultsInArray)
    * [func TestSingletons(t *testing.T)](#TestSingletons)
    * [func TestStructNonStruct(t *testing.T)](#TestStructNonStruct)
    * [func TestInterfaceIndirect(t *testing.T)](#TestInterfaceIndirect)
    * [func TestDecodeIntoNothing(t *testing.T)](#TestDecodeIntoNothing)
    * [func TestIgnoreRecursiveType(t *testing.T)](#TestIgnoreRecursiveType)
    * [func TestNestedInterfaces(t *testing.T)](#TestNestedInterfaces)
    * [func TestMapBug1(t *testing.T)](#TestMapBug1)
    * [func TestGobMapInterfaceEncode(t *testing.T)](#TestGobMapInterfaceEncode)
    * [func TestSliceReusesMemory(t *testing.T)](#TestSliceReusesMemory)
    * [func TestBadCount(t *testing.T)](#TestBadCount)
    * [func TestSequentialDecoder(t *testing.T)](#TestSequentialDecoder)
    * [func TestChanFuncIgnored(t *testing.T)](#TestChanFuncIgnored)
    * [func TestSliceIncompatibility(t *testing.T)](#TestSliceIncompatibility)
    * [func TestGobPtrSlices(t *testing.T)](#TestGobPtrSlices)
    * [func TestPtrToMapOfMap(t *testing.T)](#TestPtrToMapOfMap)
    * [func TestCatchInvalidNilValue(t *testing.T)](#TestCatchInvalidNilValue)
    * [func TestTopLevelNilPointer(t *testing.T)](#TestTopLevelNilPointer)
    * [func encodeAndRecover(value interface{}) (encodeErr, panicErr error)](#encodeAndRecover)
    * [func TestNilPointerPanics(t *testing.T)](#TestNilPointerPanics)
    * [func TestNilPointerInsideInterface(t *testing.T)](#TestNilPointerInsideInterface)
    * [func TestMutipleEncodingsOfBadType(t *testing.T)](#TestMutipleEncodingsOfBadType)
    * [func Test29ElementSlice(t *testing.T)](#Test29ElementSlice)
    * [func TestErrorForHugeSlice(t *testing.T)](#TestErrorForHugeSlice)
    * [func TestBadData(t *testing.T)](#TestBadData)
    * [func TestDecodeErrorMultipleTypes(t *testing.T)](#TestDecodeErrorMultipleTypes)
    * [func TestGobEncoderField(t *testing.T)](#TestGobEncoderField)
    * [func TestGobEncoderValueField(t *testing.T)](#TestGobEncoderValueField)
    * [func TestGobEncoderIndirectField(t *testing.T)](#TestGobEncoderIndirectField)
    * [func TestGobEncoderArrayField(t *testing.T)](#TestGobEncoderArrayField)
    * [func TestGobEncoderIndirectArrayField(t *testing.T)](#TestGobEncoderIndirectArrayField)
    * [func TestGobEncoderFieldsOfDifferentType(t *testing.T)](#TestGobEncoderFieldsOfDifferentType)
    * [func TestGobEncoderValueEncoder(t *testing.T)](#TestGobEncoderValueEncoder)
    * [func TestGobEncoderValueThenPointer(t *testing.T)](#TestGobEncoderValueThenPointer)
    * [func TestGobEncoderPointerThenValue(t *testing.T)](#TestGobEncoderPointerThenValue)
    * [func TestGobEncoderFieldTypeError(t *testing.T)](#TestGobEncoderFieldTypeError)
    * [func TestGobEncoderStructSingleton(t *testing.T)](#TestGobEncoderStructSingleton)
    * [func TestGobEncoderNonStructSingleton(t *testing.T)](#TestGobEncoderNonStructSingleton)
    * [func TestGobEncoderIgnoreStructField(t *testing.T)](#TestGobEncoderIgnoreStructField)
    * [func TestGobEncoderIgnoreNonStructField(t *testing.T)](#TestGobEncoderIgnoreNonStructField)
    * [func TestGobEncoderIgnoreNilEncoder(t *testing.T)](#TestGobEncoderIgnoreNilEncoder)
    * [func TestGobEncoderExtraIndirect(t *testing.T)](#TestGobEncoderExtraIndirect)
    * [func TestGobEncodeIsZero(t *testing.T)](#TestGobEncodeIsZero)
    * [func TestGobEncodePtrError(t *testing.T)](#TestGobEncodePtrError)
    * [func TestNetIP(t *testing.T)](#TestNetIP)
    * [func benchmarkEndToEnd(b *testing.B, ctor func() interface{}, pipe func() (r io.Reader, w io.Writer, err error))](#benchmarkEndToEnd)
    * [func BenchmarkEndToEndPipe(b *testing.B)](#BenchmarkEndToEndPipe)
    * [func BenchmarkEndToEndByteBuffer(b *testing.B)](#BenchmarkEndToEndByteBuffer)
    * [func BenchmarkEndToEndSliceByteBuffer(b *testing.B)](#BenchmarkEndToEndSliceByteBuffer)
    * [func TestCountEncodeMallocs(t *testing.T)](#TestCountEncodeMallocs)
    * [func TestCountDecodeMallocs(t *testing.T)](#TestCountDecodeMallocs)
    * [func benchmarkEncodeSlice(b *testing.B, a interface{})](#benchmarkEncodeSlice)
    * [func BenchmarkEncodeComplex128Slice(b *testing.B)](#BenchmarkEncodeComplex128Slice)
    * [func BenchmarkEncodeFloat64Slice(b *testing.B)](#BenchmarkEncodeFloat64Slice)
    * [func BenchmarkEncodeInt32Slice(b *testing.B)](#BenchmarkEncodeInt32Slice)
    * [func BenchmarkEncodeStringSlice(b *testing.B)](#BenchmarkEncodeStringSlice)
    * [func BenchmarkEncodeInterfaceSlice(b *testing.B)](#BenchmarkEncodeInterfaceSlice)
    * [func benchmarkDecodeSlice(b *testing.B, a interface{})](#benchmarkDecodeSlice)
    * [func BenchmarkDecodeComplex128Slice(b *testing.B)](#BenchmarkDecodeComplex128Slice)
    * [func BenchmarkDecodeFloat64Slice(b *testing.B)](#BenchmarkDecodeFloat64Slice)
    * [func BenchmarkDecodeInt32Slice(b *testing.B)](#BenchmarkDecodeInt32Slice)
    * [func BenchmarkDecodeStringSlice(b *testing.B)](#BenchmarkDecodeStringSlice)
    * [func BenchmarkDecodeInterfaceSlice(b *testing.B)](#BenchmarkDecodeInterfaceSlice)
    * [func BenchmarkDecodeMap(b *testing.B)](#BenchmarkDecodeMap)
    * [func TestBasic(t *testing.T)](#TestBasic)
    * [func TestReregistration(t *testing.T)](#TestReregistration)
    * [func TestArrayType(t *testing.T)](#TestArrayType)
    * [func TestSliceType(t *testing.T)](#TestSliceType)
    * [func TestMapType(t *testing.T)](#TestMapType)
    * [func TestStructType(t *testing.T)](#TestStructType)
    * [func TestRegistration(t *testing.T)](#TestRegistration)
    * [func TestRegistrationNaming(t *testing.T)](#TestRegistrationNaming)
    * [func TestStressParallel(t *testing.T)](#TestStressParallel)
    * [func TestTypeRace(t *testing.T)](#TestTypeRace)


## <a id="const" href="#const">Constants</a>

### <a id="tooBig" href="#tooBig">const tooBig</a>

```
searchKey: gob.tooBig
tags: [private]
```

```Go
const tooBig = (1 << 30) << (^uint(0) >> 62)
```

tooBig provides a sanity check for sizes; used in several places. Upper limit of is 1GB on 32-bit systems, 8GB on 64-bit, allowing room to grow a little without overflow. 

### <a id="uint64Size" href="#uint64Size">const uint64Size</a>

```
searchKey: gob.uint64Size
tags: [private]
```

```Go
const uint64Size = 8
```

### <a id="singletonField" href="#singletonField">const singletonField</a>

```
searchKey: gob.singletonField
tags: [private]
```

```Go
const singletonField = 0
```

### <a id="maxLength" href="#maxLength">const maxLength</a>

```
searchKey: gob.maxLength
tags: [private]
```

```Go
const maxLength = 9 // Maximum size of an encoded length.

```

Before we encode a message, we reserve space at the head of the buffer in which to encode its length. This means we can use the buffer to assemble the message without another allocation. 

### <a id="xGob" href="#xGob">const xGob</a>

```
searchKey: gob.xGob
tags: [private]
```

```Go
const xGob = 1 + iota // GobEncoder or GobDecoder

```

externalEncoding bits 

### <a id="xBinary" href="#xBinary">const xBinary</a>

```
searchKey: gob.xBinary
tags: [private]
```

```Go
const xBinary // encoding.BinaryMarshaler or encoding.BinaryUnmarshaler

```

externalEncoding bits 

### <a id="xText" href="#xText">const xText</a>

```
searchKey: gob.xText
tags: [private]
```

```Go
const xText // encoding.TextMarshaler or encoding.TextUnmarshaler

```

externalEncoding bits 

### <a id="firstUserId" href="#firstUserId">const firstUserId</a>

```
searchKey: gob.firstUserId
tags: [private]
```

```Go
const firstUserId = 64 // lowest id number granted to user

```

## <a id="var" href="#var">Variables</a>

### <a id="decArrayHelper" href="#decArrayHelper">var decArrayHelper</a>

```
searchKey: gob.decArrayHelper
tags: [private]
```

```Go
var decArrayHelper = ...
```

### <a id="decSliceHelper" href="#decSliceHelper">var decSliceHelper</a>

```
searchKey: gob.decSliceHelper
tags: [private]
```

```Go
var decSliceHelper = ...
```

### <a id="errBadUint" href="#errBadUint">var errBadUint</a>

```
searchKey: gob.errBadUint
tags: [private]
```

```Go
var errBadUint = errors.New("gob: encoded unsigned integer out of range")
```

### <a id="errBadType" href="#errBadType">var errBadType</a>

```
searchKey: gob.errBadType
tags: [private]
```

```Go
var errBadType = errors.New("gob: unknown type id or corrupted data")
```

### <a id="errRange" href="#errRange">var errRange</a>

```
searchKey: gob.errRange
tags: [private]
```

```Go
var errRange = errors.New("gob: bad data: field numbers out of bounds")
```

### <a id="noValue" href="#noValue">var noValue</a>

```
searchKey: gob.noValue
tags: [private]
```

```Go
var noValue reflect.Value
```

### <a id="decOpTable" href="#decOpTable">var decOpTable</a>

```
searchKey: gob.decOpTable
tags: [private]
```

```Go
var decOpTable = ...
```

Index by Go types. 

### <a id="decIgnoreOpMap" href="#decIgnoreOpMap">var decIgnoreOpMap</a>

```
searchKey: gob.decIgnoreOpMap
tags: [private]
```

```Go
var decIgnoreOpMap = ...
```

Indexed by gob types.  tComplex will be added during type.init(). 

### <a id="emptyStructType" href="#emptyStructType">var emptyStructType</a>

```
searchKey: gob.emptyStructType
tags: [private]
```

```Go
var emptyStructType = reflect.TypeOf(emptyStruct{})
```

### <a id="errBadCount" href="#errBadCount">var errBadCount</a>

```
searchKey: gob.errBadCount
tags: [private]
```

```Go
var errBadCount = errors.New("invalid message length")
```

### <a id="debugFunc" href="#debugFunc">var debugFunc</a>

```
searchKey: gob.debugFunc
tags: [private]
```

```Go
var debugFunc func(io.Reader)
```

If debug.go is compiled into the program, debugFunc prints a human-readable representation of the gob data read from r by calling that file's Debug function. Otherwise it is nil. 

### <a id="encArrayHelper" href="#encArrayHelper">var encArrayHelper</a>

```
searchKey: gob.encArrayHelper
tags: [private]
```

```Go
var encArrayHelper = ...
```

### <a id="encSliceHelper" href="#encSliceHelper">var encSliceHelper</a>

```
searchKey: gob.encSliceHelper
tags: [private]
```

```Go
var encSliceHelper = ...
```

### <a id="encBufferPool" href="#encBufferPool">var encBufferPool</a>

```
searchKey: gob.encBufferPool
tags: [private]
```

```Go
var encBufferPool = ...
```

### <a id="encOpTable" href="#encOpTable">var encOpTable</a>

```
searchKey: gob.encOpTable
tags: [private]
```

```Go
var encOpTable = ...
```

### <a id="spaceForLength" href="#spaceForLength">var spaceForLength</a>

```
searchKey: gob.spaceForLength
tags: [private]
```

```Go
var spaceForLength = make([]byte, maxLength)
```

### <a id="userTypeCache" href="#userTypeCache">var userTypeCache</a>

```
searchKey: gob.userTypeCache
tags: [private]
```

```Go
var userTypeCache sync.Map // map[reflect.Type]*userTypeInfo

```

### <a id="gobEncoderInterfaceType" href="#gobEncoderInterfaceType">var gobEncoderInterfaceType</a>

```
searchKey: gob.gobEncoderInterfaceType
tags: [private]
```

```Go
var gobEncoderInterfaceType = reflect.TypeOf((*GobEncoder)(nil)).Elem()
```

### <a id="gobDecoderInterfaceType" href="#gobDecoderInterfaceType">var gobDecoderInterfaceType</a>

```
searchKey: gob.gobDecoderInterfaceType
tags: [private]
```

```Go
var gobDecoderInterfaceType = reflect.TypeOf((*GobDecoder)(nil)).Elem()
```

### <a id="binaryMarshalerInterfaceType" href="#binaryMarshalerInterfaceType">var binaryMarshalerInterfaceType</a>

```
searchKey: gob.binaryMarshalerInterfaceType
tags: [private]
```

```Go
var binaryMarshalerInterfaceType = reflect.TypeOf((*encoding.BinaryMarshaler)(nil)).Elem()
```

### <a id="binaryUnmarshalerInterfaceType" href="#binaryUnmarshalerInterfaceType">var binaryUnmarshalerInterfaceType</a>

```
searchKey: gob.binaryUnmarshalerInterfaceType
tags: [private]
```

```Go
var binaryUnmarshalerInterfaceType = reflect.TypeOf((*encoding.BinaryUnmarshaler)(nil)).Elem()
```

### <a id="textMarshalerInterfaceType" href="#textMarshalerInterfaceType">var textMarshalerInterfaceType</a>

```
searchKey: gob.textMarshalerInterfaceType
tags: [private]
```

```Go
var textMarshalerInterfaceType = reflect.TypeOf((*encoding.TextMarshaler)(nil)).Elem()
```

### <a id="textUnmarshalerInterfaceType" href="#textUnmarshalerInterfaceType">var textUnmarshalerInterfaceType</a>

```
searchKey: gob.textUnmarshalerInterfaceType
tags: [private]
```

```Go
var textUnmarshalerInterfaceType = reflect.TypeOf((*encoding.TextUnmarshaler)(nil)).Elem()
```

### <a id="nextId" href="#nextId">var nextId</a>

```
searchKey: gob.nextId
tags: [private]
```

```Go
var nextId typeId // incremented for each new type we build

```

### <a id="typeLock" href="#typeLock">var typeLock</a>

```
searchKey: gob.typeLock
tags: [private]
```

```Go
var typeLock sync.Mutex // set while building a type

```

### <a id="types" href="#types">var types</a>

```
searchKey: gob.types
tags: [private]
```

```Go
var types = make(map[reflect.Type]gobType)
```

### <a id="idToType" href="#idToType">var idToType</a>

```
searchKey: gob.idToType
tags: [private]
```

```Go
var idToType = make(map[typeId]gobType)
```

### <a id="builtinIdToType" href="#builtinIdToType">var builtinIdToType</a>

```
searchKey: gob.builtinIdToType
tags: [private]
```

```Go
var builtinIdToType map[typeId]gobType // set in init() after builtins are established

```

### <a id="tBool" href="#tBool">var tBool</a>

```
searchKey: gob.tBool
tags: [private]
```

```Go
var tBool = bootstrapType("bool", (*bool)(nil), 1)
```

Primordial types, needed during initialization. Always passed as pointers so the interface{} type goes through without losing its interfaceness. 

### <a id="tInt" href="#tInt">var tInt</a>

```
searchKey: gob.tInt
tags: [private]
```

```Go
var tInt = bootstrapType("int", (*int)(nil), 2)
```

### <a id="tUint" href="#tUint">var tUint</a>

```
searchKey: gob.tUint
tags: [private]
```

```Go
var tUint = bootstrapType("uint", (*uint)(nil), 3)
```

### <a id="tFloat" href="#tFloat">var tFloat</a>

```
searchKey: gob.tFloat
tags: [private]
```

```Go
var tFloat = bootstrapType("float", (*float64)(nil), 4)
```

### <a id="tBytes" href="#tBytes">var tBytes</a>

```
searchKey: gob.tBytes
tags: [private]
```

```Go
var tBytes = bootstrapType("bytes", (*[]byte)(nil), 5)
```

### <a id="tString" href="#tString">var tString</a>

```
searchKey: gob.tString
tags: [private]
```

```Go
var tString = bootstrapType("string", (*string)(nil), 6)
```

### <a id="tComplex" href="#tComplex">var tComplex</a>

```
searchKey: gob.tComplex
tags: [private]
```

```Go
var tComplex = bootstrapType("complex", (*complex128)(nil), 7)
```

### <a id="tInterface" href="#tInterface">var tInterface</a>

```
searchKey: gob.tInterface
tags: [private]
```

```Go
var tInterface = bootstrapType("interface", (*interface{})(nil), 8)
```

### <a id="tReserved7" href="#tReserved7">var tReserved7</a>

```
searchKey: gob.tReserved7
tags: [private]
```

```Go
var tReserved7 = bootstrapType("_reserved1", (*struct{ r7 int })(nil), 9)
```

Reserve some Ids for compatible expansion 

### <a id="tReserved6" href="#tReserved6">var tReserved6</a>

```
searchKey: gob.tReserved6
tags: [private]
```

```Go
var tReserved6 = bootstrapType("_reserved1", (*struct{ r6 int })(nil), 10)
```

### <a id="tReserved5" href="#tReserved5">var tReserved5</a>

```
searchKey: gob.tReserved5
tags: [private]
```

```Go
var tReserved5 = bootstrapType("_reserved1", (*struct{ r5 int })(nil), 11)
```

### <a id="tReserved4" href="#tReserved4">var tReserved4</a>

```
searchKey: gob.tReserved4
tags: [private]
```

```Go
var tReserved4 = bootstrapType("_reserved1", (*struct{ r4 int })(nil), 12)
```

### <a id="tReserved3" href="#tReserved3">var tReserved3</a>

```
searchKey: gob.tReserved3
tags: [private]
```

```Go
var tReserved3 = bootstrapType("_reserved1", (*struct{ r3 int })(nil), 13)
```

### <a id="tReserved2" href="#tReserved2">var tReserved2</a>

```
searchKey: gob.tReserved2
tags: [private]
```

```Go
var tReserved2 = bootstrapType("_reserved1", (*struct{ r2 int })(nil), 14)
```

### <a id="tReserved1" href="#tReserved1">var tReserved1</a>

```
searchKey: gob.tReserved1
tags: [private]
```

```Go
var tReserved1 = bootstrapType("_reserved1", (*struct{ r1 int })(nil), 15)
```

### <a id="tWireType" href="#tWireType">var tWireType</a>

```
searchKey: gob.tWireType
tags: [private]
```

```Go
var tWireType = mustGetTypeInfo(reflect.TypeOf(wireType{})).id
```

Predefined because it's needed by the Decoder 

### <a id="wireTypeUserInfo" href="#wireTypeUserInfo">var wireTypeUserInfo</a>

```
searchKey: gob.wireTypeUserInfo
tags: [private]
```

```Go
var wireTypeUserInfo *userTypeInfo // userTypeInfo of (*wireType)

```

### <a id="typeInfoMap" href="#typeInfoMap">var typeInfoMap</a>

```
searchKey: gob.typeInfoMap
tags: [private]
```

```Go
var typeInfoMap atomic.Value
```

typeInfoMap is an atomic pointer to map[reflect.Type]*typeInfo. It's updated copy-on-write. Readers just do an atomic load to get the current version of the map. Writers make a full copy of the map and atomically update the pointer to point to the new map. Under heavy read contention, this is significantly faster than a map protected by a mutex. 

### <a id="nameToConcreteType" href="#nameToConcreteType">var nameToConcreteType</a>

```
searchKey: gob.nameToConcreteType
tags: [private]
```

```Go
var nameToConcreteType sync.Map // map[string]reflect.Type

```

### <a id="concreteTypeToName" href="#concreteTypeToName">var concreteTypeToName</a>

```
searchKey: gob.concreteTypeToName
tags: [private]
```

```Go
var concreteTypeToName sync.Map // map[reflect.Type]string

```

### <a id="doFuzzTests" href="#doFuzzTests">var doFuzzTests</a>

```
searchKey: gob.doFuzzTests
tags: [private]
```

```Go
var doFuzzTests = flag.Bool("gob.fuzz", false, "run the fuzz tests, which are large and very slow")
```

### <a id="encodeT" href="#encodeT">var encodeT</a>

```
searchKey: gob.encodeT
tags: [private]
```

```Go
var encodeT = ...
```

### <a id="boolResult" href="#boolResult">var boolResult</a>

```
searchKey: gob.boolResult
tags: [private]
```

```Go
var boolResult = []byte{0x07, 0x01}
```

The result of encoding a true boolean with field number 7 

### <a id="signedResult" href="#signedResult">var signedResult</a>

```
searchKey: gob.signedResult
tags: [private]
```

```Go
var signedResult = []byte{0x07, 2 * 17}
```

The result of encoding a number 17 with field number 7 

### <a id="unsignedResult" href="#unsignedResult">var unsignedResult</a>

```
searchKey: gob.unsignedResult
tags: [private]
```

```Go
var unsignedResult = []byte{0x07, 17}
```

### <a id="floatResult" href="#floatResult">var floatResult</a>

```
searchKey: gob.floatResult
tags: [private]
```

```Go
var floatResult = []byte{0x07, 0xFE, 0x31, 0x40}
```

### <a id="complexResult" href="#complexResult">var complexResult</a>

```
searchKey: gob.complexResult
tags: [private]
```

```Go
var complexResult = []byte{0x07, 0xFE, 0x31, 0x40, 0xFE, 0x33, 0x40}
```

The result of encoding a number 17+19i with field number 7 

### <a id="bytesResult" href="#bytesResult">var bytesResult</a>

```
searchKey: gob.bytesResult
tags: [private]
```

```Go
var bytesResult = []byte{0x07, 0x05, 'h', 'e', 'l', 'l', 'o'}
```

The result of encoding "hello" with field number 7 

### <a id="singletons" href="#singletons">var singletons</a>

```
searchKey: gob.singletons
tags: [private]
```

```Go
var singletons = ...
```

### <a id="unsupportedValues" href="#unsupportedValues">var unsupportedValues</a>

```
searchKey: gob.unsupportedValues
tags: [private]
```

```Go
var unsupportedValues = []interface{}{
	make(chan int),
	func(a int) bool { return true },
}
```

Types not supported at top level by the Encoder. 

### <a id="testInt" href="#testInt">var testInt</a>

```
searchKey: gob.testInt
tags: [private]
```

```Go
var testInt int
```

### <a id="testFloat32" href="#testFloat32">var testFloat32</a>

```
searchKey: gob.testFloat32
tags: [private]
```

```Go
var testFloat32 float32
```

### <a id="testString" href="#testString">var testString</a>

```
searchKey: gob.testString
tags: [private]
```

```Go
var testString string
```

### <a id="testSlice" href="#testSlice">var testSlice</a>

```
searchKey: gob.testSlice
tags: [private]
```

```Go
var testSlice []string
```

### <a id="testMap" href="#testMap">var testMap</a>

```
searchKey: gob.testMap
tags: [private]
```

```Go
var testMap map[string]int
```

### <a id="testArray" href="#testArray">var testArray</a>

```
searchKey: gob.testArray
tags: [private]
```

```Go
var testArray [7]int
```

### <a id="singleTests" href="#singleTests">var singleTests</a>

```
searchKey: gob.singleTests
tags: [private]
```

```Go
var singleTests = ...
```

### <a id="ignoreTests" href="#ignoreTests">var ignoreTests</a>

```
searchKey: gob.ignoreTests
tags: [private]
```

```Go
var ignoreTests = ...
```

### <a id="badDataTests" href="#badDataTests">var badDataTests</a>

```
searchKey: gob.badDataTests
tags: [private]
```

```Go
var badDataTests = ...
```

### <a id="basicTypes" href="#basicTypes">var basicTypes</a>

```
searchKey: gob.basicTypes
tags: [private]
```

```Go
var basicTypes = ...
```

## <a id="type" href="#type">Types</a>

### <a id="decHelper" href="#decHelper">type decHelper func(state *std/encoding/gob.decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decHelper
tags: [private]
```

```Go
type decHelper func(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decoderState" href="#decoderState">type decoderState struct</a>

```
searchKey: gob.decoderState
tags: [private]
```

```Go
type decoderState struct {
	dec *Decoder
	// The buffer is stored with an extra indirection because it may be replaced
	// if we load a type during decode (when reading an interface value).
	b        *decBuffer
	fieldnum int           // the last field number read.
	next     *decoderState // for free list
}
```

decoderState is the execution state of an instance of the decoder. A new state is created for nested objects. 

#### <a id="newDecodeState" href="#newDecodeState">func newDecodeState(buf *decBuffer) *decoderState</a>

```
searchKey: gob.newDecodeState
tags: [private]
```

```Go
func newDecodeState(buf *decBuffer) *decoderState
```

#### <a id="newDecodeStateFromData" href="#newDecodeStateFromData">func newDecodeStateFromData(data []byte) *decoderState</a>

```
searchKey: gob.newDecodeStateFromData
tags: [private]
```

```Go
func newDecodeStateFromData(data []byte) *decoderState
```

#### <a id="decoderState.decodeUint" href="#decoderState.decodeUint">func (state *decoderState) decodeUint() (x uint64)</a>

```
searchKey: gob.decoderState.decodeUint
tags: [private]
```

```Go
func (state *decoderState) decodeUint() (x uint64)
```

decodeUint reads an encoded unsigned integer from state.r. Does not check for overflow. 

#### <a id="decoderState.decodeInt" href="#decoderState.decodeInt">func (state *decoderState) decodeInt() int64</a>

```
searchKey: gob.decoderState.decodeInt
tags: [private]
```

```Go
func (state *decoderState) decodeInt() int64
```

decodeInt reads an encoded signed integer from state.r. Does not check for overflow. 

#### <a id="decoderState.getLength" href="#decoderState.getLength">func (state *decoderState) getLength() (int, bool)</a>

```
searchKey: gob.decoderState.getLength
tags: [private]
```

```Go
func (state *decoderState) getLength() (int, bool)
```

getLength decodes the next uint and makes sure it is a possible size for a data item that follows, which means it must fit in a non-negative int and fit in the buffer. 

### <a id="decBuffer" href="#decBuffer">type decBuffer struct</a>

```
searchKey: gob.decBuffer
tags: [private]
```

```Go
type decBuffer struct {
	data   []byte
	offset int // Read offset.
}
```

decBuffer is an extremely simple, fast implementation of a read-only byte buffer. It is initialized by calling Size and then copying the data into the slice returned by Bytes(). 

#### <a id="newDecBuffer" href="#newDecBuffer">func newDecBuffer(data []byte) *decBuffer</a>

```
searchKey: gob.newDecBuffer
tags: [private]
```

```Go
func newDecBuffer(data []byte) *decBuffer
```

#### <a id="decBuffer.Read" href="#decBuffer.Read">func (d *decBuffer) Read(p []byte) (int, error)</a>

```
searchKey: gob.decBuffer.Read
tags: [private]
```

```Go
func (d *decBuffer) Read(p []byte) (int, error)
```

#### <a id="decBuffer.Drop" href="#decBuffer.Drop">func (d *decBuffer) Drop(n int)</a>

```
searchKey: gob.decBuffer.Drop
tags: [private]
```

```Go
func (d *decBuffer) Drop(n int)
```

#### <a id="decBuffer.Size" href="#decBuffer.Size">func (d *decBuffer) Size(n int)</a>

```
searchKey: gob.decBuffer.Size
tags: [private]
```

```Go
func (d *decBuffer) Size(n int)
```

Size grows the buffer to exactly n bytes, so d.Bytes() will return a slice of length n. Existing data is first discarded. 

#### <a id="decBuffer.ReadByte" href="#decBuffer.ReadByte">func (d *decBuffer) ReadByte() (byte, error)</a>

```
searchKey: gob.decBuffer.ReadByte
tags: [private]
```

```Go
func (d *decBuffer) ReadByte() (byte, error)
```

#### <a id="decBuffer.Len" href="#decBuffer.Len">func (d *decBuffer) Len() int</a>

```
searchKey: gob.decBuffer.Len
tags: [private]
```

```Go
func (d *decBuffer) Len() int
```

#### <a id="decBuffer.Bytes" href="#decBuffer.Bytes">func (d *decBuffer) Bytes() []byte</a>

```
searchKey: gob.decBuffer.Bytes
tags: [private]
```

```Go
func (d *decBuffer) Bytes() []byte
```

#### <a id="decBuffer.Reset" href="#decBuffer.Reset">func (d *decBuffer) Reset()</a>

```
searchKey: gob.decBuffer.Reset
tags: [private]
```

```Go
func (d *decBuffer) Reset()
```

### <a id="decOp" href="#decOp">type decOp func(i *std/encoding/gob.decInstr, state *std/encoding/gob.decoderState, v reflect.Value)</a>

```
searchKey: gob.decOp
tags: [private]
```

```Go
type decOp func(i *decInstr, state *decoderState, v reflect.Value)
```

decOp is the signature of a decoding operator for a given type. 

### <a id="decInstr" href="#decInstr">type decInstr struct</a>

```
searchKey: gob.decInstr
tags: [private]
```

```Go
type decInstr struct {
	op    decOp
	field int   // field number of the wire type
	index []int // field access indices for destination type
	ovfl  error // error message for overflow/underflow (for arrays, of the elements)
}
```

The 'instructions' of the decoding machine 

### <a id="decEngine" href="#decEngine">type decEngine struct</a>

```
searchKey: gob.decEngine
tags: [private]
```

```Go
type decEngine struct {
	instr    []decInstr
	numInstr int // the number of active instructions
}
```

The encoder engine is an array of instructions indexed by field number of the incoming decoder. It is executed with random access according to field number. 

### <a id="emptyStruct" href="#emptyStruct">type emptyStruct struct{}</a>

```
searchKey: gob.emptyStruct
tags: [private]
```

```Go
type emptyStruct struct{}
```

emptyStruct is the type we compile into when ignoring a struct value. 

### <a id="Decoder" href="#Decoder">type Decoder struct</a>

```
searchKey: gob.Decoder
```

```Go
type Decoder struct {
	mutex        sync.Mutex                              // each item must be received atomically
	r            io.Reader                               // source of the data
	buf          decBuffer                               // buffer for more efficient i/o from r
	wireType     map[typeId]*wireType                    // map from remote ID to local description
	decoderCache map[reflect.Type]map[typeId]**decEngine // cache of compiled engines
	ignorerCache map[typeId]**decEngine                  // ditto for ignored objects
	freeList     *decoderState                           // list of free decoderStates; avoids reallocation
	countBuf     []byte                                  // used for decoding integers while parsing messages
	err          error
}
```

A Decoder manages the receipt of type and data information read from the remote side of a connection.  It is safe for concurrent use by multiple goroutines. 

The Decoder does only basic sanity checking on decoded input sizes, and its limits are not configurable. Take caution when decoding gob data from untrusted sources. 

#### <a id="NewDecoder" href="#NewDecoder">func NewDecoder(r io.Reader) *Decoder</a>

```
searchKey: gob.NewDecoder
```

```Go
func NewDecoder(r io.Reader) *Decoder
```

NewDecoder returns a new decoder that reads from the io.Reader. If r does not also implement io.ByteReader, it will be wrapped in a bufio.Reader. 

#### <a id="Decoder.newDecoderState" href="#Decoder.newDecoderState">func (dec *Decoder) newDecoderState(buf *decBuffer) *decoderState</a>

```
searchKey: gob.Decoder.newDecoderState
tags: [private]
```

```Go
func (dec *Decoder) newDecoderState(buf *decBuffer) *decoderState
```

We pass the bytes.Buffer separately for easier testing of the infrastructure without requiring a full Decoder. 

#### <a id="Decoder.freeDecoderState" href="#Decoder.freeDecoderState">func (dec *Decoder) freeDecoderState(d *decoderState)</a>

```
searchKey: gob.Decoder.freeDecoderState
tags: [private]
```

```Go
func (dec *Decoder) freeDecoderState(d *decoderState)
```

#### <a id="Decoder.decodeSingle" href="#Decoder.decodeSingle">func (dec *Decoder) decodeSingle(engine *decEngine, value reflect.Value)</a>

```
searchKey: gob.Decoder.decodeSingle
tags: [private]
```

```Go
func (dec *Decoder) decodeSingle(engine *decEngine, value reflect.Value)
```

decodeSingle decodes a top-level value that is not a struct and stores it in value. Such values are preceded by a zero, making them have the memory layout of a struct field (although with an illegal field number). 

#### <a id="Decoder.decodeStruct" href="#Decoder.decodeStruct">func (dec *Decoder) decodeStruct(engine *decEngine, value reflect.Value)</a>

```
searchKey: gob.Decoder.decodeStruct
tags: [private]
```

```Go
func (dec *Decoder) decodeStruct(engine *decEngine, value reflect.Value)
```

decodeStruct decodes a top-level struct and stores it in value. Indir is for the value, not the type. At the time of the call it may differ from ut.indir, which was computed when the engine was built. This state cannot arise for decodeSingle, which is called directly from the user's value, not from the innards of an engine. 

#### <a id="Decoder.ignoreStruct" href="#Decoder.ignoreStruct">func (dec *Decoder) ignoreStruct(engine *decEngine)</a>

```
searchKey: gob.Decoder.ignoreStruct
tags: [private]
```

```Go
func (dec *Decoder) ignoreStruct(engine *decEngine)
```

ignoreStruct discards the data for a struct with no destination. 

#### <a id="Decoder.ignoreSingle" href="#Decoder.ignoreSingle">func (dec *Decoder) ignoreSingle(engine *decEngine)</a>

```
searchKey: gob.Decoder.ignoreSingle
tags: [private]
```

```Go
func (dec *Decoder) ignoreSingle(engine *decEngine)
```

ignoreSingle discards the data for a top-level non-struct value with no destination. It's used when calling Decode with a nil value. 

#### <a id="Decoder.decodeArrayHelper" href="#Decoder.decodeArrayHelper">func (dec *Decoder) decodeArrayHelper(state *decoderState, value reflect.Value, elemOp decOp, length int, ovfl error, helper decHelper)</a>

```
searchKey: gob.Decoder.decodeArrayHelper
tags: [private]
```

```Go
func (dec *Decoder) decodeArrayHelper(state *decoderState, value reflect.Value, elemOp decOp, length int, ovfl error, helper decHelper)
```

decodeArrayHelper does the work for decoding arrays and slices. 

#### <a id="Decoder.decodeArray" href="#Decoder.decodeArray">func (dec *Decoder) decodeArray(state *decoderState, value reflect.Value, elemOp decOp, length int, ovfl error, helper decHelper)</a>

```
searchKey: gob.Decoder.decodeArray
tags: [private]
```

```Go
func (dec *Decoder) decodeArray(state *decoderState, value reflect.Value, elemOp decOp, length int, ovfl error, helper decHelper)
```

decodeArray decodes an array and stores it in value. The length is an unsigned integer preceding the elements. Even though the length is redundant (it's part of the type), it's a useful check and is included in the encoding. 

#### <a id="Decoder.decodeMap" href="#Decoder.decodeMap">func (dec *Decoder) decodeMap(mtyp reflect.Type, state *decoderState, value reflect.Value, keyOp, elemOp decOp, ovfl error)</a>

```
searchKey: gob.Decoder.decodeMap
tags: [private]
```

```Go
func (dec *Decoder) decodeMap(mtyp reflect.Type, state *decoderState, value reflect.Value, keyOp, elemOp decOp, ovfl error)
```

decodeMap decodes a map and stores it in value. Maps are encoded as a length followed by key:value pairs. Because the internals of maps are not visible to us, we must use reflection rather than pointer magic. 

#### <a id="Decoder.ignoreArrayHelper" href="#Decoder.ignoreArrayHelper">func (dec *Decoder) ignoreArrayHelper(state *decoderState, elemOp decOp, length int)</a>

```
searchKey: gob.Decoder.ignoreArrayHelper
tags: [private]
```

```Go
func (dec *Decoder) ignoreArrayHelper(state *decoderState, elemOp decOp, length int)
```

ignoreArrayHelper does the work for discarding arrays and slices. 

#### <a id="Decoder.ignoreArray" href="#Decoder.ignoreArray">func (dec *Decoder) ignoreArray(state *decoderState, elemOp decOp, length int)</a>

```
searchKey: gob.Decoder.ignoreArray
tags: [private]
```

```Go
func (dec *Decoder) ignoreArray(state *decoderState, elemOp decOp, length int)
```

ignoreArray discards the data for an array value with no destination. 

#### <a id="Decoder.ignoreMap" href="#Decoder.ignoreMap">func (dec *Decoder) ignoreMap(state *decoderState, keyOp, elemOp decOp)</a>

```
searchKey: gob.Decoder.ignoreMap
tags: [private]
```

```Go
func (dec *Decoder) ignoreMap(state *decoderState, keyOp, elemOp decOp)
```

ignoreMap discards the data for a map value with no destination. 

#### <a id="Decoder.decodeSlice" href="#Decoder.decodeSlice">func (dec *Decoder) decodeSlice(state *decoderState, value reflect.Value, elemOp decOp, ovfl error, helper decHelper)</a>

```
searchKey: gob.Decoder.decodeSlice
tags: [private]
```

```Go
func (dec *Decoder) decodeSlice(state *decoderState, value reflect.Value, elemOp decOp, ovfl error, helper decHelper)
```

decodeSlice decodes a slice and stores it in value. Slices are encoded as an unsigned length followed by the elements. 

#### <a id="Decoder.ignoreSlice" href="#Decoder.ignoreSlice">func (dec *Decoder) ignoreSlice(state *decoderState, elemOp decOp)</a>

```
searchKey: gob.Decoder.ignoreSlice
tags: [private]
```

```Go
func (dec *Decoder) ignoreSlice(state *decoderState, elemOp decOp)
```

ignoreSlice skips over the data for a slice value with no destination. 

#### <a id="Decoder.decodeInterface" href="#Decoder.decodeInterface">func (dec *Decoder) decodeInterface(ityp reflect.Type, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.Decoder.decodeInterface
tags: [private]
```

```Go
func (dec *Decoder) decodeInterface(ityp reflect.Type, state *decoderState, value reflect.Value)
```

decodeInterface decodes an interface value and stores it in value. Interfaces are encoded as the name of a concrete type followed by a value. If the name is empty, the value is nil and no value is sent. 

#### <a id="Decoder.ignoreInterface" href="#Decoder.ignoreInterface">func (dec *Decoder) ignoreInterface(state *decoderState)</a>

```
searchKey: gob.Decoder.ignoreInterface
tags: [private]
```

```Go
func (dec *Decoder) ignoreInterface(state *decoderState)
```

ignoreInterface discards the data for an interface value with no destination. 

#### <a id="Decoder.decodeGobDecoder" href="#Decoder.decodeGobDecoder">func (dec *Decoder) decodeGobDecoder(ut *userTypeInfo, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.Decoder.decodeGobDecoder
tags: [private]
```

```Go
func (dec *Decoder) decodeGobDecoder(ut *userTypeInfo, state *decoderState, value reflect.Value)
```

decodeGobDecoder decodes something implementing the GobDecoder interface. The data is encoded as a byte slice. 

#### <a id="Decoder.ignoreGobDecoder" href="#Decoder.ignoreGobDecoder">func (dec *Decoder) ignoreGobDecoder(state *decoderState)</a>

```
searchKey: gob.Decoder.ignoreGobDecoder
tags: [private]
```

```Go
func (dec *Decoder) ignoreGobDecoder(state *decoderState)
```

ignoreGobDecoder discards the data for a GobDecoder value with no destination. 

#### <a id="Decoder.decOpFor" href="#Decoder.decOpFor">func (dec *Decoder) decOpFor(wireId typeId, rt reflect.Type, name string, inProgress map[reflect.Type]*decOp) *decOp</a>

```
searchKey: gob.Decoder.decOpFor
tags: [private]
```

```Go
func (dec *Decoder) decOpFor(wireId typeId, rt reflect.Type, name string, inProgress map[reflect.Type]*decOp) *decOp
```

decOpFor returns the decoding op for the base type under rt and the indirection count to reach it. 

#### <a id="Decoder.decIgnoreOpFor" href="#Decoder.decIgnoreOpFor">func (dec *Decoder) decIgnoreOpFor(wireId typeId, inProgress map[typeId]*decOp) *decOp</a>

```
searchKey: gob.Decoder.decIgnoreOpFor
tags: [private]
```

```Go
func (dec *Decoder) decIgnoreOpFor(wireId typeId, inProgress map[typeId]*decOp) *decOp
```

decIgnoreOpFor returns the decoding op for a field that has no destination. 

#### <a id="Decoder.gobDecodeOpFor" href="#Decoder.gobDecodeOpFor">func (dec *Decoder) gobDecodeOpFor(ut *userTypeInfo) *decOp</a>

```
searchKey: gob.Decoder.gobDecodeOpFor
tags: [private]
```

```Go
func (dec *Decoder) gobDecodeOpFor(ut *userTypeInfo) *decOp
```

gobDecodeOpFor returns the op for a type that is known to implement GobDecoder. 

#### <a id="Decoder.compatibleType" href="#Decoder.compatibleType">func (dec *Decoder) compatibleType(fr reflect.Type, fw typeId, inProgress map[reflect.Type]typeId) bool</a>

```
searchKey: gob.Decoder.compatibleType
tags: [private]
```

```Go
func (dec *Decoder) compatibleType(fr reflect.Type, fw typeId, inProgress map[reflect.Type]typeId) bool
```

compatibleType asks: Are these two gob Types compatible? Answers the question for basic types, arrays, maps and slices, plus GobEncoder/Decoder pairs. Structs are considered ok; fields will be checked later. 

#### <a id="Decoder.typeString" href="#Decoder.typeString">func (dec *Decoder) typeString(remoteId typeId) string</a>

```
searchKey: gob.Decoder.typeString
tags: [private]
```

```Go
func (dec *Decoder) typeString(remoteId typeId) string
```

typeString returns a human-readable description of the type identified by remoteId. 

#### <a id="Decoder.compileSingle" href="#Decoder.compileSingle">func (dec *Decoder) compileSingle(remoteId typeId, ut *userTypeInfo) (engine *decEngine, err error)</a>

```
searchKey: gob.Decoder.compileSingle
tags: [private]
```

```Go
func (dec *Decoder) compileSingle(remoteId typeId, ut *userTypeInfo) (engine *decEngine, err error)
```

compileSingle compiles the decoder engine for a non-struct top-level value, including GobDecoders. 

#### <a id="Decoder.compileIgnoreSingle" href="#Decoder.compileIgnoreSingle">func (dec *Decoder) compileIgnoreSingle(remoteId typeId) *decEngine</a>

```
searchKey: gob.Decoder.compileIgnoreSingle
tags: [private]
```

```Go
func (dec *Decoder) compileIgnoreSingle(remoteId typeId) *decEngine
```

compileIgnoreSingle compiles the decoder engine for a non-struct top-level value that will be discarded. 

#### <a id="Decoder.compileDec" href="#Decoder.compileDec">func (dec *Decoder) compileDec(remoteId typeId, ut *userTypeInfo) (engine *decEngine, err error)</a>

```
searchKey: gob.Decoder.compileDec
tags: [private]
```

```Go
func (dec *Decoder) compileDec(remoteId typeId, ut *userTypeInfo) (engine *decEngine, err error)
```

compileDec compiles the decoder engine for a value. If the value is not a struct, it calls out to compileSingle. 

#### <a id="Decoder.getDecEnginePtr" href="#Decoder.getDecEnginePtr">func (dec *Decoder) getDecEnginePtr(remoteId typeId, ut *userTypeInfo) (enginePtr **decEngine, err error)</a>

```
searchKey: gob.Decoder.getDecEnginePtr
tags: [private]
```

```Go
func (dec *Decoder) getDecEnginePtr(remoteId typeId, ut *userTypeInfo) (enginePtr **decEngine, err error)
```

getDecEnginePtr returns the engine for the specified type. 

#### <a id="Decoder.getIgnoreEnginePtr" href="#Decoder.getIgnoreEnginePtr">func (dec *Decoder) getIgnoreEnginePtr(wireId typeId) (enginePtr **decEngine, err error)</a>

```
searchKey: gob.Decoder.getIgnoreEnginePtr
tags: [private]
```

```Go
func (dec *Decoder) getIgnoreEnginePtr(wireId typeId) (enginePtr **decEngine, err error)
```

getIgnoreEnginePtr returns the engine for the specified type when the value is to be discarded. 

#### <a id="Decoder.decodeValue" href="#Decoder.decodeValue">func (dec *Decoder) decodeValue(wireId typeId, value reflect.Value)</a>

```
searchKey: gob.Decoder.decodeValue
tags: [private]
```

```Go
func (dec *Decoder) decodeValue(wireId typeId, value reflect.Value)
```

decodeValue decodes the data stream representing a value and stores it in value. 

#### <a id="Decoder.decodeIgnoredValue" href="#Decoder.decodeIgnoredValue">func (dec *Decoder) decodeIgnoredValue(wireId typeId)</a>

```
searchKey: gob.Decoder.decodeIgnoredValue
tags: [private]
```

```Go
func (dec *Decoder) decodeIgnoredValue(wireId typeId)
```

decodeIgnoredValue decodes the data stream representing a value of the specified type and discards it. 

#### <a id="Decoder.recvType" href="#Decoder.recvType">func (dec *Decoder) recvType(id typeId)</a>

```
searchKey: gob.Decoder.recvType
tags: [private]
```

```Go
func (dec *Decoder) recvType(id typeId)
```

recvType loads the definition of a type. 

#### <a id="Decoder.recvMessage" href="#Decoder.recvMessage">func (dec *Decoder) recvMessage() bool</a>

```
searchKey: gob.Decoder.recvMessage
tags: [private]
```

```Go
func (dec *Decoder) recvMessage() bool
```

recvMessage reads the next count-delimited item from the input. It is the converse of Encoder.writeMessage. It returns false on EOF or other error reading the message. 

#### <a id="Decoder.readMessage" href="#Decoder.readMessage">func (dec *Decoder) readMessage(nbytes int)</a>

```
searchKey: gob.Decoder.readMessage
tags: [private]
```

```Go
func (dec *Decoder) readMessage(nbytes int)
```

readMessage reads the next nbytes bytes from the input. 

#### <a id="Decoder.nextInt" href="#Decoder.nextInt">func (dec *Decoder) nextInt() int64</a>

```
searchKey: gob.Decoder.nextInt
tags: [private]
```

```Go
func (dec *Decoder) nextInt() int64
```

#### <a id="Decoder.nextUint" href="#Decoder.nextUint">func (dec *Decoder) nextUint() uint64</a>

```
searchKey: gob.Decoder.nextUint
tags: [private]
```

```Go
func (dec *Decoder) nextUint() uint64
```

#### <a id="Decoder.decodeTypeSequence" href="#Decoder.decodeTypeSequence">func (dec *Decoder) decodeTypeSequence(isInterface bool) typeId</a>

```
searchKey: gob.Decoder.decodeTypeSequence
tags: [private]
```

```Go
func (dec *Decoder) decodeTypeSequence(isInterface bool) typeId
```

decodeTypeSequence parses: TypeSequence 

```
(TypeDefinition DelimitedTypeDefinition*)?

```
and returns the type id of the next value. It returns -1 at EOF.  Upon return, the remainder of dec.buf is the value to be decoded. If this is an interface value, it can be ignored by resetting that buffer. 

#### <a id="Decoder.Decode" href="#Decoder.Decode">func (dec *Decoder) Decode(e interface{}) error</a>

```
searchKey: gob.Decoder.Decode
```

```Go
func (dec *Decoder) Decode(e interface{}) error
```

Decode reads the next value from the input stream and stores it in the data represented by the empty interface value. If e is nil, the value will be discarded. Otherwise, the value underlying e must be a pointer to the correct type for the next data item received. If the input is at EOF, Decode returns io.EOF and does not modify e. 

#### <a id="Decoder.DecodeValue" href="#Decoder.DecodeValue">func (dec *Decoder) DecodeValue(v reflect.Value) error</a>

```
searchKey: gob.Decoder.DecodeValue
```

```Go
func (dec *Decoder) DecodeValue(v reflect.Value) error
```

DecodeValue reads the next value from the input stream. If v is the zero reflect.Value (v.Kind() == Invalid), DecodeValue discards the value. Otherwise, it stores the value into v. In that case, v must represent a non-nil pointer to data or be an assignable reflect.Value (v.CanSet()) If the input is at EOF, DecodeValue returns io.EOF and does not modify v. 

### <a id="encHelper" href="#encHelper">type encHelper func(state *std/encoding/gob.encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encHelper
tags: [private]
```

```Go
type encHelper func(state *encoderState, v reflect.Value) bool
```

### <a id="encoderState" href="#encoderState">type encoderState struct</a>

```
searchKey: gob.encoderState
tags: [private]
```

```Go
type encoderState struct {
	enc      *Encoder
	b        *encBuffer
	sendZero bool                 // encoding an array element or map key/value pair; send zero values
	fieldnum int                  // the last field number written.
	buf      [1 + uint64Size]byte // buffer used by the encoder; here to avoid allocation.
	next     *encoderState        // for free list
}
```

encoderState is the global execution state of an instance of the encoder. Field numbers are delta encoded and always increase. The field number is initialized to -1 so 0 comes out as delta(1). A delta of 0 terminates the structure. 

#### <a id="newEncoderState" href="#newEncoderState">func newEncoderState(b *encBuffer) *encoderState</a>

```
searchKey: gob.newEncoderState
tags: [private]
```

```Go
func newEncoderState(b *encBuffer) *encoderState
```

#### <a id="encoderState.encodeUint" href="#encoderState.encodeUint">func (state *encoderState) encodeUint(x uint64)</a>

```
searchKey: gob.encoderState.encodeUint
tags: [private]
```

```Go
func (state *encoderState) encodeUint(x uint64)
```

encodeUint writes an encoded unsigned integer to state.b. 

#### <a id="encoderState.encodeInt" href="#encoderState.encodeInt">func (state *encoderState) encodeInt(i int64)</a>

```
searchKey: gob.encoderState.encodeInt
tags: [private]
```

```Go
func (state *encoderState) encodeInt(i int64)
```

encodeInt writes an encoded signed integer to state.w. The low bit of the encoding says whether to bit complement the (other bits of the) uint to recover the int. 

#### <a id="encoderState.update" href="#encoderState.update">func (state *encoderState) update(instr *encInstr)</a>

```
searchKey: gob.encoderState.update
tags: [private]
```

```Go
func (state *encoderState) update(instr *encInstr)
```

update emits a field number and updates the state to record its value for delta encoding. If the instruction pointer is nil, it does nothing 

### <a id="encBuffer" href="#encBuffer">type encBuffer struct</a>

```
searchKey: gob.encBuffer
tags: [private]
```

```Go
type encBuffer struct {
	data    []byte
	scratch [64]byte
}
```

encBuffer is an extremely simple, fast implementation of a write-only byte buffer. It never returns a non-nil error, but Write returns an error value so it matches io.Writer. 

#### <a id="encBuffer.writeByte" href="#encBuffer.writeByte">func (e *encBuffer) writeByte(c byte)</a>

```
searchKey: gob.encBuffer.writeByte
tags: [private]
```

```Go
func (e *encBuffer) writeByte(c byte)
```

#### <a id="encBuffer.Write" href="#encBuffer.Write">func (e *encBuffer) Write(p []byte) (int, error)</a>

```
searchKey: gob.encBuffer.Write
tags: [private]
```

```Go
func (e *encBuffer) Write(p []byte) (int, error)
```

#### <a id="encBuffer.WriteString" href="#encBuffer.WriteString">func (e *encBuffer) WriteString(s string)</a>

```
searchKey: gob.encBuffer.WriteString
tags: [private]
```

```Go
func (e *encBuffer) WriteString(s string)
```

#### <a id="encBuffer.Len" href="#encBuffer.Len">func (e *encBuffer) Len() int</a>

```
searchKey: gob.encBuffer.Len
tags: [private]
```

```Go
func (e *encBuffer) Len() int
```

#### <a id="encBuffer.Bytes" href="#encBuffer.Bytes">func (e *encBuffer) Bytes() []byte</a>

```
searchKey: gob.encBuffer.Bytes
tags: [private]
```

```Go
func (e *encBuffer) Bytes() []byte
```

#### <a id="encBuffer.Reset" href="#encBuffer.Reset">func (e *encBuffer) Reset()</a>

```
searchKey: gob.encBuffer.Reset
tags: [private]
```

```Go
func (e *encBuffer) Reset()
```

### <a id="encOp" href="#encOp">type encOp func(i *std/encoding/gob.encInstr, state *std/encoding/gob.encoderState, v reflect.Value)</a>

```
searchKey: gob.encOp
tags: [private]
```

```Go
type encOp func(i *encInstr, state *encoderState, v reflect.Value)
```

encOp is the signature of an encoding operator for a given type. 

#### <a id="encOpFor" href="#encOpFor">func encOpFor(rt reflect.Type, inProgress map[reflect.Type]*encOp, building map[*typeInfo]bool) (*encOp, int)</a>

```
searchKey: gob.encOpFor
tags: [private]
```

```Go
func encOpFor(rt reflect.Type, inProgress map[reflect.Type]*encOp, building map[*typeInfo]bool) (*encOp, int)
```

encOpFor returns (a pointer to) the encoding op for the base type under rt and the indirection count to reach it. 

#### <a id="gobEncodeOpFor" href="#gobEncodeOpFor">func gobEncodeOpFor(ut *userTypeInfo) (*encOp, int)</a>

```
searchKey: gob.gobEncodeOpFor
tags: [private]
```

```Go
func gobEncodeOpFor(ut *userTypeInfo) (*encOp, int)
```

gobEncodeOpFor returns the op for a type that is known to implement GobEncoder. 

### <a id="encInstr" href="#encInstr">type encInstr struct</a>

```
searchKey: gob.encInstr
tags: [private]
```

```Go
type encInstr struct {
	op    encOp
	field int   // field number in input
	index []int // struct index
	indir int   // how many pointer indirections to reach the value in the struct
}
```

The 'instructions' of the encoding machine 

### <a id="encEngine" href="#encEngine">type encEngine struct</a>

```
searchKey: gob.encEngine
tags: [private]
```

```Go
type encEngine struct {
	instr []encInstr
}
```

encEngine an array of instructions indexed by field number of the encoding data, typically a struct. It is executed top to bottom, walking the struct. 

#### <a id="compileEnc" href="#compileEnc">func compileEnc(ut *userTypeInfo, building map[*typeInfo]bool) *encEngine</a>

```
searchKey: gob.compileEnc
tags: [private]
```

```Go
func compileEnc(ut *userTypeInfo, building map[*typeInfo]bool) *encEngine
```

compileEnc returns the engine to compile the type. 

#### <a id="getEncEngine" href="#getEncEngine">func getEncEngine(ut *userTypeInfo, building map[*typeInfo]bool) *encEngine</a>

```
searchKey: gob.getEncEngine
tags: [private]
```

```Go
func getEncEngine(ut *userTypeInfo, building map[*typeInfo]bool) *encEngine
```

getEncEngine returns the engine to compile the type. 

#### <a id="buildEncEngine" href="#buildEncEngine">func buildEncEngine(info *typeInfo, ut *userTypeInfo, building map[*typeInfo]bool) *encEngine</a>

```
searchKey: gob.buildEncEngine
tags: [private]
```

```Go
func buildEncEngine(info *typeInfo, ut *userTypeInfo, building map[*typeInfo]bool) *encEngine
```

### <a id="Encoder" href="#Encoder">type Encoder struct</a>

```
searchKey: gob.Encoder
```

```Go
type Encoder struct {
	mutex      sync.Mutex              // each item must be sent atomically
	w          []io.Writer             // where to send the data
	sent       map[reflect.Type]typeId // which types we've already sent
	countState *encoderState           // stage for writing counts
	freeList   *encoderState           // list of free encoderStates; avoids reallocation
	byteBuf    encBuffer               // buffer for top-level encoderState
	err        error
}
```

An Encoder manages the transmission of type and data information to the other side of a connection.  It is safe for concurrent use by multiple goroutines. 

#### <a id="NewEncoder" href="#NewEncoder">func NewEncoder(w io.Writer) *Encoder</a>

```
searchKey: gob.NewEncoder
```

```Go
func NewEncoder(w io.Writer) *Encoder
```

NewEncoder returns a new encoder that will transmit on the io.Writer. 

#### <a id="Encoder.newEncoderState" href="#Encoder.newEncoderState">func (enc *Encoder) newEncoderState(b *encBuffer) *encoderState</a>

```
searchKey: gob.Encoder.newEncoderState
tags: [private]
```

```Go
func (enc *Encoder) newEncoderState(b *encBuffer) *encoderState
```

#### <a id="Encoder.freeEncoderState" href="#Encoder.freeEncoderState">func (enc *Encoder) freeEncoderState(e *encoderState)</a>

```
searchKey: gob.Encoder.freeEncoderState
tags: [private]
```

```Go
func (enc *Encoder) freeEncoderState(e *encoderState)
```

#### <a id="Encoder.encodeSingle" href="#Encoder.encodeSingle">func (enc *Encoder) encodeSingle(b *encBuffer, engine *encEngine, value reflect.Value)</a>

```
searchKey: gob.Encoder.encodeSingle
tags: [private]
```

```Go
func (enc *Encoder) encodeSingle(b *encBuffer, engine *encEngine, value reflect.Value)
```

encodeSingle encodes a single top-level non-struct value. 

#### <a id="Encoder.encodeStruct" href="#Encoder.encodeStruct">func (enc *Encoder) encodeStruct(b *encBuffer, engine *encEngine, value reflect.Value)</a>

```
searchKey: gob.Encoder.encodeStruct
tags: [private]
```

```Go
func (enc *Encoder) encodeStruct(b *encBuffer, engine *encEngine, value reflect.Value)
```

encodeStruct encodes a single struct value. 

#### <a id="Encoder.encodeArray" href="#Encoder.encodeArray">func (enc *Encoder) encodeArray(b *encBuffer, value reflect.Value, op encOp, elemIndir int, length int, helper encHelper)</a>

```
searchKey: gob.Encoder.encodeArray
tags: [private]
```

```Go
func (enc *Encoder) encodeArray(b *encBuffer, value reflect.Value, op encOp, elemIndir int, length int, helper encHelper)
```

encodeArray encodes an array. 

#### <a id="Encoder.encodeMap" href="#Encoder.encodeMap">func (enc *Encoder) encodeMap(b *encBuffer, mv reflect.Value, keyOp, elemOp encOp, keyIndir, elemIndir int)</a>

```
searchKey: gob.Encoder.encodeMap
tags: [private]
```

```Go
func (enc *Encoder) encodeMap(b *encBuffer, mv reflect.Value, keyOp, elemOp encOp, keyIndir, elemIndir int)
```

encodeMap encodes a map as unsigned count followed by key:value pairs. 

#### <a id="Encoder.encodeInterface" href="#Encoder.encodeInterface">func (enc *Encoder) encodeInterface(b *encBuffer, iv reflect.Value)</a>

```
searchKey: gob.Encoder.encodeInterface
tags: [private]
```

```Go
func (enc *Encoder) encodeInterface(b *encBuffer, iv reflect.Value)
```

encodeInterface encodes the interface value iv. To send an interface, we send a string identifying the concrete type, followed by the type identifier (which might require defining that type right now), followed by the concrete value. A nil value gets sent as the empty string for the name, followed by no value. 

#### <a id="Encoder.encodeGobEncoder" href="#Encoder.encodeGobEncoder">func (enc *Encoder) encodeGobEncoder(b *encBuffer, ut *userTypeInfo, v reflect.Value)</a>

```
searchKey: gob.Encoder.encodeGobEncoder
tags: [private]
```

```Go
func (enc *Encoder) encodeGobEncoder(b *encBuffer, ut *userTypeInfo, v reflect.Value)
```

encGobEncoder encodes a value that implements the GobEncoder interface. The data is sent as a byte array. 

#### <a id="Encoder.encode" href="#Encoder.encode">func (enc *Encoder) encode(b *encBuffer, value reflect.Value, ut *userTypeInfo)</a>

```
searchKey: gob.Encoder.encode
tags: [private]
```

```Go
func (enc *Encoder) encode(b *encBuffer, value reflect.Value, ut *userTypeInfo)
```

#### <a id="Encoder.writer" href="#Encoder.writer">func (enc *Encoder) writer() io.Writer</a>

```
searchKey: gob.Encoder.writer
tags: [private]
```

```Go
func (enc *Encoder) writer() io.Writer
```

writer() returns the innermost writer the encoder is using 

#### <a id="Encoder.pushWriter" href="#Encoder.pushWriter">func (enc *Encoder) pushWriter(w io.Writer)</a>

```
searchKey: gob.Encoder.pushWriter
tags: [private]
```

```Go
func (enc *Encoder) pushWriter(w io.Writer)
```

pushWriter adds a writer to the encoder. 

#### <a id="Encoder.popWriter" href="#Encoder.popWriter">func (enc *Encoder) popWriter()</a>

```
searchKey: gob.Encoder.popWriter
tags: [private]
```

```Go
func (enc *Encoder) popWriter()
```

popWriter pops the innermost writer. 

#### <a id="Encoder.setError" href="#Encoder.setError">func (enc *Encoder) setError(err error)</a>

```
searchKey: gob.Encoder.setError
tags: [private]
```

```Go
func (enc *Encoder) setError(err error)
```

#### <a id="Encoder.writeMessage" href="#Encoder.writeMessage">func (enc *Encoder) writeMessage(w io.Writer, b *encBuffer)</a>

```
searchKey: gob.Encoder.writeMessage
tags: [private]
```

```Go
func (enc *Encoder) writeMessage(w io.Writer, b *encBuffer)
```

writeMessage sends the data item preceded by a unsigned count of its length. 

#### <a id="Encoder.sendActualType" href="#Encoder.sendActualType">func (enc *Encoder) sendActualType(w io.Writer, state *encoderState, ut *userTypeInfo, actual reflect.Type) (sent bool)</a>

```
searchKey: gob.Encoder.sendActualType
tags: [private]
```

```Go
func (enc *Encoder) sendActualType(w io.Writer, state *encoderState, ut *userTypeInfo, actual reflect.Type) (sent bool)
```

sendActualType sends the requested type, without further investigation, unless it's been sent before. 

#### <a id="Encoder.sendType" href="#Encoder.sendType">func (enc *Encoder) sendType(w io.Writer, state *encoderState, origt reflect.Type) (sent bool)</a>

```
searchKey: gob.Encoder.sendType
tags: [private]
```

```Go
func (enc *Encoder) sendType(w io.Writer, state *encoderState, origt reflect.Type) (sent bool)
```

sendType sends the type info to the other side, if necessary. 

#### <a id="Encoder.Encode" href="#Encoder.Encode">func (enc *Encoder) Encode(e interface{}) error</a>

```
searchKey: gob.Encoder.Encode
```

```Go
func (enc *Encoder) Encode(e interface{}) error
```

Encode transmits the data item represented by the empty interface value, guaranteeing that all necessary type information has been transmitted first. Passing a nil pointer to Encoder will panic, as they cannot be transmitted by gob. 

#### <a id="Encoder.sendTypeDescriptor" href="#Encoder.sendTypeDescriptor">func (enc *Encoder) sendTypeDescriptor(w io.Writer, state *encoderState, ut *userTypeInfo)</a>

```
searchKey: gob.Encoder.sendTypeDescriptor
tags: [private]
```

```Go
func (enc *Encoder) sendTypeDescriptor(w io.Writer, state *encoderState, ut *userTypeInfo)
```

sendTypeDescriptor makes sure the remote side knows about this type. It will send a descriptor if this is the first time the type has been sent. 

#### <a id="Encoder.sendTypeId" href="#Encoder.sendTypeId">func (enc *Encoder) sendTypeId(state *encoderState, ut *userTypeInfo)</a>

```
searchKey: gob.Encoder.sendTypeId
tags: [private]
```

```Go
func (enc *Encoder) sendTypeId(state *encoderState, ut *userTypeInfo)
```

sendTypeId sends the id, which must have already been defined. 

#### <a id="Encoder.EncodeValue" href="#Encoder.EncodeValue">func (enc *Encoder) EncodeValue(value reflect.Value) error</a>

```
searchKey: gob.Encoder.EncodeValue
```

```Go
func (enc *Encoder) EncodeValue(value reflect.Value) error
```

EncodeValue transmits the data item represented by the reflection value, guaranteeing that all necessary type information has been transmitted first. Passing a nil pointer to EncodeValue will panic, as they cannot be transmitted by gob. 

### <a id="gobError" href="#gobError">type gobError struct</a>

```
searchKey: gob.gobError
tags: [private]
```

```Go
type gobError struct {
	err error
}
```

A gobError is used to distinguish errors (panics) generated in this package. 

### <a id="userTypeInfo" href="#userTypeInfo">type userTypeInfo struct</a>

```
searchKey: gob.userTypeInfo
tags: [private]
```

```Go
type userTypeInfo struct {
	user        reflect.Type // the type the user handed us
	base        reflect.Type // the base type after all indirections
	indir       int          // number of indirections to reach the base type
	externalEnc int          // xGob, xBinary, or xText
	externalDec int          // xGob, xBinary or xText
	encIndir    int8         // number of indirections to reach the receiver type; may be negative
	decIndir    int8         // number of indirections to reach the receiver type; may be negative
}
```

userTypeInfo stores the information associated with a type the user has handed to the package. It's computed once and stored in a map keyed by reflection type. 

#### <a id="validUserType" href="#validUserType">func validUserType(rt reflect.Type) (*userTypeInfo, error)</a>

```
searchKey: gob.validUserType
tags: [private]
```

```Go
func validUserType(rt reflect.Type) (*userTypeInfo, error)
```

validType returns, and saves, the information associated with user-provided type rt. If the user type is not valid, err will be non-nil. To be used when the error handler is not set up. 

#### <a id="userType" href="#userType">func userType(rt reflect.Type) *userTypeInfo</a>

```
searchKey: gob.userType
tags: [private]
```

```Go
func userType(rt reflect.Type) *userTypeInfo
```

userType returns, and saves, the information associated with user-provided type rt. If the user type is not valid, it calls error. 

### <a id="typeId" href="#typeId">type typeId int32</a>

```
searchKey: gob.typeId
tags: [private]
```

```Go
type typeId int32
```

A typeId represents a gob Type as an integer that can be passed on the wire. Internally, typeIds are used as keys to a map to recover the underlying type info. 

#### <a id="bootstrapType" href="#bootstrapType">func bootstrapType(name string, e interface{}, expect typeId) typeId</a>

```
searchKey: gob.bootstrapType
tags: [private]
```

```Go
func bootstrapType(name string, e interface{}, expect typeId) typeId
```

used for building the basic types; called only from init().  the incoming interface always refers to a pointer. 

#### <a id="typeId.gobType" href="#typeId.gobType">func (t typeId) gobType() gobType</a>

```
searchKey: gob.typeId.gobType
tags: [private]
```

```Go
func (t typeId) gobType() gobType
```

#### <a id="typeId.string" href="#typeId.string">func (t typeId) string() string</a>

```
searchKey: gob.typeId.string
tags: [private]
```

```Go
func (t typeId) string() string
```

string returns the string representation of the type associated with the typeId. 

#### <a id="typeId.name" href="#typeId.name">func (t typeId) name() string</a>

```
searchKey: gob.typeId.name
tags: [private]
```

```Go
func (t typeId) name() string
```

Name returns the name of the type associated with the typeId. 

### <a id="gobType" href="#gobType">type gobType interface</a>

```
searchKey: gob.gobType
tags: [private]
```

```Go
type gobType interface {
	id() typeId
	setId(id typeId)
	name() string
	string() string // not public; only for debugging
	safeString(seen map[typeId]bool) string
}
```

#### <a id="newTypeObject" href="#newTypeObject">func newTypeObject(name string, ut *userTypeInfo, rt reflect.Type) (gobType, error)</a>

```
searchKey: gob.newTypeObject
tags: [private]
```

```Go
func newTypeObject(name string, ut *userTypeInfo, rt reflect.Type) (gobType, error)
```

newTypeObject allocates a gobType for the reflection type rt. Unless ut represents a GobEncoder, rt should be the base type of ut. This is only called from the encoding side. The decoding side works through typeIds and userTypeInfos alone. 

#### <a id="getBaseType" href="#getBaseType">func getBaseType(name string, rt reflect.Type) (gobType, error)</a>

```
searchKey: gob.getBaseType
tags: [private]
```

```Go
func getBaseType(name string, rt reflect.Type) (gobType, error)
```

getBaseType returns the Gob type describing the given reflect.Type's base type. typeLock must be held. 

#### <a id="getType" href="#getType">func getType(name string, ut *userTypeInfo, rt reflect.Type) (gobType, error)</a>

```
searchKey: gob.getType
tags: [private]
```

```Go
func getType(name string, ut *userTypeInfo, rt reflect.Type) (gobType, error)
```

getType returns the Gob type describing the given reflect.Type. Should be called only when handling GobEncoders/Decoders, which may be pointers. All other types are handled through the base type, never a pointer. typeLock must be held. 

#### <a id="getTypeUnlocked" href="#getTypeUnlocked">func getTypeUnlocked(name string, rt reflect.Type) gobType</a>

```
searchKey: gob.getTypeUnlocked
tags: [private]
```

```Go
func getTypeUnlocked(name string, rt reflect.Type) gobType
```

### <a id="CommonType" href="#CommonType">type CommonType struct</a>

```
searchKey: gob.CommonType
```

```Go
type CommonType struct {
	Name string
	Id   typeId
}
```

CommonType holds elements of all types. It is a historical artifact, kept for binary compatibility and exported only for the benefit of the package's encoding of type descriptors. It is not intended for direct use by clients. 

#### <a id="CommonType.id" href="#CommonType.id">func (t *CommonType) id() typeId</a>

```
searchKey: gob.CommonType.id
tags: [private]
```

```Go
func (t *CommonType) id() typeId
```

#### <a id="CommonType.setId" href="#CommonType.setId">func (t *CommonType) setId(id typeId)</a>

```
searchKey: gob.CommonType.setId
tags: [private]
```

```Go
func (t *CommonType) setId(id typeId)
```

#### <a id="CommonType.string" href="#CommonType.string">func (t *CommonType) string() string</a>

```
searchKey: gob.CommonType.string
tags: [private]
```

```Go
func (t *CommonType) string() string
```

#### <a id="CommonType.safeString" href="#CommonType.safeString">func (t *CommonType) safeString(seen map[typeId]bool) string</a>

```
searchKey: gob.CommonType.safeString
tags: [private]
```

```Go
func (t *CommonType) safeString(seen map[typeId]bool) string
```

#### <a id="CommonType.name" href="#CommonType.name">func (t *CommonType) name() string</a>

```
searchKey: gob.CommonType.name
tags: [private]
```

```Go
func (t *CommonType) name() string
```

### <a id="arrayType" href="#arrayType">type arrayType struct</a>

```
searchKey: gob.arrayType
tags: [private]
```

```Go
type arrayType struct {
	CommonType
	Elem typeId
	Len  int
}
```

Array type 

#### <a id="newArrayType" href="#newArrayType">func newArrayType(name string) *arrayType</a>

```
searchKey: gob.newArrayType
tags: [private]
```

```Go
func newArrayType(name string) *arrayType
```

#### <a id="arrayType.init.type.go.0xc0579022e8" href="#arrayType.init.type.go.0xc0579022e8">func (a *arrayType) init(elem gobType, len int)</a>

```
searchKey: gob.arrayType.init
tags: [private]
```

```Go
func (a *arrayType) init(elem gobType, len int)
```

#### <a id="arrayType.safeString" href="#arrayType.safeString">func (a *arrayType) safeString(seen map[typeId]bool) string</a>

```
searchKey: gob.arrayType.safeString
tags: [private]
```

```Go
func (a *arrayType) safeString(seen map[typeId]bool) string
```

#### <a id="arrayType.string" href="#arrayType.string">func (a *arrayType) string() string</a>

```
searchKey: gob.arrayType.string
tags: [private]
```

```Go
func (a *arrayType) string() string
```

### <a id="gobEncoderType" href="#gobEncoderType">type gobEncoderType struct</a>

```
searchKey: gob.gobEncoderType
tags: [private]
```

```Go
type gobEncoderType struct {
	CommonType
}
```

GobEncoder type (something that implements the GobEncoder interface) 

#### <a id="newGobEncoderType" href="#newGobEncoderType">func newGobEncoderType(name string) *gobEncoderType</a>

```
searchKey: gob.newGobEncoderType
tags: [private]
```

```Go
func newGobEncoderType(name string) *gobEncoderType
```

#### <a id="gobEncoderType.safeString" href="#gobEncoderType.safeString">func (g *gobEncoderType) safeString(seen map[typeId]bool) string</a>

```
searchKey: gob.gobEncoderType.safeString
tags: [private]
```

```Go
func (g *gobEncoderType) safeString(seen map[typeId]bool) string
```

#### <a id="gobEncoderType.string" href="#gobEncoderType.string">func (g *gobEncoderType) string() string</a>

```
searchKey: gob.gobEncoderType.string
tags: [private]
```

```Go
func (g *gobEncoderType) string() string
```

### <a id="mapType" href="#mapType">type mapType struct</a>

```
searchKey: gob.mapType
tags: [private]
```

```Go
type mapType struct {
	CommonType
	Key  typeId
	Elem typeId
}
```

Map type 

#### <a id="newMapType" href="#newMapType">func newMapType(name string) *mapType</a>

```
searchKey: gob.newMapType
tags: [private]
```

```Go
func newMapType(name string) *mapType
```

#### <a id="mapType.init.type.go.0xc0579022e8" href="#mapType.init.type.go.0xc0579022e8">func (m *mapType) init(key, elem gobType)</a>

```
searchKey: gob.mapType.init
tags: [private]
```

```Go
func (m *mapType) init(key, elem gobType)
```

#### <a id="mapType.safeString" href="#mapType.safeString">func (m *mapType) safeString(seen map[typeId]bool) string</a>

```
searchKey: gob.mapType.safeString
tags: [private]
```

```Go
func (m *mapType) safeString(seen map[typeId]bool) string
```

#### <a id="mapType.string" href="#mapType.string">func (m *mapType) string() string</a>

```
searchKey: gob.mapType.string
tags: [private]
```

```Go
func (m *mapType) string() string
```

### <a id="sliceType" href="#sliceType">type sliceType struct</a>

```
searchKey: gob.sliceType
tags: [private]
```

```Go
type sliceType struct {
	CommonType
	Elem typeId
}
```

Slice type 

#### <a id="newSliceType" href="#newSliceType">func newSliceType(name string) *sliceType</a>

```
searchKey: gob.newSliceType
tags: [private]
```

```Go
func newSliceType(name string) *sliceType
```

#### <a id="sliceType.init.type.go.0xc0579022e8" href="#sliceType.init.type.go.0xc0579022e8">func (s *sliceType) init(elem gobType)</a>

```
searchKey: gob.sliceType.init
tags: [private]
```

```Go
func (s *sliceType) init(elem gobType)
```

#### <a id="sliceType.safeString" href="#sliceType.safeString">func (s *sliceType) safeString(seen map[typeId]bool) string</a>

```
searchKey: gob.sliceType.safeString
tags: [private]
```

```Go
func (s *sliceType) safeString(seen map[typeId]bool) string
```

#### <a id="sliceType.string" href="#sliceType.string">func (s *sliceType) string() string</a>

```
searchKey: gob.sliceType.string
tags: [private]
```

```Go
func (s *sliceType) string() string
```

### <a id="fieldType" href="#fieldType">type fieldType struct</a>

```
searchKey: gob.fieldType
tags: [private]
```

```Go
type fieldType struct {
	Name string
	Id   typeId
}
```

Struct type 

### <a id="structType" href="#structType">type structType struct</a>

```
searchKey: gob.structType
tags: [private]
```

```Go
type structType struct {
	CommonType
	Field []*fieldType
}
```

#### <a id="newStructType" href="#newStructType">func newStructType(name string) *structType</a>

```
searchKey: gob.newStructType
tags: [private]
```

```Go
func newStructType(name string) *structType
```

#### <a id="structType.safeString" href="#structType.safeString">func (s *structType) safeString(seen map[typeId]bool) string</a>

```
searchKey: gob.structType.safeString
tags: [private]
```

```Go
func (s *structType) safeString(seen map[typeId]bool) string
```

#### <a id="structType.string" href="#structType.string">func (s *structType) string() string</a>

```
searchKey: gob.structType.string
tags: [private]
```

```Go
func (s *structType) string() string
```

### <a id="wireType" href="#wireType">type wireType struct</a>

```
searchKey: gob.wireType
tags: [private]
```

```Go
type wireType struct {
	ArrayT           *arrayType
	SliceT           *sliceType
	StructT          *structType
	MapT             *mapType
	GobEncoderT      *gobEncoderType
	BinaryMarshalerT *gobEncoderType
	TextMarshalerT   *gobEncoderType
}
```

Representation of the information we send and receive about this type. Each value we send is preceded by its type definition: an encoded int. However, the very first time we send the value, we first send the pair (-id, wireType). For bootstrapping purposes, we assume that the recipient knows how to decode a wireType; it is exactly the wireType struct here, interpreted using the gob rules for sending a structure, except that we assume the ids for wireType and structType etc. are known. The relevant pieces are built in encode.go's init() function. To maintain binary compatibility, if you extend this type, always put the new fields last. 

#### <a id="wireType.string" href="#wireType.string">func (w *wireType) string() string</a>

```
searchKey: gob.wireType.string
tags: [private]
```

```Go
func (w *wireType) string() string
```

### <a id="typeInfo" href="#typeInfo">type typeInfo struct</a>

```
searchKey: gob.typeInfo
tags: [private]
```

```Go
type typeInfo struct {
	id      typeId
	encInit sync.Mutex   // protects creation of encoder
	encoder atomic.Value // *encEngine
	wire    *wireType
}
```

#### <a id="lookupTypeInfo" href="#lookupTypeInfo">func lookupTypeInfo(rt reflect.Type) *typeInfo</a>

```
searchKey: gob.lookupTypeInfo
tags: [private]
```

```Go
func lookupTypeInfo(rt reflect.Type) *typeInfo
```

#### <a id="getTypeInfo" href="#getTypeInfo">func getTypeInfo(ut *userTypeInfo) (*typeInfo, error)</a>

```
searchKey: gob.getTypeInfo
tags: [private]
```

```Go
func getTypeInfo(ut *userTypeInfo) (*typeInfo, error)
```

#### <a id="buildTypeInfo" href="#buildTypeInfo">func buildTypeInfo(ut *userTypeInfo, rt reflect.Type) (*typeInfo, error)</a>

```
searchKey: gob.buildTypeInfo
tags: [private]
```

```Go
func buildTypeInfo(ut *userTypeInfo, rt reflect.Type) (*typeInfo, error)
```

buildTypeInfo constructs the type information for the type and stores it in the type info map. 

#### <a id="mustGetTypeInfo" href="#mustGetTypeInfo">func mustGetTypeInfo(rt reflect.Type) *typeInfo</a>

```
searchKey: gob.mustGetTypeInfo
tags: [private]
```

```Go
func mustGetTypeInfo(rt reflect.Type) *typeInfo
```

Called only when a panic is acceptable and unexpected. 

### <a id="GobEncoder" href="#GobEncoder">type GobEncoder interface</a>

```
searchKey: gob.GobEncoder
```

```Go
type GobEncoder interface {
	// GobEncode returns a byte slice representing the encoding of the
	// receiver for transmission to a GobDecoder, usually of the same
	// concrete type.
	GobEncode() ([]byte, error)
}
```

GobEncoder is the interface describing data that provides its own representation for encoding values for transmission to a GobDecoder. A type that implements GobEncoder and GobDecoder has complete control over the representation of its data and may therefore contain things such as private fields, channels, and functions, which are not usually transmissible in gob streams. 

Note: Since gobs can be stored permanently, it is good design to guarantee the encoding used by a GobEncoder is stable as the software evolves. For instance, it might make sense for GobEncode to include a version number in the encoding. 

### <a id="GobDecoder" href="#GobDecoder">type GobDecoder interface</a>

```
searchKey: gob.GobDecoder
```

```Go
type GobDecoder interface {
	// GobDecode overwrites the receiver, which must be a pointer,
	// with the value represented by the byte slice, which was written
	// by GobEncode, usually for the same concrete type.
	GobDecode([]byte) error
}
```

GobDecoder is the interface describing data that provides its own routine for decoding transmitted values sent by a GobEncoder. 

### <a id="EncodeT" href="#EncodeT">type EncodeT struct</a>

```
searchKey: gob.EncodeT
tags: [private]
```

```Go
type EncodeT struct {
	x uint64
	b []byte
}
```

Guarantee encoding format by comparing some encodings to hand-written values 

### <a id="T0" href="#T0">type T0 struct</a>

```
searchKey: gob.T0
tags: [private]
```

```Go
type T0 struct {
	A int
	B int
	C int
	D int
}
```

These three structures have the same data with different indirections 

### <a id="T1" href="#T1">type T1 struct</a>

```
searchKey: gob.T1
tags: [private]
```

```Go
type T1 struct {
	A int
	B *int
	C **int
	D ***int
}
```

### <a id="T2" href="#T2">type T2 struct</a>

```
searchKey: gob.T2
tags: [private]
```

```Go
type T2 struct {
	A ***int
	B **int
	C *int
	D int
}
```

### <a id="RT0" href="#RT0">type RT0 struct</a>

```
searchKey: gob.RT0
tags: [private]
```

```Go
type RT0 struct {
	A int
	B string
	C float64
}
```

### <a id="RT1" href="#RT1">type RT1 struct</a>

```
searchKey: gob.RT1
tags: [private]
```

```Go
type RT1 struct {
	C      float64
	B      string
	A      int
	NotSet string
}
```

### <a id="IT0" href="#IT0">type IT0 struct</a>

```
searchKey: gob.IT0
tags: [private]
```

```Go
type IT0 struct {
	A        int64
	B        string
	Ignore_d []int
	Ignore_e [3]float64
	Ignore_f bool
	Ignore_g string
	Ignore_h []byte
	Ignore_i *RT1
	Ignore_m map[string]int
	C        float64
}
```

Like an RT0 but with fields we'll ignore on the decode side. 

### <a id="Indirect" href="#Indirect">type Indirect struct</a>

```
searchKey: gob.Indirect
tags: [private]
```

```Go
type Indirect struct {
	A ***[3]int
	S ***[]int
	M ****map[string]int
}
```

### <a id="Direct" href="#Direct">type Direct struct</a>

```
searchKey: gob.Direct
tags: [private]
```

```Go
type Direct struct {
	A [3]int
	S []int
	M map[string]int
}
```

### <a id="Squarer" href="#Squarer">type Squarer interface</a>

```
searchKey: gob.Squarer
tags: [private]
```

```Go
type Squarer interface {
	Square() int
}
```

An interface with several implementations 

### <a id="Int" href="#Int">type Int int</a>

```
searchKey: gob.Int
tags: [private]
```

```Go
type Int int
```

#### <a id="Int.Square" href="#Int.Square">func (i Int) Square() int</a>

```
searchKey: gob.Int.Square
tags: [private]
```

```Go
func (i Int) Square() int
```

### <a id="Float" href="#Float">type Float float64</a>

```
searchKey: gob.Float
tags: [private]
```

```Go
type Float float64
```

#### <a id="Float.Square" href="#Float.Square">func (f Float) Square() int</a>

```
searchKey: gob.Float.Square
tags: [private]
```

```Go
func (f Float) Square() int
```

### <a id="Vector" href="#Vector">type Vector []int</a>

```
searchKey: gob.Vector
tags: [private]
```

```Go
type Vector []int
```

#### <a id="Vector.Square" href="#Vector.Square">func (v Vector) Square() int</a>

```
searchKey: gob.Vector.Square
tags: [private]
```

```Go
func (v Vector) Square() int
```

### <a id="Point" href="#Point">type Point struct</a>

```
searchKey: gob.Point
tags: [private]
```

```Go
type Point struct {
	X, Y int
}
```

#### <a id="Point.Square" href="#Point.Square">func (p Point) Square() int</a>

```
searchKey: gob.Point.Square
tags: [private]
```

```Go
func (p Point) Square() int
```

### <a id="InterfaceItem" href="#InterfaceItem">type InterfaceItem struct</a>

```
searchKey: gob.InterfaceItem
tags: [private]
```

```Go
type InterfaceItem struct {
	I             int
	Sq1, Sq2, Sq3 Squarer
	F             float64
	Sq            []Squarer
}
```

A struct with interfaces in it. 

### <a id="NoInterfaceItem" href="#NoInterfaceItem">type NoInterfaceItem struct</a>

```
searchKey: gob.NoInterfaceItem
tags: [private]
```

```Go
type NoInterfaceItem struct {
	I int
	F float64
}
```

The same struct without interfaces 

### <a id="BasicInterfaceItem" href="#BasicInterfaceItem">type BasicInterfaceItem struct</a>

```
searchKey: gob.BasicInterfaceItem
tags: [private]
```

```Go
type BasicInterfaceItem struct {
	Int, Int8, Int16, Int32, Int64      interface{}
	Uint, Uint8, Uint16, Uint32, Uint64 interface{}
	Float32, Float64                    interface{}
	Complex64, Complex128               interface{}
	Bool                                interface{}
	String                              interface{}
	Bytes                               interface{}
}
```

A struct with all basic types, stored in interfaces. 

### <a id="String" href="#String">type String string</a>

```
searchKey: gob.String
tags: [private]
```

```Go
type String string
```

### <a id="PtrInterfaceItem" href="#PtrInterfaceItem">type PtrInterfaceItem struct</a>

```
searchKey: gob.PtrInterfaceItem
tags: [private]
```

```Go
type PtrInterfaceItem struct {
	Str1 interface{} // basic
	Str2 interface{} // derived
}
```

### <a id="U" href="#U">type U struct</a>

```
searchKey: gob.U
tags: [private]
```

```Go
type U struct {
	A int
	B string
	c float64
	D uint
}
```

### <a id="OnTheFly" href="#OnTheFly">type OnTheFly struct</a>

```
searchKey: gob.OnTheFly
tags: [private]
```

```Go
type OnTheFly struct {
	A int
}
```

A type that won't be defined in the gob until we send it in an interface value. 

### <a id="DT" href="#DT">type DT struct</a>

```
searchKey: gob.DT
tags: [private]
```

```Go
type DT struct {
	//	X OnTheFly
	A     int
	B     string
	C     float64
	I     interface{}
	J     interface{}
	I_nil interface{}
	M     map[string]int
	T     [3]int
	S     []string
}
```

#### <a id="newDT" href="#newDT">func newDT() DT</a>

```
searchKey: gob.newDT
tags: [private]
```

```Go
func newDT() DT
```

### <a id="ET0" href="#ET0">type ET0 struct</a>

```
searchKey: gob.ET0
tags: [private]
```

```Go
type ET0 struct {
	A int
	B string
}
```

### <a id="ET2" href="#ET2">type ET2 struct</a>

```
searchKey: gob.ET2
tags: [private]
```

```Go
type ET2 struct {
	X string
}
```

### <a id="ET1" href="#ET1">type ET1 struct</a>

```
searchKey: gob.ET1
tags: [private]
```

```Go
type ET1 struct {
	A    int
	Et2  *ET2
	Next *ET1
}
```

### <a id="ET3" href="#ET3">type ET3 struct</a>

```
searchKey: gob.ET3
tags: [private]
```

```Go
type ET3 struct {
	A             int
	Et2           *ET2
	DifferentNext *ET1
}
```

Like ET1 but with a different name for a field 

### <a id="ET4" href="#ET4">type ET4 struct</a>

```
searchKey: gob.ET4
tags: [private]
```

```Go
type ET4 struct {
	A    int
	Et2  float64
	Next int
}
```

Like ET1 but with a different type for a field 

### <a id="SingleTest" href="#SingleTest">type SingleTest struct</a>

```
searchKey: gob.SingleTest
tags: [private]
```

```Go
type SingleTest struct {
	in  interface{}
	out interface{}
	err string
}
```

### <a id="interfaceIndirectTestI" href="#interfaceIndirectTestI">type interfaceIndirectTestI interface</a>

```
searchKey: gob.interfaceIndirectTestI
tags: [private]
```

```Go
type interfaceIndirectTestI interface {
	F() bool
}
```

### <a id="interfaceIndirectTestT" href="#interfaceIndirectTestT">type interfaceIndirectTestT struct{}</a>

```
searchKey: gob.interfaceIndirectTestT
tags: [private]
```

```Go
type interfaceIndirectTestT struct{}
```

#### <a id="interfaceIndirectTestT.F" href="#interfaceIndirectTestT.F">func (this *interfaceIndirectTestT) F() bool</a>

```
searchKey: gob.interfaceIndirectTestT.F
tags: [private]
```

```Go
func (this *interfaceIndirectTestT) F() bool
```

### <a id="Struct0" href="#Struct0">type Struct0 struct</a>

```
searchKey: gob.Struct0
tags: [private]
```

```Go
type Struct0 struct {
	I interface{}
}
```

### <a id="NewType0" href="#NewType0">type NewType0 struct</a>

```
searchKey: gob.NewType0
tags: [private]
```

```Go
type NewType0 struct {
	S string
}
```

### <a id="ignoreTest" href="#ignoreTest">type ignoreTest struct</a>

```
searchKey: gob.ignoreTest
tags: [private]
```

```Go
type ignoreTest struct {
	in, out interface{}
}
```

### <a id="Bug0Outer" href="#Bug0Outer">type Bug0Outer struct</a>

```
searchKey: gob.Bug0Outer
tags: [private]
```

```Go
type Bug0Outer struct {
	Bug0Field interface{}
}
```

Another bug from golang-nuts, involving nested interfaces. 

### <a id="Bug0Inner" href="#Bug0Inner">type Bug0Inner struct</a>

```
searchKey: gob.Bug0Inner
tags: [private]
```

```Go
type Bug0Inner struct {
	A int
}
```

### <a id="Bug1Elem" href="#Bug1Elem">type Bug1Elem struct</a>

```
searchKey: gob.Bug1Elem
tags: [private]
```

```Go
type Bug1Elem struct {
	Name string
	Id   int
}
```

### <a id="Bug1StructMap" href="#Bug1StructMap">type Bug1StructMap map[string]gob.Bug1Elem</a>

```
searchKey: gob.Bug1StructMap
tags: [private]
```

```Go
type Bug1StructMap map[string]Bug1Elem
```

### <a id="Bug2" href="#Bug2">type Bug2 struct</a>

```
searchKey: gob.Bug2
tags: [private]
```

```Go
type Bug2 struct {
	A   int
	C   chan int
	CP  *chan int
	F   func()
	FPP **func()
}
```

Should be able to have unrepresentable fields (chan, func, *chan etc.); we just ignore them. 

### <a id="Bug3" href="#Bug3">type Bug3 struct</a>

```
searchKey: gob.Bug3
tags: [private]
```

```Go
type Bug3 struct {
	Num      int
	Children []*Bug3
}
```

Mutually recursive slices of structs caused problems. 

### <a id="Bug4Public" href="#Bug4Public">type Bug4Public struct</a>

```
searchKey: gob.Bug4Public
tags: [private]
```

```Go
type Bug4Public struct {
	Name   string
	Secret Bug4Secret
}
```

### <a id="Bug4Secret" href="#Bug4Secret">type Bug4Secret struct</a>

```
searchKey: gob.Bug4Secret
tags: [private]
```

```Go
type Bug4Secret struct {
	a int // error: no exported fields.
}
```

### <a id="Z" href="#Z">type Z struct{}</a>

```
searchKey: gob.Z
tags: [private]
```

```Go
type Z struct {
}
```

### <a id="badDataTest" href="#badDataTest">type badDataTest struct</a>

```
searchKey: gob.badDataTest
tags: [private]
```

```Go
type badDataTest struct {
	input string      // The input encoded as a hex string.
	error string      // A substring of the error that should result.
	data  interface{} // What to decode into.
}
```

### <a id="ByteStruct" href="#ByteStruct">type ByteStruct struct</a>

```
searchKey: gob.ByteStruct
tags: [private]
```

```Go
type ByteStruct struct {
	a byte // not an exported field
}
```

#### <a id="ByteStruct.GobEncode" href="#ByteStruct.GobEncode">func (g *ByteStruct) GobEncode() ([]byte, error)</a>

```
searchKey: gob.ByteStruct.GobEncode
tags: [private]
```

```Go
func (g *ByteStruct) GobEncode() ([]byte, error)
```

#### <a id="ByteStruct.GobDecode" href="#ByteStruct.GobDecode">func (g *ByteStruct) GobDecode(data []byte) error</a>

```
searchKey: gob.ByteStruct.GobDecode
tags: [private]
```

```Go
func (g *ByteStruct) GobDecode(data []byte) error
```

### <a id="StringStruct" href="#StringStruct">type StringStruct struct</a>

```
searchKey: gob.StringStruct
tags: [private]
```

```Go
type StringStruct struct {
	s string // not an exported field
}
```

#### <a id="StringStruct.GobEncode" href="#StringStruct.GobEncode">func (g *StringStruct) GobEncode() ([]byte, error)</a>

```
searchKey: gob.StringStruct.GobEncode
tags: [private]
```

```Go
func (g *StringStruct) GobEncode() ([]byte, error)
```

#### <a id="StringStruct.GobDecode" href="#StringStruct.GobDecode">func (g *StringStruct) GobDecode(data []byte) error</a>

```
searchKey: gob.StringStruct.GobDecode
tags: [private]
```

```Go
func (g *StringStruct) GobDecode(data []byte) error
```

### <a id="ArrayStruct" href="#ArrayStruct">type ArrayStruct struct</a>

```
searchKey: gob.ArrayStruct
tags: [private]
```

```Go
type ArrayStruct struct {
	a [8192]byte // not an exported field
}
```

#### <a id="ArrayStruct.GobEncode" href="#ArrayStruct.GobEncode">func (a *ArrayStruct) GobEncode() ([]byte, error)</a>

```
searchKey: gob.ArrayStruct.GobEncode
tags: [private]
```

```Go
func (a *ArrayStruct) GobEncode() ([]byte, error)
```

#### <a id="ArrayStruct.GobDecode" href="#ArrayStruct.GobDecode">func (a *ArrayStruct) GobDecode(data []byte) error</a>

```
searchKey: gob.ArrayStruct.GobDecode
tags: [private]
```

```Go
func (a *ArrayStruct) GobDecode(data []byte) error
```

### <a id="Gobber" href="#Gobber">type Gobber int</a>

```
searchKey: gob.Gobber
tags: [private]
```

```Go
type Gobber int
```

#### <a id="Gobber.GobEncode" href="#Gobber.GobEncode">func (g *Gobber) GobEncode() ([]byte, error)</a>

```
searchKey: gob.Gobber.GobEncode
tags: [private]
```

```Go
func (g *Gobber) GobEncode() ([]byte, error)
```

#### <a id="Gobber.GobDecode" href="#Gobber.GobDecode">func (g *Gobber) GobDecode(data []byte) error</a>

```
searchKey: gob.Gobber.GobDecode
tags: [private]
```

```Go
func (g *Gobber) GobDecode(data []byte) error
```

### <a id="ValueGobber" href="#ValueGobber">type ValueGobber string</a>

```
searchKey: gob.ValueGobber
tags: [private]
```

```Go
type ValueGobber string // encodes with a value, decodes with a pointer.

```

#### <a id="ValueGobber.GobEncode" href="#ValueGobber.GobEncode">func (v ValueGobber) GobEncode() ([]byte, error)</a>

```
searchKey: gob.ValueGobber.GobEncode
tags: [private]
```

```Go
func (v ValueGobber) GobEncode() ([]byte, error)
```

#### <a id="ValueGobber.GobDecode" href="#ValueGobber.GobDecode">func (v *ValueGobber) GobDecode(data []byte) error</a>

```
searchKey: gob.ValueGobber.GobDecode
tags: [private]
```

```Go
func (v *ValueGobber) GobDecode(data []byte) error
```

### <a id="BinaryGobber" href="#BinaryGobber">type BinaryGobber int</a>

```
searchKey: gob.BinaryGobber
tags: [private]
```

```Go
type BinaryGobber int
```

#### <a id="BinaryGobber.MarshalBinary" href="#BinaryGobber.MarshalBinary">func (g *BinaryGobber) MarshalBinary() ([]byte, error)</a>

```
searchKey: gob.BinaryGobber.MarshalBinary
tags: [private]
```

```Go
func (g *BinaryGobber) MarshalBinary() ([]byte, error)
```

#### <a id="BinaryGobber.UnmarshalBinary" href="#BinaryGobber.UnmarshalBinary">func (g *BinaryGobber) UnmarshalBinary(data []byte) error</a>

```
searchKey: gob.BinaryGobber.UnmarshalBinary
tags: [private]
```

```Go
func (g *BinaryGobber) UnmarshalBinary(data []byte) error
```

### <a id="BinaryValueGobber" href="#BinaryValueGobber">type BinaryValueGobber string</a>

```
searchKey: gob.BinaryValueGobber
tags: [private]
```

```Go
type BinaryValueGobber string
```

#### <a id="BinaryValueGobber.MarshalBinary" href="#BinaryValueGobber.MarshalBinary">func (v BinaryValueGobber) MarshalBinary() ([]byte, error)</a>

```
searchKey: gob.BinaryValueGobber.MarshalBinary
tags: [private]
```

```Go
func (v BinaryValueGobber) MarshalBinary() ([]byte, error)
```

#### <a id="BinaryValueGobber.UnmarshalBinary" href="#BinaryValueGobber.UnmarshalBinary">func (v *BinaryValueGobber) UnmarshalBinary(data []byte) error</a>

```
searchKey: gob.BinaryValueGobber.UnmarshalBinary
tags: [private]
```

```Go
func (v *BinaryValueGobber) UnmarshalBinary(data []byte) error
```

### <a id="TextGobber" href="#TextGobber">type TextGobber int</a>

```
searchKey: gob.TextGobber
tags: [private]
```

```Go
type TextGobber int
```

#### <a id="TextGobber.MarshalText" href="#TextGobber.MarshalText">func (g *TextGobber) MarshalText() ([]byte, error)</a>

```
searchKey: gob.TextGobber.MarshalText
tags: [private]
```

```Go
func (g *TextGobber) MarshalText() ([]byte, error)
```

#### <a id="TextGobber.UnmarshalText" href="#TextGobber.UnmarshalText">func (g *TextGobber) UnmarshalText(data []byte) error</a>

```
searchKey: gob.TextGobber.UnmarshalText
tags: [private]
```

```Go
func (g *TextGobber) UnmarshalText(data []byte) error
```

### <a id="TextValueGobber" href="#TextValueGobber">type TextValueGobber string</a>

```
searchKey: gob.TextValueGobber
tags: [private]
```

```Go
type TextValueGobber string
```

#### <a id="TextValueGobber.MarshalText" href="#TextValueGobber.MarshalText">func (v TextValueGobber) MarshalText() ([]byte, error)</a>

```
searchKey: gob.TextValueGobber.MarshalText
tags: [private]
```

```Go
func (v TextValueGobber) MarshalText() ([]byte, error)
```

#### <a id="TextValueGobber.UnmarshalText" href="#TextValueGobber.UnmarshalText">func (v *TextValueGobber) UnmarshalText(data []byte) error</a>

```
searchKey: gob.TextValueGobber.UnmarshalText
tags: [private]
```

```Go
func (v *TextValueGobber) UnmarshalText(data []byte) error
```

### <a id="GobTest0" href="#GobTest0">type GobTest0 struct</a>

```
searchKey: gob.GobTest0
tags: [private]
```

```Go
type GobTest0 struct {
	X int // guarantee we have  something in common with GobTest*
	G *ByteStruct
}
```

### <a id="GobTest1" href="#GobTest1">type GobTest1 struct</a>

```
searchKey: gob.GobTest1
tags: [private]
```

```Go
type GobTest1 struct {
	X int // guarantee we have  something in common with GobTest*
	G *StringStruct
}
```

### <a id="GobTest2" href="#GobTest2">type GobTest2 struct</a>

```
searchKey: gob.GobTest2
tags: [private]
```

```Go
type GobTest2 struct {
	X int    // guarantee we have  something in common with GobTest*
	G string // not a GobEncoder - should give us errors
}
```

### <a id="GobTest3" href="#GobTest3">type GobTest3 struct</a>

```
searchKey: gob.GobTest3
tags: [private]
```

```Go
type GobTest3 struct {
	X int // guarantee we have  something in common with GobTest*
	G *Gobber
	B *BinaryGobber
	T *TextGobber
}
```

### <a id="GobTest4" href="#GobTest4">type GobTest4 struct</a>

```
searchKey: gob.GobTest4
tags: [private]
```

```Go
type GobTest4 struct {
	X  int // guarantee we have  something in common with GobTest*
	V  ValueGobber
	BV BinaryValueGobber
	TV TextValueGobber
}
```

### <a id="GobTest5" href="#GobTest5">type GobTest5 struct</a>

```
searchKey: gob.GobTest5
tags: [private]
```

```Go
type GobTest5 struct {
	X  int // guarantee we have  something in common with GobTest*
	V  *ValueGobber
	BV *BinaryValueGobber
	TV *TextValueGobber
}
```

### <a id="GobTest6" href="#GobTest6">type GobTest6 struct</a>

```
searchKey: gob.GobTest6
tags: [private]
```

```Go
type GobTest6 struct {
	X  int // guarantee we have  something in common with GobTest*
	V  ValueGobber
	W  *ValueGobber
	BV BinaryValueGobber
	BW *BinaryValueGobber
	TV TextValueGobber
	TW *TextValueGobber
}
```

### <a id="GobTest7" href="#GobTest7">type GobTest7 struct</a>

```
searchKey: gob.GobTest7
tags: [private]
```

```Go
type GobTest7 struct {
	X  int // guarantee we have  something in common with GobTest*
	V  *ValueGobber
	W  ValueGobber
	BV *BinaryValueGobber
	BW BinaryValueGobber
	TV *TextValueGobber
	TW TextValueGobber
}
```

### <a id="GobTestIgnoreEncoder" href="#GobTestIgnoreEncoder">type GobTestIgnoreEncoder struct</a>

```
searchKey: gob.GobTestIgnoreEncoder
tags: [private]
```

```Go
type GobTestIgnoreEncoder struct {
	X int // guarantee we have  something in common with GobTest*
}
```

### <a id="GobTestValueEncDec" href="#GobTestValueEncDec">type GobTestValueEncDec struct</a>

```
searchKey: gob.GobTestValueEncDec
tags: [private]
```

```Go
type GobTestValueEncDec struct {
	X int          // guarantee we have  something in common with GobTest*
	G StringStruct // not a pointer.
}
```

### <a id="GobTestIndirectEncDec" href="#GobTestIndirectEncDec">type GobTestIndirectEncDec struct</a>

```
searchKey: gob.GobTestIndirectEncDec
tags: [private]
```

```Go
type GobTestIndirectEncDec struct {
	X int             // guarantee we have  something in common with GobTest*
	G ***StringStruct // indirections to the receiver.
}
```

### <a id="GobTestArrayEncDec" href="#GobTestArrayEncDec">type GobTestArrayEncDec struct</a>

```
searchKey: gob.GobTestArrayEncDec
tags: [private]
```

```Go
type GobTestArrayEncDec struct {
	X int         // guarantee we have  something in common with GobTest*
	A ArrayStruct // not a pointer.
}
```

### <a id="GobTestIndirectArrayEncDec" href="#GobTestIndirectArrayEncDec">type GobTestIndirectArrayEncDec struct</a>

```
searchKey: gob.GobTestIndirectArrayEncDec
tags: [private]
```

```Go
type GobTestIndirectArrayEncDec struct {
	X int            // guarantee we have  something in common with GobTest*
	A ***ArrayStruct // indirections to a large receiver.
}
```

### <a id="gobDecoderBug0" href="#gobDecoderBug0">type gobDecoderBug0 struct</a>

```
searchKey: gob.gobDecoderBug0
tags: [private]
```

```Go
type gobDecoderBug0 struct {
	foo, bar string
}
```

#### <a id="gobDecoderBug0.String" href="#gobDecoderBug0.String">func (br *gobDecoderBug0) String() string</a>

```
searchKey: gob.gobDecoderBug0.String
tags: [private]
```

```Go
func (br *gobDecoderBug0) String() string
```

#### <a id="gobDecoderBug0.GobEncode" href="#gobDecoderBug0.GobEncode">func (br *gobDecoderBug0) GobEncode() ([]byte, error)</a>

```
searchKey: gob.gobDecoderBug0.GobEncode
tags: [private]
```

```Go
func (br *gobDecoderBug0) GobEncode() ([]byte, error)
```

#### <a id="gobDecoderBug0.GobDecode" href="#gobDecoderBug0.GobDecode">func (br *gobDecoderBug0) GobDecode(b []byte) error</a>

```
searchKey: gob.gobDecoderBug0.GobDecode
tags: [private]
```

```Go
func (br *gobDecoderBug0) GobDecode(b []byte) error
```

### <a id="isZeroBug" href="#isZeroBug">type isZeroBug struct</a>

```
searchKey: gob.isZeroBug
tags: [private]
```

```Go
type isZeroBug struct {
	T time.Time
	S string
	I int
	A isZeroBugArray
	F isZeroBugInterface
}
```

Another bug: this caused a crash with the new Go1 Time type. We throw in a gob-encoding array, to test another case of isZero, and a struct containing a nil interface, to test a third. 

### <a id="isZeroBugArray" href="#isZeroBugArray">type isZeroBugArray [2]uint8</a>

```
searchKey: gob.isZeroBugArray
tags: [private]
```

```Go
type isZeroBugArray [2]uint8
```

#### <a id="isZeroBugArray.GobEncode" href="#isZeroBugArray.GobEncode">func (a isZeroBugArray) GobEncode() (b []byte, e error)</a>

```
searchKey: gob.isZeroBugArray.GobEncode
tags: [private]
```

```Go
func (a isZeroBugArray) GobEncode() (b []byte, e error)
```

Receiver is value, not pointer, to test isZero of array. 

#### <a id="isZeroBugArray.GobDecode" href="#isZeroBugArray.GobDecode">func (a *isZeroBugArray) GobDecode(data []byte) error</a>

```
searchKey: gob.isZeroBugArray.GobDecode
tags: [private]
```

```Go
func (a *isZeroBugArray) GobDecode(data []byte) error
```

### <a id="isZeroBugInterface" href="#isZeroBugInterface">type isZeroBugInterface struct</a>

```
searchKey: gob.isZeroBugInterface
tags: [private]
```

```Go
type isZeroBugInterface struct {
	I interface{}
}
```

#### <a id="isZeroBugInterface.GobEncode" href="#isZeroBugInterface.GobEncode">func (i isZeroBugInterface) GobEncode() (b []byte, e error)</a>

```
searchKey: gob.isZeroBugInterface.GobEncode
tags: [private]
```

```Go
func (i isZeroBugInterface) GobEncode() (b []byte, e error)
```

#### <a id="isZeroBugInterface.GobDecode" href="#isZeroBugInterface.GobDecode">func (i *isZeroBugInterface) GobDecode(data []byte) error</a>

```
searchKey: gob.isZeroBugInterface.GobDecode
tags: [private]
```

```Go
func (i *isZeroBugInterface) GobDecode(data []byte) error
```

### <a id="Bench" href="#Bench">type Bench struct</a>

```
searchKey: gob.Bench
tags: [private]
```

```Go
type Bench struct {
	A int
	B float64
	C string
	D []byte
}
```

### <a id="benchmarkBuf" href="#benchmarkBuf">type benchmarkBuf struct</a>

```
searchKey: gob.benchmarkBuf
tags: [private]
```

```Go
type benchmarkBuf struct {
	offset int
	data   []byte
}
```

benchmarkBuf is a read buffer we can reset 

#### <a id="benchmarkBuf.Read" href="#benchmarkBuf.Read">func (b *benchmarkBuf) Read(p []byte) (n int, err error)</a>

```
searchKey: gob.benchmarkBuf.Read
tags: [private]
```

```Go
func (b *benchmarkBuf) Read(p []byte) (n int, err error)
```

#### <a id="benchmarkBuf.ReadByte" href="#benchmarkBuf.ReadByte">func (b *benchmarkBuf) ReadByte() (c byte, err error)</a>

```
searchKey: gob.benchmarkBuf.ReadByte
tags: [private]
```

```Go
func (b *benchmarkBuf) ReadByte() (c byte, err error)
```

#### <a id="benchmarkBuf.reset" href="#benchmarkBuf.reset">func (b *benchmarkBuf) reset()</a>

```
searchKey: gob.benchmarkBuf.reset
tags: [private]
```

```Go
func (b *benchmarkBuf) reset()
```

### <a id="typeT" href="#typeT">type typeT struct</a>

```
searchKey: gob.typeT
tags: [private]
```

```Go
type typeT struct {
	id  typeId
	str string
}
```

### <a id="Bar" href="#Bar">type Bar struct</a>

```
searchKey: gob.Bar
tags: [private]
```

```Go
type Bar struct {
	X string
}
```

### <a id="Foo" href="#Foo">type Foo struct</a>

```
searchKey: gob.Foo
tags: [private]
```

```Go
type Foo struct {
	A int
	B int32 // will become int
	C string
	D []byte
	E *float64    // will become float64
	F ****float64 // will become float64
	G *Bar
	H *Bar // should not interpolate the definition of Bar again
	I *Foo // will not explode
}
```

This structure has pointers and refers to itself, making it a good test case. 

### <a id="N1" href="#N1">type N1 struct{}</a>

```
searchKey: gob.N1
tags: [private]
```

```Go
type N1 struct{}
```

### <a id="N2" href="#N2">type N2 struct{}</a>

```
searchKey: gob.N2
tags: [private]
```

```Go
type N2 struct{}
```

## <a id="func" href="#func">Functions</a>

### <a id="decBoolArray" href="#decBoolArray">func decBoolArray(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decBoolArray
tags: [private]
```

```Go
func decBoolArray(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decBoolSlice" href="#decBoolSlice">func decBoolSlice(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decBoolSlice
tags: [private]
```

```Go
func decBoolSlice(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decComplex64Array" href="#decComplex64Array">func decComplex64Array(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decComplex64Array
tags: [private]
```

```Go
func decComplex64Array(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decComplex64Slice" href="#decComplex64Slice">func decComplex64Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decComplex64Slice
tags: [private]
```

```Go
func decComplex64Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decComplex128Array" href="#decComplex128Array">func decComplex128Array(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decComplex128Array
tags: [private]
```

```Go
func decComplex128Array(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decComplex128Slice" href="#decComplex128Slice">func decComplex128Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decComplex128Slice
tags: [private]
```

```Go
func decComplex128Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decFloat32Array" href="#decFloat32Array">func decFloat32Array(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decFloat32Array
tags: [private]
```

```Go
func decFloat32Array(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decFloat32Slice" href="#decFloat32Slice">func decFloat32Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decFloat32Slice
tags: [private]
```

```Go
func decFloat32Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decFloat64Array" href="#decFloat64Array">func decFloat64Array(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decFloat64Array
tags: [private]
```

```Go
func decFloat64Array(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decFloat64Slice" href="#decFloat64Slice">func decFloat64Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decFloat64Slice
tags: [private]
```

```Go
func decFloat64Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decIntArray" href="#decIntArray">func decIntArray(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decIntArray
tags: [private]
```

```Go
func decIntArray(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decIntSlice" href="#decIntSlice">func decIntSlice(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decIntSlice
tags: [private]
```

```Go
func decIntSlice(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decInt16Array" href="#decInt16Array">func decInt16Array(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decInt16Array
tags: [private]
```

```Go
func decInt16Array(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decInt16Slice" href="#decInt16Slice">func decInt16Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decInt16Slice
tags: [private]
```

```Go
func decInt16Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decInt32Array" href="#decInt32Array">func decInt32Array(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decInt32Array
tags: [private]
```

```Go
func decInt32Array(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decInt32Slice" href="#decInt32Slice">func decInt32Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decInt32Slice
tags: [private]
```

```Go
func decInt32Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decInt64Array" href="#decInt64Array">func decInt64Array(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decInt64Array
tags: [private]
```

```Go
func decInt64Array(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decInt64Slice" href="#decInt64Slice">func decInt64Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decInt64Slice
tags: [private]
```

```Go
func decInt64Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decInt8Array" href="#decInt8Array">func decInt8Array(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decInt8Array
tags: [private]
```

```Go
func decInt8Array(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decInt8Slice" href="#decInt8Slice">func decInt8Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decInt8Slice
tags: [private]
```

```Go
func decInt8Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decStringArray" href="#decStringArray">func decStringArray(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decStringArray
tags: [private]
```

```Go
func decStringArray(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decStringSlice" href="#decStringSlice">func decStringSlice(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decStringSlice
tags: [private]
```

```Go
func decStringSlice(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decUintArray" href="#decUintArray">func decUintArray(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decUintArray
tags: [private]
```

```Go
func decUintArray(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decUintSlice" href="#decUintSlice">func decUintSlice(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decUintSlice
tags: [private]
```

```Go
func decUintSlice(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decUint16Array" href="#decUint16Array">func decUint16Array(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decUint16Array
tags: [private]
```

```Go
func decUint16Array(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decUint16Slice" href="#decUint16Slice">func decUint16Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decUint16Slice
tags: [private]
```

```Go
func decUint16Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decUint32Array" href="#decUint32Array">func decUint32Array(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decUint32Array
tags: [private]
```

```Go
func decUint32Array(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decUint32Slice" href="#decUint32Slice">func decUint32Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decUint32Slice
tags: [private]
```

```Go
func decUint32Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decUint64Array" href="#decUint64Array">func decUint64Array(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decUint64Array
tags: [private]
```

```Go
func decUint64Array(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decUint64Slice" href="#decUint64Slice">func decUint64Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decUint64Slice
tags: [private]
```

```Go
func decUint64Slice(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decUintptrArray" href="#decUintptrArray">func decUintptrArray(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decUintptrArray
tags: [private]
```

```Go
func decUintptrArray(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="decUintptrSlice" href="#decUintptrSlice">func decUintptrSlice(state *decoderState, v reflect.Value, length int, ovfl error) bool</a>

```
searchKey: gob.decUintptrSlice
tags: [private]
```

```Go
func decUintptrSlice(state *decoderState, v reflect.Value, length int, ovfl error) bool
```

### <a id="overflow" href="#overflow">func overflow(name string) error</a>

```
searchKey: gob.overflow
tags: [private]
```

```Go
func overflow(name string) error
```

### <a id="decodeUintReader" href="#decodeUintReader">func decodeUintReader(r io.Reader, buf []byte) (x uint64, width int, err error)</a>

```
searchKey: gob.decodeUintReader
tags: [private]
```

```Go
func decodeUintReader(r io.Reader, buf []byte) (x uint64, width int, err error)
```

decodeUintReader reads an encoded unsigned integer from an io.Reader. Used only by the Decoder to read the message length. 

### <a id="ignoreUint" href="#ignoreUint">func ignoreUint(i *decInstr, state *decoderState, v reflect.Value)</a>

```
searchKey: gob.ignoreUint
tags: [private]
```

```Go
func ignoreUint(i *decInstr, state *decoderState, v reflect.Value)
```

ignoreUint discards a uint value with no destination. 

### <a id="ignoreTwoUints" href="#ignoreTwoUints">func ignoreTwoUints(i *decInstr, state *decoderState, v reflect.Value)</a>

```
searchKey: gob.ignoreTwoUints
tags: [private]
```

```Go
func ignoreTwoUints(i *decInstr, state *decoderState, v reflect.Value)
```

ignoreTwoUints discards a uint value with no destination. It's used to skip complex values. 

### <a id="decAlloc" href="#decAlloc">func decAlloc(v reflect.Value) reflect.Value</a>

```
searchKey: gob.decAlloc
tags: [private]
```

```Go
func decAlloc(v reflect.Value) reflect.Value
```

decAlloc takes a value and returns a settable value that can be assigned to. If the value is a pointer, decAlloc guarantees it points to storage. The callers to the individual decoders are expected to have used decAlloc. The individual decoders don't need to it. 

### <a id="decBool" href="#decBool">func decBool(i *decInstr, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.decBool
tags: [private]
```

```Go
func decBool(i *decInstr, state *decoderState, value reflect.Value)
```

decBool decodes a uint and stores it as a boolean in value. 

### <a id="decInt8" href="#decInt8">func decInt8(i *decInstr, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.decInt8
tags: [private]
```

```Go
func decInt8(i *decInstr, state *decoderState, value reflect.Value)
```

decInt8 decodes an integer and stores it as an int8 in value. 

### <a id="decUint8" href="#decUint8">func decUint8(i *decInstr, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.decUint8
tags: [private]
```

```Go
func decUint8(i *decInstr, state *decoderState, value reflect.Value)
```

decUint8 decodes an unsigned integer and stores it as a uint8 in value. 

### <a id="decInt16" href="#decInt16">func decInt16(i *decInstr, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.decInt16
tags: [private]
```

```Go
func decInt16(i *decInstr, state *decoderState, value reflect.Value)
```

decInt16 decodes an integer and stores it as an int16 in value. 

### <a id="decUint16" href="#decUint16">func decUint16(i *decInstr, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.decUint16
tags: [private]
```

```Go
func decUint16(i *decInstr, state *decoderState, value reflect.Value)
```

decUint16 decodes an unsigned integer and stores it as a uint16 in value. 

### <a id="decInt32" href="#decInt32">func decInt32(i *decInstr, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.decInt32
tags: [private]
```

```Go
func decInt32(i *decInstr, state *decoderState, value reflect.Value)
```

decInt32 decodes an integer and stores it as an int32 in value. 

### <a id="decUint32" href="#decUint32">func decUint32(i *decInstr, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.decUint32
tags: [private]
```

```Go
func decUint32(i *decInstr, state *decoderState, value reflect.Value)
```

decUint32 decodes an unsigned integer and stores it as a uint32 in value. 

### <a id="decInt64" href="#decInt64">func decInt64(i *decInstr, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.decInt64
tags: [private]
```

```Go
func decInt64(i *decInstr, state *decoderState, value reflect.Value)
```

decInt64 decodes an integer and stores it as an int64 in value. 

### <a id="decUint64" href="#decUint64">func decUint64(i *decInstr, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.decUint64
tags: [private]
```

```Go
func decUint64(i *decInstr, state *decoderState, value reflect.Value)
```

decUint64 decodes an unsigned integer and stores it as a uint64 in value. 

### <a id="float64FromBits" href="#float64FromBits">func float64FromBits(u uint64) float64</a>

```
searchKey: gob.float64FromBits
tags: [private]
```

```Go
func float64FromBits(u uint64) float64
```

Floating-point numbers are transmitted as uint64s holding the bits of the underlying representation. They are sent byte-reversed, with the exponent end coming out first, so integer floating point numbers (for example) transmit more compactly. This routine does the unswizzling. 

### <a id="float32FromBits" href="#float32FromBits">func float32FromBits(u uint64, ovfl error) float64</a>

```
searchKey: gob.float32FromBits
tags: [private]
```

```Go
func float32FromBits(u uint64, ovfl error) float64
```

float32FromBits decodes an unsigned integer, treats it as a 32-bit floating-point number, and returns it. It's a helper function for float32 and complex64. It returns a float64 because that's what reflection needs, but its return value is known to be accurately representable in a float32. 

### <a id="decFloat32" href="#decFloat32">func decFloat32(i *decInstr, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.decFloat32
tags: [private]
```

```Go
func decFloat32(i *decInstr, state *decoderState, value reflect.Value)
```

decFloat32 decodes an unsigned integer, treats it as a 32-bit floating-point number, and stores it in value. 

### <a id="decFloat64" href="#decFloat64">func decFloat64(i *decInstr, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.decFloat64
tags: [private]
```

```Go
func decFloat64(i *decInstr, state *decoderState, value reflect.Value)
```

decFloat64 decodes an unsigned integer, treats it as a 64-bit floating-point number, and stores it in value. 

### <a id="decComplex64" href="#decComplex64">func decComplex64(i *decInstr, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.decComplex64
tags: [private]
```

```Go
func decComplex64(i *decInstr, state *decoderState, value reflect.Value)
```

decComplex64 decodes a pair of unsigned integers, treats them as a pair of floating point numbers, and stores them as a complex64 in value. The real part comes first. 

### <a id="decComplex128" href="#decComplex128">func decComplex128(i *decInstr, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.decComplex128
tags: [private]
```

```Go
func decComplex128(i *decInstr, state *decoderState, value reflect.Value)
```

decComplex128 decodes a pair of unsigned integers, treats them as a pair of floating point numbers, and stores them as a complex128 in value. The real part comes first. 

### <a id="decUint8Slice" href="#decUint8Slice">func decUint8Slice(i *decInstr, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.decUint8Slice
tags: [private]
```

```Go
func decUint8Slice(i *decInstr, state *decoderState, value reflect.Value)
```

decUint8Slice decodes a byte slice and stores in value a slice header describing the data. uint8 slices are encoded as an unsigned count followed by the raw bytes. 

### <a id="decString" href="#decString">func decString(i *decInstr, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.decString
tags: [private]
```

```Go
func decString(i *decInstr, state *decoderState, value reflect.Value)
```

decString decodes byte array and stores in value a string header describing the data. Strings are encoded as an unsigned count followed by the raw bytes. 

### <a id="ignoreUint8Array" href="#ignoreUint8Array">func ignoreUint8Array(i *decInstr, state *decoderState, value reflect.Value)</a>

```
searchKey: gob.ignoreUint8Array
tags: [private]
```

```Go
func ignoreUint8Array(i *decInstr, state *decoderState, value reflect.Value)
```

ignoreUint8Array skips over the data for a byte slice value with no destination. 

### <a id="decodeIntoValue" href="#decodeIntoValue">func decodeIntoValue(state *decoderState, op decOp, isPtr bool, value reflect.Value, instr *decInstr) reflect.Value</a>

```
searchKey: gob.decodeIntoValue
tags: [private]
```

```Go
func decodeIntoValue(state *decoderState, op decOp, isPtr bool, value reflect.Value, instr *decInstr) reflect.Value
```

decodeIntoValue is a helper for map decoding. 

### <a id="init.decode.go" href="#init.decode.go">func init()</a>

```
searchKey: gob.init
tags: [private]
```

```Go
func init()
```

### <a id="allocValue" href="#allocValue">func allocValue(t reflect.Type) reflect.Value</a>

```
searchKey: gob.allocValue
tags: [private]
```

```Go
func allocValue(t reflect.Type) reflect.Value
```

Gob depends on being able to take the address of zeroed Values it creates, so use this wrapper instead of the standard reflect.Zero. Each call allocates once. 

### <a id="toInt" href="#toInt">func toInt(x uint64) int64</a>

```
searchKey: gob.toInt
tags: [private]
```

```Go
func toInt(x uint64) int64
```

toInt turns an encoded uint64 into an int, according to the marshaling rules. 

### <a id="encBoolArray" href="#encBoolArray">func encBoolArray(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encBoolArray
tags: [private]
```

```Go
func encBoolArray(state *encoderState, v reflect.Value) bool
```

### <a id="encBoolSlice" href="#encBoolSlice">func encBoolSlice(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encBoolSlice
tags: [private]
```

```Go
func encBoolSlice(state *encoderState, v reflect.Value) bool
```

### <a id="encComplex64Array" href="#encComplex64Array">func encComplex64Array(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encComplex64Array
tags: [private]
```

```Go
func encComplex64Array(state *encoderState, v reflect.Value) bool
```

### <a id="encComplex64Slice" href="#encComplex64Slice">func encComplex64Slice(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encComplex64Slice
tags: [private]
```

```Go
func encComplex64Slice(state *encoderState, v reflect.Value) bool
```

### <a id="encComplex128Array" href="#encComplex128Array">func encComplex128Array(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encComplex128Array
tags: [private]
```

```Go
func encComplex128Array(state *encoderState, v reflect.Value) bool
```

### <a id="encComplex128Slice" href="#encComplex128Slice">func encComplex128Slice(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encComplex128Slice
tags: [private]
```

```Go
func encComplex128Slice(state *encoderState, v reflect.Value) bool
```

### <a id="encFloat32Array" href="#encFloat32Array">func encFloat32Array(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encFloat32Array
tags: [private]
```

```Go
func encFloat32Array(state *encoderState, v reflect.Value) bool
```

### <a id="encFloat32Slice" href="#encFloat32Slice">func encFloat32Slice(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encFloat32Slice
tags: [private]
```

```Go
func encFloat32Slice(state *encoderState, v reflect.Value) bool
```

### <a id="encFloat64Array" href="#encFloat64Array">func encFloat64Array(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encFloat64Array
tags: [private]
```

```Go
func encFloat64Array(state *encoderState, v reflect.Value) bool
```

### <a id="encFloat64Slice" href="#encFloat64Slice">func encFloat64Slice(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encFloat64Slice
tags: [private]
```

```Go
func encFloat64Slice(state *encoderState, v reflect.Value) bool
```

### <a id="encIntArray" href="#encIntArray">func encIntArray(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encIntArray
tags: [private]
```

```Go
func encIntArray(state *encoderState, v reflect.Value) bool
```

### <a id="encIntSlice" href="#encIntSlice">func encIntSlice(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encIntSlice
tags: [private]
```

```Go
func encIntSlice(state *encoderState, v reflect.Value) bool
```

### <a id="encInt16Array" href="#encInt16Array">func encInt16Array(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encInt16Array
tags: [private]
```

```Go
func encInt16Array(state *encoderState, v reflect.Value) bool
```

### <a id="encInt16Slice" href="#encInt16Slice">func encInt16Slice(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encInt16Slice
tags: [private]
```

```Go
func encInt16Slice(state *encoderState, v reflect.Value) bool
```

### <a id="encInt32Array" href="#encInt32Array">func encInt32Array(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encInt32Array
tags: [private]
```

```Go
func encInt32Array(state *encoderState, v reflect.Value) bool
```

### <a id="encInt32Slice" href="#encInt32Slice">func encInt32Slice(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encInt32Slice
tags: [private]
```

```Go
func encInt32Slice(state *encoderState, v reflect.Value) bool
```

### <a id="encInt64Array" href="#encInt64Array">func encInt64Array(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encInt64Array
tags: [private]
```

```Go
func encInt64Array(state *encoderState, v reflect.Value) bool
```

### <a id="encInt64Slice" href="#encInt64Slice">func encInt64Slice(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encInt64Slice
tags: [private]
```

```Go
func encInt64Slice(state *encoderState, v reflect.Value) bool
```

### <a id="encInt8Array" href="#encInt8Array">func encInt8Array(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encInt8Array
tags: [private]
```

```Go
func encInt8Array(state *encoderState, v reflect.Value) bool
```

### <a id="encInt8Slice" href="#encInt8Slice">func encInt8Slice(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encInt8Slice
tags: [private]
```

```Go
func encInt8Slice(state *encoderState, v reflect.Value) bool
```

### <a id="encStringArray" href="#encStringArray">func encStringArray(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encStringArray
tags: [private]
```

```Go
func encStringArray(state *encoderState, v reflect.Value) bool
```

### <a id="encStringSlice" href="#encStringSlice">func encStringSlice(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encStringSlice
tags: [private]
```

```Go
func encStringSlice(state *encoderState, v reflect.Value) bool
```

### <a id="encUintArray" href="#encUintArray">func encUintArray(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encUintArray
tags: [private]
```

```Go
func encUintArray(state *encoderState, v reflect.Value) bool
```

### <a id="encUintSlice" href="#encUintSlice">func encUintSlice(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encUintSlice
tags: [private]
```

```Go
func encUintSlice(state *encoderState, v reflect.Value) bool
```

### <a id="encUint16Array" href="#encUint16Array">func encUint16Array(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encUint16Array
tags: [private]
```

```Go
func encUint16Array(state *encoderState, v reflect.Value) bool
```

### <a id="encUint16Slice" href="#encUint16Slice">func encUint16Slice(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encUint16Slice
tags: [private]
```

```Go
func encUint16Slice(state *encoderState, v reflect.Value) bool
```

### <a id="encUint32Array" href="#encUint32Array">func encUint32Array(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encUint32Array
tags: [private]
```

```Go
func encUint32Array(state *encoderState, v reflect.Value) bool
```

### <a id="encUint32Slice" href="#encUint32Slice">func encUint32Slice(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encUint32Slice
tags: [private]
```

```Go
func encUint32Slice(state *encoderState, v reflect.Value) bool
```

### <a id="encUint64Array" href="#encUint64Array">func encUint64Array(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encUint64Array
tags: [private]
```

```Go
func encUint64Array(state *encoderState, v reflect.Value) bool
```

### <a id="encUint64Slice" href="#encUint64Slice">func encUint64Slice(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encUint64Slice
tags: [private]
```

```Go
func encUint64Slice(state *encoderState, v reflect.Value) bool
```

### <a id="encUintptrArray" href="#encUintptrArray">func encUintptrArray(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encUintptrArray
tags: [private]
```

```Go
func encUintptrArray(state *encoderState, v reflect.Value) bool
```

### <a id="encUintptrSlice" href="#encUintptrSlice">func encUintptrSlice(state *encoderState, v reflect.Value) bool</a>

```
searchKey: gob.encUintptrSlice
tags: [private]
```

```Go
func encUintptrSlice(state *encoderState, v reflect.Value) bool
```

### <a id="encIndirect" href="#encIndirect">func encIndirect(pv reflect.Value, indir int) reflect.Value</a>

```
searchKey: gob.encIndirect
tags: [private]
```

```Go
func encIndirect(pv reflect.Value, indir int) reflect.Value
```

encIndirect dereferences pv indir times and returns the result. 

### <a id="encBool" href="#encBool">func encBool(i *encInstr, state *encoderState, v reflect.Value)</a>

```
searchKey: gob.encBool
tags: [private]
```

```Go
func encBool(i *encInstr, state *encoderState, v reflect.Value)
```

encBool encodes the bool referenced by v as an unsigned 0 or 1. 

### <a id="encInt" href="#encInt">func encInt(i *encInstr, state *encoderState, v reflect.Value)</a>

```
searchKey: gob.encInt
tags: [private]
```

```Go
func encInt(i *encInstr, state *encoderState, v reflect.Value)
```

encInt encodes the signed integer (int int8 int16 int32 int64) referenced by v. 

### <a id="encUint" href="#encUint">func encUint(i *encInstr, state *encoderState, v reflect.Value)</a>

```
searchKey: gob.encUint
tags: [private]
```

```Go
func encUint(i *encInstr, state *encoderState, v reflect.Value)
```

encUint encodes the unsigned integer (uint uint8 uint16 uint32 uint64 uintptr) referenced by v. 

### <a id="floatBits" href="#floatBits">func floatBits(f float64) uint64</a>

```
searchKey: gob.floatBits
tags: [private]
```

```Go
func floatBits(f float64) uint64
```

floatBits returns a uint64 holding the bits of a floating-point number. Floating-point numbers are transmitted as uint64s holding the bits of the underlying representation. They are sent byte-reversed, with the exponent end coming out first, so integer floating point numbers (for example) transmit more compactly. This routine does the swizzling. 

### <a id="encFloat" href="#encFloat">func encFloat(i *encInstr, state *encoderState, v reflect.Value)</a>

```
searchKey: gob.encFloat
tags: [private]
```

```Go
func encFloat(i *encInstr, state *encoderState, v reflect.Value)
```

encFloat encodes the floating point value (float32 float64) referenced by v. 

### <a id="encComplex" href="#encComplex">func encComplex(i *encInstr, state *encoderState, v reflect.Value)</a>

```
searchKey: gob.encComplex
tags: [private]
```

```Go
func encComplex(i *encInstr, state *encoderState, v reflect.Value)
```

encComplex encodes the complex value (complex64 complex128) referenced by v. Complex numbers are just a pair of floating-point numbers, real part first. 

### <a id="encUint8Array" href="#encUint8Array">func encUint8Array(i *encInstr, state *encoderState, v reflect.Value)</a>

```
searchKey: gob.encUint8Array
tags: [private]
```

```Go
func encUint8Array(i *encInstr, state *encoderState, v reflect.Value)
```

encUint8Array encodes the byte array referenced by v. Byte arrays are encoded as an unsigned count followed by the raw bytes. 

### <a id="encString" href="#encString">func encString(i *encInstr, state *encoderState, v reflect.Value)</a>

```
searchKey: gob.encString
tags: [private]
```

```Go
func encString(i *encInstr, state *encoderState, v reflect.Value)
```

encString encodes the string referenced by v. Strings are encoded as an unsigned count followed by the raw bytes. 

### <a id="encStructTerminator" href="#encStructTerminator">func encStructTerminator(i *encInstr, state *encoderState, v reflect.Value)</a>

```
searchKey: gob.encStructTerminator
tags: [private]
```

```Go
func encStructTerminator(i *encInstr, state *encoderState, v reflect.Value)
```

encStructTerminator encodes the end of an encoded struct as delta field number of 0. 

### <a id="valid" href="#valid">func valid(v reflect.Value) bool</a>

```
searchKey: gob.valid
tags: [private]
```

```Go
func valid(v reflect.Value) bool
```

valid reports whether the value is valid and a non-nil pointer. (Slices, maps, and chans take care of themselves.) 

### <a id="encodeReflectValue" href="#encodeReflectValue">func encodeReflectValue(state *encoderState, v reflect.Value, op encOp, indir int)</a>

```
searchKey: gob.encodeReflectValue
tags: [private]
```

```Go
func encodeReflectValue(state *encoderState, v reflect.Value, op encOp, indir int)
```

encodeReflectValue is a helper for maps. It encodes the value v. 

### <a id="isZero" href="#isZero">func isZero(val reflect.Value) bool</a>

```
searchKey: gob.isZero
tags: [private]
```

```Go
func isZero(val reflect.Value) bool
```

isZero reports whether the value is the zero of its type. 

### <a id="errorf" href="#errorf">func errorf(format string, args ...interface{})</a>

```
searchKey: gob.errorf
tags: [private]
```

```Go
func errorf(format string, args ...interface{})
```

errorf is like error_ but takes Printf-style arguments to construct an error. It always prefixes the message with "gob: ". 

### <a id="error_" href="#error_">func error_(err error)</a>

```
searchKey: gob.error_
tags: [private]
```

```Go
func error_(err error)
```

error wraps the argument error and uses it as the argument to panic. 

### <a id="catchError" href="#catchError">func catchError(err *error)</a>

```
searchKey: gob.catchError
tags: [private]
```

```Go
func catchError(err *error)
```

catchError is meant to be used as a deferred function to turn a panic(gobError) into a plain error. It overwrites the error return of the function that deferred its call. 

### <a id="implementsInterface" href="#implementsInterface">func implementsInterface(typ, gobEncDecType reflect.Type) (success bool, indir int8)</a>

```
searchKey: gob.implementsInterface
tags: [private]
```

```Go
func implementsInterface(typ, gobEncDecType reflect.Type) (success bool, indir int8)
```

implementsInterface reports whether the type implements the gobEncoder/gobDecoder interface. It also returns the number of indirections required to get to the implementation. 

### <a id="setTypeId" href="#setTypeId">func setTypeId(typ gobType)</a>

```
searchKey: gob.setTypeId
tags: [private]
```

```Go
func setTypeId(typ gobType)
```

### <a id="init.type.go" href="#init.type.go">func init()</a>

```
searchKey: gob.init
tags: [private]
```

```Go
func init()
```

### <a id="isExported" href="#isExported">func isExported(name string) bool</a>

```
searchKey: gob.isExported
tags: [private]
```

```Go
func isExported(name string) bool
```

isExported reports whether this is an exported - upper case - name. 

### <a id="isSent" href="#isSent">func isSent(field *reflect.StructField) bool</a>

```
searchKey: gob.isSent
tags: [private]
```

```Go
func isSent(field *reflect.StructField) bool
```

isSent reports whether this struct field is to be transmitted. It will be transmitted only if it is exported and not a chan or func field or pointer to chan or func. 

### <a id="checkId" href="#checkId">func checkId(want, got typeId)</a>

```
searchKey: gob.checkId
tags: [private]
```

```Go
func checkId(want, got typeId)
```

### <a id="RegisterName" href="#RegisterName">func RegisterName(name string, value interface{})</a>

```
searchKey: gob.RegisterName
```

```Go
func RegisterName(name string, value interface{})
```

RegisterName is like Register but uses the provided name rather than the type's default. 

### <a id="Register" href="#Register">func Register(value interface{})</a>

```
searchKey: gob.Register
```

```Go
func Register(value interface{})
```

Register records a type, identified by a value for that type, under its internal type name. That name will identify the concrete type of a value sent or received as an interface variable. Only types that will be transferred as implementations of interface values need to be registered. Expecting to be used only during initialization, it panics if the mapping between types and names is not a bijection. 

### <a id="registerBasics" href="#registerBasics">func registerBasics()</a>

```
searchKey: gob.registerBasics
tags: [private]
```

```Go
func registerBasics()
```

### <a id="testError" href="#testError">func testError(t *testing.T)</a>

```
searchKey: gob.testError
tags: [private]
```

```Go
func testError(t *testing.T)
```

testError is meant to be used as a deferred function to turn a panic(gobError) into a plain test.Error call. 

### <a id="TestUintCodec" href="#TestUintCodec">func TestUintCodec(t *testing.T)</a>

```
searchKey: gob.TestUintCodec
tags: [private]
```

```Go
func TestUintCodec(t *testing.T)
```

Test basic encode/decode routines for unsigned integers 

### <a id="verifyInt" href="#verifyInt">func verifyInt(i int64, t *testing.T)</a>

```
searchKey: gob.verifyInt
tags: [private]
```

```Go
func verifyInt(i int64, t *testing.T)
```

### <a id="TestIntCodec" href="#TestIntCodec">func TestIntCodec(t *testing.T)</a>

```
searchKey: gob.TestIntCodec
tags: [private]
```

```Go
func TestIntCodec(t *testing.T)
```

Test basic encode/decode routines for signed integers 

### <a id="TestScalarEncInstructions" href="#TestScalarEncInstructions">func TestScalarEncInstructions(t *testing.T)</a>

```
searchKey: gob.TestScalarEncInstructions
tags: [private]
```

```Go
func TestScalarEncInstructions(t *testing.T)
```

Test instruction execution for encoding. Do not run the machine yet; instead do individual instructions crafted by hand. 

### <a id="execDec" href="#execDec">func execDec(instr *decInstr, state *decoderState, t *testing.T, value reflect.Value)</a>

```
searchKey: gob.execDec
tags: [private]
```

```Go
func execDec(instr *decInstr, state *decoderState, t *testing.T, value reflect.Value)
```

### <a id="TestScalarDecInstructions" href="#TestScalarDecInstructions">func TestScalarDecInstructions(t *testing.T)</a>

```
searchKey: gob.TestScalarDecInstructions
tags: [private]
```

```Go
func TestScalarDecInstructions(t *testing.T)
```

Test instruction execution for decoding. Do not run the machine yet; instead do individual instructions crafted by hand. 

### <a id="TestEndToEnd" href="#TestEndToEnd">func TestEndToEnd(t *testing.T)</a>

```
searchKey: gob.TestEndToEnd
tags: [private]
```

```Go
func TestEndToEnd(t *testing.T)
```

### <a id="TestOverflow" href="#TestOverflow">func TestOverflow(t *testing.T)</a>

```
searchKey: gob.TestOverflow
tags: [private]
```

```Go
func TestOverflow(t *testing.T)
```

### <a id="TestNesting" href="#TestNesting">func TestNesting(t *testing.T)</a>

```
searchKey: gob.TestNesting
tags: [private]
```

```Go
func TestNesting(t *testing.T)
```

### <a id="TestAutoIndirection" href="#TestAutoIndirection">func TestAutoIndirection(t *testing.T)</a>

```
searchKey: gob.TestAutoIndirection
tags: [private]
```

```Go
func TestAutoIndirection(t *testing.T)
```

### <a id="TestReorderedFields" href="#TestReorderedFields">func TestReorderedFields(t *testing.T)</a>

```
searchKey: gob.TestReorderedFields
tags: [private]
```

```Go
func TestReorderedFields(t *testing.T)
```

### <a id="TestIgnoredFields" href="#TestIgnoredFields">func TestIgnoredFields(t *testing.T)</a>

```
searchKey: gob.TestIgnoredFields
tags: [private]
```

```Go
func TestIgnoredFields(t *testing.T)
```

### <a id="TestBadRecursiveType" href="#TestBadRecursiveType">func TestBadRecursiveType(t *testing.T)</a>

```
searchKey: gob.TestBadRecursiveType
tags: [private]
```

```Go
func TestBadRecursiveType(t *testing.T)
```

### <a id="TestIndirectSliceMapArray" href="#TestIndirectSliceMapArray">func TestIndirectSliceMapArray(t *testing.T)</a>

```
searchKey: gob.TestIndirectSliceMapArray
tags: [private]
```

```Go
func TestIndirectSliceMapArray(t *testing.T)
```

### <a id="TestInterface" href="#TestInterface">func TestInterface(t *testing.T)</a>

```
searchKey: gob.TestInterface
tags: [private]
```

```Go
func TestInterface(t *testing.T)
```

### <a id="TestInterfaceBasic" href="#TestInterfaceBasic">func TestInterfaceBasic(t *testing.T)</a>

```
searchKey: gob.TestInterfaceBasic
tags: [private]
```

```Go
func TestInterfaceBasic(t *testing.T)
```

### <a id="TestInterfacePointer" href="#TestInterfacePointer">func TestInterfacePointer(t *testing.T)</a>

```
searchKey: gob.TestInterfacePointer
tags: [private]
```

```Go
func TestInterfacePointer(t *testing.T)
```

We'll send pointers; should receive values. Also check that we can register T but send *T. 

### <a id="TestIgnoreInterface" href="#TestIgnoreInterface">func TestIgnoreInterface(t *testing.T)</a>

```
searchKey: gob.TestIgnoreInterface
tags: [private]
```

```Go
func TestIgnoreInterface(t *testing.T)
```

### <a id="TestUnexportedFields" href="#TestUnexportedFields">func TestUnexportedFields(t *testing.T)</a>

```
searchKey: gob.TestUnexportedFields
tags: [private]
```

```Go
func TestUnexportedFields(t *testing.T)
```

### <a id="TestDebugSingleton" href="#TestDebugSingleton">func TestDebugSingleton(t *testing.T)</a>

```
searchKey: gob.TestDebugSingleton
tags: [private]
```

```Go
func TestDebugSingleton(t *testing.T)
```

### <a id="TestDebugStruct" href="#TestDebugStruct">func TestDebugStruct(t *testing.T)</a>

```
searchKey: gob.TestDebugStruct
tags: [private]
```

```Go
func TestDebugStruct(t *testing.T)
```

### <a id="encFuzzDec" href="#encFuzzDec">func encFuzzDec(rng *rand.Rand, in interface{}) error</a>

```
searchKey: gob.encFuzzDec
tags: [private]
```

```Go
func encFuzzDec(rng *rand.Rand, in interface{}) error
```

### <a id="TestFuzz" href="#TestFuzz">func TestFuzz(t *testing.T)</a>

```
searchKey: gob.TestFuzz
tags: [private]
```

```Go
func TestFuzz(t *testing.T)
```

This does some "fuzz testing" by attempting to decode a sequence of random bytes. 

### <a id="TestFuzzRegressions" href="#TestFuzzRegressions">func TestFuzzRegressions(t *testing.T)</a>

```
searchKey: gob.TestFuzzRegressions
tags: [private]
```

```Go
func TestFuzzRegressions(t *testing.T)
```

### <a id="testFuzz" href="#testFuzz">func testFuzz(t *testing.T, seed int64, n int, input ...interface{})</a>

```
searchKey: gob.testFuzz
tags: [private]
```

```Go
func testFuzz(t *testing.T, seed int64, n int, input ...interface{})
```

### <a id="TestFuzzOneByte" href="#TestFuzzOneByte">func TestFuzzOneByte(t *testing.T)</a>

```
searchKey: gob.TestFuzzOneByte
tags: [private]
```

```Go
func TestFuzzOneByte(t *testing.T)
```

TestFuzzOneByte tries to decode corrupted input sequences and checks that no panic occurs. 

### <a id="TestErrorInvalidTypeId" href="#TestErrorInvalidTypeId">func TestErrorInvalidTypeId(t *testing.T)</a>

```
searchKey: gob.TestErrorInvalidTypeId
tags: [private]
```

```Go
func TestErrorInvalidTypeId(t *testing.T)
```

Don't crash, just give error with invalid type id. Issue 9649. 

### <a id="TestBasicEncoderDecoder" href="#TestBasicEncoderDecoder">func TestBasicEncoderDecoder(t *testing.T)</a>

```
searchKey: gob.TestBasicEncoderDecoder
tags: [private]
```

```Go
func TestBasicEncoderDecoder(t *testing.T)
```

Test basic operations in a safe manner. 

### <a id="TestEncodeIntSlice" href="#TestEncodeIntSlice">func TestEncodeIntSlice(t *testing.T)</a>

```
searchKey: gob.TestEncodeIntSlice
tags: [private]
```

```Go
func TestEncodeIntSlice(t *testing.T)
```

### <a id="TestEncoderDecoder" href="#TestEncoderDecoder">func TestEncoderDecoder(t *testing.T)</a>

```
searchKey: gob.TestEncoderDecoder
tags: [private]
```

```Go
func TestEncoderDecoder(t *testing.T)
```

### <a id="badTypeCheck" href="#badTypeCheck">func badTypeCheck(e interface{}, shouldFail bool, msg string, t *testing.T)</a>

```
searchKey: gob.badTypeCheck
tags: [private]
```

```Go
func badTypeCheck(e interface{}, shouldFail bool, msg string, t *testing.T)
```

Run one value through the encoder/decoder, but use the wrong type. Input is always an ET1; we compare it to whatever is under 'e'. 

### <a id="TestWrongTypeDecoder" href="#TestWrongTypeDecoder">func TestWrongTypeDecoder(t *testing.T)</a>

```
searchKey: gob.TestWrongTypeDecoder
tags: [private]
```

```Go
func TestWrongTypeDecoder(t *testing.T)
```

Test that we recognize a bad type the first time. 

### <a id="TestUnsupported" href="#TestUnsupported">func TestUnsupported(t *testing.T)</a>

```
searchKey: gob.TestUnsupported
tags: [private]
```

```Go
func TestUnsupported(t *testing.T)
```

### <a id="encAndDec" href="#encAndDec">func encAndDec(in, out interface{}) error</a>

```
searchKey: gob.encAndDec
tags: [private]
```

```Go
func encAndDec(in, out interface{}) error
```

### <a id="TestTypeToPtrType" href="#TestTypeToPtrType">func TestTypeToPtrType(t *testing.T)</a>

```
searchKey: gob.TestTypeToPtrType
tags: [private]
```

```Go
func TestTypeToPtrType(t *testing.T)
```

### <a id="TestPtrTypeToType" href="#TestPtrTypeToType">func TestPtrTypeToType(t *testing.T)</a>

```
searchKey: gob.TestPtrTypeToType
tags: [private]
```

```Go
func TestPtrTypeToType(t *testing.T)
```

### <a id="TestTypeToPtrPtrPtrPtrType" href="#TestTypeToPtrPtrPtrPtrType">func TestTypeToPtrPtrPtrPtrType(t *testing.T)</a>

```
searchKey: gob.TestTypeToPtrPtrPtrPtrType
tags: [private]
```

```Go
func TestTypeToPtrPtrPtrPtrType(t *testing.T)
```

### <a id="TestSlice" href="#TestSlice">func TestSlice(t *testing.T)</a>

```
searchKey: gob.TestSlice
tags: [private]
```

```Go
func TestSlice(t *testing.T)
```

### <a id="TestValueError" href="#TestValueError">func TestValueError(t *testing.T)</a>

```
searchKey: gob.TestValueError
tags: [private]
```

```Go
func TestValueError(t *testing.T)
```

### <a id="TestArray" href="#TestArray">func TestArray(t *testing.T)</a>

```
searchKey: gob.TestArray
tags: [private]
```

```Go
func TestArray(t *testing.T)
```

### <a id="TestRecursiveMapType" href="#TestRecursiveMapType">func TestRecursiveMapType(t *testing.T)</a>

```
searchKey: gob.TestRecursiveMapType
tags: [private]
```

```Go
func TestRecursiveMapType(t *testing.T)
```

### <a id="TestRecursiveSliceType" href="#TestRecursiveSliceType">func TestRecursiveSliceType(t *testing.T)</a>

```
searchKey: gob.TestRecursiveSliceType
tags: [private]
```

```Go
func TestRecursiveSliceType(t *testing.T)
```

### <a id="TestDefaultsInArray" href="#TestDefaultsInArray">func TestDefaultsInArray(t *testing.T)</a>

```
searchKey: gob.TestDefaultsInArray
tags: [private]
```

```Go
func TestDefaultsInArray(t *testing.T)
```

Regression test for bug: must send zero values inside arrays 

### <a id="TestSingletons" href="#TestSingletons">func TestSingletons(t *testing.T)</a>

```
searchKey: gob.TestSingletons
tags: [private]
```

```Go
func TestSingletons(t *testing.T)
```

### <a id="TestStructNonStruct" href="#TestStructNonStruct">func TestStructNonStruct(t *testing.T)</a>

```
searchKey: gob.TestStructNonStruct
tags: [private]
```

```Go
func TestStructNonStruct(t *testing.T)
```

### <a id="TestInterfaceIndirect" href="#TestInterfaceIndirect">func TestInterfaceIndirect(t *testing.T)</a>

```
searchKey: gob.TestInterfaceIndirect
tags: [private]
```

```Go
func TestInterfaceIndirect(t *testing.T)
```

A version of a bug reported on golang-nuts. Also tests top-level slice of interfaces. The issue was registering *T caused T to be stored as the concrete type. 

### <a id="TestDecodeIntoNothing" href="#TestDecodeIntoNothing">func TestDecodeIntoNothing(t *testing.T)</a>

```
searchKey: gob.TestDecodeIntoNothing
tags: [private]
```

```Go
func TestDecodeIntoNothing(t *testing.T)
```

### <a id="TestIgnoreRecursiveType" href="#TestIgnoreRecursiveType">func TestIgnoreRecursiveType(t *testing.T)</a>

```
searchKey: gob.TestIgnoreRecursiveType
tags: [private]
```

```Go
func TestIgnoreRecursiveType(t *testing.T)
```

### <a id="TestNestedInterfaces" href="#TestNestedInterfaces">func TestNestedInterfaces(t *testing.T)</a>

```
searchKey: gob.TestNestedInterfaces
tags: [private]
```

```Go
func TestNestedInterfaces(t *testing.T)
```

### <a id="TestMapBug1" href="#TestMapBug1">func TestMapBug1(t *testing.T)</a>

```
searchKey: gob.TestMapBug1
tags: [private]
```

```Go
func TestMapBug1(t *testing.T)
```

### <a id="TestGobMapInterfaceEncode" href="#TestGobMapInterfaceEncode">func TestGobMapInterfaceEncode(t *testing.T)</a>

```
searchKey: gob.TestGobMapInterfaceEncode
tags: [private]
```

```Go
func TestGobMapInterfaceEncode(t *testing.T)
```

### <a id="TestSliceReusesMemory" href="#TestSliceReusesMemory">func TestSliceReusesMemory(t *testing.T)</a>

```
searchKey: gob.TestSliceReusesMemory
tags: [private]
```

```Go
func TestSliceReusesMemory(t *testing.T)
```

### <a id="TestBadCount" href="#TestBadCount">func TestBadCount(t *testing.T)</a>

```
searchKey: gob.TestBadCount
tags: [private]
```

```Go
func TestBadCount(t *testing.T)
```

Used to crash: negative count in recvMessage. 

### <a id="TestSequentialDecoder" href="#TestSequentialDecoder">func TestSequentialDecoder(t *testing.T)</a>

```
searchKey: gob.TestSequentialDecoder
tags: [private]
```

```Go
func TestSequentialDecoder(t *testing.T)
```

Verify that sequential Decoders built on a single input will succeed if the input implements ReadByte and there is no type information in the stream. 

### <a id="TestChanFuncIgnored" href="#TestChanFuncIgnored">func TestChanFuncIgnored(t *testing.T)</a>

```
searchKey: gob.TestChanFuncIgnored
tags: [private]
```

```Go
func TestChanFuncIgnored(t *testing.T)
```

### <a id="TestSliceIncompatibility" href="#TestSliceIncompatibility">func TestSliceIncompatibility(t *testing.T)</a>

```
searchKey: gob.TestSliceIncompatibility
tags: [private]
```

```Go
func TestSliceIncompatibility(t *testing.T)
```

### <a id="TestGobPtrSlices" href="#TestGobPtrSlices">func TestGobPtrSlices(t *testing.T)</a>

```
searchKey: gob.TestGobPtrSlices
tags: [private]
```

```Go
func TestGobPtrSlices(t *testing.T)
```

### <a id="TestPtrToMapOfMap" href="#TestPtrToMapOfMap">func TestPtrToMapOfMap(t *testing.T)</a>

```
searchKey: gob.TestPtrToMapOfMap
tags: [private]
```

```Go
func TestPtrToMapOfMap(t *testing.T)
```

getDecEnginePtr cached engine for ut.base instead of ut.user so we passed a *map and then tried to reuse its engine to decode the inner map. 

### <a id="TestCatchInvalidNilValue" href="#TestCatchInvalidNilValue">func TestCatchInvalidNilValue(t *testing.T)</a>

```
searchKey: gob.TestCatchInvalidNilValue
tags: [private]
```

```Go
func TestCatchInvalidNilValue(t *testing.T)
```

Test that untyped nils generate an error, not a panic. See Issue 16204. 

### <a id="TestTopLevelNilPointer" href="#TestTopLevelNilPointer">func TestTopLevelNilPointer(t *testing.T)</a>

```
searchKey: gob.TestTopLevelNilPointer
tags: [private]
```

```Go
func TestTopLevelNilPointer(t *testing.T)
```

A top-level nil pointer generates a panic with a helpful string-valued message. 

### <a id="encodeAndRecover" href="#encodeAndRecover">func encodeAndRecover(value interface{}) (encodeErr, panicErr error)</a>

```
searchKey: gob.encodeAndRecover
tags: [private]
```

```Go
func encodeAndRecover(value interface{}) (encodeErr, panicErr error)
```

### <a id="TestNilPointerPanics" href="#TestNilPointerPanics">func TestNilPointerPanics(t *testing.T)</a>

```
searchKey: gob.TestNilPointerPanics
tags: [private]
```

```Go
func TestNilPointerPanics(t *testing.T)
```

### <a id="TestNilPointerInsideInterface" href="#TestNilPointerInsideInterface">func TestNilPointerInsideInterface(t *testing.T)</a>

```
searchKey: gob.TestNilPointerInsideInterface
tags: [private]
```

```Go
func TestNilPointerInsideInterface(t *testing.T)
```

### <a id="TestMutipleEncodingsOfBadType" href="#TestMutipleEncodingsOfBadType">func TestMutipleEncodingsOfBadType(t *testing.T)</a>

```
searchKey: gob.TestMutipleEncodingsOfBadType
tags: [private]
```

```Go
func TestMutipleEncodingsOfBadType(t *testing.T)
```

Test that a failed compilation doesn't leave around an executable encoder. Issue 3723. 

### <a id="Test29ElementSlice" href="#Test29ElementSlice">func Test29ElementSlice(t *testing.T)</a>

```
searchKey: gob.Test29ElementSlice
tags: [private]
```

```Go
func Test29ElementSlice(t *testing.T)
```

### <a id="TestErrorForHugeSlice" href="#TestErrorForHugeSlice">func TestErrorForHugeSlice(t *testing.T)</a>

```
searchKey: gob.TestErrorForHugeSlice
tags: [private]
```

```Go
func TestErrorForHugeSlice(t *testing.T)
```

Don't crash, just give error when allocating a huge slice. Issue 8084. 

### <a id="TestBadData" href="#TestBadData">func TestBadData(t *testing.T)</a>

```
searchKey: gob.TestBadData
tags: [private]
```

```Go
func TestBadData(t *testing.T)
```

TestBadData tests that various problems caused by malformed input are caught as errors and do not cause panics. 

### <a id="TestDecodeErrorMultipleTypes" href="#TestDecodeErrorMultipleTypes">func TestDecodeErrorMultipleTypes(t *testing.T)</a>

```
searchKey: gob.TestDecodeErrorMultipleTypes
tags: [private]
```

```Go
func TestDecodeErrorMultipleTypes(t *testing.T)
```

### <a id="TestGobEncoderField" href="#TestGobEncoderField">func TestGobEncoderField(t *testing.T)</a>

```
searchKey: gob.TestGobEncoderField
tags: [private]
```

```Go
func TestGobEncoderField(t *testing.T)
```

### <a id="TestGobEncoderValueField" href="#TestGobEncoderValueField">func TestGobEncoderValueField(t *testing.T)</a>

```
searchKey: gob.TestGobEncoderValueField
tags: [private]
```

```Go
func TestGobEncoderValueField(t *testing.T)
```

Even though the field is a value, we can still take its address and should be able to call the methods. 

### <a id="TestGobEncoderIndirectField" href="#TestGobEncoderIndirectField">func TestGobEncoderIndirectField(t *testing.T)</a>

```
searchKey: gob.TestGobEncoderIndirectField
tags: [private]
```

```Go
func TestGobEncoderIndirectField(t *testing.T)
```

GobEncode/Decode should work even if the value is more indirect than the receiver. 

### <a id="TestGobEncoderArrayField" href="#TestGobEncoderArrayField">func TestGobEncoderArrayField(t *testing.T)</a>

```
searchKey: gob.TestGobEncoderArrayField
tags: [private]
```

```Go
func TestGobEncoderArrayField(t *testing.T)
```

Test with a large field with methods. 

### <a id="TestGobEncoderIndirectArrayField" href="#TestGobEncoderIndirectArrayField">func TestGobEncoderIndirectArrayField(t *testing.T)</a>

```
searchKey: gob.TestGobEncoderIndirectArrayField
tags: [private]
```

```Go
func TestGobEncoderIndirectArrayField(t *testing.T)
```

Test an indirection to a large field with methods. 

### <a id="TestGobEncoderFieldsOfDifferentType" href="#TestGobEncoderFieldsOfDifferentType">func TestGobEncoderFieldsOfDifferentType(t *testing.T)</a>

```
searchKey: gob.TestGobEncoderFieldsOfDifferentType
tags: [private]
```

```Go
func TestGobEncoderFieldsOfDifferentType(t *testing.T)
```

As long as the fields have the same name and implement the interface, we can cross-connect them. Not sure it's useful and may even be bad but it works and it's hard to prevent without exposing the contents of the object, which would defeat the purpose. 

### <a id="TestGobEncoderValueEncoder" href="#TestGobEncoderValueEncoder">func TestGobEncoderValueEncoder(t *testing.T)</a>

```
searchKey: gob.TestGobEncoderValueEncoder
tags: [private]
```

```Go
func TestGobEncoderValueEncoder(t *testing.T)
```

Test that we can encode a value and decode into a pointer. 

### <a id="TestGobEncoderValueThenPointer" href="#TestGobEncoderValueThenPointer">func TestGobEncoderValueThenPointer(t *testing.T)</a>

```
searchKey: gob.TestGobEncoderValueThenPointer
tags: [private]
```

```Go
func TestGobEncoderValueThenPointer(t *testing.T)
```

Test that we can use a value then a pointer type of a GobEncoder in the same encoded value. Bug 4647. 

### <a id="TestGobEncoderPointerThenValue" href="#TestGobEncoderPointerThenValue">func TestGobEncoderPointerThenValue(t *testing.T)</a>

```
searchKey: gob.TestGobEncoderPointerThenValue
tags: [private]
```

```Go
func TestGobEncoderPointerThenValue(t *testing.T)
```

Test that we can use a pointer then a value type of a GobEncoder in the same encoded value. 

### <a id="TestGobEncoderFieldTypeError" href="#TestGobEncoderFieldTypeError">func TestGobEncoderFieldTypeError(t *testing.T)</a>

```
searchKey: gob.TestGobEncoderFieldTypeError
tags: [private]
```

```Go
func TestGobEncoderFieldTypeError(t *testing.T)
```

### <a id="TestGobEncoderStructSingleton" href="#TestGobEncoderStructSingleton">func TestGobEncoderStructSingleton(t *testing.T)</a>

```
searchKey: gob.TestGobEncoderStructSingleton
tags: [private]
```

```Go
func TestGobEncoderStructSingleton(t *testing.T)
```

Even though ByteStruct is a struct, it's treated as a singleton at the top level. 

### <a id="TestGobEncoderNonStructSingleton" href="#TestGobEncoderNonStructSingleton">func TestGobEncoderNonStructSingleton(t *testing.T)</a>

```
searchKey: gob.TestGobEncoderNonStructSingleton
tags: [private]
```

```Go
func TestGobEncoderNonStructSingleton(t *testing.T)
```

### <a id="TestGobEncoderIgnoreStructField" href="#TestGobEncoderIgnoreStructField">func TestGobEncoderIgnoreStructField(t *testing.T)</a>

```
searchKey: gob.TestGobEncoderIgnoreStructField
tags: [private]
```

```Go
func TestGobEncoderIgnoreStructField(t *testing.T)
```

### <a id="TestGobEncoderIgnoreNonStructField" href="#TestGobEncoderIgnoreNonStructField">func TestGobEncoderIgnoreNonStructField(t *testing.T)</a>

```
searchKey: gob.TestGobEncoderIgnoreNonStructField
tags: [private]
```

```Go
func TestGobEncoderIgnoreNonStructField(t *testing.T)
```

### <a id="TestGobEncoderIgnoreNilEncoder" href="#TestGobEncoderIgnoreNilEncoder">func TestGobEncoderIgnoreNilEncoder(t *testing.T)</a>

```
searchKey: gob.TestGobEncoderIgnoreNilEncoder
tags: [private]
```

```Go
func TestGobEncoderIgnoreNilEncoder(t *testing.T)
```

### <a id="TestGobEncoderExtraIndirect" href="#TestGobEncoderExtraIndirect">func TestGobEncoderExtraIndirect(t *testing.T)</a>

```
searchKey: gob.TestGobEncoderExtraIndirect
tags: [private]
```

```Go
func TestGobEncoderExtraIndirect(t *testing.T)
```

This was a bug: the receiver has a different indirection level than the variable. 

### <a id="TestGobEncodeIsZero" href="#TestGobEncodeIsZero">func TestGobEncodeIsZero(t *testing.T)</a>

```
searchKey: gob.TestGobEncodeIsZero
tags: [private]
```

```Go
func TestGobEncodeIsZero(t *testing.T)
```

### <a id="TestGobEncodePtrError" href="#TestGobEncodePtrError">func TestGobEncodePtrError(t *testing.T)</a>

```
searchKey: gob.TestGobEncodePtrError
tags: [private]
```

```Go
func TestGobEncodePtrError(t *testing.T)
```

### <a id="TestNetIP" href="#TestNetIP">func TestNetIP(t *testing.T)</a>

```
searchKey: gob.TestNetIP
tags: [private]
```

```Go
func TestNetIP(t *testing.T)
```

### <a id="benchmarkEndToEnd" href="#benchmarkEndToEnd">func benchmarkEndToEnd(b *testing.B, ctor func() interface{}, pipe func() (r io.Reader, w io.Writer, err error))</a>

```
searchKey: gob.benchmarkEndToEnd
tags: [private]
```

```Go
func benchmarkEndToEnd(b *testing.B, ctor func() interface{}, pipe func() (r io.Reader, w io.Writer, err error))
```

### <a id="BenchmarkEndToEndPipe" href="#BenchmarkEndToEndPipe">func BenchmarkEndToEndPipe(b *testing.B)</a>

```
searchKey: gob.BenchmarkEndToEndPipe
tags: [private]
```

```Go
func BenchmarkEndToEndPipe(b *testing.B)
```

### <a id="BenchmarkEndToEndByteBuffer" href="#BenchmarkEndToEndByteBuffer">func BenchmarkEndToEndByteBuffer(b *testing.B)</a>

```
searchKey: gob.BenchmarkEndToEndByteBuffer
tags: [private]
```

```Go
func BenchmarkEndToEndByteBuffer(b *testing.B)
```

### <a id="BenchmarkEndToEndSliceByteBuffer" href="#BenchmarkEndToEndSliceByteBuffer">func BenchmarkEndToEndSliceByteBuffer(b *testing.B)</a>

```
searchKey: gob.BenchmarkEndToEndSliceByteBuffer
tags: [private]
```

```Go
func BenchmarkEndToEndSliceByteBuffer(b *testing.B)
```

### <a id="TestCountEncodeMallocs" href="#TestCountEncodeMallocs">func TestCountEncodeMallocs(t *testing.T)</a>

```
searchKey: gob.TestCountEncodeMallocs
tags: [private]
```

```Go
func TestCountEncodeMallocs(t *testing.T)
```

### <a id="TestCountDecodeMallocs" href="#TestCountDecodeMallocs">func TestCountDecodeMallocs(t *testing.T)</a>

```
searchKey: gob.TestCountDecodeMallocs
tags: [private]
```

```Go
func TestCountDecodeMallocs(t *testing.T)
```

### <a id="benchmarkEncodeSlice" href="#benchmarkEncodeSlice">func benchmarkEncodeSlice(b *testing.B, a interface{})</a>

```
searchKey: gob.benchmarkEncodeSlice
tags: [private]
```

```Go
func benchmarkEncodeSlice(b *testing.B, a interface{})
```

### <a id="BenchmarkEncodeComplex128Slice" href="#BenchmarkEncodeComplex128Slice">func BenchmarkEncodeComplex128Slice(b *testing.B)</a>

```
searchKey: gob.BenchmarkEncodeComplex128Slice
tags: [private]
```

```Go
func BenchmarkEncodeComplex128Slice(b *testing.B)
```

### <a id="BenchmarkEncodeFloat64Slice" href="#BenchmarkEncodeFloat64Slice">func BenchmarkEncodeFloat64Slice(b *testing.B)</a>

```
searchKey: gob.BenchmarkEncodeFloat64Slice
tags: [private]
```

```Go
func BenchmarkEncodeFloat64Slice(b *testing.B)
```

### <a id="BenchmarkEncodeInt32Slice" href="#BenchmarkEncodeInt32Slice">func BenchmarkEncodeInt32Slice(b *testing.B)</a>

```
searchKey: gob.BenchmarkEncodeInt32Slice
tags: [private]
```

```Go
func BenchmarkEncodeInt32Slice(b *testing.B)
```

### <a id="BenchmarkEncodeStringSlice" href="#BenchmarkEncodeStringSlice">func BenchmarkEncodeStringSlice(b *testing.B)</a>

```
searchKey: gob.BenchmarkEncodeStringSlice
tags: [private]
```

```Go
func BenchmarkEncodeStringSlice(b *testing.B)
```

### <a id="BenchmarkEncodeInterfaceSlice" href="#BenchmarkEncodeInterfaceSlice">func BenchmarkEncodeInterfaceSlice(b *testing.B)</a>

```
searchKey: gob.BenchmarkEncodeInterfaceSlice
tags: [private]
```

```Go
func BenchmarkEncodeInterfaceSlice(b *testing.B)
```

### <a id="benchmarkDecodeSlice" href="#benchmarkDecodeSlice">func benchmarkDecodeSlice(b *testing.B, a interface{})</a>

```
searchKey: gob.benchmarkDecodeSlice
tags: [private]
```

```Go
func benchmarkDecodeSlice(b *testing.B, a interface{})
```

### <a id="BenchmarkDecodeComplex128Slice" href="#BenchmarkDecodeComplex128Slice">func BenchmarkDecodeComplex128Slice(b *testing.B)</a>

```
searchKey: gob.BenchmarkDecodeComplex128Slice
tags: [private]
```

```Go
func BenchmarkDecodeComplex128Slice(b *testing.B)
```

### <a id="BenchmarkDecodeFloat64Slice" href="#BenchmarkDecodeFloat64Slice">func BenchmarkDecodeFloat64Slice(b *testing.B)</a>

```
searchKey: gob.BenchmarkDecodeFloat64Slice
tags: [private]
```

```Go
func BenchmarkDecodeFloat64Slice(b *testing.B)
```

### <a id="BenchmarkDecodeInt32Slice" href="#BenchmarkDecodeInt32Slice">func BenchmarkDecodeInt32Slice(b *testing.B)</a>

```
searchKey: gob.BenchmarkDecodeInt32Slice
tags: [private]
```

```Go
func BenchmarkDecodeInt32Slice(b *testing.B)
```

### <a id="BenchmarkDecodeStringSlice" href="#BenchmarkDecodeStringSlice">func BenchmarkDecodeStringSlice(b *testing.B)</a>

```
searchKey: gob.BenchmarkDecodeStringSlice
tags: [private]
```

```Go
func BenchmarkDecodeStringSlice(b *testing.B)
```

### <a id="BenchmarkDecodeInterfaceSlice" href="#BenchmarkDecodeInterfaceSlice">func BenchmarkDecodeInterfaceSlice(b *testing.B)</a>

```
searchKey: gob.BenchmarkDecodeInterfaceSlice
tags: [private]
```

```Go
func BenchmarkDecodeInterfaceSlice(b *testing.B)
```

### <a id="BenchmarkDecodeMap" href="#BenchmarkDecodeMap">func BenchmarkDecodeMap(b *testing.B)</a>

```
searchKey: gob.BenchmarkDecodeMap
tags: [private]
```

```Go
func BenchmarkDecodeMap(b *testing.B)
```

### <a id="TestBasic" href="#TestBasic">func TestBasic(t *testing.T)</a>

```
searchKey: gob.TestBasic
tags: [private]
```

```Go
func TestBasic(t *testing.T)
```

Sanity checks 

### <a id="TestReregistration" href="#TestReregistration">func TestReregistration(t *testing.T)</a>

```
searchKey: gob.TestReregistration
tags: [private]
```

```Go
func TestReregistration(t *testing.T)
```

Reregister some basic types to check registration is idempotent. 

### <a id="TestArrayType" href="#TestArrayType">func TestArrayType(t *testing.T)</a>

```
searchKey: gob.TestArrayType
tags: [private]
```

```Go
func TestArrayType(t *testing.T)
```

### <a id="TestSliceType" href="#TestSliceType">func TestSliceType(t *testing.T)</a>

```
searchKey: gob.TestSliceType
tags: [private]
```

```Go
func TestSliceType(t *testing.T)
```

### <a id="TestMapType" href="#TestMapType">func TestMapType(t *testing.T)</a>

```
searchKey: gob.TestMapType
tags: [private]
```

```Go
func TestMapType(t *testing.T)
```

### <a id="TestStructType" href="#TestStructType">func TestStructType(t *testing.T)</a>

```
searchKey: gob.TestStructType
tags: [private]
```

```Go
func TestStructType(t *testing.T)
```

### <a id="TestRegistration" href="#TestRegistration">func TestRegistration(t *testing.T)</a>

```
searchKey: gob.TestRegistration
tags: [private]
```

```Go
func TestRegistration(t *testing.T)
```

Should be OK to register the same type multiple times, as long as they're at the same level of indirection. 

### <a id="TestRegistrationNaming" href="#TestRegistrationNaming">func TestRegistrationNaming(t *testing.T)</a>

```
searchKey: gob.TestRegistrationNaming
tags: [private]
```

```Go
func TestRegistrationNaming(t *testing.T)
```

See comment in type.go/Register. 

### <a id="TestStressParallel" href="#TestStressParallel">func TestStressParallel(t *testing.T)</a>

```
searchKey: gob.TestStressParallel
tags: [private]
```

```Go
func TestStressParallel(t *testing.T)
```

### <a id="TestTypeRace" href="#TestTypeRace">func TestTypeRace(t *testing.T)</a>

```
searchKey: gob.TestTypeRace
tags: [private]
```

```Go
func TestTypeRace(t *testing.T)
```

Issue 23328. Note that this test name is known to cmd/dist/test.go. 

