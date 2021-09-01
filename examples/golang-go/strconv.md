# Package strconv

Package strconv implements conversions to and from string representations of basic data types. 

### hdr-Numeric_ConversionsNumeric Conversions
The most common numeric conversions are Atoi (string to int) and Itoa (int to string). 

```
i, err := strconv.Atoi("-42")
s := strconv.Itoa(-42)

```
These assume decimal and the Go int type. 

ParseBool, ParseFloat, ParseInt, and ParseUint convert strings to values: 

```
b, err := strconv.ParseBool("true")
f, err := strconv.ParseFloat("3.1415", 64)
i, err := strconv.ParseInt("-42", 10, 64)
u, err := strconv.ParseUint("42", 10, 64)

```
The parse functions return the widest type (float64, int64, and uint64), but if the size argument specifies a narrower width the result can be converted to that narrower type without data loss: 

```
s := "2147483647" // biggest int32
i64, err := strconv.ParseInt(s, 10, 32)
...
i := int32(i64)

```
FormatBool, FormatFloat, FormatInt, and FormatUint convert values to strings: 

```
s := strconv.FormatBool(true)
s := strconv.FormatFloat(3.1415, 'E', -1, 64)
s := strconv.FormatInt(-42, 16)
s := strconv.FormatUint(42, 16)

```
AppendBool, AppendFloat, AppendInt, and AppendUint are similar but append the formatted value to a destination slice. 

### hdr-String_ConversionsString Conversions
Quote and QuoteToASCII convert strings to quoted Go string literals. The latter guarantees that the result is an ASCII string, by escaping any non-ASCII Unicode with \u: 

```
q := strconv.Quote("Hello, 世界")
q := strconv.QuoteToASCII("Hello, 世界")

```
QuoteRune and QuoteRuneToASCII are similar but accept runes and return quoted Go rune literals. 

Unquote and UnquoteChar unquote Go string and rune literals. 

## Index

