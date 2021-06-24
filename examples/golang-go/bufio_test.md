# Package bufio_test

## Index

* [Constants](#const)
    * [const minReadBufferSize](#minReadBufferSize)
    * [const smallMaxTokenSize](#smallMaxTokenSize)
* [Variables](#var)
    * [var bufreaders](#bufreaders)
    * [var bufsizes](#bufsizes)
    * [var errFake](#errFake)
    * [var errorReaderFromTests](#errorReaderFromTests)
    * [var errorWriterTests](#errorWriterTests)
    * [var errorWriterToTests](#errorWriterToTests)
    * [var readLineNewlinesTests](#readLineNewlinesTests)
    * [var readMakers](#readMakers)
    * [var scanTests](#scanTests)
    * [var segmentList](#segmentList)
    * [var testError](#testError)
    * [var testInput](#testInput)
    * [var testInputrn](#testInputrn)
    * [var testOutput](#testOutput)
    * [var wordScanTests](#wordScanTests)
* [Types](#type)
    * [type StringReader struct](#StringReader)
        * [func (r *StringReader) Read(p []byte) (n int, err error)](#StringReader.Read)
    * [type alwaysError struct{}](#alwaysError)
        * [func (alwaysError) Read(p []byte) (int, error)](#alwaysError.Read)
    * [type bufReader struct](#bufReader)
    * [type countdown int](#countdown)
        * [func (c *countdown) split(data []byte, atEOF bool) (advance int, token []byte, err error)](#countdown.split)
    * [type dataAndEOFReader string](#dataAndEOFReader)
        * [func (r dataAndEOFReader) Read(p []byte) (int, error)](#dataAndEOFReader.Read)
    * [type emptyThenNonEmptyReader struct](#emptyThenNonEmptyReader)
        * [func (r *emptyThenNonEmptyReader) Read(p []byte) (int, error)](#emptyThenNonEmptyReader.Read)
    * [type endlessZeros struct{}](#endlessZeros)
        * [func (endlessZeros) Read(p []byte) (int, error)](#endlessZeros.Read)
    * [type eofReader struct](#eofReader)
        * [func (r *eofReader) Read(p []byte) (int, error)](#eofReader.Read)
    * [type errorReaderFromTest struct](#errorReaderFromTest)
        * [func (r errorReaderFromTest) Read(p []byte) (int, error)](#errorReaderFromTest.Read)
        * [func (w errorReaderFromTest) Write(p []byte) (int, error)](#errorReaderFromTest.Write)
    * [type errorThenGoodReader struct](#errorThenGoodReader)
        * [func (r *errorThenGoodReader) Read(p []byte) (int, error)](#errorThenGoodReader.Read)
    * [type errorWriterTest struct](#errorWriterTest)
        * [func (w errorWriterTest) Write(p []byte) (int, error)](#errorWriterTest.Write)
    * [type errorWriterToTest struct](#errorWriterToTest)
        * [func (r errorWriterToTest) Read(p []byte) (int, error)](#errorWriterToTest.Read)
        * [func (w errorWriterToTest) Write(p []byte) (int, error)](#errorWriterToTest.Write)
    * [type largeReader struct{}](#largeReader)
        * [func (largeReader) Read(p []byte) (int, error)](#largeReader.Read)
    * [type negativeEOFReader int](#negativeEOFReader)
        * [func (r *negativeEOFReader) Read(p []byte) (int, error)](#negativeEOFReader.Read)
    * [type negativeReader int](#negativeReader)
        * [func (r *negativeReader) Read([]byte) (int, error)](#negativeReader.Read)
    * [type onlyReader struct](#onlyReader)
    * [type onlyWriter struct](#onlyWriter)
    * [type readLineResult struct](#readLineResult)
    * [type readMaker struct](#readMaker)
    * [type rot13Reader struct](#rot13Reader)
        * [func newRot13Reader(r io.Reader) *rot13Reader](#newRot13Reader)
        * [func (r13 *rot13Reader) Read(p []byte) (int, error)](#rot13Reader.Read)
    * [type scriptedReader []func(p []byte) (n int, err error)](#scriptedReader)
        * [func (sr *scriptedReader) Read(p []byte) (n int, err error)](#scriptedReader.Read)
    * [type slowReader struct](#slowReader)
        * [func (sr *slowReader) Read(p []byte) (n int, err error)](#slowReader.Read)
    * [type testReader struct](#testReader)
        * [func (t *testReader) Read(buf []byte) (n int, err error)](#testReader.Read)
    * [type writeCountingDiscard int](#writeCountingDiscard)
        * [func (w *writeCountingDiscard) Write(p []byte) (int, error)](#writeCountingDiscard.Write)
    * [type writeErrorOnlyWriter struct{}](#writeErrorOnlyWriter)
        * [func (w writeErrorOnlyWriter) Write(p []byte) (n int, err error)](#writeErrorOnlyWriter.Write)
    * [type writerWithReadFromError struct{}](#writerWithReadFromError)
        * [func (w writerWithReadFromError) ReadFrom(r io.Reader) (int64, error)](#writerWithReadFromError.ReadFrom)
        * [func (w writerWithReadFromError) Write(b []byte) (n int, err error)](#writerWithReadFromError.Write)
    * [type zeroReader struct{}](#zeroReader)
        * [func (zeroReader) Read(p []byte) (int, error)](#zeroReader.Read)
* [Functions](#func)
    * [func BenchmarkReaderCopyNoWriteTo(b *testing.B)](#BenchmarkReaderCopyNoWriteTo)
    * [func BenchmarkReaderCopyOptimal(b *testing.B)](#BenchmarkReaderCopyOptimal)
    * [func BenchmarkReaderCopyUnoptimal(b *testing.B)](#BenchmarkReaderCopyUnoptimal)
    * [func BenchmarkReaderEmpty(b *testing.B)](#BenchmarkReaderEmpty)
    * [func BenchmarkReaderReadString(b *testing.B)](#BenchmarkReaderReadString)
    * [func BenchmarkReaderWriteToOptimal(b *testing.B)](#BenchmarkReaderWriteToOptimal)
    * [func BenchmarkWriterCopyNoReadFrom(b *testing.B)](#BenchmarkWriterCopyNoReadFrom)
    * [func BenchmarkWriterCopyOptimal(b *testing.B)](#BenchmarkWriterCopyOptimal)
    * [func BenchmarkWriterCopyUnoptimal(b *testing.B)](#BenchmarkWriterCopyUnoptimal)
    * [func BenchmarkWriterEmpty(b *testing.B)](#BenchmarkWriterEmpty)
    * [func BenchmarkWriterFlush(b *testing.B)](#BenchmarkWriterFlush)
    * [func ExampleScanner_Bytes()](#ExampleScanner_Bytes)
    * [func ExampleScanner_custom()](#ExampleScanner_custom)
    * [func ExampleScanner_emptyFinalToken()](#ExampleScanner_emptyFinalToken)
    * [func ExampleScanner_lines()](#ExampleScanner_lines)
    * [func ExampleScanner_words()](#ExampleScanner_words)
    * [func ExampleWriter()](#ExampleWriter)
    * [func TestBadReader(t *testing.T)](#TestBadReader)
    * [func TestBlankLines(t *testing.T)](#TestBlankLines)
    * [func TestBufferFull(t *testing.T)](#TestBufferFull)
    * [func TestDontLoopForever(t *testing.T)](#TestDontLoopForever)
    * [func TestEmptyLinesOK(t *testing.T)](#TestEmptyLinesOK)
    * [func TestEmptyTokens(t *testing.T)](#TestEmptyTokens)
    * [func TestErrAtEOF(t *testing.T)](#TestErrAtEOF)
    * [func TestHugeBuffer(t *testing.T)](#TestHugeBuffer)
    * [func TestLargeReader(t *testing.T)](#TestLargeReader)
    * [func TestLineTooLong(t *testing.T)](#TestLineTooLong)
    * [func TestLinesAfterRead(t *testing.T)](#TestLinesAfterRead)
    * [func TestNegativeEOFReader(t *testing.T)](#TestNegativeEOFReader)
    * [func TestNegativeRead(t *testing.T)](#TestNegativeRead)
    * [func TestNewReaderSizeIdempotent(t *testing.T)](#TestNewReaderSizeIdempotent)
    * [func TestNewWriterSizeIdempotent(t *testing.T)](#TestNewWriterSizeIdempotent)
    * [func TestNoUnreadByteAfterPeek(t *testing.T)](#TestNoUnreadByteAfterPeek)
    * [func TestNoUnreadRuneAfterPeek(t *testing.T)](#TestNoUnreadRuneAfterPeek)
    * [func TestNonEOFWithEmptyRead(t *testing.T)](#TestNonEOFWithEmptyRead)
    * [func TestPartialReadEOF(t *testing.T)](#TestPartialReadEOF)
    * [func TestPeek(t *testing.T)](#TestPeek)
    * [func TestPeekThenUnreadRune(t *testing.T)](#TestPeekThenUnreadRune)
    * [func TestReadAfterLines(t *testing.T)](#TestReadAfterLines)
    * [func TestReadEmptyBuffer(t *testing.T)](#TestReadEmptyBuffer)
    * [func TestReadLine(t *testing.T)](#TestReadLine)
    * [func TestReadLineNewlines(t *testing.T)](#TestReadLineNewlines)
    * [func TestReadLineNonNilLineOrError(t *testing.T)](#TestReadLineNonNilLineOrError)
    * [func TestReadRune(t *testing.T)](#TestReadRune)
    * [func TestReadStringAllocs(t *testing.T)](#TestReadStringAllocs)
    * [func TestReadWriteRune(t *testing.T)](#TestReadWriteRune)
    * [func TestReadZero(t *testing.T)](#TestReadZero)
    * [func TestReader(t *testing.T)](#TestReader)
    * [func TestReaderClearError(t *testing.T)](#TestReaderClearError)
    * [func TestReaderDiscard(t *testing.T)](#TestReaderDiscard)
    * [func TestReaderReset(t *testing.T)](#TestReaderReset)
    * [func TestReaderSimple(t *testing.T)](#TestReaderSimple)
    * [func TestReaderSize(t *testing.T)](#TestReaderSize)
    * [func TestReaderWriteTo(t *testing.T)](#TestReaderWriteTo)
    * [func TestReaderWriteToErrors(t *testing.T)](#TestReaderWriteToErrors)
    * [func TestScanByte(t *testing.T)](#TestScanByte)
    * [func TestScanLineEmptyFinalLine(t *testing.T)](#TestScanLineEmptyFinalLine)
    * [func TestScanLineEmptyFinalLineWithCR(t *testing.T)](#TestScanLineEmptyFinalLineWithCR)
    * [func TestScanLineNoNewline(t *testing.T)](#TestScanLineNoNewline)
    * [func TestScanLineReturnButNoNewline(t *testing.T)](#TestScanLineReturnButNoNewline)
    * [func TestScanLineTooLong(t *testing.T)](#TestScanLineTooLong)
    * [func TestScanLongLines(t *testing.T)](#TestScanLongLines)
    * [func TestScanRune(t *testing.T)](#TestScanRune)
    * [func TestScanWords(t *testing.T)](#TestScanWords)
    * [func TestScanWordsExcessiveWhiteSpace(t *testing.T)](#TestScanWordsExcessiveWhiteSpace)
    * [func TestSpace(t *testing.T)](#TestSpace)
    * [func TestSplitError(t *testing.T)](#TestSplitError)
    * [func TestUnreadByte(t *testing.T)](#TestUnreadByte)
    * [func TestUnreadByteMultiple(t *testing.T)](#TestUnreadByteMultiple)
    * [func TestUnreadByteOthers(t *testing.T)](#TestUnreadByteOthers)
    * [func TestUnreadRune(t *testing.T)](#TestUnreadRune)
    * [func TestUnreadRuneAtEOF(t *testing.T)](#TestUnreadRuneAtEOF)
    * [func TestUnreadRuneError(t *testing.T)](#TestUnreadRuneError)
    * [func TestWithNoEmptyTokens(t *testing.T)](#TestWithNoEmptyTokens)
    * [func TestWriteErrors(t *testing.T)](#TestWriteErrors)
    * [func TestWriteInvalidRune(t *testing.T)](#TestWriteInvalidRune)
    * [func TestWriteString(t *testing.T)](#TestWriteString)
    * [func TestWriter(t *testing.T)](#TestWriter)
    * [func TestWriterReadFrom(t *testing.T)](#TestWriterReadFrom)
    * [func TestWriterReadFromCounts(t *testing.T)](#TestWriterReadFromCounts)
    * [func TestWriterReadFromErrNoProgress(t *testing.T)](#TestWriterReadFromErrNoProgress)
    * [func TestWriterReadFromErrors(t *testing.T)](#TestWriterReadFromErrors)
    * [func TestWriterReadFromMustReturnUnderlyingError(t *testing.T)](#TestWriterReadFromMustReturnUnderlyingError)
    * [func TestWriterReadFromMustSetUnderlyingError(t *testing.T)](#TestWriterReadFromMustSetUnderlyingError)
    * [func TestWriterReadFromUntilEOF(t *testing.T)](#TestWriterReadFromUntilEOF)
    * [func TestWriterReadFromWhileFull(t *testing.T)](#TestWriterReadFromWhileFull)
    * [func TestWriterReset(t *testing.T)](#TestWriterReset)
    * [func TestWriterSize(t *testing.T)](#TestWriterSize)
    * [func TestZeroReader(t *testing.T)](#TestZeroReader)
    * [func commaSplit(data []byte, atEOF bool) (advance int, token []byte, err error)](#commaSplit)
    * [func createTestInput(n int) []byte](#createTestInput)
    * [func genLine(buf *bytes.Buffer, lineNum, n int, addNewline bool)](#genLine)
    * [func loopAtEOFSplit(data []byte, atEOF bool) (advance int, token []byte, err error)](#loopAtEOFSplit)
    * [func newScriptedReader(steps ...func(p []byte) (n int, err error)) io.Reader](#newScriptedReader)
    * [func readBytes(buf *Reader) string](#readBytes)
    * [func readLines(b *Reader) string](#readLines)
    * [func readRuneSegments(t *testing.T, segments []string)](#readRuneSegments)
    * [func reads(buf *Reader, m int) string](#reads)
    * [func testEmptyTokens(t *testing.T, text string, values []string)](#testEmptyTokens)
    * [func testNoNewline(text string, lines []string, t *testing.T)](#testNoNewline)
    * [func testReadLine(t *testing.T, input []byte)](#testReadLine)
    * [func testReadLineNewlines(t *testing.T, input string, expect []readLineResult)](#testReadLineNewlines)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="minReadBufferSize" href="#minReadBufferSize">const minReadBufferSize</a>

```
searchKey: bufio_test.minReadBufferSize
tags: [constant number private]
```

```Go
const minReadBufferSize = 16
```

### <a id="smallMaxTokenSize" href="#smallMaxTokenSize">const smallMaxTokenSize</a>

```
searchKey: bufio_test.smallMaxTokenSize
tags: [constant number private]
```

```Go
const smallMaxTokenSize = 256 // Much smaller for more efficient testing.

```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="bufreaders" href="#bufreaders">var bufreaders</a>

```
searchKey: bufio_test.bufreaders
tags: [variable array struct private]
```

```Go
var bufreaders = ...
```

### <a id="bufsizes" href="#bufsizes">var bufsizes</a>

```
searchKey: bufio_test.bufsizes
tags: [variable array number private]
```

```Go
var bufsizes = []int{
	0, minReadBufferSize, 23, 32, 46, 64, 93, 128, 1024, 4096,
}
```

### <a id="errFake" href="#errFake">var errFake</a>

```
searchKey: bufio_test.errFake
tags: [variable interface private]
```

```Go
var errFake = errors.New("fake error")
```

### <a id="errorReaderFromTests" href="#errorReaderFromTests">var errorReaderFromTests</a>

```
searchKey: bufio_test.errorReaderFromTests
tags: [variable array struct private]
```

```Go
var errorReaderFromTests = ...
```

### <a id="errorWriterTests" href="#errorWriterTests">var errorWriterTests</a>

```
searchKey: bufio_test.errorWriterTests
tags: [variable array struct private]
```

```Go
var errorWriterTests = ...
```

### <a id="errorWriterToTests" href="#errorWriterToTests">var errorWriterToTests</a>

```
searchKey: bufio_test.errorWriterToTests
tags: [variable array struct private]
```

```Go
var errorWriterToTests = ...
```

### <a id="readLineNewlinesTests" href="#readLineNewlinesTests">var readLineNewlinesTests</a>

```
searchKey: bufio_test.readLineNewlinesTests
tags: [variable array struct private]
```

```Go
var readLineNewlinesTests = ...
```

### <a id="readMakers" href="#readMakers">var readMakers</a>

```
searchKey: bufio_test.readMakers
tags: [variable array struct private]
```

```Go
var readMakers = ...
```

### <a id="scanTests" href="#scanTests">var scanTests</a>

```
searchKey: bufio_test.scanTests
tags: [variable array string private]
```

```Go
var scanTests = ...
```

### <a id="segmentList" href="#segmentList">var segmentList</a>

```
searchKey: bufio_test.segmentList
tags: [variable array array string private]
```

```Go
var segmentList = ...
```

### <a id="testError" href="#testError">var testError</a>

```
searchKey: bufio_test.testError
tags: [variable interface private]
```

```Go
var testError = errors.New("testError")
```

### <a id="testInput" href="#testInput">var testInput</a>

```
searchKey: bufio_test.testInput
tags: [variable array number private]
```

```Go
var testInput = []byte("012\n345\n678\n9ab\ncde\nfgh\nijk\nlmn\nopq\nrst\nuvw\nxy")
```

### <a id="testInputrn" href="#testInputrn">var testInputrn</a>

```
searchKey: bufio_test.testInputrn
tags: [variable array number private]
```

```Go
var testInputrn = ...
```

### <a id="testOutput" href="#testOutput">var testOutput</a>

```
searchKey: bufio_test.testOutput
tags: [variable array number private]
```

```Go
var testOutput = []byte("0123456789abcdefghijklmnopqrstuvwxy")
```

### <a id="wordScanTests" href="#wordScanTests">var wordScanTests</a>

```
searchKey: bufio_test.wordScanTests
tags: [variable array string private]
```

```Go
var wordScanTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="StringReader" href="#StringReader">type StringReader struct</a>

```
searchKey: bufio_test.StringReader
tags: [struct private]
```

```Go
type StringReader struct {
	data []string
	step int
}
```

A StringReader delivers its data one string segment at a time via Read. 

#### <a id="StringReader.Read" href="#StringReader.Read">func (r *StringReader) Read(p []byte) (n int, err error)</a>

```
searchKey: bufio_test.StringReader.Read
tags: [method private]
```

```Go
func (r *StringReader) Read(p []byte) (n int, err error)
```

### <a id="alwaysError" href="#alwaysError">type alwaysError struct{}</a>

```
searchKey: bufio_test.alwaysError
tags: [struct private]
```

```Go
type alwaysError struct{}
```

Test for issue 5268. 

#### <a id="alwaysError.Read" href="#alwaysError.Read">func (alwaysError) Read(p []byte) (int, error)</a>

```
searchKey: bufio_test.alwaysError.Read
tags: [method private]
```

```Go
func (alwaysError) Read(p []byte) (int, error)
```

### <a id="bufReader" href="#bufReader">type bufReader struct</a>

```
searchKey: bufio_test.bufReader
tags: [struct private]
```

```Go
type bufReader struct {
	name string
	fn   func(*Reader) string
}
```

### <a id="countdown" href="#countdown">type countdown int</a>

```
searchKey: bufio_test.countdown
tags: [number private]
```

```Go
type countdown int
```

#### <a id="countdown.split" href="#countdown.split">func (c *countdown) split(data []byte, atEOF bool) (advance int, token []byte, err error)</a>

```
searchKey: bufio_test.countdown.split
tags: [method private]
```

```Go
func (c *countdown) split(data []byte, atEOF bool) (advance int, token []byte, err error)
```

### <a id="dataAndEOFReader" href="#dataAndEOFReader">type dataAndEOFReader string</a>

```
searchKey: bufio_test.dataAndEOFReader
tags: [string private]
```

```Go
type dataAndEOFReader string
```

#### <a id="dataAndEOFReader.Read" href="#dataAndEOFReader.Read">func (r dataAndEOFReader) Read(p []byte) (int, error)</a>

```
searchKey: bufio_test.dataAndEOFReader.Read
tags: [method private]
```

```Go
func (r dataAndEOFReader) Read(p []byte) (int, error)
```

### <a id="emptyThenNonEmptyReader" href="#emptyThenNonEmptyReader">type emptyThenNonEmptyReader struct</a>

```
searchKey: bufio_test.emptyThenNonEmptyReader
tags: [struct private]
```

```Go
type emptyThenNonEmptyReader struct {
	r io.Reader
	n int
}
```

#### <a id="emptyThenNonEmptyReader.Read" href="#emptyThenNonEmptyReader.Read">func (r *emptyThenNonEmptyReader) Read(p []byte) (int, error)</a>

```
searchKey: bufio_test.emptyThenNonEmptyReader.Read
tags: [method private]
```

```Go
func (r *emptyThenNonEmptyReader) Read(p []byte) (int, error)
```

### <a id="endlessZeros" href="#endlessZeros">type endlessZeros struct{}</a>

```
searchKey: bufio_test.endlessZeros
tags: [struct private]
```

```Go
type endlessZeros struct{}
```

Test that Scan finishes if we have endless empty reads. 

#### <a id="endlessZeros.Read" href="#endlessZeros.Read">func (endlessZeros) Read(p []byte) (int, error)</a>

```
searchKey: bufio_test.endlessZeros.Read
tags: [method private]
```

```Go
func (endlessZeros) Read(p []byte) (int, error)
```

### <a id="eofReader" href="#eofReader">type eofReader struct</a>

```
searchKey: bufio_test.eofReader
tags: [struct private]
```

```Go
type eofReader struct {
	buf []byte
}
```

eofReader returns the number of bytes read and io.EOF for the read that consumes the last of the content. 

#### <a id="eofReader.Read" href="#eofReader.Read">func (r *eofReader) Read(p []byte) (int, error)</a>

```
searchKey: bufio_test.eofReader.Read
tags: [method private]
```

```Go
func (r *eofReader) Read(p []byte) (int, error)
```

### <a id="errorReaderFromTest" href="#errorReaderFromTest">type errorReaderFromTest struct</a>

```
searchKey: bufio_test.errorReaderFromTest
tags: [struct private]
```

```Go
type errorReaderFromTest struct {
	rn, wn     int
	rerr, werr error
	expected   error
}
```

#### <a id="errorReaderFromTest.Read" href="#errorReaderFromTest.Read">func (r errorReaderFromTest) Read(p []byte) (int, error)</a>

```
searchKey: bufio_test.errorReaderFromTest.Read
tags: [method private]
```

```Go
func (r errorReaderFromTest) Read(p []byte) (int, error)
```

#### <a id="errorReaderFromTest.Write" href="#errorReaderFromTest.Write">func (w errorReaderFromTest) Write(p []byte) (int, error)</a>

```
searchKey: bufio_test.errorReaderFromTest.Write
tags: [method private]
```

```Go
func (w errorReaderFromTest) Write(p []byte) (int, error)
```

### <a id="errorThenGoodReader" href="#errorThenGoodReader">type errorThenGoodReader struct</a>

```
searchKey: bufio_test.errorThenGoodReader
tags: [struct private]
```

```Go
type errorThenGoodReader struct {
	didErr bool
	nread  int
}
```

#### <a id="errorThenGoodReader.Read" href="#errorThenGoodReader.Read">func (r *errorThenGoodReader) Read(p []byte) (int, error)</a>

```
searchKey: bufio_test.errorThenGoodReader.Read
tags: [method private]
```

```Go
func (r *errorThenGoodReader) Read(p []byte) (int, error)
```

### <a id="errorWriterTest" href="#errorWriterTest">type errorWriterTest struct</a>

```
searchKey: bufio_test.errorWriterTest
tags: [struct private]
```

```Go
type errorWriterTest struct {
	n, m   int
	err    error
	expect error
}
```

#### <a id="errorWriterTest.Write" href="#errorWriterTest.Write">func (w errorWriterTest) Write(p []byte) (int, error)</a>

```
searchKey: bufio_test.errorWriterTest.Write
tags: [method private]
```

```Go
func (w errorWriterTest) Write(p []byte) (int, error)
```

### <a id="errorWriterToTest" href="#errorWriterToTest">type errorWriterToTest struct</a>

```
searchKey: bufio_test.errorWriterToTest
tags: [struct private]
```

```Go
type errorWriterToTest struct {
	rn, wn     int
	rerr, werr error
	expected   error
}
```

#### <a id="errorWriterToTest.Read" href="#errorWriterToTest.Read">func (r errorWriterToTest) Read(p []byte) (int, error)</a>

```
searchKey: bufio_test.errorWriterToTest.Read
tags: [method private]
```

```Go
func (r errorWriterToTest) Read(p []byte) (int, error)
```

#### <a id="errorWriterToTest.Write" href="#errorWriterToTest.Write">func (w errorWriterToTest) Write(p []byte) (int, error)</a>

```
searchKey: bufio_test.errorWriterToTest.Write
tags: [method private]
```

```Go
func (w errorWriterToTest) Write(p []byte) (int, error)
```

### <a id="largeReader" href="#largeReader">type largeReader struct{}</a>

```
searchKey: bufio_test.largeReader
tags: [struct private]
```

```Go
type largeReader struct{}
```

largeReader returns an invalid count that is larger than the number of bytes requested. 

#### <a id="largeReader.Read" href="#largeReader.Read">func (largeReader) Read(p []byte) (int, error)</a>

```
searchKey: bufio_test.largeReader.Read
tags: [method private]
```

```Go
func (largeReader) Read(p []byte) (int, error)
```

### <a id="negativeEOFReader" href="#negativeEOFReader">type negativeEOFReader int</a>

```
searchKey: bufio_test.negativeEOFReader
tags: [number private]
```

```Go
type negativeEOFReader int
```

negativeEOFReader returns an invalid -1 at the end, as though it were wrapping the read system call. 

#### <a id="negativeEOFReader.Read" href="#negativeEOFReader.Read">func (r *negativeEOFReader) Read(p []byte) (int, error)</a>

```
searchKey: bufio_test.negativeEOFReader.Read
tags: [method private]
```

```Go
func (r *negativeEOFReader) Read(p []byte) (int, error)
```

### <a id="negativeReader" href="#negativeReader">type negativeReader int</a>

```
searchKey: bufio_test.negativeReader
tags: [number private]
```

```Go
type negativeReader int
```

#### <a id="negativeReader.Read" href="#negativeReader.Read">func (r *negativeReader) Read([]byte) (int, error)</a>

```
searchKey: bufio_test.negativeReader.Read
tags: [method private]
```

```Go
func (r *negativeReader) Read([]byte) (int, error)
```

### <a id="onlyReader" href="#onlyReader">type onlyReader struct</a>

```
searchKey: bufio_test.onlyReader
tags: [struct private]
```

```Go
type onlyReader struct {
	io.Reader
}
```

An onlyReader only implements io.Reader, no matter what other methods the underlying implementation may have. 

### <a id="onlyWriter" href="#onlyWriter">type onlyWriter struct</a>

```
searchKey: bufio_test.onlyWriter
tags: [struct private]
```

```Go
type onlyWriter struct {
	io.Writer
}
```

An onlyWriter only implements io.Writer, no matter what other methods the underlying implementation may have. 

### <a id="readLineResult" href="#readLineResult">type readLineResult struct</a>

```
searchKey: bufio_test.readLineResult
tags: [struct private]
```

```Go
type readLineResult struct {
	line     []byte
	isPrefix bool
	err      error
}
```

### <a id="readMaker" href="#readMaker">type readMaker struct</a>

```
searchKey: bufio_test.readMaker
tags: [struct private]
```

```Go
type readMaker struct {
	name string
	fn   func(io.Reader) io.Reader
}
```

### <a id="rot13Reader" href="#rot13Reader">type rot13Reader struct</a>

```
searchKey: bufio_test.rot13Reader
tags: [struct private]
```

```Go
type rot13Reader struct {
	r io.Reader
}
```

Reads from a reader and rot13s the result. 

#### <a id="newRot13Reader" href="#newRot13Reader">func newRot13Reader(r io.Reader) *rot13Reader</a>

```
searchKey: bufio_test.newRot13Reader
tags: [method private]
```

```Go
func newRot13Reader(r io.Reader) *rot13Reader
```

#### <a id="rot13Reader.Read" href="#rot13Reader.Read">func (r13 *rot13Reader) Read(p []byte) (int, error)</a>

```
searchKey: bufio_test.rot13Reader.Read
tags: [method private]
```

```Go
func (r13 *rot13Reader) Read(p []byte) (int, error)
```

### <a id="scriptedReader" href="#scriptedReader">type scriptedReader []func(p []byte) (n int, err error)</a>

```
searchKey: bufio_test.scriptedReader
tags: [array function private]
```

```Go
type scriptedReader []func(p []byte) (n int, err error)
```

A scriptedReader is an io.Reader that executes its steps sequentially. 

#### <a id="scriptedReader.Read" href="#scriptedReader.Read">func (sr *scriptedReader) Read(p []byte) (n int, err error)</a>

```
searchKey: bufio_test.scriptedReader.Read
tags: [method private]
```

```Go
func (sr *scriptedReader) Read(p []byte) (n int, err error)
```

### <a id="slowReader" href="#slowReader">type slowReader struct</a>

```
searchKey: bufio_test.slowReader
tags: [struct private]
```

```Go
type slowReader struct {
	max int
	buf io.Reader
}
```

slowReader is a reader that returns only a few bytes at a time, to test the incremental reads in Scanner.Scan. 

#### <a id="slowReader.Read" href="#slowReader.Read">func (sr *slowReader) Read(p []byte) (n int, err error)</a>

```
searchKey: bufio_test.slowReader.Read
tags: [method private]
```

```Go
func (sr *slowReader) Read(p []byte) (n int, err error)
```

### <a id="testReader" href="#testReader">type testReader struct</a>

```
searchKey: bufio_test.testReader
tags: [struct private]
```

```Go
type testReader struct {
	data   []byte
	stride int
}
```

TestReader wraps a []byte and returns reads of a specific length. 

#### <a id="testReader.Read" href="#testReader.Read">func (t *testReader) Read(buf []byte) (n int, err error)</a>

```
searchKey: bufio_test.testReader.Read
tags: [method private]
```

```Go
func (t *testReader) Read(buf []byte) (n int, err error)
```

### <a id="writeCountingDiscard" href="#writeCountingDiscard">type writeCountingDiscard int</a>

```
searchKey: bufio_test.writeCountingDiscard
tags: [number private]
```

```Go
type writeCountingDiscard int
```

A writeCountingDiscard is like io.Discard and counts the number of times Write is called on it. 

#### <a id="writeCountingDiscard.Write" href="#writeCountingDiscard.Write">func (w *writeCountingDiscard) Write(p []byte) (int, error)</a>

```
searchKey: bufio_test.writeCountingDiscard.Write
tags: [method private]
```

```Go
func (w *writeCountingDiscard) Write(p []byte) (int, error)
```

### <a id="writeErrorOnlyWriter" href="#writeErrorOnlyWriter">type writeErrorOnlyWriter struct{}</a>

```
searchKey: bufio_test.writeErrorOnlyWriter
tags: [struct private]
```

```Go
type writeErrorOnlyWriter struct{}
```

#### <a id="writeErrorOnlyWriter.Write" href="#writeErrorOnlyWriter.Write">func (w writeErrorOnlyWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: bufio_test.writeErrorOnlyWriter.Write
tags: [method private]
```

```Go
func (w writeErrorOnlyWriter) Write(p []byte) (n int, err error)
```

### <a id="writerWithReadFromError" href="#writerWithReadFromError">type writerWithReadFromError struct{}</a>

```
searchKey: bufio_test.writerWithReadFromError
tags: [struct private]
```

```Go
type writerWithReadFromError struct{}
```

#### <a id="writerWithReadFromError.ReadFrom" href="#writerWithReadFromError.ReadFrom">func (w writerWithReadFromError) ReadFrom(r io.Reader) (int64, error)</a>

```
searchKey: bufio_test.writerWithReadFromError.ReadFrom
tags: [method private]
```

```Go
func (w writerWithReadFromError) ReadFrom(r io.Reader) (int64, error)
```

#### <a id="writerWithReadFromError.Write" href="#writerWithReadFromError.Write">func (w writerWithReadFromError) Write(b []byte) (n int, err error)</a>

```
searchKey: bufio_test.writerWithReadFromError.Write
tags: [method private]
```

```Go
func (w writerWithReadFromError) Write(b []byte) (n int, err error)
```

### <a id="zeroReader" href="#zeroReader">type zeroReader struct{}</a>

```
searchKey: bufio_test.zeroReader
tags: [struct private]
```

```Go
type zeroReader struct{}
```

#### <a id="zeroReader.Read" href="#zeroReader.Read">func (zeroReader) Read(p []byte) (int, error)</a>

```
searchKey: bufio_test.zeroReader.Read
tags: [method private]
```

```Go
func (zeroReader) Read(p []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="BenchmarkReaderCopyNoWriteTo" href="#BenchmarkReaderCopyNoWriteTo">func BenchmarkReaderCopyNoWriteTo(b *testing.B)</a>

```
searchKey: bufio_test.BenchmarkReaderCopyNoWriteTo
tags: [method private benchmark]
```

```Go
func BenchmarkReaderCopyNoWriteTo(b *testing.B)
```

### <a id="BenchmarkReaderCopyOptimal" href="#BenchmarkReaderCopyOptimal">func BenchmarkReaderCopyOptimal(b *testing.B)</a>

```
searchKey: bufio_test.BenchmarkReaderCopyOptimal
tags: [method private benchmark]
```

```Go
func BenchmarkReaderCopyOptimal(b *testing.B)
```

### <a id="BenchmarkReaderCopyUnoptimal" href="#BenchmarkReaderCopyUnoptimal">func BenchmarkReaderCopyUnoptimal(b *testing.B)</a>

```
searchKey: bufio_test.BenchmarkReaderCopyUnoptimal
tags: [method private benchmark]
```

```Go
func BenchmarkReaderCopyUnoptimal(b *testing.B)
```

### <a id="BenchmarkReaderEmpty" href="#BenchmarkReaderEmpty">func BenchmarkReaderEmpty(b *testing.B)</a>

```
searchKey: bufio_test.BenchmarkReaderEmpty
tags: [method private benchmark]
```

```Go
func BenchmarkReaderEmpty(b *testing.B)
```

### <a id="BenchmarkReaderReadString" href="#BenchmarkReaderReadString">func BenchmarkReaderReadString(b *testing.B)</a>

```
searchKey: bufio_test.BenchmarkReaderReadString
tags: [method private benchmark]
```

```Go
func BenchmarkReaderReadString(b *testing.B)
```

### <a id="BenchmarkReaderWriteToOptimal" href="#BenchmarkReaderWriteToOptimal">func BenchmarkReaderWriteToOptimal(b *testing.B)</a>

```
searchKey: bufio_test.BenchmarkReaderWriteToOptimal
tags: [method private benchmark]
```

```Go
func BenchmarkReaderWriteToOptimal(b *testing.B)
```

### <a id="BenchmarkWriterCopyNoReadFrom" href="#BenchmarkWriterCopyNoReadFrom">func BenchmarkWriterCopyNoReadFrom(b *testing.B)</a>

```
searchKey: bufio_test.BenchmarkWriterCopyNoReadFrom
tags: [method private benchmark]
```

```Go
func BenchmarkWriterCopyNoReadFrom(b *testing.B)
```

### <a id="BenchmarkWriterCopyOptimal" href="#BenchmarkWriterCopyOptimal">func BenchmarkWriterCopyOptimal(b *testing.B)</a>

```
searchKey: bufio_test.BenchmarkWriterCopyOptimal
tags: [method private benchmark]
```

```Go
func BenchmarkWriterCopyOptimal(b *testing.B)
```

### <a id="BenchmarkWriterCopyUnoptimal" href="#BenchmarkWriterCopyUnoptimal">func BenchmarkWriterCopyUnoptimal(b *testing.B)</a>

```
searchKey: bufio_test.BenchmarkWriterCopyUnoptimal
tags: [method private benchmark]
```

```Go
func BenchmarkWriterCopyUnoptimal(b *testing.B)
```

### <a id="BenchmarkWriterEmpty" href="#BenchmarkWriterEmpty">func BenchmarkWriterEmpty(b *testing.B)</a>

```
searchKey: bufio_test.BenchmarkWriterEmpty
tags: [method private benchmark]
```

```Go
func BenchmarkWriterEmpty(b *testing.B)
```

### <a id="BenchmarkWriterFlush" href="#BenchmarkWriterFlush">func BenchmarkWriterFlush(b *testing.B)</a>

```
searchKey: bufio_test.BenchmarkWriterFlush
tags: [method private benchmark]
```

```Go
func BenchmarkWriterFlush(b *testing.B)
```

### <a id="ExampleScanner_Bytes" href="#ExampleScanner_Bytes">func ExampleScanner_Bytes()</a>

```
searchKey: bufio_test.ExampleScanner_Bytes
tags: [function private]
```

```Go
func ExampleScanner_Bytes()
```

Return the most recent call to Scan as a []byte. 

### <a id="ExampleScanner_custom" href="#ExampleScanner_custom">func ExampleScanner_custom()</a>

```
searchKey: bufio_test.ExampleScanner_custom
tags: [function private]
```

```Go
func ExampleScanner_custom()
```

Use a Scanner with a custom split function (built by wrapping ScanWords) to validate 32-bit decimal input. 

### <a id="ExampleScanner_emptyFinalToken" href="#ExampleScanner_emptyFinalToken">func ExampleScanner_emptyFinalToken()</a>

```
searchKey: bufio_test.ExampleScanner_emptyFinalToken
tags: [function private]
```

```Go
func ExampleScanner_emptyFinalToken()
```

Use a Scanner with a custom split function to parse a comma-separated list with an empty final value. 

### <a id="ExampleScanner_lines" href="#ExampleScanner_lines">func ExampleScanner_lines()</a>

```
searchKey: bufio_test.ExampleScanner_lines
tags: [function private]
```

```Go
func ExampleScanner_lines()
```

The simplest use of a Scanner, to read standard input as a set of lines. 

### <a id="ExampleScanner_words" href="#ExampleScanner_words">func ExampleScanner_words()</a>

```
searchKey: bufio_test.ExampleScanner_words
tags: [function private]
```

```Go
func ExampleScanner_words()
```

Use a Scanner to implement a simple word-count utility by scanning the input as a sequence of space-delimited tokens. 

### <a id="ExampleWriter" href="#ExampleWriter">func ExampleWriter()</a>

```
searchKey: bufio_test.ExampleWriter
tags: [function private]
```

```Go
func ExampleWriter()
```

### <a id="TestBadReader" href="#TestBadReader">func TestBadReader(t *testing.T)</a>

```
searchKey: bufio_test.TestBadReader
tags: [method private test]
```

```Go
func TestBadReader(t *testing.T)
```

### <a id="TestBlankLines" href="#TestBlankLines">func TestBlankLines(t *testing.T)</a>

```
searchKey: bufio_test.TestBlankLines
tags: [method private test]
```

```Go
func TestBlankLines(t *testing.T)
```

### <a id="TestBufferFull" href="#TestBufferFull">func TestBufferFull(t *testing.T)</a>

```
searchKey: bufio_test.TestBufferFull
tags: [method private test]
```

```Go
func TestBufferFull(t *testing.T)
```

### <a id="TestDontLoopForever" href="#TestDontLoopForever">func TestDontLoopForever(t *testing.T)</a>

```
searchKey: bufio_test.TestDontLoopForever
tags: [method private test]
```

```Go
func TestDontLoopForever(t *testing.T)
```

### <a id="TestEmptyLinesOK" href="#TestEmptyLinesOK">func TestEmptyLinesOK(t *testing.T)</a>

```
searchKey: bufio_test.TestEmptyLinesOK
tags: [method private test]
```

```Go
func TestEmptyLinesOK(t *testing.T)
```

Check that the looping-at-EOF check doesn't trigger for merely empty tokens. 

### <a id="TestEmptyTokens" href="#TestEmptyTokens">func TestEmptyTokens(t *testing.T)</a>

```
searchKey: bufio_test.TestEmptyTokens
tags: [method private test]
```

```Go
func TestEmptyTokens(t *testing.T)
```

### <a id="TestErrAtEOF" href="#TestErrAtEOF">func TestErrAtEOF(t *testing.T)</a>

```
searchKey: bufio_test.TestErrAtEOF
tags: [method private test]
```

```Go
func TestErrAtEOF(t *testing.T)
```

Test that an EOF is overridden by a user-generated scan error. 

### <a id="TestHugeBuffer" href="#TestHugeBuffer">func TestHugeBuffer(t *testing.T)</a>

```
searchKey: bufio_test.TestHugeBuffer
tags: [method private test]
```

```Go
func TestHugeBuffer(t *testing.T)
```

Make sure we can read a huge token if a big enough buffer is provided. 

### <a id="TestLargeReader" href="#TestLargeReader">func TestLargeReader(t *testing.T)</a>

```
searchKey: bufio_test.TestLargeReader
tags: [method private test]
```

```Go
func TestLargeReader(t *testing.T)
```

Test that the scanner doesn't panic and returns ErrBadReadCount on a reader that returns an impossibly large count of bytes read (issue 38053). 

### <a id="TestLineTooLong" href="#TestLineTooLong">func TestLineTooLong(t *testing.T)</a>

```
searchKey: bufio_test.TestLineTooLong
tags: [method private test]
```

```Go
func TestLineTooLong(t *testing.T)
```

### <a id="TestLinesAfterRead" href="#TestLinesAfterRead">func TestLinesAfterRead(t *testing.T)</a>

```
searchKey: bufio_test.TestLinesAfterRead
tags: [method private test]
```

```Go
func TestLinesAfterRead(t *testing.T)
```

### <a id="TestNegativeEOFReader" href="#TestNegativeEOFReader">func TestNegativeEOFReader(t *testing.T)</a>

```
searchKey: bufio_test.TestNegativeEOFReader
tags: [method private test]
```

```Go
func TestNegativeEOFReader(t *testing.T)
```

Test that the scanner doesn't panic and returns ErrBadReadCount on a reader that returns a negative count of bytes read (issue 38053). 

### <a id="TestNegativeRead" href="#TestNegativeRead">func TestNegativeRead(t *testing.T)</a>

```
searchKey: bufio_test.TestNegativeRead
tags: [method private test]
```

```Go
func TestNegativeRead(t *testing.T)
```

### <a id="TestNewReaderSizeIdempotent" href="#TestNewReaderSizeIdempotent">func TestNewReaderSizeIdempotent(t *testing.T)</a>

```
searchKey: bufio_test.TestNewReaderSizeIdempotent
tags: [method private test]
```

```Go
func TestNewReaderSizeIdempotent(t *testing.T)
```

### <a id="TestNewWriterSizeIdempotent" href="#TestNewWriterSizeIdempotent">func TestNewWriterSizeIdempotent(t *testing.T)</a>

```
searchKey: bufio_test.TestNewWriterSizeIdempotent
tags: [method private test]
```

```Go
func TestNewWriterSizeIdempotent(t *testing.T)
```

### <a id="TestNoUnreadByteAfterPeek" href="#TestNoUnreadByteAfterPeek">func TestNoUnreadByteAfterPeek(t *testing.T)</a>

```
searchKey: bufio_test.TestNoUnreadByteAfterPeek
tags: [method private test]
```

```Go
func TestNoUnreadByteAfterPeek(t *testing.T)
```

### <a id="TestNoUnreadRuneAfterPeek" href="#TestNoUnreadRuneAfterPeek">func TestNoUnreadRuneAfterPeek(t *testing.T)</a>

```
searchKey: bufio_test.TestNoUnreadRuneAfterPeek
tags: [method private test]
```

```Go
func TestNoUnreadRuneAfterPeek(t *testing.T)
```

### <a id="TestNonEOFWithEmptyRead" href="#TestNonEOFWithEmptyRead">func TestNonEOFWithEmptyRead(t *testing.T)</a>

```
searchKey: bufio_test.TestNonEOFWithEmptyRead
tags: [method private test]
```

```Go
func TestNonEOFWithEmptyRead(t *testing.T)
```

### <a id="TestPartialReadEOF" href="#TestPartialReadEOF">func TestPartialReadEOF(t *testing.T)</a>

```
searchKey: bufio_test.TestPartialReadEOF
tags: [method private test]
```

```Go
func TestPartialReadEOF(t *testing.T)
```

### <a id="TestPeek" href="#TestPeek">func TestPeek(t *testing.T)</a>

```
searchKey: bufio_test.TestPeek
tags: [method private test]
```

```Go
func TestPeek(t *testing.T)
```

### <a id="TestPeekThenUnreadRune" href="#TestPeekThenUnreadRune">func TestPeekThenUnreadRune(t *testing.T)</a>

```
searchKey: bufio_test.TestPeekThenUnreadRune
tags: [method private test]
```

```Go
func TestPeekThenUnreadRune(t *testing.T)
```

### <a id="TestReadAfterLines" href="#TestReadAfterLines">func TestReadAfterLines(t *testing.T)</a>

```
searchKey: bufio_test.TestReadAfterLines
tags: [method private test]
```

```Go
func TestReadAfterLines(t *testing.T)
```

### <a id="TestReadEmptyBuffer" href="#TestReadEmptyBuffer">func TestReadEmptyBuffer(t *testing.T)</a>

```
searchKey: bufio_test.TestReadEmptyBuffer
tags: [method private test]
```

```Go
func TestReadEmptyBuffer(t *testing.T)
```

### <a id="TestReadLine" href="#TestReadLine">func TestReadLine(t *testing.T)</a>

```
searchKey: bufio_test.TestReadLine
tags: [method private test]
```

```Go
func TestReadLine(t *testing.T)
```

### <a id="TestReadLineNewlines" href="#TestReadLineNewlines">func TestReadLineNewlines(t *testing.T)</a>

```
searchKey: bufio_test.TestReadLineNewlines
tags: [method private test]
```

```Go
func TestReadLineNewlines(t *testing.T)
```

### <a id="TestReadLineNonNilLineOrError" href="#TestReadLineNonNilLineOrError">func TestReadLineNonNilLineOrError(t *testing.T)</a>

```
searchKey: bufio_test.TestReadLineNonNilLineOrError
tags: [method private test]
```

```Go
func TestReadLineNonNilLineOrError(t *testing.T)
```

### <a id="TestReadRune" href="#TestReadRune">func TestReadRune(t *testing.T)</a>

```
searchKey: bufio_test.TestReadRune
tags: [method private test]
```

```Go
func TestReadRune(t *testing.T)
```

### <a id="TestReadStringAllocs" href="#TestReadStringAllocs">func TestReadStringAllocs(t *testing.T)</a>

```
searchKey: bufio_test.TestReadStringAllocs
tags: [method private test]
```

```Go
func TestReadStringAllocs(t *testing.T)
```

### <a id="TestReadWriteRune" href="#TestReadWriteRune">func TestReadWriteRune(t *testing.T)</a>

```
searchKey: bufio_test.TestReadWriteRune
tags: [method private test]
```

```Go
func TestReadWriteRune(t *testing.T)
```

### <a id="TestReadZero" href="#TestReadZero">func TestReadZero(t *testing.T)</a>

```
searchKey: bufio_test.TestReadZero
tags: [method private test]
```

```Go
func TestReadZero(t *testing.T)
```

### <a id="TestReader" href="#TestReader">func TestReader(t *testing.T)</a>

```
searchKey: bufio_test.TestReader
tags: [method private test]
```

```Go
func TestReader(t *testing.T)
```

### <a id="TestReaderClearError" href="#TestReaderClearError">func TestReaderClearError(t *testing.T)</a>

```
searchKey: bufio_test.TestReaderClearError
tags: [method private test]
```

```Go
func TestReaderClearError(t *testing.T)
```

### <a id="TestReaderDiscard" href="#TestReaderDiscard">func TestReaderDiscard(t *testing.T)</a>

```
searchKey: bufio_test.TestReaderDiscard
tags: [method private test]
```

```Go
func TestReaderDiscard(t *testing.T)
```

### <a id="TestReaderReset" href="#TestReaderReset">func TestReaderReset(t *testing.T)</a>

```
searchKey: bufio_test.TestReaderReset
tags: [method private test]
```

```Go
func TestReaderReset(t *testing.T)
```

### <a id="TestReaderSimple" href="#TestReaderSimple">func TestReaderSimple(t *testing.T)</a>

```
searchKey: bufio_test.TestReaderSimple
tags: [method private test]
```

```Go
func TestReaderSimple(t *testing.T)
```

### <a id="TestReaderSize" href="#TestReaderSize">func TestReaderSize(t *testing.T)</a>

```
searchKey: bufio_test.TestReaderSize
tags: [method private test]
```

```Go
func TestReaderSize(t *testing.T)
```

### <a id="TestReaderWriteTo" href="#TestReaderWriteTo">func TestReaderWriteTo(t *testing.T)</a>

```
searchKey: bufio_test.TestReaderWriteTo
tags: [method private test]
```

```Go
func TestReaderWriteTo(t *testing.T)
```

### <a id="TestReaderWriteToErrors" href="#TestReaderWriteToErrors">func TestReaderWriteToErrors(t *testing.T)</a>

```
searchKey: bufio_test.TestReaderWriteToErrors
tags: [method private test]
```

```Go
func TestReaderWriteToErrors(t *testing.T)
```

### <a id="TestScanByte" href="#TestScanByte">func TestScanByte(t *testing.T)</a>

```
searchKey: bufio_test.TestScanByte
tags: [method private test]
```

```Go
func TestScanByte(t *testing.T)
```

### <a id="TestScanLineEmptyFinalLine" href="#TestScanLineEmptyFinalLine">func TestScanLineEmptyFinalLine(t *testing.T)</a>

```
searchKey: bufio_test.TestScanLineEmptyFinalLine
tags: [method private test]
```

```Go
func TestScanLineEmptyFinalLine(t *testing.T)
```

Test that the line splitter handles a final empty line. 

### <a id="TestScanLineEmptyFinalLineWithCR" href="#TestScanLineEmptyFinalLineWithCR">func TestScanLineEmptyFinalLineWithCR(t *testing.T)</a>

```
searchKey: bufio_test.TestScanLineEmptyFinalLineWithCR
tags: [method private test]
```

```Go
func TestScanLineEmptyFinalLineWithCR(t *testing.T)
```

Test that the line splitter handles a final empty line with a carriage return but no newline. 

### <a id="TestScanLineNoNewline" href="#TestScanLineNoNewline">func TestScanLineNoNewline(t *testing.T)</a>

```
searchKey: bufio_test.TestScanLineNoNewline
tags: [method private test]
```

```Go
func TestScanLineNoNewline(t *testing.T)
```

Test that the line splitter handles a final line without a newline. 

### <a id="TestScanLineReturnButNoNewline" href="#TestScanLineReturnButNoNewline">func TestScanLineReturnButNoNewline(t *testing.T)</a>

```
searchKey: bufio_test.TestScanLineReturnButNoNewline
tags: [method private test]
```

```Go
func TestScanLineReturnButNoNewline(t *testing.T)
```

Test that the line splitter handles a final line with a carriage return but no newline. 

### <a id="TestScanLineTooLong" href="#TestScanLineTooLong">func TestScanLineTooLong(t *testing.T)</a>

```
searchKey: bufio_test.TestScanLineTooLong
tags: [method private test]
```

```Go
func TestScanLineTooLong(t *testing.T)
```

Test that the line splitter errors out on a long line. 

### <a id="TestScanLongLines" href="#TestScanLongLines">func TestScanLongLines(t *testing.T)</a>

```
searchKey: bufio_test.TestScanLongLines
tags: [method private test]
```

```Go
func TestScanLongLines(t *testing.T)
```

Test the line splitter, including some carriage returns but no long lines. 

### <a id="TestScanRune" href="#TestScanRune">func TestScanRune(t *testing.T)</a>

```
searchKey: bufio_test.TestScanRune
tags: [method private test]
```

```Go
func TestScanRune(t *testing.T)
```

Test that the rune splitter returns same sequence of runes (not bytes) as for range string. 

### <a id="TestScanWords" href="#TestScanWords">func TestScanWords(t *testing.T)</a>

```
searchKey: bufio_test.TestScanWords
tags: [method private test]
```

```Go
func TestScanWords(t *testing.T)
```

Test that the word splitter returns the same data as strings.Fields. 

### <a id="TestScanWordsExcessiveWhiteSpace" href="#TestScanWordsExcessiveWhiteSpace">func TestScanWordsExcessiveWhiteSpace(t *testing.T)</a>

```
searchKey: bufio_test.TestScanWordsExcessiveWhiteSpace
tags: [method private test]
```

```Go
func TestScanWordsExcessiveWhiteSpace(t *testing.T)
```

### <a id="TestSpace" href="#TestSpace">func TestSpace(t *testing.T)</a>

```
searchKey: bufio_test.TestSpace
tags: [method private test]
```

```Go
func TestSpace(t *testing.T)
```

Test white space table matches the Unicode definition. 

### <a id="TestSplitError" href="#TestSplitError">func TestSplitError(t *testing.T)</a>

```
searchKey: bufio_test.TestSplitError
tags: [method private test]
```

```Go
func TestSplitError(t *testing.T)
```

Test the correct error is returned when the split function errors out. 

### <a id="TestUnreadByte" href="#TestUnreadByte">func TestUnreadByte(t *testing.T)</a>

```
searchKey: bufio_test.TestUnreadByte
tags: [method private test]
```

```Go
func TestUnreadByte(t *testing.T)
```

### <a id="TestUnreadByteMultiple" href="#TestUnreadByteMultiple">func TestUnreadByteMultiple(t *testing.T)</a>

```
searchKey: bufio_test.TestUnreadByteMultiple
tags: [method private test]
```

```Go
func TestUnreadByteMultiple(t *testing.T)
```

### <a id="TestUnreadByteOthers" href="#TestUnreadByteOthers">func TestUnreadByteOthers(t *testing.T)</a>

```
searchKey: bufio_test.TestUnreadByteOthers
tags: [method private test]
```

```Go
func TestUnreadByteOthers(t *testing.T)
```

### <a id="TestUnreadRune" href="#TestUnreadRune">func TestUnreadRune(t *testing.T)</a>

```
searchKey: bufio_test.TestUnreadRune
tags: [method private test]
```

```Go
func TestUnreadRune(t *testing.T)
```

### <a id="TestUnreadRuneAtEOF" href="#TestUnreadRuneAtEOF">func TestUnreadRuneAtEOF(t *testing.T)</a>

```
searchKey: bufio_test.TestUnreadRuneAtEOF
tags: [method private test]
```

```Go
func TestUnreadRuneAtEOF(t *testing.T)
```

### <a id="TestUnreadRuneError" href="#TestUnreadRuneError">func TestUnreadRuneError(t *testing.T)</a>

```
searchKey: bufio_test.TestUnreadRuneError
tags: [method private test]
```

```Go
func TestUnreadRuneError(t *testing.T)
```

Test that UnreadRune fails if the preceding operation was not a ReadRune. 

### <a id="TestWithNoEmptyTokens" href="#TestWithNoEmptyTokens">func TestWithNoEmptyTokens(t *testing.T)</a>

```
searchKey: bufio_test.TestWithNoEmptyTokens
tags: [method private test]
```

```Go
func TestWithNoEmptyTokens(t *testing.T)
```

### <a id="TestWriteErrors" href="#TestWriteErrors">func TestWriteErrors(t *testing.T)</a>

```
searchKey: bufio_test.TestWriteErrors
tags: [method private test]
```

```Go
func TestWriteErrors(t *testing.T)
```

### <a id="TestWriteInvalidRune" href="#TestWriteInvalidRune">func TestWriteInvalidRune(t *testing.T)</a>

```
searchKey: bufio_test.TestWriteInvalidRune
tags: [method private test]
```

```Go
func TestWriteInvalidRune(t *testing.T)
```

### <a id="TestWriteString" href="#TestWriteString">func TestWriteString(t *testing.T)</a>

```
searchKey: bufio_test.TestWriteString
tags: [method private test]
```

```Go
func TestWriteString(t *testing.T)
```

### <a id="TestWriter" href="#TestWriter">func TestWriter(t *testing.T)</a>

```
searchKey: bufio_test.TestWriter
tags: [method private test]
```

```Go
func TestWriter(t *testing.T)
```

### <a id="TestWriterReadFrom" href="#TestWriterReadFrom">func TestWriterReadFrom(t *testing.T)</a>

```
searchKey: bufio_test.TestWriterReadFrom
tags: [method private test]
```

```Go
func TestWriterReadFrom(t *testing.T)
```

### <a id="TestWriterReadFromCounts" href="#TestWriterReadFromCounts">func TestWriterReadFromCounts(t *testing.T)</a>

```
searchKey: bufio_test.TestWriterReadFromCounts
tags: [method private test]
```

```Go
func TestWriterReadFromCounts(t *testing.T)
```

TestWriterReadFromCounts tests that using io.Copy to copy into a bufio.Writer does not prematurely flush the buffer. For example, when buffering writes to a network socket, excessive network writes should be avoided. 

### <a id="TestWriterReadFromErrNoProgress" href="#TestWriterReadFromErrNoProgress">func TestWriterReadFromErrNoProgress(t *testing.T)</a>

```
searchKey: bufio_test.TestWriterReadFromErrNoProgress
tags: [method private test]
```

```Go
func TestWriterReadFromErrNoProgress(t *testing.T)
```

### <a id="TestWriterReadFromErrors" href="#TestWriterReadFromErrors">func TestWriterReadFromErrors(t *testing.T)</a>

```
searchKey: bufio_test.TestWriterReadFromErrors
tags: [method private test]
```

```Go
func TestWriterReadFromErrors(t *testing.T)
```

### <a id="TestWriterReadFromMustReturnUnderlyingError" href="#TestWriterReadFromMustReturnUnderlyingError">func TestWriterReadFromMustReturnUnderlyingError(t *testing.T)</a>

```
searchKey: bufio_test.TestWriterReadFromMustReturnUnderlyingError
tags: [method private test]
```

```Go
func TestWriterReadFromMustReturnUnderlyingError(t *testing.T)
```

Ensure that previous Write errors are immediately returned on any ReadFrom. See golang.org/issue/35194. 

### <a id="TestWriterReadFromMustSetUnderlyingError" href="#TestWriterReadFromMustSetUnderlyingError">func TestWriterReadFromMustSetUnderlyingError(t *testing.T)</a>

```
searchKey: bufio_test.TestWriterReadFromMustSetUnderlyingError
tags: [method private test]
```

```Go
func TestWriterReadFromMustSetUnderlyingError(t *testing.T)
```

### <a id="TestWriterReadFromUntilEOF" href="#TestWriterReadFromUntilEOF">func TestWriterReadFromUntilEOF(t *testing.T)</a>

```
searchKey: bufio_test.TestWriterReadFromUntilEOF
tags: [method private test]
```

```Go
func TestWriterReadFromUntilEOF(t *testing.T)
```

Test for golang.org/issue/7611 

### <a id="TestWriterReadFromWhileFull" href="#TestWriterReadFromWhileFull">func TestWriterReadFromWhileFull(t *testing.T)</a>

```
searchKey: bufio_test.TestWriterReadFromWhileFull
tags: [method private test]
```

```Go
func TestWriterReadFromWhileFull(t *testing.T)
```

Test for golang.org/issue/5947 

### <a id="TestWriterReset" href="#TestWriterReset">func TestWriterReset(t *testing.T)</a>

```
searchKey: bufio_test.TestWriterReset
tags: [method private test]
```

```Go
func TestWriterReset(t *testing.T)
```

### <a id="TestWriterSize" href="#TestWriterSize">func TestWriterSize(t *testing.T)</a>

```
searchKey: bufio_test.TestWriterSize
tags: [method private test]
```

```Go
func TestWriterSize(t *testing.T)
```

### <a id="TestZeroReader" href="#TestZeroReader">func TestZeroReader(t *testing.T)</a>

```
searchKey: bufio_test.TestZeroReader
tags: [method private test]
```

```Go
func TestZeroReader(t *testing.T)
```

### <a id="commaSplit" href="#commaSplit">func commaSplit(data []byte, atEOF bool) (advance int, token []byte, err error)</a>

```
searchKey: bufio_test.commaSplit
tags: [method private]
```

```Go
func commaSplit(data []byte, atEOF bool) (advance int, token []byte, err error)
```

### <a id="createTestInput" href="#createTestInput">func createTestInput(n int) []byte</a>

```
searchKey: bufio_test.createTestInput
tags: [method private]
```

```Go
func createTestInput(n int) []byte
```

### <a id="genLine" href="#genLine">func genLine(buf *bytes.Buffer, lineNum, n int, addNewline bool)</a>

```
searchKey: bufio_test.genLine
tags: [method private]
```

```Go
func genLine(buf *bytes.Buffer, lineNum, n int, addNewline bool)
```

genLine writes to buf a predictable but non-trivial line of text of length n, including the terminal newline and an occasional carriage return. If addNewline is false, the \r and \n are not emitted. 

### <a id="loopAtEOFSplit" href="#loopAtEOFSplit">func loopAtEOFSplit(data []byte, atEOF bool) (advance int, token []byte, err error)</a>

```
searchKey: bufio_test.loopAtEOFSplit
tags: [method private]
```

```Go
func loopAtEOFSplit(data []byte, atEOF bool) (advance int, token []byte, err error)
```

### <a id="newScriptedReader" href="#newScriptedReader">func newScriptedReader(steps ...func(p []byte) (n int, err error)) io.Reader</a>

```
searchKey: bufio_test.newScriptedReader
tags: [method private]
```

```Go
func newScriptedReader(steps ...func(p []byte) (n int, err error)) io.Reader
```

### <a id="readBytes" href="#readBytes">func readBytes(buf *Reader) string</a>

```
searchKey: bufio_test.readBytes
tags: [method private]
```

```Go
func readBytes(buf *Reader) string
```

Call ReadByte to accumulate the text of a file 

### <a id="readLines" href="#readLines">func readLines(b *Reader) string</a>

```
searchKey: bufio_test.readLines
tags: [method private]
```

```Go
func readLines(b *Reader) string
```

Call ReadString (which ends up calling everything else) to accumulate the text of a file. 

### <a id="readRuneSegments" href="#readRuneSegments">func readRuneSegments(t *testing.T, segments []string)</a>

```
searchKey: bufio_test.readRuneSegments
tags: [method private]
```

```Go
func readRuneSegments(t *testing.T, segments []string)
```

### <a id="reads" href="#reads">func reads(buf *Reader, m int) string</a>

```
searchKey: bufio_test.reads
tags: [method private]
```

```Go
func reads(buf *Reader, m int) string
```

Call Read to accumulate the text of a file 

### <a id="testEmptyTokens" href="#testEmptyTokens">func testEmptyTokens(t *testing.T, text string, values []string)</a>

```
searchKey: bufio_test.testEmptyTokens
tags: [method private]
```

```Go
func testEmptyTokens(t *testing.T, text string, values []string)
```

### <a id="testNoNewline" href="#testNoNewline">func testNoNewline(text string, lines []string, t *testing.T)</a>

```
searchKey: bufio_test.testNoNewline
tags: [method private]
```

```Go
func testNoNewline(text string, lines []string, t *testing.T)
```

Test that the line splitter handles a final line without a newline. 

### <a id="testReadLine" href="#testReadLine">func testReadLine(t *testing.T, input []byte)</a>

```
searchKey: bufio_test.testReadLine
tags: [method private]
```

```Go
func testReadLine(t *testing.T, input []byte)
```

### <a id="testReadLineNewlines" href="#testReadLineNewlines">func testReadLineNewlines(t *testing.T, input string, expect []readLineResult)</a>

```
searchKey: bufio_test.testReadLineNewlines
tags: [method private]
```

```Go
func testReadLineNewlines(t *testing.T, input string, expect []readLineResult)
```

