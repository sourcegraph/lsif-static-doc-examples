# Package bits_test

## Index

* [Constants](#const)
    * [const _M](#_M)
    * [const _M32](#_M32)
    * [const _M64](#_M64)
    * [const divZeroError](#divZeroError)
    * [const overflowError](#overflowError)
* [Variables](#var)
    * [var Input](#Input)
    * [var Output](#Output)
    * [var tab](#tab)
* [Types](#type)
    * [type entry struct](#entry)
* [Functions](#func)
    * [func TestUintSize(t *testing.T)](#TestUintSize)
    * [func TestLeadingZeros(t *testing.T)](#TestLeadingZeros)
    * [func BenchmarkLeadingZeros(b *testing.B)](#BenchmarkLeadingZeros)
    * [func BenchmarkLeadingZeros8(b *testing.B)](#BenchmarkLeadingZeros8)
    * [func BenchmarkLeadingZeros16(b *testing.B)](#BenchmarkLeadingZeros16)
    * [func BenchmarkLeadingZeros32(b *testing.B)](#BenchmarkLeadingZeros32)
    * [func BenchmarkLeadingZeros64(b *testing.B)](#BenchmarkLeadingZeros64)
    * [func TestTrailingZeros(t *testing.T)](#TestTrailingZeros)
    * [func BenchmarkTrailingZeros(b *testing.B)](#BenchmarkTrailingZeros)
    * [func BenchmarkTrailingZeros8(b *testing.B)](#BenchmarkTrailingZeros8)
    * [func BenchmarkTrailingZeros16(b *testing.B)](#BenchmarkTrailingZeros16)
    * [func BenchmarkTrailingZeros32(b *testing.B)](#BenchmarkTrailingZeros32)
    * [func BenchmarkTrailingZeros64(b *testing.B)](#BenchmarkTrailingZeros64)
    * [func TestOnesCount(t *testing.T)](#TestOnesCount)
    * [func testOnesCount(t *testing.T, x uint64, want int)](#testOnesCount)
    * [func BenchmarkOnesCount(b *testing.B)](#BenchmarkOnesCount)
    * [func BenchmarkOnesCount8(b *testing.B)](#BenchmarkOnesCount8)
    * [func BenchmarkOnesCount16(b *testing.B)](#BenchmarkOnesCount16)
    * [func BenchmarkOnesCount32(b *testing.B)](#BenchmarkOnesCount32)
    * [func BenchmarkOnesCount64(b *testing.B)](#BenchmarkOnesCount64)
    * [func TestRotateLeft(t *testing.T)](#TestRotateLeft)
    * [func BenchmarkRotateLeft(b *testing.B)](#BenchmarkRotateLeft)
    * [func BenchmarkRotateLeft8(b *testing.B)](#BenchmarkRotateLeft8)
    * [func BenchmarkRotateLeft16(b *testing.B)](#BenchmarkRotateLeft16)
    * [func BenchmarkRotateLeft32(b *testing.B)](#BenchmarkRotateLeft32)
    * [func BenchmarkRotateLeft64(b *testing.B)](#BenchmarkRotateLeft64)
    * [func TestReverse(t *testing.T)](#TestReverse)
    * [func testReverse(t *testing.T, x64, want64 uint64)](#testReverse)
    * [func BenchmarkReverse(b *testing.B)](#BenchmarkReverse)
    * [func BenchmarkReverse8(b *testing.B)](#BenchmarkReverse8)
    * [func BenchmarkReverse16(b *testing.B)](#BenchmarkReverse16)
    * [func BenchmarkReverse32(b *testing.B)](#BenchmarkReverse32)
    * [func BenchmarkReverse64(b *testing.B)](#BenchmarkReverse64)
    * [func TestReverseBytes(t *testing.T)](#TestReverseBytes)
    * [func testReverseBytes(t *testing.T, x64, want64 uint64)](#testReverseBytes)
    * [func BenchmarkReverseBytes(b *testing.B)](#BenchmarkReverseBytes)
    * [func BenchmarkReverseBytes16(b *testing.B)](#BenchmarkReverseBytes16)
    * [func BenchmarkReverseBytes32(b *testing.B)](#BenchmarkReverseBytes32)
    * [func BenchmarkReverseBytes64(b *testing.B)](#BenchmarkReverseBytes64)
    * [func TestLen(t *testing.T)](#TestLen)
    * [func TestAddSubUint(t *testing.T)](#TestAddSubUint)
    * [func TestAddSubUint32(t *testing.T)](#TestAddSubUint32)
    * [func TestAddSubUint64(t *testing.T)](#TestAddSubUint64)
    * [func TestAdd64OverflowPanic(t *testing.T)](#TestAdd64OverflowPanic)
    * [func TestSub64OverflowPanic(t *testing.T)](#TestSub64OverflowPanic)
    * [func TestMulDiv(t *testing.T)](#TestMulDiv)
    * [func TestMulDiv32(t *testing.T)](#TestMulDiv32)
    * [func TestMulDiv64(t *testing.T)](#TestMulDiv64)
    * [func TestDivPanicOverflow(t *testing.T)](#TestDivPanicOverflow)
    * [func TestDiv32PanicOverflow(t *testing.T)](#TestDiv32PanicOverflow)
    * [func TestDiv64PanicOverflow(t *testing.T)](#TestDiv64PanicOverflow)
    * [func TestDivPanicZero(t *testing.T)](#TestDivPanicZero)
    * [func TestDiv32PanicZero(t *testing.T)](#TestDiv32PanicZero)
    * [func TestDiv64PanicZero(t *testing.T)](#TestDiv64PanicZero)
    * [func TestRem32(t *testing.T)](#TestRem32)
    * [func TestRem32Overflow(t *testing.T)](#TestRem32Overflow)
    * [func TestRem64(t *testing.T)](#TestRem64)
    * [func TestRem64Overflow(t *testing.T)](#TestRem64Overflow)
    * [func BenchmarkAdd(b *testing.B)](#BenchmarkAdd)
    * [func BenchmarkAdd32(b *testing.B)](#BenchmarkAdd32)
    * [func BenchmarkAdd64(b *testing.B)](#BenchmarkAdd64)
    * [func BenchmarkAdd64multiple(b *testing.B)](#BenchmarkAdd64multiple)
    * [func BenchmarkSub(b *testing.B)](#BenchmarkSub)
    * [func BenchmarkSub32(b *testing.B)](#BenchmarkSub32)
    * [func BenchmarkSub64(b *testing.B)](#BenchmarkSub64)
    * [func BenchmarkSub64multiple(b *testing.B)](#BenchmarkSub64multiple)
    * [func BenchmarkMul(b *testing.B)](#BenchmarkMul)
    * [func BenchmarkMul32(b *testing.B)](#BenchmarkMul32)
    * [func BenchmarkMul64(b *testing.B)](#BenchmarkMul64)
    * [func BenchmarkDiv(b *testing.B)](#BenchmarkDiv)
    * [func BenchmarkDiv32(b *testing.B)](#BenchmarkDiv32)
    * [func BenchmarkDiv64(b *testing.B)](#BenchmarkDiv64)
    * [func init()](#init.bits_test.go)
    * [func ExampleLeadingZeros8()](#ExampleLeadingZeros8)
    * [func ExampleLeadingZeros16()](#ExampleLeadingZeros16)
    * [func ExampleLeadingZeros32()](#ExampleLeadingZeros32)
    * [func ExampleLeadingZeros64()](#ExampleLeadingZeros64)
    * [func ExampleTrailingZeros8()](#ExampleTrailingZeros8)
    * [func ExampleTrailingZeros16()](#ExampleTrailingZeros16)
    * [func ExampleTrailingZeros32()](#ExampleTrailingZeros32)
    * [func ExampleTrailingZeros64()](#ExampleTrailingZeros64)
    * [func ExampleOnesCount()](#ExampleOnesCount)
    * [func ExampleOnesCount8()](#ExampleOnesCount8)
    * [func ExampleOnesCount16()](#ExampleOnesCount16)
    * [func ExampleOnesCount32()](#ExampleOnesCount32)
    * [func ExampleOnesCount64()](#ExampleOnesCount64)
    * [func ExampleRotateLeft8()](#ExampleRotateLeft8)
    * [func ExampleRotateLeft16()](#ExampleRotateLeft16)
    * [func ExampleRotateLeft32()](#ExampleRotateLeft32)
    * [func ExampleRotateLeft64()](#ExampleRotateLeft64)
    * [func ExampleReverse8()](#ExampleReverse8)
    * [func ExampleReverse16()](#ExampleReverse16)
    * [func ExampleReverse32()](#ExampleReverse32)
    * [func ExampleReverse64()](#ExampleReverse64)
    * [func ExampleReverseBytes16()](#ExampleReverseBytes16)
    * [func ExampleReverseBytes32()](#ExampleReverseBytes32)
    * [func ExampleReverseBytes64()](#ExampleReverseBytes64)
    * [func ExampleLen8()](#ExampleLen8)
    * [func ExampleLen16()](#ExampleLen16)
    * [func ExampleLen32()](#ExampleLen32)
    * [func ExampleLen64()](#ExampleLen64)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="_M" href="#_M">const _M</a>

```
searchKey: bits_test._M
tags: [private]
```

```Go
const _M = 1<<UintSize - 1
```

### <a id="_M32" href="#_M32">const _M32</a>

```
searchKey: bits_test._M32
tags: [private]
```

```Go
const _M32 = 1<<32 - 1
```

### <a id="_M64" href="#_M64">const _M64</a>

```
searchKey: bits_test._M64
tags: [private]
```

```Go
const _M64 = 1<<64 - 1
```

### <a id="divZeroError" href="#divZeroError">const divZeroError</a>

```
searchKey: bits_test.divZeroError
tags: [private]
```

```Go
const divZeroError = "runtime error: integer divide by zero"
```

### <a id="overflowError" href="#overflowError">const overflowError</a>

```
searchKey: bits_test.overflowError
tags: [private]
```

```Go
const overflowError = "runtime error: integer overflow"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="Input" href="#Input">var Input</a>

```
searchKey: bits_test.Input
tags: [private]
```

```Go
var Input uint64 = DeBruijn64
```

Exported (global) variable serving as input for some of the benchmarks to ensure side-effect free calls are not optimized away. 

### <a id="Output" href="#Output">var Output</a>

```
searchKey: bits_test.Output
tags: [private]
```

```Go
var Output int
```

Exported (global) variable to store function results during benchmarking to ensure side-effect free calls are not optimized away. 

### <a id="tab" href="#tab">var tab</a>

```
searchKey: bits_test.tab
tags: [private]
```

```Go
var tab [256]entry
```

tab contains results for all uint8 values 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="entry" href="#entry">type entry struct</a>

```
searchKey: bits_test.entry
tags: [private]
```

```Go
type entry = struct {
	nlz, ntz, pop int
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestUintSize" href="#TestUintSize">func TestUintSize(t *testing.T)</a>

```
searchKey: bits_test.TestUintSize
tags: [private]
```

```Go
func TestUintSize(t *testing.T)
```

### <a id="TestLeadingZeros" href="#TestLeadingZeros">func TestLeadingZeros(t *testing.T)</a>

```
searchKey: bits_test.TestLeadingZeros
tags: [private]
```

```Go
func TestLeadingZeros(t *testing.T)
```

### <a id="BenchmarkLeadingZeros" href="#BenchmarkLeadingZeros">func BenchmarkLeadingZeros(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkLeadingZeros
tags: [private]
```

```Go
func BenchmarkLeadingZeros(b *testing.B)
```

### <a id="BenchmarkLeadingZeros8" href="#BenchmarkLeadingZeros8">func BenchmarkLeadingZeros8(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkLeadingZeros8
tags: [private]
```

```Go
func BenchmarkLeadingZeros8(b *testing.B)
```

### <a id="BenchmarkLeadingZeros16" href="#BenchmarkLeadingZeros16">func BenchmarkLeadingZeros16(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkLeadingZeros16
tags: [private]
```

```Go
func BenchmarkLeadingZeros16(b *testing.B)
```

### <a id="BenchmarkLeadingZeros32" href="#BenchmarkLeadingZeros32">func BenchmarkLeadingZeros32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkLeadingZeros32
tags: [private]
```

```Go
func BenchmarkLeadingZeros32(b *testing.B)
```

### <a id="BenchmarkLeadingZeros64" href="#BenchmarkLeadingZeros64">func BenchmarkLeadingZeros64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkLeadingZeros64
tags: [private]
```

```Go
func BenchmarkLeadingZeros64(b *testing.B)
```

### <a id="TestTrailingZeros" href="#TestTrailingZeros">func TestTrailingZeros(t *testing.T)</a>

```
searchKey: bits_test.TestTrailingZeros
tags: [private]
```

```Go
func TestTrailingZeros(t *testing.T)
```

### <a id="BenchmarkTrailingZeros" href="#BenchmarkTrailingZeros">func BenchmarkTrailingZeros(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkTrailingZeros
tags: [private]
```

```Go
func BenchmarkTrailingZeros(b *testing.B)
```

### <a id="BenchmarkTrailingZeros8" href="#BenchmarkTrailingZeros8">func BenchmarkTrailingZeros8(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkTrailingZeros8
tags: [private]
```

```Go
func BenchmarkTrailingZeros8(b *testing.B)
```

### <a id="BenchmarkTrailingZeros16" href="#BenchmarkTrailingZeros16">func BenchmarkTrailingZeros16(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkTrailingZeros16
tags: [private]
```

```Go
func BenchmarkTrailingZeros16(b *testing.B)
```

### <a id="BenchmarkTrailingZeros32" href="#BenchmarkTrailingZeros32">func BenchmarkTrailingZeros32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkTrailingZeros32
tags: [private]
```

```Go
func BenchmarkTrailingZeros32(b *testing.B)
```

### <a id="BenchmarkTrailingZeros64" href="#BenchmarkTrailingZeros64">func BenchmarkTrailingZeros64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkTrailingZeros64
tags: [private]
```

```Go
func BenchmarkTrailingZeros64(b *testing.B)
```

### <a id="TestOnesCount" href="#TestOnesCount">func TestOnesCount(t *testing.T)</a>

```
searchKey: bits_test.TestOnesCount
tags: [private]
```

```Go
func TestOnesCount(t *testing.T)
```

### <a id="testOnesCount" href="#testOnesCount">func testOnesCount(t *testing.T, x uint64, want int)</a>

```
searchKey: bits_test.testOnesCount
tags: [private]
```

```Go
func testOnesCount(t *testing.T, x uint64, want int)
```

### <a id="BenchmarkOnesCount" href="#BenchmarkOnesCount">func BenchmarkOnesCount(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkOnesCount
tags: [private]
```

```Go
func BenchmarkOnesCount(b *testing.B)
```

### <a id="BenchmarkOnesCount8" href="#BenchmarkOnesCount8">func BenchmarkOnesCount8(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkOnesCount8
tags: [private]
```

```Go
func BenchmarkOnesCount8(b *testing.B)
```

### <a id="BenchmarkOnesCount16" href="#BenchmarkOnesCount16">func BenchmarkOnesCount16(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkOnesCount16
tags: [private]
```

```Go
func BenchmarkOnesCount16(b *testing.B)
```

### <a id="BenchmarkOnesCount32" href="#BenchmarkOnesCount32">func BenchmarkOnesCount32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkOnesCount32
tags: [private]
```

```Go
func BenchmarkOnesCount32(b *testing.B)
```

### <a id="BenchmarkOnesCount64" href="#BenchmarkOnesCount64">func BenchmarkOnesCount64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkOnesCount64
tags: [private]
```

```Go
func BenchmarkOnesCount64(b *testing.B)
```

### <a id="TestRotateLeft" href="#TestRotateLeft">func TestRotateLeft(t *testing.T)</a>

```
searchKey: bits_test.TestRotateLeft
tags: [private]
```

```Go
func TestRotateLeft(t *testing.T)
```

### <a id="BenchmarkRotateLeft" href="#BenchmarkRotateLeft">func BenchmarkRotateLeft(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkRotateLeft
tags: [private]
```

```Go
func BenchmarkRotateLeft(b *testing.B)
```

### <a id="BenchmarkRotateLeft8" href="#BenchmarkRotateLeft8">func BenchmarkRotateLeft8(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkRotateLeft8
tags: [private]
```

```Go
func BenchmarkRotateLeft8(b *testing.B)
```

### <a id="BenchmarkRotateLeft16" href="#BenchmarkRotateLeft16">func BenchmarkRotateLeft16(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkRotateLeft16
tags: [private]
```

```Go
func BenchmarkRotateLeft16(b *testing.B)
```

### <a id="BenchmarkRotateLeft32" href="#BenchmarkRotateLeft32">func BenchmarkRotateLeft32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkRotateLeft32
tags: [private]
```

```Go
func BenchmarkRotateLeft32(b *testing.B)
```

### <a id="BenchmarkRotateLeft64" href="#BenchmarkRotateLeft64">func BenchmarkRotateLeft64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkRotateLeft64
tags: [private]
```

```Go
func BenchmarkRotateLeft64(b *testing.B)
```

### <a id="TestReverse" href="#TestReverse">func TestReverse(t *testing.T)</a>

```
searchKey: bits_test.TestReverse
tags: [private]
```

```Go
func TestReverse(t *testing.T)
```

### <a id="testReverse" href="#testReverse">func testReverse(t *testing.T, x64, want64 uint64)</a>

```
searchKey: bits_test.testReverse
tags: [private]
```

```Go
func testReverse(t *testing.T, x64, want64 uint64)
```

### <a id="BenchmarkReverse" href="#BenchmarkReverse">func BenchmarkReverse(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverse
tags: [private]
```

```Go
func BenchmarkReverse(b *testing.B)
```

### <a id="BenchmarkReverse8" href="#BenchmarkReverse8">func BenchmarkReverse8(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverse8
tags: [private]
```

```Go
func BenchmarkReverse8(b *testing.B)
```

### <a id="BenchmarkReverse16" href="#BenchmarkReverse16">func BenchmarkReverse16(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverse16
tags: [private]
```

```Go
func BenchmarkReverse16(b *testing.B)
```

### <a id="BenchmarkReverse32" href="#BenchmarkReverse32">func BenchmarkReverse32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverse32
tags: [private]
```

```Go
func BenchmarkReverse32(b *testing.B)
```

### <a id="BenchmarkReverse64" href="#BenchmarkReverse64">func BenchmarkReverse64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverse64
tags: [private]
```

```Go
func BenchmarkReverse64(b *testing.B)
```

### <a id="TestReverseBytes" href="#TestReverseBytes">func TestReverseBytes(t *testing.T)</a>

```
searchKey: bits_test.TestReverseBytes
tags: [private]
```

```Go
func TestReverseBytes(t *testing.T)
```

### <a id="testReverseBytes" href="#testReverseBytes">func testReverseBytes(t *testing.T, x64, want64 uint64)</a>

```
searchKey: bits_test.testReverseBytes
tags: [private]
```

```Go
func testReverseBytes(t *testing.T, x64, want64 uint64)
```

### <a id="BenchmarkReverseBytes" href="#BenchmarkReverseBytes">func BenchmarkReverseBytes(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverseBytes
tags: [private]
```

```Go
func BenchmarkReverseBytes(b *testing.B)
```

### <a id="BenchmarkReverseBytes16" href="#BenchmarkReverseBytes16">func BenchmarkReverseBytes16(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverseBytes16
tags: [private]
```

```Go
func BenchmarkReverseBytes16(b *testing.B)
```

### <a id="BenchmarkReverseBytes32" href="#BenchmarkReverseBytes32">func BenchmarkReverseBytes32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverseBytes32
tags: [private]
```

```Go
func BenchmarkReverseBytes32(b *testing.B)
```

### <a id="BenchmarkReverseBytes64" href="#BenchmarkReverseBytes64">func BenchmarkReverseBytes64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverseBytes64
tags: [private]
```

```Go
func BenchmarkReverseBytes64(b *testing.B)
```

### <a id="TestLen" href="#TestLen">func TestLen(t *testing.T)</a>

```
searchKey: bits_test.TestLen
tags: [private]
```

```Go
func TestLen(t *testing.T)
```

### <a id="TestAddSubUint" href="#TestAddSubUint">func TestAddSubUint(t *testing.T)</a>

```
searchKey: bits_test.TestAddSubUint
tags: [private]
```

```Go
func TestAddSubUint(t *testing.T)
```

### <a id="TestAddSubUint32" href="#TestAddSubUint32">func TestAddSubUint32(t *testing.T)</a>

```
searchKey: bits_test.TestAddSubUint32
tags: [private]
```

```Go
func TestAddSubUint32(t *testing.T)
```

### <a id="TestAddSubUint64" href="#TestAddSubUint64">func TestAddSubUint64(t *testing.T)</a>

```
searchKey: bits_test.TestAddSubUint64
tags: [private]
```

```Go
func TestAddSubUint64(t *testing.T)
```

### <a id="TestAdd64OverflowPanic" href="#TestAdd64OverflowPanic">func TestAdd64OverflowPanic(t *testing.T)</a>

```
searchKey: bits_test.TestAdd64OverflowPanic
tags: [private]
```

```Go
func TestAdd64OverflowPanic(t *testing.T)
```

### <a id="TestSub64OverflowPanic" href="#TestSub64OverflowPanic">func TestSub64OverflowPanic(t *testing.T)</a>

```
searchKey: bits_test.TestSub64OverflowPanic
tags: [private]
```

```Go
func TestSub64OverflowPanic(t *testing.T)
```

### <a id="TestMulDiv" href="#TestMulDiv">func TestMulDiv(t *testing.T)</a>

```
searchKey: bits_test.TestMulDiv
tags: [private]
```

```Go
func TestMulDiv(t *testing.T)
```

### <a id="TestMulDiv32" href="#TestMulDiv32">func TestMulDiv32(t *testing.T)</a>

```
searchKey: bits_test.TestMulDiv32
tags: [private]
```

```Go
func TestMulDiv32(t *testing.T)
```

### <a id="TestMulDiv64" href="#TestMulDiv64">func TestMulDiv64(t *testing.T)</a>

```
searchKey: bits_test.TestMulDiv64
tags: [private]
```

```Go
func TestMulDiv64(t *testing.T)
```

### <a id="TestDivPanicOverflow" href="#TestDivPanicOverflow">func TestDivPanicOverflow(t *testing.T)</a>

```
searchKey: bits_test.TestDivPanicOverflow
tags: [private]
```

```Go
func TestDivPanicOverflow(t *testing.T)
```

### <a id="TestDiv32PanicOverflow" href="#TestDiv32PanicOverflow">func TestDiv32PanicOverflow(t *testing.T)</a>

```
searchKey: bits_test.TestDiv32PanicOverflow
tags: [private]
```

```Go
func TestDiv32PanicOverflow(t *testing.T)
```

### <a id="TestDiv64PanicOverflow" href="#TestDiv64PanicOverflow">func TestDiv64PanicOverflow(t *testing.T)</a>

```
searchKey: bits_test.TestDiv64PanicOverflow
tags: [private]
```

```Go
func TestDiv64PanicOverflow(t *testing.T)
```

### <a id="TestDivPanicZero" href="#TestDivPanicZero">func TestDivPanicZero(t *testing.T)</a>

```
searchKey: bits_test.TestDivPanicZero
tags: [private]
```

```Go
func TestDivPanicZero(t *testing.T)
```

### <a id="TestDiv32PanicZero" href="#TestDiv32PanicZero">func TestDiv32PanicZero(t *testing.T)</a>

```
searchKey: bits_test.TestDiv32PanicZero
tags: [private]
```

```Go
func TestDiv32PanicZero(t *testing.T)
```

### <a id="TestDiv64PanicZero" href="#TestDiv64PanicZero">func TestDiv64PanicZero(t *testing.T)</a>

```
searchKey: bits_test.TestDiv64PanicZero
tags: [private]
```

```Go
func TestDiv64PanicZero(t *testing.T)
```

### <a id="TestRem32" href="#TestRem32">func TestRem32(t *testing.T)</a>

```
searchKey: bits_test.TestRem32
tags: [private]
```

```Go
func TestRem32(t *testing.T)
```

### <a id="TestRem32Overflow" href="#TestRem32Overflow">func TestRem32Overflow(t *testing.T)</a>

```
searchKey: bits_test.TestRem32Overflow
tags: [private]
```

```Go
func TestRem32Overflow(t *testing.T)
```

### <a id="TestRem64" href="#TestRem64">func TestRem64(t *testing.T)</a>

```
searchKey: bits_test.TestRem64
tags: [private]
```

```Go
func TestRem64(t *testing.T)
```

### <a id="TestRem64Overflow" href="#TestRem64Overflow">func TestRem64Overflow(t *testing.T)</a>

```
searchKey: bits_test.TestRem64Overflow
tags: [private]
```

```Go
func TestRem64Overflow(t *testing.T)
```

### <a id="BenchmarkAdd" href="#BenchmarkAdd">func BenchmarkAdd(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkAdd
tags: [private]
```

```Go
func BenchmarkAdd(b *testing.B)
```

### <a id="BenchmarkAdd32" href="#BenchmarkAdd32">func BenchmarkAdd32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkAdd32
tags: [private]
```

```Go
func BenchmarkAdd32(b *testing.B)
```

### <a id="BenchmarkAdd64" href="#BenchmarkAdd64">func BenchmarkAdd64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkAdd64
tags: [private]
```

```Go
func BenchmarkAdd64(b *testing.B)
```

### <a id="BenchmarkAdd64multiple" href="#BenchmarkAdd64multiple">func BenchmarkAdd64multiple(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkAdd64multiple
tags: [private]
```

```Go
func BenchmarkAdd64multiple(b *testing.B)
```

### <a id="BenchmarkSub" href="#BenchmarkSub">func BenchmarkSub(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkSub
tags: [private]
```

```Go
func BenchmarkSub(b *testing.B)
```

### <a id="BenchmarkSub32" href="#BenchmarkSub32">func BenchmarkSub32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkSub32
tags: [private]
```

```Go
func BenchmarkSub32(b *testing.B)
```

### <a id="BenchmarkSub64" href="#BenchmarkSub64">func BenchmarkSub64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkSub64
tags: [private]
```

```Go
func BenchmarkSub64(b *testing.B)
```

### <a id="BenchmarkSub64multiple" href="#BenchmarkSub64multiple">func BenchmarkSub64multiple(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkSub64multiple
tags: [private]
```

```Go
func BenchmarkSub64multiple(b *testing.B)
```

### <a id="BenchmarkMul" href="#BenchmarkMul">func BenchmarkMul(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkMul
tags: [private]
```

```Go
func BenchmarkMul(b *testing.B)
```

### <a id="BenchmarkMul32" href="#BenchmarkMul32">func BenchmarkMul32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkMul32
tags: [private]
```

```Go
func BenchmarkMul32(b *testing.B)
```

### <a id="BenchmarkMul64" href="#BenchmarkMul64">func BenchmarkMul64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkMul64
tags: [private]
```

```Go
func BenchmarkMul64(b *testing.B)
```

### <a id="BenchmarkDiv" href="#BenchmarkDiv">func BenchmarkDiv(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkDiv
tags: [private]
```

```Go
func BenchmarkDiv(b *testing.B)
```

### <a id="BenchmarkDiv32" href="#BenchmarkDiv32">func BenchmarkDiv32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkDiv32
tags: [private]
```

```Go
func BenchmarkDiv32(b *testing.B)
```

### <a id="BenchmarkDiv64" href="#BenchmarkDiv64">func BenchmarkDiv64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkDiv64
tags: [private]
```

```Go
func BenchmarkDiv64(b *testing.B)
```

### <a id="init.bits_test.go" href="#init.bits_test.go">func init()</a>

```
searchKey: bits_test.init
tags: [private]
```

```Go
func init()
```

### <a id="ExampleLeadingZeros8" href="#ExampleLeadingZeros8">func ExampleLeadingZeros8()</a>

```
searchKey: bits_test.ExampleLeadingZeros8
tags: [private]
```

```Go
func ExampleLeadingZeros8()
```

### <a id="ExampleLeadingZeros16" href="#ExampleLeadingZeros16">func ExampleLeadingZeros16()</a>

```
searchKey: bits_test.ExampleLeadingZeros16
tags: [private]
```

```Go
func ExampleLeadingZeros16()
```

### <a id="ExampleLeadingZeros32" href="#ExampleLeadingZeros32">func ExampleLeadingZeros32()</a>

```
searchKey: bits_test.ExampleLeadingZeros32
tags: [private]
```

```Go
func ExampleLeadingZeros32()
```

### <a id="ExampleLeadingZeros64" href="#ExampleLeadingZeros64">func ExampleLeadingZeros64()</a>

```
searchKey: bits_test.ExampleLeadingZeros64
tags: [private]
```

```Go
func ExampleLeadingZeros64()
```

### <a id="ExampleTrailingZeros8" href="#ExampleTrailingZeros8">func ExampleTrailingZeros8()</a>

```
searchKey: bits_test.ExampleTrailingZeros8
tags: [private]
```

```Go
func ExampleTrailingZeros8()
```

### <a id="ExampleTrailingZeros16" href="#ExampleTrailingZeros16">func ExampleTrailingZeros16()</a>

```
searchKey: bits_test.ExampleTrailingZeros16
tags: [private]
```

```Go
func ExampleTrailingZeros16()
```

### <a id="ExampleTrailingZeros32" href="#ExampleTrailingZeros32">func ExampleTrailingZeros32()</a>

```
searchKey: bits_test.ExampleTrailingZeros32
tags: [private]
```

```Go
func ExampleTrailingZeros32()
```

### <a id="ExampleTrailingZeros64" href="#ExampleTrailingZeros64">func ExampleTrailingZeros64()</a>

```
searchKey: bits_test.ExampleTrailingZeros64
tags: [private]
```

```Go
func ExampleTrailingZeros64()
```

### <a id="ExampleOnesCount" href="#ExampleOnesCount">func ExampleOnesCount()</a>

```
searchKey: bits_test.ExampleOnesCount
tags: [private]
```

```Go
func ExampleOnesCount()
```

### <a id="ExampleOnesCount8" href="#ExampleOnesCount8">func ExampleOnesCount8()</a>

```
searchKey: bits_test.ExampleOnesCount8
tags: [private]
```

```Go
func ExampleOnesCount8()
```

### <a id="ExampleOnesCount16" href="#ExampleOnesCount16">func ExampleOnesCount16()</a>

```
searchKey: bits_test.ExampleOnesCount16
tags: [private]
```

```Go
func ExampleOnesCount16()
```

### <a id="ExampleOnesCount32" href="#ExampleOnesCount32">func ExampleOnesCount32()</a>

```
searchKey: bits_test.ExampleOnesCount32
tags: [private]
```

```Go
func ExampleOnesCount32()
```

### <a id="ExampleOnesCount64" href="#ExampleOnesCount64">func ExampleOnesCount64()</a>

```
searchKey: bits_test.ExampleOnesCount64
tags: [private]
```

```Go
func ExampleOnesCount64()
```

### <a id="ExampleRotateLeft8" href="#ExampleRotateLeft8">func ExampleRotateLeft8()</a>

```
searchKey: bits_test.ExampleRotateLeft8
tags: [private]
```

```Go
func ExampleRotateLeft8()
```

### <a id="ExampleRotateLeft16" href="#ExampleRotateLeft16">func ExampleRotateLeft16()</a>

```
searchKey: bits_test.ExampleRotateLeft16
tags: [private]
```

```Go
func ExampleRotateLeft16()
```

### <a id="ExampleRotateLeft32" href="#ExampleRotateLeft32">func ExampleRotateLeft32()</a>

```
searchKey: bits_test.ExampleRotateLeft32
tags: [private]
```

```Go
func ExampleRotateLeft32()
```

### <a id="ExampleRotateLeft64" href="#ExampleRotateLeft64">func ExampleRotateLeft64()</a>

```
searchKey: bits_test.ExampleRotateLeft64
tags: [private]
```

```Go
func ExampleRotateLeft64()
```

### <a id="ExampleReverse8" href="#ExampleReverse8">func ExampleReverse8()</a>

```
searchKey: bits_test.ExampleReverse8
tags: [private]
```

```Go
func ExampleReverse8()
```

### <a id="ExampleReverse16" href="#ExampleReverse16">func ExampleReverse16()</a>

```
searchKey: bits_test.ExampleReverse16
tags: [private]
```

```Go
func ExampleReverse16()
```

### <a id="ExampleReverse32" href="#ExampleReverse32">func ExampleReverse32()</a>

```
searchKey: bits_test.ExampleReverse32
tags: [private]
```

```Go
func ExampleReverse32()
```

### <a id="ExampleReverse64" href="#ExampleReverse64">func ExampleReverse64()</a>

```
searchKey: bits_test.ExampleReverse64
tags: [private]
```

```Go
func ExampleReverse64()
```

### <a id="ExampleReverseBytes16" href="#ExampleReverseBytes16">func ExampleReverseBytes16()</a>

```
searchKey: bits_test.ExampleReverseBytes16
tags: [private]
```

```Go
func ExampleReverseBytes16()
```

### <a id="ExampleReverseBytes32" href="#ExampleReverseBytes32">func ExampleReverseBytes32()</a>

```
searchKey: bits_test.ExampleReverseBytes32
tags: [private]
```

```Go
func ExampleReverseBytes32()
```

### <a id="ExampleReverseBytes64" href="#ExampleReverseBytes64">func ExampleReverseBytes64()</a>

```
searchKey: bits_test.ExampleReverseBytes64
tags: [private]
```

```Go
func ExampleReverseBytes64()
```

### <a id="ExampleLen8" href="#ExampleLen8">func ExampleLen8()</a>

```
searchKey: bits_test.ExampleLen8
tags: [private]
```

```Go
func ExampleLen8()
```

### <a id="ExampleLen16" href="#ExampleLen16">func ExampleLen16()</a>

```
searchKey: bits_test.ExampleLen16
tags: [private]
```

```Go
func ExampleLen16()
```

### <a id="ExampleLen32" href="#ExampleLen32">func ExampleLen32()</a>

```
searchKey: bits_test.ExampleLen32
tags: [private]
```

```Go
func ExampleLen32()
```

### <a id="ExampleLen64" href="#ExampleLen64">func ExampleLen64()</a>

```
searchKey: bits_test.ExampleLen64
tags: [private]
```

```Go
func ExampleLen64()
```

