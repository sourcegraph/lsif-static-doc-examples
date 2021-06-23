# Package gzip

Package gzip implements reading and writing of gzip format compressed files, as specified in RFC 1952. 

## Index

* [Constants](#const)
    * [const gzipID1](#gzipID1)
    * [const gzipID2](#gzipID2)
    * [const gzipDeflate](#gzipDeflate)
    * [const flagText](#flagText)
    * [const flagHdrCrc](#flagHdrCrc)
    * [const flagExtra](#flagExtra)
    * [const flagName](#flagName)
    * [const flagComment](#flagComment)
    * [const NoCompression](#NoCompression)
    * [const BestSpeed](#BestSpeed)
    * [const BestCompression](#BestCompression)
    * [const DefaultCompression](#DefaultCompression)
    * [const HuffmanOnly](#HuffmanOnly)
* [Variables](#var)
    * [var ErrChecksum](#ErrChecksum)
    * [var ErrHeader](#ErrHeader)
    * [var le](#le)
    * [var gunzipTests](#gunzipTests)
* [Types](#type)
    * [type Header struct](#Header)
    * [type Reader struct](#Reader)
        * [func NewReader(r io.Reader) (*Reader, error)](#NewReader)
        * [func (z *Reader) Reset(r io.Reader) error](#Reader.Reset)
        * [func (z *Reader) Multistream(ok bool)](#Reader.Multistream)
        * [func (z *Reader) readString() (string, error)](#Reader.readString)
        * [func (z *Reader) readHeader() (hdr Header, err error)](#Reader.readHeader)
        * [func (z *Reader) Read(p []byte) (n int, err error)](#Reader.Read)
        * [func (z *Reader) Close() error](#Reader.Close)
    * [type Writer struct](#Writer)
        * [func NewWriter(w io.Writer) *Writer](#NewWriter)
        * [func NewWriterLevel(w io.Writer, level int) (*Writer, error)](#NewWriterLevel)
        * [func (z *Writer) init(w io.Writer, level int)](#Writer.init.gzip.go)
        * [func (z *Writer) Reset(w io.Writer)](#Writer.Reset)
        * [func (z *Writer) writeBytes(b []byte) error](#Writer.writeBytes)
        * [func (z *Writer) writeString(s string) (err error)](#Writer.writeString)
        * [func (z *Writer) Write(p []byte) (int, error)](#Writer.Write)
        * [func (z *Writer) Flush() error](#Writer.Flush)
        * [func (z *Writer) Close() error](#Writer.Close)
    * [type gunzipTest struct](#gunzipTest)
    * [type limitedWriter struct](#limitedWriter)
        * [func (l *limitedWriter) Write(p []byte) (n int, err error)](#limitedWriter.Write)
* [Functions](#func)
    * [func noEOF(err error) error](#noEOF)
    * [func TestDecompressor(t *testing.T)](#TestDecompressor)
    * [func TestIssue6550(t *testing.T)](#TestIssue6550)
    * [func TestMultistreamFalse(t *testing.T)](#TestMultistreamFalse)
    * [func TestNilStream(t *testing.T)](#TestNilStream)
    * [func TestTruncatedStreams(t *testing.T)](#TestTruncatedStreams)
    * [func TestEmpty(t *testing.T)](#TestEmpty)
    * [func TestRoundTrip(t *testing.T)](#TestRoundTrip)
    * [func TestLatin1(t *testing.T)](#TestLatin1)
    * [func TestLatin1RoundTrip(t *testing.T)](#TestLatin1RoundTrip)
    * [func TestWriterFlush(t *testing.T)](#TestWriterFlush)
    * [func TestConcat(t *testing.T)](#TestConcat)
    * [func TestWriterReset(t *testing.T)](#TestWriterReset)
    * [func TestLimitedWrite(t *testing.T)](#TestLimitedWrite)
    * [func TestGZIPFilesHaveZeroMTimes(t *testing.T)](#TestGZIPFilesHaveZeroMTimes)
    * [func checkZeroMTime(t *testing.T, path string)](#checkZeroMTime)


## <a id="const" href="#const">Constants</a>

### <a id="gzipID1" href="#gzipID1">const gzipID1</a>

```
searchKey: gzip.gzipID1
tags: [private]
```

```Go
const gzipID1 = 0x1f
```

### <a id="gzipID2" href="#gzipID2">const gzipID2</a>

```
searchKey: gzip.gzipID2
tags: [private]
```

```Go
const gzipID2 = 0x8b
```

### <a id="gzipDeflate" href="#gzipDeflate">const gzipDeflate</a>

```
searchKey: gzip.gzipDeflate
tags: [private]
```

```Go
const gzipDeflate = 8
```

### <a id="flagText" href="#flagText">const flagText</a>

```
searchKey: gzip.flagText
tags: [private]
```

```Go
const flagText = 1 << 0
```

### <a id="flagHdrCrc" href="#flagHdrCrc">const flagHdrCrc</a>

```
searchKey: gzip.flagHdrCrc
tags: [private]
```

```Go
const flagHdrCrc = 1 << 1
```

### <a id="flagExtra" href="#flagExtra">const flagExtra</a>

```
searchKey: gzip.flagExtra
tags: [private]
```

```Go
const flagExtra = 1 << 2
```

### <a id="flagName" href="#flagName">const flagName</a>

```
searchKey: gzip.flagName
tags: [private]
```

```Go
const flagName = 1 << 3
```

### <a id="flagComment" href="#flagComment">const flagComment</a>

```
searchKey: gzip.flagComment
tags: [private]
```

```Go
const flagComment = 1 << 4
```

### <a id="NoCompression" href="#NoCompression">const NoCompression</a>

```
searchKey: gzip.NoCompression
```

```Go
const NoCompression = flate.NoCompression
```

These constants are copied from the flate package, so that code that imports "compress/gzip" does not also have to import "compress/flate". 

### <a id="BestSpeed" href="#BestSpeed">const BestSpeed</a>

```
searchKey: gzip.BestSpeed
```

```Go
const BestSpeed = flate.BestSpeed
```

These constants are copied from the flate package, so that code that imports "compress/gzip" does not also have to import "compress/flate". 

### <a id="BestCompression" href="#BestCompression">const BestCompression</a>

```
searchKey: gzip.BestCompression
```

```Go
const BestCompression = flate.BestCompression
```

These constants are copied from the flate package, so that code that imports "compress/gzip" does not also have to import "compress/flate". 

### <a id="DefaultCompression" href="#DefaultCompression">const DefaultCompression</a>

```
searchKey: gzip.DefaultCompression
```

```Go
const DefaultCompression = flate.DefaultCompression
```

These constants are copied from the flate package, so that code that imports "compress/gzip" does not also have to import "compress/flate". 

### <a id="HuffmanOnly" href="#HuffmanOnly">const HuffmanOnly</a>

```
searchKey: gzip.HuffmanOnly
```

```Go
const HuffmanOnly = flate.HuffmanOnly
```

These constants are copied from the flate package, so that code that imports "compress/gzip" does not also have to import "compress/flate". 

## <a id="var" href="#var">Variables</a>

### <a id="ErrChecksum" href="#ErrChecksum">var ErrChecksum</a>

```
searchKey: gzip.ErrChecksum
```

```Go
var ErrChecksum = errors.New("gzip: invalid checksum")
```

ErrChecksum is returned when reading GZIP data that has an invalid checksum. 

### <a id="ErrHeader" href="#ErrHeader">var ErrHeader</a>

```
searchKey: gzip.ErrHeader
```

```Go
var ErrHeader = errors.New("gzip: invalid header")
```

ErrHeader is returned when reading GZIP data that has an invalid header. 

### <a id="le" href="#le">var le</a>

```
searchKey: gzip.le
tags: [private]
```

```Go
var le = binary.LittleEndian
```

### <a id="gunzipTests" href="#gunzipTests">var gunzipTests</a>

```
searchKey: gzip.gunzipTests
tags: [private]
```

```Go
var gunzipTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="Header" href="#Header">type Header struct</a>

```
searchKey: gzip.Header
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
```

```Go
func NewReader(r io.Reader) (*Reader, error)
```

NewReader creates a new Reader reading the given reader. If r does not also implement io.ByteReader, the decompressor may read more data than necessary from r. 

It is the caller's responsibility to call Close on the Reader when done. 

The Reader.Header fields will be valid in the Reader returned. 

#### <a id="Reader.Reset" href="#Reader.Reset">func (z *Reader) Reset(r io.Reader) error</a>

```
searchKey: gzip.Reader.Reset
```

```Go
func (z *Reader) Reset(r io.Reader) error
```

Reset discards the Reader z's state and makes it equivalent to the result of its original state from NewReader, but reading from r instead. This permits reusing a Reader rather than allocating a new one. 

#### <a id="Reader.Multistream" href="#Reader.Multistream">func (z *Reader) Multistream(ok bool)</a>

```
searchKey: gzip.Reader.Multistream
```

```Go
func (z *Reader) Multistream(ok bool)
```

Multistream controls whether the reader supports multistream files. 

If enabled (the default), the Reader expects the input to be a sequence of individually gzipped data streams, each with its own header and trailer, ending at EOF. The effect is that the concatenation of a sequence of gzipped files is treated as equivalent to the gzip of the concatenation of the sequence. This is standard behavior for gzip readers. 

Calling Multistream(false) disables this behavior; disabling the behavior can be useful when reading file formats that distinguish individual gzip data streams or mix gzip data streams with other data streams. In this mode, when the Reader reaches the end of the data stream, Read returns io.EOF. The underlying reader must implement io.ByteReader in order to be left positioned just after the gzip stream. To start the next stream, call z.Reset(r) followed by z.Multistream(false). If there is no next stream, z.Reset(r) will return io.EOF. 

#### <a id="Reader.readString" href="#Reader.readString">func (z *Reader) readString() (string, error)</a>

```
searchKey: gzip.Reader.readString
tags: [private]
```

```Go
func (z *Reader) readString() (string, error)
```

readString reads a NUL-terminated string from z.r. It treats the bytes read as being encoded as ISO 8859-1 (Latin-1) and will output a string encoded using UTF-8. This method always updates z.digest with the data read. 

#### <a id="Reader.readHeader" href="#Reader.readHeader">func (z *Reader) readHeader() (hdr Header, err error)</a>

```
searchKey: gzip.Reader.readHeader
tags: [private]
```

```Go
func (z *Reader) readHeader() (hdr Header, err error)
```

readHeader reads the GZIP header according to section 2.3.1. This method does not set z.err. 

#### <a id="Reader.Read" href="#Reader.Read">func (z *Reader) Read(p []byte) (n int, err error)</a>

```
searchKey: gzip.Reader.Read
```

```Go
func (z *Reader) Read(p []byte) (n int, err error)
```

Read implements io.Reader, reading uncompressed bytes from its underlying Reader. 

#### <a id="Reader.Close" href="#Reader.Close">func (z *Reader) Close() error</a>

```
searchKey: gzip.Reader.Close
```

```Go
func (z *Reader) Close() error
```

Close closes the Reader. It does not close the underlying io.Reader. In order for the GZIP checksum to be verified, the reader must be fully consumed until the io.EOF. 

### <a id="Writer" href="#Writer">type Writer struct</a>

```
searchKey: gzip.Writer
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
```

```Go
func NewWriterLevel(w io.Writer, level int) (*Writer, error)
```

NewWriterLevel is like NewWriter but specifies the compression level instead of assuming DefaultCompression. 

The compression level can be DefaultCompression, NoCompression, HuffmanOnly or any integer value between BestSpeed and BestCompression inclusive. The error returned will be nil if the level is valid. 

#### <a id="Writer.init.gzip.go" href="#Writer.init.gzip.go">func (z *Writer) init(w io.Writer, level int)</a>

```
searchKey: gzip.Writer.init
tags: [private]
```

```Go
func (z *Writer) init(w io.Writer, level int)
```

#### <a id="Writer.Reset" href="#Writer.Reset">func (z *Writer) Reset(w io.Writer)</a>

```
searchKey: gzip.Writer.Reset
```

```Go
func (z *Writer) Reset(w io.Writer)
```

Reset discards the Writer z's state and makes it equivalent to the result of its original state from NewWriter or NewWriterLevel, but writing to w instead. This permits reusing a Writer rather than allocating a new one. 

#### <a id="Writer.writeBytes" href="#Writer.writeBytes">func (z *Writer) writeBytes(b []byte) error</a>

```
searchKey: gzip.Writer.writeBytes
tags: [private]
```

```Go
func (z *Writer) writeBytes(b []byte) error
```

writeBytes writes a length-prefixed byte slice to z.w. 

#### <a id="Writer.writeString" href="#Writer.writeString">func (z *Writer) writeString(s string) (err error)</a>

```
searchKey: gzip.Writer.writeString
tags: [private]
```

```Go
func (z *Writer) writeString(s string) (err error)
```

writeString writes a UTF-8 string s in GZIP's format to z.w. GZIP (RFC 1952) specifies that strings are NUL-terminated ISO 8859-1 (Latin-1). 

#### <a id="Writer.Write" href="#Writer.Write">func (z *Writer) Write(p []byte) (int, error)</a>

```
searchKey: gzip.Writer.Write
```

```Go
func (z *Writer) Write(p []byte) (int, error)
```

Write writes a compressed form of p to the underlying io.Writer. The compressed bytes are not necessarily flushed until the Writer is closed. 

#### <a id="Writer.Flush" href="#Writer.Flush">func (z *Writer) Flush() error</a>

```
searchKey: gzip.Writer.Flush
```

```Go
func (z *Writer) Flush() error
```

Flush flushes any pending compressed data to the underlying writer. 

It is useful mainly in compressed network protocols, to ensure that a remote reader has enough data to reconstruct a packet. Flush does not return until the data has been written. If the underlying writer returns an error, Flush returns that error. 

In the terminology of the zlib library, Flush is equivalent to Z_SYNC_FLUSH. 

#### <a id="Writer.Close" href="#Writer.Close">func (z *Writer) Close() error</a>

```
searchKey: gzip.Writer.Close
```

```Go
func (z *Writer) Close() error
```

Close closes the Writer by flushing any unwritten data to the underlying io.Writer and writing the GZIP footer. It does not close the underlying io.Writer. 

### <a id="gunzipTest" href="#gunzipTest">type gunzipTest struct</a>

```
searchKey: gzip.gunzipTest
tags: [private]
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
tags: [private]
```

```Go
type limitedWriter struct {
	N int
}
```

#### <a id="limitedWriter.Write" href="#limitedWriter.Write">func (l *limitedWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: gzip.limitedWriter.Write
tags: [private]
```

```Go
func (l *limitedWriter) Write(p []byte) (n int, err error)
```

## <a id="func" href="#func">Functions</a>

### <a id="noEOF" href="#noEOF">func noEOF(err error) error</a>

```
searchKey: gzip.noEOF
tags: [private]
```

```Go
func noEOF(err error) error
```

noEOF converts io.EOF to io.ErrUnexpectedEOF. 

### <a id="TestDecompressor" href="#TestDecompressor">func TestDecompressor(t *testing.T)</a>

```
searchKey: gzip.TestDecompressor
tags: [private]
```

```Go
func TestDecompressor(t *testing.T)
```

### <a id="TestIssue6550" href="#TestIssue6550">func TestIssue6550(t *testing.T)</a>

```
searchKey: gzip.TestIssue6550
tags: [private]
```

```Go
func TestIssue6550(t *testing.T)
```

### <a id="TestMultistreamFalse" href="#TestMultistreamFalse">func TestMultistreamFalse(t *testing.T)</a>

```
searchKey: gzip.TestMultistreamFalse
tags: [private]
```

```Go
func TestMultistreamFalse(t *testing.T)
```

### <a id="TestNilStream" href="#TestNilStream">func TestNilStream(t *testing.T)</a>

```
searchKey: gzip.TestNilStream
tags: [private]
```

```Go
func TestNilStream(t *testing.T)
```

### <a id="TestTruncatedStreams" href="#TestTruncatedStreams">func TestTruncatedStreams(t *testing.T)</a>

```
searchKey: gzip.TestTruncatedStreams
tags: [private]
```

```Go
func TestTruncatedStreams(t *testing.T)
```

### <a id="TestEmpty" href="#TestEmpty">func TestEmpty(t *testing.T)</a>

```
searchKey: gzip.TestEmpty
tags: [private]
```

```Go
func TestEmpty(t *testing.T)
```

TestEmpty tests that an empty payload still forms a valid GZIP stream. 

### <a id="TestRoundTrip" href="#TestRoundTrip">func TestRoundTrip(t *testing.T)</a>

```
searchKey: gzip.TestRoundTrip
tags: [private]
```

```Go
func TestRoundTrip(t *testing.T)
```

TestRoundTrip tests that gzipping and then gunzipping is the identity function. 

### <a id="TestLatin1" href="#TestLatin1">func TestLatin1(t *testing.T)</a>

```
searchKey: gzip.TestLatin1
tags: [private]
```

```Go
func TestLatin1(t *testing.T)
```

TestLatin1 tests the internal functions for converting to and from Latin-1. 

### <a id="TestLatin1RoundTrip" href="#TestLatin1RoundTrip">func TestLatin1RoundTrip(t *testing.T)</a>

```
searchKey: gzip.TestLatin1RoundTrip
tags: [private]
```

```Go
func TestLatin1RoundTrip(t *testing.T)
```

TestLatin1RoundTrip tests that metadata that is representable in Latin-1 survives a round trip. 

### <a id="TestWriterFlush" href="#TestWriterFlush">func TestWriterFlush(t *testing.T)</a>

```
searchKey: gzip.TestWriterFlush
tags: [private]
```

```Go
func TestWriterFlush(t *testing.T)
```

### <a id="TestConcat" href="#TestConcat">func TestConcat(t *testing.T)</a>

```
searchKey: gzip.TestConcat
tags: [private]
```

```Go
func TestConcat(t *testing.T)
```

Multiple gzip files concatenated form a valid gzip file. 

### <a id="TestWriterReset" href="#TestWriterReset">func TestWriterReset(t *testing.T)</a>

```
searchKey: gzip.TestWriterReset
tags: [private]
```

```Go
func TestWriterReset(t *testing.T)
```

### <a id="TestLimitedWrite" href="#TestLimitedWrite">func TestLimitedWrite(t *testing.T)</a>

```
searchKey: gzip.TestLimitedWrite
tags: [private]
```

```Go
func TestLimitedWrite(t *testing.T)
```

Write should never return more bytes than the input slice. 

### <a id="TestGZIPFilesHaveZeroMTimes" href="#TestGZIPFilesHaveZeroMTimes">func TestGZIPFilesHaveZeroMTimes(t *testing.T)</a>

```
searchKey: gzip.TestGZIPFilesHaveZeroMTimes
tags: [private]
```

```Go
func TestGZIPFilesHaveZeroMTimes(t *testing.T)
```

TestGZIPFilesHaveZeroMTimes checks that every .gz file in the tree has a zero MTIME. This is a requirement for the Debian maintainers to be able to have deterministic packages. 

See [https://golang.org/issue/14937](https://golang.org/issue/14937). 

### <a id="checkZeroMTime" href="#checkZeroMTime">func checkZeroMTime(t *testing.T, path string)</a>

```
searchKey: gzip.checkZeroMTime
tags: [private]
```

```Go
func checkZeroMTime(t *testing.T, path string)
```

