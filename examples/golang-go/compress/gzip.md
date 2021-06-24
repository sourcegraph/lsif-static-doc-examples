# Package gzip

Package gzip implements reading and writing of gzip format compressed files, as specified in RFC 1952. 

## Index

* [Constants](#const)
    * [const BestCompression](#BestCompression)
    * [const BestSpeed](#BestSpeed)
    * [const DefaultCompression](#DefaultCompression)
    * [const HuffmanOnly](#HuffmanOnly)
    * [const NoCompression](#NoCompression)
    * [const flagComment](#flagComment)
    * [const flagExtra](#flagExtra)
    * [const flagHdrCrc](#flagHdrCrc)
    * [const flagName](#flagName)
    * [const flagText](#flagText)
    * [const gzipDeflate](#gzipDeflate)
    * [const gzipID1](#gzipID1)
    * [const gzipID2](#gzipID2)
* [Variables](#var)
    * [var ErrChecksum](#ErrChecksum)
    * [var ErrHeader](#ErrHeader)
    * [var gunzipTests](#gunzipTests)
    * [var le](#le)
* [Types](#type)
    * [type Header struct](#Header)
    * [type Reader struct](#Reader)
        * [func NewReader(r io.Reader) (*Reader, error)](#NewReader)
        * [func (z *Reader) Close() error](#Reader.Close)
        * [func (z *Reader) Multistream(ok bool)](#Reader.Multistream)
        * [func (z *Reader) Read(p []byte) (n int, err error)](#Reader.Read)
        * [func (z *Reader) Reset(r io.Reader) error](#Reader.Reset)
        * [func (z *Reader) readHeader() (hdr Header, err error)](#Reader.readHeader)
        * [func (z *Reader) readString() (string, error)](#Reader.readString)
    * [type Writer struct](#Writer)
        * [func NewWriter(w io.Writer) *Writer](#NewWriter)
        * [func NewWriterLevel(w io.Writer, level int) (*Writer, error)](#NewWriterLevel)
        * [func (z *Writer) Close() error](#Writer.Close)
        * [func (z *Writer) Flush() error](#Writer.Flush)
        * [func (z *Writer) Reset(w io.Writer)](#Writer.Reset)
        * [func (z *Writer) Write(p []byte) (int, error)](#Writer.Write)
        * [func (z *Writer) init(w io.Writer, level int)](#Writer.init.gzip.go)
        * [func (z *Writer) writeBytes(b []byte) error](#Writer.writeBytes)
        * [func (z *Writer) writeString(s string) (err error)](#Writer.writeString)
    * [type gunzipTest struct](#gunzipTest)
    * [type limitedWriter struct](#limitedWriter)
        * [func (l *limitedWriter) Write(p []byte) (n int, err error)](#limitedWriter.Write)
* [Functions](#func)
    * [func TestConcat(t *testing.T)](#TestConcat)
    * [func TestDecompressor(t *testing.T)](#TestDecompressor)
    * [func TestEmpty(t *testing.T)](#TestEmpty)
    * [func TestGZIPFilesHaveZeroMTimes(t *testing.T)](#TestGZIPFilesHaveZeroMTimes)
    * [func TestIssue6550(t *testing.T)](#TestIssue6550)
    * [func TestLatin1(t *testing.T)](#TestLatin1)
    * [func TestLatin1RoundTrip(t *testing.T)](#TestLatin1RoundTrip)
    * [func TestLimitedWrite(t *testing.T)](#TestLimitedWrite)
    * [func TestMultistreamFalse(t *testing.T)](#TestMultistreamFalse)
    * [func TestNilStream(t *testing.T)](#TestNilStream)
    * [func TestRoundTrip(t *testing.T)](#TestRoundTrip)
    * [func TestTruncatedStreams(t *testing.T)](#TestTruncatedStreams)
    * [func TestWriterFlush(t *testing.T)](#TestWriterFlush)
    * [func TestWriterReset(t *testing.T)](#TestWriterReset)
    * [func checkZeroMTime(t *testing.T, path string)](#checkZeroMTime)
    * [func noEOF(err error) error](#noEOF)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="BestCompression" href="#BestCompression">const BestCompression</a>

```
searchKey: gzip.BestCompression
tags: [constant number]
```

```Go
const BestCompression = flate.BestCompression
```

These constants are copied from the flate package, so that code that imports "compress/gzip" does not also have to import "compress/flate". 

### <a id="BestSpeed" href="#BestSpeed">const BestSpeed</a>

```
searchKey: gzip.BestSpeed
tags: [constant number]
```

```Go
const BestSpeed = flate.BestSpeed
```

These constants are copied from the flate package, so that code that imports "compress/gzip" does not also have to import "compress/flate". 

### <a id="DefaultCompression" href="#DefaultCompression">const DefaultCompression</a>

```
searchKey: gzip.DefaultCompression
tags: [constant number]
```

```Go
const DefaultCompression = flate.DefaultCompression
```

These constants are copied from the flate package, so that code that imports "compress/gzip" does not also have to import "compress/flate". 

### <a id="HuffmanOnly" href="#HuffmanOnly">const HuffmanOnly</a>

```
searchKey: gzip.HuffmanOnly
tags: [constant number]
```

```Go
const HuffmanOnly = flate.HuffmanOnly
```

These constants are copied from the flate package, so that code that imports "compress/gzip" does not also have to import "compress/flate". 

### <a id="NoCompression" href="#NoCompression">const NoCompression</a>

```
searchKey: gzip.NoCompression
tags: [constant number]
```

```Go
const NoCompression = flate.NoCompression
```

These constants are copied from the flate package, so that code that imports "compress/gzip" does not also have to import "compress/flate". 

### <a id="flagComment" href="#flagComment">const flagComment</a>

```
searchKey: gzip.flagComment
tags: [constant number private]
```

```Go
const flagComment = 1 << 4
```

### <a id="flagExtra" href="#flagExtra">const flagExtra</a>

```
searchKey: gzip.flagExtra
tags: [constant number private]
```

```Go
const flagExtra = 1 << 2
```

### <a id="flagHdrCrc" href="#flagHdrCrc">const flagHdrCrc</a>

```
searchKey: gzip.flagHdrCrc
tags: [constant number private]
```

```Go
const flagHdrCrc = 1 << 1
```

### <a id="flagName" href="#flagName">const flagName</a>

```
searchKey: gzip.flagName
tags: [constant number private]
```

```Go
const flagName = 1 << 3
```

### <a id="flagText" href="#flagText">const flagText</a>

```
searchKey: gzip.flagText
tags: [constant number private]
```

```Go
const flagText = 1 << 0
```

### <a id="gzipDeflate" href="#gzipDeflate">const gzipDeflate</a>

```
searchKey: gzip.gzipDeflate
tags: [constant number private]
```

```Go
const gzipDeflate = 8
```

### <a id="gzipID1" href="#gzipID1">const gzipID1</a>

```
searchKey: gzip.gzipID1
tags: [constant number private]
```

```Go
const gzipID1 = 0x1f
```

### <a id="gzipID2" href="#gzipID2">const gzipID2</a>

```
searchKey: gzip.gzipID2
tags: [constant number private]
```

```Go
const gzipID2 = 0x8b
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="ErrChecksum" href="#ErrChecksum">var ErrChecksum</a>

```
searchKey: gzip.ErrChecksum
tags: [variable interface]
```

```Go
var ErrChecksum = errors.New("gzip: invalid checksum")
```

ErrChecksum is returned when reading GZIP data that has an invalid checksum. 

### <a id="ErrHeader" href="#ErrHeader">var ErrHeader</a>

```
searchKey: gzip.ErrHeader
tags: [variable interface]
```

```Go
var ErrHeader = errors.New("gzip: invalid header")
```

ErrHeader is returned when reading GZIP data that has an invalid header. 

### <a id="gunzipTests" href="#gunzipTests">var gunzipTests</a>

```
searchKey: gzip.gunzipTests
tags: [variable array struct private]
```

```Go
var gunzipTests = ...
```

### <a id="le" href="#le">var le</a>

```
searchKey: gzip.le
tags: [variable struct private]
```

```Go
var le = binary.LittleEndian
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Header" href="#Header">type Header struct</a>

```
searchKey: gzip.Header
tags: [struct]
```

```Go
type Header struct {
	Comment string    // comment
	Extra   []byte    // "extra data"
	ModTime time.Time // modification time
	Name    string    // file name
	OS      byte      // operating system type
}
```

The gzip file stores a header giving metadata about the compressed file. That header is exposed as the fields of the Writer and Reader structs. 

Strings must be UTF-8 encoded and may only contain Unicode code points U+0001 through U+00FF, due to limitations of the GZIP file format. 

### <a id="Reader" href="#Reader">type Reader struct</a>

```
searchKey: gzip.Reader
tags: [struct]
```

```Go
type Reader struct {
	Header       // valid after NewReader or Reader.Reset
	r            flate.Reader
	decompressor io.ReadCloser
	digest       uint32 // CRC-32, IEEE polynomial (section 8)
	size         uint32 // Uncompressed size (section 2.3.1)
	buf          [512]byte
	err          error
	multistream  bool
}
```

A Reader is an io.Reader that can be read to retrieve uncompressed data from a gzip-format compressed file. 

In general, a gzip file can be a concatenation of gzip files, each with its own header. Reads from the Reader return the concatenation of the uncompressed data of each. Only the first header is recorded in the Reader fields. 

Gzip files store a length and checksum of the uncompressed data. The Reader will return an ErrChecksum when Read reaches the end of the uncompressed data if it does not have the expected length or checksum. Clients should treat data returned by Read as tentative until they receive the io.EOF marking the end of the data. 

#### <a id="NewReader" href="#NewReader">func NewReader(r io.Reader) (*Reader, error)</a>

```
searchKey: gzip.NewReader
tags: [method]
```

```Go
func NewReader(r io.Reader) (*Reader, error)
```

NewReader creates a new Reader reading the given reader. If r does not also implement io.ByteReader, the decompressor may read more data than necessary from r. 

It is the caller's responsibility to call Close on the Reader when done. 

The Reader.Header fields will be valid in the Reader returned. 

#### <a id="Reader.Close" href="#Reader.Close">func (z *Reader) Close() error</a>

```
searchKey: gzip.Reader.Close
tags: [function]
```

```Go
func (z *Reader) Close() error
```

Close closes the Reader. It does not close the underlying io.Reader. In order for the GZIP checksum to be verified, the reader must be fully consumed until the io.EOF. 

#### <a id="Reader.Multistream" href="#Reader.Multistream">func (z *Reader) Multistream(ok bool)</a>

```
searchKey: gzip.Reader.Multistream
tags: [method]
```

```Go
func (z *Reader) Multistream(ok bool)
```

Multistream controls whether the reader supports multistream files. 

If enabled (the default), the Reader expects the input to be a sequence of individually gzipped data streams, each with its own header and trailer, ending at EOF. The effect is that the concatenation of a sequence of gzipped files is treated as equivalent to the gzip of the concatenation of the sequence. This is standard behavior for gzip readers. 

Calling Multistream(false) disables this behavior; disabling the behavior can be useful when reading file formats that distinguish individual gzip data streams or mix gzip data streams with other data streams. In this mode, when the Reader reaches the end of the data stream, Read returns io.EOF. The underlying reader must implement io.ByteReader in order to be left positioned just after the gzip stream. To start the next stream, call z.Reset(r) followed by z.Multistream(false). If there is no next stream, z.Reset(r) will return io.EOF. 

#### <a id="Reader.Read" href="#Reader.Read">func (z *Reader) Read(p []byte) (n int, err error)</a>

```
searchKey: gzip.Reader.Read
tags: [method]
```

```Go
func (z *Reader) Read(p []byte) (n int, err error)
```

Read implements io.Reader, reading uncompressed bytes from its underlying Reader. 

#### <a id="Reader.Reset" href="#Reader.Reset">func (z *Reader) Reset(r io.Reader) error</a>

```
searchKey: gzip.Reader.Reset
tags: [method]
```

```Go
func (z *Reader) Reset(r io.Reader) error
```

Reset discards the Reader z's state and makes it equivalent to the result of its original state from NewReader, but reading from r instead. This permits reusing a Reader rather than allocating a new one. 

#### <a id="Reader.readHeader" href="#Reader.readHeader">func (z *Reader) readHeader() (hdr Header, err error)</a>

```
searchKey: gzip.Reader.readHeader
tags: [function private]
```

```Go
func (z *Reader) readHeader() (hdr Header, err error)
```

readHeader reads the GZIP header according to section 2.3.1. This method does not set z.err. 

#### <a id="Reader.readString" href="#Reader.readString">func (z *Reader) readString() (string, error)</a>

```
searchKey: gzip.Reader.readString
tags: [function private]
```

```Go
func (z *Reader) readString() (string, error)
```

readString reads a NUL-terminated string from z.r. It treats the bytes read as being encoded as ISO 8859-1 (Latin-1) and will output a string encoded using UTF-8. This method always updates z.digest with the data read. 

### <a id="Writer" href="#Writer">type Writer struct</a>

```
searchKey: gzip.Writer
tags: [struct]
```

```Go
type Writer struct {
	Header      // written at first call to Write, Flush, or Close
	w           io.Writer
	level       int
	wroteHeader bool
	compressor  *flate.Writer
	digest      uint32 // CRC-32, IEEE polynomial (section 8)
	size        uint32 // Uncompressed size (section 2.3.1)
	closed      bool
	buf         [10]byte
	err         error
}
```

A Writer is an io.WriteCloser. Writes to a Writer are compressed and written to w. 

#### <a id="NewWriter" href="#NewWriter">func NewWriter(w io.Writer) *Writer</a>

```
searchKey: gzip.NewWriter
tags: [method]
```

```Go
func NewWriter(w io.Writer) *Writer
```

NewWriter returns a new Writer. Writes to the returned writer are compressed and written to w. 

It is the caller's responsibility to call Close on the Writer when done. Writes may be buffered and not flushed until Close. 

Callers that wish to set the fields in Writer.Header must do so before the first call to Write, Flush, or Close. 

#### <a id="NewWriterLevel" href="#NewWriterLevel">func NewWriterLevel(w io.Writer, level int) (*Writer, error)</a>

```
searchKey: gzip.NewWriterLevel
tags: [method]
```

```Go
func NewWriterLevel(w io.Writer, level int) (*Writer, error)
```

NewWriterLevel is like NewWriter but specifies the compression level instead of assuming DefaultCompression. 

The compression level can be DefaultCompression, NoCompression, HuffmanOnly or any integer value between BestSpeed and BestCompression inclusive. The error returned will be nil if the level is valid. 

#### <a id="Writer.Close" href="#Writer.Close">func (z *Writer) Close() error</a>

```
searchKey: gzip.Writer.Close
tags: [function]
```

```Go
func (z *Writer) Close() error
```

Close closes the Writer by flushing any unwritten data to the underlying io.Writer and writing the GZIP footer. It does not close the underlying io.Writer. 

#### <a id="Writer.Flush" href="#Writer.Flush">func (z *Writer) Flush() error</a>

```
searchKey: gzip.Writer.Flush
tags: [function]
```

```Go
func (z *Writer) Flush() error
```

Flush flushes any pending compressed data to the underlying writer. 

It is useful mainly in compressed network protocols, to ensure that a remote reader has enough data to reconstruct a packet. Flush does not return until the data has been written. If the underlying writer returns an error, Flush returns that error. 

In the terminology of the zlib library, Flush is equivalent to Z_SYNC_FLUSH. 

#### <a id="Writer.Reset" href="#Writer.Reset">func (z *Writer) Reset(w io.Writer)</a>

```
searchKey: gzip.Writer.Reset
tags: [method]
```

```Go
func (z *Writer) Reset(w io.Writer)
```

Reset discards the Writer z's state and makes it equivalent to the result of its original state from NewWriter or NewWriterLevel, but writing to w instead. This permits reusing a Writer rather than allocating a new one. 

#### <a id="Writer.Write" href="#Writer.Write">func (z *Writer) Write(p []byte) (int, error)</a>

```
searchKey: gzip.Writer.Write
tags: [method]
```

```Go
func (z *Writer) Write(p []byte) (int, error)
```

Write writes a compressed form of p to the underlying io.Writer. The compressed bytes are not necessarily flushed until the Writer is closed. 

#### <a id="Writer.init.gzip.go" href="#Writer.init.gzip.go">func (z *Writer) init(w io.Writer, level int)</a>

```
searchKey: gzip.Writer.init
tags: [method private]
```

```Go
func (z *Writer) init(w io.Writer, level int)
```

#### <a id="Writer.writeBytes" href="#Writer.writeBytes">func (z *Writer) writeBytes(b []byte) error</a>

```
searchKey: gzip.Writer.writeBytes
tags: [method private]
```

```Go
func (z *Writer) writeBytes(b []byte) error
```

writeBytes writes a length-prefixed byte slice to z.w. 

#### <a id="Writer.writeString" href="#Writer.writeString">func (z *Writer) writeString(s string) (err error)</a>

```
searchKey: gzip.Writer.writeString
tags: [method private]
```

```Go
func (z *Writer) writeString(s string) (err error)
```

writeString writes a UTF-8 string s in GZIP's format to z.w. GZIP (RFC 1952) specifies that strings are NUL-terminated ISO 8859-1 (Latin-1). 

### <a id="gunzipTest" href="#gunzipTest">type gunzipTest struct</a>

```
searchKey: gzip.gunzipTest
tags: [struct private]
```

```Go
type gunzipTest struct {
	name string
	desc string
	raw  string
	gzip []byte
	err  error
}
```

### <a id="limitedWriter" href="#limitedWriter">type limitedWriter struct</a>

```
searchKey: gzip.limitedWriter
tags: [struct private]
```

```Go
type limitedWriter struct {
	N int
}
```

#### <a id="limitedWriter.Write" href="#limitedWriter.Write">func (l *limitedWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: gzip.limitedWriter.Write
tags: [method private]
```

```Go
func (l *limitedWriter) Write(p []byte) (n int, err error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="TestConcat" href="#TestConcat">func TestConcat(t *testing.T)</a>

```
searchKey: gzip.TestConcat
tags: [method private test]
```

```Go
func TestConcat(t *testing.T)
```

Multiple gzip files concatenated form a valid gzip file. 

### <a id="TestDecompressor" href="#TestDecompressor">func TestDecompressor(t *testing.T)</a>

```
searchKey: gzip.TestDecompressor
tags: [method private test]
```

```Go
func TestDecompressor(t *testing.T)
```

### <a id="TestEmpty" href="#TestEmpty">func TestEmpty(t *testing.T)</a>

```
searchKey: gzip.TestEmpty
tags: [method private test]
```

```Go
func TestEmpty(t *testing.T)
```

TestEmpty tests that an empty payload still forms a valid GZIP stream. 

### <a id="TestGZIPFilesHaveZeroMTimes" href="#TestGZIPFilesHaveZeroMTimes">func TestGZIPFilesHaveZeroMTimes(t *testing.T)</a>

```
searchKey: gzip.TestGZIPFilesHaveZeroMTimes
tags: [method private test]
```

```Go
func TestGZIPFilesHaveZeroMTimes(t *testing.T)
```

TestGZIPFilesHaveZeroMTimes checks that every .gz file in the tree has a zero MTIME. This is a requirement for the Debian maintainers to be able to have deterministic packages. 

See [https://golang.org/issue/14937](https://golang.org/issue/14937). 

### <a id="TestIssue6550" href="#TestIssue6550">func TestIssue6550(t *testing.T)</a>

```
searchKey: gzip.TestIssue6550
tags: [method private test]
```

```Go
func TestIssue6550(t *testing.T)
```

### <a id="TestLatin1" href="#TestLatin1">func TestLatin1(t *testing.T)</a>

```
searchKey: gzip.TestLatin1
tags: [method private test]
```

```Go
func TestLatin1(t *testing.T)
```

TestLatin1 tests the internal functions for converting to and from Latin-1. 

### <a id="TestLatin1RoundTrip" href="#TestLatin1RoundTrip">func TestLatin1RoundTrip(t *testing.T)</a>

```
searchKey: gzip.TestLatin1RoundTrip
tags: [method private test]
```

```Go
func TestLatin1RoundTrip(t *testing.T)
```

TestLatin1RoundTrip tests that metadata that is representable in Latin-1 survives a round trip. 

### <a id="TestLimitedWrite" href="#TestLimitedWrite">func TestLimitedWrite(t *testing.T)</a>

```
searchKey: gzip.TestLimitedWrite
tags: [method private test]
```

```Go
func TestLimitedWrite(t *testing.T)
```

Write should never return more bytes than the input slice. 

### <a id="TestMultistreamFalse" href="#TestMultistreamFalse">func TestMultistreamFalse(t *testing.T)</a>

```
searchKey: gzip.TestMultistreamFalse
tags: [method private test]
```

```Go
func TestMultistreamFalse(t *testing.T)
```

### <a id="TestNilStream" href="#TestNilStream">func TestNilStream(t *testing.T)</a>

```
searchKey: gzip.TestNilStream
tags: [method private test]
```

```Go
func TestNilStream(t *testing.T)
```

### <a id="TestRoundTrip" href="#TestRoundTrip">func TestRoundTrip(t *testing.T)</a>

```
searchKey: gzip.TestRoundTrip
tags: [method private test]
```

```Go
func TestRoundTrip(t *testing.T)
```

TestRoundTrip tests that gzipping and then gunzipping is the identity function. 

### <a id="TestTruncatedStreams" href="#TestTruncatedStreams">func TestTruncatedStreams(t *testing.T)</a>

```
searchKey: gzip.TestTruncatedStreams
tags: [method private test]
```

```Go
func TestTruncatedStreams(t *testing.T)
```

### <a id="TestWriterFlush" href="#TestWriterFlush">func TestWriterFlush(t *testing.T)</a>

```
searchKey: gzip.TestWriterFlush
tags: [method private test]
```

```Go
func TestWriterFlush(t *testing.T)
```

### <a id="TestWriterReset" href="#TestWriterReset">func TestWriterReset(t *testing.T)</a>

```
searchKey: gzip.TestWriterReset
tags: [method private test]
```

```Go
func TestWriterReset(t *testing.T)
```

### <a id="checkZeroMTime" href="#checkZeroMTime">func checkZeroMTime(t *testing.T, path string)</a>

```
searchKey: gzip.checkZeroMTime
tags: [method private]
```

```Go
func checkZeroMTime(t *testing.T, path string)
```

### <a id="noEOF" href="#noEOF">func noEOF(err error) error</a>

```
searchKey: gzip.noEOF
tags: [method private]
```

```Go
func noEOF(err error) error
```

noEOF converts io.EOF to io.ErrUnexpectedEOF. 

