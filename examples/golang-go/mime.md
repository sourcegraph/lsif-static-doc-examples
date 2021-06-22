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
    * [const maxEncodedWordLen](#maxEncodedWordLen)
    * [const maxContentLen](#maxContentLen)
    * [const upperhex](#upperhex)
* [Variables](#var)
    * [var errInvalidWord](#errInvalidWord)
    * [var maxBase64Len](#maxBase64Len)
    * [var ErrInvalidMediaParameter](#ErrInvalidMediaParameter)
    * [var mimeTypes](#mimeTypes)
    * [var mimeTypesLower](#mimeTypesLower)
    * [var extensionsMu](#extensionsMu)
    * [var extensions](#extensions)
    * [var builtinTypesLower](#builtinTypesLower)
    * [var once](#once)
    * [var testInitMime](#testInitMime)
    * [var osInitMime](#osInitMime)
    * [var mimeGlobs](#mimeGlobs)
    * [var typeFiles](#typeFiles)
    * [var badMediaTypeTests](#badMediaTypeTests)
    * [var formatTests](#formatTests)
* [Types](#type)
    * [type WordEncoder byte](#WordEncoder)
        * [func (e WordEncoder) Encode(charset, s string) string](#WordEncoder.Encode)
        * [func (e WordEncoder) encodeWord(charset, s string) string](#WordEncoder.encodeWord)
        * [func (e WordEncoder) bEncode(buf *strings.Builder, charset, s string)](#WordEncoder.bEncode)
        * [func (e WordEncoder) qEncode(buf *strings.Builder, charset, s string)](#WordEncoder.qEncode)
        * [func (e WordEncoder) openWord(buf *strings.Builder, charset string)](#WordEncoder.openWord)
        * [func (e WordEncoder) splitWord(buf *strings.Builder, charset string)](#WordEncoder.splitWord)
    * [type WordDecoder struct](#WordDecoder)
        * [func (d *WordDecoder) Decode(word string) (string, error)](#WordDecoder.Decode)
        * [func (d *WordDecoder) DecodeHeader(header string) (string, error)](#WordDecoder.DecodeHeader)
        * [func (d *WordDecoder) convert(buf *strings.Builder, charset string, content []byte) error](#WordDecoder.convert)
    * [type mediaTypeTest struct](#mediaTypeTest)
    * [type badMediaTypeTest struct](#badMediaTypeTest)
    * [type formatTest struct](#formatTest)
* [Functions](#func)
    * [func needsEncoding(s string) bool](#needsEncoding)
    * [func writeQString(buf *strings.Builder, s string)](#writeQString)
    * [func closeWord(buf *strings.Builder)](#closeWord)
    * [func isUTF8(charset string) bool](#isUTF8)
    * [func decode(encoding byte, text string) ([]byte, error)](#decode)
    * [func hasNonWhitespace(s string) bool](#hasNonWhitespace)
    * [func qDecode(s string) ([]byte, error)](#qDecode)
    * [func readHexByte(a, b byte) (byte, error)](#readHexByte)
    * [func fromHex(b byte) (byte, error)](#fromHex)
    * [func isTSpecial(r rune) bool](#isTSpecial)
    * [func isTokenChar(r rune) bool](#isTokenChar)
    * [func isToken(s string) bool](#isToken)
    * [func FormatMediaType(t string, param map[string]string) string](#FormatMediaType)
    * [func checkMediaTypeDisposition(s string) error](#checkMediaTypeDisposition)
    * [func ParseMediaType(v string) (mediatype string, params map[string]string, err error)](#ParseMediaType)
    * [func decode2231Enc(v string) (string, bool)](#decode2231Enc)
    * [func isNotTokenChar(r rune) bool](#isNotTokenChar)
    * [func consumeToken(v string) (token, rest string)](#consumeToken)
    * [func consumeValue(v string) (value, rest string)](#consumeValue)
    * [func consumeMediaParam(v string) (param, value, rest string)](#consumeMediaParam)
    * [func percentHexUnescape(s string) (string, error)](#percentHexUnescape)
    * [func ishex(c byte) bool](#ishex)
    * [func unhex(c byte) byte](#unhex)
    * [func clearSyncMap(m *sync.Map)](#clearSyncMap)
    * [func setMimeTypes(lowerExt, mixExt map[string]string)](#setMimeTypes)
    * [func initMime()](#initMime)
    * [func TypeByExtension(ext string) string](#TypeByExtension)
    * [func ExtensionsByType(typ string) ([]string, error)](#ExtensionsByType)
    * [func AddExtensionType(ext, typ string) error](#AddExtensionType)
    * [func setExtensionType(extension, mimeType string) error](#setExtensionType)
    * [func init()](#init)
    * [func loadMimeGlobsFile(filename string) error](#loadMimeGlobsFile)
    * [func loadMimeFile(filename string)](#loadMimeFile)
    * [func initMimeUnix()](#initMimeUnix)
    * [func initMimeForTests() map[string]string](#initMimeForTests)
    * [func TestEncodeWord(t *testing.T)](#TestEncodeWord)
    * [func TestEncodedWordLength(t *testing.T)](#TestEncodedWordLength)
    * [func TestDecodeWord(t *testing.T)](#TestDecodeWord)
    * [func TestDecodeHeader(t *testing.T)](#TestDecodeHeader)
    * [func TestCharsetDecoder(t *testing.T)](#TestCharsetDecoder)
    * [func TestCharsetDecoderError(t *testing.T)](#TestCharsetDecoderError)
    * [func BenchmarkQEncodeWord(b *testing.B)](#BenchmarkQEncodeWord)
    * [func BenchmarkQDecodeWord(b *testing.B)](#BenchmarkQDecodeWord)
    * [func BenchmarkQDecodeHeader(b *testing.B)](#BenchmarkQDecodeHeader)
    * [func TestConsumeToken(t *testing.T)](#TestConsumeToken)
    * [func TestConsumeValue(t *testing.T)](#TestConsumeValue)
    * [func TestConsumeMediaParam(t *testing.T)](#TestConsumeMediaParam)
    * [func TestParseMediaType(t *testing.T)](#TestParseMediaType)
    * [func TestParseMediaTypeBogus(t *testing.T)](#TestParseMediaTypeBogus)
    * [func TestFormatMediaType(t *testing.T)](#TestFormatMediaType)
    * [func setMimeInit(fn func()) (cleanup func())](#setMimeInit)
    * [func clearMimeTypes()](#clearMimeTypes)
    * [func setType(ext, typ string)](#setType)
    * [func TestTypeByExtension(t *testing.T)](#TestTypeByExtension)
    * [func TestTypeByExtension_LocalData(t *testing.T)](#TestTypeByExtension_LocalData)
    * [func TestTypeByExtensionCase(t *testing.T)](#TestTypeByExtensionCase)
    * [func TestExtensionsByType(t *testing.T)](#TestExtensionsByType)
    * [func TestLookupMallocs(t *testing.T)](#TestLookupMallocs)
    * [func BenchmarkTypeByExtension(b *testing.B)](#BenchmarkTypeByExtension)
    * [func BenchmarkExtensionsByType(b *testing.B)](#BenchmarkExtensionsByType)
    * [func TestExtensionsByType2(t *testing.T)](#TestExtensionsByType2)
    * [func initMimeUnixTest(t *testing.T)](#initMimeUnixTest)
    * [func TestTypeByExtensionUNIX(t *testing.T)](#TestTypeByExtensionUNIX)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="BEncoding" href="#BEncoding">const BEncoding</a>

```
searchKey: mime.BEncoding
tags: [exported]
```

```Go
const BEncoding = WordEncoder('b')
```

BEncoding represents Base64 encoding scheme as defined by RFC 2045. 

### <a id="QEncoding" href="#QEncoding">const QEncoding</a>

```
searchKey: mime.QEncoding
tags: [exported]
```

```Go
const QEncoding = WordEncoder('q')
```

QEncoding represents the Q-encoding scheme as defined by RFC 2047. 

### <a id="maxEncodedWordLen" href="#maxEncodedWordLen">const maxEncodedWordLen</a>

```
searchKey: mime.maxEncodedWordLen
```

```Go
const maxEncodedWordLen = 75
```

The maximum length of an encoded-word is 75 characters. See RFC 2047, section 2. 

### <a id="maxContentLen" href="#maxContentLen">const maxContentLen</a>

```
searchKey: mime.maxContentLen
```

```Go
const maxContentLen = maxEncodedWordLen - len("=?UTF-8?q?") - len("?=")
```

maxContentLen is how much content can be encoded, ignoring the header and 2-byte footer. 

### <a id="upperhex" href="#upperhex">const upperhex</a>

```
searchKey: mime.upperhex
```

```Go
const upperhex = "0123456789ABCDEF"
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="errInvalidWord" href="#errInvalidWord">var errInvalidWord</a>

```
searchKey: mime.errInvalidWord
```

```Go
var errInvalidWord = errors.New("mime: invalid RFC 2047 encoded-word")
```

### <a id="maxBase64Len" href="#maxBase64Len">var maxBase64Len</a>

```
searchKey: mime.maxBase64Len
```

```Go
var maxBase64Len = base64.StdEncoding.DecodedLen(maxContentLen)
```

### <a id="ErrInvalidMediaParameter" href="#ErrInvalidMediaParameter">var ErrInvalidMediaParameter</a>

```
searchKey: mime.ErrInvalidMediaParameter
tags: [exported]
```

```Go
var ErrInvalidMediaParameter = errors.New("mime: invalid media parameter")
```

ErrInvalidMediaParameter is returned by ParseMediaType if the media type value was found but there was an error parsing the optional parameters 

### <a id="mimeTypes" href="#mimeTypes">var mimeTypes</a>

```
searchKey: mime.mimeTypes
```

```Go
var mimeTypes sync.Map // map[string]string; ".Z" => "application/x-compress"

```

### <a id="mimeTypesLower" href="#mimeTypesLower">var mimeTypesLower</a>

```
searchKey: mime.mimeTypesLower
```

```Go
var mimeTypesLower sync.Map // map[string]string; ".z" => "application/x-compress"

```

### <a id="extensionsMu" href="#extensionsMu">var extensionsMu</a>

```
searchKey: mime.extensionsMu
```

```Go
var extensionsMu sync.Mutex // Guards stores (but not loads) on extensions.

```

extensions maps from MIME type to list of lowercase file extensions: "image/jpeg" => [".jpg", ".jpeg"] 

### <a id="extensions" href="#extensions">var extensions</a>

```
searchKey: mime.extensions
```

```Go
var extensions sync.Map // map[string][]string; slice values are append-only.

```

### <a id="builtinTypesLower" href="#builtinTypesLower">var builtinTypesLower</a>

```
searchKey: mime.builtinTypesLower
```

```Go
var builtinTypesLower = ...
```

### <a id="once" href="#once">var once</a>

```
searchKey: mime.once
```

```Go
var once sync.Once // guards initMime

```

### <a id="testInitMime" href="#testInitMime">var testInitMime</a>

```
searchKey: mime.testInitMime
```

```Go
var testInitMime, osInitMime func()
```

### <a id="osInitMime" href="#osInitMime">var osInitMime</a>

```
searchKey: mime.osInitMime
```

```Go
var testInitMime, osInitMime func()
```

### <a id="mimeGlobs" href="#mimeGlobs">var mimeGlobs</a>

```
searchKey: mime.mimeGlobs
```

```Go
var mimeGlobs = []string{
	"/usr/local/share/mime/globs2",
	"/usr/share/mime/globs2",
}
```

See [https://specifications.freedesktop.org/shared-mime-info-spec/shared-mime-info-spec-0.21.html](https://specifications.freedesktop.org/shared-mime-info-spec/shared-mime-info-spec-0.21.html) for the FreeDesktop Shared MIME-info Database specification. 

### <a id="typeFiles" href="#typeFiles">var typeFiles</a>

```
searchKey: mime.typeFiles
```

```Go
var typeFiles = ...
```

Common locations for mime.types files on unix. 

### <a id="badMediaTypeTests" href="#badMediaTypeTests">var badMediaTypeTests</a>

```
searchKey: mime.badMediaTypeTests
```

```Go
var badMediaTypeTests = ...
```

### <a id="formatTests" href="#formatTests">var formatTests</a>

```
searchKey: mime.formatTests
```

```Go
var formatTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="WordEncoder" href="#WordEncoder">type WordEncoder byte</a>

```
searchKey: mime.WordEncoder
tags: [exported]
```

```Go
type WordEncoder byte
```

A WordEncoder is an RFC 2047 encoded-word encoder. 

#### <a id="WordEncoder.Encode" href="#WordEncoder.Encode">func (e WordEncoder) Encode(charset, s string) string</a>

```
searchKey: mime.WordEncoder.Encode
tags: [exported]
```

```Go
func (e WordEncoder) Encode(charset, s string) string
```

Encode returns the encoded-word form of s. If s is ASCII without special characters, it is returned unchanged. The provided charset is the IANA charset name of s. It is case insensitive. 

#### <a id="WordEncoder.encodeWord" href="#WordEncoder.encodeWord">func (e WordEncoder) encodeWord(charset, s string) string</a>

```
searchKey: mime.WordEncoder.encodeWord
```

```Go
func (e WordEncoder) encodeWord(charset, s string) string
```

encodeWord encodes a string into an encoded-word. 

#### <a id="WordEncoder.bEncode" href="#WordEncoder.bEncode">func (e WordEncoder) bEncode(buf *strings.Builder, charset, s string)</a>

```
searchKey: mime.WordEncoder.bEncode
```

```Go
func (e WordEncoder) bEncode(buf *strings.Builder, charset, s string)
```

bEncode encodes s using base64 encoding and writes it to buf. 

#### <a id="WordEncoder.qEncode" href="#WordEncoder.qEncode">func (e WordEncoder) qEncode(buf *strings.Builder, charset, s string)</a>

```
searchKey: mime.WordEncoder.qEncode
```

```Go
func (e WordEncoder) qEncode(buf *strings.Builder, charset, s string)
```

qEncode encodes s using Q encoding and writes it to buf. It splits the encoded-words when necessary. 

#### <a id="WordEncoder.openWord" href="#WordEncoder.openWord">func (e WordEncoder) openWord(buf *strings.Builder, charset string)</a>

```
searchKey: mime.WordEncoder.openWord
```

```Go
func (e WordEncoder) openWord(buf *strings.Builder, charset string)
```

openWord writes the beginning of an encoded-word into buf. 

#### <a id="WordEncoder.splitWord" href="#WordEncoder.splitWord">func (e WordEncoder) splitWord(buf *strings.Builder, charset string)</a>

```
searchKey: mime.WordEncoder.splitWord
```

```Go
func (e WordEncoder) splitWord(buf *strings.Builder, charset string)
```

splitWord closes the current encoded-word and opens a new one. 

### <a id="WordDecoder" href="#WordDecoder">type WordDecoder struct</a>

```
searchKey: mime.WordDecoder
tags: [exported]
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
tags: [exported]
```

```Go
func (d *WordDecoder) Decode(word string) (string, error)
```

Decode decodes an RFC 2047 encoded-word. 

#### <a id="WordDecoder.DecodeHeader" href="#WordDecoder.DecodeHeader">func (d *WordDecoder) DecodeHeader(header string) (string, error)</a>

```
searchKey: mime.WordDecoder.DecodeHeader
tags: [exported]
```

```Go
func (d *WordDecoder) DecodeHeader(header string) (string, error)
```

DecodeHeader decodes all encoded-words of the given string. It returns an error if and only if CharsetReader of d returns an error. 

#### <a id="WordDecoder.convert" href="#WordDecoder.convert">func (d *WordDecoder) convert(buf *strings.Builder, charset string, content []byte) error</a>

```
searchKey: mime.WordDecoder.convert
```

```Go
func (d *WordDecoder) convert(buf *strings.Builder, charset string, content []byte) error
```

### <a id="mediaTypeTest" href="#mediaTypeTest">type mediaTypeTest struct</a>

```
searchKey: mime.mediaTypeTest
```

```Go
type mediaTypeTest struct {
	in string
	t  string
	p  map[string]string
}
```

### <a id="badMediaTypeTest" href="#badMediaTypeTest">type badMediaTypeTest struct</a>

```
searchKey: mime.badMediaTypeTest
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
```

```Go
type formatTest struct {
	typ    string
	params map[string]string
	want   string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="needsEncoding" href="#needsEncoding">func needsEncoding(s string) bool</a>

```
searchKey: mime.needsEncoding
```

```Go
func needsEncoding(s string) bool
```

### <a id="writeQString" href="#writeQString">func writeQString(buf *strings.Builder, s string)</a>

```
searchKey: mime.writeQString
```

```Go
func writeQString(buf *strings.Builder, s string)
```

writeQString encodes s using Q encoding and writes it to buf. 

### <a id="closeWord" href="#closeWord">func closeWord(buf *strings.Builder)</a>

```
searchKey: mime.closeWord
```

```Go
func closeWord(buf *strings.Builder)
```

closeWord writes the end of an encoded-word into buf. 

### <a id="isUTF8" href="#isUTF8">func isUTF8(charset string) bool</a>

```
searchKey: mime.isUTF8
```

```Go
func isUTF8(charset string) bool
```

### <a id="decode" href="#decode">func decode(encoding byte, text string) ([]byte, error)</a>

```
searchKey: mime.decode
```

```Go
func decode(encoding byte, text string) ([]byte, error)
```

### <a id="hasNonWhitespace" href="#hasNonWhitespace">func hasNonWhitespace(s string) bool</a>

```
searchKey: mime.hasNonWhitespace
```

```Go
func hasNonWhitespace(s string) bool
```

hasNonWhitespace reports whether s (assumed to be ASCII) contains at least one byte of non-whitespace. 

### <a id="qDecode" href="#qDecode">func qDecode(s string) ([]byte, error)</a>

```
searchKey: mime.qDecode
```

```Go
func qDecode(s string) ([]byte, error)
```

qDecode decodes a Q encoded string. 

### <a id="readHexByte" href="#readHexByte">func readHexByte(a, b byte) (byte, error)</a>

```
searchKey: mime.readHexByte
```

```Go
func readHexByte(a, b byte) (byte, error)
```

readHexByte returns the byte from its quoted-printable representation. 

### <a id="fromHex" href="#fromHex">func fromHex(b byte) (byte, error)</a>

```
searchKey: mime.fromHex
```

```Go
func fromHex(b byte) (byte, error)
```

### <a id="isTSpecial" href="#isTSpecial">func isTSpecial(r rune) bool</a>

```
searchKey: mime.isTSpecial
```

```Go
func isTSpecial(r rune) bool
```

isTSpecial reports whether rune is in 'tspecials' as defined by RFC 1521 and RFC 2045. 

### <a id="isTokenChar" href="#isTokenChar">func isTokenChar(r rune) bool</a>

```
searchKey: mime.isTokenChar
```

```Go
func isTokenChar(r rune) bool
```

isTokenChar reports whether rune is in 'token' as defined by RFC 1521 and RFC 2045. 

### <a id="isToken" href="#isToken">func isToken(s string) bool</a>

```
searchKey: mime.isToken
```

```Go
func isToken(s string) bool
```

isToken reports whether s is a 'token' as defined by RFC 1521 and RFC 2045. 

### <a id="FormatMediaType" href="#FormatMediaType">func FormatMediaType(t string, param map[string]string) string</a>

```
searchKey: mime.FormatMediaType
tags: [exported]
```

```Go
func FormatMediaType(t string, param map[string]string) string
```

FormatMediaType serializes mediatype t and the parameters param as a media type conforming to RFC 2045 and RFC 2616. The type and parameter names are written in lower-case. When any of the arguments result in a standard violation then FormatMediaType returns the empty string. 

### <a id="checkMediaTypeDisposition" href="#checkMediaTypeDisposition">func checkMediaTypeDisposition(s string) error</a>

```
searchKey: mime.checkMediaTypeDisposition
```

```Go
func checkMediaTypeDisposition(s string) error
```

### <a id="ParseMediaType" href="#ParseMediaType">func ParseMediaType(v string) (mediatype string, params map[string]string, err error)</a>

```
searchKey: mime.ParseMediaType
tags: [exported]
```

```Go
func ParseMediaType(v string) (mediatype string, params map[string]string, err error)
```

ParseMediaType parses a media type value and any optional parameters, per RFC 1521.  Media types are the values in Content-Type and Content-Disposition headers (RFC 2183). On success, ParseMediaType returns the media type converted to lowercase and trimmed of white space and a non-nil map. If there is an error parsing the optional parameter, the media type will be returned along with the error ErrInvalidMediaParameter. The returned map, params, maps from the lowercase attribute to the attribute value with its case preserved. 

### <a id="decode2231Enc" href="#decode2231Enc">func decode2231Enc(v string) (string, bool)</a>

```
searchKey: mime.decode2231Enc
```

```Go
func decode2231Enc(v string) (string, bool)
```

### <a id="isNotTokenChar" href="#isNotTokenChar">func isNotTokenChar(r rune) bool</a>

```
searchKey: mime.isNotTokenChar
```

```Go
func isNotTokenChar(r rune) bool
```

### <a id="consumeToken" href="#consumeToken">func consumeToken(v string) (token, rest string)</a>

```
searchKey: mime.consumeToken
```

```Go
func consumeToken(v string) (token, rest string)
```

consumeToken consumes a token from the beginning of provided string, per RFC 2045 section 5.1 (referenced from 2183), and return the token consumed and the rest of the string. Returns ("", v) on failure to consume at least one character. 

### <a id="consumeValue" href="#consumeValue">func consumeValue(v string) (value, rest string)</a>

```
searchKey: mime.consumeValue
```

```Go
func consumeValue(v string) (value, rest string)
```

consumeValue consumes a "value" per RFC 2045, where a value is either a 'token' or a 'quoted-string'.  On success, consumeValue returns the value consumed (and de-quoted/escaped, if a quoted-string) and the rest of the string. On failure, returns ("", v). 

### <a id="consumeMediaParam" href="#consumeMediaParam">func consumeMediaParam(v string) (param, value, rest string)</a>

```
searchKey: mime.consumeMediaParam
```

```Go
func consumeMediaParam(v string) (param, value, rest string)
```

### <a id="percentHexUnescape" href="#percentHexUnescape">func percentHexUnescape(s string) (string, error)</a>

```
searchKey: mime.percentHexUnescape
```

```Go
func percentHexUnescape(s string) (string, error)
```

### <a id="ishex" href="#ishex">func ishex(c byte) bool</a>

```
searchKey: mime.ishex
```

```Go
func ishex(c byte) bool
```

### <a id="unhex" href="#unhex">func unhex(c byte) byte</a>

```
searchKey: mime.unhex
```

```Go
func unhex(c byte) byte
```

### <a id="clearSyncMap" href="#clearSyncMap">func clearSyncMap(m *sync.Map)</a>

```
searchKey: mime.clearSyncMap
```

```Go
func clearSyncMap(m *sync.Map)
```

### <a id="setMimeTypes" href="#setMimeTypes">func setMimeTypes(lowerExt, mixExt map[string]string)</a>

```
searchKey: mime.setMimeTypes
```

```Go
func setMimeTypes(lowerExt, mixExt map[string]string)
```

setMimeTypes is used by initMime's non-test path, and by tests. 

### <a id="initMime" href="#initMime">func initMime()</a>

```
searchKey: mime.initMime
```

```Go
func initMime()
```

### <a id="TypeByExtension" href="#TypeByExtension">func TypeByExtension(ext string) string</a>

```
searchKey: mime.TypeByExtension
tags: [exported]
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

### <a id="ExtensionsByType" href="#ExtensionsByType">func ExtensionsByType(typ string) ([]string, error)</a>

```
searchKey: mime.ExtensionsByType
tags: [exported]
```

```Go
func ExtensionsByType(typ string) ([]string, error)
```

ExtensionsByType returns the extensions known to be associated with the MIME type typ. The returned extensions will each begin with a leading dot, as in ".html". When typ has no associated extensions, ExtensionsByType returns an nil slice. 

### <a id="AddExtensionType" href="#AddExtensionType">func AddExtensionType(ext, typ string) error</a>

```
searchKey: mime.AddExtensionType
tags: [exported]
```

```Go
func AddExtensionType(ext, typ string) error
```

AddExtensionType sets the MIME type associated with the extension ext to typ. The extension should begin with a leading dot, as in ".html". 

### <a id="setExtensionType" href="#setExtensionType">func setExtensionType(extension, mimeType string) error</a>

```
searchKey: mime.setExtensionType
```

```Go
func setExtensionType(extension, mimeType string) error
```

### <a id="init" href="#init">func init()</a>

```
searchKey: mime.init
```

```Go
func init()
```

### <a id="loadMimeGlobsFile" href="#loadMimeGlobsFile">func loadMimeGlobsFile(filename string) error</a>

```
searchKey: mime.loadMimeGlobsFile
```

```Go
func loadMimeGlobsFile(filename string) error
```

### <a id="loadMimeFile" href="#loadMimeFile">func loadMimeFile(filename string)</a>

```
searchKey: mime.loadMimeFile
```

```Go
func loadMimeFile(filename string)
```

### <a id="initMimeUnix" href="#initMimeUnix">func initMimeUnix()</a>

```
searchKey: mime.initMimeUnix
```

```Go
func initMimeUnix()
```

### <a id="initMimeForTests" href="#initMimeForTests">func initMimeForTests() map[string]string</a>

```
searchKey: mime.initMimeForTests
```

```Go
func initMimeForTests() map[string]string
```

### <a id="TestEncodeWord" href="#TestEncodeWord">func TestEncodeWord(t *testing.T)</a>

```
searchKey: mime.TestEncodeWord
```

```Go
func TestEncodeWord(t *testing.T)
```

### <a id="TestEncodedWordLength" href="#TestEncodedWordLength">func TestEncodedWordLength(t *testing.T)</a>

```
searchKey: mime.TestEncodedWordLength
```

```Go
func TestEncodedWordLength(t *testing.T)
```

### <a id="TestDecodeWord" href="#TestDecodeWord">func TestDecodeWord(t *testing.T)</a>

```
searchKey: mime.TestDecodeWord
```

```Go
func TestDecodeWord(t *testing.T)
```

### <a id="TestDecodeHeader" href="#TestDecodeHeader">func TestDecodeHeader(t *testing.T)</a>

```
searchKey: mime.TestDecodeHeader
```

```Go
func TestDecodeHeader(t *testing.T)
```

### <a id="TestCharsetDecoder" href="#TestCharsetDecoder">func TestCharsetDecoder(t *testing.T)</a>

```
searchKey: mime.TestCharsetDecoder
```

```Go
func TestCharsetDecoder(t *testing.T)
```

### <a id="TestCharsetDecoderError" href="#TestCharsetDecoderError">func TestCharsetDecoderError(t *testing.T)</a>

```
searchKey: mime.TestCharsetDecoderError
```

```Go
func TestCharsetDecoderError(t *testing.T)
```

### <a id="BenchmarkQEncodeWord" href="#BenchmarkQEncodeWord">func BenchmarkQEncodeWord(b *testing.B)</a>

```
searchKey: mime.BenchmarkQEncodeWord
```

```Go
func BenchmarkQEncodeWord(b *testing.B)
```

### <a id="BenchmarkQDecodeWord" href="#BenchmarkQDecodeWord">func BenchmarkQDecodeWord(b *testing.B)</a>

```
searchKey: mime.BenchmarkQDecodeWord
```

```Go
func BenchmarkQDecodeWord(b *testing.B)
```

### <a id="BenchmarkQDecodeHeader" href="#BenchmarkQDecodeHeader">func BenchmarkQDecodeHeader(b *testing.B)</a>

```
searchKey: mime.BenchmarkQDecodeHeader
```

```Go
func BenchmarkQDecodeHeader(b *testing.B)
```

### <a id="TestConsumeToken" href="#TestConsumeToken">func TestConsumeToken(t *testing.T)</a>

```
searchKey: mime.TestConsumeToken
```

```Go
func TestConsumeToken(t *testing.T)
```

### <a id="TestConsumeValue" href="#TestConsumeValue">func TestConsumeValue(t *testing.T)</a>

```
searchKey: mime.TestConsumeValue
```

```Go
func TestConsumeValue(t *testing.T)
```

### <a id="TestConsumeMediaParam" href="#TestConsumeMediaParam">func TestConsumeMediaParam(t *testing.T)</a>

```
searchKey: mime.TestConsumeMediaParam
```

```Go
func TestConsumeMediaParam(t *testing.T)
```

### <a id="TestParseMediaType" href="#TestParseMediaType">func TestParseMediaType(t *testing.T)</a>

```
searchKey: mime.TestParseMediaType
```

```Go
func TestParseMediaType(t *testing.T)
```

### <a id="TestParseMediaTypeBogus" href="#TestParseMediaTypeBogus">func TestParseMediaTypeBogus(t *testing.T)</a>

```
searchKey: mime.TestParseMediaTypeBogus
```

```Go
func TestParseMediaTypeBogus(t *testing.T)
```

### <a id="TestFormatMediaType" href="#TestFormatMediaType">func TestFormatMediaType(t *testing.T)</a>

```
searchKey: mime.TestFormatMediaType
```

```Go
func TestFormatMediaType(t *testing.T)
```

### <a id="setMimeInit" href="#setMimeInit">func setMimeInit(fn func()) (cleanup func())</a>

```
searchKey: mime.setMimeInit
```

```Go
func setMimeInit(fn func()) (cleanup func())
```

### <a id="clearMimeTypes" href="#clearMimeTypes">func clearMimeTypes()</a>

```
searchKey: mime.clearMimeTypes
```

```Go
func clearMimeTypes()
```

### <a id="setType" href="#setType">func setType(ext, typ string)</a>

```
searchKey: mime.setType
```

```Go
func setType(ext, typ string)
```

### <a id="TestTypeByExtension" href="#TestTypeByExtension">func TestTypeByExtension(t *testing.T)</a>

```
searchKey: mime.TestTypeByExtension
```

```Go
func TestTypeByExtension(t *testing.T)
```

### <a id="TestTypeByExtension_LocalData" href="#TestTypeByExtension_LocalData">func TestTypeByExtension_LocalData(t *testing.T)</a>

```
searchKey: mime.TestTypeByExtension_LocalData
```

```Go
func TestTypeByExtension_LocalData(t *testing.T)
```

### <a id="TestTypeByExtensionCase" href="#TestTypeByExtensionCase">func TestTypeByExtensionCase(t *testing.T)</a>

```
searchKey: mime.TestTypeByExtensionCase
```

```Go
func TestTypeByExtensionCase(t *testing.T)
```

### <a id="TestExtensionsByType" href="#TestExtensionsByType">func TestExtensionsByType(t *testing.T)</a>

```
searchKey: mime.TestExtensionsByType
```

```Go
func TestExtensionsByType(t *testing.T)
```

### <a id="TestLookupMallocs" href="#TestLookupMallocs">func TestLookupMallocs(t *testing.T)</a>

```
searchKey: mime.TestLookupMallocs
```

```Go
func TestLookupMallocs(t *testing.T)
```

### <a id="BenchmarkTypeByExtension" href="#BenchmarkTypeByExtension">func BenchmarkTypeByExtension(b *testing.B)</a>

```
searchKey: mime.BenchmarkTypeByExtension
```

```Go
func BenchmarkTypeByExtension(b *testing.B)
```

### <a id="BenchmarkExtensionsByType" href="#BenchmarkExtensionsByType">func BenchmarkExtensionsByType(b *testing.B)</a>

```
searchKey: mime.BenchmarkExtensionsByType
```

```Go
func BenchmarkExtensionsByType(b *testing.B)
```

### <a id="TestExtensionsByType2" href="#TestExtensionsByType2">func TestExtensionsByType2(t *testing.T)</a>

```
searchKey: mime.TestExtensionsByType2
```

```Go
func TestExtensionsByType2(t *testing.T)
```

### <a id="initMimeUnixTest" href="#initMimeUnixTest">func initMimeUnixTest(t *testing.T)</a>

```
searchKey: mime.initMimeUnixTest
```

```Go
func initMimeUnixTest(t *testing.T)
```

### <a id="TestTypeByExtensionUNIX" href="#TestTypeByExtensionUNIX">func TestTypeByExtensionUNIX(t *testing.T)</a>

```
searchKey: mime.TestTypeByExtensionUNIX
```

```Go
func TestTypeByExtensionUNIX(t *testing.T)
```

