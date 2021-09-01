# Package adler32

Package adler32 implements the Adler-32 checksum. 

It is defined in RFC 1950: 

```
Adler-32 is composed of two sums accumulated per byte: s1 is
the sum of all bytes, s2 is the sum of all s1 values. Both sums
are done modulo 65521. s1 is initialized to 1, s2 to zero.  The
Adler-32 checksum is stored as s2*65536 + s1 in most-
significant-byte first (network) order.

```
## Index

* [Constants](#const)
    * [const Size](#Size)
    * [const magic](#magic)
    * [const marshaledSize](#marshaledSize)
    * [const mod](#mod)
    * [const nmax](#nmax)
* [Variables](#var)
    * [var golden](#golden)
* [Types](#type)
    * [type digest uint32](#digest)
        * [func update(d digest, p []byte) digest](#update)
        * [func (d *digest) BlockSize() int](#digest.BlockSize)
        * [func (d *digest) MarshalBinary() ([]byte, error)](#digest.MarshalBinary)
        * [func (d *digest) Reset()](#digest.Reset)
        * [func (d *digest) Size() int](#digest.Size)
        * [func (d *digest) Sum(in []byte) []byte](#digest.Sum)
        * [func (d *digest) Sum32() uint32](#digest.Sum32)
        * [func (d *digest) UnmarshalBinary(b []byte) error](#digest.UnmarshalBinary)
        * [func (d *digest) Write(p []byte) (nn int, err error)](#digest.Write)
* [Functions](#func)
    * [func BenchmarkAdler32KB(b *testing.B)](#BenchmarkAdler32KB)
    * [func Checksum(data []byte) uint32](#Checksum)
    * [func New() hash.Hash32](#New)
    * [func TestGolden(t *testing.T)](#TestGolden)
    * [func TestGoldenMarshal(t *testing.T)](#TestGoldenMarshal)
    * [func appendUint32(b []byte, x uint32) []byte](#appendUint32)
    * [func checksum(p []byte) uint32](#checksum)
    * [func readUint32(b []byte) uint32](#readUint32)


## <a id="const" href="#const">Constants</a>

### <a id="Size" href="#Size">const Size</a>

```
searchKey: adler32.Size
tags: [constant number]
```

```Go
const Size = 4
```

The size of an Adler-32 checksum in bytes. 

### <a id="magic" href="#magic">const magic</a>

```
searchKey: adler32.magic
tags: [constant string private]
```

```Go
const magic = "adl\x01"
```

### <a id="marshaledSize" href="#marshaledSize">const marshaledSize</a>

```
searchKey: adler32.marshaledSize
tags: [constant number private]
```

```Go
const marshaledSize = len(magic) + 4
```

### <a id="mod" href="#mod">const mod</a>

```
searchKey: adler32.mod
tags: [constant number private]
```

```Go
const mod = 65521
```

mod is the largest prime that is less than 65536. 

### <a id="nmax" href="#nmax">const nmax</a>

```
searchKey: adler32.nmax
tags: [constant number private]
```

```Go
const nmax = 5552
```

nmax is the largest n such that 255 * n * (n+1) / 2 + (n+1) * (mod-1) <= 2^32-1. It is mentioned in RFC 1950 (search for "5552"). 

## <a id="var" href="#var">Variables</a>

### <a id="golden" href="#golden">var golden</a>

```
searchKey: adler32.golden
tags: [variable array struct private]
```

```Go
var golden = ...
```

## <a id="type" href="#type">Types</a>

### <a id="digest" href="#digest">type digest uint32</a>

```
searchKey: adler32.digest
tags: [number private]
```

```Go
type digest uint32
```

digest represents the partial evaluation of a checksum. The low 16 bits are s1, the high 16 bits are s2. 

#### <a id="update" href="#update">func update(d digest, p []byte) digest</a>

```
searchKey: adler32.update
tags: [function private]
```

```Go
func update(d digest, p []byte) digest
```

Add p to the running checksum d. 

#### <a id="digest.BlockSize" href="#digest.BlockSize">func (d *digest) BlockSize() int</a>

```
searchKey: adler32.digest.BlockSize
tags: [method private]
```

```Go
func (d *digest) BlockSize() int
```

#### <a id="digest.MarshalBinary" href="#digest.MarshalBinary">func (d *digest) MarshalBinary() ([]byte, error)</a>

```
searchKey: adler32.digest.MarshalBinary
tags: [method private]
```

```Go
func (d *digest) MarshalBinary() ([]byte, error)
```

#### <a id="digest.Reset" href="#digest.Reset">func (d *digest) Reset()</a>

```
searchKey: adler32.digest.Reset
tags: [method private]
```

```Go
func (d *digest) Reset()
```

#### <a id="digest.Size" href="#digest.Size">func (d *digest) Size() int</a>

```
searchKey: adler32.digest.Size
tags: [method private]
```

```Go
func (d *digest) Size() int
```

#### <a id="digest.Sum" href="#digest.Sum">func (d *digest) Sum(in []byte) []byte</a>

```
searchKey: adler32.digest.Sum
tags: [method private]
```

```Go
func (d *digest) Sum(in []byte) []byte
```

#### <a id="digest.Sum32" href="#digest.Sum32">func (d *digest) Sum32() uint32</a>

```
searchKey: adler32.digest.Sum32
tags: [method private]
```

```Go
func (d *digest) Sum32() uint32
```

#### <a id="digest.UnmarshalBinary" href="#digest.UnmarshalBinary">func (d *digest) UnmarshalBinary(b []byte) error</a>

```
searchKey: adler32.digest.UnmarshalBinary
tags: [method private]
```

```Go
func (d *digest) UnmarshalBinary(b []byte) error
```

#### <a id="digest.Write" href="#digest.Write">func (d *digest) Write(p []byte) (nn int, err error)</a>

```
searchKey: adler32.digest.Write
tags: [method private]
```

```Go
func (d *digest) Write(p []byte) (nn int, err error)
```

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkAdler32KB" href="#BenchmarkAdler32KB">func BenchmarkAdler32KB(b *testing.B)</a>

```
searchKey: adler32.BenchmarkAdler32KB
tags: [function private benchmark]
```

```Go
func BenchmarkAdler32KB(b *testing.B)
```

### <a id="Checksum" href="#Checksum">func Checksum(data []byte) uint32</a>

```
searchKey: adler32.Checksum
tags: [function]
```

```Go
func Checksum(data []byte) uint32
```

Checksum returns the Adler-32 checksum of data. 

### <a id="New" href="#New">func New() hash.Hash32</a>

```
searchKey: adler32.New
tags: [function]
```

```Go
func New() hash.Hash32
```

New returns a new hash.Hash32 computing the Adler-32 checksum. Its Sum method will lay the value out in big-endian byte order. The returned Hash32 also implements encoding.BinaryMarshaler and encoding.BinaryUnmarshaler to marshal and unmarshal the internal state of the hash. 

### <a id="TestGolden" href="#TestGolden">func TestGolden(t *testing.T)</a>

```
searchKey: adler32.TestGolden
tags: [function private test]
```

```Go
func TestGolden(t *testing.T)
```

### <a id="TestGoldenMarshal" href="#TestGoldenMarshal">func TestGoldenMarshal(t *testing.T)</a>

```
searchKey: adler32.TestGoldenMarshal
tags: [function private test]
```

```Go
func TestGoldenMarshal(t *testing.T)
```

### <a id="appendUint32" href="#appendUint32">func appendUint32(b []byte, x uint32) []byte</a>

```
searchKey: adler32.appendUint32
tags: [function private]
```

```Go
func appendUint32(b []byte, x uint32) []byte
```

### <a id="checksum" href="#checksum">func checksum(p []byte) uint32</a>

```
searchKey: adler32.checksum
tags: [function private]
```

```Go
func checksum(p []byte) uint32
```

checksum is a slow but simple implementation of the Adler-32 checksum. It is a straight port of the sample code in RFC 1950 section 9. 

### <a id="readUint32" href="#readUint32">func readUint32(b []byte) uint32</a>

```
searchKey: adler32.readUint32
tags: [function private]
```

```Go
func readUint32(b []byte) uint32
```

