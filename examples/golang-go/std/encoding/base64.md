# Package base64

Package base64 implements base64 encoding as specified by RFC 4648. 

## Index

* [Constants](#const)
    * [const StdPadding](#StdPadding)
    * [const NoPadding](#NoPadding)
    * [const encodeStd](#encodeStd)
    * [const encodeURL](#encodeURL)
* [Variables](#var)
    * [var StdEncoding](#StdEncoding)
    * [var URLEncoding](#URLEncoding)
    * [var RawStdEncoding](#RawStdEncoding)
    * [var RawURLEncoding](#RawURLEncoding)
    * [var pairs](#pairs)
    * [var funnyEncoding](#funnyEncoding)
    * [var encodingTests](#encodingTests)
    * [var bigtest](#bigtest)
* [Types](#type)
    * [type Encoding struct](#Encoding)
        * [func NewEncoding(encoder string) *Encoding](#NewEncoding)
        * [func (enc Encoding) WithPadding(padding rune) *Encoding](#Encoding.WithPadding)
        * [func (enc Encoding) Strict() *Encoding](#Encoding.Strict)
        * [func (enc *Encoding) Encode(dst, src []byte)](#Encoding.Encode)
        * [func (enc *Encoding) EncodeToString(src []byte) string](#Encoding.EncodeToString)
        * [func (enc *Encoding) EncodedLen(n int) int](#Encoding.EncodedLen)
        * [func (enc *Encoding) decodeQuantum(dst, src []byte, si int) (nsi, n int, err error)](#Encoding.decodeQuantum)
        * [func (enc *Encoding) DecodeString(s string) ([]byte, error)](#Encoding.DecodeString)
        * [func (enc *Encoding) Decode(dst, src []byte) (n int, err error)](#Encoding.Decode)
        * [func (enc *Encoding) DecodedLen(n int) int](#Encoding.DecodedLen)
    * [type encoder struct](#encoder)
        * [func (e *encoder) Write(p []byte) (n int, err error)](#encoder.Write)
        * [func (e *encoder) Close() error](#encoder.Close)
    * [type CorruptInputError int64](#CorruptInputError)
        * [func (e CorruptInputError) Error() string](#CorruptInputError.Error)
    * [type decoder struct](#decoder)
        * [func (d *decoder) Read(p []byte) (n int, err error)](#decoder.Read)
    * [type newlineFilteringReader struct](#newlineFilteringReader)
        * [func (r *newlineFilteringReader) Read(p []byte) (int, error)](#newlineFilteringReader.Read)
    * [type testpair struct](#testpair)
    * [type encodingTest struct](#encodingTest)
    * [type nextRead struct](#nextRead)
    * [type faultInjectReader struct](#faultInjectReader)
        * [func (r *faultInjectReader) Read(p []byte) (int, error)](#faultInjectReader.Read)
* [Functions](#func)
    * [func NewEncoder(enc *Encoding, w io.Writer) io.WriteCloser](#NewEncoder)
    * [func assemble32(n1, n2, n3, n4 byte) (dn uint32, ok bool)](#assemble32)
    * [func assemble64(n1, n2, n3, n4, n5, n6, n7, n8 byte) (dn uint64, ok bool)](#assemble64)
    * [func NewDecoder(enc *Encoding, r io.Reader) io.Reader](#NewDecoder)
    * [func stdRef(ref string) string](#stdRef)
    * [func urlRef(ref string) string](#urlRef)
    * [func rawRef(ref string) string](#rawRef)
    * [func rawURLRef(ref string) string](#rawURLRef)
    * [func funnyRef(ref string) string](#funnyRef)
    * [func testEqual(t *testing.T, msg string, args ...interface{}) bool](#testEqual)
    * [func TestEncode(t *testing.T)](#TestEncode)
    * [func TestEncoder(t *testing.T)](#TestEncoder)
    * [func TestEncoderBuffering(t *testing.T)](#TestEncoderBuffering)
    * [func TestDecode(t *testing.T)](#TestDecode)
    * [func TestDecoder(t *testing.T)](#TestDecoder)
    * [func TestDecoderBuffering(t *testing.T)](#TestDecoderBuffering)
    * [func TestDecodeCorrupt(t *testing.T)](#TestDecodeCorrupt)
    * [func TestDecodeBounds(t *testing.T)](#TestDecodeBounds)
    * [func TestEncodedLen(t *testing.T)](#TestEncodedLen)
    * [func TestDecodedLen(t *testing.T)](#TestDecodedLen)
    * [func TestBig(t *testing.T)](#TestBig)
    * [func TestNewLineCharacters(t *testing.T)](#TestNewLineCharacters)
    * [func TestDecoderIssue3577(t *testing.T)](#TestDecoderIssue3577)
    * [func TestDecoderIssue4779(t *testing.T)](#TestDecoderIssue4779)
    * [func TestDecoderIssue7733(t *testing.T)](#TestDecoderIssue7733)
    * [func TestDecoderIssue15656(t *testing.T)](#TestDecoderIssue15656)
    * [func BenchmarkEncodeToString(b *testing.B)](#BenchmarkEncodeToString)
    * [func BenchmarkDecodeString(b *testing.B)](#BenchmarkDecodeString)
    * [func TestDecoderRaw(t *testing.T)](#TestDecoderRaw)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="StdPadding" href="#StdPadding">const StdPadding</a>

```
searchKey: base64.StdPadding
tags: [exported]
```

```Go
const StdPadding rune = '=' // Standard padding character

```

### <a id="NoPadding" href="#NoPadding">const NoPadding</a>

```
searchKey: base64.NoPadding
tags: [exported]
```

```Go
const NoPadding rune = -1 // No padding

```

### <a id="encodeStd" href="#encodeStd">const encodeStd</a>

```
searchKey: base64.encodeStd
```

```Go
const encodeStd = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
```

### <a id="encodeURL" href="#encodeURL">const encodeURL</a>

```
searchKey: base64.encodeURL
```

```Go
const encodeURL = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="StdEncoding" href="#StdEncoding">var StdEncoding</a>

```
searchKey: base64.StdEncoding
tags: [exported]
```

```Go
var StdEncoding = NewEncoding(encodeStd)
```

StdEncoding is the standard base64 encoding, as defined in RFC 4648. 

### <a id="URLEncoding" href="#URLEncoding">var URLEncoding</a>

```
searchKey: base64.URLEncoding
tags: [exported]
```

```Go
var URLEncoding = NewEncoding(encodeURL)
```

URLEncoding is the alternate base64 encoding defined in RFC 4648. It is typically used in URLs and file names. 

### <a id="RawStdEncoding" href="#RawStdEncoding">var RawStdEncoding</a>

```
searchKey: base64.RawStdEncoding
tags: [exported]
```

```Go
var RawStdEncoding = StdEncoding.WithPadding(NoPadding)
```

RawStdEncoding is the standard raw, unpadded base64 encoding, as defined in RFC 4648 section 3.2. This is the same as StdEncoding but omits padding characters. 

### <a id="RawURLEncoding" href="#RawURLEncoding">var RawURLEncoding</a>

```
searchKey: base64.RawURLEncoding
tags: [exported]
```

```Go
var RawURLEncoding = URLEncoding.WithPadding(NoPadding)
```

RawURLEncoding is the unpadded alternate base64 encoding defined in RFC 4648. It is typically used in URLs and file names. This is the same as URLEncoding but omits padding characters. 

### <a id="pairs" href="#pairs">var pairs</a>

```
searchKey: base64.pairs
```

```Go
var pairs = ...
```

### <a id="funnyEncoding" href="#funnyEncoding">var funnyEncoding</a>

```
searchKey: base64.funnyEncoding
```

```Go
var funnyEncoding = NewEncoding(encodeStd).WithPadding(rune('@'))
```

A nonstandard encoding with a funny padding character, for testing 

### <a id="encodingTests" href="#encodingTests">var encodingTests</a>

```
searchKey: base64.encodingTests
```

```Go
var encodingTests = ...
```

### <a id="bigtest" href="#bigtest">var bigtest</a>

```
searchKey: base64.bigtest
```

```Go
var bigtest = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Encoding" href="#Encoding">type Encoding struct</a>

```
searchKey: base64.Encoding
tags: [exported]
```

```Go
type Encoding struct {
	encode    [64]byte
	decodeMap [256]byte
	padChar   rune
	strict    bool
}
```

An Encoding is a radix 64 encoding/decoding scheme, defined by a 64-character alphabet. The most common encoding is the "base64" encoding defined in RFC 4648 and used in MIME (RFC 2045) and PEM (RFC 1421).  RFC 4648 also defines an alternate encoding, which is the standard encoding with - and _ substituted for + and /. 

#### <a id="NewEncoding" href="#NewEncoding">func NewEncoding(encoder string) *Encoding</a>

```
searchKey: base64.NewEncoding
tags: [exported]
```

```Go
func NewEncoding(encoder string) *Encoding
```

NewEncoding returns a new padded Encoding defined by the given alphabet, which must be a 64-byte string that does not contain the padding character or CR / LF ('\r', '\n'). The resulting Encoding uses the default padding character ('='), which may be changed or disabled via WithPadding. 

#### <a id="Encoding.WithPadding" href="#Encoding.WithPadding">func (enc Encoding) WithPadding(padding rune) *Encoding</a>

```
searchKey: base64.Encoding.WithPadding
tags: [exported]
```

```Go
func (enc Encoding) WithPadding(padding rune) *Encoding
```

WithPadding creates a new encoding identical to enc except with a specified padding character, or NoPadding to disable padding. The padding character must not be '\r' or '\n', must not be contained in the encoding's alphabet and must be a rune equal or below '\xff'. 

#### <a id="Encoding.Strict" href="#Encoding.Strict">func (enc Encoding) Strict() *Encoding</a>

```
searchKey: base64.Encoding.Strict
tags: [exported]
```

```Go
func (enc Encoding) Strict() *Encoding
```

Strict creates a new encoding identical to enc except with strict decoding enabled. In this mode, the decoder requires that trailing padding bits are zero, as described in RFC 4648 section 3.5. 

Note that the input is still malleable, as new line characters (CR and LF) are still ignored. 

#### <a id="Encoding.Encode" href="#Encoding.Encode">func (enc *Encoding) Encode(dst, src []byte)</a>

```
searchKey: base64.Encoding.Encode
tags: [exported]
```

```Go
func (enc *Encoding) Encode(dst, src []byte)
```

Encode encodes src using the encoding enc, writing EncodedLen(len(src)) bytes to dst. 

The encoding pads the output to a multiple of 4 bytes, so Encode is not appropriate for use on individual blocks of a large data stream. Use NewEncoder() instead. 

#### <a id="Encoding.EncodeToString" href="#Encoding.EncodeToString">func (enc *Encoding) EncodeToString(src []byte) string</a>

```
searchKey: base64.Encoding.EncodeToString
tags: [exported]
```

```Go
func (enc *Encoding) EncodeToString(src []byte) string
```

EncodeToString returns the base64 encoding of src. 

#### <a id="Encoding.EncodedLen" href="#Encoding.EncodedLen">func (enc *Encoding) EncodedLen(n int) int</a>

```
searchKey: base64.Encoding.EncodedLen
tags: [exported]
```

```Go
func (enc *Encoding) EncodedLen(n int) int
```

EncodedLen returns the length in bytes of the base64 encoding of an input buffer of length n. 

#### <a id="Encoding.decodeQuantum" href="#Encoding.decodeQuantum">func (enc *Encoding) decodeQuantum(dst, src []byte, si int) (nsi, n int, err error)</a>

```
searchKey: base64.Encoding.decodeQuantum
```

```Go
func (enc *Encoding) decodeQuantum(dst, src []byte, si int) (nsi, n int, err error)
```

decodeQuantum decodes up to 4 base64 bytes. The received parameters are the destination buffer dst, the source buffer src and an index in the source buffer si. It returns the number of bytes read from src, the number of bytes written to dst, and an error, if any. 

#### <a id="Encoding.DecodeString" href="#Encoding.DecodeString">func (enc *Encoding) DecodeString(s string) ([]byte, error)</a>

```
searchKey: base64.Encoding.DecodeString
tags: [exported]
```

```Go
func (enc *Encoding) DecodeString(s string) ([]byte, error)
```

DecodeString returns the bytes represented by the base64 string s. 

#### <a id="Encoding.Decode" href="#Encoding.Decode">func (enc *Encoding) Decode(dst, src []byte) (n int, err error)</a>

```
searchKey: base64.Encoding.Decode
tags: [exported]
```

```Go
func (enc *Encoding) Decode(dst, src []byte) (n int, err error)
```

Decode decodes src using the encoding enc. It writes at most DecodedLen(len(src)) bytes to dst and returns the number of bytes written. If src contains invalid base64 data, it will return the number of bytes successfully written and CorruptInputError. New line characters (\r and \n) are ignored. 

#### <a id="Encoding.DecodedLen" href="#Encoding.DecodedLen">func (enc *Encoding) DecodedLen(n int) int</a>

```
searchKey: base64.Encoding.DecodedLen
tags: [exported]
```

```Go
func (enc *Encoding) DecodedLen(n int) int
```

DecodedLen returns the maximum length in bytes of the decoded data corresponding to n bytes of base64-encoded data. 

### <a id="encoder" href="#encoder">type encoder struct</a>

```
searchKey: base64.encoder
```

```Go
type encoder struct {
	err  error
	enc  *Encoding
	w    io.Writer
	buf  [3]byte    // buffered data waiting to be encoded
	nbuf int        // number of bytes in buf
	out  [1024]byte // output buffer
}
```

#### <a id="encoder.Write" href="#encoder.Write">func (e *encoder) Write(p []byte) (n int, err error)</a>

```
searchKey: base64.encoder.Write
```

```Go
func (e *encoder) Write(p []byte) (n int, err error)
```

#### <a id="encoder.Close" href="#encoder.Close">func (e *encoder) Close() error</a>

```
searchKey: base64.encoder.Close
```

```Go
func (e *encoder) Close() error
```

Close flushes any pending output from the encoder. It is an error to call Write after calling Close. 

### <a id="CorruptInputError" href="#CorruptInputError">type CorruptInputError int64</a>

```
searchKey: base64.CorruptInputError
tags: [exported]
```

```Go
type CorruptInputError int64
```

#### <a id="CorruptInputError.Error" href="#CorruptInputError.Error">func (e CorruptInputError) Error() string</a>

```
searchKey: base64.CorruptInputError.Error
tags: [exported]
```

```Go
func (e CorruptInputError) Error() string
```

### <a id="decoder" href="#decoder">type decoder struct</a>

```
searchKey: base64.decoder
```

```Go
type decoder struct {
	err     error
	readErr error // error from r.Read
	enc     *Encoding
	r       io.Reader
	buf     [1024]byte // leftover input
	nbuf    int
	out     []byte // leftover decoded output
	outbuf  [1024 / 4 * 3]byte
}
```

#### <a id="decoder.Read" href="#decoder.Read">func (d *decoder) Read(p []byte) (n int, err error)</a>

```
searchKey: base64.decoder.Read
```

```Go
func (d *decoder) Read(p []byte) (n int, err error)
```

### <a id="newlineFilteringReader" href="#newlineFilteringReader">type newlineFilteringReader struct</a>

```
searchKey: base64.newlineFilteringReader
```

```Go
type newlineFilteringReader struct {
	wrapped io.Reader
}
```

#### <a id="newlineFilteringReader.Read" href="#newlineFilteringReader.Read">func (r *newlineFilteringReader) Read(p []byte) (int, error)</a>

```
searchKey: base64.newlineFilteringReader.Read
```

```Go
func (r *newlineFilteringReader) Read(p []byte) (int, error)
```

### <a id="testpair" href="#testpair">type testpair struct</a>

```
searchKey: base64.testpair
```

```Go
type testpair struct {
	decoded, encoded string
}
```

### <a id="encodingTest" href="#encodingTest">type encodingTest struct</a>

```
searchKey: base64.encodingTest
```

```Go
type encodingTest struct {
	enc  *Encoding           // Encoding to test
	conv func(string) string // Reference string converter
}
```

### <a id="nextRead" href="#nextRead">type nextRead struct</a>

```
searchKey: base64.nextRead
```

```Go
type nextRead struct {
	n   int   // bytes to return
	err error // error to return
}
```

### <a id="faultInjectReader" href="#faultInjectReader">type faultInjectReader struct</a>

```
searchKey: base64.faultInjectReader
```

```Go
type faultInjectReader struct {
	source string
	nextc  <-chan nextRead
}
```

faultInjectReader returns data from source, rate-limited and with the errors as written to nextc. 

#### <a id="faultInjectReader.Read" href="#faultInjectReader.Read">func (r *faultInjectReader) Read(p []byte) (int, error)</a>

```
searchKey: base64.faultInjectReader.Read
```

```Go
func (r *faultInjectReader) Read(p []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="NewEncoder" href="#NewEncoder">func NewEncoder(enc *Encoding, w io.Writer) io.WriteCloser</a>

```
searchKey: base64.NewEncoder
tags: [exported]
```

```Go
func NewEncoder(enc *Encoding, w io.Writer) io.WriteCloser
```

NewEncoder returns a new base64 stream encoder. Data written to the returned writer will be encoded using enc and then written to w. Base64 encodings operate in 4-byte blocks; when finished writing, the caller must Close the returned encoder to flush any partially written blocks. 

### <a id="assemble32" href="#assemble32">func assemble32(n1, n2, n3, n4 byte) (dn uint32, ok bool)</a>

```
searchKey: base64.assemble32
```

```Go
func assemble32(n1, n2, n3, n4 byte) (dn uint32, ok bool)
```

assemble32 assembles 4 base64 digits into 3 bytes. Each digit comes from the decode map, and will be 0xff if it came from an invalid character. 

### <a id="assemble64" href="#assemble64">func assemble64(n1, n2, n3, n4, n5, n6, n7, n8 byte) (dn uint64, ok bool)</a>

```
searchKey: base64.assemble64
```

```Go
func assemble64(n1, n2, n3, n4, n5, n6, n7, n8 byte) (dn uint64, ok bool)
```

assemble64 assembles 8 base64 digits into 6 bytes. Each digit comes from the decode map, and will be 0xff if it came from an invalid character. 

### <a id="NewDecoder" href="#NewDecoder">func NewDecoder(enc *Encoding, r io.Reader) io.Reader</a>

```
searchKey: base64.NewDecoder
tags: [exported]
```

```Go
func NewDecoder(enc *Encoding, r io.Reader) io.Reader
```

NewDecoder constructs a new base64 stream decoder. 

### <a id="stdRef" href="#stdRef">func stdRef(ref string) string</a>

```
searchKey: base64.stdRef
```

```Go
func stdRef(ref string) string
```

Do nothing to a reference base64 string (leave in standard format) 

### <a id="urlRef" href="#urlRef">func urlRef(ref string) string</a>

```
searchKey: base64.urlRef
```

```Go
func urlRef(ref string) string
```

Convert a reference string to URL-encoding 

### <a id="rawRef" href="#rawRef">func rawRef(ref string) string</a>

```
searchKey: base64.rawRef
```

```Go
func rawRef(ref string) string
```

Convert a reference string to raw, unpadded format 

### <a id="rawURLRef" href="#rawURLRef">func rawURLRef(ref string) string</a>

```
searchKey: base64.rawURLRef
```

```Go
func rawURLRef(ref string) string
```

Both URL and unpadding conversions 

### <a id="funnyRef" href="#funnyRef">func funnyRef(ref string) string</a>

```
searchKey: base64.funnyRef
```

```Go
func funnyRef(ref string) string
```

### <a id="testEqual" href="#testEqual">func testEqual(t *testing.T, msg string, args ...interface{}) bool</a>

```
searchKey: base64.testEqual
```

```Go
func testEqual(t *testing.T, msg string, args ...interface{}) bool
```

### <a id="TestEncode" href="#TestEncode">func TestEncode(t *testing.T)</a>

```
searchKey: base64.TestEncode
```

```Go
func TestEncode(t *testing.T)
```

### <a id="TestEncoder" href="#TestEncoder">func TestEncoder(t *testing.T)</a>

```
searchKey: base64.TestEncoder
```

```Go
func TestEncoder(t *testing.T)
```

### <a id="TestEncoderBuffering" href="#TestEncoderBuffering">func TestEncoderBuffering(t *testing.T)</a>

```
searchKey: base64.TestEncoderBuffering
```

```Go
func TestEncoderBuffering(t *testing.T)
```

### <a id="TestDecode" href="#TestDecode">func TestDecode(t *testing.T)</a>

```
searchKey: base64.TestDecode
```

```Go
func TestDecode(t *testing.T)
```

### <a id="TestDecoder" href="#TestDecoder">func TestDecoder(t *testing.T)</a>

```
searchKey: base64.TestDecoder
```

```Go
func TestDecoder(t *testing.T)
```

### <a id="TestDecoderBuffering" href="#TestDecoderBuffering">func TestDecoderBuffering(t *testing.T)</a>

```
searchKey: base64.TestDecoderBuffering
```

```Go
func TestDecoderBuffering(t *testing.T)
```

### <a id="TestDecodeCorrupt" href="#TestDecodeCorrupt">func TestDecodeCorrupt(t *testing.T)</a>

```
searchKey: base64.TestDecodeCorrupt
```

```Go
func TestDecodeCorrupt(t *testing.T)
```

### <a id="TestDecodeBounds" href="#TestDecodeBounds">func TestDecodeBounds(t *testing.T)</a>

```
searchKey: base64.TestDecodeBounds
```

```Go
func TestDecodeBounds(t *testing.T)
```

### <a id="TestEncodedLen" href="#TestEncodedLen">func TestEncodedLen(t *testing.T)</a>

```
searchKey: base64.TestEncodedLen
```

```Go
func TestEncodedLen(t *testing.T)
```

### <a id="TestDecodedLen" href="#TestDecodedLen">func TestDecodedLen(t *testing.T)</a>

```
searchKey: base64.TestDecodedLen
```

```Go
func TestDecodedLen(t *testing.T)
```

### <a id="TestBig" href="#TestBig">func TestBig(t *testing.T)</a>

```
searchKey: base64.TestBig
```

```Go
func TestBig(t *testing.T)
```

### <a id="TestNewLineCharacters" href="#TestNewLineCharacters">func TestNewLineCharacters(t *testing.T)</a>

```
searchKey: base64.TestNewLineCharacters
```

```Go
func TestNewLineCharacters(t *testing.T)
```

### <a id="TestDecoderIssue3577" href="#TestDecoderIssue3577">func TestDecoderIssue3577(t *testing.T)</a>

```
searchKey: base64.TestDecoderIssue3577
```

```Go
func TestDecoderIssue3577(t *testing.T)
```

tests that we don't ignore errors from our underlying reader 

### <a id="TestDecoderIssue4779" href="#TestDecoderIssue4779">func TestDecoderIssue4779(t *testing.T)</a>

```
searchKey: base64.TestDecoderIssue4779
```

```Go
func TestDecoderIssue4779(t *testing.T)
```

### <a id="TestDecoderIssue7733" href="#TestDecoderIssue7733">func TestDecoderIssue7733(t *testing.T)</a>

```
searchKey: base64.TestDecoderIssue7733
```

```Go
func TestDecoderIssue7733(t *testing.T)
```

### <a id="TestDecoderIssue15656" href="#TestDecoderIssue15656">func TestDecoderIssue15656(t *testing.T)</a>

```
searchKey: base64.TestDecoderIssue15656
```

```Go
func TestDecoderIssue15656(t *testing.T)
```

### <a id="BenchmarkEncodeToString" href="#BenchmarkEncodeToString">func BenchmarkEncodeToString(b *testing.B)</a>

```
searchKey: base64.BenchmarkEncodeToString
```

```Go
func BenchmarkEncodeToString(b *testing.B)
```

### <a id="BenchmarkDecodeString" href="#BenchmarkDecodeString">func BenchmarkDecodeString(b *testing.B)</a>

```
searchKey: base64.BenchmarkDecodeString
```

```Go
func BenchmarkDecodeString(b *testing.B)
```

### <a id="TestDecoderRaw" href="#TestDecoderRaw">func TestDecoderRaw(t *testing.T)</a>

```
searchKey: base64.TestDecoderRaw
```

```Go
func TestDecoderRaw(t *testing.T)
```

