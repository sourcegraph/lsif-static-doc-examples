# Package math_test

## Index

* [Constants](#const)
    * [const SmallestNormalFloat64](#SmallestNormalFloat64)
    * [const LargestSubnormalFloat64](#LargestSubnormalFloat64)
* [Variables](#var)
    * [var vf](#vf)
    * [var acos](#acos)
    * [var acosh](#acosh)
    * [var asin](#asin)
    * [var asinh](#asinh)
    * [var atan](#atan)
    * [var atanh](#atanh)
    * [var atan2](#atan2)
    * [var cbrt](#cbrt)
    * [var ceil](#ceil)
    * [var copysign](#copysign)
    * [var cos](#cos)
    * [var cosLarge](#cosLarge)
    * [var cosh](#cosh)
    * [var erf](#erf)
    * [var erfc](#erfc)
    * [var erfinv](#erfinv)
    * [var exp](#exp)
    * [var expm1](#expm1)
    * [var expm1Large](#expm1Large)
    * [var exp2](#exp2)
    * [var fabs](#fabs)
    * [var fdim](#fdim)
    * [var floor](#floor)
    * [var fmod](#fmod)
    * [var frexp](#frexp)
    * [var gamma](#gamma)
    * [var j0](#j0)
    * [var j1](#j1)
    * [var j2](#j2)
    * [var jM3](#jM3)
    * [var lgamma](#lgamma)
    * [var log](#log)
    * [var logb](#logb)
    * [var log10](#log10)
    * [var log1p](#log1p)
    * [var log2](#log2)
    * [var modf](#modf)
    * [var nextafter32](#nextafter32)
    * [var nextafter64](#nextafter64)
    * [var pow](#pow)
    * [var remainder](#remainder)
    * [var round](#round)
    * [var signbit](#signbit)
    * [var sin](#sin)
    * [var sinLarge](#sinLarge)
    * [var sinh](#sinh)
    * [var sqrt](#sqrt)
    * [var tan](#tan)
    * [var tanLarge](#tanLarge)
    * [var tanh](#tanh)
    * [var trunc](#trunc)
    * [var y0](#y0)
    * [var y1](#y1)
    * [var y2](#y2)
    * [var yM3](#yM3)
    * [var vfacosSC](#vfacosSC)
    * [var acosSC](#acosSC)
    * [var vfacoshSC](#vfacoshSC)
    * [var acoshSC](#acoshSC)
    * [var vfasinSC](#vfasinSC)
    * [var asinSC](#asinSC)
    * [var vfasinhSC](#vfasinhSC)
    * [var asinhSC](#asinhSC)
    * [var vfatanSC](#vfatanSC)
    * [var atanSC](#atanSC)
    * [var vfatanhSC](#vfatanhSC)
    * [var atanhSC](#atanhSC)
    * [var vfatan2SC](#vfatan2SC)
    * [var atan2SC](#atan2SC)
    * [var vfcbrtSC](#vfcbrtSC)
    * [var cbrtSC](#cbrtSC)
    * [var vfceilSC](#vfceilSC)
    * [var ceilSC](#ceilSC)
    * [var vfcopysignSC](#vfcopysignSC)
    * [var copysignSC](#copysignSC)
    * [var vfcosSC](#vfcosSC)
    * [var cosSC](#cosSC)
    * [var vfcoshSC](#vfcoshSC)
    * [var coshSC](#coshSC)
    * [var vferfSC](#vferfSC)
    * [var erfSC](#erfSC)
    * [var vferfcSC](#vferfcSC)
    * [var erfcSC](#erfcSC)
    * [var vferfinvSC](#vferfinvSC)
    * [var erfinvSC](#erfinvSC)
    * [var vferfcinvSC](#vferfcinvSC)
    * [var erfcinvSC](#erfcinvSC)
    * [var vfexpSC](#vfexpSC)
    * [var expSC](#expSC)
    * [var vfexp2SC](#vfexp2SC)
    * [var exp2SC](#exp2SC)
    * [var vfexpm1SC](#vfexpm1SC)
    * [var expm1SC](#expm1SC)
    * [var vffabsSC](#vffabsSC)
    * [var fabsSC](#fabsSC)
    * [var vffdimSC](#vffdimSC)
    * [var nan](#nan)
    * [var vffdim2SC](#vffdim2SC)
    * [var fdimSC](#fdimSC)
    * [var fmaxSC](#fmaxSC)
    * [var fminSC](#fminSC)
    * [var vffmodSC](#vffmodSC)
    * [var fmodSC](#fmodSC)
    * [var vffrexpSC](#vffrexpSC)
    * [var frexpSC](#frexpSC)
    * [var vfgamma](#vfgamma)
    * [var vfhypotSC](#vfhypotSC)
    * [var hypotSC](#hypotSC)
    * [var ilogbSC](#ilogbSC)
    * [var vfj0SC](#vfj0SC)
    * [var j0SC](#j0SC)
    * [var j1SC](#j1SC)
    * [var j2SC](#j2SC)
    * [var jM3SC](#jM3SC)
    * [var vfldexpSC](#vfldexpSC)
    * [var ldexpSC](#ldexpSC)
    * [var vflgammaSC](#vflgammaSC)
    * [var lgammaSC](#lgammaSC)
    * [var vflogSC](#vflogSC)
    * [var logSC](#logSC)
    * [var vflogbSC](#vflogbSC)
    * [var logbSC](#logbSC)
    * [var vflog1pSC](#vflog1pSC)
    * [var log1pSC](#log1pSC)
    * [var vfmodfSC](#vfmodfSC)
    * [var modfSC](#modfSC)
    * [var vfnextafter32SC](#vfnextafter32SC)
    * [var nextafter32SC](#nextafter32SC)
    * [var vfnextafter64SC](#vfnextafter64SC)
    * [var nextafter64SC](#nextafter64SC)
    * [var vfpowSC](#vfpowSC)
    * [var powSC](#powSC)
    * [var vfpow10SC](#vfpow10SC)
    * [var pow10SC](#pow10SC)
    * [var vfroundSC](#vfroundSC)
    * [var vfroundEvenSC](#vfroundEvenSC)
    * [var vfsignbitSC](#vfsignbitSC)
    * [var signbitSC](#signbitSC)
    * [var vfsinSC](#vfsinSC)
    * [var sinSC](#sinSC)
    * [var vfsinhSC](#vfsinhSC)
    * [var sinhSC](#sinhSC)
    * [var vfsqrtSC](#vfsqrtSC)
    * [var sqrtSC](#sqrtSC)
    * [var vftanhSC](#vftanhSC)
    * [var tanhSC](#tanhSC)
    * [var vfy0SC](#vfy0SC)
    * [var y0SC](#y0SC)
    * [var y1SC](#y1SC)
    * [var y2SC](#y2SC)
    * [var yM3SC](#yM3SC)
    * [var vffrexpBC](#vffrexpBC)
    * [var frexpBC](#frexpBC)
    * [var vfldexpBC](#vfldexpBC)
    * [var ldexpBC](#ldexpBC)
    * [var logbBC](#logbBC)
    * [var fmaC](#fmaC)
    * [var sqrt32](#sqrt32)
    * [var PortableFMA](#PortableFMA)
    * [var floatTests](#floatTests)
    * [var indirectSqrt](#indirectSqrt)
    * [var GlobalI](#GlobalI)
    * [var GlobalB](#GlobalB)
    * [var GlobalF](#GlobalF)
    * [var copysignNeg](#copysignNeg)
    * [var absPos](#absPos)
    * [var pow10pos](#pow10pos)
    * [var pow10neg](#pow10neg)
    * [var roundNeg](#roundNeg)
    * [var signbitPos](#signbitPos)
    * [var roundUint64](#roundUint64)
    * [var roundFloat32](#roundFloat32)
    * [var roundUint32](#roundUint32)
    * [var trigHuge](#trigHuge)
    * [var cosHuge](#cosHuge)
    * [var sinHuge](#sinHuge)
    * [var tanHuge](#tanHuge)
* [Types](#type)
    * [type fi struct](#fi)
    * [type floatTest struct](#floatTest)
* [Functions](#func)
    * [func tolerance(a, b, e float64) bool](#tolerance)
    * [func close(a, b float64) bool](#close)
    * [func veryclose(a, b float64) bool](#veryclose)
    * [func soclose(a, b, e float64) bool](#soclose)
    * [func alike(a, b float64) bool](#alike)
    * [func TestNaN(t *testing.T)](#TestNaN)
    * [func TestAcos(t *testing.T)](#TestAcos)
    * [func TestAcosh(t *testing.T)](#TestAcosh)
    * [func TestAsin(t *testing.T)](#TestAsin)
    * [func TestAsinh(t *testing.T)](#TestAsinh)
    * [func TestAtan(t *testing.T)](#TestAtan)
    * [func TestAtanh(t *testing.T)](#TestAtanh)
    * [func TestAtan2(t *testing.T)](#TestAtan2)
    * [func TestCbrt(t *testing.T)](#TestCbrt)
    * [func TestCeil(t *testing.T)](#TestCeil)
    * [func TestCopysign(t *testing.T)](#TestCopysign)
    * [func TestCos(t *testing.T)](#TestCos)
    * [func TestCosh(t *testing.T)](#TestCosh)
    * [func TestErf(t *testing.T)](#TestErf)
    * [func TestErfc(t *testing.T)](#TestErfc)
    * [func TestErfinv(t *testing.T)](#TestErfinv)
    * [func TestErfcinv(t *testing.T)](#TestErfcinv)
    * [func TestExp(t *testing.T)](#TestExp)
    * [func testExp(t *testing.T, Exp func(float64) float64, name string)](#testExp)
    * [func TestExpm1(t *testing.T)](#TestExpm1)
    * [func TestExp2(t *testing.T)](#TestExp2)
    * [func testExp2(t *testing.T, Exp2 func(float64) float64, name string)](#testExp2)
    * [func TestAbs(t *testing.T)](#TestAbs)
    * [func TestDim(t *testing.T)](#TestDim)
    * [func TestFloor(t *testing.T)](#TestFloor)
    * [func TestMax(t *testing.T)](#TestMax)
    * [func TestMin(t *testing.T)](#TestMin)
    * [func TestMod(t *testing.T)](#TestMod)
    * [func TestFrexp(t *testing.T)](#TestFrexp)
    * [func TestGamma(t *testing.T)](#TestGamma)
    * [func TestHypot(t *testing.T)](#TestHypot)
    * [func TestHypotGo(t *testing.T)](#TestHypotGo)
    * [func TestIlogb(t *testing.T)](#TestIlogb)
    * [func TestJ0(t *testing.T)](#TestJ0)
    * [func TestJ1(t *testing.T)](#TestJ1)
    * [func TestJn(t *testing.T)](#TestJn)
    * [func TestLdexp(t *testing.T)](#TestLdexp)
    * [func TestLgamma(t *testing.T)](#TestLgamma)
    * [func TestLog(t *testing.T)](#TestLog)
    * [func TestLogb(t *testing.T)](#TestLogb)
    * [func TestLog10(t *testing.T)](#TestLog10)
    * [func TestLog1p(t *testing.T)](#TestLog1p)
    * [func TestLog2(t *testing.T)](#TestLog2)
    * [func TestModf(t *testing.T)](#TestModf)
    * [func TestNextafter32(t *testing.T)](#TestNextafter32)
    * [func TestNextafter64(t *testing.T)](#TestNextafter64)
    * [func TestPow(t *testing.T)](#TestPow)
    * [func TestPow10(t *testing.T)](#TestPow10)
    * [func TestRemainder(t *testing.T)](#TestRemainder)
    * [func TestRound(t *testing.T)](#TestRound)
    * [func TestRoundToEven(t *testing.T)](#TestRoundToEven)
    * [func TestSignbit(t *testing.T)](#TestSignbit)
    * [func TestSin(t *testing.T)](#TestSin)
    * [func TestSincos(t *testing.T)](#TestSincos)
    * [func TestSinh(t *testing.T)](#TestSinh)
    * [func TestSqrt(t *testing.T)](#TestSqrt)
    * [func TestTan(t *testing.T)](#TestTan)
    * [func TestTanh(t *testing.T)](#TestTanh)
    * [func TestTrunc(t *testing.T)](#TestTrunc)
    * [func TestY0(t *testing.T)](#TestY0)
    * [func TestY1(t *testing.T)](#TestY1)
    * [func TestYn(t *testing.T)](#TestYn)
    * [func TestFMA(t *testing.T)](#TestFMA)
    * [func TestLargeCos(t *testing.T)](#TestLargeCos)
    * [func TestLargeSin(t *testing.T)](#TestLargeSin)
    * [func TestLargeSincos(t *testing.T)](#TestLargeSincos)
    * [func TestLargeTan(t *testing.T)](#TestLargeTan)
    * [func TestTrigReduce(t *testing.T)](#TestTrigReduce)
    * [func TestFloatMinMax(t *testing.T)](#TestFloatMinMax)
    * [func TestFloatMinima(t *testing.T)](#TestFloatMinima)
    * [func TestFloat32Sqrt(t *testing.T)](#TestFloat32Sqrt)
    * [func BenchmarkAcos(b *testing.B)](#BenchmarkAcos)
    * [func BenchmarkAcosh(b *testing.B)](#BenchmarkAcosh)
    * [func BenchmarkAsin(b *testing.B)](#BenchmarkAsin)
    * [func BenchmarkAsinh(b *testing.B)](#BenchmarkAsinh)
    * [func BenchmarkAtan(b *testing.B)](#BenchmarkAtan)
    * [func BenchmarkAtanh(b *testing.B)](#BenchmarkAtanh)
    * [func BenchmarkAtan2(b *testing.B)](#BenchmarkAtan2)
    * [func BenchmarkCbrt(b *testing.B)](#BenchmarkCbrt)
    * [func BenchmarkCeil(b *testing.B)](#BenchmarkCeil)
    * [func BenchmarkCopysign(b *testing.B)](#BenchmarkCopysign)
    * [func BenchmarkCos(b *testing.B)](#BenchmarkCos)
    * [func BenchmarkCosh(b *testing.B)](#BenchmarkCosh)
    * [func BenchmarkErf(b *testing.B)](#BenchmarkErf)
    * [func BenchmarkErfc(b *testing.B)](#BenchmarkErfc)
    * [func BenchmarkErfinv(b *testing.B)](#BenchmarkErfinv)
    * [func BenchmarkErfcinv(b *testing.B)](#BenchmarkErfcinv)
    * [func BenchmarkExp(b *testing.B)](#BenchmarkExp)
    * [func BenchmarkExpGo(b *testing.B)](#BenchmarkExpGo)
    * [func BenchmarkExpm1(b *testing.B)](#BenchmarkExpm1)
    * [func BenchmarkExp2(b *testing.B)](#BenchmarkExp2)
    * [func BenchmarkExp2Go(b *testing.B)](#BenchmarkExp2Go)
    * [func BenchmarkAbs(b *testing.B)](#BenchmarkAbs)
    * [func BenchmarkDim(b *testing.B)](#BenchmarkDim)
    * [func BenchmarkFloor(b *testing.B)](#BenchmarkFloor)
    * [func BenchmarkMax(b *testing.B)](#BenchmarkMax)
    * [func BenchmarkMin(b *testing.B)](#BenchmarkMin)
    * [func BenchmarkMod(b *testing.B)](#BenchmarkMod)
    * [func BenchmarkFrexp(b *testing.B)](#BenchmarkFrexp)
    * [func BenchmarkGamma(b *testing.B)](#BenchmarkGamma)
    * [func BenchmarkHypot(b *testing.B)](#BenchmarkHypot)
    * [func BenchmarkHypotGo(b *testing.B)](#BenchmarkHypotGo)
    * [func BenchmarkIlogb(b *testing.B)](#BenchmarkIlogb)
    * [func BenchmarkJ0(b *testing.B)](#BenchmarkJ0)
    * [func BenchmarkJ1(b *testing.B)](#BenchmarkJ1)
    * [func BenchmarkJn(b *testing.B)](#BenchmarkJn)
    * [func BenchmarkLdexp(b *testing.B)](#BenchmarkLdexp)
    * [func BenchmarkLgamma(b *testing.B)](#BenchmarkLgamma)
    * [func BenchmarkLog(b *testing.B)](#BenchmarkLog)
    * [func BenchmarkLogb(b *testing.B)](#BenchmarkLogb)
    * [func BenchmarkLog1p(b *testing.B)](#BenchmarkLog1p)
    * [func BenchmarkLog10(b *testing.B)](#BenchmarkLog10)
    * [func BenchmarkLog2(b *testing.B)](#BenchmarkLog2)
    * [func BenchmarkModf(b *testing.B)](#BenchmarkModf)
    * [func BenchmarkNextafter32(b *testing.B)](#BenchmarkNextafter32)
    * [func BenchmarkNextafter64(b *testing.B)](#BenchmarkNextafter64)
    * [func BenchmarkPowInt(b *testing.B)](#BenchmarkPowInt)
    * [func BenchmarkPowFrac(b *testing.B)](#BenchmarkPowFrac)
    * [func BenchmarkPow10Pos(b *testing.B)](#BenchmarkPow10Pos)
    * [func BenchmarkPow10Neg(b *testing.B)](#BenchmarkPow10Neg)
    * [func BenchmarkRound(b *testing.B)](#BenchmarkRound)
    * [func BenchmarkRoundToEven(b *testing.B)](#BenchmarkRoundToEven)
    * [func BenchmarkRemainder(b *testing.B)](#BenchmarkRemainder)
    * [func BenchmarkSignbit(b *testing.B)](#BenchmarkSignbit)
    * [func BenchmarkSin(b *testing.B)](#BenchmarkSin)
    * [func BenchmarkSincos(b *testing.B)](#BenchmarkSincos)
    * [func BenchmarkSinh(b *testing.B)](#BenchmarkSinh)
    * [func BenchmarkSqrtIndirect(b *testing.B)](#BenchmarkSqrtIndirect)
    * [func BenchmarkSqrtLatency(b *testing.B)](#BenchmarkSqrtLatency)
    * [func BenchmarkSqrtIndirectLatency(b *testing.B)](#BenchmarkSqrtIndirectLatency)
    * [func BenchmarkSqrtGoLatency(b *testing.B)](#BenchmarkSqrtGoLatency)
    * [func isPrime(i int) bool](#isPrime)
    * [func BenchmarkSqrtPrime(b *testing.B)](#BenchmarkSqrtPrime)
    * [func BenchmarkTan(b *testing.B)](#BenchmarkTan)
    * [func BenchmarkTanh(b *testing.B)](#BenchmarkTanh)
    * [func BenchmarkTrunc(b *testing.B)](#BenchmarkTrunc)
    * [func BenchmarkY0(b *testing.B)](#BenchmarkY0)
    * [func BenchmarkY1(b *testing.B)](#BenchmarkY1)
    * [func BenchmarkYn(b *testing.B)](#BenchmarkYn)
    * [func BenchmarkFloat64bits(b *testing.B)](#BenchmarkFloat64bits)
    * [func BenchmarkFloat64frombits(b *testing.B)](#BenchmarkFloat64frombits)
    * [func BenchmarkFloat32bits(b *testing.B)](#BenchmarkFloat32bits)
    * [func BenchmarkFloat32frombits(b *testing.B)](#BenchmarkFloat32frombits)
    * [func BenchmarkFMA(b *testing.B)](#BenchmarkFMA)
    * [func TestMaxUint(t *testing.T)](#TestMaxUint)
    * [func TestMaxInt(t *testing.T)](#TestMaxInt)
    * [func ExampleAcos()](#ExampleAcos)
    * [func ExampleAcosh()](#ExampleAcosh)
    * [func ExampleAsin()](#ExampleAsin)
    * [func ExampleAsinh()](#ExampleAsinh)
    * [func ExampleAtan()](#ExampleAtan)
    * [func ExampleAtan2()](#ExampleAtan2)
    * [func ExampleAtanh()](#ExampleAtanh)
    * [func ExampleCopysign()](#ExampleCopysign)
    * [func ExampleCos()](#ExampleCos)
    * [func ExampleCosh()](#ExampleCosh)
    * [func ExampleSin()](#ExampleSin)
    * [func ExampleSincos()](#ExampleSincos)
    * [func ExampleSinh()](#ExampleSinh)
    * [func ExampleTan()](#ExampleTan)
    * [func ExampleTanh()](#ExampleTanh)
    * [func ExampleSqrt()](#ExampleSqrt)
    * [func ExampleCeil()](#ExampleCeil)
    * [func ExampleFloor()](#ExampleFloor)
    * [func ExamplePow()](#ExamplePow)
    * [func ExamplePow10()](#ExamplePow10)
    * [func ExampleRound()](#ExampleRound)
    * [func ExampleRoundToEven()](#ExampleRoundToEven)
    * [func ExampleLog()](#ExampleLog)
    * [func ExampleLog2()](#ExampleLog2)
    * [func ExampleLog10()](#ExampleLog10)
    * [func ExampleMod()](#ExampleMod)
    * [func ExampleAbs()](#ExampleAbs)
    * [func ExampleDim()](#ExampleDim)
    * [func ExampleExp()](#ExampleExp)
    * [func ExampleExp2()](#ExampleExp2)
    * [func ExampleExpm1()](#ExampleExpm1)
    * [func ExampleTrunc()](#ExampleTrunc)
    * [func ExampleCbrt()](#ExampleCbrt)
    * [func ExampleModf()](#ExampleModf)
    * [func TestHugeCos(t *testing.T)](#TestHugeCos)
    * [func TestHugeSin(t *testing.T)](#TestHugeSin)
    * [func TestHugeSinCos(t *testing.T)](#TestHugeSinCos)
    * [func TestHugeTan(t *testing.T)](#TestHugeTan)


## <a id="const" href="#const">Constants</a>

### <a id="SmallestNormalFloat64" href="#SmallestNormalFloat64">const SmallestNormalFloat64</a>

```
searchKey: math_test.SmallestNormalFloat64
```

```Go
const SmallestNormalFloat64 = 2.2250738585072014e-308 // 2**-1022

```

arguments and expected results for boundary cases 

### <a id="LargestSubnormalFloat64" href="#LargestSubnormalFloat64">const LargestSubnormalFloat64</a>

```
searchKey: math_test.LargestSubnormalFloat64
```

```Go
const LargestSubnormalFloat64 = SmallestNormalFloat64 - SmallestNonzeroFloat64
```

arguments and expected results for boundary cases 

## <a id="var" href="#var">Variables</a>

### <a id="vf" href="#vf">var vf</a>

```
searchKey: math_test.vf
```

```Go
var vf = ...
```

### <a id="acos" href="#acos">var acos</a>

```
searchKey: math_test.acos
```

```Go
var acos = ...
```

The expected results below were computed by the high precision calculators at [https://keisan.casio.com/](https://keisan.casio.com/).  More exact input values (array vf[], above) were obtained by printing them with "%.26f".  The answers were calculated to 26 digits (by using the "Digit number" drop-down control of each calculator). 

### <a id="acosh" href="#acosh">var acosh</a>

```
searchKey: math_test.acosh
```

```Go
var acosh = ...
```

### <a id="asin" href="#asin">var asin</a>

```
searchKey: math_test.asin
```

```Go
var asin = ...
```

### <a id="asinh" href="#asinh">var asinh</a>

```
searchKey: math_test.asinh
```

```Go
var asinh = ...
```

### <a id="atan" href="#atan">var atan</a>

```
searchKey: math_test.atan
```

```Go
var atan = ...
```

### <a id="atanh" href="#atanh">var atanh</a>

```
searchKey: math_test.atanh
```

```Go
var atanh = ...
```

### <a id="atan2" href="#atan2">var atan2</a>

```
searchKey: math_test.atan2
```

```Go
var atan2 = ...
```

### <a id="cbrt" href="#cbrt">var cbrt</a>

```
searchKey: math_test.cbrt
```

```Go
var cbrt = ...
```

### <a id="ceil" href="#ceil">var ceil</a>

```
searchKey: math_test.ceil
```

```Go
var ceil = ...
```

### <a id="copysign" href="#copysign">var copysign</a>

```
searchKey: math_test.copysign
```

```Go
var copysign = ...
```

### <a id="cos" href="#cos">var cos</a>

```
searchKey: math_test.cos
```

```Go
var cos = ...
```

### <a id="cosLarge" href="#cosLarge">var cosLarge</a>

```
searchKey: math_test.cosLarge
```

```Go
var cosLarge = ...
```

Results for 100000 * Pi + vf[i] 

### <a id="cosh" href="#cosh">var cosh</a>

```
searchKey: math_test.cosh
```

```Go
var cosh = ...
```

### <a id="erf" href="#erf">var erf</a>

```
searchKey: math_test.erf
```

```Go
var erf = ...
```

### <a id="erfc" href="#erfc">var erfc</a>

```
searchKey: math_test.erfc
```

```Go
var erfc = ...
```

### <a id="erfinv" href="#erfinv">var erfinv</a>

```
searchKey: math_test.erfinv
```

```Go
var erfinv = ...
```

### <a id="exp" href="#exp">var exp</a>

```
searchKey: math_test.exp
```

```Go
var exp = ...
```

### <a id="expm1" href="#expm1">var expm1</a>

```
searchKey: math_test.expm1
```

```Go
var expm1 = ...
```

### <a id="expm1Large" href="#expm1Large">var expm1Large</a>

```
searchKey: math_test.expm1Large
```

```Go
var expm1Large = ...
```

### <a id="exp2" href="#exp2">var exp2</a>

```
searchKey: math_test.exp2
```

```Go
var exp2 = ...
```

### <a id="fabs" href="#fabs">var fabs</a>

```
searchKey: math_test.fabs
```

```Go
var fabs = ...
```

### <a id="fdim" href="#fdim">var fdim</a>

```
searchKey: math_test.fdim
```

```Go
var fdim = ...
```

### <a id="floor" href="#floor">var floor</a>

```
searchKey: math_test.floor
```

```Go
var floor = ...
```

### <a id="fmod" href="#fmod">var fmod</a>

```
searchKey: math_test.fmod
```

```Go
var fmod = ...
```

### <a id="frexp" href="#frexp">var frexp</a>

```
searchKey: math_test.frexp
```

```Go
var frexp = ...
```

### <a id="gamma" href="#gamma">var gamma</a>

```
searchKey: math_test.gamma
```

```Go
var gamma = ...
```

### <a id="j0" href="#j0">var j0</a>

```
searchKey: math_test.j0
```

```Go
var j0 = ...
```

### <a id="j1" href="#j1">var j1</a>

```
searchKey: math_test.j1
```

```Go
var j1 = ...
```

### <a id="j2" href="#j2">var j2</a>

```
searchKey: math_test.j2
```

```Go
var j2 = ...
```

### <a id="jM3" href="#jM3">var jM3</a>

```
searchKey: math_test.jM3
```

```Go
var jM3 = ...
```

### <a id="lgamma" href="#lgamma">var lgamma</a>

```
searchKey: math_test.lgamma
```

```Go
var lgamma = ...
```

### <a id="log" href="#log">var log</a>

```
searchKey: math_test.log
```

```Go
var log = ...
```

### <a id="logb" href="#logb">var logb</a>

```
searchKey: math_test.logb
```

```Go
var logb = ...
```

### <a id="log10" href="#log10">var log10</a>

```
searchKey: math_test.log10
```

```Go
var log10 = ...
```

### <a id="log1p" href="#log1p">var log1p</a>

```
searchKey: math_test.log1p
```

```Go
var log1p = ...
```

### <a id="log2" href="#log2">var log2</a>

```
searchKey: math_test.log2
```

```Go
var log2 = ...
```

### <a id="modf" href="#modf">var modf</a>

```
searchKey: math_test.modf
```

```Go
var modf = ...
```

### <a id="nextafter32" href="#nextafter32">var nextafter32</a>

```
searchKey: math_test.nextafter32
```

```Go
var nextafter32 = ...
```

### <a id="nextafter64" href="#nextafter64">var nextafter64</a>

```
searchKey: math_test.nextafter64
```

```Go
var nextafter64 = ...
```

### <a id="pow" href="#pow">var pow</a>

```
searchKey: math_test.pow
```

```Go
var pow = ...
```

### <a id="remainder" href="#remainder">var remainder</a>

```
searchKey: math_test.remainder
```

```Go
var remainder = ...
```

### <a id="round" href="#round">var round</a>

```
searchKey: math_test.round
```

```Go
var round = []float64{
	5,
	8,
	Copysign(0, -1),
	-5,
	10,
	3,
	5,
	3,
	2,
	-9,
}
```

### <a id="signbit" href="#signbit">var signbit</a>

```
searchKey: math_test.signbit
```

```Go
var signbit = []bool{
	false,
	false,
	true,
	true,
	false,
	false,
	false,
	false,
	false,
	true,
}
```

### <a id="sin" href="#sin">var sin</a>

```
searchKey: math_test.sin
```

```Go
var sin = ...
```

### <a id="sinLarge" href="#sinLarge">var sinLarge</a>

```
searchKey: math_test.sinLarge
```

```Go
var sinLarge = ...
```

Results for 100000 * Pi + vf[i] 

### <a id="sinh" href="#sinh">var sinh</a>

```
searchKey: math_test.sinh
```

```Go
var sinh = ...
```

### <a id="sqrt" href="#sqrt">var sqrt</a>

```
searchKey: math_test.sqrt
```

```Go
var sqrt = ...
```

### <a id="tan" href="#tan">var tan</a>

```
searchKey: math_test.tan
```

```Go
var tan = ...
```

### <a id="tanLarge" href="#tanLarge">var tanLarge</a>

```
searchKey: math_test.tanLarge
```

```Go
var tanLarge = ...
```

Results for 100000 * Pi + vf[i] 

### <a id="tanh" href="#tanh">var tanh</a>

```
searchKey: math_test.tanh
```

```Go
var tanh = ...
```

### <a id="trunc" href="#trunc">var trunc</a>

```
searchKey: math_test.trunc
```

```Go
var trunc = ...
```

### <a id="y0" href="#y0">var y0</a>

```
searchKey: math_test.y0
```

```Go
var y0 = ...
```

### <a id="y1" href="#y1">var y1</a>

```
searchKey: math_test.y1
```

```Go
var y1 = ...
```

### <a id="y2" href="#y2">var y2</a>

```
searchKey: math_test.y2
```

```Go
var y2 = ...
```

### <a id="yM3" href="#yM3">var yM3</a>

```
searchKey: math_test.yM3
```

```Go
var yM3 = ...
```

### <a id="vfacosSC" href="#vfacosSC">var vfacosSC</a>

```
searchKey: math_test.vfacosSC
```

```Go
var vfacosSC = []float64{
	-Pi,
	1,
	Pi,
	NaN(),
}
```

arguments and expected results for special cases 

### <a id="acosSC" href="#acosSC">var acosSC</a>

```
searchKey: math_test.acosSC
```

```Go
var acosSC = []float64{
	NaN(),
	0,
	NaN(),
	NaN(),
}
```

### <a id="vfacoshSC" href="#vfacoshSC">var vfacoshSC</a>

```
searchKey: math_test.vfacoshSC
```

```Go
var vfacoshSC = []float64{
	Inf(-1),
	0.5,
	1,
	Inf(1),
	NaN(),
}
```

### <a id="acoshSC" href="#acoshSC">var acoshSC</a>

```
searchKey: math_test.acoshSC
```

```Go
var acoshSC = []float64{
	NaN(),
	NaN(),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="vfasinSC" href="#vfasinSC">var vfasinSC</a>

```
searchKey: math_test.vfasinSC
```

```Go
var vfasinSC = []float64{
	-Pi,
	Copysign(0, -1),
	0,
	Pi,
	NaN(),
}
```

### <a id="asinSC" href="#asinSC">var asinSC</a>

```
searchKey: math_test.asinSC
```

```Go
var asinSC = []float64{
	NaN(),
	Copysign(0, -1),
	0,
	NaN(),
	NaN(),
}
```

### <a id="vfasinhSC" href="#vfasinhSC">var vfasinhSC</a>

```
searchKey: math_test.vfasinhSC
```

```Go
var vfasinhSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="asinhSC" href="#asinhSC">var asinhSC</a>

```
searchKey: math_test.asinhSC
```

```Go
var asinhSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="vfatanSC" href="#vfatanSC">var vfatanSC</a>

```
searchKey: math_test.vfatanSC
```

```Go
var vfatanSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="atanSC" href="#atanSC">var atanSC</a>

```
searchKey: math_test.atanSC
```

```Go
var atanSC = []float64{
	-Pi / 2,
	Copysign(0, -1),
	0,
	Pi / 2,
	NaN(),
}
```

### <a id="vfatanhSC" href="#vfatanhSC">var vfatanhSC</a>

```
searchKey: math_test.vfatanhSC
```

```Go
var vfatanhSC = []float64{
	Inf(-1),
	-Pi,
	-1,
	Copysign(0, -1),
	0,
	1,
	Pi,
	Inf(1),
	NaN(),
}
```

### <a id="atanhSC" href="#atanhSC">var atanhSC</a>

```
searchKey: math_test.atanhSC
```

```Go
var atanhSC = ...
```

### <a id="vfatan2SC" href="#vfatan2SC">var vfatan2SC</a>

```
searchKey: math_test.vfatan2SC
```

```Go
var vfatan2SC = ...
```

### <a id="atan2SC" href="#atan2SC">var atan2SC</a>

```
searchKey: math_test.atan2SC
```

```Go
var atan2SC = ...
```

### <a id="vfcbrtSC" href="#vfcbrtSC">var vfcbrtSC</a>

```
searchKey: math_test.vfcbrtSC
```

```Go
var vfcbrtSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="cbrtSC" href="#cbrtSC">var cbrtSC</a>

```
searchKey: math_test.cbrtSC
```

```Go
var cbrtSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="vfceilSC" href="#vfceilSC">var vfceilSC</a>

```
searchKey: math_test.vfceilSC
```

```Go
var vfceilSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="ceilSC" href="#ceilSC">var ceilSC</a>

```
searchKey: math_test.ceilSC
```

```Go
var ceilSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="vfcopysignSC" href="#vfcopysignSC">var vfcopysignSC</a>

```
searchKey: math_test.vfcopysignSC
```

```Go
var vfcopysignSC = []float64{
	Inf(-1),
	Inf(1),
	NaN(),
}
```

### <a id="copysignSC" href="#copysignSC">var copysignSC</a>

```
searchKey: math_test.copysignSC
```

```Go
var copysignSC = []float64{
	Inf(-1),
	Inf(-1),
	NaN(),
}
```

### <a id="vfcosSC" href="#vfcosSC">var vfcosSC</a>

```
searchKey: math_test.vfcosSC
```

```Go
var vfcosSC = []float64{
	Inf(-1),
	Inf(1),
	NaN(),
}
```

### <a id="cosSC" href="#cosSC">var cosSC</a>

```
searchKey: math_test.cosSC
```

```Go
var cosSC = []float64{
	NaN(),
	NaN(),
	NaN(),
}
```

### <a id="vfcoshSC" href="#vfcoshSC">var vfcoshSC</a>

```
searchKey: math_test.vfcoshSC
```

```Go
var vfcoshSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="coshSC" href="#coshSC">var coshSC</a>

```
searchKey: math_test.coshSC
```

```Go
var coshSC = []float64{
	Inf(1),
	1,
	1,
	Inf(1),
	NaN(),
}
```

### <a id="vferfSC" href="#vferfSC">var vferfSC</a>

```
searchKey: math_test.vferfSC
```

```Go
var vferfSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	0,
	Inf(1),
	NaN(),
	-1000,
	1000,
}
```

### <a id="erfSC" href="#erfSC">var erfSC</a>

```
searchKey: math_test.erfSC
```

```Go
var erfSC = []float64{
	-1,
	Copysign(0, -1),
	0,
	1,
	NaN(),
	-1,
	1,
}
```

### <a id="vferfcSC" href="#vferfcSC">var vferfcSC</a>

```
searchKey: math_test.vferfcSC
```

```Go
var vferfcSC = []float64{
	Inf(-1),
	Inf(1),
	NaN(),
	-1000,
	1000,
}
```

### <a id="erfcSC" href="#erfcSC">var erfcSC</a>

```
searchKey: math_test.erfcSC
```

```Go
var erfcSC = []float64{
	2,
	0,
	NaN(),
	2,
	0,
}
```

### <a id="vferfinvSC" href="#vferfinvSC">var vferfinvSC</a>

```
searchKey: math_test.vferfinvSC
```

```Go
var vferfinvSC = []float64{
	1,
	-1,
	0,
	Inf(-1),
	Inf(1),
	NaN(),
}
```

### <a id="erfinvSC" href="#erfinvSC">var erfinvSC</a>

```
searchKey: math_test.erfinvSC
```

```Go
var erfinvSC = []float64{
	Inf(+1),
	Inf(-1),
	0,
	NaN(),
	NaN(),
	NaN(),
}
```

### <a id="vferfcinvSC" href="#vferfcinvSC">var vferfcinvSC</a>

```
searchKey: math_test.vferfcinvSC
```

```Go
var vferfcinvSC = []float64{
	0,
	2,
	1,
	Inf(1),
	Inf(-1),
	NaN(),
}
```

### <a id="erfcinvSC" href="#erfcinvSC">var erfcinvSC</a>

```
searchKey: math_test.erfcinvSC
```

```Go
var erfcinvSC = []float64{
	Inf(+1),
	Inf(-1),
	0,
	NaN(),
	NaN(),
	NaN(),
}
```

### <a id="vfexpSC" href="#vfexpSC">var vfexpSC</a>

```
searchKey: math_test.vfexpSC
```

```Go
var vfexpSC = ...
```

### <a id="expSC" href="#expSC">var expSC</a>

```
searchKey: math_test.expSC
```

```Go
var expSC = ...
```

### <a id="vfexp2SC" href="#vfexp2SC">var vfexp2SC</a>

```
searchKey: math_test.vfexp2SC
```

```Go
var vfexp2SC = ...
```

### <a id="exp2SC" href="#exp2SC">var exp2SC</a>

```
searchKey: math_test.exp2SC
```

```Go
var exp2SC = []float64{
	0,
	0,
	Inf(1),
	Inf(1),
	NaN(),
	Inf(1),
	5e-324,
	1.0000000025821745,
}
```

### <a id="vfexpm1SC" href="#vfexpm1SC">var vfexpm1SC</a>

```
searchKey: math_test.vfexpm1SC
```

```Go
var vfexpm1SC = []float64{
	Inf(-1),
	-710,
	Copysign(0, -1),
	0,
	710,
	Inf(1),
	NaN(),
}
```

### <a id="expm1SC" href="#expm1SC">var expm1SC</a>

```
searchKey: math_test.expm1SC
```

```Go
var expm1SC = []float64{
	-1,
	-1,
	Copysign(0, -1),
	0,
	Inf(1),
	Inf(1),
	NaN(),
}
```

### <a id="vffabsSC" href="#vffabsSC">var vffabsSC</a>

```
searchKey: math_test.vffabsSC
```

```Go
var vffabsSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="fabsSC" href="#fabsSC">var fabsSC</a>

```
searchKey: math_test.fabsSC
```

```Go
var fabsSC = []float64{
	Inf(1),
	0,
	0,
	Inf(1),
	NaN(),
}
```

### <a id="vffdimSC" href="#vffdimSC">var vffdimSC</a>

```
searchKey: math_test.vffdimSC
```

```Go
var vffdimSC = ...
```

### <a id="nan" href="#nan">var nan</a>

```
searchKey: math_test.nan
```

```Go
var nan = Float64frombits(0xFFF8000000000000) // SSE2 DIVSD 0/0

```

### <a id="vffdim2SC" href="#vffdim2SC">var vffdim2SC</a>

```
searchKey: math_test.vffdim2SC
```

```Go
var vffdim2SC = ...
```

### <a id="fdimSC" href="#fdimSC">var fdimSC</a>

```
searchKey: math_test.fdimSC
```

```Go
var fdimSC = ...
```

### <a id="fmaxSC" href="#fmaxSC">var fmaxSC</a>

```
searchKey: math_test.fmaxSC
```

```Go
var fmaxSC = ...
```

### <a id="fminSC" href="#fminSC">var fminSC</a>

```
searchKey: math_test.fminSC
```

```Go
var fminSC = ...
```

### <a id="vffmodSC" href="#vffmodSC">var vffmodSC</a>

```
searchKey: math_test.vffmodSC
```

```Go
var vffmodSC = ...
```

### <a id="fmodSC" href="#fmodSC">var fmodSC</a>

```
searchKey: math_test.fmodSC
```

```Go
var fmodSC = ...
```

### <a id="vffrexpSC" href="#vffrexpSC">var vffrexpSC</a>

```
searchKey: math_test.vffrexpSC
```

```Go
var vffrexpSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="frexpSC" href="#frexpSC">var frexpSC</a>

```
searchKey: math_test.frexpSC
```

```Go
var frexpSC = []fi{
	{Inf(-1), 0},
	{Copysign(0, -1), 0},
	{0, 0},
	{Inf(1), 0},
	{NaN(), 0},
}
```

### <a id="vfgamma" href="#vfgamma">var vfgamma</a>

```
searchKey: math_test.vfgamma
```

```Go
var vfgamma = ...
```

### <a id="vfhypotSC" href="#vfhypotSC">var vfhypotSC</a>

```
searchKey: math_test.vfhypotSC
```

```Go
var vfhypotSC = ...
```

### <a id="hypotSC" href="#hypotSC">var hypotSC</a>

```
searchKey: math_test.hypotSC
```

```Go
var hypotSC = ...
```

### <a id="ilogbSC" href="#ilogbSC">var ilogbSC</a>

```
searchKey: math_test.ilogbSC
```

```Go
var ilogbSC = []int{
	MaxInt32,
	MinInt32,
	MaxInt32,
	MaxInt32,
}
```

### <a id="vfj0SC" href="#vfj0SC">var vfj0SC</a>

```
searchKey: math_test.vfj0SC
```

```Go
var vfj0SC = []float64{
	Inf(-1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="j0SC" href="#j0SC">var j0SC</a>

```
searchKey: math_test.j0SC
```

```Go
var j0SC = []float64{
	0,
	1,
	0,
	NaN(),
}
```

### <a id="j1SC" href="#j1SC">var j1SC</a>

```
searchKey: math_test.j1SC
```

```Go
var j1SC = []float64{
	0,
	0,
	0,
	NaN(),
}
```

### <a id="j2SC" href="#j2SC">var j2SC</a>

```
searchKey: math_test.j2SC
```

```Go
var j2SC = []float64{
	0,
	0,
	0,
	NaN(),
}
```

### <a id="jM3SC" href="#jM3SC">var jM3SC</a>

```
searchKey: math_test.jM3SC
```

```Go
var jM3SC = []float64{
	0,
	0,
	0,
	NaN(),
}
```

### <a id="vfldexpSC" href="#vfldexpSC">var vfldexpSC</a>

```
searchKey: math_test.vfldexpSC
```

```Go
var vfldexpSC = ...
```

### <a id="ldexpSC" href="#ldexpSC">var ldexpSC</a>

```
searchKey: math_test.ldexpSC
```

```Go
var ldexpSC = ...
```

### <a id="vflgammaSC" href="#vflgammaSC">var vflgammaSC</a>

```
searchKey: math_test.vflgammaSC
```

```Go
var vflgammaSC = []float64{
	Inf(-1),
	-3,
	0,
	1,
	2,
	Inf(1),
	NaN(),
}
```

### <a id="lgammaSC" href="#lgammaSC">var lgammaSC</a>

```
searchKey: math_test.lgammaSC
```

```Go
var lgammaSC = ...
```

### <a id="vflogSC" href="#vflogSC">var vflogSC</a>

```
searchKey: math_test.vflogSC
```

```Go
var vflogSC = []float64{
	Inf(-1),
	-Pi,
	Copysign(0, -1),
	0,
	1,
	Inf(1),
	NaN(),
}
```

### <a id="logSC" href="#logSC">var logSC</a>

```
searchKey: math_test.logSC
```

```Go
var logSC = []float64{
	NaN(),
	NaN(),
	Inf(-1),
	Inf(-1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="vflogbSC" href="#vflogbSC">var vflogbSC</a>

```
searchKey: math_test.vflogbSC
```

```Go
var vflogbSC = []float64{
	Inf(-1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="logbSC" href="#logbSC">var logbSC</a>

```
searchKey: math_test.logbSC
```

```Go
var logbSC = []float64{
	Inf(1),
	Inf(-1),
	Inf(1),
	NaN(),
}
```

### <a id="vflog1pSC" href="#vflog1pSC">var vflog1pSC</a>

```
searchKey: math_test.vflog1pSC
```

```Go
var vflog1pSC = ...
```

### <a id="log1pSC" href="#log1pSC">var log1pSC</a>

```
searchKey: math_test.log1pSC
```

```Go
var log1pSC = ...
```

### <a id="vfmodfSC" href="#vfmodfSC">var vfmodfSC</a>

```
searchKey: math_test.vfmodfSC
```

```Go
var vfmodfSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	Inf(1),
	NaN(),
}
```

### <a id="modfSC" href="#modfSC">var modfSC</a>

```
searchKey: math_test.modfSC
```

```Go
var modfSC = ...
```

### <a id="vfnextafter32SC" href="#vfnextafter32SC">var vfnextafter32SC</a>

```
searchKey: math_test.vfnextafter32SC
```

```Go
var vfnextafter32SC = ...
```

### <a id="nextafter32SC" href="#nextafter32SC">var nextafter32SC</a>

```
searchKey: math_test.nextafter32SC
```

```Go
var nextafter32SC = ...
```

### <a id="vfnextafter64SC" href="#vfnextafter64SC">var vfnextafter64SC</a>

```
searchKey: math_test.vfnextafter64SC
```

```Go
var vfnextafter64SC = ...
```

### <a id="nextafter64SC" href="#nextafter64SC">var nextafter64SC</a>

```
searchKey: math_test.nextafter64SC
```

```Go
var nextafter64SC = ...
```

### <a id="vfpowSC" href="#vfpowSC">var vfpowSC</a>

```
searchKey: math_test.vfpowSC
```

```Go
var vfpowSC = ...
```

### <a id="powSC" href="#powSC">var powSC</a>

```
searchKey: math_test.powSC
```

```Go
var powSC = ...
```

### <a id="vfpow10SC" href="#vfpow10SC">var vfpow10SC</a>

```
searchKey: math_test.vfpow10SC
```

```Go
var vfpow10SC = ...
```

### <a id="pow10SC" href="#pow10SC">var pow10SC</a>

```
searchKey: math_test.pow10SC
```

```Go
var pow10SC = ...
```

### <a id="vfroundSC" href="#vfroundSC">var vfroundSC</a>

```
searchKey: math_test.vfroundSC
```

```Go
var vfroundSC = ...
```

### <a id="vfroundEvenSC" href="#vfroundEvenSC">var vfroundEvenSC</a>

```
searchKey: math_test.vfroundEvenSC
```

```Go
var vfroundEvenSC = ...
```

### <a id="vfsignbitSC" href="#vfsignbitSC">var vfsignbitSC</a>

```
searchKey: math_test.vfsignbitSC
```

```Go
var vfsignbitSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="signbitSC" href="#signbitSC">var signbitSC</a>

```
searchKey: math_test.signbitSC
```

```Go
var signbitSC = []bool{
	true,
	true,
	false,
	false,
	false,
}
```

### <a id="vfsinSC" href="#vfsinSC">var vfsinSC</a>

```
searchKey: math_test.vfsinSC
```

```Go
var vfsinSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="sinSC" href="#sinSC">var sinSC</a>

```
searchKey: math_test.sinSC
```

```Go
var sinSC = []float64{
	NaN(),
	Copysign(0, -1),
	0,
	NaN(),
	NaN(),
}
```

### <a id="vfsinhSC" href="#vfsinhSC">var vfsinhSC</a>

```
searchKey: math_test.vfsinhSC
```

```Go
var vfsinhSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="sinhSC" href="#sinhSC">var sinhSC</a>

```
searchKey: math_test.sinhSC
```

```Go
var sinhSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="vfsqrtSC" href="#vfsqrtSC">var vfsqrtSC</a>

```
searchKey: math_test.vfsqrtSC
```

```Go
var vfsqrtSC = ...
```

### <a id="sqrtSC" href="#sqrtSC">var sqrtSC</a>

```
searchKey: math_test.sqrtSC
```

```Go
var sqrtSC = ...
```

### <a id="vftanhSC" href="#vftanhSC">var vftanhSC</a>

```
searchKey: math_test.vftanhSC
```

```Go
var vftanhSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="tanhSC" href="#tanhSC">var tanhSC</a>

```
searchKey: math_test.tanhSC
```

```Go
var tanhSC = []float64{
	-1,
	Copysign(0, -1),
	0,
	1,
	NaN(),
}
```

### <a id="vfy0SC" href="#vfy0SC">var vfy0SC</a>

```
searchKey: math_test.vfy0SC
```

```Go
var vfy0SC = []float64{
	Inf(-1),
	0,
	Inf(1),
	NaN(),
	-1,
}
```

### <a id="y0SC" href="#y0SC">var y0SC</a>

```
searchKey: math_test.y0SC
```

```Go
var y0SC = []float64{
	NaN(),
	Inf(-1),
	0,
	NaN(),
	NaN(),
}
```

### <a id="y1SC" href="#y1SC">var y1SC</a>

```
searchKey: math_test.y1SC
```

```Go
var y1SC = []float64{
	NaN(),
	Inf(-1),
	0,
	NaN(),
	NaN(),
}
```

### <a id="y2SC" href="#y2SC">var y2SC</a>

```
searchKey: math_test.y2SC
```

```Go
var y2SC = []float64{
	NaN(),
	Inf(-1),
	0,
	NaN(),
	NaN(),
}
```

### <a id="yM3SC" href="#yM3SC">var yM3SC</a>

```
searchKey: math_test.yM3SC
```

```Go
var yM3SC = []float64{
	NaN(),
	Inf(1),
	0,
	NaN(),
	NaN(),
}
```

### <a id="vffrexpBC" href="#vffrexpBC">var vffrexpBC</a>

```
searchKey: math_test.vffrexpBC
```

```Go
var vffrexpBC = ...
```

### <a id="frexpBC" href="#frexpBC">var frexpBC</a>

```
searchKey: math_test.frexpBC
```

```Go
var frexpBC = ...
```

### <a id="vfldexpBC" href="#vfldexpBC">var vfldexpBC</a>

```
searchKey: math_test.vfldexpBC
```

```Go
var vfldexpBC = ...
```

### <a id="ldexpBC" href="#ldexpBC">var ldexpBC</a>

```
searchKey: math_test.ldexpBC
```

```Go
var ldexpBC = ...
```

### <a id="logbBC" href="#logbBC">var logbBC</a>

```
searchKey: math_test.logbBC
```

```Go
var logbBC = []float64{
	-1022,
	-1023,
	-1074,
	1023,
	-1022,
	-1023,
	-1074,
	1023,
}
```

### <a id="fmaC" href="#fmaC">var fmaC</a>

```
searchKey: math_test.fmaC
```

```Go
var fmaC = ...
```

Test cases were generated with Berkeley TestFloat-3e/testfloat_gen. [http://www.jhauser.us/arithmetic/TestFloat.html](http://www.jhauser.us/arithmetic/TestFloat.html). The default rounding mode is selected (nearest/even), and exception flags are ignored. 

### <a id="sqrt32" href="#sqrt32">var sqrt32</a>

```
searchKey: math_test.sqrt32
```

```Go
var sqrt32 = ...
```

### <a id="PortableFMA" href="#PortableFMA">var PortableFMA</a>

```
searchKey: math_test.PortableFMA
```

```Go
var PortableFMA = FMA // hide call from compiler intrinsic; falls back to portable code

```

### <a id="floatTests" href="#floatTests">var floatTests</a>

```
searchKey: math_test.floatTests
```

```Go
var floatTests = ...
```

### <a id="indirectSqrt" href="#indirectSqrt">var indirectSqrt</a>

```
searchKey: math_test.indirectSqrt
```

```Go
var indirectSqrt = Sqrt
```

### <a id="GlobalI" href="#GlobalI">var GlobalI</a>

```
searchKey: math_test.GlobalI
```

```Go
var GlobalI int
```

Global exported variables are used to store the return values of functions measured in the benchmarks. Storing the results in these variables prevents the compiler from completely optimizing the benchmarked functions away. 

### <a id="GlobalB" href="#GlobalB">var GlobalB</a>

```
searchKey: math_test.GlobalB
```

```Go
var GlobalB bool
```

Global exported variables are used to store the return values of functions measured in the benchmarks. Storing the results in these variables prevents the compiler from completely optimizing the benchmarked functions away. 

### <a id="GlobalF" href="#GlobalF">var GlobalF</a>

```
searchKey: math_test.GlobalF
```

```Go
var GlobalF float64
```

Global exported variables are used to store the return values of functions measured in the benchmarks. Storing the results in these variables prevents the compiler from completely optimizing the benchmarked functions away. 

### <a id="copysignNeg" href="#copysignNeg">var copysignNeg</a>

```
searchKey: math_test.copysignNeg
```

```Go
var copysignNeg = -1.0
```

### <a id="absPos" href="#absPos">var absPos</a>

```
searchKey: math_test.absPos
```

```Go
var absPos = .5
```

### <a id="pow10pos" href="#pow10pos">var pow10pos</a>

```
searchKey: math_test.pow10pos
```

```Go
var pow10pos = int(300)
```

### <a id="pow10neg" href="#pow10neg">var pow10neg</a>

```
searchKey: math_test.pow10neg
```

```Go
var pow10neg = int(-300)
```

### <a id="roundNeg" href="#roundNeg">var roundNeg</a>

```
searchKey: math_test.roundNeg
```

```Go
var roundNeg = float64(-2.5)
```

### <a id="signbitPos" href="#signbitPos">var signbitPos</a>

```
searchKey: math_test.signbitPos
```

```Go
var signbitPos = 2.5
```

### <a id="roundUint64" href="#roundUint64">var roundUint64</a>

```
searchKey: math_test.roundUint64
```

```Go
var roundUint64 = uint64(5)
```

### <a id="roundFloat32" href="#roundFloat32">var roundFloat32</a>

```
searchKey: math_test.roundFloat32
```

```Go
var roundFloat32 = float32(-2.5)
```

### <a id="roundUint32" href="#roundUint32">var roundUint32</a>

```
searchKey: math_test.roundUint32
```

```Go
var roundUint32 = uint32(5)
```

### <a id="trigHuge" href="#trigHuge">var trigHuge</a>

```
searchKey: math_test.trigHuge
```

```Go
var trigHuge = ...
```

Inputs to test trig_reduce 

### <a id="cosHuge" href="#cosHuge">var cosHuge</a>

```
searchKey: math_test.cosHuge
```

```Go
var cosHuge = ...
```

Results for trigHuge[i] calculated with [https://github.com/robpike/ivy](https://github.com/robpike/ivy) using 4096 bits of working precision.   Values requiring less than 102 decimal digits (1 << 120, 1 << 240, 1 << 480, 1234567891234567 << 180) were confirmed via [https://keisan.casio.com/](https://keisan.casio.com/) 

### <a id="sinHuge" href="#sinHuge">var sinHuge</a>

```
searchKey: math_test.sinHuge
```

```Go
var sinHuge = ...
```

### <a id="tanHuge" href="#tanHuge">var tanHuge</a>

```
searchKey: math_test.tanHuge
```

```Go
var tanHuge = ...
```

## <a id="type" href="#type">Types</a>

### <a id="fi" href="#fi">type fi struct</a>

```
searchKey: math_test.fi
```

```Go
type fi struct {
	f float64
	i int
}
```

### <a id="floatTest" href="#floatTest">type floatTest struct</a>

```
searchKey: math_test.floatTest
```

```Go
type floatTest struct {
	val  interface{}
	name string
	str  string
}
```

## <a id="func" href="#func">Functions</a>

### <a id="tolerance" href="#tolerance">func tolerance(a, b, e float64) bool</a>

```
searchKey: math_test.tolerance
```

```Go
func tolerance(a, b, e float64) bool
```

### <a id="close" href="#close">func close(a, b float64) bool</a>

```
searchKey: math_test.close
```

```Go
func close(a, b float64) bool
```

### <a id="veryclose" href="#veryclose">func veryclose(a, b float64) bool</a>

```
searchKey: math_test.veryclose
```

```Go
func veryclose(a, b float64) bool
```

### <a id="soclose" href="#soclose">func soclose(a, b, e float64) bool</a>

```
searchKey: math_test.soclose
```

```Go
func soclose(a, b, e float64) bool
```

### <a id="alike" href="#alike">func alike(a, b float64) bool</a>

```
searchKey: math_test.alike
```

```Go
func alike(a, b float64) bool
```

### <a id="TestNaN" href="#TestNaN">func TestNaN(t *testing.T)</a>

```
searchKey: math_test.TestNaN
```

```Go
func TestNaN(t *testing.T)
```

### <a id="TestAcos" href="#TestAcos">func TestAcos(t *testing.T)</a>

```
searchKey: math_test.TestAcos
```

```Go
func TestAcos(t *testing.T)
```

### <a id="TestAcosh" href="#TestAcosh">func TestAcosh(t *testing.T)</a>

```
searchKey: math_test.TestAcosh
```

```Go
func TestAcosh(t *testing.T)
```

### <a id="TestAsin" href="#TestAsin">func TestAsin(t *testing.T)</a>

```
searchKey: math_test.TestAsin
```

```Go
func TestAsin(t *testing.T)
```

### <a id="TestAsinh" href="#TestAsinh">func TestAsinh(t *testing.T)</a>

```
searchKey: math_test.TestAsinh
```

```Go
func TestAsinh(t *testing.T)
```

### <a id="TestAtan" href="#TestAtan">func TestAtan(t *testing.T)</a>

```
searchKey: math_test.TestAtan
```

```Go
func TestAtan(t *testing.T)
```

### <a id="TestAtanh" href="#TestAtanh">func TestAtanh(t *testing.T)</a>

```
searchKey: math_test.TestAtanh
```

```Go
func TestAtanh(t *testing.T)
```

### <a id="TestAtan2" href="#TestAtan2">func TestAtan2(t *testing.T)</a>

```
searchKey: math_test.TestAtan2
```

```Go
func TestAtan2(t *testing.T)
```

### <a id="TestCbrt" href="#TestCbrt">func TestCbrt(t *testing.T)</a>

```
searchKey: math_test.TestCbrt
```

```Go
func TestCbrt(t *testing.T)
```

### <a id="TestCeil" href="#TestCeil">func TestCeil(t *testing.T)</a>

```
searchKey: math_test.TestCeil
```

```Go
func TestCeil(t *testing.T)
```

### <a id="TestCopysign" href="#TestCopysign">func TestCopysign(t *testing.T)</a>

```
searchKey: math_test.TestCopysign
```

```Go
func TestCopysign(t *testing.T)
```

### <a id="TestCos" href="#TestCos">func TestCos(t *testing.T)</a>

```
searchKey: math_test.TestCos
```

```Go
func TestCos(t *testing.T)
```

### <a id="TestCosh" href="#TestCosh">func TestCosh(t *testing.T)</a>

```
searchKey: math_test.TestCosh
```

```Go
func TestCosh(t *testing.T)
```

### <a id="TestErf" href="#TestErf">func TestErf(t *testing.T)</a>

```
searchKey: math_test.TestErf
```

```Go
func TestErf(t *testing.T)
```

### <a id="TestErfc" href="#TestErfc">func TestErfc(t *testing.T)</a>

```
searchKey: math_test.TestErfc
```

```Go
func TestErfc(t *testing.T)
```

### <a id="TestErfinv" href="#TestErfinv">func TestErfinv(t *testing.T)</a>

```
searchKey: math_test.TestErfinv
```

```Go
func TestErfinv(t *testing.T)
```

### <a id="TestErfcinv" href="#TestErfcinv">func TestErfcinv(t *testing.T)</a>

```
searchKey: math_test.TestErfcinv
```

```Go
func TestErfcinv(t *testing.T)
```

### <a id="TestExp" href="#TestExp">func TestExp(t *testing.T)</a>

```
searchKey: math_test.TestExp
```

```Go
func TestExp(t *testing.T)
```

### <a id="testExp" href="#testExp">func testExp(t *testing.T, Exp func(float64) float64, name string)</a>

```
searchKey: math_test.testExp
```

```Go
func testExp(t *testing.T, Exp func(float64) float64, name string)
```

### <a id="TestExpm1" href="#TestExpm1">func TestExpm1(t *testing.T)</a>

```
searchKey: math_test.TestExpm1
```

```Go
func TestExpm1(t *testing.T)
```

### <a id="TestExp2" href="#TestExp2">func TestExp2(t *testing.T)</a>

```
searchKey: math_test.TestExp2
```

```Go
func TestExp2(t *testing.T)
```

### <a id="testExp2" href="#testExp2">func testExp2(t *testing.T, Exp2 func(float64) float64, name string)</a>

```
searchKey: math_test.testExp2
```

```Go
func testExp2(t *testing.T, Exp2 func(float64) float64, name string)
```

### <a id="TestAbs" href="#TestAbs">func TestAbs(t *testing.T)</a>

```
searchKey: math_test.TestAbs
```

```Go
func TestAbs(t *testing.T)
```

### <a id="TestDim" href="#TestDim">func TestDim(t *testing.T)</a>

```
searchKey: math_test.TestDim
```

```Go
func TestDim(t *testing.T)
```

### <a id="TestFloor" href="#TestFloor">func TestFloor(t *testing.T)</a>

```
searchKey: math_test.TestFloor
```

```Go
func TestFloor(t *testing.T)
```

### <a id="TestMax" href="#TestMax">func TestMax(t *testing.T)</a>

```
searchKey: math_test.TestMax
```

```Go
func TestMax(t *testing.T)
```

### <a id="TestMin" href="#TestMin">func TestMin(t *testing.T)</a>

```
searchKey: math_test.TestMin
```

```Go
func TestMin(t *testing.T)
```

### <a id="TestMod" href="#TestMod">func TestMod(t *testing.T)</a>

```
searchKey: math_test.TestMod
```

```Go
func TestMod(t *testing.T)
```

### <a id="TestFrexp" href="#TestFrexp">func TestFrexp(t *testing.T)</a>

```
searchKey: math_test.TestFrexp
```

```Go
func TestFrexp(t *testing.T)
```

### <a id="TestGamma" href="#TestGamma">func TestGamma(t *testing.T)</a>

```
searchKey: math_test.TestGamma
```

```Go
func TestGamma(t *testing.T)
```

### <a id="TestHypot" href="#TestHypot">func TestHypot(t *testing.T)</a>

```
searchKey: math_test.TestHypot
```

```Go
func TestHypot(t *testing.T)
```

### <a id="TestHypotGo" href="#TestHypotGo">func TestHypotGo(t *testing.T)</a>

```
searchKey: math_test.TestHypotGo
```

```Go
func TestHypotGo(t *testing.T)
```

### <a id="TestIlogb" href="#TestIlogb">func TestIlogb(t *testing.T)</a>

```
searchKey: math_test.TestIlogb
```

```Go
func TestIlogb(t *testing.T)
```

### <a id="TestJ0" href="#TestJ0">func TestJ0(t *testing.T)</a>

```
searchKey: math_test.TestJ0
```

```Go
func TestJ0(t *testing.T)
```

### <a id="TestJ1" href="#TestJ1">func TestJ1(t *testing.T)</a>

```
searchKey: math_test.TestJ1
```

```Go
func TestJ1(t *testing.T)
```

### <a id="TestJn" href="#TestJn">func TestJn(t *testing.T)</a>

```
searchKey: math_test.TestJn
```

```Go
func TestJn(t *testing.T)
```

### <a id="TestLdexp" href="#TestLdexp">func TestLdexp(t *testing.T)</a>

```
searchKey: math_test.TestLdexp
```

```Go
func TestLdexp(t *testing.T)
```

### <a id="TestLgamma" href="#TestLgamma">func TestLgamma(t *testing.T)</a>

```
searchKey: math_test.TestLgamma
```

```Go
func TestLgamma(t *testing.T)
```

### <a id="TestLog" href="#TestLog">func TestLog(t *testing.T)</a>

```
searchKey: math_test.TestLog
```

```Go
func TestLog(t *testing.T)
```

### <a id="TestLogb" href="#TestLogb">func TestLogb(t *testing.T)</a>

```
searchKey: math_test.TestLogb
```

```Go
func TestLogb(t *testing.T)
```

### <a id="TestLog10" href="#TestLog10">func TestLog10(t *testing.T)</a>

```
searchKey: math_test.TestLog10
```

```Go
func TestLog10(t *testing.T)
```

### <a id="TestLog1p" href="#TestLog1p">func TestLog1p(t *testing.T)</a>

```
searchKey: math_test.TestLog1p
```

```Go
func TestLog1p(t *testing.T)
```

### <a id="TestLog2" href="#TestLog2">func TestLog2(t *testing.T)</a>

```
searchKey: math_test.TestLog2
```

```Go
func TestLog2(t *testing.T)
```

### <a id="TestModf" href="#TestModf">func TestModf(t *testing.T)</a>

```
searchKey: math_test.TestModf
```

```Go
func TestModf(t *testing.T)
```

### <a id="TestNextafter32" href="#TestNextafter32">func TestNextafter32(t *testing.T)</a>

```
searchKey: math_test.TestNextafter32
```

```Go
func TestNextafter32(t *testing.T)
```

### <a id="TestNextafter64" href="#TestNextafter64">func TestNextafter64(t *testing.T)</a>

```
searchKey: math_test.TestNextafter64
```

```Go
func TestNextafter64(t *testing.T)
```

### <a id="TestPow" href="#TestPow">func TestPow(t *testing.T)</a>

```
searchKey: math_test.TestPow
```

```Go
func TestPow(t *testing.T)
```

### <a id="TestPow10" href="#TestPow10">func TestPow10(t *testing.T)</a>

```
searchKey: math_test.TestPow10
```

```Go
func TestPow10(t *testing.T)
```

### <a id="TestRemainder" href="#TestRemainder">func TestRemainder(t *testing.T)</a>

```
searchKey: math_test.TestRemainder
```

```Go
func TestRemainder(t *testing.T)
```

### <a id="TestRound" href="#TestRound">func TestRound(t *testing.T)</a>

```
searchKey: math_test.TestRound
```

```Go
func TestRound(t *testing.T)
```

### <a id="TestRoundToEven" href="#TestRoundToEven">func TestRoundToEven(t *testing.T)</a>

```
searchKey: math_test.TestRoundToEven
```

```Go
func TestRoundToEven(t *testing.T)
```

### <a id="TestSignbit" href="#TestSignbit">func TestSignbit(t *testing.T)</a>

```
searchKey: math_test.TestSignbit
```

```Go
func TestSignbit(t *testing.T)
```

### <a id="TestSin" href="#TestSin">func TestSin(t *testing.T)</a>

```
searchKey: math_test.TestSin
```

```Go
func TestSin(t *testing.T)
```

### <a id="TestSincos" href="#TestSincos">func TestSincos(t *testing.T)</a>

```
searchKey: math_test.TestSincos
```

```Go
func TestSincos(t *testing.T)
```

### <a id="TestSinh" href="#TestSinh">func TestSinh(t *testing.T)</a>

```
searchKey: math_test.TestSinh
```

```Go
func TestSinh(t *testing.T)
```

### <a id="TestSqrt" href="#TestSqrt">func TestSqrt(t *testing.T)</a>

```
searchKey: math_test.TestSqrt
```

```Go
func TestSqrt(t *testing.T)
```

### <a id="TestTan" href="#TestTan">func TestTan(t *testing.T)</a>

```
searchKey: math_test.TestTan
```

```Go
func TestTan(t *testing.T)
```

### <a id="TestTanh" href="#TestTanh">func TestTanh(t *testing.T)</a>

```
searchKey: math_test.TestTanh
```

```Go
func TestTanh(t *testing.T)
```

### <a id="TestTrunc" href="#TestTrunc">func TestTrunc(t *testing.T)</a>

```
searchKey: math_test.TestTrunc
```

```Go
func TestTrunc(t *testing.T)
```

### <a id="TestY0" href="#TestY0">func TestY0(t *testing.T)</a>

```
searchKey: math_test.TestY0
```

```Go
func TestY0(t *testing.T)
```

### <a id="TestY1" href="#TestY1">func TestY1(t *testing.T)</a>

```
searchKey: math_test.TestY1
```

```Go
func TestY1(t *testing.T)
```

### <a id="TestYn" href="#TestYn">func TestYn(t *testing.T)</a>

```
searchKey: math_test.TestYn
```

```Go
func TestYn(t *testing.T)
```

### <a id="TestFMA" href="#TestFMA">func TestFMA(t *testing.T)</a>

```
searchKey: math_test.TestFMA
```

```Go
func TestFMA(t *testing.T)
```

### <a id="TestLargeCos" href="#TestLargeCos">func TestLargeCos(t *testing.T)</a>

```
searchKey: math_test.TestLargeCos
```

```Go
func TestLargeCos(t *testing.T)
```

Check that math functions of high angle values return accurate results. [Since (vf[i] + large) - large != vf[i], testing for Trig(vf[i] + large) == Trig(vf[i]), where large is a multiple of 2*Pi, is misleading.] 

### <a id="TestLargeSin" href="#TestLargeSin">func TestLargeSin(t *testing.T)</a>

```
searchKey: math_test.TestLargeSin
```

```Go
func TestLargeSin(t *testing.T)
```

### <a id="TestLargeSincos" href="#TestLargeSincos">func TestLargeSincos(t *testing.T)</a>

```
searchKey: math_test.TestLargeSincos
```

```Go
func TestLargeSincos(t *testing.T)
```

### <a id="TestLargeTan" href="#TestLargeTan">func TestLargeTan(t *testing.T)</a>

```
searchKey: math_test.TestLargeTan
```

```Go
func TestLargeTan(t *testing.T)
```

### <a id="TestTrigReduce" href="#TestTrigReduce">func TestTrigReduce(t *testing.T)</a>

```
searchKey: math_test.TestTrigReduce
```

```Go
func TestTrigReduce(t *testing.T)
```

Check that trigReduce matches the standard reduction results for input values below reduceThreshold. 

### <a id="TestFloatMinMax" href="#TestFloatMinMax">func TestFloatMinMax(t *testing.T)</a>

```
searchKey: math_test.TestFloatMinMax
```

```Go
func TestFloatMinMax(t *testing.T)
```

### <a id="TestFloatMinima" href="#TestFloatMinima">func TestFloatMinima(t *testing.T)</a>

```
searchKey: math_test.TestFloatMinima
```

```Go
func TestFloatMinima(t *testing.T)
```

### <a id="TestFloat32Sqrt" href="#TestFloat32Sqrt">func TestFloat32Sqrt(t *testing.T)</a>

```
searchKey: math_test.TestFloat32Sqrt
```

```Go
func TestFloat32Sqrt(t *testing.T)
```

TestFloat32Sqrt checks the correctness of the float32 square root optimization result. 

### <a id="BenchmarkAcos" href="#BenchmarkAcos">func BenchmarkAcos(b *testing.B)</a>

```
searchKey: math_test.BenchmarkAcos
```

```Go
func BenchmarkAcos(b *testing.B)
```

### <a id="BenchmarkAcosh" href="#BenchmarkAcosh">func BenchmarkAcosh(b *testing.B)</a>

```
searchKey: math_test.BenchmarkAcosh
```

```Go
func BenchmarkAcosh(b *testing.B)
```

### <a id="BenchmarkAsin" href="#BenchmarkAsin">func BenchmarkAsin(b *testing.B)</a>

```
searchKey: math_test.BenchmarkAsin
```

```Go
func BenchmarkAsin(b *testing.B)
```

### <a id="BenchmarkAsinh" href="#BenchmarkAsinh">func BenchmarkAsinh(b *testing.B)</a>

```
searchKey: math_test.BenchmarkAsinh
```

```Go
func BenchmarkAsinh(b *testing.B)
```

### <a id="BenchmarkAtan" href="#BenchmarkAtan">func BenchmarkAtan(b *testing.B)</a>

```
searchKey: math_test.BenchmarkAtan
```

```Go
func BenchmarkAtan(b *testing.B)
```

### <a id="BenchmarkAtanh" href="#BenchmarkAtanh">func BenchmarkAtanh(b *testing.B)</a>

```
searchKey: math_test.BenchmarkAtanh
```

```Go
func BenchmarkAtanh(b *testing.B)
```

### <a id="BenchmarkAtan2" href="#BenchmarkAtan2">func BenchmarkAtan2(b *testing.B)</a>

```
searchKey: math_test.BenchmarkAtan2
```

```Go
func BenchmarkAtan2(b *testing.B)
```

### <a id="BenchmarkCbrt" href="#BenchmarkCbrt">func BenchmarkCbrt(b *testing.B)</a>

```
searchKey: math_test.BenchmarkCbrt
```

```Go
func BenchmarkCbrt(b *testing.B)
```

### <a id="BenchmarkCeil" href="#BenchmarkCeil">func BenchmarkCeil(b *testing.B)</a>

```
searchKey: math_test.BenchmarkCeil
```

```Go
func BenchmarkCeil(b *testing.B)
```

### <a id="BenchmarkCopysign" href="#BenchmarkCopysign">func BenchmarkCopysign(b *testing.B)</a>

```
searchKey: math_test.BenchmarkCopysign
```

```Go
func BenchmarkCopysign(b *testing.B)
```

### <a id="BenchmarkCos" href="#BenchmarkCos">func BenchmarkCos(b *testing.B)</a>

```
searchKey: math_test.BenchmarkCos
```

```Go
func BenchmarkCos(b *testing.B)
```

### <a id="BenchmarkCosh" href="#BenchmarkCosh">func BenchmarkCosh(b *testing.B)</a>

```
searchKey: math_test.BenchmarkCosh
```

```Go
func BenchmarkCosh(b *testing.B)
```

### <a id="BenchmarkErf" href="#BenchmarkErf">func BenchmarkErf(b *testing.B)</a>

```
searchKey: math_test.BenchmarkErf
```

```Go
func BenchmarkErf(b *testing.B)
```

### <a id="BenchmarkErfc" href="#BenchmarkErfc">func BenchmarkErfc(b *testing.B)</a>

```
searchKey: math_test.BenchmarkErfc
```

```Go
func BenchmarkErfc(b *testing.B)
```

### <a id="BenchmarkErfinv" href="#BenchmarkErfinv">func BenchmarkErfinv(b *testing.B)</a>

```
searchKey: math_test.BenchmarkErfinv
```

```Go
func BenchmarkErfinv(b *testing.B)
```

### <a id="BenchmarkErfcinv" href="#BenchmarkErfcinv">func BenchmarkErfcinv(b *testing.B)</a>

```
searchKey: math_test.BenchmarkErfcinv
```

```Go
func BenchmarkErfcinv(b *testing.B)
```

### <a id="BenchmarkExp" href="#BenchmarkExp">func BenchmarkExp(b *testing.B)</a>

```
searchKey: math_test.BenchmarkExp
```

```Go
func BenchmarkExp(b *testing.B)
```

### <a id="BenchmarkExpGo" href="#BenchmarkExpGo">func BenchmarkExpGo(b *testing.B)</a>

```
searchKey: math_test.BenchmarkExpGo
```

```Go
func BenchmarkExpGo(b *testing.B)
```

### <a id="BenchmarkExpm1" href="#BenchmarkExpm1">func BenchmarkExpm1(b *testing.B)</a>

```
searchKey: math_test.BenchmarkExpm1
```

```Go
func BenchmarkExpm1(b *testing.B)
```

### <a id="BenchmarkExp2" href="#BenchmarkExp2">func BenchmarkExp2(b *testing.B)</a>

```
searchKey: math_test.BenchmarkExp2
```

```Go
func BenchmarkExp2(b *testing.B)
```

### <a id="BenchmarkExp2Go" href="#BenchmarkExp2Go">func BenchmarkExp2Go(b *testing.B)</a>

```
searchKey: math_test.BenchmarkExp2Go
```

```Go
func BenchmarkExp2Go(b *testing.B)
```

### <a id="BenchmarkAbs" href="#BenchmarkAbs">func BenchmarkAbs(b *testing.B)</a>

```
searchKey: math_test.BenchmarkAbs
```

```Go
func BenchmarkAbs(b *testing.B)
```

### <a id="BenchmarkDim" href="#BenchmarkDim">func BenchmarkDim(b *testing.B)</a>

```
searchKey: math_test.BenchmarkDim
```

```Go
func BenchmarkDim(b *testing.B)
```

### <a id="BenchmarkFloor" href="#BenchmarkFloor">func BenchmarkFloor(b *testing.B)</a>

```
searchKey: math_test.BenchmarkFloor
```

```Go
func BenchmarkFloor(b *testing.B)
```

### <a id="BenchmarkMax" href="#BenchmarkMax">func BenchmarkMax(b *testing.B)</a>

```
searchKey: math_test.BenchmarkMax
```

```Go
func BenchmarkMax(b *testing.B)
```

### <a id="BenchmarkMin" href="#BenchmarkMin">func BenchmarkMin(b *testing.B)</a>

```
searchKey: math_test.BenchmarkMin
```

```Go
func BenchmarkMin(b *testing.B)
```

### <a id="BenchmarkMod" href="#BenchmarkMod">func BenchmarkMod(b *testing.B)</a>

```
searchKey: math_test.BenchmarkMod
```

```Go
func BenchmarkMod(b *testing.B)
```

### <a id="BenchmarkFrexp" href="#BenchmarkFrexp">func BenchmarkFrexp(b *testing.B)</a>

```
searchKey: math_test.BenchmarkFrexp
```

```Go
func BenchmarkFrexp(b *testing.B)
```

### <a id="BenchmarkGamma" href="#BenchmarkGamma">func BenchmarkGamma(b *testing.B)</a>

```
searchKey: math_test.BenchmarkGamma
```

```Go
func BenchmarkGamma(b *testing.B)
```

### <a id="BenchmarkHypot" href="#BenchmarkHypot">func BenchmarkHypot(b *testing.B)</a>

```
searchKey: math_test.BenchmarkHypot
```

```Go
func BenchmarkHypot(b *testing.B)
```

### <a id="BenchmarkHypotGo" href="#BenchmarkHypotGo">func BenchmarkHypotGo(b *testing.B)</a>

```
searchKey: math_test.BenchmarkHypotGo
```

```Go
func BenchmarkHypotGo(b *testing.B)
```

### <a id="BenchmarkIlogb" href="#BenchmarkIlogb">func BenchmarkIlogb(b *testing.B)</a>

```
searchKey: math_test.BenchmarkIlogb
```

```Go
func BenchmarkIlogb(b *testing.B)
```

### <a id="BenchmarkJ0" href="#BenchmarkJ0">func BenchmarkJ0(b *testing.B)</a>

```
searchKey: math_test.BenchmarkJ0
```

```Go
func BenchmarkJ0(b *testing.B)
```

### <a id="BenchmarkJ1" href="#BenchmarkJ1">func BenchmarkJ1(b *testing.B)</a>

```
searchKey: math_test.BenchmarkJ1
```

```Go
func BenchmarkJ1(b *testing.B)
```

### <a id="BenchmarkJn" href="#BenchmarkJn">func BenchmarkJn(b *testing.B)</a>

```
searchKey: math_test.BenchmarkJn
```

```Go
func BenchmarkJn(b *testing.B)
```

### <a id="BenchmarkLdexp" href="#BenchmarkLdexp">func BenchmarkLdexp(b *testing.B)</a>

```
searchKey: math_test.BenchmarkLdexp
```

```Go
func BenchmarkLdexp(b *testing.B)
```

### <a id="BenchmarkLgamma" href="#BenchmarkLgamma">func BenchmarkLgamma(b *testing.B)</a>

```
searchKey: math_test.BenchmarkLgamma
```

```Go
func BenchmarkLgamma(b *testing.B)
```

### <a id="BenchmarkLog" href="#BenchmarkLog">func BenchmarkLog(b *testing.B)</a>

```
searchKey: math_test.BenchmarkLog
```

```Go
func BenchmarkLog(b *testing.B)
```

### <a id="BenchmarkLogb" href="#BenchmarkLogb">func BenchmarkLogb(b *testing.B)</a>

```
searchKey: math_test.BenchmarkLogb
```

```Go
func BenchmarkLogb(b *testing.B)
```

### <a id="BenchmarkLog1p" href="#BenchmarkLog1p">func BenchmarkLog1p(b *testing.B)</a>

```
searchKey: math_test.BenchmarkLog1p
```

```Go
func BenchmarkLog1p(b *testing.B)
```

### <a id="BenchmarkLog10" href="#BenchmarkLog10">func BenchmarkLog10(b *testing.B)</a>

```
searchKey: math_test.BenchmarkLog10
```

```Go
func BenchmarkLog10(b *testing.B)
```

### <a id="BenchmarkLog2" href="#BenchmarkLog2">func BenchmarkLog2(b *testing.B)</a>

```
searchKey: math_test.BenchmarkLog2
```

```Go
func BenchmarkLog2(b *testing.B)
```

### <a id="BenchmarkModf" href="#BenchmarkModf">func BenchmarkModf(b *testing.B)</a>

```
searchKey: math_test.BenchmarkModf
```

```Go
func BenchmarkModf(b *testing.B)
```

### <a id="BenchmarkNextafter32" href="#BenchmarkNextafter32">func BenchmarkNextafter32(b *testing.B)</a>

```
searchKey: math_test.BenchmarkNextafter32
```

```Go
func BenchmarkNextafter32(b *testing.B)
```

### <a id="BenchmarkNextafter64" href="#BenchmarkNextafter64">func BenchmarkNextafter64(b *testing.B)</a>

```
searchKey: math_test.BenchmarkNextafter64
```

```Go
func BenchmarkNextafter64(b *testing.B)
```

### <a id="BenchmarkPowInt" href="#BenchmarkPowInt">func BenchmarkPowInt(b *testing.B)</a>

```
searchKey: math_test.BenchmarkPowInt
```

```Go
func BenchmarkPowInt(b *testing.B)
```

### <a id="BenchmarkPowFrac" href="#BenchmarkPowFrac">func BenchmarkPowFrac(b *testing.B)</a>

```
searchKey: math_test.BenchmarkPowFrac
```

```Go
func BenchmarkPowFrac(b *testing.B)
```

### <a id="BenchmarkPow10Pos" href="#BenchmarkPow10Pos">func BenchmarkPow10Pos(b *testing.B)</a>

```
searchKey: math_test.BenchmarkPow10Pos
```

```Go
func BenchmarkPow10Pos(b *testing.B)
```

### <a id="BenchmarkPow10Neg" href="#BenchmarkPow10Neg">func BenchmarkPow10Neg(b *testing.B)</a>

```
searchKey: math_test.BenchmarkPow10Neg
```

```Go
func BenchmarkPow10Neg(b *testing.B)
```

### <a id="BenchmarkRound" href="#BenchmarkRound">func BenchmarkRound(b *testing.B)</a>

```
searchKey: math_test.BenchmarkRound
```

```Go
func BenchmarkRound(b *testing.B)
```

### <a id="BenchmarkRoundToEven" href="#BenchmarkRoundToEven">func BenchmarkRoundToEven(b *testing.B)</a>

```
searchKey: math_test.BenchmarkRoundToEven
```

```Go
func BenchmarkRoundToEven(b *testing.B)
```

### <a id="BenchmarkRemainder" href="#BenchmarkRemainder">func BenchmarkRemainder(b *testing.B)</a>

```
searchKey: math_test.BenchmarkRemainder
```

```Go
func BenchmarkRemainder(b *testing.B)
```

### <a id="BenchmarkSignbit" href="#BenchmarkSignbit">func BenchmarkSignbit(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSignbit
```

```Go
func BenchmarkSignbit(b *testing.B)
```

### <a id="BenchmarkSin" href="#BenchmarkSin">func BenchmarkSin(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSin
```

```Go
func BenchmarkSin(b *testing.B)
```

### <a id="BenchmarkSincos" href="#BenchmarkSincos">func BenchmarkSincos(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSincos
```

```Go
func BenchmarkSincos(b *testing.B)
```

### <a id="BenchmarkSinh" href="#BenchmarkSinh">func BenchmarkSinh(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSinh
```

```Go
func BenchmarkSinh(b *testing.B)
```

### <a id="BenchmarkSqrtIndirect" href="#BenchmarkSqrtIndirect">func BenchmarkSqrtIndirect(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSqrtIndirect
```

```Go
func BenchmarkSqrtIndirect(b *testing.B)
```

### <a id="BenchmarkSqrtLatency" href="#BenchmarkSqrtLatency">func BenchmarkSqrtLatency(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSqrtLatency
```

```Go
func BenchmarkSqrtLatency(b *testing.B)
```

### <a id="BenchmarkSqrtIndirectLatency" href="#BenchmarkSqrtIndirectLatency">func BenchmarkSqrtIndirectLatency(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSqrtIndirectLatency
```

```Go
func BenchmarkSqrtIndirectLatency(b *testing.B)
```

### <a id="BenchmarkSqrtGoLatency" href="#BenchmarkSqrtGoLatency">func BenchmarkSqrtGoLatency(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSqrtGoLatency
```

```Go
func BenchmarkSqrtGoLatency(b *testing.B)
```

### <a id="isPrime" href="#isPrime">func isPrime(i int) bool</a>

```
searchKey: math_test.isPrime
```

```Go
func isPrime(i int) bool
```

### <a id="BenchmarkSqrtPrime" href="#BenchmarkSqrtPrime">func BenchmarkSqrtPrime(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSqrtPrime
```

```Go
func BenchmarkSqrtPrime(b *testing.B)
```

### <a id="BenchmarkTan" href="#BenchmarkTan">func BenchmarkTan(b *testing.B)</a>

```
searchKey: math_test.BenchmarkTan
```

```Go
func BenchmarkTan(b *testing.B)
```

### <a id="BenchmarkTanh" href="#BenchmarkTanh">func BenchmarkTanh(b *testing.B)</a>

```
searchKey: math_test.BenchmarkTanh
```

```Go
func BenchmarkTanh(b *testing.B)
```

### <a id="BenchmarkTrunc" href="#BenchmarkTrunc">func BenchmarkTrunc(b *testing.B)</a>

```
searchKey: math_test.BenchmarkTrunc
```

```Go
func BenchmarkTrunc(b *testing.B)
```

### <a id="BenchmarkY0" href="#BenchmarkY0">func BenchmarkY0(b *testing.B)</a>

```
searchKey: math_test.BenchmarkY0
```

```Go
func BenchmarkY0(b *testing.B)
```

### <a id="BenchmarkY1" href="#BenchmarkY1">func BenchmarkY1(b *testing.B)</a>

```
searchKey: math_test.BenchmarkY1
```

```Go
func BenchmarkY1(b *testing.B)
```

### <a id="BenchmarkYn" href="#BenchmarkYn">func BenchmarkYn(b *testing.B)</a>

```
searchKey: math_test.BenchmarkYn
```

```Go
func BenchmarkYn(b *testing.B)
```

### <a id="BenchmarkFloat64bits" href="#BenchmarkFloat64bits">func BenchmarkFloat64bits(b *testing.B)</a>

```
searchKey: math_test.BenchmarkFloat64bits
```

```Go
func BenchmarkFloat64bits(b *testing.B)
```

### <a id="BenchmarkFloat64frombits" href="#BenchmarkFloat64frombits">func BenchmarkFloat64frombits(b *testing.B)</a>

```
searchKey: math_test.BenchmarkFloat64frombits
```

```Go
func BenchmarkFloat64frombits(b *testing.B)
```

### <a id="BenchmarkFloat32bits" href="#BenchmarkFloat32bits">func BenchmarkFloat32bits(b *testing.B)</a>

```
searchKey: math_test.BenchmarkFloat32bits
```

```Go
func BenchmarkFloat32bits(b *testing.B)
```

### <a id="BenchmarkFloat32frombits" href="#BenchmarkFloat32frombits">func BenchmarkFloat32frombits(b *testing.B)</a>

```
searchKey: math_test.BenchmarkFloat32frombits
```

```Go
func BenchmarkFloat32frombits(b *testing.B)
```

### <a id="BenchmarkFMA" href="#BenchmarkFMA">func BenchmarkFMA(b *testing.B)</a>

```
searchKey: math_test.BenchmarkFMA
```

```Go
func BenchmarkFMA(b *testing.B)
```

### <a id="TestMaxUint" href="#TestMaxUint">func TestMaxUint(t *testing.T)</a>

```
searchKey: math_test.TestMaxUint
```

```Go
func TestMaxUint(t *testing.T)
```

### <a id="TestMaxInt" href="#TestMaxInt">func TestMaxInt(t *testing.T)</a>

```
searchKey: math_test.TestMaxInt
```

```Go
func TestMaxInt(t *testing.T)
```

### <a id="ExampleAcos" href="#ExampleAcos">func ExampleAcos()</a>

```
searchKey: math_test.ExampleAcos
```

```Go
func ExampleAcos()
```

### <a id="ExampleAcosh" href="#ExampleAcosh">func ExampleAcosh()</a>

```
searchKey: math_test.ExampleAcosh
```

```Go
func ExampleAcosh()
```

### <a id="ExampleAsin" href="#ExampleAsin">func ExampleAsin()</a>

```
searchKey: math_test.ExampleAsin
```

```Go
func ExampleAsin()
```

### <a id="ExampleAsinh" href="#ExampleAsinh">func ExampleAsinh()</a>

```
searchKey: math_test.ExampleAsinh
```

```Go
func ExampleAsinh()
```

### <a id="ExampleAtan" href="#ExampleAtan">func ExampleAtan()</a>

```
searchKey: math_test.ExampleAtan
```

```Go
func ExampleAtan()
```

### <a id="ExampleAtan2" href="#ExampleAtan2">func ExampleAtan2()</a>

```
searchKey: math_test.ExampleAtan2
```

```Go
func ExampleAtan2()
```

### <a id="ExampleAtanh" href="#ExampleAtanh">func ExampleAtanh()</a>

```
searchKey: math_test.ExampleAtanh
```

```Go
func ExampleAtanh()
```

### <a id="ExampleCopysign" href="#ExampleCopysign">func ExampleCopysign()</a>

```
searchKey: math_test.ExampleCopysign
```

```Go
func ExampleCopysign()
```

### <a id="ExampleCos" href="#ExampleCos">func ExampleCos()</a>

```
searchKey: math_test.ExampleCos
```

```Go
func ExampleCos()
```

### <a id="ExampleCosh" href="#ExampleCosh">func ExampleCosh()</a>

```
searchKey: math_test.ExampleCosh
```

```Go
func ExampleCosh()
```

### <a id="ExampleSin" href="#ExampleSin">func ExampleSin()</a>

```
searchKey: math_test.ExampleSin
```

```Go
func ExampleSin()
```

### <a id="ExampleSincos" href="#ExampleSincos">func ExampleSincos()</a>

```
searchKey: math_test.ExampleSincos
```

```Go
func ExampleSincos()
```

### <a id="ExampleSinh" href="#ExampleSinh">func ExampleSinh()</a>

```
searchKey: math_test.ExampleSinh
```

```Go
func ExampleSinh()
```

### <a id="ExampleTan" href="#ExampleTan">func ExampleTan()</a>

```
searchKey: math_test.ExampleTan
```

```Go
func ExampleTan()
```

### <a id="ExampleTanh" href="#ExampleTanh">func ExampleTanh()</a>

```
searchKey: math_test.ExampleTanh
```

```Go
func ExampleTanh()
```

### <a id="ExampleSqrt" href="#ExampleSqrt">func ExampleSqrt()</a>

```
searchKey: math_test.ExampleSqrt
```

```Go
func ExampleSqrt()
```

### <a id="ExampleCeil" href="#ExampleCeil">func ExampleCeil()</a>

```
searchKey: math_test.ExampleCeil
```

```Go
func ExampleCeil()
```

### <a id="ExampleFloor" href="#ExampleFloor">func ExampleFloor()</a>

```
searchKey: math_test.ExampleFloor
```

```Go
func ExampleFloor()
```

### <a id="ExamplePow" href="#ExamplePow">func ExamplePow()</a>

```
searchKey: math_test.ExamplePow
```

```Go
func ExamplePow()
```

### <a id="ExamplePow10" href="#ExamplePow10">func ExamplePow10()</a>

```
searchKey: math_test.ExamplePow10
```

```Go
func ExamplePow10()
```

### <a id="ExampleRound" href="#ExampleRound">func ExampleRound()</a>

```
searchKey: math_test.ExampleRound
```

```Go
func ExampleRound()
```

### <a id="ExampleRoundToEven" href="#ExampleRoundToEven">func ExampleRoundToEven()</a>

```
searchKey: math_test.ExampleRoundToEven
```

```Go
func ExampleRoundToEven()
```

### <a id="ExampleLog" href="#ExampleLog">func ExampleLog()</a>

```
searchKey: math_test.ExampleLog
```

```Go
func ExampleLog()
```

### <a id="ExampleLog2" href="#ExampleLog2">func ExampleLog2()</a>

```
searchKey: math_test.ExampleLog2
```

```Go
func ExampleLog2()
```

### <a id="ExampleLog10" href="#ExampleLog10">func ExampleLog10()</a>

```
searchKey: math_test.ExampleLog10
```

```Go
func ExampleLog10()
```

### <a id="ExampleMod" href="#ExampleMod">func ExampleMod()</a>

```
searchKey: math_test.ExampleMod
```

```Go
func ExampleMod()
```

### <a id="ExampleAbs" href="#ExampleAbs">func ExampleAbs()</a>

```
searchKey: math_test.ExampleAbs
```

```Go
func ExampleAbs()
```

### <a id="ExampleDim" href="#ExampleDim">func ExampleDim()</a>

```
searchKey: math_test.ExampleDim
```

```Go
func ExampleDim()
```

### <a id="ExampleExp" href="#ExampleExp">func ExampleExp()</a>

```
searchKey: math_test.ExampleExp
```

```Go
func ExampleExp()
```

### <a id="ExampleExp2" href="#ExampleExp2">func ExampleExp2()</a>

```
searchKey: math_test.ExampleExp2
```

```Go
func ExampleExp2()
```

### <a id="ExampleExpm1" href="#ExampleExpm1">func ExampleExpm1()</a>

```
searchKey: math_test.ExampleExpm1
```

```Go
func ExampleExpm1()
```

### <a id="ExampleTrunc" href="#ExampleTrunc">func ExampleTrunc()</a>

```
searchKey: math_test.ExampleTrunc
```

```Go
func ExampleTrunc()
```

### <a id="ExampleCbrt" href="#ExampleCbrt">func ExampleCbrt()</a>

```
searchKey: math_test.ExampleCbrt
```

```Go
func ExampleCbrt()
```

### <a id="ExampleModf" href="#ExampleModf">func ExampleModf()</a>

```
searchKey: math_test.ExampleModf
```

```Go
func ExampleModf()
```

### <a id="TestHugeCos" href="#TestHugeCos">func TestHugeCos(t *testing.T)</a>

```
searchKey: math_test.TestHugeCos
```

```Go
func TestHugeCos(t *testing.T)
```

Check that trig values of huge angles return accurate results. This confirms that argument reduction works for very large values up to MaxFloat64. 

### <a id="TestHugeSin" href="#TestHugeSin">func TestHugeSin(t *testing.T)</a>

```
searchKey: math_test.TestHugeSin
```

```Go
func TestHugeSin(t *testing.T)
```

### <a id="TestHugeSinCos" href="#TestHugeSinCos">func TestHugeSinCos(t *testing.T)</a>

```
searchKey: math_test.TestHugeSinCos
```

```Go
func TestHugeSinCos(t *testing.T)
```

### <a id="TestHugeTan" href="#TestHugeTan">func TestHugeTan(t *testing.T)</a>

```
searchKey: math_test.TestHugeTan
```

```Go
func TestHugeTan(t *testing.T)
```

