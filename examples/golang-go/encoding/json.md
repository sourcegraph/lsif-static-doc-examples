# Package json

Package json implements encoding and decoding of JSON as defined in RFC 7159. The mapping between JSON and Go values is described in the documentation for the Marshal and Unmarshal functions. 

See "JSON and Go" for an introduction to this package: [https://golang.org/doc/articles/json_and_go.html](https://golang.org/doc/articles/json_and_go.html) 

## Index

* [Constants](#const)
    * [const phasePanicMsg](#phasePanicMsg)
    * [const startDetectingCyclesAfter](#startDetectingCyclesAfter)
    * [const caseMask](#caseMask)
    * [const kelvin](#kelvin)
    * [const smallLongEss](#smallLongEss)
    * [const scanContinue](#scanContinue)
    * [const scanBeginLiteral](#scanBeginLiteral)
    * [const scanBeginObject](#scanBeginObject)
    * [const scanObjectKey](#scanObjectKey)
    * [const scanObjectValue](#scanObjectValue)
    * [const scanEndObject](#scanEndObject)
    * [const scanBeginArray](#scanBeginArray)
    * [const scanArrayValue](#scanArrayValue)
    * [const scanEndArray](#scanEndArray)
    * [const scanSkipSpace](#scanSkipSpace)
    * [const scanEnd](#scanEnd)
    * [const scanError](#scanError)
    * [const parseObjectKey](#parseObjectKey)
    * [const parseObjectValue](#parseObjectValue)
    * [const parseArrayValue](#parseArrayValue)
    * [const maxNestingDepth](#maxNestingDepth)
    * [const tokenTopValue](#tokenTopValue)
    * [const tokenArrayStart](#tokenArrayStart)
    * [const tokenArrayValue](#tokenArrayValue)
    * [const tokenArrayComma](#tokenArrayComma)
    * [const tokenObjectStart](#tokenObjectStart)
    * [const tokenObjectKey](#tokenObjectKey)
    * [const tokenObjectColon](#tokenObjectColon)
    * [const tokenObjectValue](#tokenObjectValue)
    * [const tokenObjectComma](#tokenObjectComma)
* [Variables](#var)
    * [var nullLiteral](#nullLiteral)
    * [var textUnmarshalerType](#textUnmarshalerType)
    * [var numberType](#numberType)
    * [var hex](#hex)
    * [var encodeStatePool](#encodeStatePool)
    * [var encoderCache](#encoderCache)
    * [var marshalerType](#marshalerType)
    * [var textMarshalerType](#textMarshalerType)
    * [var float32Encoder](#float32Encoder)
    * [var float64Encoder](#float64Encoder)
    * [var fieldCache](#fieldCache)
    * [var scannerPool](#scannerPool)
    * [var safeSet](#safeSet)
    * [var htmlSafeSet](#htmlSafeSet)
    * [var codeJSON](#codeJSON)
    * [var codeStruct](#codeStruct)
    * [var ifaceNumAsFloat64](#ifaceNumAsFloat64)
    * [var ifaceNumAsNumber](#ifaceNumAsNumber)
    * [var errMissingU8Prefix](#errMissingU8Prefix)
    * [var umtrue](#umtrue)
    * [var umslice](#umslice)
    * [var umstruct](#umstruct)
    * [var umtrueXY](#umtrueXY)
    * [var umsliceXY](#umsliceXY)
    * [var umstructXY](#umstructXY)
    * [var ummapXY](#ummapXY)
    * [var unmarshalTests](#unmarshalTests)
    * [var badUTF8](#badUTF8)
    * [var numberTests](#numberTests)
    * [var wrongStringTests](#wrongStringTests)
    * [var allValue](#allValue)
    * [var pallValue](#pallValue)
    * [var allValueIndent](#allValueIndent)
    * [var allValueCompact](#allValueCompact)
    * [var pallValueIndent](#pallValueIndent)
    * [var pallValueCompact](#pallValueCompact)
    * [var interfaceSetTests](#interfaceSetTests)
    * [var decodeTypeErrorTests](#decodeTypeErrorTests)
    * [var unmarshalSyntaxTests](#unmarshalSyntaxTests)
    * [var invalidUnmarshalTests](#invalidUnmarshalTests)
    * [var invalidUnmarshalTextTests](#invalidUnmarshalTextTests)
    * [var optionalsExpected](#optionalsExpected)
    * [var samePointerNoCycle](#samePointerNoCycle)
    * [var pointerCycle](#pointerCycle)
    * [var pointerCycleIndirect](#pointerCycleIndirect)
    * [var mapCycle](#mapCycle)
    * [var sliceCycle](#sliceCycle)
    * [var sliceNoCycle](#sliceNoCycle)
    * [var recursiveSliceCycle](#recursiveSliceCycle)
    * [var unsupportedValues](#unsupportedValues)
    * [var encodeStringTests](#encodeStringTests)
    * [var re](#re)
    * [var badFloatREs](#badFloatREs)
    * [var foldTests](#foldTests)
    * [var validTests](#validTests)
    * [var examples](#examples)
    * [var ex1](#ex1)
    * [var ex1i](#ex1i)
    * [var indentErrorTests](#indentErrorTests)
    * [var jsonBig](#jsonBig)
    * [var streamTest](#streamTest)
    * [var streamEncoded](#streamEncoded)
    * [var streamEncodedIndent](#streamEncodedIndent)
    * [var blockingTests](#blockingTests)
    * [var tokenStreamCases](#tokenStreamCases)
    * [var structTagObjectKeyTests](#structTagObjectKeyTests)
* [Types](#type)
    * [type Unmarshaler interface](#Unmarshaler)
        * [func indirect(v reflect.Value, decodingNull bool) (Unmarshaler, encoding.TextUnmarshaler, reflect.Value)](#indirect)
    * [type UnmarshalTypeError struct](#UnmarshalTypeError)
        * [func (e *UnmarshalTypeError) Error() string](#UnmarshalTypeError.Error)
    * [type UnmarshalFieldError struct](#UnmarshalFieldError)
        * [func (e *UnmarshalFieldError) Error() string](#UnmarshalFieldError.Error)
    * [type InvalidUnmarshalError struct](#InvalidUnmarshalError)
        * [func (e *InvalidUnmarshalError) Error() string](#InvalidUnmarshalError.Error)
    * [type Number string](#Number)
        * [func (n Number) String() string](#Number.String)
        * [func (n Number) Float64() (float64, error)](#Number.Float64)
        * [func (n Number) Int64() (int64, error)](#Number.Int64)
    * [type errorContext struct](#errorContext)
    * [type decodeState struct](#decodeState)
        * [func (d *decodeState) unmarshal(v interface{}) error](#decodeState.unmarshal)
        * [func (d *decodeState) readIndex() int](#decodeState.readIndex)
        * [func (d *decodeState) init(data []byte) *decodeState](#decodeState.init)
        * [func (d *decodeState) saveError(err error)](#decodeState.saveError)
        * [func (d *decodeState) addErrorContext(err error) error](#decodeState.addErrorContext)
        * [func (d *decodeState) skip()](#decodeState.skip)
        * [func (d *decodeState) scanNext()](#decodeState.scanNext)
        * [func (d *decodeState) scanWhile(op int)](#decodeState.scanWhile)
        * [func (d *decodeState) rescanLiteral()](#decodeState.rescanLiteral)
        * [func (d *decodeState) value(v reflect.Value) error](#decodeState.value)
        * [func (d *decodeState) valueQuoted() interface{}](#decodeState.valueQuoted)
        * [func (d *decodeState) array(v reflect.Value) error](#decodeState.array)
        * [func (d *decodeState) object(v reflect.Value) error](#decodeState.object)
        * [func (d *decodeState) convertNumber(s string) (interface{}, error)](#decodeState.convertNumber)
        * [func (d *decodeState) literalStore(item []byte, v reflect.Value, fromQuoted bool) error](#decodeState.literalStore)
        * [func (d *decodeState) valueInterface() (val interface{})](#decodeState.valueInterface)
        * [func (d *decodeState) arrayInterface() []interface{}](#decodeState.arrayInterface)
        * [func (d *decodeState) objectInterface() map[string]interface{}](#decodeState.objectInterface)
        * [func (d *decodeState) literalInterface() interface{}](#decodeState.literalInterface)
    * [type unquotedValue struct{}](#unquotedValue)
    * [type Marshaler interface](#Marshaler)
    * [type UnsupportedTypeError struct](#UnsupportedTypeError)
        * [func (e *UnsupportedTypeError) Error() string](#UnsupportedTypeError.Error)
    * [type UnsupportedValueError struct](#UnsupportedValueError)
        * [func (e *UnsupportedValueError) Error() string](#UnsupportedValueError.Error)
    * [type InvalidUTF8Error struct](#InvalidUTF8Error)
        * [func (e *InvalidUTF8Error) Error() string](#InvalidUTF8Error.Error)
    * [type MarshalerError struct](#MarshalerError)
        * [func (e *MarshalerError) Error() string](#MarshalerError.Error)
        * [func (e *MarshalerError) Unwrap() error](#MarshalerError.Unwrap)
    * [type encodeState struct](#encodeState)
        * [func newEncodeState() *encodeState](#newEncodeState)
        * [func (e *encodeState) marshal(v interface{}, opts encOpts) (err error)](#encodeState.marshal)
        * [func (e *encodeState) error(err error)](#encodeState.error)
        * [func (e *encodeState) reflectValue(v reflect.Value, opts encOpts)](#encodeState.reflectValue)
        * [func (e *encodeState) string(s string, escapeHTML bool)](#encodeState.string)
        * [func (e *encodeState) stringBytes(s []byte, escapeHTML bool)](#encodeState.stringBytes)
    * [type jsonError struct](#jsonError)
    * [type encOpts struct](#encOpts)
    * [type encoderFunc func(e *std/encoding/json.encodeState, v reflect.Value, opts std/encoding/json.encOpts)](#encoderFunc)
        * [func valueEncoder(v reflect.Value) encoderFunc](#valueEncoder)
        * [func typeEncoder(t reflect.Type) encoderFunc](#typeEncoder)
        * [func newTypeEncoder(t reflect.Type, allowAddr bool) encoderFunc](#newTypeEncoder)
        * [func newStructEncoder(t reflect.Type) encoderFunc](#newStructEncoder)
        * [func newMapEncoder(t reflect.Type) encoderFunc](#newMapEncoder)
        * [func newSliceEncoder(t reflect.Type) encoderFunc](#newSliceEncoder)
        * [func newArrayEncoder(t reflect.Type) encoderFunc](#newArrayEncoder)
        * [func newPtrEncoder(t reflect.Type) encoderFunc](#newPtrEncoder)
        * [func newCondAddrEncoder(canAddrEnc, elseEnc encoderFunc) encoderFunc](#newCondAddrEncoder)
    * [type floatEncoder int](#floatEncoder)
        * [func (bits floatEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)](#floatEncoder.encode)
    * [type structEncoder struct](#structEncoder)
        * [func (se structEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)](#structEncoder.encode)
    * [type structFields struct](#structFields)
        * [func typeFields(t reflect.Type) structFields](#typeFields)
        * [func cachedTypeFields(t reflect.Type) structFields](#cachedTypeFields)
    * [type mapEncoder struct](#mapEncoder)
        * [func (me mapEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)](#mapEncoder.encode)
    * [type sliceEncoder struct](#sliceEncoder)
        * [func (se sliceEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)](#sliceEncoder.encode)
    * [type arrayEncoder struct](#arrayEncoder)
        * [func (ae arrayEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)](#arrayEncoder.encode)
    * [type ptrEncoder struct](#ptrEncoder)
        * [func (pe ptrEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)](#ptrEncoder.encode)
    * [type condAddrEncoder struct](#condAddrEncoder)
        * [func (ce condAddrEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)](#condAddrEncoder.encode)
    * [type reflectWithString struct](#reflectWithString)
        * [func (w *reflectWithString) resolve() error](#reflectWithString.resolve)
    * [type field struct](#field)
        * [func dominantField(fields []field) (field, bool)](#dominantField)
    * [type byIndex []json.field](#byIndex)
        * [func (x byIndex) Len() int](#byIndex.Len)
        * [func (x byIndex) Swap(i, j int)](#byIndex.Swap)
        * [func (x byIndex) Less(i, j int) bool](#byIndex.Less)
    * [type SyntaxError struct](#SyntaxError)
        * [func (e *SyntaxError) Error() string](#SyntaxError.Error)
    * [type scanner struct](#scanner)
        * [func newScanner() *scanner](#newScanner)
        * [func (s *scanner) reset()](#scanner.reset)
        * [func (s *scanner) eof() int](#scanner.eof)
        * [func (s *scanner) pushParseState(c byte, newParseState int, successState int) int](#scanner.pushParseState)
        * [func (s *scanner) popParseState()](#scanner.popParseState)
        * [func (s *scanner) error(c byte, context string) int](#scanner.error)
    * [type Decoder struct](#Decoder)
        * [func NewDecoder(r io.Reader) *Decoder](#NewDecoder)
        * [func (dec *Decoder) UseNumber()](#Decoder.UseNumber)
        * [func (dec *Decoder) DisallowUnknownFields()](#Decoder.DisallowUnknownFields)
        * [func (dec *Decoder) Decode(v interface{}) error](#Decoder.Decode)
        * [func (dec *Decoder) Buffered() io.Reader](#Decoder.Buffered)
        * [func (dec *Decoder) readValue() (int, error)](#Decoder.readValue)
        * [func (dec *Decoder) refill() error](#Decoder.refill)
        * [func (dec *Decoder) tokenPrepareForDecode() error](#Decoder.tokenPrepareForDecode)
        * [func (dec *Decoder) tokenValueAllowed() bool](#Decoder.tokenValueAllowed)
        * [func (dec *Decoder) tokenValueEnd()](#Decoder.tokenValueEnd)
        * [func (dec *Decoder) Token() (Token, error)](#Decoder.Token)
        * [func (dec *Decoder) tokenError(c byte) (Token, error)](#Decoder.tokenError)
        * [func (dec *Decoder) More() bool](#Decoder.More)
        * [func (dec *Decoder) peek() (byte, error)](#Decoder.peek)
        * [func (dec *Decoder) InputOffset() int64](#Decoder.InputOffset)
    * [type Encoder struct](#Encoder)
        * [func NewEncoder(w io.Writer) *Encoder](#NewEncoder)
        * [func (enc *Encoder) Encode(v interface{}) error](#Encoder.Encode)
        * [func (enc *Encoder) SetIndent(prefix, indent string)](#Encoder.SetIndent)
        * [func (enc *Encoder) SetEscapeHTML(on bool)](#Encoder.SetEscapeHTML)
    * [type RawMessage []byte](#RawMessage)
        * [func (m RawMessage) MarshalJSON() ([]byte, error)](#RawMessage.MarshalJSON)
        * [func (m *RawMessage) UnmarshalJSON(data []byte) error](#RawMessage.UnmarshalJSON)
    * [type Token interface{}](#Token)
    * [type Delim rune](#Delim)
        * [func (d Delim) String() string](#Delim.String)
    * [type tagOptions string](#tagOptions)
        * [func parseTag(tag string) (string, tagOptions)](#parseTag)
        * [func (o tagOptions) Contains(optionName string) bool](#tagOptions.Contains)
    * [type codeResponse struct](#codeResponse)
    * [type codeNode struct](#codeNode)
    * [type T struct](#T)
    * [type U struct](#U)
    * [type V struct](#V)
    * [type VOuter struct](#VOuter)
    * [type W struct](#W)
    * [type P struct](#P)
    * [type PP struct](#PP)
    * [type SS string](#SS)
        * [func (*SS) UnmarshalJSON(data []byte) error](#SS.UnmarshalJSON)
    * [type tx struct](#tx)
    * [type u8 uint8](#u8)
    * [type unmarshaler struct](#unmarshaler)
        * [func (u *unmarshaler) UnmarshalJSON(b []byte) error](#unmarshaler.UnmarshalJSON)
    * [type ustruct struct](#ustruct)
    * [type unmarshalerText struct](#unmarshalerText)
        * [func (u unmarshalerText) MarshalText() ([]byte, error)](#unmarshalerText.MarshalText)
        * [func (u *unmarshalerText) UnmarshalText(b []byte) error](#unmarshalerText.UnmarshalText)
    * [type ustructText struct](#ustructText)
    * [type u8marshal uint8](#u8marshal)
        * [func (u8 u8marshal) MarshalText() ([]byte, error)](#u8marshal.MarshalText)
        * [func (u8 *u8marshal) UnmarshalText(b []byte) error](#u8marshal.UnmarshalText)
    * [type Point struct](#Point)
    * [type Top struct](#Top)
    * [type Embed0 struct](#Embed0)
    * [type Embed0a struct](#Embed0a)
    * [type Embed0b json.Embed0](#Embed0b)
    * [type Embed0c json.Embed0](#Embed0c)
    * [type Embed0p struct](#Embed0p)
    * [type Embed0q struct](#Embed0q)
    * [type embed struct](#embed)
    * [type Loop struct](#Loop)
    * [type S5 struct](#S5)
    * [type S6 struct](#S6)
    * [type S7 json.S6](#S7)
    * [type S8 struct](#S8)
    * [type S9 struct](#S9)
    * [type S10 struct](#S10)
    * [type S11 struct](#S11)
    * [type S12 struct](#S12)
    * [type S13 struct](#S13)
    * [type Ambig struct](#Ambig)
    * [type XYZ struct](#XYZ)
    * [type unexportedWithMethods struct{}](#unexportedWithMethods)
        * [func (unexportedWithMethods) F()](#unexportedWithMethods.F)
    * [type byteWithMarshalJSON byte](#byteWithMarshalJSON)
        * [func (b byteWithMarshalJSON) MarshalJSON() ([]byte, error)](#byteWithMarshalJSON.MarshalJSON)
        * [func (b *byteWithMarshalJSON) UnmarshalJSON(data []byte) error](#byteWithMarshalJSON.UnmarshalJSON)
    * [type byteWithPtrMarshalJSON byte](#byteWithPtrMarshalJSON)
        * [func (b *byteWithPtrMarshalJSON) MarshalJSON() ([]byte, error)](#byteWithPtrMarshalJSON.MarshalJSON)
        * [func (b *byteWithPtrMarshalJSON) UnmarshalJSON(data []byte) error](#byteWithPtrMarshalJSON.UnmarshalJSON)
    * [type byteWithMarshalText byte](#byteWithMarshalText)
        * [func (b byteWithMarshalText) MarshalText() ([]byte, error)](#byteWithMarshalText.MarshalText)
        * [func (b *byteWithMarshalText) UnmarshalText(data []byte) error](#byteWithMarshalText.UnmarshalText)
    * [type byteWithPtrMarshalText byte](#byteWithPtrMarshalText)
        * [func (b *byteWithPtrMarshalText) MarshalText() ([]byte, error)](#byteWithPtrMarshalText.MarshalText)
        * [func (b *byteWithPtrMarshalText) UnmarshalText(data []byte) error](#byteWithPtrMarshalText.UnmarshalText)
    * [type intWithMarshalJSON int](#intWithMarshalJSON)
        * [func (b intWithMarshalJSON) MarshalJSON() ([]byte, error)](#intWithMarshalJSON.MarshalJSON)
        * [func (b *intWithMarshalJSON) UnmarshalJSON(data []byte) error](#intWithMarshalJSON.UnmarshalJSON)
    * [type intWithPtrMarshalJSON int](#intWithPtrMarshalJSON)
        * [func (b *intWithPtrMarshalJSON) MarshalJSON() ([]byte, error)](#intWithPtrMarshalJSON.MarshalJSON)
        * [func (b *intWithPtrMarshalJSON) UnmarshalJSON(data []byte) error](#intWithPtrMarshalJSON.UnmarshalJSON)
    * [type intWithMarshalText int](#intWithMarshalText)
        * [func (b intWithMarshalText) MarshalText() ([]byte, error)](#intWithMarshalText.MarshalText)
        * [func (b *intWithMarshalText) UnmarshalText(data []byte) error](#intWithMarshalText.UnmarshalText)
    * [type intWithPtrMarshalText int](#intWithPtrMarshalText)
        * [func (b *intWithPtrMarshalText) MarshalText() ([]byte, error)](#intWithPtrMarshalText.MarshalText)
        * [func (b *intWithPtrMarshalText) UnmarshalText(data []byte) error](#intWithPtrMarshalText.UnmarshalText)
    * [type mapStringToStringData struct](#mapStringToStringData)
    * [type unmarshalTest struct](#unmarshalTest)
    * [type B struct](#B)
    * [type DoublePtr struct](#DoublePtr)
    * [type Xint struct](#Xint)
    * [type WrongString struct](#WrongString)
    * [type wrongStringTest struct](#wrongStringTest)
    * [type All struct](#All)
    * [type Small struct](#Small)
    * [type NullTest struct](#NullTest)
    * [type MustNotUnmarshalJSON struct{}](#MustNotUnmarshalJSON)
        * [func (x MustNotUnmarshalJSON) UnmarshalJSON(data []byte) error](#MustNotUnmarshalJSON.UnmarshalJSON)
    * [type MustNotUnmarshalText struct{}](#MustNotUnmarshalText)
        * [func (x MustNotUnmarshalText) UnmarshalText(text []byte) error](#MustNotUnmarshalText.UnmarshalText)
    * [type unexportedFields struct](#unexportedFields)
    * [type Time3339 time.Time](#Time3339)
        * [func (t *Time3339) UnmarshalJSON(b []byte) error](#Time3339.UnmarshalJSON)
    * [type unmarshalPanic struct{}](#unmarshalPanic)
        * [func (unmarshalPanic) UnmarshalJSON([]byte) error](#unmarshalPanic.UnmarshalJSON)
    * [type textUnmarshalerString string](#textUnmarshalerString)
        * [func (m *textUnmarshalerString) UnmarshalText(text []byte) error](#textUnmarshalerString.UnmarshalText)
    * [type Optionals struct](#Optionals)
    * [type StringTag struct](#StringTag)
    * [type renamedByte byte](#renamedByte)
    * [type renamedByteSlice []byte](#renamedByteSlice)
    * [type renamedRenamedByteSlice []json.renamedByte](#renamedRenamedByteSlice)
    * [type SamePointerNoCycle struct](#SamePointerNoCycle)
    * [type PointerCycle struct](#PointerCycle)
    * [type PointerCycleIndirect struct](#PointerCycleIndirect)
    * [type RecursiveSlice []json.RecursiveSlice](#RecursiveSlice)
    * [type Ref int](#Ref)
        * [func (*Ref) MarshalJSON() ([]byte, error)](#Ref.MarshalJSON)
        * [func (r *Ref) UnmarshalJSON([]byte) error](#Ref.UnmarshalJSON)
    * [type Val int](#Val)
        * [func (Val) MarshalJSON() ([]byte, error)](#Val.MarshalJSON)
    * [type RefText int](#RefText)
        * [func (*RefText) MarshalText() ([]byte, error)](#RefText.MarshalText)
        * [func (r *RefText) UnmarshalText([]byte) error](#RefText.UnmarshalText)
    * [type ValText int](#ValText)
        * [func (ValText) MarshalText() ([]byte, error)](#ValText.MarshalText)
    * [type C int](#C)
        * [func (C) MarshalJSON() ([]byte, error)](#C.MarshalJSON)
    * [type CText int](#CText)
        * [func (CText) MarshalText() ([]byte, error)](#CText.MarshalText)
    * [type BugA struct](#BugA)
    * [type BugB struct](#BugB)
    * [type BugC struct](#BugC)
    * [type BugX struct](#BugX)
    * [type nilJSONMarshaler string](#nilJSONMarshaler)
        * [func (nm *nilJSONMarshaler) MarshalJSON() ([]byte, error)](#nilJSONMarshaler.MarshalJSON)
    * [type nilTextMarshaler string](#nilTextMarshaler)
        * [func (nm *nilTextMarshaler) MarshalText() ([]byte, error)](#nilTextMarshaler.MarshalText)
    * [type BugD struct](#BugD)
    * [type BugY struct](#BugY)
    * [type BugZ struct](#BugZ)
    * [type jsonbyte byte](#jsonbyte)
        * [func (b jsonbyte) MarshalJSON() ([]byte, error)](#jsonbyte.MarshalJSON)
    * [type textbyte byte](#textbyte)
        * [func (b textbyte) MarshalText() ([]byte, error)](#textbyte.MarshalText)
    * [type jsonint int](#jsonint)
        * [func (i jsonint) MarshalJSON() ([]byte, error)](#jsonint.MarshalJSON)
    * [type textint int](#textint)
        * [func (i textint) MarshalText() ([]byte, error)](#textint.MarshalText)
    * [type textfloat float64](#textfloat)
        * [func (f textfloat) MarshalText() ([]byte, error)](#textfloat.MarshalText)
    * [type marshalPanic struct{}](#marshalPanic)
        * [func (marshalPanic) MarshalJSON() ([]byte, error)](#marshalPanic.MarshalJSON)
    * [type example struct](#example)
    * [type indentErrorTest struct](#indentErrorTest)
    * [type strMarshaler string](#strMarshaler)
        * [func (s strMarshaler) MarshalJSON() ([]byte, error)](#strMarshaler.MarshalJSON)
    * [type strPtrMarshaler string](#strPtrMarshaler)
        * [func (s *strPtrMarshaler) MarshalJSON() ([]byte, error)](#strPtrMarshaler.MarshalJSON)
    * [type tokenStreamCase struct](#tokenStreamCase)
    * [type decodeThis struct](#decodeThis)
    * [type basicLatin2xTag struct](#basicLatin2xTag)
    * [type basicLatin3xTag struct](#basicLatin3xTag)
    * [type basicLatin4xTag struct](#basicLatin4xTag)
    * [type basicLatin5xTag struct](#basicLatin5xTag)
    * [type basicLatin6xTag struct](#basicLatin6xTag)
    * [type basicLatin7xTag struct](#basicLatin7xTag)
    * [type miscPlaneTag struct](#miscPlaneTag)
    * [type percentSlashTag struct](#percentSlashTag)
    * [type punctuationTag struct](#punctuationTag)
    * [type dashTag struct](#dashTag)
    * [type emptyTag struct](#emptyTag)
    * [type misnamedTag struct](#misnamedTag)
    * [type badFormatTag struct](#badFormatTag)
    * [type badCodeTag struct](#badCodeTag)
    * [type spaceTag struct](#spaceTag)
    * [type unicodeTag struct](#unicodeTag)
* [Functions](#func)
    * [func Unmarshal(data []byte, v interface{}) error](#Unmarshal)
    * [func getu4(s []byte) rune](#getu4)
    * [func unquote(s []byte) (t string, ok bool)](#unquote)
    * [func unquoteBytes(s []byte) (t []byte, ok bool)](#unquoteBytes)
    * [func Marshal(v interface{}) ([]byte, error)](#Marshal)
    * [func MarshalIndent(v interface{}, prefix, indent string) ([]byte, error)](#MarshalIndent)
    * [func HTMLEscape(dst *bytes.Buffer, src []byte)](#HTMLEscape)
    * [func isEmptyValue(v reflect.Value) bool](#isEmptyValue)
    * [func invalidValueEncoder(e *encodeState, v reflect.Value, _ encOpts)](#invalidValueEncoder)
    * [func marshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)](#marshalerEncoder)
    * [func addrMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)](#addrMarshalerEncoder)
    * [func textMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)](#textMarshalerEncoder)
    * [func addrTextMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)](#addrTextMarshalerEncoder)
    * [func boolEncoder(e *encodeState, v reflect.Value, opts encOpts)](#boolEncoder)
    * [func intEncoder(e *encodeState, v reflect.Value, opts encOpts)](#intEncoder)
    * [func uintEncoder(e *encodeState, v reflect.Value, opts encOpts)](#uintEncoder)
    * [func stringEncoder(e *encodeState, v reflect.Value, opts encOpts)](#stringEncoder)
    * [func isValidNumber(s string) bool](#isValidNumber)
    * [func interfaceEncoder(e *encodeState, v reflect.Value, opts encOpts)](#interfaceEncoder)
    * [func unsupportedTypeEncoder(e *encodeState, v reflect.Value, _ encOpts)](#unsupportedTypeEncoder)
    * [func encodeByteSlice(e *encodeState, v reflect.Value, _ encOpts)](#encodeByteSlice)
    * [func isValidTag(s string) bool](#isValidTag)
    * [func typeByIndex(t reflect.Type, index []int) reflect.Type](#typeByIndex)
    * [func foldFunc(s []byte) func(s, t []byte) bool](#foldFunc)
    * [func equalFoldRight(s, t []byte) bool](#equalFoldRight)
    * [func asciiEqualFold(s, t []byte) bool](#asciiEqualFold)
    * [func simpleLetterEqualFold(s, t []byte) bool](#simpleLetterEqualFold)
    * [func Compact(dst *bytes.Buffer, src []byte) error](#Compact)
    * [func compact(dst *bytes.Buffer, src []byte, escape bool) error](#compact)
    * [func newline(dst *bytes.Buffer, prefix, indent string, depth int)](#newline)
    * [func Indent(dst *bytes.Buffer, src []byte, prefix, indent string) error](#Indent)
    * [func Valid(data []byte) bool](#Valid)
    * [func checkValid(data []byte, scan *scanner) error](#checkValid)
    * [func freeScanner(scan *scanner)](#freeScanner)
    * [func isSpace(c byte) bool](#isSpace)
    * [func stateBeginValueOrEmpty(s *scanner, c byte) int](#stateBeginValueOrEmpty)
    * [func stateBeginValue(s *scanner, c byte) int](#stateBeginValue)
    * [func stateBeginStringOrEmpty(s *scanner, c byte) int](#stateBeginStringOrEmpty)
    * [func stateBeginString(s *scanner, c byte) int](#stateBeginString)
    * [func stateEndValue(s *scanner, c byte) int](#stateEndValue)
    * [func stateEndTop(s *scanner, c byte) int](#stateEndTop)
    * [func stateInString(s *scanner, c byte) int](#stateInString)
    * [func stateInStringEsc(s *scanner, c byte) int](#stateInStringEsc)
    * [func stateInStringEscU(s *scanner, c byte) int](#stateInStringEscU)
    * [func stateInStringEscU1(s *scanner, c byte) int](#stateInStringEscU1)
    * [func stateInStringEscU12(s *scanner, c byte) int](#stateInStringEscU12)
    * [func stateInStringEscU123(s *scanner, c byte) int](#stateInStringEscU123)
    * [func stateNeg(s *scanner, c byte) int](#stateNeg)
    * [func state1(s *scanner, c byte) int](#state1)
    * [func state0(s *scanner, c byte) int](#state0)
    * [func stateDot(s *scanner, c byte) int](#stateDot)
    * [func stateDot0(s *scanner, c byte) int](#stateDot0)
    * [func stateE(s *scanner, c byte) int](#stateE)
    * [func stateESign(s *scanner, c byte) int](#stateESign)
    * [func stateE0(s *scanner, c byte) int](#stateE0)
    * [func stateT(s *scanner, c byte) int](#stateT)
    * [func stateTr(s *scanner, c byte) int](#stateTr)
    * [func stateTru(s *scanner, c byte) int](#stateTru)
    * [func stateF(s *scanner, c byte) int](#stateF)
    * [func stateFa(s *scanner, c byte) int](#stateFa)
    * [func stateFal(s *scanner, c byte) int](#stateFal)
    * [func stateFals(s *scanner, c byte) int](#stateFals)
    * [func stateN(s *scanner, c byte) int](#stateN)
    * [func stateNu(s *scanner, c byte) int](#stateNu)
    * [func stateNul(s *scanner, c byte) int](#stateNul)
    * [func stateError(s *scanner, c byte) int](#stateError)
    * [func quoteChar(c byte) string](#quoteChar)
    * [func nonSpace(b []byte) bool](#nonSpace)
    * [func codeInit()](#codeInit)
    * [func BenchmarkCodeEncoder(b *testing.B)](#BenchmarkCodeEncoder)
    * [func BenchmarkCodeMarshal(b *testing.B)](#BenchmarkCodeMarshal)
    * [func benchMarshalBytes(n int) func(*testing.B)](#benchMarshalBytes)
    * [func BenchmarkMarshalBytes(b *testing.B)](#BenchmarkMarshalBytes)
    * [func BenchmarkCodeDecoder(b *testing.B)](#BenchmarkCodeDecoder)
    * [func BenchmarkUnicodeDecoder(b *testing.B)](#BenchmarkUnicodeDecoder)
    * [func BenchmarkDecoderStream(b *testing.B)](#BenchmarkDecoderStream)
    * [func BenchmarkCodeUnmarshal(b *testing.B)](#BenchmarkCodeUnmarshal)
    * [func BenchmarkCodeUnmarshalReuse(b *testing.B)](#BenchmarkCodeUnmarshalReuse)
    * [func BenchmarkUnmarshalString(b *testing.B)](#BenchmarkUnmarshalString)
    * [func BenchmarkUnmarshalFloat64(b *testing.B)](#BenchmarkUnmarshalFloat64)
    * [func BenchmarkUnmarshalInt64(b *testing.B)](#BenchmarkUnmarshalInt64)
    * [func BenchmarkIssue10335(b *testing.B)](#BenchmarkIssue10335)
    * [func BenchmarkIssue34127(b *testing.B)](#BenchmarkIssue34127)
    * [func BenchmarkUnmapped(b *testing.B)](#BenchmarkUnmapped)
    * [func BenchmarkTypeFieldsCache(b *testing.B)](#BenchmarkTypeFieldsCache)
    * [func BenchmarkEncodeMarshaler(b *testing.B)](#BenchmarkEncodeMarshaler)
    * [func TestMarshal(t *testing.T)](#TestMarshal)
    * [func TestMarshalBadUTF8(t *testing.T)](#TestMarshalBadUTF8)
    * [func TestMarshalNumberZeroVal(t *testing.T)](#TestMarshalNumberZeroVal)
    * [func TestMarshalEmbeds(t *testing.T)](#TestMarshalEmbeds)
    * [func equalError(a, b error) bool](#equalError)
    * [func TestUnmarshal(t *testing.T)](#TestUnmarshal)
    * [func TestUnmarshalMarshal(t *testing.T)](#TestUnmarshalMarshal)
    * [func TestNumberAccessors(t *testing.T)](#TestNumberAccessors)
    * [func TestLargeByteSlice(t *testing.T)](#TestLargeByteSlice)
    * [func TestUnmarshalInterface(t *testing.T)](#TestUnmarshalInterface)
    * [func TestUnmarshalPtrPtr(t *testing.T)](#TestUnmarshalPtrPtr)
    * [func TestEscape(t *testing.T)](#TestEscape)
    * [func TestErrorMessageFromMisusedString(t *testing.T)](#TestErrorMessageFromMisusedString)
    * [func noSpace(c rune) rune](#noSpace)
    * [func TestRefUnmarshal(t *testing.T)](#TestRefUnmarshal)
    * [func TestEmptyString(t *testing.T)](#TestEmptyString)
    * [func TestNullString(t *testing.T)](#TestNullString)
    * [func intp(x int) *int](#intp)
    * [func intpp(x *int) **int](#intpp)
    * [func TestInterfaceSet(t *testing.T)](#TestInterfaceSet)
    * [func TestUnmarshalNulls(t *testing.T)](#TestUnmarshalNulls)
    * [func TestStringKind(t *testing.T)](#TestStringKind)
    * [func TestByteKind(t *testing.T)](#TestByteKind)
    * [func TestSliceOfCustomByte(t *testing.T)](#TestSliceOfCustomByte)
    * [func TestUnmarshalTypeError(t *testing.T)](#TestUnmarshalTypeError)
    * [func TestUnmarshalSyntax(t *testing.T)](#TestUnmarshalSyntax)
    * [func TestUnmarshalUnexported(t *testing.T)](#TestUnmarshalUnexported)
    * [func TestUnmarshalJSONLiteralError(t *testing.T)](#TestUnmarshalJSONLiteralError)
    * [func TestSkipArrayObjects(t *testing.T)](#TestSkipArrayObjects)
    * [func TestPrefilled(t *testing.T)](#TestPrefilled)
    * [func TestInvalidUnmarshal(t *testing.T)](#TestInvalidUnmarshal)
    * [func TestInvalidUnmarshalText(t *testing.T)](#TestInvalidUnmarshalText)
    * [func TestInvalidStringOption(t *testing.T)](#TestInvalidStringOption)
    * [func TestUnmarshalEmbeddedUnexported(t *testing.T)](#TestUnmarshalEmbeddedUnexported)
    * [func TestUnmarshalErrorAfterMultipleJSON(t *testing.T)](#TestUnmarshalErrorAfterMultipleJSON)
    * [func TestUnmarshalPanic(t *testing.T)](#TestUnmarshalPanic)
    * [func TestUnmarshalRecursivePointer(t *testing.T)](#TestUnmarshalRecursivePointer)
    * [func TestUnmarshalMapWithTextUnmarshalerStringKey(t *testing.T)](#TestUnmarshalMapWithTextUnmarshalerStringKey)
    * [func TestUnmarshalRescanLiteralMangledUnquote(t *testing.T)](#TestUnmarshalRescanLiteralMangledUnquote)
    * [func TestUnmarshalMaxDepth(t *testing.T)](#TestUnmarshalMaxDepth)
    * [func TestOmitEmpty(t *testing.T)](#TestOmitEmpty)
    * [func TestRoundtripStringTag(t *testing.T)](#TestRoundtripStringTag)
    * [func TestEncodeRenamedByteSlice(t *testing.T)](#TestEncodeRenamedByteSlice)
    * [func init()](#init)
    * [func TestSamePointerNoCycle(t *testing.T)](#TestSamePointerNoCycle)
    * [func TestSliceNoCycle(t *testing.T)](#TestSliceNoCycle)
    * [func TestUnsupportedValues(t *testing.T)](#TestUnsupportedValues)
    * [func TestMarshalTextFloatMap(t *testing.T)](#TestMarshalTextFloatMap)
    * [func TestRefValMarshal(t *testing.T)](#TestRefValMarshal)
    * [func TestMarshalerEscaping(t *testing.T)](#TestMarshalerEscaping)
    * [func TestAnonymousFields(t *testing.T)](#TestAnonymousFields)
    * [func TestNilMarshal(t *testing.T)](#TestNilMarshal)
    * [func TestEmbeddedBug(t *testing.T)](#TestEmbeddedBug)
    * [func TestTaggedFieldDominates(t *testing.T)](#TestTaggedFieldDominates)
    * [func TestDuplicatedFieldDisappears(t *testing.T)](#TestDuplicatedFieldDisappears)
    * [func TestStringBytes(t *testing.T)](#TestStringBytes)
    * [func TestIssue10281(t *testing.T)](#TestIssue10281)
    * [func TestHTMLEscape(t *testing.T)](#TestHTMLEscape)
    * [func TestEncodePointerString(t *testing.T)](#TestEncodePointerString)
    * [func TestEncodeString(t *testing.T)](#TestEncodeString)
    * [func tenc(format string, a ...interface{}) ([]byte, error)](#tenc)
    * [func TestEncodeBytekind(t *testing.T)](#TestEncodeBytekind)
    * [func TestTextMarshalerMapKeysAreSorted(t *testing.T)](#TestTextMarshalerMapKeysAreSorted)
    * [func TestNilMarshalerTextMapKey(t *testing.T)](#TestNilMarshalerTextMapKey)
    * [func TestMarshalFloat(t *testing.T)](#TestMarshalFloat)
    * [func TestMarshalRawMessageValue(t *testing.T)](#TestMarshalRawMessageValue)
    * [func TestMarshalPanic(t *testing.T)](#TestMarshalPanic)
    * [func TestMarshalUncommonFieldNames(t *testing.T)](#TestMarshalUncommonFieldNames)
    * [func TestMarshalerError(t *testing.T)](#TestMarshalerError)
    * [func TestFold(t *testing.T)](#TestFold)
    * [func TestFoldAgainstUnicode(t *testing.T)](#TestFoldAgainstUnicode)
    * [func isASCIILetter(b byte) bool](#isASCIILetter)
    * [func TestNumberIsValid(t *testing.T)](#TestNumberIsValid)
    * [func BenchmarkNumberIsValid(b *testing.B)](#BenchmarkNumberIsValid)
    * [func BenchmarkNumberIsValidRegexp(b *testing.B)](#BenchmarkNumberIsValidRegexp)
    * [func TestValid(t *testing.T)](#TestValid)
    * [func TestCompact(t *testing.T)](#TestCompact)
    * [func TestCompactSeparators(t *testing.T)](#TestCompactSeparators)
    * [func TestIndent(t *testing.T)](#TestIndent)
    * [func TestCompactBig(t *testing.T)](#TestCompactBig)
    * [func TestIndentBig(t *testing.T)](#TestIndentBig)
    * [func TestIndentErrors(t *testing.T)](#TestIndentErrors)
    * [func diff(t *testing.T, a, b []byte)](#diff)
    * [func trim(b []byte) []byte](#trim)
    * [func initBig()](#initBig)
    * [func genValue(n int) interface{}](#genValue)
    * [func genString(stddev float64) string](#genString)
    * [func genArray(n int) []interface{}](#genArray)
    * [func genMap(n int) map[string]interface{}](#genMap)
    * [func TestEncoder(t *testing.T)](#TestEncoder)
    * [func TestEncoderIndent(t *testing.T)](#TestEncoderIndent)
    * [func TestEncoderSetEscapeHTML(t *testing.T)](#TestEncoderSetEscapeHTML)
    * [func TestDecoder(t *testing.T)](#TestDecoder)
    * [func TestDecoderBuffered(t *testing.T)](#TestDecoderBuffered)
    * [func nlines(s string, n int) string](#nlines)
    * [func TestRawMessage(t *testing.T)](#TestRawMessage)
    * [func TestNullRawMessage(t *testing.T)](#TestNullRawMessage)
    * [func TestBlocking(t *testing.T)](#TestBlocking)
    * [func BenchmarkEncoderEncode(b *testing.B)](#BenchmarkEncoderEncode)
    * [func TestDecodeInStream(t *testing.T)](#TestDecodeInStream)
    * [func TestHTTPDecoding(t *testing.T)](#TestHTTPDecoding)
    * [func TestStructTagObjectKey(t *testing.T)](#TestStructTagObjectKey)
    * [func TestTagParsing(t *testing.T)](#TestTagParsing)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="phasePanicMsg" href="#phasePanicMsg">const phasePanicMsg</a>

```
searchKey: json.phasePanicMsg
```

```Go
const phasePanicMsg = "JSON decoder out of sync - data changing underfoot?"
```

phasePanicMsg is used as a panic message when we end up with something that shouldn't happen. It can indicate a bug in the JSON decoder, or that something is editing the data slice while the decoder executes. 

### <a id="startDetectingCyclesAfter" href="#startDetectingCyclesAfter">const startDetectingCyclesAfter</a>

```
searchKey: json.startDetectingCyclesAfter
```

```Go
const startDetectingCyclesAfter = 1000
```

### <a id="caseMask" href="#caseMask">const caseMask</a>

```
searchKey: json.caseMask
```

```Go
const caseMask = ^byte(0x20) // Mask to ignore case in ASCII.

```

### <a id="kelvin" href="#kelvin">const kelvin</a>

```
searchKey: json.kelvin
```

```Go
const kelvin = '\u212a'
```

### <a id="smallLongEss" href="#smallLongEss">const smallLongEss</a>

```
searchKey: json.smallLongEss
```

```Go
const smallLongEss = '\u017f'
```

### <a id="scanContinue" href="#scanContinue">const scanContinue</a>

```
searchKey: json.scanContinue
```

```Go
const scanContinue = iota // uninteresting byte

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

Continue. 

### <a id="scanBeginLiteral" href="#scanBeginLiteral">const scanBeginLiteral</a>

```
searchKey: json.scanBeginLiteral
```

```Go
const scanBeginLiteral // end implied by next result != scanContinue

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanBeginObject" href="#scanBeginObject">const scanBeginObject</a>

```
searchKey: json.scanBeginObject
```

```Go
const scanBeginObject // begin object

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanObjectKey" href="#scanObjectKey">const scanObjectKey</a>

```
searchKey: json.scanObjectKey
```

```Go
const scanObjectKey // just finished object key (string)

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanObjectValue" href="#scanObjectValue">const scanObjectValue</a>

```
searchKey: json.scanObjectValue
```

```Go
const scanObjectValue // just finished non-last object value

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanEndObject" href="#scanEndObject">const scanEndObject</a>

```
searchKey: json.scanEndObject
```

```Go
const scanEndObject // end object (implies scanObjectValue if possible)

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanBeginArray" href="#scanBeginArray">const scanBeginArray</a>

```
searchKey: json.scanBeginArray
```

```Go
const scanBeginArray // begin array

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanArrayValue" href="#scanArrayValue">const scanArrayValue</a>

```
searchKey: json.scanArrayValue
```

```Go
const scanArrayValue // just finished array value

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanEndArray" href="#scanEndArray">const scanEndArray</a>

```
searchKey: json.scanEndArray
```

```Go
const scanEndArray // end array (implies scanArrayValue if possible)

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanSkipSpace" href="#scanSkipSpace">const scanSkipSpace</a>

```
searchKey: json.scanSkipSpace
```

```Go
const scanSkipSpace // space byte; can skip; known to be last "continue" result

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="scanEnd" href="#scanEnd">const scanEnd</a>

```
searchKey: json.scanEnd
```

```Go
const scanEnd // top-level value ended *before* this byte; known to be first "stop" result

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

Stop. 

### <a id="scanError" href="#scanError">const scanError</a>

```
searchKey: json.scanError
```

```Go
const scanError // hit an error, scanner.err.

```

These values are returned by the state transition functions assigned to scanner.state and the method scanner.eof. They give details about the current state of the scan that callers might be interested to know about. It is okay to ignore the return value of any particular call to scanner.state: if one call returns scanError, every subsequent call will return scanError too. 

### <a id="parseObjectKey" href="#parseObjectKey">const parseObjectKey</a>

```
searchKey: json.parseObjectKey
```

```Go
const parseObjectKey = iota // parsing object key (before colon)

```

These values are stored in the parseState stack. They give the current state of a composite value being scanned. If the parser is inside a nested value the parseState describes the nested state, outermost at entry 0. 

### <a id="parseObjectValue" href="#parseObjectValue">const parseObjectValue</a>

```
searchKey: json.parseObjectValue
```

```Go
const parseObjectValue // parsing object value (after colon)

```

These values are stored in the parseState stack. They give the current state of a composite value being scanned. If the parser is inside a nested value the parseState describes the nested state, outermost at entry 0. 

### <a id="parseArrayValue" href="#parseArrayValue">const parseArrayValue</a>

```
searchKey: json.parseArrayValue
```

```Go
const parseArrayValue // parsing array value

```

These values are stored in the parseState stack. They give the current state of a composite value being scanned. If the parser is inside a nested value the parseState describes the nested state, outermost at entry 0. 

### <a id="maxNestingDepth" href="#maxNestingDepth">const maxNestingDepth</a>

```
searchKey: json.maxNestingDepth
```

```Go
const maxNestingDepth = 10000
```

This limits the max nesting depth to prevent stack overflow. This is permitted by [https://tools.ietf.org/html/rfc7159#section-9](https://tools.ietf.org/html/rfc7159#section-9) 

### <a id="tokenTopValue" href="#tokenTopValue">const tokenTopValue</a>

```
searchKey: json.tokenTopValue
```

```Go
const tokenTopValue = iota
```

### <a id="tokenArrayStart" href="#tokenArrayStart">const tokenArrayStart</a>

```
searchKey: json.tokenArrayStart
```

```Go
const tokenArrayStart
```

### <a id="tokenArrayValue" href="#tokenArrayValue">const tokenArrayValue</a>

```
searchKey: json.tokenArrayValue
```

```Go
const tokenArrayValue
```

### <a id="tokenArrayComma" href="#tokenArrayComma">const tokenArrayComma</a>

```
searchKey: json.tokenArrayComma
```

```Go
const tokenArrayComma
```

### <a id="tokenObjectStart" href="#tokenObjectStart">const tokenObjectStart</a>

```
searchKey: json.tokenObjectStart
```

```Go
const tokenObjectStart
```

### <a id="tokenObjectKey" href="#tokenObjectKey">const tokenObjectKey</a>

```
searchKey: json.tokenObjectKey
```

```Go
const tokenObjectKey
```

### <a id="tokenObjectColon" href="#tokenObjectColon">const tokenObjectColon</a>

```
searchKey: json.tokenObjectColon
```

```Go
const tokenObjectColon
```

### <a id="tokenObjectValue" href="#tokenObjectValue">const tokenObjectValue</a>

```
searchKey: json.tokenObjectValue
```

```Go
const tokenObjectValue
```

### <a id="tokenObjectComma" href="#tokenObjectComma">const tokenObjectComma</a>

```
searchKey: json.tokenObjectComma
```

```Go
const tokenObjectComma
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="nullLiteral" href="#nullLiteral">var nullLiteral</a>

```
searchKey: json.nullLiteral
```

```Go
var nullLiteral = []byte("null")
```

### <a id="textUnmarshalerType" href="#textUnmarshalerType">var textUnmarshalerType</a>

```
searchKey: json.textUnmarshalerType
```

```Go
var textUnmarshalerType = reflect.TypeOf((*encoding.TextUnmarshaler)(nil)).Elem()
```

### <a id="numberType" href="#numberType">var numberType</a>

```
searchKey: json.numberType
```

```Go
var numberType = reflect.TypeOf(Number(""))
```

### <a id="hex" href="#hex">var hex</a>

```
searchKey: json.hex
```

```Go
var hex = "0123456789abcdef"
```

### <a id="encodeStatePool" href="#encodeStatePool">var encodeStatePool</a>

```
searchKey: json.encodeStatePool
```

```Go
var encodeStatePool sync.Pool
```

### <a id="encoderCache" href="#encoderCache">var encoderCache</a>

```
searchKey: json.encoderCache
```

```Go
var encoderCache sync.Map // map[reflect.Type]encoderFunc

```

### <a id="marshalerType" href="#marshalerType">var marshalerType</a>

```
searchKey: json.marshalerType
```

```Go
var marshalerType = reflect.TypeOf((*Marshaler)(nil)).Elem()
```

### <a id="textMarshalerType" href="#textMarshalerType">var textMarshalerType</a>

```
searchKey: json.textMarshalerType
```

```Go
var textMarshalerType = reflect.TypeOf((*encoding.TextMarshaler)(nil)).Elem()
```

### <a id="float32Encoder" href="#float32Encoder">var float32Encoder</a>

```
searchKey: json.float32Encoder
```

```Go
var float32Encoder = (floatEncoder(32)).encode
```

### <a id="float64Encoder" href="#float64Encoder">var float64Encoder</a>

```
searchKey: json.float64Encoder
```

```Go
var float64Encoder = (floatEncoder(64)).encode
```

### <a id="fieldCache" href="#fieldCache">var fieldCache</a>

```
searchKey: json.fieldCache
```

```Go
var fieldCache sync.Map // map[reflect.Type]structFields

```

### <a id="scannerPool" href="#scannerPool">var scannerPool</a>

```
searchKey: json.scannerPool
```

```Go
var scannerPool = sync.Pool{
	New: func() interface{} {
		return &scanner{}
	},
}
```

### <a id="safeSet" href="#safeSet">var safeSet</a>

```
searchKey: json.safeSet
```

```Go
var safeSet = ...
```

safeSet holds the value true if the ASCII character with the given array position can be represented inside a JSON string without any further escaping. 

All values are true except for the ASCII control characters (0-31), the double quote ("), and the backslash character ("\"). 

### <a id="htmlSafeSet" href="#htmlSafeSet">var htmlSafeSet</a>

```
searchKey: json.htmlSafeSet
```

```Go
var htmlSafeSet = ...
```

htmlSafeSet holds the value true if the ASCII character with the given array position can be safely represented inside a JSON string, embedded inside of HTML <script> tags, without any additional escaping. 

All values are true except for the ASCII control characters (0-31), the double quote ("), the backslash character ("\"), HTML opening and closing tags ("<" and ">"), and the ampersand ("&"). 

### <a id="codeJSON" href="#codeJSON">var codeJSON</a>

```
searchKey: json.codeJSON
```

```Go
var codeJSON []byte
```

### <a id="codeStruct" href="#codeStruct">var codeStruct</a>

```
searchKey: json.codeStruct
```

```Go
var codeStruct codeResponse
```

### <a id="ifaceNumAsFloat64" href="#ifaceNumAsFloat64">var ifaceNumAsFloat64</a>

```
searchKey: json.ifaceNumAsFloat64
```

```Go
var ifaceNumAsFloat64 = ...
```

ifaceNumAsFloat64/ifaceNumAsNumber are used to test unmarshaling with and without UseNumber 

### <a id="ifaceNumAsNumber" href="#ifaceNumAsNumber">var ifaceNumAsNumber</a>

```
searchKey: json.ifaceNumAsNumber
```

```Go
var ifaceNumAsNumber = ...
```

### <a id="errMissingU8Prefix" href="#errMissingU8Prefix">var errMissingU8Prefix</a>

```
searchKey: json.errMissingU8Prefix
```

```Go
var errMissingU8Prefix = errors.New("missing 'u' prefix")
```

### <a id="umtrue" href="#umtrue">var umtrue</a>

```
searchKey: json.umtrue
```

```Go
var umtrue = unmarshaler{true}
```

### <a id="umslice" href="#umslice">var umslice</a>

```
searchKey: json.umslice
```

```Go
var umslice = []unmarshaler{{true}}
```

### <a id="umstruct" href="#umstruct">var umstruct</a>

```
searchKey: json.umstruct
```

```Go
var umstruct = ustruct{unmarshaler{true}}
```

### <a id="umtrueXY" href="#umtrueXY">var umtrueXY</a>

```
searchKey: json.umtrueXY
```

```Go
var umtrueXY = unmarshalerText{"x", "y"}
```

### <a id="umsliceXY" href="#umsliceXY">var umsliceXY</a>

```
searchKey: json.umsliceXY
```

```Go
var umsliceXY = []unmarshalerText{{"x", "y"}}
```

### <a id="umstructXY" href="#umstructXY">var umstructXY</a>

```
searchKey: json.umstructXY
```

```Go
var umstructXY = ustructText{unmarshalerText{"x", "y"}}
```

### <a id="ummapXY" href="#ummapXY">var ummapXY</a>

```
searchKey: json.ummapXY
```

```Go
var ummapXY = map[unmarshalerText]bool{{"x", "y"}: true}
```

### <a id="unmarshalTests" href="#unmarshalTests">var unmarshalTests</a>

```
searchKey: json.unmarshalTests
```

```Go
var unmarshalTests = ...
```

### <a id="badUTF8" href="#badUTF8">var badUTF8</a>

```
searchKey: json.badUTF8
```

```Go
var badUTF8 = ...
```

### <a id="numberTests" href="#numberTests">var numberTests</a>

```
searchKey: json.numberTests
```

```Go
var numberTests = ...
```

### <a id="wrongStringTests" href="#wrongStringTests">var wrongStringTests</a>

```
searchKey: json.wrongStringTests
```

```Go
var wrongStringTests = ...
```

### <a id="allValue" href="#allValue">var allValue</a>

```
searchKey: json.allValue
```

```Go
var allValue = ...
```

### <a id="pallValue" href="#pallValue">var pallValue</a>

```
searchKey: json.pallValue
```

```Go
var pallValue = ...
```

### <a id="allValueIndent" href="#allValueIndent">var allValueIndent</a>

```
searchKey: json.allValueIndent
```

```Go
var allValueIndent = ...
```

### <a id="allValueCompact" href="#allValueCompact">var allValueCompact</a>

```
searchKey: json.allValueCompact
```

```Go
var allValueCompact = strings.Map(noSpace, allValueIndent)
```

### <a id="pallValueIndent" href="#pallValueIndent">var pallValueIndent</a>

```
searchKey: json.pallValueIndent
```

```Go
var pallValueIndent = ...
```

### <a id="pallValueCompact" href="#pallValueCompact">var pallValueCompact</a>

```
searchKey: json.pallValueCompact
```

```Go
var pallValueCompact = strings.Map(noSpace, pallValueIndent)
```

### <a id="interfaceSetTests" href="#interfaceSetTests">var interfaceSetTests</a>

```
searchKey: json.interfaceSetTests
```

```Go
var interfaceSetTests = ...
```

### <a id="decodeTypeErrorTests" href="#decodeTypeErrorTests">var decodeTypeErrorTests</a>

```
searchKey: json.decodeTypeErrorTests
```

```Go
var decodeTypeErrorTests = ...
```

### <a id="unmarshalSyntaxTests" href="#unmarshalSyntaxTests">var unmarshalSyntaxTests</a>

```
searchKey: json.unmarshalSyntaxTests
```

```Go
var unmarshalSyntaxTests = ...
```

### <a id="invalidUnmarshalTests" href="#invalidUnmarshalTests">var invalidUnmarshalTests</a>

```
searchKey: json.invalidUnmarshalTests
```

```Go
var invalidUnmarshalTests = ...
```

### <a id="invalidUnmarshalTextTests" href="#invalidUnmarshalTextTests">var invalidUnmarshalTextTests</a>

```
searchKey: json.invalidUnmarshalTextTests
```

```Go
var invalidUnmarshalTextTests = ...
```

### <a id="optionalsExpected" href="#optionalsExpected">var optionalsExpected</a>

```
searchKey: json.optionalsExpected
```

```Go
var optionalsExpected = ...
```

### <a id="samePointerNoCycle" href="#samePointerNoCycle">var samePointerNoCycle</a>

```
searchKey: json.samePointerNoCycle
```

```Go
var samePointerNoCycle = &SamePointerNoCycle{}
```

### <a id="pointerCycle" href="#pointerCycle">var pointerCycle</a>

```
searchKey: json.pointerCycle
```

```Go
var pointerCycle = &PointerCycle{}
```

### <a id="pointerCycleIndirect" href="#pointerCycleIndirect">var pointerCycleIndirect</a>

```
searchKey: json.pointerCycleIndirect
```

```Go
var pointerCycleIndirect = &PointerCycleIndirect{}
```

### <a id="mapCycle" href="#mapCycle">var mapCycle</a>

```
searchKey: json.mapCycle
```

```Go
var mapCycle = make(map[string]interface{})
```

### <a id="sliceCycle" href="#sliceCycle">var sliceCycle</a>

```
searchKey: json.sliceCycle
```

```Go
var sliceCycle = []interface{}{nil}
```

### <a id="sliceNoCycle" href="#sliceNoCycle">var sliceNoCycle</a>

```
searchKey: json.sliceNoCycle
```

```Go
var sliceNoCycle = []interface{}{nil, nil}
```

### <a id="recursiveSliceCycle" href="#recursiveSliceCycle">var recursiveSliceCycle</a>

```
searchKey: json.recursiveSliceCycle
```

```Go
var recursiveSliceCycle = []RecursiveSlice{nil}
```

### <a id="unsupportedValues" href="#unsupportedValues">var unsupportedValues</a>

```
searchKey: json.unsupportedValues
```

```Go
var unsupportedValues = ...
```

### <a id="encodeStringTests" href="#encodeStringTests">var encodeStringTests</a>

```
searchKey: json.encodeStringTests
```

```Go
var encodeStringTests = ...
```

### <a id="re" href="#re">var re</a>

```
searchKey: json.re
```

```Go
var re = regexp.MustCompile
```

### <a id="badFloatREs" href="#badFloatREs">var badFloatREs</a>

```
searchKey: json.badFloatREs
```

```Go
var badFloatREs = ...
```

syntactic checks on form of marshaled floating point numbers. 

### <a id="foldTests" href="#foldTests">var foldTests</a>

```
searchKey: json.foldTests
```

```Go
var foldTests = ...
```

### <a id="validTests" href="#validTests">var validTests</a>

```
searchKey: json.validTests
```

```Go
var validTests = ...
```

### <a id="examples" href="#examples">var examples</a>

```
searchKey: json.examples
```

```Go
var examples = ...
```

### <a id="ex1" href="#ex1">var ex1</a>

```
searchKey: json.ex1
```

```Go
var ex1 = `[true,false,null,"x",1,1.5,0,-5e+2]`
```

### <a id="ex1i" href="#ex1i">var ex1i</a>

```
searchKey: json.ex1i
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

### <a id="indentErrorTests" href="#indentErrorTests">var indentErrorTests</a>

```
searchKey: json.indentErrorTests
```

```Go
var indentErrorTests = ...
```

### <a id="jsonBig" href="#jsonBig">var jsonBig</a>

```
searchKey: json.jsonBig
```

```Go
var jsonBig []byte
```

### <a id="streamTest" href="#streamTest">var streamTest</a>

```
searchKey: json.streamTest
```

```Go
var streamTest = ...
```

Test values for the stream test. One of each JSON kind. 

### <a id="streamEncoded" href="#streamEncoded">var streamEncoded</a>

```
searchKey: json.streamEncoded
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
```

```Go
var streamEncodedIndent = ...
```

### <a id="blockingTests" href="#blockingTests">var blockingTests</a>

```
searchKey: json.blockingTests
```

```Go
var blockingTests = []string{
	`{"x": 1}`,
	`[1, 2, 3]`,
}
```

### <a id="tokenStreamCases" href="#tokenStreamCases">var tokenStreamCases</a>

```
searchKey: json.tokenStreamCases
```

```Go
var tokenStreamCases = ...
```

### <a id="structTagObjectKeyTests" href="#structTagObjectKeyTests">var structTagObjectKeyTests</a>

```
searchKey: json.structTagObjectKeyTests
```

```Go
var structTagObjectKeyTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Unmarshaler" href="#Unmarshaler">type Unmarshaler interface</a>

```
searchKey: json.Unmarshaler
tags: [exported]
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
```

```Go
func indirect(v reflect.Value, decodingNull bool) (Unmarshaler, encoding.TextUnmarshaler, reflect.Value)
```

indirect walks down v allocating pointers as needed, until it gets to a non-pointer. If it encounters an Unmarshaler, indirect stops and returns that. If decodingNull is true, indirect stops at the first settable pointer so it can be set to nil. 

### <a id="UnmarshalTypeError" href="#UnmarshalTypeError">type UnmarshalTypeError struct</a>

```
searchKey: json.UnmarshalTypeError
tags: [exported]
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
tags: [exported]
```

```Go
func (e *UnmarshalTypeError) Error() string
```

### <a id="UnmarshalFieldError" href="#UnmarshalFieldError">type UnmarshalFieldError struct</a>

```
searchKey: json.UnmarshalFieldError
tags: [exported]
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
tags: [exported]
```

```Go
func (e *UnmarshalFieldError) Error() string
```

### <a id="InvalidUnmarshalError" href="#InvalidUnmarshalError">type InvalidUnmarshalError struct</a>

```
searchKey: json.InvalidUnmarshalError
tags: [exported]
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
tags: [exported]
```

```Go
func (e *InvalidUnmarshalError) Error() string
```

### <a id="Number" href="#Number">type Number string</a>

```
searchKey: json.Number
tags: [exported]
```

```Go
type Number string
```

A Number represents a JSON number literal. 

#### <a id="Number.String" href="#Number.String">func (n Number) String() string</a>

```
searchKey: json.Number.String
tags: [exported]
```

```Go
func (n Number) String() string
```

String returns the literal text of the number. 

#### <a id="Number.Float64" href="#Number.Float64">func (n Number) Float64() (float64, error)</a>

```
searchKey: json.Number.Float64
tags: [exported]
```

```Go
func (n Number) Float64() (float64, error)
```

Float64 returns the number as a float64. 

#### <a id="Number.Int64" href="#Number.Int64">func (n Number) Int64() (int64, error)</a>

```
searchKey: json.Number.Int64
tags: [exported]
```

```Go
func (n Number) Int64() (int64, error)
```

Int64 returns the number as an int64. 

### <a id="errorContext" href="#errorContext">type errorContext struct</a>

```
searchKey: json.errorContext
```

```Go
type errorContext struct {
	Struct     reflect.Type
	FieldStack []string
}
```

An errorContext provides context for type errors during decoding. 

### <a id="decodeState" href="#decodeState">type decodeState struct</a>

```
searchKey: json.decodeState
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

#### <a id="decodeState.unmarshal" href="#decodeState.unmarshal">func (d *decodeState) unmarshal(v interface{}) error</a>

```
searchKey: json.decodeState.unmarshal
```

```Go
func (d *decodeState) unmarshal(v interface{}) error
```

#### <a id="decodeState.readIndex" href="#decodeState.readIndex">func (d *decodeState) readIndex() int</a>

```
searchKey: json.decodeState.readIndex
```

```Go
func (d *decodeState) readIndex() int
```

readIndex returns the position of the last byte read. 

#### <a id="decodeState.init" href="#decodeState.init">func (d *decodeState) init(data []byte) *decodeState</a>

```
searchKey: json.decodeState.init
```

```Go
func (d *decodeState) init(data []byte) *decodeState
```

#### <a id="decodeState.saveError" href="#decodeState.saveError">func (d *decodeState) saveError(err error)</a>

```
searchKey: json.decodeState.saveError
```

```Go
func (d *decodeState) saveError(err error)
```

saveError saves the first err it is called with, for reporting at the end of the unmarshal. 

#### <a id="decodeState.addErrorContext" href="#decodeState.addErrorContext">func (d *decodeState) addErrorContext(err error) error</a>

```
searchKey: json.decodeState.addErrorContext
```

```Go
func (d *decodeState) addErrorContext(err error) error
```

addErrorContext returns a new error enhanced with information from d.errorContext 

#### <a id="decodeState.skip" href="#decodeState.skip">func (d *decodeState) skip()</a>

```
searchKey: json.decodeState.skip
```

```Go
func (d *decodeState) skip()
```

skip scans to the end of what was started. 

#### <a id="decodeState.scanNext" href="#decodeState.scanNext">func (d *decodeState) scanNext()</a>

```
searchKey: json.decodeState.scanNext
```

```Go
func (d *decodeState) scanNext()
```

scanNext processes the byte at d.data[d.off]. 

#### <a id="decodeState.scanWhile" href="#decodeState.scanWhile">func (d *decodeState) scanWhile(op int)</a>

```
searchKey: json.decodeState.scanWhile
```

```Go
func (d *decodeState) scanWhile(op int)
```

scanWhile processes bytes in d.data[d.off:] until it receives a scan code not equal to op. 

#### <a id="decodeState.rescanLiteral" href="#decodeState.rescanLiteral">func (d *decodeState) rescanLiteral()</a>

```
searchKey: json.decodeState.rescanLiteral
```

```Go
func (d *decodeState) rescanLiteral()
```

rescanLiteral is similar to scanWhile(scanContinue), but it specialises the common case where we're decoding a literal. The decoder scans the input twice, once for syntax errors and to check the length of the value, and the second to perform the decoding. 

Only in the second step do we use decodeState to tokenize literals, so we know there aren't any syntax errors. We can take advantage of that knowledge, and scan a literal's bytes much more quickly. 

#### <a id="decodeState.value" href="#decodeState.value">func (d *decodeState) value(v reflect.Value) error</a>

```
searchKey: json.decodeState.value
```

```Go
func (d *decodeState) value(v reflect.Value) error
```

value consumes a JSON value from d.data[d.off-1:], decoding into v, and reads the following byte ahead. If v is invalid, the value is discarded. The first byte of the value has been read already. 

#### <a id="decodeState.valueQuoted" href="#decodeState.valueQuoted">func (d *decodeState) valueQuoted() interface{}</a>

```
searchKey: json.decodeState.valueQuoted
```

```Go
func (d *decodeState) valueQuoted() interface{}
```

valueQuoted is like value but decodes a quoted string literal or literal null into an interface value. If it finds anything other than a quoted string literal or null, valueQuoted returns unquotedValue{}. 

#### <a id="decodeState.array" href="#decodeState.array">func (d *decodeState) array(v reflect.Value) error</a>

```
searchKey: json.decodeState.array
```

```Go
func (d *decodeState) array(v reflect.Value) error
```

array consumes an array from d.data[d.off-1:], decoding into v. The first byte of the array ('[') has been read already. 

#### <a id="decodeState.object" href="#decodeState.object">func (d *decodeState) object(v reflect.Value) error</a>

```
searchKey: json.decodeState.object
```

```Go
func (d *decodeState) object(v reflect.Value) error
```

object consumes an object from d.data[d.off-1:], decoding into v. The first byte ('{') of the object has been read already. 

#### <a id="decodeState.convertNumber" href="#decodeState.convertNumber">func (d *decodeState) convertNumber(s string) (interface{}, error)</a>

```
searchKey: json.decodeState.convertNumber
```

```Go
func (d *decodeState) convertNumber(s string) (interface{}, error)
```

convertNumber converts the number literal s to a float64 or a Number depending on the setting of d.useNumber. 

#### <a id="decodeState.literalStore" href="#decodeState.literalStore">func (d *decodeState) literalStore(item []byte, v reflect.Value, fromQuoted bool) error</a>

```
searchKey: json.decodeState.literalStore
```

```Go
func (d *decodeState) literalStore(item []byte, v reflect.Value, fromQuoted bool) error
```

literalStore decodes a literal stored in item into v. 

fromQuoted indicates whether this literal came from unwrapping a string from the ",string" struct tag option. this is used only to produce more helpful error messages. 

#### <a id="decodeState.valueInterface" href="#decodeState.valueInterface">func (d *decodeState) valueInterface() (val interface{})</a>

```
searchKey: json.decodeState.valueInterface
```

```Go
func (d *decodeState) valueInterface() (val interface{})
```

valueInterface is like value but returns interface{} 

#### <a id="decodeState.arrayInterface" href="#decodeState.arrayInterface">func (d *decodeState) arrayInterface() []interface{}</a>

```
searchKey: json.decodeState.arrayInterface
```

```Go
func (d *decodeState) arrayInterface() []interface{}
```

arrayInterface is like array but returns []interface{}. 

#### <a id="decodeState.objectInterface" href="#decodeState.objectInterface">func (d *decodeState) objectInterface() map[string]interface{}</a>

```
searchKey: json.decodeState.objectInterface
```

```Go
func (d *decodeState) objectInterface() map[string]interface{}
```

objectInterface is like object but returns map[string]interface{}. 

#### <a id="decodeState.literalInterface" href="#decodeState.literalInterface">func (d *decodeState) literalInterface() interface{}</a>

```
searchKey: json.decodeState.literalInterface
```

```Go
func (d *decodeState) literalInterface() interface{}
```

literalInterface consumes and returns a literal from d.data[d.off-1:] and it reads the following byte ahead. The first byte of the literal has been read already (that's how the caller knows it's a literal). 

### <a id="unquotedValue" href="#unquotedValue">type unquotedValue struct{}</a>

```
searchKey: json.unquotedValue
```

```Go
type unquotedValue struct{}
```

### <a id="Marshaler" href="#Marshaler">type Marshaler interface</a>

```
searchKey: json.Marshaler
tags: [exported]
```

```Go
type Marshaler interface {
	MarshalJSON() ([]byte, error)
}
```

Marshaler is the interface implemented by types that can marshal themselves into valid JSON. 

### <a id="UnsupportedTypeError" href="#UnsupportedTypeError">type UnsupportedTypeError struct</a>

```
searchKey: json.UnsupportedTypeError
tags: [exported]
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
tags: [exported]
```

```Go
func (e *UnsupportedTypeError) Error() string
```

### <a id="UnsupportedValueError" href="#UnsupportedValueError">type UnsupportedValueError struct</a>

```
searchKey: json.UnsupportedValueError
tags: [exported]
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
tags: [exported]
```

```Go
func (e *UnsupportedValueError) Error() string
```

### <a id="InvalidUTF8Error" href="#InvalidUTF8Error">type InvalidUTF8Error struct</a>

```
searchKey: json.InvalidUTF8Error
tags: [exported]
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
tags: [exported]
```

```Go
func (e *InvalidUTF8Error) Error() string
```

### <a id="MarshalerError" href="#MarshalerError">type MarshalerError struct</a>

```
searchKey: json.MarshalerError
tags: [exported]
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
tags: [exported]
```

```Go
func (e *MarshalerError) Error() string
```

#### <a id="MarshalerError.Unwrap" href="#MarshalerError.Unwrap">func (e *MarshalerError) Unwrap() error</a>

```
searchKey: json.MarshalerError.Unwrap
tags: [exported]
```

```Go
func (e *MarshalerError) Unwrap() error
```

Unwrap returns the underlying error. 

### <a id="encodeState" href="#encodeState">type encodeState struct</a>

```
searchKey: json.encodeState
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
```

```Go
func newEncodeState() *encodeState
```

#### <a id="encodeState.marshal" href="#encodeState.marshal">func (e *encodeState) marshal(v interface{}, opts encOpts) (err error)</a>

```
searchKey: json.encodeState.marshal
```

```Go
func (e *encodeState) marshal(v interface{}, opts encOpts) (err error)
```

#### <a id="encodeState.error" href="#encodeState.error">func (e *encodeState) error(err error)</a>

```
searchKey: json.encodeState.error
```

```Go
func (e *encodeState) error(err error)
```

error aborts the encoding by panicking with err wrapped in jsonError. 

#### <a id="encodeState.reflectValue" href="#encodeState.reflectValue">func (e *encodeState) reflectValue(v reflect.Value, opts encOpts)</a>

```
searchKey: json.encodeState.reflectValue
```

```Go
func (e *encodeState) reflectValue(v reflect.Value, opts encOpts)
```

#### <a id="encodeState.string" href="#encodeState.string">func (e *encodeState) string(s string, escapeHTML bool)</a>

```
searchKey: json.encodeState.string
```

```Go
func (e *encodeState) string(s string, escapeHTML bool)
```

NOTE: keep in sync with stringBytes below. 

#### <a id="encodeState.stringBytes" href="#encodeState.stringBytes">func (e *encodeState) stringBytes(s []byte, escapeHTML bool)</a>

```
searchKey: json.encodeState.stringBytes
```

```Go
func (e *encodeState) stringBytes(s []byte, escapeHTML bool)
```

NOTE: keep in sync with string above. 

### <a id="jsonError" href="#jsonError">type jsonError struct</a>

```
searchKey: json.jsonError
```

```Go
type jsonError struct{ error }
```

jsonError is an error wrapper type for internal use only. Panics with errors are wrapped in jsonError so that the top-level recover can distinguish intentional panics from this package. 

### <a id="encOpts" href="#encOpts">type encOpts struct</a>

```
searchKey: json.encOpts
```

```Go
type encOpts struct {
	// quoted causes primitive fields to be encoded inside JSON strings.
	quoted bool
	// escapeHTML causes '<', '>', and '&' to be escaped in JSON strings.
	escapeHTML bool
}
```

### <a id="encoderFunc" href="#encoderFunc">type encoderFunc func(e *std/encoding/json.encodeState, v reflect.Value, opts std/encoding/json.encOpts)</a>

```
searchKey: json.encoderFunc
```

```Go
type encoderFunc func(e *encodeState, v reflect.Value, opts encOpts)
```

#### <a id="valueEncoder" href="#valueEncoder">func valueEncoder(v reflect.Value) encoderFunc</a>

```
searchKey: json.valueEncoder
```

```Go
func valueEncoder(v reflect.Value) encoderFunc
```

#### <a id="typeEncoder" href="#typeEncoder">func typeEncoder(t reflect.Type) encoderFunc</a>

```
searchKey: json.typeEncoder
```

```Go
func typeEncoder(t reflect.Type) encoderFunc
```

#### <a id="newTypeEncoder" href="#newTypeEncoder">func newTypeEncoder(t reflect.Type, allowAddr bool) encoderFunc</a>

```
searchKey: json.newTypeEncoder
```

```Go
func newTypeEncoder(t reflect.Type, allowAddr bool) encoderFunc
```

newTypeEncoder constructs an encoderFunc for a type. The returned encoder only checks CanAddr when allowAddr is true. 

#### <a id="newStructEncoder" href="#newStructEncoder">func newStructEncoder(t reflect.Type) encoderFunc</a>

```
searchKey: json.newStructEncoder
```

```Go
func newStructEncoder(t reflect.Type) encoderFunc
```

#### <a id="newMapEncoder" href="#newMapEncoder">func newMapEncoder(t reflect.Type) encoderFunc</a>

```
searchKey: json.newMapEncoder
```

```Go
func newMapEncoder(t reflect.Type) encoderFunc
```

#### <a id="newSliceEncoder" href="#newSliceEncoder">func newSliceEncoder(t reflect.Type) encoderFunc</a>

```
searchKey: json.newSliceEncoder
```

```Go
func newSliceEncoder(t reflect.Type) encoderFunc
```

#### <a id="newArrayEncoder" href="#newArrayEncoder">func newArrayEncoder(t reflect.Type) encoderFunc</a>

```
searchKey: json.newArrayEncoder
```

```Go
func newArrayEncoder(t reflect.Type) encoderFunc
```

#### <a id="newPtrEncoder" href="#newPtrEncoder">func newPtrEncoder(t reflect.Type) encoderFunc</a>

```
searchKey: json.newPtrEncoder
```

```Go
func newPtrEncoder(t reflect.Type) encoderFunc
```

#### <a id="newCondAddrEncoder" href="#newCondAddrEncoder">func newCondAddrEncoder(canAddrEnc, elseEnc encoderFunc) encoderFunc</a>

```
searchKey: json.newCondAddrEncoder
```

```Go
func newCondAddrEncoder(canAddrEnc, elseEnc encoderFunc) encoderFunc
```

newCondAddrEncoder returns an encoder that checks whether its value CanAddr and delegates to canAddrEnc if so, else to elseEnc. 

### <a id="floatEncoder" href="#floatEncoder">type floatEncoder int</a>

```
searchKey: json.floatEncoder
```

```Go
type floatEncoder int // number of bits

```

#### <a id="floatEncoder.encode" href="#floatEncoder.encode">func (bits floatEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.floatEncoder.encode
```

```Go
func (bits floatEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="structEncoder" href="#structEncoder">type structEncoder struct</a>

```
searchKey: json.structEncoder
```

```Go
type structEncoder struct {
	fields structFields
}
```

#### <a id="structEncoder.encode" href="#structEncoder.encode">func (se structEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.structEncoder.encode
```

```Go
func (se structEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="structFields" href="#structFields">type structFields struct</a>

```
searchKey: json.structFields
```

```Go
type structFields struct {
	list      []field
	nameIndex map[string]int
}
```

#### <a id="typeFields" href="#typeFields">func typeFields(t reflect.Type) structFields</a>

```
searchKey: json.typeFields
```

```Go
func typeFields(t reflect.Type) structFields
```

typeFields returns a list of fields that JSON should recognize for the given type. The algorithm is breadth-first search over the set of structs to include - the top struct and then any reachable anonymous structs. 

#### <a id="cachedTypeFields" href="#cachedTypeFields">func cachedTypeFields(t reflect.Type) structFields</a>

```
searchKey: json.cachedTypeFields
```

```Go
func cachedTypeFields(t reflect.Type) structFields
```

cachedTypeFields is like typeFields but uses a cache to avoid repeated work. 

### <a id="mapEncoder" href="#mapEncoder">type mapEncoder struct</a>

```
searchKey: json.mapEncoder
```

```Go
type mapEncoder struct {
	elemEnc encoderFunc
}
```

#### <a id="mapEncoder.encode" href="#mapEncoder.encode">func (me mapEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.mapEncoder.encode
```

```Go
func (me mapEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="sliceEncoder" href="#sliceEncoder">type sliceEncoder struct</a>

```
searchKey: json.sliceEncoder
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
```

```Go
func (se sliceEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="arrayEncoder" href="#arrayEncoder">type arrayEncoder struct</a>

```
searchKey: json.arrayEncoder
```

```Go
type arrayEncoder struct {
	elemEnc encoderFunc
}
```

#### <a id="arrayEncoder.encode" href="#arrayEncoder.encode">func (ae arrayEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.arrayEncoder.encode
```

```Go
func (ae arrayEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="ptrEncoder" href="#ptrEncoder">type ptrEncoder struct</a>

```
searchKey: json.ptrEncoder
```

```Go
type ptrEncoder struct {
	elemEnc encoderFunc
}
```

#### <a id="ptrEncoder.encode" href="#ptrEncoder.encode">func (pe ptrEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.ptrEncoder.encode
```

```Go
func (pe ptrEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="condAddrEncoder" href="#condAddrEncoder">type condAddrEncoder struct</a>

```
searchKey: json.condAddrEncoder
```

```Go
type condAddrEncoder struct {
	canAddrEnc, elseEnc encoderFunc
}
```

#### <a id="condAddrEncoder.encode" href="#condAddrEncoder.encode">func (ce condAddrEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.condAddrEncoder.encode
```

```Go
func (ce condAddrEncoder) encode(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="reflectWithString" href="#reflectWithString">type reflectWithString struct</a>

```
searchKey: json.reflectWithString
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
```

```Go
func (w *reflectWithString) resolve() error
```

### <a id="field" href="#field">type field struct</a>

```
searchKey: json.field
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
```

```Go
func dominantField(fields []field) (field, bool)
```

dominantField looks through the fields, all of which are known to have the same name, to find the single field that dominates the others using Go's embedding rules, modified by the presence of JSON tags. If there are multiple top-level fields, the boolean will be false: This condition is an error in Go and we skip all the fields. 

### <a id="byIndex" href="#byIndex">type byIndex []json.field</a>

```
searchKey: json.byIndex
```

```Go
type byIndex []field
```

byIndex sorts field by index sequence. 

#### <a id="byIndex.Len" href="#byIndex.Len">func (x byIndex) Len() int</a>

```
searchKey: json.byIndex.Len
```

```Go
func (x byIndex) Len() int
```

#### <a id="byIndex.Swap" href="#byIndex.Swap">func (x byIndex) Swap(i, j int)</a>

```
searchKey: json.byIndex.Swap
```

```Go
func (x byIndex) Swap(i, j int)
```

#### <a id="byIndex.Less" href="#byIndex.Less">func (x byIndex) Less(i, j int) bool</a>

```
searchKey: json.byIndex.Less
```

```Go
func (x byIndex) Less(i, j int) bool
```

### <a id="SyntaxError" href="#SyntaxError">type SyntaxError struct</a>

```
searchKey: json.SyntaxError
tags: [exported]
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
tags: [exported]
```

```Go
func (e *SyntaxError) Error() string
```

### <a id="scanner" href="#scanner">type scanner struct</a>

```
searchKey: json.scanner
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
```

```Go
func newScanner() *scanner
```

#### <a id="scanner.reset" href="#scanner.reset">func (s *scanner) reset()</a>

```
searchKey: json.scanner.reset
```

```Go
func (s *scanner) reset()
```

reset prepares the scanner for use. It must be called before calling s.step. 

#### <a id="scanner.eof" href="#scanner.eof">func (s *scanner) eof() int</a>

```
searchKey: json.scanner.eof
```

```Go
func (s *scanner) eof() int
```

eof tells the scanner that the end of input has been reached. It returns a scan status just as s.step does. 

#### <a id="scanner.pushParseState" href="#scanner.pushParseState">func (s *scanner) pushParseState(c byte, newParseState int, successState int) int</a>

```
searchKey: json.scanner.pushParseState
```

```Go
func (s *scanner) pushParseState(c byte, newParseState int, successState int) int
```

pushParseState pushes a new parse state p onto the parse stack. an error state is returned if maxNestingDepth was exceeded, otherwise successState is returned. 

#### <a id="scanner.popParseState" href="#scanner.popParseState">func (s *scanner) popParseState()</a>

```
searchKey: json.scanner.popParseState
```

```Go
func (s *scanner) popParseState()
```

popParseState pops a parse state (already obtained) off the stack and updates s.step accordingly. 

#### <a id="scanner.error" href="#scanner.error">func (s *scanner) error(c byte, context string) int</a>

```
searchKey: json.scanner.error
```

```Go
func (s *scanner) error(c byte, context string) int
```

error records an error and switches to the error state. 

### <a id="Decoder" href="#Decoder">type Decoder struct</a>

```
searchKey: json.Decoder
tags: [exported]
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
tags: [exported]
```

```Go
func NewDecoder(r io.Reader) *Decoder
```

NewDecoder returns a new decoder that reads from r. 

The decoder introduces its own buffering and may read data from r beyond the JSON values requested. 

#### <a id="Decoder.UseNumber" href="#Decoder.UseNumber">func (dec *Decoder) UseNumber()</a>

```
searchKey: json.Decoder.UseNumber
tags: [exported]
```

```Go
func (dec *Decoder) UseNumber()
```

UseNumber causes the Decoder to unmarshal a number into an interface{} as a Number instead of as a float64. 

#### <a id="Decoder.DisallowUnknownFields" href="#Decoder.DisallowUnknownFields">func (dec *Decoder) DisallowUnknownFields()</a>

```
searchKey: json.Decoder.DisallowUnknownFields
tags: [exported]
```

```Go
func (dec *Decoder) DisallowUnknownFields()
```

DisallowUnknownFields causes the Decoder to return an error when the destination is a struct and the input contains object keys which do not match any non-ignored, exported fields in the destination. 

#### <a id="Decoder.Decode" href="#Decoder.Decode">func (dec *Decoder) Decode(v interface{}) error</a>

```
searchKey: json.Decoder.Decode
tags: [exported]
```

```Go
func (dec *Decoder) Decode(v interface{}) error
```

Decode reads the next JSON-encoded value from its input and stores it in the value pointed to by v. 

See the documentation for Unmarshal for details about the conversion of JSON into a Go value. 

#### <a id="Decoder.Buffered" href="#Decoder.Buffered">func (dec *Decoder) Buffered() io.Reader</a>

```
searchKey: json.Decoder.Buffered
tags: [exported]
```

```Go
func (dec *Decoder) Buffered() io.Reader
```

Buffered returns a reader of the data remaining in the Decoder's buffer. The reader is valid until the next call to Decode. 

#### <a id="Decoder.readValue" href="#Decoder.readValue">func (dec *Decoder) readValue() (int, error)</a>

```
searchKey: json.Decoder.readValue
```

```Go
func (dec *Decoder) readValue() (int, error)
```

readValue reads a JSON value into dec.buf. It returns the length of the encoding. 

#### <a id="Decoder.refill" href="#Decoder.refill">func (dec *Decoder) refill() error</a>

```
searchKey: json.Decoder.refill
```

```Go
func (dec *Decoder) refill() error
```

#### <a id="Decoder.tokenPrepareForDecode" href="#Decoder.tokenPrepareForDecode">func (dec *Decoder) tokenPrepareForDecode() error</a>

```
searchKey: json.Decoder.tokenPrepareForDecode
```

```Go
func (dec *Decoder) tokenPrepareForDecode() error
```

advance tokenstate from a separator state to a value state 

#### <a id="Decoder.tokenValueAllowed" href="#Decoder.tokenValueAllowed">func (dec *Decoder) tokenValueAllowed() bool</a>

```
searchKey: json.Decoder.tokenValueAllowed
```

```Go
func (dec *Decoder) tokenValueAllowed() bool
```

#### <a id="Decoder.tokenValueEnd" href="#Decoder.tokenValueEnd">func (dec *Decoder) tokenValueEnd()</a>

```
searchKey: json.Decoder.tokenValueEnd
```

```Go
func (dec *Decoder) tokenValueEnd()
```

#### <a id="Decoder.Token" href="#Decoder.Token">func (dec *Decoder) Token() (Token, error)</a>

```
searchKey: json.Decoder.Token
tags: [exported]
```

```Go
func (dec *Decoder) Token() (Token, error)
```

Token returns the next JSON token in the input stream. At the end of the input stream, Token returns nil, io.EOF. 

Token guarantees that the delimiters [ ] { } it returns are properly nested and matched: if Token encounters an unexpected delimiter in the input, it will return an error. 

The input stream consists of basic JSON values—bool, string, number, and null—along with delimiters [ ] { } of type Delim to mark the start and end of arrays and objects. Commas and colons are elided. 

#### <a id="Decoder.tokenError" href="#Decoder.tokenError">func (dec *Decoder) tokenError(c byte) (Token, error)</a>

```
searchKey: json.Decoder.tokenError
```

```Go
func (dec *Decoder) tokenError(c byte) (Token, error)
```

#### <a id="Decoder.More" href="#Decoder.More">func (dec *Decoder) More() bool</a>

```
searchKey: json.Decoder.More
tags: [exported]
```

```Go
func (dec *Decoder) More() bool
```

More reports whether there is another element in the current array or object being parsed. 

#### <a id="Decoder.peek" href="#Decoder.peek">func (dec *Decoder) peek() (byte, error)</a>

```
searchKey: json.Decoder.peek
```

```Go
func (dec *Decoder) peek() (byte, error)
```

#### <a id="Decoder.InputOffset" href="#Decoder.InputOffset">func (dec *Decoder) InputOffset() int64</a>

```
searchKey: json.Decoder.InputOffset
tags: [exported]
```

```Go
func (dec *Decoder) InputOffset() int64
```

InputOffset returns the input stream byte offset of the current decoder position. The offset gives the location of the end of the most recently returned token and the beginning of the next token. 

### <a id="Encoder" href="#Encoder">type Encoder struct</a>

```
searchKey: json.Encoder
tags: [exported]
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
tags: [exported]
```

```Go
func NewEncoder(w io.Writer) *Encoder
```

NewEncoder returns a new encoder that writes to w. 

#### <a id="Encoder.Encode" href="#Encoder.Encode">func (enc *Encoder) Encode(v interface{}) error</a>

```
searchKey: json.Encoder.Encode
tags: [exported]
```

```Go
func (enc *Encoder) Encode(v interface{}) error
```

Encode writes the JSON encoding of v to the stream, followed by a newline character. 

See the documentation for Marshal for details about the conversion of Go values to JSON. 

#### <a id="Encoder.SetIndent" href="#Encoder.SetIndent">func (enc *Encoder) SetIndent(prefix, indent string)</a>

```
searchKey: json.Encoder.SetIndent
tags: [exported]
```

```Go
func (enc *Encoder) SetIndent(prefix, indent string)
```

SetIndent instructs the encoder to format each subsequent encoded value as if indented by the package-level function Indent(dst, src, prefix, indent). Calling SetIndent("", "") disables indentation. 

#### <a id="Encoder.SetEscapeHTML" href="#Encoder.SetEscapeHTML">func (enc *Encoder) SetEscapeHTML(on bool)</a>

```
searchKey: json.Encoder.SetEscapeHTML
tags: [exported]
```

```Go
func (enc *Encoder) SetEscapeHTML(on bool)
```

SetEscapeHTML specifies whether problematic HTML characters should be escaped inside JSON quoted strings. The default behavior is to escape &, <, and > to \u0026, \u003c, and \u003e to avoid certain safety problems that can arise when embedding JSON in HTML. 

In non-HTML settings where the escaping interferes with the readability of the output, SetEscapeHTML(false) disables this behavior. 

### <a id="RawMessage" href="#RawMessage">type RawMessage []byte</a>

```
searchKey: json.RawMessage
tags: [exported]
```

```Go
type RawMessage []byte
```

RawMessage is a raw encoded JSON value. It implements Marshaler and Unmarshaler and can be used to delay JSON decoding or precompute a JSON encoding. 

#### <a id="RawMessage.MarshalJSON" href="#RawMessage.MarshalJSON">func (m RawMessage) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.RawMessage.MarshalJSON
tags: [exported]
```

```Go
func (m RawMessage) MarshalJSON() ([]byte, error)
```

MarshalJSON returns m as the JSON encoding of m. 

#### <a id="RawMessage.UnmarshalJSON" href="#RawMessage.UnmarshalJSON">func (m *RawMessage) UnmarshalJSON(data []byte) error</a>

```
searchKey: json.RawMessage.UnmarshalJSON
tags: [exported]
```

```Go
func (m *RawMessage) UnmarshalJSON(data []byte) error
```

UnmarshalJSON sets *m to a copy of data. 

### <a id="Token" href="#Token">type Token interface{}</a>

```
searchKey: json.Token
tags: [exported]
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
### <a id="Delim" href="#Delim">type Delim rune</a>

```
searchKey: json.Delim
tags: [exported]
```

```Go
type Delim rune
```

A Delim is a JSON array or object delimiter, one of [ ] { or }. 

#### <a id="Delim.String" href="#Delim.String">func (d Delim) String() string</a>

```
searchKey: json.Delim.String
tags: [exported]
```

```Go
func (d Delim) String() string
```

### <a id="tagOptions" href="#tagOptions">type tagOptions string</a>

```
searchKey: json.tagOptions
```

```Go
type tagOptions string
```

tagOptions is the string following a comma in a struct field's "json" tag, or the empty string. It does not include the leading comma. 

#### <a id="parseTag" href="#parseTag">func parseTag(tag string) (string, tagOptions)</a>

```
searchKey: json.parseTag
```

```Go
func parseTag(tag string) (string, tagOptions)
```

parseTag splits a struct field's json tag into its name and comma-separated options. 

#### <a id="tagOptions.Contains" href="#tagOptions.Contains">func (o tagOptions) Contains(optionName string) bool</a>

```
searchKey: json.tagOptions.Contains
```

```Go
func (o tagOptions) Contains(optionName string) bool
```

Contains reports whether a comma-separated list of options contains a particular substr flag. substr must be surrounded by a string boundary or commas. 

### <a id="codeResponse" href="#codeResponse">type codeResponse struct</a>

```
searchKey: json.codeResponse
```

```Go
type codeResponse struct {
	Tree     *codeNode `json:"tree"`
	Username string    `json:"username"`
}
```

### <a id="codeNode" href="#codeNode">type codeNode struct</a>

```
searchKey: json.codeNode
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

### <a id="T" href="#T">type T struct</a>

```
searchKey: json.T
```

```Go
type T struct {
	X string
	Y int
	Z int `json:"-"`
}
```

### <a id="U" href="#U">type U struct</a>

```
searchKey: json.U
```

```Go
type U struct {
	Alphabet string `json:"alpha"`
}
```

### <a id="V" href="#V">type V struct</a>

```
searchKey: json.V
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
```

```Go
type VOuter struct {
	V V
}
```

### <a id="W" href="#W">type W struct</a>

```
searchKey: json.W
```

```Go
type W struct {
	S SS
}
```

### <a id="P" href="#P">type P struct</a>

```
searchKey: json.P
```

```Go
type P struct {
	PP PP
}
```

### <a id="PP" href="#PP">type PP struct</a>

```
searchKey: json.PP
```

```Go
type PP struct {
	T  T
	Ts []T
}
```

### <a id="SS" href="#SS">type SS string</a>

```
searchKey: json.SS
```

```Go
type SS string
```

#### <a id="SS.UnmarshalJSON" href="#SS.UnmarshalJSON">func (*SS) UnmarshalJSON(data []byte) error</a>

```
searchKey: json.SS.UnmarshalJSON
```

```Go
func (*SS) UnmarshalJSON(data []byte) error
```

### <a id="tx" href="#tx">type tx struct</a>

```
searchKey: json.tx
```

```Go
type tx struct {
	x int
}
```

### <a id="u8" href="#u8">type u8 uint8</a>

```
searchKey: json.u8
```

```Go
type u8 uint8
```

### <a id="unmarshaler" href="#unmarshaler">type unmarshaler struct</a>

```
searchKey: json.unmarshaler
```

```Go
type unmarshaler struct {
	T bool
}
```

#### <a id="unmarshaler.UnmarshalJSON" href="#unmarshaler.UnmarshalJSON">func (u *unmarshaler) UnmarshalJSON(b []byte) error</a>

```
searchKey: json.unmarshaler.UnmarshalJSON
```

```Go
func (u *unmarshaler) UnmarshalJSON(b []byte) error
```

### <a id="ustruct" href="#ustruct">type ustruct struct</a>

```
searchKey: json.ustruct
```

```Go
type ustruct struct {
	M unmarshaler
}
```

### <a id="unmarshalerText" href="#unmarshalerText">type unmarshalerText struct</a>

```
searchKey: json.unmarshalerText
```

```Go
type unmarshalerText struct {
	A, B string
}
```

#### <a id="unmarshalerText.MarshalText" href="#unmarshalerText.MarshalText">func (u unmarshalerText) MarshalText() ([]byte, error)</a>

```
searchKey: json.unmarshalerText.MarshalText
```

```Go
func (u unmarshalerText) MarshalText() ([]byte, error)
```

needed for re-marshaling tests 

#### <a id="unmarshalerText.UnmarshalText" href="#unmarshalerText.UnmarshalText">func (u *unmarshalerText) UnmarshalText(b []byte) error</a>

```
searchKey: json.unmarshalerText.UnmarshalText
```

```Go
func (u *unmarshalerText) UnmarshalText(b []byte) error
```

### <a id="ustructText" href="#ustructText">type ustructText struct</a>

```
searchKey: json.ustructText
```

```Go
type ustructText struct {
	M unmarshalerText
}
```

### <a id="u8marshal" href="#u8marshal">type u8marshal uint8</a>

```
searchKey: json.u8marshal
```

```Go
type u8marshal uint8
```

u8marshal is an integer type that can marshal/unmarshal itself. 

#### <a id="u8marshal.MarshalText" href="#u8marshal.MarshalText">func (u8 u8marshal) MarshalText() ([]byte, error)</a>

```
searchKey: json.u8marshal.MarshalText
```

```Go
func (u8 u8marshal) MarshalText() ([]byte, error)
```

#### <a id="u8marshal.UnmarshalText" href="#u8marshal.UnmarshalText">func (u8 *u8marshal) UnmarshalText(b []byte) error</a>

```
searchKey: json.u8marshal.UnmarshalText
```

```Go
func (u8 *u8marshal) UnmarshalText(b []byte) error
```

### <a id="Point" href="#Point">type Point struct</a>

```
searchKey: json.Point
```

```Go
type Point struct {
	Z int
}
```

### <a id="Top" href="#Top">type Top struct</a>

```
searchKey: json.Top
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

### <a id="Embed0" href="#Embed0">type Embed0 struct</a>

```
searchKey: json.Embed0
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
```

```Go
type Embed0b Embed0
```

### <a id="Embed0c" href="#Embed0c">type Embed0c json.Embed0</a>

```
searchKey: json.Embed0c
```

```Go
type Embed0c Embed0
```

### <a id="Embed0p" href="#Embed0p">type Embed0p struct</a>

```
searchKey: json.Embed0p
```

```Go
type Embed0p struct {
	image.Point
}
```

### <a id="Embed0q" href="#Embed0q">type Embed0q struct</a>

```
searchKey: json.Embed0q
```

```Go
type Embed0q struct {
	Point
}
```

### <a id="embed" href="#embed">type embed struct</a>

```
searchKey: json.embed
```

```Go
type embed struct {
	Q int
}
```

### <a id="Loop" href="#Loop">type Loop struct</a>

```
searchKey: json.Loop
```

```Go
type Loop struct {
	Loop1 int `json:",omitempty"`
	Loop2 int `json:",omitempty"`
	*Loop
}
```

### <a id="S5" href="#S5">type S5 struct</a>

```
searchKey: json.S5
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
```

```Go
type S6 struct {
	X int
}
```

### <a id="S7" href="#S7">type S7 json.S6</a>

```
searchKey: json.S7
```

```Go
type S7 S6
```

### <a id="S8" href="#S8">type S8 struct</a>

```
searchKey: json.S8
```

```Go
type S8 struct {
	S9
}
```

### <a id="S9" href="#S9">type S9 struct</a>

```
searchKey: json.S9
```

```Go
type S9 struct {
	X int
	Y int
}
```

### <a id="S10" href="#S10">type S10 struct</a>

```
searchKey: json.S10
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
```

```Go
type S11 struct {
	S6
}
```

### <a id="S12" href="#S12">type S12 struct</a>

```
searchKey: json.S12
```

```Go
type S12 struct {
	S6
}
```

### <a id="S13" href="#S13">type S13 struct</a>

```
searchKey: json.S13
```

```Go
type S13 struct {
	S8
}
```

### <a id="Ambig" href="#Ambig">type Ambig struct</a>

```
searchKey: json.Ambig
```

```Go
type Ambig struct {
	// Given "hello", the first match should win.
	First  int `json:"HELLO"`
	Second int `json:"Hello"`
}
```

### <a id="XYZ" href="#XYZ">type XYZ struct</a>

```
searchKey: json.XYZ
```

```Go
type XYZ struct {
	X interface{}
	Y interface{}
	Z interface{}
}
```

### <a id="unexportedWithMethods" href="#unexportedWithMethods">type unexportedWithMethods struct{}</a>

```
searchKey: json.unexportedWithMethods
```

```Go
type unexportedWithMethods struct{}
```

#### <a id="unexportedWithMethods.F" href="#unexportedWithMethods.F">func (unexportedWithMethods) F()</a>

```
searchKey: json.unexportedWithMethods.F
```

```Go
func (unexportedWithMethods) F()
```

### <a id="byteWithMarshalJSON" href="#byteWithMarshalJSON">type byteWithMarshalJSON byte</a>

```
searchKey: json.byteWithMarshalJSON
```

```Go
type byteWithMarshalJSON byte
```

#### <a id="byteWithMarshalJSON.MarshalJSON" href="#byteWithMarshalJSON.MarshalJSON">func (b byteWithMarshalJSON) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.byteWithMarshalJSON.MarshalJSON
```

```Go
func (b byteWithMarshalJSON) MarshalJSON() ([]byte, error)
```

#### <a id="byteWithMarshalJSON.UnmarshalJSON" href="#byteWithMarshalJSON.UnmarshalJSON">func (b *byteWithMarshalJSON) UnmarshalJSON(data []byte) error</a>

```
searchKey: json.byteWithMarshalJSON.UnmarshalJSON
```

```Go
func (b *byteWithMarshalJSON) UnmarshalJSON(data []byte) error
```

### <a id="byteWithPtrMarshalJSON" href="#byteWithPtrMarshalJSON">type byteWithPtrMarshalJSON byte</a>

```
searchKey: json.byteWithPtrMarshalJSON
```

```Go
type byteWithPtrMarshalJSON byte
```

#### <a id="byteWithPtrMarshalJSON.MarshalJSON" href="#byteWithPtrMarshalJSON.MarshalJSON">func (b *byteWithPtrMarshalJSON) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.byteWithPtrMarshalJSON.MarshalJSON
```

```Go
func (b *byteWithPtrMarshalJSON) MarshalJSON() ([]byte, error)
```

#### <a id="byteWithPtrMarshalJSON.UnmarshalJSON" href="#byteWithPtrMarshalJSON.UnmarshalJSON">func (b *byteWithPtrMarshalJSON) UnmarshalJSON(data []byte) error</a>

```
searchKey: json.byteWithPtrMarshalJSON.UnmarshalJSON
```

```Go
func (b *byteWithPtrMarshalJSON) UnmarshalJSON(data []byte) error
```

### <a id="byteWithMarshalText" href="#byteWithMarshalText">type byteWithMarshalText byte</a>

```
searchKey: json.byteWithMarshalText
```

```Go
type byteWithMarshalText byte
```

#### <a id="byteWithMarshalText.MarshalText" href="#byteWithMarshalText.MarshalText">func (b byteWithMarshalText) MarshalText() ([]byte, error)</a>

```
searchKey: json.byteWithMarshalText.MarshalText
```

```Go
func (b byteWithMarshalText) MarshalText() ([]byte, error)
```

#### <a id="byteWithMarshalText.UnmarshalText" href="#byteWithMarshalText.UnmarshalText">func (b *byteWithMarshalText) UnmarshalText(data []byte) error</a>

```
searchKey: json.byteWithMarshalText.UnmarshalText
```

```Go
func (b *byteWithMarshalText) UnmarshalText(data []byte) error
```

### <a id="byteWithPtrMarshalText" href="#byteWithPtrMarshalText">type byteWithPtrMarshalText byte</a>

```
searchKey: json.byteWithPtrMarshalText
```

```Go
type byteWithPtrMarshalText byte
```

#### <a id="byteWithPtrMarshalText.MarshalText" href="#byteWithPtrMarshalText.MarshalText">func (b *byteWithPtrMarshalText) MarshalText() ([]byte, error)</a>

```
searchKey: json.byteWithPtrMarshalText.MarshalText
```

```Go
func (b *byteWithPtrMarshalText) MarshalText() ([]byte, error)
```

#### <a id="byteWithPtrMarshalText.UnmarshalText" href="#byteWithPtrMarshalText.UnmarshalText">func (b *byteWithPtrMarshalText) UnmarshalText(data []byte) error</a>

```
searchKey: json.byteWithPtrMarshalText.UnmarshalText
```

```Go
func (b *byteWithPtrMarshalText) UnmarshalText(data []byte) error
```

### <a id="intWithMarshalJSON" href="#intWithMarshalJSON">type intWithMarshalJSON int</a>

```
searchKey: json.intWithMarshalJSON
```

```Go
type intWithMarshalJSON int
```

#### <a id="intWithMarshalJSON.MarshalJSON" href="#intWithMarshalJSON.MarshalJSON">func (b intWithMarshalJSON) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.intWithMarshalJSON.MarshalJSON
```

```Go
func (b intWithMarshalJSON) MarshalJSON() ([]byte, error)
```

#### <a id="intWithMarshalJSON.UnmarshalJSON" href="#intWithMarshalJSON.UnmarshalJSON">func (b *intWithMarshalJSON) UnmarshalJSON(data []byte) error</a>

```
searchKey: json.intWithMarshalJSON.UnmarshalJSON
```

```Go
func (b *intWithMarshalJSON) UnmarshalJSON(data []byte) error
```

### <a id="intWithPtrMarshalJSON" href="#intWithPtrMarshalJSON">type intWithPtrMarshalJSON int</a>

```
searchKey: json.intWithPtrMarshalJSON
```

```Go
type intWithPtrMarshalJSON int
```

#### <a id="intWithPtrMarshalJSON.MarshalJSON" href="#intWithPtrMarshalJSON.MarshalJSON">func (b *intWithPtrMarshalJSON) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.intWithPtrMarshalJSON.MarshalJSON
```

```Go
func (b *intWithPtrMarshalJSON) MarshalJSON() ([]byte, error)
```

#### <a id="intWithPtrMarshalJSON.UnmarshalJSON" href="#intWithPtrMarshalJSON.UnmarshalJSON">func (b *intWithPtrMarshalJSON) UnmarshalJSON(data []byte) error</a>

```
searchKey: json.intWithPtrMarshalJSON.UnmarshalJSON
```

```Go
func (b *intWithPtrMarshalJSON) UnmarshalJSON(data []byte) error
```

### <a id="intWithMarshalText" href="#intWithMarshalText">type intWithMarshalText int</a>

```
searchKey: json.intWithMarshalText
```

```Go
type intWithMarshalText int
```

#### <a id="intWithMarshalText.MarshalText" href="#intWithMarshalText.MarshalText">func (b intWithMarshalText) MarshalText() ([]byte, error)</a>

```
searchKey: json.intWithMarshalText.MarshalText
```

```Go
func (b intWithMarshalText) MarshalText() ([]byte, error)
```

#### <a id="intWithMarshalText.UnmarshalText" href="#intWithMarshalText.UnmarshalText">func (b *intWithMarshalText) UnmarshalText(data []byte) error</a>

```
searchKey: json.intWithMarshalText.UnmarshalText
```

```Go
func (b *intWithMarshalText) UnmarshalText(data []byte) error
```

### <a id="intWithPtrMarshalText" href="#intWithPtrMarshalText">type intWithPtrMarshalText int</a>

```
searchKey: json.intWithPtrMarshalText
```

```Go
type intWithPtrMarshalText int
```

#### <a id="intWithPtrMarshalText.MarshalText" href="#intWithPtrMarshalText.MarshalText">func (b *intWithPtrMarshalText) MarshalText() ([]byte, error)</a>

```
searchKey: json.intWithPtrMarshalText.MarshalText
```

```Go
func (b *intWithPtrMarshalText) MarshalText() ([]byte, error)
```

#### <a id="intWithPtrMarshalText.UnmarshalText" href="#intWithPtrMarshalText.UnmarshalText">func (b *intWithPtrMarshalText) UnmarshalText(data []byte) error</a>

```
searchKey: json.intWithPtrMarshalText.UnmarshalText
```

```Go
func (b *intWithPtrMarshalText) UnmarshalText(data []byte) error
```

### <a id="mapStringToStringData" href="#mapStringToStringData">type mapStringToStringData struct</a>

```
searchKey: json.mapStringToStringData
```

```Go
type mapStringToStringData struct {
	Data map[string]string `json:"data"`
}
```

### <a id="unmarshalTest" href="#unmarshalTest">type unmarshalTest struct</a>

```
searchKey: json.unmarshalTest
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

### <a id="B" href="#B">type B struct</a>

```
searchKey: json.B
```

```Go
type B struct {
	B bool `json:",string"`
}
```

### <a id="DoublePtr" href="#DoublePtr">type DoublePtr struct</a>

```
searchKey: json.DoublePtr
```

```Go
type DoublePtr struct {
	I **int
	J **int
}
```

### <a id="Xint" href="#Xint">type Xint struct</a>

```
searchKey: json.Xint
```

```Go
type Xint struct {
	X int
}
```

### <a id="WrongString" href="#WrongString">type WrongString struct</a>

```
searchKey: json.WrongString
```

```Go
type WrongString struct {
	Message string `json:"result,string"`
}
```

WrongString is a struct that's misusing the ,string modifier. 

### <a id="wrongStringTest" href="#wrongStringTest">type wrongStringTest struct</a>

```
searchKey: json.wrongStringTest
```

```Go
type wrongStringTest struct {
	in, err string
}
```

### <a id="All" href="#All">type All struct</a>

```
searchKey: json.All
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

### <a id="Small" href="#Small">type Small struct</a>

```
searchKey: json.Small
```

```Go
type Small struct {
	Tag string
}
```

### <a id="NullTest" href="#NullTest">type NullTest struct</a>

```
searchKey: json.NullTest
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

### <a id="MustNotUnmarshalJSON" href="#MustNotUnmarshalJSON">type MustNotUnmarshalJSON struct{}</a>

```
searchKey: json.MustNotUnmarshalJSON
```

```Go
type MustNotUnmarshalJSON struct{}
```

#### <a id="MustNotUnmarshalJSON.UnmarshalJSON" href="#MustNotUnmarshalJSON.UnmarshalJSON">func (x MustNotUnmarshalJSON) UnmarshalJSON(data []byte) error</a>

```
searchKey: json.MustNotUnmarshalJSON.UnmarshalJSON
```

```Go
func (x MustNotUnmarshalJSON) UnmarshalJSON(data []byte) error
```

### <a id="MustNotUnmarshalText" href="#MustNotUnmarshalText">type MustNotUnmarshalText struct{}</a>

```
searchKey: json.MustNotUnmarshalText
```

```Go
type MustNotUnmarshalText struct{}
```

#### <a id="MustNotUnmarshalText.UnmarshalText" href="#MustNotUnmarshalText.UnmarshalText">func (x MustNotUnmarshalText) UnmarshalText(text []byte) error</a>

```
searchKey: json.MustNotUnmarshalText.UnmarshalText
```

```Go
func (x MustNotUnmarshalText) UnmarshalText(text []byte) error
```

### <a id="unexportedFields" href="#unexportedFields">type unexportedFields struct</a>

```
searchKey: json.unexportedFields
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

### <a id="Time3339" href="#Time3339">type Time3339 time.Time</a>

```
searchKey: json.Time3339
```

```Go
type Time3339 time.Time
```

Time3339 is a time.Time which encodes to and from JSON as an RFC 3339 time in UTC. 

#### <a id="Time3339.UnmarshalJSON" href="#Time3339.UnmarshalJSON">func (t *Time3339) UnmarshalJSON(b []byte) error</a>

```
searchKey: json.Time3339.UnmarshalJSON
```

```Go
func (t *Time3339) UnmarshalJSON(b []byte) error
```

### <a id="unmarshalPanic" href="#unmarshalPanic">type unmarshalPanic struct{}</a>

```
searchKey: json.unmarshalPanic
```

```Go
type unmarshalPanic struct{}
```

#### <a id="unmarshalPanic.UnmarshalJSON" href="#unmarshalPanic.UnmarshalJSON">func (unmarshalPanic) UnmarshalJSON([]byte) error</a>

```
searchKey: json.unmarshalPanic.UnmarshalJSON
```

```Go
func (unmarshalPanic) UnmarshalJSON([]byte) error
```

### <a id="textUnmarshalerString" href="#textUnmarshalerString">type textUnmarshalerString string</a>

```
searchKey: json.textUnmarshalerString
```

```Go
type textUnmarshalerString string
```

#### <a id="textUnmarshalerString.UnmarshalText" href="#textUnmarshalerString.UnmarshalText">func (m *textUnmarshalerString) UnmarshalText(text []byte) error</a>

```
searchKey: json.textUnmarshalerString.UnmarshalText
```

```Go
func (m *textUnmarshalerString) UnmarshalText(text []byte) error
```

### <a id="Optionals" href="#Optionals">type Optionals struct</a>

```
searchKey: json.Optionals
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

### <a id="StringTag" href="#StringTag">type StringTag struct</a>

```
searchKey: json.StringTag
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

### <a id="renamedByte" href="#renamedByte">type renamedByte byte</a>

```
searchKey: json.renamedByte
```

```Go
type renamedByte byte
```

byte slices are special even if they're renamed types. 

### <a id="renamedByteSlice" href="#renamedByteSlice">type renamedByteSlice []byte</a>

```
searchKey: json.renamedByteSlice
```

```Go
type renamedByteSlice []byte
```

### <a id="renamedRenamedByteSlice" href="#renamedRenamedByteSlice">type renamedRenamedByteSlice []json.renamedByte</a>

```
searchKey: json.renamedRenamedByteSlice
```

```Go
type renamedRenamedByteSlice []renamedByte
```

### <a id="SamePointerNoCycle" href="#SamePointerNoCycle">type SamePointerNoCycle struct</a>

```
searchKey: json.SamePointerNoCycle
```

```Go
type SamePointerNoCycle struct {
	Ptr1, Ptr2 *SamePointerNoCycle
}
```

### <a id="PointerCycle" href="#PointerCycle">type PointerCycle struct</a>

```
searchKey: json.PointerCycle
```

```Go
type PointerCycle struct {
	Ptr *PointerCycle
}
```

### <a id="PointerCycleIndirect" href="#PointerCycleIndirect">type PointerCycleIndirect struct</a>

```
searchKey: json.PointerCycleIndirect
```

```Go
type PointerCycleIndirect struct {
	Ptrs []interface{}
}
```

### <a id="RecursiveSlice" href="#RecursiveSlice">type RecursiveSlice []json.RecursiveSlice</a>

```
searchKey: json.RecursiveSlice
```

```Go
type RecursiveSlice []RecursiveSlice
```

### <a id="Ref" href="#Ref">type Ref int</a>

```
searchKey: json.Ref
```

```Go
type Ref int
```

Ref has Marshaler and Unmarshaler methods with pointer receiver. 

#### <a id="Ref.MarshalJSON" href="#Ref.MarshalJSON">func (*Ref) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.Ref.MarshalJSON
```

```Go
func (*Ref) MarshalJSON() ([]byte, error)
```

#### <a id="Ref.UnmarshalJSON" href="#Ref.UnmarshalJSON">func (r *Ref) UnmarshalJSON([]byte) error</a>

```
searchKey: json.Ref.UnmarshalJSON
```

```Go
func (r *Ref) UnmarshalJSON([]byte) error
```

### <a id="Val" href="#Val">type Val int</a>

```
searchKey: json.Val
```

```Go
type Val int
```

Val has Marshaler methods with value receiver. 

#### <a id="Val.MarshalJSON" href="#Val.MarshalJSON">func (Val) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.Val.MarshalJSON
```

```Go
func (Val) MarshalJSON() ([]byte, error)
```

### <a id="RefText" href="#RefText">type RefText int</a>

```
searchKey: json.RefText
```

```Go
type RefText int
```

RefText has Marshaler and Unmarshaler methods with pointer receiver. 

#### <a id="RefText.MarshalText" href="#RefText.MarshalText">func (*RefText) MarshalText() ([]byte, error)</a>

```
searchKey: json.RefText.MarshalText
```

```Go
func (*RefText) MarshalText() ([]byte, error)
```

#### <a id="RefText.UnmarshalText" href="#RefText.UnmarshalText">func (r *RefText) UnmarshalText([]byte) error</a>

```
searchKey: json.RefText.UnmarshalText
```

```Go
func (r *RefText) UnmarshalText([]byte) error
```

### <a id="ValText" href="#ValText">type ValText int</a>

```
searchKey: json.ValText
```

```Go
type ValText int
```

ValText has Marshaler methods with value receiver. 

#### <a id="ValText.MarshalText" href="#ValText.MarshalText">func (ValText) MarshalText() ([]byte, error)</a>

```
searchKey: json.ValText.MarshalText
```

```Go
func (ValText) MarshalText() ([]byte, error)
```

### <a id="C" href="#C">type C int</a>

```
searchKey: json.C
```

```Go
type C int
```

C implements Marshaler and returns unescaped JSON. 

#### <a id="C.MarshalJSON" href="#C.MarshalJSON">func (C) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.C.MarshalJSON
```

```Go
func (C) MarshalJSON() ([]byte, error)
```

### <a id="CText" href="#CText">type CText int</a>

```
searchKey: json.CText
```

```Go
type CText int
```

CText implements Marshaler and returns unescaped text. 

#### <a id="CText.MarshalText" href="#CText.MarshalText">func (CText) MarshalText() ([]byte, error)</a>

```
searchKey: json.CText.MarshalText
```

```Go
func (CText) MarshalText() ([]byte, error)
```

### <a id="BugA" href="#BugA">type BugA struct</a>

```
searchKey: json.BugA
```

```Go
type BugA struct {
	S string
}
```

### <a id="BugB" href="#BugB">type BugB struct</a>

```
searchKey: json.BugB
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
```

```Go
type BugC struct {
	S string
}
```

### <a id="BugX" href="#BugX">type BugX struct</a>

```
searchKey: json.BugX
```

```Go
type BugX struct {
	A int
	BugA
	BugB
}
```

Legal Go: We never use the repeated embedded field (S). 

### <a id="nilJSONMarshaler" href="#nilJSONMarshaler">type nilJSONMarshaler string</a>

```
searchKey: json.nilJSONMarshaler
```

```Go
type nilJSONMarshaler string
```

golang.org/issue/16042. Even if a nil interface value is passed in, as long as it implements Marshaler, it should be marshaled. 

#### <a id="nilJSONMarshaler.MarshalJSON" href="#nilJSONMarshaler.MarshalJSON">func (nm *nilJSONMarshaler) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.nilJSONMarshaler.MarshalJSON
```

```Go
func (nm *nilJSONMarshaler) MarshalJSON() ([]byte, error)
```

### <a id="nilTextMarshaler" href="#nilTextMarshaler">type nilTextMarshaler string</a>

```
searchKey: json.nilTextMarshaler
```

```Go
type nilTextMarshaler string
```

golang.org/issue/34235. Even if a nil interface value is passed in, as long as it implements encoding.TextMarshaler, it should be marshaled. 

#### <a id="nilTextMarshaler.MarshalText" href="#nilTextMarshaler.MarshalText">func (nm *nilTextMarshaler) MarshalText() ([]byte, error)</a>

```
searchKey: json.nilTextMarshaler.MarshalText
```

```Go
func (nm *nilTextMarshaler) MarshalText() ([]byte, error)
```

### <a id="BugD" href="#BugD">type BugD struct</a>

```
searchKey: json.BugD
```

```Go
type BugD struct {
	XXX string `json:"S"`
}
```

### <a id="BugY" href="#BugY">type BugY struct</a>

```
searchKey: json.BugY
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
```

```Go
type BugZ struct {
	BugA
	BugC
	BugY // Contains a tagged S field through BugD; should not dominate.
}
```

There are no tags here, so S should not appear. 

### <a id="jsonbyte" href="#jsonbyte">type jsonbyte byte</a>

```
searchKey: json.jsonbyte
```

```Go
type jsonbyte byte
```

#### <a id="jsonbyte.MarshalJSON" href="#jsonbyte.MarshalJSON">func (b jsonbyte) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.jsonbyte.MarshalJSON
```

```Go
func (b jsonbyte) MarshalJSON() ([]byte, error)
```

### <a id="textbyte" href="#textbyte">type textbyte byte</a>

```
searchKey: json.textbyte
```

```Go
type textbyte byte
```

#### <a id="textbyte.MarshalText" href="#textbyte.MarshalText">func (b textbyte) MarshalText() ([]byte, error)</a>

```
searchKey: json.textbyte.MarshalText
```

```Go
func (b textbyte) MarshalText() ([]byte, error)
```

### <a id="jsonint" href="#jsonint">type jsonint int</a>

```
searchKey: json.jsonint
```

```Go
type jsonint int
```

#### <a id="jsonint.MarshalJSON" href="#jsonint.MarshalJSON">func (i jsonint) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.jsonint.MarshalJSON
```

```Go
func (i jsonint) MarshalJSON() ([]byte, error)
```

### <a id="textint" href="#textint">type textint int</a>

```
searchKey: json.textint
```

```Go
type textint int
```

#### <a id="textint.MarshalText" href="#textint.MarshalText">func (i textint) MarshalText() ([]byte, error)</a>

```
searchKey: json.textint.MarshalText
```

```Go
func (i textint) MarshalText() ([]byte, error)
```

### <a id="textfloat" href="#textfloat">type textfloat float64</a>

```
searchKey: json.textfloat
```

```Go
type textfloat float64
```

#### <a id="textfloat.MarshalText" href="#textfloat.MarshalText">func (f textfloat) MarshalText() ([]byte, error)</a>

```
searchKey: json.textfloat.MarshalText
```

```Go
func (f textfloat) MarshalText() ([]byte, error)
```

### <a id="marshalPanic" href="#marshalPanic">type marshalPanic struct{}</a>

```
searchKey: json.marshalPanic
```

```Go
type marshalPanic struct{}
```

#### <a id="marshalPanic.MarshalJSON" href="#marshalPanic.MarshalJSON">func (marshalPanic) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.marshalPanic.MarshalJSON
```

```Go
func (marshalPanic) MarshalJSON() ([]byte, error)
```

### <a id="example" href="#example">type example struct</a>

```
searchKey: json.example
```

```Go
type example struct {
	compact string
	indent  string
}
```

### <a id="indentErrorTest" href="#indentErrorTest">type indentErrorTest struct</a>

```
searchKey: json.indentErrorTest
```

```Go
type indentErrorTest struct {
	in  string
	err error
}
```

### <a id="strMarshaler" href="#strMarshaler">type strMarshaler string</a>

```
searchKey: json.strMarshaler
```

```Go
type strMarshaler string
```

#### <a id="strMarshaler.MarshalJSON" href="#strMarshaler.MarshalJSON">func (s strMarshaler) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.strMarshaler.MarshalJSON
```

```Go
func (s strMarshaler) MarshalJSON() ([]byte, error)
```

### <a id="strPtrMarshaler" href="#strPtrMarshaler">type strPtrMarshaler string</a>

```
searchKey: json.strPtrMarshaler
```

```Go
type strPtrMarshaler string
```

#### <a id="strPtrMarshaler.MarshalJSON" href="#strPtrMarshaler.MarshalJSON">func (s *strPtrMarshaler) MarshalJSON() ([]byte, error)</a>

```
searchKey: json.strPtrMarshaler.MarshalJSON
```

```Go
func (s *strPtrMarshaler) MarshalJSON() ([]byte, error)
```

### <a id="tokenStreamCase" href="#tokenStreamCase">type tokenStreamCase struct</a>

```
searchKey: json.tokenStreamCase
```

```Go
type tokenStreamCase struct {
	json      string
	expTokens []interface{}
}
```

### <a id="decodeThis" href="#decodeThis">type decodeThis struct</a>

```
searchKey: json.decodeThis
```

```Go
type decodeThis struct {
	v interface{}
}
```

### <a id="basicLatin2xTag" href="#basicLatin2xTag">type basicLatin2xTag struct</a>

```
searchKey: json.basicLatin2xTag
```

```Go
type basicLatin2xTag struct {
	V string `json:"$%-/"`
}
```

### <a id="basicLatin3xTag" href="#basicLatin3xTag">type basicLatin3xTag struct</a>

```
searchKey: json.basicLatin3xTag
```

```Go
type basicLatin3xTag struct {
	V string `json:"0123456789"`
}
```

### <a id="basicLatin4xTag" href="#basicLatin4xTag">type basicLatin4xTag struct</a>

```
searchKey: json.basicLatin4xTag
```

```Go
type basicLatin4xTag struct {
	V string `json:"ABCDEFGHIJKLMO"`
}
```

### <a id="basicLatin5xTag" href="#basicLatin5xTag">type basicLatin5xTag struct</a>

```
searchKey: json.basicLatin5xTag
```

```Go
type basicLatin5xTag struct {
	V string `json:"PQRSTUVWXYZ_"`
}
```

### <a id="basicLatin6xTag" href="#basicLatin6xTag">type basicLatin6xTag struct</a>

```
searchKey: json.basicLatin6xTag
```

```Go
type basicLatin6xTag struct {
	V string `json:"abcdefghijklmno"`
}
```

### <a id="basicLatin7xTag" href="#basicLatin7xTag">type basicLatin7xTag struct</a>

```
searchKey: json.basicLatin7xTag
```

```Go
type basicLatin7xTag struct {
	V string `json:"pqrstuvwxyz"`
}
```

### <a id="miscPlaneTag" href="#miscPlaneTag">type miscPlaneTag struct</a>

```
searchKey: json.miscPlaneTag
```

```Go
type miscPlaneTag struct {
	V string `json:"色は匂へど"`
}
```

### <a id="percentSlashTag" href="#percentSlashTag">type percentSlashTag struct</a>

```
searchKey: json.percentSlashTag
```

```Go
type percentSlashTag struct {
	V string `json:"text/html%"` // https://golang.org/issue/2718
}
```

### <a id="punctuationTag" href="#punctuationTag">type punctuationTag struct</a>

```
searchKey: json.punctuationTag
```

```Go
type punctuationTag struct {
	V string `json:"!#$%&()*+-./:;<=>?@[]^_{|}~ "` // https://golang.org/issue/3546
}
```

### <a id="dashTag" href="#dashTag">type dashTag struct</a>

```
searchKey: json.dashTag
```

```Go
type dashTag struct {
	V string `json:"-,"`
}
```

### <a id="emptyTag" href="#emptyTag">type emptyTag struct</a>

```
searchKey: json.emptyTag
```

```Go
type emptyTag struct {
	W string
}
```

### <a id="misnamedTag" href="#misnamedTag">type misnamedTag struct</a>

```
searchKey: json.misnamedTag
```

```Go
type misnamedTag struct {
	X string `jsom:"Misnamed"`
}
```

### <a id="badFormatTag" href="#badFormatTag">type badFormatTag struct</a>

```
searchKey: json.badFormatTag
```

```Go
type badFormatTag struct {
	Y string `:"BadFormat"`
}
```

### <a id="badCodeTag" href="#badCodeTag">type badCodeTag struct</a>

```
searchKey: json.badCodeTag
```

```Go
type badCodeTag struct {
	Z string `json:" !\"#&'()*+,."`
}
```

### <a id="spaceTag" href="#spaceTag">type spaceTag struct</a>

```
searchKey: json.spaceTag
```

```Go
type spaceTag struct {
	Q string `json:"With space"`
}
```

### <a id="unicodeTag" href="#unicodeTag">type unicodeTag struct</a>

```
searchKey: json.unicodeTag
```

```Go
type unicodeTag struct {
	W string `json:"Ελλάδα"`
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="Unmarshal" href="#Unmarshal">func Unmarshal(data []byte, v interface{}) error</a>

```
searchKey: json.Unmarshal
tags: [exported]
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

### <a id="getu4" href="#getu4">func getu4(s []byte) rune</a>

```
searchKey: json.getu4
```

```Go
func getu4(s []byte) rune
```

getu4 decodes \uXXXX from the beginning of s, returning the hex value, or it returns -1. 

### <a id="unquote" href="#unquote">func unquote(s []byte) (t string, ok bool)</a>

```
searchKey: json.unquote
```

```Go
func unquote(s []byte) (t string, ok bool)
```

unquote converts a quoted JSON string literal s into an actual string t. The rules are different than for Go, so cannot use strconv.Unquote. 

### <a id="unquoteBytes" href="#unquoteBytes">func unquoteBytes(s []byte) (t []byte, ok bool)</a>

```
searchKey: json.unquoteBytes
```

```Go
func unquoteBytes(s []byte) (t []byte, ok bool)
```

### <a id="Marshal" href="#Marshal">func Marshal(v interface{}) ([]byte, error)</a>

```
searchKey: json.Marshal
tags: [exported]
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
tags: [exported]
```

```Go
func MarshalIndent(v interface{}, prefix, indent string) ([]byte, error)
```

MarshalIndent is like Marshal but applies Indent to format the output. Each JSON element in the output will begin on a new line beginning with prefix followed by one or more copies of indent according to the indentation nesting. 

### <a id="HTMLEscape" href="#HTMLEscape">func HTMLEscape(dst *bytes.Buffer, src []byte)</a>

```
searchKey: json.HTMLEscape
tags: [exported]
```

```Go
func HTMLEscape(dst *bytes.Buffer, src []byte)
```

HTMLEscape appends to dst the JSON-encoded src with <, >, &, U+2028 and U+2029 characters inside string literals changed to \u003c, \u003e, \u0026, \u2028, \u2029 so that the JSON will be safe to embed inside HTML <script> tags. For historical reasons, web browsers don't honor standard HTML escaping within <script> tags, so an alternative JSON encoding must be used. 

### <a id="isEmptyValue" href="#isEmptyValue">func isEmptyValue(v reflect.Value) bool</a>

```
searchKey: json.isEmptyValue
```

```Go
func isEmptyValue(v reflect.Value) bool
```

### <a id="invalidValueEncoder" href="#invalidValueEncoder">func invalidValueEncoder(e *encodeState, v reflect.Value, _ encOpts)</a>

```
searchKey: json.invalidValueEncoder
```

```Go
func invalidValueEncoder(e *encodeState, v reflect.Value, _ encOpts)
```

### <a id="marshalerEncoder" href="#marshalerEncoder">func marshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.marshalerEncoder
```

```Go
func marshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="addrMarshalerEncoder" href="#addrMarshalerEncoder">func addrMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.addrMarshalerEncoder
```

```Go
func addrMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="textMarshalerEncoder" href="#textMarshalerEncoder">func textMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.textMarshalerEncoder
```

```Go
func textMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="addrTextMarshalerEncoder" href="#addrTextMarshalerEncoder">func addrTextMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.addrTextMarshalerEncoder
```

```Go
func addrTextMarshalerEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="boolEncoder" href="#boolEncoder">func boolEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.boolEncoder
```

```Go
func boolEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="intEncoder" href="#intEncoder">func intEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.intEncoder
```

```Go
func intEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="uintEncoder" href="#uintEncoder">func uintEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.uintEncoder
```

```Go
func uintEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="stringEncoder" href="#stringEncoder">func stringEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.stringEncoder
```

```Go
func stringEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="isValidNumber" href="#isValidNumber">func isValidNumber(s string) bool</a>

```
searchKey: json.isValidNumber
```

```Go
func isValidNumber(s string) bool
```

isValidNumber reports whether s is a valid JSON number literal. 

### <a id="interfaceEncoder" href="#interfaceEncoder">func interfaceEncoder(e *encodeState, v reflect.Value, opts encOpts)</a>

```
searchKey: json.interfaceEncoder
```

```Go
func interfaceEncoder(e *encodeState, v reflect.Value, opts encOpts)
```

### <a id="unsupportedTypeEncoder" href="#unsupportedTypeEncoder">func unsupportedTypeEncoder(e *encodeState, v reflect.Value, _ encOpts)</a>

```
searchKey: json.unsupportedTypeEncoder
```

```Go
func unsupportedTypeEncoder(e *encodeState, v reflect.Value, _ encOpts)
```

### <a id="encodeByteSlice" href="#encodeByteSlice">func encodeByteSlice(e *encodeState, v reflect.Value, _ encOpts)</a>

```
searchKey: json.encodeByteSlice
```

```Go
func encodeByteSlice(e *encodeState, v reflect.Value, _ encOpts)
```

### <a id="isValidTag" href="#isValidTag">func isValidTag(s string) bool</a>

```
searchKey: json.isValidTag
```

```Go
func isValidTag(s string) bool
```

### <a id="typeByIndex" href="#typeByIndex">func typeByIndex(t reflect.Type, index []int) reflect.Type</a>

```
searchKey: json.typeByIndex
```

```Go
func typeByIndex(t reflect.Type, index []int) reflect.Type
```

### <a id="foldFunc" href="#foldFunc">func foldFunc(s []byte) func(s, t []byte) bool</a>

```
searchKey: json.foldFunc
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

### <a id="equalFoldRight" href="#equalFoldRight">func equalFoldRight(s, t []byte) bool</a>

```
searchKey: json.equalFoldRight
```

```Go
func equalFoldRight(s, t []byte) bool
```

equalFoldRight is a specialization of bytes.EqualFold when s is known to be all ASCII (including punctuation), but contains an 's', 'S', 'k', or 'K', requiring a Unicode fold on the bytes in t. See comments on foldFunc. 

### <a id="asciiEqualFold" href="#asciiEqualFold">func asciiEqualFold(s, t []byte) bool</a>

```
searchKey: json.asciiEqualFold
```

```Go
func asciiEqualFold(s, t []byte) bool
```

asciiEqualFold is a specialization of bytes.EqualFold for use when s is all ASCII (but may contain non-letters) and contains no special-folding letters. See comments on foldFunc. 

### <a id="simpleLetterEqualFold" href="#simpleLetterEqualFold">func simpleLetterEqualFold(s, t []byte) bool</a>

```
searchKey: json.simpleLetterEqualFold
```

```Go
func simpleLetterEqualFold(s, t []byte) bool
```

simpleLetterEqualFold is a specialization of bytes.EqualFold for use when s is all ASCII letters (no underscores, etc) and also doesn't contain 'k', 'K', 's', or 'S'. See comments on foldFunc. 

### <a id="Compact" href="#Compact">func Compact(dst *bytes.Buffer, src []byte) error</a>

```
searchKey: json.Compact
tags: [exported]
```

```Go
func Compact(dst *bytes.Buffer, src []byte) error
```

Compact appends to dst the JSON-encoded src with insignificant space characters elided. 

### <a id="compact" href="#compact">func compact(dst *bytes.Buffer, src []byte, escape bool) error</a>

```
searchKey: json.compact
```

```Go
func compact(dst *bytes.Buffer, src []byte, escape bool) error
```

### <a id="newline" href="#newline">func newline(dst *bytes.Buffer, prefix, indent string, depth int)</a>

```
searchKey: json.newline
```

```Go
func newline(dst *bytes.Buffer, prefix, indent string, depth int)
```

### <a id="Indent" href="#Indent">func Indent(dst *bytes.Buffer, src []byte, prefix, indent string) error</a>

```
searchKey: json.Indent
tags: [exported]
```

```Go
func Indent(dst *bytes.Buffer, src []byte, prefix, indent string) error
```

Indent appends to dst an indented form of the JSON-encoded src. Each element in a JSON object or array begins on a new, indented line beginning with prefix followed by one or more copies of indent according to the indentation nesting. The data appended to dst does not begin with the prefix nor any indentation, to make it easier to embed inside other formatted JSON data. Although leading space characters (space, tab, carriage return, newline) at the beginning of src are dropped, trailing space characters at the end of src are preserved and copied to dst. For example, if src has no trailing spaces, neither will dst; if src ends in a trailing newline, so will dst. 

### <a id="Valid" href="#Valid">func Valid(data []byte) bool</a>

```
searchKey: json.Valid
tags: [exported]
```

```Go
func Valid(data []byte) bool
```

Valid reports whether data is a valid JSON encoding. 

### <a id="checkValid" href="#checkValid">func checkValid(data []byte, scan *scanner) error</a>

```
searchKey: json.checkValid
```

```Go
func checkValid(data []byte, scan *scanner) error
```

checkValid verifies that data is valid JSON-encoded data. scan is passed in for use by checkValid to avoid an allocation. 

### <a id="freeScanner" href="#freeScanner">func freeScanner(scan *scanner)</a>

```
searchKey: json.freeScanner
```

```Go
func freeScanner(scan *scanner)
```

### <a id="isSpace" href="#isSpace">func isSpace(c byte) bool</a>

```
searchKey: json.isSpace
```

```Go
func isSpace(c byte) bool
```

### <a id="stateBeginValueOrEmpty" href="#stateBeginValueOrEmpty">func stateBeginValueOrEmpty(s *scanner, c byte) int</a>

```
searchKey: json.stateBeginValueOrEmpty
```

```Go
func stateBeginValueOrEmpty(s *scanner, c byte) int
```

stateBeginValueOrEmpty is the state after reading `[`. 

### <a id="stateBeginValue" href="#stateBeginValue">func stateBeginValue(s *scanner, c byte) int</a>

```
searchKey: json.stateBeginValue
```

```Go
func stateBeginValue(s *scanner, c byte) int
```

stateBeginValue is the state at the beginning of the input. 

### <a id="stateBeginStringOrEmpty" href="#stateBeginStringOrEmpty">func stateBeginStringOrEmpty(s *scanner, c byte) int</a>

```
searchKey: json.stateBeginStringOrEmpty
```

```Go
func stateBeginStringOrEmpty(s *scanner, c byte) int
```

stateBeginStringOrEmpty is the state after reading `{`. 

### <a id="stateBeginString" href="#stateBeginString">func stateBeginString(s *scanner, c byte) int</a>

```
searchKey: json.stateBeginString
```

```Go
func stateBeginString(s *scanner, c byte) int
```

stateBeginString is the state after reading `{"key": value,`. 

### <a id="stateEndValue" href="#stateEndValue">func stateEndValue(s *scanner, c byte) int</a>

```
searchKey: json.stateEndValue
```

```Go
func stateEndValue(s *scanner, c byte) int
```

stateEndValue is the state after completing a value, such as after reading `{}` or `true` or `["x"`. 

### <a id="stateEndTop" href="#stateEndTop">func stateEndTop(s *scanner, c byte) int</a>

```
searchKey: json.stateEndTop
```

```Go
func stateEndTop(s *scanner, c byte) int
```

stateEndTop is the state after finishing the top-level value, such as after reading `{}` or `[1,2,3]`. Only space characters should be seen now. 

### <a id="stateInString" href="#stateInString">func stateInString(s *scanner, c byte) int</a>

```
searchKey: json.stateInString
```

```Go
func stateInString(s *scanner, c byte) int
```

stateInString is the state after reading `"`. 

### <a id="stateInStringEsc" href="#stateInStringEsc">func stateInStringEsc(s *scanner, c byte) int</a>

```
searchKey: json.stateInStringEsc
```

```Go
func stateInStringEsc(s *scanner, c byte) int
```

stateInStringEsc is the state after reading `"\` during a quoted string. 

### <a id="stateInStringEscU" href="#stateInStringEscU">func stateInStringEscU(s *scanner, c byte) int</a>

```
searchKey: json.stateInStringEscU
```

```Go
func stateInStringEscU(s *scanner, c byte) int
```

stateInStringEscU is the state after reading `"\u` during a quoted string. 

### <a id="stateInStringEscU1" href="#stateInStringEscU1">func stateInStringEscU1(s *scanner, c byte) int</a>

```
searchKey: json.stateInStringEscU1
```

```Go
func stateInStringEscU1(s *scanner, c byte) int
```

stateInStringEscU1 is the state after reading `"\u1` during a quoted string. 

### <a id="stateInStringEscU12" href="#stateInStringEscU12">func stateInStringEscU12(s *scanner, c byte) int</a>

```
searchKey: json.stateInStringEscU12
```

```Go
func stateInStringEscU12(s *scanner, c byte) int
```

stateInStringEscU12 is the state after reading `"\u12` during a quoted string. 

### <a id="stateInStringEscU123" href="#stateInStringEscU123">func stateInStringEscU123(s *scanner, c byte) int</a>

```
searchKey: json.stateInStringEscU123
```

```Go
func stateInStringEscU123(s *scanner, c byte) int
```

stateInStringEscU123 is the state after reading `"\u123` during a quoted string. 

### <a id="stateNeg" href="#stateNeg">func stateNeg(s *scanner, c byte) int</a>

```
searchKey: json.stateNeg
```

```Go
func stateNeg(s *scanner, c byte) int
```

stateNeg is the state after reading `-` during a number. 

### <a id="state1" href="#state1">func state1(s *scanner, c byte) int</a>

```
searchKey: json.state1
```

```Go
func state1(s *scanner, c byte) int
```

state1 is the state after reading a non-zero integer during a number, such as after reading `1` or `100` but not `0`. 

### <a id="state0" href="#state0">func state0(s *scanner, c byte) int</a>

```
searchKey: json.state0
```

```Go
func state0(s *scanner, c byte) int
```

state0 is the state after reading `0` during a number. 

### <a id="stateDot" href="#stateDot">func stateDot(s *scanner, c byte) int</a>

```
searchKey: json.stateDot
```

```Go
func stateDot(s *scanner, c byte) int
```

stateDot is the state after reading the integer and decimal point in a number, such as after reading `1.`. 

### <a id="stateDot0" href="#stateDot0">func stateDot0(s *scanner, c byte) int</a>

```
searchKey: json.stateDot0
```

```Go
func stateDot0(s *scanner, c byte) int
```

stateDot0 is the state after reading the integer, decimal point, and subsequent digits of a number, such as after reading `3.14`. 

### <a id="stateE" href="#stateE">func stateE(s *scanner, c byte) int</a>

```
searchKey: json.stateE
```

```Go
func stateE(s *scanner, c byte) int
```

stateE is the state after reading the mantissa and e in a number, such as after reading `314e` or `0.314e`. 

### <a id="stateESign" href="#stateESign">func stateESign(s *scanner, c byte) int</a>

```
searchKey: json.stateESign
```

```Go
func stateESign(s *scanner, c byte) int
```

stateESign is the state after reading the mantissa, e, and sign in a number, such as after reading `314e-` or `0.314e+`. 

### <a id="stateE0" href="#stateE0">func stateE0(s *scanner, c byte) int</a>

```
searchKey: json.stateE0
```

```Go
func stateE0(s *scanner, c byte) int
```

stateE0 is the state after reading the mantissa, e, optional sign, and at least one digit of the exponent in a number, such as after reading `314e-2` or `0.314e+1` or `3.14e0`. 

### <a id="stateT" href="#stateT">func stateT(s *scanner, c byte) int</a>

```
searchKey: json.stateT
```

```Go
func stateT(s *scanner, c byte) int
```

stateT is the state after reading `t`. 

### <a id="stateTr" href="#stateTr">func stateTr(s *scanner, c byte) int</a>

```
searchKey: json.stateTr
```

```Go
func stateTr(s *scanner, c byte) int
```

stateTr is the state after reading `tr`. 

### <a id="stateTru" href="#stateTru">func stateTru(s *scanner, c byte) int</a>

```
searchKey: json.stateTru
```

```Go
func stateTru(s *scanner, c byte) int
```

stateTru is the state after reading `tru`. 

### <a id="stateF" href="#stateF">func stateF(s *scanner, c byte) int</a>

```
searchKey: json.stateF
```

```Go
func stateF(s *scanner, c byte) int
```

stateF is the state after reading `f`. 

### <a id="stateFa" href="#stateFa">func stateFa(s *scanner, c byte) int</a>

```
searchKey: json.stateFa
```

```Go
func stateFa(s *scanner, c byte) int
```

stateFa is the state after reading `fa`. 

### <a id="stateFal" href="#stateFal">func stateFal(s *scanner, c byte) int</a>

```
searchKey: json.stateFal
```

```Go
func stateFal(s *scanner, c byte) int
```

stateFal is the state after reading `fal`. 

### <a id="stateFals" href="#stateFals">func stateFals(s *scanner, c byte) int</a>

```
searchKey: json.stateFals
```

```Go
func stateFals(s *scanner, c byte) int
```

stateFals is the state after reading `fals`. 

### <a id="stateN" href="#stateN">func stateN(s *scanner, c byte) int</a>

```
searchKey: json.stateN
```

```Go
func stateN(s *scanner, c byte) int
```

stateN is the state after reading `n`. 

### <a id="stateNu" href="#stateNu">func stateNu(s *scanner, c byte) int</a>

```
searchKey: json.stateNu
```

```Go
func stateNu(s *scanner, c byte) int
```

stateNu is the state after reading `nu`. 

### <a id="stateNul" href="#stateNul">func stateNul(s *scanner, c byte) int</a>

```
searchKey: json.stateNul
```

```Go
func stateNul(s *scanner, c byte) int
```

stateNul is the state after reading `nul`. 

### <a id="stateError" href="#stateError">func stateError(s *scanner, c byte) int</a>

```
searchKey: json.stateError
```

```Go
func stateError(s *scanner, c byte) int
```

stateError is the state after reaching a syntax error, such as after reading `[1}` or `5.1.2`. 

### <a id="quoteChar" href="#quoteChar">func quoteChar(c byte) string</a>

```
searchKey: json.quoteChar
```

```Go
func quoteChar(c byte) string
```

quoteChar formats c as a quoted character literal 

### <a id="nonSpace" href="#nonSpace">func nonSpace(b []byte) bool</a>

```
searchKey: json.nonSpace
```

```Go
func nonSpace(b []byte) bool
```

### <a id="codeInit" href="#codeInit">func codeInit()</a>

```
searchKey: json.codeInit
```

```Go
func codeInit()
```

### <a id="BenchmarkCodeEncoder" href="#BenchmarkCodeEncoder">func BenchmarkCodeEncoder(b *testing.B)</a>

```
searchKey: json.BenchmarkCodeEncoder
```

```Go
func BenchmarkCodeEncoder(b *testing.B)
```

### <a id="BenchmarkCodeMarshal" href="#BenchmarkCodeMarshal">func BenchmarkCodeMarshal(b *testing.B)</a>

```
searchKey: json.BenchmarkCodeMarshal
```

```Go
func BenchmarkCodeMarshal(b *testing.B)
```

### <a id="benchMarshalBytes" href="#benchMarshalBytes">func benchMarshalBytes(n int) func(*testing.B)</a>

```
searchKey: json.benchMarshalBytes
```

```Go
func benchMarshalBytes(n int) func(*testing.B)
```

### <a id="BenchmarkMarshalBytes" href="#BenchmarkMarshalBytes">func BenchmarkMarshalBytes(b *testing.B)</a>

```
searchKey: json.BenchmarkMarshalBytes
```

```Go
func BenchmarkMarshalBytes(b *testing.B)
```

### <a id="BenchmarkCodeDecoder" href="#BenchmarkCodeDecoder">func BenchmarkCodeDecoder(b *testing.B)</a>

```
searchKey: json.BenchmarkCodeDecoder
```

```Go
func BenchmarkCodeDecoder(b *testing.B)
```

### <a id="BenchmarkUnicodeDecoder" href="#BenchmarkUnicodeDecoder">func BenchmarkUnicodeDecoder(b *testing.B)</a>

```
searchKey: json.BenchmarkUnicodeDecoder
```

```Go
func BenchmarkUnicodeDecoder(b *testing.B)
```

### <a id="BenchmarkDecoderStream" href="#BenchmarkDecoderStream">func BenchmarkDecoderStream(b *testing.B)</a>

```
searchKey: json.BenchmarkDecoderStream
```

```Go
func BenchmarkDecoderStream(b *testing.B)
```

### <a id="BenchmarkCodeUnmarshal" href="#BenchmarkCodeUnmarshal">func BenchmarkCodeUnmarshal(b *testing.B)</a>

```
searchKey: json.BenchmarkCodeUnmarshal
```

```Go
func BenchmarkCodeUnmarshal(b *testing.B)
```

### <a id="BenchmarkCodeUnmarshalReuse" href="#BenchmarkCodeUnmarshalReuse">func BenchmarkCodeUnmarshalReuse(b *testing.B)</a>

```
searchKey: json.BenchmarkCodeUnmarshalReuse
```

```Go
func BenchmarkCodeUnmarshalReuse(b *testing.B)
```

### <a id="BenchmarkUnmarshalString" href="#BenchmarkUnmarshalString">func BenchmarkUnmarshalString(b *testing.B)</a>

```
searchKey: json.BenchmarkUnmarshalString
```

```Go
func BenchmarkUnmarshalString(b *testing.B)
```

### <a id="BenchmarkUnmarshalFloat64" href="#BenchmarkUnmarshalFloat64">func BenchmarkUnmarshalFloat64(b *testing.B)</a>

```
searchKey: json.BenchmarkUnmarshalFloat64
```

```Go
func BenchmarkUnmarshalFloat64(b *testing.B)
```

### <a id="BenchmarkUnmarshalInt64" href="#BenchmarkUnmarshalInt64">func BenchmarkUnmarshalInt64(b *testing.B)</a>

```
searchKey: json.BenchmarkUnmarshalInt64
```

```Go
func BenchmarkUnmarshalInt64(b *testing.B)
```

### <a id="BenchmarkIssue10335" href="#BenchmarkIssue10335">func BenchmarkIssue10335(b *testing.B)</a>

```
searchKey: json.BenchmarkIssue10335
```

```Go
func BenchmarkIssue10335(b *testing.B)
```

### <a id="BenchmarkIssue34127" href="#BenchmarkIssue34127">func BenchmarkIssue34127(b *testing.B)</a>

```
searchKey: json.BenchmarkIssue34127
```

```Go
func BenchmarkIssue34127(b *testing.B)
```

### <a id="BenchmarkUnmapped" href="#BenchmarkUnmapped">func BenchmarkUnmapped(b *testing.B)</a>

```
searchKey: json.BenchmarkUnmapped
```

```Go
func BenchmarkUnmapped(b *testing.B)
```

### <a id="BenchmarkTypeFieldsCache" href="#BenchmarkTypeFieldsCache">func BenchmarkTypeFieldsCache(b *testing.B)</a>

```
searchKey: json.BenchmarkTypeFieldsCache
```

```Go
func BenchmarkTypeFieldsCache(b *testing.B)
```

### <a id="BenchmarkEncodeMarshaler" href="#BenchmarkEncodeMarshaler">func BenchmarkEncodeMarshaler(b *testing.B)</a>

```
searchKey: json.BenchmarkEncodeMarshaler
```

```Go
func BenchmarkEncodeMarshaler(b *testing.B)
```

### <a id="TestMarshal" href="#TestMarshal">func TestMarshal(t *testing.T)</a>

```
searchKey: json.TestMarshal
```

```Go
func TestMarshal(t *testing.T)
```

### <a id="TestMarshalBadUTF8" href="#TestMarshalBadUTF8">func TestMarshalBadUTF8(t *testing.T)</a>

```
searchKey: json.TestMarshalBadUTF8
```

```Go
func TestMarshalBadUTF8(t *testing.T)
```

### <a id="TestMarshalNumberZeroVal" href="#TestMarshalNumberZeroVal">func TestMarshalNumberZeroVal(t *testing.T)</a>

```
searchKey: json.TestMarshalNumberZeroVal
```

```Go
func TestMarshalNumberZeroVal(t *testing.T)
```

### <a id="TestMarshalEmbeds" href="#TestMarshalEmbeds">func TestMarshalEmbeds(t *testing.T)</a>

```
searchKey: json.TestMarshalEmbeds
```

```Go
func TestMarshalEmbeds(t *testing.T)
```

### <a id="equalError" href="#equalError">func equalError(a, b error) bool</a>

```
searchKey: json.equalError
```

```Go
func equalError(a, b error) bool
```

### <a id="TestUnmarshal" href="#TestUnmarshal">func TestUnmarshal(t *testing.T)</a>

```
searchKey: json.TestUnmarshal
```

```Go
func TestUnmarshal(t *testing.T)
```

### <a id="TestUnmarshalMarshal" href="#TestUnmarshalMarshal">func TestUnmarshalMarshal(t *testing.T)</a>

```
searchKey: json.TestUnmarshalMarshal
```

```Go
func TestUnmarshalMarshal(t *testing.T)
```

### <a id="TestNumberAccessors" href="#TestNumberAccessors">func TestNumberAccessors(t *testing.T)</a>

```
searchKey: json.TestNumberAccessors
```

```Go
func TestNumberAccessors(t *testing.T)
```

Independent of Decode, basic coverage of the accessors in Number 

### <a id="TestLargeByteSlice" href="#TestLargeByteSlice">func TestLargeByteSlice(t *testing.T)</a>

```
searchKey: json.TestLargeByteSlice
```

```Go
func TestLargeByteSlice(t *testing.T)
```

### <a id="TestUnmarshalInterface" href="#TestUnmarshalInterface">func TestUnmarshalInterface(t *testing.T)</a>

```
searchKey: json.TestUnmarshalInterface
```

```Go
func TestUnmarshalInterface(t *testing.T)
```

### <a id="TestUnmarshalPtrPtr" href="#TestUnmarshalPtrPtr">func TestUnmarshalPtrPtr(t *testing.T)</a>

```
searchKey: json.TestUnmarshalPtrPtr
```

```Go
func TestUnmarshalPtrPtr(t *testing.T)
```

### <a id="TestEscape" href="#TestEscape">func TestEscape(t *testing.T)</a>

```
searchKey: json.TestEscape
```

```Go
func TestEscape(t *testing.T)
```

### <a id="TestErrorMessageFromMisusedString" href="#TestErrorMessageFromMisusedString">func TestErrorMessageFromMisusedString(t *testing.T)</a>

```
searchKey: json.TestErrorMessageFromMisusedString
```

```Go
func TestErrorMessageFromMisusedString(t *testing.T)
```

If people misuse the ,string modifier, the error message should be helpful, telling the user that they're doing it wrong. 

### <a id="noSpace" href="#noSpace">func noSpace(c rune) rune</a>

```
searchKey: json.noSpace
```

```Go
func noSpace(c rune) rune
```

### <a id="TestRefUnmarshal" href="#TestRefUnmarshal">func TestRefUnmarshal(t *testing.T)</a>

```
searchKey: json.TestRefUnmarshal
```

```Go
func TestRefUnmarshal(t *testing.T)
```

### <a id="TestEmptyString" href="#TestEmptyString">func TestEmptyString(t *testing.T)</a>

```
searchKey: json.TestEmptyString
```

```Go
func TestEmptyString(t *testing.T)
```

Test that the empty string doesn't panic decoding when ,string is specified Issue 3450 

### <a id="TestNullString" href="#TestNullString">func TestNullString(t *testing.T)</a>

```
searchKey: json.TestNullString
```

```Go
func TestNullString(t *testing.T)
```

Test that a null for ,string is not replaced with the previous quoted string (issue 7046). It should also not be an error (issue 2540, issue 8587). 

### <a id="intp" href="#intp">func intp(x int) *int</a>

```
searchKey: json.intp
```

```Go
func intp(x int) *int
```

### <a id="intpp" href="#intpp">func intpp(x *int) **int</a>

```
searchKey: json.intpp
```

```Go
func intpp(x *int) **int
```

### <a id="TestInterfaceSet" href="#TestInterfaceSet">func TestInterfaceSet(t *testing.T)</a>

```
searchKey: json.TestInterfaceSet
```

```Go
func TestInterfaceSet(t *testing.T)
```

### <a id="TestUnmarshalNulls" href="#TestUnmarshalNulls">func TestUnmarshalNulls(t *testing.T)</a>

```
searchKey: json.TestUnmarshalNulls
```

```Go
func TestUnmarshalNulls(t *testing.T)
```

JSON null values should be ignored for primitives and string values instead of resulting in an error. Issue 2540 

### <a id="TestStringKind" href="#TestStringKind">func TestStringKind(t *testing.T)</a>

```
searchKey: json.TestStringKind
```

```Go
func TestStringKind(t *testing.T)
```

### <a id="TestByteKind" href="#TestByteKind">func TestByteKind(t *testing.T)</a>

```
searchKey: json.TestByteKind
```

```Go
func TestByteKind(t *testing.T)
```

Custom types with []byte as underlying type could not be marshaled and then unmarshaled. Issue 8962. 

### <a id="TestSliceOfCustomByte" href="#TestSliceOfCustomByte">func TestSliceOfCustomByte(t *testing.T)</a>

```
searchKey: json.TestSliceOfCustomByte
```

```Go
func TestSliceOfCustomByte(t *testing.T)
```

The fix for issue 8962 introduced a regression. Issue 12921. 

### <a id="TestUnmarshalTypeError" href="#TestUnmarshalTypeError">func TestUnmarshalTypeError(t *testing.T)</a>

```
searchKey: json.TestUnmarshalTypeError
```

```Go
func TestUnmarshalTypeError(t *testing.T)
```

### <a id="TestUnmarshalSyntax" href="#TestUnmarshalSyntax">func TestUnmarshalSyntax(t *testing.T)</a>

```
searchKey: json.TestUnmarshalSyntax
```

```Go
func TestUnmarshalSyntax(t *testing.T)
```

### <a id="TestUnmarshalUnexported" href="#TestUnmarshalUnexported">func TestUnmarshalUnexported(t *testing.T)</a>

```
searchKey: json.TestUnmarshalUnexported
```

```Go
func TestUnmarshalUnexported(t *testing.T)
```

### <a id="TestUnmarshalJSONLiteralError" href="#TestUnmarshalJSONLiteralError">func TestUnmarshalJSONLiteralError(t *testing.T)</a>

```
searchKey: json.TestUnmarshalJSONLiteralError
```

```Go
func TestUnmarshalJSONLiteralError(t *testing.T)
```

### <a id="TestSkipArrayObjects" href="#TestSkipArrayObjects">func TestSkipArrayObjects(t *testing.T)</a>

```
searchKey: json.TestSkipArrayObjects
```

```Go
func TestSkipArrayObjects(t *testing.T)
```

Test that extra object elements in an array do not result in a "data changing underfoot" error. Issue 3717 

### <a id="TestPrefilled" href="#TestPrefilled">func TestPrefilled(t *testing.T)</a>

```
searchKey: json.TestPrefilled
```

```Go
func TestPrefilled(t *testing.T)
```

Test semantics of pre-filled data, such as struct fields, map elements, slices, and arrays. Issues 4900 and 8837, among others. 

### <a id="TestInvalidUnmarshal" href="#TestInvalidUnmarshal">func TestInvalidUnmarshal(t *testing.T)</a>

```
searchKey: json.TestInvalidUnmarshal
```

```Go
func TestInvalidUnmarshal(t *testing.T)
```

### <a id="TestInvalidUnmarshalText" href="#TestInvalidUnmarshalText">func TestInvalidUnmarshalText(t *testing.T)</a>

```
searchKey: json.TestInvalidUnmarshalText
```

```Go
func TestInvalidUnmarshalText(t *testing.T)
```

### <a id="TestInvalidStringOption" href="#TestInvalidStringOption">func TestInvalidStringOption(t *testing.T)</a>

```
searchKey: json.TestInvalidStringOption
```

```Go
func TestInvalidStringOption(t *testing.T)
```

Test that string option is ignored for invalid types. Issue 9812. 

### <a id="TestUnmarshalEmbeddedUnexported" href="#TestUnmarshalEmbeddedUnexported">func TestUnmarshalEmbeddedUnexported(t *testing.T)</a>

```
searchKey: json.TestUnmarshalEmbeddedUnexported
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
```

```Go
func TestUnmarshalErrorAfterMultipleJSON(t *testing.T)
```

### <a id="TestUnmarshalPanic" href="#TestUnmarshalPanic">func TestUnmarshalPanic(t *testing.T)</a>

```
searchKey: json.TestUnmarshalPanic
```

```Go
func TestUnmarshalPanic(t *testing.T)
```

### <a id="TestUnmarshalRecursivePointer" href="#TestUnmarshalRecursivePointer">func TestUnmarshalRecursivePointer(t *testing.T)</a>

```
searchKey: json.TestUnmarshalRecursivePointer
```

```Go
func TestUnmarshalRecursivePointer(t *testing.T)
```

The decoder used to hang if decoding into an interface pointing to its own address. See golang.org/issues/31740. 

### <a id="TestUnmarshalMapWithTextUnmarshalerStringKey" href="#TestUnmarshalMapWithTextUnmarshalerStringKey">func TestUnmarshalMapWithTextUnmarshalerStringKey(t *testing.T)</a>

```
searchKey: json.TestUnmarshalMapWithTextUnmarshalerStringKey
```

```Go
func TestUnmarshalMapWithTextUnmarshalerStringKey(t *testing.T)
```

Test unmarshal to a map, where the map key is a user defined type. See golang.org/issues/34437. 

### <a id="TestUnmarshalRescanLiteralMangledUnquote" href="#TestUnmarshalRescanLiteralMangledUnquote">func TestUnmarshalRescanLiteralMangledUnquote(t *testing.T)</a>

```
searchKey: json.TestUnmarshalRescanLiteralMangledUnquote
```

```Go
func TestUnmarshalRescanLiteralMangledUnquote(t *testing.T)
```

### <a id="TestUnmarshalMaxDepth" href="#TestUnmarshalMaxDepth">func TestUnmarshalMaxDepth(t *testing.T)</a>

```
searchKey: json.TestUnmarshalMaxDepth
```

```Go
func TestUnmarshalMaxDepth(t *testing.T)
```

### <a id="TestOmitEmpty" href="#TestOmitEmpty">func TestOmitEmpty(t *testing.T)</a>

```
searchKey: json.TestOmitEmpty
```

```Go
func TestOmitEmpty(t *testing.T)
```

### <a id="TestRoundtripStringTag" href="#TestRoundtripStringTag">func TestRoundtripStringTag(t *testing.T)</a>

```
searchKey: json.TestRoundtripStringTag
```

```Go
func TestRoundtripStringTag(t *testing.T)
```

### <a id="TestEncodeRenamedByteSlice" href="#TestEncodeRenamedByteSlice">func TestEncodeRenamedByteSlice(t *testing.T)</a>

```
searchKey: json.TestEncodeRenamedByteSlice
```

```Go
func TestEncodeRenamedByteSlice(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: json.init
```

```Go
func init()
```

### <a id="TestSamePointerNoCycle" href="#TestSamePointerNoCycle">func TestSamePointerNoCycle(t *testing.T)</a>

```
searchKey: json.TestSamePointerNoCycle
```

```Go
func TestSamePointerNoCycle(t *testing.T)
```

### <a id="TestSliceNoCycle" href="#TestSliceNoCycle">func TestSliceNoCycle(t *testing.T)</a>

```
searchKey: json.TestSliceNoCycle
```

```Go
func TestSliceNoCycle(t *testing.T)
```

### <a id="TestUnsupportedValues" href="#TestUnsupportedValues">func TestUnsupportedValues(t *testing.T)</a>

```
searchKey: json.TestUnsupportedValues
```

```Go
func TestUnsupportedValues(t *testing.T)
```

### <a id="TestMarshalTextFloatMap" href="#TestMarshalTextFloatMap">func TestMarshalTextFloatMap(t *testing.T)</a>

```
searchKey: json.TestMarshalTextFloatMap
```

```Go
func TestMarshalTextFloatMap(t *testing.T)
```

Issue 43207 

### <a id="TestRefValMarshal" href="#TestRefValMarshal">func TestRefValMarshal(t *testing.T)</a>

```
searchKey: json.TestRefValMarshal
```

```Go
func TestRefValMarshal(t *testing.T)
```

### <a id="TestMarshalerEscaping" href="#TestMarshalerEscaping">func TestMarshalerEscaping(t *testing.T)</a>

```
searchKey: json.TestMarshalerEscaping
```

```Go
func TestMarshalerEscaping(t *testing.T)
```

### <a id="TestAnonymousFields" href="#TestAnonymousFields">func TestAnonymousFields(t *testing.T)</a>

```
searchKey: json.TestAnonymousFields
```

```Go
func TestAnonymousFields(t *testing.T)
```

### <a id="TestNilMarshal" href="#TestNilMarshal">func TestNilMarshal(t *testing.T)</a>

```
searchKey: json.TestNilMarshal
```

```Go
func TestNilMarshal(t *testing.T)
```

See golang.org/issue/16042 and golang.org/issue/34235. 

### <a id="TestEmbeddedBug" href="#TestEmbeddedBug">func TestEmbeddedBug(t *testing.T)</a>

```
searchKey: json.TestEmbeddedBug
```

```Go
func TestEmbeddedBug(t *testing.T)
```

Issue 5245. 

### <a id="TestTaggedFieldDominates" href="#TestTaggedFieldDominates">func TestTaggedFieldDominates(t *testing.T)</a>

```
searchKey: json.TestTaggedFieldDominates
```

```Go
func TestTaggedFieldDominates(t *testing.T)
```

Test that a field with a tag dominates untagged fields. 

### <a id="TestDuplicatedFieldDisappears" href="#TestDuplicatedFieldDisappears">func TestDuplicatedFieldDisappears(t *testing.T)</a>

```
searchKey: json.TestDuplicatedFieldDisappears
```

```Go
func TestDuplicatedFieldDisappears(t *testing.T)
```

### <a id="TestStringBytes" href="#TestStringBytes">func TestStringBytes(t *testing.T)</a>

```
searchKey: json.TestStringBytes
```

```Go
func TestStringBytes(t *testing.T)
```

### <a id="TestIssue10281" href="#TestIssue10281">func TestIssue10281(t *testing.T)</a>

```
searchKey: json.TestIssue10281
```

```Go
func TestIssue10281(t *testing.T)
```

### <a id="TestHTMLEscape" href="#TestHTMLEscape">func TestHTMLEscape(t *testing.T)</a>

```
searchKey: json.TestHTMLEscape
```

```Go
func TestHTMLEscape(t *testing.T)
```

### <a id="TestEncodePointerString" href="#TestEncodePointerString">func TestEncodePointerString(t *testing.T)</a>

```
searchKey: json.TestEncodePointerString
```

```Go
func TestEncodePointerString(t *testing.T)
```

golang.org/issue/8582 

### <a id="TestEncodeString" href="#TestEncodeString">func TestEncodeString(t *testing.T)</a>

```
searchKey: json.TestEncodeString
```

```Go
func TestEncodeString(t *testing.T)
```

### <a id="tenc" href="#tenc">func tenc(format string, a ...interface{}) ([]byte, error)</a>

```
searchKey: json.tenc
```

```Go
func tenc(format string, a ...interface{}) ([]byte, error)
```

### <a id="TestEncodeBytekind" href="#TestEncodeBytekind">func TestEncodeBytekind(t *testing.T)</a>

```
searchKey: json.TestEncodeBytekind
```

```Go
func TestEncodeBytekind(t *testing.T)
```

Issue 13783 

### <a id="TestTextMarshalerMapKeysAreSorted" href="#TestTextMarshalerMapKeysAreSorted">func TestTextMarshalerMapKeysAreSorted(t *testing.T)</a>

```
searchKey: json.TestTextMarshalerMapKeysAreSorted
```

```Go
func TestTextMarshalerMapKeysAreSorted(t *testing.T)
```

### <a id="TestNilMarshalerTextMapKey" href="#TestNilMarshalerTextMapKey">func TestNilMarshalerTextMapKey(t *testing.T)</a>

```
searchKey: json.TestNilMarshalerTextMapKey
```

```Go
func TestNilMarshalerTextMapKey(t *testing.T)
```

[https://golang.org/issue/33675](https://golang.org/issue/33675) 

### <a id="TestMarshalFloat" href="#TestMarshalFloat">func TestMarshalFloat(t *testing.T)</a>

```
searchKey: json.TestMarshalFloat
```

```Go
func TestMarshalFloat(t *testing.T)
```

### <a id="TestMarshalRawMessageValue" href="#TestMarshalRawMessageValue">func TestMarshalRawMessageValue(t *testing.T)</a>

```
searchKey: json.TestMarshalRawMessageValue
```

```Go
func TestMarshalRawMessageValue(t *testing.T)
```

### <a id="TestMarshalPanic" href="#TestMarshalPanic">func TestMarshalPanic(t *testing.T)</a>

```
searchKey: json.TestMarshalPanic
```

```Go
func TestMarshalPanic(t *testing.T)
```

### <a id="TestMarshalUncommonFieldNames" href="#TestMarshalUncommonFieldNames">func TestMarshalUncommonFieldNames(t *testing.T)</a>

```
searchKey: json.TestMarshalUncommonFieldNames
```

```Go
func TestMarshalUncommonFieldNames(t *testing.T)
```

### <a id="TestMarshalerError" href="#TestMarshalerError">func TestMarshalerError(t *testing.T)</a>

```
searchKey: json.TestMarshalerError
```

```Go
func TestMarshalerError(t *testing.T)
```

### <a id="TestFold" href="#TestFold">func TestFold(t *testing.T)</a>

```
searchKey: json.TestFold
```

```Go
func TestFold(t *testing.T)
```

### <a id="TestFoldAgainstUnicode" href="#TestFoldAgainstUnicode">func TestFoldAgainstUnicode(t *testing.T)</a>

```
searchKey: json.TestFoldAgainstUnicode
```

```Go
func TestFoldAgainstUnicode(t *testing.T)
```

### <a id="isASCIILetter" href="#isASCIILetter">func isASCIILetter(b byte) bool</a>

```
searchKey: json.isASCIILetter
```

```Go
func isASCIILetter(b byte) bool
```

### <a id="TestNumberIsValid" href="#TestNumberIsValid">func TestNumberIsValid(t *testing.T)</a>

```
searchKey: json.TestNumberIsValid
```

```Go
func TestNumberIsValid(t *testing.T)
```

### <a id="BenchmarkNumberIsValid" href="#BenchmarkNumberIsValid">func BenchmarkNumberIsValid(b *testing.B)</a>

```
searchKey: json.BenchmarkNumberIsValid
```

```Go
func BenchmarkNumberIsValid(b *testing.B)
```

### <a id="BenchmarkNumberIsValidRegexp" href="#BenchmarkNumberIsValidRegexp">func BenchmarkNumberIsValidRegexp(b *testing.B)</a>

```
searchKey: json.BenchmarkNumberIsValidRegexp
```

```Go
func BenchmarkNumberIsValidRegexp(b *testing.B)
```

### <a id="TestValid" href="#TestValid">func TestValid(t *testing.T)</a>

```
searchKey: json.TestValid
```

```Go
func TestValid(t *testing.T)
```

### <a id="TestCompact" href="#TestCompact">func TestCompact(t *testing.T)</a>

```
searchKey: json.TestCompact
```

```Go
func TestCompact(t *testing.T)
```

### <a id="TestCompactSeparators" href="#TestCompactSeparators">func TestCompactSeparators(t *testing.T)</a>

```
searchKey: json.TestCompactSeparators
```

```Go
func TestCompactSeparators(t *testing.T)
```

### <a id="TestIndent" href="#TestIndent">func TestIndent(t *testing.T)</a>

```
searchKey: json.TestIndent
```

```Go
func TestIndent(t *testing.T)
```

### <a id="TestCompactBig" href="#TestCompactBig">func TestCompactBig(t *testing.T)</a>

```
searchKey: json.TestCompactBig
```

```Go
func TestCompactBig(t *testing.T)
```

### <a id="TestIndentBig" href="#TestIndentBig">func TestIndentBig(t *testing.T)</a>

```
searchKey: json.TestIndentBig
```

```Go
func TestIndentBig(t *testing.T)
```

### <a id="TestIndentErrors" href="#TestIndentErrors">func TestIndentErrors(t *testing.T)</a>

```
searchKey: json.TestIndentErrors
```

```Go
func TestIndentErrors(t *testing.T)
```

### <a id="diff" href="#diff">func diff(t *testing.T, a, b []byte)</a>

```
searchKey: json.diff
```

```Go
func diff(t *testing.T, a, b []byte)
```

### <a id="trim" href="#trim">func trim(b []byte) []byte</a>

```
searchKey: json.trim
```

```Go
func trim(b []byte) []byte
```

### <a id="initBig" href="#initBig">func initBig()</a>

```
searchKey: json.initBig
```

```Go
func initBig()
```

### <a id="genValue" href="#genValue">func genValue(n int) interface{}</a>

```
searchKey: json.genValue
```

```Go
func genValue(n int) interface{}
```

### <a id="genString" href="#genString">func genString(stddev float64) string</a>

```
searchKey: json.genString
```

```Go
func genString(stddev float64) string
```

### <a id="genArray" href="#genArray">func genArray(n int) []interface{}</a>

```
searchKey: json.genArray
```

```Go
func genArray(n int) []interface{}
```

### <a id="genMap" href="#genMap">func genMap(n int) map[string]interface{}</a>

```
searchKey: json.genMap
```

```Go
func genMap(n int) map[string]interface{}
```

### <a id="TestEncoder" href="#TestEncoder">func TestEncoder(t *testing.T)</a>

```
searchKey: json.TestEncoder
```

```Go
func TestEncoder(t *testing.T)
```

### <a id="TestEncoderIndent" href="#TestEncoderIndent">func TestEncoderIndent(t *testing.T)</a>

```
searchKey: json.TestEncoderIndent
```

```Go
func TestEncoderIndent(t *testing.T)
```

### <a id="TestEncoderSetEscapeHTML" href="#TestEncoderSetEscapeHTML">func TestEncoderSetEscapeHTML(t *testing.T)</a>

```
searchKey: json.TestEncoderSetEscapeHTML
```

```Go
func TestEncoderSetEscapeHTML(t *testing.T)
```

### <a id="TestDecoder" href="#TestDecoder">func TestDecoder(t *testing.T)</a>

```
searchKey: json.TestDecoder
```

```Go
func TestDecoder(t *testing.T)
```

### <a id="TestDecoderBuffered" href="#TestDecoderBuffered">func TestDecoderBuffered(t *testing.T)</a>

```
searchKey: json.TestDecoderBuffered
```

```Go
func TestDecoderBuffered(t *testing.T)
```

### <a id="nlines" href="#nlines">func nlines(s string, n int) string</a>

```
searchKey: json.nlines
```

```Go
func nlines(s string, n int) string
```

### <a id="TestRawMessage" href="#TestRawMessage">func TestRawMessage(t *testing.T)</a>

```
searchKey: json.TestRawMessage
```

```Go
func TestRawMessage(t *testing.T)
```

### <a id="TestNullRawMessage" href="#TestNullRawMessage">func TestNullRawMessage(t *testing.T)</a>

```
searchKey: json.TestNullRawMessage
```

```Go
func TestNullRawMessage(t *testing.T)
```

### <a id="TestBlocking" href="#TestBlocking">func TestBlocking(t *testing.T)</a>

```
searchKey: json.TestBlocking
```

```Go
func TestBlocking(t *testing.T)
```

### <a id="BenchmarkEncoderEncode" href="#BenchmarkEncoderEncode">func BenchmarkEncoderEncode(b *testing.B)</a>

```
searchKey: json.BenchmarkEncoderEncode
```

```Go
func BenchmarkEncoderEncode(b *testing.B)
```

### <a id="TestDecodeInStream" href="#TestDecodeInStream">func TestDecodeInStream(t *testing.T)</a>

```
searchKey: json.TestDecodeInStream
```

```Go
func TestDecodeInStream(t *testing.T)
```

### <a id="TestHTTPDecoding" href="#TestHTTPDecoding">func TestHTTPDecoding(t *testing.T)</a>

```
searchKey: json.TestHTTPDecoding
```

```Go
func TestHTTPDecoding(t *testing.T)
```

Test from golang.org/issue/11893 

### <a id="TestStructTagObjectKey" href="#TestStructTagObjectKey">func TestStructTagObjectKey(t *testing.T)</a>

```
searchKey: json.TestStructTagObjectKey
```

```Go
func TestStructTagObjectKey(t *testing.T)
```

### <a id="TestTagParsing" href="#TestTagParsing">func TestTagParsing(t *testing.T)</a>

```
searchKey: json.TestTagParsing
```

```Go
func TestTagParsing(t *testing.T)
```

