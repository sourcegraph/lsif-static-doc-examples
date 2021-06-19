# Package crc32

Package crc32 implements the 32-bit cyclic redundancy check, or CRC-32, checksum. See [https://en.wikipedia.org/wiki/Cyclic_redundancy_check](https://en.wikipedia.org/wiki/Cyclic_redundancy_check) for information. 

Polynomials are represented in LSB-first form also known as reversed representation. 

See [https://en.wikipedia.org/wiki/Mathematics_of_cyclic_redundancy_checks#Reversed_representations_and_reciprocal_polynomials](https://en.wikipedia.org/wiki/Mathematics_of_cyclic_redundancy_checks#Reversed_representations_and_reciprocal_polynomials) for information. 

## Index

* [Constants](#const)
    * [const Size](#Size)
    * [const IEEE](#IEEE)
    * [const Castagnoli](#Castagnoli)
    * [const Koopman](#Koopman)
    * [const magic](#magic)
    * [const marshaledSize](#marshaledSize)
    * [const castagnoliK1](#castagnoliK1)
    * [const castagnoliK2](#castagnoliK2)
    * [const slicing8Cutoff](#slicing8Cutoff)
* [Variables](#var)
    * [var castagnoliTable](#castagnoliTable)
    * [var castagnoliTable8](#castagnoliTable8)
    * [var castagnoliArchImpl](#castagnoliArchImpl)
    * [var updateCastagnoli](#updateCastagnoli)
    * [var castagnoliOnce](#castagnoliOnce)
    * [var haveCastagnoli](#haveCastagnoli)
    * [var IEEETable](#IEEETable)
    * [var ieeeTable8](#ieeeTable8)
    * [var ieeeArchImpl](#ieeeArchImpl)
    * [var updateIEEE](#updateIEEE)
    * [var ieeeOnce](#ieeeOnce)
    * [var castagnoliSSE42TableK1](#castagnoliSSE42TableK1)
    * [var castagnoliSSE42TableK2](#castagnoliSSE42TableK2)
    * [var archIeeeTable8](#archIeeeTable8)
    * [var golden](#golden)
* [Types](#type)
    * [type Table [256]uint32](#Table)
        * [func MakeTable(poly uint32) *Table](#MakeTable)
        * [func simpleMakeTable(poly uint32) *Table](#simpleMakeTable)
    * [type digest struct](#digest)
        * [func (d *digest) Size() int](#digest.Size)
        * [func (d *digest) BlockSize() int](#digest.BlockSize)
        * [func (d *digest) Reset()](#digest.Reset)
        * [func (d *digest) MarshalBinary() ([]byte, error)](#digest.MarshalBinary)
        * [func (d *digest) UnmarshalBinary(b []byte) error](#digest.UnmarshalBinary)
        * [func (d *digest) Write(p []byte) (n int, err error)](#digest.Write)
        * [func (d *digest) Sum32() uint32](#digest.Sum32)
        * [func (d *digest) Sum(in []byte) []byte](#digest.Sum)
    * [type sse42Table [4]crc32.Table](#sse42Table)
    * [type slicing8Table [8]crc32.Table](#slicing8Table)
        * [func slicingMakeTable(poly uint32) *slicing8Table](#slicingMakeTable)
    * [type test struct](#test)
* [Functions](#func)
    * [func castagnoliInit()](#castagnoliInit)
    * [func ieeeInit()](#ieeeInit)
    * [func New(tab *Table) hash.Hash32](#New)
    * [func NewIEEE() hash.Hash32](#NewIEEE)
    * [func appendUint32(b []byte, x uint32) []byte](#appendUint32)
    * [func readUint32(b []byte) uint32](#readUint32)
    * [func Update(crc uint32, tab *Table, p []byte) uint32](#Update)
    * [func Checksum(data []byte, tab *Table) uint32](#Checksum)
    * [func ChecksumIEEE(data []byte) uint32](#ChecksumIEEE)
    * [func tableSum(t *Table) uint32](#tableSum)
    * [func castagnoliSSE42(crc uint32, p []byte) uint32](#castagnoliSSE42)
    * [func castagnoliSSE42Triple(crcA, crcB, crcC uint32,...](#castagnoliSSE42Triple)
    * [func ieeeCLMUL(crc uint32, p []byte) uint32](#ieeeCLMUL)
    * [func archAvailableCastagnoli() bool](#archAvailableCastagnoli)
    * [func archInitCastagnoli()](#archInitCastagnoli)
    * [func castagnoliShift(table *sse42Table, crc uint32) uint32](#castagnoliShift)
    * [func archUpdateCastagnoli(crc uint32, p []byte) uint32](#archUpdateCastagnoli)
    * [func archAvailableIEEE() bool](#archAvailableIEEE)
    * [func archInitIEEE()](#archInitIEEE)
    * [func archUpdateIEEE(crc uint32, p []byte) uint32](#archUpdateIEEE)
    * [func simplePopulateTable(poly uint32, t *Table)](#simplePopulateTable)
    * [func simpleUpdate(crc uint32, tab *Table, p []byte) uint32](#simpleUpdate)
    * [func slicingUpdate(crc uint32, tab *slicing8Table, p []byte) uint32](#slicingUpdate)
    * [func TestCastagnoliRace(t *testing.T)](#TestCastagnoliRace)
    * [func testGoldenIEEE(t *testing.T, crcFunc func(b []byte) uint32)](#testGoldenIEEE)
    * [func testGoldenCastagnoli(t *testing.T, crcFunc func(b []byte) uint32)](#testGoldenCastagnoli)
    * [func testCrossCheck(t *testing.T, crcFunc1, crcFunc2 func(crc uint32, b []byte) uint32)](#testCrossCheck)
    * [func TestSimple(t *testing.T)](#TestSimple)
    * [func TestGoldenMarshal(t *testing.T)](#TestGoldenMarshal)
    * [func TestMarshalTableMismatch(t *testing.T)](#TestMarshalTableMismatch)
    * [func TestSlicing(t *testing.T)](#TestSlicing)
    * [func TestArchIEEE(t *testing.T)](#TestArchIEEE)
    * [func TestArchCastagnoli(t *testing.T)](#TestArchCastagnoli)
    * [func TestGolden(t *testing.T)](#TestGolden)
    * [func BenchmarkCRC32(b *testing.B)](#BenchmarkCRC32)
    * [func benchmarkAll(h hash.Hash32) func(b *testing.B)](#benchmarkAll)
    * [func benchmark(b *testing.B, h hash.Hash32, n, alignment int64)](#benchmark)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="Size" href="#Size">const Size</a>

```
searchKey: crc32.Size
tags: [exported]
```

```Go
const Size = 4
```

The size of a CRC-32 checksum in bytes. 

### <a id="IEEE" href="#IEEE">const IEEE</a>

```
searchKey: crc32.IEEE
tags: [exported]
```

```Go
const IEEE = 0xedb88320
```

Predefined polynomials. 

IEEE is by far and away the most common CRC-32 polynomial. Used by ethernet (IEEE 802.3), v.42, fddi, gzip, zip, png, ... 

### <a id="Castagnoli" href="#Castagnoli">const Castagnoli</a>

```
searchKey: crc32.Castagnoli
tags: [exported]
```

```Go
const Castagnoli = 0x82f63b78
```

Predefined polynomials. 

Castagnoli's polynomial, used in iSCSI. Has better error detection characteristics than IEEE. [https://dx.doi.org/10.1109/26.231911](https://dx.doi.org/10.1109/26.231911) 

### <a id="Koopman" href="#Koopman">const Koopman</a>

```
searchKey: crc32.Koopman
tags: [exported]
```

```Go
const Koopman = 0xeb31d82e
```

Predefined polynomials. 

Koopman's polynomial. Also has better error detection characteristics than IEEE. [https://dx.doi.org/10.1109/DSN.2002.1028931](https://dx.doi.org/10.1109/DSN.2002.1028931) 

### <a id="magic" href="#magic">const magic</a>

```
searchKey: crc32.magic
```

```Go
const magic = "crc\x01"
```

### <a id="marshaledSize" href="#marshaledSize">const marshaledSize</a>

```
searchKey: crc32.marshaledSize
```

```Go
const marshaledSize = len(magic) + 4 + 4
```

### <a id="castagnoliK1" href="#castagnoliK1">const castagnoliK1</a>

```
searchKey: crc32.castagnoliK1
```

```Go
const castagnoliK1 = 168
```

### <a id="castagnoliK2" href="#castagnoliK2">const castagnoliK2</a>

```
searchKey: crc32.castagnoliK2
```

```Go
const castagnoliK2 = 1344
```

### <a id="slicing8Cutoff" href="#slicing8Cutoff">const slicing8Cutoff</a>

```
searchKey: crc32.slicing8Cutoff
```

```Go
const slicing8Cutoff = 16
```

Use slicing-by-8 when payload >= this value. 

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="castagnoliTable" href="#castagnoliTable">var castagnoliTable</a>

```
searchKey: crc32.castagnoliTable
```

```Go
var castagnoliTable *Table
```

castagnoliTable points to a lazily initialized Table for the Castagnoli polynomial. MakeTable will always return this value when asked to make a Castagnoli table so we can compare against it to find when the caller is using this polynomial. 

### <a id="castagnoliTable8" href="#castagnoliTable8">var castagnoliTable8</a>

```
searchKey: crc32.castagnoliTable8
```

```Go
var castagnoliTable8 *slicing8Table
```

### <a id="castagnoliArchImpl" href="#castagnoliArchImpl">var castagnoliArchImpl</a>

```
searchKey: crc32.castagnoliArchImpl
```

```Go
var castagnoliArchImpl bool
```

### <a id="updateCastagnoli" href="#updateCastagnoli">var updateCastagnoli</a>

```
searchKey: crc32.updateCastagnoli
```

```Go
var updateCastagnoli func(crc uint32, p []byte) uint32
```

### <a id="castagnoliOnce" href="#castagnoliOnce">var castagnoliOnce</a>

```
searchKey: crc32.castagnoliOnce
```

```Go
var castagnoliOnce sync.Once
```

### <a id="haveCastagnoli" href="#haveCastagnoli">var haveCastagnoli</a>

```
searchKey: crc32.haveCastagnoli
```

```Go
var haveCastagnoli uint32
```

### <a id="IEEETable" href="#IEEETable">var IEEETable</a>

```
searchKey: crc32.IEEETable
tags: [exported]
```

```Go
var IEEETable = simpleMakeTable(IEEE)
```

IEEETable is the table for the IEEE polynomial. 

### <a id="ieeeTable8" href="#ieeeTable8">var ieeeTable8</a>

```
searchKey: crc32.ieeeTable8
```

```Go
var ieeeTable8 *slicing8Table
```

ieeeTable8 is the slicing8Table for IEEE 

### <a id="ieeeArchImpl" href="#ieeeArchImpl">var ieeeArchImpl</a>

```
searchKey: crc32.ieeeArchImpl
```

```Go
var ieeeArchImpl bool
```

### <a id="updateIEEE" href="#updateIEEE">var updateIEEE</a>

```
searchKey: crc32.updateIEEE
```

```Go
var updateIEEE func(crc uint32, p []byte) uint32
```

### <a id="ieeeOnce" href="#ieeeOnce">var ieeeOnce</a>

```
searchKey: crc32.ieeeOnce
```

```Go
var ieeeOnce sync.Once
```

### <a id="castagnoliSSE42TableK1" href="#castagnoliSSE42TableK1">var castagnoliSSE42TableK1</a>

```
searchKey: crc32.castagnoliSSE42TableK1
```

```Go
var castagnoliSSE42TableK1 *sse42Table
```

### <a id="castagnoliSSE42TableK2" href="#castagnoliSSE42TableK2">var castagnoliSSE42TableK2</a>

```
searchKey: crc32.castagnoliSSE42TableK2
```

```Go
var castagnoliSSE42TableK2 *sse42Table
```

### <a id="archIeeeTable8" href="#archIeeeTable8">var archIeeeTable8</a>

```
searchKey: crc32.archIeeeTable8
```

```Go
var archIeeeTable8 *slicing8Table
```

### <a id="golden" href="#golden">var golden</a>

```
searchKey: crc32.golden
```

```Go
var golden = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Table" href="#Table">type Table [256]uint32</a>

```
searchKey: crc32.Table
tags: [exported]
```

```Go
type Table [256]uint32
```

Table is a 256-word table representing the polynomial for efficient processing. 

#### <a id="MakeTable" href="#MakeTable">func MakeTable(poly uint32) *Table</a>

```
searchKey: crc32.MakeTable
tags: [exported]
```

```Go
func MakeTable(poly uint32) *Table
```

MakeTable returns a Table constructed from the specified polynomial. The contents of this Table must not be modified. 

#### <a id="simpleMakeTable" href="#simpleMakeTable">func simpleMakeTable(poly uint32) *Table</a>

```
searchKey: crc32.simpleMakeTable
```

```Go
func simpleMakeTable(poly uint32) *Table
```

simpleMakeTable allocates and constructs a Table for the specified polynomial. The table is suitable for use with the simple algorithm (simpleUpdate). 

### <a id="digest" href="#digest">type digest struct</a>

```
searchKey: crc32.digest
```

```Go
type digest struct {
	crc uint32
	tab *Table
}
```

digest represents the partial evaluation of a checksum. 

#### <a id="digest.Size" href="#digest.Size">func (d *digest) Size() int</a>

```
searchKey: crc32.digest.Size
```

```Go
func (d *digest) Size() int
```

#### <a id="digest.BlockSize" href="#digest.BlockSize">func (d *digest) BlockSize() int</a>

```
searchKey: crc32.digest.BlockSize
```

```Go
func (d *digest) BlockSize() int
```

#### <a id="digest.Reset" href="#digest.Reset">func (d *digest) Reset()</a>

```
searchKey: crc32.digest.Reset
```

```Go
func (d *digest) Reset()
```

#### <a id="digest.MarshalBinary" href="#digest.MarshalBinary">func (d *digest) MarshalBinary() ([]byte, error)</a>

```
searchKey: crc32.digest.MarshalBinary
```

```Go
func (d *digest) MarshalBinary() ([]byte, error)
```

#### <a id="digest.UnmarshalBinary" href="#digest.UnmarshalBinary">func (d *digest) UnmarshalBinary(b []byte) error</a>

```
searchKey: crc32.digest.UnmarshalBinary
```

```Go
func (d *digest) UnmarshalBinary(b []byte) error
```

#### <a id="digest.Write" href="#digest.Write">func (d *digest) Write(p []byte) (n int, err error)</a>

```
searchKey: crc32.digest.Write
```

```Go
func (d *digest) Write(p []byte) (n int, err error)
```

#### <a id="digest.Sum32" href="#digest.Sum32">func (d *digest) Sum32() uint32</a>

```
searchKey: crc32.digest.Sum32
```

```Go
func (d *digest) Sum32() uint32
```

#### <a id="digest.Sum" href="#digest.Sum">func (d *digest) Sum(in []byte) []byte</a>

```
searchKey: crc32.digest.Sum
```

```Go
func (d *digest) Sum(in []byte) []byte
```

### <a id="sse42Table" href="#sse42Table">type sse42Table [4]crc32.Table</a>

```
searchKey: crc32.sse42Table
```

```Go
type sse42Table [4]Table
```

### <a id="slicing8Table" href="#slicing8Table">type slicing8Table [8]crc32.Table</a>

```
searchKey: crc32.slicing8Table
```

```Go
type slicing8Table [8]Table
```

slicing8Table is array of 8 Tables, used by the slicing-by-8 algorithm. 

#### <a id="slicingMakeTable" href="#slicingMakeTable">func slicingMakeTable(poly uint32) *slicing8Table</a>

```
searchKey: crc32.slicingMakeTable
```

```Go
func slicingMakeTable(poly uint32) *slicing8Table
```

slicingMakeTable constructs a slicing8Table for the specified polynomial. The table is suitable for use with the slicing-by-8 algorithm (slicingUpdate). 

### <a id="test" href="#test">type test struct</a>

```
searchKey: crc32.test
```

```Go
type test struct {
	ieee, castagnoli    uint32
	in                  string
	halfStateIEEE       string // IEEE marshaled hash state after first half of in written, used by TestGoldenMarshal
	halfStateCastagnoli string // Castagnoli marshaled hash state after first half of in written, used by TestGoldenMarshal
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="castagnoliInit" href="#castagnoliInit">func castagnoliInit()</a>

```
searchKey: crc32.castagnoliInit
```

```Go
func castagnoliInit()
```

### <a id="ieeeInit" href="#ieeeInit">func ieeeInit()</a>

```
searchKey: crc32.ieeeInit
```

```Go
func ieeeInit()
```

### <a id="New" href="#New">func New(tab *Table) hash.Hash32</a>

```
searchKey: crc32.New
tags: [exported]
```

```Go
func New(tab *Table) hash.Hash32
```

New creates a new hash.Hash32 computing the CRC-32 checksum using the polynomial represented by the Table. Its Sum method will lay the value out in big-endian byte order. The returned Hash32 also implements encoding.BinaryMarshaler and encoding.BinaryUnmarshaler to marshal and unmarshal the internal state of the hash. 

### <a id="NewIEEE" href="#NewIEEE">func NewIEEE() hash.Hash32</a>

```
searchKey: crc32.NewIEEE
tags: [exported]
```

```Go
func NewIEEE() hash.Hash32
```

NewIEEE creates a new hash.Hash32 computing the CRC-32 checksum using the IEEE polynomial. Its Sum method will lay the value out in big-endian byte order. The returned Hash32 also implements encoding.BinaryMarshaler and encoding.BinaryUnmarshaler to marshal and unmarshal the internal state of the hash. 

### <a id="appendUint32" href="#appendUint32">func appendUint32(b []byte, x uint32) []byte</a>

```
searchKey: crc32.appendUint32
```

```Go
func appendUint32(b []byte, x uint32) []byte
```

### <a id="readUint32" href="#readUint32">func readUint32(b []byte) uint32</a>

```
searchKey: crc32.readUint32
```

```Go
func readUint32(b []byte) uint32
```

### <a id="Update" href="#Update">func Update(crc uint32, tab *Table, p []byte) uint32</a>

```
searchKey: crc32.Update
tags: [exported]
```

```Go
func Update(crc uint32, tab *Table, p []byte) uint32
```

Update returns the result of adding the bytes in p to the crc. 

### <a id="Checksum" href="#Checksum">func Checksum(data []byte, tab *Table) uint32</a>

```
searchKey: crc32.Checksum
tags: [exported]
```

```Go
func Checksum(data []byte, tab *Table) uint32
```

Checksum returns the CRC-32 checksum of data using the polynomial represented by the Table. 

### <a id="ChecksumIEEE" href="#ChecksumIEEE">func ChecksumIEEE(data []byte) uint32</a>

```
searchKey: crc32.ChecksumIEEE
tags: [exported]
```

```Go
func ChecksumIEEE(data []byte) uint32
```

ChecksumIEEE returns the CRC-32 checksum of data using the IEEE polynomial. 

### <a id="tableSum" href="#tableSum">func tableSum(t *Table) uint32</a>

```
searchKey: crc32.tableSum
```

```Go
func tableSum(t *Table) uint32
```

tableSum returns the IEEE checksum of table t. 

### <a id="castagnoliSSE42" href="#castagnoliSSE42">func castagnoliSSE42(crc uint32, p []byte) uint32</a>

```
searchKey: crc32.castagnoliSSE42
```

```Go
func castagnoliSSE42(crc uint32, p []byte) uint32
```

castagnoliSSE42 is defined in crc32_amd64.s and uses the SSE 4.2 CRC32 instruction. 

### <a id="castagnoliSSE42Triple" href="#castagnoliSSE42Triple">func castagnoliSSE42Triple(crcA, crcB, crcC uint32,...</a>

```
searchKey: crc32.castagnoliSSE42Triple
```

```Go
func castagnoliSSE42Triple(
	crcA, crcB, crcC uint32,
	a, b, c []byte,
	rounds uint32,
) (retA uint32, retB uint32, retC uint32)
```

castagnoliSSE42Triple is defined in crc32_amd64.s and uses the SSE 4.2 CRC32 instruction. 

### <a id="ieeeCLMUL" href="#ieeeCLMUL">func ieeeCLMUL(crc uint32, p []byte) uint32</a>

```
searchKey: crc32.ieeeCLMUL
```

```Go
func ieeeCLMUL(crc uint32, p []byte) uint32
```

ieeeCLMUL is defined in crc_amd64.s and uses the PCLMULQDQ instruction as well as SSE 4.1. 

### <a id="archAvailableCastagnoli" href="#archAvailableCastagnoli">func archAvailableCastagnoli() bool</a>

```
searchKey: crc32.archAvailableCastagnoli
```

```Go
func archAvailableCastagnoli() bool
```

### <a id="archInitCastagnoli" href="#archInitCastagnoli">func archInitCastagnoli()</a>

```
searchKey: crc32.archInitCastagnoli
```

```Go
func archInitCastagnoli()
```

### <a id="castagnoliShift" href="#castagnoliShift">func castagnoliShift(table *sse42Table, crc uint32) uint32</a>

```
searchKey: crc32.castagnoliShift
```

```Go
func castagnoliShift(table *sse42Table, crc uint32) uint32
```

castagnoliShift computes the CRC32-C of K1 or K2 zeroes (depending on the table given) with the given initial crc value. This corresponds to CRC(crc, O) in the description in updateCastagnoli. 

### <a id="archUpdateCastagnoli" href="#archUpdateCastagnoli">func archUpdateCastagnoli(crc uint32, p []byte) uint32</a>

```
searchKey: crc32.archUpdateCastagnoli
```

```Go
func archUpdateCastagnoli(crc uint32, p []byte) uint32
```

### <a id="archAvailableIEEE" href="#archAvailableIEEE">func archAvailableIEEE() bool</a>

```
searchKey: crc32.archAvailableIEEE
```

```Go
func archAvailableIEEE() bool
```

### <a id="archInitIEEE" href="#archInitIEEE">func archInitIEEE()</a>

```
searchKey: crc32.archInitIEEE
```

```Go
func archInitIEEE()
```

### <a id="archUpdateIEEE" href="#archUpdateIEEE">func archUpdateIEEE(crc uint32, p []byte) uint32</a>

```
searchKey: crc32.archUpdateIEEE
```

```Go
func archUpdateIEEE(crc uint32, p []byte) uint32
```

### <a id="simplePopulateTable" href="#simplePopulateTable">func simplePopulateTable(poly uint32, t *Table)</a>

```
searchKey: crc32.simplePopulateTable
```

```Go
func simplePopulateTable(poly uint32, t *Table)
```

simplePopulateTable constructs a Table for the specified polynomial, suitable for use with simpleUpdate. 

### <a id="simpleUpdate" href="#simpleUpdate">func simpleUpdate(crc uint32, tab *Table, p []byte) uint32</a>

```
searchKey: crc32.simpleUpdate
```

```Go
func simpleUpdate(crc uint32, tab *Table, p []byte) uint32
```

simpleUpdate uses the simple algorithm to update the CRC, given a table that was previously computed using simpleMakeTable. 

### <a id="slicingUpdate" href="#slicingUpdate">func slicingUpdate(crc uint32, tab *slicing8Table, p []byte) uint32</a>

```
searchKey: crc32.slicingUpdate
```

```Go
func slicingUpdate(crc uint32, tab *slicing8Table, p []byte) uint32
```

slicingUpdate uses the slicing-by-8 algorithm to update the CRC, given a table that was previously computed using slicingMakeTable. 

### <a id="TestCastagnoliRace" href="#TestCastagnoliRace">func TestCastagnoliRace(t *testing.T)</a>

```
searchKey: crc32.TestCastagnoliRace
```

```Go
func TestCastagnoliRace(t *testing.T)
```

First test, so that it can be the one to initialize castagnoliTable. 

### <a id="testGoldenIEEE" href="#testGoldenIEEE">func testGoldenIEEE(t *testing.T, crcFunc func(b []byte) uint32)</a>

```
searchKey: crc32.testGoldenIEEE
```

```Go
func testGoldenIEEE(t *testing.T, crcFunc func(b []byte) uint32)
```

testGoldenIEEE verifies that the given function returns correct IEEE checksums. 

### <a id="testGoldenCastagnoli" href="#testGoldenCastagnoli">func testGoldenCastagnoli(t *testing.T, crcFunc func(b []byte) uint32)</a>

```
searchKey: crc32.testGoldenCastagnoli
```

```Go
func testGoldenCastagnoli(t *testing.T, crcFunc func(b []byte) uint32)
```

testGoldenCastagnoli verifies that the given function returns correct IEEE checksums. 

### <a id="testCrossCheck" href="#testCrossCheck">func testCrossCheck(t *testing.T, crcFunc1, crcFunc2 func(crc uint32, b []byte) uint32)</a>

```
searchKey: crc32.testCrossCheck
```

```Go
func testCrossCheck(t *testing.T, crcFunc1, crcFunc2 func(crc uint32, b []byte) uint32)
```

testCrossCheck generates random buffers of various lengths and verifies that the two "update" functions return the same result. 

### <a id="TestSimple" href="#TestSimple">func TestSimple(t *testing.T)</a>

```
searchKey: crc32.TestSimple
```

```Go
func TestSimple(t *testing.T)
```

TestSimple tests the simple generic algorithm. 

### <a id="TestGoldenMarshal" href="#TestGoldenMarshal">func TestGoldenMarshal(t *testing.T)</a>

```
searchKey: crc32.TestGoldenMarshal
```

```Go
func TestGoldenMarshal(t *testing.T)
```

### <a id="TestMarshalTableMismatch" href="#TestMarshalTableMismatch">func TestMarshalTableMismatch(t *testing.T)</a>

```
searchKey: crc32.TestMarshalTableMismatch
```

```Go
func TestMarshalTableMismatch(t *testing.T)
```

### <a id="TestSlicing" href="#TestSlicing">func TestSlicing(t *testing.T)</a>

```
searchKey: crc32.TestSlicing
```

```Go
func TestSlicing(t *testing.T)
```

TestSimple tests the slicing-by-8 algorithm. 

### <a id="TestArchIEEE" href="#TestArchIEEE">func TestArchIEEE(t *testing.T)</a>

```
searchKey: crc32.TestArchIEEE
```

```Go
func TestArchIEEE(t *testing.T)
```

### <a id="TestArchCastagnoli" href="#TestArchCastagnoli">func TestArchCastagnoli(t *testing.T)</a>

```
searchKey: crc32.TestArchCastagnoli
```

```Go
func TestArchCastagnoli(t *testing.T)
```

### <a id="TestGolden" href="#TestGolden">func TestGolden(t *testing.T)</a>

```
searchKey: crc32.TestGolden
```

```Go
func TestGolden(t *testing.T)
```

### <a id="BenchmarkCRC32" href="#BenchmarkCRC32">func BenchmarkCRC32(b *testing.B)</a>

```
searchKey: crc32.BenchmarkCRC32
```

```Go
func BenchmarkCRC32(b *testing.B)
```

### <a id="benchmarkAll" href="#benchmarkAll">func benchmarkAll(h hash.Hash32) func(b *testing.B)</a>

```
searchKey: crc32.benchmarkAll
```

```Go
func benchmarkAll(h hash.Hash32) func(b *testing.B)
```

### <a id="benchmark" href="#benchmark">func benchmark(b *testing.B, h hash.Hash32, n, alignment int64)</a>

```
searchKey: crc32.benchmark
```

```Go
func benchmark(b *testing.B, h hash.Hash32, n, alignment int64)
```

