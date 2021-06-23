# Package asn1

Package asn1 implements parsing of DER-encoded ASN.1 data structures, as defined in ITU-T Rec X.690. 

See also `A Layman's Guide to a Subset of ASN.1, BER, and DER,' [http://luca.ntop.org/Teaching/Appunti/asn1.html](http://luca.ntop.org/Teaching/Appunti/asn1.html). 

## Index

* [Constants](#const)
    * [const allowAsterisk](#allowAsterisk)
    * [const rejectAsterisk](#rejectAsterisk)
    * [const allowAmpersand](#allowAmpersand)
    * [const rejectAmpersand](#rejectAmpersand)
    * [const TagBoolean](#TagBoolean)
    * [const TagInteger](#TagInteger)
    * [const TagBitString](#TagBitString)
    * [const TagOctetString](#TagOctetString)
    * [const TagNull](#TagNull)
    * [const TagOID](#TagOID)
    * [const TagEnum](#TagEnum)
    * [const TagUTF8String](#TagUTF8String)
    * [const TagSequence](#TagSequence)
    * [const TagSet](#TagSet)
    * [const TagNumericString](#TagNumericString)
    * [const TagPrintableString](#TagPrintableString)
    * [const TagT61String](#TagT61String)
    * [const TagIA5String](#TagIA5String)
    * [const TagUTCTime](#TagUTCTime)
    * [const TagGeneralizedTime](#TagGeneralizedTime)
    * [const TagGeneralString](#TagGeneralString)
    * [const TagBMPString](#TagBMPString)
    * [const ClassUniversal](#ClassUniversal)
    * [const ClassApplication](#ClassApplication)
    * [const ClassContextSpecific](#ClassContextSpecific)
    * [const ClassPrivate](#ClassPrivate)
* [Variables](#var)
    * [var bigOne](#bigOne)
    * [var NullRawValue](#NullRawValue)
    * [var NullBytes](#NullBytes)
    * [var bitStringType](#bitStringType)
    * [var objectIdentifierType](#objectIdentifierType)
    * [var enumeratedType](#enumeratedType)
    * [var flagType](#flagType)
    * [var timeType](#timeType)
    * [var rawValueType](#rawValueType)
    * [var rawContentsType](#rawContentsType)
    * [var bigIntType](#bigIntType)
    * [var byte00Encoder](#byte00Encoder)
    * [var byteFFEncoder](#byteFFEncoder)
    * [var boolTestData](#boolTestData)
    * [var int64TestData](#int64TestData)
    * [var int32TestData](#int32TestData)
    * [var bigIntTests](#bigIntTests)
    * [var bitStringTestData](#bitStringTestData)
    * [var bitStringRightAlignTests](#bitStringRightAlignTests)
    * [var objectIdentifierTestData](#objectIdentifierTestData)
    * [var utcTestData](#utcTestData)
    * [var generalizedTimeTestData](#generalizedTimeTestData)
    * [var tagAndLengthData](#tagAndLengthData)
    * [var parseFieldParametersTestData](#parseFieldParametersTestData)
    * [var unmarshalTestData](#unmarshalTestData)
    * [var oiEqualTests](#oiEqualTests)
    * [var derEncodedSelfSignedCert](#derEncodedSelfSignedCert)
    * [var derEncodedSelfSignedCertBytes](#derEncodedSelfSignedCertBytes)
    * [var derEncodedPaypalNULCertBytes](#derEncodedPaypalNULCertBytes)
    * [var stringSliceTestData](#stringSliceTestData)
    * [var explicitTaggedTimeTestData](#explicitTaggedTimeTestData)
    * [var bmpStringTests](#bmpStringTests)
    * [var PST](#PST)
    * [var marshalTests](#marshalTests)
    * [var marshalWithParamsTests](#marshalWithParamsTests)
    * [var marshalErrTests](#marshalErrTests)
* [Types](#type)
    * [type StructuralError struct](#StructuralError)
        * [func (e StructuralError) Error() string](#StructuralError.Error)
    * [type SyntaxError struct](#SyntaxError)
        * [func (e SyntaxError) Error() string](#SyntaxError.Error)
    * [type BitString struct](#BitString)
        * [func parseBitString(bytes []byte) (ret BitString, err error)](#parseBitString)
        * [func (b BitString) At(i int) int](#BitString.At)
        * [func (b BitString) RightAlign() []byte](#BitString.RightAlign)
    * [type ObjectIdentifier []int](#ObjectIdentifier)
        * [func parseObjectIdentifier(bytes []byte) (s ObjectIdentifier, err error)](#parseObjectIdentifier)
        * [func (oi ObjectIdentifier) Equal(other ObjectIdentifier) bool](#ObjectIdentifier.Equal)
        * [func (oi ObjectIdentifier) String() string](#ObjectIdentifier.String)
    * [type Enumerated int](#Enumerated)
    * [type Flag bool](#Flag)
    * [type asteriskFlag bool](#asteriskFlag)
    * [type ampersandFlag bool](#ampersandFlag)
    * [type RawValue struct](#RawValue)
    * [type RawContent []byte](#RawContent)
    * [type invalidUnmarshalError struct](#invalidUnmarshalError)
        * [func (e *invalidUnmarshalError) Error() string](#invalidUnmarshalError.Error)
    * [type tagAndLength struct](#tagAndLength)
        * [func parseTagAndLength(bytes []byte, initOffset int) (ret tagAndLength, offset int, err error)](#parseTagAndLength)
    * [type fieldParameters struct](#fieldParameters)
        * [func parseFieldParameters(str string) (ret fieldParameters)](#parseFieldParameters)
    * [type encoder interface](#encoder)
        * [func makeBigInt(n *big.Int) (encoder, error)](#makeBigInt)
        * [func makeObjectIdentifier(oid []int) (e encoder, err error)](#makeObjectIdentifier)
        * [func makePrintableString(s string) (e encoder, err error)](#makePrintableString)
        * [func makeIA5String(s string) (e encoder, err error)](#makeIA5String)
        * [func makeNumericString(s string) (e encoder, err error)](#makeNumericString)
        * [func makeUTF8String(s string) encoder](#makeUTF8String)
        * [func makeUTCTime(t time.Time) (e encoder, err error)](#makeUTCTime)
        * [func makeGeneralizedTime(t time.Time) (e encoder, err error)](#makeGeneralizedTime)
        * [func makeBody(value reflect.Value, params fieldParameters) (e encoder, err error)](#makeBody)
        * [func makeField(v reflect.Value, params fieldParameters) (e encoder, err error)](#makeField)
    * [type byteEncoder byte](#byteEncoder)
        * [func (c byteEncoder) Len() int](#byteEncoder.Len)
        * [func (c byteEncoder) Encode(dst []byte)](#byteEncoder.Encode)
    * [type bytesEncoder []byte](#bytesEncoder)
        * [func (b bytesEncoder) Len() int](#bytesEncoder.Len)
        * [func (b bytesEncoder) Encode(dst []byte)](#bytesEncoder.Encode)
    * [type stringEncoder string](#stringEncoder)
        * [func (s stringEncoder) Len() int](#stringEncoder.Len)
        * [func (s stringEncoder) Encode(dst []byte)](#stringEncoder.Encode)
    * [type multiEncoder []asn1.encoder](#multiEncoder)
        * [func (m multiEncoder) Len() int](#multiEncoder.Len)
        * [func (m multiEncoder) Encode(dst []byte)](#multiEncoder.Encode)
    * [type setEncoder []asn1.encoder](#setEncoder)
        * [func (s setEncoder) Len() int](#setEncoder.Len)
        * [func (s setEncoder) Encode(dst []byte)](#setEncoder.Encode)
    * [type taggedEncoder struct](#taggedEncoder)
        * [func (t *taggedEncoder) Len() int](#taggedEncoder.Len)
        * [func (t *taggedEncoder) Encode(dst []byte)](#taggedEncoder.Encode)
    * [type int64Encoder int64](#int64Encoder)
        * [func (i int64Encoder) Len() int](#int64Encoder.Len)
        * [func (i int64Encoder) Encode(dst []byte)](#int64Encoder.Encode)
    * [type bitStringEncoder asn1.BitString](#bitStringEncoder)
        * [func (b bitStringEncoder) Len() int](#bitStringEncoder.Len)
        * [func (b bitStringEncoder) Encode(dst []byte)](#bitStringEncoder.Encode)
    * [type oidEncoder []int](#oidEncoder)
        * [func (oid oidEncoder) Len() int](#oidEncoder.Len)
        * [func (oid oidEncoder) Encode(dst []byte)](#oidEncoder.Encode)
    * [type boolTest struct](#boolTest)
    * [type int64Test struct](#int64Test)
    * [type int32Test struct](#int32Test)
    * [type bitStringTest struct](#bitStringTest)
    * [type bitStringRightAlignTest struct](#bitStringRightAlignTest)
    * [type objectIdentifierTest struct](#objectIdentifierTest)
    * [type timeTest struct](#timeTest)
    * [type tagAndLengthTest struct](#tagAndLengthTest)
    * [type parseFieldParametersTest struct](#parseFieldParametersTest)
    * [type TestObjectIdentifierStruct struct](#TestObjectIdentifierStruct)
    * [type TestContextSpecificTags struct](#TestContextSpecificTags)
    * [type TestContextSpecificTags2 struct](#TestContextSpecificTags2)
    * [type TestContextSpecificTags3 struct](#TestContextSpecificTags3)
    * [type TestElementsAfterString struct](#TestElementsAfterString)
    * [type TestBigInt struct](#TestBigInt)
    * [type TestSet struct](#TestSet)
    * [type Certificate struct](#Certificate)
    * [type TBSCertificate struct](#TBSCertificate)
    * [type AlgorithmIdentifier struct](#AlgorithmIdentifier)
    * [type RDNSequence []asn1.RelativeDistinguishedNameSET](#RDNSequence)
    * [type RelativeDistinguishedNameSET []asn1.AttributeTypeAndValue](#RelativeDistinguishedNameSET)
    * [type AttributeTypeAndValue struct](#AttributeTypeAndValue)
    * [type Validity struct](#Validity)
    * [type PublicKeyInfo struct](#PublicKeyInfo)
    * [type rawStructTest struct](#rawStructTest)
    * [type oiEqualTest struct](#oiEqualTest)
    * [type explicitTaggedTimeTest struct](#explicitTaggedTimeTest)
    * [type implicitTaggedTimeTest struct](#implicitTaggedTimeTest)
    * [type truncatedExplicitTagTest struct](#truncatedExplicitTagTest)
    * [type invalidUTF8Test struct](#invalidUTF8Test)
    * [type unexported struct](#unexported)
    * [type exported struct](#exported)
    * [type intStruct struct](#intStruct)
    * [type twoIntStruct struct](#twoIntStruct)
    * [type bigIntStruct struct](#bigIntStruct)
    * [type nestedStruct struct](#nestedStruct)
    * [type rawContentsStruct struct](#rawContentsStruct)
    * [type implicitTagTest struct](#implicitTagTest)
    * [type explicitTagTest struct](#explicitTagTest)
    * [type flagTest struct](#flagTest)
    * [type generalizedTimeTest struct](#generalizedTimeTest)
    * [type ia5StringTest struct](#ia5StringTest)
    * [type printableStringTest struct](#printableStringTest)
    * [type genericStringTest struct](#genericStringTest)
    * [type optionalRawValueTest struct](#optionalRawValueTest)
    * [type omitEmptyTest struct](#omitEmptyTest)
    * [type defaultTest struct](#defaultTest)
    * [type applicationTest struct](#applicationTest)
    * [type privateTest struct](#privateTest)
    * [type numericStringTest struct](#numericStringTest)
    * [type testSET []int](#testSET)
    * [type marshalTest struct](#marshalTest)
    * [type marshalWithParamsTest struct](#marshalWithParamsTest)
    * [type marshalErrTest struct](#marshalErrTest)
* [Functions](#func)
    * [func parseBool(bytes []byte) (ret bool, err error)](#parseBool)
    * [func checkInteger(bytes []byte) error](#checkInteger)
    * [func parseInt64(bytes []byte) (ret int64, err error)](#parseInt64)
    * [func parseInt32(bytes []byte) (int32, error)](#parseInt32)
    * [func parseBigInt(bytes []byte) (*big.Int, error)](#parseBigInt)
    * [func parseBase128Int(bytes []byte, initOffset int) (ret, offset int, err error)](#parseBase128Int)
    * [func parseUTCTime(bytes []byte) (ret time.Time, err error)](#parseUTCTime)
    * [func parseGeneralizedTime(bytes []byte) (ret time.Time, err error)](#parseGeneralizedTime)
    * [func parseNumericString(bytes []byte) (ret string, err error)](#parseNumericString)
    * [func isNumeric(b byte) bool](#isNumeric)
    * [func parsePrintableString(bytes []byte) (ret string, err error)](#parsePrintableString)
    * [func isPrintable(b byte, asterisk asteriskFlag, ampersand ampersandFlag) bool](#isPrintable)
    * [func parseIA5String(bytes []byte) (ret string, err error)](#parseIA5String)
    * [func parseT61String(bytes []byte) (ret string, err error)](#parseT61String)
    * [func parseUTF8String(bytes []byte) (ret string, err error)](#parseUTF8String)
    * [func parseBMPString(bmpString []byte) (string, error)](#parseBMPString)
    * [func parseSequenceOf(bytes []byte, sliceType reflect.Type, elemType reflect.Type) (ret reflect.Value, err error)](#parseSequenceOf)
    * [func invalidLength(offset, length, sliceLength int) bool](#invalidLength)
    * [func parseField(v reflect.Value, bytes []byte, initOffset int, params fieldParameters) (offset int, err error)](#parseField)
    * [func canHaveDefaultValue(k reflect.Kind) bool](#canHaveDefaultValue)
    * [func setDefaultValue(v reflect.Value, params fieldParameters) (ok bool)](#setDefaultValue)
    * [func Unmarshal(b []byte, val interface{}) (rest []byte, err error)](#Unmarshal)
    * [func UnmarshalWithParams(b []byte, val interface{}, params string) (rest []byte, err error)](#UnmarshalWithParams)
    * [func getUniversalType(t reflect.Type) (matchAny bool, tagNumber int, isCompound, ok bool)](#getUniversalType)
    * [func base128IntLength(n int64) int](#base128IntLength)
    * [func appendBase128Int(dst []byte, n int64) []byte](#appendBase128Int)
    * [func appendLength(dst []byte, i int) []byte](#appendLength)
    * [func lengthLength(i int) (numBytes int)](#lengthLength)
    * [func appendTagAndLength(dst []byte, t tagAndLength) []byte](#appendTagAndLength)
    * [func appendTwoDigits(dst []byte, v int) []byte](#appendTwoDigits)
    * [func appendFourDigits(dst []byte, v int) []byte](#appendFourDigits)
    * [func outsideUTCRange(t time.Time) bool](#outsideUTCRange)
    * [func appendUTCTime(dst []byte, t time.Time) (ret []byte, err error)](#appendUTCTime)
    * [func appendGeneralizedTime(dst []byte, t time.Time) (ret []byte, err error)](#appendGeneralizedTime)
    * [func appendTimeCommon(dst []byte, t time.Time) []byte](#appendTimeCommon)
    * [func stripTagAndLength(in []byte) []byte](#stripTagAndLength)
    * [func Marshal(val interface{}) ([]byte, error)](#Marshal)
    * [func MarshalWithParams(val interface{}, params string) ([]byte, error)](#MarshalWithParams)
    * [func TestParseBool(t *testing.T)](#TestParseBool)
    * [func TestParseInt64(t *testing.T)](#TestParseInt64)
    * [func TestParseInt32(t *testing.T)](#TestParseInt32)
    * [func TestParseBigInt(t *testing.T)](#TestParseBigInt)
    * [func TestBitString(t *testing.T)](#TestBitString)
    * [func TestBitStringAt(t *testing.T)](#TestBitStringAt)
    * [func TestBitStringRightAlign(t *testing.T)](#TestBitStringRightAlign)
    * [func TestObjectIdentifier(t *testing.T)](#TestObjectIdentifier)
    * [func TestUTCTime(t *testing.T)](#TestUTCTime)
    * [func TestGeneralizedTime(t *testing.T)](#TestGeneralizedTime)
    * [func TestParseTagAndLength(t *testing.T)](#TestParseTagAndLength)
    * [func newInt(n int) *int](#newInt)
    * [func newInt64(n int64) *int64](#newInt64)
    * [func newString(s string) *string](#newString)
    * [func newBool(b bool) *bool](#newBool)
    * [func TestParseFieldParameters(t *testing.T)](#TestParseFieldParameters)
    * [func TestUnmarshal(t *testing.T)](#TestUnmarshal)
    * [func TestUnmarshalWithNilOrNonPointer(t *testing.T)](#TestUnmarshalWithNilOrNonPointer)
    * [func TestCertificate(t *testing.T)](#TestCertificate)
    * [func TestCertificateWithNUL(t *testing.T)](#TestCertificateWithNUL)
    * [func TestRawStructs(t *testing.T)](#TestRawStructs)
    * [func TestObjectIdentifierEqual(t *testing.T)](#TestObjectIdentifierEqual)
    * [func TestStringSlice(t *testing.T)](#TestStringSlice)
    * [func TestExplicitTaggedTime(t *testing.T)](#TestExplicitTaggedTime)
    * [func TestImplicitTaggedTime(t *testing.T)](#TestImplicitTaggedTime)
    * [func TestTruncatedExplicitTag(t *testing.T)](#TestTruncatedExplicitTag)
    * [func TestUnmarshalInvalidUTF8(t *testing.T)](#TestUnmarshalInvalidUTF8)
    * [func TestMarshalNilValue(t *testing.T)](#TestMarshalNilValue)
    * [func TestUnexportedStructField(t *testing.T)](#TestUnexportedStructField)
    * [func TestNull(t *testing.T)](#TestNull)
    * [func TestExplicitTagRawValueStruct(t *testing.T)](#TestExplicitTagRawValueStruct)
    * [func TestTaggedRawValue(t *testing.T)](#TestTaggedRawValue)
    * [func TestBMPString(t *testing.T)](#TestBMPString)
    * [func TestNonMinimalEncodedOID(t *testing.T)](#TestNonMinimalEncodedOID)
    * [func farFuture() time.Time](#farFuture)
    * [func TestMarshal(t *testing.T)](#TestMarshal)
    * [func TestMarshalWithParams(t *testing.T)](#TestMarshalWithParams)
    * [func TestMarshalError(t *testing.T)](#TestMarshalError)
    * [func TestInvalidUTF8(t *testing.T)](#TestInvalidUTF8)
    * [func TestMarshalOID(t *testing.T)](#TestMarshalOID)
    * [func TestIssue11130(t *testing.T)](#TestIssue11130)
    * [func BenchmarkMarshal(b *testing.B)](#BenchmarkMarshal)
    * [func TestSetEncoder(t *testing.T)](#TestSetEncoder)
    * [func TestSetEncoderSETSliceSuffix(t *testing.T)](#TestSetEncoderSETSliceSuffix)
    * [func BenchmarkUnmarshal(b *testing.B)](#BenchmarkUnmarshal)


## <a id="const" href="#const">Constants</a>

### <a id="allowAsterisk" href="#allowAsterisk">const allowAsterisk</a>

```
searchKey: asn1.allowAsterisk
tags: [private]
```

```Go
const allowAsterisk asteriskFlag = true
```

### <a id="rejectAsterisk" href="#rejectAsterisk">const rejectAsterisk</a>

```
searchKey: asn1.rejectAsterisk
tags: [private]
```

```Go
const rejectAsterisk asteriskFlag = false
```

### <a id="allowAmpersand" href="#allowAmpersand">const allowAmpersand</a>

```
searchKey: asn1.allowAmpersand
tags: [private]
```

```Go
const allowAmpersand ampersandFlag = true
```

### <a id="rejectAmpersand" href="#rejectAmpersand">const rejectAmpersand</a>

```
searchKey: asn1.rejectAmpersand
tags: [private]
```

```Go
const rejectAmpersand ampersandFlag = false
```

### <a id="TagBoolean" href="#TagBoolean">const TagBoolean</a>

```
searchKey: asn1.TagBoolean
```

```Go
const TagBoolean = 1
```

ASN.1 tags represent the type of the following object. 

### <a id="TagInteger" href="#TagInteger">const TagInteger</a>

```
searchKey: asn1.TagInteger
```

```Go
const TagInteger = 2
```

ASN.1 tags represent the type of the following object. 

### <a id="TagBitString" href="#TagBitString">const TagBitString</a>

```
searchKey: asn1.TagBitString
```

```Go
const TagBitString = 3
```

ASN.1 tags represent the type of the following object. 

### <a id="TagOctetString" href="#TagOctetString">const TagOctetString</a>

```
searchKey: asn1.TagOctetString
```

```Go
const TagOctetString = 4
```

ASN.1 tags represent the type of the following object. 

### <a id="TagNull" href="#TagNull">const TagNull</a>

```
searchKey: asn1.TagNull
```

```Go
const TagNull = 5
```

ASN.1 tags represent the type of the following object. 

### <a id="TagOID" href="#TagOID">const TagOID</a>

```
searchKey: asn1.TagOID
```

```Go
const TagOID = 6
```

ASN.1 tags represent the type of the following object. 

### <a id="TagEnum" href="#TagEnum">const TagEnum</a>

```
searchKey: asn1.TagEnum
```

```Go
const TagEnum = 10
```

ASN.1 tags represent the type of the following object. 

### <a id="TagUTF8String" href="#TagUTF8String">const TagUTF8String</a>

```
searchKey: asn1.TagUTF8String
```

```Go
const TagUTF8String = 12
```

ASN.1 tags represent the type of the following object. 

### <a id="TagSequence" href="#TagSequence">const TagSequence</a>

```
searchKey: asn1.TagSequence
```

```Go
const TagSequence = 16
```

ASN.1 tags represent the type of the following object. 

### <a id="TagSet" href="#TagSet">const TagSet</a>

```
searchKey: asn1.TagSet
```

```Go
const TagSet = 17
```

ASN.1 tags represent the type of the following object. 

### <a id="TagNumericString" href="#TagNumericString">const TagNumericString</a>

```
searchKey: asn1.TagNumericString
```

```Go
const TagNumericString = 18
```

ASN.1 tags represent the type of the following object. 

### <a id="TagPrintableString" href="#TagPrintableString">const TagPrintableString</a>

```
searchKey: asn1.TagPrintableString
```

```Go
const TagPrintableString = 19
```

ASN.1 tags represent the type of the following object. 

### <a id="TagT61String" href="#TagT61String">const TagT61String</a>

```
searchKey: asn1.TagT61String
```

```Go
const TagT61String = 20
```

ASN.1 tags represent the type of the following object. 

### <a id="TagIA5String" href="#TagIA5String">const TagIA5String</a>

```
searchKey: asn1.TagIA5String
```

```Go
const TagIA5String = 22
```

ASN.1 tags represent the type of the following object. 

### <a id="TagUTCTime" href="#TagUTCTime">const TagUTCTime</a>

```
searchKey: asn1.TagUTCTime
```

```Go
const TagUTCTime = 23
```

ASN.1 tags represent the type of the following object. 

### <a id="TagGeneralizedTime" href="#TagGeneralizedTime">const TagGeneralizedTime</a>

```
searchKey: asn1.TagGeneralizedTime
```

```Go
const TagGeneralizedTime = 24
```

ASN.1 tags represent the type of the following object. 

### <a id="TagGeneralString" href="#TagGeneralString">const TagGeneralString</a>

```
searchKey: asn1.TagGeneralString
```

```Go
const TagGeneralString = 27
```

ASN.1 tags represent the type of the following object. 

### <a id="TagBMPString" href="#TagBMPString">const TagBMPString</a>

```
searchKey: asn1.TagBMPString
```

```Go
const TagBMPString = 30
```

ASN.1 tags represent the type of the following object. 

### <a id="ClassUniversal" href="#ClassUniversal">const ClassUniversal</a>

```
searchKey: asn1.ClassUniversal
```

```Go
const ClassUniversal = 0
```

ASN.1 class types represent the namespace of the tag. 

### <a id="ClassApplication" href="#ClassApplication">const ClassApplication</a>

```
searchKey: asn1.ClassApplication
```

```Go
const ClassApplication = 1
```

ASN.1 class types represent the namespace of the tag. 

### <a id="ClassContextSpecific" href="#ClassContextSpecific">const ClassContextSpecific</a>

```
searchKey: asn1.ClassContextSpecific
```

```Go
const ClassContextSpecific = 2
```

ASN.1 class types represent the namespace of the tag. 

### <a id="ClassPrivate" href="#ClassPrivate">const ClassPrivate</a>

```
searchKey: asn1.ClassPrivate
```

```Go
const ClassPrivate = 3
```

ASN.1 class types represent the namespace of the tag. 

## <a id="var" href="#var">Variables</a>

### <a id="bigOne" href="#bigOne">var bigOne</a>

```
searchKey: asn1.bigOne
tags: [private]
```

```Go
var bigOne = big.NewInt(1)
```

### <a id="NullRawValue" href="#NullRawValue">var NullRawValue</a>

```
searchKey: asn1.NullRawValue
```

```Go
var NullRawValue = RawValue{Tag: TagNull}
```

NullRawValue is a RawValue with its Tag set to the ASN.1 NULL type tag (5). 

### <a id="NullBytes" href="#NullBytes">var NullBytes</a>

```
searchKey: asn1.NullBytes
```

```Go
var NullBytes = []byte{TagNull, 0}
```

NullBytes contains bytes representing the DER-encoded ASN.1 NULL type. 

### <a id="bitStringType" href="#bitStringType">var bitStringType</a>

```
searchKey: asn1.bitStringType
tags: [private]
```

```Go
var bitStringType = reflect.TypeOf(BitString{})
```

### <a id="objectIdentifierType" href="#objectIdentifierType">var objectIdentifierType</a>

```
searchKey: asn1.objectIdentifierType
tags: [private]
```

```Go
var objectIdentifierType = reflect.TypeOf(ObjectIdentifier{})
```

### <a id="enumeratedType" href="#enumeratedType">var enumeratedType</a>

```
searchKey: asn1.enumeratedType
tags: [private]
```

```Go
var enumeratedType = reflect.TypeOf(Enumerated(0))
```

### <a id="flagType" href="#flagType">var flagType</a>

```
searchKey: asn1.flagType
tags: [private]
```

```Go
var flagType = reflect.TypeOf(Flag(false))
```

### <a id="timeType" href="#timeType">var timeType</a>

```
searchKey: asn1.timeType
tags: [private]
```

```Go
var timeType = reflect.TypeOf(time.Time{})
```

### <a id="rawValueType" href="#rawValueType">var rawValueType</a>

```
searchKey: asn1.rawValueType
tags: [private]
```

```Go
var rawValueType = reflect.TypeOf(RawValue{})
```

### <a id="rawContentsType" href="#rawContentsType">var rawContentsType</a>

```
searchKey: asn1.rawContentsType
tags: [private]
```

```Go
var rawContentsType = reflect.TypeOf(RawContent(nil))
```

### <a id="bigIntType" href="#bigIntType">var bigIntType</a>

```
searchKey: asn1.bigIntType
tags: [private]
```

```Go
var bigIntType = reflect.TypeOf(new(big.Int))
```

### <a id="byte00Encoder" href="#byte00Encoder">var byte00Encoder</a>

```
searchKey: asn1.byte00Encoder
tags: [private]
```

```Go
var byte00Encoder encoder = byteEncoder(0x00)
```

### <a id="byteFFEncoder" href="#byteFFEncoder">var byteFFEncoder</a>

```
searchKey: asn1.byteFFEncoder
tags: [private]
```

```Go
var byteFFEncoder encoder = byteEncoder(0xff)
```

### <a id="boolTestData" href="#boolTestData">var boolTestData</a>

```
searchKey: asn1.boolTestData
tags: [private]
```

```Go
var boolTestData = ...
```

### <a id="int64TestData" href="#int64TestData">var int64TestData</a>

```
searchKey: asn1.int64TestData
tags: [private]
```

```Go
var int64TestData = ...
```

### <a id="int32TestData" href="#int32TestData">var int32TestData</a>

```
searchKey: asn1.int32TestData
tags: [private]
```

```Go
var int32TestData = ...
```

### <a id="bigIntTests" href="#bigIntTests">var bigIntTests</a>

```
searchKey: asn1.bigIntTests
tags: [private]
```

```Go
var bigIntTests = ...
```

### <a id="bitStringTestData" href="#bitStringTestData">var bitStringTestData</a>

```
searchKey: asn1.bitStringTestData
tags: [private]
```

```Go
var bitStringTestData = ...
```

### <a id="bitStringRightAlignTests" href="#bitStringRightAlignTests">var bitStringRightAlignTests</a>

```
searchKey: asn1.bitStringRightAlignTests
tags: [private]
```

```Go
var bitStringRightAlignTests = ...
```

### <a id="objectIdentifierTestData" href="#objectIdentifierTestData">var objectIdentifierTestData</a>

```
searchKey: asn1.objectIdentifierTestData
tags: [private]
```

```Go
var objectIdentifierTestData = ...
```

### <a id="utcTestData" href="#utcTestData">var utcTestData</a>

```
searchKey: asn1.utcTestData
tags: [private]
```

```Go
var utcTestData = ...
```

### <a id="generalizedTimeTestData" href="#generalizedTimeTestData">var generalizedTimeTestData</a>

```
searchKey: asn1.generalizedTimeTestData
tags: [private]
```

```Go
var generalizedTimeTestData = ...
```

### <a id="tagAndLengthData" href="#tagAndLengthData">var tagAndLengthData</a>

```
searchKey: asn1.tagAndLengthData
tags: [private]
```

```Go
var tagAndLengthData = ...
```

### <a id="parseFieldParametersTestData" href="#parseFieldParametersTestData">var parseFieldParametersTestData</a>

```
searchKey: asn1.parseFieldParametersTestData
tags: [private]
```

```Go
var parseFieldParametersTestData []parseFieldParametersTest = ...
```

### <a id="unmarshalTestData" href="#unmarshalTestData">var unmarshalTestData</a>

```
searchKey: asn1.unmarshalTestData
tags: [private]
```

```Go
var unmarshalTestData = ...
```

### <a id="oiEqualTests" href="#oiEqualTests">var oiEqualTests</a>

```
searchKey: asn1.oiEqualTests
tags: [private]
```

```Go
var oiEqualTests = ...
```

### <a id="derEncodedSelfSignedCert" href="#derEncodedSelfSignedCert">var derEncodedSelfSignedCert</a>

```
searchKey: asn1.derEncodedSelfSignedCert
tags: [private]
```

```Go
var derEncodedSelfSignedCert = ...
```

### <a id="derEncodedSelfSignedCertBytes" href="#derEncodedSelfSignedCertBytes">var derEncodedSelfSignedCertBytes</a>

```
searchKey: asn1.derEncodedSelfSignedCertBytes
tags: [private]
```

```Go
var derEncodedSelfSignedCertBytes = ...
```

### <a id="derEncodedPaypalNULCertBytes" href="#derEncodedPaypalNULCertBytes">var derEncodedPaypalNULCertBytes</a>

```
searchKey: asn1.derEncodedPaypalNULCertBytes
tags: [private]
```

```Go
var derEncodedPaypalNULCertBytes = ...
```

### <a id="stringSliceTestData" href="#stringSliceTestData">var stringSliceTestData</a>

```
searchKey: asn1.stringSliceTestData
tags: [private]
```

```Go
var stringSliceTestData = ...
```

### <a id="explicitTaggedTimeTestData" href="#explicitTaggedTimeTestData">var explicitTaggedTimeTestData</a>

```
searchKey: asn1.explicitTaggedTimeTestData
tags: [private]
```

```Go
var explicitTaggedTimeTestData = ...
```

### <a id="bmpStringTests" href="#bmpStringTests">var bmpStringTests</a>

```
searchKey: asn1.bmpStringTests
tags: [private]
```

```Go
var bmpStringTests = ...
```

### <a id="PST" href="#PST">var PST</a>

```
searchKey: asn1.PST
tags: [private]
```

```Go
var PST = time.FixedZone("PST", -8*60*60)
```

### <a id="marshalTests" href="#marshalTests">var marshalTests</a>

```
searchKey: asn1.marshalTests
tags: [private]
```

```Go
var marshalTests = ...
```

### <a id="marshalWithParamsTests" href="#marshalWithParamsTests">var marshalWithParamsTests</a>

```
searchKey: asn1.marshalWithParamsTests
tags: [private]
```

```Go
var marshalWithParamsTests = ...
```

### <a id="marshalErrTests" href="#marshalErrTests">var marshalErrTests</a>

```
searchKey: asn1.marshalErrTests
tags: [private]
```

```Go
var marshalErrTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="StructuralError" href="#StructuralError">type StructuralError struct</a>

