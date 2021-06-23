# Package rc4

Package rc4 implements RC4 encryption, as defined in Bruce Schneier's Applied Cryptography. 

RC4 is cryptographically broken and should not be used for secure applications. 

## Index

* [Variables](#var)
    * [var golden](#golden)
* [Types](#type)
    * [type Cipher struct](#Cipher)
        * [func NewCipher(key []byte) (*Cipher, error)](#NewCipher)
        * [func (c *Cipher) Reset()](#Cipher.Reset)
        * [func (c *Cipher) XORKeyStream(dst, src []byte)](#Cipher.XORKeyStream)
    * [type KeySizeError int](#KeySizeError)
        * [func (k KeySizeError) Error() string](#KeySizeError.Error)
    * [type rc4Test struct](#rc4Test)
* [Functions](#func)
    * [func testEncrypt(t *testing.T, desc string, c *Cipher, src, expect []byte)](#testEncrypt)
    * [func TestGolden(t *testing.T)](#TestGolden)
    * [func TestBlock(t *testing.T)](#TestBlock)
    * [func benchmark(b *testing.B, size int64)](#benchmark)
    * [func BenchmarkRC4_128(b *testing.B)](#BenchmarkRC4_128)
    * [func BenchmarkRC4_1K(b *testing.B)](#BenchmarkRC4_1K)
    * [func BenchmarkRC4_8K(b *testing.B)](#BenchmarkRC4_8K)


## <a id="var" href="#var">Variables</a>

### <a id="golden" href="#golden">var golden</a>

```
searchKey: rc4.golden
tags: [private]
```

```Go
var golden = ...
```

## <a id="type" href="#type">Types</a>

### <a id="Cipher" href="#Cipher">type Cipher struct</a>

```
searchKey: rc4.Cipher
```

```Go
type Cipher struct {
	s    [256]uint32
	i, j uint8
}
```

A Cipher is an instance of RC4 using a particular key. 

#### <a id="NewCipher" href="#NewCipher">func NewCipher(key []byte) (*Cipher, error)</a>

```
searchKey: rc4.NewCipher
```

```Go
func NewCipher(key []byte) (*Cipher, error)
```

NewCipher creates and returns a new Cipher. The key argument should be the RC4 key, at least 1 byte and at most 256 bytes. 

#### <a id="Cipher.Reset" href="#Cipher.Reset">func (c *Cipher) Reset()</a>

```
searchKey: rc4.Cipher.Reset
tags: [deprecated]
```

```Go
func (c *Cipher) Reset()
```

Reset zeros the key data and makes the Cipher unusable. 

Deprecated: Reset can't guarantee that the key will be entirely removed from the process's memory. 

#### <a id="Cipher.XORKeyStream" href="#Cipher.XORKeyStream">func (c *Cipher) XORKeyStream(dst, src []byte)</a>

```
searchKey: rc4.Cipher.XORKeyStream
```

```Go
func (c *Cipher) XORKeyStream(dst, src []byte)
```

XORKeyStream sets dst to the result of XORing src with the key stream. Dst and src must overlap entirely or not at all. 

### <a id="KeySizeError" href="#KeySizeError">type KeySizeError int</a>

```
searchKey: rc4.KeySizeError
```

```Go
type KeySizeError int
```

#### <a id="KeySizeError.Error" href="#KeySizeError.Error">func (k KeySizeError) Error() string</a>

```
searchKey: rc4.KeySizeError.Error
```

```Go
func (k KeySizeError) Error() string
```

### <a id="rc4Test" href="#rc4Test">type rc4Test struct</a>

```
searchKey: rc4.rc4Test
tags: [private]
```

```Go
type rc4Test struct {
	key, keystream []byte
}
```

## <a id="func" href="#func">Functions</a>

### <a id="testEncrypt" href="#testEncrypt">func testEncrypt(t *testing.T, desc string, c *Cipher, src, expect []byte)</a>

```
searchKey: rc4.testEncrypt
tags: [private]
```

```Go
func testEncrypt(t *testing.T, desc string, c *Cipher, src, expect []byte)
```

### <a id="TestGolden" href="#TestGolden">func TestGolden(t *testing.T)</a>

```
searchKey: rc4.TestGolden
tags: [private]
```

```Go
func TestGolden(t *testing.T)
```

### <a id="TestBlock" href="#TestBlock">func TestBlock(t *testing.T)</a>

```
searchKey: rc4.TestBlock
tags: [private]
```

```Go
func TestBlock(t *testing.T)
```

### <a id="benchmark" href="#benchmark">func benchmark(b *testing.B, size int64)</a>

```
searchKey: rc4.benchmark
tags: [private]
```

```Go
func benchmark(b *testing.B, size int64)
```

### <a id="BenchmarkRC4_128" href="#BenchmarkRC4_128">func BenchmarkRC4_128(b *testing.B)</a>

```
searchKey: rc4.BenchmarkRC4_128
tags: [private]
```

```Go
func BenchmarkRC4_128(b *testing.B)
```

### <a id="BenchmarkRC4_1K" href="#BenchmarkRC4_1K">func BenchmarkRC4_1K(b *testing.B)</a>

```
searchKey: rc4.BenchmarkRC4_1K
tags: [private]
```

```Go
func BenchmarkRC4_1K(b *testing.B)
```

### <a id="BenchmarkRC4_8K" href="#BenchmarkRC4_8K">func BenchmarkRC4_8K(b *testing.B)</a>

```
searchKey: rc4.BenchmarkRC4_8K
tags: [private]
```

```Go
func BenchmarkRC4_8K(b *testing.B)
```

