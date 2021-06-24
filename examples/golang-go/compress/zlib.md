# Package zlib

Package zlib implements reading and writing of zlib format compressed data, as specified in RFC 1950. 

The implementation provides filters that uncompress during reading and compress during writing.  For example, to write compressed data to a buffer: 

```
var b bytes.Buffer
w := zlib.NewWriter(&b)
w.Write([]byte("hello, world\n"))
w.Close()

```
and to read that data back: 

```
r, err := zlib.NewReader(&b)
io.Copy(os.Stdout, r)
r.Close()

```
## Index

* [Constants](#const)
    * [const BestCompression](#BestCompression)
    * [const BestSpeed](#BestSpeed)
    * [const DefaultCompression](#DefaultCompression)
    * [const HuffmanOnly](#HuffmanOnly)
    * [const NoCompression](#NoCompression)
    * [const zlibDeflate](#zlibDeflate)
* [Variables](#var)
    * [var ErrChecksum](#ErrChecksum)
    * [var ErrDictionary](#ErrDictionary)
    * [var ErrHeader](#ErrHeader)
    * [var data](#data)
    * [var filenames](#filenames)
    * [var zlibTests](#zlibTests)
* [Types](#type)
    * [type Resetter interface](#Resetter)
    * [type Writer struct](#Writer)
        * [func NewWriter(w io.Writer) *Writer](#NewWriter)
        * [func NewWriterLevel(w io.Writer, level int) (*Writer, error)](#NewWriterLevel)
        * [func NewWriterLevelDict(w io.Writer, level int, dict []byte) (*Writer, error)](#NewWriterLevelDict)
        * [func (z *Writer) Close() error](#Writer.Close)
        * [func (z *Writer) Flush() error](#Writer.Flush)
        * [func (z *Writer) Reset(w io.Writer)](#Writer.Reset)
        * [func (z *Writer) Write(p []byte) (n int, err error)](#Writer.Write)
        * [func (z *Writer) writeHeader() (err error)](#Writer.writeHeader)
    * [type reader struct](#reader)
        * [func (z *reader) Close() error](#reader.Close)
        * [func (z *reader) Read(p []byte) (int, error)](#reader.Read)
        * [func (z *reader) Reset(r io.Reader, dict []byte) error](#reader.Reset)
    * [type zlibTest struct](#zlibTest)
* [Functions](#func)
    * [func NewReader(r io.Reader) (io.ReadCloser, error)](#NewReader)
    * [func NewReaderDict(r io.Reader, dict []byte) (io.ReadCloser, error)](#NewReaderDict)
    * [func TestDecompressor(t *testing.T)](#TestDecompressor)
    * [func TestWriter(t *testing.T)](#TestWriter)
    * [func TestWriterBig(t *testing.T)](#TestWriterBig)
    * [func TestWriterDict(t *testing.T)](#TestWriterDict)
    * [func TestWriterDictIsUsed(t *testing.T)](#TestWriterDictIsUsed)
    * [func TestWriterReset(t *testing.T)](#TestWriterReset)
    * [func testFileLevelDict(t *testing.T, fn string, level int, d string)](#testFileLevelDict)
    * [func testFileLevelDictReset(t *testing.T, fn string, level int, dict []byte)](#testFileLevelDictReset)
    * [func testLevelDict(t *testing.T, fn string, b0 []byte, level int, d string)](#testLevelDict)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="BestCompression" href="#BestCompression">const BestCompression</a>

```
searchKey: zlib.BestCompression
tags: [constant number]
```

```Go
const BestCompression = flate.BestCompression
```

These constants are copied from the flate package, so that code that imports "compress/zlib" does not also have to import "compress/flate". 

### <a id="BestSpeed" href="#BestSpeed">const BestSpeed</a>

```
searchKey: zlib.BestSpeed
tags: [constant number]
```

```Go
const BestSpeed = flate.BestSpeed
```

These constants are copied from the flate package, so that code that imports "compress/zlib" does not also have to import "compress/flate". 

### <a id="DefaultCompression" href="#DefaultCompression">const DefaultCompression</a>

```
searchKey: zlib.DefaultCompression
tags: [constant number]
```

```Go
const DefaultCompression = flate.DefaultCompression
```

These constants are copied from the flate package, so that code that imports "compress/zlib" does not also have to import "compress/flate". 

### <a id="HuffmanOnly" href="#HuffmanOnly">const HuffmanOnly</a>

```
searchKey: zlib.HuffmanOnly
tags: [constant number]
```

```Go
const HuffmanOnly = flate.HuffmanOnly
```

These constants are copied from the flate package, so that code that imports "compress/zlib" does not also have to import "compress/flate". 

### <a id="NoCompression" href="#NoCompression">const NoCompression</a>

```
searchKey: zlib.NoCompression
tags: [constant number]
```

```Go
const NoCompression = flate.NoCompression
```

These constants are copied from the flate package, so that code that imports "compress/zlib" does not also have to import "compress/flate". 

### <a id="zlibDeflate" href="#zlibDeflate">const zlibDeflate</a>

```
searchKey: zlib.zlibDeflate
tags: [constant number private]
```

```Go
const zlibDeflate = 8
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="ErrChecksum" href="#ErrChecksum">var ErrChecksum</a>

```
searchKey: zlib.ErrChecksum
tags: [variable interface]
```

```Go
var ErrChecksum = errors.New("zlib: invalid checksum")
```

ErrChecksum is returned when reading ZLIB data that has an invalid checksum. 

### <a id="ErrDictionary" href="#ErrDictionary">var ErrDictionary</a>

```
searchKey: zlib.ErrDictionary
tags: [variable interface]
```

```Go
var ErrDictionary = errors.New("zlib: invalid dictionary")
```

ErrDictionary is returned when reading ZLIB data that has an invalid dictionary. 

### <a id="ErrHeader" href="#ErrHeader">var ErrHeader</a>

```
searchKey: zlib.ErrHeader
tags: [variable interface]
```

```Go
var ErrHeader = errors.New("zlib: invalid header")
```

ErrHeader is returned when reading ZLIB data that has an invalid header. 

### <a id="data" href="#data">var data</a>

```
searchKey: zlib.data
tags: [variable array string private]
```

```Go
var data = []string{
	"test a reasonable sized string that can be compressed",
}
```

### <a id="filenames" href="#filenames">var filenames</a>

```
searchKey: zlib.filenames
tags: [variable array string private]
```

```Go
var filenames = ...
```

### <a id="zlibTests" href="#zlibTests">var zlibTests</a>

```
searchKey: zlib.zlibTests
tags: [variable array struct private]
```

```Go
var zlibTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Resetter" href="#Resetter">type Resetter interface</a>

```
searchKey: zlib.Resetter
tags: [interface]
```

```Go
type Resetter interface {
	// Reset discards any buffered data and resets the Resetter as if it was
	// newly initialized with the given reader.
	Reset(r io.Reader, dict []byte) error
}
```

Resetter resets a ReadCloser returned by NewReader or NewReaderDict to switch to a new underlying Reader. This permits reusing a ReadCloser instead of allocating a new one. 

### <a id="Writer" href="#Writer">type Writer struct</a>

```
searchKey: zlib.Writer
tags: [struct]
```

```Go
type Writer struct {
	w           io.Writer
	level       int
	dict        []byte
	compressor  *flate.Writer
	digest      hash.Hash32
	err         error
	scratch     [4]byte
	wroteHeader bool
}
```

A Writer takes data written to it and writes the compressed form of that data to an underlying writer (see NewWriter). 

#### <a id="NewWriter" href="#NewWriter">func NewWriter(w io.Writer) *Writer</a>

```
searchKey: zlib.NewWriter
tags: [method]
```

```Go
func NewWriter(w io.Writer) *Writer
```

NewWriter creates a new Writer. Writes to the returned Writer are compressed and written to w. 

It is the caller's responsibility to call Close on the Writer when done. Writes may be buffered and not flushed until Close. 

#### <a id="NewWriterLevel" href="#NewWriterLevel">func NewWriterLevel(w io.Writer, level int) (*Writer, error)</a>

```
searchKey: zlib.NewWriterLevel
tags: [method]
```

```Go
func NewWriterLevel(w io.Writer, level int) (*Writer, error)
```

NewWriterLevel is like NewWriter but specifies the compression level instead of assuming DefaultCompression. 

The compression level can be DefaultCompression, NoCompression, HuffmanOnly or any integer value between BestSpeed and BestCompression inclusive. The error returned will be nil if the level is valid. 

#### <a id="NewWriterLevelDict" href="#NewWriterLevelDict">func NewWriterLevelDict(w io.Writer, level int, dict []byte) (*Writer, error)</a>

```
searchKey: zlib.NewWriterLevelDict
tags: [method]
```

```Go
func NewWriterLevelDict(w io.Writer, level int, dict []byte) (*Writer, error)
```

NewWriterLevelDict is like NewWriterLevel but specifies a dictionary to compress with. 

The dictionary may be nil. If not, its contents should not be modified until the Writer is closed. 

#### <a id="Writer.Close" href="#Writer.Close">func (z *Writer) Close() error</a>

```
searchKey: zlib.Writer.Close
tags: [function]
```

```Go
func (z *Writer) Close() error
```

Close closes the Writer, flushing any unwritten data to the underlying io.Writer, but does not close the underlying io.Writer. 

#### <a id="Writer.Flush" href="#Writer.Flush">func (z *Writer) Flush() error</a>

```
searchKey: zlib.Writer.Flush
tags: [function]
```

```Go
func (z *Writer) Flush() error
```

Flush flushes the Writer to its underlying io.Writer. 

#### <a id="Writer.Reset" href="#Writer.Reset">func (z *Writer) Reset(w io.Writer)</a>

```
searchKey: zlib.Writer.Reset
tags: [method]
```

```Go
func (z *Writer) Reset(w io.Writer)
```

Reset clears the state of the Writer z such that it is equivalent to its initial state from NewWriterLevel or NewWriterLevelDict, but instead writing to w. 

#### <a id="Writer.Write" href="#Writer.Write">func (z *Writer) Write(p []byte) (n int, err error)</a>

```
searchKey: zlib.Writer.Write
tags: [method]
```

```Go
func (z *Writer) Write(p []byte) (n int, err error)
```

Write writes a compressed form of p to the underlying io.Writer. The compressed bytes are not necessarily flushed until the Writer is closed or explicitly flushed. 

#### <a id="Writer.writeHeader" href="#Writer.writeHeader">func (z *Writer) writeHeader() (err error)</a>

```
searchKey: zlib.Writer.writeHeader
tags: [function private]
```

```Go
func (z *Writer) writeHeader() (err error)
```

writeHeader writes the ZLIB header. 

### <a id="reader" href="#reader">type reader struct</a>

```
searchKey: zlib.reader
tags: [struct private]
```

```Go
type reader struct {
	r            flate.Reader
	decompressor io.ReadCloser
	digest       hash.Hash32
	err          error
	scratch      [4]byte
}
```

#### <a id="reader.Close" href="#reader.Close">func (z *reader) Close() error</a>

```
searchKey: zlib.reader.Close
tags: [function private]
```

```Go
func (z *reader) Close() error
```

Calling Close does not close the wrapped io.Reader originally passed to NewReader. In order for the ZLIB checksum to be verified, the reader must be fully consumed until the io.EOF. 

#### <a id="reader.Read" href="#reader.Read">func (z *reader) Read(p []byte) (int, error)</a>

```
searchKey: zlib.reader.Read
tags: [method private]
```

```Go
func (z *reader) Read(p []byte) (int, error)
```

#### <a id="reader.Reset" href="#reader.Reset">func (z *reader) Reset(r io.Reader, dict []byte) error</a>

```
searchKey: zlib.reader.Reset
tags: [method private]
```

```Go
func (z *reader) Reset(r io.Reader, dict []byte) error
```

### <a id="zlibTest" href="#zlibTest">type zlibTest struct</a>

```
searchKey: zlib.zlibTest
tags: [struct private]
```

```Go
type zlibTest struct {
	desc       string
	raw        string
	compressed []byte
	dict       []byte
	err        error
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="NewReader" href="#NewReader">func NewReader(r io.Reader) (io.ReadCloser, error)</a>

```
searchKey: zlib.NewReader
tags: [method]
```

```Go
func NewReader(r io.Reader) (io.ReadCloser, error)
```

NewReader creates a new ReadCloser. Reads from the returned ReadCloser read and decompress data from r. If r does not implement io.ByteReader, the decompressor may read more data than necessary from r. It is the caller's responsibility to call Close on the ReadCloser when done. 

The ReadCloser returned by NewReader also implements Resetter. 

### <a id="NewReaderDict" href="#NewReaderDict">func NewReaderDict(r io.Reader, dict []byte) (io.ReadCloser, error)</a>

```
searchKey: zlib.NewReaderDict
tags: [method]
```

```Go
func NewReaderDict(r io.Reader, dict []byte) (io.ReadCloser, error)
```

NewReaderDict is like NewReader but uses a preset dictionary. NewReaderDict ignores the dictionary if the compressed data does not refer to it. If the compressed data refers to a different dictionary, NewReaderDict returns ErrDictionary. 

The ReadCloser returned by NewReaderDict also implements Resetter. 

### <a id="TestDecompressor" href="#TestDecompressor">func TestDecompressor(t *testing.T)</a>

```
searchKey: zlib.TestDecompressor
tags: [method private test]
```

```Go
func TestDecompressor(t *testing.T)
```

### <a id="TestWriter" href="#TestWriter">func TestWriter(t *testing.T)</a>

```
searchKey: zlib.TestWriter
tags: [method private test]
```

```Go
func TestWriter(t *testing.T)
```

### <a id="TestWriterBig" href="#TestWriterBig">func TestWriterBig(t *testing.T)</a>

```
searchKey: zlib.TestWriterBig
tags: [method private test]
```

```Go
func TestWriterBig(t *testing.T)
```

### <a id="TestWriterDict" href="#TestWriterDict">func TestWriterDict(t *testing.T)</a>

```
searchKey: zlib.TestWriterDict
tags: [method private test]
```

```Go
func TestWriterDict(t *testing.T)
```

### <a id="TestWriterDictIsUsed" href="#TestWriterDictIsUsed">func TestWriterDictIsUsed(t *testing.T)</a>

```
searchKey: zlib.TestWriterDictIsUsed
tags: [method private test]
```

```Go
func TestWriterDictIsUsed(t *testing.T)
```

### <a id="TestWriterReset" href="#TestWriterReset">func TestWriterReset(t *testing.T)</a>

```
searchKey: zlib.TestWriterReset
tags: [method private test]
```

```Go
func TestWriterReset(t *testing.T)
```

### <a id="testFileLevelDict" href="#testFileLevelDict">func testFileLevelDict(t *testing.T, fn string, level int, d string)</a>

```
searchKey: zlib.testFileLevelDict
tags: [method private]
```

```Go
func testFileLevelDict(t *testing.T, fn string, level int, d string)
```

Tests that compressing and then decompressing the given file at the given compression level and dictionary yields equivalent bytes to the original file. 

### <a id="testFileLevelDictReset" href="#testFileLevelDictReset">func testFileLevelDictReset(t *testing.T, fn string, level int, dict []byte)</a>

```
searchKey: zlib.testFileLevelDictReset
tags: [method private]
```

```Go
func testFileLevelDictReset(t *testing.T, fn string, level int, dict []byte)
```

### <a id="testLevelDict" href="#testLevelDict">func testLevelDict(t *testing.T, fn string, b0 []byte, level int, d string)</a>

```
searchKey: zlib.testLevelDict
tags: [method private]
```

```Go
func testLevelDict(t *testing.T, fn string, b0 []byte, level int, d string)
```

