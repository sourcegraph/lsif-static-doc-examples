# Package fnv

Package fnv implements FNV-1 and FNV-1a, non-cryptographic hash functions created by Glenn Fowler, Landon Curt Noll, and Phong Vo. See [https://en.wikipedia.org/wiki/Fowler-Noll-Vo_hash_function](https://en.wikipedia.org/wiki/Fowler-Noll-Vo_hash_function). 

All the hash.Hash implementations returned by this package also implement encoding.BinaryMarshaler and encoding.BinaryUnmarshaler to marshal and unmarshal the internal state of the hash. 

## Index

* [Constants](#const)
    * [const magic128](#magic128)
    * [const magic128a](#magic128a)
    * [const magic32](#magic32)
    * [const magic32a](#magic32a)
    * [const magic64](#magic64)
    * [const magic64a](#magic64a)
    * [const marshaledSize128](#marshaledSize128)
    * [const marshaledSize32](#marshaledSize32)
    * [const marshaledSize64](#marshaledSize64)
    * [const offset128Higher](#offset128Higher)
    * [const offset128Lower](#offset128Lower)
    * [const offset32](#offset32)
    * [const offset64](#offset64)
    * [const prime128Lower](#prime128Lower)
    * [const prime128Shift](#prime128Shift)
    * [const prime32](#prime32)
    * [const prime64](#prime64)
* [Variables](#var)
    * [var golden128](#golden128)
    * [var golden128a](#golden128a)
    * [var golden32](#golden32)
    * [var golden32a](#golden32a)
    * [var golden64](#golden64)
    * [var golden64a](#golden64a)
* [Types](#type)
    * [type golden struct](#golden)
    * [type sum128 [2]uint64](#sum128)
        * [func (s *sum128) BlockSize() int](#sum128.BlockSize)
        * [func (s *sum128) MarshalBinary() ([]byte, error)](#sum128.MarshalBinary)
        * [func (s *sum128) Reset()](#sum128.Reset)
        * [func (s *sum128) Size() int](#sum128.Size)
        * [func (s *sum128) Sum(in []byte) []byte](#sum128.Sum)
        * [func (s *sum128) UnmarshalBinary(b []byte) error](#sum128.UnmarshalBinary)
        * [func (s *sum128) Write(data []byte) (int, error)](#sum128.Write)
    * [type sum128a [2]uint64](#sum128a)
        * [func (s *sum128a) BlockSize() int](#sum128a.BlockSize)
        * [func (s *sum128a) MarshalBinary() ([]byte, error)](#sum128a.MarshalBinary)
        * [func (s *sum128a) Reset()](#sum128a.Reset)
        * [func (s *sum128a) Size() int](#sum128a.Size)
        * [func (s *sum128a) Sum(in []byte) []byte](#sum128a.Sum)
        * [func (s *sum128a) UnmarshalBinary(b []byte) error](#sum128a.UnmarshalBinary)
        * [func (s *sum128a) Write(data []byte) (int, error)](#sum128a.Write)
    * [type sum32 uint32](#sum32)
        * [func (s *sum32) BlockSize() int](#sum32.BlockSize)
        * [func (s *sum32) MarshalBinary() ([]byte, error)](#sum32.MarshalBinary)
        * [func (s *sum32) Reset()](#sum32.Reset)
        * [func (s *sum32) Size() int](#sum32.Size)
        * [func (s *sum32) Sum(in []byte) []byte](#sum32.Sum)
        * [func (s *sum32) Sum32() uint32](#sum32.Sum32)
        * [func (s *sum32) UnmarshalBinary(b []byte) error](#sum32.UnmarshalBinary)
        * [func (s *sum32) Write(data []byte) (int, error)](#sum32.Write)
    * [type sum32a uint32](#sum32a)
        * [func (s *sum32a) BlockSize() int](#sum32a.BlockSize)
        * [func (s *sum32a) MarshalBinary() ([]byte, error)](#sum32a.MarshalBinary)
        * [func (s *sum32a) Reset()](#sum32a.Reset)
        * [func (s *sum32a) Size() int](#sum32a.Size)
        * [func (s *sum32a) Sum(in []byte) []byte](#sum32a.Sum)
        * [func (s *sum32a) Sum32() uint32](#sum32a.Sum32)
        * [func (s *sum32a) UnmarshalBinary(b []byte) error](#sum32a.UnmarshalBinary)
        * [func (s *sum32a) Write(data []byte) (int, error)](#sum32a.Write)
    * [type sum64 uint64](#sum64)
        * [func (s *sum64) BlockSize() int](#sum64.BlockSize)
        * [func (s *sum64) MarshalBinary() ([]byte, error)](#sum64.MarshalBinary)
        * [func (s *sum64) Reset()](#sum64.Reset)
        * [func (s *sum64) Size() int](#sum64.Size)
        * [func (s *sum64) Sum(in []byte) []byte](#sum64.Sum)
        * [func (s *sum64) Sum64() uint64](#sum64.Sum64)
        * [func (s *sum64) UnmarshalBinary(b []byte) error](#sum64.UnmarshalBinary)
        * [func (s *sum64) Write(data []byte) (int, error)](#sum64.Write)
    * [type sum64a uint64](#sum64a)
        * [func (s *sum64a) BlockSize() int](#sum64a.BlockSize)
        * [func (s *sum64a) MarshalBinary() ([]byte, error)](#sum64a.MarshalBinary)
        * [func (s *sum64a) Reset()](#sum64a.Reset)
        * [func (s *sum64a) Size() int](#sum64a.Size)
        * [func (s *sum64a) Sum(in []byte) []byte](#sum64a.Sum)
        * [func (s *sum64a) Sum64() uint64](#sum64a.Sum64)
        * [func (s *sum64a) UnmarshalBinary(b []byte) error](#sum64a.UnmarshalBinary)
        * [func (s *sum64a) Write(data []byte) (int, error)](#sum64a.Write)
* [Functions](#func)
    * [func BenchmarkFnv128KB(b *testing.B)](#BenchmarkFnv128KB)
    * [func BenchmarkFnv128aKB(b *testing.B)](#BenchmarkFnv128aKB)
    * [func BenchmarkFnv32KB(b *testing.B)](#BenchmarkFnv32KB)
    * [func BenchmarkFnv32aKB(b *testing.B)](#BenchmarkFnv32aKB)
    * [func BenchmarkFnv64KB(b *testing.B)](#BenchmarkFnv64KB)
    * [func BenchmarkFnv64aKB(b *testing.B)](#BenchmarkFnv64aKB)
    * [func New128() hash.Hash](#New128)
    * [func New128a() hash.Hash](#New128a)
    * [func New32() hash.Hash32](#New32)
    * [func New32a() hash.Hash32](#New32a)
    * [func New64() hash.Hash64](#New64)
    * [func New64a() hash.Hash64](#New64a)
    * [func TestGolden128(t *testing.T)](#TestGolden128)
    * [func TestGolden128a(t *testing.T)](#TestGolden128a)
    * [func TestGolden32(t *testing.T)](#TestGolden32)
    * [func TestGolden32a(t *testing.T)](#TestGolden32a)
    * [func TestGolden64(t *testing.T)](#TestGolden64)
    * [func TestGolden64a(t *testing.T)](#TestGolden64a)
    * [func TestGoldenMarshal(t *testing.T)](#TestGoldenMarshal)
    * [func TestIntegrity128(t *testing.T)](#TestIntegrity128)
    * [func TestIntegrity128a(t *testing.T)](#TestIntegrity128a)
    * [func TestIntegrity32(t *testing.T)](#TestIntegrity32)
    * [func TestIntegrity32a(t *testing.T)](#TestIntegrity32a)
    * [func TestIntegrity64(t *testing.T)](#TestIntegrity64)
    * [func TestIntegrity64a(t *testing.T)](#TestIntegrity64a)
    * [func appendUint32(b []byte, x uint32) []byte](#appendUint32)
    * [func appendUint64(b []byte, x uint64) []byte](#appendUint64)
    * [func benchmarkKB(b *testing.B, h hash.Hash)](#benchmarkKB)
    * [func readUint32(b []byte) uint32](#readUint32)
    * [func readUint64(b []byte) uint64](#readUint64)
    * [func testGolden(t *testing.T, hash hash.Hash, gold []golden)](#testGolden)
    * [func testIntegrity(t *testing.T, h hash.Hash)](#testIntegrity)


## <a id="const" href="#const">Constants</a>

### <a id="magic128" href="#magic128">const magic128</a>

```
searchKey: fnv.magic128
tags: [constant string private]
```

```Go
const magic128 = "fnv\x05"
```

### <a id="magic128a" href="#magic128a">const magic128a</a>

```
searchKey: fnv.magic128a
tags: [constant string private]
```

```Go
const magic128a = "fnv\x06"
```

### <a id="magic32" href="#magic32">const magic32</a>

```
searchKey: fnv.magic32
tags: [constant string private]
```

```Go
const magic32 = "fnv\x01"
```

### <a id="magic32a" href="#magic32a">const magic32a</a>

```
searchKey: fnv.magic32a
tags: [constant string private]
```

```Go
const magic32a = "fnv\x02"
```

### <a id="magic64" href="#magic64">const magic64</a>

```
searchKey: fnv.magic64
tags: [constant string private]
```

```Go
const magic64 = "fnv\x03"
```

### <a id="magic64a" href="#magic64a">const magic64a</a>

```
searchKey: fnv.magic64a
tags: [constant string private]
```

```Go
const magic64a = "fnv\x04"
```

### <a id="marshaledSize128" href="#marshaledSize128">const marshaledSize128</a>

```
searchKey: fnv.marshaledSize128
tags: [constant number private]
```

```Go
const marshaledSize128 = len(magic128) + 8*2
```

### <a id="marshaledSize32" href="#marshaledSize32">const marshaledSize32</a>

```
searchKey: fnv.marshaledSize32
tags: [constant number private]
```

```Go
const marshaledSize32 = len(magic32) + 4
```

### <a id="marshaledSize64" href="#marshaledSize64">const marshaledSize64</a>

```
searchKey: fnv.marshaledSize64
tags: [constant number private]
```

```Go
const marshaledSize64 = len(magic64) + 8
```

### <a id="offset128Higher" href="#offset128Higher">const offset128Higher</a>

```
searchKey: fnv.offset128Higher
tags: [constant number private]
```

```Go
const offset128Higher = 0x6c62272e07bb0142
```

### <a id="offset128Lower" href="#offset128Lower">const offset128Lower</a>

```
searchKey: fnv.offset128Lower
tags: [constant number private]
```

```Go
const offset128Lower = 0x62b821756295c58d
```

### <a id="offset32" href="#offset32">const offset32</a>

```
searchKey: fnv.offset32
tags: [constant number private]
```

```Go
const offset32 = 2166136261
```

### <a id="offset64" href="#offset64">const offset64</a>

```
searchKey: fnv.offset64
tags: [constant number private]
```

```Go
const offset64 = 14695981039346656037
```

### <a id="prime128Lower" href="#prime128Lower">const prime128Lower</a>

```
searchKey: fnv.prime128Lower
tags: [constant number private]
```

```Go
const prime128Lower = 0x13b
```

### <a id="prime128Shift" href="#prime128Shift">const prime128Shift</a>

```
searchKey: fnv.prime128Shift
tags: [constant number private]
```

```Go
const prime128Shift = 24
```

### <a id="prime32" href="#prime32">const prime32</a>

```
searchKey: fnv.prime32
tags: [constant number private]
```

```Go
const prime32 = 16777619
```

### <a id="prime64" href="#prime64">const prime64</a>

```
searchKey: fnv.prime64
tags: [constant number private]
```

```Go
const prime64 = 1099511628211
```

## <a id="var" href="#var">Variables</a>

### <a id="golden128" href="#golden128">var golden128</a>

```
searchKey: fnv.golden128
tags: [variable array struct private]
```

```Go
var golden128 = ...
```

### <a id="golden128a" href="#golden128a">var golden128a</a>

```
searchKey: fnv.golden128a
tags: [variable array struct private]
```

```Go
var golden128a = ...
```

### <a id="golden32" href="#golden32">var golden32</a>

```
searchKey: fnv.golden32
tags: [variable array struct private]
```

```Go
var golden32 = ...
```

### <a id="golden32a" href="#golden32a">var golden32a</a>

```
searchKey: fnv.golden32a
tags: [variable array struct private]
```

```Go
var golden32a = ...
```

### <a id="golden64" href="#golden64">var golden64</a>

```
searchKey: fnv.golden64
tags: [variable array struct private]
```

```Go
var golden64 = ...
```

### <a id="golden64a" href="#golden64a">var golden64a</a>

```
searchKey: fnv.golden64a
tags: [variable array struct private]
```

```Go
var golden64a = ...
```

## <a id="type" href="#type">Types</a>

### <a id="golden" href="#golden">type golden struct</a>

```
searchKey: fnv.golden
tags: [struct private]
```

```Go
type golden struct {
	out       []byte
	in        string
	halfState string // marshaled hash state after first half of in written, used by TestGoldenMarshal
}
```

### <a id="sum128" href="#sum128">type sum128 [2]uint64</a>

```
searchKey: fnv.sum128
tags: [array number private]
```

```Go
type sum128 [2]uint64
```

#### <a id="sum128.BlockSize" href="#sum128.BlockSize">func (s *sum128) BlockSize() int</a>

```
searchKey: fnv.sum128.BlockSize
tags: [method private]
```

```Go
func (s *sum128) BlockSize() int
```

#### <a id="sum128.MarshalBinary" href="#sum128.MarshalBinary">func (s *sum128) MarshalBinary() ([]byte, error)</a>

```
searchKey: fnv.sum128.MarshalBinary
tags: [method private]
```

```Go
func (s *sum128) MarshalBinary() ([]byte, error)
```

#### <a id="sum128.Reset" href="#sum128.Reset">func (s *sum128) Reset()</a>

```
searchKey: fnv.sum128.Reset
tags: [method private]
```

```Go
func (s *sum128) Reset()
```

#### <a id="sum128.Size" href="#sum128.Size">func (s *sum128) Size() int</a>

```
searchKey: fnv.sum128.Size
tags: [method private]
```

```Go
func (s *sum128) Size() int
```

#### <a id="sum128.Sum" href="#sum128.Sum">func (s *sum128) Sum(in []byte) []byte</a>

```
searchKey: fnv.sum128.Sum
tags: [method private]
```

```Go
func (s *sum128) Sum(in []byte) []byte
```

#### <a id="sum128.UnmarshalBinary" href="#sum128.UnmarshalBinary">func (s *sum128) UnmarshalBinary(b []byte) error</a>

```
searchKey: fnv.sum128.UnmarshalBinary
tags: [method private]
```

```Go
func (s *sum128) UnmarshalBinary(b []byte) error
```

#### <a id="sum128.Write" href="#sum128.Write">func (s *sum128) Write(data []byte) (int, error)</a>

```
searchKey: fnv.sum128.Write
tags: [method private]
```

```Go
func (s *sum128) Write(data []byte) (int, error)
```

### <a id="sum128a" href="#sum128a">type sum128a [2]uint64</a>

```
searchKey: fnv.sum128a
tags: [array number private]
```

```Go
type sum128a [2]uint64
```

#### <a id="sum128a.BlockSize" href="#sum128a.BlockSize">func (s *sum128a) BlockSize() int</a>

```
searchKey: fnv.sum128a.BlockSize
tags: [method private]
```

```Go
func (s *sum128a) BlockSize() int
```

#### <a id="sum128a.MarshalBinary" href="#sum128a.MarshalBinary">func (s *sum128a) MarshalBinary() ([]byte, error)</a>

```
searchKey: fnv.sum128a.MarshalBinary
tags: [method private]
```

```Go
func (s *sum128a) MarshalBinary() ([]byte, error)
```

#### <a id="sum128a.Reset" href="#sum128a.Reset">func (s *sum128a) Reset()</a>

```
searchKey: fnv.sum128a.Reset
tags: [method private]
```

```Go
func (s *sum128a) Reset()
```

#### <a id="sum128a.Size" href="#sum128a.Size">func (s *sum128a) Size() int</a>

```
searchKey: fnv.sum128a.Size
tags: [method private]
```

```Go
func (s *sum128a) Size() int
```

#### <a id="sum128a.Sum" href="#sum128a.Sum">func (s *sum128a) Sum(in []byte) []byte</a>

```
searchKey: fnv.sum128a.Sum
tags: [method private]
```

```Go
func (s *sum128a) Sum(in []byte) []byte
```

#### <a id="sum128a.UnmarshalBinary" href="#sum128a.UnmarshalBinary">func (s *sum128a) UnmarshalBinary(b []byte) error</a>

```
searchKey: fnv.sum128a.UnmarshalBinary
tags: [method private]
```

```Go
func (s *sum128a) UnmarshalBinary(b []byte) error
```

#### <a id="sum128a.Write" href="#sum128a.Write">func (s *sum128a) Write(data []byte) (int, error)</a>

```
searchKey: fnv.sum128a.Write
tags: [method private]
```

```Go
func (s *sum128a) Write(data []byte) (int, error)
```

### <a id="sum32" href="#sum32">type sum32 uint32</a>

```
searchKey: fnv.sum32
tags: [number private]
```

```Go
type sum32 uint32
```

#### <a id="sum32.BlockSize" href="#sum32.BlockSize">func (s *sum32) BlockSize() int</a>

```
searchKey: fnv.sum32.BlockSize
tags: [method private]
```

```Go
func (s *sum32) BlockSize() int
```

#### <a id="sum32.MarshalBinary" href="#sum32.MarshalBinary">func (s *sum32) MarshalBinary() ([]byte, error)</a>

```
searchKey: fnv.sum32.MarshalBinary
tags: [method private]
```

```Go
func (s *sum32) MarshalBinary() ([]byte, error)
```

#### <a id="sum32.Reset" href="#sum32.Reset">func (s *sum32) Reset()</a>

```
searchKey: fnv.sum32.Reset
tags: [method private]
```

```Go
func (s *sum32) Reset()
```

#### <a id="sum32.Size" href="#sum32.Size">func (s *sum32) Size() int</a>

```
searchKey: fnv.sum32.Size
tags: [method private]
```

```Go
func (s *sum32) Size() int
```

#### <a id="sum32.Sum" href="#sum32.Sum">func (s *sum32) Sum(in []byte) []byte</a>

```
searchKey: fnv.sum32.Sum
tags: [method private]
```

```Go
func (s *sum32) Sum(in []byte) []byte
```

#### <a id="sum32.Sum32" href="#sum32.Sum32">func (s *sum32) Sum32() uint32</a>

```
searchKey: fnv.sum32.Sum32
tags: [method private]
```

```Go
func (s *sum32) Sum32() uint32
```

#### <a id="sum32.UnmarshalBinary" href="#sum32.UnmarshalBinary">func (s *sum32) UnmarshalBinary(b []byte) error</a>

```
searchKey: fnv.sum32.UnmarshalBinary
tags: [method private]
```

```Go
func (s *sum32) UnmarshalBinary(b []byte) error
```

#### <a id="sum32.Write" href="#sum32.Write">func (s *sum32) Write(data []byte) (int, error)</a>

```
searchKey: fnv.sum32.Write
tags: [method private]
```

```Go
func (s *sum32) Write(data []byte) (int, error)
```

### <a id="sum32a" href="#sum32a">type sum32a uint32</a>

```
searchKey: fnv.sum32a
tags: [number private]
```

```Go
type sum32a uint32
```

#### <a id="sum32a.BlockSize" href="#sum32a.BlockSize">func (s *sum32a) BlockSize() int</a>

```
searchKey: fnv.sum32a.BlockSize
tags: [method private]
```

```Go
func (s *sum32a) BlockSize() int
```

#### <a id="sum32a.MarshalBinary" href="#sum32a.MarshalBinary">func (s *sum32a) MarshalBinary() ([]byte, error)</a>

```
searchKey: fnv.sum32a.MarshalBinary
tags: [method private]
```

```Go
func (s *sum32a) MarshalBinary() ([]byte, error)
```

#### <a id="sum32a.Reset" href="#sum32a.Reset">func (s *sum32a) Reset()</a>

```
searchKey: fnv.sum32a.Reset
tags: [method private]
```

```Go
func (s *sum32a) Reset()
```

#### <a id="sum32a.Size" href="#sum32a.Size">func (s *sum32a) Size() int</a>

```
searchKey: fnv.sum32a.Size
tags: [method private]
```

```Go
func (s *sum32a) Size() int
```

#### <a id="sum32a.Sum" href="#sum32a.Sum">func (s *sum32a) Sum(in []byte) []byte</a>

```
searchKey: fnv.sum32a.Sum
tags: [method private]
```

```Go
func (s *sum32a) Sum(in []byte) []byte
```

#### <a id="sum32a.Sum32" href="#sum32a.Sum32">func (s *sum32a) Sum32() uint32</a>

```
searchKey: fnv.sum32a.Sum32
tags: [method private]
```

```Go
func (s *sum32a) Sum32() uint32
```

#### <a id="sum32a.UnmarshalBinary" href="#sum32a.UnmarshalBinary">func (s *sum32a) UnmarshalBinary(b []byte) error</a>

```
searchKey: fnv.sum32a.UnmarshalBinary
tags: [method private]
```

```Go
func (s *sum32a) UnmarshalBinary(b []byte) error
```

#### <a id="sum32a.Write" href="#sum32a.Write">func (s *sum32a) Write(data []byte) (int, error)</a>

```
searchKey: fnv.sum32a.Write
tags: [method private]
```

```Go
func (s *sum32a) Write(data []byte) (int, error)
```

### <a id="sum64" href="#sum64">type sum64 uint64</a>

```
searchKey: fnv.sum64
tags: [number private]
```

```Go
type sum64 uint64
```

#### <a id="sum64.BlockSize" href="#sum64.BlockSize">func (s *sum64) BlockSize() int</a>

```
searchKey: fnv.sum64.BlockSize
tags: [method private]
```

```Go
func (s *sum64) BlockSize() int
```

#### <a id="sum64.MarshalBinary" href="#sum64.MarshalBinary">func (s *sum64) MarshalBinary() ([]byte, error)</a>

```
searchKey: fnv.sum64.MarshalBinary
tags: [method private]
```

```Go
func (s *sum64) MarshalBinary() ([]byte, error)
```

#### <a id="sum64.Reset" href="#sum64.Reset">func (s *sum64) Reset()</a>

```
searchKey: fnv.sum64.Reset
tags: [method private]
```

```Go
func (s *sum64) Reset()
```

#### <a id="sum64.Size" href="#sum64.Size">func (s *sum64) Size() int</a>

```
searchKey: fnv.sum64.Size
tags: [method private]
```

```Go
func (s *sum64) Size() int
```

#### <a id="sum64.Sum" href="#sum64.Sum">func (s *sum64) Sum(in []byte) []byte</a>

```
searchKey: fnv.sum64.Sum
tags: [method private]
```

```Go
func (s *sum64) Sum(in []byte) []byte
```

#### <a id="sum64.Sum64" href="#sum64.Sum64">func (s *sum64) Sum64() uint64</a>

```
searchKey: fnv.sum64.Sum64
tags: [method private]
```

```Go
func (s *sum64) Sum64() uint64
```

#### <a id="sum64.UnmarshalBinary" href="#sum64.UnmarshalBinary">func (s *sum64) UnmarshalBinary(b []byte) error</a>

```
searchKey: fnv.sum64.UnmarshalBinary
tags: [method private]
```

```Go
func (s *sum64) UnmarshalBinary(b []byte) error
```

#### <a id="sum64.Write" href="#sum64.Write">func (s *sum64) Write(data []byte) (int, error)</a>

```
searchKey: fnv.sum64.Write
tags: [method private]
```

```Go
func (s *sum64) Write(data []byte) (int, error)
```

### <a id="sum64a" href="#sum64a">type sum64a uint64</a>

```
searchKey: fnv.sum64a
tags: [number private]
```

```Go
type sum64a uint64
```

#### <a id="sum64a.BlockSize" href="#sum64a.BlockSize">func (s *sum64a) BlockSize() int</a>

```
searchKey: fnv.sum64a.BlockSize
tags: [method private]
```

```Go
func (s *sum64a) BlockSize() int
```

#### <a id="sum64a.MarshalBinary" href="#sum64a.MarshalBinary">func (s *sum64a) MarshalBinary() ([]byte, error)</a>

```
searchKey: fnv.sum64a.MarshalBinary
tags: [method private]
```

```Go
func (s *sum64a) MarshalBinary() ([]byte, error)
```

#### <a id="sum64a.Reset" href="#sum64a.Reset">func (s *sum64a) Reset()</a>

```
searchKey: fnv.sum64a.Reset
tags: [method private]
```

```Go
func (s *sum64a) Reset()
```

#### <a id="sum64a.Size" href="#sum64a.Size">func (s *sum64a) Size() int</a>

```
searchKey: fnv.sum64a.Size
tags: [method private]
```

```Go
func (s *sum64a) Size() int
```

#### <a id="sum64a.Sum" href="#sum64a.Sum">func (s *sum64a) Sum(in []byte) []byte</a>

```
searchKey: fnv.sum64a.Sum
tags: [method private]
```

```Go
func (s *sum64a) Sum(in []byte) []byte
```

#### <a id="sum64a.Sum64" href="#sum64a.Sum64">func (s *sum64a) Sum64() uint64</a>

```
searchKey: fnv.sum64a.Sum64
tags: [method private]
```

```Go
func (s *sum64a) Sum64() uint64
```

#### <a id="sum64a.UnmarshalBinary" href="#sum64a.UnmarshalBinary">func (s *sum64a) UnmarshalBinary(b []byte) error</a>

```
searchKey: fnv.sum64a.UnmarshalBinary
tags: [method private]
```

```Go
func (s *sum64a) UnmarshalBinary(b []byte) error
```

#### <a id="sum64a.Write" href="#sum64a.Write">func (s *sum64a) Write(data []byte) (int, error)</a>

```
searchKey: fnv.sum64a.Write
tags: [method private]
```

```Go
func (s *sum64a) Write(data []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkFnv128KB" href="#BenchmarkFnv128KB">func BenchmarkFnv128KB(b *testing.B)</a>

```
searchKey: fnv.BenchmarkFnv128KB
tags: [function private benchmark]
```

```Go
func BenchmarkFnv128KB(b *testing.B)
```

### <a id="BenchmarkFnv128aKB" href="#BenchmarkFnv128aKB">func BenchmarkFnv128aKB(b *testing.B)</a>

```
searchKey: fnv.BenchmarkFnv128aKB
tags: [function private benchmark]
```

```Go
func BenchmarkFnv128aKB(b *testing.B)
```

### <a id="BenchmarkFnv32KB" href="#BenchmarkFnv32KB">func BenchmarkFnv32KB(b *testing.B)</a>

```
searchKey: fnv.BenchmarkFnv32KB
tags: [function private benchmark]
```

```Go
func BenchmarkFnv32KB(b *testing.B)
```

### <a id="BenchmarkFnv32aKB" href="#BenchmarkFnv32aKB">func BenchmarkFnv32aKB(b *testing.B)</a>

```
searchKey: fnv.BenchmarkFnv32aKB
tags: [function private benchmark]
```

```Go
func BenchmarkFnv32aKB(b *testing.B)
```

### <a id="BenchmarkFnv64KB" href="#BenchmarkFnv64KB">func BenchmarkFnv64KB(b *testing.B)</a>

```
searchKey: fnv.BenchmarkFnv64KB
tags: [function private benchmark]
```

```Go
func BenchmarkFnv64KB(b *testing.B)
```

### <a id="BenchmarkFnv64aKB" href="#BenchmarkFnv64aKB">func BenchmarkFnv64aKB(b *testing.B)</a>

```
searchKey: fnv.BenchmarkFnv64aKB
tags: [function private benchmark]
```

```Go
func BenchmarkFnv64aKB(b *testing.B)
```

### <a id="New128" href="#New128">func New128() hash.Hash</a>

```
searchKey: fnv.New128
tags: [function]
```

```Go
func New128() hash.Hash
```

New128 returns a new 128-bit FNV-1 hash.Hash. Its Sum method will lay the value out in big-endian byte order. 

### <a id="New128a" href="#New128a">func New128a() hash.Hash</a>

```
searchKey: fnv.New128a
tags: [function]
```

```Go
func New128a() hash.Hash
```

New128a returns a new 128-bit FNV-1a hash.Hash. Its Sum method will lay the value out in big-endian byte order. 

### <a id="New32" href="#New32">func New32() hash.Hash32</a>

```
searchKey: fnv.New32
tags: [function]
```

```Go
func New32() hash.Hash32
```

New32 returns a new 32-bit FNV-1 hash.Hash. Its Sum method will lay the value out in big-endian byte order. 

### <a id="New32a" href="#New32a">func New32a() hash.Hash32</a>

```
searchKey: fnv.New32a
tags: [function]
```

```Go
func New32a() hash.Hash32
```

New32a returns a new 32-bit FNV-1a hash.Hash. Its Sum method will lay the value out in big-endian byte order. 

### <a id="New64" href="#New64">func New64() hash.Hash64</a>

```
searchKey: fnv.New64
tags: [function]
```

```Go
func New64() hash.Hash64
```

New64 returns a new 64-bit FNV-1 hash.Hash. Its Sum method will lay the value out in big-endian byte order. 

### <a id="New64a" href="#New64a">func New64a() hash.Hash64</a>

```
searchKey: fnv.New64a
tags: [function]
```

```Go
func New64a() hash.Hash64
```

New64a returns a new 64-bit FNV-1a hash.Hash. Its Sum method will lay the value out in big-endian byte order. 

### <a id="TestGolden128" href="#TestGolden128">func TestGolden128(t *testing.T)</a>

```
searchKey: fnv.TestGolden128
tags: [function private test]
```

```Go
func TestGolden128(t *testing.T)
```

### <a id="TestGolden128a" href="#TestGolden128a">func TestGolden128a(t *testing.T)</a>

```
searchKey: fnv.TestGolden128a
tags: [function private test]
```

```Go
func TestGolden128a(t *testing.T)
```

### <a id="TestGolden32" href="#TestGolden32">func TestGolden32(t *testing.T)</a>

```
searchKey: fnv.TestGolden32
tags: [function private test]
```

```Go
func TestGolden32(t *testing.T)
```

### <a id="TestGolden32a" href="#TestGolden32a">func TestGolden32a(t *testing.T)</a>

```
searchKey: fnv.TestGolden32a
tags: [function private test]
```

```Go
func TestGolden32a(t *testing.T)
```

### <a id="TestGolden64" href="#TestGolden64">func TestGolden64(t *testing.T)</a>

```
searchKey: fnv.TestGolden64
tags: [function private test]
```

```Go
func TestGolden64(t *testing.T)
```

### <a id="TestGolden64a" href="#TestGolden64a">func TestGolden64a(t *testing.T)</a>

```
searchKey: fnv.TestGolden64a
tags: [function private test]
```

```Go
func TestGolden64a(t *testing.T)
```

### <a id="TestGoldenMarshal" href="#TestGoldenMarshal">func TestGoldenMarshal(t *testing.T)</a>

```
searchKey: fnv.TestGoldenMarshal
tags: [function private test]
```

```Go
func TestGoldenMarshal(t *testing.T)
```

### <a id="TestIntegrity128" href="#TestIntegrity128">func TestIntegrity128(t *testing.T)</a>

```
searchKey: fnv.TestIntegrity128
tags: [function private test]
```

```Go
func TestIntegrity128(t *testing.T)
```

### <a id="TestIntegrity128a" href="#TestIntegrity128a">func TestIntegrity128a(t *testing.T)</a>

```
searchKey: fnv.TestIntegrity128a
tags: [function private test]
```

```Go
func TestIntegrity128a(t *testing.T)
```

### <a id="TestIntegrity32" href="#TestIntegrity32">func TestIntegrity32(t *testing.T)</a>

```
searchKey: fnv.TestIntegrity32
tags: [function private test]
```

```Go
func TestIntegrity32(t *testing.T)
```

### <a id="TestIntegrity32a" href="#TestIntegrity32a">func TestIntegrity32a(t *testing.T)</a>

```
searchKey: fnv.TestIntegrity32a
tags: [function private test]
```

```Go
func TestIntegrity32a(t *testing.T)
```

### <a id="TestIntegrity64" href="#TestIntegrity64">func TestIntegrity64(t *testing.T)</a>

```
searchKey: fnv.TestIntegrity64
tags: [function private test]
```

```Go
func TestIntegrity64(t *testing.T)
```

### <a id="TestIntegrity64a" href="#TestIntegrity64a">func TestIntegrity64a(t *testing.T)</a>

```
searchKey: fnv.TestIntegrity64a
tags: [function private test]
```

```Go
func TestIntegrity64a(t *testing.T)
```

### <a id="appendUint32" href="#appendUint32">func appendUint32(b []byte, x uint32) []byte</a>

```
searchKey: fnv.appendUint32
tags: [function private]
```

```Go
func appendUint32(b []byte, x uint32) []byte
```

### <a id="appendUint64" href="#appendUint64">func appendUint64(b []byte, x uint64) []byte</a>

```
searchKey: fnv.appendUint64
tags: [function private]
```

```Go
func appendUint64(b []byte, x uint64) []byte
```

### <a id="benchmarkKB" href="#benchmarkKB">func benchmarkKB(b *testing.B, h hash.Hash)</a>

```
searchKey: fnv.benchmarkKB
tags: [function private]
```

```Go
func benchmarkKB(b *testing.B, h hash.Hash)
```

### <a id="readUint32" href="#readUint32">func readUint32(b []byte) uint32</a>

```
searchKey: fnv.readUint32
tags: [function private]
```

```Go
func readUint32(b []byte) uint32
```

### <a id="readUint64" href="#readUint64">func readUint64(b []byte) uint64</a>

```
searchKey: fnv.readUint64
tags: [function private]
```

```Go
func readUint64(b []byte) uint64
```

### <a id="testGolden" href="#testGolden">func testGolden(t *testing.T, hash hash.Hash, gold []golden)</a>

```
searchKey: fnv.testGolden
tags: [function private]
```

```Go
func testGolden(t *testing.T, hash hash.Hash, gold []golden)
```

### <a id="testIntegrity" href="#testIntegrity">func testIntegrity(t *testing.T, h hash.Hash)</a>

```
searchKey: fnv.testIntegrity
tags: [function private]
```

```Go
func testIntegrity(t *testing.T, h hash.Hash)
```

