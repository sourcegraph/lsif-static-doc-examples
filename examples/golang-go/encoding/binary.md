# Package binary

Package binary implements simple translation between numbers and byte sequences and encoding and decoding of varints. 

Numbers are translated by reading and writing fixed-size values. A fixed-size value is either a fixed-size arithmetic type (bool, int8, uint8, int16, float32, complex64, ...) or an array or struct containing only fixed-size values. 

The varint functions encode and decode single integer values using a variable-length encoding; smaller values require fewer bytes. For a specification, see [https://developers.google.com/protocol-buffers/docs/encoding](https://developers.google.com/protocol-buffers/docs/encoding). 

This package favors simplicity over efficiency. Clients that require high-performance serialization, especially for large data structures, should look at more advanced solutions such as the encoding/gob package or protocol buffers. 

## Index

* [Constants](#const)
    * [const MaxVarintLen16](#MaxVarintLen16)
    * [const MaxVarintLen32](#MaxVarintLen32)
    * [const MaxVarintLen64](#MaxVarintLen64)
* [Variables](#var)
    * [var BigEndian](#BigEndian)
    * [var LittleEndian](#LittleEndian)
    * [var big](#big)
    * [var intArrays](#intArrays)
    * [var little](#little)
    * [var overflow](#overflow)
    * [var putbuf](#putbuf)
    * [var res](#res)
    * [var s](#s)
    * [var src](#src)
    * [var structSize](#structSize)
    * [var tests](#tests)
* [Types](#type)
    * [type BlankFields struct](#BlankFields)
    * [type BlankFieldsProbe struct](#BlankFieldsProbe)
    * [type ByteOrder interface](#ByteOrder)
    * [type Struct struct](#Struct)
    * [type T struct](#T)
    * [type Unexported struct](#Unexported)
    * [type bigEndian struct{}](#bigEndian)
        * [func (bigEndian) GoString() string](#bigEndian.GoString)
        * [func (bigEndian) PutUint16(b []byte, v uint16)](#bigEndian.PutUint16)
        * [func (bigEndian) PutUint32(b []byte, v uint32)](#bigEndian.PutUint32)
        * [func (bigEndian) PutUint64(b []byte, v uint64)](#bigEndian.PutUint64)
        * [func (bigEndian) String() string](#bigEndian.String)
        * [func (bigEndian) Uint16(b []byte) uint16](#bigEndian.Uint16)
        * [func (bigEndian) Uint32(b []byte) uint32](#bigEndian.Uint32)
        * [func (bigEndian) Uint64(b []byte) uint64](#bigEndian.Uint64)
    * [type byteSliceReader struct](#byteSliceReader)
        * [func (br *byteSliceReader) Read(p []byte) (int, error)](#byteSliceReader.Read)
    * [type coder struct](#coder)
    * [type decoder binary.coder](#decoder)
        * [func (d *decoder) bool() bool](#decoder.bool)
        * [func (d *decoder) int16() int16](#decoder.int16)
        * [func (d *decoder) int32() int32](#decoder.int32)
        * [func (d *decoder) int64() int64](#decoder.int64)
        * [func (d *decoder) int8() int8](#decoder.int8)
        * [func (d *decoder) skip(v reflect.Value)](#decoder.skip)
        * [func (d *decoder) uint16() uint16](#decoder.uint16)
        * [func (d *decoder) uint32() uint32](#decoder.uint32)
        * [func (d *decoder) uint64() uint64](#decoder.uint64)
        * [func (d *decoder) uint8() uint8](#decoder.uint8)
        * [func (d *decoder) value(v reflect.Value)](#decoder.value)
    * [type encoder binary.coder](#encoder)
        * [func (e *encoder) bool(x bool)](#encoder.bool)
        * [func (e *encoder) int16(x int16)](#encoder.int16)
        * [func (e *encoder) int32(x int32)](#encoder.int32)
        * [func (e *encoder) int64(x int64)](#encoder.int64)
        * [func (e *encoder) int8(x int8)](#encoder.int8)
        * [func (e *encoder) skip(v reflect.Value)](#encoder.skip)
        * [func (e *encoder) uint16(x uint16)](#encoder.uint16)
        * [func (e *encoder) uint32(x uint32)](#encoder.uint32)
        * [func (e *encoder) uint64(x uint64)](#encoder.uint64)
        * [func (e *encoder) uint8(x uint8)](#encoder.uint8)
        * [func (e *encoder) value(v reflect.Value)](#encoder.value)
    * [type littleEndian struct{}](#littleEndian)
        * [func (littleEndian) GoString() string](#littleEndian.GoString)
        * [func (littleEndian) PutUint16(b []byte, v uint16)](#littleEndian.PutUint16)
        * [func (littleEndian) PutUint32(b []byte, v uint32)](#littleEndian.PutUint32)
        * [func (littleEndian) PutUint64(b []byte, v uint64)](#littleEndian.PutUint64)
        * [func (littleEndian) String() string](#littleEndian.String)
        * [func (littleEndian) Uint16(b []byte) uint16](#littleEndian.Uint16)
        * [func (littleEndian) Uint32(b []byte) uint32](#littleEndian.Uint32)
        * [func (littleEndian) Uint64(b []byte) uint64](#littleEndian.Uint64)
* [Functions](#func)
    * [func BenchmarkLittleEndianPutUint16(b *testing.B)](#BenchmarkLittleEndianPutUint16)
    * [func BenchmarkLittleEndianPutUint32(b *testing.B)](#BenchmarkLittleEndianPutUint32)
    * [func BenchmarkLittleEndianPutUint64(b *testing.B)](#BenchmarkLittleEndianPutUint64)
    * [func BenchmarkPutUint16(b *testing.B)](#BenchmarkPutUint16)
    * [func BenchmarkPutUint32(b *testing.B)](#BenchmarkPutUint32)
    * [func BenchmarkPutUint64(b *testing.B)](#BenchmarkPutUint64)
    * [func BenchmarkPutUvarint32(b *testing.B)](#BenchmarkPutUvarint32)
    * [func BenchmarkPutUvarint64(b *testing.B)](#BenchmarkPutUvarint64)
    * [func BenchmarkReadFloats(b *testing.B)](#BenchmarkReadFloats)
    * [func BenchmarkReadInts(b *testing.B)](#BenchmarkReadInts)
    * [func BenchmarkReadSlice1000Float32s(b *testing.B)](#BenchmarkReadSlice1000Float32s)
    * [func BenchmarkReadSlice1000Int32s(b *testing.B)](#BenchmarkReadSlice1000Int32s)
    * [func BenchmarkReadSlice1000Uint8s(b *testing.B)](#BenchmarkReadSlice1000Uint8s)
    * [func BenchmarkReadStruct(b *testing.B)](#BenchmarkReadStruct)
    * [func BenchmarkWriteFloats(b *testing.B)](#BenchmarkWriteFloats)
    * [func BenchmarkWriteInts(b *testing.B)](#BenchmarkWriteInts)
    * [func BenchmarkWriteSlice1000Float32s(b *testing.B)](#BenchmarkWriteSlice1000Float32s)
    * [func BenchmarkWriteSlice1000Int32s(b *testing.B)](#BenchmarkWriteSlice1000Int32s)
    * [func BenchmarkWriteSlice1000Uint8s(b *testing.B)](#BenchmarkWriteSlice1000Uint8s)
    * [func BenchmarkWriteStruct(b *testing.B)](#BenchmarkWriteStruct)
    * [func PutUvarint(buf []byte, x uint64) int](#PutUvarint)
    * [func PutVarint(buf []byte, x int64) int](#PutVarint)
    * [func Read(r io.Reader, order ByteOrder, data interface{}) error](#Read)
    * [func ReadUvarint(r io.ByteReader) (uint64, error)](#ReadUvarint)
    * [func ReadVarint(r io.ByteReader) (int64, error)](#ReadVarint)
    * [func Size(v interface{}) int](#Size)
    * [func TestBigEndianPtrWrite(t *testing.T)](#TestBigEndianPtrWrite)
    * [func TestBigEndianRead(t *testing.T)](#TestBigEndianRead)
    * [func TestBigEndianWrite(t *testing.T)](#TestBigEndianWrite)
    * [func TestBlankFields(t *testing.T)](#TestBlankFields)
    * [func TestBufferTooBigWithOverflow(t *testing.T)](#TestBufferTooBigWithOverflow)
    * [func TestBufferTooSmall(t *testing.T)](#TestBufferTooSmall)
    * [func TestConstants(t *testing.T)](#TestConstants)
    * [func TestEarlyBoundsChecks(t *testing.T)](#TestEarlyBoundsChecks)
    * [func TestLittleEndianPtrWrite(t *testing.T)](#TestLittleEndianPtrWrite)
    * [func TestLittleEndianRead(t *testing.T)](#TestLittleEndianRead)
    * [func TestLittleEndianWrite(t *testing.T)](#TestLittleEndianWrite)
    * [func TestNonCanonicalZero(t *testing.T)](#TestNonCanonicalZero)
    * [func TestOverflow(t *testing.T)](#TestOverflow)
    * [func TestReadBool(t *testing.T)](#TestReadBool)
    * [func TestReadBoolSlice(t *testing.T)](#TestReadBoolSlice)
    * [func TestReadErrorMsg(t *testing.T)](#TestReadErrorMsg)
    * [func TestReadInvalidDestination(t *testing.T)](#TestReadInvalidDestination)
    * [func TestReadSlice(t *testing.T)](#TestReadSlice)
    * [func TestReadTruncated(t *testing.T)](#TestReadTruncated)
    * [func TestSizeStructCache(t *testing.T)](#TestSizeStructCache)
    * [func TestSliceRoundTrip(t *testing.T)](#TestSliceRoundTrip)
    * [func TestUnexportedRead(t *testing.T)](#TestUnexportedRead)
    * [func TestUvarint(t *testing.T)](#TestUvarint)
    * [func TestVarint(t *testing.T)](#TestVarint)
    * [func TestWriteSlice(t *testing.T)](#TestWriteSlice)
    * [func TestWriteT(t *testing.T)](#TestWriteT)
    * [func Uvarint(buf []byte) (uint64, int)](#Uvarint)
    * [func Varint(buf []byte) (int64, int)](#Varint)
    * [func Write(w io.Writer, order ByteOrder, data interface{}) error](#Write)
    * [func checkResult(t *testing.T, dir string, order ByteOrder, err error, have, want interface{})](#checkResult)
    * [func dataSize(v reflect.Value) int](#dataSize)
    * [func intDataSize(data interface{}) int](#intDataSize)
    * [func sizeof(t reflect.Type) int](#sizeof)
    * [func testConstant(t *testing.T, w uint, max int)](#testConstant)
    * [func testOverflow(t *testing.T, buf []byte, x0 uint64, n0 int, err0 error)](#testOverflow)
    * [func testPutUint64SmallSliceLengthPanics() (panicked bool)](#testPutUint64SmallSliceLengthPanics)
    * [func testRead(t *testing.T, order ByteOrder, b []byte, s1 interface{})](#testRead)
    * [func testReadInvalidDestination(t *testing.T, order ByteOrder)](#testReadInvalidDestination)
    * [func testUint64SmallSliceLengthPanics() (panicked bool)](#testUint64SmallSliceLengthPanics)
    * [func testUvarint(t *testing.T, x uint64)](#testUvarint)
    * [func testVarint(t *testing.T, x int64)](#testVarint)
    * [func testWrite(t *testing.T, order ByteOrder, b []byte, s1 interface{})](#testWrite)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="MaxVarintLen16" href="#MaxVarintLen16">const MaxVarintLen16</a>

```
searchKey: binary.MaxVarintLen16
tags: [constant number]
```

```Go
const MaxVarintLen16 = 3
```

MaxVarintLenN is the maximum length of a varint-encoded N-bit integer. 

### <a id="MaxVarintLen32" href="#MaxVarintLen32">const MaxVarintLen32</a>

```
searchKey: binary.MaxVarintLen32
tags: [constant number]
```

```Go
const MaxVarintLen32 = 5
```

MaxVarintLenN is the maximum length of a varint-encoded N-bit integer. 

### <a id="MaxVarintLen64" href="#MaxVarintLen64">const MaxVarintLen64</a>

```
searchKey: binary.MaxVarintLen64
tags: [constant number]
```

```Go
const MaxVarintLen64 = 10
```

MaxVarintLenN is the maximum length of a varint-encoded N-bit integer. 

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="BigEndian" href="#BigEndian">var BigEndian</a>

```
searchKey: binary.BigEndian
tags: [variable struct]
```

```Go
var BigEndian bigEndian
```

BigEndian is the big-endian implementation of ByteOrder. 

### <a id="LittleEndian" href="#LittleEndian">var LittleEndian</a>

```
searchKey: binary.LittleEndian
tags: [variable struct]
```

```Go
var LittleEndian littleEndian
```

LittleEndian is the little-endian implementation of ByteOrder. 

### <a id="big" href="#big">var big</a>

```
searchKey: binary.big
tags: [variable array number private]
```

```Go
var big = ...
```

### <a id="intArrays" href="#intArrays">var intArrays</a>

```
searchKey: binary.intArrays
tags: [variable array interface private]
```

```Go
var intArrays = ...
```

Addresses of arrays are easier to manipulate with reflection than are slices. 

### <a id="little" href="#little">var little</a>

```
searchKey: binary.little
tags: [variable array number private]
```

```Go
var little = ...
```

### <a id="overflow" href="#overflow">var overflow</a>

```
searchKey: binary.overflow
tags: [variable interface private]
```

```Go
var overflow = errors.New("binary: varint overflows a 64-bit integer")
```

### <a id="putbuf" href="#putbuf">var putbuf</a>

```
searchKey: binary.putbuf
tags: [variable array number private]
```

```Go
var putbuf = []byte{0, 0, 0, 0, 0, 0, 0, 0}
```

### <a id="res" href="#res">var res</a>

```
searchKey: binary.res
tags: [variable array number private]
```

```Go
var res = []int32{0x01020304, 0x05060708}
```

### <a id="s" href="#s">var s</a>

```
searchKey: binary.s
tags: [variable struct private]
```

```Go
var s = ...
```

### <a id="src" href="#src">var src</a>

```
searchKey: binary.src
tags: [variable array number private]
```

```Go
var src = []byte{1, 2, 3, 4, 5, 6, 7, 8}
```

### <a id="structSize" href="#structSize">var structSize</a>

```
searchKey: binary.structSize
tags: [variable struct private]
```

```Go
var structSize sync.Map // map[reflect.Type]int

```

### <a id="tests" href="#tests">var tests</a>

```
searchKey: binary.tests
tags: [variable array number private]
```

```Go
var tests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="BlankFields" href="#BlankFields">type BlankFields struct</a>

```
searchKey: binary.BlankFields
tags: [struct private]
```

```Go
type BlankFields struct {
	A uint32
	_ int32
	B float64
	_ [4]int16
	C byte
	_ [7]byte
	_ struct {
		f [8]float32
	}
}
```

### <a id="BlankFieldsProbe" href="#BlankFieldsProbe">type BlankFieldsProbe struct</a>

```
searchKey: binary.BlankFieldsProbe
tags: [struct private]
```

```Go
type BlankFieldsProbe struct {
	A  uint32
	P0 int32
	B  float64
	P1 [4]int16
	C  byte
	P2 [7]byte
	P3 struct {
		F [8]float32
	}
}
```

### <a id="ByteOrder" href="#ByteOrder">type ByteOrder interface</a>

```
searchKey: binary.ByteOrder
tags: [interface]
```

```Go
type ByteOrder interface {
	Uint16([]byte) uint16
	Uint32([]byte) uint32
	Uint64([]byte) uint64
	PutUint16([]byte, uint16)
	PutUint32([]byte, uint32)
	PutUint64([]byte, uint64)
	String() string
}
```

A ByteOrder specifies how to convert byte sequences into 16-, 32-, or 64-bit unsigned integers. 

### <a id="Struct" href="#Struct">type Struct struct</a>

```
searchKey: binary.Struct
tags: [struct private]
```

```Go
type Struct struct {
	Int8       int8
	Int16      int16
	Int32      int32
	Int64      int64
	Uint8      uint8
	Uint16     uint16
	Uint32     uint32
	Uint64     uint64
	Float32    float32
	Float64    float64
	Complex64  complex64
	Complex128 complex128
	Array      [4]uint8
	Bool       bool
	BoolArray  [4]bool
}
```

### <a id="T" href="#T">type T struct</a>

```
searchKey: binary.T
tags: [struct private]
```

```Go
type T struct {
	Int     int
	Uint    uint
	Uintptr uintptr
	Array   [4]int
}
```

### <a id="Unexported" href="#Unexported">type Unexported struct</a>

```
searchKey: binary.Unexported
tags: [struct private]
```

```Go
type Unexported struct {
	a int32
}
```

### <a id="bigEndian" href="#bigEndian">type bigEndian struct{}</a>

```
searchKey: binary.bigEndian
tags: [struct private]
```

```Go
type bigEndian struct{}
```

#### <a id="bigEndian.GoString" href="#bigEndian.GoString">func (bigEndian) GoString() string</a>

```
searchKey: binary.bigEndian.GoString
tags: [function private]
```

```Go
func (bigEndian) GoString() string
```

#### <a id="bigEndian.PutUint16" href="#bigEndian.PutUint16">func (bigEndian) PutUint16(b []byte, v uint16)</a>

```
searchKey: binary.bigEndian.PutUint16
tags: [method private]
```

```Go
func (bigEndian) PutUint16(b []byte, v uint16)
```

#### <a id="bigEndian.PutUint32" href="#bigEndian.PutUint32">func (bigEndian) PutUint32(b []byte, v uint32)</a>

```
searchKey: binary.bigEndian.PutUint32
tags: [method private]
```

```Go
func (bigEndian) PutUint32(b []byte, v uint32)
```

#### <a id="bigEndian.PutUint64" href="#bigEndian.PutUint64">func (bigEndian) PutUint64(b []byte, v uint64)</a>

```
searchKey: binary.bigEndian.PutUint64
tags: [method private]
```

```Go
func (bigEndian) PutUint64(b []byte, v uint64)
```

#### <a id="bigEndian.String" href="#bigEndian.String">func (bigEndian) String() string</a>

```
searchKey: binary.bigEndian.String
tags: [function private]
```

```Go
func (bigEndian) String() string
```

#### <a id="bigEndian.Uint16" href="#bigEndian.Uint16">func (bigEndian) Uint16(b []byte) uint16</a>

```
searchKey: binary.bigEndian.Uint16
tags: [method private]
```

```Go
func (bigEndian) Uint16(b []byte) uint16
```

#### <a id="bigEndian.Uint32" href="#bigEndian.Uint32">func (bigEndian) Uint32(b []byte) uint32</a>

```
searchKey: binary.bigEndian.Uint32
tags: [method private]
```

```Go
func (bigEndian) Uint32(b []byte) uint32
```

#### <a id="bigEndian.Uint64" href="#bigEndian.Uint64">func (bigEndian) Uint64(b []byte) uint64</a>

```
searchKey: binary.bigEndian.Uint64
tags: [method private]
```

```Go
func (bigEndian) Uint64(b []byte) uint64
```

### <a id="byteSliceReader" href="#byteSliceReader">type byteSliceReader struct</a>

```
searchKey: binary.byteSliceReader
tags: [struct private]
```

```Go
type byteSliceReader struct {
	remain []byte
}
```

#### <a id="byteSliceReader.Read" href="#byteSliceReader.Read">func (br *byteSliceReader) Read(p []byte) (int, error)</a>

```
searchKey: binary.byteSliceReader.Read
tags: [method private]
```

```Go
func (br *byteSliceReader) Read(p []byte) (int, error)
```

### <a id="coder" href="#coder">type coder struct</a>

```
searchKey: binary.coder
tags: [struct private]
```

```Go
type coder struct {
	order  ByteOrder
	buf    []byte
	offset int
}
```

### <a id="decoder" href="#decoder">type decoder binary.coder</a>

```
searchKey: binary.decoder
tags: [struct private]
```

```Go
type decoder coder
```

#### <a id="decoder.bool" href="#decoder.bool">func (d *decoder) bool() bool</a>

```
searchKey: binary.decoder.bool
tags: [function private]
```

```Go
func (d *decoder) bool() bool
```

#### <a id="decoder.int16" href="#decoder.int16">func (d *decoder) int16() int16</a>

```
searchKey: binary.decoder.int16
tags: [function private]
```

```Go
func (d *decoder) int16() int16
```

#### <a id="decoder.int32" href="#decoder.int32">func (d *decoder) int32() int32</a>

```
searchKey: binary.decoder.int32
tags: [function private]
```

```Go
func (d *decoder) int32() int32
```

#### <a id="decoder.int64" href="#decoder.int64">func (d *decoder) int64() int64</a>

```
searchKey: binary.decoder.int64
tags: [function private]
```

```Go
func (d *decoder) int64() int64
```

#### <a id="decoder.int8" href="#decoder.int8">func (d *decoder) int8() int8</a>

```
searchKey: binary.decoder.int8
tags: [function private]
```

```Go
func (d *decoder) int8() int8
```

#### <a id="decoder.skip" href="#decoder.skip">func (d *decoder) skip(v reflect.Value)</a>

```
searchKey: binary.decoder.skip
tags: [method private]
```

```Go
func (d *decoder) skip(v reflect.Value)
```

#### <a id="decoder.uint16" href="#decoder.uint16">func (d *decoder) uint16() uint16</a>

```
searchKey: binary.decoder.uint16
tags: [function private]
```

```Go
func (d *decoder) uint16() uint16
```

#### <a id="decoder.uint32" href="#decoder.uint32">func (d *decoder) uint32() uint32</a>

```
searchKey: binary.decoder.uint32
tags: [function private]
```

```Go
func (d *decoder) uint32() uint32
```

#### <a id="decoder.uint64" href="#decoder.uint64">func (d *decoder) uint64() uint64</a>

```
searchKey: binary.decoder.uint64
tags: [function private]
```

```Go
func (d *decoder) uint64() uint64
```

#### <a id="decoder.uint8" href="#decoder.uint8">func (d *decoder) uint8() uint8</a>

```
searchKey: binary.decoder.uint8
tags: [function private]
```

```Go
func (d *decoder) uint8() uint8
```

#### <a id="decoder.value" href="#decoder.value">func (d *decoder) value(v reflect.Value)</a>

```
searchKey: binary.decoder.value
tags: [method private]
```

```Go
func (d *decoder) value(v reflect.Value)
```

### <a id="encoder" href="#encoder">type encoder binary.coder</a>

```
searchKey: binary.encoder
tags: [struct private]
```

```Go
type encoder coder
```

#### <a id="encoder.bool" href="#encoder.bool">func (e *encoder) bool(x bool)</a>

```
searchKey: binary.encoder.bool
tags: [method private]
```

```Go
func (e *encoder) bool(x bool)
```

#### <a id="encoder.int16" href="#encoder.int16">func (e *encoder) int16(x int16)</a>

```
searchKey: binary.encoder.int16
tags: [method private]
```

```Go
func (e *encoder) int16(x int16)
```

#### <a id="encoder.int32" href="#encoder.int32">func (e *encoder) int32(x int32)</a>

```
searchKey: binary.encoder.int32
tags: [method private]
```

```Go
func (e *encoder) int32(x int32)
```

#### <a id="encoder.int64" href="#encoder.int64">func (e *encoder) int64(x int64)</a>

```
searchKey: binary.encoder.int64
tags: [method private]
```

```Go
func (e *encoder) int64(x int64)
```

#### <a id="encoder.int8" href="#encoder.int8">func (e *encoder) int8(x int8)</a>

```
searchKey: binary.encoder.int8
tags: [method private]
```

```Go
func (e *encoder) int8(x int8)
```

#### <a id="encoder.skip" href="#encoder.skip">func (e *encoder) skip(v reflect.Value)</a>

```
searchKey: binary.encoder.skip
tags: [method private]
```

```Go
func (e *encoder) skip(v reflect.Value)
```

#### <a id="encoder.uint16" href="#encoder.uint16">func (e *encoder) uint16(x uint16)</a>

```
searchKey: binary.encoder.uint16
tags: [method private]
```

```Go
func (e *encoder) uint16(x uint16)
```

#### <a id="encoder.uint32" href="#encoder.uint32">func (e *encoder) uint32(x uint32)</a>

```
searchKey: binary.encoder.uint32
tags: [method private]
```

```Go
func (e *encoder) uint32(x uint32)
```

#### <a id="encoder.uint64" href="#encoder.uint64">func (e *encoder) uint64(x uint64)</a>

```
searchKey: binary.encoder.uint64
tags: [method private]
```

```Go
func (e *encoder) uint64(x uint64)
```

#### <a id="encoder.uint8" href="#encoder.uint8">func (e *encoder) uint8(x uint8)</a>

```
searchKey: binary.encoder.uint8
tags: [method private]
```

```Go
func (e *encoder) uint8(x uint8)
```

#### <a id="encoder.value" href="#encoder.value">func (e *encoder) value(v reflect.Value)</a>

```
searchKey: binary.encoder.value
tags: [method private]
```

```Go
func (e *encoder) value(v reflect.Value)
```

### <a id="littleEndian" href="#littleEndian">type littleEndian struct{}</a>

```
searchKey: binary.littleEndian
tags: [struct private]
```

```Go
type littleEndian struct{}
```

#### <a id="littleEndian.GoString" href="#littleEndian.GoString">func (littleEndian) GoString() string</a>

```
searchKey: binary.littleEndian.GoString
tags: [function private]
```

```Go
func (littleEndian) GoString() string
```

#### <a id="littleEndian.PutUint16" href="#littleEndian.PutUint16">func (littleEndian) PutUint16(b []byte, v uint16)</a>

```
searchKey: binary.littleEndian.PutUint16
tags: [method private]
```

```Go
func (littleEndian) PutUint16(b []byte, v uint16)
```

#### <a id="littleEndian.PutUint32" href="#littleEndian.PutUint32">func (littleEndian) PutUint32(b []byte, v uint32)</a>

```
searchKey: binary.littleEndian.PutUint32
tags: [method private]
```

```Go
func (littleEndian) PutUint32(b []byte, v uint32)
```

#### <a id="littleEndian.PutUint64" href="#littleEndian.PutUint64">func (littleEndian) PutUint64(b []byte, v uint64)</a>

```
searchKey: binary.littleEndian.PutUint64
tags: [method private]
```

```Go
func (littleEndian) PutUint64(b []byte, v uint64)
```

#### <a id="littleEndian.String" href="#littleEndian.String">func (littleEndian) String() string</a>

```
searchKey: binary.littleEndian.String
tags: [function private]
```

```Go
func (littleEndian) String() string
```

#### <a id="littleEndian.Uint16" href="#littleEndian.Uint16">func (littleEndian) Uint16(b []byte) uint16</a>

```
searchKey: binary.littleEndian.Uint16
tags: [method private]
```

```Go
func (littleEndian) Uint16(b []byte) uint16
```

#### <a id="littleEndian.Uint32" href="#littleEndian.Uint32">func (littleEndian) Uint32(b []byte) uint32</a>

```
searchKey: binary.littleEndian.Uint32
tags: [method private]
```

```Go
func (littleEndian) Uint32(b []byte) uint32
```

#### <a id="littleEndian.Uint64" href="#littleEndian.Uint64">func (littleEndian) Uint64(b []byte) uint64</a>

```
searchKey: binary.littleEndian.Uint64
tags: [method private]
```

```Go
func (littleEndian) Uint64(b []byte) uint64
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkLittleEndianPutUint16" href="#BenchmarkLittleEndianPutUint16">func BenchmarkLittleEndianPutUint16(b *testing.B)</a>

```
searchKey: binary.BenchmarkLittleEndianPutUint16
tags: [method private benchmark]
```

```Go
func BenchmarkLittleEndianPutUint16(b *testing.B)
```

### <a id="BenchmarkLittleEndianPutUint32" href="#BenchmarkLittleEndianPutUint32">func BenchmarkLittleEndianPutUint32(b *testing.B)</a>

```
searchKey: binary.BenchmarkLittleEndianPutUint32
tags: [method private benchmark]
```

```Go
func BenchmarkLittleEndianPutUint32(b *testing.B)
```

### <a id="BenchmarkLittleEndianPutUint64" href="#BenchmarkLittleEndianPutUint64">func BenchmarkLittleEndianPutUint64(b *testing.B)</a>

```
searchKey: binary.BenchmarkLittleEndianPutUint64
tags: [method private benchmark]
```

```Go
func BenchmarkLittleEndianPutUint64(b *testing.B)
```

### <a id="BenchmarkPutUint16" href="#BenchmarkPutUint16">func BenchmarkPutUint16(b *testing.B)</a>

```
searchKey: binary.BenchmarkPutUint16
tags: [method private benchmark]
```

```Go
func BenchmarkPutUint16(b *testing.B)
```

### <a id="BenchmarkPutUint32" href="#BenchmarkPutUint32">func BenchmarkPutUint32(b *testing.B)</a>

```
searchKey: binary.BenchmarkPutUint32
tags: [method private benchmark]
```

```Go
func BenchmarkPutUint32(b *testing.B)
```

### <a id="BenchmarkPutUint64" href="#BenchmarkPutUint64">func BenchmarkPutUint64(b *testing.B)</a>

```
searchKey: binary.BenchmarkPutUint64
tags: [method private benchmark]
```

```Go
func BenchmarkPutUint64(b *testing.B)
```

### <a id="BenchmarkPutUvarint32" href="#BenchmarkPutUvarint32">func BenchmarkPutUvarint32(b *testing.B)</a>

```
searchKey: binary.BenchmarkPutUvarint32
tags: [method private benchmark]
```

```Go
func BenchmarkPutUvarint32(b *testing.B)
```

### <a id="BenchmarkPutUvarint64" href="#BenchmarkPutUvarint64">func BenchmarkPutUvarint64(b *testing.B)</a>

```
searchKey: binary.BenchmarkPutUvarint64
tags: [method private benchmark]
```

```Go
func BenchmarkPutUvarint64(b *testing.B)
```

### <a id="BenchmarkReadFloats" href="#BenchmarkReadFloats">func BenchmarkReadFloats(b *testing.B)</a>

```
searchKey: binary.BenchmarkReadFloats
tags: [method private benchmark]
```

```Go
func BenchmarkReadFloats(b *testing.B)
```

### <a id="BenchmarkReadInts" href="#BenchmarkReadInts">func BenchmarkReadInts(b *testing.B)</a>

```
searchKey: binary.BenchmarkReadInts
tags: [method private benchmark]
```

```Go
func BenchmarkReadInts(b *testing.B)
```

### <a id="BenchmarkReadSlice1000Float32s" href="#BenchmarkReadSlice1000Float32s">func BenchmarkReadSlice1000Float32s(b *testing.B)</a>

```
searchKey: binary.BenchmarkReadSlice1000Float32s
tags: [method private benchmark]
```

```Go
func BenchmarkReadSlice1000Float32s(b *testing.B)
```

### <a id="BenchmarkReadSlice1000Int32s" href="#BenchmarkReadSlice1000Int32s">func BenchmarkReadSlice1000Int32s(b *testing.B)</a>

```
searchKey: binary.BenchmarkReadSlice1000Int32s
tags: [method private benchmark]
```

```Go
func BenchmarkReadSlice1000Int32s(b *testing.B)
```

### <a id="BenchmarkReadSlice1000Uint8s" href="#BenchmarkReadSlice1000Uint8s">func BenchmarkReadSlice1000Uint8s(b *testing.B)</a>

```
searchKey: binary.BenchmarkReadSlice1000Uint8s
tags: [method private benchmark]
```

```Go
func BenchmarkReadSlice1000Uint8s(b *testing.B)
```

### <a id="BenchmarkReadStruct" href="#BenchmarkReadStruct">func BenchmarkReadStruct(b *testing.B)</a>

```
searchKey: binary.BenchmarkReadStruct
tags: [method private benchmark]
```

```Go
func BenchmarkReadStruct(b *testing.B)
```

### <a id="BenchmarkWriteFloats" href="#BenchmarkWriteFloats">func BenchmarkWriteFloats(b *testing.B)</a>

```
searchKey: binary.BenchmarkWriteFloats
tags: [method private benchmark]
```

```Go
func BenchmarkWriteFloats(b *testing.B)
```

### <a id="BenchmarkWriteInts" href="#BenchmarkWriteInts">func BenchmarkWriteInts(b *testing.B)</a>

```
searchKey: binary.BenchmarkWriteInts
tags: [method private benchmark]
```

```Go
func BenchmarkWriteInts(b *testing.B)
```

### <a id="BenchmarkWriteSlice1000Float32s" href="#BenchmarkWriteSlice1000Float32s">func BenchmarkWriteSlice1000Float32s(b *testing.B)</a>

```
searchKey: binary.BenchmarkWriteSlice1000Float32s
tags: [method private benchmark]
```

```Go
func BenchmarkWriteSlice1000Float32s(b *testing.B)
```

### <a id="BenchmarkWriteSlice1000Int32s" href="#BenchmarkWriteSlice1000Int32s">func BenchmarkWriteSlice1000Int32s(b *testing.B)</a>

```
searchKey: binary.BenchmarkWriteSlice1000Int32s
tags: [method private benchmark]
```

```Go
func BenchmarkWriteSlice1000Int32s(b *testing.B)
```

### <a id="BenchmarkWriteSlice1000Uint8s" href="#BenchmarkWriteSlice1000Uint8s">func BenchmarkWriteSlice1000Uint8s(b *testing.B)</a>

```
searchKey: binary.BenchmarkWriteSlice1000Uint8s
tags: [method private benchmark]
```

```Go
func BenchmarkWriteSlice1000Uint8s(b *testing.B)
```

### <a id="BenchmarkWriteStruct" href="#BenchmarkWriteStruct">func BenchmarkWriteStruct(b *testing.B)</a>

```
searchKey: binary.BenchmarkWriteStruct
tags: [method private benchmark]
```

```Go
func BenchmarkWriteStruct(b *testing.B)
```

### <a id="PutUvarint" href="#PutUvarint">func PutUvarint(buf []byte, x uint64) int</a>

```
searchKey: binary.PutUvarint
tags: [method]
```

```Go
func PutUvarint(buf []byte, x uint64) int
```

PutUvarint encodes a uint64 into buf and returns the number of bytes written. If the buffer is too small, PutUvarint will panic. 

### <a id="PutVarint" href="#PutVarint">func PutVarint(buf []byte, x int64) int</a>

```
searchKey: binary.PutVarint
tags: [method]
```

```Go
func PutVarint(buf []byte, x int64) int
```

PutVarint encodes an int64 into buf and returns the number of bytes written. If the buffer is too small, PutVarint will panic. 

### <a id="Read" href="#Read">func Read(r io.Reader, order ByteOrder, data interface{}) error</a>

```
searchKey: binary.Read
tags: [method]
```

```Go
func Read(r io.Reader, order ByteOrder, data interface{}) error
```

Read reads structured binary data from r into data. Data must be a pointer to a fixed-size value or a slice of fixed-size values. Bytes read from r are decoded using the specified byte order and written to successive fields of the data. When decoding boolean values, a zero byte is decoded as false, and any other non-zero byte is decoded as true. When reading into structs, the field data for fields with blank (_) field names is skipped; i.e., blank field names may be used for padding. When reading into a struct, all non-blank fields must be exported or Read may panic. 

The error is EOF only if no bytes were read. If an EOF happens after reading some but not all the bytes, Read returns ErrUnexpectedEOF. 

### <a id="ReadUvarint" href="#ReadUvarint">func ReadUvarint(r io.ByteReader) (uint64, error)</a>

```
searchKey: binary.ReadUvarint
tags: [method]
```

```Go
func ReadUvarint(r io.ByteReader) (uint64, error)
```

ReadUvarint reads an encoded unsigned integer from r and returns it as a uint64. 

### <a id="ReadVarint" href="#ReadVarint">func ReadVarint(r io.ByteReader) (int64, error)</a>

```
searchKey: binary.ReadVarint
tags: [method]
```

```Go
func ReadVarint(r io.ByteReader) (int64, error)
```

ReadVarint reads an encoded signed integer from r and returns it as an int64. 

### <a id="Size" href="#Size">func Size(v interface{}) int</a>

```
searchKey: binary.Size
tags: [method]
```

```Go
func Size(v interface{}) int
```

Size returns how many bytes Write would generate to encode the value v, which must be a fixed-size value or a slice of fixed-size values, or a pointer to such data. If v is neither of these, Size returns -1. 

### <a id="TestBigEndianPtrWrite" href="#TestBigEndianPtrWrite">func TestBigEndianPtrWrite(t *testing.T)</a>

```
searchKey: binary.TestBigEndianPtrWrite
tags: [method private test]
```

```Go
func TestBigEndianPtrWrite(t *testing.T)
```

### <a id="TestBigEndianRead" href="#TestBigEndianRead">func TestBigEndianRead(t *testing.T)</a>

```
searchKey: binary.TestBigEndianRead
tags: [method private test]
```

```Go
func TestBigEndianRead(t *testing.T)
```

### <a id="TestBigEndianWrite" href="#TestBigEndianWrite">func TestBigEndianWrite(t *testing.T)</a>

```
searchKey: binary.TestBigEndianWrite
tags: [method private test]
```

```Go
func TestBigEndianWrite(t *testing.T)
```

### <a id="TestBlankFields" href="#TestBlankFields">func TestBlankFields(t *testing.T)</a>

```
searchKey: binary.TestBlankFields
tags: [method private test]
```

```Go
func TestBlankFields(t *testing.T)
```

### <a id="TestBufferTooBigWithOverflow" href="#TestBufferTooBigWithOverflow">func TestBufferTooBigWithOverflow(t *testing.T)</a>

```
searchKey: binary.TestBufferTooBigWithOverflow
tags: [method private test]
```

```Go
func TestBufferTooBigWithOverflow(t *testing.T)
```

Ensure that we catch overflows of bytes going past MaxVarintLen64. See issue [https://golang.org/issues/41185](https://golang.org/issues/41185) 

### <a id="TestBufferTooSmall" href="#TestBufferTooSmall">func TestBufferTooSmall(t *testing.T)</a>

```
searchKey: binary.TestBufferTooSmall
tags: [method private test]
```

```Go
func TestBufferTooSmall(t *testing.T)
```

### <a id="TestConstants" href="#TestConstants">func TestConstants(t *testing.T)</a>

```
searchKey: binary.TestConstants
tags: [method private test]
```

```Go
func TestConstants(t *testing.T)
```

### <a id="TestEarlyBoundsChecks" href="#TestEarlyBoundsChecks">func TestEarlyBoundsChecks(t *testing.T)</a>

```
searchKey: binary.TestEarlyBoundsChecks
tags: [method private test]
```

```Go
func TestEarlyBoundsChecks(t *testing.T)
```

### <a id="TestLittleEndianPtrWrite" href="#TestLittleEndianPtrWrite">func TestLittleEndianPtrWrite(t *testing.T)</a>

```
searchKey: binary.TestLittleEndianPtrWrite
tags: [method private test]
```

```Go
func TestLittleEndianPtrWrite(t *testing.T)
```

### <a id="TestLittleEndianRead" href="#TestLittleEndianRead">func TestLittleEndianRead(t *testing.T)</a>

```
searchKey: binary.TestLittleEndianRead
tags: [method private test]
```

```Go
func TestLittleEndianRead(t *testing.T)
```

### <a id="TestLittleEndianWrite" href="#TestLittleEndianWrite">func TestLittleEndianWrite(t *testing.T)</a>

```
searchKey: binary.TestLittleEndianWrite
tags: [method private test]
```

```Go
func TestLittleEndianWrite(t *testing.T)
```

### <a id="TestNonCanonicalZero" href="#TestNonCanonicalZero">func TestNonCanonicalZero(t *testing.T)</a>

```
searchKey: binary.TestNonCanonicalZero
tags: [method private test]
```

```Go
func TestNonCanonicalZero(t *testing.T)
```

### <a id="TestOverflow" href="#TestOverflow">func TestOverflow(t *testing.T)</a>

```
searchKey: binary.TestOverflow
tags: [method private test]
```

```Go
func TestOverflow(t *testing.T)
```

### <a id="TestReadBool" href="#TestReadBool">func TestReadBool(t *testing.T)</a>

```
searchKey: binary.TestReadBool
tags: [method private test]
```

```Go
func TestReadBool(t *testing.T)
```

### <a id="TestReadBoolSlice" href="#TestReadBoolSlice">func TestReadBoolSlice(t *testing.T)</a>

```
searchKey: binary.TestReadBoolSlice
tags: [method private test]
```

```Go
func TestReadBoolSlice(t *testing.T)
```

### <a id="TestReadErrorMsg" href="#TestReadErrorMsg">func TestReadErrorMsg(t *testing.T)</a>

```
searchKey: binary.TestReadErrorMsg
tags: [method private test]
```

```Go
func TestReadErrorMsg(t *testing.T)
```

### <a id="TestReadInvalidDestination" href="#TestReadInvalidDestination">func TestReadInvalidDestination(t *testing.T)</a>

```
searchKey: binary.TestReadInvalidDestination
tags: [method private test]
```

```Go
func TestReadInvalidDestination(t *testing.T)
```

### <a id="TestReadSlice" href="#TestReadSlice">func TestReadSlice(t *testing.T)</a>

```
searchKey: binary.TestReadSlice
tags: [method private test]
```

```Go
func TestReadSlice(t *testing.T)
```

### <a id="TestReadTruncated" href="#TestReadTruncated">func TestReadTruncated(t *testing.T)</a>

```
searchKey: binary.TestReadTruncated
tags: [method private test]
```

```Go
func TestReadTruncated(t *testing.T)
```

### <a id="TestSizeStructCache" href="#TestSizeStructCache">func TestSizeStructCache(t *testing.T)</a>

```
searchKey: binary.TestSizeStructCache
tags: [method private test]
```

```Go
func TestSizeStructCache(t *testing.T)
```

### <a id="TestSliceRoundTrip" href="#TestSliceRoundTrip">func TestSliceRoundTrip(t *testing.T)</a>

```
searchKey: binary.TestSliceRoundTrip
tags: [method private test]
```

```Go
func TestSliceRoundTrip(t *testing.T)
```

### <a id="TestUnexportedRead" href="#TestUnexportedRead">func TestUnexportedRead(t *testing.T)</a>

```
searchKey: binary.TestUnexportedRead
tags: [method private test]
```

```Go
func TestUnexportedRead(t *testing.T)
```

### <a id="TestUvarint" href="#TestUvarint">func TestUvarint(t *testing.T)</a>

```
searchKey: binary.TestUvarint
tags: [method private test]
```

```Go
func TestUvarint(t *testing.T)
```

### <a id="TestVarint" href="#TestVarint">func TestVarint(t *testing.T)</a>

```
searchKey: binary.TestVarint
tags: [method private test]
```

```Go
func TestVarint(t *testing.T)
```

### <a id="TestWriteSlice" href="#TestWriteSlice">func TestWriteSlice(t *testing.T)</a>

```
searchKey: binary.TestWriteSlice
tags: [method private test]
```

```Go
func TestWriteSlice(t *testing.T)
```

### <a id="TestWriteT" href="#TestWriteT">func TestWriteT(t *testing.T)</a>

```
searchKey: binary.TestWriteT
tags: [method private test]
```

```Go
func TestWriteT(t *testing.T)
```

### <a id="Uvarint" href="#Uvarint">func Uvarint(buf []byte) (uint64, int)</a>

```
searchKey: binary.Uvarint
tags: [method]
```

```Go
func Uvarint(buf []byte) (uint64, int)
```

Uvarint decodes a uint64 from buf and returns that value and the number of bytes read (> 0). If an error occurred, the value is 0 and the number of bytes n is <= 0 meaning: 

```
n == 0: buf too small
n  < 0: value larger than 64 bits (overflow)
        and -n is the number of bytes read

```
### <a id="Varint" href="#Varint">func Varint(buf []byte) (int64, int)</a>

```
searchKey: binary.Varint
tags: [method]
```

```Go
func Varint(buf []byte) (int64, int)
```

Varint decodes an int64 from buf and returns that value and the number of bytes read (> 0). If an error occurred, the value is 0 and the number of bytes n is <= 0 with the following meaning: 

```
n == 0: buf too small
n  < 0: value larger than 64 bits (overflow)
        and -n is the number of bytes read

```
### <a id="Write" href="#Write">func Write(w io.Writer, order ByteOrder, data interface{}) error</a>

```
searchKey: binary.Write
tags: [method]
```

```Go
func Write(w io.Writer, order ByteOrder, data interface{}) error
```

Write writes the binary representation of data into w. Data must be a fixed-size value or a slice of fixed-size values, or a pointer to such data. Boolean values encode as one byte: 1 for true, and 0 for false. Bytes written to w are encoded using the specified byte order and read from successive fields of the data. When writing structs, zero values are written for fields with blank (_) field names. 

### <a id="checkResult" href="#checkResult">func checkResult(t *testing.T, dir string, order ByteOrder, err error, have, want interface{})</a>

```
searchKey: binary.checkResult
tags: [method private]
```

```Go
func checkResult(t *testing.T, dir string, order ByteOrder, err error, have, want interface{})
```

### <a id="dataSize" href="#dataSize">func dataSize(v reflect.Value) int</a>

```
searchKey: binary.dataSize
tags: [method private]
```

```Go
func dataSize(v reflect.Value) int
```

dataSize returns the number of bytes the actual data represented by v occupies in memory. For compound structures, it sums the sizes of the elements. Thus, for instance, for a slice it returns the length of the slice times the element size and does not count the memory occupied by the header. If the type of v is not acceptable, dataSize returns -1. 

### <a id="intDataSize" href="#intDataSize">func intDataSize(data interface{}) int</a>

```
searchKey: binary.intDataSize
tags: [method private]
```

```Go
func intDataSize(data interface{}) int
```

intDataSize returns the size of the data required to represent the data when encoded. It returns zero if the type cannot be implemented by the fast path in Read or Write. 

### <a id="sizeof" href="#sizeof">func sizeof(t reflect.Type) int</a>

```
searchKey: binary.sizeof
tags: [method private]
```

```Go
func sizeof(t reflect.Type) int
```

sizeof returns the size >= 0 of variables for the given type or -1 if the type is not acceptable. 

### <a id="testConstant" href="#testConstant">func testConstant(t *testing.T, w uint, max int)</a>

```
searchKey: binary.testConstant
tags: [method private]
```

```Go
func testConstant(t *testing.T, w uint, max int)
```

### <a id="testOverflow" href="#testOverflow">func testOverflow(t *testing.T, buf []byte, x0 uint64, n0 int, err0 error)</a>

```
searchKey: binary.testOverflow
tags: [method private]
```

```Go
func testOverflow(t *testing.T, buf []byte, x0 uint64, n0 int, err0 error)
```

### <a id="testPutUint64SmallSliceLengthPanics" href="#testPutUint64SmallSliceLengthPanics">func testPutUint64SmallSliceLengthPanics() (panicked bool)</a>

```
searchKey: binary.testPutUint64SmallSliceLengthPanics
tags: [function private]
```

```Go
func testPutUint64SmallSliceLengthPanics() (panicked bool)
```

### <a id="testRead" href="#testRead">func testRead(t *testing.T, order ByteOrder, b []byte, s1 interface{})</a>

```
searchKey: binary.testRead
tags: [method private]
```

```Go
func testRead(t *testing.T, order ByteOrder, b []byte, s1 interface{})
```

### <a id="testReadInvalidDestination" href="#testReadInvalidDestination">func testReadInvalidDestination(t *testing.T, order ByteOrder)</a>

```
searchKey: binary.testReadInvalidDestination
tags: [method private]
```

```Go
func testReadInvalidDestination(t *testing.T, order ByteOrder)
```

### <a id="testUint64SmallSliceLengthPanics" href="#testUint64SmallSliceLengthPanics">func testUint64SmallSliceLengthPanics() (panicked bool)</a>

```
searchKey: binary.testUint64SmallSliceLengthPanics
tags: [function private]
```

```Go
func testUint64SmallSliceLengthPanics() (panicked bool)
```

### <a id="testUvarint" href="#testUvarint">func testUvarint(t *testing.T, x uint64)</a>

```
searchKey: binary.testUvarint
tags: [method private]
```

```Go
func testUvarint(t *testing.T, x uint64)
```

### <a id="testVarint" href="#testVarint">func testVarint(t *testing.T, x int64)</a>

```
searchKey: binary.testVarint
tags: [method private]
```

```Go
func testVarint(t *testing.T, x int64)
```

### <a id="testWrite" href="#testWrite">func testWrite(t *testing.T, order ByteOrder, b []byte, s1 interface{})</a>

```
searchKey: binary.testWrite
tags: [method private]
```

```Go
func testWrite(t *testing.T, order ByteOrder, b []byte, s1 interface{})
```