```
searchKey: asn1.StructuralError
```

```Go
type StructuralError struct {
	Msg string
}
```

A StructuralError suggests that the ASN.1 data is valid, but the Go type which is receiving it doesn't match. 

#### <a id="StructuralError.Error" href="#StructuralError.Error">func (e StructuralError) Error() string</a>

```
searchKey: asn1.StructuralError.Error
```

```Go
func (e StructuralError) Error() string
```

### <a id="SyntaxError" href="#SyntaxError">type SyntaxError struct</a>

```
searchKey: asn1.SyntaxError
```

```Go
type SyntaxError struct {
	Msg string
}
```

A SyntaxError suggests that the ASN.1 data is invalid. 

#### <a id="SyntaxError.Error" href="#SyntaxError.Error">func (e SyntaxError) Error() string</a>

```
searchKey: asn1.SyntaxError.Error
```

```Go
func (e SyntaxError) Error() string
```

### <a id="BitString" href="#BitString">type BitString struct</a>

```
searchKey: asn1.BitString
```

```Go
type BitString struct {
	Bytes     []byte // bits packed into bytes.
	BitLength int    // length in bits.
}
```

BitString is the structure to use when you want an ASN.1 BIT STRING type. A bit string is padded up to the nearest byte in memory and the number of valid bits is recorded. Padding bits will be zero. 

