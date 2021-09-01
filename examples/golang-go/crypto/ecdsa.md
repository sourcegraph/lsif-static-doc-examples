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
    * [var errZeroParam](#errZeroParam)
    * [var one](#one)
    * [var zeroReader](#zeroReader)
* [Types](#type)
    * [type PrivateKey struct](#PrivateKey)
        * [func GenerateKey(c elliptic.Curve, rand io.Reader) (*PrivateKey, error)](#GenerateKey)
        * [func (priv *PrivateKey) Equal(x crypto.PrivateKey) bool](#PrivateKey.Equal)
        * [func (priv *PrivateKey) Public() crypto.PublicKey](#PrivateKey.Public)
        * [func (priv *PrivateKey) Sign(rand io.Reader, digest []byte, opts crypto.SignerOpts) ([]byte, error)](#PrivateKey.Sign)
    * [type PublicKey struct](#PublicKey)
        * [func (pub *PublicKey) Equal(x crypto.PublicKey) bool](#PublicKey.Equal)
    * [type combinedMult interface](#combinedMult)
    * [type invertible interface](#invertible)
    * [type zr struct](#zr)
        * [func (z *zr) Read(dst []byte) (n int, err error)](#zr.Read)
* [Functions](#func)
    * [func BenchmarkGenerateKey(b *testing.B)](#BenchmarkGenerateKey)
    * [func BenchmarkSign(b *testing.B)](#BenchmarkSign)
    * [func BenchmarkVerify(b *testing.B)](#BenchmarkVerify)
    * [func Sign(rand io.Reader, priv *PrivateKey, hash []byte) (r, s *big.Int, err error)](#Sign)
    * [func SignASN1(rand io.Reader, priv *PrivateKey, hash []byte) ([]byte, error)](#SignASN1)
    * [func TestINDCCA(t *testing.T)](#TestINDCCA)
    * [func TestKeyGeneration(t *testing.T)](#TestKeyGeneration)
    * [func TestNegativeInputs(t *testing.T)](#TestNegativeInputs)
    * [func TestNonceSafety(t *testing.T)](#TestNonceSafety)
    * [func TestSignAndVerify(t *testing.T)](#TestSignAndVerify)
    * [func TestSignAndVerifyASN1(t *testing.T)](#TestSignAndVerifyASN1)
    * [func TestVectors(t *testing.T)](#TestVectors)
    * [func TestZeroHashSignature(t *testing.T)](#TestZeroHashSignature)
    * [func Verify(pub *PublicKey, hash []byte, r, s *big.Int) bool](#Verify)
    * [func VerifyASN1(pub *PublicKey, hash, sig []byte) bool](#VerifyASN1)
    * [func benchmarkAllCurves(t *testing.B, f func(*testing.B, elliptic.Curve))](#benchmarkAllCurves)
    * [func fermatInverse(k, N *big.Int) *big.Int](#fermatInverse)
    * [func fromHex(s string) *big.Int](#fromHex)
    * [func hashToInt(hash []byte, c elliptic.Curve) *big.Int](#hashToInt)
    * [func randFieldElement(c elliptic.Curve, rand io.Reader) (k *big.Int, err error)](#randFieldElement)
    * [func sign(priv *PrivateKey, csprng *cipher.StreamReader, c elliptic.Curve, hash []byte) (r, s *big.Int, err error)](#sign)
    * [func signGeneric(priv *PrivateKey, csprng *cipher.StreamReader, c elliptic.Curve, hash []byte) (r, s *big.Int, err error)](#signGeneric)
    * [func testAllCurves(t *testing.T, f func(*testing.T, elliptic.Curve))](#testAllCurves)
    * [func testINDCCA(t *testing.T, c elliptic.Curve)](#testINDCCA)
    * [func testKeyGeneration(t *testing.T, c elliptic.Curve)](#testKeyGeneration)
    * [func testNegativeInputs(t *testing.T, curve elliptic.Curve)](#testNegativeInputs)
    * [func testNonceSafety(t *testing.T, c elliptic.Curve)](#testNonceSafety)
    * [func testSignAndVerify(t *testing.T, c elliptic.Curve)](#testSignAndVerify)
    * [func testSignAndVerifyASN1(t *testing.T, c elliptic.Curve)](#testSignAndVerifyASN1)
    * [func testZeroHashSignature(t *testing.T, curve elliptic.Curve)](#testZeroHashSignature)
    * [func verify(pub *PublicKey, c elliptic.Curve, hash []byte, r, s *big.Int) bool](#verify)
    * [func verifyGeneric(pub *PublicKey, c elliptic.Curve, hash []byte, r, s *big.Int) bool](#verifyGeneric)


## <a id="const" href="#const">Constants</a>

### <a id="aesIV" href="#aesIV">const aesIV</a>

```
searchKey: ecdsa.aesIV
tags: [constant string private]
```

```Go
const aesIV = "IV for ECDSA CTR"
```

## <a id="var" href="#var">Variables</a>

### <a id="errZeroParam" href="#errZeroParam">var errZeroParam</a>

```
searchKey: ecdsa.errZeroParam
tags: [variable interface private]
```

```Go
var errZeroParam = errors.New("zero parameter")
```

### <a id="one" href="#one">var one</a>

```
searchKey: ecdsa.one
tags: [variable struct private]
```

```Go
var one = new(big.Int).SetInt64(1)
```

### <a id="zeroReader" href="#zeroReader">var zeroReader</a>

```
searchKey: ecdsa.zeroReader
tags: [variable struct private]
```

```Go
var zeroReader = &zr{}
```

## <a id="type" href="#type">Types</a>

### <a id="PrivateKey" href="#PrivateKey">type PrivateKey struct</a>

```
searchKey: ecdsa.PrivateKey
tags: [struct]
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
tags: [function]
```

```Go
func GenerateKey(c elliptic.Curve, rand io.Reader) (*PrivateKey, error)
```

GenerateKey generates a public and private key pair. 

#### <a id="PrivateKey.Equal" href="#PrivateKey.Equal">func (priv *PrivateKey) Equal(x crypto.PrivateKey) bool</a>

```
searchKey: ecdsa.PrivateKey.Equal
tags: [method]
```

```Go
func (priv *PrivateKey) Equal(x crypto.PrivateKey) bool
```

Equal reports whether priv and x have the same value. 

See PublicKey.Equal for details on how Curve is compared. 

#### <a id="PrivateKey.Public" href="#PrivateKey.Public">func (priv *PrivateKey) Public() crypto.PublicKey</a>

```
searchKey: ecdsa.PrivateKey.Public
tags: [method]
```

```Go
func (priv *PrivateKey) Public() crypto.PublicKey
```

Public returns the public key corresponding to priv. 

#### <a id="PrivateKey.Sign" href="#PrivateKey.Sign">func (priv *PrivateKey) Sign(rand io.Reader, digest []byte, opts crypto.SignerOpts) ([]byte, error)</a>

```
searchKey: ecdsa.PrivateKey.Sign
tags: [method]
```

```Go
func (priv *PrivateKey) Sign(rand io.Reader, digest []byte, opts crypto.SignerOpts) ([]byte, error)
```

Sign signs digest with priv, reading randomness from rand. The opts argument is not currently used but, in keeping with the crypto.Signer interface, should be the hash function used to digest the message. 

This method implements crypto.Signer, which is an interface to support keys where the private part is kept in, for example, a hardware module. Common uses should use the Sign function in this package directly. 

### <a id="PublicKey" href="#PublicKey">type PublicKey struct</a>

```
searchKey: ecdsa.PublicKey
tags: [struct]
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
tags: [method]
```

```Go
func (pub *PublicKey) Equal(x crypto.PublicKey) bool
```

Equal reports whether pub and x have the same value. 

Two keys are only considered to have the same value if they have the same Curve value. Note that for example elliptic.P256() and elliptic.P256().Params() are different values, as the latter is a generic not constant time implementation. 

### <a id="combinedMult" href="#combinedMult">type combinedMult interface</a>

```
searchKey: ecdsa.combinedMult
tags: [interface private]
```

```Go
type combinedMult interface {
	CombinedMult(bigX, bigY *big.Int, baseScalar, scalar []byte) (x, y *big.Int)
}
```

combinedMult implements fast multiplication S1*g + S2*p (g - generator, p - arbitrary point) 

### <a id="invertible" href="#invertible">type invertible interface</a>

```
searchKey: ecdsa.invertible
tags: [interface private]
```

```Go
type invertible interface {
	// Inverse returns the inverse of k in GF(P)
	Inverse(k *big.Int) *big.Int
}
```

A invertible implements fast inverse mod Curve.Params().N 

### <a id="zr" href="#zr">type zr struct</a>

```
searchKey: ecdsa.zr
tags: [struct private]
```

```Go
type zr struct {
	io.Reader
}
```

#### <a id="zr.Read" href="#zr.Read">func (z *zr) Read(dst []byte) (n int, err error)</a>

```
searchKey: ecdsa.zr.Read
tags: [method private]
```

```Go
func (z *zr) Read(dst []byte) (n int, err error)
```

Read replaces the contents of dst with zeros. 

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkGenerateKey" href="#BenchmarkGenerateKey">func BenchmarkGenerateKey(b *testing.B)</a>

```
searchKey: ecdsa.BenchmarkGenerateKey
tags: [function private benchmark]
```

```Go
func BenchmarkGenerateKey(b *testing.B)
```

### <a id="BenchmarkSign" href="#BenchmarkSign">func BenchmarkSign(b *testing.B)</a>

```
searchKey: ecdsa.BenchmarkSign
tags: [function private benchmark]
```

```Go
func BenchmarkSign(b *testing.B)
```

### <a id="BenchmarkVerify" href="#BenchmarkVerify">func BenchmarkVerify(b *testing.B)</a>

```
searchKey: ecdsa.BenchmarkVerify
tags: [function private benchmark]
```

```Go
func BenchmarkVerify(b *testing.B)
```

### <a id="Sign" href="#Sign">func Sign(rand io.Reader, priv *PrivateKey, hash []byte) (r, s *big.Int, err error)</a>

```
searchKey: ecdsa.Sign
tags: [function]
```

```Go
func Sign(rand io.Reader, priv *PrivateKey, hash []byte) (r, s *big.Int, err error)
```

Sign signs a hash (which should be the result of hashing a larger message) using the private key, priv. If the hash is longer than the bit-length of the private key's curve order, the hash will be truncated to that length. It returns the signature as a pair of integers. The security of the private key depends on the entropy of rand. 

### <a id="SignASN1" href="#SignASN1">func SignASN1(rand io.Reader, priv *PrivateKey, hash []byte) ([]byte, error)</a>

```
searchKey: ecdsa.SignASN1
tags: [function]
```

```Go
func SignASN1(rand io.Reader, priv *PrivateKey, hash []byte) ([]byte, error)
```

SignASN1 signs a hash (which should be the result of hashing a larger message) using the private key, priv. If the hash is longer than the bit-length of the private key's curve order, the hash will be truncated to that length. It returns the ASN.1 encoded signature. The security of the private key depends on the entropy of rand. 

### <a id="TestINDCCA" href="#TestINDCCA">func TestINDCCA(t *testing.T)</a>

```
searchKey: ecdsa.TestINDCCA
tags: [function private test]
```

```Go
func TestINDCCA(t *testing.T)
```

### <a id="TestKeyGeneration" href="#TestKeyGeneration">func TestKeyGeneration(t *testing.T)</a>

```
searchKey: ecdsa.TestKeyGeneration
tags: [function private test]
```

```Go
func TestKeyGeneration(t *testing.T)
```

### <a id="TestNegativeInputs" href="#TestNegativeInputs">func TestNegativeInputs(t *testing.T)</a>

```
searchKey: ecdsa.TestNegativeInputs
tags: [function private test]
```

```Go
func TestNegativeInputs(t *testing.T)
```

### <a id="TestNonceSafety" href="#TestNonceSafety">func TestNonceSafety(t *testing.T)</a>

```
searchKey: ecdsa.TestNonceSafety
tags: [function private test]
```

```Go
func TestNonceSafety(t *testing.T)
```

### <a id="TestSignAndVerify" href="#TestSignAndVerify">func TestSignAndVerify(t *testing.T)</a>

```
searchKey: ecdsa.TestSignAndVerify
tags: [function private test]
```

```Go
func TestSignAndVerify(t *testing.T)
```

### <a id="TestSignAndVerifyASN1" href="#TestSignAndVerifyASN1">func TestSignAndVerifyASN1(t *testing.T)</a>

```
searchKey: ecdsa.TestSignAndVerifyASN1
tags: [function private test]
```

```Go
func TestSignAndVerifyASN1(t *testing.T)
```

### <a id="TestVectors" href="#TestVectors">func TestVectors(t *testing.T)</a>

```
searchKey: ecdsa.TestVectors
tags: [function private test]
```

```Go
func TestVectors(t *testing.T)
```

### <a id="TestZeroHashSignature" href="#TestZeroHashSignature">func TestZeroHashSignature(t *testing.T)</a>

```
searchKey: ecdsa.TestZeroHashSignature
tags: [function private test]
```

```Go
func TestZeroHashSignature(t *testing.T)
```

### <a id="Verify" href="#Verify">func Verify(pub *PublicKey, hash []byte, r, s *big.Int) bool</a>

```
searchKey: ecdsa.Verify
tags: [function]
```

```Go
func Verify(pub *PublicKey, hash []byte, r, s *big.Int) bool
```

Verify verifies the signature in r, s of hash using the public key, pub. Its return value records whether the signature is valid. 

### <a id="VerifyASN1" href="#VerifyASN1">func VerifyASN1(pub *PublicKey, hash, sig []byte) bool</a>

```
searchKey: ecdsa.VerifyASN1
tags: [function]
```

```Go
func VerifyASN1(pub *PublicKey, hash, sig []byte) bool
```

VerifyASN1 verifies the ASN.1 encoded signature, sig, of hash using the public key, pub. Its return value records whether the signature is valid. 

### <a id="benchmarkAllCurves" href="#benchmarkAllCurves">func benchmarkAllCurves(t *testing.B, f func(*testing.B, elliptic.Curve))</a>

```
searchKey: ecdsa.benchmarkAllCurves
tags: [function private]
```

```Go
func benchmarkAllCurves(t *testing.B, f func(*testing.B, elliptic.Curve))
```

### <a id="fermatInverse" href="#fermatInverse">func fermatInverse(k, N *big.Int) *big.Int</a>

```
searchKey: ecdsa.fermatInverse
tags: [function private]
```

```Go
func fermatInverse(k, N *big.Int) *big.Int
```

fermatInverse calculates the inverse of k in GF(P) using Fermat's method. This has better constant-time properties than Euclid's method (implemented in math/big.Int.ModInverse) although math/big itself isn't strictly constant-time so it's not perfect. 

### <a id="fromHex" href="#fromHex">func fromHex(s string) *big.Int</a>

```
searchKey: ecdsa.fromHex
tags: [function private]
```

```Go
func fromHex(s string) *big.Int
```

### <a id="hashToInt" href="#hashToInt">func hashToInt(hash []byte, c elliptic.Curve) *big.Int</a>

```
searchKey: ecdsa.hashToInt
tags: [function private]
```

```Go
func hashToInt(hash []byte, c elliptic.Curve) *big.Int
```

hashToInt converts a hash value to an integer. There is some disagreement about how this is done. [NSA] suggests that this is done in the obvious manner, but [SECG] truncates the hash to the bit-length of the curve order first. We follow [SECG] because that's what OpenSSL does. Additionally, OpenSSL right shifts excess bits from the number if the hash is too large and we mirror that too. 

### <a id="randFieldElement" href="#randFieldElement">func randFieldElement(c elliptic.Curve, rand io.Reader) (k *big.Int, err error)</a>

```
searchKey: ecdsa.randFieldElement
tags: [function private]
```

```Go
func randFieldElement(c elliptic.Curve, rand io.Reader) (k *big.Int, err error)
```

randFieldElement returns a random element of the field underlying the given curve using the procedure given in [NSA] A.2.1. 

### <a id="sign" href="#sign">func sign(priv *PrivateKey, csprng *cipher.StreamReader, c elliptic.Curve, hash []byte) (r, s *big.Int, err error)</a>

```
searchKey: ecdsa.sign
tags: [function private]
```

```Go
func sign(priv *PrivateKey, csprng *cipher.StreamReader, c elliptic.Curve, hash []byte) (r, s *big.Int, err error)
```

### <a id="signGeneric" href="#signGeneric">func signGeneric(priv *PrivateKey, csprng *cipher.StreamReader, c elliptic.Curve, hash []byte) (r, s *big.Int, err error)</a>

```
searchKey: ecdsa.signGeneric
tags: [function private]
```

```Go
func signGeneric(priv *PrivateKey, csprng *cipher.StreamReader, c elliptic.Curve, hash []byte) (r, s *big.Int, err error)
```

### <a id="testAllCurves" href="#testAllCurves">func testAllCurves(t *testing.T, f func(*testing.T, elliptic.Curve))</a>

```
searchKey: ecdsa.testAllCurves
tags: [function private]
```

```Go
func testAllCurves(t *testing.T, f func(*testing.T, elliptic.Curve))
```

### <a id="testINDCCA" href="#testINDCCA">func testINDCCA(t *testing.T, c elliptic.Curve)</a>

```
searchKey: ecdsa.testINDCCA
tags: [function private]
```

```Go
func testINDCCA(t *testing.T, c elliptic.Curve)
```

### <a id="testKeyGeneration" href="#testKeyGeneration">func testKeyGeneration(t *testing.T, c elliptic.Curve)</a>

```
searchKey: ecdsa.testKeyGeneration
tags: [function private]
```

```Go
func testKeyGeneration(t *testing.T, c elliptic.Curve)
```

### <a id="testNegativeInputs" href="#testNegativeInputs">func testNegativeInputs(t *testing.T, curve elliptic.Curve)</a>

```
searchKey: ecdsa.testNegativeInputs
tags: [function private]
```

```Go
func testNegativeInputs(t *testing.T, curve elliptic.Curve)
```

### <a id="testNonceSafety" href="#testNonceSafety">func testNonceSafety(t *testing.T, c elliptic.Curve)</a>

```
searchKey: ecdsa.testNonceSafety
tags: [function private]
```

```Go
func testNonceSafety(t *testing.T, c elliptic.Curve)
```

### <a id="testSignAndVerify" href="#testSignAndVerify">func testSignAndVerify(t *testing.T, c elliptic.Curve)</a>

```
searchKey: ecdsa.testSignAndVerify
tags: [function private]
```

```Go
func testSignAndVerify(t *testing.T, c elliptic.Curve)
```

### <a id="testSignAndVerifyASN1" href="#testSignAndVerifyASN1">func testSignAndVerifyASN1(t *testing.T, c elliptic.Curve)</a>

```
searchKey: ecdsa.testSignAndVerifyASN1
tags: [function private]
```

```Go
func testSignAndVerifyASN1(t *testing.T, c elliptic.Curve)
```

### <a id="testZeroHashSignature" href="#testZeroHashSignature">func testZeroHashSignature(t *testing.T, curve elliptic.Curve)</a>

```
searchKey: ecdsa.testZeroHashSignature
tags: [function private]
```

```Go
func testZeroHashSignature(t *testing.T, curve elliptic.Curve)
```

### <a id="verify" href="#verify">func verify(pub *PublicKey, c elliptic.Curve, hash []byte, r, s *big.Int) bool</a>

```
searchKey: ecdsa.verify
tags: [function private]
```

```Go
func verify(pub *PublicKey, c elliptic.Curve, hash []byte, r, s *big.Int) bool
```

### <a id="verifyGeneric" href="#verifyGeneric">func verifyGeneric(pub *PublicKey, c elliptic.Curve, hash []byte, r, s *big.Int) bool</a>

```
searchKey: ecdsa.verifyGeneric
tags: [function private]
```

```Go
func verifyGeneric(pub *PublicKey, c elliptic.Curve, hash []byte, r, s *big.Int) bool
```

