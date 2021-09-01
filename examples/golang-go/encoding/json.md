# Package json

Package json implements encoding and decoding of JSON as defined in RFC 7159. The mapping between JSON and Go values is described in the documentation for the Marshal and Unmarshal functions. 

See "JSON and Go" for an introduction to this package: [https://golang.org/doc/articles/json_and_go.html](https://golang.org/doc/articles/json_and_go.html) 

## Index

* [Constants](#const)
    * [const caseMask](#caseMask)
    * [const kelvin](#kelvin)
    * [const maxNestingDepth](#maxNestingDepth)
    * [const parseArrayValue](#parseArrayValue)
    * [const parseObjectKey](#parseObjectKey)
    * [const parseObjectValue](#parseObjectValue)
    * [const phasePanicMsg](#phasePanicMsg)
    * [const scanArrayValue](#scanArrayValue)
    * [const scanBeginArray](#scanBeginArray)
    * [const scanBeginLiteral](#scanBeginLiteral)
    * [const scanBeginObject](#scanBeginObject)
    * [const scanContinue](#scanContinue)
    * [const scanEnd](#scanEnd)
    * [const scanEndArray](#scanEndArray)
    * [const scanEndObject](#scanEndObject)
    * [const scanError](#scanError)
    * [const scanObjectKey](#scanObjectKey)
    * [const scanObjectValue](#scanObjectValue)
    * [const scanSkipSpace](#scanSkipSpace)
    * [const smallLongEss](#smallLongEss)
    * [const startDetectingCyclesAfter](#startDetectingCyclesAfter)
    * [const tokenArrayComma](#tokenArrayComma)
    * [const tokenArrayStart](#tokenArrayStart)
    * [const tokenArrayValue](#tokenArrayValue)
    * [const tokenObjectColon](#tokenObjectColon)
    * [const tokenObjectComma](#tokenObjectComma)
    * [const tokenObjectKey](#tokenObjectKey)
    * [const tokenObjectStart](#tokenObjectStart)
    * [const tokenObjectValue](#tokenObjectValue)
    * [const tokenTopValue](#tokenTopValue)
* [Variables](#var)
    * [var allValue](#allValue)
    * [var allValueCompact](#allValueCompact)
    * [var allValueIndent](#allValueIndent)
    * [var badFloatREs](#badFloatREs)
    * [var badUTF8](#badUTF8)
    * [var blockingTests](#blockingTests)
    * [var codeJSON](#codeJSON)
    * [var codeStruct](#codeStruct)
    * [var decodeTypeErrorTests](#decodeTypeErrorTests)
    * [var encodeStatePool](#encodeStatePool)
    * [var encodeStringTests](#encodeStringTests)
    * [var encoderCache](#encoderCache)
    * [var errMissingU8Prefix](#errMissingU8Prefix)
    * [var ex1](#ex1)
    * [var ex1i](#ex1i)
    * [var examples](#examples)
    * [var fieldCache](#fieldCache)
    * [var float32Encoder](#float32Encoder)
    * [var float64Encoder](#float64Encoder)
    * [var foldTests](#foldTests)
    * [var hex](#hex)
    * [var htmlSafeSet](#htmlSafeSet)
    * [var ifaceNumAsFloat64](#ifaceNumAsFloat64)
    * [var ifaceNumAsNumber](#ifaceNumAsNumber)
    * [var indentErrorTests](#indentErrorTests)
    * [var interfaceSetTests](#interfaceSetTests)
    * [var invalidUnmarshalTests](#invalidUnmarshalTests)
    * [var invalidUnmarshalTextTests](#invalidUnmarshalTextTests)
    * [var jsonBig](#jsonBig)
    * [var mapCycle](#mapCycle)
    * [var marshalerType](#marshalerType)
    * [var nullLiteral](#nullLiteral)
    * [var numberTests](#numberTests)
    * [var numberType](#numberType)
    * [var optionalsExpected](#optionalsExpected)
    * [var pallValue](#pallValue)
    * [var pallValueCompact](#pallValueCompact)
    * [var pallValueIndent](#pallValueIndent)
    * [var pointerCycle](#pointerCycle)
    * [var pointerCycleIndirect](#pointerCycleIndirect)
    * [var re](#re)
    * [var recursiveSliceCycle](#recursiveSliceCycle)
    * [var safeSet](#safeSet)
    * [var samePointerNoCycle](#samePointerNoCycle)
    * [var scannerPool](#scannerPool)
    * [var sliceCycle](#sliceCycle)
    * [var sliceNoCycle](#sliceNoCycle)
    * [var streamEncoded](#streamEncoded)
    * [var streamEncodedIndent](#streamEncodedIndent)
    * [var streamTest](#streamTest)
    * [var structTagObjectKeyTests](#structTagObjectKeyTests)
    * [var textMarshalerType](#textMarshalerType)
    * [var textUnmarshalerType](#textUnmarshalerType)
    * [var tokenStreamCases](#tokenStreamCases)
    * [var ummapXY](#ummapXY)
    * [var umslice](#umslice)
    * [var umsliceXY](#umsliceXY)
    * [var umstruct](#umstruct)
    * [var umstructXY](#umstructXY)
    * [var umtrue](#umtrue)
    * [var umtrueXY](#umtrueXY)
    * [var unmarshalSyntaxTests](#unmarshalSyntaxTests)
    * [var unmarshalTests](#unmarshalTests)
    * [var unsupportedValues](#unsupportedValues)
    * [var validTests](#validTests)
    * [var wrongStringTests](#wrongStringTests)
* [Types](#type)
    * [type All struct](#All)
    * [type Ambig struct](#Ambig)
    * [type B struct](#B)
    * [type BugA struct](#BugA)
    * [type BugB struct](#BugB)
    * [type BugC struct](#BugC)
    * [type BugD struct](#BugD)
    * [type BugX struct](#BugX)
    * [type BugY struct](#BugY)
    * [type BugZ struct](#BugZ)
    * [type C int](#C)
        * [func (C) MarshalJSON() ([]byte, error)](#C.MarshalJSON)
    * [type CText int](#CText)
        * [func (CText) MarshalText() ([]byte, error)](#CText.MarshalText)
    * [type Decoder struct](#Decoder)
        * [func NewDecoder(r io.Reader) *Decoder](#NewDecoder)
        * [func (dec *Decoder) Buffered() io.Reader](#Decoder.Buffered)
        * [func (dec *Decoder) Decode(v interface{}) error](#Decoder.Decode)
        * [func (dec *Decoder) DisallowUnknownFields()](#Decoder.DisallowUnknownFields)
        * [func (dec *Decoder) InputOffset() int64](#Decoder.InputOffset)
        * [func (dec *Decoder) More() bool](#Decoder.More)
        * [func (dec *Decoder) Token() (Token, error)](#Decoder.Token)
        * [func (dec *Decoder) UseNumber()](#Decoder.UseNumber)
        * [func (dec *Decoder) peek() (byte, error)](#Decoder.peek)
        * [func (dec *Decoder) readValue() (int, error)](#Decoder.readValue)
        * [func (dec *Decoder) refill() error](#Decoder.refill)
        * [func (dec *Decoder) tokenError(c byte) (Token, error)](#Decoder.tokenError)
        * [func (dec *Decoder) tokenPrepareForDecode() error](#Decoder.tokenPrepareForDecode)
        * [func (dec *Decoder) tokenValueAllowed() bool](#Decoder.tokenValueAllowed)
        * [func (dec *Decoder) tokenValueEnd()](#Decoder.tokenValueEnd)
    * [type Delim rune](#Delim)
        * [func (d Delim) String() string](#Delim.String)
    * [type DoublePtr struct](#DoublePtr)
    * [type Embed0 struct](#Embed0)
    * [type Embed0a struct](#Embed0a)
    * [type Embed0b json.Embed0](#Embed0b)
    * [type Embed0c json.Embed0](#Embed0c)
    * [type Embed0p struct](#Embed0p)
    * [type Embed0q struct](#Embed0q)
    * [type Encoder struct](#Encoder)
        * [func NewEncoder(w io.Writer) *Encoder](#NewEncoder)
        * [func (enc *Encoder) Encode(v interface{}) error](#Encoder.Encode)
        * [func (enc *Encoder) SetEscapeHTML(on bool)](#Encoder.SetEscapeHTML)
        * [func (enc *Encoder) SetIndent(prefix, indent string)](#Encoder.SetIndent)
    * [type InvalidUTF8Error struct](#InvalidUTF8Error)
        * [func (e *InvalidUTF8Error) Error() string](#InvalidUTF8Error.Error)
    * [type InvalidUnmarshalError struct](#InvalidUnmarshalError)
        * [func (e *InvalidUnmarshalError) Error() string](#InvalidUnmarshalError.Error)
    * [type Loop struct](#Loop)
    * [type Marshaler interface](#Marshaler)
    * [type MarshalerError struct](#MarshalerError)
        * [func (e *MarshalerError) Error() string](#MarshalerError.Error)
        * [func (e *MarshalerError) Unwrap() error](#MarshalerError.Unwrap)
    * [type MustNotUnmarshalJSON struct{}](#MustNotUnmarshalJSON)
        * [func (x MustNotUnmarshalJSON) UnmarshalJSON(data []byte) error](#MustNotUnmarshalJSON.UnmarshalJSON)
    * [type MustNotUnmarshalText struct{}](#MustNotUnmarshalText)
        * [func (x MustNotUnmarshalText) UnmarshalText(text []byte) error](#MustNotUnmarshalText.UnmarshalText)
    * [type NullTest struct](#NullTest)
    * [type Number string](#Number)
        * [func (n Number) Float64() (float64, error)](#Number.Float64)
        * [func (n Number) Int64() (int64, error)](#Number.Int64)
        * [func (n Number) String() string](#Number.String)
    * [type Optionals struct](#Optionals)
    * [type P struct](#P)
    * [type PP struct](#PP)
    * [type Point struct](#Point)
    * [type PointerCycle struct](#PointerCycle)
    * [type PointerCycleIndirect struct](#PointerCycleIndirect)
    * [type RawMessage []byte](#RawMessage)
        * [func (m RawMessage) MarshalJSON() ([]byte, error)](#RawMessage.MarshalJSON)
        * [func (m *RawMessage) UnmarshalJSON(data []byte) error](#RawMessage.UnmarshalJSON)
    * [type RecursiveSlice []json.RecursiveSlice](#RecursiveSlice)
    * [type Ref int](#Ref)
        * [func (*Ref) MarshalJSON() ([]byte, error)](#Ref.MarshalJSON)
        * [func (r *Ref) UnmarshalJSON([]byte) error](#Ref.UnmarshalJSON)
    * [type RefText int](#RefText)
        * [func (*RefText) MarshalText() ([]byte, error)](#RefText.MarshalText)
        * [func (r *RefText) UnmarshalText([]byte) error](#RefText.UnmarshalText)
    * [type S10 struct](#S10)
    * [type S11 struct](#S11)
    * [type S12 struct](#S12)
    * [type S13 struct](#S13)
    * [type S5 struct](#S5)
    * [type S6 struct](#S6)
    * [type S7 json.S6](#S7)
    * [type S8 struct](#S8)
    * [type S9 struct](#S9)
    * [type SS string](#SS)
        * [func (*SS) UnmarshalJSON(data []byte) error](#SS.UnmarshalJSON)
    * [type SamePointerNoCycle struct](#SamePointerNoCycle)
    * [type Small struct](#Small)
    * [type StringTag struct](#StringTag)
    * [type SyntaxError struct](#SyntaxError)
        * [func (e *SyntaxError) Error() string](#SyntaxError.Error)
    * [type T struct](#T)
    * [type Time3339 time.Time](#Time3339)
        * [func (t *Time3339) UnmarshalJSON(b []byte) error](#Time3339.UnmarshalJSON)
    * [type Token interface{}](#Token)
    * [type Top struct](#Top)
    * [type U struct](#U)
    * [type UnmarshalFieldError struct](#UnmarshalFieldError)
        * [func (e *UnmarshalFieldError) Error() string](#UnmarshalFieldError.Error)
    * [type UnmarshalTypeError struct](#UnmarshalTypeError)
        * [func (e *UnmarshalTypeError) Error() string](#UnmarshalTypeError.Error)
    * [type Unmarshaler interface](#Unmarshaler)
        * [func indirect(v reflect.Value, decodingNull bool) (Unmarshaler, encoding.TextUnmarshaler, reflect.Value)](#indirect)
    * [type UnsupportedTypeError struct](#UnsupportedTypeError)
        * [func (e *UnsupportedTypeError) Error() string](#UnsupportedTypeError.Error)
    * [type UnsupportedValueError struct](#UnsupportedValueError)
        * [func (e *UnsupportedValueError) Error() string](#UnsupportedValueError.Error)
    * [type V struct](#V)
    * [type VOuter struct](#VOuter)
    * [type Val int](#Val)
        * [func (Val) MarshalJSON() ([]byte, error)](#Val.MarshalJSON)
    * [type ValText int](#ValText)
        * [func (ValText) MarshalText() ([]byte, error)](#ValText.MarshalText)
    * [type W struct](#W)
    * [type WrongString struct](#WrongString)
    * [type XYZ struct](#XYZ)
    * [type Xint struct](#Xint)
    * [type arrayEncoder struct](#arrayEncoder)
        * [func (ae arrayEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)](#arrayEncoder.encode)
    * [type badCodeTag struct](#badCodeTag)
    * [type badFormatTag struct](#badFormatTag)
    * [type basicLatin2xTag struct](#basicLatin2xTag)
    * [type basicLatin3xTag struct](#basicLatin3xTag)
    * [type basicLatin4xTag struct](#basicLatin4xTag)
    * [type basicLatin5xTag struct](#basicLatin5xTag)
    * [type basicLatin6xTag struct](#basicLatin6xTag)
    * [type basicLatin7xTag struct](#basicLatin7xTag)
    * [type byIndex []json.field](#byIndex)
        * [func (x byIndex) Len() int](#byIndex.Len)
        * [func (x byIndex) Less(i, j int) bool](#byIndex.Less)
        * [func (x byIndex) Swap(i, j int)](#byIndex.Swap)
    * [type byteWithMarshalJSON byte](#byteWithMarshalJSON)
        * [func (b byteWithMarshalJSON) MarshalJSON() ([]byte, error)](#byteWithMarshalJSON.MarshalJSON)
        * [func (b *byteWithMarshalJSON) UnmarshalJSON(data []byte) error](#byteWithMarshalJSON.UnmarshalJSON)
    * [type byteWithMarshalText byte](#byteWithMarshalText)
        * [func (b byteWithMarshalText) MarshalText() ([]byte, error)](#byteWithMarshalText.MarshalText)
        * [func (b *byteWithMarshalText) UnmarshalText(data []byte) error](#byteWithMarshalText.UnmarshalText)
    * [type byteWithPtrMarshalJSON byte](#byteWithPtrMarshalJSON)
        * [func (b *byteWithPtrMarshalJSON) MarshalJSON() ([]byte, error)](#byteWithPtrMarshalJSON.MarshalJSON)
        * [func (b *byteWithPtrMarshalJSON) UnmarshalJSON(data []byte) error](#byteWithPtrMarshalJSON.UnmarshalJSON)
    * [type byteWithPtrMarshalText byte](#byteWithPtrMarshalText)
        * [func (b *byteWithPtrMarshalText) MarshalText() ([]byte, error)](#byteWithPtrMarshalText.MarshalText)
        * [func (b *byteWithPtrMarshalText) UnmarshalText(data []byte) error](#byteWithPtrMarshalText.UnmarshalText)
    * [type codeNode struct](#codeNode)
    * [type codeResponse struct](#codeResponse)
    * [type condAddrEncoder struct](#condAddrEncoder)
        * [func (ce condAddrEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)](#condAddrEncoder.encode)
    * [type dashTag struct](#dashTag)
    * [type decodeState struct](#decodeState)
        * [func (d *decodeState) addErrorContext(err error) error](#decodeState.addErrorContext)
        * [func (d *decodeState) array(v reflect.Value) error](#decodeState.array)
        * [func (d *decodeState) arrayInterface() []interface{}](#decodeState.arrayInterface)
        * [func (d *decodeState) convertNumber(s string) (interface{}, error)](#decodeState.convertNumber)
        * [func (d *decodeState) init(data []byte) *decodeState](#decodeState.init.decode.go)
        * [func (d *decodeState) literalInterface() interface{}](#decodeState.literalInterface)
        * [func (d *decodeState) literalStore(item []byte, v reflect.Value, fromQuoted bool) error](#decodeState.literalStore)
        * [func (d *decodeState) object(v reflect.Value) error](#decodeState.object)
        * [func (d *decodeState) objectInterface() map[string]interface{}](#decodeState.objectInterface)
        * [func (d *decodeState) readIndex() int](#decodeState.readIndex)
        * [func (d *decodeState) rescanLiteral()](#decodeState.rescanLiteral)
        * [func (d *decodeState) saveError(err error)](#decodeState.saveError)
        * [func (d *decodeState) scanNext()](#decodeState.scanNext)
        * [func (d *decodeState) scanWhile(op int)](#decodeState.scanWhile)
        * [func (d *decodeState) skip()](#decodeState.skip)
        * [func (d *decodeState) unmarshal(v interface{}) error](#decodeState.unmarshal)
        * [func (d *decodeState) value(v reflect.Value) error](#decodeState.value)
        * [func (d *decodeState) valueInterface() (val interface{})](#decodeState.valueInterface)
        * [func (d *decodeState) valueQuoted() interface{}](#decodeState.valueQuoted)
    * [type decodeThis struct](#decodeThis)
    * [type embed struct](#embed)
    * [type emptyTag struct](#emptyTag)
    * [type encOpts struct](#encOpts)
    * [type encodeState struct](#encodeState)
        * [func newEncodeState() *encodeState](#newEncodeState)
        * [func (e *encodeState) error(err error)](#encodeState.error)
        * [func (e *encodeState) marshal(v interface{}, opts encOpts) (err error)](#encodeState.marshal)
        * [func (e *encodeState) reflectValue(v reflect.Value, opts encOpts)](#encodeState.reflectValue)
        * [func (e *encodeState) string(s string, escapeHTML bool)](#encodeState.string)
        * [func (e *encodeState) stringBytes(s []byte, escapeHTML bool)](#encodeState.stringBytes)
    * [type encoderFunc func(e *std/encoding/json.encodeState, v reflect.Value, opts std/encoding/json.encOpts)](#encoderFunc)
        * [func newArrayEncoder(t reflect.Type) encoderFunc](#newArrayEncoder)
        * [func newCondAddrEncoder(canAddrEnc, elseEnc encoderFunc) encoderFunc](#newCondAddrEncoder)
        * [func newMapEncoder(t reflect.Type) encoderFunc](#newMapEncoder)
        * [func newPtrEncoder(t reflect.Type) encoderFunc](#newPtrEncoder)
        * [func newSliceEncoder(t reflect.Type) encoderFunc](#newSliceEncoder)
        * [func newStructEncoder(t reflect.Type) encoderFunc](#newStructEncoder)
        * [func newTypeEncoder(t reflect.Type, allowAddr bool) encoderFunc](#newTypeEncoder)
        * [func typeEncoder(t reflect.Type) encoderFunc](#typeEncoder)
        * [func valueEncoder(v reflect.Value) encoderFunc](#valueEncoder)
    * [type errorContext struct](#errorContext)
    * [type example struct](#example)
    * [type field struct](#field)
        * [func dominantField(fields []field) (field, bool)](#dominantField)
    * [type floatEncoder int](#floatEncoder)
        * [func (bits floatEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)](#floatEncoder.encode)
    * [type indentErrorTest struct](#indentErrorTest)
    * [type intWithMarshalJSON int](#intWithMarshalJSON)
        * [func (b intWithMarshalJSON) MarshalJSON() ([]byte, error)](#intWithMarshalJSON.MarshalJSON)
        * [func (b *intWithMarshalJSON) UnmarshalJSON(data []byte) error](#intWithMarshalJSON.UnmarshalJSON)
    * [type intWithMarshalText int](#intWithMarshalText)
        * [func (b intWithMarshalText) MarshalText() ([]byte, error)](#intWithMarshalText.MarshalText)
        * [func (b *intWithMarshalText) UnmarshalText(data []byte) error](#intWithMarshalText.UnmarshalText)
    * [type intWithPtrMarshalJSON int](#intWithPtrMarshalJSON)
        * [func (b *intWithPtrMarshalJSON) MarshalJSON() ([]byte, error)](#intWithPtrMarshalJSON.MarshalJSON)
        * [func (b *intWithPtrMarshalJSON) UnmarshalJSON(data []byte) error](#intWithPtrMarshalJSON.UnmarshalJSON)
    * [type intWithPtrMarshalText int](#intWithPtrMarshalText)
        * [func (b *intWithPtrMarshalText) MarshalText() ([]byte, error)](#intWithPtrMarshalText.MarshalText)
        * [func (b *intWithPtrMarshalText) UnmarshalText(data []byte) error](#intWithPtrMarshalText.UnmarshalText)
    * [type jsonError struct](#jsonError)
    * [type jsonbyte byte](#jsonbyte)
        * [func (b jsonbyte) MarshalJSON() ([]byte, error)](#jsonbyte.MarshalJSON)
    * [type jsonint int](#jsonint)
        * [func (i jsonint) MarshalJSON() ([]byte, error)](#jsonint.MarshalJSON)
    * [type mapEncoder struct](#mapEncoder)
        * [func (me mapEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)](#mapEncoder.encode)
    * [type mapStringToStringData struct](#mapStringToStringData)
    * [type marshalPanic struct{}](#marshalPanic)
        * [func (marshalPanic) MarshalJSON() ([]byte, error)](#marshalPanic.MarshalJSON)
    * [type miscPlaneTag struct](#miscPlaneTag)
    * [type misnamedTag struct](#misnamedTag)
    * [type nilJSONMarshaler string](#nilJSONMarshaler)
        * [func (nm *nilJSONMarshaler) MarshalJSON() ([]byte, error)](#nilJSONMarshaler.MarshalJSON)
    * [type nilTextMarshaler string](#nilTextMarshaler)
        * [func (nm *nilTextMarshaler) MarshalText() ([]byte, error)](#nilTextMarshaler.MarshalText)
    * [type percentSlashTag struct](#percentSlashTag)
    * [type ptrEncoder struct](#ptrEncoder)
        * [func (pe ptrEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)](#ptrEncoder.encode)
    * [type punctuationTag struct](#punctuationTag)
    * [type reflectWithString struct](#reflectWithString)
        * [func (w *reflectWithString) resolve() error](#reflectWithString.resolve)
    * [type renamedByte byte](#renamedByte)
    * [type renamedByteSlice []byte](#renamedByteSlice)
    * [type renamedRenamedByteSlice []json.renamedByte](#renamedRenamedByteSlice)
    * [type scanner struct](#scanner)
        * [func newScanner() *scanner](#newScanner)
        * [func (s *scanner) eof() int](#scanner.eof)
        * [func (s *scanner) error(c byte, context string) int](#scanner.error)
        * [func (s *scanner) popParseState()](#scanner.popParseState)
        * [func (s *scanner) pushParseState(c byte, newParseState int, successState int) int](#scanner.pushParseState)
        * [func (s *scanner) reset()](#scanner.reset)
    * [type sliceEncoder struct](#sliceEncoder)
        * [func (se sliceEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)](#sliceEncoder.encode)
    * [type spaceTag struct](#spaceTag)
    * [type strMarshaler string](#strMarshaler)
        * [func (s strMarshaler) MarshalJSON() ([]byte, error)](#strMarshaler.MarshalJSON)
    * [type strPtrMarshaler string](#strPtrMarshaler)
        * [func (s *strPtrMarshaler) MarshalJSON() ([]byte, error)](#strPtrMarshaler.MarshalJSON)
    * [type structEncoder struct](#structEncoder)
        * [func (se structEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)](#structEncoder.encode)
    * [type structFields struct](#structFields)
        * [func cachedTypeFields(t reflect.Type) structFields](#cachedTypeFields)
        * [func typeFields(t reflect.Type) structFields](#typeFields)
    * [type tagOptions string](#tagOptions)
        * [func parseTag(tag string) (string, tagOptions)](#parseTag)
        * [func (o tagOptions) Contains(optionName string) bool](#tagOptions.Contains)
    * [type textUnmarshalerString string](#textUnmarshalerString)
        * [func (m *textUnmarshalerString) UnmarshalText(text []byte) error](#textUnmarshalerString.UnmarshalText)
    * [type textbyte byte](#textbyte)
        * [func (b textbyte) MarshalText() ([]byte, error)](#textbyte.MarshalText)
    * [type textfloat float64](#textfloat)
        * [func (f textfloat) MarshalText() ([]byte, error)](#textfloat.MarshalText)
    * [type textint int](#textint)
        * [func (i textint) MarshalText() ([]byte, error)](#textint.MarshalText)
    * [type tokenStreamCase struct](#tokenStreamCase)
    * [type tx struct](#tx)
    * [type u8 uint8](#u8)
    * [type u8marshal uint8](#u8marshal)
        * [func (u8 u8marshal) MarshalText() ([]byte, error)](#u8marshal.MarshalText)
        * [func (u8 *u8marshal) UnmarshalText(b []byte) error](#u8marshal.UnmarshalText)
    * [type unexportedFields struct](#unexportedFields)
    * [type unexportedWithMethods struct{}](#unexportedWithMethods)
        * [func (unexportedWithMethods) F()](#unexportedWithMethods.F)
    * [type unicodeTag struct](#unicodeTag)
    * [type unmarshalPanic struct{}](#unmarshalPanic)
        * [func (unmarshalPanic) UnmarshalJSON([]byte) error](#unmarshalPanic.UnmarshalJSON)
    * [type unmarshalTest struct](#unmarshalTest)
    * [type unmarshaler struct](#unmarshaler)
        * [func (u *unmarshaler) UnmarshalJSON(b []byte) error](#unmarshaler.UnmarshalJSON)
    * [type unmarshalerText struct](#unmarshalerText)
        * [func (u unmarshalerText) MarshalText() ([]byte, error)](#unmarshalerText.MarshalText)
        * [func (u *unmarshalerText) UnmarshalText(b []byte) error](#unmarshalerText.UnmarshalText)
    * [type unquotedValue struct{}](#unquotedValue)
    * [type ustruct struct](#ustruct)
    * [type ustructText struct](#ustructText)
    * [type wrongStringTest struct](#wrongStringTest)
* [Functions](#func)
    * [func BenchmarkCodeDecoder(b *testing.B)](#BenchmarkCodeDecoder)
    * [func BenchmarkCodeEncoder(b *testing.B)](#BenchmarkCodeEncoder)
    * [func BenchmarkCodeMarshal(b *testing.B)](#BenchmarkCodeMarshal)
    * [func BenchmarkCodeUnmarshal(b *testing.B)](#BenchmarkCodeUnmarshal)
    * [func BenchmarkCodeUnmarshalReuse(b *testing.B)](#BenchmarkCodeUnmarshalReuse)
    * [func BenchmarkDecoderStream(b *testing.B)](#BenchmarkDecoderStream)
    * [func BenchmarkEncodeMarshaler(b *testing.B)](#BenchmarkEncodeMarshaler)
    * [func BenchmarkEncoderEncode(b *testing.B)](#BenchmarkEncoderEncode)
    * [func BenchmarkIssue10335(b *testing.B)](#BenchmarkIssue10335)
    * [func BenchmarkIssue34127(b *testing.B)](#BenchmarkIssue34127)
    * [func BenchmarkMarshalBytes(b *testing.B)](#BenchmarkMarshalBytes)
    * [func BenchmarkNumberIsValid(b *testing.B)](#BenchmarkNumberIsValid)
    * [func BenchmarkNumberIsValidRegexp(b *testing.B)](#BenchmarkNumberIsValidRegexp)
    * [func BenchmarkTypeFieldsCache(b *testing.B)](#BenchmarkTypeFieldsCache)
    * [func BenchmarkUnicodeDecoder(b *testing.B)](#BenchmarkUnicodeDecoder)
    * [func BenchmarkUnmapped(b *testing.B)](#BenchmarkUnmapped)
    * [func BenchmarkUnmarshalFloat64(b *testing.B)](#BenchmarkUnmarshalFloat64)
    * [func BenchmarkUnmarshalInt64(b *testing.B)](#BenchmarkUnmarshalInt64)
    * [func BenchmarkUnmarshalString(b *testing.B)](#BenchmarkUnmarshalString)
    * [func Compact(dst *bytes.Buffer, src []byte) error](#Compact)
    * [func HTMLEscape(dst *bytes.Buffer, src []byte)](#HTMLEscape)
    * [func Indent(dst *bytes.Buffer, src []byte, prefix, indent string) error](#Indent)
    * [func Marshal(v interface{}) ([]byte, error)](#Marshal)
    * [func MarshalIndent(v interface{}, prefix, indent string) ([]byte, error)](#MarshalIndent)
    * [func TestAnonymousFields(t *testing.T)](#TestAnonymousFields)
    * [func TestBlocking(t *testing.T)](#TestBlocking)
    * [func TestByteKind(t *testing.T)](#TestByteKind)
    * [func TestCompact(t *testing.T)](#TestCompact)
    * [func TestCompactBig(t *testing.T)](#TestCompactBig)
    * [func TestCompactSeparators(t *testing.T)](#TestCompactSeparators)
    * [func TestDecodeInStream(t *testing.T)](#TestDecodeInStream)
    * [func TestDecoder(t *testing.T)](#TestDecoder)
    * [func TestDecoderBuffered(t *testing.T)](#TestDecoderBuffered)
    * [func TestDuplicatedFieldDisappears(t *testing.T)](#TestDuplicatedFieldDisappears)
    * [func TestEmbeddedBug(t *testing.T)](#TestEmbeddedBug)
    * [func TestEmptyString(t *testing.T)](#TestEmptyString)
    * [func TestEncodeBytekind(t *testing.T)](#TestEncodeBytekind)
    * [func TestEncodePointerString(t *testing.T)](#TestEncodePointerString)
    * [func TestEncodeRenamedByteSlice(t *testing.T)](#TestEncodeRenamedByteSlice)
    * [func TestEncodeString(t *testing.T)](#TestEncodeString)
    * [func TestEncoder(t *testing.T)](#TestEncoder)
    * [func TestEncoderIndent(t *testing.T)](#TestEncoderIndent)
    * [func TestEncoderSetEscapeHTML(t *testing.T)](#TestEncoderSetEscapeHTML)
    * [func TestErrorMessageFromMisusedString(t *testing.T)](#TestErrorMessageFromMisusedString)
    * [func TestEscape(t *testing.T)](#TestEscape)
    * [func TestFold(t *testing.T)](#TestFold)
    * [func TestFoldAgainstUnicode(t *testing.T)](#TestFoldAgainstUnicode)
    * [func TestHTMLEscape(t *testing.T)](#TestHTMLEscape)
    * [func TestHTTPDecoding(t *testing.T)](#TestHTTPDecoding)
    * [func TestIndent(t *testing.T)](#TestIndent)
    * [func TestIndentBig(t *testing.T)](#TestIndentBig)
    * [func TestIndentErrors(t *testing.T)](#TestIndentErrors)
    * [func TestInterfaceSet(t *testing.T)](#TestInterfaceSet)
    * [func TestInvalidStringOption(t *testing.T)](#TestInvalidStringOption)
    * [func TestInvalidUnmarshal(t *testing.T)](#TestInvalidUnmarshal)
    * [func TestInvalidUnmarshalText(t *testing.T)](#TestInvalidUnmarshalText)
    * [func TestIssue10281(t *testing.T)](#TestIssue10281)
    * [func TestLargeByteSlice(t *testing.T)](#TestLargeByteSlice)
    * [func TestMarshal(t *testing.T)](#TestMarshal)
    * [func TestMarshalBadUTF8(t *testing.T)](#TestMarshalBadUTF8)
    * [func TestMarshalEmbeds(t *testing.T)](#TestMarshalEmbeds)
    * [func TestMarshalFloat(t *testing.T)](#TestMarshalFloat)
    * [func TestMarshalNumberZeroVal(t *testing.T)](#TestMarshalNumberZeroVal)
    * [func TestMarshalPanic(t *testing.T)](#TestMarshalPanic)
    * [func TestMarshalRawMessageValue(t *testing.T)](#TestMarshalRawMessageValue)
    * [func TestMarshalTextFloatMap(t *testing.T)](#TestMarshalTextFloatMap)
    * [func TestMarshalUncommonFieldNames(t *testing.T)](#TestMarshalUncommonFieldNames)
    * [func TestMarshalerError(t *testing.T)](#TestMarshalerError)
    * [func TestMarshalerEscaping(t *testing.T)](#TestMarshalerEscaping)
    * [func TestNilMarshal(t *testing.T)](#TestNilMarshal)
    * [func TestNilMarshalerTextMapKey(t *testing.T)](#TestNilMarshalerTextMapKey)
    * [func TestNullRawMessage(t *testing.T)](#TestNullRawMessage)
    * [func TestNullString(t *testing.T)](#TestNullString)
    * [func TestNumberAccessors(t *testing.T)](#TestNumberAccessors)
    * [func TestNumberIsValid(t *testing.T)](#TestNumberIsValid)
    * [func TestOmitEmpty(t *testing.T)](#TestOmitEmpty)
    * [func TestPrefilled(t *testing.T)](#TestPrefilled)
    * [func TestRawMessage(t *testing.T)](#TestRawMessage)
    * [func TestRefUnmarshal(t *testing.T)](#TestRefUnmarshal)
    * [func TestRefValMarshal(t *testing.T)](#TestRefValMarshal)
    * [func TestRoundtripStringTag(t *testing.T)](#TestRoundtripStringTag)
    * [func TestSamePointerNoCycle(t *testing.T)](#TestSamePointerNoCycle)
    * [func TestSkipArrayObjects(t *testing.T)](#TestSkipArrayObjects)
    * [func TestSliceNoCycle(t *testing.T)](#TestSliceNoCycle)
    * [func TestSliceOfCustomByte(t *testing.T)](#TestSliceOfCustomByte)
    * [func TestStringBytes(t *testing.T)](#TestStringBytes)
    * [func TestStringKind(t *testing.T)](#TestStringKind)
    * [func TestStructTagObjectKey(t *testing.T)](#TestStructTagObjectKey)
    * [func TestTagParsing(t *testing.T)](#TestTagParsing)
    * [func TestTaggedFieldDominates(t *testing.T)](#TestTaggedFieldDominates)
    * [func TestTextMarshalerMapKeysAreSorted(t *testing.T)](#TestTextMarshalerMapKeysAreSorted)
    * [func TestUnmarshal(t *testing.T)](#TestUnmarshal)
    * [func TestUnmarshalEmbeddedUnexported(t *testing.T)](#TestUnmarshalEmbeddedUnexported)
    * [func TestUnmarshalErrorAfterMultipleJSON(t *testing.T)](#TestUnmarshalErrorAfterMultipleJSON)
    * [func TestUnmarshalInterface(t *testing.T)](#TestUnmarshalInterface)
    * [func TestUnmarshalJSONLiteralError(t *testing.T)](#TestUnmarshalJSONLiteralError)
    * [func TestUnmarshalMapWithTextUnmarshalerStringKey(t *testing.T)](#TestUnmarshalMapWithTextUnmarshalerStringKey)
    * [func TestUnmarshalMarshal(t *testing.T)](#TestUnmarshalMarshal)
    * [func TestUnmarshalMaxDepth(t *testing.T)](#TestUnmarshalMaxDepth)
    * [func TestUnmarshalNulls(t *testing.T)](#TestUnmarshalNulls)
    * [func TestUnmarshalPanic(t *testing.T)](#TestUnmarshalPanic)
    * [func TestUnmarshalPtrPtr(t *testing.T)](#TestUnmarshalPtrPtr)
    * [func TestUnmarshalRecursivePointer(t *testing.T)](#TestUnmarshalRecursivePointer)
    * [func TestUnmarshalRescanLiteralMangledUnquote(t *testing.T)](#TestUnmarshalRescanLiteralMangledUnquote)
    * [func TestUnmarshalSyntax(t *testing.T)](#TestUnmarshalSyntax)
    * [func TestUnmarshalTypeError(t *testing.T)](#TestUnmarshalTypeError)
    * [func TestUnmarshalUnexported(t *testing.T)](#TestUnmarshalUnexported)
    * [func TestUnsupportedValues(t *testing.T)](#TestUnsupportedValues)
    * [func TestValid(t *testing.T)](#TestValid)
    * [func Unmarshal(data []byte, v interface{}) error](#Unmarshal)
    * [func Valid(data []byte) bool](#Valid)
    * [func addrMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)](#addrMarshalerEncoder)
    * [func addrTextMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)](#addrTextMarshalerEncoder)
    * [func asciiEqualFold(s, t []byte) bool](#asciiEqualFold)
    * [func benchMarshalBytes(n int) func(*testing.B)](#benchMarshalBytes)
    * [func boolEncoder(e *encodeState, v reflect.Value, opts encOpts)](#boolEncoder)
    * [func checkValid(data []byte, scan *scanner) error](#checkValid)
    * [func codeInit()](#codeInit)
    * [func compact(dst *bytes.Buffer, src []byte, escape bool) error](#compact)
    * [func diff(t *testing.T, a, b []byte)](#diff)
    * [func encodeByteSlice(e *encodeState, v reflect.Value, _ encOpts)](#encodeByteSlice)
    * [func equalError(a, b error) bool](#equalError)
    * [func equalFoldRight(s, t []byte) bool](#equalFoldRight)
    * [func foldFunc(s []byte) func(s, t []byte) bool](#foldFunc)
    * [func freeScanner(scan *scanner)](#freeScanner)
    * [func genArray(n int) []interface{}](#genArray)
    * [func genMap(n int) map[string]interface{}](#genMap)
    * [func genString(stddev float64) string](#genString)
    * [func genValue(n int) interface{}](#genValue)
    * [func getu4(s []byte) rune](#getu4)
    * [func init()](#init.encode_test.go)
    * [func initBig()](#initBig)
    * [func intEncoder(e *encodeState, v reflect.Value, opts encOpts)](#intEncoder)
    * [func interfaceEncoder(e *encodeState, v reflect.Value, opts encOpts)](#interfaceEncoder)
    * [func intp(x int) *int](#intp)
    * [func intpp(x *int) **int](#intpp)
    * [func invalidValueEncoder(e *encodeState, v reflect.Value, _ encOpts)](#invalidValueEncoder)
    * [func isASCIILetter(b byte) bool](#isASCIILetter)
    * [func isEmptyValue(v reflect.Value) bool](#isEmptyValue)
    * [func isSpace(c byte) bool](#isSpace)
    * [func isValidNumber(s string) bool](#isValidNumber)
    * [func isValidTag(s string) bool](#isValidTag)
    * [func marshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)](#marshalerEncoder)
    * [func newline(dst *bytes.Buffer, prefix, indent string, depth int)](#newline)
    * [func nlines(s string, n int) string](#nlines)
    * [func noSpace(c rune) rune](#noSpace)
    * [func nonSpace(b []byte) bool](#nonSpace)
    * [func quoteChar(c byte) string](#quoteChar)
    * [func simpleLetterEqualFold(s, t []byte) bool](#simpleLetterEqualFold)
    * [func state0(s *scanner, c byte) int](#state0)
    * [func state1(s *scanner, c byte) int](#state1)
    * [func stateBeginString(s *scanner, c byte) int](#stateBeginString)
    * [func stateBeginStringOrEmpty(s *scanner, c byte) int](#stateBeginStringOrEmpty)
    * [func stateBeginValue(s *scanner, c byte) int](#stateBeginValue)
    * [func stateBeginValueOrEmpty(s *scanner, c byte) int](#stateBeginValueOrEmpty)
    * [func stateDot(s *scanner, c byte) int](#stateDot)
    * [func stateDot0(s *scanner, c byte) int](#stateDot0)
    * [func stateE(s *scanner, c byte) int](#stateE)
    * [func stateE0(s *scanner, c byte) int](#stateE0)
    * [func stateESign(s *scanner, c byte) int](#stateESign)
    * [func stateEndTop(s *scanner, c byte) int](#stateEndTop)
    * [func stateEndValue(s *scanner, c byte) int](#stateEndValue)
    * [func stateError(s *scanner, c byte) int](#stateError)
    * [func stateF(s *scanner, c byte) int](#stateF)
    * [func stateFa(s *scanner, c byte) int](#stateFa)
    * [func stateFal(s *scanner, c byte) int](#stateFal)
    * [func stateFals(s *scanner, c byte) int](#stateFals)
    * [func stateInString(s *scanner, c byte) int](#stateInString)
    * [func stateInStringEsc(s *scanner, c byte) int](#stateInStringEsc)
    * [func stateInStringEscU(s *scanner, c byte) int](#stateInStringEscU)
    * [func stateInStringEscU1(s *scanner, c byte) int](#stateInStringEscU1)
    * [func stateInStringEscU12(s *scanner, c byte) int](#stateInStringEscU12)
    * [func stateInStringEscU123(s *scanner, c byte) int](#stateInStringEscU123)
    * [func stateN(s *scanner, c byte) int](#stateN)
    * [func stateNeg(s *scanner, c byte) int](#stateNeg)
    * [func stateNu(s *scanner, c byte) int](#stateNu)
    * [func stateNul(s *scanner, c byte) int](#stateNul)
    * [func stateT(s *scanner, c byte) int](#stateT)
    * [func stateTr(s *scanner, c byte) int](#stateTr)
    * [func stateTru(s *scanner, c byte) int](#stateTru)
    * [func stringEncoder(e *encodeState, v reflect.Value, opts encOpts)](#stringEncoder)
    * [func tenc(format string, a ...interface{}) ([]byte, error)](#tenc)
    * [func textMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)](#textMarshalerEncoder)
    * [func trim(b []byte) []byte](#trim)
    * [func typeByIndex(t reflect.Type, index []int) reflect.Type](#typeByIndex)
    * [func uintEncoder(e *encodeState, v reflect.Value, opts encOpts)](#uintEncoder)
    * [func unquote(s []byte) (t string, ok bool)](#unquote)
    * [func unquoteBytes(s []byte) (t []byte, ok bool)](#unquoteBytes)
    * [func unsupportedTypeEncoder(e *encodeState, v reflect.Value, _ encOpts)](#unsupportedTypeEncoder)


## <a id="const" href="#const">Constants</a>

### <a id="caseMask" href="#caseMask">const caseMask</a>

```
searchKey: json.caseMask
tags: [constant number private]
```

```Go
const caseMask = ^byte(0x20) // Mask to ignore case in ASCII.

```

### <a id="kelvin" href="#kelvin">const kelvin</a>

```
searchKey: json.kelvin
tags: [constant number private]
```

```Go
const kelvin = '\u212a'
```

### <a id="maxNestingDepth" href="#maxNestingDepth">const maxNestingDepth</a>

```
searchKey: json.maxNestingDepth
tags: [constant number private]
```

```Go
const maxNestingDepth = 10000
```

This limits the max nesting depth to prevent stack overflow. This is permitted by [https://tools.ietf.org/html/rfc7159#section-9](https://tools.ietf.org/html/rfc7159#section-9) 

### <a id="parseArrayValue" href="#parseArrayValue">const parseArrayValue</a>

```
searchKey: json.parseArrayValue
tags: [constant number private]
```

```Go
const parseArrayValue // parsing array value

```

These values are stored in the parseState stack. They give the current state of a composite value being scanned. If the parser is inside a nested value the parseState describes the nested state, outermost at entry 0. 

### <a id="parseObjectKey" href="#parseObjectKey">const parseObjectKey</a>

```
searchKey: json.parseObjectKey
tags: [constant number private]
```

```Go
const parseObjectKey = iota // parsing object key (before colon)

```

These values are stored in the parseState stack. They give the current state of a composite value being scanned. If the parser is inside a nested value the parseState describes the nested state, outermost at entry 0. 

### <a id="parseObjectValue" href="#parseObjectValue">const parseObjectValue</a>

```
searchKey: json.parseObjectValue
tags: [constant number private]
```

```Go
const parseObjectValue // parsing object value (after colon)

```

These values are stored in the parseState stack. They give the current state of a composite value being scanned. If the parser is inside a nested value the parseState describes the nested state, outermost at entry 0. 

### <a id="phasePanicMsg" href="#phasePanicMsg">const phasePanicMsg</a>

```
searchKey: json.phasePanicMsg
tags: [constant string private]
```

```Go
const phasePanicMsg = "JSON decoder out of sync - data changing underfoot?"
```

phasePanicMsg is used as a panic message when we end up with something that shouldn't happen. It can indicate a bug in the JSON decoder, or that something is editing the data slice while the decoder executes. 

### <a id="scanArrayValue" href="#scanArrayValue">const scanArrayValue</a>

```
searchKey: json.scanArrayValue
tags: [constant number private]
```

```Go
const scanArrayValue // just finished array value

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanBeginArray" href="#scanBeginArray">const scanBeginArray</a>

```
searchKey: json.scanBeginArray
tags: [constant number private]
```

```Go
const scanBeginArray // begin array

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanBeginLiteral" href="#scanBeginLiteral">const scanBeginLiteral</a>

```
searchKey: json.scanBeginLiteral
tags: [constant number private]
```

```Go
const scanBeginLiteral // end implied by next result != scanContinue

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanBeginObject" href="#scanBeginObject">const scanBeginObject</a>

```
searchKey: json.scanBeginObject
tags: [constant number private]
```

```Go
const scanBeginObject // begin object

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanContinue" href="#scanContinue">const scanContinue</a>

```
searchKey: json.scanContinue
tags: [constant number private]
```

```Go
const scanContinue = iota // uninteresting byte

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

Continue. 

### <a id="scanEnd" href="#scanEnd">const scanEnd</a>

```
searchKey: json.scanEnd
tags: [constant number private]
```

```Go
const scanEnd // top-level value ended *before* this byte; known to be first "stop" result

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

Stop. 

### <a id="scanEndArray" href="#scanEndArray">const scanEndArray</a>

```
searchKey: json.scanEndArray
tags: [constant number private]
```

```Go
const scanEndArray // end array (implies scanArrayValue if possible)

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanEndObject" href="#scanEndObject">const scanEndObject</a>

```
searchKey: json.scanEndObject
tags: [constant number private]
```

```Go
const scanEndObject // end object (implies scanObjectValue if possible)

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanError" href="#scanError">const scanError</a>

```
searchKey: json.scanError
tags: [constant number private]
```

```Go
const scanError // hit an error, scanner.err.

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanObjectKey" href="#scanObjectKey">const scanObjectKey</a>

```
searchKey: json.scanObjectKey
tags: [constant number private]
```

```Go
const scanObjectKey // just finished object key (string)

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanObjectValue" href="#scanObjectValue">const scanObjectValue</a>

```
searchKey: json.scanObjectValue
tags: [constant number private]
```

```Go
const scanObjectValue // just finished non-last object value

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanSkipSpace" href="#scanSkipSpace">const scanSkipSpace</a>

```
searchKey: json.scanSkipSpace
tags: [constant number private]
```

```Go
const scanSkipSpace // space byte; can skip; known to be last "continue" result

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="smallLongEss" href="#smallLongEss">const smallLongEss</a>

```
searchKey: json.smallLongEss
tags: [constant number private]
```

```Go
const smallLongEss = '\u017f'
```

### <a id="startDetectingCyclesAfter" href="#startDetectingCyclesAfter">const startDetectingCyclesAfter</a>

```
searchKey: json.startDetectingCyclesAfter
tags: [constant number private]
```

```Go
const startDetectingCyclesAfter = 1000
```

### <a id="tokenArrayComma" href="#tokenArrayComma">const tokenArrayComma</a>

```
searchKey: json.tokenArrayComma
tags: [constant number private]
```

```Go
const tokenArrayComma
```

### <a id="tokenArrayStart" href="#tokenArrayStart">const tokenArrayStart</a>

```
searchKey: json.tokenArrayStart
tags: [constant number private]
```

```Go
const tokenArrayStart
```

### <a id="tokenArrayValue" href="#tokenArrayValue">const tokenArrayValue</a>

```
searchKey: json.tokenArrayValue
tags: [constant number private]
```

```Go
const tokenArrayValue
```

### <a id="tokenObjectColon" href="#tokenObjectColon">const tokenObjectColon</a>

```
searchKey: json.tokenObjectColon
tags: [constant number private]
```

```Go
const tokenObjectColon
```

### <a id="tokenObjectComma" href="#tokenObjectComma">const tokenObjectComma</a>

```
searchKey: json.tokenObjectComma
tags: [constant number private]
```

```Go
const tokenObjectComma
```

### <a id="tokenObjectKey" href="#tokenObjectKey">const tokenObjectKey</a>

```
searchKey: json.tokenObjectKey
tags: [constant number private]
```

```Go
const tokenObjectKey
```

### <a id="tokenObjectStart" href="#tokenObjectStart">const tokenObjectStart</a>

```
searchKey: json.tokenObjectStart
tags: [constant number private]
```

```Go
const tokenObjectStart
```

### <a id="tokenObjectValue" href="#tokenObjectValue">const tokenObjectValue</a>

```
searchKey: json.tokenObjectValue
tags: [constant number private]
```

```Go
const tokenObjectValue
```

### <a id="tokenTopValue" href="#tokenTopValue">const tokenTopValue</a>

```
searchKey: json.tokenTopValue
tags: [constant number private]
```

```Go
const tokenTopValue = iota
```

## <a id="var" href="#var">Variables</a>

### <a id="allValue" href="#allValue">var allValue</a>

```
searchKey: json.allValue
tags: [variable struct private]
```

```Go
var allValue = ...
```

### <a id="allValueCompact" href="#allValueCompact">var allValueCompact</a>

```
searchKey: json.allValueCompact
tags: [variable string private]
```

```Go
var allValueCompact = strings.Map(noSpace, allValueIndent)
```

### <a id="allValueIndent" href="#allValueIndent">var allValueIndent</a>

```
searchKey: json.allValueIndent
tags: [variable string private]
```

```Go
var allValueIndent = ...
```

### <a id="badFloatREs" href="#badFloatREs">var badFloatREs</a>

```
searchKey: json.badFloatREs
tags: [variable array struct private]
```

```Go
var badFloatREs = ...
```

syntactic checks on form of marshaled floating point numbers. 

### <a id="badUTF8" href="#badUTF8">var badUTF8</a>

```
searchKey: json.badUTF8
tags: [variable array struct private]
```

```Go
var badUTF8 = ...
```

### <a id="blockingTests" href="#blockingTests">var blockingTests</a>

```
searchKey: json.blockingTests
tags: [variable array string private]
```

```Go
var blockingTests = []string{
	`{"x": 1}`,
	`[1, 2, 3]`,
}
```

### <a id="codeJSON" href="#codeJSON">var codeJSON</a>

```
searchKey: json.codeJSON
tags: [variable array number private]
```

```Go
var codeJSON []byte
```

### <a id="codeStruct" href="#codeStruct">var codeStruct</a>

```
searchKey: json.codeStruct
tags: [variable struct private]
```

```Go
var codeStruct codeResponse
```

### <a id="decodeTypeErrorTests" href="#decodeTypeErrorTests">var decodeTypeErrorTests</a>

```
searchKey: json.decodeTypeErrorTests
tags: [variable array struct private]
```

```Go
var decodeTypeErrorTests = ...
```

### <a id="encodeStatePool" href="#encodeStatePool">var encodeStatePool</a>

```
searchKey: json.encodeStatePool
tags: [variable struct private]
```

```Go
var encodeStatePool sync.Pool
```

### <a id="encodeStringTests" href="#encodeStringTests">var encodeStringTests</a>

```
searchKey: json.encodeStringTests
tags: [variable array struct private]
```

```Go
var encodeStringTests = ...
```

### <a id="encoderCache" href="#encoderCache">var encoderCache</a>

```
searchKey: json.encoderCache
tags: [variable struct private]
```

```Go
var encoderCache sync.Map // map[reflect.Type]encoderFunc

```

### <a id="errMissingU8Prefix" href="#errMissingU8Prefix">var errMissingU8Prefix</a>

```
searchKey: json.errMissingU8Prefix
tags: [variable interface private]
```

```Go
var errMissingU8Prefix = errors.New("missing 'u' prefix")
```

### <a id="ex1" href="#ex1">var ex1</a>

```
searchKey: json.ex1
tags: [variable string private]
```

```Go
var ex1 = `[true,false,null,"x",1,1.5,0,-5e+2]`
```

### <a id="ex1i" href="#ex1i">var ex1i</a>

```
searchKey: json.ex1i
tags: [variable string private]
```

```Go
var ex1i = `[
	true,
	false,
	null,
	"x",
	1,
	1.5,
	0,
	-5e+2
]`
```

### <a id="examples" href="#examples">var examples</a>

```
searchKey: json.examples
tags: [variable array struct private]
```

```Go
var examples = ...
```

### <a id="fieldCache" href="#fieldCache">var fieldCache</a>

```
searchKey: json.fieldCache
tags: [variable struct private]
```

```Go
var fieldCache sync.Map // map[reflect.Type]structFields

```

### <a id="float32Encoder" href="#float32Encoder">var float32Encoder</a>

```
searchKey: json.float32Encoder
tags: [variable function private]
```

```Go
var float32Encoder = (floatEncoder(32)).encode
```

### <a id="float64Encoder" href="#float64Encoder">var float64Encoder</a>

```
searchKey: json.float64Encoder
tags: [variable function private]
```

```Go
var float64Encoder = (floatEncoder(64)).encode
```

### <a id="foldTests" href="#foldTests">var foldTests</a>

```
searchKey: json.foldTests
tags: [variable array struct private]
```

```Go
var foldTests = ...
```

### <a id="hex" href="#hex">var hex</a>

```
searchKey: json.hex
tags: [variable string private]
```

```Go
var hex = "0123456789abcdef"
```

### <a id="htmlSafeSet" href="#htmlSafeSet">var htmlSafeSet</a>

```
searchKey: json.htmlSafeSet
tags: [variable array boolean private]
```

```Go
var htmlSafeSet = ...
```

htmlSafeSet holds the value true if the ASCII character with the given array position can be safely represented inside a JSON string, embedded inside of HTML <script> tags, without any additional escaping. 

All values are true except for the ASCII control characters (0-31), the double quote ("), the backslash character ("\"), HTML opening and closing tags ("<" and ">"), and the ampersand ("&"). 

### <a id="ifaceNumAsFloat64" href="#ifaceNumAsFloat64">var ifaceNumAsFloat64</a>

```
searchKey: json.ifaceNumAsFloat64
tags: [variable object private]
```

```Go
var ifaceNumAsFloat64 = ...
```

ifaceNumAsFloat64/ifaceNumAsNumber are used to test unmarshaling with and without UseNumber 

### <a id="ifaceNumAsNumber" href="#ifaceNumAsNumber">var ifaceNumAsNumber</a>

```
searchKey: json.ifaceNumAsNumber
tags: [variable object private]
```

```Go
var ifaceNumAsNumber = ...
```

### <a id="indentErrorTests" href="#indentErrorTests">var indentErrorTests</a>

```
searchKey: json.indentErrorTests
tags: [variable array struct private]
```

```Go
var indentErrorTests = ...
```

### <a id="interfaceSetTests" href="#interfaceSetTests">var interfaceSetTests</a>

```
searchKey: json.interfaceSetTests
tags: [variable array struct private]
```

```Go
var interfaceSetTests = ...
```

### <a id="invalidUnmarshalTests" href="#invalidUnmarshalTests">var invalidUnmarshalTests</a>

```
searchKey: json.invalidUnmarshalTests
tags: [variable array struct private]
```

```Go
var invalidUnmarshalTests = ...
```

### <a id="invalidUnmarshalTextTests" href="#invalidUnmarshalTextTests">var invalidUnmarshalTextTests</a>

```
searchKey: json.invalidUnmarshalTextTests
tags: [variable array struct private]
```

```Go
var invalidUnmarshalTextTests = ...
```

### <a id="jsonBig" href="#jsonBig">var jsonBig</a>

```
searchKey: json.jsonBig
tags: [variable array number private]
```

```Go
var jsonBig []byte
```

### <a id="mapCycle" href="#mapCycle">var mapCycle</a>

```
searchKey: json.mapCycle
tags: [variable object private]
```

```Go
var mapCycle = make(map[string]interface{})
```

### <a id="marshalerType" href="#marshalerType">var marshalerType</a>

```
searchKey: json.marshalerType
tags: [variable interface private]
```

```Go
var marshalerType = reflect.TypeOf((*Marshaler)(nil)).Elem()
```

### <a id="nullLiteral" href="#nullLiteral">var nullLiteral</a>

```
searchKey: json.nullLiteral
tags: [variable array number private]
```

```Go
var nullLiteral = []byte("null")
```

### <a id="numberTests" href="#numberTests">var numberTests</a>

```
searchKey: json.numberTests
tags: [variable array struct private]
```

```Go
var numberTests = ...
```

### <a id="numberType" href="#numberType">var numberType</a>

```
searchKey: json.numberType
tags: [variable interface private]
```

```Go
var numberType = reflect.TypeOf(Number(""))
```

### <a id="optionalsExpected" href="#optionalsExpected">var optionalsExpected</a>

```
searchKey: json.optionalsExpected
tags: [variable string private]
```

```Go
var optionalsExpected = ...
```

### <a id="pallValue" href="#pallValue">var pallValue</a>

```
searchKey: json.pallValue
tags: [variable struct private]
```

```Go
var pallValue = ...
```

### <a id="pallValueCompact" href="#pallValueCompact">var pallValueCompact</a>

```
searchKey: json.pallValueCompact
tags: [variable string private]
```

```Go
var pallValueCompact = strings.Map(noSpace, pallValueIndent)
```

### <a id="pallValueIndent" href="#pallValueIndent">var pallValueIndent</a>

```
searchKey: json.pallValueIndent
tags: [variable string private]
```

```Go
var pallValueIndent = ...
```

### <a id="pointerCycle" href="#pointerCycle">var pointerCycle</a>

```
searchKey: json.pointerCycle
tags: [variable struct private]
```

```Go
var pointerCycle = &PointerCycle{}
```

### <a id="pointerCycleIndirect" href="#pointerCycleIndirect">var pointerCycleIndirect</a>

```
searchKey: json.pointerCycleIndirect
tags: [variable struct private]
```

```Go
var pointerCycleIndirect = &PointerCycleIndirect{}
```

### <a id="re" href="#re">var re</a>

```
searchKey: json.re
tags: [variable function private]
```

```Go
var re = regexp.MustCompile
```

### <a id="recursiveSliceCycle" href="#recursiveSliceCycle">var recursiveSliceCycle</a>

```
searchKey: json.recursiveSliceCycle
tags: [variable array array private]
```

```Go
var recursiveSliceCycle = []RecursiveSlice{nil}
```

### <a id="safeSet" href="#safeSet">var safeSet</a>

```
searchKey: json.safeSet
tags: [variable array boolean private]
```

```Go
var safeSet = ...
```

safeSet holds the value true if the ASCII character with the given array position can be represented inside a JSON string without any further escaping. 

All values are true except for the ASCII control characters (0-31), the double quote ("), and the backslash character ("\"). 

### <a id="samePointerNoCycle" href="#samePointerNoCycle">var samePointerNoCycle</a>

```
searchKey: json.samePointerNoCycle
tags: [variable struct private]
```

```Go
var samePointerNoCycle = &SamePointerNoCycle{}
```

### <a id="scannerPool" href="#scannerPool">var scannerPool</a>

```
searchKey: json.scannerPool
tags: [variable struct private]
```

```Go
var scannerPool = sync.Pool{
	New: func() interface{} {
		return &scanner{}
	},
}
```

### <a id="sliceCycle" href="#sliceCycle">var sliceCycle</a>

```
searchKey: json.sliceCycle
tags: [variable array interface private]
```

```Go
var sliceCycle = []interface{}{nil}
```

### <a id="sliceNoCycle" href="#sliceNoCycle">var sliceNoCycle</a>

```
searchKey: json.sliceNoCycle
tags: [variable array interface private]
```

```Go
var sliceNoCycle = []interface{}{nil, nil}
```

### <a id="streamEncoded" href="#streamEncoded">var streamEncoded</a>

```
searchKey: json.streamEncoded
tags: [variable string private]
```

```Go
var streamEncoded = `0.1
"hello"
null
true
false
["a","b","c"]
{"ß":"long s","K":"Kelvin"}
3.14
`
```

### <a id="streamEncodedIndent" href="#streamEncodedIndent">var streamEncodedIndent</a>

```
searchKey: json.streamEncodedIndent
tags: [variable string private]
```

```Go
var streamEncodedIndent = ...
```

### <a id="streamTest" href="#streamTest">var streamTest</a>

```
searchKey: json.streamTest
tags: [variable array interface private]
```

```Go
var streamTest = ...
```

Test values for the stream test. One of each JSON kind. 

### <a id="structTagObjectKeyTests" href="#structTagObjectKeyTests">var structTagObjectKeyTests</a>

```
searchKey: json.structTagObjectKeyTests
tags: [variable array struct private]
```

```Go
var structTagObjectKeyTests = ...
```

### <a id="textMarshalerType" href="#textMarshalerType">var textMarshalerType</a>

```
searchKey: json.textMarshalerType
tags: [variable interface private]
```

```Go
var textMarshalerType = reflect.TypeOf((*encoding.TextMarshaler)(nil)).Elem()
```

### <a id="textUnmarshalerType" href="#textUnmarshalerType">var textUnmarshalerType</a>

```
searchKey: json.textUnmarshalerType
tags: [variable interface private]
```

```Go
var textUnmarshalerType = reflect.TypeOf((*encoding.TextUnmarshaler)(nil)).Elem()
```

### <a id="tokenStreamCases" href="#tokenStreamCases">var tokenStreamCases</a>

```
searchKey: json.tokenStreamCases
tags: [variable array struct private]
```

```Go
var tokenStreamCases = ...
```

### <a id="ummapXY" href="#ummapXY">var ummapXY</a>

```
searchKey: json.ummapXY
tags: [variable object private]
```

```Go
var ummapXY = map[unmarshalerText]bool{{"x", "y"}: true}
```

### <a id="umslice" href="#umslice">var umslice</a>

```
searchKey: json.umslice
tags: [variable array struct private]
```

```Go
var umslice = []unmarshaler{{true}}
```

### <a id="umsliceXY" href="#umsliceXY">var umsliceXY</a>

```
searchKey: json.umsliceXY
tags: [variable array struct private]
```

```Go
var umsliceXY = []unmarshalerText{{"x", "y"}}
```

### <a id="umstruct" href="#umstruct">var umstruct</a>

```
searchKey: json.umstruct
tags: [variable struct private]
```

```Go
var umstruct = ustruct{unmarshaler{true}}
```

### <a id="umstructXY" href="#umstructXY">var umstructXY</a>

```
searchKey: json.umstructXY
tags: [variable struct private]
```

```Go
var umstructXY = ustructText{unmarshalerText{"x", "y"}}
```

### <a id="umtrue" href="#umtrue">var umtrue</a>

```
searchKey: json.umtrue
tags: [variable struct private]
```

```Go
var umtrue = unmarshaler{true}
```

### <a id="umtrueXY" href="#umtrueXY">var umtrueXY</a>

```
searchKey: json.umtrueXY
tags: [variable struct private]
```

```Go
var umtrueXY = unmarshalerText{"x", "y"}
```

### <a id="unmarshalSyntaxTests" href="#unmarshalSyntaxTests">var unmarshalSyntaxTests</a>

```
searchKey: json.unmarshalSyntaxTests
tags: [variable array string private]
```

```Go
var unmarshalSyntaxTests = ...
```

### <a id="unmarshalTests" href="#unmarshalTests">var unmarshalTests</a>

```
searchKey: json.unmarshalTests
tags: [variable array struct private]
```

```Go
var unmarshalTests = ...
```

### <a id="unsupportedValues" href="#unsupportedValues">var unsupportedValues</a>

```
searchKey: json.unsupportedValues
tags: [variable array interface private]
```

```Go
var unsupportedValues = ...
```

### <a id="validTests" href="#validTests">var validTests</a>

```
searchKey: json.validTests
tags: [variable array struct private]
```

```Go
var validTests = ...
```

### <a id="wrongStringTests" href="#wrongStringTests">var wrongStringTests</a>

```
searchKey: json.wrongStringTests
tags: [variable array struct private]
```

```Go
var wrongStringTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="All" href="#All">type All struct</a>

```
searchKey: json.All
tags: [struct private]
```

```Go
type All struct {
	Bool    bool
	Int     int
	Int8    int8
	Int16   int16
	Int32   int32
	Int64   int64
	Uint    uint
	Uint8   uint8
	Uint16  uint16
	Uint32  uint32
	Uint64  uint64
	Uintptr uintptr
	Float32 float32
	Float64 float64

	Foo  string `json:"bar"`
	Foo2 string `json:"bar2,dummyopt"`

	IntStr     int64   `json:",string"`
	UintptrStr uintptr `json:",string"`

	PBool    *bool
	PInt     *int
	PInt8    *int8
	PInt16   *int16
	PInt32   *int32
	PInt64   *int64
	PUint    *uint
	PUint8   *uint8
	PUint16  *uint16
	PUint32  *uint32
	PUint64  *uint64
	PUintptr *uintptr
	PFloat32 *float32
	PFloat64 *float64

	String  string
	PString *string

	Map   map[string]Small
	MapP  map[string]*Small
	PMap  *map[string]Small
	PMapP *map[string]*Small

	EmptyMap map[string]Small
	NilMap   map[string]Small

	Slice   []Small
	SliceP  []*Small
	PSlice  *[]Small
	PSliceP *[]*Small

	EmptySlice []Small
	NilSlice   []Small

	StringSlice []string
	ByteSlice   []byte

	Small   Small
	PSmall  *Small
	PPSmall **Small

	Interface  interface{}
	PInterface *interface{}

	unexported int
}
```

### <a id="Ambig" href="#Ambig">type Ambig struct</a>

```
searchKey: json.Ambig
tags: [struct private]
```

```Go
type Ambig struct {
	// Given "hello", the first match should win.
	First  int `json:"HELLO"`
	Second int `json:"Hello"`
}
```

### <a id="B" href="#B">type B struct</a>

```
searchKey: json.B
tags: [struct private]
```

```Go
type B struct {
	B bool `json:",string"`
}
```

### <a id="BugA" href="#BugA">type BugA struct</a>

```
searchKey: json.BugA
tags: [struct private]
```

```Go
type BugA struct {
	S string
}
```

### <a id="BugB" href="#BugB">type BugB struct</a>

```
searchKey: json.BugB
tags: [struct private]
```

```Go
type BugB struct {
	BugA
	S string
}
```

### <a id="BugC" href="#BugC">type BugC struct</a>

```
searchKey: json.BugC
tags: [struct private]
```

```Go
type BugC struct {
	S string
}
```

### <a id="BugD" href="#BugD">type BugD struct</a>

```
searchKey: json.BugD
tags: [struct private]
```

```Go
type BugD struct {
	XXX string `json:"S"`
}
```

### <a id="BugX" href="#BugX">type BugX struct</a>

```
searchKey: json.BugX
tags: [struct private]
```

```Go
type BugX struct {
	A int
	BugA
	BugB
}
```

Legal Go: We never use the repeated embedded field (S). 

### <a id="BugY" href="#BugY">type BugY struct</a>

```
searchKey: json.BugY
tags: [struct private]
```

```Go
type BugY struct {
	BugA
	BugD
}
```

BugD's tagged S field should dominate BugA's. 

### <a id="BugZ" href="#BugZ">type BugZ struct</a>

```
searchKey: json.BugZ
tags: [struct private]
```

```Go
type BugZ struct {
	BugA
	BugC
	BugY // Contains a tagged S field through BugD; should not dominate.
}
```

There are no tags here, so S should not appear. 

### <a id="C" href="#C">type C int</a>

```
searchKey: json.C
tags: [number private]
```

```Go
type C int
```

C implements Marshaler and returns unescaped JSON. 

#### <a id="C.MarshalJSON" href="#C.MarshalJSON">func (C) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.C.MarshalJSON
tags: [method private]
```

```Go
func (C) MarshalJSON() ([]byte, error)
```

### <a id="CText" href="#CText">type CText int</a>

```
searchKey: json.CText
tags: [number private]
```

```Go
type CText int
```

CText implements Marshaler and returns unescaped text. 

#### <a id="CText.MarshalText" href="#CText.MarshalText">func (CText) MarshalText() ([]byte, error)</a>

```
searchKey: json.CText.MarshalText
tags: [method private]
```

```Go
func (CText) MarshalText() ([]byte, error)
```

### <a id="Decoder" href="#Decoder">type Decoder struct</a>

```
searchKey: json.Decoder
tags: [struct]
```

```Go
type Decoder struct {
	r       io.Reader
	buf     []byte
	d       decodeState
	scanp   int   // start of unread data in buf
	scanned int64 // amount of data already scanned
	scan    scanner
	err     error

	tokenState int
	tokenStack []int
}
```

A Decoder reads and decodes JSON values from an input stream. 

#### <a id="NewDecoder" href="#NewDecoder">func NewDecoder(r io.Reader) *Decoder</a>

```
searchKey: json.NewDecoder
tags: [function]
```

```Go
func NewDecoder(r io.Reader) *Decoder
```

NewDecoder returns a new decoder that reads from r. 

The decoder introduces its own buffering and may read data from r beyond the JSON values requested. 

#### <a id="Decoder.Buffered" href="#Decoder.Buffered">func (dec *Decoder) Buffered() io.Reader</a>

```
searchKey: json.Decoder.Buffered
tags: [method]
```

```Go
func (dec *Decoder) Buffered() io.Reader
```

Buffered returns a reader of the data remaining in the Decoder's buffer. The reader is valid until the next call to Decode. 

#### <a id="Decoder.Decode" href="#Decoder.Decode">func (dec *Decoder) Decode(v interface{}) error</a>

```
searchKey: json.Decoder.Decode
tags: [method]
```

```Go
func (dec *Decoder) Decode(v interface{}) error
```

Decode reads the next JSON-encoded value from its input and stores it in the value pointed to by v. 

See the documentation for Unmarshal for details about the conversion of JSON into a Go value. 

#### <a id="Decoder.DisallowUnknownFields" href="#Decoder.DisallowUnknownFields">func (dec *Decoder) DisallowUnknownFields()</a>

```
searchKey: json.Decoder.DisallowUnknownFields
tags: [method]
```

```Go
func (dec *Decoder) DisallowUnknownFields()
```

DisallowUnknownFields causes the Decoder to return an error when the destination is a struct and the input contains object keys which do not match any non-ignored, exported fields in the destination. 

#### <a id="Decoder.InputOffset" href="#Decoder.InputOffset">func (dec *Decoder) InputOffset() int64</a>

```
searchKey: json.Decoder.InputOffset
tags: [method]
```

```Go
func (dec *Decoder) InputOffset() int64
```

InputOffset returns the input stream byte offset of the current decoder position. The offset gives the location of the end of the most recently returned token and the beginning of the next token. 

#### <a id="Decoder.More" href="#Decoder.More">func (dec *Decoder) More() bool</a>

```
searchKey: json.Decoder.More
tags: [method]
```

```Go
func (dec *Decoder) More() bool
```

More reports whether there is another element in the current array or object being parsed. 

#### <a id="Decoder.Token" href="#Decoder.Token">func (dec *Decoder) Token() (Token, error)</a>

```
searchKey: json.Decoder.Token
tags: [method]
```

```Go
func (dec *Decoder) Token() (Token, error)
```

Token returns the next JSON token in the input stream. At the end of the input stream, Token returns nil, io.EOF. 

Token guarantees that the delimiters [ ] { } it returns are properly nested and matched: if Token encounters an unexpected delimiter in the input, it will return an error. 

The input stream consists of basic JSON values—bool, string, number, and null—along with delimiters [ ] { } of type Delim to mark the start and end of arrays and objects. Commas and colons are elided. 

#### <a id="Decoder.UseNumber" href="#Decoder.UseNumber">func (dec *Decoder) UseNumber()</a>

```
searchKey: json.Decoder.UseNumber
tags: [method]
```

```Go
func (dec *Decoder) UseNumber()
```

UseNumber causes the Decoder to unmarshal a number into an interface{} as a Number instead of as a float64. 

#### <a id="Decoder.peek" href="#Decoder.peek">func (dec *Decoder) peek() (byte, error)</a>

```
searchKey: json.Decoder.peek
tags: [method private]
```

```Go
func (dec *Decoder) peek() (byte, error)
```

#### <a id="Decoder.readValue" href="#Decoder.readValue">func (dec *Decoder) readValue() (int, error)</a>

```
searchKey: json.Decoder.readValue
tags: [method private]
```

```Go
func (dec *Decoder) readValue() (int, error)
```

readValue reads a JSON value into dec.buf. It returns the length of the encoding. 

#### <a id="Decoder.refill" href="#Decoder.refill">func (dec *Decoder) refill() error</a>

```
searchKey: json.Decoder.refill
tags: [method private]
```

```Go
func (dec *Decoder) refill() error
```

#### <a id="Decoder.tokenError" href="#Decoder.tokenError">func (dec *Decoder) tokenError(c byte) (Token, error)</a>

```
searchKey: json.Decoder.tokenError
tags: [method private]
```

```Go
func (dec *Decoder) tokenError(c byte) (Token, error)
```

#### <a id="Decoder.tokenPrepareForDecode" href="#Decoder.tokenPrepareForDecode">func (dec *Decoder) tokenPrepareForDecode() error</a>

```
searchKey: json.Decoder.tokenPrepareForDecode
tags: [method private]
```

```Go
func (dec *Decoder) tokenPrepareForDecode() error
```

advance tokenstate from a separator state to a value state 

#### <a id="Decoder.tokenValueAllowed" href="#Decoder.tokenValueAllowed">func (dec *Decoder) tokenValueAllowed() bool</a>

```
searchKey: json.Decoder.tokenValueAllowed
tags: [method private]
```

```Go
func (dec *Decoder) tokenValueAllowed() bool
```

#### <a id="Decoder.tokenValueEnd" href="#Decoder.tokenValueEnd">func (dec *Decoder) tokenValueEnd()</a>

```
searchKey: json.Decoder.tokenValueEnd
tags: [method private]
```

```Go
func (dec *Decoder) tokenValueEnd()
```

### <a id="Delim" href="#Delim">type Delim rune</a>

```
searchKey: json.Delim
tags: [number]
```

```Go
type Delim rune
```

A Delim is a JSON array or object delimiter, one of [ ] { or }. 

#### <a id="Delim.String" href="#Delim.String">func (d Delim) String() string</a>

```
searchKey: json.Delim.String
tags: [method]
```

```Go
func (d Delim) String() string
```

### <a id="DoublePtr" href="#DoublePtr">type DoublePtr struct</a>

```
searchKey: json.DoublePtr
tags: [struct private]
```

```Go
type DoublePtr struct {
	I **int
	J **int
}
```

### <a id="Embed0" href="#Embed0">type Embed0 struct</a>

```
searchKey: json.Embed0
tags: [struct private]
```

```Go
type Embed0 struct {
	Level1a int // overridden by Embed0a's Level1a with json tag
	Level1b int // used because Embed0a's Level1b is renamed
	Level1c int // used because Embed0a's Level1c is ignored
	Level1d int // annihilated by Embed0a's Level1d
	Level1e int `json:"x"` // annihilated by Embed0a.Level1e
}
```

### <a id="Embed0a" href="#Embed0a">type Embed0a struct</a>

```
searchKey: json.Embed0a
tags: [struct private]
```

```Go
type Embed0a struct {
	Level1a int `json:"Level1a,omitempty"`
	Level1b int `json:"LEVEL1B,omitempty"`
	Level1c int `json:"-"`
	Level1d int // annihilated by Embed0's Level1d
	Level1f int `json:"x"` // annihilated by Embed0's Level1e
}
```

### <a id="Embed0b" href="#Embed0b">type Embed0b json.Embed0</a>

```
searchKey: json.Embed0b
tags: [struct private]
```

```Go
type Embed0b Embed0
```

### <a id="Embed0c" href="#Embed0c">type Embed0c json.Embed0</a>

```
searchKey: json.Embed0c
tags: [struct private]
```

```Go
type Embed0c Embed0
```

### <a id="Embed0p" href="#Embed0p">type Embed0p struct</a>

```
searchKey: json.Embed0p
tags: [struct private]
```

```Go
type Embed0p struct {
	image.Point
}
```

### <a id="Embed0q" href="#Embed0q">type Embed0q struct</a>

```
searchKey: json.Embed0q
tags: [struct private]
```

```Go
type Embed0q struct {
	Point
}
```

### <a id="Encoder" href="#Encoder">type Encoder struct</a>

```
searchKey: json.Encoder
tags: [struct]
```

```Go
type Encoder struct {
	w          io.Writer
	err        error
	escapeHTML bool

	indentBuf    *bytes.Buffer
	indentPrefix string
	indentValue  string
}
```

An Encoder writes JSON values to an output stream. 

#### <a id="NewEncoder" href="#NewEncoder">func NewEncoder(w io.Writer) *Encoder</a>

```
searchKey: json.NewEncoder
tags: [function]
```

```Go
func NewEncoder(w io.Writer) *Encoder
```

NewEncoder returns a new encoder that writes to w. 

#### <a id="Encoder.Encode" href="#Encoder.Encode">func (enc *Encoder) Encode(v interface{}) error</a>

```
searchKey: json.Encoder.Encode
tags: [method]
```

```Go
func (enc *Encoder) Encode(v interface{}) error
```

Encode writes the JSON encoding of v to the stream, followed by a newline character. 

See the documentation for Marshal for details about the conversion of Go values to JSON. 

#### <a id="Encoder.SetEscapeHTML" href="#Encoder.SetEscapeHTML">func (enc *Encoder) SetEscapeHTML(on bool)</a>

```
searchKey: json.Encoder.SetEscapeHTML
tags: [method]
```

```Go
func (enc *Encoder) SetEscapeHTML(on bool)
```

SetEscapeHTML specifies whether problematic HTML characters should be escaped inside JSON quoted strings. The default behavior is to escape &, <, and > to \u0026, \u003c, and \u003e to avoid certain safety problems that can arise when embedding JSON in HTML. 

In non-HTML settings where the escaping interferes with the readability of the output, SetEscapeHTML(false) disables this behavior. 

#### <a id="Encoder.SetIndent" href="#Encoder.SetIndent">func (enc *Encoder) SetIndent(prefix, indent string)</a>

```
searchKey: json.Encoder.SetIndent
tags: [method]
```

```Go
func (enc *Encoder) SetIndent(prefix, indent string)
```

SetIndent instructs the encoder to format each subsequent encoded value as if indented by the package-level function Indent(dst, src, prefix, indent). Calling SetIndent("", "") disables indentation. 

### <a id="InvalidUTF8Error" href="#InvalidUTF8Error">type InvalidUTF8Error struct</a>

```
searchKey: json.InvalidUTF8Error
tags: [struct]
```

```Go
type InvalidUTF8Error struct {
	S string // the whole string value that caused the error
}
```

Before Go 1.2, an InvalidUTF8Error was returned by Marshal when attempting to encode a string value with invalid UTF-8 sequences. As of Go 1.2, Marshal instead coerces the string to valid UTF-8 by replacing invalid bytes with the Unicode replacement rune U+FFFD. 

Deprecated: No longer used; kept for compatibility. 

#### <a id="InvalidUTF8Error.Error" href="#InvalidUTF8Error.Error">func (e *InvalidUTF8Error) Error() string</a>

```
searchKey: json.InvalidUTF8Error.Error
tags: [method]
```

```Go
func (e *InvalidUTF8Error) Error() string
```

### <a id="InvalidUnmarshalError" href="#InvalidUnmarshalError">type InvalidUnmarshalError struct</a>

```
searchKey: json.InvalidUnmarshalError
tags: [struct]
```

```Go
type InvalidUnmarshalError struct {
	Type reflect.Type
}
```

An InvalidUnmarshalError describes an invalid argument passed to Unmarshal. (The argument to Unmarshal must be a non-nil pointer.) 

#### <a id="InvalidUnmarshalError.Error" href="#InvalidUnmarshalError.Error">func (e *InvalidUnmarshalError) Error() string</a>

```
searchKey: json.InvalidUnmarshalError.Error
tags: [method]
```

```Go
func (e *InvalidUnmarshalError) Error() string
```

### <a id="Loop" href="#Loop">type Loop struct</a>

```
searchKey: json.Loop
tags: [struct private]
```

```Go
type Loop struct {
	Loop1 int `json:",omitempty"`
	Loop2 int `json:",omitempty"`
	*Loop
}
```

### <a id="Marshaler" href="#Marshaler">type Marshaler interface</a>

```
searchKey: json.Marshaler
tags: [interface]
```

```Go
type Marshaler interface {
	MarshalJSON() ([]byte, error)
}
```

Marshaler is the interface implemented by types that can marshal themselves into valid JSON. 

### <a id="MarshalerError" href="#MarshalerError">type MarshalerError struct</a>

```
searchKey: json.MarshalerError
tags: [struct]
```

```Go
type MarshalerError struct {
	Type       reflect.Type
	Err        error
	sourceFunc string
}
```

A MarshalerError represents an error from calling a MarshalJSON or MarshalText method. 

#### <a id="MarshalerError.Error" href="#MarshalerError.Error">func (e *MarshalerError) Error() string</a>

```
searchKey: json.MarshalerError.Error
tags: [method]
```

```Go
func (e *MarshalerError) Error() string
```

#### <a id="MarshalerError.Unwrap" href="#MarshalerError.Unwrap">func (e *MarshalerError) Unwrap() error</a>

```
searchKey: json.MarshalerError.Unwrap
tags: [method]
```

```Go
func (e *MarshalerError) Unwrap() error
```

Unwrap returns the underlying error. 

### <a id="MustNotUnmarshalJSON" href="#MustNotUnmarshalJSON">type MustNotUnmarshalJSON struct{}</a>

```
searchKey: json.MustNotUnmarshalJSON
tags: [struct private]
```

```Go
type MustNotUnmarshalJSON struct{}
```

#### <a id="MustNotUnmarshalJSON.UnmarshalJSON" href="#MustNotUnmarshalJSON.UnmarshalJSON">func (x MustNotUnmarshalJSON) UnmarshalJSON(data []byte) error</a>

```
searchKey: json.MustNotUnmarshalJSON.UnmarshalJSON
tags: [method private]
```

```Go
func (x MustNotUnmarshalJSON) UnmarshalJSON(data []byte) error
```

### <a id="MustNotUnmarshalText" href="#MustNotUnmarshalText">type MustNotUnmarshalText struct{}</a>

```
searchKey: json.MustNotUnmarshalText
tags: [struct private]
```

```Go
type MustNotUnmarshalText struct{}
```

#### <a id="MustNotUnmarshalText.UnmarshalText" href="#MustNotUnmarshalText.UnmarshalText">func (x MustNotUnmarshalText) UnmarshalText(text []byte) error</a>

```
searchKey: json.MustNotUnmarshalText.UnmarshalText
tags: [method private]
```

```Go
func (x MustNotUnmarshalText) UnmarshalText(text []byte) error
```

### <a id="NullTest" href="#NullTest">type NullTest struct</a>

```
searchKey: json.NullTest
tags: [struct private]
```

```Go
type NullTest struct {
	Bool      bool
	Int       int
	Int8      int8
	Int16     int16
	Int32     int32
	Int64     int64
	Uint      uint
	Uint8     uint8
	Uint16    uint16
	Uint32    uint32
	Uint64    uint64
	Float32   float32
	Float64   float64
	String    string
	PBool     *bool
	Map       map[string]string
	Slice     []string
	Interface interface{}

	PRaw    *RawMessage
	PTime   *time.Time
	PBigInt *big.Int
	PText   *MustNotUnmarshalText
	PBuffer *bytes.Buffer // has methods, just not relevant ones
	PStruct *struct{}

	Raw    RawMessage
	Time   time.Time
	BigInt big.Int
	Text   MustNotUnmarshalText
	Buffer bytes.Buffer
	Struct struct{}
}
```

### <a id="Number" href="#Number">type Number string</a>

```
searchKey: json.Number
tags: [string]
```

```Go
type Number string
```

A Number represents a JSON number literal. 

#### <a id="Number.Float64" href="#Number.Float64">func (n Number) Float64() (float64, error)</a>

```
searchKey: json.Number.Float64
tags: [method]
```

```Go
func (n Number) Float64() (float64, error)
```

Float64 returns the number as a float64. 

#### <a id="Number.Int64" href="#Number.Int64">func (n Number) Int64() (int64, error)</a>

```
searchKey: json.Number.Int64
tags: [method]
```

```Go
func (n Number) Int64() (int64, error)
```

Int64 returns the number as an int64. 

#### <a id="Number.String" href="#Number.String">func (n Number) String() string</a>

```
searchKey: json.Number.String
tags: [method]
```

```Go
func (n Number) String() string
```

String returns the literal text of the number. 

### <a id="Optionals" href="#Optionals">type Optionals struct</a>

```
searchKey: json.Optionals
tags: [struct private]
```

```Go
type Optionals struct {
	Sr string `json:"sr"`
	So string `json:"so,omitempty"`
	Sw string `json:"-"`

	Ir int `json:"omitempty"` // actually named omitempty, not an option
	Io int `json:"io,omitempty"`

	Slr []string `json:"slr,random"`
	Slo []string `json:"slo,omitempty"`

	Mr map[string]interface{} `json:"mr"`
	Mo map[string]interface{} `json:",omitempty"`

	Fr float64 `json:"fr"`
	Fo float64 `json:"fo,omitempty"`

	Br bool `json:"br"`
	Bo bool `json:"bo,omitempty"`

	Ur uint `json:"ur"`
	Uo uint `json:"uo,omitempty"`

	Str struct{} `json:"str"`
	Sto struct{} `json:"sto,omitempty"`
}
```

### <a id="P" href="#P">type P struct</a>

```
searchKey: json.P
tags: [struct private]
```

```Go
type P struct {
	PP PP
}
```

### <a id="PP" href="#PP">type PP struct</a>

```
searchKey: json.PP
tags: [struct private]
```

```Go
type PP struct {
	T  T
	Ts []T
}
```

### <a id="Point" href="#Point">type Point struct</a>

```
searchKey: json.Point
tags: [struct private]
```

```Go
type Point struct {
	Z int
}
```

### <a id="PointerCycle" href="#PointerCycle">type PointerCycle struct</a>

```
searchKey: json.PointerCycle
tags: [struct private]
```

```Go
type PointerCycle struct {
	Ptr *PointerCycle
}
```

### <a id="PointerCycleIndirect" href="#PointerCycleIndirect">type PointerCycleIndirect struct</a>

```
searchKey: json.PointerCycleIndirect
tags: [struct private]
```

```Go
type PointerCycleIndirect struct {
	Ptrs []interface{}
}
```

### <a id="RawMessage" href="#RawMessage">type RawMessage []byte</a>

```
searchKey: json.RawMessage
tags: [array number]
```

```Go
type RawMessage []byte
```

RawMessage is a raw encoded JSON value. It implements Marshaler and Unmarshaler and can be used to delay JSON decoding or precompute a JSON encoding. 

#### <a id="RawMessage.MarshalJSON" href="#RawMessage.MarshalJSON">func (m RawMessage) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.RawMessage.MarshalJSON
tags: [method]
```

```Go
func (m RawMessage) MarshalJSON() ([]byte, error)
```

MarshalJSON returns m as the JSON encoding of m. 

#### <a id="RawMessage.UnmarshalJSON" href="#RawMessage.UnmarshalJSON">func (m *RawMessage) UnmarshalJSON(data []byte) error</a>

```
searchKey: json.RawMessage.UnmarshalJSON
tags: [method]
```

```Go
func (m *RawMessage) UnmarshalJSON(data []byte) error
```

UnmarshalJSON sets *m to a copy of data. 

### <a id="RecursiveSlice" href="#RecursiveSlice">type RecursiveSlice []json.RecursiveSlice</a>

```
searchKey: json.RecursiveSlice
tags: [array private]
```

```Go
type RecursiveSlice []RecursiveSlice
```

### <a id="Ref" href="#Ref">type Ref int</a>

```
searchKey: json.Ref
tags: [number private]
```

```Go
type Ref int
```

Ref has Marshaler and Unmarshaler methods with pointer receiver. 

#### <a id="Ref.MarshalJSON" href="#Ref.MarshalJSON">func (*Ref) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.Ref.MarshalJSON
tags: [method private]
```

```Go
func (*Ref) MarshalJSON() ([]byte, error)
```

#### <a id="Ref.UnmarshalJSON" href="#Ref.UnmarshalJSON">func (r *Ref) UnmarshalJSON([]byte) error</a>

```
searchKey: json.Ref.UnmarshalJSON
tags: [method private]
```

```Go
func (r *Ref) UnmarshalJSON([]byte) error
```

### <a id="RefText" href="#RefText">type RefText int</a>

```
searchKey: json.RefText
tags: [number private]
```

```Go
type RefText int
```

RefText has Marshaler and Unmarshaler methods with pointer receiver. 

#### <a id="RefText.MarshalText" href="#RefText.MarshalText">func (*RefText) MarshalText() ([]byte, error)</a>

```
searchKey: json.RefText.MarshalText
tags: [method private]
```

```Go
func (*RefText) MarshalText() ([]byte, error)
```

#### <a id="RefText.UnmarshalText" href="#RefText.UnmarshalText">func (r *RefText) UnmarshalText([]byte) error</a>

```
searchKey: json.RefText.UnmarshalText
tags: [method private]
```

```Go
func (r *RefText) UnmarshalText([]byte) error
```

### <a id="S10" href="#S10">type S10 struct</a>

```
searchKey: json.S10
tags: [struct private]
```

```Go
type S10 struct {
	S11
	S12
	S13
}
```

From reflect test: The X in S11.S6 and S12.S6 annihilate, but they also block the X in S13.S8.S9. 

### <a id="S11" href="#S11">type S11 struct</a>

```
searchKey: json.S11
tags: [struct private]
```

```Go
type S11 struct {
	S6
}
```

### <a id="S12" href="#S12">type S12 struct</a>

```
searchKey: json.S12
tags: [struct private]
```

```Go
type S12 struct {
	S6
}
```

### <a id="S13" href="#S13">type S13 struct</a>

```
searchKey: json.S13
tags: [struct private]
```

```Go
type S13 struct {
	S8
}
```

### <a id="S5" href="#S5">type S5 struct</a>

```
searchKey: json.S5
tags: [struct private]
```

```Go
type S5 struct {
	S6
	S7
	S8
}
```

From reflect test: The X in S6 and S7 annihilate, but they also block the X in S8.S9. 

### <a id="S6" href="#S6">type S6 struct</a>

```
searchKey: json.S6
tags: [struct private]
```

```Go
type S6 struct {
	X int
}
```

### <a id="S7" href="#S7">type S7 json.S6</a>

```
searchKey: json.S7
tags: [struct private]
```

```Go
type S7 S6
```

### <a id="S8" href="#S8">type S8 struct</a>

```
searchKey: json.S8
tags: [struct private]
```

```Go
type S8 struct {
	S9
}
```

### <a id="S9" href="#S9">type S9 struct</a>

```
searchKey: json.S9
tags: [struct private]
```

```Go
type S9 struct {
	X int
	Y int
}
```

### <a id="SS" href="#SS">type SS string</a>

```
searchKey: json.SS
tags: [string private]
```

```Go
type SS string
```

#### <a id="SS.UnmarshalJSON" href="#SS.UnmarshalJSON">func (*SS) UnmarshalJSON(data []byte) error</a>

```
searchKey: json.SS.UnmarshalJSON
tags: [method private]
```

```Go
func (*SS) UnmarshalJSON(data []byte) error
```

### <a id="SamePointerNoCycle" href="#SamePointerNoCycle">type SamePointerNoCycle struct</a>

```
searchKey: json.SamePointerNoCycle
tags: [struct private]
```

```Go
type SamePointerNoCycle struct {
	Ptr1, Ptr2 *SamePointerNoCycle
}
```

### <a id="Small" href="#Small">type Small struct</a>

```
searchKey: json.Small
tags: [struct private]
```

```Go
type Small struct {
	Tag string
}
```

### <a id="StringTag" href="#StringTag">type StringTag struct</a>

```
searchKey: json.StringTag
tags: [struct private]
```

```Go
type StringTag struct {
	BoolStr    bool    `json:",string"`
	IntStr     int64   `json:",string"`
	UintptrStr uintptr `json:",string"`
	StrStr     string  `json:",string"`
	NumberStr  Number  `json:",string"`
}
```

### <a id="SyntaxError" href="#SyntaxError">type SyntaxError struct</a>

```
searchKey: json.SyntaxError
tags: [struct]
```

```Go
type SyntaxError struct {
	msg    string // description of error
	Offset int64  // error occurred after reading Offset bytes
}
```

A SyntaxError is a description of a JSON syntax error. 

#### <a id="SyntaxError.Error" href="#SyntaxError.Error">func (e *SyntaxError) Error() string</a>

```
searchKey: json.SyntaxError.Error
tags: [method]
```

```Go
func (e *SyntaxError) Error() string
```

### <a id="T" href="#T">type T struct</a>

```
searchKey: json.T
tags: [struct private]
```

```Go
type T struct {
	X string
	Y int
	Z int `json:"-"`
}
```

### <a id="Time3339" href="#Time3339">type Time3339 time.Time</a>

```
searchKey: json.Time3339
tags: [struct private]
```

```Go
type Time3339 time.Time
```

Time3339 is a time.Time which encodes to and from JSON as an RFC 3339 time in UTC. 

#### <a id="Time3339.UnmarshalJSON" href="#Time3339.UnmarshalJSON">func (t *Time3339) UnmarshalJSON(b []byte) error</a>

```
searchKey: json.Time3339.UnmarshalJSON
tags: [method private]
```

```Go
func (t *Time3339) UnmarshalJSON(b []byte) error
```

### <a id="Token" href="#Token">type Token interface{}</a>

```
searchKey: json.Token
tags: [interface]
```

```Go
type Token interface{}
```

A Token holds a value of one of these types: 

```
Delim, for the four JSON delimiters [ ] { }
bool, for JSON booleans
float64, for JSON numbers
Number, for JSON numbers
string, for JSON string literals
nil, for JSON null

```
### <a id="Top" href="#Top">type Top struct</a>

```
searchKey: json.Top
tags: [struct private]
```

```Go
type Top struct {
	Level0 int
	Embed0
	*Embed0a
	*Embed0b `json:"e,omitempty"` // treated as named
	Embed0c  `json:"-"`           // ignored
	Loop
	Embed0p // has Point with X, Y, used
	Embed0q // has Point with Z, used
	embed   // contains exported field
}
```

### <a id="U" href="#U">type U struct</a>

```
searchKey: json.U
tags: [struct private]
```

```Go
type U struct {
	Alphabet string `json:"alpha"`
}
```

### <a id="UnmarshalFieldError" href="#UnmarshalFieldError">type UnmarshalFieldError struct</a>

```
searchKey: json.UnmarshalFieldError
tags: [struct]
```

```Go
type UnmarshalFieldError struct {
	Key   string
	Type  reflect.Type
	Field reflect.StructField
}
```

An UnmarshalFieldError describes a JSON object key that led to an unexported (and therefore unwritable) struct field. 

Deprecated: No longer used; kept for compatibility. 

#### <a id="UnmarshalFieldError.Error" href="#UnmarshalFieldError.Error">func (e *UnmarshalFieldError) Error() string</a>

```
searchKey: json.UnmarshalFieldError.Error
tags: [method]
```

```Go
func (e *UnmarshalFieldError) Error() string
```

### <a id="UnmarshalTypeError" href="#UnmarshalTypeError">type UnmarshalTypeError struct</a>

```
searchKey: json.UnmarshalTypeError
tags: [struct]
```

```Go
type UnmarshalTypeError struct {
	Value  string       // description of JSON value - "bool", "array", "number -5"
	Type   reflect.Type // type of Go value it could not be assigned to
	Offset int64        // error occurred after reading Offset bytes
	Struct string       // name of the struct type containing the field
	Field  string       // the full path from root node to the field
}
```

An UnmarshalTypeError describes a JSON value that was not appropriate for a value of a specific Go type. 

#### <a id="UnmarshalTypeError.Error" href="#UnmarshalTypeError.Error">func (e *UnmarshalTypeError) Error() string</a>

```
searchKey: json.UnmarshalTypeError.Error
tags: [method]
```

```Go
func (e *UnmarshalTypeError) Error() string
```

### <a id="Unmarshaler" href="#Unmarshaler">type Unmarshaler interface</a>

```
searchKey: json.Unmarshaler
tags: [interface]
```

```Go
type Unmarshaler interface {
	UnmarshalJSON([]byte) error
}
```

Unmarshaler is the interface implemented by types that can unmarshal a JSON description of themselves. The input can be assumed to be a valid encoding of a JSON value. UnmarshalJSON must copy the JSON data if it wishes to retain the data after returning. 

By convention, to approximate the behavior of Unmarshal itself, Unmarshalers implement UnmarshalJSON([]byte("null")) as a no-op. 

#### <a id="indirect" href="#indirect">func indirect(v reflect.Value, decodingNull bool) (Unmarshaler, encoding.TextUnmarshaler, reflect.Value)</a>

```
searchKey: json.indirect
tags: [function private]
```

```Go
func indirect(v reflect.Value, decodingNull bool) (Unmarshaler, encoding.TextUnmarshaler, reflect.Value)
```

indirect walks down v allocating pointers as needed, until it gets to a non-pointer. If it encounters an Unmarshaler, indirect stops and returns that. If decodingNull is true, indirect stops at the first settable pointer so it can be set to nil. 

### <a id="UnsupportedTypeError" href="#UnsupportedTypeError">type UnsupportedTypeError struct</a>

```
searchKey: json.UnsupportedTypeError
tags: [struct]
```

```Go
type UnsupportedTypeError struct {
	Type reflect.Type
}
```

An UnsupportedTypeError is returned by Marshal when attempting to encode an unsupported value type. 

#### <a id="UnsupportedTypeError.Error" href="#UnsupportedTypeError.Error">func (e *UnsupportedTypeError) Error() string</a>

```
searchKey: json.UnsupportedTypeError.Error
tags: [method]
```

```Go
func (e *UnsupportedTypeError) Error() string
```

### <a id="UnsupportedValueError" href="#UnsupportedValueError">type UnsupportedValueError struct</a>

```
searchKey: json.UnsupportedValueError
tags: [struct]
```

```Go
type UnsupportedValueError struct {
	Value reflect.Value
	Str   string
}
```

An UnsupportedValueError is returned by Marshal when attempting to encode an unsupported value. 

#### <a id="UnsupportedValueError.Error" href="#UnsupportedValueError.Error">func (e *UnsupportedValueError) Error() string</a>

```
searchKey: json.UnsupportedValueError.Error
tags: [method]
```

```Go
func (e *UnsupportedValueError) Error() string
```

### <a id="V" href="#V">type V struct</a>

```
searchKey: json.V
tags: [struct private]
```

```Go
type V struct {
	F1 interface{}
	F2 int32
	F3 Number
	F4 *VOuter
}
```

### <a id="VOuter" href="#VOuter">type VOuter struct</a>

```
searchKey: json.VOuter
tags: [struct private]
```

```Go
type VOuter struct {
	V V
}
```

### <a id="Val" href="#Val">type Val int</a>

```
searchKey: json.Val
tags: [number private]
```

```Go
type Val int
```

Val has Marshaler methods with value receiver. 

#### <a id="Val.MarshalJSON" href="#Val.MarshalJSON">func (Val) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.Val.MarshalJSON
tags: [method private]
```

```Go
func (Val) MarshalJSON() ([]byte, error)
```

### <a id="ValText" href="#ValText">type ValText int</a>

```
searchKey: json.ValText
tags: [number private]
```

```Go
type ValText int
```

ValText has Marshaler methods with value receiver. 

#### <a id="ValText.MarshalText" href="#ValText.MarshalText">func (ValText) MarshalText() ([]byte, error)</a>

```
searchKey: json.ValText.MarshalText
tags: [method private]
```

```Go
func (ValText) MarshalText() ([]byte, error)
```

### <a id="W" href="#W">type W struct</a>

```
searchKey: json.W
tags: [struct private]
```

```Go
type W struct {
	S SS
}
```

### <a id="WrongString" href="#WrongString">type WrongString struct</a>

```
searchKey: json.WrongString
tags: [struct private]
```

```Go
type WrongString struct {
	Message string `json:"result,string"`
}
```

WrongString is a struct that's misusing the ,string modifier. 

### <a id="XYZ" href="#XYZ">type XYZ struct</a>

```
searchKey: json.XYZ
tags: [struct private]
```

```Go
type XYZ struct {
	X interface{}
	Y interface{}
	Z interface{}
}
```

### <a id="Xint" href="#Xint">type Xint struct</a>

```
searchKey: json.Xint
tags: [struct private]
```

```Go
type Xint struct {
	X int
}
```

### <a id="arrayEncoder" href="#arrayEncoder">type arrayEncoder struct</a>

```
searchKey: json.arrayEncoder
tags: [struct private]
```

```Go
type arrayEncoder struct {
	elemEnc encoderFunc
}
```

#### <a id="arrayEncoder.encode" href="#arrayEncoder.encode">func (ae arrayEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.arrayEncoder.encode
tags: [method private]
```

```Go
func (ae arrayEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="badCodeTag" href="#badCodeTag">type badCodeTag struct</a>

```
searchKey: json.badCodeTag
tags: [struct private]
```

```Go
type badCodeTag struct {
	Z string `json:" !\"#&'()*+,."`
}
```

### <a id="badFormatTag" href="#badFormatTag">type badFormatTag struct</a>

```
searchKey: json.badFormatTag
tags: [struct private]
```

```Go
type badFormatTag struct {
	Y string `:"BadFormat"`
}
```

### <a id="basicLatin2xTag" href="#basicLatin2xTag">type basicLatin2xTag struct</a>

```
searchKey: json.basicLatin2xTag
tags: [struct private]
```

```Go
type basicLatin2xTag struct {
	V string `json:"$%-/"`
}
```

### <a id="basicLatin3xTag" href="#basicLatin3xTag">type basicLatin3xTag struct</a>

```
searchKey: json.basicLatin3xTag
tags: [struct private]
```

```Go
type basicLatin3xTag struct {
	V string `json:"0123456789"`
}
```

### <a id="basicLatin4xTag" href="#basicLatin4xTag">type basicLatin4xTag struct</a>

```
searchKey: json.basicLatin4xTag
tags: [struct private]
```

```Go
type basicLatin4xTag struct {
	V string `json:"ABCDEFGHIJKLMO"`
}
```

### <a id="basicLatin5xTag" href="#basicLatin5xTag">type basicLatin5xTag struct</a>

```
searchKey: json.basicLatin5xTag
tags: [struct private]
```

```Go
type basicLatin5xTag struct {
	V string `json:"PQRSTUVWXYZ_"`
}
```

### <a id="basicLatin6xTag" href="#basicLatin6xTag">type basicLatin6xTag struct</a>

```
searchKey: json.basicLatin6xTag
tags: [struct private]
```

```Go
type basicLatin6xTag struct {
	V string `json:"abcdefghijklmno"`
}
```

### <a id="basicLatin7xTag" href="#basicLatin7xTag">type basicLatin7xTag struct</a>

```
searchKey: json.basicLatin7xTag
tags: [struct private]
```

```Go
type basicLatin7xTag struct {
	V string `json:"pqrstuvwxyz"`
}
```

### <a id="byIndex" href="#byIndex">type byIndex []json.field</a>

```
searchKey: json.byIndex
tags: [array struct private]
```

```Go
type byIndex []field
```

byIndex sorts field by index sequence. 

#### <a id="byIndex.Len" href="#byIndex.Len">func (x byIndex) Len() int</a>

```
searchKey: json.byIndex.Len
tags: [method private]
```

```Go
func (x byIndex) Len() int
```

#### <a id="byIndex.Less" href="#byIndex.Less">func (x byIndex) Less(i, j int) bool</a>

```
searchKey: json.byIndex.Less
tags: [method private]
```

```Go
func (x byIndex) Less(i, j int) bool
```

#### <a id="byIndex.Swap" href="#byIndex.Swap">func (x byIndex) Swap(i, j int)</a>

```
searchKey: json.byIndex.Swap
tags: [method private]
```

```Go
func (x byIndex) Swap(i, j int)
```

### <a id="byteWithMarshalJSON" href="#byteWithMarshalJSON">type byteWithMarshalJSON byte</a>

```
searchKey: json.byteWithMarshalJSON
tags: [number private]
```

```Go
type byteWithMarshalJSON byte
```

#### <a id="byteWithMarshalJSON.MarshalJSON" href="#byteWithMarshalJSON.MarshalJSON">func (b byteWithMarshalJSON) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.byteWithMarshalJSON.MarshalJSON
tags: [method private]
```

```Go
func (b byteWithMarshalJSON) MarshalJSON() ([]byte, error)
```

#### <a id="byteWithMarshalJSON.UnmarshalJSON" href="#byteWithMarshalJSON.UnmarshalJSON">func (b *byteWithMarshalJSON) UnmarshalJSON(data []byte) error</a>

```
searchKey: json.byteWithMarshalJSON.UnmarshalJSON
tags: [method private]
```

```Go
func (b *byteWithMarshalJSON) UnmarshalJSON(data []byte) error
```

### <a id="byteWithMarshalText" href="#byteWithMarshalText">type byteWithMarshalText byte</a>

```
searchKey: json.byteWithMarshalText
tags: [number private]
```

```Go
type byteWithMarshalText byte
```

#### <a id="byteWithMarshalText.MarshalText" href="#byteWithMarshalText.MarshalText">func (b byteWithMarshalText) MarshalText() ([]byte, error)</a>

```
searchKey: json.byteWithMarshalText.MarshalText
tags: [method private]
```

```Go
func (b byteWithMarshalText) MarshalText() ([]byte, error)
```

#### <a id="byteWithMarshalText.UnmarshalText" href="#byteWithMarshalText.UnmarshalText">func (b *byteWithMarshalText) UnmarshalText(data []byte) error</a>

```
searchKey: json.byteWithMarshalText.UnmarshalText
tags: [method private]
```

```Go
func (b *byteWithMarshalText) UnmarshalText(data []byte) error
```

### <a id="byteWithPtrMarshalJSON" href="#byteWithPtrMarshalJSON">type byteWithPtrMarshalJSON byte</a>

```
searchKey: json.byteWithPtrMarshalJSON
tags: [number private]
```

```Go
type byteWithPtrMarshalJSON byte
```

#### <a id="byteWithPtrMarshalJSON.MarshalJSON" href="#byteWithPtrMarshalJSON.MarshalJSON">func (b *byteWithPtrMarshalJSON) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.byteWithPtrMarshalJSON.MarshalJSON
tags: [method private]
```

```Go
func (b *byteWithPtrMarshalJSON) MarshalJSON() ([]byte, error)
```

#### <a id="byteWithPtrMarshalJSON.UnmarshalJSON" href="#byteWithPtrMarshalJSON.UnmarshalJSON">func (b *byteWithPtrMarshalJSON) UnmarshalJSON(data []byte) error</a>

```
searchKey: json.byteWithPtrMarshalJSON.UnmarshalJSON
tags: [method private]
```

```Go
func (b *byteWithPtrMarshalJSON) UnmarshalJSON(data []byte) error
```

### <a id="byteWithPtrMarshalText" href="#byteWithPtrMarshalText">type byteWithPtrMarshalText byte</a>

```
searchKey: json.byteWithPtrMarshalText
tags: [number private]
```

```Go
type byteWithPtrMarshalText byte
```

#### <a id="byteWithPtrMarshalText.MarshalText" href="#byteWithPtrMarshalText.MarshalText">func (b *byteWithPtrMarshalText) MarshalText() ([]byte, error)</a>

```
searchKey: json.byteWithPtrMarshalText.MarshalText
tags: [method private]
```

```Go
func (b *byteWithPtrMarshalText) MarshalText() ([]byte, error)
```

#### <a id="byteWithPtrMarshalText.UnmarshalText" href="#byteWithPtrMarshalText.UnmarshalText">func (b *byteWithPtrMarshalText) UnmarshalText(data []byte) error</a>

```
searchKey: json.byteWithPtrMarshalText.UnmarshalText
tags: [method private]
```

```Go
func (b *byteWithPtrMarshalText) UnmarshalText(data []byte) error
```

### <a id="codeNode" href="#codeNode">type codeNode struct</a>

```
searchKey: json.codeNode
tags: [struct private]
```

```Go
type codeNode struct {
	Name     string      `json:"name"`
	Kids     []*codeNode `json:"kids"`
	CLWeight float64     `json:"cl_weight"`
	Touches  int         `json:"touches"`
	MinT     int64       `json:"min_t"`
	MaxT     int64       `json:"max_t"`
	MeanT    int64       `json:"mean_t"`
}
```

### <a id="codeResponse" href="#codeResponse">type codeResponse struct</a>

```
searchKey: json.codeResponse
tags: [struct private]
```

```Go
type codeResponse struct {
	Tree     *codeNode `json:"tree"`
	Username string    `json:"username"`
}
```

### <a id="condAddrEncoder" href="#condAddrEncoder">type condAddrEncoder struct</a>

```
searchKey: json.condAddrEncoder
tags: [struct private]
```

```Go
type condAddrEncoder struct {
	canAddrEnc, elseEnc encoderFunc
}
```

#### <a id="condAddrEncoder.encode" href="#condAddrEncoder.encode">func (ce condAddrEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.condAddrEncoder.encode
tags: [method private]
```

```Go
func (ce condAddrEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="dashTag" href="#dashTag">type dashTag struct</a>

```
searchKey: json.dashTag
tags: [struct private]
```

```Go
type dashTag struct {
	V string `json:"-,"`
}
```

### <a id="decodeState" href="#decodeState">type decodeState struct</a>

```
searchKey: json.decodeState
tags: [struct private]
```

```Go
type decodeState struct {
	data                  []byte
	off                   int // next read offset in data
	opcode                int // last read result
	scan                  scanner
	errorContext          *errorContext
	savedError            error
	useNumber             bool
	disallowUnknownFields bool
}
```

decodeState represents the state while decoding a JSON value. 

#### <a id="decodeState.addErrorContext" href="#decodeState.addErrorContext">func (d *decodeState) addErrorContext(err error) error</a>

```
searchKey: json.decodeState.addErrorContext
tags: [method private]
```

```Go
func (d *decodeState) addErrorContext(err error) error
```

addErrorContext returns a new error enhanced with information from d.errorContext 

#### <a id="decodeState.array" href="#decodeState.array">func (d *decodeState) array(v reflect.Value) error</a>

```
searchKey: json.decodeState.array
tags: [method private]
```

```Go
func (d *decodeState) array(v reflect.Value) error
```

array consumes an array from d.data[d.off-1:], decoding into v. The first byte of the array ('[') has been read already. 

#### <a id="decodeState.arrayInterface" href="#decodeState.arrayInterface">func (d *decodeState) arrayInterface() []interface{}</a>

```
searchKey: json.decodeState.arrayInterface
tags: [method private]
```

```Go
func (d *decodeState) arrayInterface() []interface{}
```

arrayInterface is like array but returns []interface{}. 

#### <a id="decodeState.convertNumber" href="#decodeState.convertNumber">func (d *decodeState) convertNumber(s string) (interface{}, error)</a>

```
searchKey: json.decodeState.convertNumber
tags: [method private]
```

```Go
func (d *decodeState) convertNumber(s string) (interface{}, error)
```

convertNumber converts the number literal s to a float64 or a Number depending on the setting of d.useNumber. 

#### <a id="decodeState.init.decode.go" href="#decodeState.init.decode.go">func (d *decodeState) init(data []byte) *decodeState</a>

```
searchKey: json.decodeState.init
tags: [method private]
```

```Go
func (d *decodeState) init(data []byte) *decodeState
```

#### <a id="decodeState.literalInterface" href="#decodeState.literalInterface">func (d *decodeState) literalInterface() interface{}</a>

```
searchKey: json.decodeState.literalInterface
tags: [method private]
```

```Go
func (d *decodeState) literalInterface() interface{}
```

literalInterface consumes and returns a literal from d.data[d.off-1:] and it reads the following byte ahead. The first byte of the literal has been read already (that's how the caller knows it's a literal). 

#### <a id="decodeState.literalStore" href="#decodeState.literalStore">func (d *decodeState) literalStore(item []byte, v reflect.Value, fromQuoted bool) error</a>

```
searchKey: json.decodeState.literalStore
tags: [method private]
```

```Go
func (d *decodeState) literalStore(item []byte, v reflect.Value, fromQuoted bool) error
```

literalStore decodes a literal stored in item into v. 

fromQuoted indicates whether this literal came from unwrapping a string from the ",string" struct tag option. this is used only to produce more helpful error messages. 

#### <a id="decodeState.object" href="#decodeState.object">func (d *decodeState) object(v reflect.Value) error</a>

```
searchKey: json.decodeState.object
tags: [method private]
```

```Go
func (d *decodeState) object(v reflect.Value) error
```

object consumes an object from d.data[d.off-1:], decoding into v. The first byte ('{') of the object has been read already. 

#### <a id="decodeState.objectInterface" href="#decodeState.objectInterface">func (d *decodeState) objectInterface() map[string]interface{}</a>

```
searchKey: json.decodeState.objectInterface
tags: [method private]
```

```Go
func (d *decodeState) objectInterface() map[string]interface{}
```

objectInterface is like object but returns map[string]interface{}. 

#### <a id="decodeState.readIndex" href="#decodeState.readIndex">func (d *decodeState) readIndex() int</a>

```
searchKey: json.decodeState.readIndex
tags: [method private]
```

```Go
func (d *decodeState) readIndex() int
```

readIndex returns the position of the last byte read. 

#### <a id="decodeState.rescanLiteral" href="#decodeState.rescanLiteral">func (d *decodeState) rescanLiteral()</a>

```
searchKey: json.decodeState.rescanLiteral
tags: [method private]
```

```Go
func (d *decodeState) rescanLiteral()
```

rescanLiteral is similar to scanWhile(scanContinue), but it specialises the common case where we're decoding a literal. The decoder scans the input twice, once for syntax errors and to check the length of the value, and the second to perform the decoding. 

Only in the second step do we use decodeState to tokenize literals, so we know there aren't any syntax errors. We can take advantage of that knowledge, and scan a literal's bytes much more quickly. 

#### <a id="decodeState.saveError" href="#decodeState.saveError">func (d *decodeState) saveError(err error)</a>

```
searchKey: json.decodeState.saveError
tags: [method private]
```

```Go
func (d *decodeState) saveError(err error)
```

saveError saves the first err it is called with, for reporting at the end of the unmarshal. 

#### <a id="decodeState.scanNext" href="#decodeState.scanNext">func (d *decodeState) scanNext()</a>

```
searchKey: json.decodeState.scanNext
tags: [method private]
```

```Go
func (d *decodeState) scanNext()
```

scanNext processes the byte at d.data[d.off]. 

#### <a id="decodeState.scanWhile" href="#decodeState.scanWhile">func (d *decodeState) scanWhile(op int)</a>

```
searchKey: json.decodeState.scanWhile
tags: [method private]
```

```Go
func (d *decodeState) scanWhile(op int)
```

scanWhile processes bytes in d.data[d.off:] until it receives a scan code not equal to op. 

#### <a id="decodeState.skip" href="#decodeState.skip">func (d *decodeState) skip()</a>

```
searchKey: json.decodeState.skip
tags: [method private]
```

```Go
func (d *decodeState) skip()
```

skip scans to the end of what was started. 

#### <a id="decodeState.unmarshal" href="#decodeState.unmarshal">func (d *decodeState) unmarshal(v interface{}) error</a>

```
searchKey: json.decodeState.unmarshal
tags: [method private]
```

```Go
func (d *decodeState) unmarshal(v interface{}) error
```

#### <a id="decodeState.value" href="#decodeState.value">func (d *decodeState) value(v reflect.Value) error</a>

```
searchKey: json.decodeState.value
tags: [method private]
```

```Go
func (d *decodeState) value(v reflect.Value) error
```

value consumes a JSON value from d.data[d.off-1:], decoding into v, and reads the following byte ahead. If v is invalid, the value is discarded. The first byte of the value has been read already. 

#### <a id="decodeState.valueInterface" href="#decodeState.valueInterface">func (d *decodeState) valueInterface() (val interface{})</a>

```
searchKey: json.decodeState.valueInterface
tags: [method private]
```

```Go
func (d *decodeState) valueInterface() (val interface{})
```

valueInterface is like value but returns interface{} 

#### <a id="decodeState.valueQuoted" href="#decodeState.valueQuoted">func (d *decodeState) valueQuoted() interface{}</a>

```
searchKey: json.decodeState.valueQuoted
tags: [method private]
```

```Go
func (d *decodeState) valueQuoted() interface{}
```

valueQuoted is like value but decodes a quoted string literal or literal null into an interface value. If it finds anything other than a quoted string literal or null, valueQuoted returns unquotedValue{}. 

### <a id="decodeThis" href="#decodeThis">type decodeThis struct</a>

```
searchKey: json.decodeThis
tags: [struct private]
```

```Go
type decodeThis struct {
	v interface{}
}
```

### <a id="embed" href="#embed">type embed struct</a>

```
searchKey: json.embed
tags: [struct private]
```

```Go
type embed struct {
	Q int
}
```

### <a id="emptyTag" href="#emptyTag">type emptyTag struct</a>

```
searchKey: json.emptyTag
tags: [struct private]
```

```Go
type emptyTag struct {
	W string
}
```

### <a id="encOpts" href="#encOpts">type encOpts struct</a>

```
searchKey: json.encOpts
tags: [struct private]
```

```Go
type encOpts struct {
	// quoted causes primitive fields to be encoded inside JSON strings.
	quoted bool
	// escapeHTML causes '<', '>', and '&' to be escaped in JSON strings.
	escapeHTML bool
}
```

### <a id="encodeState" href="#encodeState">type encodeState struct</a>

```
searchKey: json.encodeState
tags: [struct private]
```

```Go
type encodeState struct {
	bytes.Buffer // accumulated output
	scratch      [64]byte

	// Keep track of what pointers we've seen in the current recursive call
	// path, to avoid cycles that could lead to a stack overflow. Only do
	// the relatively expensive map operations if ptrLevel is larger than
	// startDetectingCyclesAfter, so that we skip the work if we're within a
	// reasonable amount of nested pointers deep.
	ptrLevel uint
	ptrSeen  map[interface{}]struct{}
}
```

An encodeState encodes JSON into a bytes.Buffer. 

#### <a id="newEncodeState" href="#newEncodeState">func newEncodeState() *encodeState</a>

```
searchKey: json.newEncodeState
tags: [function private]
```

```Go
func newEncodeState() *encodeState
```

#### <a id="encodeState.error" href="#encodeState.error">func (e *encodeState) error(err error)</a>

```
searchKey: json.encodeState.error
tags: [method private]
```

```Go
func (e *encodeState) error(err error)
```

error aborts the encoding by panicking with err wrapped in jsonError. 

#### <a id="encodeState.marshal" href="#encodeState.marshal">func (e *encodeState) marshal(v interface{}, opts encOpts) (err error)</a>

```
searchKey: json.encodeState.marshal
tags: [method private]
```

```Go
func (e *encodeState) marshal(v interface{}, opts encOpts) (err error)
```

#### <a id="encodeState.reflectValue" href="#encodeState.reflectValue">func (e *encodeState) reflectValue(v reflect.Value, opts encOpts)</a>

```
searchKey: json.encodeState.reflectValue
tags: [method private]
```

```Go
func (e *encodeState) reflectValue(v reflect.Value, opts encOpts)
```

#### <a id="encodeState.string" href="#encodeState.string">func (e *encodeState) string(s string, escapeHTML bool)</a>

```
searchKey: json.encodeState.string
tags: [method private]
```

```Go
func (e *encodeState) string(s string, escapeHTML bool)
```

NOTE: keep in sync with stringBytes below. 

#### <a id="encodeState.stringBytes" href="#encodeState.stringBytes">func (e *encodeState) stringBytes(s []byte, escapeHTML bool)</a>

```
searchKey: json.encodeState.stringBytes
tags: [method private]
```

```Go
func (e *encodeState) stringBytes(s []byte, escapeHTML bool)
```

NOTE: keep in sync with string above. 

### <a id="encoderFunc" href="#encoderFunc">type encoderFunc func(e *std/encoding/json.encodeState, v reflect.Value, opts std/encoding/json.encOpts)</a>

```
searchKey: json.encoderFunc
tags: [function private]
```

```Go
type encoderFunc func(e *encodeState, v reflect.Value, opts encOpts)
```

#### <a id="newArrayEncoder" href="#newArrayEncoder">func newArrayEncoder(t reflect.Type) encoderFunc</a>

```
searchKey: json.newArrayEncoder
tags: [function private]
```

```Go
func newArrayEncoder(t reflect.Type) encoderFunc
```

#### <a id="newCondAddrEncoder" href="#newCondAddrEncoder">func newCondAddrEncoder(canAddrEnc, elseEnc encoderFunc) encoderFunc</a>

```
searchKey: json.newCondAddrEncoder
tags: [function private]
```

```Go
func newCondAddrEncoder(canAddrEnc, elseEnc encoderFunc) encoderFunc
```

newCondAddrEncoder returns an encoder that checks whether its value CanAddr and delegates to canAddrEnc if so, else to elseEnc. 

#### <a id="newMapEncoder" href="#newMapEncoder">func newMapEncoder(t reflect.Type) encoderFunc</a>

```
searchKey: json.newMapEncoder
tags: [function private]
```

```Go
func newMapEncoder(t reflect.Type) encoderFunc
```

#### <a id="newPtrEncoder" href="#newPtrEncoder">func newPtrEncoder(t reflect.Type) encoderFunc</a>

```
searchKey: json.newPtrEncoder
tags: [function private]
```

```Go
func newPtrEncoder(t reflect.Type) encoderFunc
```

#### <a id="newSliceEncoder" href="#newSliceEncoder">func newSliceEncoder(t reflect.Type) encoderFunc</a>

```
searchKey: json.newSliceEncoder
tags: [function private]
```

```Go
func newSliceEncoder(t reflect.Type) encoderFunc
```

#### <a id="newStructEncoder" href="#newStructEncoder">func newStructEncoder(t reflect.Type) encoderFunc</a>

```
searchKey: json.newStructEncoder
tags: [function private]
```

```Go
func newStructEncoder(t reflect.Type) encoderFunc
```

#### <a id="newTypeEncoder" href="#newTypeEncoder">func newTypeEncoder(t reflect.Type, allowAddr bool) encoderFunc</a>

```
searchKey: json.newTypeEncoder
tags: [function private]
```

```Go
func newTypeEncoder(t reflect.Type, allowAddr bool) encoderFunc
```

newTypeEncoder constructs an encoderFunc for a type. The returned encoder only checks CanAddr when allowAddr is true. 

#### <a id="typeEncoder" href="#typeEncoder">func typeEncoder(t reflect.Type) encoderFunc</a>

```
searchKey: json.typeEncoder
tags: [function private]
```

```Go
func typeEncoder(t reflect.Type) encoderFunc
```

#### <a id="valueEncoder" href="#valueEncoder">func valueEncoder(v reflect.Value) encoderFunc</a>

```
searchKey: json.valueEncoder
tags: [function private]
```

```Go
func valueEncoder(v reflect.Value) encoderFunc
```

### <a id="errorContext" href="#errorContext">type errorContext struct</a>

```
searchKey: json.errorContext
tags: [struct private]
```

```Go
type errorContext struct {
	Struct     reflect.Type
	FieldStack []string
}
```

An errorContext provides context for type errors during decoding. 

### <a id="example" href="#example">type example struct</a>

```
searchKey: json.example
tags: [struct private]
```

```Go
type example struct {
	compact string
	indent  string
}
```

### <a id="field" href="#field">type field struct</a>

```
searchKey: json.field
tags: [struct private]
```

```Go
type field struct {
	name      string
	nameBytes []byte                 // []byte(name)
	equalFold func(s, t []byte) bool // bytes.EqualFold or equivalent

	nameNonEsc  string // `"` + name + `":`
	nameEscHTML string // `"` + HTMLEscape(name) + `":`

	tag       bool
	index     []int
	typ       reflect.Type
	omitEmpty bool
	quoted    bool

	encoder encoderFunc
}
```

A field represents a single field found in a struct. 

#### <a id="dominantField" href="#dominantField">func dominantField(fields []field) (field, bool)</a>

```
searchKey: json.dominantField
tags: [function private]
```

```Go
func dominantField(fields []field) (field, bool)
```

dominantField looks through the fields, all of which are known to have the same name, to find the single field that dominates the others using Go's embedding rules, modified by the presence of JSON tags. If there are multiple top-level fields, the boolean will be false: This condition is an error in Go and we skip all the fields. 

### <a id="floatEncoder" href="#floatEncoder">type floatEncoder int</a>

```
searchKey: json.floatEncoder
tags: [number private]
```

```Go
type floatEncoder int // number of bits

```

#### <a id="floatEncoder.encode" href="#floatEncoder.encode">func (bits floatEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.floatEncoder.encode
tags: [method private]
```

```Go
func (bits floatEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="indentErrorTest" href="#indentErrorTest">type indentErrorTest struct</a>

```
searchKey: json.indentErrorTest
tags: [struct private]
```

```Go
type indentErrorTest struct {
	in  string
	err error
}
```

### <a id="intWithMarshalJSON" href="#intWithMarshalJSON">type intWithMarshalJSON int</a>

```
searchKey: json.intWithMarshalJSON
tags: [number private]
```

```Go
type intWithMarshalJSON int
```

#### <a id="intWithMarshalJSON.MarshalJSON" href="#intWithMarshalJSON.MarshalJSON">func (b intWithMarshalJSON) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.intWithMarshalJSON.MarshalJSON
tags: [method private]
```

```Go
func (b intWithMarshalJSON) MarshalJSON() ([]byte, error)
```

#### <a id="intWithMarshalJSON.UnmarshalJSON" href="#intWithMarshalJSON.UnmarshalJSON">func (b *intWithMarshalJSON) UnmarshalJSON(data []byte) error</a>

```
searchKey: json.intWithMarshalJSON.UnmarshalJSON
tags: [method private]
```

```Go
func (b *intWithMarshalJSON) UnmarshalJSON(data []byte) error
```

### <a id="intWithMarshalText" href="#intWithMarshalText">type intWithMarshalText int</a>

```
searchKey: json.intWithMarshalText
tags: [number private]
```

```Go
type intWithMarshalText int
```

#### <a id="intWithMarshalText.MarshalText" href="#intWithMarshalText.MarshalText">func (b intWithMarshalText) MarshalText() ([]byte, error)</a>

```
searchKey: json.intWithMarshalText.MarshalText
tags: [method private]
```

```Go
func (b intWithMarshalText) MarshalText() ([]byte, error)
```

#### <a id="intWithMarshalText.UnmarshalText" href="#intWithMarshalText.UnmarshalText">func (b *intWithMarshalText) UnmarshalText(data []byte) error</a>

```
searchKey: json.intWithMarshalText.UnmarshalText
tags: [method private]
```

```Go
func (b *intWithMarshalText) UnmarshalText(data []byte) error
```

### <a id="intWithPtrMarshalJSON" href="#intWithPtrMarshalJSON">type intWithPtrMarshalJSON int</a>

```
searchKey: json.intWithPtrMarshalJSON
tags: [number private]
```

```Go
type intWithPtrMarshalJSON int
```

#### <a id="intWithPtrMarshalJSON.MarshalJSON" href="#intWithPtrMarshalJSON.MarshalJSON">func (b *intWithPtrMarshalJSON) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.intWithPtrMarshalJSON.MarshalJSON
tags: [method private]
```

```Go
func (b *intWithPtrMarshalJSON) MarshalJSON() ([]byte, error)
```

#### <a id="intWithPtrMarshalJSON.UnmarshalJSON" href="#intWithPtrMarshalJSON.UnmarshalJSON">func (b *intWithPtrMarshalJSON) UnmarshalJSON(data []byte) error</a>

```
searchKey: json.intWithPtrMarshalJSON.UnmarshalJSON
tags: [method private]
```

```Go
func (b *intWithPtrMarshalJSON) UnmarshalJSON(data []byte) error
```

### <a id="intWithPtrMarshalText" href="#intWithPtrMarshalText">type intWithPtrMarshalText int</a>

```
searchKey: json.intWithPtrMarshalText
tags: [number private]
```

```Go
type intWithPtrMarshalText int
```

#### <a id="intWithPtrMarshalText.MarshalText" href="#intWithPtrMarshalText.MarshalText">func (b *intWithPtrMarshalText) MarshalText() ([]byte, error)</a>

```
searchKey: json.intWithPtrMarshalText.MarshalText
tags: [method private]
```

```Go
func (b *intWithPtrMarshalText) MarshalText() ([]byte, error)
```

#### <a id="intWithPtrMarshalText.UnmarshalText" href="#intWithPtrMarshalText.UnmarshalText">func (b *intWithPtrMarshalText) UnmarshalText(data []byte) error</a>

```
searchKey: json.intWithPtrMarshalText.UnmarshalText
tags: [method private]
```

```Go
func (b *intWithPtrMarshalText) UnmarshalText(data []byte) error
```

### <a id="jsonError" href="#jsonError">type jsonError struct</a>

```
searchKey: json.jsonError
tags: [struct private]
```

```Go
type jsonError struct{ error }
```

jsonError is an error wrapper type for internal use only. Panics with errors are wrapped in jsonError so that the top-level recover can distinguish intentional panics from this package. 

### <a id="jsonbyte" href="#jsonbyte">type jsonbyte byte</a>

```
searchKey: json.jsonbyte
tags: [number private]
```

```Go
type jsonbyte byte
```

#### <a id="jsonbyte.MarshalJSON" href="#jsonbyte.MarshalJSON">func (b jsonbyte) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.jsonbyte.MarshalJSON
tags: [method private]
```

```Go
func (b jsonbyte) MarshalJSON() ([]byte, error)
```

### <a id="jsonint" href="#jsonint">type jsonint int</a>

```
searchKey: json.jsonint
tags: [number private]
```

```Go
type jsonint int
```

#### <a id="jsonint.MarshalJSON" href="#jsonint.MarshalJSON">func (i jsonint) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.jsonint.MarshalJSON
tags: [method private]
```

```Go
func (i jsonint) MarshalJSON() ([]byte, error)
```

### <a id="mapEncoder" href="#mapEncoder">type mapEncoder struct</a>

```
searchKey: json.mapEncoder
tags: [struct private]
```

```Go
type mapEncoder struct {
	elemEnc encoderFunc
}
```

#### <a id="mapEncoder.encode" href="#mapEncoder.encode">func (me mapEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.mapEncoder.encode
tags: [method private]
```

```Go
func (me mapEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="mapStringToStringData" href="#mapStringToStringData">type mapStringToStringData struct</a>

```
searchKey: json.mapStringToStringData
tags: [struct private]
```

```Go
type mapStringToStringData struct {
	Data map[string]string `json:"data"`
}
```

### <a id="marshalPanic" href="#marshalPanic">type marshalPanic struct{}</a>

```
searchKey: json.marshalPanic
tags: [struct private]
```

```Go
type marshalPanic struct{}
```

#### <a id="marshalPanic.MarshalJSON" href="#marshalPanic.MarshalJSON">func (marshalPanic) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.marshalPanic.MarshalJSON
tags: [method private]
```

```Go
func (marshalPanic) MarshalJSON() ([]byte, error)
```

### <a id="miscPlaneTag" href="#miscPlaneTag">type miscPlaneTag struct</a>

```
searchKey: json.miscPlaneTag
tags: [struct private]
```

```Go
type miscPlaneTag struct {
	V string `json:"色は匂へど"`
}
```

### <a id="misnamedTag" href="#misnamedTag">type misnamedTag struct</a>

```
searchKey: json.misnamedTag
tags: [struct private]
```

```Go
type misnamedTag struct {
	X string `jsom:"Misnamed"`
}
```

### <a id="nilJSONMarshaler" href="#nilJSONMarshaler">type nilJSONMarshaler string</a>

```
searchKey: json.nilJSONMarshaler
tags: [string private]
```

```Go
type nilJSONMarshaler string
```

golang.org/issue/16042. Even if a nil interface value is passed in, as long as it implements Marshaler, it should be marshaled. 

#### <a id="nilJSONMarshaler.MarshalJSON" href="#nilJSONMarshaler.MarshalJSON">func (nm *nilJSONMarshaler) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.nilJSONMarshaler.MarshalJSON
tags: [method private]
```

```Go
func (nm *nilJSONMarshaler) MarshalJSON() ([]byte, error)
```

### <a id="nilTextMarshaler" href="#nilTextMarshaler">type nilTextMarshaler string</a>

```
searchKey: json.nilTextMarshaler
tags: [string private]
```

```Go
type nilTextMarshaler string
```

golang.org/issue/34235. Even if a nil interface value is passed in, as long as it implements encoding.TextMarshaler, it should be marshaled. 

#### <a id="nilTextMarshaler.MarshalText" href="#nilTextMarshaler.MarshalText">func (nm *nilTextMarshaler) MarshalText() ([]byte, error)</a>

```
searchKey: json.nilTextMarshaler.MarshalText
tags: [method private]
```

```Go
func (nm *nilTextMarshaler) MarshalText() ([]byte, error)
```

### <a id="percentSlashTag" href="#percentSlashTag">type percentSlashTag struct</a>

```
searchKey: json.percentSlashTag
tags: [struct private]
```

```Go
type percentSlashTag struct {
	V string `json:"text/html%"` // https://golang.org/issue/2718
}
```

### <a id="ptrEncoder" href="#ptrEncoder">type ptrEncoder struct</a>

```
searchKey: json.ptrEncoder
tags: [struct private]
```

```Go
type ptrEncoder struct {
	elemEnc encoderFunc
}
```

#### <a id="ptrEncoder.encode" href="#ptrEncoder.encode">func (pe ptrEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.ptrEncoder.encode
tags: [method private]
```

```Go
func (pe ptrEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="punctuationTag" href="#punctuationTag">type punctuationTag struct</a>

```
searchKey: json.punctuationTag
tags: [struct private]
```

```Go
type punctuationTag struct {
	V string `json:"!#$%&()*+-./:;<=>?@[]^_{|}~ "` // https://golang.org/issue/3546
}
```

### <a id="reflectWithString" href="#reflectWithString">type reflectWithString struct</a>

```
searchKey: json.reflectWithString
tags: [struct private]
```

```Go
type reflectWithString struct {
	k  reflect.Value
	v  reflect.Value
	ks string
}
```

#### <a id="reflectWithString.resolve" href="#reflectWithString.resolve">func (w *reflectWithString) resolve() error</a>

```
searchKey: json.reflectWithString.resolve
tags: [method private]
```

```Go
func (w *reflectWithString) resolve() error
```

### <a id="renamedByte" href="#renamedByte">type renamedByte byte</a>

```
searchKey: json.renamedByte
tags: [number private]
```

```Go
type renamedByte byte
```

byte slices are special even if they're renamed types. 

### <a id="renamedByteSlice" href="#renamedByteSlice">type renamedByteSlice []byte</a>

```
searchKey: json.renamedByteSlice
tags: [array number private]
```

```Go
type renamedByteSlice []byte
```

### <a id="renamedRenamedByteSlice" href="#renamedRenamedByteSlice">type renamedRenamedByteSlice []json.renamedByte</a>

```
searchKey: json.renamedRenamedByteSlice
tags: [array number private]
```

```Go
type renamedRenamedByteSlice []renamedByte
```

### <a id="scanner" href="#scanner">type scanner struct</a>

```
searchKey: json.scanner
tags: [struct private]
```

```Go
type scanner struct {
	// The step is a func to be called to execute the next transition.
	// Also tried using an integer constant and a single func
	// with a switch, but using the func directly was 10% faster
	// on a 64-bit Mac Mini, and it's nicer to read.
	step func(*scanner, byte) int

	// Reached end of top-level value.
	endTop bool

	// Stack of what we're in the middle of - array values, object keys, object values.
	parseState []int

	// Error that happened, if any.
	err error

	// total bytes consumed, updated by decoder.Decode (and deliberately
	// not set to zero by scan.reset)
	bytes int64
}
```

A scanner is a JSON scanning state machine. Callers call scan.reset and then pass bytes in one at a time by calling scan.step(&scan, c) for each byte. The return value, referred to as an opcode, tells the caller about significant parsing events like beginning and ending literals, objects, and arrays, so that the caller can follow along if it wishes. The return value scanEnd indicates that a single top-level JSON value has been completed, *before* the byte that just got passed in.  (The indication must be delayed in order to recognize the end of numbers: is 123 a whole value or the beginning of 12345e+6?). 

#### <a id="newScanner" href="#newScanner">func newScanner() *scanner</a>

```
searchKey: json.newScanner
tags: [function private]
```

```Go
func newScanner() *scanner
```

#### <a id="scanner.eof" href="#scanner.eof">func (s *scanner) eof() int</a>

```
searchKey: json.scanner.eof
tags: [method private]
```

```Go
func (s *scanner) eof() int
```

eof tells the scanner that the end of input has been reached. It returns a scan status just as s.step does. 

#### <a id="scanner.error" href="#scanner.error">func (s *scanner) error(c byte, context string) int</a>

```
searchKey: json.scanner.error
tags: [method private]
```

```Go
func (s *scanner) error(c byte, context string) int
```

error records an error and switches to the error state. 

#### <a id="scanner.popParseState" href="#scanner.popParseState">func (s *scanner) popParseState()</a>

```
searchKey: json.scanner.popParseState
tags: [method private]
```

```Go
func (s *scanner) popParseState()
```

popParseState pops a parse state (already obtained) off the stack and updates s.step accordingly. 

#### <a id="scanner.pushParseState" href="#scanner.pushParseState">func (s *scanner) pushParseState(c byte, newParseState int, successState int) int</a>

```
searchKey: json.scanner.pushParseState
tags: [method private]
```

```Go
func (s *scanner) pushParseState(c byte, newParseState int, successState int) int
```

pushParseState pushes a new parse state p onto the parse stack. an error state is returned if maxNestingDepth was exceeded, otherwise successState is returned. 

#### <a id="scanner.reset" href="#scanner.reset">func (s *scanner) reset()</a>

```
searchKey: json.scanner.reset
tags: [method private]
```

```Go
func (s *scanner) reset()
```

reset prepares the scanner for use. It must be called before calling s.step. 

### <a id="sliceEncoder" href="#sliceEncoder">type sliceEncoder struct</a>

```
searchKey: json.sliceEncoder
tags: [struct private]
```

```Go
type sliceEncoder struct {
	arrayEnc encoderFunc
}
```

sliceEncoder just wraps an arrayEncoder, checking to make sure the value isn't nil. 

#### <a id="sliceEncoder.encode" href="#sliceEncoder.encode">func (se sliceEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.sliceEncoder.encode
tags: [method private]
```

```Go
func (se sliceEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="spaceTag" href="#spaceTag">type spaceTag struct</a>

```
searchKey: json.spaceTag
tags: [struct private]
```

```Go
type spaceTag struct {
	Q string `json:"With space"`
}
```

### <a id="strMarshaler" href="#strMarshaler">type strMarshaler string</a>

```
searchKey: json.strMarshaler
tags: [string private]
```

```Go
type strMarshaler string
```

#### <a id="strMarshaler.MarshalJSON" href="#strMarshaler.MarshalJSON">func (s strMarshaler) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.strMarshaler.MarshalJSON
tags: [method private]
```

```Go
func (s strMarshaler) MarshalJSON() ([]byte, error)
```

### <a id="strPtrMarshaler" href="#strPtrMarshaler">type strPtrMarshaler string</a>

```
searchKey: json.strPtrMarshaler
tags: [string private]
```

```Go
type strPtrMarshaler string
```

#### <a id="strPtrMarshaler.MarshalJSON" href="#strPtrMarshaler.MarshalJSON">func (s *strPtrMarshaler) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.strPtrMarshaler.MarshalJSON
tags: [method private]
```

```Go
func (s *strPtrMarshaler) MarshalJSON() ([]byte, error)
```

### <a id="structEncoder" href="#structEncoder">type structEncoder struct</a>

```
searchKey: json.structEncoder
tags: [struct private]
```

```Go
type structEncoder struct {
	fields structFields
}
```

#### <a id="structEncoder.encode" href="#structEncoder.encode">func (se structEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.structEncoder.encode
tags: [method private]
```

```Go
func (se structEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="structFields" href="#structFields">type structFields struct</a>

```
searchKey: json.structFields
tags: [struct private]
```

```Go
type structFields struct {
	list      []field
	nameIndex map[string]int
}
```

#### <a id="cachedTypeFields" href="#cachedTypeFields">func cachedTypeFields(t reflect.Type) structFields</a>

```
searchKey: json.cachedTypeFields
tags: [function private]
```

```Go
func cachedTypeFields(t reflect.Type) structFields
```

cachedTypeFields is like typeFields but uses a cache to avoid repeated work. 

#### <a id="typeFields" href="#typeFields">func typeFields(t reflect.Type) structFields</a>

```
searchKey: json.typeFields
tags: [function private]
```

```Go
func typeFields(t reflect.Type) structFields
```

typeFields returns a list of fields that JSON should recognize for the given type. The algorithm is breadth-first search over the set of structs to include - the top struct and then any reachable anonymous structs. 

### <a id="tagOptions" href="#tagOptions">type tagOptions string</a>

```
searchKey: json.tagOptions
tags: [string private]
```

```Go
type tagOptions string
```

tagOptions is the string following a comma in a struct field's "json" tag, or the empty string. It does not include the leading comma. 

#### <a id="parseTag" href="#parseTag">func parseTag(tag string) (string, tagOptions)</a>

```
searchKey: json.parseTag
tags: [function private]
```

```Go
func parseTag(tag string) (string, tagOptions)
```

parseTag splits a struct field's json tag into its name and comma-separated options. 

#### <a id="tagOptions.Contains" href="#tagOptions.Contains">func (o tagOptions) Contains(optionName string) bool</a>

```
searchKey: json.tagOptions.Contains
tags: [method private]
```

```Go
func (o tagOptions) Contains(optionName string) bool
```

Contains reports whether a comma-separated list of options contains a particular substr flag. substr must be surrounded by a string boundary or commas. 

### <a id="textUnmarshalerString" href="#textUnmarshalerString">type textUnmarshalerString string</a>

```
searchKey: json.textUnmarshalerString
tags: [string private]
```

```Go
type textUnmarshalerString string
```

#### <a id="textUnmarshalerString.UnmarshalText" href="#textUnmarshalerString.UnmarshalText">func (m *textUnmarshalerString) UnmarshalText(text []byte) error</a>

```
searchKey: json.textUnmarshalerString.UnmarshalText
tags: [method private]
```

```Go
func (m *textUnmarshalerString) UnmarshalText(text []byte) error
```

### <a id="textbyte" href="#textbyte">type textbyte byte</a>

```
searchKey: json.textbyte
tags: [number private]
```

```Go
type textbyte byte
```

#### <a id="textbyte.MarshalText" href="#textbyte.MarshalText">func (b textbyte) MarshalText() ([]byte, error)</a>

```
searchKey: json.textbyte.MarshalText
tags: [method private]
```

```Go
func (b textbyte) MarshalText() ([]byte, error)
```

### <a id="textfloat" href="#textfloat">type textfloat float64</a>

```
searchKey: json.textfloat
tags: [number private]
```

```Go
type textfloat float64
```

#### <a id="textfloat.MarshalText" href="#textfloat.MarshalText">func (f textfloat) MarshalText() ([]byte, error)</a>

```
searchKey: json.textfloat.MarshalText
tags: [method private]
```

```Go
func (f textfloat) MarshalText() ([]byte, error)
```

### <a id="textint" href="#textint">type textint int</a>

```
searchKey: json.textint
tags: [number private]
```

```Go
type textint int
```

#### <a id="textint.MarshalText" href="#textint.MarshalText">func (i textint) MarshalText() ([]byte, error)</a>

```
searchKey: json.textint.MarshalText
tags: [method private]
```

```Go
func (i textint) MarshalText() ([]byte, error)
```

### <a id="tokenStreamCase" href="#tokenStreamCase">type tokenStreamCase struct</a>

```
searchKey: json.tokenStreamCase
tags: [struct private]
```

```Go
type tokenStreamCase struct {
	json      string
	expTokens []interface{}
}
```

### <a id="tx" href="#tx">type tx struct</a>

```
searchKey: json.tx
tags: [struct private]
```

```Go
type tx struct {
	x int
}
```

### <a id="u8" href="#u8">type u8 uint8</a>

```
searchKey: json.u8
tags: [number private]
```

```Go
type u8 uint8
```

### <a id="u8marshal" href="#u8marshal">type u8marshal uint8</a>

```
searchKey: json.u8marshal
tags: [number private]
```

```Go
type u8marshal uint8
```

u8marshal is an integer type that can marshal/unmarshal itself. 

#### <a id="u8marshal.MarshalText" href="#u8marshal.MarshalText">func (u8 u8marshal) MarshalText() ([]byte, error)</a>

```
searchKey: json.u8marshal.MarshalText
tags: [method private]
```

```Go
func (u8 u8marshal) MarshalText() ([]byte, error)
```

#### <a id="u8marshal.UnmarshalText" href="#u8marshal.UnmarshalText">func (u8 *u8marshal) UnmarshalText(b []byte) error</a>

```
searchKey: json.u8marshal.UnmarshalText
tags: [method private]
```

```Go
func (u8 *u8marshal) UnmarshalText(b []byte) error
```

### <a id="unexportedFields" href="#unexportedFields">type unexportedFields struct</a>

```
searchKey: json.unexportedFields
tags: [struct private]
```

```Go
type unexportedFields struct {
	Name string
	m    map[string]interface{} `json:"-"`
	m2   map[string]interface{} `json:"abcd"`

	s []int `json:"-"`
}
```

Test handling of unexported fields that should be ignored. Issue 4660 

### <a id="unexportedWithMethods" href="#unexportedWithMethods">type unexportedWithMethods struct{}</a>

```
searchKey: json.unexportedWithMethods
tags: [struct private]
```

```Go
type unexportedWithMethods struct{}
```

#### <a id="unexportedWithMethods.F" href="#unexportedWithMethods.F">func (unexportedWithMethods) F()</a>

```
searchKey: json.unexportedWithMethods.F
tags: [method private]
```

```Go
func (unexportedWithMethods) F()
```

### <a id="unicodeTag" href="#unicodeTag">type unicodeTag struct</a>

```
searchKey: json.unicodeTag
tags: [struct private]
```

```Go
type unicodeTag struct {
	W string `json:"Ελλάδα"`
}
```

### <a id="unmarshalPanic" href="#unmarshalPanic">type unmarshalPanic struct{}</a>

```
searchKey: json.unmarshalPanic
tags: [struct private]
```

```Go
type unmarshalPanic struct{}
```

#### <a id="unmarshalPanic.UnmarshalJSON" href="#unmarshalPanic.UnmarshalJSON">func (unmarshalPanic) UnmarshalJSON([]byte) error</a>

```
searchKey: json.unmarshalPanic.UnmarshalJSON
tags: [method private]
```

```Go
func (unmarshalPanic) UnmarshalJSON([]byte) error
```

### <a id="unmarshalTest" href="#unmarshalTest">type unmarshalTest struct</a>

```
searchKey: json.unmarshalTest
tags: [struct private]
```

```Go
type unmarshalTest struct {
	in                    string
	ptr                   interface{} // new(type)
	out                   interface{}
	err                   error
	useNumber             bool
	golden                bool
	disallowUnknownFields bool
}
```

### <a id="unmarshaler" href="#unmarshaler">type unmarshaler struct</a>

```
searchKey: json.unmarshaler
tags: [struct private]
```

```Go
type unmarshaler struct {
	T bool
}
```

#### <a id="unmarshaler.UnmarshalJSON" href="#unmarshaler.UnmarshalJSON">func (u *unmarshaler) UnmarshalJSON(b []byte) error</a>

```
searchKey: json.unmarshaler.UnmarshalJSON
tags: [method private]
```

```Go
func (u *unmarshaler) UnmarshalJSON(b []byte) error
```

### <a id="unmarshalerText" href="#unmarshalerText">type unmarshalerText struct</a>

```
searchKey: json.unmarshalerText
tags: [struct private]
```

```Go
type unmarshalerText struct {
	A, B string
}
```

#### <a id="unmarshalerText.MarshalText" href="#unmarshalerText.MarshalText">func (u unmarshalerText) MarshalText() ([]byte, error)</a>

```
searchKey: json.unmarshalerText.MarshalText
tags: [method private]
```

```Go
func (u unmarshalerText) MarshalText() ([]byte, error)
```

needed for re-marshaling tests 

#### <a id="unmarshalerText.UnmarshalText" href="#unmarshalerText.UnmarshalText">func (u *unmarshalerText) UnmarshalText(b []byte) error</a>

```
searchKey: json.unmarshalerText.UnmarshalText
tags: [method private]
```

```Go
func (u *unmarshalerText) UnmarshalText(b []byte) error
```

### <a id="unquotedValue" href="#unquotedValue">type unquotedValue struct{}</a>

```
searchKey: json.unquotedValue
tags: [struct private]
```

```Go
type unquotedValue struct{}
```

### <a id="ustruct" href="#ustruct">type ustruct struct</a>

```
searchKey: json.ustruct
tags: [struct private]
```

```Go
type ustruct struct {
	M unmarshaler
}
```

### <a id="ustructText" href="#ustructText">type ustructText struct</a>

```
searchKey: json.ustructText
tags: [struct private]
```

```Go
type ustructText struct {
	M unmarshalerText
}
```

### <a id="wrongStringTest" href="#wrongStringTest">type wrongStringTest struct</a>

```
searchKey: json.wrongStringTest
tags: [struct private]
```

```Go
type wrongStringTest struct {
	in, err string
}
```

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkCodeDecoder" href="#BenchmarkCodeDecoder">func BenchmarkCodeDecoder(b *testing.B)</a>

```
searchKey: json.BenchmarkCodeDecoder
tags: [function private benchmark]
```

```Go
func BenchmarkCodeDecoder(b *testing.B)
```

### <a id="BenchmarkCodeEncoder" href="#BenchmarkCodeEncoder">func BenchmarkCodeEncoder(b *testing.B)</a>

```
searchKey: json.BenchmarkCodeEncoder
tags: [function private benchmark]
```

```Go
func BenchmarkCodeEncoder(b *testing.B)
```

### <a id="BenchmarkCodeMarshal" href="#BenchmarkCodeMarshal">func BenchmarkCodeMarshal(b *testing.B)</a>

```
searchKey: json.BenchmarkCodeMarshal
tags: [function private benchmark]
```

```Go
func BenchmarkCodeMarshal(b *testing.B)
```

### <a id="BenchmarkCodeUnmarshal" href="#BenchmarkCodeUnmarshal">func BenchmarkCodeUnmarshal(b *testing.B)</a>

```
searchKey: json.BenchmarkCodeUnmarshal
tags: [function private benchmark]
```

```Go
func BenchmarkCodeUnmarshal(b *testing.B)
```

### <a id="BenchmarkCodeUnmarshalReuse" href="#BenchmarkCodeUnmarshalReuse">func BenchmarkCodeUnmarshalReuse(b *testing.B)</a>

```
searchKey: json.BenchmarkCodeUnmarshalReuse
tags: [function private benchmark]
```

```Go
func BenchmarkCodeUnmarshalReuse(b *testing.B)
```

### <a id="BenchmarkDecoderStream" href="#BenchmarkDecoderStream">func BenchmarkDecoderStream(b *testing.B)</a>

```
searchKey: json.BenchmarkDecoderStream
tags: [function private benchmark]
```

```Go
func BenchmarkDecoderStream(b *testing.B)
```

### <a id="BenchmarkEncodeMarshaler" href="#BenchmarkEncodeMarshaler">func BenchmarkEncodeMarshaler(b *testing.B)</a>

```
searchKey: json.BenchmarkEncodeMarshaler
tags: [function private benchmark]
```

```Go
func BenchmarkEncodeMarshaler(b *testing.B)
```

### <a id="BenchmarkEncoderEncode" href="#BenchmarkEncoderEncode">func BenchmarkEncoderEncode(b *testing.B)</a>

```
searchKey: json.BenchmarkEncoderEncode
tags: [function private benchmark]
```

```Go
func BenchmarkEncoderEncode(b *testing.B)
```

### <a id="BenchmarkIssue10335" href="#BenchmarkIssue10335">func BenchmarkIssue10335(b *testing.B)</a>

```
searchKey: json.BenchmarkIssue10335
tags: [function private benchmark]
```

```Go
func BenchmarkIssue10335(b *testing.B)
```

### <a id="BenchmarkIssue34127" href="#BenchmarkIssue34127">func BenchmarkIssue34127(b *testing.B)</a>

```
searchKey: json.BenchmarkIssue34127
tags: [function private benchmark]
```

```Go
func BenchmarkIssue34127(b *testing.B)
```

### <a id="BenchmarkMarshalBytes" href="#BenchmarkMarshalBytes">func BenchmarkMarshalBytes(b *testing.B)</a>

```
searchKey: json.BenchmarkMarshalBytes
tags: [function private benchmark]
```

```Go
func BenchmarkMarshalBytes(b *testing.B)
```

### <a id="BenchmarkNumberIsValid" href="#BenchmarkNumberIsValid">func BenchmarkNumberIsValid(b *testing.B)</a>

```
searchKey: json.BenchmarkNumberIsValid
tags: [function private benchmark]
```

```Go
func BenchmarkNumberIsValid(b *testing.B)
```

### <a id="BenchmarkNumberIsValidRegexp" href="#BenchmarkNumberIsValidRegexp">func BenchmarkNumberIsValidRegexp(b *testing.B)</a>

```
searchKey: json.BenchmarkNumberIsValidRegexp
tags: [function private benchmark]
```

```Go
func BenchmarkNumberIsValidRegexp(b *testing.B)
```

### <a id="BenchmarkTypeFieldsCache" href="#BenchmarkTypeFieldsCache">func BenchmarkTypeFieldsCache(b *testing.B)</a>

```
searchKey: json.BenchmarkTypeFieldsCache
tags: [function private benchmark]
```

```Go
func BenchmarkTypeFieldsCache(b *testing.B)
```

### <a id="BenchmarkUnicodeDecoder" href="#BenchmarkUnicodeDecoder">func BenchmarkUnicodeDecoder(b *testing.B)</a>

```
searchKey: json.BenchmarkUnicodeDecoder
tags: [function private benchmark]
```

```Go
func BenchmarkUnicodeDecoder(b *testing.B)
```

### <a id="BenchmarkUnmapped" href="#BenchmarkUnmapped">func BenchmarkUnmapped(b *testing.B)</a>

```
searchKey: json.BenchmarkUnmapped
tags: [function private benchmark]
```

```Go
func BenchmarkUnmapped(b *testing.B)
```

### <a id="BenchmarkUnmarshalFloat64" href="#BenchmarkUnmarshalFloat64">func BenchmarkUnmarshalFloat64(b *testing.B)</a>

```
searchKey: json.BenchmarkUnmarshalFloat64
tags: [function private benchmark]
```

```Go
func BenchmarkUnmarshalFloat64(b *testing.B)
```

### <a id="BenchmarkUnmarshalInt64" href="#BenchmarkUnmarshalInt64">func BenchmarkUnmarshalInt64(b *testing.B)</a>

```
searchKey: json.BenchmarkUnmarshalInt64
tags: [function private benchmark]
```

```Go
func BenchmarkUnmarshalInt64(b *testing.B)
```

### <a id="BenchmarkUnmarshalString" href="#BenchmarkUnmarshalString">func BenchmarkUnmarshalString(b *testing.B)</a>

```
searchKey: json.BenchmarkUnmarshalString
tags: [function private benchmark]
```

```Go
func BenchmarkUnmarshalString(b *testing.B)
```

### <a id="Compact" href="#Compact">func Compact(dst *bytes.Buffer, src []byte) error</a>

```
searchKey: json.Compact
tags: [function]
```

```Go
func Compact(dst *bytes.Buffer, src []byte) error
```

Compact appends to dst the JSON-encoded src with insignificant space characters elided. 

### <a id="HTMLEscape" href="#HTMLEscape">func HTMLEscape(dst *bytes.Buffer, src []byte)</a>

```
searchKey: json.HTMLEscape
tags: [function]
```

```Go
func HTMLEscape(dst *bytes.Buffer, src []byte)
```

HTMLEscape appends to dst the JSON-encoded src with <, >, &, U+2028 and U+2029 characters inside string literals changed to \u003c, \u003e, \u0026, \u2028, \u2029 so that the JSON will be safe to embed inside HTML <script> tags. For historical reasons, web browsers don't honor standard HTML escaping within <script> tags, so an alternative JSON encoding must be used. 

### <a id="Indent" href="#Indent">func Indent(dst *bytes.Buffer, src []byte, prefix, indent string) error</a>

```
searchKey: json.Indent
tags: [function]
```

```Go
func Indent(dst *bytes.Buffer, src []byte, prefix, indent string) error
```

Indent appends to dst an indented form of the JSON-encoded src. Each element in a JSON object or array begins on a new, indented line beginning with prefix followed by one or more copies of indent according to the indentation nesting. The data appended to dst does not begin with the prefix nor any indentation, to make it easier to embed inside other formatted JSON data. Although leading space characters (space, tab, carriage return, newline) at the beginning of src are dropped, trailing space characters at the end of src are preserved and copied to dst. For example, if src has no trailing spaces, neither will dst; if src ends in a trailing newline, so will dst. 

### <a id="Marshal" href="#Marshal">func Marshal(v interface{}) ([]byte, error)</a>

```
searchKey: json.Marshal
tags: [function]
```

```Go
func Marshal(v interface{}) ([]byte, error)
```

Marshal returns the JSON encoding of v. 

Marshal traverses the value v recursively. If an encountered value implements the Marshaler interface and is not a nil pointer, Marshal calls its MarshalJSON method to produce JSON. If no MarshalJSON method is present but the value implements encoding.TextMarshaler instead, Marshal calls its MarshalText method and encodes the result as a JSON string. The nil pointer exception is not strictly necessary but mimics a similar, necessary exception in the behavior of UnmarshalJSON. 

Otherwise, Marshal uses the following type-dependent default encodings: 

Boolean values encode as JSON booleans. 

Floating point, integer, and Number values encode as JSON numbers. 

String values encode as JSON strings coerced to valid UTF-8, replacing invalid bytes with the Unicode replacement rune. So that the JSON will be safe to embed inside HTML <script> tags, the string is encoded using HTMLEscape, which replaces "<", ">", "&", U+2028, and U+2029 are escaped to "\u003c","\u003e", "\u0026", "\u2028", and "\u2029". This replacement can be disabled when using an Encoder, by calling SetEscapeHTML(false). 

Array and slice values encode as JSON arrays, except that []byte encodes as a base64-encoded string, and a nil slice encodes as the null JSON value. 

Struct values encode as JSON objects. Each exported struct field becomes a member of the object, using the field name as the object key, unless the field is omitted for one of the reasons given below. 

The encoding of each struct field can be customized by the format string stored under the "json" key in the struct field's tag. The format string gives the name of the field, possibly followed by a comma-separated list of options. The name may be empty in order to specify options without overriding the default field name. 

The "omitempty" option specifies that the field should be omitted from the encoding if the field has an empty value, defined as false, 0, a nil pointer, a nil interface value, and any empty array, slice, map, or string. 

As a special case, if the field tag is "-", the field is always omitted. Note that a field with name "-" can still be generated using the tag "-,". 

Examples of struct field tags and their meanings: 

```
// Field appears in JSON as key "myName".
Field int `json:"myName"`

// Field appears in JSON as key "myName" and
// the field is omitted from the object if its value is empty,
// as defined above.
Field int `json:"myName,omitempty"`

// Field appears in JSON as key "Field" (the default), but
// the field is skipped if empty.
// Note the leading comma.
Field int `json:",omitempty"`

// Field is ignored by this package.
Field int `json:"-"`

// Field appears in JSON as key "-".
Field int `json:"-,"`

```
The "string" option signals that a field is stored as JSON inside a JSON-encoded string. It applies only to fields of string, floating point, integer, or boolean types. This extra level of encoding is sometimes used when communicating with JavaScript programs: 

```
Int64String int64 `json:",string"`

```
The key name will be used if it's a non-empty string consisting of only Unicode letters, digits, and ASCII punctuation except quotation marks, backslash, and comma. 

Anonymous struct fields are usually marshaled as if their inner exported fields were fields in the outer struct, subject to the usual Go visibility rules amended as described in the next paragraph. An anonymous struct field with a name given in its JSON tag is treated as having that name, rather than being anonymous. An anonymous struct field of interface type is treated the same as having that type as its name, rather than being anonymous. 

The Go visibility rules for struct fields are amended for JSON when deciding which field to marshal or unmarshal. If there are multiple fields at the same level, and that level is the least nested (and would therefore be the nesting level selected by the usual Go rules), the following extra rules apply: 

1) Of those fields, if any are JSON-tagged, only tagged fields are considered, even if there are multiple untagged fields that would otherwise conflict. 

2) If there is exactly one field (tagged or not according to the first rule), that is selected. 

3) Otherwise there are multiple fields, and all are ignored; no error occurs. 

Handling of anonymous struct fields is new in Go 1.1. Prior to Go 1.1, anonymous struct fields were ignored. To force ignoring of an anonymous struct field in both current and earlier versions, give the field a JSON tag of "-". 

Map values encode as JSON objects. The map's key type must either be a string, an integer type, or implement encoding.TextMarshaler. The map keys are sorted and used as JSON object keys by applying the following rules, subject to the UTF-8 coercion described for string values above: 

```
- keys of any string type are used directly
- encoding.TextMarshalers are marshaled
- integer keys are converted to strings

```
Pointer values encode as the value pointed to. A nil pointer encodes as the null JSON value. 

Interface values encode as the value contained in the interface. A nil interface value encodes as the null JSON value. 

Channel, complex, and function values cannot be encoded in JSON. Attempting to encode such a value causes Marshal to return an UnsupportedTypeError. 

JSON cannot represent cyclic data structures and Marshal does not handle them. Passing cyclic structures to Marshal will result in an error. 

### <a id="MarshalIndent" href="#MarshalIndent">func MarshalIndent(v interface{}, prefix, indent string) ([]byte, error)</a>

```
searchKey: json.MarshalIndent
tags: [function]
```

```Go
func MarshalIndent(v interface{}, prefix, indent string) ([]byte, error)
```

MarshalIndent is like Marshal but applies Indent to format the output. Each JSON element in the output will begin on a new line beginning with prefix followed by one or more copies of indent according to the indentation nesting. 

### <a id="TestAnonymousFields" href="#TestAnonymousFields">func TestAnonymousFields(t *testing.T)</a>

```
searchKey: json.TestAnonymousFields
tags: [function private test]
```

```Go
func TestAnonymousFields(t *testing.T)
```

### <a id="TestBlocking" href="#TestBlocking">func TestBlocking(t *testing.T)</a>

```
searchKey: json.TestBlocking
tags: [function private test]
```

```Go
func TestBlocking(t *testing.T)
```

### <a id="TestByteKind" href="#TestByteKind">func TestByteKind(t *testing.T)</a>

```
searchKey: json.TestByteKind
tags: [function private test]
```

```Go
func TestByteKind(t *testing.T)
```

Custom types with []byte as underlying type could not be marshaled and then unmarshaled. Issue 8962. 

### <a id="TestCompact" href="#TestCompact">func TestCompact(t *testing.T)</a>

```
searchKey: json.TestCompact
tags: [function private test]
```

```Go
func TestCompact(t *testing.T)
```

### <a id="TestCompactBig" href="#TestCompactBig">func TestCompactBig(t *testing.T)</a>

```
searchKey: json.TestCompactBig
tags: [function private test]
```

```Go
func TestCompactBig(t *testing.T)
```

### <a id="TestCompactSeparators" href="#TestCompactSeparators">func TestCompactSeparators(t *testing.T)</a>

```
searchKey: json.TestCompactSeparators
tags: [function private test]
```

```Go
func TestCompactSeparators(t *testing.T)
```

### <a id="TestDecodeInStream" href="#TestDecodeInStream">func TestDecodeInStream(t *testing.T)</a>

```
searchKey: json.TestDecodeInStream
tags: [function private test]
```

```Go
func TestDecodeInStream(t *testing.T)
```

### <a id="TestDecoder" href="#TestDecoder">func TestDecoder(t *testing.T)</a>

```
searchKey: json.TestDecoder
tags: [function private test]
```

```Go
func TestDecoder(t *testing.T)
```

### <a id="TestDecoderBuffered" href="#TestDecoderBuffered">func TestDecoderBuffered(t *testing.T)</a>

```
searchKey: json.TestDecoderBuffered
tags: [function private test]
```

```Go
func TestDecoderBuffered(t *testing.T)
```

### <a id="TestDuplicatedFieldDisappears" href="#TestDuplicatedFieldDisappears">func TestDuplicatedFieldDisappears(t *testing.T)</a>

```
searchKey: json.TestDuplicatedFieldDisappears
tags: [function private test]
```

```Go
func TestDuplicatedFieldDisappears(t *testing.T)
```

### <a id="TestEmbeddedBug" href="#TestEmbeddedBug">func TestEmbeddedBug(t *testing.T)</a>

```
searchKey: json.TestEmbeddedBug
tags: [function private test]
```

```Go
func TestEmbeddedBug(t *testing.T)
```

Issue 5245. 

### <a id="TestEmptyString" href="#TestEmptyString">func TestEmptyString(t *testing.T)</a>

```
searchKey: json.TestEmptyString
tags: [function private test]
```

```Go
func TestEmptyString(t *testing.T)
```

Test that the empty string doesn't panic decoding when ,string is specified Issue 3450 

### <a id="TestEncodeBytekind" href="#TestEncodeBytekind">func TestEncodeBytekind(t *testing.T)</a>

```
searchKey: json.TestEncodeBytekind
tags: [function private test]
```

```Go
func TestEncodeBytekind(t *testing.T)
```

Issue 13783 

### <a id="TestEncodePointerString" href="#TestEncodePointerString">func TestEncodePointerString(t *testing.T)</a>

```
searchKey: json.TestEncodePointerString
tags: [function private test]
```

```Go
func TestEncodePointerString(t *testing.T)
```

golang.org/issue/8582 

### <a id="TestEncodeRenamedByteSlice" href="#TestEncodeRenamedByteSlice">func TestEncodeRenamedByteSlice(t *testing.T)</a>

```
searchKey: json.TestEncodeRenamedByteSlice
tags: [function private test]
```

```Go
func TestEncodeRenamedByteSlice(t *testing.T)
```

### <a id="TestEncodeString" href="#TestEncodeString">func TestEncodeString(t *testing.T)</a>

```
searchKey: json.TestEncodeString
tags: [function private test]
```

```Go
func TestEncodeString(t *testing.T)
```

### <a id="TestEncoder" href="#TestEncoder">func TestEncoder(t *testing.T)</a>

```
searchKey: json.TestEncoder
tags: [function private test]
```

```Go
func TestEncoder(t *testing.T)
```

### <a id="TestEncoderIndent" href="#TestEncoderIndent">func TestEncoderIndent(t *testing.T)</a>

```
searchKey: json.TestEncoderIndent
tags: [function private test]
```

```Go
func TestEncoderIndent(t *testing.T)
```

### <a id="TestEncoderSetEscapeHTML" href="#TestEncoderSetEscapeHTML">func TestEncoderSetEscapeHTML(t *testing.T)</a>

```
searchKey: json.TestEncoderSetEscapeHTML
tags: [function private test]
```

```Go
func TestEncoderSetEscapeHTML(t *testing.T)
```

### <a id="TestErrorMessageFromMisusedString" href="#TestErrorMessageFromMisusedString">func TestErrorMessageFromMisusedString(t *testing.T)</a>

```
searchKey: json.TestErrorMessageFromMisusedString
tags: [function private test]
```

```Go
func TestErrorMessageFromMisusedString(t *testing.T)
```

If people misuse the ,string modifier, the error message should be helpful, telling the user that they're doing it wrong. 

### <a id="TestEscape" href="#TestEscape">func TestEscape(t *testing.T)</a>

```
searchKey: json.TestEscape
tags: [function private test]
```

```Go
func TestEscape(t *testing.T)
```

### <a id="TestFold" href="#TestFold">func TestFold(t *testing.T)</a>

```
searchKey: json.TestFold
tags: [function private test]
```

```Go
func TestFold(t *testing.T)
```

### <a id="TestFoldAgainstUnicode" href="#TestFoldAgainstUnicode">func TestFoldAgainstUnicode(t *testing.T)</a>

```
searchKey: json.TestFoldAgainstUnicode
tags: [function private test]
```

```Go
func TestFoldAgainstUnicode(t *testing.T)
```

### <a id="TestHTMLEscape" href="#TestHTMLEscape">func TestHTMLEscape(t *testing.T)</a>

```
searchKey: json.TestHTMLEscape
tags: [function private test]
```

```Go
func TestHTMLEscape(t *testing.T)
```

### <a id="TestHTTPDecoding" href="#TestHTTPDecoding">func TestHTTPDecoding(t *testing.T)</a>

```
searchKey: json.TestHTTPDecoding
tags: [function private test]
```

```Go
func TestHTTPDecoding(t *testing.T)
```

Test from golang.org/issue/11893 

### <a id="TestIndent" href="#TestIndent">func TestIndent(t *testing.T)</a>

```
searchKey: json.TestIndent
tags: [function private test]
```

```Go
func TestIndent(t *testing.T)
```

### <a id="TestIndentBig" href="#TestIndentBig">func TestIndentBig(t *testing.T)</a>

```
searchKey: json.TestIndentBig
tags: [function private test]
```

```Go
func TestIndentBig(t *testing.T)
```

### <a id="TestIndentErrors" href="#TestIndentErrors">func TestIndentErrors(t *testing.T)</a>

```
searchKey: json.TestIndentErrors
tags: [function private test]
```

```Go
func TestIndentErrors(t *testing.T)
```

### <a id="TestInterfaceSet" href="#TestInterfaceSet">func TestInterfaceSet(t *testing.T)</a>

```
searchKey: json.TestInterfaceSet
tags: [function private test]
```

```Go
func TestInterfaceSet(t *testing.T)
```

### <a id="TestInvalidStringOption" href="#TestInvalidStringOption">func TestInvalidStringOption(t *testing.T)</a>

```
searchKey: json.TestInvalidStringOption
tags: [function private test]
```

```Go
func TestInvalidStringOption(t *testing.T)
```

Test that string option is ignored for invalid types. Issue 9812. 

### <a id="TestInvalidUnmarshal" href="#TestInvalidUnmarshal">func TestInvalidUnmarshal(t *testing.T)</a>

```
searchKey: json.TestInvalidUnmarshal
tags: [function private test]
```

```Go
func TestInvalidUnmarshal(t *testing.T)
```

### <a id="TestInvalidUnmarshalText" href="#TestInvalidUnmarshalText">func TestInvalidUnmarshalText(t *testing.T)</a>

```
searchKey: json.TestInvalidUnmarshalText
tags: [function private test]
```

```Go
func TestInvalidUnmarshalText(t *testing.T)
```

### <a id="TestIssue10281" href="#TestIssue10281">func TestIssue10281(t *testing.T)</a>

```
searchKey: json.TestIssue10281
tags: [function private test]
```

```Go
func TestIssue10281(t *testing.T)
```

### <a id="TestLargeByteSlice" href="#TestLargeByteSlice">func TestLargeByteSlice(t *testing.T)</a>

```
searchKey: json.TestLargeByteSlice
tags: [function private test]
```

```Go
func TestLargeByteSlice(t *testing.T)
```

### <a id="TestMarshal" href="#TestMarshal">func TestMarshal(t *testing.T)</a>

```
searchKey: json.TestMarshal
tags: [function private test]
```

```Go
func TestMarshal(t *testing.T)
```

### <a id="TestMarshalBadUTF8" href="#TestMarshalBadUTF8">func TestMarshalBadUTF8(t *testing.T)</a>

```
searchKey: json.TestMarshalBadUTF8
tags: [function private test]
```

```Go
func TestMarshalBadUTF8(t *testing.T)
```

### <a id="TestMarshalEmbeds" href="#TestMarshalEmbeds">func TestMarshalEmbeds(t *testing.T)</a>

```
searchKey: json.TestMarshalEmbeds
tags: [function private test]
```

```Go
func TestMarshalEmbeds(t *testing.T)
```

### <a id="TestMarshalFloat" href="#TestMarshalFloat">func TestMarshalFloat(t *testing.T)</a>

```
searchKey: json.TestMarshalFloat
tags: [function private test]
```

```Go
func TestMarshalFloat(t *testing.T)
```

### <a id="TestMarshalNumberZeroVal" href="#TestMarshalNumberZeroVal">func TestMarshalNumberZeroVal(t *testing.T)</a>

```
searchKey: json.TestMarshalNumberZeroVal
tags: [function private test]
```

```Go
func TestMarshalNumberZeroVal(t *testing.T)
```

### <a id="TestMarshalPanic" href="#TestMarshalPanic">func TestMarshalPanic(t *testing.T)</a>

```
searchKey: json.TestMarshalPanic
tags: [function private test]
```

```Go
func TestMarshalPanic(t *testing.T)
```

### <a id="TestMarshalRawMessageValue" href="#TestMarshalRawMessageValue">func TestMarshalRawMessageValue(t *testing.T)</a>

```
searchKey: json.TestMarshalRawMessageValue
tags: [function private test]
```

```Go
func TestMarshalRawMessageValue(t *testing.T)
```

### <a id="TestMarshalTextFloatMap" href="#TestMarshalTextFloatMap">func TestMarshalTextFloatMap(t *testing.T)</a>

```
searchKey: json.TestMarshalTextFloatMap
tags: [function private test]
```

```Go
func TestMarshalTextFloatMap(t *testing.T)
```

Issue 43207 

### <a id="TestMarshalUncommonFieldNames" href="#TestMarshalUncommonFieldNames">func TestMarshalUncommonFieldNames(t *testing.T)</a>

```
searchKey: json.TestMarshalUncommonFieldNames
tags: [function private test]
```

```Go
func TestMarshalUncommonFieldNames(t *testing.T)
```

### <a id="TestMarshalerError" href="#TestMarshalerError">func TestMarshalerError(t *testing.T)</a>

```
searchKey: json.TestMarshalerError
tags: [function private test]
```

```Go
func TestMarshalerError(t *testing.T)
```

### <a id="TestMarshalerEscaping" href="#TestMarshalerEscaping">func TestMarshalerEscaping(t *testing.T)</a>

```
searchKey: json.TestMarshalerEscaping
tags: [function private test]
```

```Go
func TestMarshalerEscaping(t *testing.T)
```

### <a id="TestNilMarshal" href="#TestNilMarshal">func TestNilMarshal(t *testing.T)</a>

```
searchKey: json.TestNilMarshal
tags: [function private test]
```

```Go
func TestNilMarshal(t *testing.T)
```

See golang.org/issue/16042 and golang.org/issue/34235. 

### <a id="TestNilMarshalerTextMapKey" href="#TestNilMarshalerTextMapKey">func TestNilMarshalerTextMapKey(t *testing.T)</a>

```
searchKey: json.TestNilMarshalerTextMapKey
tags: [function private test]
```

```Go
func TestNilMarshalerTextMapKey(t *testing.T)
```

[https://golang.org/issue/33675](https://golang.org/issue/33675) 

### <a id="TestNullRawMessage" href="#TestNullRawMessage">func TestNullRawMessage(t *testing.T)</a>

```
searchKey: json.TestNullRawMessage
tags: [function private test]
```

```Go
func TestNullRawMessage(t *testing.T)
```

### <a id="TestNullString" href="#TestNullString">func TestNullString(t *testing.T)</a>

```
searchKey: json.TestNullString
tags: [function private test]
```

```Go
func TestNullString(t *testing.T)
```

Test that a null for ,string is not replaced with the previous quoted string (issue 7046). It should also not be an error (issue 2540, issue 8587). 

### <a id="TestNumberAccessors" href="#TestNumberAccessors">func TestNumberAccessors(t *testing.T)</a>

```
searchKey: json.TestNumberAccessors
tags: [function private test]
```

```Go
func TestNumberAccessors(t *testing.T)
```

Independent of Decode, basic coverage of the accessors in Number 

### <a id="TestNumberIsValid" href="#TestNumberIsValid">func TestNumberIsValid(t *testing.T)</a>

```
searchKey: json.TestNumberIsValid
tags: [function private test]
```

```Go
func TestNumberIsValid(t *testing.T)
```

### <a id="TestOmitEmpty" href="#TestOmitEmpty">func TestOmitEmpty(t *testing.T)</a>

```
searchKey: json.TestOmitEmpty
tags: [function private test]
```

```Go
func TestOmitEmpty(t *testing.T)
```

### <a id="TestPrefilled" href="#TestPrefilled">func TestPrefilled(t *testing.T)</a>

```
searchKey: json.TestPrefilled
tags: [function private test]
```

```Go
func TestPrefilled(t *testing.T)
```

Test semantics of pre-filled data, such as struct fields, map elements, slices, and arrays. Issues 4900 and 8837, among others. 

### <a id="TestRawMessage" href="#TestRawMessage">func TestRawMessage(t *testing.T)</a>

```
searchKey: json.TestRawMessage
tags: [function private test]
```

```Go
func TestRawMessage(t *testing.T)
```

### <a id="TestRefUnmarshal" href="#TestRefUnmarshal">func TestRefUnmarshal(t *testing.T)</a>

```
searchKey: json.TestRefUnmarshal
tags: [function private test]
```

```Go
func TestRefUnmarshal(t *testing.T)
```

### <a id="TestRefValMarshal" href="#TestRefValMarshal">func TestRefValMarshal(t *testing.T)</a>

```
searchKey: json.TestRefValMarshal
tags: [function private test]
```

```Go
func TestRefValMarshal(t *testing.T)
```

### <a id="TestRoundtripStringTag" href="#TestRoundtripStringTag">func TestRoundtripStringTag(t *testing.T)</a>

```
searchKey: json.TestRoundtripStringTag
tags: [function private test]
```

```Go
func TestRoundtripStringTag(t *testing.T)
```

### <a id="TestSamePointerNoCycle" href="#TestSamePointerNoCycle">func TestSamePointerNoCycle(t *testing.T)</a>

```
searchKey: json.TestSamePointerNoCycle
tags: [function private test]
```

```Go
func TestSamePointerNoCycle(t *testing.T)
```

### <a id="TestSkipArrayObjects" href="#TestSkipArrayObjects">func TestSkipArrayObjects(t *testing.T)</a>

```
searchKey: json.TestSkipArrayObjects
tags: [function private test]
```

```Go
func TestSkipArrayObjects(t *testing.T)
```

Test that extra object elements in an array do not result in a "data changing underfoot" error. Issue 3717 

### <a id="TestSliceNoCycle" href="#TestSliceNoCycle">func TestSliceNoCycle(t *testing.T)</a>

```
searchKey: json.TestSliceNoCycle
tags: [function private test]
```

```Go
func TestSliceNoCycle(t *testing.T)
```

### <a id="TestSliceOfCustomByte" href="#TestSliceOfCustomByte">func TestSliceOfCustomByte(t *testing.T)</a>

```
searchKey: json.TestSliceOfCustomByte
tags: [function private test]
```

```Go
func TestSliceOfCustomByte(t *testing.T)
```

The fix for issue 8962 introduced a regression. Issue 12921. 

### <a id="TestStringBytes" href="#TestStringBytes">func TestStringBytes(t *testing.T)</a>

```
searchKey: json.TestStringBytes
tags: [function private test]
```

```Go
func TestStringBytes(t *testing.T)
```

### <a id="TestStringKind" href="#TestStringKind">func TestStringKind(t *testing.T)</a>

```
searchKey: json.TestStringKind
tags: [function private test]
```

```Go
func TestStringKind(t *testing.T)
```

### <a id="TestStructTagObjectKey" href="#TestStructTagObjectKey">func TestStructTagObjectKey(t *testing.T)</a>

```
searchKey: json.TestStructTagObjectKey
tags: [function private test]
```

```Go
func TestStructTagObjectKey(t *testing.T)
```

### <a id="TestTagParsing" href="#TestTagParsing">func TestTagParsing(t *testing.T)</a>

```
searchKey: json.TestTagParsing
tags: [function private test]
```

```Go
func TestTagParsing(t *testing.T)
```

### <a id="TestTaggedFieldDominates" href="#TestTaggedFieldDominates">func TestTaggedFieldDominates(t *testing.T)</a>

```
searchKey: json.TestTaggedFieldDominates
tags: [function private test]
```

```Go
func TestTaggedFieldDominates(t *testing.T)
```

Test that a field with a tag dominates untagged fields. 

### <a id="TestTextMarshalerMapKeysAreSorted" href="#TestTextMarshalerMapKeysAreSorted">func TestTextMarshalerMapKeysAreSorted(t *testing.T)</a>

```
searchKey: json.TestTextMarshalerMapKeysAreSorted
tags: [function private test]
```

```Go
func TestTextMarshalerMapKeysAreSorted(t *testing.T)
```

### <a id="TestUnmarshal" href="#TestUnmarshal">func TestUnmarshal(t *testing.T)</a>

```
searchKey: json.TestUnmarshal
tags: [function private test]
```

```Go
func TestUnmarshal(t *testing.T)
```

### <a id="TestUnmarshalEmbeddedUnexported" href="#TestUnmarshalEmbeddedUnexported">func TestUnmarshalEmbeddedUnexported(t *testing.T)</a>

```
searchKey: json.TestUnmarshalEmbeddedUnexported
tags: [function private test]
```

```Go
func TestUnmarshalEmbeddedUnexported(t *testing.T)
```

Test unmarshal behavior with regards to embedded unexported structs. 

(Issue 21357) If the embedded struct is a pointer and is unallocated, this returns an error because unmarshal cannot set the field. 

(Issue 24152) If the embedded struct is given an explicit name, ensure that the normal unmarshal logic does not panic in reflect. 

(Issue 28145) If the embedded struct is given an explicit name and has exported methods, don't cause a panic trying to get its value. 

### <a id="TestUnmarshalErrorAfterMultipleJSON" href="#TestUnmarshalErrorAfterMultipleJSON">func TestUnmarshalErrorAfterMultipleJSON(t *testing.T)</a>

```
searchKey: json.TestUnmarshalErrorAfterMultipleJSON
tags: [function private test]
```

```Go
func TestUnmarshalErrorAfterMultipleJSON(t *testing.T)
```

### <a id="TestUnmarshalInterface" href="#TestUnmarshalInterface">func TestUnmarshalInterface(t *testing.T)</a>

```
searchKey: json.TestUnmarshalInterface
tags: [function private test]
```

```Go
func TestUnmarshalInterface(t *testing.T)
```

### <a id="TestUnmarshalJSONLiteralError" href="#TestUnmarshalJSONLiteralError">func TestUnmarshalJSONLiteralError(t *testing.T)</a>

```
searchKey: json.TestUnmarshalJSONLiteralError
tags: [function private test]
```

```Go
func TestUnmarshalJSONLiteralError(t *testing.T)
```

### <a id="TestUnmarshalMapWithTextUnmarshalerStringKey" href="#TestUnmarshalMapWithTextUnmarshalerStringKey">func TestUnmarshalMapWithTextUnmarshalerStringKey(t *testing.T)</a>

```
searchKey: json.TestUnmarshalMapWithTextUnmarshalerStringKey
tags: [function private test]
```

```Go
func TestUnmarshalMapWithTextUnmarshalerStringKey(t *testing.T)
```

Test unmarshal to a map, where the map key is a user defined type. See golang.org/issues/34437. 

### <a id="TestUnmarshalMarshal" href="#TestUnmarshalMarshal">func TestUnmarshalMarshal(t *testing.T)</a>

```
searchKey: json.TestUnmarshalMarshal
tags: [function private test]
```

```Go
func TestUnmarshalMarshal(t *testing.T)
```

### <a id="TestUnmarshalMaxDepth" href="#TestUnmarshalMaxDepth">func TestUnmarshalMaxDepth(t *testing.T)</a>

```
searchKey: json.TestUnmarshalMaxDepth
tags: [function private test]
```

```Go
func TestUnmarshalMaxDepth(t *testing.T)
```

### <a id="TestUnmarshalNulls" href="#TestUnmarshalNulls">func TestUnmarshalNulls(t *testing.T)</a>

```
searchKey: json.TestUnmarshalNulls
tags: [function private test]
```

```Go
func TestUnmarshalNulls(t *testing.T)
```

JSON null values should be ignored for primitives and string values instead of resulting in an error. Issue 2540 

### <a id="TestUnmarshalPanic" href="#TestUnmarshalPanic">func TestUnmarshalPanic(t *testing.T)</a>

```
searchKey: json.TestUnmarshalPanic
tags: [function private test]
```

```Go
func TestUnmarshalPanic(t *testing.T)
```

### <a id="TestUnmarshalPtrPtr" href="#TestUnmarshalPtrPtr">func TestUnmarshalPtrPtr(t *testing.T)</a>

```
searchKey: json.TestUnmarshalPtrPtr
tags: [function private test]
```

```Go
func TestUnmarshalPtrPtr(t *testing.T)
```

### <a id="TestUnmarshalRecursivePointer" href="#TestUnmarshalRecursivePointer">func TestUnmarshalRecursivePointer(t *testing.T)</a>

```
searchKey: json.TestUnmarshalRecursivePointer
tags: [function private test]
```

```Go
func TestUnmarshalRecursivePointer(t *testing.T)
```

The decoder used to hang if decoding into an interface pointing to its own address. See golang.org/issues/31740. 

### <a id="TestUnmarshalRescanLiteralMangledUnquote" href="#TestUnmarshalRescanLiteralMangledUnquote">func TestUnmarshalRescanLiteralMangledUnquote(t *testing.T)</a>

```
searchKey: json.TestUnmarshalRescanLiteralMangledUnquote
tags: [function private test]
```

```Go
func TestUnmarshalRescanLiteralMangledUnquote(t *testing.T)
```

### <a id="TestUnmarshalSyntax" href="#TestUnmarshalSyntax">func TestUnmarshalSyntax(t *testing.T)</a>

```
searchKey: json.TestUnmarshalSyntax
tags: [function private test]
```

```Go
func TestUnmarshalSyntax(t *testing.T)
```

### <a id="TestUnmarshalTypeError" href="#TestUnmarshalTypeError">func TestUnmarshalTypeError(t *testing.T)</a>

```
searchKey: json.TestUnmarshalTypeError
tags: [function private test]
```

```Go
func TestUnmarshalTypeError(t *testing.T)
```

### <a id="TestUnmarshalUnexported" href="#TestUnmarshalUnexported">func TestUnmarshalUnexported(t *testing.T)</a>

```
searchKey: json.TestUnmarshalUnexported
tags: [function private test]
```

```Go
func TestUnmarshalUnexported(t *testing.T)
```

### <a id="TestUnsupportedValues" href="#TestUnsupportedValues">func TestUnsupportedValues(t *testing.T)</a>

```
searchKey: json.TestUnsupportedValues
tags: [function private test]
```

```Go
func TestUnsupportedValues(t *testing.T)
```

### <a id="TestValid" href="#TestValid">func TestValid(t *testing.T)</a>

```
searchKey: json.TestValid
tags: [function private test]
```

```Go
func TestValid(t *testing.T)
```

### <a id="Unmarshal" href="#Unmarshal">func Unmarshal(data []byte, v interface{}) error</a>

```
searchKey: json.Unmarshal
tags: [function]
```

```Go
func Unmarshal(data []byte, v interface{}) error
```

Unmarshal parses the JSON-encoded data and stores the result in the value pointed to by v. If v is nil or not a pointer, Unmarshal returns an InvalidUnmarshalError. 

Unmarshal uses the inverse of the encodings that Marshal uses, allocating maps, slices, and pointers as necessary, with the following additional rules: 

To unmarshal JSON into a pointer, Unmarshal first handles the case of the JSON being the JSON literal null. In that case, Unmarshal sets the pointer to nil. Otherwise, Unmarshal unmarshals the JSON into the value pointed at by the pointer. If the pointer is nil, Unmarshal allocates a new value for it to point to. 

To unmarshal JSON into a value implementing the Unmarshaler interface, Unmarshal calls that value's UnmarshalJSON method, including when the input is a JSON null. Otherwise, if the value implements encoding.TextUnmarshaler and the input is a JSON quoted string, Unmarshal calls that value's UnmarshalText method with the unquoted form of the string. 

To unmarshal JSON into a struct, Unmarshal matches incoming object keys to the keys used by Marshal (either the struct field name or its tag), preferring an exact match but also accepting a case-insensitive match. By default, object keys which don't have a corresponding struct field are ignored (see Decoder.DisallowUnknownFields for an alternative). 

To unmarshal JSON into an interface value, Unmarshal stores one of these in the interface value: 

```
bool, for JSON booleans
float64, for JSON numbers
string, for JSON strings
[]interface{}, for JSON arrays
map[string]interface{}, for JSON objects
nil for JSON null

```
To unmarshal a JSON array into a slice, Unmarshal resets the slice length to zero and then appends each element to the slice. As a special case, to unmarshal an empty JSON array into a slice, Unmarshal replaces the slice with a new empty slice. 

To unmarshal a JSON array into a Go array, Unmarshal decodes JSON array elements into corresponding Go array elements. If the Go array is smaller than the JSON array, the additional JSON array elements are discarded. If the JSON array is smaller than the Go array, the additional Go array elements are set to zero values. 

To unmarshal a JSON object into a map, Unmarshal first establishes a map to use. If the map is nil, Unmarshal allocates a new map. Otherwise Unmarshal reuses the existing map, keeping existing entries. Unmarshal then stores key-value pairs from the JSON object into the map. The map's key type must either be any string type, an integer, implement json.Unmarshaler, or implement encoding.TextUnmarshaler. 

If a JSON value is not appropriate for a given target type, or if a JSON number overflows the target type, Unmarshal skips that field and completes the unmarshaling as best it can. If no more serious errors are encountered, Unmarshal returns an UnmarshalTypeError describing the earliest such error. In any case, it's not guaranteed that all the remaining fields following the problematic one will be unmarshaled into the target object. 

The JSON null value unmarshals into an interface, map, pointer, or slice by setting that Go value to nil. Because null is often used in JSON to mean `not present,' unmarshaling a JSON null into any other Go type has no effect on the value and produces no error. 

When unmarshaling quoted strings, invalid UTF-8 or invalid UTF-16 surrogate pairs are not treated as an error. Instead, they are replaced by the Unicode replacement character U+FFFD. 

### <a id="Valid" href="#Valid">func Valid(data []byte) bool</a>

```
searchKey: json.Valid
tags: [function]
```

```Go
func Valid(data []byte) bool
```

Valid reports whether data is a valid JSON encoding. 

### <a id="addrMarshalerEncoder" href="#addrMarshalerEncoder">func addrMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.addrMarshalerEncoder
tags: [function private]
```

```Go
func addrMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="addrTextMarshalerEncoder" href="#addrTextMarshalerEncoder">func addrTextMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.addrTextMarshalerEncoder
tags: [function private]
```

```Go
func addrTextMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="asciiEqualFold" href="#asciiEqualFold">func asciiEqualFold(s, t []byte) bool</a>

```
searchKey: json.asciiEqualFold
tags: [function private]
```

```Go
func asciiEqualFold(s, t []byte) bool
```

asciiEqualFold is a specialization of bytes.EqualFold for use when s is all ASCII (but may contain non-letters) and contains no special-folding letters. See comments on foldFunc. 

### <a id="benchMarshalBytes" href="#benchMarshalBytes">func benchMarshalBytes(n int) func(*testing.B)</a>

```
searchKey: json.benchMarshalBytes
tags: [function private]
```

```Go
func benchMarshalBytes(n int) func(*testing.B)
```

### <a id="boolEncoder" href="#boolEncoder">func boolEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.boolEncoder
tags: [function private]
```

```Go
func boolEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="checkValid" href="#checkValid">func checkValid(data []byte, scan *scanner) error</a>

```
searchKey: json.checkValid
tags: [function private]
```

```Go
func checkValid(data []byte, scan *scanner) error
```

checkValid verifies that data is valid JSON-encoded data. scan is passed in for use by checkValid to avoid an allocation. 

### <a id="codeInit" href="#codeInit">func codeInit()</a>

```
searchKey: json.codeInit
tags: [function private]
```

```Go
func codeInit()
```

### <a id="compact" href="#compact">func compact(dst *bytes.Buffer, src []byte, escape bool) error</a>

```
searchKey: json.compact
tags: [function private]
```

```Go
func compact(dst *bytes.Buffer, src []byte, escape bool) error
```

### <a id="diff" href="#diff">func diff(t *testing.T, a, b []byte)</a>

```
searchKey: json.diff
tags: [function private]
```

```Go
func diff(t *testing.T, a, b []byte)
```

### <a id="encodeByteSlice" href="#encodeByteSlice">func encodeByteSlice(e *encodeState, v reflect.Value, _ encOpts)</a>

```
searchKey: json.encodeByteSlice
tags: [function private]
```

```Go
func encodeByteSlice(e *encodeState, v reflect.Value, _ encOpts)
```

### <a id="equalError" href="#equalError">func equalError(a, b error) bool</a>

```
searchKey: json.equalError
tags: [function private]
```

```Go
func equalError(a, b error) bool
```

### <a id="equalFoldRight" href="#equalFoldRight">func equalFoldRight(s, t []byte) bool</a>

```
searchKey: json.equalFoldRight
tags: [function private]
```

```Go
func equalFoldRight(s, t []byte) bool
```

equalFoldRight is a specialization of bytes.EqualFold when s is known to be all ASCII (including punctuation), but contains an 's', 'S', 'k', or 'K', requiring a Unicode fold on the bytes in t. See comments on foldFunc. 

### <a id="foldFunc" href="#foldFunc">func foldFunc(s []byte) func(s, t []byte) bool</a>

```
searchKey: json.foldFunc
tags: [function private]
```

```Go
func foldFunc(s []byte) func(s, t []byte) bool
```

foldFunc returns one of four different case folding equivalence functions, from most general (and slow) to fastest: 

1) bytes.EqualFold, if the key s contains any non-ASCII UTF-8 2) equalFoldRight, if s contains special folding ASCII ('k', 'K', 's', 'S') 3) asciiEqualFold, no special, but includes non-letters (including _) 4) simpleLetterEqualFold, no specials, no non-letters. 

The letters S and K are special because they map to 3 runes, not just 2: 

```
* S maps to s and to U+017F 'ſ' Latin small letter long s
* k maps to K and to U+212A 'K' Kelvin sign

```
See [https://play.golang.org/p/tTxjOc0OGo](https://play.golang.org/p/tTxjOc0OGo) 

The returned function is specialized for matching against s and should only be given s. It's not curried for performance reasons. 

### <a id="freeScanner" href="#freeScanner">func freeScanner(scan *scanner)</a>

```
searchKey: json.freeScanner
tags: [function private]
```

```Go
func freeScanner(scan *scanner)
```

### <a id="genArray" href="#genArray">func genArray(n int) []interface{}</a>

```
searchKey: json.genArray
tags: [function private]
```

```Go
func genArray(n int) []interface{}
```

### <a id="genMap" href="#genMap">func genMap(n int) map[string]interface{}</a>

```
searchKey: json.genMap
tags: [function private]
```

```Go
func genMap(n int) map[string]interface{}
```

### <a id="genString" href="#genString">func genString(stddev float64) string</a>

```
searchKey: json.genString
tags: [function private]
```

```Go
func genString(stddev float64) string
```

### <a id="genValue" href="#genValue">func genValue(n int) interface{}</a>

```
searchKey: json.genValue
tags: [function private]
```

```Go
func genValue(n int) interface{}
```

### <a id="getu4" href="#getu4">func getu4(s []byte) rune</a>

```
searchKey: json.getu4
tags: [function private]
```

```Go
func getu4(s []byte) rune
```

getu4 decodes \uXXXX from the beginning of s, returning the hex value, or it returns -1. 

### <a id="init.encode_test.go" href="#init.encode_test.go">func init()</a>

```
searchKey: json.init
tags: [function private]
```

```Go
func init()
```

### <a id="initBig" href="#initBig">func initBig()</a>

```
searchKey: json.initBig
tags: [function private]
```

```Go
func initBig()
```

### <a id="intEncoder" href="#intEncoder">func intEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.intEncoder
tags: [function private]
```

```Go
func intEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="interfaceEncoder" href="#interfaceEncoder">func interfaceEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.interfaceEncoder
tags: [function private]
```

```Go
func interfaceEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="intp" href="#intp">func intp(x int) *int</a>

```
searchKey: json.intp
tags: [function private]
```

```Go
func intp(x int) *int
```

### <a id="intpp" href="#intpp">func intpp(x *int) **int</a>

```
searchKey: json.intpp
tags: [function private]
```

```Go
func intpp(x *int) **int
```

### <a id="invalidValueEncoder" href="#invalidValueEncoder">func invalidValueEncoder(e *encodeState, v reflect.Value, _ encOpts)</a>

```
searchKey: json.invalidValueEncoder
tags: [function private]
```

```Go
func invalidValueEncoder(e *encodeState, v reflect.Value, _ encOpts)
```

### <a id="isASCIILetter" href="#isASCIILetter">func isASCIILetter(b byte) bool</a>

```
searchKey: json.isASCIILetter
tags: [function private]
```

```Go
func isASCIILetter(b byte) bool
```

### <a id="isEmptyValue" href="#isEmptyValue">func isEmptyValue(v reflect.Value) bool</a>

```
searchKey: json.isEmptyValue
tags: [function private]
```

```Go
func isEmptyValue(v reflect.Value) bool
```

### <a id="isSpace" href="#isSpace">func isSpace(c byte) bool</a>

```
searchKey: json.isSpace
tags: [function private]
```

```Go
func isSpace(c byte) bool
```

### <a id="isValidNumber" href="#isValidNumber">func isValidNumber(s string) bool</a>

```
searchKey: json.isValidNumber
tags: [function private]
```

```Go
func isValidNumber(s string) bool
```

isValidNumber reports whether s is a valid JSON number literal. 

### <a id="isValidTag" href="#isValidTag">func isValidTag(s string) bool</a>

```
searchKey: json.isValidTag
tags: [function private]
```

```Go
func isValidTag(s string) bool
```

### <a id="marshalerEncoder" href="#marshalerEncoder">func marshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.marshalerEncoder
tags: [function private]
```

```Go
func marshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="newline" href="#newline">func newline(dst *bytes.Buffer, prefix, indent string, depth int)</a>

```
searchKey: json.newline
tags: [function private]
```

```Go
func newline(dst *bytes.Buffer, prefix, indent string, depth int)
```

### <a id="nlines" href="#nlines">func nlines(s string, n int) string</a>

```
searchKey: json.nlines
tags: [function private]
```

```Go
func nlines(s string, n int) string
```

### <a id="noSpace" href="#noSpace">func noSpace(c rune) rune</a>

```
searchKey: json.noSpace
tags: [function private]
```

```Go
func noSpace(c rune) rune
```

### <a id="nonSpace" href="#nonSpace">func nonSpace(b []byte) bool</a>

```
searchKey: json.nonSpace
tags: [function private]
```

```Go
func nonSpace(b []byte) bool
```

### <a id="quoteChar" href="#quoteChar">func quoteChar(c byte) string</a>

```
searchKey: json.quoteChar
tags: [function private]
```

```Go
func quoteChar(c byte) string
```

quoteChar formats c as a quoted character literal 

### <a id="simpleLetterEqualFold" href="#simpleLetterEqualFold">func simpleLetterEqualFold(s, t []byte) bool</a>

```
searchKey: json.simpleLetterEqualFold
tags: [function private]
```

```Go
func simpleLetterEqualFold(s, t []byte) bool
```

simpleLetterEqualFold is a specialization of bytes.EqualFold for use when s is all ASCII letters (no underscores, etc) and also doesn't contain 'k', 'K', 's', or 'S'. See comments on foldFunc. 

### <a id="state0" href="#state0">func state0(s *scanner, c byte) int</a>

```
searchKey: json.state0
tags: [function private]
```

```Go
func state0(s *scanner, c byte) int
```

state0 is the state after reading `0` during a number. 

### <a id="state1" href="#state1">func state1(s *scanner, c byte) int</a>

```
searchKey: json.state1
tags: [function private]
```

```Go
func state1(s *scanner, c byte) int
```

state1 is the state after reading a non-zero integer during a number, such as after reading `1` or `100` but not `0`. 

### <a id="stateBeginString" href="#stateBeginString">func stateBeginString(s *scanner, c byte) int</a>

```
searchKey: json.stateBeginString
tags: [function private]
```

```Go
func stateBeginString(s *scanner, c byte) int
```

stateBeginString is the state after reading `{"key": value,`. 

### <a id="stateBeginStringOrEmpty" href="#stateBeginStringOrEmpty">func stateBeginStringOrEmpty(s *scanner, c byte) int</a>

```
searchKey: json.stateBeginStringOrEmpty
tags: [function private]
```

```Go
func stateBeginStringOrEmpty(s *scanner, c byte) int
```

stateBeginStringOrEmpty is the state after reading `{`. 

### <a id="stateBeginValue" href="#stateBeginValue">func stateBeginValue(s *scanner, c byte) int</a>

```
searchKey: json.stateBeginValue
tags: [function private]
```

```Go
func stateBeginValue(s *scanner, c byte) int
```

stateBeginValue is the state at the beginning of the input. 

### <a id="stateBeginValueOrEmpty" href="#stateBeginValueOrEmpty">func stateBeginValueOrEmpty(s *scanner, c byte) int</a>

```
searchKey: json.stateBeginValueOrEmpty
tags: [function private]
```

```Go
func stateBeginValueOrEmpty(s *scanner, c byte) int
```

stateBeginValueOrEmpty is the state after reading `[`. 

### <a id="stateDot" href="#stateDot">func stateDot(s *scanner, c byte) int</a>

```
searchKey: json.stateDot
tags: [function private]
```

```Go
func stateDot(s *scanner, c byte) int
```

stateDot is the state after reading the integer and decimal point in a number, such as after reading `1.`. 

### <a id="stateDot0" href="#stateDot0">func stateDot0(s *scanner, c byte) int</a>

```
searchKey: json.stateDot0
tags: [function private]
```

```Go
func stateDot0(s *scanner, c byte) int
```

stateDot0 is the state after reading the integer, decimal point, and subsequent digits of a number, such as after reading `3.14`. 

### <a id="stateE" href="#stateE">func stateE(s *scanner, c byte) int</a>

```
searchKey: json.stateE
tags: [function private]
```

```Go
func stateE(s *scanner, c byte) int
```

stateE is the state after reading the mantissa and e in a number, such as after reading `314e` or `0.314e`. 

### <a id="stateE0" href="#stateE0">func stateE0(s *scanner, c byte) int</a>

```
searchKey: json.stateE0
tags: [function private]
```

```Go
func stateE0(s *scanner, c byte) int
```

stateE0 is the state after reading the mantissa, e, optional sign, and at least one digit of the exponent in a number, such as after reading `314e-2` or `0.314e+1` or `3.14e0`. 

### <a id="stateESign" href="#stateESign">func stateESign(s *scanner, c byte) int</a>

```
searchKey: json.stateESign
tags: [function private]
```

```Go
func stateESign(s *scanner, c byte) int
```

stateESign is the state after reading the mantissa, e, and sign in a number, such as after reading `314e-` or `0.314e+`. 

### <a id="stateEndTop" href="#stateEndTop">func stateEndTop(s *scanner, c byte) int</a>

```
searchKey: json.stateEndTop
tags: [function private]
```

```Go
func stateEndTop(s *scanner, c byte) int
```

stateEndTop is the state after finishing the top-level value, such as after reading `{}` or `[1,2,3]`. Only space characters should be seen now. 

### <a id="stateEndValue" href="#stateEndValue">func stateEndValue(s *scanner, c byte) int</a>

```
searchKey: json.stateEndValue
tags: [function private]
```

```Go
func stateEndValue(s *scanner, c byte) int
```

stateEndValue is the state after completing a value, such as after reading `{}` or `true` or `["x"`. 

### <a id="stateError" href="#stateError">func stateError(s *scanner, c byte) int</a>

```
searchKey: json.stateError
tags: [function private]
```

```Go
func stateError(s *scanner, c byte) int
```

stateError is the state after reaching a syntax error, such as after reading `[1}` or `5.1.2`. 

### <a id="stateF" href="#stateF">func stateF(s *scanner, c byte) int</a>

```
searchKey: json.stateF
tags: [function private]
```

```Go
func stateF(s *scanner, c byte) int
```

stateF is the state after reading `f`. 

### <a id="stateFa" href="#stateFa">func stateFa(s *scanner, c byte) int</a>

```
searchKey: json.stateFa
tags: [function private]
```

```Go
func stateFa(s *scanner, c byte) int
```

stateFa is the state after reading `fa`. 

### <a id="stateFal" href="#stateFal">func stateFal(s *scanner, c byte) int</a>

```
searchKey: json.stateFal
tags: [function private]
```

```Go
func stateFal(s *scanner, c byte) int
```

stateFal is the state after reading `fal`. 

### <a id="stateFals" href="#stateFals">func stateFals(s *scanner, c byte) int</a>

```
searchKey: json.stateFals
tags: [function private]
```

```Go
func stateFals(s *scanner, c byte) int
```

stateFals is the state after reading `fals`. 

### <a id="stateInString" href="#stateInString">func stateInString(s *scanner, c byte) int</a>

```
searchKey: json.stateInString
tags: [function private]
```

```Go
func stateInString(s *scanner, c byte) int
```

stateInString is the state after reading `"`. 

### <a id="stateInStringEsc" href="#stateInStringEsc">func stateInStringEsc(s *scanner, c byte) int</a>

```
searchKey: json.stateInStringEsc
tags: [function private]
```

```Go
func stateInStringEsc(s *scanner, c byte) int
```

stateInStringEsc is the state after reading `"\` during a quoted string. 

### <a id="stateInStringEscU" href="#stateInStringEscU">func stateInStringEscU(s *scanner, c byte) int</a>

```
searchKey: json.stateInStringEscU
tags: [function private]
```

```Go
func stateInStringEscU(s *scanner, c byte) int
```

stateInStringEscU is the state after reading `"\u` during a quoted string. 

### <a id="stateInStringEscU1" href="#stateInStringEscU1">func stateInStringEscU1(s *scanner, c byte) int</a>

```
searchKey: json.stateInStringEscU1
tags: [function private]
```

```Go
func stateInStringEscU1(s *scanner, c byte) int
```

stateInStringEscU1 is the state after reading `"\u1` during a quoted string. 

### <a id="stateInStringEscU12" href="#stateInStringEscU12">func stateInStringEscU12(s *scanner, c byte) int</a>

```
searchKey: json.stateInStringEscU12
tags: [function private]
```

```Go
func stateInStringEscU12(s *scanner, c byte) int
```

stateInStringEscU12 is the state after reading `"\u12` during a quoted string. 

### <a id="stateInStringEscU123" href="#stateInStringEscU123">func stateInStringEscU123(s *scanner, c byte) int</a>

```
searchKey: json.stateInStringEscU123
tags: [function private]
```

```Go
func stateInStringEscU123(s *scanner, c byte) int
```

stateInStringEscU123 is the state after reading `"\u123` during a quoted string. 

### <a id="stateN" href="#stateN">func stateN(s *scanner, c byte) int</a>

```
searchKey: json.stateN
tags: [function private]
```

```Go
func stateN(s *scanner, c byte) int
```

stateN is the state after reading `n`. 

### <a id="stateNeg" href="#stateNeg">func stateNeg(s *scanner, c byte) int</a>

```
searchKey: json.stateNeg
tags: [function private]
```

```Go
func stateNeg(s *scanner, c byte) int
```

stateNeg is the state after reading `-` during a number. 

### <a id="stateNu" href="#stateNu">func stateNu(s *scanner, c byte) int</a>

```
searchKey: json.stateNu
tags: [function private]
```

```Go
func stateNu(s *scanner, c byte) int
```

stateNu is the state after reading `nu`. 

### <a id="stateNul" href="#stateNul">func stateNul(s *scanner, c byte) int</a>

```
searchKey: json.stateNul
tags: [function private]
```

```Go
func stateNul(s *scanner, c byte) int
```

stateNul is the state after reading `nul`. 

### <a id="stateT" href="#stateT">func stateT(s *scanner, c byte) int</a>

```
searchKey: json.stateT
tags: [function private]
```

```Go
func stateT(s *scanner, c byte) int
```

stateT is the state after reading `t`. 

### <a id="stateTr" href="#stateTr">func stateTr(s *scanner, c byte) int</a>

```
searchKey: json.stateTr
tags: [function private]
```

```Go
func stateTr(s *scanner, c byte) int
```

stateTr is the state after reading `tr`. 

### <a id="stateTru" href="#stateTru">func stateTru(s *scanner, c byte) int</a>

```
searchKey: json.stateTru
tags: [function private]
```

```Go
func stateTru(s *scanner, c byte) int
```

stateTru is the state after reading `tru`. 

### <a id="stringEncoder" href="#stringEncoder">func stringEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.stringEncoder
tags: [function private]
```

```Go
func stringEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="tenc" href="#tenc">func tenc(format string, a ...interface{}) ([]byte, error)</a>

```
searchKey: json.tenc
tags: [function private]
```

```Go
func tenc(format string, a ...interface{}) ([]byte, error)
```

### <a id="textMarshalerEncoder" href="#textMarshalerEncoder">func textMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.textMarshalerEncoder
tags: [function private]
```

```Go
func textMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="trim" href="#trim">func trim(b []byte) []byte</a>

```
searchKey: json.trim
tags: [function private]
```

```Go
func trim(b []byte) []byte
```

### <a id="typeByIndex" href="#typeByIndex">func typeByIndex(t reflect.Type, index []int) reflect.Type</a>

```
searchKey: json.typeByIndex
tags: [function private]
```

```Go
func typeByIndex(t reflect.Type, index []int) reflect.Type
```

### <a id="uintEncoder" href="#uintEncoder">func uintEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.uintEncoder
tags: [function private]
```

```Go
func uintEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="unquote" href="#unquote">func unquote(s []byte) (t string, ok bool)</a>

```
searchKey: json.unquote
tags: [function private]
```

```Go
func unquote(s []byte) (t string, ok bool)
```

unquote converts a quoted JSON string literal s into an actual string t. The rules are different than for Go, so cannot use strconv.Unquote. 

### <a id="unquoteBytes" href="#unquoteBytes">func unquoteBytes(s []byte) (t []byte, ok bool)</a>

```
searchKey: json.unquoteBytes
tags: [function private]
```

```Go
func unquoteBytes(s []byte) (t []byte, ok bool)
```

### <a id="unsupportedTypeEncoder" href="#unsupportedTypeEncoder">func unsupportedTypeEncoder(e *encodeState, v reflect.Value, _ encOpts)</a>

```
searchKey: json.unsupportedTypeEncoder
tags: [function private]
```

```Go
func unsupportedTypeEncoder(e *encodeState, v reflect.Value, _ encOpts)
```

