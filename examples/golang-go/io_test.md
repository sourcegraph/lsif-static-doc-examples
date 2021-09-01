# Package io_test

## Index

* [Variables](#var)
    * [var pipeTests](#pipeTests)
* [Types](#type)
    * [type Buffer struct](#Buffer)
    * [type byteAndEOFReader byte](#byteAndEOFReader)
        * [func (b byteAndEOFReader) Read(p []byte) (n int, err error)](#byteAndEOFReader.Read)
    * [type closer interface](#closer)
    * [type dataAndErrorBuffer struct](#dataAndErrorBuffer)
        * [func (r *dataAndErrorBuffer) Read(p []byte) (n int, err error)](#dataAndErrorBuffer.Read)
    * [type errWriter struct](#errWriter)
        * [func (w errWriter) Write([]byte) (int, error)](#errWriter.Write)
    * [type largeWriter struct](#largeWriter)
        * [func (w largeWriter) Write(p []byte) (int, error)](#largeWriter.Write)
    * [type noReadFrom struct](#noReadFrom)
        * [func (w *noReadFrom) Write(p []byte) (n int, err error)](#noReadFrom.Write)
    * [type pipeReturn struct](#pipeReturn)
    * [type pipeTest struct](#pipeTest)
        * [func (p pipeTest) String() string](#pipeTest.String)
    * [type readerFunc func(p []byte) (int, error)](#readerFunc)
        * [func (f readerFunc) Read(p []byte) (int, error)](#readerFunc.Read)
    * [type wantedAndErrReader struct{}](#wantedAndErrReader)
        * [func (wantedAndErrReader) Read(p []byte) (int, error)](#wantedAndErrReader.Read)
    * [type writeStringChecker struct](#writeStringChecker)
        * [func (c *writeStringChecker) Write(p []byte) (n int, err error)](#writeStringChecker.Write)
        * [func (c *writeStringChecker) WriteString(s string) (n int, err error)](#writeStringChecker.WriteString)
    * [type writeToChecker struct](#writeToChecker)
        * [func (wt *writeToChecker) WriteTo(w Writer) (int64, error)](#writeToChecker.WriteTo)
    * [type writerFunc func(p []byte) (int, error)](#writerFunc)
        * [func (f writerFunc) Write(p []byte) (int, error)](#writerFunc.Write)
    * [type zeroErrReader struct](#zeroErrReader)
        * [func (r zeroErrReader) Read(p []byte) (int, error)](#zeroErrReader.Read)
* [Functions](#func)
    * [func BenchmarkCopyNLarge(b *testing.B)](#BenchmarkCopyNLarge)
    * [func BenchmarkCopyNSmall(b *testing.B)](#BenchmarkCopyNSmall)
    * [func ExampleCopy()](#ExampleCopy)
    * [func ExampleCopyBuffer()](#ExampleCopyBuffer)
    * [func ExampleCopyN()](#ExampleCopyN)
    * [func ExampleLimitReader()](#ExampleLimitReader)
    * [func ExampleMultiReader()](#ExampleMultiReader)
    * [func ExampleMultiWriter()](#ExampleMultiWriter)
    * [func ExamplePipe()](#ExamplePipe)
    * [func ExampleReadAll()](#ExampleReadAll)
    * [func ExampleReadAtLeast()](#ExampleReadAtLeast)
    * [func ExampleReadFull()](#ExampleReadFull)
    * [func ExampleSectionReader()](#ExampleSectionReader)
    * [func ExampleSectionReader_ReadAt()](#ExampleSectionReader_ReadAt)
    * [func ExampleSectionReader_Seek()](#ExampleSectionReader_Seek)
    * [func ExampleSeeker_Seek()](#ExampleSeeker_Seek)
    * [func ExampleTeeReader()](#ExampleTeeReader)
    * [func ExampleWriteString()](#ExampleWriteString)
    * [func TestCopy(t *testing.T)](#TestCopy)
    * [func TestCopyBuffer(t *testing.T)](#TestCopyBuffer)
    * [func TestCopyBufferNil(t *testing.T)](#TestCopyBufferNil)
    * [func TestCopyLargeWriter(t *testing.T)](#TestCopyLargeWriter)
    * [func TestCopyN(t *testing.T)](#TestCopyN)
    * [func TestCopyNEOF(t *testing.T)](#TestCopyNEOF)
    * [func TestCopyNReadFrom(t *testing.T)](#TestCopyNReadFrom)
    * [func TestCopyNWriteTo(t *testing.T)](#TestCopyNWriteTo)
    * [func TestCopyNegative(t *testing.T)](#TestCopyNegative)
    * [func TestCopyPriority(t *testing.T)](#TestCopyPriority)
    * [func TestCopyReadErrWriteErr(t *testing.T)](#TestCopyReadErrWriteErr)
    * [func TestCopyReadFrom(t *testing.T)](#TestCopyReadFrom)
    * [func TestCopyWriteTo(t *testing.T)](#TestCopyWriteTo)
    * [func TestInterleavedMultiReader(t *testing.T)](#TestInterleavedMultiReader)
    * [func TestMultiReader(t *testing.T)](#TestMultiReader)
    * [func TestMultiReaderCopy(t *testing.T)](#TestMultiReaderCopy)
    * [func TestMultiReaderFinalEOF(t *testing.T)](#TestMultiReaderFinalEOF)
    * [func TestMultiReaderFlatten(t *testing.T)](#TestMultiReaderFlatten)
    * [func TestMultiReaderFreesExhaustedReaders(t *testing.T)](#TestMultiReaderFreesExhaustedReaders)
    * [func TestMultiReaderSingleByteWithEOF(t *testing.T)](#TestMultiReaderSingleByteWithEOF)
    * [func TestMultiWriter(t *testing.T)](#TestMultiWriter)
    * [func TestMultiWriterCopy(t *testing.T)](#TestMultiWriterCopy)
    * [func TestMultiWriterError(t *testing.T)](#TestMultiWriterError)
    * [func TestMultiWriterSingleChainFlatten(t *testing.T)](#TestMultiWriterSingleChainFlatten)
    * [func TestMultiWriter_String(t *testing.T)](#TestMultiWriter_String)
    * [func TestMultiWriter_StringCheckCall(t *testing.T)](#TestMultiWriter_StringCheckCall)
    * [func TestMultiWriter_WriteStringSingleAlloc(t *testing.T)](#TestMultiWriter_WriteStringSingleAlloc)
    * [func TestPipe1(t *testing.T)](#TestPipe1)
    * [func TestPipe2(t *testing.T)](#TestPipe2)
    * [func TestPipe3(t *testing.T)](#TestPipe3)
    * [func TestPipeCloseError(t *testing.T)](#TestPipeCloseError)
    * [func TestPipeConcurrent(t *testing.T)](#TestPipeConcurrent)
    * [func TestPipeReadClose(t *testing.T)](#TestPipeReadClose)
    * [func TestPipeReadClose2(t *testing.T)](#TestPipeReadClose2)
    * [func TestPipeWriteClose(t *testing.T)](#TestPipeWriteClose)
    * [func TestPipeWriteClose2(t *testing.T)](#TestPipeWriteClose2)
    * [func TestReadAtLeast(t *testing.T)](#TestReadAtLeast)
    * [func TestReadAtLeastWithDataAndEOF(t *testing.T)](#TestReadAtLeastWithDataAndEOF)
    * [func TestReadAtLeastWithDataAndError(t *testing.T)](#TestReadAtLeastWithDataAndError)
    * [func TestSectionReader_ReadAt(t *testing.T)](#TestSectionReader_ReadAt)
    * [func TestSectionReader_Seek(t *testing.T)](#TestSectionReader_Seek)
    * [func TestSectionReader_Size(t *testing.T)](#TestSectionReader_Size)
    * [func TestTeeReader(t *testing.T)](#TestTeeReader)
    * [func TestWriteAfterWriterClose(t *testing.T)](#TestWriteAfterWriterClose)
    * [func TestWriteEmpty(t *testing.T)](#TestWriteEmpty)
    * [func TestWriteNil(t *testing.T)](#TestWriteNil)
    * [func callDepth(callers []uintptr) (depth int)](#callDepth)
    * [func checkWrite(t *testing.T, w Writer, data []byte, c chan int)](#checkWrite)
    * [func delayClose(t *testing.T, cl closer, ch chan int, tt pipeTest)](#delayClose)
    * [func reader(t *testing.T, r Reader, c chan int)](#reader)
    * [func sortBytesInGroups(b []byte, n int) []byte](#sortBytesInGroups)
    * [func testMultiWriter(t *testing.T, sink interface {...](#testMultiWriter)
    * [func testReadAtLeast(t *testing.T, rb ReadWriter)](#testReadAtLeast)
    * [func writer(w WriteCloser, buf []byte, c chan pipeReturn)](#writer)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="pipeTests" href="#pipeTests">var pipeTests</a>

```
searchKey: io_test.pipeTests
tags: [variable array struct private]
```

```Go
var pipeTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Buffer" href="#Buffer">type Buffer struct</a>

```
searchKey: io_test.Buffer
tags: [struct private]
```

```Go
type Buffer struct {
	bytes.Buffer
	ReaderFrom // conflicts with and hides bytes.Buffer's ReaderFrom.
	WriterTo   // conflicts with and hides bytes.Buffer's WriterTo.
}
```

A version of bytes.Buffer without ReadFrom and WriteTo 

### <a id="byteAndEOFReader" href="#byteAndEOFReader">type byteAndEOFReader byte</a>

```
searchKey: io_test.byteAndEOFReader
tags: [number private]
```

```Go
type byteAndEOFReader byte
```

byteAndEOFReader is a Reader which reads one byte (the underlying byte) and EOF at once in its Read call. 

#### <a id="byteAndEOFReader.Read" href="#byteAndEOFReader.Read">func (b byteAndEOFReader) Read(p []byte) (n int, err error)</a>

```
searchKey: io_test.byteAndEOFReader.Read
tags: [method private]
```

```Go
func (b byteAndEOFReader) Read(p []byte) (n int, err error)
```

### <a id="closer" href="#closer">type closer interface</a>

```
searchKey: io_test.closer
tags: [interface private]
```

```Go
type closer interface {
	CloseWithError(error) error
	Close() error
}
```

### <a id="dataAndErrorBuffer" href="#dataAndErrorBuffer">type dataAndErrorBuffer struct</a>

```
searchKey: io_test.dataAndErrorBuffer
tags: [struct private]
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
tags: [method private]
```

```Go
func (r *dataAndErrorBuffer) Read(p []byte) (n int, err error)
```

### <a id="errWriter" href="#errWriter">type errWriter struct</a>

```
searchKey: io_test.errWriter
tags: [struct private]
```

```Go
type errWriter struct {
	err error
}
```

#### <a id="errWriter.Write" href="#errWriter.Write">func (w errWriter) Write([]byte) (int, error)</a>

```
searchKey: io_test.errWriter.Write
tags: [method private]
```

```Go
func (w errWriter) Write([]byte) (int, error)
```

### <a id="largeWriter" href="#largeWriter">type largeWriter struct</a>

```
searchKey: io_test.largeWriter
tags: [struct private]
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
tags: [method private]
```

```Go
func (w largeWriter) Write(p []byte) (int, error)
```

### <a id="noReadFrom" href="#noReadFrom">type noReadFrom struct</a>

```
searchKey: io_test.noReadFrom
tags: [struct private]
```

```Go
type noReadFrom struct {
	w Writer
}
```

#### <a id="noReadFrom.Write" href="#noReadFrom.Write">func (w *noReadFrom) Write(p []byte) (n int, err error)</a>

```
searchKey: io_test.noReadFrom.Write
tags: [method private]
```

```Go
func (w *noReadFrom) Write(p []byte) (n int, err error)
```

### <a id="pipeReturn" href="#pipeReturn">type pipeReturn struct</a>

```
searchKey: io_test.pipeReturn
tags: [struct private]
```

```Go
type pipeReturn struct {
	n   int
	err error
}
```

### <a id="pipeTest" href="#pipeTest">type pipeTest struct</a>

```
searchKey: io_test.pipeTest
tags: [struct private]
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
tags: [method private]
```

```Go
func (p pipeTest) String() string
```

### <a id="readerFunc" href="#readerFunc">type readerFunc func(p []byte) (int, error)</a>

```
searchKey: io_test.readerFunc
tags: [function private]
```

```Go
type readerFunc func(p []byte) (int, error)
```

readerFunc is an Reader implemented by the underlying func. 

#### <a id="readerFunc.Read" href="#readerFunc.Read">func (f readerFunc) Read(p []byte) (int, error)</a>

```
searchKey: io_test.readerFunc.Read
tags: [method private]
```

```Go
func (f readerFunc) Read(p []byte) (int, error)
```

### <a id="wantedAndErrReader" href="#wantedAndErrReader">type wantedAndErrReader struct{}</a>

```
searchKey: io_test.wantedAndErrReader
tags: [struct private]
```

```Go
type wantedAndErrReader struct{}
```

#### <a id="wantedAndErrReader.Read" href="#wantedAndErrReader.Read">func (wantedAndErrReader) Read(p []byte) (int, error)</a>

```
searchKey: io_test.wantedAndErrReader.Read
tags: [method private]
```

```Go
func (wantedAndErrReader) Read(p []byte) (int, error)
```

### <a id="writeStringChecker" href="#writeStringChecker">type writeStringChecker struct</a>

```
searchKey: io_test.writeStringChecker
tags: [struct private]
```

```Go
type writeStringChecker struct{ called bool }
```

#### <a id="writeStringChecker.Write" href="#writeStringChecker.Write">func (c *writeStringChecker) Write(p []byte) (n int, err error)</a>

```
searchKey: io_test.writeStringChecker.Write
tags: [method private]
```

```Go
func (c *writeStringChecker) Write(p []byte) (n int, err error)
```

#### <a id="writeStringChecker.WriteString" href="#writeStringChecker.WriteString">func (c *writeStringChecker) WriteString(s string) (n int, err error)</a>

```
searchKey: io_test.writeStringChecker.WriteString
tags: [method private]
```

```Go
func (c *writeStringChecker) WriteString(s string) (n int, err error)
```

### <a id="writeToChecker" href="#writeToChecker">type writeToChecker struct</a>

```
searchKey: io_test.writeToChecker
tags: [struct private]
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
tags: [method private]
```

```Go
func (wt *writeToChecker) WriteTo(w Writer) (int64, error)
```

### <a id="writerFunc" href="#writerFunc">type writerFunc func(p []byte) (int, error)</a>

```
searchKey: io_test.writerFunc
tags: [function private]
```

```Go
type writerFunc func(p []byte) (int, error)
```

writerFunc is an Writer implemented by the underlying func. 

#### <a id="writerFunc.Write" href="#writerFunc.Write">func (f writerFunc) Write(p []byte) (int, error)</a>

```
searchKey: io_test.writerFunc.Write
tags: [method private]
```

```Go
func (f writerFunc) Write(p []byte) (int, error)
```

### <a id="zeroErrReader" href="#zeroErrReader">type zeroErrReader struct</a>

```
searchKey: io_test.zeroErrReader
tags: [struct private]
```

```Go
type zeroErrReader struct {
	err error
}
```

#### <a id="zeroErrReader.Read" href="#zeroErrReader.Read">func (r zeroErrReader) Read(p []byte) (int, error)</a>

```
searchKey: io_test.zeroErrReader.Read
tags: [method private]
```

```Go
func (r zeroErrReader) Read(p []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="BenchmarkCopyNLarge" href="#BenchmarkCopyNLarge">func BenchmarkCopyNLarge(b *testing.B)</a>

```
searchKey: io_test.BenchmarkCopyNLarge
tags: [function private benchmark]
```

```Go
func BenchmarkCopyNLarge(b *testing.B)
```

### <a id="BenchmarkCopyNSmall" href="#BenchmarkCopyNSmall">func BenchmarkCopyNSmall(b *testing.B)</a>

```
searchKey: io_test.BenchmarkCopyNSmall
tags: [function private benchmark]
```

```Go
func BenchmarkCopyNSmall(b *testing.B)
```

### <a id="ExampleCopy" href="#ExampleCopy">func ExampleCopy()</a>

```
searchKey: io_test.ExampleCopy
tags: [function private]
```

```Go
func ExampleCopy()
```

### <a id="ExampleCopyBuffer" href="#ExampleCopyBuffer">func ExampleCopyBuffer()</a>

```
searchKey: io_test.ExampleCopyBuffer
tags: [function private]
```

```Go
func ExampleCopyBuffer()
```

### <a id="ExampleCopyN" href="#ExampleCopyN">func ExampleCopyN()</a>

```
searchKey: io_test.ExampleCopyN
tags: [function private]
```

```Go
func ExampleCopyN()
```

### <a id="ExampleLimitReader" href="#ExampleLimitReader">func ExampleLimitReader()</a>

```
searchKey: io_test.ExampleLimitReader
tags: [function private]
```

```Go
func ExampleLimitReader()
```

### <a id="ExampleMultiReader" href="#ExampleMultiReader">func ExampleMultiReader()</a>

```
searchKey: io_test.ExampleMultiReader
tags: [function private]
```

```Go
func ExampleMultiReader()
```

### <a id="ExampleMultiWriter" href="#ExampleMultiWriter">func ExampleMultiWriter()</a>

```
searchKey: io_test.ExampleMultiWriter
tags: [function private]
```

```Go
func ExampleMultiWriter()
```

### <a id="ExamplePipe" href="#ExamplePipe">func ExamplePipe()</a>

```
searchKey: io_test.ExamplePipe
tags: [function private]
```

```Go
func ExamplePipe()
```

### <a id="ExampleReadAll" href="#ExampleReadAll">func ExampleReadAll()</a>

```
searchKey: io_test.ExampleReadAll
tags: [function private]
```

```Go
func ExampleReadAll()
```

### <a id="ExampleReadAtLeast" href="#ExampleReadAtLeast">func ExampleReadAtLeast()</a>

```
searchKey: io_test.ExampleReadAtLeast
tags: [function private]
```

```Go
func ExampleReadAtLeast()
```

### <a id="ExampleReadFull" href="#ExampleReadFull">func ExampleReadFull()</a>

```
searchKey: io_test.ExampleReadFull
tags: [function private]
```

```Go
func ExampleReadFull()
```

### <a id="ExampleSectionReader" href="#ExampleSectionReader">func ExampleSectionReader()</a>

```
searchKey: io_test.ExampleSectionReader
tags: [function private]
```

```Go
func ExampleSectionReader()
```

### <a id="ExampleSectionReader_ReadAt" href="#ExampleSectionReader_ReadAt">func ExampleSectionReader_ReadAt()</a>

```
searchKey: io_test.ExampleSectionReader_ReadAt
tags: [function private]
```

```Go
func ExampleSectionReader_ReadAt()
```

### <a id="ExampleSectionReader_Seek" href="#ExampleSectionReader_Seek">func ExampleSectionReader_Seek()</a>

```
searchKey: io_test.ExampleSectionReader_Seek
tags: [function private]
```

```Go
func ExampleSectionReader_Seek()
```

### <a id="ExampleSeeker_Seek" href="#ExampleSeeker_Seek">func ExampleSeeker_Seek()</a>

```
searchKey: io_test.ExampleSeeker_Seek
tags: [function private]
```

```Go
func ExampleSeeker_Seek()
```

### <a id="ExampleTeeReader" href="#ExampleTeeReader">func ExampleTeeReader()</a>

```
searchKey: io_test.ExampleTeeReader
tags: [function private]
```

```Go
func ExampleTeeReader()
```

### <a id="ExampleWriteString" href="#ExampleWriteString">func ExampleWriteString()</a>

```
searchKey: io_test.ExampleWriteString
tags: [function private]
```

```Go
func ExampleWriteString()
```

### <a id="TestCopy" href="#TestCopy">func TestCopy(t *testing.T)</a>

```
searchKey: io_test.TestCopy
tags: [function private test]
```

```Go
func TestCopy(t *testing.T)
```

### <a id="TestCopyBuffer" href="#TestCopyBuffer">func TestCopyBuffer(t *testing.T)</a>

```
searchKey: io_test.TestCopyBuffer
tags: [function private test]
```

```Go
func TestCopyBuffer(t *testing.T)
```

### <a id="TestCopyBufferNil" href="#TestCopyBufferNil">func TestCopyBufferNil(t *testing.T)</a>

```
searchKey: io_test.TestCopyBufferNil
tags: [function private test]
```

```Go
func TestCopyBufferNil(t *testing.T)
```

### <a id="TestCopyLargeWriter" href="#TestCopyLargeWriter">func TestCopyLargeWriter(t *testing.T)</a>

```
searchKey: io_test.TestCopyLargeWriter
tags: [function private test]
```

```Go
func TestCopyLargeWriter(t *testing.T)
```

### <a id="TestCopyN" href="#TestCopyN">func TestCopyN(t *testing.T)</a>

```
searchKey: io_test.TestCopyN
tags: [function private test]
```

```Go
func TestCopyN(t *testing.T)
```

### <a id="TestCopyNEOF" href="#TestCopyNEOF">func TestCopyNEOF(t *testing.T)</a>

```
searchKey: io_test.TestCopyNEOF
tags: [function private test]
```

```Go
func TestCopyNEOF(t *testing.T)
```

### <a id="TestCopyNReadFrom" href="#TestCopyNReadFrom">func TestCopyNReadFrom(t *testing.T)</a>

```
searchKey: io_test.TestCopyNReadFrom
tags: [function private test]
```

```Go
func TestCopyNReadFrom(t *testing.T)
```

### <a id="TestCopyNWriteTo" href="#TestCopyNWriteTo">func TestCopyNWriteTo(t *testing.T)</a>

```
searchKey: io_test.TestCopyNWriteTo
tags: [function private test]
```

```Go
func TestCopyNWriteTo(t *testing.T)
```

### <a id="TestCopyNegative" href="#TestCopyNegative">func TestCopyNegative(t *testing.T)</a>

```
searchKey: io_test.TestCopyNegative
tags: [function private test]
```

```Go
func TestCopyNegative(t *testing.T)
```

### <a id="TestCopyPriority" href="#TestCopyPriority">func TestCopyPriority(t *testing.T)</a>

```
searchKey: io_test.TestCopyPriority
tags: [function private test]
```

```Go
func TestCopyPriority(t *testing.T)
```

It's preferable to choose WriterTo over ReaderFrom, since a WriterTo can issue one large write, while the ReaderFrom must read until EOF, potentially allocating when running out of buffer. Make sure that we choose WriterTo when both are implemented. 

### <a id="TestCopyReadErrWriteErr" href="#TestCopyReadErrWriteErr">func TestCopyReadErrWriteErr(t *testing.T)</a>

```
searchKey: io_test.TestCopyReadErrWriteErr
tags: [function private test]
```

```Go
func TestCopyReadErrWriteErr(t *testing.T)
```

In case a Read results in an error with non-zero bytes read, and the subsequent Write also results in an error, the error from Write is returned, as it is the one that prevented progressing further. 

### <a id="TestCopyReadFrom" href="#TestCopyReadFrom">func TestCopyReadFrom(t *testing.T)</a>

```
searchKey: io_test.TestCopyReadFrom
tags: [function private test]
```

```Go
func TestCopyReadFrom(t *testing.T)
```

### <a id="TestCopyWriteTo" href="#TestCopyWriteTo">func TestCopyWriteTo(t *testing.T)</a>

```
searchKey: io_test.TestCopyWriteTo
tags: [function private test]
```

```Go
func TestCopyWriteTo(t *testing.T)
```

### <a id="TestInterleavedMultiReader" href="#TestInterleavedMultiReader">func TestInterleavedMultiReader(t *testing.T)</a>

```
searchKey: io_test.TestInterleavedMultiReader
tags: [function private test]
```

```Go
func TestInterleavedMultiReader(t *testing.T)
```

### <a id="TestMultiReader" href="#TestMultiReader">func TestMultiReader(t *testing.T)</a>

```
searchKey: io_test.TestMultiReader
tags: [function private test]
```

```Go
func TestMultiReader(t *testing.T)
```

### <a id="TestMultiReaderCopy" href="#TestMultiReaderCopy">func TestMultiReaderCopy(t *testing.T)</a>

```
searchKey: io_test.TestMultiReaderCopy
tags: [function private test]
```

```Go
func TestMultiReaderCopy(t *testing.T)
```

Test that MultiReader copies the input slice and is insulated from future modification. 

### <a id="TestMultiReaderFinalEOF" href="#TestMultiReaderFinalEOF">func TestMultiReaderFinalEOF(t *testing.T)</a>

```
searchKey: io_test.TestMultiReaderFinalEOF
tags: [function private test]
```

```Go
func TestMultiReaderFinalEOF(t *testing.T)
```

Test that a reader returning (n, EOF) at the end of a MultiReader chain continues to return EOF on its final read, rather than yielding a (0, EOF). 

### <a id="TestMultiReaderFlatten" href="#TestMultiReaderFlatten">func TestMultiReaderFlatten(t *testing.T)</a>

```
searchKey: io_test.TestMultiReaderFlatten
tags: [function private test]
```

```Go
func TestMultiReaderFlatten(t *testing.T)
```

Test that MultiReader properly flattens chained multiReaders when Read is called 

### <a id="TestMultiReaderFreesExhaustedReaders" href="#TestMultiReaderFreesExhaustedReaders">func TestMultiReaderFreesExhaustedReaders(t *testing.T)</a>

```
searchKey: io_test.TestMultiReaderFreesExhaustedReaders
tags: [function private test]
```

```Go
func TestMultiReaderFreesExhaustedReaders(t *testing.T)
```

### <a id="TestMultiReaderSingleByteWithEOF" href="#TestMultiReaderSingleByteWithEOF">func TestMultiReaderSingleByteWithEOF(t *testing.T)</a>

```
searchKey: io_test.TestMultiReaderSingleByteWithEOF
tags: [function private test]
```

```Go
func TestMultiReaderSingleByteWithEOF(t *testing.T)
```

This used to yield bytes forever; issue 16795. 

### <a id="TestMultiWriter" href="#TestMultiWriter">func TestMultiWriter(t *testing.T)</a>

```
searchKey: io_test.TestMultiWriter
tags: [function private test]
```

```Go
func TestMultiWriter(t *testing.T)
```

### <a id="TestMultiWriterCopy" href="#TestMultiWriterCopy">func TestMultiWriterCopy(t *testing.T)</a>

```
searchKey: io_test.TestMultiWriterCopy
tags: [function private test]
```

```Go
func TestMultiWriterCopy(t *testing.T)
```

Test that MultiWriter copies the input slice and is insulated from future modification. 

### <a id="TestMultiWriterError" href="#TestMultiWriterError">func TestMultiWriterError(t *testing.T)</a>

```
searchKey: io_test.TestMultiWriterError
tags: [function private test]
```

```Go
func TestMultiWriterError(t *testing.T)
```

### <a id="TestMultiWriterSingleChainFlatten" href="#TestMultiWriterSingleChainFlatten">func TestMultiWriterSingleChainFlatten(t *testing.T)</a>

```
searchKey: io_test.TestMultiWriterSingleChainFlatten
tags: [function private test]
```

```Go
func TestMultiWriterSingleChainFlatten(t *testing.T)
```

Test that MultiWriter properly flattens chained multiWriters. 

### <a id="TestMultiWriter_String" href="#TestMultiWriter_String">func TestMultiWriter_String(t *testing.T)</a>

```
searchKey: io_test.TestMultiWriter_String
tags: [function private test]
```

```Go
func TestMultiWriter_String(t *testing.T)
```

### <a id="TestMultiWriter_StringCheckCall" href="#TestMultiWriter_StringCheckCall">func TestMultiWriter_StringCheckCall(t *testing.T)</a>

```
searchKey: io_test.TestMultiWriter_StringCheckCall
tags: [function private test]
```

```Go
func TestMultiWriter_StringCheckCall(t *testing.T)
```

### <a id="TestMultiWriter_WriteStringSingleAlloc" href="#TestMultiWriter_WriteStringSingleAlloc">func TestMultiWriter_WriteStringSingleAlloc(t *testing.T)</a>

```
searchKey: io_test.TestMultiWriter_WriteStringSingleAlloc
tags: [function private test]
```

```Go
func TestMultiWriter_WriteStringSingleAlloc(t *testing.T)
```

Test that a multiWriter.WriteString calls results in at most 1 allocation, even if multiple targets don't support WriteString. 

### <a id="TestPipe1" href="#TestPipe1">func TestPipe1(t *testing.T)</a>

```
searchKey: io_test.TestPipe1
tags: [function private test]
```

```Go
func TestPipe1(t *testing.T)
```

Test a single read/write pair. 

### <a id="TestPipe2" href="#TestPipe2">func TestPipe2(t *testing.T)</a>

```
searchKey: io_test.TestPipe2
tags: [function private test]
```

```Go
func TestPipe2(t *testing.T)
```

Test a sequence of read/write pairs. 

### <a id="TestPipe3" href="#TestPipe3">func TestPipe3(t *testing.T)</a>

```
searchKey: io_test.TestPipe3
tags: [function private test]
```

```Go
func TestPipe3(t *testing.T)
```

### <a id="TestPipeCloseError" href="#TestPipeCloseError">func TestPipeCloseError(t *testing.T)</a>

```
searchKey: io_test.TestPipeCloseError
tags: [function private test]
```

```Go
func TestPipeCloseError(t *testing.T)
```

### <a id="TestPipeConcurrent" href="#TestPipeConcurrent">func TestPipeConcurrent(t *testing.T)</a>

```
searchKey: io_test.TestPipeConcurrent
tags: [function private test]
```

```Go
func TestPipeConcurrent(t *testing.T)
```

### <a id="TestPipeReadClose" href="#TestPipeReadClose">func TestPipeReadClose(t *testing.T)</a>

```
searchKey: io_test.TestPipeReadClose
tags: [function private test]
```

```Go
func TestPipeReadClose(t *testing.T)
```

### <a id="TestPipeReadClose2" href="#TestPipeReadClose2">func TestPipeReadClose2(t *testing.T)</a>

```
searchKey: io_test.TestPipeReadClose2
tags: [function private test]
```

```Go
func TestPipeReadClose2(t *testing.T)
```

Test close on Read side during Read. 

### <a id="TestPipeWriteClose" href="#TestPipeWriteClose">func TestPipeWriteClose(t *testing.T)</a>

```
searchKey: io_test.TestPipeWriteClose
tags: [function private test]
```

```Go
func TestPipeWriteClose(t *testing.T)
```

### <a id="TestPipeWriteClose2" href="#TestPipeWriteClose2">func TestPipeWriteClose2(t *testing.T)</a>

```
searchKey: io_test.TestPipeWriteClose2
tags: [function private test]
```

```Go
func TestPipeWriteClose2(t *testing.T)
```

Test close on Write side during Write. 

### <a id="TestReadAtLeast" href="#TestReadAtLeast">func TestReadAtLeast(t *testing.T)</a>

```
searchKey: io_test.TestReadAtLeast
tags: [function private test]
```

```Go
func TestReadAtLeast(t *testing.T)
```

### <a id="TestReadAtLeastWithDataAndEOF" href="#TestReadAtLeastWithDataAndEOF">func TestReadAtLeastWithDataAndEOF(t *testing.T)</a>

```
searchKey: io_test.TestReadAtLeastWithDataAndEOF
tags: [function private test]
```

```Go
func TestReadAtLeastWithDataAndEOF(t *testing.T)
```

### <a id="TestReadAtLeastWithDataAndError" href="#TestReadAtLeastWithDataAndError">func TestReadAtLeastWithDataAndError(t *testing.T)</a>

```
searchKey: io_test.TestReadAtLeastWithDataAndError
tags: [function private test]
```

```Go
func TestReadAtLeastWithDataAndError(t *testing.T)
```

### <a id="TestSectionReader_ReadAt" href="#TestSectionReader_ReadAt">func TestSectionReader_ReadAt(t *testing.T)</a>

```
searchKey: io_test.TestSectionReader_ReadAt
tags: [function private test]
```

```Go
func TestSectionReader_ReadAt(t *testing.T)
```

### <a id="TestSectionReader_Seek" href="#TestSectionReader_Seek">func TestSectionReader_Seek(t *testing.T)</a>

```
searchKey: io_test.TestSectionReader_Seek
tags: [function private test]
```

```Go
func TestSectionReader_Seek(t *testing.T)
```

### <a id="TestSectionReader_Size" href="#TestSectionReader_Size">func TestSectionReader_Size(t *testing.T)</a>

```
searchKey: io_test.TestSectionReader_Size
tags: [function private test]
```

```Go
func TestSectionReader_Size(t *testing.T)
```

### <a id="TestTeeReader" href="#TestTeeReader">func TestTeeReader(t *testing.T)</a>

```
searchKey: io_test.TestTeeReader
tags: [function private test]
```

```Go
func TestTeeReader(t *testing.T)
```

### <a id="TestWriteAfterWriterClose" href="#TestWriteAfterWriterClose">func TestWriteAfterWriterClose(t *testing.T)</a>

```
searchKey: io_test.TestWriteAfterWriterClose
tags: [function private test]
```

```Go
func TestWriteAfterWriterClose(t *testing.T)
```

### <a id="TestWriteEmpty" href="#TestWriteEmpty">func TestWriteEmpty(t *testing.T)</a>

```
searchKey: io_test.TestWriteEmpty
tags: [function private test]
```

```Go
func TestWriteEmpty(t *testing.T)
```

### <a id="TestWriteNil" href="#TestWriteNil">func TestWriteNil(t *testing.T)</a>

```
searchKey: io_test.TestWriteNil
tags: [function private test]
```

```Go
func TestWriteNil(t *testing.T)
```

### <a id="callDepth" href="#callDepth">func callDepth(callers []uintptr) (depth int)</a>

```
searchKey: io_test.callDepth
tags: [function private]
```

```Go
func callDepth(callers []uintptr) (depth int)
```

callDepth returns the logical call depth for the given PCs. 

### <a id="checkWrite" href="#checkWrite">func checkWrite(t *testing.T, w Writer, data []byte, c chan int)</a>

```
searchKey: io_test.checkWrite
tags: [function private]
```

```Go
func checkWrite(t *testing.T, w Writer, data []byte, c chan int)
```

### <a id="delayClose" href="#delayClose">func delayClose(t *testing.T, cl closer, ch chan int, tt pipeTest)</a>

```
searchKey: io_test.delayClose
tags: [function private]
```

```Go
func delayClose(t *testing.T, cl closer, ch chan int, tt pipeTest)
```

### <a id="reader" href="#reader">func reader(t *testing.T, r Reader, c chan int)</a>

```
searchKey: io_test.reader
tags: [function private]
```

```Go
func reader(t *testing.T, r Reader, c chan int)
```

### <a id="sortBytesInGroups" href="#sortBytesInGroups">func sortBytesInGroups(b []byte, n int) []byte</a>

```
searchKey: io_test.sortBytesInGroups
tags: [function private]
```

```Go
func sortBytesInGroups(b []byte, n int) []byte
```

### <a id="testMultiWriter" href="#testMultiWriter">func testMultiWriter(t *testing.T, sink interface {...</a>

```
searchKey: io_test.testMultiWriter
tags: [function private]
```

```Go
func testMultiWriter(t *testing.T, sink interface {
	Writer
	fmt.Stringer
})
```

### <a id="testReadAtLeast" href="#testReadAtLeast">func testReadAtLeast(t *testing.T, rb ReadWriter)</a>

```
searchKey: io_test.testReadAtLeast
tags: [function private]
```

```Go
func testReadAtLeast(t *testing.T, rb ReadWriter)
```

### <a id="writer" href="#writer">func writer(w WriteCloser, buf []byte, c chan pipeReturn)</a>

```
searchKey: io_test.writer
tags: [function private]
```

```Go
func writer(w WriteCloser, buf []byte, c chan pipeReturn)
```

Test a large write that requires multiple reads to satisfy. 

