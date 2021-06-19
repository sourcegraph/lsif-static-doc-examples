# Package cipher_test

## Index

* [Constants](#const)
    * [const almost1K](#almost1K)
    * [const almost8K](#almost8K)
* [Variables](#var)
    * [var cbcAESTests](#cbcAESTests)
    * [var cfbTests](#cfbTests)
    * [var commonInput](#commonInput)
    * [var commonKey128](#commonKey128)
    * [var commonKey192](#commonKey192)
    * [var commonKey256](#commonKey256)
    * [var commonIV](#commonIV)
    * [var commonCounter](#commonCounter)
    * [var ctrAESTests](#ctrAESTests)
    * [var aesGCMTests](#aesGCMTests)
    * [var ofbTests](#ofbTests)
* [Types](#type)
    * [type noopBlock int](#noopBlock)
        * [func (b noopBlock) BlockSize() int](#noopBlock.BlockSize)
        * [func (noopBlock) Encrypt(dst, src []byte)](#noopBlock.Encrypt)
        * [func (noopBlock) Decrypt(dst, src []byte)](#noopBlock.Decrypt)
    * [type wrapper struct](#wrapper)
        * [func (w *wrapper) BlockSize() int](#wrapper.BlockSize)
        * [func (w *wrapper) Encrypt(dst, src []byte)](#wrapper.Encrypt)
        * [func (w *wrapper) Decrypt(dst, src []byte)](#wrapper.Decrypt)
    * [type ofbTest struct](#ofbTest)
* [Functions](#func)
    * [func benchmarkAESGCMSeal(b *testing.B, buf []byte, keySize int)](#benchmarkAESGCMSeal)
    * [func benchmarkAESGCMOpen(b *testing.B, buf []byte, keySize int)](#benchmarkAESGCMOpen)
    * [func BenchmarkAESGCM(b *testing.B)](#BenchmarkAESGCM)
    * [func benchmarkAESStream(b *testing.B, mode func(cipher.Block, []byte) cipher.Stream, buf []byte)](#benchmarkAESStream)
    * [func BenchmarkAESCFBEncrypt1K(b *testing.B)](#BenchmarkAESCFBEncrypt1K)
    * [func BenchmarkAESCFBDecrypt1K(b *testing.B)](#BenchmarkAESCFBDecrypt1K)
    * [func BenchmarkAESCFBDecrypt8K(b *testing.B)](#BenchmarkAESCFBDecrypt8K)
    * [func BenchmarkAESOFB1K(b *testing.B)](#BenchmarkAESOFB1K)
    * [func BenchmarkAESCTR1K(b *testing.B)](#BenchmarkAESCTR1K)
    * [func BenchmarkAESCTR8K(b *testing.B)](#BenchmarkAESCTR8K)
    * [func BenchmarkAESCBCEncrypt1K(b *testing.B)](#BenchmarkAESCBCEncrypt1K)
    * [func BenchmarkAESCBCDecrypt1K(b *testing.B)](#BenchmarkAESCBCDecrypt1K)
    * [func TestCBCEncrypterAES(t *testing.T)](#TestCBCEncrypterAES)
    * [func TestCBCDecrypterAES(t *testing.T)](#TestCBCDecrypterAES)
    * [func TestCFBVectors(t *testing.T)](#TestCFBVectors)
    * [func TestCFBInverse(t *testing.T)](#TestCFBInverse)
    * [func TestCryptBlocks(t *testing.T)](#TestCryptBlocks)
    * [func mustPanic(t *testing.T, msg string, f func())](#mustPanic)
    * [func TestEmptyPlaintext(t *testing.T)](#TestEmptyPlaintext)
    * [func TestCTR_AES(t *testing.T)](#TestCTR_AES)
    * [func inc(b []byte)](#inc)
    * [func xor(a, b []byte)](#xor)
    * [func TestCTR(t *testing.T)](#TestCTR)
    * [func ExampleNewGCM_encrypt()](#ExampleNewGCM_encrypt)
    * [func ExampleNewGCM_decrypt()](#ExampleNewGCM_decrypt)
    * [func ExampleNewCBCDecrypter()](#ExampleNewCBCDecrypter)
    * [func ExampleNewCBCEncrypter()](#ExampleNewCBCEncrypter)
    * [func ExampleNewCFBDecrypter()](#ExampleNewCFBDecrypter)
    * [func ExampleNewCFBEncrypter()](#ExampleNewCFBEncrypter)
    * [func ExampleNewCTR()](#ExampleNewCTR)
    * [func ExampleNewOFB()](#ExampleNewOFB)
    * [func ExampleStreamReader()](#ExampleStreamReader)
    * [func ExampleStreamWriter()](#ExampleStreamWriter)
    * [func TestAESGCM(t *testing.T)](#TestAESGCM)
    * [func TestGCMInvalidTagSize(t *testing.T)](#TestGCMInvalidTagSize)
    * [func TestTagFailureOverwrite(t *testing.T)](#TestTagFailureOverwrite)
    * [func TestGCMCounterWrap(t *testing.T)](#TestGCMCounterWrap)
    * [func wrap(b cipher.Block) cipher.Block](#wrap)
    * [func TestGCMAsm(t *testing.T)](#TestGCMAsm)
    * [func TestOFB(t *testing.T)](#TestOFB)
    * [func TestXOR(t *testing.T)](#TestXOR)
    * [func min(a, b []byte) int](#min)
    * [func BenchmarkXORBytes(b *testing.B)](#BenchmarkXORBytes)


## <a id="const" href="#const">Constants</a>

### <a id="almost1K" href="#almost1K">const almost1K</a>

```
searchKey: cipher_test.almost1K
```

```Go
const almost1K = 1024 - 5
```

If we test exactly 1K blocks, we would generate exact multiples of the cipher's block size, and the cipher stream fragments would always be wordsize aligned, whereas non-aligned is a more typical use-case. 

### <a id="almost8K" href="#almost8K">const almost8K</a>

```
searchKey: cipher_test.almost8K
```

```Go
const almost8K = 8*1024 - 5
```

## <a id="var" href="#var">Variables</a>

### <a id="cbcAESTests" href="#cbcAESTests">var cbcAESTests</a>

```
searchKey: cipher_test.cbcAESTests
```

```Go
var cbcAESTests = ...
```

### <a id="cfbTests" href="#cfbTests">var cfbTests</a>

```
searchKey: cipher_test.cfbTests
```

```Go
var cfbTests = ...
```

cfbTests contains the test vectors from [https://csrc.nist.gov/publications/nistpubs/800-38a/sp800-38a.pdf](https://csrc.nist.gov/publications/nistpubs/800-38a/sp800-38a.pdf), section F.3.13. 

### <a id="commonInput" href="#commonInput">var commonInput</a>

```
searchKey: cipher_test.commonInput
```

```Go
var commonInput = ...
```

### <a id="commonKey128" href="#commonKey128">var commonKey128</a>

```
searchKey: cipher_test.commonKey128
```

```Go
var commonKey128 = ...
```

### <a id="commonKey192" href="#commonKey192">var commonKey192</a>

```
searchKey: cipher_test.commonKey192
```

```Go
var commonKey192 = ...
```

### <a id="commonKey256" href="#commonKey256">var commonKey256</a>

```
searchKey: cipher_test.commonKey256
```

```Go
var commonKey256 = ...
```

### <a id="commonIV" href="#commonIV">var commonIV</a>

```
searchKey: cipher_test.commonIV
```

```Go
var commonIV = ...
```

### <a id="commonCounter" href="#commonCounter">var commonCounter</a>

```
searchKey: cipher_test.commonCounter
```

```Go
var commonCounter = ...
```

### <a id="ctrAESTests" href="#ctrAESTests">var ctrAESTests</a>

```
searchKey: cipher_test.ctrAESTests
```

```Go
var ctrAESTests = ...
```

### <a id="aesGCMTests" href="#aesGCMTests">var aesGCMTests</a>

```
searchKey: cipher_test.aesGCMTests
```

```Go
var aesGCMTests = ...
```

### <a id="ofbTests" href="#ofbTests">var ofbTests</a>

```
searchKey: cipher_test.ofbTests
```

```Go
var ofbTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="noopBlock" href="#noopBlock">type noopBlock int</a>

```
searchKey: cipher_test.noopBlock
```

```Go
type noopBlock int
```

#### <a id="noopBlock.BlockSize" href="#noopBlock.BlockSize">func (b noopBlock) BlockSize() int</a>

```
searchKey: cipher_test.noopBlock.BlockSize
```

```Go
func (b noopBlock) BlockSize() int
```

#### <a id="noopBlock.Encrypt" href="#noopBlock.Encrypt">func (noopBlock) Encrypt(dst, src []byte)</a>

```
searchKey: cipher_test.noopBlock.Encrypt
```

```Go
func (noopBlock) Encrypt(dst, src []byte)
```

#### <a id="noopBlock.Decrypt" href="#noopBlock.Decrypt">func (noopBlock) Decrypt(dst, src []byte)</a>

```
searchKey: cipher_test.noopBlock.Decrypt
```

```Go
func (noopBlock) Decrypt(dst, src []byte)
```

### <a id="wrapper" href="#wrapper">type wrapper struct</a>

```
searchKey: cipher_test.wrapper
```

```Go
type wrapper struct {
	block cipher.Block
}
```

#### <a id="wrapper.BlockSize" href="#wrapper.BlockSize">func (w *wrapper) BlockSize() int</a>

```
searchKey: cipher_test.wrapper.BlockSize
```

```Go
func (w *wrapper) BlockSize() int
```

#### <a id="wrapper.Encrypt" href="#wrapper.Encrypt">func (w *wrapper) Encrypt(dst, src []byte)</a>

```
searchKey: cipher_test.wrapper.Encrypt
```

```Go
func (w *wrapper) Encrypt(dst, src []byte)
```

#### <a id="wrapper.Decrypt" href="#wrapper.Decrypt">func (w *wrapper) Decrypt(dst, src []byte)</a>

```
searchKey: cipher_test.wrapper.Decrypt
```

```Go
func (w *wrapper) Decrypt(dst, src []byte)
```

### <a id="ofbTest" href="#ofbTest">type ofbTest struct</a>

```
searchKey: cipher_test.ofbTest
```

```Go
type ofbTest struct {
	name string
	key  []byte
	iv   []byte
	in   []byte
	out  []byte
}
```

## <a id="func" href="#func">Functions</a>

### <a id="benchmarkAESGCMSeal" href="#benchmarkAESGCMSeal">func benchmarkAESGCMSeal(b *testing.B, buf []byte, keySize int)</a>

```
searchKey: cipher_test.benchmarkAESGCMSeal
```

```Go
func benchmarkAESGCMSeal(b *testing.B, buf []byte, keySize int)
```

### <a id="benchmarkAESGCMOpen" href="#benchmarkAESGCMOpen">func benchmarkAESGCMOpen(b *testing.B, buf []byte, keySize int)</a>

```
searchKey: cipher_test.benchmarkAESGCMOpen
```

```Go
func benchmarkAESGCMOpen(b *testing.B, buf []byte, keySize int)
```

### <a id="BenchmarkAESGCM" href="#BenchmarkAESGCM">func BenchmarkAESGCM(b *testing.B)</a>

```
searchKey: cipher_test.BenchmarkAESGCM
```

```Go
func BenchmarkAESGCM(b *testing.B)
```

### <a id="benchmarkAESStream" href="#benchmarkAESStream">func benchmarkAESStream(b *testing.B, mode func(cipher.Block, []byte) cipher.Stream, buf []byte)</a>

```
searchKey: cipher_test.benchmarkAESStream
```

```Go
func benchmarkAESStream(b *testing.B, mode func(cipher.Block, []byte) cipher.Stream, buf []byte)
```

### <a id="BenchmarkAESCFBEncrypt1K" href="#BenchmarkAESCFBEncrypt1K">func BenchmarkAESCFBEncrypt1K(b *testing.B)</a>

```
searchKey: cipher_test.BenchmarkAESCFBEncrypt1K
```

```Go
func BenchmarkAESCFBEncrypt1K(b *testing.B)
```

### <a id="BenchmarkAESCFBDecrypt1K" href="#BenchmarkAESCFBDecrypt1K">func BenchmarkAESCFBDecrypt1K(b *testing.B)</a>

```
searchKey: cipher_test.BenchmarkAESCFBDecrypt1K
```

```Go
func BenchmarkAESCFBDecrypt1K(b *testing.B)
```

### <a id="BenchmarkAESCFBDecrypt8K" href="#BenchmarkAESCFBDecrypt8K">func BenchmarkAESCFBDecrypt8K(b *testing.B)</a>

```
searchKey: cipher_test.BenchmarkAESCFBDecrypt8K
```

```Go
func BenchmarkAESCFBDecrypt8K(b *testing.B)
```

### <a id="BenchmarkAESOFB1K" href="#BenchmarkAESOFB1K">func BenchmarkAESOFB1K(b *testing.B)</a>

```
searchKey: cipher_test.BenchmarkAESOFB1K
```

```Go
func BenchmarkAESOFB1K(b *testing.B)
```

### <a id="BenchmarkAESCTR1K" href="#BenchmarkAESCTR1K">func BenchmarkAESCTR1K(b *testing.B)</a>

```
searchKey: cipher_test.BenchmarkAESCTR1K
```

```Go
func BenchmarkAESCTR1K(b *testing.B)
```

### <a id="BenchmarkAESCTR8K" href="#BenchmarkAESCTR8K">func BenchmarkAESCTR8K(b *testing.B)</a>

```
searchKey: cipher_test.BenchmarkAESCTR8K
```

```Go
func BenchmarkAESCTR8K(b *testing.B)
```

### <a id="BenchmarkAESCBCEncrypt1K" href="#BenchmarkAESCBCEncrypt1K">func BenchmarkAESCBCEncrypt1K(b *testing.B)</a>

```
searchKey: cipher_test.BenchmarkAESCBCEncrypt1K
```

```Go
func BenchmarkAESCBCEncrypt1K(b *testing.B)
```

### <a id="BenchmarkAESCBCDecrypt1K" href="#BenchmarkAESCBCDecrypt1K">func BenchmarkAESCBCDecrypt1K(b *testing.B)</a>

```
searchKey: cipher_test.BenchmarkAESCBCDecrypt1K
```

```Go
func BenchmarkAESCBCDecrypt1K(b *testing.B)
```

### <a id="TestCBCEncrypterAES" href="#TestCBCEncrypterAES">func TestCBCEncrypterAES(t *testing.T)</a>

```
searchKey: cipher_test.TestCBCEncrypterAES
```

```Go
func TestCBCEncrypterAES(t *testing.T)
```

### <a id="TestCBCDecrypterAES" href="#TestCBCDecrypterAES">func TestCBCDecrypterAES(t *testing.T)</a>

```
searchKey: cipher_test.TestCBCDecrypterAES
```

```Go
func TestCBCDecrypterAES(t *testing.T)
```

### <a id="TestCFBVectors" href="#TestCFBVectors">func TestCFBVectors(t *testing.T)</a>

```
searchKey: cipher_test.TestCFBVectors
```

```Go
func TestCFBVectors(t *testing.T)
```

### <a id="TestCFBInverse" href="#TestCFBInverse">func TestCFBInverse(t *testing.T)</a>

```
searchKey: cipher_test.TestCFBInverse
```

```Go
func TestCFBInverse(t *testing.T)
```

### <a id="TestCryptBlocks" href="#TestCryptBlocks">func TestCryptBlocks(t *testing.T)</a>

```
searchKey: cipher_test.TestCryptBlocks
```

```Go
func TestCryptBlocks(t *testing.T)
```

### <a id="mustPanic" href="#mustPanic">func mustPanic(t *testing.T, msg string, f func())</a>

```
searchKey: cipher_test.mustPanic
```

```Go
func mustPanic(t *testing.T, msg string, f func())
```

### <a id="TestEmptyPlaintext" href="#TestEmptyPlaintext">func TestEmptyPlaintext(t *testing.T)</a>

```
searchKey: cipher_test.TestEmptyPlaintext
```

```Go
func TestEmptyPlaintext(t *testing.T)
```

### <a id="TestCTR_AES" href="#TestCTR_AES">func TestCTR_AES(t *testing.T)</a>

```
searchKey: cipher_test.TestCTR_AES
```

```Go
func TestCTR_AES(t *testing.T)
```

### <a id="inc" href="#inc">func inc(b []byte)</a>

```
searchKey: cipher_test.inc
```

```Go
func inc(b []byte)
```

### <a id="xor" href="#xor">func xor(a, b []byte)</a>

```
searchKey: cipher_test.xor
```

```Go
func xor(a, b []byte)
```

### <a id="TestCTR" href="#TestCTR">func TestCTR(t *testing.T)</a>

```
searchKey: cipher_test.TestCTR
```

```Go
func TestCTR(t *testing.T)
```

### <a id="ExampleNewGCM_encrypt" href="#ExampleNewGCM_encrypt">func ExampleNewGCM_encrypt()</a>

```
searchKey: cipher_test.ExampleNewGCM_encrypt
```

```Go
func ExampleNewGCM_encrypt()
```

### <a id="ExampleNewGCM_decrypt" href="#ExampleNewGCM_decrypt">func ExampleNewGCM_decrypt()</a>

```
searchKey: cipher_test.ExampleNewGCM_decrypt
```

```Go
func ExampleNewGCM_decrypt()
```

### <a id="ExampleNewCBCDecrypter" href="#ExampleNewCBCDecrypter">func ExampleNewCBCDecrypter()</a>

```
searchKey: cipher_test.ExampleNewCBCDecrypter
```

```Go
func ExampleNewCBCDecrypter()
```

### <a id="ExampleNewCBCEncrypter" href="#ExampleNewCBCEncrypter">func ExampleNewCBCEncrypter()</a>

```
searchKey: cipher_test.ExampleNewCBCEncrypter
```

```Go
func ExampleNewCBCEncrypter()
```

### <a id="ExampleNewCFBDecrypter" href="#ExampleNewCFBDecrypter">func ExampleNewCFBDecrypter()</a>

```
searchKey: cipher_test.ExampleNewCFBDecrypter
```

```Go
func ExampleNewCFBDecrypter()
```

### <a id="ExampleNewCFBEncrypter" href="#ExampleNewCFBEncrypter">func ExampleNewCFBEncrypter()</a>

```
searchKey: cipher_test.ExampleNewCFBEncrypter
```

```Go
func ExampleNewCFBEncrypter()
```

### <a id="ExampleNewCTR" href="#ExampleNewCTR">func ExampleNewCTR()</a>

```
searchKey: cipher_test.ExampleNewCTR
```

```Go
func ExampleNewCTR()
```

### <a id="ExampleNewOFB" href="#ExampleNewOFB">func ExampleNewOFB()</a>

```
searchKey: cipher_test.ExampleNewOFB
```

```Go
func ExampleNewOFB()
```

### <a id="ExampleStreamReader" href="#ExampleStreamReader">func ExampleStreamReader()</a>

```
searchKey: cipher_test.ExampleStreamReader
```

```Go
func ExampleStreamReader()
```

### <a id="ExampleStreamWriter" href="#ExampleStreamWriter">func ExampleStreamWriter()</a>

```
searchKey: cipher_test.ExampleStreamWriter
```

```Go
func ExampleStreamWriter()
```

### <a id="TestAESGCM" href="#TestAESGCM">func TestAESGCM(t *testing.T)</a>

```
searchKey: cipher_test.TestAESGCM
```

```Go
func TestAESGCM(t *testing.T)
```

### <a id="TestGCMInvalidTagSize" href="#TestGCMInvalidTagSize">func TestGCMInvalidTagSize(t *testing.T)</a>

```
searchKey: cipher_test.TestGCMInvalidTagSize
```

```Go
func TestGCMInvalidTagSize(t *testing.T)
```

### <a id="TestTagFailureOverwrite" href="#TestTagFailureOverwrite">func TestTagFailureOverwrite(t *testing.T)</a>

```
searchKey: cipher_test.TestTagFailureOverwrite
```

```Go
func TestTagFailureOverwrite(t *testing.T)
```

### <a id="TestGCMCounterWrap" href="#TestGCMCounterWrap">func TestGCMCounterWrap(t *testing.T)</a>

```
searchKey: cipher_test.TestGCMCounterWrap
```

```Go
func TestGCMCounterWrap(t *testing.T)
```

### <a id="wrap" href="#wrap">func wrap(b cipher.Block) cipher.Block</a>

```
searchKey: cipher_test.wrap
```

```Go
func wrap(b cipher.Block) cipher.Block
```

wrap wraps the Block interface so that it does not fulfill any optimizing interfaces such as gcmAble. 

### <a id="TestGCMAsm" href="#TestGCMAsm">func TestGCMAsm(t *testing.T)</a>

```
searchKey: cipher_test.TestGCMAsm
```

```Go
func TestGCMAsm(t *testing.T)
```

### <a id="TestOFB" href="#TestOFB">func TestOFB(t *testing.T)</a>

```
searchKey: cipher_test.TestOFB
```

```Go
func TestOFB(t *testing.T)
```

### <a id="TestXOR" href="#TestXOR">func TestXOR(t *testing.T)</a>

```
searchKey: cipher_test.TestXOR
```

```Go
func TestXOR(t *testing.T)
```

### <a id="min" href="#min">func min(a, b []byte) int</a>

```
searchKey: cipher_test.min
```

```Go
func min(a, b []byte) int
```

### <a id="BenchmarkXORBytes" href="#BenchmarkXORBytes">func BenchmarkXORBytes(b *testing.B)</a>

```
searchKey: cipher_test.BenchmarkXORBytes
```

```Go
func BenchmarkXORBytes(b *testing.B)
```
