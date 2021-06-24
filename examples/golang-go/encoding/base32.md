# Package base32

Package base32 implements base32 encoding as specified by RFC 4648. 

## Index

* [Constants](#const)
    * [const NoPadding](#NoPadding)
    * [const StdPadding](#StdPadding)
    * [const encodeHex](#encodeHex)
    * [const encodeStd](#encodeStd)
* [Variables](#var)
    * [var HexEncoding](#HexEncoding)
    * [var StdEncoding](#StdEncoding)
    * [var bigtest](#bigtest)
    * [var pairs](#pairs)
* [Types](#type)
    * [type CorruptInputError int64](#CorruptInputError)
        * [func (e CorruptInputError) Error() string](#CorruptInputError.Error)
    * [type Encoding struct](#Encoding)
        * [func NewEncoding(encoder string) *Encoding](#NewEncoding)
        * [func (enc *Encoding) Decode(dst, src []byte) (n int, err error)](#Encoding.Decode)
        * [func (enc *Encoding) DecodeString(s string) ([]byte, error)](#Encoding.DecodeString)
        * [func (enc *Encoding) DecodedLen(n int) int](#Encoding.DecodedLen)
        * [func (enc *Encoding) Encode(dst, src []byte)](#Encoding.Encode)
        * [func (enc *Encoding) EncodeToString(src []byte) string](#Encoding.EncodeToString)
        * [func (enc *Encoding) EncodedLen(n int) int](#Encoding.EncodedLen)
        * [func (enc Encoding) WithPadding(padding rune) *Encoding](#Encoding.WithPadding)
        * [func (enc *Encoding) decode(dst, src []byte) (n int, end bool, err error)](#Encoding.decode)
    * [type badReader struct](#badReader)
        * [func (b *badReader) Read(p []byte) (int, error)](#badReader.Read)
    * [type decoder struct](#decoder)
        * [func (d *decoder) Read(p []byte) (n int, err error)](#decoder.Read)
    * [type encoder struct](#encoder)
        * [func (e *encoder) Close() error](#encoder.Close)
        * [func (e *encoder) Write(p []byte) (n int, err error)](#encoder.Write)
    * [type newlineFilteringReader struct](#newlineFilteringReader)
        * [func (r *newlineFilteringReader) Read(p []byte) (int, error)](#newlineFilteringReader.Read)
    * [type testpair struct](#testpair)
* [Functions](#func)
    * [func BenchmarkDecode(b *testing.B)](#BenchmarkDecode)
    * [func BenchmarkDecodeString(b *testing.B)](#BenchmarkDecodeString)
    * [func BenchmarkEncode(b *testing.B)](#BenchmarkEncode)
    * [func BenchmarkEncodeToString(b *testing.B)](#BenchmarkEncodeToString)
    * [func NewDecoder(enc *Encoding, r io.Reader) io.Reader](#NewDecoder)
    * [func NewEncoder(enc *Encoding, w io.Writer) io.WriteCloser](#NewEncoder)
    * [func TestBig(t *testing.T)](#TestBig)
    * [func TestBufferedDecodingSameError(t *testing.T)](#TestBufferedDecodingSameError)
    * [func TestDecode(t *testing.T)](#TestDecode)
    * [func TestDecodeCorrupt(t *testing.T)](#TestDecodeCorrupt)
    * [func TestDecodeReadAll(t *testing.T)](#TestDecodeReadAll)
    * [func TestDecodeSmallBuffer(t *testing.T)](#TestDecodeSmallBuffer)
    * [func TestDecodeWithPadding(t *testing.T)](#TestDecodeWithPadding)
    * [func TestDecodeWithWrongPadding(t *testing.T)](#TestDecodeWithWrongPadding)
    * [func TestDecoder(t *testing.T)](#TestDecoder)
    * [func TestDecoderBuffering(t *testing.T)](#TestDecoderBuffering)
    * [func TestDecoderError(t *testing.T)](#TestDecoderError)
    * [func TestDecoderIssue4779(t *testing.T)](#TestDecoderIssue4779)
    * [func TestEncode(t *testing.T)](#TestEncode)
    * [func TestEncodedDecodedLen(t *testing.T)](#TestEncodedDecodedLen)
    * [func TestEncoder(t *testing.T)](#TestEncoder)
    * [func TestEncoderBuffering(t *testing.T)](#TestEncoderBuffering)
    * [func TestIssue20044(t *testing.T)](#TestIssue20044)
    * [func TestNewLineCharacters(t *testing.T)](#TestNewLineCharacters)
    * [func TestReaderEOF(t *testing.T)](#TestReaderEOF)
    * [func TestWithCustomPadding(t *testing.T)](#TestWithCustomPadding)
    * [func TestWithoutPadding(t *testing.T)](#TestWithoutPadding)
    * [func TestWithoutPaddingClose(t *testing.T)](#TestWithoutPaddingClose)
    * [func readEncodedData(r io.Reader, buf []byte, min int, expectsPadding bool) (n int, err error)](#readEncodedData)
    * [func stripNewlines(dst, src []byte) int](#stripNewlines)
    * [func testEqual(t *testing.T, msg string, args ...interface{}) bool](#testEqual)
    * [func testStringEncoding(t *testing.T, expected string, examples []string)](#testStringEncoding)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="NoPadding" href="#NoPadding">const NoPadding</a>

```
searchKey: base32.NoPadding
tags: [constant number]
```

```Go
const NoPadding rune = -1 // No padding

```

### <a id="StdPadding" href="#StdPadding">const StdPadding</a>

```
searchKey: base32.StdPadding
tags: [constant number]
```

```Go
const StdPadding rune = '=' // Standard padding character

```

### <a id="encodeHex" href="#encodeHex">const encodeHex</a>

```
searchKey: base32.encodeHex
tags: [constant string private]
```

```Go
const encodeHex = "0123456789ABCDEFGHIJKLMNOPQRSTUV"
```

### <a id="encodeStd" href="#encodeStd">const encodeStd</a>

```
searchKey: base32.encodeStd
tags: [constant string private]
```

```Go
const encodeStd = "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="HexEncoding" href="#HexEncoding">var HexEncoding</a>

```
searchKey: base32.HexEncoding
tags: [variable struct]
```

```Go
var HexEncoding = NewEncoding(encodeHex)
```

HexEncoding is the `Extended Hex Alphabet' defined in RFC 4648. It is typically used in DNS. 

### <a id="StdEncoding" href="#StdEncoding">var StdEncoding</a>

```
searchKey: base32.StdEncoding
tags: [variable struct]
```

```Go
var StdEncoding = NewEncoding(encodeStd)
```

StdEncoding is the standard base32 encoding, as defined in RFC 4648. 

### <a id="bigtest" href="#bigtest">var bigtest</a>

```
searchKey: base32.bigtest
tags: [variable struct private]
```

```Go
var bigtest = ...
```

### <a id="pairs" href="#pairs">var pairs</a>

```
searchKey: base32.pairs
tags: [variable array struct private]
```

```Go
var pairs = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="CorruptInputError" href="#CorruptInputError">type CorruptInputError int64</a>

```
searchKey: base32.CorruptInputError
tags: [number]
```

```Go
type CorruptInputError int64
```

#### <a id="CorruptInputError.Error" href="#CorruptInputError.Error">func (e CorruptInputError) Error() string</a>

```
searchKey: base32.CorruptInputError.Error
tags: [function]
```

```Go
func (e CorruptInputError) Error() string
```

### <a id="Encoding" href="#Encoding">type Encoding struct</a>

```
searchKey: base32.Encoding
tags: [struct]
```

```Go
type Encoding struct {
	encode    [32]byte
	decodeMap [256]byte
	padChar   rune
}
```

An Encoding is a radix 32 encoding/decoding scheme, defined by a 32-character alphabet. The most common is the "base32" encoding introduced for SASL GSSAPI and standardized in RFC 4648. The alternate "base32hex" encoding is used in DNSSEC. 

#### <a id="NewEncoding" href="#NewEncoding">func NewEncoding(encoder string) *Encoding</a>

```
searchKey: base32.NewEncoding
tags: [method]
```

```Go
func NewEncoding(encoder string) *Encoding
```

NewEncoding returns a new Encoding defined by the given alphabet, which must be a 32-byte string. 

#### <a id="Encoding.Decode" href="#Encoding.Decode">func (enc *Encoding) Decode(dst, src []byte) (n int, err error)</a>

```
searchKey: base32.Encoding.Decode
tags: [method]
```

```Go
func (enc *Encoding) Decode(dst, src []byte) (n int, err error)
```

Decode decodes src using the encoding enc. It writes at most DecodedLen(len(src)) bytes to dst and returns the number of bytes written. If src contains invalid base32 data, it will return the number of bytes successfully written and CorruptInputError. New line characters (\r and \n) are ignored. 

#### <a id="Encoding.DecodeString" href="#Encoding.DecodeString">func (enc *Encoding) DecodeString(s string) ([]byte, error)</a>

```
searchKey: base32.Encoding.DecodeString
tags: [method]
```

```Go
func (enc *Encoding) DecodeString(s string) ([]byte, error)
```

DecodeString returns the bytes represented by the base32 string s. 

#### <a id="Encoding.DecodedLen" href="#Encoding.DecodedLen">func (enc *Encoding) DecodedLen(n int) int</a>

```
searchKey: base32.Encoding.DecodedLen
tags: [method]
```

```Go
func (enc *Encoding) DecodedLen(n int) int
```

DecodedLen returns the maximum length in bytes of the decoded data corresponding to n bytes of base32-encoded data. 

#### <a id="Encoding.Encode" href="#Encoding.Encode">func (enc *Encoding) Encode(dst, src []byte)</a>

```
searchKey: base32.Encoding.Encode
tags: [method]
```

```Go
func (enc *Encoding) Encode(dst, src []byte)
```

Encode encodes src using the encoding enc, writing EncodedLen(len(src)) bytes to dst. 

The encoding pads the output to a multiple of 8 bytes, so Encode is not appropriate for use on individual blocks of a large data stream. Use NewEncoder() instead. 

#### <a id="Encoding.EncodeToString" href="#Encoding.EncodeToString">func (enc *Encoding) EncodeToString(src []byte) string</a>

```
searchKey: base32.Encoding.EncodeToString
tags: [method]
```

```Go
func (enc *Encoding) EncodeToString(src []byte) string
```

EncodeToString returns the base32 encoding of src. 

#### <a id="Encoding.EncodedLen" href="#Encoding.EncodedLen">func (enc *Encoding) EncodedLen(n int) int</a>

```
searchKey: base32.Encoding.EncodedLen
tags: [method]
```

```Go
func (enc *Encoding) EncodedLen(n int) int
```

EncodedLen returns the length in bytes of the base32 encoding of an input buffer of length n. 

#### <a id="Encoding.WithPadding" href="#Encoding.WithPadding">func (enc Encoding) WithPadding(padding rune) *Encoding</a>

```
searchKey: base32.Encoding.WithPadding
tags: [method]
```

```Go
func (enc Encoding) WithPadding(padding rune) *Encoding
```

WithPadding creates a new encoding identical to enc except with a specified padding character, or NoPadding to disable padding. The padding character must not be '\r' or '\n', must not be contained in the encoding's alphabet and must be a rune equal or below '\xff'. 

#### <a id="Encoding.decode" href="#Encoding.decode">func (enc *Encoding) decode(dst, src []byte) (n int, end bool, err error)</a>

```
searchKey: base32.Encoding.decode
tags: [method private]
```

```Go
func (enc *Encoding) decode(dst, src []byte) (n int, end bool, err error)
```

decode is like Decode but returns an additional 'end' value, which indicates if end-of-message padding was encountered and thus any additional data is an error. This method assumes that src has been stripped of all supported whitespace ('\r' and '\n'). 

### <a id="badReader" href="#badReader">type badReader struct</a>

```
searchKey: base32.badReader
tags: [struct private]
```

```Go
type badReader struct {
	data   []byte
	errs   []error
	called int
	limit  int
}
```

#### <a id="badReader.Read" href="#badReader.Read">func (b *badReader) Read(p []byte) (int, error)</a>

```
searchKey: base32.badReader.Read
tags: [method private]
```

```Go
func (b *badReader) Read(p []byte) (int, error)
```

Populates p with data, returns a count of the bytes written and an error.  The error returned is taken from badReader.errs, with each invocation of Read returning the next error in this slice, or io.EOF, if all errors from the slice have already been returned.  The number of bytes returned is determined by the size of the input buffer the test passes to decoder.Read and will be a multiple of 8, unless badReader.limit is non zero. 

### <a id="decoder" href="#decoder">type decoder struct</a>

```
searchKey: base32.decoder
tags: [struct private]
```

```Go
type decoder struct {
	err    error
	enc    *Encoding
	r      io.Reader
	end    bool       // saw end of message
	buf    [1024]byte // leftover input
	nbuf   int
	out    []byte // leftover decoded output
	outbuf [1024 / 8 * 5]byte
}
```

#### <a id="decoder.Read" href="#decoder.Read">func (d *decoder) Read(p []byte) (n int, err error)</a>

```
searchKey: base32.decoder.Read
tags: [method private]
```

```Go
func (d *decoder) Read(p []byte) (n int, err error)
```

### <a id="encoder" href="#encoder">type encoder struct</a>

```
searchKey: base32.encoder
tags: [struct private]
```

```Go
type encoder struct {
	err  error
	enc  *Encoding
	w    io.Writer
	buf  [5]byte    // buffered data waiting to be encoded
	nbuf int        // number of bytes in buf
	out  [1024]byte // output buffer
}
```

#### <a id="encoder.Close" href="#encoder.Close">func (e *encoder) Close() error</a>

```
searchKey: base32.encoder.Close
tags: [function private]
```

```Go
func (e *encoder) Close() error
```

Close flushes any pending output from the encoder. It is an error to call Write after calling Close. 

#### <a id="encoder.Write" href="#encoder.Write">func (e *encoder) Write(p []byte) (n int, err error)</a>

```
searchKey: base32.encoder.Write
tags: [method private]
```

```Go
func (e *encoder) Write(p []byte) (n int, err error)
```

### <a id="newlineFilteringReader" href="#newlineFilteringReader">type newlineFilteringReader struct</a>

```
searchKey: base32.newlineFilteringReader
tags: [struct private]
```

```Go
type newlineFilteringReader struct {
	wrapped io.Reader
}
```

#### <a id="newlineFilteringReader.Read" href="#newlineFilteringReader.Read">func (r *newlineFilteringReader) Read(p []byte) (int, error)</a>

```
searchKey: base32.newlineFilteringReader.Read
tags: [method private]
```

```Go
func (r *newlineFilteringReader) Read(p []byte) (int, error)
```

### <a id="testpair" href="#testpair">type testpair struct</a>

```
searchKey: base32.testpair
tags: [struct private]
```

```Go
type testpair struct {
	decoded, encoded string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkDecode" href="#BenchmarkDecode">func BenchmarkDecode(b *testing.B)</a>

```
searchKey: base32.BenchmarkDecode
tags: [method private benchmark]
```

```Go
func BenchmarkDecode(b *testing.B)
```

### <a id="BenchmarkDecodeString" href="#BenchmarkDecodeString">func BenchmarkDecodeString(b *testing.B)</a>

```
searchKey: base32.BenchmarkDecodeString
tags: [method private benchmark]
```

```Go
func BenchmarkDecodeString(b *testing.B)
```

### <a id="BenchmarkEncode" href="#BenchmarkEncode">func BenchmarkEncode(b *testing.B)</a>

```
searchKey: base32.BenchmarkEncode
tags: [method private benchmark]
```

```Go
func BenchmarkEncode(b *testing.B)
```

### <a id="BenchmarkEncodeToString" href="#BenchmarkEncodeToString">func BenchmarkEncodeToString(b *testing.B)</a>

```
searchKey: base32.BenchmarkEncodeToString
tags: [method private benchmark]
```

```Go
func BenchmarkEncodeToString(b *testing.B)
```

### <a id="NewDecoder" href="#NewDecoder">func NewDecoder(enc *Encoding, r io.Reader) io.Reader</a>

```
searchKey: base32.NewDecoder
tags: [method]
```

```Go
func NewDecoder(enc *Encoding, r io.Reader) io.Reader
```

NewDecoder constructs a new base32 stream decoder. 

### <a id="NewEncoder" href="#NewEncoder">func NewEncoder(enc *Encoding, w io.Writer) io.WriteCloser</a>

```
searchKey: base32.NewEncoder
tags: [method]
```

```Go
func NewEncoder(enc *Encoding, w io.Writer) io.WriteCloser
```

NewEncoder returns a new base32 stream encoder. Data written to the returned writer will be encoded using enc and then written to w. Base32 encodings operate in 5-byte blocks; when finished writing, the caller must Close the returned encoder to flush any partially written blocks. 

### <a id="TestBig" href="#TestBig">func TestBig(t *testing.T)</a>

```
searchKey: base32.TestBig
tags: [method private test]
```

```Go
func TestBig(t *testing.T)
```

### <a id="TestBufferedDecodingSameError" href="#TestBufferedDecodingSameError">func TestBufferedDecodingSameError(t *testing.T)</a>

```
searchKey: base32.TestBufferedDecodingSameError
tags: [method private test]
```

```Go
func TestBufferedDecodingSameError(t *testing.T)
```

### <a id="TestDecode" href="#TestDecode">func TestDecode(t *testing.T)</a>

```
searchKey: base32.TestDecode
tags: [method private test]
```

```Go
func TestDecode(t *testing.T)
```

### <a id="TestDecodeCorrupt" href="#TestDecodeCorrupt">func TestDecodeCorrupt(t *testing.T)</a>

```
searchKey: base32.TestDecodeCorrupt
tags: [method private test]
```

```Go
func TestDecodeCorrupt(t *testing.T)
```

### <a id="TestDecodeReadAll" href="#TestDecodeReadAll">func TestDecodeReadAll(t *testing.T)</a>

```
searchKey: base32.TestDecodeReadAll
tags: [method private test]
```

```Go
func TestDecodeReadAll(t *testing.T)
```

### <a id="TestDecodeSmallBuffer" href="#TestDecodeSmallBuffer">func TestDecodeSmallBuffer(t *testing.T)</a>

```
searchKey: base32.TestDecodeSmallBuffer
tags: [method private test]
```

```Go
func TestDecodeSmallBuffer(t *testing.T)
```

### <a id="TestDecodeWithPadding" href="#TestDecodeWithPadding">func TestDecodeWithPadding(t *testing.T)</a>

```
searchKey: base32.TestDecodeWithPadding
tags: [method private test]
```

```Go
func TestDecodeWithPadding(t *testing.T)
```

### <a id="TestDecodeWithWrongPadding" href="#TestDecodeWithWrongPadding">func TestDecodeWithWrongPadding(t *testing.T)</a>

```
searchKey: base32.TestDecodeWithWrongPadding
tags: [method private test]
```

```Go
func TestDecodeWithWrongPadding(t *testing.T)
```

### <a id="TestDecoder" href="#TestDecoder">func TestDecoder(t *testing.T)</a>

```
searchKey: base32.TestDecoder
tags: [method private test]
```

```Go
func TestDecoder(t *testing.T)
```

### <a id="TestDecoderBuffering" href="#TestDecoderBuffering">func TestDecoderBuffering(t *testing.T)</a>

```
searchKey: base32.TestDecoderBuffering
tags: [method private test]
```

```Go
func TestDecoderBuffering(t *testing.T)
```

### <a id="TestDecoderError" href="#TestDecoderError">func TestDecoderError(t *testing.T)</a>

```
searchKey: base32.TestDecoderError
tags: [method private test]
```

```Go
func TestDecoderError(t *testing.T)
```

TestDecoderError verifies decode errors are propagated when there are no read errors. 

### <a id="TestDecoderIssue4779" href="#TestDecoderIssue4779">func TestDecoderIssue4779(t *testing.T)</a>

```
searchKey: base32.TestDecoderIssue4779
tags: [method private test]
```

```Go
func TestDecoderIssue4779(t *testing.T)
```

### <a id="TestEncode" href="#TestEncode">func TestEncode(t *testing.T)</a>

```
searchKey: base32.TestEncode
tags: [method private test]
```

```Go
func TestEncode(t *testing.T)
```

### <a id="TestEncodedDecodedLen" href="#TestEncodedDecodedLen">func TestEncodedDecodedLen(t *testing.T)</a>

```
searchKey: base32.TestEncodedDecodedLen
tags: [method private test]
```

```Go
func TestEncodedDecodedLen(t *testing.T)
```

### <a id="TestEncoder" href="#TestEncoder">func TestEncoder(t *testing.T)</a>

```
searchKey: base32.TestEncoder
tags: [method private test]
```

```Go
func TestEncoder(t *testing.T)
```

### <a id="TestEncoderBuffering" href="#TestEncoderBuffering">func TestEncoderBuffering(t *testing.T)</a>

```
searchKey: base32.TestEncoderBuffering
tags: [method private test]
```

```Go
func TestEncoderBuffering(t *testing.T)
```

### <a id="TestIssue20044" href="#TestIssue20044">func TestIssue20044(t *testing.T)</a>

```
searchKey: base32.TestIssue20044
tags: [method private test]
```

```Go
func TestIssue20044(t *testing.T)
```

TestIssue20044 tests that decoder.Read behaves correctly when the caller supplied reader returns an error. 

### <a id="TestNewLineCharacters" href="#TestNewLineCharacters">func TestNewLineCharacters(t *testing.T)</a>

```
searchKey: base32.TestNewLineCharacters
tags: [method private test]
```

```Go
func TestNewLineCharacters(t *testing.T)
```

### <a id="TestReaderEOF" href="#TestReaderEOF">func TestReaderEOF(t *testing.T)</a>

```
searchKey: base32.TestReaderEOF
tags: [method private test]
```

```Go
func TestReaderEOF(t *testing.T)
```

TestReaderEOF ensures decoder.Read behaves correctly when input data is exhausted. 

### <a id="TestWithCustomPadding" href="#TestWithCustomPadding">func TestWithCustomPadding(t *testing.T)</a>

```
searchKey: base32.TestWithCustomPadding
tags: [method private test]
```

```Go
func TestWithCustomPadding(t *testing.T)
```

### <a id="TestWithoutPadding" href="#TestWithoutPadding">func TestWithoutPadding(t *testing.T)</a>

```
searchKey: base32.TestWithoutPadding
tags: [method private test]
```

```Go
func TestWithoutPadding(t *testing.T)
```

### <a id="TestWithoutPaddingClose" href="#TestWithoutPaddingClose">func TestWithoutPaddingClose(t *testing.T)</a>

```
searchKey: base32.TestWithoutPaddingClose
tags: [method private test]
```

```Go
func TestWithoutPaddingClose(t *testing.T)
```

### <a id="readEncodedData" href="#readEncodedData">func readEncodedData(r io.Reader, buf []byte, min int, expectsPadding bool) (n int, err error)</a>

```
searchKey: base32.readEncodedData
tags: [method private]
```

```Go
func readEncodedData(r io.Reader, buf []byte, min int, expectsPadding bool) (n int, err error)
```

### <a id="stripNewlines" href="#stripNewlines">func stripNewlines(dst, src []byte) int</a>

```
searchKey: base32.stripNewlines
tags: [method private]
```

```Go
func stripNewlines(dst, src []byte) int
```

stripNewlines removes newline characters and returns the number of non-newline characters copied to dst. 

### <a id="testEqual" href="#testEqual">func testEqual(t *testing.T, msg string, args ...interface{}) bool</a>

```
searchKey: base32.testEqual
tags: [method private]
```

```Go
func testEqual(t *testing.T, msg string, args ...interface{}) bool
```

### <a id="testStringEncoding" href="#testStringEncoding">func testStringEncoding(t *testing.T, expected string, examples []string)</a>

```
searchKey: base32.testStringEncoding
tags: [method private]
```

```Go
func testStringEncoding(t *testing.T, expected string, examples []string)
```

