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

### <a id="vc26" href="#vc26">var vc26</a>

```
searchKey: cmplx.vc26
tags: [private]
```

```Go
var vc26 = ...
```

The higher-precision values in vc26 were used to derive the input arguments vc (see also comment below). For reference only (do not delete). 

### <a id="vc" href="#vc">var vc</a>

```
searchKey: cmplx.vc
tags: [private]
```

```Go
var vc = ...
```

### <a id="abs" href="#abs">var abs</a>

```
searchKey: cmplx.abs
tags: [private]
```

```Go
var abs = ...
```

### <a id="acos" href="#acos">var acos</a>

```
searchKey: cmplx.acos
tags: [private]
```

```Go
var acos = ...
```

### <a id="acosh" href="#acosh">var acosh</a>

```
searchKey: cmplx.acosh
tags: [private]
```

```Go
var acosh = ...
```

### <a id="asin" href="#asin">var asin</a>

```
searchKey: cmplx.asin
tags: [private]
```

```Go
var asin = ...
```

### <a id="asinh" href="#asinh">var asinh</a>

```
searchKey: cmplx.asinh
tags: [private]
```

```Go
var asinh = ...
```

### <a id="atan" href="#atan">var atan</a>

```
searchKey: cmplx.atan
tags: [private]
```

```Go
var atan = ...
```

### <a id="atanh" href="#atanh">var atanh</a>

```
searchKey: cmplx.atanh
tags: [private]
```

```Go
var atanh = ...
```

### <a id="conj" href="#conj">var conj</a>

```
searchKey: cmplx.conj
tags: [private]
```

```Go
var conj = ...
```

### <a id="cos" href="#cos">var cos</a>

```
searchKey: cmplx.cos
tags: [private]
```

```Go
var cos = ...
```

### <a id="cosh" href="#cosh">var cosh</a>

```
searchKey: cmplx.cosh
tags: [private]
```

```Go
var cosh = ...
```

### <a id="exp" href="#exp">var exp</a>

```
searchKey: cmplx.exp
tags: [private]
```

```Go
var exp = ...
```

### <a id="log" href="#log">var log</a>

```
searchKey: cmplx.log
tags: [private]
```

```Go
var log = ...
```

### <a id="log10" href="#log10">var log10</a>

```
searchKey: cmplx.log10
tags: [private]
```

```Go
var log10 = ...
```

### <a id="polar" href="#polar">var polar</a>

```
searchKey: cmplx.polar
tags: [private]
```

```Go
var polar = ...
```

### <a id="pow" href="#pow">var pow</a>

```
searchKey: cmplx.pow
tags: [private]
```

```Go
var pow = ...
```

### <a id="sin" href="#sin">var sin</a>

```
searchKey: cmplx.sin
tags: [private]
```

```Go
var sin = ...
```

### <a id="sinh" href="#sinh">var sinh</a>

```
searchKey: cmplx.sinh
tags: [private]
```

```Go
var sinh = ...
```

### <a id="sqrt" href="#sqrt">var sqrt</a>

```
searchKey: cmplx.sqrt
tags: [private]
```

```Go
var sqrt = ...
```

### <a id="tan" href="#tan">var tan</a>

```
searchKey: cmplx.tan
tags: [private]
```

```Go
var tan = ...
```

### <a id="tanh" href="#tanh">var tanh</a>

```
searchKey: cmplx.tanh
tags: [private]
```

```Go
var tanh = ...
```

### <a id="hugeIn" href="#hugeIn">var hugeIn</a>

```
searchKey: cmplx.hugeIn
tags: [private]
```

```Go
var hugeIn = ...
```

huge values along the real axis for testing reducePi in Tan 

### <a id="tanHuge" href="#tanHuge">var tanHuge</a>

```
searchKey: cmplx.tanHuge
tags: [private]
```

```Go
var tanHuge = ...
```

