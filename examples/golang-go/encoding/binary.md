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
    * [var LittleEndian](#LittleEndian)
    * [var BigEndian](#BigEndian)
    * [var structSize](#structSize)
    * [var overflow](#overflow)
    * [var s](#s)
    * [var big](#big)
    * [var little](#little)
    * [var src](#src)
    * [var res](#res)
    * [var putbuf](#putbuf)
    * [var intArrays](#intArrays)
    * [var tests](#tests)
* [Types](#type)
    * [type ByteOrder interface](#ByteOrder)
    * [type littleEndian struct{}](#littleEndian)
        * [func (littleEndian) Uint16(b []byte) uint16](#littleEndian.Uint16)
        * [func (littleEndian) PutUint16(b []byte, v uint16)](#littleEndian.PutUint16)
        * [func (littleEndian) Uint32(b []byte) uint32](#littleEndian.Uint32)
        * [func (littleEndian) PutUint32(b []byte, v uint32)](#littleEndian.PutUint32)
        * [func (littleEndian) Uint64(b []byte) uint64](#littleEndian.Uint64)
        * [func (littleEndian) PutUint64(b []byte, v uint64)](#littleEndian.PutUint64)
        * [func (littleEndian) String() string](#littleEndian.String)
        * [func (littleEndian) GoString() string](#littleEndian.GoString)
    * [type bigEndian struct{}](#bigEndian)
        * [func (bigEndian) Uint16(b []byte) uint16](#bigEndian.Uint16)
        * [func (bigEndian) PutUint16(b []byte, v uint16)](#bigEndian.PutUint16)
        * [func (bigEndian) Uint32(b []byte) uint32](#bigEndian.Uint32)
        * [func (bigEndian) PutUint32(b []byte, v uint32)](#bigEndian.PutUint32)
        * [func (bigEndian) Uint64(b []byte) uint64](#bigEndian.Uint64)
        * [func (bigEndian) PutUint64(b []byte, v uint64)](#bigEndian.PutUint64)
        * [func (bigEndian) String() string](#bigEndian.String)
        * [func (bigEndian) GoString() string](#bigEndian.GoString)
    * [type coder struct](#coder)
    * [type decoder binary.coder](#decoder)
        * [func (d *decoder) bool() bool](#decoder.bool)
        * [func (d *decoder) uint8() uint8](#decoder.uint8)
        * [func (d *decoder) uint16() uint16](#decoder.uint16)
        * [func (d *decoder) uint32() uint32](#decoder.uint32)
        * [func (d *decoder) uint64() uint64](#decoder.uint64)
        * [func (d *decoder) int8() int8](#decoder.int8)
        * [func (d *decoder) int16() int16](#decoder.int16)
        * [func (d *decoder) int32() int32](#decoder.int32)
        * [func (d *decoder) int64() int64](#decoder.int64)
        * [func (d *decoder) value(v reflect.Value)](#decoder.value)
        * [func (d *decoder) skip(v reflect.Value)](#decoder.skip)
    * [type encoder binary.coder](#encoder)
        * [func (e *encoder) bool(x bool)](#encoder.bool)
        * [func (e *encoder) uint8(x uint8)](#encoder.uint8)
        * [func (e *encoder) uint16(x uint16)](#encoder.uint16)
        * [func (e *encoder) uint32(x uint32)](#encoder.uint32)
        * [func (e *encoder) uint64(x uint64)](#encoder.uint64)
        * [func (e *encoder) int8(x int8)](#encoder.int8)
        * [func (e *encoder) int16(x int16)](#encoder.int16)
        * [func (e *encoder) int32(x int32)](#encoder.int32)
        * [func (e *encoder) int64(x int64)](#encoder.int64)
        * [func (e *encoder) value(v reflect.Value)](#encoder.value)
        * [func (e *encoder) skip(v reflect.Value)](#encoder.skip)
    * [type Struct struct](#Struct)
    * [type T struct](#T)
    * [type BlankFields struct](#BlankFields)
    * [type BlankFieldsProbe struct](#BlankFieldsProbe)
    * [type Unexported struct](#Unexported)
    * [type byteSliceReader struct](#byteSliceReader)
        * [func (br *byteSliceReader) Read(p []byte) (int, error)](#byteSliceReader.Read)
* [Functions](#func)
    * [func Read(r io.Reader, order ByteOrder, data interface{}) error](#Read)
    * [func Write(w io.Writer, order ByteOrder, data interface{}) error](#Write)
    * [func Size(v interface{}) int](#Size)
    * [func dataSize(v reflect.Value) int](#dataSize)
    * [func sizeof(t reflect.Type) int](#sizeof)
    * [func intDataSize(data interface{}) int](#intDataSize)
    * [func PutUvarint(buf []byte, x uint64) int](#PutUvarint)
    * [func Uvarint(buf []byte) (uint64, int)](#Uvarint)
    * [func PutVarint(buf []byte, x int64) int](#PutVarint)
    * [func Varint(buf []byte) (int64, int)](#Varint)
    * [func ReadUvarint(r io.ByteReader) (uint64, error)](#ReadUvarint)
    * [func ReadVarint(r io.ByteReader) (int64, error)](#ReadVarint)
    * [func checkResult(t *testing.T, dir string, order ByteOrder, err error, have, want interface{})](#checkResult)
    * [func testRead(t *testing.T, order ByteOrder, b []byte, s1 interface{})](#testRead)
    * [func testWrite(t *testing.T, order ByteOrder, b []byte, s1 interface{})](#testWrite)
    * [func TestLittleEndianRead(t *testing.T)](#TestLittleEndianRead)
    * [func TestLittleEndianWrite(t *testing.T)](#TestLittleEndianWrite)
    * [func TestLittleEndianPtrWrite(t *testing.T)](#TestLittleEndianPtrWrite)
    * [func TestBigEndianRead(t *testing.T)](#TestBigEndianRead)
    * [func TestBigEndianWrite(t *testing.T)](#TestBigEndianWrite)
    * [func TestBigEndianPtrWrite(t *testing.T)](#TestBigEndianPtrWrite)
    * [func TestReadSlice(t *testing.T)](#TestReadSlice)
    * [func TestWriteSlice(t *testing.T)](#TestWriteSlice)
    * [func TestReadBool(t *testing.T)](#TestReadBool)
    * [func TestReadBoolSlice(t *testing.T)](#TestReadBoolSlice)
    * [func TestSliceRoundTrip(t *testing.T)](#TestSliceRoundTrip)
    * [func TestWriteT(t *testing.T)](#TestWriteT)
    * [func TestBlankFields(t *testing.T)](#TestBlankFields)
    * [func TestSizeStructCache(t *testing.T)](#TestSizeStructCache)
    * [func TestUnexportedRead(t *testing.T)](#TestUnexportedRead)
    * [func TestReadErrorMsg(t *testing.T)](#TestReadErrorMsg)
    * [func TestReadTruncated(t *testing.T)](#TestReadTruncated)
    * [func testUint64SmallSliceLengthPanics() (panicked bool)](#testUint64SmallSliceLengthPanics)
    * [func testPutUint64SmallSliceLengthPanics() (panicked bool)](#testPutUint64SmallSliceLengthPanics)
    * [func TestEarlyBoundsChecks(t *testing.T)](#TestEarlyBoundsChecks)
    * [func TestReadInvalidDestination(t *testing.T)](#TestReadInvalidDestination)
    * [func testReadInvalidDestination(t *testing.T, order ByteOrder)](#testReadInvalidDestination)
    * [func BenchmarkReadSlice1000Int32s(b *testing.B)](#BenchmarkReadSlice1000Int32s)
    * [func BenchmarkReadStruct(b *testing.B)](#BenchmarkReadStruct)
    * [func BenchmarkWriteStruct(b *testing.B)](#BenchmarkWriteStruct)
    * [func BenchmarkReadInts(b *testing.B)](#BenchmarkReadInts)
    * [func BenchmarkWriteInts(b *testing.B)](#BenchmarkWriteInts)
    * [func BenchmarkWriteSlice1000Int32s(b *testing.B)](#BenchmarkWriteSlice1000Int32s)
    * [func BenchmarkPutUint16(b *testing.B)](#BenchmarkPutUint16)
    * [func BenchmarkPutUint32(b *testing.B)](#BenchmarkPutUint32)
    * [func BenchmarkPutUint64(b *testing.B)](#BenchmarkPutUint64)
    * [func BenchmarkLittleEndianPutUint16(b *testing.B)](#BenchmarkLittleEndianPutUint16)
    * [func BenchmarkLittleEndianPutUint32(b *testing.B)](#BenchmarkLittleEndianPutUint32)
    * [func BenchmarkLittleEndianPutUint64(b *testing.B)](#BenchmarkLittleEndianPutUint64)
    * [func BenchmarkReadFloats(b *testing.B)](#BenchmarkReadFloats)
    * [func BenchmarkWriteFloats(b *testing.B)](#BenchmarkWriteFloats)
    * [func BenchmarkReadSlice1000Float32s(b *testing.B)](#BenchmarkReadSlice1000Float32s)
    * [func BenchmarkWriteSlice1000Float32s(b *testing.B)](#BenchmarkWriteSlice1000Float32s)
    * [func BenchmarkReadSlice1000Uint8s(b *testing.B)](#BenchmarkReadSlice1000Uint8s)
    * [func BenchmarkWriteSlice1000Uint8s(b *testing.B)](#BenchmarkWriteSlice1000Uint8s)
    * [func testConstant(t *testing.T, w uint, max int)](#testConstant)
    * [func TestConstants(t *testing.T)](#TestConstants)
    * [func testVarint(t *testing.T, x int64)](#testVarint)
    * [func testUvarint(t *testing.T, x uint64)](#testUvarint)
    * [func TestVarint(t *testing.T)](#TestVarint)
    * [func TestUvarint(t *testing.T)](#TestUvarint)
    * [func TestBufferTooSmall(t *testing.T)](#TestBufferTooSmall)
    * [func TestBufferTooBigWithOverflow(t *testing.T)](#TestBufferTooBigWithOverflow)
    * [func testOverflow(t *testing.T, buf []byte, x0 uint64, n0 int, err0 error)](#testOverflow)
    * [func TestOverflow(t *testing.T)](#TestOverflow)
    * [func TestNonCanonicalZero(t *testing.T)](#TestNonCanonicalZero)
    * [func BenchmarkPutUvarint32(b *testing.B)](#BenchmarkPutUvarint32)
    * [func BenchmarkPutUvarint64(b *testing.B)](#BenchmarkPutUvarint64)


## <a id="const" href="#const">Constants</a>

### <a id="MaxVarintLen16" href="#MaxVarintLen16">const MaxVarintLen16</a>

```
searchKey: binary.MaxVarintLen16
```

```Go
const MaxVarintLen16 = 3
```

MaxVarintLenN is the maximum length of a varint-encoded N-bit integer. 

### <a id="MaxVarintLen32" href="#MaxVarintLen32">const MaxVarintLen32</a>

```
searchKey: binary.MaxVarintLen32
```

```Go
const MaxVarintLen32 = 5
```

MaxVarintLenN is the maximum length of a varint-encoded N-bit integer. 

### <a id="MaxVarintLen64" href="#MaxVarintLen64">const MaxVarintLen64</a>

```
searchKey: binary.MaxVarintLen64
```

```Go
const MaxVarintLen64 = 10
```

MaxVarintLenN is the maximum length of a varint-encoded N-bit integer. 

## <a id="var" href="#var">Variables</a>

### <a id="LittleEndian" href="#LittleEndian">var LittleEndian</a>

```
searchKey: binary.LittleEndian
```

```Go
var LittleEndian littleEndian
```

LittleEndian is the little-endian implementation of ByteOrder. 

### <a id="BigEndian" href="#BigEndian">var BigEndian</a>

```
searchKey: binary.BigEndian
```

```Go
var BigEndian bigEndian
```

BigEndian is the big-endian implementation of ByteOrder. 

### <a id="structSize" href="#structSize">var structSize</a>

```
searchKey: binary.structSize
tags: [private]
```

```Go
var structSize sync.Map // map[reflect.Type]int

```

### <a id="overflow" href="#overflow">var overflow</a>

```
searchKey: binary.overflow
tags: [private]
```

```Go
var overflow = errors.New("binary: varint overflows a 64-bit integer")
```

### <a id="s" href="#s">var s</a>

```
searchKey: binary.s
tags: [private]
```

```Go
var s = ...
```

### <a id="big" href="#big">var big</a>

```
searchKey: binary.big
tags: [private]
```

```Go
var big = ...
```

### <a id="little" href="#little">var little</a>

```
searchKey: binary.little
tags: [private]
```

```Go
var little = ...
```

### <a id="src" href="#src">var src</a>

```
searchKey: binary.src
tags: [private]
```

```Go
var src = []byte{1, 2, 3, 4, 5, 6, 7, 8}
```

### <a id="res" href="#res">var res</a>

```
searchKey: binary.res
tags: [private]
```

```Go
var res = []int32{0x01020304, 0x05060708}
```

### <a id="putbuf" href="#putbuf">var putbuf</a>

```
searchKey: binary.putbuf
tags: [private]
```

```Go
var putbuf = []byte{0, 0, 0, 0, 0, 0, 0, 0}
```

### <a id="intArrays" href="#intArrays">var intArrays</a>

```
searchKey: binary.intArrays
tags: [private]
```

```Go
var intArrays = ...
```

Addresses of arrays are easier to manipulate with reflection than are slices. 

### <a id="tests" href="#tests">var tests</a>

```
searchKey: binary.tests
tags: [private]
```

```Go
var tests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="ByteOrder" href="#ByteOrder">type ByteOrder interface</a>

```
searchKey: binary.ByteOrder
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

### <a id="littleEndian" href="#littleEndian">type littleEndian struct{}</a>

```
searchKey: binary.littleEndian
tags: [private]
```

```Go
type littleEndian struct{}
```

#### <a id="littleEndian.Uint16" href="#littleEndian.Uint16">func (littleEndian) Uint16(b []byte) uint16</a>

```
searchKey: binary.littleEndian.Uint16
tags: [private]
```

```Go
func (littleEndian) Uint16(b []byte) uint16
```

#### <a id="littleEndian.PutUint16" href="#littleEndian.PutUint16">func (littleEndian) PutUint16(b []byte, v uint16)</a>

```
searchKey: binary.littleEndian.PutUint16
tags: [private]
```

```Go
func (littleEndian) PutUint16(b []byte, v uint16)
```

#### <a id="littleEndian.Uint32" href="#littleEndian.Uint32">func (littleEndian) Uint32(b []byte) uint32</a>

```
searchKey: binary.littleEndian.Uint32
tags: [private]
```

```Go
func (littleEndian) Uint32(b []byte) uint32
```

#### <a id="littleEndian.PutUint32" href="#littleEndian.PutUint32">func (littleEndian) PutUint32(b []byte, v uint32)</a>

```
searchKey: binary.littleEndian.PutUint32
tags: [private]
```

```Go
func (littleEndian) PutUint32(b []byte, v uint32)
```

#### <a id="littleEndian.Uint64" href="#littleEndian.Uint64">func (littleEndian) Uint64(b []byte) uint64</a>

```
searchKey: binary.littleEndian.Uint64
tags: [private]
```

```Go
func (littleEndian) Uint64(b []byte) uint64
```

#### <a id="littleEndian.PutUint64" href="#littleEndian.PutUint64">func (littleEndian) PutUint64(b []byte, v uint64)</a>

```
searchKey: binary.littleEndian.PutUint64
tags: [private]
```

```Go
func (littleEndian) PutUint64(b []byte, v uint64)
```

#### <a id="littleEndian.String" href="#littleEndian.String">func (littleEndian) String() string</a>

```
searchKey: binary.littleEndian.String
tags: [private]
```

```Go
func (littleEndian) String() string
```

#### <a id="littleEndian.GoString" href="#littleEndian.GoString">func (littleEndian) GoString() string</a>

```
searchKey: binary.littleEndian.GoString
tags: [private]
```

```Go
func (littleEndian) GoString() string
```

### <a id="bigEndian" href="#bigEndian">type bigEndian struct{}</a>

```
searchKey: binary.bigEndian
tags: [private]
```

```Go
type bigEndian struct{}
```

#### <a id="bigEndian.Uint16" href="#bigEndian.Uint16">func (bigEndian) Uint16(b []byte) uint16</a>

```
searchKey: binary.bigEndian.Uint16
tags: [private]
```

```Go
func (bigEndian) Uint16(b []byte) uint16
```

#### <a id="bigEndian.PutUint16" href="#bigEndian.PutUint16">func (bigEndian) PutUint16(b []byte, v uint16)</a>

```
searchKey: binary.bigEndian.PutUint16
tags: [private]
```

```Go
func (bigEndian) PutUint16(b []byte, v uint16)
```

#### <a id="bigEndian.Uint32" href="#bigEndian.Uint32">func (bigEndian) Uint32(b []byte) uint32</a>

```
searchKey: binary.bigEndian.Uint32
tags: [private]
```

```Go
func (bigEndian) Uint32(b []byte) uint32
```

#### <a id="bigEndian.PutUint32" href="#bigEndian.PutUint32">func (bigEndian) PutUint32(b []byte, v uint32)</a>

```
searchKey: binary.bigEndian.PutUint32
tags: [private]
```

```Go
func (bigEndian) PutUint32(b []byte, v uint32)
```

#### <a id="bigEndian.Uint64" href="#bigEndian.Uint64">func (bigEndian) Uint64(b []byte) uint64</a>

```
searchKey: binary.bigEndian.Uint64
tags: [private]
```

```Go
func (bigEndian) Uint64(b []byte) uint64
```

#### <a id="bigEndian.PutUint64" href="#bigEndian.PutUint64">func (bigEndian) PutUint64(b []byte, v uint64)</a>

```
searchKey: binary.bigEndian.PutUint64
tags: [private]
```

```Go
func (bigEndian) PutUint64(b []byte, v uint64)
```

#### <a id="bigEndian.String" href="#bigEndian.String">func (bigEndian) String() string</a>

```
searchKey: binary.bigEndian.String
tags: [private]
```

```Go
func (bigEndian) String() string
```

#### <a id="bigEndian.GoString" href="#bigEndian.GoString">func (bigEndian) GoString() string</a>

```
searchKey: binary.bigEndian.GoString
tags: [private]
```

```Go
func (bigEndian) GoString() string
```

### <a id="coder" href="#coder">type coder struct</a>

```
searchKey: binary.coder
tags: [private]
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
tags: [private]
```

```Go
type decoder coder
```

#### <a id="decoder.bool" href="#decoder.bool">func (d *decoder) bool() bool</a>

```
searchKey: binary.decoder.bool
tags: [private]
```

```Go
func (d *decoder) bool() bool
```

#### <a id="decoder.uint8" href="#decoder.uint8">func (d *decoder) uint8() uint8</a>

```
searchKey: binary.decoder.uint8
tags: [private]
```

```Go
func (d *decoder) uint8() uint8
```

#### <a id="decoder.uint16" href="#decoder.uint16">func (d *decoder) uint16() uint16</a>

```
searchKey: binary.decoder.uint16
tags: [private]
```

```Go
func (d *decoder) uint16() uint16
```

#### <a id="decoder.uint32" href="#decoder.uint32">func (d *decoder) uint32() uint32</a>

```
searchKey: binary.decoder.uint32
tags: [private]
```

```Go
func (d *decoder) uint32() uint32
```

#### <a id="decoder.uint64" href="#decoder.uint64">func (d *decoder) uint64() uint64</a>

```
searchKey: binary.decoder.uint64
tags: [private]
```

```Go
func (d *decoder) uint64() uint64
```

#### <a id="decoder.int8" href="#decoder.int8">func (d *decoder) int8() int8</a>

```
searchKey: binary.decoder.int8
tags: [private]
```

```Go
func (d *decoder) int8() int8
```

#### <a id="decoder.int16" href="#decoder.int16">func (d *decoder) int16() int16</a>

```
searchKey: binary.decoder.int16
tags: [private]
```

```Go
func (d *decoder) int16() int16
```

#### <a id="decoder.int32" href="#decoder.int32">func (d *decoder) int32() int32</a>

```
searchKey: binary.decoder.int32
tags: [private]
```

```Go
func (d *decoder) int32() int32
```

#### <a id="decoder.int64" href="#decoder.int64">func (d *decoder) int64() int64</a>

```
searchKey: binary.decoder.int64
tags: [private]
```

```Go
func (d *decoder) int64() int64
```

#### <a id="decoder.value" href="#decoder.value">func (d *decoder) value(v reflect.Value)</a>

```
searchKey: binary.decoder.value
tags: [private]
```

```Go
func (d *decoder) value(v reflect.Value)
```

#### <a id="decoder.skip" href="#decoder.skip">func (d *decoder) skip(v reflect.Value)</a>

```
searchKey: binary.decoder.skip
tags: [private]
```

```Go
func (d *decoder) skip(v reflect.Value)
```

### <a id="encoder" href="#encoder">type encoder binary.coder</a>

```
searchKey: binary.encoder
tags: [private]
```

```Go
type encoder coder
```

#### <a id="encoder.bool" href="#encoder.bool">func (e *encoder) bool(x bool)</a>

```
searchKey: binary.encoder.bool
tags: [private]
```

```Go
func (e *encoder) bool(x bool)
```

#### <a id="encoder.uint8" href="#encoder.uint8">func (e *encoder) uint8(x uint8)</a>

```
searchKey: binary.encoder.uint8
tags: [private]
```

```Go
func (e *encoder) uint8(x uint8)
```

#### <a id="encoder.uint16" href="#encoder.uint16">func (e *encoder) uint16(x uint16)</a>

```
searchKey: binary.encoder.uint16
tags: [private]
```

```Go
func (e *encoder) uint16(x uint16)
```

#### <a id="encoder.uint32" href="#encoder.uint32">func (e *encoder) uint32(x uint32)</a>

```
searchKey: binary.encoder.uint32
tags: [private]
```

```Go
func (e *encoder) uint32(x uint32)
```

#### <a id="encoder.uint64" href="#encoder.uint64">func (e *encoder) uint64(x uint64)</a>

```
searchKey: binary.encoder.uint64
tags: [private]
```

```Go
func (e *encoder) uint64(x uint64)
```

#### <a id="encoder.int8" href="#encoder.int8">func (e *encoder) int8(x int8)</a>

```
searchKey: binary.encoder.int8
tags: [private]
```

```Go
func (e *encoder) int8(x int8)
```

#### <a id="encoder.int16" href="#encoder.int16">func (e *encoder) int16(x int16)</a>

```
searchKey: binary.encoder.int16
tags: [private]
```

```Go
func (e *encoder) int16(x int16)
```

#### <a id="encoder.int32" href="#encoder.int32">func (e *encoder) int32(x int32)</a>

```
searchKey: binary.encoder.int32
tags: [private]
```

```Go
func (e *encoder) int32(x int32)
```

#### <a id="encoder.int64" href="#encoder.int64">func (e *encoder) int64(x int64)</a>

```
searchKey: binary.encoder.int64
tags: [private]
```

```Go
func (e *encoder) int64(x int64)
```

#### <a id="encoder.value" href="#encoder.value">func (e *encoder) value(v reflect.Value)</a>

```
searchKey: binary.encoder.value
tags: [private]
```

```Go
func (e *encoder) value(v reflect.Value)
```

#### <a id="encoder.skip" href="#encoder.skip">func (e *encoder) skip(v reflect.Value)</a>

```
searchKey: binary.encoder.skip
tags: [private]
```

```Go
func (e *encoder) skip(v reflect.Value)
```

### <a id="Struct" href="#Struct">type Struct struct</a>

```
searchKey: binary.Struct
tags: [private]
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
tags: [private]
```

```Go
type T struct {
	Int     int
	Uint    uint
	Uintptr uintptr
	Array   [4]int
}
```

### <a id="BlankFields" href="#BlankFields">type BlankFields struct</a>

```
searchKey: binary.BlankFields
tags: [private]
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
tags: [private]
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

### <a id="Unexported" href="#Unexported">type Unexported struct</a>

```
searchKey: binary.Unexported
tags: [private]
```

```Go
type Unexported struct {
	a int32
}
```

### <a id="byteSliceReader" href="#byteSliceReader">type byteSliceReader struct</a>

```
searchKey: binary.byteSliceReader
tags: [private]
```

```Go
type byteSliceReader struct {
	remain []byte
}
```

#### <a id="byteSliceReader.Read" href="#byteSliceReader.Read">func (br *byteSliceReader) Read(p []byte) (int, error)</a>

```
searchKey: binary.byteSliceReader.Read
tags: [private]
```

```Go
func (br *byteSliceReader) Read(p []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="Read" href="#Read">func Read(r io.Reader, order ByteOrder, data interface{}) error</a>

```
searchKey: binary.Read
```

```Go
func Read(r io.Reader, order ByteOrder, data interface{}) error
```

Read reads structured binary data from r into data. Data must be a pointer to a fixed-size value or a slice of fixed-size values. Bytes read from r are decoded using the specified byte order and written to successive fields of the data. When decoding boolean values, a zero byte is decoded as false, and any other non-zero byte is decoded as true. When reading into structs, the field data for fields with blank (_) field names is skipped; i.e., blank field names may be used for padding. When reading into a struct, all non-blank fields must be exported or Read may panic. 

The error is EOF only if no bytes were read. If an EOF happens after reading some but not all the bytes, Read returns ErrUnexpectedEOF. 

### <a id="Write" href="#Write">func Write(w io.Writer, order ByteOrder, data interface{}) error</a>

```
searchKey: binary.Write
```

```Go
func Write(w io.Writer, order ByteOrder, data interface{}) error
```

Write writes the binary representation of data into w. Data must be a fixed-size value or a slice of fixed-size values, or a pointer to such data. Boolean values encode as one byte: 1 for true, and 0 for false. Bytes written to w are encoded using the specified byte order and read from successive fields of the data. When writing structs, zero values are written for fields with blank (_) field names. 

### <a id="Size" href="#Size">func Size(v interface{}) int</a>

```
searchKey: binary.Size
```

```Go
func Size(v interface{}) int
```

Size returns how many bytes Write would generate to encode the value v, which must be a fixed-size value or a slice of fixed-size values, or a pointer to such data. If v is neither of these, Size returns -1. 

### <a id="dataSize" href="#dataSize">func dataSize(v reflect.Value) int</a>

```
searchKey: binary.dataSize
tags: [private]
```

```Go
func dataSize(v reflect.Value) int
```

dataSize returns the number of bytes the actual data represented by v occupies in memory. For compound structures, it sums the sizes of the elements. Thus, for instance, for a slice it returns the length of the slice times the element size and does not count the memory occupied by the header. If the type of v is not acceptable, dataSize returns -1. 

### <a id="sizeof" href="#sizeof">func sizeof(t reflect.Type) int</a>

```
searchKey: binary.sizeof
tags: [private]
```

```Go
func sizeof(t reflect.Type) int
```

sizeof returns the size >= 0 of variables for the given type or -1 if the type is not acceptable. 

### <a id="intDataSize" href="#intDataSize">func intDataSize(data interface{}) int</a>

```
searchKey: binary.intDataSize
tags: [private]
```

```Go
func intDataSize(data interface{}) int
```

intDataSize returns the size of the data required to represent the data when encoded. It returns zero if the type cannot be implemented by the fast path in Read or Write. 

### <a id="PutUvarint" href="#PutUvarint">func PutUvarint(buf []byte, x uint64) int</a>

```
searchKey: binary.PutUvarint
```

```Go
func PutUvarint(buf []byte, x uint64) int
```

PutUvarint encodes a uint64 into buf and returns the number of bytes written. If the buffer is too small, PutUvarint will panic. 

### <a id="Uvarint" href="#Uvarint">func Uvarint(buf []byte) (uint64, int)</a>

```
searchKey: binary.Uvarint
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
### <a id="PutVarint" href="#PutVarint">func PutVarint(buf []byte, x int64) int</a>

```
searchKey: binary.PutVarint
```

```Go
func PutVarint(buf []byte, x int64) int
```

PutVarint encodes an int64 into buf and returns the number of bytes written. If the buffer is too small, PutVarint will panic. 

### <a id="Varint" href="#Varint">func Varint(buf []byte) (int64, int)</a>

```
searchKey: binary.Varint
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
### <a id="ReadUvarint" href="#ReadUvarint">func ReadUvarint(r io.ByteReader) (uint64, error)</a>

```
searchKey: binary.ReadUvarint
```

```Go
func ReadUvarint(r io.ByteReader) (uint64, error)
```

ReadUvarint reads an encoded unsigned integer from r and returns it as a uint64. 

### <a id="ReadVarint" href="#ReadVarint">func ReadVarint(r io.ByteReader) (int64, error)</a>

```
searchKey: binary.ReadVarint
```

```Go
func ReadVarint(r io.ByteReader) (int64, error)
```

ReadVarint reads an encoded signed integer from r and returns it as an int64. 

### <a id="checkResult" href="#checkResult">func checkResult(t *testing.T, dir string, order ByteOrder, err error, have, want interface{})</a>

```
searchKey: binary.checkResult
tags: [private]
```

```Go
func checkResult(t *testing.T, dir string, order ByteOrder, err error, have, want interface{})
```

### <a id="testRead" href="#testRead">func testRead(t *testing.T, order ByteOrder, b []byte, s1 interface{})</a>

```
searchKey: binary.testRead
tags: [private]
```

```Go
func testRead(t *testing.T, order ByteOrder, b []byte, s1 interface{})
```

### <a id="testWrite" href="#testWrite">func testWrite(t *testing.T, order ByteOrder, b []byte, s1 interface{})</a>

```
searchKey: binary.testWrite
tags: [private]
```

```Go
func testWrite(t *testing.T, order ByteOrder, b []byte, s1 interface{})
```

### <a id="TestLittleEndianRead" href="#TestLittleEndianRead">func TestLittleEndianRead(t *testing.T)</a>

```
searchKey: binary.TestLittleEndianRead
tags: [private]
```

```Go
func TestLittleEndianRead(t *testing.T)
```

### <a id="TestLittleEndianWrite" href="#TestLittleEndianWrite">func TestLittleEndianWrite(t *testing.T)</a>

```
searchKey: binary.TestLittleEndianWrite
tags: [private]
```

```Go
func TestLittleEndianWrite(t *testing.T)
```

### <a id="TestLittleEndianPtrWrite" href="#TestLittleEndianPtrWrite">func TestLittleEndianPtrWrite(t *testing.T)</a>

```
searchKey: binary.TestLittleEndianPtrWrite
tags: [private]
```

```Go
func TestLittleEndianPtrWrite(t *testing.T)
```

### <a id="TestBigEndianRead" href="#TestBigEndianRead">func TestBigEndianRead(t *testing.T)</a>

```
searchKey: binary.TestBigEndianRead
tags: [private]
```

```Go
func TestBigEndianRead(t *testing.T)
```

### <a id="TestBigEndianWrite" href="#TestBigEndianWrite">func TestBigEndianWrite(t *testing.T)</a>

```
searchKey: binary.TestBigEndianWrite
tags: [private]
```

```Go
func TestBigEndianWrite(t *testing.T)
```

### <a id="TestBigEndianPtrWrite" href="#TestBigEndianPtrWrite">func TestBigEndianPtrWrite(t *testing.T)</a>

```
searchKey: binary.TestBigEndianPtrWrite
tags: [private]
```

```Go
func TestBigEndianPtrWrite(t *testing.T)
```

### <a id="TestReadSlice" href="#TestReadSlice">func TestReadSlice(t *testing.T)</a>

```
searchKey: binary.TestReadSlice
tags: [private]
```

```Go
func TestReadSlice(t *testing.T)
```

### <a id="TestWriteSlice" href="#TestWriteSlice">func TestWriteSlice(t *testing.T)</a>

```
searchKey: binary.TestWriteSlice
tags: [private]
```

```Go
func TestWriteSlice(t *testing.T)
```

### <a id="TestReadBool" href="#TestReadBool">func TestReadBool(t *testing.T)</a>

```
searchKey: binary.TestReadBool
tags: [private]
```

```Go
func TestReadBool(t *testing.T)
```

### <a id="TestReadBoolSlice" href="#TestReadBoolSlice">func TestReadBoolSlice(t *testing.T)</a>

```
searchKey: binary.TestReadBoolSlice
tags: [private]
```

```Go
func TestReadBoolSlice(t *testing.T)
```

### <a id="TestSliceRoundTrip" href="#TestSliceRoundTrip">func TestSliceRoundTrip(t *testing.T)</a>

```
searchKey: binary.TestSliceRoundTrip
tags: [private]
```

```Go
func TestSliceRoundTrip(t *testing.T)
```

### <a id="TestWriteT" href="#TestWriteT">func TestWriteT(t *testing.T)</a>

```
searchKey: binary.TestWriteT
tags: [private]
```

```Go
func TestWriteT(t *testing.T)
```

### <a id="TestBlankFields" href="#TestBlankFields">func TestBlankFields(t *testing.T)</a>

```
searchKey: binary.TestBlankFields
tags: [private]
```

```Go
func TestBlankFields(t *testing.T)
```

### <a id="TestSizeStructCache" href="#TestSizeStructCache">func TestSizeStructCache(t *testing.T)</a>

```
searchKey: binary.TestSizeStructCache
tags: [private]
```

```Go
func TestSizeStructCache(t *testing.T)
```

### <a id="TestUnexportedRead" href="#TestUnexportedRead">func TestUnexportedRead(t *testing.T)</a>

```
searchKey: binary.TestUnexportedRead
tags: [private]
```

```Go
func TestUnexportedRead(t *testing.T)
```

### <a id="TestReadErrorMsg" href="#TestReadErrorMsg">func TestReadErrorMsg(t *testing.T)</a>

```
searchKey: binary.TestReadErrorMsg
tags: [private]
```

```Go
func TestReadErrorMsg(t *testing.T)
```

### <a id="TestReadTruncated" href="#TestReadTruncated">func TestReadTruncated(t *testing.T)</a>

```
searchKey: binary.TestReadTruncated
tags: [private]
```

```Go
func TestReadTruncated(t *testing.T)
```

### <a id="testUint64SmallSliceLengthPanics" href="#testUint64SmallSliceLengthPanics">func testUint64SmallSliceLengthPanics() (panicked bool)</a>

```
searchKey: binary.testUint64SmallSliceLengthPanics
tags: [private]
```

```Go
func testUint64SmallSliceLengthPanics() (panicked bool)
```

### <a id="testPutUint64SmallSliceLengthPanics" href="#testPutUint64SmallSliceLengthPanics">func testPutUint64SmallSliceLengthPanics() (panicked bool)</a>

```
searchKey: binary.testPutUint64SmallSliceLengthPanics
tags: [private]
```

```Go
func testPutUint64SmallSliceLengthPanics() (panicked bool)
```

### <a id="TestEarlyBoundsChecks" href="#TestEarlyBoundsChecks">func TestEarlyBoundsChecks(t *testing.T)</a>

```
searchKey: binary.TestEarlyBoundsChecks
tags: [private]
```

```Go
func TestEarlyBoundsChecks(t *testing.T)
```

### <a id="TestReadInvalidDestination" href="#TestReadInvalidDestination">func TestReadInvalidDestination(t *testing.T)</a>

```
searchKey: binary.TestReadInvalidDestination
tags: [private]
```

```Go
func TestReadInvalidDestination(t *testing.T)
```

### <a id="testReadInvalidDestination" href="#testReadInvalidDestination">func testReadInvalidDestination(t *testing.T, order ByteOrder)</a>

```
searchKey: binary.testReadInvalidDestination
tags: [private]
```

```Go
func testReadInvalidDestination(t *testing.T, order ByteOrder)
```

### <a id="BenchmarkReadSlice1000Int32s" href="#BenchmarkReadSlice1000Int32s">func BenchmarkReadSlice1000Int32s(b *testing.B)</a>

```
searchKey: binary.BenchmarkReadSlice1000Int32s
tags: [private]
```

```Go
func BenchmarkReadSlice1000Int32s(b *testing.B)
```

### <a id="BenchmarkReadStruct" href="#BenchmarkReadStruct">func BenchmarkReadStruct(b *testing.B)</a>

```
searchKey: binary.BenchmarkReadStruct
tags: [private]
```

```Go
func BenchmarkReadStruct(b *testing.B)
```

### <a id="BenchmarkWriteStruct" href="#BenchmarkWriteStruct">func BenchmarkWriteStruct(b *testing.B)</a>

```
searchKey: binary.BenchmarkWriteStruct
tags: [private]
```

```Go
func BenchmarkWriteStruct(b *testing.B)
```

### <a id="BenchmarkReadInts" href="#BenchmarkReadInts">func BenchmarkReadInts(b *testing.B)</a>

```
searchKey: binary.BenchmarkReadInts
tags: [private]
```

```Go
func BenchmarkReadInts(b *testing.B)
```

### <a id="BenchmarkWriteInts" href="#BenchmarkWriteInts">func BenchmarkWriteInts(b *testing.B)</a>

```
searchKey: binary.BenchmarkWriteInts
tags: [private]
```

```Go
func BenchmarkWriteInts(b *testing.B)
```

### <a id="BenchmarkWriteSlice1000Int32s" href="#BenchmarkWriteSlice1000Int32s">func BenchmarkWriteSlice1000Int32s(b *testing.B)</a>

```
searchKey: binary.BenchmarkWriteSlice1000Int32s
tags: [private]
```

```Go
func BenchmarkWriteSlice1000Int32s(b *testing.B)
```

### <a id="BenchmarkPutUint16" href="#BenchmarkPutUint16">func BenchmarkPutUint16(b *testing.B)</a>

```
searchKey: binary.BenchmarkPutUint16
tags: [private]
```

```Go
func BenchmarkPutUint16(b *testing.B)
```

### <a id="BenchmarkPutUint32" href="#BenchmarkPutUint32">func BenchmarkPutUint32(b *testing.B)</a>

```
searchKey: binary.BenchmarkPutUint32
tags: [private]
```

```Go
func BenchmarkPutUint32(b *testing.B)
```

### <a id="BenchmarkPutUint64" href="#BenchmarkPutUint64">func BenchmarkPutUint64(b *testing.B)</a>

```
searchKey: binary.BenchmarkPutUint64
tags: [private]
```

```Go
func BenchmarkPutUint64(b *testing.B)
```

### <a id="BenchmarkLittleEndianPutUint16" href="#BenchmarkLittleEndianPutUint16">func BenchmarkLittleEndianPutUint16(b *testing.B)</a>

```
searchKey: binary.BenchmarkLittleEndianPutUint16
tags: [private]
```

```Go
func BenchmarkLittleEndianPutUint16(b *testing.B)
```

### <a id="BenchmarkLittleEndianPutUint32" href="#BenchmarkLittleEndianPutUint32">func BenchmarkLittleEndianPutUint32(b *testing.B)</a>

```
searchKey: binary.BenchmarkLittleEndianPutUint32
tags: [private]
```

```Go
func BenchmarkLittleEndianPutUint32(b *testing.B)
```

### <a id="BenchmarkLittleEndianPutUint64" href="#BenchmarkLittleEndianPutUint64">func BenchmarkLittleEndianPutUint64(b *testing.B)</a>

```
searchKey: binary.BenchmarkLittleEndianPutUint64
tags: [private]
```

```Go
func BenchmarkLittleEndianPutUint64(b *testing.B)
```

### <a id="BenchmarkReadFloats" href="#BenchmarkReadFloats">func BenchmarkReadFloats(b *testing.B)</a>

```
searchKey: binary.BenchmarkReadFloats
tags: [private]
```

```Go
func BenchmarkReadFloats(b *testing.B)
```

### <a id="BenchmarkWriteFloats" href="#BenchmarkWriteFloats">func BenchmarkWriteFloats(b *testing.B)</a>

```
searchKey: binary.BenchmarkWriteFloats
tags: [private]
```

```Go
func BenchmarkWriteFloats(b *testing.B)
```

### <a id="BenchmarkReadSlice1000Float32s" href="#BenchmarkReadSlice1000Float32s">func BenchmarkReadSlice1000Float32s(b *testing.B)</a>

```
searchKey: binary.BenchmarkReadSlice1000Float32s
tags: [private]
```

```Go
func BenchmarkReadSlice1000Float32s(b *testing.B)
```

### <a id="BenchmarkWriteSlice1000Float32s" href="#BenchmarkWriteSlice1000Float32s">func BenchmarkWriteSlice1000Float32s(b *testing.B)</a>

```
searchKey: binary.BenchmarkWriteSlice1000Float32s
tags: [private]
```

```Go
func BenchmarkWriteSlice1000Float32s(b *testing.B)
```

### <a id="BenchmarkReadSlice1000Uint8s" href="#BenchmarkReadSlice1000Uint8s">func BenchmarkReadSlice1000Uint8s(b *testing.B)</a>

```
searchKey: binary.BenchmarkReadSlice1000Uint8s
tags: [private]
```

```Go
func BenchmarkReadSlice1000Uint8s(b *testing.B)
```

### <a id="BenchmarkWriteSlice1000Uint8s" href="#BenchmarkWriteSlice1000Uint8s">func BenchmarkWriteSlice1000Uint8s(b *testing.B)</a>

```
searchKey: binary.BenchmarkWriteSlice1000Uint8s
tags: [private]
```

```Go
func BenchmarkWriteSlice1000Uint8s(b *testing.B)
```

### <a id="testConstant" href="#testConstant">func testConstant(t *testing.T, w uint, max int)</a>

```
searchKey: binary.testConstant
tags: [private]
```

```Go
func testConstant(t *testing.T, w uint, max int)
```

### <a id="TestConstants" href="#TestConstants">func TestConstants(t *testing.T)</a>

```
searchKey: binary.TestConstants
tags: [private]
```

```Go
func TestConstants(t *testing.T)
```

### <a id="testVarint" href="#testVarint">func testVarint(t *testing.T, x int64)</a>

```
searchKey: binary.testVarint
tags: [private]
```

```Go
func testVarint(t *testing.T, x int64)
```

### <a id="testUvarint" href="#testUvarint">func testUvarint(t *testing.T, x uint64)</a>

```
searchKey: binary.testUvarint
tags: [private]
```

```Go
func testUvarint(t *testing.T, x uint64)
```

### <a id="TestVarint" href="#TestVarint">func TestVarint(t *testing.T)</a>

```
searchKey: binary.TestVarint
tags: [private]
```

```Go
func TestVarint(t *testing.T)
```

### <a id="TestUvarint" href="#TestUvarint">func TestUvarint(t *testing.T)</a>

```
searchKey: binary.TestUvarint
tags: [private]
```

```Go
func TestUvarint(t *testing.T)
```

### <a id="TestBufferTooSmall" href="#TestBufferTooSmall">func TestBufferTooSmall(t *testing.T)</a>

```
searchKey: binary.TestBufferTooSmall
tags: [private]
```

```Go
func TestBufferTooSmall(t *testing.T)
```

### <a id="TestBufferTooBigWithOverflow" href="#TestBufferTooBigWithOverflow">func TestBufferTooBigWithOverflow(t *testing.T)</a>

```
searchKey: binary.TestBufferTooBigWithOverflow
tags: [private]
```

```Go
func TestBufferTooBigWithOverflow(t *testing.T)
```

Ensure that we catch overflows of bytes going past MaxVarintLen64. See issue [https://golang.org/issues/41185](https://golang.org/issues/41185) 

### <a id="testOverflow" href="#testOverflow">func testOverflow(t *testing.T, buf []byte, x0 uint64, n0 int, err0 error)</a>

```
searchKey: binary.testOverflow
tags: [private]
```

```Go
func testOverflow(t *testing.T, buf []byte, x0 uint64, n0 int, err0 error)
```

### <a id="TestOverflow" href="#TestOverflow">func TestOverflow(t *testing.T)</a>

```
searchKey: binary.TestOverflow
tags: [private]
```

```Go
func TestOverflow(t *testing.T)
```

### <a id="TestNonCanonicalZero" href="#TestNonCanonicalZero">func TestNonCanonicalZero(t *testing.T)</a>

```
searchKey: binary.TestNonCanonicalZero
tags: [private]
```

```Go
func TestNonCanonicalZero(t *testing.T)
```

### <a id="BenchmarkPutUvarint32" href="#BenchmarkPutUvarint32">func BenchmarkPutUvarint32(b *testing.B)</a>

```
searchKey: binary.BenchmarkPutUvarint32
tags: [private]
```

```Go
func BenchmarkPutUvarint32(b *testing.B)
```

### <a id="BenchmarkPutUvarint64" href="#BenchmarkPutUvarint64">func BenchmarkPutUvarint64(b *testing.B)</a>

```
searchKey: binary.BenchmarkPutUvarint64
tags: [private]
```

```Go
func BenchmarkPutUvarint64(b *testing.B)
```

