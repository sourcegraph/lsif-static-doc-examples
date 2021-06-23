# Package lzw

Package lzw implements the Lempel-Ziv-Welch compressed data format, described in T. A. Welch, `A Technique for High-Performance Data Compression', Computer, 17(6) (June 1984), pp 8-19. 

In particular, it implements LZW as used by the GIF and PDF file formats, which means variable-width codes up to 12 bits and the first two non-literal codes are a clear code and an EOF code. 

The TIFF file format uses a similar but incompatible version of the LZW algorithm. See the golang.org/x/image/tiff/lzw package for an implementation. 

## Index

* [Constants](#const)
    * [const LSB](#LSB)
    * [const MSB](#MSB)
    * [const maxWidth](#maxWidth)
    * [const decoderInvalidCode](#decoderInvalidCode)
    * [const flushBuffer](#flushBuffer)
    * [const maxCode](#maxCode)
    * [const invalidCode](#invalidCode)
    * [const tableSize](#tableSize)
    * [const tableMask](#tableMask)
    * [const invalidEntry](#invalidEntry)
* [Variables](#var)
    * [var errClosed](#errClosed)
    * [var errOutOfCodes](#errOutOfCodes)
    * [var lzwTests](#lzwTests)
    * [var filenames](#filenames)
* [Types](#type)
    * [type Order int](#Order)
    * [type Reader struct](#Reader)
        * [func newReader(src io.Reader, order Order, litWidth int) *Reader](#newReader)
        * [func (r *Reader) readLSB() (uint16, error)](#Reader.readLSB)
        * [func (r *Reader) readMSB() (uint16, error)](#Reader.readMSB)
        * [func (r *Reader) Read(b []byte) (int, error)](#Reader.Read)
        * [func (r *Reader) decode()](#Reader.decode)
        * [func (r *Reader) Close() error](#Reader.Close)
        * [func (r *Reader) Reset(src io.Reader, order Order, litWidth int)](#Reader.Reset)
        * [func (r *Reader) init(src io.Reader, order Order, litWidth int)](#Reader.init.reader.go)
    * [type writer interface](#writer)
    * [type Writer struct](#Writer)
        * [func newWriter(dst io.Writer, order Order, litWidth int) *Writer](#newWriter)
        * [func (w *Writer) writeLSB(c uint32) error](#Writer.writeLSB)
        * [func (w *Writer) writeMSB(c uint32) error](#Writer.writeMSB)
        * [func (w *Writer) incHi() error](#Writer.incHi)
        * [func (w *Writer) Write(p []byte) (n int, err error)](#Writer.Write)
        * [func (w *Writer) Close() error](#Writer.Close)
        * [func (w *Writer) Reset(dst io.Writer, order Order, litWidth int)](#Writer.Reset)
        * [func (w *Writer) init(dst io.Writer, order Order, litWidth int)](#Writer.init.writer.go)
    * [type lzwTest struct](#lzwTest)
    * [type devZero struct{}](#devZero)
        * [func (devZero) Read(p []byte) (int, error)](#devZero.Read)
* [Functions](#func)
    * [func NewReader(r io.Reader, order Order, litWidth int) io.ReadCloser](#NewReader)
    * [func NewWriter(w io.Writer, order Order, litWidth int) io.WriteCloser](#NewWriter)
    * [func TestReader(t *testing.T)](#TestReader)
    * [func TestReaderReset(t *testing.T)](#TestReaderReset)
    * [func TestHiCodeDoesNotOverflow(t *testing.T)](#TestHiCodeDoesNotOverflow)
    * [func TestNoLongerSavingPriorExpansions(t *testing.T)](#TestNoLongerSavingPriorExpansions)
    * [func BenchmarkDecoder(b *testing.B)](#BenchmarkDecoder)
    * [func testFile(t *testing.T, fn string, order Order, litWidth int)](#testFile)
    * [func TestWriter(t *testing.T)](#TestWriter)
    * [func TestWriterReset(t *testing.T)](#TestWriterReset)
    * [func TestWriterReturnValues(t *testing.T)](#TestWriterReturnValues)
    * [func TestSmallLitWidth(t *testing.T)](#TestSmallLitWidth)
    * [func BenchmarkEncoder(b *testing.B)](#BenchmarkEncoder)


## <a id="const" href="#const">Constants</a>

### <a id="LSB" href="#LSB">const LSB</a>

```
searchKey: lzw.LSB
```

```Go
const LSB Order = iota
```

LSB means Least Significant Bits first, as used in the GIF file format. 

### <a id="MSB" href="#MSB">const MSB</a>

```
searchKey: lzw.MSB
```

```Go
const MSB
```

MSB means Most Significant Bits first, as used in the TIFF and PDF file formats. 

### <a id="maxWidth" href="#maxWidth">const maxWidth</a>

```
searchKey: lzw.maxWidth
tags: [private]
```

```Go
const maxWidth = 12
```

### <a id="decoderInvalidCode" href="#decoderInvalidCode">const decoderInvalidCode</a>

```
searchKey: lzw.decoderInvalidCode
tags: [private]
```

```Go
const decoderInvalidCode = 0xffff
```

### <a id="flushBuffer" href="#flushBuffer">const flushBuffer</a>

```
searchKey: lzw.flushBuffer
tags: [private]
```

```Go
const flushBuffer = 1 << maxWidth
```

### <a id="maxCode" href="#maxCode">const maxCode</a>

```
searchKey: lzw.maxCode
tags: [private]
```

```Go
const maxCode = 1<<12 - 1
```

A code is a 12 bit value, stored as a uint32 when encoding to avoid type conversions when shifting bits. 

### <a id="invalidCode" href="#invalidCode">const invalidCode</a>

```
searchKey: lzw.invalidCode
tags: [private]
```

```Go
const invalidCode = 1<<32 - 1
```

### <a id="tableSize" href="#tableSize">const tableSize</a>

```
searchKey: lzw.tableSize
tags: [private]
```

```Go
const tableSize = 4 * 1 << 12
```

There are 1<<12 possible codes, which is an upper bound on the number of valid hash table entries at any given point in time. tableSize is 4x that. 

### <a id="tableMask" href="#tableMask">const tableMask</a>

```
searchKey: lzw.tableMask
tags: [private]
```

```Go
const tableMask = tableSize - 1
```

### <a id="invalidEntry" href="#invalidEntry">const invalidEntry</a>

```
searchKey: lzw.invalidEntry
tags: [private]
```

```Go
const invalidEntry = 0
```

A hash table entry is a uint32. Zero is an invalid entry since the lower 12 bits of a valid entry must be a non-literal code. 

## <a id="var" href="#var">Variables</a>

### <a id="errClosed" href="#errClosed">var errClosed</a>

```
searchKey: lzw.errClosed
tags: [private]
```

```Go
var errClosed = errors.New("lzw: reader/writer is closed")
```

### <a id="errOutOfCodes" href="#errOutOfCodes">var errOutOfCodes</a>

```
searchKey: lzw.errOutOfCodes
tags: [private]
```

```Go
var errOutOfCodes = errors.New("lzw: out of codes")
```

errOutOfCodes is an internal error that means that the writer has run out of unused codes and a clear code needs to be sent next. 

### <a id="lzwTests" href="#lzwTests">var lzwTests</a>

```
searchKey: lzw.lzwTests
tags: [private]
```

```Go
var lzwTests = ...
```

### <a id="filenames" href="#filenames">var filenames</a>

```
searchKey: lzw.filenames
tags: [private]
```

```Go
var filenames = ...
```

## <a id="type" href="#type">Types</a>

### <a id="Order" href="#Order">type Order int</a>

```
searchKey: lzw.Order
```

```Go
type Order int
```

Order specifies the bit ordering in an LZW data stream. 

### <a id="Reader" href="#Reader">type Reader struct</a>

```
searchKey: lzw.Reader
```

```Go
type Reader struct {
	r        io.ByteReader
	bits     uint32
	nBits    uint
	width    uint
	read     func(*Reader) (uint16, error) // readLSB or readMSB
	litWidth int                           // width in bits of literal codes
	err      error

	// The first 1<<litWidth codes are literal codes.
	// The next two codes mean clear and EOF.
	// Other valid codes are in the range [lo, hi] where lo := clear + 2,
	// with the upper bound incrementing on each code seen.
	//
	// overflow is the code at which hi overflows the code width. It always
	// equals 1 << width.
	//
	// last is the most recently seen code, or decoderInvalidCode.
	//
	// An invariant is that hi < overflow.
	clear, eof, hi, overflow, last uint16

	// Each code c in [lo, hi] expands to two or more bytes. For c != hi:
	//   suffix[c] is the last of these bytes.
	//   prefix[c] is the code for all but the last byte.
	//   This code can either be a literal code or another code in [lo, c).
	// The c == hi case is a special case.
	suffix [1 << maxWidth]uint8
	prefix [1 << maxWidth]uint16

	// output is the temporary output buffer.
	// Literal codes are accumulated from the start of the buffer.
	// Non-literal codes decode to a sequence of suffixes that are first
	// written right-to-left from the end of the buffer before being copied
	// to the start of the buffer.
	// It is flushed when it contains >= 1<<maxWidth bytes,
	// so that there is always room to decode an entire code.
	output [2 * 1 << maxWidth]byte
	o      int    // write index into output
	toRead []byte // bytes to return from Read
}
```

Reader is an io.Reader which can be used to read compressed data in the LZW format. 

#### <a id="newReader" href="#newReader">func newReader(src io.Reader, order Order, litWidth int) *Reader</a>

```
searchKey: lzw.newReader
tags: [private]
```

```Go
func newReader(src io.Reader, order Order, litWidth int) *Reader
```

#### <a id="Reader.readLSB" href="#Reader.readLSB">func (r *Reader) readLSB() (uint16, error)</a>

```
searchKey: lzw.Reader.readLSB
tags: [private]
```

```Go
func (r *Reader) readLSB() (uint16, error)
```

readLSB returns the next code for "Least Significant Bits first" data. 

#### <a id="Reader.readMSB" href="#Reader.readMSB">func (r *Reader) readMSB() (uint16, error)</a>

```
searchKey: lzw.Reader.readMSB
tags: [private]
```

```Go
func (r *Reader) readMSB() (uint16, error)
```

readMSB returns the next code for "Most Significant Bits first" data. 

#### <a id="Reader.Read" href="#Reader.Read">func (r *Reader) Read(b []byte) (int, error)</a>

```
searchKey: lzw.Reader.Read
```

```Go
func (r *Reader) Read(b []byte) (int, error)
```

Read implements io.Reader, reading uncompressed bytes from its underlying Reader. 

#### <a id="Reader.decode" href="#Reader.decode">func (r *Reader) decode()</a>

```
searchKey: lzw.Reader.decode
tags: [private]
```

```Go
func (r *Reader) decode()
```

decode decompresses bytes from r and leaves them in d.toRead. read specifies how to decode bytes into codes. litWidth is the width in bits of literal codes. 

#### <a id="Reader.Close" href="#Reader.Close">func (r *Reader) Close() error</a>

```
searchKey: lzw.Reader.Close
```

```Go
func (r *Reader) Close() error
```

Close closes the Reader and returns an error for any future read operation. It does not close the underlying io.Reader. 

#### <a id="Reader.Reset" href="#Reader.Reset">func (r *Reader) Reset(src io.Reader, order Order, litWidth int)</a>

```
searchKey: lzw.Reader.Reset
```

```Go
func (r *Reader) Reset(src io.Reader, order Order, litWidth int)
```

Reset clears the Reader's state and allows it to be reused again as a new Reader. 

#### <a id="Reader.init.reader.go" href="#Reader.init.reader.go">func (r *Reader) init(src io.Reader, order Order, litWidth int)</a>

```
searchKey: lzw.Reader.init
tags: [private]
```

```Go
func (r *Reader) init(src io.Reader, order Order, litWidth int)
```

### <a id="writer" href="#writer">type writer interface</a>

```
searchKey: lzw.writer
tags: [private]
```

```Go
type writer interface {
	io.ByteWriter
	Flush() error
}
```

A writer is a buffered, flushable writer. 

### <a id="Writer" href="#Writer">type Writer struct</a>

```
searchKey: lzw.Writer
```

```Go
type Writer struct {
	// w is the writer that compressed bytes are written to.
	w writer
	// order, write, bits, nBits and width are the state for
	// converting a code stream into a byte stream.
	order Order
	write func(*Writer, uint32) error
	bits  uint32
	nBits uint
	width uint
	// litWidth is the width in bits of literal codes.
	litWidth uint
	// hi is the code implied by the next code emission.
	// overflow is the code at which hi overflows the code width.
	hi, overflow uint32
	// savedCode is the accumulated code at the end of the most recent Write
	// call. It is equal to invalidCode if there was no such call.
	savedCode uint32
	// err is the first error encountered during writing. Closing the writer
	// will make any future Write calls return errClosed
	err error
	// table is the hash table from 20-bit keys to 12-bit values. Each table
	// entry contains key<<12|val and collisions resolve by linear probing.
	// The keys consist of a 12-bit code prefix and an 8-bit byte suffix.
	// The values are a 12-bit code.
	table [tableSize]uint32
}
```

Writer is an LZW compressor. It writes the compressed form of the data to an underlying writer (see NewWriter). 

#### <a id="newWriter" href="#newWriter">func newWriter(dst io.Writer, order Order, litWidth int) *Writer</a>

```
searchKey: lzw.newWriter
tags: [private]
```

```Go
func newWriter(dst io.Writer, order Order, litWidth int) *Writer
```

#### <a id="Writer.writeLSB" href="#Writer.writeLSB">func (w *Writer) writeLSB(c uint32) error</a>

```
searchKey: lzw.Writer.writeLSB
tags: [private]
```

```Go
func (w *Writer) writeLSB(c uint32) error
```

writeLSB writes the code c for "Least Significant Bits first" data. 

#### <a id="Writer.writeMSB" href="#Writer.writeMSB">func (w *Writer) writeMSB(c uint32) error</a>

```
searchKey: lzw.Writer.writeMSB
tags: [private]
```

```Go
func (w *Writer) writeMSB(c uint32) error
```

writeMSB writes the code c for "Most Significant Bits first" data. 

#### <a id="Writer.incHi" href="#Writer.incHi">func (w *Writer) incHi() error</a>

```
searchKey: lzw.Writer.incHi
tags: [private]
```

```Go
func (w *Writer) incHi() error
```

incHi increments e.hi and checks for both overflow and running out of unused codes. In the latter case, incHi sends a clear code, resets the writer state and returns errOutOfCodes. 

#### <a id="Writer.Write" href="#Writer.Write">func (w *Writer) Write(p []byte) (n int, err error)</a>

```
searchKey: lzw.Writer.Write
```

```Go
func (w *Writer) Write(p []byte) (n int, err error)
```

Write writes a compressed representation of p to w's underlying writer. 

#### <a id="Writer.Close" href="#Writer.Close">func (w *Writer) Close() error</a>

```
searchKey: lzw.Writer.Close
```

```Go
func (w *Writer) Close() error
```

Close closes the Writer, flushing any pending output. It does not close w's underlying writer. 

#### <a id="Writer.Reset" href="#Writer.Reset">func (w *Writer) Reset(dst io.Writer, order Order, litWidth int)</a>

```
searchKey: lzw.Writer.Reset
```

```Go
func (w *Writer) Reset(dst io.Writer, order Order, litWidth int)
```

Reset clears the Writer's state and allows it to be reused again as a new Writer. 

#### <a id="Writer.init.writer.go" href="#Writer.init.writer.go">func (w *Writer) init(dst io.Writer, order Order, litWidth int)</a>

```
searchKey: lzw.Writer.init
tags: [private]
```

```Go
func (w *Writer) init(dst io.Writer, order Order, litWidth int)
```

### <a id="lzwTest" href="#lzwTest">type lzwTest struct</a>

```
searchKey: lzw.lzwTest
tags: [private]
```

```Go
type lzwTest struct {
	desc       string
	raw        string
	compressed string
	err        error
}
```

### <a id="devZero" href="#devZero">type devZero struct{}</a>

```
searchKey: lzw.devZero
tags: [private]
```

```Go
type devZero struct{}
```

#### <a id="devZero.Read" href="#devZero.Read">func (devZero) Read(p []byte) (int, error)</a>

```
searchKey: lzw.devZero.Read
tags: [private]
```

```Go
func (devZero) Read(p []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="NewReader" href="#NewReader">func NewReader(r io.Reader, order Order, litWidth int) io.ReadCloser</a>

```
searchKey: lzw.NewReader
```

```Go
func NewReader(r io.Reader, order Order, litWidth int) io.ReadCloser
```

NewReader creates a new io.ReadCloser. Reads from the returned io.ReadCloser read and decompress data from r. If r does not also implement io.ByteReader, the decompressor may read more data than necessary from r. It is the caller's responsibility to call Close on the ReadCloser when finished reading. The number of bits to use for literal codes, litWidth, must be in the range [2,8] and is typically 8. It must equal the litWidth used during compression. 

It is guaranteed that the underlying type of the returned io.ReadCloser is a *Reader. 

### <a id="NewWriter" href="#NewWriter">func NewWriter(w io.Writer, order Order, litWidth int) io.WriteCloser</a>

```
searchKey: lzw.NewWriter
```

```Go
func NewWriter(w io.Writer, order Order, litWidth int) io.WriteCloser
```

NewWriter creates a new io.WriteCloser. Writes to the returned io.WriteCloser are compressed and written to w. It is the caller's responsibility to call Close on the WriteCloser when finished writing. The number of bits to use for literal codes, litWidth, must be in the range [2,8] and is typically 8. Input bytes must be less than 1<<litWidth. 

It is guaranteed that the underlying type of the returned io.WriteCloser is a *Writer. 

### <a id="TestReader" href="#TestReader">func TestReader(t *testing.T)</a>

```
searchKey: lzw.TestReader
tags: [private]
```

```Go
func TestReader(t *testing.T)
```

### <a id="TestReaderReset" href="#TestReaderReset">func TestReaderReset(t *testing.T)</a>

```
searchKey: lzw.TestReaderReset
tags: [private]
```

```Go
func TestReaderReset(t *testing.T)
```

### <a id="TestHiCodeDoesNotOverflow" href="#TestHiCodeDoesNotOverflow">func TestHiCodeDoesNotOverflow(t *testing.T)</a>

```
searchKey: lzw.TestHiCodeDoesNotOverflow
tags: [private]
```

```Go
func TestHiCodeDoesNotOverflow(t *testing.T)
```

### <a id="TestNoLongerSavingPriorExpansions" href="#TestNoLongerSavingPriorExpansions">func TestNoLongerSavingPriorExpansions(t *testing.T)</a>

```
searchKey: lzw.TestNoLongerSavingPriorExpansions
tags: [private]
```

```Go
func TestNoLongerSavingPriorExpansions(t *testing.T)
```

TestNoLongerSavingPriorExpansions tests the decoder state when codes other than clear codes continue to be seen after decoder.hi and decoder.width reach their maximum values (4095 and 12), i.e. after we no longer save prior expansions. In particular, it tests seeing the highest possible code, 4095. 

### <a id="BenchmarkDecoder" href="#BenchmarkDecoder">func BenchmarkDecoder(b *testing.B)</a>

```
searchKey: lzw.BenchmarkDecoder
tags: [private]
```

```Go
func BenchmarkDecoder(b *testing.B)
```

### <a id="testFile" href="#testFile">func testFile(t *testing.T, fn string, order Order, litWidth int)</a>

```
searchKey: lzw.testFile
tags: [private]
```

```Go
func testFile(t *testing.T, fn string, order Order, litWidth int)
```

testFile tests that compressing and then decompressing the given file with the given options yields equivalent bytes to the original file. 

### <a id="TestWriter" href="#TestWriter">func TestWriter(t *testing.T)</a>

```
searchKey: lzw.TestWriter
tags: [private]
```

```Go
func TestWriter(t *testing.T)
```

### <a id="TestWriterReset" href="#TestWriterReset">func TestWriterReset(t *testing.T)</a>

```
searchKey: lzw.TestWriterReset
tags: [private]
```

```Go
func TestWriterReset(t *testing.T)
```

### <a id="TestWriterReturnValues" href="#TestWriterReturnValues">func TestWriterReturnValues(t *testing.T)</a>

```
searchKey: lzw.TestWriterReturnValues
tags: [private]
```

```Go
func TestWriterReturnValues(t *testing.T)
```

### <a id="TestSmallLitWidth" href="#TestSmallLitWidth">func TestSmallLitWidth(t *testing.T)</a>

```
searchKey: lzw.TestSmallLitWidth
tags: [private]
```

```Go
func TestSmallLitWidth(t *testing.T)
```

### <a id="BenchmarkEncoder" href="#BenchmarkEncoder">func BenchmarkEncoder(b *testing.B)</a>

```
searchKey: lzw.BenchmarkEncoder
tags: [private]
```

```Go
func BenchmarkEncoder(b *testing.B)
```

