# Package math

Package math provides basic constants and mathematical functions. 

This package does not guarantee bit-identical results across architectures. 

## Index

* Subpages
  * [math/big](math/big.md)
  * [math/big_test](math/big_test.md)
  * [math/bits](math/bits.md)
  * [math/bits_test](math/bits_test.md)
  * [math/cmplx](math/cmplx.md)
  * [math/cmplx_test](math/cmplx_test.md)
  * [math/rand](math/rand.md)
  * [math/rand_test](math/rand_test.md)
* [Constants](#const)
    * [const E](#E)
    * [const Ln10](#Ln10)
    * [const Ln2](#Ln2)
    * [const Log10E](#Log10E)
    * [const Log2E](#Log2E)
    * [const MaxFloat32](#MaxFloat32)
    * [const MaxFloat64](#MaxFloat64)
    * [const MaxInt](#MaxInt)
    * [const MaxInt16](#MaxInt16)
    * [const MaxInt32](#MaxInt32)
    * [const MaxInt64](#MaxInt64)
    * [const MaxInt8](#MaxInt8)
    * [const MaxUint](#MaxUint)
    * [const MaxUint16](#MaxUint16)
    * [const MaxUint32](#MaxUint32)
    * [const MaxUint64](#MaxUint64)
    * [const MaxUint8](#MaxUint8)
    * [const MinInt](#MinInt)
    * [const MinInt16](#MinInt16)
    * [const MinInt32](#MinInt32)
    * [const MinInt64](#MinInt64)
    * [const MinInt8](#MinInt8)
    * [const Phi](#Phi)
    * [const Pi](#Pi)
    * [const ReduceThreshold](#ReduceThreshold)
    * [const SmallestNonzeroFloat32](#SmallestNonzeroFloat32)
    * [const SmallestNonzeroFloat64](#SmallestNonzeroFloat64)
    * [const Sqrt2](#Sqrt2)
    * [const SqrtE](#SqrtE)
    * [const SqrtPhi](#SqrtPhi)
    * [const SqrtPi](#SqrtPi)
    * [const a0](#a0)
    * [const a1](#a1)
    * [const a2](#a2)
    * [const a3](#a3)
    * [const a4](#a4)
    * [const a5](#a5)
    * [const a6](#a6)
    * [const a7](#a7)
    * [const b0](#b0)
    * [const b1](#b1)
    * [const b2](#b2)
    * [const b3](#b3)
    * [const b4](#b4)
    * [const b5](#b5)
    * [const b6](#b6)
    * [const b7](#b7)
    * [const bias](#bias)
    * [const c0](#c0)
    * [const c1](#c1)
    * [const c2](#c2)
    * [const c3](#c3)
    * [const c4](#c4)
    * [const c5](#c5)
    * [const c6](#c6)
    * [const c7](#c7)
    * [const d0](#d0)
    * [const d1](#d1)
    * [const d2](#d2)
    * [const d3](#d3)
    * [const d4](#d4)
    * [const d5](#d5)
    * [const d6](#d6)
    * [const d7](#d7)
    * [const e0](#e0)
    * [const e1](#e1)
    * [const e2](#e2)
    * [const e3](#e3)
    * [const e4](#e4)
    * [const e5](#e5)
    * [const e6](#e6)
    * [const e7](#e7)
    * [const efx](#efx)
    * [const efx8](#efx8)
    * [const erx](#erx)
    * [const f0](#f0)
    * [const f1](#f1)
    * [const f2](#f2)
    * [const f3](#f3)
    * [const f4](#f4)
    * [const f5](#f5)
    * [const f6](#f6)
    * [const f7](#f7)
    * [const fracMask](#fracMask)
    * [const haveArchAcos](#haveArchAcos)
    * [const haveArchAcosh](#haveArchAcosh)
    * [const haveArchAsin](#haveArchAsin)
    * [const haveArchAsinh](#haveArchAsinh)
    * [const haveArchAtan](#haveArchAtan)
    * [const haveArchAtan2](#haveArchAtan2)
    * [const haveArchAtanh](#haveArchAtanh)
    * [const haveArchCbrt](#haveArchCbrt)
    * [const haveArchCeil](#haveArchCeil)
    * [const haveArchCos](#haveArchCos)
    * [const haveArchCosh](#haveArchCosh)
    * [const haveArchErf](#haveArchErf)
    * [const haveArchErfc](#haveArchErfc)
    * [const haveArchExp](#haveArchExp)
    * [const haveArchExp2](#haveArchExp2)
    * [const haveArchExpm1](#haveArchExpm1)
    * [const haveArchFloor](#haveArchFloor)
    * [const haveArchFrexp](#haveArchFrexp)
    * [const haveArchHypot](#haveArchHypot)
    * [const haveArchLdexp](#haveArchLdexp)
    * [const haveArchLog](#haveArchLog)
    * [const haveArchLog10](#haveArchLog10)
    * [const haveArchLog1p](#haveArchLog1p)
    * [const haveArchLog2](#haveArchLog2)
    * [const haveArchMax](#haveArchMax)
    * [const haveArchMin](#haveArchMin)
    * [const haveArchMod](#haveArchMod)
    * [const haveArchModf](#haveArchModf)
    * [const haveArchPow](#haveArchPow)
    * [const haveArchRemainder](#haveArchRemainder)
    * [const haveArchSin](#haveArchSin)
    * [const haveArchSinh](#haveArchSinh)
    * [const haveArchSqrt](#haveArchSqrt)
    * [const haveArchTan](#haveArchTan)
    * [const haveArchTanh](#haveArchTanh)
    * [const haveArchTrunc](#haveArchTrunc)
    * [const intSize](#intSize)
    * [const mask](#mask)
    * [const pa0](#pa0)
    * [const pa1](#pa1)
    * [const pa2](#pa2)
    * [const pa3](#pa3)
    * [const pa4](#pa4)
    * [const pa5](#pa5)
    * [const pa6](#pa6)
    * [const pp0](#pp0)
    * [const pp1](#pp1)
    * [const pp2](#pp2)
    * [const pp3](#pp3)
    * [const pp4](#pp4)
    * [const qa1](#qa1)
    * [const qa2](#qa2)
    * [const qa3](#qa3)
    * [const qa4](#qa4)
    * [const qa5](#qa5)
    * [const qa6](#qa6)
    * [const qq1](#qq1)
    * [const qq2](#qq2)
    * [const qq3](#qq3)
    * [const qq4](#qq4)
    * [const qq5](#qq5)
    * [const ra0](#ra0)
    * [const ra1](#ra1)
    * [const ra2](#ra2)
    * [const ra3](#ra3)
    * [const ra4](#ra4)
    * [const ra5](#ra5)
    * [const ra6](#ra6)
    * [const ra7](#ra7)
    * [const rb0](#rb0)
    * [const rb1](#rb1)
    * [const rb2](#rb2)
    * [const rb3](#rb3)
    * [const rb4](#rb4)
    * [const rb5](#rb5)
    * [const rb6](#rb6)
    * [const reduceThreshold](#reduceThreshold)
    * [const sa1](#sa1)
    * [const sa2](#sa2)
    * [const sa3](#sa3)
    * [const sa4](#sa4)
    * [const sa5](#sa5)
    * [const sa6](#sa6)
    * [const sa7](#sa7)
    * [const sa8](#sa8)
    * [const sb1](#sb1)
    * [const sb2](#sb2)
    * [const sb3](#sb3)
    * [const sb4](#sb4)
    * [const sb5](#sb5)
    * [const sb6](#sb6)
    * [const sb7](#sb7)
    * [const shift](#shift)
    * [const signMask](#signMask)
    * [const uvinf](#uvinf)
    * [const uvnan](#uvnan)
    * [const uvneginf](#uvneginf)
    * [const uvone](#uvone)
* [Variables](#var)
    * [var Exp2Go](#Exp2Go)
    * [var ExpGo](#ExpGo)
    * [var HypotGo](#HypotGo)
    * [var SqrtGo](#SqrtGo)
    * [var TrigReduce](#TrigReduce)
    * [var mPi4](#mPi4)
    * [var p0R2](#p0R2)
    * [var p0R3](#p0R3)
    * [var p0R5](#p0R5)
    * [var p0R8](#p0R8)
    * [var p0S2](#p0S2)
    * [var p0S3](#p0S3)
    * [var p0S5](#p0S5)
    * [var p0S8](#p0S8)
    * [var p1R2](#p1R2)
    * [var p1R3](#p1R3)
    * [var p1R5](#p1R5)
    * [var p1R8](#p1R8)
    * [var p1S2](#p1S2)
    * [var p1S3](#p1S3)
    * [var p1S5](#p1S5)
    * [var p1S8](#p1S8)
    * [var pow10negtab32](#pow10negtab32)
    * [var pow10postab32](#pow10postab32)
    * [var pow10tab](#pow10tab)
    * [var q0R2](#q0R2)
    * [var q0R3](#q0R3)
    * [var q0R5](#q0R5)
    * [var q0R8](#q0R8)
    * [var q0S2](#q0S2)
    * [var q0S3](#q0S3)
    * [var q0S5](#q0S5)
    * [var q0S8](#q0S8)
    * [var q1R2](#q1R2)
    * [var q1R3](#q1R3)
    * [var q1R5](#q1R5)
    * [var q1R8](#q1R8)
    * [var q1S2](#q1S2)
    * [var q1S3](#q1S3)
    * [var q1S5](#q1S5)
    * [var q1S8](#q1S8)
    * [var tanhP](#tanhP)
    * [var tanhQ](#tanhQ)
    * [var useFMA](#useFMA)
    * [var _cos](#_cos)
    * [var _gamP](#_gamP)
    * [var _gamQ](#_gamQ)
    * [var _gamS](#_gamS)
    * [var _lgamA](#_lgamA)
    * [var _lgamR](#_lgamR)
    * [var _lgamS](#_lgamS)
    * [var _lgamT](#_lgamT)
    * [var _lgamU](#_lgamU)
    * [var _lgamV](#_lgamV)
    * [var _lgamW](#_lgamW)
    * [var _sin](#_sin)
    * [var _tanP](#_tanP)
    * [var _tanQ](#_tanQ)
* [Functions](#func)
    * [func Abs(x float64) float64](#Abs)
    * [func Acos(x float64) float64](#Acos)
    * [func Acosh(x float64) float64](#Acosh)
    * [func Asin(x float64) float64](#Asin)
    * [func Asinh(x float64) float64](#Asinh)
    * [func Atan(x float64) float64](#Atan)
    * [func Atan2(y, x float64) float64](#Atan2)
    * [func Atanh(x float64) float64](#Atanh)
    * [func Cbrt(x float64) float64](#Cbrt)
    * [func Ceil(x float64) float64](#Ceil)
    * [func Copysign(x, y float64) float64](#Copysign)
    * [func Cos(x float64) float64](#Cos)
    * [func Cosh(x float64) float64](#Cosh)
    * [func Dim(x, y float64) float64](#Dim)
    * [func Erf(x float64) float64](#Erf)
    * [func Erfc(x float64) float64](#Erfc)
    * [func Erfcinv(x float64) float64](#Erfcinv)
    * [func Erfinv(x float64) float64](#Erfinv)
    * [func Exp(x float64) float64](#Exp)
    * [func Exp2(x float64) float64](#Exp2)
    * [func Expm1(x float64) float64](#Expm1)
    * [func FMA(x, y, z float64) float64](#FMA)
    * [func Float32bits(f float32) uint32](#Float32bits)
    * [func Float32frombits(b uint32) float32](#Float32frombits)
    * [func Float64bits(f float64) uint64](#Float64bits)
    * [func Float64frombits(b uint64) float64](#Float64frombits)
    * [func Floor(x float64) float64](#Floor)
    * [func Frexp(f float64) (frac float64, exp int)](#Frexp)
    * [func Gamma(x float64) float64](#Gamma)
    * [func Hypot(p, q float64) float64](#Hypot)
    * [func Ilogb(x float64) int](#Ilogb)
    * [func Inf(sign int) float64](#Inf)
    * [func IsInf(f float64, sign int) bool](#IsInf)
    * [func IsNaN(f float64) (is bool)](#IsNaN)
    * [func J0(x float64) float64](#J0)
    * [func J1(x float64) float64](#J1)
    * [func Jn(n int, x float64) float64](#Jn)
    * [func Ldexp(frac float64, exp int) float64](#Ldexp)
    * [func Lgamma(x float64) (lgamma float64, sign int)](#Lgamma)
    * [func Log(x float64) float64](#Log)
    * [func Log10(x float64) float64](#Log10)
    * [func Log1p(x float64) float64](#Log1p)
    * [func Log2(x float64) float64](#Log2)
    * [func Logb(x float64) float64](#Logb)
    * [func Max(x, y float64) float64](#Max)
    * [func Min(x, y float64) float64](#Min)
    * [func Mod(x, y float64) float64](#Mod)
    * [func Modf(f float64) (int float64, frac float64)](#Modf)
    * [func NaN() float64](#NaN)
    * [func Nextafter(x, y float64) (r float64)](#Nextafter)
    * [func Nextafter32(x, y float32) (r float32)](#Nextafter32)
    * [func Pow(x, y float64) float64](#Pow)
    * [func Pow10(n int) float64](#Pow10)
    * [func Remainder(x, y float64) float64](#Remainder)
    * [func Round(x float64) float64](#Round)
    * [func RoundToEven(x float64) float64](#RoundToEven)
    * [func Signbit(x float64) bool](#Signbit)
    * [func Sin(x float64) float64](#Sin)
    * [func Sincos(x float64) (sin, cos float64)](#Sincos)
    * [func Sinh(x float64) float64](#Sinh)
    * [func Sqrt(x float64) float64](#Sqrt)
    * [func Tan(x float64) float64](#Tan)
    * [func Tanh(x float64) float64](#Tanh)
    * [func Trunc(x float64) float64](#Trunc)
    * [func Y0(x float64) float64](#Y0)
    * [func Y1(x float64) float64](#Y1)
    * [func Yn(n int, x float64) float64](#Yn)
    * [func acos(x float64) float64](#acos)
    * [func acosh(x float64) float64](#acosh)
    * [func archAcos(x float64) float64](#archAcos)
    * [func archAcosh(x float64) float64](#archAcosh)
    * [func archAsin(x float64) float64](#archAsin)
    * [func archAsinh(x float64) float64](#archAsinh)
    * [func archAtan(x float64) float64](#archAtan)
    * [func archAtan2(y, x float64) float64](#archAtan2)
    * [func archAtanh(x float64) float64](#archAtanh)
    * [func archCbrt(x float64) float64](#archCbrt)
    * [func archCeil(x float64) float64](#archCeil)
    * [func archCos(x float64) float64](#archCos)
    * [func archCosh(x float64) float64](#archCosh)
    * [func archErf(x float64) float64](#archErf)
    * [func archErfc(x float64) float64](#archErfc)
    * [func archExp(x float64) float64](#archExp)
    * [func archExp2(x float64) float64](#archExp2)
    * [func archExpm1(x float64) float64](#archExpm1)
    * [func archFloor(x float64) float64](#archFloor)
    * [func archFrexp(x float64) (float64, int)](#archFrexp)
    * [func archHypot(p, q float64) float64](#archHypot)
    * [func archLdexp(frac float64, exp int) float64](#archLdexp)
    * [func archLog(x float64) float64](#archLog)
    * [func archLog10(x float64) float64](#archLog10)
    * [func archLog1p(x float64) float64](#archLog1p)
    * [func archLog2(x float64) float64](#archLog2)
    * [func archMax(x, y float64) float64](#archMax)
    * [func archMin(x, y float64) float64](#archMin)
    * [func archMod(x, y float64) float64](#archMod)
    * [func archModf(f float64) (int float64, frac float64)](#archModf)
    * [func archPow(x, y float64) float64](#archPow)
    * [func archRemainder(x, y float64) float64](#archRemainder)
    * [func archSin(x float64) float64](#archSin)
    * [func archSinh(x float64) float64](#archSinh)
    * [func archSqrt(x float64) float64](#archSqrt)
    * [func archTan(x float64) float64](#archTan)
    * [func archTanh(x float64) float64](#archTanh)
    * [func archTrunc(x float64) float64](#archTrunc)
    * [func asin(x float64) float64](#asin)
    * [func asinh(x float64) float64](#asinh)
    * [func atan(x float64) float64](#atan)
    * [func atan2(y, x float64) float64](#atan2)
    * [func atanh(x float64) float64](#atanh)
    * [func cbrt(x float64) float64](#cbrt)
    * [func ceil(x float64) float64](#ceil)
    * [func cos(x float64) float64](#cos)
    * [func cosh(x float64) float64](#cosh)
    * [func erf(x float64) float64](#erf)
    * [func erfc(x float64) float64](#erfc)
    * [func exp(x float64) float64](#exp)
    * [func exp2(x float64) float64](#exp2)
    * [func expm1(x float64) float64](#expm1)
    * [func expmulti(hi, lo float64, k int) float64](#expmulti)
    * [func floor(x float64) float64](#floor)
    * [func frexp(f float64) (frac float64, exp int)](#frexp)
    * [func hypot(p, q float64) float64](#hypot)
    * [func ilogb(x float64) int](#ilogb)
    * [func isNegInt(x float64) bool](#isNegInt)
    * [func isOddInt(x float64) bool](#isOddInt)
    * [func ldexp(frac float64, exp int) float64](#ldexp)
    * [func log(x float64) float64](#log)
    * [func log10(x float64) float64](#log10)
    * [func log1p(x float64) float64](#log1p)
    * [func log2(x float64) float64](#log2)
    * [func lz(u1, u2 uint64) (l int32)](#lz)
    * [func max(x, y float64) float64](#max)
    * [func min(x, y float64) float64](#min)
    * [func mod(x, y float64) float64](#mod)
    * [func modf(f float64) (int float64, frac float64)](#modf)
    * [func nonzero(x uint64) uint64](#nonzero)
    * [func normalize(x float64) (y float64, exp int)](#normalize)
    * [func pone(x float64) float64](#pone)
    * [func pow(x, y float64) float64](#pow)
    * [func pzero(x float64) float64](#pzero)
    * [func qone(x float64) float64](#qone)
    * [func qzero(x float64) float64](#qzero)
    * [func remainder(x, y float64) float64](#remainder)
    * [func satan(x float64) float64](#satan)
    * [func shl(u1, u2 uint64, n uint) (r1, r2 uint64)](#shl)
    * [func shr(u1, u2 uint64, n uint) (r1, r2 uint64)](#shr)
    * [func shrcompress(u1, u2 uint64, n uint) (r1, r2 uint64)](#shrcompress)
    * [func sin(x float64) float64](#sin)
    * [func sinPi(x float64) float64](#sinPi)
    * [func sinh(x float64) float64](#sinh)
    * [func split(b uint64) (sign uint32, exp int32, mantissa uint64)](#split)
    * [func sqrt(x float64) float64](#sqrt)
    * [func stirling(x float64) (float64, float64)](#stirling)
    * [func tan(x float64) float64](#tan)
    * [func tanh(x float64) float64](#tanh)
    * [func trigReduce(x float64) (j uint64, z float64)](#trigReduce)
    * [func trunc(x float64) float64](#trunc)
    * [func xatan(x float64) float64](#xatan)
    * [func zero(x uint64) uint64](#zero)


## <a id="const" href="#const">Constants</a>

### <a id="E" href="#E">const E</a>

```
searchKey: math.E
tags: [constant number]
```

```Go
const E // https://oeis.org/A001113
 = ...
```

Mathematical constants. 

### <a id="Ln10" href="#Ln10">const Ln10</a>

```
searchKey: math.Ln10
tags: [constant number]
```

```Go
const Ln10 // https://oeis.org/A002392
 = ...
```

Mathematical constants. 

### <a id="Ln2" href="#Ln2">const Ln2</a>

```
searchKey: math.Ln2
tags: [constant number]
```

```Go
const Ln2 // https://oeis.org/A002162
 = ...
```

Mathematical constants. 

### <a id="Log10E" href="#Log10E">const Log10E</a>

```
searchKey: math.Log10E
tags: [constant number]
```

```Go
const Log10E = 1 / Ln10
```

Mathematical constants. 

### <a id="Log2E" href="#Log2E">const Log2E</a>

```
searchKey: math.Log2E
tags: [constant number]
```

```Go
const Log2E = 1 / Ln2
```

Mathematical constants. 

### <a id="MaxFloat32" href="#MaxFloat32">const MaxFloat32</a>

```
searchKey: math.MaxFloat32
tags: [constant number]
```

```Go
const MaxFloat32 = 0x1p127 * (1 + (1 - 0x1p-23)) // 3.40282346638528859811704183484516925440e+38

```

Floating-point limit values. Max is the largest finite value representable by the type. SmallestNonzero is the smallest positive, non-zero value representable by the type. 

### <a id="MaxFloat64" href="#MaxFloat64">const MaxFloat64</a>

```
searchKey: math.MaxFloat64
tags: [constant number]
```

```Go
const MaxFloat64 // 1.79769313486231570814527423731704356798070e+308
 = ...
```

Floating-point limit values. Max is the largest finite value representable by the type. SmallestNonzero is the smallest positive, non-zero value representable by the type. 

### <a id="MaxInt" href="#MaxInt">const MaxInt</a>

```
searchKey: math.MaxInt
tags: [constant number]
```

```Go
const MaxInt = 1<<(intSize-1) - 1
```

Integer limit values. 

### <a id="MaxInt16" href="#MaxInt16">const MaxInt16</a>

```
searchKey: math.MaxInt16
tags: [constant number]
```

```Go
const MaxInt16 = 1<<15 - 1
```

Integer limit values. 

### <a id="MaxInt32" href="#MaxInt32">const MaxInt32</a>

```
searchKey: math.MaxInt32
tags: [constant number]
```

```Go
const MaxInt32 = 1<<31 - 1
```

Integer limit values. 

### <a id="MaxInt64" href="#MaxInt64">const MaxInt64</a>

```
searchKey: math.MaxInt64
tags: [constant number]
```

```Go
const MaxInt64 = 1<<63 - 1
```

Integer limit values. 

### <a id="MaxInt8" href="#MaxInt8">const MaxInt8</a>

```
searchKey: math.MaxInt8
tags: [constant number]
```

```Go
const MaxInt8 = 1<<7 - 1
```

Integer limit values. 

### <a id="MaxUint" href="#MaxUint">const MaxUint</a>

```
searchKey: math.MaxUint
tags: [constant number]
```

```Go
const MaxUint = 1<<intSize - 1
```

Integer limit values. 

### <a id="MaxUint16" href="#MaxUint16">const MaxUint16</a>

```
searchKey: math.MaxUint16
tags: [constant number]
```

```Go
const MaxUint16 = 1<<16 - 1
```

Integer limit values. 

### <a id="MaxUint32" href="#MaxUint32">const MaxUint32</a>

```
searchKey: math.MaxUint32
tags: [constant number]
```

```Go
const MaxUint32 = 1<<32 - 1
```

Integer limit values. 

### <a id="MaxUint64" href="#MaxUint64">const MaxUint64</a>

```
searchKey: math.MaxUint64
tags: [constant number]
```

```Go
const MaxUint64 = 1<<64 - 1
```

Integer limit values. 

### <a id="MaxUint8" href="#MaxUint8">const MaxUint8</a>

```
searchKey: math.MaxUint8
tags: [constant number]
```

```Go
const MaxUint8 = 1<<8 - 1
```

Integer limit values. 

### <a id="MinInt" href="#MinInt">const MinInt</a>

```
searchKey: math.MinInt
tags: [constant number]
```

```Go
const MinInt = -1 << (intSize - 1)
```

Integer limit values. 

### <a id="MinInt16" href="#MinInt16">const MinInt16</a>

```
searchKey: math.MinInt16
tags: [constant number]
```

```Go
const MinInt16 = -1 << 15
```

Integer limit values. 

### <a id="MinInt32" href="#MinInt32">const MinInt32</a>

```
searchKey: math.MinInt32
tags: [constant number]
```

```Go
const MinInt32 = -1 << 31
```

Integer limit values. 

### <a id="MinInt64" href="#MinInt64">const MinInt64</a>

```
searchKey: math.MinInt64
tags: [constant number]
```

```Go
const MinInt64 = -1 << 63
```

Integer limit values. 

### <a id="MinInt8" href="#MinInt8">const MinInt8</a>

```
searchKey: math.MinInt8
tags: [constant number]
```

```Go
const MinInt8 = -1 << 7
```

Integer limit values. 

### <a id="Phi" href="#Phi">const Phi</a>

```
searchKey: math.Phi
tags: [constant number]
```

```Go
const Phi // https://oeis.org/A001622
 = ...
```

Mathematical constants. 

### <a id="Pi" href="#Pi">const Pi</a>

```
searchKey: math.Pi
tags: [constant number]
```

```Go
const Pi // https://oeis.org/A000796
 = ...
```

Mathematical constants. 

### <a id="ReduceThreshold" href="#ReduceThreshold">const ReduceThreshold</a>

```
searchKey: math.ReduceThreshold
tags: [constant number private]
```

```Go
const ReduceThreshold = reduceThreshold
```

### <a id="SmallestNonzeroFloat32" href="#SmallestNonzeroFloat32">const SmallestNonzeroFloat32</a>

```
searchKey: math.SmallestNonzeroFloat32
tags: [constant number]
```

```Go
const SmallestNonzeroFloat32 = 0x1p-126 * 0x1p-23 // 1.401298464324817070923729583289916131280e-45

```

Floating-point limit values. Max is the largest finite value representable by the type. SmallestNonzero is the smallest positive, non-zero value representable by the type. 

### <a id="SmallestNonzeroFloat64" href="#SmallestNonzeroFloat64">const SmallestNonzeroFloat64</a>

```
searchKey: math.SmallestNonzeroFloat64
tags: [constant number]
```

```Go
const SmallestNonzeroFloat64 // 4.9406564584124654417656879286822137236505980e-324
 = ...
```

Floating-point limit values. Max is the largest finite value representable by the type. SmallestNonzero is the smallest positive, non-zero value representable by the type. 

### <a id="Sqrt2" href="#Sqrt2">const Sqrt2</a>

```
searchKey: math.Sqrt2
tags: [constant number]
```

```Go
const Sqrt2 // https://oeis.org/A002193
 = ...
```

Mathematical constants. 

### <a id="SqrtE" href="#SqrtE">const SqrtE</a>

```
searchKey: math.SqrtE
tags: [constant number]
```

```Go
const SqrtE // https://oeis.org/A019774
 = ...
```

Mathematical constants. 

### <a id="SqrtPhi" href="#SqrtPhi">const SqrtPhi</a>

```
searchKey: math.SqrtPhi
tags: [constant number]
```

```Go
const SqrtPhi // https://oeis.org/A139339
 = ...
```

Mathematical constants. 

### <a id="SqrtPi" href="#SqrtPi">const SqrtPi</a>

```
searchKey: math.SqrtPi
tags: [constant number]
```

```Go
const SqrtPi // https://oeis.org/A002161
 = ...
```

Mathematical constants. 

### <a id="a0" href="#a0">const a0</a>

```
searchKey: math.a0
tags: [constant number private]
```

```Go
const a0 = 1.1975323115670912564578e0
```

Coefficients for approximation to erf in |x| <= 0.85 

### <a id="a1" href="#a1">const a1</a>

```
searchKey: math.a1
tags: [constant number private]
```

```Go
const a1 = 4.7072688112383978012285e1
```

### <a id="a2" href="#a2">const a2</a>

```
searchKey: math.a2
tags: [constant number private]
```

```Go
const a2 = 6.9706266534389598238465e2
```

### <a id="a3" href="#a3">const a3</a>

```
searchKey: math.a3
tags: [constant number private]
```

```Go
const a3 = 4.8548868893843886794648e3
```

### <a id="a4" href="#a4">const a4</a>

```
searchKey: math.a4
tags: [constant number private]
```

```Go
const a4 = 1.6235862515167575384252e4
```

### <a id="a5" href="#a5">const a5</a>

```
searchKey: math.a5
tags: [constant number private]
```

```Go
const a5 = 2.3782041382114385731252e4
```

### <a id="a6" href="#a6">const a6</a>

```
searchKey: math.a6
tags: [constant number private]
```

```Go
const a6 = 1.1819493347062294404278e4
```

### <a id="a7" href="#a7">const a7</a>

```
searchKey: math.a7
tags: [constant number private]
```

```Go
const a7 = 8.8709406962545514830200e2
```

### <a id="b0" href="#b0">const b0</a>

```
searchKey: math.b0
tags: [constant number private]
```

```Go
const b0 = 1.0000000000000000000e0
```

### <a id="b1" href="#b1">const b1</a>

```
searchKey: math.b1
tags: [constant number private]
```

```Go
const b1 = 4.2313330701600911252e1
```

### <a id="b2" href="#b2">const b2</a>

```
searchKey: math.b2
tags: [constant number private]
```

```Go
const b2 = 6.8718700749205790830e2
```

### <a id="b3" href="#b3">const b3</a>

```
searchKey: math.b3
tags: [constant number private]
```

```Go
const b3 = 5.3941960214247511077e3
```

### <a id="b4" href="#b4">const b4</a>

```
searchKey: math.b4
tags: [constant number private]
```

```Go
const b4 = 2.1213794301586595867e4
```

### <a id="b5" href="#b5">const b5</a>

```
searchKey: math.b5
tags: [constant number private]
```

```Go
const b5 = 3.9307895800092710610e4
```

### <a id="b6" href="#b6">const b6</a>

```
searchKey: math.b6
tags: [constant number private]
```

```Go
const b6 = 2.8729085735721942674e4
```

### <a id="b7" href="#b7">const b7</a>

```
searchKey: math.b7
tags: [constant number private]
```

```Go
const b7 = 5.2264952788528545610e3
```

### <a id="bias" href="#bias">const bias</a>

```
searchKey: math.bias
tags: [constant number private]
```

```Go
const bias = 1023
```

### <a id="c0" href="#c0">const c0</a>

```
searchKey: math.c0
tags: [constant number private]
```

```Go
const c0 = 1.42343711074968357734e0
```

Coefficients for approximation to erf in 0.85 < |x| <= 1-2*exp(-25) 

### <a id="c1" href="#c1">const c1</a>

```
searchKey: math.c1
tags: [constant number private]
```

```Go
const c1 = 4.63033784615654529590e0
```

### <a id="c2" href="#c2">const c2</a>

```
searchKey: math.c2
tags: [constant number private]
```

```Go
const c2 = 5.76949722146069140550e0
```

### <a id="c3" href="#c3">const c3</a>

```
searchKey: math.c3
tags: [constant number private]
```

```Go
const c3 = 3.64784832476320460504e0
```

### <a id="c4" href="#c4">const c4</a>

```
searchKey: math.c4
tags: [constant number private]
```

```Go
const c4 = 1.27045825245236838258e0
```

### <a id="c5" href="#c5">const c5</a>

```
searchKey: math.c5
tags: [constant number private]
```

```Go
const c5 = 2.41780725177450611770e-1
```

### <a id="c6" href="#c6">const c6</a>

```
searchKey: math.c6
tags: [constant number private]
```

```Go
const c6 = 2.27238449892691845833e-2
```

### <a id="c7" href="#c7">const c7</a>

```
searchKey: math.c7
tags: [constant number private]
```

```Go
const c7 = 7.74545014278341407640e-4
```

### <a id="d0" href="#d0">const d0</a>

```
searchKey: math.d0
tags: [constant number private]
```

```Go
const d0 = 1.4142135623730950488016887e0
```

### <a id="d1" href="#d1">const d1</a>

```
searchKey: math.d1
tags: [constant number private]
```

```Go
const d1 = 2.9036514445419946173133295e0
```

### <a id="d2" href="#d2">const d2</a>

```
searchKey: math.d2
tags: [constant number private]
```

```Go
const d2 = 2.3707661626024532365971225e0
```

### <a id="d3" href="#d3">const d3</a>

```
searchKey: math.d3
tags: [constant number private]
```

```Go
const d3 = 9.7547832001787427186894837e-1
```

### <a id="d4" href="#d4">const d4</a>

```
searchKey: math.d4
tags: [constant number private]
```

```Go
const d4 = 2.0945065210512749128288442e-1
```

### <a id="d5" href="#d5">const d5</a>

```
searchKey: math.d5
tags: [constant number private]
```

```Go
const d5 = 2.1494160384252876777097297e-2
```

### <a id="d6" href="#d6">const d6</a>

```
searchKey: math.d6
tags: [constant number private]
```

```Go
const d6 = 7.7441459065157709165577218e-4
```

### <a id="d7" href="#d7">const d7</a>

```
searchKey: math.d7
tags: [constant number private]
```

```Go
const d7 = 1.4859850019840355905497876e-9
```

### <a id="e0" href="#e0">const e0</a>

```
searchKey: math.e0
tags: [constant number private]
```

```Go
const e0 = 6.65790464350110377720e0
```

Coefficients for approximation to erf in 1-2*exp(-25) < |x| < 1 

### <a id="e1" href="#e1">const e1</a>

```
searchKey: math.e1
tags: [constant number private]
```

```Go
const e1 = 5.46378491116411436990e0
```

### <a id="e2" href="#e2">const e2</a>

```
searchKey: math.e2
tags: [constant number private]
```

```Go
const e2 = 1.78482653991729133580e0
```

### <a id="e3" href="#e3">const e3</a>

```
searchKey: math.e3
tags: [constant number private]
```

```Go
const e3 = 2.96560571828504891230e-1
```

### <a id="e4" href="#e4">const e4</a>

```
searchKey: math.e4
tags: [constant number private]
```

```Go
const e4 = 2.65321895265761230930e-2
```

### <a id="e5" href="#e5">const e5</a>

```
searchKey: math.e5
tags: [constant number private]
```

```Go
const e5 = 1.24266094738807843860e-3
```

### <a id="e6" href="#e6">const e6</a>

```
searchKey: math.e6
tags: [constant number private]
```

```Go
const e6 = 2.71155556874348757815e-5
```

### <a id="e7" href="#e7">const e7</a>

```
searchKey: math.e7
tags: [constant number private]
```

```Go
const e7 = 2.01033439929228813265e-7
```

### <a id="efx" href="#efx">const efx</a>

```
searchKey: math.efx
tags: [constant number private]
```

```Go
const efx = 1.28379167095512586316e-01 // 0x3FC06EBA8214DB69

```

Coefficients for approximation to  erf in [0, 0.84375] 

### <a id="efx8" href="#efx8">const efx8</a>

```
searchKey: math.efx8
tags: [constant number private]
```

```Go
const efx8 = 1.02703333676410069053e+00 // 0x3FF06EBA8214DB69

```

### <a id="erx" href="#erx">const erx</a>

```
searchKey: math.erx
tags: [constant number private]
```

```Go
const erx = 8.45062911510467529297e-01 // 0x3FEB0AC160000000

```

### <a id="f0" href="#f0">const f0</a>

```
searchKey: math.f0
tags: [constant number private]
```

```Go
const f0 = 1.414213562373095048801689e0
```

### <a id="f1" href="#f1">const f1</a>

```
searchKey: math.f1
tags: [constant number private]
```

```Go
const f1 = 8.482908416595164588112026e-1
```

### <a id="f2" href="#f2">const f2</a>

```
searchKey: math.f2
tags: [constant number private]
```

```Go
const f2 = 1.936480946950659106176712e-1
```

### <a id="f3" href="#f3">const f3</a>

```
searchKey: math.f3
tags: [constant number private]
```

```Go
const f3 = 2.103693768272068968719679e-2
```

### <a id="f4" href="#f4">const f4</a>

```
searchKey: math.f4
tags: [constant number private]
```

```Go
const f4 = 1.112800997078859844711555e-3
```

### <a id="f5" href="#f5">const f5</a>

```
searchKey: math.f5
tags: [constant number private]
```

```Go
const f5 = 2.611088405080593625138020e-5
```

### <a id="f6" href="#f6">const f6</a>

```
searchKey: math.f6
tags: [constant number private]
```

```Go
const f6 = 2.010321207683943062279931e-7
```

### <a id="f7" href="#f7">const f7</a>

```
searchKey: math.f7
tags: [constant number private]
```

```Go
const f7 = 2.891024605872965461538222e-15
```

### <a id="fracMask" href="#fracMask">const fracMask</a>

```
searchKey: math.fracMask
tags: [constant number private]
```

```Go
const fracMask = 1<<shift - 1
```

### <a id="haveArchAcos" href="#haveArchAcos">const haveArchAcos</a>

```
searchKey: math.haveArchAcos
tags: [constant boolean private]
```

```Go
const haveArchAcos = false
```

### <a id="haveArchAcosh" href="#haveArchAcosh">const haveArchAcosh</a>

```
searchKey: math.haveArchAcosh
tags: [constant boolean private]
```

```Go
const haveArchAcosh = false
```

### <a id="haveArchAsin" href="#haveArchAsin">const haveArchAsin</a>

```
searchKey: math.haveArchAsin
tags: [constant boolean private]
```

```Go
const haveArchAsin = false
```

### <a id="haveArchAsinh" href="#haveArchAsinh">const haveArchAsinh</a>

```
searchKey: math.haveArchAsinh
tags: [constant boolean private]
```

```Go
const haveArchAsinh = false
```

### <a id="haveArchAtan" href="#haveArchAtan">const haveArchAtan</a>

```
searchKey: math.haveArchAtan
tags: [constant boolean private]
```

```Go
const haveArchAtan = false
```

### <a id="haveArchAtan2" href="#haveArchAtan2">const haveArchAtan2</a>

```
searchKey: math.haveArchAtan2
tags: [constant boolean private]
```

```Go
const haveArchAtan2 = false
```

### <a id="haveArchAtanh" href="#haveArchAtanh">const haveArchAtanh</a>

```
searchKey: math.haveArchAtanh
tags: [constant boolean private]
```

```Go
const haveArchAtanh = false
```

### <a id="haveArchCbrt" href="#haveArchCbrt">const haveArchCbrt</a>

```
searchKey: math.haveArchCbrt
tags: [constant boolean private]
```

```Go
const haveArchCbrt = false
```

### <a id="haveArchCeil" href="#haveArchCeil">const haveArchCeil</a>

```
searchKey: math.haveArchCeil
tags: [constant boolean private]
```

```Go
const haveArchCeil = true
```

### <a id="haveArchCos" href="#haveArchCos">const haveArchCos</a>

```
searchKey: math.haveArchCos
tags: [constant boolean private]
```

```Go
const haveArchCos = false
```

### <a id="haveArchCosh" href="#haveArchCosh">const haveArchCosh</a>

```
searchKey: math.haveArchCosh
tags: [constant boolean private]
```

```Go
const haveArchCosh = false
```

### <a id="haveArchErf" href="#haveArchErf">const haveArchErf</a>

```
searchKey: math.haveArchErf
tags: [constant boolean private]
```

```Go
const haveArchErf = false
```

### <a id="haveArchErfc" href="#haveArchErfc">const haveArchErfc</a>

```
searchKey: math.haveArchErfc
tags: [constant boolean private]
```

```Go
const haveArchErfc = false
```

### <a id="haveArchExp" href="#haveArchExp">const haveArchExp</a>

```
searchKey: math.haveArchExp
tags: [constant boolean private]
```

```Go
const haveArchExp = true
```

### <a id="haveArchExp2" href="#haveArchExp2">const haveArchExp2</a>

```
searchKey: math.haveArchExp2
tags: [constant boolean private]
```

```Go
const haveArchExp2 = false
```

### <a id="haveArchExpm1" href="#haveArchExpm1">const haveArchExpm1</a>

```
searchKey: math.haveArchExpm1
tags: [constant boolean private]
```

```Go
const haveArchExpm1 = false
```

### <a id="haveArchFloor" href="#haveArchFloor">const haveArchFloor</a>

```
searchKey: math.haveArchFloor
tags: [constant boolean private]
```

```Go
const haveArchFloor = true
```

### <a id="haveArchFrexp" href="#haveArchFrexp">const haveArchFrexp</a>

```
searchKey: math.haveArchFrexp
tags: [constant boolean private]
```

```Go
const haveArchFrexp = false
```

### <a id="haveArchHypot" href="#haveArchHypot">const haveArchHypot</a>

```
searchKey: math.haveArchHypot
tags: [constant boolean private]
```

```Go
const haveArchHypot = true
```

### <a id="haveArchLdexp" href="#haveArchLdexp">const haveArchLdexp</a>

```
searchKey: math.haveArchLdexp
tags: [constant boolean private]
```

```Go
const haveArchLdexp = false
```

### <a id="haveArchLog" href="#haveArchLog">const haveArchLog</a>

```
searchKey: math.haveArchLog
tags: [constant boolean private]
```

```Go
const haveArchLog = true
```

### <a id="haveArchLog10" href="#haveArchLog10">const haveArchLog10</a>

```
searchKey: math.haveArchLog10
tags: [constant boolean private]
```

```Go
const haveArchLog10 = false
```

### <a id="haveArchLog1p" href="#haveArchLog1p">const haveArchLog1p</a>

```
searchKey: math.haveArchLog1p
tags: [constant boolean private]
```

```Go
const haveArchLog1p = false
```

### <a id="haveArchLog2" href="#haveArchLog2">const haveArchLog2</a>

```
searchKey: math.haveArchLog2
tags: [constant boolean private]
```

```Go
const haveArchLog2 = false
```

### <a id="haveArchMax" href="#haveArchMax">const haveArchMax</a>

```
searchKey: math.haveArchMax
tags: [constant boolean private]
```

```Go
const haveArchMax = true
```

### <a id="haveArchMin" href="#haveArchMin">const haveArchMin</a>

```
searchKey: math.haveArchMin
tags: [constant boolean private]
```

```Go
const haveArchMin = true
```

### <a id="haveArchMod" href="#haveArchMod">const haveArchMod</a>

```
searchKey: math.haveArchMod
tags: [constant boolean private]
```

```Go
const haveArchMod = false
```

### <a id="haveArchModf" href="#haveArchModf">const haveArchModf</a>

```
searchKey: math.haveArchModf
tags: [constant boolean private]
```

```Go
const haveArchModf = false
```

### <a id="haveArchPow" href="#haveArchPow">const haveArchPow</a>

```
searchKey: math.haveArchPow
tags: [constant boolean private]
```

```Go
const haveArchPow = false
```

### <a id="haveArchRemainder" href="#haveArchRemainder">const haveArchRemainder</a>

```
searchKey: math.haveArchRemainder
tags: [constant boolean private]
```

```Go
const haveArchRemainder = false
```

### <a id="haveArchSin" href="#haveArchSin">const haveArchSin</a>

```
searchKey: math.haveArchSin
tags: [constant boolean private]
```

```Go
const haveArchSin = false
```

### <a id="haveArchSinh" href="#haveArchSinh">const haveArchSinh</a>

```
searchKey: math.haveArchSinh
tags: [constant boolean private]
```

```Go
const haveArchSinh = false
```

### <a id="haveArchSqrt" href="#haveArchSqrt">const haveArchSqrt</a>

```
searchKey: math.haveArchSqrt
tags: [constant boolean private]
```

```Go
const haveArchSqrt = true
```

### <a id="haveArchTan" href="#haveArchTan">const haveArchTan</a>

```
searchKey: math.haveArchTan
tags: [constant boolean private]
```

```Go
const haveArchTan = false
```

### <a id="haveArchTanh" href="#haveArchTanh">const haveArchTanh</a>

```
searchKey: math.haveArchTanh
tags: [constant boolean private]
```

```Go
const haveArchTanh = false
```

### <a id="haveArchTrunc" href="#haveArchTrunc">const haveArchTrunc</a>

```
searchKey: math.haveArchTrunc
tags: [constant boolean private]
```

```Go
const haveArchTrunc = true
```

### <a id="intSize" href="#intSize">const intSize</a>

```
searchKey: math.intSize
tags: [constant number private]
```

```Go
const intSize = 32 << (^uint(0) >> 63) // 32 or 64

```

Integer limit values. 

### <a id="mask" href="#mask">const mask</a>

```
searchKey: math.mask
tags: [constant number private]
```

```Go
const mask = 0x7FF
```

### <a id="pa0" href="#pa0">const pa0</a>

```
searchKey: math.pa0
tags: [constant number private]
```

```Go
const pa0 = -2.36211856075265944077e-03 // 0xBF6359B8BEF77538

```

Coefficients for approximation to  erf  in [0.84375, 1.25] 

### <a id="pa1" href="#pa1">const pa1</a>

```
searchKey: math.pa1
tags: [constant number private]
```

```Go
const pa1 = 4.14856118683748331666e-01 // 0x3FDA8D00AD92B34D

```

### <a id="pa2" href="#pa2">const pa2</a>

```
searchKey: math.pa2
tags: [constant number private]
```

```Go
const pa2 = -3.72207876035701323847e-01 // 0xBFD7D240FBB8C3F1

```

### <a id="pa3" href="#pa3">const pa3</a>

```
searchKey: math.pa3
tags: [constant number private]
```

```Go
const pa3 = 3.18346619901161753674e-01 // 0x3FD45FCA805120E4

```

### <a id="pa4" href="#pa4">const pa4</a>

```
searchKey: math.pa4
tags: [constant number private]
```

```Go
const pa4 = -1.10894694282396677476e-01 // 0xBFBC63983D3E28EC

```

### <a id="pa5" href="#pa5">const pa5</a>

```
searchKey: math.pa5
tags: [constant number private]
```

```Go
const pa5 = 3.54783043256182359371e-02 // 0x3FA22A36599795EB

```

### <a id="pa6" href="#pa6">const pa6</a>

```
searchKey: math.pa6
tags: [constant number private]
```

```Go
const pa6 = -2.16637559486879084300e-03 // 0xBF61BF380A96073F

```

### <a id="pp0" href="#pp0">const pp0</a>

```
searchKey: math.pp0
tags: [constant number private]
```

```Go
const pp0 = 1.28379167095512558561e-01 // 0x3FC06EBA8214DB68

```

### <a id="pp1" href="#pp1">const pp1</a>

```
searchKey: math.pp1
tags: [constant number private]
```

```Go
const pp1 = -3.25042107247001499370e-01 // 0xBFD4CD7D691CB913

```

### <a id="pp2" href="#pp2">const pp2</a>

```
searchKey: math.pp2
tags: [constant number private]
```

```Go
const pp2 = -2.84817495755985104766e-02 // 0xBF9D2A51DBD7194F

```

### <a id="pp3" href="#pp3">const pp3</a>

```
searchKey: math.pp3
tags: [constant number private]
```

```Go
const pp3 = -5.77027029648944159157e-03 // 0xBF77A291236668E4

```

### <a id="pp4" href="#pp4">const pp4</a>

```
searchKey: math.pp4
tags: [constant number private]
```

```Go
const pp4 = -2.37630166566501626084e-05 // 0xBEF8EAD6120016AC

```

### <a id="qa1" href="#qa1">const qa1</a>

```
searchKey: math.qa1
tags: [constant number private]
```

```Go
const qa1 = 1.06420880400844228286e-01 // 0x3FBB3E6618EEE323

```

### <a id="qa2" href="#qa2">const qa2</a>

```
searchKey: math.qa2
tags: [constant number private]
```

```Go
const qa2 = 5.40397917702171048937e-01 // 0x3FE14AF092EB6F33

```

### <a id="qa3" href="#qa3">const qa3</a>

```
searchKey: math.qa3
tags: [constant number private]
```

```Go
const qa3 = 7.18286544141962662868e-02 // 0x3FB2635CD99FE9A7

```

### <a id="qa4" href="#qa4">const qa4</a>

```
searchKey: math.qa4
tags: [constant number private]
```

```Go
const qa4 = 1.26171219808761642112e-01 // 0x3FC02660E763351F

```

### <a id="qa5" href="#qa5">const qa5</a>

```
searchKey: math.qa5
tags: [constant number private]
```

```Go
const qa5 = 1.36370839120290507362e-02 // 0x3F8BEDC26B51DD1C

```

### <a id="qa6" href="#qa6">const qa6</a>

```
searchKey: math.qa6
tags: [constant number private]
```

```Go
const qa6 = 1.19844998467991074170e-02 // 0x3F888B545735151D

```

### <a id="qq1" href="#qq1">const qq1</a>

```
searchKey: math.qq1
tags: [constant number private]
```

```Go
const qq1 = 3.97917223959155352819e-01 // 0x3FD97779CDDADC09

```

### <a id="qq2" href="#qq2">const qq2</a>

```
searchKey: math.qq2
tags: [constant number private]
```

```Go
const qq2 = 6.50222499887672944485e-02 // 0x3FB0A54C5536CEBA

```

### <a id="qq3" href="#qq3">const qq3</a>

```
searchKey: math.qq3
tags: [constant number private]
```

```Go
const qq3 = 5.08130628187576562776e-03 // 0x3F74D022C4D36B0F

```

### <a id="qq4" href="#qq4">const qq4</a>

```
searchKey: math.qq4
tags: [constant number private]
```

```Go
const qq4 = 1.32494738004321644526e-04 // 0x3F215DC9221C1A10

```

### <a id="qq5" href="#qq5">const qq5</a>

```
searchKey: math.qq5
tags: [constant number private]
```

```Go
const qq5 = -3.96022827877536812320e-06 // 0xBED09C4342A26120

```

### <a id="ra0" href="#ra0">const ra0</a>

```
searchKey: math.ra0
tags: [constant number private]
```

```Go
const ra0 = -9.86494403484714822705e-03 // 0xBF843412600D6435

```

Coefficients for approximation to  erfc in [1.25, 1/0.35] 

### <a id="ra1" href="#ra1">const ra1</a>

```
searchKey: math.ra1
tags: [constant number private]
```

```Go
const ra1 = -6.93858572707181764372e-01 // 0xBFE63416E4BA7360

```

### <a id="ra2" href="#ra2">const ra2</a>

```
searchKey: math.ra2
tags: [constant number private]
```

```Go
const ra2 = -1.05586262253232909814e+01 // 0xC0251E0441B0E726

```

### <a id="ra3" href="#ra3">const ra3</a>

```
searchKey: math.ra3
tags: [constant number private]
```

```Go
const ra3 = -6.23753324503260060396e+01 // 0xC04F300AE4CBA38D

```

### <a id="ra4" href="#ra4">const ra4</a>

```
searchKey: math.ra4
tags: [constant number private]
```

```Go
const ra4 = -1.62396669462573470355e+02 // 0xC0644CB184282266

```

### <a id="ra5" href="#ra5">const ra5</a>

```
searchKey: math.ra5
tags: [constant number private]
```

```Go
const ra5 = -1.84605092906711035994e+02 // 0xC067135CEBCCABB2

```

### <a id="ra6" href="#ra6">const ra6</a>

```
searchKey: math.ra6
tags: [constant number private]
```

```Go
const ra6 = -8.12874355063065934246e+01 // 0xC054526557E4D2F2

```

### <a id="ra7" href="#ra7">const ra7</a>

```
searchKey: math.ra7
tags: [constant number private]
```

```Go
const ra7 = -9.81432934416914548592e+00 // 0xC023A0EFC69AC25C

```

### <a id="rb0" href="#rb0">const rb0</a>

```
searchKey: math.rb0
tags: [constant number private]
```

```Go
const rb0 = -9.86494292470009928597e-03 // 0xBF84341239E86F4A

```

Coefficients for approximation to  erfc in [1/.35, 28] 

### <a id="rb1" href="#rb1">const rb1</a>

```
searchKey: math.rb1
tags: [constant number private]
```

```Go
const rb1 = -7.99283237680523006574e-01 // 0xBFE993BA70C285DE

```

### <a id="rb2" href="#rb2">const rb2</a>

```
searchKey: math.rb2
tags: [constant number private]
```

```Go
const rb2 = -1.77579549177547519889e+01 // 0xC031C209555F995A

```

### <a id="rb3" href="#rb3">const rb3</a>

```
searchKey: math.rb3
tags: [constant number private]
```

```Go
const rb3 = -1.60636384855821916062e+02 // 0xC064145D43C5ED98

```

### <a id="rb4" href="#rb4">const rb4</a>

```
searchKey: math.rb4
tags: [constant number private]
```

```Go
const rb4 = -6.37566443368389627722e+02 // 0xC083EC881375F228

```

### <a id="rb5" href="#rb5">const rb5</a>

```
searchKey: math.rb5
tags: [constant number private]
```

```Go
const rb5 = -1.02509513161107724954e+03 // 0xC09004616A2E5992

```

### <a id="rb6" href="#rb6">const rb6</a>

```
searchKey: math.rb6
tags: [constant number private]
```

```Go
const rb6 = -4.83519191608651397019e+02 // 0xC07E384E9BDC383F

```

### <a id="reduceThreshold" href="#reduceThreshold">const reduceThreshold</a>

```
searchKey: math.reduceThreshold
tags: [constant number private]
```

```Go
const reduceThreshold = 1 << 29
```

reduceThreshold is the maximum value of x where the reduction using Pi/4 in 3 float64 parts still gives accurate results. This threshold is set by y*C being representable as a float64 without error where y is given by y = floor(x * (4 / Pi)) and C is the leading partial terms of 4/Pi. Since the leading terms (PI4A and PI4B in sin.go) have 30 and 32 trailing zero bits, y should have less than 30 significant bits. 

```
y < 1<<30  -> floor(x*4/Pi) < 1<<30 -> x < (1<<30 - 1) * Pi/4

```
So, conservatively we can take x < 1<<29. Above this threshold Payne-Hanek range reduction must be used. 

### <a id="sa1" href="#sa1">const sa1</a>

```
searchKey: math.sa1
tags: [constant number private]
```

```Go
const sa1 = 1.96512716674392571292e+01 // 0x4033A6B9BD707687

```

### <a id="sa2" href="#sa2">const sa2</a>

```
searchKey: math.sa2
tags: [constant number private]
```

```Go
const sa2 = 1.37657754143519042600e+02 // 0x4061350C526AE721

```

### <a id="sa3" href="#sa3">const sa3</a>

```
searchKey: math.sa3
tags: [constant number private]
```

```Go
const sa3 = 4.34565877475229228821e+02 // 0x407B290DD58A1A71

```

### <a id="sa4" href="#sa4">const sa4</a>

```
searchKey: math.sa4
tags: [constant number private]
```

```Go
const sa4 = 6.45387271733267880336e+02 // 0x40842B1921EC2868

```

### <a id="sa5" href="#sa5">const sa5</a>

```
searchKey: math.sa5
tags: [constant number private]
```

```Go
const sa5 = 4.29008140027567833386e+02 // 0x407AD02157700314

```

### <a id="sa6" href="#sa6">const sa6</a>

```
searchKey: math.sa6
tags: [constant number private]
```

```Go
const sa6 = 1.08635005541779435134e+02 // 0x405B28A3EE48AE2C

```

### <a id="sa7" href="#sa7">const sa7</a>

```
searchKey: math.sa7
tags: [constant number private]
```

```Go
const sa7 = 6.57024977031928170135e+00 // 0x401A47EF8E484A93

```

### <a id="sa8" href="#sa8">const sa8</a>

```
searchKey: math.sa8
tags: [constant number private]
```

```Go
const sa8 = -6.04244152148580987438e-02 // 0xBFAEEFF2EE749A62

```

### <a id="sb1" href="#sb1">const sb1</a>

```
searchKey: math.sb1
tags: [constant number private]
```

```Go
const sb1 = 3.03380607434824582924e+01 // 0x403E568B261D5190

```

### <a id="sb2" href="#sb2">const sb2</a>

```
searchKey: math.sb2
tags: [constant number private]
```

```Go
const sb2 = 3.25792512996573918826e+02 // 0x40745CAE221B9F0A

```

### <a id="sb3" href="#sb3">const sb3</a>

```
searchKey: math.sb3
tags: [constant number private]
```

```Go
const sb3 = 1.53672958608443695994e+03 // 0x409802EB189D5118

```

### <a id="sb4" href="#sb4">const sb4</a>

```
searchKey: math.sb4
tags: [constant number private]
```

```Go
const sb4 = 3.19985821950859553908e+03 // 0x40A8FFB7688C246A

```

### <a id="sb5" href="#sb5">const sb5</a>

```
searchKey: math.sb5
tags: [constant number private]
```

```Go
const sb5 = 2.55305040643316442583e+03 // 0x40A3F219CEDF3BE6

```

### <a id="sb6" href="#sb6">const sb6</a>

```
searchKey: math.sb6
tags: [constant number private]
```

```Go
const sb6 = 4.74528541206955367215e+02 // 0x407DA874E79FE763

```

### <a id="sb7" href="#sb7">const sb7</a>

```
searchKey: math.sb7
tags: [constant number private]
```

```Go
const sb7 = -2.24409524465858183362e+01 // 0xC03670E242712D62

```

### <a id="shift" href="#shift">const shift</a>

```
searchKey: math.shift
tags: [constant number private]
```

```Go
const shift = 64 - 11 - 1
```

### <a id="signMask" href="#signMask">const signMask</a>

```
searchKey: math.signMask
tags: [constant number private]
```

```Go
const signMask = 1 << 63
```

### <a id="uvinf" href="#uvinf">const uvinf</a>

```
searchKey: math.uvinf
tags: [constant number private]
```

```Go
const uvinf = 0x7FF0000000000000
```

### <a id="uvnan" href="#uvnan">const uvnan</a>

```
searchKey: math.uvnan
tags: [constant number private]
```

```Go
const uvnan = 0x7FF8000000000001
```

### <a id="uvneginf" href="#uvneginf">const uvneginf</a>

```
searchKey: math.uvneginf
tags: [constant number private]
```

```Go
const uvneginf = 0xFFF0000000000000
```

### <a id="uvone" href="#uvone">const uvone</a>

```
searchKey: math.uvone
tags: [constant number private]
```

```Go
const uvone = 0x3FF0000000000000
```

## <a id="var" href="#var">Variables</a>

### <a id="Exp2Go" href="#Exp2Go">var Exp2Go</a>

```
searchKey: math.Exp2Go
tags: [variable function private]
```

```Go
var Exp2Go = exp2
```

### <a id="ExpGo" href="#ExpGo">var ExpGo</a>

```
searchKey: math.ExpGo
tags: [variable function private]
```

```Go
var ExpGo = exp
```

Export internal functions for testing. 

### <a id="HypotGo" href="#HypotGo">var HypotGo</a>

```
searchKey: math.HypotGo
tags: [variable function private]
```

```Go
var HypotGo = hypot
```

### <a id="SqrtGo" href="#SqrtGo">var SqrtGo</a>

```
searchKey: math.SqrtGo
tags: [variable function private]
```

```Go
var SqrtGo = sqrt
```

### <a id="TrigReduce" href="#TrigReduce">var TrigReduce</a>

```
searchKey: math.TrigReduce
tags: [variable function private]
```

```Go
var TrigReduce = trigReduce
```

### <a id="mPi4" href="#mPi4">var mPi4</a>

```
searchKey: math.mPi4
tags: [variable array number private]
```

```Go
var mPi4 = ...
```

mPi4 is the binary digits of 4/pi as a uint64 array, that is, 4/pi = Sum mPi4[i]*2^(-64*i) 19 64-bit digits and the leading one bit give 1217 bits of precision to handle the largest possible float64 exponent. 

### <a id="p0R2" href="#p0R2">var p0R2</a>

```
searchKey: math.p0R2
tags: [variable array number private]
```

```Go
var p0R2 = ...
```

for x in [2.8570,2]=1/[0.3499,0.5] 

### <a id="p0R3" href="#p0R3">var p0R3</a>

```
searchKey: math.p0R3
tags: [variable array number private]
```

```Go
var p0R3 = ...
```

for x in [4.547,2.8571]=1/[0.2199,0.35001] 

### <a id="p0R5" href="#p0R5">var p0R5</a>

```
searchKey: math.p0R5
tags: [variable array number private]
```

```Go
var p0R5 = ...
```

for x in [8,4.5454]=1/[0.125,0.22001] 

### <a id="p0R8" href="#p0R8">var p0R8</a>

```
searchKey: math.p0R8
tags: [variable array number private]
```

```Go
var p0R8 = ...
```

for x in [inf, 8]=1/[0,0.125] 

### <a id="p0S2" href="#p0S2">var p0S2</a>

```
searchKey: math.p0S2
tags: [variable array number private]
```

```Go
var p0S2 = ...
```

### <a id="p0S3" href="#p0S3">var p0S3</a>

```
searchKey: math.p0S3
tags: [variable array number private]
```

```Go
var p0S3 = ...
```

### <a id="p0S5" href="#p0S5">var p0S5</a>

```
searchKey: math.p0S5
tags: [variable array number private]
```

```Go
var p0S5 = ...
```

### <a id="p0S8" href="#p0S8">var p0S8</a>

```
searchKey: math.p0S8
tags: [variable array number private]
```

```Go
var p0S8 = ...
```

### <a id="p1R2" href="#p1R2">var p1R2</a>

```
searchKey: math.p1R2
tags: [variable array number private]
```

```Go
var p1R2 = ...
```

for x in [2.8570,2] = 1/[0.3499,0.5] 

### <a id="p1R3" href="#p1R3">var p1R3</a>

```
searchKey: math.p1R3
tags: [variable array number private]
```

```Go
var p1R3 = ...
```

for x in[4.5453,2.8571] = 1/[0.2199,0.35001] 

### <a id="p1R5" href="#p1R5">var p1R5</a>

```
searchKey: math.p1R5
tags: [variable array number private]
```

```Go
var p1R5 = ...
```

for x in [8,4.5454] = 1/[0.125,0.22001] 

### <a id="p1R8" href="#p1R8">var p1R8</a>

```
searchKey: math.p1R8
tags: [variable array number private]
```

```Go
var p1R8 = ...
```

for x in [inf, 8]=1/[0,0.125] 

### <a id="p1S2" href="#p1S2">var p1S2</a>

```
searchKey: math.p1S2
tags: [variable array number private]
```

```Go
var p1S2 = ...
```

### <a id="p1S3" href="#p1S3">var p1S3</a>

```
searchKey: math.p1S3
tags: [variable array number private]
```

```Go
var p1S3 = ...
```

### <a id="p1S5" href="#p1S5">var p1S5</a>

```
searchKey: math.p1S5
tags: [variable array number private]
```

```Go
var p1S5 = ...
```

### <a id="p1S8" href="#p1S8">var p1S8</a>

```
searchKey: math.p1S8
tags: [variable array number private]
```

```Go
var p1S8 = ...
```

### <a id="pow10negtab32" href="#pow10negtab32">var pow10negtab32</a>

```
searchKey: math.pow10negtab32
tags: [variable array number private]
```

```Go
var pow10negtab32 = ...
```

pow10negtab32 stores the pre-computed value for 10**(-i*32) at index i. 

### <a id="pow10postab32" href="#pow10postab32">var pow10postab32</a>

```
searchKey: math.pow10postab32
tags: [variable array number private]
```

```Go
var pow10postab32 = ...
```

pow10postab32 stores the pre-computed value for 10**(i*32) at index i. 

### <a id="pow10tab" href="#pow10tab">var pow10tab</a>

```
searchKey: math.pow10tab
tags: [variable array number private]
```

```Go
var pow10tab = ...
```

pow10tab stores the pre-computed values 10**i for i < 32. 

### <a id="q0R2" href="#q0R2">var q0R2</a>

```
searchKey: math.q0R2
tags: [variable array number private]
```

```Go
var q0R2 = ...
```

for x in [2.8570,2]=1/[0.3499,0.5] 

### <a id="q0R3" href="#q0R3">var q0R3</a>

```
searchKey: math.q0R3
tags: [variable array number private]
```

```Go
var q0R3 = ...
```

for x in [4.547,2.8571]=1/[0.2199,0.35001] 

### <a id="q0R5" href="#q0R5">var q0R5</a>

```
searchKey: math.q0R5
tags: [variable array number private]
```

```Go
var q0R5 = ...
```

for x in [8,4.5454]=1/[0.125,0.22001] 

### <a id="q0R8" href="#q0R8">var q0R8</a>

```
searchKey: math.q0R8
tags: [variable array number private]
```

```Go
var q0R8 = ...
```

for x in [inf, 8]=1/[0,0.125] 

### <a id="q0S2" href="#q0S2">var q0S2</a>

```
searchKey: math.q0S2
tags: [variable array number private]
```

```Go
var q0S2 = ...
```

### <a id="q0S3" href="#q0S3">var q0S3</a>

```
searchKey: math.q0S3
tags: [variable array number private]
```

```Go
var q0S3 = ...
```

### <a id="q0S5" href="#q0S5">var q0S5</a>

```
searchKey: math.q0S5
tags: [variable array number private]
```

```Go
var q0S5 = ...
```

### <a id="q0S8" href="#q0S8">var q0S8</a>

```
searchKey: math.q0S8
tags: [variable array number private]
```

```Go
var q0S8 = ...
```

### <a id="q1R2" href="#q1R2">var q1R2</a>

```
searchKey: math.q1R2
tags: [variable array number private]
```

```Go
var q1R2 = ...
```

for x in [2.8570,2] = 1/[0.3499,0.5] 

### <a id="q1R3" href="#q1R3">var q1R3</a>

```
searchKey: math.q1R3
tags: [variable array number private]
```

```Go
var q1R3 = ...
```

for x in [4.5454,2.8571] = 1/[0.2199,0.35001] ??? 

### <a id="q1R5" href="#q1R5">var q1R5</a>

```
searchKey: math.q1R5
tags: [variable array number private]
```

```Go
var q1R5 = ...
```

for x in [8,4.5454] = 1/[0.125,0.22001] 

### <a id="q1R8" href="#q1R8">var q1R8</a>

```
searchKey: math.q1R8
tags: [variable array number private]
```

```Go
var q1R8 = ...
```

for x in [inf, 8] = 1/[0,0.125] 

### <a id="q1S2" href="#q1S2">var q1S2</a>

```
searchKey: math.q1S2
tags: [variable array number private]
```

```Go
var q1S2 = ...
```

### <a id="q1S3" href="#q1S3">var q1S3</a>

```
searchKey: math.q1S3
tags: [variable array number private]
```

```Go
var q1S3 = ...
```

### <a id="q1S5" href="#q1S5">var q1S5</a>

```
searchKey: math.q1S5
tags: [variable array number private]
```

```Go
var q1S5 = ...
```

### <a id="q1S8" href="#q1S8">var q1S8</a>

```
searchKey: math.q1S8
tags: [variable array number private]
```

```Go
var q1S8 = ...
```

### <a id="tanhP" href="#tanhP">var tanhP</a>

```
searchKey: math.tanhP
tags: [variable array number private]
```

```Go
var tanhP = ...
```

### <a id="tanhQ" href="#tanhQ">var tanhQ</a>

```
searchKey: math.tanhQ
tags: [variable array number private]
```

```Go
var tanhQ = ...
```

### <a id="useFMA" href="#useFMA">var useFMA</a>

```
searchKey: math.useFMA
tags: [variable boolean private]
```

```Go
var useFMA = cpu.X86.HasAVX && cpu.X86.HasFMA
```

### <a id="_cos" href="#_cos">var _cos</a>

```
searchKey: math._cos
tags: [variable array number private]
```

```Go
var _cos = ...
```

cos coefficients 

### <a id="_gamP" href="#_gamP">var _gamP</a>

```
searchKey: math._gamP
tags: [variable array number private]
```

```Go
var _gamP = ...
```

### <a id="_gamQ" href="#_gamQ">var _gamQ</a>

```
searchKey: math._gamQ
tags: [variable array number private]
```

```Go
var _gamQ = ...
```

### <a id="_gamS" href="#_gamS">var _gamS</a>

```
searchKey: math._gamS
tags: [variable array number private]
```

```Go
var _gamS = ...
```

### <a id="_lgamA" href="#_lgamA">var _lgamA</a>

```
searchKey: math._lgamA
tags: [variable array number private]
```

```Go
var _lgamA = ...
```

### <a id="_lgamR" href="#_lgamR">var _lgamR</a>

```
searchKey: math._lgamR
tags: [variable array number private]
```

```Go
var _lgamR = ...
```

### <a id="_lgamS" href="#_lgamS">var _lgamS</a>

```
searchKey: math._lgamS
tags: [variable array number private]
```

```Go
var _lgamS = ...
```

### <a id="_lgamT" href="#_lgamT">var _lgamT</a>

```
searchKey: math._lgamT
tags: [variable array number private]
```

```Go
var _lgamT = ...
```

### <a id="_lgamU" href="#_lgamU">var _lgamU</a>

```
searchKey: math._lgamU
tags: [variable array number private]
```

```Go
var _lgamU = ...
```

### <a id="_lgamV" href="#_lgamV">var _lgamV</a>

```
searchKey: math._lgamV
tags: [variable array number private]
```

```Go
var _lgamV = ...
```

### <a id="_lgamW" href="#_lgamW">var _lgamW</a>

```
searchKey: math._lgamW
tags: [variable array number private]
```

```Go
var _lgamW = ...
```

### <a id="_sin" href="#_sin">var _sin</a>

```
searchKey: math._sin
tags: [variable array number private]
```

```Go
var _sin = ...
```

sin coefficients 

### <a id="_tanP" href="#_tanP">var _tanP</a>

```
searchKey: math._tanP
tags: [variable array number private]
```

```Go
var _tanP = ...
```

tan coefficients 

### <a id="_tanQ" href="#_tanQ">var _tanQ</a>

```
searchKey: math._tanQ
tags: [variable array number private]
```

```Go
var _tanQ = ...
```

## <a id="func" href="#func">Functions</a>

### <a id="Abs" href="#Abs">func Abs(x float64) float64</a>

```
searchKey: math.Abs
tags: [function]
```

```Go
func Abs(x float64) float64
```

Abs returns the absolute value of x. 

Special cases are: 

```
Abs(±Inf) = +Inf
Abs(NaN) = NaN

```
### <a id="Acos" href="#Acos">func Acos(x float64) float64</a>

```
searchKey: math.Acos
tags: [function]
```

```Go
func Acos(x float64) float64
```

Acos returns the arccosine, in radians, of x. 

Special case is: 

```
Acos(x) = NaN if x < -1 or x > 1

```
### <a id="Acosh" href="#Acosh">func Acosh(x float64) float64</a>

```
searchKey: math.Acosh
tags: [function]
```

```Go
func Acosh(x float64) float64
```

Acosh returns the inverse hyperbolic cosine of x. 

Special cases are: 

```
Acosh(+Inf) = +Inf
Acosh(x) = NaN if x < 1
Acosh(NaN) = NaN

```
### <a id="Asin" href="#Asin">func Asin(x float64) float64</a>

```
searchKey: math.Asin
tags: [function]
```

```Go
func Asin(x float64) float64
```

Asin returns the arcsine, in radians, of x. 

Special cases are: 

```
Asin(±0) = ±0
Asin(x) = NaN if x < -1 or x > 1

```
### <a id="Asinh" href="#Asinh">func Asinh(x float64) float64</a>

```
searchKey: math.Asinh
tags: [function]
```

```Go
func Asinh(x float64) float64
```

Asinh returns the inverse hyperbolic sine of x. 

Special cases are: 

```
Asinh(±0) = ±0
Asinh(±Inf) = ±Inf
Asinh(NaN) = NaN

```
### <a id="Atan" href="#Atan">func Atan(x float64) float64</a>

```
searchKey: math.Atan
tags: [function]
```

```Go
func Atan(x float64) float64
```

Atan returns the arctangent, in radians, of x. 

Special cases are: 

```
Atan(±0) = ±0
Atan(±Inf) = ±Pi/2

```
### <a id="Atan2" href="#Atan2">func Atan2(y, x float64) float64</a>

```
searchKey: math.Atan2
tags: [function]
```

```Go
func Atan2(y, x float64) float64
```

Atan2 returns the arc tangent of y/x, using the signs of the two to determine the quadrant of the return value. 

Special cases are (in order): 

```
Atan2(y, NaN) = NaN
Atan2(NaN, x) = NaN
Atan2(+0, x>=0) = +0
Atan2(-0, x>=0) = -0
Atan2(+0, x<=-0) = +Pi
Atan2(-0, x<=-0) = -Pi
Atan2(y>0, 0) = +Pi/2
Atan2(y<0, 0) = -Pi/2
Atan2(+Inf, +Inf) = +Pi/4
Atan2(-Inf, +Inf) = -Pi/4
Atan2(+Inf, -Inf) = 3Pi/4
Atan2(-Inf, -Inf) = -3Pi/4
Atan2(y, +Inf) = 0
Atan2(y>0, -Inf) = +Pi
Atan2(y<0, -Inf) = -Pi
Atan2(+Inf, x) = +Pi/2
Atan2(-Inf, x) = -Pi/2

```
### <a id="Atanh" href="#Atanh">func Atanh(x float64) float64</a>

```
searchKey: math.Atanh
tags: [function]
```

```Go
func Atanh(x float64) float64
```

Atanh returns the inverse hyperbolic tangent of x. 

Special cases are: 

```
Atanh(1) = +Inf
Atanh(±0) = ±0
Atanh(-1) = -Inf
Atanh(x) = NaN if x < -1 or x > 1
Atanh(NaN) = NaN

```
### <a id="Cbrt" href="#Cbrt">func Cbrt(x float64) float64</a>

```
searchKey: math.Cbrt
tags: [function]
```

```Go
func Cbrt(x float64) float64
```

Cbrt returns the cube root of x. 

Special cases are: 

```
Cbrt(±0) = ±0
Cbrt(±Inf) = ±Inf
Cbrt(NaN) = NaN

```
### <a id="Ceil" href="#Ceil">func Ceil(x float64) float64</a>

```
searchKey: math.Ceil
tags: [function]
```

```Go
func Ceil(x float64) float64
```

Ceil returns the least integer value greater than or equal to x. 

Special cases are: 

```
Ceil(±0) = ±0
Ceil(±Inf) = ±Inf
Ceil(NaN) = NaN

```
### <a id="Copysign" href="#Copysign">func Copysign(x, y float64) float64</a>

```
searchKey: math.Copysign
tags: [function]
```

```Go
func Copysign(x, y float64) float64
```

Copysign returns a value with the magnitude of x and the sign of y. 

### <a id="Cos" href="#Cos">func Cos(x float64) float64</a>

```
searchKey: math.Cos
tags: [function]
```

```Go
func Cos(x float64) float64
```

Cos returns the cosine of the radian argument x. 

Special cases are: 

```
Cos(±Inf) = NaN
Cos(NaN) = NaN

```
### <a id="Cosh" href="#Cosh">func Cosh(x float64) float64</a>

```
searchKey: math.Cosh
tags: [function]
```

```Go
func Cosh(x float64) float64
```

Cosh returns the hyperbolic cosine of x. 

Special cases are: 

```
Cosh(±0) = 1
Cosh(±Inf) = +Inf
Cosh(NaN) = NaN

```
### <a id="Dim" href="#Dim">func Dim(x, y float64) float64</a>

```
searchKey: math.Dim
tags: [function]
```

```Go
func Dim(x, y float64) float64
```

Dim returns the maximum of x-y or 0. 

Special cases are: 

```
Dim(+Inf, +Inf) = NaN
Dim(-Inf, -Inf) = NaN
Dim(x, NaN) = Dim(NaN, x) = NaN

```
### <a id="Erf" href="#Erf">func Erf(x float64) float64</a>

```
searchKey: math.Erf
tags: [function]
```

```Go
func Erf(x float64) float64
```

Erf returns the error function of x. 

Special cases are: 

```
Erf(+Inf) = 1
Erf(-Inf) = -1
Erf(NaN) = NaN

```
### <a id="Erfc" href="#Erfc">func Erfc(x float64) float64</a>

```
searchKey: math.Erfc
tags: [function]
```

```Go
func Erfc(x float64) float64
```

Erfc returns the complementary error function of x. 

Special cases are: 

```
Erfc(+Inf) = 0
Erfc(-Inf) = 2
Erfc(NaN) = NaN

```
### <a id="Erfcinv" href="#Erfcinv">func Erfcinv(x float64) float64</a>

```
searchKey: math.Erfcinv
tags: [function]
```

```Go
func Erfcinv(x float64) float64
```

Erfcinv returns the inverse of Erfc(x). 

Special cases are: 

```
Erfcinv(0) = +Inf
Erfcinv(2) = -Inf
Erfcinv(x) = NaN if x < 0 or x > 2
Erfcinv(NaN) = NaN

```
### <a id="Erfinv" href="#Erfinv">func Erfinv(x float64) float64</a>

```
searchKey: math.Erfinv
tags: [function]
```

```Go
func Erfinv(x float64) float64
```

Erfinv returns the inverse error function of x. 

Special cases are: 

```
Erfinv(1) = +Inf
Erfinv(-1) = -Inf
Erfinv(x) = NaN if x < -1 or x > 1
Erfinv(NaN) = NaN

```
### <a id="Exp" href="#Exp">func Exp(x float64) float64</a>

```
searchKey: math.Exp
tags: [function]
```

```Go
func Exp(x float64) float64
```

Exp returns e**x, the base-e exponential of x. 

Special cases are: 

```
Exp(+Inf) = +Inf
Exp(NaN) = NaN

```
Very large values overflow to 0 or +Inf. Very small values underflow to 1. 

### <a id="Exp2" href="#Exp2">func Exp2(x float64) float64</a>

```
searchKey: math.Exp2
tags: [function]
```

```Go
func Exp2(x float64) float64
```

Exp2 returns 2**x, the base-2 exponential of x. 

Special cases are the same as Exp. 

### <a id="Expm1" href="#Expm1">func Expm1(x float64) float64</a>

```
searchKey: math.Expm1
tags: [function]
```

```Go
func Expm1(x float64) float64
```

Expm1 returns e**x - 1, the base-e exponential of x minus 1. It is more accurate than Exp(x) - 1 when x is near zero. 

Special cases are: 

```
Expm1(+Inf) = +Inf
Expm1(-Inf) = -1
Expm1(NaN) = NaN

```
Very large values overflow to -1 or +Inf. 

### <a id="FMA" href="#FMA">func FMA(x, y, z float64) float64</a>

```
searchKey: math.FMA
tags: [function]
```

```Go
func FMA(x, y, z float64) float64
```

FMA returns x * y + z, computed with only one rounding. (That is, FMA returns the fused multiply-add of x, y, and z.) 

### <a id="Float32bits" href="#Float32bits">func Float32bits(f float32) uint32</a>

```
searchKey: math.Float32bits
tags: [function]
```

```Go
func Float32bits(f float32) uint32
```

Float32bits returns the IEEE 754 binary representation of f, with the sign bit of f and the result in the same bit position. Float32bits(Float32frombits(x)) == x. 

### <a id="Float32frombits" href="#Float32frombits">func Float32frombits(b uint32) float32</a>

```
searchKey: math.Float32frombits
tags: [function]
```

```Go
func Float32frombits(b uint32) float32
```

Float32frombits returns the floating-point number corresponding to the IEEE 754 binary representation b, with the sign bit of b and the result in the same bit position. Float32frombits(Float32bits(x)) == x. 

### <a id="Float64bits" href="#Float64bits">func Float64bits(f float64) uint64</a>

```
searchKey: math.Float64bits
tags: [function]
```

```Go
func Float64bits(f float64) uint64
```

Float64bits returns the IEEE 754 binary representation of f, with the sign bit of f and the result in the same bit position, and Float64bits(Float64frombits(x)) == x. 

### <a id="Float64frombits" href="#Float64frombits">func Float64frombits(b uint64) float64</a>

```
searchKey: math.Float64frombits
tags: [function]
```

```Go
func Float64frombits(b uint64) float64
```

Float64frombits returns the floating-point number corresponding to the IEEE 754 binary representation b, with the sign bit of b and the result in the same bit position. Float64frombits(Float64bits(x)) == x. 

### <a id="Floor" href="#Floor">func Floor(x float64) float64</a>

```
searchKey: math.Floor
tags: [function]
```

```Go
func Floor(x float64) float64
```

Floor returns the greatest integer value less than or equal to x. 

Special cases are: 

```
Floor(±0) = ±0
Floor(±Inf) = ±Inf
Floor(NaN) = NaN

```
### <a id="Frexp" href="#Frexp">func Frexp(f float64) (frac float64, exp int)</a>

```
searchKey: math.Frexp
tags: [function]
```

```Go
func Frexp(f float64) (frac float64, exp int)
```

Frexp breaks f into a normalized fraction and an integral power of two. It returns frac and exp satisfying f == frac × 2**exp, with the absolute value of frac in the interval [½, 1). 

Special cases are: 

```
Frexp(±0) = ±0, 0
Frexp(±Inf) = ±Inf, 0
Frexp(NaN) = NaN, 0

```
### <a id="Gamma" href="#Gamma">func Gamma(x float64) float64</a>

```
searchKey: math.Gamma
tags: [function]
```

```Go
func Gamma(x float64) float64
```

Gamma returns the Gamma function of x. 

Special cases are: 

```
Gamma(+Inf) = +Inf
Gamma(+0) = +Inf
Gamma(-0) = -Inf
Gamma(x) = NaN for integer x < 0
Gamma(-Inf) = NaN
Gamma(NaN) = NaN

```
### <a id="Hypot" href="#Hypot">func Hypot(p, q float64) float64</a>

```
searchKey: math.Hypot
tags: [function]
```

```Go
func Hypot(p, q float64) float64
```

Hypot returns Sqrt(p*p + q*q), taking care to avoid unnecessary overflow and underflow. 

Special cases are: 

```
Hypot(±Inf, q) = +Inf
Hypot(p, ±Inf) = +Inf
Hypot(NaN, q) = NaN
Hypot(p, NaN) = NaN

```
### <a id="Ilogb" href="#Ilogb">func Ilogb(x float64) int</a>

```
searchKey: math.Ilogb
tags: [function]
```

```Go
func Ilogb(x float64) int
```

Ilogb returns the binary exponent of x as an integer. 

Special cases are: 

```
Ilogb(±Inf) = MaxInt32
Ilogb(0) = MinInt32
Ilogb(NaN) = MaxInt32

```
### <a id="Inf" href="#Inf">func Inf(sign int) float64</a>

```
searchKey: math.Inf
tags: [function]
```

```Go
func Inf(sign int) float64
```

Inf returns positive infinity if sign >= 0, negative infinity if sign < 0. 

### <a id="IsInf" href="#IsInf">func IsInf(f float64, sign int) bool</a>

```
searchKey: math.IsInf
tags: [function]
```

```Go
func IsInf(f float64, sign int) bool
```

IsInf reports whether f is an infinity, according to sign. If sign > 0, IsInf reports whether f is positive infinity. If sign < 0, IsInf reports whether f is negative infinity. If sign == 0, IsInf reports whether f is either infinity. 

### <a id="IsNaN" href="#IsNaN">func IsNaN(f float64) (is bool)</a>

```
searchKey: math.IsNaN
tags: [function]
```

```Go
func IsNaN(f float64) (is bool)
```

IsNaN reports whether f is an IEEE 754 `not-a-number' value. 

### <a id="J0" href="#J0">func J0(x float64) float64</a>

```
searchKey: math.J0
tags: [function]
```

```Go
func J0(x float64) float64
```

J0 returns the order-zero Bessel function of the first kind. 

Special cases are: 

```
J0(±Inf) = 0
J0(0) = 1
J0(NaN) = NaN

```
### <a id="J1" href="#J1">func J1(x float64) float64</a>

```
searchKey: math.J1
tags: [function]
```

```Go
func J1(x float64) float64
```

J1 returns the order-one Bessel function of the first kind. 

Special cases are: 

```
J1(±Inf) = 0
J1(NaN) = NaN

```
### <a id="Jn" href="#Jn">func Jn(n int, x float64) float64</a>

```
searchKey: math.Jn
tags: [function]
```

```Go
func Jn(n int, x float64) float64
```

Jn returns the order-n Bessel function of the first kind. 

Special cases are: 

```
Jn(n, ±Inf) = 0
Jn(n, NaN) = NaN

```
### <a id="Ldexp" href="#Ldexp">func Ldexp(frac float64, exp int) float64</a>

```
searchKey: math.Ldexp
tags: [function]
```

```Go
func Ldexp(frac float64, exp int) float64
```

Ldexp is the inverse of Frexp. It returns frac × 2**exp. 

Special cases are: 

```
Ldexp(±0, exp) = ±0
Ldexp(±Inf, exp) = ±Inf
Ldexp(NaN, exp) = NaN

```
### <a id="Lgamma" href="#Lgamma">func Lgamma(x float64) (lgamma float64, sign int)</a>

```
searchKey: math.Lgamma
tags: [function]
```

```Go
func Lgamma(x float64) (lgamma float64, sign int)
```

Lgamma returns the natural logarithm and sign (-1 or +1) of Gamma(x). 

Special cases are: 

```
Lgamma(+Inf) = +Inf
Lgamma(0) = +Inf
Lgamma(-integer) = +Inf
Lgamma(-Inf) = -Inf
Lgamma(NaN) = NaN

```
### <a id="Log" href="#Log">func Log(x float64) float64</a>

```
searchKey: math.Log
tags: [function]
```

```Go
func Log(x float64) float64
```

Log returns the natural logarithm of x. 

Special cases are: 

```
Log(+Inf) = +Inf
Log(0) = -Inf
Log(x < 0) = NaN
Log(NaN) = NaN

```
### <a id="Log10" href="#Log10">func Log10(x float64) float64</a>

```
searchKey: math.Log10
tags: [function]
```

```Go
func Log10(x float64) float64
```

Log10 returns the decimal logarithm of x. The special cases are the same as for Log. 

### <a id="Log1p" href="#Log1p">func Log1p(x float64) float64</a>

```
searchKey: math.Log1p
tags: [function]
```

```Go
func Log1p(x float64) float64
```

Log1p returns the natural logarithm of 1 plus its argument x. It is more accurate than Log(1 + x) when x is near zero. 

Special cases are: 

```
Log1p(+Inf) = +Inf
Log1p(±0) = ±0
Log1p(-1) = -Inf
Log1p(x < -1) = NaN
Log1p(NaN) = NaN

```
### <a id="Log2" href="#Log2">func Log2(x float64) float64</a>

```
searchKey: math.Log2
tags: [function]
```

```Go
func Log2(x float64) float64
```

Log2 returns the binary logarithm of x. The special cases are the same as for Log. 

### <a id="Logb" href="#Logb">func Logb(x float64) float64</a>

```
searchKey: math.Logb
tags: [function]
```

```Go
func Logb(x float64) float64
```

Logb returns the binary exponent of x. 

Special cases are: 

```
Logb(±Inf) = +Inf
Logb(0) = -Inf
Logb(NaN) = NaN

```
### <a id="Max" href="#Max">func Max(x, y float64) float64</a>

```
searchKey: math.Max
tags: [function]
```

```Go
func Max(x, y float64) float64
```

Max returns the larger of x or y. 

Special cases are: 

```
Max(x, +Inf) = Max(+Inf, x) = +Inf
Max(x, NaN) = Max(NaN, x) = NaN
Max(+0, ±0) = Max(±0, +0) = +0
Max(-0, -0) = -0

```
### <a id="Min" href="#Min">func Min(x, y float64) float64</a>

```
searchKey: math.Min
tags: [function]
```

```Go
func Min(x, y float64) float64
```

Min returns the smaller of x or y. 

Special cases are: 

```
Min(x, -Inf) = Min(-Inf, x) = -Inf
Min(x, NaN) = Min(NaN, x) = NaN
Min(-0, ±0) = Min(±0, -0) = -0

```
### <a id="Mod" href="#Mod">func Mod(x, y float64) float64</a>

```
searchKey: math.Mod
tags: [function]
```

```Go
func Mod(x, y float64) float64
```

Mod returns the floating-point remainder of x/y. The magnitude of the result is less than y and its sign agrees with that of x. 

Special cases are: 

```
Mod(±Inf, y) = NaN
Mod(NaN, y) = NaN
Mod(x, 0) = NaN
Mod(x, ±Inf) = x
Mod(x, NaN) = NaN

```
### <a id="Modf" href="#Modf">func Modf(f float64) (int float64, frac float64)</a>

```
searchKey: math.Modf
tags: [function]
```

```Go
func Modf(f float64) (int float64, frac float64)
```

Modf returns integer and fractional floating-point numbers that sum to f. Both values have the same sign as f. 

Special cases are: 

```
Modf(±Inf) = ±Inf, NaN
Modf(NaN) = NaN, NaN

```
### <a id="NaN" href="#NaN">func NaN() float64</a>

```
searchKey: math.NaN
tags: [function]
```

```Go
func NaN() float64
```

NaN returns an IEEE 754 `not-a-number' value. 

### <a id="Nextafter" href="#Nextafter">func Nextafter(x, y float64) (r float64)</a>

```
searchKey: math.Nextafter
tags: [function]
```

```Go
func Nextafter(x, y float64) (r float64)
```

Nextafter returns the next representable float64 value after x towards y. 

Special cases are: 

```
Nextafter(x, x)   = x
Nextafter(NaN, y) = NaN
Nextafter(x, NaN) = NaN

```
### <a id="Nextafter32" href="#Nextafter32">func Nextafter32(x, y float32) (r float32)</a>

```
searchKey: math.Nextafter32
tags: [function]
```

```Go
func Nextafter32(x, y float32) (r float32)
```

Nextafter32 returns the next representable float32 value after x towards y. 

Special cases are: 

```
Nextafter32(x, x)   = x
Nextafter32(NaN, y) = NaN
Nextafter32(x, NaN) = NaN

```
### <a id="Pow" href="#Pow">func Pow(x, y float64) float64</a>

```
searchKey: math.Pow
tags: [function]
```

```Go
func Pow(x, y float64) float64
```

Pow returns x**y, the base-x exponential of y. 

Special cases are (in order): 

```
Pow(x, ±0) = 1 for any x
Pow(1, y) = 1 for any y
Pow(x, 1) = x for any x
Pow(NaN, y) = NaN
Pow(x, NaN) = NaN
Pow(±0, y) = ±Inf for y an odd integer < 0
Pow(±0, -Inf) = +Inf
Pow(±0, +Inf) = +0
Pow(±0, y) = +Inf for finite y < 0 and not an odd integer
Pow(±0, y) = ±0 for y an odd integer > 0
Pow(±0, y) = +0 for finite y > 0 and not an odd integer
Pow(-1, ±Inf) = 1
Pow(x, +Inf) = +Inf for |x| > 1
Pow(x, -Inf) = +0 for |x| > 1
Pow(x, +Inf) = +0 for |x| < 1
Pow(x, -Inf) = +Inf for |x| < 1
Pow(+Inf, y) = +Inf for y > 0
Pow(+Inf, y) = +0 for y < 0
Pow(-Inf, y) = Pow(-0, -y)
Pow(x, y) = NaN for finite x < 0 and finite non-integer y

```
### <a id="Pow10" href="#Pow10">func Pow10(n int) float64</a>

```
searchKey: math.Pow10
tags: [function]
```

```Go
func Pow10(n int) float64
```

Pow10 returns 10**n, the base-10 exponential of n. 

Special cases are: 

```
Pow10(n) =    0 for n < -323
Pow10(n) = +Inf for n > 308

```
### <a id="Remainder" href="#Remainder">func Remainder(x, y float64) float64</a>

```
searchKey: math.Remainder
tags: [function]
```

```Go
func Remainder(x, y float64) float64
```

Remainder returns the IEEE 754 floating-point remainder of x/y. 

Special cases are: 

```
Remainder(±Inf, y) = NaN
Remainder(NaN, y) = NaN
Remainder(x, 0) = NaN
Remainder(x, ±Inf) = x
Remainder(x, NaN) = NaN

```
### <a id="Round" href="#Round">func Round(x float64) float64</a>

```
searchKey: math.Round
tags: [function]
```

```Go
func Round(x float64) float64
```

Round returns the nearest integer, rounding half away from zero. 

Special cases are: 

```
Round(±0) = ±0
Round(±Inf) = ±Inf
Round(NaN) = NaN

```
### <a id="RoundToEven" href="#RoundToEven">func RoundToEven(x float64) float64</a>

```
searchKey: math.RoundToEven
tags: [function]
```

```Go
func RoundToEven(x float64) float64
```

RoundToEven returns the nearest integer, rounding ties to even. 

Special cases are: 

```
RoundToEven(±0) = ±0
RoundToEven(±Inf) = ±Inf
RoundToEven(NaN) = NaN

```
### <a id="Signbit" href="#Signbit">func Signbit(x float64) bool</a>

```
searchKey: math.Signbit
tags: [function]
```

```Go
func Signbit(x float64) bool
```

Signbit reports whether x is negative or negative zero. 

### <a id="Sin" href="#Sin">func Sin(x float64) float64</a>

```
searchKey: math.Sin
tags: [function]
```

```Go
func Sin(x float64) float64
```

Sin returns the sine of the radian argument x. 

Special cases are: 

```
Sin(±0) = ±0
Sin(±Inf) = NaN
Sin(NaN) = NaN

```
### <a id="Sincos" href="#Sincos">func Sincos(x float64) (sin, cos float64)</a>

```
searchKey: math.Sincos
tags: [function]
```

```Go
func Sincos(x float64) (sin, cos float64)
```

Sincos returns Sin(x), Cos(x). 

Special cases are: 

```
Sincos(±0) = ±0, 1
Sincos(±Inf) = NaN, NaN
Sincos(NaN) = NaN, NaN

```
### <a id="Sinh" href="#Sinh">func Sinh(x float64) float64</a>

```
searchKey: math.Sinh
tags: [function]
```

```Go
func Sinh(x float64) float64
```

Sinh returns the hyperbolic sine of x. 

Special cases are: 

```
Sinh(±0) = ±0
Sinh(±Inf) = ±Inf
Sinh(NaN) = NaN

```
### <a id="Sqrt" href="#Sqrt">func Sqrt(x float64) float64</a>

```
searchKey: math.Sqrt
tags: [function]
```

```Go
func Sqrt(x float64) float64
```

Sqrt returns the square root of x. 

Special cases are: 

```
Sqrt(+Inf) = +Inf
Sqrt(±0) = ±0
Sqrt(x < 0) = NaN
Sqrt(NaN) = NaN

```
### <a id="Tan" href="#Tan">func Tan(x float64) float64</a>

```
searchKey: math.Tan
tags: [function]
```

```Go
func Tan(x float64) float64
```

Tan returns the tangent of the radian argument x. 

Special cases are: 

```
Tan(±0) = ±0
Tan(±Inf) = NaN
Tan(NaN) = NaN

```
### <a id="Tanh" href="#Tanh">func Tanh(x float64) float64</a>

```
searchKey: math.Tanh
tags: [function]
```

```Go
func Tanh(x float64) float64
```

Tanh returns the hyperbolic tangent of x. 

Special cases are: 

```
Tanh(±0) = ±0
Tanh(±Inf) = ±1
Tanh(NaN) = NaN

```
### <a id="Trunc" href="#Trunc">func Trunc(x float64) float64</a>

```
searchKey: math.Trunc
tags: [function]
```

```Go
func Trunc(x float64) float64
```

Trunc returns the integer value of x. 

Special cases are: 

```
Trunc(±0) = ±0
Trunc(±Inf) = ±Inf
Trunc(NaN) = NaN

```
### <a id="Y0" href="#Y0">func Y0(x float64) float64</a>

```
searchKey: math.Y0
tags: [function]
```

```Go
func Y0(x float64) float64
```

Y0 returns the order-zero Bessel function of the second kind. 

Special cases are: 

```
Y0(+Inf) = 0
Y0(0) = -Inf
Y0(x < 0) = NaN
Y0(NaN) = NaN

```
### <a id="Y1" href="#Y1">func Y1(x float64) float64</a>

```
searchKey: math.Y1
tags: [function]
```

```Go
func Y1(x float64) float64
```

Y1 returns the order-one Bessel function of the second kind. 

Special cases are: 

```
Y1(+Inf) = 0
Y1(0) = -Inf
Y1(x < 0) = NaN
Y1(NaN) = NaN

```
### <a id="Yn" href="#Yn">func Yn(n int, x float64) float64</a>

```
searchKey: math.Yn
tags: [function]
```

```Go
func Yn(n int, x float64) float64
```

Yn returns the order-n Bessel function of the second kind. 

Special cases are: 

```
Yn(n, +Inf) = 0
Yn(n ≥ 0, 0) = -Inf
Yn(n < 0, 0) = +Inf if n is odd, -Inf if n is even
Yn(n, x < 0) = NaN
Yn(n, NaN) = NaN

```
### <a id="acos" href="#acos">func acos(x float64) float64</a>

```
searchKey: math.acos
tags: [function private]
```

```Go
func acos(x float64) float64
```

### <a id="acosh" href="#acosh">func acosh(x float64) float64</a>

```
searchKey: math.acosh
tags: [function private]
```

```Go
func acosh(x float64) float64
```

### <a id="archAcos" href="#archAcos">func archAcos(x float64) float64</a>

```
searchKey: math.archAcos
tags: [function private]
```

```Go
func archAcos(x float64) float64
```

### <a id="archAcosh" href="#archAcosh">func archAcosh(x float64) float64</a>

```
searchKey: math.archAcosh
tags: [function private]
```

```Go
func archAcosh(x float64) float64
```

### <a id="archAsin" href="#archAsin">func archAsin(x float64) float64</a>

```
searchKey: math.archAsin
tags: [function private]
```

```Go
func archAsin(x float64) float64
```

### <a id="archAsinh" href="#archAsinh">func archAsinh(x float64) float64</a>

```
searchKey: math.archAsinh
tags: [function private]
```

```Go
func archAsinh(x float64) float64
```

### <a id="archAtan" href="#archAtan">func archAtan(x float64) float64</a>

```
searchKey: math.archAtan
tags: [function private]
```

```Go
func archAtan(x float64) float64
```

### <a id="archAtan2" href="#archAtan2">func archAtan2(y, x float64) float64</a>

```
searchKey: math.archAtan2
tags: [function private]
```

```Go
func archAtan2(y, x float64) float64
```

### <a id="archAtanh" href="#archAtanh">func archAtanh(x float64) float64</a>

```
searchKey: math.archAtanh
tags: [function private]
```

```Go
func archAtanh(x float64) float64
```

### <a id="archCbrt" href="#archCbrt">func archCbrt(x float64) float64</a>

```
searchKey: math.archCbrt
tags: [function private]
```

```Go
func archCbrt(x float64) float64
```

### <a id="archCeil" href="#archCeil">func archCeil(x float64) float64</a>

```
searchKey: math.archCeil
tags: [function private]
```

```Go
func archCeil(x float64) float64
```

### <a id="archCos" href="#archCos">func archCos(x float64) float64</a>

```
searchKey: math.archCos
tags: [function private]
```

```Go
func archCos(x float64) float64
```

### <a id="archCosh" href="#archCosh">func archCosh(x float64) float64</a>

```
searchKey: math.archCosh
tags: [function private]
```

```Go
func archCosh(x float64) float64
```

### <a id="archErf" href="#archErf">func archErf(x float64) float64</a>

```
searchKey: math.archErf
tags: [function private]
```

```Go
func archErf(x float64) float64
```

### <a id="archErfc" href="#archErfc">func archErfc(x float64) float64</a>

```
searchKey: math.archErfc
tags: [function private]
```

```Go
func archErfc(x float64) float64
```

### <a id="archExp" href="#archExp">func archExp(x float64) float64</a>

```
searchKey: math.archExp
tags: [function private]
```

```Go
func archExp(x float64) float64
```

### <a id="archExp2" href="#archExp2">func archExp2(x float64) float64</a>

```
searchKey: math.archExp2
tags: [function private]
```

```Go
func archExp2(x float64) float64
```

### <a id="archExpm1" href="#archExpm1">func archExpm1(x float64) float64</a>

```
searchKey: math.archExpm1
tags: [function private]
```

```Go
func archExpm1(x float64) float64
```

### <a id="archFloor" href="#archFloor">func archFloor(x float64) float64</a>

```
searchKey: math.archFloor
tags: [function private]
```

```Go
func archFloor(x float64) float64
```

### <a id="archFrexp" href="#archFrexp">func archFrexp(x float64) (float64, int)</a>

```
searchKey: math.archFrexp
tags: [function private]
```

```Go
func archFrexp(x float64) (float64, int)
```

### <a id="archHypot" href="#archHypot">func archHypot(p, q float64) float64</a>

```
searchKey: math.archHypot
tags: [function private]
```

```Go
func archHypot(p, q float64) float64
```

### <a id="archLdexp" href="#archLdexp">func archLdexp(frac float64, exp int) float64</a>

```
searchKey: math.archLdexp
tags: [function private]
```

```Go
func archLdexp(frac float64, exp int) float64
```

### <a id="archLog" href="#archLog">func archLog(x float64) float64</a>

```
searchKey: math.archLog
tags: [function private]
```

```Go
func archLog(x float64) float64
```

### <a id="archLog10" href="#archLog10">func archLog10(x float64) float64</a>

```
searchKey: math.archLog10
tags: [function private]
```

```Go
func archLog10(x float64) float64
```

### <a id="archLog1p" href="#archLog1p">func archLog1p(x float64) float64</a>

```
searchKey: math.archLog1p
tags: [function private]
```

```Go
func archLog1p(x float64) float64
```

### <a id="archLog2" href="#archLog2">func archLog2(x float64) float64</a>

```
searchKey: math.archLog2
tags: [function private]
```

```Go
func archLog2(x float64) float64
```

### <a id="archMax" href="#archMax">func archMax(x, y float64) float64</a>

```
searchKey: math.archMax
tags: [function private]
```

```Go
func archMax(x, y float64) float64
```

### <a id="archMin" href="#archMin">func archMin(x, y float64) float64</a>

```
searchKey: math.archMin
tags: [function private]
```

```Go
func archMin(x, y float64) float64
```

### <a id="archMod" href="#archMod">func archMod(x, y float64) float64</a>

```
searchKey: math.archMod
tags: [function private]
```

```Go
func archMod(x, y float64) float64
```

### <a id="archModf" href="#archModf">func archModf(f float64) (int float64, frac float64)</a>

```
searchKey: math.archModf
tags: [function private]
```

```Go
func archModf(f float64) (int float64, frac float64)
```

### <a id="archPow" href="#archPow">func archPow(x, y float64) float64</a>

```
searchKey: math.archPow
tags: [function private]
```

```Go
func archPow(x, y float64) float64
```

### <a id="archRemainder" href="#archRemainder">func archRemainder(x, y float64) float64</a>

```
searchKey: math.archRemainder
tags: [function private]
```

```Go
func archRemainder(x, y float64) float64
```

### <a id="archSin" href="#archSin">func archSin(x float64) float64</a>

```
searchKey: math.archSin
tags: [function private]
```

```Go
func archSin(x float64) float64
```

### <a id="archSinh" href="#archSinh">func archSinh(x float64) float64</a>

```
searchKey: math.archSinh
tags: [function private]
```

```Go
func archSinh(x float64) float64
```

### <a id="archSqrt" href="#archSqrt">func archSqrt(x float64) float64</a>

```
searchKey: math.archSqrt
tags: [function private]
```

```Go
func archSqrt(x float64) float64
```

### <a id="archTan" href="#archTan">func archTan(x float64) float64</a>

```
searchKey: math.archTan
tags: [function private]
```

```Go
func archTan(x float64) float64
```

### <a id="archTanh" href="#archTanh">func archTanh(x float64) float64</a>

```
searchKey: math.archTanh
tags: [function private]
```

```Go
func archTanh(x float64) float64
```

### <a id="archTrunc" href="#archTrunc">func archTrunc(x float64) float64</a>

```
searchKey: math.archTrunc
tags: [function private]
```

```Go
func archTrunc(x float64) float64
```

### <a id="asin" href="#asin">func asin(x float64) float64</a>

```
searchKey: math.asin
tags: [function private]
```

```Go
func asin(x float64) float64
```

### <a id="asinh" href="#asinh">func asinh(x float64) float64</a>

```
searchKey: math.asinh
tags: [function private]
```

```Go
func asinh(x float64) float64
```

### <a id="atan" href="#atan">func atan(x float64) float64</a>

```
searchKey: math.atan
tags: [function private]
```

```Go
func atan(x float64) float64
```

### <a id="atan2" href="#atan2">func atan2(y, x float64) float64</a>

```
searchKey: math.atan2
tags: [function private]
```

```Go
func atan2(y, x float64) float64
```

### <a id="atanh" href="#atanh">func atanh(x float64) float64</a>

```
searchKey: math.atanh
tags: [function private]
```

```Go
func atanh(x float64) float64
```

### <a id="cbrt" href="#cbrt">func cbrt(x float64) float64</a>

```
searchKey: math.cbrt
tags: [function private]
```

```Go
func cbrt(x float64) float64
```

### <a id="ceil" href="#ceil">func ceil(x float64) float64</a>

```
searchKey: math.ceil
tags: [function private]
```

```Go
func ceil(x float64) float64
```

### <a id="cos" href="#cos">func cos(x float64) float64</a>

```
searchKey: math.cos
tags: [function private]
```

```Go
func cos(x float64) float64
```

### <a id="cosh" href="#cosh">func cosh(x float64) float64</a>

```
searchKey: math.cosh
tags: [function private]
```

```Go
func cosh(x float64) float64
```

### <a id="erf" href="#erf">func erf(x float64) float64</a>

```
searchKey: math.erf
tags: [function private]
```

```Go
func erf(x float64) float64
```

### <a id="erfc" href="#erfc">func erfc(x float64) float64</a>

```
searchKey: math.erfc
tags: [function private]
```

```Go
func erfc(x float64) float64
```

### <a id="exp" href="#exp">func exp(x float64) float64</a>

```
searchKey: math.exp
tags: [function private]
```

```Go
func exp(x float64) float64
```

### <a id="exp2" href="#exp2">func exp2(x float64) float64</a>

```
searchKey: math.exp2
tags: [function private]
```

```Go
func exp2(x float64) float64
```

### <a id="expm1" href="#expm1">func expm1(x float64) float64</a>

```
searchKey: math.expm1
tags: [function private]
```

```Go
func expm1(x float64) float64
```

### <a id="expmulti" href="#expmulti">func expmulti(hi, lo float64, k int) float64</a>

```
searchKey: math.expmulti
tags: [function private]
```

```Go
func expmulti(hi, lo float64, k int) float64
```

exp1 returns e**r × 2**k where r = hi - lo and |r| ≤ ln(2)/2. 

### <a id="floor" href="#floor">func floor(x float64) float64</a>

```
searchKey: math.floor
tags: [function private]
```

```Go
func floor(x float64) float64
```

### <a id="frexp" href="#frexp">func frexp(f float64) (frac float64, exp int)</a>

```
searchKey: math.frexp
tags: [function private]
```

```Go
func frexp(f float64) (frac float64, exp int)
```

### <a id="hypot" href="#hypot">func hypot(p, q float64) float64</a>

```
searchKey: math.hypot
tags: [function private]
```

```Go
func hypot(p, q float64) float64
```

### <a id="ilogb" href="#ilogb">func ilogb(x float64) int</a>

```
searchKey: math.ilogb
tags: [function private]
```

```Go
func ilogb(x float64) int
```

logb returns the binary exponent of x. It assumes x is finite and non-zero. 

### <a id="isNegInt" href="#isNegInt">func isNegInt(x float64) bool</a>

```
searchKey: math.isNegInt
tags: [function private]
```

```Go
func isNegInt(x float64) bool
```

### <a id="isOddInt" href="#isOddInt">func isOddInt(x float64) bool</a>

```
searchKey: math.isOddInt
tags: [function private]
```

```Go
func isOddInt(x float64) bool
```

### <a id="ldexp" href="#ldexp">func ldexp(frac float64, exp int) float64</a>

```
searchKey: math.ldexp
tags: [function private]
```

```Go
func ldexp(frac float64, exp int) float64
```

### <a id="log" href="#log">func log(x float64) float64</a>

```
searchKey: math.log
tags: [function private]
```

```Go
func log(x float64) float64
```

### <a id="log10" href="#log10">func log10(x float64) float64</a>

```
searchKey: math.log10
tags: [function private]
```

```Go
func log10(x float64) float64
```

### <a id="log1p" href="#log1p">func log1p(x float64) float64</a>

```
searchKey: math.log1p
tags: [function private]
```

```Go
func log1p(x float64) float64
```

### <a id="log2" href="#log2">func log2(x float64) float64</a>

```
searchKey: math.log2
tags: [function private]
```

```Go
func log2(x float64) float64
```

### <a id="lz" href="#lz">func lz(u1, u2 uint64) (l int32)</a>

```
searchKey: math.lz
tags: [function private]
```

```Go
func lz(u1, u2 uint64) (l int32)
```

### <a id="max" href="#max">func max(x, y float64) float64</a>

```
searchKey: math.max
tags: [function private]
```

```Go
func max(x, y float64) float64
```

### <a id="min" href="#min">func min(x, y float64) float64</a>

```
searchKey: math.min
tags: [function private]
```

```Go
func min(x, y float64) float64
```

### <a id="mod" href="#mod">func mod(x, y float64) float64</a>

```
searchKey: math.mod
tags: [function private]
```

```Go
func mod(x, y float64) float64
```

### <a id="modf" href="#modf">func modf(f float64) (int float64, frac float64)</a>

```
searchKey: math.modf
tags: [function private]
```

```Go
func modf(f float64) (int float64, frac float64)
```

### <a id="nonzero" href="#nonzero">func nonzero(x uint64) uint64</a>

```
searchKey: math.nonzero
tags: [function private]
```

```Go
func nonzero(x uint64) uint64
```

### <a id="normalize" href="#normalize">func normalize(x float64) (y float64, exp int)</a>

```
searchKey: math.normalize
tags: [function private]
```

```Go
func normalize(x float64) (y float64, exp int)
```

normalize returns a normal number y and exponent exp satisfying x == y × 2**exp. It assumes x is finite and non-zero. 

### <a id="pone" href="#pone">func pone(x float64) float64</a>

```
searchKey: math.pone
tags: [function private]
```

```Go
func pone(x float64) float64
```

### <a id="pow" href="#pow">func pow(x, y float64) float64</a>

```
searchKey: math.pow
tags: [function private]
```

```Go
func pow(x, y float64) float64
```

### <a id="pzero" href="#pzero">func pzero(x float64) float64</a>

```
searchKey: math.pzero
tags: [function private]
```

```Go
func pzero(x float64) float64
```

### <a id="qone" href="#qone">func qone(x float64) float64</a>

```
searchKey: math.qone
tags: [function private]
```

```Go
func qone(x float64) float64
```

### <a id="qzero" href="#qzero">func qzero(x float64) float64</a>

```
searchKey: math.qzero
tags: [function private]
```

```Go
func qzero(x float64) float64
```

### <a id="remainder" href="#remainder">func remainder(x, y float64) float64</a>

```
searchKey: math.remainder
tags: [function private]
```

```Go
func remainder(x, y float64) float64
```

### <a id="satan" href="#satan">func satan(x float64) float64</a>

```
searchKey: math.satan
tags: [function private]
```

```Go
func satan(x float64) float64
```

satan reduces its argument (known to be positive) to the range [0, 0.66] and calls xatan. 

### <a id="shl" href="#shl">func shl(u1, u2 uint64, n uint) (r1, r2 uint64)</a>

```
searchKey: math.shl
tags: [function private]
```

```Go
func shl(u1, u2 uint64, n uint) (r1, r2 uint64)
```

### <a id="shr" href="#shr">func shr(u1, u2 uint64, n uint) (r1, r2 uint64)</a>

```
searchKey: math.shr
tags: [function private]
```

```Go
func shr(u1, u2 uint64, n uint) (r1, r2 uint64)
```

### <a id="shrcompress" href="#shrcompress">func shrcompress(u1, u2 uint64, n uint) (r1, r2 uint64)</a>

```
searchKey: math.shrcompress
tags: [function private]
```

```Go
func shrcompress(u1, u2 uint64, n uint) (r1, r2 uint64)
```

shrcompress compresses the bottom n+1 bits of the two-word value into a single bit. the result is equal to the value shifted to the right by n, except the result's 0th bit is set to the bitwise OR of the bottom n+1 bits. 

### <a id="sin" href="#sin">func sin(x float64) float64</a>

```
searchKey: math.sin
tags: [function private]
```

```Go
func sin(x float64) float64
```

### <a id="sinPi" href="#sinPi">func sinPi(x float64) float64</a>

```
searchKey: math.sinPi
tags: [function private]
```

```Go
func sinPi(x float64) float64
```

sinPi(x) is a helper function for negative x 

### <a id="sinh" href="#sinh">func sinh(x float64) float64</a>

```
searchKey: math.sinh
tags: [function private]
```

```Go
func sinh(x float64) float64
```

### <a id="split" href="#split">func split(b uint64) (sign uint32, exp int32, mantissa uint64)</a>

```
searchKey: math.split
tags: [function private]
```

```Go
func split(b uint64) (sign uint32, exp int32, mantissa uint64)
```

split splits b into sign, biased exponent, and mantissa. It adds the implicit 1 bit to the mantissa for normal values, and normalizes subnormal values. 

### <a id="sqrt" href="#sqrt">func sqrt(x float64) float64</a>

```
searchKey: math.sqrt
tags: [function private]
```

```Go
func sqrt(x float64) float64
```

### <a id="stirling" href="#stirling">func stirling(x float64) (float64, float64)</a>

```
searchKey: math.stirling
tags: [function private]
```

```Go
func stirling(x float64) (float64, float64)
```

Gamma function computed by Stirling's formula. The pair of results must be multiplied together to get the actual answer. The multiplication is left to the caller so that, if careful, the caller can avoid infinity for 172 <= x <= 180. The polynomial is valid for 33 <= x <= 172; larger values are only used in reciprocal and produce denormalized floats. The lower precision there masks any imprecision in the polynomial. 

### <a id="tan" href="#tan">func tan(x float64) float64</a>

```
searchKey: math.tan
tags: [function private]
```

```Go
func tan(x float64) float64
```

### <a id="tanh" href="#tanh">func tanh(x float64) float64</a>

```
searchKey: math.tanh
tags: [function private]
```

```Go
func tanh(x float64) float64
```

### <a id="trigReduce" href="#trigReduce">func trigReduce(x float64) (j uint64, z float64)</a>

```
searchKey: math.trigReduce
tags: [function private]
```

```Go
func trigReduce(x float64) (j uint64, z float64)
```

trigReduce implements Payne-Hanek range reduction by Pi/4 for x > 0. It returns the integer part mod 8 (j) and the fractional part (z) of x / (Pi/4). The implementation is based on: "ARGUMENT REDUCTION FOR HUGE ARGUMENTS: Good to the Last Bit" K. C. Ng et al, March 24, 1992 The simulated multi-precision calculation of x*B uses 64-bit integer arithmetic. 

### <a id="trunc" href="#trunc">func trunc(x float64) float64</a>

```
searchKey: math.trunc
tags: [function private]
```

```Go
func trunc(x float64) float64
```

### <a id="xatan" href="#xatan">func xatan(x float64) float64</a>

```
searchKey: math.xatan
tags: [function private]
```

```Go
func xatan(x float64) float64
```

xatan evaluates a series valid in the range [0, 0.66]. 

### <a id="zero" href="#zero">func zero(x uint64) uint64</a>

```
searchKey: math.zero
tags: [function private]
```

```Go
func zero(x uint64) uint64
```

