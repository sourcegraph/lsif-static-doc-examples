# Package aes

Package aes implements AES encryption (formerly Rijndael), as defined in U.S. Federal Information Processing Standards Publication 197. 

The AES operations in this package are not implemented using constant-time algorithms. An exception is when running on systems with enabled hardware support for AES that makes these operations constant-time. Examples include amd64 systems using AES-NI extensions and s390x systems using Message-Security-Assist extensions. On such systems, when the result of NewCipher is passed to cipher.NewGCM, the GHASH operation used by GCM is also constant-time. 

## Index

* [Constants](#const)
    * [const gcmBlockSize](#gcmBlockSize)
    * [const gcmTagSize](#gcmTagSize)
    * [const gcmMinimumTagSize](#gcmMinimumTagSize)
    * [const gcmStandardNonceSize](#gcmStandardNonceSize)
    * [const BlockSize](#BlockSize)
    * [const poly](#poly)
* [Variables](#var)
    * [var errOpen](#errOpen)
    * [var supportsAES](#supportsAES)
    * [var supportsGFMUL](#supportsGFMUL)
    * [var powx](#powx)
    * [var sbox0](#sbox0)
    * [var sbox1](#sbox1)
    * [var te0](#te0)
    * [var te1](#te1)
    * [var te2](#te2)
    * [var te3](#te3)
    * [var td0](#td0)
    * [var td1](#td1)
    * [var td2](#td2)
    * [var td3](#td3)
    * [var keyTests](#keyTests)
    * [var encryptTests](#encryptTests)
* [Types](#type)
    * [type aesCipherGCM struct](#aesCipherGCM)
        * [func (c *aesCipherGCM) NewGCM(nonceSize, tagSize int) (cipher.AEAD, error)](#aesCipherGCM.NewGCM)
    * [type gcmAsm struct](#gcmAsm)
        * [func (g *gcmAsm) NonceSize() int](#gcmAsm.NonceSize)
        * [func (g *gcmAsm) Overhead() int](#gcmAsm.Overhead)
        * [func (g *gcmAsm) Seal(dst, nonce, plaintext, data []byte) []byte](#gcmAsm.Seal)
        * [func (g *gcmAsm) Open(dst, nonce, ciphertext, data []byte) ([]byte, error)](#gcmAsm.Open)
    * [type aesCipher struct](#aesCipher)
        * [func (c *aesCipher) BlockSize() int](#aesCipher.BlockSize)
        * [func (c *aesCipher) Encrypt(dst, src []byte)](#aesCipher.Encrypt)
        * [func (c *aesCipher) Decrypt(dst, src []byte)](#aesCipher.Decrypt)
    * [type KeySizeError int](#KeySizeError)
        * [func (k KeySizeError) Error() string](#KeySizeError.Error)
    * [type aesCipherAsm struct](#aesCipherAsm)
        * [func (c *aesCipherAsm) BlockSize() int](#aesCipherAsm.BlockSize)
        * [func (c *aesCipherAsm) Encrypt(dst, src []byte)](#aesCipherAsm.Encrypt)
        * [func (c *aesCipherAsm) Decrypt(dst, src []byte)](#aesCipherAsm.Decrypt)
    * [type gcmAble interface](#gcmAble)
    * [type cbcEncAble interface](#cbcEncAble)
    * [type cbcDecAble interface](#cbcDecAble)
    * [type ctrAble interface](#ctrAble)
    * [type KeyTest struct](#KeyTest)
    * [type CryptTest struct](#CryptTest)
    * [type testInterface interface](#testInterface)
    * [type testBlock struct{}](#testBlock)
        * [func (*testBlock) BlockSize() int](#testBlock.BlockSize)
        * [func (*testBlock) Encrypt(a, b []byte)](#testBlock.Encrypt)
        * [func (*testBlock) Decrypt(a, b []byte)](#testBlock.Decrypt)
        * [func (*testBlock) NewGCM(int, int) (cipher.AEAD, error)](#testBlock.NewGCM)
        * [func (*testBlock) NewCBCEncrypter([]byte) cipher.BlockMode](#testBlock.NewCBCEncrypter)
        * [func (*testBlock) NewCBCDecrypter([]byte) cipher.BlockMode](#testBlock.NewCBCDecrypter)
        * [func (*testBlock) NewCTR([]byte) cipher.Stream](#testBlock.NewCTR)
    * [type testAEAD struct{}](#testAEAD)
        * [func (*testAEAD) NonceSize() int](#testAEAD.NonceSize)
        * [func (*testAEAD) Overhead() int](#testAEAD.Overhead)
        * [func (*testAEAD) Seal(a, b, c, d []byte) []byte](#testAEAD.Seal)
        * [func (*testAEAD) Open(a, b, c, d []byte) ([]byte, error)](#testAEAD.Open)
        * [func (*testAEAD) InAESPackage() bool](#testAEAD.InAESPackage)
    * [type testBlockMode struct{}](#testBlockMode)
        * [func (*testBlockMode) BlockSize() int](#testBlockMode.BlockSize)
        * [func (*testBlockMode) CryptBlocks(a, b []byte)](#testBlockMode.CryptBlocks)
        * [func (*testBlockMode) InAESPackage() bool](#testBlockMode.InAESPackage)
    * [type testStream struct{}](#testStream)
        * [func (*testStream) XORKeyStream(a, b []byte)](#testStream.XORKeyStream)
        * [func (*testStream) InAESPackage() bool](#testStream.InAESPackage)
* [Functions](#func)
    * [func gcmAesInit(productTable *[256]byte, ks []uint32)](#gcmAesInit)
    * [func gcmAesData(productTable *[256]byte, data []byte, T *[16]byte)](#gcmAesData)
    * [func gcmAesEnc(productTable *[256]byte, dst, src []byte, ctr, T *[16]byte, ks []uint32)](#gcmAesEnc)
    * [func gcmAesDec(productTable *[256]byte, dst, src []byte, ctr, T *[16]byte, ks []uint32)](#gcmAesDec)
    * [func gcmAesFinish(productTable *[256]byte, tagMask, T *[16]byte, pLen, dLen uint64)](#gcmAesFinish)
    * [func sliceForAppend(in []byte, n int) (head, tail []byte)](#sliceForAppend)
    * [func encryptBlockGo(xk []uint32, dst, src []byte)](#encryptBlockGo)
    * [func decryptBlockGo(xk []uint32, dst, src []byte)](#decryptBlockGo)
    * [func subw(w uint32) uint32](#subw)
    * [func rotw(w uint32) uint32](#rotw)
    * [func expandKeyGo(key []byte, enc, dec []uint32)](#expandKeyGo)
    * [func NewCipher(key []byte) (cipher.Block, error)](#NewCipher)
    * [func newCipherGeneric(key []byte) (cipher.Block, error)](#newCipherGeneric)
    * [func encryptBlockAsm(nr int, xk *uint32, dst, src *byte)](#encryptBlockAsm)
    * [func decryptBlockAsm(nr int, xk *uint32, dst, src *byte)](#decryptBlockAsm)
    * [func expandKeyAsm(nr int, key *byte, enc *uint32, dec *uint32)](#expandKeyAsm)
    * [func newCipher(key []byte) (cipher.Block, error)](#newCipher)
    * [func expandKey(key []byte, enc, dec []uint32)](#expandKey)
    * [func TestPowx(t *testing.T)](#TestPowx)
    * [func mul(b, c uint32) uint32](#mul)
    * [func TestMul(t *testing.T)](#TestMul)
    * [func TestSboxes(t *testing.T)](#TestSboxes)
    * [func TestTe(t *testing.T)](#TestTe)
    * [func TestTd(t *testing.T)](#TestTd)
    * [func TestExpandKey(t *testing.T)](#TestExpandKey)
    * [func TestCipherEncrypt(t *testing.T)](#TestCipherEncrypt)
    * [func TestCipherDecrypt(t *testing.T)](#TestCipherDecrypt)
    * [func TestShortBlocks(t *testing.T)](#TestShortBlocks)
    * [func mustPanic(t *testing.T, msg string, f func())](#mustPanic)
    * [func BenchmarkEncrypt(b *testing.B)](#BenchmarkEncrypt)
    * [func BenchmarkDecrypt(b *testing.B)](#BenchmarkDecrypt)
    * [func BenchmarkExpand(b *testing.B)](#BenchmarkExpand)
    * [func TestGCMAble(t *testing.T)](#TestGCMAble)
    * [func TestCBCEncAble(t *testing.T)](#TestCBCEncAble)
    * [func TestCBCDecAble(t *testing.T)](#TestCBCDecAble)
    * [func TestCTRAble(t *testing.T)](#TestCTRAble)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="gcmBlockSize" href="#gcmBlockSize">const gcmBlockSize</a>

```
searchKey: aes.gcmBlockSize
```

```Go
const gcmBlockSize = 16
```

### <a id="gcmTagSize" href="#gcmTagSize">const gcmTagSize</a>

```
searchKey: aes.gcmTagSize
```

```Go
const gcmTagSize = 16
```

### <a id="gcmMinimumTagSize" href="#gcmMinimumTagSize">const gcmMinimumTagSize</a>

```
searchKey: aes.gcmMinimumTagSize
```

```Go
const gcmMinimumTagSize = 12 // NIST SP 800-38D recommends tags with 12 or more bytes.

```

### <a id="gcmStandardNonceSize" href="#gcmStandardNonceSize">const gcmStandardNonceSize</a>

```
searchKey: aes.gcmStandardNonceSize
```

```Go
const gcmStandardNonceSize = 12
```

### <a id="BlockSize" href="#BlockSize">const BlockSize</a>

```
searchKey: aes.BlockSize
tags: [exported]
```

```Go
const BlockSize = 16
```

The AES block size in bytes. 

### <a id="poly" href="#poly">const poly</a>

```
searchKey: aes.poly
```

```Go
const poly = 1<<8 | 1<<4 | 1<<3 | 1<<1 | 1<<0 // x⁸ + x⁴ + x³ + x + 1

```

AES is based on the mathematical behavior of binary polynomials (polynomials over GF(2)) modulo the irreducible polynomial x⁸ + x⁴ + x³ + x + 1. Addition of these binary polynomials corresponds to binary xor. Reducing mod poly corresponds to binary xor with poly every time a 0x100 bit appears. 

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="errOpen" href="#errOpen">var errOpen</a>

```
searchKey: aes.errOpen
```

```Go
var errOpen = errors.New("cipher: message authentication failed")
```

### <a id="supportsAES" href="#supportsAES">var supportsAES</a>

```
searchKey: aes.supportsAES
```

```Go
var supportsAES = cpu.X86.HasAES || cpu.ARM64.HasAES
```

### <a id="supportsGFMUL" href="#supportsGFMUL">var supportsGFMUL</a>

```
searchKey: aes.supportsGFMUL
```

```Go
var supportsGFMUL = cpu.X86.HasPCLMULQDQ || cpu.ARM64.HasPMULL
```

### <a id="powx" href="#powx">var powx</a>

```
searchKey: aes.powx
```

```Go
var powx = ...
```

Powers of x mod poly in GF(2). 

### <a id="sbox0" href="#sbox0">var sbox0</a>

```
searchKey: aes.sbox0
```

```Go
var sbox0 = ...
```

FIPS-197 Figure 7. S-box substitution values in hexadecimal format. 

### <a id="sbox1" href="#sbox1">var sbox1</a>

```
searchKey: aes.sbox1
```

```Go
var sbox1 = ...
```

FIPS-197 Figure 14.  Inverse S-box substitution values in hexadecimal format. 

### <a id="te0" href="#te0">var te0</a>

```
searchKey: aes.te0
```

```Go
var te0 = ...
```

### <a id="te1" href="#te1">var te1</a>

```
searchKey: aes.te1
```

```Go
var te1 = ...
```

### <a id="te2" href="#te2">var te2</a>

```
searchKey: aes.te2
```

```Go
var te2 = ...
```

### <a id="te3" href="#te3">var te3</a>

```
searchKey: aes.te3
```

```Go
var te3 = ...
```

### <a id="td0" href="#td0">var td0</a>

```
searchKey: aes.td0
```

```Go
var td0 = ...
```

### <a id="td1" href="#td1">var td1</a>

```
searchKey: aes.td1
```

```Go
var td1 = ...
```

### <a id="td2" href="#td2">var td2</a>

```
searchKey: aes.td2
```

```Go
var td2 = ...
```

### <a id="td3" href="#td3">var td3</a>

```
searchKey: aes.td3
```

```Go
var td3 = ...
```

### <a id="keyTests" href="#keyTests">var keyTests</a>

```
searchKey: aes.keyTests
```

```Go
var keyTests = ...
```

### <a id="encryptTests" href="#encryptTests">var encryptTests</a>

```
searchKey: aes.encryptTests
```

```Go
var encryptTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="aesCipherGCM" href="#aesCipherGCM">type aesCipherGCM struct</a>

```
searchKey: aes.aesCipherGCM
```

```Go
type aesCipherGCM struct {
	aesCipherAsm
}
```

aesCipherGCM implements crypto/cipher.gcmAble so that crypto/cipher.NewGCM will use the optimised implementation in this file when possible. Instances of this type only exist when hasGCMAsm returns true. 

#### <a id="aesCipherGCM.NewGCM" href="#aesCipherGCM.NewGCM">func (c *aesCipherGCM) NewGCM(nonceSize, tagSize int) (cipher.AEAD, error)</a>

```
searchKey: aes.aesCipherGCM.NewGCM
```

```Go
func (c *aesCipherGCM) NewGCM(nonceSize, tagSize int) (cipher.AEAD, error)
```

NewGCM returns the AES cipher wrapped in Galois Counter Mode. This is only called by crypto/cipher.NewGCM via the gcmAble interface. 

### <a id="gcmAsm" href="#gcmAsm">type gcmAsm struct</a>

```
searchKey: aes.gcmAsm
```

```Go
type gcmAsm struct {
	// ks is the key schedule, the length of which depends on the size of
	// the AES key.
	ks []uint32
	// productTable contains pre-computed multiples of the binary-field
	// element used in GHASH.
	productTable [256]byte
	// nonceSize contains the expected size of the nonce, in bytes.
	nonceSize int
	// tagSize contains the size of the tag, in bytes.
	tagSize int
}
```

#### <a id="gcmAsm.NonceSize" href="#gcmAsm.NonceSize">func (g *gcmAsm) NonceSize() int</a>

```
searchKey: aes.gcmAsm.NonceSize
```

```Go
func (g *gcmAsm) NonceSize() int
```

#### <a id="gcmAsm.Overhead" href="#gcmAsm.Overhead">func (g *gcmAsm) Overhead() int</a>

```
searchKey: aes.gcmAsm.Overhead
```

```Go
func (g *gcmAsm) Overhead() int
```

#### <a id="gcmAsm.Seal" href="#gcmAsm.Seal">func (g *gcmAsm) Seal(dst, nonce, plaintext, data []byte) []byte</a>

```
searchKey: aes.gcmAsm.Seal
```

```Go
func (g *gcmAsm) Seal(dst, nonce, plaintext, data []byte) []byte
```

Seal encrypts and authenticates plaintext. See the cipher.AEAD interface for details. 

#### <a id="gcmAsm.Open" href="#gcmAsm.Open">func (g *gcmAsm) Open(dst, nonce, ciphertext, data []byte) ([]byte, error)</a>

```
searchKey: aes.gcmAsm.Open
```

```Go
func (g *gcmAsm) Open(dst, nonce, ciphertext, data []byte) ([]byte, error)
```

Open authenticates and decrypts ciphertext. See the cipher.AEAD interface for details. 

### <a id="aesCipher" href="#aesCipher">type aesCipher struct</a>

```
searchKey: aes.aesCipher
```

```Go
type aesCipher struct {
	enc []uint32
	dec []uint32
}
```

A cipher is an instance of AES encryption using a particular key. 

#### <a id="aesCipher.BlockSize" href="#aesCipher.BlockSize">func (c *aesCipher) BlockSize() int</a>

```
searchKey: aes.aesCipher.BlockSize
```

```Go
func (c *aesCipher) BlockSize() int
```

#### <a id="aesCipher.Encrypt" href="#aesCipher.Encrypt">func (c *aesCipher) Encrypt(dst, src []byte)</a>

```
searchKey: aes.aesCipher.Encrypt
```

```Go
func (c *aesCipher) Encrypt(dst, src []byte)
```

#### <a id="aesCipher.Decrypt" href="#aesCipher.Decrypt">func (c *aesCipher) Decrypt(dst, src []byte)</a>

```
searchKey: aes.aesCipher.Decrypt
```

```Go
func (c *aesCipher) Decrypt(dst, src []byte)
```

### <a id="KeySizeError" href="#KeySizeError">type KeySizeError int</a>

```
searchKey: aes.KeySizeError
tags: [exported]
```

```Go
type KeySizeError int
```

#### <a id="KeySizeError.Error" href="#KeySizeError.Error">func (k KeySizeError) Error() string</a>

```
searchKey: aes.KeySizeError.Error
tags: [exported]
```

```Go
func (k KeySizeError) Error() string
```

### <a id="aesCipherAsm" href="#aesCipherAsm">type aesCipherAsm struct</a>

```
searchKey: aes.aesCipherAsm
```

```Go
type aesCipherAsm struct {
	aesCipher
}
```

#### <a id="aesCipherAsm.BlockSize" href="#aesCipherAsm.BlockSize">func (c *aesCipherAsm) BlockSize() int</a>

```
searchKey: aes.aesCipherAsm.BlockSize
```

```Go
func (c *aesCipherAsm) BlockSize() int
```

#### <a id="aesCipherAsm.Encrypt" href="#aesCipherAsm.Encrypt">func (c *aesCipherAsm) Encrypt(dst, src []byte)</a>

```
searchKey: aes.aesCipherAsm.Encrypt
```

```Go
func (c *aesCipherAsm) Encrypt(dst, src []byte)
```

#### <a id="aesCipherAsm.Decrypt" href="#aesCipherAsm.Decrypt">func (c *aesCipherAsm) Decrypt(dst, src []byte)</a>

```
searchKey: aes.aesCipherAsm.Decrypt
```

```Go
func (c *aesCipherAsm) Decrypt(dst, src []byte)
```

### <a id="gcmAble" href="#gcmAble">type gcmAble interface</a>

```
searchKey: aes.gcmAble
```

```Go
type gcmAble interface {
	NewGCM(nonceSize, tagSize int) (cipher.AEAD, error)
}
```

gcmAble is implemented by cipher.Blocks that can provide an optimized implementation of GCM through the AEAD interface. See crypto/cipher/gcm.go. 

### <a id="cbcEncAble" href="#cbcEncAble">type cbcEncAble interface</a>

```
searchKey: aes.cbcEncAble
```

```Go
type cbcEncAble interface {
	NewCBCEncrypter(iv []byte) cipher.BlockMode
}
```

cbcEncAble is implemented by cipher.Blocks that can provide an optimized implementation of CBC encryption through the cipher.BlockMode interface. See crypto/cipher/cbc.go. 

### <a id="cbcDecAble" href="#cbcDecAble">type cbcDecAble interface</a>

```
searchKey: aes.cbcDecAble
```

```Go
type cbcDecAble interface {
	NewCBCDecrypter(iv []byte) cipher.BlockMode
}
```

cbcDecAble is implemented by cipher.Blocks that can provide an optimized implementation of CBC decryption through the cipher.BlockMode interface. See crypto/cipher/cbc.go. 

### <a id="ctrAble" href="#ctrAble">type ctrAble interface</a>

```
searchKey: aes.ctrAble
```

```Go
type ctrAble interface {
	NewCTR(iv []byte) cipher.Stream
}
```

ctrAble is implemented by cipher.Blocks that can provide an optimized implementation of CTR through the cipher.Stream interface. See crypto/cipher/ctr.go. 

### <a id="KeyTest" href="#KeyTest">type KeyTest struct</a>

```
searchKey: aes.KeyTest
```

```Go
type KeyTest struct {
	key []byte
	enc []uint32
	dec []uint32 // decryption expansion; not in FIPS 197, computed from C implementation.
}
```

Appendix A of FIPS 197: Key expansion examples 

### <a id="CryptTest" href="#CryptTest">type CryptTest struct</a>

```
searchKey: aes.CryptTest
```

```Go
type CryptTest struct {
	key []byte
	in  []byte
	out []byte
}
```

Appendix B, C of FIPS 197: Cipher examples, Example vectors. 

### <a id="testInterface" href="#testInterface">type testInterface interface</a>

```
searchKey: aes.testInterface
```

```Go
type testInterface interface {
	InAESPackage() bool
}
```

testInterface can be asserted to check that a type originates from this test group. 

### <a id="testBlock" href="#testBlock">type testBlock struct{}</a>

```
searchKey: aes.testBlock
```

```Go
type testBlock struct{}
```

testBlock implements the cipher.Block interface and any *Able interfaces that need to be tested. 

#### <a id="testBlock.BlockSize" href="#testBlock.BlockSize">func (*testBlock) BlockSize() int</a>

```
searchKey: aes.testBlock.BlockSize
```

```Go
func (*testBlock) BlockSize() int
```

#### <a id="testBlock.Encrypt" href="#testBlock.Encrypt">func (*testBlock) Encrypt(a, b []byte)</a>

```
searchKey: aes.testBlock.Encrypt
```

```Go
func (*testBlock) Encrypt(a, b []byte)
```

#### <a id="testBlock.Decrypt" href="#testBlock.Decrypt">func (*testBlock) Decrypt(a, b []byte)</a>

```
searchKey: aes.testBlock.Decrypt
```

```Go
func (*testBlock) Decrypt(a, b []byte)
```

#### <a id="testBlock.NewGCM" href="#testBlock.NewGCM">func (*testBlock) NewGCM(int, int) (cipher.AEAD, error)</a>

```
searchKey: aes.testBlock.NewGCM
```

```Go
func (*testBlock) NewGCM(int, int) (cipher.AEAD, error)
```

#### <a id="testBlock.NewCBCEncrypter" href="#testBlock.NewCBCEncrypter">func (*testBlock) NewCBCEncrypter([]byte) cipher.BlockMode</a>

```
searchKey: aes.testBlock.NewCBCEncrypter
```

```Go
func (*testBlock) NewCBCEncrypter([]byte) cipher.BlockMode
```

#### <a id="testBlock.NewCBCDecrypter" href="#testBlock.NewCBCDecrypter">func (*testBlock) NewCBCDecrypter([]byte) cipher.BlockMode</a>

```
searchKey: aes.testBlock.NewCBCDecrypter
```

```Go
func (*testBlock) NewCBCDecrypter([]byte) cipher.BlockMode
```

#### <a id="testBlock.NewCTR" href="#testBlock.NewCTR">func (*testBlock) NewCTR([]byte) cipher.Stream</a>

```
searchKey: aes.testBlock.NewCTR
```

```Go
func (*testBlock) NewCTR([]byte) cipher.Stream
```

### <a id="testAEAD" href="#testAEAD">type testAEAD struct{}</a>

```
searchKey: aes.testAEAD
```

```Go
type testAEAD struct{}
```

testAEAD implements the cipher.AEAD interface. 

#### <a id="testAEAD.NonceSize" href="#testAEAD.NonceSize">func (*testAEAD) NonceSize() int</a>

```
searchKey: aes.testAEAD.NonceSize
```

```Go
func (*testAEAD) NonceSize() int
```

#### <a id="testAEAD.Overhead" href="#testAEAD.Overhead">func (*testAEAD) Overhead() int</a>

```
searchKey: aes.testAEAD.Overhead
```

```Go
func (*testAEAD) Overhead() int
```

#### <a id="testAEAD.Seal" href="#testAEAD.Seal">func (*testAEAD) Seal(a, b, c, d []byte) []byte</a>

```
searchKey: aes.testAEAD.Seal
```

```Go
func (*testAEAD) Seal(a, b, c, d []byte) []byte
```

#### <a id="testAEAD.Open" href="#testAEAD.Open">func (*testAEAD) Open(a, b, c, d []byte) ([]byte, error)</a>

```
searchKey: aes.testAEAD.Open
```

```Go
func (*testAEAD) Open(a, b, c, d []byte) ([]byte, error)
```

#### <a id="testAEAD.InAESPackage" href="#testAEAD.InAESPackage">func (*testAEAD) InAESPackage() bool</a>

```
searchKey: aes.testAEAD.InAESPackage
```

```Go
func (*testAEAD) InAESPackage() bool
```

### <a id="testBlockMode" href="#testBlockMode">type testBlockMode struct{}</a>

```
searchKey: aes.testBlockMode
```

```Go
type testBlockMode struct{}
```

testBlockMode implements the cipher.BlockMode interface. 

#### <a id="testBlockMode.BlockSize" href="#testBlockMode.BlockSize">func (*testBlockMode) BlockSize() int</a>

```
searchKey: aes.testBlockMode.BlockSize
```

```Go
func (*testBlockMode) BlockSize() int
```

#### <a id="testBlockMode.CryptBlocks" href="#testBlockMode.CryptBlocks">func (*testBlockMode) CryptBlocks(a, b []byte)</a>

```
searchKey: aes.testBlockMode.CryptBlocks
```

```Go
func (*testBlockMode) CryptBlocks(a, b []byte)
```

#### <a id="testBlockMode.InAESPackage" href="#testBlockMode.InAESPackage">func (*testBlockMode) InAESPackage() bool</a>

```
searchKey: aes.testBlockMode.InAESPackage
```

```Go
func (*testBlockMode) InAESPackage() bool
```

### <a id="testStream" href="#testStream">type testStream struct{}</a>

```
searchKey: aes.testStream
```

```Go
type testStream struct{}
```

testStream implements the cipher.Stream interface. 

#### <a id="testStream.XORKeyStream" href="#testStream.XORKeyStream">func (*testStream) XORKeyStream(a, b []byte)</a>

```
searchKey: aes.testStream.XORKeyStream
```

```Go
func (*testStream) XORKeyStream(a, b []byte)
```

#### <a id="testStream.InAESPackage" href="#testStream.InAESPackage">func (*testStream) InAESPackage() bool</a>

```
searchKey: aes.testStream.InAESPackage
```

```Go
func (*testStream) InAESPackage() bool
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="gcmAesInit" href="#gcmAesInit">func gcmAesInit(productTable *[256]byte, ks []uint32)</a>

```
searchKey: aes.gcmAesInit
```

```Go
func gcmAesInit(productTable *[256]byte, ks []uint32)
```

### <a id="gcmAesData" href="#gcmAesData">func gcmAesData(productTable *[256]byte, data []byte, T *[16]byte)</a>

```
searchKey: aes.gcmAesData
```

```Go
func gcmAesData(productTable *[256]byte, data []byte, T *[16]byte)
```

### <a id="gcmAesEnc" href="#gcmAesEnc">func gcmAesEnc(productTable *[256]byte, dst, src []byte, ctr, T *[16]byte, ks []uint32)</a>

```
searchKey: aes.gcmAesEnc
```

```Go
func gcmAesEnc(productTable *[256]byte, dst, src []byte, ctr, T *[16]byte, ks []uint32)
```

### <a id="gcmAesDec" href="#gcmAesDec">func gcmAesDec(productTable *[256]byte, dst, src []byte, ctr, T *[16]byte, ks []uint32)</a>

```
searchKey: aes.gcmAesDec
```

```Go
func gcmAesDec(productTable *[256]byte, dst, src []byte, ctr, T *[16]byte, ks []uint32)
```

### <a id="gcmAesFinish" href="#gcmAesFinish">func gcmAesFinish(productTable *[256]byte, tagMask, T *[16]byte, pLen, dLen uint64)</a>

```
searchKey: aes.gcmAesFinish
```

```Go
func gcmAesFinish(productTable *[256]byte, tagMask, T *[16]byte, pLen, dLen uint64)
```

### <a id="sliceForAppend" href="#sliceForAppend">func sliceForAppend(in []byte, n int) (head, tail []byte)</a>

```
searchKey: aes.sliceForAppend
```

```Go
func sliceForAppend(in []byte, n int) (head, tail []byte)
```

sliceForAppend takes a slice and a requested number of bytes. It returns a slice with the contents of the given slice followed by that many bytes and a second slice that aliases into it and contains only the extra bytes. If the original slice has sufficient capacity then no allocation is performed. 

### <a id="encryptBlockGo" href="#encryptBlockGo">func encryptBlockGo(xk []uint32, dst, src []byte)</a>

```
searchKey: aes.encryptBlockGo
```

```Go
func encryptBlockGo(xk []uint32, dst, src []byte)
```

Encrypt one block from src into dst, using the expanded key xk. 

### <a id="decryptBlockGo" href="#decryptBlockGo">func decryptBlockGo(xk []uint32, dst, src []byte)</a>

```
searchKey: aes.decryptBlockGo
```

```Go
func decryptBlockGo(xk []uint32, dst, src []byte)
```

Decrypt one block from src into dst, using the expanded key xk. 

### <a id="subw" href="#subw">func subw(w uint32) uint32</a>

```
searchKey: aes.subw
```

```Go
func subw(w uint32) uint32
```

Apply sbox0 to each byte in w. 

### <a id="rotw" href="#rotw">func rotw(w uint32) uint32</a>

```
searchKey: aes.rotw
```

```Go
func rotw(w uint32) uint32
```

Rotate 

### <a id="expandKeyGo" href="#expandKeyGo">func expandKeyGo(key []byte, enc, dec []uint32)</a>

```
searchKey: aes.expandKeyGo
```

```Go
func expandKeyGo(key []byte, enc, dec []uint32)
```

Key expansion algorithm. See FIPS-197, Figure 11. Their rcon[i] is our powx[i-1] << 24. 

### <a id="NewCipher" href="#NewCipher">func NewCipher(key []byte) (cipher.Block, error)</a>

```
searchKey: aes.NewCipher
tags: [exported]
```

```Go
func NewCipher(key []byte) (cipher.Block, error)
```

NewCipher creates and returns a new cipher.Block. The key argument should be the AES key, either 16, 24, or 32 bytes to select AES-128, AES-192, or AES-256. 

### <a id="newCipherGeneric" href="#newCipherGeneric">func newCipherGeneric(key []byte) (cipher.Block, error)</a>

```
searchKey: aes.newCipherGeneric
```

```Go
func newCipherGeneric(key []byte) (cipher.Block, error)
```

newCipherGeneric creates and returns a new cipher.Block implemented in pure Go. 

### <a id="encryptBlockAsm" href="#encryptBlockAsm">func encryptBlockAsm(nr int, xk *uint32, dst, src *byte)</a>

```
searchKey: aes.encryptBlockAsm
```

```Go
func encryptBlockAsm(nr int, xk *uint32, dst, src *byte)
```

### <a id="decryptBlockAsm" href="#decryptBlockAsm">func decryptBlockAsm(nr int, xk *uint32, dst, src *byte)</a>

```
searchKey: aes.decryptBlockAsm
```

```Go
func decryptBlockAsm(nr int, xk *uint32, dst, src *byte)
```

### <a id="expandKeyAsm" href="#expandKeyAsm">func expandKeyAsm(nr int, key *byte, enc *uint32, dec *uint32)</a>

```
searchKey: aes.expandKeyAsm
```

```Go
func expandKeyAsm(nr int, key *byte, enc *uint32, dec *uint32)
```

### <a id="newCipher" href="#newCipher">func newCipher(key []byte) (cipher.Block, error)</a>

```
searchKey: aes.newCipher
```

```Go
func newCipher(key []byte) (cipher.Block, error)
```

### <a id="expandKey" href="#expandKey">func expandKey(key []byte, enc, dec []uint32)</a>

```
searchKey: aes.expandKey
```

```Go
func expandKey(key []byte, enc, dec []uint32)
```

expandKey is used by BenchmarkExpand to ensure that the asm implementation of key expansion is used for the benchmark when it is available. 

### <a id="TestPowx" href="#TestPowx">func TestPowx(t *testing.T)</a>

```
searchKey: aes.TestPowx
```

```Go
func TestPowx(t *testing.T)
```

Test that powx is initialized correctly. (Can adapt this code to generate it too.) 

### <a id="mul" href="#mul">func mul(b, c uint32) uint32</a>

```
searchKey: aes.mul
```

```Go
func mul(b, c uint32) uint32
```

Multiply b and c as GF(2) polynomials modulo poly 

### <a id="TestMul" href="#TestMul">func TestMul(t *testing.T)</a>

```
searchKey: aes.TestMul
```

```Go
func TestMul(t *testing.T)
```

Test all mul inputs against bit-by-bit n² algorithm. 

### <a id="TestSboxes" href="#TestSboxes">func TestSboxes(t *testing.T)</a>

```
searchKey: aes.TestSboxes
```

```Go
func TestSboxes(t *testing.T)
```

Check that S-boxes are inverses of each other. They have more structure that we could test, but if this sanity check passes, we'll assume the cut and paste from the FIPS PDF worked. 

### <a id="TestTe" href="#TestTe">func TestTe(t *testing.T)</a>

```
searchKey: aes.TestTe
```

```Go
func TestTe(t *testing.T)
```

Test that encryption tables are correct. (Can adapt this code to generate them too.) 

### <a id="TestTd" href="#TestTd">func TestTd(t *testing.T)</a>

```
searchKey: aes.TestTd
```

```Go
func TestTd(t *testing.T)
```

Test that decryption tables are correct. (Can adapt this code to generate them too.) 

### <a id="TestExpandKey" href="#TestExpandKey">func TestExpandKey(t *testing.T)</a>

```
searchKey: aes.TestExpandKey
```

```Go
func TestExpandKey(t *testing.T)
```

Test key expansion against FIPS 197 examples. 

### <a id="TestCipherEncrypt" href="#TestCipherEncrypt">func TestCipherEncrypt(t *testing.T)</a>

```
searchKey: aes.TestCipherEncrypt
```

```Go
func TestCipherEncrypt(t *testing.T)
```

Test Cipher Encrypt method against FIPS 197 examples. 

### <a id="TestCipherDecrypt" href="#TestCipherDecrypt">func TestCipherDecrypt(t *testing.T)</a>

```
searchKey: aes.TestCipherDecrypt
```

```Go
func TestCipherDecrypt(t *testing.T)
```

Test Cipher Decrypt against FIPS 197 examples. 

### <a id="TestShortBlocks" href="#TestShortBlocks">func TestShortBlocks(t *testing.T)</a>

```
searchKey: aes.TestShortBlocks
```

```Go
func TestShortBlocks(t *testing.T)
```

Test short input/output. Assembly used to not notice. See issue 7928. 

### <a id="mustPanic" href="#mustPanic">func mustPanic(t *testing.T, msg string, f func())</a>

```
searchKey: aes.mustPanic
```

```Go
func mustPanic(t *testing.T, msg string, f func())
```

### <a id="BenchmarkEncrypt" href="#BenchmarkEncrypt">func BenchmarkEncrypt(b *testing.B)</a>

```
searchKey: aes.BenchmarkEncrypt
```

```Go
func BenchmarkEncrypt(b *testing.B)
```

### <a id="BenchmarkDecrypt" href="#BenchmarkDecrypt">func BenchmarkDecrypt(b *testing.B)</a>

```
searchKey: aes.BenchmarkDecrypt
```

```Go
func BenchmarkDecrypt(b *testing.B)
```

### <a id="BenchmarkExpand" href="#BenchmarkExpand">func BenchmarkExpand(b *testing.B)</a>

```
searchKey: aes.BenchmarkExpand
```

```Go
func BenchmarkExpand(b *testing.B)
```

### <a id="TestGCMAble" href="#TestGCMAble">func TestGCMAble(t *testing.T)</a>

```
searchKey: aes.TestGCMAble
```

```Go
func TestGCMAble(t *testing.T)
```

Test the gcmAble interface is detected correctly by the cipher package. 

### <a id="TestCBCEncAble" href="#TestCBCEncAble">func TestCBCEncAble(t *testing.T)</a>

```
searchKey: aes.TestCBCEncAble
```

```Go
func TestCBCEncAble(t *testing.T)
```

Test the cbcEncAble interface is detected correctly by the cipher package. 

### <a id="TestCBCDecAble" href="#TestCBCDecAble">func TestCBCDecAble(t *testing.T)</a>

```
searchKey: aes.TestCBCDecAble
```

```Go
func TestCBCDecAble(t *testing.T)
```

Test the cbcDecAble interface is detected correctly by the cipher package. 

### <a id="TestCTRAble" href="#TestCTRAble">func TestCTRAble(t *testing.T)</a>

```
searchKey: aes.TestCTRAble
```

```Go
func TestCTRAble(t *testing.T)
```

Test the ctrAble interface is detected correctly by the cipher package. 

