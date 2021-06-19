# Package io_test

## Index

* [Variables](#var)
    * [var pipeTests](#pipeTests)
* [Types](#type)
    * [type Buffer struct](#Buffer)
    * [type writeToChecker struct](#writeToChecker)
        * [func (wt *writeToChecker) WriteTo(w Writer) (int64, error)](#writeToChecker.WriteTo)
    * [type zeroErrReader struct](#zeroErrReader)
        * [func (r zeroErrReader) Read(p []byte) (int, error)](#zeroErrReader.Read)
    * [type errWriter struct](#errWriter)
        * [func (w errWriter) Write([]byte) (int, error)](#errWriter.Write)
    * [type noReadFrom struct](#noReadFrom)
        * [func (w *noReadFrom) Write(p []byte) (n int, err error)](#noReadFrom.Write)
    * [type wantedAndErrReader struct{}](#wantedAndErrReader)
        * [func (wantedAndErrReader) Read(p []byte) (int, error)](#wantedAndErrReader.Read)
    * [type dataAndErrorBuffer struct](#dataAndErrorBuffer)
        * [func (r *dataAndErrorBuffer) Read(p []byte) (n int, err error)](#dataAndErrorBuffer.Read)
    * [type largeWriter struct](#largeWriter)
        * [func (w largeWriter) Write(p []byte) (int, error)](#largeWriter.Write)
    * [type writeStringChecker struct](#writeStringChecker)
        * [func (c *writeStringChecker) WriteString(s string) (n int, err error)](#writeStringChecker.WriteString)
        * [func (c *writeStringChecker) Write(p []byte) (n int, err error)](#writeStringChecker.Write)
    * [type writerFunc func(p []byte) (int, error)](#writerFunc)
        * [func (f writerFunc) Write(p []byte) (int, error)](#writerFunc.Write)
    * [type readerFunc func(p []byte) (int, error)](#readerFunc)
        * [func (f readerFunc) Read(p []byte) (int, error)](#readerFunc.Read)
    * [type byteAndEOFReader byte](#byteAndEOFReader)
        * [func (b byteAndEOFReader) Read(p []byte) (n int, err error)](#byteAndEOFReader.Read)
    * [type pipeReturn struct](#pipeReturn)
    * [type closer interface](#closer)
    * [type pipeTest struct](#pipeTest)
        * [func (p pipeTest) String() string](#pipeTest.String)
* [Functions](#func)
    * [func ExampleCopy()](#ExampleCopy)
    * [func ExampleCopyBuffer()](#ExampleCopyBuffer)
    * [func ExampleCopyN()](#ExampleCopyN)
    * [func ExampleReadAtLeast()](#ExampleReadAtLeast)
    * [func ExampleReadFull()](#ExampleReadFull)
    * [func ExampleWriteString()](#ExampleWriteString)
    * [func ExampleLimitReader()](#ExampleLimitReader)
    * [func ExampleMultiReader()](#ExampleMultiReader)
    * [func ExampleTeeReader()](#ExampleTeeReader)
    * [func ExampleSectionReader()](#ExampleSectionReader)
    * [func ExampleSectionReader_ReadAt()](#ExampleSectionReader_ReadAt)
    * [func ExampleSectionReader_Seek()](#ExampleSectionReader_Seek)
    * [func ExampleSeeker_Seek()](#ExampleSeeker_Seek)
    * [func ExampleMultiWriter()](#ExampleMultiWriter)
    * [func ExamplePipe()](#ExamplePipe)
    * [func ExampleReadAll()](#ExampleReadAll)
    * [func TestCopy(t *testing.T)](#TestCopy)
    * [func TestCopyNegative(t *testing.T)](#TestCopyNegative)
    * [func TestCopyBuffer(t *testing.T)](#TestCopyBuffer)
    * [func TestCopyBufferNil(t *testing.T)](#TestCopyBufferNil)
    * [func TestCopyReadFrom(t *testing.T)](#TestCopyReadFrom)
    * [func TestCopyWriteTo(t *testing.T)](#TestCopyWriteTo)
    * [func TestCopyPriority(t *testing.T)](#TestCopyPriority)
    * [func TestCopyReadErrWriteErr(t *testing.T)](#TestCopyReadErrWriteErr)
    * [func TestCopyN(t *testing.T)](#TestCopyN)
    * [func TestCopyNReadFrom(t *testing.T)](#TestCopyNReadFrom)
    * [func TestCopyNWriteTo(t *testing.T)](#TestCopyNWriteTo)
    * [func BenchmarkCopyNSmall(b *testing.B)](#BenchmarkCopyNSmall)
    * [func BenchmarkCopyNLarge(b *testing.B)](#BenchmarkCopyNLarge)
    * [func TestCopyNEOF(t *testing.T)](#TestCopyNEOF)
    * [func TestReadAtLeast(t *testing.T)](#TestReadAtLeast)
    * [func TestReadAtLeastWithDataAndEOF(t *testing.T)](#TestReadAtLeastWithDataAndEOF)
    * [func TestReadAtLeastWithDataAndError(t *testing.T)](#TestReadAtLeastWithDataAndError)
    * [func testReadAtLeast(t *testing.T, rb ReadWriter)](#testReadAtLeast)
    * [func TestTeeReader(t *testing.T)](#TestTeeReader)
    * [func TestSectionReader_ReadAt(t *testing.T)](#TestSectionReader_ReadAt)
    * [func TestSectionReader_Seek(t *testing.T)](#TestSectionReader_Seek)
    * [func TestSectionReader_Size(t *testing.T)](#TestSectionReader_Size)
    * [func TestCopyLargeWriter(t *testing.T)](#TestCopyLargeWriter)
    * [func TestMultiReader(t *testing.T)](#TestMultiReader)
    * [func TestMultiWriter(t *testing.T)](#TestMultiWriter)
    * [func TestMultiWriter_String(t *testing.T)](#TestMultiWriter_String)
    * [func TestMultiWriter_WriteStringSingleAlloc(t *testing.T)](#TestMultiWriter_WriteStringSingleAlloc)
    * [func TestMultiWriter_StringCheckCall(t *testing.T)](#TestMultiWriter_StringCheckCall)
    * [func testMultiWriter(t *testing.T, sink interface {...](#testMultiWriter)
    * [func TestMultiWriterSingleChainFlatten(t *testing.T)](#TestMultiWriterSingleChainFlatten)
    * [func TestMultiWriterError(t *testing.T)](#TestMultiWriterError)
    * [func TestMultiReaderCopy(t *testing.T)](#TestMultiReaderCopy)
    * [func TestMultiWriterCopy(t *testing.T)](#TestMultiWriterCopy)
    * [func callDepth(callers []uintptr) (depth int)](#callDepth)
    * [func TestMultiReaderFlatten(t *testing.T)](#TestMultiReaderFlatten)
    * [func TestMultiReaderSingleByteWithEOF(t *testing.T)](#TestMultiReaderSingleByteWithEOF)
    * [func TestMultiReaderFinalEOF(t *testing.T)](#TestMultiReaderFinalEOF)
    * [func TestMultiReaderFreesExhaustedReaders(t *testing.T)](#TestMultiReaderFreesExhaustedReaders)
    * [func TestInterleavedMultiReader(t *testing.T)](#TestInterleavedMultiReader)
    * [func checkWrite(t *testing.T, w Writer, data []byte, c chan int)](#checkWrite)
    * [func TestPipe1(t *testing.T)](#TestPipe1)
    * [func reader(t *testing.T, r Reader, c chan int)](#reader)
    * [func TestPipe2(t *testing.T)](#TestPipe2)
    * [func writer(w WriteCloser, buf []byte, c chan pipeReturn)](#writer)
    * [func TestPipe3(t *testing.T)](#TestPipe3)
    * [func delayClose(t *testing.T, cl closer, ch chan int, tt pipeTest)](#delayClose)
    * [func TestPipeReadClose(t *testing.T)](#TestPipeReadClose)
    * [func TestPipeReadClose2(t *testing.T)](#TestPipeReadClose2)
    * [func TestPipeWriteClose(t *testing.T)](#TestPipeWriteClose)
    * [func TestPipeWriteClose2(t *testing.T)](#TestPipeWriteClose2)
    * [func TestWriteEmpty(t *testing.T)](#TestWriteEmpty)
    * [func TestWriteNil(t *testing.T)](#TestWriteNil)
    * [func TestWriteAfterWriterClose(t *testing.T)](#TestWriteAfterWriterClose)
    * [func TestPipeCloseError(t *testing.T)](#TestPipeCloseError)
    * [func TestPipeConcurrent(t *testing.T)](#TestPipeConcurrent)
    * [func sortBytesInGroups(b []byte, n int) []byte](#sortBytesInGroups)


## <a id="var" href="#var">Variables</a>

### <a id="pipeTests" href="#pipeTests">var pipeTests</a>

```
searchKey: io_test.pipeTests
```

```Go
var pipeTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="Buffer" href="#Buffer">type Buffer struct</a>

```
searchKey: io_test.Buffer
```

```Go
type Buffer struct {
	bytes.Buffer
	ReaderFrom // conflicts with and hides bytes.Buffer's ReaderFrom.
	WriterTo   // conflicts with and hides bytes.Buffer's WriterTo.
}
```

A version of bytes.Buffer without ReadFrom and WriteTo 

### <a id="writeToChecker" href="#writeToChecker">type writeToChecker struct</a>

```
searchKey: io_test.writeToChecker
```

```Go
type writeToChecker struct {
	bytes.Buffer
	writeToCalled bool
}
```

Version of bytes.Buffer that checks whether WriteTo was called or not 

#### <a id="writeToChecker.WriteTo" href="#writeToChecker.WriteTo">func (wt *writeToChecker) WriteTo(w Writer) (int64, error)</a>

```
searchKey: io_test.writeToChecker.WriteTo
```

```Go
func (wt *writeToChecker) WriteTo(w Writer) (int64, error)
```

### <a id="zeroErrReader" href="#zeroErrReader">type zeroErrReader struct</a>

```
searchKey: io_test.zeroErrReader
```

```Go
type zeroErrReader struct {
	err error
}
```

#### <a id="zeroErrReader.Read" href="#zeroErrReader.Read">func (r zeroErrReader) Read(p []byte) (int, error)</a>

```
searchKey: io_test.zeroErrReader.Read
```

```Go
func (r zeroErrReader) Read(p []byte) (int, error)
```

### <a id="errWriter" href="#errWriter">type errWriter struct</a>

```
searchKey: io_test.errWriter
```

```Go
type errWriter struct {
	err error
}
```

#### <a id="errWriter.Write" href="#errWriter.Write">func (w errWriter) Write([]byte) (int, error)</a>

```
searchKey: io_test.errWriter.Write
```

```Go
func (w errWriter) Write([]byte) (int, error)
```

### <a id="noReadFrom" href="#noReadFrom">type noReadFrom struct</a>

```
searchKey: io_test.noReadFrom
```

```Go
type noReadFrom struct {
	w Writer
}
```

#### <a id="noReadFrom.Write" href="#noReadFrom.Write">func (w *noReadFrom) Write(p []byte) (n int, err error)</a>

```
searchKey: io_test.noReadFrom.Write
```

```Go
func (w *noReadFrom) Write(p []byte) (n int, err error)
```

### <a id="wantedAndErrReader" href="#wantedAndErrReader">type wantedAndErrReader struct{}</a>

```
searchKey: io_test.wantedAndErrReader
```

```Go
type wantedAndErrReader struct{}
```

#### <a id="wantedAndErrReader.Read" href="#wantedAndErrReader.Read">func (wantedAndErrReader) Read(p []byte) (int, error)</a>

```
searchKey: io_test.wantedAndErrReader.Read
```

```Go
func (wantedAndErrReader) Read(p []byte) (int, error)
```

### <a id="dataAndErrorBuffer" href="#dataAndErrorBuffer">type dataAndErrorBuffer struct</a>

```
searchKey: io_test.dataAndErrorBuffer
```

```Go
type dataAndErrorBuffer struct {
	err error
	bytes.Buffer
}
```

A version of bytes.Buffer that returns n > 0, err on Read when the input is exhausted. 

#### <a id="dataAndErrorBuffer.Read" href="#dataAndErrorBuffer.Read">func (r *dataAndErrorBuffer) Read(p []byte) (n int, err error)</a>

```
searchKey: io_test.dataAndErrorBuffer.Read
```

```Go
func (r *dataAndErrorBuffer) Read(p []byte) (n int, err error)
```

### <a id="largeWriter" href="#largeWriter">type largeWriter struct</a>

```
searchKey: io_test.largeWriter
```

```Go
type largeWriter struct {
	err error
}
```

largeWriter returns an invalid count that is larger than the number of bytes provided (issue 39978). 

#### <a id="largeWriter.Write" href="#largeWriter.Write">func (w largeWriter) Write(p []byte) (int, error)</a>

```
searchKey: io_test.largeWriter.Write
```

```Go
func (w largeWriter) Write(p []byte) (int, error)
```

### <a id="writeStringChecker" href="#writeStringChecker">type writeStringChecker struct</a>

```
searchKey: io_test.writeStringChecker
```

```Go
type writeStringChecker struct{ called bool }
```

#### <a id="writeStringChecker.WriteString" href="#writeStringChecker.WriteString">func (c *writeStringChecker) WriteString(s string) (n int, err error)</a>

```
searchKey: io_test.writeStringChecker.WriteString
```

```Go
func (c *writeStringChecker) WriteString(s string) (n int, err error)
```

#### <a id="writeStringChecker.Write" href="#writeStringChecker.Write">func (c *writeStringChecker) Write(p []byte) (n int, err error)</a>

```
searchKey: io_test.writeStringChecker.Write
```

```Go
func (c *writeStringChecker) Write(p []byte) (n int, err error)
```

### <a id="writerFunc" href="#writerFunc">type writerFunc func(p []byte) (int, error)</a>

```
searchKey: io_test.writerFunc
```

```Go
type writerFunc func(p []byte) (int, error)
```

writerFunc is an Writer implemented by the underlying func. 

#### <a id="writerFunc.Write" href="#writerFunc.Write">func (f writerFunc) Write(p []byte) (int, error)</a>

```
searchKey: io_test.writerFunc.Write
```

```Go
func (f writerFunc) Write(p []byte) (int, error)
```

### <a id="readerFunc" href="#readerFunc">type readerFunc func(p []byte) (int, error)</a>

```
searchKey: io_test.readerFunc
```

```Go
type readerFunc func(p []byte) (int, error)
```

readerFunc is an Reader implemented by the underlying func. 

#### <a id="readerFunc.Read" href="#readerFunc.Read">func (f readerFunc) Read(p []byte) (int, error)</a>

```
searchKey: io_test.readerFunc.Read
```

```Go
func (f readerFunc) Read(p []byte) (int, error)
```

### <a id="byteAndEOFReader" href="#byteAndEOFReader">type byteAndEOFReader byte</a>

```
searchKey: io_test.byteAndEOFReader
```

```Go
type byteAndEOFReader byte
```

byteAndEOFReader is a Reader which reads one byte (the underlying byte) and EOF at once in its Read call. 

#### <a id="byteAndEOFReader.Read" href="#byteAndEOFReader.Read">func (b byteAndEOFReader) Read(p []byte) (n int, err error)</a>

```
searchKey: io_test.byteAndEOFReader.Read
```

```Go
func (b byteAndEOFReader) Read(p []byte) (n int, err error)
```

### <a id="pipeReturn" href="#pipeReturn">type pipeReturn struct</a>

```
searchKey: io_test.pipeReturn
```

```Go
type pipeReturn struct {
	n   int
	err error
}
```

### <a id="closer" href="#closer">type closer interface</a>

```
searchKey: io_test.closer
```

```Go
type closer interface {
	CloseWithError(error) error
	Close() error
}
```

### <a id="pipeTest" href="#pipeTest">type pipeTest struct</a>

```
searchKey: io_test.pipeTest
```

```Go
type pipeTest struct {
	async          bool
	err            error
	closeWithError bool
}
```

#### <a id="pipeTest.String" href="#pipeTest.String">func (p pipeTest) String() string</a>

```
searchKey: io_test.pipeTest.String
```

```Go
func (p pipeTest) String() string
```

## <a id="func" href="#func">Functions</a>

### <a id="ExampleCopy" href="#ExampleCopy">func ExampleCopy()</a>

```
searchKey: io_test.ExampleCopy
```

```Go
func ExampleCopy()
```

### <a id="ExampleCopyBuffer" href="#ExampleCopyBuffer">func ExampleCopyBuffer()</a>

```
searchKey: io_test.ExampleCopyBuffer
```

```Go
func ExampleCopyBuffer()
```

### <a id="ExampleCopyN" href="#ExampleCopyN">func ExampleCopyN()</a>

```
searchKey: io_test.ExampleCopyN
```

```Go
func ExampleCopyN()
```

### <a id="ExampleReadAtLeast" href="#ExampleReadAtLeast">func ExampleReadAtLeast()</a>

```
searchKey: io_test.ExampleReadAtLeast
```

```Go
func ExampleReadAtLeast()
```

### <a id="ExampleReadFull" href="#ExampleReadFull">func ExampleReadFull()</a>

```
searchKey: io_test.ExampleReadFull
```

```Go
func ExampleReadFull()
```

### <a id="ExampleWriteString" href="#ExampleWriteString">func ExampleWriteString()</a>

```
searchKey: io_test.ExampleWriteString
```

```Go
func ExampleWriteString()
```

### <a id="ExampleLimitReader" href="#ExampleLimitReader">func ExampleLimitReader()</a>

```
searchKey: io_test.ExampleLimitReader
```

```Go
func ExampleLimitReader()
```

### <a id="ExampleMultiReader" href="#ExampleMultiReader">func ExampleMultiReader()</a>

```
searchKey: io_test.ExampleMultiReader
```

```Go
func ExampleMultiReader()
```

### <a id="ExampleTeeReader" href="#ExampleTeeReader">func ExampleTeeReader()</a>

```
searchKey: io_test.ExampleTeeReader
```

```Go
func ExampleTeeReader()
```

### <a id="ExampleSectionReader" href="#ExampleSectionReader">func ExampleSectionReader()</a>

```
searchKey: io_test.ExampleSectionReader
```

```Go
func ExampleSectionReader()
```

### <a id="ExampleSectionReader_ReadAt" href="#ExampleSectionReader_ReadAt">func ExampleSectionReader_ReadAt()</a>

```
searchKey: io_test.ExampleSectionReader_ReadAt
```

```Go
func ExampleSectionReader_ReadAt()
```

### <a id="ExampleSectionReader_Seek" href="#ExampleSectionReader_Seek">func ExampleSectionReader_Seek()</a>

```
searchKey: io_test.ExampleSectionReader_Seek
```

```Go
func ExampleSectionReader_Seek()
```

### <a id="ExampleSeeker_Seek" href="#ExampleSeeker_Seek">func ExampleSeeker_Seek()</a>

```
searchKey: io_test.ExampleSeeker_Seek
```

```Go
func ExampleSeeker_Seek()
```

### <a id="ExampleMultiWriter" href="#ExampleMultiWriter">func ExampleMultiWriter()</a>

```
searchKey: io_test.ExampleMultiWriter
```

```Go
func ExampleMultiWriter()
```

### <a id="ExamplePipe" href="#ExamplePipe">func ExamplePipe()</a>

```
searchKey: io_test.ExamplePipe
```

```Go
func ExamplePipe()
```

### <a id="ExampleReadAll" href="#ExampleReadAll">func ExampleReadAll()</a>

```
searchKey: io_test.ExampleReadAll
```

```Go
func ExampleReadAll()
```

### <a id="TestCopy" href="#TestCopy">func TestCopy(t *testing.T)</a>

```
searchKey: io_test.TestCopy
```

```Go
func TestCopy(t *testing.T)
```

### <a id="TestCopyNegative" href="#TestCopyNegative">func TestCopyNegative(t *testing.T)</a>

```
searchKey: io_test.TestCopyNegative
```

```Go
func TestCopyNegative(t *testing.T)
```

### <a id="TestCopyBuffer" href="#TestCopyBuffer">func TestCopyBuffer(t *testing.T)</a>

```
searchKey: io_test.TestCopyBuffer
```

```Go
func TestCopyBuffer(t *testing.T)
```

### <a id="TestCopyBufferNil" href="#TestCopyBufferNil">func TestCopyBufferNil(t *testing.T)</a>

```
searchKey: io_test.TestCopyBufferNil
```

```Go
func TestCopyBufferNil(t *testing.T)
```

### <a id="TestCopyReadFrom" href="#TestCopyReadFrom">func TestCopyReadFrom(t *testing.T)</a>

```
searchKey: io_test.TestCopyReadFrom
```

```Go
func TestCopyReadFrom(t *testing.T)
```

### <a id="TestCopyWriteTo" href="#TestCopyWriteTo">func TestCopyWriteTo(t *testing.T)</a>

```
searchKey: io_test.TestCopyWriteTo
```

```Go
func TestCopyWriteTo(t *testing.T)
```

### <a id="TestCopyPriority" href="#TestCopyPriority">func TestCopyPriority(t *testing.T)</a>

```
searchKey: io_test.TestCopyPriority
```

```Go
func TestCopyPriority(t *testing.T)
```

It's preferable to choose WriterTo over ReaderFrom, since a WriterTo can issue one large write, while the ReaderFrom must read until EOF, potentially allocating when running out of buffer. Make sure that we choose WriterTo when both are implemented. 

### <a id="TestCopyReadErrWriteErr" href="#TestCopyReadErrWriteErr">func TestCopyReadErrWriteErr(t *testing.T)</a>

```
searchKey: io_test.TestCopyReadErrWriteErr
```

```Go
func TestCopyReadErrWriteErr(t *testing.T)
```

In case a Read results in an error with non-zero bytes read, and the subsequent Write also results in an error, the error from Write is returned, as it is the one that prevented progressing further. 

### <a id="TestCopyN" href="#TestCopyN">func TestCopyN(t *testing.T)</a>

```
searchKey: io_test.TestCopyN
```

```Go
func TestCopyN(t *testing.T)
```

### <a id="TestCopyNReadFrom" href="#TestCopyNReadFrom">func TestCopyNReadFrom(t *testing.T)</a>

```
searchKey: io_test.TestCopyNReadFrom
```

```Go
func TestCopyNReadFrom(t *testing.T)
```

### <a id="TestCopyNWriteTo" href="#TestCopyNWriteTo">func TestCopyNWriteTo(t *testing.T)</a>

```
searchKey: io_test.TestCopyNWriteTo
```

```Go
func TestCopyNWriteTo(t *testing.T)
```

### <a id="BenchmarkCopyNSmall" href="#BenchmarkCopyNSmall">func BenchmarkCopyNSmall(b *testing.B)</a>

```
searchKey: io_test.BenchmarkCopyNSmall
```

```Go
func BenchmarkCopyNSmall(b *testing.B)
```

### <a id="BenchmarkCopyNLarge" href="#BenchmarkCopyNLarge">func BenchmarkCopyNLarge(b *testing.B)</a>

```
searchKey: io_test.BenchmarkCopyNLarge
```

```Go
func BenchmarkCopyNLarge(b *testing.B)
```

### <a id="TestCopyNEOF" href="#TestCopyNEOF">func TestCopyNEOF(t *testing.T)</a>

```
searchKey: io_test.TestCopyNEOF
```

```Go
func TestCopyNEOF(t *testing.T)
```

### <a id="TestReadAtLeast" href="#TestReadAtLeast">func TestReadAtLeast(t *testing.T)</a>

```
searchKey: io_test.TestReadAtLeast
```

```Go
func TestReadAtLeast(t *testing.T)
```

### <a id="TestReadAtLeastWithDataAndEOF" href="#TestReadAtLeastWithDataAndEOF">func TestReadAtLeastWithDataAndEOF(t *testing.T)</a>

```
searchKey: io_test.TestReadAtLeastWithDataAndEOF
```

```Go
func TestReadAtLeastWithDataAndEOF(t *testing.T)
```

### <a id="TestReadAtLeastWithDataAndError" href="#TestReadAtLeastWithDataAndError">func TestReadAtLeastWithDataAndError(t *testing.T)</a>

```
searchKey: io_test.TestReadAtLeastWithDataAndError
```

```Go
func TestReadAtLeastWithDataAndError(t *testing.T)
```

### <a id="testReadAtLeast" href="#testReadAtLeast">func testReadAtLeast(t *testing.T, rb ReadWriter)</a>

```
searchKey: io_test.testReadAtLeast
```

```Go
func testReadAtLeast(t *testing.T, rb ReadWriter)
```

### <a id="TestTeeReader" href="#TestTeeReader">func TestTeeReader(t *testing.T)</a>

```
searchKey: io_test.TestTeeReader
```

```Go
func TestTeeReader(t *testing.T)
```

### <a id="TestSectionReader_ReadAt" href="#TestSectionReader_ReadAt">func TestSectionReader_ReadAt(t *testing.T)</a>

```
searchKey: io_test.TestSectionReader_ReadAt
```

```Go
func TestSectionReader_ReadAt(t *testing.T)
```

### <a id="TestSectionReader_Seek" href="#TestSectionReader_Seek">func TestSectionReader_Seek(t *testing.T)</a>

```
searchKey: io_test.TestSectionReader_Seek
```

```Go
func TestSectionReader_Seek(t *testing.T)
```

### <a id="TestSectionReader_Size" href="#TestSectionReader_Size">func TestSectionReader_Size(t *testing.T)</a>

```
searchKey: io_test.TestSectionReader_Size
```

```Go
func TestSectionReader_Size(t *testing.T)
```

### <a id="TestCopyLargeWriter" href="#TestCopyLargeWriter">func TestCopyLargeWriter(t *testing.T)</a>

```
searchKey: io_test.TestCopyLargeWriter
```

```Go
func TestCopyLargeWriter(t *testing.T)
```

### <a id="TestMultiReader" href="#TestMultiReader">func TestMultiReader(t *testing.T)</a>

```
searchKey: io_test.TestMultiReader
```

```Go
func TestMultiReader(t *testing.T)
```

### <a id="TestMultiWriter" href="#TestMultiWriter">func TestMultiWriter(t *testing.T)</a>

```
searchKey: io_test.TestMultiWriter
```

```Go
func TestMultiWriter(t *testing.T)
```

### <a id="TestMultiWriter_String" href="#TestMultiWriter_String">func TestMultiWriter_String(t *testing.T)</a>

```
searchKey: io_test.TestMultiWriter_String
```

```Go
func TestMultiWriter_String(t *testing.T)
```

### <a id="TestMultiWriter_WriteStringSingleAlloc" href="#TestMultiWriter_WriteStringSingleAlloc">func TestMultiWriter_WriteStringSingleAlloc(t *testing.T)</a>

```
searchKey: io_test.TestMultiWriter_WriteStringSingleAlloc
```

```Go
func TestMultiWriter_WriteStringSingleAlloc(t *testing.T)
```

Test that a multiWriter.WriteString calls results in at most 1 allocation, even if multiple targets don't support WriteString. 

### <a id="TestMultiWriter_StringCheckCall" href="#TestMultiWriter_StringCheckCall">func TestMultiWriter_StringCheckCall(t *testing.T)</a>

```
searchKey: io_test.TestMultiWriter_StringCheckCall
```

```Go
func TestMultiWriter_StringCheckCall(t *testing.T)
```

### <a id="testMultiWriter" href="#testMultiWriter">func testMultiWriter(t *testing.T, sink interface {...</a>

```
searchKey: io_test.testMultiWriter
```

```Go
func testMultiWriter(t *testing.T, sink interface {
	Writer
	fmt.Stringer
})
```

### <a id="TestMultiWriterSingleChainFlatten" href="#TestMultiWriterSingleChainFlatten">func TestMultiWriterSingleChainFlatten(t *testing.T)</a>

```
searchKey: io_test.TestMultiWriterSingleChainFlatten
```

```Go
func TestMultiWriterSingleChainFlatten(t *testing.T)
```

Test that MultiWriter properly flattens chained multiWriters. 

### <a id="TestMultiWriterError" href="#TestMultiWriterError">func TestMultiWriterError(t *testing.T)</a>

```
searchKey: io_test.TestMultiWriterError
```

```Go
func TestMultiWriterError(t *testing.T)
```

### <a id="TestMultiReaderCopy" href="#TestMultiReaderCopy">func TestMultiReaderCopy(t *testing.T)</a>

```
searchKey: io_test.TestMultiReaderCopy
```

```Go
func TestMultiReaderCopy(t *testing.T)
```

Test that MultiReader copies the input slice and is insulated from future modification. 

### <a id="TestMultiWriterCopy" href="#TestMultiWriterCopy">func TestMultiWriterCopy(t *testing.T)</a>

```
searchKey: io_test.TestMultiWriterCopy
```

```Go
func TestMultiWriterCopy(t *testing.T)
```

Test that MultiWriter copies the input slice and is insulated from future modification. 

### <a id="callDepth" href="#callDepth">func callDepth(callers []uintptr) (depth int)</a>

```
searchKey: io_test.callDepth
```

```Go
func callDepth(callers []uintptr) (depth int)
```

callDepth returns the logical call depth for the given PCs. 

### <a id="TestMultiReaderFlatten" href="#TestMultiReaderFlatten">func TestMultiReaderFlatten(t *testing.T)</a>

```
searchKey: io_test.TestMultiReaderFlatten
```

```Go
func TestMultiReaderFlatten(t *testing.T)
```

Test that MultiReader properly flattens chained multiReaders when Read is called 

### <a id="TestMultiReaderSingleByteWithEOF" href="#TestMultiReaderSingleByteWithEOF">func TestMultiReaderSingleByteWithEOF(t *testing.T)</a>

```
searchKey: io_test.TestMultiReaderSingleByteWithEOF
```

```Go
func TestMultiReaderSingleByteWithEOF(t *testing.T)
```

This used to yield bytes forever; issue 16795. 

### <a id="TestMultiReaderFinalEOF" href="#TestMultiReaderFinalEOF">func TestMultiReaderFinalEOF(t *testing.T)</a>

```
searchKey: io_test.TestMultiReaderFinalEOF
```

```Go
func TestMultiReaderFinalEOF(t *testing.T)
```

Test that a reader returning (n, EOF) at the end of a MultiReader chain continues to return EOF on its final read, rather than yielding a (0, EOF). 

### <a id="TestMultiReaderFreesExhaustedReaders" href="#TestMultiReaderFreesExhaustedReaders">func TestMultiReaderFreesExhaustedReaders(t *testing.T)</a>

```
searchKey: io_test.TestMultiReaderFreesExhaustedReaders
```

```Go
func TestMultiReaderFreesExhaustedReaders(t *testing.T)
```

### <a id="TestInterleavedMultiReader" href="#TestInterleavedMultiReader">func TestInterleavedMultiReader(t *testing.T)</a>

```
searchKey: io_test.TestInterleavedMultiReader
```

```Go
func TestInterleavedMultiReader(t *testing.T)
```

### <a id="checkWrite" href="#checkWrite">func checkWrite(t *testing.T, w Writer, data []byte, c chan int)</a>

```
searchKey: io_test.checkWrite
```

```Go
func checkWrite(t *testing.T, w Writer, data []byte, c chan int)
```

### <a id="TestPipe1" href="#TestPipe1">func TestPipe1(t *testing.T)</a>

```
searchKey: io_test.TestPipe1
```

```Go
func TestPipe1(t *testing.T)
```

Test a single read/write pair. 

### <a id="reader" href="#reader">func reader(t *testing.T, r Reader, c chan int)</a>

```
searchKey: io_test.reader
```

```Go
func reader(t *testing.T, r Reader, c chan int)
```

### <a id="TestPipe2" href="#TestPipe2">func TestPipe2(t *testing.T)</a>

```
searchKey: io_test.TestPipe2
```

```Go
func TestPipe2(t *testing.T)
```

Test a sequence of read/write pairs. 

### <a id="writer" href="#writer">func writer(w WriteCloser, buf []byte, c chan pipeReturn)</a>

```
searchKey: io_test.writer
```

```Go
func writer(w WriteCloser, buf []byte, c chan pipeReturn)
```

Test a large write that requires multiple reads to satisfy. 

### <a id="TestPipe3" href="#TestPipe3">func TestPipe3(t *testing.T)</a>

```
searchKey: io_test.TestPipe3
```

```Go
func TestPipe3(t *testing.T)
```

### <a id="delayClose" href="#delayClose">func delayClose(t *testing.T, cl closer, ch chan int, tt pipeTest)</a>

```
searchKey: io_test.delayClose
```

```Go
func delayClose(t *testing.T, cl closer, ch chan int, tt pipeTest)
```

### <a id="TestPipeReadClose" href="#TestPipeReadClose">func TestPipeReadClose(t *testing.T)</a>

```
searchKey: io_test.TestPipeReadClose
```

```Go
func TestPipeReadClose(t *testing.T)
```

### <a id="TestPipeReadClose2" href="#TestPipeReadClose2">func TestPipeReadClose2(t *testing.T)</a>

```
searchKey: io_test.TestPipeReadClose2
```

```Go
func TestPipeReadClose2(t *testing.T)
```

Test close on Read side during Read. 

### <a id="TestPipeWriteClose" href="#TestPipeWriteClose">func TestPipeWriteClose(t *testing.T)</a>

```
searchKey: io_test.TestPipeWriteClose
```

```Go
func TestPipeWriteClose(t *testing.T)
```

### <a id="TestPipeWriteClose2" href="#TestPipeWriteClose2">func TestPipeWriteClose2(t *testing.T)</a>

```
searchKey: io_test.TestPipeWriteClose2
```

```Go
func TestPipeWriteClose2(t *testing.T)
```

Test close on Write side during Write. 

### <a id="TestWriteEmpty" href="#TestWriteEmpty">func TestWriteEmpty(t *testing.T)</a>

```
searchKey: io_test.TestWriteEmpty
```

```Go
func TestWriteEmpty(t *testing.T)
```

### <a id="TestWriteNil" href="#TestWriteNil">func TestWriteNil(t *testing.T)</a>

```
searchKey: io_test.TestWriteNil
```

```Go
func TestWriteNil(t *testing.T)
```

### <a id="TestWriteAfterWriterClose" href="#TestWriteAfterWriterClose">func TestWriteAfterWriterClose(t *testing.T)</a>

```
searchKey: io_test.TestWriteAfterWriterClose
```

```Go
func TestWriteAfterWriterClose(t *testing.T)
```

### <a id="TestPipeCloseError" href="#TestPipeCloseError">func TestPipeCloseError(t *testing.T)</a>

```
searchKey: io_test.TestPipeCloseError
```

```Go
func TestPipeCloseError(t *testing.T)
```

### <a id="TestPipeConcurrent" href="#TestPipeConcurrent">func TestPipeConcurrent(t *testing.T)</a>

```
searchKey: io_test.TestPipeConcurrent
```

```Go
func TestPipeConcurrent(t *testing.T)
```

### <a id="sortBytesInGroups" href="#sortBytesInGroups">func sortBytesInGroups(b []byte, n int) []byte</a>

```
searchKey: io_test.sortBytesInGroups
```

```Go
func sortBytesInGroups(b []byte, n int) []byte
```

