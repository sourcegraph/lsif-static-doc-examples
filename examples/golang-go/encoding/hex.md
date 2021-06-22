# Package hex

Package hex implements hexadecimal encoding and decoding. 

## Index

* [Constants](#const)
    * [const hextable](#hextable)
    * [const bufferSize](#bufferSize)
* [Variables](#var)
    * [var ErrLength](#ErrLength)
    * [var encDecTests](#encDecTests)
    * [var errTests](#errTests)
    * [var expectedHexDump](#expectedHexDump)
    * [var sink](#sink)
* [Types](#type)
    * [type InvalidByteError byte](#InvalidByteError)
        * [func (e InvalidByteError) Error() string](#InvalidByteError.Error)
    * [type encoder struct](#encoder)
        * [func (e *encoder) Write(p []byte) (n int, err error)](#encoder.Write)
    * [type decoder struct](#decoder)
        * [func (d *decoder) Read(p []byte) (n int, err error)](#decoder.Read)
    * [type dumper struct](#dumper)
        * [func (h *dumper) Write(data []byte) (n int, err error)](#dumper.Write)
        * [func (h *dumper) Close() (err error)](#dumper.Close)
    * [type encDecTest struct](#encDecTest)
* [Functions](#func)
    * [func EncodedLen(n int) int](#EncodedLen)
    * [func Encode(dst, src []byte) int](#Encode)
    * [func DecodedLen(x int) int](#DecodedLen)
    * [func Decode(dst, src []byte) (int, error)](#Decode)
    * [func fromHexChar(c byte) (byte, bool)](#fromHexChar)
    * [func EncodeToString(src []byte) string](#EncodeToString)
    * [func DecodeString(s string) ([]byte, error)](#DecodeString)
    * [func Dump(data []byte) string](#Dump)
    * [func NewEncoder(w io.Writer) io.Writer](#NewEncoder)
    * [func NewDecoder(r io.Reader) io.Reader](#NewDecoder)
    * [func Dumper(w io.Writer) io.WriteCloser](#Dumper)
    * [func toChar(b byte) byte](#toChar)
    * [func TestEncode(t *testing.T)](#TestEncode)
    * [func TestDecode(t *testing.T)](#TestDecode)
    * [func TestEncodeToString(t *testing.T)](#TestEncodeToString)
    * [func TestDecodeString(t *testing.T)](#TestDecodeString)
    * [func TestDecodeErr(t *testing.T)](#TestDecodeErr)
    * [func TestDecodeStringErr(t *testing.T)](#TestDecodeStringErr)
    * [func TestEncoderDecoder(t *testing.T)](#TestEncoderDecoder)
    * [func TestDecoderErr(t *testing.T)](#TestDecoderErr)
    * [func TestDumper(t *testing.T)](#TestDumper)
    * [func TestDumper_doubleclose(t *testing.T)](#TestDumper_doubleclose)
    * [func TestDumper_earlyclose(t *testing.T)](#TestDumper_earlyclose)
    * [func TestDump(t *testing.T)](#TestDump)
    * [func BenchmarkEncode(b *testing.B)](#BenchmarkEncode)
    * [func BenchmarkDecode(b *testing.B)](#BenchmarkDecode)
    * [func BenchmarkDump(b *testing.B)](#BenchmarkDump)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="hextable" href="#hextable">const hextable</a>

```
searchKey: hex.hextable
```

```Go
const hextable = "0123456789abcdef"
```

### <a id="bufferSize" href="#bufferSize">const bufferSize</a>

```
searchKey: hex.bufferSize
```

```Go
const bufferSize = 1024
```

bufferSize is the number of hexadecimal characters to buffer in encoder and decoder. 

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="ErrLength" href="#ErrLength">var ErrLength</a>

```
searchKey: hex.ErrLength
tags: [exported]
```

```Go
var ErrLength = errors.New("encoding/hex: odd length hex string")
```

ErrLength reports an attempt to decode an odd-length input using Decode or DecodeString. The stream-based Decoder returns io.ErrUnexpectedEOF instead of ErrLength. 

### <a id="encDecTests" href="#encDecTests">var encDecTests</a>

```
searchKey: hex.encDecTests
```

```Go
var encDecTests = ...
```

### <a id="errTests" href="#errTests">var errTests</a>

```
searchKey: hex.errTests
```

```Go
var errTests = ...
```

### <a id="expectedHexDump" href="#expectedHexDump">var expectedHexDump</a>

```
searchKey: hex.expectedHexDump
```

```Go
var expectedHexDump = ...
```

### <a id="sink" href="#sink">var sink</a>

```
searchKey: hex.sink
```

```Go
var sink []byte
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="InvalidByteError" href="#InvalidByteError">type InvalidByteError byte</a>

```
searchKey: hex.InvalidByteError
tags: [exported]
```

```Go
type InvalidByteError byte
```

InvalidByteError values describe errors resulting from an invalid byte in a hex string. 

#### <a id="InvalidByteError.Error" href="#InvalidByteError.Error">func (e InvalidByteError) Error() string</a>

```
searchKey: hex.InvalidByteError.Error
tags: [exported]
```

```Go
func (e InvalidByteError) Error() string
```

### <a id="encoder" href="#encoder">type encoder struct</a>

```
searchKey: hex.encoder
```

```Go
type encoder struct {
	w   io.Writer
	err error
	out [bufferSize]byte // output buffer
}
```

#### <a id="encoder.Write" href="#encoder.Write">func (e *encoder) Write(p []byte) (n int, err error)</a>

```
searchKey: hex.encoder.Write
```

```Go
func (e *encoder) Write(p []byte) (n int, err error)
```

### <a id="decoder" href="#decoder">type decoder struct</a>

```
searchKey: hex.decoder
```

```Go
type decoder struct {
	r   io.Reader
	err error
	in  []byte           // input buffer (encoded form)
	arr [bufferSize]byte // backing array for in
}
```

#### <a id="decoder.Read" href="#decoder.Read">func (d *decoder) Read(p []byte) (n int, err error)</a>

```
searchKey: hex.decoder.Read
```

```Go
func (d *decoder) Read(p []byte) (n int, err error)
```

### <a id="dumper" href="#dumper">type dumper struct</a>

```
searchKey: hex.dumper
```

```Go
type dumper struct {
	w          io.Writer
	rightChars [18]byte
	buf        [14]byte
	used       int  // number of bytes in the current line
	n          uint // number of bytes, total
	closed     bool
}
```

#### <a id="dumper.Write" href="#dumper.Write">func (h *dumper) Write(data []byte) (n int, err error)</a>

```
searchKey: hex.dumper.Write
```

```Go
func (h *dumper) Write(data []byte) (n int, err error)
```

#### <a id="dumper.Close" href="#dumper.Close">func (h *dumper) Close() (err error)</a>

```
searchKey: hex.dumper.Close
```

```Go
func (h *dumper) Close() (err error)
```

### <a id="encDecTest" href="#encDecTest">type encDecTest struct</a>

```
searchKey: hex.encDecTest
```

```Go
type encDecTest struct {
	enc string
	dec []byte
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="EncodedLen" href="#EncodedLen">func EncodedLen(n int) int</a>

```
searchKey: hex.EncodedLen
tags: [exported]
```

```Go
func EncodedLen(n int) int
```

EncodedLen returns the length of an encoding of n source bytes. Specifically, it returns n * 2. 

### <a id="Encode" href="#Encode">func Encode(dst, src []byte) int</a>

```
searchKey: hex.Encode
tags: [exported]
```

```Go
func Encode(dst, src []byte) int
```

Encode encodes src into EncodedLen(len(src)) bytes of dst. As a convenience, it returns the number of bytes written to dst, but this value is always EncodedLen(len(src)). Encode implements hexadecimal encoding. 

### <a id="DecodedLen" href="#DecodedLen">func DecodedLen(x int) int</a>

```
searchKey: hex.DecodedLen
tags: [exported]
```

```Go
func DecodedLen(x int) int
```

DecodedLen returns the length of a decoding of x source bytes. Specifically, it returns x / 2. 

### <a id="Decode" href="#Decode">func Decode(dst, src []byte) (int, error)</a>

```
searchKey: hex.Decode
tags: [exported]
```

```Go
func Decode(dst, src []byte) (int, error)
```

Decode decodes src into DecodedLen(len(src)) bytes, returning the actual number of bytes written to dst. 

Decode expects that src contains only hexadecimal characters and that src has even length. If the input is malformed, Decode returns the number of bytes decoded before the error. 

### <a id="fromHexChar" href="#fromHexChar">func fromHexChar(c byte) (byte, bool)</a>

```
searchKey: hex.fromHexChar
```

```Go
func fromHexChar(c byte) (byte, bool)
```

fromHexChar converts a hex character into its value and a success flag. 

### <a id="EncodeToString" href="#EncodeToString">func EncodeToString(src []byte) string</a>

```
searchKey: hex.EncodeToString
tags: [exported]
```

```Go
func EncodeToString(src []byte) string
```

EncodeToString returns the hexadecimal encoding of src. 

### <a id="DecodeString" href="#DecodeString">func DecodeString(s string) ([]byte, error)</a>

```
searchKey: hex.DecodeString
tags: [exported]
```

```Go
func DecodeString(s string) ([]byte, error)
```

DecodeString returns the bytes represented by the hexadecimal string s. 

DecodeString expects that src contains only hexadecimal characters and that src has even length. If the input is malformed, DecodeString returns the bytes decoded before the error. 

### <a id="Dump" href="#Dump">func Dump(data []byte) string</a>

```
searchKey: hex.Dump
tags: [exported]
```

```Go
func Dump(data []byte) string
```

Dump returns a string that contains a hex dump of the given data. The format of the hex dump matches the output of `hexdump -C` on the command line. 

### <a id="NewEncoder" href="#NewEncoder">func NewEncoder(w io.Writer) io.Writer</a>

```
searchKey: hex.NewEncoder
tags: [exported]
```

```Go
func NewEncoder(w io.Writer) io.Writer
```

NewEncoder returns an io.Writer that writes lowercase hexadecimal characters to w. 

### <a id="NewDecoder" href="#NewDecoder">func NewDecoder(r io.Reader) io.Reader</a>

```
searchKey: hex.NewDecoder
tags: [exported]
```

```Go
func NewDecoder(r io.Reader) io.Reader
```

NewDecoder returns an io.Reader that decodes hexadecimal characters from r. NewDecoder expects that r contain only an even number of hexadecimal characters. 

### <a id="Dumper" href="#Dumper">func Dumper(w io.Writer) io.WriteCloser</a>

```
searchKey: hex.Dumper
tags: [exported]
```

```Go
func Dumper(w io.Writer) io.WriteCloser
```

Dumper returns a WriteCloser that writes a hex dump of all written data to w. The format of the dump matches the output of `hexdump -C` on the command line. 

### <a id="toChar" href="#toChar">func toChar(b byte) byte</a>

```
searchKey: hex.toChar
```

```Go
func toChar(b byte) byte
```

### <a id="TestEncode" href="#TestEncode">func TestEncode(t *testing.T)</a>

```
searchKey: hex.TestEncode
```

```Go
func TestEncode(t *testing.T)
```

### <a id="TestDecode" href="#TestDecode">func TestDecode(t *testing.T)</a>

```
searchKey: hex.TestDecode
```

```Go
func TestDecode(t *testing.T)
```

### <a id="TestEncodeToString" href="#TestEncodeToString">func TestEncodeToString(t *testing.T)</a>

```
searchKey: hex.TestEncodeToString
```

```Go
func TestEncodeToString(t *testing.T)
```

### <a id="TestDecodeString" href="#TestDecodeString">func TestDecodeString(t *testing.T)</a>

```
searchKey: hex.TestDecodeString
```

```Go
func TestDecodeString(t *testing.T)
```

### <a id="TestDecodeErr" href="#TestDecodeErr">func TestDecodeErr(t *testing.T)</a>

```
searchKey: hex.TestDecodeErr
```

```Go
func TestDecodeErr(t *testing.T)
```

### <a id="TestDecodeStringErr" href="#TestDecodeStringErr">func TestDecodeStringErr(t *testing.T)</a>

```
searchKey: hex.TestDecodeStringErr
```

```Go
func TestDecodeStringErr(t *testing.T)
```

### <a id="TestEncoderDecoder" href="#TestEncoderDecoder">func TestEncoderDecoder(t *testing.T)</a>

```
searchKey: hex.TestEncoderDecoder
```

```Go
func TestEncoderDecoder(t *testing.T)
```

### <a id="TestDecoderErr" href="#TestDecoderErr">func TestDecoderErr(t *testing.T)</a>

```
searchKey: hex.TestDecoderErr
```

```Go
func TestDecoderErr(t *testing.T)
```

### <a id="TestDumper" href="#TestDumper">func TestDumper(t *testing.T)</a>

```
searchKey: hex.TestDumper
```

```Go
func TestDumper(t *testing.T)
```

### <a id="TestDumper_doubleclose" href="#TestDumper_doubleclose">func TestDumper_doubleclose(t *testing.T)</a>

```
searchKey: hex.TestDumper_doubleclose
```

```Go
func TestDumper_doubleclose(t *testing.T)
```

### <a id="TestDumper_earlyclose" href="#TestDumper_earlyclose">func TestDumper_earlyclose(t *testing.T)</a>

```
searchKey: hex.TestDumper_earlyclose
```

```Go
func TestDumper_earlyclose(t *testing.T)
```

### <a id="TestDump" href="#TestDump">func TestDump(t *testing.T)</a>

```
searchKey: hex.TestDump
```

```Go
func TestDump(t *testing.T)
```

### <a id="BenchmarkEncode" href="#BenchmarkEncode">func BenchmarkEncode(b *testing.B)</a>

```
searchKey: hex.BenchmarkEncode
```

```Go
func BenchmarkEncode(b *testing.B)
```

### <a id="BenchmarkDecode" href="#BenchmarkDecode">func BenchmarkDecode(b *testing.B)</a>

```
searchKey: hex.BenchmarkDecode
```

```Go
func BenchmarkDecode(b *testing.B)
```

### <a id="BenchmarkDump" href="#BenchmarkDump">func BenchmarkDump(b *testing.B)</a>

```
searchKey: hex.BenchmarkDump
```

```Go
func BenchmarkDump(b *testing.B)
```

