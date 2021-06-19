# Package ascii85

Package ascii85 implements the ascii85 data encoding as used in the btoa tool and Adobe's PostScript and PDF document formats. 

## Index

* [Variables](#var)
    * [var bigtest](#bigtest)
    * [var pairs](#pairs)
* [Types](#type)
    * [type encoder struct](#encoder)
        * [func (e *encoder) Write(p []byte) (n int, err error)](#encoder.Write)
        * [func (e *encoder) Close() error](#encoder.Close)
    * [type CorruptInputError int64](#CorruptInputError)
        * [func (e CorruptInputError) Error() string](#CorruptInputError.Error)
    * [type decoder struct](#decoder)
        * [func (d *decoder) Read(p []byte) (n int, err error)](#decoder.Read)
    * [type testpair struct](#testpair)
* [Functions](#func)
    * [func Encode(dst, src []byte) int](#Encode)
    * [func MaxEncodedLen(n int) int](#MaxEncodedLen)
    * [func NewEncoder(w io.Writer) io.WriteCloser](#NewEncoder)
    * [func Decode(dst, src []byte, flush bool) (ndst, nsrc int, err error)](#Decode)
    * [func NewDecoder(r io.Reader) io.Reader](#NewDecoder)
    * [func testEqual(t *testing.T, msg string, args ...interface{}) bool](#testEqual)
    * [func strip85(s string) string](#strip85)
    * [func TestEncode(t *testing.T)](#TestEncode)
    * [func TestEncoder(t *testing.T)](#TestEncoder)
    * [func TestEncoderBuffering(t *testing.T)](#TestEncoderBuffering)
    * [func TestDecode(t *testing.T)](#TestDecode)
    * [func TestDecoder(t *testing.T)](#TestDecoder)
    * [func TestDecoderBuffering(t *testing.T)](#TestDecoderBuffering)
    * [func TestDecodeCorrupt(t *testing.T)](#TestDecodeCorrupt)
    * [func TestBig(t *testing.T)](#TestBig)
    * [func TestDecoderInternalWhitespace(t *testing.T)](#TestDecoderInternalWhitespace)


## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="bigtest" href="#bigtest">var bigtest</a>

```
searchKey: ascii85.bigtest
```

```Go
var bigtest = ...
```

### <a id="pairs" href="#pairs">var pairs</a>

```
searchKey: ascii85.pairs
```

```Go
var pairs = []testpair{

	{
		"",
		"",
	},

	bigtest,

	{
		"\000\000\000\000",
		"z",
	},
}
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="encoder" href="#encoder">type encoder struct</a>

```
searchKey: ascii85.encoder
```

```Go
type encoder struct {
	err  error
	w    io.Writer
	buf  [4]byte    // buffered data waiting to be encoded
	nbuf int        // number of bytes in buf
	out  [1024]byte // output buffer
}
```

#### <a id="encoder.Write" href="#encoder.Write">func (e *encoder) Write(p []byte) (n int, err error)</a>

```
searchKey: ascii85.encoder.Write
```

```Go
func (e *encoder) Write(p []byte) (n int, err error)
```

#### <a id="encoder.Close" href="#encoder.Close">func (e *encoder) Close() error</a>

```
searchKey: ascii85.encoder.Close
```

```Go
func (e *encoder) Close() error
```

Close flushes any pending output from the encoder. It is an error to call Write after calling Close. 

### <a id="CorruptInputError" href="#CorruptInputError">type CorruptInputError int64</a>

```
searchKey: ascii85.CorruptInputError
tags: [exported]
```

```Go
type CorruptInputError int64
```

#### <a id="CorruptInputError.Error" href="#CorruptInputError.Error">func (e CorruptInputError) Error() string</a>

```
searchKey: ascii85.CorruptInputError.Error
tags: [exported]
```

```Go
func (e CorruptInputError) Error() string
```

### <a id="decoder" href="#decoder">type decoder struct</a>

```
searchKey: ascii85.decoder
```

```Go
type decoder struct {
	err     error
	readErr error
	r       io.Reader
	buf     [1024]byte // leftover input
	nbuf    int
	out     []byte // leftover decoded output
	outbuf  [1024]byte
}
```

#### <a id="decoder.Read" href="#decoder.Read">func (d *decoder) Read(p []byte) (n int, err error)</a>

```
searchKey: ascii85.decoder.Read
```

```Go
func (d *decoder) Read(p []byte) (n int, err error)
```

### <a id="testpair" href="#testpair">type testpair struct</a>

```
searchKey: ascii85.testpair
```

```Go
type testpair struct {
	decoded, encoded string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="Encode" href="#Encode">func Encode(dst, src []byte) int</a>

```
searchKey: ascii85.Encode
tags: [exported]
```

```Go
func Encode(dst, src []byte) int
```

Encode encodes src into at most MaxEncodedLen(len(src)) bytes of dst, returning the actual number of bytes written. 

The encoding handles 4-byte chunks, using a special encoding for the last fragment, so Encode is not appropriate for use on individual blocks of a large data stream. Use NewEncoder() instead. 

Often, ascii85-encoded data is wrapped in <~ and ~> symbols. Encode does not add these. 

### <a id="MaxEncodedLen" href="#MaxEncodedLen">func MaxEncodedLen(n int) int</a>

```
searchKey: ascii85.MaxEncodedLen
tags: [exported]
```

```Go
func MaxEncodedLen(n int) int
```

MaxEncodedLen returns the maximum length of an encoding of n source bytes. 

### <a id="NewEncoder" href="#NewEncoder">func NewEncoder(w io.Writer) io.WriteCloser</a>

```
searchKey: ascii85.NewEncoder
tags: [exported]
```

```Go
func NewEncoder(w io.Writer) io.WriteCloser
```

NewEncoder returns a new ascii85 stream encoder. Data written to the returned writer will be encoded and then written to w. Ascii85 encodings operate in 32-bit blocks; when finished writing, the caller must Close the returned encoder to flush any trailing partial block. 

### <a id="Decode" href="#Decode">func Decode(dst, src []byte, flush bool) (ndst, nsrc int, err error)</a>

```
searchKey: ascii85.Decode
tags: [exported]
```

```Go
func Decode(dst, src []byte, flush bool) (ndst, nsrc int, err error)
```

Decode decodes src into dst, returning both the number of bytes written to dst and the number consumed from src. If src contains invalid ascii85 data, Decode will return the number of bytes successfully written and a CorruptInputError. Decode ignores space and control characters in src. Often, ascii85-encoded data is wrapped in <~ and ~> symbols. Decode expects these to have been stripped by the caller. 

If flush is true, Decode assumes that src represents the end of the input stream and processes it completely rather than wait for the completion of another 32-bit block. 

NewDecoder wraps an io.Reader interface around Decode. 

### <a id="NewDecoder" href="#NewDecoder">func NewDecoder(r io.Reader) io.Reader</a>

```
searchKey: ascii85.NewDecoder
tags: [exported]
```

```Go
func NewDecoder(r io.Reader) io.Reader
```

NewDecoder constructs a new ascii85 stream decoder. 

### <a id="testEqual" href="#testEqual">func testEqual(t *testing.T, msg string, args ...interface{}) bool</a>

```
searchKey: ascii85.testEqual
```

```Go
func testEqual(t *testing.T, msg string, args ...interface{}) bool
```

### <a id="strip85" href="#strip85">func strip85(s string) string</a>

```
searchKey: ascii85.strip85
```

```Go
func strip85(s string) string
```

### <a id="TestEncode" href="#TestEncode">func TestEncode(t *testing.T)</a>

```
searchKey: ascii85.TestEncode
```

```Go
func TestEncode(t *testing.T)
```

### <a id="TestEncoder" href="#TestEncoder">func TestEncoder(t *testing.T)</a>

```
searchKey: ascii85.TestEncoder
```

```Go
func TestEncoder(t *testing.T)
```

### <a id="TestEncoderBuffering" href="#TestEncoderBuffering">func TestEncoderBuffering(t *testing.T)</a>

```
searchKey: ascii85.TestEncoderBuffering
```

```Go
func TestEncoderBuffering(t *testing.T)
```

### <a id="TestDecode" href="#TestDecode">func TestDecode(t *testing.T)</a>

```
searchKey: ascii85.TestDecode
```

```Go
func TestDecode(t *testing.T)
```

### <a id="TestDecoder" href="#TestDecoder">func TestDecoder(t *testing.T)</a>

```
searchKey: ascii85.TestDecoder
```

```Go
func TestDecoder(t *testing.T)
```

### <a id="TestDecoderBuffering" href="#TestDecoderBuffering">func TestDecoderBuffering(t *testing.T)</a>

```
searchKey: ascii85.TestDecoderBuffering
```

```Go
func TestDecoderBuffering(t *testing.T)
```

### <a id="TestDecodeCorrupt" href="#TestDecodeCorrupt">func TestDecodeCorrupt(t *testing.T)</a>

```
searchKey: ascii85.TestDecodeCorrupt
```

```Go
func TestDecodeCorrupt(t *testing.T)
```

### <a id="TestBig" href="#TestBig">func TestBig(t *testing.T)</a>

```
searchKey: ascii85.TestBig
```

```Go
func TestBig(t *testing.T)
```

### <a id="TestDecoderInternalWhitespace" href="#TestDecoderInternalWhitespace">func TestDecoderInternalWhitespace(t *testing.T)</a>

```
searchKey: ascii85.TestDecoderInternalWhitespace
```

```Go
func TestDecoderInternalWhitespace(t *testing.T)
```

