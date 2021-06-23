# Package quotedprintable

Package quotedprintable implements quoted-printable encoding as specified by RFC 2045. 

## Index

* [Constants](#const)
    * [const lineMaxLen](#lineMaxLen)
    * [const upperhex](#upperhex)
* [Variables](#var)
    * [var crlf](#crlf)
    * [var lf](#lf)
    * [var softSuffix](#softSuffix)
    * [var useQprint](#useQprint)
    * [var badSoftRx](#badSoftRx)
    * [var testMsg](#testMsg)
* [Types](#type)
    * [type Reader struct](#Reader)
        * [func NewReader(r io.Reader) *Reader](#NewReader)
        * [func (r *Reader) Read(p []byte) (n int, err error)](#Reader.Read)
    * [type Writer struct](#Writer)
        * [func NewWriter(w io.Writer) *Writer](#NewWriter)
        * [func (w *Writer) Write(p []byte) (n int, err error)](#Writer.Write)
        * [func (w *Writer) Close() error](#Writer.Close)
        * [func (w *Writer) write(p []byte) error](#Writer.write)
        * [func (w *Writer) encode(b byte) error](#Writer.encode)
        * [func (w *Writer) checkLastByte() error](#Writer.checkLastByte)
        * [func (w *Writer) insertSoftLineBreak() error](#Writer.insertSoftLineBreak)
        * [func (w *Writer) insertCRLF() error](#Writer.insertCRLF)
        * [func (w *Writer) flush() error](#Writer.flush)
* [Functions](#func)
    * [func fromHex(b byte) (byte, error)](#fromHex)
    * [func readHexByte(v []byte) (b byte, err error)](#readHexByte)
    * [func isQPDiscardWhitespace(r rune) bool](#isQPDiscardWhitespace)
    * [func isWhitespace(b byte) bool](#isWhitespace)
    * [func TestReader(t *testing.T)](#TestReader)
    * [func everySequence(base, alpha string, length int, fn func(string))](#everySequence)
    * [func TestExhaustive(t *testing.T)](#TestExhaustive)
    * [func TestWriter(t *testing.T)](#TestWriter)
    * [func TestWriterBinary(t *testing.T)](#TestWriterBinary)
    * [func testWriter(t *testing.T, binary bool)](#testWriter)
    * [func TestRoundTrip(t *testing.T)](#TestRoundTrip)
    * [func BenchmarkWriter(b *testing.B)](#BenchmarkWriter)


## <a id="const" href="#const">Constants</a>

### <a id="lineMaxLen" href="#lineMaxLen">const lineMaxLen</a>

```
searchKey: quotedprintable.lineMaxLen
tags: [private]
```

```Go
const lineMaxLen = 76
```

### <a id="upperhex" href="#upperhex">const upperhex</a>

```
searchKey: quotedprintable.upperhex
tags: [private]
```

```Go
const upperhex = "0123456789ABCDEF"
```

## <a id="var" href="#var">Variables</a>

### <a id="crlf" href="#crlf">var crlf</a>

```
searchKey: quotedprintable.crlf
tags: [private]
```

```Go
var crlf = []byte("\r\n")
```

### <a id="lf" href="#lf">var lf</a>

```
searchKey: quotedprintable.lf
tags: [private]
```

```Go
var lf = []byte("\n")
```

### <a id="softSuffix" href="#softSuffix">var softSuffix</a>

```
searchKey: quotedprintable.softSuffix
tags: [private]
```

```Go
var softSuffix = []byte("=")
```

### <a id="useQprint" href="#useQprint">var useQprint</a>

```
searchKey: quotedprintable.useQprint
tags: [private]
```

```Go
var useQprint = flag.Bool("qprint", false, "Compare against the 'qprint' program.")
```

### <a id="badSoftRx" href="#badSoftRx">var badSoftRx</a>

```
searchKey: quotedprintable.badSoftRx
tags: [private]
```

```Go
var badSoftRx = regexp.MustCompile(`=([^\r\n]+?\n)|([^\r\n]+$)|(\r$)|(\r[^\n]+\n)|( \r\n)`)
```

### <a id="testMsg" href="#testMsg">var testMsg</a>

```
searchKey: quotedprintable.testMsg
tags: [private]
```

```Go
var testMsg = ...
```

From [https://fr.wikipedia.org/wiki/Quoted-Printable](https://fr.wikipedia.org/wiki/Quoted-Printable) 

## <a id="type" href="#type">Types</a>

### <a id="Reader" href="#Reader">type Reader struct</a>

```
searchKey: quotedprintable.Reader
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
```

```Go
func NewReader(r io.Reader) *Reader
```

NewReader returns a quoted-printable reader, decoding from r. 

#### <a id="Reader.Read" href="#Reader.Read">func (r *Reader) Read(p []byte) (n int, err error)</a>

```
searchKey: quotedprintable.Reader.Read
```

```Go
func (r *Reader) Read(p []byte) (n int, err error)
```

Read reads and decodes quoted-printable data from the underlying reader. 

### <a id="Writer" href="#Writer">type Writer struct</a>

```
searchKey: quotedprintable.Writer
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
```

```Go
func NewWriter(w io.Writer) *Writer
```

NewWriter returns a new Writer that writes to w. 

#### <a id="Writer.Write" href="#Writer.Write">func (w *Writer) Write(p []byte) (n int, err error)</a>

```
searchKey: quotedprintable.Writer.Write
```

```Go
func (w *Writer) Write(p []byte) (n int, err error)
```

Write encodes p using quoted-printable encoding and writes it to the underlying io.Writer. It limits line length to 76 characters. The encoded bytes are not necessarily flushed until the Writer is closed. 

#### <a id="Writer.Close" href="#Writer.Close">func (w *Writer) Close() error</a>

```
searchKey: quotedprintable.Writer.Close
```

```Go
func (w *Writer) Close() error
```

Close closes the Writer, flushing any unwritten data to the underlying io.Writer, but does not close the underlying io.Writer. 

#### <a id="Writer.write" href="#Writer.write">func (w *Writer) write(p []byte) error</a>

```
searchKey: quotedprintable.Writer.write
tags: [private]
```

```Go
func (w *Writer) write(p []byte) error
```

write limits text encoded in quoted-printable to 76 characters per line. 

#### <a id="Writer.encode" href="#Writer.encode">func (w *Writer) encode(b byte) error</a>

```
searchKey: quotedprintable.Writer.encode
tags: [private]
```

```Go
func (w *Writer) encode(b byte) error
```

#### <a id="Writer.checkLastByte" href="#Writer.checkLastByte">func (w *Writer) checkLastByte() error</a>

```
searchKey: quotedprintable.Writer.checkLastByte
tags: [private]
```

```Go
func (w *Writer) checkLastByte() error
```

checkLastByte encodes the last buffered byte if it is a space or a tab. 

#### <a id="Writer.insertSoftLineBreak" href="#Writer.insertSoftLineBreak">func (w *Writer) insertSoftLineBreak() error</a>

```
searchKey: quotedprintable.Writer.insertSoftLineBreak
tags: [private]
```

```Go
func (w *Writer) insertSoftLineBreak() error
```

#### <a id="Writer.insertCRLF" href="#Writer.insertCRLF">func (w *Writer) insertCRLF() error</a>

```
searchKey: quotedprintable.Writer.insertCRLF
tags: [private]
```

```Go
func (w *Writer) insertCRLF() error
```

#### <a id="Writer.flush" href="#Writer.flush">func (w *Writer) flush() error</a>

```
searchKey: quotedprintable.Writer.flush
tags: [private]
```

```Go
func (w *Writer) flush() error
```

## <a id="func" href="#func">Functions</a>

### <a id="fromHex" href="#fromHex">func fromHex(b byte) (byte, error)</a>

```
searchKey: quotedprintable.fromHex
tags: [private]
```

```Go
func fromHex(b byte) (byte, error)
```

### <a id="readHexByte" href="#readHexByte">func readHexByte(v []byte) (b byte, err error)</a>

```
searchKey: quotedprintable.readHexByte
tags: [private]
```

```Go
func readHexByte(v []byte) (b byte, err error)
```

### <a id="isQPDiscardWhitespace" href="#isQPDiscardWhitespace">func isQPDiscardWhitespace(r rune) bool</a>

```
searchKey: quotedprintable.isQPDiscardWhitespace
tags: [private]
```

```Go
func isQPDiscardWhitespace(r rune) bool
```

### <a id="isWhitespace" href="#isWhitespace">func isWhitespace(b byte) bool</a>

```
searchKey: quotedprintable.isWhitespace
tags: [private]
```

```Go
func isWhitespace(b byte) bool
```

### <a id="TestReader" href="#TestReader">func TestReader(t *testing.T)</a>

```
searchKey: quotedprintable.TestReader
tags: [private]
```

```Go
func TestReader(t *testing.T)
```

### <a id="everySequence" href="#everySequence">func everySequence(base, alpha string, length int, fn func(string))</a>

```
searchKey: quotedprintable.everySequence
tags: [private]
```

```Go
func everySequence(base, alpha string, length int, fn func(string))
```

### <a id="TestExhaustive" href="#TestExhaustive">func TestExhaustive(t *testing.T)</a>

```
searchKey: quotedprintable.TestExhaustive
tags: [private]
```

```Go
func TestExhaustive(t *testing.T)
```

### <a id="TestWriter" href="#TestWriter">func TestWriter(t *testing.T)</a>

```
searchKey: quotedprintable.TestWriter
tags: [private]
```

```Go
func TestWriter(t *testing.T)
```

### <a id="TestWriterBinary" href="#TestWriterBinary">func TestWriterBinary(t *testing.T)</a>

```
searchKey: quotedprintable.TestWriterBinary
tags: [private]
```

```Go
func TestWriterBinary(t *testing.T)
```

### <a id="testWriter" href="#testWriter">func testWriter(t *testing.T, binary bool)</a>

```
searchKey: quotedprintable.testWriter
tags: [private]
```

```Go
func testWriter(t *testing.T, binary bool)
```

### <a id="TestRoundTrip" href="#TestRoundTrip">func TestRoundTrip(t *testing.T)</a>

```
searchKey: quotedprintable.TestRoundTrip
tags: [private]
```

```Go
func TestRoundTrip(t *testing.T)
```

### <a id="BenchmarkWriter" href="#BenchmarkWriter">func BenchmarkWriter(b *testing.B)</a>

```
searchKey: quotedprintable.BenchmarkWriter
tags: [private]
```

```Go
func BenchmarkWriter(b *testing.B)
```

