# Package md5

Package md5 implements the MD5 hash algorithm as defined in RFC 1321. 

MD5 is cryptographically broken and should not be used for secure applications. 

## Index

* [Constants](#const)
    * [const Size](#Size)
    * [const BlockSize](#BlockSize)
    * [const init0](#init0)
    * [const init1](#init1)
    * [const init2](#init2)
    * [const init3](#init3)
    * [const magic](#magic)
    * [const marshaledSize](#marshaledSize)
    * [const haveAsm](#haveAsm)
* [Variables](#var)
    * [var golden](#golden)
    * [var largeUnmarshalTests](#largeUnmarshalTests)
    * [var bench](#bench)
    * [var buf](#buf)
    * [var sum](#sum)
* [Types](#type)
    * [type digest struct](#digest)
        * [func (d *digest) Reset()](#digest.Reset)
        * [func (d *digest) MarshalBinary() ([]byte, error)](#digest.MarshalBinary)
        * [func (d *digest) UnmarshalBinary(b []byte) error](#digest.UnmarshalBinary)
        * [func (d *digest) Size() int](#digest.Size)
        * [func (d *digest) BlockSize() int](#digest.BlockSize)
        * [func (d *digest) Write(p []byte) (nn int, err error)](#digest.Write)
        * [func (d *digest) Sum(in []byte) []byte](#digest.Sum)
        * [func (d *digest) checkSum() [Size]byte](#digest.checkSum)
    * [type md5Test struct](#md5Test)
    * [type unmarshalTest struct](#unmarshalTest)
* [Functions](#func)
    * [func init()](#init)
    * [func appendUint64(b []byte, x uint64) []byte](#appendUint64)
    * [func appendUint32(b []byte, x uint32) []byte](#appendUint32)
    * [func consumeUint64(b []byte) ([]byte, uint64)](#consumeUint64)
    * [func consumeUint32(b []byte) ([]byte, uint32)](#consumeUint32)
    * [func New() hash.Hash](#New)
    * [func Sum(data []byte) [Size]byte](#Sum)
    * [func blockGeneric(dig *digest, p []byte)](#blockGeneric)
    * [func block(dig *digest, p []byte)](#block)
    * [func TestGolden(t *testing.T)](#TestGolden)
    * [func TestGoldenMarshal(t *testing.T)](#TestGoldenMarshal)
    * [func TestLarge(t *testing.T)](#TestLarge)
    * [func TestBlockGeneric(t *testing.T)](#TestBlockGeneric)
    * [func safeSum(h hash.Hash) (sum []byte, err error)](#safeSum)
    * [func TestLargeHashes(t *testing.T)](#TestLargeHashes)
    * [func benchmarkSize(b *testing.B, size int, unaligned bool)](#benchmarkSize)
    * [func BenchmarkHash8Bytes(b *testing.B)](#BenchmarkHash8Bytes)
    * [func BenchmarkHash64(b *testing.B)](#BenchmarkHash64)
    * [func BenchmarkHash128(b *testing.B)](#BenchmarkHash128)
    * [func BenchmarkHash256(b *testing.B)](#BenchmarkHash256)
    * [func BenchmarkHash512(b *testing.B)](#BenchmarkHash512)
    * [func BenchmarkHash1K(b *testing.B)](#BenchmarkHash1K)
    * [func BenchmarkHash8K(b *testing.B)](#BenchmarkHash8K)
    * [func BenchmarkHash1M(b *testing.B)](#BenchmarkHash1M)
    * [func BenchmarkHash8M(b *testing.B)](#BenchmarkHash8M)
    * [func BenchmarkHash8BytesUnaligned(b *testing.B)](#BenchmarkHash8BytesUnaligned)
    * [func BenchmarkHash1KUnaligned(b *testing.B)](#BenchmarkHash1KUnaligned)
    * [func BenchmarkHash8KUnaligned(b *testing.B)](#BenchmarkHash8KUnaligned)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="Size" href="#Size">const Size</a>

```
searchKey: md5.Size
tags: [exported]
```

```Go
const Size = 16
```

The size of an MD5 checksum in bytes. 

### <a id="BlockSize" href="#BlockSize">const BlockSize</a>

```
searchKey: md5.BlockSize
tags: [exported]
```

```Go
const BlockSize = 64
```

The blocksize of MD5 in bytes. 

### <a id="init0" href="#init0">const init0</a>

```
searchKey: md5.init0
```

```Go
const init0 = 0x67452301
```

### <a id="init1" href="#init1">const init1</a>

```
searchKey: md5.init1
```

```Go
const init1 = 0xEFCDAB89
```

### <a id="init2" href="#init2">const init2</a>

```
searchKey: md5.init2
```

```Go
const init2 = 0x98BADCFE
```

### <a id="init3" href="#init3">const init3</a>

```
searchKey: md5.init3
```

```Go
const init3 = 0x10325476
```

### <a id="magic" href="#magic">const magic</a>

```
searchKey: md5.magic
```

```Go
const magic = "md5\x01"
```

### <a id="marshaledSize" href="#marshaledSize">const marshaledSize</a>

```
searchKey: md5.marshaledSize
```

```Go
const marshaledSize = len(magic) + 4*4 + BlockSize + 8
```

### <a id="haveAsm" href="#haveAsm">const haveAsm</a>

```
searchKey: md5.haveAsm
```

```Go
const haveAsm = true
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="golden" href="#golden">var golden</a>

```
searchKey: md5.golden
```

```Go
var golden = ...
```

### <a id="largeUnmarshalTests" href="#largeUnmarshalTests">var largeUnmarshalTests</a>

```
searchKey: md5.largeUnmarshalTests
```

```Go
var largeUnmarshalTests = ...
```

### <a id="bench" href="#bench">var bench</a>

```
searchKey: md5.bench
```

```Go
var bench = New()
```

### <a id="buf" href="#buf">var buf</a>

```
searchKey: md5.buf
```

```Go
var buf = make([]byte, 1024*1024*8+1)
```

### <a id="sum" href="#sum">var sum</a>

```
searchKey: md5.sum
```

```Go
var sum = make([]byte, bench.Size())
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="digest" href="#digest">type digest struct</a>

```
searchKey: md5.digest
```

```Go
type digest struct {
	s   [4]uint32
	x   [BlockSize]byte
	nx  int
	len uint64
}
```

digest represents the partial evaluation of a checksum. 

#### <a id="digest.Reset" href="#digest.Reset">func (d *digest) Reset()</a>

```
searchKey: md5.digest.Reset
```

```Go
func (d *digest) Reset()
```

#### <a id="digest.MarshalBinary" href="#digest.MarshalBinary">func (d *digest) MarshalBinary() ([]byte, error)</a>

```
searchKey: md5.digest.MarshalBinary
```

```Go
func (d *digest) MarshalBinary() ([]byte, error)
```

#### <a id="digest.UnmarshalBinary" href="#digest.UnmarshalBinary">func (d *digest) UnmarshalBinary(b []byte) error</a>

```
searchKey: md5.digest.UnmarshalBinary
```

```Go
func (d *digest) UnmarshalBinary(b []byte) error
```

#### <a id="digest.Size" href="#digest.Size">func (d *digest) Size() int</a>

```
searchKey: md5.digest.Size
```

```Go
func (d *digest) Size() int
```

#### <a id="digest.BlockSize" href="#digest.BlockSize">func (d *digest) BlockSize() int</a>

```
searchKey: md5.digest.BlockSize
```

```Go
func (d *digest) BlockSize() int
```

#### <a id="digest.Write" href="#digest.Write">func (d *digest) Write(p []byte) (nn int, err error)</a>

```
searchKey: md5.digest.Write
```

```Go
func (d *digest) Write(p []byte) (nn int, err error)
```

#### <a id="digest.Sum" href="#digest.Sum">func (d *digest) Sum(in []byte) []byte</a>

```
searchKey: md5.digest.Sum
```

```Go
func (d *digest) Sum(in []byte) []byte
```

#### <a id="digest.checkSum" href="#digest.checkSum">func (d *digest) checkSum() [Size]byte</a>

```
searchKey: md5.digest.checkSum
```

```Go
func (d *digest) checkSum() [Size]byte
```

### <a id="md5Test" href="#md5Test">type md5Test struct</a>

```
searchKey: md5.md5Test
```

```Go
type md5Test struct {
	out       string
	in        string
	halfState string // marshaled hash state after first half of in written, used by TestGoldenMarshal
}
```

### <a id="unmarshalTest" href="#unmarshalTest">type unmarshalTest struct</a>

```
searchKey: md5.unmarshalTest
```

```Go
type unmarshalTest struct {
	state string
	sum   string
}
```

Tests for unmarshaling hashes that have hashed a large amount of data The initial hash generation is omitted from the test, because it takes a long time. The test contains some already-generated states, and their expected sums Tests a problem that is outlined in GitHub issue #29541 The problem is triggered when an amount of data has been hashed for which the data length has a 1 in the 32nd bit. When casted to int, this changes the sign of the value, and causes the modulus operation to return a different result. 

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="init" href="#init">func init()</a>

```
searchKey: md5.init
```

```Go
func init()
```

### <a id="appendUint64" href="#appendUint64">func appendUint64(b []byte, x uint64) []byte</a>

```
searchKey: md5.appendUint64
```

```Go
func appendUint64(b []byte, x uint64) []byte
```

### <a id="appendUint32" href="#appendUint32">func appendUint32(b []byte, x uint32) []byte</a>

```
searchKey: md5.appendUint32
```

```Go
func appendUint32(b []byte, x uint32) []byte
```

### <a id="consumeUint64" href="#consumeUint64">func consumeUint64(b []byte) ([]byte, uint64)</a>

```
searchKey: md5.consumeUint64
```

```Go
func consumeUint64(b []byte) ([]byte, uint64)
```

### <a id="consumeUint32" href="#consumeUint32">func consumeUint32(b []byte) ([]byte, uint32)</a>

```
searchKey: md5.consumeUint32
```

```Go
func consumeUint32(b []byte) ([]byte, uint32)
```

### <a id="New" href="#New">func New() hash.Hash</a>

```
searchKey: md5.New
tags: [exported]
```

```Go
func New() hash.Hash
```

New returns a new hash.Hash computing the MD5 checksum. The Hash also implements encoding.BinaryMarshaler and encoding.BinaryUnmarshaler to marshal and unmarshal the internal state of the hash. 

### <a id="Sum" href="#Sum">func Sum(data []byte) [Size]byte</a>

```
searchKey: md5.Sum
tags: [exported]
```

```Go
func Sum(data []byte) [Size]byte
```

Sum returns the MD5 checksum of the data. 

### <a id="blockGeneric" href="#blockGeneric">func blockGeneric(dig *digest, p []byte)</a>

```
searchKey: md5.blockGeneric
```

```Go
func blockGeneric(dig *digest, p []byte)
```

### <a id="block" href="#block">func block(dig *digest, p []byte)</a>

```
searchKey: md5.block
```

```Go
func block(dig *digest, p []byte)
```

### <a id="TestGolden" href="#TestGolden">func TestGolden(t *testing.T)</a>

```
searchKey: md5.TestGolden
```

```Go
func TestGolden(t *testing.T)
```

### <a id="TestGoldenMarshal" href="#TestGoldenMarshal">func TestGoldenMarshal(t *testing.T)</a>

```
searchKey: md5.TestGoldenMarshal
```

```Go
func TestGoldenMarshal(t *testing.T)
```

### <a id="TestLarge" href="#TestLarge">func TestLarge(t *testing.T)</a>

```
searchKey: md5.TestLarge
```

```Go
func TestLarge(t *testing.T)
```

### <a id="TestBlockGeneric" href="#TestBlockGeneric">func TestBlockGeneric(t *testing.T)</a>

```
searchKey: md5.TestBlockGeneric
```

```Go
func TestBlockGeneric(t *testing.T)
```

Tests that blockGeneric (pure Go) and block (in assembly for amd64, 386, arm) match. 

### <a id="safeSum" href="#safeSum">func safeSum(h hash.Hash) (sum []byte, err error)</a>

```
searchKey: md5.safeSum
```

```Go
func safeSum(h hash.Hash) (sum []byte, err error)
```

### <a id="TestLargeHashes" href="#TestLargeHashes">func TestLargeHashes(t *testing.T)</a>

```
searchKey: md5.TestLargeHashes
```

```Go
func TestLargeHashes(t *testing.T)
```

### <a id="benchmarkSize" href="#benchmarkSize">func benchmarkSize(b *testing.B, size int, unaligned bool)</a>

```
searchKey: md5.benchmarkSize
```

```Go
func benchmarkSize(b *testing.B, size int, unaligned bool)
```

### <a id="BenchmarkHash8Bytes" href="#BenchmarkHash8Bytes">func BenchmarkHash8Bytes(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash8Bytes
```

```Go
func BenchmarkHash8Bytes(b *testing.B)
```

### <a id="BenchmarkHash64" href="#BenchmarkHash64">func BenchmarkHash64(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash64
```

```Go
func BenchmarkHash64(b *testing.B)
```

### <a id="BenchmarkHash128" href="#BenchmarkHash128">func BenchmarkHash128(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash128
```

```Go
func BenchmarkHash128(b *testing.B)
```

### <a id="BenchmarkHash256" href="#BenchmarkHash256">func BenchmarkHash256(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash256
```

```Go
func BenchmarkHash256(b *testing.B)
```

### <a id="BenchmarkHash512" href="#BenchmarkHash512">func BenchmarkHash512(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash512
```

```Go
func BenchmarkHash512(b *testing.B)
```

### <a id="BenchmarkHash1K" href="#BenchmarkHash1K">func BenchmarkHash1K(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash1K
```

```Go
func BenchmarkHash1K(b *testing.B)
```

### <a id="BenchmarkHash8K" href="#BenchmarkHash8K">func BenchmarkHash8K(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash8K
```

```Go
func BenchmarkHash8K(b *testing.B)
```

### <a id="BenchmarkHash1M" href="#BenchmarkHash1M">func BenchmarkHash1M(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash1M
```

```Go
func BenchmarkHash1M(b *testing.B)
```

### <a id="BenchmarkHash8M" href="#BenchmarkHash8M">func BenchmarkHash8M(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash8M
```

```Go
func BenchmarkHash8M(b *testing.B)
```

### <a id="BenchmarkHash8BytesUnaligned" href="#BenchmarkHash8BytesUnaligned">func BenchmarkHash8BytesUnaligned(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash8BytesUnaligned
```

```Go
func BenchmarkHash8BytesUnaligned(b *testing.B)
```

### <a id="BenchmarkHash1KUnaligned" href="#BenchmarkHash1KUnaligned">func BenchmarkHash1KUnaligned(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash1KUnaligned
```

```Go
func BenchmarkHash1KUnaligned(b *testing.B)
```

### <a id="BenchmarkHash8KUnaligned" href="#BenchmarkHash8KUnaligned">func BenchmarkHash8KUnaligned(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash8KUnaligned
```

```Go
func BenchmarkHash8KUnaligned(b *testing.B)
```

