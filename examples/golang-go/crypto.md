# Package crypto

Package crypto collects common cryptographic constants. 

## Index

* Subpages
  * [crypto/internal](crypto/internal.md)
  * [crypto/aes](crypto/aes.md)
  * [crypto/cipher](crypto/cipher.md)
  * [crypto/cipher_test](crypto/cipher_test.md)
  * [crypto/des](crypto/des.md)
  * [crypto/des_test](crypto/des_test.md)
  * [crypto/dsa](crypto/dsa.md)
  * [crypto/ecdsa](crypto/ecdsa.md)
  * [crypto/ecdsa_test](crypto/ecdsa_test.md)
  * [crypto/ed25519](crypto/ed25519.md)
  * [crypto/ed25519_test](crypto/ed25519_test.md)
  * [crypto/elliptic](crypto/elliptic.md)
  * [crypto/hmac](crypto/hmac.md)
  * [crypto/md5](crypto/md5.md)
  * [crypto/md5_test](crypto/md5_test.md)
  * [crypto/rand](crypto/rand.md)
  * [crypto/rand_test](crypto/rand_test.md)
  * [crypto/rc4](crypto/rc4.md)
  * [crypto/rsa](crypto/rsa.md)
  * [crypto/rsa_test](crypto/rsa_test.md)
  * [crypto/sha1](crypto/sha1.md)
  * [crypto/sha1_test](crypto/sha1_test.md)
  * [crypto/sha256](crypto/sha256.md)
  * [crypto/sha256_test](crypto/sha256_test.md)
  * [crypto/sha512](crypto/sha512.md)
  * [crypto/subtle](crypto/subtle.md)
  * [crypto/tls](crypto/tls.md)
  * [crypto/tls_test](crypto/tls_test.md)
  * [crypto/x509](crypto/x509.md)
  * [crypto/x509_test](crypto/x509_test.md)
