# Package ecdsa

Package ecdsa implements the Elliptic Curve Digital Signature Algorithm, as defined in FIPS 186-3. 

This implementation derives the nonce from an AES-CTR CSPRNG keyed by: 

SHA2-512(priv.D || entropy || hash)[:32] 

The CSPRNG key is indifferentiable from a random oracle as shown in [Coron], the AES-CTR stream is indifferentiable from a random oracle under standard cryptographic assumptions (see [Larsson] for examples). 

References: 

```
[Coron]
  [https://cs.nyu.edu/~dodis/ps/merkle.pdf](https://cs.nyu.edu/~dodis/ps/merkle.pdf)
[Larsson]
  [https://web.archive.org/web/20040719170906/https://www.nada.kth.se/kurser/kth/2D1441/semteo03/lecturenotes/assump.pdf](https://web.archive.org/web/20040719170906/https://www.nada.kth.se/kurser/kth/2D1441/semteo03/lecturenotes/assump.pdf)

```
## Index

* [Constants](#const)
    * [const aesIV](#aesIV)
* [Variables](#var)
    * [var one](#one)
    * [var errZeroParam](#errZeroParam)
    * [var zeroReader](#zeroReader)
* [Types](#type)
    * [type invertible interface](#invertible)
    * [type combinedMult interface](#combinedMult)
    * [type PublicKey struct](#PublicKey)
        * [func (pub *PublicKey) Equal(x crypto.PublicKey) bool](#PublicKey.Equal)
    * [type PrivateKey struct](#PrivateKey)
        * [func GenerateKey(c elliptic.Curve, rand io.Reader) (*PrivateKey, error)](#GenerateKey)
        * [func (priv *PrivateKey) Public() crypto.PublicKey](#PrivateKey.Public)
        * [func (priv *PrivateKey) Equal(x crypto.PrivateKey) bool](#PrivateKey.Equal)
        * [func (priv *PrivateKey) Sign(rand io.Reader, digest []byte, opts crypto.SignerOpts) ([]byte, error)](#PrivateKey.Sign)
    * [type zr struct](#zr)
        * [func (z *zr) Read(dst []byte) (n int, err error)](#zr.Read)
* [Functions](#func)
    * [func randFieldElement(c elliptic.Curve, rand io.Reader) (k *big.Int, err error)](#randFieldElement)
    * [func hashToInt(hash []byte, c elliptic.Curve) *big.Int](#hashToInt)
    * [func fermatInverse(k, N *big.Int) *big.Int](#fermatInverse)
    * [func Sign(rand io.Reader, priv *PrivateKey, hash []byte) (r, s *big.Int, err error)](#Sign)
    * [func signGeneric(priv *PrivateKey, csprng *cipher.StreamReader, c elliptic.Curve, hash []byte) (r, s *big.Int, err error)](#signGeneric)
    * [func SignASN1(rand io.Reader, priv *PrivateKey, hash []byte) ([]byte, error)](#SignASN1)
    * [func Verify(pub *PublicKey, hash []byte, r, s *big.Int) bool](#Verify)
    * [func verifyGeneric(pub *PublicKey, c elliptic.Curve, hash []byte, r, s *big.Int) bool](#verifyGeneric)
    * [func VerifyASN1(pub *PublicKey, hash, sig []byte) bool](#VerifyASN1)
    * [func sign(priv *PrivateKey, csprng *cipher.StreamReader, c elliptic.Curve, hash []byte) (r, s *big.Int, err error)](#sign)
    * [func verify(pub *PublicKey, c elliptic.Curve, hash []byte, r, s *big.Int) bool](#verify)
    * [func testAllCurves(t *testing.T, f func(*testing.T, elliptic.Curve))](#testAllCurves)
    * [func TestKeyGeneration(t *testing.T)](#TestKeyGeneration)
    * [func testKeyGeneration(t *testing.T, c elliptic.Curve)](#testKeyGeneration)
    * [func TestSignAndVerify(t *testing.T)](#TestSignAndVerify)
    * [func testSignAndVerify(t *testing.T, c elliptic.Curve)](#testSignAndVerify)
    * [func TestSignAndVerifyASN1(t *testing.T)](#TestSignAndVerifyASN1)
    * [func testSignAndVerifyASN1(t *testing.T, c elliptic.Curve)](#testSignAndVerifyASN1)
    * [func TestNonceSafety(t *testing.T)](#TestNonceSafety)
    * [func testNonceSafety(t *testing.T, c elliptic.Curve)](#testNonceSafety)
    * [func TestINDCCA(t *testing.T)](#TestINDCCA)
    * [func testINDCCA(t *testing.T, c elliptic.Curve)](#testINDCCA)
    * [func fromHex(s string) *big.Int](#fromHex)
    * [func TestVectors(t *testing.T)](#TestVectors)
    * [func TestNegativeInputs(t *testing.T)](#TestNegativeInputs)
    * [func testNegativeInputs(t *testing.T, curve elliptic.Curve)](#testNegativeInputs)
    * [func TestZeroHashSignature(t *testing.T)](#TestZeroHashSignature)
    * [func testZeroHashSignature(t *testing.T, curve elliptic.Curve)](#testZeroHashSignature)
    * [func benchmarkAllCurves(t *testing.B, f func(*testing.B, elliptic.Curve))](#benchmarkAllCurves)
    * [func BenchmarkSign(b *testing.B)](#BenchmarkSign)
    * [func BenchmarkVerify(b *testing.B)](#BenchmarkVerify)
    * [func BenchmarkGenerateKey(b *testing.B)](#BenchmarkGenerateKey)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="aesIV" href="#aesIV">const aesIV</a>

```
searchKey: ecdsa.aesIV
```

```Go
const aesIV = "IV for ECDSA CTR"
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="one" href="#one">var one</a>

```
searchKey: ecdsa.one
```

```Go
var one = new(big.Int).SetInt64(1)
```

### <a id="errZeroParam" href="#errZeroParam">var errZeroParam</a>

```
searchKey: ecdsa.errZeroParam
```

```Go
var errZeroParam = errors.New("zero parameter")
```

### <a id="zeroReader" href="#zeroReader">var zeroReader</a>

```
searchKey: ecdsa.zeroReader
```

```Go
var zeroReader = &zr{}
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="invertible" href="#invertible">type invertible interface</a>

```
searchKey: ecdsa.invertible
```

```Go
type invertible interface {
	// Inverse returns the inverse of k in GF(P)
	Inverse(k *big.Int) *big.Int
}
```

A invertible implements fast inverse mod Curve.Params().N 

### <a id="combinedMult" href="#combinedMult">type combinedMult interface</a>

```
searchKey: ecdsa.combinedMult
```

```Go
type combinedMult interface {
	CombinedMult(bigX, bigY *big.Int, baseScalar, scalar []byte) (x, y *big.Int)
}
```

combinedMult implements fast multiplication S1*g + S2*p (g - generator, p - arbitrary point) 

### <a id="PublicKey" href="#PublicKey">type PublicKey struct</a>

```
searchKey: ecdsa.PublicKey
tags: [exported]
```

```Go
type PublicKey struct {
	elliptic.Curve
	X, Y *big.Int
}
```

PublicKey represents an ECDSA public key. 

#### <a id="PublicKey.Equal" href="#PublicKey.Equal">func (pub *PublicKey) Equal(x crypto.PublicKey) bool</a>

```
searchKey: ecdsa.PublicKey.Equal
tags: [exported]
```

```Go
func (pub *PublicKey) Equal(x crypto.PublicKey) bool
```

Equal reports whether pub and x have the same value. 

Two keys are only considered to have the same value if they have the same Curve value. Note that for example elliptic.P256() and elliptic.P256().Params() are different values, as the latter is a generic not constant time implementation. 

### <a id="PrivateKey" href="#PrivateKey">type PrivateKey struct</a>

```
searchKey: ecdsa.PrivateKey
tags: [exported]
```

```Go
type PrivateKey struct {
	PublicKey
	D *big.Int
}
```

PrivateKey represents an ECDSA private key. 

#### <a id="GenerateKey" href="#GenerateKey">func GenerateKey(c elliptic.Curve, rand io.Reader) (*PrivateKey, error)</a>

```
searchKey: ecdsa.GenerateKey
tags: [exported]
```

```Go
func GenerateKey(c elliptic.Curve, rand io.Reader) (*PrivateKey, error)
```

GenerateKey generates a public and private key pair. 

#### <a id="PrivateKey.Public" href="#PrivateKey.Public">func (priv *PrivateKey) Public() crypto.PublicKey</a>

```
searchKey: ecdsa.PrivateKey.Public
tags: [exported]
```

```Go
func (priv *PrivateKey) Public() crypto.PublicKey
```

Public returns the public key corresponding to priv. 

#### <a id="PrivateKey.Equal" href="#PrivateKey.Equal">func (priv *PrivateKey) Equal(x crypto.PrivateKey) bool</a>

```
searchKey: ecdsa.PrivateKey.Equal
tags: [exported]
```

```Go
func (priv *PrivateKey) Equal(x crypto.PrivateKey) bool
```

Equal reports whether priv and x have the same value. 

See PublicKey.Equal for details on how Curve is compared. 

#### <a id="PrivateKey.Sign" href="#PrivateKey.Sign">func (priv *PrivateKey) Sign(rand io.Reader, digest []byte, opts crypto.SignerOpts) ([]byte, error)</a>

```
searchKey: ecdsa.PrivateKey.Sign
tags: [exported]
```

```Go
func (priv *PrivateKey) Sign(rand io.Reader, digest []byte, opts crypto.SignerOpts) ([]byte, error)
```

Sign signs digest with priv, reading randomness from rand. The opts argument is not currently used but, in keeping with the crypto.Signer interface, should be the hash function used to digest the message. 

This method implements crypto.Signer, which is an interface to support keys where the private part is kept in, for example, a hardware module. Common uses should use the Sign function in this package directly. 

### <a id="zr" href="#zr">type zr struct</a>

```
searchKey: ecdsa.zr
```

```Go
type zr struct {
	io.Reader
}
```

#### <a id="zr.Read" href="#zr.Read">func (z *zr) Read(dst []byte) (n int, err error)</a>

```
searchKey: ecdsa.zr.Read
```

```Go
func (z *zr) Read(dst []byte) (n int, err error)
```

Read replaces the contents of dst with zeros. 

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="randFieldElement" href="#randFieldElement">func randFieldElement(c elliptic.Curve, rand io.Reader) (k *big.Int, err error)</a>

```
searchKey: ecdsa.randFieldElement
```

```Go
func randFieldElement(c elliptic.Curve, rand io.Reader) (k *big.Int, err error)
```

randFieldElement returns a random element of the field underlying the given curve using the procedure given in [NSA] A.2.1. 

### <a id="hashToInt" href="#hashToInt">func hashToInt(hash []byte, c elliptic.Curve) *big.Int</a>

```
searchKey: ecdsa.hashToInt
```

```Go
func hashToInt(hash []byte, c elliptic.Curve) *big.Int
```

hashToInt converts a hash value to an integer. There is some disagreement about how this is done. [NSA] suggests that this is done in the obvious manner, but [SECG] truncates the hash to the bit-length of the curve order first. We follow [SECG] because that's what OpenSSL does. Additionally, OpenSSL right shifts excess bits from the number if the hash is too large and we mirror that too. 

### <a id="fermatInverse" href="#fermatInverse">func fermatInverse(k, N *big.Int) *big.Int</a>

```
searchKey: ecdsa.fermatInverse
```

```Go
func fermatInverse(k, N *big.Int) *big.Int
```

fermatInverse calculates the inverse of k in GF(P) using Fermat's method. This has better constant-time properties than Euclid's method (implemented in math/big.Int.ModInverse) although math/big itself isn't strictly constant-time so it's not perfect. 

### <a id="Sign" href="#Sign">func Sign(rand io.Reader, priv *PrivateKey, hash []byte) (r, s *big.Int, err error)</a>

```
searchKey: ecdsa.Sign
tags: [exported]
```

```Go
func Sign(rand io.Reader, priv *PrivateKey, hash []byte) (r, s *big.Int, err error)
```

Sign signs a hash (which should be the result of hashing a larger message) using the private key, priv. If the hash is longer than the bit-length of the private key's curve order, the hash will be truncated to that length. It returns the signature as a pair of integers. The security of the private key depends on the entropy of rand. 

### <a id="signGeneric" href="#signGeneric">func signGeneric(priv *PrivateKey, csprng *cipher.StreamReader, c elliptic.Curve, hash []byte) (r, s *big.Int, err error)</a>

```
searchKey: ecdsa.signGeneric
```

```Go
func signGeneric(priv *PrivateKey, csprng *cipher.StreamReader, c elliptic.Curve, hash []byte) (r, s *big.Int, err error)
```

### <a id="SignASN1" href="#SignASN1">func SignASN1(rand io.Reader, priv *PrivateKey, hash []byte) ([]byte, error)</a>

```
searchKey: ecdsa.SignASN1
tags: [exported]
```

```Go
func SignASN1(rand io.Reader, priv *PrivateKey, hash []byte) ([]byte, error)
```

SignASN1 signs a hash (which should be the result of hashing a larger message) using the private key, priv. If the hash is longer than the bit-length of the private key's curve order, the hash will be truncated to that length. It returns the ASN.1 encoded signature. The security of the private key depends on the entropy of rand. 

### <a id="Verify" href="#Verify">func Verify(pub *PublicKey, hash []byte, r, s *big.Int) bool</a>

```
searchKey: ecdsa.Verify
tags: [exported]
```

```Go
func Verify(pub *PublicKey, hash []byte, r, s *big.Int) bool
```

Verify verifies the signature in r, s of hash using the public key, pub. Its return value records whether the signature is valid. 

### <a id="verifyGeneric" href="#verifyGeneric">func verifyGeneric(pub *PublicKey, c elliptic.Curve, hash []byte, r, s *big.Int) bool</a>

```
searchKey: ecdsa.verifyGeneric
```

```Go
func verifyGeneric(pub *PublicKey, c elliptic.Curve, hash []byte, r, s *big.Int) bool
```

### <a id="VerifyASN1" href="#VerifyASN1">func VerifyASN1(pub *PublicKey, hash, sig []byte) bool</a>

```
searchKey: ecdsa.VerifyASN1
tags: [exported]
```

```Go
func VerifyASN1(pub *PublicKey, hash, sig []byte) bool
```

VerifyASN1 verifies the ASN.1 encoded signature, sig, of hash using the public key, pub. Its return value records whether the signature is valid. 

### <a id="sign" href="#sign">func sign(priv *PrivateKey, csprng *cipher.StreamReader, c elliptic.Curve, hash []byte) (r, s *big.Int, err error)</a>

```
searchKey: ecdsa.sign
```

```Go
func sign(priv *PrivateKey, csprng *cipher.StreamReader, c elliptic.Curve, hash []byte) (r, s *big.Int, err error)
```

### <a id="verify" href="#verify">func verify(pub *PublicKey, c elliptic.Curve, hash []byte, r, s *big.Int) bool</a>

```
searchKey: ecdsa.verify
```

```Go
func verify(pub *PublicKey, c elliptic.Curve, hash []byte, r, s *big.Int) bool
```

### <a id="testAllCurves" href="#testAllCurves">func testAllCurves(t *testing.T, f func(*testing.T, elliptic.Curve))</a>

```
searchKey: ecdsa.testAllCurves
```

```Go
func testAllCurves(t *testing.T, f func(*testing.T, elliptic.Curve))
```

### <a id="TestKeyGeneration" href="#TestKeyGeneration">func TestKeyGeneration(t *testing.T)</a>

```
searchKey: ecdsa.TestKeyGeneration
```

```Go
func TestKeyGeneration(t *testing.T)
```

### <a id="testKeyGeneration" href="#testKeyGeneration">func testKeyGeneration(t *testing.T, c elliptic.Curve)</a>

```
searchKey: ecdsa.testKeyGeneration
```

```Go
func testKeyGeneration(t *testing.T, c elliptic.Curve)
```

### <a id="TestSignAndVerify" href="#TestSignAndVerify">func TestSignAndVerify(t *testing.T)</a>

```
searchKey: ecdsa.TestSignAndVerify
```

```Go
func TestSignAndVerify(t *testing.T)
```

### <a id="testSignAndVerify" href="#testSignAndVerify">func testSignAndVerify(t *testing.T, c elliptic.Curve)</a>

```
searchKey: ecdsa.testSignAndVerify
```

```Go
func testSignAndVerify(t *testing.T, c elliptic.Curve)
```

### <a id="TestSignAndVerifyASN1" href="#TestSignAndVerifyASN1">func TestSignAndVerifyASN1(t *testing.T)</a>

```
searchKey: ecdsa.TestSignAndVerifyASN1
```

```Go
func TestSignAndVerifyASN1(t *testing.T)
```

### <a id="testSignAndVerifyASN1" href="#testSignAndVerifyASN1">func testSignAndVerifyASN1(t *testing.T, c elliptic.Curve)</a>

```
searchKey: ecdsa.testSignAndVerifyASN1
```

```Go
func testSignAndVerifyASN1(t *testing.T, c elliptic.Curve)
```

### <a id="TestNonceSafety" href="#TestNonceSafety">func TestNonceSafety(t *testing.T)</a>

```
searchKey: ecdsa.TestNonceSafety
```

```Go
func TestNonceSafety(t *testing.T)
```

### <a id="testNonceSafety" href="#testNonceSafety">func testNonceSafety(t *testing.T, c elliptic.Curve)</a>

```
searchKey: ecdsa.testNonceSafety
```

```Go
func testNonceSafety(t *testing.T, c elliptic.Curve)
```

### <a id="TestINDCCA" href="#TestINDCCA">func TestINDCCA(t *testing.T)</a>

```
searchKey: ecdsa.TestINDCCA
```

```Go
func TestINDCCA(t *testing.T)
```

### <a id="testINDCCA" href="#testINDCCA">func testINDCCA(t *testing.T, c elliptic.Curve)</a>

```
searchKey: ecdsa.testINDCCA
```

```Go
func testINDCCA(t *testing.T, c elliptic.Curve)
```

### <a id="fromHex" href="#fromHex">func fromHex(s string) *big.Int</a>

```
searchKey: ecdsa.fromHex
```

```Go
func fromHex(s string) *big.Int
```

### <a id="TestVectors" href="#TestVectors">func TestVectors(t *testing.T)</a>

```
searchKey: ecdsa.TestVectors
```

```Go
func TestVectors(t *testing.T)
```

### <a id="TestNegativeInputs" href="#TestNegativeInputs">func TestNegativeInputs(t *testing.T)</a>

```
searchKey: ecdsa.TestNegativeInputs
```

```Go
func TestNegativeInputs(t *testing.T)
```

### <a id="testNegativeInputs" href="#testNegativeInputs">func testNegativeInputs(t *testing.T, curve elliptic.Curve)</a>

```
searchKey: ecdsa.testNegativeInputs
```

```Go
func testNegativeInputs(t *testing.T, curve elliptic.Curve)
```

### <a id="TestZeroHashSignature" href="#TestZeroHashSignature">func TestZeroHashSignature(t *testing.T)</a>

```
searchKey: ecdsa.TestZeroHashSignature
```

```Go
func TestZeroHashSignature(t *testing.T)
```

### <a id="testZeroHashSignature" href="#testZeroHashSignature">func testZeroHashSignature(t *testing.T, curve elliptic.Curve)</a>

```
searchKey: ecdsa.testZeroHashSignature
```

```Go
func testZeroHashSignature(t *testing.T, curve elliptic.Curve)
```

### <a id="benchmarkAllCurves" href="#benchmarkAllCurves">func benchmarkAllCurves(t *testing.B, f func(*testing.B, elliptic.Curve))</a>

```
searchKey: ecdsa.benchmarkAllCurves
```

```Go
func benchmarkAllCurves(t *testing.B, f func(*testing.B, elliptic.Curve))
```

### <a id="BenchmarkSign" href="#BenchmarkSign">func BenchmarkSign(b *testing.B)</a>

```
searchKey: ecdsa.BenchmarkSign
```

```Go
func BenchmarkSign(b *testing.B)
```

### <a id="BenchmarkVerify" href="#BenchmarkVerify">func BenchmarkVerify(b *testing.B)</a>

```
searchKey: ecdsa.BenchmarkVerify
```

```Go
func BenchmarkVerify(b *testing.B)
```

### <a id="BenchmarkGenerateKey" href="#BenchmarkGenerateKey">func BenchmarkGenerateKey(b *testing.B)</a>

```
searchKey: ecdsa.BenchmarkGenerateKey
```

```Go
func BenchmarkGenerateKey(b *testing.B)
```

