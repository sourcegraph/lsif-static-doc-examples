# Package cmplx

Package cmplx provides basic constants and mathematical functions for complex numbers. Special case handling conforms to the C99 standard Annex G IEC 60559-compatible complex arithmetic. 

## Index

* [Variables](#var)
    * [var vc26](#vc26)
    * [var vc](#vc)
    * [var abs](#abs)
    * [var acos](#acos)
    * [var acosh](#acosh)
    * [var asin](#asin)
    * [var asinh](#asinh)
    * [var atan](#atan)
    * [var atanh](#atanh)
    * [var conj](#conj)
    * [var cos](#cos)
    * [var cosh](#cosh)
    * [var exp](#exp)
    * [var log](#log)
    * [var log10](#log10)
    * [var polar](#polar)
    * [var pow](#pow)
    * [var sin](#sin)
    * [var sinh](#sinh)
    * [var sqrt](#sqrt)
    * [var tan](#tan)
    * [var tanh](#tanh)
    * [var hugeIn](#hugeIn)
    * [var tanHuge](#tanHuge)
    * [var inf](#inf)
    * [var nan](#nan)
    * [var vcAbsSC](#vcAbsSC)
    * [var absSC](#absSC)
    * [var acosSC](#acosSC)
    * [var acoshSC](#acoshSC)
    * [var asinSC](#asinSC)
    * [var asinhSC](#asinhSC)
    * [var atanSC](#atanSC)
    * [var atanhSC](#atanhSC)
    * [var vcConjSC](#vcConjSC)
    * [var conjSC](#conjSC)
    * [var cosSC](#cosSC)
    * [var coshSC](#coshSC)
    * [var expSC](#expSC)
    * [var vcIsNaNSC](#vcIsNaNSC)
    * [var isNaNSC](#isNaNSC)
    * [var logSC](#logSC)
    * [var log10SC](#log10SC)
    * [var vcPolarSC](#vcPolarSC)
    * [var polarSC](#polarSC)
    * [var vcPowSC](#vcPowSC)
    * [var powSC](#powSC)
    * [var sinSC](#sinSC)
    * [var sinhSC](#sinhSC)
    * [var sqrtSC](#sqrtSC)
    * [var tanSC](#tanSC)
    * [var tanhSC](#tanhSC)
    * [var zero](#zero)
    * [var eps](#eps)
    * [var branchPoints](#branchPoints)
* [Types](#type)
    * [type ff struct](#ff)
* [Functions](#func)
    * [func Abs(x complex128) float64](#Abs)
    * [func Asin(x complex128) complex128](#Asin)
    * [func Asinh(x complex128) complex128](#Asinh)
    * [func Acos(x complex128) complex128](#Acos)
    * [func Acosh(x complex128) complex128](#Acosh)
    * [func Atan(x complex128) complex128](#Atan)
    * [func Atanh(x complex128) complex128](#Atanh)
    * [func Conj(x complex128) complex128](#Conj)
    * [func Exp(x complex128) complex128](#Exp)
    * [func IsInf(x complex128) bool](#IsInf)
    * [func Inf() complex128](#Inf)
    * [func IsNaN(x complex128) bool](#IsNaN)
    * [func NaN() complex128](#NaN)
    * [func Log(x complex128) complex128](#Log)
    * [func Log10(x complex128) complex128](#Log10)
    * [func Phase(x complex128) float64](#Phase)
    * [func Polar(x complex128) (r, θ float64)](#Polar)
    * [func Pow(x, y complex128) complex128](#Pow)
    * [func Rect(r, θ float64) complex128](#Rect)
    * [func Sin(x complex128) complex128](#Sin)
    * [func Sinh(x complex128) complex128](#Sinh)
    * [func Cos(x complex128) complex128](#Cos)
    * [func Cosh(x complex128) complex128](#Cosh)
    * [func sinhcosh(x float64) (sh, ch float64)](#sinhcosh)
    * [func Sqrt(x complex128) complex128](#Sqrt)
    * [func Tan(x complex128) complex128](#Tan)
    * [func Tanh(x complex128) complex128](#Tanh)
    * [func reducePi(x float64) float64](#reducePi)
    * [func tanSeries(z complex128) float64](#tanSeries)
    * [func Cot(x complex128) complex128](#Cot)
    * [func tolerance(a, b, e float64) bool](#tolerance)
    * [func veryclose(a, b float64) bool](#veryclose)
    * [func alike(a, b float64) bool](#alike)
    * [func cTolerance(a, b complex128, e float64) bool](#cTolerance)
    * [func cSoclose(a, b complex128, e float64) bool](#cSoclose)
    * [func cVeryclose(a, b complex128) bool](#cVeryclose)
    * [func cAlike(a, b complex128) bool](#cAlike)
    * [func isExact(x float64) bool](#isExact)
    * [func TestAbs(t *testing.T)](#TestAbs)
    * [func TestAcos(t *testing.T)](#TestAcos)
    * [func TestAcosh(t *testing.T)](#TestAcosh)
    * [func TestAsin(t *testing.T)](#TestAsin)
    * [func TestAsinh(t *testing.T)](#TestAsinh)
    * [func TestAtan(t *testing.T)](#TestAtan)
    * [func TestAtanh(t *testing.T)](#TestAtanh)
    * [func TestConj(t *testing.T)](#TestConj)
    * [func TestCos(t *testing.T)](#TestCos)
    * [func TestCosh(t *testing.T)](#TestCosh)
    * [func TestExp(t *testing.T)](#TestExp)
    * [func TestIsNaN(t *testing.T)](#TestIsNaN)
    * [func TestLog(t *testing.T)](#TestLog)
    * [func TestLog10(t *testing.T)](#TestLog10)
    * [func TestPolar(t *testing.T)](#TestPolar)
    * [func TestPow(t *testing.T)](#TestPow)
    * [func TestRect(t *testing.T)](#TestRect)
    * [func TestSin(t *testing.T)](#TestSin)
    * [func TestSinh(t *testing.T)](#TestSinh)
    * [func TestSqrt(t *testing.T)](#TestSqrt)
    * [func TestTan(t *testing.T)](#TestTan)
    * [func TestTanh(t *testing.T)](#TestTanh)
    * [func TestInfiniteLoopIntanSeries(t *testing.T)](#TestInfiniteLoopIntanSeries)
    * [func BenchmarkAbs(b *testing.B)](#BenchmarkAbs)
    * [func BenchmarkAcos(b *testing.B)](#BenchmarkAcos)
    * [func BenchmarkAcosh(b *testing.B)](#BenchmarkAcosh)
    * [func BenchmarkAsin(b *testing.B)](#BenchmarkAsin)
    * [func BenchmarkAsinh(b *testing.B)](#BenchmarkAsinh)
    * [func BenchmarkAtan(b *testing.B)](#BenchmarkAtan)
    * [func BenchmarkAtanh(b *testing.B)](#BenchmarkAtanh)
    * [func BenchmarkConj(b *testing.B)](#BenchmarkConj)
    * [func BenchmarkCos(b *testing.B)](#BenchmarkCos)
    * [func BenchmarkCosh(b *testing.B)](#BenchmarkCosh)
    * [func BenchmarkExp(b *testing.B)](#BenchmarkExp)
    * [func BenchmarkLog(b *testing.B)](#BenchmarkLog)
    * [func BenchmarkLog10(b *testing.B)](#BenchmarkLog10)
    * [func BenchmarkPhase(b *testing.B)](#BenchmarkPhase)
    * [func BenchmarkPolar(b *testing.B)](#BenchmarkPolar)
    * [func BenchmarkPow(b *testing.B)](#BenchmarkPow)
    * [func BenchmarkRect(b *testing.B)](#BenchmarkRect)
    * [func BenchmarkSin(b *testing.B)](#BenchmarkSin)
    * [func BenchmarkSinh(b *testing.B)](#BenchmarkSinh)
    * [func BenchmarkSqrt(b *testing.B)](#BenchmarkSqrt)
    * [func BenchmarkTan(b *testing.B)](#BenchmarkTan)
    * [func BenchmarkTanh(b *testing.B)](#BenchmarkTanh)
    * [func TestTanHuge(t *testing.T)](#TestTanHuge)


## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="vc26" href="#vc26">var vc26</a>

```
searchKey: cmplx.vc26
```

```Go
var vc26 = ...
```

The higher-precision values in vc26 were used to derive the input arguments vc (see also comment below). For reference only (do not delete). 

### <a id="vc" href="#vc">var vc</a>

```
searchKey: cmplx.vc
```

```Go
var vc = ...
```

### <a id="abs" href="#abs">var abs</a>

```
searchKey: cmplx.abs
```

```Go
var abs = ...
```

### <a id="acos" href="#acos">var acos</a>

```
searchKey: cmplx.acos
```

```Go
var acos = ...
```

### <a id="acosh" href="#acosh">var acosh</a>

```
searchKey: cmplx.acosh
```

```Go
var acosh = ...
```

### <a id="asin" href="#asin">var asin</a>

```
searchKey: cmplx.asin
```

```Go
var asin = ...
```

### <a id="asinh" href="#asinh">var asinh</a>

```
searchKey: cmplx.asinh
```

```Go
var asinh = ...
```

### <a id="atan" href="#atan">var atan</a>

```
searchKey: cmplx.atan
```

```Go
var atan = ...
```

### <a id="atanh" href="#atanh">var atanh</a>

```
searchKey: cmplx.atanh
```

```Go
var atanh = ...
```

### <a id="conj" href="#conj">var conj</a>

```
searchKey: cmplx.conj
```

```Go
var conj = ...
```

### <a id="cos" href="#cos">var cos</a>

```
searchKey: cmplx.cos
```

```Go
var cos = ...
```

### <a id="cosh" href="#cosh">var cosh</a>

```
searchKey: cmplx.cosh
```

```Go
var cosh = ...
```

### <a id="exp" href="#exp">var exp</a>

```
searchKey: cmplx.exp
```

```Go
var exp = ...
```

### <a id="log" href="#log">var log</a>

```
searchKey: cmplx.log
```

```Go
var log = ...
```

### <a id="log10" href="#log10">var log10</a>

```
searchKey: cmplx.log10
```

```Go
var log10 = ...
```

### <a id="polar" href="#polar">var polar</a>

```
searchKey: cmplx.polar
```

```Go
var polar = ...
```

### <a id="pow" href="#pow">var pow</a>

```
searchKey: cmplx.pow
```

```Go
var pow = ...
```

### <a id="sin" href="#sin">var sin</a>

```
searchKey: cmplx.sin
```

```Go
var sin = ...
```

### <a id="sinh" href="#sinh">var sinh</a>

```
searchKey: cmplx.sinh
```

```Go
var sinh = ...
```

### <a id="sqrt" href="#sqrt">var sqrt</a>

```
searchKey: cmplx.sqrt
```

```Go
var sqrt = ...
```

### <a id="tan" href="#tan">var tan</a>

```
searchKey: cmplx.tan
```

```Go
var tan = ...
```

### <a id="tanh" href="#tanh">var tanh</a>

```
searchKey: cmplx.tanh
```

```Go
var tanh = ...
```

### <a id="hugeIn" href="#hugeIn">var hugeIn</a>

```
searchKey: cmplx.hugeIn
```

```Go
var hugeIn = ...
```

huge values along the real axis for testing reducePi in Tan 

### <a id="tanHuge" href="#tanHuge">var tanHuge</a>

```
searchKey: cmplx.tanHuge
```

```Go
var tanHuge = ...
```

Results for tanHuge[i] calculated with [https://github.com/robpike/ivy](https://github.com/robpike/ivy) using 4096 bits of working precision. 

### <a id="inf" href="#inf">var inf</a>

```
searchKey: cmplx.inf
```

```Go
var inf, nan = math.Inf(1), math.NaN()
```

special cases conform to C99 standard appendix G.6 Complex arithmetic 

### <a id="nan" href="#nan">var nan</a>

```
searchKey: cmplx.nan
```

```Go
var inf, nan = math.Inf(1), math.NaN()
```

special cases conform to C99 standard appendix G.6 Complex arithmetic 

### <a id="vcAbsSC" href="#vcAbsSC">var vcAbsSC</a>

```
searchKey: cmplx.vcAbsSC
```

```Go
var vcAbsSC = []complex128{
	NaN(),
}
```

### <a id="absSC" href="#absSC">var absSC</a>

```
searchKey: cmplx.absSC
```

```Go
var absSC = []float64{
	math.NaN(),
}
```

### <a id="acosSC" href="#acosSC">var acosSC</a>

```
searchKey: cmplx.acosSC
```

```Go
var acosSC = ...
```

### <a id="acoshSC" href="#acoshSC">var acoshSC</a>

```
searchKey: cmplx.acoshSC
```

```Go
var acoshSC = ...
```

### <a id="asinSC" href="#asinSC">var asinSC</a>

```
searchKey: cmplx.asinSC
```

```Go
var asinSC = ...
```

### <a id="asinhSC" href="#asinhSC">var asinhSC</a>

```
searchKey: cmplx.asinhSC
```

```Go
var asinhSC = ...
```

### <a id="atanSC" href="#atanSC">var atanSC</a>

```
searchKey: cmplx.atanSC
```

```Go
var atanSC = ...
```

### <a id="atanhSC" href="#atanhSC">var atanhSC</a>

```
searchKey: cmplx.atanhSC
```

```Go
var atanhSC = ...
```

### <a id="vcConjSC" href="#vcConjSC">var vcConjSC</a>

```
searchKey: cmplx.vcConjSC
```

```Go
var vcConjSC = []complex128{
	NaN(),
}
```

### <a id="conjSC" href="#conjSC">var conjSC</a>

```
searchKey: cmplx.conjSC
```

```Go
var conjSC = []complex128{
	NaN(),
}
```

### <a id="cosSC" href="#cosSC">var cosSC</a>

```
searchKey: cmplx.cosSC
```

```Go
var cosSC = ...
```

### <a id="coshSC" href="#coshSC">var coshSC</a>

```
searchKey: cmplx.coshSC
```

```Go
var coshSC = ...
```

### <a id="expSC" href="#expSC">var expSC</a>

```
searchKey: cmplx.expSC
```

```Go
var expSC = ...
```

### <a id="vcIsNaNSC" href="#vcIsNaNSC">var vcIsNaNSC</a>

```
searchKey: cmplx.vcIsNaNSC
```

```Go
var vcIsNaNSC = ...
```

### <a id="isNaNSC" href="#isNaNSC">var isNaNSC</a>

```
searchKey: cmplx.isNaNSC
```

```Go
var isNaNSC = []bool{
	false,
	false,
	false,
	true,
	true,
	false,
	false,
	false,
	true,
}
```

### <a id="logSC" href="#logSC">var logSC</a>

```
searchKey: cmplx.logSC
```

```Go
var logSC = ...
```

### <a id="log10SC" href="#log10SC">var log10SC</a>

```
searchKey: cmplx.log10SC
```

```Go
var log10SC = ...
```

### <a id="vcPolarSC" href="#vcPolarSC">var vcPolarSC</a>

```
searchKey: cmplx.vcPolarSC
```

```Go
var vcPolarSC = []complex128{
	NaN(),
}
```

### <a id="polarSC" href="#polarSC">var polarSC</a>

```
searchKey: cmplx.polarSC
```

```Go
var polarSC = []ff{
	{math.NaN(), math.NaN()},
}
```

### <a id="vcPowSC" href="#vcPowSC">var vcPowSC</a>

```
searchKey: cmplx.vcPowSC
```

```Go
var vcPowSC = [][2]complex128{
	{NaN(), NaN()},
	{0, NaN()},
}
```

### <a id="powSC" href="#powSC">var powSC</a>

```
searchKey: cmplx.powSC
```

```Go
var powSC = []complex128{
	NaN(),
	NaN(),
}
```

### <a id="sinSC" href="#sinSC">var sinSC</a>

```
searchKey: cmplx.sinSC
```

```Go
var sinSC = ...
```

### <a id="sinhSC" href="#sinhSC">var sinhSC</a>

```
searchKey: cmplx.sinhSC
```

```Go
var sinhSC = ...
```

### <a id="sqrtSC" href="#sqrtSC">var sqrtSC</a>

```
searchKey: cmplx.sqrtSC
```

```Go
var sqrtSC = ...
```

### <a id="tanSC" href="#tanSC">var tanSC</a>

```
searchKey: cmplx.tanSC
```

```Go
var tanSC = ...
```

### <a id="tanhSC" href="#tanhSC">var tanhSC</a>

```
searchKey: cmplx.tanhSC
```

```Go
var tanhSC = ...
```

### <a id="zero" href="#zero">var zero</a>

```
searchKey: cmplx.zero
```

```Go
var zero = 0.0
```

### <a id="eps" href="#eps">var eps</a>

```
searchKey: cmplx.eps
```

```Go
var eps = 1.0 / (1 << 53)
```

### <a id="branchPoints" href="#branchPoints">var branchPoints</a>

```
searchKey: cmplx.branchPoints
```

```Go
var branchPoints = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="ff" href="#ff">type ff struct</a>

```
searchKey: cmplx.ff
```

```Go
type ff struct {
	r, theta float64
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="Abs" href="#Abs">func Abs(x complex128) float64</a>

```
searchKey: cmplx.Abs
tags: [exported]
```

```Go
func Abs(x complex128) float64
```

Abs returns the absolute value (also called the modulus) of x. 

### <a id="Asin" href="#Asin">func Asin(x complex128) complex128</a>

```
searchKey: cmplx.Asin
tags: [exported]
```

```Go
func Asin(x complex128) complex128
```

Asin returns the inverse sine of x. 

### <a id="Asinh" href="#Asinh">func Asinh(x complex128) complex128</a>

```
searchKey: cmplx.Asinh
tags: [exported]
```

```Go
func Asinh(x complex128) complex128
```

Asinh returns the inverse hyperbolic sine of x. 

### <a id="Acos" href="#Acos">func Acos(x complex128) complex128</a>

```
searchKey: cmplx.Acos
tags: [exported]
```

```Go
func Acos(x complex128) complex128
```

Acos returns the inverse cosine of x. 

### <a id="Acosh" href="#Acosh">func Acosh(x complex128) complex128</a>

```
searchKey: cmplx.Acosh
tags: [exported]
```

```Go
func Acosh(x complex128) complex128
```

Acosh returns the inverse hyperbolic cosine of x. 

### <a id="Atan" href="#Atan">func Atan(x complex128) complex128</a>

```
searchKey: cmplx.Atan
tags: [exported]
```

```Go
func Atan(x complex128) complex128
```

Atan returns the inverse tangent of x. 

### <a id="Atanh" href="#Atanh">func Atanh(x complex128) complex128</a>

```
searchKey: cmplx.Atanh
tags: [exported]
```

```Go
func Atanh(x complex128) complex128
```

Atanh returns the inverse hyperbolic tangent of x. 

### <a id="Conj" href="#Conj">func Conj(x complex128) complex128</a>

```
searchKey: cmplx.Conj
tags: [exported]
```

```Go
func Conj(x complex128) complex128
```

Conj returns the complex conjugate of x. 

### <a id="Exp" href="#Exp">func Exp(x complex128) complex128</a>

```
searchKey: cmplx.Exp
tags: [exported]
```

```Go
func Exp(x complex128) complex128
```

Exp returns e**x, the base-e exponential of x. 

### <a id="IsInf" href="#IsInf">func IsInf(x complex128) bool</a>

```
searchKey: cmplx.IsInf
tags: [exported]
```

```Go
func IsInf(x complex128) bool
```

IsInf reports whether either real(x) or imag(x) is an infinity. 

### <a id="Inf" href="#Inf">func Inf() complex128</a>

```
searchKey: cmplx.Inf
tags: [exported]
```

```Go
func Inf() complex128
```

Inf returns a complex infinity, complex(+Inf, +Inf). 

### <a id="IsNaN" href="#IsNaN">func IsNaN(x complex128) bool</a>

```
searchKey: cmplx.IsNaN
tags: [exported]
```

```Go
func IsNaN(x complex128) bool
```

IsNaN reports whether either real(x) or imag(x) is NaN and neither is an infinity. 

### <a id="NaN" href="#NaN">func NaN() complex128</a>

```
searchKey: cmplx.NaN
tags: [exported]
```

```Go
func NaN() complex128
```

NaN returns a complex `not-a-number' value. 

### <a id="Log" href="#Log">func Log(x complex128) complex128</a>

```
searchKey: cmplx.Log
tags: [exported]
```

```Go
func Log(x complex128) complex128
```

Log returns the natural logarithm of x. 

### <a id="Log10" href="#Log10">func Log10(x complex128) complex128</a>

```
searchKey: cmplx.Log10
tags: [exported]
```

```Go
func Log10(x complex128) complex128
```

Log10 returns the decimal logarithm of x. 

### <a id="Phase" href="#Phase">func Phase(x complex128) float64</a>

```
searchKey: cmplx.Phase
tags: [exported]
```

```Go
func Phase(x complex128) float64
```

Phase returns the phase (also called the argument) of x. The returned value is in the range [-Pi, Pi]. 

### <a id="Polar" href="#Polar">func Polar(x complex128) (r, θ float64)</a>

```
searchKey: cmplx.Polar
tags: [exported]
```

```Go
func Polar(x complex128) (r, θ float64)
```

Polar returns the absolute value r and phase θ of x, such that x = r * e**θi. The phase is in the range [-Pi, Pi]. 

### <a id="Pow" href="#Pow">func Pow(x, y complex128) complex128</a>

```
searchKey: cmplx.Pow
tags: [exported]
```

```Go
func Pow(x, y complex128) complex128
```

Pow returns x**y, the base-x exponential of y. For generalized compatibility with math.Pow: 

```
Pow(0, ±0) returns 1+0i
Pow(0, c) for real(c)<0 returns Inf+0i if imag(c) is zero, otherwise Inf+Inf i.

```
### <a id="Rect" href="#Rect">func Rect(r, θ float64) complex128</a>

```
searchKey: cmplx.Rect
tags: [exported]
```

```Go
func Rect(r, θ float64) complex128
```

Rect returns the complex number x with polar coordinates r, θ. 

### <a id="Sin" href="#Sin">func Sin(x complex128) complex128</a>

```
searchKey: cmplx.Sin
tags: [exported]
```

```Go
func Sin(x complex128) complex128
```

Sin returns the sine of x. 

### <a id="Sinh" href="#Sinh">func Sinh(x complex128) complex128</a>

```
searchKey: cmplx.Sinh
tags: [exported]
```

```Go
func Sinh(x complex128) complex128
```

Sinh returns the hyperbolic sine of x. 

### <a id="Cos" href="#Cos">func Cos(x complex128) complex128</a>

```
searchKey: cmplx.Cos
tags: [exported]
```

```Go
func Cos(x complex128) complex128
```

Cos returns the cosine of x. 

### <a id="Cosh" href="#Cosh">func Cosh(x complex128) complex128</a>

```
searchKey: cmplx.Cosh
tags: [exported]
```

```Go
func Cosh(x complex128) complex128
```

Cosh returns the hyperbolic cosine of x. 

### <a id="sinhcosh" href="#sinhcosh">func sinhcosh(x float64) (sh, ch float64)</a>

```
searchKey: cmplx.sinhcosh
```

```Go
func sinhcosh(x float64) (sh, ch float64)
```

calculate sinh and cosh 

### <a id="Sqrt" href="#Sqrt">func Sqrt(x complex128) complex128</a>

```
searchKey: cmplx.Sqrt
tags: [exported]
```

```Go
func Sqrt(x complex128) complex128
```

Sqrt returns the square root of x. The result r is chosen so that real(r) ≥ 0 and imag(r) has the same sign as imag(x). 

### <a id="Tan" href="#Tan">func Tan(x complex128) complex128</a>

```
searchKey: cmplx.Tan
tags: [exported]
```

```Go
func Tan(x complex128) complex128
```

Tan returns the tangent of x. 

### <a id="Tanh" href="#Tanh">func Tanh(x complex128) complex128</a>

```
searchKey: cmplx.Tanh
tags: [exported]
```

```Go
func Tanh(x complex128) complex128
```

Tanh returns the hyperbolic tangent of x. 

### <a id="reducePi" href="#reducePi">func reducePi(x float64) float64</a>

```
searchKey: cmplx.reducePi
```

```Go
func reducePi(x float64) float64
```

reducePi reduces the input argument x to the range (-Pi/2, Pi/2]. x must be greater than or equal to 0. For small arguments it uses Cody-Waite reduction in 3 float64 parts based on: "Elementary Function Evaluation:  Algorithms and Implementation" Jean-Michel Muller, 1997. For very large arguments it uses Payne-Hanek range reduction based on: "ARGUMENT REDUCTION FOR HUGE ARGUMENTS: Good to the Last Bit" K. C. Ng et al, March 24, 1992. 

### <a id="tanSeries" href="#tanSeries">func tanSeries(z complex128) float64</a>

```
searchKey: cmplx.tanSeries
```

```Go
func tanSeries(z complex128) float64
```

Taylor series expansion for cosh(2y) - cos(2x) 

### <a id="Cot" href="#Cot">func Cot(x complex128) complex128</a>

```
searchKey: cmplx.Cot
tags: [exported]
```

```Go
func Cot(x complex128) complex128
```

Cot returns the cotangent of x. 

### <a id="tolerance" href="#tolerance">func tolerance(a, b, e float64) bool</a>

```
searchKey: cmplx.tolerance
```

```Go
func tolerance(a, b, e float64) bool
```

functions borrowed from pkg/math/all_test.go 

### <a id="veryclose" href="#veryclose">func veryclose(a, b float64) bool</a>

```
searchKey: cmplx.veryclose
```

```Go
func veryclose(a, b float64) bool
```

### <a id="alike" href="#alike">func alike(a, b float64) bool</a>

```
searchKey: cmplx.alike
```

```Go
func alike(a, b float64) bool
```

### <a id="cTolerance" href="#cTolerance">func cTolerance(a, b complex128, e float64) bool</a>

```
searchKey: cmplx.cTolerance
```

```Go
func cTolerance(a, b complex128, e float64) bool
```

### <a id="cSoclose" href="#cSoclose">func cSoclose(a, b complex128, e float64) bool</a>

```
searchKey: cmplx.cSoclose
```

```Go
func cSoclose(a, b complex128, e float64) bool
```

### <a id="cVeryclose" href="#cVeryclose">func cVeryclose(a, b complex128) bool</a>

```
searchKey: cmplx.cVeryclose
```

```Go
func cVeryclose(a, b complex128) bool
```

### <a id="cAlike" href="#cAlike">func cAlike(a, b complex128) bool</a>

```
searchKey: cmplx.cAlike
```

```Go
func cAlike(a, b complex128) bool
```

### <a id="isExact" href="#isExact">func isExact(x float64) bool</a>

```
searchKey: cmplx.isExact
```

```Go
func isExact(x float64) bool
```

### <a id="TestAbs" href="#TestAbs">func TestAbs(t *testing.T)</a>

```
searchKey: cmplx.TestAbs
```

```Go
func TestAbs(t *testing.T)
```

### <a id="TestAcos" href="#TestAcos">func TestAcos(t *testing.T)</a>

```
searchKey: cmplx.TestAcos
```

```Go
func TestAcos(t *testing.T)
```

### <a id="TestAcosh" href="#TestAcosh">func TestAcosh(t *testing.T)</a>

```
searchKey: cmplx.TestAcosh
```

```Go
func TestAcosh(t *testing.T)
```

### <a id="TestAsin" href="#TestAsin">func TestAsin(t *testing.T)</a>

```
searchKey: cmplx.TestAsin
```

```Go
func TestAsin(t *testing.T)
```

### <a id="TestAsinh" href="#TestAsinh">func TestAsinh(t *testing.T)</a>

```
searchKey: cmplx.TestAsinh
```

```Go
func TestAsinh(t *testing.T)
```

### <a id="TestAtan" href="#TestAtan">func TestAtan(t *testing.T)</a>

```
searchKey: cmplx.TestAtan
```

```Go
func TestAtan(t *testing.T)
```

### <a id="TestAtanh" href="#TestAtanh">func TestAtanh(t *testing.T)</a>

```
searchKey: cmplx.TestAtanh
```

```Go
func TestAtanh(t *testing.T)
```

### <a id="TestConj" href="#TestConj">func TestConj(t *testing.T)</a>

```
searchKey: cmplx.TestConj
```

```Go
func TestConj(t *testing.T)
```

### <a id="TestCos" href="#TestCos">func TestCos(t *testing.T)</a>

```
searchKey: cmplx.TestCos
```

```Go
func TestCos(t *testing.T)
```

### <a id="TestCosh" href="#TestCosh">func TestCosh(t *testing.T)</a>

```
searchKey: cmplx.TestCosh
```

```Go
func TestCosh(t *testing.T)
```

### <a id="TestExp" href="#TestExp">func TestExp(t *testing.T)</a>

```
searchKey: cmplx.TestExp
```

```Go
func TestExp(t *testing.T)
```

### <a id="TestIsNaN" href="#TestIsNaN">func TestIsNaN(t *testing.T)</a>

```
searchKey: cmplx.TestIsNaN
```

```Go
func TestIsNaN(t *testing.T)
```

### <a id="TestLog" href="#TestLog">func TestLog(t *testing.T)</a>

```
searchKey: cmplx.TestLog
```

```Go
func TestLog(t *testing.T)
```

### <a id="TestLog10" href="#TestLog10">func TestLog10(t *testing.T)</a>

```
searchKey: cmplx.TestLog10
```

```Go
func TestLog10(t *testing.T)
```

### <a id="TestPolar" href="#TestPolar">func TestPolar(t *testing.T)</a>

```
searchKey: cmplx.TestPolar
```

```Go
func TestPolar(t *testing.T)
```

### <a id="TestPow" href="#TestPow">func TestPow(t *testing.T)</a>

```
searchKey: cmplx.TestPow
```

```Go
func TestPow(t *testing.T)
```

### <a id="TestRect" href="#TestRect">func TestRect(t *testing.T)</a>

```
searchKey: cmplx.TestRect
```

```Go
func TestRect(t *testing.T)
```

### <a id="TestSin" href="#TestSin">func TestSin(t *testing.T)</a>

```
searchKey: cmplx.TestSin
```

```Go
func TestSin(t *testing.T)
```

### <a id="TestSinh" href="#TestSinh">func TestSinh(t *testing.T)</a>

```
searchKey: cmplx.TestSinh
```

```Go
func TestSinh(t *testing.T)
```

### <a id="TestSqrt" href="#TestSqrt">func TestSqrt(t *testing.T)</a>

```
searchKey: cmplx.TestSqrt
```

```Go
func TestSqrt(t *testing.T)
```

### <a id="TestTan" href="#TestTan">func TestTan(t *testing.T)</a>

```
searchKey: cmplx.TestTan
```

```Go
func TestTan(t *testing.T)
```

### <a id="TestTanh" href="#TestTanh">func TestTanh(t *testing.T)</a>

```
searchKey: cmplx.TestTanh
```

```Go
func TestTanh(t *testing.T)
```

### <a id="TestInfiniteLoopIntanSeries" href="#TestInfiniteLoopIntanSeries">func TestInfiniteLoopIntanSeries(t *testing.T)</a>

```
searchKey: cmplx.TestInfiniteLoopIntanSeries
```

```Go
func TestInfiniteLoopIntanSeries(t *testing.T)
```

See issue 17577 

### <a id="BenchmarkAbs" href="#BenchmarkAbs">func BenchmarkAbs(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkAbs
```

```Go
func BenchmarkAbs(b *testing.B)
```

### <a id="BenchmarkAcos" href="#BenchmarkAcos">func BenchmarkAcos(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkAcos
```

```Go
func BenchmarkAcos(b *testing.B)
```

### <a id="BenchmarkAcosh" href="#BenchmarkAcosh">func BenchmarkAcosh(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkAcosh
```

```Go
func BenchmarkAcosh(b *testing.B)
```

### <a id="BenchmarkAsin" href="#BenchmarkAsin">func BenchmarkAsin(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkAsin
```

```Go
func BenchmarkAsin(b *testing.B)
```

### <a id="BenchmarkAsinh" href="#BenchmarkAsinh">func BenchmarkAsinh(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkAsinh
```

```Go
func BenchmarkAsinh(b *testing.B)
```

### <a id="BenchmarkAtan" href="#BenchmarkAtan">func BenchmarkAtan(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkAtan
```

```Go
func BenchmarkAtan(b *testing.B)
```

### <a id="BenchmarkAtanh" href="#BenchmarkAtanh">func BenchmarkAtanh(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkAtanh
```

```Go
func BenchmarkAtanh(b *testing.B)
```

### <a id="BenchmarkConj" href="#BenchmarkConj">func BenchmarkConj(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkConj
```

```Go
func BenchmarkConj(b *testing.B)
```

### <a id="BenchmarkCos" href="#BenchmarkCos">func BenchmarkCos(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkCos
```

```Go
func BenchmarkCos(b *testing.B)
```

### <a id="BenchmarkCosh" href="#BenchmarkCosh">func BenchmarkCosh(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkCosh
```

```Go
func BenchmarkCosh(b *testing.B)
```

### <a id="BenchmarkExp" href="#BenchmarkExp">func BenchmarkExp(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkExp
```

```Go
func BenchmarkExp(b *testing.B)
```

### <a id="BenchmarkLog" href="#BenchmarkLog">func BenchmarkLog(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkLog
```

```Go
func BenchmarkLog(b *testing.B)
```

### <a id="BenchmarkLog10" href="#BenchmarkLog10">func BenchmarkLog10(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkLog10
```

```Go
func BenchmarkLog10(b *testing.B)
```

### <a id="BenchmarkPhase" href="#BenchmarkPhase">func BenchmarkPhase(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkPhase
```

```Go
func BenchmarkPhase(b *testing.B)
```

### <a id="BenchmarkPolar" href="#BenchmarkPolar">func BenchmarkPolar(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkPolar
```

```Go
func BenchmarkPolar(b *testing.B)
```

### <a id="BenchmarkPow" href="#BenchmarkPow">func BenchmarkPow(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkPow
```

```Go
func BenchmarkPow(b *testing.B)
```

### <a id="BenchmarkRect" href="#BenchmarkRect">func BenchmarkRect(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkRect
```

```Go
func BenchmarkRect(b *testing.B)
```

### <a id="BenchmarkSin" href="#BenchmarkSin">func BenchmarkSin(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkSin
```

```Go
func BenchmarkSin(b *testing.B)
```

### <a id="BenchmarkSinh" href="#BenchmarkSinh">func BenchmarkSinh(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkSinh
```

```Go
func BenchmarkSinh(b *testing.B)
```

### <a id="BenchmarkSqrt" href="#BenchmarkSqrt">func BenchmarkSqrt(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkSqrt
```

```Go
func BenchmarkSqrt(b *testing.B)
```

### <a id="BenchmarkTan" href="#BenchmarkTan">func BenchmarkTan(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkTan
```

```Go
func BenchmarkTan(b *testing.B)
```

### <a id="BenchmarkTanh" href="#BenchmarkTanh">func BenchmarkTanh(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkTanh
```

```Go
func BenchmarkTanh(b *testing.B)
```

### <a id="TestTanHuge" href="#TestTanHuge">func TestTanHuge(t *testing.T)</a>

```
searchKey: cmplx.TestTanHuge
```

```Go
func TestTanHuge(t *testing.T)
```