#### <a id="parseBitString" href="#parseBitString">func parseBitString(bytes []byte) (ret BitString, err error)</a>

```
searchKey: asn1.parseBitString
tags: [private]
```

```Go
func parseBitString(bytes []byte) (ret BitString, err error)
```

parseBitString parses an ASN.1 bit string from the given byte slice and returns it. 

#### <a id="BitString.At" href="#BitString.At">func (b BitString) At(i int) int</a>

```
searchKey: asn1.BitString.At
```

```Go
func (b BitString) At(i int) int
```

At returns the bit at the given index. If the index is out of range it returns false. 

#### <a id="BitString.RightAlign" href="#BitString.RightAlign">func (b BitString) RightAlign() []byte</a>

```
searchKey: asn1.BitString.RightAlign
```

```Go
func (b BitString) RightAlign() []byte
```

RightAlign returns a slice where the padding bits are at the beginning. The slice may share memory with the BitString. 

### <a id="ObjectIdentifier" href="#ObjectIdentifier">type ObjectIdentifier []int</a>

```
searchKey: asn1.ObjectIdentifier
```

```Go
type ObjectIdentifier []int
```

An ObjectIdentifier represents an ASN.1 OBJECT IDENTIFIER. 

#### <a id="parseObjectIdentifier" href="#parseObjectIdentifier">func parseObjectIdentifier(bytes []byte) (s ObjectIdentifier, err error)</a>

