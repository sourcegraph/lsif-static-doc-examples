# Package sha1

Package sha1 implements the SHA-1 hash algorithm as defined in RFC 3174. 

SHA-1 is cryptographically broken and should not be used for secure applications. 

## Index

* [Constants](#const)
    * [const Size](#Size)
    * [const BlockSize](#BlockSize)
    * [const chunk](#chunk)
    * [const init0](#init0)
    * [const init1](#init1)
    * [const init2](#init2)
    * [const init3](#init3)
    * [const init4](#init4)
    * [const magic](#magic)
    * [const marshaledSize](#marshaledSize)
    * [const _K0](#_K0)
    * [const _K1](#_K1)
    * [const _K2](#_K2)
    * [const _K3](#_K3)
* [Variables](#var)
    * [var useAVX2](#useAVX2)
    * [var golden](#golden)
    * [var largeUnmarshalTests](#largeUnmarshalTests)
    * [var bench](#bench)
    * [var buf](#buf)
* [Types](#type)
    * [type digest struct](#digest)
        * [func (d *digest) MarshalBinary() ([]byte, error)](#digest.MarshalBinary)
        * [func (d *digest) UnmarshalBinary(b []byte) error](#digest.UnmarshalBinary)
        * [func (d *digest) Reset()](#digest.Reset)
        * [func (d *digest) Size() int](#digest.Size)
        * [func (d *digest) BlockSize() int](#digest.BlockSize)
        * [func (d *digest) Write(p []byte) (nn int, err error)](#digest.Write)
        * [func (d *digest) Sum(in []byte) []byte](#digest.Sum)
        * [func (d *digest) checkSum() [Size]byte](#digest.checkSum)
        * [func (d *digest) ConstantTimeSum(in []byte) []byte](#digest.ConstantTimeSum)
        * [func (d *digest) constSum() [Size]byte](#digest.constSum)
    * [type sha1Test struct](#sha1Test)
    * [type unmarshalTest struct](#unmarshalTest)
* [Functions](#func)
    * [func init()](#init.sha1.go)
    * [func appendUint64(b []byte, x uint64) []byte](#appendUint64)
    * [func appendUint32(b []byte, x uint32) []byte](#appendUint32)
    * [func consumeUint64(b []byte) ([]byte, uint64)](#consumeUint64)
    * [func consumeUint32(b []byte) ([]byte, uint32)](#consumeUint32)
    * [func New() hash.Hash](#New)
    * [func Sum(data []byte) [Size]byte](#Sum)
    * [func blockGeneric(dig *digest, p []byte)](#blockGeneric)
    * [func blockAVX2(dig *digest, p []byte)](#blockAVX2)
    * [func blockAMD64(dig *digest, p []byte)](#blockAMD64)
    * [func block(dig *digest, p []byte)](#block)
    * [func TestGolden(t *testing.T)](#TestGolden)
    * [func TestGoldenMarshal(t *testing.T)](#TestGoldenMarshal)
    * [func TestSize(t *testing.T)](#TestSize)
    * [func TestBlockSize(t *testing.T)](#TestBlockSize)
    * [func TestBlockGeneric(t *testing.T)](#TestBlockGeneric)
    * [func safeSum(h hash.Hash) (sum []byte, err error)](#safeSum)
    * [func TestLargeHashes(t *testing.T)](#TestLargeHashes)
    * [func benchmarkSize(b *testing.B, size int)](#benchmarkSize)
    * [func BenchmarkHash8Bytes(b *testing.B)](#BenchmarkHash8Bytes)
    * [func BenchmarkHash320Bytes(b *testing.B)](#BenchmarkHash320Bytes)
    * [func BenchmarkHash1K(b *testing.B)](#BenchmarkHash1K)
    * [func BenchmarkHash8K(b *testing.B)](#BenchmarkHash8K)


## <a id="const" href="#const">Constants</a>

### <a id="Size" href="#Size">const Size</a>

```
searchKey: sha1.Size
```

```Go
const Size = 20
```

The size of a SHA-1 checksum in bytes. 

### <a id="BlockSize" href="#BlockSize">const BlockSize</a>

```
searchKey: sha1.BlockSize
```

```Go
const BlockSize = 64
```

The blocksize of SHA-1 in bytes. 

### <a id="chunk" href="#chunk">const chunk</a>

```
searchKey: sha1.chunk
tags: [private]
```

```Go
const chunk = 64
```

### <a id="init0" href="#init0">const init0</a>

```
searchKey: sha1.init0
tags: [private]
```

```Go
const init0 = 0x67452301
```

### <a id="init1" href="#init1">const init1</a>

```
searchKey: sha1.init1
tags: [private]
```

```Go
const init1 = 0xEFCDAB89
```

### <a id="init2" href="#init2">const init2</a>

```
searchKey: sha1.init2
tags: [private]
```

```Go
const init2 = 0x98BADCFE
```

### <a id="init3" href="#init3">const init3</a>

```
searchKey: sha1.init3
tags: [private]
```

```Go
const init3 = 0x10325476
```

### <a id="init4" href="#init4">const init4</a>

```
searchKey: sha1.init4
tags: [private]
```

```Go
const init4 = 0xC3D2E1F0
```

### <a id="magic" href="#magic">const magic</a>

```
searchKey: sha1.magic
tags: [private]
```

```Go
const magic = "sha\x01"
```

### <a id="marshaledSize" href="#marshaledSize">const marshaledSize</a>

```
searchKey: sha1.marshaledSize
tags: [private]
```

```Go
const marshaledSize = len(magic) + 5*4 + chunk + 8
```

### <a id="_K0" href="#_K0">const _K0</a>

```
searchKey: sha1._K0
tags: [private]
```

```Go
const _K0 = 0x5A827999
```

### <a id="_K1" href="#_K1">const _K1</a>

```
searchKey: sha1._K1
tags: [private]
```

```Go
const _K1 = 0x6ED9EBA1
```

### <a id="_K2" href="#_K2">const _K2</a>

```
searchKey: sha1._K2
tags: [private]
```

```Go
const _K2 = 0x8F1BBCDC
```

### <a id="_K3" href="#_K3">const _K3</a>

```
searchKey: sha1._K3
tags: [private]
```

```Go
const _K3 = 0xCA62C1D6
```

## <a id="var" href="#var">Variables</a>

### <a id="useAVX2" href="#useAVX2">var useAVX2</a>

```
searchKey: sha1.useAVX2
tags: [private]
```

```Go
var useAVX2 = cpu.X86.HasAVX2 && cpu.X86.HasBMI1 && cpu.X86.HasBMI2
```

### <a id="golden" href="#golden">var golden</a>

```
searchKey: sha1.golden
tags: [private]
```

```Go
var golden = ...
```

### <a id="largeUnmarshalTests" href="#largeUnmarshalTests">var largeUnmarshalTests</a>

```
searchKey: sha1.largeUnmarshalTests
tags: [private]
```

```Go
var largeUnmarshalTests = ...
```

### <a id="bench" href="#bench">var bench</a>

```
searchKey: sha1.bench
tags: [private]
```

```Go
var bench = New()
```

### <a id="buf" href="#buf">var buf</a>

```
searchKey: sha1.buf
tags: [private]
```

```Go
var buf = make([]byte, 8192)
```

## <a id="type" href="#type">Types</a>

### <a id="digest" href="#digest">type digest struct</a>

```
searchKey: sha1.digest
tags: [private]
```

```Go
type digest struct {
	h   [5]uint32
	x   [chunk]byte
	nx  int
	len uint64
}
```

digest represents the partial evaluation of a checksum. 

#### <a id="digest.MarshalBinary" href="#digest.MarshalBinary">func (d *digest) MarshalBinary() ([]byte, error)</a>

```
searchKey: sha1.digest.MarshalBinary
tags: [private]
```

```Go
func (d *digest) MarshalBinary() ([]byte, error)
```

#### <a id="digest.UnmarshalBinary" href="#digest.UnmarshalBinary">func (d *digest) UnmarshalBinary(b []byte) error</a>

```
searchKey: sha1.digest.UnmarshalBinary
tags: [private]
```

```Go
func (d *digest) UnmarshalBinary(b []byte) error
```

#### <a id="digest.Reset" href="#digest.Reset">func (d *digest) Reset()</a>

```
searchKey: sha1.digest.Reset
tags: [private]
```

```Go
func (d *digest) Reset()
```

#### <a id="digest.Size" href="#digest.Size">func (d *digest) Size() int</a>

```
searchKey: sha1.digest.Size
tags: [private]
```

```Go
func (d *digest) Size() int
```

#### <a id="digest.BlockSize" href="#digest.BlockSize">func (d *digest) BlockSize() int</a>

```
searchKey: sha1.digest.BlockSize
tags: [private]
```

```Go
func (d *digest) BlockSize() int
```

#### <a id="digest.Write" href="#digest.Write">func (d *digest) Write(p []byte) (nn int, err error)</a>

```
searchKey: sha1.digest.Write
tags: [private]
```

```Go
func (d *digest) Write(p []byte) (nn int, err error)
```

#### <a id="digest.Sum" href="#digest.Sum">func (d *digest) Sum(in []byte) []byte</a>

```
searchKey: sha1.digest.Sum
tags: [private]
```

```Go
func (d *digest) Sum(in []byte) []byte
```

#### <a id="digest.checkSum" href="#digest.checkSum">func (d *digest) checkSum() [Size]byte</a>

```
searchKey: sha1.digest.checkSum
tags: [private]
```

```Go
func (d *digest) checkSum() [Size]byte
```

#### <a id="digest.ConstantTimeSum" href="#digest.ConstantTimeSum">func (d *digest) ConstantTimeSum(in []byte) []byte</a>

```
searchKey: sha1.digest.ConstantTimeSum
tags: [private]
```

```Go
func (d *digest) ConstantTimeSum(in []byte) []byte
```

ConstantTimeSum computes the same result of Sum() but in constant time 

#### <a id="digest.constSum" href="#digest.constSum">func (d *digest) constSum() [Size]byte</a>

```
searchKey: sha1.digest.constSum
tags: [private]
```

```Go
func (d *digest) constSum() [Size]byte
```

### <a id="sha1Test" href="#sha1Test">type sha1Test struct</a>

```
searchKey: sha1.sha1Test
tags: [private]
```

```Go
type sha1Test struct {
	out       string
	in        string
	halfState string // marshaled hash state after first half of in written, used by TestGoldenMarshal
}
```

### <a id="unmarshalTest" href="#unmarshalTest">type unmarshalTest struct</a>

```
searchKey: sha1.unmarshalTest
tags: [private]
```

```Go
type unmarshalTest struct {
	state string
	sum   string
}
```

Tests for unmarshaling hashes that have hashed a large amount of data The initial hash generation is omitted from the test, because it takes a long time. The test contains some already-generated states, and their expected sums Tests a problem that is outlined in GitHub issue #29543 The problem is triggered when an amount of data has been hashed for which the data length has a 1 in the 32nd bit. When casted to int, this changes the sign of the value, and causes the modulus operation to return a different result. 

## <a id="func" href="#func">Functions</a>

### <a id="init.sha1.go" href="#init.sha1.go">func init()</a>

```
searchKey: sha1.init
tags: [private]
```

```Go
func init()
```

### <a id="appendUint64" href="#appendUint64">func appendUint64(b []byte, x uint64) []byte</a>

```
searchKey: sha1.appendUint64
tags: [private]
```

```Go
func appendUint64(b []byte, x uint64) []byte
```

### <a id="appendUint32" href="#appendUint32">func appendUint32(b []byte, x uint32) []byte</a>

```
searchKey: sha1.appendUint32
tags: [private]
```

```Go
func appendUint32(b []byte, x uint32) []byte
```

### <a id="consumeUint64" href="#consumeUint64">func consumeUint64(b []byte) ([]byte, uint64)</a>

```
searchKey: sha1.consumeUint64
tags: [private]
```

```Go
func consumeUint64(b []byte) ([]byte, uint64)
```

### <a id="consumeUint32" href="#consumeUint32">func consumeUint32(b []byte) ([]byte, uint32)</a>

```
searchKey: sha1.consumeUint32
tags: [private]
```

```Go
func consumeUint32(b []byte) ([]byte, uint32)
```

### <a id="New" href="#New">func New() hash.Hash</a>

```
searchKey: sha1.New
```

```Go
func New() hash.Hash
```

New returns a new hash.Hash computing the SHA1 checksum. The Hash also implements encoding.BinaryMarshaler and encoding.BinaryUnmarshaler to marshal and unmarshal the internal state of the hash. 

### <a id="Sum" href="#Sum">func Sum(data []byte) [Size]byte</a>

```
searchKey: sha1.Sum
```

```Go
func Sum(data []byte) [Size]byte
```

Sum returns the SHA-1 checksum of the data. 

### <a id="blockGeneric" href="#blockGeneric">func blockGeneric(dig *digest, p []byte)</a>

```
searchKey: sha1.blockGeneric
tags: [private]
```

```Go
func blockGeneric(dig *digest, p []byte)
```

blockGeneric is a portable, pure Go version of the SHA-1 block step. It's used by sha1block_generic.go and tests. 

### <a id="blockAVX2" href="#blockAVX2">func blockAVX2(dig *digest, p []byte)</a>

```
searchKey: sha1.blockAVX2
tags: [private]
```

```Go
func blockAVX2(dig *digest, p []byte)
```

### <a id="blockAMD64" href="#blockAMD64">func blockAMD64(dig *digest, p []byte)</a>

```
searchKey: sha1.blockAMD64
tags: [private]
```

```Go
func blockAMD64(dig *digest, p []byte)
```

### <a id="block" href="#block">func block(dig *digest, p []byte)</a>

```
searchKey: sha1.block
tags: [private]
```

```Go
func block(dig *digest, p []byte)
```

### <a id="TestGolden" href="#TestGolden">func TestGolden(t *testing.T)</a>

```
searchKey: sha1.TestGolden
tags: [private]
```

```Go
func TestGolden(t *testing.T)
```

### <a id="TestGoldenMarshal" href="#TestGoldenMarshal">func TestGoldenMarshal(t *testing.T)</a>

```
searchKey: sha1.TestGoldenMarshal
tags: [private]
```

```Go
func TestGoldenMarshal(t *testing.T)
```

### <a id="TestSize" href="#TestSize">func TestSize(t *testing.T)</a>

```
searchKey: sha1.TestSize
tags: [private]
```

```Go
func TestSize(t *testing.T)
```

### <a id="TestBlockSize" href="#TestBlockSize">func TestBlockSize(t *testing.T)</a>

```
searchKey: sha1.TestBlockSize
tags: [private]
```

```Go
func TestBlockSize(t *testing.T)
```

### <a id="TestBlockGeneric" href="#TestBlockGeneric">func TestBlockGeneric(t *testing.T)</a>

```
searchKey: sha1.TestBlockGeneric
tags: [private]
```

```Go
func TestBlockGeneric(t *testing.T)
```

Tests that blockGeneric (pure Go) and block (in assembly for some architectures) match. 

### <a id="safeSum" href="#safeSum">func safeSum(h hash.Hash) (sum []byte, err error)</a>

```
searchKey: sha1.safeSum
tags: [private]
```

```Go
func safeSum(h hash.Hash) (sum []byte, err error)
```

### <a id="TestLargeHashes" href="#TestLargeHashes">func TestLargeHashes(t *testing.T)</a>

```
searchKey: sha1.TestLargeHashes
tags: [private]
```

```Go
func TestLargeHashes(t *testing.T)
```

### <a id="benchmarkSize" href="#benchmarkSize">func benchmarkSize(b *testing.B, size int)</a>

```
searchKey: sha1.benchmarkSize
tags: [private]
```

```Go
func benchmarkSize(b *testing.B, size int)
```

### <a id="BenchmarkHash8Bytes" href="#BenchmarkHash8Bytes">func BenchmarkHash8Bytes(b *testing.B)</a>

```
searchKey: sha1.BenchmarkHash8Bytes
tags: [private]
```

```Go
func BenchmarkHash8Bytes(b *testing.B)
```

### <a id="BenchmarkHash320Bytes" href="#BenchmarkHash320Bytes">func BenchmarkHash320Bytes(b *testing.B)</a>

```
searchKey: sha1.BenchmarkHash320Bytes
tags: [private]
```

```Go
func BenchmarkHash320Bytes(b *testing.B)
```

### <a id="BenchmarkHash1K" href="#BenchmarkHash1K">func BenchmarkHash1K(b *testing.B)</a>

```
searchKey: sha1.BenchmarkHash1K
tags: [private]
```

```Go
func BenchmarkHash1K(b *testing.B)
```

### <a id="BenchmarkHash8K" href="#BenchmarkHash8K">func BenchmarkHash8K(b *testing.B)</a>

```
searchKey: sha1.BenchmarkHash8K
tags: [private]
```

```Go
func BenchmarkHash8K(b *testing.B)
```