* [Constants](#const)
    * [const BLAKE2b_256](#BLAKE2b_256)
    * [const BLAKE2b_384](#BLAKE2b_384)
    * [const BLAKE2b_512](#BLAKE2b_512)
    * [const BLAKE2s_256](#BLAKE2s_256)
    * [const MD4](#MD4)
    * [const MD5](#MD5)
    * [const MD5SHA1](#MD5SHA1)
    * [const RIPEMD160](#RIPEMD160)
    * [const SHA1](#SHA1)
    * [const SHA224](#SHA224)
    * [const SHA256](#SHA256)
    * [const SHA384](#SHA384)
    * [const SHA3_224](#SHA3_224)
    * [const SHA3_256](#SHA3_256)
    * [const SHA3_384](#SHA3_384)
    * [const SHA3_512](#SHA3_512)
    * [const SHA512](#SHA512)
    * [const SHA512_224](#SHA512_224)
    * [const SHA512_256](#SHA512_256)
    * [const maxHash](#maxHash)
* [Variables](#var)
    * [var digestSizes](#digestSizes)
    * [var hashes](#hashes)
* [Types](#type)
    * [type Decrypter interface](#Decrypter)
    * [type DecrypterOpts interface{}](#DecrypterOpts)
    * [type Hash uint](#Hash)
        * [func (h Hash) Available() bool](#Hash.Available)
        * [func (h Hash) HashFunc() Hash](#Hash.HashFunc)
        * [func (h Hash) New() hash.Hash](#Hash.New)
        * [func (h Hash) Size() int](#Hash.Size)
        * [func (h Hash) String() string](#Hash.String)
    * [type PrivateKey interface{}](#PrivateKey)
    * [type PublicKey interface{}](#PublicKey)
    * [type Signer interface](#Signer)
    * [type SignerOpts interface](#SignerOpts)
* [Functions](#func)
    * [func RegisterHash(h Hash, f func() hash.Hash)](#RegisterHash)
    * [func TestCFBDecryptOutOfBoundsWrite(t *testing.T)](#TestCFBDecryptOutOfBoundsWrite)
    * [func TestCFBEncryptOutOfBoundsWrite(t *testing.T)](#TestCFBEncryptOutOfBoundsWrite)
    * [func TestCTROutOfBoundsWrite(t *testing.T)](#TestCTROutOfBoundsWrite)
    * [func TestOFBOutOfBoundsWrite(t *testing.T)](#TestOFBOutOfBoundsWrite)
    * [func TestRC4OutOfBoundsWrite(t *testing.T)](#TestRC4OutOfBoundsWrite)
    * [func test(t *testing.T, name string, cipherText []byte, xor func([]byte, []byte))](#test)
    * [func testBlock(t *testing.T, name string, newCipher func(cipher.Block, []byte) cipher.Stream)](#testBlock)


## <a id="const" href="#const">Constants</a>

### <a id="BLAKE2b_256" href="#BLAKE2b_256">const BLAKE2b_256</a>

```
searchKey: crypto.BLAKE2b_256
tags: [constant number]
```

```Go
const BLAKE2b_256 // import golang.org/x/crypto/blake2b

```

### <a id="BLAKE2b_384" href="#BLAKE2b_384">const BLAKE2b_384</a>

```
searchKey: crypto.BLAKE2b_384
tags: [constant number]
```

```Go
const BLAKE2b_384 // import golang.org/x/crypto/blake2b

```

### <a id="BLAKE2b_512" href="#BLAKE2b_512">const BLAKE2b_512</a>

```
searchKey: crypto.BLAKE2b_512
tags: [constant number]
```

```Go
const BLAKE2b_512 // import golang.org/x/crypto/blake2b

```

### <a id="BLAKE2s_256" href="#BLAKE2s_256">const BLAKE2s_256</a>

```
searchKey: crypto.BLAKE2s_256
tags: [constant number]
```

```Go
const BLAKE2s_256 // import golang.org/x/crypto/blake2s

```

### <a id="MD4" href="#MD4">const MD4</a>

```
searchKey: crypto.MD4
tags: [constant number]
```

```Go
const MD4 Hash = 1 + iota // import golang.org/x/crypto/md4

```

### <a id="MD5" href="#MD5">const MD5</a>

```
searchKey: crypto.MD5
tags: [constant number]
```

```Go
const MD5 // import crypto/md5

```

### <a id="MD5SHA1" href="#MD5SHA1">const MD5SHA1</a>

```
searchKey: crypto.MD5SHA1
tags: [constant number]
```

```Go
const MD5SHA1 // no implementation; MD5+SHA1 used for TLS RSA

```

### <a id="RIPEMD160" href="#RIPEMD160">const RIPEMD160</a>

```
searchKey: crypto.RIPEMD160
tags: [constant number]
```

```Go
const RIPEMD160 // import golang.org/x/crypto/ripemd160

```

### <a id="SHA1" href="#SHA1">const SHA1</a>

```
searchKey: crypto.SHA1
tags: [constant number]
```

```Go
const SHA1 // import crypto/sha1

```

### <a id="SHA224" href="#SHA224">const SHA224</a>

```
searchKey: crypto.SHA224
tags: [constant number]
```

```Go
const SHA224 // import crypto/sha256

```

### <a id="SHA256" href="#SHA256">const SHA256</a>

```
searchKey: crypto.SHA256
tags: [constant number]
```

```Go
const SHA256 // import crypto/sha256

```

### <a id="SHA384" href="#SHA384">const SHA384</a>

```
searchKey: crypto.SHA384
tags: [constant number]
```

```Go
const SHA384 // import crypto/sha512

```

### <a id="SHA3_224" href="#SHA3_224">const SHA3_224</a>

```
searchKey: crypto.SHA3_224
tags: [constant number]
```

```Go
const SHA3_224 // import golang.org/x/crypto/sha3

```

### <a id="SHA3_256" href="#SHA3_256">const SHA3_256</a>

```
searchKey: crypto.SHA3_256
tags: [constant number]
```

```Go
const SHA3_256 // import golang.org/x/crypto/sha3

```

### <a id="SHA3_384" href="#SHA3_384">const SHA3_384</a>

```
searchKey: crypto.SHA3_384
tags: [constant number]
```

```Go
const SHA3_384 // import golang.org/x/crypto/sha3

```

### <a id="SHA3_512" href="#SHA3_512">const SHA3_512</a>

```
searchKey: crypto.SHA3_512
tags: [constant number]
```

```Go
const SHA3_512 // import golang.org/x/crypto/sha3

```

### <a id="SHA512" href="#SHA512">const SHA512</a>

```
searchKey: crypto.SHA512
tags: [constant number]
```

```Go
const SHA512 // import crypto/sha512

```

### <a id="SHA512_224" href="#SHA512_224">const SHA512_224</a>

```
searchKey: crypto.SHA512_224
tags: [constant number]
```

```Go
const SHA512_224 // import crypto/sha512

```

### <a id="SHA512_256" href="#SHA512_256">const SHA512_256</a>

```
searchKey: crypto.SHA512_256
tags: [constant number]
```

```Go
const SHA512_256 // import crypto/sha512

```

### <a id="maxHash" href="#maxHash">const maxHash</a>

```
searchKey: crypto.maxHash
tags: [constant number private]
```

```Go
const maxHash
```

## <a id="var" href="#var">Variables</a>

### <a id="digestSizes" href="#digestSizes">var digestSizes</a>

```
searchKey: crypto.digestSizes
tags: [variable array number private]
```

```Go
var digestSizes = ...
```

### <a id="hashes" href="#hashes">var hashes</a>

```
searchKey: crypto.hashes
tags: [variable array function private]
```

```Go
var hashes = make([]func() hash.Hash, maxHash)
```

## <a id="type" href="#type">Types</a>

### <a id="Decrypter" href="#Decrypter">type Decrypter interface</a>

```
searchKey: crypto.Decrypter
tags: [interface]
```

```Go
type Decrypter interface {
	// Public returns the public key corresponding to the opaque,
	// private key.
	Public() PublicKey

	// Decrypt decrypts msg. The opts argument should be appropriate for
	// the primitive used. See the documentation in each implementation for
	// details.
	Decrypt(rand io.Reader, msg []byte, opts DecrypterOpts) (plaintext []byte, err error)
}
```

Decrypter is an interface for an opaque private key that can be used for asymmetric decryption operations. An example would be an RSA key kept in a hardware module. 

### <a id="DecrypterOpts" href="#DecrypterOpts">type DecrypterOpts interface{}</a>

```
searchKey: crypto.DecrypterOpts
tags: [interface]
```

```Go
type DecrypterOpts interface{}
```

### <a id="Hash" href="#Hash">type Hash uint</a>

```
searchKey: crypto.Hash
tags: [number]
```

```Go
type Hash uint
```

Hash identifies a cryptographic hash function that is implemented in another package. 

#### <a id="Hash.Available" href="#Hash.Available">func (h Hash) Available() bool</a>

```
searchKey: crypto.Hash.Available
tags: [method]
```

```Go
func (h Hash) Available() bool
```

Available reports whether the given hash function is linked into the binary. 

#### <a id="Hash.HashFunc" href="#Hash.HashFunc">func (h Hash) HashFunc() Hash</a>

```
searchKey: crypto.Hash.HashFunc
tags: [method]
```

```Go
func (h Hash) HashFunc() Hash
```

HashFunc simply returns the value of h so that Hash implements SignerOpts. 

#### <a id="Hash.New" href="#Hash.New">func (h Hash) New() hash.Hash</a>

```
searchKey: crypto.Hash.New
tags: [method]
```

```Go
func (h Hash) New() hash.Hash
```

New returns a new hash.Hash calculating the given hash function. New panics if the hash function is not linked into the binary. 

#### <a id="Hash.Size" href="#Hash.Size">func (h Hash) Size() int</a>

```
searchKey: crypto.Hash.Size
tags: [method]
```

```Go
func (h Hash) Size() int
```

Size returns the length, in bytes, of a digest resulting from the given hash function. It doesn't require that the hash function in question be linked into the program. 

#### <a id="Hash.String" href="#Hash.String">func (h Hash) String() string</a>

```
searchKey: crypto.Hash.String
tags: [method]
```

```Go
func (h Hash) String() string
```

### <a id="PrivateKey" href="#PrivateKey">type PrivateKey interface{}</a>

```
searchKey: crypto.PrivateKey
tags: [interface]
```

```Go
type PrivateKey interface{}
```

PrivateKey represents a private key using an unspecified algorithm. 

### <a id="PublicKey" href="#PublicKey">type PublicKey interface{}</a>

```
searchKey: crypto.PublicKey
tags: [interface]
```

```Go
type PublicKey interface{}
```

PublicKey represents a public key using an unspecified algorithm. 

### <a id="Signer" href="#Signer">type Signer interface</a>

```
searchKey: crypto.Signer
tags: [interface]
```

```Go
type Signer interface {
	// Public returns the public key corresponding to the opaque,
	// private key.
	Public() PublicKey

	// Sign signs digest with the private key, possibly using entropy from
	// rand. For an RSA key, the resulting signature should be either a
	// PKCS #1 v1.5 or PSS signature (as indicated by opts). For an (EC)DSA
	// key, it should be a DER-serialised, ASN.1 signature structure.
	//
	// Hash implements the SignerOpts interface and, in most cases, one can
	// simply pass in the hash function used as opts. Sign may also attempt
	// to type assert opts to other types in order to obtain algorithm
	// specific values. See the documentation in each package for details.
	//
	// Note that when a signature of a hash of a larger message is needed,
	// the caller is responsible for hashing the larger message and passing
	// the hash (as digest) and the hash function (as opts) to Sign.
	Sign(rand io.Reader, digest []byte, opts SignerOpts) (signature []byte, err error)
}
```

Signer is an interface for an opaque private key that can be used for signing operations. For example, an RSA key kept in a hardware module. 

### <a id="SignerOpts" href="#SignerOpts">type SignerOpts interface</a>

```
searchKey: crypto.SignerOpts
tags: [interface]
```

```Go
type SignerOpts interface {
	// HashFunc returns an identifier for the hash function used to produce
	// the message passed to Signer.Sign, or else zero to indicate that no
	// hashing was done.
	HashFunc() Hash
}
```

SignerOpts contains options for signing with a Signer. 

## <a id="func" href="#func">Functions</a>

### <a id="RegisterHash" href="#RegisterHash">func RegisterHash(h Hash, f func() hash.Hash)</a>

```
searchKey: crypto.RegisterHash
tags: [function]
```

```Go
func RegisterHash(h Hash, f func() hash.Hash)
```

RegisterHash registers a function that returns a new instance of the given hash function. This is intended to be called from the init function in packages that implement hash functions. 

### <a id="TestCFBDecryptOutOfBoundsWrite" href="#TestCFBDecryptOutOfBoundsWrite">func TestCFBDecryptOutOfBoundsWrite(t *testing.T)</a>

```
searchKey: crypto.TestCFBDecryptOutOfBoundsWrite
tags: [function private test]
```

```Go
func TestCFBDecryptOutOfBoundsWrite(t *testing.T)
```

### <a id="TestCFBEncryptOutOfBoundsWrite" href="#TestCFBEncryptOutOfBoundsWrite">func TestCFBEncryptOutOfBoundsWrite(t *testing.T)</a>

```
searchKey: crypto.TestCFBEncryptOutOfBoundsWrite
tags: [function private test]
```

```Go
func TestCFBEncryptOutOfBoundsWrite(t *testing.T)
```

### <a id="TestCTROutOfBoundsWrite" href="#TestCTROutOfBoundsWrite">func TestCTROutOfBoundsWrite(t *testing.T)</a>

```
searchKey: crypto.TestCTROutOfBoundsWrite
tags: [function private test]
```

```Go
func TestCTROutOfBoundsWrite(t *testing.T)
```

### <a id="TestOFBOutOfBoundsWrite" href="#TestOFBOutOfBoundsWrite">func TestOFBOutOfBoundsWrite(t *testing.T)</a>

```
searchKey: crypto.TestOFBOutOfBoundsWrite
tags: [function private test]
```

```Go
func TestOFBOutOfBoundsWrite(t *testing.T)
```

### <a id="TestRC4OutOfBoundsWrite" href="#TestRC4OutOfBoundsWrite">func TestRC4OutOfBoundsWrite(t *testing.T)</a>

```
searchKey: crypto.TestRC4OutOfBoundsWrite
tags: [function private test]
```

```Go
func TestRC4OutOfBoundsWrite(t *testing.T)
```

### <a id="test" href="#test">func test(t *testing.T, name string, cipherText []byte, xor func([]byte, []byte))</a>

```
searchKey: crypto.test
tags: [function private]
```

```Go
func test(t *testing.T, name string, cipherText []byte, xor func([]byte, []byte))
```

### <a id="testBlock" href="#testBlock">func testBlock(t *testing.T, name string, newCipher func(cipher.Block, []byte) cipher.Stream)</a>

```
searchKey: crypto.testBlock
tags: [function private]
```

```Go
func testBlock(t *testing.T, name string, newCipher func(cipher.Block, []byte) cipher.Stream)
```

