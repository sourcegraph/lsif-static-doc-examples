# Package crc64

Package crc64 implements the 64-bit cyclic redundancy check, or CRC-64, checksum. See [https://en.wikipedia.org/wiki/Cyclic_redundancy_check](https://en.wikipedia.org/wiki/Cyclic_redundancy_check) for information. 

## Index

* [Constants](#const)
    * [const ECMA](#ECMA)
    * [const ISO](#ISO)
    * [const Size](#Size)
    * [const magic](#magic)
    * [const marshaledSize](#marshaledSize)
* [Variables](#var)
    * [var golden](#golden)
    * [var slicing8TableECMA](#slicing8TableECMA)
    * [var slicing8TableISO](#slicing8TableISO)
    * [var slicing8TablesBuildOnce](#slicing8TablesBuildOnce)
* [Types](#type)
    * [type Table [256]uint64](#Table)
        * [func MakeTable(poly uint64) *Table](#MakeTable)
        * [func makeTable(poly uint64) *Table](#makeTable)
    * [type digest struct](#digest)
        * [func (d *digest) BlockSize() int](#digest.BlockSize)
        * [func (d *digest) MarshalBinary() ([]byte, error)](#digest.MarshalBinary)
        * [func (d *digest) Reset()](#digest.Reset)
        * [func (d *digest) Size() int](#digest.Size)
        * [func (d *digest) Sum(in []byte) []byte](#digest.Sum)
        * [func (d *digest) Sum64() uint64](#digest.Sum64)
        * [func (d *digest) UnmarshalBinary(b []byte) error](#digest.UnmarshalBinary)
        * [func (d *digest) Write(p []byte) (n int, err error)](#digest.Write)
    * [type test struct](#test)
* [Functions](#func)
    * [func BenchmarkCrc64(b *testing.B)](#BenchmarkCrc64)
    * [func Checksum(data []byte, tab *Table) uint64](#Checksum)
    * [func New(tab *Table) hash.Hash64](#New)
    * [func TestGolden(t *testing.T)](#TestGolden)
    * [func TestGoldenMarshal(t *testing.T)](#TestGoldenMarshal)
    * [func TestMarshalTableMismatch(t *testing.T)](#TestMarshalTableMismatch)
    * [func Update(crc uint64, tab *Table, p []byte) uint64](#Update)
    * [func appendUint64(b []byte, x uint64) []byte](#appendUint64)
    * [func bench(b *testing.B, poly uint64, size int64)](#bench)
    * [func buildSlicing8Tables()](#buildSlicing8Tables)
    * [func buildSlicing8TablesOnce()](#buildSlicing8TablesOnce)
    * [func makeSlicingBy8Table(t *Table) *[8]Table](#makeSlicingBy8Table)
    * [func readUint64(b []byte) uint64](#readUint64)
    * [func tableSum(t *Table) uint64](#tableSum)
    * [func update(crc uint64, tab *Table, p []byte) uint64](#update)


## <a id="const" href="#const">Constants</a>

### <a id="ECMA" href="#ECMA">const ECMA</a>

```
searchKey: crc64.ECMA
tags: [constant number]
```

```Go
const ECMA = 0xC96C5795D7870F42
```

Predefined polynomials. 

The ECMA polynomial, defined in ECMA 182. 

### <a id="ISO" href="#ISO">const ISO</a>

```
searchKey: crc64.ISO
tags: [constant number]
```

```Go
const ISO = 0xD800000000000000
```

Predefined polynomials. 

The ISO polynomial, defined in ISO 3309 and used in HDLC. 

### <a id="Size" href="#Size">const Size</a>

```
searchKey: crc64.Size
tags: [constant number]
```

```Go
const Size = 8
```

The size of a CRC-64 checksum in bytes. 

### <a id="magic" href="#magic">const magic</a>

```
searchKey: crc64.magic
tags: [constant string private]
```

```Go
const magic = "crc\x02"
```

### <a id="marshaledSize" href="#marshaledSize">const marshaledSize</a>

```
searchKey: crc64.marshaledSize
tags: [constant number private]
```

```Go
const marshaledSize = len(magic) + 8 + 8
```

## <a id="var" href="#var">Variables</a>

### <a id="golden" href="#golden">var golden</a>

```
searchKey: crc64.golden
tags: [variable array struct private]
```

```Go
var golden = ...
```

### <a id="slicing8TableECMA" href="#slicing8TableECMA">var slicing8TableECMA</a>

```
searchKey: crc64.slicing8TableECMA
tags: [variable array array number private]
```

```Go
var slicing8TableECMA *[8]Table
```

### <a id="slicing8TableISO" href="#slicing8TableISO">var slicing8TableISO</a>

```
searchKey: crc64.slicing8TableISO
tags: [variable array array number private]
```

```Go
var slicing8TableISO *[8]Table
```

### <a id="slicing8TablesBuildOnce" href="#slicing8TablesBuildOnce">var slicing8TablesBuildOnce</a>

```
searchKey: crc64.slicing8TablesBuildOnce
tags: [variable struct private]
```

```Go
var slicing8TablesBuildOnce sync.Once
```

## <a id="type" href="#type">Types</a>

### <a id="Table" href="#Table">type Table [256]uint64</a>

```
searchKey: crc64.Table
tags: [array number]
```

```Go
type Table [256]uint64
```

Table is a 256-word table representing the polynomial for efficient processing. 

#### <a id="MakeTable" href="#MakeTable">func MakeTable(poly uint64) *Table</a>

```
searchKey: crc64.MakeTable
tags: [function]
```

```Go
func MakeTable(poly uint64) *Table
```

MakeTable returns a Table constructed from the specified polynomial. The contents of this Table must not be modified. 

#### <a id="makeTable" href="#makeTable">func makeTable(poly uint64) *Table</a>

```
searchKey: crc64.makeTable
tags: [function private]
```

```Go
func makeTable(poly uint64) *Table
```

### <a id="digest" href="#digest">type digest struct</a>

```
searchKey: crc64.digest
tags: [struct private]
```

```Go
type digest struct {
	crc uint64
	tab *Table
}
```

digest represents the partial evaluation of a checksum. 

#### <a id="digest.BlockSize" href="#digest.BlockSize">func (d *digest) BlockSize() int</a>

```
searchKey: crc64.digest.BlockSize
tags: [method private]
```

```Go
func (d *digest) BlockSize() int
```

#### <a id="digest.MarshalBinary" href="#digest.MarshalBinary">func (d *digest) MarshalBinary() ([]byte, error)</a>

```
searchKey: crc64.digest.MarshalBinary
tags: [method private]
```

```Go
func (d *digest) MarshalBinary() ([]byte, error)
```

#### <a id="digest.Reset" href="#digest.Reset">func (d *digest) Reset()</a>

```
searchKey: crc64.digest.Reset
tags: [method private]
```

```Go
func (d *digest) Reset()
```

#### <a id="digest.Size" href="#digest.Size">func (d *digest) Size() int</a>

```
searchKey: crc64.digest.Size
tags: [method private]
```

```Go
func (d *digest) Size() int
```

#### <a id="digest.Sum" href="#digest.Sum">func (d *digest) Sum(in []byte) []byte</a>

```
searchKey: crc64.digest.Sum
tags: [method private]
```

```Go
func (d *digest) Sum(in []byte) []byte
```

#### <a id="digest.Sum64" href="#digest.Sum64">func (d *digest) Sum64() uint64</a>

```
searchKey: crc64.digest.Sum64
tags: [method private]
```

```Go
func (d *digest) Sum64() uint64
```

#### <a id="digest.UnmarshalBinary" href="#digest.UnmarshalBinary">func (d *digest) UnmarshalBinary(b []byte) error</a>

```
searchKey: crc64.digest.UnmarshalBinary
tags: [method private]
```

```Go
func (d *digest) UnmarshalBinary(b []byte) error
```

#### <a id="digest.Write" href="#digest.Write">func (d *digest) Write(p []byte) (n int, err error)</a>

```
searchKey: crc64.digest.Write
tags: [method private]
```

```Go
func (d *digest) Write(p []byte) (n int, err error)
```

### <a id="test" href="#test">type test struct</a>

```
searchKey: crc64.test
tags: [struct private]
```

```Go
type test struct {
	outISO        uint64
	outECMA       uint64
	in            string
	halfStateISO  string // ISO marshaled hash state after first half of in written, used by TestGoldenMarshal
	halfStateECMA string // ECMA marshaled hash state after first half of in written, used by TestGoldenMarshal
}
```

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkCrc64" href="#BenchmarkCrc64">func BenchmarkCrc64(b *testing.B)</a>

```
searchKey: crc64.BenchmarkCrc64
tags: [function private benchmark]
```

```Go
func BenchmarkCrc64(b *testing.B)
```

### <a id="Checksum" href="#Checksum">func Checksum(data []byte, tab *Table) uint64</a>

```
searchKey: crc64.Checksum
tags: [function]
```

```Go
func Checksum(data []byte, tab *Table) uint64
```

Checksum returns the CRC-64 checksum of data using the polynomial represented by the Table. 

### <a id="New" href="#New">func New(tab *Table) hash.Hash64</a>

```
searchKey: crc64.New
tags: [function]
```

```Go
func New(tab *Table) hash.Hash64
```

New creates a new hash.Hash64 computing the CRC-64 checksum using the polynomial represented by the Table. Its Sum method will lay the value out in big-endian byte order. The returned Hash64 also implements encoding.BinaryMarshaler and encoding.BinaryUnmarshaler to marshal and unmarshal the internal state of the hash. 

### <a id="TestGolden" href="#TestGolden">func TestGolden(t *testing.T)</a>

```
searchKey: crc64.TestGolden
tags: [function private test]
```

```Go
func TestGolden(t *testing.T)
```

### <a id="TestGoldenMarshal" href="#TestGoldenMarshal">func TestGoldenMarshal(t *testing.T)</a>

```
searchKey: crc64.TestGoldenMarshal
tags: [function private test]
```

```Go
func TestGoldenMarshal(t *testing.T)
```

### <a id="TestMarshalTableMismatch" href="#TestMarshalTableMismatch">func TestMarshalTableMismatch(t *testing.T)</a>

```
searchKey: crc64.TestMarshalTableMismatch
tags: [function private test]
```

```Go
func TestMarshalTableMismatch(t *testing.T)
```

### <a id="Update" href="#Update">func Update(crc uint64, tab *Table, p []byte) uint64</a>

```
searchKey: crc64.Update
tags: [function]
```

```Go
func Update(crc uint64, tab *Table, p []byte) uint64
```

Update returns the result of adding the bytes in p to the crc. 

### <a id="appendUint64" href="#appendUint64">func appendUint64(b []byte, x uint64) []byte</a>

```
searchKey: crc64.appendUint64
tags: [function private]
```

```Go
func appendUint64(b []byte, x uint64) []byte
```

### <a id="bench" href="#bench">func bench(b *testing.B, poly uint64, size int64)</a>

```
searchKey: crc64.bench
tags: [function private]
```

```Go
func bench(b *testing.B, poly uint64, size int64)
```

### <a id="buildSlicing8Tables" href="#buildSlicing8Tables">func buildSlicing8Tables()</a>

```
searchKey: crc64.buildSlicing8Tables
tags: [function private]
```

```Go
func buildSlicing8Tables()
```

### <a id="buildSlicing8TablesOnce" href="#buildSlicing8TablesOnce">func buildSlicing8TablesOnce()</a>

```
searchKey: crc64.buildSlicing8TablesOnce
tags: [function private]
```

```Go
func buildSlicing8TablesOnce()
```

### <a id="makeSlicingBy8Table" href="#makeSlicingBy8Table">func makeSlicingBy8Table(t *Table) *[8]Table</a>

```
searchKey: crc64.makeSlicingBy8Table
tags: [function private]
```

```Go
func makeSlicingBy8Table(t *Table) *[8]Table
```

### <a id="readUint64" href="#readUint64">func readUint64(b []byte) uint64</a>

```
searchKey: crc64.readUint64
tags: [function private]
```

```Go
func readUint64(b []byte) uint64
```

### <a id="tableSum" href="#tableSum">func tableSum(t *Table) uint64</a>

```
searchKey: crc64.tableSum
tags: [function private]
```

```Go
func tableSum(t *Table) uint64
```

tableSum returns the ISO checksum of table t. 

### <a id="update" href="#update">func update(crc uint64, tab *Table, p []byte) uint64</a>

```
searchKey: crc64.update
tags: [function private]
```

```Go
func update(crc uint64, tab *Table, p []byte) uint64
```

