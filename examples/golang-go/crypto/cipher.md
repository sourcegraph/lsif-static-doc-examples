# Package cipher

Package cipher implements standard block cipher modes that can be wrapped around low-level block cipher implementations. See [https://csrc.nist.gov/groups/ST/toolkit/BCM/current_modes.html](https://csrc.nist.gov/groups/ST/toolkit/BCM/current_modes.html) and NIST Special Publication 800-38A. 

## Index

* [Constants](#const)
    * [const gcmBlockSize](#gcmBlockSize)
    * [const gcmMinimumTagSize](#gcmMinimumTagSize)
    * [const gcmStandardNonceSize](#gcmStandardNonceSize)
    * [const gcmTagSize](#gcmTagSize)
    * [const streamBufferSize](#streamBufferSize)
* [Variables](#var)
    * [var XorBytes](#XorBytes)
    * [var errOpen](#errOpen)
    * [var gcmReductionTable](#gcmReductionTable)
* [Types](#type)
    * [type AEAD interface](#AEAD)
        * [func NewGCM(cipher Block) (AEAD, error)](#NewGCM)
        * [func NewGCMWithNonceSize(cipher Block, size int) (AEAD, error)](#NewGCMWithNonceSize)
        * [func NewGCMWithTagSize(cipher Block, tagSize int) (AEAD, error)](#NewGCMWithTagSize)
        * [func newGCMWithNonceAndTagSize(cipher Block, nonceSize, tagSize int) (AEAD, error)](#newGCMWithNonceAndTagSize)
    * [type Block interface](#Block)
    * [type BlockMode interface](#BlockMode)
        * [func NewCBCDecrypter(b Block, iv []byte) BlockMode](#NewCBCDecrypter)
        * [func NewCBCEncrypter(b Block, iv []byte) BlockMode](#NewCBCEncrypter)
    * [type Stream interface](#Stream)
        * [func NewCFBDecrypter(block Block, iv []byte) Stream](#NewCFBDecrypter)
        * [func NewCFBEncrypter(block Block, iv []byte) Stream](#NewCFBEncrypter)
        * [func NewCTR(block Block, iv []byte) Stream](#NewCTR)
        * [func NewOFB(b Block, iv []byte) Stream](#NewOFB)
        * [func newCFB(block Block, iv []byte, decrypt bool) Stream](#newCFB)
    * [type StreamReader struct](#StreamReader)
        * [func (r StreamReader) Read(dst []byte) (n int, err error)](#StreamReader.Read)
    * [type StreamWriter struct](#StreamWriter)
        * [func (w StreamWriter) Close() error](#StreamWriter.Close)
        * [func (w StreamWriter) Write(src []byte) (n int, err error)](#StreamWriter.Write)
    * [type cbc struct](#cbc)
        * [func newCBC(b Block, iv []byte) *cbc](#newCBC)
    * [type cbcDecAble interface](#cbcDecAble)
    * [type cbcDecrypter cipher.cbc](#cbcDecrypter)
        * [func (x *cbcDecrypter) BlockSize() int](#cbcDecrypter.BlockSize)
        * [func (x *cbcDecrypter) CryptBlocks(dst, src []byte)](#cbcDecrypter.CryptBlocks)
        * [func (x *cbcDecrypter) SetIV(iv []byte)](#cbcDecrypter.SetIV)
    * [type cbcEncAble interface](#cbcEncAble)
    * [type cbcEncrypter cipher.cbc](#cbcEncrypter)
        * [func (x *cbcEncrypter) BlockSize() int](#cbcEncrypter.BlockSize)
        * [func (x *cbcEncrypter) CryptBlocks(dst, src []byte)](#cbcEncrypter.CryptBlocks)
        * [func (x *cbcEncrypter) SetIV(iv []byte)](#cbcEncrypter.SetIV)
    * [type cfb struct](#cfb)
        * [func (x *cfb) XORKeyStream(dst, src []byte)](#cfb.XORKeyStream)
    * [type ctr struct](#ctr)
        * [func (x *ctr) XORKeyStream(dst, src []byte)](#ctr.XORKeyStream)
        * [func (x *ctr) refill()](#ctr.refill)
    * [type ctrAble interface](#ctrAble)
    * [type gcm struct](#gcm)
        * [func (g *gcm) NonceSize() int](#gcm.NonceSize)
        * [func (g *gcm) Open(dst, nonce, ciphertext, data []byte) ([]byte, error)](#gcm.Open)
        * [func (g *gcm) Overhead() int](#gcm.Overhead)
        * [func (g *gcm) Seal(dst, nonce, plaintext, data []byte) []byte](#gcm.Seal)
        * [func (g *gcm) auth(out, ciphertext, additionalData []byte, tagMask *[gcmTagSize]byte)](#gcm.auth)
        * [func (g *gcm) counterCrypt(out, in []byte, counter *[gcmBlockSize]byte)](#gcm.counterCrypt)
        * [func (g *gcm) deriveCounter(counter *[gcmBlockSize]byte, nonce []byte)](#gcm.deriveCounter)
        * [func (g *gcm) mul(y *gcmFieldElement)](#gcm.mul)
        * [func (g *gcm) update(y *gcmFieldElement, data []byte)](#gcm.update)
        * [func (g *gcm) updateBlocks(y *gcmFieldElement, blocks []byte)](#gcm.updateBlocks)
    * [type gcmAble interface](#gcmAble)
    * [type gcmFieldElement struct](#gcmFieldElement)
        * [func gcmAdd(x, y *gcmFieldElement) gcmFieldElement](#gcmAdd)
        * [func gcmDouble(x *gcmFieldElement) (double gcmFieldElement)](#gcmDouble)
    * [type ofb struct](#ofb)
        * [func (x *ofb) XORKeyStream(dst, src []byte)](#ofb.XORKeyStream)
        * [func (x *ofb) refill()](#ofb.refill)
* [Functions](#func)
    * [func dup(p []byte) []byte](#dup)
    * [func gcmInc32(counterBlock *[16]byte)](#gcmInc32)
    * [func reverseBits(i int) int](#reverseBits)
    * [func sliceForAppend(in []byte, n int) (head, tail []byte)](#sliceForAppend)
    * [func xorBytes(dst, a, b []byte) int](#xorBytes)
    * [func xorBytesSSE2(dst, a, b *byte, n int)](#xorBytesSSE2)
    * [func xorWords(dst, a, b []byte)](#xorWords)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="gcmBlockSize" href="#gcmBlockSize">const gcmBlockSize</a>

```
searchKey: cipher.gcmBlockSize
tags: [constant number private]
```

```Go
const gcmBlockSize = 16
```

### <a id="gcmMinimumTagSize" href="#gcmMinimumTagSize">const gcmMinimumTagSize</a>

```
searchKey: cipher.gcmMinimumTagSize
tags: [constant number private]
```

```Go
const gcmMinimumTagSize = 12 // NIST SP 800-38D recommends tags with 12 or more bytes.

```

### <a id="gcmStandardNonceSize" href="#gcmStandardNonceSize">const gcmStandardNonceSize</a>

```
searchKey: cipher.gcmStandardNonceSize
tags: [constant number private]
```

```Go
const gcmStandardNonceSize = 12
```

### <a id="gcmTagSize" href="#gcmTagSize">const gcmTagSize</a>

```
searchKey: cipher.gcmTagSize
tags: [constant number private]
```

```Go
const gcmTagSize = 16
```

### <a id="streamBufferSize" href="#streamBufferSize">const streamBufferSize</a>

```
searchKey: cipher.streamBufferSize
tags: [constant number private]
```

```Go
const streamBufferSize = 512
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="XorBytes" href="#XorBytes">var XorBytes</a>

```
searchKey: cipher.XorBytes
tags: [variable function private]
```

```Go
var XorBytes = xorBytes
```

Export internal functions for testing. 

### <a id="errOpen" href="#errOpen">var errOpen</a>

```
searchKey: cipher.errOpen
tags: [variable interface private]
```

```Go
var errOpen = errors.New("cipher: message authentication failed")
```

### <a id="gcmReductionTable" href="#gcmReductionTable">var gcmReductionTable</a>

```
searchKey: cipher.gcmReductionTable
tags: [variable array number private]
```

```Go
var gcmReductionTable = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="AEAD" href="#AEAD">type AEAD interface</a>

```
searchKey: cipher.AEAD
tags: [interface]
```

```Go
type AEAD interface {
	// NonceSize returns the size of the nonce that must be passed to Seal
	// and Open.
	NonceSize() int

	// Overhead returns the maximum difference between the lengths of a
	// plaintext and its ciphertext.
	Overhead() int

	// Seal encrypts and authenticates plaintext, authenticates the
	// additional data and appends the result to dst, returning the updated
	// slice. The nonce must be NonceSize() bytes long and unique for all
	// time, for a given key.
	//
	// To reuse plaintext's storage for the encrypted output, use plaintext[:0]
	// as dst. Otherwise, the remaining capacity of dst must not overlap plaintext.
	Seal(dst, nonce, plaintext, additionalData []byte) []byte

	// Open decrypts and authenticates ciphertext, authenticates the
	// additional data and, if successful, appends the resulting plaintext
	// to dst, returning the updated slice. The nonce must be NonceSize()
	// bytes long and both it and the additional data must match the
	// value passed to Seal.
	//
	// To reuse ciphertext's storage for the decrypted output, use ciphertext[:0]
	// as dst. Otherwise, the remaining capacity of dst must not overlap plaintext.
	//
	// Even if the function fails, the contents of dst, up to its capacity,
	// may be overwritten.
	Open(dst, nonce, ciphertext, additionalData []byte) ([]byte, error)
}
```

AEAD is a cipher mode providing authenticated encryption with associated data. For a description of the methodology, see 

```
[https://en.wikipedia.org/wiki/Authenticated_encryption](https://en.wikipedia.org/wiki/Authenticated_encryption)

```
#### <a id="NewGCM" href="#NewGCM">func NewGCM(cipher Block) (AEAD, error)</a>

```
searchKey: cipher.NewGCM
tags: [method]
```

```Go
func NewGCM(cipher Block) (AEAD, error)
```

NewGCM returns the given 128-bit, block cipher wrapped in Galois Counter Mode with the standard nonce length. 

In general, the GHASH operation performed by this implementation of GCM is not constant-time. An exception is when the underlying Block was created by aes.NewCipher on systems with hardware support for AES. See the crypto/aes package documentation for details. 

#### <a id="NewGCMWithNonceSize" href="#NewGCMWithNonceSize">func NewGCMWithNonceSize(cipher Block, size int) (AEAD, error)</a>

```
searchKey: cipher.NewGCMWithNonceSize
tags: [method]
```

```Go
func NewGCMWithNonceSize(cipher Block, size int) (AEAD, error)
```

NewGCMWithNonceSize returns the given 128-bit, block cipher wrapped in Galois Counter Mode, which accepts nonces of the given length. The length must not be zero. 

Only use this function if you require compatibility with an existing cryptosystem that uses non-standard nonce lengths. All other users should use NewGCM, which is faster and more resistant to misuse. 

#### <a id="NewGCMWithTagSize" href="#NewGCMWithTagSize">func NewGCMWithTagSize(cipher Block, tagSize int) (AEAD, error)</a>

```
searchKey: cipher.NewGCMWithTagSize
tags: [method]
```

```Go
func NewGCMWithTagSize(cipher Block, tagSize int) (AEAD, error)
```

NewGCMWithTagSize returns the given 128-bit, block cipher wrapped in Galois Counter Mode, which generates tags with the given length. 

Tag sizes between 12 and 16 bytes are allowed. 

Only use this function if you require compatibility with an existing cryptosystem that uses non-standard tag lengths. All other users should use NewGCM, which is more resistant to misuse. 

#### <a id="newGCMWithNonceAndTagSize" href="#newGCMWithNonceAndTagSize">func newGCMWithNonceAndTagSize(cipher Block, nonceSize, tagSize int) (AEAD, error)</a>

```
searchKey: cipher.newGCMWithNonceAndTagSize
tags: [method private]
```

```Go
func newGCMWithNonceAndTagSize(cipher Block, nonceSize, tagSize int) (AEAD, error)
```

### <a id="Block" href="#Block">type Block interface</a>

```
searchKey: cipher.Block
tags: [interface]
```

```Go
type Block interface {
	// BlockSize returns the cipher's block size.
	BlockSize() int

	// Encrypt encrypts the first block in src into dst.
	// Dst and src must overlap entirely or not at all.
	Encrypt(dst, src []byte)

	// Decrypt decrypts the first block in src into dst.
	// Dst and src must overlap entirely or not at all.
	Decrypt(dst, src []byte)
}
```

A Block represents an implementation of block cipher using a given key. It provides the capability to encrypt or decrypt individual blocks. The mode implementations extend that capability to streams of blocks. 

### <a id="BlockMode" href="#BlockMode">type BlockMode interface</a>

```
searchKey: cipher.BlockMode
tags: [interface]
```

```Go
type BlockMode interface {
	// BlockSize returns the mode's block size.
	BlockSize() int

	// CryptBlocks encrypts or decrypts a number of blocks. The length of
	// src must be a multiple of the block size. Dst and src must overlap
	// entirely or not at all.
	//
	// If len(dst) < len(src), CryptBlocks should panic. It is acceptable
	// to pass a dst bigger than src, and in that case, CryptBlocks will
	// only update dst[:len(src)] and will not touch the rest of dst.
	//
	// Multiple calls to CryptBlocks behave as if the concatenation of
	// the src buffers was passed in a single run. That is, BlockMode
	// maintains state and does not reset at each CryptBlocks call.
	CryptBlocks(dst, src []byte)
}
```

A BlockMode represents a block cipher running in a block-based mode (CBC, ECB etc). 

#### <a id="NewCBCDecrypter" href="#NewCBCDecrypter">func NewCBCDecrypter(b Block, iv []byte) BlockMode</a>

```
searchKey: cipher.NewCBCDecrypter
tags: [method]
```

```Go
func NewCBCDecrypter(b Block, iv []byte) BlockMode
```

NewCBCDecrypter returns a BlockMode which decrypts in cipher block chaining mode, using the given Block. The length of iv must be the same as the Block's block size and must match the iv used to encrypt the data. 

#### <a id="NewCBCEncrypter" href="#NewCBCEncrypter">func NewCBCEncrypter(b Block, iv []byte) BlockMode</a>

```
searchKey: cipher.NewCBCEncrypter
tags: [method]
```

```Go
func NewCBCEncrypter(b Block, iv []byte) BlockMode
```

NewCBCEncrypter returns a BlockMode which encrypts in cipher block chaining mode, using the given Block. The length of iv must be the same as the Block's block size. 

### <a id="Stream" href="#Stream">type Stream interface</a>

```
searchKey: cipher.Stream
tags: [interface]
```

```Go
type Stream interface {
	// XORKeyStream XORs each byte in the given slice with a byte from the
	// cipher's key stream. Dst and src must overlap entirely or not at all.
	//
	// If len(dst) < len(src), XORKeyStream should panic. It is acceptable
	// to pass a dst bigger than src, and in that case, XORKeyStream will
	// only update dst[:len(src)] and will not touch the rest of dst.
	//
	// Multiple calls to XORKeyStream behave as if the concatenation of
	// the src buffers was passed in a single run. That is, Stream
	// maintains state and does not reset at each XORKeyStream call.
	XORKeyStream(dst, src []byte)
}
```

A Stream represents a stream cipher. 

#### <a id="NewCFBDecrypter" href="#NewCFBDecrypter">func NewCFBDecrypter(block Block, iv []byte) Stream</a>

```
searchKey: cipher.NewCFBDecrypter
tags: [method]
```

```Go
func NewCFBDecrypter(block Block, iv []byte) Stream
```

NewCFBDecrypter returns a Stream which decrypts with cipher feedback mode, using the given Block. The iv must be the same length as the Block's block size. 

#### <a id="NewCFBEncrypter" href="#NewCFBEncrypter">func NewCFBEncrypter(block Block, iv []byte) Stream</a>

```
searchKey: cipher.NewCFBEncrypter
tags: [method]
```

```Go
func NewCFBEncrypter(block Block, iv []byte) Stream
```

NewCFBEncrypter returns a Stream which encrypts with cipher feedback mode, using the given Block. The iv must be the same length as the Block's block size. 

#### <a id="NewCTR" href="#NewCTR">func NewCTR(block Block, iv []byte) Stream</a>

```
searchKey: cipher.NewCTR
tags: [method]
```

```Go
func NewCTR(block Block, iv []byte) Stream
```

NewCTR returns a Stream which encrypts/decrypts using the given Block in counter mode. The length of iv must be the same as the Block's block size. 

#### <a id="NewOFB" href="#NewOFB">func NewOFB(b Block, iv []byte) Stream</a>

```
searchKey: cipher.NewOFB
tags: [method]
```

```Go
func NewOFB(b Block, iv []byte) Stream
```

NewOFB returns a Stream that encrypts or decrypts using the block cipher b in output feedback mode. The initialization vector iv's length must be equal to b's block size. 

#### <a id="newCFB" href="#newCFB">func newCFB(block Block, iv []byte, decrypt bool) Stream</a>

```
searchKey: cipher.newCFB
tags: [method private]
```

```Go
func newCFB(block Block, iv []byte, decrypt bool) Stream
```

### <a id="StreamReader" href="#StreamReader">type StreamReader struct</a>

```
searchKey: cipher.StreamReader
tags: [struct]
```

```Go
type StreamReader struct {
	S Stream
	R io.Reader
}
```

StreamReader wraps a Stream into an io.Reader. It calls XORKeyStream to process each slice of data which passes through. 

#### <a id="StreamReader.Read" href="#StreamReader.Read">func (r StreamReader) Read(dst []byte) (n int, err error)</a>

```
searchKey: cipher.StreamReader.Read
tags: [method]
```

```Go
func (r StreamReader) Read(dst []byte) (n int, err error)
```

### <a id="StreamWriter" href="#StreamWriter">type StreamWriter struct</a>

```
searchKey: cipher.StreamWriter
tags: [struct]
```

```Go
type StreamWriter struct {
	S   Stream
	W   io.Writer
	Err error // unused
}
```

StreamWriter wraps a Stream into an io.Writer. It calls XORKeyStream to process each slice of data which passes through. If any Write call returns short then the StreamWriter is out of sync and must be discarded. A StreamWriter has no internal buffering; Close does not need to be called to flush write data. 

#### <a id="StreamWriter.Close" href="#StreamWriter.Close">func (w StreamWriter) Close() error</a>

```
searchKey: cipher.StreamWriter.Close
tags: [function]
```

```Go
func (w StreamWriter) Close() error
```

Close closes the underlying Writer and returns its Close return value, if the Writer is also an io.Closer. Otherwise it returns nil. 

#### <a id="StreamWriter.Write" href="#StreamWriter.Write">func (w StreamWriter) Write(src []byte) (n int, err error)</a>

```
searchKey: cipher.StreamWriter.Write
tags: [method]
```

```Go
func (w StreamWriter) Write(src []byte) (n int, err error)
```

### <a id="cbc" href="#cbc">type cbc struct</a>

```
searchKey: cipher.cbc
tags: [struct private]
```

```Go
type cbc struct {
	b         Block
	blockSize int
	iv        []byte
	tmp       []byte
}
```

#### <a id="newCBC" href="#newCBC">func newCBC(b Block, iv []byte) *cbc</a>

```
searchKey: cipher.newCBC
tags: [method private]
```

```Go
func newCBC(b Block, iv []byte) *cbc
```

### <a id="cbcDecAble" href="#cbcDecAble">type cbcDecAble interface</a>

```
searchKey: cipher.cbcDecAble
tags: [interface private]
```

```Go
type cbcDecAble interface {
	NewCBCDecrypter(iv []byte) BlockMode
}
```

cbcDecAble is an interface implemented by ciphers that have a specific optimized implementation of CBC decryption, like crypto/aes. NewCBCDecrypter will check for this interface and return the specific BlockMode if found. 

### <a id="cbcDecrypter" href="#cbcDecrypter">type cbcDecrypter cipher.cbc</a>

```
searchKey: cipher.cbcDecrypter
tags: [struct private]
```

```Go
type cbcDecrypter cbc
```

#### <a id="cbcDecrypter.BlockSize" href="#cbcDecrypter.BlockSize">func (x *cbcDecrypter) BlockSize() int</a>

```
searchKey: cipher.cbcDecrypter.BlockSize
tags: [function private]
```

```Go
func (x *cbcDecrypter) BlockSize() int
```

#### <a id="cbcDecrypter.CryptBlocks" href="#cbcDecrypter.CryptBlocks">func (x *cbcDecrypter) CryptBlocks(dst, src []byte)</a>

```
searchKey: cipher.cbcDecrypter.CryptBlocks
tags: [method private]
```

```Go
func (x *cbcDecrypter) CryptBlocks(dst, src []byte)
```

#### <a id="cbcDecrypter.SetIV" href="#cbcDecrypter.SetIV">func (x *cbcDecrypter) SetIV(iv []byte)</a>

```
searchKey: cipher.cbcDecrypter.SetIV
tags: [method private]
```

```Go
func (x *cbcDecrypter) SetIV(iv []byte)
```

### <a id="cbcEncAble" href="#cbcEncAble">type cbcEncAble interface</a>

```
searchKey: cipher.cbcEncAble
tags: [interface private]
```

```Go
type cbcEncAble interface {
	NewCBCEncrypter(iv []byte) BlockMode
}
```

cbcEncAble is an interface implemented by ciphers that have a specific optimized implementation of CBC encryption, like crypto/aes. NewCBCEncrypter will check for this interface and return the specific BlockMode if found. 

### <a id="cbcEncrypter" href="#cbcEncrypter">type cbcEncrypter cipher.cbc</a>

```
searchKey: cipher.cbcEncrypter
tags: [struct private]
```

```Go
type cbcEncrypter cbc
```

#### <a id="cbcEncrypter.BlockSize" href="#cbcEncrypter.BlockSize">func (x *cbcEncrypter) BlockSize() int</a>

```
searchKey: cipher.cbcEncrypter.BlockSize
tags: [function private]
```

```Go
func (x *cbcEncrypter) BlockSize() int
```

#### <a id="cbcEncrypter.CryptBlocks" href="#cbcEncrypter.CryptBlocks">func (x *cbcEncrypter) CryptBlocks(dst, src []byte)</a>

```
searchKey: cipher.cbcEncrypter.CryptBlocks
tags: [method private]
```

```Go
func (x *cbcEncrypter) CryptBlocks(dst, src []byte)
```

#### <a id="cbcEncrypter.SetIV" href="#cbcEncrypter.SetIV">func (x *cbcEncrypter) SetIV(iv []byte)</a>

```
searchKey: cipher.cbcEncrypter.SetIV
tags: [method private]
```

```Go
func (x *cbcEncrypter) SetIV(iv []byte)
```

### <a id="cfb" href="#cfb">type cfb struct</a>

```
searchKey: cipher.cfb
tags: [struct private]
```

```Go
type cfb struct {
	b       Block
	next    []byte
	out     []byte
	outUsed int

	decrypt bool
}
```

#### <a id="cfb.XORKeyStream" href="#cfb.XORKeyStream">func (x *cfb) XORKeyStream(dst, src []byte)</a>

```
searchKey: cipher.cfb.XORKeyStream
tags: [method private]
```

```Go
func (x *cfb) XORKeyStream(dst, src []byte)
```

### <a id="ctr" href="#ctr">type ctr struct</a>

```
searchKey: cipher.ctr
tags: [struct private]
```

```Go
type ctr struct {
	b       Block
	ctr     []byte
	out     []byte
	outUsed int
}
```

#### <a id="ctr.XORKeyStream" href="#ctr.XORKeyStream">func (x *ctr) XORKeyStream(dst, src []byte)</a>

```
searchKey: cipher.ctr.XORKeyStream
tags: [method private]
```

```Go
func (x *ctr) XORKeyStream(dst, src []byte)
```

#### <a id="ctr.refill" href="#ctr.refill">func (x *ctr) refill()</a>

```
searchKey: cipher.ctr.refill
tags: [function private]
```

```Go
func (x *ctr) refill()
```

### <a id="ctrAble" href="#ctrAble">type ctrAble interface</a>

```
searchKey: cipher.ctrAble
tags: [interface private]
```

```Go
type ctrAble interface {
	NewCTR(iv []byte) Stream
}
```

ctrAble is an interface implemented by ciphers that have a specific optimized implementation of CTR, like crypto/aes. NewCTR will check for this interface and return the specific Stream if found. 

### <a id="gcm" href="#gcm">type gcm struct</a>

```
searchKey: cipher.gcm
tags: [struct private]
```

```Go
type gcm struct {
	cipher    Block
	nonceSize int
	tagSize   int
	// productTable contains the first sixteen powers of the key, H.
	// However, they are in bit reversed order. See NewGCMWithNonceSize.
	productTable [16]gcmFieldElement
}
```

gcm represents a Galois Counter Mode with a specific key. See [https://csrc.nist.gov/groups/ST/toolkit/BCM/documents/proposedmodes/gcm/gcm-revised-spec.pdf](https://csrc.nist.gov/groups/ST/toolkit/BCM/documents/proposedmodes/gcm/gcm-revised-spec.pdf) 

#### <a id="gcm.NonceSize" href="#gcm.NonceSize">func (g *gcm) NonceSize() int</a>

```
searchKey: cipher.gcm.NonceSize
tags: [function private]
```

```Go
func (g *gcm) NonceSize() int
```

#### <a id="gcm.Open" href="#gcm.Open">func (g *gcm) Open(dst, nonce, ciphertext, data []byte) ([]byte, error)</a>

```
searchKey: cipher.gcm.Open
tags: [method private]
```

```Go
func (g *gcm) Open(dst, nonce, ciphertext, data []byte) ([]byte, error)
```

#### <a id="gcm.Overhead" href="#gcm.Overhead">func (g *gcm) Overhead() int</a>

```
searchKey: cipher.gcm.Overhead
tags: [function private]
```

```Go
func (g *gcm) Overhead() int
```

#### <a id="gcm.Seal" href="#gcm.Seal">func (g *gcm) Seal(dst, nonce, plaintext, data []byte) []byte</a>

```
searchKey: cipher.gcm.Seal
tags: [method private]
```

```Go
func (g *gcm) Seal(dst, nonce, plaintext, data []byte) []byte
```

#### <a id="gcm.auth" href="#gcm.auth">func (g *gcm) auth(out, ciphertext, additionalData []byte, tagMask *[gcmTagSize]byte)</a>

```
searchKey: cipher.gcm.auth
tags: [method private]
```

```Go
func (g *gcm) auth(out, ciphertext, additionalData []byte, tagMask *[gcmTagSize]byte)
```

auth calculates GHASH(ciphertext, additionalData), masks the result with tagMask and writes the result to out. 

#### <a id="gcm.counterCrypt" href="#gcm.counterCrypt">func (g *gcm) counterCrypt(out, in []byte, counter *[gcmBlockSize]byte)</a>

```
searchKey: cipher.gcm.counterCrypt
tags: [method private]
```

```Go
func (g *gcm) counterCrypt(out, in []byte, counter *[gcmBlockSize]byte)
```

counterCrypt crypts in to out using g.cipher in counter mode. 

#### <a id="gcm.deriveCounter" href="#gcm.deriveCounter">func (g *gcm) deriveCounter(counter *[gcmBlockSize]byte, nonce []byte)</a>

```
searchKey: cipher.gcm.deriveCounter
tags: [method private]
```

```Go
func (g *gcm) deriveCounter(counter *[gcmBlockSize]byte, nonce []byte)
```

deriveCounter computes the initial GCM counter state from the given nonce. See NIST SP 800-38D, section 7.1. This assumes that counter is filled with zeros on entry. 

#### <a id="gcm.mul" href="#gcm.mul">func (g *gcm) mul(y *gcmFieldElement)</a>

```
searchKey: cipher.gcm.mul
tags: [method private]
```

```Go
func (g *gcm) mul(y *gcmFieldElement)
```

mul sets y to y*H, where H is the GCM key, fixed during NewGCMWithNonceSize. 

#### <a id="gcm.update" href="#gcm.update">func (g *gcm) update(y *gcmFieldElement, data []byte)</a>

```
searchKey: cipher.gcm.update
tags: [method private]
```

```Go
func (g *gcm) update(y *gcmFieldElement, data []byte)
```

update extends y with more polynomial terms from data. If data is not a multiple of gcmBlockSize bytes long then the remainder is zero padded. 

#### <a id="gcm.updateBlocks" href="#gcm.updateBlocks">func (g *gcm) updateBlocks(y *gcmFieldElement, blocks []byte)</a>

```
searchKey: cipher.gcm.updateBlocks
tags: [method private]
```

```Go
func (g *gcm) updateBlocks(y *gcmFieldElement, blocks []byte)
```

updateBlocks extends y with more polynomial terms from blocks, based on Horner's rule. There must be a multiple of gcmBlockSize bytes in blocks. 

### <a id="gcmAble" href="#gcmAble">type gcmAble interface</a>

```
searchKey: cipher.gcmAble
tags: [interface private]
```

```Go
type gcmAble interface {
	NewGCM(nonceSize, tagSize int) (AEAD, error)
}
```

gcmAble is an interface implemented by ciphers that have a specific optimized implementation of GCM, like crypto/aes. NewGCM will check for this interface and return the specific AEAD if found. 

### <a id="gcmFieldElement" href="#gcmFieldElement">type gcmFieldElement struct</a>

```
searchKey: cipher.gcmFieldElement
tags: [struct private]
```

```Go
type gcmFieldElement struct {
	low, high uint64
}
```

gcmFieldElement represents a value in GF(2¹²⁸). In order to reflect the GCM standard and make binary.BigEndian suitable for marshaling these values, the bits are stored in big endian order. For example: 

```
the coefficient of x⁰ can be obtained by v.low >> 63.
the coefficient of x⁶³ can be obtained by v.low & 1.
the coefficient of x⁶⁴ can be obtained by v.high >> 63.
the coefficient of x¹²⁷ can be obtained by v.high & 1.

```
#### <a id="gcmAdd" href="#gcmAdd">func gcmAdd(x, y *gcmFieldElement) gcmFieldElement</a>

```
searchKey: cipher.gcmAdd
tags: [method private]
```

```Go
func gcmAdd(x, y *gcmFieldElement) gcmFieldElement
```

gcmAdd adds two elements of GF(2¹²⁸) and returns the sum. 

#### <a id="gcmDouble" href="#gcmDouble">func gcmDouble(x *gcmFieldElement) (double gcmFieldElement)</a>

```
searchKey: cipher.gcmDouble
tags: [method private]
```

```Go
func gcmDouble(x *gcmFieldElement) (double gcmFieldElement)
```

gcmDouble returns the result of doubling an element of GF(2¹²⁸). 

### <a id="ofb" href="#ofb">type ofb struct</a>

```
searchKey: cipher.ofb
tags: [struct private]
```

```Go
type ofb struct {
	b       Block
	cipher  []byte
	out     []byte
	outUsed int
}
```

#### <a id="ofb.XORKeyStream" href="#ofb.XORKeyStream">func (x *ofb) XORKeyStream(dst, src []byte)</a>

```
searchKey: cipher.ofb.XORKeyStream
tags: [method private]
```

```Go
func (x *ofb) XORKeyStream(dst, src []byte)
```

#### <a id="ofb.refill" href="#ofb.refill">func (x *ofb) refill()</a>

```
searchKey: cipher.ofb.refill
tags: [function private]
```

```Go
func (x *ofb) refill()
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="dup" href="#dup">func dup(p []byte) []byte</a>

```
searchKey: cipher.dup
tags: [method private]
```

```Go
func dup(p []byte) []byte
```

### <a id="gcmInc32" href="#gcmInc32">func gcmInc32(counterBlock *[16]byte)</a>

```
searchKey: cipher.gcmInc32
tags: [method private]
```

```Go
func gcmInc32(counterBlock *[16]byte)
```

gcmInc32 treats the final four bytes of counterBlock as a big-endian value and increments it. 

### <a id="reverseBits" href="#reverseBits">func reverseBits(i int) int</a>

```
searchKey: cipher.reverseBits
tags: [method private]
```

```Go
func reverseBits(i int) int
```

reverseBits reverses the order of the bits of 4-bit number in i. 

### <a id="sliceForAppend" href="#sliceForAppend">func sliceForAppend(in []byte, n int) (head, tail []byte)</a>

```
searchKey: cipher.sliceForAppend
tags: [method private]
```

```Go
func sliceForAppend(in []byte, n int) (head, tail []byte)
```

sliceForAppend takes a slice and a requested number of bytes. It returns a slice with the contents of the given slice followed by that many bytes and a second slice that aliases into it and contains only the extra bytes. If the original slice has sufficient capacity then no allocation is performed. 

### <a id="xorBytes" href="#xorBytes">func xorBytes(dst, a, b []byte) int</a>

```
searchKey: cipher.xorBytes
tags: [method private]
```

```Go
func xorBytes(dst, a, b []byte) int
```

xorBytes xors the bytes in a and b. The destination should have enough space, otherwise xorBytes will panic. Returns the number of bytes xor'd. 

### <a id="xorBytesSSE2" href="#xorBytesSSE2">func xorBytesSSE2(dst, a, b *byte, n int)</a>

```
searchKey: cipher.xorBytesSSE2
tags: [method private]
```

```Go
func xorBytesSSE2(dst, a, b *byte, n int)
```

### <a id="xorWords" href="#xorWords">func xorWords(dst, a, b []byte)</a>

```
searchKey: cipher.xorWords
tags: [method private]
```

```Go
func xorWords(dst, a, b []byte)
```

