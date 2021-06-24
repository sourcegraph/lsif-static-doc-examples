# Package big

Package big implements arbitrary-precision arithmetic (big numbers). The following numeric types are supported: 

```
Int    signed integers
Rat    rational numbers
Float  floating-point numbers

```
The zero value for an Int, Rat, or Float correspond to 0. Thus, new values can be declared in the usual ways and denote 0 without further initialization: 

```
var x Int        // &x is an *Int of value 0
var r = &Rat{}   // r is a *Rat of value 0
y := new(Float)  // y is a *Float of value 0

```
Alternatively, new values can be allocated and initialized with factory functions of the form: 

```
func NewT(v V) *T

```
For instance, NewInt(x) returns an *Int set to the value of the int64 argument x, NewRat(a, b) returns a *Rat set to the fraction a/b where a and b are int64 values, and NewFloat(f) returns a *Float initialized to the float64 argument f. More flexibility is provided with explicit setters, for instance: 

```
var z1 Int
z1.SetUint64(123)                 // z1 := 123
z2 := new(Rat).SetFloat64(1.25)   // z2 := 5/4
z3 := new(Float).SetInt(z1)       // z3 := 123.0

```
Setters, numeric operations and predicates are represented as methods of the form: 

```
func (z *T) SetV(v V) *T          // z = v
func (z *T) Unary(x *T) *T        // z = unary x
func (z *T) Binary(x, y *T) *T    // z = x binary y
func (x *T) Pred() P              // p = pred(x)

```
with T one of Int, Rat, or Float. For unary and binary operations, the result is the receiver (usually named z in that case; see below); if it is one of the operands x or y it may be safely overwritten (and its memory reused). 

Arithmetic expressions are typically written as a sequence of individual method calls, with each call corresponding to an operation. The receiver denotes the result and the method arguments are the operation's operands. For instance, given three *Int values a, b and c, the invocation 

```
c.Add(a, b)

```
computes the sum a + b and stores the result in c, overwriting whatever value was held in c before. Unless specified otherwise, operations permit aliasing of parameters, so it is perfectly ok to write 

```
sum.Add(sum, x)

```
to accumulate values x in a sum. 

(By always passing in a result value via the receiver, memory use can be much better controlled. Instead of having to allocate new memory for each result, an operation can reuse the space allocated for the result value, and overwrite that value with the new result in the process.) 

Notational convention: Incoming method parameters (including the receiver) are named consistently in the API to clarify their use. Incoming operands are usually named x, y, a, b, and so on, but never z. A parameter specifying the result is named z (typically the receiver). 

For instance, the arguments for (*Int).Add are named x and y, and because the receiver specifies the result destination, it is called z: 

```
func (z *Int) Add(x, y *Int) *Int

```
Methods of this form typically return the incoming receiver as well, to enable simple call chaining. 

Methods which don't require a result value to be passed in (for instance, Int.Sign), simply return the result. In this case, the receiver is typically the first operand, named x: 

```
func (x *Int) Sign() int

```
Various methods support conversions between strings and corresponding numeric values, and vice versa: *Int, *Rat, and *Float values implement the Stringer interface for a (default) string representation of the value, but also provide SetString methods to initialize a value from a string in a variety of supported formats (see the respective SetString documentation). 

Finally, *Int, *Rat, and *Float satisfy the fmt package's Scanner interface for scanning and (except for *Rat) the Formatter interface for formatted printing. 

## Index