```
searchKey: asn1.parseObjectIdentifier
tags: [private]
```

```Go
func parseObjectIdentifier(bytes []byte) (s ObjectIdentifier, err error)
```

parseObjectIdentifier parses an OBJECT IDENTIFIER from the given bytes and returns it. An object identifier is a sequence of variable length integers that are assigned in a hierarchy. 

#### <a id="ObjectIdentifier.Equal" href="#ObjectIdentifier.Equal">func (oi ObjectIdentifier) Equal(other ObjectIdentifier) bool</a>

```
searchKey: asn1.ObjectIdentifier.Equal
```

```Go
func (oi ObjectIdentifier) Equal(other ObjectIdentifier) bool
```

Equal reports whether oi and other represent the same identifier. 

#### <a id="ObjectIdentifier.String" href="#ObjectIdentifier.String">func (oi ObjectIdentifier) String() string</a>

```
searchKey: asn1.ObjectIdentifier.String
```

```Go
func (oi ObjectIdentifier) String() string
```

### <a id="Enumerated" href="#Enumerated">type Enumerated int</a>

```
searchKey: asn1.Enumerated
```

```Go
type Enumerated int
```

An Enumerated is represented as a plain int. 

### <a id="Flag" href="#Flag">type Flag bool</a>

```
searchKey: asn1.Flag
```

```Go
type Flag bool
```

A Flag accepts any data and is set to true if present. 

### <a id="asteriskFlag" href="#asteriskFlag">type asteriskFlag bool</a>

```
searchKey: asn1.asteriskFlag
tags: [private]
```

```Go
type asteriskFlag bool
```

### <a id="ampersandFlag" href="#ampersandFlag">type ampersandFlag bool</a>

```
searchKey: asn1.ampersandFlag
tags: [private]
```

```Go
type ampersandFlag bool
```

### <a id="RawValue" href="#RawValue">type RawValue struct</a>

```
searchKey: asn1.RawValue
```

```Go
type RawValue struct {
	Class, Tag int
	IsCompound bool
	Bytes      []byte
	FullBytes  []byte // includes the tag and length
}
```

A RawValue represents an undecoded ASN.1 object. 

### <a id="RawContent" href="#RawContent">type RawContent []byte</a>

```
searchKey: asn1.RawContent
```

```Go
type RawContent []byte
```

RawContent is used to signal that the undecoded, DER data needs to be preserved for a struct. To use it, the first field of the struct must have this type. It's an error for any of the other fields to have this type. 

### <a id="invalidUnmarshalError" href="#invalidUnmarshalError">type invalidUnmarshalError struct</a>

```
searchKey: asn1.invalidUnmarshalError
tags: [private]
```

```Go
type invalidUnmarshalError struct {
	Type reflect.Type
}
```

An invalidUnmarshalError describes an invalid argument passed to Unmarshal. (The argument to Unmarshal must be a non-nil pointer.) 

#### <a id="invalidUnmarshalError.Error" href="#invalidUnmarshalError.Error">func (e *invalidUnmarshalError) Error() string</a>

```
searchKey: asn1.invalidUnmarshalError.Error
tags: [private]
```

```Go
func (e *invalidUnmarshalError) Error() string
```

### <a id="tagAndLength" href="#tagAndLength">type tagAndLength struct</a>

```
searchKey: asn1.tagAndLength
tags: [private]
```

```Go
type tagAndLength struct {
	class, tag, length int
	isCompound         bool
}
```

#### <a id="parseTagAndLength" href="#parseTagAndLength">func parseTagAndLength(bytes []byte, initOffset int) (ret tagAndLength, offset int, err error)</a>

```
searchKey: asn1.parseTagAndLength
tags: [private]
```

```Go
func parseTagAndLength(bytes []byte, initOffset int) (ret tagAndLength, offset int, err error)
```

parseTagAndLength parses an ASN.1 tag and length pair from the given offset into a byte slice. It returns the parsed data and the new offset. SET and SET OF (tag 17) are mapped to SEQUENCE and SEQUENCE OF (tag 16) since we don't distinguish between ordered and unordered objects in this code. 

### <a id="fieldParameters" href="#fieldParameters">type fieldParameters struct</a>

```
searchKey: asn1.fieldParameters
tags: [private]
```

```Go
type fieldParameters struct {
	optional     bool   // true iff the field is OPTIONAL
	explicit     bool   // true iff an EXPLICIT tag is in use.
	application  bool   // true iff an APPLICATION tag is in use.
	private      bool   // true iff a PRIVATE tag is in use.
	defaultValue *int64 // a default value for INTEGER typed fields (maybe nil).
	tag          *int   // the EXPLICIT or IMPLICIT tag (maybe nil).
	stringType   int    // the string tag to use when marshaling.
	timeType     int    // the time tag to use when marshaling.
	set          bool   // true iff this should be encoded as a SET
	omitEmpty    bool   // true iff this should be omitted if empty when marshaling.

}
```

fieldParameters is the parsed representation of tag string from a structure field. 

#### <a id="parseFieldParameters" href="#parseFieldParameters">func parseFieldParameters(str string) (ret fieldParameters)</a>

```
searchKey: asn1.parseFieldParameters
tags: [private]
```

```Go
func parseFieldParameters(str string) (ret fieldParameters)
```

Given a tag string with the format specified in the package comment, parseFieldParameters will parse it into a fieldParameters structure, ignoring unknown parts of the string. 

### <a id="encoder" href="#encoder">type encoder interface</a>

```
searchKey: asn1.encoder
tags: [private]
```

```Go
type encoder interface {
	// Len returns the number of bytes needed to marshal this element.
	Len() int
	// Encode encodes this element by writing Len() bytes to dst.
	Encode(dst []byte)
}
```

encoder represents an ASN.1 element that is waiting to be marshaled. 

#### <a id="makeBigInt" href="#makeBigInt">func makeBigInt(n *big.Int) (encoder, error)</a>

```
searchKey: asn1.makeBigInt
tags: [private]
```

```Go
func makeBigInt(n *big.Int) (encoder, error)
```

#### <a id="makeObjectIdentifier" href="#makeObjectIdentifier">func makeObjectIdentifier(oid []int) (e encoder, err error)</a>

```
searchKey: asn1.makeObjectIdentifier
tags: [private]
```

```Go
func makeObjectIdentifier(oid []int) (e encoder, err error)
```

#### <a id="makePrintableString" href="#makePrintableString">func makePrintableString(s string) (e encoder, err error)</a>

```
searchKey: asn1.makePrintableString
tags: [private]
```

```Go
func makePrintableString(s string) (e encoder, err error)
```

#### <a id="makeIA5String" href="#makeIA5String">func makeIA5String(s string) (e encoder, err error)</a>

```
searchKey: asn1.makeIA5String
tags: [private]
```

```Go
func makeIA5String(s string) (e encoder, err error)
```

#### <a id="makeNumericString" href="#makeNumericString">func makeNumericString(s string) (e encoder, err error)</a>

```
searchKey: asn1.makeNumericString
tags: [private]
```

```Go
func makeNumericString(s string) (e encoder, err error)
```

#### <a id="makeUTF8String" href="#makeUTF8String">func makeUTF8String(s string) encoder</a>

```
searchKey: asn1.makeUTF8String
tags: [private]
```

```Go
func makeUTF8String(s string) encoder
```

#### <a id="makeUTCTime" href="#makeUTCTime">func makeUTCTime(t time.Time) (e encoder, err error)</a>

```
searchKey: asn1.makeUTCTime
tags: [private]
```

```Go
func makeUTCTime(t time.Time) (e encoder, err error)
```

#### <a id="makeGeneralizedTime" href="#makeGeneralizedTime">func makeGeneralizedTime(t time.Time) (e encoder, err error)</a>

```
searchKey: asn1.makeGeneralizedTime
tags: [private]
```

```Go
func makeGeneralizedTime(t time.Time) (e encoder, err error)
```

#### <a id="makeBody" href="#makeBody">func makeBody(value reflect.Value, params fieldParameters) (e encoder, err error)</a>

```
searchKey: asn1.makeBody
tags: [private]
```

```Go
func makeBody(value reflect.Value, params fieldParameters) (e encoder, err error)
```

#### <a id="makeField" href="#makeField">func makeField(v reflect.Value, params fieldParameters) (e encoder, err error)</a>

```
searchKey: asn1.makeField
tags: [private]
```

```Go
func makeField(v reflect.Value, params fieldParameters) (e encoder, err error)
```

### <a id="byteEncoder" href="#byteEncoder">type byteEncoder byte</a>

```
searchKey: asn1.byteEncoder
tags: [private]
```

```Go
type byteEncoder byte
```

#### <a id="byteEncoder.Len" href="#byteEncoder.Len">func (c byteEncoder) Len() int</a>

```
searchKey: asn1.byteEncoder.Len
tags: [private]
```

```Go
func (c byteEncoder) Len() int
```

#### <a id="byteEncoder.Encode" href="#byteEncoder.Encode">func (c byteEncoder) Encode(dst []byte)</a>

```
searchKey: asn1.byteEncoder.Encode
tags: [private]
```

```Go
func (c byteEncoder) Encode(dst []byte)
```

### <a id="bytesEncoder" href="#bytesEncoder">type bytesEncoder []byte</a>

```
searchKey: asn1.bytesEncoder
tags: [private]
```

```Go
type bytesEncoder []byte
```

#### <a id="bytesEncoder.Len" href="#bytesEncoder.Len">func (b bytesEncoder) Len() int</a>

```
searchKey: asn1.bytesEncoder.Len
tags: [private]
```

```Go
func (b bytesEncoder) Len() int
```

#### <a id="bytesEncoder.Encode" href="#bytesEncoder.Encode">func (b bytesEncoder) Encode(dst []byte)</a>

```
searchKey: asn1.bytesEncoder.Encode
tags: [private]
```

```Go
func (b bytesEncoder) Encode(dst []byte)
```

### <a id="stringEncoder" href="#stringEncoder">type stringEncoder string</a>

```
searchKey: asn1.stringEncoder
tags: [private]
```

```Go
type stringEncoder string
```

#### <a id="stringEncoder.Len" href="#stringEncoder.Len">func (s stringEncoder) Len() int</a>

```
searchKey: asn1.stringEncoder.Len
tags: [private]
```

```Go
func (s stringEncoder) Len() int
```

#### <a id="stringEncoder.Encode" href="#stringEncoder.Encode">func (s stringEncoder) Encode(dst []byte)</a>

```
searchKey: asn1.stringEncoder.Encode
tags: [private]
```

```Go
func (s stringEncoder) Encode(dst []byte)
```

### <a id="multiEncoder" href="#multiEncoder">type multiEncoder []asn1.encoder</a>

```
searchKey: asn1.multiEncoder
tags: [private]
```

