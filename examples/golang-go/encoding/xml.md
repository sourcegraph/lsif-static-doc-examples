# Package xml

Package xml implements a simple XML 1.0 parser that understands XML name spaces. 

## Index

* [Constants](#const)
    * [const Header](#Header)
    * [const HyperDrive](#HyperDrive)
    * [const ImprobabilityDrive](#ImprobabilityDrive)
    * [const OK](#OK)
    * [const atomFeedString](#atomFeedString)
    * [const dontInitNilPointers](#dontInitNilPointers)
    * [const emptyXML](#emptyXML)
    * [const fAny](#fAny)
    * [const fAttr](#fAttr)
    * [const fCDATA](#fCDATA)
    * [const fCharData](#fCharData)
    * [const fComment](#fComment)
    * [const fElement](#fElement)
    * [const fInnerXML](#fInnerXML)
    * [const fMode](#fMode)
    * [const fOmitEmpty](#fOmitEmpty)
    * [const initNilPointers](#initNilPointers)
    * [const nonStrictInput](#nonStrictInput)
    * [const pathTestString](#pathTestString)
    * [const stkEOF](#stkEOF)
    * [const stkNs](#stkNs)
    * [const stkStart](#stkStart)
    * [const testInput](#testInput)
    * [const testInputAltEncoding](#testInputAltEncoding)
    * [const testScalarsInput](#testScalarsInput)
    * [const whitespaceAttrsXML](#whitespaceAttrsXML)
    * [const whitespaceValuesXML](#whitespaceValuesXML)
    * [const withoutNameTypeData](#withoutNameTypeData)
    * [const xmlName](#xmlName)
    * [const xmlPrefix](#xmlPrefix)
    * [const xmlURL](#xmlURL)
    * [const xmlnsPrefix](#xmlnsPrefix)
* [Variables](#var)
    * [var HTMLAutoClose](#HTMLAutoClose)
    * [var HTMLEntity](#HTMLEntity)
    * [var ageAttr](#ageAttr)
    * [var all](#all)
    * [var atomFeed](#atomFeed)
    * [var atomValue](#atomValue)
    * [var atomXML](#atomXML)
    * [var attrType](#attrType)
    * [var badPathTests](#badPathTests)
    * [var begComment](#begComment)
    * [var cdataEnd](#cdataEnd)
    * [var cdataEscape](#cdataEscape)
    * [var cdataStart](#cdataStart)
    * [var characterTests](#characterTests)
    * [var contentsAttr](#contentsAttr)
    * [var cookedTokens](#cookedTokens)
    * [var ddBytes](#ddBytes)
    * [var directivesWithCommentsInput](#directivesWithCommentsInput)
    * [var directivesWithCommentsTokens](#directivesWithCommentsTokens)
    * [var empty](#empty)
    * [var encodeTokenTests](#encodeTokenTests)
    * [var endComment](#endComment)
    * [var endProcInst](#endProcInst)
    * [var entity](#entity)
    * [var errRawToken](#errRawToken)
    * [var escAmp](#escAmp)
    * [var escApos](#escApos)
    * [var escCR](#escCR)
    * [var escFFFD](#escFFFD)
    * [var escGT](#escGT)
    * [var escLT](#escLT)
    * [var escNL](#escNL)
    * [var escQuot](#escQuot)
    * [var escTab](#escTab)
    * [var first](#first)
    * [var htmlAutoClose](#htmlAutoClose)
    * [var htmlEntity](#htmlEntity)
    * [var marshalErrorTests](#marshalErrorTests)
    * [var marshalIndentTests](#marshalIndentTests)
    * [var marshalTests](#marshalTests)
    * [var marshalerAttrType](#marshalerAttrType)
    * [var marshalerType](#marshalerType)
    * [var nameAttr](#nameAttr)
    * [var nameType](#nameType)
    * [var nestedDirectivesInput](#nestedDirectivesInput)
    * [var nestedDirectivesTokens](#nestedDirectivesTokens)
    * [var nilStruct](#nilStruct)
    * [var nonStrictTokens](#nonStrictTokens)
    * [var pathTests](#pathTests)
    * [var procInstTests](#procInstTests)
    * [var rawTokens](#rawTokens)
    * [var rawTokensAltEncoding](#rawTokensAltEncoding)
    * [var second](#second)
    * [var sixteen](#sixteen)
    * [var tableAttrs](#tableAttrs)
    * [var tables](#tables)
    * [var testEntity](#testEntity)
    * [var textMarshalerType](#textMarshalerType)
    * [var textUnmarshalerType](#textUnmarshalerType)
    * [var tinfoMap](#tinfoMap)
    * [var unmarshalerAttrType](#unmarshalerAttrType)
    * [var unmarshalerType](#unmarshalerType)
    * [var xmlInput](#xmlInput)
* [Types](#type)
    * [type AnyHolder struct](#AnyHolder)
    * [type AnyOmitTest struct](#AnyOmitTest)
    * [type AnySliceTest struct](#AnySliceTest)
    * [type AnyTest struct](#AnyTest)
    * [type Attr struct](#Attr)
    * [type AttrParent struct](#AttrParent)
    * [type AttrTest struct](#AttrTest)
    * [type AttrsTest struct](#AttrsTest)
    * [type BadAttr struct](#BadAttr)
    * [type BadPathEmbeddedA struct](#BadPathEmbeddedA)
    * [type BadPathEmbeddedB struct](#BadPathEmbeddedB)
    * [type BadPathTestA struct](#BadPathTestA)
    * [type BadPathTestB struct](#BadPathTestB)
    * [type BadPathTestC struct](#BadPathTestC)
    * [type BadPathTestD struct](#BadPathTestD)
    * [type Book struct](#Book)
    * [type CDataTest struct](#CDataTest)
    * [type CharData []byte](#CharData)
        * [func (c CharData) Copy() CharData](#CharData.Copy)
    * [type ChardataEmptyTest struct](#ChardataEmptyTest)
    * [type Child struct](#Child)
    * [type ChildToEmbed struct](#ChildToEmbed)
    * [type Comment []byte](#Comment)
        * [func (c Comment) Copy() Comment](#Comment.Copy)
    * [type Data struct](#Data)
    * [type Decoder struct](#Decoder)
        * [func NewDecoder(r io.Reader) *Decoder](#NewDecoder)
        * [func NewTokenDecoder(t TokenReader) *Decoder](#NewTokenDecoder)
        * [func (d *Decoder) Decode(v interface{}) error](#Decoder.Decode)
        * [func (d *Decoder) DecodeElement(v interface{}, start *StartElement) error](#Decoder.DecodeElement)
        * [func (d *Decoder) InputOffset() int64](#Decoder.InputOffset)
        * [func (d *Decoder) RawToken() (Token, error)](#Decoder.RawToken)
        * [func (d *Decoder) Skip() error](#Decoder.Skip)
        * [func (d *Decoder) Token() (Token, error)](#Decoder.Token)
        * [func (d *Decoder) attrval() []byte](#Decoder.attrval)
        * [func (d *Decoder) autoClose(t Token) (Token, bool)](#Decoder.autoClose)
        * [func (d *Decoder) getc() (b byte, ok bool)](#Decoder.getc)
        * [func (d *Decoder) mustgetc() (b byte, ok bool)](#Decoder.mustgetc)
        * [func (d *Decoder) name() (s string, ok bool)](#Decoder.name)
        * [func (d *Decoder) nsname() (name Name, ok bool)](#Decoder.nsname)
        * [func (d *Decoder) pop() *stack](#Decoder.pop)
        * [func (d *Decoder) popEOF() bool](#Decoder.popEOF)
        * [func (d *Decoder) popElement(t *EndElement) bool](#Decoder.popElement)
        * [func (d *Decoder) push(kind int) *stack](#Decoder.push)
        * [func (d *Decoder) pushEOF()](#Decoder.pushEOF)
        * [func (d *Decoder) pushElement(name Name)](#Decoder.pushElement)
        * [func (d *Decoder) pushNs(local string, url string, ok bool)](#Decoder.pushNs)
        * [func (d *Decoder) rawToken() (Token, error)](#Decoder.rawToken)
        * [func (d *Decoder) readName() (ok bool)](#Decoder.readName)
        * [func (d *Decoder) savedOffset() int](#Decoder.savedOffset)
        * [func (d *Decoder) space()](#Decoder.space)
        * [func (d *Decoder) switchToReader(r io.Reader)](#Decoder.switchToReader)
        * [func (d *Decoder) syntaxError(msg string) error](#Decoder.syntaxError)
        * [func (d *Decoder) text(quote int, cdata bool) []byte](#Decoder.text)
        * [func (d *Decoder) translate(n *Name, isElementName bool)](#Decoder.translate)
        * [func (d *Decoder) ungetc(b byte)](#Decoder.ungetc)
        * [func (d *Decoder) unmarshal(val reflect.Value, start *StartElement) error](#Decoder.unmarshal)
        * [func (d *Decoder) unmarshalAttr(val reflect.Value, attr Attr) error](#Decoder.unmarshalAttr)
        * [func (d *Decoder) unmarshalInterface(val Unmarshaler, start *StartElement) error](#Decoder.unmarshalInterface)
        * [func (d *Decoder) unmarshalPath(tinfo *typeInfo, sv reflect.Value, parents []string, start *StartElement) (consumed bool, err error)](#Decoder.unmarshalPath)
        * [func (d *Decoder) unmarshalTextInterface(val encoding.TextUnmarshaler) error](#Decoder.unmarshalTextInterface)
    * [type Departure struct](#Departure)
    * [type DirectAny struct](#DirectAny)
    * [type DirectCDATA struct](#DirectCDATA)
    * [type DirectChardata struct](#DirectChardata)
    * [type DirectComment struct](#DirectComment)
    * [type DirectElement struct](#DirectElement)
    * [type DirectInnerXML struct](#DirectInnerXML)
    * [type DirectOmitEmpty struct](#DirectOmitEmpty)
    * [type Directive []byte](#Directive)
        * [func (d Directive) Copy() Directive](#Directive.Copy)
    * [type Domain struct](#Domain)
    * [type DriveType int](#DriveType)
    * [type EmbedA struct](#EmbedA)
    * [type EmbedB struct](#EmbedB)
    * [type EmbedC struct](#EmbedC)
    * [type EmbedInt struct](#EmbedInt)
    * [type Encoder struct](#Encoder)
        * [func NewEncoder(w io.Writer) *Encoder](#NewEncoder)
        * [func (enc *Encoder) Encode(v interface{}) error](#Encoder.Encode)
        * [func (enc *Encoder) EncodeElement(v interface{}, start StartElement) error](#Encoder.EncodeElement)
        * [func (enc *Encoder) EncodeToken(t Token) error](#Encoder.EncodeToken)
        * [func (enc *Encoder) Flush() error](#Encoder.Flush)
        * [func (enc *Encoder) Indent(prefix, indent string)](#Encoder.Indent)
    * [type EndElement struct](#EndElement)
    * [type Entry struct](#Entry)
    * [type Event struct](#Event)
    * [type Failure struct{}](#Failure)
        * [func (Failure) UnmarshalXML(*Decoder, StartElement) error](#Failure.UnmarshalXML)
    * [type Feed struct](#Feed)
    * [type IXField struct](#IXField)
    * [type IfaceAny struct](#IfaceAny)
    * [type IfaceCDATA struct](#IfaceCDATA)
    * [type IfaceChardata struct](#IfaceChardata)
    * [type IfaceComment struct](#IfaceComment)
    * [type IfaceElement struct](#IfaceElement)
    * [type IfaceInnerXML struct](#IfaceInnerXML)
    * [type IfaceOmitEmpty struct](#IfaceOmitEmpty)
    * [type IgnoreTest struct](#IgnoreTest)
    * [type IndirAny struct](#IndirAny)
    * [type IndirCDATA struct](#IndirCDATA)
    * [type IndirChardata struct](#IndirChardata)
    * [type IndirComment struct](#IndirComment)
    * [type IndirElement struct](#IndirElement)
    * [type IndirInnerXML struct](#IndirInnerXML)
    * [type IndirOmitEmpty struct](#IndirOmitEmpty)
    * [type InnerStruct struct](#InnerStruct)
    * [type InvalidXMLName struct](#InvalidXMLName)
    * [type Link struct](#Link)
    * [type Marshaler interface](#Marshaler)
    * [type MarshalerAttr interface](#MarshalerAttr)
    * [type MarshalerStruct struct](#MarshalerStruct)
    * [type MixedNested struct](#MixedNested)
    * [type Movie struct](#Movie)
    * [type MyAttr struct](#MyAttr)
        * [func (m *MyAttr) UnmarshalXMLAttr(attr Attr) error](#MyAttr.UnmarshalXMLAttr)
    * [type MyBytes []byte](#MyBytes)
    * [type MyCharData struct](#MyCharData)
        * [func (m *MyCharData) UnmarshalXML(d *Decoder, start StartElement) error](#MyCharData.UnmarshalXML)
        * [func (m *MyCharData) UnmarshalXMLAttr(attr Attr) error](#MyCharData.UnmarshalXMLAttr)
    * [type MyInt int](#MyInt)
    * [type MyMarshalerAttrTest struct{}](#MyMarshalerAttrTest)
        * [func (m *MyMarshalerAttrTest) MarshalXMLAttr(name Name) (Attr, error)](#MyMarshalerAttrTest.MarshalXMLAttr)
        * [func (m *MyMarshalerAttrTest) UnmarshalXMLAttr(attr Attr) error](#MyMarshalerAttrTest.UnmarshalXMLAttr)
    * [type MyMarshalerTest struct{}](#MyMarshalerTest)
        * [func (m *MyMarshalerTest) MarshalXML(e *Encoder, start StartElement) error](#MyMarshalerTest.MarshalXML)
    * [type MyStruct struct](#MyStruct)
    * [type Name struct](#Name)
    * [type NameCasing struct](#NameCasing)
    * [type NameInField struct](#NameInField)
    * [type NamePrecedence struct](#NamePrecedence)
    * [type NamedType string](#NamedType)
    * [type NestedAndCData struct](#NestedAndCData)
    * [type NestedAndChardata struct](#NestedAndChardata)
    * [type NestedAndComment struct](#NestedAndComment)
    * [type NestedItems struct](#NestedItems)
    * [type NestedOrder struct](#NestedOrder)
    * [type NilTest struct](#NilTest)
    * [type OmitAttrTest struct](#OmitAttrTest)
    * [type OmitFieldTest struct](#OmitFieldTest)
    * [type OuterNamedOrderedStruct struct](#OuterNamedOrderedStruct)
    * [type OuterNamedStruct struct](#OuterNamedStruct)
    * [type OuterOuterStruct struct](#OuterOuterStruct)
    * [type OuterStruct struct](#OuterStruct)
    * [type Parent struct](#Parent)
    * [type Particle struct](#Particle)
    * [type Passenger struct](#Passenger)
    * [type PathTestA struct](#PathTestA)
    * [type PathTestB struct](#PathTestB)
    * [type PathTestC struct](#PathTestC)
    * [type PathTestD struct](#PathTestD)
    * [type PathTestE struct](#PathTestE)
    * [type PathTestItem struct](#PathTestItem)
    * [type PathTestSet struct](#PathTestSet)
    * [type Pea struct](#Pea)
    * [type Person struct](#Person)
    * [type Pi struct](#Pi)
    * [type Plain struct](#Plain)
    * [type Pod struct](#Pod)
    * [type PointerAnonFields struct](#PointerAnonFields)
    * [type PointerFieldsTest struct](#PointerFieldsTest)
    * [type Port struct](#Port)
    * [type PresenceTest struct](#PresenceTest)
    * [type ProcInst struct](#ProcInst)
        * [func (p ProcInst) Copy() ProcInst](#ProcInst.Copy)
    * [type RecurseA struct](#RecurseA)
    * [type RecurseB struct](#RecurseB)
    * [type SecretAgent struct](#SecretAgent)
    * [type Service struct](#Service)
    * [type Ship struct](#Ship)
    * [type StartElement struct](#StartElement)
        * [func defaultStart(typ reflect.Type, finfo *fieldInfo, startTemplate *StartElement) StartElement](#defaultStart)
        * [func (e StartElement) Copy() StartElement](#StartElement.Copy)
        * [func (e StartElement) End() EndElement](#StartElement.End)
    * [type Strings struct](#Strings)
    * [type SyntaxError struct](#SyntaxError)
        * [func (e *SyntaxError) Error() string](#SyntaxError.Error)
    * [type T1 struct{}](#T1)
    * [type T2 struct{}](#T2)
    * [type TAttr struct](#TAttr)
    * [type TableAttrs struct](#TableAttrs)
    * [type Tables struct](#Tables)
    * [type TagPathError struct](#TagPathError)
        * [func (e *TagPathError) Error() string](#TagPathError.Error)
    * [type TestThree struct](#TestThree)
    * [type Text struct](#Text)
        * [func NewText(text string) Text](#NewText)
    * [type Token interface{}](#Token)
        * [func CopyToken(t Token) Token](#CopyToken)
    * [type TokenReader interface](#TokenReader)
    * [type Universe struct](#Universe)
    * [type UnmarshalError string](#UnmarshalError)
        * [func (e UnmarshalError) Error() string](#UnmarshalError.Error)
    * [type Unmarshaler interface](#Unmarshaler)
    * [type UnmarshalerAttr interface](#UnmarshalerAttr)
    * [type UnsupportedTypeError struct](#UnsupportedTypeError)
        * [func (e *UnsupportedTypeError) Error() string](#UnsupportedTypeError.Error)
    * [type WhitespaceAttrsParent struct](#WhitespaceAttrsParent)
    * [type WhitespaceValuesParent struct](#WhitespaceValuesParent)
    * [type X struct](#X)
    * [type XMLNameWithTag struct](#XMLNameWithTag)
    * [type XMLNameWithoutTag struct](#XMLNameWithoutTag)
    * [type allScalars struct](#allScalars)
    * [type downCaser struct](#downCaser)
        * [func (d *downCaser) Read(p []byte) (int, error)](#downCaser.Read)
        * [func (d *downCaser) ReadByte() (c byte, err error)](#downCaser.ReadByte)
    * [type embedD struct](#embedD)
    * [type errWriter struct{}](#errWriter)
        * [func (errWriter) Write(p []byte) (n int, err error)](#errWriter.Write)
    * [type fieldFlags int](#fieldFlags)
    * [type fieldInfo struct](#fieldInfo)
        * [func lookupXMLName(typ reflect.Type) (xmlname *fieldInfo)](#lookupXMLName)
        * [func structFieldInfo(typ reflect.Type, f *reflect.StructField) (*fieldInfo, error)](#structFieldInfo)
        * [func (finfo *fieldInfo) value(v reflect.Value, shouldInitNilPointers bool) reflect.Value](#fieldInfo.value)
    * [type item struct](#item)
    * [type limitedBytesWriter struct](#limitedBytesWriter)
        * [func (lw *limitedBytesWriter) Write(p []byte) (n int, err error)](#limitedBytesWriter.Write)
    * [type mapper struct](#mapper)
        * [func (m mapper) Token() (Token, error)](#mapper.Token)
    * [type parentStack struct](#parentStack)
        * [func (s *parentStack) push(parents []string) error](#parentStack.push)
        * [func (s *parentStack) trim(parents []string) error](#parentStack.trim)
    * [type printer struct](#printer)
        * [func (p *printer) EscapeString(s string)](#printer.EscapeString)
        * [func (p *printer) cachedWriteError() error](#printer.cachedWriteError)
        * [func (p *printer) createAttrPrefix(url string) string](#printer.createAttrPrefix)
        * [func (p *printer) deleteAttrPrefix(prefix string)](#printer.deleteAttrPrefix)
        * [func (p *printer) markPrefix()](#printer.markPrefix)
        * [func (p *printer) marshalAttr(start *StartElement, name Name, val reflect.Value) error](#printer.marshalAttr)
        * [func (p *printer) marshalInterface(val Marshaler, start StartElement) error](#printer.marshalInterface)
        * [func (p *printer) marshalSimple(typ reflect.Type, val reflect.Value) (string, []byte, error)](#printer.marshalSimple)
        * [func (p *printer) marshalStruct(tinfo *typeInfo, val reflect.Value) error](#printer.marshalStruct)
        * [func (p *printer) marshalTextInterface(val encoding.TextMarshaler, start StartElement) error](#printer.marshalTextInterface)
        * [func (p *printer) marshalValue(val reflect.Value, finfo *fieldInfo, startTemplate *StartElement) error](#printer.marshalValue)
        * [func (p *printer) popPrefix()](#printer.popPrefix)
        * [func (p *printer) writeEnd(name Name) error](#printer.writeEnd)
        * [func (p *printer) writeIndent(depthDelta int)](#printer.writeIndent)
        * [func (p *printer) writeStart(start *StartElement) error](#printer.writeStart)
    * [type stack struct](#stack)
    * [type tokReader struct{}](#tokReader)
        * [func (tokReader) Token() (Token, error)](#tokReader.Token)
    * [type toks struct](#toks)
        * [func (t *toks) Token() (Token, error)](#toks.Token)
    * [type toksNil struct](#toksNil)
        * [func (t *toksNil) Token() (Token, error)](#toksNil.Token)
    * [type typeInfo struct](#typeInfo)
        * [func getTypeInfo(typ reflect.Type) (*typeInfo, error)](#getTypeInfo)
* [Functions](#func)
    * [func BenchmarkMarshal(b *testing.B)](#BenchmarkMarshal)
    * [func BenchmarkUnmarshal(b *testing.B)](#BenchmarkUnmarshal)
    * [func Escape(w io.Writer, s []byte)](#Escape)
    * [func EscapeText(w io.Writer, s []byte) error](#EscapeText)
    * [func Marshal(v interface{}) ([]byte, error)](#Marshal)
    * [func MarshalIndent(v interface{}, prefix, indent string) ([]byte, error)](#MarshalIndent)
    * [func ParseTime(str string) time.Time](#ParseTime)
    * [func TestAllScalars(t *testing.T)](#TestAllScalars)
    * [func TestCopyTokenCharData(t *testing.T)](#TestCopyTokenCharData)
    * [func TestCopyTokenStartElement(t *testing.T)](#TestCopyTokenStartElement)
    * [func TestDecodeEOF(t *testing.T)](#TestDecodeEOF)
    * [func TestDecodeEncode(t *testing.T)](#TestDecodeEncode)
    * [func TestDecodeNilToken(t *testing.T)](#TestDecodeNilToken)
    * [func TestDirectivesWithComments(t *testing.T)](#TestDirectivesWithComments)
    * [func TestDisallowedCharacters(t *testing.T)](#TestDisallowedCharacters)
    * [func TestEncodeToken(t *testing.T)](#TestEncodeToken)
    * [func TestEntityInsideCDATA(t *testing.T)](#TestEntityInsideCDATA)
    * [func TestEscapeTextIOErrors(t *testing.T)](#TestEscapeTextIOErrors)
    * [func TestEscapeTextInvalidChar(t *testing.T)](#TestEscapeTextInvalidChar)
    * [func TestInvalidInnerXMLType(t *testing.T)](#TestInvalidInnerXMLType)
    * [func TestInvalidXMLName(t *testing.T)](#TestInvalidXMLName)
    * [func TestIsInCharacterRange(t *testing.T)](#TestIsInCharacterRange)
    * [func TestIsValidDirective(t *testing.T)](#TestIsValidDirective)
    * [func TestIssue11405(t *testing.T)](#TestIssue11405)
    * [func TestIssue12417(t *testing.T)](#TestIssue12417)
    * [func TestIssue16158(t *testing.T)](#TestIssue16158)
    * [func TestIssue569(t *testing.T)](#TestIssue569)
    * [func TestIssue5880(t *testing.T)](#TestIssue5880)
    * [func TestMalformedComment(t *testing.T)](#TestMalformedComment)
    * [func TestMarshal(t *testing.T)](#TestMarshal)
    * [func TestMarshalErrors(t *testing.T)](#TestMarshalErrors)
    * [func TestMarshalFlush(t *testing.T)](#TestMarshalFlush)
    * [func TestMarshalIndent(t *testing.T)](#TestMarshalIndent)
    * [func TestMarshalNS(t *testing.T)](#TestMarshalNS)
    * [func TestMarshalNSAttr(t *testing.T)](#TestMarshalNSAttr)
    * [func TestMarshalWriteErrors(t *testing.T)](#TestMarshalWriteErrors)
    * [func TestMarshalWriteIOErrors(t *testing.T)](#TestMarshalWriteIOErrors)
    * [func TestNestedDirectives(t *testing.T)](#TestNestedDirectives)
    * [func TestNewTokenDecoderIdempotent(t *testing.T)](#TestNewTokenDecoderIdempotent)
    * [func TestNonStrictRawToken(t *testing.T)](#TestNonStrictRawToken)
    * [func TestProcInstEncodeToken(t *testing.T)](#TestProcInstEncodeToken)
    * [func TestProcInstEncoding(t *testing.T)](#TestProcInstEncoding)
    * [func TestRace9796(t *testing.T)](#TestRace9796)
    * [func TestRawToken(t *testing.T)](#TestRawToken)
    * [func TestRawTokenAltEncoding(t *testing.T)](#TestRawTokenAltEncoding)
    * [func TestRawTokenAltEncodingNoConverter(t *testing.T)](#TestRawTokenAltEncodingNoConverter)
    * [func TestRoundTrip(t *testing.T)](#TestRoundTrip)
    * [func TestSimpleUseOfEncodeToken(t *testing.T)](#TestSimpleUseOfEncodeToken)
    * [func TestStructPointerMarshal(t *testing.T)](#TestStructPointerMarshal)
    * [func TestSyntax(t *testing.T)](#TestSyntax)
    * [func TestSyntaxErrorLineNum(t *testing.T)](#TestSyntaxErrorLineNum)
    * [func TestToken(t *testing.T)](#TestToken)
    * [func TestTokenUnmarshaler(t *testing.T)](#TestTokenUnmarshaler)
    * [func TestTrailingRawToken(t *testing.T)](#TestTrailingRawToken)
    * [func TestTrailingToken(t *testing.T)](#TestTrailingToken)
    * [func TestUnmarshal(t *testing.T)](#TestUnmarshal)
    * [func TestUnmarshalAttr(t *testing.T)](#TestUnmarshalAttr)
    * [func TestUnmarshalBadPaths(t *testing.T)](#TestUnmarshalBadPaths)
    * [func TestUnmarshalEmptyValues(t *testing.T)](#TestUnmarshalEmptyValues)
    * [func TestUnmarshalFeed(t *testing.T)](#TestUnmarshalFeed)
    * [func TestUnmarshalIntoInterface(t *testing.T)](#TestUnmarshalIntoInterface)
    * [func TestUnmarshalNS(t *testing.T)](#TestUnmarshalNS)
    * [func TestUnmarshalNSAttr(t *testing.T)](#TestUnmarshalNSAttr)
    * [func TestUnmarshalPaths(t *testing.T)](#TestUnmarshalPaths)
    * [func TestUnmarshalWhitespaceAttrs(t *testing.T)](#TestUnmarshalWhitespaceAttrs)
    * [func TestUnmarshalWhitespaceValues(t *testing.T)](#TestUnmarshalWhitespaceValues)
    * [func TestUnmarshalWithoutNameType(t *testing.T)](#TestUnmarshalWithoutNameType)
    * [func TestUnmarshaler(t *testing.T)](#TestUnmarshaler)
    * [func TestUnquotedAttrs(t *testing.T)](#TestUnquotedAttrs)
    * [func TestValuelessAttrs(t *testing.T)](#TestValuelessAttrs)
    * [func TestWrapDecoder(t *testing.T)](#TestWrapDecoder)
    * [func Unmarshal(data []byte, v interface{}) error](#Unmarshal)
    * [func addFieldInfo(typ reflect.Type, tinfo *typeInfo, newf *fieldInfo) error](#addFieldInfo)
    * [func copyValue(dst reflect.Value, src []byte) (err error)](#copyValue)
    * [func emitCDATA(w io.Writer, s []byte) error](#emitCDATA)
    * [func escapeText(w io.Writer, s []byte, escapeNewline bool) error](#escapeText)
    * [func ifaceptr(x interface{}) interface{}](#ifaceptr)
    * [func indirect(vf reflect.Value) reflect.Value](#indirect)
    * [func isEmptyValue(v reflect.Value) bool](#isEmptyValue)
    * [func isInCharacterRange(r rune) (inrange bool)](#isInCharacterRange)
    * [func isName(s []byte) bool](#isName)
    * [func isNameByte(c byte) bool](#isNameByte)
    * [func isNameString(s string) bool](#isNameString)
    * [func isValidDirective(dir Directive) bool](#isValidDirective)
    * [func makeCopy(b []byte) []byte](#makeCopy)
    * [func min(a, b int) int](#min)
    * [func procInst(param, s string) string](#procInst)
    * [func receiverType(val interface{}) string](#receiverType)
    * [func stringptr(x string) *string](#stringptr)
    * [func testRawToken(t *testing.T, d *Decoder, raw string, rawTokens []Token)](#testRawToken)
    * [func testRoundTrip(t *testing.T, input string)](#testRoundTrip)
    * [func tokenMap(mapping func(t Token) Token) func(TokenReader) TokenReader](#tokenMap)


## <a id="const" href="#const">Constants</a>

### <a id="Header" href="#Header">const Header</a>

```
searchKey: xml.Header
tags: [constant string]
```

```Go
const Header = `<?xml version="1.0" encoding="UTF-8"?>` + "\n"
```

Header is a generic XML header suitable for use with the output of Marshal. This is not automatically added to any output of this package, it is provided as a convenience. 

### <a id="HyperDrive" href="#HyperDrive">const HyperDrive</a>

```
searchKey: xml.HyperDrive
tags: [constant number private]
```

```Go
const HyperDrive DriveType = iota
```

### <a id="ImprobabilityDrive" href="#ImprobabilityDrive">const ImprobabilityDrive</a>

```
searchKey: xml.ImprobabilityDrive
tags: [constant number private]
```

```Go
const ImprobabilityDrive
```

### <a id="OK" href="#OK">const OK</a>

```
searchKey: xml.OK
tags: [constant string private]
```

```Go
const OK = "OK"
```

### <a id="atomFeedString" href="#atomFeedString">const atomFeedString</a>

```
searchKey: xml.atomFeedString
tags: [constant string private]
```

```Go
const atomFeedString = ...
```

hget [http://codereview.appspot.com/rss/mine/rsc](http://codereview.appspot.com/rss/mine/rsc) 

### <a id="dontInitNilPointers" href="#dontInitNilPointers">const dontInitNilPointers</a>

```
searchKey: xml.dontInitNilPointers
tags: [constant boolean private]
```

```Go
const dontInitNilPointers = false
```

### <a id="emptyXML" href="#emptyXML">const emptyXML</a>

```
searchKey: xml.emptyXML
tags: [constant string private]
```

```Go
const emptyXML = ...
```

### <a id="fAny" href="#fAny">const fAny</a>

```
searchKey: xml.fAny
tags: [constant number private]
```

```Go
const fAny
```

### <a id="fAttr" href="#fAttr">const fAttr</a>

```
searchKey: xml.fAttr
tags: [constant number private]
```

```Go
const fAttr
```

### <a id="fCDATA" href="#fCDATA">const fCDATA</a>

```
searchKey: xml.fCDATA
tags: [constant number private]
```

```Go
const fCDATA
```

### <a id="fCharData" href="#fCharData">const fCharData</a>

```
searchKey: xml.fCharData
tags: [constant number private]
```

```Go
const fCharData
```

### <a id="fComment" href="#fComment">const fComment</a>

```
searchKey: xml.fComment
tags: [constant number private]
```

```Go
const fComment
```

### <a id="fElement" href="#fElement">const fElement</a>

```
searchKey: xml.fElement
tags: [constant number private]
```

```Go
const fElement fieldFlags = 1 << iota
```

### <a id="fInnerXML" href="#fInnerXML">const fInnerXML</a>

```
searchKey: xml.fInnerXML
tags: [constant number private]
```

```Go
const fInnerXML
```

### <a id="fMode" href="#fMode">const fMode</a>

```
searchKey: xml.fMode
tags: [constant number private]
```

```Go
const fMode = fElement | fAttr | fCDATA | fCharData | fInnerXML | fComment | fAny
```

### <a id="fOmitEmpty" href="#fOmitEmpty">const fOmitEmpty</a>

```
searchKey: xml.fOmitEmpty
tags: [constant number private]
```

```Go
const fOmitEmpty
```

### <a id="initNilPointers" href="#initNilPointers">const initNilPointers</a>

```
searchKey: xml.initNilPointers
tags: [constant boolean private]
```

```Go
const initNilPointers = true
```

### <a id="nonStrictInput" href="#nonStrictInput">const nonStrictInput</a>

```
searchKey: xml.nonStrictInput
tags: [constant string private]
```

```Go
const nonStrictInput = ...
```

### <a id="pathTestString" href="#pathTestString">const pathTestString</a>

```
searchKey: xml.pathTestString
tags: [constant string private]
```

```Go
const pathTestString = ...
```

### <a id="stkEOF" href="#stkEOF">const stkEOF</a>

```
searchKey: xml.stkEOF
tags: [constant number private]
```

```Go
const stkEOF
```

### <a id="stkNs" href="#stkNs">const stkNs</a>

```
searchKey: xml.stkNs
tags: [constant number private]
```

```Go
const stkNs
```

### <a id="stkStart" href="#stkStart">const stkStart</a>

```
searchKey: xml.stkStart
tags: [constant number private]
```

```Go
const stkStart = iota
```

### <a id="testInput" href="#testInput">const testInput</a>

```
searchKey: xml.testInput
tags: [constant string private]
```

```Go
const testInput = ...
```

### <a id="testInputAltEncoding" href="#testInputAltEncoding">const testInputAltEncoding</a>

```
searchKey: xml.testInputAltEncoding
tags: [constant string private]
```

```Go
const testInputAltEncoding = ...
```

### <a id="testScalarsInput" href="#testScalarsInput">const testScalarsInput</a>

```
searchKey: xml.testScalarsInput
tags: [constant string private]
```

```Go
const testScalarsInput = ...
```

### <a id="whitespaceAttrsXML" href="#whitespaceAttrsXML">const whitespaceAttrsXML</a>

```
searchKey: xml.whitespaceAttrsXML
tags: [constant string private]
```

```Go
const whitespaceAttrsXML = ...
```

### <a id="whitespaceValuesXML" href="#whitespaceValuesXML">const whitespaceValuesXML</a>

```
searchKey: xml.whitespaceValuesXML
tags: [constant string private]
```

```Go
const whitespaceValuesXML = ...
```

### <a id="withoutNameTypeData" href="#withoutNameTypeData">const withoutNameTypeData</a>

```
searchKey: xml.withoutNameTypeData
tags: [constant string private]
```

```Go
const withoutNameTypeData = `
<?xml version="1.0" charset="utf-8"?>
<Test3 Attr="OK" />`
```

### <a id="xmlName" href="#xmlName">const xmlName</a>

```
searchKey: xml.xmlName
tags: [constant string private]
```

```Go
const xmlName = "XMLName"
```

### <a id="xmlPrefix" href="#xmlPrefix">const xmlPrefix</a>

```
searchKey: xml.xmlPrefix
tags: [constant string private]
```

```Go
const xmlPrefix = "xml"
```

### <a id="xmlURL" href="#xmlURL">const xmlURL</a>

```
searchKey: xml.xmlURL
tags: [constant string private]
```

```Go
const xmlURL = "http://www.w3.org/XML/1998/namespace"
```

### <a id="xmlnsPrefix" href="#xmlnsPrefix">const xmlnsPrefix</a>

```
searchKey: xml.xmlnsPrefix
tags: [constant string private]
```

```Go
const xmlnsPrefix = "xmlns"
```

## <a id="var" href="#var">Variables</a>

### <a id="HTMLAutoClose" href="#HTMLAutoClose">var HTMLAutoClose</a>

```
searchKey: xml.HTMLAutoClose
tags: [variable array string]
```

```Go
var HTMLAutoClose []string = htmlAutoClose
```

HTMLAutoClose is the set of HTML elements that should be considered to close automatically. 

See the Decoder.Strict and Decoder.Entity fields' documentation. 

### <a id="HTMLEntity" href="#HTMLEntity">var HTMLEntity</a>

```
searchKey: xml.HTMLEntity
tags: [variable object]
```

```Go
var HTMLEntity map[string]string = htmlEntity
```

HTMLEntity is an entity map containing translations for the standard HTML entity characters. 

See the Decoder.Strict and Decoder.Entity fields' documentation. 

### <a id="ageAttr" href="#ageAttr">var ageAttr</a>

```
searchKey: xml.ageAttr
tags: [variable number private]
```

```Go
var ageAttr = uint(12)
```

### <a id="all" href="#all">var all</a>

```
searchKey: xml.all
tags: [variable struct private]
```

```Go
var all = ...
```

### <a id="atomFeed" href="#atomFeed">var atomFeed</a>

```
searchKey: xml.atomFeed
tags: [variable struct private]
```

```Go
var atomFeed = ...
```

### <a id="atomValue" href="#atomValue">var atomValue</a>

```
searchKey: xml.atomValue
tags: [variable struct private]
```

```Go
var atomValue = ...
```

### <a id="atomXML" href="#atomXML">var atomXML</a>

```
searchKey: xml.atomXML
tags: [variable string private]
```

```Go
var atomXML = ...
```

### <a id="attrType" href="#attrType">var attrType</a>

```
searchKey: xml.attrType
tags: [variable interface private]
```

```Go
var attrType = reflect.TypeOf(Attr{})
```

### <a id="badPathTests" href="#badPathTests">var badPathTests</a>

```
searchKey: xml.badPathTests
tags: [variable array struct private]
```

```Go
var badPathTests = ...
```

### <a id="begComment" href="#begComment">var begComment</a>

```
searchKey: xml.begComment
tags: [variable array number private]
```

```Go
var begComment = []byte("<!--")
```

### <a id="cdataEnd" href="#cdataEnd">var cdataEnd</a>

```
searchKey: xml.cdataEnd
tags: [variable array number private]
```

```Go
var cdataEnd = []byte("]]>")
```

### <a id="cdataEscape" href="#cdataEscape">var cdataEscape</a>

```
searchKey: xml.cdataEscape
tags: [variable array number private]
```

```Go
var cdataEscape = []byte("]]]]><![CDATA[>")
```

### <a id="cdataStart" href="#cdataStart">var cdataStart</a>

```
searchKey: xml.cdataStart
tags: [variable array number private]
```

```Go
var cdataStart = []byte("<![CDATA[")
```

### <a id="characterTests" href="#characterTests">var characterTests</a>

```
searchKey: xml.characterTests
tags: [variable array struct private]
```

```Go
var characterTests = ...
```

### <a id="contentsAttr" href="#contentsAttr">var contentsAttr</a>

```
searchKey: xml.contentsAttr
tags: [variable string private]
```

```Go
var contentsAttr = "lorem ipsum"
```

### <a id="cookedTokens" href="#cookedTokens">var cookedTokens</a>

```
searchKey: xml.cookedTokens
tags: [variable array interface private]
```

```Go
var cookedTokens = ...
```

### <a id="ddBytes" href="#ddBytes">var ddBytes</a>

```
searchKey: xml.ddBytes
tags: [variable array number private]
```

```Go
var ddBytes = []byte("--")
```

### <a id="directivesWithCommentsInput" href="#directivesWithCommentsInput">var directivesWithCommentsInput</a>

```
searchKey: xml.directivesWithCommentsInput
tags: [variable string private]
```

```Go
var directivesWithCommentsInput = ...
```

### <a id="directivesWithCommentsTokens" href="#directivesWithCommentsTokens">var directivesWithCommentsTokens</a>

```
searchKey: xml.directivesWithCommentsTokens
tags: [variable array interface private]
```

```Go
var directivesWithCommentsTokens = ...
```

### <a id="empty" href="#empty">var empty</a>

```
searchKey: xml.empty
tags: [variable string private]
```

```Go
var empty = ""
```

### <a id="encodeTokenTests" href="#encodeTokenTests">var encodeTokenTests</a>

```
searchKey: xml.encodeTokenTests
tags: [variable array struct private]
```

```Go
var encodeTokenTests = ...
```

### <a id="endComment" href="#endComment">var endComment</a>

```
searchKey: xml.endComment
tags: [variable array number private]
```

```Go
var endComment = []byte("-->")
```

### <a id="endProcInst" href="#endProcInst">var endProcInst</a>

```
searchKey: xml.endProcInst
tags: [variable array number private]
```

```Go
var endProcInst = []byte("?>")
```

### <a id="entity" href="#entity">var entity</a>

```
searchKey: xml.entity
tags: [variable object private]
```

```Go
var entity = ...
```

### <a id="errRawToken" href="#errRawToken">var errRawToken</a>

```
searchKey: xml.errRawToken
tags: [variable interface private]
```

```Go
var errRawToken = errors.New("xml: cannot use RawToken from UnmarshalXML method")
```

### <a id="escAmp" href="#escAmp">var escAmp</a>

```
searchKey: xml.escAmp
tags: [variable array number private]
```

```Go
var escAmp = []byte("&amp;")
```

### <a id="escApos" href="#escApos">var escApos</a>

```
searchKey: xml.escApos
tags: [variable array number private]
```

```Go
var escApos = []byte("&#39;") // shorter than "&apos;"

```

### <a id="escCR" href="#escCR">var escCR</a>

```
searchKey: xml.escCR
tags: [variable array number private]
```

```Go
var escCR = []byte("&#xD;")
```

### <a id="escFFFD" href="#escFFFD">var escFFFD</a>

```
searchKey: xml.escFFFD
tags: [variable array number private]
```

```Go
var escFFFD = []byte("\uFFFD") // Unicode replacement character

```

### <a id="escGT" href="#escGT">var escGT</a>

```
searchKey: xml.escGT
tags: [variable array number private]
```

```Go
var escGT = []byte("&gt;")
```

### <a id="escLT" href="#escLT">var escLT</a>

```
searchKey: xml.escLT
tags: [variable array number private]
```

```Go
var escLT = []byte("&lt;")
```

### <a id="escNL" href="#escNL">var escNL</a>

```
searchKey: xml.escNL
tags: [variable array number private]
```

```Go
var escNL = []byte("&#xA;")
```

### <a id="escQuot" href="#escQuot">var escQuot</a>

```
searchKey: xml.escQuot
tags: [variable array number private]
```

```Go
var escQuot = []byte("&#34;") // shorter than "&quot;"

```

### <a id="escTab" href="#escTab">var escTab</a>

```
searchKey: xml.escTab
tags: [variable array number private]
```

```Go
var escTab = []byte("&#x9;")
```

### <a id="first" href="#first">var first</a>

```
searchKey: xml.first
tags: [variable struct private]
```

```Go
var first = ...
```

### <a id="htmlAutoClose" href="#htmlAutoClose">var htmlAutoClose</a>

```
searchKey: xml.htmlAutoClose
tags: [variable array string private]
```

```Go
var htmlAutoClose = ...
```

### <a id="htmlEntity" href="#htmlEntity">var htmlEntity</a>

```
searchKey: xml.htmlEntity
tags: [variable object private]
```

```Go
var htmlEntity = ...
```

### <a id="marshalErrorTests" href="#marshalErrorTests">var marshalErrorTests</a>

```
searchKey: xml.marshalErrorTests
tags: [variable array struct private]
```

```Go
var marshalErrorTests = ...
```

### <a id="marshalIndentTests" href="#marshalIndentTests">var marshalIndentTests</a>

```
searchKey: xml.marshalIndentTests
tags: [variable array struct private]
```

```Go
var marshalIndentTests = ...
```

### <a id="marshalTests" href="#marshalTests">var marshalTests</a>

```
searchKey: xml.marshalTests
tags: [variable array struct private]
```

```Go
var marshalTests = ...
```

Unless explicitly stated as such (or *Plain), all of the tests below are two-way tests. When introducing new tests, please try to make them two-way as well to ensure that marshaling and unmarshaling are as symmetrical as feasible. 

### <a id="marshalerAttrType" href="#marshalerAttrType">var marshalerAttrType</a>

```
searchKey: xml.marshalerAttrType
tags: [variable interface private]
```

```Go
var marshalerAttrType = reflect.TypeOf((*MarshalerAttr)(nil)).Elem()
```

### <a id="marshalerType" href="#marshalerType">var marshalerType</a>

```
searchKey: xml.marshalerType
tags: [variable interface private]
```

```Go
var marshalerType = reflect.TypeOf((*Marshaler)(nil)).Elem()
```

### <a id="nameAttr" href="#nameAttr">var nameAttr</a>

```
searchKey: xml.nameAttr
tags: [variable string private]
```

```Go
var nameAttr = "Sarah"
```

### <a id="nameType" href="#nameType">var nameType</a>

```
searchKey: xml.nameType
tags: [variable interface private]
```

```Go
var nameType = reflect.TypeOf(Name{})
```

### <a id="nestedDirectivesInput" href="#nestedDirectivesInput">var nestedDirectivesInput</a>

```
searchKey: xml.nestedDirectivesInput
tags: [variable string private]
```

```Go
var nestedDirectivesInput = ...
```

### <a id="nestedDirectivesTokens" href="#nestedDirectivesTokens">var nestedDirectivesTokens</a>

```
searchKey: xml.nestedDirectivesTokens
tags: [variable array interface private]
```

```Go
var nestedDirectivesTokens = ...
```

### <a id="nilStruct" href="#nilStruct">var nilStruct</a>

```
searchKey: xml.nilStruct
tags: [variable struct private]
```

```Go
var nilStruct *Ship
```

### <a id="nonStrictTokens" href="#nonStrictTokens">var nonStrictTokens</a>

```
searchKey: xml.nonStrictTokens
tags: [variable array interface private]
```

```Go
var nonStrictTokens = ...
```

### <a id="pathTests" href="#pathTests">var pathTests</a>

```
searchKey: xml.pathTests
tags: [variable array interface private]
```

```Go
var pathTests = ...
```

### <a id="procInstTests" href="#procInstTests">var procInstTests</a>

```
searchKey: xml.procInstTests
tags: [variable array struct private]
```

```Go
var procInstTests = ...
```

### <a id="rawTokens" href="#rawTokens">var rawTokens</a>

```
searchKey: xml.rawTokens
tags: [variable array interface private]
```

```Go
var rawTokens = ...
```

### <a id="rawTokensAltEncoding" href="#rawTokensAltEncoding">var rawTokensAltEncoding</a>

```
searchKey: xml.rawTokensAltEncoding
tags: [variable array interface private]
```

```Go
var rawTokensAltEncoding = ...
```

### <a id="second" href="#second">var second</a>

```
searchKey: xml.second
tags: [variable struct private]
```

```Go
var second = ...
```

### <a id="sixteen" href="#sixteen">var sixteen</a>

```
searchKey: xml.sixteen
tags: [variable string private]
```

```Go
var sixteen = "16"
```

### <a id="tableAttrs" href="#tableAttrs">var tableAttrs</a>

```
searchKey: xml.tableAttrs
tags: [variable array struct private]
```

```Go
var tableAttrs = ...
```

### <a id="tables" href="#tables">var tables</a>

```
searchKey: xml.tables
tags: [variable array struct private]
```

```Go
var tables = ...
```

### <a id="testEntity" href="#testEntity">var testEntity</a>

```
searchKey: xml.testEntity
tags: [variable object private]
```

```Go
var testEntity = map[string]string{"何": "What", "is-it": "is it?"}
```

### <a id="textMarshalerType" href="#textMarshalerType">var textMarshalerType</a>

```
searchKey: xml.textMarshalerType
tags: [variable interface private]
```

```Go
var textMarshalerType = reflect.TypeOf((*encoding.TextMarshaler)(nil)).Elem()
```

### <a id="textUnmarshalerType" href="#textUnmarshalerType">var textUnmarshalerType</a>

```
searchKey: xml.textUnmarshalerType
tags: [variable interface private]
```

```Go
var textUnmarshalerType = reflect.TypeOf((*encoding.TextUnmarshaler)(nil)).Elem()
```

### <a id="tinfoMap" href="#tinfoMap">var tinfoMap</a>

```
searchKey: xml.tinfoMap
tags: [variable struct private]
```

```Go
var tinfoMap sync.Map // map[reflect.Type]*typeInfo

```

### <a id="unmarshalerAttrType" href="#unmarshalerAttrType">var unmarshalerAttrType</a>

```
searchKey: xml.unmarshalerAttrType
tags: [variable interface private]
```

```Go
var unmarshalerAttrType = reflect.TypeOf((*UnmarshalerAttr)(nil)).Elem()
```

### <a id="unmarshalerType" href="#unmarshalerType">var unmarshalerType</a>

```
searchKey: xml.unmarshalerType
tags: [variable interface private]
```

```Go
var unmarshalerType = reflect.TypeOf((*Unmarshaler)(nil)).Elem()
```

### <a id="xmlInput" href="#xmlInput">var xmlInput</a>

```
searchKey: xml.xmlInput
tags: [variable array string private]
```

```Go
var xmlInput = ...
```

## <a id="type" href="#type">Types</a>

### <a id="AnyHolder" href="#AnyHolder">type AnyHolder struct</a>

```
searchKey: xml.AnyHolder
tags: [struct private]
```

```Go
type AnyHolder struct {
	XMLName Name
	XML     string `xml:",innerxml"`
}
```

### <a id="AnyOmitTest" href="#AnyOmitTest">type AnyOmitTest struct</a>

```
searchKey: xml.AnyOmitTest
tags: [struct private]
```

```Go
type AnyOmitTest struct {
	XMLName  struct{}   `xml:"a"`
	Nested   string     `xml:"nested>value"`
	AnyField *AnyHolder `xml:",any,omitempty"`
}
```

### <a id="AnySliceTest" href="#AnySliceTest">type AnySliceTest struct</a>

```
searchKey: xml.AnySliceTest
tags: [struct private]
```

```Go
type AnySliceTest struct {
	XMLName  struct{}    `xml:"a"`
	Nested   string      `xml:"nested>value"`
	AnyField []AnyHolder `xml:",any"`
}
```

### <a id="AnyTest" href="#AnyTest">type AnyTest struct</a>

```
searchKey: xml.AnyTest
tags: [struct private]
```

```Go
type AnyTest struct {
	XMLName  struct{}  `xml:"a"`
	Nested   string    `xml:"nested>value"`
	AnyField AnyHolder `xml:",any"`
}
```

### <a id="Attr" href="#Attr">type Attr struct</a>

```
searchKey: xml.Attr
tags: [struct]
```

```Go
type Attr struct {
	Name  Name
	Value string
}
```

An Attr represents an attribute in an XML element (Name=Value). 

### <a id="AttrParent" href="#AttrParent">type AttrParent struct</a>

```
searchKey: xml.AttrParent
tags: [struct private]
```

```Go
type AttrParent struct {
	X string `xml:"X>Y,attr"`
}
```

### <a id="AttrTest" href="#AttrTest">type AttrTest struct</a>

```
searchKey: xml.AttrTest
tags: [struct private]
```

```Go
type AttrTest struct {
	Int   int     `xml:",attr"`
	Named int     `xml:"int,attr"`
	Float float64 `xml:",attr"`
	Uint8 uint8   `xml:",attr"`
	Bool  bool    `xml:",attr"`
	Str   string  `xml:",attr"`
	Bytes []byte  `xml:",attr"`
}
```

### <a id="AttrsTest" href="#AttrsTest">type AttrsTest struct</a>

```
searchKey: xml.AttrsTest
tags: [struct private]
```

```Go
type AttrsTest struct {
	Attrs []Attr  `xml:",any,attr"`
	Int   int     `xml:",attr"`
	Named int     `xml:"int,attr"`
	Float float64 `xml:",attr"`
	Uint8 uint8   `xml:",attr"`
	Bool  bool    `xml:",attr"`
	Str   string  `xml:",attr"`
	Bytes []byte  `xml:",attr"`
}
```

### <a id="BadAttr" href="#BadAttr">type BadAttr struct</a>

```
searchKey: xml.BadAttr
tags: [struct private]
```

```Go
type BadAttr struct {
	Name map[string]string `xml:"name,attr"`
}
```

### <a id="BadPathEmbeddedA" href="#BadPathEmbeddedA">type BadPathEmbeddedA struct</a>

```
searchKey: xml.BadPathEmbeddedA
tags: [struct private]
```

```Go
type BadPathEmbeddedA struct {
	First string
}
```

### <a id="BadPathEmbeddedB" href="#BadPathEmbeddedB">type BadPathEmbeddedB struct</a>

```
searchKey: xml.BadPathEmbeddedB
tags: [struct private]
```

```Go
type BadPathEmbeddedB struct {
	Second string `xml:"First"`
}
```

### <a id="BadPathTestA" href="#BadPathTestA">type BadPathTestA struct</a>

```
searchKey: xml.BadPathTestA
tags: [struct private]
```

```Go
type BadPathTestA struct {
	First  string `xml:"items>item1"`
	Other  string `xml:"items>item2"`
	Second string `xml:"items"`
}
```

### <a id="BadPathTestB" href="#BadPathTestB">type BadPathTestB struct</a>

```
searchKey: xml.BadPathTestB
tags: [struct private]
```

```Go
type BadPathTestB struct {
	Other  string `xml:"items>item2>value"`
	First  string `xml:"items>item1"`
	Second string `xml:"items>item1>value"`
}
```

### <a id="BadPathTestC" href="#BadPathTestC">type BadPathTestC struct</a>

```
searchKey: xml.BadPathTestC
tags: [struct private]
```

```Go
type BadPathTestC struct {
	First  string
	Second string `xml:"First"`
}
```

### <a id="BadPathTestD" href="#BadPathTestD">type BadPathTestD struct</a>

```
searchKey: xml.BadPathTestD
tags: [struct private]
```

```Go
type BadPathTestD struct {
	BadPathEmbeddedA
	BadPathEmbeddedB
}
```

### <a id="Book" href="#Book">type Book struct</a>

```
searchKey: xml.Book
tags: [struct private]
```

```Go
type Book struct {
	XMLName struct{} `xml:"book"`
	Title   string   `xml:",chardata"`
}
```

### <a id="CDataTest" href="#CDataTest">type CDataTest struct</a>

```
searchKey: xml.CDataTest
tags: [struct private]
```

```Go
type CDataTest struct {
	Chardata string `xml:",cdata"`
}
```

### <a id="CharData" href="#CharData">type CharData []byte</a>

```
searchKey: xml.CharData
tags: [array number]
```

```Go
type CharData []byte
```

A CharData represents XML character data (raw text), in which XML escape sequences have been replaced by the characters they represent. 

#### <a id="CharData.Copy" href="#CharData.Copy">func (c CharData) Copy() CharData</a>

```
searchKey: xml.CharData.Copy
tags: [method]
```

```Go
func (c CharData) Copy() CharData
```

Copy creates a new copy of CharData. 

### <a id="ChardataEmptyTest" href="#ChardataEmptyTest">type ChardataEmptyTest struct</a>

```
searchKey: xml.ChardataEmptyTest
tags: [struct private]
```

```Go
type ChardataEmptyTest struct {
	XMLName  Name    `xml:"test"`
	Contents *string `xml:",chardata"`
}
```

### <a id="Child" href="#Child">type Child struct</a>

```
searchKey: xml.Child
tags: [struct private]
```

```Go
type Child struct {
	G struct {
		I int
	}
}
```

### <a id="ChildToEmbed" href="#ChildToEmbed">type ChildToEmbed struct</a>

```
searchKey: xml.ChildToEmbed
tags: [struct private]
```

```Go
type ChildToEmbed struct {
	X bool
}
```

### <a id="Comment" href="#Comment">type Comment []byte</a>

```
searchKey: xml.Comment
tags: [array number]
```

```Go
type Comment []byte
```

A Comment represents an XML comment of the form <!--comment-->. The bytes do not include the <!-- and --> comment markers. 

#### <a id="Comment.Copy" href="#Comment.Copy">func (c Comment) Copy() Comment</a>

```
searchKey: xml.Comment.Copy
tags: [method]
```

```Go
func (c Comment) Copy() Comment
```

Copy creates a new copy of Comment. 

### <a id="Data" href="#Data">type Data struct</a>

```
searchKey: xml.Data
tags: [struct private]
```

```Go
type Data struct {
	Bytes  []byte
	Attr   []byte `xml:",attr"`
	Custom MyBytes
}
```

### <a id="Decoder" href="#Decoder">type Decoder struct</a>

```
searchKey: xml.Decoder
tags: [struct]
```

```Go
type Decoder struct {
	// Strict defaults to true, enforcing the requirements
	// of the XML specification.
	// If set to false, the parser allows input containing common
	// mistakes:
	//	* If an element is missing an end tag, the parser invents
	//	  end tags as necessary to keep the return values from Token
	//	  properly balanced.
	//	* In attribute values and character data, unknown or malformed
	//	  character entities (sequences beginning with &) are left alone.
	//
	// Setting:
	//
	//	d.Strict = false
	//	d.AutoClose = xml.HTMLAutoClose
	//	d.Entity = xml.HTMLEntity
	//
	// creates a parser that can handle typical HTML.
	//
	// Strict mode does not enforce the requirements of the XML name spaces TR.
	// In particular it does not reject name space tags using undefined prefixes.
	// Such tags are recorded with the unknown prefix as the name space URL.
	Strict bool

	// When Strict == false, AutoClose indicates a set of elements to
	// consider closed immediately after they are opened, regardless
	// of whether an end element is present.
	AutoClose []string

	// Entity can be used to map non-standard entity names to string replacements.
	// The parser behaves as if these standard mappings are present in the map,
	// regardless of the actual map content:
	//
	//	"lt": "<",
	//	"gt": ">",
	//	"amp": "&",
	//	"apos": "'",
	//	"quot": `"`,
	Entity map[string]string

	// CharsetReader, if non-nil, defines a function to generate
	// charset-conversion readers, converting from the provided
	// non-UTF-8 charset into UTF-8. If CharsetReader is nil or
	// returns an error, parsing stops with an error. One of the
	// CharsetReader's result values must be non-nil.
	CharsetReader func(charset string, input io.Reader) (io.Reader, error)

	// DefaultSpace sets the default name space used for unadorned tags,
	// as if the entire XML stream were wrapped in an element containing
	// the attribute xmlns="DefaultSpace".
	DefaultSpace string

	r              io.ByteReader
	t              TokenReader
	buf            bytes.Buffer
	saved          *bytes.Buffer
	stk            *stack
	free           *stack
	needClose      bool
	toClose        Name
	nextToken      Token
	nextByte       int
	ns             map[string]string
	err            error
	line           int
	offset         int64
	unmarshalDepth int
}
```

A Decoder represents an XML parser reading a particular input stream. The parser assumes that its input is encoded in UTF-8. 

#### <a id="NewDecoder" href="#NewDecoder">func NewDecoder(r io.Reader) *Decoder</a>

```
searchKey: xml.NewDecoder
tags: [function]
```

```Go
func NewDecoder(r io.Reader) *Decoder
```

NewDecoder creates a new XML parser reading from r. If r does not implement io.ByteReader, NewDecoder will do its own buffering. 

#### <a id="NewTokenDecoder" href="#NewTokenDecoder">func NewTokenDecoder(t TokenReader) *Decoder</a>

```
searchKey: xml.NewTokenDecoder
tags: [function]
```

```Go
func NewTokenDecoder(t TokenReader) *Decoder
```

NewTokenDecoder creates a new XML parser using an underlying token stream. 

#### <a id="Decoder.Decode" href="#Decoder.Decode">func (d *Decoder) Decode(v interface{}) error</a>

```
searchKey: xml.Decoder.Decode
tags: [method]
```

```Go
func (d *Decoder) Decode(v interface{}) error
```

Decode works like Unmarshal, except it reads the decoder stream to find the start element. 

#### <a id="Decoder.DecodeElement" href="#Decoder.DecodeElement">func (d *Decoder) DecodeElement(v interface{}, start *StartElement) error</a>

```
searchKey: xml.Decoder.DecodeElement
tags: [method]
```

```Go
func (d *Decoder) DecodeElement(v interface{}, start *StartElement) error
```

DecodeElement works like Unmarshal except that it takes a pointer to the start XML element to decode into v. It is useful when a client reads some raw XML tokens itself but also wants to defer to Unmarshal for some elements. 

#### <a id="Decoder.InputOffset" href="#Decoder.InputOffset">func (d *Decoder) InputOffset() int64</a>

```
searchKey: xml.Decoder.InputOffset
tags: [method]
```

```Go
func (d *Decoder) InputOffset() int64
```

InputOffset returns the input stream byte offset of the current decoder position. The offset gives the location of the end of the most recently returned token and the beginning of the next token. 

#### <a id="Decoder.RawToken" href="#Decoder.RawToken">func (d *Decoder) RawToken() (Token, error)</a>

```
searchKey: xml.Decoder.RawToken
tags: [method]
```

```Go
func (d *Decoder) RawToken() (Token, error)
```

RawToken is like Token but does not verify that start and end elements match and does not translate name space prefixes to their corresponding URLs. 

#### <a id="Decoder.Skip" href="#Decoder.Skip">func (d *Decoder) Skip() error</a>

```
searchKey: xml.Decoder.Skip
tags: [method]
```

```Go
func (d *Decoder) Skip() error
```

Skip reads tokens until it has consumed the end element matching the most recent start element already consumed. It recurs if it encounters a start element, so it can be used to skip nested structures. It returns nil if it finds an end element matching the start element; otherwise it returns an error describing the problem. 

#### <a id="Decoder.Token" href="#Decoder.Token">func (d *Decoder) Token() (Token, error)</a>

```
searchKey: xml.Decoder.Token
tags: [method]
```

```Go
func (d *Decoder) Token() (Token, error)
```

Token returns the next XML token in the input stream. At the end of the input stream, Token returns nil, io.EOF. 

Slices of bytes in the returned token data refer to the parser's internal buffer and remain valid only until the next call to Token. To acquire a copy of the bytes, call CopyToken or the token's Copy method. 

Token expands self-closing elements such as <br> into separate start and end elements returned by successive calls. 

Token guarantees that the StartElement and EndElement tokens it returns are properly nested and matched: if Token encounters an unexpected end element or EOF before all expected end elements, it will return an error. 

Token implements XML name spaces as described by [https://www.w3.org/TR/REC-xml-names/](https://www.w3.org/TR/REC-xml-names/). Each of the Name structures contained in the Token has the Space set to the URL identifying its name space when known. If Token encounters an unrecognized name space prefix, it uses the prefix as the Space rather than report an error. 

#### <a id="Decoder.attrval" href="#Decoder.attrval">func (d *Decoder) attrval() []byte</a>

```
searchKey: xml.Decoder.attrval
tags: [method private]
```

```Go
func (d *Decoder) attrval() []byte
```

#### <a id="Decoder.autoClose" href="#Decoder.autoClose">func (d *Decoder) autoClose(t Token) (Token, bool)</a>

```
searchKey: xml.Decoder.autoClose
tags: [method private]
```

```Go
func (d *Decoder) autoClose(t Token) (Token, bool)
```

If the top element on the stack is autoclosing and t is not the end tag, invent the end tag. 

#### <a id="Decoder.getc" href="#Decoder.getc">func (d *Decoder) getc() (b byte, ok bool)</a>

```
searchKey: xml.Decoder.getc
tags: [method private]
```

```Go
func (d *Decoder) getc() (b byte, ok bool)
```

Read a single byte. If there is no byte to read, return ok==false and leave the error in d.err. Maintain line number. 

#### <a id="Decoder.mustgetc" href="#Decoder.mustgetc">func (d *Decoder) mustgetc() (b byte, ok bool)</a>

```
searchKey: xml.Decoder.mustgetc
tags: [method private]
```

```Go
func (d *Decoder) mustgetc() (b byte, ok bool)
```

Must read a single byte. If there is no byte to read, set d.err to SyntaxError("unexpected EOF") and return ok==false 

#### <a id="Decoder.name" href="#Decoder.name">func (d *Decoder) name() (s string, ok bool)</a>

```
searchKey: xml.Decoder.name
tags: [method private]
```

```Go
func (d *Decoder) name() (s string, ok bool)
```

Get name: /first(first|second)*/ Do not set d.err if the name is missing (unless unexpected EOF is received): let the caller provide better context. 

#### <a id="Decoder.nsname" href="#Decoder.nsname">func (d *Decoder) nsname() (name Name, ok bool)</a>

```
searchKey: xml.Decoder.nsname
tags: [method private]
```

```Go
func (d *Decoder) nsname() (name Name, ok bool)
```

Get name space name: name with a : stuck in the middle. The part before the : is the name space identifier. 

#### <a id="Decoder.pop" href="#Decoder.pop">func (d *Decoder) pop() *stack</a>

```
searchKey: xml.Decoder.pop
tags: [method private]
```

```Go
func (d *Decoder) pop() *stack
```

#### <a id="Decoder.popEOF" href="#Decoder.popEOF">func (d *Decoder) popEOF() bool</a>

```
searchKey: xml.Decoder.popEOF
tags: [method private]
```

```Go
func (d *Decoder) popEOF() bool
```

Undo a pushEOF. The element must have been finished, so the EOF should be at the top of the stack. 

#### <a id="Decoder.popElement" href="#Decoder.popElement">func (d *Decoder) popElement(t *EndElement) bool</a>

```
searchKey: xml.Decoder.popElement
tags: [method private]
```

```Go
func (d *Decoder) popElement(t *EndElement) bool
```

Record that we are ending an element with the given name. The name must match the record at the top of the stack, which must be a pushElement record. After popping the element, apply any undo records from the stack to restore the name translations that existed before we saw this element. 

#### <a id="Decoder.push" href="#Decoder.push">func (d *Decoder) push(kind int) *stack</a>

```
searchKey: xml.Decoder.push
tags: [method private]
```

```Go
func (d *Decoder) push(kind int) *stack
```

#### <a id="Decoder.pushEOF" href="#Decoder.pushEOF">func (d *Decoder) pushEOF()</a>

```
searchKey: xml.Decoder.pushEOF
tags: [method private]
```

```Go
func (d *Decoder) pushEOF()
```

Record that after the current element is finished (that element is already pushed on the stack) Token should return EOF until popEOF is called. 

#### <a id="Decoder.pushElement" href="#Decoder.pushElement">func (d *Decoder) pushElement(name Name)</a>

```
searchKey: xml.Decoder.pushElement
tags: [method private]
```

```Go
func (d *Decoder) pushElement(name Name)
```

Record that we are starting an element with the given name. 

#### <a id="Decoder.pushNs" href="#Decoder.pushNs">func (d *Decoder) pushNs(local string, url string, ok bool)</a>

```
searchKey: xml.Decoder.pushNs
tags: [method private]
```

```Go
func (d *Decoder) pushNs(local string, url string, ok bool)
```

Record that we are changing the value of ns[local]. The old value is url, ok. 

#### <a id="Decoder.rawToken" href="#Decoder.rawToken">func (d *Decoder) rawToken() (Token, error)</a>

```
searchKey: xml.Decoder.rawToken
tags: [method private]
```

```Go
func (d *Decoder) rawToken() (Token, error)
```

#### <a id="Decoder.readName" href="#Decoder.readName">func (d *Decoder) readName() (ok bool)</a>

```
searchKey: xml.Decoder.readName
tags: [method private]
```

```Go
func (d *Decoder) readName() (ok bool)
```

Read a name and append its bytes to d.buf. The name is delimited by any single-byte character not valid in names. All multi-byte characters are accepted; the caller must check their validity. 

#### <a id="Decoder.savedOffset" href="#Decoder.savedOffset">func (d *Decoder) savedOffset() int</a>

```
searchKey: xml.Decoder.savedOffset
tags: [method private]
```

```Go
func (d *Decoder) savedOffset() int
```

Return saved offset. If we did ungetc (nextByte >= 0), have to back up one. 

#### <a id="Decoder.space" href="#Decoder.space">func (d *Decoder) space()</a>

```
searchKey: xml.Decoder.space
tags: [method private]
```

```Go
func (d *Decoder) space()
```

Skip spaces if any 

#### <a id="Decoder.switchToReader" href="#Decoder.switchToReader">func (d *Decoder) switchToReader(r io.Reader)</a>

```
searchKey: xml.Decoder.switchToReader
tags: [method private]
```

```Go
func (d *Decoder) switchToReader(r io.Reader)
```

#### <a id="Decoder.syntaxError" href="#Decoder.syntaxError">func (d *Decoder) syntaxError(msg string) error</a>

```
searchKey: xml.Decoder.syntaxError
tags: [method private]
```

```Go
func (d *Decoder) syntaxError(msg string) error
```

Creates a SyntaxError with the current line number. 

#### <a id="Decoder.text" href="#Decoder.text">func (d *Decoder) text(quote int, cdata bool) []byte</a>

```
searchKey: xml.Decoder.text
tags: [method private]
```

```Go
func (d *Decoder) text(quote int, cdata bool) []byte
```

Read plain text section (XML calls it character data). If quote >= 0, we are in a quoted string and need to find the matching quote. If cdata == true, we are in a <![CDATA[ section and need to find ]]>. On failure return nil and leave the error in d.err. 

#### <a id="Decoder.translate" href="#Decoder.translate">func (d *Decoder) translate(n *Name, isElementName bool)</a>

```
searchKey: xml.Decoder.translate
tags: [method private]
```

```Go
func (d *Decoder) translate(n *Name, isElementName bool)
```

Apply name space translation to name n. The default name space (for Space=="") applies only to element names, not to attribute names. 

#### <a id="Decoder.ungetc" href="#Decoder.ungetc">func (d *Decoder) ungetc(b byte)</a>

```
searchKey: xml.Decoder.ungetc
tags: [method private]
```

```Go
func (d *Decoder) ungetc(b byte)
```

Unread a single byte. 

#### <a id="Decoder.unmarshal" href="#Decoder.unmarshal">func (d *Decoder) unmarshal(val reflect.Value, start *StartElement) error</a>

```
searchKey: xml.Decoder.unmarshal
tags: [method private]
```

```Go
func (d *Decoder) unmarshal(val reflect.Value, start *StartElement) error
```

Unmarshal a single XML element into val. 

#### <a id="Decoder.unmarshalAttr" href="#Decoder.unmarshalAttr">func (d *Decoder) unmarshalAttr(val reflect.Value, attr Attr) error</a>

```
searchKey: xml.Decoder.unmarshalAttr
tags: [method private]
```

```Go
func (d *Decoder) unmarshalAttr(val reflect.Value, attr Attr) error
```

unmarshalAttr unmarshals a single XML attribute into val. 

#### <a id="Decoder.unmarshalInterface" href="#Decoder.unmarshalInterface">func (d *Decoder) unmarshalInterface(val Unmarshaler, start *StartElement) error</a>

```
searchKey: xml.Decoder.unmarshalInterface
tags: [method private]
```

```Go
func (d *Decoder) unmarshalInterface(val Unmarshaler, start *StartElement) error
```

unmarshalInterface unmarshals a single XML element into val. start is the opening tag of the element. 

#### <a id="Decoder.unmarshalPath" href="#Decoder.unmarshalPath">func (d *Decoder) unmarshalPath(tinfo *typeInfo, sv reflect.Value, parents []string, start *StartElement) (consumed bool, err error)</a>

```
searchKey: xml.Decoder.unmarshalPath
tags: [method private]
```

```Go
func (d *Decoder) unmarshalPath(tinfo *typeInfo, sv reflect.Value, parents []string, start *StartElement) (consumed bool, err error)
```

unmarshalPath walks down an XML structure looking for wanted paths, and calls unmarshal on them. The consumed result tells whether XML elements have been consumed from the Decoder until start's matching end element, or if it's still untouched because start is uninteresting for sv's fields. 

#### <a id="Decoder.unmarshalTextInterface" href="#Decoder.unmarshalTextInterface">func (d *Decoder) unmarshalTextInterface(val encoding.TextUnmarshaler) error</a>

```
searchKey: xml.Decoder.unmarshalTextInterface
tags: [method private]
```

```Go
func (d *Decoder) unmarshalTextInterface(val encoding.TextUnmarshaler) error
```

unmarshalTextInterface unmarshals a single XML element into val. The chardata contained in the element (but not its children) is passed to the text unmarshaler. 

### <a id="Departure" href="#Departure">type Departure struct</a>

```
searchKey: xml.Departure
tags: [struct private]
```

```Go
type Departure struct {
	XMLName struct{}  `xml:"departure"`
	When    time.Time `xml:",chardata"`
}
```

### <a id="DirectAny" href="#DirectAny">type DirectAny struct</a>

```
searchKey: xml.DirectAny
tags: [struct private]
```

```Go
type DirectAny struct {
	T1  T1
	Any string `xml:",any"`
	T2  T2
}
```

### <a id="DirectCDATA" href="#DirectCDATA">type DirectCDATA struct</a>

```
searchKey: xml.DirectCDATA
tags: [struct private]
```

```Go
type DirectCDATA struct {
	T1    T1
	CDATA string `xml:",cdata"`
	T2    T2
}
```

### <a id="DirectChardata" href="#DirectChardata">type DirectChardata struct</a>

```
searchKey: xml.DirectChardata
tags: [struct private]
```

```Go
type DirectChardata struct {
	T1       T1
	Chardata string `xml:",chardata"`
	T2       T2
}
```

### <a id="DirectComment" href="#DirectComment">type DirectComment struct</a>

```
searchKey: xml.DirectComment
tags: [struct private]
```

```Go
type DirectComment struct {
	T1      T1
	Comment string `xml:",comment"`
	T2      T2
}
```

### <a id="DirectElement" href="#DirectElement">type DirectElement struct</a>

```
searchKey: xml.DirectElement
tags: [struct private]
```

```Go
type DirectElement struct {
	T1      T1
	Element string
	T2      T2
}
```

### <a id="DirectInnerXML" href="#DirectInnerXML">type DirectInnerXML struct</a>

```
searchKey: xml.DirectInnerXML
tags: [struct private]
```

```Go
type DirectInnerXML struct {
	T1       T1
	InnerXML string `xml:",innerxml"`
	T2       T2
}
```

### <a id="DirectOmitEmpty" href="#DirectOmitEmpty">type DirectOmitEmpty struct</a>

```
searchKey: xml.DirectOmitEmpty
tags: [struct private]
```

```Go
type DirectOmitEmpty struct {
	T1        T1
	OmitEmpty string `xml:",omitempty"`
	T2        T2
}
```

### <a id="Directive" href="#Directive">type Directive []byte</a>

```
searchKey: xml.Directive
tags: [array number]
```

```Go
type Directive []byte
```

A Directive represents an XML directive of the form <!text>. The bytes do not include the <! and > markers. 

#### <a id="Directive.Copy" href="#Directive.Copy">func (d Directive) Copy() Directive</a>

```
searchKey: xml.Directive.Copy
tags: [method]
```

```Go
func (d Directive) Copy() Directive
```

Copy creates a new copy of Directive. 

### <a id="Domain" href="#Domain">type Domain struct</a>

```
searchKey: xml.Domain
tags: [struct private]
```

```Go
type Domain struct {
	XMLName struct{} `xml:"domain"`
	Country string   `xml:",attr,omitempty"`
	Name    []byte   `xml:",chardata"`
	Comment []byte   `xml:",comment"`
}
```

### <a id="DriveType" href="#DriveType">type DriveType int</a>

```
searchKey: xml.DriveType
tags: [number private]
```

```Go
type DriveType int
```

### <a id="EmbedA" href="#EmbedA">type EmbedA struct</a>

```
searchKey: xml.EmbedA
tags: [struct private]
```

```Go
type EmbedA struct {
	EmbedC
	EmbedB EmbedB
	FieldA string
	embedD
}
```

### <a id="EmbedB" href="#EmbedB">type EmbedB struct</a>

```
searchKey: xml.EmbedB
tags: [struct private]
```

```Go
type EmbedB struct {
	FieldB string
	*EmbedC
}
```

### <a id="EmbedC" href="#EmbedC">type EmbedC struct</a>

```
searchKey: xml.EmbedC
tags: [struct private]
```

```Go
type EmbedC struct {
	FieldA1 string `xml:"FieldA>A1"`
	FieldA2 string `xml:"FieldA>A2"`
	FieldB  string
	FieldC  string
}
```

### <a id="EmbedInt" href="#EmbedInt">type EmbedInt struct</a>

```
searchKey: xml.EmbedInt
tags: [struct private]
```

```Go
type EmbedInt struct {
	MyInt
}
```

### <a id="Encoder" href="#Encoder">type Encoder struct</a>

```
searchKey: xml.Encoder
tags: [struct]
```

```Go
type Encoder struct {
	p printer
}
```

An Encoder writes XML data to an output stream. 

#### <a id="NewEncoder" href="#NewEncoder">func NewEncoder(w io.Writer) *Encoder</a>

```
searchKey: xml.NewEncoder
tags: [function]
```

```Go
func NewEncoder(w io.Writer) *Encoder
```

NewEncoder returns a new encoder that writes to w. 

#### <a id="Encoder.Encode" href="#Encoder.Encode">func (enc *Encoder) Encode(v interface{}) error</a>

```
searchKey: xml.Encoder.Encode
tags: [method]
```

```Go
func (enc *Encoder) Encode(v interface{}) error
```

Encode writes the XML encoding of v to the stream. 

See the documentation for Marshal for details about the conversion of Go values to XML. 

Encode calls Flush before returning. 

#### <a id="Encoder.EncodeElement" href="#Encoder.EncodeElement">func (enc *Encoder) EncodeElement(v interface{}, start StartElement) error</a>

```
searchKey: xml.Encoder.EncodeElement
tags: [method]
```

```Go
func (enc *Encoder) EncodeElement(v interface{}, start StartElement) error
```

EncodeElement writes the XML encoding of v to the stream, using start as the outermost tag in the encoding. 

See the documentation for Marshal for details about the conversion of Go values to XML. 

EncodeElement calls Flush before returning. 

#### <a id="Encoder.EncodeToken" href="#Encoder.EncodeToken">func (enc *Encoder) EncodeToken(t Token) error</a>

```
searchKey: xml.Encoder.EncodeToken
tags: [method]
```

```Go
func (enc *Encoder) EncodeToken(t Token) error
```

EncodeToken writes the given XML token to the stream. It returns an error if StartElement and EndElement tokens are not properly matched. 

EncodeToken does not call Flush, because usually it is part of a larger operation such as Encode or EncodeElement (or a custom Marshaler's MarshalXML invoked during those), and those will call Flush when finished. Callers that create an Encoder and then invoke EncodeToken directly, without using Encode or EncodeElement, need to call Flush when finished to ensure that the XML is written to the underlying writer. 

EncodeToken allows writing a ProcInst with Target set to "xml" only as the first token in the stream. 

#### <a id="Encoder.Flush" href="#Encoder.Flush">func (enc *Encoder) Flush() error</a>

```
searchKey: xml.Encoder.Flush
tags: [method]
```

```Go
func (enc *Encoder) Flush() error
```

Flush flushes any buffered XML to the underlying writer. See the EncodeToken documentation for details about when it is necessary. 

#### <a id="Encoder.Indent" href="#Encoder.Indent">func (enc *Encoder) Indent(prefix, indent string)</a>

```
searchKey: xml.Encoder.Indent
tags: [method]
```

```Go
func (enc *Encoder) Indent(prefix, indent string)
```

Indent sets the encoder to generate XML in which each element begins on a new indented line that starts with prefix and is followed by one or more copies of indent according to the nesting depth. 

### <a id="EndElement" href="#EndElement">type EndElement struct</a>

```
searchKey: xml.EndElement
tags: [struct]
```

```Go
type EndElement struct {
	Name Name
}
```

An EndElement represents an XML end element. 

### <a id="Entry" href="#Entry">type Entry struct</a>

```
searchKey: xml.Entry
tags: [struct private]
```

```Go
type Entry struct {
	Title   string    `xml:"title"`
	ID      string    `xml:"id"`
	Link    []Link    `xml:"link"`
	Updated time.Time `xml:"updated"`
	Author  Person    `xml:"author"`
	Summary Text      `xml:"summary"`
}
```

### <a id="Event" href="#Event">type Event struct</a>

```
searchKey: xml.Event
tags: [struct private]
```

```Go
type Event struct {
	XMLName struct{} `xml:"event"`
	Year    int      `xml:",chardata"`
}
```

### <a id="Failure" href="#Failure">type Failure struct{}</a>

```
searchKey: xml.Failure
tags: [struct private]
```

```Go
type Failure struct{}
```

#### <a id="Failure.UnmarshalXML" href="#Failure.UnmarshalXML">func (Failure) UnmarshalXML(*Decoder, StartElement) error</a>

```
searchKey: xml.Failure.UnmarshalXML
tags: [method private]
```

```Go
func (Failure) UnmarshalXML(*Decoder, StartElement) error
```

### <a id="Feed" href="#Feed">type Feed struct</a>

```
searchKey: xml.Feed
tags: [struct private]
```

```Go
type Feed struct {
	XMLName Name      `xml:"http://www.w3.org/2005/Atom feed"`
	Title   string    `xml:"title"`
	ID      string    `xml:"id"`
	Link    []Link    `xml:"link"`
	Updated time.Time `xml:"updated,attr"`
	Author  Person    `xml:"author"`
	Entry   []Entry   `xml:"entry"`
}
```

### <a id="IXField" href="#IXField">type IXField struct</a>

```
searchKey: xml.IXField
tags: [struct private]
```

```Go
type IXField struct {
	Five        int      `xml:"five"`
	NotInnerXML []string `xml:",innerxml"`
}
```

### <a id="IfaceAny" href="#IfaceAny">type IfaceAny struct</a>

```
searchKey: xml.IfaceAny
tags: [struct private]
```

```Go
type IfaceAny struct {
	T1  T1
	Any interface{} `xml:",any"`
	T2  T2
}
```

### <a id="IfaceCDATA" href="#IfaceCDATA">type IfaceCDATA struct</a>

```
searchKey: xml.IfaceCDATA
tags: [struct private]
```

```Go
type IfaceCDATA struct {
	T1    T1
	CDATA interface{} `xml:",cdata"`
	T2    T2
}
```

### <a id="IfaceChardata" href="#IfaceChardata">type IfaceChardata struct</a>

```
searchKey: xml.IfaceChardata
tags: [struct private]
```

```Go
type IfaceChardata struct {
	T1       T1
	Chardata interface{} `xml:",chardata"`
	T2       T2
}
```

### <a id="IfaceComment" href="#IfaceComment">type IfaceComment struct</a>

```
searchKey: xml.IfaceComment
tags: [struct private]
```

```Go
type IfaceComment struct {
	T1      T1
	Comment interface{} `xml:",comment"`
	T2      T2
}
```

### <a id="IfaceElement" href="#IfaceElement">type IfaceElement struct</a>

```
searchKey: xml.IfaceElement
tags: [struct private]
```

```Go
type IfaceElement struct {
	T1      T1
	Element interface{}
	T2      T2
}
```

### <a id="IfaceInnerXML" href="#IfaceInnerXML">type IfaceInnerXML struct</a>

```
searchKey: xml.IfaceInnerXML
tags: [struct private]
```

```Go
type IfaceInnerXML struct {
	T1       T1
	InnerXML interface{} `xml:",innerxml"`
	T2       T2
}
```

### <a id="IfaceOmitEmpty" href="#IfaceOmitEmpty">type IfaceOmitEmpty struct</a>

```
searchKey: xml.IfaceOmitEmpty
tags: [struct private]
```

```Go
type IfaceOmitEmpty struct {
	T1        T1
	OmitEmpty interface{} `xml:",omitempty"`
	T2        T2
}
```

### <a id="IgnoreTest" href="#IgnoreTest">type IgnoreTest struct</a>

```
searchKey: xml.IgnoreTest
tags: [struct private]
```

```Go
type IgnoreTest struct {
	PublicSecret string `xml:"-"`
}
```

### <a id="IndirAny" href="#IndirAny">type IndirAny struct</a>

```
searchKey: xml.IndirAny
tags: [struct private]
```

```Go
type IndirAny struct {
	T1  T1
	Any *string `xml:",any"`
	T2  T2
}
```

### <a id="IndirCDATA" href="#IndirCDATA">type IndirCDATA struct</a>

```
searchKey: xml.IndirCDATA
tags: [struct private]
```

```Go
type IndirCDATA struct {
	T1    T1
	CDATA *string `xml:",cdata"`
	T2    T2
}
```

### <a id="IndirChardata" href="#IndirChardata">type IndirChardata struct</a>

```
searchKey: xml.IndirChardata
tags: [struct private]
```

```Go
type IndirChardata struct {
	T1       T1
	Chardata *string `xml:",chardata"`
	T2       T2
}
```

### <a id="IndirComment" href="#IndirComment">type IndirComment struct</a>

```
searchKey: xml.IndirComment
tags: [struct private]
```

```Go
type IndirComment struct {
	T1      T1
	Comment *string `xml:",comment"`
	T2      T2
}
```

### <a id="IndirElement" href="#IndirElement">type IndirElement struct</a>

```
searchKey: xml.IndirElement
tags: [struct private]
```

```Go
type IndirElement struct {
	T1      T1
	Element *string
	T2      T2
}
```

### <a id="IndirInnerXML" href="#IndirInnerXML">type IndirInnerXML struct</a>

```
searchKey: xml.IndirInnerXML
tags: [struct private]
```

```Go
type IndirInnerXML struct {
	T1       T1
	InnerXML *string `xml:",innerxml"`
	T2       T2
}
```

### <a id="IndirOmitEmpty" href="#IndirOmitEmpty">type IndirOmitEmpty struct</a>

```
searchKey: xml.IndirOmitEmpty
tags: [struct private]
```

```Go
type IndirOmitEmpty struct {
	T1        T1
	OmitEmpty *string `xml:",omitempty"`
	T2        T2
}
```

### <a id="InnerStruct" href="#InnerStruct">type InnerStruct struct</a>

```
searchKey: xml.InnerStruct
tags: [struct private]
```

```Go
type InnerStruct struct {
	XMLName Name `xml:"testns outer"`
}
```

### <a id="InvalidXMLName" href="#InvalidXMLName">type InvalidXMLName struct</a>

```
searchKey: xml.InvalidXMLName
tags: [struct private]
```

```Go
type InvalidXMLName struct {
	XMLName Name `xml:"error"`
	Type    struct {
		XMLName Name `xml:"type,attr"`
	}
}
```

### <a id="Link" href="#Link">type Link struct</a>

```
searchKey: xml.Link
tags: [struct private]
```

```Go
type Link struct {
	Rel  string `xml:"rel,attr,omitempty"`
	Href string `xml:"href,attr"`
}
```

### <a id="Marshaler" href="#Marshaler">type Marshaler interface</a>

```
searchKey: xml.Marshaler
tags: [interface]
```

```Go
type Marshaler interface {
	MarshalXML(e *Encoder, start StartElement) error
}
```

Marshaler is the interface implemented by objects that can marshal themselves into valid XML elements. 

MarshalXML encodes the receiver as zero or more XML elements. By convention, arrays or slices are typically encoded as a sequence of elements, one per entry. Using start as the element tag is not required, but doing so will enable Unmarshal to match the XML elements to the correct struct field. One common implementation strategy is to construct a separate value with a layout corresponding to the desired XML and then to encode it using e.EncodeElement. Another common strategy is to use repeated calls to e.EncodeToken to generate the XML output one token at a time. The sequence of encoded tokens must make up zero or more valid XML elements. 

### <a id="MarshalerAttr" href="#MarshalerAttr">type MarshalerAttr interface</a>

```
searchKey: xml.MarshalerAttr
tags: [interface]
```

```Go
type MarshalerAttr interface {
	MarshalXMLAttr(name Name) (Attr, error)
}
```

MarshalerAttr is the interface implemented by objects that can marshal themselves into valid XML attributes. 

MarshalXMLAttr returns an XML attribute with the encoded value of the receiver. Using name as the attribute name is not required, but doing so will enable Unmarshal to match the attribute to the correct struct field. If MarshalXMLAttr returns the zero attribute Attr{}, no attribute will be generated in the output. MarshalXMLAttr is used only for struct fields with the "attr" option in the field tag. 

### <a id="MarshalerStruct" href="#MarshalerStruct">type MarshalerStruct struct</a>

```
searchKey: xml.MarshalerStruct
tags: [struct private]
```

```Go
type MarshalerStruct struct {
	Foo MyMarshalerAttrTest `xml:",attr"`
}
```

### <a id="MixedNested" href="#MixedNested">type MixedNested struct</a>

```
searchKey: xml.MixedNested
tags: [struct private]
```

```Go
type MixedNested struct {
	XMLName struct{} `xml:"result"`
	A       string   `xml:"parent1>a"`
	B       string   `xml:"b"`
	C       string   `xml:"parent1>parent2>c"`
	D       string   `xml:"parent1>d"`
}
```

### <a id="Movie" href="#Movie">type Movie struct</a>

```
searchKey: xml.Movie
tags: [struct private]
```

```Go
type Movie struct {
	XMLName struct{} `xml:"movie"`
	Length  uint     `xml:",chardata"`
}
```

### <a id="MyAttr" href="#MyAttr">type MyAttr struct</a>

```
searchKey: xml.MyAttr
tags: [struct private]
```

```Go
type MyAttr struct {
	attr string
}
```

#### <a id="MyAttr.UnmarshalXMLAttr" href="#MyAttr.UnmarshalXMLAttr">func (m *MyAttr) UnmarshalXMLAttr(attr Attr) error</a>

```
searchKey: xml.MyAttr.UnmarshalXMLAttr
tags: [method private]
```

```Go
func (m *MyAttr) UnmarshalXMLAttr(attr Attr) error
```

### <a id="MyBytes" href="#MyBytes">type MyBytes []byte</a>

```
searchKey: xml.MyBytes
tags: [array number private]
```

```Go
type MyBytes []byte
```

### <a id="MyCharData" href="#MyCharData">type MyCharData struct</a>

```
searchKey: xml.MyCharData
tags: [struct private]
```

```Go
type MyCharData struct {
	body string
}
```

#### <a id="MyCharData.UnmarshalXML" href="#MyCharData.UnmarshalXML">func (m *MyCharData) UnmarshalXML(d *Decoder, start StartElement) error</a>

```
searchKey: xml.MyCharData.UnmarshalXML
tags: [method private]
```

```Go
func (m *MyCharData) UnmarshalXML(d *Decoder, start StartElement) error
```

#### <a id="MyCharData.UnmarshalXMLAttr" href="#MyCharData.UnmarshalXMLAttr">func (m *MyCharData) UnmarshalXMLAttr(attr Attr) error</a>

```
searchKey: xml.MyCharData.UnmarshalXMLAttr
tags: [method private]
```

```Go
func (m *MyCharData) UnmarshalXMLAttr(attr Attr) error
```

### <a id="MyInt" href="#MyInt">type MyInt int</a>

```
searchKey: xml.MyInt
tags: [number private]
```

```Go
type MyInt int
```

### <a id="MyMarshalerAttrTest" href="#MyMarshalerAttrTest">type MyMarshalerAttrTest struct{}</a>

```
searchKey: xml.MyMarshalerAttrTest
tags: [struct private]
```

```Go
type MyMarshalerAttrTest struct {
}
```

#### <a id="MyMarshalerAttrTest.MarshalXMLAttr" href="#MyMarshalerAttrTest.MarshalXMLAttr">func (m *MyMarshalerAttrTest) MarshalXMLAttr(name Name) (Attr, error)</a>

```
searchKey: xml.MyMarshalerAttrTest.MarshalXMLAttr
tags: [method private]
```

```Go
func (m *MyMarshalerAttrTest) MarshalXMLAttr(name Name) (Attr, error)
```

#### <a id="MyMarshalerAttrTest.UnmarshalXMLAttr" href="#MyMarshalerAttrTest.UnmarshalXMLAttr">func (m *MyMarshalerAttrTest) UnmarshalXMLAttr(attr Attr) error</a>

```
searchKey: xml.MyMarshalerAttrTest.UnmarshalXMLAttr
tags: [method private]
```

```Go
func (m *MyMarshalerAttrTest) UnmarshalXMLAttr(attr Attr) error
```

### <a id="MyMarshalerTest" href="#MyMarshalerTest">type MyMarshalerTest struct{}</a>

```
searchKey: xml.MyMarshalerTest
tags: [struct private]
```

```Go
type MyMarshalerTest struct {
}
```

#### <a id="MyMarshalerTest.MarshalXML" href="#MyMarshalerTest.MarshalXML">func (m *MyMarshalerTest) MarshalXML(e *Encoder, start StartElement) error</a>

```
searchKey: xml.MyMarshalerTest.MarshalXML
tags: [method private]
```

```Go
func (m *MyMarshalerTest) MarshalXML(e *Encoder, start StartElement) error
```

### <a id="MyStruct" href="#MyStruct">type MyStruct struct</a>

```
searchKey: xml.MyStruct
tags: [struct private]
```

```Go
type MyStruct struct {
	Data *MyCharData
	Attr *MyAttr `xml:",attr"`

	Data2 MyCharData
	Attr2 MyAttr `xml:",attr"`
}
```

### <a id="Name" href="#Name">type Name struct</a>

```
searchKey: xml.Name
tags: [struct]
```

```Go
type Name struct {
	Space, Local string
}
```

A Name represents an XML name (Local) annotated with a name space identifier (Space). In tokens returned by Decoder.Token, the Space identifier is given as a canonical URL, not the short prefix used in the document being parsed. 

### <a id="NameCasing" href="#NameCasing">type NameCasing struct</a>

```
searchKey: xml.NameCasing
tags: [struct private]
```

```Go
type NameCasing struct {
	XMLName struct{} `xml:"casing"`
	Xy      string
	XY      string
	XyA     string `xml:"Xy,attr"`
	XYA     string `xml:"XY,attr"`
}
```

### <a id="NameInField" href="#NameInField">type NameInField struct</a>

```
searchKey: xml.NameInField
tags: [struct private]
```

```Go
type NameInField struct {
	Foo Name `xml:"ns foo"`
}
```

### <a id="NamePrecedence" href="#NamePrecedence">type NamePrecedence struct</a>

```
searchKey: xml.NamePrecedence
tags: [struct private]
```

```Go
type NamePrecedence struct {
	XMLName     Name              `xml:"Parent"`
	FromTag     XMLNameWithoutTag `xml:"InTag"`
	FromNameVal XMLNameWithoutTag
	FromNameTag XMLNameWithTag
	InFieldName string
}
```

### <a id="NamedType" href="#NamedType">type NamedType string</a>

```
searchKey: xml.NamedType
tags: [string private]
```

```Go
type NamedType string
```

### <a id="NestedAndCData" href="#NestedAndCData">type NestedAndCData struct</a>

```
searchKey: xml.NestedAndCData
tags: [struct private]
```

```Go
type NestedAndCData struct {
	AB    []string `xml:"A>B"`
	CDATA string   `xml:",cdata"`
}
```

### <a id="NestedAndChardata" href="#NestedAndChardata">type NestedAndChardata struct</a>

```
searchKey: xml.NestedAndChardata
tags: [struct private]
```

```Go
type NestedAndChardata struct {
	AB       []string `xml:"A>B"`
	Chardata string   `xml:",chardata"`
}
```

### <a id="NestedAndComment" href="#NestedAndComment">type NestedAndComment struct</a>

```
searchKey: xml.NestedAndComment
tags: [struct private]
```

```Go
type NestedAndComment struct {
	AB      []string `xml:"A>B"`
	Comment string   `xml:",comment"`
}
```

### <a id="NestedItems" href="#NestedItems">type NestedItems struct</a>

```
searchKey: xml.NestedItems
tags: [struct private]
```

```Go
type NestedItems struct {
	XMLName struct{} `xml:"result"`
	Items   []string `xml:">item"`
	Item1   []string `xml:"Items>item1"`
}
```

### <a id="NestedOrder" href="#NestedOrder">type NestedOrder struct</a>

```
searchKey: xml.NestedOrder
tags: [struct private]
```

```Go
type NestedOrder struct {
	XMLName struct{} `xml:"result"`
	Field1  string   `xml:"parent>c"`
	Field2  string   `xml:"parent>b"`
	Field3  string   `xml:"parent>a"`
}
```

### <a id="NilTest" href="#NilTest">type NilTest struct</a>

```
searchKey: xml.NilTest
tags: [struct private]
```

```Go
type NilTest struct {
	A interface{} `xml:"parent1>parent2>a"`
	B interface{} `xml:"parent1>b"`
	C interface{} `xml:"parent1>parent2>c"`
}
```

### <a id="OmitAttrTest" href="#OmitAttrTest">type OmitAttrTest struct</a>

```
searchKey: xml.OmitAttrTest
tags: [struct private]
```

```Go
type OmitAttrTest struct {
	Int   int     `xml:",attr,omitempty"`
	Named int     `xml:"int,attr,omitempty"`
	Float float64 `xml:",attr,omitempty"`
	Uint8 uint8   `xml:",attr,omitempty"`
	Bool  bool    `xml:",attr,omitempty"`
	Str   string  `xml:",attr,omitempty"`
	Bytes []byte  `xml:",attr,omitempty"`
	PStr  *string `xml:",attr,omitempty"`
}
```

### <a id="OmitFieldTest" href="#OmitFieldTest">type OmitFieldTest struct</a>

```
searchKey: xml.OmitFieldTest
tags: [struct private]
```

```Go
type OmitFieldTest struct {
	Int   int           `xml:",omitempty"`
	Named int           `xml:"int,omitempty"`
	Float float64       `xml:",omitempty"`
	Uint8 uint8         `xml:",omitempty"`
	Bool  bool          `xml:",omitempty"`
	Str   string        `xml:",omitempty"`
	Bytes []byte        `xml:",omitempty"`
	PStr  *string       `xml:",omitempty"`
	Ptr   *PresenceTest `xml:",omitempty"`
}
```

### <a id="OuterNamedOrderedStruct" href="#OuterNamedOrderedStruct">type OuterNamedOrderedStruct struct</a>

```
searchKey: xml.OuterNamedOrderedStruct
tags: [struct private]
```

```Go
type OuterNamedOrderedStruct struct {
	XMLName Name `xml:"outerns test"`
	InnerStruct
	IntAttr int `xml:"int,attr"`
}
```

### <a id="OuterNamedStruct" href="#OuterNamedStruct">type OuterNamedStruct struct</a>

```
searchKey: xml.OuterNamedStruct
tags: [struct private]
```

```Go
type OuterNamedStruct struct {
	InnerStruct
	XMLName Name `xml:"outerns test"`
	IntAttr int  `xml:"int,attr"`
}
```

### <a id="OuterOuterStruct" href="#OuterOuterStruct">type OuterOuterStruct struct</a>

```
searchKey: xml.OuterOuterStruct
tags: [struct private]
```

```Go
type OuterOuterStruct struct {
	OuterStruct
}
```

### <a id="OuterStruct" href="#OuterStruct">type OuterStruct struct</a>

```
searchKey: xml.OuterStruct
tags: [struct private]
```

```Go
type OuterStruct struct {
	InnerStruct
	IntAttr int `xml:"int,attr"`
}
```

### <a id="Parent" href="#Parent">type Parent struct</a>

```
searchKey: xml.Parent
tags: [struct private]
```

```Go
type Parent struct {
	I        int
	IPtr     *int
	Is       []int
	IPtrs    []*int
	F        float32
	FPtr     *float32
	Fs       []float32
	FPtrs    []*float32
	B        bool
	BPtr     *bool
	Bs       []bool
	BPtrs    []*bool
	Bytes    []byte
	BytesPtr *[]byte
	S        string
	SPtr     *string
	Ss       []string
	SPtrs    []*string
	MyI      MyInt
	Child    Child
	Children []Child
	ChildPtr *Child
	ChildToEmbed
}
```

### <a id="Particle" href="#Particle">type Particle struct</a>

```
searchKey: xml.Particle
tags: [struct private]
```

```Go
type Particle struct {
	XMLName struct{} `xml:"particle"`
	HasMass bool     `xml:",chardata"`
}
```

### <a id="Passenger" href="#Passenger">type Passenger struct</a>

```
searchKey: xml.Passenger
tags: [struct private]
```

```Go
type Passenger struct {
	Name   []string `xml:"name"`
	Weight float32  `xml:"weight"`
}
```

### <a id="PathTestA" href="#PathTestA">type PathTestA struct</a>

```
searchKey: xml.PathTestA
tags: [struct private]
```

```Go
type PathTestA struct {
	Items         []PathTestItem `xml:">Item1"`
	Before, After string
}
```

### <a id="PathTestB" href="#PathTestB">type PathTestB struct</a>

```
searchKey: xml.PathTestB
tags: [struct private]
```

```Go
type PathTestB struct {
	Other         []PathTestItem `xml:"Items>Item1"`
	Before, After string
}
```

### <a id="PathTestC" href="#PathTestC">type PathTestC struct</a>

```
searchKey: xml.PathTestC
tags: [struct private]
```

```Go
type PathTestC struct {
	Values1       []string `xml:"Items>Item1>Value"`
	Values2       []string `xml:"Items>Item2>Value"`
	Before, After string
}
```

### <a id="PathTestD" href="#PathTestD">type PathTestD struct</a>

```
searchKey: xml.PathTestD
tags: [struct private]
```

```Go
type PathTestD struct {
	Other         PathTestSet `xml:"Items"`
	Before, After string
}
```

### <a id="PathTestE" href="#PathTestE">type PathTestE struct</a>

```
searchKey: xml.PathTestE
tags: [struct private]
```

```Go
type PathTestE struct {
	Underline     string `xml:"Items>_>Value"`
	Before, After string
}
```

### <a id="PathTestItem" href="#PathTestItem">type PathTestItem struct</a>

```
searchKey: xml.PathTestItem
tags: [struct private]
```

```Go
type PathTestItem struct {
	Value string
}
```

### <a id="PathTestSet" href="#PathTestSet">type PathTestSet struct</a>

```
searchKey: xml.PathTestSet
tags: [struct private]
```

```Go
type PathTestSet struct {
	Item1 []PathTestItem
}
```

### <a id="Pea" href="#Pea">type Pea struct</a>

```
searchKey: xml.Pea
tags: [struct private]
```

```Go
type Pea struct {
	Cotelydon string
}
```

### <a id="Person" href="#Person">type Person struct</a>

```
searchKey: xml.Person
tags: [struct private]
```

```Go
type Person struct {
	Name     string `xml:"name"`
	URI      string `xml:"uri"`
	Email    string `xml:"email"`
	InnerXML string `xml:",innerxml"`
}
```

### <a id="Pi" href="#Pi">type Pi struct</a>

```
searchKey: xml.Pi
tags: [struct private]
```

```Go
type Pi struct {
	XMLName       struct{} `xml:"pi"`
	Approximation float32  `xml:",chardata"`
}
```

### <a id="Plain" href="#Plain">type Plain struct</a>

```
searchKey: xml.Plain
tags: [struct private]
```

```Go
type Plain struct {
	V interface{}
}
```

### <a id="Pod" href="#Pod">type Pod struct</a>

```
searchKey: xml.Pod
tags: [struct private]
```

```Go
type Pod struct {
	Pea interface{} `xml:"Pea"`
}
```

### <a id="PointerAnonFields" href="#PointerAnonFields">type PointerAnonFields struct</a>

```
searchKey: xml.PointerAnonFields
tags: [struct private]
```

```Go
type PointerAnonFields struct {
	*MyInt
	*NamedType
}
```

### <a id="PointerFieldsTest" href="#PointerFieldsTest">type PointerFieldsTest struct</a>

```
searchKey: xml.PointerFieldsTest
tags: [struct private]
```

```Go
type PointerFieldsTest struct {
	XMLName  Name    `xml:"dummy"`
	Name     *string `xml:"name,attr"`
	Age      *uint   `xml:"age,attr"`
	Empty    *string `xml:"empty,attr"`
	Contents *string `xml:",chardata"`
}
```

### <a id="Port" href="#Port">type Port struct</a>

```
searchKey: xml.Port
tags: [struct private]
```

```Go
type Port struct {
	XMLName struct{} `xml:"port"`
	Type    string   `xml:"type,attr,omitempty"`
	Comment string   `xml:",comment"`
	Number  string   `xml:",chardata"`
}
```

### <a id="PresenceTest" href="#PresenceTest">type PresenceTest struct</a>

```
searchKey: xml.PresenceTest
tags: [struct private]
```

```Go
type PresenceTest struct {
	Exists *struct{}
}
```

### <a id="ProcInst" href="#ProcInst">type ProcInst struct</a>

```
searchKey: xml.ProcInst
tags: [struct]
```

```Go
type ProcInst struct {
	Target string
	Inst   []byte
}
```

A ProcInst represents an XML processing instruction of the form <?target inst?> 

#### <a id="ProcInst.Copy" href="#ProcInst.Copy">func (p ProcInst) Copy() ProcInst</a>

```
searchKey: xml.ProcInst.Copy
tags: [method]
```

```Go
func (p ProcInst) Copy() ProcInst
```

Copy creates a new copy of ProcInst. 

### <a id="RecurseA" href="#RecurseA">type RecurseA struct</a>

```
searchKey: xml.RecurseA
tags: [struct private]
```

```Go
type RecurseA struct {
	A string
	B *RecurseB
}
```

### <a id="RecurseB" href="#RecurseB">type RecurseB struct</a>

```
searchKey: xml.RecurseB
tags: [struct private]
```

```Go
type RecurseB struct {
	A *RecurseA
	B string
}
```

### <a id="SecretAgent" href="#SecretAgent">type SecretAgent struct</a>

```
searchKey: xml.SecretAgent
tags: [struct private]
```

```Go
type SecretAgent struct {
	XMLName   struct{} `xml:"agent"`
	Handle    string   `xml:"handle,attr"`
	Identity  string
	Obfuscate string `xml:",innerxml"`
}
```

### <a id="Service" href="#Service">type Service struct</a>

```
searchKey: xml.Service
tags: [struct private]
```

```Go
type Service struct {
	XMLName struct{} `xml:"service"`
	Domain  *Domain  `xml:"host>domain"`
	Port    *Port    `xml:"host>port"`
	Extra1  interface{}
	Extra2  interface{} `xml:"host>extra2"`
}
```

### <a id="Ship" href="#Ship">type Ship struct</a>

```
searchKey: xml.Ship
tags: [struct private]
```

```Go
type Ship struct {
	XMLName struct{} `xml:"spaceship"`

	Name      string       `xml:"name,attr"`
	Pilot     string       `xml:"pilot,attr"`
	Drive     DriveType    `xml:"drive"`
	Age       uint         `xml:"age"`
	Passenger []*Passenger `xml:"passenger"`
	secret    string
}
```

### <a id="StartElement" href="#StartElement">type StartElement struct</a>

```
searchKey: xml.StartElement
tags: [struct]
```

```Go
type StartElement struct {
	Name Name
	Attr []Attr
}
```

A StartElement represents an XML start element. 

#### <a id="defaultStart" href="#defaultStart">func defaultStart(typ reflect.Type, finfo *fieldInfo, startTemplate *StartElement) StartElement</a>

```
searchKey: xml.defaultStart
tags: [function private]
```

```Go
func defaultStart(typ reflect.Type, finfo *fieldInfo, startTemplate *StartElement) StartElement
```

defaultStart returns the default start element to use, given the reflect type, field info, and start template. 

#### <a id="StartElement.Copy" href="#StartElement.Copy">func (e StartElement) Copy() StartElement</a>

```
searchKey: xml.StartElement.Copy
tags: [method]
```

```Go
func (e StartElement) Copy() StartElement
```

Copy creates a new copy of StartElement. 

#### <a id="StartElement.End" href="#StartElement.End">func (e StartElement) End() EndElement</a>

```
searchKey: xml.StartElement.End
tags: [method]
```

```Go
func (e StartElement) End() EndElement
```

End returns the corresponding XML end element. 

### <a id="Strings" href="#Strings">type Strings struct</a>

```
searchKey: xml.Strings
tags: [struct private]
```

```Go
type Strings struct {
	X []string `xml:"A>B,omitempty"`
}
```

### <a id="SyntaxError" href="#SyntaxError">type SyntaxError struct</a>

```
searchKey: xml.SyntaxError
tags: [struct]
```

```Go
type SyntaxError struct {
	Msg  string
	Line int
}
```

A SyntaxError represents a syntax error in the XML input stream. 

#### <a id="SyntaxError.Error" href="#SyntaxError.Error">func (e *SyntaxError) Error() string</a>

```
searchKey: xml.SyntaxError.Error
tags: [method]
```

```Go
func (e *SyntaxError) Error() string
```

### <a id="T1" href="#T1">type T1 struct{}</a>

```
searchKey: xml.T1
tags: [struct private]
```

```Go
type T1 struct{}
```

### <a id="T2" href="#T2">type T2 struct{}</a>

```
searchKey: xml.T2
tags: [struct private]
```

```Go
type T2 struct{}
```

### <a id="TAttr" href="#TAttr">type TAttr struct</a>

```
searchKey: xml.TAttr
tags: [struct private]
```

```Go
type TAttr struct {
	HTable string `xml:"http://www.w3.org/TR/html4/ table,attr"`
	FTable string `xml:"http://www.w3schools.com/furniture table,attr"`
	Lang   string `xml:"http://www.w3.org/XML/1998/namespace lang,attr,omitempty"`
	Other1 string `xml:"http://golang.org/xml/ other,attr,omitempty"`
	Other2 string `xml:"http://golang.org/xmlfoo/ other,attr,omitempty"`
	Other3 string `xml:"http://golang.org/json/ other,attr,omitempty"`
	Other4 string `xml:"http://golang.org/2/json/ other,attr,omitempty"`
}
```

### <a id="TableAttrs" href="#TableAttrs">type TableAttrs struct</a>

```
searchKey: xml.TableAttrs
tags: [struct private]
```

```Go
type TableAttrs struct {
	TAttr TAttr
}
```

### <a id="Tables" href="#Tables">type Tables struct</a>

```
searchKey: xml.Tables
tags: [struct private]
```

```Go
type Tables struct {
	HTable string `xml:"http://www.w3.org/TR/html4/ table"`
	FTable string `xml:"http://www.w3schools.com/furniture table"`
}
```

### <a id="TagPathError" href="#TagPathError">type TagPathError struct</a>

```
searchKey: xml.TagPathError
tags: [struct]
```

```Go
type TagPathError struct {
	Struct       reflect.Type
	Field1, Tag1 string
	Field2, Tag2 string
}
```

A TagPathError represents an error in the unmarshaling process caused by the use of field tags with conflicting paths. 

#### <a id="TagPathError.Error" href="#TagPathError.Error">func (e *TagPathError) Error() string</a>

```
searchKey: xml.TagPathError.Error
tags: [method]
```

```Go
func (e *TagPathError) Error() string
```

### <a id="TestThree" href="#TestThree">type TestThree struct</a>

```
searchKey: xml.TestThree
tags: [struct private]
```

```Go
type TestThree struct {
	XMLName Name   `xml:"Test3"`
	Attr    string `xml:",attr"`
}
```

### <a id="Text" href="#Text">type Text struct</a>

```
searchKey: xml.Text
tags: [struct private]
```

```Go
type Text struct {
	Type string `xml:"type,attr,omitempty"`
	Body string `xml:",chardata"`
}
```

#### <a id="NewText" href="#NewText">func NewText(text string) Text</a>

```
searchKey: xml.NewText
tags: [function private]
```

```Go
func NewText(text string) Text
```

### <a id="Token" href="#Token">type Token interface{}</a>

```
searchKey: xml.Token
tags: [interface]
```

```Go
type Token interface{}
```

A Token is an interface holding one of the token types: StartElement, EndElement, CharData, Comment, ProcInst, or Directive. 

#### <a id="CopyToken" href="#CopyToken">func CopyToken(t Token) Token</a>

```
searchKey: xml.CopyToken
tags: [function]
```

```Go
func CopyToken(t Token) Token
```

CopyToken returns a copy of a Token. 

### <a id="TokenReader" href="#TokenReader">type TokenReader interface</a>

```
searchKey: xml.TokenReader
tags: [interface]
```

```Go
type TokenReader interface {
	Token() (Token, error)
}
```

A TokenReader is anything that can decode a stream of XML tokens, including a Decoder. 

When Token encounters an error or end-of-file condition after successfully reading a token, it returns the token. It may return the (non-nil) error from the same call or return the error (and a nil token) from a subsequent call. An instance of this general case is that a TokenReader returning a non-nil token at the end of the token stream may return either io.EOF or a nil error. The next Read should return nil, io.EOF. 

Implementations of Token are discouraged from returning a nil token with a nil error. Callers should treat a return of nil, nil as indicating that nothing happened; in particular it does not indicate EOF. 

### <a id="Universe" href="#Universe">type Universe struct</a>

```
searchKey: xml.Universe
tags: [struct private]
```

```Go
type Universe struct {
	XMLName struct{} `xml:"universe"`
	Visible float64  `xml:",chardata"`
}
```

### <a id="UnmarshalError" href="#UnmarshalError">type UnmarshalError string</a>

```
searchKey: xml.UnmarshalError
tags: [string]
```

```Go
type UnmarshalError string
```

An UnmarshalError represents an error in the unmarshaling process. 

#### <a id="UnmarshalError.Error" href="#UnmarshalError.Error">func (e UnmarshalError) Error() string</a>

```
searchKey: xml.UnmarshalError.Error
tags: [method]
```

```Go
func (e UnmarshalError) Error() string
```

### <a id="Unmarshaler" href="#Unmarshaler">type Unmarshaler interface</a>

```
searchKey: xml.Unmarshaler
tags: [interface]
```

```Go
type Unmarshaler interface {
	UnmarshalXML(d *Decoder, start StartElement) error
}
```

Unmarshaler is the interface implemented by objects that can unmarshal an XML element description of themselves. 

UnmarshalXML decodes a single XML element beginning with the given start element. If it returns an error, the outer call to Unmarshal stops and returns that error. UnmarshalXML must consume exactly one XML element. One common implementation strategy is to unmarshal into a separate value with a layout matching the expected XML using d.DecodeElement, and then to copy the data from that value into the receiver. Another common strategy is to use d.Token to process the XML object one token at a time. UnmarshalXML may not use d.RawToken. 

### <a id="UnmarshalerAttr" href="#UnmarshalerAttr">type UnmarshalerAttr interface</a>

```
searchKey: xml.UnmarshalerAttr
tags: [interface]
```

```Go
type UnmarshalerAttr interface {
	UnmarshalXMLAttr(attr Attr) error
}
```

UnmarshalerAttr is the interface implemented by objects that can unmarshal an XML attribute description of themselves. 

UnmarshalXMLAttr decodes a single XML attribute. If it returns an error, the outer call to Unmarshal stops and returns that error. UnmarshalXMLAttr is used only for struct fields with the "attr" option in the field tag. 

### <a id="UnsupportedTypeError" href="#UnsupportedTypeError">type UnsupportedTypeError struct</a>

```
searchKey: xml.UnsupportedTypeError
tags: [struct]
```

```Go
type UnsupportedTypeError struct {
	Type reflect.Type
}
```

UnsupportedTypeError is returned when Marshal encounters a type that cannot be converted into XML. 

#### <a id="UnsupportedTypeError.Error" href="#UnsupportedTypeError.Error">func (e *UnsupportedTypeError) Error() string</a>

```
searchKey: xml.UnsupportedTypeError.Error
tags: [method]
```

```Go
func (e *UnsupportedTypeError) Error() string
```

### <a id="WhitespaceAttrsParent" href="#WhitespaceAttrsParent">type WhitespaceAttrsParent struct</a>

```
searchKey: xml.WhitespaceAttrsParent
tags: [struct private]
```

```Go
type WhitespaceAttrsParent struct {
	BFalse bool    `xml:",attr"`
	BTrue  bool    `xml:",attr"`
	I      int     `xml:",attr"`
	INeg   int     `xml:",attr"`
	I8     int8    `xml:",attr"`
	I8Neg  int8    `xml:",attr"`
	I16    int16   `xml:",attr"`
	I16Neg int16   `xml:",attr"`
	I32    int32   `xml:",attr"`
	I32Neg int32   `xml:",attr"`
	I64    int64   `xml:",attr"`
	I64Neg int64   `xml:",attr"`
	UI     uint    `xml:",attr"`
	UI8    uint8   `xml:",attr"`
	UI16   uint16  `xml:",attr"`
	UI32   uint32  `xml:",attr"`
	UI64   uint64  `xml:",attr"`
	F32    float32 `xml:",attr"`
	F32Neg float32 `xml:",attr"`
	F64    float64 `xml:",attr"`
	F64Neg float64 `xml:",attr"`
}
```

### <a id="WhitespaceValuesParent" href="#WhitespaceValuesParent">type WhitespaceValuesParent struct</a>

```
searchKey: xml.WhitespaceValuesParent
tags: [struct private]
```

```Go
type WhitespaceValuesParent struct {
	BFalse bool
	BTrue  bool
	I      int
	INeg   int
	I8     int8
	I8Neg  int8
	I16    int16
	I16Neg int16
	I32    int32
	I32Neg int32
	I64    int64
	I64Neg int64
	UI     uint
	UI8    uint8
	UI16   uint16
	UI32   uint32
	UI64   uint64
	F32    float32
	F32Neg float32
	F64    float64
	F64Neg float64
}
```

### <a id="X" href="#X">type X struct</a>

```
searchKey: xml.X
tags: [struct private]
```

```Go
type X struct {
	D string `xml:",comment"`
}
```

### <a id="XMLNameWithTag" href="#XMLNameWithTag">type XMLNameWithTag struct</a>

```
searchKey: xml.XMLNameWithTag
tags: [struct private]
```

```Go
type XMLNameWithTag struct {
	XMLName Name   `xml:"InXMLNameTag"`
	Value   string `xml:",chardata"`
}
```

### <a id="XMLNameWithoutTag" href="#XMLNameWithoutTag">type XMLNameWithoutTag struct</a>

```
searchKey: xml.XMLNameWithoutTag
tags: [struct private]
```

```Go
type XMLNameWithoutTag struct {
	XMLName Name
	Value   string `xml:",chardata"`
}
```

### <a id="allScalars" href="#allScalars">type allScalars struct</a>

```
searchKey: xml.allScalars
tags: [struct private]
```

```Go
type allScalars struct {
	True1     bool
	True2     bool
	False1    bool
	False2    bool
	Int       int
	Int8      int8
	Int16     int16
	Int32     int32
	Int64     int64
	Uint      int
	Uint8     uint8
	Uint16    uint16
	Uint32    uint32
	Uint64    uint64
	Uintptr   uintptr
	Float32   float32
	Float64   float64
	String    string
	PtrString *string
}
```

### <a id="downCaser" href="#downCaser">type downCaser struct</a>

```
searchKey: xml.downCaser
tags: [struct private]
```

```Go
type downCaser struct {
	t *testing.T
	r io.ByteReader
}
```

#### <a id="downCaser.Read" href="#downCaser.Read">func (d *downCaser) Read(p []byte) (int, error)</a>

```
searchKey: xml.downCaser.Read
tags: [method private]
```

```Go
func (d *downCaser) Read(p []byte) (int, error)
```

#### <a id="downCaser.ReadByte" href="#downCaser.ReadByte">func (d *downCaser) ReadByte() (c byte, err error)</a>

```
searchKey: xml.downCaser.ReadByte
tags: [method private]
```

```Go
func (d *downCaser) ReadByte() (c byte, err error)
```

### <a id="embedD" href="#embedD">type embedD struct</a>

```
searchKey: xml.embedD
tags: [struct private]
```

```Go
type embedD struct {
	fieldD string
	FieldE string // Promoted and visible when embedD is embedded.
}
```

### <a id="errWriter" href="#errWriter">type errWriter struct{}</a>

```
searchKey: xml.errWriter
tags: [struct private]
```

```Go
type errWriter struct{}
```

Writer whose Write method always returns an error. 

#### <a id="errWriter.Write" href="#errWriter.Write">func (errWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: xml.errWriter.Write
tags: [method private]
```

```Go
func (errWriter) Write(p []byte) (n int, err error)
```

### <a id="fieldFlags" href="#fieldFlags">type fieldFlags int</a>

```
searchKey: xml.fieldFlags
tags: [number private]
```

```Go
type fieldFlags int
```

### <a id="fieldInfo" href="#fieldInfo">type fieldInfo struct</a>

```
searchKey: xml.fieldInfo
tags: [struct private]
```

```Go
type fieldInfo struct {
	idx     []int
	name    string
	xmlns   string
	flags   fieldFlags
	parents []string
}
```

fieldInfo holds details for the xml representation of a single field. 

#### <a id="lookupXMLName" href="#lookupXMLName">func lookupXMLName(typ reflect.Type) (xmlname *fieldInfo)</a>

```
searchKey: xml.lookupXMLName
tags: [function private]
```

```Go
func lookupXMLName(typ reflect.Type) (xmlname *fieldInfo)
```

lookupXMLName returns the fieldInfo for typ's XMLName field in case it exists and has a valid xml field tag, otherwise it returns nil. 

#### <a id="structFieldInfo" href="#structFieldInfo">func structFieldInfo(typ reflect.Type, f *reflect.StructField) (*fieldInfo, error)</a>

```
searchKey: xml.structFieldInfo
tags: [function private]
```

```Go
func structFieldInfo(typ reflect.Type, f *reflect.StructField) (*fieldInfo, error)
```

structFieldInfo builds and returns a fieldInfo for f. 

#### <a id="fieldInfo.value" href="#fieldInfo.value">func (finfo *fieldInfo) value(v reflect.Value, shouldInitNilPointers bool) reflect.Value</a>

```
searchKey: xml.fieldInfo.value
tags: [method private]
```

```Go
func (finfo *fieldInfo) value(v reflect.Value, shouldInitNilPointers bool) reflect.Value
```

value returns v's field value corresponding to finfo. It's equivalent to v.FieldByIndex(finfo.idx), but when passed initNilPointers, it initializes and dereferences pointers as necessary. When passed dontInitNilPointers and a nil pointer is reached, the function returns a zero reflect.Value. 

### <a id="item" href="#item">type item struct</a>

```
searchKey: xml.item
tags: [struct private]
```

```Go
type item struct {
	FieldA string
}
```

### <a id="limitedBytesWriter" href="#limitedBytesWriter">type limitedBytesWriter struct</a>

```
searchKey: xml.limitedBytesWriter
tags: [struct private]
```

```Go
type limitedBytesWriter struct {
	w      io.Writer
	remain int // until writes fail
}
```

#### <a id="limitedBytesWriter.Write" href="#limitedBytesWriter.Write">func (lw *limitedBytesWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: xml.limitedBytesWriter.Write
tags: [method private]
```

```Go
func (lw *limitedBytesWriter) Write(p []byte) (n int, err error)
```

### <a id="mapper" href="#mapper">type mapper struct</a>

```
searchKey: xml.mapper
tags: [struct private]
```

```Go
type mapper struct {
	t TokenReader
	f func(Token) Token
}
```

#### <a id="mapper.Token" href="#mapper.Token">func (m mapper) Token() (Token, error)</a>

```
searchKey: xml.mapper.Token
tags: [method private]
```

```Go
func (m mapper) Token() (Token, error)
```

### <a id="parentStack" href="#parentStack">type parentStack struct</a>

```
searchKey: xml.parentStack
tags: [struct private]
```

```Go
type parentStack struct {
	p     *printer
	stack []string
}
```

#### <a id="parentStack.push" href="#parentStack.push">func (s *parentStack) push(parents []string) error</a>

```
searchKey: xml.parentStack.push
tags: [method private]
```

```Go
func (s *parentStack) push(parents []string) error
```

push adds parent elements to the stack and writes open tags. 

#### <a id="parentStack.trim" href="#parentStack.trim">func (s *parentStack) trim(parents []string) error</a>

```
searchKey: xml.parentStack.trim
tags: [method private]
```

```Go
func (s *parentStack) trim(parents []string) error
```

trim updates the XML context to match the longest common prefix of the stack and the given parents. A closing tag will be written for every parent popped. Passing a zero slice or nil will close all the elements. 

### <a id="printer" href="#printer">type printer struct</a>

```
searchKey: xml.printer
tags: [struct private]
```

```Go
type printer struct {
	*bufio.Writer
	encoder    *Encoder
	seq        int
	indent     string
	prefix     string
	depth      int
	indentedIn bool
	putNewline bool
	attrNS     map[string]string // map prefix -> name space
	attrPrefix map[string]string // map name space -> prefix
	prefixes   []string
	tags       []Name
}
```

#### <a id="printer.EscapeString" href="#printer.EscapeString">func (p *printer) EscapeString(s string)</a>

```
searchKey: xml.printer.EscapeString
tags: [method private]
```

```Go
func (p *printer) EscapeString(s string)
```

EscapeString writes to p the properly escaped XML equivalent of the plain text data s. 

#### <a id="printer.cachedWriteError" href="#printer.cachedWriteError">func (p *printer) cachedWriteError() error</a>

```
searchKey: xml.printer.cachedWriteError
tags: [method private]
```

```Go
func (p *printer) cachedWriteError() error
```

return the bufio Writer's cached write error 

#### <a id="printer.createAttrPrefix" href="#printer.createAttrPrefix">func (p *printer) createAttrPrefix(url string) string</a>

```
searchKey: xml.printer.createAttrPrefix
tags: [method private]
```

```Go
func (p *printer) createAttrPrefix(url string) string
```

createAttrPrefix finds the name space prefix attribute to use for the given name space, defining a new prefix if necessary. It returns the prefix. 

#### <a id="printer.deleteAttrPrefix" href="#printer.deleteAttrPrefix">func (p *printer) deleteAttrPrefix(prefix string)</a>

```
searchKey: xml.printer.deleteAttrPrefix
tags: [method private]
```

```Go
func (p *printer) deleteAttrPrefix(prefix string)
```

deleteAttrPrefix removes an attribute name space prefix. 

#### <a id="printer.markPrefix" href="#printer.markPrefix">func (p *printer) markPrefix()</a>

```
searchKey: xml.printer.markPrefix
tags: [method private]
```

```Go
func (p *printer) markPrefix()
```

#### <a id="printer.marshalAttr" href="#printer.marshalAttr">func (p *printer) marshalAttr(start *StartElement, name Name, val reflect.Value) error</a>

```
searchKey: xml.printer.marshalAttr
tags: [method private]
```

```Go
func (p *printer) marshalAttr(start *StartElement, name Name, val reflect.Value) error
```

marshalAttr marshals an attribute with the given name and value, adding to start.Attr. 

#### <a id="printer.marshalInterface" href="#printer.marshalInterface">func (p *printer) marshalInterface(val Marshaler, start StartElement) error</a>

```
searchKey: xml.printer.marshalInterface
tags: [method private]
```

```Go
func (p *printer) marshalInterface(val Marshaler, start StartElement) error
```

marshalInterface marshals a Marshaler interface value. 

#### <a id="printer.marshalSimple" href="#printer.marshalSimple">func (p *printer) marshalSimple(typ reflect.Type, val reflect.Value) (string, []byte, error)</a>

```
searchKey: xml.printer.marshalSimple
tags: [method private]
```

```Go
func (p *printer) marshalSimple(typ reflect.Type, val reflect.Value) (string, []byte, error)
```

#### <a id="printer.marshalStruct" href="#printer.marshalStruct">func (p *printer) marshalStruct(tinfo *typeInfo, val reflect.Value) error</a>

```
searchKey: xml.printer.marshalStruct
tags: [method private]
```

```Go
func (p *printer) marshalStruct(tinfo *typeInfo, val reflect.Value) error
```

#### <a id="printer.marshalTextInterface" href="#printer.marshalTextInterface">func (p *printer) marshalTextInterface(val encoding.TextMarshaler, start StartElement) error</a>

```
searchKey: xml.printer.marshalTextInterface
tags: [method private]
```

```Go
func (p *printer) marshalTextInterface(val encoding.TextMarshaler, start StartElement) error
```

marshalTextInterface marshals a TextMarshaler interface value. 

#### <a id="printer.marshalValue" href="#printer.marshalValue">func (p *printer) marshalValue(val reflect.Value, finfo *fieldInfo, startTemplate *StartElement) error</a>

```
searchKey: xml.printer.marshalValue
tags: [method private]
```

```Go
func (p *printer) marshalValue(val reflect.Value, finfo *fieldInfo, startTemplate *StartElement) error
```

marshalValue writes one or more XML elements representing val. If val was obtained from a struct field, finfo must have its details. 

#### <a id="printer.popPrefix" href="#printer.popPrefix">func (p *printer) popPrefix()</a>

```
searchKey: xml.printer.popPrefix
tags: [method private]
```

```Go
func (p *printer) popPrefix()
```

#### <a id="printer.writeEnd" href="#printer.writeEnd">func (p *printer) writeEnd(name Name) error</a>

```
searchKey: xml.printer.writeEnd
tags: [method private]
```

```Go
func (p *printer) writeEnd(name Name) error
```

#### <a id="printer.writeIndent" href="#printer.writeIndent">func (p *printer) writeIndent(depthDelta int)</a>

```
searchKey: xml.printer.writeIndent
tags: [method private]
```

```Go
func (p *printer) writeIndent(depthDelta int)
```

#### <a id="printer.writeStart" href="#printer.writeStart">func (p *printer) writeStart(start *StartElement) error</a>

```
searchKey: xml.printer.writeStart
tags: [method private]
```

```Go
func (p *printer) writeStart(start *StartElement) error
```

writeStart writes the given start element. 

### <a id="stack" href="#stack">type stack struct</a>

```
searchKey: xml.stack
tags: [struct private]
```

```Go
type stack struct {
	next *stack
	kind int
	name Name
	ok   bool
}
```

Parsing state - stack holds old name space translations and the current set of open elements. The translations to pop when ending a given tag are *below* it on the stack, which is more work but forced on us by XML. 

### <a id="tokReader" href="#tokReader">type tokReader struct{}</a>

```
searchKey: xml.tokReader
tags: [struct private]
```

```Go
type tokReader struct{}
```

#### <a id="tokReader.Token" href="#tokReader.Token">func (tokReader) Token() (Token, error)</a>

```
searchKey: xml.tokReader.Token
tags: [method private]
```

```Go
func (tokReader) Token() (Token, error)
```

### <a id="toks" href="#toks">type toks struct</a>

```
searchKey: xml.toks
tags: [struct private]
```

```Go
type toks struct {
	earlyEOF bool
	t        []Token
}
```

#### <a id="toks.Token" href="#toks.Token">func (t *toks) Token() (Token, error)</a>

```
searchKey: xml.toks.Token
tags: [method private]
```

```Go
func (t *toks) Token() (Token, error)
```

### <a id="toksNil" href="#toksNil">type toksNil struct</a>

```
searchKey: xml.toksNil
tags: [struct private]
```

```Go
type toksNil struct {
	returnEOF bool
	t         []Token
}
```

#### <a id="toksNil.Token" href="#toksNil.Token">func (t *toksNil) Token() (Token, error)</a>

```
searchKey: xml.toksNil.Token
tags: [method private]
```

```Go
func (t *toksNil) Token() (Token, error)
```

### <a id="typeInfo" href="#typeInfo">type typeInfo struct</a>

```
searchKey: xml.typeInfo
tags: [struct private]
```

```Go
type typeInfo struct {
	xmlname *fieldInfo
	fields  []fieldInfo
}
```

typeInfo holds details for the xml representation of a type. 

#### <a id="getTypeInfo" href="#getTypeInfo">func getTypeInfo(typ reflect.Type) (*typeInfo, error)</a>

```
searchKey: xml.getTypeInfo
tags: [function private]
```

```Go
func getTypeInfo(typ reflect.Type) (*typeInfo, error)
```

getTypeInfo returns the typeInfo structure with details necessary for marshaling and unmarshaling typ. 

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkMarshal" href="#BenchmarkMarshal">func BenchmarkMarshal(b *testing.B)</a>

```
searchKey: xml.BenchmarkMarshal
tags: [function private benchmark]
```

```Go
func BenchmarkMarshal(b *testing.B)
```

### <a id="BenchmarkUnmarshal" href="#BenchmarkUnmarshal">func BenchmarkUnmarshal(b *testing.B)</a>

```
searchKey: xml.BenchmarkUnmarshal
tags: [function private benchmark]
```

```Go
func BenchmarkUnmarshal(b *testing.B)
```

### <a id="Escape" href="#Escape">func Escape(w io.Writer, s []byte)</a>

```
searchKey: xml.Escape
tags: [function]
```

```Go
func Escape(w io.Writer, s []byte)
```

Escape is like EscapeText but omits the error return value. It is provided for backwards compatibility with Go 1.0. Code targeting Go 1.1 or later should use EscapeText. 

### <a id="EscapeText" href="#EscapeText">func EscapeText(w io.Writer, s []byte) error</a>

```
searchKey: xml.EscapeText
tags: [function]
```

```Go
func EscapeText(w io.Writer, s []byte) error
```

EscapeText writes to w the properly escaped XML equivalent of the plain text data s. 

### <a id="Marshal" href="#Marshal">func Marshal(v interface{}) ([]byte, error)</a>

```
searchKey: xml.Marshal
tags: [function]
```

```Go
func Marshal(v interface{}) ([]byte, error)
```

Marshal returns the XML encoding of v. 

Marshal handles an array or slice by marshaling each of the elements. Marshal handles a pointer by marshaling the value it points at or, if the pointer is nil, by writing nothing. Marshal handles an interface value by marshaling the value it contains or, if the interface value is nil, by writing nothing. Marshal handles all other data by writing one or more XML elements containing the data. 

The name for the XML elements is taken from, in order of preference: 

```
- the tag on the XMLName field, if the data is a struct
- the value of the XMLName field of type Name
- the tag of the struct field used to obtain the data
- the name of the struct field used to obtain the data
- the name of the marshaled type

```
The XML element for a struct contains marshaled elements for each of the exported fields of the struct, with these exceptions: 

```
- the XMLName field, described above, is omitted.
- a field with tag "-" is omitted.
- a field with tag "name,attr" becomes an attribute with
  the given name in the XML element.
- a field with tag ",attr" becomes an attribute with the
  field name in the XML element.
- a field with tag ",chardata" is written as character data,
  not as an XML element.
- a field with tag ",cdata" is written as character data
  wrapped in one or more <![CDATA[ ... ]]> tags, not as an XML element.
- a field with tag ",innerxml" is written verbatim, not subject
  to the usual marshaling procedure.
- a field with tag ",comment" is written as an XML comment, not
  subject to the usual marshaling procedure. It must not contain
  the "--" string within it.
- a field with a tag including the "omitempty" option is omitted
  if the field value is empty. The empty values are false, 0, any
  nil pointer or interface value, and any array, slice, map, or
  string of length zero.
- an anonymous struct field is handled as if the fields of its
  value were part of the outer struct.
- a field implementing Marshaler is written by calling its MarshalXML
  method.
- a field implementing encoding.TextMarshaler is written by encoding the
  result of its MarshalText method as text.

```
If a field uses a tag "a>b>c", then the element c will be nested inside parent elements a and b. Fields that appear next to each other that name the same parent will be enclosed in one XML element. 

If the XML name for a struct field is defined by both the field tag and the struct's XMLName field, the names must match. 

See MarshalIndent for an example. 

Marshal will return an error if asked to marshal a channel, function, or map. 

### <a id="MarshalIndent" href="#MarshalIndent">func MarshalIndent(v interface{}, prefix, indent string) ([]byte, error)</a>

```
searchKey: xml.MarshalIndent
tags: [function]
```

```Go
func MarshalIndent(v interface{}, prefix, indent string) ([]byte, error)
```

MarshalIndent works like Marshal, but each XML element begins on a new indented line that starts with prefix and is followed by one or more copies of indent according to the nesting depth. 

### <a id="ParseTime" href="#ParseTime">func ParseTime(str string) time.Time</a>

```
searchKey: xml.ParseTime
tags: [function private]
```

```Go
func ParseTime(str string) time.Time
```

### <a id="TestAllScalars" href="#TestAllScalars">func TestAllScalars(t *testing.T)</a>

```
searchKey: xml.TestAllScalars
tags: [function private test]
```

```Go
func TestAllScalars(t *testing.T)
```

### <a id="TestCopyTokenCharData" href="#TestCopyTokenCharData">func TestCopyTokenCharData(t *testing.T)</a>

```
searchKey: xml.TestCopyTokenCharData
tags: [function private test]
```

```Go
func TestCopyTokenCharData(t *testing.T)
```

### <a id="TestCopyTokenStartElement" href="#TestCopyTokenStartElement">func TestCopyTokenStartElement(t *testing.T)</a>

```
searchKey: xml.TestCopyTokenStartElement
tags: [function private test]
```

```Go
func TestCopyTokenStartElement(t *testing.T)
```

### <a id="TestDecodeEOF" href="#TestDecodeEOF">func TestDecodeEOF(t *testing.T)</a>

```
searchKey: xml.TestDecodeEOF
tags: [function private test]
```

```Go
func TestDecodeEOF(t *testing.T)
```

### <a id="TestDecodeEncode" href="#TestDecodeEncode">func TestDecodeEncode(t *testing.T)</a>

```
searchKey: xml.TestDecodeEncode
tags: [function private test]
```

```Go
func TestDecodeEncode(t *testing.T)
```

### <a id="TestDecodeNilToken" href="#TestDecodeNilToken">func TestDecodeNilToken(t *testing.T)</a>

```
searchKey: xml.TestDecodeNilToken
tags: [function private test]
```

```Go
func TestDecodeNilToken(t *testing.T)
```

### <a id="TestDirectivesWithComments" href="#TestDirectivesWithComments">func TestDirectivesWithComments(t *testing.T)</a>

```
searchKey: xml.TestDirectivesWithComments
tags: [function private test]
```

```Go
func TestDirectivesWithComments(t *testing.T)
```

### <a id="TestDisallowedCharacters" href="#TestDisallowedCharacters">func TestDisallowedCharacters(t *testing.T)</a>

```
searchKey: xml.TestDisallowedCharacters
tags: [function private test]
```

```Go
func TestDisallowedCharacters(t *testing.T)
```

### <a id="TestEncodeToken" href="#TestEncodeToken">func TestEncodeToken(t *testing.T)</a>

```
searchKey: xml.TestEncodeToken
tags: [function private test]
```

```Go
func TestEncodeToken(t *testing.T)
```

### <a id="TestEntityInsideCDATA" href="#TestEntityInsideCDATA">func TestEntityInsideCDATA(t *testing.T)</a>

```
searchKey: xml.TestEntityInsideCDATA
tags: [function private test]
```

```Go
func TestEntityInsideCDATA(t *testing.T)
```

### <a id="TestEscapeTextIOErrors" href="#TestEscapeTextIOErrors">func TestEscapeTextIOErrors(t *testing.T)</a>

```
searchKey: xml.TestEscapeTextIOErrors
tags: [function private test]
```

```Go
func TestEscapeTextIOErrors(t *testing.T)
```

### <a id="TestEscapeTextInvalidChar" href="#TestEscapeTextInvalidChar">func TestEscapeTextInvalidChar(t *testing.T)</a>

```
searchKey: xml.TestEscapeTextInvalidChar
tags: [function private test]
```

```Go
func TestEscapeTextInvalidChar(t *testing.T)
```

### <a id="TestInvalidInnerXMLType" href="#TestInvalidInnerXMLType">func TestInvalidInnerXMLType(t *testing.T)</a>

```
searchKey: xml.TestInvalidInnerXMLType
tags: [function private test]
```

```Go
func TestInvalidInnerXMLType(t *testing.T)
```

Issue 15600. ",innerxml" on a field that can't hold it. 

### <a id="TestInvalidXMLName" href="#TestInvalidXMLName">func TestInvalidXMLName(t *testing.T)</a>

```
searchKey: xml.TestInvalidXMLName
tags: [function private test]
```

```Go
func TestInvalidXMLName(t *testing.T)
```

### <a id="TestIsInCharacterRange" href="#TestIsInCharacterRange">func TestIsInCharacterRange(t *testing.T)</a>

```
searchKey: xml.TestIsInCharacterRange
tags: [function private test]
```

```Go
func TestIsInCharacterRange(t *testing.T)
```

### <a id="TestIsValidDirective" href="#TestIsValidDirective">func TestIsValidDirective(t *testing.T)</a>

```
searchKey: xml.TestIsValidDirective
tags: [function private test]
```

```Go
func TestIsValidDirective(t *testing.T)
```

### <a id="TestIssue11405" href="#TestIssue11405">func TestIssue11405(t *testing.T)</a>

```
searchKey: xml.TestIssue11405
tags: [function private test]
```

```Go
func TestIssue11405(t *testing.T)
```

### <a id="TestIssue12417" href="#TestIssue12417">func TestIssue12417(t *testing.T)</a>

```
searchKey: xml.TestIssue12417
tags: [function private test]
```

```Go
func TestIssue12417(t *testing.T)
```

### <a id="TestIssue16158" href="#TestIssue16158">func TestIssue16158(t *testing.T)</a>

```
searchKey: xml.TestIssue16158
tags: [function private test]
```

```Go
func TestIssue16158(t *testing.T)
```

Issue 16158. Decoder.unmarshalAttr ignores the return value of copyValue. 

### <a id="TestIssue569" href="#TestIssue569">func TestIssue569(t *testing.T)</a>

```
searchKey: xml.TestIssue569
tags: [function private test]
```

```Go
func TestIssue569(t *testing.T)
```

### <a id="TestIssue5880" href="#TestIssue5880">func TestIssue5880(t *testing.T)</a>

```
searchKey: xml.TestIssue5880
tags: [function private test]
```

```Go
func TestIssue5880(t *testing.T)
```

### <a id="TestMalformedComment" href="#TestMalformedComment">func TestMalformedComment(t *testing.T)</a>

```
searchKey: xml.TestMalformedComment
tags: [function private test]
```

```Go
func TestMalformedComment(t *testing.T)
```

Issue 11112. Unmarshal must reject invalid comments. 

### <a id="TestMarshal" href="#TestMarshal">func TestMarshal(t *testing.T)</a>

```
searchKey: xml.TestMarshal
tags: [function private test]
```

```Go
func TestMarshal(t *testing.T)
```

### <a id="TestMarshalErrors" href="#TestMarshalErrors">func TestMarshalErrors(t *testing.T)</a>

```
searchKey: xml.TestMarshalErrors
tags: [function private test]
```

```Go
func TestMarshalErrors(t *testing.T)
```

### <a id="TestMarshalFlush" href="#TestMarshalFlush">func TestMarshalFlush(t *testing.T)</a>

```
searchKey: xml.TestMarshalFlush
tags: [function private test]
```

```Go
func TestMarshalFlush(t *testing.T)
```

### <a id="TestMarshalIndent" href="#TestMarshalIndent">func TestMarshalIndent(t *testing.T)</a>

```
searchKey: xml.TestMarshalIndent
tags: [function private test]
```

```Go
func TestMarshalIndent(t *testing.T)
```

### <a id="TestMarshalNS" href="#TestMarshalNS">func TestMarshalNS(t *testing.T)</a>

```
searchKey: xml.TestMarshalNS
tags: [function private test]
```

```Go
func TestMarshalNS(t *testing.T)
```

### <a id="TestMarshalNSAttr" href="#TestMarshalNSAttr">func TestMarshalNSAttr(t *testing.T)</a>

```
searchKey: xml.TestMarshalNSAttr
tags: [function private test]
```

```Go
func TestMarshalNSAttr(t *testing.T)
```

### <a id="TestMarshalWriteErrors" href="#TestMarshalWriteErrors">func TestMarshalWriteErrors(t *testing.T)</a>

```
searchKey: xml.TestMarshalWriteErrors
tags: [function private test]
```

```Go
func TestMarshalWriteErrors(t *testing.T)
```

### <a id="TestMarshalWriteIOErrors" href="#TestMarshalWriteIOErrors">func TestMarshalWriteIOErrors(t *testing.T)</a>

```
searchKey: xml.TestMarshalWriteIOErrors
tags: [function private test]
```

```Go
func TestMarshalWriteIOErrors(t *testing.T)
```

### <a id="TestNestedDirectives" href="#TestNestedDirectives">func TestNestedDirectives(t *testing.T)</a>

```
searchKey: xml.TestNestedDirectives
tags: [function private test]
```

```Go
func TestNestedDirectives(t *testing.T)
```

### <a id="TestNewTokenDecoderIdempotent" href="#TestNewTokenDecoderIdempotent">func TestNewTokenDecoderIdempotent(t *testing.T)</a>

```
searchKey: xml.TestNewTokenDecoderIdempotent
tags: [function private test]
```

```Go
func TestNewTokenDecoderIdempotent(t *testing.T)
```

### <a id="TestNonStrictRawToken" href="#TestNonStrictRawToken">func TestNonStrictRawToken(t *testing.T)</a>

```
searchKey: xml.TestNonStrictRawToken
tags: [function private test]
```

```Go
func TestNonStrictRawToken(t *testing.T)
```

### <a id="TestProcInstEncodeToken" href="#TestProcInstEncodeToken">func TestProcInstEncodeToken(t *testing.T)</a>

```
searchKey: xml.TestProcInstEncodeToken
tags: [function private test]
```

```Go
func TestProcInstEncodeToken(t *testing.T)
```

### <a id="TestProcInstEncoding" href="#TestProcInstEncoding">func TestProcInstEncoding(t *testing.T)</a>

```
searchKey: xml.TestProcInstEncoding
tags: [function private test]
```

```Go
func TestProcInstEncoding(t *testing.T)
```

### <a id="TestRace9796" href="#TestRace9796">func TestRace9796(t *testing.T)</a>

```
searchKey: xml.TestRace9796
tags: [function private test]
```

```Go
func TestRace9796(t *testing.T)
```

Issue 9796. Used to fail with GORACE="halt_on_error=1" -race. 

### <a id="TestRawToken" href="#TestRawToken">func TestRawToken(t *testing.T)</a>

```
searchKey: xml.TestRawToken
tags: [function private test]
```

```Go
func TestRawToken(t *testing.T)
```

### <a id="TestRawTokenAltEncoding" href="#TestRawTokenAltEncoding">func TestRawTokenAltEncoding(t *testing.T)</a>

```
searchKey: xml.TestRawTokenAltEncoding
tags: [function private test]
```

```Go
func TestRawTokenAltEncoding(t *testing.T)
```

### <a id="TestRawTokenAltEncodingNoConverter" href="#TestRawTokenAltEncodingNoConverter">func TestRawTokenAltEncodingNoConverter(t *testing.T)</a>

```
searchKey: xml.TestRawTokenAltEncodingNoConverter
tags: [function private test]
```

```Go
func TestRawTokenAltEncodingNoConverter(t *testing.T)
```

### <a id="TestRoundTrip" href="#TestRoundTrip">func TestRoundTrip(t *testing.T)</a>

```
searchKey: xml.TestRoundTrip
tags: [function private test]
```

```Go
func TestRoundTrip(t *testing.T)
```

### <a id="TestSimpleUseOfEncodeToken" href="#TestSimpleUseOfEncodeToken">func TestSimpleUseOfEncodeToken(t *testing.T)</a>

```
searchKey: xml.TestSimpleUseOfEncodeToken
tags: [function private test]
```

```Go
func TestSimpleUseOfEncodeToken(t *testing.T)
```

Issue 11719. EncodeToken used to silently eat tokens with an invalid type. 

### <a id="TestStructPointerMarshal" href="#TestStructPointerMarshal">func TestStructPointerMarshal(t *testing.T)</a>

```
searchKey: xml.TestStructPointerMarshal
tags: [function private test]
```

```Go
func TestStructPointerMarshal(t *testing.T)
```

golang.org/issue/6556 

### <a id="TestSyntax" href="#TestSyntax">func TestSyntax(t *testing.T)</a>

```
searchKey: xml.TestSyntax
tags: [function private test]
```

```Go
func TestSyntax(t *testing.T)
```

### <a id="TestSyntaxErrorLineNum" href="#TestSyntaxErrorLineNum">func TestSyntaxErrorLineNum(t *testing.T)</a>

```
searchKey: xml.TestSyntaxErrorLineNum
tags: [function private test]
```

```Go
func TestSyntaxErrorLineNum(t *testing.T)
```

### <a id="TestToken" href="#TestToken">func TestToken(t *testing.T)</a>

```
searchKey: xml.TestToken
tags: [function private test]
```

```Go
func TestToken(t *testing.T)
```

### <a id="TestTokenUnmarshaler" href="#TestTokenUnmarshaler">func TestTokenUnmarshaler(t *testing.T)</a>

```
searchKey: xml.TestTokenUnmarshaler
tags: [function private test]
```

```Go
func TestTokenUnmarshaler(t *testing.T)
```

### <a id="TestTrailingRawToken" href="#TestTrailingRawToken">func TestTrailingRawToken(t *testing.T)</a>

```
searchKey: xml.TestTrailingRawToken
tags: [function private test]
```

```Go
func TestTrailingRawToken(t *testing.T)
```

### <a id="TestTrailingToken" href="#TestTrailingToken">func TestTrailingToken(t *testing.T)</a>

```
searchKey: xml.TestTrailingToken
tags: [function private test]
```

```Go
func TestTrailingToken(t *testing.T)
```

### <a id="TestUnmarshal" href="#TestUnmarshal">func TestUnmarshal(t *testing.T)</a>

```
searchKey: xml.TestUnmarshal
tags: [function private test]
```

```Go
func TestUnmarshal(t *testing.T)
```

Do invertibility testing on the various structures that we test 

### <a id="TestUnmarshalAttr" href="#TestUnmarshalAttr">func TestUnmarshalAttr(t *testing.T)</a>

```
searchKey: xml.TestUnmarshalAttr
tags: [function private test]
```

```Go
func TestUnmarshalAttr(t *testing.T)
```

### <a id="TestUnmarshalBadPaths" href="#TestUnmarshalBadPaths">func TestUnmarshalBadPaths(t *testing.T)</a>

```
searchKey: xml.TestUnmarshalBadPaths
tags: [function private test]
```

```Go
func TestUnmarshalBadPaths(t *testing.T)
```

### <a id="TestUnmarshalEmptyValues" href="#TestUnmarshalEmptyValues">func TestUnmarshalEmptyValues(t *testing.T)</a>

```
searchKey: xml.TestUnmarshalEmptyValues
tags: [function private test]
```

```Go
func TestUnmarshalEmptyValues(t *testing.T)
```

golang.org/issues/13417 

### <a id="TestUnmarshalFeed" href="#TestUnmarshalFeed">func TestUnmarshalFeed(t *testing.T)</a>

```
searchKey: xml.TestUnmarshalFeed
tags: [function private test]
```

```Go
func TestUnmarshalFeed(t *testing.T)
```

### <a id="TestUnmarshalIntoInterface" href="#TestUnmarshalIntoInterface">func TestUnmarshalIntoInterface(t *testing.T)</a>

```
searchKey: xml.TestUnmarshalIntoInterface
tags: [function private test]
```

```Go
func TestUnmarshalIntoInterface(t *testing.T)
```

[https://golang.org/issue/6836](https://golang.org/issue/6836) 

### <a id="TestUnmarshalNS" href="#TestUnmarshalNS">func TestUnmarshalNS(t *testing.T)</a>

```
searchKey: xml.TestUnmarshalNS
tags: [function private test]
```

```Go
func TestUnmarshalNS(t *testing.T)
```

### <a id="TestUnmarshalNSAttr" href="#TestUnmarshalNSAttr">func TestUnmarshalNSAttr(t *testing.T)</a>

```
searchKey: xml.TestUnmarshalNSAttr
tags: [function private test]
```

```Go
func TestUnmarshalNSAttr(t *testing.T)
```

### <a id="TestUnmarshalPaths" href="#TestUnmarshalPaths">func TestUnmarshalPaths(t *testing.T)</a>

```
searchKey: xml.TestUnmarshalPaths
tags: [function private test]
```

```Go
func TestUnmarshalPaths(t *testing.T)
```

### <a id="TestUnmarshalWhitespaceAttrs" href="#TestUnmarshalWhitespaceAttrs">func TestUnmarshalWhitespaceAttrs(t *testing.T)</a>

```
searchKey: xml.TestUnmarshalWhitespaceAttrs
tags: [function private test]
```

```Go
func TestUnmarshalWhitespaceAttrs(t *testing.T)
```

golang.org/issues/22146 

### <a id="TestUnmarshalWhitespaceValues" href="#TestUnmarshalWhitespaceValues">func TestUnmarshalWhitespaceValues(t *testing.T)</a>

```
searchKey: xml.TestUnmarshalWhitespaceValues
tags: [function private test]
```

```Go
func TestUnmarshalWhitespaceValues(t *testing.T)
```

golang.org/issues/22146 

### <a id="TestUnmarshalWithoutNameType" href="#TestUnmarshalWithoutNameType">func TestUnmarshalWithoutNameType(t *testing.T)</a>

```
searchKey: xml.TestUnmarshalWithoutNameType
tags: [function private test]
```

```Go
func TestUnmarshalWithoutNameType(t *testing.T)
```

### <a id="TestUnmarshaler" href="#TestUnmarshaler">func TestUnmarshaler(t *testing.T)</a>

```
searchKey: xml.TestUnmarshaler
tags: [function private test]
```

```Go
func TestUnmarshaler(t *testing.T)
```

### <a id="TestUnquotedAttrs" href="#TestUnquotedAttrs">func TestUnquotedAttrs(t *testing.T)</a>

```
searchKey: xml.TestUnquotedAttrs
tags: [function private test]
```

```Go
func TestUnquotedAttrs(t *testing.T)
```

### <a id="TestValuelessAttrs" href="#TestValuelessAttrs">func TestValuelessAttrs(t *testing.T)</a>

```
searchKey: xml.TestValuelessAttrs
tags: [function private test]
```

```Go
func TestValuelessAttrs(t *testing.T)
```

### <a id="TestWrapDecoder" href="#TestWrapDecoder">func TestWrapDecoder(t *testing.T)</a>

```
searchKey: xml.TestWrapDecoder
tags: [function private test]
```

```Go
func TestWrapDecoder(t *testing.T)
```

### <a id="Unmarshal" href="#Unmarshal">func Unmarshal(data []byte, v interface{}) error</a>

```
searchKey: xml.Unmarshal
tags: [function]
```

```Go
func Unmarshal(data []byte, v interface{}) error
```

Unmarshal parses the XML-encoded data and stores the result in the value pointed to by v, which must be an arbitrary struct, slice, or string. Well-formed data that does not fit into v is discarded. 

Because Unmarshal uses the reflect package, it can only assign to exported (upper case) fields. Unmarshal uses a case-sensitive comparison to match XML element names to tag values and struct field names. 

Unmarshal maps an XML element to a struct using the following rules. In the rules, the tag of a field refers to the value associated with the key 'xml' in the struct field's tag (see the example above). 

```
* If the struct has a field of type []byte or string with tag
   ",innerxml", Unmarshal accumulates the raw XML nested inside the
   element in that field. The rest of the rules still apply.

* If the struct has a field named XMLName of type Name,
   Unmarshal records the element name in that field.

* If the XMLName field has an associated tag of the form
   "name" or "namespace-URL name", the XML element must have
   the given name (and, optionally, name space) or else Unmarshal
   returns an error.

* If the XML element has an attribute whose name matches a
   struct field name with an associated tag containing ",attr" or
   the explicit name in a struct field tag of the form "name,attr",
   Unmarshal records the attribute value in that field.

* If the XML element has an attribute not handled by the previous
   rule and the struct has a field with an associated tag containing
   ",any,attr", Unmarshal records the attribute value in the first
   such field.

* If the XML element contains character data, that data is
   accumulated in the first struct field that has tag ",chardata".
   The struct field may have type []byte or string.
   If there is no such field, the character data is discarded.

* If the XML element contains comments, they are accumulated in
   the first struct field that has tag ",comment".  The struct
   field may have type []byte or string. If there is no such
   field, the comments are discarded.

* If the XML element contains a sub-element whose name matches
   the prefix of a tag formatted as "a" or "a>b>c", unmarshal
   will descend into the XML structure looking for elements with the
   given names, and will map the innermost elements to that struct
   field. A tag starting with ">" is equivalent to one starting
   with the field name followed by ">".

* If the XML element contains a sub-element whose name matches
   a struct field's XMLName tag and the struct field has no
   explicit name tag as per the previous rule, unmarshal maps
   the sub-element to that struct field.

* If the XML element contains a sub-element whose name matches a
   field without any mode flags (",attr", ",chardata", etc), Unmarshal
   maps the sub-element to that struct field.

* If the XML element contains a sub-element that hasn't matched any
   of the above rules and the struct has a field with tag ",any",
   unmarshal maps the sub-element to that struct field.

* An anonymous struct field is handled as if the fields of its
   value were part of the outer struct.

* A struct field with tag "-" is never unmarshaled into.

```
If Unmarshal encounters a field type that implements the Unmarshaler interface, Unmarshal calls its UnmarshalXML method to produce the value from the XML element.  Otherwise, if the value implements encoding.TextUnmarshaler, Unmarshal calls that value's UnmarshalText method. 

Unmarshal maps an XML element to a string or []byte by saving the concatenation of that element's character data in the string or []byte. The saved []byte is never nil. 

Unmarshal maps an attribute value to a string or []byte by saving the value in the string or slice. 

Unmarshal maps an attribute value to an Attr by saving the attribute, including its name, in the Attr. 

Unmarshal maps an XML element or attribute value to a slice by extending the length of the slice and mapping the element or attribute to the newly created value. 

Unmarshal maps an XML element or attribute value to a bool by setting it to the boolean value represented by the string. Whitespace is trimmed and ignored. 

Unmarshal maps an XML element or attribute value to an integer or floating-point field by setting the field to the result of interpreting the string value in decimal. There is no check for overflow. Whitespace is trimmed and ignored. 

Unmarshal maps an XML element to a Name by recording the element name. 

Unmarshal maps an XML element to a pointer by setting the pointer to a freshly allocated value and then mapping the element to that value. 

A missing element or empty attribute value will be unmarshaled as a zero value. If the field is a slice, a zero value will be appended to the field. Otherwise, the field will be set to its zero value. 

### <a id="addFieldInfo" href="#addFieldInfo">func addFieldInfo(typ reflect.Type, tinfo *typeInfo, newf *fieldInfo) error</a>

```
searchKey: xml.addFieldInfo
tags: [function private]
```

```Go
func addFieldInfo(typ reflect.Type, tinfo *typeInfo, newf *fieldInfo) error
```

addFieldInfo adds finfo to tinfo.fields if there are no conflicts, or if conflicts arise from previous fields that were obtained from deeper embedded structures than finfo. In the latter case, the conflicting entries are dropped. A conflict occurs when the path (parent + name) to a field is itself a prefix of another path, or when two paths match exactly. It is okay for field paths to share a common, shorter prefix. 

### <a id="copyValue" href="#copyValue">func copyValue(dst reflect.Value, src []byte) (err error)</a>

```
searchKey: xml.copyValue
tags: [function private]
```

```Go
func copyValue(dst reflect.Value, src []byte) (err error)
```

### <a id="emitCDATA" href="#emitCDATA">func emitCDATA(w io.Writer, s []byte) error</a>

```
searchKey: xml.emitCDATA
tags: [function private]
```

```Go
func emitCDATA(w io.Writer, s []byte) error
```

emitCDATA writes to w the CDATA-wrapped plain text data s. It escapes CDATA directives nested in s. 

### <a id="escapeText" href="#escapeText">func escapeText(w io.Writer, s []byte, escapeNewline bool) error</a>

```
searchKey: xml.escapeText
tags: [function private]
```

```Go
func escapeText(w io.Writer, s []byte, escapeNewline bool) error
```

escapeText writes to w the properly escaped XML equivalent of the plain text data s. If escapeNewline is true, newline characters will be escaped. 

### <a id="ifaceptr" href="#ifaceptr">func ifaceptr(x interface{}) interface{}</a>

```
searchKey: xml.ifaceptr
tags: [function private]
```

```Go
func ifaceptr(x interface{}) interface{}
```

### <a id="indirect" href="#indirect">func indirect(vf reflect.Value) reflect.Value</a>

```
searchKey: xml.indirect
tags: [function private]
```

```Go
func indirect(vf reflect.Value) reflect.Value
```

indirect drills into interfaces and pointers, returning the pointed-at value. If it encounters a nil interface or pointer, indirect returns that nil value. This can turn into an infinite loop given a cyclic chain, but it matches the Go 1 behavior. 

### <a id="isEmptyValue" href="#isEmptyValue">func isEmptyValue(v reflect.Value) bool</a>

```
searchKey: xml.isEmptyValue
tags: [function private]
```

```Go
func isEmptyValue(v reflect.Value) bool
```

### <a id="isInCharacterRange" href="#isInCharacterRange">func isInCharacterRange(r rune) (inrange bool)</a>

```
searchKey: xml.isInCharacterRange
tags: [function private]
```

```Go
func isInCharacterRange(r rune) (inrange bool)
```

Decide whether the given rune is in the XML Character Range, per the Char production of [https://www.xml.com/axml/testaxml.htm](https://www.xml.com/axml/testaxml.htm), Section 2.2 Characters. 

### <a id="isName" href="#isName">func isName(s []byte) bool</a>

```
searchKey: xml.isName
tags: [function private]
```

```Go
func isName(s []byte) bool
```

### <a id="isNameByte" href="#isNameByte">func isNameByte(c byte) bool</a>

```
searchKey: xml.isNameByte
tags: [function private]
```

```Go
func isNameByte(c byte) bool
```

### <a id="isNameString" href="#isNameString">func isNameString(s string) bool</a>

```
searchKey: xml.isNameString
tags: [function private]
```

```Go
func isNameString(s string) bool
```

### <a id="isValidDirective" href="#isValidDirective">func isValidDirective(dir Directive) bool</a>

```
searchKey: xml.isValidDirective
tags: [function private]
```

```Go
func isValidDirective(dir Directive) bool
```

isValidDirective reports whether dir is a valid directive text, meaning angle brackets are matched, ignoring comments and strings. 

### <a id="makeCopy" href="#makeCopy">func makeCopy(b []byte) []byte</a>

```
searchKey: xml.makeCopy
tags: [function private]
```

```Go
func makeCopy(b []byte) []byte
```

### <a id="min" href="#min">func min(a, b int) int</a>

```
searchKey: xml.min
tags: [function private]
```

```Go
func min(a, b int) int
```

### <a id="procInst" href="#procInst">func procInst(param, s string) string</a>

```
searchKey: xml.procInst
tags: [function private]
```

```Go
func procInst(param, s string) string
```

procInst parses the `param="..."` or `param='...'` value out of the provided string, returning "" if not found. 

### <a id="receiverType" href="#receiverType">func receiverType(val interface{}) string</a>

```
searchKey: xml.receiverType
tags: [function private]
```

```Go
func receiverType(val interface{}) string
```

receiverType returns the receiver type to use in an expression like "%s.MethodName". 

### <a id="stringptr" href="#stringptr">func stringptr(x string) *string</a>

```
searchKey: xml.stringptr
tags: [function private]
```

```Go
func stringptr(x string) *string
```

### <a id="testRawToken" href="#testRawToken">func testRawToken(t *testing.T, d *Decoder, raw string, rawTokens []Token)</a>

```
searchKey: xml.testRawToken
tags: [function private]
```

```Go
func testRawToken(t *testing.T, d *Decoder, raw string, rawTokens []Token)
```

### <a id="testRoundTrip" href="#testRoundTrip">func testRoundTrip(t *testing.T, input string)</a>

```
searchKey: xml.testRoundTrip
tags: [function private]
```

```Go
func testRoundTrip(t *testing.T, input string)
```

### <a id="tokenMap" href="#tokenMap">func tokenMap(mapping func(t Token) Token) func(TokenReader) TokenReader</a>

```
searchKey: xml.tokenMap
tags: [function private]
```

```Go
func tokenMap(mapping func(t Token) Token) func(TokenReader) TokenReader
```

