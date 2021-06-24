# Package strconv_test

## Index

* [Constants](#const)
    * [const above1e23](#above1e23)
    * [const below1e23](#below1e23)
* [Variables](#var)
    * [var BenchSink](#BenchSink)
    * [var appendBoolTests](#appendBoolTests)
    * [var atobtests](#atobtests)
    * [var atof32tests](#atof32tests)
    * [var atofOnce](#atofOnce)
    * [var atofRandomTests](#atofRandomTests)
    * [var atoftests](#atoftests)
    * [var benchQuoteBuf](#benchQuoteBuf)
    * [var benchQuoteRuneBuf](#benchQuoteRuneBuf)
    * [var benchmarksRandomBits](#benchmarksRandomBits)
    * [var benchmarksRandomNormal](#benchmarksRandomNormal)
    * [var boolString](#boolString)
    * [var canbackquotetests](#canbackquotetests)
    * [var ftoaBenches](#ftoaBenches)
    * [var ftoatests](#ftoatests)
    * [var globalBuf](#globalBuf)
    * [var inf0m](#inf0m)
    * [var inf0p](#inf0p)
    * [var infm0](#infm0)
    * [var infmm](#infmm)
    * [var infmp](#infmp)
    * [var infp0](#infp0)
    * [var infpm](#infpm)
    * [var infpp](#infpp)
    * [var itob64tests](#itob64tests)
    * [var mallocTest](#mallocTest)
    * [var misquoted](#misquoted)
    * [var nextToOne](#nextToOne)
    * [var numErrorTests](#numErrorTests)
    * [var oneMB](#oneMB)
    * [var parseBaseTests](#parseBaseTests)
    * [var parseBitSizeTests](#parseBitSizeTests)
    * [var parseInt32Tests](#parseInt32Tests)
    * [var parseInt64BaseTests](#parseInt64BaseTests)
    * [var parseInt64Tests](#parseInt64Tests)
    * [var parseUint32Tests](#parseUint32Tests)
    * [var parseUint64BaseTests](#parseUint64BaseTests)
    * [var parseUint64Tests](#parseUint64Tests)
    * [var quoterunetests](#quoterunetests)
    * [var quotetests](#quotetests)
    * [var roundTripCases](#roundTripCases)
    * [var roundinttests](#roundinttests)
    * [var roundtests](#roundtests)
    * [var shifttests](#shifttests)
    * [var uitob64tests](#uitob64tests)
    * [var unquotetests](#unquotetests)
    * [var varlenUints](#varlenUints)
* [Types](#type)
    * [type appendBoolTest struct](#appendBoolTest)
    * [type atobTest struct](#atobTest)
    * [type atocTest struct](#atocTest)
    * [type atofSimpleTest struct](#atofSimpleTest)
    * [type atofTest struct](#atofTest)
    * [type benchCase struct](#benchCase)
    * [type canBackquoteTest struct](#canBackquoteTest)
    * [type ftoaTest struct](#ftoaTest)
    * [type itob64Test struct](#itob64Test)
    * [type numErrorTest struct](#numErrorTest)
    * [type parseErrorTest struct](#parseErrorTest)
    * [type parseInt32Test struct](#parseInt32Test)
    * [type parseInt64BaseTest struct](#parseInt64BaseTest)
    * [type parseInt64Test struct](#parseInt64Test)
    * [type parseUint32Test struct](#parseUint32Test)
    * [type parseUint64BaseTest struct](#parseUint64BaseTest)
    * [type parseUint64Test struct](#parseUint64Test)
    * [type quoteRuneTest struct](#quoteRuneTest)
    * [type quoteTest struct](#quoteTest)
    * [type roundIntTest struct](#roundIntTest)
    * [type roundTest struct](#roundTest)
    * [type shiftTest struct](#shiftTest)
    * [type uitob64Test struct](#uitob64Test)
    * [type unQuoteTest struct](#unQuoteTest)
* [Functions](#func)
    * [func BenchmarkAppendFloat(b *testing.B)](#BenchmarkAppendFloat)
    * [func BenchmarkAppendInt(b *testing.B)](#BenchmarkAppendInt)
    * [func BenchmarkAppendIntSmall(b *testing.B)](#BenchmarkAppendIntSmall)
    * [func BenchmarkAppendQuote(b *testing.B)](#BenchmarkAppendQuote)
    * [func BenchmarkAppendQuoteRune(b *testing.B)](#BenchmarkAppendQuoteRune)
    * [func BenchmarkAppendUint(b *testing.B)](#BenchmarkAppendUint)
    * [func BenchmarkAppendUintVarlen(b *testing.B)](#BenchmarkAppendUintVarlen)
    * [func BenchmarkAtof32Decimal(b *testing.B)](#BenchmarkAtof32Decimal)
    * [func BenchmarkAtof32Float(b *testing.B)](#BenchmarkAtof32Float)
    * [func BenchmarkAtof32FloatExp(b *testing.B)](#BenchmarkAtof32FloatExp)
    * [func BenchmarkAtof32Random(b *testing.B)](#BenchmarkAtof32Random)
    * [func BenchmarkAtof32RandomLong(b *testing.B)](#BenchmarkAtof32RandomLong)
    * [func BenchmarkAtof64Big(b *testing.B)](#BenchmarkAtof64Big)
    * [func BenchmarkAtof64Decimal(b *testing.B)](#BenchmarkAtof64Decimal)
    * [func BenchmarkAtof64Float(b *testing.B)](#BenchmarkAtof64Float)
    * [func BenchmarkAtof64FloatExp(b *testing.B)](#BenchmarkAtof64FloatExp)
    * [func BenchmarkAtof64RandomBits(b *testing.B)](#BenchmarkAtof64RandomBits)
    * [func BenchmarkAtof64RandomFloats(b *testing.B)](#BenchmarkAtof64RandomFloats)
    * [func BenchmarkAtof64RandomLongFloats(b *testing.B)](#BenchmarkAtof64RandomLongFloats)
    * [func BenchmarkAtoi(b *testing.B)](#BenchmarkAtoi)
    * [func BenchmarkFormatFloat(b *testing.B)](#BenchmarkFormatFloat)
    * [func BenchmarkFormatInt(b *testing.B)](#BenchmarkFormatInt)
    * [func BenchmarkFormatIntSmall(b *testing.B)](#BenchmarkFormatIntSmall)
    * [func BenchmarkFormatUint(b *testing.B)](#BenchmarkFormatUint)
    * [func BenchmarkParseInt(b *testing.B)](#BenchmarkParseInt)
    * [func BenchmarkQuote(b *testing.B)](#BenchmarkQuote)
    * [func BenchmarkQuoteRune(b *testing.B)](#BenchmarkQuoteRune)
    * [func BenchmarkUnquoteEasy(b *testing.B)](#BenchmarkUnquoteEasy)
    * [func BenchmarkUnquoteHard(b *testing.B)](#BenchmarkUnquoteHard)
    * [func ExampleAppendBool()](#ExampleAppendBool)
    * [func ExampleAppendFloat()](#ExampleAppendFloat)
    * [func ExampleAppendInt()](#ExampleAppendInt)
    * [func ExampleAppendQuote()](#ExampleAppendQuote)
    * [func ExampleAppendQuoteRune()](#ExampleAppendQuoteRune)
    * [func ExampleAppendQuoteRuneToASCII()](#ExampleAppendQuoteRuneToASCII)
    * [func ExampleAppendQuoteToASCII()](#ExampleAppendQuoteToASCII)
    * [func ExampleAppendUint()](#ExampleAppendUint)
    * [func ExampleAtoi()](#ExampleAtoi)
    * [func ExampleCanBackquote()](#ExampleCanBackquote)
    * [func ExampleFormatBool()](#ExampleFormatBool)
    * [func ExampleFormatFloat()](#ExampleFormatFloat)
    * [func ExampleFormatInt()](#ExampleFormatInt)
    * [func ExampleFormatUint()](#ExampleFormatUint)
    * [func ExampleIsGraphic()](#ExampleIsGraphic)
    * [func ExampleIsPrint()](#ExampleIsPrint)
    * [func ExampleItoa()](#ExampleItoa)
    * [func ExampleNumError()](#ExampleNumError)
    * [func ExampleParseBool()](#ExampleParseBool)
    * [func ExampleParseFloat()](#ExampleParseFloat)
    * [func ExampleParseInt()](#ExampleParseInt)
    * [func ExampleParseUint()](#ExampleParseUint)
    * [func ExampleQuote()](#ExampleQuote)
    * [func ExampleQuoteRune()](#ExampleQuoteRune)
    * [func ExampleQuoteRuneToASCII()](#ExampleQuoteRuneToASCII)
    * [func ExampleQuoteRuneToGraphic()](#ExampleQuoteRuneToGraphic)
    * [func ExampleQuoteToASCII()](#ExampleQuoteToASCII)
    * [func ExampleQuoteToGraphic()](#ExampleQuoteToGraphic)
    * [func ExampleUnquote()](#ExampleUnquote)
    * [func ExampleUnquoteChar()](#ExampleUnquoteChar)
    * [func TestAppendBool(t *testing.T)](#TestAppendBool)
    * [func TestAtof(t *testing.T)](#TestAtof)
    * [func TestAtofRandom(t *testing.T)](#TestAtofRandom)
    * [func TestAtofSlow(t *testing.T)](#TestAtofSlow)
    * [func TestAtoi(t *testing.T)](#TestAtoi)
    * [func TestCanBackquote(t *testing.T)](#TestCanBackquote)
    * [func TestCountMallocs(t *testing.T)](#TestCountMallocs)
    * [func TestDecimalRound(t *testing.T)](#TestDecimalRound)
    * [func TestDecimalRoundedInteger(t *testing.T)](#TestDecimalRoundedInteger)
    * [func TestDecimalShift(t *testing.T)](#TestDecimalShift)
    * [func TestErrorPrefixes(t *testing.T)](#TestErrorPrefixes)
    * [func TestFormatBool(t *testing.T)](#TestFormatBool)
    * [func TestFormatComplex(t *testing.T)](#TestFormatComplex)
    * [func TestFormatComplexInvalidBitSize(t *testing.T)](#TestFormatComplexInvalidBitSize)
    * [func TestFormatFloatInvalidBitSize(t *testing.T)](#TestFormatFloatInvalidBitSize)
    * [func TestFormatUintVarlen(t *testing.T)](#TestFormatUintVarlen)
    * [func TestFp(t *testing.T)](#TestFp)
    * [func TestFtoa(t *testing.T)](#TestFtoa)
    * [func TestFtoaPowersOfTwo(t *testing.T)](#TestFtoaPowersOfTwo)
    * [func TestFtoaRandom(t *testing.T)](#TestFtoaRandom)
    * [func TestIsGraphic(t *testing.T)](#TestIsGraphic)
    * [func TestIsPrint(t *testing.T)](#TestIsPrint)
    * [func TestItoa(t *testing.T)](#TestItoa)
    * [func TestMulByLog10Log2(t *testing.T)](#TestMulByLog10Log2)
    * [func TestMulByLog2Log10(t *testing.T)](#TestMulByLog2Log10)
    * [func TestNumError(t *testing.T)](#TestNumError)
    * [func TestNumErrorUnwrap(t *testing.T)](#TestNumErrorUnwrap)
    * [func TestParseBool(t *testing.T)](#TestParseBool)
    * [func TestParseComplex(t *testing.T)](#TestParseComplex)
    * [func TestParseComplexIncorrectBitSize(t *testing.T)](#TestParseComplexIncorrectBitSize)
    * [func TestParseFloatIncorrectBitSize(t *testing.T)](#TestParseFloatIncorrectBitSize)
    * [func TestParseFloatPrefix(t *testing.T)](#TestParseFloatPrefix)
    * [func TestParseInt(t *testing.T)](#TestParseInt)
    * [func TestParseInt32(t *testing.T)](#TestParseInt32)
    * [func TestParseInt64(t *testing.T)](#TestParseInt64)
    * [func TestParseInt64Base(t *testing.T)](#TestParseInt64Base)
    * [func TestParseIntBase(t *testing.T)](#TestParseIntBase)
    * [func TestParseIntBitSize(t *testing.T)](#TestParseIntBitSize)
    * [func TestParseUint(t *testing.T)](#TestParseUint)
    * [func TestParseUint32(t *testing.T)](#TestParseUint32)
    * [func TestParseUint64(t *testing.T)](#TestParseUint64)
    * [func TestParseUint64Base(t *testing.T)](#TestParseUint64Base)
    * [func TestParseUintBase(t *testing.T)](#TestParseUintBase)
    * [func TestParseUintBitSize(t *testing.T)](#TestParseUintBitSize)
    * [func TestQuote(t *testing.T)](#TestQuote)
    * [func TestQuoteRune(t *testing.T)](#TestQuoteRune)
    * [func TestQuoteRuneToASCII(t *testing.T)](#TestQuoteRuneToASCII)
    * [func TestQuoteRuneToGraphic(t *testing.T)](#TestQuoteRuneToGraphic)
    * [func TestQuoteToASCII(t *testing.T)](#TestQuoteToASCII)
    * [func TestQuoteToGraphic(t *testing.T)](#TestQuoteToGraphic)
    * [func TestRoundTrip(t *testing.T)](#TestRoundTrip)
    * [func TestRoundTrip32(t *testing.T)](#TestRoundTrip32)
    * [func TestUitoa(t *testing.T)](#TestUitoa)
    * [func TestUnquote(t *testing.T)](#TestUnquote)
    * [func TestUnquoteInvalidUTF8(t *testing.T)](#TestUnquoteInvalidUTF8)
    * [func baseErrStub(name string, base int) error](#baseErrStub)
    * [func benchmarkAtoi(b *testing.B, neg int)](#benchmarkAtoi)
    * [func benchmarkParseInt(b *testing.B, neg int)](#benchmarkParseInt)
    * [func bitSizeErrStub(name string, bitSize int) error](#bitSizeErrStub)
    * [func equalError(a, b error) bool](#equalError)
    * [func fdiv(a, b float64) float64](#fdiv)
    * [func init()](#init.atoi_test.go)
    * [func initAtof()](#initAtof)
    * [func initAtofOnce()](#initAtofOnce)
    * [func myatof32(s string) (f float32, ok bool)](#myatof32)
    * [func myatof64(s string) (f float64, ok bool)](#myatof64)
    * [func noErrStub(name string, arg int) error](#noErrStub)
    * [func pow2(i int) float64](#pow2)
    * [func testAtof(t *testing.T, opt bool)](#testAtof)
    * [func testUnquote(t *testing.T, in, want string, wantErr error)](#testUnquote)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="above1e23" href="#above1e23">const above1e23</a>

```
searchKey: strconv_test.above1e23
tags: [constant number private]
```

```Go
const above1e23 = 100000000000000008388608
```

### <a id="below1e23" href="#below1e23">const below1e23</a>

```
searchKey: strconv_test.below1e23
tags: [constant number private]
```

```Go
const below1e23 = 99999999999999974834176
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="BenchSink" href="#BenchSink">var BenchSink</a>

```
searchKey: strconv_test.BenchSink
tags: [variable number private]
```

```Go
var BenchSink int // make sure compiler cannot optimize away benchmarks

```

### <a id="appendBoolTests" href="#appendBoolTests">var appendBoolTests</a>

```
searchKey: strconv_test.appendBoolTests
tags: [variable array struct private]
```

```Go
var appendBoolTests = ...
```

### <a id="atobtests" href="#atobtests">var atobtests</a>

```
searchKey: strconv_test.atobtests
tags: [variable array struct private]
```

```Go
var atobtests = ...
```

### <a id="atof32tests" href="#atof32tests">var atof32tests</a>

```
searchKey: strconv_test.atof32tests
tags: [variable array struct private]
```

```Go
var atof32tests = ...
```

### <a id="atofOnce" href="#atofOnce">var atofOnce</a>

```
searchKey: strconv_test.atofOnce
tags: [variable struct private]
```

```Go
var atofOnce sync.Once
```

### <a id="atofRandomTests" href="#atofRandomTests">var atofRandomTests</a>

```
searchKey: strconv_test.atofRandomTests
tags: [variable array struct private]
```

```Go
var atofRandomTests []atofSimpleTest
```

### <a id="atoftests" href="#atoftests">var atoftests</a>

```
searchKey: strconv_test.atoftests
tags: [variable array struct private]
```

```Go
var atoftests = ...
```

### <a id="benchQuoteBuf" href="#benchQuoteBuf">var benchQuoteBuf</a>

```
searchKey: strconv_test.benchQuoteBuf
tags: [variable array number private]
```

```Go
var benchQuoteBuf []byte
```

### <a id="benchQuoteRuneBuf" href="#benchQuoteRuneBuf">var benchQuoteRuneBuf</a>

```
searchKey: strconv_test.benchQuoteRuneBuf
tags: [variable array number private]
```

```Go
var benchQuoteRuneBuf []byte
```

### <a id="benchmarksRandomBits" href="#benchmarksRandomBits">var benchmarksRandomBits</a>

```
searchKey: strconv_test.benchmarksRandomBits
tags: [variable array string private]
```

```Go
var benchmarksRandomBits [1024]string
```

### <a id="benchmarksRandomNormal" href="#benchmarksRandomNormal">var benchmarksRandomNormal</a>

```
searchKey: strconv_test.benchmarksRandomNormal
tags: [variable array string private]
```

```Go
var benchmarksRandomNormal [1024]string
```

### <a id="boolString" href="#boolString">var boolString</a>

```
searchKey: strconv_test.boolString
tags: [variable object private]
```

```Go
var boolString = map[bool]string{
	true:  "true",
	false: "false",
}
```

### <a id="canbackquotetests" href="#canbackquotetests">var canbackquotetests</a>

```
searchKey: strconv_test.canbackquotetests
tags: [variable array struct private]
```

```Go
var canbackquotetests = ...
```

### <a id="ftoaBenches" href="#ftoaBenches">var ftoaBenches</a>

```
searchKey: strconv_test.ftoaBenches
tags: [variable array struct private]
```

```Go
var ftoaBenches = ...
```

### <a id="ftoatests" href="#ftoatests">var ftoatests</a>

```
searchKey: strconv_test.ftoatests
tags: [variable array struct private]
```

```Go
var ftoatests = ...
```

### <a id="globalBuf" href="#globalBuf">var globalBuf</a>

```
searchKey: strconv_test.globalBuf
tags: [variable array number private]
```

```Go
var globalBuf [64]byte
```

### <a id="inf0m" href="#inf0m">var inf0m</a>

```
searchKey: strconv_test.inf0m
tags: [variable number private]
```

```Go
var inf0m = complex(0, math.Inf(-1))
```

### <a id="inf0p" href="#inf0p">var inf0p</a>

```
searchKey: strconv_test.inf0p
tags: [variable number private]
```

```Go
var inf0p = complex(0, math.Inf(+1))
```

### <a id="infm0" href="#infm0">var infm0</a>

```
searchKey: strconv_test.infm0
tags: [variable number private]
```

```Go
var infm0 = complex(math.Inf(-1), 0)
```

### <a id="infmm" href="#infmm">var infmm</a>

```
searchKey: strconv_test.infmm
tags: [variable number private]
```

```Go
var infmm = complex(math.Inf(-1), math.Inf(-1))
```

### <a id="infmp" href="#infmp">var infmp</a>

```
searchKey: strconv_test.infmp
tags: [variable number private]
```

```Go
var infmp = complex(math.Inf(-1), math.Inf(+1))
```

### <a id="infp0" href="#infp0">var infp0</a>

```
searchKey: strconv_test.infp0
tags: [variable number private]
```

```Go
var infp0 = complex(math.Inf(+1), 0)
```

### <a id="infpm" href="#infpm">var infpm</a>

```
searchKey: strconv_test.infpm
tags: [variable number private]
```

```Go
var infpm = complex(math.Inf(+1), math.Inf(-1))
```

### <a id="infpp" href="#infpp">var infpp</a>

```
searchKey: strconv_test.infpp
tags: [variable number private]
```

```Go
var infpp = complex(math.Inf(+1), math.Inf(+1))
```

### <a id="itob64tests" href="#itob64tests">var itob64tests</a>

```
searchKey: strconv_test.itob64tests
tags: [variable array struct private]
```

```Go
var itob64tests = ...
```

### <a id="mallocTest" href="#mallocTest">var mallocTest</a>

```
searchKey: strconv_test.mallocTest
tags: [variable array struct private]
```

```Go
var mallocTest = ...
```

### <a id="misquoted" href="#misquoted">var misquoted</a>

```
searchKey: strconv_test.misquoted
tags: [variable array string private]
```

```Go
var misquoted = ...
```

### <a id="nextToOne" href="#nextToOne">var nextToOne</a>

```
searchKey: strconv_test.nextToOne
tags: [variable string private]
```

```Go
var nextToOne = ...
```

### <a id="numErrorTests" href="#numErrorTests">var numErrorTests</a>

```
searchKey: strconv_test.numErrorTests
tags: [variable array struct private]
```

```Go
var numErrorTests = ...
```

### <a id="oneMB" href="#oneMB">var oneMB</a>

```
searchKey: strconv_test.oneMB
tags: [variable array number private]
```

```Go
var oneMB []byte // Will be allocated to 1MB of random data by TestCountMallocs.

```

### <a id="parseBaseTests" href="#parseBaseTests">var parseBaseTests</a>

```
searchKey: strconv_test.parseBaseTests
tags: [variable array struct private]
```

```Go
var parseBaseTests = ...
```

### <a id="parseBitSizeTests" href="#parseBitSizeTests">var parseBitSizeTests</a>

```
searchKey: strconv_test.parseBitSizeTests
tags: [variable array struct private]
```

```Go
var parseBitSizeTests = ...
```

### <a id="parseInt32Tests" href="#parseInt32Tests">var parseInt32Tests</a>

```
searchKey: strconv_test.parseInt32Tests
tags: [variable array struct private]
```

```Go
var parseInt32Tests = ...
```

### <a id="parseInt64BaseTests" href="#parseInt64BaseTests">var parseInt64BaseTests</a>

```
searchKey: strconv_test.parseInt64BaseTests
tags: [variable array struct private]
```

```Go
var parseInt64BaseTests = ...
```

### <a id="parseInt64Tests" href="#parseInt64Tests">var parseInt64Tests</a>

```
searchKey: strconv_test.parseInt64Tests
tags: [variable array struct private]
```

```Go
var parseInt64Tests = ...
```

### <a id="parseUint32Tests" href="#parseUint32Tests">var parseUint32Tests</a>

```
searchKey: strconv_test.parseUint32Tests
tags: [variable array struct private]
```

```Go
var parseUint32Tests = ...
```

### <a id="parseUint64BaseTests" href="#parseUint64BaseTests">var parseUint64BaseTests</a>

```
searchKey: strconv_test.parseUint64BaseTests
tags: [variable array struct private]
```

```Go
var parseUint64BaseTests = ...
```

### <a id="parseUint64Tests" href="#parseUint64Tests">var parseUint64Tests</a>

```
searchKey: strconv_test.parseUint64Tests
tags: [variable array struct private]
```

```Go
var parseUint64Tests = ...
```

### <a id="quoterunetests" href="#quoterunetests">var quoterunetests</a>

```
searchKey: strconv_test.quoterunetests
tags: [variable array struct private]
```

```Go
var quoterunetests = ...
```

### <a id="quotetests" href="#quotetests">var quotetests</a>

```
searchKey: strconv_test.quotetests
tags: [variable array struct private]
```

```Go
var quotetests = ...
```

### <a id="roundTripCases" href="#roundTripCases">var roundTripCases</a>

```
searchKey: strconv_test.roundTripCases
tags: [variable array struct private]
```

```Go
var roundTripCases = ...
```

### <a id="roundinttests" href="#roundinttests">var roundinttests</a>

```
searchKey: strconv_test.roundinttests
tags: [variable array struct private]
```

```Go
var roundinttests = ...
```

### <a id="roundtests" href="#roundtests">var roundtests</a>

```
searchKey: strconv_test.roundtests
tags: [variable array struct private]
```

```Go
var roundtests = ...
```

### <a id="shifttests" href="#shifttests">var shifttests</a>

```
searchKey: strconv_test.shifttests
tags: [variable array struct private]
```

```Go
var shifttests = ...
```

### <a id="uitob64tests" href="#uitob64tests">var uitob64tests</a>

```
searchKey: strconv_test.uitob64tests
tags: [variable array struct private]
```

```Go
var uitob64tests = ...
```

### <a id="unquotetests" href="#unquotetests">var unquotetests</a>

```
searchKey: strconv_test.unquotetests
tags: [variable array struct private]
```

```Go
var unquotetests = ...
```

### <a id="varlenUints" href="#varlenUints">var varlenUints</a>

```
searchKey: strconv_test.varlenUints
tags: [variable array struct private]
```

```Go
var varlenUints = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="appendBoolTest" href="#appendBoolTest">type appendBoolTest struct</a>

```
searchKey: strconv_test.appendBoolTest
tags: [struct private]
```

```Go
type appendBoolTest struct {
	b   bool
	in  []byte
	out []byte
}
```

### <a id="atobTest" href="#atobTest">type atobTest struct</a>

```
searchKey: strconv_test.atobTest
tags: [struct private]
```

```Go
type atobTest struct {
	in  string
	out bool
	err error
}
```

### <a id="atocTest" href="#atocTest">type atocTest struct</a>

```
searchKey: strconv_test.atocTest
tags: [struct private]
```

```Go
type atocTest struct {
	in  string
	out complex128
	err error
}
```

### <a id="atofSimpleTest" href="#atofSimpleTest">type atofSimpleTest struct</a>

```
searchKey: strconv_test.atofSimpleTest
tags: [struct private]
```

```Go
type atofSimpleTest struct {
	x float64
	s string
}
```

### <a id="atofTest" href="#atofTest">type atofTest struct</a>

```
searchKey: strconv_test.atofTest
tags: [struct private]
```

```Go
type atofTest struct {
	in  string
	out string
	err error
}
```

### <a id="benchCase" href="#benchCase">type benchCase struct</a>

```
searchKey: strconv_test.benchCase
tags: [struct private]
```

```Go
type benchCase struct {
	name string
	num  int64
}
```

### <a id="canBackquoteTest" href="#canBackquoteTest">type canBackquoteTest struct</a>

```
searchKey: strconv_test.canBackquoteTest
tags: [struct private]
```

```Go
type canBackquoteTest struct {
	in  string
	out bool
}
```

### <a id="ftoaTest" href="#ftoaTest">type ftoaTest struct</a>

```
searchKey: strconv_test.ftoaTest
tags: [struct private]
```

```Go
type ftoaTest struct {
	f    float64
	fmt  byte
	prec int
	s    string
}
```

### <a id="itob64Test" href="#itob64Test">type itob64Test struct</a>

```
searchKey: strconv_test.itob64Test
tags: [struct private]
```

```Go
type itob64Test struct {
	in   int64
	base int
	out  string
}
```

### <a id="numErrorTest" href="#numErrorTest">type numErrorTest struct</a>

```
searchKey: strconv_test.numErrorTest
tags: [struct private]
```

```Go
type numErrorTest struct {
	num, want string
}
```

### <a id="parseErrorTest" href="#parseErrorTest">type parseErrorTest struct</a>

```
searchKey: strconv_test.parseErrorTest
tags: [struct private]
```

```Go
type parseErrorTest struct {
	arg     int
	errStub func(name string, arg int) error
}
```

### <a id="parseInt32Test" href="#parseInt32Test">type parseInt32Test struct</a>

```
searchKey: strconv_test.parseInt32Test
tags: [struct private]
```

```Go
type parseInt32Test struct {
	in  string
	out int32
	err error
}
```

### <a id="parseInt64BaseTest" href="#parseInt64BaseTest">type parseInt64BaseTest struct</a>

```
searchKey: strconv_test.parseInt64BaseTest
tags: [struct private]
```

```Go
type parseInt64BaseTest struct {
	in   string
	base int
	out  int64
	err  error
}
```

### <a id="parseInt64Test" href="#parseInt64Test">type parseInt64Test struct</a>

```
searchKey: strconv_test.parseInt64Test
tags: [struct private]
```

```Go
type parseInt64Test struct {
	in  string
	out int64
	err error
}
```

### <a id="parseUint32Test" href="#parseUint32Test">type parseUint32Test struct</a>

```
searchKey: strconv_test.parseUint32Test
tags: [struct private]
```

```Go
type parseUint32Test struct {
	in  string
	out uint32
	err error
}
```

### <a id="parseUint64BaseTest" href="#parseUint64BaseTest">type parseUint64BaseTest struct</a>

```
searchKey: strconv_test.parseUint64BaseTest
tags: [struct private]
```

```Go
type parseUint64BaseTest struct {
	in   string
	base int
	out  uint64
	err  error
}
```

### <a id="parseUint64Test" href="#parseUint64Test">type parseUint64Test struct</a>

```
searchKey: strconv_test.parseUint64Test
tags: [struct private]
```

```Go
type parseUint64Test struct {
	in  string
	out uint64
	err error
}
```

### <a id="quoteRuneTest" href="#quoteRuneTest">type quoteRuneTest struct</a>

```
searchKey: strconv_test.quoteRuneTest
tags: [struct private]
```

```Go
type quoteRuneTest struct {
	in      rune
	out     string
	ascii   string
	graphic string
}
```

### <a id="quoteTest" href="#quoteTest">type quoteTest struct</a>

```
searchKey: strconv_test.quoteTest
tags: [struct private]
```

```Go
type quoteTest struct {
	in      string
	out     string
	ascii   string
	graphic string
}
```

### <a id="roundIntTest" href="#roundIntTest">type roundIntTest struct</a>

```
searchKey: strconv_test.roundIntTest
tags: [struct private]
```

```Go
type roundIntTest struct {
	i     uint64
	shift int
	int   uint64
}
```

### <a id="roundTest" href="#roundTest">type roundTest struct</a>

```
searchKey: strconv_test.roundTest
tags: [struct private]
```

```Go
type roundTest struct {
	i               uint64
	nd              int
	down, round, up string
	int             uint64
}
```

### <a id="shiftTest" href="#shiftTest">type shiftTest struct</a>

```
searchKey: strconv_test.shiftTest
tags: [struct private]
```

```Go
type shiftTest struct {
	i     uint64
	shift int
	out   string
}
```

### <a id="uitob64Test" href="#uitob64Test">type uitob64Test struct</a>

```
searchKey: strconv_test.uitob64Test
tags: [struct private]
```

```Go
type uitob64Test struct {
	in   uint64
	base int
	out  string
}
```

### <a id="unQuoteTest" href="#unQuoteTest">type unQuoteTest struct</a>

```
searchKey: strconv_test.unQuoteTest
tags: [struct private]
```

```Go
type unQuoteTest struct {
	in  string
	out string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="BenchmarkAppendFloat" href="#BenchmarkAppendFloat">func BenchmarkAppendFloat(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAppendFloat
tags: [method private benchmark]
```

```Go
func BenchmarkAppendFloat(b *testing.B)
```

### <a id="BenchmarkAppendInt" href="#BenchmarkAppendInt">func BenchmarkAppendInt(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAppendInt
tags: [method private benchmark]
```

```Go
func BenchmarkAppendInt(b *testing.B)
```

### <a id="BenchmarkAppendIntSmall" href="#BenchmarkAppendIntSmall">func BenchmarkAppendIntSmall(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAppendIntSmall
tags: [method private benchmark]
```

```Go
func BenchmarkAppendIntSmall(b *testing.B)
```

### <a id="BenchmarkAppendQuote" href="#BenchmarkAppendQuote">func BenchmarkAppendQuote(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAppendQuote
tags: [method private benchmark]
```

```Go
func BenchmarkAppendQuote(b *testing.B)
```

### <a id="BenchmarkAppendQuoteRune" href="#BenchmarkAppendQuoteRune">func BenchmarkAppendQuoteRune(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAppendQuoteRune
tags: [method private benchmark]
```

```Go
func BenchmarkAppendQuoteRune(b *testing.B)
```

### <a id="BenchmarkAppendUint" href="#BenchmarkAppendUint">func BenchmarkAppendUint(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAppendUint
tags: [method private benchmark]
```

```Go
func BenchmarkAppendUint(b *testing.B)
```

### <a id="BenchmarkAppendUintVarlen" href="#BenchmarkAppendUintVarlen">func BenchmarkAppendUintVarlen(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAppendUintVarlen
tags: [method private benchmark]
```

```Go
func BenchmarkAppendUintVarlen(b *testing.B)
```

### <a id="BenchmarkAtof32Decimal" href="#BenchmarkAtof32Decimal">func BenchmarkAtof32Decimal(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAtof32Decimal
tags: [method private benchmark]
```

```Go
func BenchmarkAtof32Decimal(b *testing.B)
```

### <a id="BenchmarkAtof32Float" href="#BenchmarkAtof32Float">func BenchmarkAtof32Float(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAtof32Float
tags: [method private benchmark]
```

```Go
func BenchmarkAtof32Float(b *testing.B)
```

### <a id="BenchmarkAtof32FloatExp" href="#BenchmarkAtof32FloatExp">func BenchmarkAtof32FloatExp(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAtof32FloatExp
tags: [method private benchmark]
```

```Go
func BenchmarkAtof32FloatExp(b *testing.B)
```

### <a id="BenchmarkAtof32Random" href="#BenchmarkAtof32Random">func BenchmarkAtof32Random(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAtof32Random
tags: [method private benchmark]
```

```Go
func BenchmarkAtof32Random(b *testing.B)
```

### <a id="BenchmarkAtof32RandomLong" href="#BenchmarkAtof32RandomLong">func BenchmarkAtof32RandomLong(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAtof32RandomLong
tags: [method private benchmark]
```

```Go
func BenchmarkAtof32RandomLong(b *testing.B)
```

### <a id="BenchmarkAtof64Big" href="#BenchmarkAtof64Big">func BenchmarkAtof64Big(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAtof64Big
tags: [method private benchmark]
```

```Go
func BenchmarkAtof64Big(b *testing.B)
```

### <a id="BenchmarkAtof64Decimal" href="#BenchmarkAtof64Decimal">func BenchmarkAtof64Decimal(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAtof64Decimal
tags: [method private benchmark]
```

```Go
func BenchmarkAtof64Decimal(b *testing.B)
```

### <a id="BenchmarkAtof64Float" href="#BenchmarkAtof64Float">func BenchmarkAtof64Float(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAtof64Float
tags: [method private benchmark]
```

```Go
func BenchmarkAtof64Float(b *testing.B)
```

### <a id="BenchmarkAtof64FloatExp" href="#BenchmarkAtof64FloatExp">func BenchmarkAtof64FloatExp(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAtof64FloatExp
tags: [method private benchmark]
```

```Go
func BenchmarkAtof64FloatExp(b *testing.B)
```

### <a id="BenchmarkAtof64RandomBits" href="#BenchmarkAtof64RandomBits">func BenchmarkAtof64RandomBits(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAtof64RandomBits
tags: [method private benchmark]
```

```Go
func BenchmarkAtof64RandomBits(b *testing.B)
```

### <a id="BenchmarkAtof64RandomFloats" href="#BenchmarkAtof64RandomFloats">func BenchmarkAtof64RandomFloats(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAtof64RandomFloats
tags: [method private benchmark]
```

```Go
func BenchmarkAtof64RandomFloats(b *testing.B)
```

### <a id="BenchmarkAtof64RandomLongFloats" href="#BenchmarkAtof64RandomLongFloats">func BenchmarkAtof64RandomLongFloats(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAtof64RandomLongFloats
tags: [method private benchmark]
```

```Go
func BenchmarkAtof64RandomLongFloats(b *testing.B)
```

### <a id="BenchmarkAtoi" href="#BenchmarkAtoi">func BenchmarkAtoi(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkAtoi
tags: [method private benchmark]
```

```Go
func BenchmarkAtoi(b *testing.B)
```

### <a id="BenchmarkFormatFloat" href="#BenchmarkFormatFloat">func BenchmarkFormatFloat(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkFormatFloat
tags: [method private benchmark]
```

```Go
func BenchmarkFormatFloat(b *testing.B)
```

### <a id="BenchmarkFormatInt" href="#BenchmarkFormatInt">func BenchmarkFormatInt(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkFormatInt
tags: [method private benchmark]
```

```Go
func BenchmarkFormatInt(b *testing.B)
```

### <a id="BenchmarkFormatIntSmall" href="#BenchmarkFormatIntSmall">func BenchmarkFormatIntSmall(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkFormatIntSmall
tags: [method private benchmark]
```

```Go
func BenchmarkFormatIntSmall(b *testing.B)
```

### <a id="BenchmarkFormatUint" href="#BenchmarkFormatUint">func BenchmarkFormatUint(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkFormatUint
tags: [method private benchmark]
```

```Go
func BenchmarkFormatUint(b *testing.B)
```

### <a id="BenchmarkParseInt" href="#BenchmarkParseInt">func BenchmarkParseInt(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkParseInt
tags: [method private benchmark]
```

```Go
func BenchmarkParseInt(b *testing.B)
```

### <a id="BenchmarkQuote" href="#BenchmarkQuote">func BenchmarkQuote(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkQuote
tags: [method private benchmark]
```

```Go
func BenchmarkQuote(b *testing.B)
```

### <a id="BenchmarkQuoteRune" href="#BenchmarkQuoteRune">func BenchmarkQuoteRune(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkQuoteRune
tags: [method private benchmark]
```

```Go
func BenchmarkQuoteRune(b *testing.B)
```

### <a id="BenchmarkUnquoteEasy" href="#BenchmarkUnquoteEasy">func BenchmarkUnquoteEasy(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkUnquoteEasy
tags: [method private benchmark]
```

```Go
func BenchmarkUnquoteEasy(b *testing.B)
```

### <a id="BenchmarkUnquoteHard" href="#BenchmarkUnquoteHard">func BenchmarkUnquoteHard(b *testing.B)</a>

```
searchKey: strconv_test.BenchmarkUnquoteHard
tags: [method private benchmark]
```

```Go
func BenchmarkUnquoteHard(b *testing.B)
```

### <a id="ExampleAppendBool" href="#ExampleAppendBool">func ExampleAppendBool()</a>

```
searchKey: strconv_test.ExampleAppendBool
tags: [function private]
```

```Go
func ExampleAppendBool()
```

### <a id="ExampleAppendFloat" href="#ExampleAppendFloat">func ExampleAppendFloat()</a>

```
searchKey: strconv_test.ExampleAppendFloat
tags: [function private]
```

```Go
func ExampleAppendFloat()
```

### <a id="ExampleAppendInt" href="#ExampleAppendInt">func ExampleAppendInt()</a>

```
searchKey: strconv_test.ExampleAppendInt
tags: [function private]
```

```Go
func ExampleAppendInt()
```

### <a id="ExampleAppendQuote" href="#ExampleAppendQuote">func ExampleAppendQuote()</a>

```
searchKey: strconv_test.ExampleAppendQuote
tags: [function private]
```

```Go
func ExampleAppendQuote()
```

### <a id="ExampleAppendQuoteRune" href="#ExampleAppendQuoteRune">func ExampleAppendQuoteRune()</a>

```
searchKey: strconv_test.ExampleAppendQuoteRune
tags: [function private]
```

```Go
func ExampleAppendQuoteRune()
```

### <a id="ExampleAppendQuoteRuneToASCII" href="#ExampleAppendQuoteRuneToASCII">func ExampleAppendQuoteRuneToASCII()</a>

```
searchKey: strconv_test.ExampleAppendQuoteRuneToASCII
tags: [function private]
```

```Go
func ExampleAppendQuoteRuneToASCII()
```

### <a id="ExampleAppendQuoteToASCII" href="#ExampleAppendQuoteToASCII">func ExampleAppendQuoteToASCII()</a>

```
searchKey: strconv_test.ExampleAppendQuoteToASCII
tags: [function private]
```

```Go
func ExampleAppendQuoteToASCII()
```

### <a id="ExampleAppendUint" href="#ExampleAppendUint">func ExampleAppendUint()</a>

```
searchKey: strconv_test.ExampleAppendUint
tags: [function private]
```

```Go
func ExampleAppendUint()
```

### <a id="ExampleAtoi" href="#ExampleAtoi">func ExampleAtoi()</a>

```
searchKey: strconv_test.ExampleAtoi
tags: [function private]
```

```Go
func ExampleAtoi()
```

### <a id="ExampleCanBackquote" href="#ExampleCanBackquote">func ExampleCanBackquote()</a>

```
searchKey: strconv_test.ExampleCanBackquote
tags: [function private]
```

```Go
func ExampleCanBackquote()
```

### <a id="ExampleFormatBool" href="#ExampleFormatBool">func ExampleFormatBool()</a>

```
searchKey: strconv_test.ExampleFormatBool
tags: [function private]
```

```Go
func ExampleFormatBool()
```

### <a id="ExampleFormatFloat" href="#ExampleFormatFloat">func ExampleFormatFloat()</a>

```
searchKey: strconv_test.ExampleFormatFloat
tags: [function private]
```

```Go
func ExampleFormatFloat()
```

### <a id="ExampleFormatInt" href="#ExampleFormatInt">func ExampleFormatInt()</a>

```
searchKey: strconv_test.ExampleFormatInt
tags: [function private]
```

```Go
func ExampleFormatInt()
```

### <a id="ExampleFormatUint" href="#ExampleFormatUint">func ExampleFormatUint()</a>

```
searchKey: strconv_test.ExampleFormatUint
tags: [function private]
```

```Go
func ExampleFormatUint()
```

### <a id="ExampleIsGraphic" href="#ExampleIsGraphic">func ExampleIsGraphic()</a>

```
searchKey: strconv_test.ExampleIsGraphic
tags: [function private]
```

```Go
func ExampleIsGraphic()
```

### <a id="ExampleIsPrint" href="#ExampleIsPrint">func ExampleIsPrint()</a>

```
searchKey: strconv_test.ExampleIsPrint
tags: [function private]
```

```Go
func ExampleIsPrint()
```

### <a id="ExampleItoa" href="#ExampleItoa">func ExampleItoa()</a>

```
searchKey: strconv_test.ExampleItoa
tags: [function private]
```

```Go
func ExampleItoa()
```

### <a id="ExampleNumError" href="#ExampleNumError">func ExampleNumError()</a>

```
searchKey: strconv_test.ExampleNumError
tags: [function private]
```

```Go
func ExampleNumError()
```

### <a id="ExampleParseBool" href="#ExampleParseBool">func ExampleParseBool()</a>

```
searchKey: strconv_test.ExampleParseBool
tags: [function private]
```

```Go
func ExampleParseBool()
```

### <a id="ExampleParseFloat" href="#ExampleParseFloat">func ExampleParseFloat()</a>

```
searchKey: strconv_test.ExampleParseFloat
tags: [function private]
```

```Go
func ExampleParseFloat()
```

### <a id="ExampleParseInt" href="#ExampleParseInt">func ExampleParseInt()</a>

```
searchKey: strconv_test.ExampleParseInt
tags: [function private]
```

```Go
func ExampleParseInt()
```

### <a id="ExampleParseUint" href="#ExampleParseUint">func ExampleParseUint()</a>

```
searchKey: strconv_test.ExampleParseUint
tags: [function private]
```

```Go
func ExampleParseUint()
```

### <a id="ExampleQuote" href="#ExampleQuote">func ExampleQuote()</a>

```
searchKey: strconv_test.ExampleQuote
tags: [function private]
```

```Go
func ExampleQuote()
```

### <a id="ExampleQuoteRune" href="#ExampleQuoteRune">func ExampleQuoteRune()</a>

```
searchKey: strconv_test.ExampleQuoteRune
tags: [function private]
```

```Go
func ExampleQuoteRune()
```

### <a id="ExampleQuoteRuneToASCII" href="#ExampleQuoteRuneToASCII">func ExampleQuoteRuneToASCII()</a>

```
searchKey: strconv_test.ExampleQuoteRuneToASCII
tags: [function private]
```

```Go
func ExampleQuoteRuneToASCII()
```

### <a id="ExampleQuoteRuneToGraphic" href="#ExampleQuoteRuneToGraphic">func ExampleQuoteRuneToGraphic()</a>

```
searchKey: strconv_test.ExampleQuoteRuneToGraphic
tags: [function private]
```

```Go
func ExampleQuoteRuneToGraphic()
```

### <a id="ExampleQuoteToASCII" href="#ExampleQuoteToASCII">func ExampleQuoteToASCII()</a>

```
searchKey: strconv_test.ExampleQuoteToASCII
tags: [function private]
```

```Go
func ExampleQuoteToASCII()
```

### <a id="ExampleQuoteToGraphic" href="#ExampleQuoteToGraphic">func ExampleQuoteToGraphic()</a>

```
searchKey: strconv_test.ExampleQuoteToGraphic
tags: [function private]
```

```Go
func ExampleQuoteToGraphic()
```

### <a id="ExampleUnquote" href="#ExampleUnquote">func ExampleUnquote()</a>

```
searchKey: strconv_test.ExampleUnquote
tags: [function private]
```

```Go
func ExampleUnquote()
```

### <a id="ExampleUnquoteChar" href="#ExampleUnquoteChar">func ExampleUnquoteChar()</a>

```
searchKey: strconv_test.ExampleUnquoteChar
tags: [function private]
```

```Go
func ExampleUnquoteChar()
```

### <a id="TestAppendBool" href="#TestAppendBool">func TestAppendBool(t *testing.T)</a>

```
searchKey: strconv_test.TestAppendBool
tags: [method private test]
```

```Go
func TestAppendBool(t *testing.T)
```

### <a id="TestAtof" href="#TestAtof">func TestAtof(t *testing.T)</a>

```
searchKey: strconv_test.TestAtof
tags: [method private test]
```

```Go
func TestAtof(t *testing.T)
```

### <a id="TestAtofRandom" href="#TestAtofRandom">func TestAtofRandom(t *testing.T)</a>

```
searchKey: strconv_test.TestAtofRandom
tags: [method private test]
```

```Go
func TestAtofRandom(t *testing.T)
```

### <a id="TestAtofSlow" href="#TestAtofSlow">func TestAtofSlow(t *testing.T)</a>

```
searchKey: strconv_test.TestAtofSlow
tags: [method private test]
```

```Go
func TestAtofSlow(t *testing.T)
```

### <a id="TestAtoi" href="#TestAtoi">func TestAtoi(t *testing.T)</a>

```
searchKey: strconv_test.TestAtoi
tags: [method private test]
```

```Go
func TestAtoi(t *testing.T)
```

### <a id="TestCanBackquote" href="#TestCanBackquote">func TestCanBackquote(t *testing.T)</a>

```
searchKey: strconv_test.TestCanBackquote
tags: [method private test]
```

```Go
func TestCanBackquote(t *testing.T)
```

### <a id="TestCountMallocs" href="#TestCountMallocs">func TestCountMallocs(t *testing.T)</a>

```
searchKey: strconv_test.TestCountMallocs
tags: [method private test]
```

```Go
func TestCountMallocs(t *testing.T)
```

### <a id="TestDecimalRound" href="#TestDecimalRound">func TestDecimalRound(t *testing.T)</a>

```
searchKey: strconv_test.TestDecimalRound
tags: [method private test]
```

```Go
func TestDecimalRound(t *testing.T)
```

### <a id="TestDecimalRoundedInteger" href="#TestDecimalRoundedInteger">func TestDecimalRoundedInteger(t *testing.T)</a>

```
searchKey: strconv_test.TestDecimalRoundedInteger
tags: [method private test]
```

```Go
func TestDecimalRoundedInteger(t *testing.T)
```

### <a id="TestDecimalShift" href="#TestDecimalShift">func TestDecimalShift(t *testing.T)</a>

```
searchKey: strconv_test.TestDecimalShift
tags: [method private test]
```

```Go
func TestDecimalShift(t *testing.T)
```

### <a id="TestErrorPrefixes" href="#TestErrorPrefixes">func TestErrorPrefixes(t *testing.T)</a>

```
searchKey: strconv_test.TestErrorPrefixes
tags: [method private test]
```

```Go
func TestErrorPrefixes(t *testing.T)
```

### <a id="TestFormatBool" href="#TestFormatBool">func TestFormatBool(t *testing.T)</a>

```
searchKey: strconv_test.TestFormatBool
tags: [method private test]
```

```Go
func TestFormatBool(t *testing.T)
```

### <a id="TestFormatComplex" href="#TestFormatComplex">func TestFormatComplex(t *testing.T)</a>

```
searchKey: strconv_test.TestFormatComplex
tags: [method private test]
```

```Go
func TestFormatComplex(t *testing.T)
```

### <a id="TestFormatComplexInvalidBitSize" href="#TestFormatComplexInvalidBitSize">func TestFormatComplexInvalidBitSize(t *testing.T)</a>

```
searchKey: strconv_test.TestFormatComplexInvalidBitSize
tags: [method private test]
```

```Go
func TestFormatComplexInvalidBitSize(t *testing.T)
```

### <a id="TestFormatFloatInvalidBitSize" href="#TestFormatFloatInvalidBitSize">func TestFormatFloatInvalidBitSize(t *testing.T)</a>

```
searchKey: strconv_test.TestFormatFloatInvalidBitSize
tags: [method private test]
```

```Go
func TestFormatFloatInvalidBitSize(t *testing.T)
```

### <a id="TestFormatUintVarlen" href="#TestFormatUintVarlen">func TestFormatUintVarlen(t *testing.T)</a>

```
searchKey: strconv_test.TestFormatUintVarlen
tags: [method private test]
```

```Go
func TestFormatUintVarlen(t *testing.T)
```

### <a id="TestFp" href="#TestFp">func TestFp(t *testing.T)</a>

```
searchKey: strconv_test.TestFp
tags: [method private test]
```

```Go
func TestFp(t *testing.T)
```

### <a id="TestFtoa" href="#TestFtoa">func TestFtoa(t *testing.T)</a>

```
searchKey: strconv_test.TestFtoa
tags: [method private test]
```

```Go
func TestFtoa(t *testing.T)
```

### <a id="TestFtoaPowersOfTwo" href="#TestFtoaPowersOfTwo">func TestFtoaPowersOfTwo(t *testing.T)</a>

```
searchKey: strconv_test.TestFtoaPowersOfTwo
tags: [method private test]
```

```Go
func TestFtoaPowersOfTwo(t *testing.T)
```

### <a id="TestFtoaRandom" href="#TestFtoaRandom">func TestFtoaRandom(t *testing.T)</a>

```
searchKey: strconv_test.TestFtoaRandom
tags: [method private test]
```

```Go
func TestFtoaRandom(t *testing.T)
```

### <a id="TestIsGraphic" href="#TestIsGraphic">func TestIsGraphic(t *testing.T)</a>

```
searchKey: strconv_test.TestIsGraphic
tags: [method private test]
```

```Go
func TestIsGraphic(t *testing.T)
```

Verify that our IsGraphic agrees with unicode.IsGraphic. 

### <a id="TestIsPrint" href="#TestIsPrint">func TestIsPrint(t *testing.T)</a>

```
searchKey: strconv_test.TestIsPrint
tags: [method private test]
```

```Go
func TestIsPrint(t *testing.T)
```

Verify that our IsPrint agrees with unicode.IsPrint. 

### <a id="TestItoa" href="#TestItoa">func TestItoa(t *testing.T)</a>

```
searchKey: strconv_test.TestItoa
tags: [method private test]
```

```Go
func TestItoa(t *testing.T)
```

### <a id="TestMulByLog10Log2" href="#TestMulByLog10Log2">func TestMulByLog10Log2(t *testing.T)</a>

```
searchKey: strconv_test.TestMulByLog10Log2
tags: [method private test]
```

```Go
func TestMulByLog10Log2(t *testing.T)
```

### <a id="TestMulByLog2Log10" href="#TestMulByLog2Log10">func TestMulByLog2Log10(t *testing.T)</a>

```
searchKey: strconv_test.TestMulByLog2Log10
tags: [method private test]
```

```Go
func TestMulByLog2Log10(t *testing.T)
```

### <a id="TestNumError" href="#TestNumError">func TestNumError(t *testing.T)</a>

```
searchKey: strconv_test.TestNumError
tags: [method private test]
```

```Go
func TestNumError(t *testing.T)
```

### <a id="TestNumErrorUnwrap" href="#TestNumErrorUnwrap">func TestNumErrorUnwrap(t *testing.T)</a>

```
searchKey: strconv_test.TestNumErrorUnwrap
tags: [method private test]
```

```Go
func TestNumErrorUnwrap(t *testing.T)
```

### <a id="TestParseBool" href="#TestParseBool">func TestParseBool(t *testing.T)</a>

```
searchKey: strconv_test.TestParseBool
tags: [method private test]
```

```Go
func TestParseBool(t *testing.T)
```

### <a id="TestParseComplex" href="#TestParseComplex">func TestParseComplex(t *testing.T)</a>

```
searchKey: strconv_test.TestParseComplex
tags: [method private test]
```

```Go
func TestParseComplex(t *testing.T)
```

### <a id="TestParseComplexIncorrectBitSize" href="#TestParseComplexIncorrectBitSize">func TestParseComplexIncorrectBitSize(t *testing.T)</a>

```
searchKey: strconv_test.TestParseComplexIncorrectBitSize
tags: [method private test]
```

```Go
func TestParseComplexIncorrectBitSize(t *testing.T)
```

Issue 42297: allow ParseComplex(s, not_32_or_64) for legacy reasons 

### <a id="TestParseFloatIncorrectBitSize" href="#TestParseFloatIncorrectBitSize">func TestParseFloatIncorrectBitSize(t *testing.T)</a>

```
searchKey: strconv_test.TestParseFloatIncorrectBitSize
tags: [method private test]
```

```Go
func TestParseFloatIncorrectBitSize(t *testing.T)
```

Issue 42297: a lot of code in the wild accidentally calls ParseFloat(s, 10) or ParseFloat(s, 0), so allow bitSize values other than 32 and 64. 

### <a id="TestParseFloatPrefix" href="#TestParseFloatPrefix">func TestParseFloatPrefix(t *testing.T)</a>

```
searchKey: strconv_test.TestParseFloatPrefix
tags: [method private test]
```

```Go
func TestParseFloatPrefix(t *testing.T)
```

### <a id="TestParseInt" href="#TestParseInt">func TestParseInt(t *testing.T)</a>

```
searchKey: strconv_test.TestParseInt
tags: [method private test]
```

```Go
func TestParseInt(t *testing.T)
```

### <a id="TestParseInt32" href="#TestParseInt32">func TestParseInt32(t *testing.T)</a>

```
searchKey: strconv_test.TestParseInt32
tags: [method private test]
```

```Go
func TestParseInt32(t *testing.T)
```

### <a id="TestParseInt64" href="#TestParseInt64">func TestParseInt64(t *testing.T)</a>

```
searchKey: strconv_test.TestParseInt64
tags: [method private test]
```

```Go
func TestParseInt64(t *testing.T)
```

### <a id="TestParseInt64Base" href="#TestParseInt64Base">func TestParseInt64Base(t *testing.T)</a>

```
searchKey: strconv_test.TestParseInt64Base
tags: [method private test]
```

```Go
func TestParseInt64Base(t *testing.T)
```

### <a id="TestParseIntBase" href="#TestParseIntBase">func TestParseIntBase(t *testing.T)</a>

```
searchKey: strconv_test.TestParseIntBase
tags: [method private test]
```

```Go
func TestParseIntBase(t *testing.T)
```

### <a id="TestParseIntBitSize" href="#TestParseIntBitSize">func TestParseIntBitSize(t *testing.T)</a>

```
searchKey: strconv_test.TestParseIntBitSize
tags: [method private test]
```

```Go
func TestParseIntBitSize(t *testing.T)
```

### <a id="TestParseUint" href="#TestParseUint">func TestParseUint(t *testing.T)</a>

```
searchKey: strconv_test.TestParseUint
tags: [method private test]
```

```Go
func TestParseUint(t *testing.T)
```

### <a id="TestParseUint32" href="#TestParseUint32">func TestParseUint32(t *testing.T)</a>

```
searchKey: strconv_test.TestParseUint32
tags: [method private test]
```

```Go
func TestParseUint32(t *testing.T)
```

### <a id="TestParseUint64" href="#TestParseUint64">func TestParseUint64(t *testing.T)</a>

```
searchKey: strconv_test.TestParseUint64
tags: [method private test]
```

```Go
func TestParseUint64(t *testing.T)
```

### <a id="TestParseUint64Base" href="#TestParseUint64Base">func TestParseUint64Base(t *testing.T)</a>

```
searchKey: strconv_test.TestParseUint64Base
tags: [method private test]
```

```Go
func TestParseUint64Base(t *testing.T)
```

### <a id="TestParseUintBase" href="#TestParseUintBase">func TestParseUintBase(t *testing.T)</a>

```
searchKey: strconv_test.TestParseUintBase
tags: [method private test]
```

```Go
func TestParseUintBase(t *testing.T)
```

### <a id="TestParseUintBitSize" href="#TestParseUintBitSize">func TestParseUintBitSize(t *testing.T)</a>

```
searchKey: strconv_test.TestParseUintBitSize
tags: [method private test]
```

```Go
func TestParseUintBitSize(t *testing.T)
```

### <a id="TestQuote" href="#TestQuote">func TestQuote(t *testing.T)</a>

```
searchKey: strconv_test.TestQuote
tags: [method private test]
```

```Go
func TestQuote(t *testing.T)
```

### <a id="TestQuoteRune" href="#TestQuoteRune">func TestQuoteRune(t *testing.T)</a>

```
searchKey: strconv_test.TestQuoteRune
tags: [method private test]
```

```Go
func TestQuoteRune(t *testing.T)
```

### <a id="TestQuoteRuneToASCII" href="#TestQuoteRuneToASCII">func TestQuoteRuneToASCII(t *testing.T)</a>

```
searchKey: strconv_test.TestQuoteRuneToASCII
tags: [method private test]
```

```Go
func TestQuoteRuneToASCII(t *testing.T)
```

### <a id="TestQuoteRuneToGraphic" href="#TestQuoteRuneToGraphic">func TestQuoteRuneToGraphic(t *testing.T)</a>

```
searchKey: strconv_test.TestQuoteRuneToGraphic
tags: [method private test]
```

```Go
func TestQuoteRuneToGraphic(t *testing.T)
```

### <a id="TestQuoteToASCII" href="#TestQuoteToASCII">func TestQuoteToASCII(t *testing.T)</a>

```
searchKey: strconv_test.TestQuoteToASCII
tags: [method private test]
```

```Go
func TestQuoteToASCII(t *testing.T)
```

### <a id="TestQuoteToGraphic" href="#TestQuoteToGraphic">func TestQuoteToGraphic(t *testing.T)</a>

```
searchKey: strconv_test.TestQuoteToGraphic
tags: [method private test]
```

```Go
func TestQuoteToGraphic(t *testing.T)
```

### <a id="TestRoundTrip" href="#TestRoundTrip">func TestRoundTrip(t *testing.T)</a>

```
searchKey: strconv_test.TestRoundTrip
tags: [method private test]
```

```Go
func TestRoundTrip(t *testing.T)
```

### <a id="TestRoundTrip32" href="#TestRoundTrip32">func TestRoundTrip32(t *testing.T)</a>

```
searchKey: strconv_test.TestRoundTrip32
tags: [method private test]
```

```Go
func TestRoundTrip32(t *testing.T)
```

TestRoundTrip32 tries a fraction of all finite positive float32 values. 

### <a id="TestUitoa" href="#TestUitoa">func TestUitoa(t *testing.T)</a>

```
searchKey: strconv_test.TestUitoa
tags: [method private test]
```

```Go
func TestUitoa(t *testing.T)
```

### <a id="TestUnquote" href="#TestUnquote">func TestUnquote(t *testing.T)</a>

```
searchKey: strconv_test.TestUnquote
tags: [method private test]
```

```Go
func TestUnquote(t *testing.T)
```

### <a id="TestUnquoteInvalidUTF8" href="#TestUnquoteInvalidUTF8">func TestUnquoteInvalidUTF8(t *testing.T)</a>

```
searchKey: strconv_test.TestUnquoteInvalidUTF8
tags: [method private test]
```

```Go
func TestUnquoteInvalidUTF8(t *testing.T)
```

Issue 23685: invalid UTF-8 should not go through the fast path. 

### <a id="baseErrStub" href="#baseErrStub">func baseErrStub(name string, base int) error</a>

```
searchKey: strconv_test.baseErrStub
tags: [method private]
```

```Go
func baseErrStub(name string, base int) error
```

### <a id="benchmarkAtoi" href="#benchmarkAtoi">func benchmarkAtoi(b *testing.B, neg int)</a>

```
searchKey: strconv_test.benchmarkAtoi
tags: [method private]
```

```Go
func benchmarkAtoi(b *testing.B, neg int)
```

### <a id="benchmarkParseInt" href="#benchmarkParseInt">func benchmarkParseInt(b *testing.B, neg int)</a>

```
searchKey: strconv_test.benchmarkParseInt
tags: [method private]
```

```Go
func benchmarkParseInt(b *testing.B, neg int)
```

### <a id="bitSizeErrStub" href="#bitSizeErrStub">func bitSizeErrStub(name string, bitSize int) error</a>

```
searchKey: strconv_test.bitSizeErrStub
tags: [method private]
```

```Go
func bitSizeErrStub(name string, bitSize int) error
```

### <a id="equalError" href="#equalError">func equalError(a, b error) bool</a>

```
searchKey: strconv_test.equalError
tags: [method private]
```

```Go
func equalError(a, b error) bool
```

### <a id="fdiv" href="#fdiv">func fdiv(a, b float64) float64</a>

```
searchKey: strconv_test.fdiv
tags: [method private]
```

```Go
func fdiv(a, b float64) float64
```

### <a id="init.atoi_test.go" href="#init.atoi_test.go">func init()</a>

```
searchKey: strconv_test.init
tags: [function private]
```

```Go
func init()
```

### <a id="initAtof" href="#initAtof">func initAtof()</a>

```
searchKey: strconv_test.initAtof
tags: [function private]
```

```Go
func initAtof()
```

### <a id="initAtofOnce" href="#initAtofOnce">func initAtofOnce()</a>

```
searchKey: strconv_test.initAtofOnce
tags: [function private]
```

```Go
func initAtofOnce()
```

### <a id="myatof32" href="#myatof32">func myatof32(s string) (f float32, ok bool)</a>

```
searchKey: strconv_test.myatof32
tags: [method private]
```

```Go
func myatof32(s string) (f float32, ok bool)
```

Wrapper around strconv.ParseFloat(x, 32).  Handles dddddp+ddd (binary exponent) itself, passes the rest on to strconv.ParseFloat. 

### <a id="myatof64" href="#myatof64">func myatof64(s string) (f float64, ok bool)</a>

```
searchKey: strconv_test.myatof64
tags: [method private]
```

```Go
func myatof64(s string) (f float64, ok bool)
```

Wrapper around strconv.ParseFloat(x, 64).  Handles dddddp+ddd (binary exponent) itself, passes the rest on to strconv.ParseFloat. 

### <a id="noErrStub" href="#noErrStub">func noErrStub(name string, arg int) error</a>

```
searchKey: strconv_test.noErrStub
tags: [method private]
```

```Go
func noErrStub(name string, arg int) error
```

### <a id="pow2" href="#pow2">func pow2(i int) float64</a>

```
searchKey: strconv_test.pow2
tags: [method private]
```

```Go
func pow2(i int) float64
```

### <a id="testAtof" href="#testAtof">func testAtof(t *testing.T, opt bool)</a>

```
searchKey: strconv_test.testAtof
tags: [method private]
```

```Go
func testAtof(t *testing.T, opt bool)
```

### <a id="testUnquote" href="#testUnquote">func testUnquote(t *testing.T, in, want string, wantErr error)</a>

```
searchKey: strconv_test.testUnquote
tags: [method private]
```

```Go
func testUnquote(t *testing.T, in, want string, wantErr error)
```

