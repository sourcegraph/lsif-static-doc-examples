# Package elliptic

Package elliptic implements several standard elliptic curves over prime fields. 

## Index

* Subpages
  * [crypto/elliptic/internal](elliptic/internal.md)
* [Constants](#const)
    * [const bottom12Bits](#bottom12Bits)
    * [const bottom28Bits](#bottom28Bits)
    * [const two31m15m3](#two31m15m3)
    * [const two31m3](#two31m3)
    * [const two31p3](#two31p3)
    * [const two63m35](#two63m35)
    * [const two63m35m19](#two63m35m19)
    * [const two63p35](#two63p35)
* [Variables](#var)
    * [var initonce](#initonce)
    * [var mask](#mask)
    * [var p224](#p224)
    * [var p224BaseMultTests](#p224BaseMultTests)
    * [var p224P](#p224P)
    * [var p224ZeroModP31](#p224ZeroModP31)
    * [var p224ZeroModP63](#p224ZeroModP63)
    * [var p256](#p256)
    * [var p256MultTests](#p256MultTests)
    * [var p256Precomputed](#p256Precomputed)
    * [var p384](#p384)
    * [var p521](#p521)
    * [var p521Params](#p521Params)
    * [var quickCheckConfig32](#quickCheckConfig32)
    * [var rr](#rr)
    * [var toFromBigTests](#toFromBigTests)
    * [var weirdLimbs](#weirdLimbs)
* [Types](#type)
    * [type Curve interface](#Curve)
        * [func P224() Curve](#P224)
        * [func P256() Curve](#P256)
        * [func P384() Curve](#P384)
        * [func P521() Curve](#P521)
        * [func matchesSpecificCurve(params *CurveParams, available ...Curve) (Curve, bool)](#matchesSpecificCurve)
    * [type CurveParams struct](#CurveParams)
        * [func genericParamsForCurve(c Curve) *CurveParams](#genericParamsForCurve)
        * [func (curve *CurveParams) Add(x1, y1, x2, y2 *big.Int) (*big.Int, *big.Int)](#CurveParams.Add)
        * [func (curve *CurveParams) Double(x1, y1 *big.Int) (*big.Int, *big.Int)](#CurveParams.Double)
        * [func (curve *CurveParams) IsOnCurve(x, y *big.Int) bool](#CurveParams.IsOnCurve)
        * [func (curve *CurveParams) Params() *CurveParams](#CurveParams.Params)
        * [func (curve *CurveParams) ScalarBaseMult(k []byte) (*big.Int, *big.Int)](#CurveParams.ScalarBaseMult)
        * [func (curve *CurveParams) ScalarMult(Bx, By *big.Int, k []byte) (*big.Int, *big.Int)](#CurveParams.ScalarMult)
        * [func (curve *CurveParams) addJacobian(x1, y1, z1, x2, y2, z2 *big.Int) (*big.Int, *big.Int, *big.Int)](#CurveParams.addJacobian)
        * [func (curve *CurveParams) affineFromJacobian(x, y, z *big.Int) (xOut, yOut *big.Int)](#CurveParams.affineFromJacobian)
        * [func (curve *CurveParams) doubleJacobian(x, y, z *big.Int) (*big.Int, *big.Int, *big.Int)](#CurveParams.doubleJacobian)
        * [func (curve *CurveParams) polynomial(x *big.Int) *big.Int](#CurveParams.polynomial)
    * [type baseMultTest struct](#baseMultTest)
    * [type p224Curve struct](#p224Curve)
        * [func (p224Curve) Add(bigX1, bigY1, bigX2, bigY2 *big.Int) (x, y *big.Int)](#p224Curve.Add)
        * [func (p224Curve) Double(bigX1, bigY1 *big.Int) (x, y *big.Int)](#p224Curve.Double)
        * [func (curve p224Curve) IsOnCurve(bigX, bigY *big.Int) bool](#p224Curve.IsOnCurve)
        * [func (curve p224Curve) Params() *CurveParams](#p224Curve.Params)
        * [func (curve p224Curve) ScalarBaseMult(scalar []byte) (x, y *big.Int)](#p224Curve.ScalarBaseMult)
        * [func (p224Curve) ScalarMult(bigX1, bigY1 *big.Int, scalar []byte) (x, y *big.Int)](#p224Curve.ScalarMult)
    * [type p224FieldElement [8]uint32](#p224FieldElement)
        * [func (p224FieldElement) Generate(rand *rand.Rand, size int) reflect.Value](#p224FieldElement.Generate)
    * [type p224LargeFieldElement [15]uint64](#p224LargeFieldElement)
    * [type p256Curve struct](#p256Curve)
        * [func (curve p256Curve) CombinedMult(bigX, bigY *big.Int, baseScalar, scalar []byte) (x, y *big.Int)](#p256Curve.CombinedMult)
        * [func (curve p256Curve) Inverse(k *big.Int) *big.Int](#p256Curve.Inverse)
        * [func (curve p256Curve) Params() *CurveParams](#p256Curve.Params)
        * [func (curve p256Curve) ScalarBaseMult(scalar []byte) (x, y *big.Int)](#p256Curve.ScalarBaseMult)
        * [func (curve p256Curve) ScalarMult(bigX, bigY *big.Int, scalar []byte) (x, y *big.Int)](#p256Curve.ScalarMult)
    * [type p256Point struct](#p256Point)
        * [func (p *p256Point) CopyConditional(src *p256Point, v int)](#p256Point.CopyConditional)
        * [func (p *p256Point) p256BaseMult(scalar []uint64)](#p256Point.p256BaseMult)
        * [func (p *p256Point) p256PointToAffine() (x, y *big.Int)](#p256Point.p256PointToAffine)
        * [func (p *p256Point) p256ScalarMult(scalar []uint64)](#p256Point.p256ScalarMult)
        * [func (p *p256Point) p256StorePoint(r *[16 * 4 * 3]uint64, index int)](#p256Point.p256StorePoint)
    * [type p521Curve struct](#p521Curve)
        * [func (curve p521Curve) Add(x1, y1, x2, y2 *big.Int) (*big.Int, *big.Int)](#p521Curve.Add)
        * [func (curve p521Curve) Double(x1, y1 *big.Int) (*big.Int, *big.Int)](#p521Curve.Double)
        * [func (curve p521Curve) IsOnCurve(x, y *big.Int) bool](#p521Curve.IsOnCurve)
        * [func (curve p521Curve) Params() *CurveParams](#p521Curve.Params)
        * [func (curve p521Curve) ScalarBaseMult(k []byte) (*big.Int, *big.Int)](#p521Curve.ScalarBaseMult)
        * [func (curve p521Curve) ScalarMult(Bx, By *big.Int, scalar []byte) (*big.Int, *big.Int)](#p521Curve.ScalarMult)
        * [func (curve p521Curve) affineFromJacobian(p *p521Point) (x, y *big.Int)](#p521Curve.affineFromJacobian)
        * [func (curve p521Curve) jacobianFromAffine(x, y *big.Int) *p521Point](#p521Curve.jacobianFromAffine)
    * [type p521Point struct](#p521Point)
        * [func (q *p521Point) addJacobian(p1, p2 *p521Point) *p521Point](#p521Point.addJacobian)
        * [func (q *p521Point) doubleJacobian(p *p521Point) *p521Point](#p521Point.doubleJacobian)
    * [type scalarMultTest struct](#scalarMultTest)
    * [type synthCombinedMult struct](#synthCombinedMult)
        * [func (s synthCombinedMult) CombinedMult(bigX, bigY *big.Int, baseScalar, scalar []byte) (x, y *big.Int)](#synthCombinedMult.CombinedMult)
* [Functions](#func)
    * [func BenchmarkScalarBaseMult(b *testing.B)](#BenchmarkScalarBaseMult)
    * [func BenchmarkScalarMult(b *testing.B)](#BenchmarkScalarMult)
    * [func GenerateKey(curve Curve, rand io.Reader) (priv []byte, x, y *big.Int, err error)](#GenerateKey)
    * [func Marshal(curve Curve, x, y *big.Int) []byte](#Marshal)
    * [func MarshalCompressed(curve Curve, x, y *big.Int) []byte](#MarshalCompressed)
    * [func TestFuzz(t *testing.T)](#TestFuzz)
    * [func TestInfinity(t *testing.T)](#TestInfinity)
    * [func TestMarshal(t *testing.T)](#TestMarshal)
    * [func TestMarshalCompressed(t *testing.T)](#TestMarshalCompressed)
    * [func TestOffCurve(t *testing.T)](#TestOffCurve)
    * [func TestOnCurve(t *testing.T)](#TestOnCurve)
    * [func TestP224Add(t *testing.T)](#TestP224Add)
    * [func TestP224BaseMult(t *testing.T)](#TestP224BaseMult)
    * [func TestP224Contract(t *testing.T)](#TestP224Contract)
    * [func TestP224GenericBaseMult(t *testing.T)](#TestP224GenericBaseMult)
    * [func TestP224Invert(t *testing.T)](#TestP224Invert)
    * [func TestP224IsZero(t *testing.T)](#TestP224IsZero)
    * [func TestP224Mul(t *testing.T)](#TestP224Mul)
    * [func TestP224Overflow(t *testing.T)](#TestP224Overflow)
    * [func TestP224Reduce(t *testing.T)](#TestP224Reduce)
    * [func TestP224Square(t *testing.T)](#TestP224Square)
    * [func TestP224ToFromBig(t *testing.T)](#TestP224ToFromBig)
    * [func TestP256BaseMult(t *testing.T)](#TestP256BaseMult)
    * [func TestP256CombinedMult(t *testing.T)](#TestP256CombinedMult)
    * [func TestP256Mult(t *testing.T)](#TestP256Mult)
    * [func TestP256PrecomputedTable(t *testing.T)](#TestP256PrecomputedTable)
    * [func TestUnmarshalToLargeCoordinates(t *testing.T)](#TestUnmarshalToLargeCoordinates)
    * [func Unmarshal(curve Curve, data []byte) (x, y *big.Int)](#Unmarshal)
    * [func UnmarshalCompressed(curve Curve, data []byte) (x, y *big.Int)](#UnmarshalCompressed)
    * [func benchmarkAllCurves(t *testing.B, f func(*testing.B, Curve))](#benchmarkAllCurves)
    * [func bigIntToFiatP521(x *big.Int) *fiat.P521Element](#bigIntToFiatP521)
    * [func boothW5(in uint) (int, int)](#boothW5)
    * [func boothW6(in uint) (int, int)](#boothW6)
    * [func fiatP521ToBigInt(x *fiat.P521Element) *big.Int](#fiatP521ToBigInt)
    * [func fromBig(out []uint64, big *big.Int)](#fromBig)
    * [func generateLimb(rand *rand.Rand) uint32](#generateLimb)
    * [func get28BitsFromEnd(buf []byte, shift uint) (uint32, []byte)](#get28BitsFromEnd)
    * [func initAll()](#initAll)
    * [func initP224()](#initP224)
    * [func initP256()](#initP256)
    * [func initP384()](#initP384)
    * [func initP521()](#initP521)
    * [func isInBounds(x *p224FieldElement) bool](#isInBounds)
    * [func maybeReduceModP(in *big.Int) *big.Int](#maybeReduceModP)
    * [func p224Add(out, a, b *p224FieldElement)](#p224Add)
    * [func p224AddJacobian(x3, y3, z3, x1, y1, z1, x2, y2, z2 *p224FieldElement)](#p224AddJacobian)
    * [func p224AlternativeToBig(in *p224FieldElement) *big.Int](#p224AlternativeToBig)
    * [func p224Contract(out, in *p224FieldElement)](#p224Contract)
    * [func p224CopyConditional(out, in *p224FieldElement, control uint32)](#p224CopyConditional)
    * [func p224DoubleJacobian(x3, y3, z3, x1, y1, z1 *p224FieldElement)](#p224DoubleJacobian)
    * [func p224FromBig(out *p224FieldElement, in *big.Int)](#p224FromBig)
    * [func p224Invert(out, in *p224FieldElement)](#p224Invert)
    * [func p224IsZero(a *p224FieldElement) uint32](#p224IsZero)
    * [func p224Mul(out, a, b *p224FieldElement, tmp *p224LargeFieldElement)](#p224Mul)
    * [func p224Reduce(a *p224FieldElement)](#p224Reduce)
    * [func p224ReduceLarge(out *p224FieldElement, in *p224LargeFieldElement)](#p224ReduceLarge)
    * [func p224ScalarMult(outX, outY, outZ, inX, inY, inZ *p224FieldElement, scalar []byte)](#p224ScalarMult)
    * [func p224Square(out, a *p224FieldElement, tmp *p224LargeFieldElement)](#p224Square)
    * [func p224Sub(out, a, b *p224FieldElement)](#p224Sub)
    * [func p224ToAffine(x, y, z *p224FieldElement) (*big.Int, *big.Int)](#p224ToAffine)
    * [func p224ToBig(in *p224FieldElement) *big.Int](#p224ToBig)
    * [func p256BigToLittle(res []uint64, in []byte)](#p256BigToLittle)
    * [func p256FromMont(res, in []uint64)](#p256FromMont)
    * [func p256GetScalar(out []uint64, in []byte)](#p256GetScalar)
    * [func p256Inverse(out, in []uint64)](#p256Inverse)
    * [func p256LittleToBig(res []byte, in []uint64)](#p256LittleToBig)
    * [func p256MovCond(res, a, b []uint64, cond int)](#p256MovCond)
    * [func p256Mul(res, in1, in2 []uint64)](#p256Mul)
    * [func p256NegCond(val []uint64, cond int)](#p256NegCond)
    * [func p256OrdMul(res, in1, in2 []uint64)](#p256OrdMul)
    * [func p256OrdSqr(res, in []uint64, n int)](#p256OrdSqr)
    * [func p256PointAddAffineAsm(res, in1, in2 []uint64, sign, sel, zero int)](#p256PointAddAffineAsm)
    * [func p256PointAddAsm(res, in1, in2 []uint64) int](#p256PointAddAsm)
    * [func p256PointDoubleAsm(res, in []uint64)](#p256PointDoubleAsm)
    * [func p256Select(point, table []uint64, idx int)](#p256Select)
    * [func p256SelectBase(point, table []uint64, idx int)](#p256SelectBase)
    * [func p256Sqr(res, in []uint64, n int)](#p256Sqr)
    * [func scalarIsZero(scalar []uint64) int](#scalarIsZero)
    * [func testAllCurves(t *testing.T, f func(*testing.T, Curve))](#testAllCurves)
    * [func testInfinity(t *testing.T, curve Curve)](#testInfinity)
    * [func testMarshalCompressed(t *testing.T, curve Curve, x, y *big.Int, want []byte)](#testMarshalCompressed)
    * [func testUnmarshalToLargeCoordinates(t *testing.T, curve Curve)](#testUnmarshalToLargeCoordinates)
    * [func uint64IsZero(x uint64) int](#uint64IsZero)
    * [func zForAffine(x, y *big.Int) *big.Int](#zForAffine)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="bottom12Bits" href="#bottom12Bits">const bottom12Bits</a>

```
searchKey: elliptic.bottom12Bits
tags: [constant number private]
```

```Go
const bottom12Bits = 0xfff
```

### <a id="bottom28Bits" href="#bottom28Bits">const bottom28Bits</a>

```
searchKey: elliptic.bottom28Bits
tags: [constant number private]
```

```Go
const bottom28Bits = 0xfffffff
```

### <a id="two31m15m3" href="#two31m15m3">const two31m15m3</a>

```
searchKey: elliptic.two31m15m3
tags: [constant number private]
```

```Go
const two31m15m3 = 1<<31 - 1<<15 - 1<<3
```

### <a id="two31m3" href="#two31m3">const two31m3</a>

```
searchKey: elliptic.two31m3
tags: [constant number private]
```

```Go
const two31m3 = 1<<31 - 1<<3
```

### <a id="two31p3" href="#two31p3">const two31p3</a>

```
searchKey: elliptic.two31p3
tags: [constant number private]
```

```Go
const two31p3 = 1<<31 + 1<<3
```

### <a id="two63m35" href="#two63m35">const two63m35</a>

```
searchKey: elliptic.two63m35
tags: [constant number private]
```

```Go
const two63m35 = 1<<63 - 1<<35
```

### <a id="two63m35m19" href="#two63m35m19">const two63m35m19</a>

```
searchKey: elliptic.two63m35m19
tags: [constant number private]
```

```Go
const two63m35m19 = 1<<63 - 1<<35 - 1<<19
```

### <a id="two63p35" href="#two63p35">const two63p35</a>

```
searchKey: elliptic.two63p35
tags: [constant number private]
```

```Go
const two63p35 = 1<<63 + 1<<35
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="initonce" href="#initonce">var initonce</a>

```
searchKey: elliptic.initonce
tags: [variable struct private]
```

```Go
var initonce sync.Once
```

### <a id="mask" href="#mask">var mask</a>

```
searchKey: elliptic.mask
tags: [variable array number private]
```

```Go
var mask = []byte{0xff, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f}
```

### <a id="p224" href="#p224">var p224</a>

```
searchKey: elliptic.p224
tags: [variable struct private]
```

```Go
var p224 p224Curve
```

### <a id="p224BaseMultTests" href="#p224BaseMultTests">var p224BaseMultTests</a>

```
searchKey: elliptic.p224BaseMultTests
tags: [variable array struct private]
```

```Go
var p224BaseMultTests = ...
```

### <a id="p224P" href="#p224P">var p224P</a>

```
searchKey: elliptic.p224P
tags: [variable array number private]
```

```Go
var p224P = [8]uint32{1, 0, 0, 0xffff000, 0xfffffff, 0xfffffff, 0xfffffff, 0xfffffff}
```

p224P is the order of the field, represented as a p224FieldElement. 

### <a id="p224ZeroModP31" href="#p224ZeroModP31">var p224ZeroModP31</a>

```
searchKey: elliptic.p224ZeroModP31
tags: [variable array number private]
```

```Go
var p224ZeroModP31 = ...
```

p224ZeroModP31 is 0 mod p where bit 31 is set in all limbs so that we can subtract smaller amounts without underflow. See the section "Subtraction" in [1] for reasoning. 

### <a id="p224ZeroModP63" href="#p224ZeroModP63">var p224ZeroModP63</a>

```
searchKey: elliptic.p224ZeroModP63
tags: [variable array number private]
```

```Go
var p224ZeroModP63 = ...
```

p224ZeroModP63 is 0 mod p where bit 63 is set in all limbs. See the section "Subtraction" in [1] for why. 

### <a id="p256" href="#p256">var p256</a>

```
searchKey: elliptic.p256
tags: [variable struct private]
```

```Go
var p256 p256Curve
```

### <a id="p256MultTests" href="#p256MultTests">var p256MultTests</a>

```
searchKey: elliptic.p256MultTests
tags: [variable array struct private]
```

```Go
var p256MultTests = ...
```

### <a id="p256Precomputed" href="#p256Precomputed">var p256Precomputed</a>

```
searchKey: elliptic.p256Precomputed
tags: [variable array array number private]
```

```Go
var p256Precomputed = ...
```

### <a id="p384" href="#p384">var p384</a>

```
searchKey: elliptic.p384
tags: [variable struct private]
```

```Go
var p384 *CurveParams
```

### <a id="p521" href="#p521">var p521</a>

```
searchKey: elliptic.p521
tags: [variable struct private]
```

```Go
var p521 p521Curve
```

### <a id="p521Params" href="#p521Params">var p521Params</a>

```
searchKey: elliptic.p521Params
tags: [variable struct private]
```

```Go
var p521Params *CurveParams
```

### <a id="quickCheckConfig32" href="#quickCheckConfig32">var quickCheckConfig32</a>

```
searchKey: elliptic.quickCheckConfig32
tags: [variable struct private]
```

```Go
var quickCheckConfig32 = &quick.Config{MaxCountScale: 32}
```

quickCheckConfig32 will make each quickcheck test run (32 * -quickchecks) times. The default value of -quickchecks is 100. 

### <a id="rr" href="#rr">var rr</a>

```
searchKey: elliptic.rr
tags: [variable array number private]
```

```Go
var rr = []uint64{0x0000000000000003, 0xfffffffbffffffff, 0xfffffffffffffffe, 0x00000004fffffffd}
```

p256Mul operates in a Montgomery domain with R = 2^256 mod p, where p is the underlying field of the curve. (See initP256 for the value.) Thus rr here is R×R mod p. See comment in Inverse about how this is used. 

### <a id="toFromBigTests" href="#toFromBigTests">var toFromBigTests</a>

```
searchKey: elliptic.toFromBigTests
tags: [variable array string private]
```

```Go
var toFromBigTests = ...
```

### <a id="weirdLimbs" href="#weirdLimbs">var weirdLimbs</a>

```
searchKey: elliptic.weirdLimbs
tags: [variable array number private]
```

```Go
var weirdLimbs = ...
```

weirdLimbs can be combined to generate a range of edge-case field elements. 

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Curve" href="#Curve">type Curve interface</a>

```
searchKey: elliptic.Curve
tags: [interface]
```

```Go
type Curve interface {
	// Params returns the parameters for the curve.
	Params() *CurveParams
	// IsOnCurve reports whether the given (x,y) lies on the curve.
	IsOnCurve(x, y *big.Int) bool
	// Add returns the sum of (x1,y1) and (x2,y2)
	Add(x1, y1, x2, y2 *big.Int) (x, y *big.Int)
	// Double returns 2*(x,y)
	Double(x1, y1 *big.Int) (x, y *big.Int)
	// ScalarMult returns k*(Bx,By) where k is a number in big-endian form.
	ScalarMult(x1, y1 *big.Int, k []byte) (x, y *big.Int)
	// ScalarBaseMult returns k*G, where G is the base point of the group
	// and k is an integer in big-endian form.
	ScalarBaseMult(k []byte) (x, y *big.Int)
}
```

A Curve represents a short-form Weierstrass curve with a=-3. 

Note that the point at infinity (0, 0) is not considered on the curve, and although it can be returned by Add, Double, ScalarMult, or ScalarBaseMult, it can't be marshaled or unmarshaled, and IsOnCurve will return false for it. 

#### <a id="P224" href="#P224">func P224() Curve</a>

```
searchKey: elliptic.P224
tags: [function]
```

```Go
func P224() Curve
```

P224 returns a Curve which implements P-224 (see FIPS 186-3, section D.2.2). 

The cryptographic operations are implemented using constant-time algorithms. 

#### <a id="P256" href="#P256">func P256() Curve</a>

```
searchKey: elliptic.P256
tags: [function]
```

```Go
func P256() Curve
```

P256 returns a Curve which implements NIST P-256 (FIPS 186-3, section D.2.3), also known as secp256r1 or prime256v1. The CurveParams.Name of this Curve is "P-256". 

Multiple invocations of this function will return the same value, so it can be used for equality checks and switch statements. 

ScalarMult and ScalarBaseMult are implemented using constant-time algorithms. 

#### <a id="P384" href="#P384">func P384() Curve</a>

```
searchKey: elliptic.P384
tags: [function]
```

```Go
func P384() Curve
```

P384 returns a Curve which implements NIST P-384 (FIPS 186-3, section D.2.4), also known as secp384r1. The CurveParams.Name of this Curve is "P-384". 

Multiple invocations of this function will return the same value, so it can be used for equality checks and switch statements. 

The cryptographic operations do not use constant-time algorithms. 

#### <a id="P521" href="#P521">func P521() Curve</a>

```
searchKey: elliptic.P521
tags: [function]
```

```Go
func P521() Curve
```

P521 returns a Curve which implements NIST P-521 (FIPS 186-3, section D.2.5), also known as secp521r1. The CurveParams.Name of this Curve is "P-521". 

Multiple invocations of this function will return the same value, so it can be used for equality checks and switch statements. 

The cryptographic operations are implemented using constant-time algorithms. 

#### <a id="matchesSpecificCurve" href="#matchesSpecificCurve">func matchesSpecificCurve(params *CurveParams, available ...Curve) (Curve, bool)</a>

```
searchKey: elliptic.matchesSpecificCurve
tags: [method private]
```

```Go
func matchesSpecificCurve(params *CurveParams, available ...Curve) (Curve, bool)
```

### <a id="CurveParams" href="#CurveParams">type CurveParams struct</a>

```
searchKey: elliptic.CurveParams
tags: [struct]
```

```Go
type CurveParams struct {
	P       *big.Int // the order of the underlying field
	N       *big.Int // the order of the base point
	B       *big.Int // the constant of the curve equation
	Gx, Gy  *big.Int // (x,y) of the base point
	BitSize int      // the size of the underlying field
	Name    string   // the canonical name of the curve
}
```

CurveParams contains the parameters of an elliptic curve and also provides a generic, non-constant time implementation of Curve. 

#### <a id="genericParamsForCurve" href="#genericParamsForCurve">func genericParamsForCurve(c Curve) *CurveParams</a>

```
searchKey: elliptic.genericParamsForCurve
tags: [method private]
```

```Go
func genericParamsForCurve(c Curve) *CurveParams
```

genericParamsForCurve returns the dereferenced CurveParams for the specified curve. This is used to avoid the logic for upgrading a curve to it's specific implementation, forcing usage of the generic implementation. This is only relevant for the P224, P256, and P521 curves. 

#### <a id="CurveParams.Add" href="#CurveParams.Add">func (curve *CurveParams) Add(x1, y1, x2, y2 *big.Int) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.CurveParams.Add
tags: [method]
```

```Go
func (curve *CurveParams) Add(x1, y1, x2, y2 *big.Int) (*big.Int, *big.Int)
```

#### <a id="CurveParams.Double" href="#CurveParams.Double">func (curve *CurveParams) Double(x1, y1 *big.Int) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.CurveParams.Double
tags: [method]
```

```Go
func (curve *CurveParams) Double(x1, y1 *big.Int) (*big.Int, *big.Int)
```

#### <a id="CurveParams.IsOnCurve" href="#CurveParams.IsOnCurve">func (curve *CurveParams) IsOnCurve(x, y *big.Int) bool</a>

```
searchKey: elliptic.CurveParams.IsOnCurve
tags: [method]
```

```Go
func (curve *CurveParams) IsOnCurve(x, y *big.Int) bool
```

#### <a id="CurveParams.Params" href="#CurveParams.Params">func (curve *CurveParams) Params() *CurveParams</a>

```
searchKey: elliptic.CurveParams.Params
tags: [function]
```

```Go
func (curve *CurveParams) Params() *CurveParams
```

#### <a id="CurveParams.ScalarBaseMult" href="#CurveParams.ScalarBaseMult">func (curve *CurveParams) ScalarBaseMult(k []byte) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.CurveParams.ScalarBaseMult
tags: [method]
```

```Go
func (curve *CurveParams) ScalarBaseMult(k []byte) (*big.Int, *big.Int)
```

#### <a id="CurveParams.ScalarMult" href="#CurveParams.ScalarMult">func (curve *CurveParams) ScalarMult(Bx, By *big.Int, k []byte) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.CurveParams.ScalarMult
tags: [method]
```

```Go
func (curve *CurveParams) ScalarMult(Bx, By *big.Int, k []byte) (*big.Int, *big.Int)
```

#### <a id="CurveParams.addJacobian" href="#CurveParams.addJacobian">func (curve *CurveParams) addJacobian(x1, y1, z1, x2, y2, z2 *big.Int) (*big.Int, *big.Int, *big.Int)</a>

```
searchKey: elliptic.CurveParams.addJacobian
tags: [method private]
```

```Go
func (curve *CurveParams) addJacobian(x1, y1, z1, x2, y2, z2 *big.Int) (*big.Int, *big.Int, *big.Int)
```

addJacobian takes two points in Jacobian coordinates, (x1, y1, z1) and (x2, y2, z2) and returns their sum, also in Jacobian form. 

#### <a id="CurveParams.affineFromJacobian" href="#CurveParams.affineFromJacobian">func (curve *CurveParams) affineFromJacobian(x, y, z *big.Int) (xOut, yOut *big.Int)</a>

```
searchKey: elliptic.CurveParams.affineFromJacobian
tags: [method private]
```

```Go
func (curve *CurveParams) affineFromJacobian(x, y, z *big.Int) (xOut, yOut *big.Int)
```

affineFromJacobian reverses the Jacobian transform. See the comment at the top of the file. If the point is ∞ it returns 0, 0. 

#### <a id="CurveParams.doubleJacobian" href="#CurveParams.doubleJacobian">func (curve *CurveParams) doubleJacobian(x, y, z *big.Int) (*big.Int, *big.Int, *big.Int)</a>

```
searchKey: elliptic.CurveParams.doubleJacobian
tags: [method private]
```

```Go
func (curve *CurveParams) doubleJacobian(x, y, z *big.Int) (*big.Int, *big.Int, *big.Int)
```

doubleJacobian takes a point in Jacobian coordinates, (x, y, z), and returns its double, also in Jacobian form. 

#### <a id="CurveParams.polynomial" href="#CurveParams.polynomial">func (curve *CurveParams) polynomial(x *big.Int) *big.Int</a>

```
searchKey: elliptic.CurveParams.polynomial
tags: [method private]
```

```Go
func (curve *CurveParams) polynomial(x *big.Int) *big.Int
```

polynomial returns x³ - 3x + b. 

### <a id="baseMultTest" href="#baseMultTest">type baseMultTest struct</a>

```
searchKey: elliptic.baseMultTest
tags: [struct private]
```

```Go
type baseMultTest struct {
	k    string
	x, y string
}
```

### <a id="p224Curve" href="#p224Curve">type p224Curve struct</a>

```
searchKey: elliptic.p224Curve
tags: [struct private]
```

```Go
type p224Curve struct {
	*CurveParams
	gx, gy, b p224FieldElement
}
```

#### <a id="p224Curve.Add" href="#p224Curve.Add">func (p224Curve) Add(bigX1, bigY1, bigX2, bigY2 *big.Int) (x, y *big.Int)</a>

```
searchKey: elliptic.p224Curve.Add
tags: [method private]
```

```Go
func (p224Curve) Add(bigX1, bigY1, bigX2, bigY2 *big.Int) (x, y *big.Int)
```

#### <a id="p224Curve.Double" href="#p224Curve.Double">func (p224Curve) Double(bigX1, bigY1 *big.Int) (x, y *big.Int)</a>

```
searchKey: elliptic.p224Curve.Double
tags: [method private]
```

```Go
func (p224Curve) Double(bigX1, bigY1 *big.Int) (x, y *big.Int)
```

#### <a id="p224Curve.IsOnCurve" href="#p224Curve.IsOnCurve">func (curve p224Curve) IsOnCurve(bigX, bigY *big.Int) bool</a>

```
searchKey: elliptic.p224Curve.IsOnCurve
tags: [method private]
```

```Go
func (curve p224Curve) IsOnCurve(bigX, bigY *big.Int) bool
```

#### <a id="p224Curve.Params" href="#p224Curve.Params">func (curve p224Curve) Params() *CurveParams</a>

```
searchKey: elliptic.p224Curve.Params
tags: [function private]
```

```Go
func (curve p224Curve) Params() *CurveParams
```

#### <a id="p224Curve.ScalarBaseMult" href="#p224Curve.ScalarBaseMult">func (curve p224Curve) ScalarBaseMult(scalar []byte) (x, y *big.Int)</a>

```
searchKey: elliptic.p224Curve.ScalarBaseMult
tags: [method private]
```

```Go
func (curve p224Curve) ScalarBaseMult(scalar []byte) (x, y *big.Int)
```

#### <a id="p224Curve.ScalarMult" href="#p224Curve.ScalarMult">func (p224Curve) ScalarMult(bigX1, bigY1 *big.Int, scalar []byte) (x, y *big.Int)</a>

```
searchKey: elliptic.p224Curve.ScalarMult
tags: [method private]
```

```Go
func (p224Curve) ScalarMult(bigX1, bigY1 *big.Int, scalar []byte) (x, y *big.Int)
```

### <a id="p224FieldElement" href="#p224FieldElement">type p224FieldElement [8]uint32</a>

```
searchKey: elliptic.p224FieldElement
tags: [array number private]
```

```Go
type p224FieldElement [8]uint32
```

Field element functions. 

The field that we're dealing with is ℤ/pℤ where p = 2**224 - 2**96 + 1. 

Field elements are represented by a FieldElement, which is a typedef to an array of 8 uint32's. The value of a FieldElement, a, is: 

```
a[0] + 2**28·a[1] + 2**56·a[1] + ... + 2**196·a[7]

```
Using 28-bit limbs means that there's only 4 bits of headroom, which is less than we would really like. But it has the useful feature that we hit 2**224 exactly, making the reflections during a reduce much nicer. 

#### <a id="p224FieldElement.Generate" href="#p224FieldElement.Generate">func (p224FieldElement) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: elliptic.p224FieldElement.Generate
tags: [method private]
```

```Go
func (p224FieldElement) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="p224LargeFieldElement" href="#p224LargeFieldElement">type p224LargeFieldElement [15]uint64</a>

```
searchKey: elliptic.p224LargeFieldElement
tags: [array number private]
```

```Go
type p224LargeFieldElement [15]uint64
```

LargeFieldElement also represents an element of the field. The limbs are still spaced 28-bits apart and in little-endian order. So the limbs are at 0, 28, 56, ..., 392 bits, each 64-bits wide. 

### <a id="p256Curve" href="#p256Curve">type p256Curve struct</a>

```
searchKey: elliptic.p256Curve
tags: [struct private]
```

```Go
type p256Curve struct {
	*CurveParams
}
```

#### <a id="p256Curve.CombinedMult" href="#p256Curve.CombinedMult">func (curve p256Curve) CombinedMult(bigX, bigY *big.Int, baseScalar, scalar []byte) (x, y *big.Int)</a>

```
searchKey: elliptic.p256Curve.CombinedMult
tags: [method private]
```

```Go
func (curve p256Curve) CombinedMult(bigX, bigY *big.Int, baseScalar, scalar []byte) (x, y *big.Int)
```

#### <a id="p256Curve.Inverse" href="#p256Curve.Inverse">func (curve p256Curve) Inverse(k *big.Int) *big.Int</a>

```
searchKey: elliptic.p256Curve.Inverse
tags: [method private]
```

```Go
func (curve p256Curve) Inverse(k *big.Int) *big.Int
```

#### <a id="p256Curve.Params" href="#p256Curve.Params">func (curve p256Curve) Params() *CurveParams</a>

```
searchKey: elliptic.p256Curve.Params
tags: [function private]
```

```Go
func (curve p256Curve) Params() *CurveParams
```

#### <a id="p256Curve.ScalarBaseMult" href="#p256Curve.ScalarBaseMult">func (curve p256Curve) ScalarBaseMult(scalar []byte) (x, y *big.Int)</a>

```
searchKey: elliptic.p256Curve.ScalarBaseMult
tags: [method private]
```

```Go
func (curve p256Curve) ScalarBaseMult(scalar []byte) (x, y *big.Int)
```

#### <a id="p256Curve.ScalarMult" href="#p256Curve.ScalarMult">func (curve p256Curve) ScalarMult(bigX, bigY *big.Int, scalar []byte) (x, y *big.Int)</a>

```
searchKey: elliptic.p256Curve.ScalarMult
tags: [method private]
```

```Go
func (curve p256Curve) ScalarMult(bigX, bigY *big.Int, scalar []byte) (x, y *big.Int)
```

### <a id="p256Point" href="#p256Point">type p256Point struct</a>

```
searchKey: elliptic.p256Point
tags: [struct private]
```

```Go
type p256Point struct {
	xyz [12]uint64
}
```

#### <a id="p256Point.CopyConditional" href="#p256Point.CopyConditional">func (p *p256Point) CopyConditional(src *p256Point, v int)</a>

```
searchKey: elliptic.p256Point.CopyConditional
tags: [method private]
```

```Go
func (p *p256Point) CopyConditional(src *p256Point, v int)
```

CopyConditional copies overwrites p with src if v == 1, and leaves p unchanged if v == 0. 

#### <a id="p256Point.p256BaseMult" href="#p256Point.p256BaseMult">func (p *p256Point) p256BaseMult(scalar []uint64)</a>

```
searchKey: elliptic.p256Point.p256BaseMult
tags: [method private]
```

```Go
func (p *p256Point) p256BaseMult(scalar []uint64)
```

#### <a id="p256Point.p256PointToAffine" href="#p256Point.p256PointToAffine">func (p *p256Point) p256PointToAffine() (x, y *big.Int)</a>

```
searchKey: elliptic.p256Point.p256PointToAffine
tags: [function private]
```

```Go
func (p *p256Point) p256PointToAffine() (x, y *big.Int)
```

#### <a id="p256Point.p256ScalarMult" href="#p256Point.p256ScalarMult">func (p *p256Point) p256ScalarMult(scalar []uint64)</a>

```
searchKey: elliptic.p256Point.p256ScalarMult
tags: [method private]
```

```Go
func (p *p256Point) p256ScalarMult(scalar []uint64)
```

#### <a id="p256Point.p256StorePoint" href="#p256Point.p256StorePoint">func (p *p256Point) p256StorePoint(r *[16 * 4 * 3]uint64, index int)</a>

```
searchKey: elliptic.p256Point.p256StorePoint
tags: [method private]
```

```Go
func (p *p256Point) p256StorePoint(r *[16 * 4 * 3]uint64, index int)
```

### <a id="p521Curve" href="#p521Curve">type p521Curve struct</a>

```
searchKey: elliptic.p521Curve
tags: [struct private]
```

```Go
type p521Curve struct {
	*CurveParams
}
```

#### <a id="p521Curve.Add" href="#p521Curve.Add">func (curve p521Curve) Add(x1, y1, x2, y2 *big.Int) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.p521Curve.Add
tags: [method private]
```

```Go
func (curve p521Curve) Add(x1, y1, x2, y2 *big.Int) (*big.Int, *big.Int)
```

#### <a id="p521Curve.Double" href="#p521Curve.Double">func (curve p521Curve) Double(x1, y1 *big.Int) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.p521Curve.Double
tags: [method private]
```

```Go
func (curve p521Curve) Double(x1, y1 *big.Int) (*big.Int, *big.Int)
```

#### <a id="p521Curve.IsOnCurve" href="#p521Curve.IsOnCurve">func (curve p521Curve) IsOnCurve(x, y *big.Int) bool</a>

```
searchKey: elliptic.p521Curve.IsOnCurve
tags: [method private]
```

```Go
func (curve p521Curve) IsOnCurve(x, y *big.Int) bool
```

#### <a id="p521Curve.Params" href="#p521Curve.Params">func (curve p521Curve) Params() *CurveParams</a>

```
searchKey: elliptic.p521Curve.Params
tags: [function private]
```

```Go
func (curve p521Curve) Params() *CurveParams
```

#### <a id="p521Curve.ScalarBaseMult" href="#p521Curve.ScalarBaseMult">func (curve p521Curve) ScalarBaseMult(k []byte) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.p521Curve.ScalarBaseMult
tags: [method private]
```

```Go
func (curve p521Curve) ScalarBaseMult(k []byte) (*big.Int, *big.Int)
```

#### <a id="p521Curve.ScalarMult" href="#p521Curve.ScalarMult">func (curve p521Curve) ScalarMult(Bx, By *big.Int, scalar []byte) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.p521Curve.ScalarMult
tags: [method private]
```

```Go
func (curve p521Curve) ScalarMult(Bx, By *big.Int, scalar []byte) (*big.Int, *big.Int)
```

#### <a id="p521Curve.affineFromJacobian" href="#p521Curve.affineFromJacobian">func (curve p521Curve) affineFromJacobian(p *p521Point) (x, y *big.Int)</a>

```
searchKey: elliptic.p521Curve.affineFromJacobian
tags: [method private]
```

```Go
func (curve p521Curve) affineFromJacobian(p *p521Point) (x, y *big.Int)
```

affineFromJacobian brings a point in Jacobian coordinates back to affine coordinates, with (0, 0) representing infinity by convention. It also goes back to big.Int values to match the exposed API. 

#### <a id="p521Curve.jacobianFromAffine" href="#p521Curve.jacobianFromAffine">func (curve p521Curve) jacobianFromAffine(x, y *big.Int) *p521Point</a>

```
searchKey: elliptic.p521Curve.jacobianFromAffine
tags: [method private]
```

```Go
func (curve p521Curve) jacobianFromAffine(x, y *big.Int) *p521Point
```

jacobianFromAffine converts (x, y) affine coordinates into (x, y, z) Jacobian coordinates. It also converts from big.Int to fiat, which is necessarily a messy and variable-time operation, which we can't avoid due to the exposed API. 

### <a id="p521Point" href="#p521Point">type p521Point struct</a>

```
searchKey: elliptic.p521Point
tags: [struct private]
```

```Go
type p521Point struct {
	x, y, z *fiat.P521Element
}
```

#### <a id="p521Point.addJacobian" href="#p521Point.addJacobian">func (q *p521Point) addJacobian(p1, p2 *p521Point) *p521Point</a>

```
searchKey: elliptic.p521Point.addJacobian
tags: [method private]
```

```Go
func (q *p521Point) addJacobian(p1, p2 *p521Point) *p521Point
```

addJacobian sets q = p1 + p2, and returns q. The points may overlap. 

#### <a id="p521Point.doubleJacobian" href="#p521Point.doubleJacobian">func (q *p521Point) doubleJacobian(p *p521Point) *p521Point</a>

```
searchKey: elliptic.p521Point.doubleJacobian
tags: [method private]
```

```Go
func (q *p521Point) doubleJacobian(p *p521Point) *p521Point
```

doubleJacobian sets q = p + p, and returns q. The points may overlap. 

### <a id="scalarMultTest" href="#scalarMultTest">type scalarMultTest struct</a>

```
searchKey: elliptic.scalarMultTest
tags: [struct private]
```

```Go
type scalarMultTest struct {
	k          string
	xIn, yIn   string
	xOut, yOut string
}
```

### <a id="synthCombinedMult" href="#synthCombinedMult">type synthCombinedMult struct</a>

```
searchKey: elliptic.synthCombinedMult
tags: [struct private]
```

```Go
type synthCombinedMult struct {
	Curve
}
```

#### <a id="synthCombinedMult.CombinedMult" href="#synthCombinedMult.CombinedMult">func (s synthCombinedMult) CombinedMult(bigX, bigY *big.Int, baseScalar, scalar []byte) (x, y *big.Int)</a>

```
searchKey: elliptic.synthCombinedMult.CombinedMult
tags: [method private]
```

```Go
func (s synthCombinedMult) CombinedMult(bigX, bigY *big.Int, baseScalar, scalar []byte) (x, y *big.Int)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkScalarBaseMult" href="#BenchmarkScalarBaseMult">func BenchmarkScalarBaseMult(b *testing.B)</a>

```
searchKey: elliptic.BenchmarkScalarBaseMult
tags: [method private benchmark]
```

```Go
func BenchmarkScalarBaseMult(b *testing.B)
```

### <a id="BenchmarkScalarMult" href="#BenchmarkScalarMult">func BenchmarkScalarMult(b *testing.B)</a>

```
searchKey: elliptic.BenchmarkScalarMult
tags: [method private benchmark]
```

```Go
func BenchmarkScalarMult(b *testing.B)
```

### <a id="GenerateKey" href="#GenerateKey">func GenerateKey(curve Curve, rand io.Reader) (priv []byte, x, y *big.Int, err error)</a>

```
searchKey: elliptic.GenerateKey
tags: [method]
```

```Go
func GenerateKey(curve Curve, rand io.Reader) (priv []byte, x, y *big.Int, err error)
```

GenerateKey returns a public/private key pair. The private key is generated using the given reader, which must return random data. 

### <a id="Marshal" href="#Marshal">func Marshal(curve Curve, x, y *big.Int) []byte</a>

```
searchKey: elliptic.Marshal
tags: [method]
```

```Go
func Marshal(curve Curve, x, y *big.Int) []byte
```

Marshal converts a point on the curve into the uncompressed form specified in section 4.3.6 of ANSI X9.62. 

### <a id="MarshalCompressed" href="#MarshalCompressed">func MarshalCompressed(curve Curve, x, y *big.Int) []byte</a>

```
searchKey: elliptic.MarshalCompressed
tags: [method]
```

```Go
func MarshalCompressed(curve Curve, x, y *big.Int) []byte
```

MarshalCompressed converts a point on the curve into the compressed form specified in section 4.3.6 of ANSI X9.62. 

### <a id="TestFuzz" href="#TestFuzz">func TestFuzz(t *testing.T)</a>

```
searchKey: elliptic.TestFuzz
tags: [method private test]
```

```Go
func TestFuzz(t *testing.T)
```

### <a id="TestInfinity" href="#TestInfinity">func TestInfinity(t *testing.T)</a>

```
searchKey: elliptic.TestInfinity
tags: [method private test]
```

```Go
func TestInfinity(t *testing.T)
```

### <a id="TestMarshal" href="#TestMarshal">func TestMarshal(t *testing.T)</a>

```
searchKey: elliptic.TestMarshal
tags: [method private test]
```

```Go
func TestMarshal(t *testing.T)
```

### <a id="TestMarshalCompressed" href="#TestMarshalCompressed">func TestMarshalCompressed(t *testing.T)</a>

```
searchKey: elliptic.TestMarshalCompressed
tags: [method private test]
```

```Go
func TestMarshalCompressed(t *testing.T)
```

### <a id="TestOffCurve" href="#TestOffCurve">func TestOffCurve(t *testing.T)</a>

```
searchKey: elliptic.TestOffCurve
tags: [method private test]
```

```Go
func TestOffCurve(t *testing.T)
```

### <a id="TestOnCurve" href="#TestOnCurve">func TestOnCurve(t *testing.T)</a>

```
searchKey: elliptic.TestOnCurve
tags: [method private test]
```

```Go
func TestOnCurve(t *testing.T)
```

### <a id="TestP224Add" href="#TestP224Add">func TestP224Add(t *testing.T)</a>

```
searchKey: elliptic.TestP224Add
tags: [method private test]
```

```Go
func TestP224Add(t *testing.T)
```

### <a id="TestP224BaseMult" href="#TestP224BaseMult">func TestP224BaseMult(t *testing.T)</a>

```
searchKey: elliptic.TestP224BaseMult
tags: [method private test]
```

```Go
func TestP224BaseMult(t *testing.T)
```

### <a id="TestP224Contract" href="#TestP224Contract">func TestP224Contract(t *testing.T)</a>

```
searchKey: elliptic.TestP224Contract
tags: [method private test]
```

```Go
func TestP224Contract(t *testing.T)
```

### <a id="TestP224GenericBaseMult" href="#TestP224GenericBaseMult">func TestP224GenericBaseMult(t *testing.T)</a>

```
searchKey: elliptic.TestP224GenericBaseMult
tags: [method private test]
```

```Go
func TestP224GenericBaseMult(t *testing.T)
```

### <a id="TestP224Invert" href="#TestP224Invert">func TestP224Invert(t *testing.T)</a>

```
searchKey: elliptic.TestP224Invert
tags: [method private test]
```

```Go
func TestP224Invert(t *testing.T)
```

### <a id="TestP224IsZero" href="#TestP224IsZero">func TestP224IsZero(t *testing.T)</a>

```
searchKey: elliptic.TestP224IsZero
tags: [method private test]
```

```Go
func TestP224IsZero(t *testing.T)
```

### <a id="TestP224Mul" href="#TestP224Mul">func TestP224Mul(t *testing.T)</a>

```
searchKey: elliptic.TestP224Mul
tags: [method private test]
```

```Go
func TestP224Mul(t *testing.T)
```

### <a id="TestP224Overflow" href="#TestP224Overflow">func TestP224Overflow(t *testing.T)</a>

```
searchKey: elliptic.TestP224Overflow
tags: [method private test]
```

```Go
func TestP224Overflow(t *testing.T)
```

### <a id="TestP224Reduce" href="#TestP224Reduce">func TestP224Reduce(t *testing.T)</a>

```
searchKey: elliptic.TestP224Reduce
tags: [method private test]
```

```Go
func TestP224Reduce(t *testing.T)
```

### <a id="TestP224Square" href="#TestP224Square">func TestP224Square(t *testing.T)</a>

```
searchKey: elliptic.TestP224Square
tags: [method private test]
```

```Go
func TestP224Square(t *testing.T)
```

### <a id="TestP224ToFromBig" href="#TestP224ToFromBig">func TestP224ToFromBig(t *testing.T)</a>

```
searchKey: elliptic.TestP224ToFromBig
tags: [method private test]
```

```Go
func TestP224ToFromBig(t *testing.T)
```

### <a id="TestP256BaseMult" href="#TestP256BaseMult">func TestP256BaseMult(t *testing.T)</a>

```
searchKey: elliptic.TestP256BaseMult
tags: [method private test]
```

```Go
func TestP256BaseMult(t *testing.T)
```

### <a id="TestP256CombinedMult" href="#TestP256CombinedMult">func TestP256CombinedMult(t *testing.T)</a>

```
searchKey: elliptic.TestP256CombinedMult
tags: [method private test]
```

```Go
func TestP256CombinedMult(t *testing.T)
```

### <a id="TestP256Mult" href="#TestP256Mult">func TestP256Mult(t *testing.T)</a>

```
searchKey: elliptic.TestP256Mult
tags: [method private test]
```

```Go
func TestP256Mult(t *testing.T)
```

### <a id="TestP256PrecomputedTable" href="#TestP256PrecomputedTable">func TestP256PrecomputedTable(t *testing.T)</a>

```
searchKey: elliptic.TestP256PrecomputedTable
tags: [method private test]
```

```Go
func TestP256PrecomputedTable(t *testing.T)
```

### <a id="TestUnmarshalToLargeCoordinates" href="#TestUnmarshalToLargeCoordinates">func TestUnmarshalToLargeCoordinates(t *testing.T)</a>

```
searchKey: elliptic.TestUnmarshalToLargeCoordinates
tags: [method private test]
```

```Go
func TestUnmarshalToLargeCoordinates(t *testing.T)
```

### <a id="Unmarshal" href="#Unmarshal">func Unmarshal(curve Curve, data []byte) (x, y *big.Int)</a>

```
searchKey: elliptic.Unmarshal
tags: [method]
```

```Go
func Unmarshal(curve Curve, data []byte) (x, y *big.Int)
```

Unmarshal converts a point, serialized by Marshal, into an x, y pair. It is an error if the point is not in uncompressed form or is not on the curve. On error, x = nil. 

### <a id="UnmarshalCompressed" href="#UnmarshalCompressed">func UnmarshalCompressed(curve Curve, data []byte) (x, y *big.Int)</a>

```
searchKey: elliptic.UnmarshalCompressed
tags: [method]
```

```Go
func UnmarshalCompressed(curve Curve, data []byte) (x, y *big.Int)
```

UnmarshalCompressed converts a point, serialized by MarshalCompressed, into an x, y pair. It is an error if the point is not in compressed form or is not on the curve. On error, x = nil. 

### <a id="benchmarkAllCurves" href="#benchmarkAllCurves">func benchmarkAllCurves(t *testing.B, f func(*testing.B, Curve))</a>

```
searchKey: elliptic.benchmarkAllCurves
tags: [method private]
```

```Go
func benchmarkAllCurves(t *testing.B, f func(*testing.B, Curve))
```

### <a id="bigIntToFiatP521" href="#bigIntToFiatP521">func bigIntToFiatP521(x *big.Int) *fiat.P521Element</a>

```
searchKey: elliptic.bigIntToFiatP521
tags: [method private]
```

```Go
func bigIntToFiatP521(x *big.Int) *fiat.P521Element
```

### <a id="boothW5" href="#boothW5">func boothW5(in uint) (int, int)</a>

```
searchKey: elliptic.boothW5
tags: [method private]
```

```Go
func boothW5(in uint) (int, int)
```

### <a id="boothW6" href="#boothW6">func boothW6(in uint) (int, int)</a>

```
searchKey: elliptic.boothW6
tags: [method private]
```

```Go
func boothW6(in uint) (int, int)
```

### <a id="fiatP521ToBigInt" href="#fiatP521ToBigInt">func fiatP521ToBigInt(x *fiat.P521Element) *big.Int</a>

```
searchKey: elliptic.fiatP521ToBigInt
tags: [method private]
```

```Go
func fiatP521ToBigInt(x *fiat.P521Element) *big.Int
```

### <a id="fromBig" href="#fromBig">func fromBig(out []uint64, big *big.Int)</a>

```
searchKey: elliptic.fromBig
tags: [method private]
```

```Go
func fromBig(out []uint64, big *big.Int)
```

fromBig converts a *big.Int into a format used by this code. 

### <a id="generateLimb" href="#generateLimb">func generateLimb(rand *rand.Rand) uint32</a>

```
searchKey: elliptic.generateLimb
tags: [method private]
```

```Go
func generateLimb(rand *rand.Rand) uint32
```

### <a id="get28BitsFromEnd" href="#get28BitsFromEnd">func get28BitsFromEnd(buf []byte, shift uint) (uint32, []byte)</a>

```
searchKey: elliptic.get28BitsFromEnd
tags: [method private]
```

```Go
func get28BitsFromEnd(buf []byte, shift uint) (uint32, []byte)
```

get28BitsFromEnd returns the least-significant 28 bits from buf>>shift, where buf is interpreted as a big-endian number. 

### <a id="initAll" href="#initAll">func initAll()</a>

```
searchKey: elliptic.initAll
tags: [function private]
```

```Go
func initAll()
```

### <a id="initP224" href="#initP224">func initP224()</a>

```
searchKey: elliptic.initP224
tags: [function private]
```

```Go
func initP224()
```

### <a id="initP256" href="#initP256">func initP256()</a>

```
searchKey: elliptic.initP256
tags: [function private]
```

```Go
func initP256()
```

### <a id="initP384" href="#initP384">func initP384()</a>

```
searchKey: elliptic.initP384
tags: [function private]
```

```Go
func initP384()
```

### <a id="initP521" href="#initP521">func initP521()</a>

```
searchKey: elliptic.initP521
tags: [function private]
```

```Go
func initP521()
```

### <a id="isInBounds" href="#isInBounds">func isInBounds(x *p224FieldElement) bool</a>

```
searchKey: elliptic.isInBounds
tags: [method private]
```

```Go
func isInBounds(x *p224FieldElement) bool
```

### <a id="maybeReduceModP" href="#maybeReduceModP">func maybeReduceModP(in *big.Int) *big.Int</a>

```
searchKey: elliptic.maybeReduceModP
tags: [method private]
```

```Go
func maybeReduceModP(in *big.Int) *big.Int
```

### <a id="p224Add" href="#p224Add">func p224Add(out, a, b *p224FieldElement)</a>

```
searchKey: elliptic.p224Add
tags: [method private]
```

```Go
func p224Add(out, a, b *p224FieldElement)
```

p224Add computes *out = a+b 

a[i] + b[i] < 2**32 

### <a id="p224AddJacobian" href="#p224AddJacobian">func p224AddJacobian(x3, y3, z3, x1, y1, z1, x2, y2, z2 *p224FieldElement)</a>

```
searchKey: elliptic.p224AddJacobian
tags: [method private]
```

```Go
func p224AddJacobian(x3, y3, z3, x1, y1, z1, x2, y2, z2 *p224FieldElement)
```

p224AddJacobian computes *out = a+b where a != b. 

### <a id="p224AlternativeToBig" href="#p224AlternativeToBig">func p224AlternativeToBig(in *p224FieldElement) *big.Int</a>

```
searchKey: elliptic.p224AlternativeToBig
tags: [method private]
```

```Go
func p224AlternativeToBig(in *p224FieldElement) *big.Int
```

### <a id="p224Contract" href="#p224Contract">func p224Contract(out, in *p224FieldElement)</a>

```
searchKey: elliptic.p224Contract
tags: [method private]
```

```Go
func p224Contract(out, in *p224FieldElement)
```

p224Contract converts a FieldElement to its unique, minimal form. 

On entry, in[i] < 2**29 On exit, out[i] < 2**28 and out < p 

### <a id="p224CopyConditional" href="#p224CopyConditional">func p224CopyConditional(out, in *p224FieldElement, control uint32)</a>

```
searchKey: elliptic.p224CopyConditional
tags: [method private]
```

```Go
func p224CopyConditional(out, in *p224FieldElement, control uint32)
```

p224CopyConditional sets *out = *in iff the least-significant-bit of control is true, and it runs in constant time. 

### <a id="p224DoubleJacobian" href="#p224DoubleJacobian">func p224DoubleJacobian(x3, y3, z3, x1, y1, z1 *p224FieldElement)</a>

```
searchKey: elliptic.p224DoubleJacobian
tags: [method private]
```

```Go
func p224DoubleJacobian(x3, y3, z3, x1, y1, z1 *p224FieldElement)
```

p224DoubleJacobian computes *out = a+a. 

### <a id="p224FromBig" href="#p224FromBig">func p224FromBig(out *p224FieldElement, in *big.Int)</a>

```
searchKey: elliptic.p224FromBig
tags: [method private]
```

```Go
func p224FromBig(out *p224FieldElement, in *big.Int)
```

p224FromBig sets *out = *in. 

### <a id="p224Invert" href="#p224Invert">func p224Invert(out, in *p224FieldElement)</a>

```
searchKey: elliptic.p224Invert
tags: [method private]
```

```Go
func p224Invert(out, in *p224FieldElement)
```

p224Invert calculates *out = in**-1 by computing in**(2**224 - 2**96 - 1), i.e. Fermat's little theorem. 

### <a id="p224IsZero" href="#p224IsZero">func p224IsZero(a *p224FieldElement) uint32</a>

```
searchKey: elliptic.p224IsZero
tags: [method private]
```

```Go
func p224IsZero(a *p224FieldElement) uint32
```

p224IsZero returns 1 if a == 0 mod p and 0 otherwise. 

a[i] < 2**29 

### <a id="p224Mul" href="#p224Mul">func p224Mul(out, a, b *p224FieldElement, tmp *p224LargeFieldElement)</a>

```
searchKey: elliptic.p224Mul
tags: [method private]
```

```Go
func p224Mul(out, a, b *p224FieldElement, tmp *p224LargeFieldElement)
```

p224Mul computes *out = a*b 

a[i] < 2**29, b[i] < 2**30 (or vice versa) out[i] < 2**29 

### <a id="p224Reduce" href="#p224Reduce">func p224Reduce(a *p224FieldElement)</a>

```
searchKey: elliptic.p224Reduce
tags: [method private]
```

```Go
func p224Reduce(a *p224FieldElement)
```

Reduce reduces the coefficients of a to smaller bounds. 

On entry: a[i] < 2**31 + 2**30 On exit: a[i] < 2**29 

### <a id="p224ReduceLarge" href="#p224ReduceLarge">func p224ReduceLarge(out *p224FieldElement, in *p224LargeFieldElement)</a>

```
searchKey: elliptic.p224ReduceLarge
tags: [method private]
```

```Go
func p224ReduceLarge(out *p224FieldElement, in *p224LargeFieldElement)
```

ReduceLarge converts a p224LargeFieldElement to a p224FieldElement. 

in[i] < 2**62 

### <a id="p224ScalarMult" href="#p224ScalarMult">func p224ScalarMult(outX, outY, outZ, inX, inY, inZ *p224FieldElement, scalar []byte)</a>

```
searchKey: elliptic.p224ScalarMult
tags: [method private]
```

```Go
func p224ScalarMult(outX, outY, outZ, inX, inY, inZ *p224FieldElement, scalar []byte)
```

### <a id="p224Square" href="#p224Square">func p224Square(out, a *p224FieldElement, tmp *p224LargeFieldElement)</a>

```
searchKey: elliptic.p224Square
tags: [method private]
```

```Go
func p224Square(out, a *p224FieldElement, tmp *p224LargeFieldElement)
```

Square computes *out = a*a 

a[i] < 2**29 out[i] < 2**29 

### <a id="p224Sub" href="#p224Sub">func p224Sub(out, a, b *p224FieldElement)</a>

```
searchKey: elliptic.p224Sub
tags: [method private]
```

```Go
func p224Sub(out, a, b *p224FieldElement)
```

p224Sub computes *out = a-b 

a[i], b[i] < 2**30 out[i] < 2**32 

### <a id="p224ToAffine" href="#p224ToAffine">func p224ToAffine(x, y, z *p224FieldElement) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.p224ToAffine
tags: [method private]
```

```Go
func p224ToAffine(x, y, z *p224FieldElement) (*big.Int, *big.Int)
```

p224ToAffine converts from Jacobian to affine form. 

### <a id="p224ToBig" href="#p224ToBig">func p224ToBig(in *p224FieldElement) *big.Int</a>

```
searchKey: elliptic.p224ToBig
tags: [method private]
```

```Go
func p224ToBig(in *p224FieldElement) *big.Int
```

p224ToBig returns in as a big.Int. 

### <a id="p256BigToLittle" href="#p256BigToLittle">func p256BigToLittle(res []uint64, in []byte)</a>

```
searchKey: elliptic.p256BigToLittle
tags: [method private]
```

```Go
func p256BigToLittle(res []uint64, in []byte)
```

Endianness swap 

### <a id="p256FromMont" href="#p256FromMont">func p256FromMont(res, in []uint64)</a>

```
searchKey: elliptic.p256FromMont
tags: [method private]
```

```Go
func p256FromMont(res, in []uint64)
```

Montgomery multiplication by 1 

### <a id="p256GetScalar" href="#p256GetScalar">func p256GetScalar(out []uint64, in []byte)</a>

```
searchKey: elliptic.p256GetScalar
tags: [method private]
```

```Go
func p256GetScalar(out []uint64, in []byte)
```

p256GetScalar endian-swaps the big-endian scalar value from in and writes it to out. If the scalar is equal or greater than the order of the group, it's reduced modulo that order. 

### <a id="p256Inverse" href="#p256Inverse">func p256Inverse(out, in []uint64)</a>

```
searchKey: elliptic.p256Inverse
tags: [method private]
```

```Go
func p256Inverse(out, in []uint64)
```

p256Inverse sets out to in^-1 mod p. 

### <a id="p256LittleToBig" href="#p256LittleToBig">func p256LittleToBig(res []byte, in []uint64)</a>

```
searchKey: elliptic.p256LittleToBig
tags: [method private]
```

```Go
func p256LittleToBig(res []byte, in []uint64)
```

### <a id="p256MovCond" href="#p256MovCond">func p256MovCond(res, a, b []uint64, cond int)</a>

```
searchKey: elliptic.p256MovCond
tags: [method private]
```

```Go
func p256MovCond(res, a, b []uint64, cond int)
```

if cond == 0 res <- b; else res <- a 

### <a id="p256Mul" href="#p256Mul">func p256Mul(res, in1, in2 []uint64)</a>

```
searchKey: elliptic.p256Mul
tags: [method private]
```

```Go
func p256Mul(res, in1, in2 []uint64)
```

Functions implemented in p256_asm_*64.s Montgomery multiplication modulo P256 

### <a id="p256NegCond" href="#p256NegCond">func p256NegCond(val []uint64, cond int)</a>

```
searchKey: elliptic.p256NegCond
tags: [method private]
```

```Go
func p256NegCond(val []uint64, cond int)
```

iff cond == 1  val <- -val 

### <a id="p256OrdMul" href="#p256OrdMul">func p256OrdMul(res, in1, in2 []uint64)</a>

```
searchKey: elliptic.p256OrdMul
tags: [method private]
```

```Go
func p256OrdMul(res, in1, in2 []uint64)
```

Montgomery multiplication modulo Ord(G) 

### <a id="p256OrdSqr" href="#p256OrdSqr">func p256OrdSqr(res, in []uint64, n int)</a>

```
searchKey: elliptic.p256OrdSqr
tags: [method private]
```

```Go
func p256OrdSqr(res, in []uint64, n int)
```

Montgomery square modulo Ord(G), repeated n times 

### <a id="p256PointAddAffineAsm" href="#p256PointAddAffineAsm">func p256PointAddAffineAsm(res, in1, in2 []uint64, sign, sel, zero int)</a>

```
searchKey: elliptic.p256PointAddAffineAsm
tags: [method private]
```

```Go
func p256PointAddAffineAsm(res, in1, in2 []uint64, sign, sel, zero int)
```

Point add with in2 being affine point If sign == 1 -> in2 = -in2 If sel == 0 -> res = in1 if zero == 0 -> res = in2 

### <a id="p256PointAddAsm" href="#p256PointAddAsm">func p256PointAddAsm(res, in1, in2 []uint64) int</a>

```
searchKey: elliptic.p256PointAddAsm
tags: [method private]
```

```Go
func p256PointAddAsm(res, in1, in2 []uint64) int
```

Point add. Returns one if the two input points were equal and zero otherwise. (Note that, due to the way that the equations work out, some representations of ∞ are considered equal to everything by this function.) 

### <a id="p256PointDoubleAsm" href="#p256PointDoubleAsm">func p256PointDoubleAsm(res, in []uint64)</a>

```
searchKey: elliptic.p256PointDoubleAsm
tags: [method private]
```

```Go
func p256PointDoubleAsm(res, in []uint64)
```

Point double 

### <a id="p256Select" href="#p256Select">func p256Select(point, table []uint64, idx int)</a>

```
searchKey: elliptic.p256Select
tags: [method private]
```

```Go
func p256Select(point, table []uint64, idx int)
```

Constant time table access 

### <a id="p256SelectBase" href="#p256SelectBase">func p256SelectBase(point, table []uint64, idx int)</a>

```
searchKey: elliptic.p256SelectBase
tags: [method private]
```

```Go
func p256SelectBase(point, table []uint64, idx int)
```

### <a id="p256Sqr" href="#p256Sqr">func p256Sqr(res, in []uint64, n int)</a>

```
searchKey: elliptic.p256Sqr
tags: [method private]
```

```Go
func p256Sqr(res, in []uint64, n int)
```

Montgomery square modulo P256, repeated n times (n >= 1) 

### <a id="scalarIsZero" href="#scalarIsZero">func scalarIsZero(scalar []uint64) int</a>

```
searchKey: elliptic.scalarIsZero
tags: [method private]
```

```Go
func scalarIsZero(scalar []uint64) int
```

scalarIsZero returns 1 if scalar represents the zero value, and zero otherwise. 

### <a id="testAllCurves" href="#testAllCurves">func testAllCurves(t *testing.T, f func(*testing.T, Curve))</a>

```
searchKey: elliptic.testAllCurves
tags: [method private]
```

```Go
func testAllCurves(t *testing.T, f func(*testing.T, Curve))
```

### <a id="testInfinity" href="#testInfinity">func testInfinity(t *testing.T, curve Curve)</a>

```
searchKey: elliptic.testInfinity
tags: [method private]
```

```Go
func testInfinity(t *testing.T, curve Curve)
```

### <a id="testMarshalCompressed" href="#testMarshalCompressed">func testMarshalCompressed(t *testing.T, curve Curve, x, y *big.Int, want []byte)</a>

```
searchKey: elliptic.testMarshalCompressed
tags: [method private]
```

```Go
func testMarshalCompressed(t *testing.T, curve Curve, x, y *big.Int, want []byte)
```

### <a id="testUnmarshalToLargeCoordinates" href="#testUnmarshalToLargeCoordinates">func testUnmarshalToLargeCoordinates(t *testing.T, curve Curve)</a>

```
searchKey: elliptic.testUnmarshalToLargeCoordinates
tags: [method private]
```

```Go
func testUnmarshalToLargeCoordinates(t *testing.T, curve Curve)
```

### <a id="uint64IsZero" href="#uint64IsZero">func uint64IsZero(x uint64) int</a>

```
searchKey: elliptic.uint64IsZero
tags: [method private]
```

```Go
func uint64IsZero(x uint64) int
```

uint64IsZero returns 1 if x is zero and zero otherwise. 

### <a id="zForAffine" href="#zForAffine">func zForAffine(x, y *big.Int) *big.Int</a>

```
searchKey: elliptic.zForAffine
tags: [method private]
```

```Go
func zForAffine(x, y *big.Int) *big.Int
```

zForAffine returns a Jacobian Z value for the affine point (x, y). If x and y are zero, it assumes that they represent the point at infinity because (0, 0) is not on the any of the curves handled here. 