```Go
type multiEncoder []encoder
```

#### <a id="multiEncoder.Len" href="#multiEncoder.Len">func (m multiEncoder) Len() int</a>

```
searchKey: asn1.multiEncoder.Len
tags: [private]
```

```Go
func (m multiEncoder) Len() int
```

#### <a id="multiEncoder.Encode" href="#multiEncoder.Encode">func (m multiEncoder) Encode(dst []byte)</a>

```
searchKey: asn1.multiEncoder.Encode
tags: [private]
```

```Go
func (m multiEncoder) Encode(dst []byte)
```

### <a id="setEncoder" href="#setEncoder">type setEncoder []asn1.encoder</a>

```
searchKey: asn1.setEncoder
tags: [private]
```

```Go
type setEncoder []encoder
```

#### <a id="setEncoder.Len" href="#setEncoder.Len">func (s setEncoder) Len() int</a>

```
searchKey: asn1.setEncoder.Len
tags: [private]
```

```Go
func (s setEncoder) Len() int
```

#### <a id="setEncoder.Encode" href="#setEncoder.Encode">func (s setEncoder) Encode(dst []byte)</a>

```
searchKey: asn1.setEncoder.Encode
tags: [private]
```

```Go
func (s setEncoder) Encode(dst []byte)
```

### <a id="taggedEncoder" href="#taggedEncoder">type taggedEncoder struct</a>

```
searchKey: asn1.taggedEncoder
tags: [private]
```

```Go
type taggedEncoder struct {
	// scratch contains temporary space for encoding the tag and length of
	// an element in order to avoid extra allocations.
	scratch [8]byte
	tag     encoder
	body    encoder
}
```

#### <a id="taggedEncoder.Len" href="#taggedEncoder.Len">func (t *taggedEncoder) Len() int</a>

```
searchKey: asn1.taggedEncoder.Len
tags: [private]
```

```Go
func (t *taggedEncoder) Len() int
```

#### <a id="taggedEncoder.Encode" href="#taggedEncoder.Encode">func (t *taggedEncoder) Encode(dst []byte)</a>

```
searchKey: asn1.taggedEncoder.Encode
tags: [private]
```

```Go
func (t *taggedEncoder) Encode(dst []byte)
```

### <a id="int64Encoder" href="#int64Encoder">type int64Encoder int64</a>

```
searchKey: asn1.int64Encoder
tags: [private]
```

```Go
type int64Encoder int64
```

#### <a id="int64Encoder.Len" href="#int64Encoder.Len">func (i int64Encoder) Len() int</a>

```
searchKey: asn1.int64Encoder.Len
tags: [private]
```

```Go
func (i int64Encoder) Len() int
```

#### <a id="int64Encoder.Encode" href="#int64Encoder.Encode">func (i int64Encoder) Encode(dst []byte)</a>

```
searchKey: asn1.int64Encoder.Encode
tags: [private]
```

```Go
func (i int64Encoder) Encode(dst []byte)
```

### <a id="bitStringEncoder" href="#bitStringEncoder">type bitStringEncoder asn1.BitString</a>

```
searchKey: asn1.bitStringEncoder
tags: [private]
```

```Go
type bitStringEncoder BitString
```

#### <a id="bitStringEncoder.Len" href="#bitStringEncoder.Len">func (b bitStringEncoder) Len() int</a>

```
searchKey: asn1.bitStringEncoder.Len
tags: [private]
```

```Go
func (b bitStringEncoder) Len() int
```

#### <a id="bitStringEncoder.Encode" href="#bitStringEncoder.Encode">func (b bitStringEncoder) Encode(dst []byte)</a>

```
searchKey: asn1.bitStringEncoder.Encode
tags: [private]
```

```Go
func (b bitStringEncoder) Encode(dst []byte)
```

### <a id="oidEncoder" href="#oidEncoder">type oidEncoder []int</a>

```
searchKey: asn1.oidEncoder
tags: [private]
```

```Go
type oidEncoder []int
```

#### <a id="oidEncoder.Len" href="#oidEncoder.Len">func (oid oidEncoder) Len() int</a>

```
searchKey: asn1.oidEncoder.Len
tags: [private]
```

```Go
func (oid oidEncoder) Len() int
```

#### <a id="oidEncoder.Encode" href="#oidEncoder.Encode">func (oid oidEncoder) Encode(dst []byte)</a>

```
searchKey: asn1.oidEncoder.Encode
tags: [private]
```

```Go
func (oid oidEncoder) Encode(dst []byte)
```

### <a id="boolTest" href="#boolTest">type boolTest struct</a>

```
searchKey: asn1.boolTest
tags: [private]
```

```Go
type boolTest struct {
	in  []byte
	ok  bool
	out bool
}
```

### <a id="int64Test" href="#int64Test">type int64Test struct</a>

```
searchKey: asn1.int64Test
tags: [private]
```

```Go
type int64Test struct {
	in  []byte
	ok  bool
	out int64
}
```

### <a id="int32Test" href="#int32Test">type int32Test struct</a>

```
searchKey: asn1.int32Test
tags: [private]
```

```Go
type int32Test struct {
	in  []byte
	ok  bool
	out int32
}
```

### <a id="bitStringTest" href="#bitStringTest">type bitStringTest struct</a>

```
searchKey: asn1.bitStringTest
tags: [private]
```

```Go
type bitStringTest struct {
	in        []byte
	ok        bool
	out       []byte
	bitLength int
}
```

### <a id="bitStringRightAlignTest" href="#bitStringRightAlignTest">type bitStringRightAlignTest struct</a>

```
searchKey: asn1.bitStringRightAlignTest
tags: [private]
```

```Go
type bitStringRightAlignTest struct {
	in    []byte
	inlen int
	out   []byte
}
```

### <a id="objectIdentifierTest" href="#objectIdentifierTest">type objectIdentifierTest struct</a>

```
searchKey: asn1.objectIdentifierTest
tags: [private]
```

```Go
type objectIdentifierTest struct {
	in  []byte
	ok  bool
	out ObjectIdentifier // has base type[]int
}
```

### <a id="timeTest" href="#timeTest">type timeTest struct</a>

```
searchKey: asn1.timeTest
tags: [private]
```

```Go
type timeTest struct {
	in  string
	ok  bool
	out time.Time
}
```

### <a id="tagAndLengthTest" href="#tagAndLengthTest">type tagAndLengthTest struct</a>

```
searchKey: asn1.tagAndLengthTest
tags: [private]
```

```Go
type tagAndLengthTest struct {
	in  []byte
	ok  bool
	out tagAndLength
}
```

### <a id="parseFieldParametersTest" href="#parseFieldParametersTest">type parseFieldParametersTest struct</a>

```
searchKey: asn1.parseFieldParametersTest
tags: [private]
```

```Go
type parseFieldParametersTest struct {
	in  string
	out fieldParameters
}
```

### <a id="TestObjectIdentifierStruct" href="#TestObjectIdentifierStruct">type TestObjectIdentifierStruct struct</a>

```
searchKey: asn1.TestObjectIdentifierStruct
tags: [private]
```

```Go
type TestObjectIdentifierStruct struct {
	OID ObjectIdentifier
}
```

### <a id="TestContextSpecificTags" href="#TestContextSpecificTags">type TestContextSpecificTags struct</a>

```
searchKey: asn1.TestContextSpecificTags
tags: [private]
```

```Go
type TestContextSpecificTags struct {
	A int `asn1:"tag:1"`
}
```

### <a id="TestContextSpecificTags2" href="#TestContextSpecificTags2">type TestContextSpecificTags2 struct</a>

```
searchKey: asn1.TestContextSpecificTags2
tags: [private]
```

```Go
type TestContextSpecificTags2 struct {
	A int `asn1:"explicit,tag:1"`
	B int
}
```

### <a id="TestContextSpecificTags3" href="#TestContextSpecificTags3">type TestContextSpecificTags3 struct</a>

```
searchKey: asn1.TestContextSpecificTags3
tags: [private]
```

```Go
type TestContextSpecificTags3 struct {
	S string `asn1:"tag:1,utf8"`
}
```

### <a id="TestElementsAfterString" href="#TestElementsAfterString">type TestElementsAfterString struct</a>

```
searchKey: asn1.TestElementsAfterString
tags: [private]
```

```Go
type TestElementsAfterString struct {
	S    string
	A, B int
}
```

### <a id="TestBigInt" href="#TestBigInt">type TestBigInt struct</a>

```
searchKey: asn1.TestBigInt
tags: [private]
```

```Go
type TestBigInt struct {
	X *big.Int
}
```

### <a id="TestSet" href="#TestSet">type TestSet struct</a>

```
searchKey: asn1.TestSet
tags: [private]
```

```Go
type TestSet struct {
	Ints []int `asn1:"set"`
}
```

### <a id="Certificate" href="#Certificate">type Certificate struct</a>

```
searchKey: asn1.Certificate
tags: [private]
```

```Go
type Certificate struct {
	TBSCertificate     TBSCertificate
	SignatureAlgorithm AlgorithmIdentifier
	SignatureValue     BitString
}
```

### <a id="TBSCertificate" href="#TBSCertificate">type TBSCertificate struct</a>

```
searchKey: asn1.TBSCertificate
tags: [private]
```

```Go
type TBSCertificate struct {
	Version            int `asn1:"optional,explicit,default:0,tag:0"`
	SerialNumber       RawValue
	SignatureAlgorithm AlgorithmIdentifier
	Issuer             RDNSequence
	Validity           Validity
	Subject            RDNSequence
	PublicKey          PublicKeyInfo
}
```

### <a id="AlgorithmIdentifier" href="#AlgorithmIdentifier">type AlgorithmIdentifier struct</a>

```
searchKey: asn1.AlgorithmIdentifier
tags: [private]
```

```Go
type AlgorithmIdentifier struct {
	Algorithm ObjectIdentifier
}
```

### <a id="RDNSequence" href="#RDNSequence">type RDNSequence []asn1.RelativeDistinguishedNameSET</a>

```
searchKey: asn1.RDNSequence
tags: [private]
```

```Go
type RDNSequence []RelativeDistinguishedNameSET
```

### <a id="RelativeDistinguishedNameSET" href="#RelativeDistinguishedNameSET">type RelativeDistinguishedNameSET []asn1.AttributeTypeAndValue</a>

```
searchKey: asn1.RelativeDistinguishedNameSET
tags: [private]
```

```Go
type RelativeDistinguishedNameSET []AttributeTypeAndValue
```

### <a id="AttributeTypeAndValue" href="#AttributeTypeAndValue">type AttributeTypeAndValue struct</a>

```
searchKey: asn1.AttributeTypeAndValue
tags: [private]
```

```Go
type AttributeTypeAndValue struct {
	Type  ObjectIdentifier
	Value interface{}
}
```

### <a id="Validity" href="#Validity">type Validity struct</a>

```
searchKey: asn1.Validity
tags: [private]
```

```Go
type Validity struct {
	NotBefore, NotAfter time.Time
}
```

### <a id="PublicKeyInfo" href="#PublicKeyInfo">type PublicKeyInfo struct</a>

```
searchKey: asn1.PublicKeyInfo
tags: [private]
```

```Go
type PublicKeyInfo struct {
	Algorithm AlgorithmIdentifier
	PublicKey BitString
}
```

### <a id="rawStructTest" href="#rawStructTest">type rawStructTest struct</a>

```
searchKey: asn1.rawStructTest
tags: [private]
```

```Go
type rawStructTest struct {
	Raw RawContent
	A   int
}
```

### <a id="oiEqualTest" href="#oiEqualTest">type oiEqualTest struct</a>

```
searchKey: asn1.oiEqualTest
tags: [private]
```

