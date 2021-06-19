# Package elliptic

Package elliptic implements several standard elliptic curves over prime fields. 

## Index

* Subpages
  * [std/crypto/elliptic/internal](elliptic/internal.md)
* [Constants](#const)
    * [const two31p3](#two31p3)
    * [const two31m3](#two31m3)
    * [const two31m15m3](#two31m15m3)
    * [const two63p35](#two63p35)
    * [const two63m35](#two63m35)
    * [const two63m35m19](#two63m35m19)
    * [const bottom12Bits](#bottom12Bits)
    * [const bottom28Bits](#bottom28Bits)
* [Variables](#var)
    * [var mask](#mask)
    * [var initonce](#initonce)
    * [var p384](#p384)
    * [var p224](#p224)
    * [var p224P](#p224P)
    * [var p224ZeroModP31](#p224ZeroModP31)
    * [var p224ZeroModP63](#p224ZeroModP63)
    * [var p256](#p256)
    * [var rr](#rr)
    * [var p256Precomputed](#p256Precomputed)
    * [var p521](#p521)
    * [var p521Params](#p521Params)
    * [var toFromBigTests](#toFromBigTests)
    * [var quickCheckConfig32](#quickCheckConfig32)
    * [var weirdLimbs](#weirdLimbs)
    * [var p224BaseMultTests](#p224BaseMultTests)
    * [var p256MultTests](#p256MultTests)
* [Types](#type)
    * [type Curve interface](#Curve)
        * [func matchesSpecificCurve(params *CurveParams, available ...Curve) (Curve, bool)](#matchesSpecificCurve)
        * [func P256() Curve](#P256)
        * [func P384() Curve](#P384)
        * [func P521() Curve](#P521)
        * [func P224() Curve](#P224)
    * [type CurveParams struct](#CurveParams)
        * [func genericParamsForCurve(c Curve) *CurveParams](#genericParamsForCurve)
        * [func (curve *CurveParams) Params() *CurveParams](#CurveParams.Params)
        * [func (curve *CurveParams) polynomial(x *big.Int) *big.Int](#CurveParams.polynomial)
        * [func (curve *CurveParams) IsOnCurve(x, y *big.Int) bool](#CurveParams.IsOnCurve)
        * [func (curve *CurveParams) affineFromJacobian(x, y, z *big.Int) (xOut, yOut *big.Int)](#CurveParams.affineFromJacobian)
        * [func (curve *CurveParams) Add(x1, y1, x2, y2 *big.Int) (*big.Int, *big.Int)](#CurveParams.Add)
        * [func (curve *CurveParams) addJacobian(x1, y1, z1, x2, y2, z2 *big.Int) (*big.Int, *big.Int, *big.Int)](#CurveParams.addJacobian)
        * [func (curve *CurveParams) Double(x1, y1 *big.Int) (*big.Int, *big.Int)](#CurveParams.Double)
        * [func (curve *CurveParams) doubleJacobian(x, y, z *big.Int) (*big.Int, *big.Int, *big.Int)](#CurveParams.doubleJacobian)
        * [func (curve *CurveParams) ScalarMult(Bx, By *big.Int, k []byte) (*big.Int, *big.Int)](#CurveParams.ScalarMult)
        * [func (curve *CurveParams) ScalarBaseMult(k []byte) (*big.Int, *big.Int)](#CurveParams.ScalarBaseMult)
    * [type p224Curve struct](#p224Curve)
        * [func (curve p224Curve) Params() *CurveParams](#p224Curve.Params)
        * [func (curve p224Curve) IsOnCurve(bigX, bigY *big.Int) bool](#p224Curve.IsOnCurve)
        * [func (p224Curve) Add(bigX1, bigY1, bigX2, bigY2 *big.Int) (x, y *big.Int)](#p224Curve.Add)
        * [func (p224Curve) Double(bigX1, bigY1 *big.Int) (x, y *big.Int)](#p224Curve.Double)
        * [func (p224Curve) ScalarMult(bigX1, bigY1 *big.Int, scalar []byte) (x, y *big.Int)](#p224Curve.ScalarMult)
        * [func (curve p224Curve) ScalarBaseMult(scalar []byte) (x, y *big.Int)](#p224Curve.ScalarBaseMult)
    * [type p224FieldElement [8]uint32](#p224FieldElement)
        * [func (p224FieldElement) Generate(rand *rand.Rand, size int) reflect.Value](#p224FieldElement.Generate)
    * [type p224LargeFieldElement [15]uint64](#p224LargeFieldElement)
    * [type p256Curve struct](#p256Curve)
        * [func (curve p256Curve) Params() *CurveParams](#p256Curve.Params)
        * [func (curve p256Curve) Inverse(k *big.Int) *big.Int](#p256Curve.Inverse)
        * [func (curve p256Curve) CombinedMult(bigX, bigY *big.Int, baseScalar, scalar []byte) (x, y *big.Int)](#p256Curve.CombinedMult)
        * [func (curve p256Curve) ScalarBaseMult(scalar []byte) (x, y *big.Int)](#p256Curve.ScalarBaseMult)
        * [func (curve p256Curve) ScalarMult(bigX, bigY *big.Int, scalar []byte) (x, y *big.Int)](#p256Curve.ScalarMult)
    * [type p256Point struct](#p256Point)
        * [func (p *p256Point) p256PointToAffine() (x, y *big.Int)](#p256Point.p256PointToAffine)
        * [func (p *p256Point) CopyConditional(src *p256Point, v int)](#p256Point.CopyConditional)
        * [func (p *p256Point) p256StorePoint(r *[16 * 4 * 3]uint64, index int)](#p256Point.p256StorePoint)
        * [func (p *p256Point) p256BaseMult(scalar []uint64)](#p256Point.p256BaseMult)
        * [func (p *p256Point) p256ScalarMult(scalar []uint64)](#p256Point.p256ScalarMult)
    * [type p521Curve struct](#p521Curve)
        * [func (curve p521Curve) Params() *CurveParams](#p521Curve.Params)
        * [func (curve p521Curve) IsOnCurve(x, y *big.Int) bool](#p521Curve.IsOnCurve)
        * [func (curve p521Curve) affineFromJacobian(p *p521Point) (x, y *big.Int)](#p521Curve.affineFromJacobian)
        * [func (curve p521Curve) jacobianFromAffine(x, y *big.Int) *p521Point](#p521Curve.jacobianFromAffine)
        * [func (curve p521Curve) Add(x1, y1, x2, y2 *big.Int) (*big.Int, *big.Int)](#p521Curve.Add)
        * [func (curve p521Curve) Double(x1, y1 *big.Int) (*big.Int, *big.Int)](#p521Curve.Double)
        * [func (curve p521Curve) ScalarMult(Bx, By *big.Int, scalar []byte) (*big.Int, *big.Int)](#p521Curve.ScalarMult)
        * [func (curve p521Curve) ScalarBaseMult(k []byte) (*big.Int, *big.Int)](#p521Curve.ScalarBaseMult)
    * [type p521Point struct](#p521Point)
        * [func (q *p521Point) addJacobian(p1, p2 *p521Point) *p521Point](#p521Point.addJacobian)
        * [func (q *p521Point) doubleJacobian(p *p521Point) *p521Point](#p521Point.doubleJacobian)
    * [type baseMultTest struct](#baseMultTest)
    * [type scalarMultTest struct](#scalarMultTest)
    * [type synthCombinedMult struct](#synthCombinedMult)
        * [func (s synthCombinedMult) CombinedMult(bigX, bigY *big.Int, baseScalar, scalar []byte) (x, y *big.Int)](#synthCombinedMult.CombinedMult)
* [Functions](#func)
    * [func zForAffine(x, y *big.Int) *big.Int](#zForAffine)
    * [func GenerateKey(curve Curve, rand io.Reader) (priv []byte, x, y *big.Int, err error)](#GenerateKey)
    * [func Marshal(curve Curve, x, y *big.Int) []byte](#Marshal)
    * [func MarshalCompressed(curve Curve, x, y *big.Int) []byte](#MarshalCompressed)
    * [func Unmarshal(curve Curve, data []byte) (x, y *big.Int)](#Unmarshal)
    * [func UnmarshalCompressed(curve Curve, data []byte) (x, y *big.Int)](#UnmarshalCompressed)
    * [func initAll()](#initAll)
    * [func initP384()](#initP384)
    * [func initP224()](#initP224)
    * [func p224IsZero(a *p224FieldElement) uint32](#p224IsZero)
    * [func p224Add(out, a, b *p224FieldElement)](#p224Add)
    * [func p224Sub(out, a, b *p224FieldElement)](#p224Sub)
    * [func p224Mul(out, a, b *p224FieldElement, tmp *p224LargeFieldElement)](#p224Mul)
    * [func p224Square(out, a *p224FieldElement, tmp *p224LargeFieldElement)](#p224Square)
    * [func p224ReduceLarge(out *p224FieldElement, in *p224LargeFieldElement)](#p224ReduceLarge)
    * [func p224Reduce(a *p224FieldElement)](#p224Reduce)
    * [func p224Invert(out, in *p224FieldElement)](#p224Invert)
    * [func p224Contract(out, in *p224FieldElement)](#p224Contract)
    * [func p224AddJacobian(x3, y3, z3, x1, y1, z1, x2, y2, z2 *p224FieldElement)](#p224AddJacobian)
    * [func p224DoubleJacobian(x3, y3, z3, x1, y1, z1 *p224FieldElement)](#p224DoubleJacobian)
    * [func p224CopyConditional(out, in *p224FieldElement, control uint32)](#p224CopyConditional)
    * [func p224ScalarMult(outX, outY, outZ, inX, inY, inZ *p224FieldElement, scalar []byte)](#p224ScalarMult)
    * [func p224ToAffine(x, y, z *p224FieldElement) (*big.Int, *big.Int)](#p224ToAffine)
    * [func get28BitsFromEnd(buf []byte, shift uint) (uint32, []byte)](#get28BitsFromEnd)
    * [func p224FromBig(out *p224FieldElement, in *big.Int)](#p224FromBig)
    * [func p224ToBig(in *p224FieldElement) *big.Int](#p224ToBig)
    * [func initP256()](#initP256)
    * [func p256Mul(res, in1, in2 []uint64)](#p256Mul)
    * [func p256Sqr(res, in []uint64, n int)](#p256Sqr)
    * [func p256FromMont(res, in []uint64)](#p256FromMont)
    * [func p256NegCond(val []uint64, cond int)](#p256NegCond)
    * [func p256MovCond(res, a, b []uint64, cond int)](#p256MovCond)
    * [func p256BigToLittle(res []uint64, in []byte)](#p256BigToLittle)
    * [func p256LittleToBig(res []byte, in []uint64)](#p256LittleToBig)
    * [func p256Select(point, table []uint64, idx int)](#p256Select)
    * [func p256SelectBase(point, table []uint64, idx int)](#p256SelectBase)
    * [func p256OrdMul(res, in1, in2 []uint64)](#p256OrdMul)
    * [func p256OrdSqr(res, in []uint64, n int)](#p256OrdSqr)
    * [func p256PointAddAffineAsm(res, in1, in2 []uint64, sign, sel, zero int)](#p256PointAddAffineAsm)
    * [func p256PointAddAsm(res, in1, in2 []uint64) int](#p256PointAddAsm)
    * [func p256PointDoubleAsm(res, in []uint64)](#p256PointDoubleAsm)
    * [func fromBig(out []uint64, big *big.Int)](#fromBig)
    * [func p256GetScalar(out []uint64, in []byte)](#p256GetScalar)
    * [func maybeReduceModP(in *big.Int) *big.Int](#maybeReduceModP)
    * [func uint64IsZero(x uint64) int](#uint64IsZero)
    * [func scalarIsZero(scalar []uint64) int](#scalarIsZero)
    * [func p256Inverse(out, in []uint64)](#p256Inverse)
    * [func boothW5(in uint) (int, int)](#boothW5)
    * [func boothW6(in uint) (int, int)](#boothW6)
    * [func initP521()](#initP521)
    * [func fiatP521ToBigInt(x *fiat.P521Element) *big.Int](#fiatP521ToBigInt)
    * [func bigIntToFiatP521(x *big.Int) *fiat.P521Element](#bigIntToFiatP521)
    * [func testAllCurves(t *testing.T, f func(*testing.T, Curve))](#testAllCurves)
    * [func TestOnCurve(t *testing.T)](#TestOnCurve)
    * [func TestOffCurve(t *testing.T)](#TestOffCurve)
    * [func TestInfinity(t *testing.T)](#TestInfinity)
    * [func testInfinity(t *testing.T, curve Curve)](#testInfinity)
    * [func TestMarshal(t *testing.T)](#TestMarshal)
    * [func TestUnmarshalToLargeCoordinates(t *testing.T)](#TestUnmarshalToLargeCoordinates)
    * [func testUnmarshalToLargeCoordinates(t *testing.T, curve Curve)](#testUnmarshalToLargeCoordinates)
    * [func TestMarshalCompressed(t *testing.T)](#TestMarshalCompressed)
    * [func testMarshalCompressed(t *testing.T, curve Curve, x, y *big.Int, want []byte)](#testMarshalCompressed)
    * [func benchmarkAllCurves(t *testing.B, f func(*testing.B, Curve))](#benchmarkAllCurves)
    * [func BenchmarkScalarBaseMult(b *testing.B)](#BenchmarkScalarBaseMult)
    * [func BenchmarkScalarMult(b *testing.B)](#BenchmarkScalarMult)
    * [func TestFuzz(t *testing.T)](#TestFuzz)
    * [func p224AlternativeToBig(in *p224FieldElement) *big.Int](#p224AlternativeToBig)
    * [func TestP224ToFromBig(t *testing.T)](#TestP224ToFromBig)
    * [func generateLimb(rand *rand.Rand) uint32](#generateLimb)
    * [func isInBounds(x *p224FieldElement) bool](#isInBounds)
    * [func TestP224Mul(t *testing.T)](#TestP224Mul)
    * [func TestP224Square(t *testing.T)](#TestP224Square)
    * [func TestP224Add(t *testing.T)](#TestP224Add)
    * [func TestP224Reduce(t *testing.T)](#TestP224Reduce)
    * [func TestP224Contract(t *testing.T)](#TestP224Contract)
    * [func TestP224IsZero(t *testing.T)](#TestP224IsZero)
    * [func TestP224Invert(t *testing.T)](#TestP224Invert)
    * [func TestP224BaseMult(t *testing.T)](#TestP224BaseMult)
    * [func TestP224GenericBaseMult(t *testing.T)](#TestP224GenericBaseMult)
    * [func TestP224Overflow(t *testing.T)](#TestP224Overflow)
    * [func TestP256PrecomputedTable(t *testing.T)](#TestP256PrecomputedTable)
    * [func TestP256BaseMult(t *testing.T)](#TestP256BaseMult)
    * [func TestP256Mult(t *testing.T)](#TestP256Mult)
    * [func TestP256CombinedMult(t *testing.T)](#TestP256CombinedMult)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="two31p3" href="#two31p3">const two31p3</a>

```
searchKey: elliptic.two31p3
```

```Go
const two31p3 = 1<<31 + 1<<3
```

### <a id="two31m3" href="#two31m3">const two31m3</a>

```
searchKey: elliptic.two31m3
```

```Go
const two31m3 = 1<<31 - 1<<3
```

### <a id="two31m15m3" href="#two31m15m3">const two31m15m3</a>

```
searchKey: elliptic.two31m15m3
```

```Go
const two31m15m3 = 1<<31 - 1<<15 - 1<<3
```

### <a id="two63p35" href="#two63p35">const two63p35</a>

```
searchKey: elliptic.two63p35
```

```Go
const two63p35 = 1<<63 + 1<<35
```

### <a id="two63m35" href="#two63m35">const two63m35</a>

```
searchKey: elliptic.two63m35
```

```Go
const two63m35 = 1<<63 - 1<<35
```

### <a id="two63m35m19" href="#two63m35m19">const two63m35m19</a>

```
searchKey: elliptic.two63m35m19
```

```Go
const two63m35m19 = 1<<63 - 1<<35 - 1<<19
```

### <a id="bottom12Bits" href="#bottom12Bits">const bottom12Bits</a>

```
searchKey: elliptic.bottom12Bits
```

```Go
const bottom12Bits = 0xfff
```

### <a id="bottom28Bits" href="#bottom28Bits">const bottom28Bits</a>

```
searchKey: elliptic.bottom28Bits
```

```Go
const bottom28Bits = 0xfffffff
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="mask" href="#mask">var mask</a>

```
searchKey: elliptic.mask
```

```Go
var mask = []byte{0xff, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f}
```

### <a id="initonce" href="#initonce">var initonce</a>

```
searchKey: elliptic.initonce
```

```Go
var initonce sync.Once
```

### <a id="p384" href="#p384">var p384</a>

```
searchKey: elliptic.p384
```

```Go
var p384 *CurveParams
```

### <a id="p224" href="#p224">var p224</a>

```
searchKey: elliptic.p224
```

```Go
var p224 p224Curve
```

### <a id="p224P" href="#p224P">var p224P</a>

```
searchKey: elliptic.p224P
```

```Go
var p224P = [8]uint32{1, 0, 0, 0xffff000, 0xfffffff, 0xfffffff, 0xfffffff, 0xfffffff}
```

p224P is the order of the field, represented as a p224FieldElement. 

### <a id="p224ZeroModP31" href="#p224ZeroModP31">var p224ZeroModP31</a>

```
searchKey: elliptic.p224ZeroModP31
```

```Go
var p224ZeroModP31 = ...
```

p224ZeroModP31 is 0 mod p where bit 31 is set in all limbs so that we can subtract smaller amounts without underflow. See the section "Subtraction" in [1] for reasoning. 

### <a id="p224ZeroModP63" href="#p224ZeroModP63">var p224ZeroModP63</a>

```
searchKey: elliptic.p224ZeroModP63
```

```Go
var p224ZeroModP63 = ...
```

p224ZeroModP63 is 0 mod p where bit 63 is set in all limbs. See the section "Subtraction" in [1] for why. 

### <a id="p256" href="#p256">var p256</a>

```
searchKey: elliptic.p256
```

```Go
var p256 p256Curve
```

### <a id="rr" href="#rr">var rr</a>

```
searchKey: elliptic.rr
```

```Go
var rr = []uint64{0x0000000000000003, 0xfffffffbffffffff, 0xfffffffffffffffe, 0x00000004fffffffd}
```

p256Mul operates in a Montgomery domain with R = 2^256 mod p, where p is the underlying field of the curve. (See initP256 for the value.) Thus rr here is R×R mod p. See comment in Inverse about how this is used. 

### <a id="p256Precomputed" href="#p256Precomputed">var p256Precomputed</a>

```
searchKey: elliptic.p256Precomputed
```

```Go
var p256Precomputed = ...
```

### <a id="p521" href="#p521">var p521</a>

```
searchKey: elliptic.p521
```

```Go
var p521 p521Curve
```

### <a id="p521Params" href="#p521Params">var p521Params</a>

```
searchKey: elliptic.p521Params
```

```Go
var p521Params *CurveParams
```

### <a id="toFromBigTests" href="#toFromBigTests">var toFromBigTests</a>

```
searchKey: elliptic.toFromBigTests
```

```Go
var toFromBigTests = ...
```

### <a id="quickCheckConfig32" href="#quickCheckConfig32">var quickCheckConfig32</a>

```
searchKey: elliptic.quickCheckConfig32
```

```Go
var quickCheckConfig32 = &quick.Config{MaxCountScale: 32}
```

quickCheckConfig32 will make each quickcheck test run (32 * -quickchecks) times. The default value of -quickchecks is 100. 

### <a id="weirdLimbs" href="#weirdLimbs">var weirdLimbs</a>

```
searchKey: elliptic.weirdLimbs
```

```Go
var weirdLimbs = ...
```

weirdLimbs can be combined to generate a range of edge-case field elements. 

### <a id="p224BaseMultTests" href="#p224BaseMultTests">var p224BaseMultTests</a>

```
searchKey: elliptic.p224BaseMultTests
```

```Go
var p224BaseMultTests = ...
```

### <a id="p256MultTests" href="#p256MultTests">var p256MultTests</a>

```
searchKey: elliptic.p256MultTests
```

```Go
var p256MultTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Curve" href="#Curve">type Curve interface</a>

```
searchKey: elliptic.Curve
tags: [exported]
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

#### <a id="matchesSpecificCurve" href="#matchesSpecificCurve">func matchesSpecificCurve(params *CurveParams, available ...Curve) (Curve, bool)</a>

```
searchKey: elliptic.matchesSpecificCurve
```

```Go
func matchesSpecificCurve(params *CurveParams, available ...Curve) (Curve, bool)
```

#### <a id="P256" href="#P256">func P256() Curve</a>

```
searchKey: elliptic.P256
tags: [exported]
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
tags: [exported]
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
tags: [exported]
```

```Go
func P521() Curve
```

P521 returns a Curve which implements NIST P-521 (FIPS 186-3, section D.2.5), also known as secp521r1. The CurveParams.Name of this Curve is "P-521". 

Multiple invocations of this function will return the same value, so it can be used for equality checks and switch statements. 

The cryptographic operations are implemented using constant-time algorithms. 

#### <a id="P224" href="#P224">func P224() Curve</a>

```
searchKey: elliptic.P224
tags: [exported]
```

```Go
func P224() Curve
```

P224 returns a Curve which implements P-224 (see FIPS 186-3, section D.2.2). 

The cryptographic operations are implemented using constant-time algorithms. 

### <a id="CurveParams" href="#CurveParams">type CurveParams struct</a>

```
searchKey: elliptic.CurveParams
tags: [exported]
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
```

```Go
func genericParamsForCurve(c Curve) *CurveParams
```

genericParamsForCurve returns the dereferenced CurveParams for the specified curve. This is used to avoid the logic for upgrading a curve to it's specific implementation, forcing usage of the generic implementation. This is only relevant for the P224, P256, and P521 curves. 

#### <a id="CurveParams.Params" href="#CurveParams.Params">func (curve *CurveParams) Params() *CurveParams</a>

```
searchKey: elliptic.CurveParams.Params
tags: [exported]
```

```Go
func (curve *CurveParams) Params() *CurveParams
```

#### <a id="CurveParams.polynomial" href="#CurveParams.polynomial">func (curve *CurveParams) polynomial(x *big.Int) *big.Int</a>

```
searchKey: elliptic.CurveParams.polynomial
```

```Go
func (curve *CurveParams) polynomial(x *big.Int) *big.Int
```

polynomial returns x³ - 3x + b. 

#### <a id="CurveParams.IsOnCurve" href="#CurveParams.IsOnCurve">func (curve *CurveParams) IsOnCurve(x, y *big.Int) bool</a>

```
searchKey: elliptic.CurveParams.IsOnCurve
tags: [exported]
```

```Go
func (curve *CurveParams) IsOnCurve(x, y *big.Int) bool
```

#### <a id="CurveParams.affineFromJacobian" href="#CurveParams.affineFromJacobian">func (curve *CurveParams) affineFromJacobian(x, y, z *big.Int) (xOut, yOut *big.Int)</a>

```
searchKey: elliptic.CurveParams.affineFromJacobian
```

```Go
func (curve *CurveParams) affineFromJacobian(x, y, z *big.Int) (xOut, yOut *big.Int)
```

affineFromJacobian reverses the Jacobian transform. See the comment at the top of the file. If the point is ∞ it returns 0, 0. 

#### <a id="CurveParams.Add" href="#CurveParams.Add">func (curve *CurveParams) Add(x1, y1, x2, y2 *big.Int) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.CurveParams.Add
tags: [exported]
```

```Go
func (curve *CurveParams) Add(x1, y1, x2, y2 *big.Int) (*big.Int, *big.Int)
```

#### <a id="CurveParams.addJacobian" href="#CurveParams.addJacobian">func (curve *CurveParams) addJacobian(x1, y1, z1, x2, y2, z2 *big.Int) (*big.Int, *big.Int, *big.Int)</a>

```
searchKey: elliptic.CurveParams.addJacobian
```

```Go
func (curve *CurveParams) addJacobian(x1, y1, z1, x2, y2, z2 *big.Int) (*big.Int, *big.Int, *big.Int)
```

addJacobian takes two points in Jacobian coordinates, (x1, y1, z1) and (x2, y2, z2) and returns their sum, also in Jacobian form. 

#### <a id="CurveParams.Double" href="#CurveParams.Double">func (curve *CurveParams) Double(x1, y1 *big.Int) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.CurveParams.Double
tags: [exported]
```

```Go
func (curve *CurveParams) Double(x1, y1 *big.Int) (*big.Int, *big.Int)
```

#### <a id="CurveParams.doubleJacobian" href="#CurveParams.doubleJacobian">func (curve *CurveParams) doubleJacobian(x, y, z *big.Int) (*big.Int, *big.Int, *big.Int)</a>

```
searchKey: elliptic.CurveParams.doubleJacobian
```

```Go
func (curve *CurveParams) doubleJacobian(x, y, z *big.Int) (*big.Int, *big.Int, *big.Int)
```

doubleJacobian takes a point in Jacobian coordinates, (x, y, z), and returns its double, also in Jacobian form. 

#### <a id="CurveParams.ScalarMult" href="#CurveParams.ScalarMult">func (curve *CurveParams) ScalarMult(Bx, By *big.Int, k []byte) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.CurveParams.ScalarMult
tags: [exported]
```

```Go
func (curve *CurveParams) ScalarMult(Bx, By *big.Int, k []byte) (*big.Int, *big.Int)
```

#### <a id="CurveParams.ScalarBaseMult" href="#CurveParams.ScalarBaseMult">func (curve *CurveParams) ScalarBaseMult(k []byte) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.CurveParams.ScalarBaseMult
tags: [exported]
```

```Go
func (curve *CurveParams) ScalarBaseMult(k []byte) (*big.Int, *big.Int)
```

### <a id="p224Curve" href="#p224Curve">type p224Curve struct</a>

```
searchKey: elliptic.p224Curve
```

```Go
type p224Curve struct {
	*CurveParams
	gx, gy, b p224FieldElement
}
```

#### <a id="p224Curve.Params" href="#p224Curve.Params">func (curve p224Curve) Params() *CurveParams</a>

```
searchKey: elliptic.p224Curve.Params
```

```Go
func (curve p224Curve) Params() *CurveParams
```

#### <a id="p224Curve.IsOnCurve" href="#p224Curve.IsOnCurve">func (curve p224Curve) IsOnCurve(bigX, bigY *big.Int) bool</a>

```
searchKey: elliptic.p224Curve.IsOnCurve
```

```Go
func (curve p224Curve) IsOnCurve(bigX, bigY *big.Int) bool
```

#### <a id="p224Curve.Add" href="#p224Curve.Add">func (p224Curve) Add(bigX1, bigY1, bigX2, bigY2 *big.Int) (x, y *big.Int)</a>

```
searchKey: elliptic.p224Curve.Add
```

```Go
func (p224Curve) Add(bigX1, bigY1, bigX2, bigY2 *big.Int) (x, y *big.Int)
```

#### <a id="p224Curve.Double" href="#p224Curve.Double">func (p224Curve) Double(bigX1, bigY1 *big.Int) (x, y *big.Int)</a>

```
searchKey: elliptic.p224Curve.Double
```

```Go
func (p224Curve) Double(bigX1, bigY1 *big.Int) (x, y *big.Int)
```

#### <a id="p224Curve.ScalarMult" href="#p224Curve.ScalarMult">func (p224Curve) ScalarMult(bigX1, bigY1 *big.Int, scalar []byte) (x, y *big.Int)</a>

```
searchKey: elliptic.p224Curve.ScalarMult
```

```Go
func (p224Curve) ScalarMult(bigX1, bigY1 *big.Int, scalar []byte) (x, y *big.Int)
```

#### <a id="p224Curve.ScalarBaseMult" href="#p224Curve.ScalarBaseMult">func (curve p224Curve) ScalarBaseMult(scalar []byte) (x, y *big.Int)</a>

```
searchKey: elliptic.p224Curve.ScalarBaseMult
```

```Go
func (curve p224Curve) ScalarBaseMult(scalar []byte) (x, y *big.Int)
```

### <a id="p224FieldElement" href="#p224FieldElement">type p224FieldElement [8]uint32</a>

```
searchKey: elliptic.p224FieldElement
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
```

```Go
func (p224FieldElement) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="p224LargeFieldElement" href="#p224LargeFieldElement">type p224LargeFieldElement [15]uint64</a>

```
searchKey: elliptic.p224LargeFieldElement
```

```Go
type p224LargeFieldElement [15]uint64
```

LargeFieldElement also represents an element of the field. The limbs are still spaced 28-bits apart and in little-endian order. So the limbs are at 0, 28, 56, ..., 392 bits, each 64-bits wide. 

### <a id="p256Curve" href="#p256Curve">type p256Curve struct</a>

```
searchKey: elliptic.p256Curve
```

```Go
type p256Curve struct {
	*CurveParams
}
```

#### <a id="p256Curve.Params" href="#p256Curve.Params">func (curve p256Curve) Params() *CurveParams</a>

```
searchKey: elliptic.p256Curve.Params
```

```Go
func (curve p256Curve) Params() *CurveParams
```

#### <a id="p256Curve.Inverse" href="#p256Curve.Inverse">func (curve p256Curve) Inverse(k *big.Int) *big.Int</a>

```
searchKey: elliptic.p256Curve.Inverse
```

```Go
func (curve p256Curve) Inverse(k *big.Int) *big.Int
```

#### <a id="p256Curve.CombinedMult" href="#p256Curve.CombinedMult">func (curve p256Curve) CombinedMult(bigX, bigY *big.Int, baseScalar, scalar []byte) (x, y *big.Int)</a>

```
searchKey: elliptic.p256Curve.CombinedMult
```

```Go
func (curve p256Curve) CombinedMult(bigX, bigY *big.Int, baseScalar, scalar []byte) (x, y *big.Int)
```

#### <a id="p256Curve.ScalarBaseMult" href="#p256Curve.ScalarBaseMult">func (curve p256Curve) ScalarBaseMult(scalar []byte) (x, y *big.Int)</a>

```
searchKey: elliptic.p256Curve.ScalarBaseMult
```

```Go
func (curve p256Curve) ScalarBaseMult(scalar []byte) (x, y *big.Int)
```

#### <a id="p256Curve.ScalarMult" href="#p256Curve.ScalarMult">func (curve p256Curve) ScalarMult(bigX, bigY *big.Int, scalar []byte) (x, y *big.Int)</a>

```
searchKey: elliptic.p256Curve.ScalarMult
```

```Go
func (curve p256Curve) ScalarMult(bigX, bigY *big.Int, scalar []byte) (x, y *big.Int)
```

### <a id="p256Point" href="#p256Point">type p256Point struct</a>

```
searchKey: elliptic.p256Point
```

```Go
type p256Point struct {
	xyz [12]uint64
}
```

#### <a id="p256Point.p256PointToAffine" href="#p256Point.p256PointToAffine">func (p *p256Point) p256PointToAffine() (x, y *big.Int)</a>

```
searchKey: elliptic.p256Point.p256PointToAffine
```

```Go
func (p *p256Point) p256PointToAffine() (x, y *big.Int)
```

#### <a id="p256Point.CopyConditional" href="#p256Point.CopyConditional">func (p *p256Point) CopyConditional(src *p256Point, v int)</a>

```
searchKey: elliptic.p256Point.CopyConditional
```

```Go
func (p *p256Point) CopyConditional(src *p256Point, v int)
```

CopyConditional copies overwrites p with src if v == 1, and leaves p unchanged if v == 0. 

#### <a id="p256Point.p256StorePoint" href="#p256Point.p256StorePoint">func (p *p256Point) p256StorePoint(r *[16 * 4 * 3]uint64, index int)</a>

```
searchKey: elliptic.p256Point.p256StorePoint
```

```Go
func (p *p256Point) p256StorePoint(r *[16 * 4 * 3]uint64, index int)
```

#### <a id="p256Point.p256BaseMult" href="#p256Point.p256BaseMult">func (p *p256Point) p256BaseMult(scalar []uint64)</a>

```
searchKey: elliptic.p256Point.p256BaseMult
```

```Go
func (p *p256Point) p256BaseMult(scalar []uint64)
```

#### <a id="p256Point.p256ScalarMult" href="#p256Point.p256ScalarMult">func (p *p256Point) p256ScalarMult(scalar []uint64)</a>

```
searchKey: elliptic.p256Point.p256ScalarMult
```

```Go
func (p *p256Point) p256ScalarMult(scalar []uint64)
```

### <a id="p521Curve" href="#p521Curve">type p521Curve struct</a>

```
searchKey: elliptic.p521Curve
```

```Go
type p521Curve struct {
	*CurveParams
}
```

#### <a id="p521Curve.Params" href="#p521Curve.Params">func (curve p521Curve) Params() *CurveParams</a>

```
searchKey: elliptic.p521Curve.Params
```

```Go
func (curve p521Curve) Params() *CurveParams
```

#### <a id="p521Curve.IsOnCurve" href="#p521Curve.IsOnCurve">func (curve p521Curve) IsOnCurve(x, y *big.Int) bool</a>

```
searchKey: elliptic.p521Curve.IsOnCurve
```

```Go
func (curve p521Curve) IsOnCurve(x, y *big.Int) bool
```

#### <a id="p521Curve.affineFromJacobian" href="#p521Curve.affineFromJacobian">func (curve p521Curve) affineFromJacobian(p *p521Point) (x, y *big.Int)</a>

```
searchKey: elliptic.p521Curve.affineFromJacobian
```

```Go
func (curve p521Curve) affineFromJacobian(p *p521Point) (x, y *big.Int)
```

affineFromJacobian brings a point in Jacobian coordinates back to affine coordinates, with (0, 0) representing infinity by convention. It also goes back to big.Int values to match the exposed API. 

#### <a id="p521Curve.jacobianFromAffine" href="#p521Curve.jacobianFromAffine">func (curve p521Curve) jacobianFromAffine(x, y *big.Int) *p521Point</a>

```
searchKey: elliptic.p521Curve.jacobianFromAffine
```

```Go
func (curve p521Curve) jacobianFromAffine(x, y *big.Int) *p521Point
```

jacobianFromAffine converts (x, y) affine coordinates into (x, y, z) Jacobian coordinates. It also converts from big.Int to fiat, which is necessarily a messy and variable-time operation, which we can't avoid due to the exposed API. 

#### <a id="p521Curve.Add" href="#p521Curve.Add">func (curve p521Curve) Add(x1, y1, x2, y2 *big.Int) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.p521Curve.Add
```

```Go
func (curve p521Curve) Add(x1, y1, x2, y2 *big.Int) (*big.Int, *big.Int)
```

#### <a id="p521Curve.Double" href="#p521Curve.Double">func (curve p521Curve) Double(x1, y1 *big.Int) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.p521Curve.Double
```

```Go
func (curve p521Curve) Double(x1, y1 *big.Int) (*big.Int, *big.Int)
```

#### <a id="p521Curve.ScalarMult" href="#p521Curve.ScalarMult">func (curve p521Curve) ScalarMult(Bx, By *big.Int, scalar []byte) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.p521Curve.ScalarMult
```

```Go
func (curve p521Curve) ScalarMult(Bx, By *big.Int, scalar []byte) (*big.Int, *big.Int)
```

#### <a id="p521Curve.ScalarBaseMult" href="#p521Curve.ScalarBaseMult">func (curve p521Curve) ScalarBaseMult(k []byte) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.p521Curve.ScalarBaseMult
```

```Go
func (curve p521Curve) ScalarBaseMult(k []byte) (*big.Int, *big.Int)
```

### <a id="p521Point" href="#p521Point">type p521Point struct</a>

```
searchKey: elliptic.p521Point
```

```Go
type p521Point struct {
	x, y, z *fiat.P521Element
}
```

#### <a id="p521Point.addJacobian" href="#p521Point.addJacobian">func (q *p521Point) addJacobian(p1, p2 *p521Point) *p521Point</a>

```
searchKey: elliptic.p521Point.addJacobian
```

```Go
func (q *p521Point) addJacobian(p1, p2 *p521Point) *p521Point
```

addJacobian sets q = p1 + p2, and returns q. The points may overlap. 

#### <a id="p521Point.doubleJacobian" href="#p521Point.doubleJacobian">func (q *p521Point) doubleJacobian(p *p521Point) *p521Point</a>

```
searchKey: elliptic.p521Point.doubleJacobian
```

```Go
func (q *p521Point) doubleJacobian(p *p521Point) *p521Point
```

doubleJacobian sets q = p + p, and returns q. The points may overlap. 

### <a id="baseMultTest" href="#baseMultTest">type baseMultTest struct</a>

```
searchKey: elliptic.baseMultTest
```

```Go
type baseMultTest struct {
	k    string
	x, y string
}
```

### <a id="scalarMultTest" href="#scalarMultTest">type scalarMultTest struct</a>

```
searchKey: elliptic.scalarMultTest
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
```

```Go
type synthCombinedMult struct {
	Curve
}
```

#### <a id="synthCombinedMult.CombinedMult" href="#synthCombinedMult.CombinedMult">func (s synthCombinedMult) CombinedMult(bigX, bigY *big.Int, baseScalar, scalar []byte) (x, y *big.Int)</a>

```
searchKey: elliptic.synthCombinedMult.CombinedMult
```

```Go
func (s synthCombinedMult) CombinedMult(bigX, bigY *big.Int, baseScalar, scalar []byte) (x, y *big.Int)
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="zForAffine" href="#zForAffine">func zForAffine(x, y *big.Int) *big.Int</a>

```
searchKey: elliptic.zForAffine
```

```Go
func zForAffine(x, y *big.Int) *big.Int
```

zForAffine returns a Jacobian Z value for the affine point (x, y). If x and y are zero, it assumes that they represent the point at infinity because (0, 0) is not on the any of the curves handled here. 

### <a id="GenerateKey" href="#GenerateKey">func GenerateKey(curve Curve, rand io.Reader) (priv []byte, x, y *big.Int, err error)</a>

```
searchKey: elliptic.GenerateKey
tags: [exported]
```

```Go
func GenerateKey(curve Curve, rand io.Reader) (priv []byte, x, y *big.Int, err error)
```

GenerateKey returns a public/private key pair. The private key is generated using the given reader, which must return random data. 

### <a id="Marshal" href="#Marshal">func Marshal(curve Curve, x, y *big.Int) []byte</a>

```
searchKey: elliptic.Marshal
tags: [exported]
```

```Go
func Marshal(curve Curve, x, y *big.Int) []byte
```

Marshal converts a point on the curve into the uncompressed form specified in section 4.3.6 of ANSI X9.62. 

### <a id="MarshalCompressed" href="#MarshalCompressed">func MarshalCompressed(curve Curve, x, y *big.Int) []byte</a>

```
searchKey: elliptic.MarshalCompressed
tags: [exported]
```

```Go
func MarshalCompressed(curve Curve, x, y *big.Int) []byte
```

MarshalCompressed converts a point on the curve into the compressed form specified in section 4.3.6 of ANSI X9.62. 

### <a id="Unmarshal" href="#Unmarshal">func Unmarshal(curve Curve, data []byte) (x, y *big.Int)</a>

```
searchKey: elliptic.Unmarshal
tags: [exported]
```

```Go
func Unmarshal(curve Curve, data []byte) (x, y *big.Int)
```

Unmarshal converts a point, serialized by Marshal, into an x, y pair. It is an error if the point is not in uncompressed form or is not on the curve. On error, x = nil. 

### <a id="UnmarshalCompressed" href="#UnmarshalCompressed">func UnmarshalCompressed(curve Curve, data []byte) (x, y *big.Int)</a>

```
searchKey: elliptic.UnmarshalCompressed
tags: [exported]
```

```Go
func UnmarshalCompressed(curve Curve, data []byte) (x, y *big.Int)
```

UnmarshalCompressed converts a point, serialized by MarshalCompressed, into an x, y pair. It is an error if the point is not in compressed form or is not on the curve. On error, x = nil. 

### <a id="initAll" href="#initAll">func initAll()</a>

```
searchKey: elliptic.initAll
```

```Go
func initAll()
```

### <a id="initP384" href="#initP384">func initP384()</a>

```
searchKey: elliptic.initP384
```

```Go
func initP384()
```

### <a id="initP224" href="#initP224">func initP224()</a>

```
searchKey: elliptic.initP224
```

```Go
func initP224()
```

### <a id="p224IsZero" href="#p224IsZero">func p224IsZero(a *p224FieldElement) uint32</a>

```
searchKey: elliptic.p224IsZero
```

```Go
func p224IsZero(a *p224FieldElement) uint32
```

p224IsZero returns 1 if a == 0 mod p and 0 otherwise. 

a[i] < 2**29 

### <a id="p224Add" href="#p224Add">func p224Add(out, a, b *p224FieldElement)</a>

```
searchKey: elliptic.p224Add
```

```Go
func p224Add(out, a, b *p224FieldElement)
```

p224Add computes *out = a+b 

a[i] + b[i] < 2**32 

### <a id="p224Sub" href="#p224Sub">func p224Sub(out, a, b *p224FieldElement)</a>

```
searchKey: elliptic.p224Sub
```

```Go
func p224Sub(out, a, b *p224FieldElement)
```

p224Sub computes *out = a-b 

a[i], b[i] < 2**30 out[i] < 2**32 

### <a id="p224Mul" href="#p224Mul">func p224Mul(out, a, b *p224FieldElement, tmp *p224LargeFieldElement)</a>

```
searchKey: elliptic.p224Mul
```

```Go
func p224Mul(out, a, b *p224FieldElement, tmp *p224LargeFieldElement)
```

p224Mul computes *out = a*b 

a[i] < 2**29, b[i] < 2**30 (or vice versa) out[i] < 2**29 

### <a id="p224Square" href="#p224Square">func p224Square(out, a *p224FieldElement, tmp *p224LargeFieldElement)</a>

```
searchKey: elliptic.p224Square
```

```Go
func p224Square(out, a *p224FieldElement, tmp *p224LargeFieldElement)
```

Square computes *out = a*a 

a[i] < 2**29 out[i] < 2**29 

### <a id="p224ReduceLarge" href="#p224ReduceLarge">func p224ReduceLarge(out *p224FieldElement, in *p224LargeFieldElement)</a>

```
searchKey: elliptic.p224ReduceLarge
```

```Go
func p224ReduceLarge(out *p224FieldElement, in *p224LargeFieldElement)
```

ReduceLarge converts a p224LargeFieldElement to a p224FieldElement. 

in[i] < 2**62 

### <a id="p224Reduce" href="#p224Reduce">func p224Reduce(a *p224FieldElement)</a>

```
searchKey: elliptic.p224Reduce
```

```Go
func p224Reduce(a *p224FieldElement)
```

Reduce reduces the coefficients of a to smaller bounds. 

On entry: a[i] < 2**31 + 2**30 On exit: a[i] < 2**29 

### <a id="p224Invert" href="#p224Invert">func p224Invert(out, in *p224FieldElement)</a>

```
searchKey: elliptic.p224Invert
```

```Go
func p224Invert(out, in *p224FieldElement)
```

p224Invert calculates *out = in**-1 by computing in**(2**224 - 2**96 - 1), i.e. Fermat's little theorem. 

### <a id="p224Contract" href="#p224Contract">func p224Contract(out, in *p224FieldElement)</a>

```
searchKey: elliptic.p224Contract
```

```Go
func p224Contract(out, in *p224FieldElement)
```

p224Contract converts a FieldElement to its unique, minimal form. 

On entry, in[i] < 2**29 On exit, out[i] < 2**28 and out < p 

### <a id="p224AddJacobian" href="#p224AddJacobian">func p224AddJacobian(x3, y3, z3, x1, y1, z1, x2, y2, z2 *p224FieldElement)</a>

```
searchKey: elliptic.p224AddJacobian
```

```Go
func p224AddJacobian(x3, y3, z3, x1, y1, z1, x2, y2, z2 *p224FieldElement)
```

p224AddJacobian computes *out = a+b where a != b. 

### <a id="p224DoubleJacobian" href="#p224DoubleJacobian">func p224DoubleJacobian(x3, y3, z3, x1, y1, z1 *p224FieldElement)</a>

```
searchKey: elliptic.p224DoubleJacobian
```

```Go
func p224DoubleJacobian(x3, y3, z3, x1, y1, z1 *p224FieldElement)
```

p224DoubleJacobian computes *out = a+a. 

### <a id="p224CopyConditional" href="#p224CopyConditional">func p224CopyConditional(out, in *p224FieldElement, control uint32)</a>

```
searchKey: elliptic.p224CopyConditional
```

```Go
func p224CopyConditional(out, in *p224FieldElement, control uint32)
```

p224CopyConditional sets *out = *in iff the least-significant-bit of control is true, and it runs in constant time. 

### <a id="p224ScalarMult" href="#p224ScalarMult">func p224ScalarMult(outX, outY, outZ, inX, inY, inZ *p224FieldElement, scalar []byte)</a>

```
searchKey: elliptic.p224ScalarMult
```

```Go
func p224ScalarMult(outX, outY, outZ, inX, inY, inZ *p224FieldElement, scalar []byte)
```

### <a id="p224ToAffine" href="#p224ToAffine">func p224ToAffine(x, y, z *p224FieldElement) (*big.Int, *big.Int)</a>

```
searchKey: elliptic.p224ToAffine
```

```Go
func p224ToAffine(x, y, z *p224FieldElement) (*big.Int, *big.Int)
```

p224ToAffine converts from Jacobian to affine form. 

### <a id="get28BitsFromEnd" href="#get28BitsFromEnd">func get28BitsFromEnd(buf []byte, shift uint) (uint32, []byte)</a>

```
searchKey: elliptic.get28BitsFromEnd
```

```Go
func get28BitsFromEnd(buf []byte, shift uint) (uint32, []byte)
```

get28BitsFromEnd returns the least-significant 28 bits from buf>>shift, where buf is interpreted as a big-endian number. 

### <a id="p224FromBig" href="#p224FromBig">func p224FromBig(out *p224FieldElement, in *big.Int)</a>

```
searchKey: elliptic.p224FromBig
```

```Go
func p224FromBig(out *p224FieldElement, in *big.Int)
```

p224FromBig sets *out = *in. 

### <a id="p224ToBig" href="#p224ToBig">func p224ToBig(in *p224FieldElement) *big.Int</a>

```
searchKey: elliptic.p224ToBig
```

```Go
func p224ToBig(in *p224FieldElement) *big.Int
```

p224ToBig returns in as a big.Int. 

### <a id="initP256" href="#initP256">func initP256()</a>

```
searchKey: elliptic.initP256
```

```Go
func initP256()
```

### <a id="p256Mul" href="#p256Mul">func p256Mul(res, in1, in2 []uint64)</a>

```
searchKey: elliptic.p256Mul
```

```Go
func p256Mul(res, in1, in2 []uint64)
```

Functions implemented in p256_asm_*64.s Montgomery multiplication modulo P256 

### <a id="p256Sqr" href="#p256Sqr">func p256Sqr(res, in []uint64, n int)</a>

```
searchKey: elliptic.p256Sqr
```

```Go
func p256Sqr(res, in []uint64, n int)
```

Montgomery square modulo P256, repeated n times (n >= 1) 

### <a id="p256FromMont" href="#p256FromMont">func p256FromMont(res, in []uint64)</a>

```
searchKey: elliptic.p256FromMont
```

```Go
func p256FromMont(res, in []uint64)
```

Montgomery multiplication by 1 

### <a id="p256NegCond" href="#p256NegCond">func p256NegCond(val []uint64, cond int)</a>

```
searchKey: elliptic.p256NegCond
```

```Go
func p256NegCond(val []uint64, cond int)
```

iff cond == 1  val <- -val 

### <a id="p256MovCond" href="#p256MovCond">func p256MovCond(res, a, b []uint64, cond int)</a>

```
searchKey: elliptic.p256MovCond
```

```Go
func p256MovCond(res, a, b []uint64, cond int)
```

if cond == 0 res <- b; else res <- a 

### <a id="p256BigToLittle" href="#p256BigToLittle">func p256BigToLittle(res []uint64, in []byte)</a>

```
searchKey: elliptic.p256BigToLittle
```

```Go
func p256BigToLittle(res []uint64, in []byte)
```

Endianness swap 

### <a id="p256LittleToBig" href="#p256LittleToBig">func p256LittleToBig(res []byte, in []uint64)</a>

```
searchKey: elliptic.p256LittleToBig
```

```Go
func p256LittleToBig(res []byte, in []uint64)
```

### <a id="p256Select" href="#p256Select">func p256Select(point, table []uint64, idx int)</a>

```
searchKey: elliptic.p256Select
```

```Go
func p256Select(point, table []uint64, idx int)
```

Constant time table access 

### <a id="p256SelectBase" href="#p256SelectBase">func p256SelectBase(point, table []uint64, idx int)</a>

```
searchKey: elliptic.p256SelectBase
```

```Go
func p256SelectBase(point, table []uint64, idx int)
```

### <a id="p256OrdMul" href="#p256OrdMul">func p256OrdMul(res, in1, in2 []uint64)</a>

```
searchKey: elliptic.p256OrdMul
```

```Go
func p256OrdMul(res, in1, in2 []uint64)
```

Montgomery multiplication modulo Ord(G) 

### <a id="p256OrdSqr" href="#p256OrdSqr">func p256OrdSqr(res, in []uint64, n int)</a>

```
searchKey: elliptic.p256OrdSqr
```

```Go
func p256OrdSqr(res, in []uint64, n int)
```

Montgomery square modulo Ord(G), repeated n times 

### <a id="p256PointAddAffineAsm" href="#p256PointAddAffineAsm">func p256PointAddAffineAsm(res, in1, in2 []uint64, sign, sel, zero int)</a>

```
searchKey: elliptic.p256PointAddAffineAsm
```

```Go
func p256PointAddAffineAsm(res, in1, in2 []uint64, sign, sel, zero int)
```

Point add with in2 being affine point If sign == 1 -> in2 = -in2 If sel == 0 -> res = in1 if zero == 0 -> res = in2 

### <a id="p256PointAddAsm" href="#p256PointAddAsm">func p256PointAddAsm(res, in1, in2 []uint64) int</a>

```
searchKey: elliptic.p256PointAddAsm
```

```Go
func p256PointAddAsm(res, in1, in2 []uint64) int
```

Point add. Returns one if the two input points were equal and zero otherwise. (Note that, due to the way that the equations work out, some representations of ∞ are considered equal to everything by this function.) 

### <a id="p256PointDoubleAsm" href="#p256PointDoubleAsm">func p256PointDoubleAsm(res, in []uint64)</a>

```
searchKey: elliptic.p256PointDoubleAsm
```

```Go
func p256PointDoubleAsm(res, in []uint64)
```

Point double 

### <a id="fromBig" href="#fromBig">func fromBig(out []uint64, big *big.Int)</a>

```
searchKey: elliptic.fromBig
```

```Go
func fromBig(out []uint64, big *big.Int)
```

fromBig converts a *big.Int into a format used by this code. 

### <a id="p256GetScalar" href="#p256GetScalar">func p256GetScalar(out []uint64, in []byte)</a>

```
searchKey: elliptic.p256GetScalar
```

```Go
func p256GetScalar(out []uint64, in []byte)
```

p256GetScalar endian-swaps the big-endian scalar value from in and writes it to out. If the scalar is equal or greater than the order of the group, it's reduced modulo that order. 

### <a id="maybeReduceModP" href="#maybeReduceModP">func maybeReduceModP(in *big.Int) *big.Int</a>

```
searchKey: elliptic.maybeReduceModP
```

```Go
func maybeReduceModP(in *big.Int) *big.Int
```

### <a id="uint64IsZero" href="#uint64IsZero">func uint64IsZero(x uint64) int</a>

```
searchKey: elliptic.uint64IsZero
```

```Go
func uint64IsZero(x uint64) int
```

uint64IsZero returns 1 if x is zero and zero otherwise. 

### <a id="scalarIsZero" href="#scalarIsZero">func scalarIsZero(scalar []uint64) int</a>

```
searchKey: elliptic.scalarIsZero
```

```Go
func scalarIsZero(scalar []uint64) int
```

scalarIsZero returns 1 if scalar represents the zero value, and zero otherwise. 

### <a id="p256Inverse" href="#p256Inverse">func p256Inverse(out, in []uint64)</a>

```
searchKey: elliptic.p256Inverse
```

```Go
func p256Inverse(out, in []uint64)
```

p256Inverse sets out to in^-1 mod p. 

### <a id="boothW5" href="#boothW5">func boothW5(in uint) (int, int)</a>

```
searchKey: elliptic.boothW5
```

```Go
func boothW5(in uint) (int, int)
```

### <a id="boothW6" href="#boothW6">func boothW6(in uint) (int, int)</a>

```
searchKey: elliptic.boothW6
```

```Go
func boothW6(in uint) (int, int)
```

### <a id="initP521" href="#initP521">func initP521()</a>

```
searchKey: elliptic.initP521
```

```Go
func initP521()
```

### <a id="fiatP521ToBigInt" href="#fiatP521ToBigInt">func fiatP521ToBigInt(x *fiat.P521Element) *big.Int</a>

```
searchKey: elliptic.fiatP521ToBigInt
```

```Go
func fiatP521ToBigInt(x *fiat.P521Element) *big.Int
```

### <a id="bigIntToFiatP521" href="#bigIntToFiatP521">func bigIntToFiatP521(x *big.Int) *fiat.P521Element</a>

```
searchKey: elliptic.bigIntToFiatP521
```

```Go
func bigIntToFiatP521(x *big.Int) *fiat.P521Element
```

### <a id="testAllCurves" href="#testAllCurves">func testAllCurves(t *testing.T, f func(*testing.T, Curve))</a>

```
searchKey: elliptic.testAllCurves
```

```Go
func testAllCurves(t *testing.T, f func(*testing.T, Curve))
```

### <a id="TestOnCurve" href="#TestOnCurve">func TestOnCurve(t *testing.T)</a>

```
searchKey: elliptic.TestOnCurve
```

```Go
func TestOnCurve(t *testing.T)
```

### <a id="TestOffCurve" href="#TestOffCurve">func TestOffCurve(t *testing.T)</a>

```
searchKey: elliptic.TestOffCurve
```

```Go
func TestOffCurve(t *testing.T)
```

### <a id="TestInfinity" href="#TestInfinity">func TestInfinity(t *testing.T)</a>

```
searchKey: elliptic.TestInfinity
```

```Go
func TestInfinity(t *testing.T)
```

### <a id="testInfinity" href="#testInfinity">func testInfinity(t *testing.T, curve Curve)</a>

```
searchKey: elliptic.testInfinity
```

```Go
func testInfinity(t *testing.T, curve Curve)
```

### <a id="TestMarshal" href="#TestMarshal">func TestMarshal(t *testing.T)</a>

```
searchKey: elliptic.TestMarshal
```

```Go
func TestMarshal(t *testing.T)
```

### <a id="TestUnmarshalToLargeCoordinates" href="#TestUnmarshalToLargeCoordinates">func TestUnmarshalToLargeCoordinates(t *testing.T)</a>

```
searchKey: elliptic.TestUnmarshalToLargeCoordinates
```

```Go
func TestUnmarshalToLargeCoordinates(t *testing.T)
```

### <a id="testUnmarshalToLargeCoordinates" href="#testUnmarshalToLargeCoordinates">func testUnmarshalToLargeCoordinates(t *testing.T, curve Curve)</a>

```
searchKey: elliptic.testUnmarshalToLargeCoordinates
```

```Go
func testUnmarshalToLargeCoordinates(t *testing.T, curve Curve)
```

### <a id="TestMarshalCompressed" href="#TestMarshalCompressed">func TestMarshalCompressed(t *testing.T)</a>

```
searchKey: elliptic.TestMarshalCompressed
```

```Go
func TestMarshalCompressed(t *testing.T)
```

### <a id="testMarshalCompressed" href="#testMarshalCompressed">func testMarshalCompressed(t *testing.T, curve Curve, x, y *big.Int, want []byte)</a>

```
searchKey: elliptic.testMarshalCompressed
```

```Go
func testMarshalCompressed(t *testing.T, curve Curve, x, y *big.Int, want []byte)
```

### <a id="benchmarkAllCurves" href="#benchmarkAllCurves">func benchmarkAllCurves(t *testing.B, f func(*testing.B, Curve))</a>

```
searchKey: elliptic.benchmarkAllCurves
```

```Go
func benchmarkAllCurves(t *testing.B, f func(*testing.B, Curve))
```

### <a id="BenchmarkScalarBaseMult" href="#BenchmarkScalarBaseMult">func BenchmarkScalarBaseMult(b *testing.B)</a>

```
searchKey: elliptic.BenchmarkScalarBaseMult
```

```Go
func BenchmarkScalarBaseMult(b *testing.B)
```

### <a id="BenchmarkScalarMult" href="#BenchmarkScalarMult">func BenchmarkScalarMult(b *testing.B)</a>

```
searchKey: elliptic.BenchmarkScalarMult
```

```Go
func BenchmarkScalarMult(b *testing.B)
```

### <a id="TestFuzz" href="#TestFuzz">func TestFuzz(t *testing.T)</a>

```
searchKey: elliptic.TestFuzz
```

```Go
func TestFuzz(t *testing.T)
```

### <a id="p224AlternativeToBig" href="#p224AlternativeToBig">func p224AlternativeToBig(in *p224FieldElement) *big.Int</a>

```
searchKey: elliptic.p224AlternativeToBig
```

```Go
func p224AlternativeToBig(in *p224FieldElement) *big.Int
```

### <a id="TestP224ToFromBig" href="#TestP224ToFromBig">func TestP224ToFromBig(t *testing.T)</a>

```
searchKey: elliptic.TestP224ToFromBig
```

```Go
func TestP224ToFromBig(t *testing.T)
```

### <a id="generateLimb" href="#generateLimb">func generateLimb(rand *rand.Rand) uint32</a>

```
searchKey: elliptic.generateLimb
```

```Go
func generateLimb(rand *rand.Rand) uint32
```

### <a id="isInBounds" href="#isInBounds">func isInBounds(x *p224FieldElement) bool</a>

```
searchKey: elliptic.isInBounds
```

```Go
func isInBounds(x *p224FieldElement) bool
```

### <a id="TestP224Mul" href="#TestP224Mul">func TestP224Mul(t *testing.T)</a>

```
searchKey: elliptic.TestP224Mul
```

```Go
func TestP224Mul(t *testing.T)
```

### <a id="TestP224Square" href="#TestP224Square">func TestP224Square(t *testing.T)</a>

```
searchKey: elliptic.TestP224Square
```

```Go
func TestP224Square(t *testing.T)
```

### <a id="TestP224Add" href="#TestP224Add">func TestP224Add(t *testing.T)</a>

```
searchKey: elliptic.TestP224Add
```

```Go
func TestP224Add(t *testing.T)
```

### <a id="TestP224Reduce" href="#TestP224Reduce">func TestP224Reduce(t *testing.T)</a>

```
searchKey: elliptic.TestP224Reduce
```

```Go
func TestP224Reduce(t *testing.T)
```

### <a id="TestP224Contract" href="#TestP224Contract">func TestP224Contract(t *testing.T)</a>

```
searchKey: elliptic.TestP224Contract
```

```Go
func TestP224Contract(t *testing.T)
```

### <a id="TestP224IsZero" href="#TestP224IsZero">func TestP224IsZero(t *testing.T)</a>

```
searchKey: elliptic.TestP224IsZero
```

```Go
func TestP224IsZero(t *testing.T)
```

### <a id="TestP224Invert" href="#TestP224Invert">func TestP224Invert(t *testing.T)</a>

```
searchKey: elliptic.TestP224Invert
```

```Go
func TestP224Invert(t *testing.T)
```

### <a id="TestP224BaseMult" href="#TestP224BaseMult">func TestP224BaseMult(t *testing.T)</a>

```
searchKey: elliptic.TestP224BaseMult
```

```Go
func TestP224BaseMult(t *testing.T)
```

### <a id="TestP224GenericBaseMult" href="#TestP224GenericBaseMult">func TestP224GenericBaseMult(t *testing.T)</a>

```
searchKey: elliptic.TestP224GenericBaseMult
```

```Go
func TestP224GenericBaseMult(t *testing.T)
```

### <a id="TestP224Overflow" href="#TestP224Overflow">func TestP224Overflow(t *testing.T)</a>

```
searchKey: elliptic.TestP224Overflow
```

```Go
func TestP224Overflow(t *testing.T)
```

### <a id="TestP256PrecomputedTable" href="#TestP256PrecomputedTable">func TestP256PrecomputedTable(t *testing.T)</a>

```
searchKey: elliptic.TestP256PrecomputedTable
```

```Go
func TestP256PrecomputedTable(t *testing.T)
```

### <a id="TestP256BaseMult" href="#TestP256BaseMult">func TestP256BaseMult(t *testing.T)</a>

```
searchKey: elliptic.TestP256BaseMult
```

```Go
func TestP256BaseMult(t *testing.T)
```

### <a id="TestP256Mult" href="#TestP256Mult">func TestP256Mult(t *testing.T)</a>

```
searchKey: elliptic.TestP256Mult
```

```Go
func TestP256Mult(t *testing.T)
```

### <a id="TestP256CombinedMult" href="#TestP256CombinedMult">func TestP256CombinedMult(t *testing.T)</a>

```
searchKey: elliptic.TestP256CombinedMult
```

```Go
func TestP256CombinedMult(t *testing.T)
```

