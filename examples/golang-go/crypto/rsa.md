# Package rsa

Package rsa implements RSA encryption as specified in PKCS #1 and RFC 8017. 

RSA is a single, fundamental operation that is used in this package to implement either public-key encryption or public-key signatures. 

The original specification for encryption and signatures with RSA is PKCS #1 and the terms "RSA encryption" and "RSA signatures" by default refer to PKCS #1 version 1.5. However, that specification has flaws and new designs should use version 2, usually called by just OAEP and PSS, where possible. 

Two sets of interfaces are included in this package. When a more abstract interface isn't necessary, there are functions for encrypting/decrypting with v1.5/OAEP and signing/verifying with v1.5/PSS. If one needs to abstract over the public key primitive, the PrivateKey type implements the Decrypter and Signer interfaces from the crypto package. 

The RSA operations in this package are not implemented using constant-time algorithms. 

## Index

* [Constants](#const)
    * [const PSSSaltLengthAuto](#PSSSaltLengthAuto)
    * [const PSSSaltLengthEqualsHash](#PSSSaltLengthEqualsHash)
* [Variables](#var)
    * [var hashPrefixes](#hashPrefixes)
    * [var bigZero](#bigZero)
    * [var bigOne](#bigOne)
    * [var errPublicModulus](#errPublicModulus)
    * [var errPublicExponentSmall](#errPublicExponentSmall)
    * [var errPublicExponentLarge](#errPublicExponentLarge)
    * [var ErrMessageTooLong](#ErrMessageTooLong)
    * [var ErrDecryption](#ErrDecryption)
    * [var ErrVerification](#ErrVerification)
    * [var decryptPKCS1v15Tests](#decryptPKCS1v15Tests)
    * [var decryptPKCS1v15SessionKeyTests](#decryptPKCS1v15SessionKeyTests)
    * [var signPKCS1v15Tests](#signPKCS1v15Tests)
    * [var rsaPrivateKey](#rsaPrivateKey)
    * [var test2048Key](#test2048Key)
    * [var testEncryptOAEPData](#testEncryptOAEPData)
* [Types](#type)
    * [type PKCS1v15DecryptOptions struct](#PKCS1v15DecryptOptions)
    * [type PSSOptions struct](#PSSOptions)
        * [func (opts *PSSOptions) HashFunc() crypto.Hash](#PSSOptions.HashFunc)
        * [func (opts *PSSOptions) saltLength() int](#PSSOptions.saltLength)
    * [type PublicKey struct](#PublicKey)
        * [func (pub *PublicKey) Size() int](#PublicKey.Size)
        * [func (pub *PublicKey) Equal(x crypto.PublicKey) bool](#PublicKey.Equal)
    * [type OAEPOptions struct](#OAEPOptions)
    * [type PrivateKey struct](#PrivateKey)
        * [func GenerateKey(random io.Reader, bits int) (*PrivateKey, error)](#GenerateKey)
        * [func GenerateMultiPrimeKey(random io.Reader, nprimes int, bits int) (*PrivateKey, error)](#GenerateMultiPrimeKey)
        * [func (priv *PrivateKey) Public() crypto.PublicKey](#PrivateKey.Public)
        * [func (priv *PrivateKey) Equal(x crypto.PrivateKey) bool](#PrivateKey.Equal)
        * [func (priv *PrivateKey) Sign(rand io.Reader, digest []byte, opts crypto.SignerOpts) ([]byte, error)](#PrivateKey.Sign)
        * [func (priv *PrivateKey) Decrypt(rand io.Reader, ciphertext []byte, opts crypto.DecrypterOpts) (plaintext []byte, err error)](#PrivateKey.Decrypt)
        * [func (priv *PrivateKey) Validate() error](#PrivateKey.Validate)
        * [func (priv *PrivateKey) Precompute()](#PrivateKey.Precompute)
    * [type PrecomputedValues struct](#PrecomputedValues)
    * [type CRTValue struct](#CRTValue)
    * [type DecryptPKCS1v15Test struct](#DecryptPKCS1v15Test)
    * [type signPKCS1v15Test struct](#signPKCS1v15Test)
    * [type testEncryptOAEPMessage struct](#testEncryptOAEPMessage)
    * [type testEncryptOAEPStruct struct](#testEncryptOAEPStruct)
* [Functions](#func)
    * [func EncryptPKCS1v15(rand io.Reader, pub *PublicKey, msg []byte) ([]byte, error)](#EncryptPKCS1v15)
    * [func DecryptPKCS1v15(rand io.Reader, priv *PrivateKey, ciphertext []byte) ([]byte, error)](#DecryptPKCS1v15)
    * [func DecryptPKCS1v15SessionKey(rand io.Reader, priv *PrivateKey, ciphertext []byte, key []byte) error](#DecryptPKCS1v15SessionKey)
    * [func decryptPKCS1v15(rand io.Reader, priv *PrivateKey, ciphertext []byte) (valid int, em []byte, index int, err error)](#decryptPKCS1v15)
    * [func nonZeroRandomBytes(s []byte, rand io.Reader) (err error)](#nonZeroRandomBytes)
    * [func SignPKCS1v15(rand io.Reader, priv *PrivateKey, hash crypto.Hash, hashed []byte) ([]byte, error)](#SignPKCS1v15)
    * [func VerifyPKCS1v15(pub *PublicKey, hash crypto.Hash, hashed []byte, sig []byte) error](#VerifyPKCS1v15)
    * [func pkcs1v15HashInfo(hash crypto.Hash, inLen int) (hashLen int, prefix []byte, err error)](#pkcs1v15HashInfo)
    * [func emsaPSSEncode(mHash []byte, emBits int, salt []byte, hash hash.Hash) ([]byte, error)](#emsaPSSEncode)
    * [func emsaPSSVerify(mHash, em []byte, emBits, sLen int, hash hash.Hash) error](#emsaPSSVerify)
    * [func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.Hash, hashed, salt []byte) ([]byte, error)](#signPSSWithSalt)
    * [func SignPSS(rand io.Reader, priv *PrivateKey, hash crypto.Hash, digest []byte, opts *PSSOptions) ([]byte, error)](#SignPSS)
    * [func VerifyPSS(pub *PublicKey, hash crypto.Hash, digest []byte, sig []byte, opts *PSSOptions) error](#VerifyPSS)
    * [func checkPub(pub *PublicKey) error](#checkPub)
    * [func incCounter(c *[4]byte)](#incCounter)
    * [func mgf1XOR(out []byte, hash hash.Hash, seed []byte)](#mgf1XOR)
    * [func encrypt(c *big.Int, pub *PublicKey, m *big.Int) *big.Int](#encrypt)
    * [func EncryptOAEP(hash hash.Hash, random io.Reader, pub *PublicKey, msg []byte, label []byte) ([]byte, error)](#EncryptOAEP)
    * [func decrypt(random io.Reader, priv *PrivateKey, c *big.Int) (m *big.Int, err error)](#decrypt)
    * [func decryptAndCheck(random io.Reader, priv *PrivateKey, c *big.Int) (m *big.Int, err error)](#decryptAndCheck)
    * [func DecryptOAEP(hash hash.Hash, random io.Reader, priv *PrivateKey, ciphertext []byte, label []byte) ([]byte, error)](#DecryptOAEP)
    * [func ExampleDecryptPKCS1v15SessionKey()](#ExampleDecryptPKCS1v15SessionKey)
    * [func ExampleSignPKCS1v15()](#ExampleSignPKCS1v15)
    * [func ExampleVerifyPKCS1v15()](#ExampleVerifyPKCS1v15)
    * [func ExampleEncryptOAEP()](#ExampleEncryptOAEP)
    * [func ExampleDecryptOAEP()](#ExampleDecryptOAEP)
    * [func decodeBase64(in string) []byte](#decodeBase64)
    * [func TestDecryptPKCS1v15(t *testing.T)](#TestDecryptPKCS1v15)
    * [func TestEncryptPKCS1v15(t *testing.T)](#TestEncryptPKCS1v15)
    * [func TestEncryptPKCS1v15SessionKey(t *testing.T)](#TestEncryptPKCS1v15SessionKey)
    * [func TestEncryptPKCS1v15DecrypterSessionKey(t *testing.T)](#TestEncryptPKCS1v15DecrypterSessionKey)
    * [func TestNonZeroRandomBytes(t *testing.T)](#TestNonZeroRandomBytes)
    * [func TestSignPKCS1v15(t *testing.T)](#TestSignPKCS1v15)
    * [func TestVerifyPKCS1v15(t *testing.T)](#TestVerifyPKCS1v15)
    * [func TestOverlongMessagePKCS1v15(t *testing.T)](#TestOverlongMessagePKCS1v15)
    * [func TestUnpaddedSignature(t *testing.T)](#TestUnpaddedSignature)
    * [func TestShortSessionKey(t *testing.T)](#TestShortSessionKey)
    * [func TestShortPKCS1v15Signature(t *testing.T)](#TestShortPKCS1v15Signature)
    * [func TestEMSAPSS(t *testing.T)](#TestEMSAPSS)
    * [func TestPSSGolden(t *testing.T)](#TestPSSGolden)
    * [func TestPSSOpenSSL(t *testing.T)](#TestPSSOpenSSL)
    * [func TestPSSNilOpts(t *testing.T)](#TestPSSNilOpts)
    * [func TestPSSSigning(t *testing.T)](#TestPSSSigning)
    * [func TestSignWithPSSSaltLengthAuto(t *testing.T)](#TestSignWithPSSSaltLengthAuto)
    * [func bigFromHex(hex string) *big.Int](#bigFromHex)
    * [func intFromHex(hex string) int](#intFromHex)
    * [func fromHex(hexStr string) []byte](#fromHex)
    * [func TestKeyGeneration(t *testing.T)](#TestKeyGeneration)
    * [func Test3PrimeKeyGeneration(t *testing.T)](#Test3PrimeKeyGeneration)
    * [func Test4PrimeKeyGeneration(t *testing.T)](#Test4PrimeKeyGeneration)
    * [func TestNPrimeKeyGeneration(t *testing.T)](#TestNPrimeKeyGeneration)
    * [func TestImpossibleKeyGeneration(t *testing.T)](#TestImpossibleKeyGeneration)
    * [func TestGnuTLSKey(t *testing.T)](#TestGnuTLSKey)
    * [func testKeyBasics(t *testing.T, priv *PrivateKey)](#testKeyBasics)
    * [func fromBase10(base10 string) *big.Int](#fromBase10)
    * [func init()](#init.rsa_test.go)
    * [func BenchmarkRSA2048Decrypt(b *testing.B)](#BenchmarkRSA2048Decrypt)
    * [func BenchmarkRSA2048Sign(b *testing.B)](#BenchmarkRSA2048Sign)
    * [func Benchmark3PrimeRSA2048Decrypt(b *testing.B)](#Benchmark3PrimeRSA2048Decrypt)
    * [func TestEncryptOAEP(t *testing.T)](#TestEncryptOAEP)
    * [func TestDecryptOAEP(t *testing.T)](#TestDecryptOAEP)


## <a id="const" href="#const">Constants</a>

### <a id="PSSSaltLengthAuto" href="#PSSSaltLengthAuto">const PSSSaltLengthAuto</a>

```
searchKey: rsa.PSSSaltLengthAuto
```

```Go
const PSSSaltLengthAuto = 0
```

PSSSaltLengthAuto causes the salt in a PSS signature to be as large as possible when signing, and to be auto-detected when verifying. 

### <a id="PSSSaltLengthEqualsHash" href="#PSSSaltLengthEqualsHash">const PSSSaltLengthEqualsHash</a>

```
searchKey: rsa.PSSSaltLengthEqualsHash
```

```Go
const PSSSaltLengthEqualsHash = -1
```

PSSSaltLengthEqualsHash causes the salt length to equal the length of the hash used in the signature. 

## <a id="var" href="#var">Variables</a>

### <a id="hashPrefixes" href="#hashPrefixes">var hashPrefixes</a>

```
searchKey: rsa.hashPrefixes
tags: [private]
```

```Go
var hashPrefixes = ...
```

These are ASN1 DER structures: 

```
DigestInfo ::= SEQUENCE {
  digestAlgorithm AlgorithmIdentifier,
  digest OCTET STRING
}

```
For performance, we don't use the generic ASN1 encoder. Rather, we precompute a prefix of the digest value that makes a valid ASN1 DER string with the correct contents. 

### <a id="bigZero" href="#bigZero">var bigZero</a>

```
searchKey: rsa.bigZero
tags: [private]
```

```Go
var bigZero = big.NewInt(0)
```

### <a id="bigOne" href="#bigOne">var bigOne</a>

```
searchKey: rsa.bigOne
tags: [private]
```

```Go
var bigOne = big.NewInt(1)
```

### <a id="errPublicModulus" href="#errPublicModulus">var errPublicModulus</a>

```
searchKey: rsa.errPublicModulus
tags: [private]
```

```Go
var errPublicModulus = errors.New("crypto/rsa: missing public modulus")
```

### <a id="errPublicExponentSmall" href="#errPublicExponentSmall">var errPublicExponentSmall</a>

```
searchKey: rsa.errPublicExponentSmall
tags: [private]
```

```Go
var errPublicExponentSmall = errors.New("crypto/rsa: public exponent too small")
```

### <a id="errPublicExponentLarge" href="#errPublicExponentLarge">var errPublicExponentLarge</a>

```
searchKey: rsa.errPublicExponentLarge
tags: [private]
```

```Go
var errPublicExponentLarge = errors.New("crypto/rsa: public exponent too large")
```

### <a id="ErrMessageTooLong" href="#ErrMessageTooLong">var ErrMessageTooLong</a>

```
searchKey: rsa.ErrMessageTooLong
```

```Go
var ErrMessageTooLong = errors.New("crypto/rsa: message too long for RSA public key size")
```

ErrMessageTooLong is returned when attempting to encrypt a message which is too large for the size of the public key. 

### <a id="ErrDecryption" href="#ErrDecryption">var ErrDecryption</a>

```
searchKey: rsa.ErrDecryption
```

```Go
var ErrDecryption = errors.New("crypto/rsa: decryption error")
```

ErrDecryption represents a failure to decrypt a message. It is deliberately vague to avoid adaptive attacks. 

### <a id="ErrVerification" href="#ErrVerification">var ErrVerification</a>

```
searchKey: rsa.ErrVerification
```

```Go
var ErrVerification = errors.New("crypto/rsa: verification error")
```

ErrVerification represents a failure to verify a signature. It is deliberately vague to avoid adaptive attacks. 

### <a id="decryptPKCS1v15Tests" href="#decryptPKCS1v15Tests">var decryptPKCS1v15Tests</a>

```
searchKey: rsa.decryptPKCS1v15Tests
tags: [private]
```

```Go
var decryptPKCS1v15Tests = ...
```

These test vectors were generated with `openssl rsautl -pkcs -encrypt` 

### <a id="decryptPKCS1v15SessionKeyTests" href="#decryptPKCS1v15SessionKeyTests">var decryptPKCS1v15SessionKeyTests</a>

```
searchKey: rsa.decryptPKCS1v15SessionKeyTests
tags: [private]
```

```Go
var decryptPKCS1v15SessionKeyTests = ...
```

These test vectors were generated with `openssl rsautl -pkcs -encrypt` 

### <a id="signPKCS1v15Tests" href="#signPKCS1v15Tests">var signPKCS1v15Tests</a>

```
searchKey: rsa.signPKCS1v15Tests
tags: [private]
```

```Go
var signPKCS1v15Tests = ...
```

These vectors have been tested with 

```
`openssl rsautl -verify -inkey pk -in signature | hexdump -C`

```
### <a id="rsaPrivateKey" href="#rsaPrivateKey">var rsaPrivateKey</a>

```
searchKey: rsa.rsaPrivateKey
tags: [private]
```

```Go
var rsaPrivateKey = ...
```

### <a id="test2048Key" href="#test2048Key">var test2048Key</a>

```
searchKey: rsa.test2048Key
tags: [private]
```

```Go
var test2048Key *PrivateKey
```

### <a id="testEncryptOAEPData" href="#testEncryptOAEPData">var testEncryptOAEPData</a>

```
searchKey: rsa.testEncryptOAEPData
tags: [private]
```

```Go
var testEncryptOAEPData = ...
```

testEncryptOAEPData contains a subset of the vectors from RSA's "Test vectors for RSA-OAEP". 

## <a id="type" href="#type">Types</a>

### <a id="PKCS1v15DecryptOptions" href="#PKCS1v15DecryptOptions">type PKCS1v15DecryptOptions struct</a>

```
searchKey: rsa.PKCS1v15DecryptOptions
```

```Go
type PKCS1v15DecryptOptions struct {
	// SessionKeyLen is the length of the session key that is being
	// decrypted. If not zero, then a padding error during decryption will
	// cause a random plaintext of this length to be returned rather than
	// an error. These alternatives happen in constant time.
	SessionKeyLen int
}
```

PKCS1v15DecrypterOpts is for passing options to PKCS #1 v1.5 decryption using the crypto.Decrypter interface. 

### <a id="PSSOptions" href="#PSSOptions">type PSSOptions struct</a>

```
searchKey: rsa.PSSOptions
```

```Go
type PSSOptions struct {
	// SaltLength controls the length of the salt used in the PSS
	// signature. It can either be a number of bytes, or one of the special
	// PSSSaltLength constants.
	SaltLength int

	// Hash is the hash function used to generate the message digest. If not
	// zero, it overrides the hash function passed to SignPSS. It's required
	// when using PrivateKey.Sign.
	Hash crypto.Hash
}
```

PSSOptions contains options for creating and verifying PSS signatures. 

#### <a id="PSSOptions.HashFunc" href="#PSSOptions.HashFunc">func (opts *PSSOptions) HashFunc() crypto.Hash</a>

```
searchKey: rsa.PSSOptions.HashFunc
```

```Go
func (opts *PSSOptions) HashFunc() crypto.Hash
```

HashFunc returns opts.Hash so that PSSOptions implements crypto.SignerOpts. 

#### <a id="PSSOptions.saltLength" href="#PSSOptions.saltLength">func (opts *PSSOptions) saltLength() int</a>

```
searchKey: rsa.PSSOptions.saltLength
tags: [private]
```

```Go
func (opts *PSSOptions) saltLength() int
```

### <a id="PublicKey" href="#PublicKey">type PublicKey struct</a>

```
searchKey: rsa.PublicKey
```

```Go
type PublicKey struct {
	N *big.Int // modulus
	E int      // public exponent
}
```

A PublicKey represents the public part of an RSA key. 

#### <a id="PublicKey.Size" href="#PublicKey.Size">func (pub *PublicKey) Size() int</a>

```
searchKey: rsa.PublicKey.Size
```

```Go
func (pub *PublicKey) Size() int
```

Size returns the modulus size in bytes. Raw signatures and ciphertexts for or by this public key will have the same size. 

#### <a id="PublicKey.Equal" href="#PublicKey.Equal">func (pub *PublicKey) Equal(x crypto.PublicKey) bool</a>

```
searchKey: rsa.PublicKey.Equal
```

```Go
func (pub *PublicKey) Equal(x crypto.PublicKey) bool
```

Equal reports whether pub and x have the same value. 

### <a id="OAEPOptions" href="#OAEPOptions">type OAEPOptions struct</a>

```
searchKey: rsa.OAEPOptions
```

```Go
type OAEPOptions struct {
	// Hash is the hash function that will be used when generating the mask.
	Hash crypto.Hash
	// Label is an arbitrary byte string that must be equal to the value
	// used when encrypting.
	Label []byte
}
```

OAEPOptions is an interface for passing options to OAEP decryption using the crypto.Decrypter interface. 

### <a id="PrivateKey" href="#PrivateKey">type PrivateKey struct</a>

```
searchKey: rsa.PrivateKey
```

```Go
type PrivateKey struct {
	PublicKey            // public part.
	D         *big.Int   // private exponent
	Primes    []*big.Int // prime factors of N, has >= 2 elements.

	// Precomputed contains precomputed values that speed up private
	// operations, if available.
	Precomputed PrecomputedValues
}
```

A PrivateKey represents an RSA key 

#### <a id="GenerateKey" href="#GenerateKey">func GenerateKey(random io.Reader, bits int) (*PrivateKey, error)</a>

```
searchKey: rsa.GenerateKey
```

```Go
func GenerateKey(random io.Reader, bits int) (*PrivateKey, error)
```

GenerateKey generates an RSA keypair of the given bit size using the random source random (for example, crypto/rand.Reader). 

#### <a id="GenerateMultiPrimeKey" href="#GenerateMultiPrimeKey">func GenerateMultiPrimeKey(random io.Reader, nprimes int, bits int) (*PrivateKey, error)</a>

```
searchKey: rsa.GenerateMultiPrimeKey
```

```Go
func GenerateMultiPrimeKey(random io.Reader, nprimes int, bits int) (*PrivateKey, error)
```

GenerateMultiPrimeKey generates a multi-prime RSA keypair of the given bit size and the given random source, as suggested in [1]. Although the public keys are compatible (actually, indistinguishable) from the 2-prime case, the private keys are not. Thus it may not be possible to export multi-prime private keys in certain formats or to subsequently import them into other code. 

Table 1 in [2] suggests maximum numbers of primes for a given size. 

[1] US patent 4405829 (1972, expired) [2] [http://www.cacr.math.uwaterloo.ca/techreports/2006/cacr2006-16.pdf](http://www.cacr.math.uwaterloo.ca/techreports/2006/cacr2006-16.pdf) 

#### <a id="PrivateKey.Public" href="#PrivateKey.Public">func (priv *PrivateKey) Public() crypto.PublicKey</a>

```
searchKey: rsa.PrivateKey.Public
```

```Go
func (priv *PrivateKey) Public() crypto.PublicKey
```

Public returns the public key corresponding to priv. 

#### <a id="PrivateKey.Equal" href="#PrivateKey.Equal">func (priv *PrivateKey) Equal(x crypto.PrivateKey) bool</a>

```
searchKey: rsa.PrivateKey.Equal
```

```Go
func (priv *PrivateKey) Equal(x crypto.PrivateKey) bool
```

Equal reports whether priv and x have equivalent values. It ignores Precomputed values. 

#### <a id="PrivateKey.Sign" href="#PrivateKey.Sign">func (priv *PrivateKey) Sign(rand io.Reader, digest []byte, opts crypto.SignerOpts) ([]byte, error)</a>

```
searchKey: rsa.PrivateKey.Sign
```

```Go
func (priv *PrivateKey) Sign(rand io.Reader, digest []byte, opts crypto.SignerOpts) ([]byte, error)
```

Sign signs digest with priv, reading randomness from rand. If opts is a *PSSOptions then the PSS algorithm will be used, otherwise PKCS #1 v1.5 will be used. digest must be the result of hashing the input message using opts.HashFunc(). 

This method implements crypto.Signer, which is an interface to support keys where the private part is kept in, for example, a hardware module. Common uses should use the Sign* functions in this package directly. 

#### <a id="PrivateKey.Decrypt" href="#PrivateKey.Decrypt">func (priv *PrivateKey) Decrypt(rand io.Reader, ciphertext []byte, opts crypto.DecrypterOpts) (plaintext []byte, err error)</a>

```
searchKey: rsa.PrivateKey.Decrypt
```

```Go
func (priv *PrivateKey) Decrypt(rand io.Reader, ciphertext []byte, opts crypto.DecrypterOpts) (plaintext []byte, err error)
```

Decrypt decrypts ciphertext with priv. If opts is nil or of type *PKCS1v15DecryptOptions then PKCS #1 v1.5 decryption is performed. Otherwise opts must have type *OAEPOptions and OAEP decryption is done. 

#### <a id="PrivateKey.Validate" href="#PrivateKey.Validate">func (priv *PrivateKey) Validate() error</a>

```
searchKey: rsa.PrivateKey.Validate
```

```Go
func (priv *PrivateKey) Validate() error
```

Validate performs basic sanity checks on the key. It returns nil if the key is valid, or else an error describing a problem. 

#### <a id="PrivateKey.Precompute" href="#PrivateKey.Precompute">func (priv *PrivateKey) Precompute()</a>

```
searchKey: rsa.PrivateKey.Precompute
```

```Go
func (priv *PrivateKey) Precompute()
```

Precompute performs some calculations that speed up private key operations in the future. 

### <a id="PrecomputedValues" href="#PrecomputedValues">type PrecomputedValues struct</a>

```
searchKey: rsa.PrecomputedValues
```

```Go
type PrecomputedValues struct {
	Dp, Dq *big.Int // D mod (P-1) (or mod Q-1)
	Qinv   *big.Int // Q^-1 mod P

	// CRTValues is used for the 3rd and subsequent primes. Due to a
	// historical accident, the CRT for the first two primes is handled
	// differently in PKCS #1 and interoperability is sufficiently
	// important that we mirror this.
	CRTValues []CRTValue
}
```

### <a id="CRTValue" href="#CRTValue">type CRTValue struct</a>

```
searchKey: rsa.CRTValue
```

```Go
type CRTValue struct {
	Exp   *big.Int // D mod (prime-1).
	Coeff *big.Int // R·Coeff ≡ 1 mod Prime.
	R     *big.Int // product of primes prior to this (inc p and q).
}
```

CRTValue contains the precomputed Chinese remainder theorem values. 

### <a id="DecryptPKCS1v15Test" href="#DecryptPKCS1v15Test">type DecryptPKCS1v15Test struct</a>

```
searchKey: rsa.DecryptPKCS1v15Test
tags: [private]
```

```Go
type DecryptPKCS1v15Test struct {
	in, out string
}
```

### <a id="signPKCS1v15Test" href="#signPKCS1v15Test">type signPKCS1v15Test struct</a>

```
searchKey: rsa.signPKCS1v15Test
tags: [private]
```

```Go
type signPKCS1v15Test struct {
	in, out string
}
```

### <a id="testEncryptOAEPMessage" href="#testEncryptOAEPMessage">type testEncryptOAEPMessage struct</a>

```
searchKey: rsa.testEncryptOAEPMessage
tags: [private]
```

```Go
type testEncryptOAEPMessage struct {
	in   []byte
	seed []byte
	out  []byte
}
```

### <a id="testEncryptOAEPStruct" href="#testEncryptOAEPStruct">type testEncryptOAEPStruct struct</a>

```
searchKey: rsa.testEncryptOAEPStruct
tags: [private]
```

```Go
type testEncryptOAEPStruct struct {
	modulus string
	e       int
	d       string
	msgs    []testEncryptOAEPMessage
}
```

## <a id="func" href="#func">Functions</a>

### <a id="EncryptPKCS1v15" href="#EncryptPKCS1v15">func EncryptPKCS1v15(rand io.Reader, pub *PublicKey, msg []byte) ([]byte, error)</a>

```
searchKey: rsa.EncryptPKCS1v15
```

```Go
func EncryptPKCS1v15(rand io.Reader, pub *PublicKey, msg []byte) ([]byte, error)
```

EncryptPKCS1v15 encrypts the given message with RSA and the padding scheme from PKCS #1 v1.5.  The message must be no longer than the length of the public modulus minus 11 bytes. 

The rand parameter is used as a source of entropy to ensure that encrypting the same message twice doesn't result in the same ciphertext. 

WARNING: use of this function to encrypt plaintexts other than session keys is dangerous. Use RSA OAEP in new protocols. 

### <a id="DecryptPKCS1v15" href="#DecryptPKCS1v15">func DecryptPKCS1v15(rand io.Reader, priv *PrivateKey, ciphertext []byte) ([]byte, error)</a>

```
searchKey: rsa.DecryptPKCS1v15
```

```Go
func DecryptPKCS1v15(rand io.Reader, priv *PrivateKey, ciphertext []byte) ([]byte, error)
```

DecryptPKCS1v15 decrypts a plaintext using RSA and the padding scheme from PKCS #1 v1.5. If rand != nil, it uses RSA blinding to avoid timing side-channel attacks. 

Note that whether this function returns an error or not discloses secret information. If an attacker can cause this function to run repeatedly and learn whether each instance returned an error then they can decrypt and forge signatures as if they had the private key. See DecryptPKCS1v15SessionKey for a way of solving this problem. 

### <a id="DecryptPKCS1v15SessionKey" href="#DecryptPKCS1v15SessionKey">func DecryptPKCS1v15SessionKey(rand io.Reader, priv *PrivateKey, ciphertext []byte, key []byte) error</a>

```
searchKey: rsa.DecryptPKCS1v15SessionKey
```

```Go
func DecryptPKCS1v15SessionKey(rand io.Reader, priv *PrivateKey, ciphertext []byte, key []byte) error
```

DecryptPKCS1v15SessionKey decrypts a session key using RSA and the padding scheme from PKCS #1 v1.5. If rand != nil, it uses RSA blinding to avoid timing side-channel attacks. It returns an error if the ciphertext is the wrong length or if the ciphertext is greater than the public modulus. Otherwise, no error is returned. If the padding is valid, the resulting plaintext message is copied into key. Otherwise, key is unchanged. These alternatives occur in constant time. It is intended that the user of this function generate a random session key beforehand and continue the protocol with the resulting value. This will remove any possibility that an attacker can learn any information about the plaintext. See `Chosen Ciphertext Attacks Against Protocols Based on the RSA Encryption Standard PKCS #1', Daniel Bleichenbacher, Advances in Cryptology (Crypto '98). 

Note that if the session key is too small then it may be possible for an attacker to brute-force it. If they can do that then they can learn whether a random value was used (because it'll be different for the same ciphertext) and thus whether the padding was correct. This defeats the point of this function. Using at least a 16-byte key will protect against this attack. 

### <a id="decryptPKCS1v15" href="#decryptPKCS1v15">func decryptPKCS1v15(rand io.Reader, priv *PrivateKey, ciphertext []byte) (valid int, em []byte, index int, err error)</a>

```
searchKey: rsa.decryptPKCS1v15
tags: [private]
```

```Go
func decryptPKCS1v15(rand io.Reader, priv *PrivateKey, ciphertext []byte) (valid int, em []byte, index int, err error)
```

decryptPKCS1v15 decrypts ciphertext using priv and blinds the operation if rand is not nil. It returns one or zero in valid that indicates whether the plaintext was correctly structured. In either case, the plaintext is returned in em so that it may be read independently of whether it was valid in order to maintain constant memory access patterns. If the plaintext was valid then index contains the index of the original message in em. 

### <a id="nonZeroRandomBytes" href="#nonZeroRandomBytes">func nonZeroRandomBytes(s []byte, rand io.Reader) (err error)</a>

```
searchKey: rsa.nonZeroRandomBytes
tags: [private]
```

```Go
func nonZeroRandomBytes(s []byte, rand io.Reader) (err error)
```

nonZeroRandomBytes fills the given slice with non-zero random octets. 

### <a id="SignPKCS1v15" href="#SignPKCS1v15">func SignPKCS1v15(rand io.Reader, priv *PrivateKey, hash crypto.Hash, hashed []byte) ([]byte, error)</a>

```
searchKey: rsa.SignPKCS1v15
```

```Go
func SignPKCS1v15(rand io.Reader, priv *PrivateKey, hash crypto.Hash, hashed []byte) ([]byte, error)
```

SignPKCS1v15 calculates the signature of hashed using RSASSA-PKCS1-V1_5-SIGN from RSA PKCS #1 v1.5.  Note that hashed must be the result of hashing the input message using the given hash function. If hash is zero, hashed is signed directly. This isn't advisable except for interoperability. 

If rand is not nil then RSA blinding will be used to avoid timing side-channel attacks. 

This function is deterministic. Thus, if the set of possible messages is small, an attacker may be able to build a map from messages to signatures and identify the signed messages. As ever, signatures provide authenticity, not confidentiality. 

### <a id="VerifyPKCS1v15" href="#VerifyPKCS1v15">func VerifyPKCS1v15(pub *PublicKey, hash crypto.Hash, hashed []byte, sig []byte) error</a>

```
searchKey: rsa.VerifyPKCS1v15
```

```Go
func VerifyPKCS1v15(pub *PublicKey, hash crypto.Hash, hashed []byte, sig []byte) error
```

VerifyPKCS1v15 verifies an RSA PKCS #1 v1.5 signature. hashed is the result of hashing the input message using the given hash function and sig is the signature. A valid signature is indicated by returning a nil error. If hash is zero then hashed is used directly. This isn't advisable except for interoperability. 

### <a id="pkcs1v15HashInfo" href="#pkcs1v15HashInfo">func pkcs1v15HashInfo(hash crypto.Hash, inLen int) (hashLen int, prefix []byte, err error)</a>

```
searchKey: rsa.pkcs1v15HashInfo
tags: [private]
```

```Go
func pkcs1v15HashInfo(hash crypto.Hash, inLen int) (hashLen int, prefix []byte, err error)
```

### <a id="emsaPSSEncode" href="#emsaPSSEncode">func emsaPSSEncode(mHash []byte, emBits int, salt []byte, hash hash.Hash) ([]byte, error)</a>

```
searchKey: rsa.emsaPSSEncode
tags: [private]
```

```Go
func emsaPSSEncode(mHash []byte, emBits int, salt []byte, hash hash.Hash) ([]byte, error)
```

### <a id="emsaPSSVerify" href="#emsaPSSVerify">func emsaPSSVerify(mHash, em []byte, emBits, sLen int, hash hash.Hash) error</a>

```
searchKey: rsa.emsaPSSVerify
tags: [private]
```

```Go
func emsaPSSVerify(mHash, em []byte, emBits, sLen int, hash hash.Hash) error
```

### <a id="signPSSWithSalt" href="#signPSSWithSalt">func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.Hash, hashed, salt []byte) ([]byte, error)</a>

```
searchKey: rsa.signPSSWithSalt
tags: [private]
```

```Go
func signPSSWithSalt(rand io.Reader, priv *PrivateKey, hash crypto.Hash, hashed, salt []byte) ([]byte, error)
```

signPSSWithSalt calculates the signature of hashed using PSS with specified salt. Note that hashed must be the result of hashing the input message using the given hash function. salt is a random sequence of bytes whose length will be later used to verify the signature. 

### <a id="SignPSS" href="#SignPSS">func SignPSS(rand io.Reader, priv *PrivateKey, hash crypto.Hash, digest []byte, opts *PSSOptions) ([]byte, error)</a>

```
searchKey: rsa.SignPSS
```

```Go
func SignPSS(rand io.Reader, priv *PrivateKey, hash crypto.Hash, digest []byte, opts *PSSOptions) ([]byte, error)
```

SignPSS calculates the signature of digest using PSS. 

digest must be the result of hashing the input message using the given hash function. The opts argument may be nil, in which case sensible defaults are used. If opts.Hash is set, it overrides hash. 

### <a id="VerifyPSS" href="#VerifyPSS">func VerifyPSS(pub *PublicKey, hash crypto.Hash, digest []byte, sig []byte, opts *PSSOptions) error</a>

```
searchKey: rsa.VerifyPSS
```

```Go
func VerifyPSS(pub *PublicKey, hash crypto.Hash, digest []byte, sig []byte, opts *PSSOptions) error
```

VerifyPSS verifies a PSS signature. 

A valid signature is indicated by returning a nil error. digest must be the result of hashing the input message using the given hash function. The opts argument may be nil, in which case sensible defaults are used. opts.Hash is ignored. 

### <a id="checkPub" href="#checkPub">func checkPub(pub *PublicKey) error</a>

```
searchKey: rsa.checkPub
tags: [private]
```

```Go
func checkPub(pub *PublicKey) error
```

checkPub sanity checks the public key before we use it. We require pub.E to fit into a 32-bit integer so that we do not have different behavior depending on whether int is 32 or 64 bits. See also [https://www.imperialviolet.org/2012/03/16/rsae.html](https://www.imperialviolet.org/2012/03/16/rsae.html). 

### <a id="incCounter" href="#incCounter">func incCounter(c *[4]byte)</a>

```
searchKey: rsa.incCounter
tags: [private]
```

```Go
func incCounter(c *[4]byte)
```

incCounter increments a four byte, big-endian counter. 

### <a id="mgf1XOR" href="#mgf1XOR">func mgf1XOR(out []byte, hash hash.Hash, seed []byte)</a>

```
searchKey: rsa.mgf1XOR
tags: [private]
```

```Go
func mgf1XOR(out []byte, hash hash.Hash, seed []byte)
```

mgf1XOR XORs the bytes in out with a mask generated using the MGF1 function specified in PKCS #1 v2.1. 

### <a id="encrypt" href="#encrypt">func encrypt(c *big.Int, pub *PublicKey, m *big.Int) *big.Int</a>

```
searchKey: rsa.encrypt
tags: [private]
```

```Go
func encrypt(c *big.Int, pub *PublicKey, m *big.Int) *big.Int
```

### <a id="EncryptOAEP" href="#EncryptOAEP">func EncryptOAEP(hash hash.Hash, random io.Reader, pub *PublicKey, msg []byte, label []byte) ([]byte, error)</a>

```
searchKey: rsa.EncryptOAEP
```

```Go
func EncryptOAEP(hash hash.Hash, random io.Reader, pub *PublicKey, msg []byte, label []byte) ([]byte, error)
```

EncryptOAEP encrypts the given message with RSA-OAEP. 

OAEP is parameterised by a hash function that is used as a random oracle. Encryption and decryption of a given message must use the same hash function and sha256.New() is a reasonable choice. 

The random parameter is used as a source of entropy to ensure that encrypting the same message twice doesn't result in the same ciphertext. 

The label parameter may contain arbitrary data that will not be encrypted, but which gives important context to the message. For example, if a given public key is used to encrypt two types of messages then distinct label values could be used to ensure that a ciphertext for one purpose cannot be used for another by an attacker. If not required it can be empty. 

The message must be no longer than the length of the public modulus minus twice the hash length, minus a further 2. 

### <a id="decrypt" href="#decrypt">func decrypt(random io.Reader, priv *PrivateKey, c *big.Int) (m *big.Int, err error)</a>

```
searchKey: rsa.decrypt
tags: [private]
```

```Go
func decrypt(random io.Reader, priv *PrivateKey, c *big.Int) (m *big.Int, err error)
```

decrypt performs an RSA decryption, resulting in a plaintext integer. If a random source is given, RSA blinding is used. 

### <a id="decryptAndCheck" href="#decryptAndCheck">func decryptAndCheck(random io.Reader, priv *PrivateKey, c *big.Int) (m *big.Int, err error)</a>

```
searchKey: rsa.decryptAndCheck
tags: [private]
```

```Go
func decryptAndCheck(random io.Reader, priv *PrivateKey, c *big.Int) (m *big.Int, err error)
```

### <a id="DecryptOAEP" href="#DecryptOAEP">func DecryptOAEP(hash hash.Hash, random io.Reader, priv *PrivateKey, ciphertext []byte, label []byte) ([]byte, error)</a>

```
searchKey: rsa.DecryptOAEP
```

```Go
func DecryptOAEP(hash hash.Hash, random io.Reader, priv *PrivateKey, ciphertext []byte, label []byte) ([]byte, error)
```

DecryptOAEP decrypts ciphertext using RSA-OAEP. 

OAEP is parameterised by a hash function that is used as a random oracle. Encryption and decryption of a given message must use the same hash function and sha256.New() is a reasonable choice. 

The random parameter, if not nil, is used to blind the private-key operation and avoid timing side-channel attacks. Blinding is purely internal to this function – the random data need not match that used when encrypting. 

The label parameter must match the value given when encrypting. See EncryptOAEP for details. 

### <a id="ExampleDecryptPKCS1v15SessionKey" href="#ExampleDecryptPKCS1v15SessionKey">func ExampleDecryptPKCS1v15SessionKey()</a>

```
searchKey: rsa.ExampleDecryptPKCS1v15SessionKey
tags: [private]
```

```Go
func ExampleDecryptPKCS1v15SessionKey()
```

RSA is able to encrypt only a very limited amount of data. In order to encrypt reasonable amounts of data a hybrid scheme is commonly used: RSA is used to encrypt a key for a symmetric primitive like AES-GCM. 

Before encrypting, data is “padded” by embedding it in a known structure. This is done for a number of reasons, but the most obvious is to ensure that the value is large enough that the exponentiation is larger than the modulus. (Otherwise it could be decrypted with a square-root.) 

In these designs, when using PKCS #1 v1.5, it's vitally important to avoid disclosing whether the received RSA message was well-formed (that is, whether the result of decrypting is a correctly padded message) because this leaks secret information. DecryptPKCS1v15SessionKey is designed for this situation and copies the decrypted, symmetric key (if well-formed) in constant-time over a buffer that contains a random key. Thus, if the RSA result isn't well-formed, the implementation uses a random key in constant time. 

### <a id="ExampleSignPKCS1v15" href="#ExampleSignPKCS1v15">func ExampleSignPKCS1v15()</a>

```
searchKey: rsa.ExampleSignPKCS1v15
tags: [private]
```

```Go
func ExampleSignPKCS1v15()
```

### <a id="ExampleVerifyPKCS1v15" href="#ExampleVerifyPKCS1v15">func ExampleVerifyPKCS1v15()</a>

```
searchKey: rsa.ExampleVerifyPKCS1v15
tags: [private]
```

```Go
func ExampleVerifyPKCS1v15()
```

### <a id="ExampleEncryptOAEP" href="#ExampleEncryptOAEP">func ExampleEncryptOAEP()</a>

```
searchKey: rsa.ExampleEncryptOAEP
tags: [private]
```

```Go
func ExampleEncryptOAEP()
```

### <a id="ExampleDecryptOAEP" href="#ExampleDecryptOAEP">func ExampleDecryptOAEP()</a>

```
searchKey: rsa.ExampleDecryptOAEP
tags: [private]
```

```Go
func ExampleDecryptOAEP()
```

### <a id="decodeBase64" href="#decodeBase64">func decodeBase64(in string) []byte</a>

```
searchKey: rsa.decodeBase64
tags: [private]
```

```Go
func decodeBase64(in string) []byte
```

### <a id="TestDecryptPKCS1v15" href="#TestDecryptPKCS1v15">func TestDecryptPKCS1v15(t *testing.T)</a>

```
searchKey: rsa.TestDecryptPKCS1v15
tags: [private]
```

```Go
func TestDecryptPKCS1v15(t *testing.T)
```

### <a id="TestEncryptPKCS1v15" href="#TestEncryptPKCS1v15">func TestEncryptPKCS1v15(t *testing.T)</a>

```
searchKey: rsa.TestEncryptPKCS1v15
tags: [private]
```

```Go
func TestEncryptPKCS1v15(t *testing.T)
```

### <a id="TestEncryptPKCS1v15SessionKey" href="#TestEncryptPKCS1v15SessionKey">func TestEncryptPKCS1v15SessionKey(t *testing.T)</a>

```
searchKey: rsa.TestEncryptPKCS1v15SessionKey
tags: [private]
```

```Go
func TestEncryptPKCS1v15SessionKey(t *testing.T)
```

### <a id="TestEncryptPKCS1v15DecrypterSessionKey" href="#TestEncryptPKCS1v15DecrypterSessionKey">func TestEncryptPKCS1v15DecrypterSessionKey(t *testing.T)</a>

```
searchKey: rsa.TestEncryptPKCS1v15DecrypterSessionKey
tags: [private]
```

```Go
func TestEncryptPKCS1v15DecrypterSessionKey(t *testing.T)
```

### <a id="TestNonZeroRandomBytes" href="#TestNonZeroRandomBytes">func TestNonZeroRandomBytes(t *testing.T)</a>

```
searchKey: rsa.TestNonZeroRandomBytes
tags: [private]
```

```Go
func TestNonZeroRandomBytes(t *testing.T)
```

### <a id="TestSignPKCS1v15" href="#TestSignPKCS1v15">func TestSignPKCS1v15(t *testing.T)</a>

```
searchKey: rsa.TestSignPKCS1v15
tags: [private]
```

```Go
func TestSignPKCS1v15(t *testing.T)
```

### <a id="TestVerifyPKCS1v15" href="#TestVerifyPKCS1v15">func TestVerifyPKCS1v15(t *testing.T)</a>

```
searchKey: rsa.TestVerifyPKCS1v15
tags: [private]
```

```Go
func TestVerifyPKCS1v15(t *testing.T)
```

### <a id="TestOverlongMessagePKCS1v15" href="#TestOverlongMessagePKCS1v15">func TestOverlongMessagePKCS1v15(t *testing.T)</a>

```
searchKey: rsa.TestOverlongMessagePKCS1v15
tags: [private]
```

```Go
func TestOverlongMessagePKCS1v15(t *testing.T)
```

### <a id="TestUnpaddedSignature" href="#TestUnpaddedSignature">func TestUnpaddedSignature(t *testing.T)</a>

```
searchKey: rsa.TestUnpaddedSignature
tags: [private]
```

```Go
func TestUnpaddedSignature(t *testing.T)
```

### <a id="TestShortSessionKey" href="#TestShortSessionKey">func TestShortSessionKey(t *testing.T)</a>

```
searchKey: rsa.TestShortSessionKey
tags: [private]
```

```Go
func TestShortSessionKey(t *testing.T)
```

### <a id="TestShortPKCS1v15Signature" href="#TestShortPKCS1v15Signature">func TestShortPKCS1v15Signature(t *testing.T)</a>

```
searchKey: rsa.TestShortPKCS1v15Signature
tags: [private]
```

```Go
func TestShortPKCS1v15Signature(t *testing.T)
```

### <a id="TestEMSAPSS" href="#TestEMSAPSS">func TestEMSAPSS(t *testing.T)</a>

```
searchKey: rsa.TestEMSAPSS
tags: [private]
```

```Go
func TestEMSAPSS(t *testing.T)
```

### <a id="TestPSSGolden" href="#TestPSSGolden">func TestPSSGolden(t *testing.T)</a>

```
searchKey: rsa.TestPSSGolden
tags: [private]
```

```Go
func TestPSSGolden(t *testing.T)
```

TestPSSGolden tests all the test vectors in pss-vect.txt from [ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-1/pkcs-1v2-1-vec.zip](ftp://ftp.rsasecurity.com/pub/pkcs/pkcs-1/pkcs-1v2-1-vec.zip) 

### <a id="TestPSSOpenSSL" href="#TestPSSOpenSSL">func TestPSSOpenSSL(t *testing.T)</a>

```
searchKey: rsa.TestPSSOpenSSL
tags: [private]
```

```Go
func TestPSSOpenSSL(t *testing.T)
```

TestPSSOpenSSL ensures that we can verify a PSS signature from OpenSSL with the default options. OpenSSL sets the salt length to be maximal. 

### <a id="TestPSSNilOpts" href="#TestPSSNilOpts">func TestPSSNilOpts(t *testing.T)</a>

```
searchKey: rsa.TestPSSNilOpts
tags: [private]
```

```Go
func TestPSSNilOpts(t *testing.T)
```

### <a id="TestPSSSigning" href="#TestPSSSigning">func TestPSSSigning(t *testing.T)</a>

```
searchKey: rsa.TestPSSSigning
tags: [private]
```

```Go
func TestPSSSigning(t *testing.T)
```

### <a id="TestSignWithPSSSaltLengthAuto" href="#TestSignWithPSSSaltLengthAuto">func TestSignWithPSSSaltLengthAuto(t *testing.T)</a>

```
searchKey: rsa.TestSignWithPSSSaltLengthAuto
tags: [private]
```

```Go
func TestSignWithPSSSaltLengthAuto(t *testing.T)
```

### <a id="bigFromHex" href="#bigFromHex">func bigFromHex(hex string) *big.Int</a>

```
searchKey: rsa.bigFromHex
tags: [private]
```

```Go
func bigFromHex(hex string) *big.Int
```

### <a id="intFromHex" href="#intFromHex">func intFromHex(hex string) int</a>

```
searchKey: rsa.intFromHex
tags: [private]
```

```Go
func intFromHex(hex string) int
```

### <a id="fromHex" href="#fromHex">func fromHex(hexStr string) []byte</a>

```
searchKey: rsa.fromHex
tags: [private]
```

```Go
func fromHex(hexStr string) []byte
```

### <a id="TestKeyGeneration" href="#TestKeyGeneration">func TestKeyGeneration(t *testing.T)</a>

```
searchKey: rsa.TestKeyGeneration
tags: [private]
```

```Go
func TestKeyGeneration(t *testing.T)
```

### <a id="Test3PrimeKeyGeneration" href="#Test3PrimeKeyGeneration">func Test3PrimeKeyGeneration(t *testing.T)</a>

```
searchKey: rsa.Test3PrimeKeyGeneration
tags: [private]
```

```Go
func Test3PrimeKeyGeneration(t *testing.T)
```

### <a id="Test4PrimeKeyGeneration" href="#Test4PrimeKeyGeneration">func Test4PrimeKeyGeneration(t *testing.T)</a>

```
searchKey: rsa.Test4PrimeKeyGeneration
tags: [private]
```

```Go
func Test4PrimeKeyGeneration(t *testing.T)
```

### <a id="TestNPrimeKeyGeneration" href="#TestNPrimeKeyGeneration">func TestNPrimeKeyGeneration(t *testing.T)</a>

```
searchKey: rsa.TestNPrimeKeyGeneration
tags: [private]
```

```Go
func TestNPrimeKeyGeneration(t *testing.T)
```

### <a id="TestImpossibleKeyGeneration" href="#TestImpossibleKeyGeneration">func TestImpossibleKeyGeneration(t *testing.T)</a>

```
searchKey: rsa.TestImpossibleKeyGeneration
tags: [private]
```

```Go
func TestImpossibleKeyGeneration(t *testing.T)
```

### <a id="TestGnuTLSKey" href="#TestGnuTLSKey">func TestGnuTLSKey(t *testing.T)</a>

```
searchKey: rsa.TestGnuTLSKey
tags: [private]
```

```Go
func TestGnuTLSKey(t *testing.T)
```

### <a id="testKeyBasics" href="#testKeyBasics">func testKeyBasics(t *testing.T, priv *PrivateKey)</a>

```
searchKey: rsa.testKeyBasics
tags: [private]
```

```Go
func testKeyBasics(t *testing.T, priv *PrivateKey)
```

### <a id="fromBase10" href="#fromBase10">func fromBase10(base10 string) *big.Int</a>

```
searchKey: rsa.fromBase10
tags: [private]
```

```Go
func fromBase10(base10 string) *big.Int
```

### <a id="init.rsa_test.go" href="#init.rsa_test.go">func init()</a>

```
searchKey: rsa.init
tags: [private]
```

```Go
func init()
```

### <a id="BenchmarkRSA2048Decrypt" href="#BenchmarkRSA2048Decrypt">func BenchmarkRSA2048Decrypt(b *testing.B)</a>

```
searchKey: rsa.BenchmarkRSA2048Decrypt
tags: [private]
```

```Go
func BenchmarkRSA2048Decrypt(b *testing.B)
```

### <a id="BenchmarkRSA2048Sign" href="#BenchmarkRSA2048Sign">func BenchmarkRSA2048Sign(b *testing.B)</a>

```
searchKey: rsa.BenchmarkRSA2048Sign
tags: [private]
```

```Go
func BenchmarkRSA2048Sign(b *testing.B)
```

### <a id="Benchmark3PrimeRSA2048Decrypt" href="#Benchmark3PrimeRSA2048Decrypt">func Benchmark3PrimeRSA2048Decrypt(b *testing.B)</a>

```
searchKey: rsa.Benchmark3PrimeRSA2048Decrypt
tags: [private]
```

```Go
func Benchmark3PrimeRSA2048Decrypt(b *testing.B)
```

### <a id="TestEncryptOAEP" href="#TestEncryptOAEP">func TestEncryptOAEP(t *testing.T)</a>

```
searchKey: rsa.TestEncryptOAEP
tags: [private]
```

```Go
func TestEncryptOAEP(t *testing.T)
```

### <a id="TestDecryptOAEP" href="#TestDecryptOAEP">func TestDecryptOAEP(t *testing.T)</a>

```
searchKey: rsa.TestDecryptOAEP
tags: [private]
```

```Go
func TestDecryptOAEP(t *testing.T)
```