* [Constants](#const)
    * [const Above](#Above)
    * [const AwayFromZero](#AwayFromZero)
    * [const Below](#Below)
    * [const Exact](#Exact)
    * [const MaxBase](#MaxBase)
    * [const MaxExp](#MaxExp)
    * [const MaxPrec](#MaxPrec)
    * [const MinExp](#MinExp)
    * [const ToNearestAway](#ToNearestAway)
    * [const ToNearestEven](#ToNearestEven)
    * [const ToNegativeInf](#ToNegativeInf)
    * [const ToPositiveInf](#ToPositiveInf)
    * [const ToZero](#ToZero)
    * [const above1e23](#above1e23)
    * [const below1e23](#below1e23)
    * [const debugFloat](#debugFloat)
    * [const digits](#digits)
    * [const divRecursiveThreshold](#divRecursiveThreshold)
    * [const finite](#finite)
    * [const floatGobVersion](#floatGobVersion)
    * [const inf](#inf)
    * [const intGobVersion](#intGobVersion)
    * [const issue42838Value](#issue42838Value)
    * [const maxBaseSmall](#maxBaseSmall)
    * [const maxShift](#maxShift)
    * [const ratGobVersion](#ratGobVersion)
    * [const sqrModeBasic](#sqrModeBasic)
    * [const sqrModeKaratsuba](#sqrModeKaratsuba)
    * [const sqrModeMul](#sqrModeMul)
    * [const testsNumber](#testsNumber)
    * [const zero](#zero)
    * [const _Accuracy_name](#_Accuracy_name)
    * [const _B](#_B)
    * [const _M](#_M)
    * [const _RoundingMode_name](#_RoundingMode_name)
    * [const _S](#_S)
    * [const _W](#_W)
* [Variables](#var)
    * [var argshlVU](#argshlVU)
    * [var argshlVUIn](#argshlVUIn)
    * [var argshlVUr0](#argshlVUr0)
    * [var argshlVUr1](#argshlVUr1)
    * [var argshlVUrWm1](#argshlVUrWm1)
    * [var argshrVU](#argshrVU)
    * [var argshrVUIn](#argshrVUIn)
    * [var argshrVUr0](#argshrVUr0)
    * [var argshrVUr1](#argshrVUr1)
    * [var argshrVUrWm1](#argshrVUrWm1)
    * [var basicSqrThreshold](#basicSqrThreshold)
    * [var benchSizes](#benchSizes)
    * [var bitLenTests](#bitLenTests)
    * [var bitTests](#bitTests)
    * [var bitsList](#bitsList)
    * [var bitsetTests](#bitsetTests)
    * [var bitwiseTests](#bitwiseTests)
    * [var cacheBase10](#cacheBase10)
    * [var calibrate](#calibrate)
    * [var cmpAbsTests](#cmpAbsTests)
    * [var cmpTests](#cmpTests)
    * [var composites](#composites)
    * [var divWWTests](#divWWTests)
    * [var divisionSignsTests](#divisionSignsTests)
    * [var encodingTests](#encodingTests)
    * [var errInvalSep](#errInvalSep)
    * [var errNoDigits](#errNoDigits)
    * [var expNNTests](#expNNTests)
    * [var expTests](#expTests)
    * [var exponentTests](#exponentTests)
    * [var fiboNums](#fiboNums)
    * [var float64inputs](#float64inputs)
    * [var floatStringTests](#floatStringTests)
    * [var floatVals](#floatVals)
    * [var floatZero](#floatZero)
    * [var formatTests](#formatTests)
    * [var gcdTests](#gcdTests)
    * [var int64Tests](#int64Tests)
    * [var intOne](#intOne)
    * [var isRaceBuilder](#isRaceBuilder)
    * [var karatsubaSqrThreshold](#karatsubaSqrThreshold)
    * [var karatsubaThreshold](#karatsubaThreshold)
    * [var leafSize](#leafSize)
    * [var leftShiftTests](#leftShiftTests)
    * [var long](#long)
    * [var lshTests](#lshTests)
    * [var lshVW](#lshVW)
    * [var modInverseTests](#modInverseTests)
    * [var modWTests32](#modWTests32)
    * [var modWTests64](#modWTests64)
    * [var montgomeryTests](#montgomeryTests)
    * [var mulAddWWWTests](#mulAddWWWTests)
    * [var mulBenchSizes](#mulBenchSizes)
    * [var mulRangesN](#mulRangesN)
    * [var mulRangesZ](#mulRangesZ)
    * [var mulWWTests](#mulWWTests)
    * [var natFive](#natFive)
    * [var natOne](#natOne)
    * [var natPool](#natPool)
    * [var natScanTests](#natScanTests)
    * [var natTen](#natTen)
    * [var natTwo](#natTwo)
    * [var notTests](#notTests)
    * [var pi](#pi)
    * [var pow5tab](#pow5tab)
    * [var precList](#precList)
    * [var primes](#primes)
    * [var prodNN](#prodNN)
    * [var prodVWW](#prodVWW)
    * [var prodZZ](#prodZZ)
    * [var quoTests](#quoTests)
    * [var ratBinTests](#ratBinTests)
    * [var ratCmpTests](#ratCmpTests)
    * [var ratDenoms](#ratDenoms)
    * [var ratNums](#ratNums)
    * [var ratZero](#ratZero)
    * [var rightShiftTests](#rightShiftTests)
    * [var rnd](#rnd)
    * [var rshTests](#rshTests)
    * [var rshVW](#rshVW)
    * [var scanTests](#scanTests)
    * [var setFrac64Tests](#setFrac64Tests)
    * [var setStringTests](#setStringTests)
    * [var setStringTests2](#setStringTests2)
    * [var sink](#sink)
    * [var sqrBenchSizes](#sqrBenchSizes)
    * [var stickyTests](#stickyTests)
    * [var strTests](#strTests)
    * [var stringTests](#stringTests)
    * [var sumNN](#sumNN)
    * [var sumVV](#sumVV)
    * [var sumVW](#sumVW)
    * [var sumZZ](#sumZZ)
    * [var support_adx](#support_adx)
    * [var threeOnce](#threeOnce)
    * [var tzbTests](#tzbTests)
    * [var uint64Tests](#uint64Tests)
    * [var zero_](#zero_)
    * [var _Accuracy_index](#_Accuracy_index)
    * [var _RoundingMode_index](#_RoundingMode_index)
* [Types](#type)
    * [type Accuracy int8](#Accuracy)
        * [func makeAcc(above bool) Accuracy](#makeAcc)
        * [func (i Accuracy) String() string](#Accuracy.String)
    * [type Bits []int](#Bits)
        * [func (bits Bits) Float() *Float](#Bits.Float)
        * [func (x Bits) add(y Bits) Bits](#Bits.add)
        * [func (x Bits) mul(y Bits) Bits](#Bits.mul)
        * [func (x Bits) norm() Bits](#Bits.norm)
        * [func (x Bits) round(prec uint, mode RoundingMode) *Float](#Bits.round)
    * [type ErrNaN struct](#ErrNaN)
        * [func (err ErrNaN) Error() string](#ErrNaN.Error)
    * [type Float struct](#Float)
        * [func NewFloat(x float64) *Float](#NewFloat)
        * [func ParseFloat(s string, base int, prec uint, mode RoundingMode) (f *Float, b int, err error)](#ParseFloat)
        * [func makeFloat(s string) *Float](#makeFloat)
        * [func newFloat(prec2 uint32) *Float](#newFloat)
        * [func three() *Float](#three)
        * [func (z *Float) Abs(x *Float) *Float](#Float.Abs)
        * [func (x *Float) Acc() Accuracy](#Float.Acc)
        * [func (z *Float) Add(x, y *Float) *Float](#Float.Add)
        * [func (x *Float) Append(buf []byte, fmt byte, prec int) []byte](#Float.Append)
        * [func (x *Float) Cmp(y *Float) int](#Float.Cmp)
        * [func (z *Float) Copy(x *Float) *Float](#Float.Copy)
        * [func (x *Float) Float32() (float32, Accuracy)](#Float.Float32)
        * [func (x *Float) Float64() (float64, Accuracy)](#Float.Float64)
        * [func (x *Float) Format(s fmt.State, format rune)](#Float.Format)
        * [func (z *Float) GobDecode(buf []byte) error](#Float.GobDecode)
        * [func (x *Float) GobEncode() ([]byte, error)](#Float.GobEncode)
        * [func (x *Float) Int(z *Int) (*Int, Accuracy)](#Float.Int)
        * [func (x *Float) Int64() (int64, Accuracy)](#Float.Int64)
        * [func (x *Float) IsInf() bool](#Float.IsInf)
        * [func (x *Float) IsInt() bool](#Float.IsInt)
        * [func (x *Float) MantExp(mant *Float) (exp int)](#Float.MantExp)
        * [func (x *Float) MarshalText() (text []byte, err error)](#Float.MarshalText)
        * [func (x *Float) MinPrec() uint](#Float.MinPrec)
        * [func (x *Float) Mode() RoundingMode](#Float.Mode)
        * [func (z *Float) Mul(x, y *Float) *Float](#Float.Mul)
        * [func (z *Float) Neg(x *Float) *Float](#Float.Neg)
        * [func (z *Float) Parse(s string, base int) (f *Float, b int, err error)](#Float.Parse)
        * [func (x *Float) Prec() uint](#Float.Prec)
        * [func (z *Float) Quo(x, y *Float) *Float](#Float.Quo)
        * [func (x *Float) Rat(z *Rat) (*Rat, Accuracy)](#Float.Rat)
        * [func (z *Float) Scan(s fmt.ScanState, ch rune) error](#Float.Scan)
        * [func (z *Float) Set(x *Float) *Float](#Float.Set)
        * [func (z *Float) SetFloat64(x float64) *Float](#Float.SetFloat64)
        * [func (z *Float) SetInf(signbit bool) *Float](#Float.SetInf)
        * [func (z *Float) SetInt(x *Int) *Float](#Float.SetInt)
        * [func (z *Float) SetInt64(x int64) *Float](#Float.SetInt64)
        * [func (z *Float) SetMantExp(mant *Float, exp int) *Float](#Float.SetMantExp)
        * [func (z *Float) SetMode(mode RoundingMode) *Float](#Float.SetMode)
        * [func (z *Float) SetPrec(prec uint) *Float](#Float.SetPrec)
        * [func (z *Float) SetRat(x *Rat) *Float](#Float.SetRat)
        * [func (z *Float) SetString(s string) (*Float, bool)](#Float.SetString)
        * [func (z *Float) SetUint64(x uint64) *Float](#Float.SetUint64)
        * [func (x *Float) Sign() int](#Float.Sign)
        * [func (x *Float) Signbit() bool](#Float.Signbit)
        * [func (z *Float) Sqrt(x *Float) *Float](#Float.Sqrt)
        * [func (x *Float) String() string](#Float.String)
        * [func (z *Float) Sub(x, y *Float) *Float](#Float.Sub)
        * [func (x *Float) Text(format byte, prec int) string](#Float.Text)
        * [func (x *Float) Uint64() (uint64, Accuracy)](#Float.Uint64)
        * [func (z *Float) UnmarshalText(text []byte) error](#Float.UnmarshalText)
        * [func (x *Float) fmtB(buf []byte) []byte](#Float.fmtB)
        * [func (x *Float) fmtP(buf []byte) []byte](#Float.fmtP)
        * [func (x *Float) fmtX(buf []byte, prec int) []byte](#Float.fmtX)
        * [func (x *Float) int64() int64](#Float.int64)
        * [func (x *Float) ord() int](#Float.ord)
        * [func (z *Float) pow5(n uint64) *Float](#Float.pow5)
        * [func (z *Float) round(sbit uint)](#Float.round)
        * [func (z *Float) scan(r io.ByteScanner, base int) (f *Float, b int, err error)](#Float.scan)
        * [func (z *Float) setBits64(neg bool, x uint64) *Float](#Float.setBits64)
        * [func (z *Float) setExpAndRound(exp int64, sbit uint)](#Float.setExpAndRound)
        * [func (z *Float) sqrtInverse(x *Float)](#Float.sqrtInverse)
        * [func (z *Float) uadd(x, y *Float)](#Float.uadd)
        * [func (x *Float) ucmp(y *Float) int](#Float.ucmp)
        * [func (x *Float) uint64() uint64](#Float.uint64)
        * [func (z *Float) umul(x, y *Float)](#Float.umul)
        * [func (z *Float) uquo(x, y *Float)](#Float.uquo)
        * [func (z *Float) usub(x, y *Float)](#Float.usub)
        * [func (x *Float) validate()](#Float.validate)
    * [type Int struct](#Int)
        * [func NewInt(x int64) *Int](#NewInt)
        * [func altSetBit(z *Int, x *Int, i int, b uint) *Int](#altSetBit)
        * [func euclidExtGCD(a, b *Int) (g, x, y *Int)](#euclidExtGCD)
        * [func randInt(r *rand.Rand, size uint) *Int](#randInt)
        * [func tri(n uint) *Int](#tri)
        * [func (z *Int) Abs(x *Int) *Int](#Int.Abs)
        * [func (z *Int) Add(x, y *Int) *Int](#Int.Add)
        * [func (z *Int) And(x, y *Int) *Int](#Int.And)
        * [func (z *Int) AndNot(x, y *Int) *Int](#Int.AndNot)
        * [func (x *Int) Append(buf []byte, base int) []byte](#Int.Append)
        * [func (z *Int) Binomial(n, k int64) *Int](#Int.Binomial)
        * [func (x *Int) Bit(i int) uint](#Int.Bit)
        * [func (x *Int) BitLen() int](#Int.BitLen)
        * [func (x *Int) Bits() []Word](#Int.Bits)
        * [func (x *Int) Bytes() []byte](#Int.Bytes)
        * [func (x *Int) Cmp(y *Int) (r int)](#Int.Cmp)
        * [func (x *Int) CmpAbs(y *Int) int](#Int.CmpAbs)
        * [func (z *Int) Div(x, y *Int) *Int](#Int.Div)
        * [func (z *Int) DivMod(x, y, m *Int) (*Int, *Int)](#Int.DivMod)
        * [func (z *Int) Exp(x, y, m *Int) *Int](#Int.Exp)
        * [func (x *Int) FillBytes(buf []byte) []byte](#Int.FillBytes)
        * [func (x *Int) Format(s fmt.State, ch rune)](#Int.Format)
        * [func (z *Int) GCD(x, y, a, b *Int) *Int](#Int.GCD)
        * [func (z *Int) GobDecode(buf []byte) error](#Int.GobDecode)
        * [func (x *Int) GobEncode() ([]byte, error)](#Int.GobEncode)
        * [func (x *Int) Int64() int64](#Int.Int64)
        * [func (x *Int) IsInt64() bool](#Int.IsInt64)
        * [func (x *Int) IsUint64() bool](#Int.IsUint64)
        * [func (z *Int) Lsh(x *Int, n uint) *Int](#Int.Lsh)
        * [func (x *Int) MarshalJSON() ([]byte, error)](#Int.MarshalJSON)
        * [func (x *Int) MarshalText() (text []byte, err error)](#Int.MarshalText)
        * [func (z *Int) Mod(x, y *Int) *Int](#Int.Mod)
        * [func (z *Int) ModInverse(g, n *Int) *Int](#Int.ModInverse)
        * [func (z *Int) ModSqrt(x, p *Int) *Int](#Int.ModSqrt)
        * [func (z *Int) Mul(x, y *Int) *Int](#Int.Mul)
        * [func (z *Int) MulRange(a, b int64) *Int](#Int.MulRange)
        * [func (z *Int) Neg(x *Int) *Int](#Int.Neg)
        * [func (z *Int) Not(x *Int) *Int](#Int.Not)
        * [func (z *Int) Or(x, y *Int) *Int](#Int.Or)
        * [func (x *Int) ProbablyPrime(n int) bool](#Int.ProbablyPrime)
        * [func (z *Int) Quo(x, y *Int) *Int](#Int.Quo)
        * [func (z *Int) QuoRem(x, y, r *Int) (*Int, *Int)](#Int.QuoRem)
        * [func (z *Int) Rand(rnd *rand.Rand, n *Int) *Int](#Int.Rand)
        * [func (z *Int) Rem(x, y *Int) *Int](#Int.Rem)
        * [func (z *Int) Rsh(x *Int, n uint) *Int](#Int.Rsh)
        * [func (z *Int) Scan(s fmt.ScanState, ch rune) error](#Int.Scan)
        * [func (z *Int) Set(x *Int) *Int](#Int.Set)
        * [func (z *Int) SetBit(x *Int, i int, b uint) *Int](#Int.SetBit)
        * [func (z *Int) SetBits(abs []Word) *Int](#Int.SetBits)
        * [func (z *Int) SetBytes(buf []byte) *Int](#Int.SetBytes)
        * [func (z *Int) SetInt64(x int64) *Int](#Int.SetInt64)
        * [func (z *Int) SetString(s string, base int) (*Int, bool)](#Int.SetString)
        * [func (z *Int) SetUint64(x uint64) *Int](#Int.SetUint64)
        * [func (x *Int) Sign() int](#Int.Sign)
        * [func (z *Int) Sqrt(x *Int) *Int](#Int.Sqrt)
        * [func (x *Int) String() string](#Int.String)
        * [func (z *Int) Sub(x, y *Int) *Int](#Int.Sub)
        * [func (x *Int) Text(base int) string](#Int.Text)
        * [func (x *Int) TrailingZeroBits() uint](#Int.TrailingZeroBits)
        * [func (x *Int) Uint64() uint64](#Int.Uint64)
        * [func (z *Int) UnmarshalJSON(text []byte) error](#Int.UnmarshalJSON)
        * [func (z *Int) UnmarshalText(text []byte) error](#Int.UnmarshalText)
        * [func (z *Int) Xor(x, y *Int) *Int](#Int.Xor)
        * [func (z *Int) lehmerGCD(x, y, a, b *Int) *Int](#Int.lehmerGCD)
        * [func (z *Int) modSqrt3Mod4Prime(x, p *Int) *Int](#Int.modSqrt3Mod4Prime)
        * [func (z *Int) modSqrt5Mod8Prime(x, p *Int) *Int](#Int.modSqrt5Mod8Prime)
        * [func (z *Int) modSqrtTonelliShanks(x, p *Int) *Int](#Int.modSqrtTonelliShanks)
        * [func (z *Int) scaleDenom(x *Int, f nat)](#Int.scaleDenom)
        * [func (z *Int) scan(r io.ByteScanner, base int) (*Int, int, error)](#Int.scan)
        * [func (z *Int) setFromScanner(r io.ByteScanner, base int) (*Int, bool)](#Int.setFromScanner)
    * [type Rat struct](#Rat)
        * [func NewRat(a, b int64) *Rat](#NewRat)
        * [func delta(r *Rat, f float64) *Rat](#delta)
        * [func (z *Rat) Abs(x *Rat) *Rat](#Rat.Abs)
        * [func (z *Rat) Add(x, y *Rat) *Rat](#Rat.Add)
        * [func (x *Rat) Cmp(y *Rat) int](#Rat.Cmp)
        * [func (x *Rat) Denom() *Int](#Rat.Denom)
        * [func (x *Rat) Float32() (f float32, exact bool)](#Rat.Float32)
        * [func (x *Rat) Float64() (f float64, exact bool)](#Rat.Float64)
        * [func (x *Rat) FloatString(prec int) string](#Rat.FloatString)
        * [func (z *Rat) GobDecode(buf []byte) error](#Rat.GobDecode)
        * [func (x *Rat) GobEncode() ([]byte, error)](#Rat.GobEncode)
        * [func (z *Rat) Inv(x *Rat) *Rat](#Rat.Inv)
        * [func (x *Rat) IsInt() bool](#Rat.IsInt)
        * [func (x *Rat) MarshalText() (text []byte, err error)](#Rat.MarshalText)
        * [func (z *Rat) Mul(x, y *Rat) *Rat](#Rat.Mul)
        * [func (z *Rat) Neg(x *Rat) *Rat](#Rat.Neg)
        * [func (x *Rat) Num() *Int](#Rat.Num)
        * [func (z *Rat) Quo(x, y *Rat) *Rat](#Rat.Quo)
        * [func (x *Rat) RatString() string](#Rat.RatString)
        * [func (z *Rat) Scan(s fmt.ScanState, ch rune) error](#Rat.Scan)
        * [func (z *Rat) Set(x *Rat) *Rat](#Rat.Set)
        * [func (z *Rat) SetFloat64(f float64) *Rat](#Rat.SetFloat64)
        * [func (z *Rat) SetFrac(a, b *Int) *Rat](#Rat.SetFrac)
        * [func (z *Rat) SetFrac64(a, b int64) *Rat](#Rat.SetFrac64)
        * [func (z *Rat) SetInt(x *Int) *Rat](#Rat.SetInt)
        * [func (z *Rat) SetInt64(x int64) *Rat](#Rat.SetInt64)
        * [func (z *Rat) SetString(s string) (*Rat, bool)](#Rat.SetString)
        * [func (z *Rat) SetUint64(x uint64) *Rat](#Rat.SetUint64)
        * [func (x *Rat) Sign() int](#Rat.Sign)
        * [func (x *Rat) String() string](#Rat.String)
        * [func (z *Rat) Sub(x, y *Rat) *Rat](#Rat.Sub)
        * [func (z *Rat) UnmarshalText(text []byte) error](#Rat.UnmarshalText)
        * [func (x *Rat) marshal() []byte](#Rat.marshal)
        * [func (z *Rat) norm() *Rat](#Rat.norm)
    * [type RoundingMode byte](#RoundingMode)
        * [func (i RoundingMode) String() string](#RoundingMode.String)
    * [type StringTest struct](#StringTest)
    * [type Word uint](#Word)
        * [func addMulVVW(z, x []Word, y Word) (c Word)](#addMulVVW)
        * [func addMulVVW_g(z, x []Word, y Word) (c Word)](#addMulVVW_g)
        * [func addVV(z, x, y []Word) (c Word)](#addVV)
        * [func addVV_g(z, x, y []Word) (c Word)](#addVV_g)
        * [func addVW(z, x []Word, y Word) (c Word)](#addVW)
        * [func addVW_g(z, x []Word, y Word) (c Word)](#addVW_g)
        * [func addVWlarge(z, x []Word, y Word) (c Word)](#addVWlarge)
        * [func bigEndianWord(buf []byte) Word](#bigEndianWord)
        * [func divWVW(z []Word, xn Word, x []Word, y Word) (r Word)](#divWVW)
        * [func divWW(x1, x0, y, m Word) (q, r Word)](#divWW)
        * [func lehmerSimulate(A, B *Int) (u0, u1, v0, v1 Word, even bool)](#lehmerSimulate)
        * [func maxPow(b Word) (p Word, n int)](#maxPow)
        * [func mulAddVWW(z, x []Word, y, r Word) (c Word)](#mulAddVWW)
        * [func mulAddVWW_g(z, x []Word, y, r Word) (c Word)](#mulAddVWW_g)
        * [func mulAddWWW_g(x, y, c Word) (z1, z0 Word)](#mulAddWWW_g)
        * [func mulWW(x, y Word) (z1, z0 Word)](#mulWW)
        * [func mulWW_g(x, y Word) (z1, z0 Word)](#mulWW_g)
        * [func pow(x Word, n int) (p Word)](#pow)
        * [func reciprocalWord(d1 Word) Word](#reciprocalWord)
        * [func rndW() Word](#rndW)
        * [func shlVU(z, x []Word, s uint) (c Word)](#shlVU)
        * [func shlVU_g(z, x []Word, s uint) (c Word)](#shlVU_g)
        * [func shrVU(z, x []Word, s uint) (c Word)](#shrVU)
        * [func shrVU_g(z, x []Word, s uint) (c Word)](#shrVU_g)
        * [func subVV(z, x, y []Word) (c Word)](#subVV)
        * [func subVV_g(z, x, y []Word) (c Word)](#subVV_g)
        * [func subVW(z, x []Word, y Word) (c Word)](#subVW)
        * [func subVW_g(z, x []Word, y Word) (c Word)](#subVW_g)
        * [func subVWlarge(z, x []Word, y Word) (c Word)](#subVWlarge)
    * [type argNN struct](#argNN)
    * [type argVU struct](#argVU)
    * [type argVV struct](#argVV)
    * [type argVW struct](#argVW)
    * [type argVWW struct](#argVWW)
    * [type argWVW struct](#argWVW)
    * [type argZZ struct](#argZZ)
    * [type bitFun func(z *std/math/big.Int, x *std/math/big.Int, y *std/math/big.Int) *std/math/big.Int](#bitFun)
    * [type byteReader struct](#byteReader)
        * [func (r byteReader) ReadByte() (byte, error)](#byteReader.ReadByte)
        * [func (r byteReader) UnreadByte() error](#byteReader.UnreadByte)
    * [type decimal struct](#decimal)
        * [func (x *decimal) String() string](#decimal.String)
        * [func (d *decimal) at(i int) byte](#decimal.at)
        * [func (x *decimal) init(m nat, shift int)](#decimal.init.decimal.go)
        * [func (x *decimal) round(n int)](#decimal.round)
        * [func (x *decimal) roundDown(n int)](#decimal.roundDown)
        * [func (x *decimal) roundUp(n int)](#decimal.roundUp)
    * [type divisor struct](#divisor)
    * [type form byte](#form)
    * [type funNN func(z std/math/big.nat, x std/math/big.nat, y std/math/big.nat) std/math/big.nat](#funNN)
    * [type funVV func(z []std/math/big.Word, x []std/math/big.Word, y []std/math/big.Word) (c std/math/big.Word)](#funVV)
    * [type funVW func(z []std/math/big.Word, x []std/math/big.Word, y std/math/big.Word) (c std/math/big.Word)](#funVW)
        * [func makeFunVW(f func(z, x []Word, s uint) (c Word)) funVW](#makeFunVW)
    * [type funVWW func(z []std/math/big.Word, x []std/math/big.Word, y std/math/big.Word, r std/math/big.Word) (c std/math/big.Word)](#funVWW)
    * [type funWVW func(z []std/math/big.Word, xn std/math/big.Word, x []std/math/big.Word, y std/math/big.Word) (r std/math/big.Word)](#funWVW)
    * [type funZZ func(z *std/math/big.Int, x *std/math/big.Int, y *std/math/big.Int) *std/math/big.Int](#funZZ)
    * [type intShiftTest struct](#intShiftTest)
    * [type matrix struct](#matrix)
        * [func newHilbert(n int) *matrix](#newHilbert)
        * [func newInverseHilbert(n int) *matrix](#newInverseHilbert)
        * [func newMatrix(n, m int) *matrix](#newMatrix)
        * [func newUnit(n int) *matrix](#newUnit)
        * [func (a *matrix) String() string](#matrix.String)
        * [func (a *matrix) at(i, j int) *Rat](#matrix.at)
        * [func (a *matrix) eql(b *matrix) bool](#matrix.eql)
        * [func (a *matrix) mul(b *matrix) *matrix](#matrix.mul)
        * [func (a *matrix) set(i, j int, x *Rat)](#matrix.set)
    * [type modWTest struct](#modWTest)
    * [type nat []big.Word](#nat)
        * [func fibo(n int) nat](#fibo)
        * [func getNat(n int) *nat](#getNat)
        * [func mulDenom(z, x, y nat) nat](#mulDenom)
        * [func natFromString(s string) nat](#natFromString)
        * [func norm(x nat) nat](#norm)
        * [func rndNat(n int) nat](#rndNat)
        * [func rndNat1(n int) nat](#rndNat1)
        * [func (z nat) add(x, y nat) nat](#nat.add)
        * [func (z nat) and(x, y nat) nat](#nat.and)
        * [func (z nat) andNot(x, y nat) nat](#nat.andNot)
        * [func (x nat) bit(i uint) uint](#nat.bit)
        * [func (x nat) bitLen() int](#nat.bitLen)
        * [func (z nat) bytes(buf []byte) (i int)](#nat.bytes)
        * [func (z nat) clear()](#nat.clear)
        * [func (x nat) cmp(y nat) (r int)](#nat.cmp)
        * [func (q nat) convertWords(s []byte, b Word, ndigits int, bb Word, table []divisor)](#nat.convertWords)
        * [func (z nat) div(z2, u, v nat) (q, r nat)](#nat.div)
        * [func (q nat) divBasic(u, v nat)](#nat.divBasic)
        * [func (z nat) divLarge(u, uIn, vIn nat) (q, r nat)](#nat.divLarge)
        * [func (z nat) divRecursive(u, v nat)](#nat.divRecursive)
        * [func (z nat) divRecursiveStep(u, v nat, depth int, tmp *nat, temps []*nat)](#nat.divRecursiveStep)
        * [func (z nat) divW(x nat, y Word) (q nat, r Word)](#nat.divW)
        * [func (z nat) expNN(x, y, m nat) nat](#nat.expNN)
        * [func (z nat) expNNMontgomery(x, y, m nat) nat](#nat.expNNMontgomery)
        * [func (z nat) expNNWindowed(x, y, m nat) nat](#nat.expNNWindowed)
        * [func (z nat) expWW(x, y Word) nat](#nat.expWW)
        * [func (x nat) itoa(neg bool, base int) []byte](#nat.itoa)
        * [func (z nat) make(n int) nat](#nat.make)
        * [func (x nat) modW(d Word) (r Word)](#nat.modW)
        * [func (z nat) montgomery(x, y, m nat, k Word, n int) nat](#nat.montgomery)
        * [func (z nat) mul(x, y nat) nat](#nat.mul)
        * [func (z nat) mulAddWW(x nat, y, r Word) nat](#nat.mulAddWW)
        * [func (z nat) mulRange(a, b uint64) nat](#nat.mulRange)
        * [func (z nat) norm() nat](#nat.norm)
        * [func (z nat) or(x, y nat) nat](#nat.or)
        * [func (n nat) probablyPrimeLucas() bool](#nat.probablyPrimeLucas)
        * [func (n nat) probablyPrimeMillerRabin(reps int, force2 bool) bool](#nat.probablyPrimeMillerRabin)
        * [func (z nat) random(rand *rand.Rand, limit nat, n int) nat](#nat.random)
        * [func (z nat) scan(r io.ByteScanner, base int, fracOk bool) (res nat, b, count int, err error)](#nat.scan)
        * [func (z nat) set(x nat) nat](#nat.set)
        * [func (z nat) setBit(x nat, i uint, b uint) nat](#nat.setBit)
        * [func (z nat) setBytes(buf []byte) nat](#nat.setBytes)
        * [func (z nat) setUint64(x uint64) nat](#nat.setUint64)
        * [func (z nat) setWord(x Word) nat](#nat.setWord)
        * [func (z nat) shl(x nat, s uint) nat](#nat.shl)
        * [func (z nat) shr(x nat, s uint) nat](#nat.shr)
        * [func (z nat) sqr(x nat) nat](#nat.sqr)
        * [func (z nat) sqrt(x nat) nat](#nat.sqrt)
        * [func (x nat) sticky(i uint) uint](#nat.sticky)
        * [func (z nat) sub(x, y nat) nat](#nat.sub)
        * [func (x nat) trailingZeroBits() uint](#nat.trailingZeroBits)
        * [func (x nat) utoa(base int) []byte](#nat.utoa)
        * [func (z nat) xor(x, y nat) nat](#nat.xor)
    * [type ratBinArg struct](#ratBinArg)
    * [type ratBinFun func(z *std/math/big.Rat, x *std/math/big.Rat, y *std/math/big.Rat) *std/math/big.Rat](#ratBinFun)
    * [type shiftTest struct](#shiftTest)
* [Functions](#func)
    * [func BenchmarkAddMulVVW(b *testing.B)](#BenchmarkAddMulVVW)
    * [func BenchmarkAddVV(b *testing.B)](#BenchmarkAddVV)
    * [func BenchmarkAddVW(b *testing.B)](#BenchmarkAddVW)
    * [func BenchmarkAddVWext(b *testing.B)](#BenchmarkAddVWext)
    * [func BenchmarkBinomial(b *testing.B)](#BenchmarkBinomial)
    * [func BenchmarkBitset(b *testing.B)](#BenchmarkBitset)
    * [func BenchmarkBitsetNeg(b *testing.B)](#BenchmarkBitsetNeg)
    * [func BenchmarkBitsetNegOrig(b *testing.B)](#BenchmarkBitsetNegOrig)
    * [func BenchmarkBitsetOrig(b *testing.B)](#BenchmarkBitsetOrig)
    * [func BenchmarkDecimalConversion(b *testing.B)](#BenchmarkDecimalConversion)
    * [func BenchmarkDiv(b *testing.B)](#BenchmarkDiv)
    * [func BenchmarkDivWVW(b *testing.B)](#BenchmarkDivWVW)
    * [func BenchmarkExp(b *testing.B)](#BenchmarkExp)
    * [func BenchmarkExp2(b *testing.B)](#BenchmarkExp2)
    * [func BenchmarkExp3Power(b *testing.B)](#BenchmarkExp3Power)
    * [func BenchmarkFibo(b *testing.B)](#BenchmarkFibo)
    * [func BenchmarkFloatAdd(b *testing.B)](#BenchmarkFloatAdd)
    * [func BenchmarkFloatSqrt(b *testing.B)](#BenchmarkFloatSqrt)
    * [func BenchmarkFloatString(b *testing.B)](#BenchmarkFloatString)
    * [func BenchmarkFloatSub(b *testing.B)](#BenchmarkFloatSub)
    * [func BenchmarkGCD100000x100000(b *testing.B)](#BenchmarkGCD100000x100000)
    * [func BenchmarkGCD10000x10000(b *testing.B)](#BenchmarkGCD10000x10000)
    * [func BenchmarkGCD10000x100000(b *testing.B)](#BenchmarkGCD10000x100000)
    * [func BenchmarkGCD1000x1000(b *testing.B)](#BenchmarkGCD1000x1000)
    * [func BenchmarkGCD1000x10000(b *testing.B)](#BenchmarkGCD1000x10000)
    * [func BenchmarkGCD1000x100000(b *testing.B)](#BenchmarkGCD1000x100000)
    * [func BenchmarkGCD100x100(b *testing.B)](#BenchmarkGCD100x100)
    * [func BenchmarkGCD100x1000(b *testing.B)](#BenchmarkGCD100x1000)
    * [func BenchmarkGCD100x10000(b *testing.B)](#BenchmarkGCD100x10000)
    * [func BenchmarkGCD100x100000(b *testing.B)](#BenchmarkGCD100x100000)
    * [func BenchmarkGCD10x10(b *testing.B)](#BenchmarkGCD10x10)
    * [func BenchmarkGCD10x100(b *testing.B)](#BenchmarkGCD10x100)
    * [func BenchmarkGCD10x1000(b *testing.B)](#BenchmarkGCD10x1000)
    * [func BenchmarkGCD10x10000(b *testing.B)](#BenchmarkGCD10x10000)
    * [func BenchmarkGCD10x100000(b *testing.B)](#BenchmarkGCD10x100000)
    * [func BenchmarkHilbert(b *testing.B)](#BenchmarkHilbert)
    * [func BenchmarkIntSqr(b *testing.B)](#BenchmarkIntSqr)
    * [func BenchmarkLeafSize(b *testing.B)](#BenchmarkLeafSize)
    * [func BenchmarkModInverse(b *testing.B)](#BenchmarkModInverse)
    * [func BenchmarkModSqrt225_3Mod4(b *testing.B)](#BenchmarkModSqrt225_3Mod4)
    * [func BenchmarkModSqrt225_Tonelli(b *testing.B)](#BenchmarkModSqrt225_Tonelli)
    * [func BenchmarkModSqrt231_5Mod8(b *testing.B)](#BenchmarkModSqrt231_5Mod8)
    * [func BenchmarkModSqrt231_Tonelli(b *testing.B)](#BenchmarkModSqrt231_Tonelli)
    * [func BenchmarkMul(b *testing.B)](#BenchmarkMul)
    * [func BenchmarkMulAddVWW(b *testing.B)](#BenchmarkMulAddVWW)
    * [func BenchmarkNatMul(b *testing.B)](#BenchmarkNatMul)
    * [func BenchmarkNatSetBytes(b *testing.B)](#BenchmarkNatSetBytes)
    * [func BenchmarkNatSqr(b *testing.B)](#BenchmarkNatSqr)
    * [func BenchmarkNonZeroShifts(b *testing.B)](#BenchmarkNonZeroShifts)
    * [func BenchmarkParseFloatLargeExp(b *testing.B)](#BenchmarkParseFloatLargeExp)
    * [func BenchmarkParseFloatSmallExp(b *testing.B)](#BenchmarkParseFloatSmallExp)
    * [func BenchmarkProbablyPrime(b *testing.B)](#BenchmarkProbablyPrime)
    * [func BenchmarkQuoRem(b *testing.B)](#BenchmarkQuoRem)
    * [func BenchmarkRatCmp(b *testing.B)](#BenchmarkRatCmp)
    * [func BenchmarkScan(b *testing.B)](#BenchmarkScan)
    * [func BenchmarkScanPi(b *testing.B)](#BenchmarkScanPi)
    * [func BenchmarkSqrt(b *testing.B)](#BenchmarkSqrt)
    * [func BenchmarkString(b *testing.B)](#BenchmarkString)
    * [func BenchmarkStringPiParallel(b *testing.B)](#BenchmarkStringPiParallel)
    * [func BenchmarkSubVV(b *testing.B)](#BenchmarkSubVV)
    * [func BenchmarkSubVW(b *testing.B)](#BenchmarkSubVW)
    * [func BenchmarkSubVWext(b *testing.B)](#BenchmarkSubVWext)
    * [func BenchmarkZeroShifts(b *testing.B)](#BenchmarkZeroShifts)
    * [func Jacobi(x, y *Int) int](#Jacobi)
    * [func LeafSizeHelper(b *testing.B, base, size int)](#LeafSizeHelper)
    * [func TestAbsZ(t *testing.T)](#TestAbsZ)
    * [func TestAppendText(t *testing.T)](#TestAppendText)
    * [func TestBinomial(t *testing.T)](#TestBinomial)
    * [func TestBit(t *testing.T)](#TestBit)
    * [func TestBitLen(t *testing.T)](#TestBitLen)
    * [func TestBitSet(t *testing.T)](#TestBitSet)
    * [func TestBits(t *testing.T)](#TestBits)
    * [func TestBitwise(t *testing.T)](#TestBitwise)
    * [func TestBytes(t *testing.T)](#TestBytes)
    * [func TestCalibrate(t *testing.T)](#TestCalibrate)
    * [func TestCmp(t *testing.T)](#TestCmp)
    * [func TestCmpAbs(t *testing.T)](#TestCmpAbs)
    * [func TestDecimalInit(t *testing.T)](#TestDecimalInit)
    * [func TestDecimalRounding(t *testing.T)](#TestDecimalRounding)
    * [func TestDecimalString(t *testing.T)](#TestDecimalString)
    * [func TestDivWW(t *testing.T)](#TestDivWW)
    * [func TestDivisionSigns(t *testing.T)](#TestDivisionSigns)
    * [func TestExp(t *testing.T)](#TestExp)
    * [func TestExpNN(t *testing.T)](#TestExpNN)
    * [func TestFibo(t *testing.T)](#TestFibo)
    * [func TestFillBytes(t *testing.T)](#TestFillBytes)
    * [func TestFloat32Distribution(t *testing.T)](#TestFloat32Distribution)
    * [func TestFloat32SpecialCases(t *testing.T)](#TestFloat32SpecialCases)
    * [func TestFloat64Distribution(t *testing.T)](#TestFloat64Distribution)
    * [func TestFloat64SpecialCases(t *testing.T)](#TestFloat64SpecialCases)
    * [func TestFloat64Text(t *testing.T)](#TestFloat64Text)
    * [func TestFloatAbs(t *testing.T)](#TestFloatAbs)
    * [func TestFloatAdd(t *testing.T)](#TestFloatAdd)
    * [func TestFloatAdd32(t *testing.T)](#TestFloatAdd32)
    * [func TestFloatAdd64(t *testing.T)](#TestFloatAdd64)
    * [func TestFloatAddRoundZero(t *testing.T)](#TestFloatAddRoundZero)
    * [func TestFloatArithmeticOverflow(t *testing.T)](#TestFloatArithmeticOverflow)
    * [func TestFloatArithmeticRounding(t *testing.T)](#TestFloatArithmeticRounding)
    * [func TestFloatArithmeticSpecialValues(t *testing.T)](#TestFloatArithmeticSpecialValues)
    * [func TestFloatCmpSpecialValues(t *testing.T)](#TestFloatCmpSpecialValues)
    * [func TestFloatCorruptGob(t *testing.T)](#TestFloatCorruptGob)
    * [func TestFloatFloat32(t *testing.T)](#TestFloatFloat32)
    * [func TestFloatFloat64(t *testing.T)](#TestFloatFloat64)
    * [func TestFloatFormat(t *testing.T)](#TestFloatFormat)
    * [func TestFloatGobEncoding(t *testing.T)](#TestFloatGobEncoding)
    * [func TestFloatInc(t *testing.T)](#TestFloatInc)
    * [func TestFloatInt(t *testing.T)](#TestFloatInt)
    * [func TestFloatInt64(t *testing.T)](#TestFloatInt64)
    * [func TestFloatIsInt(t *testing.T)](#TestFloatIsInt)
    * [func TestFloatJSONEncoding(t *testing.T)](#TestFloatJSONEncoding)
    * [func TestFloatMantExp(t *testing.T)](#TestFloatMantExp)
    * [func TestFloatMantExpAliasing(t *testing.T)](#TestFloatMantExpAliasing)
    * [func TestFloatMinPrec(t *testing.T)](#TestFloatMinPrec)
    * [func TestFloatMul(t *testing.T)](#TestFloatMul)
    * [func TestFloatMul64(t *testing.T)](#TestFloatMul64)
    * [func TestFloatNeg(t *testing.T)](#TestFloatNeg)
    * [func TestFloatPredicates(t *testing.T)](#TestFloatPredicates)
    * [func TestFloatQuo(t *testing.T)](#TestFloatQuo)
    * [func TestFloatQuoSmoke(t *testing.T)](#TestFloatQuoSmoke)
    * [func TestFloatRat(t *testing.T)](#TestFloatRat)
    * [func TestFloatRound(t *testing.T)](#TestFloatRound)
    * [func TestFloatRound24(t *testing.T)](#TestFloatRound24)
    * [func TestFloatScan(t *testing.T)](#TestFloatScan)
    * [func TestFloatSetFloat64(t *testing.T)](#TestFloatSetFloat64)
    * [func TestFloatSetFloat64String(t *testing.T)](#TestFloatSetFloat64String)
    * [func TestFloatSetInf(t *testing.T)](#TestFloatSetInf)
    * [func TestFloatSetInt(t *testing.T)](#TestFloatSetInt)
    * [func TestFloatSetInt64(t *testing.T)](#TestFloatSetInt64)
    * [func TestFloatSetMantExp(t *testing.T)](#TestFloatSetMantExp)
    * [func TestFloatSetPrec(t *testing.T)](#TestFloatSetPrec)
    * [func TestFloatSetRat(t *testing.T)](#TestFloatSetRat)
    * [func TestFloatSetUint64(t *testing.T)](#TestFloatSetUint64)
    * [func TestFloatSign(t *testing.T)](#TestFloatSign)
    * [func TestFloatSqrt(t *testing.T)](#TestFloatSqrt)
    * [func TestFloatSqrt64(t *testing.T)](#TestFloatSqrt64)
    * [func TestFloatSqrtSpecial(t *testing.T)](#TestFloatSqrtSpecial)
    * [func TestFloatString(t *testing.T)](#TestFloatString)
    * [func TestFloatText(t *testing.T)](#TestFloatText)
    * [func TestFloatUint64(t *testing.T)](#TestFloatUint64)
    * [func TestFloatZeroValue(t *testing.T)](#TestFloatZeroValue)
    * [func TestFormat(t *testing.T)](#TestFormat)
    * [func TestFromBits(t *testing.T)](#TestFromBits)
    * [func TestFunNN(t *testing.T)](#TestFunNN)
    * [func TestFunVV(t *testing.T)](#TestFunVV)
    * [func TestFunVW(t *testing.T)](#TestFunVW)
    * [func TestFunVWExt(t *testing.T)](#TestFunVWExt)
    * [func TestFunVWW(t *testing.T)](#TestFunVWW)
    * [func TestGcd(t *testing.T)](#TestGcd)
    * [func TestGetString(t *testing.T)](#TestGetString)
    * [func TestGobEncodingNilIntInSlice(t *testing.T)](#TestGobEncodingNilIntInSlice)
    * [func TestGobEncodingNilRatInSlice(t *testing.T)](#TestGobEncodingNilRatInSlice)
    * [func TestHilbert(t *testing.T)](#TestHilbert)
    * [func TestInt64(t *testing.T)](#TestInt64)
    * [func TestIntCmpSelf(t *testing.T)](#TestIntCmpSelf)
    * [func TestIntGobEncoding(t *testing.T)](#TestIntGobEncoding)
    * [func TestIntJSONEncoding(t *testing.T)](#TestIntJSONEncoding)
    * [func TestIntText(t *testing.T)](#TestIntText)
    * [func TestIntXMLEncoding(t *testing.T)](#TestIntXMLEncoding)
    * [func TestIsFinite(t *testing.T)](#TestIsFinite)
    * [func TestIsInt(t *testing.T)](#TestIsInt)
    * [func TestIssue20490(t *testing.T)](#TestIssue20490)
    * [func TestIssue22830(t *testing.T)](#TestIssue22830)
    * [func TestIssue2379(t *testing.T)](#TestIssue2379)
    * [func TestIssue2607(t *testing.T)](#TestIssue2607)
    * [func TestIssue31084(t *testing.T)](#TestIssue31084)
    * [func TestIssue31184(t *testing.T)](#TestIssue31184)
    * [func TestIssue34919(t *testing.T)](#TestIssue34919)
    * [func TestIssue3521(t *testing.T)](#TestIssue3521)
    * [func TestIssue37499(t *testing.T)](#TestIssue37499)
    * [func TestIssue42552(t *testing.T)](#TestIssue42552)
    * [func TestIssue42838(t *testing.T)](#TestIssue42838)
    * [func TestIssue45910(t *testing.T)](#TestIssue45910)
    * [func TestIssue6866(t *testing.T)](#TestIssue6866)
    * [func TestIssue820(t *testing.T)](#TestIssue820)
    * [func TestJacobi(t *testing.T)](#TestJacobi)
    * [func TestJacobiPanic(t *testing.T)](#TestJacobiPanic)
    * [func TestLinkerGC(t *testing.T)](#TestLinkerGC)
    * [func TestLsh(t *testing.T)](#TestLsh)
    * [func TestLshRsh(t *testing.T)](#TestLshRsh)
    * [func TestLshSelf(t *testing.T)](#TestLshSelf)
    * [func TestLucasPseudoprimes(t *testing.T)](#TestLucasPseudoprimes)
    * [func TestMaxBase(t *testing.T)](#TestMaxBase)
    * [func TestMillerRabinPseudoprimes(t *testing.T)](#TestMillerRabinPseudoprimes)
    * [func TestModInverse(t *testing.T)](#TestModInverse)
    * [func TestModSqrt(t *testing.T)](#TestModSqrt)
    * [func TestModW(t *testing.T)](#TestModW)
    * [func TestMontgomery(t *testing.T)](#TestMontgomery)
    * [func TestMul(t *testing.T)](#TestMul)
    * [func TestMulAddWWW(t *testing.T)](#TestMulAddWWW)
    * [func TestMulBits(t *testing.T)](#TestMulBits)
    * [func TestMulRangeN(t *testing.T)](#TestMulRangeN)
    * [func TestMulRangeZ(t *testing.T)](#TestMulRangeZ)
    * [func TestMulUnbalanced(t *testing.T)](#TestMulUnbalanced)
    * [func TestMulWW(t *testing.T)](#TestMulWW)
    * [func TestNLZ(t *testing.T)](#TestNLZ)
    * [func TestNatDiv(t *testing.T)](#TestNatDiv)
    * [func TestNormBits(t *testing.T)](#TestNormBits)
    * [func TestNot(t *testing.T)](#TestNot)
    * [func TestProbablyPrime(t *testing.T)](#TestProbablyPrime)
    * [func TestProdZZ(t *testing.T)](#TestProdZZ)
    * [func TestQuo(t *testing.T)](#TestQuo)
    * [func TestQuoStepD6(t *testing.T)](#TestQuoStepD6)
    * [func TestRatAbs(t *testing.T)](#TestRatAbs)
    * [func TestRatBin(t *testing.T)](#TestRatBin)
    * [func TestRatCmp(t *testing.T)](#TestRatCmp)
    * [func TestRatGobEncoding(t *testing.T)](#TestRatGobEncoding)
    * [func TestRatInv(t *testing.T)](#TestRatInv)
    * [func TestRatJSONEncoding(t *testing.T)](#TestRatJSONEncoding)
    * [func TestRatNeg(t *testing.T)](#TestRatNeg)
    * [func TestRatScan(t *testing.T)](#TestRatScan)
    * [func TestRatSetFrac64Rat(t *testing.T)](#TestRatSetFrac64Rat)
    * [func TestRatSetInt64(t *testing.T)](#TestRatSetInt64)
    * [func TestRatSetString(t *testing.T)](#TestRatSetString)
    * [func TestRatSetUint64(t *testing.T)](#TestRatSetUint64)
    * [func TestRatSign(t *testing.T)](#TestRatSign)
    * [func TestRatXMLEncoding(t *testing.T)](#TestRatXMLEncoding)
    * [func TestRsh(t *testing.T)](#TestRsh)
    * [func TestRshSelf(t *testing.T)](#TestRshSelf)
    * [func TestScan(t *testing.T)](#TestScan)
    * [func TestScanBase(t *testing.T)](#TestScanBase)
    * [func TestScanExponent(t *testing.T)](#TestScanExponent)
    * [func TestScanPi(t *testing.T)](#TestScanPi)
    * [func TestScanPiParallel(t *testing.T)](#TestScanPiParallel)
    * [func TestSet(t *testing.T)](#TestSet)
    * [func TestSetBytes(t *testing.T)](#TestSetBytes)
    * [func TestSetFloat64NonFinite(t *testing.T)](#TestSetFloat64NonFinite)
    * [func TestSetString(t *testing.T)](#TestSetString)
    * [func TestSetZ(t *testing.T)](#TestSetZ)
    * [func TestShiftLeft(t *testing.T)](#TestShiftLeft)
    * [func TestShiftOverlap(t *testing.T)](#TestShiftOverlap)
    * [func TestShiftRight(t *testing.T)](#TestShiftRight)
    * [func TestSignZ(t *testing.T)](#TestSignZ)
    * [func TestSqr(t *testing.T)](#TestSqr)
    * [func TestSqrt(t *testing.T)](#TestSqrt)
    * [func TestSticky(t *testing.T)](#TestSticky)
    * [func TestString(t *testing.T)](#TestString)
    * [func TestStringPowers(t *testing.T)](#TestStringPowers)
    * [func TestSumZZ(t *testing.T)](#TestSumZZ)
    * [func TestTrailingZeroBits(t *testing.T)](#TestTrailingZeroBits)
    * [func TestUint64(t *testing.T)](#TestUint64)
    * [func TestZeroRat(t *testing.T)](#TestZeroRat)
    * [func actualPrec(x float64) uint](#actualPrec)
    * [func addAt(z, x nat, i int)](#addAt)
    * [func alias(x, y nat) bool](#alias)
    * [func alike(x, y *Float) bool](#alike)
    * [func alike32(x, y float32) bool](#alike32)
    * [func alike64(x, y float64) bool](#alike64)
    * [func allocBytes(f func()) uint64](#allocBytes)
    * [func altBit(x *Int, i int) uint](#altBit)
    * [func appendZeros(buf []byte, n int) []byte](#appendZeros)
    * [func basicMul(z, x, y nat)](#basicMul)
    * [func basicSqr(z, x nat)](#basicSqr)
    * [func benchmarkDiv(b *testing.B, aSize, bSize int)](#benchmarkDiv)
    * [func benchmarkIntSqr(b *testing.B, nwords int)](#benchmarkIntSqr)
    * [func benchmarkNatMul(b *testing.B, nwords int)](#benchmarkNatMul)
    * [func benchmarkNatSqr(b *testing.B, nwords int)](#benchmarkNatSqr)
    * [func checkBytes(b []byte) bool](#checkBytes)
    * [func checkGcd(aBytes, bBytes []byte) bool](#checkGcd)
    * [func checkIsBestApprox32(t *testing.T, f float32, r *Rat) bool](#checkIsBestApprox32)
    * [func checkIsBestApprox64(t *testing.T, f float64, r *Rat) bool](#checkIsBestApprox64)
    * [func checkLehmerExtGcd(aBytes, bBytes []byte) bool](#checkLehmerExtGcd)
    * [func checkLehmerGcd(aBytes, bBytes []byte) bool](#checkLehmerGcd)
    * [func checkMul(a, b []byte) bool](#checkMul)
    * [func checkNonLossyRoundtrip32(t *testing.T, f float32)](#checkNonLossyRoundtrip32)
    * [func checkNonLossyRoundtrip64(t *testing.T, f float64)](#checkNonLossyRoundtrip64)
    * [func checkQuo(x, y []byte) bool](#checkQuo)
    * [func checkSetBytes(b []byte) bool](#checkSetBytes)
    * [func computeKaratsubaThresholds()](#computeKaratsubaThresholds)
    * [func computeSqrThreshold(from, to, step, nruns int, lower, upper string) int](#computeSqrThreshold)
    * [func cutSpace(r rune) rune](#cutSpace)
    * [func divisors(m int, b Word, ndigits int, bb Word) []divisor](#divisors)
    * [func doHilbert(t *testing.T, n int)](#doHilbert)
    * [func euclidUpdate(A, B, Ua, Ub, q, r, s, t *Int, extended bool)](#euclidUpdate)
    * [func fdiv(a, b float64) float64](#fdiv)
    * [func fmtE(buf []byte, fmt byte, prec int, d decimal) []byte](#fmtE)
    * [func fmtF(buf []byte, prec int, d decimal) []byte](#fmtF)
    * [func fnorm(m nat) int64](#fnorm)
    * [func format(base int) string](#format)
    * [func fromBinary(s string) int64](#fromBinary)
    * [func greaterThan(x1, x2, y1, y2 Word) bool](#greaterThan)
    * [func isEven32(f float32) bool](#isEven32)
    * [func isEven64(f float64) bool](#isEven64)
    * [func isFinite(f float64) bool](#isFinite)
    * [func isNormalized(x *Int) bool](#isNormalized)
    * [func itoa(x nat, base int) []byte](#itoa)
    * [func karatsuba(z, x, y nat)](#karatsuba)
    * [func karatsubaAdd(z, x nat, n int)](#karatsubaAdd)
    * [func karatsubaLen(n, threshold int) int](#karatsubaLen)
    * [func karatsubaLoad(b *testing.B)](#karatsubaLoad)
    * [func karatsubaSqr(z, x nat)](#karatsubaSqr)
    * [func karatsubaSub(z, x nat, n int)](#karatsubaSub)
    * [func lehmerUpdate(A, B, q, r, s, t *Int, u0, u1, v0, v1 Word, even bool)](#lehmerUpdate)
    * [func log2(x Word) int](#log2)
    * [func low32(x nat) uint32](#low32)
    * [func low64(x nat) uint64](#low64)
    * [func makeWordVec(e Word, n int) []Word](#makeWordVec)
    * [func max(x, y int) int](#max)
    * [func measureKaratsuba(th int) time.Duration](#measureKaratsuba)
    * [func measureSqr(words, nruns int, mode string) time.Duration](#measureSqr)
    * [func min(x, y int) int](#min)
    * [func msb32(x nat) uint32](#msb32)
    * [func msb64(x nat) uint64](#msb64)
    * [func mulBytes(x, y []byte) []byte](#mulBytes)
    * [func nlz(x Word) uint](#nlz)
    * [func putNat(x *nat)](#putNat)
    * [func quotToFloat32(a, b nat) (f float32, exact bool)](#quotToFloat32)
    * [func quotToFloat64(a, b nat) (f float64, exact bool)](#quotToFloat64)
    * [func ratTok(ch rune) bool](#ratTok)
    * [func resetTable(table []divisor)](#resetTable)
    * [func rndV(n int) []Word](#rndV)
    * [func roundShortest(d *decimal, x *Float)](#roundShortest)
    * [func runGCD(b *testing.B, aSize, bSize uint)](#runGCD)
    * [func runGCDExt(b *testing.B, aSize, bSize uint, calcXY bool)](#runGCDExt)
    * [func runModWTests(t *testing.T, tests []modWTest)](#runModWTests)
    * [func same(x, y nat) bool](#same)
    * [func scanExponent(r io.ByteScanner, base2ok, sepOk bool) (exp int64, base int, err error)](#scanExponent)
    * [func scanSign(r io.ByteScanner) (neg bool, err error)](#scanSign)
    * [func shouldRoundUp(x *decimal, n int) bool](#shouldRoundUp)
    * [func shr(x *decimal, s uint)](#shr)
    * [func testBitFun(t *testing.T, msg string, f bitFun, x, y *Int, exp string)](#testBitFun)
    * [func testBitFunSelf(t *testing.T, msg string, f bitFun, x, y *Int, exp string)](#testBitFunSelf)
    * [func testBitset(t *testing.T, x *Int)](#testBitset)
    * [func testFloatRound(t *testing.T, x, r int64, prec uint, mode RoundingMode)](#testFloatRound)
    * [func testFunNN(t *testing.T, msg string, f funNN, a argNN)](#testFunNN)
    * [func testFunVV(t *testing.T, msg string, f funVV, a argVV)](#testFunVV)
    * [func testFunVW(t *testing.T, msg string, f funVW, a argVW)](#testFunVW)
    * [func testFunVWW(t *testing.T, msg string, f funVWW, a argVWW)](#testFunVWW)
    * [func testFunVWext(t *testing.T, msg string, f funVW, f_g funVW, a argVW)](#testFunVWext)
    * [func testFunWVW(t *testing.T, msg string, f funWVW, a argWVW)](#testFunWVW)
    * [func testFunZZ(t *testing.T, msg string, f funZZ, a argZZ)](#testFunZZ)
    * [func testGcd(t *testing.T, d, x, y, a, b *Int)](#testGcd)
    * [func testModSqrt(t *testing.T, elt, mod, sq, sqrt *Int) bool](#testModSqrt)
    * [func testPseudoprimes(t *testing.T, name string, cond func(nat) bool, want []int)](#testPseudoprimes)
    * [func testRatBin(t *testing.T, i int, name string, f ratBinFun, a ratBinArg)](#testRatBin)
    * [func testShiftFunc(t *testing.T, f func(z, x []Word, s uint) Word, a argVU)](#testShiftFunc)
    * [func testSqr(t *testing.T, x nat)](#testSqr)
    * [func toBinary(x int64) string](#toBinary)
    * [func trim(x *decimal)](#trim)
    * [func umax32(x, y uint32) uint32](#umax32)
    * [func validateBinaryOperands(x, y *Float)](#validateBinaryOperands)
    * [func writeMultiple(s fmt.State, text string, count int)](#writeMultiple)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="Above" href="#Above">const Above</a>

```
searchKey: big.Above
tags: [constant number]
```

```Go
const Above Accuracy = +1
```

Constants describing the Accuracy of a Float. 

### <a id="AwayFromZero" href="#AwayFromZero">const AwayFromZero</a>

```
searchKey: big.AwayFromZero
tags: [constant number]
```

```Go
const AwayFromZero // no IEEE 754-2008 equivalent

```

These constants define supported rounding modes. 

### <a id="Below" href="#Below">const Below</a>

```
searchKey: big.Below
tags: [constant number]
```

```Go
const Below Accuracy = -1
```

Constants describing the Accuracy of a Float. 

### <a id="Exact" href="#Exact">const Exact</a>

```
searchKey: big.Exact
tags: [constant number]
```

```Go
const Exact Accuracy = 0
```

Constants describing the Accuracy of a Float. 

### <a id="MaxBase" href="#MaxBase">const MaxBase</a>

```
searchKey: big.MaxBase
tags: [constant number]
```

```Go
const MaxBase = 10 + ('z' - 'a' + 1) + ('Z' - 'A' + 1)
```

MaxBase is the largest number base accepted for string conversions. 

### <a id="MaxExp" href="#MaxExp">const MaxExp</a>

```
searchKey: big.MaxExp
tags: [constant number]
```

```Go
const MaxExp = math.MaxInt32 // largest supported exponent

```

Exponent and precision limits. 

### <a id="MaxPrec" href="#MaxPrec">const MaxPrec</a>

```
searchKey: big.MaxPrec
tags: [constant number]
```

```Go
const MaxPrec // largest (theoretically) supported precision; likely memory-limited
 = ...
```

Exponent and precision limits. 

### <a id="MinExp" href="#MinExp">const MinExp</a>

```
searchKey: big.MinExp
tags: [constant number]
```

```Go
const MinExp = math.MinInt32 // smallest supported exponent

```

Exponent and precision limits. 

### <a id="ToNearestAway" href="#ToNearestAway">const ToNearestAway</a>

```
searchKey: big.ToNearestAway
tags: [constant number]
```

```Go
const ToNearestAway // == IEEE 754-2008 roundTiesToAway

```

These constants define supported rounding modes. 

### <a id="ToNearestEven" href="#ToNearestEven">const ToNearestEven</a>

```
searchKey: big.ToNearestEven
tags: [constant number]
```

```Go
const ToNearestEven RoundingMode = iota // == IEEE 754-2008 roundTiesToEven

```

These constants define supported rounding modes. 

### <a id="ToNegativeInf" href="#ToNegativeInf">const ToNegativeInf</a>

```
searchKey: big.ToNegativeInf
tags: [constant number]
```

```Go
const ToNegativeInf // == IEEE 754-2008 roundTowardNegative

```

These constants define supported rounding modes. 

### <a id="ToPositiveInf" href="#ToPositiveInf">const ToPositiveInf</a>

```
searchKey: big.ToPositiveInf
tags: [constant number]
```

```Go
const ToPositiveInf // == IEEE 754-2008 roundTowardPositive

```

These constants define supported rounding modes. 

### <a id="ToZero" href="#ToZero">const ToZero</a>

```
searchKey: big.ToZero
tags: [constant number]
```

```Go
const ToZero // == IEEE 754-2008 roundTowardZero

```

These constants define supported rounding modes. 

### <a id="above1e23" href="#above1e23">const above1e23</a>

```
searchKey: big.above1e23
tags: [constant number private]
```

```Go
const above1e23 = 100000000000000008388608
```

### <a id="below1e23" href="#below1e23">const below1e23</a>

```
searchKey: big.below1e23
tags: [constant number private]
```

```Go
const below1e23 = 99999999999999974834176
```

### <a id="debugFloat" href="#debugFloat">const debugFloat</a>

```
searchKey: big.debugFloat
tags: [constant boolean private]
```

```Go
const debugFloat = false // enable for debugging

```

### <a id="digits" href="#digits">const digits</a>

```
searchKey: big.digits
tags: [constant string private]
```

```Go
const digits = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
```

### <a id="divRecursiveThreshold" href="#divRecursiveThreshold">const divRecursiveThreshold</a>

```
searchKey: big.divRecursiveThreshold
tags: [constant number private]
```

```Go
const divRecursiveThreshold = 100
```

divRecursiveThreshold is the number of divisor digits at which point divRecursive is faster than divBasic. 

### <a id="finite" href="#finite">const finite</a>

```
searchKey: big.finite
tags: [constant number private]
```

```Go
const finite
```

The form value order is relevant - do not change! 

### <a id="floatGobVersion" href="#floatGobVersion">const floatGobVersion</a>

```
searchKey: big.floatGobVersion
tags: [constant number private]
```

```Go
const floatGobVersion byte = 1
```

Gob codec version. Permits backward-compatible changes to the encoding. 

### <a id="inf" href="#inf">const inf</a>

```
searchKey: big.inf
tags: [constant number private]
```

```Go
const inf
```

The form value order is relevant - do not change! 

### <a id="intGobVersion" href="#intGobVersion">const intGobVersion</a>

```
searchKey: big.intGobVersion
tags: [constant number private]
```

```Go
const intGobVersion byte = 1
```

Gob codec version. Permits backward-compatible changes to the encoding. 

### <a id="issue42838Value" href="#issue42838Value">const issue42838Value</a>

```
searchKey: big.issue42838Value
tags: [constant string private]
```

```Go
const issue42838Value = ...
```

### <a id="maxBaseSmall" href="#maxBaseSmall">const maxBaseSmall</a>

```
searchKey: big.maxBaseSmall
tags: [constant number private]
```

```Go
const maxBaseSmall = 10 + ('z' - 'a' + 1)
```

### <a id="maxShift" href="#maxShift">const maxShift</a>

```
searchKey: big.maxShift
tags: [constant number private]
```

```Go
const maxShift = _W - 4
```

Maximum shift amount that can be done in one pass without overflow. A Word has _W bits and (1<<maxShift - 1)*10 + 9 must fit into Word. 

### <a id="ratGobVersion" href="#ratGobVersion">const ratGobVersion</a>

```
searchKey: big.ratGobVersion
tags: [constant number private]
```

```Go
const ratGobVersion byte = 1
```

Gob codec version. Permits backward-compatible changes to the encoding. 

### <a id="sqrModeBasic" href="#sqrModeBasic">const sqrModeBasic</a>

```
searchKey: big.sqrModeBasic
tags: [constant string private]
```

```Go
const sqrModeBasic = "basicSqr(x)"
```

### <a id="sqrModeKaratsuba" href="#sqrModeKaratsuba">const sqrModeKaratsuba</a>

```
searchKey: big.sqrModeKaratsuba
tags: [constant string private]
```

```Go
const sqrModeKaratsuba = "karatsubaSqr(x)"
```

### <a id="sqrModeMul" href="#sqrModeMul">const sqrModeMul</a>

```
searchKey: big.sqrModeMul
tags: [constant string private]
```

```Go
const sqrModeMul = "mul(x, x)"
```

### <a id="testsNumber" href="#testsNumber">const testsNumber</a>

```
searchKey: big.testsNumber
tags: [constant number private]
```

```Go
const testsNumber = 1 << 16
```

### <a id="zero" href="#zero">const zero</a>

```
searchKey: big.zero
tags: [constant number private]
```

```Go
const zero form = iota
```

The form value order is relevant - do not change! 

### <a id="_Accuracy_name" href="#_Accuracy_name">const _Accuracy_name</a>

```
searchKey: big._Accuracy_name
tags: [constant string private]
```

```Go
const _Accuracy_name = "BelowExactAbove"
```

### <a id="_B" href="#_B">const _B</a>

```
searchKey: big._B
tags: [constant number private]
```

```Go
const _B = 1 << _W // digit base

```

### <a id="_M" href="#_M">const _M</a>

```
searchKey: big._M
tags: [constant number private]
```

```Go
const _M = _B - 1 // digit mask

```

### <a id="_RoundingMode_name" href="#_RoundingMode_name">const _RoundingMode_name</a>

```
searchKey: big._RoundingMode_name
tags: [constant string private]
```

```Go
const _RoundingMode_name = "ToNearestEvenToNearestAwayToZeroAwayFromZeroToNegativeInfToPositiveInf"
```

### <a id="_S" href="#_S">const _S</a>

```
searchKey: big._S
tags: [constant number private]
```

```Go
const _S = _W / 8 // word size in bytes

```

### <a id="_W" href="#_W">const _W</a>

```
searchKey: big._W
tags: [constant number private]
```

```Go
const _W = bits.UintSize // word size in bits

```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="argshlVU" href="#argshlVU">var argshlVU</a>

```
searchKey: big.argshlVU
tags: [variable array struct private]
```

```Go
var argshlVU = ...
```

### <a id="argshlVUIn" href="#argshlVUIn">var argshlVUIn</a>

```
searchKey: big.argshlVUIn
tags: [variable array number private]
```

```Go
var argshlVUIn = []Word{1, 2, 4, 8, 16, 32, 64, 0, 0, 0}
```

### <a id="argshlVUr0" href="#argshlVUr0">var argshlVUr0</a>

```
searchKey: big.argshlVUr0
tags: [variable array number private]
```

```Go
var argshlVUr0 = []Word{1, 2, 4, 8, 16, 32, 64}
```

### <a id="argshlVUr1" href="#argshlVUr1">var argshlVUr1</a>

```
searchKey: big.argshlVUr1
tags: [variable array number private]
```

```Go
var argshlVUr1 = []Word{2, 4, 8, 16, 32, 64, 128}
```

### <a id="argshlVUrWm1" href="#argshlVUrWm1">var argshlVUrWm1</a>

```
searchKey: big.argshlVUrWm1
tags: [variable array number private]
```

```Go
var argshlVUrWm1 = []Word{1 << (_W - 1), 0, 1, 2, 4, 8, 16}
```

### <a id="argshrVU" href="#argshrVU">var argshrVU</a>

```
searchKey: big.argshrVU
tags: [variable array struct private]
```

```Go
var argshrVU = ...
```

### <a id="argshrVUIn" href="#argshrVUIn">var argshrVUIn</a>

```
searchKey: big.argshrVUIn
tags: [variable array number private]
```

```Go
var argshrVUIn = []Word{0, 0, 0, 1, 2, 4, 8, 16, 32, 64}
```

### <a id="argshrVUr0" href="#argshrVUr0">var argshrVUr0</a>

```
searchKey: big.argshrVUr0
tags: [variable array number private]
```

```Go
var argshrVUr0 = []Word{1, 2, 4, 8, 16, 32, 64}
```

### <a id="argshrVUr1" href="#argshrVUr1">var argshrVUr1</a>

```
searchKey: big.argshrVUr1
tags: [variable array number private]
```

```Go
var argshrVUr1 = []Word{0, 1, 2, 4, 8, 16, 32}
```

### <a id="argshrVUrWm1" href="#argshrVUrWm1">var argshrVUrWm1</a>

```
searchKey: big.argshrVUrWm1
tags: [variable array number private]
```

```Go
var argshrVUrWm1 = []Word{4, 8, 16, 32, 64, 128, 0}
```

### <a id="basicSqrThreshold" href="#basicSqrThreshold">var basicSqrThreshold</a>

```
searchKey: big.basicSqrThreshold
tags: [variable number private]
```

```Go
var basicSqrThreshold = 20 // computed by calibrate_test.go

```

Operands that are shorter than basicSqrThreshold are squared using "grade school" multiplication; for operands longer than karatsubaSqrThreshold we use the Karatsuba algorithm optimized for x == y. 

### <a id="benchSizes" href="#benchSizes">var benchSizes</a>

```
searchKey: big.benchSizes
tags: [variable array number private]
```

```Go
var benchSizes = []int{1, 2, 3, 4, 5, 1e1, 1e2, 1e3, 1e4, 1e5}
```

### <a id="bitLenTests" href="#bitLenTests">var bitLenTests</a>

```
searchKey: big.bitLenTests
tags: [variable array struct private]
```

```Go
var bitLenTests = ...
```

### <a id="bitTests" href="#bitTests">var bitTests</a>

```
searchKey: big.bitTests
tags: [variable array struct private]
```

```Go
var bitTests = ...
```

### <a id="bitsList" href="#bitsList">var bitsList</a>

```
searchKey: big.bitsList
tags: [variable array array number private]
```

```Go
var bitsList = [...]Bits{
	{},
	{0},
	{1},
	{-1},
	{10},
	{-10},
	{100, 10, 1},
	{0, -1, -2, -10},
}
```

Selected bits with which to run various tests. Each entry is a list of bits representing a floating-point number (see fromBits). 

### <a id="bitsetTests" href="#bitsetTests">var bitsetTests</a>

```
searchKey: big.bitsetTests
tags: [variable array struct private]
```

```Go
var bitsetTests = ...
```

### <a id="bitwiseTests" href="#bitwiseTests">var bitwiseTests</a>

```
searchKey: big.bitwiseTests
tags: [variable array struct private]
```

```Go
var bitwiseTests = ...
```

### <a id="cacheBase10" href="#cacheBase10">var cacheBase10</a>

```
searchKey: big.cacheBase10
tags: [variable struct private]
```

```Go
var cacheBase10 struct {
	sync.Mutex
	table [64]divisor // cached divisors for base 10
}
```

### <a id="calibrate" href="#calibrate">var calibrate</a>

```
searchKey: big.calibrate
tags: [variable boolean private]
```

```Go
var calibrate = flag.Bool("calibrate", false, "run calibration test")
```

### <a id="cmpAbsTests" href="#cmpAbsTests">var cmpAbsTests</a>

```
searchKey: big.cmpAbsTests
tags: [variable array string private]
```

```Go
var cmpAbsTests = ...
```

Entries must be sorted by value in ascending order. 

### <a id="cmpTests" href="#cmpTests">var cmpTests</a>

```
searchKey: big.cmpTests
tags: [variable array struct private]
```

```Go
var cmpTests = ...
```

### <a id="composites" href="#composites">var composites</a>

```
searchKey: big.composites
tags: [variable array string private]
```

```Go
var composites = ...
```

### <a id="divWWTests" href="#divWWTests">var divWWTests</a>

```
searchKey: big.divWWTests
tags: [variable array struct private]
```

```Go
var divWWTests = ...
```

### <a id="divisionSignsTests" href="#divisionSignsTests">var divisionSignsTests</a>

```
searchKey: big.divisionSignsTests
tags: [variable array struct private]
```

```Go
var divisionSignsTests = ...
```

Examples from the Go Language Spec, section "Arithmetic operators" 

### <a id="encodingTests" href="#encodingTests">var encodingTests</a>

```
searchKey: big.encodingTests
tags: [variable array string private]
```

```Go
var encodingTests = ...
```

### <a id="errInvalSep" href="#errInvalSep">var errInvalSep</a>

```
searchKey: big.errInvalSep
tags: [variable interface private]
```

```Go
var errInvalSep = errors.New("'_' must separate successive digits")
```

scan errors 

### <a id="errNoDigits" href="#errNoDigits">var errNoDigits</a>

```
searchKey: big.errNoDigits
tags: [variable interface private]
```

```Go
var errNoDigits = errors.New("number has no digits")
```

scan errors 

### <a id="expNNTests" href="#expNNTests">var expNNTests</a>

```
searchKey: big.expNNTests
tags: [variable array struct private]
```

```Go
var expNNTests = ...
```

### <a id="expTests" href="#expTests">var expTests</a>

```
searchKey: big.expTests
tags: [variable array struct private]
```

```Go
var expTests = ...
```

### <a id="exponentTests" href="#exponentTests">var exponentTests</a>

```
searchKey: big.exponentTests
tags: [variable array struct private]
```

```Go
var exponentTests = ...
```

### <a id="fiboNums" href="#fiboNums">var fiboNums</a>

```
searchKey: big.fiboNums
tags: [variable array string private]
```

```Go
var fiboNums = ...
```

### <a id="float64inputs" href="#float64inputs">var float64inputs</a>

```
searchKey: big.float64inputs
tags: [variable array string private]
```

```Go
var float64inputs = ...
```

Test inputs to Rat.SetString. The prefix "long:" causes the test to be skipped except in -long mode.  (The threshold is about 500us.) 

### <a id="floatStringTests" href="#floatStringTests">var floatStringTests</a>

```
searchKey: big.floatStringTests
tags: [variable array struct private]
```

```Go
var floatStringTests = ...
```

### <a id="floatVals" href="#floatVals">var floatVals</a>

```
searchKey: big.floatVals
tags: [variable array string private]
```

```Go
var floatVals = ...
```

### <a id="floatZero" href="#floatZero">var floatZero</a>

```
searchKey: big.floatZero
tags: [variable struct private]
```

```Go
var floatZero Float
```

### <a id="formatTests" href="#formatTests">var formatTests</a>

```
searchKey: big.formatTests
tags: [variable array struct private]
```

```Go
var formatTests = ...
```

### <a id="gcdTests" href="#gcdTests">var gcdTests</a>

```
searchKey: big.gcdTests
tags: [variable array struct private]
```

```Go
var gcdTests = ...
```

### <a id="int64Tests" href="#int64Tests">var int64Tests</a>

```
searchKey: big.int64Tests
tags: [variable array string private]
```

```Go
var int64Tests = ...
```

### <a id="intOne" href="#intOne">var intOne</a>

```
searchKey: big.intOne
tags: [variable struct private]
```

```Go
var intOne = &Int{false, natOne}
```

### <a id="isRaceBuilder" href="#isRaceBuilder">var isRaceBuilder</a>

```
searchKey: big.isRaceBuilder
tags: [variable boolean private]
```

```Go
var isRaceBuilder = strings.HasSuffix(testenv.Builder(), "-race")
```

### <a id="karatsubaSqrThreshold" href="#karatsubaSqrThreshold">var karatsubaSqrThreshold</a>

```
searchKey: big.karatsubaSqrThreshold
tags: [variable number private]
```

```Go
var karatsubaSqrThreshold = 260 // computed by calibrate_test.go

```

### <a id="karatsubaThreshold" href="#karatsubaThreshold">var karatsubaThreshold</a>

```
searchKey: big.karatsubaThreshold
tags: [variable number private]
```

```Go
var karatsubaThreshold = 40 // computed by calibrate_test.go

```

Operands that are shorter than karatsubaThreshold are multiplied using "grade school" multiplication; for longer operands the Karatsuba algorithm is used. 

### <a id="leafSize" href="#leafSize">var leafSize</a>

```
searchKey: big.leafSize
tags: [variable number private]
```

```Go
var leafSize int = 8 // number of Word-size binary values treat as a monolithic block

```

Split blocks greater than leafSize Words (or set to 0 to disable recursive conversion) Benchmark and configure leafSize using: go test -bench="Leaf" 

```
8 and 16 effective on 3.0 GHz Xeon "Clovertown" CPU (128 byte cache lines)
8 and 16 effective on 2.66 GHz Core 2 Duo "Penryn" CPU

```
### <a id="leftShiftTests" href="#leftShiftTests">var leftShiftTests</a>

```
searchKey: big.leftShiftTests
tags: [variable array struct private]
```

```Go
var leftShiftTests = ...
```

### <a id="long" href="#long">var long</a>

```
searchKey: big.long
tags: [variable boolean private]
```

```Go
var long = flag.Bool("long", false, "run very long tests")
```

### <a id="lshTests" href="#lshTests">var lshTests</a>

```
searchKey: big.lshTests
tags: [variable array struct private]
```

```Go
var lshTests = ...
```

### <a id="lshVW" href="#lshVW">var lshVW</a>

```
searchKey: big.lshVW
tags: [variable array struct private]
```

```Go
var lshVW = ...
```

### <a id="modInverseTests" href="#modInverseTests">var modInverseTests</a>

```
searchKey: big.modInverseTests
tags: [variable array struct private]
```

```Go
var modInverseTests = ...
```

### <a id="modWTests32" href="#modWTests32">var modWTests32</a>

```
searchKey: big.modWTests32
tags: [variable array struct private]
```

```Go
var modWTests32 = []modWTest{
	{"23492635982634928349238759823742", "252341", "220170"},
}
```

### <a id="modWTests64" href="#modWTests64">var modWTests64</a>

```
searchKey: big.modWTests64
tags: [variable array struct private]
```

```Go
var modWTests64 = ...
```

### <a id="montgomeryTests" href="#montgomeryTests">var montgomeryTests</a>

```
searchKey: big.montgomeryTests
tags: [variable array struct private]
```

```Go
var montgomeryTests = ...
```

### <a id="mulAddWWWTests" href="#mulAddWWWTests">var mulAddWWWTests</a>

```
searchKey: big.mulAddWWWTests
tags: [variable array struct private]
```

```Go
var mulAddWWWTests = ...
```

### <a id="mulBenchSizes" href="#mulBenchSizes">var mulBenchSizes</a>

```
searchKey: big.mulBenchSizes
tags: [variable array number private]
```

```Go
var mulBenchSizes = []int{10, 100, 1000, 10000, 100000}
```

### <a id="mulRangesN" href="#mulRangesN">var mulRangesN</a>

```
searchKey: big.mulRangesN
tags: [variable array struct private]
```

```Go
var mulRangesN = ...
```

### <a id="mulRangesZ" href="#mulRangesZ">var mulRangesZ</a>

```
searchKey: big.mulRangesZ
tags: [variable array struct private]
```

```Go
var mulRangesZ = ...
```

### <a id="mulWWTests" href="#mulWWTests">var mulWWTests</a>

```
searchKey: big.mulWWTests
tags: [variable array struct private]
```

```Go
var mulWWTests = []struct {
	x, y Word
	q, r Word
}{
	{_M, _M, _M - 1, 1},
}
```

### <a id="natFive" href="#natFive">var natFive</a>

```
searchKey: big.natFive
tags: [variable array number private]
```

```Go
var natFive = nat{5}
```

### <a id="natOne" href="#natOne">var natOne</a>

```
searchKey: big.natOne
tags: [variable array number private]
```

```Go
var natOne = nat{1}
```

### <a id="natPool" href="#natPool">var natPool</a>

```
searchKey: big.natPool
tags: [variable struct private]
```

```Go
var natPool sync.Pool
```

### <a id="natScanTests" href="#natScanTests">var natScanTests</a>

```
searchKey: big.natScanTests
tags: [variable array struct private]
```

```Go
var natScanTests = ...
```

### <a id="natTen" href="#natTen">var natTen</a>

```
searchKey: big.natTen
tags: [variable array number private]
```

```Go
var natTen = nat{10}
```

### <a id="natTwo" href="#natTwo">var natTwo</a>

```
searchKey: big.natTwo
tags: [variable array number private]
```

```Go
var natTwo = nat{2}
```

### <a id="notTests" href="#notTests">var notTests</a>

```
searchKey: big.notTests
tags: [variable array struct private]
```

```Go
var notTests = ...
```

### <a id="pi" href="#pi">var pi</a>

```
searchKey: big.pi
tags: [variable string private]
```

```Go
var pi = ...
```

### <a id="pow5tab" href="#pow5tab">var pow5tab</a>

```
searchKey: big.pow5tab
tags: [variable array number private]
```

```Go
var pow5tab = ...
```

These powers of 5 fit into a uint64. 

```
for p, q := uint64(0), uint64(1); p < q; p, q = q, q*5 {
	fmt.Println(q)
}

```
### <a id="precList" href="#precList">var precList</a>

```
searchKey: big.precList
tags: [variable array number private]
```

```Go
var precList = ...
```

Selected precisions with which to run various tests. 

### <a id="primes" href="#primes">var primes</a>

```
searchKey: big.primes
tags: [variable array string private]
```

```Go
var primes = ...
```

### <a id="prodNN" href="#prodNN">var prodNN</a>

```
searchKey: big.prodNN
tags: [variable array struct private]
```

```Go
var prodNN = ...
```

### <a id="prodVWW" href="#prodVWW">var prodVWW</a>

```
searchKey: big.prodVWW
tags: [variable array struct private]
```

```Go
var prodVWW = ...
```

### <a id="prodZZ" href="#prodZZ">var prodZZ</a>

```
searchKey: big.prodZZ
tags: [variable array struct private]
```

```Go
var prodZZ = ...
```

### <a id="quoTests" href="#quoTests">var quoTests</a>

```
searchKey: big.quoTests
tags: [variable array struct private]
```

```Go
var quoTests = ...
```

### <a id="ratBinTests" href="#ratBinTests">var ratBinTests</a>

```
searchKey: big.ratBinTests
tags: [variable array struct private]
```

```Go
var ratBinTests = ...
```

### <a id="ratCmpTests" href="#ratCmpTests">var ratCmpTests</a>

```
searchKey: big.ratCmpTests
tags: [variable array struct private]
```

```Go
var ratCmpTests = ...
```

### <a id="ratDenoms" href="#ratDenoms">var ratDenoms</a>

```
searchKey: big.ratDenoms
tags: [variable array string private]
```

```Go
var ratDenoms = ...
```

### <a id="ratNums" href="#ratNums">var ratNums</a>

```
searchKey: big.ratNums
tags: [variable array string private]
```

```Go
var ratNums = ...
```

### <a id="ratZero" href="#ratZero">var ratZero</a>

```
searchKey: big.ratZero
tags: [variable struct private]
```

```Go
var ratZero Rat
```

### <a id="rightShiftTests" href="#rightShiftTests">var rightShiftTests</a>

```
searchKey: big.rightShiftTests
tags: [variable array struct private]
```

```Go
var rightShiftTests = ...
```

### <a id="rnd" href="#rnd">var rnd</a>

```
searchKey: big.rnd
tags: [variable struct private]
```

```Go
var rnd = rand.New(rand.NewSource(0))
```

Always the same seed for reproducible results. 

### <a id="rshTests" href="#rshTests">var rshTests</a>

```
searchKey: big.rshTests
tags: [variable array struct private]
```

```Go
var rshTests = ...
```

### <a id="rshVW" href="#rshVW">var rshVW</a>

```
searchKey: big.rshVW
tags: [variable array struct private]
```

```Go
var rshVW = ...
```

### <a id="scanTests" href="#scanTests">var scanTests</a>

```
searchKey: big.scanTests
tags: [variable array struct private]
```

```Go
var scanTests = ...
```

### <a id="setFrac64Tests" href="#setFrac64Tests">var setFrac64Tests</a>

```
searchKey: big.setFrac64Tests
tags: [variable array struct private]
```

```Go
var setFrac64Tests = ...
```

### <a id="setStringTests" href="#setStringTests">var setStringTests</a>

```
searchKey: big.setStringTests
tags: [variable array struct private]
```

```Go
var setStringTests = ...
```

### <a id="setStringTests2" href="#setStringTests2">var setStringTests2</a>

```
searchKey: big.setStringTests2
tags: [variable array struct private]
```

```Go
var setStringTests2 = ...
```

These are not supported by fmt.Fscanf. 

### <a id="sink" href="#sink">var sink</a>

```
searchKey: big.sink
tags: [variable string private]
```

```Go
var sink string
```

### <a id="sqrBenchSizes" href="#sqrBenchSizes">var sqrBenchSizes</a>

```
searchKey: big.sqrBenchSizes
tags: [variable array number private]
```

```Go
var sqrBenchSizes = ...
```

### <a id="stickyTests" href="#stickyTests">var stickyTests</a>

```
searchKey: big.stickyTests
tags: [variable array struct private]
```

```Go
var stickyTests = ...
```

### <a id="strTests" href="#strTests">var strTests</a>

```
searchKey: big.strTests
tags: [variable array struct private]
```

```Go
var strTests = ...
```

### <a id="stringTests" href="#stringTests">var stringTests</a>

```
searchKey: big.stringTests
tags: [variable array struct private]
```

```Go
var stringTests = ...
```

### <a id="sumNN" href="#sumNN">var sumNN</a>

```
searchKey: big.sumNN
tags: [variable array struct private]
```

```Go
var sumNN = ...
```

### <a id="sumVV" href="#sumVV">var sumVV</a>

```
searchKey: big.sumVV
tags: [variable array struct private]
```

```Go
var sumVV = ...
```

### <a id="sumVW" href="#sumVW">var sumVW</a>

```
searchKey: big.sumVW
tags: [variable array struct private]
```

```Go
var sumVW = ...
```

### <a id="sumZZ" href="#sumZZ">var sumZZ</a>

```
searchKey: big.sumZZ
tags: [variable array struct private]
```

```Go
var sumZZ = ...
```

### <a id="support_adx" href="#support_adx">var support_adx</a>

```
searchKey: big.support_adx
tags: [variable boolean private]
```

```Go
var support_adx = cpu.X86.HasADX && cpu.X86.HasBMI2
```

### <a id="threeOnce" href="#threeOnce">var threeOnce</a>

```
searchKey: big.threeOnce
tags: [variable struct private]
```

```Go
var threeOnce struct {
	sync.Once
	v *Float
}
```

### <a id="tzbTests" href="#tzbTests">var tzbTests</a>

```
searchKey: big.tzbTests
tags: [variable array struct private]
```

```Go
var tzbTests = ...
```

### <a id="uint64Tests" href="#uint64Tests">var uint64Tests</a>

```
searchKey: big.uint64Tests
tags: [variable array string private]
```

```Go
var uint64Tests = ...
```

### <a id="zero_" href="#zero_">var zero_</a>

```
searchKey: big.zero_
tags: [variable number private]
```

```Go
var zero_ float64
```

### <a id="_Accuracy_index" href="#_Accuracy_index">var _Accuracy_index</a>

```
searchKey: big._Accuracy_index
tags: [variable array number private]
```

```Go
var _Accuracy_index = [...]uint8{0, 5, 10, 15}
```

### <a id="_RoundingMode_index" href="#_RoundingMode_index">var _RoundingMode_index</a>

```
searchKey: big._RoundingMode_index
tags: [variable array number private]
```

```Go
var _RoundingMode_index = [...]uint8{0, 13, 26, 32, 44, 57, 70}
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Accuracy" href="#Accuracy">type Accuracy int8</a>

```
searchKey: big.Accuracy
tags: [number]
```

```Go
type Accuracy int8
```

Accuracy describes the rounding error produced by the most recent operation that generated a Float value, relative to the exact value. 

#### <a id="makeAcc" href="#makeAcc">func makeAcc(above bool) Accuracy</a>

```
searchKey: big.makeAcc
tags: [method private]
```

```Go
func makeAcc(above bool) Accuracy
```

#### <a id="Accuracy.String" href="#Accuracy.String">func (i Accuracy) String() string</a>

```
searchKey: big.Accuracy.String
tags: [function]
```

```Go
func (i Accuracy) String() string
```

### <a id="Bits" href="#Bits">type Bits []int</a>

```
searchKey: big.Bits
tags: [array number private]
```

```Go
type Bits []int
```

A Bits value b represents a finite floating-point number x of the form 

```
x = 2**b[0] + 2**b[1] + ... 2**b[len(b)-1]

```
The order of slice elements is not significant. Negative elements may be used to form fractions. A Bits value is normalized if each b[i] occurs at most once. For instance Bits{0, 0, 1} is not normalized but represents the same floating-point number as Bits{2}, which is normalized. The zero (nil) value of Bits is a ready to use Bits value and represents the value 0. 

#### <a id="Bits.Float" href="#Bits.Float">func (bits Bits) Float() *Float</a>

```
searchKey: big.Bits.Float
tags: [function private]
```

```Go
func (bits Bits) Float() *Float
```

Float returns the *Float z of the smallest possible precision such that z = sum(2**bits[i]), with i = range bits. If multiple bits[i] are equal, they are added: Bits{0, 1, 0}.Float() == 2**0 + 2**1 + 2**0 = 4. 

#### <a id="Bits.add" href="#Bits.add">func (x Bits) add(y Bits) Bits</a>

```
searchKey: big.Bits.add
tags: [method private]
```

```Go
func (x Bits) add(y Bits) Bits
```

#### <a id="Bits.mul" href="#Bits.mul">func (x Bits) mul(y Bits) Bits</a>

```
searchKey: big.Bits.mul
tags: [method private]
```

```Go
func (x Bits) mul(y Bits) Bits
```

#### <a id="Bits.norm" href="#Bits.norm">func (x Bits) norm() Bits</a>

```
searchKey: big.Bits.norm
tags: [function private]
```

```Go
func (x Bits) norm() Bits
```

norm returns the normalized bits for x: It removes multiple equal entries by treating them as an addition (e.g., Bits{5, 5} => Bits{6}), and it sorts the result list for reproducible results. 

#### <a id="Bits.round" href="#Bits.round">func (x Bits) round(prec uint, mode RoundingMode) *Float</a>

```
searchKey: big.Bits.round
tags: [method private]
```

```Go
func (x Bits) round(prec uint, mode RoundingMode) *Float
```

round returns the Float value corresponding to x after rounding x to prec bits according to mode. 

### <a id="ErrNaN" href="#ErrNaN">type ErrNaN struct</a>

```
searchKey: big.ErrNaN
tags: [struct]
```

```Go
type ErrNaN struct {
	msg string
}
```

An ErrNaN panic is raised by a Float operation that would lead to a NaN under IEEE-754 rules. An ErrNaN implements the error interface. 

#### <a id="ErrNaN.Error" href="#ErrNaN.Error">func (err ErrNaN) Error() string</a>

```
searchKey: big.ErrNaN.Error
tags: [function]
```

```Go
func (err ErrNaN) Error() string
```

### <a id="Float" href="#Float">type Float struct</a>

```
searchKey: big.Float
tags: [struct]
```

```Go
type Float struct {
	prec uint32
	mode RoundingMode
	acc  Accuracy
	form form
	neg  bool
	mant nat
	exp  int32
}
```

A nonzero finite Float represents a multi-precision floating point number 

```
sign × mantissa × 2**exponent

```
with 0.5 <= mantissa < 1.0, and MinExp <= exponent <= MaxExp. A Float may also be zero (+0, -0) or infinite (+Inf, -Inf). All Floats are ordered, and the ordering of two Floats x and y is defined by x.Cmp(y). 

Each Float value also has a precision, rounding mode, and accuracy. The precision is the maximum number of mantissa bits available to represent the value. The rounding mode specifies how a result should be rounded to fit into the mantissa bits, and accuracy describes the rounding error with respect to the exact result. 

Unless specified otherwise, all operations (including setters) that specify a *Float variable for the result (usually via the receiver with the exception of MantExp), round the numeric result according to the precision and rounding mode of the result variable. 

If the provided result precision is 0 (see below), it is set to the precision of the argument with the largest precision value before any rounding takes place, and the rounding mode remains unchanged. Thus, uninitialized Floats provided as result arguments will have their precision set to a reasonable value determined by the operands, and their mode is the zero value for RoundingMode (ToNearestEven). 

By setting the desired precision to 24 or 53 and using matching rounding mode (typically ToNearestEven), Float operations produce the same results as the corresponding float32 or float64 IEEE-754 arithmetic for operands that correspond to normal (i.e., not denormal) float32 or float64 numbers. Exponent underflow and overflow lead to a 0 or an Infinity for different values than IEEE-754 because Float exponents have a much larger range. 

The zero (uninitialized) value for a Float is ready to use and represents the number +0.0 exactly, with precision 0 and rounding mode ToNearestEven. 

Operations always take pointer arguments (*Float) rather than Float values, and each unique Float value requires its own unique *Float pointer. To "copy" a Float value, an existing (or newly allocated) Float must be set to a new value using the Float.Set method; shallow copies of Floats are not supported and may lead to errors. 

#### <a id="NewFloat" href="#NewFloat">func NewFloat(x float64) *Float</a>

```
searchKey: big.NewFloat
tags: [method]
```

```Go
func NewFloat(x float64) *Float
```

NewFloat allocates and returns a new Float set to x, with precision 53 and rounding mode ToNearestEven. NewFloat panics with ErrNaN if x is a NaN. 

#### <a id="ParseFloat" href="#ParseFloat">func ParseFloat(s string, base int, prec uint, mode RoundingMode) (f *Float, b int, err error)</a>

```
searchKey: big.ParseFloat
tags: [method]
```

```Go
func ParseFloat(s string, base int, prec uint, mode RoundingMode) (f *Float, b int, err error)
```

ParseFloat is like f.Parse(s, base) with f set to the given precision and rounding mode. 

#### <a id="makeFloat" href="#makeFloat">func makeFloat(s string) *Float</a>

```
searchKey: big.makeFloat
tags: [method private]
```

```Go
func makeFloat(s string) *Float
```

#### <a id="newFloat" href="#newFloat">func newFloat(prec2 uint32) *Float</a>

```
searchKey: big.newFloat
tags: [method private]
```

```Go
func newFloat(prec2 uint32) *Float
```

newFloat returns a new *Float with space for twice the given precision. 

#### <a id="three" href="#three">func three() *Float</a>

```
searchKey: big.three
tags: [function private]
```

```Go
func three() *Float
```

#### <a id="Float.Abs" href="#Float.Abs">func (z *Float) Abs(x *Float) *Float</a>

```
searchKey: big.Float.Abs
tags: [method]
```

```Go
func (z *Float) Abs(x *Float) *Float
```

Abs sets z to the (possibly rounded) value |x| (the absolute value of x) and returns z. 

#### <a id="Float.Acc" href="#Float.Acc">func (x *Float) Acc() Accuracy</a>

```
searchKey: big.Float.Acc
tags: [function]
```

```Go
func (x *Float) Acc() Accuracy
```

Acc returns the accuracy of x produced by the most recent operation, unless explicitly documented otherwise by that operation. 

#### <a id="Float.Add" href="#Float.Add">func (z *Float) Add(x, y *Float) *Float</a>

```
searchKey: big.Float.Add
tags: [method]
```

```Go
func (z *Float) Add(x, y *Float) *Float
```

Add sets z to the rounded sum x+y and returns z. If z's precision is 0, it is changed to the larger of x's or y's precision before the operation. Rounding is performed according to z's precision and rounding mode; and z's accuracy reports the result error relative to the exact (not rounded) result. Add panics with ErrNaN if x and y are infinities with opposite signs. The value of z is undefined in that case. 

#### <a id="Float.Append" href="#Float.Append">func (x *Float) Append(buf []byte, fmt byte, prec int) []byte</a>

```
searchKey: big.Float.Append
tags: [method]
```

```Go
func (x *Float) Append(buf []byte, fmt byte, prec int) []byte
```

Append appends to buf the string form of the floating-point number x, as generated by x.Text, and returns the extended buffer. 

#### <a id="Float.Cmp" href="#Float.Cmp">func (x *Float) Cmp(y *Float) int</a>

```
searchKey: big.Float.Cmp
tags: [method]
```

```Go
func (x *Float) Cmp(y *Float) int
```

Cmp compares x and y and returns: 

```
-1 if x <  y
 0 if x == y (incl. -0 == 0, -Inf == -Inf, and +Inf == +Inf)
+1 if x >  y

```
#### <a id="Float.Copy" href="#Float.Copy">func (z *Float) Copy(x *Float) *Float</a>

```
searchKey: big.Float.Copy
tags: [method]
```

```Go
func (z *Float) Copy(x *Float) *Float
```

Copy sets z to x, with the same precision, rounding mode, and accuracy as x, and returns z. x is not changed even if z and x are the same. 

#### <a id="Float.Float32" href="#Float.Float32">func (x *Float) Float32() (float32, Accuracy)</a>

```
searchKey: big.Float.Float32
tags: [function]
```

```Go
func (x *Float) Float32() (float32, Accuracy)
```

Float32 returns the float32 value nearest to x. If x is too small to be represented by a float32 (|x| < math.SmallestNonzeroFloat32), the result is (0, Below) or (-0, Above), respectively, depending on the sign of x. If x is too large to be represented by a float32 (|x| > math.MaxFloat32), the result is (+Inf, Above) or (-Inf, Below), depending on the sign of x. 

#### <a id="Float.Float64" href="#Float.Float64">func (x *Float) Float64() (float64, Accuracy)</a>

```
searchKey: big.Float.Float64
tags: [function]
```

```Go
func (x *Float) Float64() (float64, Accuracy)
```

Float64 returns the float64 value nearest to x. If x is too small to be represented by a float64 (|x| < math.SmallestNonzeroFloat64), the result is (0, Below) or (-0, Above), respectively, depending on the sign of x. If x is too large to be represented by a float64 (|x| > math.MaxFloat64), the result is (+Inf, Above) or (-Inf, Below), depending on the sign of x. 

#### <a id="Float.Format" href="#Float.Format">func (x *Float) Format(s fmt.State, format rune)</a>

```
searchKey: big.Float.Format
tags: [method]
```

```Go
func (x *Float) Format(s fmt.State, format rune)
```

Format implements fmt.Formatter. It accepts all the regular formats for floating-point numbers ('b', 'e', 'E', 'f', 'F', 'g', 'G', 'x') as well as 'p' and 'v'. See (*Float).Text for the interpretation of 'p'. The 'v' format is handled like 'g'. Format also supports specification of the minimum precision in digits, the output field width, as well as the format flags '+' and ' ' for sign control, '0' for space or zero padding, and '-' for left or right justification. See the fmt package for details. 

#### <a id="Float.GobDecode" href="#Float.GobDecode">func (z *Float) GobDecode(buf []byte) error</a>

```
searchKey: big.Float.GobDecode
tags: [method]
```

```Go
func (z *Float) GobDecode(buf []byte) error
```

GobDecode implements the gob.GobDecoder interface. The result is rounded per the precision and rounding mode of z unless z's precision is 0, in which case z is set exactly to the decoded value. 

#### <a id="Float.GobEncode" href="#Float.GobEncode">func (x *Float) GobEncode() ([]byte, error)</a>

```
searchKey: big.Float.GobEncode
tags: [function]
```

```Go
func (x *Float) GobEncode() ([]byte, error)
```

GobEncode implements the gob.GobEncoder interface. The Float value and all its attributes (precision, rounding mode, accuracy) are marshaled. 

#### <a id="Float.Int" href="#Float.Int">func (x *Float) Int(z *Int) (*Int, Accuracy)</a>

```
searchKey: big.Float.Int
tags: [method]
```

```Go
func (x *Float) Int(z *Int) (*Int, Accuracy)
```

Int returns the result of truncating x towards zero; or nil if x is an infinity. The result is Exact if x.IsInt(); otherwise it is Below for x > 0, and Above for x < 0. If a non-nil *Int argument z is provided, Int stores the result in z instead of allocating a new Int. 

#### <a id="Float.Int64" href="#Float.Int64">func (x *Float) Int64() (int64, Accuracy)</a>

```
searchKey: big.Float.Int64
tags: [function]
```

```Go
func (x *Float) Int64() (int64, Accuracy)
```

Int64 returns the integer resulting from truncating x towards zero. If math.MinInt64 <= x <= math.MaxInt64, the result is Exact if x is an integer, and Above (x < 0) or Below (x > 0) otherwise. The result is (math.MinInt64, Above) for x < math.MinInt64, and (math.MaxInt64, Below) for x > math.MaxInt64. 

#### <a id="Float.IsInf" href="#Float.IsInf">func (x *Float) IsInf() bool</a>

```
searchKey: big.Float.IsInf
tags: [function]
```

```Go
func (x *Float) IsInf() bool
```

IsInf reports whether x is +Inf or -Inf. 

#### <a id="Float.IsInt" href="#Float.IsInt">func (x *Float) IsInt() bool</a>

```
searchKey: big.Float.IsInt
tags: [function]
```

```Go
func (x *Float) IsInt() bool
```

IsInt reports whether x is an integer. ±Inf values are not integers. 

#### <a id="Float.MantExp" href="#Float.MantExp">func (x *Float) MantExp(mant *Float) (exp int)</a>

```
searchKey: big.Float.MantExp
tags: [method]
```

```Go
func (x *Float) MantExp(mant *Float) (exp int)
```

MantExp breaks x into its mantissa and exponent components and returns the exponent. If a non-nil mant argument is provided its value is set to the mantissa of x, with the same precision and rounding mode as x. The components satisfy x == mant × 2**exp, with 0.5 <= |mant| < 1.0. Calling MantExp with a nil argument is an efficient way to get the exponent of the receiver. 

Special cases are: 

```
(  ±0).MantExp(mant) = 0, with mant set to   ±0
(±Inf).MantExp(mant) = 0, with mant set to ±Inf

```
x and mant may be the same in which case x is set to its mantissa value. 

#### <a id="Float.MarshalText" href="#Float.MarshalText">func (x *Float) MarshalText() (text []byte, err error)</a>

```
searchKey: big.Float.MarshalText
tags: [function]
```

```Go
func (x *Float) MarshalText() (text []byte, err error)
```

MarshalText implements the encoding.TextMarshaler interface. Only the Float value is marshaled (in full precision), other attributes such as precision or accuracy are ignored. 

#### <a id="Float.MinPrec" href="#Float.MinPrec">func (x *Float) MinPrec() uint</a>

```
searchKey: big.Float.MinPrec
tags: [function]
```

```Go
func (x *Float) MinPrec() uint
```

MinPrec returns the minimum precision required to represent x exactly (i.e., the smallest prec before x.SetPrec(prec) would start rounding x). The result is 0 for |x| == 0 and |x| == Inf. 

#### <a id="Float.Mode" href="#Float.Mode">func (x *Float) Mode() RoundingMode</a>

```
searchKey: big.Float.Mode
tags: [function]
```

```Go
func (x *Float) Mode() RoundingMode
```

Mode returns the rounding mode of x. 

#### <a id="Float.Mul" href="#Float.Mul">func (z *Float) Mul(x, y *Float) *Float</a>

```
searchKey: big.Float.Mul
tags: [method]
```

```Go
func (z *Float) Mul(x, y *Float) *Float
```

Mul sets z to the rounded product x*y and returns z. Precision, rounding, and accuracy reporting are as for Add. Mul panics with ErrNaN if one operand is zero and the other operand an infinity. The value of z is undefined in that case. 

#### <a id="Float.Neg" href="#Float.Neg">func (z *Float) Neg(x *Float) *Float</a>

```
searchKey: big.Float.Neg
tags: [method]
```

```Go
func (z *Float) Neg(x *Float) *Float
```

Neg sets z to the (possibly rounded) value of x with its sign negated, and returns z. 

#### <a id="Float.Parse" href="#Float.Parse">func (z *Float) Parse(s string, base int) (f *Float, b int, err error)</a>

```
searchKey: big.Float.Parse
tags: [method]
```

```Go
func (z *Float) Parse(s string, base int) (f *Float, b int, err error)
```

Parse parses s which must contain a text representation of a floating- point number with a mantissa in the given conversion base (the exponent is always a decimal number), or a string representing an infinite value. 

For base 0, an underscore character `_' may appear between a base prefix and an adjacent digit, and between successive digits; such underscores do not change the value of the number, or the returned digit count. Incorrect placement of underscores is reported as an error if there are no other errors. If base != 0, underscores are not recognized and thus terminate scanning like any other character that is not a valid radix point or digit. 

It sets z to the (possibly rounded) value of the corresponding floating- point value, and returns z, the actual base b, and an error err, if any. The entire string (not just a prefix) must be consumed for success. If z's precision is 0, it is changed to 64 before rounding takes effect. The number must be of the form: 

```
number    = [ sign ] ( float | "inf" | "Inf" ) .
sign      = "+" | "-" .
float     = ( mantissa | prefix pmantissa ) [ exponent ] .
prefix    = "0" [ "b" | "B" | "o" | "O" | "x" | "X" ] .
mantissa  = digits "." [ digits ] | digits | "." digits .
pmantissa = [ "_" ] digits "." [ digits ] | [ "_" ] digits | "." digits .
exponent  = ( "e" | "E" | "p" | "P" ) [ sign ] digits .
digits    = digit { [ "_" ] digit } .
digit     = "0" ... "9" | "a" ... "z" | "A" ... "Z" .

```
The base argument must be 0, 2, 8, 10, or 16. Providing an invalid base argument will lead to a run-time panic. 

For base 0, the number prefix determines the actual base: A prefix of `0b' or `0B' selects base 2, `0o' or `0O' selects base 8, and `0x' or `0X' selects base 16. Otherwise, the actual base is 10 and no prefix is accepted. The octal prefix "0" is not supported (a leading "0" is simply considered a "0"). 

A "p" or "P" exponent indicates a base 2 (rather then base 10) exponent; for instance, "0x1.fffffffffffffp1023" (using base 0) represents the maximum float64 value. For hexadecimal mantissae, the exponent character must be one of 'p' or 'P', if present (an "e" or "E" exponent indicator cannot be distinguished from a mantissa digit). 

The returned *Float f is nil and the value of z is valid but not defined if an error is reported. 

#### <a id="Float.Prec" href="#Float.Prec">func (x *Float) Prec() uint</a>

```
searchKey: big.Float.Prec
tags: [function]
```

```Go
func (x *Float) Prec() uint
```

Prec returns the mantissa precision of x in bits. The result may be 0 for |x| == 0 and |x| == Inf. 

#### <a id="Float.Quo" href="#Float.Quo">func (z *Float) Quo(x, y *Float) *Float</a>

```
searchKey: big.Float.Quo
tags: [method]
```

```Go
func (z *Float) Quo(x, y *Float) *Float
```

Quo sets z to the rounded quotient x/y and returns z. Precision, rounding, and accuracy reporting are as for Add. Quo panics with ErrNaN if both operands are zero or infinities. The value of z is undefined in that case. 

#### <a id="Float.Rat" href="#Float.Rat">func (x *Float) Rat(z *Rat) (*Rat, Accuracy)</a>

```
searchKey: big.Float.Rat
tags: [method]
```

```Go
func (x *Float) Rat(z *Rat) (*Rat, Accuracy)
```

Rat returns the rational number corresponding to x; or nil if x is an infinity. The result is Exact if x is not an Inf. If a non-nil *Rat argument z is provided, Rat stores the result in z instead of allocating a new Rat. 

#### <a id="Float.Scan" href="#Float.Scan">func (z *Float) Scan(s fmt.ScanState, ch rune) error</a>

```
searchKey: big.Float.Scan
tags: [method]
```

```Go
func (z *Float) Scan(s fmt.ScanState, ch rune) error
```

Scan is a support routine for fmt.Scanner; it sets z to the value of the scanned number. It accepts formats whose verbs are supported by fmt.Scan for floating point values, which are: 'b' (binary), 'e', 'E', 'f', 'F', 'g' and 'G'. Scan doesn't handle ±Inf. 

#### <a id="Float.Set" href="#Float.Set">func (z *Float) Set(x *Float) *Float</a>

```
searchKey: big.Float.Set
tags: [method]
```

```Go
func (z *Float) Set(x *Float) *Float
```

Set sets z to the (possibly rounded) value of x and returns z. If z's precision is 0, it is changed to the precision of x before setting z (and rounding will have no effect). Rounding is performed according to z's precision and rounding mode; and z's accuracy reports the result error relative to the exact (not rounded) result. 

#### <a id="Float.SetFloat64" href="#Float.SetFloat64">func (z *Float) SetFloat64(x float64) *Float</a>

```
searchKey: big.Float.SetFloat64
tags: [method]
```

```Go
func (z *Float) SetFloat64(x float64) *Float
```

SetFloat64 sets z to the (possibly rounded) value of x and returns z. If z's precision is 0, it is changed to 53 (and rounding will have no effect). SetFloat64 panics with ErrNaN if x is a NaN. 

#### <a id="Float.SetInf" href="#Float.SetInf">func (z *Float) SetInf(signbit bool) *Float</a>

```
searchKey: big.Float.SetInf
tags: [method]
```

```Go
func (z *Float) SetInf(signbit bool) *Float
```

SetInf sets z to the infinite Float -Inf if signbit is set, or +Inf if signbit is not set, and returns z. The precision of z is unchanged and the result is always Exact. 

#### <a id="Float.SetInt" href="#Float.SetInt">func (z *Float) SetInt(x *Int) *Float</a>

```
searchKey: big.Float.SetInt
tags: [method]
```

```Go
func (z *Float) SetInt(x *Int) *Float
```

SetInt sets z to the (possibly rounded) value of x and returns z. If z's precision is 0, it is changed to the larger of x.BitLen() or 64 (and rounding will have no effect). 

#### <a id="Float.SetInt64" href="#Float.SetInt64">func (z *Float) SetInt64(x int64) *Float</a>

```
searchKey: big.Float.SetInt64
tags: [method]
```

```Go
func (z *Float) SetInt64(x int64) *Float
```

SetInt64 sets z to the (possibly rounded) value of x and returns z. If z's precision is 0, it is changed to 64 (and rounding will have no effect). 

#### <a id="Float.SetMantExp" href="#Float.SetMantExp">func (z *Float) SetMantExp(mant *Float, exp int) *Float</a>

```
searchKey: big.Float.SetMantExp
tags: [method]
```

```Go
func (z *Float) SetMantExp(mant *Float, exp int) *Float
```

SetMantExp sets z to mant × 2**exp and returns z. The result z has the same precision and rounding mode as mant. SetMantExp is an inverse of MantExp but does not require 0.5 <= |mant| < 1.0. Specifically: 

```
mant := new(Float)
new(Float).SetMantExp(mant, x.MantExp(mant)).Cmp(x) == 0

```
Special cases are: 

```
z.SetMantExp(  ±0, exp) =   ±0
z.SetMantExp(±Inf, exp) = ±Inf

```
z and mant may be the same in which case z's exponent is set to exp. 

#### <a id="Float.SetMode" href="#Float.SetMode">func (z *Float) SetMode(mode RoundingMode) *Float</a>

```
searchKey: big.Float.SetMode
tags: [method]
```

```Go
func (z *Float) SetMode(mode RoundingMode) *Float
```

SetMode sets z's rounding mode to mode and returns an exact z. z remains unchanged otherwise. z.SetMode(z.Mode()) is a cheap way to set z's accuracy to Exact. 

#### <a id="Float.SetPrec" href="#Float.SetPrec">func (z *Float) SetPrec(prec uint) *Float</a>

```
searchKey: big.Float.SetPrec
tags: [method]
```

```Go
func (z *Float) SetPrec(prec uint) *Float
```

SetPrec sets z's precision to prec and returns the (possibly) rounded value of z. Rounding occurs according to z's rounding mode if the mantissa cannot be represented in prec bits without loss of precision. SetPrec(0) maps all finite values to ±0; infinite values remain unchanged. If prec > MaxPrec, it is set to MaxPrec. 

#### <a id="Float.SetRat" href="#Float.SetRat">func (z *Float) SetRat(x *Rat) *Float</a>

```
searchKey: big.Float.SetRat
tags: [method]
```

```Go
func (z *Float) SetRat(x *Rat) *Float
```

SetRat sets z to the (possibly rounded) value of x and returns z. If z's precision is 0, it is changed to the largest of a.BitLen(), b.BitLen(), or 64; with x = a/b. 

#### <a id="Float.SetString" href="#Float.SetString">func (z *Float) SetString(s string) (*Float, bool)</a>

```
searchKey: big.Float.SetString
tags: [method]
```

```Go
func (z *Float) SetString(s string) (*Float, bool)
```

SetString sets z to the value of s and returns z and a boolean indicating success. s must be a floating-point number of the same format as accepted by Parse, with base argument 0. The entire string (not just a prefix) must be valid for success. If the operation failed, the value of z is undefined but the returned value is nil. 

#### <a id="Float.SetUint64" href="#Float.SetUint64">func (z *Float) SetUint64(x uint64) *Float</a>

```
searchKey: big.Float.SetUint64
tags: [method]
```

```Go
func (z *Float) SetUint64(x uint64) *Float
```

SetUint64 sets z to the (possibly rounded) value of x and returns z. If z's precision is 0, it is changed to 64 (and rounding will have no effect). 

#### <a id="Float.Sign" href="#Float.Sign">func (x *Float) Sign() int</a>

```
searchKey: big.Float.Sign
tags: [function]
```

```Go
func (x *Float) Sign() int
```

Sign returns: 

```
-1 if x <   0
 0 if x is ±0
+1 if x >   0

```
#### <a id="Float.Signbit" href="#Float.Signbit">func (x *Float) Signbit() bool</a>

```
searchKey: big.Float.Signbit
tags: [function]
```

```Go
func (x *Float) Signbit() bool
```

Signbit reports whether x is negative or negative zero. 

#### <a id="Float.Sqrt" href="#Float.Sqrt">func (z *Float) Sqrt(x *Float) *Float</a>

```
searchKey: big.Float.Sqrt
tags: [method]
```

```Go
func (z *Float) Sqrt(x *Float) *Float
```

Sqrt sets z to the rounded square root of x, and returns it. 

If z's precision is 0, it is changed to x's precision before the operation. Rounding is performed according to z's precision and rounding mode, but z's accuracy is not computed. Specifically, the result of z.Acc() is undefined. 

The function panics if z < 0. The value of z is undefined in that case. 

#### <a id="Float.String" href="#Float.String">func (x *Float) String() string</a>

```
searchKey: big.Float.String
tags: [function]
```

```Go
func (x *Float) String() string
```

String formats x like x.Text('g', 10). (String must be called explicitly, Float.Format does not support %s verb.) 

#### <a id="Float.Sub" href="#Float.Sub">func (z *Float) Sub(x, y *Float) *Float</a>

```
searchKey: big.Float.Sub
tags: [method]
```

```Go
func (z *Float) Sub(x, y *Float) *Float
```

Sub sets z to the rounded difference x-y and returns z. Precision, rounding, and accuracy reporting are as for Add. Sub panics with ErrNaN if x and y are infinities with equal signs. The value of z is undefined in that case. 

#### <a id="Float.Text" href="#Float.Text">func (x *Float) Text(format byte, prec int) string</a>

```
searchKey: big.Float.Text
tags: [method]
```

```Go
func (x *Float) Text(format byte, prec int) string
```

Text converts the floating-point number x to a string according to the given format and precision prec. The format is one of: 

```
'e'	-d.dddde±dd, decimal exponent, at least two (possibly 0) exponent digits
'E'	-d.ddddE±dd, decimal exponent, at least two (possibly 0) exponent digits
'f'	-ddddd.dddd, no exponent
'g'	like 'e' for large exponents, like 'f' otherwise
'G'	like 'E' for large exponents, like 'f' otherwise
'x'	-0xd.dddddp±dd, hexadecimal mantissa, decimal power of two exponent
'p'	-0x.dddp±dd, hexadecimal mantissa, decimal power of two exponent (non-standard)
'b'	-ddddddp±dd, decimal mantissa, decimal power of two exponent (non-standard)

```
For the power-of-two exponent formats, the mantissa is printed in normalized form: 

```
'x'	hexadecimal mantissa in [1, 2), or 0
'p'	hexadecimal mantissa in [½, 1), or 0
'b'	decimal integer mantissa using x.Prec() bits, or 0

```
Note that the 'x' form is the one used by most other languages and libraries. 

If format is a different character, Text returns a "%" followed by the unrecognized format character. 

The precision prec controls the number of digits (excluding the exponent) printed by the 'e', 'E', 'f', 'g', 'G', and 'x' formats. For 'e', 'E', 'f', and 'x', it is the number of digits after the decimal point. For 'g' and 'G' it is the total number of digits. A negative precision selects the smallest number of decimal digits necessary to identify the value x uniquely using x.Prec() mantissa bits. The prec value is ignored for the 'b' and 'p' formats. 

#### <a id="Float.Uint64" href="#Float.Uint64">func (x *Float) Uint64() (uint64, Accuracy)</a>

```
searchKey: big.Float.Uint64
tags: [function]
```

```Go
func (x *Float) Uint64() (uint64, Accuracy)
```

Uint64 returns the unsigned integer resulting from truncating x towards zero. If 0 <= x <= math.MaxUint64, the result is Exact if x is an integer and Below otherwise. The result is (0, Above) for x < 0, and (math.MaxUint64, Below) for x > math.MaxUint64. 

#### <a id="Float.UnmarshalText" href="#Float.UnmarshalText">func (z *Float) UnmarshalText(text []byte) error</a>

```
searchKey: big.Float.UnmarshalText
tags: [method]
```

```Go
func (z *Float) UnmarshalText(text []byte) error
```

UnmarshalText implements the encoding.TextUnmarshaler interface. The result is rounded per the precision and rounding mode of z. If z's precision is 0, it is changed to 64 before rounding takes effect. 

#### <a id="Float.fmtB" href="#Float.fmtB">func (x *Float) fmtB(buf []byte) []byte</a>

```
searchKey: big.Float.fmtB
tags: [method private]
```

```Go
func (x *Float) fmtB(buf []byte) []byte
```

fmtB appends the string of x in the format mantissa "p" exponent with a decimal mantissa and a binary exponent, or 0" if x is zero, and returns the extended buffer. The mantissa is normalized such that is uses x.Prec() bits in binary representation. The sign of x is ignored, and x must not be an Inf. (The caller handles Inf before invoking fmtB.) 

#### <a id="Float.fmtP" href="#Float.fmtP">func (x *Float) fmtP(buf []byte) []byte</a>

```
searchKey: big.Float.fmtP
tags: [method private]
```

```Go
func (x *Float) fmtP(buf []byte) []byte
```

fmtP appends the string of x in the format "0x." mantissa "p" exponent with a hexadecimal mantissa and a binary exponent, or "0" if x is zero, and returns the extended buffer. The mantissa is normalized such that 0.5 <= 0.mantissa < 1.0. The sign of x is ignored, and x must not be an Inf. (The caller handles Inf before invoking fmtP.) 

#### <a id="Float.fmtX" href="#Float.fmtX">func (x *Float) fmtX(buf []byte, prec int) []byte</a>

```
searchKey: big.Float.fmtX
tags: [method private]
```

```Go
func (x *Float) fmtX(buf []byte, prec int) []byte
```

fmtX appends the string of x in the format "0x1." mantissa "p" exponent with a hexadecimal mantissa and a binary exponent, or "0x0p0" if x is zero, and returns the extended buffer. A non-zero mantissa is normalized such that 1.0 <= mantissa < 2.0. The sign of x is ignored, and x must not be an Inf. (The caller handles Inf before invoking fmtX.) 

#### <a id="Float.int64" href="#Float.int64">func (x *Float) int64() int64</a>

```
searchKey: big.Float.int64
tags: [function private]
```

```Go
func (x *Float) int64() int64
```

#### <a id="Float.ord" href="#Float.ord">func (x *Float) ord() int</a>

```
searchKey: big.Float.ord
tags: [function private]
```

```Go
func (x *Float) ord() int
```

ord classifies x and returns: 

```
-2 if -Inf == x
-1 if -Inf < x < 0
 0 if x == 0 (signed or unsigned)
+1 if 0 < x < +Inf
+2 if x == +Inf

```
#### <a id="Float.pow5" href="#Float.pow5">func (z *Float) pow5(n uint64) *Float</a>

```
searchKey: big.Float.pow5
tags: [method private]
```

```Go
func (z *Float) pow5(n uint64) *Float
```

pow5 sets z to 5**n and returns z. n must not be negative. 

#### <a id="Float.round" href="#Float.round">func (z *Float) round(sbit uint)</a>

```
searchKey: big.Float.round
tags: [method private]
```

```Go
func (z *Float) round(sbit uint)
```

round rounds z according to z.mode to z.prec bits and sets z.acc accordingly. sbit must be 0 or 1 and summarizes any "sticky bit" information one might have before calling round. z's mantissa must be normalized (with the msb set) or empty. 

CAUTION: The rounding modes ToNegativeInf, ToPositiveInf are affected by the sign of z. For correct rounding, the sign of z must be set correctly before calling round. 

#### <a id="Float.scan" href="#Float.scan">func (z *Float) scan(r io.ByteScanner, base int) (f *Float, b int, err error)</a>

```
searchKey: big.Float.scan
tags: [method private]
```

```Go
func (z *Float) scan(r io.ByteScanner, base int) (f *Float, b int, err error)
```

scan is like Parse but reads the longest possible prefix representing a valid floating point number from an io.ByteScanner rather than a string. It serves as the implementation of Parse. It does not recognize ±Inf and does not expect EOF at the end. 

#### <a id="Float.setBits64" href="#Float.setBits64">func (z *Float) setBits64(neg bool, x uint64) *Float</a>

```
searchKey: big.Float.setBits64
tags: [method private]
```

```Go
func (z *Float) setBits64(neg bool, x uint64) *Float
```

#### <a id="Float.setExpAndRound" href="#Float.setExpAndRound">func (z *Float) setExpAndRound(exp int64, sbit uint)</a>

```
searchKey: big.Float.setExpAndRound
tags: [method private]
```

```Go
func (z *Float) setExpAndRound(exp int64, sbit uint)
```

#### <a id="Float.sqrtInverse" href="#Float.sqrtInverse">func (z *Float) sqrtInverse(x *Float)</a>

```
searchKey: big.Float.sqrtInverse
tags: [method private]
```

```Go
func (z *Float) sqrtInverse(x *Float)
```

Compute √x (to z.prec precision) by solving 

```
1/t² - x = 0

```
for t (using Newton's method), and then inverting. 

#### <a id="Float.uadd" href="#Float.uadd">func (z *Float) uadd(x, y *Float)</a>

```
searchKey: big.Float.uadd
tags: [method private]
```

```Go
func (z *Float) uadd(x, y *Float)
```

z = x + y, ignoring signs of x and y for the addition but using the sign of z for rounding the result. x and y must have a non-empty mantissa and valid exponent. 

#### <a id="Float.ucmp" href="#Float.ucmp">func (x *Float) ucmp(y *Float) int</a>

```
searchKey: big.Float.ucmp
tags: [method private]
```

```Go
func (x *Float) ucmp(y *Float) int
```

ucmp returns -1, 0, or +1, depending on whether |x| < |y|, |x| == |y|, or |x| > |y|. x and y must have a non-empty mantissa and valid exponent. 

#### <a id="Float.uint64" href="#Float.uint64">func (x *Float) uint64() uint64</a>

```
searchKey: big.Float.uint64
tags: [function private]
```

```Go
func (x *Float) uint64() uint64
```

#### <a id="Float.umul" href="#Float.umul">func (z *Float) umul(x, y *Float)</a>

```
searchKey: big.Float.umul
tags: [method private]
```

```Go
func (z *Float) umul(x, y *Float)
```

z = x * y, ignoring signs of x and y for the multiplication but using the sign of z for rounding the result. x and y must have a non-empty mantissa and valid exponent. 

#### <a id="Float.uquo" href="#Float.uquo">func (z *Float) uquo(x, y *Float)</a>

```
searchKey: big.Float.uquo
tags: [method private]
```

```Go
func (z *Float) uquo(x, y *Float)
```

z = x / y, ignoring signs of x and y for the division but using the sign of z for rounding the result. x and y must have a non-empty mantissa and valid exponent. 

#### <a id="Float.usub" href="#Float.usub">func (z *Float) usub(x, y *Float)</a>

```
searchKey: big.Float.usub
tags: [method private]
```

```Go
func (z *Float) usub(x, y *Float)
```

z = x - y for |x| > |y|, ignoring signs of x and y for the subtraction but using the sign of z for rounding the result. x and y must have a non-empty mantissa and valid exponent. 

#### <a id="Float.validate" href="#Float.validate">func (x *Float) validate()</a>

```
searchKey: big.Float.validate
tags: [function private]
```

```Go
func (x *Float) validate()
```

debugging support 

### <a id="Int" href="#Int">type Int struct</a>

```
searchKey: big.Int
tags: [struct]
```

```Go
type Int struct {
	neg bool // sign
	abs nat  // absolute value of the integer
}
```

An Int represents a signed multi-precision integer. The zero value for an Int represents the value 0. 

Operations always take pointer arguments (*Int) rather than Int values, and each unique Int value requires its own unique *Int pointer. To "copy" an Int value, an existing (or newly allocated) Int must be set to a new value using the Int.Set method; shallow copies of Ints are not supported and may lead to errors. 

#### <a id="NewInt" href="#NewInt">func NewInt(x int64) *Int</a>

```
searchKey: big.NewInt
tags: [method]
```

```Go
func NewInt(x int64) *Int
```

NewInt allocates and returns a new Int set to x. 

#### <a id="altSetBit" href="#altSetBit">func altSetBit(z *Int, x *Int, i int, b uint) *Int</a>

```
searchKey: big.altSetBit
tags: [method private]
```

```Go
func altSetBit(z *Int, x *Int, i int, b uint) *Int
```

#### <a id="euclidExtGCD" href="#euclidExtGCD">func euclidExtGCD(a, b *Int) (g, x, y *Int)</a>

```
searchKey: big.euclidExtGCD
tags: [method private]
```

```Go
func euclidExtGCD(a, b *Int) (g, x, y *Int)
```

euclidExtGCD is a reference implementation of Euclid's extended GCD algorithm for testing against optimized algorithms. Requirements: a, b > 0 

#### <a id="randInt" href="#randInt">func randInt(r *rand.Rand, size uint) *Int</a>

```
searchKey: big.randInt
tags: [method private]
```

```Go
func randInt(r *rand.Rand, size uint) *Int
```

randInt returns a pseudo-random Int in the range [1<<(size-1), (1<<size) - 1] 

#### <a id="tri" href="#tri">func tri(n uint) *Int</a>

```
searchKey: big.tri
tags: [method private]
```

```Go
func tri(n uint) *Int
```

tri generates the trinomial 2**(n*2) - 2**n - 1, which is always 3 mod 4 and 7 mod 8, so that 2 is always a quadratic residue. 

#### <a id="Int.Abs" href="#Int.Abs">func (z *Int) Abs(x *Int) *Int</a>

```
searchKey: big.Int.Abs
tags: [method]
```

```Go
func (z *Int) Abs(x *Int) *Int
```

Abs sets z to |x| (the absolute value of x) and returns z. 

#### <a id="Int.Add" href="#Int.Add">func (z *Int) Add(x, y *Int) *Int</a>

```
searchKey: big.Int.Add
tags: [method]
```

```Go
func (z *Int) Add(x, y *Int) *Int
```

Add sets z to the sum x+y and returns z. 

#### <a id="Int.And" href="#Int.And">func (z *Int) And(x, y *Int) *Int</a>

```
searchKey: big.Int.And
tags: [method]
```

```Go
func (z *Int) And(x, y *Int) *Int
```

And sets z = x & y and returns z. 

#### <a id="Int.AndNot" href="#Int.AndNot">func (z *Int) AndNot(x, y *Int) *Int</a>

```
searchKey: big.Int.AndNot
tags: [method]
```

```Go
func (z *Int) AndNot(x, y *Int) *Int
```

AndNot sets z = x &^ y and returns z. 

#### <a id="Int.Append" href="#Int.Append">func (x *Int) Append(buf []byte, base int) []byte</a>

```
searchKey: big.Int.Append
tags: [method]
```

```Go
func (x *Int) Append(buf []byte, base int) []byte
```

Append appends the string representation of x, as generated by x.Text(base), to buf and returns the extended buffer. 

#### <a id="Int.Binomial" href="#Int.Binomial">func (z *Int) Binomial(n, k int64) *Int</a>

```
searchKey: big.Int.Binomial
tags: [method]
```

```Go
func (z *Int) Binomial(n, k int64) *Int
```

Binomial sets z to the binomial coefficient of (n, k) and returns z. 

#### <a id="Int.Bit" href="#Int.Bit">func (x *Int) Bit(i int) uint</a>

```
searchKey: big.Int.Bit
tags: [method]
```

```Go
func (x *Int) Bit(i int) uint
```

Bit returns the value of the i'th bit of x. That is, it returns (x>>i)&1. The bit index i must be >= 0. 

#### <a id="Int.BitLen" href="#Int.BitLen">func (x *Int) BitLen() int</a>

```
searchKey: big.Int.BitLen
tags: [function]
```

```Go
func (x *Int) BitLen() int
```

BitLen returns the length of the absolute value of x in bits. The bit length of 0 is 0. 

#### <a id="Int.Bits" href="#Int.Bits">func (x *Int) Bits() []Word</a>

```
searchKey: big.Int.Bits
tags: [function]
```

```Go
func (x *Int) Bits() []Word
```

Bits provides raw (unchecked but fast) access to x by returning its absolute value as a little-endian Word slice. The result and x share the same underlying array. Bits is intended to support implementation of missing low-level Int functionality outside this package; it should be avoided otherwise. 

#### <a id="Int.Bytes" href="#Int.Bytes">func (x *Int) Bytes() []byte</a>

```
searchKey: big.Int.Bytes
tags: [function]
```

```Go
func (x *Int) Bytes() []byte
```

Bytes returns the absolute value of x as a big-endian byte slice. 

To use a fixed length slice, or a preallocated one, use FillBytes. 

#### <a id="Int.Cmp" href="#Int.Cmp">func (x *Int) Cmp(y *Int) (r int)</a>

```
searchKey: big.Int.Cmp
tags: [method]
```

```Go
func (x *Int) Cmp(y *Int) (r int)
```

Cmp compares x and y and returns: 

```
-1 if x <  y
 0 if x == y
+1 if x >  y

```
#### <a id="Int.CmpAbs" href="#Int.CmpAbs">func (x *Int) CmpAbs(y *Int) int</a>

```
searchKey: big.Int.CmpAbs
tags: [method]
```

```Go
func (x *Int) CmpAbs(y *Int) int
```

CmpAbs compares the absolute values of x and y and returns: 

```
-1 if |x| <  |y|
 0 if |x| == |y|
+1 if |x| >  |y|

```
#### <a id="Int.Div" href="#Int.Div">func (z *Int) Div(x, y *Int) *Int</a>

```
searchKey: big.Int.Div
tags: [method]
```

```Go
func (z *Int) Div(x, y *Int) *Int
```

Div sets z to the quotient x/y for y != 0 and returns z. If y == 0, a division-by-zero run-time panic occurs. Div implements Euclidean division (unlike Go); see DivMod for more details. 

#### <a id="Int.DivMod" href="#Int.DivMod">func (z *Int) DivMod(x, y, m *Int) (*Int, *Int)</a>

```
searchKey: big.Int.DivMod
tags: [method]
```

```Go
func (z *Int) DivMod(x, y, m *Int) (*Int, *Int)
```

DivMod sets z to the quotient x div y and m to the modulus x mod y and returns the pair (z, m) for y != 0. If y == 0, a division-by-zero run-time panic occurs. 

DivMod implements Euclidean division and modulus (unlike Go): 

```
q = x div y  such that
m = x - y*q  with 0 <= m < |y|

```
(See Raymond T. Boute, `The Euclidean definition of the functions div and mod'. ACM Transactions on Programming Languages and Systems (TOPLAS), 14(2):127-144, New York, NY, USA, 4/1992. ACM press.) See QuoRem for T-division and modulus (like Go). 

#### <a id="Int.Exp" href="#Int.Exp">func (z *Int) Exp(x, y, m *Int) *Int</a>

```
searchKey: big.Int.Exp
tags: [method]
```

```Go
func (z *Int) Exp(x, y, m *Int) *Int
```

Exp sets z = x**y mod |m| (i.e. the sign of m is ignored), and returns z. If m == nil or m == 0, z = x**y unless y <= 0 then z = 1. If m != 0, y < 0, and x and m are not relatively prime, z is unchanged and nil is returned. 

Modular exponentiation of inputs of a particular size is not a cryptographically constant-time operation. 

#### <a id="Int.FillBytes" href="#Int.FillBytes">func (x *Int) FillBytes(buf []byte) []byte</a>

```
searchKey: big.Int.FillBytes
tags: [method]
```

```Go
func (x *Int) FillBytes(buf []byte) []byte
```

FillBytes sets buf to the absolute value of x, storing it as a zero-extended big-endian byte slice, and returns buf. 

If the absolute value of x doesn't fit in buf, FillBytes will panic. 

#### <a id="Int.Format" href="#Int.Format">func (x *Int) Format(s fmt.State, ch rune)</a>

```
searchKey: big.Int.Format
tags: [method]
```

```Go
func (x *Int) Format(s fmt.State, ch rune)
```

Format implements fmt.Formatter. It accepts the formats 'b' (binary), 'o' (octal with 0 prefix), 'O' (octal with 0o prefix), 'd' (decimal), 'x' (lowercase hexadecimal), and 'X' (uppercase hexadecimal). Also supported are the full suite of package fmt's format flags for integral types, including '+' and ' ' for sign control, '#' for leading zero in octal and for hexadecimal, a leading "0x" or "0X" for "%#x" and "%#X" respectively, specification of minimum digits precision, output field width, space or zero padding, and '-' for left or right justification. 

#### <a id="Int.GCD" href="#Int.GCD">func (z *Int) GCD(x, y, a, b *Int) *Int</a>

```
searchKey: big.Int.GCD
tags: [method]
```

```Go
func (z *Int) GCD(x, y, a, b *Int) *Int
```

GCD sets z to the greatest common divisor of a and b and returns z. If x or y are not nil, GCD sets their value such that z = a*x + b*y. 

a and b may be positive, zero or negative. (Before Go 1.14 both had to be > 0.) Regardless of the signs of a and b, z is always >= 0. 

If a == b == 0, GCD sets z = x = y = 0. 

If a == 0 and b != 0, GCD sets z = |b|, x = 0, y = sign(b) * 1. 

If a != 0 and b == 0, GCD sets z = |a|, x = sign(a) * 1, y = 0. 

#### <a id="Int.GobDecode" href="#Int.GobDecode">func (z *Int) GobDecode(buf []byte) error</a>

```
searchKey: big.Int.GobDecode
tags: [method]
```

```Go
func (z *Int) GobDecode(buf []byte) error
```

GobDecode implements the gob.GobDecoder interface. 

#### <a id="Int.GobEncode" href="#Int.GobEncode">func (x *Int) GobEncode() ([]byte, error)</a>

```
searchKey: big.Int.GobEncode
tags: [function]
```

```Go
func (x *Int) GobEncode() ([]byte, error)
```

GobEncode implements the gob.GobEncoder interface. 

#### <a id="Int.Int64" href="#Int.Int64">func (x *Int) Int64() int64</a>

```
searchKey: big.Int.Int64
tags: [function]
```

```Go
func (x *Int) Int64() int64
```

Int64 returns the int64 representation of x. If x cannot be represented in an int64, the result is undefined. 

#### <a id="Int.IsInt64" href="#Int.IsInt64">func (x *Int) IsInt64() bool</a>

```
searchKey: big.Int.IsInt64
tags: [function]
```

```Go
func (x *Int) IsInt64() bool
```

IsInt64 reports whether x can be represented as an int64. 

#### <a id="Int.IsUint64" href="#Int.IsUint64">func (x *Int) IsUint64() bool</a>

```
searchKey: big.Int.IsUint64
tags: [function]
```

```Go
func (x *Int) IsUint64() bool
```

IsUint64 reports whether x can be represented as a uint64. 

#### <a id="Int.Lsh" href="#Int.Lsh">func (z *Int) Lsh(x *Int, n uint) *Int</a>

```
searchKey: big.Int.Lsh
tags: [method]
```

```Go
func (z *Int) Lsh(x *Int, n uint) *Int
```

Lsh sets z = x << n and returns z. 

#### <a id="Int.MarshalJSON" href="#Int.MarshalJSON">func (x *Int) MarshalJSON() ([]byte, error)</a>

```
searchKey: big.Int.MarshalJSON
tags: [function]
```

```Go
func (x *Int) MarshalJSON() ([]byte, error)
```

MarshalJSON implements the json.Marshaler interface. 

#### <a id="Int.MarshalText" href="#Int.MarshalText">func (x *Int) MarshalText() (text []byte, err error)</a>

```
searchKey: big.Int.MarshalText
tags: [function]
```

```Go
func (x *Int) MarshalText() (text []byte, err error)
```

MarshalText implements the encoding.TextMarshaler interface. 

#### <a id="Int.Mod" href="#Int.Mod">func (z *Int) Mod(x, y *Int) *Int</a>

```
searchKey: big.Int.Mod
tags: [method]
```

```Go
func (z *Int) Mod(x, y *Int) *Int
```

Mod sets z to the modulus x%y for y != 0 and returns z. If y == 0, a division-by-zero run-time panic occurs. Mod implements Euclidean modulus (unlike Go); see DivMod for more details. 

#### <a id="Int.ModInverse" href="#Int.ModInverse">func (z *Int) ModInverse(g, n *Int) *Int</a>

```
searchKey: big.Int.ModInverse
tags: [method]
```

```Go
func (z *Int) ModInverse(g, n *Int) *Int
```

ModInverse sets z to the multiplicative inverse of g in the ring ℤ/nℤ and returns z. If g and n are not relatively prime, g has no multiplicative inverse in the ring ℤ/nℤ.  In this case, z is unchanged and the return value is nil. 

#### <a id="Int.ModSqrt" href="#Int.ModSqrt">func (z *Int) ModSqrt(x, p *Int) *Int</a>

```
searchKey: big.Int.ModSqrt
tags: [method]
```

```Go
func (z *Int) ModSqrt(x, p *Int) *Int
```

ModSqrt sets z to a square root of x mod p if such a square root exists, and returns z. The modulus p must be an odd prime. If x is not a square mod p, ModSqrt leaves z unchanged and returns nil. This function panics if p is not an odd integer. 

#### <a id="Int.Mul" href="#Int.Mul">func (z *Int) Mul(x, y *Int) *Int</a>

```
searchKey: big.Int.Mul
tags: [method]
```

```Go
func (z *Int) Mul(x, y *Int) *Int
```

Mul sets z to the product x*y and returns z. 

#### <a id="Int.MulRange" href="#Int.MulRange">func (z *Int) MulRange(a, b int64) *Int</a>

```
searchKey: big.Int.MulRange
tags: [method]
```

```Go
func (z *Int) MulRange(a, b int64) *Int
```

MulRange sets z to the product of all integers in the range [a, b] inclusively and returns z. If a > b (empty range), the result is 1. 

#### <a id="Int.Neg" href="#Int.Neg">func (z *Int) Neg(x *Int) *Int</a>

```
searchKey: big.Int.Neg
tags: [method]
```

```Go
func (z *Int) Neg(x *Int) *Int
```

Neg sets z to -x and returns z. 

#### <a id="Int.Not" href="#Int.Not">func (z *Int) Not(x *Int) *Int</a>

```
searchKey: big.Int.Not
tags: [method]
```

```Go
func (z *Int) Not(x *Int) *Int
```

Not sets z = ^x and returns z. 

#### <a id="Int.Or" href="#Int.Or">func (z *Int) Or(x, y *Int) *Int</a>

```
searchKey: big.Int.Or
tags: [method]
```

```Go
func (z *Int) Or(x, y *Int) *Int
```

Or sets z = x | y and returns z. 

#### <a id="Int.ProbablyPrime" href="#Int.ProbablyPrime">func (x *Int) ProbablyPrime(n int) bool</a>

```
searchKey: big.Int.ProbablyPrime
tags: [method]
```

```Go
func (x *Int) ProbablyPrime(n int) bool
```

ProbablyPrime reports whether x is probably prime, applying the Miller-Rabin test with n pseudorandomly chosen bases as well as a Baillie-PSW test. 

If x is prime, ProbablyPrime returns true. If x is chosen randomly and not prime, ProbablyPrime probably returns false. The probability of returning true for a randomly chosen non-prime is at most ¼ⁿ. 

ProbablyPrime is 100% accurate for inputs less than 2⁶⁴. See Menezes et al., Handbook of Applied Cryptography, 1997, pp. 145-149, and FIPS 186-4 Appendix F for further discussion of the error probabilities. 

ProbablyPrime is not suitable for judging primes that an adversary may have crafted to fool the test. 

As of Go 1.8, ProbablyPrime(0) is allowed and applies only a Baillie-PSW test. Before Go 1.8, ProbablyPrime applied only the Miller-Rabin tests, and ProbablyPrime(0) panicked. 

#### <a id="Int.Quo" href="#Int.Quo">func (z *Int) Quo(x, y *Int) *Int</a>

```
searchKey: big.Int.Quo
tags: [method]
```

```Go
func (z *Int) Quo(x, y *Int) *Int
```

Quo sets z to the quotient x/y for y != 0 and returns z. If y == 0, a division-by-zero run-time panic occurs. Quo implements truncated division (like Go); see QuoRem for more details. 

#### <a id="Int.QuoRem" href="#Int.QuoRem">func (z *Int) QuoRem(x, y, r *Int) (*Int, *Int)</a>

```
searchKey: big.Int.QuoRem
tags: [method]
```

```Go
func (z *Int) QuoRem(x, y, r *Int) (*Int, *Int)
```

QuoRem sets z to the quotient x/y and r to the remainder x%y and returns the pair (z, r) for y != 0. If y == 0, a division-by-zero run-time panic occurs. 

QuoRem implements T-division and modulus (like Go): 

```
q = x/y      with the result truncated to zero
r = x - y*q

```
(See Daan Leijen, `Division and Modulus for Computer Scientists'.) See DivMod for Euclidean division and modulus (unlike Go). 

#### <a id="Int.Rand" href="#Int.Rand">func (z *Int) Rand(rnd *rand.Rand, n *Int) *Int</a>

```
searchKey: big.Int.Rand
tags: [method]
```

```Go
func (z *Int) Rand(rnd *rand.Rand, n *Int) *Int
```

Rand sets z to a pseudo-random number in [0, n) and returns z. 

As this uses the math/rand package, it must not be used for security-sensitive work. Use crypto/rand.Int instead. 

#### <a id="Int.Rem" href="#Int.Rem">func (z *Int) Rem(x, y *Int) *Int</a>

```
searchKey: big.Int.Rem
tags: [method]
```

```Go
func (z *Int) Rem(x, y *Int) *Int
```

Rem sets z to the remainder x%y for y != 0 and returns z. If y == 0, a division-by-zero run-time panic occurs. Rem implements truncated modulus (like Go); see QuoRem for more details. 

#### <a id="Int.Rsh" href="#Int.Rsh">func (z *Int) Rsh(x *Int, n uint) *Int</a>

```
searchKey: big.Int.Rsh
tags: [method]
```

```Go
func (z *Int) Rsh(x *Int, n uint) *Int
```

Rsh sets z = x >> n and returns z. 

#### <a id="Int.Scan" href="#Int.Scan">func (z *Int) Scan(s fmt.ScanState, ch rune) error</a>

```
searchKey: big.Int.Scan
tags: [method]
```

```Go
func (z *Int) Scan(s fmt.ScanState, ch rune) error
```

Scan is a support routine for fmt.Scanner; it sets z to the value of the scanned number. It accepts the formats 'b' (binary), 'o' (octal), 'd' (decimal), 'x' (lowercase hexadecimal), and 'X' (uppercase hexadecimal). 

#### <a id="Int.Set" href="#Int.Set">func (z *Int) Set(x *Int) *Int</a>

```
searchKey: big.Int.Set
tags: [method]
```

```Go
func (z *Int) Set(x *Int) *Int
```

Set sets z to x and returns z. 

#### <a id="Int.SetBit" href="#Int.SetBit">func (z *Int) SetBit(x *Int, i int, b uint) *Int</a>

```
searchKey: big.Int.SetBit
tags: [method]
```

```Go
func (z *Int) SetBit(x *Int, i int, b uint) *Int
```

SetBit sets z to x, with x's i'th bit set to b (0 or 1). That is, if b is 1 SetBit sets z = x | (1 << i); if b is 0 SetBit sets z = x &^ (1 << i). If b is not 0 or 1, SetBit will panic. 

#### <a id="Int.SetBits" href="#Int.SetBits">func (z *Int) SetBits(abs []Word) *Int</a>

```
searchKey: big.Int.SetBits
tags: [method]
```

```Go
func (z *Int) SetBits(abs []Word) *Int
```

SetBits provides raw (unchecked but fast) access to z by setting its value to abs, interpreted as a little-endian Word slice, and returning z. The result and abs share the same underlying array. SetBits is intended to support implementation of missing low-level Int functionality outside this package; it should be avoided otherwise. 

#### <a id="Int.SetBytes" href="#Int.SetBytes">func (z *Int) SetBytes(buf []byte) *Int</a>

```
searchKey: big.Int.SetBytes
tags: [method]
```

```Go
func (z *Int) SetBytes(buf []byte) *Int
```

SetBytes interprets buf as the bytes of a big-endian unsigned integer, sets z to that value, and returns z. 

#### <a id="Int.SetInt64" href="#Int.SetInt64">func (z *Int) SetInt64(x int64) *Int</a>

```
searchKey: big.Int.SetInt64
tags: [method]
```

```Go
func (z *Int) SetInt64(x int64) *Int
```

SetInt64 sets z to x and returns z. 

#### <a id="Int.SetString" href="#Int.SetString">func (z *Int) SetString(s string, base int) (*Int, bool)</a>

```
searchKey: big.Int.SetString
tags: [method]
```

```Go
func (z *Int) SetString(s string, base int) (*Int, bool)
```

SetString sets z to the value of s, interpreted in the given base, and returns z and a boolean indicating success. The entire string (not just a prefix) must be valid for success. If SetString fails, the value of z is undefined but the returned value is nil. 

The base argument must be 0 or a value between 2 and MaxBase. For base 0, the number prefix determines the actual base: A prefix of `0b' or `0B' selects base 2, `0', `0o' or `0O' selects base 8, and `0x' or `0X' selects base 16. Otherwise, the selected base is 10 and no prefix is accepted. 

For bases <= 36, lower and upper case letters are considered the same: The letters 'a' to 'z' and 'A' to 'Z' represent digit values 10 to 35. For bases > 36, the upper case letters 'A' to 'Z' represent the digit values 36 to 61. 

For base 0, an underscore character `_' may appear between a base prefix and an adjacent digit, and between successive digits; such underscores do not change the value of the number. Incorrect placement of underscores is reported as an error if there are no other errors. If base != 0, underscores are not recognized and act like any other character that is not a valid digit. 

#### <a id="Int.SetUint64" href="#Int.SetUint64">func (z *Int) SetUint64(x uint64) *Int</a>

```
searchKey: big.Int.SetUint64
tags: [method]
```

```Go
func (z *Int) SetUint64(x uint64) *Int
```

SetUint64 sets z to x and returns z. 

#### <a id="Int.Sign" href="#Int.Sign">func (x *Int) Sign() int</a>

```
searchKey: big.Int.Sign
tags: [function]
```

```Go
func (x *Int) Sign() int
```

Sign returns: 

```
-1 if x <  0
 0 if x == 0
+1 if x >  0

```
#### <a id="Int.Sqrt" href="#Int.Sqrt">func (z *Int) Sqrt(x *Int) *Int</a>

```
searchKey: big.Int.Sqrt
tags: [method]
```

```Go
func (z *Int) Sqrt(x *Int) *Int
```

Sqrt sets z to ⌊√x⌋, the largest integer such that z² ≤ x, and returns z. It panics if x is negative. 

#### <a id="Int.String" href="#Int.String">func (x *Int) String() string</a>

```
searchKey: big.Int.String
tags: [function]
```

```Go
func (x *Int) String() string
```

String returns the decimal representation of x as generated by x.Text(10). 

#### <a id="Int.Sub" href="#Int.Sub">func (z *Int) Sub(x, y *Int) *Int</a>

```
searchKey: big.Int.Sub
tags: [method]
```

```Go
func (z *Int) Sub(x, y *Int) *Int
```

Sub sets z to the difference x-y and returns z. 

#### <a id="Int.Text" href="#Int.Text">func (x *Int) Text(base int) string</a>

```
searchKey: big.Int.Text
tags: [method]
```

```Go
func (x *Int) Text(base int) string
```

Text returns the string representation of x in the given base. Base must be between 2 and 62, inclusive. The result uses the lower-case letters 'a' to 'z' for digit values 10 to 35, and the upper-case letters 'A' to 'Z' for digit values 36 to 61. No prefix (such as "0x") is added to the string. If x is a nil pointer it returns "<nil>". 

#### <a id="Int.TrailingZeroBits" href="#Int.TrailingZeroBits">func (x *Int) TrailingZeroBits() uint</a>

```
searchKey: big.Int.TrailingZeroBits
tags: [function]
```

```Go
func (x *Int) TrailingZeroBits() uint
```

TrailingZeroBits returns the number of consecutive least significant zero bits of |x|. 

#### <a id="Int.Uint64" href="#Int.Uint64">func (x *Int) Uint64() uint64</a>

```
searchKey: big.Int.Uint64
tags: [function]
```

```Go
func (x *Int) Uint64() uint64
```

Uint64 returns the uint64 representation of x. If x cannot be represented in a uint64, the result is undefined. 

#### <a id="Int.UnmarshalJSON" href="#Int.UnmarshalJSON">func (z *Int) UnmarshalJSON(text []byte) error</a>

```
searchKey: big.Int.UnmarshalJSON
tags: [method]
```

```Go
func (z *Int) UnmarshalJSON(text []byte) error
```

UnmarshalJSON implements the json.Unmarshaler interface. 

#### <a id="Int.UnmarshalText" href="#Int.UnmarshalText">func (z *Int) UnmarshalText(text []byte) error</a>

```
searchKey: big.Int.UnmarshalText
tags: [method]
```

```Go
func (z *Int) UnmarshalText(text []byte) error
```

UnmarshalText implements the encoding.TextUnmarshaler interface. 

#### <a id="Int.Xor" href="#Int.Xor">func (z *Int) Xor(x, y *Int) *Int</a>

```
searchKey: big.Int.Xor
tags: [method]
```

```Go
func (z *Int) Xor(x, y *Int) *Int
```

Xor sets z = x ^ y and returns z. 

#### <a id="Int.lehmerGCD" href="#Int.lehmerGCD">func (z *Int) lehmerGCD(x, y, a, b *Int) *Int</a>

```
searchKey: big.Int.lehmerGCD
tags: [method private]
```

```Go
func (z *Int) lehmerGCD(x, y, a, b *Int) *Int
```

lehmerGCD sets z to the greatest common divisor of a and b, which both must be != 0, and returns z. If x or y are not nil, their values are set such that z = a*x + b*y. See Knuth, The Art of Computer Programming, Vol. 2, Section 4.5.2, Algorithm L. This implementation uses the improved condition by Collins requiring only one quotient and avoiding the possibility of single Word overflow. See Jebelean, "Improving the multiprecision Euclidean algorithm", Design and Implementation of Symbolic Computation Systems, pp 45-58. The cosequences are updated according to Algorithm 10.45 from Cohen et al. "Handbook of Elliptic and Hyperelliptic Curve Cryptography" pp 192. 

#### <a id="Int.modSqrt3Mod4Prime" href="#Int.modSqrt3Mod4Prime">func (z *Int) modSqrt3Mod4Prime(x, p *Int) *Int</a>

```
searchKey: big.Int.modSqrt3Mod4Prime
tags: [method private]
```

```Go
func (z *Int) modSqrt3Mod4Prime(x, p *Int) *Int
```

modSqrt3Mod4 uses the identity 

```
   (a^((p+1)/4))^2  mod p
== u^(p+1)          mod p
== u^2              mod p

```
to calculate the square root of any quadratic residue mod p quickly for 3 mod 4 primes. 

#### <a id="Int.modSqrt5Mod8Prime" href="#Int.modSqrt5Mod8Prime">func (z *Int) modSqrt5Mod8Prime(x, p *Int) *Int</a>

```
searchKey: big.Int.modSqrt5Mod8Prime
tags: [method private]
```

```Go
func (z *Int) modSqrt5Mod8Prime(x, p *Int) *Int
```

modSqrt5Mod8 uses Atkin's observation that 2 is not a square mod p 

```
alpha ==  (2*a)^((p-5)/8)    mod p
beta  ==  2*a*alpha^2        mod p  is a square root of -1
b     ==  a*alpha*(beta-1)   mod p  is a square root of a

```
to calculate the square root of any quadratic residue mod p quickly for 5 mod 8 primes. 

#### <a id="Int.modSqrtTonelliShanks" href="#Int.modSqrtTonelliShanks">func (z *Int) modSqrtTonelliShanks(x, p *Int) *Int</a>

```
searchKey: big.Int.modSqrtTonelliShanks
tags: [method private]
```

```Go
func (z *Int) modSqrtTonelliShanks(x, p *Int) *Int
```

modSqrtTonelliShanks uses the Tonelli-Shanks algorithm to find the square root of a quadratic residue modulo any prime. 

#### <a id="Int.scaleDenom" href="#Int.scaleDenom">func (z *Int) scaleDenom(x *Int, f nat)</a>

```
searchKey: big.Int.scaleDenom
tags: [method private]
```

```Go
func (z *Int) scaleDenom(x *Int, f nat)
```

scaleDenom sets z to the product x*f. If f == 0 (zero value of denominator), z is set to (a copy of) x. 

#### <a id="Int.scan" href="#Int.scan">func (z *Int) scan(r io.ByteScanner, base int) (*Int, int, error)</a>

```
searchKey: big.Int.scan
tags: [method private]
```

```Go
func (z *Int) scan(r io.ByteScanner, base int) (*Int, int, error)
```

scan sets z to the integer value corresponding to the longest possible prefix read from r representing a signed integer number in a given conversion base. It returns z, the actual conversion base used, and an error, if any. In the error case, the value of z is undefined but the returned value is nil. The syntax follows the syntax of integer literals in Go. 

The base argument must be 0 or a value from 2 through MaxBase. If the base is 0, the string prefix determines the actual conversion base. A prefix of `0b' or `0B' selects base 2; a `0', `0o', or `0O' prefix selects base 8, and a `0x' or `0X' prefix selects base 16. Otherwise the selected base is 10. 

#### <a id="Int.setFromScanner" href="#Int.setFromScanner">func (z *Int) setFromScanner(r io.ByteScanner, base int) (*Int, bool)</a>

```
searchKey: big.Int.setFromScanner
tags: [method private]
```

```Go
func (z *Int) setFromScanner(r io.ByteScanner, base int) (*Int, bool)
```

setFromScanner implements SetString given an io.BytesScanner. For documentation see comments of SetString. 

### <a id="Rat" href="#Rat">type Rat struct</a>

```
searchKey: big.Rat
tags: [struct]
```

```Go
type Rat struct {
	// To make zero values for Rat work w/o initialization,
	// a zero value of b (len(b) == 0) acts like b == 1. At
	// the earliest opportunity (when an assignment to the Rat
	// is made), such uninitialized denominators are set to 1.
	// a.neg determines the sign of the Rat, b.neg is ignored.
	a, b Int
}
```

A Rat represents a quotient a/b of arbitrary precision. The zero value for a Rat represents the value 0. 

Operations always take pointer arguments (*Rat) rather than Rat values, and each unique Rat value requires its own unique *Rat pointer. To "copy" a Rat value, an existing (or newly allocated) Rat must be set to a new value using the Rat.Set method; shallow copies of Rats are not supported and may lead to errors. 

#### <a id="NewRat" href="#NewRat">func NewRat(a, b int64) *Rat</a>

```
searchKey: big.NewRat
tags: [method]
```

```Go
func NewRat(a, b int64) *Rat
```

NewRat creates a new Rat with numerator a and denominator b. 

#### <a id="delta" href="#delta">func delta(r *Rat, f float64) *Rat</a>

```
searchKey: big.delta
tags: [method private]
```

```Go
func delta(r *Rat, f float64) *Rat
```

delta returns the absolute difference between r and f. 

#### <a id="Rat.Abs" href="#Rat.Abs">func (z *Rat) Abs(x *Rat) *Rat</a>

```
searchKey: big.Rat.Abs
tags: [method]
```

```Go
func (z *Rat) Abs(x *Rat) *Rat
```

Abs sets z to |x| (the absolute value of x) and returns z. 

#### <a id="Rat.Add" href="#Rat.Add">func (z *Rat) Add(x, y *Rat) *Rat</a>

```
searchKey: big.Rat.Add
tags: [method]
```

```Go
func (z *Rat) Add(x, y *Rat) *Rat
```

Add sets z to the sum x+y and returns z. 

#### <a id="Rat.Cmp" href="#Rat.Cmp">func (x *Rat) Cmp(y *Rat) int</a>

```
searchKey: big.Rat.Cmp
tags: [method]
```

```Go
func (x *Rat) Cmp(y *Rat) int
```

Cmp compares x and y and returns: 

```
-1 if x <  y
 0 if x == y
+1 if x >  y

```
#### <a id="Rat.Denom" href="#Rat.Denom">func (x *Rat) Denom() *Int</a>

```
searchKey: big.Rat.Denom
tags: [function]
```

```Go
func (x *Rat) Denom() *Int
```

Denom returns the denominator of x; it is always > 0. The result is a reference to x's denominator, unless x is an uninitialized (zero value) Rat, in which case the result is a new Int of value 1. (To initialize x, any operation that sets x will do, including x.Set(x).) If the result is a reference to x's denominator it may change if a new value is assigned to x, and vice versa. 

#### <a id="Rat.Float32" href="#Rat.Float32">func (x *Rat) Float32() (f float32, exact bool)</a>

```
searchKey: big.Rat.Float32
tags: [function]
```

```Go
func (x *Rat) Float32() (f float32, exact bool)
```

Float32 returns the nearest float32 value for x and a bool indicating whether f represents x exactly. If the magnitude of x is too large to be represented by a float32, f is an infinity and exact is false. The sign of f always matches the sign of x, even if f == 0. 

#### <a id="Rat.Float64" href="#Rat.Float64">func (x *Rat) Float64() (f float64, exact bool)</a>

```
searchKey: big.Rat.Float64
tags: [function]
```

```Go
func (x *Rat) Float64() (f float64, exact bool)
```

Float64 returns the nearest float64 value for x and a bool indicating whether f represents x exactly. If the magnitude of x is too large to be represented by a float64, f is an infinity and exact is false. The sign of f always matches the sign of x, even if f == 0. 

#### <a id="Rat.FloatString" href="#Rat.FloatString">func (x *Rat) FloatString(prec int) string</a>

```
searchKey: big.Rat.FloatString
tags: [method]
```

```Go
func (x *Rat) FloatString(prec int) string
```

FloatString returns a string representation of x in decimal form with prec digits of precision after the radix point. The last digit is rounded to nearest, with halves rounded away from zero. 

#### <a id="Rat.GobDecode" href="#Rat.GobDecode">func (z *Rat) GobDecode(buf []byte) error</a>

```
searchKey: big.Rat.GobDecode
tags: [method]
```

```Go
func (z *Rat) GobDecode(buf []byte) error
```

GobDecode implements the gob.GobDecoder interface. 

#### <a id="Rat.GobEncode" href="#Rat.GobEncode">func (x *Rat) GobEncode() ([]byte, error)</a>

```
searchKey: big.Rat.GobEncode
tags: [function]
```

```Go
func (x *Rat) GobEncode() ([]byte, error)
```

GobEncode implements the gob.GobEncoder interface. 

#### <a id="Rat.Inv" href="#Rat.Inv">func (z *Rat) Inv(x *Rat) *Rat</a>

```
searchKey: big.Rat.Inv
tags: [method]
```

```Go
func (z *Rat) Inv(x *Rat) *Rat
```

Inv sets z to 1/x and returns z. If x == 0, Inv panics. 

#### <a id="Rat.IsInt" href="#Rat.IsInt">func (x *Rat) IsInt() bool</a>

```
searchKey: big.Rat.IsInt
tags: [function]
```

```Go
func (x *Rat) IsInt() bool
```

IsInt reports whether the denominator of x is 1. 

#### <a id="Rat.MarshalText" href="#Rat.MarshalText">func (x *Rat) MarshalText() (text []byte, err error)</a>

```
searchKey: big.Rat.MarshalText
tags: [function]
```

```Go
func (x *Rat) MarshalText() (text []byte, err error)
```

MarshalText implements the encoding.TextMarshaler interface. 

#### <a id="Rat.Mul" href="#Rat.Mul">func (z *Rat) Mul(x, y *Rat) *Rat</a>

```
searchKey: big.Rat.Mul
tags: [method]
```

```Go
func (z *Rat) Mul(x, y *Rat) *Rat
```

Mul sets z to the product x*y and returns z. 

#### <a id="Rat.Neg" href="#Rat.Neg">func (z *Rat) Neg(x *Rat) *Rat</a>

```
searchKey: big.Rat.Neg
tags: [method]
```

```Go
func (z *Rat) Neg(x *Rat) *Rat
```

Neg sets z to -x and returns z. 

#### <a id="Rat.Num" href="#Rat.Num">func (x *Rat) Num() *Int</a>

```
searchKey: big.Rat.Num
tags: [function]
```

```Go
func (x *Rat) Num() *Int
```

Num returns the numerator of x; it may be <= 0. The result is a reference to x's numerator; it may change if a new value is assigned to x, and vice versa. The sign of the numerator corresponds to the sign of x. 

#### <a id="Rat.Quo" href="#Rat.Quo">func (z *Rat) Quo(x, y *Rat) *Rat</a>

```
searchKey: big.Rat.Quo
tags: [method]
```

```Go
func (z *Rat) Quo(x, y *Rat) *Rat
```

Quo sets z to the quotient x/y and returns z. If y == 0, Quo panics. 

#### <a id="Rat.RatString" href="#Rat.RatString">func (x *Rat) RatString() string</a>

```
searchKey: big.Rat.RatString
tags: [function]
```

```Go
func (x *Rat) RatString() string
```

RatString returns a string representation of x in the form "a/b" if b != 1, and in the form "a" if b == 1. 

#### <a id="Rat.Scan" href="#Rat.Scan">func (z *Rat) Scan(s fmt.ScanState, ch rune) error</a>

```
searchKey: big.Rat.Scan
tags: [method]
```

```Go
func (z *Rat) Scan(s fmt.ScanState, ch rune) error
```

Scan is a support routine for fmt.Scanner. It accepts the formats 'e', 'E', 'f', 'F', 'g', 'G', and 'v'. All formats are equivalent. 

#### <a id="Rat.Set" href="#Rat.Set">func (z *Rat) Set(x *Rat) *Rat</a>

```
searchKey: big.Rat.Set
tags: [method]
```

```Go
func (z *Rat) Set(x *Rat) *Rat
```

Set sets z to x (by making a copy of x) and returns z. 

#### <a id="Rat.SetFloat64" href="#Rat.SetFloat64">func (z *Rat) SetFloat64(f float64) *Rat</a>

```
searchKey: big.Rat.SetFloat64
tags: [method]
```

```Go
func (z *Rat) SetFloat64(f float64) *Rat
```

SetFloat64 sets z to exactly f and returns z. If f is not finite, SetFloat returns nil. 

#### <a id="Rat.SetFrac" href="#Rat.SetFrac">func (z *Rat) SetFrac(a, b *Int) *Rat</a>

```
searchKey: big.Rat.SetFrac
tags: [method]
```

```Go
func (z *Rat) SetFrac(a, b *Int) *Rat
```

SetFrac sets z to a/b and returns z. If b == 0, SetFrac panics. 

#### <a id="Rat.SetFrac64" href="#Rat.SetFrac64">func (z *Rat) SetFrac64(a, b int64) *Rat</a>

```
searchKey: big.Rat.SetFrac64
tags: [method]
```

```Go
func (z *Rat) SetFrac64(a, b int64) *Rat
```

SetFrac64 sets z to a/b and returns z. If b == 0, SetFrac64 panics. 

#### <a id="Rat.SetInt" href="#Rat.SetInt">func (z *Rat) SetInt(x *Int) *Rat</a>

```
searchKey: big.Rat.SetInt
tags: [method]
```

```Go
func (z *Rat) SetInt(x *Int) *Rat
```

SetInt sets z to x (by making a copy of x) and returns z. 

#### <a id="Rat.SetInt64" href="#Rat.SetInt64">func (z *Rat) SetInt64(x int64) *Rat</a>

```
searchKey: big.Rat.SetInt64
tags: [method]
```

```Go
func (z *Rat) SetInt64(x int64) *Rat
```

SetInt64 sets z to x and returns z. 

#### <a id="Rat.SetString" href="#Rat.SetString">func (z *Rat) SetString(s string) (*Rat, bool)</a>

```
searchKey: big.Rat.SetString
tags: [method]
```

```Go
func (z *Rat) SetString(s string) (*Rat, bool)
```

SetString sets z to the value of s and returns z and a boolean indicating success. s can be given as a (possibly signed) fraction "a/b", or as a floating-point number optionally followed by an exponent. If a fraction is provided, both the dividend and the divisor may be a decimal integer or independently use a prefix of `0b', `0' or `0o', or `0x' (or their upper-case variants) to denote a binary, octal, or hexadecimal integer, respectively. The divisor may not be signed. If a floating-point number is provided, it may be in decimal form or use any of the same prefixes as above but for `0' to denote a non-decimal mantissa. A leading `0' is considered a decimal leading 0; it does not indicate octal representation in this case. An optional base-10 `e' or base-2 `p' (or their upper-case variants) exponent may be provided as well, except for hexadecimal floats which only accept an (optional) `p' exponent (because an `e' or `E' cannot be distinguished from a mantissa digit). If the exponent's absolute value is too large, the operation may fail. The entire string, not just a prefix, must be valid for success. If the operation failed, the value of z is undefined but the returned value is nil. 

#### <a id="Rat.SetUint64" href="#Rat.SetUint64">func (z *Rat) SetUint64(x uint64) *Rat</a>

```
searchKey: big.Rat.SetUint64
tags: [method]
```

```Go
func (z *Rat) SetUint64(x uint64) *Rat
```

SetUint64 sets z to x and returns z. 

#### <a id="Rat.Sign" href="#Rat.Sign">func (x *Rat) Sign() int</a>

```
searchKey: big.Rat.Sign
tags: [function]
```

```Go
func (x *Rat) Sign() int
```

Sign returns: 

```
-1 if x <  0
 0 if x == 0
+1 if x >  0

```
#### <a id="Rat.String" href="#Rat.String">func (x *Rat) String() string</a>

```
searchKey: big.Rat.String
tags: [function]
```

```Go
func (x *Rat) String() string
```

String returns a string representation of x in the form "a/b" (even if b == 1). 

#### <a id="Rat.Sub" href="#Rat.Sub">func (z *Rat) Sub(x, y *Rat) *Rat</a>

```
searchKey: big.Rat.Sub
tags: [method]
```

```Go
func (z *Rat) Sub(x, y *Rat) *Rat
```

Sub sets z to the difference x-y and returns z. 

#### <a id="Rat.UnmarshalText" href="#Rat.UnmarshalText">func (z *Rat) UnmarshalText(text []byte) error</a>

```
searchKey: big.Rat.UnmarshalText
tags: [method]
```

```Go
func (z *Rat) UnmarshalText(text []byte) error
```

UnmarshalText implements the encoding.TextUnmarshaler interface. 

#### <a id="Rat.marshal" href="#Rat.marshal">func (x *Rat) marshal() []byte</a>

```
searchKey: big.Rat.marshal
tags: [function private]
```

```Go
func (x *Rat) marshal() []byte
```

marshal implements String returning a slice of bytes 

#### <a id="Rat.norm" href="#Rat.norm">func (z *Rat) norm() *Rat</a>

```
searchKey: big.Rat.norm
tags: [function private]
```

```Go
func (z *Rat) norm() *Rat
```

### <a id="RoundingMode" href="#RoundingMode">type RoundingMode byte</a>

```
searchKey: big.RoundingMode
tags: [number]
```

```Go
type RoundingMode byte
```

RoundingMode determines how a Float value is rounded to the desired precision. Rounding may change the Float value; the rounding error is described by the Float's Accuracy. 

#### <a id="RoundingMode.String" href="#RoundingMode.String">func (i RoundingMode) String() string</a>

```
searchKey: big.RoundingMode.String
tags: [function]
```

```Go
func (i RoundingMode) String() string
```

### <a id="StringTest" href="#StringTest">type StringTest struct</a>

```
searchKey: big.StringTest
tags: [struct private]
```

```Go
type StringTest struct {
	in, out string
	ok      bool
}
```

### <a id="Word" href="#Word">type Word uint</a>

```
searchKey: big.Word
tags: [number]
```

```Go
type Word uint
```

A Word represents a single digit of a multi-precision unsigned integer. 

#### <a id="addMulVVW" href="#addMulVVW">func addMulVVW(z, x []Word, y Word) (c Word)</a>

```
searchKey: big.addMulVVW
tags: [method private]
```

```Go
func addMulVVW(z, x []Word, y Word) (c Word)
```

#### <a id="addMulVVW_g" href="#addMulVVW_g">func addMulVVW_g(z, x []Word, y Word) (c Word)</a>

```
searchKey: big.addMulVVW_g
tags: [method private]
```

```Go
func addMulVVW_g(z, x []Word, y Word) (c Word)
```

#### <a id="addVV" href="#addVV">func addVV(z, x, y []Word) (c Word)</a>

```
searchKey: big.addVV
tags: [method private]
```

```Go
func addVV(z, x, y []Word) (c Word)
```

#### <a id="addVV_g" href="#addVV_g">func addVV_g(z, x, y []Word) (c Word)</a>

```
searchKey: big.addVV_g
tags: [method private]
```

```Go
func addVV_g(z, x, y []Word) (c Word)
```

The resulting carry c is either 0 or 1. 

#### <a id="addVW" href="#addVW">func addVW(z, x []Word, y Word) (c Word)</a>

```
searchKey: big.addVW
tags: [method private]
```

```Go
func addVW(z, x []Word, y Word) (c Word)
```

#### <a id="addVW_g" href="#addVW_g">func addVW_g(z, x []Word, y Word) (c Word)</a>

```
searchKey: big.addVW_g
tags: [method private]
```

```Go
func addVW_g(z, x []Word, y Word) (c Word)
```

The resulting carry c is either 0 or 1. 

#### <a id="addVWlarge" href="#addVWlarge">func addVWlarge(z, x []Word, y Word) (c Word)</a>

```
searchKey: big.addVWlarge
tags: [method private]
```

```Go
func addVWlarge(z, x []Word, y Word) (c Word)
```

addVWlarge is addVW, but intended for large z. The only difference is that we check on every iteration whether we are done with carries, and if so, switch to a much faster copy instead. This is only a good idea for large z, because the overhead of the check and the function call outweigh the benefits when z is small. 

#### <a id="bigEndianWord" href="#bigEndianWord">func bigEndianWord(buf []byte) Word</a>

```
searchKey: big.bigEndianWord
tags: [method private]
```

```Go
func bigEndianWord(buf []byte) Word
```

bigEndianWord returns the contents of buf interpreted as a big-endian encoded Word value. 

#### <a id="divWVW" href="#divWVW">func divWVW(z []Word, xn Word, x []Word, y Word) (r Word)</a>

```
searchKey: big.divWVW
tags: [method private]
```

```Go
func divWVW(z []Word, xn Word, x []Word, y Word) (r Word)
```

divWVW overwrites z with ⌊x/y⌋, returning the remainder r. The caller must ensure that len(z) = len(x). 

#### <a id="divWW" href="#divWW">func divWW(x1, x0, y, m Word) (q, r Word)</a>

```
searchKey: big.divWW
tags: [method private]
```

```Go
func divWW(x1, x0, y, m Word) (q, r Word)
```

q = ( x1 << _W + x0 - r)/y. m = floor(( _B^2 - 1 ) / d - _B). Requiring x1<y. An approximate reciprocal with a reference to "Improved Division by Invariant Integers (IEEE Transactions on Computers, 11 Jun. 2010)" 

#### <a id="lehmerSimulate" href="#lehmerSimulate">func lehmerSimulate(A, B *Int) (u0, u1, v0, v1 Word, even bool)</a>

```
searchKey: big.lehmerSimulate
tags: [method private]
```

```Go
func lehmerSimulate(A, B *Int) (u0, u1, v0, v1 Word, even bool)
```

lehmerSimulate attempts to simulate several Euclidean update steps using the leading digits of A and B.  It returns u0, u1, v0, v1 such that A and B can be updated as: 

```
A = u0*A + v0*B
B = u1*A + v1*B

```
Requirements: A >= B and len(B.abs) >= 2 Since we are calculating with full words to avoid overflow, we use 'even' to track the sign of the cosequences. For even iterations: u0, v1 >= 0 && u1, v0 <= 0 For odd  iterations: u0, v1 <= 0 && u1, v0 >= 0 

#### <a id="maxPow" href="#maxPow">func maxPow(b Word) (p Word, n int)</a>

```
searchKey: big.maxPow
tags: [method private]
```

```Go
func maxPow(b Word) (p Word, n int)
```

maxPow returns (b**n, n) such that b**n is the largest power b**n <= _M. For instance maxPow(10) == (1e19, 19) for 19 decimal digits in a 64bit Word. In other words, at most n digits in base b fit into a Word. TODO(gri) replace this with a table, generated at build time. 

#### <a id="mulAddVWW" href="#mulAddVWW">func mulAddVWW(z, x []Word, y, r Word) (c Word)</a>

```
searchKey: big.mulAddVWW
tags: [method private]
```

```Go
func mulAddVWW(z, x []Word, y, r Word) (c Word)
```

#### <a id="mulAddVWW_g" href="#mulAddVWW_g">func mulAddVWW_g(z, x []Word, y, r Word) (c Word)</a>

```
searchKey: big.mulAddVWW_g
tags: [method private]
```

```Go
func mulAddVWW_g(z, x []Word, y, r Word) (c Word)
```

#### <a id="mulAddWWW_g" href="#mulAddWWW_g">func mulAddWWW_g(x, y, c Word) (z1, z0 Word)</a>

```
searchKey: big.mulAddWWW_g
tags: [method private]
```

```Go
func mulAddWWW_g(x, y, c Word) (z1, z0 Word)
```

z1<<_W + z0 = x*y + c 

#### <a id="mulWW" href="#mulWW">func mulWW(x, y Word) (z1, z0 Word)</a>

```
searchKey: big.mulWW
tags: [method private]
```

```Go
func mulWW(x, y Word) (z1, z0 Word)
```

implemented in arith_$GOARCH.s 

#### <a id="mulWW_g" href="#mulWW_g">func mulWW_g(x, y Word) (z1, z0 Word)</a>

```
searchKey: big.mulWW_g
tags: [method private]
```

```Go
func mulWW_g(x, y Word) (z1, z0 Word)
```

z1<<_W + z0 = x*y 

#### <a id="pow" href="#pow">func pow(x Word, n int) (p Word)</a>

```
searchKey: big.pow
tags: [method private]
```

```Go
func pow(x Word, n int) (p Word)
```

pow returns x**n for n > 0, and 1 otherwise. 

#### <a id="reciprocalWord" href="#reciprocalWord">func reciprocalWord(d1 Word) Word</a>

```
searchKey: big.reciprocalWord
tags: [method private]
```

```Go
func reciprocalWord(d1 Word) Word
```

reciprocalWord return the reciprocal of the divisor. rec = floor(( _B^2 - 1 ) / u - _B). u = d1 << nlz(d1). 

#### <a id="rndW" href="#rndW">func rndW() Word</a>

```
searchKey: big.rndW
tags: [function private]
```

```Go
func rndW() Word
```

#### <a id="shlVU" href="#shlVU">func shlVU(z, x []Word, s uint) (c Word)</a>

```
searchKey: big.shlVU
tags: [method private]
```

```Go
func shlVU(z, x []Word, s uint) (c Word)
```

#### <a id="shlVU_g" href="#shlVU_g">func shlVU_g(z, x []Word, s uint) (c Word)</a>

```
searchKey: big.shlVU_g
tags: [method private]
```

```Go
func shlVU_g(z, x []Word, s uint) (c Word)
```

#### <a id="shrVU" href="#shrVU">func shrVU(z, x []Word, s uint) (c Word)</a>

```
searchKey: big.shrVU
tags: [method private]
```

```Go
func shrVU(z, x []Word, s uint) (c Word)
```

#### <a id="shrVU_g" href="#shrVU_g">func shrVU_g(z, x []Word, s uint) (c Word)</a>

```
searchKey: big.shrVU_g
tags: [method private]
```

```Go
func shrVU_g(z, x []Word, s uint) (c Word)
```

#### <a id="subVV" href="#subVV">func subVV(z, x, y []Word) (c Word)</a>

```
searchKey: big.subVV
tags: [method private]
```

```Go
func subVV(z, x, y []Word) (c Word)
```

#### <a id="subVV_g" href="#subVV_g">func subVV_g(z, x, y []Word) (c Word)</a>

```
searchKey: big.subVV_g
tags: [method private]
```

```Go
func subVV_g(z, x, y []Word) (c Word)
```

The resulting carry c is either 0 or 1. 

#### <a id="subVW" href="#subVW">func subVW(z, x []Word, y Word) (c Word)</a>

```
searchKey: big.subVW
tags: [method private]
```

```Go
func subVW(z, x []Word, y Word) (c Word)
```

#### <a id="subVW_g" href="#subVW_g">func subVW_g(z, x []Word, y Word) (c Word)</a>

```
searchKey: big.subVW_g
tags: [method private]
```

```Go
func subVW_g(z, x []Word, y Word) (c Word)
```

#### <a id="subVWlarge" href="#subVWlarge">func subVWlarge(z, x []Word, y Word) (c Word)</a>

```
searchKey: big.subVWlarge
tags: [method private]
```

```Go
func subVWlarge(z, x []Word, y Word) (c Word)
```

subVWlarge is to subVW as addVWlarge is to addVW. 

### <a id="argNN" href="#argNN">type argNN struct</a>

```
searchKey: big.argNN
tags: [struct private]
```

```Go
type argNN struct {
	z, x, y nat
}
```

### <a id="argVU" href="#argVU">type argVU struct</a>

```
searchKey: big.argVU
tags: [struct private]
```

```Go
type argVU struct {
	d  []Word // d is a Word slice, the input parameters x and z come from this array.
	l  uint   // l is the length of the input parameters x and z.
	xp uint   // xp is the starting position of the input parameter x, x := d[xp:xp+l].
	zp uint   // zp is the starting position of the input parameter z, z := d[zp:zp+l].
	s  uint   // s is the shift number.
	r  []Word // r is the expected output result z.
	c  Word   // c is the expected return value.
	m  string // message.
}
```

### <a id="argVV" href="#argVV">type argVV struct</a>

```
searchKey: big.argVV
tags: [struct private]
```

```Go
type argVV struct {
	z, x, y nat
	c       Word
}
```

### <a id="argVW" href="#argVW">type argVW struct</a>

```
searchKey: big.argVW
tags: [struct private]
```

```Go
type argVW struct {
	z, x nat
	y    Word
	c    Word
}
```

### <a id="argVWW" href="#argVWW">type argVWW struct</a>

```
searchKey: big.argVWW
tags: [struct private]
```

```Go
type argVWW struct {
	z, x nat
	y, r Word
	c    Word
}
```

### <a id="argWVW" href="#argWVW">type argWVW struct</a>

```
searchKey: big.argWVW
tags: [struct private]
```

```Go
type argWVW struct {
	z  nat
	xn Word
	x  nat
	y  Word
	r  Word
}
```

### <a id="argZZ" href="#argZZ">type argZZ struct</a>

```
searchKey: big.argZZ
tags: [struct private]
```

```Go
type argZZ struct {
	z, x, y *Int
}
```

### <a id="bitFun" href="#bitFun">type bitFun func(z *std/math/big.Int, x *std/math/big.Int, y *std/math/big.Int) *std/math/big.Int</a>

```
searchKey: big.bitFun
tags: [function private]
```

```Go
type bitFun func(z, x, y *Int) *Int
```

### <a id="byteReader" href="#byteReader">type byteReader struct</a>

```
searchKey: big.byteReader
tags: [struct private]
```

```Go
type byteReader struct {
	fmt.ScanState
}
```

byteReader is a local wrapper around fmt.ScanState; it implements the ByteReader interface. 

#### <a id="byteReader.ReadByte" href="#byteReader.ReadByte">func (r byteReader) ReadByte() (byte, error)</a>

```
searchKey: big.byteReader.ReadByte
tags: [function private]
```

```Go
func (r byteReader) ReadByte() (byte, error)
```

#### <a id="byteReader.UnreadByte" href="#byteReader.UnreadByte">func (r byteReader) UnreadByte() error</a>

```
searchKey: big.byteReader.UnreadByte
tags: [function private]
```

```Go
func (r byteReader) UnreadByte() error
```

### <a id="decimal" href="#decimal">type decimal struct</a>

```
searchKey: big.decimal
tags: [struct private]
```

```Go
type decimal struct {
	mant []byte // mantissa ASCII digits, big-endian
	exp  int    // exponent
}
```

A decimal represents an unsigned floating-point number in decimal representation. The value of a non-zero decimal d is d.mant * 10**d.exp with 0.1 <= d.mant < 1, with the most-significant mantissa digit at index 0. For the zero decimal, the mantissa length and exponent are 0. The zero value for decimal represents a ready-to-use 0.0. 

#### <a id="decimal.String" href="#decimal.String">func (x *decimal) String() string</a>

```
searchKey: big.decimal.String
tags: [function private]
```

```Go
func (x *decimal) String() string
```

#### <a id="decimal.at" href="#decimal.at">func (d *decimal) at(i int) byte</a>

```
searchKey: big.decimal.at
tags: [method private]
```

```Go
func (d *decimal) at(i int) byte
```

at returns the i'th mantissa digit, starting with the most significant digit at 0. 

#### <a id="decimal.init.decimal.go" href="#decimal.init.decimal.go">func (x *decimal) init(m nat, shift int)</a>

```
searchKey: big.decimal.init
tags: [method private]
```

```Go
func (x *decimal) init(m nat, shift int)
```

Init initializes x to the decimal representation of m << shift (for shift >= 0), or m >> -shift (for shift < 0). 

#### <a id="decimal.round" href="#decimal.round">func (x *decimal) round(n int)</a>

```
searchKey: big.decimal.round
tags: [method private]
```

```Go
func (x *decimal) round(n int)
```

round sets x to (at most) n mantissa digits by rounding it to the nearest even value with n (or fever) mantissa digits. If n < 0, x remains unchanged. 

#### <a id="decimal.roundDown" href="#decimal.roundDown">func (x *decimal) roundDown(n int)</a>

```
searchKey: big.decimal.roundDown
tags: [method private]
```

```Go
func (x *decimal) roundDown(n int)
```

#### <a id="decimal.roundUp" href="#decimal.roundUp">func (x *decimal) roundUp(n int)</a>

```
searchKey: big.decimal.roundUp
tags: [method private]
```

```Go
func (x *decimal) roundUp(n int)
```

### <a id="divisor" href="#divisor">type divisor struct</a>

```
searchKey: big.divisor
tags: [struct private]
```

```Go
type divisor struct {
	bbb     nat // divisor
	nbits   int // bit length of divisor (discounting leading zeros) ~= log2(bbb)
	ndigits int // digit length of divisor in terms of output base digits
}
```

### <a id="form" href="#form">type form byte</a>

```
searchKey: big.form
tags: [number private]
```

```Go
type form byte
```

A form value describes the internal representation. 

### <a id="funNN" href="#funNN">type funNN func(z std/math/big.nat, x std/math/big.nat, y std/math/big.nat) std/math/big.nat</a>

```
searchKey: big.funNN
tags: [function private]
```

```Go
type funNN func(z, x, y nat) nat
```

### <a id="funVV" href="#funVV">type funVV func(z []std/math/big.Word, x []std/math/big.Word, y []std/math/big.Word) (c std/math/big.Word)</a>

```
searchKey: big.funVV
tags: [function private]
```

```Go
type funVV func(z, x, y []Word) (c Word)
```

### <a id="funVW" href="#funVW">type funVW func(z []std/math/big.Word, x []std/math/big.Word, y std/math/big.Word) (c std/math/big.Word)</a>

```
searchKey: big.funVW
tags: [function private]
```

```Go
type funVW func(z, x []Word, y Word) (c Word)
```

#### <a id="makeFunVW" href="#makeFunVW">func makeFunVW(f func(z, x []Word, s uint) (c Word)) funVW</a>

```
searchKey: big.makeFunVW
tags: [method private]
```

```Go
func makeFunVW(f func(z, x []Word, s uint) (c Word)) funVW
```

### <a id="funVWW" href="#funVWW">type funVWW func(z []std/math/big.Word, x []std/math/big.Word, y std/math/big.Word, r std/math/big.Word) (c std/math/big.Word)</a>

```
searchKey: big.funVWW
tags: [function private]
```

```Go
type funVWW func(z, x []Word, y, r Word) (c Word)
```

### <a id="funWVW" href="#funWVW">type funWVW func(z []std/math/big.Word, xn std/math/big.Word, x []std/math/big.Word, y std/math/big.Word) (r std/math/big.Word)</a>

```
searchKey: big.funWVW
tags: [function private]
```

```Go
type funWVW func(z []Word, xn Word, x []Word, y Word) (r Word)
```

### <a id="funZZ" href="#funZZ">type funZZ func(z *std/math/big.Int, x *std/math/big.Int, y *std/math/big.Int) *std/math/big.Int</a>

```
searchKey: big.funZZ
tags: [function private]
```

```Go
type funZZ func(z, x, y *Int) *Int
```

### <a id="intShiftTest" href="#intShiftTest">type intShiftTest struct</a>

```
searchKey: big.intShiftTest
tags: [struct private]
```

```Go
type intShiftTest struct {
	in    string
	shift uint
	out   string
}
```

### <a id="matrix" href="#matrix">type matrix struct</a>

```
searchKey: big.matrix
tags: [struct private]
```

```Go
type matrix struct {
	n, m int
	a    []*Rat
}
```

#### <a id="newHilbert" href="#newHilbert">func newHilbert(n int) *matrix</a>

```
searchKey: big.newHilbert
tags: [method private]
```

```Go
func newHilbert(n int) *matrix
```

#### <a id="newInverseHilbert" href="#newInverseHilbert">func newInverseHilbert(n int) *matrix</a>

```
searchKey: big.newInverseHilbert
tags: [method private]
```

```Go
func newInverseHilbert(n int) *matrix
```

#### <a id="newMatrix" href="#newMatrix">func newMatrix(n, m int) *matrix</a>

```
searchKey: big.newMatrix
tags: [method private]
```

```Go
func newMatrix(n, m int) *matrix
```

#### <a id="newUnit" href="#newUnit">func newUnit(n int) *matrix</a>

```
searchKey: big.newUnit
tags: [method private]
```

```Go
func newUnit(n int) *matrix
```

#### <a id="matrix.String" href="#matrix.String">func (a *matrix) String() string</a>

```
searchKey: big.matrix.String
tags: [function private]
```

```Go
func (a *matrix) String() string
```

#### <a id="matrix.at" href="#matrix.at">func (a *matrix) at(i, j int) *Rat</a>

```
searchKey: big.matrix.at
tags: [method private]
```

```Go
func (a *matrix) at(i, j int) *Rat
```

#### <a id="matrix.eql" href="#matrix.eql">func (a *matrix) eql(b *matrix) bool</a>

```
searchKey: big.matrix.eql
tags: [method private]
```

```Go
func (a *matrix) eql(b *matrix) bool
```

#### <a id="matrix.mul" href="#matrix.mul">func (a *matrix) mul(b *matrix) *matrix</a>

```
searchKey: big.matrix.mul
tags: [method private]
```

```Go
func (a *matrix) mul(b *matrix) *matrix
```

#### <a id="matrix.set" href="#matrix.set">func (a *matrix) set(i, j int, x *Rat)</a>

```
searchKey: big.matrix.set
tags: [method private]
```

```Go
func (a *matrix) set(i, j int, x *Rat)
```

### <a id="modWTest" href="#modWTest">type modWTest struct</a>

```
searchKey: big.modWTest
tags: [struct private]
```

```Go
type modWTest struct {
	in       string
	dividend string
	out      string
}
```

### <a id="nat" href="#nat">type nat []big.Word</a>

```
searchKey: big.nat
tags: [array number private]
```

```Go
type nat []Word
```

An unsigned integer x of the form 

```
x = x[n-1]*_B^(n-1) + x[n-2]*_B^(n-2) + ... + x[1]*_B + x[0]

```
with 0 <= x[i] < _B and 0 <= i < n is stored in a slice of length n, with the digits x[i] as the slice elements. 

A number is normalized if the slice contains no leading 0 digits. During arithmetic operations, denormalized values may occur but are always normalized before returning the final result. The normalized representation of 0 is the empty or nil slice (length = 0). 

#### <a id="fibo" href="#fibo">func fibo(n int) nat</a>

```
searchKey: big.fibo
tags: [method private]
```

```Go
func fibo(n int) nat
```

#### <a id="getNat" href="#getNat">func getNat(n int) *nat</a>

```
searchKey: big.getNat
tags: [method private]
```

```Go
func getNat(n int) *nat
```

getNat returns a *nat of len n. The contents may not be zero. The pool holds *nat to avoid allocation when converting to interface{}. 

#### <a id="mulDenom" href="#mulDenom">func mulDenom(z, x, y nat) nat</a>

```
searchKey: big.mulDenom
tags: [method private]
```

```Go
func mulDenom(z, x, y nat) nat
```

mulDenom sets z to the denominator product x*y (by taking into account that 0 values for x or y must be interpreted as 1) and returns z. 

#### <a id="natFromString" href="#natFromString">func natFromString(s string) nat</a>

```
searchKey: big.natFromString
tags: [method private]
```

```Go
func natFromString(s string) nat
```

#### <a id="norm" href="#norm">func norm(x nat) nat</a>

```
searchKey: big.norm
tags: [method private]
```

```Go
func norm(x nat) nat
```

#### <a id="rndNat" href="#rndNat">func rndNat(n int) nat</a>

```
searchKey: big.rndNat
tags: [method private]
```

```Go
func rndNat(n int) nat
```

rndNat returns a random nat value >= 0 of (usually) n words in length. In extremely unlikely cases it may be smaller than n words if the top- most words are 0. 

#### <a id="rndNat1" href="#rndNat1">func rndNat1(n int) nat</a>

```
searchKey: big.rndNat1
tags: [method private]
```

```Go
func rndNat1(n int) nat
```

rndNat1 is like rndNat but the result is guaranteed to be > 0. 

#### <a id="nat.add" href="#nat.add">func (z nat) add(x, y nat) nat</a>

```
searchKey: big.nat.add
tags: [method private]
```

```Go
func (z nat) add(x, y nat) nat
```

#### <a id="nat.and" href="#nat.and">func (z nat) and(x, y nat) nat</a>

```
searchKey: big.nat.and
tags: [method private]
```

```Go
func (z nat) and(x, y nat) nat
```

#### <a id="nat.andNot" href="#nat.andNot">func (z nat) andNot(x, y nat) nat</a>

```
searchKey: big.nat.andNot
tags: [method private]
```

```Go
func (z nat) andNot(x, y nat) nat
```

#### <a id="nat.bit" href="#nat.bit">func (x nat) bit(i uint) uint</a>

```
searchKey: big.nat.bit
tags: [method private]
```

```Go
func (x nat) bit(i uint) uint
```

bit returns the value of the i'th bit, with lsb == bit 0. 

#### <a id="nat.bitLen" href="#nat.bitLen">func (x nat) bitLen() int</a>

```
searchKey: big.nat.bitLen
tags: [function private]
```

```Go
func (x nat) bitLen() int
```

Length of x in bits. x must be normalized. 

#### <a id="nat.bytes" href="#nat.bytes">func (z nat) bytes(buf []byte) (i int)</a>

```
searchKey: big.nat.bytes
tags: [method private]
```

```Go
func (z nat) bytes(buf []byte) (i int)
```

bytes writes the value of z into buf using big-endian encoding. The value of z is encoded in the slice buf[i:]. If the value of z cannot be represented in buf, bytes panics. The number i of unused bytes at the beginning of buf is returned as result. 

#### <a id="nat.clear" href="#nat.clear">func (z nat) clear()</a>

```
searchKey: big.nat.clear
tags: [function private]
```

```Go
func (z nat) clear()
```

#### <a id="nat.cmp" href="#nat.cmp">func (x nat) cmp(y nat) (r int)</a>

```
searchKey: big.nat.cmp
tags: [method private]
```

```Go
func (x nat) cmp(y nat) (r int)
```

#### <a id="nat.convertWords" href="#nat.convertWords">func (q nat) convertWords(s []byte, b Word, ndigits int, bb Word, table []divisor)</a>

```
searchKey: big.nat.convertWords
tags: [method private]
```

```Go
func (q nat) convertWords(s []byte, b Word, ndigits int, bb Word, table []divisor)
```

Convert words of q to base b digits in s. If q is large, it is recursively "split in half" by nat/nat division using tabulated divisors. Otherwise, it is converted iteratively using repeated nat/Word division. 

The iterative method processes n Words by n divW() calls, each of which visits every Word in the incrementally shortened q for a total of n + (n-1) + (n-2) ... + 2 + 1, or n(n+1)/2 divW()'s. Recursive conversion divides q by its approximate square root, yielding two parts, each half the size of q. Using the iterative method on both halves means 2 * (n/2)(n/2 + 1)/2 divW()'s plus the expensive long div(). Asymptotically, the ratio is favorable at 1/2 the divW()'s, and is made better by splitting the subblocks recursively. Best is to split blocks until one more split would take longer (because of the nat/nat div()) than the twice as many divW()'s of the iterative approach. This threshold is represented by leafSize. Benchmarking of leafSize in the range 2..64 shows that values of 8 and 16 work well, with a 4x speedup at medium lengths and ~30x for 20000 digits. Use nat_test.go's BenchmarkLeafSize tests to optimize leafSize for specific hardware. 

#### <a id="nat.div" href="#nat.div">func (z nat) div(z2, u, v nat) (q, r nat)</a>

```
searchKey: big.nat.div
tags: [method private]
```

```Go
func (z nat) div(z2, u, v nat) (q, r nat)
```

div returns q, r such that q = ⌊u/v⌋ and r = u%v = u - q·v. It uses z and z2 as the storage for q and r. 

#### <a id="nat.divBasic" href="#nat.divBasic">func (q nat) divBasic(u, v nat)</a>

```
searchKey: big.nat.divBasic
tags: [method private]
```

```Go
func (q nat) divBasic(u, v nat)
```

divBasic implements long division as described above. It overwrites q with ⌊u/v⌋ and overwrites u with the remainder r. q must be large enough to hold ⌊u/v⌋. 

#### <a id="nat.divLarge" href="#nat.divLarge">func (z nat) divLarge(u, uIn, vIn nat) (q, r nat)</a>

```
searchKey: big.nat.divLarge
tags: [method private]
```

```Go
func (z nat) divLarge(u, uIn, vIn nat) (q, r nat)
```

div returns q, r such that q = ⌊uIn/vIn⌋ and r = uIn%vIn = uIn - q·vIn. It uses z and u as the storage for q and r. The caller must ensure that len(vIn) ≥ 2 (use divW otherwise) and that len(uIn) ≥ len(vIn) (the answer is 0, uIn otherwise). 

#### <a id="nat.divRecursive" href="#nat.divRecursive">func (z nat) divRecursive(u, v nat)</a>

```
searchKey: big.nat.divRecursive
tags: [method private]
```

```Go
func (z nat) divRecursive(u, v nat)
```

divRecursive implements recursive division as described above. It overwrites z with ⌊u/v⌋ and overwrites u with the remainder r. z must be large enough to hold ⌊u/v⌋. This function is just for allocating and freeing temporaries around divRecursiveStep, the real implementation. 

#### <a id="nat.divRecursiveStep" href="#nat.divRecursiveStep">func (z nat) divRecursiveStep(u, v nat, depth int, tmp *nat, temps []*nat)</a>

```
searchKey: big.nat.divRecursiveStep
tags: [method private]
```

```Go
func (z nat) divRecursiveStep(u, v nat, depth int, tmp *nat, temps []*nat)
```

divRecursiveStep is the actual implementation of recursive division. It adds ⌊u/v⌋ to z and overwrites u with the remainder r. z must be large enough to hold ⌊u/v⌋. It uses temps[depth] (allocating if needed) as a temporary live across the recursive call. It also uses tmp, but not live across the recursion. 

#### <a id="nat.divW" href="#nat.divW">func (z nat) divW(x nat, y Word) (q nat, r Word)</a>

```
searchKey: big.nat.divW
tags: [method private]
```

```Go
func (z nat) divW(x nat, y Word) (q nat, r Word)
```

divW returns q, r such that q = ⌊x/y⌋ and r = x%y = x - q·y. It uses z as the storage for q. Note that y is a single digit (Word), not a big number. 

#### <a id="nat.expNN" href="#nat.expNN">func (z nat) expNN(x, y, m nat) nat</a>

```
searchKey: big.nat.expNN
tags: [method private]
```

```Go
func (z nat) expNN(x, y, m nat) nat
```

If m != 0 (i.e., len(m) != 0), expNN sets z to x**y mod m; otherwise it sets z to x**y. The result is the value of z. 

#### <a id="nat.expNNMontgomery" href="#nat.expNNMontgomery">func (z nat) expNNMontgomery(x, y, m nat) nat</a>

```
searchKey: big.nat.expNNMontgomery
tags: [method private]
```

```Go
func (z nat) expNNMontgomery(x, y, m nat) nat
```

expNNMontgomery calculates x**y mod m using a fixed, 4-bit window. Uses Montgomery representation. 

#### <a id="nat.expNNWindowed" href="#nat.expNNWindowed">func (z nat) expNNWindowed(x, y, m nat) nat</a>

```
searchKey: big.nat.expNNWindowed
tags: [method private]
```

```Go
func (z nat) expNNWindowed(x, y, m nat) nat
```

expNNWindowed calculates x**y mod m using a fixed, 4-bit window. 

#### <a id="nat.expWW" href="#nat.expWW">func (z nat) expWW(x, y Word) nat</a>

```
searchKey: big.nat.expWW
tags: [method private]
```

```Go
func (z nat) expWW(x, y Word) nat
```

expWW computes x**y 

#### <a id="nat.itoa" href="#nat.itoa">func (x nat) itoa(neg bool, base int) []byte</a>

```
searchKey: big.nat.itoa
tags: [method private]
```

```Go
func (x nat) itoa(neg bool, base int) []byte
```

itoa is like utoa but it prepends a '-' if neg && x != 0. 

#### <a id="nat.make" href="#nat.make">func (z nat) make(n int) nat</a>

```
searchKey: big.nat.make
tags: [method private]
```

```Go
func (z nat) make(n int) nat
```

#### <a id="nat.modW" href="#nat.modW">func (x nat) modW(d Word) (r Word)</a>

```
searchKey: big.nat.modW
tags: [method private]
```

```Go
func (x nat) modW(d Word) (r Word)
```

modW returns x % d. 

#### <a id="nat.montgomery" href="#nat.montgomery">func (z nat) montgomery(x, y, m nat, k Word, n int) nat</a>

```
searchKey: big.nat.montgomery
tags: [method private]
```

```Go
func (z nat) montgomery(x, y, m nat, k Word, n int) nat
```

montgomery computes z mod m = x*y*2**(-n*_W) mod m, assuming k = -1/m mod 2**_W. z is used for storing the result which is returned; z must not alias x, y or m. See Gueron, "Efficient Software Implementations of Modular Exponentiation". [https://eprint.iacr.org/2011/239.pdf](https://eprint.iacr.org/2011/239.pdf) In the terminology of that paper, this is an "Almost Montgomery Multiplication": x and y are required to satisfy 0 <= z < 2**(n*_W) and then the result z is guaranteed to satisfy 0 <= z < 2**(n*_W), but it may not be < m. 

#### <a id="nat.mul" href="#nat.mul">func (z nat) mul(x, y nat) nat</a>

```
searchKey: big.nat.mul
tags: [method private]
```

```Go
func (z nat) mul(x, y nat) nat
```

#### <a id="nat.mulAddWW" href="#nat.mulAddWW">func (z nat) mulAddWW(x nat, y, r Word) nat</a>

```
searchKey: big.nat.mulAddWW
tags: [method private]
```

```Go
func (z nat) mulAddWW(x nat, y, r Word) nat
```

#### <a id="nat.mulRange" href="#nat.mulRange">func (z nat) mulRange(a, b uint64) nat</a>

```
searchKey: big.nat.mulRange
tags: [method private]
```

```Go
func (z nat) mulRange(a, b uint64) nat
```

mulRange computes the product of all the unsigned integers in the range [a, b] inclusively. If a > b (empty range), the result is 1. 

#### <a id="nat.norm" href="#nat.norm">func (z nat) norm() nat</a>

```
searchKey: big.nat.norm
tags: [function private]
```

```Go
func (z nat) norm() nat
```

#### <a id="nat.or" href="#nat.or">func (z nat) or(x, y nat) nat</a>

```
searchKey: big.nat.or
tags: [method private]
```

```Go
func (z nat) or(x, y nat) nat
```

#### <a id="nat.probablyPrimeLucas" href="#nat.probablyPrimeLucas">func (n nat) probablyPrimeLucas() bool</a>

```
searchKey: big.nat.probablyPrimeLucas
tags: [function private]
```

```Go
func (n nat) probablyPrimeLucas() bool
```

probablyPrimeLucas reports whether n passes the "almost extra strong" Lucas probable prime test, using Baillie-OEIS parameter selection. This corresponds to "AESLPSP" on Jacobsen's tables (link below). The combination of this test and a Miller-Rabin/Fermat test with base 2 gives a Baillie-PSW test. 

References: 

Baillie and Wagstaff, "Lucas Pseudoprimes", Mathematics of Computation 35(152), October 1980, pp. 1391-1417, especially page 1401. [https://www.ams.org/journals/mcom/1980-35-152/S0025-5718-1980-0583518-6/S0025-5718-1980-0583518-6.pdf](https://www.ams.org/journals/mcom/1980-35-152/S0025-5718-1980-0583518-6/S0025-5718-1980-0583518-6.pdf) 

Grantham, "Frobenius Pseudoprimes", Mathematics of Computation 70(234), March 2000, pp. 873-891. [https://www.ams.org/journals/mcom/2001-70-234/S0025-5718-00-01197-2/S0025-5718-00-01197-2.pdf](https://www.ams.org/journals/mcom/2001-70-234/S0025-5718-00-01197-2/S0025-5718-00-01197-2.pdf) 

Baillie, "Extra strong Lucas pseudoprimes", OEIS A217719, [https://oeis.org/A217719](https://oeis.org/A217719). 

Jacobsen, "Pseudoprime Statistics, Tables, and Data", [http://ntheory.org/pseudoprimes.html](http://ntheory.org/pseudoprimes.html). 

Nicely, "The Baillie-PSW Primality Test", [http://www.trnicely.net/misc/bpsw.html](http://www.trnicely.net/misc/bpsw.html). (Note that Nicely's definition of the "extra strong" test gives the wrong Jacobi condition, as pointed out by Jacobsen.) 

Crandall and Pomerance, Prime Numbers: A Computational Perspective, 2nd ed. Springer, 2005. 

#### <a id="nat.probablyPrimeMillerRabin" href="#nat.probablyPrimeMillerRabin">func (n nat) probablyPrimeMillerRabin(reps int, force2 bool) bool</a>

```
searchKey: big.nat.probablyPrimeMillerRabin
tags: [method private]
```

```Go
func (n nat) probablyPrimeMillerRabin(reps int, force2 bool) bool
```

probablyPrimeMillerRabin reports whether n passes reps rounds of the Miller-Rabin primality test, using pseudo-randomly chosen bases. If force2 is true, one of the rounds is forced to use base 2. See Handbook of Applied Cryptography, p. 139, Algorithm 4.24. The number n is known to be non-zero. 

#### <a id="nat.random" href="#nat.random">func (z nat) random(rand *rand.Rand, limit nat, n int) nat</a>

```
searchKey: big.nat.random
tags: [method private]
```

```Go
func (z nat) random(rand *rand.Rand, limit nat, n int) nat
```

random creates a random integer in [0..limit), using the space in z if possible. n is the bit length of limit. 

#### <a id="nat.scan" href="#nat.scan">func (z nat) scan(r io.ByteScanner, base int, fracOk bool) (res nat, b, count int, err error)</a>

```
searchKey: big.nat.scan
tags: [method private]
```

```Go
func (z nat) scan(r io.ByteScanner, base int, fracOk bool) (res nat, b, count int, err error)
```

scan scans the number corresponding to the longest possible prefix from r representing an unsigned number in a given conversion base. scan returns the corresponding natural number res, the actual base b, a digit count, and a read or syntax error err, if any. 

For base 0, an underscore character `_' may appear between a base prefix and an adjacent digit, and between successive digits; such underscores do not change the value of the number, or the returned digit count. Incorrect placement of underscores is reported as an error if there are no other errors. If base != 0, underscores are not recognized and thus terminate scanning like any other character that is not a valid radix point or digit. 

```
number    = mantissa | prefix pmantissa .
prefix    = "0" [ "b" | "B" | "o" | "O" | "x" | "X" ] .
mantissa  = digits "." [ digits ] | digits | "." digits .
pmantissa = [ "_" ] digits "." [ digits ] | [ "_" ] digits | "." digits .
digits    = digit { [ "_" ] digit } .
digit     = "0" ... "9" | "a" ... "z" | "A" ... "Z" .

```
Unless fracOk is set, the base argument must be 0 or a value between 2 and MaxBase. If fracOk is set, the base argument must be one of 0, 2, 8, 10, or 16. Providing an invalid base argument leads to a run- time panic. 

For base 0, the number prefix determines the actual base: A prefix of `0b' or `0B' selects base 2, `0o' or `0O' selects base 8, and `0x' or `0X' selects base 16. If fracOk is false, a `0' prefix (immediately followed by digits) selects base 8 as well. Otherwise, the selected base is 10 and no prefix is accepted. 

If fracOk is set, a period followed by a fractional part is permitted. The result value is computed as if there were no period present; and the count value is used to determine the fractional part. 

For bases <= 36, lower and upper case letters are considered the same: The letters 'a' to 'z' and 'A' to 'Z' represent digit values 10 to 35. For bases > 36, the upper case letters 'A' to 'Z' represent the digit values 36 to 61. 

A result digit count > 0 corresponds to the number of (non-prefix) digits parsed. A digit count <= 0 indicates the presence of a period (if fracOk is set, only), and -count is the number of fractional digits found. In this case, the actual value of the scanned number is res * b**count. 

#### <a id="nat.set" href="#nat.set">func (z nat) set(x nat) nat</a>

```
searchKey: big.nat.set
tags: [method private]
```

```Go
func (z nat) set(x nat) nat
```

#### <a id="nat.setBit" href="#nat.setBit">func (z nat) setBit(x nat, i uint, b uint) nat</a>

```
searchKey: big.nat.setBit
tags: [method private]
```

```Go
func (z nat) setBit(x nat, i uint, b uint) nat
```

#### <a id="nat.setBytes" href="#nat.setBytes">func (z nat) setBytes(buf []byte) nat</a>

```
searchKey: big.nat.setBytes
tags: [method private]
```

```Go
func (z nat) setBytes(buf []byte) nat
```

setBytes interprets buf as the bytes of a big-endian unsigned integer, sets z to that value, and returns z. 

#### <a id="nat.setUint64" href="#nat.setUint64">func (z nat) setUint64(x uint64) nat</a>

```
searchKey: big.nat.setUint64
tags: [method private]
```

```Go
func (z nat) setUint64(x uint64) nat
```

#### <a id="nat.setWord" href="#nat.setWord">func (z nat) setWord(x Word) nat</a>

```
searchKey: big.nat.setWord
tags: [method private]
```

```Go
func (z nat) setWord(x Word) nat
```

#### <a id="nat.shl" href="#nat.shl">func (z nat) shl(x nat, s uint) nat</a>

```
searchKey: big.nat.shl
tags: [method private]
```

```Go
func (z nat) shl(x nat, s uint) nat
```

z = x << s 

#### <a id="nat.shr" href="#nat.shr">func (z nat) shr(x nat, s uint) nat</a>

```
searchKey: big.nat.shr
tags: [method private]
```

```Go
func (z nat) shr(x nat, s uint) nat
```

z = x >> s 

#### <a id="nat.sqr" href="#nat.sqr">func (z nat) sqr(x nat) nat</a>

```
searchKey: big.nat.sqr
tags: [method private]
```

```Go
func (z nat) sqr(x nat) nat
```

z = x*x 

#### <a id="nat.sqrt" href="#nat.sqrt">func (z nat) sqrt(x nat) nat</a>

```
searchKey: big.nat.sqrt
tags: [method private]
```

```Go
func (z nat) sqrt(x nat) nat
```

sqrt sets z = ⌊√x⌋ 

#### <a id="nat.sticky" href="#nat.sticky">func (x nat) sticky(i uint) uint</a>

```
searchKey: big.nat.sticky
tags: [method private]
```

```Go
func (x nat) sticky(i uint) uint
```

sticky returns 1 if there's a 1 bit within the i least significant bits, otherwise it returns 0. 

#### <a id="nat.sub" href="#nat.sub">func (z nat) sub(x, y nat) nat</a>

```
searchKey: big.nat.sub
tags: [method private]
```

```Go
func (z nat) sub(x, y nat) nat
```

#### <a id="nat.trailingZeroBits" href="#nat.trailingZeroBits">func (x nat) trailingZeroBits() uint</a>

```
searchKey: big.nat.trailingZeroBits
tags: [function private]
```

```Go
func (x nat) trailingZeroBits() uint
```

trailingZeroBits returns the number of consecutive least significant zero bits of x. 

#### <a id="nat.utoa" href="#nat.utoa">func (x nat) utoa(base int) []byte</a>

```
searchKey: big.nat.utoa
tags: [method private]
```

```Go
func (x nat) utoa(base int) []byte
```

utoa converts x to an ASCII representation in the given base; base must be between 2 and MaxBase, inclusive. 

#### <a id="nat.xor" href="#nat.xor">func (z nat) xor(x, y nat) nat</a>

```
searchKey: big.nat.xor
tags: [method private]
```

```Go
func (z nat) xor(x, y nat) nat
```

### <a id="ratBinArg" href="#ratBinArg">type ratBinArg struct</a>

```
searchKey: big.ratBinArg
tags: [struct private]
```

```Go
type ratBinArg struct {
	x, y, z string
}
```

### <a id="ratBinFun" href="#ratBinFun">type ratBinFun func(z *std/math/big.Rat, x *std/math/big.Rat, y *std/math/big.Rat) *std/math/big.Rat</a>

```
searchKey: big.ratBinFun
tags: [function private]
```

```Go
type ratBinFun func(z, x, y *Rat) *Rat
```

### <a id="shiftTest" href="#shiftTest">type shiftTest struct</a>

```
searchKey: big.shiftTest
tags: [struct private]
```

```Go
type shiftTest struct {
	in    nat
	shift uint
	out   nat
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkAddMulVVW" href="#BenchmarkAddMulVVW">func BenchmarkAddMulVVW(b *testing.B)</a>

```
searchKey: big.BenchmarkAddMulVVW
tags: [method private benchmark]
```

```Go
func BenchmarkAddMulVVW(b *testing.B)
```

### <a id="BenchmarkAddVV" href="#BenchmarkAddVV">func BenchmarkAddVV(b *testing.B)</a>

```
searchKey: big.BenchmarkAddVV
tags: [method private benchmark]
```

```Go
func BenchmarkAddVV(b *testing.B)
```

### <a id="BenchmarkAddVW" href="#BenchmarkAddVW">func BenchmarkAddVW(b *testing.B)</a>

```
searchKey: big.BenchmarkAddVW
tags: [method private benchmark]
```

```Go
func BenchmarkAddVW(b *testing.B)
```

### <a id="BenchmarkAddVWext" href="#BenchmarkAddVWext">func BenchmarkAddVWext(b *testing.B)</a>

```
searchKey: big.BenchmarkAddVWext
tags: [method private benchmark]
```

```Go
func BenchmarkAddVWext(b *testing.B)
```

Benchmarking addVW using vector of maximum uint to force carry flag set 

### <a id="BenchmarkBinomial" href="#BenchmarkBinomial">func BenchmarkBinomial(b *testing.B)</a>

```
searchKey: big.BenchmarkBinomial
tags: [method private benchmark]
```

```Go
func BenchmarkBinomial(b *testing.B)
```

### <a id="BenchmarkBitset" href="#BenchmarkBitset">func BenchmarkBitset(b *testing.B)</a>

```
searchKey: big.BenchmarkBitset
tags: [method private benchmark]
```

```Go
func BenchmarkBitset(b *testing.B)
```

### <a id="BenchmarkBitsetNeg" href="#BenchmarkBitsetNeg">func BenchmarkBitsetNeg(b *testing.B)</a>

```
searchKey: big.BenchmarkBitsetNeg
tags: [method private benchmark]
```

```Go
func BenchmarkBitsetNeg(b *testing.B)
```

### <a id="BenchmarkBitsetNegOrig" href="#BenchmarkBitsetNegOrig">func BenchmarkBitsetNegOrig(b *testing.B)</a>

```
searchKey: big.BenchmarkBitsetNegOrig
tags: [method private benchmark]
```

```Go
func BenchmarkBitsetNegOrig(b *testing.B)
```

### <a id="BenchmarkBitsetOrig" href="#BenchmarkBitsetOrig">func BenchmarkBitsetOrig(b *testing.B)</a>

```
searchKey: big.BenchmarkBitsetOrig
tags: [method private benchmark]
```

```Go
func BenchmarkBitsetOrig(b *testing.B)
```

### <a id="BenchmarkDecimalConversion" href="#BenchmarkDecimalConversion">func BenchmarkDecimalConversion(b *testing.B)</a>

```
searchKey: big.BenchmarkDecimalConversion
tags: [method private benchmark]
```

```Go
func BenchmarkDecimalConversion(b *testing.B)
```

### <a id="BenchmarkDiv" href="#BenchmarkDiv">func BenchmarkDiv(b *testing.B)</a>

```
searchKey: big.BenchmarkDiv
tags: [method private benchmark]
```

```Go
func BenchmarkDiv(b *testing.B)
```

### <a id="BenchmarkDivWVW" href="#BenchmarkDivWVW">func BenchmarkDivWVW(b *testing.B)</a>

```
searchKey: big.BenchmarkDivWVW
tags: [method private benchmark]
```

```Go
func BenchmarkDivWVW(b *testing.B)
```

### <a id="BenchmarkExp" href="#BenchmarkExp">func BenchmarkExp(b *testing.B)</a>

```
searchKey: big.BenchmarkExp
tags: [method private benchmark]
```

```Go
func BenchmarkExp(b *testing.B)
```

### <a id="BenchmarkExp2" href="#BenchmarkExp2">func BenchmarkExp2(b *testing.B)</a>

```
searchKey: big.BenchmarkExp2
tags: [method private benchmark]
```

```Go
func BenchmarkExp2(b *testing.B)
```

### <a id="BenchmarkExp3Power" href="#BenchmarkExp3Power">func BenchmarkExp3Power(b *testing.B)</a>

```
searchKey: big.BenchmarkExp3Power
tags: [method private benchmark]
```

```Go
func BenchmarkExp3Power(b *testing.B)
```

### <a id="BenchmarkFibo" href="#BenchmarkFibo">func BenchmarkFibo(b *testing.B)</a>

```
searchKey: big.BenchmarkFibo
tags: [method private benchmark]
```

```Go
func BenchmarkFibo(b *testing.B)
```

### <a id="BenchmarkFloatAdd" href="#BenchmarkFloatAdd">func BenchmarkFloatAdd(b *testing.B)</a>

```
searchKey: big.BenchmarkFloatAdd
tags: [method private benchmark]
```

```Go
func BenchmarkFloatAdd(b *testing.B)
```

### <a id="BenchmarkFloatSqrt" href="#BenchmarkFloatSqrt">func BenchmarkFloatSqrt(b *testing.B)</a>

```
searchKey: big.BenchmarkFloatSqrt
tags: [method private benchmark]
```

```Go
func BenchmarkFloatSqrt(b *testing.B)
```

### <a id="BenchmarkFloatString" href="#BenchmarkFloatString">func BenchmarkFloatString(b *testing.B)</a>

```
searchKey: big.BenchmarkFloatString
tags: [method private benchmark]
```

```Go
func BenchmarkFloatString(b *testing.B)
```

### <a id="BenchmarkFloatSub" href="#BenchmarkFloatSub">func BenchmarkFloatSub(b *testing.B)</a>

```
searchKey: big.BenchmarkFloatSub
tags: [method private benchmark]
```

```Go
func BenchmarkFloatSub(b *testing.B)
```

### <a id="BenchmarkGCD100000x100000" href="#BenchmarkGCD100000x100000">func BenchmarkGCD100000x100000(b *testing.B)</a>

```
searchKey: big.BenchmarkGCD100000x100000
tags: [method private benchmark]
```

```Go
func BenchmarkGCD100000x100000(b *testing.B)
```

### <a id="BenchmarkGCD10000x10000" href="#BenchmarkGCD10000x10000">func BenchmarkGCD10000x10000(b *testing.B)</a>

```
searchKey: big.BenchmarkGCD10000x10000
tags: [method private benchmark]
```

```Go
func BenchmarkGCD10000x10000(b *testing.B)
```

### <a id="BenchmarkGCD10000x100000" href="#BenchmarkGCD10000x100000">func BenchmarkGCD10000x100000(b *testing.B)</a>

```
searchKey: big.BenchmarkGCD10000x100000
tags: [method private benchmark]
```

```Go
func BenchmarkGCD10000x100000(b *testing.B)
```

### <a id="BenchmarkGCD1000x1000" href="#BenchmarkGCD1000x1000">func BenchmarkGCD1000x1000(b *testing.B)</a>

```
searchKey: big.BenchmarkGCD1000x1000
tags: [method private benchmark]
```

```Go
func BenchmarkGCD1000x1000(b *testing.B)
```

### <a id="BenchmarkGCD1000x10000" href="#BenchmarkGCD1000x10000">func BenchmarkGCD1000x10000(b *testing.B)</a>

```
searchKey: big.BenchmarkGCD1000x10000
tags: [method private benchmark]
```

```Go
func BenchmarkGCD1000x10000(b *testing.B)
```

### <a id="BenchmarkGCD1000x100000" href="#BenchmarkGCD1000x100000">func BenchmarkGCD1000x100000(b *testing.B)</a>

```
searchKey: big.BenchmarkGCD1000x100000
tags: [method private benchmark]
```

```Go
func BenchmarkGCD1000x100000(b *testing.B)
```

### <a id="BenchmarkGCD100x100" href="#BenchmarkGCD100x100">func BenchmarkGCD100x100(b *testing.B)</a>

```
searchKey: big.BenchmarkGCD100x100
tags: [method private benchmark]
```

```Go
func BenchmarkGCD100x100(b *testing.B)
```

### <a id="BenchmarkGCD100x1000" href="#BenchmarkGCD100x1000">func BenchmarkGCD100x1000(b *testing.B)</a>

```
searchKey: big.BenchmarkGCD100x1000
tags: [method private benchmark]
```

```Go
func BenchmarkGCD100x1000(b *testing.B)
```

### <a id="BenchmarkGCD100x10000" href="#BenchmarkGCD100x10000">func BenchmarkGCD100x10000(b *testing.B)</a>

```
searchKey: big.BenchmarkGCD100x10000
tags: [method private benchmark]
```

```Go
func BenchmarkGCD100x10000(b *testing.B)
```

### <a id="BenchmarkGCD100x100000" href="#BenchmarkGCD100x100000">func BenchmarkGCD100x100000(b *testing.B)</a>

```
searchKey: big.BenchmarkGCD100x100000
tags: [method private benchmark]
```

```Go
func BenchmarkGCD100x100000(b *testing.B)
```

### <a id="BenchmarkGCD10x10" href="#BenchmarkGCD10x10">func BenchmarkGCD10x10(b *testing.B)</a>

```
searchKey: big.BenchmarkGCD10x10
tags: [method private benchmark]
```

```Go
func BenchmarkGCD10x10(b *testing.B)
```

### <a id="BenchmarkGCD10x100" href="#BenchmarkGCD10x100">func BenchmarkGCD10x100(b *testing.B)</a>

```
searchKey: big.BenchmarkGCD10x100
tags: [method private benchmark]
```

```Go
func BenchmarkGCD10x100(b *testing.B)
```

### <a id="BenchmarkGCD10x1000" href="#BenchmarkGCD10x1000">func BenchmarkGCD10x1000(b *testing.B)</a>

```
searchKey: big.BenchmarkGCD10x1000
tags: [method private benchmark]
```

```Go
func BenchmarkGCD10x1000(b *testing.B)
```

### <a id="BenchmarkGCD10x10000" href="#BenchmarkGCD10x10000">func BenchmarkGCD10x10000(b *testing.B)</a>

```
searchKey: big.BenchmarkGCD10x10000
tags: [method private benchmark]
```

```Go
func BenchmarkGCD10x10000(b *testing.B)
```

### <a id="BenchmarkGCD10x100000" href="#BenchmarkGCD10x100000">func BenchmarkGCD10x100000(b *testing.B)</a>

```
searchKey: big.BenchmarkGCD10x100000
tags: [method private benchmark]
```

```Go
func BenchmarkGCD10x100000(b *testing.B)
```

### <a id="BenchmarkHilbert" href="#BenchmarkHilbert">func BenchmarkHilbert(b *testing.B)</a>

```
searchKey: big.BenchmarkHilbert
tags: [method private benchmark]
```

```Go
func BenchmarkHilbert(b *testing.B)
```

### <a id="BenchmarkIntSqr" href="#BenchmarkIntSqr">func BenchmarkIntSqr(b *testing.B)</a>

```
searchKey: big.BenchmarkIntSqr
tags: [method private benchmark]
```

```Go
func BenchmarkIntSqr(b *testing.B)
```

### <a id="BenchmarkLeafSize" href="#BenchmarkLeafSize">func BenchmarkLeafSize(b *testing.B)</a>

```
searchKey: big.BenchmarkLeafSize
tags: [method private benchmark]
```

```Go
func BenchmarkLeafSize(b *testing.B)
```

### <a id="BenchmarkModInverse" href="#BenchmarkModInverse">func BenchmarkModInverse(b *testing.B)</a>

```
searchKey: big.BenchmarkModInverse
tags: [method private benchmark]
```

```Go
func BenchmarkModInverse(b *testing.B)
```

### <a id="BenchmarkModSqrt225_3Mod4" href="#BenchmarkModSqrt225_3Mod4">func BenchmarkModSqrt225_3Mod4(b *testing.B)</a>

```
searchKey: big.BenchmarkModSqrt225_3Mod4
tags: [method private benchmark]
```

```Go
func BenchmarkModSqrt225_3Mod4(b *testing.B)
```

### <a id="BenchmarkModSqrt225_Tonelli" href="#BenchmarkModSqrt225_Tonelli">func BenchmarkModSqrt225_Tonelli(b *testing.B)</a>

```
searchKey: big.BenchmarkModSqrt225_Tonelli
tags: [method private benchmark]
```

```Go
func BenchmarkModSqrt225_Tonelli(b *testing.B)
```

### <a id="BenchmarkModSqrt231_5Mod8" href="#BenchmarkModSqrt231_5Mod8">func BenchmarkModSqrt231_5Mod8(b *testing.B)</a>

```
searchKey: big.BenchmarkModSqrt231_5Mod8
tags: [method private benchmark]
```

```Go
func BenchmarkModSqrt231_5Mod8(b *testing.B)
```

### <a id="BenchmarkModSqrt231_Tonelli" href="#BenchmarkModSqrt231_Tonelli">func BenchmarkModSqrt231_Tonelli(b *testing.B)</a>

```
searchKey: big.BenchmarkModSqrt231_Tonelli
tags: [method private benchmark]
```

```Go
func BenchmarkModSqrt231_Tonelli(b *testing.B)
```

### <a id="BenchmarkMul" href="#BenchmarkMul">func BenchmarkMul(b *testing.B)</a>

```
searchKey: big.BenchmarkMul
tags: [method private benchmark]
```

```Go
func BenchmarkMul(b *testing.B)
```

### <a id="BenchmarkMulAddVWW" href="#BenchmarkMulAddVWW">func BenchmarkMulAddVWW(b *testing.B)</a>

```
searchKey: big.BenchmarkMulAddVWW
tags: [method private benchmark]
```

```Go
func BenchmarkMulAddVWW(b *testing.B)
```

### <a id="BenchmarkNatMul" href="#BenchmarkNatMul">func BenchmarkNatMul(b *testing.B)</a>

```
searchKey: big.BenchmarkNatMul
tags: [method private benchmark]
```

```Go
func BenchmarkNatMul(b *testing.B)
```

### <a id="BenchmarkNatSetBytes" href="#BenchmarkNatSetBytes">func BenchmarkNatSetBytes(b *testing.B)</a>

```
searchKey: big.BenchmarkNatSetBytes
tags: [method private benchmark]
```

```Go
func BenchmarkNatSetBytes(b *testing.B)
```

### <a id="BenchmarkNatSqr" href="#BenchmarkNatSqr">func BenchmarkNatSqr(b *testing.B)</a>

```
searchKey: big.BenchmarkNatSqr
tags: [method private benchmark]
```

```Go
func BenchmarkNatSqr(b *testing.B)
```

### <a id="BenchmarkNonZeroShifts" href="#BenchmarkNonZeroShifts">func BenchmarkNonZeroShifts(b *testing.B)</a>

```
searchKey: big.BenchmarkNonZeroShifts
tags: [method private benchmark]
```

```Go
func BenchmarkNonZeroShifts(b *testing.B)
```

### <a id="BenchmarkParseFloatLargeExp" href="#BenchmarkParseFloatLargeExp">func BenchmarkParseFloatLargeExp(b *testing.B)</a>

```
searchKey: big.BenchmarkParseFloatLargeExp
tags: [method private benchmark]
```

```Go
func BenchmarkParseFloatLargeExp(b *testing.B)
```

### <a id="BenchmarkParseFloatSmallExp" href="#BenchmarkParseFloatSmallExp">func BenchmarkParseFloatSmallExp(b *testing.B)</a>

```
searchKey: big.BenchmarkParseFloatSmallExp
tags: [method private benchmark]
```

```Go
func BenchmarkParseFloatSmallExp(b *testing.B)
```

### <a id="BenchmarkProbablyPrime" href="#BenchmarkProbablyPrime">func BenchmarkProbablyPrime(b *testing.B)</a>

```
searchKey: big.BenchmarkProbablyPrime
tags: [method private benchmark]
```

```Go
func BenchmarkProbablyPrime(b *testing.B)
```

### <a id="BenchmarkQuoRem" href="#BenchmarkQuoRem">func BenchmarkQuoRem(b *testing.B)</a>

```
searchKey: big.BenchmarkQuoRem
tags: [method private benchmark]
```

```Go
func BenchmarkQuoRem(b *testing.B)
```

### <a id="BenchmarkRatCmp" href="#BenchmarkRatCmp">func BenchmarkRatCmp(b *testing.B)</a>

```
searchKey: big.BenchmarkRatCmp
tags: [method private benchmark]
```

```Go
func BenchmarkRatCmp(b *testing.B)
```

### <a id="BenchmarkScan" href="#BenchmarkScan">func BenchmarkScan(b *testing.B)</a>

```
searchKey: big.BenchmarkScan
tags: [method private benchmark]
```

```Go
func BenchmarkScan(b *testing.B)
```

### <a id="BenchmarkScanPi" href="#BenchmarkScanPi">func BenchmarkScanPi(b *testing.B)</a>

```
searchKey: big.BenchmarkScanPi
tags: [method private benchmark]
```

```Go
func BenchmarkScanPi(b *testing.B)
```

### <a id="BenchmarkSqrt" href="#BenchmarkSqrt">func BenchmarkSqrt(b *testing.B)</a>

```
searchKey: big.BenchmarkSqrt
tags: [method private benchmark]
```

```Go
func BenchmarkSqrt(b *testing.B)
```

### <a id="BenchmarkString" href="#BenchmarkString">func BenchmarkString(b *testing.B)</a>

```
searchKey: big.BenchmarkString
tags: [method private benchmark]
```

```Go
func BenchmarkString(b *testing.B)
```

### <a id="BenchmarkStringPiParallel" href="#BenchmarkStringPiParallel">func BenchmarkStringPiParallel(b *testing.B)</a>

```
searchKey: big.BenchmarkStringPiParallel
tags: [method private benchmark]
```

```Go
func BenchmarkStringPiParallel(b *testing.B)
```

### <a id="BenchmarkSubVV" href="#BenchmarkSubVV">func BenchmarkSubVV(b *testing.B)</a>

```
searchKey: big.BenchmarkSubVV
tags: [method private benchmark]
```

```Go
func BenchmarkSubVV(b *testing.B)
```

### <a id="BenchmarkSubVW" href="#BenchmarkSubVW">func BenchmarkSubVW(b *testing.B)</a>

```
searchKey: big.BenchmarkSubVW
tags: [method private benchmark]
```

```Go
func BenchmarkSubVW(b *testing.B)
```

### <a id="BenchmarkSubVWext" href="#BenchmarkSubVWext">func BenchmarkSubVWext(b *testing.B)</a>

```
searchKey: big.BenchmarkSubVWext
tags: [method private benchmark]
```

```Go
func BenchmarkSubVWext(b *testing.B)
```

Benchmarking subVW using vector of zero to force carry flag set 

### <a id="BenchmarkZeroShifts" href="#BenchmarkZeroShifts">func BenchmarkZeroShifts(b *testing.B)</a>

```
searchKey: big.BenchmarkZeroShifts
tags: [method private benchmark]
```

```Go
func BenchmarkZeroShifts(b *testing.B)
```

### <a id="Jacobi" href="#Jacobi">func Jacobi(x, y *Int) int</a>

```
searchKey: big.Jacobi
tags: [method]
```

```Go
func Jacobi(x, y *Int) int
```

Jacobi returns the Jacobi symbol (x/y), either +1, -1, or 0. The y argument must be an odd integer. 

### <a id="LeafSizeHelper" href="#LeafSizeHelper">func LeafSizeHelper(b *testing.B, base, size int)</a>

```
searchKey: big.LeafSizeHelper
tags: [method private]
```

```Go
func LeafSizeHelper(b *testing.B, base, size int)
```

### <a id="TestAbsZ" href="#TestAbsZ">func TestAbsZ(t *testing.T)</a>

```
searchKey: big.TestAbsZ
tags: [method private test]
```

```Go
func TestAbsZ(t *testing.T)
```

### <a id="TestAppendText" href="#TestAppendText">func TestAppendText(t *testing.T)</a>

```
searchKey: big.TestAppendText
tags: [method private test]
```

```Go
func TestAppendText(t *testing.T)
```

### <a id="TestBinomial" href="#TestBinomial">func TestBinomial(t *testing.T)</a>

```
searchKey: big.TestBinomial
tags: [method private test]
```

```Go
func TestBinomial(t *testing.T)
```

### <a id="TestBit" href="#TestBit">func TestBit(t *testing.T)</a>

```
searchKey: big.TestBit
tags: [method private test]
```

```Go
func TestBit(t *testing.T)
```

### <a id="TestBitLen" href="#TestBitLen">func TestBitLen(t *testing.T)</a>

```
searchKey: big.TestBitLen
tags: [method private test]
```

```Go
func TestBitLen(t *testing.T)
```

### <a id="TestBitSet" href="#TestBitSet">func TestBitSet(t *testing.T)</a>

```
searchKey: big.TestBitSet
tags: [method private test]
```

```Go
func TestBitSet(t *testing.T)
```

### <a id="TestBits" href="#TestBits">func TestBits(t *testing.T)</a>

```
searchKey: big.TestBits
tags: [method private test]
```

```Go
func TestBits(t *testing.T)
```

### <a id="TestBitwise" href="#TestBitwise">func TestBitwise(t *testing.T)</a>

```
searchKey: big.TestBitwise
tags: [method private test]
```

```Go
func TestBitwise(t *testing.T)
```

### <a id="TestBytes" href="#TestBytes">func TestBytes(t *testing.T)</a>

```
searchKey: big.TestBytes
tags: [method private test]
```

```Go
func TestBytes(t *testing.T)
```

### <a id="TestCalibrate" href="#TestCalibrate">func TestCalibrate(t *testing.T)</a>

```
searchKey: big.TestCalibrate
tags: [method private test]
```

```Go
func TestCalibrate(t *testing.T)
```

### <a id="TestCmp" href="#TestCmp">func TestCmp(t *testing.T)</a>

```
searchKey: big.TestCmp
tags: [method private test]
```

```Go
func TestCmp(t *testing.T)
```

### <a id="TestCmpAbs" href="#TestCmpAbs">func TestCmpAbs(t *testing.T)</a>

```
searchKey: big.TestCmpAbs
tags: [method private test]
```

```Go
func TestCmpAbs(t *testing.T)
```

### <a id="TestDecimalInit" href="#TestDecimalInit">func TestDecimalInit(t *testing.T)</a>

```
searchKey: big.TestDecimalInit
tags: [method private test]
```

```Go
func TestDecimalInit(t *testing.T)
```

### <a id="TestDecimalRounding" href="#TestDecimalRounding">func TestDecimalRounding(t *testing.T)</a>

```
searchKey: big.TestDecimalRounding
tags: [method private test]
```

```Go
func TestDecimalRounding(t *testing.T)
```

### <a id="TestDecimalString" href="#TestDecimalString">func TestDecimalString(t *testing.T)</a>

```
searchKey: big.TestDecimalString
tags: [method private test]
```

```Go
func TestDecimalString(t *testing.T)
```

### <a id="TestDivWW" href="#TestDivWW">func TestDivWW(t *testing.T)</a>

```
searchKey: big.TestDivWW
tags: [method private test]
```

```Go
func TestDivWW(t *testing.T)
```

### <a id="TestDivisionSigns" href="#TestDivisionSigns">func TestDivisionSigns(t *testing.T)</a>

```
searchKey: big.TestDivisionSigns
tags: [method private test]
```

```Go
func TestDivisionSigns(t *testing.T)
```

### <a id="TestExp" href="#TestExp">func TestExp(t *testing.T)</a>

```
searchKey: big.TestExp
tags: [method private test]
```

```Go
func TestExp(t *testing.T)
```

### <a id="TestExpNN" href="#TestExpNN">func TestExpNN(t *testing.T)</a>

```
searchKey: big.TestExpNN
tags: [method private test]
```

```Go
func TestExpNN(t *testing.T)
```

### <a id="TestFibo" href="#TestFibo">func TestFibo(t *testing.T)</a>

```
searchKey: big.TestFibo
tags: [method private test]
```

```Go
func TestFibo(t *testing.T)
```

### <a id="TestFillBytes" href="#TestFillBytes">func TestFillBytes(t *testing.T)</a>

```
searchKey: big.TestFillBytes
tags: [method private test]
```

```Go
func TestFillBytes(t *testing.T)
```

### <a id="TestFloat32Distribution" href="#TestFloat32Distribution">func TestFloat32Distribution(t *testing.T)</a>

```
searchKey: big.TestFloat32Distribution
tags: [method private test]
```

```Go
func TestFloat32Distribution(t *testing.T)
```

### <a id="TestFloat32SpecialCases" href="#TestFloat32SpecialCases">func TestFloat32SpecialCases(t *testing.T)</a>

```
searchKey: big.TestFloat32SpecialCases
tags: [method private test]
```

```Go
func TestFloat32SpecialCases(t *testing.T)
```

### <a id="TestFloat64Distribution" href="#TestFloat64Distribution">func TestFloat64Distribution(t *testing.T)</a>

```
searchKey: big.TestFloat64Distribution
tags: [method private test]
```

```Go
func TestFloat64Distribution(t *testing.T)
```

### <a id="TestFloat64SpecialCases" href="#TestFloat64SpecialCases">func TestFloat64SpecialCases(t *testing.T)</a>

```
searchKey: big.TestFloat64SpecialCases
tags: [method private test]
```

```Go
func TestFloat64SpecialCases(t *testing.T)
```

### <a id="TestFloat64Text" href="#TestFloat64Text">func TestFloat64Text(t *testing.T)</a>

```
searchKey: big.TestFloat64Text
tags: [method private test]
```

```Go
func TestFloat64Text(t *testing.T)
```

### <a id="TestFloatAbs" href="#TestFloatAbs">func TestFloatAbs(t *testing.T)</a>

```
searchKey: big.TestFloatAbs
tags: [method private test]
```

```Go
func TestFloatAbs(t *testing.T)
```

### <a id="TestFloatAdd" href="#TestFloatAdd">func TestFloatAdd(t *testing.T)</a>

```
searchKey: big.TestFloatAdd
tags: [method private test]
```

```Go
func TestFloatAdd(t *testing.T)
```

TestFloatAdd tests Float.Add/Sub by comparing the result of a "manual" addition/subtraction of arguments represented by Bits values with the respective Float addition/subtraction for a variety of precisions and rounding modes. 

### <a id="TestFloatAdd32" href="#TestFloatAdd32">func TestFloatAdd32(t *testing.T)</a>

```
searchKey: big.TestFloatAdd32
tags: [method private test]
```

```Go
func TestFloatAdd32(t *testing.T)
```

TestFloatAdd32 tests that Float.Add/Sub of numbers with 24bit mantissa behaves like float32 addition/subtraction (excluding denormal numbers). 

### <a id="TestFloatAdd64" href="#TestFloatAdd64">func TestFloatAdd64(t *testing.T)</a>

```
searchKey: big.TestFloatAdd64
tags: [method private test]
```

```Go
func TestFloatAdd64(t *testing.T)
```

TestFloatAdd64 tests that Float.Add/Sub of numbers with 53bit mantissa behaves like float64 addition/subtraction. 

### <a id="TestFloatAddRoundZero" href="#TestFloatAddRoundZero">func TestFloatAddRoundZero(t *testing.T)</a>

```
searchKey: big.TestFloatAddRoundZero
tags: [method private test]
```

```Go
func TestFloatAddRoundZero(t *testing.T)
```

TestFloatAddRoundZero tests Float.Add/Sub rounding when the result is exactly zero. x + (-x) or x - x for non-zero x should be +0 in all cases except when the rounding mode is ToNegativeInf in which case it should be -0. 

### <a id="TestFloatArithmeticOverflow" href="#TestFloatArithmeticOverflow">func TestFloatArithmeticOverflow(t *testing.T)</a>

```
searchKey: big.TestFloatArithmeticOverflow
tags: [method private test]
```

```Go
func TestFloatArithmeticOverflow(t *testing.T)
```

### <a id="TestFloatArithmeticRounding" href="#TestFloatArithmeticRounding">func TestFloatArithmeticRounding(t *testing.T)</a>

```
searchKey: big.TestFloatArithmeticRounding
tags: [method private test]
```

```Go
func TestFloatArithmeticRounding(t *testing.T)
```

For rounding modes ToNegativeInf and ToPositiveInf, rounding is affected by the sign of the value to be rounded. Test that rounding happens after the sign of a result has been set. This test uses specific values that are known to fail if rounding is "factored" out before setting the result sign. 

### <a id="TestFloatArithmeticSpecialValues" href="#TestFloatArithmeticSpecialValues">func TestFloatArithmeticSpecialValues(t *testing.T)</a>

```
searchKey: big.TestFloatArithmeticSpecialValues
tags: [method private test]
```

```Go
func TestFloatArithmeticSpecialValues(t *testing.T)
```

TestFloatArithmeticSpecialValues tests that Float operations produce the correct results for combinations of zero (±0), finite (±1 and ±2.71828), and infinite (±Inf) operands. 

### <a id="TestFloatCmpSpecialValues" href="#TestFloatCmpSpecialValues">func TestFloatCmpSpecialValues(t *testing.T)</a>

```
searchKey: big.TestFloatCmpSpecialValues
tags: [method private test]
```

```Go
func TestFloatCmpSpecialValues(t *testing.T)
```

TestFloatCmpSpecialValues tests that Cmp produces the correct results for combinations of zero (±0), finite (±1 and ±2.71828), and infinite (±Inf) operands. 

### <a id="TestFloatCorruptGob" href="#TestFloatCorruptGob">func TestFloatCorruptGob(t *testing.T)</a>

```
searchKey: big.TestFloatCorruptGob
tags: [method private test]
```

```Go
func TestFloatCorruptGob(t *testing.T)
```

### <a id="TestFloatFloat32" href="#TestFloatFloat32">func TestFloatFloat32(t *testing.T)</a>

```
searchKey: big.TestFloatFloat32
tags: [method private test]
```

```Go
func TestFloatFloat32(t *testing.T)
```

### <a id="TestFloatFloat64" href="#TestFloatFloat64">func TestFloatFloat64(t *testing.T)</a>

```
searchKey: big.TestFloatFloat64
tags: [method private test]
```

```Go
func TestFloatFloat64(t *testing.T)
```

### <a id="TestFloatFormat" href="#TestFloatFormat">func TestFloatFormat(t *testing.T)</a>

```
searchKey: big.TestFloatFormat
tags: [method private test]
```

```Go
func TestFloatFormat(t *testing.T)
```

### <a id="TestFloatGobEncoding" href="#TestFloatGobEncoding">func TestFloatGobEncoding(t *testing.T)</a>

```
searchKey: big.TestFloatGobEncoding
tags: [method private test]
```

```Go
func TestFloatGobEncoding(t *testing.T)
```

### <a id="TestFloatInc" href="#TestFloatInc">func TestFloatInc(t *testing.T)</a>

```
searchKey: big.TestFloatInc
tags: [method private test]
```

```Go
func TestFloatInc(t *testing.T)
```

### <a id="TestFloatInt" href="#TestFloatInt">func TestFloatInt(t *testing.T)</a>

```
searchKey: big.TestFloatInt
tags: [method private test]
```

```Go
func TestFloatInt(t *testing.T)
```

### <a id="TestFloatInt64" href="#TestFloatInt64">func TestFloatInt64(t *testing.T)</a>

```
searchKey: big.TestFloatInt64
tags: [method private test]
```

```Go
func TestFloatInt64(t *testing.T)
```

### <a id="TestFloatIsInt" href="#TestFloatIsInt">func TestFloatIsInt(t *testing.T)</a>

```
searchKey: big.TestFloatIsInt
tags: [method private test]
```

```Go
func TestFloatIsInt(t *testing.T)
```

### <a id="TestFloatJSONEncoding" href="#TestFloatJSONEncoding">func TestFloatJSONEncoding(t *testing.T)</a>

```
searchKey: big.TestFloatJSONEncoding
tags: [method private test]
```

```Go
func TestFloatJSONEncoding(t *testing.T)
```

### <a id="TestFloatMantExp" href="#TestFloatMantExp">func TestFloatMantExp(t *testing.T)</a>

```
searchKey: big.TestFloatMantExp
tags: [method private test]
```

```Go
func TestFloatMantExp(t *testing.T)
```

### <a id="TestFloatMantExpAliasing" href="#TestFloatMantExpAliasing">func TestFloatMantExpAliasing(t *testing.T)</a>

```
searchKey: big.TestFloatMantExpAliasing
tags: [method private test]
```

```Go
func TestFloatMantExpAliasing(t *testing.T)
```

### <a id="TestFloatMinPrec" href="#TestFloatMinPrec">func TestFloatMinPrec(t *testing.T)</a>

```
searchKey: big.TestFloatMinPrec
tags: [method private test]
```

```Go
func TestFloatMinPrec(t *testing.T)
```

### <a id="TestFloatMul" href="#TestFloatMul">func TestFloatMul(t *testing.T)</a>

```
searchKey: big.TestFloatMul
tags: [method private test]
```

```Go
func TestFloatMul(t *testing.T)
```

TestFloatMul tests Float.Mul/Quo by comparing the result of a "manual" multiplication/division of arguments represented by Bits values with the respective Float multiplication/division for a variety of precisions and rounding modes. 

### <a id="TestFloatMul64" href="#TestFloatMul64">func TestFloatMul64(t *testing.T)</a>

```
searchKey: big.TestFloatMul64
tags: [method private test]
```

```Go
func TestFloatMul64(t *testing.T)
```

TestFloatMul64 tests that Float.Mul/Quo of numbers with 53bit mantissa behaves like float64 multiplication/division. 

### <a id="TestFloatNeg" href="#TestFloatNeg">func TestFloatNeg(t *testing.T)</a>

```
searchKey: big.TestFloatNeg
tags: [method private test]
```

```Go
func TestFloatNeg(t *testing.T)
```

### <a id="TestFloatPredicates" href="#TestFloatPredicates">func TestFloatPredicates(t *testing.T)</a>

```
searchKey: big.TestFloatPredicates
tags: [method private test]
```

```Go
func TestFloatPredicates(t *testing.T)
```

### <a id="TestFloatQuo" href="#TestFloatQuo">func TestFloatQuo(t *testing.T)</a>

```
searchKey: big.TestFloatQuo
tags: [method private test]
```

```Go
func TestFloatQuo(t *testing.T)
```

### <a id="TestFloatQuoSmoke" href="#TestFloatQuoSmoke">func TestFloatQuoSmoke(t *testing.T)</a>

```
searchKey: big.TestFloatQuoSmoke
tags: [method private test]
```

```Go
func TestFloatQuoSmoke(t *testing.T)
```

TestFloatQuoSmoke tests all divisions x/y for values x, y in the range [-n, +n]; it serves as a smoke test for basic correctness of division. 

### <a id="TestFloatRat" href="#TestFloatRat">func TestFloatRat(t *testing.T)</a>

```
searchKey: big.TestFloatRat
tags: [method private test]
```

```Go
func TestFloatRat(t *testing.T)
```

### <a id="TestFloatRound" href="#TestFloatRound">func TestFloatRound(t *testing.T)</a>

```
searchKey: big.TestFloatRound
tags: [method private test]
```

```Go
func TestFloatRound(t *testing.T)
```

TestFloatRound tests basic rounding. 

### <a id="TestFloatRound24" href="#TestFloatRound24">func TestFloatRound24(t *testing.T)</a>

```
searchKey: big.TestFloatRound24
tags: [method private test]
```

```Go
func TestFloatRound24(t *testing.T)
```

TestFloatRound24 tests that rounding a float64 to 24 bits matches IEEE-754 rounding to nearest when converting a float64 to a float32 (excluding denormal numbers). 

### <a id="TestFloatScan" href="#TestFloatScan">func TestFloatScan(t *testing.T)</a>

```
searchKey: big.TestFloatScan
tags: [method private test]
```

```Go
func TestFloatScan(t *testing.T)
```

### <a id="TestFloatSetFloat64" href="#TestFloatSetFloat64">func TestFloatSetFloat64(t *testing.T)</a>

```
searchKey: big.TestFloatSetFloat64
tags: [method private test]
```

```Go
func TestFloatSetFloat64(t *testing.T)
```

### <a id="TestFloatSetFloat64String" href="#TestFloatSetFloat64String">func TestFloatSetFloat64String(t *testing.T)</a>

```
searchKey: big.TestFloatSetFloat64String
tags: [method private test]
```

```Go
func TestFloatSetFloat64String(t *testing.T)
```

### <a id="TestFloatSetInf" href="#TestFloatSetInf">func TestFloatSetInf(t *testing.T)</a>

```
searchKey: big.TestFloatSetInf
tags: [method private test]
```

```Go
func TestFloatSetInf(t *testing.T)
```

### <a id="TestFloatSetInt" href="#TestFloatSetInt">func TestFloatSetInt(t *testing.T)</a>

```
searchKey: big.TestFloatSetInt
tags: [method private test]
```

```Go
func TestFloatSetInt(t *testing.T)
```

### <a id="TestFloatSetInt64" href="#TestFloatSetInt64">func TestFloatSetInt64(t *testing.T)</a>

```
searchKey: big.TestFloatSetInt64
tags: [method private test]
```

```Go
func TestFloatSetInt64(t *testing.T)
```

### <a id="TestFloatSetMantExp" href="#TestFloatSetMantExp">func TestFloatSetMantExp(t *testing.T)</a>

```
searchKey: big.TestFloatSetMantExp
tags: [method private test]
```

```Go
func TestFloatSetMantExp(t *testing.T)
```

### <a id="TestFloatSetPrec" href="#TestFloatSetPrec">func TestFloatSetPrec(t *testing.T)</a>

```
searchKey: big.TestFloatSetPrec
tags: [method private test]
```

```Go
func TestFloatSetPrec(t *testing.T)
```

### <a id="TestFloatSetRat" href="#TestFloatSetRat">func TestFloatSetRat(t *testing.T)</a>

```
searchKey: big.TestFloatSetRat
tags: [method private test]
```

```Go
func TestFloatSetRat(t *testing.T)
```

### <a id="TestFloatSetUint64" href="#TestFloatSetUint64">func TestFloatSetUint64(t *testing.T)</a>

```
searchKey: big.TestFloatSetUint64
tags: [method private test]
```

```Go
func TestFloatSetUint64(t *testing.T)
```

### <a id="TestFloatSign" href="#TestFloatSign">func TestFloatSign(t *testing.T)</a>

```
searchKey: big.TestFloatSign
tags: [method private test]
```

```Go
func TestFloatSign(t *testing.T)
```

### <a id="TestFloatSqrt" href="#TestFloatSqrt">func TestFloatSqrt(t *testing.T)</a>

```
searchKey: big.TestFloatSqrt
tags: [method private test]
```

```Go
func TestFloatSqrt(t *testing.T)
```

### <a id="TestFloatSqrt64" href="#TestFloatSqrt64">func TestFloatSqrt64(t *testing.T)</a>

```
searchKey: big.TestFloatSqrt64
tags: [method private test]
```

```Go
func TestFloatSqrt64(t *testing.T)
```

TestFloatSqrt64 tests that Float.Sqrt of numbers with 53bit mantissa behaves like float math.Sqrt. 

### <a id="TestFloatSqrtSpecial" href="#TestFloatSqrtSpecial">func TestFloatSqrtSpecial(t *testing.T)</a>

```
searchKey: big.TestFloatSqrtSpecial
tags: [method private test]
```

```Go
func TestFloatSqrtSpecial(t *testing.T)
```

### <a id="TestFloatString" href="#TestFloatString">func TestFloatString(t *testing.T)</a>

```
searchKey: big.TestFloatString
tags: [method private test]
```

```Go
func TestFloatString(t *testing.T)
```

### <a id="TestFloatText" href="#TestFloatText">func TestFloatText(t *testing.T)</a>

```
searchKey: big.TestFloatText
tags: [method private test]
```

```Go
func TestFloatText(t *testing.T)
```

### <a id="TestFloatUint64" href="#TestFloatUint64">func TestFloatUint64(t *testing.T)</a>

```
searchKey: big.TestFloatUint64
tags: [method private test]
```

```Go
func TestFloatUint64(t *testing.T)
```

### <a id="TestFloatZeroValue" href="#TestFloatZeroValue">func TestFloatZeroValue(t *testing.T)</a>

```
searchKey: big.TestFloatZeroValue
tags: [method private test]
```

```Go
func TestFloatZeroValue(t *testing.T)
```

### <a id="TestFormat" href="#TestFormat">func TestFormat(t *testing.T)</a>

```
searchKey: big.TestFormat
tags: [method private test]
```

```Go
func TestFormat(t *testing.T)
```

### <a id="TestFromBits" href="#TestFromBits">func TestFromBits(t *testing.T)</a>

```
searchKey: big.TestFromBits
tags: [method private test]
```

```Go
func TestFromBits(t *testing.T)
```

### <a id="TestFunNN" href="#TestFunNN">func TestFunNN(t *testing.T)</a>

```
searchKey: big.TestFunNN
tags: [method private test]
```

```Go
func TestFunNN(t *testing.T)
```

### <a id="TestFunVV" href="#TestFunVV">func TestFunVV(t *testing.T)</a>

```
searchKey: big.TestFunVV
tags: [method private test]
```

```Go
func TestFunVV(t *testing.T)
```

### <a id="TestFunVW" href="#TestFunVW">func TestFunVW(t *testing.T)</a>

```
searchKey: big.TestFunVW
tags: [method private test]
```

```Go
func TestFunVW(t *testing.T)
```

### <a id="TestFunVWExt" href="#TestFunVWExt">func TestFunVWExt(t *testing.T)</a>

```
searchKey: big.TestFunVWExt
tags: [method private test]
```

```Go
func TestFunVWExt(t *testing.T)
```

Extended testing to addVW and subVW using various kinds of input data. We utilize the results of addVW_g and subVW_g as golden reference to check correctness. 

### <a id="TestFunVWW" href="#TestFunVWW">func TestFunVWW(t *testing.T)</a>

```
searchKey: big.TestFunVWW
tags: [method private test]
```

```Go
func TestFunVWW(t *testing.T)
```

### <a id="TestGcd" href="#TestGcd">func TestGcd(t *testing.T)</a>

```
searchKey: big.TestGcd
tags: [method private test]
```

```Go
func TestGcd(t *testing.T)
```

### <a id="TestGetString" href="#TestGetString">func TestGetString(t *testing.T)</a>

```
searchKey: big.TestGetString
tags: [method private test]
```

```Go
func TestGetString(t *testing.T)
```

### <a id="TestGobEncodingNilIntInSlice" href="#TestGobEncodingNilIntInSlice">func TestGobEncodingNilIntInSlice(t *testing.T)</a>

```
searchKey: big.TestGobEncodingNilIntInSlice
tags: [method private test]
```

```Go
func TestGobEncodingNilIntInSlice(t *testing.T)
```

Sending a nil Int pointer (inside a slice) on a round trip through gob should yield a zero. TODO: top-level nils. 

### <a id="TestGobEncodingNilRatInSlice" href="#TestGobEncodingNilRatInSlice">func TestGobEncodingNilRatInSlice(t *testing.T)</a>

```
searchKey: big.TestGobEncodingNilRatInSlice
tags: [method private test]
```

```Go
func TestGobEncodingNilRatInSlice(t *testing.T)
```

Sending a nil Rat pointer (inside a slice) on a round trip through gob should yield a zero. TODO: top-level nils. 

### <a id="TestHilbert" href="#TestHilbert">func TestHilbert(t *testing.T)</a>

```
searchKey: big.TestHilbert
tags: [method private test]
```

```Go
func TestHilbert(t *testing.T)
```

### <a id="TestInt64" href="#TestInt64">func TestInt64(t *testing.T)</a>

```
searchKey: big.TestInt64
tags: [method private test]
```

```Go
func TestInt64(t *testing.T)
```

### <a id="TestIntCmpSelf" href="#TestIntCmpSelf">func TestIntCmpSelf(t *testing.T)</a>

```
searchKey: big.TestIntCmpSelf
tags: [method private test]
```

```Go
func TestIntCmpSelf(t *testing.T)
```

### <a id="TestIntGobEncoding" href="#TestIntGobEncoding">func TestIntGobEncoding(t *testing.T)</a>

```
searchKey: big.TestIntGobEncoding
tags: [method private test]
```

```Go
func TestIntGobEncoding(t *testing.T)
```

### <a id="TestIntJSONEncoding" href="#TestIntJSONEncoding">func TestIntJSONEncoding(t *testing.T)</a>

```
searchKey: big.TestIntJSONEncoding
tags: [method private test]
```

```Go
func TestIntJSONEncoding(t *testing.T)
```

### <a id="TestIntText" href="#TestIntText">func TestIntText(t *testing.T)</a>

```
searchKey: big.TestIntText
tags: [method private test]
```

```Go
func TestIntText(t *testing.T)
```

### <a id="TestIntXMLEncoding" href="#TestIntXMLEncoding">func TestIntXMLEncoding(t *testing.T)</a>

```
searchKey: big.TestIntXMLEncoding
tags: [method private test]
```

```Go
func TestIntXMLEncoding(t *testing.T)
```

### <a id="TestIsFinite" href="#TestIsFinite">func TestIsFinite(t *testing.T)</a>

```
searchKey: big.TestIsFinite
tags: [method private test]
```

```Go
func TestIsFinite(t *testing.T)
```

### <a id="TestIsInt" href="#TestIsInt">func TestIsInt(t *testing.T)</a>

```
searchKey: big.TestIsInt
tags: [method private test]
```

```Go
func TestIsInt(t *testing.T)
```

### <a id="TestIssue20490" href="#TestIssue20490">func TestIssue20490(t *testing.T)</a>

```
searchKey: big.TestIssue20490
tags: [method private test]
```

```Go
func TestIssue20490(t *testing.T)
```

### <a id="TestIssue22830" href="#TestIssue22830">func TestIssue22830(t *testing.T)</a>

```
searchKey: big.TestIssue22830
tags: [method private test]
```

```Go
func TestIssue22830(t *testing.T)
```

We can't test this together with the other Exp tests above because it requires a different receiver setup. 

### <a id="TestIssue2379" href="#TestIssue2379">func TestIssue2379(t *testing.T)</a>

```
searchKey: big.TestIssue2379
tags: [method private test]
```

```Go
func TestIssue2379(t *testing.T)
```

### <a id="TestIssue2607" href="#TestIssue2607">func TestIssue2607(t *testing.T)</a>

```
searchKey: big.TestIssue2607
tags: [method private test]
```

```Go
func TestIssue2607(t *testing.T)
```

### <a id="TestIssue31084" href="#TestIssue31084">func TestIssue31084(t *testing.T)</a>

```
searchKey: big.TestIssue31084
tags: [method private test]
```

```Go
func TestIssue31084(t *testing.T)
```

### <a id="TestIssue31184" href="#TestIssue31184">func TestIssue31184(t *testing.T)</a>

```
searchKey: big.TestIssue31184
tags: [method private test]
```

```Go
func TestIssue31184(t *testing.T)
```

### <a id="TestIssue34919" href="#TestIssue34919">func TestIssue34919(t *testing.T)</a>

```
searchKey: big.TestIssue34919
tags: [method private test]
```

```Go
func TestIssue34919(t *testing.T)
```

TestIssue34919 verifies that a Rat's denominator is not modified when simply accessing the Rat value. 

### <a id="TestIssue3521" href="#TestIssue3521">func TestIssue3521(t *testing.T)</a>

```
searchKey: big.TestIssue3521
tags: [method private test]
```

```Go
func TestIssue3521(t *testing.T)
```

### <a id="TestIssue37499" href="#TestIssue37499">func TestIssue37499(t *testing.T)</a>

```
searchKey: big.TestIssue37499
tags: [method private test]
```

```Go
func TestIssue37499(t *testing.T)
```

TestIssue37499 triggers the edge case of divBasic where the inaccurate estimate of the first word's quotient happens at the very beginning of the loop. 

### <a id="TestIssue42552" href="#TestIssue42552">func TestIssue42552(t *testing.T)</a>

```
searchKey: big.TestIssue42552
tags: [method private test]
```

```Go
func TestIssue42552(t *testing.T)
```

TestIssue42552 triggers an edge case of recursive division where the first division loop is never entered, and correcting the remainder takes exactly two iterations in the final loop. 

### <a id="TestIssue42838" href="#TestIssue42838">func TestIssue42838(t *testing.T)</a>

```
searchKey: big.TestIssue42838
tags: [method private test]
```

```Go
func TestIssue42838(t *testing.T)
```

### <a id="TestIssue45910" href="#TestIssue45910">func TestIssue45910(t *testing.T)</a>

```
searchKey: big.TestIssue45910
tags: [method private test]
```

```Go
func TestIssue45910(t *testing.T)
```

### <a id="TestIssue6866" href="#TestIssue6866">func TestIssue6866(t *testing.T)</a>

```
searchKey: big.TestIssue6866
tags: [method private test]
```

```Go
func TestIssue6866(t *testing.T)
```

### <a id="TestIssue820" href="#TestIssue820">func TestIssue820(t *testing.T)</a>

```
searchKey: big.TestIssue820
tags: [method private test]
```

```Go
func TestIssue820(t *testing.T)
```

### <a id="TestJacobi" href="#TestJacobi">func TestJacobi(t *testing.T)</a>

```
searchKey: big.TestJacobi
tags: [method private test]
```

```Go
func TestJacobi(t *testing.T)
```

### <a id="TestJacobiPanic" href="#TestJacobiPanic">func TestJacobiPanic(t *testing.T)</a>

```
searchKey: big.TestJacobiPanic
tags: [method private test]
```

```Go
func TestJacobiPanic(t *testing.T)
```

### <a id="TestLinkerGC" href="#TestLinkerGC">func TestLinkerGC(t *testing.T)</a>

```
searchKey: big.TestLinkerGC
tags: [method private test]
```

```Go
func TestLinkerGC(t *testing.T)
```

Tests that the linker is able to remove references to Float, Rat, and Int if unused (notably, not used by init). 

### <a id="TestLsh" href="#TestLsh">func TestLsh(t *testing.T)</a>

```
searchKey: big.TestLsh
tags: [method private test]
```

```Go
func TestLsh(t *testing.T)
```

### <a id="TestLshRsh" href="#TestLshRsh">func TestLshRsh(t *testing.T)</a>

```
searchKey: big.TestLshRsh
tags: [method private test]
```

```Go
func TestLshRsh(t *testing.T)
```

### <a id="TestLshSelf" href="#TestLshSelf">func TestLshSelf(t *testing.T)</a>

```
searchKey: big.TestLshSelf
tags: [method private test]
```

```Go
func TestLshSelf(t *testing.T)
```

### <a id="TestLucasPseudoprimes" href="#TestLucasPseudoprimes">func TestLucasPseudoprimes(t *testing.T)</a>

```
searchKey: big.TestLucasPseudoprimes
tags: [method private test]
```

```Go
func TestLucasPseudoprimes(t *testing.T)
```

### <a id="TestMaxBase" href="#TestMaxBase">func TestMaxBase(t *testing.T)</a>

```
searchKey: big.TestMaxBase
tags: [method private test]
```

```Go
func TestMaxBase(t *testing.T)
```

### <a id="TestMillerRabinPseudoprimes" href="#TestMillerRabinPseudoprimes">func TestMillerRabinPseudoprimes(t *testing.T)</a>

```
searchKey: big.TestMillerRabinPseudoprimes
tags: [method private test]
```

```Go
func TestMillerRabinPseudoprimes(t *testing.T)
```

### <a id="TestModInverse" href="#TestModInverse">func TestModInverse(t *testing.T)</a>

```
searchKey: big.TestModInverse
tags: [method private test]
```

```Go
func TestModInverse(t *testing.T)
```

### <a id="TestModSqrt" href="#TestModSqrt">func TestModSqrt(t *testing.T)</a>

```
searchKey: big.TestModSqrt
tags: [method private test]
```

```Go
func TestModSqrt(t *testing.T)
```

### <a id="TestModW" href="#TestModW">func TestModW(t *testing.T)</a>

```
searchKey: big.TestModW
tags: [method private test]
```

```Go
func TestModW(t *testing.T)
```

### <a id="TestMontgomery" href="#TestMontgomery">func TestMontgomery(t *testing.T)</a>

```
searchKey: big.TestMontgomery
tags: [method private test]
```

```Go
func TestMontgomery(t *testing.T)
```

### <a id="TestMul" href="#TestMul">func TestMul(t *testing.T)</a>

```
searchKey: big.TestMul
tags: [method private test]
```

```Go
func TestMul(t *testing.T)
```

### <a id="TestMulAddWWW" href="#TestMulAddWWW">func TestMulAddWWW(t *testing.T)</a>

```
searchKey: big.TestMulAddWWW
tags: [method private test]
```

```Go
func TestMulAddWWW(t *testing.T)
```

### <a id="TestMulBits" href="#TestMulBits">func TestMulBits(t *testing.T)</a>

```
searchKey: big.TestMulBits
tags: [method private test]
```

```Go
func TestMulBits(t *testing.T)
```

### <a id="TestMulRangeN" href="#TestMulRangeN">func TestMulRangeN(t *testing.T)</a>

```
searchKey: big.TestMulRangeN
tags: [method private test]
```

```Go
func TestMulRangeN(t *testing.T)
```

### <a id="TestMulRangeZ" href="#TestMulRangeZ">func TestMulRangeZ(t *testing.T)</a>

```
searchKey: big.TestMulRangeZ
tags: [method private test]
```

```Go
func TestMulRangeZ(t *testing.T)
```

### <a id="TestMulUnbalanced" href="#TestMulUnbalanced">func TestMulUnbalanced(t *testing.T)</a>

```
searchKey: big.TestMulUnbalanced
tags: [method private test]
```

```Go
func TestMulUnbalanced(t *testing.T)
```

TestMulUnbalanced tests that multiplying numbers of different lengths does not cause deep recursion and in turn allocate too much memory. Test case for issue 3807. 

### <a id="TestMulWW" href="#TestMulWW">func TestMulWW(t *testing.T)</a>

```
searchKey: big.TestMulWW
tags: [method private test]
```

```Go
func TestMulWW(t *testing.T)
```

### <a id="TestNLZ" href="#TestNLZ">func TestNLZ(t *testing.T)</a>

```
searchKey: big.TestNLZ
tags: [method private test]
```

```Go
func TestNLZ(t *testing.T)
```

### <a id="TestNatDiv" href="#TestNatDiv">func TestNatDiv(t *testing.T)</a>

```
searchKey: big.TestNatDiv
tags: [method private test]
```

```Go
func TestNatDiv(t *testing.T)
```

### <a id="TestNormBits" href="#TestNormBits">func TestNormBits(t *testing.T)</a>

```
searchKey: big.TestNormBits
tags: [method private test]
```

```Go
func TestNormBits(t *testing.T)
```

### <a id="TestNot" href="#TestNot">func TestNot(t *testing.T)</a>

```
searchKey: big.TestNot
tags: [method private test]
```

```Go
func TestNot(t *testing.T)
```

### <a id="TestProbablyPrime" href="#TestProbablyPrime">func TestProbablyPrime(t *testing.T)</a>

```
searchKey: big.TestProbablyPrime
tags: [method private test]
```

```Go
func TestProbablyPrime(t *testing.T)
```

### <a id="TestProdZZ" href="#TestProdZZ">func TestProdZZ(t *testing.T)</a>

```
searchKey: big.TestProdZZ
tags: [method private test]
```

```Go
func TestProdZZ(t *testing.T)
```

### <a id="TestQuo" href="#TestQuo">func TestQuo(t *testing.T)</a>

```
searchKey: big.TestQuo
tags: [method private test]
```

```Go
func TestQuo(t *testing.T)
```

### <a id="TestQuoStepD6" href="#TestQuoStepD6">func TestQuoStepD6(t *testing.T)</a>

```
searchKey: big.TestQuoStepD6
tags: [method private test]
```

```Go
func TestQuoStepD6(t *testing.T)
```

### <a id="TestRatAbs" href="#TestRatAbs">func TestRatAbs(t *testing.T)</a>

```
searchKey: big.TestRatAbs
tags: [method private test]
```

```Go
func TestRatAbs(t *testing.T)
```

### <a id="TestRatBin" href="#TestRatBin">func TestRatBin(t *testing.T)</a>

```
searchKey: big.TestRatBin
tags: [method private test]
```

```Go
func TestRatBin(t *testing.T)
```

### <a id="TestRatCmp" href="#TestRatCmp">func TestRatCmp(t *testing.T)</a>

```
searchKey: big.TestRatCmp
tags: [method private test]
```

```Go
func TestRatCmp(t *testing.T)
```

### <a id="TestRatGobEncoding" href="#TestRatGobEncoding">func TestRatGobEncoding(t *testing.T)</a>

```
searchKey: big.TestRatGobEncoding
tags: [method private test]
```

```Go
func TestRatGobEncoding(t *testing.T)
```

### <a id="TestRatInv" href="#TestRatInv">func TestRatInv(t *testing.T)</a>

```
searchKey: big.TestRatInv
tags: [method private test]
```

```Go
func TestRatInv(t *testing.T)
```

### <a id="TestRatJSONEncoding" href="#TestRatJSONEncoding">func TestRatJSONEncoding(t *testing.T)</a>

```
searchKey: big.TestRatJSONEncoding
tags: [method private test]
```

```Go
func TestRatJSONEncoding(t *testing.T)
```

### <a id="TestRatNeg" href="#TestRatNeg">func TestRatNeg(t *testing.T)</a>

```
searchKey: big.TestRatNeg
tags: [method private test]
```

```Go
func TestRatNeg(t *testing.T)
```

### <a id="TestRatScan" href="#TestRatScan">func TestRatScan(t *testing.T)</a>

```
searchKey: big.TestRatScan
tags: [method private test]
```

```Go
func TestRatScan(t *testing.T)
```

### <a id="TestRatSetFrac64Rat" href="#TestRatSetFrac64Rat">func TestRatSetFrac64Rat(t *testing.T)</a>

```
searchKey: big.TestRatSetFrac64Rat
tags: [method private test]
```

```Go
func TestRatSetFrac64Rat(t *testing.T)
```

### <a id="TestRatSetInt64" href="#TestRatSetInt64">func TestRatSetInt64(t *testing.T)</a>

```
searchKey: big.TestRatSetInt64
tags: [method private test]
```

```Go
func TestRatSetInt64(t *testing.T)
```

### <a id="TestRatSetString" href="#TestRatSetString">func TestRatSetString(t *testing.T)</a>

```
searchKey: big.TestRatSetString
tags: [method private test]
```

```Go
func TestRatSetString(t *testing.T)
```

### <a id="TestRatSetUint64" href="#TestRatSetUint64">func TestRatSetUint64(t *testing.T)</a>

```
searchKey: big.TestRatSetUint64
tags: [method private test]
```

```Go
func TestRatSetUint64(t *testing.T)
```

### <a id="TestRatSign" href="#TestRatSign">func TestRatSign(t *testing.T)</a>

```
searchKey: big.TestRatSign
tags: [method private test]
```

```Go
func TestRatSign(t *testing.T)
```

### <a id="TestRatXMLEncoding" href="#TestRatXMLEncoding">func TestRatXMLEncoding(t *testing.T)</a>

```
searchKey: big.TestRatXMLEncoding
tags: [method private test]
```

```Go
func TestRatXMLEncoding(t *testing.T)
```

### <a id="TestRsh" href="#TestRsh">func TestRsh(t *testing.T)</a>

```
searchKey: big.TestRsh
tags: [method private test]
```

```Go
func TestRsh(t *testing.T)
```

### <a id="TestRshSelf" href="#TestRshSelf">func TestRshSelf(t *testing.T)</a>

```
searchKey: big.TestRshSelf
tags: [method private test]
```

```Go
func TestRshSelf(t *testing.T)
```

### <a id="TestScan" href="#TestScan">func TestScan(t *testing.T)</a>

```
searchKey: big.TestScan
tags: [method private test]
```

```Go
func TestScan(t *testing.T)
```

### <a id="TestScanBase" href="#TestScanBase">func TestScanBase(t *testing.T)</a>

```
searchKey: big.TestScanBase
tags: [method private test]
```

```Go
func TestScanBase(t *testing.T)
```

### <a id="TestScanExponent" href="#TestScanExponent">func TestScanExponent(t *testing.T)</a>

```
searchKey: big.TestScanExponent
tags: [method private test]
```

```Go
func TestScanExponent(t *testing.T)
```

### <a id="TestScanPi" href="#TestScanPi">func TestScanPi(t *testing.T)</a>

```
searchKey: big.TestScanPi
tags: [method private test]
```

```Go
func TestScanPi(t *testing.T)
```

Test case for BenchmarkScanPi. 

### <a id="TestScanPiParallel" href="#TestScanPiParallel">func TestScanPiParallel(t *testing.T)</a>

```
searchKey: big.TestScanPiParallel
tags: [method private test]
```

```Go
func TestScanPiParallel(t *testing.T)
```

### <a id="TestSet" href="#TestSet">func TestSet(t *testing.T)</a>

```
searchKey: big.TestSet
tags: [method private test]
```

```Go
func TestSet(t *testing.T)
```

### <a id="TestSetBytes" href="#TestSetBytes">func TestSetBytes(t *testing.T)</a>

```
searchKey: big.TestSetBytes
tags: [method private test]
```

```Go
func TestSetBytes(t *testing.T)
```

### <a id="TestSetFloat64NonFinite" href="#TestSetFloat64NonFinite">func TestSetFloat64NonFinite(t *testing.T)</a>

```
searchKey: big.TestSetFloat64NonFinite
tags: [method private test]
```

```Go
func TestSetFloat64NonFinite(t *testing.T)
```

TestSetFloat64NonFinite checks that SetFloat64 of a non-finite value returns nil. 

### <a id="TestSetString" href="#TestSetString">func TestSetString(t *testing.T)</a>

```
searchKey: big.TestSetString
tags: [method private test]
```

```Go
func TestSetString(t *testing.T)
```

### <a id="TestSetZ" href="#TestSetZ">func TestSetZ(t *testing.T)</a>

```
searchKey: big.TestSetZ
tags: [method private test]
```

```Go
func TestSetZ(t *testing.T)
```

### <a id="TestShiftLeft" href="#TestShiftLeft">func TestShiftLeft(t *testing.T)</a>

```
searchKey: big.TestShiftLeft
tags: [method private test]
```

```Go
func TestShiftLeft(t *testing.T)
```

### <a id="TestShiftOverlap" href="#TestShiftOverlap">func TestShiftOverlap(t *testing.T)</a>

```
searchKey: big.TestShiftOverlap
tags: [method private test]
```

```Go
func TestShiftOverlap(t *testing.T)
```

### <a id="TestShiftRight" href="#TestShiftRight">func TestShiftRight(t *testing.T)</a>

```
searchKey: big.TestShiftRight
tags: [method private test]
```

```Go
func TestShiftRight(t *testing.T)
```

### <a id="TestSignZ" href="#TestSignZ">func TestSignZ(t *testing.T)</a>

```
searchKey: big.TestSignZ
tags: [method private test]
```

```Go
func TestSignZ(t *testing.T)
```

### <a id="TestSqr" href="#TestSqr">func TestSqr(t *testing.T)</a>

```
searchKey: big.TestSqr
tags: [method private test]
```

```Go
func TestSqr(t *testing.T)
```

### <a id="TestSqrt" href="#TestSqrt">func TestSqrt(t *testing.T)</a>

```
searchKey: big.TestSqrt
tags: [method private test]
```

```Go
func TestSqrt(t *testing.T)
```

### <a id="TestSticky" href="#TestSticky">func TestSticky(t *testing.T)</a>

```
searchKey: big.TestSticky
tags: [method private test]
```

```Go
func TestSticky(t *testing.T)
```

### <a id="TestString" href="#TestString">func TestString(t *testing.T)</a>

```
searchKey: big.TestString
tags: [method private test]
```

```Go
func TestString(t *testing.T)
```

### <a id="TestStringPowers" href="#TestStringPowers">func TestStringPowers(t *testing.T)</a>

```
searchKey: big.TestStringPowers
tags: [method private test]
```

```Go
func TestStringPowers(t *testing.T)
```

### <a id="TestSumZZ" href="#TestSumZZ">func TestSumZZ(t *testing.T)</a>

```
searchKey: big.TestSumZZ
tags: [method private test]
```

```Go
func TestSumZZ(t *testing.T)
```

### <a id="TestTrailingZeroBits" href="#TestTrailingZeroBits">func TestTrailingZeroBits(t *testing.T)</a>

```
searchKey: big.TestTrailingZeroBits
tags: [method private test]
```

```Go
func TestTrailingZeroBits(t *testing.T)
```

### <a id="TestUint64" href="#TestUint64">func TestUint64(t *testing.T)</a>

```
searchKey: big.TestUint64
tags: [method private test]
```

```Go
func TestUint64(t *testing.T)
```

### <a id="TestZeroRat" href="#TestZeroRat">func TestZeroRat(t *testing.T)</a>

```
searchKey: big.TestZeroRat
tags: [method private test]
```

```Go
func TestZeroRat(t *testing.T)
```

### <a id="actualPrec" href="#actualPrec">func actualPrec(x float64) uint</a>

```
searchKey: big.actualPrec
tags: [method private]
```

```Go
func actualPrec(x float64) uint
```

actualPrec returns the number of actually used mantissa bits. 

### <a id="addAt" href="#addAt">func addAt(z, x nat, i int)</a>

```
searchKey: big.addAt
tags: [method private]
```

```Go
func addAt(z, x nat, i int)
```

addAt implements z += x<<(_W*i); z must be long enough. (we don't use nat.add because we need z to stay the same slice, and we don't need to normalize z after each addition) 

### <a id="alias" href="#alias">func alias(x, y nat) bool</a>

```
searchKey: big.alias
tags: [method private]
```

```Go
func alias(x, y nat) bool
```

alias reports whether x and y share the same base array. Note: alias assumes that the capacity of underlying arrays 

```
is never changed for nat values; i.e. that there are
no 3-operand slice expressions in this code (or worse,
reflect-based operations to the same effect).

```
### <a id="alike" href="#alike">func alike(x, y *Float) bool</a>

```
searchKey: big.alike
tags: [method private]
```

```Go
func alike(x, y *Float) bool
```

alike(x, y) is like x.Cmp(y) == 0 but also considers the sign of 0 (0 != -0). 

### <a id="alike32" href="#alike32">func alike32(x, y float32) bool</a>

```
searchKey: big.alike32
tags: [method private]
```

```Go
func alike32(x, y float32) bool
```

### <a id="alike64" href="#alike64">func alike64(x, y float64) bool</a>

```
searchKey: big.alike64
tags: [method private]
```

```Go
func alike64(x, y float64) bool
```

### <a id="allocBytes" href="#allocBytes">func allocBytes(f func()) uint64</a>

```
searchKey: big.allocBytes
tags: [method private]
```

```Go
func allocBytes(f func()) uint64
```

allocBytes returns the number of bytes allocated by invoking f. 

### <a id="altBit" href="#altBit">func altBit(x *Int, i int) uint</a>

```
searchKey: big.altBit
tags: [method private]
```

```Go
func altBit(x *Int, i int) uint
```

### <a id="appendZeros" href="#appendZeros">func appendZeros(buf []byte, n int) []byte</a>

```
searchKey: big.appendZeros
tags: [method private]
```

```Go
func appendZeros(buf []byte, n int) []byte
```

appendZeros appends n 0 digits to buf and returns buf. 

### <a id="basicMul" href="#basicMul">func basicMul(z, x, y nat)</a>

```
searchKey: big.basicMul
tags: [method private]
```

```Go
func basicMul(z, x, y nat)
```

basicMul multiplies x and y and leaves the result in z. The (non-normalized) result is placed in z[0 : len(x) + len(y)]. 

### <a id="basicSqr" href="#basicSqr">func basicSqr(z, x nat)</a>

```
searchKey: big.basicSqr
tags: [method private]
```

```Go
func basicSqr(z, x nat)
```

basicSqr sets z = x*x and is asymptotically faster than basicMul by about a factor of 2, but slower for small arguments due to overhead. Requirements: len(x) > 0, len(z) == 2*len(x) The (non-normalized) result is placed in z. 

### <a id="benchmarkDiv" href="#benchmarkDiv">func benchmarkDiv(b *testing.B, aSize, bSize int)</a>

```
searchKey: big.benchmarkDiv
tags: [method private]
```

```Go
func benchmarkDiv(b *testing.B, aSize, bSize int)
```

### <a id="benchmarkIntSqr" href="#benchmarkIntSqr">func benchmarkIntSqr(b *testing.B, nwords int)</a>

```
searchKey: big.benchmarkIntSqr
tags: [method private]
```

```Go
func benchmarkIntSqr(b *testing.B, nwords int)
```

### <a id="benchmarkNatMul" href="#benchmarkNatMul">func benchmarkNatMul(b *testing.B, nwords int)</a>

```
searchKey: big.benchmarkNatMul
tags: [method private]
```

```Go
func benchmarkNatMul(b *testing.B, nwords int)
```

### <a id="benchmarkNatSqr" href="#benchmarkNatSqr">func benchmarkNatSqr(b *testing.B, nwords int)</a>

```
searchKey: big.benchmarkNatSqr
tags: [method private]
```

```Go
func benchmarkNatSqr(b *testing.B, nwords int)
```

### <a id="checkBytes" href="#checkBytes">func checkBytes(b []byte) bool</a>

```
searchKey: big.checkBytes
tags: [method private]
```

```Go
func checkBytes(b []byte) bool
```

### <a id="checkGcd" href="#checkGcd">func checkGcd(aBytes, bBytes []byte) bool</a>

```
searchKey: big.checkGcd
tags: [method private]
```

```Go
func checkGcd(aBytes, bBytes []byte) bool
```

### <a id="checkIsBestApprox32" href="#checkIsBestApprox32">func checkIsBestApprox32(t *testing.T, f float32, r *Rat) bool</a>

```
searchKey: big.checkIsBestApprox32
tags: [method private]
```

```Go
func checkIsBestApprox32(t *testing.T, f float32, r *Rat) bool
```

checkIsBestApprox32 checks that f is the best possible float32 approximation of r. Returns true on success. 

### <a id="checkIsBestApprox64" href="#checkIsBestApprox64">func checkIsBestApprox64(t *testing.T, f float64, r *Rat) bool</a>

```
searchKey: big.checkIsBestApprox64
tags: [method private]
```

```Go
func checkIsBestApprox64(t *testing.T, f float64, r *Rat) bool
```

checkIsBestApprox64 checks that f is the best possible float64 approximation of r. Returns true on success. 

### <a id="checkLehmerExtGcd" href="#checkLehmerExtGcd">func checkLehmerExtGcd(aBytes, bBytes []byte) bool</a>

```
searchKey: big.checkLehmerExtGcd
tags: [method private]
```

```Go
func checkLehmerExtGcd(aBytes, bBytes []byte) bool
```

### <a id="checkLehmerGcd" href="#checkLehmerGcd">func checkLehmerGcd(aBytes, bBytes []byte) bool</a>

```
searchKey: big.checkLehmerGcd
tags: [method private]
```

```Go
func checkLehmerGcd(aBytes, bBytes []byte) bool
```

### <a id="checkMul" href="#checkMul">func checkMul(a, b []byte) bool</a>

```
searchKey: big.checkMul
tags: [method private]
```

```Go
func checkMul(a, b []byte) bool
```

### <a id="checkNonLossyRoundtrip32" href="#checkNonLossyRoundtrip32">func checkNonLossyRoundtrip32(t *testing.T, f float32)</a>

```
searchKey: big.checkNonLossyRoundtrip32
tags: [method private]
```

```Go
func checkNonLossyRoundtrip32(t *testing.T, f float32)
```

checkNonLossyRoundtrip32 checks that a float->Rat->float roundtrip is non-lossy for finite f. 

### <a id="checkNonLossyRoundtrip64" href="#checkNonLossyRoundtrip64">func checkNonLossyRoundtrip64(t *testing.T, f float64)</a>

```
searchKey: big.checkNonLossyRoundtrip64
tags: [method private]
```

```Go
func checkNonLossyRoundtrip64(t *testing.T, f float64)
```

checkNonLossyRoundtrip64 checks that a float->Rat->float roundtrip is non-lossy for finite f. 

### <a id="checkQuo" href="#checkQuo">func checkQuo(x, y []byte) bool</a>

```
searchKey: big.checkQuo
tags: [method private]
```

```Go
func checkQuo(x, y []byte) bool
```

### <a id="checkSetBytes" href="#checkSetBytes">func checkSetBytes(b []byte) bool</a>

```
searchKey: big.checkSetBytes
tags: [method private]
```

```Go
func checkSetBytes(b []byte) bool
```

### <a id="computeKaratsubaThresholds" href="#computeKaratsubaThresholds">func computeKaratsubaThresholds()</a>

```
searchKey: big.computeKaratsubaThresholds
tags: [function private]
```

```Go
func computeKaratsubaThresholds()
```

### <a id="computeSqrThreshold" href="#computeSqrThreshold">func computeSqrThreshold(from, to, step, nruns int, lower, upper string) int</a>

```
searchKey: big.computeSqrThreshold
tags: [method private]
```

```Go
func computeSqrThreshold(from, to, step, nruns int, lower, upper string) int
```

### <a id="cutSpace" href="#cutSpace">func cutSpace(r rune) rune</a>

```
searchKey: big.cutSpace
tags: [method private]
```

```Go
func cutSpace(r rune) rune
```

### <a id="divisors" href="#divisors">func divisors(m int, b Word, ndigits int, bb Word) []divisor</a>

```
searchKey: big.divisors
tags: [method private]
```

```Go
func divisors(m int, b Word, ndigits int, bb Word) []divisor
```

construct table of powers of bb*leafSize to use in subdivisions 

### <a id="doHilbert" href="#doHilbert">func doHilbert(t *testing.T, n int)</a>

```
searchKey: big.doHilbert
tags: [method private]
```

```Go
func doHilbert(t *testing.T, n int)
```

### <a id="euclidUpdate" href="#euclidUpdate">func euclidUpdate(A, B, Ua, Ub, q, r, s, t *Int, extended bool)</a>

```
searchKey: big.euclidUpdate
tags: [method private]
```

```Go
func euclidUpdate(A, B, Ua, Ub, q, r, s, t *Int, extended bool)
```

euclidUpdate performs a single step of the Euclidean GCD algorithm if extended is true, it also updates the cosequence Ua, Ub 

### <a id="fdiv" href="#fdiv">func fdiv(a, b float64) float64</a>

```
searchKey: big.fdiv
tags: [method private]
```

```Go
func fdiv(a, b float64) float64
```

### <a id="fmtE" href="#fmtE">func fmtE(buf []byte, fmt byte, prec int, d decimal) []byte</a>

```
searchKey: big.fmtE
tags: [method private]
```

```Go
func fmtE(buf []byte, fmt byte, prec int, d decimal) []byte
```

%e: d.ddddde±dd 

### <a id="fmtF" href="#fmtF">func fmtF(buf []byte, prec int, d decimal) []byte</a>

```
searchKey: big.fmtF
tags: [method private]
```

```Go
func fmtF(buf []byte, prec int, d decimal) []byte
```

%f: ddddddd.ddddd 

### <a id="fnorm" href="#fnorm">func fnorm(m nat) int64</a>

```
searchKey: big.fnorm
tags: [method private]
```

```Go
func fnorm(m nat) int64
```

fnorm normalizes mantissa m by shifting it to the left such that the msb of the most-significant word (msw) is 1. It returns the shift amount. It assumes that len(m) != 0. 

### <a id="format" href="#format">func format(base int) string</a>

```
searchKey: big.format
tags: [method private]
```

```Go
func format(base int) string
```

### <a id="fromBinary" href="#fromBinary">func fromBinary(s string) int64</a>

```
searchKey: big.fromBinary
tags: [method private]
```

```Go
func fromBinary(s string) int64
```

### <a id="greaterThan" href="#greaterThan">func greaterThan(x1, x2, y1, y2 Word) bool</a>

```
searchKey: big.greaterThan
tags: [method private]
```

```Go
func greaterThan(x1, x2, y1, y2 Word) bool
```

greaterThan reports whether the two digit numbers x1 x2 > y1 y2. TODO(rsc): In contradiction to most of this file, x1 is the high digit and x2 is the low digit. This should be fixed. 

### <a id="isEven32" href="#isEven32">func isEven32(f float32) bool</a>

```
searchKey: big.isEven32
tags: [method private]
```

```Go
func isEven32(f float32) bool
```

### <a id="isEven64" href="#isEven64">func isEven64(f float64) bool</a>

```
searchKey: big.isEven64
tags: [method private]
```

```Go
func isEven64(f float64) bool
```

### <a id="isFinite" href="#isFinite">func isFinite(f float64) bool</a>

```
searchKey: big.isFinite
tags: [method private]
```

```Go
func isFinite(f float64) bool
```

isFinite reports whether f represents a finite rational value. It is equivalent to !math.IsNan(f) && !math.IsInf(f, 0). 

### <a id="isNormalized" href="#isNormalized">func isNormalized(x *Int) bool</a>

```
searchKey: big.isNormalized
tags: [method private]
```

```Go
func isNormalized(x *Int) bool
```

### <a id="itoa" href="#itoa">func itoa(x nat, base int) []byte</a>

```
searchKey: big.itoa
tags: [method private]
```

```Go
func itoa(x nat, base int) []byte
```

### <a id="karatsuba" href="#karatsuba">func karatsuba(z, x, y nat)</a>

```
searchKey: big.karatsuba
tags: [method private]
```

```Go
func karatsuba(z, x, y nat)
```

karatsuba multiplies x and y and leaves the result in z. Both x and y must have the same length n and n must be a power of 2. The result vector z must have len(z) >= 6*n. The (non-normalized) result is placed in z[0 : 2*n]. 

### <a id="karatsubaAdd" href="#karatsubaAdd">func karatsubaAdd(z, x nat, n int)</a>

```
searchKey: big.karatsubaAdd
tags: [method private]
```

```Go
func karatsubaAdd(z, x nat, n int)
```

Fast version of z[0:n+n>>1].add(z[0:n+n>>1], x[0:n]) w/o bounds checks. Factored out for readability - do not use outside karatsuba. 

### <a id="karatsubaLen" href="#karatsubaLen">func karatsubaLen(n, threshold int) int</a>

```
searchKey: big.karatsubaLen
tags: [method private]
```

```Go
func karatsubaLen(n, threshold int) int
```

karatsubaLen computes an approximation to the maximum k <= n such that k = p<<i for a number p <= threshold and an i >= 0. Thus, the result is the largest number that can be divided repeatedly by 2 before becoming about the value of threshold. 

### <a id="karatsubaLoad" href="#karatsubaLoad">func karatsubaLoad(b *testing.B)</a>

```
searchKey: big.karatsubaLoad
tags: [method private]
```

```Go
func karatsubaLoad(b *testing.B)
```

### <a id="karatsubaSqr" href="#karatsubaSqr">func karatsubaSqr(z, x nat)</a>

```
searchKey: big.karatsubaSqr
tags: [method private]
```

```Go
func karatsubaSqr(z, x nat)
```

karatsubaSqr squares x and leaves the result in z. len(x) must be a power of 2 and len(z) >= 6*len(x). The (non-normalized) result is placed in z[0 : 2*len(x)]. 

The algorithm and the layout of z are the same as for karatsuba. 

### <a id="karatsubaSub" href="#karatsubaSub">func karatsubaSub(z, x nat, n int)</a>

```
searchKey: big.karatsubaSub
tags: [method private]
```

```Go
func karatsubaSub(z, x nat, n int)
```

Like karatsubaAdd, but does subtract. 

### <a id="lehmerUpdate" href="#lehmerUpdate">func lehmerUpdate(A, B, q, r, s, t *Int, u0, u1, v0, v1 Word, even bool)</a>

```
searchKey: big.lehmerUpdate
tags: [method private]
```

```Go
func lehmerUpdate(A, B, q, r, s, t *Int, u0, u1, v0, v1 Word, even bool)
```

lehmerUpdate updates the inputs A and B such that: 

```
A = u0*A + v0*B
B = u1*A + v1*B

```
where the signs of u0, u1, v0, v1 are given by even For even == true: u0, v1 >= 0 && u1, v0 <= 0 For even == false: u0, v1 <= 0 && u1, v0 >= 0 q, r, s, t are temporary variables to avoid allocations in the multiplication 

### <a id="log2" href="#log2">func log2(x Word) int</a>

```
searchKey: big.log2
tags: [method private]
```

```Go
func log2(x Word) int
```

log2 computes the integer binary logarithm of x. The result is the integer n for which 2^n <= x < 2^(n+1). If x == 0, the result is -1. 

### <a id="low32" href="#low32">func low32(x nat) uint32</a>

```
searchKey: big.low32
tags: [method private]
```

```Go
func low32(x nat) uint32
```

low32 returns the least significant 32 bits of x. 

### <a id="low64" href="#low64">func low64(x nat) uint64</a>

```
searchKey: big.low64
tags: [method private]
```

```Go
func low64(x nat) uint64
```

low64 returns the least significant 64 bits of x. 

### <a id="makeWordVec" href="#makeWordVec">func makeWordVec(e Word, n int) []Word</a>

```
searchKey: big.makeWordVec
tags: [method private]
```

```Go
func makeWordVec(e Word, n int) []Word
```

Construct a vector comprising the same word, usually '0' or 'maximum uint' 

### <a id="max" href="#max">func max(x, y int) int</a>

```
searchKey: big.max
tags: [method private]
```

```Go
func max(x, y int) int
```

### <a id="measureKaratsuba" href="#measureKaratsuba">func measureKaratsuba(th int) time.Duration</a>

```
searchKey: big.measureKaratsuba
tags: [method private]
```

```Go
func measureKaratsuba(th int) time.Duration
```

measureKaratsuba returns the time to run a Karatsuba-relevant benchmark given Karatsuba threshold th. 

### <a id="measureSqr" href="#measureSqr">func measureSqr(words, nruns int, mode string) time.Duration</a>

```
searchKey: big.measureSqr
tags: [method private]
```

```Go
func measureSqr(words, nruns int, mode string) time.Duration
```

### <a id="min" href="#min">func min(x, y int) int</a>

```
searchKey: big.min
tags: [method private]
```

```Go
func min(x, y int) int
```

### <a id="msb32" href="#msb32">func msb32(x nat) uint32</a>

```
searchKey: big.msb32
tags: [method private]
```

```Go
func msb32(x nat) uint32
```

msb32 returns the 32 most significant bits of x. 

### <a id="msb64" href="#msb64">func msb64(x nat) uint64</a>

```
searchKey: big.msb64
tags: [method private]
```

```Go
func msb64(x nat) uint64
```

msb64 returns the 64 most significant bits of x. 

### <a id="mulBytes" href="#mulBytes">func mulBytes(x, y []byte) []byte</a>

```
searchKey: big.mulBytes
tags: [method private]
```

```Go
func mulBytes(x, y []byte) []byte
```

mulBytes returns x*y via grade school multiplication. Both inputs and the result are assumed to be in big-endian representation (to match the semantics of Int.Bytes and Int.SetBytes). 

### <a id="nlz" href="#nlz">func nlz(x Word) uint</a>

```
searchKey: big.nlz
tags: [method private]
```

```Go
func nlz(x Word) uint
```

nlz returns the number of leading zeros in x. Wraps bits.LeadingZeros call for convenience. 

### <a id="putNat" href="#putNat">func putNat(x *nat)</a>

```
searchKey: big.putNat
tags: [method private]
```

```Go
func putNat(x *nat)
```

### <a id="quotToFloat32" href="#quotToFloat32">func quotToFloat32(a, b nat) (f float32, exact bool)</a>

```
searchKey: big.quotToFloat32
tags: [method private]
```

```Go
func quotToFloat32(a, b nat) (f float32, exact bool)
```

quotToFloat32 returns the non-negative float32 value nearest to the quotient a/b, using round-to-even in halfway cases. It does not mutate its arguments. Preconditions: b is non-zero; a and b have no common factors. 

### <a id="quotToFloat64" href="#quotToFloat64">func quotToFloat64(a, b nat) (f float64, exact bool)</a>

```
searchKey: big.quotToFloat64
tags: [method private]
```

```Go
func quotToFloat64(a, b nat) (f float64, exact bool)
```

quotToFloat64 returns the non-negative float64 value nearest to the quotient a/b, using round-to-even in halfway cases. It does not mutate its arguments. Preconditions: b is non-zero; a and b have no common factors. 

### <a id="ratTok" href="#ratTok">func ratTok(ch rune) bool</a>

```
searchKey: big.ratTok
tags: [method private]
```

```Go
func ratTok(ch rune) bool
```

### <a id="resetTable" href="#resetTable">func resetTable(table []divisor)</a>

```
searchKey: big.resetTable
tags: [method private]
```

```Go
func resetTable(table []divisor)
```

### <a id="rndV" href="#rndV">func rndV(n int) []Word</a>

```
searchKey: big.rndV
tags: [method private]
```

```Go
func rndV(n int) []Word
```

### <a id="roundShortest" href="#roundShortest">func roundShortest(d *decimal, x *Float)</a>

```
searchKey: big.roundShortest
tags: [method private]
```

```Go
func roundShortest(d *decimal, x *Float)
```

### <a id="runGCD" href="#runGCD">func runGCD(b *testing.B, aSize, bSize uint)</a>

```
searchKey: big.runGCD
tags: [method private]
```

```Go
func runGCD(b *testing.B, aSize, bSize uint)
```

### <a id="runGCDExt" href="#runGCDExt">func runGCDExt(b *testing.B, aSize, bSize uint, calcXY bool)</a>

```
searchKey: big.runGCDExt
tags: [method private]
```

```Go
func runGCDExt(b *testing.B, aSize, bSize uint, calcXY bool)
```

### <a id="runModWTests" href="#runModWTests">func runModWTests(t *testing.T, tests []modWTest)</a>

```
searchKey: big.runModWTests
tags: [method private]
```

```Go
func runModWTests(t *testing.T, tests []modWTest)
```

### <a id="same" href="#same">func same(x, y nat) bool</a>

```
searchKey: big.same
tags: [method private]
```

```Go
func same(x, y nat) bool
```

### <a id="scanExponent" href="#scanExponent">func scanExponent(r io.ByteScanner, base2ok, sepOk bool) (exp int64, base int, err error)</a>

```
searchKey: big.scanExponent
tags: [method private]
```

```Go
func scanExponent(r io.ByteScanner, base2ok, sepOk bool) (exp int64, base int, err error)
```

scanExponent scans the longest possible prefix of r representing a base 10 (`e', `E') or a base 2 (`p', `P') exponent, if any. It returns the exponent, the exponent base (10 or 2), or a read or syntax error, if any. 

If sepOk is set, an underscore character `_' may appear between successive exponent digits; such underscores do not change the value of the exponent. Incorrect placement of underscores is reported as an error if there are no other errors. If sepOk is not set, underscores are not recognized and thus terminate scanning like any other character that is not a valid digit. 

```
exponent = ( "e" | "E" | "p" | "P" ) [ sign ] digits .
sign     = "+" | "-" .
digits   = digit { [ '_' ] digit } .
digit    = "0" ... "9" .

```
A base 2 exponent is only permitted if base2ok is set. 

### <a id="scanSign" href="#scanSign">func scanSign(r io.ByteScanner) (neg bool, err error)</a>

```
searchKey: big.scanSign
tags: [method private]
```

```Go
func scanSign(r io.ByteScanner) (neg bool, err error)
```

### <a id="shouldRoundUp" href="#shouldRoundUp">func shouldRoundUp(x *decimal, n int) bool</a>

```
searchKey: big.shouldRoundUp
tags: [method private]
```

```Go
func shouldRoundUp(x *decimal, n int) bool
```

shouldRoundUp reports if x should be rounded up if shortened to n digits. n must be a valid index for x.mant. 

### <a id="shr" href="#shr">func shr(x *decimal, s uint)</a>

```
searchKey: big.shr
tags: [method private]
```

```Go
func shr(x *decimal, s uint)
```

shr implements x >> s, for s <= maxShift. 

### <a id="testBitFun" href="#testBitFun">func testBitFun(t *testing.T, msg string, f bitFun, x, y *Int, exp string)</a>

```
searchKey: big.testBitFun
tags: [method private]
```

```Go
func testBitFun(t *testing.T, msg string, f bitFun, x, y *Int, exp string)
```

### <a id="testBitFunSelf" href="#testBitFunSelf">func testBitFunSelf(t *testing.T, msg string, f bitFun, x, y *Int, exp string)</a>

```
searchKey: big.testBitFunSelf
tags: [method private]
```

```Go
func testBitFunSelf(t *testing.T, msg string, f bitFun, x, y *Int, exp string)
```

### <a id="testBitset" href="#testBitset">func testBitset(t *testing.T, x *Int)</a>

```
searchKey: big.testBitset
tags: [method private]
```

```Go
func testBitset(t *testing.T, x *Int)
```

### <a id="testFloatRound" href="#testFloatRound">func testFloatRound(t *testing.T, x, r int64, prec uint, mode RoundingMode)</a>

```
searchKey: big.testFloatRound
tags: [method private]
```

```Go
func testFloatRound(t *testing.T, x, r int64, prec uint, mode RoundingMode)
```

### <a id="testFunNN" href="#testFunNN">func testFunNN(t *testing.T, msg string, f funNN, a argNN)</a>

```
searchKey: big.testFunNN
tags: [method private]
```

```Go
func testFunNN(t *testing.T, msg string, f funNN, a argNN)
```

### <a id="testFunVV" href="#testFunVV">func testFunVV(t *testing.T, msg string, f funVV, a argVV)</a>

```
searchKey: big.testFunVV
tags: [method private]
```

```Go
func testFunVV(t *testing.T, msg string, f funVV, a argVV)
```

### <a id="testFunVW" href="#testFunVW">func testFunVW(t *testing.T, msg string, f funVW, a argVW)</a>

```
searchKey: big.testFunVW
tags: [method private]
```

```Go
func testFunVW(t *testing.T, msg string, f funVW, a argVW)
```

### <a id="testFunVWW" href="#testFunVWW">func testFunVWW(t *testing.T, msg string, f funVWW, a argVWW)</a>

```
searchKey: big.testFunVWW
tags: [method private]
```

```Go
func testFunVWW(t *testing.T, msg string, f funVWW, a argVWW)
```

### <a id="testFunVWext" href="#testFunVWext">func testFunVWext(t *testing.T, msg string, f funVW, f_g funVW, a argVW)</a>

```
searchKey: big.testFunVWext
tags: [method private]
```

```Go
func testFunVWext(t *testing.T, msg string, f funVW, f_g funVW, a argVW)
```

### <a id="testFunWVW" href="#testFunWVW">func testFunWVW(t *testing.T, msg string, f funWVW, a argWVW)</a>

```
searchKey: big.testFunWVW
tags: [method private]
```

```Go
func testFunWVW(t *testing.T, msg string, f funWVW, a argWVW)
```

### <a id="testFunZZ" href="#testFunZZ">func testFunZZ(t *testing.T, msg string, f funZZ, a argZZ)</a>

```
searchKey: big.testFunZZ
tags: [method private]
```

```Go
func testFunZZ(t *testing.T, msg string, f funZZ, a argZZ)
```

### <a id="testGcd" href="#testGcd">func testGcd(t *testing.T, d, x, y, a, b *Int)</a>

```
searchKey: big.testGcd
tags: [method private]
```

```Go
func testGcd(t *testing.T, d, x, y, a, b *Int)
```

### <a id="testModSqrt" href="#testModSqrt">func testModSqrt(t *testing.T, elt, mod, sq, sqrt *Int) bool</a>

```
searchKey: big.testModSqrt
tags: [method private]
```

```Go
func testModSqrt(t *testing.T, elt, mod, sq, sqrt *Int) bool
```

testModSqrt is a helper for TestModSqrt, which checks that ModSqrt can compute a square-root of elt^2. 

### <a id="testPseudoprimes" href="#testPseudoprimes">func testPseudoprimes(t *testing.T, name string, cond func(nat) bool, want []int)</a>

```
searchKey: big.testPseudoprimes
tags: [method private]
```

```Go
func testPseudoprimes(t *testing.T, name string, cond func(nat) bool, want []int)
```

### <a id="testRatBin" href="#testRatBin">func testRatBin(t *testing.T, i int, name string, f ratBinFun, a ratBinArg)</a>

```
searchKey: big.testRatBin
tags: [method private]
```

```Go
func testRatBin(t *testing.T, i int, name string, f ratBinFun, a ratBinArg)
```

### <a id="testShiftFunc" href="#testShiftFunc">func testShiftFunc(t *testing.T, f func(z, x []Word, s uint) Word, a argVU)</a>

```
searchKey: big.testShiftFunc
tags: [method private]
```

```Go
func testShiftFunc(t *testing.T, f func(z, x []Word, s uint) Word, a argVU)
```

### <a id="testSqr" href="#testSqr">func testSqr(t *testing.T, x nat)</a>

```
searchKey: big.testSqr
tags: [method private]
```

```Go
func testSqr(t *testing.T, x nat)
```

### <a id="toBinary" href="#toBinary">func toBinary(x int64) string</a>

```
searchKey: big.toBinary
tags: [method private]
```

```Go
func toBinary(x int64) string
```

### <a id="trim" href="#trim">func trim(x *decimal)</a>

```
searchKey: big.trim
tags: [method private]
```

```Go
func trim(x *decimal)
```

trim cuts off any trailing zeros from x's mantissa; they are meaningless for the value of x. 

### <a id="umax32" href="#umax32">func umax32(x, y uint32) uint32</a>

```
searchKey: big.umax32
tags: [method private]
```

```Go
func umax32(x, y uint32) uint32
```

### <a id="validateBinaryOperands" href="#validateBinaryOperands">func validateBinaryOperands(x, y *Float)</a>

```
searchKey: big.validateBinaryOperands
tags: [method private]
```

```Go
func validateBinaryOperands(x, y *Float)
```

### <a id="writeMultiple" href="#writeMultiple">func writeMultiple(s fmt.State, text string, count int)</a>

```
searchKey: big.writeMultiple
tags: [method private]
```

```Go
func writeMultiple(s fmt.State, text string, count int)
```

write count copies of text to s 

