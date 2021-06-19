# Package bytes_test

## Index

* [Constants](#const)
    * [const N](#N)
    * [const space](#space)
* [Variables](#var)
    * [var testString](#testString)
    * [var testBytes](#testBytes)
    * [var readBytesTests](#readBytesTests)
    * [var abcd](#abcd)
    * [var faces](#faces)
    * [var commas](#commas)
    * [var dots](#dots)
    * [var indexTests](#indexTests)
    * [var lastIndexTests](#lastIndexTests)
    * [var indexAnyTests](#indexAnyTests)
    * [var lastIndexAnyTests](#lastIndexAnyTests)
    * [var bmbuf](#bmbuf)
    * [var indexSizes](#indexSizes)
    * [var isRaceBuilder](#isRaceBuilder)
    * [var splittests](#splittests)
    * [var splitaftertests](#splitaftertests)
    * [var fieldstests](#fieldstests)
    * [var upperTests](#upperTests)
    * [var lowerTests](#lowerTests)
    * [var trimSpaceTests](#trimSpaceTests)
    * [var toValidUTF8Tests](#toValidUTF8Tests)
    * [var RepeatTests](#RepeatTests)
    * [var RunesTests](#RunesTests)
    * [var trimTests](#trimTests)
    * [var isSpace](#isSpace)
    * [var isDigit](#isDigit)
    * [var isUpper](#isUpper)
    * [var isValidRune](#isValidRune)
    * [var trimFuncTests](#trimFuncTests)
    * [var indexFuncTests](#indexFuncTests)
    * [var ReplaceTests](#ReplaceTests)
    * [var TitleTests](#TitleTests)
    * [var ToTitleTests](#ToTitleTests)
    * [var EqualFoldTests](#EqualFoldTests)
    * [var containsTests](#containsTests)
    * [var ContainsAnyTests](#ContainsAnyTests)
    * [var ContainsRuneTests](#ContainsRuneTests)
    * [var makeFieldsInput](#makeFieldsInput)
    * [var makeFieldsInputASCII](#makeFieldsInputASCII)
    * [var bytesdata](#bytesdata)
    * [var benchInputHard](#benchInputHard)
    * [var compareTests](#compareTests)
    * [var UnreadRuneErrorTests](#UnreadRuneErrorTests)
* [Types](#type)
    * [type negativeReader struct{}](#negativeReader)
        * [func (r *negativeReader) Read([]byte) (int, error)](#negativeReader.Read)
    * [type panicReader struct](#panicReader)
        * [func (r panicReader) Read(p []byte) (int, error)](#panicReader.Read)
    * [type BinOpTest struct](#BinOpTest)
    * [type SplitTest struct](#SplitTest)
    * [type FieldsTest struct](#FieldsTest)
    * [type StringTest struct](#StringTest)
    * [type RepeatTest struct](#RepeatTest)
    * [type RunesTest struct](#RunesTest)
    * [type TrimTest struct](#TrimTest)
    * [type predicate struct](#predicate)
        * [func not(p predicate) predicate](#not)
    * [type TrimFuncTest struct](#TrimFuncTest)
    * [type IndexFuncTest struct](#IndexFuncTest)
    * [type ReplaceTest struct](#ReplaceTest)
    * [type TitleTest struct](#TitleTest)
* [Functions](#func)
    * [func init()](#init)
    * [func check(t *testing.T, testname string, buf *Buffer, s string)](#check)
    * [func fillString(t *testing.T, testname string, buf *Buffer, s string, n int, fus string) string](#fillString)
    * [func fillBytes(t *testing.T, testname string, buf *Buffer, s string, n int, fub []byte) string](#fillBytes)
    * [func TestNewBuffer(t *testing.T)](#TestNewBuffer)
    * [func TestNewBufferString(t *testing.T)](#TestNewBufferString)
    * [func empty(t *testing.T, testname string, buf *Buffer, s string, fub []byte)](#empty)
    * [func TestBasicOperations(t *testing.T)](#TestBasicOperations)
    * [func TestLargeStringWrites(t *testing.T)](#TestLargeStringWrites)
    * [func TestLargeByteWrites(t *testing.T)](#TestLargeByteWrites)
    * [func TestLargeStringReads(t *testing.T)](#TestLargeStringReads)
    * [func TestLargeByteReads(t *testing.T)](#TestLargeByteReads)
    * [func TestMixedReadsAndWrites(t *testing.T)](#TestMixedReadsAndWrites)
    * [func TestCapWithPreallocatedSlice(t *testing.T)](#TestCapWithPreallocatedSlice)
    * [func TestCapWithSliceAndWrittenData(t *testing.T)](#TestCapWithSliceAndWrittenData)
    * [func TestNil(t *testing.T)](#TestNil)
    * [func TestReadFrom(t *testing.T)](#TestReadFrom)
    * [func TestReadFromPanicReader(t *testing.T)](#TestReadFromPanicReader)
    * [func TestReadFromNegativeReader(t *testing.T)](#TestReadFromNegativeReader)
    * [func TestWriteTo(t *testing.T)](#TestWriteTo)
    * [func TestRuneIO(t *testing.T)](#TestRuneIO)
    * [func TestWriteInvalidRune(t *testing.T)](#TestWriteInvalidRune)
    * [func TestNext(t *testing.T)](#TestNext)
    * [func TestReadBytes(t *testing.T)](#TestReadBytes)
    * [func TestReadString(t *testing.T)](#TestReadString)
    * [func BenchmarkReadString(b *testing.B)](#BenchmarkReadString)
    * [func TestGrow(t *testing.T)](#TestGrow)
    * [func TestGrowOverflow(t *testing.T)](#TestGrowOverflow)
    * [func TestReadEmptyAtEOF(t *testing.T)](#TestReadEmptyAtEOF)
    * [func TestUnreadByte(t *testing.T)](#TestUnreadByte)
    * [func TestBufferGrowth(t *testing.T)](#TestBufferGrowth)
    * [func BenchmarkWriteByte(b *testing.B)](#BenchmarkWriteByte)
    * [func BenchmarkWriteRune(b *testing.B)](#BenchmarkWriteRune)
    * [func BenchmarkBufferNotEmptyWriteRead(b *testing.B)](#BenchmarkBufferNotEmptyWriteRead)
    * [func BenchmarkBufferFullSmallReads(b *testing.B)](#BenchmarkBufferFullSmallReads)
    * [func eq(a, b []string) bool](#eq)
    * [func sliceOfString(s [][]byte) []string](#sliceOfString)
    * [func TestEqual(t *testing.T)](#TestEqual)
    * [func TestEqualExhaustive(t *testing.T)](#TestEqualExhaustive)
    * [func TestNotEqual(t *testing.T)](#TestNotEqual)
    * [func runIndexTests(t *testing.T, f func(s, sep []byte) int, funcName string, testCases []BinOpTest)](#runIndexTests)
    * [func runIndexAnyTests(t *testing.T, f func(s []byte, chars string) int, funcName string, testCases []BinOpTest)](#runIndexAnyTests)
    * [func TestIndex(t *testing.T)](#TestIndex)
    * [func TestLastIndex(t *testing.T)](#TestLastIndex)
    * [func TestIndexAny(t *testing.T)](#TestIndexAny)
    * [func TestLastIndexAny(t *testing.T)](#TestLastIndexAny)
    * [func TestIndexByte(t *testing.T)](#TestIndexByte)
    * [func TestLastIndexByte(t *testing.T)](#TestLastIndexByte)
    * [func TestIndexByteBig(t *testing.T)](#TestIndexByteBig)
    * [func TestIndexByteSmall(t *testing.T)](#TestIndexByteSmall)
    * [func TestIndexRune(t *testing.T)](#TestIndexRune)
    * [func TestCountByte(t *testing.T)](#TestCountByte)
    * [func TestCountByteNoMatch(t *testing.T)](#TestCountByteNoMatch)
    * [func valName(x int) string](#valName)
    * [func benchBytes(b *testing.B, sizes []int, f func(b *testing.B, n int))](#benchBytes)
    * [func BenchmarkIndexByte(b *testing.B)](#BenchmarkIndexByte)
    * [func BenchmarkIndexBytePortable(b *testing.B)](#BenchmarkIndexBytePortable)
    * [func bmIndexByte(index func([]byte, byte) int) func(b *testing.B, n int)](#bmIndexByte)
    * [func BenchmarkIndexRune(b *testing.B)](#BenchmarkIndexRune)
    * [func BenchmarkIndexRuneASCII(b *testing.B)](#BenchmarkIndexRuneASCII)
    * [func bmIndexRuneASCII(index func([]byte, rune) int) func(b *testing.B, n int)](#bmIndexRuneASCII)
    * [func bmIndexRune(index func([]byte, rune) int) func(b *testing.B, n int)](#bmIndexRune)
    * [func BenchmarkEqual(b *testing.B)](#BenchmarkEqual)
    * [func bmEqual(equal func([]byte, []byte) bool) func(b *testing.B, n int)](#bmEqual)
    * [func BenchmarkIndex(b *testing.B)](#BenchmarkIndex)
    * [func BenchmarkIndexEasy(b *testing.B)](#BenchmarkIndexEasy)
    * [func BenchmarkCount(b *testing.B)](#BenchmarkCount)
    * [func BenchmarkCountEasy(b *testing.B)](#BenchmarkCountEasy)
    * [func BenchmarkCountSingle(b *testing.B)](#BenchmarkCountSingle)
    * [func TestSplit(t *testing.T)](#TestSplit)
    * [func TestSplitAfter(t *testing.T)](#TestSplitAfter)
    * [func TestFields(t *testing.T)](#TestFields)
    * [func TestFieldsFunc(t *testing.T)](#TestFieldsFunc)
    * [func runStringTests(t *testing.T, f func([]byte) []byte, funcName string, testCases []StringTest)](#runStringTests)
    * [func tenRunes(r rune) string](#tenRunes)
    * [func rot13(r rune) rune](#rot13)
    * [func TestMap(t *testing.T)](#TestMap)
    * [func TestToUpper(t *testing.T)](#TestToUpper)
    * [func TestToLower(t *testing.T)](#TestToLower)
    * [func BenchmarkToUpper(b *testing.B)](#BenchmarkToUpper)
    * [func BenchmarkToLower(b *testing.B)](#BenchmarkToLower)
    * [func TestToValidUTF8(t *testing.T)](#TestToValidUTF8)
    * [func TestTrimSpace(t *testing.T)](#TestTrimSpace)
    * [func TestRepeat(t *testing.T)](#TestRepeat)
    * [func repeat(b []byte, count int) (err error)](#repeat)
    * [func TestRepeatCatchesOverflow(t *testing.T)](#TestRepeatCatchesOverflow)
    * [func runesEqual(a, b []rune) bool](#runesEqual)
    * [func TestRunes(t *testing.T)](#TestRunes)
    * [func TestTrim(t *testing.T)](#TestTrim)
    * [func TestTrimFunc(t *testing.T)](#TestTrimFunc)
    * [func TestIndexFunc(t *testing.T)](#TestIndexFunc)
    * [func TestReplace(t *testing.T)](#TestReplace)
    * [func TestTitle(t *testing.T)](#TestTitle)
    * [func TestToTitle(t *testing.T)](#TestToTitle)
    * [func TestEqualFold(t *testing.T)](#TestEqualFold)
    * [func TestBufferGrowNegative(t *testing.T)](#TestBufferGrowNegative)
    * [func TestBufferTruncateNegative(t *testing.T)](#TestBufferTruncateNegative)
    * [func TestBufferTruncateOutOfRange(t *testing.T)](#TestBufferTruncateOutOfRange)
    * [func TestContains(t *testing.T)](#TestContains)
    * [func TestContainsAny(t *testing.T)](#TestContainsAny)
    * [func TestContainsRune(t *testing.T)](#TestContainsRune)
    * [func BenchmarkFields(b *testing.B)](#BenchmarkFields)
    * [func BenchmarkFieldsFunc(b *testing.B)](#BenchmarkFieldsFunc)
    * [func BenchmarkTrimSpace(b *testing.B)](#BenchmarkTrimSpace)
    * [func BenchmarkToValidUTF8(b *testing.B)](#BenchmarkToValidUTF8)
    * [func makeBenchInputHard() []byte](#makeBenchInputHard)
    * [func benchmarkIndexHard(b *testing.B, sep []byte)](#benchmarkIndexHard)
    * [func benchmarkLastIndexHard(b *testing.B, sep []byte)](#benchmarkLastIndexHard)
    * [func benchmarkCountHard(b *testing.B, sep []byte)](#benchmarkCountHard)
    * [func BenchmarkIndexHard1(b *testing.B)](#BenchmarkIndexHard1)
    * [func BenchmarkIndexHard2(b *testing.B)](#BenchmarkIndexHard2)
    * [func BenchmarkIndexHard3(b *testing.B)](#BenchmarkIndexHard3)
    * [func BenchmarkIndexHard4(b *testing.B)](#BenchmarkIndexHard4)
    * [func BenchmarkLastIndexHard1(b *testing.B)](#BenchmarkLastIndexHard1)
    * [func BenchmarkLastIndexHard2(b *testing.B)](#BenchmarkLastIndexHard2)
    * [func BenchmarkLastIndexHard3(b *testing.B)](#BenchmarkLastIndexHard3)
    * [func BenchmarkCountHard1(b *testing.B)](#BenchmarkCountHard1)
    * [func BenchmarkCountHard2(b *testing.B)](#BenchmarkCountHard2)
    * [func BenchmarkCountHard3(b *testing.B)](#BenchmarkCountHard3)
    * [func BenchmarkSplitEmptySeparator(b *testing.B)](#BenchmarkSplitEmptySeparator)
    * [func BenchmarkSplitSingleByteSeparator(b *testing.B)](#BenchmarkSplitSingleByteSeparator)
    * [func BenchmarkSplitMultiByteSeparator(b *testing.B)](#BenchmarkSplitMultiByteSeparator)
    * [func BenchmarkSplitNSingleByteSeparator(b *testing.B)](#BenchmarkSplitNSingleByteSeparator)
    * [func BenchmarkSplitNMultiByteSeparator(b *testing.B)](#BenchmarkSplitNMultiByteSeparator)
    * [func BenchmarkRepeat(b *testing.B)](#BenchmarkRepeat)
    * [func BenchmarkBytesCompare(b *testing.B)](#BenchmarkBytesCompare)
    * [func BenchmarkIndexAnyASCII(b *testing.B)](#BenchmarkIndexAnyASCII)
    * [func BenchmarkIndexAnyUTF8(b *testing.B)](#BenchmarkIndexAnyUTF8)
    * [func BenchmarkLastIndexAnyASCII(b *testing.B)](#BenchmarkLastIndexAnyASCII)
    * [func BenchmarkLastIndexAnyUTF8(b *testing.B)](#BenchmarkLastIndexAnyUTF8)
    * [func BenchmarkTrimASCII(b *testing.B)](#BenchmarkTrimASCII)
    * [func BenchmarkIndexPeriodic(b *testing.B)](#BenchmarkIndexPeriodic)
    * [func TestCompare(t *testing.T)](#TestCompare)
    * [func TestCompareIdenticalSlice(t *testing.T)](#TestCompareIdenticalSlice)
    * [func TestCompareBytes(t *testing.T)](#TestCompareBytes)
    * [func TestEndianBaseCompare(t *testing.T)](#TestEndianBaseCompare)
    * [func BenchmarkCompareBytesEqual(b *testing.B)](#BenchmarkCompareBytesEqual)
    * [func BenchmarkCompareBytesToNil(b *testing.B)](#BenchmarkCompareBytesToNil)
    * [func BenchmarkCompareBytesEmpty(b *testing.B)](#BenchmarkCompareBytesEmpty)
    * [func BenchmarkCompareBytesIdentical(b *testing.B)](#BenchmarkCompareBytesIdentical)
    * [func BenchmarkCompareBytesSameLength(b *testing.B)](#BenchmarkCompareBytesSameLength)
    * [func BenchmarkCompareBytesDifferentLength(b *testing.B)](#BenchmarkCompareBytesDifferentLength)
    * [func BenchmarkCompareBytesBigUnaligned(b *testing.B)](#BenchmarkCompareBytesBigUnaligned)
    * [func BenchmarkCompareBytesBig(b *testing.B)](#BenchmarkCompareBytesBig)
    * [func BenchmarkCompareBytesBigIdentical(b *testing.B)](#BenchmarkCompareBytesBigIdentical)
    * [func ExampleBuffer()](#ExampleBuffer)
    * [func ExampleBuffer_reader()](#ExampleBuffer_reader)
    * [func ExampleBuffer_Bytes()](#ExampleBuffer_Bytes)
    * [func ExampleBuffer_Grow()](#ExampleBuffer_Grow)
    * [func ExampleBuffer_Len()](#ExampleBuffer_Len)
    * [func ExampleCompare()](#ExampleCompare)
    * [func ExampleCompare_search()](#ExampleCompare_search)
    * [func ExampleTrimSuffix()](#ExampleTrimSuffix)
    * [func ExampleTrimPrefix()](#ExampleTrimPrefix)
    * [func ExampleFields()](#ExampleFields)
    * [func ExampleFieldsFunc()](#ExampleFieldsFunc)
    * [func ExampleContains()](#ExampleContains)
    * [func ExampleContainsAny()](#ExampleContainsAny)
    * [func ExampleContainsRune()](#ExampleContainsRune)
    * [func ExampleCount()](#ExampleCount)
    * [func ExampleEqual()](#ExampleEqual)
    * [func ExampleEqualFold()](#ExampleEqualFold)
    * [func ExampleHasPrefix()](#ExampleHasPrefix)
    * [func ExampleHasSuffix()](#ExampleHasSuffix)
    * [func ExampleIndex()](#ExampleIndex)
    * [func ExampleIndexByte()](#ExampleIndexByte)
    * [func ExampleIndexFunc()](#ExampleIndexFunc)
    * [func ExampleIndexAny()](#ExampleIndexAny)
    * [func ExampleIndexRune()](#ExampleIndexRune)
    * [func ExampleLastIndex()](#ExampleLastIndex)
    * [func ExampleLastIndexAny()](#ExampleLastIndexAny)
    * [func ExampleLastIndexByte()](#ExampleLastIndexByte)
    * [func ExampleLastIndexFunc()](#ExampleLastIndexFunc)
    * [func ExampleJoin()](#ExampleJoin)
    * [func ExampleRepeat()](#ExampleRepeat)
    * [func ExampleReplace()](#ExampleReplace)
    * [func ExampleReplaceAll()](#ExampleReplaceAll)
    * [func ExampleRunes()](#ExampleRunes)
    * [func ExampleSplit()](#ExampleSplit)
    * [func ExampleSplitN()](#ExampleSplitN)
    * [func ExampleSplitAfter()](#ExampleSplitAfter)
    * [func ExampleSplitAfterN()](#ExampleSplitAfterN)
    * [func ExampleTitle()](#ExampleTitle)
    * [func ExampleToTitle()](#ExampleToTitle)
    * [func ExampleToTitleSpecial()](#ExampleToTitleSpecial)
    * [func ExampleTrim()](#ExampleTrim)
    * [func ExampleTrimFunc()](#ExampleTrimFunc)
    * [func ExampleMap()](#ExampleMap)
    * [func ExampleTrimLeft()](#ExampleTrimLeft)
    * [func ExampleTrimLeftFunc()](#ExampleTrimLeftFunc)
    * [func ExampleTrimSpace()](#ExampleTrimSpace)
    * [func ExampleTrimRight()](#ExampleTrimRight)
    * [func ExampleTrimRightFunc()](#ExampleTrimRightFunc)
    * [func ExampleToUpper()](#ExampleToUpper)
    * [func ExampleToUpperSpecial()](#ExampleToUpperSpecial)
    * [func ExampleToLower()](#ExampleToLower)
    * [func ExampleToLowerSpecial()](#ExampleToLowerSpecial)
    * [func ExampleReader_Len()](#ExampleReader_Len)
    * [func TestReader(t *testing.T)](#TestReader)
    * [func TestReadAfterBigSeek(t *testing.T)](#TestReadAfterBigSeek)
    * [func TestReaderAt(t *testing.T)](#TestReaderAt)
    * [func TestReaderAtConcurrent(t *testing.T)](#TestReaderAtConcurrent)
    * [func TestEmptyReaderConcurrent(t *testing.T)](#TestEmptyReaderConcurrent)
    * [func TestReaderWriteTo(t *testing.T)](#TestReaderWriteTo)
    * [func TestReaderLen(t *testing.T)](#TestReaderLen)
    * [func TestUnreadRuneError(t *testing.T)](#TestUnreadRuneError)
    * [func TestReaderDoubleUnreadRune(t *testing.T)](#TestReaderDoubleUnreadRune)
    * [func TestReaderCopyNothing(t *testing.T)](#TestReaderCopyNothing)
    * [func TestReaderLenSize(t *testing.T)](#TestReaderLenSize)
    * [func TestReaderReset(t *testing.T)](#TestReaderReset)
    * [func TestReaderZero(t *testing.T)](#TestReaderZero)


## <a id="const" href="#const">Constants</a>

### <a id="N" href="#N">const N</a>

```
searchKey: bytes_test.N
```

```Go
const N = 10000 // make this bigger for a larger (and slower) test

```

### <a id="space" href="#space">const space</a>

```
searchKey: bytes_test.space
```

```Go
const space = "\t\v\r\f\n\u0085\u00a0\u2000\u3000"
```

## <a id="var" href="#var">Variables</a>

### <a id="testString" href="#testString">var testString</a>

```
searchKey: bytes_test.testString
```

```Go
var testString string // test data for write tests

```

### <a id="testBytes" href="#testBytes">var testBytes</a>

```
searchKey: bytes_test.testBytes
```

```Go
var testBytes []byte // test data; same as testString but as a slice.

```

### <a id="readBytesTests" href="#readBytesTests">var readBytesTests</a>

```
searchKey: bytes_test.readBytesTests
```

```Go
var readBytesTests = ...
```

### <a id="abcd" href="#abcd">var abcd</a>

```
searchKey: bytes_test.abcd
```

```Go
var abcd = "abcd"
```

### <a id="faces" href="#faces">var faces</a>

```
searchKey: bytes_test.faces
```

```Go
var faces = "☺☻☹"
```

### <a id="commas" href="#commas">var commas</a>

```
searchKey: bytes_test.commas
```

```Go
var commas = "1,2,3,4"
```

### <a id="dots" href="#dots">var dots</a>

```
searchKey: bytes_test.dots
```

```Go
var dots = "1....2....3....4"
```

### <a id="indexTests" href="#indexTests">var indexTests</a>

```
searchKey: bytes_test.indexTests
```

```Go
var indexTests = ...
```

### <a id="lastIndexTests" href="#lastIndexTests">var lastIndexTests</a>

```
searchKey: bytes_test.lastIndexTests
```

```Go
var lastIndexTests = ...
```

### <a id="indexAnyTests" href="#indexAnyTests">var indexAnyTests</a>

```
searchKey: bytes_test.indexAnyTests
```

```Go
var indexAnyTests = ...
```

### <a id="lastIndexAnyTests" href="#lastIndexAnyTests">var lastIndexAnyTests</a>

```
searchKey: bytes_test.lastIndexAnyTests
```

```Go
var lastIndexAnyTests = ...
```

### <a id="bmbuf" href="#bmbuf">var bmbuf</a>

```
searchKey: bytes_test.bmbuf
```

```Go
var bmbuf []byte
```

### <a id="indexSizes" href="#indexSizes">var indexSizes</a>

```
searchKey: bytes_test.indexSizes
```

```Go
var indexSizes = []int{10, 32, 4 << 10, 4 << 20, 64 << 20}
```

### <a id="isRaceBuilder" href="#isRaceBuilder">var isRaceBuilder</a>

```
searchKey: bytes_test.isRaceBuilder
```

```Go
var isRaceBuilder = strings.HasSuffix(testenv.Builder(), "-race")
```

### <a id="splittests" href="#splittests">var splittests</a>

```
searchKey: bytes_test.splittests
```

```Go
var splittests = ...
```

### <a id="splitaftertests" href="#splitaftertests">var splitaftertests</a>

```
searchKey: bytes_test.splitaftertests
```

```Go
var splitaftertests = ...
```

### <a id="fieldstests" href="#fieldstests">var fieldstests</a>

```
searchKey: bytes_test.fieldstests
```

```Go
var fieldstests = ...
```

### <a id="upperTests" href="#upperTests">var upperTests</a>

```
searchKey: bytes_test.upperTests
```

```Go
var upperTests = ...
```

### <a id="lowerTests" href="#lowerTests">var lowerTests</a>

```
searchKey: bytes_test.lowerTests
```

```Go
var lowerTests = ...
```

### <a id="trimSpaceTests" href="#trimSpaceTests">var trimSpaceTests</a>

```
searchKey: bytes_test.trimSpaceTests
```

```Go
var trimSpaceTests = ...
```

### <a id="toValidUTF8Tests" href="#toValidUTF8Tests">var toValidUTF8Tests</a>

```
searchKey: bytes_test.toValidUTF8Tests
```

```Go
var toValidUTF8Tests = ...
```

### <a id="RepeatTests" href="#RepeatTests">var RepeatTests</a>

```
searchKey: bytes_test.RepeatTests
```

```Go
var RepeatTests = ...
```

### <a id="RunesTests" href="#RunesTests">var RunesTests</a>

```
searchKey: bytes_test.RunesTests
```

```Go
var RunesTests = ...
```

### <a id="trimTests" href="#trimTests">var trimTests</a>

```
searchKey: bytes_test.trimTests
```

```Go
var trimTests = ...
```

### <a id="isSpace" href="#isSpace">var isSpace</a>

```
searchKey: bytes_test.isSpace
```

```Go
var isSpace = predicate{unicode.IsSpace, "IsSpace"}
```

### <a id="isDigit" href="#isDigit">var isDigit</a>

```
searchKey: bytes_test.isDigit
```

```Go
var isDigit = predicate{unicode.IsDigit, "IsDigit"}
```

### <a id="isUpper" href="#isUpper">var isUpper</a>

```
searchKey: bytes_test.isUpper
```

```Go
var isUpper = predicate{unicode.IsUpper, "IsUpper"}
```

### <a id="isValidRune" href="#isValidRune">var isValidRune</a>

```
searchKey: bytes_test.isValidRune
```

```Go
var isValidRune = predicate{
	func(r rune) bool {
		return r != utf8.RuneError
	},
	"IsValidRune",
}
```

### <a id="trimFuncTests" href="#trimFuncTests">var trimFuncTests</a>

```
searchKey: bytes_test.trimFuncTests
```

```Go
var trimFuncTests = ...
```

### <a id="indexFuncTests" href="#indexFuncTests">var indexFuncTests</a>

```
searchKey: bytes_test.indexFuncTests
```

```Go
var indexFuncTests = ...
```

### <a id="ReplaceTests" href="#ReplaceTests">var ReplaceTests</a>

```
searchKey: bytes_test.ReplaceTests
```

```Go
var ReplaceTests = ...
```

### <a id="TitleTests" href="#TitleTests">var TitleTests</a>

```
searchKey: bytes_test.TitleTests
```

```Go
var TitleTests = ...
```

### <a id="ToTitleTests" href="#ToTitleTests">var ToTitleTests</a>

```
searchKey: bytes_test.ToTitleTests
```

```Go
var ToTitleTests = ...
```

### <a id="EqualFoldTests" href="#EqualFoldTests">var EqualFoldTests</a>

```
searchKey: bytes_test.EqualFoldTests
```

```Go
var EqualFoldTests = ...
```

### <a id="containsTests" href="#containsTests">var containsTests</a>

```
searchKey: bytes_test.containsTests
```

```Go
var containsTests = ...
```

### <a id="ContainsAnyTests" href="#ContainsAnyTests">var ContainsAnyTests</a>

```
searchKey: bytes_test.ContainsAnyTests
```

```Go
var ContainsAnyTests = ...
```

### <a id="ContainsRuneTests" href="#ContainsRuneTests">var ContainsRuneTests</a>

```
searchKey: bytes_test.ContainsRuneTests
```

```Go
var ContainsRuneTests = ...
```

### <a id="makeFieldsInput" href="#makeFieldsInput">var makeFieldsInput</a>

```
searchKey: bytes_test.makeFieldsInput
```

```Go
var makeFieldsInput = ...
```

### <a id="makeFieldsInputASCII" href="#makeFieldsInputASCII">var makeFieldsInputASCII</a>

```
searchKey: bytes_test.makeFieldsInputASCII
```

```Go
var makeFieldsInputASCII = ...
```

### <a id="bytesdata" href="#bytesdata">var bytesdata</a>

```
searchKey: bytes_test.bytesdata
```

```Go
var bytesdata = ...
```

### <a id="benchInputHard" href="#benchInputHard">var benchInputHard</a>

```
searchKey: bytes_test.benchInputHard
```

```Go
var benchInputHard = makeBenchInputHard()
```

### <a id="compareTests" href="#compareTests">var compareTests</a>

```
searchKey: bytes_test.compareTests
```

```Go
var compareTests = ...
```

### <a id="UnreadRuneErrorTests" href="#UnreadRuneErrorTests">var UnreadRuneErrorTests</a>

```
searchKey: bytes_test.UnreadRuneErrorTests
```

```Go
var UnreadRuneErrorTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="negativeReader" href="#negativeReader">type negativeReader struct{}</a>

```
searchKey: bytes_test.negativeReader
```

```Go
type negativeReader struct{}
```

#### <a id="negativeReader.Read" href="#negativeReader.Read">func (r *negativeReader) Read([]byte) (int, error)</a>

```
searchKey: bytes_test.negativeReader.Read
```

```Go
func (r *negativeReader) Read([]byte) (int, error)
```

### <a id="panicReader" href="#panicReader">type panicReader struct</a>

```
searchKey: bytes_test.panicReader
```

```Go
type panicReader struct{ panic bool }
```

#### <a id="panicReader.Read" href="#panicReader.Read">func (r panicReader) Read(p []byte) (int, error)</a>

```
searchKey: bytes_test.panicReader.Read
```

```Go
func (r panicReader) Read(p []byte) (int, error)
```

### <a id="BinOpTest" href="#BinOpTest">type BinOpTest struct</a>

```
searchKey: bytes_test.BinOpTest
```

```Go
type BinOpTest struct {
	a string
	b string
	i int
}
```

### <a id="SplitTest" href="#SplitTest">type SplitTest struct</a>

```
searchKey: bytes_test.SplitTest
```

```Go
type SplitTest struct {
	s   string
	sep string
	n   int
	a   []string
}
```

### <a id="FieldsTest" href="#FieldsTest">type FieldsTest struct</a>

```
searchKey: bytes_test.FieldsTest
```

```Go
type FieldsTest struct {
	s string
	a []string
}
```

### <a id="StringTest" href="#StringTest">type StringTest struct</a>

```
searchKey: bytes_test.StringTest
```

```Go
type StringTest struct {
	in  string
	out []byte
}
```

Test case for any function which accepts and returns a byte slice. For ease of creation, we write the input byte slice as a string. 

### <a id="RepeatTest" href="#RepeatTest">type RepeatTest struct</a>

```
searchKey: bytes_test.RepeatTest
```

```Go
type RepeatTest struct {
	in, out string
	count   int
}
```

### <a id="RunesTest" href="#RunesTest">type RunesTest struct</a>

```
searchKey: bytes_test.RunesTest
```

```Go
type RunesTest struct {
	in    string
	out   []rune
	lossy bool
}
```

### <a id="TrimTest" href="#TrimTest">type TrimTest struct</a>

```
searchKey: bytes_test.TrimTest
```

```Go
type TrimTest struct {
	f            string
	in, arg, out string
}
```

### <a id="predicate" href="#predicate">type predicate struct</a>

```
searchKey: bytes_test.predicate
```

```Go
type predicate struct {
	f    func(r rune) bool
	name string
}
```

#### <a id="not" href="#not">func not(p predicate) predicate</a>

```
searchKey: bytes_test.not
```

```Go
func not(p predicate) predicate
```

### <a id="TrimFuncTest" href="#TrimFuncTest">type TrimFuncTest struct</a>

```
searchKey: bytes_test.TrimFuncTest
```

```Go
type TrimFuncTest struct {
	f        predicate
	in       string
	trimOut  []byte
	leftOut  []byte
	rightOut []byte
}
```

### <a id="IndexFuncTest" href="#IndexFuncTest">type IndexFuncTest struct</a>

```
searchKey: bytes_test.IndexFuncTest
```

```Go
type IndexFuncTest struct {
	in          string
	f           predicate
	first, last int
}
```

### <a id="ReplaceTest" href="#ReplaceTest">type ReplaceTest struct</a>

```
searchKey: bytes_test.ReplaceTest
```

```Go
type ReplaceTest struct {
	in       string
	old, new string
	n        int
	out      string
}
```

### <a id="TitleTest" href="#TitleTest">type TitleTest struct</a>

```
searchKey: bytes_test.TitleTest
```

```Go
type TitleTest struct {
	in, out string
}
```

## <a id="func" href="#func">Functions</a>

### <a id="init" href="#init">func init()</a>

```
searchKey: bytes_test.init
```

```Go
func init()
```

### <a id="check" href="#check">func check(t *testing.T, testname string, buf *Buffer, s string)</a>

```
searchKey: bytes_test.check
```

```Go
func check(t *testing.T, testname string, buf *Buffer, s string)
```

Verify that contents of buf match the string s. 

### <a id="fillString" href="#fillString">func fillString(t *testing.T, testname string, buf *Buffer, s string, n int, fus string) string</a>

```
searchKey: bytes_test.fillString
```

```Go
func fillString(t *testing.T, testname string, buf *Buffer, s string, n int, fus string) string
```

Fill buf through n writes of string fus. The initial contents of buf corresponds to the string s; the result is the final contents of buf returned as a string. 

### <a id="fillBytes" href="#fillBytes">func fillBytes(t *testing.T, testname string, buf *Buffer, s string, n int, fub []byte) string</a>

```
searchKey: bytes_test.fillBytes
```

```Go
func fillBytes(t *testing.T, testname string, buf *Buffer, s string, n int, fub []byte) string
```

Fill buf through n writes of byte slice fub. The initial contents of buf corresponds to the string s; the result is the final contents of buf returned as a string. 

### <a id="TestNewBuffer" href="#TestNewBuffer">func TestNewBuffer(t *testing.T)</a>

```
searchKey: bytes_test.TestNewBuffer
```

```Go
func TestNewBuffer(t *testing.T)
```

### <a id="TestNewBufferString" href="#TestNewBufferString">func TestNewBufferString(t *testing.T)</a>

```
searchKey: bytes_test.TestNewBufferString
```

```Go
func TestNewBufferString(t *testing.T)
```

### <a id="empty" href="#empty">func empty(t *testing.T, testname string, buf *Buffer, s string, fub []byte)</a>

```
searchKey: bytes_test.empty
```

```Go
func empty(t *testing.T, testname string, buf *Buffer, s string, fub []byte)
```

Empty buf through repeated reads into fub. The initial contents of buf corresponds to the string s. 

### <a id="TestBasicOperations" href="#TestBasicOperations">func TestBasicOperations(t *testing.T)</a>

```
searchKey: bytes_test.TestBasicOperations
```

```Go
func TestBasicOperations(t *testing.T)
```

### <a id="TestLargeStringWrites" href="#TestLargeStringWrites">func TestLargeStringWrites(t *testing.T)</a>

```
searchKey: bytes_test.TestLargeStringWrites
```

```Go
func TestLargeStringWrites(t *testing.T)
```

### <a id="TestLargeByteWrites" href="#TestLargeByteWrites">func TestLargeByteWrites(t *testing.T)</a>

```
searchKey: bytes_test.TestLargeByteWrites
```

```Go
func TestLargeByteWrites(t *testing.T)
```

### <a id="TestLargeStringReads" href="#TestLargeStringReads">func TestLargeStringReads(t *testing.T)</a>

```
searchKey: bytes_test.TestLargeStringReads
```

```Go
func TestLargeStringReads(t *testing.T)
```

### <a id="TestLargeByteReads" href="#TestLargeByteReads">func TestLargeByteReads(t *testing.T)</a>

```
searchKey: bytes_test.TestLargeByteReads
```

```Go
func TestLargeByteReads(t *testing.T)
```

### <a id="TestMixedReadsAndWrites" href="#TestMixedReadsAndWrites">func TestMixedReadsAndWrites(t *testing.T)</a>

```
searchKey: bytes_test.TestMixedReadsAndWrites
```

```Go
func TestMixedReadsAndWrites(t *testing.T)
```

### <a id="TestCapWithPreallocatedSlice" href="#TestCapWithPreallocatedSlice">func TestCapWithPreallocatedSlice(t *testing.T)</a>

```
searchKey: bytes_test.TestCapWithPreallocatedSlice
```

```Go
func TestCapWithPreallocatedSlice(t *testing.T)
```

### <a id="TestCapWithSliceAndWrittenData" href="#TestCapWithSliceAndWrittenData">func TestCapWithSliceAndWrittenData(t *testing.T)</a>

```
searchKey: bytes_test.TestCapWithSliceAndWrittenData
```

```Go
func TestCapWithSliceAndWrittenData(t *testing.T)
```

### <a id="TestNil" href="#TestNil">func TestNil(t *testing.T)</a>

```
searchKey: bytes_test.TestNil
```

```Go
func TestNil(t *testing.T)
```

### <a id="TestReadFrom" href="#TestReadFrom">func TestReadFrom(t *testing.T)</a>

```
searchKey: bytes_test.TestReadFrom
```

```Go
func TestReadFrom(t *testing.T)
```

### <a id="TestReadFromPanicReader" href="#TestReadFromPanicReader">func TestReadFromPanicReader(t *testing.T)</a>

```
searchKey: bytes_test.TestReadFromPanicReader
```

```Go
func TestReadFromPanicReader(t *testing.T)
```

Make sure that an empty Buffer remains empty when it is "grown" before a Read that panics 

### <a id="TestReadFromNegativeReader" href="#TestReadFromNegativeReader">func TestReadFromNegativeReader(t *testing.T)</a>

```
searchKey: bytes_test.TestReadFromNegativeReader
```

```Go
func TestReadFromNegativeReader(t *testing.T)
```

### <a id="TestWriteTo" href="#TestWriteTo">func TestWriteTo(t *testing.T)</a>

```
searchKey: bytes_test.TestWriteTo
```

```Go
func TestWriteTo(t *testing.T)
```

### <a id="TestRuneIO" href="#TestRuneIO">func TestRuneIO(t *testing.T)</a>

```
searchKey: bytes_test.TestRuneIO
```

```Go
func TestRuneIO(t *testing.T)
```

### <a id="TestWriteInvalidRune" href="#TestWriteInvalidRune">func TestWriteInvalidRune(t *testing.T)</a>

```
searchKey: bytes_test.TestWriteInvalidRune
```

```Go
func TestWriteInvalidRune(t *testing.T)
```

### <a id="TestNext" href="#TestNext">func TestNext(t *testing.T)</a>

```
searchKey: bytes_test.TestNext
```

```Go
func TestNext(t *testing.T)
```

### <a id="TestReadBytes" href="#TestReadBytes">func TestReadBytes(t *testing.T)</a>

```
searchKey: bytes_test.TestReadBytes
```

```Go
func TestReadBytes(t *testing.T)
```

### <a id="TestReadString" href="#TestReadString">func TestReadString(t *testing.T)</a>

```
searchKey: bytes_test.TestReadString
```

```Go
func TestReadString(t *testing.T)
```

### <a id="BenchmarkReadString" href="#BenchmarkReadString">func BenchmarkReadString(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkReadString
```

```Go
func BenchmarkReadString(b *testing.B)
```

### <a id="TestGrow" href="#TestGrow">func TestGrow(t *testing.T)</a>

```
searchKey: bytes_test.TestGrow
```

```Go
func TestGrow(t *testing.T)
```

### <a id="TestGrowOverflow" href="#TestGrowOverflow">func TestGrowOverflow(t *testing.T)</a>

```
searchKey: bytes_test.TestGrowOverflow
```

```Go
func TestGrowOverflow(t *testing.T)
```

### <a id="TestReadEmptyAtEOF" href="#TestReadEmptyAtEOF">func TestReadEmptyAtEOF(t *testing.T)</a>

```
searchKey: bytes_test.TestReadEmptyAtEOF
```

```Go
func TestReadEmptyAtEOF(t *testing.T)
```

Was a bug: used to give EOF reading empty slice at EOF. 

### <a id="TestUnreadByte" href="#TestUnreadByte">func TestUnreadByte(t *testing.T)</a>

```
searchKey: bytes_test.TestUnreadByte
```

```Go
func TestUnreadByte(t *testing.T)
```

### <a id="TestBufferGrowth" href="#TestBufferGrowth">func TestBufferGrowth(t *testing.T)</a>

```
searchKey: bytes_test.TestBufferGrowth
```

```Go
func TestBufferGrowth(t *testing.T)
```

Tests that we occasionally compact. Issue 5154. 

### <a id="BenchmarkWriteByte" href="#BenchmarkWriteByte">func BenchmarkWriteByte(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkWriteByte
```

```Go
func BenchmarkWriteByte(b *testing.B)
```

### <a id="BenchmarkWriteRune" href="#BenchmarkWriteRune">func BenchmarkWriteRune(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkWriteRune
```

```Go
func BenchmarkWriteRune(b *testing.B)
```

### <a id="BenchmarkBufferNotEmptyWriteRead" href="#BenchmarkBufferNotEmptyWriteRead">func BenchmarkBufferNotEmptyWriteRead(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkBufferNotEmptyWriteRead
```

```Go
func BenchmarkBufferNotEmptyWriteRead(b *testing.B)
```

From Issue 5154. 

### <a id="BenchmarkBufferFullSmallReads" href="#BenchmarkBufferFullSmallReads">func BenchmarkBufferFullSmallReads(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkBufferFullSmallReads
```

```Go
func BenchmarkBufferFullSmallReads(b *testing.B)
```

Check that we don't compact too often. From Issue 5154. 

### <a id="eq" href="#eq">func eq(a, b []string) bool</a>

```
searchKey: bytes_test.eq
```

```Go
func eq(a, b []string) bool
```

### <a id="sliceOfString" href="#sliceOfString">func sliceOfString(s [][]byte) []string</a>

```
searchKey: bytes_test.sliceOfString
```

```Go
func sliceOfString(s [][]byte) []string
```

### <a id="TestEqual" href="#TestEqual">func TestEqual(t *testing.T)</a>

```
searchKey: bytes_test.TestEqual
```

```Go
func TestEqual(t *testing.T)
```

### <a id="TestEqualExhaustive" href="#TestEqualExhaustive">func TestEqualExhaustive(t *testing.T)</a>

```
searchKey: bytes_test.TestEqualExhaustive
```

```Go
func TestEqualExhaustive(t *testing.T)
```

### <a id="TestNotEqual" href="#TestNotEqual">func TestNotEqual(t *testing.T)</a>

```
searchKey: bytes_test.TestNotEqual
```

```Go
func TestNotEqual(t *testing.T)
```

make sure Equal returns false for minimally different strings. The data is all zeros except for a single one in one location. 

### <a id="runIndexTests" href="#runIndexTests">func runIndexTests(t *testing.T, f func(s, sep []byte) int, funcName string, testCases []BinOpTest)</a>

```
searchKey: bytes_test.runIndexTests
```

```Go
func runIndexTests(t *testing.T, f func(s, sep []byte) int, funcName string, testCases []BinOpTest)
```

Execute f on each test case.  funcName should be the name of f; it's used in failure reports. 

### <a id="runIndexAnyTests" href="#runIndexAnyTests">func runIndexAnyTests(t *testing.T, f func(s []byte, chars string) int, funcName string, testCases []BinOpTest)</a>

```
searchKey: bytes_test.runIndexAnyTests
```

```Go
func runIndexAnyTests(t *testing.T, f func(s []byte, chars string) int, funcName string, testCases []BinOpTest)
```

### <a id="TestIndex" href="#TestIndex">func TestIndex(t *testing.T)</a>

```
searchKey: bytes_test.TestIndex
```

```Go
func TestIndex(t *testing.T)
```

### <a id="TestLastIndex" href="#TestLastIndex">func TestLastIndex(t *testing.T)</a>

```
searchKey: bytes_test.TestLastIndex
```

```Go
func TestLastIndex(t *testing.T)
```

### <a id="TestIndexAny" href="#TestIndexAny">func TestIndexAny(t *testing.T)</a>

```
searchKey: bytes_test.TestIndexAny
```

```Go
func TestIndexAny(t *testing.T)
```

### <a id="TestLastIndexAny" href="#TestLastIndexAny">func TestLastIndexAny(t *testing.T)</a>

```
searchKey: bytes_test.TestLastIndexAny
```

```Go
func TestLastIndexAny(t *testing.T)
```

### <a id="TestIndexByte" href="#TestIndexByte">func TestIndexByte(t *testing.T)</a>

```
searchKey: bytes_test.TestIndexByte
```

```Go
func TestIndexByte(t *testing.T)
```

### <a id="TestLastIndexByte" href="#TestLastIndexByte">func TestLastIndexByte(t *testing.T)</a>

```
searchKey: bytes_test.TestLastIndexByte
```

```Go
func TestLastIndexByte(t *testing.T)
```

### <a id="TestIndexByteBig" href="#TestIndexByteBig">func TestIndexByteBig(t *testing.T)</a>

```
searchKey: bytes_test.TestIndexByteBig
```

```Go
func TestIndexByteBig(t *testing.T)
```

test a larger buffer with different sizes and alignments 

### <a id="TestIndexByteSmall" href="#TestIndexByteSmall">func TestIndexByteSmall(t *testing.T)</a>

```
searchKey: bytes_test.TestIndexByteSmall
```

```Go
func TestIndexByteSmall(t *testing.T)
```

test a small index across all page offsets 

### <a id="TestIndexRune" href="#TestIndexRune">func TestIndexRune(t *testing.T)</a>

```
searchKey: bytes_test.TestIndexRune
```

```Go
func TestIndexRune(t *testing.T)
```

### <a id="TestCountByte" href="#TestCountByte">func TestCountByte(t *testing.T)</a>

```
searchKey: bytes_test.TestCountByte
```

```Go
func TestCountByte(t *testing.T)
```

test count of a single byte across page offsets 

### <a id="TestCountByteNoMatch" href="#TestCountByteNoMatch">func TestCountByteNoMatch(t *testing.T)</a>

```
searchKey: bytes_test.TestCountByteNoMatch
```

```Go
func TestCountByteNoMatch(t *testing.T)
```

Make sure we don't count bytes outside our window 

### <a id="valName" href="#valName">func valName(x int) string</a>

```
searchKey: bytes_test.valName
```

```Go
func valName(x int) string
```

### <a id="benchBytes" href="#benchBytes">func benchBytes(b *testing.B, sizes []int, f func(b *testing.B, n int))</a>

```
searchKey: bytes_test.benchBytes
```

```Go
func benchBytes(b *testing.B, sizes []int, f func(b *testing.B, n int))
```

### <a id="BenchmarkIndexByte" href="#BenchmarkIndexByte">func BenchmarkIndexByte(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkIndexByte
```

```Go
func BenchmarkIndexByte(b *testing.B)
```

### <a id="BenchmarkIndexBytePortable" href="#BenchmarkIndexBytePortable">func BenchmarkIndexBytePortable(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkIndexBytePortable
```

```Go
func BenchmarkIndexBytePortable(b *testing.B)
```

### <a id="bmIndexByte" href="#bmIndexByte">func bmIndexByte(index func([]byte, byte) int) func(b *testing.B, n int)</a>

```
searchKey: bytes_test.bmIndexByte
```

```Go
func bmIndexByte(index func([]byte, byte) int) func(b *testing.B, n int)
```

### <a id="BenchmarkIndexRune" href="#BenchmarkIndexRune">func BenchmarkIndexRune(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkIndexRune
```

```Go
func BenchmarkIndexRune(b *testing.B)
```

### <a id="BenchmarkIndexRuneASCII" href="#BenchmarkIndexRuneASCII">func BenchmarkIndexRuneASCII(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkIndexRuneASCII
```

```Go
func BenchmarkIndexRuneASCII(b *testing.B)
```

### <a id="bmIndexRuneASCII" href="#bmIndexRuneASCII">func bmIndexRuneASCII(index func([]byte, rune) int) func(b *testing.B, n int)</a>

```
searchKey: bytes_test.bmIndexRuneASCII
```

```Go
func bmIndexRuneASCII(index func([]byte, rune) int) func(b *testing.B, n int)
```

### <a id="bmIndexRune" href="#bmIndexRune">func bmIndexRune(index func([]byte, rune) int) func(b *testing.B, n int)</a>

```
searchKey: bytes_test.bmIndexRune
```

```Go
func bmIndexRune(index func([]byte, rune) int) func(b *testing.B, n int)
```

### <a id="BenchmarkEqual" href="#BenchmarkEqual">func BenchmarkEqual(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkEqual
```

```Go
func BenchmarkEqual(b *testing.B)
```

### <a id="bmEqual" href="#bmEqual">func bmEqual(equal func([]byte, []byte) bool) func(b *testing.B, n int)</a>

```
searchKey: bytes_test.bmEqual
```

```Go
func bmEqual(equal func([]byte, []byte) bool) func(b *testing.B, n int)
```

### <a id="BenchmarkIndex" href="#BenchmarkIndex">func BenchmarkIndex(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkIndex
```

```Go
func BenchmarkIndex(b *testing.B)
```

### <a id="BenchmarkIndexEasy" href="#BenchmarkIndexEasy">func BenchmarkIndexEasy(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkIndexEasy
```

```Go
func BenchmarkIndexEasy(b *testing.B)
```

### <a id="BenchmarkCount" href="#BenchmarkCount">func BenchmarkCount(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkCount
```

```Go
func BenchmarkCount(b *testing.B)
```

### <a id="BenchmarkCountEasy" href="#BenchmarkCountEasy">func BenchmarkCountEasy(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkCountEasy
```

```Go
func BenchmarkCountEasy(b *testing.B)
```

### <a id="BenchmarkCountSingle" href="#BenchmarkCountSingle">func BenchmarkCountSingle(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkCountSingle
```

```Go
func BenchmarkCountSingle(b *testing.B)
```

### <a id="TestSplit" href="#TestSplit">func TestSplit(t *testing.T)</a>

```
searchKey: bytes_test.TestSplit
```

```Go
func TestSplit(t *testing.T)
```

### <a id="TestSplitAfter" href="#TestSplitAfter">func TestSplitAfter(t *testing.T)</a>

```
searchKey: bytes_test.TestSplitAfter
```

```Go
func TestSplitAfter(t *testing.T)
```

### <a id="TestFields" href="#TestFields">func TestFields(t *testing.T)</a>

```
searchKey: bytes_test.TestFields
```

```Go
func TestFields(t *testing.T)
```

### <a id="TestFieldsFunc" href="#TestFieldsFunc">func TestFieldsFunc(t *testing.T)</a>

```
searchKey: bytes_test.TestFieldsFunc
```

```Go
func TestFieldsFunc(t *testing.T)
```

### <a id="runStringTests" href="#runStringTests">func runStringTests(t *testing.T, f func([]byte) []byte, funcName string, testCases []StringTest)</a>

```
searchKey: bytes_test.runStringTests
```

```Go
func runStringTests(t *testing.T, f func([]byte) []byte, funcName string, testCases []StringTest)
```

Execute f on each test case.  funcName should be the name of f; it's used in failure reports. 

### <a id="tenRunes" href="#tenRunes">func tenRunes(r rune) string</a>

```
searchKey: bytes_test.tenRunes
```

```Go
func tenRunes(r rune) string
```

### <a id="rot13" href="#rot13">func rot13(r rune) rune</a>

```
searchKey: bytes_test.rot13
```

```Go
func rot13(r rune) rune
```

User-defined self-inverse mapping function 

### <a id="TestMap" href="#TestMap">func TestMap(t *testing.T)</a>

```
searchKey: bytes_test.TestMap
```

```Go
func TestMap(t *testing.T)
```

### <a id="TestToUpper" href="#TestToUpper">func TestToUpper(t *testing.T)</a>

```
searchKey: bytes_test.TestToUpper
```

```Go
func TestToUpper(t *testing.T)
```

### <a id="TestToLower" href="#TestToLower">func TestToLower(t *testing.T)</a>

```
searchKey: bytes_test.TestToLower
```

```Go
func TestToLower(t *testing.T)
```

### <a id="BenchmarkToUpper" href="#BenchmarkToUpper">func BenchmarkToUpper(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkToUpper
```

```Go
func BenchmarkToUpper(b *testing.B)
```

### <a id="BenchmarkToLower" href="#BenchmarkToLower">func BenchmarkToLower(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkToLower
```

```Go
func BenchmarkToLower(b *testing.B)
```

### <a id="TestToValidUTF8" href="#TestToValidUTF8">func TestToValidUTF8(t *testing.T)</a>

```
searchKey: bytes_test.TestToValidUTF8
```

```Go
func TestToValidUTF8(t *testing.T)
```

### <a id="TestTrimSpace" href="#TestTrimSpace">func TestTrimSpace(t *testing.T)</a>

```
searchKey: bytes_test.TestTrimSpace
```

```Go
func TestTrimSpace(t *testing.T)
```

### <a id="TestRepeat" href="#TestRepeat">func TestRepeat(t *testing.T)</a>

```
searchKey: bytes_test.TestRepeat
```

```Go
func TestRepeat(t *testing.T)
```

### <a id="repeat" href="#repeat">func repeat(b []byte, count int) (err error)</a>

```
searchKey: bytes_test.repeat
```

```Go
func repeat(b []byte, count int) (err error)
```

### <a id="TestRepeatCatchesOverflow" href="#TestRepeatCatchesOverflow">func TestRepeatCatchesOverflow(t *testing.T)</a>

```
searchKey: bytes_test.TestRepeatCatchesOverflow
```

```Go
func TestRepeatCatchesOverflow(t *testing.T)
```

See Issue golang.org/issue/16237 

### <a id="runesEqual" href="#runesEqual">func runesEqual(a, b []rune) bool</a>

```
searchKey: bytes_test.runesEqual
```

```Go
func runesEqual(a, b []rune) bool
```

### <a id="TestRunes" href="#TestRunes">func TestRunes(t *testing.T)</a>

```
searchKey: bytes_test.TestRunes
```

```Go
func TestRunes(t *testing.T)
```

### <a id="TestTrim" href="#TestTrim">func TestTrim(t *testing.T)</a>

```
searchKey: bytes_test.TestTrim
```

```Go
func TestTrim(t *testing.T)
```

### <a id="TestTrimFunc" href="#TestTrimFunc">func TestTrimFunc(t *testing.T)</a>

```
searchKey: bytes_test.TestTrimFunc
```

```Go
func TestTrimFunc(t *testing.T)
```

### <a id="TestIndexFunc" href="#TestIndexFunc">func TestIndexFunc(t *testing.T)</a>

```
searchKey: bytes_test.TestIndexFunc
```

```Go
func TestIndexFunc(t *testing.T)
```

### <a id="TestReplace" href="#TestReplace">func TestReplace(t *testing.T)</a>

```
searchKey: bytes_test.TestReplace
```

```Go
func TestReplace(t *testing.T)
```

### <a id="TestTitle" href="#TestTitle">func TestTitle(t *testing.T)</a>

```
searchKey: bytes_test.TestTitle
```

```Go
func TestTitle(t *testing.T)
```

### <a id="TestToTitle" href="#TestToTitle">func TestToTitle(t *testing.T)</a>

```
searchKey: bytes_test.TestToTitle
```

```Go
func TestToTitle(t *testing.T)
```

### <a id="TestEqualFold" href="#TestEqualFold">func TestEqualFold(t *testing.T)</a>

```
searchKey: bytes_test.TestEqualFold
```

```Go
func TestEqualFold(t *testing.T)
```

### <a id="TestBufferGrowNegative" href="#TestBufferGrowNegative">func TestBufferGrowNegative(t *testing.T)</a>

```
searchKey: bytes_test.TestBufferGrowNegative
```

```Go
func TestBufferGrowNegative(t *testing.T)
```

### <a id="TestBufferTruncateNegative" href="#TestBufferTruncateNegative">func TestBufferTruncateNegative(t *testing.T)</a>

```
searchKey: bytes_test.TestBufferTruncateNegative
```

```Go
func TestBufferTruncateNegative(t *testing.T)
```

### <a id="TestBufferTruncateOutOfRange" href="#TestBufferTruncateOutOfRange">func TestBufferTruncateOutOfRange(t *testing.T)</a>

```
searchKey: bytes_test.TestBufferTruncateOutOfRange
```

```Go
func TestBufferTruncateOutOfRange(t *testing.T)
```

### <a id="TestContains" href="#TestContains">func TestContains(t *testing.T)</a>

```
searchKey: bytes_test.TestContains
```

```Go
func TestContains(t *testing.T)
```

### <a id="TestContainsAny" href="#TestContainsAny">func TestContainsAny(t *testing.T)</a>

```
searchKey: bytes_test.TestContainsAny
```

```Go
func TestContainsAny(t *testing.T)
```

### <a id="TestContainsRune" href="#TestContainsRune">func TestContainsRune(t *testing.T)</a>

```
searchKey: bytes_test.TestContainsRune
```

```Go
func TestContainsRune(t *testing.T)
```

### <a id="BenchmarkFields" href="#BenchmarkFields">func BenchmarkFields(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkFields
```

```Go
func BenchmarkFields(b *testing.B)
```

### <a id="BenchmarkFieldsFunc" href="#BenchmarkFieldsFunc">func BenchmarkFieldsFunc(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkFieldsFunc
```

```Go
func BenchmarkFieldsFunc(b *testing.B)
```

### <a id="BenchmarkTrimSpace" href="#BenchmarkTrimSpace">func BenchmarkTrimSpace(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkTrimSpace
```

```Go
func BenchmarkTrimSpace(b *testing.B)
```

### <a id="BenchmarkToValidUTF8" href="#BenchmarkToValidUTF8">func BenchmarkToValidUTF8(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkToValidUTF8
```

```Go
func BenchmarkToValidUTF8(b *testing.B)
```

### <a id="makeBenchInputHard" href="#makeBenchInputHard">func makeBenchInputHard() []byte</a>

```
searchKey: bytes_test.makeBenchInputHard
```

```Go
func makeBenchInputHard() []byte
```

### <a id="benchmarkIndexHard" href="#benchmarkIndexHard">func benchmarkIndexHard(b *testing.B, sep []byte)</a>

```
searchKey: bytes_test.benchmarkIndexHard
```

```Go
func benchmarkIndexHard(b *testing.B, sep []byte)
```

### <a id="benchmarkLastIndexHard" href="#benchmarkLastIndexHard">func benchmarkLastIndexHard(b *testing.B, sep []byte)</a>

```
searchKey: bytes_test.benchmarkLastIndexHard
```

```Go
func benchmarkLastIndexHard(b *testing.B, sep []byte)
```

### <a id="benchmarkCountHard" href="#benchmarkCountHard">func benchmarkCountHard(b *testing.B, sep []byte)</a>

```
searchKey: bytes_test.benchmarkCountHard
```

```Go
func benchmarkCountHard(b *testing.B, sep []byte)
```

### <a id="BenchmarkIndexHard1" href="#BenchmarkIndexHard1">func BenchmarkIndexHard1(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkIndexHard1
```

```Go
func BenchmarkIndexHard1(b *testing.B)
```

### <a id="BenchmarkIndexHard2" href="#BenchmarkIndexHard2">func BenchmarkIndexHard2(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkIndexHard2
```

```Go
func BenchmarkIndexHard2(b *testing.B)
```

### <a id="BenchmarkIndexHard3" href="#BenchmarkIndexHard3">func BenchmarkIndexHard3(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkIndexHard3
```

```Go
func BenchmarkIndexHard3(b *testing.B)
```

### <a id="BenchmarkIndexHard4" href="#BenchmarkIndexHard4">func BenchmarkIndexHard4(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkIndexHard4
```

```Go
func BenchmarkIndexHard4(b *testing.B)
```

### <a id="BenchmarkLastIndexHard1" href="#BenchmarkLastIndexHard1">func BenchmarkLastIndexHard1(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkLastIndexHard1
```

```Go
func BenchmarkLastIndexHard1(b *testing.B)
```

### <a id="BenchmarkLastIndexHard2" href="#BenchmarkLastIndexHard2">func BenchmarkLastIndexHard2(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkLastIndexHard2
```

```Go
func BenchmarkLastIndexHard2(b *testing.B)
```

### <a id="BenchmarkLastIndexHard3" href="#BenchmarkLastIndexHard3">func BenchmarkLastIndexHard3(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkLastIndexHard3
```

```Go
func BenchmarkLastIndexHard3(b *testing.B)
```

### <a id="BenchmarkCountHard1" href="#BenchmarkCountHard1">func BenchmarkCountHard1(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkCountHard1
```

```Go
func BenchmarkCountHard1(b *testing.B)
```

### <a id="BenchmarkCountHard2" href="#BenchmarkCountHard2">func BenchmarkCountHard2(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkCountHard2
```

```Go
func BenchmarkCountHard2(b *testing.B)
```

### <a id="BenchmarkCountHard3" href="#BenchmarkCountHard3">func BenchmarkCountHard3(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkCountHard3
```

```Go
func BenchmarkCountHard3(b *testing.B)
```

### <a id="BenchmarkSplitEmptySeparator" href="#BenchmarkSplitEmptySeparator">func BenchmarkSplitEmptySeparator(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkSplitEmptySeparator
```

```Go
func BenchmarkSplitEmptySeparator(b *testing.B)
```

### <a id="BenchmarkSplitSingleByteSeparator" href="#BenchmarkSplitSingleByteSeparator">func BenchmarkSplitSingleByteSeparator(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkSplitSingleByteSeparator
```

```Go
func BenchmarkSplitSingleByteSeparator(b *testing.B)
```

### <a id="BenchmarkSplitMultiByteSeparator" href="#BenchmarkSplitMultiByteSeparator">func BenchmarkSplitMultiByteSeparator(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkSplitMultiByteSeparator
```

```Go
func BenchmarkSplitMultiByteSeparator(b *testing.B)
```

### <a id="BenchmarkSplitNSingleByteSeparator" href="#BenchmarkSplitNSingleByteSeparator">func BenchmarkSplitNSingleByteSeparator(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkSplitNSingleByteSeparator
```

```Go
func BenchmarkSplitNSingleByteSeparator(b *testing.B)
```

### <a id="BenchmarkSplitNMultiByteSeparator" href="#BenchmarkSplitNMultiByteSeparator">func BenchmarkSplitNMultiByteSeparator(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkSplitNMultiByteSeparator
```

```Go
func BenchmarkSplitNMultiByteSeparator(b *testing.B)
```

### <a id="BenchmarkRepeat" href="#BenchmarkRepeat">func BenchmarkRepeat(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkRepeat
```

```Go
func BenchmarkRepeat(b *testing.B)
```

### <a id="BenchmarkBytesCompare" href="#BenchmarkBytesCompare">func BenchmarkBytesCompare(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkBytesCompare
```

```Go
func BenchmarkBytesCompare(b *testing.B)
```

### <a id="BenchmarkIndexAnyASCII" href="#BenchmarkIndexAnyASCII">func BenchmarkIndexAnyASCII(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkIndexAnyASCII
```

```Go
func BenchmarkIndexAnyASCII(b *testing.B)
```

### <a id="BenchmarkIndexAnyUTF8" href="#BenchmarkIndexAnyUTF8">func BenchmarkIndexAnyUTF8(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkIndexAnyUTF8
```

```Go
func BenchmarkIndexAnyUTF8(b *testing.B)
```

### <a id="BenchmarkLastIndexAnyASCII" href="#BenchmarkLastIndexAnyASCII">func BenchmarkLastIndexAnyASCII(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkLastIndexAnyASCII
```

```Go
func BenchmarkLastIndexAnyASCII(b *testing.B)
```

### <a id="BenchmarkLastIndexAnyUTF8" href="#BenchmarkLastIndexAnyUTF8">func BenchmarkLastIndexAnyUTF8(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkLastIndexAnyUTF8
```

```Go
func BenchmarkLastIndexAnyUTF8(b *testing.B)
```

### <a id="BenchmarkTrimASCII" href="#BenchmarkTrimASCII">func BenchmarkTrimASCII(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkTrimASCII
```

```Go
func BenchmarkTrimASCII(b *testing.B)
```

### <a id="BenchmarkIndexPeriodic" href="#BenchmarkIndexPeriodic">func BenchmarkIndexPeriodic(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkIndexPeriodic
```

```Go
func BenchmarkIndexPeriodic(b *testing.B)
```

### <a id="TestCompare" href="#TestCompare">func TestCompare(t *testing.T)</a>

```
searchKey: bytes_test.TestCompare
```

```Go
func TestCompare(t *testing.T)
```

### <a id="TestCompareIdenticalSlice" href="#TestCompareIdenticalSlice">func TestCompareIdenticalSlice(t *testing.T)</a>

```
searchKey: bytes_test.TestCompareIdenticalSlice
```

```Go
func TestCompareIdenticalSlice(t *testing.T)
```

### <a id="TestCompareBytes" href="#TestCompareBytes">func TestCompareBytes(t *testing.T)</a>

```
searchKey: bytes_test.TestCompareBytes
```

```Go
func TestCompareBytes(t *testing.T)
```

### <a id="TestEndianBaseCompare" href="#TestEndianBaseCompare">func TestEndianBaseCompare(t *testing.T)</a>

```
searchKey: bytes_test.TestEndianBaseCompare
```

```Go
func TestEndianBaseCompare(t *testing.T)
```

### <a id="BenchmarkCompareBytesEqual" href="#BenchmarkCompareBytesEqual">func BenchmarkCompareBytesEqual(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkCompareBytesEqual
```

```Go
func BenchmarkCompareBytesEqual(b *testing.B)
```

### <a id="BenchmarkCompareBytesToNil" href="#BenchmarkCompareBytesToNil">func BenchmarkCompareBytesToNil(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkCompareBytesToNil
```

```Go
func BenchmarkCompareBytesToNil(b *testing.B)
```

### <a id="BenchmarkCompareBytesEmpty" href="#BenchmarkCompareBytesEmpty">func BenchmarkCompareBytesEmpty(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkCompareBytesEmpty
```

```Go
func BenchmarkCompareBytesEmpty(b *testing.B)
```

### <a id="BenchmarkCompareBytesIdentical" href="#BenchmarkCompareBytesIdentical">func BenchmarkCompareBytesIdentical(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkCompareBytesIdentical
```

```Go
func BenchmarkCompareBytesIdentical(b *testing.B)
```

### <a id="BenchmarkCompareBytesSameLength" href="#BenchmarkCompareBytesSameLength">func BenchmarkCompareBytesSameLength(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkCompareBytesSameLength
```

```Go
func BenchmarkCompareBytesSameLength(b *testing.B)
```

### <a id="BenchmarkCompareBytesDifferentLength" href="#BenchmarkCompareBytesDifferentLength">func BenchmarkCompareBytesDifferentLength(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkCompareBytesDifferentLength
```

```Go
func BenchmarkCompareBytesDifferentLength(b *testing.B)
```

### <a id="BenchmarkCompareBytesBigUnaligned" href="#BenchmarkCompareBytesBigUnaligned">func BenchmarkCompareBytesBigUnaligned(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkCompareBytesBigUnaligned
```

```Go
func BenchmarkCompareBytesBigUnaligned(b *testing.B)
```

### <a id="BenchmarkCompareBytesBig" href="#BenchmarkCompareBytesBig">func BenchmarkCompareBytesBig(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkCompareBytesBig
```

```Go
func BenchmarkCompareBytesBig(b *testing.B)
```

### <a id="BenchmarkCompareBytesBigIdentical" href="#BenchmarkCompareBytesBigIdentical">func BenchmarkCompareBytesBigIdentical(b *testing.B)</a>

```
searchKey: bytes_test.BenchmarkCompareBytesBigIdentical
```

```Go
func BenchmarkCompareBytesBigIdentical(b *testing.B)
```

### <a id="ExampleBuffer" href="#ExampleBuffer">func ExampleBuffer()</a>

```
searchKey: bytes_test.ExampleBuffer
```

```Go
func ExampleBuffer()
```

### <a id="ExampleBuffer_reader" href="#ExampleBuffer_reader">func ExampleBuffer_reader()</a>

```
searchKey: bytes_test.ExampleBuffer_reader
```

```Go
func ExampleBuffer_reader()
```

### <a id="ExampleBuffer_Bytes" href="#ExampleBuffer_Bytes">func ExampleBuffer_Bytes()</a>

```
searchKey: bytes_test.ExampleBuffer_Bytes
```

```Go
func ExampleBuffer_Bytes()
```

### <a id="ExampleBuffer_Grow" href="#ExampleBuffer_Grow">func ExampleBuffer_Grow()</a>

```
searchKey: bytes_test.ExampleBuffer_Grow
```

```Go
func ExampleBuffer_Grow()
```

### <a id="ExampleBuffer_Len" href="#ExampleBuffer_Len">func ExampleBuffer_Len()</a>

```
searchKey: bytes_test.ExampleBuffer_Len
```

```Go
func ExampleBuffer_Len()
```

### <a id="ExampleCompare" href="#ExampleCompare">func ExampleCompare()</a>

```
searchKey: bytes_test.ExampleCompare
```

```Go
func ExampleCompare()
```

### <a id="ExampleCompare_search" href="#ExampleCompare_search">func ExampleCompare_search()</a>

```
searchKey: bytes_test.ExampleCompare_search
```

```Go
func ExampleCompare_search()
```

### <a id="ExampleTrimSuffix" href="#ExampleTrimSuffix">func ExampleTrimSuffix()</a>

```
searchKey: bytes_test.ExampleTrimSuffix
```

```Go
func ExampleTrimSuffix()
```

### <a id="ExampleTrimPrefix" href="#ExampleTrimPrefix">func ExampleTrimPrefix()</a>

```
searchKey: bytes_test.ExampleTrimPrefix
```

```Go
func ExampleTrimPrefix()
```

### <a id="ExampleFields" href="#ExampleFields">func ExampleFields()</a>

```
searchKey: bytes_test.ExampleFields
```

```Go
func ExampleFields()
```

### <a id="ExampleFieldsFunc" href="#ExampleFieldsFunc">func ExampleFieldsFunc()</a>

```
searchKey: bytes_test.ExampleFieldsFunc
```

```Go
func ExampleFieldsFunc()
```

### <a id="ExampleContains" href="#ExampleContains">func ExampleContains()</a>

```
searchKey: bytes_test.ExampleContains
```

```Go
func ExampleContains()
```

### <a id="ExampleContainsAny" href="#ExampleContainsAny">func ExampleContainsAny()</a>

```
searchKey: bytes_test.ExampleContainsAny
```

```Go
func ExampleContainsAny()
```

### <a id="ExampleContainsRune" href="#ExampleContainsRune">func ExampleContainsRune()</a>

```
searchKey: bytes_test.ExampleContainsRune
```

```Go
func ExampleContainsRune()
```

### <a id="ExampleCount" href="#ExampleCount">func ExampleCount()</a>

```
searchKey: bytes_test.ExampleCount
```

```Go
func ExampleCount()
```

### <a id="ExampleEqual" href="#ExampleEqual">func ExampleEqual()</a>

```
searchKey: bytes_test.ExampleEqual
```

```Go
func ExampleEqual()
```

### <a id="ExampleEqualFold" href="#ExampleEqualFold">func ExampleEqualFold()</a>

```
searchKey: bytes_test.ExampleEqualFold
```

```Go
func ExampleEqualFold()
```

### <a id="ExampleHasPrefix" href="#ExampleHasPrefix">func ExampleHasPrefix()</a>

```
searchKey: bytes_test.ExampleHasPrefix
```

```Go
func ExampleHasPrefix()
```

### <a id="ExampleHasSuffix" href="#ExampleHasSuffix">func ExampleHasSuffix()</a>

```
searchKey: bytes_test.ExampleHasSuffix
```

```Go
func ExampleHasSuffix()
```

### <a id="ExampleIndex" href="#ExampleIndex">func ExampleIndex()</a>

```
searchKey: bytes_test.ExampleIndex
```

```Go
func ExampleIndex()
```

### <a id="ExampleIndexByte" href="#ExampleIndexByte">func ExampleIndexByte()</a>

```
searchKey: bytes_test.ExampleIndexByte
```

```Go
func ExampleIndexByte()
```

### <a id="ExampleIndexFunc" href="#ExampleIndexFunc">func ExampleIndexFunc()</a>

```
searchKey: bytes_test.ExampleIndexFunc
```

```Go
func ExampleIndexFunc()
```

### <a id="ExampleIndexAny" href="#ExampleIndexAny">func ExampleIndexAny()</a>

```
searchKey: bytes_test.ExampleIndexAny
```

```Go
func ExampleIndexAny()
```

### <a id="ExampleIndexRune" href="#ExampleIndexRune">func ExampleIndexRune()</a>

```
searchKey: bytes_test.ExampleIndexRune
```

```Go
func ExampleIndexRune()
```

### <a id="ExampleLastIndex" href="#ExampleLastIndex">func ExampleLastIndex()</a>

```
searchKey: bytes_test.ExampleLastIndex
```

```Go
func ExampleLastIndex()
```

### <a id="ExampleLastIndexAny" href="#ExampleLastIndexAny">func ExampleLastIndexAny()</a>

```
searchKey: bytes_test.ExampleLastIndexAny
```

```Go
func ExampleLastIndexAny()
```

### <a id="ExampleLastIndexByte" href="#ExampleLastIndexByte">func ExampleLastIndexByte()</a>

```
searchKey: bytes_test.ExampleLastIndexByte
```

```Go
func ExampleLastIndexByte()
```

### <a id="ExampleLastIndexFunc" href="#ExampleLastIndexFunc">func ExampleLastIndexFunc()</a>

```
searchKey: bytes_test.ExampleLastIndexFunc
```

```Go
func ExampleLastIndexFunc()
```

### <a id="ExampleJoin" href="#ExampleJoin">func ExampleJoin()</a>

```
searchKey: bytes_test.ExampleJoin
```

```Go
func ExampleJoin()
```

### <a id="ExampleRepeat" href="#ExampleRepeat">func ExampleRepeat()</a>

```
searchKey: bytes_test.ExampleRepeat
```

```Go
func ExampleRepeat()
```

### <a id="ExampleReplace" href="#ExampleReplace">func ExampleReplace()</a>

```
searchKey: bytes_test.ExampleReplace
```

```Go
func ExampleReplace()
```

### <a id="ExampleReplaceAll" href="#ExampleReplaceAll">func ExampleReplaceAll()</a>

```
searchKey: bytes_test.ExampleReplaceAll
```

```Go
func ExampleReplaceAll()
```

### <a id="ExampleRunes" href="#ExampleRunes">func ExampleRunes()</a>

```
searchKey: bytes_test.ExampleRunes
```

```Go
func ExampleRunes()
```

### <a id="ExampleSplit" href="#ExampleSplit">func ExampleSplit()</a>

```
searchKey: bytes_test.ExampleSplit
```

```Go
func ExampleSplit()
```

### <a id="ExampleSplitN" href="#ExampleSplitN">func ExampleSplitN()</a>

```
searchKey: bytes_test.ExampleSplitN
```

```Go
func ExampleSplitN()
```

### <a id="ExampleSplitAfter" href="#ExampleSplitAfter">func ExampleSplitAfter()</a>

```
searchKey: bytes_test.ExampleSplitAfter
```

```Go
func ExampleSplitAfter()
```

### <a id="ExampleSplitAfterN" href="#ExampleSplitAfterN">func ExampleSplitAfterN()</a>

```
searchKey: bytes_test.ExampleSplitAfterN
```

```Go
func ExampleSplitAfterN()
```

### <a id="ExampleTitle" href="#ExampleTitle">func ExampleTitle()</a>

```
searchKey: bytes_test.ExampleTitle
```

```Go
func ExampleTitle()
```

### <a id="ExampleToTitle" href="#ExampleToTitle">func ExampleToTitle()</a>

```
searchKey: bytes_test.ExampleToTitle
```

```Go
func ExampleToTitle()
```

### <a id="ExampleToTitleSpecial" href="#ExampleToTitleSpecial">func ExampleToTitleSpecial()</a>

```
searchKey: bytes_test.ExampleToTitleSpecial
```

```Go
func ExampleToTitleSpecial()
```

### <a id="ExampleTrim" href="#ExampleTrim">func ExampleTrim()</a>

```
searchKey: bytes_test.ExampleTrim
```

```Go
func ExampleTrim()
```

### <a id="ExampleTrimFunc" href="#ExampleTrimFunc">func ExampleTrimFunc()</a>

```
searchKey: bytes_test.ExampleTrimFunc
```

```Go
func ExampleTrimFunc()
```

### <a id="ExampleMap" href="#ExampleMap">func ExampleMap()</a>

```
searchKey: bytes_test.ExampleMap
```

```Go
func ExampleMap()
```

### <a id="ExampleTrimLeft" href="#ExampleTrimLeft">func ExampleTrimLeft()</a>

```
searchKey: bytes_test.ExampleTrimLeft
```

```Go
func ExampleTrimLeft()
```

### <a id="ExampleTrimLeftFunc" href="#ExampleTrimLeftFunc">func ExampleTrimLeftFunc()</a>

```
searchKey: bytes_test.ExampleTrimLeftFunc
```

```Go
func ExampleTrimLeftFunc()
```

### <a id="ExampleTrimSpace" href="#ExampleTrimSpace">func ExampleTrimSpace()</a>

```
searchKey: bytes_test.ExampleTrimSpace
```

```Go
func ExampleTrimSpace()
```

### <a id="ExampleTrimRight" href="#ExampleTrimRight">func ExampleTrimRight()</a>

```
searchKey: bytes_test.ExampleTrimRight
```

```Go
func ExampleTrimRight()
```

### <a id="ExampleTrimRightFunc" href="#ExampleTrimRightFunc">func ExampleTrimRightFunc()</a>

```
searchKey: bytes_test.ExampleTrimRightFunc
```

```Go
func ExampleTrimRightFunc()
```

### <a id="ExampleToUpper" href="#ExampleToUpper">func ExampleToUpper()</a>

```
searchKey: bytes_test.ExampleToUpper
```

```Go
func ExampleToUpper()
```

### <a id="ExampleToUpperSpecial" href="#ExampleToUpperSpecial">func ExampleToUpperSpecial()</a>

```
searchKey: bytes_test.ExampleToUpperSpecial
```

```Go
func ExampleToUpperSpecial()
```

### <a id="ExampleToLower" href="#ExampleToLower">func ExampleToLower()</a>

```
searchKey: bytes_test.ExampleToLower
```

```Go
func ExampleToLower()
```

### <a id="ExampleToLowerSpecial" href="#ExampleToLowerSpecial">func ExampleToLowerSpecial()</a>

```
searchKey: bytes_test.ExampleToLowerSpecial
```

```Go
func ExampleToLowerSpecial()
```

### <a id="ExampleReader_Len" href="#ExampleReader_Len">func ExampleReader_Len()</a>

```
searchKey: bytes_test.ExampleReader_Len
```

```Go
func ExampleReader_Len()
```

### <a id="TestReader" href="#TestReader">func TestReader(t *testing.T)</a>

```
searchKey: bytes_test.TestReader
```

```Go
func TestReader(t *testing.T)
```

### <a id="TestReadAfterBigSeek" href="#TestReadAfterBigSeek">func TestReadAfterBigSeek(t *testing.T)</a>

```
searchKey: bytes_test.TestReadAfterBigSeek
```

```Go
func TestReadAfterBigSeek(t *testing.T)
```

### <a id="TestReaderAt" href="#TestReaderAt">func TestReaderAt(t *testing.T)</a>

```
searchKey: bytes_test.TestReaderAt
```

```Go
func TestReaderAt(t *testing.T)
```

### <a id="TestReaderAtConcurrent" href="#TestReaderAtConcurrent">func TestReaderAtConcurrent(t *testing.T)</a>

```
searchKey: bytes_test.TestReaderAtConcurrent
```

```Go
func TestReaderAtConcurrent(t *testing.T)
```

### <a id="TestEmptyReaderConcurrent" href="#TestEmptyReaderConcurrent">func TestEmptyReaderConcurrent(t *testing.T)</a>

```
searchKey: bytes_test.TestEmptyReaderConcurrent
```

```Go
func TestEmptyReaderConcurrent(t *testing.T)
```

### <a id="TestReaderWriteTo" href="#TestReaderWriteTo">func TestReaderWriteTo(t *testing.T)</a>

```
searchKey: bytes_test.TestReaderWriteTo
```

```Go
func TestReaderWriteTo(t *testing.T)
```

### <a id="TestReaderLen" href="#TestReaderLen">func TestReaderLen(t *testing.T)</a>

```
searchKey: bytes_test.TestReaderLen
```

```Go
func TestReaderLen(t *testing.T)
```

### <a id="TestUnreadRuneError" href="#TestUnreadRuneError">func TestUnreadRuneError(t *testing.T)</a>

```
searchKey: bytes_test.TestUnreadRuneError
```

```Go
func TestUnreadRuneError(t *testing.T)
```

### <a id="TestReaderDoubleUnreadRune" href="#TestReaderDoubleUnreadRune">func TestReaderDoubleUnreadRune(t *testing.T)</a>

```
searchKey: bytes_test.TestReaderDoubleUnreadRune
```

```Go
func TestReaderDoubleUnreadRune(t *testing.T)
```

### <a id="TestReaderCopyNothing" href="#TestReaderCopyNothing">func TestReaderCopyNothing(t *testing.T)</a>

```
searchKey: bytes_test.TestReaderCopyNothing
```

```Go
func TestReaderCopyNothing(t *testing.T)
```

verify that copying from an empty reader always has the same results, regardless of the presence of a WriteTo method. 

### <a id="TestReaderLenSize" href="#TestReaderLenSize">func TestReaderLenSize(t *testing.T)</a>

```
searchKey: bytes_test.TestReaderLenSize
```

```Go
func TestReaderLenSize(t *testing.T)
```

tests that Len is affected by reads, but Size is not. 

### <a id="TestReaderReset" href="#TestReaderReset">func TestReaderReset(t *testing.T)</a>

```
searchKey: bytes_test.TestReaderReset
```

```Go
func TestReaderReset(t *testing.T)
```

### <a id="TestReaderZero" href="#TestReaderZero">func TestReaderZero(t *testing.T)</a>

```
searchKey: bytes_test.TestReaderZero
```

```Go
func TestReaderZero(t *testing.T)
```