```Go
type oiEqualTest struct {
	first  ObjectIdentifier
	second ObjectIdentifier
	same   bool
}
```

### <a id="explicitTaggedTimeTest" href="#explicitTaggedTimeTest">type explicitTaggedTimeTest struct</a>

```
searchKey: asn1.explicitTaggedTimeTest
tags: [private]
```

```Go
type explicitTaggedTimeTest struct {
	Time time.Time `asn1:"explicit,tag:0"`
}
```

### <a id="implicitTaggedTimeTest" href="#implicitTaggedTimeTest">type implicitTaggedTimeTest struct</a>

```
searchKey: asn1.implicitTaggedTimeTest
tags: [private]
```

```Go
type implicitTaggedTimeTest struct {
	Time time.Time `asn1:"tag:24"`
}
```

### <a id="truncatedExplicitTagTest" href="#truncatedExplicitTagTest">type truncatedExplicitTagTest struct</a>

```
searchKey: asn1.truncatedExplicitTagTest
tags: [private]
```

```Go
type truncatedExplicitTagTest struct {
	Test int `asn1:"explicit,tag:0"`
}
```

### <a id="invalidUTF8Test" href="#invalidUTF8Test">type invalidUTF8Test struct</a>

```
searchKey: asn1.invalidUTF8Test
tags: [private]
```

```Go
type invalidUTF8Test struct {
	Str string `asn1:"utf8"`
}
```

### <a id="unexported" href="#unexported">type unexported struct</a>

```
searchKey: asn1.unexported
tags: [private]
```

```Go
type unexported struct {
	X int
	y int
}
```

### <a id="exported" href="#exported">type exported struct</a>

```
searchKey: asn1.exported
tags: [private]
```

```Go
type exported struct {
	X int
	Y int
}
```

### <a id="intStruct" href="#intStruct">type intStruct struct</a>

```
searchKey: asn1.intStruct
tags: [private]
```

```Go
type intStruct struct {
	A int
}
```

### <a id="twoIntStruct" href="#twoIntStruct">type twoIntStruct struct</a>

```
searchKey: asn1.twoIntStruct
tags: [private]
```

```Go
type twoIntStruct struct {
	A int
	B int
}
```

### <a id="bigIntStruct" href="#bigIntStruct">type bigIntStruct struct</a>

```
searchKey: asn1.bigIntStruct
tags: [private]
```

```Go
type bigIntStruct struct {
	A *big.Int
}
```

### <a id="nestedStruct" href="#nestedStruct">type nestedStruct struct</a>

```
searchKey: asn1.nestedStruct
tags: [private]
```

```Go
type nestedStruct struct {
	A intStruct
}
```

### <a id="rawContentsStruct" href="#rawContentsStruct">type rawContentsStruct struct</a>

```
searchKey: asn1.rawContentsStruct
tags: [private]
```

```Go
type rawContentsStruct struct {
	Raw RawContent
	A   int
}
```

### <a id="implicitTagTest" href="#implicitTagTest">type implicitTagTest struct</a>

```
searchKey: asn1.implicitTagTest
tags: [private]
```

```Go
type implicitTagTest struct {
	A int `asn1:"implicit,tag:5"`
}
```

### <a id="explicitTagTest" href="#explicitTagTest">type explicitTagTest struct</a>

```
searchKey: asn1.explicitTagTest
tags: [private]
```

```Go
type explicitTagTest struct {
	A int `asn1:"explicit,tag:5"`
}
```

### <a id="flagTest" href="#flagTest">type flagTest struct</a>

```
searchKey: asn1.flagTest
tags: [private]
```

```Go
type flagTest struct {
	A Flag `asn1:"tag:0,optional"`
}
```

### <a id="generalizedTimeTest" href="#generalizedTimeTest">type generalizedTimeTest struct</a>

```
searchKey: asn1.generalizedTimeTest
tags: [private]
```

```Go
type generalizedTimeTest struct {
	A time.Time `asn1:"generalized"`
}
```

### <a id="ia5StringTest" href="#ia5StringTest">type ia5StringTest struct</a>

```
searchKey: asn1.ia5StringTest
tags: [private]
```

```Go
type ia5StringTest struct {
	A string `asn1:"ia5"`
}
```

### <a id="printableStringTest" href="#printableStringTest">type printableStringTest struct</a>

```
searchKey: asn1.printableStringTest
tags: [private]
```

```Go
type printableStringTest struct {
	A string `asn1:"printable"`
}
```

### <a id="genericStringTest" href="#genericStringTest">type genericStringTest struct</a>

```
searchKey: asn1.genericStringTest
tags: [private]
```

```Go
type genericStringTest struct {
	A string
}
```

### <a id="optionalRawValueTest" href="#optionalRawValueTest">type optionalRawValueTest struct</a>

```
searchKey: asn1.optionalRawValueTest
tags: [private]
```

```Go
type optionalRawValueTest struct {
	A RawValue `asn1:"optional"`
}
```

### <a id="omitEmptyTest" href="#omitEmptyTest">type omitEmptyTest struct</a>

```
searchKey: asn1.omitEmptyTest
tags: [private]
```

```Go
type omitEmptyTest struct {
	A []string `asn1:"omitempty"`
}
```

### <a id="defaultTest" href="#defaultTest">type defaultTest struct</a>

```
searchKey: asn1.defaultTest
tags: [private]
```

```Go
type defaultTest struct {
	A int `asn1:"optional,default:1"`
}
```

### <a id="applicationTest" href="#applicationTest">type applicationTest struct</a>

```
searchKey: asn1.applicationTest
tags: [private]
```

```Go
type applicationTest struct {
	A int `asn1:"application,tag:0"`
	B int `asn1:"application,tag:1,explicit"`
}
```

### <a id="privateTest" href="#privateTest">type privateTest struct</a>

```
searchKey: asn1.privateTest
tags: [private]
```

```Go
type privateTest struct {
	A int `asn1:"private,tag:0"`
	B int `asn1:"private,tag:1,explicit"`
	C int `asn1:"private,tag:31"`  // tag size should be 2 octet
	D int `asn1:"private,tag:128"` // tag size should be 3 octet
}
```

### <a id="numericStringTest" href="#numericStringTest">type numericStringTest struct</a>

```
searchKey: asn1.numericStringTest
tags: [private]
```

```Go
type numericStringTest struct {
	A string `asn1:"numeric"`
}
```

### <a id="testSET" href="#testSET">type testSET []int</a>

```
searchKey: asn1.testSET
tags: [private]
```

```Go
type testSET []int
```

### <a id="marshalTest" href="#marshalTest">type marshalTest struct</a>

```
searchKey: asn1.marshalTest
tags: [private]
```

```Go
type marshalTest struct {
	in  interface{}
	out string // hex encoded
}
```

### <a id="marshalWithParamsTest" href="#marshalWithParamsTest">type marshalWithParamsTest struct</a>

```
searchKey: asn1.marshalWithParamsTest
tags: [private]
```

```Go
type marshalWithParamsTest struct {
	in     interface{}
	params string
	out    string // hex encoded
}
```

### <a id="marshalErrTest" href="#marshalErrTest">type marshalErrTest struct</a>

```
searchKey: asn1.marshalErrTest
tags: [private]
```

```Go
type marshalErrTest struct {
	in  interface{}
	err string
}
```

## <a id="func" href="#func">Functions</a>

### <a id="parseBool" href="#parseBool">func parseBool(bytes []byte) (ret bool, err error)</a>

```
searchKey: asn1.parseBool
tags: [private]
```

```Go
func parseBool(bytes []byte) (ret bool, err error)
```

### <a id="checkInteger" href="#checkInteger">func checkInteger(bytes []byte) error</a>

```
searchKey: asn1.checkInteger
tags: [private]
```

```Go
func checkInteger(bytes []byte) error
```

checkInteger returns nil if the given bytes are a valid DER-encoded INTEGER and an error otherwise. 

### <a id="parseInt64" href="#parseInt64">func parseInt64(bytes []byte) (ret int64, err error)</a>

```
searchKey: asn1.parseInt64
tags: [private]
```

```Go
func parseInt64(bytes []byte) (ret int64, err error)
```

parseInt64 treats the given bytes as a big-endian, signed integer and returns the result. 

### <a id="parseInt32" href="#parseInt32">func parseInt32(bytes []byte) (int32, error)</a>

```
searchKey: asn1.parseInt32
tags: [private]
```

```Go
func parseInt32(bytes []byte) (int32, error)
```

parseInt treats the given bytes as a big-endian, signed integer and returns the result. 

### <a id="parseBigInt" href="#parseBigInt">func parseBigInt(bytes []byte) (*big.Int, error)</a>

```
searchKey: asn1.parseBigInt
tags: [private]
```

```Go
func parseBigInt(bytes []byte) (*big.Int, error)
```

parseBigInt treats the given bytes as a big-endian, signed integer and returns the result. 

### <a id="parseBase128Int" href="#parseBase128Int">func parseBase128Int(bytes []byte, initOffset int) (ret, offset int, err error)</a>

```
searchKey: asn1.parseBase128Int
tags: [private]
```

```Go
func parseBase128Int(bytes []byte, initOffset int) (ret, offset int, err error)
```

parseBase128Int parses a base-128 encoded int from the given offset in the given byte slice. It returns the value and the new offset. 

### <a id="parseUTCTime" href="#parseUTCTime">func parseUTCTime(bytes []byte) (ret time.Time, err error)</a>

```
searchKey: asn1.parseUTCTime
tags: [private]
```

```Go
func parseUTCTime(bytes []byte) (ret time.Time, err error)
```

### <a id="parseGeneralizedTime" href="#parseGeneralizedTime">func parseGeneralizedTime(bytes []byte) (ret time.Time, err error)</a>

```
searchKey: asn1.parseGeneralizedTime
tags: [private]
```

```Go
func parseGeneralizedTime(bytes []byte) (ret time.Time, err error)
```

parseGeneralizedTime parses the GeneralizedTime from the given byte slice and returns the resulting time. 

### <a id="parseNumericString" href="#parseNumericString">func parseNumericString(bytes []byte) (ret string, err error)</a>

```
searchKey: asn1.parseNumericString
tags: [private]
```

```Go
func parseNumericString(bytes []byte) (ret string, err error)
```

parseNumericString parses an ASN.1 NumericString from the given byte array and returns it. 

### <a id="isNumeric" href="#isNumeric">func isNumeric(b byte) bool</a>

```
searchKey: asn1.isNumeric
tags: [private]
```

```Go
func isNumeric(b byte) bool
```

isNumeric reports whether the given b is in the ASN.1 NumericString set. 

### <a id="parsePrintableString" href="#parsePrintableString">func parsePrintableString(bytes []byte) (ret string, err error)</a>

```
searchKey: asn1.parsePrintableString
tags: [private]
```

```Go
func parsePrintableString(bytes []byte) (ret string, err error)
```

parsePrintableString parses an ASN.1 PrintableString from the given byte array and returns it. 

### <a id="isPrintable" href="#isPrintable">func isPrintable(b byte, asterisk asteriskFlag, ampersand ampersandFlag) bool</a>

```
searchKey: asn1.isPrintable
tags: [private]
```

```Go
func isPrintable(b byte, asterisk asteriskFlag, ampersand ampersandFlag) bool
```

isPrintable reports whether the given b is in the ASN.1 PrintableString set. If asterisk is allowAsterisk then '*' is also allowed, reflecting existing practice. If ampersand is allowAmpersand then '&' is allowed as well. 

### <a id="parseIA5String" href="#parseIA5String">func parseIA5String(bytes []byte) (ret string, err error)</a>

```
searchKey: asn1.parseIA5String
tags: [private]
```

```Go
func parseIA5String(bytes []byte) (ret string, err error)
```

