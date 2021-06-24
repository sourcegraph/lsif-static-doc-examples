# Package field

Package field implements fast arithmetic modulo 2^255-19. 

## Index

* [Constants](#const)
    * [const maskLow51Bits](#maskLow51Bits)
* [Variables](#var)
    * [var feOne](#feOne)
    * [var feZero](#feZero)
    * [var quickCheckConfig1024](#quickCheckConfig1024)
    * [var sqrtM1](#sqrtM1)
    * [var weirdLimbs51](#weirdLimbs51)
    * [var weirdLimbs52](#weirdLimbs52)
* [Types](#type)
    * [type Element struct](#Element)
        * [func generateFieldElement(rand *mathrand.Rand) Element](#generateFieldElement)
        * [func generateWeirdFieldElement(rand *mathrand.Rand) Element](#generateWeirdFieldElement)
        * [func (v *Element) Absolute(u *Element) *Element](#Element.Absolute)
        * [func (v *Element) Add(a, b *Element) *Element](#Element.Add)
        * [func (v *Element) Bytes() []byte](#Element.Bytes)
        * [func (v *Element) Equal(u *Element) int](#Element.Equal)
        * [func (Element) Generate(rand *mathrand.Rand, size int) reflect.Value](#Element.Generate)
        * [func (v *Element) Invert(z *Element) *Element](#Element.Invert)
        * [func (v *Element) IsNegative() int](#Element.IsNegative)
        * [func (v *Element) Mult32(x *Element, y uint32) *Element](#Element.Mult32)
        * [func (v *Element) Multiply(x, y *Element) *Element](#Element.Multiply)
        * [func (v *Element) Negate(a *Element) *Element](#Element.Negate)
        * [func (v *Element) One() *Element](#Element.One)
        * [func (v *Element) Pow22523(x *Element) *Element](#Element.Pow22523)
        * [func (v *Element) Select(a, b *Element, cond int) *Element](#Element.Select)
        * [func (v *Element) Set(a *Element) *Element](#Element.Set)
        * [func (v *Element) SetBytes(x []byte) *Element](#Element.SetBytes)
        * [func (r *Element) SqrtRatio(u, v *Element) (rr *Element, wasSquare int)](#Element.SqrtRatio)
        * [func (v *Element) Square(x *Element) *Element](#Element.Square)
        * [func (v Element) String() string](#Element.String)
        * [func (v *Element) Subtract(a, b *Element) *Element](#Element.Subtract)
        * [func (v *Element) Swap(u *Element, cond int)](#Element.Swap)
        * [func (v *Element) Zero() *Element](#Element.Zero)
        * [func (v *Element) bytes(out *[32]byte) []byte](#Element.bytes)
        * [func (v *Element) carryPropagate() *Element](#Element.carryPropagate)
        * [func (v *Element) carryPropagateGeneric() *Element](#Element.carryPropagateGeneric)
        * [func (v *Element) fromBig(n *big.Int) *Element](#Element.fromBig)
        * [func (v *Element) fromDecimal(s string) *Element](#Element.fromDecimal)
        * [func (v *Element) reduce() *Element](#Element.reduce)
        * [func (v *Element) toBig() *big.Int](#Element.toBig)
    * [type uint128 struct](#uint128)
        * [func addMul64(v uint128, a, b uint64) uint128](#addMul64)
        * [func mul64(a, b uint64) uint128](#mul64)
* [Functions](#func)
    * [func BenchmarkAdd(b *testing.B)](#BenchmarkAdd)
    * [func BenchmarkMult32(b *testing.B)](#BenchmarkMult32)
    * [func BenchmarkMultiply(b *testing.B)](#BenchmarkMultiply)
    * [func TestAliasing(t *testing.T)](#TestAliasing)
    * [func TestBytesBigEquivalence(t *testing.T)](#TestBytesBigEquivalence)
    * [func TestCarryPropagate(t *testing.T)](#TestCarryPropagate)
    * [func TestConsistency(t *testing.T)](#TestConsistency)
    * [func TestDecimalConstants(t *testing.T)](#TestDecimalConstants)
    * [func TestEqual(t *testing.T)](#TestEqual)
    * [func TestFeMul(t *testing.T)](#TestFeMul)
    * [func TestFeSquare(t *testing.T)](#TestFeSquare)
    * [func TestInvert(t *testing.T)](#TestInvert)
    * [func TestMul64to128(t *testing.T)](#TestMul64to128)
    * [func TestMult32(t *testing.T)](#TestMult32)
    * [func TestMultiplyDistributesOverAdd(t *testing.T)](#TestMultiplyDistributesOverAdd)
    * [func TestSelectSwap(t *testing.T)](#TestSelectSwap)
    * [func TestSetBytesRoundTrip(t *testing.T)](#TestSetBytesRoundTrip)
    * [func TestSetBytesRoundTripEdgeCases(t *testing.T)](#TestSetBytesRoundTripEdgeCases)
    * [func TestSqrtRatio(t *testing.T)](#TestSqrtRatio)
    * [func checkAliasingOneArg(f func(v, x *Element) *Element) func(v, x Element) bool](#checkAliasingOneArg)
    * [func checkAliasingTwoArgs(f func(v, x, y *Element) *Element) func(v, x, y Element) bool](#checkAliasingTwoArgs)
    * [func decodeHex(s string) []byte](#decodeHex)
    * [func feMul(out *Element, a *Element, b *Element)](#feMul)
    * [func feMulGeneric(v, a, b *Element)](#feMulGeneric)
    * [func feSquare(out *Element, a *Element)](#feSquare)
    * [func feSquareGeneric(v, a *Element)](#feSquareGeneric)
    * [func isInBounds(x *Element) bool](#isInBounds)
    * [func mask64Bits(cond int) uint64](#mask64Bits)
    * [func mul51(a uint64, b uint32) (lo uint64, hi uint64)](#mul51)
    * [func shiftRightBy51(a uint128) uint64](#shiftRightBy51)
    * [func swapEndianness(buf []byte) []byte](#swapEndianness)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="maskLow51Bits" href="#maskLow51Bits">const maskLow51Bits</a>

```
searchKey: field.maskLow51Bits
tags: [constant number private]
```

```Go
const maskLow51Bits uint64 = (1 << 51) - 1
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="feOne" href="#feOne">var feOne</a>

```
searchKey: field.feOne
tags: [variable struct private]
```

```Go
var feOne = &Element{1, 0, 0, 0, 0}
```

### <a id="feZero" href="#feZero">var feZero</a>

```
searchKey: field.feZero
tags: [variable struct private]
```

```Go
var feZero = &Element{0, 0, 0, 0, 0}
```

### <a id="quickCheckConfig1024" href="#quickCheckConfig1024">var quickCheckConfig1024</a>

```
searchKey: field.quickCheckConfig1024
tags: [variable struct private]
```

```Go
var quickCheckConfig1024 = &quick.Config{MaxCountScale: 1 << 10}
```

quickCheckConfig1024 will make each quickcheck test run (1024 * -quickchecks) times. The default value of -quickchecks is 100. 

### <a id="sqrtM1" href="#sqrtM1">var sqrtM1</a>

```
searchKey: field.sqrtM1
tags: [variable struct private]
```

```Go
var sqrtM1 = ...
```

sqrtM1 is 2^((p-1)/4), which squared is equal to -1 by Euler's Criterion. 

### <a id="weirdLimbs51" href="#weirdLimbs51">var weirdLimbs51</a>

```
searchKey: field.weirdLimbs51
tags: [variable array number private]
```

```Go
var weirdLimbs51 = ...
```

weirdLimbs can be combined to generate a range of edge-case field elements. 0 and -1 are intentionally more weighted, as they combine well. 

### <a id="weirdLimbs52" href="#weirdLimbs52">var weirdLimbs52</a>

```
searchKey: field.weirdLimbs52
tags: [variable array number private]
```

```Go
var weirdLimbs52 = ...
```

weirdLimbs can be combined to generate a range of edge-case field elements. 0 and -1 are intentionally more weighted, as they combine well. 

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Element" href="#Element">type Element struct</a>

```
searchKey: field.Element
tags: [struct]
```

```Go
type Element struct {
	// An element t represents the integer
	//     t.l0 + t.l1*2^51 + t.l2*2^102 + t.l3*2^153 + t.l4*2^204
	//
	// Between operations, all limbs are expected to be lower than 2^52.
	l0 uint64
	l1 uint64
	l2 uint64
	l3 uint64
	l4 uint64
}
```

Element represents an element of the field GF(2^255-19). Note that this is not a cryptographically secure group, and should only be used to interact with edwards25519.Point coordinates. 

This type works similarly to math/big.Int, and all arguments and receivers are allowed to alias. 

The zero value is a valid zero element. 

#### <a id="generateFieldElement" href="#generateFieldElement">func generateFieldElement(rand *mathrand.Rand) Element</a>

```
searchKey: field.generateFieldElement
tags: [method private]
```

```Go
func generateFieldElement(rand *mathrand.Rand) Element
```

#### <a id="generateWeirdFieldElement" href="#generateWeirdFieldElement">func generateWeirdFieldElement(rand *mathrand.Rand) Element</a>

```
searchKey: field.generateWeirdFieldElement
tags: [method private]
```

```Go
func generateWeirdFieldElement(rand *mathrand.Rand) Element
```

#### <a id="Element.Absolute" href="#Element.Absolute">func (v *Element) Absolute(u *Element) *Element</a>

```
searchKey: field.Element.Absolute
tags: [method]
```

```Go
func (v *Element) Absolute(u *Element) *Element
```

Absolute sets v to |u|, and returns v. 

#### <a id="Element.Add" href="#Element.Add">func (v *Element) Add(a, b *Element) *Element</a>

```
searchKey: field.Element.Add
tags: [method]
```

```Go
func (v *Element) Add(a, b *Element) *Element
```

Add sets v = a + b, and returns v. 

#### <a id="Element.Bytes" href="#Element.Bytes">func (v *Element) Bytes() []byte</a>

```
searchKey: field.Element.Bytes
tags: [function]
```

```Go
func (v *Element) Bytes() []byte
```

Bytes returns the canonical 32-byte little-endian encoding of v. 

#### <a id="Element.Equal" href="#Element.Equal">func (v *Element) Equal(u *Element) int</a>

```
searchKey: field.Element.Equal
tags: [method]
```

```Go
func (v *Element) Equal(u *Element) int
```

Equal returns 1 if v and u are equal, and 0 otherwise. 

#### <a id="Element.Generate" href="#Element.Generate">func (Element) Generate(rand *mathrand.Rand, size int) reflect.Value</a>

```
searchKey: field.Element.Generate
tags: [method private]
```

```Go
func (Element) Generate(rand *mathrand.Rand, size int) reflect.Value
```

#### <a id="Element.Invert" href="#Element.Invert">func (v *Element) Invert(z *Element) *Element</a>

```
searchKey: field.Element.Invert
tags: [method]
```

```Go
func (v *Element) Invert(z *Element) *Element
```

Invert sets v = 1/z mod p, and returns v. 

If z == 0, Invert returns v = 0. 

#### <a id="Element.IsNegative" href="#Element.IsNegative">func (v *Element) IsNegative() int</a>

```
searchKey: field.Element.IsNegative
tags: [function]
```

```Go
func (v *Element) IsNegative() int
```

IsNegative returns 1 if v is negative, and 0 otherwise. 

#### <a id="Element.Mult32" href="#Element.Mult32">func (v *Element) Mult32(x *Element, y uint32) *Element</a>

```
searchKey: field.Element.Mult32
tags: [method]
```

```Go
func (v *Element) Mult32(x *Element, y uint32) *Element
```

Mult32 sets v = x * y, and returns v. 

#### <a id="Element.Multiply" href="#Element.Multiply">func (v *Element) Multiply(x, y *Element) *Element</a>

```
searchKey: field.Element.Multiply
tags: [method]
```

```Go
func (v *Element) Multiply(x, y *Element) *Element
```

Multiply sets v = x * y, and returns v. 

#### <a id="Element.Negate" href="#Element.Negate">func (v *Element) Negate(a *Element) *Element</a>

```
searchKey: field.Element.Negate
tags: [method]
```

```Go
func (v *Element) Negate(a *Element) *Element
```

Negate sets v = -a, and returns v. 

#### <a id="Element.One" href="#Element.One">func (v *Element) One() *Element</a>

```
searchKey: field.Element.One
tags: [function]
```

```Go
func (v *Element) One() *Element
```

One sets v = 1, and returns v. 

#### <a id="Element.Pow22523" href="#Element.Pow22523">func (v *Element) Pow22523(x *Element) *Element</a>

```
searchKey: field.Element.Pow22523
tags: [method]
```

```Go
func (v *Element) Pow22523(x *Element) *Element
```

Pow22523 set v = x^((p-5)/8), and returns v. (p-5)/8 is 2^252-3. 

#### <a id="Element.Select" href="#Element.Select">func (v *Element) Select(a, b *Element, cond int) *Element</a>

```
searchKey: field.Element.Select
tags: [method]
```

```Go
func (v *Element) Select(a, b *Element, cond int) *Element
```

Select sets v to a if cond == 1, and to b if cond == 0. 

#### <a id="Element.Set" href="#Element.Set">func (v *Element) Set(a *Element) *Element</a>

```
searchKey: field.Element.Set
tags: [method]
```

```Go
func (v *Element) Set(a *Element) *Element
```

Set sets v = a, and returns v. 

#### <a id="Element.SetBytes" href="#Element.SetBytes">func (v *Element) SetBytes(x []byte) *Element</a>

```
searchKey: field.Element.SetBytes
tags: [method]
```

```Go
func (v *Element) SetBytes(x []byte) *Element
```

SetBytes sets v to x, which must be a 32-byte little-endian encoding. 

Consistent with RFC 7748, the most significant bit (the high bit of the last byte) is ignored, and non-canonical values (2^255-19 through 2^255-1) are accepted. Note that this is laxer than specified by RFC 8032. 

#### <a id="Element.SqrtRatio" href="#Element.SqrtRatio">func (r *Element) SqrtRatio(u, v *Element) (rr *Element, wasSquare int)</a>

```
searchKey: field.Element.SqrtRatio
tags: [method]
```

```Go
func (r *Element) SqrtRatio(u, v *Element) (rr *Element, wasSquare int)
```

SqrtRatio sets r to the non-negative square root of the ratio of u and v. 

If u/v is square, SqrtRatio returns r and 1. If u/v is not square, SqrtRatio sets r according to Section 4.3 of draft-irtf-cfrg-ristretto255-decaf448-00, and returns r and 0. 

#### <a id="Element.Square" href="#Element.Square">func (v *Element) Square(x *Element) *Element</a>

```
searchKey: field.Element.Square
tags: [method]
```

```Go
func (v *Element) Square(x *Element) *Element
```

Square sets v = x * x, and returns v. 

#### <a id="Element.String" href="#Element.String">func (v Element) String() string</a>

```
searchKey: field.Element.String
tags: [function private]
```

```Go
func (v Element) String() string
```

#### <a id="Element.Subtract" href="#Element.Subtract">func (v *Element) Subtract(a, b *Element) *Element</a>

```
searchKey: field.Element.Subtract
tags: [method]
```

```Go
func (v *Element) Subtract(a, b *Element) *Element
```

Subtract sets v = a - b, and returns v. 

#### <a id="Element.Swap" href="#Element.Swap">func (v *Element) Swap(u *Element, cond int)</a>

```
searchKey: field.Element.Swap
tags: [method]
```

```Go
func (v *Element) Swap(u *Element, cond int)
```

Swap swaps v and u if cond == 1 or leaves them unchanged if cond == 0, and returns v. 

#### <a id="Element.Zero" href="#Element.Zero">func (v *Element) Zero() *Element</a>

```
searchKey: field.Element.Zero
tags: [function]
```

```Go
func (v *Element) Zero() *Element
```

Zero sets v = 0, and returns v. 

#### <a id="Element.bytes" href="#Element.bytes">func (v *Element) bytes(out *[32]byte) []byte</a>

```
searchKey: field.Element.bytes
tags: [method private]
```

```Go
func (v *Element) bytes(out *[32]byte) []byte
```

#### <a id="Element.carryPropagate" href="#Element.carryPropagate">func (v *Element) carryPropagate() *Element</a>

```
searchKey: field.Element.carryPropagate
tags: [function private]
```

```Go
func (v *Element) carryPropagate() *Element
```

#### <a id="Element.carryPropagateGeneric" href="#Element.carryPropagateGeneric">func (v *Element) carryPropagateGeneric() *Element</a>

```
searchKey: field.Element.carryPropagateGeneric
tags: [function private]
```

```Go
func (v *Element) carryPropagateGeneric() *Element
```

carryPropagate brings the limbs below 52 bits by applying the reduction identity (a * 2²⁵⁵ + b = a * 19 + b) to the l4 carry. 

#### <a id="Element.fromBig" href="#Element.fromBig">func (v *Element) fromBig(n *big.Int) *Element</a>

```
searchKey: field.Element.fromBig
tags: [method private]
```

```Go
func (v *Element) fromBig(n *big.Int) *Element
```

fromBig sets v = n, and returns v. The bit length of n must not exceed 256. 

#### <a id="Element.fromDecimal" href="#Element.fromDecimal">func (v *Element) fromDecimal(s string) *Element</a>

```
searchKey: field.Element.fromDecimal
tags: [method private]
```

```Go
func (v *Element) fromDecimal(s string) *Element
```

#### <a id="Element.reduce" href="#Element.reduce">func (v *Element) reduce() *Element</a>

```
searchKey: field.Element.reduce
tags: [function private]
```

```Go
func (v *Element) reduce() *Element
```

reduce reduces v modulo 2^255 - 19 and returns it. 

#### <a id="Element.toBig" href="#Element.toBig">func (v *Element) toBig() *big.Int</a>

```
searchKey: field.Element.toBig
tags: [function private]
```

```Go
func (v *Element) toBig() *big.Int
```

toBig returns v as a big.Int. 

### <a id="uint128" href="#uint128">type uint128 struct</a>

```
searchKey: field.uint128
tags: [struct private]
```

```Go
type uint128 struct {
	lo, hi uint64
}
```

uint128 holds a 128-bit number as two 64-bit limbs, for use with the bits.Mul64 and bits.Add64 intrinsics. 

#### <a id="addMul64" href="#addMul64">func addMul64(v uint128, a, b uint64) uint128</a>

```
searchKey: field.addMul64
tags: [method private]
```

```Go
func addMul64(v uint128, a, b uint64) uint128
```

addMul64 returns v + a * b. 

#### <a id="mul64" href="#mul64">func mul64(a, b uint64) uint128</a>

```
searchKey: field.mul64
tags: [method private]
```

```Go
func mul64(a, b uint64) uint128
```

mul64 returns a * b. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="BenchmarkAdd" href="#BenchmarkAdd">func BenchmarkAdd(b *testing.B)</a>

```
searchKey: field.BenchmarkAdd
tags: [method private benchmark]
```

```Go
func BenchmarkAdd(b *testing.B)
```

### <a id="BenchmarkMult32" href="#BenchmarkMult32">func BenchmarkMult32(b *testing.B)</a>

```
searchKey: field.BenchmarkMult32
tags: [method private benchmark]
```

```Go
func BenchmarkMult32(b *testing.B)
```

### <a id="BenchmarkMultiply" href="#BenchmarkMultiply">func BenchmarkMultiply(b *testing.B)</a>

```
searchKey: field.BenchmarkMultiply
tags: [method private benchmark]
```

```Go
func BenchmarkMultiply(b *testing.B)
```

### <a id="TestAliasing" href="#TestAliasing">func TestAliasing(t *testing.T)</a>

```
searchKey: field.TestAliasing
tags: [method private test]
```

```Go
func TestAliasing(t *testing.T)
```

TestAliasing checks that receivers and arguments can alias each other without leading to incorrect results. That is, it ensures that it's safe to write 

```
v.Invert(v)

```
or 

```
v.Add(v, v)

```
without any of the inputs getting clobbered by the output being written. 

### <a id="TestBytesBigEquivalence" href="#TestBytesBigEquivalence">func TestBytesBigEquivalence(t *testing.T)</a>

```
searchKey: field.TestBytesBigEquivalence
tags: [method private test]
```

```Go
func TestBytesBigEquivalence(t *testing.T)
```

### <a id="TestCarryPropagate" href="#TestCarryPropagate">func TestCarryPropagate(t *testing.T)</a>

```
searchKey: field.TestCarryPropagate
tags: [method private test]
```

```Go
func TestCarryPropagate(t *testing.T)
```

### <a id="TestConsistency" href="#TestConsistency">func TestConsistency(t *testing.T)</a>

```
searchKey: field.TestConsistency
tags: [method private test]
```

```Go
func TestConsistency(t *testing.T)
```

Tests self-consistency between Multiply and Square. 

### <a id="TestDecimalConstants" href="#TestDecimalConstants">func TestDecimalConstants(t *testing.T)</a>

```
searchKey: field.TestDecimalConstants
tags: [method private test]
```

```Go
func TestDecimalConstants(t *testing.T)
```

### <a id="TestEqual" href="#TestEqual">func TestEqual(t *testing.T)</a>

```
searchKey: field.TestEqual
tags: [method private test]
```

```Go
func TestEqual(t *testing.T)
```

### <a id="TestFeMul" href="#TestFeMul">func TestFeMul(t *testing.T)</a>

```
searchKey: field.TestFeMul
tags: [method private test]
```

```Go
func TestFeMul(t *testing.T)
```

### <a id="TestFeSquare" href="#TestFeSquare">func TestFeSquare(t *testing.T)</a>

```
searchKey: field.TestFeSquare
tags: [method private test]
```

```Go
func TestFeSquare(t *testing.T)
```

### <a id="TestInvert" href="#TestInvert">func TestInvert(t *testing.T)</a>

```
searchKey: field.TestInvert
tags: [method private test]
```

```Go
func TestInvert(t *testing.T)
```

### <a id="TestMul64to128" href="#TestMul64to128">func TestMul64to128(t *testing.T)</a>

```
searchKey: field.TestMul64to128
tags: [method private test]
```

```Go
func TestMul64to128(t *testing.T)
```

### <a id="TestMult32" href="#TestMult32">func TestMult32(t *testing.T)</a>

```
searchKey: field.TestMult32
tags: [method private test]
```

```Go
func TestMult32(t *testing.T)
```

### <a id="TestMultiplyDistributesOverAdd" href="#TestMultiplyDistributesOverAdd">func TestMultiplyDistributesOverAdd(t *testing.T)</a>

```
searchKey: field.TestMultiplyDistributesOverAdd
tags: [method private test]
```

```Go
func TestMultiplyDistributesOverAdd(t *testing.T)
```

### <a id="TestSelectSwap" href="#TestSelectSwap">func TestSelectSwap(t *testing.T)</a>

```
searchKey: field.TestSelectSwap
tags: [method private test]
```

```Go
func TestSelectSwap(t *testing.T)
```

### <a id="TestSetBytesRoundTrip" href="#TestSetBytesRoundTrip">func TestSetBytesRoundTrip(t *testing.T)</a>

```
searchKey: field.TestSetBytesRoundTrip
tags: [method private test]
```

```Go
func TestSetBytesRoundTrip(t *testing.T)
```

### <a id="TestSetBytesRoundTripEdgeCases" href="#TestSetBytesRoundTripEdgeCases">func TestSetBytesRoundTripEdgeCases(t *testing.T)</a>

```
searchKey: field.TestSetBytesRoundTripEdgeCases
tags: [method private test]
```

```Go
func TestSetBytesRoundTripEdgeCases(t *testing.T)
```

### <a id="TestSqrtRatio" href="#TestSqrtRatio">func TestSqrtRatio(t *testing.T)</a>

```
searchKey: field.TestSqrtRatio
tags: [method private test]
```

```Go
func TestSqrtRatio(t *testing.T)
```

### <a id="checkAliasingOneArg" href="#checkAliasingOneArg">func checkAliasingOneArg(f func(v, x *Element) *Element) func(v, x Element) bool</a>

```
searchKey: field.checkAliasingOneArg
tags: [method private]
```

```Go
func checkAliasingOneArg(f func(v, x *Element) *Element) func(v, x Element) bool
```

### <a id="checkAliasingTwoArgs" href="#checkAliasingTwoArgs">func checkAliasingTwoArgs(f func(v, x, y *Element) *Element) func(v, x, y Element) bool</a>

```
searchKey: field.checkAliasingTwoArgs
tags: [method private]
```

```Go
func checkAliasingTwoArgs(f func(v, x, y *Element) *Element) func(v, x, y Element) bool
```

### <a id="decodeHex" href="#decodeHex">func decodeHex(s string) []byte</a>

```
searchKey: field.decodeHex
tags: [method private]
```

```Go
func decodeHex(s string) []byte
```

### <a id="feMul" href="#feMul">func feMul(out *Element, a *Element, b *Element)</a>

```
searchKey: field.feMul
tags: [method private]
```

```Go
func feMul(out *Element, a *Element, b *Element)
```

feMul sets out = a * b. It works like feMulGeneric. 

### <a id="feMulGeneric" href="#feMulGeneric">func feMulGeneric(v, a, b *Element)</a>

```
searchKey: field.feMulGeneric
tags: [method private]
```

```Go
func feMulGeneric(v, a, b *Element)
```

### <a id="feSquare" href="#feSquare">func feSquare(out *Element, a *Element)</a>

```
searchKey: field.feSquare
tags: [method private]
```

```Go
func feSquare(out *Element, a *Element)
```

feSquare sets out = a * a. It works like feSquareGeneric. 

### <a id="feSquareGeneric" href="#feSquareGeneric">func feSquareGeneric(v, a *Element)</a>

```
searchKey: field.feSquareGeneric
tags: [method private]
```

```Go
func feSquareGeneric(v, a *Element)
```

### <a id="isInBounds" href="#isInBounds">func isInBounds(x *Element) bool</a>

```
searchKey: field.isInBounds
tags: [method private]
```

```Go
func isInBounds(x *Element) bool
```

isInBounds returns whether the element is within the expected bit size bounds after a light reduction. 

### <a id="mask64Bits" href="#mask64Bits">func mask64Bits(cond int) uint64</a>

```
searchKey: field.mask64Bits
tags: [method private]
```

```Go
func mask64Bits(cond int) uint64
```

mask64Bits returns 0xffffffff if cond is 1, and 0 otherwise. 

### <a id="mul51" href="#mul51">func mul51(a uint64, b uint32) (lo uint64, hi uint64)</a>

```
searchKey: field.mul51
tags: [method private]
```

```Go
func mul51(a uint64, b uint32) (lo uint64, hi uint64)
```

mul51 returns lo + hi * 2⁵¹ = a * b. 

### <a id="shiftRightBy51" href="#shiftRightBy51">func shiftRightBy51(a uint128) uint64</a>

```
searchKey: field.shiftRightBy51
tags: [method private]
```

```Go
func shiftRightBy51(a uint128) uint64
```

shiftRightBy51 returns a >> 51. a is assumed to be at most 115 bits. 

### <a id="swapEndianness" href="#swapEndianness">func swapEndianness(buf []byte) []byte</a>

```
searchKey: field.swapEndianness
tags: [method private]
```

```Go
func swapEndianness(buf []byte) []byte
```

