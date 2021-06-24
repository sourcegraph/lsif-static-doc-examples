# Package constant

Package constant implements Values representing untyped Go constants and their corresponding operations. 

A special Unknown value may be used when a value is unknown due to an error. Operations on unknown values produce unknown values unless specified otherwise. 

## Index

* [Constants](#const)
    * [const Bool](#Bool)
    * [const Complex](#Complex)
    * [const Float](#Float)
    * [const Int](#Int)
    * [const String](#String)
    * [const Unknown](#Unknown)
    * [const maxExp](#maxExp)
    * [const prec](#prec)
    * [const wordSize](#wordSize)
    * [const _log](#_log)
    * [const _m](#_m)
* [Variables](#var)
    * [var bitLenTests](#bitLenTests)
    * [var bytesTests](#bytesTests)
    * [var floatTests](#floatTests)
    * [var floatVal0](#floatVal0)
    * [var fracTests](#fracTests)
    * [var imagTests](#imagTests)
    * [var intTests](#intTests)
    * [var issue14262](#issue14262)
    * [var opTests](#opTests)
    * [var optab](#optab)
    * [var stringTests](#stringTests)
    * [var xxx](#xxx)
* [Types](#type)
    * [type Kind int](#Kind)
    * [type Value interface](#Value)
        * [func BinaryOp(x_ Value, op token.Token, y_ Value) Value](#BinaryOp)
        * [func Denom(x Value) Value](#Denom)
        * [func Imag(x Value) Value](#Imag)
        * [func Make(x interface{}) Value](#Make)
        * [func MakeBool(b bool) Value](#MakeBool)
        * [func MakeFloat64(x float64) Value](#MakeFloat64)
        * [func MakeFromBytes(bytes []byte) Value](#MakeFromBytes)
        * [func MakeFromLiteral(lit string, tok token.Token, zero uint) Value](#MakeFromLiteral)
        * [func MakeImag(x Value) Value](#MakeImag)
        * [func MakeInt64(x int64) Value](#MakeInt64)
        * [func MakeString(s string) Value](#MakeString)
        * [func MakeUint64(x uint64) Value](#MakeUint64)
        * [func MakeUnknown() Value](#MakeUnknown)
        * [func Num(x Value) Value](#Num)
        * [func Real(x Value) Value](#Real)
        * [func Shift(x Value, op token.Token, s uint) Value](#Shift)
        * [func ToComplex(x Value) Value](#ToComplex)
        * [func ToFloat(x Value) Value](#ToFloat)
        * [func ToInt(x Value) Value](#ToInt)
        * [func UnaryOp(op token.Token, y Value, prec uint) Value](#UnaryOp)
        * [func add(x, y Value) Value](#add)
        * [func doOp(x Value, op token.Token, y Value) (z Value)](#doOp)
        * [func makeComplex(re, im Value) Value](#makeComplex)
        * [func makeFloat(x *big.Float) Value](#makeFloat)
        * [func makeFloatFromLiteral(lit string) Value](#makeFloatFromLiteral)
        * [func makeInt(x *big.Int) Value](#makeInt)
        * [func makeRat(x *big.Rat) Value](#makeRat)
        * [func match(x, y Value) (_, _ Value)](#match)
        * [func match0(x, y Value) (_, _ Value)](#match0)
        * [func mul(x, y Value) Value](#mul)
        * [func quo(x, y Value) Value](#quo)
        * [func sub(x, y Value) Value](#sub)
        * [func val(lit string) Value](#val)
    * [type boolVal bool](#boolVal)
        * [func (x boolVal) ExactString() string](#boolVal.ExactString)
        * [func (boolVal) Kind() Kind](#boolVal.Kind)
        * [func (x boolVal) String() string](#boolVal.String)
        * [func (boolVal) implementsValue()](#boolVal.implementsValue)
    * [type complexVal struct](#complexVal)
        * [func vtoc(x Value) complexVal](#vtoc)
        * [func (x complexVal) ExactString() string](#complexVal.ExactString)
        * [func (complexVal) Kind() Kind](#complexVal.Kind)
        * [func (x complexVal) String() string](#complexVal.String)
        * [func (complexVal) implementsValue()](#complexVal.implementsValue)
    * [type floatVal struct](#floatVal)
        * [func i64tof(x int64Val) floatVal](#i64tof)
        * [func itof(x intVal) floatVal](#itof)
        * [func rtof(x ratVal) floatVal](#rtof)
        * [func (x floatVal) ExactString() string](#floatVal.ExactString)
        * [func (floatVal) Kind() Kind](#floatVal.Kind)
        * [func (x floatVal) String() string](#floatVal.String)
        * [func (floatVal) implementsValue()](#floatVal.implementsValue)
    * [type int64Val int64](#int64Val)
        * [func (x int64Val) ExactString() string](#int64Val.ExactString)
        * [func (int64Val) Kind() Kind](#int64Val.Kind)
        * [func (x int64Val) String() string](#int64Val.String)
        * [func (int64Val) implementsValue()](#int64Val.implementsValue)
    * [type intVal struct](#intVal)
        * [func i64toi(x int64Val) intVal](#i64toi)
        * [func (x intVal) ExactString() string](#intVal.ExactString)
        * [func (intVal) Kind() Kind](#intVal.Kind)
        * [func (x intVal) String() string](#intVal.String)
        * [func (intVal) implementsValue()](#intVal.implementsValue)
    * [type makeTestCase struct](#makeTestCase)
        * [func dup(k Kind, x interface{}) makeTestCase](#dup)
    * [type ratVal struct](#ratVal)
        * [func i64tor(x int64Val) ratVal](#i64tor)
        * [func itor(x intVal) ratVal](#itor)
        * [func (x ratVal) ExactString() string](#ratVal.ExactString)
        * [func (ratVal) Kind() Kind](#ratVal.Kind)
        * [func (x ratVal) String() string](#ratVal.String)
        * [func (ratVal) implementsValue()](#ratVal.implementsValue)
    * [type stringVal struct](#stringVal)
        * [func (x *stringVal) ExactString() string](#stringVal.ExactString)
        * [func (*stringVal) Kind() Kind](#stringVal.Kind)
        * [func (x *stringVal) String() string](#stringVal.String)
        * [func (x *stringVal) appendReverse(list []string) []string](#stringVal.appendReverse)
        * [func (*stringVal) implementsValue()](#stringVal.implementsValue)
        * [func (x *stringVal) string() string](#stringVal.string)
    * [type unknownVal struct{}](#unknownVal)
        * [func (x unknownVal) ExactString() string](#unknownVal.ExactString)
        * [func (unknownVal) Kind() Kind](#unknownVal.Kind)
        * [func (unknownVal) String() string](#unknownVal.String)
        * [func (unknownVal) implementsValue()](#unknownVal.implementsValue)
* [Functions](#func)
    * [func BenchmarkStringAdd(b *testing.B)](#BenchmarkStringAdd)
    * [func BitLen(x Value) int](#BitLen)
    * [func BoolVal(x Value) bool](#BoolVal)
    * [func Bytes(x Value) []byte](#Bytes)
    * [func Compare(x_ Value, op token.Token, y_ Value) bool](#Compare)
    * [func Float32Val(x Value) (float32, bool)](#Float32Val)
    * [func Float64Val(x Value) (float64, bool)](#Float64Val)
    * [func Int64Val(x Value) (int64, bool)](#Int64Val)
    * [func Sign(x Value) int](#Sign)
    * [func StringVal(x Value) string](#StringVal)
    * [func TestBitLen(t *testing.T)](#TestBitLen)
    * [func TestBytes(t *testing.T)](#TestBytes)
    * [func TestFractions(t *testing.T)](#TestFractions)
    * [func TestMake(t *testing.T)](#TestMake)
    * [func TestMakeFloat64(t *testing.T)](#TestMakeFloat64)
    * [func TestNumbers(t *testing.T)](#TestNumbers)
    * [func TestOps(t *testing.T)](#TestOps)
    * [func TestString(t *testing.T)](#TestString)
    * [func TestUnknown(t *testing.T)](#TestUnknown)
    * [func Uint64Val(x Value) (uint64, bool)](#Uint64Val)
    * [func Val(x Value) interface{}](#Val)
    * [func cmpZero(x int, op token.Token) bool](#cmpZero)
    * [func eql(x, y Value) bool](#eql)
    * [func is32bit(x int64) bool](#is32bit)
    * [func is63bit(x int64) bool](#is63bit)
    * [func newFloat() *big.Float](#newFloat)
    * [func newInt() *big.Int](#newInt)
    * [func newRat() *big.Rat](#newRat)
    * [func ord(x Value) int](#ord)
    * [func panicHandler(v *Value)](#panicHandler)
    * [func reverse(x []string) []string](#reverse)
    * [func smallFloat(x *big.Float) bool](#smallFloat)
    * [func smallFloat64(x float64) bool](#smallFloat64)
    * [func smallInt(x *big.Int) bool](#smallInt)
    * [func testNumbers(t *testing.T, kind token.Token, tests []string)](#testNumbers)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="Bool" href="#Bool">const Bool</a>

```
searchKey: constant.Bool
tags: [constant number]
```

```Go
const Bool
```

non-numeric values 

### <a id="Complex" href="#Complex">const Complex</a>

```
searchKey: constant.Complex
tags: [constant number]
```

```Go
const Complex
```

### <a id="Float" href="#Float">const Float</a>

```
searchKey: constant.Float
tags: [constant number]
```

```Go
const Float
```

### <a id="Int" href="#Int">const Int</a>

```
searchKey: constant.Int
tags: [constant number]
```

```Go
const Int
```

numeric values 

### <a id="String" href="#String">const String</a>

```
searchKey: constant.String
tags: [constant number]
```

```Go
const String
```

### <a id="Unknown" href="#Unknown">const Unknown</a>

```
searchKey: constant.Unknown
tags: [constant number]
```

```Go
const Unknown Kind = iota
```

unknown values 

### <a id="maxExp" href="#maxExp">const maxExp</a>

```
searchKey: constant.maxExp
tags: [constant number private]
```

```Go
const maxExp = 4 << 10
```

Permit fractions with component sizes up to maxExp before switching to using floating-point numbers. 

### <a id="prec" href="#prec">const prec</a>

```
searchKey: constant.prec
tags: [constant number private]
```

```Go
const prec = 512
```

Maximum supported mantissa precision. The spec requires at least 256 bits; typical implementations use 512 bits. 

### <a id="wordSize" href="#wordSize">const wordSize</a>

```
searchKey: constant.wordSize
tags: [constant number private]
```

```Go
const wordSize = 1 << _log
```

### <a id="_log" href="#_log">const _log</a>

```
searchKey: constant._log
tags: [constant number private]
```

```Go
const _log = _m>>8&1 + _m>>16&1 + _m>>32&1
```

### <a id="_m" href="#_m">const _m</a>

```
searchKey: constant._m
tags: [constant number private]
```

```Go
const _m = ^big.Word(0)
```

Compute the size of a Word in bytes. 

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="bitLenTests" href="#bitLenTests">var bitLenTests</a>

```
searchKey: constant.bitLenTests
tags: [variable array struct private]
```

```Go
var bitLenTests = ...
```

### <a id="bytesTests" href="#bytesTests">var bytesTests</a>

```
searchKey: constant.bytesTests
tags: [variable array string private]
```

```Go
var bytesTests = ...
```

### <a id="floatTests" href="#floatTests">var floatTests</a>

```
searchKey: constant.floatTests
tags: [variable array string private]
```

```Go
var floatTests = ...
```

The RHS operand may be a floating-point quotient n/d of two integer values n and d. 

### <a id="floatVal0" href="#floatVal0">var floatVal0</a>

```
searchKey: constant.floatVal0
tags: [variable struct private]
```

```Go
var floatVal0 = floatVal{newFloat()}
```

### <a id="fracTests" href="#fracTests">var fracTests</a>

```
searchKey: constant.fracTests
tags: [variable array string private]
```

```Go
var fracTests = ...
```

### <a id="imagTests" href="#imagTests">var imagTests</a>

```
searchKey: constant.imagTests
tags: [variable array string private]
```

```Go
var imagTests = ...
```

### <a id="intTests" href="#intTests">var intTests</a>

```
searchKey: constant.intTests
tags: [variable array string private]
```

```Go
var intTests = ...
```

### <a id="issue14262" href="#issue14262">var issue14262</a>

```
searchKey: constant.issue14262
tags: [variable string private]
```

```Go
var issue14262 = ...
```

### <a id="opTests" href="#opTests">var opTests</a>

```
searchKey: constant.opTests
tags: [variable array string private]
```

```Go
var opTests = ...
```

### <a id="optab" href="#optab">var optab</a>

```
searchKey: constant.optab
tags: [variable object private]
```

```Go
var optab = ...
```

### <a id="stringTests" href="#stringTests">var stringTests</a>

```
searchKey: constant.stringTests
tags: [variable array struct private]
```

```Go
var stringTests = ...
```

### <a id="xxx" href="#xxx">var xxx</a>

```
searchKey: constant.xxx
tags: [variable string private]
```

```Go
var xxx = strings.Repeat("x", 68)
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Kind" href="#Kind">type Kind int</a>

```
searchKey: constant.Kind
tags: [number]
```

```Go
type Kind int
```

Kind specifies the kind of value represented by a Value. 

### <a id="Value" href="#Value">type Value interface</a>

```
searchKey: constant.Value
tags: [interface]
```

```Go
type Value interface {
	// Kind returns the value kind.
	Kind() Kind

	// String returns a short, quoted (human-readable) form of the value.
	// For numeric values, the result may be an approximation;
	// for String values the result may be a shortened string.
	// Use ExactString for a string representing a value exactly.
	String() string

	// ExactString returns an exact, quoted (human-readable) form of the value.
	// If the Value is of Kind String, use StringVal to obtain the unquoted string.
	ExactString() string

	// Prevent external implementations.
	implementsValue()
}
```

A Value represents the value of a Go constant. 

#### <a id="BinaryOp" href="#BinaryOp">func BinaryOp(x_ Value, op token.Token, y_ Value) Value</a>

```
searchKey: constant.BinaryOp
tags: [method]
```

```Go
func BinaryOp(x_ Value, op token.Token, y_ Value) Value
```

BinaryOp returns the result of the binary expression x op y. The operation must be defined for the operands. If one of the operands is Unknown, the result is Unknown. BinaryOp doesn't handle comparisons or shifts; use Compare or Shift instead. 

To force integer division of Int operands, use op == token.QUO_ASSIGN instead of token.QUO; the result is guaranteed to be Int in this case. Division by zero leads to a run-time panic. 

#### <a id="Denom" href="#Denom">func Denom(x Value) Value</a>

```
searchKey: constant.Denom
tags: [method]
```

```Go
func Denom(x Value) Value
```

Denom returns the denominator of x; x must be Int, Float, or Unknown. If x is Unknown, or if it is too large or small to represent as a fraction, the result is Unknown. Otherwise the result is an Int >= 1. 

#### <a id="Imag" href="#Imag">func Imag(x Value) Value</a>

```
searchKey: constant.Imag
tags: [method]
```

```Go
func Imag(x Value) Value
```

Imag returns the imaginary part of x, which must be a numeric or unknown value. If x is Unknown, the result is Unknown. 

#### <a id="Make" href="#Make">func Make(x interface{}) Value</a>

```
searchKey: constant.Make
tags: [method]
```

```Go
func Make(x interface{}) Value
```

Make returns the Value for x. 

```
type of x        result Kind
----------------------------
bool             Bool
string           String
int64            Int
*big.Int         Int
*big.Float       Float
*big.Rat         Float
anything else    Unknown

```
#### <a id="MakeBool" href="#MakeBool">func MakeBool(b bool) Value</a>

```
searchKey: constant.MakeBool
tags: [method]
```

```Go
func MakeBool(b bool) Value
```

MakeBool returns the Bool value for b. 

#### <a id="MakeFloat64" href="#MakeFloat64">func MakeFloat64(x float64) Value</a>

```
searchKey: constant.MakeFloat64
tags: [method]
```

```Go
func MakeFloat64(x float64) Value
```

MakeFloat64 returns the Float value for x. If x is -0.0, the result is 0.0. If x is not finite, the result is an Unknown. 

#### <a id="MakeFromBytes" href="#MakeFromBytes">func MakeFromBytes(bytes []byte) Value</a>

```
searchKey: constant.MakeFromBytes
tags: [method]
```

```Go
func MakeFromBytes(bytes []byte) Value
```

MakeFromBytes returns the Int value given the bytes of its little-endian binary representation. An empty byte slice argument represents 0. 

#### <a id="MakeFromLiteral" href="#MakeFromLiteral">func MakeFromLiteral(lit string, tok token.Token, zero uint) Value</a>

```
searchKey: constant.MakeFromLiteral
tags: [method]
```

```Go
func MakeFromLiteral(lit string, tok token.Token, zero uint) Value
```

MakeFromLiteral returns the corresponding integer, floating-point, imaginary, character, or string value for a Go literal string. The tok value must be one of token.INT, token.FLOAT, token.IMAG, token.CHAR, or token.STRING. The final argument must be zero. If the literal string syntax is invalid, the result is an Unknown. 

#### <a id="MakeImag" href="#MakeImag">func MakeImag(x Value) Value</a>

```
searchKey: constant.MakeImag
tags: [method]
```

```Go
func MakeImag(x Value) Value
```

MakeImag returns the Complex value x*i; x must be Int, Float, or Unknown. If x is Unknown, the result is Unknown. 

#### <a id="MakeInt64" href="#MakeInt64">func MakeInt64(x int64) Value</a>

```
searchKey: constant.MakeInt64
tags: [method]
```

```Go
func MakeInt64(x int64) Value
```

MakeInt64 returns the Int value for x. 

#### <a id="MakeString" href="#MakeString">func MakeString(s string) Value</a>

```
searchKey: constant.MakeString
tags: [method]
```

```Go
func MakeString(s string) Value
```

MakeString returns the String value for s. 

#### <a id="MakeUint64" href="#MakeUint64">func MakeUint64(x uint64) Value</a>

```
searchKey: constant.MakeUint64
tags: [method]
```

```Go
func MakeUint64(x uint64) Value
```

MakeUint64 returns the Int value for x. 

#### <a id="MakeUnknown" href="#MakeUnknown">func MakeUnknown() Value</a>

```
searchKey: constant.MakeUnknown
tags: [function]
```

```Go
func MakeUnknown() Value
```

MakeUnknown returns the Unknown value. 

#### <a id="Num" href="#Num">func Num(x Value) Value</a>

```
searchKey: constant.Num
tags: [method]
```

```Go
func Num(x Value) Value
```

Num returns the numerator of x; x must be Int, Float, or Unknown. If x is Unknown, or if it is too large or small to represent as a fraction, the result is Unknown. Otherwise the result is an Int with the same sign as x. 

#### <a id="Real" href="#Real">func Real(x Value) Value</a>

```
searchKey: constant.Real
tags: [method]
```

```Go
func Real(x Value) Value
```

Real returns the real part of x, which must be a numeric or unknown value. If x is Unknown, the result is Unknown. 

#### <a id="Shift" href="#Shift">func Shift(x Value, op token.Token, s uint) Value</a>

```
searchKey: constant.Shift
tags: [method]
```

```Go
func Shift(x Value, op token.Token, s uint) Value
```

Shift returns the result of the shift expression x op s with op == token.SHL or token.SHR (<< or >>). x must be an Int or an Unknown. If x is Unknown, the result is x. 

#### <a id="ToComplex" href="#ToComplex">func ToComplex(x Value) Value</a>

```
searchKey: constant.ToComplex
tags: [method]
```

```Go
func ToComplex(x Value) Value
```

ToComplex converts x to a Complex value if x is representable as a Complex. Otherwise it returns an Unknown. 

#### <a id="ToFloat" href="#ToFloat">func ToFloat(x Value) Value</a>

```
searchKey: constant.ToFloat
tags: [method]
```

```Go
func ToFloat(x Value) Value
```

ToFloat converts x to a Float value if x is representable as a Float. Otherwise it returns an Unknown. 

#### <a id="ToInt" href="#ToInt">func ToInt(x Value) Value</a>

```
searchKey: constant.ToInt
tags: [method]
```

```Go
func ToInt(x Value) Value
```

ToInt converts x to an Int value if x is representable as an Int. Otherwise it returns an Unknown. 

#### <a id="UnaryOp" href="#UnaryOp">func UnaryOp(op token.Token, y Value, prec uint) Value</a>

```
searchKey: constant.UnaryOp
tags: [method]
```

```Go
func UnaryOp(op token.Token, y Value, prec uint) Value
```

UnaryOp returns the result of the unary expression op y. The operation must be defined for the operand. If prec > 0 it specifies the ^ (xor) result size in bits. If y is Unknown, the result is Unknown. 

#### <a id="add" href="#add">func add(x, y Value) Value</a>

```
searchKey: constant.add
tags: [method private]
```

```Go
func add(x, y Value) Value
```

#### <a id="doOp" href="#doOp">func doOp(x Value, op token.Token, y Value) (z Value)</a>

```
searchKey: constant.doOp
tags: [method private]
```

```Go
func doOp(x Value, op token.Token, y Value) (z Value)
```

#### <a id="makeComplex" href="#makeComplex">func makeComplex(re, im Value) Value</a>

```
searchKey: constant.makeComplex
tags: [method private]
```

```Go
func makeComplex(re, im Value) Value
```

#### <a id="makeFloat" href="#makeFloat">func makeFloat(x *big.Float) Value</a>

```
searchKey: constant.makeFloat
tags: [method private]
```

```Go
func makeFloat(x *big.Float) Value
```

#### <a id="makeFloatFromLiteral" href="#makeFloatFromLiteral">func makeFloatFromLiteral(lit string) Value</a>

```
searchKey: constant.makeFloatFromLiteral
tags: [method private]
```

```Go
func makeFloatFromLiteral(lit string) Value
```

#### <a id="makeInt" href="#makeInt">func makeInt(x *big.Int) Value</a>

```
searchKey: constant.makeInt
tags: [method private]
```

```Go
func makeInt(x *big.Int) Value
```

#### <a id="makeRat" href="#makeRat">func makeRat(x *big.Rat) Value</a>

```
searchKey: constant.makeRat
tags: [method private]
```

```Go
func makeRat(x *big.Rat) Value
```

#### <a id="match" href="#match">func match(x, y Value) (_, _ Value)</a>

```
searchKey: constant.match
tags: [method private]
```

```Go
func match(x, y Value) (_, _ Value)
```

match returns the matching representation (same type) with the smallest complexity for two values x and y. If one of them is numeric, both of them must be numeric. If one of them is Unknown or invalid (say, nil) both results are that value. 

#### <a id="match0" href="#match0">func match0(x, y Value) (_, _ Value)</a>

```
searchKey: constant.match0
tags: [method private]
```

```Go
func match0(x, y Value) (_, _ Value)
```

match0 must only be called by match. Invariant: ord(x) < ord(y) 

#### <a id="mul" href="#mul">func mul(x, y Value) Value</a>

```
searchKey: constant.mul
tags: [method private]
```

```Go
func mul(x, y Value) Value
```

#### <a id="quo" href="#quo">func quo(x, y Value) Value</a>

```
searchKey: constant.quo
tags: [method private]
```

```Go
func quo(x, y Value) Value
```

#### <a id="sub" href="#sub">func sub(x, y Value) Value</a>

```
searchKey: constant.sub
tags: [method private]
```

```Go
func sub(x, y Value) Value
```

#### <a id="val" href="#val">func val(lit string) Value</a>

```
searchKey: constant.val
tags: [method private]
```

```Go
func val(lit string) Value
```

### <a id="boolVal" href="#boolVal">type boolVal bool</a>

```
searchKey: constant.boolVal
tags: [boolean private]
```

```Go
type boolVal bool
```

#### <a id="boolVal.ExactString" href="#boolVal.ExactString">func (x boolVal) ExactString() string</a>

```
searchKey: constant.boolVal.ExactString
tags: [function private]
```

```Go
func (x boolVal) ExactString() string
```

#### <a id="boolVal.Kind" href="#boolVal.Kind">func (boolVal) Kind() Kind</a>

```
searchKey: constant.boolVal.Kind
tags: [function private]
```

```Go
func (boolVal) Kind() Kind
```

#### <a id="boolVal.String" href="#boolVal.String">func (x boolVal) String() string</a>

```
searchKey: constant.boolVal.String
tags: [function private]
```

```Go
func (x boolVal) String() string
```

#### <a id="boolVal.implementsValue" href="#boolVal.implementsValue">func (boolVal) implementsValue()</a>

```
searchKey: constant.boolVal.implementsValue
tags: [function private]
```

```Go
func (boolVal) implementsValue()
```

### <a id="complexVal" href="#complexVal">type complexVal struct</a>

```
searchKey: constant.complexVal
tags: [struct private]
```

```Go
type complexVal struct{ re, im Value }
```

#### <a id="vtoc" href="#vtoc">func vtoc(x Value) complexVal</a>

```
searchKey: constant.vtoc
tags: [method private]
```

```Go
func vtoc(x Value) complexVal
```

#### <a id="complexVal.ExactString" href="#complexVal.ExactString">func (x complexVal) ExactString() string</a>

```
searchKey: constant.complexVal.ExactString
tags: [function private]
```

```Go
func (x complexVal) ExactString() string
```

#### <a id="complexVal.Kind" href="#complexVal.Kind">func (complexVal) Kind() Kind</a>

```
searchKey: constant.complexVal.Kind
tags: [function private]
```

```Go
func (complexVal) Kind() Kind
```

#### <a id="complexVal.String" href="#complexVal.String">func (x complexVal) String() string</a>

```
searchKey: constant.complexVal.String
tags: [function private]
```

```Go
func (x complexVal) String() string
```

#### <a id="complexVal.implementsValue" href="#complexVal.implementsValue">func (complexVal) implementsValue()</a>

```
searchKey: constant.complexVal.implementsValue
tags: [function private]
```

```Go
func (complexVal) implementsValue()
```

### <a id="floatVal" href="#floatVal">type floatVal struct</a>

```
searchKey: constant.floatVal
tags: [struct private]
```

```Go
type floatVal struct{ val *big.Float } // Float values not representable as a fraction

```

#### <a id="i64tof" href="#i64tof">func i64tof(x int64Val) floatVal</a>

```
searchKey: constant.i64tof
tags: [method private]
```

```Go
func i64tof(x int64Val) floatVal
```

#### <a id="itof" href="#itof">func itof(x intVal) floatVal</a>

```
searchKey: constant.itof
tags: [method private]
```

```Go
func itof(x intVal) floatVal
```

#### <a id="rtof" href="#rtof">func rtof(x ratVal) floatVal</a>

```
searchKey: constant.rtof
tags: [method private]
```

```Go
func rtof(x ratVal) floatVal
```

#### <a id="floatVal.ExactString" href="#floatVal.ExactString">func (x floatVal) ExactString() string</a>

```
searchKey: constant.floatVal.ExactString
tags: [function private]
```

```Go
func (x floatVal) ExactString() string
```

#### <a id="floatVal.Kind" href="#floatVal.Kind">func (floatVal) Kind() Kind</a>

```
searchKey: constant.floatVal.Kind
tags: [function private]
```

```Go
func (floatVal) Kind() Kind
```

#### <a id="floatVal.String" href="#floatVal.String">func (x floatVal) String() string</a>

```
searchKey: constant.floatVal.String
tags: [function private]
```

```Go
func (x floatVal) String() string
```

String returns a decimal approximation of the Float value. 

#### <a id="floatVal.implementsValue" href="#floatVal.implementsValue">func (floatVal) implementsValue()</a>

```
searchKey: constant.floatVal.implementsValue
tags: [function private]
```

```Go
func (floatVal) implementsValue()
```

### <a id="int64Val" href="#int64Val">type int64Val int64</a>

```
searchKey: constant.int64Val
tags: [number private]
```

```Go
type int64Val int64 // Int values representable as an int64

```

#### <a id="int64Val.ExactString" href="#int64Val.ExactString">func (x int64Val) ExactString() string</a>

```
searchKey: constant.int64Val.ExactString
tags: [function private]
```

```Go
func (x int64Val) ExactString() string
```

#### <a id="int64Val.Kind" href="#int64Val.Kind">func (int64Val) Kind() Kind</a>

```
searchKey: constant.int64Val.Kind
tags: [function private]
```

```Go
func (int64Val) Kind() Kind
```

#### <a id="int64Val.String" href="#int64Val.String">func (x int64Val) String() string</a>

```
searchKey: constant.int64Val.String
tags: [function private]
```

```Go
func (x int64Val) String() string
```

#### <a id="int64Val.implementsValue" href="#int64Val.implementsValue">func (int64Val) implementsValue()</a>

```
searchKey: constant.int64Val.implementsValue
tags: [function private]
```

```Go
func (int64Val) implementsValue()
```

### <a id="intVal" href="#intVal">type intVal struct</a>

```
searchKey: constant.intVal
tags: [struct private]
```

```Go
type intVal struct{ val *big.Int } // Int values not representable as an int64

```

#### <a id="i64toi" href="#i64toi">func i64toi(x int64Val) intVal</a>

```
searchKey: constant.i64toi
tags: [method private]
```

```Go
func i64toi(x int64Val) intVal
```

#### <a id="intVal.ExactString" href="#intVal.ExactString">func (x intVal) ExactString() string</a>

```
searchKey: constant.intVal.ExactString
tags: [function private]
```

```Go
func (x intVal) ExactString() string
```

#### <a id="intVal.Kind" href="#intVal.Kind">func (intVal) Kind() Kind</a>

```
searchKey: constant.intVal.Kind
tags: [function private]
```

```Go
func (intVal) Kind() Kind
```

#### <a id="intVal.String" href="#intVal.String">func (x intVal) String() string</a>

```
searchKey: constant.intVal.String
tags: [function private]
```

```Go
func (x intVal) String() string
```

#### <a id="intVal.implementsValue" href="#intVal.implementsValue">func (intVal) implementsValue()</a>

```
searchKey: constant.intVal.implementsValue
tags: [function private]
```

```Go
func (intVal) implementsValue()
```

### <a id="makeTestCase" href="#makeTestCase">type makeTestCase struct</a>

```
searchKey: constant.makeTestCase
tags: [struct private]
```

```Go
type makeTestCase struct {
	kind      Kind
	arg, want interface{}
}
```

#### <a id="dup" href="#dup">func dup(k Kind, x interface{}) makeTestCase</a>

```
searchKey: constant.dup
tags: [method private]
```

```Go
func dup(k Kind, x interface{}) makeTestCase
```

### <a id="ratVal" href="#ratVal">type ratVal struct</a>

```
searchKey: constant.ratVal
tags: [struct private]
```

```Go
type ratVal struct{ val *big.Rat } // Float values representable as a fraction

```

#### <a id="i64tor" href="#i64tor">func i64tor(x int64Val) ratVal</a>

```
searchKey: constant.i64tor
tags: [method private]
```

```Go
func i64tor(x int64Val) ratVal
```

#### <a id="itor" href="#itor">func itor(x intVal) ratVal</a>

```
searchKey: constant.itor
tags: [method private]
```

```Go
func itor(x intVal) ratVal
```

#### <a id="ratVal.ExactString" href="#ratVal.ExactString">func (x ratVal) ExactString() string</a>

```
searchKey: constant.ratVal.ExactString
tags: [function private]
```

```Go
func (x ratVal) ExactString() string
```

#### <a id="ratVal.Kind" href="#ratVal.Kind">func (ratVal) Kind() Kind</a>

```
searchKey: constant.ratVal.Kind
tags: [function private]
```

```Go
func (ratVal) Kind() Kind
```

#### <a id="ratVal.String" href="#ratVal.String">func (x ratVal) String() string</a>

```
searchKey: constant.ratVal.String
tags: [function private]
```

```Go
func (x ratVal) String() string
```

#### <a id="ratVal.implementsValue" href="#ratVal.implementsValue">func (ratVal) implementsValue()</a>

```
searchKey: constant.ratVal.implementsValue
tags: [function private]
```

```Go
func (ratVal) implementsValue()
```

### <a id="stringVal" href="#stringVal">type stringVal struct</a>

```
searchKey: constant.stringVal
tags: [struct private]
```

```Go
type stringVal struct {
	// Lazy value: either a string (l,r==nil) or an addition (l,r!=nil).
	mu   sync.Mutex
	s    string
	l, r *stringVal
}
```

#### <a id="stringVal.ExactString" href="#stringVal.ExactString">func (x *stringVal) ExactString() string</a>

```
searchKey: constant.stringVal.ExactString
tags: [function private]
```

```Go
func (x *stringVal) ExactString() string
```

#### <a id="stringVal.Kind" href="#stringVal.Kind">func (*stringVal) Kind() Kind</a>

```
searchKey: constant.stringVal.Kind
tags: [function private]
```

```Go
func (*stringVal) Kind() Kind
```

#### <a id="stringVal.String" href="#stringVal.String">func (x *stringVal) String() string</a>

```
searchKey: constant.stringVal.String
tags: [function private]
```

```Go
func (x *stringVal) String() string
```

String returns a possibly shortened quoted form of the String value. 

#### <a id="stringVal.appendReverse" href="#stringVal.appendReverse">func (x *stringVal) appendReverse(list []string) []string</a>

```
searchKey: constant.stringVal.appendReverse
tags: [method private]
```

```Go
func (x *stringVal) appendReverse(list []string) []string
```

appendReverse appends to list all of x's subpieces, but in reverse, and returns the result. Appending the reversal allows processing the right side in a recursive call and the left side in a loop. Because a chain like a + b + c + d + e is actually represented as ((((a + b) + c) + d) + e), the left-side loop avoids deep recursion. x must be locked. 

#### <a id="stringVal.implementsValue" href="#stringVal.implementsValue">func (*stringVal) implementsValue()</a>

```
searchKey: constant.stringVal.implementsValue
tags: [function private]
```

```Go
func (*stringVal) implementsValue()
```

#### <a id="stringVal.string" href="#stringVal.string">func (x *stringVal) string() string</a>

```
searchKey: constant.stringVal.string
tags: [function private]
```

```Go
func (x *stringVal) string() string
```

string constructs and returns the actual string literal value. If x represents an addition, then it rewrites x to be a single string, to speed future calls. This lazy construction avoids building different string values for all subpieces of a large concatenation. See golang.org/issue/23348. 

### <a id="unknownVal" href="#unknownVal">type unknownVal struct{}</a>

```
searchKey: constant.unknownVal
tags: [struct private]
```

```Go
type unknownVal struct{}
```

#### <a id="unknownVal.ExactString" href="#unknownVal.ExactString">func (x unknownVal) ExactString() string</a>

```
searchKey: constant.unknownVal.ExactString
tags: [function private]
```

```Go
func (x unknownVal) ExactString() string
```

#### <a id="unknownVal.Kind" href="#unknownVal.Kind">func (unknownVal) Kind() Kind</a>

```
searchKey: constant.unknownVal.Kind
tags: [function private]
```

```Go
func (unknownVal) Kind() Kind
```

#### <a id="unknownVal.String" href="#unknownVal.String">func (unknownVal) String() string</a>

```
searchKey: constant.unknownVal.String
tags: [function private]
```

```Go
func (unknownVal) String() string
```

#### <a id="unknownVal.implementsValue" href="#unknownVal.implementsValue">func (unknownVal) implementsValue()</a>

```
searchKey: constant.unknownVal.implementsValue
tags: [function private]
```

```Go
func (unknownVal) implementsValue()
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkStringAdd" href="#BenchmarkStringAdd">func BenchmarkStringAdd(b *testing.B)</a>

```
searchKey: constant.BenchmarkStringAdd
tags: [method private benchmark]
```

```Go
func BenchmarkStringAdd(b *testing.B)
```

### <a id="BitLen" href="#BitLen">func BitLen(x Value) int</a>

```
searchKey: constant.BitLen
tags: [method]
```

```Go
func BitLen(x Value) int
```

BitLen returns the number of bits required to represent the absolute value x in binary representation; x must be an Int or an Unknown. If x is Unknown, the result is 0. 

### <a id="BoolVal" href="#BoolVal">func BoolVal(x Value) bool</a>

```
searchKey: constant.BoolVal
tags: [method]
```

```Go
func BoolVal(x Value) bool
```

BoolVal returns the Go boolean value of x, which must be a Bool or an Unknown. If x is Unknown, the result is false. 

### <a id="Bytes" href="#Bytes">func Bytes(x Value) []byte</a>

```
searchKey: constant.Bytes
tags: [method]
```

```Go
func Bytes(x Value) []byte
```

Bytes returns the bytes for the absolute value of x in little- endian binary representation; x must be an Int. 

### <a id="Compare" href="#Compare">func Compare(x_ Value, op token.Token, y_ Value) bool</a>

```
searchKey: constant.Compare
tags: [method]
```

```Go
func Compare(x_ Value, op token.Token, y_ Value) bool
```

Compare returns the result of the comparison x op y. The comparison must be defined for the operands. If one of the operands is Unknown, the result is false. 

### <a id="Float32Val" href="#Float32Val">func Float32Val(x Value) (float32, bool)</a>

```
searchKey: constant.Float32Val
tags: [method]
```

```Go
func Float32Val(x Value) (float32, bool)
```

Float32Val is like Float64Val but for float32 instead of float64. 

### <a id="Float64Val" href="#Float64Val">func Float64Val(x Value) (float64, bool)</a>

```
searchKey: constant.Float64Val
tags: [method]
```

```Go
func Float64Val(x Value) (float64, bool)
```

Float64Val returns the nearest Go float64 value of x and whether the result is exact; x must be numeric or an Unknown, but not Complex. For values too small (too close to 0) to represent as float64, Float64Val silently underflows to 0. The result sign always matches the sign of x, even for 0. If x is Unknown, the result is (0, false). 

### <a id="Int64Val" href="#Int64Val">func Int64Val(x Value) (int64, bool)</a>

```
searchKey: constant.Int64Val
tags: [method]
```

```Go
func Int64Val(x Value) (int64, bool)
```

Int64Val returns the Go int64 value of x and whether the result is exact; x must be an Int or an Unknown. If the result is not exact, its value is undefined. If x is Unknown, the result is (0, false). 

### <a id="Sign" href="#Sign">func Sign(x Value) int</a>

```
searchKey: constant.Sign
tags: [method]
```

```Go
func Sign(x Value) int
```

Sign returns -1, 0, or 1 depending on whether x < 0, x == 0, or x > 0; x must be numeric or Unknown. For complex values x, the sign is 0 if x == 0, otherwise it is != 0. If x is Unknown, the result is 1. 

### <a id="StringVal" href="#StringVal">func StringVal(x Value) string</a>

```
searchKey: constant.StringVal
tags: [method]
```

```Go
func StringVal(x Value) string
```

StringVal returns the Go string value of x, which must be a String or an Unknown. If x is Unknown, the result is "". 

### <a id="TestBitLen" href="#TestBitLen">func TestBitLen(t *testing.T)</a>

```
searchKey: constant.TestBitLen
tags: [method private test]
```

```Go
func TestBitLen(t *testing.T)
```

### <a id="TestBytes" href="#TestBytes">func TestBytes(t *testing.T)</a>

```
searchKey: constant.TestBytes
tags: [method private test]
```

```Go
func TestBytes(t *testing.T)
```

### <a id="TestFractions" href="#TestFractions">func TestFractions(t *testing.T)</a>

```
searchKey: constant.TestFractions
tags: [method private test]
```

```Go
func TestFractions(t *testing.T)
```

### <a id="TestMake" href="#TestMake">func TestMake(t *testing.T)</a>

```
searchKey: constant.TestMake
tags: [method private test]
```

```Go
func TestMake(t *testing.T)
```

### <a id="TestMakeFloat64" href="#TestMakeFloat64">func TestMakeFloat64(t *testing.T)</a>

```
searchKey: constant.TestMakeFloat64
tags: [method private test]
```

```Go
func TestMakeFloat64(t *testing.T)
```

### <a id="TestNumbers" href="#TestNumbers">func TestNumbers(t *testing.T)</a>

```
searchKey: constant.TestNumbers
tags: [method private test]
```

```Go
func TestNumbers(t *testing.T)
```

TestNumbers verifies that differently written literals representing the same number do have the same value. 

### <a id="TestOps" href="#TestOps">func TestOps(t *testing.T)</a>

```
searchKey: constant.TestOps
tags: [method private test]
```

```Go
func TestOps(t *testing.T)
```

### <a id="TestString" href="#TestString">func TestString(t *testing.T)</a>

```
searchKey: constant.TestString
tags: [method private test]
```

```Go
func TestString(t *testing.T)
```

### <a id="TestUnknown" href="#TestUnknown">func TestUnknown(t *testing.T)</a>

```
searchKey: constant.TestUnknown
tags: [method private test]
```

```Go
func TestUnknown(t *testing.T)
```

### <a id="Uint64Val" href="#Uint64Val">func Uint64Val(x Value) (uint64, bool)</a>

```
searchKey: constant.Uint64Val
tags: [method]
```

```Go
func Uint64Val(x Value) (uint64, bool)
```

Uint64Val returns the Go uint64 value of x and whether the result is exact; x must be an Int or an Unknown. If the result is not exact, its value is undefined. If x is Unknown, the result is (0, false). 

### <a id="Val" href="#Val">func Val(x Value) interface{}</a>

```
searchKey: constant.Val
tags: [method]
```

```Go
func Val(x Value) interface{}
```

Val returns the underlying value for a given constant. Since it returns an interface, it is up to the caller to type assert the result to the expected type. The possible dynamic return types are: 

```
x Kind             type of result
-----------------------------------------
Bool               bool
String             string
Int                int64 or *big.Int
Float              *big.Float or *big.Rat
everything else    nil

```
### <a id="cmpZero" href="#cmpZero">func cmpZero(x int, op token.Token) bool</a>

```
searchKey: constant.cmpZero
tags: [method private]
```

```Go
func cmpZero(x int, op token.Token) bool
```

### <a id="eql" href="#eql">func eql(x, y Value) bool</a>

```
searchKey: constant.eql
tags: [method private]
```

```Go
func eql(x, y Value) bool
```

### <a id="is32bit" href="#is32bit">func is32bit(x int64) bool</a>

```
searchKey: constant.is32bit
tags: [method private]
```

```Go
func is32bit(x int64) bool
```

is32bit reports whether x can be represented using 32 bits. 

### <a id="is63bit" href="#is63bit">func is63bit(x int64) bool</a>

```
searchKey: constant.is63bit
tags: [method private]
```

```Go
func is63bit(x int64) bool
```

is63bit reports whether x can be represented using 63 bits. 

### <a id="newFloat" href="#newFloat">func newFloat() *big.Float</a>

```
searchKey: constant.newFloat
tags: [function private]
```

```Go
func newFloat() *big.Float
```

### <a id="newInt" href="#newInt">func newInt() *big.Int</a>

```
searchKey: constant.newInt
tags: [function private]
```

```Go
func newInt() *big.Int
```

### <a id="newRat" href="#newRat">func newRat() *big.Rat</a>

```
searchKey: constant.newRat
tags: [function private]
```

```Go
func newRat() *big.Rat
```

### <a id="ord" href="#ord">func ord(x Value) int</a>

```
searchKey: constant.ord
tags: [method private]
```

```Go
func ord(x Value) int
```

### <a id="panicHandler" href="#panicHandler">func panicHandler(v *Value)</a>

```
searchKey: constant.panicHandler
tags: [method private]
```

```Go
func panicHandler(v *Value)
```

### <a id="reverse" href="#reverse">func reverse(x []string) []string</a>

```
searchKey: constant.reverse
tags: [method private]
```

```Go
func reverse(x []string) []string
```

reverse reverses x in place and returns it. 

### <a id="smallFloat" href="#smallFloat">func smallFloat(x *big.Float) bool</a>

```
searchKey: constant.smallFloat
tags: [method private]
```

```Go
func smallFloat(x *big.Float) bool
```

smallFloat reports whether x would lead to "reasonably"-sized fraction if converted to a *big.Rat. 

### <a id="smallFloat64" href="#smallFloat64">func smallFloat64(x float64) bool</a>

```
searchKey: constant.smallFloat64
tags: [method private]
```

```Go
func smallFloat64(x float64) bool
```

smallFloat64 reports whether x would lead to "reasonably"-sized fraction if converted to a *big.Rat. 

### <a id="smallInt" href="#smallInt">func smallInt(x *big.Int) bool</a>

```
searchKey: constant.smallInt
tags: [method private]
```

```Go
func smallInt(x *big.Int) bool
```

smallInt reports whether x would lead to "reasonably"-sized fraction if converted to a *big.Rat. 

### <a id="testNumbers" href="#testNumbers">func testNumbers(t *testing.T, kind token.Token, tests []string)</a>

```
searchKey: constant.testNumbers
tags: [method private]
```

```Go
func testNumbers(t *testing.T, kind token.Token, tests []string)
```

