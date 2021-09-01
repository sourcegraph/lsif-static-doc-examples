# Package md5

Package md5 implements the MD5 hash algorithm as defined in RFC 1321. 

MD5 is cryptographically broken and should not be used for secure applications. 

## Index

* [Constants](#const)
    * [const BlockSize](#BlockSize)
    * [const Size](#Size)
    * [const haveAsm](#haveAsm)
    * [const init0](#init0)
    * [const init1](#init1)
    * [const init2](#init2)
    * [const init3](#init3)
    * [const magic](#magic)
    * [const marshaledSize](#marshaledSize)
* [Variables](#var)
    * [var bench](#bench)
    * [var buf](#buf)
    * [var golden](#golden)
    * [var largeUnmarshalTests](#largeUnmarshalTests)
    * [var sum](#sum)
* [Types](#type)
    * [type digest struct](#digest)
        * [func (d *digest) BlockSize() int](#digest.BlockSize)
        * [func (d *digest) MarshalBinary() ([]byte, error)](#digest.MarshalBinary)
        * [func (d *digest) Reset()](#digest.Reset)
        * [func (d *digest) Size() int](#digest.Size)
        * [func (d *digest) Sum(in []byte) []byte](#digest.Sum)
        * [func (d *digest) UnmarshalBinary(b []byte) error](#digest.UnmarshalBinary)
        * [func (d *digest) Write(p []byte) (nn int, err error)](#digest.Write)
        * [func (d *digest) checkSum() [Size]byte](#digest.checkSum)
    * [type md5Test struct](#md5Test)
    * [type unmarshalTest struct](#unmarshalTest)
* [Functions](#func)
    * [func BenchmarkHash128(b *testing.B)](#BenchmarkHash128)
    * [func BenchmarkHash1K(b *testing.B)](#BenchmarkHash1K)
    * [func BenchmarkHash1KUnaligned(b *testing.B)](#BenchmarkHash1KUnaligned)
    * [func BenchmarkHash1M(b *testing.B)](#BenchmarkHash1M)
    * [func BenchmarkHash256(b *testing.B)](#BenchmarkHash256)
    * [func BenchmarkHash512(b *testing.B)](#BenchmarkHash512)
    * [func BenchmarkHash64(b *testing.B)](#BenchmarkHash64)
    * [func BenchmarkHash8Bytes(b *testing.B)](#BenchmarkHash8Bytes)
    * [func BenchmarkHash8BytesUnaligned(b *testing.B)](#BenchmarkHash8BytesUnaligned)
    * [func BenchmarkHash8K(b *testing.B)](#BenchmarkHash8K)
    * [func BenchmarkHash8KUnaligned(b *testing.B)](#BenchmarkHash8KUnaligned)
    * [func BenchmarkHash8M(b *testing.B)](#BenchmarkHash8M)
    * [func New() hash.Hash](#New)
    * [func Sum(data []byte) [Size]byte](#Sum)
    * [func TestBlockGeneric(t *testing.T)](#TestBlockGeneric)
    * [func TestGolden(t *testing.T)](#TestGolden)
    * [func TestGoldenMarshal(t *testing.T)](#TestGoldenMarshal)
    * [func TestLarge(t *testing.T)](#TestLarge)
    * [func TestLargeHashes(t *testing.T)](#TestLargeHashes)
    * [func appendUint32(b []byte, x uint32) []byte](#appendUint32)
    * [func appendUint64(b []byte, x uint64) []byte](#appendUint64)
    * [func benchmarkSize(b *testing.B, size int, unaligned bool)](#benchmarkSize)
    * [func block(dig *digest, p []byte)](#block)
    * [func blockGeneric(dig *digest, p []byte)](#blockGeneric)
    * [func consumeUint32(b []byte) ([]byte, uint32)](#consumeUint32)
    * [func consumeUint64(b []byte) ([]byte, uint64)](#consumeUint64)
    * [func init()](#init.md5.go)
    * [func safeSum(h hash.Hash) (sum []byte, err error)](#safeSum)


## <a id="const" href="#const">Constants</a>

### <a id="BlockSize" href="#BlockSize">const BlockSize</a>

```
searchKey: md5.BlockSize
tags: [constant number]
```

```Go
const BlockSize = 64
```

The blocksize of MD5 in bytes. 

### <a id="Size" href="#Size">const Size</a>

```
searchKey: md5.Size
tags: [constant number]
```

```Go
const Size = 16
```

The size of an MD5 checksum in bytes. 

### <a id="haveAsm" href="#haveAsm">const haveAsm</a>

```
searchKey: md5.haveAsm
tags: [constant boolean private]
```

```Go
const haveAsm = true
```

### <a id="init0" href="#init0">const init0</a>

```
searchKey: md5.init0
tags: [constant number private]
```

```Go
const init0 = 0x67452301
```

### <a id="init1" href="#init1">const init1</a>

```
searchKey: md5.init1
tags: [constant number private]
```

```Go
const init1 = 0xEFCDAB89
```

### <a id="init2" href="#init2">const init2</a>

```
searchKey: md5.init2
tags: [constant number private]
```

```Go
const init2 = 0x98BADCFE
```

### <a id="init3" href="#init3">const init3</a>

```
searchKey: md5.init3
tags: [constant number private]
```

```Go
const init3 = 0x10325476
```

### <a id="magic" href="#magic">const magic</a>

```
searchKey: md5.magic
tags: [constant string private]
```

```Go
const magic = "md5\x01"
```

### <a id="marshaledSize" href="#marshaledSize">const marshaledSize</a>

```
searchKey: md5.marshaledSize
tags: [constant number private]
```

```Go
const marshaledSize = len(magic) + 4*4 + BlockSize + 8
```

## <a id="var" href="#var">Variables</a>

### <a id="bench" href="#bench">var bench</a>

```
searchKey: md5.bench
tags: [variable interface private]
```

```Go
var bench = New()
```

### <a id="buf" href="#buf">var buf</a>

```
searchKey: md5.buf
tags: [variable array number private]
```

```Go
var buf = make([]byte, 1024*1024*8+1)
```

### <a id="golden" href="#golden">var golden</a>

```
searchKey: md5.golden
tags: [variable array struct private]
```

```Go
var golden = ...
```

### <a id="largeUnmarshalTests" href="#largeUnmarshalTests">var largeUnmarshalTests</a>

```
searchKey: md5.largeUnmarshalTests
tags: [variable array struct private]
```

```Go
var largeUnmarshalTests = ...
```

### <a id="sum" href="#sum">var sum</a>

```
searchKey: md5.sum
tags: [variable array number private]
```

```Go
var sum = make([]byte, bench.Size())
```

## <a id="type" href="#type">Types</a>

### <a id="digest" href="#digest">type digest struct</a>

```
searchKey: md5.digest
tags: [struct private]
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

#### <a id="digest.BlockSize" href="#digest.BlockSize">func (d *digest) BlockSize() int</a>

```
searchKey: md5.digest.BlockSize
tags: [method private]
```

```Go
func (d *digest) BlockSize() int
```

#### <a id="digest.MarshalBinary" href="#digest.MarshalBinary">func (d *digest) MarshalBinary() ([]byte, error)</a>

```
searchKey: md5.digest.MarshalBinary
tags: [method private]
```

```Go
func (d *digest) MarshalBinary() ([]byte, error)
```

#### <a id="digest.Reset" href="#digest.Reset">func (d *digest) Reset()</a>

```
searchKey: md5.digest.Reset
tags: [method private]
```

```Go
func (d *digest) Reset()
```

#### <a id="digest.Size" href="#digest.Size">func (d *digest) Size() int</a>

```
searchKey: md5.digest.Size
tags: [method private]
```

```Go
func (d *digest) Size() int
```

#### <a id="digest.Sum" href="#digest.Sum">func (d *digest) Sum(in []byte) []byte</a>

```
searchKey: md5.digest.Sum
tags: [method private]
```

```Go
func (d *digest) Sum(in []byte) []byte
```

#### <a id="digest.UnmarshalBinary" href="#digest.UnmarshalBinary">func (d *digest) UnmarshalBinary(b []byte) error</a>

```
searchKey: md5.digest.UnmarshalBinary
tags: [method private]
```

```Go
func (d *digest) UnmarshalBinary(b []byte) error
```

#### <a id="digest.Write" href="#digest.Write">func (d *digest) Write(p []byte) (nn int, err error)</a>

```
searchKey: md5.digest.Write
tags: [method private]
```

```Go
func (d *digest) Write(p []byte) (nn int, err error)
```

#### <a id="digest.checkSum" href="#digest.checkSum">func (d *digest) checkSum() [Size]byte</a>

```
searchKey: md5.digest.checkSum
tags: [method private]
```

```Go
func (d *digest) checkSum() [Size]byte
```

### <a id="md5Test" href="#md5Test">type md5Test struct</a>

```
searchKey: md5.md5Test
tags: [struct private]
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
tags: [struct private]
```

```Go
type unmarshalTest struct {
	state string
	sum   string
}
```

Tests for unmarshaling hashes that have hashed a large amount of data The initial hash generation is omitted from the test, because it takes a long time. The test contains some already-generated states, and their expected sums Tests a problem that is outlined in GitHub issue #29541 The problem is triggered when an amount of data has been hashed for which the data length has a 1 in the 32nd bit. When casted to int, this changes the sign of the value, and causes the modulus operation to return a different result. 

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkHash128" href="#BenchmarkHash128">func BenchmarkHash128(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash128
tags: [function private benchmark]
```

```Go
func BenchmarkHash128(b *testing.B)
```

### <a id="BenchmarkHash1K" href="#BenchmarkHash1K">func BenchmarkHash1K(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash1K
tags: [function private benchmark]
```

```Go
func BenchmarkHash1K(b *testing.B)
```

### <a id="BenchmarkHash1KUnaligned" href="#BenchmarkHash1KUnaligned">func BenchmarkHash1KUnaligned(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash1KUnaligned
tags: [function private benchmark]
```

```Go
func BenchmarkHash1KUnaligned(b *testing.B)
```

### <a id="BenchmarkHash1M" href="#BenchmarkHash1M">func BenchmarkHash1M(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash1M
tags: [function private benchmark]
```

```Go
func BenchmarkHash1M(b *testing.B)
```

### <a id="BenchmarkHash256" href="#BenchmarkHash256">func BenchmarkHash256(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash256
tags: [function private benchmark]
```

```Go
func BenchmarkHash256(b *testing.B)
```

### <a id="BenchmarkHash512" href="#BenchmarkHash512">func BenchmarkHash512(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash512
tags: [function private benchmark]
```

```Go
func BenchmarkHash512(b *testing.B)
```

### <a id="BenchmarkHash64" href="#BenchmarkHash64">func BenchmarkHash64(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash64
tags: [function private benchmark]
```

```Go
func BenchmarkHash64(b *testing.B)
```

### <a id="BenchmarkHash8Bytes" href="#BenchmarkHash8Bytes">func BenchmarkHash8Bytes(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash8Bytes
tags: [function private benchmark]
```

```Go
func BenchmarkHash8Bytes(b *testing.B)
```

### <a id="BenchmarkHash8BytesUnaligned" href="#BenchmarkHash8BytesUnaligned">func BenchmarkHash8BytesUnaligned(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash8BytesUnaligned
tags: [function private benchmark]
```

```Go
func BenchmarkHash8BytesUnaligned(b *testing.B)
```

### <a id="BenchmarkHash8K" href="#BenchmarkHash8K">func BenchmarkHash8K(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash8K
tags: [function private benchmark]
```

```Go
func BenchmarkHash8K(b *testing.B)
```

### <a id="BenchmarkHash8KUnaligned" href="#BenchmarkHash8KUnaligned">func BenchmarkHash8KUnaligned(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash8KUnaligned
tags: [function private benchmark]
```

```Go
func BenchmarkHash8KUnaligned(b *testing.B)
```

### <a id="BenchmarkHash8M" href="#BenchmarkHash8M">func BenchmarkHash8M(b *testing.B)</a>

```
searchKey: md5.BenchmarkHash8M
tags: [function private benchmark]
```

```Go
func BenchmarkHash8M(b *testing.B)
```

### <a id="New" href="#New">func New() hash.Hash</a>

```
searchKey: md5.New
tags: [function]
```

```Go
func New() hash.Hash
```

New returns a new hash.Hash computing the MD5 checksum. The Hash also implements encoding.BinaryMarshaler and encoding.BinaryUnmarshaler to marshal and unmarshal the internal state of the hash. 

### <a id="Sum" href="#Sum">func Sum(data []byte) [Size]byte</a>

```
searchKey: md5.Sum
tags: [function]
```

```Go
func Sum(data []byte) [Size]byte
```

Sum returns the MD5 checksum of the data. 

### <a id="TestBlockGeneric" href="#TestBlockGeneric">func TestBlockGeneric(t *testing.T)</a>

```
searchKey: md5.TestBlockGeneric
tags: [function private test]
```

```Go
func TestBlockGeneric(t *testing.T)
```

Tests that blockGeneric (pure Go) and block (in assembly for amd64, 386, arm) match. 

### <a id="TestGolden" href="#TestGolden">func TestGolden(t *testing.T)</a>

```
searchKey: md5.TestGolden
tags: [function private test]
```

```Go
func TestGolden(t *testing.T)
```

### <a id="TestGoldenMarshal" href="#TestGoldenMarshal">func TestGoldenMarshal(t *testing.T)</a>

```
searchKey: md5.TestGoldenMarshal
tags: [function private test]
```

```Go
func TestGoldenMarshal(t *testing.T)
```

### <a id="TestLarge" href="#TestLarge">func TestLarge(t *testing.T)</a>

```
searchKey: md5.TestLarge
tags: [function private test]
```

```Go
func TestLarge(t *testing.T)
```

### <a id="TestLargeHashes" href="#TestLargeHashes">func TestLargeHashes(t *testing.T)</a>

```
searchKey: md5.TestLargeHashes
tags: [function private test]
```

```Go
func TestLargeHashes(t *testing.T)
```

### <a id="appendUint32" href="#appendUint32">func appendUint32(b []byte, x uint32) []byte</a>

```
searchKey: md5.appendUint32
tags: [function private]
```

```Go
func appendUint32(b []byte, x uint32) []byte
```

### <a id="appendUint64" href="#appendUint64">func appendUint64(b []byte, x uint64) []byte</a>

```
searchKey: md5.appendUint64
tags: [function private]
```

```Go
func appendUint64(b []byte, x uint64) []byte
```

### <a id="benchmarkSize" href="#benchmarkSize">func benchmarkSize(b *testing.B, size int, unaligned bool)</a>

```
searchKey: md5.benchmarkSize
tags: [function private]
```

```Go
func benchmarkSize(b *testing.B, size int, unaligned bool)
```

### <a id="block" href="#block">func block(dig *digest, p []byte)</a>

```
searchKey: md5.block
tags: [function private]
```

```Go
func block(dig *digest, p []byte)
```

### <a id="blockGeneric" href="#blockGeneric">func blockGeneric(dig *digest, p []byte)</a>

```
searchKey: md5.blockGeneric
tags: [function private]
```

```Go
func blockGeneric(dig *digest, p []byte)
```

### <a id="consumeUint32" href="#consumeUint32">func consumeUint32(b []byte) ([]byte, uint32)</a>

```
searchKey: md5.consumeUint32
tags: [function private]
```

```Go
func consumeUint32(b []byte) ([]byte, uint32)
```

### <a id="consumeUint64" href="#consumeUint64">func consumeUint64(b []byte) ([]byte, uint64)</a>

```
searchKey: md5.consumeUint64
tags: [function private]
```

```Go
func consumeUint64(b []byte) ([]byte, uint64)
```

### <a id="init.md5.go" href="#init.md5.go">func init()</a>

```
searchKey: md5.init
tags: [function private]
```

```Go
func init()
```

### <a id="safeSum" href="#safeSum">func safeSum(h hash.Hash) (sum []byte, err error)</a>

```
searchKey: md5.safeSum
tags: [function private]
```

```Go
func safeSum(h hash.Hash) (sum []byte, err error)
```