* [Constants](#const)
    * [const IntSize](#IntSize)
    * [const detailedPowersOfTenMaxExp10](#detailedPowersOfTenMaxExp10)
    * [const detailedPowersOfTenMinExp10](#detailedPowersOfTenMinExp10)
    * [const digits](#digits)
    * [const fastSmalls](#fastSmalls)
    * [const fnParseComplex](#fnParseComplex)
    * [const fnParseFloat](#fnParseFloat)
    * [const host32bit](#host32bit)
    * [const intSize](#intSize)
    * [const lowerhex](#lowerhex)
    * [const maxShift](#maxShift)
    * [const maxUint64](#maxUint64)
    * [const nSmalls](#nSmalls)
    * [const smallsString](#smallsString)
    * [const uintSize](#uintSize)
    * [const upperhex](#upperhex)
* [Variables](#var)
    * [var BaseError](#BaseError)
    * [var BitSizeError](#BitSizeError)
    * [var ErrRange](#ErrRange)
    * [var ErrSyntax](#ErrSyntax)
    * [var detailedPowersOfTen](#detailedPowersOfTen)
    * [var float32info](#float32info)
    * [var float32pow10](#float32pow10)
    * [var float64info](#float64info)
    * [var float64pow10](#float64pow10)
    * [var isGraphic](#isGraphic)
    * [var isNotPrint16](#isNotPrint16)
    * [var isNotPrint32](#isNotPrint32)
    * [var isPrint16](#isPrint16)
    * [var isPrint32](#isPrint32)
    * [var leftcheats](#leftcheats)
    * [var optimize](#optimize)
    * [var powtab](#powtab)
    * [var uint64pow10](#uint64pow10)
* [Types](#type)
    * [type NumError struct](#NumError)
        * [func baseError(fn, str string, base int) *NumError](#baseError)
        * [func bitSizeError(fn, str string, bitSize int) *NumError](#bitSizeError)
        * [func rangeError(fn, str string) *NumError](#rangeError)
        * [func syntaxError(fn, str string) *NumError](#syntaxError)
        * [func (e *NumError) Error() string](#NumError.Error)
        * [func (e *NumError) Unwrap() error](#NumError.Unwrap)
    * [type decimal struct](#decimal)
        * [func NewDecimal(i uint64) *decimal](#NewDecimal)
        * [func (a *decimal) Assign(v uint64)](#decimal.Assign)
        * [func (a *decimal) Round(nd int)](#decimal.Round)
        * [func (a *decimal) RoundDown(nd int)](#decimal.RoundDown)
        * [func (a *decimal) RoundUp(nd int)](#decimal.RoundUp)
        * [func (a *decimal) RoundedInteger() uint64](#decimal.RoundedInteger)
        * [func (a *decimal) Shift(k int)](#decimal.Shift)
        * [func (a *decimal) String() string](#decimal.String)
        * [func (d *decimal) floatBits(flt *floatInfo) (b uint64, overflow bool)](#decimal.floatBits)
        * [func (b *decimal) set(s string) (ok bool)](#decimal.set)
    * [type decimalSlice struct](#decimalSlice)
    * [type floatInfo struct](#floatInfo)
    * [type leftCheat struct](#leftCheat)
* [Functions](#func)
    * [func AppendBool(dst []byte, b bool) []byte](#AppendBool)
    * [func AppendFloat(dst []byte, f float64, fmt byte, prec, bitSize int) []byte](#AppendFloat)
    * [func AppendInt(dst []byte, i int64, base int) []byte](#AppendInt)
    * [func AppendQuote(dst []byte, s string) []byte](#AppendQuote)
    * [func AppendQuoteRune(dst []byte, r rune) []byte](#AppendQuoteRune)
    * [func AppendQuoteRuneToASCII(dst []byte, r rune) []byte](#AppendQuoteRuneToASCII)
    * [func AppendQuoteRuneToGraphic(dst []byte, r rune) []byte](#AppendQuoteRuneToGraphic)
    * [func AppendQuoteToASCII(dst []byte, s string) []byte](#AppendQuoteToASCII)
    * [func AppendQuoteToGraphic(dst []byte, s string) []byte](#AppendQuoteToGraphic)
    * [func AppendUint(dst []byte, i uint64, base int) []byte](#AppendUint)
    * [func Atoi(s string) (int, error)](#Atoi)
    * [func CanBackquote(s string) bool](#CanBackquote)
    * [func FormatBool(b bool) string](#FormatBool)
    * [func FormatComplex(c complex128, fmt byte, prec, bitSize int) string](#FormatComplex)
    * [func FormatFloat(f float64, fmt byte, prec, bitSize int) string](#FormatFloat)
    * [func FormatInt(i int64, base int) string](#FormatInt)
    * [func FormatUint(i uint64, base int) string](#FormatUint)
    * [func IsGraphic(r rune) bool](#IsGraphic)
    * [func IsPrint(r rune) bool](#IsPrint)
    * [func Itoa(i int) string](#Itoa)
    * [func MulByLog10Log2(x int) int](#MulByLog10Log2)
    * [func MulByLog2Log10(x int) int](#MulByLog2Log10)
    * [func ParseBool(str string) (bool, error)](#ParseBool)
    * [func ParseComplex(s string, bitSize int) (complex128, error)](#ParseComplex)
    * [func ParseFloat(s string, bitSize int) (float64, error)](#ParseFloat)
    * [func ParseFloatPrefix(s string, bitSize int) (float64, int, error)](#ParseFloatPrefix)
    * [func ParseInt(s string, base int, bitSize int) (i int64, err error)](#ParseInt)
    * [func ParseUint(s string, base int, bitSize int) (uint64, error)](#ParseUint)
    * [func Quote(s string) string](#Quote)
    * [func QuoteRune(r rune) string](#QuoteRune)
    * [func QuoteRuneToASCII(r rune) string](#QuoteRuneToASCII)
    * [func QuoteRuneToGraphic(r rune) string](#QuoteRuneToGraphic)
    * [func QuoteToASCII(s string) string](#QuoteToASCII)
    * [func QuoteToGraphic(s string) string](#QuoteToGraphic)
    * [func QuotedPrefix(s string) (string, error)](#QuotedPrefix)
    * [func SetOptimize(b bool) bool](#SetOptimize)
    * [func Unquote(s string) (string, error)](#Unquote)
    * [func UnquoteChar(s string, quote byte) (value rune, multibyte bool, tail string, err error)](#UnquoteChar)
    * [func appendEscapedRune(buf []byte, r rune, quote byte, ASCIIonly, graphicOnly bool) []byte](#appendEscapedRune)
    * [func appendQuotedRuneWith(buf []byte, r rune, quote byte, ASCIIonly, graphicOnly bool) []byte](#appendQuotedRuneWith)
    * [func appendQuotedWith(buf []byte, s string, quote byte, ASCIIonly, graphicOnly bool) []byte](#appendQuotedWith)
    * [func atof32(s string) (f float32, n int, err error)](#atof32)
    * [func atof32exact(mantissa uint64, exp int, neg bool) (f float32, ok bool)](#atof32exact)
    * [func atof64(s string) (f float64, n int, err error)](#atof64)
    * [func atof64exact(mantissa uint64, exp int, neg bool) (f float64, ok bool)](#atof64exact)
    * [func atofHex(s string, flt *floatInfo, mantissa uint64, exp int, neg, trunc bool) (float64, error)](#atofHex)
    * [func bigFtoa(dst []byte, prec int, fmt byte, neg bool, mant uint64, exp int, flt *floatInfo) []byte](#bigFtoa)
    * [func bsearch16(a []uint16, x uint16) int](#bsearch16)
    * [func bsearch32(a []uint32, x uint32) int](#bsearch32)
    * [func commonPrefixLenIgnoreCase(s, prefix string) int](#commonPrefixLenIgnoreCase)
    * [func computeBounds(mant uint64, exp int, flt *floatInfo) (lower, central, upper uint64, e2 int)](#computeBounds)
    * [func contains(s string, c byte) bool](#contains)
    * [func convErr(err error, s string) (syntax, range_ error)](#convErr)
    * [func digitZero(dst []byte) int](#digitZero)
    * [func divisibleByPower5(m uint64, k int) bool](#divisibleByPower5)
    * [func divmod1e9(x uint64) (uint32, uint32)](#divmod1e9)
    * [func eiselLemire32(man uint64, exp10 int, neg bool) (f float32, ok bool)](#eiselLemire32)
    * [func eiselLemire64(man uint64, exp10 int, neg bool) (f float64, ok bool)](#eiselLemire64)
    * [func fmtB(dst []byte, neg bool, mant uint64, exp int, flt *floatInfo) []byte](#fmtB)
    * [func fmtE(dst []byte, neg bool, d decimalSlice, prec int, fmt byte) []byte](#fmtE)
    * [func fmtF(dst []byte, neg bool, d decimalSlice, prec int) []byte](#fmtF)
    * [func fmtX(dst []byte, prec int, fmt byte, neg bool, mant uint64, exp int, flt *floatInfo) []byte](#fmtX)
    * [func formatBits(dst []byte, u uint64, base int, neg, append_ bool) (d []byte, s string)](#formatBits)
    * [func formatDecimal(d *decimalSlice, m uint64, trunc bool, roundUp bool, prec int)](#formatDecimal)
    * [func formatDigits(dst []byte, shortest bool, neg bool, digs decimalSlice, prec int, fmt byte) []byte](#formatDigits)
    * [func genericFtoa(dst []byte, val float64, fmt byte, prec, bitSize int) []byte](#genericFtoa)
    * [func index(s string, c byte) int](#index)
    * [func isInGraphicList(r rune) bool](#isInGraphicList)
    * [func isPowerOfTwo(x int) bool](#isPowerOfTwo)
    * [func leftShift(a *decimal, k uint)](#leftShift)
    * [func lower(c byte) byte](#lower)
    * [func max(a, b int) int](#max)
    * [func min(a, b int) int](#min)
    * [func mulByLog10Log2(x int) int](#mulByLog10Log2)
    * [func mulByLog2Log10(x int) int](#mulByLog2Log10)
    * [func mult128bitPow10(m uint64, e2, q int) (resM uint64, resE int, exact bool)](#mult128bitPow10)
    * [func mult64bitPow10(m uint32, e2, q int) (resM uint32, resE int, exact bool)](#mult64bitPow10)
    * [func parseFloatPrefix(s string, bitSize int) (float64, int, error)](#parseFloatPrefix)
    * [func prefixIsLessThan(b []byte, s string) bool](#prefixIsLessThan)
    * [func quoteRuneWith(r rune, quote byte, ASCIIonly, graphicOnly bool) string](#quoteRuneWith)
    * [func quoteWith(s string, quote byte, ASCIIonly, graphicOnly bool) string](#quoteWith)
    * [func readFloat(s string) (mantissa uint64, exp int, neg, trunc, hex bool, i int, ok bool)](#readFloat)
    * [func rightShift(a *decimal, k uint)](#rightShift)
    * [func roundShortest(d *decimal, mant uint64, exp int, flt *floatInfo)](#roundShortest)
    * [func ryuDigits(d *decimalSlice, lower, central, upper uint64,...](#ryuDigits)
    * [func ryuDigits32(d *decimalSlice, lower, central, upper uint32,...](#ryuDigits32)
    * [func ryuFtoaFixed32(d *decimalSlice, mant uint32, exp int, prec int)](#ryuFtoaFixed32)
    * [func ryuFtoaFixed64(d *decimalSlice, mant uint64, exp int, prec int)](#ryuFtoaFixed64)
    * [func ryuFtoaShortest(d *decimalSlice, mant uint64, exp int, flt *floatInfo)](#ryuFtoaShortest)
    * [func shouldRoundUp(a *decimal, nd int) bool](#shouldRoundUp)
    * [func small(i int) string](#small)
    * [func special(s string) (f float64, n int, ok bool)](#special)
    * [func trim(a *decimal)](#trim)
    * [func underscoreOK(s string) bool](#underscoreOK)
    * [func unhex(b byte) (v rune, ok bool)](#unhex)
    * [func unquote(in string, unescape bool) (out, rem string, err error)](#unquote)


## <a id="const" href="#const">Constants</a>

### <a id="IntSize" href="#IntSize">const IntSize</a>

```
searchKey: strconv.IntSize
tags: [constant number]
```

```Go
const IntSize = intSize
```

IntSize is the size in bits of an int or uint value. 

### <a id="detailedPowersOfTenMaxExp10" href="#detailedPowersOfTenMaxExp10">const detailedPowersOfTenMaxExp10</a>

```
searchKey: strconv.detailedPowersOfTenMaxExp10
tags: [constant number private]
```

```Go
const detailedPowersOfTenMaxExp10 = +347
```

detailedPowersOfTen{Min,Max}Exp10 is the power of 10 represented by the first and last rows of detailedPowersOfTen. Both bounds are inclusive. 

### <a id="detailedPowersOfTenMinExp10" href="#detailedPowersOfTenMinExp10">const detailedPowersOfTenMinExp10</a>

```
searchKey: strconv.detailedPowersOfTenMinExp10
tags: [constant number private]
```

```Go
const detailedPowersOfTenMinExp10 = -348
```

detailedPowersOfTen{Min,Max}Exp10 is the power of 10 represented by the first and last rows of detailedPowersOfTen. Both bounds are inclusive. 

### <a id="digits" href="#digits">const digits</a>

```
searchKey: strconv.digits
tags: [constant string private]
```

```Go
const digits = "0123456789abcdefghijklmnopqrstuvwxyz"
```

### <a id="fastSmalls" href="#fastSmalls">const fastSmalls</a>

```
searchKey: strconv.fastSmalls
tags: [constant boolean private]
```

```Go
const fastSmalls = true // enable fast path for small integers

```

### <a id="fnParseComplex" href="#fnParseComplex">const fnParseComplex</a>

```
searchKey: strconv.fnParseComplex
tags: [constant string private]
```

```Go
const fnParseComplex = "ParseComplex"
```

### <a id="fnParseFloat" href="#fnParseFloat">const fnParseFloat</a>

```
searchKey: strconv.fnParseFloat
tags: [constant string private]
```

```Go
const fnParseFloat = "ParseFloat"
```

### <a id="host32bit" href="#host32bit">const host32bit</a>

```
searchKey: strconv.host32bit
tags: [constant boolean private]
```

```Go
const host32bit = ^uint(0)>>32 == 0
```

### <a id="intSize" href="#intSize">const intSize</a>

```
searchKey: strconv.intSize
tags: [constant number private]
```

```Go
const intSize = 32 << (^uint(0) >> 63)
```

### <a id="lowerhex" href="#lowerhex">const lowerhex</a>

```
searchKey: strconv.lowerhex
tags: [constant string private]
```

```Go
const lowerhex = "0123456789abcdef"
```

### <a id="maxShift" href="#maxShift">const maxShift</a>

```
searchKey: strconv.maxShift
tags: [constant number private]
```

```Go
const maxShift = uintSize - 4
```

### <a id="maxUint64" href="#maxUint64">const maxUint64</a>

```
searchKey: strconv.maxUint64
tags: [constant number private]
```

```Go
const maxUint64 = 1<<64 - 1
```

### <a id="nSmalls" href="#nSmalls">const nSmalls</a>

```
searchKey: strconv.nSmalls
tags: [constant number private]
```

```Go
const nSmalls = 100
```

### <a id="smallsString" href="#smallsString">const smallsString</a>

```
searchKey: strconv.smallsString
tags: [constant string private]
```

```Go
const smallsString = ...
```

### <a id="uintSize" href="#uintSize">const uintSize</a>

```
searchKey: strconv.uintSize
tags: [constant number private]
```

```Go
const uintSize = 32 << (^uint(0) >> 63)
```

Maximum shift that we can do in one pass without overflow. A uint has 32 or 64 bits, and we have to be able to accommodate 9<<k. 

### <a id="upperhex" href="#upperhex">const upperhex</a>

```
searchKey: strconv.upperhex
tags: [constant string private]
```

```Go
const upperhex = "0123456789ABCDEF"
```

## <a id="var" href="#var">Variables</a>

### <a id="BaseError" href="#BaseError">var BaseError</a>

```
searchKey: strconv.BaseError
tags: [variable function private]
```

```Go
var BaseError = baseError
```

### <a id="BitSizeError" href="#BitSizeError">var BitSizeError</a>

```
searchKey: strconv.BitSizeError
tags: [variable function private]
```

```Go
var BitSizeError = bitSizeError
```

### <a id="ErrRange" href="#ErrRange">var ErrRange</a>

```
searchKey: strconv.ErrRange
tags: [variable interface]
```

```Go
var ErrRange = errors.New("value out of range")
```

ErrRange indicates that a value is out of range for the target type. 

### <a id="ErrSyntax" href="#ErrSyntax">var ErrSyntax</a>

```
searchKey: strconv.ErrSyntax
tags: [variable interface]
```

```Go
var ErrSyntax = errors.New("invalid syntax")
```

ErrSyntax indicates that a value does not have the right syntax for the target type. 

### <a id="detailedPowersOfTen" href="#detailedPowersOfTen">var detailedPowersOfTen</a>

```
searchKey: strconv.detailedPowersOfTen
tags: [variable array array number private]
```

```Go
var detailedPowersOfTen = ...
```

detailedPowersOfTen contains 128-bit mantissa approximations (rounded down) to the powers of 10. For example: 

```
- 1e43 ≈ (0xE596B7B0_C643C719                   * (2 ** 79))
- 1e43 = (0xE596B7B0_C643C719_6D9CCD05_D0000000 * (2 ** 15))

```
The mantissas are explicitly listed. The exponents are implied by a linear expression with slope 217706.0/65536.0 ≈ log(10)/log(2). 

The table was generated by [https://github.com/google/wuffs/blob/ba3818cb6b473a2ed0b38ecfc07dbbd3a97e8ae7/script/print-mpb-powers-of-10.go](https://github.com/google/wuffs/blob/ba3818cb6b473a2ed0b38ecfc07dbbd3a97e8ae7/script/print-mpb-powers-of-10.go) 

### <a id="float32info" href="#float32info">var float32info</a>

```
searchKey: strconv.float32info
tags: [variable struct private]
```

```Go
var float32info = floatInfo{23, 8, -127}
```

### <a id="float32pow10" href="#float32pow10">var float32pow10</a>

```
searchKey: strconv.float32pow10
tags: [variable array number private]
```

```Go
var float32pow10 = []float32{1e0, 1e1, 1e2, 1e3, 1e4, 1e5, 1e6, 1e7, 1e8, 1e9, 1e10}
```

### <a id="float64info" href="#float64info">var float64info</a>

```
searchKey: strconv.float64info
tags: [variable struct private]
```

```Go
var float64info = floatInfo{52, 11, -1023}
```

### <a id="float64pow10" href="#float64pow10">var float64pow10</a>

```
searchKey: strconv.float64pow10
tags: [variable array number private]
```

```Go
var float64pow10 = ...
```

Exact powers of 10. 

### <a id="isGraphic" href="#isGraphic">var isGraphic</a>

```
searchKey: strconv.isGraphic
tags: [variable array number private]
```

```Go
var isGraphic = ...
```

isGraphic lists the graphic runes not matched by IsPrint. 

### <a id="isNotPrint16" href="#isNotPrint16">var isNotPrint16</a>

```
searchKey: strconv.isNotPrint16
tags: [variable array number private]
```

```Go
var isNotPrint16 = ...
```

### <a id="isNotPrint32" href="#isNotPrint32">var isNotPrint32</a>

```
searchKey: strconv.isNotPrint32
tags: [variable array number private]
```

```Go
var isNotPrint32 = ...
```

### <a id="isPrint16" href="#isPrint16">var isPrint16</a>

```
searchKey: strconv.isPrint16
tags: [variable array number private]
```

```Go
var isPrint16 = ...
```

### <a id="isPrint32" href="#isPrint32">var isPrint32</a>

```
searchKey: strconv.isPrint32
tags: [variable array number private]
```

```Go
var isPrint32 = ...
```

### <a id="leftcheats" href="#leftcheats">var leftcheats</a>

```
searchKey: strconv.leftcheats
tags: [variable array struct private]
```

```Go
var leftcheats = ...
```

### <a id="optimize" href="#optimize">var optimize</a>

```
searchKey: strconv.optimize
tags: [variable boolean private]
```

```Go
var optimize = true // set to false to force slow-path conversions for testing

```

### <a id="powtab" href="#powtab">var powtab</a>

```
searchKey: strconv.powtab
tags: [variable array number private]
```

```Go
var powtab = []int{1, 3, 6, 9, 13, 16, 19, 23, 26}
```

decimal power of ten to binary power of two. 

### <a id="uint64pow10" href="#uint64pow10">var uint64pow10</a>

```
searchKey: strconv.uint64pow10
tags: [variable array number private]
```

```Go
var uint64pow10 = ...
```

## <a id="type" href="#type">Types</a>

### <a id="NumError" href="#NumError">type NumError struct</a>

```
searchKey: strconv.NumError
tags: [struct]
```

```Go
type NumError struct {
	Func string // the failing function (ParseBool, ParseInt, ParseUint, ParseFloat, ParseComplex)
	Num  string // the input
	Err  error  // the reason the conversion failed (e.g. ErrRange, ErrSyntax, etc.)
}
```

A NumError records a failed conversion. 

#### <a id="baseError" href="#baseError">func baseError(fn, str string, base int) *NumError</a>

```
searchKey: strconv.baseError
tags: [function private]
```

```Go
func baseError(fn, str string, base int) *NumError
```

#### <a id="bitSizeError" href="#bitSizeError">func bitSizeError(fn, str string, bitSize int) *NumError</a>

```
searchKey: strconv.bitSizeError
tags: [function private]
```

```Go
func bitSizeError(fn, str string, bitSize int) *NumError
```

#### <a id="rangeError" href="#rangeError">func rangeError(fn, str string) *NumError</a>

```
searchKey: strconv.rangeError
tags: [function private]
```

```Go
func rangeError(fn, str string) *NumError
```

#### <a id="syntaxError" href="#syntaxError">func syntaxError(fn, str string) *NumError</a>

```
searchKey: strconv.syntaxError
tags: [function private]
```

```Go
func syntaxError(fn, str string) *NumError
```

#### <a id="NumError.Error" href="#NumError.Error">func (e *NumError) Error() string</a>

```
searchKey: strconv.NumError.Error
tags: [method]
```

```Go
func (e *NumError) Error() string
```

#### <a id="NumError.Unwrap" href="#NumError.Unwrap">func (e *NumError) Unwrap() error</a>

```
searchKey: strconv.NumError.Unwrap
tags: [method]
```

```Go
func (e *NumError) Unwrap() error
```

### <a id="decimal" href="#decimal">type decimal struct</a>

```
searchKey: strconv.decimal
tags: [struct private]
```

```Go
type decimal struct {
	d     [800]byte // digits, big-endian representation
	nd    int       // number of digits used
	dp    int       // decimal point
	neg   bool      // negative flag
	trunc bool      // discarded nonzero digits beyond d[:nd]
}
```

#### <a id="NewDecimal" href="#NewDecimal">func NewDecimal(i uint64) *decimal</a>

```
searchKey: strconv.NewDecimal
tags: [function private]
```

```Go
func NewDecimal(i uint64) *decimal
```

#### <a id="decimal.Assign" href="#decimal.Assign">func (a *decimal) Assign(v uint64)</a>

```
searchKey: strconv.decimal.Assign
tags: [method private]
```

```Go
func (a *decimal) Assign(v uint64)
```

Assign v to a. 

#### <a id="decimal.Round" href="#decimal.Round">func (a *decimal) Round(nd int)</a>

```
searchKey: strconv.decimal.Round
tags: [method private]
```

```Go
func (a *decimal) Round(nd int)
```

Round a to nd digits (or fewer). If nd is zero, it means we're rounding just to the left of the digits, as in 0.09 -> 0.1. 

#### <a id="decimal.RoundDown" href="#decimal.RoundDown">func (a *decimal) RoundDown(nd int)</a>

```
searchKey: strconv.decimal.RoundDown
tags: [method private]
```

```Go
func (a *decimal) RoundDown(nd int)
```

Round a down to nd digits (or fewer). 

#### <a id="decimal.RoundUp" href="#decimal.RoundUp">func (a *decimal) RoundUp(nd int)</a>

```
searchKey: strconv.decimal.RoundUp
tags: [method private]
```

```Go
func (a *decimal) RoundUp(nd int)
```

Round a up to nd digits (or fewer). 

#### <a id="decimal.RoundedInteger" href="#decimal.RoundedInteger">func (a *decimal) RoundedInteger() uint64</a>

```
searchKey: strconv.decimal.RoundedInteger
tags: [method private]
```

```Go
func (a *decimal) RoundedInteger() uint64
```

Extract integer part, rounded appropriately. No guarantees about overflow. 

#### <a id="decimal.Shift" href="#decimal.Shift">func (a *decimal) Shift(k int)</a>

```
searchKey: strconv.decimal.Shift
tags: [method private]
```

```Go
func (a *decimal) Shift(k int)
```

Binary shift left (k > 0) or right (k < 0). 

#### <a id="decimal.String" href="#decimal.String">func (a *decimal) String() string</a>

```
searchKey: strconv.decimal.String
tags: [method private]
```

```Go
func (a *decimal) String() string
```

#### <a id="decimal.floatBits" href="#decimal.floatBits">func (d *decimal) floatBits(flt *floatInfo) (b uint64, overflow bool)</a>

```
searchKey: strconv.decimal.floatBits
tags: [method private]
```

```Go
func (d *decimal) floatBits(flt *floatInfo) (b uint64, overflow bool)
```

#### <a id="decimal.set" href="#decimal.set">func (b *decimal) set(s string) (ok bool)</a>

```
searchKey: strconv.decimal.set
tags: [method private]
```

```Go
func (b *decimal) set(s string) (ok bool)
```

### <a id="decimalSlice" href="#decimalSlice">type decimalSlice struct</a>

```
searchKey: strconv.decimalSlice
tags: [struct private]
```

```Go
type decimalSlice struct {
	d      []byte
	nd, dp int
	neg    bool
}
```

### <a id="floatInfo" href="#floatInfo">type floatInfo struct</a>

```
searchKey: strconv.floatInfo
tags: [struct private]
```

```Go
type floatInfo struct {
	mantbits uint
	expbits  uint
	bias     int
}
```

TODO: move elsewhere? 

### <a id="leftCheat" href="#leftCheat">type leftCheat struct</a>

```
searchKey: strconv.leftCheat
tags: [struct private]
```

```Go
type leftCheat struct {
	delta  int    // number of new digits
	cutoff string // minus one digit if original < a.
}
```

## <a id="func" href="#func">Functions</a>

### <a id="AppendBool" href="#AppendBool">func AppendBool(dst []byte, b bool) []byte</a>

```
searchKey: strconv.AppendBool
tags: [function]
```

```Go
func AppendBool(dst []byte, b bool) []byte
```

AppendBool appends "true" or "false", according to the value of b, to dst and returns the extended buffer. 

### <a id="AppendFloat" href="#AppendFloat">func AppendFloat(dst []byte, f float64, fmt byte, prec, bitSize int) []byte</a>

```
searchKey: strconv.AppendFloat
tags: [function]
```

```Go
func AppendFloat(dst []byte, f float64, fmt byte, prec, bitSize int) []byte
```

AppendFloat appends the string form of the floating-point number f, as generated by FormatFloat, to dst and returns the extended buffer. 

### <a id="AppendInt" href="#AppendInt">func AppendInt(dst []byte, i int64, base int) []byte</a>

```
searchKey: strconv.AppendInt
tags: [function]
```

```Go
func AppendInt(dst []byte, i int64, base int) []byte
```

AppendInt appends the string form of the integer i, as generated by FormatInt, to dst and returns the extended buffer. 

### <a id="AppendQuote" href="#AppendQuote">func AppendQuote(dst []byte, s string) []byte</a>

```
searchKey: strconv.AppendQuote
tags: [function]
```

```Go
func AppendQuote(dst []byte, s string) []byte
```

AppendQuote appends a double-quoted Go string literal representing s, as generated by Quote, to dst and returns the extended buffer. 

### <a id="AppendQuoteRune" href="#AppendQuoteRune">func AppendQuoteRune(dst []byte, r rune) []byte</a>

```
searchKey: strconv.AppendQuoteRune
tags: [function]
```

```Go
func AppendQuoteRune(dst []byte, r rune) []byte
```

AppendQuoteRune appends a single-quoted Go character literal representing the rune, as generated by QuoteRune, to dst and returns the extended buffer. 

### <a id="AppendQuoteRuneToASCII" href="#AppendQuoteRuneToASCII">func AppendQuoteRuneToASCII(dst []byte, r rune) []byte</a>

```
searchKey: strconv.AppendQuoteRuneToASCII
tags: [function]
```

```Go
func AppendQuoteRuneToASCII(dst []byte, r rune) []byte
```

AppendQuoteRuneToASCII appends a single-quoted Go character literal representing the rune, as generated by QuoteRuneToASCII, to dst and returns the extended buffer. 

### <a id="AppendQuoteRuneToGraphic" href="#AppendQuoteRuneToGraphic">func AppendQuoteRuneToGraphic(dst []byte, r rune) []byte</a>

```
searchKey: strconv.AppendQuoteRuneToGraphic
tags: [function]
```

```Go
func AppendQuoteRuneToGraphic(dst []byte, r rune) []byte
```

AppendQuoteRuneToGraphic appends a single-quoted Go character literal representing the rune, as generated by QuoteRuneToGraphic, to dst and returns the extended buffer. 

### <a id="AppendQuoteToASCII" href="#AppendQuoteToASCII">func AppendQuoteToASCII(dst []byte, s string) []byte</a>

```
searchKey: strconv.AppendQuoteToASCII
tags: [function]
```

```Go
func AppendQuoteToASCII(dst []byte, s string) []byte
```

AppendQuoteToASCII appends a double-quoted Go string literal representing s, as generated by QuoteToASCII, to dst and returns the extended buffer. 

### <a id="AppendQuoteToGraphic" href="#AppendQuoteToGraphic">func AppendQuoteToGraphic(dst []byte, s string) []byte</a>

```
searchKey: strconv.AppendQuoteToGraphic
tags: [function]
```

```Go
func AppendQuoteToGraphic(dst []byte, s string) []byte
```

AppendQuoteToGraphic appends a double-quoted Go string literal representing s, as generated by QuoteToGraphic, to dst and returns the extended buffer. 

### <a id="AppendUint" href="#AppendUint">func AppendUint(dst []byte, i uint64, base int) []byte</a>

```
searchKey: strconv.AppendUint
tags: [function]
```

```Go
func AppendUint(dst []byte, i uint64, base int) []byte
```

AppendUint appends the string form of the unsigned integer i, as generated by FormatUint, to dst and returns the extended buffer. 

### <a id="Atoi" href="#Atoi">func Atoi(s string) (int, error)</a>

```
searchKey: strconv.Atoi
tags: [function]
```

```Go
func Atoi(s string) (int, error)
```

Atoi is equivalent to ParseInt(s, 10, 0), converted to type int. 

### <a id="CanBackquote" href="#CanBackquote">func CanBackquote(s string) bool</a>

```
searchKey: strconv.CanBackquote
tags: [function]
```

```Go
func CanBackquote(s string) bool
```

CanBackquote reports whether the string s can be represented unchanged as a single-line backquoted string without control characters other than tab. 

### <a id="FormatBool" href="#FormatBool">func FormatBool(b bool) string</a>

```
searchKey: strconv.FormatBool
tags: [function]
```

```Go
func FormatBool(b bool) string
```

FormatBool returns "true" or "false" according to the value of b. 

### <a id="FormatComplex" href="#FormatComplex">func FormatComplex(c complex128, fmt byte, prec, bitSize int) string</a>

```
searchKey: strconv.FormatComplex
tags: [function]
```

```Go
func FormatComplex(c complex128, fmt byte, prec, bitSize int) string
```

FormatComplex converts the complex number c to a string of the form (a+bi) where a and b are the real and imaginary parts, formatted according to the format fmt and precision prec. 

The format fmt and precision prec have the same meaning as in FormatFloat. It rounds the result assuming that the original was obtained from a complex value of bitSize bits, which must be 64 for complex64 and 128 for complex128. 

### <a id="FormatFloat" href="#FormatFloat">func FormatFloat(f float64, fmt byte, prec, bitSize int) string</a>

```
searchKey: strconv.FormatFloat
tags: [function]
```

```Go
func FormatFloat(f float64, fmt byte, prec, bitSize int) string
```

FormatFloat converts the floating-point number f to a string, according to the format fmt and precision prec. It rounds the result assuming that the original was obtained from a floating-point value of bitSize bits (32 for float32, 64 for float64). 

The format fmt is one of 'b' (-ddddp±ddd, a binary exponent), 'e' (-d.dddde±dd, a decimal exponent), 'E' (-d.ddddE±dd, a decimal exponent), 'f' (-ddd.dddd, no exponent), 'g' ('e' for large exponents, 'f' otherwise), 'G' ('E' for large exponents, 'f' otherwise), 'x' (-0xd.ddddp±ddd, a hexadecimal fraction and binary exponent), or 'X' (-0Xd.ddddP±ddd, a hexadecimal fraction and binary exponent). 

The precision prec controls the number of digits (excluding the exponent) printed by the 'e', 'E', 'f', 'g', 'G', 'x', and 'X' formats. For 'e', 'E', 'f', 'x', and 'X', it is the number of digits after the decimal point. For 'g' and 'G' it is the maximum number of significant digits (trailing zeros are removed). The special precision -1 uses the smallest number of digits necessary such that ParseFloat will return f exactly. 

### <a id="FormatInt" href="#FormatInt">func FormatInt(i int64, base int) string</a>

```
searchKey: strconv.FormatInt
tags: [function]
```

```Go
func FormatInt(i int64, base int) string
```

FormatInt returns the string representation of i in the given base, for 2 <= base <= 36. The result uses the lower-case letters 'a' to 'z' for digit values >= 10. 

### <a id="FormatUint" href="#FormatUint">func FormatUint(i uint64, base int) string</a>

```
searchKey: strconv.FormatUint
tags: [function]
```

```Go
func FormatUint(i uint64, base int) string
```

FormatUint returns the string representation of i in the given base, for 2 <= base <= 36. The result uses the lower-case letters 'a' to 'z' for digit values >= 10. 

### <a id="IsGraphic" href="#IsGraphic">func IsGraphic(r rune) bool</a>

```
searchKey: strconv.IsGraphic
tags: [function]
```

```Go
func IsGraphic(r rune) bool
```

IsGraphic reports whether the rune is defined as a Graphic by Unicode. Such characters include letters, marks, numbers, punctuation, symbols, and spaces, from categories L, M, N, P, S, and Zs. 

### <a id="IsPrint" href="#IsPrint">func IsPrint(r rune) bool</a>

```
searchKey: strconv.IsPrint
tags: [function]
```

```Go
func IsPrint(r rune) bool
```

IsPrint reports whether the rune is defined as printable by Go, with the same definition as unicode.IsPrint: letters, numbers, punctuation, symbols and ASCII space. 

### <a id="Itoa" href="#Itoa">func Itoa(i int) string</a>

```
searchKey: strconv.Itoa
tags: [function]
```

```Go
func Itoa(i int) string
```

Itoa is equivalent to FormatInt(int64(i), 10). 

### <a id="MulByLog10Log2" href="#MulByLog10Log2">func MulByLog10Log2(x int) int</a>

```
searchKey: strconv.MulByLog10Log2
tags: [function private]
```

```Go
func MulByLog10Log2(x int) int
```

### <a id="MulByLog2Log10" href="#MulByLog2Log10">func MulByLog2Log10(x int) int</a>

```
searchKey: strconv.MulByLog2Log10
tags: [function private]
```

```Go
func MulByLog2Log10(x int) int
```

### <a id="ParseBool" href="#ParseBool">func ParseBool(str string) (bool, error)</a>

```
searchKey: strconv.ParseBool
tags: [function]
```

```Go
func ParseBool(str string) (bool, error)
```

ParseBool returns the boolean value represented by the string. It accepts 1, t, T, TRUE, true, True, 0, f, F, FALSE, false, False. Any other value returns an error. 

### <a id="ParseComplex" href="#ParseComplex">func ParseComplex(s string, bitSize int) (complex128, error)</a>

```
searchKey: strconv.ParseComplex
tags: [function]
```

```Go
func ParseComplex(s string, bitSize int) (complex128, error)
```

ParseComplex converts the string s to a complex number with the precision specified by bitSize: 64 for complex64, or 128 for complex128. When bitSize=64, the result still has type complex128, but it will be convertible to complex64 without changing its value. 

The number represented by s must be of the form N, Ni, or N±Ni, where N stands for a floating-point number as recognized by ParseFloat, and i is the imaginary component. If the second N is unsigned, a + sign is required between the two components as indicated by the ±. If the second N is NaN, only a + sign is accepted. The form may be parenthesized and cannot contain any spaces. The resulting complex number consists of the two components converted by ParseFloat. 

The errors that ParseComplex returns have concrete type *NumError and include err.Num = s. 

If s is not syntactically well-formed, ParseComplex returns err.Err = ErrSyntax. 

If s is syntactically well-formed but either component is more than 1/2 ULP away from the largest floating point number of the given component's size, ParseComplex returns err.Err = ErrRange and c = ±Inf for the respective component. 

### <a id="ParseFloat" href="#ParseFloat">func ParseFloat(s string, bitSize int) (float64, error)</a>

```
searchKey: strconv.ParseFloat
tags: [function]
```

```Go
func ParseFloat(s string, bitSize int) (float64, error)
```

ParseFloat converts the string s to a floating-point number with the precision specified by bitSize: 32 for float32, or 64 for float64. When bitSize=32, the result still has type float64, but it will be convertible to float32 without changing its value. 

ParseFloat accepts decimal and hexadecimal floating-point number syntax. If s is well-formed and near a valid floating-point number, ParseFloat returns the nearest floating-point number rounded using IEEE754 unbiased rounding. (Parsing a hexadecimal floating-point value only rounds when there are more bits in the hexadecimal representation than will fit in the mantissa.) 

The errors that ParseFloat returns have concrete type *NumError and include err.Num = s. 

If s is not syntactically well-formed, ParseFloat returns err.Err = ErrSyntax. 

If s is syntactically well-formed but is more than 1/2 ULP away from the largest floating point number of the given size, ParseFloat returns f = ±Inf, err.Err = ErrRange. 

ParseFloat recognizes the strings "NaN", and the (possibly signed) strings "Inf" and "Infinity" as their respective special floating point values. It ignores case when matching. 

### <a id="ParseFloatPrefix" href="#ParseFloatPrefix">func ParseFloatPrefix(s string, bitSize int) (float64, int, error)</a>

```
searchKey: strconv.ParseFloatPrefix
tags: [function private]
```

```Go
func ParseFloatPrefix(s string, bitSize int) (float64, int, error)
```

### <a id="ParseInt" href="#ParseInt">func ParseInt(s string, base int, bitSize int) (i int64, err error)</a>

```
searchKey: strconv.ParseInt
tags: [function]
```

```Go
func ParseInt(s string, base int, bitSize int) (i int64, err error)
```

ParseInt interprets a string s in the given base (0, 2 to 36) and bit size (0 to 64) and returns the corresponding value i. 

The string may begin with a leading sign: "+" or "-". 

If the base argument is 0, the true base is implied by the string's prefix following the sign (if present): 2 for "0b", 8 for "0" or "0o", 16 for "0x", and 10 otherwise. Also, for argument base 0 only, underscore characters are permitted as defined by the Go syntax for integer literals. 

The bitSize argument specifies the integer type that the result must fit into. Bit sizes 0, 8, 16, 32, and 64 correspond to int, int8, int16, int32, and int64. If bitSize is below 0 or above 64, an error is returned. 

The errors that ParseInt returns have concrete type *NumError and include err.Num = s. If s is empty or contains invalid digits, err.Err = ErrSyntax and the returned value is 0; if the value corresponding to s cannot be represented by a signed integer of the given size, err.Err = ErrRange and the returned value is the maximum magnitude integer of the appropriate bitSize and sign. 

### <a id="ParseUint" href="#ParseUint">func ParseUint(s string, base int, bitSize int) (uint64, error)</a>

```
searchKey: strconv.ParseUint
tags: [function]
```

```Go
func ParseUint(s string, base int, bitSize int) (uint64, error)
```

ParseUint is like ParseInt but for unsigned numbers. 

A sign prefix is not permitted. 

### <a id="Quote" href="#Quote">func Quote(s string) string</a>

```
searchKey: strconv.Quote
tags: [function]
```

```Go
func Quote(s string) string
```

Quote returns a double-quoted Go string literal representing s. The returned string uses Go escape sequences (\t, \n, \xFF, \u0100) for control characters and non-printable characters as defined by IsPrint. 

### <a id="QuoteRune" href="#QuoteRune">func QuoteRune(r rune) string</a>

```
searchKey: strconv.QuoteRune
tags: [function]
```

```Go
func QuoteRune(r rune) string
```

QuoteRune returns a single-quoted Go character literal representing the rune. The returned string uses Go escape sequences (\t, \n, \xFF, \u0100) for control characters and non-printable characters as defined by IsPrint. 

### <a id="QuoteRuneToASCII" href="#QuoteRuneToASCII">func QuoteRuneToASCII(r rune) string</a>

```
searchKey: strconv.QuoteRuneToASCII
tags: [function]
```

```Go
func QuoteRuneToASCII(r rune) string
```

QuoteRuneToASCII returns a single-quoted Go character literal representing the rune. The returned string uses Go escape sequences (\t, \n, \xFF, \u0100) for non-ASCII characters and non-printable characters as defined by IsPrint. 

### <a id="QuoteRuneToGraphic" href="#QuoteRuneToGraphic">func QuoteRuneToGraphic(r rune) string</a>

```
searchKey: strconv.QuoteRuneToGraphic
tags: [function]
```

```Go
func QuoteRuneToGraphic(r rune) string
```

QuoteRuneToGraphic returns a single-quoted Go character literal representing the rune. If the rune is not a Unicode graphic character, as defined by IsGraphic, the returned string will use a Go escape sequence (\t, \n, \xFF, \u0100). 

### <a id="QuoteToASCII" href="#QuoteToASCII">func QuoteToASCII(s string) string</a>

```
searchKey: strconv.QuoteToASCII
tags: [function]
```

```Go
func QuoteToASCII(s string) string
```

QuoteToASCII returns a double-quoted Go string literal representing s. The returned string uses Go escape sequences (\t, \n, \xFF, \u0100) for non-ASCII characters and non-printable characters as defined by IsPrint. 

### <a id="QuoteToGraphic" href="#QuoteToGraphic">func QuoteToGraphic(s string) string</a>

```
searchKey: strconv.QuoteToGraphic
tags: [function]
```

```Go
func QuoteToGraphic(s string) string
```

QuoteToGraphic returns a double-quoted Go string literal representing s. The returned string leaves Unicode graphic characters, as defined by IsGraphic, unchanged and uses Go escape sequences (\t, \n, \xFF, \u0100) for non-graphic characters. 

### <a id="QuotedPrefix" href="#QuotedPrefix">func QuotedPrefix(s string) (string, error)</a>

```
searchKey: strconv.QuotedPrefix
tags: [function]
```

```Go
func QuotedPrefix(s string) (string, error)
```

QuotedPrefix returns the quoted string (as understood by Unquote) at the prefix of s. If s does not start with a valid quoted string, QuotedPrefix returns an error. 

### <a id="SetOptimize" href="#SetOptimize">func SetOptimize(b bool) bool</a>

```
searchKey: strconv.SetOptimize
tags: [function private]
```

```Go
func SetOptimize(b bool) bool
```

### <a id="Unquote" href="#Unquote">func Unquote(s string) (string, error)</a>

```
searchKey: strconv.Unquote
tags: [function]
```

```Go
func Unquote(s string) (string, error)
```

Unquote interprets s as a single-quoted, double-quoted, or backquoted Go string literal, returning the string value that s quotes.  (If s is single-quoted, it would be a Go character literal; Unquote returns the corresponding one-character string.) 

### <a id="UnquoteChar" href="#UnquoteChar">func UnquoteChar(s string, quote byte) (value rune, multibyte bool, tail string, err error)</a>

```
searchKey: strconv.UnquoteChar
tags: [function]
```

```Go
func UnquoteChar(s string, quote byte) (value rune, multibyte bool, tail string, err error)
```

UnquoteChar decodes the first character or byte in the escaped string or character literal represented by the string s. It returns four values: 

```
1) value, the decoded Unicode code point or byte value;
2) multibyte, a boolean indicating whether the decoded character requires a multibyte UTF-8 representation;
3) tail, the remainder of the string after the character; and
4) an error that will be nil if the character is syntactically valid.

```
The second argument, quote, specifies the type of literal being parsed and therefore which escaped quote character is permitted. If set to a single quote, it permits the sequence \' and disallows unescaped '. If set to a double quote, it permits \" and disallows unescaped ". If set to zero, it does not permit either escape and allows both quote characters to appear unescaped. 

### <a id="appendEscapedRune" href="#appendEscapedRune">func appendEscapedRune(buf []byte, r rune, quote byte, ASCIIonly, graphicOnly bool) []byte</a>

```
searchKey: strconv.appendEscapedRune
tags: [function private]
```

```Go
func appendEscapedRune(buf []byte, r rune, quote byte, ASCIIonly, graphicOnly bool) []byte
```

### <a id="appendQuotedRuneWith" href="#appendQuotedRuneWith">func appendQuotedRuneWith(buf []byte, r rune, quote byte, ASCIIonly, graphicOnly bool) []byte</a>

```
searchKey: strconv.appendQuotedRuneWith
tags: [function private]
```

```Go
func appendQuotedRuneWith(buf []byte, r rune, quote byte, ASCIIonly, graphicOnly bool) []byte
```

### <a id="appendQuotedWith" href="#appendQuotedWith">func appendQuotedWith(buf []byte, s string, quote byte, ASCIIonly, graphicOnly bool) []byte</a>

```
searchKey: strconv.appendQuotedWith
tags: [function private]
```

```Go
func appendQuotedWith(buf []byte, s string, quote byte, ASCIIonly, graphicOnly bool) []byte
```

### <a id="atof32" href="#atof32">func atof32(s string) (f float32, n int, err error)</a>

```
searchKey: strconv.atof32
tags: [function private]
```

```Go
func atof32(s string) (f float32, n int, err error)
```

### <a id="atof32exact" href="#atof32exact">func atof32exact(mantissa uint64, exp int, neg bool) (f float32, ok bool)</a>

```
searchKey: strconv.atof32exact
tags: [function private]
```

```Go
func atof32exact(mantissa uint64, exp int, neg bool) (f float32, ok bool)
```

If possible to compute mantissa*10^exp to 32-bit float f exactly, entirely in floating-point math, do so, avoiding the machinery above. 

### <a id="atof64" href="#atof64">func atof64(s string) (f float64, n int, err error)</a>

```
searchKey: strconv.atof64
tags: [function private]
```

```Go
func atof64(s string) (f float64, n int, err error)
```

### <a id="atof64exact" href="#atof64exact">func atof64exact(mantissa uint64, exp int, neg bool) (f float64, ok bool)</a>

```
searchKey: strconv.atof64exact
tags: [function private]
```

```Go
func atof64exact(mantissa uint64, exp int, neg bool) (f float64, ok bool)
```

If possible to convert decimal representation to 64-bit float f exactly, entirely in floating-point math, do so, avoiding the expense of decimalToFloatBits. Three common cases: 

```
value is exact integer
value is exact integer * exact power of ten
value is exact integer / exact power of ten

```
These all produce potentially inexact but correctly rounded answers. 

### <a id="atofHex" href="#atofHex">func atofHex(s string, flt *floatInfo, mantissa uint64, exp int, neg, trunc bool) (float64, error)</a>

```
searchKey: strconv.atofHex
tags: [function private]
```

```Go
func atofHex(s string, flt *floatInfo, mantissa uint64, exp int, neg, trunc bool) (float64, error)
```

atofHex converts the hex floating-point string s to a rounded float32 or float64 value (depending on flt==&float32info or flt==&float64info) and returns it as a float64. The string s has already been parsed into a mantissa, exponent, and sign (neg==true for negative). If trunc is true, trailing non-zero bits have been omitted from the mantissa. 

### <a id="bigFtoa" href="#bigFtoa">func bigFtoa(dst []byte, prec int, fmt byte, neg bool, mant uint64, exp int, flt *floatInfo) []byte</a>

```
searchKey: strconv.bigFtoa
tags: [function private]
```

```Go
func bigFtoa(dst []byte, prec int, fmt byte, neg bool, mant uint64, exp int, flt *floatInfo) []byte
```

bigFtoa uses multiprecision computations to format a float. 

### <a id="bsearch16" href="#bsearch16">func bsearch16(a []uint16, x uint16) int</a>

```
searchKey: strconv.bsearch16
tags: [function private]
```

```Go
func bsearch16(a []uint16, x uint16) int
```

bsearch16 returns the smallest i such that a[i] >= x. If there is no such i, bsearch16 returns len(a). 

### <a id="bsearch32" href="#bsearch32">func bsearch32(a []uint32, x uint32) int</a>

```
searchKey: strconv.bsearch32
tags: [function private]
```

```Go
func bsearch32(a []uint32, x uint32) int
```

bsearch32 returns the smallest i such that a[i] >= x. If there is no such i, bsearch32 returns len(a). 

### <a id="commonPrefixLenIgnoreCase" href="#commonPrefixLenIgnoreCase">func commonPrefixLenIgnoreCase(s, prefix string) int</a>

```
searchKey: strconv.commonPrefixLenIgnoreCase
tags: [function private]
```

```Go
func commonPrefixLenIgnoreCase(s, prefix string) int
```

commonPrefixLenIgnoreCase returns the length of the common prefix of s and prefix, with the character case of s ignored. The prefix argument must be all lower-case. 

### <a id="computeBounds" href="#computeBounds">func computeBounds(mant uint64, exp int, flt *floatInfo) (lower, central, upper uint64, e2 int)</a>

```
searchKey: strconv.computeBounds
tags: [function private]
```

```Go
func computeBounds(mant uint64, exp int, flt *floatInfo) (lower, central, upper uint64, e2 int)
```

computeBounds returns a floating-point vector (l, c, u)×2^e2 where the mantissas are 55-bit (or 26-bit) integers, describing the interval represented by the input float64 or float32. 

### <a id="contains" href="#contains">func contains(s string, c byte) bool</a>

```
searchKey: strconv.contains
tags: [function private]
```

```Go
func contains(s string, c byte) bool
```

contains reports whether the string contains the byte c. 

### <a id="convErr" href="#convErr">func convErr(err error, s string) (syntax, range_ error)</a>

```
searchKey: strconv.convErr
tags: [function private]
```

```Go
func convErr(err error, s string) (syntax, range_ error)
```

convErr splits an error returned by parseFloatPrefix into a syntax or range error for ParseComplex. 

### <a id="digitZero" href="#digitZero">func digitZero(dst []byte) int</a>

```
searchKey: strconv.digitZero
tags: [function private]
```

```Go
func digitZero(dst []byte) int
```

### <a id="divisibleByPower5" href="#divisibleByPower5">func divisibleByPower5(m uint64, k int) bool</a>

```
searchKey: strconv.divisibleByPower5
tags: [function private]
```

```Go
func divisibleByPower5(m uint64, k int) bool
```

### <a id="divmod1e9" href="#divmod1e9">func divmod1e9(x uint64) (uint32, uint32)</a>

```
searchKey: strconv.divmod1e9
tags: [function private]
```

```Go
func divmod1e9(x uint64) (uint32, uint32)
```

divmod1e9 computes quotient and remainder of division by 1e9, avoiding runtime uint64 division on 32-bit platforms. 

### <a id="eiselLemire32" href="#eiselLemire32">func eiselLemire32(man uint64, exp10 int, neg bool) (f float32, ok bool)</a>

```
searchKey: strconv.eiselLemire32
tags: [function private]
```

```Go
func eiselLemire32(man uint64, exp10 int, neg bool) (f float32, ok bool)
```

### <a id="eiselLemire64" href="#eiselLemire64">func eiselLemire64(man uint64, exp10 int, neg bool) (f float64, ok bool)</a>

```
searchKey: strconv.eiselLemire64
tags: [function private]
```

```Go
func eiselLemire64(man uint64, exp10 int, neg bool) (f float64, ok bool)
```

### <a id="fmtB" href="#fmtB">func fmtB(dst []byte, neg bool, mant uint64, exp int, flt *floatInfo) []byte</a>

```
searchKey: strconv.fmtB
tags: [function private]
```

```Go
func fmtB(dst []byte, neg bool, mant uint64, exp int, flt *floatInfo) []byte
```

%b: -ddddddddp±ddd 

### <a id="fmtE" href="#fmtE">func fmtE(dst []byte, neg bool, d decimalSlice, prec int, fmt byte) []byte</a>

```
searchKey: strconv.fmtE
tags: [function private]
```

```Go
func fmtE(dst []byte, neg bool, d decimalSlice, prec int, fmt byte) []byte
```

%e: -d.ddddde±dd 

### <a id="fmtF" href="#fmtF">func fmtF(dst []byte, neg bool, d decimalSlice, prec int) []byte</a>

```
searchKey: strconv.fmtF
tags: [function private]
```

```Go
func fmtF(dst []byte, neg bool, d decimalSlice, prec int) []byte
```

%f: -ddddddd.ddddd 

### <a id="fmtX" href="#fmtX">func fmtX(dst []byte, prec int, fmt byte, neg bool, mant uint64, exp int, flt *floatInfo) []byte</a>

```
searchKey: strconv.fmtX
tags: [function private]
```

```Go
func fmtX(dst []byte, prec int, fmt byte, neg bool, mant uint64, exp int, flt *floatInfo) []byte
```

%x: -0x1.yyyyyyyyp±ddd or -0x0p+0. (y is hex digit, d is decimal digit) 

### <a id="formatBits" href="#formatBits">func formatBits(dst []byte, u uint64, base int, neg, append_ bool) (d []byte, s string)</a>

```
searchKey: strconv.formatBits
tags: [function private]
```

```Go
func formatBits(dst []byte, u uint64, base int, neg, append_ bool) (d []byte, s string)
```

formatBits computes the string representation of u in the given base. If neg is set, u is treated as negative int64 value. If append_ is set, the string is appended to dst and the resulting byte slice is returned as the first result value; otherwise the string is returned as the second result value. 

### <a id="formatDecimal" href="#formatDecimal">func formatDecimal(d *decimalSlice, m uint64, trunc bool, roundUp bool, prec int)</a>

```
searchKey: strconv.formatDecimal
tags: [function private]
```

```Go
func formatDecimal(d *decimalSlice, m uint64, trunc bool, roundUp bool, prec int)
```

formatDecimal fills d with at most prec decimal digits of mantissa m. The boolean trunc indicates whether m is truncated compared to the original number being formatted. 

### <a id="formatDigits" href="#formatDigits">func formatDigits(dst []byte, shortest bool, neg bool, digs decimalSlice, prec int, fmt byte) []byte</a>

```
searchKey: strconv.formatDigits
tags: [function private]
```

```Go
func formatDigits(dst []byte, shortest bool, neg bool, digs decimalSlice, prec int, fmt byte) []byte
```

### <a id="genericFtoa" href="#genericFtoa">func genericFtoa(dst []byte, val float64, fmt byte, prec, bitSize int) []byte</a>

```
searchKey: strconv.genericFtoa
tags: [function private]
```

```Go
func genericFtoa(dst []byte, val float64, fmt byte, prec, bitSize int) []byte
```

### <a id="index" href="#index">func index(s string, c byte) int</a>

```
searchKey: strconv.index
tags: [function private]
```

```Go
func index(s string, c byte) int
```

index returns the index of the first instance of c in s, or -1 if missing. 

### <a id="isInGraphicList" href="#isInGraphicList">func isInGraphicList(r rune) bool</a>

```
searchKey: strconv.isInGraphicList
tags: [function private]
```

```Go
func isInGraphicList(r rune) bool
```

isInGraphicList reports whether the rune is in the isGraphic list. This separation from IsGraphic allows quoteWith to avoid two calls to IsPrint. Should be called only if IsPrint fails. 

### <a id="isPowerOfTwo" href="#isPowerOfTwo">func isPowerOfTwo(x int) bool</a>

```
searchKey: strconv.isPowerOfTwo
tags: [function private]
```

```Go
func isPowerOfTwo(x int) bool
```

### <a id="leftShift" href="#leftShift">func leftShift(a *decimal, k uint)</a>

```
searchKey: strconv.leftShift
tags: [function private]
```

```Go
func leftShift(a *decimal, k uint)
```

Binary shift left (* 2) by k bits.  k <= maxShift to avoid overflow. 

### <a id="lower" href="#lower">func lower(c byte) byte</a>

```
searchKey: strconv.lower
tags: [function private]
```

```Go
func lower(c byte) byte
```

lower(c) is a lower-case letter if and only if c is either that lower-case letter or the equivalent upper-case letter. Instead of writing c == 'x' || c == 'X' one can write lower(c) == 'x'. Note that lower of non-letters can produce other non-letters. 

### <a id="max" href="#max">func max(a, b int) int</a>

```
searchKey: strconv.max
tags: [function private]
```

```Go
func max(a, b int) int
```

### <a id="min" href="#min">func min(a, b int) int</a>

```
searchKey: strconv.min
tags: [function private]
```

```Go
func min(a, b int) int
```

### <a id="mulByLog10Log2" href="#mulByLog10Log2">func mulByLog10Log2(x int) int</a>

```
searchKey: strconv.mulByLog10Log2
tags: [function private]
```

```Go
func mulByLog10Log2(x int) int
```

mulByLog10Log2 returns math.Floor(x * log(10)/log(2)) for an integer x in the range -500 <= x && x <= +500. 

The range restriction lets us work in faster integer arithmetic instead of slower floating point arithmetic. Correctness is verified by unit tests. 

### <a id="mulByLog2Log10" href="#mulByLog2Log10">func mulByLog2Log10(x int) int</a>

```
searchKey: strconv.mulByLog2Log10
tags: [function private]
```

```Go
func mulByLog2Log10(x int) int
```

mulByLog2Log10 returns math.Floor(x * log(2)/log(10)) for an integer x in the range -1600 <= x && x <= +1600. 

The range restriction lets us work in faster integer arithmetic instead of slower floating point arithmetic. Correctness is verified by unit tests. 

### <a id="mult128bitPow10" href="#mult128bitPow10">func mult128bitPow10(m uint64, e2, q int) (resM uint64, resE int, exact bool)</a>

```
searchKey: strconv.mult128bitPow10
tags: [function private]
```

```Go
func mult128bitPow10(m uint64, e2, q int) (resM uint64, resE int, exact bool)
```

mult128bitPow10 takes a floating-point input with a 55-bit mantissa and multiplies it with 10^q. The resulting mantissa is m*P >> 119 where P is a 128-bit element of the detailedPowersOfTen tables. It is typically 63 or 64-bit wide. The returned boolean is true is all trimmed bits were zero. 

That is: 

```
m*2^e2 * round(10^q) = resM * 2^resE + ε
exact = ε == 0

```
### <a id="mult64bitPow10" href="#mult64bitPow10">func mult64bitPow10(m uint32, e2, q int) (resM uint32, resE int, exact bool)</a>

```
searchKey: strconv.mult64bitPow10
tags: [function private]
```

```Go
func mult64bitPow10(m uint32, e2, q int) (resM uint32, resE int, exact bool)
```

mult64bitPow10 takes a floating-point input with a 25-bit mantissa and multiplies it with 10^q. The resulting mantissa is m*P >> 57 where P is a 64-bit element of the detailedPowersOfTen tables. It is typically 31 or 32-bit wide. The returned boolean is true if all trimmed bits were zero. 

That is: 

```
m*2^e2 * round(10^q) = resM * 2^resE + ε
exact = ε == 0

```
### <a id="parseFloatPrefix" href="#parseFloatPrefix">func parseFloatPrefix(s string, bitSize int) (float64, int, error)</a>

```
searchKey: strconv.parseFloatPrefix
tags: [function private]
```

```Go
func parseFloatPrefix(s string, bitSize int) (float64, int, error)
```

### <a id="prefixIsLessThan" href="#prefixIsLessThan">func prefixIsLessThan(b []byte, s string) bool</a>

```
searchKey: strconv.prefixIsLessThan
tags: [function private]
```

```Go
func prefixIsLessThan(b []byte, s string) bool
```

Is the leading prefix of b lexicographically less than s? 

### <a id="quoteRuneWith" href="#quoteRuneWith">func quoteRuneWith(r rune, quote byte, ASCIIonly, graphicOnly bool) string</a>

```
searchKey: strconv.quoteRuneWith
tags: [function private]
```

```Go
func quoteRuneWith(r rune, quote byte, ASCIIonly, graphicOnly bool) string
```

### <a id="quoteWith" href="#quoteWith">func quoteWith(s string, quote byte, ASCIIonly, graphicOnly bool) string</a>

```
searchKey: strconv.quoteWith
tags: [function private]
```

```Go
func quoteWith(s string, quote byte, ASCIIonly, graphicOnly bool) string
```

### <a id="readFloat" href="#readFloat">func readFloat(s string) (mantissa uint64, exp int, neg, trunc, hex bool, i int, ok bool)</a>

```
searchKey: strconv.readFloat
tags: [function private]
```

```Go
func readFloat(s string) (mantissa uint64, exp int, neg, trunc, hex bool, i int, ok bool)
```

readFloat reads a decimal or hexadecimal mantissa and exponent from a float string representation in s; the number may be followed by other characters. readFloat reports the number of bytes consumed (i), and whether the number is valid (ok). 

### <a id="rightShift" href="#rightShift">func rightShift(a *decimal, k uint)</a>

```
searchKey: strconv.rightShift
tags: [function private]
```

```Go
func rightShift(a *decimal, k uint)
```

Binary shift right (/ 2) by k bits.  k <= maxShift to avoid overflow. 

### <a id="roundShortest" href="#roundShortest">func roundShortest(d *decimal, mant uint64, exp int, flt *floatInfo)</a>

```
searchKey: strconv.roundShortest
tags: [function private]
```

```Go
func roundShortest(d *decimal, mant uint64, exp int, flt *floatInfo)
```

roundShortest rounds d (= mant * 2^exp) to the shortest number of digits that will let the original floating point value be precisely reconstructed. 

### <a id="ryuDigits" href="#ryuDigits">func ryuDigits(d *decimalSlice, lower, central, upper uint64,...</a>

```
searchKey: strconv.ryuDigits
tags: [function private]
```

```Go
func ryuDigits(d *decimalSlice, lower, central, upper uint64,
	c0, cup bool)
```

### <a id="ryuDigits32" href="#ryuDigits32">func ryuDigits32(d *decimalSlice, lower, central, upper uint32,...</a>

```
searchKey: strconv.ryuDigits32
tags: [function private]
```

```Go
func ryuDigits32(d *decimalSlice, lower, central, upper uint32,
	c0, cup bool, endindex int)
```

ryuDigits32 emits decimal digits for a number less than 1e9. 

### <a id="ryuFtoaFixed32" href="#ryuFtoaFixed32">func ryuFtoaFixed32(d *decimalSlice, mant uint32, exp int, prec int)</a>

```
searchKey: strconv.ryuFtoaFixed32
tags: [function private]
```

```Go
func ryuFtoaFixed32(d *decimalSlice, mant uint32, exp int, prec int)
```

ryuFtoaFixed32 formats mant*(2^exp) with prec decimal digits. 

### <a id="ryuFtoaFixed64" href="#ryuFtoaFixed64">func ryuFtoaFixed64(d *decimalSlice, mant uint64, exp int, prec int)</a>

```
searchKey: strconv.ryuFtoaFixed64
tags: [function private]
```

```Go
func ryuFtoaFixed64(d *decimalSlice, mant uint64, exp int, prec int)
```

ryuFtoaFixed64 formats mant*(2^exp) with prec decimal digits. 

### <a id="ryuFtoaShortest" href="#ryuFtoaShortest">func ryuFtoaShortest(d *decimalSlice, mant uint64, exp int, flt *floatInfo)</a>

```
searchKey: strconv.ryuFtoaShortest
tags: [function private]
```

```Go
func ryuFtoaShortest(d *decimalSlice, mant uint64, exp int, flt *floatInfo)
```

ryuFtoaShortest formats mant*2^exp with prec decimal digits. 

### <a id="shouldRoundUp" href="#shouldRoundUp">func shouldRoundUp(a *decimal, nd int) bool</a>

```
searchKey: strconv.shouldRoundUp
tags: [function private]
```

```Go
func shouldRoundUp(a *decimal, nd int) bool
```

If we chop a at nd digits, should we round up? 

### <a id="small" href="#small">func small(i int) string</a>

```
searchKey: strconv.small
tags: [function private]
```

```Go
func small(i int) string
```

small returns the string for an i with 0 <= i < nSmalls. 

### <a id="special" href="#special">func special(s string) (f float64, n int, ok bool)</a>

```
searchKey: strconv.special
tags: [function private]
```

```Go
func special(s string) (f float64, n int, ok bool)
```

special returns the floating-point value for the special, possibly signed floating-point representations inf, infinity, and NaN. The result is ok if a prefix of s contains one of these representations and n is the length of that prefix. The character case is ignored. 

### <a id="trim" href="#trim">func trim(a *decimal)</a>

```
searchKey: strconv.trim
tags: [function private]
```

```Go
func trim(a *decimal)
```

trim trailing zeros from number. (They are meaningless; the decimal point is tracked independent of the number of digits.) 

### <a id="underscoreOK" href="#underscoreOK">func underscoreOK(s string) bool</a>

```
searchKey: strconv.underscoreOK
tags: [function private]
```

```Go
func underscoreOK(s string) bool
```

underscoreOK reports whether the underscores in s are allowed. Checking them in this one function lets all the parsers skip over them simply. Underscore must appear only between digits or between a base prefix and a digit. 

### <a id="unhex" href="#unhex">func unhex(b byte) (v rune, ok bool)</a>

```
searchKey: strconv.unhex
tags: [function private]
```

```Go
func unhex(b byte) (v rune, ok bool)
```

### <a id="unquote" href="#unquote">func unquote(in string, unescape bool) (out, rem string, err error)</a>

```
searchKey: strconv.unquote
tags: [function private]
```

```Go
func unquote(in string, unescape bool) (out, rem string, err error)
```

unquote parses a quoted string at the start of the input, returning the parsed prefix, the remaining suffix, and any parse errors. If unescape is true, the parsed prefix is unescaped, otherwise the input prefix is provided verbatim. 

