# Package strings_test

## Index

* [Constants](#const)
    * [const benchmarkString](#benchmarkString)
    * [const space](#space)
* [Variables](#var)
    * [var someBytes](#someBytes)
    * [var sinkS](#sinkS)
    * [var compareTests](#compareTests)
    * [var htmlEscaper](#htmlEscaper)
    * [var htmlUnescaper](#htmlUnescaper)
    * [var capitalLetters](#capitalLetters)
    * [var algorithmTestCases](#algorithmTestCases)
    * [var mapdata](#mapdata)
    * [var abcd](#abcd)
    * [var faces](#faces)
    * [var commas](#commas)
    * [var dots](#dots)
    * [var indexTests](#indexTests)
    * [var lastIndexTests](#lastIndexTests)
    * [var indexAnyTests](#indexAnyTests)
    * [var lastIndexAnyTests](#lastIndexAnyTests)
    * [var benchmarkLongString](#benchmarkLongString)
    * [var splittests](#splittests)
    * [var splitaftertests](#splitaftertests)
    * [var fieldstests](#fieldstests)
    * [var FieldsFuncTests](#FieldsFuncTests)
    * [var upperTests](#upperTests)
    * [var lowerTests](#lowerTests)
    * [var trimSpaceTests](#trimSpaceTests)
    * [var toValidUTF8Tests](#toValidUTF8Tests)
    * [var trimTests](#trimTests)
    * [var isSpace](#isSpace)
    * [var isDigit](#isDigit)
    * [var isUpper](#isUpper)
    * [var isValidRune](#isValidRune)
    * [var trimFuncTests](#trimFuncTests)
    * [var indexFuncTests](#indexFuncTests)
    * [var RepeatTests](#RepeatTests)
    * [var RunesTests](#RunesTests)
    * [var UnreadRuneErrorTests](#UnreadRuneErrorTests)
    * [var ReplaceTests](#ReplaceTests)
    * [var TitleTests](#TitleTests)
    * [var ContainsTests](#ContainsTests)
    * [var ContainsAnyTests](#ContainsAnyTests)
    * [var ContainsRuneTests](#ContainsRuneTests)
    * [var EqualFoldTests](#EqualFoldTests)
    * [var CountTests](#CountTests)
    * [var benchInputHard](#benchInputHard)
    * [var benchInputTorture](#benchInputTorture)
    * [var benchNeedleTorture](#benchNeedleTorture)
    * [var makeFieldsInput](#makeFieldsInput)
    * [var makeFieldsInputASCII](#makeFieldsInputASCII)
    * [var stringdata](#stringdata)
    * [var stringSink](#stringSink)
* [Types](#type)
    * [type errWriter struct{}](#errWriter)
        * [func (errWriter) Write(p []byte) (n int, err error)](#errWriter.Write)
    * [type IndexTest struct](#IndexTest)
    * [type SplitTest struct](#SplitTest)
    * [type FieldsTest struct](#FieldsTest)
    * [type StringTest struct](#StringTest)
    * [type predicate struct](#predicate)
        * [func not(p predicate) predicate](#not)
* [Functions](#func)
    * [func check(t *testing.T, b *Builder, want string)](#check)
    * [func TestBuilder(t *testing.T)](#TestBuilder)
    * [func TestBuilderString(t *testing.T)](#TestBuilderString)
    * [func TestBuilderReset(t *testing.T)](#TestBuilderReset)
    * [func TestBuilderGrow(t *testing.T)](#TestBuilderGrow)
    * [func TestBuilderWrite2(t *testing.T)](#TestBuilderWrite2)
    * [func TestBuilderWriteByte(t *testing.T)](#TestBuilderWriteByte)
    * [func TestBuilderAllocs(t *testing.T)](#TestBuilderAllocs)
    * [func TestBuilderCopyPanic(t *testing.T)](#TestBuilderCopyPanic)
    * [func TestBuilderWriteInvalidRune(t *testing.T)](#TestBuilderWriteInvalidRune)
    * [func benchmarkBuilder(b *testing.B, f func(b *testing.B, numWrite int, grow bool))](#benchmarkBuilder)
    * [func BenchmarkBuildString_Builder(b *testing.B)](#BenchmarkBuildString_Builder)
    * [func BenchmarkBuildString_ByteBuffer(b *testing.B)](#BenchmarkBuildString_ByteBuffer)
    * [func TestCompare(t *testing.T)](#TestCompare)
    * [func TestCompareIdenticalString(t *testing.T)](#TestCompareIdenticalString)
    * [func TestCompareStrings(t *testing.T)](#TestCompareStrings)
    * [func ExampleFields()](#ExampleFields)
    * [func ExampleFieldsFunc()](#ExampleFieldsFunc)
    * [func ExampleCompare()](#ExampleCompare)
    * [func ExampleContains()](#ExampleContains)
    * [func ExampleContainsAny()](#ExampleContainsAny)
    * [func ExampleContainsRune()](#ExampleContainsRune)
    * [func ExampleCount()](#ExampleCount)
    * [func ExampleEqualFold()](#ExampleEqualFold)
    * [func ExampleHasPrefix()](#ExampleHasPrefix)
    * [func ExampleHasSuffix()](#ExampleHasSuffix)
    * [func ExampleIndex()](#ExampleIndex)
    * [func ExampleIndexFunc()](#ExampleIndexFunc)
    * [func ExampleIndexAny()](#ExampleIndexAny)
    * [func ExampleIndexByte()](#ExampleIndexByte)
    * [func ExampleIndexRune()](#ExampleIndexRune)
    * [func ExampleLastIndex()](#ExampleLastIndex)
    * [func ExampleLastIndexAny()](#ExampleLastIndexAny)
    * [func ExampleLastIndexByte()](#ExampleLastIndexByte)
    * [func ExampleLastIndexFunc()](#ExampleLastIndexFunc)
    * [func ExampleJoin()](#ExampleJoin)
    * [func ExampleRepeat()](#ExampleRepeat)
    * [func ExampleReplace()](#ExampleReplace)
    * [func ExampleReplaceAll()](#ExampleReplaceAll)
    * [func ExampleSplit()](#ExampleSplit)
    * [func ExampleSplitN()](#ExampleSplitN)
    * [func ExampleSplitAfter()](#ExampleSplitAfter)
    * [func ExampleSplitAfterN()](#ExampleSplitAfterN)
    * [func ExampleTitle()](#ExampleTitle)
    * [func ExampleToTitle()](#ExampleToTitle)
    * [func ExampleToTitleSpecial()](#ExampleToTitleSpecial)
    * [func ExampleMap()](#ExampleMap)
    * [func ExampleNewReplacer()](#ExampleNewReplacer)
    * [func ExampleToUpper()](#ExampleToUpper)
    * [func ExampleToUpperSpecial()](#ExampleToUpperSpecial)
    * [func ExampleToLower()](#ExampleToLower)
    * [func ExampleToLowerSpecial()](#ExampleToLowerSpecial)
    * [func ExampleTrim()](#ExampleTrim)
    * [func ExampleTrimSpace()](#ExampleTrimSpace)
    * [func ExampleTrimPrefix()](#ExampleTrimPrefix)
    * [func ExampleTrimSuffix()](#ExampleTrimSuffix)
    * [func ExampleTrimFunc()](#ExampleTrimFunc)
    * [func ExampleTrimLeft()](#ExampleTrimLeft)
    * [func ExampleTrimLeftFunc()](#ExampleTrimLeftFunc)
    * [func ExampleTrimRight()](#ExampleTrimRight)
    * [func ExampleTrimRightFunc()](#ExampleTrimRightFunc)
    * [func ExampleBuilder()](#ExampleBuilder)
    * [func TestReader(t *testing.T)](#TestReader)
    * [func TestReadAfterBigSeek(t *testing.T)](#TestReadAfterBigSeek)
    * [func TestReaderAt(t *testing.T)](#TestReaderAt)
    * [func TestReaderAtConcurrent(t *testing.T)](#TestReaderAtConcurrent)
    * [func TestEmptyReaderConcurrent(t *testing.T)](#TestEmptyReaderConcurrent)
    * [func TestWriteTo(t *testing.T)](#TestWriteTo)
    * [func TestReaderLenSize(t *testing.T)](#TestReaderLenSize)
    * [func TestReaderReset(t *testing.T)](#TestReaderReset)
    * [func TestReaderZero(t *testing.T)](#TestReaderZero)
    * [func oldHTMLEscape(s string) string](#oldHTMLEscape)
    * [func TestReplacer(t *testing.T)](#TestReplacer)
    * [func TestPickAlgorithm(t *testing.T)](#TestPickAlgorithm)
    * [func TestWriteStringError(t *testing.T)](#TestWriteStringError)
    * [func TestGenericTrieBuilding(t *testing.T)](#TestGenericTrieBuilding)
    * [func BenchmarkGenericNoMatch(b *testing.B)](#BenchmarkGenericNoMatch)
    * [func BenchmarkGenericMatch1(b *testing.B)](#BenchmarkGenericMatch1)
    * [func BenchmarkGenericMatch2(b *testing.B)](#BenchmarkGenericMatch2)
    * [func benchmarkSingleString(b *testing.B, pattern, text string)](#benchmarkSingleString)
    * [func BenchmarkSingleMaxSkipping(b *testing.B)](#BenchmarkSingleMaxSkipping)
    * [func BenchmarkSingleLongSuffixFail(b *testing.B)](#BenchmarkSingleLongSuffixFail)
    * [func BenchmarkSingleMatch(b *testing.B)](#BenchmarkSingleMatch)
    * [func BenchmarkByteByteNoMatch(b *testing.B)](#BenchmarkByteByteNoMatch)
    * [func BenchmarkByteByteMatch(b *testing.B)](#BenchmarkByteByteMatch)
    * [func BenchmarkByteStringMatch(b *testing.B)](#BenchmarkByteStringMatch)
    * [func BenchmarkHTMLEscapeNew(b *testing.B)](#BenchmarkHTMLEscapeNew)
    * [func BenchmarkHTMLEscapeOld(b *testing.B)](#BenchmarkHTMLEscapeOld)
    * [func BenchmarkByteStringReplacerWriteString(b *testing.B)](#BenchmarkByteStringReplacerWriteString)
    * [func BenchmarkByteReplacerWriteString(b *testing.B)](#BenchmarkByteReplacerWriteString)
    * [func BenchmarkByteByteReplaces(b *testing.B)](#BenchmarkByteByteReplaces)
    * [func BenchmarkByteByteMap(b *testing.B)](#BenchmarkByteByteMap)
    * [func BenchmarkMap(b *testing.B)](#BenchmarkMap)
    * [func TestFinderNext(t *testing.T)](#TestFinderNext)
    * [func TestFinderCreation(t *testing.T)](#TestFinderCreation)
    * [func eq(a, b []string) bool](#eq)
    * [func runIndexTests(t *testing.T, f func(s, sep string) int, funcName string, testCases []IndexTest)](#runIndexTests)
    * [func TestIndex(t *testing.T)](#TestIndex)
    * [func TestLastIndex(t *testing.T)](#TestLastIndex)
    * [func TestIndexAny(t *testing.T)](#TestIndexAny)
    * [func TestLastIndexAny(t *testing.T)](#TestLastIndexAny)
    * [func TestIndexByte(t *testing.T)](#TestIndexByte)
    * [func TestLastIndexByte(t *testing.T)](#TestLastIndexByte)
    * [func simpleIndex(s, sep string) int](#simpleIndex)
    * [func TestIndexRandom(t *testing.T)](#TestIndexRandom)
    * [func TestIndexRune(t *testing.T)](#TestIndexRune)
    * [func BenchmarkIndexRune(b *testing.B)](#BenchmarkIndexRune)
    * [func BenchmarkIndexRuneLongString(b *testing.B)](#BenchmarkIndexRuneLongString)
    * [func BenchmarkIndexRuneFastPath(b *testing.B)](#BenchmarkIndexRuneFastPath)
    * [func BenchmarkIndex(b *testing.B)](#BenchmarkIndex)
    * [func BenchmarkLastIndex(b *testing.B)](#BenchmarkLastIndex)
    * [func BenchmarkIndexByte(b *testing.B)](#BenchmarkIndexByte)
    * [func TestSplit(t *testing.T)](#TestSplit)
    * [func TestSplitAfter(t *testing.T)](#TestSplitAfter)
    * [func TestFields(t *testing.T)](#TestFields)
    * [func TestFieldsFunc(t *testing.T)](#TestFieldsFunc)
    * [func runStringTests(t *testing.T, f func(string) string, funcName string, testCases []StringTest)](#runStringTests)
    * [func tenRunes(ch rune) string](#tenRunes)
    * [func rot13(r rune) rune](#rot13)
    * [func TestMap(t *testing.T)](#TestMap)
    * [func TestToUpper(t *testing.T)](#TestToUpper)
    * [func TestToLower(t *testing.T)](#TestToLower)
    * [func TestToValidUTF8(t *testing.T)](#TestToValidUTF8)
    * [func BenchmarkToUpper(b *testing.B)](#BenchmarkToUpper)
    * [func BenchmarkToLower(b *testing.B)](#BenchmarkToLower)
    * [func BenchmarkMapNoChanges(b *testing.B)](#BenchmarkMapNoChanges)
    * [func TestSpecialCase(t *testing.T)](#TestSpecialCase)
    * [func TestTrimSpace(t *testing.T)](#TestTrimSpace)
    * [func TestTrim(t *testing.T)](#TestTrim)
    * [func BenchmarkTrim(b *testing.B)](#BenchmarkTrim)
    * [func BenchmarkToValidUTF8(b *testing.B)](#BenchmarkToValidUTF8)
    * [func TestTrimFunc(t *testing.T)](#TestTrimFunc)
    * [func TestIndexFunc(t *testing.T)](#TestIndexFunc)
    * [func equal(m string, s1, s2 string, t *testing.T) bool](#equal)
    * [func TestCaseConsistency(t *testing.T)](#TestCaseConsistency)
    * [func TestRepeat(t *testing.T)](#TestRepeat)
    * [func repeat(s string, count int) (err error)](#repeat)
    * [func TestRepeatCatchesOverflow(t *testing.T)](#TestRepeatCatchesOverflow)
    * [func runesEqual(a, b []rune) bool](#runesEqual)
    * [func TestRunes(t *testing.T)](#TestRunes)
    * [func TestReadByte(t *testing.T)](#TestReadByte)
    * [func TestReadRune(t *testing.T)](#TestReadRune)
    * [func TestUnreadRuneError(t *testing.T)](#TestUnreadRuneError)
    * [func TestReplace(t *testing.T)](#TestReplace)
    * [func TestTitle(t *testing.T)](#TestTitle)
    * [func TestContains(t *testing.T)](#TestContains)
    * [func TestContainsAny(t *testing.T)](#TestContainsAny)
    * [func TestContainsRune(t *testing.T)](#TestContainsRune)
    * [func TestEqualFold(t *testing.T)](#TestEqualFold)
    * [func BenchmarkEqualFold(b *testing.B)](#BenchmarkEqualFold)
    * [func TestCount(t *testing.T)](#TestCount)
    * [func makeBenchInputHard() string](#makeBenchInputHard)
    * [func benchmarkIndexHard(b *testing.B, sep string)](#benchmarkIndexHard)
    * [func benchmarkLastIndexHard(b *testing.B, sep string)](#benchmarkLastIndexHard)
    * [func benchmarkCountHard(b *testing.B, sep string)](#benchmarkCountHard)
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
    * [func BenchmarkIndexTorture(b *testing.B)](#BenchmarkIndexTorture)
    * [func BenchmarkCountTorture(b *testing.B)](#BenchmarkCountTorture)
    * [func BenchmarkCountTortureOverlapping(b *testing.B)](#BenchmarkCountTortureOverlapping)
    * [func BenchmarkCountByte(b *testing.B)](#BenchmarkCountByte)
    * [func BenchmarkFields(b *testing.B)](#BenchmarkFields)
    * [func BenchmarkFieldsFunc(b *testing.B)](#BenchmarkFieldsFunc)
    * [func BenchmarkSplitEmptySeparator(b *testing.B)](#BenchmarkSplitEmptySeparator)
    * [func BenchmarkSplitSingleByteSeparator(b *testing.B)](#BenchmarkSplitSingleByteSeparator)
    * [func BenchmarkSplitMultiByteSeparator(b *testing.B)](#BenchmarkSplitMultiByteSeparator)
    * [func BenchmarkSplitNSingleByteSeparator(b *testing.B)](#BenchmarkSplitNSingleByteSeparator)
    * [func BenchmarkSplitNMultiByteSeparator(b *testing.B)](#BenchmarkSplitNMultiByteSeparator)
    * [func BenchmarkRepeat(b *testing.B)](#BenchmarkRepeat)
    * [func BenchmarkIndexAnyASCII(b *testing.B)](#BenchmarkIndexAnyASCII)
    * [func BenchmarkIndexAnyUTF8(b *testing.B)](#BenchmarkIndexAnyUTF8)
    * [func BenchmarkLastIndexAnyASCII(b *testing.B)](#BenchmarkLastIndexAnyASCII)
    * [func BenchmarkLastIndexAnyUTF8(b *testing.B)](#BenchmarkLastIndexAnyUTF8)
    * [func BenchmarkTrimASCII(b *testing.B)](#BenchmarkTrimASCII)
    * [func BenchmarkIndexPeriodic(b *testing.B)](#BenchmarkIndexPeriodic)
    * [func BenchmarkJoin(b *testing.B)](#BenchmarkJoin)
    * [func BenchmarkTrimSpace(b *testing.B)](#BenchmarkTrimSpace)
    * [func BenchmarkReplaceAll(b *testing.B)](#BenchmarkReplaceAll)


## <a id="const" href="#const">Constants</a>

### <a id="benchmarkString" href="#benchmarkString">const benchmarkString</a>

```
searchKey: strings_test.benchmarkString
```

```Go
const benchmarkString = "some_text=some☺value"
```

### <a id="space" href="#space">const space</a>

```
searchKey: strings_test.space
```

```Go
const space = "\t\v\r\f\n\u0085\u00a0\u2000\u3000"
```

## <a id="var" href="#var">Variables</a>

### <a id="someBytes" href="#someBytes">var someBytes</a>

```
searchKey: strings_test.someBytes
```

```Go
var someBytes = []byte("some bytes sdljlk jsklj3lkjlk djlkjw")
```

### <a id="sinkS" href="#sinkS">var sinkS</a>

```
searchKey: strings_test.sinkS
```

```Go
var sinkS string
```

### <a id="compareTests" href="#compareTests">var compareTests</a>

```
searchKey: strings_test.compareTests
```

```Go
var compareTests = ...
```

### <a id="htmlEscaper" href="#htmlEscaper">var htmlEscaper</a>

```
searchKey: strings_test.htmlEscaper
```

```Go
var htmlEscaper = ...
```

### <a id="htmlUnescaper" href="#htmlUnescaper">var htmlUnescaper</a>

```
searchKey: strings_test.htmlUnescaper
```

```Go
var htmlUnescaper = ...
```

### <a id="capitalLetters" href="#capitalLetters">var capitalLetters</a>

```
searchKey: strings_test.capitalLetters
```

```Go
var capitalLetters = NewReplacer("a", "A", "b", "B")
```

### <a id="algorithmTestCases" href="#algorithmTestCases">var algorithmTestCases</a>

```
searchKey: strings_test.algorithmTestCases
```

```Go
var algorithmTestCases = ...
```

### <a id="mapdata" href="#mapdata">var mapdata</a>

```
searchKey: strings_test.mapdata
```

```Go
var mapdata = ...
```

### <a id="abcd" href="#abcd">var abcd</a>

```
searchKey: strings_test.abcd
```

```Go
var abcd = "abcd"
```

### <a id="faces" href="#faces">var faces</a>

```
searchKey: strings_test.faces
```

```Go
var faces = "☺☻☹"
```

### <a id="commas" href="#commas">var commas</a>

```
searchKey: strings_test.commas
```

```Go
var commas = "1,2,3,4"
```

### <a id="dots" href="#dots">var dots</a>

```
searchKey: strings_test.dots
```

```Go
var dots = "1....2....3....4"
```

### <a id="indexTests" href="#indexTests">var indexTests</a>

```
searchKey: strings_test.indexTests
```

```Go
var indexTests = ...
```

### <a id="lastIndexTests" href="#lastIndexTests">var lastIndexTests</a>

```
searchKey: strings_test.lastIndexTests
```

```Go
var lastIndexTests = ...
```

### <a id="indexAnyTests" href="#indexAnyTests">var indexAnyTests</a>

```
searchKey: strings_test.indexAnyTests
```

```Go
var indexAnyTests = ...
```

### <a id="lastIndexAnyTests" href="#lastIndexAnyTests">var lastIndexAnyTests</a>

```
searchKey: strings_test.lastIndexAnyTests
```

```Go
var lastIndexAnyTests = ...
```

### <a id="benchmarkLongString" href="#benchmarkLongString">var benchmarkLongString</a>

```
searchKey: strings_test.benchmarkLongString
```

```Go
var benchmarkLongString = Repeat(" ", 100) + benchmarkString
```

### <a id="splittests" href="#splittests">var splittests</a>

```
searchKey: strings_test.splittests
```

```Go
var splittests = ...
```

### <a id="splitaftertests" href="#splitaftertests">var splitaftertests</a>

```
searchKey: strings_test.splitaftertests
```

```Go
var splitaftertests = ...
```

### <a id="fieldstests" href="#fieldstests">var fieldstests</a>

```
searchKey: strings_test.fieldstests
```

```Go
var fieldstests = ...
```

### <a id="FieldsFuncTests" href="#FieldsFuncTests">var FieldsFuncTests</a>

```
searchKey: strings_test.FieldsFuncTests
```

```Go
var FieldsFuncTests = ...
```

### <a id="upperTests" href="#upperTests">var upperTests</a>

```
searchKey: strings_test.upperTests
```

```Go
var upperTests = ...
```

### <a id="lowerTests" href="#lowerTests">var lowerTests</a>

```
searchKey: strings_test.lowerTests
```

```Go
var lowerTests = ...
```

### <a id="trimSpaceTests" href="#trimSpaceTests">var trimSpaceTests</a>

```
searchKey: strings_test.trimSpaceTests
```

```Go
var trimSpaceTests = ...
```

### <a id="toValidUTF8Tests" href="#toValidUTF8Tests">var toValidUTF8Tests</a>

```
searchKey: strings_test.toValidUTF8Tests
```

```Go
var toValidUTF8Tests = ...
```

### <a id="trimTests" href="#trimTests">var trimTests</a>

```
searchKey: strings_test.trimTests
```

```Go
var trimTests = ...
```

### <a id="isSpace" href="#isSpace">var isSpace</a>

```
searchKey: strings_test.isSpace
```

```Go
var isSpace = predicate{unicode.IsSpace, "IsSpace"}
```

### <a id="isDigit" href="#isDigit">var isDigit</a>

```
searchKey: strings_test.isDigit
```

```Go
var isDigit = predicate{unicode.IsDigit, "IsDigit"}
```

### <a id="isUpper" href="#isUpper">var isUpper</a>

```
searchKey: strings_test.isUpper
```

```Go
var isUpper = predicate{unicode.IsUpper, "IsUpper"}
```

### <a id="isValidRune" href="#isValidRune">var isValidRune</a>

```
searchKey: strings_test.isValidRune
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
searchKey: strings_test.trimFuncTests
```

```Go
var trimFuncTests = ...
```

### <a id="indexFuncTests" href="#indexFuncTests">var indexFuncTests</a>

```
searchKey: strings_test.indexFuncTests
```

```Go
var indexFuncTests = ...
```

### <a id="RepeatTests" href="#RepeatTests">var RepeatTests</a>

```
searchKey: strings_test.RepeatTests
```

```Go
var RepeatTests = ...
```

### <a id="RunesTests" href="#RunesTests">var RunesTests</a>

```
searchKey: strings_test.RunesTests
```

```Go
var RunesTests = ...
```

### <a id="UnreadRuneErrorTests" href="#UnreadRuneErrorTests">var UnreadRuneErrorTests</a>

```
searchKey: strings_test.UnreadRuneErrorTests
```

```Go
var UnreadRuneErrorTests = ...
```

### <a id="ReplaceTests" href="#ReplaceTests">var ReplaceTests</a>

```
searchKey: strings_test.ReplaceTests
```

```Go
var ReplaceTests = ...
```

### <a id="TitleTests" href="#TitleTests">var TitleTests</a>

```
searchKey: strings_test.TitleTests
```

```Go
var TitleTests = ...
```

### <a id="ContainsTests" href="#ContainsTests">var ContainsTests</a>

```
searchKey: strings_test.ContainsTests
```

```Go
var ContainsTests = ...
```

### <a id="ContainsAnyTests" href="#ContainsAnyTests">var ContainsAnyTests</a>

```
searchKey: strings_test.ContainsAnyTests
```

```Go
var ContainsAnyTests = ...
```

### <a id="ContainsRuneTests" href="#ContainsRuneTests">var ContainsRuneTests</a>

```
searchKey: strings_test.ContainsRuneTests
```

```Go
var ContainsRuneTests = ...
```

### <a id="EqualFoldTests" href="#EqualFoldTests">var EqualFoldTests</a>

```
searchKey: strings_test.EqualFoldTests
```

```Go
var EqualFoldTests = ...
```

### <a id="CountTests" href="#CountTests">var CountTests</a>

```
searchKey: strings_test.CountTests
```

```Go
var CountTests = ...
```

### <a id="benchInputHard" href="#benchInputHard">var benchInputHard</a>

```
searchKey: strings_test.benchInputHard
```

```Go
var benchInputHard = makeBenchInputHard()
```

### <a id="benchInputTorture" href="#benchInputTorture">var benchInputTorture</a>

```
searchKey: strings_test.benchInputTorture
```

```Go
var benchInputTorture = Repeat("ABC", 1<<10) + "123" + Repeat("ABC", 1<<10)
```

### <a id="benchNeedleTorture" href="#benchNeedleTorture">var benchNeedleTorture</a>

```
searchKey: strings_test.benchNeedleTorture
```

```Go
var benchNeedleTorture = Repeat("ABC", 1<<10+1)
```

### <a id="makeFieldsInput" href="#makeFieldsInput">var makeFieldsInput</a>

```
searchKey: strings_test.makeFieldsInput
```

```Go
var makeFieldsInput = ...
```

### <a id="makeFieldsInputASCII" href="#makeFieldsInputASCII">var makeFieldsInputASCII</a>

```
searchKey: strings_test.makeFieldsInputASCII
```

```Go
var makeFieldsInputASCII = ...
```

### <a id="stringdata" href="#stringdata">var stringdata</a>

```
searchKey: strings_test.stringdata
```

```Go
var stringdata = ...
```

### <a id="stringSink" href="#stringSink">var stringSink</a>

```
searchKey: strings_test.stringSink
```

```Go
var stringSink string
```

## <a id="type" href="#type">Types</a>

### <a id="errWriter" href="#errWriter">type errWriter struct{}</a>

```
searchKey: strings_test.errWriter
```

```Go
type errWriter struct{}
```

#### <a id="errWriter.Write" href="#errWriter.Write">func (errWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: strings_test.errWriter.Write
```

```Go
func (errWriter) Write(p []byte) (n int, err error)
```

### <a id="IndexTest" href="#IndexTest">type IndexTest struct</a>

```
searchKey: strings_test.IndexTest
```

```Go
type IndexTest struct {
	s   string
	sep string
	out int
}
```

### <a id="SplitTest" href="#SplitTest">type SplitTest struct</a>

```
searchKey: strings_test.SplitTest
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
searchKey: strings_test.FieldsTest
```

```Go
type FieldsTest struct {
	s string
	a []string
}
```

### <a id="StringTest" href="#StringTest">type StringTest struct</a>

```
searchKey: strings_test.StringTest
```

```Go
type StringTest struct {
	in, out string
}
```

Test case for any function which accepts and returns a single string. 

### <a id="predicate" href="#predicate">type predicate struct</a>

```
searchKey: strings_test.predicate
```

```Go
type predicate struct {
	f    func(rune) bool
	name string
}
```

#### <a id="not" href="#not">func not(p predicate) predicate</a>

```
searchKey: strings_test.not
```

```Go
func not(p predicate) predicate
```

## <a id="func" href="#func">Functions</a>

### <a id="check" href="#check">func check(t *testing.T, b *Builder, want string)</a>

```
searchKey: strings_test.check
```

```Go
func check(t *testing.T, b *Builder, want string)
```

### <a id="TestBuilder" href="#TestBuilder">func TestBuilder(t *testing.T)</a>

```
searchKey: strings_test.TestBuilder
```

```Go
func TestBuilder(t *testing.T)
```

### <a id="TestBuilderString" href="#TestBuilderString">func TestBuilderString(t *testing.T)</a>

```
searchKey: strings_test.TestBuilderString
```

```Go
func TestBuilderString(t *testing.T)
```

### <a id="TestBuilderReset" href="#TestBuilderReset">func TestBuilderReset(t *testing.T)</a>

```
searchKey: strings_test.TestBuilderReset
```

```Go
func TestBuilderReset(t *testing.T)
```

### <a id="TestBuilderGrow" href="#TestBuilderGrow">func TestBuilderGrow(t *testing.T)</a>

```
searchKey: strings_test.TestBuilderGrow
```

```Go
func TestBuilderGrow(t *testing.T)
```

### <a id="TestBuilderWrite2" href="#TestBuilderWrite2">func TestBuilderWrite2(t *testing.T)</a>

```
searchKey: strings_test.TestBuilderWrite2
```

```Go
func TestBuilderWrite2(t *testing.T)
```

### <a id="TestBuilderWriteByte" href="#TestBuilderWriteByte">func TestBuilderWriteByte(t *testing.T)</a>

```
searchKey: strings_test.TestBuilderWriteByte
```

```Go
func TestBuilderWriteByte(t *testing.T)
```

### <a id="TestBuilderAllocs" href="#TestBuilderAllocs">func TestBuilderAllocs(t *testing.T)</a>

```
searchKey: strings_test.TestBuilderAllocs
```

```Go
func TestBuilderAllocs(t *testing.T)
```

### <a id="TestBuilderCopyPanic" href="#TestBuilderCopyPanic">func TestBuilderCopyPanic(t *testing.T)</a>

```
searchKey: strings_test.TestBuilderCopyPanic
```

```Go
func TestBuilderCopyPanic(t *testing.T)
```

### <a id="TestBuilderWriteInvalidRune" href="#TestBuilderWriteInvalidRune">func TestBuilderWriteInvalidRune(t *testing.T)</a>

```
searchKey: strings_test.TestBuilderWriteInvalidRune
```

```Go
func TestBuilderWriteInvalidRune(t *testing.T)
```

### <a id="benchmarkBuilder" href="#benchmarkBuilder">func benchmarkBuilder(b *testing.B, f func(b *testing.B, numWrite int, grow bool))</a>

```
searchKey: strings_test.benchmarkBuilder
```

```Go
func benchmarkBuilder(b *testing.B, f func(b *testing.B, numWrite int, grow bool))
```

### <a id="BenchmarkBuildString_Builder" href="#BenchmarkBuildString_Builder">func BenchmarkBuildString_Builder(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkBuildString_Builder
```

```Go
func BenchmarkBuildString_Builder(b *testing.B)
```

### <a id="BenchmarkBuildString_ByteBuffer" href="#BenchmarkBuildString_ByteBuffer">func BenchmarkBuildString_ByteBuffer(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkBuildString_ByteBuffer
```

```Go
func BenchmarkBuildString_ByteBuffer(b *testing.B)
```

### <a id="TestCompare" href="#TestCompare">func TestCompare(t *testing.T)</a>

```
searchKey: strings_test.TestCompare
```

```Go
func TestCompare(t *testing.T)
```

### <a id="TestCompareIdenticalString" href="#TestCompareIdenticalString">func TestCompareIdenticalString(t *testing.T)</a>

```
searchKey: strings_test.TestCompareIdenticalString
```

```Go
func TestCompareIdenticalString(t *testing.T)
```

### <a id="TestCompareStrings" href="#TestCompareStrings">func TestCompareStrings(t *testing.T)</a>

```
searchKey: strings_test.TestCompareStrings
```

```Go
func TestCompareStrings(t *testing.T)
```

### <a id="ExampleFields" href="#ExampleFields">func ExampleFields()</a>

```
searchKey: strings_test.ExampleFields
```

```Go
func ExampleFields()
```

### <a id="ExampleFieldsFunc" href="#ExampleFieldsFunc">func ExampleFieldsFunc()</a>

```
searchKey: strings_test.ExampleFieldsFunc
```

```Go
func ExampleFieldsFunc()
```

### <a id="ExampleCompare" href="#ExampleCompare">func ExampleCompare()</a>

```
searchKey: strings_test.ExampleCompare
```

```Go
func ExampleCompare()
```

### <a id="ExampleContains" href="#ExampleContains">func ExampleContains()</a>

```
searchKey: strings_test.ExampleContains
```

```Go
func ExampleContains()
```

### <a id="ExampleContainsAny" href="#ExampleContainsAny">func ExampleContainsAny()</a>

```
searchKey: strings_test.ExampleContainsAny
```

```Go
func ExampleContainsAny()
```

### <a id="ExampleContainsRune" href="#ExampleContainsRune">func ExampleContainsRune()</a>

```
searchKey: strings_test.ExampleContainsRune
```

```Go
func ExampleContainsRune()
```

### <a id="ExampleCount" href="#ExampleCount">func ExampleCount()</a>

```
searchKey: strings_test.ExampleCount
```

```Go
func ExampleCount()
```

### <a id="ExampleEqualFold" href="#ExampleEqualFold">func ExampleEqualFold()</a>

```
searchKey: strings_test.ExampleEqualFold
```

```Go
func ExampleEqualFold()
```

### <a id="ExampleHasPrefix" href="#ExampleHasPrefix">func ExampleHasPrefix()</a>

```
searchKey: strings_test.ExampleHasPrefix
```

```Go
func ExampleHasPrefix()
```

### <a id="ExampleHasSuffix" href="#ExampleHasSuffix">func ExampleHasSuffix()</a>

```
searchKey: strings_test.ExampleHasSuffix
```

```Go
func ExampleHasSuffix()
```

### <a id="ExampleIndex" href="#ExampleIndex">func ExampleIndex()</a>

```
searchKey: strings_test.ExampleIndex
```

```Go
func ExampleIndex()
```

### <a id="ExampleIndexFunc" href="#ExampleIndexFunc">func ExampleIndexFunc()</a>

```
searchKey: strings_test.ExampleIndexFunc
```

```Go
func ExampleIndexFunc()
```

### <a id="ExampleIndexAny" href="#ExampleIndexAny">func ExampleIndexAny()</a>

```
searchKey: strings_test.ExampleIndexAny
```

```Go
func ExampleIndexAny()
```

### <a id="ExampleIndexByte" href="#ExampleIndexByte">func ExampleIndexByte()</a>

```
searchKey: strings_test.ExampleIndexByte
```

```Go
func ExampleIndexByte()
```

### <a id="ExampleIndexRune" href="#ExampleIndexRune">func ExampleIndexRune()</a>

```
searchKey: strings_test.ExampleIndexRune
```

```Go
func ExampleIndexRune()
```

### <a id="ExampleLastIndex" href="#ExampleLastIndex">func ExampleLastIndex()</a>

```
searchKey: strings_test.ExampleLastIndex
```

```Go
func ExampleLastIndex()
```

### <a id="ExampleLastIndexAny" href="#ExampleLastIndexAny">func ExampleLastIndexAny()</a>

```
searchKey: strings_test.ExampleLastIndexAny
```

```Go
func ExampleLastIndexAny()
```

### <a id="ExampleLastIndexByte" href="#ExampleLastIndexByte">func ExampleLastIndexByte()</a>

```
searchKey: strings_test.ExampleLastIndexByte
```

```Go
func ExampleLastIndexByte()
```

### <a id="ExampleLastIndexFunc" href="#ExampleLastIndexFunc">func ExampleLastIndexFunc()</a>

```
searchKey: strings_test.ExampleLastIndexFunc
```

```Go
func ExampleLastIndexFunc()
```

### <a id="ExampleJoin" href="#ExampleJoin">func ExampleJoin()</a>

```
searchKey: strings_test.ExampleJoin
```

```Go
func ExampleJoin()
```

### <a id="ExampleRepeat" href="#ExampleRepeat">func ExampleRepeat()</a>

```
searchKey: strings_test.ExampleRepeat
```

```Go
func ExampleRepeat()
```

### <a id="ExampleReplace" href="#ExampleReplace">func ExampleReplace()</a>

```
searchKey: strings_test.ExampleReplace
```

```Go
func ExampleReplace()
```

### <a id="ExampleReplaceAll" href="#ExampleReplaceAll">func ExampleReplaceAll()</a>

```
searchKey: strings_test.ExampleReplaceAll
```

```Go
func ExampleReplaceAll()
```

### <a id="ExampleSplit" href="#ExampleSplit">func ExampleSplit()</a>

```
searchKey: strings_test.ExampleSplit
```

```Go
func ExampleSplit()
```

### <a id="ExampleSplitN" href="#ExampleSplitN">func ExampleSplitN()</a>

```
searchKey: strings_test.ExampleSplitN
```

```Go
func ExampleSplitN()
```

### <a id="ExampleSplitAfter" href="#ExampleSplitAfter">func ExampleSplitAfter()</a>

```
searchKey: strings_test.ExampleSplitAfter
```

```Go
func ExampleSplitAfter()
```

### <a id="ExampleSplitAfterN" href="#ExampleSplitAfterN">func ExampleSplitAfterN()</a>

```
searchKey: strings_test.ExampleSplitAfterN
```

```Go
func ExampleSplitAfterN()
```

### <a id="ExampleTitle" href="#ExampleTitle">func ExampleTitle()</a>

```
searchKey: strings_test.ExampleTitle
```

```Go
func ExampleTitle()
```

### <a id="ExampleToTitle" href="#ExampleToTitle">func ExampleToTitle()</a>

```
searchKey: strings_test.ExampleToTitle
```

```Go
func ExampleToTitle()
```

### <a id="ExampleToTitleSpecial" href="#ExampleToTitleSpecial">func ExampleToTitleSpecial()</a>

```
searchKey: strings_test.ExampleToTitleSpecial
```

```Go
func ExampleToTitleSpecial()
```

### <a id="ExampleMap" href="#ExampleMap">func ExampleMap()</a>

```
searchKey: strings_test.ExampleMap
```

```Go
func ExampleMap()
```

### <a id="ExampleNewReplacer" href="#ExampleNewReplacer">func ExampleNewReplacer()</a>

```
searchKey: strings_test.ExampleNewReplacer
```

```Go
func ExampleNewReplacer()
```

### <a id="ExampleToUpper" href="#ExampleToUpper">func ExampleToUpper()</a>

```
searchKey: strings_test.ExampleToUpper
```

```Go
func ExampleToUpper()
```

### <a id="ExampleToUpperSpecial" href="#ExampleToUpperSpecial">func ExampleToUpperSpecial()</a>

```
searchKey: strings_test.ExampleToUpperSpecial
```

```Go
func ExampleToUpperSpecial()
```

### <a id="ExampleToLower" href="#ExampleToLower">func ExampleToLower()</a>

```
searchKey: strings_test.ExampleToLower
```

```Go
func ExampleToLower()
```

### <a id="ExampleToLowerSpecial" href="#ExampleToLowerSpecial">func ExampleToLowerSpecial()</a>

```
searchKey: strings_test.ExampleToLowerSpecial
```

```Go
func ExampleToLowerSpecial()
```

### <a id="ExampleTrim" href="#ExampleTrim">func ExampleTrim()</a>

```
searchKey: strings_test.ExampleTrim
```

```Go
func ExampleTrim()
```

### <a id="ExampleTrimSpace" href="#ExampleTrimSpace">func ExampleTrimSpace()</a>

```
searchKey: strings_test.ExampleTrimSpace
```

```Go
func ExampleTrimSpace()
```

### <a id="ExampleTrimPrefix" href="#ExampleTrimPrefix">func ExampleTrimPrefix()</a>

```
searchKey: strings_test.ExampleTrimPrefix
```

```Go
func ExampleTrimPrefix()
```

### <a id="ExampleTrimSuffix" href="#ExampleTrimSuffix">func ExampleTrimSuffix()</a>

```
searchKey: strings_test.ExampleTrimSuffix
```

```Go
func ExampleTrimSuffix()
```

### <a id="ExampleTrimFunc" href="#ExampleTrimFunc">func ExampleTrimFunc()</a>

```
searchKey: strings_test.ExampleTrimFunc
```

```Go
func ExampleTrimFunc()
```

### <a id="ExampleTrimLeft" href="#ExampleTrimLeft">func ExampleTrimLeft()</a>

```
searchKey: strings_test.ExampleTrimLeft
```

```Go
func ExampleTrimLeft()
```

### <a id="ExampleTrimLeftFunc" href="#ExampleTrimLeftFunc">func ExampleTrimLeftFunc()</a>

```
searchKey: strings_test.ExampleTrimLeftFunc
```

```Go
func ExampleTrimLeftFunc()
```

### <a id="ExampleTrimRight" href="#ExampleTrimRight">func ExampleTrimRight()</a>

```
searchKey: strings_test.ExampleTrimRight
```

```Go
func ExampleTrimRight()
```

### <a id="ExampleTrimRightFunc" href="#ExampleTrimRightFunc">func ExampleTrimRightFunc()</a>

```
searchKey: strings_test.ExampleTrimRightFunc
```

```Go
func ExampleTrimRightFunc()
```

### <a id="ExampleBuilder" href="#ExampleBuilder">func ExampleBuilder()</a>

```
searchKey: strings_test.ExampleBuilder
```

```Go
func ExampleBuilder()
```

### <a id="TestReader" href="#TestReader">func TestReader(t *testing.T)</a>

```
searchKey: strings_test.TestReader
```

```Go
func TestReader(t *testing.T)
```

### <a id="TestReadAfterBigSeek" href="#TestReadAfterBigSeek">func TestReadAfterBigSeek(t *testing.T)</a>

```
searchKey: strings_test.TestReadAfterBigSeek
```

```Go
func TestReadAfterBigSeek(t *testing.T)
```

### <a id="TestReaderAt" href="#TestReaderAt">func TestReaderAt(t *testing.T)</a>

```
searchKey: strings_test.TestReaderAt
```

```Go
func TestReaderAt(t *testing.T)
```

### <a id="TestReaderAtConcurrent" href="#TestReaderAtConcurrent">func TestReaderAtConcurrent(t *testing.T)</a>

```
searchKey: strings_test.TestReaderAtConcurrent
```

```Go
func TestReaderAtConcurrent(t *testing.T)
```

### <a id="TestEmptyReaderConcurrent" href="#TestEmptyReaderConcurrent">func TestEmptyReaderConcurrent(t *testing.T)</a>

```
searchKey: strings_test.TestEmptyReaderConcurrent
```

```Go
func TestEmptyReaderConcurrent(t *testing.T)
```

### <a id="TestWriteTo" href="#TestWriteTo">func TestWriteTo(t *testing.T)</a>

```
searchKey: strings_test.TestWriteTo
```

```Go
func TestWriteTo(t *testing.T)
```

### <a id="TestReaderLenSize" href="#TestReaderLenSize">func TestReaderLenSize(t *testing.T)</a>

```
searchKey: strings_test.TestReaderLenSize
```

```Go
func TestReaderLenSize(t *testing.T)
```

tests that Len is affected by reads, but Size is not. 

### <a id="TestReaderReset" href="#TestReaderReset">func TestReaderReset(t *testing.T)</a>

```
searchKey: strings_test.TestReaderReset
```

```Go
func TestReaderReset(t *testing.T)
```

### <a id="TestReaderZero" href="#TestReaderZero">func TestReaderZero(t *testing.T)</a>

```
searchKey: strings_test.TestReaderZero
```

```Go
func TestReaderZero(t *testing.T)
```

### <a id="oldHTMLEscape" href="#oldHTMLEscape">func oldHTMLEscape(s string) string</a>

```
searchKey: strings_test.oldHTMLEscape
```

```Go
func oldHTMLEscape(s string) string
```

The http package's old HTML escaping function. 

### <a id="TestReplacer" href="#TestReplacer">func TestReplacer(t *testing.T)</a>

```
searchKey: strings_test.TestReplacer
```

```Go
func TestReplacer(t *testing.T)
```

TestReplacer tests the replacer implementations. 

### <a id="TestPickAlgorithm" href="#TestPickAlgorithm">func TestPickAlgorithm(t *testing.T)</a>

```
searchKey: strings_test.TestPickAlgorithm
```

```Go
func TestPickAlgorithm(t *testing.T)
```

TestPickAlgorithm tests that NewReplacer picks the correct algorithm. 

### <a id="TestWriteStringError" href="#TestWriteStringError">func TestWriteStringError(t *testing.T)</a>

```
searchKey: strings_test.TestWriteStringError
```

```Go
func TestWriteStringError(t *testing.T)
```

TestWriteStringError tests that WriteString returns an error received from the underlying io.Writer. 

### <a id="TestGenericTrieBuilding" href="#TestGenericTrieBuilding">func TestGenericTrieBuilding(t *testing.T)</a>

```
searchKey: strings_test.TestGenericTrieBuilding
```

```Go
func TestGenericTrieBuilding(t *testing.T)
```

TestGenericTrieBuilding verifies the structure of the generated trie. There is one node per line, and the key ending with the current line is in the trie if it ends with a "+". 

### <a id="BenchmarkGenericNoMatch" href="#BenchmarkGenericNoMatch">func BenchmarkGenericNoMatch(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkGenericNoMatch
```

```Go
func BenchmarkGenericNoMatch(b *testing.B)
```

### <a id="BenchmarkGenericMatch1" href="#BenchmarkGenericMatch1">func BenchmarkGenericMatch1(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkGenericMatch1
```

```Go
func BenchmarkGenericMatch1(b *testing.B)
```

### <a id="BenchmarkGenericMatch2" href="#BenchmarkGenericMatch2">func BenchmarkGenericMatch2(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkGenericMatch2
```

```Go
func BenchmarkGenericMatch2(b *testing.B)
```

### <a id="benchmarkSingleString" href="#benchmarkSingleString">func benchmarkSingleString(b *testing.B, pattern, text string)</a>

```
searchKey: strings_test.benchmarkSingleString
```

```Go
func benchmarkSingleString(b *testing.B, pattern, text string)
```

### <a id="BenchmarkSingleMaxSkipping" href="#BenchmarkSingleMaxSkipping">func BenchmarkSingleMaxSkipping(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkSingleMaxSkipping
```

```Go
func BenchmarkSingleMaxSkipping(b *testing.B)
```

### <a id="BenchmarkSingleLongSuffixFail" href="#BenchmarkSingleLongSuffixFail">func BenchmarkSingleLongSuffixFail(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkSingleLongSuffixFail
```

```Go
func BenchmarkSingleLongSuffixFail(b *testing.B)
```

### <a id="BenchmarkSingleMatch" href="#BenchmarkSingleMatch">func BenchmarkSingleMatch(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkSingleMatch
```

```Go
func BenchmarkSingleMatch(b *testing.B)
```

### <a id="BenchmarkByteByteNoMatch" href="#BenchmarkByteByteNoMatch">func BenchmarkByteByteNoMatch(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkByteByteNoMatch
```

```Go
func BenchmarkByteByteNoMatch(b *testing.B)
```

### <a id="BenchmarkByteByteMatch" href="#BenchmarkByteByteMatch">func BenchmarkByteByteMatch(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkByteByteMatch
```

```Go
func BenchmarkByteByteMatch(b *testing.B)
```

### <a id="BenchmarkByteStringMatch" href="#BenchmarkByteStringMatch">func BenchmarkByteStringMatch(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkByteStringMatch
```

```Go
func BenchmarkByteStringMatch(b *testing.B)
```

### <a id="BenchmarkHTMLEscapeNew" href="#BenchmarkHTMLEscapeNew">func BenchmarkHTMLEscapeNew(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkHTMLEscapeNew
```

```Go
func BenchmarkHTMLEscapeNew(b *testing.B)
```

### <a id="BenchmarkHTMLEscapeOld" href="#BenchmarkHTMLEscapeOld">func BenchmarkHTMLEscapeOld(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkHTMLEscapeOld
```

```Go
func BenchmarkHTMLEscapeOld(b *testing.B)
```

### <a id="BenchmarkByteStringReplacerWriteString" href="#BenchmarkByteStringReplacerWriteString">func BenchmarkByteStringReplacerWriteString(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkByteStringReplacerWriteString
```

```Go
func BenchmarkByteStringReplacerWriteString(b *testing.B)
```

### <a id="BenchmarkByteReplacerWriteString" href="#BenchmarkByteReplacerWriteString">func BenchmarkByteReplacerWriteString(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkByteReplacerWriteString
```

```Go
func BenchmarkByteReplacerWriteString(b *testing.B)
```

### <a id="BenchmarkByteByteReplaces" href="#BenchmarkByteByteReplaces">func BenchmarkByteByteReplaces(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkByteByteReplaces
```

```Go
func BenchmarkByteByteReplaces(b *testing.B)
```

BenchmarkByteByteReplaces compares byteByteImpl against multiple Replaces. 

### <a id="BenchmarkByteByteMap" href="#BenchmarkByteByteMap">func BenchmarkByteByteMap(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkByteByteMap
```

```Go
func BenchmarkByteByteMap(b *testing.B)
```

BenchmarkByteByteMap compares byteByteImpl against Map. 

### <a id="BenchmarkMap" href="#BenchmarkMap">func BenchmarkMap(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkMap
```

```Go
func BenchmarkMap(b *testing.B)
```

### <a id="TestFinderNext" href="#TestFinderNext">func TestFinderNext(t *testing.T)</a>

```
searchKey: strings_test.TestFinderNext
```

```Go
func TestFinderNext(t *testing.T)
```

### <a id="TestFinderCreation" href="#TestFinderCreation">func TestFinderCreation(t *testing.T)</a>

```
searchKey: strings_test.TestFinderCreation
```

```Go
func TestFinderCreation(t *testing.T)
```

### <a id="eq" href="#eq">func eq(a, b []string) bool</a>

```
searchKey: strings_test.eq
```

```Go
func eq(a, b []string) bool
```

### <a id="runIndexTests" href="#runIndexTests">func runIndexTests(t *testing.T, f func(s, sep string) int, funcName string, testCases []IndexTest)</a>

```
searchKey: strings_test.runIndexTests
```

```Go
func runIndexTests(t *testing.T, f func(s, sep string) int, funcName string, testCases []IndexTest)
```

Execute f on each test case.  funcName should be the name of f; it's used in failure reports. 

### <a id="TestIndex" href="#TestIndex">func TestIndex(t *testing.T)</a>

```
searchKey: strings_test.TestIndex
```

```Go
func TestIndex(t *testing.T)
```

### <a id="TestLastIndex" href="#TestLastIndex">func TestLastIndex(t *testing.T)</a>

```
searchKey: strings_test.TestLastIndex
```

```Go
func TestLastIndex(t *testing.T)
```

### <a id="TestIndexAny" href="#TestIndexAny">func TestIndexAny(t *testing.T)</a>

```
searchKey: strings_test.TestIndexAny
```

```Go
func TestIndexAny(t *testing.T)
```

### <a id="TestLastIndexAny" href="#TestLastIndexAny">func TestLastIndexAny(t *testing.T)</a>

```
searchKey: strings_test.TestLastIndexAny
```

```Go
func TestLastIndexAny(t *testing.T)
```

### <a id="TestIndexByte" href="#TestIndexByte">func TestIndexByte(t *testing.T)</a>

```
searchKey: strings_test.TestIndexByte
```

```Go
func TestIndexByte(t *testing.T)
```

### <a id="TestLastIndexByte" href="#TestLastIndexByte">func TestLastIndexByte(t *testing.T)</a>

```
searchKey: strings_test.TestLastIndexByte
```

```Go
func TestLastIndexByte(t *testing.T)
```

### <a id="simpleIndex" href="#simpleIndex">func simpleIndex(s, sep string) int</a>

```
searchKey: strings_test.simpleIndex
```

```Go
func simpleIndex(s, sep string) int
```

### <a id="TestIndexRandom" href="#TestIndexRandom">func TestIndexRandom(t *testing.T)</a>

```
searchKey: strings_test.TestIndexRandom
```

```Go
func TestIndexRandom(t *testing.T)
```

### <a id="TestIndexRune" href="#TestIndexRune">func TestIndexRune(t *testing.T)</a>

```
searchKey: strings_test.TestIndexRune
```

```Go
func TestIndexRune(t *testing.T)
```

### <a id="BenchmarkIndexRune" href="#BenchmarkIndexRune">func BenchmarkIndexRune(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkIndexRune
```

```Go
func BenchmarkIndexRune(b *testing.B)
```

### <a id="BenchmarkIndexRuneLongString" href="#BenchmarkIndexRuneLongString">func BenchmarkIndexRuneLongString(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkIndexRuneLongString
```

```Go
func BenchmarkIndexRuneLongString(b *testing.B)
```

### <a id="BenchmarkIndexRuneFastPath" href="#BenchmarkIndexRuneFastPath">func BenchmarkIndexRuneFastPath(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkIndexRuneFastPath
```

```Go
func BenchmarkIndexRuneFastPath(b *testing.B)
```

### <a id="BenchmarkIndex" href="#BenchmarkIndex">func BenchmarkIndex(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkIndex
```

```Go
func BenchmarkIndex(b *testing.B)
```

### <a id="BenchmarkLastIndex" href="#BenchmarkLastIndex">func BenchmarkLastIndex(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkLastIndex
```

```Go
func BenchmarkLastIndex(b *testing.B)
```

### <a id="BenchmarkIndexByte" href="#BenchmarkIndexByte">func BenchmarkIndexByte(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkIndexByte
```

```Go
func BenchmarkIndexByte(b *testing.B)
```

### <a id="TestSplit" href="#TestSplit">func TestSplit(t *testing.T)</a>

```
searchKey: strings_test.TestSplit
```

```Go
func TestSplit(t *testing.T)
```

### <a id="TestSplitAfter" href="#TestSplitAfter">func TestSplitAfter(t *testing.T)</a>

```
searchKey: strings_test.TestSplitAfter
```

```Go
func TestSplitAfter(t *testing.T)
```

### <a id="TestFields" href="#TestFields">func TestFields(t *testing.T)</a>

```
searchKey: strings_test.TestFields
```

```Go
func TestFields(t *testing.T)
```

### <a id="TestFieldsFunc" href="#TestFieldsFunc">func TestFieldsFunc(t *testing.T)</a>

```
searchKey: strings_test.TestFieldsFunc
```

```Go
func TestFieldsFunc(t *testing.T)
```

### <a id="runStringTests" href="#runStringTests">func runStringTests(t *testing.T, f func(string) string, funcName string, testCases []StringTest)</a>

```
searchKey: strings_test.runStringTests
```

```Go
func runStringTests(t *testing.T, f func(string) string, funcName string, testCases []StringTest)
```

Execute f on each test case.  funcName should be the name of f; it's used in failure reports. 

### <a id="tenRunes" href="#tenRunes">func tenRunes(ch rune) string</a>

```
searchKey: strings_test.tenRunes
```

```Go
func tenRunes(ch rune) string
```

### <a id="rot13" href="#rot13">func rot13(r rune) rune</a>

```
searchKey: strings_test.rot13
```

```Go
func rot13(r rune) rune
```

User-defined self-inverse mapping function 

### <a id="TestMap" href="#TestMap">func TestMap(t *testing.T)</a>

```
searchKey: strings_test.TestMap
```

```Go
func TestMap(t *testing.T)
```

### <a id="TestToUpper" href="#TestToUpper">func TestToUpper(t *testing.T)</a>

```
searchKey: strings_test.TestToUpper
```

```Go
func TestToUpper(t *testing.T)
```

### <a id="TestToLower" href="#TestToLower">func TestToLower(t *testing.T)</a>

```
searchKey: strings_test.TestToLower
```

```Go
func TestToLower(t *testing.T)
```

### <a id="TestToValidUTF8" href="#TestToValidUTF8">func TestToValidUTF8(t *testing.T)</a>

```
searchKey: strings_test.TestToValidUTF8
```

```Go
func TestToValidUTF8(t *testing.T)
```

### <a id="BenchmarkToUpper" href="#BenchmarkToUpper">func BenchmarkToUpper(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkToUpper
```

```Go
func BenchmarkToUpper(b *testing.B)
```

### <a id="BenchmarkToLower" href="#BenchmarkToLower">func BenchmarkToLower(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkToLower
```

```Go
func BenchmarkToLower(b *testing.B)
```

### <a id="BenchmarkMapNoChanges" href="#BenchmarkMapNoChanges">func BenchmarkMapNoChanges(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkMapNoChanges
```

```Go
func BenchmarkMapNoChanges(b *testing.B)
```

### <a id="TestSpecialCase" href="#TestSpecialCase">func TestSpecialCase(t *testing.T)</a>

```
searchKey: strings_test.TestSpecialCase
```

```Go
func TestSpecialCase(t *testing.T)
```

### <a id="TestTrimSpace" href="#TestTrimSpace">func TestTrimSpace(t *testing.T)</a>

```
searchKey: strings_test.TestTrimSpace
```

```Go
func TestTrimSpace(t *testing.T)
```

### <a id="TestTrim" href="#TestTrim">func TestTrim(t *testing.T)</a>

```
searchKey: strings_test.TestTrim
```

```Go
func TestTrim(t *testing.T)
```

### <a id="BenchmarkTrim" href="#BenchmarkTrim">func BenchmarkTrim(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkTrim
```

```Go
func BenchmarkTrim(b *testing.B)
```

### <a id="BenchmarkToValidUTF8" href="#BenchmarkToValidUTF8">func BenchmarkToValidUTF8(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkToValidUTF8
```

```Go
func BenchmarkToValidUTF8(b *testing.B)
```

### <a id="TestTrimFunc" href="#TestTrimFunc">func TestTrimFunc(t *testing.T)</a>

```
searchKey: strings_test.TestTrimFunc
```

```Go
func TestTrimFunc(t *testing.T)
```

### <a id="TestIndexFunc" href="#TestIndexFunc">func TestIndexFunc(t *testing.T)</a>

```
searchKey: strings_test.TestIndexFunc
```

```Go
func TestIndexFunc(t *testing.T)
```

### <a id="equal" href="#equal">func equal(m string, s1, s2 string, t *testing.T) bool</a>

```
searchKey: strings_test.equal
```

```Go
func equal(m string, s1, s2 string, t *testing.T) bool
```

### <a id="TestCaseConsistency" href="#TestCaseConsistency">func TestCaseConsistency(t *testing.T)</a>

```
searchKey: strings_test.TestCaseConsistency
```

```Go
func TestCaseConsistency(t *testing.T)
```

### <a id="TestRepeat" href="#TestRepeat">func TestRepeat(t *testing.T)</a>

```
searchKey: strings_test.TestRepeat
```

```Go
func TestRepeat(t *testing.T)
```

### <a id="repeat" href="#repeat">func repeat(s string, count int) (err error)</a>

```
searchKey: strings_test.repeat
```

```Go
func repeat(s string, count int) (err error)
```

### <a id="TestRepeatCatchesOverflow" href="#TestRepeatCatchesOverflow">func TestRepeatCatchesOverflow(t *testing.T)</a>

```
searchKey: strings_test.TestRepeatCatchesOverflow
```

```Go
func TestRepeatCatchesOverflow(t *testing.T)
```

See Issue golang.org/issue/16237 

### <a id="runesEqual" href="#runesEqual">func runesEqual(a, b []rune) bool</a>

```
searchKey: strings_test.runesEqual
```

```Go
func runesEqual(a, b []rune) bool
```

### <a id="TestRunes" href="#TestRunes">func TestRunes(t *testing.T)</a>

```
searchKey: strings_test.TestRunes
```

```Go
func TestRunes(t *testing.T)
```

### <a id="TestReadByte" href="#TestReadByte">func TestReadByte(t *testing.T)</a>

```
searchKey: strings_test.TestReadByte
```

```Go
func TestReadByte(t *testing.T)
```

### <a id="TestReadRune" href="#TestReadRune">func TestReadRune(t *testing.T)</a>

```
searchKey: strings_test.TestReadRune
```

```Go
func TestReadRune(t *testing.T)
```

### <a id="TestUnreadRuneError" href="#TestUnreadRuneError">func TestUnreadRuneError(t *testing.T)</a>

```
searchKey: strings_test.TestUnreadRuneError
```

```Go
func TestUnreadRuneError(t *testing.T)
```

### <a id="TestReplace" href="#TestReplace">func TestReplace(t *testing.T)</a>

```
searchKey: strings_test.TestReplace
```

```Go
func TestReplace(t *testing.T)
```

### <a id="TestTitle" href="#TestTitle">func TestTitle(t *testing.T)</a>

```
searchKey: strings_test.TestTitle
```

```Go
func TestTitle(t *testing.T)
```

### <a id="TestContains" href="#TestContains">func TestContains(t *testing.T)</a>

```
searchKey: strings_test.TestContains
```

```Go
func TestContains(t *testing.T)
```

### <a id="TestContainsAny" href="#TestContainsAny">func TestContainsAny(t *testing.T)</a>

```
searchKey: strings_test.TestContainsAny
```

```Go
func TestContainsAny(t *testing.T)
```

### <a id="TestContainsRune" href="#TestContainsRune">func TestContainsRune(t *testing.T)</a>

```
searchKey: strings_test.TestContainsRune
```

```Go
func TestContainsRune(t *testing.T)
```

### <a id="TestEqualFold" href="#TestEqualFold">func TestEqualFold(t *testing.T)</a>

```
searchKey: strings_test.TestEqualFold
```

```Go
func TestEqualFold(t *testing.T)
```

### <a id="BenchmarkEqualFold" href="#BenchmarkEqualFold">func BenchmarkEqualFold(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkEqualFold
```

```Go
func BenchmarkEqualFold(b *testing.B)
```

### <a id="TestCount" href="#TestCount">func TestCount(t *testing.T)</a>

```
searchKey: strings_test.TestCount
```

```Go
func TestCount(t *testing.T)
```

### <a id="makeBenchInputHard" href="#makeBenchInputHard">func makeBenchInputHard() string</a>

```
searchKey: strings_test.makeBenchInputHard
```

```Go
func makeBenchInputHard() string
```

### <a id="benchmarkIndexHard" href="#benchmarkIndexHard">func benchmarkIndexHard(b *testing.B, sep string)</a>

```
searchKey: strings_test.benchmarkIndexHard
```

```Go
func benchmarkIndexHard(b *testing.B, sep string)
```

### <a id="benchmarkLastIndexHard" href="#benchmarkLastIndexHard">func benchmarkLastIndexHard(b *testing.B, sep string)</a>

```
searchKey: strings_test.benchmarkLastIndexHard
```

```Go
func benchmarkLastIndexHard(b *testing.B, sep string)
```

### <a id="benchmarkCountHard" href="#benchmarkCountHard">func benchmarkCountHard(b *testing.B, sep string)</a>

```
searchKey: strings_test.benchmarkCountHard
```

```Go
func benchmarkCountHard(b *testing.B, sep string)
```

### <a id="BenchmarkIndexHard1" href="#BenchmarkIndexHard1">func BenchmarkIndexHard1(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkIndexHard1
```

```Go
func BenchmarkIndexHard1(b *testing.B)
```

### <a id="BenchmarkIndexHard2" href="#BenchmarkIndexHard2">func BenchmarkIndexHard2(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkIndexHard2
```

```Go
func BenchmarkIndexHard2(b *testing.B)
```

### <a id="BenchmarkIndexHard3" href="#BenchmarkIndexHard3">func BenchmarkIndexHard3(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkIndexHard3
```

```Go
func BenchmarkIndexHard3(b *testing.B)
```

### <a id="BenchmarkIndexHard4" href="#BenchmarkIndexHard4">func BenchmarkIndexHard4(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkIndexHard4
```

```Go
func BenchmarkIndexHard4(b *testing.B)
```

### <a id="BenchmarkLastIndexHard1" href="#BenchmarkLastIndexHard1">func BenchmarkLastIndexHard1(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkLastIndexHard1
```

```Go
func BenchmarkLastIndexHard1(b *testing.B)
```

### <a id="BenchmarkLastIndexHard2" href="#BenchmarkLastIndexHard2">func BenchmarkLastIndexHard2(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkLastIndexHard2
```

```Go
func BenchmarkLastIndexHard2(b *testing.B)
```

### <a id="BenchmarkLastIndexHard3" href="#BenchmarkLastIndexHard3">func BenchmarkLastIndexHard3(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkLastIndexHard3
```

```Go
func BenchmarkLastIndexHard3(b *testing.B)
```

### <a id="BenchmarkCountHard1" href="#BenchmarkCountHard1">func BenchmarkCountHard1(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkCountHard1
```

```Go
func BenchmarkCountHard1(b *testing.B)
```

### <a id="BenchmarkCountHard2" href="#BenchmarkCountHard2">func BenchmarkCountHard2(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkCountHard2
```

```Go
func BenchmarkCountHard2(b *testing.B)
```

### <a id="BenchmarkCountHard3" href="#BenchmarkCountHard3">func BenchmarkCountHard3(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkCountHard3
```

```Go
func BenchmarkCountHard3(b *testing.B)
```

### <a id="BenchmarkIndexTorture" href="#BenchmarkIndexTorture">func BenchmarkIndexTorture(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkIndexTorture
```

```Go
func BenchmarkIndexTorture(b *testing.B)
```

### <a id="BenchmarkCountTorture" href="#BenchmarkCountTorture">func BenchmarkCountTorture(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkCountTorture
```

```Go
func BenchmarkCountTorture(b *testing.B)
```

### <a id="BenchmarkCountTortureOverlapping" href="#BenchmarkCountTortureOverlapping">func BenchmarkCountTortureOverlapping(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkCountTortureOverlapping
```

```Go
func BenchmarkCountTortureOverlapping(b *testing.B)
```

### <a id="BenchmarkCountByte" href="#BenchmarkCountByte">func BenchmarkCountByte(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkCountByte
```

```Go
func BenchmarkCountByte(b *testing.B)
```

### <a id="BenchmarkFields" href="#BenchmarkFields">func BenchmarkFields(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkFields
```

```Go
func BenchmarkFields(b *testing.B)
```

### <a id="BenchmarkFieldsFunc" href="#BenchmarkFieldsFunc">func BenchmarkFieldsFunc(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkFieldsFunc
```

```Go
func BenchmarkFieldsFunc(b *testing.B)
```

### <a id="BenchmarkSplitEmptySeparator" href="#BenchmarkSplitEmptySeparator">func BenchmarkSplitEmptySeparator(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkSplitEmptySeparator
```

```Go
func BenchmarkSplitEmptySeparator(b *testing.B)
```

### <a id="BenchmarkSplitSingleByteSeparator" href="#BenchmarkSplitSingleByteSeparator">func BenchmarkSplitSingleByteSeparator(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkSplitSingleByteSeparator
```

```Go
func BenchmarkSplitSingleByteSeparator(b *testing.B)
```

### <a id="BenchmarkSplitMultiByteSeparator" href="#BenchmarkSplitMultiByteSeparator">func BenchmarkSplitMultiByteSeparator(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkSplitMultiByteSeparator
```

```Go
func BenchmarkSplitMultiByteSeparator(b *testing.B)
```

### <a id="BenchmarkSplitNSingleByteSeparator" href="#BenchmarkSplitNSingleByteSeparator">func BenchmarkSplitNSingleByteSeparator(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkSplitNSingleByteSeparator
```

```Go
func BenchmarkSplitNSingleByteSeparator(b *testing.B)
```

### <a id="BenchmarkSplitNMultiByteSeparator" href="#BenchmarkSplitNMultiByteSeparator">func BenchmarkSplitNMultiByteSeparator(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkSplitNMultiByteSeparator
```

```Go
func BenchmarkSplitNMultiByteSeparator(b *testing.B)
```

### <a id="BenchmarkRepeat" href="#BenchmarkRepeat">func BenchmarkRepeat(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkRepeat
```

```Go
func BenchmarkRepeat(b *testing.B)
```

### <a id="BenchmarkIndexAnyASCII" href="#BenchmarkIndexAnyASCII">func BenchmarkIndexAnyASCII(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkIndexAnyASCII
```

```Go
func BenchmarkIndexAnyASCII(b *testing.B)
```

### <a id="BenchmarkIndexAnyUTF8" href="#BenchmarkIndexAnyUTF8">func BenchmarkIndexAnyUTF8(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkIndexAnyUTF8
```

```Go
func BenchmarkIndexAnyUTF8(b *testing.B)
```

### <a id="BenchmarkLastIndexAnyASCII" href="#BenchmarkLastIndexAnyASCII">func BenchmarkLastIndexAnyASCII(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkLastIndexAnyASCII
```

```Go
func BenchmarkLastIndexAnyASCII(b *testing.B)
```

### <a id="BenchmarkLastIndexAnyUTF8" href="#BenchmarkLastIndexAnyUTF8">func BenchmarkLastIndexAnyUTF8(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkLastIndexAnyUTF8
```

```Go
func BenchmarkLastIndexAnyUTF8(b *testing.B)
```

### <a id="BenchmarkTrimASCII" href="#BenchmarkTrimASCII">func BenchmarkTrimASCII(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkTrimASCII
```

```Go
func BenchmarkTrimASCII(b *testing.B)
```

### <a id="BenchmarkIndexPeriodic" href="#BenchmarkIndexPeriodic">func BenchmarkIndexPeriodic(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkIndexPeriodic
```

```Go
func BenchmarkIndexPeriodic(b *testing.B)
```

### <a id="BenchmarkJoin" href="#BenchmarkJoin">func BenchmarkJoin(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkJoin
```

```Go
func BenchmarkJoin(b *testing.B)
```

### <a id="BenchmarkTrimSpace" href="#BenchmarkTrimSpace">func BenchmarkTrimSpace(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkTrimSpace
```

```Go
func BenchmarkTrimSpace(b *testing.B)
```

### <a id="BenchmarkReplaceAll" href="#BenchmarkReplaceAll">func BenchmarkReplaceAll(b *testing.B)</a>

```
searchKey: strings_test.BenchmarkReplaceAll
```

```Go
func BenchmarkReplaceAll(b *testing.B)
```
