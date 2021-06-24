# Package edwards25519

Package edwards25519 implements group logic for the twisted Edwards curve 

```
-x^2 + y^2 = 1 + -(121665/121666)*x^2*y^2

```
This is better known as the Edwards curve equivalent to Curve25519, and is the curve used by the Ed25519 signature scheme. 

Most users don't need this package, and should instead use crypto/ed25519 for signatures, golang.org/x/crypto/curve25519 for Diffie-Hellman, or github.com/gtank/ristretto255 for prime order group logic. 

However, developers who do need to interact with low-level edwards25519 operations can use filippo.io/edwards25519, an extended version of this package repackaged as an importable module. 

(Note that filippo.io/edwards25519 and github.com/gtank/ristretto255 are not maintained by the Go team and are not covered by the Go 1 Compatibility Promise.) 

## Index

* Subpages
  * [crypto/ed25519/internal/edwards25519/field](edwards25519/field.md)
* [Variables](#var)
    * [var B](#B)
    * [var I](#I)
    * [var basepointNafTablePrecomp](#basepointNafTablePrecomp)
    * [var basepointTablePrecomp](#basepointTablePrecomp)
    * [var d](#d)
    * [var d2](#d2)
    * [var dalekScalar](#dalekScalar)
    * [var dalekScalarBasepoint](#dalekScalarBasepoint)
    * [var feOne](#feOne)
    * [var generator](#generator)
    * [var identity](#identity)
    * [var quickCheckConfig1024](#quickCheckConfig1024)
    * [var quickCheckConfig32](#quickCheckConfig32)
    * [var scMinusOne](#scMinusOne)
    * [var scOne](#scOne)
    * [var scZero](#scZero)
    * [var testAllocationsSink](#testAllocationsSink)
* [Types](#type)
    * [type Point struct](#Point)
        * [func NewGeneratorPoint() *Point](#NewGeneratorPoint)
        * [func NewIdentityPoint() *Point](#NewIdentityPoint)
        * [func (v *Point) Add(p, q *Point) *Point](#Point.Add)
        * [func (v *Point) Bytes() []byte](#Point.Bytes)
        * [func (v *Point) Equal(u *Point) int](#Point.Equal)
        * [func (v *Point) Negate(p *Point) *Point](#Point.Negate)
        * [func (v *Point) ScalarBaseMult(x *Scalar) *Point](#Point.ScalarBaseMult)
        * [func (v *Point) ScalarMult(x *Scalar, q *Point) *Point](#Point.ScalarMult)
        * [func (v *Point) Set(u *Point) *Point](#Point.Set)
        * [func (v *Point) SetBytes(x []byte) (*Point, error)](#Point.SetBytes)
        * [func (v *Point) Subtract(p, q *Point) *Point](#Point.Subtract)
        * [func (v *Point) VarTimeDoubleScalarBaseMult(a *Scalar, A *Point, b *Scalar) *Point](#Point.VarTimeDoubleScalarBaseMult)
        * [func (v *Point) bytes(buf *[32]byte) []byte](#Point.bytes)
        * [func (v *Point) fromP1xP1(p *projP1xP1) *Point](#Point.fromP1xP1)
        * [func (v *Point) fromP2(p *projP2) *Point](#Point.fromP2)
    * [type Scalar struct](#Scalar)
        * [func NewScalar() *Scalar](#NewScalar)
        * [func (s *Scalar) Add(x, y *Scalar) *Scalar](#Scalar.Add)
        * [func (s *Scalar) Bytes() []byte](#Scalar.Bytes)
        * [func (s *Scalar) Equal(t *Scalar) int](#Scalar.Equal)
        * [func (Scalar) Generate(rand *mathrand.Rand, size int) reflect.Value](#Scalar.Generate)
        * [func (s *Scalar) Multiply(x, y *Scalar) *Scalar](#Scalar.Multiply)
        * [func (s *Scalar) MultiplyAdd(x, y, z *Scalar) *Scalar](#Scalar.MultiplyAdd)
        * [func (s *Scalar) Negate(x *Scalar) *Scalar](#Scalar.Negate)
        * [func (s *Scalar) Set(x *Scalar) *Scalar](#Scalar.Set)
        * [func (s *Scalar) SetBytesWithClamping(x []byte) *Scalar](#Scalar.SetBytesWithClamping)
        * [func (s *Scalar) SetCanonicalBytes(x []byte) (*Scalar, error)](#Scalar.SetCanonicalBytes)
        * [func (s *Scalar) SetUniformBytes(x []byte) *Scalar](#Scalar.SetUniformBytes)
        * [func (s *Scalar) Subtract(x, y *Scalar) *Scalar](#Scalar.Subtract)
        * [func (s *Scalar) nonAdjacentForm(w uint) [256]int8](#Scalar.nonAdjacentForm)
        * [func (s *Scalar) signedRadix16() [64]int8](#Scalar.signedRadix16)
    * [type affineCached struct](#affineCached)
        * [func (v *affineCached) CondNeg(cond int) *affineCached](#affineCached.CondNeg)
        * [func (v *affineCached) FromP3(p *Point) *affineCached](#affineCached.FromP3)
        * [func (v *affineCached) Select(a, b *affineCached, cond int) *affineCached](#affineCached.Select)
        * [func (v *affineCached) Zero() *affineCached](#affineCached.Zero)
    * [type affineLookupTable struct](#affineLookupTable)
        * [func (v *affineLookupTable) FromP3(q *Point)](#affineLookupTable.FromP3)
        * [func (v *affineLookupTable) SelectInto(dest *affineCached, x int8)](#affineLookupTable.SelectInto)
    * [type incomparable [0]func()](#incomparable)
    * [type nafLookupTable5 struct](#nafLookupTable5)
        * [func (v *nafLookupTable5) FromP3(q *Point)](#nafLookupTable5.FromP3)
        * [func (v *nafLookupTable5) SelectInto(dest *projCached, x int8)](#nafLookupTable5.SelectInto)
    * [type nafLookupTable8 struct](#nafLookupTable8)
        * [func basepointNafTable() *nafLookupTable8](#basepointNafTable)
        * [func (v *nafLookupTable8) FromP3(q *Point)](#nafLookupTable8.FromP3)
        * [func (v *nafLookupTable8) SelectInto(dest *affineCached, x int8)](#nafLookupTable8.SelectInto)
    * [type notZeroScalar edwards25519.Scalar](#notZeroScalar)
        * [func (notZeroScalar) Generate(rand *mathrand.Rand, size int) reflect.Value](#notZeroScalar.Generate)
    * [type projCached struct](#projCached)
        * [func (v *projCached) CondNeg(cond int) *projCached](#projCached.CondNeg)
        * [func (v *projCached) FromP3(p *Point) *projCached](#projCached.FromP3)
        * [func (v *projCached) Select(a, b *projCached, cond int) *projCached](#projCached.Select)
        * [func (v *projCached) Zero() *projCached](#projCached.Zero)
    * [type projLookupTable struct](#projLookupTable)
        * [func (v *projLookupTable) FromP3(q *Point)](#projLookupTable.FromP3)
        * [func (v *projLookupTable) SelectInto(dest *projCached, x int8)](#projLookupTable.SelectInto)
    * [type projP1xP1 struct](#projP1xP1)
        * [func (v *projP1xP1) Add(p *Point, q *projCached) *projP1xP1](#projP1xP1.Add)
        * [func (v *projP1xP1) AddAffine(p *Point, q *affineCached) *projP1xP1](#projP1xP1.AddAffine)
        * [func (v *projP1xP1) Double(p *projP2) *projP1xP1](#projP1xP1.Double)
        * [func (v *projP1xP1) Sub(p *Point, q *projCached) *projP1xP1](#projP1xP1.Sub)
        * [func (v *projP1xP1) SubAffine(p *Point, q *affineCached) *projP1xP1](#projP1xP1.SubAffine)
    * [type projP2 struct](#projP2)
        * [func (v *projP2) FromP1xP1(p *projP1xP1) *projP2](#projP2.FromP1xP1)
        * [func (v *projP2) FromP3(p *Point) *projP2](#projP2.FromP3)
        * [func (v *projP2) Zero() *projP2](#projP2.Zero)
* [Functions](#func)
    * [func BenchmarkScalarBaseMult(t *testing.B)](#BenchmarkScalarBaseMult)
    * [func BenchmarkScalarMult(t *testing.B)](#BenchmarkScalarMult)
    * [func BenchmarkVarTimeDoubleScalarBaseMult(t *testing.B)](#BenchmarkVarTimeDoubleScalarBaseMult)
    * [func TestAddSubNegOnBasePoint(t *testing.T)](#TestAddSubNegOnBasePoint)
    * [func TestAffineLookupTable(t *testing.T)](#TestAffineLookupTable)
    * [func TestAllocations(t *testing.T)](#TestAllocations)
    * [func TestBaseMultVsDalek(t *testing.T)](#TestBaseMultVsDalek)
    * [func TestBasepointNafTableGeneration(t *testing.T)](#TestBasepointNafTableGeneration)
    * [func TestBasepointTableGeneration(t *testing.T)](#TestBasepointTableGeneration)
    * [func TestComparable(t *testing.T)](#TestComparable)
    * [func TestGenerator(t *testing.T)](#TestGenerator)
    * [func TestInvalidEncodings(t *testing.T)](#TestInvalidEncodings)
    * [func TestNafLookupTable5(t *testing.T)](#TestNafLookupTable5)
    * [func TestNafLookupTable8(t *testing.T)](#TestNafLookupTable8)
    * [func TestNonCanonicalPoints(t *testing.T)](#TestNonCanonicalPoints)
    * [func TestProjLookupTable(t *testing.T)](#TestProjLookupTable)
    * [func TestScalarAddLikeSubNeg(t *testing.T)](#TestScalarAddLikeSubNeg)
    * [func TestScalarAliasing(t *testing.T)](#TestScalarAliasing)
    * [func TestScalarEqual(t *testing.T)](#TestScalarEqual)
    * [func TestScalarGenerate(t *testing.T)](#TestScalarGenerate)
    * [func TestScalarMultDistributesOverAdd(t *testing.T)](#TestScalarMultDistributesOverAdd)
    * [func TestScalarMultMatchesBaseMult(t *testing.T)](#TestScalarMultMatchesBaseMult)
    * [func TestScalarMultNonIdentityPoint(t *testing.T)](#TestScalarMultNonIdentityPoint)
    * [func TestScalarMultSmallScalars(t *testing.T)](#TestScalarMultSmallScalars)
    * [func TestScalarMultVsDalek(t *testing.T)](#TestScalarMultVsDalek)
    * [func TestScalarMultiplyDistributesOverAdd(t *testing.T)](#TestScalarMultiplyDistributesOverAdd)
    * [func TestScalarNonAdjacentForm(t *testing.T)](#TestScalarNonAdjacentForm)
    * [func TestScalarSetBytesWithClamping(t *testing.T)](#TestScalarSetBytesWithClamping)
    * [func TestScalarSetCanonicalBytes(t *testing.T)](#TestScalarSetCanonicalBytes)
    * [func TestScalarSetUniformBytes(t *testing.T)](#TestScalarSetUniformBytes)
    * [func TestVarTimeDoubleBaseMultMatchesBaseMult(t *testing.T)](#TestVarTimeDoubleBaseMultMatchesBaseMult)
    * [func TestVarTimeDoubleBaseMultVsDalek(t *testing.T)](#TestVarTimeDoubleBaseMultVsDalek)
    * [func basepointTable() *[32]affineLookupTable](#basepointTable)
    * [func bigIntFromLittleEndianBytes(b []byte) *big.Int](#bigIntFromLittleEndianBytes)
    * [func checkInitialized(points ...*Point)](#checkInitialized)
    * [func checkOnCurve(t *testing.T, points ...*Point)](#checkOnCurve)
    * [func copyFieldElement(buf *[32]byte, v *field.Element) []byte](#copyFieldElement)
    * [func decodeHex(s string) []byte](#decodeHex)
    * [func isReduced(s *Scalar) bool](#isReduced)
    * [func load3(in []byte) int64](#load3)
    * [func load4(in []byte) int64](#load4)
    * [func scMulAdd(s, a, b, c *[32]byte)](#scMulAdd)
    * [func scReduce(out *[32]byte, s *[64]byte)](#scReduce)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="B" href="#B">var B</a>

```
searchKey: edwards25519.B
tags: [variable struct private]
```

```Go
var B = NewGeneratorPoint()
```

### <a id="I" href="#I">var I</a>

```
searchKey: edwards25519.I
tags: [variable struct private]
```

```Go
var I = NewIdentityPoint()
```

### <a id="basepointNafTablePrecomp" href="#basepointNafTablePrecomp">var basepointNafTablePrecomp</a>

```
searchKey: edwards25519.basepointNafTablePrecomp
tags: [variable struct private]
```

```Go
var basepointNafTablePrecomp struct {
	table    nafLookupTable8
	initOnce sync.Once
}
```

### <a id="basepointTablePrecomp" href="#basepointTablePrecomp">var basepointTablePrecomp</a>

```
searchKey: edwards25519.basepointTablePrecomp
tags: [variable struct private]
```

```Go
var basepointTablePrecomp struct {
	table    [32]affineLookupTable
	initOnce sync.Once
}
```

### <a id="d" href="#d">var d</a>

```
searchKey: edwards25519.d
tags: [variable private]
```

```Go
var d = ...
```

d is a constant in the curve equation. 

### <a id="d2" href="#d2">var d2</a>

```
searchKey: edwards25519.d2
tags: [variable private]
```

```Go
var d2 = new(field.Element).Add(d, d)
```

### <a id="dalekScalar" href="#dalekScalar">var dalekScalar</a>

```
searchKey: edwards25519.dalekScalar
tags: [variable struct private]
```

```Go
var dalekScalar = ...
```

a random scalar generated using dalek. 

### <a id="dalekScalarBasepoint" href="#dalekScalarBasepoint">var dalekScalarBasepoint</a>

```
searchKey: edwards25519.dalekScalarBasepoint
tags: [variable struct private]
```

```Go
var dalekScalarBasepoint, _ = ...
```

the above, times the edwards25519 basepoint. 

### <a id="feOne" href="#feOne">var feOne</a>

```
searchKey: edwards25519.feOne
tags: [variable private]
```

```Go
var feOne = new(field.Element).One()
```

### <a id="generator" href="#generator">var generator</a>

```
searchKey: edwards25519.generator
tags: [variable struct private]
```

```Go
var generator, _ = ...
```

generator is the canonical curve basepoint. See TestGenerator for the correspondence of this encoding with the values in RFC 8032. 

### <a id="identity" href="#identity">var identity</a>

```
searchKey: edwards25519.identity
tags: [variable struct private]
```

```Go
var identity, _ = ...
```

identity is the point at infinity. 

### <a id="quickCheckConfig1024" href="#quickCheckConfig1024">var quickCheckConfig1024</a>

```
searchKey: edwards25519.quickCheckConfig1024
tags: [variable struct private]
```

```Go
var quickCheckConfig1024 = &quick.Config{MaxCountScale: 1 << 10}
```

quickCheckConfig1024 will make each quickcheck test run (1024 * -quickchecks) times. The default value of -quickchecks is 100. 

### <a id="quickCheckConfig32" href="#quickCheckConfig32">var quickCheckConfig32</a>

```
searchKey: edwards25519.quickCheckConfig32
tags: [variable struct private]
```

```Go
var quickCheckConfig32 = &quick.Config{MaxCountScale: 1 << 5}
```

quickCheckConfig32 will make each quickcheck test run (32 * -quickchecks) times. The default value of -quickchecks is 100. 

### <a id="scMinusOne" href="#scMinusOne">var scMinusOne</a>

```
searchKey: edwards25519.scMinusOne
tags: [variable struct private]
```

```Go
var scMinusOne = ...
```

### <a id="scOne" href="#scOne">var scOne</a>

```
searchKey: edwards25519.scOne
tags: [variable struct private]
```

```Go
var scOne = ...
```

### <a id="scZero" href="#scZero">var scZero</a>

```
searchKey: edwards25519.scZero
tags: [variable struct private]
```

```Go
var scZero = ...
```

### <a id="testAllocationsSink" href="#testAllocationsSink">var testAllocationsSink</a>

```
searchKey: edwards25519.testAllocationsSink
tags: [variable number private]
```

```Go
var testAllocationsSink byte
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Point" href="#Point">type Point struct</a>

```
searchKey: edwards25519.Point
tags: [struct]
```

```Go
type Point struct {
	// The point is internally represented in extended coordinates (X, Y, Z, T)
	// where x = X/Z, y = Y/Z, and xy = T/Z per https://eprint.iacr.org/2008/522.
	x, y, z, t field.Element

	// Make the type not comparable (i.e. used with == or as a map key), as
	// equivalent points can be represented by different Go values.
	_ incomparable
}
```

Point represents a point on the edwards25519 curve. 

This type works similarly to math/big.Int, and all arguments and receivers are allowed to alias. 

The zero value is NOT valid, and it may be used only as a receiver. 

#### <a id="NewGeneratorPoint" href="#NewGeneratorPoint">func NewGeneratorPoint() *Point</a>

```
searchKey: edwards25519.NewGeneratorPoint
tags: [function]
```

```Go
func NewGeneratorPoint() *Point
```

NewGeneratorPoint returns a new Point set to the canonical generator. 

#### <a id="NewIdentityPoint" href="#NewIdentityPoint">func NewIdentityPoint() *Point</a>

```
searchKey: edwards25519.NewIdentityPoint
tags: [function]
```

```Go
func NewIdentityPoint() *Point
```

NewIdentityPoint returns a new Point set to the identity. 

#### <a id="Point.Add" href="#Point.Add">func (v *Point) Add(p, q *Point) *Point</a>

```
searchKey: edwards25519.Point.Add
tags: [method]
```

```Go
func (v *Point) Add(p, q *Point) *Point
```

Add sets v = p + q, and returns v. 

#### <a id="Point.Bytes" href="#Point.Bytes">func (v *Point) Bytes() []byte</a>

```
searchKey: edwards25519.Point.Bytes
tags: [function]
```

```Go
func (v *Point) Bytes() []byte
```

Bytes returns the canonical 32-byte encoding of v, according to RFC 8032, Section 5.1.2. 

#### <a id="Point.Equal" href="#Point.Equal">func (v *Point) Equal(u *Point) int</a>

```
searchKey: edwards25519.Point.Equal
tags: [method]
```

```Go
func (v *Point) Equal(u *Point) int
```

Equal returns 1 if v is equivalent to u, and 0 otherwise. 

#### <a id="Point.Negate" href="#Point.Negate">func (v *Point) Negate(p *Point) *Point</a>

```
searchKey: edwards25519.Point.Negate
tags: [method]
```

```Go
func (v *Point) Negate(p *Point) *Point
```

Negate sets v = -p, and returns v. 

#### <a id="Point.ScalarBaseMult" href="#Point.ScalarBaseMult">func (v *Point) ScalarBaseMult(x *Scalar) *Point</a>

```
searchKey: edwards25519.Point.ScalarBaseMult
tags: [method]
```

```Go
func (v *Point) ScalarBaseMult(x *Scalar) *Point
```

ScalarBaseMult sets v = x * B, where B is the canonical generator, and returns v. 

The scalar multiplication is done in constant time. 

#### <a id="Point.ScalarMult" href="#Point.ScalarMult">func (v *Point) ScalarMult(x *Scalar, q *Point) *Point</a>

```
searchKey: edwards25519.Point.ScalarMult
tags: [method]
```

```Go
func (v *Point) ScalarMult(x *Scalar, q *Point) *Point
```

ScalarMult sets v = x * q, and returns v. 

The scalar multiplication is done in constant time. 

#### <a id="Point.Set" href="#Point.Set">func (v *Point) Set(u *Point) *Point</a>

```
searchKey: edwards25519.Point.Set
tags: [method]
```

```Go
func (v *Point) Set(u *Point) *Point
```

Set sets v = u, and returns v. 

#### <a id="Point.SetBytes" href="#Point.SetBytes">func (v *Point) SetBytes(x []byte) (*Point, error)</a>

```
searchKey: edwards25519.Point.SetBytes
tags: [method]
```

```Go
func (v *Point) SetBytes(x []byte) (*Point, error)
```

SetBytes sets v = x, where x is a 32-byte encoding of v. If x does not represent a valid point on the curve, SetBytes returns nil and an error and the receiver is unchanged. Otherwise, SetBytes returns v. 

Note that SetBytes accepts all non-canonical encodings of valid points. That is, it follows decoding rules that match most implementations in the ecosystem rather than RFC 8032. 

#### <a id="Point.Subtract" href="#Point.Subtract">func (v *Point) Subtract(p, q *Point) *Point</a>

```
searchKey: edwards25519.Point.Subtract
tags: [method]
```

```Go
func (v *Point) Subtract(p, q *Point) *Point
```

Subtract sets v = p - q, and returns v. 

#### <a id="Point.VarTimeDoubleScalarBaseMult" href="#Point.VarTimeDoubleScalarBaseMult">func (v *Point) VarTimeDoubleScalarBaseMult(a *Scalar, A *Point, b *Scalar) *Point</a>

```
searchKey: edwards25519.Point.VarTimeDoubleScalarBaseMult
tags: [method]
```

```Go
func (v *Point) VarTimeDoubleScalarBaseMult(a *Scalar, A *Point, b *Scalar) *Point
```

VarTimeDoubleScalarBaseMult sets v = a * A + b * B, where B is the canonical generator, and returns v. 

Execution time depends on the inputs. 

#### <a id="Point.bytes" href="#Point.bytes">func (v *Point) bytes(buf *[32]byte) []byte</a>

```
searchKey: edwards25519.Point.bytes
tags: [method private]
```

```Go
func (v *Point) bytes(buf *[32]byte) []byte
```

#### <a id="Point.fromP1xP1" href="#Point.fromP1xP1">func (v *Point) fromP1xP1(p *projP1xP1) *Point</a>

```
searchKey: edwards25519.Point.fromP1xP1
tags: [method private]
```

```Go
func (v *Point) fromP1xP1(p *projP1xP1) *Point
```

#### <a id="Point.fromP2" href="#Point.fromP2">func (v *Point) fromP2(p *projP2) *Point</a>

```
searchKey: edwards25519.Point.fromP2
tags: [method private]
```

```Go
func (v *Point) fromP2(p *projP2) *Point
```

### <a id="Scalar" href="#Scalar">type Scalar struct</a>

```
searchKey: edwards25519.Scalar
tags: [struct]
```

```Go
type Scalar struct {
	// s is the Scalar value in little-endian. The value is always reduced
	// between operations.
	s [32]byte
}
```

A Scalar is an integer modulo 

```
l = 2^252 + 27742317777372353535851937790883648493

```
which is the prime order of the edwards25519 group. 

This type works similarly to math/big.Int, and all arguments and receivers are allowed to alias. 

The zero value is a valid zero element. 

#### <a id="NewScalar" href="#NewScalar">func NewScalar() *Scalar</a>

```
searchKey: edwards25519.NewScalar
tags: [function]
```

```Go
func NewScalar() *Scalar
```

NewScalar returns a new zero Scalar. 

#### <a id="Scalar.Add" href="#Scalar.Add">func (s *Scalar) Add(x, y *Scalar) *Scalar</a>

```
searchKey: edwards25519.Scalar.Add
tags: [method]
```

```Go
func (s *Scalar) Add(x, y *Scalar) *Scalar
```

Add sets s = x + y mod l, and returns s. 

#### <a id="Scalar.Bytes" href="#Scalar.Bytes">func (s *Scalar) Bytes() []byte</a>

```
searchKey: edwards25519.Scalar.Bytes
tags: [function]
```

```Go
func (s *Scalar) Bytes() []byte
```

Bytes returns the canonical 32-byte little-endian encoding of s. 

#### <a id="Scalar.Equal" href="#Scalar.Equal">func (s *Scalar) Equal(t *Scalar) int</a>

```
searchKey: edwards25519.Scalar.Equal
tags: [method]
```

```Go
func (s *Scalar) Equal(t *Scalar) int
```

Equal returns 1 if s and t are equal, and 0 otherwise. 

#### <a id="Scalar.Generate" href="#Scalar.Generate">func (Scalar) Generate(rand *mathrand.Rand, size int) reflect.Value</a>

```
searchKey: edwards25519.Scalar.Generate
tags: [method private]
```

```Go
func (Scalar) Generate(rand *mathrand.Rand, size int) reflect.Value
```

Generate returns a valid (reduced modulo l) Scalar with a distribution weighted towards high, low, and edge values. 

#### <a id="Scalar.Multiply" href="#Scalar.Multiply">func (s *Scalar) Multiply(x, y *Scalar) *Scalar</a>

```
searchKey: edwards25519.Scalar.Multiply
tags: [method]
```

```Go
func (s *Scalar) Multiply(x, y *Scalar) *Scalar
```

Multiply sets s = x * y mod l, and returns s. 

#### <a id="Scalar.MultiplyAdd" href="#Scalar.MultiplyAdd">func (s *Scalar) MultiplyAdd(x, y, z *Scalar) *Scalar</a>

```
searchKey: edwards25519.Scalar.MultiplyAdd
tags: [method]
```

```Go
func (s *Scalar) MultiplyAdd(x, y, z *Scalar) *Scalar
```

MultiplyAdd sets s = x * y + z mod l, and returns s. 

#### <a id="Scalar.Negate" href="#Scalar.Negate">func (s *Scalar) Negate(x *Scalar) *Scalar</a>

```
searchKey: edwards25519.Scalar.Negate
tags: [method]
```

```Go
func (s *Scalar) Negate(x *Scalar) *Scalar
```

Negate sets s = -x mod l, and returns s. 

#### <a id="Scalar.Set" href="#Scalar.Set">func (s *Scalar) Set(x *Scalar) *Scalar</a>

```
searchKey: edwards25519.Scalar.Set
tags: [method]
```

```Go
func (s *Scalar) Set(x *Scalar) *Scalar
```

Set sets s = x, and returns s. 

#### <a id="Scalar.SetBytesWithClamping" href="#Scalar.SetBytesWithClamping">func (s *Scalar) SetBytesWithClamping(x []byte) *Scalar</a>

```
searchKey: edwards25519.Scalar.SetBytesWithClamping
tags: [method]
```

```Go
func (s *Scalar) SetBytesWithClamping(x []byte) *Scalar
```

SetBytesWithClamping applies the buffer pruning described in RFC 8032, Section 5.1.5 (also known as clamping) and sets s to the result. The input must be 32 bytes, and it is not modified. 

Note that since Scalar values are always reduced modulo the prime order of the curve, the resulting value will not preserve any of the cofactor-clearing properties that clamping is meant to provide. It will however work as expected as long as it is applied to points on the prime order subgroup, like in Ed25519. In fact, it is lost to history why RFC 8032 adopted the irrelevant RFC 7748 clamping, but it is now required for compatibility. 

#### <a id="Scalar.SetCanonicalBytes" href="#Scalar.SetCanonicalBytes">func (s *Scalar) SetCanonicalBytes(x []byte) (*Scalar, error)</a>

```
searchKey: edwards25519.Scalar.SetCanonicalBytes
tags: [method]
```

```Go
func (s *Scalar) SetCanonicalBytes(x []byte) (*Scalar, error)
```

SetCanonicalBytes sets s = x, where x is a 32-byte little-endian encoding of s, and returns s. If x is not a canonical encoding of s, SetCanonicalBytes returns nil and an error, and the receiver is unchanged. 

#### <a id="Scalar.SetUniformBytes" href="#Scalar.SetUniformBytes">func (s *Scalar) SetUniformBytes(x []byte) *Scalar</a>

```
searchKey: edwards25519.Scalar.SetUniformBytes
tags: [method]
```

```Go
func (s *Scalar) SetUniformBytes(x []byte) *Scalar
```

SetUniformBytes sets s to an uniformly distributed value given 64 uniformly distributed random bytes. 

#### <a id="Scalar.Subtract" href="#Scalar.Subtract">func (s *Scalar) Subtract(x, y *Scalar) *Scalar</a>

```
searchKey: edwards25519.Scalar.Subtract
tags: [method]
```

```Go
func (s *Scalar) Subtract(x, y *Scalar) *Scalar
```

Subtract sets s = x - y mod l, and returns s. 

#### <a id="Scalar.nonAdjacentForm" href="#Scalar.nonAdjacentForm">func (s *Scalar) nonAdjacentForm(w uint) [256]int8</a>

```
searchKey: edwards25519.Scalar.nonAdjacentForm
tags: [method private]
```

```Go
func (s *Scalar) nonAdjacentForm(w uint) [256]int8
```

nonAdjacentForm computes a width-w non-adjacent form for this scalar. 

w must be between 2 and 8, or nonAdjacentForm will panic. 

#### <a id="Scalar.signedRadix16" href="#Scalar.signedRadix16">func (s *Scalar) signedRadix16() [64]int8</a>

```
searchKey: edwards25519.Scalar.signedRadix16
tags: [function private]
```

```Go
func (s *Scalar) signedRadix16() [64]int8
```

### <a id="affineCached" href="#affineCached">type affineCached struct</a>

```
searchKey: edwards25519.affineCached
tags: [struct private]
```

```Go
type affineCached struct {
	YplusX, YminusX, T2d field.Element
}
```

#### <a id="affineCached.CondNeg" href="#affineCached.CondNeg">func (v *affineCached) CondNeg(cond int) *affineCached</a>

```
searchKey: edwards25519.affineCached.CondNeg
tags: [method private]
```

```Go
func (v *affineCached) CondNeg(cond int) *affineCached
```

CondNeg negates v if cond == 1 and leaves it unchanged if cond == 0. 

#### <a id="affineCached.FromP3" href="#affineCached.FromP3">func (v *affineCached) FromP3(p *Point) *affineCached</a>

```
searchKey: edwards25519.affineCached.FromP3
tags: [method private]
```

```Go
func (v *affineCached) FromP3(p *Point) *affineCached
```

#### <a id="affineCached.Select" href="#affineCached.Select">func (v *affineCached) Select(a, b *affineCached, cond int) *affineCached</a>

```
searchKey: edwards25519.affineCached.Select
tags: [method private]
```

```Go
func (v *affineCached) Select(a, b *affineCached, cond int) *affineCached
```

Select sets v to a if cond == 1 and to b if cond == 0. 

#### <a id="affineCached.Zero" href="#affineCached.Zero">func (v *affineCached) Zero() *affineCached</a>

```
searchKey: edwards25519.affineCached.Zero
tags: [function private]
```

```Go
func (v *affineCached) Zero() *affineCached
```

### <a id="affineLookupTable" href="#affineLookupTable">type affineLookupTable struct</a>

```
searchKey: edwards25519.affineLookupTable
tags: [struct private]
```

```Go
type affineLookupTable struct {
	points [8]affineCached
}
```

A precomputed lookup table for fixed-base, constant-time scalar muls. 

#### <a id="affineLookupTable.FromP3" href="#affineLookupTable.FromP3">func (v *affineLookupTable) FromP3(q *Point)</a>

```
searchKey: edwards25519.affineLookupTable.FromP3
tags: [method private]
```

```Go
func (v *affineLookupTable) FromP3(q *Point)
```

This is not optimised for speed; fixed-base tables should be precomputed. 

#### <a id="affineLookupTable.SelectInto" href="#affineLookupTable.SelectInto">func (v *affineLookupTable) SelectInto(dest *affineCached, x int8)</a>

```
searchKey: edwards25519.affineLookupTable.SelectInto
tags: [method private]
```

```Go
func (v *affineLookupTable) SelectInto(dest *affineCached, x int8)
```

Set dest to x*Q, where -8 <= x <= 8, in constant time. 

### <a id="incomparable" href="#incomparable">type incomparable [0]func()</a>

```
searchKey: edwards25519.incomparable
tags: [array function private]
```

```Go
type incomparable [0]func()
```

### <a id="nafLookupTable5" href="#nafLookupTable5">type nafLookupTable5 struct</a>

```
searchKey: edwards25519.nafLookupTable5
tags: [struct private]
```

```Go
type nafLookupTable5 struct {
	points [8]projCached
}
```

A dynamic lookup table for variable-base, variable-time scalar muls. 

#### <a id="nafLookupTable5.FromP3" href="#nafLookupTable5.FromP3">func (v *nafLookupTable5) FromP3(q *Point)</a>

```
searchKey: edwards25519.nafLookupTable5.FromP3
tags: [method private]
```

```Go
func (v *nafLookupTable5) FromP3(q *Point)
```

Builds a lookup table at runtime. Fast. 

#### <a id="nafLookupTable5.SelectInto" href="#nafLookupTable5.SelectInto">func (v *nafLookupTable5) SelectInto(dest *projCached, x int8)</a>

```
searchKey: edwards25519.nafLookupTable5.SelectInto
tags: [method private]
```

```Go
func (v *nafLookupTable5) SelectInto(dest *projCached, x int8)
```

Given odd x with 0 < x < 2^4, return x*Q (in variable time). 

### <a id="nafLookupTable8" href="#nafLookupTable8">type nafLookupTable8 struct</a>

```
searchKey: edwards25519.nafLookupTable8
tags: [struct private]
```

```Go
type nafLookupTable8 struct {
	points [64]affineCached
}
```

A precomputed lookup table for fixed-base, variable-time scalar muls. 

#### <a id="basepointNafTable" href="#basepointNafTable">func basepointNafTable() *nafLookupTable8</a>

```
searchKey: edwards25519.basepointNafTable
tags: [function private]
```

```Go
func basepointNafTable() *nafLookupTable8
```

basepointNafTable is the nafLookupTable8 for the basepoint. It is precomputed the first time it's used. 

#### <a id="nafLookupTable8.FromP3" href="#nafLookupTable8.FromP3">func (v *nafLookupTable8) FromP3(q *Point)</a>

```
searchKey: edwards25519.nafLookupTable8.FromP3
tags: [method private]
```

```Go
func (v *nafLookupTable8) FromP3(q *Point)
```

This is not optimised for speed; fixed-base tables should be precomputed. 

#### <a id="nafLookupTable8.SelectInto" href="#nafLookupTable8.SelectInto">func (v *nafLookupTable8) SelectInto(dest *affineCached, x int8)</a>

```
searchKey: edwards25519.nafLookupTable8.SelectInto
tags: [method private]
```

```Go
func (v *nafLookupTable8) SelectInto(dest *affineCached, x int8)
```

Given odd x with 0 < x < 2^7, return x*Q (in variable time). 

### <a id="notZeroScalar" href="#notZeroScalar">type notZeroScalar edwards25519.Scalar</a>

```
searchKey: edwards25519.notZeroScalar
tags: [struct private]
```

```Go
type notZeroScalar Scalar
```

#### <a id="notZeroScalar.Generate" href="#notZeroScalar.Generate">func (notZeroScalar) Generate(rand *mathrand.Rand, size int) reflect.Value</a>

```
searchKey: edwards25519.notZeroScalar.Generate
tags: [method private]
```

```Go
func (notZeroScalar) Generate(rand *mathrand.Rand, size int) reflect.Value
```

### <a id="projCached" href="#projCached">type projCached struct</a>

```
searchKey: edwards25519.projCached
tags: [struct private]
```

```Go
type projCached struct {
	YplusX, YminusX, Z, T2d field.Element
}
```

#### <a id="projCached.CondNeg" href="#projCached.CondNeg">func (v *projCached) CondNeg(cond int) *projCached</a>

```
searchKey: edwards25519.projCached.CondNeg
tags: [method private]
```

```Go
func (v *projCached) CondNeg(cond int) *projCached
```

CondNeg negates v if cond == 1 and leaves it unchanged if cond == 0. 

#### <a id="projCached.FromP3" href="#projCached.FromP3">func (v *projCached) FromP3(p *Point) *projCached</a>

```
searchKey: edwards25519.projCached.FromP3
tags: [method private]
```

```Go
func (v *projCached) FromP3(p *Point) *projCached
```

#### <a id="projCached.Select" href="#projCached.Select">func (v *projCached) Select(a, b *projCached, cond int) *projCached</a>

```
searchKey: edwards25519.projCached.Select
tags: [method private]
```

```Go
func (v *projCached) Select(a, b *projCached, cond int) *projCached
```

Select sets v to a if cond == 1 and to b if cond == 0. 

#### <a id="projCached.Zero" href="#projCached.Zero">func (v *projCached) Zero() *projCached</a>

```
searchKey: edwards25519.projCached.Zero
tags: [function private]
```

```Go
func (v *projCached) Zero() *projCached
```

### <a id="projLookupTable" href="#projLookupTable">type projLookupTable struct</a>

```
searchKey: edwards25519.projLookupTable
tags: [struct private]
```

```Go
type projLookupTable struct {
	points [8]projCached
}
```

A dynamic lookup table for variable-base, constant-time scalar muls. 

#### <a id="projLookupTable.FromP3" href="#projLookupTable.FromP3">func (v *projLookupTable) FromP3(q *Point)</a>

```
searchKey: edwards25519.projLookupTable.FromP3
tags: [method private]
```

```Go
func (v *projLookupTable) FromP3(q *Point)
```

Builds a lookup table at runtime. Fast. 

#### <a id="projLookupTable.SelectInto" href="#projLookupTable.SelectInto">func (v *projLookupTable) SelectInto(dest *projCached, x int8)</a>

```
searchKey: edwards25519.projLookupTable.SelectInto
tags: [method private]
```

```Go
func (v *projLookupTable) SelectInto(dest *projCached, x int8)
```

Set dest to x*Q, where -8 <= x <= 8, in constant time. 

### <a id="projP1xP1" href="#projP1xP1">type projP1xP1 struct</a>

```
searchKey: edwards25519.projP1xP1
tags: [struct private]
```

```Go
type projP1xP1 struct {
	X, Y, Z, T field.Element
}
```

#### <a id="projP1xP1.Add" href="#projP1xP1.Add">func (v *projP1xP1) Add(p *Point, q *projCached) *projP1xP1</a>

```
searchKey: edwards25519.projP1xP1.Add
tags: [method private]
```

```Go
func (v *projP1xP1) Add(p *Point, q *projCached) *projP1xP1
```

#### <a id="projP1xP1.AddAffine" href="#projP1xP1.AddAffine">func (v *projP1xP1) AddAffine(p *Point, q *affineCached) *projP1xP1</a>

```
searchKey: edwards25519.projP1xP1.AddAffine
tags: [method private]
```

```Go
func (v *projP1xP1) AddAffine(p *Point, q *affineCached) *projP1xP1
```

#### <a id="projP1xP1.Double" href="#projP1xP1.Double">func (v *projP1xP1) Double(p *projP2) *projP1xP1</a>

```
searchKey: edwards25519.projP1xP1.Double
tags: [method private]
```

```Go
func (v *projP1xP1) Double(p *projP2) *projP1xP1
```

#### <a id="projP1xP1.Sub" href="#projP1xP1.Sub">func (v *projP1xP1) Sub(p *Point, q *projCached) *projP1xP1</a>

```
searchKey: edwards25519.projP1xP1.Sub
tags: [method private]
```

```Go
func (v *projP1xP1) Sub(p *Point, q *projCached) *projP1xP1
```

#### <a id="projP1xP1.SubAffine" href="#projP1xP1.SubAffine">func (v *projP1xP1) SubAffine(p *Point, q *affineCached) *projP1xP1</a>

```
searchKey: edwards25519.projP1xP1.SubAffine
tags: [method private]
```

```Go
func (v *projP1xP1) SubAffine(p *Point, q *affineCached) *projP1xP1
```

### <a id="projP2" href="#projP2">type projP2 struct</a>

```
searchKey: edwards25519.projP2
tags: [struct private]
```

```Go
type projP2 struct {
	X, Y, Z field.Element
}
```

#### <a id="projP2.FromP1xP1" href="#projP2.FromP1xP1">func (v *projP2) FromP1xP1(p *projP1xP1) *projP2</a>

```
searchKey: edwards25519.projP2.FromP1xP1
tags: [method private]
```

```Go
func (v *projP2) FromP1xP1(p *projP1xP1) *projP2
```

#### <a id="projP2.FromP3" href="#projP2.FromP3">func (v *projP2) FromP3(p *Point) *projP2</a>

```
searchKey: edwards25519.projP2.FromP3
tags: [method private]
```

```Go
func (v *projP2) FromP3(p *Point) *projP2
```

#### <a id="projP2.Zero" href="#projP2.Zero">func (v *projP2) Zero() *projP2</a>

```
searchKey: edwards25519.projP2.Zero
tags: [function private]
```

```Go
func (v *projP2) Zero() *projP2
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="BenchmarkScalarBaseMult" href="#BenchmarkScalarBaseMult">func BenchmarkScalarBaseMult(t *testing.B)</a>

```
searchKey: edwards25519.BenchmarkScalarBaseMult
tags: [method private benchmark]
```

```Go
func BenchmarkScalarBaseMult(t *testing.B)
```

### <a id="BenchmarkScalarMult" href="#BenchmarkScalarMult">func BenchmarkScalarMult(t *testing.B)</a>

```
searchKey: edwards25519.BenchmarkScalarMult
tags: [method private benchmark]
```

```Go
func BenchmarkScalarMult(t *testing.B)
```

### <a id="BenchmarkVarTimeDoubleScalarBaseMult" href="#BenchmarkVarTimeDoubleScalarBaseMult">func BenchmarkVarTimeDoubleScalarBaseMult(t *testing.B)</a>

```
searchKey: edwards25519.BenchmarkVarTimeDoubleScalarBaseMult
tags: [method private benchmark]
```

```Go
func BenchmarkVarTimeDoubleScalarBaseMult(t *testing.B)
```

### <a id="TestAddSubNegOnBasePoint" href="#TestAddSubNegOnBasePoint">func TestAddSubNegOnBasePoint(t *testing.T)</a>

```
searchKey: edwards25519.TestAddSubNegOnBasePoint
tags: [method private test]
```

```Go
func TestAddSubNegOnBasePoint(t *testing.T)
```

### <a id="TestAffineLookupTable" href="#TestAffineLookupTable">func TestAffineLookupTable(t *testing.T)</a>

```
searchKey: edwards25519.TestAffineLookupTable
tags: [method private test]
```

```Go
func TestAffineLookupTable(t *testing.T)
```

### <a id="TestAllocations" href="#TestAllocations">func TestAllocations(t *testing.T)</a>

```
searchKey: edwards25519.TestAllocations
tags: [method private test]
```

```Go
func TestAllocations(t *testing.T)
```

### <a id="TestBaseMultVsDalek" href="#TestBaseMultVsDalek">func TestBaseMultVsDalek(t *testing.T)</a>

```
searchKey: edwards25519.TestBaseMultVsDalek
tags: [method private test]
```

```Go
func TestBaseMultVsDalek(t *testing.T)
```

### <a id="TestBasepointNafTableGeneration" href="#TestBasepointNafTableGeneration">func TestBasepointNafTableGeneration(t *testing.T)</a>

```
searchKey: edwards25519.TestBasepointNafTableGeneration
tags: [method private test]
```

```Go
func TestBasepointNafTableGeneration(t *testing.T)
```

### <a id="TestBasepointTableGeneration" href="#TestBasepointTableGeneration">func TestBasepointTableGeneration(t *testing.T)</a>

```
searchKey: edwards25519.TestBasepointTableGeneration
tags: [method private test]
```

```Go
func TestBasepointTableGeneration(t *testing.T)
```

### <a id="TestComparable" href="#TestComparable">func TestComparable(t *testing.T)</a>

```
searchKey: edwards25519.TestComparable
tags: [method private test]
```

```Go
func TestComparable(t *testing.T)
```

### <a id="TestGenerator" href="#TestGenerator">func TestGenerator(t *testing.T)</a>

```
searchKey: edwards25519.TestGenerator
tags: [method private test]
```

```Go
func TestGenerator(t *testing.T)
```

### <a id="TestInvalidEncodings" href="#TestInvalidEncodings">func TestInvalidEncodings(t *testing.T)</a>

```
searchKey: edwards25519.TestInvalidEncodings
tags: [method private test]
```

```Go
func TestInvalidEncodings(t *testing.T)
```

### <a id="TestNafLookupTable5" href="#TestNafLookupTable5">func TestNafLookupTable5(t *testing.T)</a>

```
searchKey: edwards25519.TestNafLookupTable5
tags: [method private test]
```

```Go
func TestNafLookupTable5(t *testing.T)
```

### <a id="TestNafLookupTable8" href="#TestNafLookupTable8">func TestNafLookupTable8(t *testing.T)</a>

```
searchKey: edwards25519.TestNafLookupTable8
tags: [method private test]
```

```Go
func TestNafLookupTable8(t *testing.T)
```

### <a id="TestNonCanonicalPoints" href="#TestNonCanonicalPoints">func TestNonCanonicalPoints(t *testing.T)</a>

```
searchKey: edwards25519.TestNonCanonicalPoints
tags: [method private test]
```

```Go
func TestNonCanonicalPoints(t *testing.T)
```

### <a id="TestProjLookupTable" href="#TestProjLookupTable">func TestProjLookupTable(t *testing.T)</a>

```
searchKey: edwards25519.TestProjLookupTable
tags: [method private test]
```

```Go
func TestProjLookupTable(t *testing.T)
```

### <a id="TestScalarAddLikeSubNeg" href="#TestScalarAddLikeSubNeg">func TestScalarAddLikeSubNeg(t *testing.T)</a>

```
searchKey: edwards25519.TestScalarAddLikeSubNeg
tags: [method private test]
```

```Go
func TestScalarAddLikeSubNeg(t *testing.T)
```

### <a id="TestScalarAliasing" href="#TestScalarAliasing">func TestScalarAliasing(t *testing.T)</a>

```
searchKey: edwards25519.TestScalarAliasing
tags: [method private test]
```

```Go
func TestScalarAliasing(t *testing.T)
```

### <a id="TestScalarEqual" href="#TestScalarEqual">func TestScalarEqual(t *testing.T)</a>

```
searchKey: edwards25519.TestScalarEqual
tags: [method private test]
```

```Go
func TestScalarEqual(t *testing.T)
```

### <a id="TestScalarGenerate" href="#TestScalarGenerate">func TestScalarGenerate(t *testing.T)</a>

```
searchKey: edwards25519.TestScalarGenerate
tags: [method private test]
```

```Go
func TestScalarGenerate(t *testing.T)
```

### <a id="TestScalarMultDistributesOverAdd" href="#TestScalarMultDistributesOverAdd">func TestScalarMultDistributesOverAdd(t *testing.T)</a>

```
searchKey: edwards25519.TestScalarMultDistributesOverAdd
tags: [method private test]
```

```Go
func TestScalarMultDistributesOverAdd(t *testing.T)
```

### <a id="TestScalarMultMatchesBaseMult" href="#TestScalarMultMatchesBaseMult">func TestScalarMultMatchesBaseMult(t *testing.T)</a>

```
searchKey: edwards25519.TestScalarMultMatchesBaseMult
tags: [method private test]
```

```Go
func TestScalarMultMatchesBaseMult(t *testing.T)
```

### <a id="TestScalarMultNonIdentityPoint" href="#TestScalarMultNonIdentityPoint">func TestScalarMultNonIdentityPoint(t *testing.T)</a>

```
searchKey: edwards25519.TestScalarMultNonIdentityPoint
tags: [method private test]
```

```Go
func TestScalarMultNonIdentityPoint(t *testing.T)
```

### <a id="TestScalarMultSmallScalars" href="#TestScalarMultSmallScalars">func TestScalarMultSmallScalars(t *testing.T)</a>

```
searchKey: edwards25519.TestScalarMultSmallScalars
tags: [method private test]
```

```Go
func TestScalarMultSmallScalars(t *testing.T)
```

### <a id="TestScalarMultVsDalek" href="#TestScalarMultVsDalek">func TestScalarMultVsDalek(t *testing.T)</a>

```
searchKey: edwards25519.TestScalarMultVsDalek
tags: [method private test]
```

```Go
func TestScalarMultVsDalek(t *testing.T)
```

### <a id="TestScalarMultiplyDistributesOverAdd" href="#TestScalarMultiplyDistributesOverAdd">func TestScalarMultiplyDistributesOverAdd(t *testing.T)</a>

```
searchKey: edwards25519.TestScalarMultiplyDistributesOverAdd
tags: [method private test]
```

```Go
func TestScalarMultiplyDistributesOverAdd(t *testing.T)
```

### <a id="TestScalarNonAdjacentForm" href="#TestScalarNonAdjacentForm">func TestScalarNonAdjacentForm(t *testing.T)</a>

```
searchKey: edwards25519.TestScalarNonAdjacentForm
tags: [method private test]
```

```Go
func TestScalarNonAdjacentForm(t *testing.T)
```

### <a id="TestScalarSetBytesWithClamping" href="#TestScalarSetBytesWithClamping">func TestScalarSetBytesWithClamping(t *testing.T)</a>

```
searchKey: edwards25519.TestScalarSetBytesWithClamping
tags: [method private test]
```

```Go
func TestScalarSetBytesWithClamping(t *testing.T)
```

### <a id="TestScalarSetCanonicalBytes" href="#TestScalarSetCanonicalBytes">func TestScalarSetCanonicalBytes(t *testing.T)</a>

```
searchKey: edwards25519.TestScalarSetCanonicalBytes
tags: [method private test]
```

```Go
func TestScalarSetCanonicalBytes(t *testing.T)
```

### <a id="TestScalarSetUniformBytes" href="#TestScalarSetUniformBytes">func TestScalarSetUniformBytes(t *testing.T)</a>

```
searchKey: edwards25519.TestScalarSetUniformBytes
tags: [method private test]
```

```Go
func TestScalarSetUniformBytes(t *testing.T)
```

### <a id="TestVarTimeDoubleBaseMultMatchesBaseMult" href="#TestVarTimeDoubleBaseMultMatchesBaseMult">func TestVarTimeDoubleBaseMultMatchesBaseMult(t *testing.T)</a>

```
searchKey: edwards25519.TestVarTimeDoubleBaseMultMatchesBaseMult
tags: [method private test]
```

```Go
func TestVarTimeDoubleBaseMultMatchesBaseMult(t *testing.T)
```

### <a id="TestVarTimeDoubleBaseMultVsDalek" href="#TestVarTimeDoubleBaseMultVsDalek">func TestVarTimeDoubleBaseMultVsDalek(t *testing.T)</a>

```
searchKey: edwards25519.TestVarTimeDoubleBaseMultVsDalek
tags: [method private test]
```

```Go
func TestVarTimeDoubleBaseMultVsDalek(t *testing.T)
```

### <a id="basepointTable" href="#basepointTable">func basepointTable() *[32]affineLookupTable</a>

```
searchKey: edwards25519.basepointTable
tags: [function private]
```

```Go
func basepointTable() *[32]affineLookupTable
```

basepointTable is a set of 32 affineLookupTables, where table i is generated from 256i * basepoint. It is precomputed the first time it's used. 

### <a id="bigIntFromLittleEndianBytes" href="#bigIntFromLittleEndianBytes">func bigIntFromLittleEndianBytes(b []byte) *big.Int</a>

```
searchKey: edwards25519.bigIntFromLittleEndianBytes
tags: [method private]
```

```Go
func bigIntFromLittleEndianBytes(b []byte) *big.Int
```

### <a id="checkInitialized" href="#checkInitialized">func checkInitialized(points ...*Point)</a>

```
searchKey: edwards25519.checkInitialized
tags: [method private]
```

```Go
func checkInitialized(points ...*Point)
```

### <a id="checkOnCurve" href="#checkOnCurve">func checkOnCurve(t *testing.T, points ...*Point)</a>

```
searchKey: edwards25519.checkOnCurve
tags: [method private]
```

```Go
func checkOnCurve(t *testing.T, points ...*Point)
```

### <a id="copyFieldElement" href="#copyFieldElement">func copyFieldElement(buf *[32]byte, v *field.Element) []byte</a>

```
searchKey: edwards25519.copyFieldElement
tags: [method private]
```

```Go
func copyFieldElement(buf *[32]byte, v *field.Element) []byte
```

### <a id="decodeHex" href="#decodeHex">func decodeHex(s string) []byte</a>

```
searchKey: edwards25519.decodeHex
tags: [method private]
```

```Go
func decodeHex(s string) []byte
```

### <a id="isReduced" href="#isReduced">func isReduced(s *Scalar) bool</a>

```
searchKey: edwards25519.isReduced
tags: [method private]
```

```Go
func isReduced(s *Scalar) bool
```

isReduced returns whether the given scalar is reduced modulo l. 

### <a id="load3" href="#load3">func load3(in []byte) int64</a>

```
searchKey: edwards25519.load3
tags: [method private]
```

```Go
func load3(in []byte) int64
```

### <a id="load4" href="#load4">func load4(in []byte) int64</a>

```
searchKey: edwards25519.load4
tags: [method private]
```

```Go
func load4(in []byte) int64
```

### <a id="scMulAdd" href="#scMulAdd">func scMulAdd(s, a, b, c *[32]byte)</a>

```
searchKey: edwards25519.scMulAdd
tags: [method private]
```

```Go
func scMulAdd(s, a, b, c *[32]byte)
```

Input: 

```
a[0]+256*a[1]+...+256^31*a[31] = a
b[0]+256*b[1]+...+256^31*b[31] = b
c[0]+256*c[1]+...+256^31*c[31] = c

```
Output: 

```
s[0]+256*s[1]+...+256^31*s[31] = (ab+c) mod l
where l = 2^252 + 27742317777372353535851937790883648493.

```
### <a id="scReduce" href="#scReduce">func scReduce(out *[32]byte, s *[64]byte)</a>

```
searchKey: edwards25519.scReduce
tags: [method private]
```

```Go
func scReduce(out *[32]byte, s *[64]byte)
```

Input: 

```
s[0]+256*s[1]+...+256^63*s[63] = s

```
Output: 

```
s[0]+256*s[1]+...+256^31*s[31] = s mod l
where l = 2^252 + 27742317777372353535851937790883648493.

```
