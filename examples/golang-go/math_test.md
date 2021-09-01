# Package math_test

## Index

* [Constants](#const)
    * [const LargestSubnormalFloat64](#LargestSubnormalFloat64)
    * [const SmallestNormalFloat64](#SmallestNormalFloat64)
* [Variables](#var)
    * [var GlobalB](#GlobalB)
    * [var GlobalF](#GlobalF)
    * [var GlobalI](#GlobalI)
    * [var PortableFMA](#PortableFMA)
    * [var absPos](#absPos)
    * [var acos](#acos)
    * [var acosSC](#acosSC)
    * [var acosh](#acosh)
    * [var acoshSC](#acoshSC)
    * [var asin](#asin)
    * [var asinSC](#asinSC)
    * [var asinh](#asinh)
    * [var asinhSC](#asinhSC)
    * [var atan](#atan)
    * [var atan2](#atan2)
    * [var atan2SC](#atan2SC)
    * [var atanSC](#atanSC)
    * [var atanh](#atanh)
    * [var atanhSC](#atanhSC)
    * [var cbrt](#cbrt)
    * [var cbrtSC](#cbrtSC)
    * [var ceil](#ceil)
    * [var ceilSC](#ceilSC)
    * [var copysign](#copysign)
    * [var copysignNeg](#copysignNeg)
    * [var copysignSC](#copysignSC)
    * [var cos](#cos)
    * [var cosHuge](#cosHuge)
    * [var cosLarge](#cosLarge)
    * [var cosSC](#cosSC)
    * [var cosh](#cosh)
    * [var coshSC](#coshSC)
    * [var erf](#erf)
    * [var erfSC](#erfSC)
    * [var erfc](#erfc)
    * [var erfcSC](#erfcSC)
    * [var erfcinvSC](#erfcinvSC)
    * [var erfinv](#erfinv)
    * [var erfinvSC](#erfinvSC)
    * [var exp](#exp)
    * [var exp2](#exp2)
    * [var exp2SC](#exp2SC)
    * [var expSC](#expSC)
    * [var expm1](#expm1)
    * [var expm1Large](#expm1Large)
    * [var expm1SC](#expm1SC)
    * [var fabs](#fabs)
    * [var fabsSC](#fabsSC)
    * [var fdim](#fdim)
    * [var fdimSC](#fdimSC)
    * [var floatTests](#floatTests)
    * [var floor](#floor)
    * [var fmaC](#fmaC)
    * [var fmaxSC](#fmaxSC)
    * [var fminSC](#fminSC)
    * [var fmod](#fmod)
    * [var fmodSC](#fmodSC)
    * [var frexp](#frexp)
    * [var frexpBC](#frexpBC)
    * [var frexpSC](#frexpSC)
    * [var gamma](#gamma)
    * [var hypotSC](#hypotSC)
    * [var ilogbSC](#ilogbSC)
    * [var indirectSqrt](#indirectSqrt)
    * [var j0](#j0)
    * [var j0SC](#j0SC)
    * [var j1](#j1)
    * [var j1SC](#j1SC)
    * [var j2](#j2)
    * [var j2SC](#j2SC)
    * [var jM3](#jM3)
    * [var jM3SC](#jM3SC)
    * [var ldexpBC](#ldexpBC)
    * [var ldexpSC](#ldexpSC)
    * [var lgamma](#lgamma)
    * [var lgammaSC](#lgammaSC)
    * [var log](#log)
    * [var log10](#log10)
    * [var log1p](#log1p)
    * [var log1pSC](#log1pSC)
    * [var log2](#log2)
    * [var logSC](#logSC)
    * [var logb](#logb)
    * [var logbBC](#logbBC)
    * [var logbSC](#logbSC)
    * [var modf](#modf)
    * [var modfSC](#modfSC)
    * [var nan](#nan)
    * [var nextafter32](#nextafter32)
    * [var nextafter32SC](#nextafter32SC)
    * [var nextafter64](#nextafter64)
    * [var nextafter64SC](#nextafter64SC)
    * [var pow](#pow)
    * [var pow10SC](#pow10SC)
    * [var pow10neg](#pow10neg)
    * [var pow10pos](#pow10pos)
    * [var powSC](#powSC)
    * [var remainder](#remainder)
    * [var round](#round)
    * [var roundFloat32](#roundFloat32)
    * [var roundNeg](#roundNeg)
    * [var roundUint32](#roundUint32)
    * [var roundUint64](#roundUint64)
    * [var signbit](#signbit)
    * [var signbitPos](#signbitPos)
    * [var signbitSC](#signbitSC)
    * [var sin](#sin)
    * [var sinHuge](#sinHuge)
    * [var sinLarge](#sinLarge)
    * [var sinSC](#sinSC)
    * [var sinh](#sinh)
    * [var sinhSC](#sinhSC)
    * [var sqrt](#sqrt)
    * [var sqrt32](#sqrt32)
    * [var sqrtSC](#sqrtSC)
    * [var tan](#tan)
    * [var tanHuge](#tanHuge)
    * [var tanLarge](#tanLarge)
    * [var tanh](#tanh)
    * [var tanhSC](#tanhSC)
    * [var trigHuge](#trigHuge)
    * [var trunc](#trunc)
    * [var vf](#vf)
    * [var vfacosSC](#vfacosSC)
    * [var vfacoshSC](#vfacoshSC)
    * [var vfasinSC](#vfasinSC)
    * [var vfasinhSC](#vfasinhSC)
    * [var vfatan2SC](#vfatan2SC)
    * [var vfatanSC](#vfatanSC)
    * [var vfatanhSC](#vfatanhSC)
    * [var vfcbrtSC](#vfcbrtSC)
    * [var vfceilSC](#vfceilSC)
    * [var vfcopysignSC](#vfcopysignSC)
    * [var vfcosSC](#vfcosSC)
    * [var vfcoshSC](#vfcoshSC)
    * [var vferfSC](#vferfSC)
    * [var vferfcSC](#vferfcSC)
    * [var vferfcinvSC](#vferfcinvSC)
    * [var vferfinvSC](#vferfinvSC)
    * [var vfexp2SC](#vfexp2SC)
    * [var vfexpSC](#vfexpSC)
    * [var vfexpm1SC](#vfexpm1SC)
    * [var vffabsSC](#vffabsSC)
    * [var vffdim2SC](#vffdim2SC)
    * [var vffdimSC](#vffdimSC)
    * [var vffmodSC](#vffmodSC)
    * [var vffrexpBC](#vffrexpBC)
    * [var vffrexpSC](#vffrexpSC)
    * [var vfgamma](#vfgamma)
    * [var vfhypotSC](#vfhypotSC)
    * [var vfj0SC](#vfj0SC)
    * [var vfldexpBC](#vfldexpBC)
    * [var vfldexpSC](#vfldexpSC)
    * [var vflgammaSC](#vflgammaSC)
    * [var vflog1pSC](#vflog1pSC)
    * [var vflogSC](#vflogSC)
    * [var vflogbSC](#vflogbSC)
    * [var vfmodfSC](#vfmodfSC)
    * [var vfnextafter32SC](#vfnextafter32SC)
    * [var vfnextafter64SC](#vfnextafter64SC)
    * [var vfpow10SC](#vfpow10SC)
    * [var vfpowSC](#vfpowSC)
    * [var vfroundEvenSC](#vfroundEvenSC)
    * [var vfroundSC](#vfroundSC)
    * [var vfsignbitSC](#vfsignbitSC)
    * [var vfsinSC](#vfsinSC)
    * [var vfsinhSC](#vfsinhSC)
    * [var vfsqrtSC](#vfsqrtSC)
    * [var vftanhSC](#vftanhSC)
    * [var vfy0SC](#vfy0SC)
    * [var y0](#y0)
    * [var y0SC](#y0SC)
    * [var y1](#y1)
    * [var y1SC](#y1SC)
    * [var y2](#y2)
    * [var y2SC](#y2SC)
    * [var yM3](#yM3)
    * [var yM3SC](#yM3SC)
* [Types](#type)
    * [type fi struct](#fi)
    * [type floatTest struct](#floatTest)
* [Functions](#func)
    * [func BenchmarkAbs(b *testing.B)](#BenchmarkAbs)
    * [func BenchmarkAcos(b *testing.B)](#BenchmarkAcos)
    * [func BenchmarkAcosh(b *testing.B)](#BenchmarkAcosh)
    * [func BenchmarkAsin(b *testing.B)](#BenchmarkAsin)
    * [func BenchmarkAsinh(b *testing.B)](#BenchmarkAsinh)
    * [func BenchmarkAtan(b *testing.B)](#BenchmarkAtan)
    * [func BenchmarkAtan2(b *testing.B)](#BenchmarkAtan2)
    * [func BenchmarkAtanh(b *testing.B)](#BenchmarkAtanh)
    * [func BenchmarkCbrt(b *testing.B)](#BenchmarkCbrt)
    * [func BenchmarkCeil(b *testing.B)](#BenchmarkCeil)
    * [func BenchmarkCopysign(b *testing.B)](#BenchmarkCopysign)
    * [func BenchmarkCos(b *testing.B)](#BenchmarkCos)
    * [func BenchmarkCosh(b *testing.B)](#BenchmarkCosh)
    * [func BenchmarkDim(b *testing.B)](#BenchmarkDim)
    * [func BenchmarkErf(b *testing.B)](#BenchmarkErf)
    * [func BenchmarkErfc(b *testing.B)](#BenchmarkErfc)
    * [func BenchmarkErfcinv(b *testing.B)](#BenchmarkErfcinv)
    * [func BenchmarkErfinv(b *testing.B)](#BenchmarkErfinv)
    * [func BenchmarkExp(b *testing.B)](#BenchmarkExp)
    * [func BenchmarkExp2(b *testing.B)](#BenchmarkExp2)
    * [func BenchmarkExp2Go(b *testing.B)](#BenchmarkExp2Go)
    * [func BenchmarkExpGo(b *testing.B)](#BenchmarkExpGo)
    * [func BenchmarkExpm1(b *testing.B)](#BenchmarkExpm1)
    * [func BenchmarkFMA(b *testing.B)](#BenchmarkFMA)
    * [func BenchmarkFloat32bits(b *testing.B)](#BenchmarkFloat32bits)
    * [func BenchmarkFloat32frombits(b *testing.B)](#BenchmarkFloat32frombits)
    * [func BenchmarkFloat64bits(b *testing.B)](#BenchmarkFloat64bits)
    * [func BenchmarkFloat64frombits(b *testing.B)](#BenchmarkFloat64frombits)
    * [func BenchmarkFloor(b *testing.B)](#BenchmarkFloor)
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
    * [func BenchmarkLog10(b *testing.B)](#BenchmarkLog10)
    * [func BenchmarkLog1p(b *testing.B)](#BenchmarkLog1p)
    * [func BenchmarkLog2(b *testing.B)](#BenchmarkLog2)
    * [func BenchmarkLogb(b *testing.B)](#BenchmarkLogb)
    * [func BenchmarkMax(b *testing.B)](#BenchmarkMax)
    * [func BenchmarkMin(b *testing.B)](#BenchmarkMin)
    * [func BenchmarkMod(b *testing.B)](#BenchmarkMod)
    * [func BenchmarkModf(b *testing.B)](#BenchmarkModf)
    * [func BenchmarkNextafter32(b *testing.B)](#BenchmarkNextafter32)
    * [func BenchmarkNextafter64(b *testing.B)](#BenchmarkNextafter64)
    * [func BenchmarkPow10Neg(b *testing.B)](#BenchmarkPow10Neg)
    * [func BenchmarkPow10Pos(b *testing.B)](#BenchmarkPow10Pos)
    * [func BenchmarkPowFrac(b *testing.B)](#BenchmarkPowFrac)
    * [func BenchmarkPowInt(b *testing.B)](#BenchmarkPowInt)
    * [func BenchmarkRemainder(b *testing.B)](#BenchmarkRemainder)
    * [func BenchmarkRound(b *testing.B)](#BenchmarkRound)
    * [func BenchmarkRoundToEven(b *testing.B)](#BenchmarkRoundToEven)
    * [func BenchmarkSignbit(b *testing.B)](#BenchmarkSignbit)
    * [func BenchmarkSin(b *testing.B)](#BenchmarkSin)
    * [func BenchmarkSincos(b *testing.B)](#BenchmarkSincos)
    * [func BenchmarkSinh(b *testing.B)](#BenchmarkSinh)
    * [func BenchmarkSqrtGoLatency(b *testing.B)](#BenchmarkSqrtGoLatency)
    * [func BenchmarkSqrtIndirect(b *testing.B)](#BenchmarkSqrtIndirect)
    * [func BenchmarkSqrtIndirectLatency(b *testing.B)](#BenchmarkSqrtIndirectLatency)
    * [func BenchmarkSqrtLatency(b *testing.B)](#BenchmarkSqrtLatency)
    * [func BenchmarkSqrtPrime(b *testing.B)](#BenchmarkSqrtPrime)
    * [func BenchmarkTan(b *testing.B)](#BenchmarkTan)
    * [func BenchmarkTanh(b *testing.B)](#BenchmarkTanh)
    * [func BenchmarkTrunc(b *testing.B)](#BenchmarkTrunc)
    * [func BenchmarkY0(b *testing.B)](#BenchmarkY0)
    * [func BenchmarkY1(b *testing.B)](#BenchmarkY1)
    * [func BenchmarkYn(b *testing.B)](#BenchmarkYn)
    * [func ExampleAbs()](#ExampleAbs)
    * [func ExampleAcos()](#ExampleAcos)
    * [func ExampleAcosh()](#ExampleAcosh)
    * [func ExampleAsin()](#ExampleAsin)
    * [func ExampleAsinh()](#ExampleAsinh)
    * [func ExampleAtan()](#ExampleAtan)
    * [func ExampleAtan2()](#ExampleAtan2)
    * [func ExampleAtanh()](#ExampleAtanh)
    * [func ExampleCbrt()](#ExampleCbrt)
    * [func ExampleCeil()](#ExampleCeil)
    * [func ExampleCopysign()](#ExampleCopysign)
    * [func ExampleCos()](#ExampleCos)
    * [func ExampleCosh()](#ExampleCosh)
    * [func ExampleDim()](#ExampleDim)
    * [func ExampleExp()](#ExampleExp)
    * [func ExampleExp2()](#ExampleExp2)
    * [func ExampleExpm1()](#ExampleExpm1)
    * [func ExampleFloor()](#ExampleFloor)
    * [func ExampleLog()](#ExampleLog)
    * [func ExampleLog10()](#ExampleLog10)
    * [func ExampleLog2()](#ExampleLog2)
    * [func ExampleMod()](#ExampleMod)
    * [func ExampleModf()](#ExampleModf)
    * [func ExamplePow()](#ExamplePow)
    * [func ExamplePow10()](#ExamplePow10)
    * [func ExampleRound()](#ExampleRound)
    * [func ExampleRoundToEven()](#ExampleRoundToEven)
    * [func ExampleSin()](#ExampleSin)
    * [func ExampleSincos()](#ExampleSincos)
    * [func ExampleSinh()](#ExampleSinh)
    * [func ExampleSqrt()](#ExampleSqrt)
    * [func ExampleTan()](#ExampleTan)
    * [func ExampleTanh()](#ExampleTanh)
    * [func ExampleTrunc()](#ExampleTrunc)
    * [func TestAbs(t *testing.T)](#TestAbs)
    * [func TestAcos(t *testing.T)](#TestAcos)
    * [func TestAcosh(t *testing.T)](#TestAcosh)
    * [func TestAsin(t *testing.T)](#TestAsin)
    * [func TestAsinh(t *testing.T)](#TestAsinh)
    * [func TestAtan(t *testing.T)](#TestAtan)
    * [func TestAtan2(t *testing.T)](#TestAtan2)
    * [func TestAtanh(t *testing.T)](#TestAtanh)
    * [func TestCbrt(t *testing.T)](#TestCbrt)
    * [func TestCeil(t *testing.T)](#TestCeil)
    * [func TestCopysign(t *testing.T)](#TestCopysign)
    * [func TestCos(t *testing.T)](#TestCos)
    * [func TestCosh(t *testing.T)](#TestCosh)
    * [func TestDim(t *testing.T)](#TestDim)
    * [func TestErf(t *testing.T)](#TestErf)
    * [func TestErfc(t *testing.T)](#TestErfc)
    * [func TestErfcinv(t *testing.T)](#TestErfcinv)
    * [func TestErfinv(t *testing.T)](#TestErfinv)
    * [func TestExp(t *testing.T)](#TestExp)
    * [func TestExp2(t *testing.T)](#TestExp2)
    * [func TestExpm1(t *testing.T)](#TestExpm1)
    * [func TestFMA(t *testing.T)](#TestFMA)
    * [func TestFloat32Sqrt(t *testing.T)](#TestFloat32Sqrt)
    * [func TestFloatMinMax(t *testing.T)](#TestFloatMinMax)
    * [func TestFloatMinima(t *testing.T)](#TestFloatMinima)
    * [func TestFloor(t *testing.T)](#TestFloor)
    * [func TestFrexp(t *testing.T)](#TestFrexp)
    * [func TestGamma(t *testing.T)](#TestGamma)
    * [func TestHugeCos(t *testing.T)](#TestHugeCos)
    * [func TestHugeSin(t *testing.T)](#TestHugeSin)
    * [func TestHugeSinCos(t *testing.T)](#TestHugeSinCos)
    * [func TestHugeTan(t *testing.T)](#TestHugeTan)
    * [func TestHypot(t *testing.T)](#TestHypot)
    * [func TestHypotGo(t *testing.T)](#TestHypotGo)
    * [func TestIlogb(t *testing.T)](#TestIlogb)
    * [func TestJ0(t *testing.T)](#TestJ0)
    * [func TestJ1(t *testing.T)](#TestJ1)
    * [func TestJn(t *testing.T)](#TestJn)
    * [func TestLargeCos(t *testing.T)](#TestLargeCos)
    * [func TestLargeSin(t *testing.T)](#TestLargeSin)
    * [func TestLargeSincos(t *testing.T)](#TestLargeSincos)
    * [func TestLargeTan(t *testing.T)](#TestLargeTan)
    * [func TestLdexp(t *testing.T)](#TestLdexp)
    * [func TestLgamma(t *testing.T)](#TestLgamma)
    * [func TestLog(t *testing.T)](#TestLog)
    * [func TestLog10(t *testing.T)](#TestLog10)
    * [func TestLog1p(t *testing.T)](#TestLog1p)
    * [func TestLog2(t *testing.T)](#TestLog2)
    * [func TestLogb(t *testing.T)](#TestLogb)
    * [func TestMax(t *testing.T)](#TestMax)
    * [func TestMaxInt(t *testing.T)](#TestMaxInt)
    * [func TestMaxUint(t *testing.T)](#TestMaxUint)
    * [func TestMin(t *testing.T)](#TestMin)
    * [func TestMod(t *testing.T)](#TestMod)
    * [func TestModf(t *testing.T)](#TestModf)
    * [func TestNaN(t *testing.T)](#TestNaN)
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
    * [func TestTrigReduce(t *testing.T)](#TestTrigReduce)
    * [func TestTrunc(t *testing.T)](#TestTrunc)
    * [func TestY0(t *testing.T)](#TestY0)
    * [func TestY1(t *testing.T)](#TestY1)
    * [func TestYn(t *testing.T)](#TestYn)
    * [func alike(a, b float64) bool](#alike)
    * [func close(a, b float64) bool](#close)
    * [func isPrime(i int) bool](#isPrime)
    * [func soclose(a, b, e float64) bool](#soclose)
    * [func testExp(t *testing.T, Exp func(float64) float64, name string)](#testExp)
    * [func testExp2(t *testing.T, Exp2 func(float64) float64, name string)](#testExp2)
    * [func tolerance(a, b, e float64) bool](#tolerance)
    * [func veryclose(a, b float64) bool](#veryclose)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="LargestSubnormalFloat64" href="#LargestSubnormalFloat64">const LargestSubnormalFloat64</a>

```
searchKey: math_test.LargestSubnormalFloat64
tags: [constant number private]
```

```Go
const LargestSubnormalFloat64 = SmallestNormalFloat64 - SmallestNonzeroFloat64
```

arguments and expected results for boundary cases 

### <a id="SmallestNormalFloat64" href="#SmallestNormalFloat64">const SmallestNormalFloat64</a>

```
searchKey: math_test.SmallestNormalFloat64
tags: [constant number private]
```

```Go
const SmallestNormalFloat64 = 2.2250738585072014e-308 // 2**-1022

```

arguments and expected results for boundary cases 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="GlobalB" href="#GlobalB">var GlobalB</a>

```
searchKey: math_test.GlobalB
tags: [variable boolean private]
```

```Go
var GlobalB bool
```

Global exported variables are used to store the return values of functions measured in the benchmarks. Storing the results in these variables prevents the compiler from completely optimizing the benchmarked functions away. 

### <a id="GlobalF" href="#GlobalF">var GlobalF</a>

```
searchKey: math_test.GlobalF
tags: [variable number private]
```

```Go
var GlobalF float64
```

Global exported variables are used to store the return values of functions measured in the benchmarks. Storing the results in these variables prevents the compiler from completely optimizing the benchmarked functions away. 

### <a id="GlobalI" href="#GlobalI">var GlobalI</a>

```
searchKey: math_test.GlobalI
tags: [variable number private]
```

```Go
var GlobalI int
```

Global exported variables are used to store the return values of functions measured in the benchmarks. Storing the results in these variables prevents the compiler from completely optimizing the benchmarked functions away. 

### <a id="PortableFMA" href="#PortableFMA">var PortableFMA</a>

```
searchKey: math_test.PortableFMA
tags: [variable function private]
```

```Go
var PortableFMA = FMA // hide call from compiler intrinsic; falls back to portable code

```

### <a id="absPos" href="#absPos">var absPos</a>

```
searchKey: math_test.absPos
tags: [variable number private]
```

```Go
var absPos = .5
```

### <a id="acos" href="#acos">var acos</a>

```
searchKey: math_test.acos
tags: [variable array number private]
```

```Go
var acos = ...
```

The expected results below were computed by the high precision calculators at [https://keisan.casio.com/](https://keisan.casio.com/).  More exact input values (array vf[], above) were obtained by printing them with "%.26f".  The answers were calculated to 26 digits (by using the "Digit number" drop-down control of each calculator). 

### <a id="acosSC" href="#acosSC">var acosSC</a>

```
searchKey: math_test.acosSC
tags: [variable array number private]
```

```Go
var acosSC = []float64{
	NaN(),
	0,
	NaN(),
	NaN(),
}
```

### <a id="acosh" href="#acosh">var acosh</a>

```
searchKey: math_test.acosh
tags: [variable array number private]
```

```Go
var acosh = ...
```

### <a id="acoshSC" href="#acoshSC">var acoshSC</a>

```
searchKey: math_test.acoshSC
tags: [variable array number private]
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

### <a id="asin" href="#asin">var asin</a>

```
searchKey: math_test.asin
tags: [variable array number private]
```

```Go
var asin = ...
```

### <a id="asinSC" href="#asinSC">var asinSC</a>

```
searchKey: math_test.asinSC
tags: [variable array number private]
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

### <a id="asinh" href="#asinh">var asinh</a>

```
searchKey: math_test.asinh
tags: [variable array number private]
```

```Go
var asinh = ...
```

### <a id="asinhSC" href="#asinhSC">var asinhSC</a>

```
searchKey: math_test.asinhSC
tags: [variable array number private]
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

### <a id="atan" href="#atan">var atan</a>

```
searchKey: math_test.atan
tags: [variable array number private]
```

```Go
var atan = ...
```

### <a id="atan2" href="#atan2">var atan2</a>

```
searchKey: math_test.atan2
tags: [variable array number private]
```

```Go
var atan2 = ...
```

### <a id="atan2SC" href="#atan2SC">var atan2SC</a>

```
searchKey: math_test.atan2SC
tags: [variable array number private]
```

```Go
var atan2SC = ...
```

### <a id="atanSC" href="#atanSC">var atanSC</a>

```
searchKey: math_test.atanSC
tags: [variable array number private]
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

### <a id="atanh" href="#atanh">var atanh</a>

```
searchKey: math_test.atanh
tags: [variable array number private]
```

```Go
var atanh = ...
```

### <a id="atanhSC" href="#atanhSC">var atanhSC</a>

```
searchKey: math_test.atanhSC
tags: [variable array number private]
```

```Go
var atanhSC = ...
```

### <a id="cbrt" href="#cbrt">var cbrt</a>

```
searchKey: math_test.cbrt
tags: [variable array number private]
```

```Go
var cbrt = ...
```

### <a id="cbrtSC" href="#cbrtSC">var cbrtSC</a>

```
searchKey: math_test.cbrtSC
tags: [variable array number private]
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

### <a id="ceil" href="#ceil">var ceil</a>

```
searchKey: math_test.ceil
tags: [variable array number private]
```

```Go
var ceil = ...
```

### <a id="ceilSC" href="#ceilSC">var ceilSC</a>

```
searchKey: math_test.ceilSC
tags: [variable array number private]
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

### <a id="copysign" href="#copysign">var copysign</a>

```
searchKey: math_test.copysign
tags: [variable array number private]
```

```Go
var copysign = ...
```

### <a id="copysignNeg" href="#copysignNeg">var copysignNeg</a>

```
searchKey: math_test.copysignNeg
tags: [variable number private]
```

```Go
var copysignNeg = -1.0
```

### <a id="copysignSC" href="#copysignSC">var copysignSC</a>

```
searchKey: math_test.copysignSC
tags: [variable array number private]
```

```Go
var copysignSC = []float64{
	Inf(-1),
	Inf(-1),
	NaN(),
}
```

### <a id="cos" href="#cos">var cos</a>

```
searchKey: math_test.cos
tags: [variable array number private]
```

```Go
var cos = ...
```

### <a id="cosHuge" href="#cosHuge">var cosHuge</a>

```
searchKey: math_test.cosHuge
tags: [variable array number private]
```

```Go
var cosHuge = ...
```

Results for trigHuge[i] calculated with [https://github.com/robpike/ivy](https://github.com/robpike/ivy) using 4096 bits of working precision.   Values requiring less than 102 decimal digits (1 << 120, 1 << 240, 1 << 480, 1234567891234567 << 180) were confirmed via [https://keisan.casio.com/](https://keisan.casio.com/) 

### <a id="cosLarge" href="#cosLarge">var cosLarge</a>

```
searchKey: math_test.cosLarge
tags: [variable array number private]
```

```Go
var cosLarge = ...
```

Results for 100000 * Pi + vf[i] 

### <a id="cosSC" href="#cosSC">var cosSC</a>

```
searchKey: math_test.cosSC
tags: [variable array number private]
```

```Go
var cosSC = []float64{
	NaN(),
	NaN(),
	NaN(),
}
```

### <a id="cosh" href="#cosh">var cosh</a>

```
searchKey: math_test.cosh
tags: [variable array number private]
```

```Go
var cosh = ...
```

### <a id="coshSC" href="#coshSC">var coshSC</a>

```
searchKey: math_test.coshSC
tags: [variable array number private]
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

### <a id="erf" href="#erf">var erf</a>

```
searchKey: math_test.erf
tags: [variable array number private]
```

```Go
var erf = ...
```

### <a id="erfSC" href="#erfSC">var erfSC</a>

```
searchKey: math_test.erfSC
tags: [variable array number private]
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

### <a id="erfc" href="#erfc">var erfc</a>

```
searchKey: math_test.erfc
tags: [variable array number private]
```

```Go
var erfc = ...
```

### <a id="erfcSC" href="#erfcSC">var erfcSC</a>

```
searchKey: math_test.erfcSC
tags: [variable array number private]
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

### <a id="erfcinvSC" href="#erfcinvSC">var erfcinvSC</a>

```
searchKey: math_test.erfcinvSC
tags: [variable array number private]
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

### <a id="erfinv" href="#erfinv">var erfinv</a>

```
searchKey: math_test.erfinv
tags: [variable array number private]
```

```Go
var erfinv = ...
```

### <a id="erfinvSC" href="#erfinvSC">var erfinvSC</a>

```
searchKey: math_test.erfinvSC
tags: [variable array number private]
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

### <a id="exp" href="#exp">var exp</a>

```
searchKey: math_test.exp
tags: [variable array number private]
```

```Go
var exp = ...
```

### <a id="exp2" href="#exp2">var exp2</a>

```
searchKey: math_test.exp2
tags: [variable array number private]
```

```Go
var exp2 = ...
```

### <a id="exp2SC" href="#exp2SC">var exp2SC</a>

```
searchKey: math_test.exp2SC
tags: [variable array number private]
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

### <a id="expSC" href="#expSC">var expSC</a>

```
searchKey: math_test.expSC
tags: [variable array number private]
```

```Go
var expSC = ...
```

### <a id="expm1" href="#expm1">var expm1</a>

```
searchKey: math_test.expm1
tags: [variable array number private]
```

```Go
var expm1 = ...
```

### <a id="expm1Large" href="#expm1Large">var expm1Large</a>

```
searchKey: math_test.expm1Large
tags: [variable array number private]
```

```Go
var expm1Large = ...
```

### <a id="expm1SC" href="#expm1SC">var expm1SC</a>

```
searchKey: math_test.expm1SC
tags: [variable array number private]
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

### <a id="fabs" href="#fabs">var fabs</a>

```
searchKey: math_test.fabs
tags: [variable array number private]
```

```Go
var fabs = ...
```

### <a id="fabsSC" href="#fabsSC">var fabsSC</a>

```
searchKey: math_test.fabsSC
tags: [variable array number private]
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

### <a id="fdim" href="#fdim">var fdim</a>

```
searchKey: math_test.fdim
tags: [variable array number private]
```

```Go
var fdim = ...
```

### <a id="fdimSC" href="#fdimSC">var fdimSC</a>

```
searchKey: math_test.fdimSC
tags: [variable array number private]
```

```Go
var fdimSC = ...
```

### <a id="floatTests" href="#floatTests">var floatTests</a>

```
searchKey: math_test.floatTests
tags: [variable array struct private]
```

```Go
var floatTests = ...
```

### <a id="floor" href="#floor">var floor</a>

```
searchKey: math_test.floor
tags: [variable array number private]
```

```Go
var floor = ...
```

### <a id="fmaC" href="#fmaC">var fmaC</a>

```
searchKey: math_test.fmaC
tags: [variable array struct private]
```

```Go
var fmaC = ...
```

Test cases were generated with Berkeley TestFloat-3e/testfloat_gen. [http://www.jhauser.us/arithmetic/TestFloat.html](http://www.jhauser.us/arithmetic/TestFloat.html). The default rounding mode is selected (nearest/even), and exception flags are ignored. 

### <a id="fmaxSC" href="#fmaxSC">var fmaxSC</a>

```
searchKey: math_test.fmaxSC
tags: [variable array number private]
```

```Go
var fmaxSC = ...
```

### <a id="fminSC" href="#fminSC">var fminSC</a>

```
searchKey: math_test.fminSC
tags: [variable array number private]
```

```Go
var fminSC = ...
```

### <a id="fmod" href="#fmod">var fmod</a>

```
searchKey: math_test.fmod
tags: [variable array number private]
```

```Go
var fmod = ...
```

### <a id="fmodSC" href="#fmodSC">var fmodSC</a>

```
searchKey: math_test.fmodSC
tags: [variable array number private]
```

```Go
var fmodSC = ...
```

### <a id="frexp" href="#frexp">var frexp</a>

```
searchKey: math_test.frexp
tags: [variable array struct private]
```

```Go
var frexp = ...
```

### <a id="frexpBC" href="#frexpBC">var frexpBC</a>

```
searchKey: math_test.frexpBC
tags: [variable array struct private]
```

```Go
var frexpBC = ...
```

### <a id="frexpSC" href="#frexpSC">var frexpSC</a>

```
searchKey: math_test.frexpSC
tags: [variable array struct private]
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

### <a id="gamma" href="#gamma">var gamma</a>

```
searchKey: math_test.gamma
tags: [variable array number private]
```

```Go
var gamma = ...
```

### <a id="hypotSC" href="#hypotSC">var hypotSC</a>

```
searchKey: math_test.hypotSC
tags: [variable array number private]
```

```Go
var hypotSC = ...
```

### <a id="ilogbSC" href="#ilogbSC">var ilogbSC</a>

```
searchKey: math_test.ilogbSC
tags: [variable array number private]
```

```Go
var ilogbSC = []int{
	MaxInt32,
	MinInt32,
	MaxInt32,
	MaxInt32,
}
```

### <a id="indirectSqrt" href="#indirectSqrt">var indirectSqrt</a>

```
searchKey: math_test.indirectSqrt
tags: [variable function private]
```

```Go
var indirectSqrt = Sqrt
```

### <a id="j0" href="#j0">var j0</a>

```
searchKey: math_test.j0
tags: [variable array number private]
```

```Go
var j0 = ...
```

### <a id="j0SC" href="#j0SC">var j0SC</a>

```
searchKey: math_test.j0SC
tags: [variable array number private]
```

```Go
var j0SC = []float64{
	0,
	1,
	0,
	NaN(),
}
```

### <a id="j1" href="#j1">var j1</a>

```
searchKey: math_test.j1
tags: [variable array number private]
```

```Go
var j1 = ...
```

### <a id="j1SC" href="#j1SC">var j1SC</a>

```
searchKey: math_test.j1SC
tags: [variable array number private]
```

```Go
var j1SC = []float64{
	0,
	0,
	0,
	NaN(),
}
```

### <a id="j2" href="#j2">var j2</a>

```
searchKey: math_test.j2
tags: [variable array number private]
```

```Go
var j2 = ...
```

### <a id="j2SC" href="#j2SC">var j2SC</a>

```
searchKey: math_test.j2SC
tags: [variable array number private]
```

```Go
var j2SC = []float64{
	0,
	0,
	0,
	NaN(),
}
```

### <a id="jM3" href="#jM3">var jM3</a>

```
searchKey: math_test.jM3
tags: [variable array number private]
```

```Go
var jM3 = ...
```

### <a id="jM3SC" href="#jM3SC">var jM3SC</a>

```
searchKey: math_test.jM3SC
tags: [variable array number private]
```

```Go
var jM3SC = []float64{
	0,
	0,
	0,
	NaN(),
}
```

### <a id="ldexpBC" href="#ldexpBC">var ldexpBC</a>

```
searchKey: math_test.ldexpBC
tags: [variable array number private]
```

```Go
var ldexpBC = ...
```

### <a id="ldexpSC" href="#ldexpSC">var ldexpSC</a>

```
searchKey: math_test.ldexpSC
tags: [variable array number private]
```

```Go
var ldexpSC = ...
```

### <a id="lgamma" href="#lgamma">var lgamma</a>

```
searchKey: math_test.lgamma
tags: [variable array struct private]
```

```Go
var lgamma = ...
```

### <a id="lgammaSC" href="#lgammaSC">var lgammaSC</a>

```
searchKey: math_test.lgammaSC
tags: [variable array struct private]
```

```Go
var lgammaSC = ...
```

### <a id="log" href="#log">var log</a>

```
searchKey: math_test.log
tags: [variable array number private]
```

```Go
var log = ...
```

### <a id="log10" href="#log10">var log10</a>

```
searchKey: math_test.log10
tags: [variable array number private]
```

```Go
var log10 = ...
```

### <a id="log1p" href="#log1p">var log1p</a>

```
searchKey: math_test.log1p
tags: [variable array number private]
```

```Go
var log1p = ...
```

### <a id="log1pSC" href="#log1pSC">var log1pSC</a>

```
searchKey: math_test.log1pSC
tags: [variable array number private]
```

```Go
var log1pSC = ...
```

### <a id="log2" href="#log2">var log2</a>

```
searchKey: math_test.log2
tags: [variable array number private]
```

```Go
var log2 = ...
```

### <a id="logSC" href="#logSC">var logSC</a>

```
searchKey: math_test.logSC
tags: [variable array number private]
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

### <a id="logb" href="#logb">var logb</a>

```
searchKey: math_test.logb
tags: [variable array number private]
```

```Go
var logb = ...
```

### <a id="logbBC" href="#logbBC">var logbBC</a>

```
searchKey: math_test.logbBC
tags: [variable array number private]
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

### <a id="logbSC" href="#logbSC">var logbSC</a>

```
searchKey: math_test.logbSC
tags: [variable array number private]
```

```Go
var logbSC = []float64{
	Inf(1),
	Inf(-1),
	Inf(1),
	NaN(),
}
```

### <a id="modf" href="#modf">var modf</a>

```
searchKey: math_test.modf
tags: [variable array array number private]
```

```Go
var modf = ...
```

### <a id="modfSC" href="#modfSC">var modfSC</a>

```
searchKey: math_test.modfSC
tags: [variable array array number private]
```

```Go
var modfSC = ...
```

### <a id="nan" href="#nan">var nan</a>

```
searchKey: math_test.nan
tags: [variable number private]
```

```Go
var nan = Float64frombits(0xFFF8000000000000) // SSE2 DIVSD 0/0

```

### <a id="nextafter32" href="#nextafter32">var nextafter32</a>

```
searchKey: math_test.nextafter32
tags: [variable array number private]
```

```Go
var nextafter32 = ...
```

### <a id="nextafter32SC" href="#nextafter32SC">var nextafter32SC</a>

```
searchKey: math_test.nextafter32SC
tags: [variable array number private]
```

```Go
var nextafter32SC = ...
```

### <a id="nextafter64" href="#nextafter64">var nextafter64</a>

```
searchKey: math_test.nextafter64
tags: [variable array number private]
```

```Go
var nextafter64 = ...
```

### <a id="nextafter64SC" href="#nextafter64SC">var nextafter64SC</a>

```
searchKey: math_test.nextafter64SC
tags: [variable array number private]
```

```Go
var nextafter64SC = ...
```

### <a id="pow" href="#pow">var pow</a>

```
searchKey: math_test.pow
tags: [variable array number private]
```

```Go
var pow = ...
```

### <a id="pow10SC" href="#pow10SC">var pow10SC</a>

```
searchKey: math_test.pow10SC
tags: [variable array number private]
```

```Go
var pow10SC = ...
```

### <a id="pow10neg" href="#pow10neg">var pow10neg</a>

```
searchKey: math_test.pow10neg
tags: [variable number private]
```

```Go
var pow10neg = int(-300)
```

### <a id="pow10pos" href="#pow10pos">var pow10pos</a>

```
searchKey: math_test.pow10pos
tags: [variable number private]
```

```Go
var pow10pos = int(300)
```

### <a id="powSC" href="#powSC">var powSC</a>

```
searchKey: math_test.powSC
tags: [variable array number private]
```

```Go
var powSC = ...
```

### <a id="remainder" href="#remainder">var remainder</a>

```
searchKey: math_test.remainder
tags: [variable array number private]
```

```Go
var remainder = ...
```

### <a id="round" href="#round">var round</a>

```
searchKey: math_test.round
tags: [variable array number private]
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

### <a id="roundFloat32" href="#roundFloat32">var roundFloat32</a>

```
searchKey: math_test.roundFloat32
tags: [variable number private]
```

```Go
var roundFloat32 = float32(-2.5)
```

### <a id="roundNeg" href="#roundNeg">var roundNeg</a>

```
searchKey: math_test.roundNeg
tags: [variable number private]
```

```Go
var roundNeg = float64(-2.5)
```

### <a id="roundUint32" href="#roundUint32">var roundUint32</a>

```
searchKey: math_test.roundUint32
tags: [variable number private]
```

```Go
var roundUint32 = uint32(5)
```

### <a id="roundUint64" href="#roundUint64">var roundUint64</a>

```
searchKey: math_test.roundUint64
tags: [variable number private]
```

```Go
var roundUint64 = uint64(5)
```

### <a id="signbit" href="#signbit">var signbit</a>

```
searchKey: math_test.signbit
tags: [variable array boolean private]
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

### <a id="signbitPos" href="#signbitPos">var signbitPos</a>

```
searchKey: math_test.signbitPos
tags: [variable number private]
```

```Go
var signbitPos = 2.5
```

### <a id="signbitSC" href="#signbitSC">var signbitSC</a>

```
searchKey: math_test.signbitSC
tags: [variable array boolean private]
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

### <a id="sin" href="#sin">var sin</a>

```
searchKey: math_test.sin
tags: [variable array number private]
```

```Go
var sin = ...
```

### <a id="sinHuge" href="#sinHuge">var sinHuge</a>

```
searchKey: math_test.sinHuge
tags: [variable array number private]
```

```Go
var sinHuge = ...
```

### <a id="sinLarge" href="#sinLarge">var sinLarge</a>

```
searchKey: math_test.sinLarge
tags: [variable array number private]
```

```Go
var sinLarge = ...
```

Results for 100000 * Pi + vf[i] 

### <a id="sinSC" href="#sinSC">var sinSC</a>

```
searchKey: math_test.sinSC
tags: [variable array number private]
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

### <a id="sinh" href="#sinh">var sinh</a>

```
searchKey: math_test.sinh
tags: [variable array number private]
```

```Go
var sinh = ...
```

### <a id="sinhSC" href="#sinhSC">var sinhSC</a>

```
searchKey: math_test.sinhSC
tags: [variable array number private]
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

### <a id="sqrt" href="#sqrt">var sqrt</a>

```
searchKey: math_test.sqrt
tags: [variable array number private]
```

```Go
var sqrt = ...
```

### <a id="sqrt32" href="#sqrt32">var sqrt32</a>

```
searchKey: math_test.sqrt32
tags: [variable array number private]
```

```Go
var sqrt32 = ...
```

### <a id="sqrtSC" href="#sqrtSC">var sqrtSC</a>

```
searchKey: math_test.sqrtSC
tags: [variable array number private]
```

```Go
var sqrtSC = ...
```

### <a id="tan" href="#tan">var tan</a>

```
searchKey: math_test.tan
tags: [variable array number private]
```

```Go
var tan = ...
```

### <a id="tanHuge" href="#tanHuge">var tanHuge</a>

```
searchKey: math_test.tanHuge
tags: [variable array number private]
```

```Go
var tanHuge = ...
```

### <a id="tanLarge" href="#tanLarge">var tanLarge</a>

```
searchKey: math_test.tanLarge
tags: [variable array number private]
```

```Go
var tanLarge = ...
```

Results for 100000 * Pi + vf[i] 

### <a id="tanh" href="#tanh">var tanh</a>

```
searchKey: math_test.tanh
tags: [variable array number private]
```

```Go
var tanh = ...
```

### <a id="tanhSC" href="#tanhSC">var tanhSC</a>

```
searchKey: math_test.tanhSC
tags: [variable array number private]
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

### <a id="trigHuge" href="#trigHuge">var trigHuge</a>

```
searchKey: math_test.trigHuge
tags: [variable array number private]
```

```Go
var trigHuge = ...
```

Inputs to test trig_reduce 

### <a id="trunc" href="#trunc">var trunc</a>

```
searchKey: math_test.trunc
tags: [variable array number private]
```

```Go
var trunc = ...
```

### <a id="vf" href="#vf">var vf</a>

```
searchKey: math_test.vf
tags: [variable array number private]
```

```Go
var vf = ...
```

### <a id="vfacosSC" href="#vfacosSC">var vfacosSC</a>

```
searchKey: math_test.vfacosSC
tags: [variable array number private]
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

### <a id="vfacoshSC" href="#vfacoshSC">var vfacoshSC</a>

```
searchKey: math_test.vfacoshSC
tags: [variable array number private]
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

### <a id="vfasinSC" href="#vfasinSC">var vfasinSC</a>

```
searchKey: math_test.vfasinSC
tags: [variable array number private]
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

### <a id="vfasinhSC" href="#vfasinhSC">var vfasinhSC</a>

```
searchKey: math_test.vfasinhSC
tags: [variable array number private]
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

### <a id="vfatan2SC" href="#vfatan2SC">var vfatan2SC</a>

```
searchKey: math_test.vfatan2SC
tags: [variable array array number private]
```

```Go
var vfatan2SC = ...
```

### <a id="vfatanSC" href="#vfatanSC">var vfatanSC</a>

```
searchKey: math_test.vfatanSC
tags: [variable array number private]
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

### <a id="vfatanhSC" href="#vfatanhSC">var vfatanhSC</a>

```
searchKey: math_test.vfatanhSC
tags: [variable array number private]
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

### <a id="vfcbrtSC" href="#vfcbrtSC">var vfcbrtSC</a>

```
searchKey: math_test.vfcbrtSC
tags: [variable array number private]
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

### <a id="vfceilSC" href="#vfceilSC">var vfceilSC</a>

```
searchKey: math_test.vfceilSC
tags: [variable array number private]
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

### <a id="vfcopysignSC" href="#vfcopysignSC">var vfcopysignSC</a>

```
searchKey: math_test.vfcopysignSC
tags: [variable array number private]
```

```Go
var vfcopysignSC = []float64{
	Inf(-1),
	Inf(1),
	NaN(),
}
```

### <a id="vfcosSC" href="#vfcosSC">var vfcosSC</a>

```
searchKey: math_test.vfcosSC
tags: [variable array number private]
```

```Go
var vfcosSC = []float64{
	Inf(-1),
	Inf(1),
	NaN(),
}
```

### <a id="vfcoshSC" href="#vfcoshSC">var vfcoshSC</a>

```
searchKey: math_test.vfcoshSC
tags: [variable array number private]
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

### <a id="vferfSC" href="#vferfSC">var vferfSC</a>

```
searchKey: math_test.vferfSC
tags: [variable array number private]
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

### <a id="vferfcSC" href="#vferfcSC">var vferfcSC</a>

```
searchKey: math_test.vferfcSC
tags: [variable array number private]
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

### <a id="vferfcinvSC" href="#vferfcinvSC">var vferfcinvSC</a>

```
searchKey: math_test.vferfcinvSC
tags: [variable array number private]
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

### <a id="vferfinvSC" href="#vferfinvSC">var vferfinvSC</a>

```
searchKey: math_test.vferfinvSC
tags: [variable array number private]
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

### <a id="vfexp2SC" href="#vfexp2SC">var vfexp2SC</a>

```
searchKey: math_test.vfexp2SC
tags: [variable array number private]
```

```Go
var vfexp2SC = ...
```

### <a id="vfexpSC" href="#vfexpSC">var vfexpSC</a>

```
searchKey: math_test.vfexpSC
tags: [variable array number private]
```

```Go
var vfexpSC = ...
```

### <a id="vfexpm1SC" href="#vfexpm1SC">var vfexpm1SC</a>

```
searchKey: math_test.vfexpm1SC
tags: [variable array number private]
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

### <a id="vffabsSC" href="#vffabsSC">var vffabsSC</a>

```
searchKey: math_test.vffabsSC
tags: [variable array number private]
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

### <a id="vffdim2SC" href="#vffdim2SC">var vffdim2SC</a>

```
searchKey: math_test.vffdim2SC
tags: [variable array array number private]
```

```Go
var vffdim2SC = ...
```

### <a id="vffdimSC" href="#vffdimSC">var vffdimSC</a>

```
searchKey: math_test.vffdimSC
tags: [variable array array number private]
```

```Go
var vffdimSC = ...
```

### <a id="vffmodSC" href="#vffmodSC">var vffmodSC</a>

```
searchKey: math_test.vffmodSC
tags: [variable array array number private]
```

```Go
var vffmodSC = ...
```

### <a id="vffrexpBC" href="#vffrexpBC">var vffrexpBC</a>

```
searchKey: math_test.vffrexpBC
tags: [variable array number private]
```

```Go
var vffrexpBC = ...
```

### <a id="vffrexpSC" href="#vffrexpSC">var vffrexpSC</a>

```
searchKey: math_test.vffrexpSC
tags: [variable array number private]
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

### <a id="vfgamma" href="#vfgamma">var vfgamma</a>

```
searchKey: math_test.vfgamma
tags: [variable array array number private]
```

```Go
var vfgamma = ...
```

### <a id="vfhypotSC" href="#vfhypotSC">var vfhypotSC</a>

```
searchKey: math_test.vfhypotSC
tags: [variable array array number private]
```

```Go
var vfhypotSC = ...
```

### <a id="vfj0SC" href="#vfj0SC">var vfj0SC</a>

```
searchKey: math_test.vfj0SC
tags: [variable array number private]
```

```Go
var vfj0SC = []float64{
	Inf(-1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="vfldexpBC" href="#vfldexpBC">var vfldexpBC</a>

```
searchKey: math_test.vfldexpBC
tags: [variable array struct private]
```

```Go
var vfldexpBC = ...
```

### <a id="vfldexpSC" href="#vfldexpSC">var vfldexpSC</a>

```
searchKey: math_test.vfldexpSC
tags: [variable array struct private]
```

```Go
var vfldexpSC = ...
```

### <a id="vflgammaSC" href="#vflgammaSC">var vflgammaSC</a>

```
searchKey: math_test.vflgammaSC
tags: [variable array number private]
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

### <a id="vflog1pSC" href="#vflog1pSC">var vflog1pSC</a>

```
searchKey: math_test.vflog1pSC
tags: [variable array number private]
```

```Go
var vflog1pSC = ...
```

### <a id="vflogSC" href="#vflogSC">var vflogSC</a>

```
searchKey: math_test.vflogSC
tags: [variable array number private]
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

### <a id="vflogbSC" href="#vflogbSC">var vflogbSC</a>

```
searchKey: math_test.vflogbSC
tags: [variable array number private]
```

```Go
var vflogbSC = []float64{
	Inf(-1),
	0,
	Inf(1),
	NaN(),
}
```

### <a id="vfmodfSC" href="#vfmodfSC">var vfmodfSC</a>

```
searchKey: math_test.vfmodfSC
tags: [variable array number private]
```

```Go
var vfmodfSC = []float64{
	Inf(-1),
	Copysign(0, -1),
	Inf(1),
	NaN(),
}
```

### <a id="vfnextafter32SC" href="#vfnextafter32SC">var vfnextafter32SC</a>

```
searchKey: math_test.vfnextafter32SC
tags: [variable array array number private]
```

```Go
var vfnextafter32SC = ...
```

### <a id="vfnextafter64SC" href="#vfnextafter64SC">var vfnextafter64SC</a>

```
searchKey: math_test.vfnextafter64SC
tags: [variable array array number private]
```

```Go
var vfnextafter64SC = ...
```

### <a id="vfpow10SC" href="#vfpow10SC">var vfpow10SC</a>

```
searchKey: math_test.vfpow10SC
tags: [variable array number private]
```

```Go
var vfpow10SC = ...
```

### <a id="vfpowSC" href="#vfpowSC">var vfpowSC</a>

```
searchKey: math_test.vfpowSC
tags: [variable array array number private]
```

```Go
var vfpowSC = ...
```

### <a id="vfroundEvenSC" href="#vfroundEvenSC">var vfroundEvenSC</a>

```
searchKey: math_test.vfroundEvenSC
tags: [variable array array number private]
```

```Go
var vfroundEvenSC = ...
```

### <a id="vfroundSC" href="#vfroundSC">var vfroundSC</a>

```
searchKey: math_test.vfroundSC
tags: [variable array array number private]
```

```Go
var vfroundSC = ...
```

### <a id="vfsignbitSC" href="#vfsignbitSC">var vfsignbitSC</a>

```
searchKey: math_test.vfsignbitSC
tags: [variable array number private]
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

### <a id="vfsinSC" href="#vfsinSC">var vfsinSC</a>

```
searchKey: math_test.vfsinSC
tags: [variable array number private]
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

### <a id="vfsinhSC" href="#vfsinhSC">var vfsinhSC</a>

```
searchKey: math_test.vfsinhSC
tags: [variable array number private]
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

### <a id="vfsqrtSC" href="#vfsqrtSC">var vfsqrtSC</a>

```
searchKey: math_test.vfsqrtSC
tags: [variable array number private]
```

```Go
var vfsqrtSC = ...
```

### <a id="vftanhSC" href="#vftanhSC">var vftanhSC</a>

```
searchKey: math_test.vftanhSC
tags: [variable array number private]
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

### <a id="vfy0SC" href="#vfy0SC">var vfy0SC</a>

```
searchKey: math_test.vfy0SC
tags: [variable array number private]
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

### <a id="y0" href="#y0">var y0</a>

```
searchKey: math_test.y0
tags: [variable array number private]
```

```Go
var y0 = ...
```

### <a id="y0SC" href="#y0SC">var y0SC</a>

```
searchKey: math_test.y0SC
tags: [variable array number private]
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

### <a id="y1" href="#y1">var y1</a>

```
searchKey: math_test.y1
tags: [variable array number private]
```

```Go
var y1 = ...
```

### <a id="y1SC" href="#y1SC">var y1SC</a>

```
searchKey: math_test.y1SC
tags: [variable array number private]
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

### <a id="y2" href="#y2">var y2</a>

```
searchKey: math_test.y2
tags: [variable array number private]
```

```Go
var y2 = ...
```

### <a id="y2SC" href="#y2SC">var y2SC</a>

```
searchKey: math_test.y2SC
tags: [variable array number private]
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

### <a id="yM3" href="#yM3">var yM3</a>

```
searchKey: math_test.yM3
tags: [variable array number private]
```

```Go
var yM3 = ...
```

### <a id="yM3SC" href="#yM3SC">var yM3SC</a>

```
searchKey: math_test.yM3SC
tags: [variable array number private]
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

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="fi" href="#fi">type fi struct</a>

```
searchKey: math_test.fi
tags: [struct private]
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
tags: [struct private]
```

```Go
type floatTest struct {
	val  interface{}
	name string
	str  string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="BenchmarkAbs" href="#BenchmarkAbs">func BenchmarkAbs(b *testing.B)</a>

```
searchKey: math_test.BenchmarkAbs
tags: [function private benchmark]
```

```Go
func BenchmarkAbs(b *testing.B)
```

### <a id="BenchmarkAcos" href="#BenchmarkAcos">func BenchmarkAcos(b *testing.B)</a>

```
searchKey: math_test.BenchmarkAcos
tags: [function private benchmark]
```

```Go
func BenchmarkAcos(b *testing.B)
```

### <a id="BenchmarkAcosh" href="#BenchmarkAcosh">func BenchmarkAcosh(b *testing.B)</a>

```
searchKey: math_test.BenchmarkAcosh
tags: [function private benchmark]
```

```Go
func BenchmarkAcosh(b *testing.B)
```

### <a id="BenchmarkAsin" href="#BenchmarkAsin">func BenchmarkAsin(b *testing.B)</a>

```
searchKey: math_test.BenchmarkAsin
tags: [function private benchmark]
```

```Go
func BenchmarkAsin(b *testing.B)
```

### <a id="BenchmarkAsinh" href="#BenchmarkAsinh">func BenchmarkAsinh(b *testing.B)</a>

```
searchKey: math_test.BenchmarkAsinh
tags: [function private benchmark]
```

```Go
func BenchmarkAsinh(b *testing.B)
```

### <a id="BenchmarkAtan" href="#BenchmarkAtan">func BenchmarkAtan(b *testing.B)</a>

```
searchKey: math_test.BenchmarkAtan
tags: [function private benchmark]
```

```Go
func BenchmarkAtan(b *testing.B)
```

### <a id="BenchmarkAtan2" href="#BenchmarkAtan2">func BenchmarkAtan2(b *testing.B)</a>

```
searchKey: math_test.BenchmarkAtan2
tags: [function private benchmark]
```

```Go
func BenchmarkAtan2(b *testing.B)
```

### <a id="BenchmarkAtanh" href="#BenchmarkAtanh">func BenchmarkAtanh(b *testing.B)</a>

```
searchKey: math_test.BenchmarkAtanh
tags: [function private benchmark]
```

```Go
func BenchmarkAtanh(b *testing.B)
```

### <a id="BenchmarkCbrt" href="#BenchmarkCbrt">func BenchmarkCbrt(b *testing.B)</a>

```
searchKey: math_test.BenchmarkCbrt
tags: [function private benchmark]
```

```Go
func BenchmarkCbrt(b *testing.B)
```

### <a id="BenchmarkCeil" href="#BenchmarkCeil">func BenchmarkCeil(b *testing.B)</a>

```
searchKey: math_test.BenchmarkCeil
tags: [function private benchmark]
```

```Go
func BenchmarkCeil(b *testing.B)
```

### <a id="BenchmarkCopysign" href="#BenchmarkCopysign">func BenchmarkCopysign(b *testing.B)</a>

```
searchKey: math_test.BenchmarkCopysign
tags: [function private benchmark]
```

```Go
func BenchmarkCopysign(b *testing.B)
```

### <a id="BenchmarkCos" href="#BenchmarkCos">func BenchmarkCos(b *testing.B)</a>

```
searchKey: math_test.BenchmarkCos
tags: [function private benchmark]
```

```Go
func BenchmarkCos(b *testing.B)
```

### <a id="BenchmarkCosh" href="#BenchmarkCosh">func BenchmarkCosh(b *testing.B)</a>

```
searchKey: math_test.BenchmarkCosh
tags: [function private benchmark]
```

```Go
func BenchmarkCosh(b *testing.B)
```

### <a id="BenchmarkDim" href="#BenchmarkDim">func BenchmarkDim(b *testing.B)</a>

```
searchKey: math_test.BenchmarkDim
tags: [function private benchmark]
```

```Go
func BenchmarkDim(b *testing.B)
```

### <a id="BenchmarkErf" href="#BenchmarkErf">func BenchmarkErf(b *testing.B)</a>

```
searchKey: math_test.BenchmarkErf
tags: [function private benchmark]
```

```Go
func BenchmarkErf(b *testing.B)
```

### <a id="BenchmarkErfc" href="#BenchmarkErfc">func BenchmarkErfc(b *testing.B)</a>

```
searchKey: math_test.BenchmarkErfc
tags: [function private benchmark]
```

```Go
func BenchmarkErfc(b *testing.B)
```

### <a id="BenchmarkErfcinv" href="#BenchmarkErfcinv">func BenchmarkErfcinv(b *testing.B)</a>

```
searchKey: math_test.BenchmarkErfcinv
tags: [function private benchmark]
```

```Go
func BenchmarkErfcinv(b *testing.B)
```

### <a id="BenchmarkErfinv" href="#BenchmarkErfinv">func BenchmarkErfinv(b *testing.B)</a>

```
searchKey: math_test.BenchmarkErfinv
tags: [function private benchmark]
```

```Go
func BenchmarkErfinv(b *testing.B)
```

### <a id="BenchmarkExp" href="#BenchmarkExp">func BenchmarkExp(b *testing.B)</a>

```
searchKey: math_test.BenchmarkExp
tags: [function private benchmark]
```

```Go
func BenchmarkExp(b *testing.B)
```

### <a id="BenchmarkExp2" href="#BenchmarkExp2">func BenchmarkExp2(b *testing.B)</a>

```
searchKey: math_test.BenchmarkExp2
tags: [function private benchmark]
```

```Go
func BenchmarkExp2(b *testing.B)
```

### <a id="BenchmarkExp2Go" href="#BenchmarkExp2Go">func BenchmarkExp2Go(b *testing.B)</a>

```
searchKey: math_test.BenchmarkExp2Go
tags: [function private benchmark]
```

```Go
func BenchmarkExp2Go(b *testing.B)
```

### <a id="BenchmarkExpGo" href="#BenchmarkExpGo">func BenchmarkExpGo(b *testing.B)</a>

```
searchKey: math_test.BenchmarkExpGo
tags: [function private benchmark]
```

```Go
func BenchmarkExpGo(b *testing.B)
```

### <a id="BenchmarkExpm1" href="#BenchmarkExpm1">func BenchmarkExpm1(b *testing.B)</a>

```
searchKey: math_test.BenchmarkExpm1
tags: [function private benchmark]
```

```Go
func BenchmarkExpm1(b *testing.B)
```

### <a id="BenchmarkFMA" href="#BenchmarkFMA">func BenchmarkFMA(b *testing.B)</a>

```
searchKey: math_test.BenchmarkFMA
tags: [function private benchmark]
```

```Go
func BenchmarkFMA(b *testing.B)
```

### <a id="BenchmarkFloat32bits" href="#BenchmarkFloat32bits">func BenchmarkFloat32bits(b *testing.B)</a>

```
searchKey: math_test.BenchmarkFloat32bits
tags: [function private benchmark]
```

```Go
func BenchmarkFloat32bits(b *testing.B)
```

### <a id="BenchmarkFloat32frombits" href="#BenchmarkFloat32frombits">func BenchmarkFloat32frombits(b *testing.B)</a>

```
searchKey: math_test.BenchmarkFloat32frombits
tags: [function private benchmark]
```

```Go
func BenchmarkFloat32frombits(b *testing.B)
```

### <a id="BenchmarkFloat64bits" href="#BenchmarkFloat64bits">func BenchmarkFloat64bits(b *testing.B)</a>

```
searchKey: math_test.BenchmarkFloat64bits
tags: [function private benchmark]
```

```Go
func BenchmarkFloat64bits(b *testing.B)
```

### <a id="BenchmarkFloat64frombits" href="#BenchmarkFloat64frombits">func BenchmarkFloat64frombits(b *testing.B)</a>

```
searchKey: math_test.BenchmarkFloat64frombits
tags: [function private benchmark]
```

```Go
func BenchmarkFloat64frombits(b *testing.B)
```

### <a id="BenchmarkFloor" href="#BenchmarkFloor">func BenchmarkFloor(b *testing.B)</a>

```
searchKey: math_test.BenchmarkFloor
tags: [function private benchmark]
```

```Go
func BenchmarkFloor(b *testing.B)
```

### <a id="BenchmarkFrexp" href="#BenchmarkFrexp">func BenchmarkFrexp(b *testing.B)</a>

```
searchKey: math_test.BenchmarkFrexp
tags: [function private benchmark]
```

```Go
func BenchmarkFrexp(b *testing.B)
```

### <a id="BenchmarkGamma" href="#BenchmarkGamma">func BenchmarkGamma(b *testing.B)</a>

```
searchKey: math_test.BenchmarkGamma
tags: [function private benchmark]
```

```Go
func BenchmarkGamma(b *testing.B)
```

### <a id="BenchmarkHypot" href="#BenchmarkHypot">func BenchmarkHypot(b *testing.B)</a>

```
searchKey: math_test.BenchmarkHypot
tags: [function private benchmark]
```

```Go
func BenchmarkHypot(b *testing.B)
```

### <a id="BenchmarkHypotGo" href="#BenchmarkHypotGo">func BenchmarkHypotGo(b *testing.B)</a>

```
searchKey: math_test.BenchmarkHypotGo
tags: [function private benchmark]
```

```Go
func BenchmarkHypotGo(b *testing.B)
```

### <a id="BenchmarkIlogb" href="#BenchmarkIlogb">func BenchmarkIlogb(b *testing.B)</a>

```
searchKey: math_test.BenchmarkIlogb
tags: [function private benchmark]
```

```Go
func BenchmarkIlogb(b *testing.B)
```

### <a id="BenchmarkJ0" href="#BenchmarkJ0">func BenchmarkJ0(b *testing.B)</a>

```
searchKey: math_test.BenchmarkJ0
tags: [function private benchmark]
```

```Go
func BenchmarkJ0(b *testing.B)
```

### <a id="BenchmarkJ1" href="#BenchmarkJ1">func BenchmarkJ1(b *testing.B)</a>

```
searchKey: math_test.BenchmarkJ1
tags: [function private benchmark]
```

```Go
func BenchmarkJ1(b *testing.B)
```

### <a id="BenchmarkJn" href="#BenchmarkJn">func BenchmarkJn(b *testing.B)</a>

```
searchKey: math_test.BenchmarkJn
tags: [function private benchmark]
```

```Go
func BenchmarkJn(b *testing.B)
```

### <a id="BenchmarkLdexp" href="#BenchmarkLdexp">func BenchmarkLdexp(b *testing.B)</a>

```
searchKey: math_test.BenchmarkLdexp
tags: [function private benchmark]
```

```Go
func BenchmarkLdexp(b *testing.B)
```

### <a id="BenchmarkLgamma" href="#BenchmarkLgamma">func BenchmarkLgamma(b *testing.B)</a>

```
searchKey: math_test.BenchmarkLgamma
tags: [function private benchmark]
```

```Go
func BenchmarkLgamma(b *testing.B)
```

### <a id="BenchmarkLog" href="#BenchmarkLog">func BenchmarkLog(b *testing.B)</a>

```
searchKey: math_test.BenchmarkLog
tags: [function private benchmark]
```

```Go
func BenchmarkLog(b *testing.B)
```

### <a id="BenchmarkLog10" href="#BenchmarkLog10">func BenchmarkLog10(b *testing.B)</a>

```
searchKey: math_test.BenchmarkLog10
tags: [function private benchmark]
```

```Go
func BenchmarkLog10(b *testing.B)
```

### <a id="BenchmarkLog1p" href="#BenchmarkLog1p">func BenchmarkLog1p(b *testing.B)</a>

```
searchKey: math_test.BenchmarkLog1p
tags: [function private benchmark]
```

```Go
func BenchmarkLog1p(b *testing.B)
```

### <a id="BenchmarkLog2" href="#BenchmarkLog2">func BenchmarkLog2(b *testing.B)</a>

```
searchKey: math_test.BenchmarkLog2
tags: [function private benchmark]
```

```Go
func BenchmarkLog2(b *testing.B)
```

### <a id="BenchmarkLogb" href="#BenchmarkLogb">func BenchmarkLogb(b *testing.B)</a>

```
searchKey: math_test.BenchmarkLogb
tags: [function private benchmark]
```

```Go
func BenchmarkLogb(b *testing.B)
```

### <a id="BenchmarkMax" href="#BenchmarkMax">func BenchmarkMax(b *testing.B)</a>

```
searchKey: math_test.BenchmarkMax
tags: [function private benchmark]
```

```Go
func BenchmarkMax(b *testing.B)
```

### <a id="BenchmarkMin" href="#BenchmarkMin">func BenchmarkMin(b *testing.B)</a>

```
searchKey: math_test.BenchmarkMin
tags: [function private benchmark]
```

```Go
func BenchmarkMin(b *testing.B)
```

### <a id="BenchmarkMod" href="#BenchmarkMod">func BenchmarkMod(b *testing.B)</a>

```
searchKey: math_test.BenchmarkMod
tags: [function private benchmark]
```

```Go
func BenchmarkMod(b *testing.B)
```

### <a id="BenchmarkModf" href="#BenchmarkModf">func BenchmarkModf(b *testing.B)</a>

```
searchKey: math_test.BenchmarkModf
tags: [function private benchmark]
```

```Go
func BenchmarkModf(b *testing.B)
```

### <a id="BenchmarkNextafter32" href="#BenchmarkNextafter32">func BenchmarkNextafter32(b *testing.B)</a>

```
searchKey: math_test.BenchmarkNextafter32
tags: [function private benchmark]
```

```Go
func BenchmarkNextafter32(b *testing.B)
```

### <a id="BenchmarkNextafter64" href="#BenchmarkNextafter64">func BenchmarkNextafter64(b *testing.B)</a>

```
searchKey: math_test.BenchmarkNextafter64
tags: [function private benchmark]
```

```Go
func BenchmarkNextafter64(b *testing.B)
```

### <a id="BenchmarkPow10Neg" href="#BenchmarkPow10Neg">func BenchmarkPow10Neg(b *testing.B)</a>

```
searchKey: math_test.BenchmarkPow10Neg
tags: [function private benchmark]
```

```Go
func BenchmarkPow10Neg(b *testing.B)
```

### <a id="BenchmarkPow10Pos" href="#BenchmarkPow10Pos">func BenchmarkPow10Pos(b *testing.B)</a>

```
searchKey: math_test.BenchmarkPow10Pos
tags: [function private benchmark]
```

```Go
func BenchmarkPow10Pos(b *testing.B)
```

### <a id="BenchmarkPowFrac" href="#BenchmarkPowFrac">func BenchmarkPowFrac(b *testing.B)</a>

```
searchKey: math_test.BenchmarkPowFrac
tags: [function private benchmark]
```

```Go
func BenchmarkPowFrac(b *testing.B)
```

### <a id="BenchmarkPowInt" href="#BenchmarkPowInt">func BenchmarkPowInt(b *testing.B)</a>

```
searchKey: math_test.BenchmarkPowInt
tags: [function private benchmark]
```

```Go
func BenchmarkPowInt(b *testing.B)
```

### <a id="BenchmarkRemainder" href="#BenchmarkRemainder">func BenchmarkRemainder(b *testing.B)</a>

```
searchKey: math_test.BenchmarkRemainder
tags: [function private benchmark]
```

```Go
func BenchmarkRemainder(b *testing.B)
```

### <a id="BenchmarkRound" href="#BenchmarkRound">func BenchmarkRound(b *testing.B)</a>

```
searchKey: math_test.BenchmarkRound
tags: [function private benchmark]
```

```Go
func BenchmarkRound(b *testing.B)
```

### <a id="BenchmarkRoundToEven" href="#BenchmarkRoundToEven">func BenchmarkRoundToEven(b *testing.B)</a>

```
searchKey: math_test.BenchmarkRoundToEven
tags: [function private benchmark]
```

```Go
func BenchmarkRoundToEven(b *testing.B)
```

### <a id="BenchmarkSignbit" href="#BenchmarkSignbit">func BenchmarkSignbit(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSignbit
tags: [function private benchmark]
```

```Go
func BenchmarkSignbit(b *testing.B)
```

### <a id="BenchmarkSin" href="#BenchmarkSin">func BenchmarkSin(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSin
tags: [function private benchmark]
```

```Go
func BenchmarkSin(b *testing.B)
```

### <a id="BenchmarkSincos" href="#BenchmarkSincos">func BenchmarkSincos(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSincos
tags: [function private benchmark]
```

```Go
func BenchmarkSincos(b *testing.B)
```

### <a id="BenchmarkSinh" href="#BenchmarkSinh">func BenchmarkSinh(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSinh
tags: [function private benchmark]
```

```Go
func BenchmarkSinh(b *testing.B)
```

### <a id="BenchmarkSqrtGoLatency" href="#BenchmarkSqrtGoLatency">func BenchmarkSqrtGoLatency(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSqrtGoLatency
tags: [function private benchmark]
```

```Go
func BenchmarkSqrtGoLatency(b *testing.B)
```

### <a id="BenchmarkSqrtIndirect" href="#BenchmarkSqrtIndirect">func BenchmarkSqrtIndirect(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSqrtIndirect
tags: [function private benchmark]
```

```Go
func BenchmarkSqrtIndirect(b *testing.B)
```

### <a id="BenchmarkSqrtIndirectLatency" href="#BenchmarkSqrtIndirectLatency">func BenchmarkSqrtIndirectLatency(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSqrtIndirectLatency
tags: [function private benchmark]
```

```Go
func BenchmarkSqrtIndirectLatency(b *testing.B)
```

### <a id="BenchmarkSqrtLatency" href="#BenchmarkSqrtLatency">func BenchmarkSqrtLatency(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSqrtLatency
tags: [function private benchmark]
```

```Go
func BenchmarkSqrtLatency(b *testing.B)
```

### <a id="BenchmarkSqrtPrime" href="#BenchmarkSqrtPrime">func BenchmarkSqrtPrime(b *testing.B)</a>

```
searchKey: math_test.BenchmarkSqrtPrime
tags: [function private benchmark]
```

```Go
func BenchmarkSqrtPrime(b *testing.B)
```

### <a id="BenchmarkTan" href="#BenchmarkTan">func BenchmarkTan(b *testing.B)</a>

```
searchKey: math_test.BenchmarkTan
tags: [function private benchmark]
```

```Go
func BenchmarkTan(b *testing.B)
```

### <a id="BenchmarkTanh" href="#BenchmarkTanh">func BenchmarkTanh(b *testing.B)</a>

```
searchKey: math_test.BenchmarkTanh
tags: [function private benchmark]
```

```Go
func BenchmarkTanh(b *testing.B)
```

### <a id="BenchmarkTrunc" href="#BenchmarkTrunc">func BenchmarkTrunc(b *testing.B)</a>

```
searchKey: math_test.BenchmarkTrunc
tags: [function private benchmark]
```

```Go
func BenchmarkTrunc(b *testing.B)
```

### <a id="BenchmarkY0" href="#BenchmarkY0">func BenchmarkY0(b *testing.B)</a>

```
searchKey: math_test.BenchmarkY0
tags: [function private benchmark]
```

```Go
func BenchmarkY0(b *testing.B)
```

### <a id="BenchmarkY1" href="#BenchmarkY1">func BenchmarkY1(b *testing.B)</a>

```
searchKey: math_test.BenchmarkY1
tags: [function private benchmark]
```

```Go
func BenchmarkY1(b *testing.B)
```

### <a id="BenchmarkYn" href="#BenchmarkYn">func BenchmarkYn(b *testing.B)</a>

```
searchKey: math_test.BenchmarkYn
tags: [function private benchmark]
```

```Go
func BenchmarkYn(b *testing.B)
```

### <a id="ExampleAbs" href="#ExampleAbs">func ExampleAbs()</a>

```
searchKey: math_test.ExampleAbs
tags: [function private]
```

```Go
func ExampleAbs()
```

### <a id="ExampleAcos" href="#ExampleAcos">func ExampleAcos()</a>

```
searchKey: math_test.ExampleAcos
tags: [function private]
```

```Go
func ExampleAcos()
```

### <a id="ExampleAcosh" href="#ExampleAcosh">func ExampleAcosh()</a>

```
searchKey: math_test.ExampleAcosh
tags: [function private]
```

```Go
func ExampleAcosh()
```

### <a id="ExampleAsin" href="#ExampleAsin">func ExampleAsin()</a>

```
searchKey: math_test.ExampleAsin
tags: [function private]
```

```Go
func ExampleAsin()
```

### <a id="ExampleAsinh" href="#ExampleAsinh">func ExampleAsinh()</a>

```
searchKey: math_test.ExampleAsinh
tags: [function private]
```

```Go
func ExampleAsinh()
```

### <a id="ExampleAtan" href="#ExampleAtan">func ExampleAtan()</a>

```
searchKey: math_test.ExampleAtan
tags: [function private]
```

```Go
func ExampleAtan()
```

### <a id="ExampleAtan2" href="#ExampleAtan2">func ExampleAtan2()</a>

```
searchKey: math_test.ExampleAtan2
tags: [function private]
```

```Go
func ExampleAtan2()
```

### <a id="ExampleAtanh" href="#ExampleAtanh">func ExampleAtanh()</a>

```
searchKey: math_test.ExampleAtanh
tags: [function private]
```

```Go
func ExampleAtanh()
```

### <a id="ExampleCbrt" href="#ExampleCbrt">func ExampleCbrt()</a>

```
searchKey: math_test.ExampleCbrt
tags: [function private]
```

```Go
func ExampleCbrt()
```

### <a id="ExampleCeil" href="#ExampleCeil">func ExampleCeil()</a>

```
searchKey: math_test.ExampleCeil
tags: [function private]
```

```Go
func ExampleCeil()
```

### <a id="ExampleCopysign" href="#ExampleCopysign">func ExampleCopysign()</a>

```
searchKey: math_test.ExampleCopysign
tags: [function private]
```

```Go
func ExampleCopysign()
```

### <a id="ExampleCos" href="#ExampleCos">func ExampleCos()</a>

```
searchKey: math_test.ExampleCos
tags: [function private]
```

```Go
func ExampleCos()
```

### <a id="ExampleCosh" href="#ExampleCosh">func ExampleCosh()</a>

```
searchKey: math_test.ExampleCosh
tags: [function private]
```

```Go
func ExampleCosh()
```

### <a id="ExampleDim" href="#ExampleDim">func ExampleDim()</a>

```
searchKey: math_test.ExampleDim
tags: [function private]
```

```Go
func ExampleDim()
```

### <a id="ExampleExp" href="#ExampleExp">func ExampleExp()</a>

```
searchKey: math_test.ExampleExp
tags: [function private]
```

```Go
func ExampleExp()
```

### <a id="ExampleExp2" href="#ExampleExp2">func ExampleExp2()</a>

```
searchKey: math_test.ExampleExp2
tags: [function private]
```

```Go
func ExampleExp2()
```

### <a id="ExampleExpm1" href="#ExampleExpm1">func ExampleExpm1()</a>

```
searchKey: math_test.ExampleExpm1
tags: [function private]
```

```Go
func ExampleExpm1()
```

### <a id="ExampleFloor" href="#ExampleFloor">func ExampleFloor()</a>

```
searchKey: math_test.ExampleFloor
tags: [function private]
```

```Go
func ExampleFloor()
```

### <a id="ExampleLog" href="#ExampleLog">func ExampleLog()</a>

```
searchKey: math_test.ExampleLog
tags: [function private]
```

```Go
func ExampleLog()
```

### <a id="ExampleLog10" href="#ExampleLog10">func ExampleLog10()</a>

```
searchKey: math_test.ExampleLog10
tags: [function private]
```

```Go
func ExampleLog10()
```

### <a id="ExampleLog2" href="#ExampleLog2">func ExampleLog2()</a>

```
searchKey: math_test.ExampleLog2
tags: [function private]
```

```Go
func ExampleLog2()
```

### <a id="ExampleMod" href="#ExampleMod">func ExampleMod()</a>

```
searchKey: math_test.ExampleMod
tags: [function private]
```

```Go
func ExampleMod()
```

### <a id="ExampleModf" href="#ExampleModf">func ExampleModf()</a>

```
searchKey: math_test.ExampleModf
tags: [function private]
```

```Go
func ExampleModf()
```

### <a id="ExamplePow" href="#ExamplePow">func ExamplePow()</a>

```
searchKey: math_test.ExamplePow
tags: [function private]
```

```Go
func ExamplePow()
```

### <a id="ExamplePow10" href="#ExamplePow10">func ExamplePow10()</a>

```
searchKey: math_test.ExamplePow10
tags: [function private]
```

```Go
func ExamplePow10()
```

### <a id="ExampleRound" href="#ExampleRound">func ExampleRound()</a>

```
searchKey: math_test.ExampleRound
tags: [function private]
```

```Go
func ExampleRound()
```

### <a id="ExampleRoundToEven" href="#ExampleRoundToEven">func ExampleRoundToEven()</a>

```
searchKey: math_test.ExampleRoundToEven
tags: [function private]
```

```Go
func ExampleRoundToEven()
```

### <a id="ExampleSin" href="#ExampleSin">func ExampleSin()</a>

```
searchKey: math_test.ExampleSin
tags: [function private]
```

```Go
func ExampleSin()
```

### <a id="ExampleSincos" href="#ExampleSincos">func ExampleSincos()</a>

```
searchKey: math_test.ExampleSincos
tags: [function private]
```

```Go
func ExampleSincos()
```

### <a id="ExampleSinh" href="#ExampleSinh">func ExampleSinh()</a>

```
searchKey: math_test.ExampleSinh
tags: [function private]
```

```Go
func ExampleSinh()
```

### <a id="ExampleSqrt" href="#ExampleSqrt">func ExampleSqrt()</a>

```
searchKey: math_test.ExampleSqrt
tags: [function private]
```

```Go
func ExampleSqrt()
```

### <a id="ExampleTan" href="#ExampleTan">func ExampleTan()</a>

```
searchKey: math_test.ExampleTan
tags: [function private]
```

```Go
func ExampleTan()
```

### <a id="ExampleTanh" href="#ExampleTanh">func ExampleTanh()</a>

```
searchKey: math_test.ExampleTanh
tags: [function private]
```

```Go
func ExampleTanh()
```

### <a id="ExampleTrunc" href="#ExampleTrunc">func ExampleTrunc()</a>

```
searchKey: math_test.ExampleTrunc
tags: [function private]
```

```Go
func ExampleTrunc()
```

### <a id="TestAbs" href="#TestAbs">func TestAbs(t *testing.T)</a>

```
searchKey: math_test.TestAbs
tags: [function private test]
```

```Go
func TestAbs(t *testing.T)
```

### <a id="TestAcos" href="#TestAcos">func TestAcos(t *testing.T)</a>

```
searchKey: math_test.TestAcos
tags: [function private test]
```

```Go
func TestAcos(t *testing.T)
```

### <a id="TestAcosh" href="#TestAcosh">func TestAcosh(t *testing.T)</a>

```
searchKey: math_test.TestAcosh
tags: [function private test]
```

```Go
func TestAcosh(t *testing.T)
```

### <a id="TestAsin" href="#TestAsin">func TestAsin(t *testing.T)</a>

```
searchKey: math_test.TestAsin
tags: [function private test]
```

```Go
func TestAsin(t *testing.T)
```

### <a id="TestAsinh" href="#TestAsinh">func TestAsinh(t *testing.T)</a>

```
searchKey: math_test.TestAsinh
tags: [function private test]
```

```Go
func TestAsinh(t *testing.T)
```

### <a id="TestAtan" href="#TestAtan">func TestAtan(t *testing.T)</a>

```
searchKey: math_test.TestAtan
tags: [function private test]
```

```Go
func TestAtan(t *testing.T)
```

### <a id="TestAtan2" href="#TestAtan2">func TestAtan2(t *testing.T)</a>

```
searchKey: math_test.TestAtan2
tags: [function private test]
```

```Go
func TestAtan2(t *testing.T)
```

### <a id="TestAtanh" href="#TestAtanh">func TestAtanh(t *testing.T)</a>

```
searchKey: math_test.TestAtanh
tags: [function private test]
```

```Go
func TestAtanh(t *testing.T)
```

### <a id="TestCbrt" href="#TestCbrt">func TestCbrt(t *testing.T)</a>

```
searchKey: math_test.TestCbrt
tags: [function private test]
```

```Go
func TestCbrt(t *testing.T)
```

### <a id="TestCeil" href="#TestCeil">func TestCeil(t *testing.T)</a>

```
searchKey: math_test.TestCeil
tags: [function private test]
```

```Go
func TestCeil(t *testing.T)
```

### <a id="TestCopysign" href="#TestCopysign">func TestCopysign(t *testing.T)</a>

```
searchKey: math_test.TestCopysign
tags: [function private test]
```

```Go
func TestCopysign(t *testing.T)
```

### <a id="TestCos" href="#TestCos">func TestCos(t *testing.T)</a>

```
searchKey: math_test.TestCos
tags: [function private test]
```

```Go
func TestCos(t *testing.T)
```

### <a id="TestCosh" href="#TestCosh">func TestCosh(t *testing.T)</a>

```
searchKey: math_test.TestCosh
tags: [function private test]
```

```Go
func TestCosh(t *testing.T)
```

### <a id="TestDim" href="#TestDim">func TestDim(t *testing.T)</a>

```
searchKey: math_test.TestDim
tags: [function private test]
```

```Go
func TestDim(t *testing.T)
```

### <a id="TestErf" href="#TestErf">func TestErf(t *testing.T)</a>

```
searchKey: math_test.TestErf
tags: [function private test]
```

```Go
func TestErf(t *testing.T)
```

### <a id="TestErfc" href="#TestErfc">func TestErfc(t *testing.T)</a>

```
searchKey: math_test.TestErfc
tags: [function private test]
```

```Go
func TestErfc(t *testing.T)
```

### <a id="TestErfcinv" href="#TestErfcinv">func TestErfcinv(t *testing.T)</a>

```
searchKey: math_test.TestErfcinv
tags: [function private test]
```

```Go
func TestErfcinv(t *testing.T)
```

### <a id="TestErfinv" href="#TestErfinv">func TestErfinv(t *testing.T)</a>

```
searchKey: math_test.TestErfinv
tags: [function private test]
```

```Go
func TestErfinv(t *testing.T)
```

### <a id="TestExp" href="#TestExp">func TestExp(t *testing.T)</a>

```
searchKey: math_test.TestExp
tags: [function private test]
```

```Go
func TestExp(t *testing.T)
```

### <a id="TestExp2" href="#TestExp2">func TestExp2(t *testing.T)</a>

```
searchKey: math_test.TestExp2
tags: [function private test]
```

```Go
func TestExp2(t *testing.T)
```

### <a id="TestExpm1" href="#TestExpm1">func TestExpm1(t *testing.T)</a>

```
searchKey: math_test.TestExpm1
tags: [function private test]
```

```Go
func TestExpm1(t *testing.T)
```

### <a id="TestFMA" href="#TestFMA">func TestFMA(t *testing.T)</a>

```
searchKey: math_test.TestFMA
tags: [function private test]
```

```Go
func TestFMA(t *testing.T)
```

### <a id="TestFloat32Sqrt" href="#TestFloat32Sqrt">func TestFloat32Sqrt(t *testing.T)</a>

```
searchKey: math_test.TestFloat32Sqrt
tags: [function private test]
```

```Go
func TestFloat32Sqrt(t *testing.T)
```

TestFloat32Sqrt checks the correctness of the float32 square root optimization result. 

### <a id="TestFloatMinMax" href="#TestFloatMinMax">func TestFloatMinMax(t *testing.T)</a>

```
searchKey: math_test.TestFloatMinMax
tags: [function private test]
```

```Go
func TestFloatMinMax(t *testing.T)
```

### <a id="TestFloatMinima" href="#TestFloatMinima">func TestFloatMinima(t *testing.T)</a>

```
searchKey: math_test.TestFloatMinima
tags: [function private test]
```

```Go
func TestFloatMinima(t *testing.T)
```

### <a id="TestFloor" href="#TestFloor">func TestFloor(t *testing.T)</a>

```
searchKey: math_test.TestFloor
tags: [function private test]
```

```Go
func TestFloor(t *testing.T)
```

### <a id="TestFrexp" href="#TestFrexp">func TestFrexp(t *testing.T)</a>

```
searchKey: math_test.TestFrexp
tags: [function private test]
```

```Go
func TestFrexp(t *testing.T)
```

### <a id="TestGamma" href="#TestGamma">func TestGamma(t *testing.T)</a>

```
searchKey: math_test.TestGamma
tags: [function private test]
```

```Go
func TestGamma(t *testing.T)
```

### <a id="TestHugeCos" href="#TestHugeCos">func TestHugeCos(t *testing.T)</a>

```
searchKey: math_test.TestHugeCos
tags: [function private test]
```

```Go
func TestHugeCos(t *testing.T)
```

Check that trig values of huge angles return accurate results. This confirms that argument reduction works for very large values up to MaxFloat64. 

### <a id="TestHugeSin" href="#TestHugeSin">func TestHugeSin(t *testing.T)</a>

```
searchKey: math_test.TestHugeSin
tags: [function private test]
```

```Go
func TestHugeSin(t *testing.T)
```

### <a id="TestHugeSinCos" href="#TestHugeSinCos">func TestHugeSinCos(t *testing.T)</a>

```
searchKey: math_test.TestHugeSinCos
tags: [function private test]
```

```Go
func TestHugeSinCos(t *testing.T)
```

### <a id="TestHugeTan" href="#TestHugeTan">func TestHugeTan(t *testing.T)</a>

```
searchKey: math_test.TestHugeTan
tags: [function private test]
```

```Go
func TestHugeTan(t *testing.T)
```

### <a id="TestHypot" href="#TestHypot">func TestHypot(t *testing.T)</a>

```
searchKey: math_test.TestHypot
tags: [function private test]
```

```Go
func TestHypot(t *testing.T)
```

### <a id="TestHypotGo" href="#TestHypotGo">func TestHypotGo(t *testing.T)</a>

```
searchKey: math_test.TestHypotGo
tags: [function private test]
```

```Go
func TestHypotGo(t *testing.T)
```

### <a id="TestIlogb" href="#TestIlogb">func TestIlogb(t *testing.T)</a>

```
searchKey: math_test.TestIlogb
tags: [function private test]
```

```Go
func TestIlogb(t *testing.T)
```

### <a id="TestJ0" href="#TestJ0">func TestJ0(t *testing.T)</a>

```
searchKey: math_test.TestJ0
tags: [function private test]
```

```Go
func TestJ0(t *testing.T)
```

### <a id="TestJ1" href="#TestJ1">func TestJ1(t *testing.T)</a>

```
searchKey: math_test.TestJ1
tags: [function private test]
```

```Go
func TestJ1(t *testing.T)
```

### <a id="TestJn" href="#TestJn">func TestJn(t *testing.T)</a>

```
searchKey: math_test.TestJn
tags: [function private test]
```

```Go
func TestJn(t *testing.T)
```

### <a id="TestLargeCos" href="#TestLargeCos">func TestLargeCos(t *testing.T)</a>

```
searchKey: math_test.TestLargeCos
tags: [function private test]
```

```Go
func TestLargeCos(t *testing.T)
```

Check that math functions of high angle values return accurate results. [Since (vf[i] + large) - large != vf[i], testing for Trig(vf[i] + large) == Trig(vf[i]), where large is a multiple of 2*Pi, is misleading.] 

### <a id="TestLargeSin" href="#TestLargeSin">func TestLargeSin(t *testing.T)</a>

```
searchKey: math_test.TestLargeSin
tags: [function private test]
```

```Go
func TestLargeSin(t *testing.T)
```

### <a id="TestLargeSincos" href="#TestLargeSincos">func TestLargeSincos(t *testing.T)</a>

```
searchKey: math_test.TestLargeSincos
tags: [function private test]
```

```Go
func TestLargeSincos(t *testing.T)
```

### <a id="TestLargeTan" href="#TestLargeTan">func TestLargeTan(t *testing.T)</a>

```
searchKey: math_test.TestLargeTan
tags: [function private test]
```

```Go
func TestLargeTan(t *testing.T)
```

### <a id="TestLdexp" href="#TestLdexp">func TestLdexp(t *testing.T)</a>

```
searchKey: math_test.TestLdexp
tags: [function private test]
```

```Go
func TestLdexp(t *testing.T)
```

### <a id="TestLgamma" href="#TestLgamma">func TestLgamma(t *testing.T)</a>

```
searchKey: math_test.TestLgamma
tags: [function private test]
```

```Go
func TestLgamma(t *testing.T)
```

### <a id="TestLog" href="#TestLog">func TestLog(t *testing.T)</a>

```
searchKey: math_test.TestLog
tags: [function private test]
```

```Go
func TestLog(t *testing.T)
```

### <a id="TestLog10" href="#TestLog10">func TestLog10(t *testing.T)</a>

```
searchKey: math_test.TestLog10
tags: [function private test]
```

```Go
func TestLog10(t *testing.T)
```

### <a id="TestLog1p" href="#TestLog1p">func TestLog1p(t *testing.T)</a>

```
searchKey: math_test.TestLog1p
tags: [function private test]
```

```Go
func TestLog1p(t *testing.T)
```

### <a id="TestLog2" href="#TestLog2">func TestLog2(t *testing.T)</a>

```
searchKey: math_test.TestLog2
tags: [function private test]
```

```Go
func TestLog2(t *testing.T)
```

### <a id="TestLogb" href="#TestLogb">func TestLogb(t *testing.T)</a>

```
searchKey: math_test.TestLogb
tags: [function private test]
```

```Go
func TestLogb(t *testing.T)
```

### <a id="TestMax" href="#TestMax">func TestMax(t *testing.T)</a>

```
searchKey: math_test.TestMax
tags: [function private test]
```

```Go
func TestMax(t *testing.T)
```

### <a id="TestMaxInt" href="#TestMaxInt">func TestMaxInt(t *testing.T)</a>

```
searchKey: math_test.TestMaxInt
tags: [function private test]
```

```Go
func TestMaxInt(t *testing.T)
```

### <a id="TestMaxUint" href="#TestMaxUint">func TestMaxUint(t *testing.T)</a>

```
searchKey: math_test.TestMaxUint
tags: [function private test]
```

```Go
func TestMaxUint(t *testing.T)
```

### <a id="TestMin" href="#TestMin">func TestMin(t *testing.T)</a>

```
searchKey: math_test.TestMin
tags: [function private test]
```

```Go
func TestMin(t *testing.T)
```

### <a id="TestMod" href="#TestMod">func TestMod(t *testing.T)</a>

```
searchKey: math_test.TestMod
tags: [function private test]
```

```Go
func TestMod(t *testing.T)
```

### <a id="TestModf" href="#TestModf">func TestModf(t *testing.T)</a>

```
searchKey: math_test.TestModf
tags: [function private test]
```

```Go
func TestModf(t *testing.T)
```

### <a id="TestNaN" href="#TestNaN">func TestNaN(t *testing.T)</a>

```
searchKey: math_test.TestNaN
tags: [function private test]
```

```Go
func TestNaN(t *testing.T)
```

### <a id="TestNextafter32" href="#TestNextafter32">func TestNextafter32(t *testing.T)</a>

```
searchKey: math_test.TestNextafter32
tags: [function private test]
```

```Go
func TestNextafter32(t *testing.T)
```

### <a id="TestNextafter64" href="#TestNextafter64">func TestNextafter64(t *testing.T)</a>

```
searchKey: math_test.TestNextafter64
tags: [function private test]
```

```Go
func TestNextafter64(t *testing.T)
```

### <a id="TestPow" href="#TestPow">func TestPow(t *testing.T)</a>

```
searchKey: math_test.TestPow
tags: [function private test]
```

```Go
func TestPow(t *testing.T)
```

### <a id="TestPow10" href="#TestPow10">func TestPow10(t *testing.T)</a>

```
searchKey: math_test.TestPow10
tags: [function private test]
```

```Go
func TestPow10(t *testing.T)
```

### <a id="TestRemainder" href="#TestRemainder">func TestRemainder(t *testing.T)</a>

```
searchKey: math_test.TestRemainder
tags: [function private test]
```

```Go
func TestRemainder(t *testing.T)
```

### <a id="TestRound" href="#TestRound">func TestRound(t *testing.T)</a>

```
searchKey: math_test.TestRound
tags: [function private test]
```

```Go
func TestRound(t *testing.T)
```

### <a id="TestRoundToEven" href="#TestRoundToEven">func TestRoundToEven(t *testing.T)</a>

```
searchKey: math_test.TestRoundToEven
tags: [function private test]
```

```Go
func TestRoundToEven(t *testing.T)
```

### <a id="TestSignbit" href="#TestSignbit">func TestSignbit(t *testing.T)</a>

```
searchKey: math_test.TestSignbit
tags: [function private test]
```

```Go
func TestSignbit(t *testing.T)
```

### <a id="TestSin" href="#TestSin">func TestSin(t *testing.T)</a>

```
searchKey: math_test.TestSin
tags: [function private test]
```

```Go
func TestSin(t *testing.T)
```

### <a id="TestSincos" href="#TestSincos">func TestSincos(t *testing.T)</a>

```
searchKey: math_test.TestSincos
tags: [function private test]
```

```Go
func TestSincos(t *testing.T)
```

### <a id="TestSinh" href="#TestSinh">func TestSinh(t *testing.T)</a>

```
searchKey: math_test.TestSinh
tags: [function private test]
```

```Go
func TestSinh(t *testing.T)
```

### <a id="TestSqrt" href="#TestSqrt">func TestSqrt(t *testing.T)</a>

```
searchKey: math_test.TestSqrt
tags: [function private test]
```

```Go
func TestSqrt(t *testing.T)
```

### <a id="TestTan" href="#TestTan">func TestTan(t *testing.T)</a>

```
searchKey: math_test.TestTan
tags: [function private test]
```

```Go
func TestTan(t *testing.T)
```

### <a id="TestTanh" href="#TestTanh">func TestTanh(t *testing.T)</a>

```
searchKey: math_test.TestTanh
tags: [function private test]
```

```Go
func TestTanh(t *testing.T)
```

### <a id="TestTrigReduce" href="#TestTrigReduce">func TestTrigReduce(t *testing.T)</a>

```
searchKey: math_test.TestTrigReduce
tags: [function private test]
```

```Go
func TestTrigReduce(t *testing.T)
```

Check that trigReduce matches the standard reduction results for input values below reduceThreshold. 

### <a id="TestTrunc" href="#TestTrunc">func TestTrunc(t *testing.T)</a>

```
searchKey: math_test.TestTrunc
tags: [function private test]
```

```Go
func TestTrunc(t *testing.T)
```

### <a id="TestY0" href="#TestY0">func TestY0(t *testing.T)</a>

```
searchKey: math_test.TestY0
tags: [function private test]
```

```Go
func TestY0(t *testing.T)
```

### <a id="TestY1" href="#TestY1">func TestY1(t *testing.T)</a>

```
searchKey: math_test.TestY1
tags: [function private test]
```

```Go
func TestY1(t *testing.T)
```

### <a id="TestYn" href="#TestYn">func TestYn(t *testing.T)</a>

```
searchKey: math_test.TestYn
tags: [function private test]
```

```Go
func TestYn(t *testing.T)
```

### <a id="alike" href="#alike">func alike(a, b float64) bool</a>

```
searchKey: math_test.alike
tags: [function private]
```

```Go
func alike(a, b float64) bool
```

### <a id="close" href="#close">func close(a, b float64) bool</a>

```
searchKey: math_test.close
tags: [function private]
```

```Go
func close(a, b float64) bool
```

### <a id="isPrime" href="#isPrime">func isPrime(i int) bool</a>

```
searchKey: math_test.isPrime
tags: [function private]
```

```Go
func isPrime(i int) bool
```

### <a id="soclose" href="#soclose">func soclose(a, b, e float64) bool</a>

```
searchKey: math_test.soclose
tags: [function private]
```

```Go
func soclose(a, b, e float64) bool
```

### <a id="testExp" href="#testExp">func testExp(t *testing.T, Exp func(float64) float64, name string)</a>

```
searchKey: math_test.testExp
tags: [function private]
```

```Go
func testExp(t *testing.T, Exp func(float64) float64, name string)
```

### <a id="testExp2" href="#testExp2">func testExp2(t *testing.T, Exp2 func(float64) float64, name string)</a>

```
searchKey: math_test.testExp2
tags: [function private]
```

```Go
func testExp2(t *testing.T, Exp2 func(float64) float64, name string)
```

### <a id="tolerance" href="#tolerance">func tolerance(a, b, e float64) bool</a>

```
searchKey: math_test.tolerance
tags: [function private]
```

```Go
func tolerance(a, b, e float64) bool
```

### <a id="veryclose" href="#veryclose">func veryclose(a, b float64) bool</a>

```
searchKey: math_test.veryclose
tags: [function private]
```

```Go
func veryclose(a, b float64) bool
```

