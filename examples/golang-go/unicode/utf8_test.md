# Package utf8_test

## Index

* [Variables](#var)
    * [var utf8map](#utf8map)
    * [var surrogateMap](#surrogateMap)
    * [var testStrings](#testStrings)
    * [var invalidSequenceTests](#invalidSequenceTests)
    * [var runecounttests](#runecounttests)
    * [var runelentests](#runelentests)
    * [var validTests](#validTests)
    * [var validrunetests](#validrunetests)
    * [var boolSink](#boolSink)
* [Types](#type)
    * [type Utf8Map struct](#Utf8Map)
    * [type RuneCountTest struct](#RuneCountTest)
    * [type RuneLenTest struct](#RuneLenTest)
    * [type ValidTest struct](#ValidTest)
    * [type ValidRuneTest struct](#ValidRuneTest)
* [Functions](#func)
    * [func ExampleDecodeLastRune()](#ExampleDecodeLastRune)
    * [func ExampleDecodeLastRuneInString()](#ExampleDecodeLastRuneInString)
    * [func ExampleDecodeRune()](#ExampleDecodeRune)
    * [func ExampleDecodeRuneInString()](#ExampleDecodeRuneInString)
    * [func ExampleEncodeRune()](#ExampleEncodeRune)
    * [func ExampleEncodeRune_outOfRange()](#ExampleEncodeRune_outOfRange)
    * [func ExampleFullRune()](#ExampleFullRune)
    * [func ExampleFullRuneInString()](#ExampleFullRuneInString)
    * [func ExampleRuneCount()](#ExampleRuneCount)
    * [func ExampleRuneCountInString()](#ExampleRuneCountInString)
    * [func ExampleRuneLen()](#ExampleRuneLen)
    * [func ExampleRuneStart()](#ExampleRuneStart)
    * [func ExampleValid()](#ExampleValid)
    * [func ExampleValidRune()](#ExampleValidRune)
    * [func ExampleValidString()](#ExampleValidString)
    * [func init()](#init.utf8_test.go)
    * [func TestConstants(t *testing.T)](#TestConstants)
    * [func TestFullRune(t *testing.T)](#TestFullRune)
    * [func TestEncodeRune(t *testing.T)](#TestEncodeRune)
    * [func TestDecodeRune(t *testing.T)](#TestDecodeRune)
    * [func TestDecodeSurrogateRune(t *testing.T)](#TestDecodeSurrogateRune)
    * [func TestSequencing(t *testing.T)](#TestSequencing)
    * [func runtimeRuneCount(s string) int](#runtimeRuneCount)
    * [func TestRuntimeConversion(t *testing.T)](#TestRuntimeConversion)
    * [func runtimeDecodeRune(s string) rune](#runtimeDecodeRune)
    * [func TestDecodeInvalidSequence(t *testing.T)](#TestDecodeInvalidSequence)
    * [func testSequence(t *testing.T, s string)](#testSequence)
    * [func TestNegativeRune(t *testing.T)](#TestNegativeRune)
    * [func TestRuneCount(t *testing.T)](#TestRuneCount)
    * [func TestRuneLen(t *testing.T)](#TestRuneLen)
    * [func TestValid(t *testing.T)](#TestValid)
    * [func TestValidRune(t *testing.T)](#TestValidRune)
    * [func BenchmarkRuneCountTenASCIIChars(b *testing.B)](#BenchmarkRuneCountTenASCIIChars)
    * [func BenchmarkRuneCountTenJapaneseChars(b *testing.B)](#BenchmarkRuneCountTenJapaneseChars)
    * [func BenchmarkRuneCountInStringTenASCIIChars(b *testing.B)](#BenchmarkRuneCountInStringTenASCIIChars)
    * [func BenchmarkRuneCountInStringTenJapaneseChars(b *testing.B)](#BenchmarkRuneCountInStringTenJapaneseChars)
    * [func BenchmarkValidTenASCIIChars(b *testing.B)](#BenchmarkValidTenASCIIChars)
    * [func BenchmarkValidTenJapaneseChars(b *testing.B)](#BenchmarkValidTenJapaneseChars)
    * [func BenchmarkValidStringTenASCIIChars(b *testing.B)](#BenchmarkValidStringTenASCIIChars)
    * [func BenchmarkValidStringTenJapaneseChars(b *testing.B)](#BenchmarkValidStringTenJapaneseChars)
    * [func BenchmarkEncodeASCIIRune(b *testing.B)](#BenchmarkEncodeASCIIRune)
    * [func BenchmarkEncodeJapaneseRune(b *testing.B)](#BenchmarkEncodeJapaneseRune)
    * [func BenchmarkDecodeASCIIRune(b *testing.B)](#BenchmarkDecodeASCIIRune)
    * [func BenchmarkDecodeJapaneseRune(b *testing.B)](#BenchmarkDecodeJapaneseRune)
    * [func BenchmarkFullRune(b *testing.B)](#BenchmarkFullRune)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="utf8map" href="#utf8map">var utf8map</a>

```
searchKey: utf8_test.utf8map
tags: [private]
```

```Go
var utf8map = ...
```

### <a id="surrogateMap" href="#surrogateMap">var surrogateMap</a>

```
searchKey: utf8_test.surrogateMap
tags: [private]
```

```Go
var surrogateMap = []Utf8Map{
	{0xd800, "\xed\xa0\x80"},
	{0xdfff, "\xed\xbf\xbf"},
}
```

### <a id="testStrings" href="#testStrings">var testStrings</a>

```
searchKey: utf8_test.testStrings
tags: [private]
```

```Go
var testStrings = ...
```

### <a id="invalidSequenceTests" href="#invalidSequenceTests">var invalidSequenceTests</a>

```
searchKey: utf8_test.invalidSequenceTests
tags: [private]
```

```Go
var invalidSequenceTests = ...
```

### <a id="runecounttests" href="#runecounttests">var runecounttests</a>

```
searchKey: utf8_test.runecounttests
tags: [private]
```

```Go
var runecounttests = ...
```

### <a id="runelentests" href="#runelentests">var runelentests</a>

```
searchKey: utf8_test.runelentests
tags: [private]
```

```Go
var runelentests = ...
```

### <a id="validTests" href="#validTests">var validTests</a>

```
searchKey: utf8_test.validTests
tags: [private]
```

```Go
var validTests = ...
```

### <a id="validrunetests" href="#validrunetests">var validrunetests</a>

```
searchKey: utf8_test.validrunetests
tags: [private]
```

```Go
var validrunetests = ...
```

### <a id="boolSink" href="#boolSink">var boolSink</a>

```
searchKey: utf8_test.boolSink
tags: [private]
```

```Go
var boolSink bool
```

boolSink is used to reference the return value of benchmarked functions to avoid dead code elimination. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Utf8Map" href="#Utf8Map">type Utf8Map struct</a>

```
searchKey: utf8_test.Utf8Map
tags: [private]
```

```Go
type Utf8Map struct {
	r   rune
	str string
}
```

### <a id="RuneCountTest" href="#RuneCountTest">type RuneCountTest struct</a>

```
searchKey: utf8_test.RuneCountTest
tags: [private]
```

```Go
type RuneCountTest struct {
	in  string
	out int
}
```

### <a id="RuneLenTest" href="#RuneLenTest">type RuneLenTest struct</a>

```
searchKey: utf8_test.RuneLenTest
tags: [private]
```

```Go
type RuneLenTest struct {
	r    rune
	size int
}
```

### <a id="ValidTest" href="#ValidTest">type ValidTest struct</a>

```
searchKey: utf8_test.ValidTest
tags: [private]
```

```Go
type ValidTest struct {
	in  string
	out bool
}
```

### <a id="ValidRuneTest" href="#ValidRuneTest">type ValidRuneTest struct</a>

```
searchKey: utf8_test.ValidRuneTest
tags: [private]
```

```Go
type ValidRuneTest struct {
	r  rune
	ok bool
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ExampleDecodeLastRune" href="#ExampleDecodeLastRune">func ExampleDecodeLastRune()</a>

```
searchKey: utf8_test.ExampleDecodeLastRune
tags: [private]
```

```Go
func ExampleDecodeLastRune()
```

### <a id="ExampleDecodeLastRuneInString" href="#ExampleDecodeLastRuneInString">func ExampleDecodeLastRuneInString()</a>

```
searchKey: utf8_test.ExampleDecodeLastRuneInString
tags: [private]
```

```Go
func ExampleDecodeLastRuneInString()
```

### <a id="ExampleDecodeRune" href="#ExampleDecodeRune">func ExampleDecodeRune()</a>

```
searchKey: utf8_test.ExampleDecodeRune
tags: [private]
```

```Go
func ExampleDecodeRune()
```

### <a id="ExampleDecodeRuneInString" href="#ExampleDecodeRuneInString">func ExampleDecodeRuneInString()</a>

```
searchKey: utf8_test.ExampleDecodeRuneInString
tags: [private]
```

```Go
func ExampleDecodeRuneInString()
```

### <a id="ExampleEncodeRune" href="#ExampleEncodeRune">func ExampleEncodeRune()</a>

```
searchKey: utf8_test.ExampleEncodeRune
tags: [private]
```

```Go
func ExampleEncodeRune()
```

### <a id="ExampleEncodeRune_outOfRange" href="#ExampleEncodeRune_outOfRange">func ExampleEncodeRune_outOfRange()</a>

```
searchKey: utf8_test.ExampleEncodeRune_outOfRange
tags: [private]
```

```Go
func ExampleEncodeRune_outOfRange()
```

### <a id="ExampleFullRune" href="#ExampleFullRune">func ExampleFullRune()</a>

```
searchKey: utf8_test.ExampleFullRune
tags: [private]
```

```Go
func ExampleFullRune()
```

### <a id="ExampleFullRuneInString" href="#ExampleFullRuneInString">func ExampleFullRuneInString()</a>

```
searchKey: utf8_test.ExampleFullRuneInString
tags: [private]
```

```Go
func ExampleFullRuneInString()
```

### <a id="ExampleRuneCount" href="#ExampleRuneCount">func ExampleRuneCount()</a>

```
searchKey: utf8_test.ExampleRuneCount
tags: [private]
```

```Go
func ExampleRuneCount()
```

### <a id="ExampleRuneCountInString" href="#ExampleRuneCountInString">func ExampleRuneCountInString()</a>

```
searchKey: utf8_test.ExampleRuneCountInString
tags: [private]
```

```Go
func ExampleRuneCountInString()
```

### <a id="ExampleRuneLen" href="#ExampleRuneLen">func ExampleRuneLen()</a>

```
searchKey: utf8_test.ExampleRuneLen
tags: [private]
```

```Go
func ExampleRuneLen()
```

### <a id="ExampleRuneStart" href="#ExampleRuneStart">func ExampleRuneStart()</a>

```
searchKey: utf8_test.ExampleRuneStart
tags: [private]
```

```Go
func ExampleRuneStart()
```

### <a id="ExampleValid" href="#ExampleValid">func ExampleValid()</a>

```
searchKey: utf8_test.ExampleValid
tags: [private]
```

```Go
func ExampleValid()
```

### <a id="ExampleValidRune" href="#ExampleValidRune">func ExampleValidRune()</a>

```
searchKey: utf8_test.ExampleValidRune
tags: [private]
```

```Go
func ExampleValidRune()
```

### <a id="ExampleValidString" href="#ExampleValidString">func ExampleValidString()</a>

```
searchKey: utf8_test.ExampleValidString
tags: [private]
```

```Go
func ExampleValidString()
```

### <a id="init.utf8_test.go" href="#init.utf8_test.go">func init()</a>

```
searchKey: utf8_test.init
tags: [private]
```

```Go
func init()
```

Validate the constants redefined from unicode. 

### <a id="TestConstants" href="#TestConstants">func TestConstants(t *testing.T)</a>

```
searchKey: utf8_test.TestConstants
tags: [private]
```

```Go
func TestConstants(t *testing.T)
```

Validate the constants redefined from unicode. 

### <a id="TestFullRune" href="#TestFullRune">func TestFullRune(t *testing.T)</a>

```
searchKey: utf8_test.TestFullRune
tags: [private]
```

```Go
func TestFullRune(t *testing.T)
```

### <a id="TestEncodeRune" href="#TestEncodeRune">func TestEncodeRune(t *testing.T)</a>

```
searchKey: utf8_test.TestEncodeRune
tags: [private]
```

```Go
func TestEncodeRune(t *testing.T)
```

### <a id="TestDecodeRune" href="#TestDecodeRune">func TestDecodeRune(t *testing.T)</a>

```
searchKey: utf8_test.TestDecodeRune
tags: [private]
```

```Go
func TestDecodeRune(t *testing.T)
```

### <a id="TestDecodeSurrogateRune" href="#TestDecodeSurrogateRune">func TestDecodeSurrogateRune(t *testing.T)</a>

```
searchKey: utf8_test.TestDecodeSurrogateRune
tags: [private]
```

```Go
func TestDecodeSurrogateRune(t *testing.T)
```

### <a id="TestSequencing" href="#TestSequencing">func TestSequencing(t *testing.T)</a>

```
searchKey: utf8_test.TestSequencing
tags: [private]
```

```Go
func TestSequencing(t *testing.T)
```

Check that DecodeRune and DecodeLastRune correspond to the equivalent range loop. 

### <a id="runtimeRuneCount" href="#runtimeRuneCount">func runtimeRuneCount(s string) int</a>

```
searchKey: utf8_test.runtimeRuneCount
tags: [private]
```

```Go
func runtimeRuneCount(s string) int
```

### <a id="TestRuntimeConversion" href="#TestRuntimeConversion">func TestRuntimeConversion(t *testing.T)</a>

```
searchKey: utf8_test.TestRuntimeConversion
tags: [private]
```

```Go
func TestRuntimeConversion(t *testing.T)
```

Check that a range loop, len([]rune(string)) optimization and []rune conversions visit the same runes. Not really a test of this package, but the assumption is used here and it's good to verify. 

### <a id="runtimeDecodeRune" href="#runtimeDecodeRune">func runtimeDecodeRune(s string) rune</a>

```
searchKey: utf8_test.runtimeDecodeRune
tags: [private]
```

```Go
func runtimeDecodeRune(s string) rune
```

### <a id="TestDecodeInvalidSequence" href="#TestDecodeInvalidSequence">func TestDecodeInvalidSequence(t *testing.T)</a>

```
searchKey: utf8_test.TestDecodeInvalidSequence
tags: [private]
```

```Go
func TestDecodeInvalidSequence(t *testing.T)
```

### <a id="testSequence" href="#testSequence">func testSequence(t *testing.T, s string)</a>

```
searchKey: utf8_test.testSequence
tags: [private]
```

```Go
func testSequence(t *testing.T, s string)
```

### <a id="TestNegativeRune" href="#TestNegativeRune">func TestNegativeRune(t *testing.T)</a>

```
searchKey: utf8_test.TestNegativeRune
tags: [private]
```

```Go
func TestNegativeRune(t *testing.T)
```

Check that negative runes encode as U+FFFD. 

### <a id="TestRuneCount" href="#TestRuneCount">func TestRuneCount(t *testing.T)</a>

```
searchKey: utf8_test.TestRuneCount
tags: [private]
```

```Go
func TestRuneCount(t *testing.T)
```

### <a id="TestRuneLen" href="#TestRuneLen">func TestRuneLen(t *testing.T)</a>

```
searchKey: utf8_test.TestRuneLen
tags: [private]
```

```Go
func TestRuneLen(t *testing.T)
```

### <a id="TestValid" href="#TestValid">func TestValid(t *testing.T)</a>

```
searchKey: utf8_test.TestValid
tags: [private]
```

```Go
func TestValid(t *testing.T)
```

### <a id="TestValidRune" href="#TestValidRune">func TestValidRune(t *testing.T)</a>

```
searchKey: utf8_test.TestValidRune
tags: [private]
```

```Go
func TestValidRune(t *testing.T)
```

### <a id="BenchmarkRuneCountTenASCIIChars" href="#BenchmarkRuneCountTenASCIIChars">func BenchmarkRuneCountTenASCIIChars(b *testing.B)</a>

```
searchKey: utf8_test.BenchmarkRuneCountTenASCIIChars
tags: [private]
```

```Go
func BenchmarkRuneCountTenASCIIChars(b *testing.B)
```

### <a id="BenchmarkRuneCountTenJapaneseChars" href="#BenchmarkRuneCountTenJapaneseChars">func BenchmarkRuneCountTenJapaneseChars(b *testing.B)</a>

```
searchKey: utf8_test.BenchmarkRuneCountTenJapaneseChars
tags: [private]
```

```Go
func BenchmarkRuneCountTenJapaneseChars(b *testing.B)
```

### <a id="BenchmarkRuneCountInStringTenASCIIChars" href="#BenchmarkRuneCountInStringTenASCIIChars">func BenchmarkRuneCountInStringTenASCIIChars(b *testing.B)</a>

```
searchKey: utf8_test.BenchmarkRuneCountInStringTenASCIIChars
tags: [private]
```

```Go
func BenchmarkRuneCountInStringTenASCIIChars(b *testing.B)
```

### <a id="BenchmarkRuneCountInStringTenJapaneseChars" href="#BenchmarkRuneCountInStringTenJapaneseChars">func BenchmarkRuneCountInStringTenJapaneseChars(b *testing.B)</a>

```
searchKey: utf8_test.BenchmarkRuneCountInStringTenJapaneseChars
tags: [private]
```

```Go
func BenchmarkRuneCountInStringTenJapaneseChars(b *testing.B)
```

### <a id="BenchmarkValidTenASCIIChars" href="#BenchmarkValidTenASCIIChars">func BenchmarkValidTenASCIIChars(b *testing.B)</a>

```
searchKey: utf8_test.BenchmarkValidTenASCIIChars
tags: [private]
```

```Go
func BenchmarkValidTenASCIIChars(b *testing.B)
```

### <a id="BenchmarkValidTenJapaneseChars" href="#BenchmarkValidTenJapaneseChars">func BenchmarkValidTenJapaneseChars(b *testing.B)</a>

```
searchKey: utf8_test.BenchmarkValidTenJapaneseChars
tags: [private]
```

```Go
func BenchmarkValidTenJapaneseChars(b *testing.B)
```

### <a id="BenchmarkValidStringTenASCIIChars" href="#BenchmarkValidStringTenASCIIChars">func BenchmarkValidStringTenASCIIChars(b *testing.B)</a>

```
searchKey: utf8_test.BenchmarkValidStringTenASCIIChars
tags: [private]
```

```Go
func BenchmarkValidStringTenASCIIChars(b *testing.B)
```

### <a id="BenchmarkValidStringTenJapaneseChars" href="#BenchmarkValidStringTenJapaneseChars">func BenchmarkValidStringTenJapaneseChars(b *testing.B)</a>

```
searchKey: utf8_test.BenchmarkValidStringTenJapaneseChars
tags: [private]
```

```Go
func BenchmarkValidStringTenJapaneseChars(b *testing.B)
```

### <a id="BenchmarkEncodeASCIIRune" href="#BenchmarkEncodeASCIIRune">func BenchmarkEncodeASCIIRune(b *testing.B)</a>

```
searchKey: utf8_test.BenchmarkEncodeASCIIRune
tags: [private]
```

```Go
func BenchmarkEncodeASCIIRune(b *testing.B)
```

### <a id="BenchmarkEncodeJapaneseRune" href="#BenchmarkEncodeJapaneseRune">func BenchmarkEncodeJapaneseRune(b *testing.B)</a>

```
searchKey: utf8_test.BenchmarkEncodeJapaneseRune
tags: [private]
```

```Go
func BenchmarkEncodeJapaneseRune(b *testing.B)
```

### <a id="BenchmarkDecodeASCIIRune" href="#BenchmarkDecodeASCIIRune">func BenchmarkDecodeASCIIRune(b *testing.B)</a>

```
searchKey: utf8_test.BenchmarkDecodeASCIIRune
tags: [private]
```

```Go
func BenchmarkDecodeASCIIRune(b *testing.B)
```

### <a id="BenchmarkDecodeJapaneseRune" href="#BenchmarkDecodeJapaneseRune">func BenchmarkDecodeJapaneseRune(b *testing.B)</a>

```
searchKey: utf8_test.BenchmarkDecodeJapaneseRune
tags: [private]
```

```Go
func BenchmarkDecodeJapaneseRune(b *testing.B)
```

### <a id="BenchmarkFullRune" href="#BenchmarkFullRune">func BenchmarkFullRune(b *testing.B)</a>

```
searchKey: utf8_test.BenchmarkFullRune
tags: [private]
```

```Go
func BenchmarkFullRune(b *testing.B)
```

