# Package dsa

Package dsa implements the Digital Signature Algorithm, as defined in FIPS 186-3. 

The DSA operations in this package are not implemented using constant-time algorithms. 

Deprecated: DSA is a legacy algorithm, and modern alternatives such as Ed25519 (implemented by package crypto/ed25519) should be used instead. Keys with 1024-bit moduli (L1024N160 parameters) are cryptographically weak, while bigger keys are not widely supported. Note that FIPS 186-5 no longer approves DSA for signature generation. 

## Index

* [Constants](#const)
    * [const L1024N160](#L1024N160)
    * [const L2048N224](#L2048N224)
    * [const L2048N256](#L2048N256)
    * [const L3072N256](#L3072N256)
    * [const numMRTests](#numMRTests)
* [Variables](#var)
    * [var ErrInvalidPublicKey](#ErrInvalidPublicKey)
* [Types](#type)
    * [type ParameterSizes int](#ParameterSizes)
    * [type Parameters struct](#Parameters)
    * [type PrivateKey struct](#PrivateKey)
    * [type PublicKey struct](#PublicKey)
* [Functions](#func)
    * [func GenerateKey(priv *PrivateKey, rand io.Reader) error](#GenerateKey)
    * [func GenerateParameters(params *Parameters, rand io.Reader, sizes ParameterSizes) error](#GenerateParameters)
    * [func Sign(rand io.Reader, priv *PrivateKey, hash []byte) (r, s *big.Int, err error)](#Sign)
    * [func TestParameterGeneration(t *testing.T)](#TestParameterGeneration)
    * [func TestSignAndVerify(t *testing.T)](#TestSignAndVerify)
    * [func TestSignAndVerifyWithBadPublicKey(t *testing.T)](#TestSignAndVerifyWithBadPublicKey)
    * [func TestSigningWithDegenerateKeys(t *testing.T)](#TestSigningWithDegenerateKeys)
    * [func Verify(pub *PublicKey, hash []byte, r, s *big.Int) bool](#Verify)
    * [func fermatInverse(k, P *big.Int) *big.Int](#fermatInverse)
    * [func fromHex(s string) *big.Int](#fromHex)
    * [func testParameterGeneration(t *testing.T, sizes ParameterSizes, L, N int)](#testParameterGeneration)
    * [func testSignAndVerify(t *testing.T, i int, priv *PrivateKey)](#testSignAndVerify)


## <a id="const" href="#const">Constants</a>

```
tags: [deprecated]
```

### <a id="L1024N160" href="#L1024N160">const L1024N160</a>

```
searchKey: dsa.L1024N160
tags: [constant number]
```

```Go
const L1024N160 ParameterSizes = iota
```

### <a id="L2048N224" href="#L2048N224">const L2048N224</a>

```
searchKey: dsa.L2048N224
tags: [constant number]
```

```Go
const L2048N224
```

### <a id="L2048N256" href="#L2048N256">const L2048N256</a>

```
searchKey: dsa.L2048N256
tags: [constant number]
```

```Go
const L2048N256
```

### <a id="L3072N256" href="#L3072N256">const L3072N256</a>

```
searchKey: dsa.L3072N256
tags: [constant number]
```

```Go
const L3072N256
```

### <a id="numMRTests" href="#numMRTests">const numMRTests</a>

```
searchKey: dsa.numMRTests
tags: [constant number private]
```

```Go
const numMRTests = 64
```

numMRTests is the number of Miller-Rabin primality tests that we perform. We pick the largest recommended number from table C.1 of FIPS 186-3. 

## <a id="var" href="#var">Variables</a>

```
tags: [deprecated]
```

### <a id="ErrInvalidPublicKey" href="#ErrInvalidPublicKey">var ErrInvalidPublicKey</a>

```
searchKey: dsa.ErrInvalidPublicKey
tags: [variable interface]
```

```Go
var ErrInvalidPublicKey = errors.New("crypto/dsa: invalid public key")
```

ErrInvalidPublicKey results when a public key is not usable by this code. FIPS is quite strict about the format of DSA keys, but other code may be less so. Thus, when using keys which may have been generated by other code, this error must be handled. 

## <a id="type" href="#type">Types</a>

```
tags: [deprecated]
```

### <a id="ParameterSizes" href="#ParameterSizes">type ParameterSizes int</a>

```
searchKey: dsa.ParameterSizes
tags: [number]
```

```Go
type ParameterSizes int
```

ParameterSizes is an enumeration of the acceptable bit lengths of the primes in a set of DSA parameters. See FIPS 186-3, section 4.2. 

### <a id="Parameters" href="#Parameters">type Parameters struct</a>

```
searchKey: dsa.Parameters
tags: [struct]
```

```Go
type Parameters struct {
	P, Q, G *big.Int
}
```

Parameters represents the domain parameters for a key. These parameters can be shared across many keys. The bit length of Q must be a multiple of 8. 

### <a id="PrivateKey" href="#PrivateKey">type PrivateKey struct</a>

```
searchKey: dsa.PrivateKey
tags: [struct]
```

```Go
type PrivateKey struct {
	PublicKey
	X *big.Int
}
```

PrivateKey represents a DSA private key. 

### <a id="PublicKey" href="#PublicKey">type PublicKey struct</a>

```
searchKey: dsa.PublicKey
tags: [struct]
```

```Go
type PublicKey struct {
	Parameters
	Y *big.Int
}
```

PublicKey represents a DSA public key. 

## <a id="func" href="#func">Functions</a>

```
tags: [deprecated]
```

### <a id="GenerateKey" href="#GenerateKey">func GenerateKey(priv *PrivateKey, rand io.Reader) error</a>

```
searchKey: dsa.GenerateKey
tags: [function]
```

```Go
func GenerateKey(priv *PrivateKey, rand io.Reader) error
```

GenerateKey generates a public&private key pair. The Parameters of the PrivateKey must already be valid (see GenerateParameters). 

### <a id="GenerateParameters" href="#GenerateParameters">func GenerateParameters(params *Parameters, rand io.Reader, sizes ParameterSizes) error</a>

```
searchKey: dsa.GenerateParameters
tags: [function]
```

```Go
func GenerateParameters(params *Parameters, rand io.Reader, sizes ParameterSizes) error
```

GenerateParameters puts a random, valid set of DSA parameters into params. This function can take many seconds, even on fast machines. 

### <a id="Sign" href="#Sign">func Sign(rand io.Reader, priv *PrivateKey, hash []byte) (r, s *big.Int, err error)</a>

```
searchKey: dsa.Sign
tags: [function]
```

```Go
func Sign(rand io.Reader, priv *PrivateKey, hash []byte) (r, s *big.Int, err error)
```

Sign signs an arbitrary length hash (which should be the result of hashing a larger message) using the private key, priv. It returns the signature as a pair of integers. The security of the private key depends on the entropy of rand. 

Note that FIPS 186-3 section 4.6 specifies that the hash should be truncated to the byte-length of the subgroup. This function does not perform that truncation itself. 

Be aware that calling Sign with an attacker-controlled PrivateKey may require an arbitrary amount of CPU. 

### <a id="TestParameterGeneration" href="#TestParameterGeneration">func TestParameterGeneration(t *testing.T)</a>

```
searchKey: dsa.TestParameterGeneration
tags: [function private test]
```

```Go
func TestParameterGeneration(t *testing.T)
```

### <a id="TestSignAndVerify" href="#TestSignAndVerify">func TestSignAndVerify(t *testing.T)</a>

```
searchKey: dsa.TestSignAndVerify
tags: [function private test]
```

```Go
func TestSignAndVerify(t *testing.T)
```

### <a id="TestSignAndVerifyWithBadPublicKey" href="#TestSignAndVerifyWithBadPublicKey">func TestSignAndVerifyWithBadPublicKey(t *testing.T)</a>

```
searchKey: dsa.TestSignAndVerifyWithBadPublicKey
tags: [function private test]
```

```Go
func TestSignAndVerifyWithBadPublicKey(t *testing.T)
```

### <a id="TestSigningWithDegenerateKeys" href="#TestSigningWithDegenerateKeys">func TestSigningWithDegenerateKeys(t *testing.T)</a>

```
searchKey: dsa.TestSigningWithDegenerateKeys
tags: [function private test]
```

```Go
func TestSigningWithDegenerateKeys(t *testing.T)
```

### <a id="Verify" href="#Verify">func Verify(pub *PublicKey, hash []byte, r, s *big.Int) bool</a>

```
searchKey: dsa.Verify
tags: [function]
```

```Go
func Verify(pub *PublicKey, hash []byte, r, s *big.Int) bool
```

Verify verifies the signature in r, s of hash using the public key, pub. It reports whether the signature is valid. 

Note that FIPS 186-3 section 4.6 specifies that the hash should be truncated to the byte-length of the subgroup. This function does not perform that truncation itself. 

### <a id="fermatInverse" href="#fermatInverse">func fermatInverse(k, P *big.Int) *big.Int</a>

```
searchKey: dsa.fermatInverse
tags: [function private]
```

```Go
func fermatInverse(k, P *big.Int) *big.Int
```

fermatInverse calculates the inverse of k in GF(P) using Fermat's method. This has better constant-time properties than Euclid's method (implemented in math/big.Int.ModInverse) although math/big itself isn't strictly constant-time so it's not perfect. 

### <a id="fromHex" href="#fromHex">func fromHex(s string) *big.Int</a>

```
searchKey: dsa.fromHex
tags: [function private]
```

```Go
func fromHex(s string) *big.Int
```

### <a id="testParameterGeneration" href="#testParameterGeneration">func testParameterGeneration(t *testing.T, sizes ParameterSizes, L, N int)</a>

```
searchKey: dsa.testParameterGeneration
tags: [function private]
```

```Go
func testParameterGeneration(t *testing.T, sizes ParameterSizes, L, N int)
```

### <a id="testSignAndVerify" href="#testSignAndVerify">func testSignAndVerify(t *testing.T, i int, priv *PrivateKey)</a>

```
searchKey: dsa.testSignAndVerify
tags: [function private]
```

```Go
func testSignAndVerify(t *testing.T, i int, priv *PrivateKey)
```

