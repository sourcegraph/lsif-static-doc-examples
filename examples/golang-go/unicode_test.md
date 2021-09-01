# Package unicode_test

## Index

* [Variables](#var)
    * [var calibrate](#calibrate)
    * [var caseTest](#caseTest)
    * [var inCategoryTest](#inCategoryTest)
    * [var inPropTest](#inPropTest)
    * [var letterTest](#letterTest)
    * [var notletterTest](#notletterTest)
    * [var notupperTest](#notupperTest)
    * [var simpleFoldTests](#simpleFoldTests)
    * [var spaceTest](#spaceTest)
    * [var testDigit](#testDigit)
    * [var testLetter](#testLetter)
    * [var upperTest](#upperTest)
* [Types](#type)
    * [type T struct](#T)
    * [type caseT struct](#caseT)
* [Functions](#func)
    * [func ExampleSimpleFold()](#ExampleSimpleFold)
    * [func ExampleSpecialCase()](#ExampleSpecialCase)
    * [func ExampleTo()](#ExampleTo)
    * [func ExampleToLower()](#ExampleToLower)
    * [func ExampleToTitle()](#ExampleToTitle)
    * [func ExampleToUpper()](#ExampleToUpper)
    * [func Example_is()](#Example_is)
    * [func TestCalibrate(t *testing.T)](#TestCalibrate)
    * [func TestCategories(t *testing.T)](#TestCategories)
    * [func TestDigit(t *testing.T)](#TestDigit)
    * [func TestDigitOptimization(t *testing.T)](#TestDigitOptimization)
    * [func TestIsControlLatin1(t *testing.T)](#TestIsControlLatin1)
    * [func TestIsGraphicLatin1(t *testing.T)](#TestIsGraphicLatin1)
    * [func TestIsLetter(t *testing.T)](#TestIsLetter)
    * [func TestIsLetterLatin1(t *testing.T)](#TestIsLetterLatin1)
    * [func TestIsLowerLatin1(t *testing.T)](#TestIsLowerLatin1)
    * [func TestIsPrintLatin1(t *testing.T)](#TestIsPrintLatin1)
    * [func TestIsPunctLatin1(t *testing.T)](#TestIsPunctLatin1)
    * [func TestIsSpace(t *testing.T)](#TestIsSpace)
    * [func TestIsSpaceLatin1(t *testing.T)](#TestIsSpaceLatin1)
    * [func TestIsSymbolLatin1(t *testing.T)](#TestIsSymbolLatin1)
    * [func TestIsUpper(t *testing.T)](#TestIsUpper)
    * [func TestIsUpperLatin1(t *testing.T)](#TestIsUpperLatin1)
    * [func TestLatinOffset(t *testing.T)](#TestLatinOffset)
    * [func TestLetterOptimizations(t *testing.T)](#TestLetterOptimizations)
    * [func TestNegativeRune(t *testing.T)](#TestNegativeRune)
    * [func TestNumberLatin1(t *testing.T)](#TestNumberLatin1)
    * [func TestProperties(t *testing.T)](#TestProperties)
    * [func TestSimpleFold(t *testing.T)](#TestSimpleFold)
    * [func TestSpecialCaseNoMapping(t *testing.T)](#TestSpecialCaseNoMapping)
    * [func TestTo(t *testing.T)](#TestTo)
    * [func TestToLowerCase(t *testing.T)](#TestToLowerCase)
    * [func TestToTitleCase(t *testing.T)](#TestToTitleCase)
    * [func TestToUpperCase(t *testing.T)](#TestToUpperCase)
    * [func TestTurkishCase(t *testing.T)](#TestTurkishCase)
    * [func binary(ranges []Range16, r uint16) bool](#binary)
    * [func caseString(c int) string](#caseString)
    * [func fakeTable(n int) []Range16](#fakeTable)
    * [func linear(ranges []Range16, r uint16) bool](#linear)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="calibrate" href="#calibrate">var calibrate</a>

```
searchKey: unicode_test.calibrate
tags: [variable boolean private]
```

```Go
var calibrate = flag.Bool("calibrate", false, "compute crossover for linear vs. binary search")
```

### <a id="caseTest" href="#caseTest">var caseTest</a>

```
searchKey: unicode_test.caseTest
tags: [variable array struct private]
```

```Go
var caseTest = ...
```

### <a id="inCategoryTest" href="#inCategoryTest">var inCategoryTest</a>

```
searchKey: unicode_test.inCategoryTest
tags: [variable array struct private]
```

```Go
var inCategoryTest = ...
```

### <a id="inPropTest" href="#inPropTest">var inPropTest</a>

```
searchKey: unicode_test.inPropTest
tags: [variable array struct private]
```

```Go
var inPropTest = ...
```

### <a id="letterTest" href="#letterTest">var letterTest</a>

```
searchKey: unicode_test.letterTest
tags: [variable array number private]
```

```Go
var letterTest = ...
```

### <a id="notletterTest" href="#notletterTest">var notletterTest</a>

```
searchKey: unicode_test.notletterTest
tags: [variable array number private]
```

```Go
var notletterTest = ...
```

### <a id="notupperTest" href="#notupperTest">var notupperTest</a>

```
searchKey: unicode_test.notupperTest
tags: [variable array number private]
```

```Go
var notupperTest = ...
```

### <a id="simpleFoldTests" href="#simpleFoldTests">var simpleFoldTests</a>

```
searchKey: unicode_test.simpleFoldTests
tags: [variable array string private]
```

```Go
var simpleFoldTests = ...
```

### <a id="spaceTest" href="#spaceTest">var spaceTest</a>

```
searchKey: unicode_test.spaceTest
tags: [variable array number private]
```

```Go
var spaceTest = []rune{
	0x09,
	0x0a,
	0x0b,
	0x0c,
	0x0d,
	0x20,
	0x85,
	0xA0,
	0x2000,
	0x3000,
}
```

Contains all the special cased Latin-1 chars. 

### <a id="testDigit" href="#testDigit">var testDigit</a>

```
searchKey: unicode_test.testDigit
tags: [variable array number private]
```

```Go
var testDigit = ...
```

### <a id="testLetter" href="#testLetter">var testLetter</a>

```
searchKey: unicode_test.testLetter
tags: [variable array number private]
```

```Go
var testLetter = ...
```

### <a id="upperTest" href="#upperTest">var upperTest</a>

```
searchKey: unicode_test.upperTest
tags: [variable array number private]
```

```Go
var upperTest = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="T" href="#T">type T struct</a>

```
searchKey: unicode_test.T
tags: [struct private]
```

```Go
type T struct {
	rune   rune
	script string
}
```

### <a id="caseT" href="#caseT">type caseT struct</a>

```
searchKey: unicode_test.caseT
tags: [struct private]
```

```Go
type caseT struct {
	cas     int
	in, out rune
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ExampleSimpleFold" href="#ExampleSimpleFold">func ExampleSimpleFold()</a>

```
searchKey: unicode_test.ExampleSimpleFold
tags: [function private]
```

```Go
func ExampleSimpleFold()
```

### <a id="ExampleSpecialCase" href="#ExampleSpecialCase">func ExampleSpecialCase()</a>

```
searchKey: unicode_test.ExampleSpecialCase
tags: [function private]
```

```Go
func ExampleSpecialCase()
```

### <a id="ExampleTo" href="#ExampleTo">func ExampleTo()</a>

```
searchKey: unicode_test.ExampleTo
tags: [function private]
```

```Go
func ExampleTo()
```

### <a id="ExampleToLower" href="#ExampleToLower">func ExampleToLower()</a>

```
searchKey: unicode_test.ExampleToLower
tags: [function private]
```

```Go
func ExampleToLower()
```

### <a id="ExampleToTitle" href="#ExampleToTitle">func ExampleToTitle()</a>

```
searchKey: unicode_test.ExampleToTitle
tags: [function private]
```

```Go
func ExampleToTitle()
```

### <a id="ExampleToUpper" href="#ExampleToUpper">func ExampleToUpper()</a>

```
searchKey: unicode_test.ExampleToUpper
tags: [function private]
```

```Go
func ExampleToUpper()
```

### <a id="Example_is" href="#Example_is">func Example_is()</a>

```
searchKey: unicode_test.Example_is
tags: [function private]
```

```Go
func Example_is()
```

Functions starting with "Is" can be used to inspect which table of range a rune belongs to. Note that runes may fit into more than one range. 

### <a id="TestCalibrate" href="#TestCalibrate">func TestCalibrate(t *testing.T)</a>

```
searchKey: unicode_test.TestCalibrate
tags: [function private test]
```

```Go
func TestCalibrate(t *testing.T)
```

### <a id="TestCategories" href="#TestCategories">func TestCategories(t *testing.T)</a>

```
searchKey: unicode_test.TestCategories
tags: [function private test]
```

```Go
func TestCategories(t *testing.T)
```

### <a id="TestDigit" href="#TestDigit">func TestDigit(t *testing.T)</a>

```
searchKey: unicode_test.TestDigit
tags: [function private test]
```

```Go
func TestDigit(t *testing.T)
```

### <a id="TestDigitOptimization" href="#TestDigitOptimization">func TestDigitOptimization(t *testing.T)</a>

```
searchKey: unicode_test.TestDigitOptimization
tags: [function private test]
```

```Go
func TestDigitOptimization(t *testing.T)
```

Test that the special case in IsDigit agrees with the table 

### <a id="TestIsControlLatin1" href="#TestIsControlLatin1">func TestIsControlLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsControlLatin1
tags: [function private test]
```

```Go
func TestIsControlLatin1(t *testing.T)
```

### <a id="TestIsGraphicLatin1" href="#TestIsGraphicLatin1">func TestIsGraphicLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsGraphicLatin1
tags: [function private test]
```

```Go
func TestIsGraphicLatin1(t *testing.T)
```

### <a id="TestIsLetter" href="#TestIsLetter">func TestIsLetter(t *testing.T)</a>

```
searchKey: unicode_test.TestIsLetter
tags: [function private test]
```

```Go
func TestIsLetter(t *testing.T)
```

### <a id="TestIsLetterLatin1" href="#TestIsLetterLatin1">func TestIsLetterLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsLetterLatin1
tags: [function private test]
```

```Go
func TestIsLetterLatin1(t *testing.T)
```

### <a id="TestIsLowerLatin1" href="#TestIsLowerLatin1">func TestIsLowerLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsLowerLatin1
tags: [function private test]
```

```Go
func TestIsLowerLatin1(t *testing.T)
```

### <a id="TestIsPrintLatin1" href="#TestIsPrintLatin1">func TestIsPrintLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsPrintLatin1
tags: [function private test]
```

```Go
func TestIsPrintLatin1(t *testing.T)
```

### <a id="TestIsPunctLatin1" href="#TestIsPunctLatin1">func TestIsPunctLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsPunctLatin1
tags: [function private test]
```

```Go
func TestIsPunctLatin1(t *testing.T)
```

### <a id="TestIsSpace" href="#TestIsSpace">func TestIsSpace(t *testing.T)</a>

```
searchKey: unicode_test.TestIsSpace
tags: [function private test]
```

```Go
func TestIsSpace(t *testing.T)
```

### <a id="TestIsSpaceLatin1" href="#TestIsSpaceLatin1">func TestIsSpaceLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsSpaceLatin1
tags: [function private test]
```

```Go
func TestIsSpaceLatin1(t *testing.T)
```

### <a id="TestIsSymbolLatin1" href="#TestIsSymbolLatin1">func TestIsSymbolLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsSymbolLatin1
tags: [function private test]
```

```Go
func TestIsSymbolLatin1(t *testing.T)
```

### <a id="TestIsUpper" href="#TestIsUpper">func TestIsUpper(t *testing.T)</a>

```
searchKey: unicode_test.TestIsUpper
tags: [function private test]
```

```Go
func TestIsUpper(t *testing.T)
```

### <a id="TestIsUpperLatin1" href="#TestIsUpperLatin1">func TestIsUpperLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsUpperLatin1
tags: [function private test]
```

```Go
func TestIsUpperLatin1(t *testing.T)
```

### <a id="TestLatinOffset" href="#TestLatinOffset">func TestLatinOffset(t *testing.T)</a>

```
searchKey: unicode_test.TestLatinOffset
tags: [function private test]
```

```Go
func TestLatinOffset(t *testing.T)
```

### <a id="TestLetterOptimizations" href="#TestLetterOptimizations">func TestLetterOptimizations(t *testing.T)</a>

```
searchKey: unicode_test.TestLetterOptimizations
tags: [function private test]
```

```Go
func TestLetterOptimizations(t *testing.T)
```

Check that the optimizations for IsLetter etc. agree with the tables. We only need to check the Latin-1 range. 

### <a id="TestNegativeRune" href="#TestNegativeRune">func TestNegativeRune(t *testing.T)</a>

```
searchKey: unicode_test.TestNegativeRune
tags: [function private test]
```

```Go
func TestNegativeRune(t *testing.T)
```

### <a id="TestNumberLatin1" href="#TestNumberLatin1">func TestNumberLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestNumberLatin1
tags: [function private test]
```

```Go
func TestNumberLatin1(t *testing.T)
```

### <a id="TestProperties" href="#TestProperties">func TestProperties(t *testing.T)</a>

```
searchKey: unicode_test.TestProperties
tags: [function private test]
```

```Go
func TestProperties(t *testing.T)
```

### <a id="TestSimpleFold" href="#TestSimpleFold">func TestSimpleFold(t *testing.T)</a>

```
searchKey: unicode_test.TestSimpleFold
tags: [function private test]
```

```Go
func TestSimpleFold(t *testing.T)
```

### <a id="TestSpecialCaseNoMapping" href="#TestSpecialCaseNoMapping">func TestSpecialCaseNoMapping(t *testing.T)</a>

```
searchKey: unicode_test.TestSpecialCaseNoMapping
tags: [function private test]
```

```Go
func TestSpecialCaseNoMapping(t *testing.T)
```

### <a id="TestTo" href="#TestTo">func TestTo(t *testing.T)</a>

```
searchKey: unicode_test.TestTo
tags: [function private test]
```

```Go
func TestTo(t *testing.T)
```

### <a id="TestToLowerCase" href="#TestToLowerCase">func TestToLowerCase(t *testing.T)</a>

```
searchKey: unicode_test.TestToLowerCase
tags: [function private test]
```

```Go
func TestToLowerCase(t *testing.T)
```

### <a id="TestToTitleCase" href="#TestToTitleCase">func TestToTitleCase(t *testing.T)</a>

```
searchKey: unicode_test.TestToTitleCase
tags: [function private test]
```

```Go
func TestToTitleCase(t *testing.T)
```

### <a id="TestToUpperCase" href="#TestToUpperCase">func TestToUpperCase(t *testing.T)</a>

```
searchKey: unicode_test.TestToUpperCase
tags: [function private test]
```

```Go
func TestToUpperCase(t *testing.T)
```

### <a id="TestTurkishCase" href="#TestTurkishCase">func TestTurkishCase(t *testing.T)</a>

```
searchKey: unicode_test.TestTurkishCase
tags: [function private test]
```

```Go
func TestTurkishCase(t *testing.T)
```

### <a id="binary" href="#binary">func binary(ranges []Range16, r uint16) bool</a>

```
searchKey: unicode_test.binary
tags: [function private]
```

```Go
func binary(ranges []Range16, r uint16) bool
```

### <a id="caseString" href="#caseString">func caseString(c int) string</a>

```
searchKey: unicode_test.caseString
tags: [function private]
```

```Go
func caseString(c int) string
```

### <a id="fakeTable" href="#fakeTable">func fakeTable(n int) []Range16</a>

```
searchKey: unicode_test.fakeTable
tags: [function private]
```

```Go
func fakeTable(n int) []Range16
```

### <a id="linear" href="#linear">func linear(ranges []Range16, r uint16) bool</a>

```
searchKey: unicode_test.linear
tags: [function private]
```

```Go
func linear(ranges []Range16, r uint16) bool
```

