# Package mime

Package mime implements parts of the MIME spec. 

## Index

* Subpages
  * [mime/multipart](mime/multipart.md)
  * [mime/multipart_test](mime/multipart_test.md)
  * [mime/quotedprintable](mime/quotedprintable.md)
  * [mime/quotedprintable_test](mime/quotedprintable_test.md)
* [Constants](#const)
    * [const BEncoding](#BEncoding)
    * [const QEncoding](#QEncoding)
    * [const maxContentLen](#maxContentLen)
    * [const maxEncodedWordLen](#maxEncodedWordLen)
    * [const upperhex](#upperhex)
* [Variables](#var)
    * [var ErrInvalidMediaParameter](#ErrInvalidMediaParameter)
    * [var badMediaTypeTests](#badMediaTypeTests)
    * [var builtinTypesLower](#builtinTypesLower)
    * [var errInvalidWord](#errInvalidWord)
    * [var extensions](#extensions)
    * [var extensionsMu](#extensionsMu)
    * [var formatTests](#formatTests)
    * [var maxBase64Len](#maxBase64Len)
    * [var mimeGlobs](#mimeGlobs)
    * [var mimeTypes](#mimeTypes)
    * [var mimeTypesLower](#mimeTypesLower)
    * [var once](#once)
    * [var osInitMime](#osInitMime)
    * [var testInitMime](#testInitMime)
    * [var typeFiles](#typeFiles)
* [Types](#type)
    * [type WordDecoder struct](#WordDecoder)
        * [func (d *WordDecoder) Decode(word string) (string, error)](#WordDecoder.Decode)
        * [func (d *WordDecoder) DecodeHeader(header string) (string, error)](#WordDecoder.DecodeHeader)
        * [func (d *WordDecoder) convert(buf *strings.Builder, charset string, content []byte) error](#WordDecoder.convert)
    * [type WordEncoder byte](#WordEncoder)
        * [func (e WordEncoder) Encode(charset, s string) string](#WordEncoder.Encode)
        * [func (e WordEncoder) bEncode(buf *strings.Builder, charset, s string)](#WordEncoder.bEncode)
        * [func (e WordEncoder) encodeWord(charset, s string) string](#WordEncoder.encodeWord)
        * [func (e WordEncoder) openWord(buf *strings.Builder, charset string)](#WordEncoder.openWord)
        * [func (e WordEncoder) qEncode(buf *strings.Builder, charset, s string)](#WordEncoder.qEncode)
        * [func (e WordEncoder) splitWord(buf *strings.Builder, charset string)](#WordEncoder.splitWord)
    * [type badMediaTypeTest struct](#badMediaTypeTest)
    * [type formatTest struct](#formatTest)
    * [type mediaTypeTest struct](#mediaTypeTest)
* [Functions](#func)
    * [func AddExtensionType(ext, typ string) error](#AddExtensionType)
    * [func BenchmarkExtensionsByType(b *testing.B)](#BenchmarkExtensionsByType)
    * [func BenchmarkQDecodeHeader(b *testing.B)](#BenchmarkQDecodeHeader)
    * [func BenchmarkQDecodeWord(b *testing.B)](#BenchmarkQDecodeWord)
    * [func BenchmarkQEncodeWord(b *testing.B)](#BenchmarkQEncodeWord)
    * [func BenchmarkTypeByExtension(b *testing.B)](#BenchmarkTypeByExtension)
    * [func ExtensionsByType(typ string) ([]string, error)](#ExtensionsByType)
    * [func FormatMediaType(t string, param map[string]string) string](#FormatMediaType)
    * [func ParseMediaType(v string) (mediatype string, params map[string]string, err error)](#ParseMediaType)
    * [func TestCharsetDecoder(t *testing.T)](#TestCharsetDecoder)
    * [func TestCharsetDecoderError(t *testing.T)](#TestCharsetDecoderError)
    * [func TestConsumeMediaParam(t *testing.T)](#TestConsumeMediaParam)
    * [func TestConsumeToken(t *testing.T)](#TestConsumeToken)
    * [func TestConsumeValue(t *testing.T)](#TestConsumeValue)
    * [func TestDecodeHeader(t *testing.T)](#TestDecodeHeader)
    * [func TestDecodeWord(t *testing.T)](#TestDecodeWord)
    * [func TestEncodeWord(t *testing.T)](#TestEncodeWord)
    * [func TestEncodedWordLength(t *testing.T)](#TestEncodedWordLength)
    * [func TestExtensionsByType(t *testing.T)](#TestExtensionsByType)
    * [func TestExtensionsByType2(t *testing.T)](#TestExtensionsByType2)
    * [func TestFormatMediaType(t *testing.T)](#TestFormatMediaType)
    * [func TestLookupMallocs(t *testing.T)](#TestLookupMallocs)
    * [func TestParseMediaType(t *testing.T)](#TestParseMediaType)
    * [func TestParseMediaTypeBogus(t *testing.T)](#TestParseMediaTypeBogus)
    * [func TestTypeByExtension(t *testing.T)](#TestTypeByExtension)
    * [func TestTypeByExtensionCase(t *testing.T)](#TestTypeByExtensionCase)
    * [func TestTypeByExtensionUNIX(t *testing.T)](#TestTypeByExtensionUNIX)
    * [func TestTypeByExtension_LocalData(t *testing.T)](#TestTypeByExtension_LocalData)
    * [func TypeByExtension(ext string) string](#TypeByExtension)
    * [func checkMediaTypeDisposition(s string) error](#checkMediaTypeDisposition)
    * [func clearMimeTypes()](#clearMimeTypes)
    * [func clearSyncMap(m *sync.Map)](#clearSyncMap)
    * [func closeWord(buf *strings.Builder)](#closeWord)
    * [func consumeMediaParam(v string) (param, value, rest string)](#consumeMediaParam)
    * [func consumeToken(v string) (token, rest string)](#consumeToken)
    * [func consumeValue(v string) (value, rest string)](#consumeValue)
    * [func decode(encoding byte, text string) ([]byte, error)](#decode)
    * [func decode2231Enc(v string) (string, bool)](#decode2231Enc)
    * [func fromHex(b byte) (byte, error)](#fromHex)
    * [func hasNonWhitespace(s string) bool](#hasNonWhitespace)
    * [func init()](#init.type_unix.go)
    * [func initMime()](#initMime)
    * [func initMimeForTests() map[string]string](#initMimeForTests)
    * [func initMimeUnix()](#initMimeUnix)
    * [func initMimeUnixTest(t *testing.T)](#initMimeUnixTest)
    * [func isNotTokenChar(r rune) bool](#isNotTokenChar)
    * [func isTSpecial(r rune) bool](#isTSpecial)
    * [func isToken(s string) bool](#isToken)
    * [func isTokenChar(r rune) bool](#isTokenChar)
    * [func isUTF8(charset string) bool](#isUTF8)
    * [func ishex(c byte) bool](#ishex)
    * [func loadMimeFile(filename string)](#loadMimeFile)
    * [func loadMimeGlobsFile(filename string) error](#loadMimeGlobsFile)
    * [func needsEncoding(s string) bool](#needsEncoding)
    * [func percentHexUnescape(s string) (string, error)](#percentHexUnescape)
    * [func qDecode(s string) ([]byte, error)](#qDecode)
    * [func readHexByte(a, b byte) (byte, error)](#readHexByte)
    * [func setExtensionType(extension, mimeType string) error](#setExtensionType)
    * [func setMimeInit(fn func()) (cleanup func())](#setMimeInit)
    * [func setMimeTypes(lowerExt, mixExt map[string]string)](#setMimeTypes)
    * [func setType(ext, typ string)](#setType)
    * [func unhex(c byte) byte](#unhex)
    * [func writeQString(buf *strings.Builder, s string)](#writeQString)


## <a id="const" href="#const">Constants</a>

### <a id="BEncoding" href="#BEncoding">const BEncoding</a>

```
searchKey: mime.BEncoding
tags: [constant number]
```

```Go
const BEncoding = WordEncoder('b')
```

BEncoding represents Base64 encoding scheme as defined by RFC 2045. 

### <a id="QEncoding" href="#QEncoding">const QEncoding</a>

```
searchKey: mime.QEncoding
tags: [constant number]
```

```Go
const QEncoding = WordEncoder('q')
```

QEncoding represents the Q-encoding scheme as defined by RFC 2047. 

### <a id="maxContentLen" href="#maxContentLen">const maxContentLen</a>

```
searchKey: mime.maxContentLen
tags: [constant number private]
```

```Go
const maxContentLen = maxEncodedWordLen - len("=?UTF-8?q?") - len("?=")
```

maxContentLen is how much content can be encoded, ignoring the header and 2-byte footer. 

### <a id="maxEncodedWordLen" href="#maxEncodedWordLen">const maxEncodedWordLen</a>

```
searchKey: mime.maxEncodedWordLen
tags: [constant number private]
```

```Go
const maxEncodedWordLen = 75
```

The maximum length of an encoded-word is 75 characters. See RFC 2047, section 2. 

### <a id="upperhex" href="#upperhex">const upperhex</a>

```
searchKey: mime.upperhex
tags: [constant string private]
```

```Go
const upperhex = "0123456789ABCDEF"
```

## <a id="var" href="#var">Variables</a>

### <a id="ErrInvalidMediaParameter" href="#ErrInvalidMediaParameter">var ErrInvalidMediaParameter</a>

```
searchKey: mime.ErrInvalidMediaParameter
tags: [variable interface]
```

```Go
var ErrInvalidMediaParameter = errors.New("mime: invalid media parameter")
```

ErrInvalidMediaParameter is returned by ParseMediaType if the media type value was found but there was an error parsing the optional parameters 

### <a id="badMediaTypeTests" href="#badMediaTypeTests">var badMediaTypeTests</a>

```
searchKey: mime.badMediaTypeTests
tags: [variable array struct private]
```

```Go
var badMediaTypeTests = ...
```

### <a id="builtinTypesLower" href="#builtinTypesLower">var builtinTypesLower</a>

```
searchKey: mime.builtinTypesLower
tags: [variable object private]
```

```Go
var builtinTypesLower = ...
```

### <a id="errInvalidWord" href="#errInvalidWord">var errInvalidWord</a>

```
searchKey: mime.errInvalidWord
tags: [variable interface private]
```

```Go
var errInvalidWord = errors.New("mime: invalid RFC 2047 encoded-word")
```

### <a id="extensions" href="#extensions">var extensions</a>

```
searchKey: mime.extensions
tags: [variable struct private]
```

```Go
var extensions sync.Map // map[string][]string; slice values are append-only.

```

### <a id="extensionsMu" href="#extensionsMu">var extensionsMu</a>

```
searchKey: mime.extensionsMu
tags: [variable struct private]
```

```Go
var extensionsMu sync.Mutex // Guards stores (but not loads) on extensions.

```

extensions maps from MIME type to list of lowercase file extensions: "image/jpeg" => [".jpg", ".jpeg"] 

### <a id="formatTests" href="#formatTests">var formatTests</a>

```
searchKey: mime.formatTests
tags: [variable array struct private]
```

```Go
var formatTests = ...
```

### <a id="maxBase64Len" href="#maxBase64Len">var maxBase64Len</a>

```
searchKey: mime.maxBase64Len
tags: [variable number private]
```

```Go
var maxBase64Len = base64.StdEncoding.DecodedLen(maxContentLen)
```

### <a id="mimeGlobs" href="#mimeGlobs">var mimeGlobs</a>

```
searchKey: mime.mimeGlobs
tags: [variable array string private]
```

```Go
var mimeGlobs = []string{
	"/usr/local/share/mime/globs2",
	"/usr/share/mime/globs2",
}
```

See [https://specifications.freedesktop.org/shared-mime-info-spec/shared-mime-info-spec-0.21.html](https://specifications.freedesktop.org/shared-mime-info-spec/shared-mime-info-spec-0.21.html) for the FreeDesktop Shared MIME-info Database specification. 

### <a id="mimeTypes" href="#mimeTypes">var mimeTypes</a>

```
searchKey: mime.mimeTypes
tags: [variable struct private]
```

```Go
var mimeTypes sync.Map // map[string]string; ".Z" => "application/x-compress"

```

### <a id="mimeTypesLower" href="#mimeTypesLower">var mimeTypesLower</a>

```
searchKey: mime.mimeTypesLower
tags: [variable struct private]
```

```Go
var mimeTypesLower sync.Map // map[string]string; ".z" => "application/x-compress"

```

### <a id="once" href="#once">var once</a>

```
searchKey: mime.once
tags: [variable struct private]
```

```Go
var once sync.Once // guards initMime

```

### <a id="osInitMime" href="#osInitMime">var osInitMime</a>

```
searchKey: mime.osInitMime
tags: [variable function private]
```

```Go
var testInitMime, osInitMime func()
```

### <a id="testInitMime" href="#testInitMime">var testInitMime</a>

```
searchKey: mime.testInitMime
tags: [variable function private]
```

```Go
var testInitMime, osInitMime func()
```

### <a id="typeFiles" href="#typeFiles">var typeFiles</a>

```
searchKey: mime.typeFiles
tags: [variable array string private]
```

```Go
var typeFiles = ...
```

Common locations for mime.types files on unix. 

## <a id="type" href="#type">Types</a>

### <a id="WordDecoder" href="#WordDecoder">type WordDecoder struct</a>

```
searchKey: mime.WordDecoder
tags: [struct]
```

```Go
type WordDecoder struct {
	// CharsetReader, if non-nil, defines a function to generate
	// charset-conversion readers, converting from the provided
	// charset into UTF-8.
	// Charsets are always lower-case. utf-8, iso-8859-1 and us-ascii charsets
	// are handled by default.
	// One of the CharsetReader's result values must be non-nil.
	CharsetReader func(charset string, input io.Reader) (io.Reader, error)
}
```

A WordDecoder decodes MIME headers containing RFC 2047 encoded-words. 

#### <a id="WordDecoder.Decode" href="#WordDecoder.Decode">func (d *WordDecoder) Decode(word string) (string, error)</a>

```
searchKey: mime.WordDecoder.Decode
tags: [method]
```

```Go
func (d *WordDecoder) Decode(word string) (string, error)
```

Decode decodes an RFC 2047 encoded-word. 

#### <a id="WordDecoder.DecodeHeader" href="#WordDecoder.DecodeHeader">func (d *WordDecoder) DecodeHeader(header string) (string, error)</a>

```
searchKey: mime.WordDecoder.DecodeHeader
tags: [method]
```

```Go
func (d *WordDecoder) DecodeHeader(header string) (string, error)
```

DecodeHeader decodes all encoded-words of the given string. It returns an error if and only if CharsetReader of d returns an error. 

#### <a id="WordDecoder.convert" href="#WordDecoder.convert">func (d *WordDecoder) convert(buf *strings.Builder, charset string, content []byte) error</a>

```
searchKey: mime.WordDecoder.convert
tags: [method private]
```

```Go
func (d *WordDecoder) convert(buf *strings.Builder, charset string, content []byte) error
```

### <a id="WordEncoder" href="#WordEncoder">type WordEncoder byte</a>

```
searchKey: mime.WordEncoder
tags: [number]
```

```Go
type WordEncoder byte
```

A WordEncoder is an RFC 2047 encoded-word encoder. 

#### <a id="WordEncoder.Encode" href="#WordEncoder.Encode">func (e WordEncoder) Encode(charset, s string) string</a>

```
searchKey: mime.WordEncoder.Encode
tags: [method]
```

```Go
func (e WordEncoder) Encode(charset, s string) string
```

Encode returns the encoded-word form of s. If s is ASCII without special characters, it is returned unchanged. The provided charset is the IANA charset name of s. It is case insensitive. 

#### <a id="WordEncoder.bEncode" href="#WordEncoder.bEncode">func (e WordEncoder) bEncode(buf *strings.Builder, charset, s string)</a>

```
searchKey: mime.WordEncoder.bEncode
tags: [method private]
```

```Go
func (e WordEncoder) bEncode(buf *strings.Builder, charset, s string)
```

bEncode encodes s using base64 encoding and writes it to buf. 

#### <a id="WordEncoder.encodeWord" href="#WordEncoder.encodeWord">func (e WordEncoder) encodeWord(charset, s string) string</a>

```
searchKey: mime.WordEncoder.encodeWord
tags: [method private]
```

```Go
func (e WordEncoder) encodeWord(charset, s string) string
```

encodeWord encodes a string into an encoded-word. 

#### <a id="WordEncoder.openWord" href="#WordEncoder.openWord">func (e WordEncoder) openWord(buf *strings.Builder, charset string)</a>

```
searchKey: mime.WordEncoder.openWord
tags: [method private]
```

```Go
func (e WordEncoder) openWord(buf *strings.Builder, charset string)
```

openWord writes the beginning of an encoded-word into buf. 

#### <a id="WordEncoder.qEncode" href="#WordEncoder.qEncode">func (e WordEncoder) qEncode(buf *strings.Builder, charset, s string)</a>

```
searchKey: mime.WordEncoder.qEncode
tags: [method private]
```

```Go
func (e WordEncoder) qEncode(buf *strings.Builder, charset, s string)
```

qEncode encodes s using Q encoding and writes it to buf. It splits the encoded-words when necessary. 

#### <a id="WordEncoder.splitWord" href="#WordEncoder.splitWord">func (e WordEncoder) splitWord(buf *strings.Builder, charset string)</a>

```
searchKey: mime.WordEncoder.splitWord
tags: [method private]
```

```Go
func (e WordEncoder) splitWord(buf *strings.Builder, charset string)
```

splitWord closes the current encoded-word and opens a new one. 

### <a id="badMediaTypeTest" href="#badMediaTypeTest">type badMediaTypeTest struct</a>

```
searchKey: mime.badMediaTypeTest
tags: [struct private]
```

```Go
type badMediaTypeTest struct {
	in  string
	mt  string
	err string
}
```

### <a id="formatTest" href="#formatTest">type formatTest struct</a>

```
searchKey: mime.formatTest
tags: [struct private]
```

```Go
type formatTest struct {
	typ    string
	params map[string]string
	want   string
}
```

### <a id="mediaTypeTest" href="#mediaTypeTest">type mediaTypeTest struct</a>

```
searchKey: mime.mediaTypeTest
tags: [struct private]
```

```Go
type mediaTypeTest struct {
	in string
	t  string
	p  map[string]string
}
```

## <a id="func" href="#func">Functions</a>

### <a id="AddExtensionType" href="#AddExtensionType">func AddExtensionType(ext, typ string) error</a>

```
searchKey: mime.AddExtensionType
tags: [function]
```

```Go
func AddExtensionType(ext, typ string) error
```

AddExtensionType sets the MIME type associated with the extension ext to typ. The extension should begin with a leading dot, as in ".html". 

### <a id="BenchmarkExtensionsByType" href="#BenchmarkExtensionsByType">func BenchmarkExtensionsByType(b *testing.B)</a>

```
searchKey: mime.BenchmarkExtensionsByType
tags: [function private benchmark]
```

```Go
func BenchmarkExtensionsByType(b *testing.B)
```

### <a id="BenchmarkQDecodeHeader" href="#BenchmarkQDecodeHeader">func BenchmarkQDecodeHeader(b *testing.B)</a>

```
searchKey: mime.BenchmarkQDecodeHeader
tags: [function private benchmark]
```

```Go
func BenchmarkQDecodeHeader(b *testing.B)
```

### <a id="BenchmarkQDecodeWord" href="#BenchmarkQDecodeWord">func BenchmarkQDecodeWord(b *testing.B)</a>

```
searchKey: mime.BenchmarkQDecodeWord
tags: [function private benchmark]
```

```Go
func BenchmarkQDecodeWord(b *testing.B)
```

### <a id="BenchmarkQEncodeWord" href="#BenchmarkQEncodeWord">func BenchmarkQEncodeWord(b *testing.B)</a>

```
searchKey: mime.BenchmarkQEncodeWord
tags: [function private benchmark]
```

```Go
func BenchmarkQEncodeWord(b *testing.B)
```

### <a id="BenchmarkTypeByExtension" href="#BenchmarkTypeByExtension">func BenchmarkTypeByExtension(b *testing.B)</a>

```
searchKey: mime.BenchmarkTypeByExtension
tags: [function private benchmark]
```

```Go
func BenchmarkTypeByExtension(b *testing.B)
```

### <a id="ExtensionsByType" href="#ExtensionsByType">func ExtensionsByType(typ string) ([]string, error)</a>

```
searchKey: mime.ExtensionsByType
tags: [function]
```

```Go
func ExtensionsByType(typ string) ([]string, error)
```

ExtensionsByType returns the extensions known to be associated with the MIME type typ. The returned extensions will each begin with a leading dot, as in ".html". When typ has no associated extensions, ExtensionsByType returns an nil slice. 

### <a id="FormatMediaType" href="#FormatMediaType">func FormatMediaType(t string, param map[string]string) string</a>

```
searchKey: mime.FormatMediaType
tags: [function]
```

```Go
func FormatMediaType(t string, param map[string]string) string
```

FormatMediaType serializes mediatype t and the parameters param as a media type conforming to RFC 2045 and RFC 2616. The type and parameter names are written in lower-case. When any of the arguments result in a standard violation then FormatMediaType returns the empty string. 

### <a id="ParseMediaType" href="#ParseMediaType">func ParseMediaType(v string) (mediatype string, params map[string]string, err error)</a>

```
searchKey: mime.ParseMediaType
tags: [function]
```

```Go
func ParseMediaType(v string) (mediatype string, params map[string]string, err error)
```

ParseMediaType parses a media type value and any optional parameters, per RFC 1521.  Media types are the values in Content-Type and Content-Disposition headers (RFC 2183). On success, ParseMediaType returns the media type converted to lowercase and trimmed of white space and a non-nil map. If there is an error parsing the optional parameter, the media type will be returned along with the error ErrInvalidMediaParameter. The returned map, params, maps from the lowercase attribute to the attribute value with its case preserved. 

### <a id="TestCharsetDecoder" href="#TestCharsetDecoder">func TestCharsetDecoder(t *testing.T)</a>

```
searchKey: mime.TestCharsetDecoder
tags: [function private test]
```

```Go
func TestCharsetDecoder(t *testing.T)
```

### <a id="TestCharsetDecoderError" href="#TestCharsetDecoderError">func TestCharsetDecoderError(t *testing.T)</a>

```
searchKey: mime.TestCharsetDecoderError
tags: [function private test]
```

```Go
func TestCharsetDecoderError(t *testing.T)
```

### <a id="TestConsumeMediaParam" href="#TestConsumeMediaParam">func TestConsumeMediaParam(t *testing.T)</a>

```
searchKey: mime.TestConsumeMediaParam
tags: [function private test]
```

```Go
func TestConsumeMediaParam(t *testing.T)
```

### <a id="TestConsumeToken" href="#TestConsumeToken">func TestConsumeToken(t *testing.T)</a>

```
searchKey: mime.TestConsumeToken
tags: [function private test]
```

```Go
func TestConsumeToken(t *testing.T)
```

### <a id="TestConsumeValue" href="#TestConsumeValue">func TestConsumeValue(t *testing.T)</a>

```
searchKey: mime.TestConsumeValue
tags: [function private test]
```

```Go
func TestConsumeValue(t *testing.T)
```

### <a id="TestDecodeHeader" href="#TestDecodeHeader">func TestDecodeHeader(t *testing.T)</a>

```
searchKey: mime.TestDecodeHeader
tags: [function private test]
```

```Go
func TestDecodeHeader(t *testing.T)
```

### <a id="TestDecodeWord" href="#TestDecodeWord">func TestDecodeWord(t *testing.T)</a>

```
searchKey: mime.TestDecodeWord
tags: [function private test]
```

```Go
func TestDecodeWord(t *testing.T)
```

### <a id="TestEncodeWord" href="#TestEncodeWord">func TestEncodeWord(t *testing.T)</a>

```
searchKey: mime.TestEncodeWord
tags: [function private test]
```

```Go
func TestEncodeWord(t *testing.T)
```

### <a id="TestEncodedWordLength" href="#TestEncodedWordLength">func TestEncodedWordLength(t *testing.T)</a>

```
searchKey: mime.TestEncodedWordLength
tags: [function private test]
```

```Go
func TestEncodedWordLength(t *testing.T)
```

### <a id="TestExtensionsByType" href="#TestExtensionsByType">func TestExtensionsByType(t *testing.T)</a>

```
searchKey: mime.TestExtensionsByType
tags: [function private test]
```

```Go
func TestExtensionsByType(t *testing.T)
```

### <a id="TestExtensionsByType2" href="#TestExtensionsByType2">func TestExtensionsByType2(t *testing.T)</a>

```
searchKey: mime.TestExtensionsByType2
tags: [function private test]
```

```Go
func TestExtensionsByType2(t *testing.T)
```

### <a id="TestFormatMediaType" href="#TestFormatMediaType">func TestFormatMediaType(t *testing.T)</a>

```
searchKey: mime.TestFormatMediaType
tags: [function private test]
```

```Go
func TestFormatMediaType(t *testing.T)
```

### <a id="TestLookupMallocs" href="#TestLookupMallocs">func TestLookupMallocs(t *testing.T)</a>

```
searchKey: mime.TestLookupMallocs
tags: [function private test]
```

```Go
func TestLookupMallocs(t *testing.T)
```

### <a id="TestParseMediaType" href="#TestParseMediaType">func TestParseMediaType(t *testing.T)</a>

```
searchKey: mime.TestParseMediaType
tags: [function private test]
```

```Go
func TestParseMediaType(t *testing.T)
```

### <a id="TestParseMediaTypeBogus" href="#TestParseMediaTypeBogus">func TestParseMediaTypeBogus(t *testing.T)</a>

```
searchKey: mime.TestParseMediaTypeBogus
tags: [function private test]
```

```Go
func TestParseMediaTypeBogus(t *testing.T)
```

### <a id="TestTypeByExtension" href="#TestTypeByExtension">func TestTypeByExtension(t *testing.T)</a>

```
searchKey: mime.TestTypeByExtension
tags: [function private test]
```

```Go
func TestTypeByExtension(t *testing.T)
```

### <a id="TestTypeByExtensionCase" href="#TestTypeByExtensionCase">func TestTypeByExtensionCase(t *testing.T)</a>

```
searchKey: mime.TestTypeByExtensionCase
tags: [function private test]
```

```Go
func TestTypeByExtensionCase(t *testing.T)
```

### <a id="TestTypeByExtensionUNIX" href="#TestTypeByExtensionUNIX">func TestTypeByExtensionUNIX(t *testing.T)</a>

```
searchKey: mime.TestTypeByExtensionUNIX
tags: [function private test]
```

```Go
func TestTypeByExtensionUNIX(t *testing.T)
```

### <a id="TestTypeByExtension_LocalData" href="#TestTypeByExtension_LocalData">func TestTypeByExtension_LocalData(t *testing.T)</a>

```
searchKey: mime.TestTypeByExtension_LocalData
tags: [function private test]
```

```Go
func TestTypeByExtension_LocalData(t *testing.T)
```

### <a id="TypeByExtension" href="#TypeByExtension">func TypeByExtension(ext string) string</a>

```
searchKey: mime.TypeByExtension
tags: [function]
```

```Go
func TypeByExtension(ext string) string
```

TypeByExtension returns the MIME type associated with the file extension ext. The extension ext should begin with a leading dot, as in ".html". When ext has no associated type, TypeByExtension returns "". 

Extensions are looked up first case-sensitively, then case-insensitively. 

The built-in table is small but on unix it is augmented by the local system's MIME-info database or mime.types file(s) if available under one or more of these names: 

```
/usr/local/share/mime/globs2
/usr/share/mime/globs2
/etc/mime.types
/etc/apache2/mime.types
/etc/apache/mime.types

```
On Windows, MIME types are extracted from the registry. 

Text types have the charset parameter set to "utf-8" by default. 

### <a id="checkMediaTypeDisposition" href="#checkMediaTypeDisposition">func checkMediaTypeDisposition(s string) error</a>

```
searchKey: mime.checkMediaTypeDisposition
tags: [function private]
```

```Go
func checkMediaTypeDisposition(s string) error
```

### <a id="clearMimeTypes" href="#clearMimeTypes">func clearMimeTypes()</a>

```
searchKey: mime.clearMimeTypes
tags: [function private]
```

```Go
func clearMimeTypes()
```

### <a id="clearSyncMap" href="#clearSyncMap">func clearSyncMap(m *sync.Map)</a>

```
searchKey: mime.clearSyncMap
tags: [function private]
```

```Go
func clearSyncMap(m *sync.Map)
```

### <a id="closeWord" href="#closeWord">func closeWord(buf *strings.Builder)</a>

```
searchKey: mime.closeWord
tags: [function private]
```

```Go
func closeWord(buf *strings.Builder)
```

closeWord writes the end of an encoded-word into buf. 

### <a id="consumeMediaParam" href="#consumeMediaParam">func consumeMediaParam(v string) (param, value, rest string)</a>

```
searchKey: mime.consumeMediaParam
tags: [function private]
```

```Go
func consumeMediaParam(v string) (param, value, rest string)
```

### <a id="consumeToken" href="#consumeToken">func consumeToken(v string) (token, rest string)</a>

```
searchKey: mime.consumeToken
tags: [function private]
```

```Go
func consumeToken(v string) (token, rest string)
```

consumeToken consumes a token from the beginning of provided string, per RFC 2045 section 5.1 (referenced from 2183), and return the token consumed and the rest of the string. Returns ("", v) on failure to consume at least one character. 

### <a id="consumeValue" href="#consumeValue">func consumeValue(v string) (value, rest string)</a>

```
searchKey: mime.consumeValue
tags: [function private]
```

```Go
func consumeValue(v string) (value, rest string)
```

consumeValue consumes a "value" per RFC 2045, where a value is either a 'token' or a 'quoted-string'.  On success, consumeValue returns the value consumed (and de-quoted/escaped, if a quoted-string) and the rest of the string. On failure, returns ("", v). 

### <a id="decode" href="#decode">func decode(encoding byte, text string) ([]byte, error)</a>

```
searchKey: mime.decode
tags: [function private]
```

```Go
func decode(encoding byte, text string) ([]byte, error)
```

### <a id="decode2231Enc" href="#decode2231Enc">func decode2231Enc(v string) (string, bool)</a>

```
searchKey: mime.decode2231Enc
tags: [function private]
```

```Go
func decode2231Enc(v string) (string, bool)
```

### <a id="fromHex" href="#fromHex">func fromHex(b byte) (byte, error)</a>

```
searchKey: mime.fromHex
tags: [function private]
```

```Go
func fromHex(b byte) (byte, error)
```

### <a id="hasNonWhitespace" href="#hasNonWhitespace">func hasNonWhitespace(s string) bool</a>

```
searchKey: mime.hasNonWhitespace
tags: [function private]
```

```Go
func hasNonWhitespace(s string) bool
```

hasNonWhitespace reports whether s (assumed to be ASCII) contains at least one byte of non-whitespace. 

### <a id="init.type_unix.go" href="#init.type_unix.go">func init()</a>

```
searchKey: mime.init
tags: [function private]
```

```Go
func init()
```

### <a id="initMime" href="#initMime">func initMime()</a>

```
searchKey: mime.initMime
tags: [function private]
```

```Go
func initMime()
```

### <a id="initMimeForTests" href="#initMimeForTests">func initMimeForTests() map[string]string</a>

```
searchKey: mime.initMimeForTests
tags: [function private]
```

```Go
func initMimeForTests() map[string]string
```

### <a id="initMimeUnix" href="#initMimeUnix">func initMimeUnix()</a>

```
searchKey: mime.initMimeUnix
tags: [function private]
```

```Go
func initMimeUnix()
```

### <a id="initMimeUnixTest" href="#initMimeUnixTest">func initMimeUnixTest(t *testing.T)</a>

```
searchKey: mime.initMimeUnixTest
tags: [function private]
```

```Go
func initMimeUnixTest(t *testing.T)
```

### <a id="isNotTokenChar" href="#isNotTokenChar">func isNotTokenChar(r rune) bool</a>

```
searchKey: mime.isNotTokenChar
tags: [function private]
```

```Go
func isNotTokenChar(r rune) bool
```

### <a id="isTSpecial" href="#isTSpecial">func isTSpecial(r rune) bool</a>

```
searchKey: mime.isTSpecial
tags: [function private]
```

```Go
func isTSpecial(r rune) bool
```

isTSpecial reports whether rune is in 'tspecials' as defined by RFC 1521 and RFC 2045. 

### <a id="isToken" href="#isToken">func isToken(s string) bool</a>

```
searchKey: mime.isToken
tags: [function private]
```

```Go
func isToken(s string) bool
```

isToken reports whether s is a 'token' as defined by RFC 1521 and RFC 2045. 

### <a id="isTokenChar" href="#isTokenChar">func isTokenChar(r rune) bool</a>

```
searchKey: mime.isTokenChar
tags: [function private]
```

```Go
func isTokenChar(r rune) bool
```

isTokenChar reports whether rune is in 'token' as defined by RFC 1521 and RFC 2045. 

### <a id="isUTF8" href="#isUTF8">func isUTF8(charset string) bool</a>

```
searchKey: mime.isUTF8
tags: [function private]
```

```Go
func isUTF8(charset string) bool
```

### <a id="ishex" href="#ishex">func ishex(c byte) bool</a>

```
searchKey: mime.ishex
tags: [function private]
```

```Go
func ishex(c byte) bool
```

### <a id="loadMimeFile" href="#loadMimeFile">func loadMimeFile(filename string)</a>

```
searchKey: mime.loadMimeFile
tags: [function private]
```

```Go
func loadMimeFile(filename string)
```

### <a id="loadMimeGlobsFile" href="#loadMimeGlobsFile">func loadMimeGlobsFile(filename string) error</a>

```
searchKey: mime.loadMimeGlobsFile
tags: [function private]
```

```Go
func loadMimeGlobsFile(filename string) error
```

### <a id="needsEncoding" href="#needsEncoding">func needsEncoding(s string) bool</a>

```
searchKey: mime.needsEncoding
tags: [function private]
```

```Go
func needsEncoding(s string) bool
```

### <a id="percentHexUnescape" href="#percentHexUnescape">func percentHexUnescape(s string) (string, error)</a>

```
searchKey: mime.percentHexUnescape
tags: [function private]
```

```Go
func percentHexUnescape(s string) (string, error)
```

### <a id="qDecode" href="#qDecode">func qDecode(s string) ([]byte, error)</a>

```
searchKey: mime.qDecode
tags: [function private]
```

```Go
func qDecode(s string) ([]byte, error)
```

qDecode decodes a Q encoded string. 

### <a id="readHexByte" href="#readHexByte">func readHexByte(a, b byte) (byte, error)</a>

```
searchKey: mime.readHexByte
tags: [function private]
```

```Go
func readHexByte(a, b byte) (byte, error)
```

readHexByte returns the byte from its quoted-printable representation. 

### <a id="setExtensionType" href="#setExtensionType">func setExtensionType(extension, mimeType string) error</a>

```
searchKey: mime.setExtensionType
tags: [function private]
```

```Go
func setExtensionType(extension, mimeType string) error
```

### <a id="setMimeInit" href="#setMimeInit">func setMimeInit(fn func()) (cleanup func())</a>

```
searchKey: mime.setMimeInit
tags: [function private]
```

```Go
func setMimeInit(fn func()) (cleanup func())
```

### <a id="setMimeTypes" href="#setMimeTypes">func setMimeTypes(lowerExt, mixExt map[string]string)</a>

```
searchKey: mime.setMimeTypes
tags: [function private]
```

```Go
func setMimeTypes(lowerExt, mixExt map[string]string)
```

setMimeTypes is used by initMime's non-test path, and by tests. 

### <a id="setType" href="#setType">func setType(ext, typ string)</a>

```
searchKey: mime.setType
tags: [function private]
```

```Go
func setType(ext, typ string)
```

### <a id="unhex" href="#unhex">func unhex(c byte) byte</a>

```
searchKey: mime.unhex
tags: [function private]
```

```Go
func unhex(c byte) byte
```

### <a id="writeQString" href="#writeQString">func writeQString(buf *strings.Builder, s string)</a>

```
searchKey: mime.writeQString
tags: [function private]
```

```Go
func writeQString(buf *strings.Builder, s string)
```

writeQString encodes s using Q encoding and writes it to buf. 