Results for tanHuge[i] calculated with [https://github.com/robpike/ivy](https://github.com/robpike/ivy) using 4096 bits of working precision. 

### <a id="inf" href="#inf">var inf</a>

```
searchKey: cmplx.inf
tags: [private]
```

```Go
var inf, nan = math.Inf(1), math.NaN()
```

special cases conform to C99 standard appendix G.6 Complex arithmetic 

### <a id="nan" href="#nan">var nan</a>

```
searchKey: cmplx.nan
tags: [private]
```

```Go
var inf, nan = math.Inf(1), math.NaN()
```

special cases conform to C99 standard appendix G.6 Complex arithmetic 

### <a id="vcAbsSC" href="#vcAbsSC">var vcAbsSC</a>

```
searchKey: cmplx.vcAbsSC
tags: [private]
```

```Go
var vcAbsSC = []complex128{
	NaN(),
}
```

### <a id="absSC" href="#absSC">var absSC</a>

```
searchKey: cmplx.absSC
tags: [private]
```

```Go
var absSC = []float64{
	math.NaN(),
}
```

### <a id="acosSC" href="#acosSC">var acosSC</a>

```
searchKey: cmplx.acosSC
tags: [private]
```

```Go
var acosSC = ...
```

### <a id="acoshSC" href="#acoshSC">var acoshSC</a>

```
searchKey: cmplx.acoshSC
tags: [private]
```

```Go
var acoshSC = ...
```

### <a id="asinSC" href="#asinSC">var asinSC</a>

```
searchKey: cmplx.asinSC
tags: [private]
```

```Go
var asinSC = ...
```

### <a id="asinhSC" href="#asinhSC">var asinhSC</a>

```
searchKey: cmplx.asinhSC
tags: [private]
```

```Go
var asinhSC = ...
```

### <a id="atanSC" href="#atanSC">var atanSC</a>

```
searchKey: cmplx.atanSC
tags: [private]
```

```Go
var atanSC = ...
```

### <a id="atanhSC" href="#atanhSC">var atanhSC</a>

```
searchKey: cmplx.atanhSC
tags: [private]
```

```Go
var atanhSC = ...
```

### <a id="vcConjSC" href="#vcConjSC">var vcConjSC</a>

```
searchKey: cmplx.vcConjSC
tags: [private]
```

```Go
var vcConjSC = []complex128{
	NaN(),
}
```

### <a id="conjSC" href="#conjSC">var conjSC</a>

```
searchKey: cmplx.conjSC
tags: [private]
```

```Go
var conjSC = []complex128{
	NaN(),
}
```

### <a id="cosSC" href="#cosSC">var cosSC</a>

```
searchKey: cmplx.cosSC
tags: [private]
```

```Go
var cosSC = ...
```

### <a id="coshSC" href="#coshSC">var coshSC</a>

```
searchKey: cmplx.coshSC
tags: [private]
```

```Go
var coshSC = ...
```

### <a id="expSC" href="#expSC">var expSC</a>

```
searchKey: cmplx.expSC
tags: [private]
```

```Go
var expSC = ...
```

### <a id="vcIsNaNSC" href="#vcIsNaNSC">var vcIsNaNSC</a>

```
searchKey: cmplx.vcIsNaNSC
tags: [private]
```

```Go
var vcIsNaNSC = ...
```

### <a id="isNaNSC" href="#isNaNSC">var isNaNSC</a>

```
searchKey: cmplx.isNaNSC
tags: [private]
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
tags: [private]
```

```Go
var logSC = ...
```

### <a id="log10SC" href="#log10SC">var log10SC</a>

```
searchKey: cmplx.log10SC
tags: [private]
```

```Go
var log10SC = ...
```

### <a id="vcPolarSC" href="#vcPolarSC">var vcPolarSC</a>

```
searchKey: cmplx.vcPolarSC
tags: [private]
```

```Go
var vcPolarSC = []complex128{
	NaN(),
}
```

### <a id="polarSC" href="#polarSC">var polarSC</a>

```
searchKey: cmplx.polarSC
tags: [private]
```

```Go
var polarSC = []ff{
	{math.NaN(), math.NaN()},
}
```

### <a id="vcPowSC" href="#vcPowSC">var vcPowSC</a>

```
searchKey: cmplx.vcPowSC
tags: [private]
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
tags: [private]
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
tags: [private]
```

```Go
var sinSC = ...
```

### <a id="sinhSC" href="#sinhSC">var sinhSC</a>

```
searchKey: cmplx.sinhSC
tags: [private]
```

```Go
var sinhSC = ...
```

### <a id="sqrtSC" href="#sqrtSC">var sqrtSC</a>

```
searchKey: cmplx.sqrtSC
tags: [private]
```

```Go
var sqrtSC = ...
```

### <a id="tanSC" href="#tanSC">var tanSC</a>

```
searchKey: cmplx.tanSC
tags: [private]
```

```Go
var tanSC = ...
```

### <a id="tanhSC" href="#tanhSC">var tanhSC</a>

```
searchKey: cmplx.tanhSC
tags: [private]
```

```Go
var tanhSC = ...
```

### <a id="zero" href="#zero">var zero</a>

```
searchKey: cmplx.zero
tags: [private]
```

```Go
var zero = 0.0
```

### <a id="eps" href="#eps">var eps</a>

```
searchKey: cmplx.eps
tags: [private]
```

```Go
var eps = 1.0 / (1 << 53)
```

### <a id="branchPoints" href="#branchPoints">var branchPoints</a>

```
searchKey: cmplx.branchPoints
tags: [private]
```

```Go
var branchPoints = ...
```

## <a id="type" href="#type">Types</a>

### <a id="ff" href="#ff">type ff struct</a>

```
searchKey: cmplx.ff
tags: [private]
```

```Go
type ff struct {
	r, theta float64
}
```

## <a id="func" href="#func">Functions</a>

### <a id="Abs" href="#Abs">func Abs(x complex128) float64</a>

```
searchKey: cmplx.Abs
```

```Go
func Abs(x complex128) float64
```

Abs returns the absolute value (also called the modulus) of x. 

### <a id="Asin" href="#Asin">func Asin(x complex128) complex128</a>

```
searchKey: cmplx.Asin
```

```Go
func Asin(x complex128) complex128
```

Asin returns the inverse sine of x. 

### <a id="Asinh" href="#Asinh">func Asinh(x complex128) complex128</a>

```
searchKey: cmplx.Asinh
```

```Go
func Asinh(x complex128) complex128
```

Asinh returns the inverse hyperbolic sine of x. 

### <a id="Acos" href="#Acos">func Acos(x complex128) complex128</a>

```
searchKey: cmplx.Acos
```

```Go
func Acos(x complex128) complex128
```

Acos returns the inverse cosine of x. 

### <a id="Acosh" href="#Acosh">func Acosh(x complex128) complex128</a>

```
searchKey: cmplx.Acosh
```

```Go
func Acosh(x complex128) complex128
```

Acosh returns the inverse hyperbolic cosine of x. 

### <a id="Atan" href="#Atan">func Atan(x complex128) complex128</a>

```
searchKey: cmplx.Atan
```

```Go
func Atan(x complex128) complex128
```

Atan returns the inverse tangent of x. 

### <a id="Atanh" href="#Atanh">func Atanh(x complex128) complex128</a>

```
searchKey: cmplx.Atanh
```

```Go
func Atanh(x complex128) complex128
```

Atanh returns the inverse hyperbolic tangent of x. 

### <a id="Conj" href="#Conj">func Conj(x complex128) complex128</a>

```
searchKey: cmplx.Conj
```

```Go
func Conj(x complex128) complex128
```

Conj returns the complex conjugate of x. 

### <a id="Exp" href="#Exp">func Exp(x complex128) complex128</a>

```
searchKey: cmplx.Exp
```

```Go
func Exp(x complex128) complex128
```

Exp returns e**x, the base-e exponential of x. 

### <a id="IsInf" href="#IsInf">func IsInf(x complex128) bool</a>

```
searchKey: cmplx.IsInf
```

```Go
func IsInf(x complex128) bool
```

IsInf reports whether either real(x) or imag(x) is an infinity. 

### <a id="Inf" href="#Inf">func Inf() complex128</a>

```
searchKey: cmplx.Inf
```

```Go
func Inf() complex128
```

Inf returns a complex infinity, complex(+Inf, +Inf). 

### <a id="IsNaN" href="#IsNaN">func IsNaN(x complex128) bool</a>

```
searchKey: cmplx.IsNaN
```

```Go
func IsNaN(x complex128) bool
```

IsNaN reports whether either real(x) or imag(x) is NaN and neither is an infinity. 

### <a id="NaN" href="#NaN">func NaN() complex128</a>

```
searchKey: cmplx.NaN
```

```Go
func NaN() complex128
```

NaN returns a complex `not-a-number' value. 

### <a id="Log" href="#Log">func Log(x complex128) complex128</a>

```
searchKey: cmplx.Log
```

```Go
func Log(x complex128) complex128
```

Log returns the natural logarithm of x. 

### <a id="Log10" href="#Log10">func Log10(x complex128) complex128</a>

```
searchKey: cmplx.Log10
```

```Go
func Log10(x complex128) complex128
```

Log10 returns the decimal logarithm of x. 

### <a id="Phase" href="#Phase">func Phase(x complex128) float64</a>

```
searchKey: cmplx.Phase
```

```Go
func Phase(x complex128) float64
```

Phase returns the phase (also called the argument) of x. The returned value is in the range [-Pi, Pi]. 

### <a id="Polar" href="#Polar">func Polar(x complex128) (r, θ float64)</a>

```
searchKey: cmplx.Polar
```

```Go
func Polar(x complex128) (r, θ float64)
```

Polar returns the absolute value r and phase θ of x, such that x = r * e**θi. The phase is in the range [-Pi, Pi]. 

### <a id="Pow" href="#Pow">func Pow(x, y complex128) complex128</a>

```
searchKey: cmplx.Pow
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
```

```Go
func Rect(r, θ float64) complex128
```

Rect returns the complex number x with polar coordinates r, θ. 

### <a id="Sin" href="#Sin">func Sin(x complex128) complex128</a>

```
searchKey: cmplx.Sin
```

```Go
func Sin(x complex128) complex128
```

Sin returns the sine of x. 

### <a id="Sinh" href="#Sinh">func Sinh(x complex128) complex128</a>

```
searchKey: cmplx.Sinh
```

```Go
func Sinh(x complex128) complex128
```

Sinh returns the hyperbolic sine of x. 

### <a id="Cos" href="#Cos">func Cos(x complex128) complex128</a>

```
searchKey: cmplx.Cos
```

```Go
func Cos(x complex128) complex128
```

Cos returns the cosine of x. 

### <a id="Cosh" href="#Cosh">func Cosh(x complex128) complex128</a>

```
searchKey: cmplx.Cosh
```

```Go
func Cosh(x complex128) complex128
```

Cosh returns the hyperbolic cosine of x. 

### <a id="sinhcosh" href="#sinhcosh">func sinhcosh(x float64) (sh, ch float64)</a>

```
searchKey: cmplx.sinhcosh
tags: [private]
```

```Go
func sinhcosh(x float64) (sh, ch float64)
```

calculate sinh and cosh 

### <a id="Sqrt" href="#Sqrt">func Sqrt(x complex128) complex128</a>

```
searchKey: cmplx.Sqrt
```

```Go
func Sqrt(x complex128) complex128
```

Sqrt returns the square root of x. The result r is chosen so that real(r) ≥ 0 and imag(r) has the same sign as imag(x). 

### <a id="Tan" href="#Tan">func Tan(x complex128) complex128</a>

```
searchKey: cmplx.Tan
```

```Go
func Tan(x complex128) complex128
```

Tan returns the tangent of x. 

### <a id="Tanh" href="#Tanh">func Tanh(x complex128) complex128</a>

```
searchKey: cmplx.Tanh
```

```Go
func Tanh(x complex128) complex128
```

Tanh returns the hyperbolic tangent of x. 

### <a id="reducePi" href="#reducePi">func reducePi(x float64) float64</a>

```
searchKey: cmplx.reducePi
tags: [private]
```

```Go
func reducePi(x float64) float64
```

reducePi reduces the input argument x to the range (-Pi/2, Pi/2]. x must be greater than or equal to 0. For small arguments it uses Cody-Waite reduction in 3 float64 parts based on: "Elementary Function Evaluation:  Algorithms and Implementation" Jean-Michel Muller, 1997. For very large arguments it uses Payne-Hanek range reduction based on: "ARGUMENT REDUCTION FOR HUGE ARGUMENTS: Good to the Last Bit" K. C. Ng et al, March 24, 1992. 

### <a id="tanSeries" href="#tanSeries">func tanSeries(z complex128) float64</a>

```
searchKey: cmplx.tanSeries
tags: [private]
```

```Go
func tanSeries(z complex128) float64
```

Taylor series expansion for cosh(2y) - cos(2x) 

### <a id="Cot" href="#Cot">func Cot(x complex128) complex128</a>

```
searchKey: cmplx.Cot
```

```Go
func Cot(x complex128) complex128
```

Cot returns the cotangent of x. 

### <a id="tolerance" href="#tolerance">func tolerance(a, b, e float64) bool</a>

```
searchKey: cmplx.tolerance
tags: [private]
```

```Go
func tolerance(a, b, e float64) bool
```

functions borrowed from pkg/math/all_test.go 

### <a id="veryclose" href="#veryclose">func veryclose(a, b float64) bool</a>

```
searchKey: cmplx.veryclose
tags: [private]
```

```Go
func veryclose(a, b float64) bool
```

### <a id="alike" href="#alike">func alike(a, b float64) bool</a>

```
searchKey: cmplx.alike
tags: [private]
```

```Go
func alike(a, b float64) bool
```

### <a id="cTolerance" href="#cTolerance">func cTolerance(a, b complex128, e float64) bool</a>

```
searchKey: cmplx.cTolerance
tags: [private]
```

```Go
func cTolerance(a, b complex128, e float64) bool
```

### <a id="cSoclose" href="#cSoclose">func cSoclose(a, b complex128, e float64) bool</a>

```
searchKey: cmplx.cSoclose
tags: [private]
```

```Go
func cSoclose(a, b complex128, e float64) bool
```

### <a id="cVeryclose" href="#cVeryclose">func cVeryclose(a, b complex128) bool</a>

```
searchKey: cmplx.cVeryclose
tags: [private]
```

```Go
func cVeryclose(a, b complex128) bool
```

### <a id="cAlike" href="#cAlike">func cAlike(a, b complex128) bool</a>

```
searchKey: cmplx.cAlike
tags: [private]
```

```Go
func cAlike(a, b complex128) bool
```

### <a id="isExact" href="#isExact">func isExact(x float64) bool</a>

```
searchKey: cmplx.isExact
tags: [private]
```

```Go
func isExact(x float64) bool
```

### <a id="TestAbs" href="#TestAbs">func TestAbs(t *testing.T)</a>

```
searchKey: cmplx.TestAbs
tags: [private]
```

```Go
func TestAbs(t *testing.T)
```

### <a id="TestAcos" href="#TestAcos">func TestAcos(t *testing.T)</a>

```
searchKey: cmplx.TestAcos
tags: [private]
```

```Go
func TestAcos(t *testing.T)
```

### <a id="TestAcosh" href="#TestAcosh">func TestAcosh(t *testing.T)</a>

```
searchKey: cmplx.TestAcosh
tags: [private]
```

```Go
func TestAcosh(t *testing.T)
```

### <a id="TestAsin" href="#TestAsin">func TestAsin(t *testing.T)</a>

```
searchKey: cmplx.TestAsin
tags: [private]
```

```Go
func TestAsin(t *testing.T)
```

### <a id="TestAsinh" href="#TestAsinh">func TestAsinh(t *testing.T)</a>

```
searchKey: cmplx.TestAsinh
tags: [private]
```

```Go
func TestAsinh(t *testing.T)
```

### <a id="TestAtan" href="#TestAtan">func TestAtan(t *testing.T)</a>

```
searchKey: cmplx.TestAtan
tags: [private]
```

```Go
func TestAtan(t *testing.T)
```

### <a id="TestAtanh" href="#TestAtanh">func TestAtanh(t *testing.T)</a>

```
searchKey: cmplx.TestAtanh
tags: [private]
```

```Go
func TestAtanh(t *testing.T)
```

### <a id="TestConj" href="#TestConj">func TestConj(t *testing.T)</a>

```
searchKey: cmplx.TestConj
tags: [private]
```

```Go
func TestConj(t *testing.T)
```

### <a id="TestCos" href="#TestCos">func TestCos(t *testing.T)</a>

```
searchKey: cmplx.TestCos
tags: [private]
```

```Go
func TestCos(t *testing.T)
```

### <a id="TestCosh" href="#TestCosh">func TestCosh(t *testing.T)</a>

```
searchKey: cmplx.TestCosh
tags: [private]
```

```Go
func TestCosh(t *testing.T)
```

### <a id="TestExp" href="#TestExp">func TestExp(t *testing.T)</a>

```
searchKey: cmplx.TestExp
tags: [private]
```

```Go
func TestExp(t *testing.T)
```

### <a id="TestIsNaN" href="#TestIsNaN">func TestIsNaN(t *testing.T)</a>

```
searchKey: cmplx.TestIsNaN
tags: [private]
```

```Go
func TestIsNaN(t *testing.T)
```

### <a id="TestLog" href="#TestLog">func TestLog(t *testing.T)</a>

```
searchKey: cmplx.TestLog
tags: [private]
```

```Go
func TestLog(t *testing.T)
```

### <a id="TestLog10" href="#TestLog10">func TestLog10(t *testing.T)</a>

```
searchKey: cmplx.TestLog10
tags: [private]
```

```Go
func TestLog10(t *testing.T)
```

### <a id="TestPolar" href="#TestPolar">func TestPolar(t *testing.T)</a>

```
searchKey: cmplx.TestPolar
tags: [private]
```

```Go
func TestPolar(t *testing.T)
```

### <a id="TestPow" href="#TestPow">func TestPow(t *testing.T)</a>

```
searchKey: cmplx.TestPow
tags: [private]
```

```Go
func TestPow(t *testing.T)
```

### <a id="TestRect" href="#TestRect">func TestRect(t *testing.T)</a>

```
searchKey: cmplx.TestRect
tags: [private]
```

```Go
func TestRect(t *testing.T)
```

### <a id="TestSin" href="#TestSin">func TestSin(t *testing.T)</a>

```
searchKey: cmplx.TestSin
tags: [private]
```

```Go
func TestSin(t *testing.T)
```

### <a id="TestSinh" href="#TestSinh">func TestSinh(t *testing.T)</a>

```
searchKey: cmplx.TestSinh
tags: [private]
```

```Go
func TestSinh(t *testing.T)
```

### <a id="TestSqrt" href="#TestSqrt">func TestSqrt(t *testing.T)</a>

```
searchKey: cmplx.TestSqrt
tags: [private]
```

```Go
func TestSqrt(t *testing.T)
```

### <a id="TestTan" href="#TestTan">func TestTan(t *testing.T)</a>

```
searchKey: cmplx.TestTan
tags: [private]
```

```Go
func TestTan(t *testing.T)
```

### <a id="TestTanh" href="#TestTanh">func TestTanh(t *testing.T)</a>

```
searchKey: cmplx.TestTanh
tags: [private]
```

```Go
func TestTanh(t *testing.T)
```

### <a id="TestInfiniteLoopIntanSeries" href="#TestInfiniteLoopIntanSeries">func TestInfiniteLoopIntanSeries(t *testing.T)</a>

```
searchKey: cmplx.TestInfiniteLoopIntanSeries
tags: [private]
```

```Go
func TestInfiniteLoopIntanSeries(t *testing.T)
```

See issue 17577 

### <a id="BenchmarkAbs" href="#BenchmarkAbs">func BenchmarkAbs(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkAbs
tags: [private]
```

```Go
func BenchmarkAbs(b *testing.B)
```

### <a id="BenchmarkAcos" href="#BenchmarkAcos">func BenchmarkAcos(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkAcos
tags: [private]
```

```Go
func BenchmarkAcos(b *testing.B)
```

### <a id="BenchmarkAcosh" href="#BenchmarkAcosh">func BenchmarkAcosh(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkAcosh
tags: [private]
```

```Go
func BenchmarkAcosh(b *testing.B)
```

### <a id="BenchmarkAsin" href="#BenchmarkAsin">func BenchmarkAsin(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkAsin
tags: [private]
```

```Go
func BenchmarkAsin(b *testing.B)
```

### <a id="BenchmarkAsinh" href="#BenchmarkAsinh">func BenchmarkAsinh(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkAsinh
tags: [private]
```

```Go
func BenchmarkAsinh(b *testing.B)
```

### <a id="BenchmarkAtan" href="#BenchmarkAtan">func BenchmarkAtan(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkAtan
tags: [private]
```

```Go
func BenchmarkAtan(b *testing.B)
```

### <a id="BenchmarkAtanh" href="#BenchmarkAtanh">func BenchmarkAtanh(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkAtanh
tags: [private]
```

```Go
func BenchmarkAtanh(b *testing.B)
```

### <a id="BenchmarkConj" href="#BenchmarkConj">func BenchmarkConj(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkConj
tags: [private]
```

```Go
func BenchmarkConj(b *testing.B)
```

### <a id="BenchmarkCos" href="#BenchmarkCos">func BenchmarkCos(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkCos
tags: [private]
```

```Go
func BenchmarkCos(b *testing.B)
```

### <a id="BenchmarkCosh" href="#BenchmarkCosh">func BenchmarkCosh(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkCosh
tags: [private]
```

```Go
func BenchmarkCosh(b *testing.B)
```

### <a id="BenchmarkExp" href="#BenchmarkExp">func BenchmarkExp(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkExp
tags: [private]
```

```Go
func BenchmarkExp(b *testing.B)
```

### <a id="BenchmarkLog" href="#BenchmarkLog">func BenchmarkLog(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkLog
tags: [private]
```

```Go
func BenchmarkLog(b *testing.B)
```

### <a id="BenchmarkLog10" href="#BenchmarkLog10">func BenchmarkLog10(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkLog10
tags: [private]
```

```Go
func BenchmarkLog10(b *testing.B)
```

### <a id="BenchmarkPhase" href="#BenchmarkPhase">func BenchmarkPhase(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkPhase
tags: [private]
```

```Go
func BenchmarkPhase(b *testing.B)
```

### <a id="BenchmarkPolar" href="#BenchmarkPolar">func BenchmarkPolar(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkPolar
tags: [private]
```

```Go
func BenchmarkPolar(b *testing.B)
```

### <a id="BenchmarkPow" href="#BenchmarkPow">func BenchmarkPow(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkPow
tags: [private]
```

```Go
func BenchmarkPow(b *testing.B)
```

### <a id="BenchmarkRect" href="#BenchmarkRect">func BenchmarkRect(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkRect
tags: [private]
```

```Go
func BenchmarkRect(b *testing.B)
```

### <a id="BenchmarkSin" href="#BenchmarkSin">func BenchmarkSin(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkSin
tags: [private]
```

```Go
func BenchmarkSin(b *testing.B)
```

### <a id="BenchmarkSinh" href="#BenchmarkSinh">func BenchmarkSinh(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkSinh
tags: [private]
```

```Go
func BenchmarkSinh(b *testing.B)
```

### <a id="BenchmarkSqrt" href="#BenchmarkSqrt">func BenchmarkSqrt(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkSqrt
tags: [private]
```

```Go
func BenchmarkSqrt(b *testing.B)
```

### <a id="BenchmarkTan" href="#BenchmarkTan">func BenchmarkTan(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkTan
tags: [private]
```

```Go
func BenchmarkTan(b *testing.B)
```

### <a id="BenchmarkTanh" href="#BenchmarkTanh">func BenchmarkTanh(b *testing.B)</a>

```
searchKey: cmplx.BenchmarkTanh
tags: [private]
```

```Go
func BenchmarkTanh(b *testing.B)
```

### <a id="TestTanHuge" href="#TestTanHuge">func TestTanHuge(t *testing.T)</a>

```
searchKey: cmplx.TestTanHuge
tags: [private]
```

```Go
func TestTanHuge(t *testing.T)
```