parseIA5String parses an ASN.1 IA5String (ASCII string) from the given byte slice and returns it. 

### <a id="parseT61String" href="#parseT61String">func parseT61String(bytes []byte) (ret string, err error)</a>

```
searchKey: asn1.parseT61String
tags: [private]
```

```Go
func parseT61String(bytes []byte) (ret string, err error)
```

parseT61String parses an ASN.1 T61String (8-bit clean string) from the given byte slice and returns it. 

### <a id="parseUTF8String" href="#parseUTF8String">func parseUTF8String(bytes []byte) (ret string, err error)</a>

```
searchKey: asn1.parseUTF8String
tags: [private]
```

```Go
func parseUTF8String(bytes []byte) (ret string, err error)
```

parseUTF8String parses an ASN.1 UTF8String (raw UTF-8) from the given byte array and returns it. 

### <a id="parseBMPString" href="#parseBMPString">func parseBMPString(bmpString []byte) (string, error)</a>

```
searchKey: asn1.parseBMPString
tags: [private]
```

```Go
func parseBMPString(bmpString []byte) (string, error)
```

parseBMPString parses an ASN.1 BMPString (Basic Multilingual Plane of ISO/IEC/ITU 10646-1) from the given byte slice and returns it. 

### <a id="parseSequenceOf" href="#parseSequenceOf">func parseSequenceOf(bytes []byte, sliceType reflect.Type, elemType reflect.Type) (ret reflect.Value, err error)</a>

```
searchKey: asn1.parseSequenceOf
tags: [private]
```

```Go
func parseSequenceOf(bytes []byte, sliceType reflect.Type, elemType reflect.Type) (ret reflect.Value, err error)
```

parseSequenceOf is used for SEQUENCE OF and SET OF values. It tries to parse a number of ASN.1 values from the given byte slice and returns them as a slice of Go values of the given type. 

### <a id="invalidLength" href="#invalidLength">func invalidLength(offset, length, sliceLength int) bool</a>

```
searchKey: asn1.invalidLength
tags: [private]
```

```Go
func invalidLength(offset, length, sliceLength int) bool
```

invalidLength reports whether offset + length > sliceLength, or if the addition would overflow. 

### <a id="parseField" href="#parseField">func parseField(v reflect.Value, bytes []byte, initOffset int, params fieldParameters) (offset int, err error)</a>

```
searchKey: asn1.parseField
tags: [private]
```

```Go
func parseField(v reflect.Value, bytes []byte, initOffset int, params fieldParameters) (offset int, err error)
```

parseField is the main parsing function. Given a byte slice and an offset into the array, it will try to parse a suitable ASN.1 value out and store it in the given Value. 

### <a id="canHaveDefaultValue" href="#canHaveDefaultValue">func canHaveDefaultValue(k reflect.Kind) bool</a>

```
searchKey: asn1.canHaveDefaultValue
tags: [private]
```

```Go
func canHaveDefaultValue(k reflect.Kind) bool
```

canHaveDefaultValue reports whether k is a Kind that we will set a default value for. (A signed integer, essentially.) 

### <a id="setDefaultValue" href="#setDefaultValue">func setDefaultValue(v reflect.Value, params fieldParameters) (ok bool)</a>

```
searchKey: asn1.setDefaultValue
tags: [private]
```

```Go
func setDefaultValue(v reflect.Value, params fieldParameters) (ok bool)
```

setDefaultValue is used to install a default value, from a tag string, into a Value. It is successful if the field was optional, even if a default value wasn't provided or it failed to install it into the Value. 

### <a id="Unmarshal" href="#Unmarshal">func Unmarshal(b []byte, val interface{}) (rest []byte, err error)</a>

```
searchKey: asn1.Unmarshal
```

```Go
func Unmarshal(b []byte, val interface{}) (rest []byte, err error)
```

Unmarshal parses the DER-encoded ASN.1 data structure b and uses the reflect package to fill in an arbitrary value pointed at by val. Because Unmarshal uses the reflect package, the structs being written to must use upper case field names. If val is nil or not a pointer, Unmarshal returns an error. 

After parsing b, any bytes that were leftover and not used to fill val will be returned in rest. When parsing a SEQUENCE into a struct, any trailing elements of the SEQUENCE that do not have matching fields in val will not be included in rest, as these are considered valid elements of the SEQUENCE and not trailing data. 

An ASN.1 INTEGER can be written to an int, int32, int64, or *big.Int (from the math/big package). If the encoded value does not fit in the Go type, Unmarshal returns a parse error. 

An ASN.1 BIT STRING can be written to a BitString. 

An ASN.1 OCTET STRING can be written to a []byte. 

An ASN.1 OBJECT IDENTIFIER can be written to an ObjectIdentifier. 

An ASN.1 ENUMERATED can be written to an Enumerated. 

An ASN.1 UTCTIME or GENERALIZEDTIME can be written to a time.Time. 

An ASN.1 PrintableString, IA5String, or NumericString can be written to a string. 

Any of the above ASN.1 values can be written to an interface{}. The value stored in the interface has the corresponding Go type. For integers, that type is int64. 

An ASN.1 SEQUENCE OF x or SET OF x can be written to a slice if an x can be written to the slice's element type. 

An ASN.1 SEQUENCE or SET can be written to a struct if each of the elements in the sequence can be written to the corresponding element in the struct. 

The following tags on struct fields have special meaning to Unmarshal: 

```
application specifies that an APPLICATION tag is used
private     specifies that a PRIVATE tag is used
default:x   sets the default value for optional integer fields (only used if optional is also present)
explicit    specifies that an additional, explicit tag wraps the implicit one
optional    marks the field as ASN.1 OPTIONAL
set         causes a SET, rather than a SEQUENCE type to be expected
tag:x       specifies the ASN.1 tag number; implies ASN.1 CONTEXT SPECIFIC

```
When decoding an ASN.1 value with an IMPLICIT tag into a string field, Unmarshal will default to a PrintableString, which doesn't support characters such as '@' and '&'. To force other encodings, use the following tags: 

```
ia5     causes strings to be unmarshaled as ASN.1 IA5String values
numeric causes strings to be unmarshaled as ASN.1 NumericString values
utf8    causes strings to be unmarshaled as ASN.1 UTF8String values

```
If the type of the first field of a structure is RawContent then the raw ASN1 contents of the struct will be stored in it. 

If the name of a slice type ends with "SET" then it's treated as if the "set" tag was set on it. This results in interpreting the type as a SET OF x rather than a SEQUENCE OF x. This can be used with nested slices where a struct tag cannot be given. 

Other ASN.1 types are not supported; if it encounters them, Unmarshal returns a parse error. 

### <a id="UnmarshalWithParams" href="#UnmarshalWithParams">func UnmarshalWithParams(b []byte, val interface{}, params string) (rest []byte, err error)</a>

```
searchKey: asn1.UnmarshalWithParams
```

```Go
func UnmarshalWithParams(b []byte, val interface{}, params string) (rest []byte, err error)
```

UnmarshalWithParams allows field parameters to be specified for the top-level element. The form of the params is the same as the field tags. 

### <a id="getUniversalType" href="#getUniversalType">func getUniversalType(t reflect.Type) (matchAny bool, tagNumber int, isCompound, ok bool)</a>

```
searchKey: asn1.getUniversalType
tags: [private]
```

```Go
func getUniversalType(t reflect.Type) (matchAny bool, tagNumber int, isCompound, ok bool)
```

Given a reflected Go type, getUniversalType returns the default tag number and expected compound flag. 

### <a id="base128IntLength" href="#base128IntLength">func base128IntLength(n int64) int</a>

```
searchKey: asn1.base128IntLength
tags: [private]
```

```Go
func base128IntLength(n int64) int
```

### <a id="appendBase128Int" href="#appendBase128Int">func appendBase128Int(dst []byte, n int64) []byte</a>

```
searchKey: asn1.appendBase128Int
tags: [private]
```

```Go
func appendBase128Int(dst []byte, n int64) []byte
```

### <a id="appendLength" href="#appendLength">func appendLength(dst []byte, i int) []byte</a>

```
searchKey: asn1.appendLength
tags: [private]
```

```Go
func appendLength(dst []byte, i int) []byte
```

### <a id="lengthLength" href="#lengthLength">func lengthLength(i int) (numBytes int)</a>

```
searchKey: asn1.lengthLength
tags: [private]
```

```Go
func lengthLength(i int) (numBytes int)
```

### <a id="appendTagAndLength" href="#appendTagAndLength">func appendTagAndLength(dst []byte, t tagAndLength) []byte</a>

```
searchKey: asn1.appendTagAndLength
tags: [private]
```

```Go
func appendTagAndLength(dst []byte, t tagAndLength) []byte
```

### <a id="appendTwoDigits" href="#appendTwoDigits">func appendTwoDigits(dst []byte, v int) []byte</a>

```
searchKey: asn1.appendTwoDigits
tags: [private]
```

```Go
func appendTwoDigits(dst []byte, v int) []byte
```

### <a id="appendFourDigits" href="#appendFourDigits">func appendFourDigits(dst []byte, v int) []byte</a>

```
searchKey: asn1.appendFourDigits
tags: [private]
```

```Go
func appendFourDigits(dst []byte, v int) []byte
```

### <a id="outsideUTCRange" href="#outsideUTCRange">func outsideUTCRange(t time.Time) bool</a>

```
searchKey: asn1.outsideUTCRange
tags: [private]
```

```Go
func outsideUTCRange(t time.Time) bool
```

### <a id="appendUTCTime" href="#appendUTCTime">func appendUTCTime(dst []byte, t time.Time) (ret []byte, err error)</a>

```
searchKey: asn1.appendUTCTime
tags: [private]
```

```Go
func appendUTCTime(dst []byte, t time.Time) (ret []byte, err error)
```

### <a id="appendGeneralizedTime" href="#appendGeneralizedTime">func appendGeneralizedTime(dst []byte, t time.Time) (ret []byte, err error)</a>

```
searchKey: asn1.appendGeneralizedTime
tags: [private]
```

```Go
func appendGeneralizedTime(dst []byte, t time.Time) (ret []byte, err error)
```

### <a id="appendTimeCommon" href="#appendTimeCommon">func appendTimeCommon(dst []byte, t time.Time) []byte</a>

```
searchKey: asn1.appendTimeCommon
tags: [private]
```

```Go
func appendTimeCommon(dst []byte, t time.Time) []byte
```

### <a id="stripTagAndLength" href="#stripTagAndLength">func stripTagAndLength(in []byte) []byte</a>

```
searchKey: asn1.stripTagAndLength
tags: [private]
```

```Go
func stripTagAndLength(in []byte) []byte
```

### <a id="Marshal" href="#Marshal">func Marshal(val interface{}) ([]byte, error)</a>

```
searchKey: asn1.Marshal
```

```Go
func Marshal(val interface{}) ([]byte, error)
```

Marshal returns the ASN.1 encoding of val. 

In addition to the struct tags recognised by Unmarshal, the following can be used: 

```
ia5:         causes strings to be marshaled as ASN.1, IA5String values
omitempty:   causes empty slices to be skipped
printable:   causes strings to be marshaled as ASN.1, PrintableString values
utf8:        causes strings to be marshaled as ASN.1, UTF8String values
utc:         causes time.Time to be marshaled as ASN.1, UTCTime values
generalized: causes time.Time to be marshaled as ASN.1, GeneralizedTime values

```
### <a id="MarshalWithParams" href="#MarshalWithParams">func MarshalWithParams(val interface{}, params string) ([]byte, error)</a>

```
searchKey: asn1.MarshalWithParams
```

```Go
func MarshalWithParams(val interface{}, params string) ([]byte, error)
```

