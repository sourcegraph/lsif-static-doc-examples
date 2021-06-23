# Package unicode_test

## Index

* [Variables](#var)
    * [var testDigit](#testDigit)
    * [var testLetter](#testLetter)
    * [var upperTest](#upperTest)
    * [var notupperTest](#notupperTest)
    * [var letterTest](#letterTest)
    * [var notletterTest](#notletterTest)
    * [var spaceTest](#spaceTest)
    * [var caseTest](#caseTest)
    * [var simpleFoldTests](#simpleFoldTests)
    * [var calibrate](#calibrate)
    * [var inCategoryTest](#inCategoryTest)
    * [var inPropTest](#inPropTest)
* [Types](#type)
    * [type caseT struct](#caseT)
    * [type T struct](#T)
* [Functions](#func)
    * [func TestDigit(t *testing.T)](#TestDigit)
    * [func TestDigitOptimization(t *testing.T)](#TestDigitOptimization)
    * [func Example_is()](#Example_is)
    * [func ExampleSimpleFold()](#ExampleSimpleFold)
    * [func ExampleTo()](#ExampleTo)
    * [func ExampleToLower()](#ExampleToLower)
    * [func ExampleToTitle()](#ExampleToTitle)
    * [func ExampleToUpper()](#ExampleToUpper)
    * [func ExampleSpecialCase()](#ExampleSpecialCase)
    * [func TestIsControlLatin1(t *testing.T)](#TestIsControlLatin1)
    * [func TestIsLetterLatin1(t *testing.T)](#TestIsLetterLatin1)
    * [func TestIsUpperLatin1(t *testing.T)](#TestIsUpperLatin1)
    * [func TestIsLowerLatin1(t *testing.T)](#TestIsLowerLatin1)
    * [func TestNumberLatin1(t *testing.T)](#TestNumberLatin1)
    * [func TestIsPrintLatin1(t *testing.T)](#TestIsPrintLatin1)
    * [func TestIsGraphicLatin1(t *testing.T)](#TestIsGraphicLatin1)
    * [func TestIsPunctLatin1(t *testing.T)](#TestIsPunctLatin1)
    * [func TestIsSpaceLatin1(t *testing.T)](#TestIsSpaceLatin1)
    * [func TestIsSymbolLatin1(t *testing.T)](#TestIsSymbolLatin1)
    * [func TestIsLetter(t *testing.T)](#TestIsLetter)
    * [func TestIsUpper(t *testing.T)](#TestIsUpper)
    * [func caseString(c int) string](#caseString)
    * [func TestTo(t *testing.T)](#TestTo)
    * [func TestToUpperCase(t *testing.T)](#TestToUpperCase)
    * [func TestToLowerCase(t *testing.T)](#TestToLowerCase)
    * [func TestToTitleCase(t *testing.T)](#TestToTitleCase)
    * [func TestIsSpace(t *testing.T)](#TestIsSpace)
    * [func TestLetterOptimizations(t *testing.T)](#TestLetterOptimizations)
    * [func TestTurkishCase(t *testing.T)](#TestTurkishCase)
    * [func TestSimpleFold(t *testing.T)](#TestSimpleFold)
    * [func TestCalibrate(t *testing.T)](#TestCalibrate)
    * [func fakeTable(n int) []Range16](#fakeTable)
    * [func linear(ranges []Range16, r uint16) bool](#linear)
    * [func binary(ranges []Range16, r uint16) bool](#binary)
    * [func TestLatinOffset(t *testing.T)](#TestLatinOffset)
    * [func TestSpecialCaseNoMapping(t *testing.T)](#TestSpecialCaseNoMapping)
    * [func TestNegativeRune(t *testing.T)](#TestNegativeRune)
    * [func TestCategories(t *testing.T)](#TestCategories)
    * [func TestProperties(t *testing.T)](#TestProperties)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="testDigit" href="#testDigit">var testDigit</a>

```
searchKey: unicode_test.testDigit
tags: [private]
```

```Go
var testDigit = ...
```

### <a id="testLetter" href="#testLetter">var testLetter</a>

```
searchKey: unicode_test.testLetter
tags: [private]
```

```Go
var testLetter = ...
```

### <a id="upperTest" href="#upperTest">var upperTest</a>

```
searchKey: unicode_test.upperTest
tags: [private]
```

```Go
var upperTest = ...
```

### <a id="notupperTest" href="#notupperTest">var notupperTest</a>

```
searchKey: unicode_test.notupperTest
tags: [private]
```

```Go
var notupperTest = ...
```

### <a id="letterTest" href="#letterTest">var letterTest</a>

```
searchKey: unicode_test.letterTest
tags: [private]
```

```Go
var letterTest = ...
```

### <a id="notletterTest" href="#notletterTest">var notletterTest</a>

```
searchKey: unicode_test.notletterTest
tags: [private]
```

```Go
var notletterTest = ...
```

### <a id="spaceTest" href="#spaceTest">var spaceTest</a>

```
searchKey: unicode_test.spaceTest
tags: [private]
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

### <a id="caseTest" href="#caseTest">var caseTest</a>

```
searchKey: unicode_test.caseTest
tags: [private]
```

```Go
var caseTest = ...
```

### <a id="simpleFoldTests" href="#simpleFoldTests">var simpleFoldTests</a>

```
searchKey: unicode_test.simpleFoldTests
tags: [private]
```

```Go
var simpleFoldTests = ...
```

### <a id="calibrate" href="#calibrate">var calibrate</a>

```
searchKey: unicode_test.calibrate
tags: [private]
```

```Go
var calibrate = flag.Bool("calibrate", false, "compute crossover for linear vs. binary search")
```

### <a id="inCategoryTest" href="#inCategoryTest">var inCategoryTest</a>

```
searchKey: unicode_test.inCategoryTest
tags: [private]
```

```Go
var inCategoryTest = ...
```

### <a id="inPropTest" href="#inPropTest">var inPropTest</a>

```
searchKey: unicode_test.inPropTest
tags: [private]
```

```Go
var inPropTest = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="caseT" href="#caseT">type caseT struct</a>

```
searchKey: unicode_test.caseT
tags: [private]
```

```Go
type caseT struct {
	cas     int
	in, out rune
}
```

### <a id="T" href="#T">type T struct</a>

```
searchKey: unicode_test.T
tags: [private]
```

```Go
type T struct {
	rune   rune
	script string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestDigit" href="#TestDigit">func TestDigit(t *testing.T)</a>

```
searchKey: unicode_test.TestDigit
tags: [private]
```

```Go
func TestDigit(t *testing.T)
```

### <a id="TestDigitOptimization" href="#TestDigitOptimization">func TestDigitOptimization(t *testing.T)</a>

```
searchKey: unicode_test.TestDigitOptimization
tags: [private]
```

```Go
func TestDigitOptimization(t *testing.T)
```

Test that the special case in IsDigit agrees with the table 

### <a id="Example_is" href="#Example_is">func Example_is()</a>

```
searchKey: unicode_test.Example_is
tags: [private]
```

```Go
func Example_is()
```

Functions starting with "Is" can be used to inspect which table of range a rune belongs to. Note that runes may fit into more than one range. 

### <a id="ExampleSimpleFold" href="#ExampleSimpleFold">func ExampleSimpleFold()</a>

```
searchKey: unicode_test.ExampleSimpleFold
tags: [private]
```

```Go
func ExampleSimpleFold()
```

### <a id="ExampleTo" href="#ExampleTo">func ExampleTo()</a>

```
searchKey: unicode_test.ExampleTo
tags: [private]
```

```Go
func ExampleTo()
```

### <a id="ExampleToLower" href="#ExampleToLower">func ExampleToLower()</a>

```
searchKey: unicode_test.ExampleToLower
tags: [private]
```

```Go
func ExampleToLower()
```

### <a id="ExampleToTitle" href="#ExampleToTitle">func ExampleToTitle()</a>

```
searchKey: unicode_test.ExampleToTitle
tags: [private]
```

```Go
func ExampleToTitle()
```

### <a id="ExampleToUpper" href="#ExampleToUpper">func ExampleToUpper()</a>

```
searchKey: unicode_test.ExampleToUpper
tags: [private]
```

```Go
func ExampleToUpper()
```

### <a id="ExampleSpecialCase" href="#ExampleSpecialCase">func ExampleSpecialCase()</a>

```
searchKey: unicode_test.ExampleSpecialCase
tags: [private]
```

```Go
func ExampleSpecialCase()
```

### <a id="TestIsControlLatin1" href="#TestIsControlLatin1">func TestIsControlLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsControlLatin1
tags: [private]
```

```Go
func TestIsControlLatin1(t *testing.T)
```

### <a id="TestIsLetterLatin1" href="#TestIsLetterLatin1">func TestIsLetterLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsLetterLatin1
tags: [private]
```

```Go
func TestIsLetterLatin1(t *testing.T)
```

### <a id="TestIsUpperLatin1" href="#TestIsUpperLatin1">func TestIsUpperLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsUpperLatin1
tags: [private]
```

```Go
func TestIsUpperLatin1(t *testing.T)
```

### <a id="TestIsLowerLatin1" href="#TestIsLowerLatin1">func TestIsLowerLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsLowerLatin1
tags: [private]
```

```Go
func TestIsLowerLatin1(t *testing.T)
```

### <a id="TestNumberLatin1" href="#TestNumberLatin1">func TestNumberLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestNumberLatin1
tags: [private]
```

```Go
func TestNumberLatin1(t *testing.T)
```

### <a id="TestIsPrintLatin1" href="#TestIsPrintLatin1">func TestIsPrintLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsPrintLatin1
tags: [private]
```

```Go
func TestIsPrintLatin1(t *testing.T)
```

### <a id="TestIsGraphicLatin1" href="#TestIsGraphicLatin1">func TestIsGraphicLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsGraphicLatin1
tags: [private]
```

```Go
func TestIsGraphicLatin1(t *testing.T)
```

### <a id="TestIsPunctLatin1" href="#TestIsPunctLatin1">func TestIsPunctLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsPunctLatin1
tags: [private]
```

```Go
func TestIsPunctLatin1(t *testing.T)
```

### <a id="TestIsSpaceLatin1" href="#TestIsSpaceLatin1">func TestIsSpaceLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsSpaceLatin1
tags: [private]
```

```Go
func TestIsSpaceLatin1(t *testing.T)
```

### <a id="TestIsSymbolLatin1" href="#TestIsSymbolLatin1">func TestIsSymbolLatin1(t *testing.T)</a>

```
searchKey: unicode_test.TestIsSymbolLatin1
tags: [private]
```

```Go
func TestIsSymbolLatin1(t *testing.T)
```

### <a id="TestIsLetter" href="#TestIsLetter">func TestIsLetter(t *testing.T)</a>

```
searchKey: unicode_test.TestIsLetter
tags: [private]
```

```Go
func TestIsLetter(t *testing.T)
```

### <a id="TestIsUpper" href="#TestIsUpper">func TestIsUpper(t *testing.T)</a>

```
searchKey: unicode_test.TestIsUpper
tags: [private]
```

```Go
func TestIsUpper(t *testing.T)
```

### <a id="caseString" href="#caseString">func caseString(c int) string</a>

```
searchKey: unicode_test.caseString
tags: [private]
```

```Go
func caseString(c int) string
```

### <a id="TestTo" href="#TestTo">func TestTo(t *testing.T)</a>

```
searchKey: unicode_test.TestTo
tags: [private]
```

```Go
func TestTo(t *testing.T)
```

### <a id="TestToUpperCase" href="#TestToUpperCase">func TestToUpperCase(t *testing.T)</a>

```
searchKey: unicode_test.TestToUpperCase
tags: [private]
```

```Go
func TestToUpperCase(t *testing.T)
```

### <a id="TestToLowerCase" href="#TestToLowerCase">func TestToLowerCase(t *testing.T)</a>

```
searchKey: unicode_test.TestToLowerCase
tags: [private]
```

```Go
func TestToLowerCase(t *testing.T)
```

### <a id="TestToTitleCase" href="#TestToTitleCase">func TestToTitleCase(t *testing.T)</a>

```
searchKey: unicode_test.TestToTitleCase
tags: [private]
```

```Go
func TestToTitleCase(t *testing.T)
```

### <a id="TestIsSpace" href="#TestIsSpace">func TestIsSpace(t *testing.T)</a>

```
searchKey: unicode_test.TestIsSpace
tags: [private]
```

```Go
func TestIsSpace(t *testing.T)
```

### <a id="TestLetterOptimizations" href="#TestLetterOptimizations">func TestLetterOptimizations(t *testing.T)</a>

```
searchKey: unicode_test.TestLetterOptimizations
tags: [private]
```

```Go
func TestLetterOptimizations(t *testing.T)
```

Check that the optimizations for IsLetter etc. agree with the tables. We only need to check the Latin-1 range. 

### <a id="TestTurkishCase" href="#TestTurkishCase">func TestTurkishCase(t *testing.T)</a>

```
searchKey: unicode_test.TestTurkishCase
tags: [private]
```

```Go
func TestTurkishCase(t *testing.T)
```

### <a id="TestSimpleFold" href="#TestSimpleFold">func TestSimpleFold(t *testing.T)</a>

```
searchKey: unicode_test.TestSimpleFold
tags: [private]
```

```Go
func TestSimpleFold(t *testing.T)
```

### <a id="TestCalibrate" href="#TestCalibrate">func TestCalibrate(t *testing.T)</a>

```
searchKey: unicode_test.TestCalibrate
tags: [private]
```

```Go
func TestCalibrate(t *testing.T)
```

### <a id="fakeTable" href="#fakeTable">func fakeTable(n int) []Range16</a>

```
searchKey: unicode_test.fakeTable
tags: [private]
```

```Go
func fakeTable(n int) []Range16
```

### <a id="linear" href="#linear">func linear(ranges []Range16, r uint16) bool</a>

```
searchKey: unicode_test.linear
tags: [private]
```

```Go
func linear(ranges []Range16, r uint16) bool
```

### <a id="binary" href="#binary">func binary(ranges []Range16, r uint16) bool</a>

```
searchKey: unicode_test.binary
tags: [private]
```

```Go
func binary(ranges []Range16, r uint16) bool
```

### <a id="TestLatinOffset" href="#TestLatinOffset">func TestLatinOffset(t *testing.T)</a>

```
searchKey: unicode_test.TestLatinOffset
tags: [private]
```

```Go
func TestLatinOffset(t *testing.T)
```

### <a id="TestSpecialCaseNoMapping" href="#TestSpecialCaseNoMapping">func TestSpecialCaseNoMapping(t *testing.T)</a>

```
searchKey: unicode_test.TestSpecialCaseNoMapping
tags: [private]
```

```Go
func TestSpecialCaseNoMapping(t *testing.T)
```

### <a id="TestNegativeRune" href="#TestNegativeRune">func TestNegativeRune(t *testing.T)</a>

```
searchKey: unicode_test.TestNegativeRune
tags: [private]
```

```Go
func TestNegativeRune(t *testing.T)
```

### <a id="TestCategories" href="#TestCategories">func TestCategories(t *testing.T)</a>

```
searchKey: unicode_test.TestCategories
tags: [private]
```

```Go
func TestCategories(t *testing.T)
```

### <a id="TestProperties" href="#TestProperties">func TestProperties(t *testing.T)</a>

```
searchKey: unicode_test.TestProperties
tags: [private]
```

```Go
func TestProperties(t *testing.T)
```

