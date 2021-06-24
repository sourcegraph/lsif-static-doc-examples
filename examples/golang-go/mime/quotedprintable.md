# Package quotedprintable

Package quotedprintable implements quoted-printable encoding as specified by RFC 2045. 

## Index

* [Constants](#const)
    * [const lineMaxLen](#lineMaxLen)
    * [const upperhex](#upperhex)
* [Variables](#var)
    * [var badSoftRx](#badSoftRx)
    * [var crlf](#crlf)
    * [var lf](#lf)
    * [var softSuffix](#softSuffix)
    * [var testMsg](#testMsg)
    * [var useQprint](#useQprint)
* [Types](#type)
    * [type Reader struct](#Reader)
        * [func NewReader(r io.Reader) *Reader](#NewReader)
        * [func (r *Reader) Read(p []byte) (n int, err error)](#Reader.Read)
    * [type Writer struct](#Writer)
        * [func NewWriter(w io.Writer) *Writer](#NewWriter)
        * [func (w *Writer) Close() error](#Writer.Close)
        * [func (w *Writer) Write(p []byte) (n int, err error)](#Writer.Write)
        * [func (w *Writer) checkLastByte() error](#Writer.checkLastByte)
        * [func (w *Writer) encode(b byte) error](#Writer.encode)
        * [func (w *Writer) flush() error](#Writer.flush)
        * [func (w *Writer) insertCRLF() error](#Writer.insertCRLF)
        * [func (w *Writer) insertSoftLineBreak() error](#Writer.insertSoftLineBreak)
        * [func (w *Writer) write(p []byte) error](#Writer.write)
* [Functions](#func)
    * [func BenchmarkWriter(b *testing.B)](#BenchmarkWriter)
    * [func TestExhaustive(t *testing.T)](#TestExhaustive)
    * [func TestReader(t *testing.T)](#TestReader)
    * [func TestRoundTrip(t *testing.T)](#TestRoundTrip)
    * [func TestWriter(t *testing.T)](#TestWriter)
    * [func TestWriterBinary(t *testing.T)](#TestWriterBinary)
    * [func everySequence(base, alpha string, length int, fn func(string))](#everySequence)
    * [func fromHex(b byte) (byte, error)](#fromHex)
    * [func isQPDiscardWhitespace(r rune) bool](#isQPDiscardWhitespace)
    * [func isWhitespace(b byte) bool](#isWhitespace)
    * [func readHexByte(v []byte) (b byte, err error)](#readHexByte)
    * [func testWriter(t *testing.T, binary bool)](#testWriter)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="lineMaxLen" href="#lineMaxLen">const lineMaxLen</a>

```
searchKey: quotedprintable.lineMaxLen
tags: [constant number private]
```

```Go
const lineMaxLen = 76
```

### <a id="upperhex" href="#upperhex">const upperhex</a>

```
searchKey: quotedprintable.upperhex
tags: [constant string private]
```

```Go
const upperhex = "0123456789ABCDEF"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="badSoftRx" href="#badSoftRx">var badSoftRx</a>

```
searchKey: quotedprintable.badSoftRx
tags: [variable struct private]
```

```Go
var badSoftRx = regexp.MustCompile(`=([^\r\n]+?\n)|([^\r\n]+$)|(\r$)|(\r[^\n]+\n)|( \r\n)`)
```

### <a id="crlf" href="#crlf">var crlf</a>

```
searchKey: quotedprintable.crlf
tags: [variable array number private]
```

```Go
var crlf = []byte("\r\n")
```

### <a id="lf" href="#lf">var lf</a>

```
searchKey: quotedprintable.lf
tags: [variable array number private]
```

```Go
var lf = []byte("\n")
```

### <a id="softSuffix" href="#softSuffix">var softSuffix</a>

```
searchKey: quotedprintable.softSuffix
tags: [variable array number private]
```

```Go
var softSuffix = []byte("=")
```

### <a id="testMsg" href="#testMsg">var testMsg</a>

```
searchKey: quotedprintable.testMsg
tags: [variable array number private]
```

```Go
var testMsg = ...
```

From [https://fr.wikipedia.org/wiki/Quoted-Printable](https://fr.wikipedia.org/wiki/Quoted-Printable) 

### <a id="useQprint" href="#useQprint">var useQprint</a>

```
searchKey: quotedprintable.useQprint
tags: [variable boolean private]
```

```Go
var useQprint = flag.Bool("qprint", false, "Compare against the 'qprint' program.")
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Reader" href="#Reader">type Reader struct</a>

```
searchKey: quotedprintable.Reader
tags: [struct]
```

```Go
type Reader struct {
	br   *bufio.Reader
	rerr error  // last read error
	line []byte // to be consumed before more of br
}
```

Reader is a quoted-printable decoder. 

#### <a id="NewReader" href="#NewReader">func NewReader(r io.Reader) *Reader</a>

```
searchKey: quotedprintable.NewReader
tags: [method]
```

```Go
func NewReader(r io.Reader) *Reader
```

NewReader returns a quoted-printable reader, decoding from r. 

#### <a id="Reader.Read" href="#Reader.Read">func (r *Reader) Read(p []byte) (n int, err error)</a>

```
searchKey: quotedprintable.Reader.Read
tags: [method]
```

```Go
func (r *Reader) Read(p []byte) (n int, err error)
```

Read reads and decodes quoted-printable data from the underlying reader. 

### <a id="Writer" href="#Writer">type Writer struct</a>

```
searchKey: quotedprintable.Writer
tags: [struct]
```

```Go
type Writer struct {
	// Binary mode treats the writer's input as pure binary and processes end of
	// line bytes as binary data.
	Binary bool

	w    io.Writer
	i    int
	line [78]byte
	cr   bool
}
```

A Writer is a quoted-printable writer that implements io.WriteCloser. 

#### <a id="NewWriter" href="#NewWriter">func NewWriter(w io.Writer) *Writer</a>

```
searchKey: quotedprintable.NewWriter
tags: [method]
```

```Go
func NewWriter(w io.Writer) *Writer
```

NewWriter returns a new Writer that writes to w. 

#### <a id="Writer.Close" href="#Writer.Close">func (w *Writer) Close() error</a>

```
searchKey: quotedprintable.Writer.Close
tags: [function]
```

```Go
func (w *Writer) Close() error
```

Close closes the Writer, flushing any unwritten data to the underlying io.Writer, but does not close the underlying io.Writer. 

#### <a id="Writer.Write" href="#Writer.Write">func (w *Writer) Write(p []byte) (n int, err error)</a>

```
searchKey: quotedprintable.Writer.Write
tags: [method]
```

```Go
func (w *Writer) Write(p []byte) (n int, err error)
```

Write encodes p using quoted-printable encoding and writes it to the underlying io.Writer. It limits line length to 76 characters. The encoded bytes are not necessarily flushed until the Writer is closed. 

#### <a id="Writer.checkLastByte" href="#Writer.checkLastByte">func (w *Writer) checkLastByte() error</a>

```
searchKey: quotedprintable.Writer.checkLastByte
tags: [function private]
```

```Go
func (w *Writer) checkLastByte() error
```

checkLastByte encodes the last buffered byte if it is a space or a tab. 

#### <a id="Writer.encode" href="#Writer.encode">func (w *Writer) encode(b byte) error</a>

```
searchKey: quotedprintable.Writer.encode
tags: [method private]
```

```Go
func (w *Writer) encode(b byte) error
```

#### <a id="Writer.flush" href="#Writer.flush">func (w *Writer) flush() error</a>

```
searchKey: quotedprintable.Writer.flush
tags: [function private]
```

```Go
func (w *Writer) flush() error
```

#### <a id="Writer.insertCRLF" href="#Writer.insertCRLF">func (w *Writer) insertCRLF() error</a>

```
searchKey: quotedprintable.Writer.insertCRLF
tags: [function private]
```

```Go
func (w *Writer) insertCRLF() error
```

#### <a id="Writer.insertSoftLineBreak" href="#Writer.insertSoftLineBreak">func (w *Writer) insertSoftLineBreak() error</a>

```
searchKey: quotedprintable.Writer.insertSoftLineBreak
tags: [function private]
```

```Go
func (w *Writer) insertSoftLineBreak() error
```

#### <a id="Writer.write" href="#Writer.write">func (w *Writer) write(p []byte) error</a>

```
searchKey: quotedprintable.Writer.write
tags: [method private]
```

```Go
func (w *Writer) write(p []byte) error
```

write limits text encoded in quoted-printable to 76 characters per line. 

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkWriter" href="#BenchmarkWriter">func BenchmarkWriter(b *testing.B)</a>

```
searchKey: quotedprintable.BenchmarkWriter
tags: [method private benchmark]
```

```Go
func BenchmarkWriter(b *testing.B)
```

### <a id="TestExhaustive" href="#TestExhaustive">func TestExhaustive(t *testing.T)</a>

```
searchKey: quotedprintable.TestExhaustive
tags: [method private test]
```

```Go
func TestExhaustive(t *testing.T)
```

### <a id="TestReader" href="#TestReader">func TestReader(t *testing.T)</a>

```
searchKey: quotedprintable.TestReader
tags: [method private test]
```

```Go
func TestReader(t *testing.T)
```

### <a id="TestRoundTrip" href="#TestRoundTrip">func TestRoundTrip(t *testing.T)</a>

```
searchKey: quotedprintable.TestRoundTrip
tags: [method private test]
```

```Go
func TestRoundTrip(t *testing.T)
```

### <a id="TestWriter" href="#TestWriter">func TestWriter(t *testing.T)</a>

```
searchKey: quotedprintable.TestWriter
tags: [method private test]
```

```Go
func TestWriter(t *testing.T)
```

### <a id="TestWriterBinary" href="#TestWriterBinary">func TestWriterBinary(t *testing.T)</a>

```
searchKey: quotedprintable.TestWriterBinary
tags: [method private test]
```

```Go
func TestWriterBinary(t *testing.T)
```

### <a id="everySequence" href="#everySequence">func everySequence(base, alpha string, length int, fn func(string))</a>

```
searchKey: quotedprintable.everySequence
tags: [method private]
```

```Go
func everySequence(base, alpha string, length int, fn func(string))
```

### <a id="fromHex" href="#fromHex">func fromHex(b byte) (byte, error)</a>

```
searchKey: quotedprintable.fromHex
tags: [method private]
```

```Go
func fromHex(b byte) (byte, error)
```

### <a id="isQPDiscardWhitespace" href="#isQPDiscardWhitespace">func isQPDiscardWhitespace(r rune) bool</a>

```
searchKey: quotedprintable.isQPDiscardWhitespace
tags: [method private]
```

```Go
func isQPDiscardWhitespace(r rune) bool
```

### <a id="isWhitespace" href="#isWhitespace">func isWhitespace(b byte) bool</a>

```
searchKey: quotedprintable.isWhitespace
tags: [method private]
```

```Go
func isWhitespace(b byte) bool
```

### <a id="readHexByte" href="#readHexByte">func readHexByte(v []byte) (b byte, err error)</a>

```
searchKey: quotedprintable.readHexByte
tags: [method private]
```

```Go
func readHexByte(v []byte) (b byte, err error)
```

### <a id="testWriter" href="#testWriter">func testWriter(t *testing.T, binary bool)</a>

```
searchKey: quotedprintable.testWriter
tags: [method private]
```

```Go
func testWriter(t *testing.T, binary bool)
```