MarshalWithParams allows field parameters to be specified for the top-level element. The form of the params is the same as the field tags. 

### <a id="TestParseBool" href="#TestParseBool">func TestParseBool(t *testing.T)</a>

```
searchKey: asn1.TestParseBool
tags: [private]
```

```Go
func TestParseBool(t *testing.T)
```

### <a id="TestParseInt64" href="#TestParseInt64">func TestParseInt64(t *testing.T)</a>

```
searchKey: asn1.TestParseInt64
tags: [private]
```

```Go
func TestParseInt64(t *testing.T)
```

### <a id="TestParseInt32" href="#TestParseInt32">func TestParseInt32(t *testing.T)</a>

```
searchKey: asn1.TestParseInt32
tags: [private]
```

```Go
func TestParseInt32(t *testing.T)
```

### <a id="TestParseBigInt" href="#TestParseBigInt">func TestParseBigInt(t *testing.T)</a>

```
searchKey: asn1.TestParseBigInt
tags: [private]
```

```Go
func TestParseBigInt(t *testing.T)
```

### <a id="TestBitString" href="#TestBitString">func TestBitString(t *testing.T)</a>

```
searchKey: asn1.TestBitString
tags: [private]
```

```Go
func TestBitString(t *testing.T)
```

### <a id="TestBitStringAt" href="#TestBitStringAt">func TestBitStringAt(t *testing.T)</a>

```
searchKey: asn1.TestBitStringAt
tags: [private]
```

```Go
func TestBitStringAt(t *testing.T)
```

### <a id="TestBitStringRightAlign" href="#TestBitStringRightAlign">func TestBitStringRightAlign(t *testing.T)</a>

```
searchKey: asn1.TestBitStringRightAlign
tags: [private]
```

```Go
func TestBitStringRightAlign(t *testing.T)
```

### <a id="TestObjectIdentifier" href="#TestObjectIdentifier">func TestObjectIdentifier(t *testing.T)</a>

```
searchKey: asn1.TestObjectIdentifier
tags: [private]
```

```Go
func TestObjectIdentifier(t *testing.T)
```

### <a id="TestUTCTime" href="#TestUTCTime">func TestUTCTime(t *testing.T)</a>

```
searchKey: asn1.TestUTCTime
tags: [private]
```

```Go
func TestUTCTime(t *testing.T)
```

### <a id="TestGeneralizedTime" href="#TestGeneralizedTime">func TestGeneralizedTime(t *testing.T)</a>

```
searchKey: asn1.TestGeneralizedTime
tags: [private]
```

```Go
func TestGeneralizedTime(t *testing.T)
```

### <a id="TestParseTagAndLength" href="#TestParseTagAndLength">func TestParseTagAndLength(t *testing.T)</a>

```
searchKey: asn1.TestParseTagAndLength
tags: [private]
```

```Go
func TestParseTagAndLength(t *testing.T)
```

### <a id="newInt" href="#newInt">func newInt(n int) *int</a>

```
searchKey: asn1.newInt
tags: [private]
```

```Go
func newInt(n int) *int
```

### <a id="newInt64" href="#newInt64">func newInt64(n int64) *int64</a>

```
searchKey: asn1.newInt64
tags: [private]
```

```Go
func newInt64(n int64) *int64
```

### <a id="newString" href="#newString">func newString(s string) *string</a>

```
searchKey: asn1.newString
tags: [private]
```

```Go
func newString(s string) *string
```

### <a id="newBool" href="#newBool">func newBool(b bool) *bool</a>

```
searchKey: asn1.newBool
tags: [private]
```

```Go
func newBool(b bool) *bool
```

### <a id="TestParseFieldParameters" href="#TestParseFieldParameters">func TestParseFieldParameters(t *testing.T)</a>

```
searchKey: asn1.TestParseFieldParameters
tags: [private]
```

```Go
func TestParseFieldParameters(t *testing.T)
```

### <a id="TestUnmarshal" href="#TestUnmarshal">func TestUnmarshal(t *testing.T)</a>

```
searchKey: asn1.TestUnmarshal
tags: [private]
```

```Go
func TestUnmarshal(t *testing.T)
```

### <a id="TestUnmarshalWithNilOrNonPointer" href="#TestUnmarshalWithNilOrNonPointer">func TestUnmarshalWithNilOrNonPointer(t *testing.T)</a>

```
searchKey: asn1.TestUnmarshalWithNilOrNonPointer
tags: [private]
```

```Go
func TestUnmarshalWithNilOrNonPointer(t *testing.T)
```

### <a id="TestCertificate" href="#TestCertificate">func TestCertificate(t *testing.T)</a>

```
searchKey: asn1.TestCertificate
tags: [private]
```

```Go
func TestCertificate(t *testing.T)
```

### <a id="TestCertificateWithNUL" href="#TestCertificateWithNUL">func TestCertificateWithNUL(t *testing.T)</a>

```
searchKey: asn1.TestCertificateWithNUL
tags: [private]
```

```Go
func TestCertificateWithNUL(t *testing.T)
```

### <a id="TestRawStructs" href="#TestRawStructs">func TestRawStructs(t *testing.T)</a>

```
searchKey: asn1.TestRawStructs
tags: [private]
```

```Go
func TestRawStructs(t *testing.T)
```

### <a id="TestObjectIdentifierEqual" href="#TestObjectIdentifierEqual">func TestObjectIdentifierEqual(t *testing.T)</a>

```
searchKey: asn1.TestObjectIdentifierEqual
tags: [private]
```

```Go
func TestObjectIdentifierEqual(t *testing.T)
```

### <a id="TestStringSlice" href="#TestStringSlice">func TestStringSlice(t *testing.T)</a>

```
searchKey: asn1.TestStringSlice
tags: [private]
```

```Go
func TestStringSlice(t *testing.T)
```

### <a id="TestExplicitTaggedTime" href="#TestExplicitTaggedTime">func TestExplicitTaggedTime(t *testing.T)</a>

```
searchKey: asn1.TestExplicitTaggedTime
tags: [private]
```

```Go
func TestExplicitTaggedTime(t *testing.T)
```

### <a id="TestImplicitTaggedTime" href="#TestImplicitTaggedTime">func TestImplicitTaggedTime(t *testing.T)</a>

```
searchKey: asn1.TestImplicitTaggedTime
tags: [private]
```

```Go
func TestImplicitTaggedTime(t *testing.T)
```

### <a id="TestTruncatedExplicitTag" href="#TestTruncatedExplicitTag">func TestTruncatedExplicitTag(t *testing.T)</a>

```
searchKey: asn1.TestTruncatedExplicitTag
tags: [private]
```

```Go
func TestTruncatedExplicitTag(t *testing.T)
```

### <a id="TestUnmarshalInvalidUTF8" href="#TestUnmarshalInvalidUTF8">func TestUnmarshalInvalidUTF8(t *testing.T)</a>

```
searchKey: asn1.TestUnmarshalInvalidUTF8
tags: [private]
```

```Go
func TestUnmarshalInvalidUTF8(t *testing.T)
```

### <a id="TestMarshalNilValue" href="#TestMarshalNilValue">func TestMarshalNilValue(t *testing.T)</a>

```
searchKey: asn1.TestMarshalNilValue
tags: [private]
```

```Go
func TestMarshalNilValue(t *testing.T)
```

### <a id="TestUnexportedStructField" href="#TestUnexportedStructField">func TestUnexportedStructField(t *testing.T)</a>

```
searchKey: asn1.TestUnexportedStructField
tags: [private]
```

```Go
func TestUnexportedStructField(t *testing.T)
```

### <a id="TestNull" href="#TestNull">func TestNull(t *testing.T)</a>

```
searchKey: asn1.TestNull
tags: [private]
```

```Go
func TestNull(t *testing.T)
```

### <a id="TestExplicitTagRawValueStruct" href="#TestExplicitTagRawValueStruct">func TestExplicitTagRawValueStruct(t *testing.T)</a>

```
searchKey: asn1.TestExplicitTagRawValueStruct
tags: [private]
```

```Go
func TestExplicitTagRawValueStruct(t *testing.T)
```

### <a id="TestTaggedRawValue" href="#TestTaggedRawValue">func TestTaggedRawValue(t *testing.T)</a>

```
searchKey: asn1.TestTaggedRawValue
tags: [private]
```

```Go
func TestTaggedRawValue(t *testing.T)
```

### <a id="TestBMPString" href="#TestBMPString">func TestBMPString(t *testing.T)</a>

```
searchKey: asn1.TestBMPString
tags: [private]
```

```Go
func TestBMPString(t *testing.T)
```

### <a id="TestNonMinimalEncodedOID" href="#TestNonMinimalEncodedOID">func TestNonMinimalEncodedOID(t *testing.T)</a>

```
searchKey: asn1.TestNonMinimalEncodedOID
tags: [private]
```

```Go
func TestNonMinimalEncodedOID(t *testing.T)
```

### <a id="farFuture" href="#farFuture">func farFuture() time.Time</a>

```
searchKey: asn1.farFuture
tags: [private]
```

```Go
func farFuture() time.Time
```

### <a id="TestMarshal" href="#TestMarshal">func TestMarshal(t *testing.T)</a>

```
searchKey: asn1.TestMarshal
tags: [private]
```

```Go
func TestMarshal(t *testing.T)
```

### <a id="TestMarshalWithParams" href="#TestMarshalWithParams">func TestMarshalWithParams(t *testing.T)</a>

```
searchKey: asn1.TestMarshalWithParams
tags: [private]
```

```Go
func TestMarshalWithParams(t *testing.T)
```

### <a id="TestMarshalError" href="#TestMarshalError">func TestMarshalError(t *testing.T)</a>

```
searchKey: asn1.TestMarshalError
tags: [private]
```

```Go
func TestMarshalError(t *testing.T)
```

### <a id="TestInvalidUTF8" href="#TestInvalidUTF8">func TestInvalidUTF8(t *testing.T)</a>

```
searchKey: asn1.TestInvalidUTF8
tags: [private]
```

```Go
func TestInvalidUTF8(t *testing.T)
```

### <a id="TestMarshalOID" href="#TestMarshalOID">func TestMarshalOID(t *testing.T)</a>

```
searchKey: asn1.TestMarshalOID
tags: [private]
```

```Go
func TestMarshalOID(t *testing.T)
```

### <a id="TestIssue11130" href="#TestIssue11130">func TestIssue11130(t *testing.T)</a>

```
searchKey: asn1.TestIssue11130
tags: [private]
```

```Go
func TestIssue11130(t *testing.T)
```

### <a id="BenchmarkMarshal" href="#BenchmarkMarshal">func BenchmarkMarshal(b *testing.B)</a>

```
searchKey: asn1.BenchmarkMarshal
tags: [private]
```

```Go
func BenchmarkMarshal(b *testing.B)
```

### <a id="TestSetEncoder" href="#TestSetEncoder">func TestSetEncoder(t *testing.T)</a>

```
searchKey: asn1.TestSetEncoder
tags: [private]
```

```Go
func TestSetEncoder(t *testing.T)
```

### <a id="TestSetEncoderSETSliceSuffix" href="#TestSetEncoderSETSliceSuffix">func TestSetEncoderSETSliceSuffix(t *testing.T)</a>

```
searchKey: asn1.TestSetEncoderSETSliceSuffix
tags: [private]
```

```Go
func TestSetEncoderSETSliceSuffix(t *testing.T)
```

### <a id="BenchmarkUnmarshal" href="#BenchmarkUnmarshal">func BenchmarkUnmarshal(b *testing.B)</a>

```
searchKey: asn1.BenchmarkUnmarshal
tags: [private]
```

```Go
func BenchmarkUnmarshal(b *testing.B)
```

