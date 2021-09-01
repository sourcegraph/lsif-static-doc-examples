# Package bits_test

## Index

* [Constants](#const)
    * [const divZeroError](#divZeroError)
    * [const overflowError](#overflowError)
    * [const _M](#_M)
    * [const _M32](#_M32)
    * [const _M64](#_M64)
* [Variables](#var)
    * [var Input](#Input)
    * [var Output](#Output)
    * [var tab](#tab)
* [Types](#type)
    * [type entry struct](#entry)
* [Functions](#func)
    * [func BenchmarkAdd(b *testing.B)](#BenchmarkAdd)
    * [func BenchmarkAdd32(b *testing.B)](#BenchmarkAdd32)
    * [func BenchmarkAdd64(b *testing.B)](#BenchmarkAdd64)
    * [func BenchmarkAdd64multiple(b *testing.B)](#BenchmarkAdd64multiple)
    * [func BenchmarkDiv(b *testing.B)](#BenchmarkDiv)
    * [func BenchmarkDiv32(b *testing.B)](#BenchmarkDiv32)
    * [func BenchmarkDiv64(b *testing.B)](#BenchmarkDiv64)
    * [func BenchmarkLeadingZeros(b *testing.B)](#BenchmarkLeadingZeros)
    * [func BenchmarkLeadingZeros16(b *testing.B)](#BenchmarkLeadingZeros16)
    * [func BenchmarkLeadingZeros32(b *testing.B)](#BenchmarkLeadingZeros32)
    * [func BenchmarkLeadingZeros64(b *testing.B)](#BenchmarkLeadingZeros64)
    * [func BenchmarkLeadingZeros8(b *testing.B)](#BenchmarkLeadingZeros8)
    * [func BenchmarkMul(b *testing.B)](#BenchmarkMul)
    * [func BenchmarkMul32(b *testing.B)](#BenchmarkMul32)
    * [func BenchmarkMul64(b *testing.B)](#BenchmarkMul64)
    * [func BenchmarkOnesCount(b *testing.B)](#BenchmarkOnesCount)
    * [func BenchmarkOnesCount16(b *testing.B)](#BenchmarkOnesCount16)
    * [func BenchmarkOnesCount32(b *testing.B)](#BenchmarkOnesCount32)
    * [func BenchmarkOnesCount64(b *testing.B)](#BenchmarkOnesCount64)
    * [func BenchmarkOnesCount8(b *testing.B)](#BenchmarkOnesCount8)
    * [func BenchmarkReverse(b *testing.B)](#BenchmarkReverse)
    * [func BenchmarkReverse16(b *testing.B)](#BenchmarkReverse16)
    * [func BenchmarkReverse32(b *testing.B)](#BenchmarkReverse32)
    * [func BenchmarkReverse64(b *testing.B)](#BenchmarkReverse64)
    * [func BenchmarkReverse8(b *testing.B)](#BenchmarkReverse8)
    * [func BenchmarkReverseBytes(b *testing.B)](#BenchmarkReverseBytes)
    * [func BenchmarkReverseBytes16(b *testing.B)](#BenchmarkReverseBytes16)
    * [func BenchmarkReverseBytes32(b *testing.B)](#BenchmarkReverseBytes32)
    * [func BenchmarkReverseBytes64(b *testing.B)](#BenchmarkReverseBytes64)
    * [func BenchmarkRotateLeft(b *testing.B)](#BenchmarkRotateLeft)
    * [func BenchmarkRotateLeft16(b *testing.B)](#BenchmarkRotateLeft16)
    * [func BenchmarkRotateLeft32(b *testing.B)](#BenchmarkRotateLeft32)
    * [func BenchmarkRotateLeft64(b *testing.B)](#BenchmarkRotateLeft64)
    * [func BenchmarkRotateLeft8(b *testing.B)](#BenchmarkRotateLeft8)
    * [func BenchmarkSub(b *testing.B)](#BenchmarkSub)
    * [func BenchmarkSub32(b *testing.B)](#BenchmarkSub32)
    * [func BenchmarkSub64(b *testing.B)](#BenchmarkSub64)
    * [func BenchmarkSub64multiple(b *testing.B)](#BenchmarkSub64multiple)
    * [func BenchmarkTrailingZeros(b *testing.B)](#BenchmarkTrailingZeros)
    * [func BenchmarkTrailingZeros16(b *testing.B)](#BenchmarkTrailingZeros16)
    * [func BenchmarkTrailingZeros32(b *testing.B)](#BenchmarkTrailingZeros32)
    * [func BenchmarkTrailingZeros64(b *testing.B)](#BenchmarkTrailingZeros64)
    * [func BenchmarkTrailingZeros8(b *testing.B)](#BenchmarkTrailingZeros8)
    * [func ExampleLeadingZeros16()](#ExampleLeadingZeros16)
    * [func ExampleLeadingZeros32()](#ExampleLeadingZeros32)
    * [func ExampleLeadingZeros64()](#ExampleLeadingZeros64)
    * [func ExampleLeadingZeros8()](#ExampleLeadingZeros8)
    * [func ExampleLen16()](#ExampleLen16)
    * [func ExampleLen32()](#ExampleLen32)
    * [func ExampleLen64()](#ExampleLen64)
    * [func ExampleLen8()](#ExampleLen8)
    * [func ExampleOnesCount()](#ExampleOnesCount)
    * [func ExampleOnesCount16()](#ExampleOnesCount16)
    * [func ExampleOnesCount32()](#ExampleOnesCount32)
    * [func ExampleOnesCount64()](#ExampleOnesCount64)
    * [func ExampleOnesCount8()](#ExampleOnesCount8)
    * [func ExampleReverse16()](#ExampleReverse16)
    * [func ExampleReverse32()](#ExampleReverse32)
    * [func ExampleReverse64()](#ExampleReverse64)
    * [func ExampleReverse8()](#ExampleReverse8)
    * [func ExampleReverseBytes16()](#ExampleReverseBytes16)
    * [func ExampleReverseBytes32()](#ExampleReverseBytes32)
    * [func ExampleReverseBytes64()](#ExampleReverseBytes64)
    * [func ExampleRotateLeft16()](#ExampleRotateLeft16)
    * [func ExampleRotateLeft32()](#ExampleRotateLeft32)
    * [func ExampleRotateLeft64()](#ExampleRotateLeft64)
    * [func ExampleRotateLeft8()](#ExampleRotateLeft8)
    * [func ExampleTrailingZeros16()](#ExampleTrailingZeros16)
    * [func ExampleTrailingZeros32()](#ExampleTrailingZeros32)
    * [func ExampleTrailingZeros64()](#ExampleTrailingZeros64)
    * [func ExampleTrailingZeros8()](#ExampleTrailingZeros8)
    * [func TestAdd64OverflowPanic(t *testing.T)](#TestAdd64OverflowPanic)
    * [func TestAddSubUint(t *testing.T)](#TestAddSubUint)
    * [func TestAddSubUint32(t *testing.T)](#TestAddSubUint32)
    * [func TestAddSubUint64(t *testing.T)](#TestAddSubUint64)
    * [func TestDiv32PanicOverflow(t *testing.T)](#TestDiv32PanicOverflow)
    * [func TestDiv32PanicZero(t *testing.T)](#TestDiv32PanicZero)
    * [func TestDiv64PanicOverflow(t *testing.T)](#TestDiv64PanicOverflow)
    * [func TestDiv64PanicZero(t *testing.T)](#TestDiv64PanicZero)
    * [func TestDivPanicOverflow(t *testing.T)](#TestDivPanicOverflow)
    * [func TestDivPanicZero(t *testing.T)](#TestDivPanicZero)
    * [func TestLeadingZeros(t *testing.T)](#TestLeadingZeros)
    * [func TestLen(t *testing.T)](#TestLen)
    * [func TestMulDiv(t *testing.T)](#TestMulDiv)
    * [func TestMulDiv32(t *testing.T)](#TestMulDiv32)
    * [func TestMulDiv64(t *testing.T)](#TestMulDiv64)
    * [func TestOnesCount(t *testing.T)](#TestOnesCount)
    * [func TestRem32(t *testing.T)](#TestRem32)
    * [func TestRem32Overflow(t *testing.T)](#TestRem32Overflow)
    * [func TestRem64(t *testing.T)](#TestRem64)
    * [func TestRem64Overflow(t *testing.T)](#TestRem64Overflow)
    * [func TestReverse(t *testing.T)](#TestReverse)
    * [func TestReverseBytes(t *testing.T)](#TestReverseBytes)
    * [func TestRotateLeft(t *testing.T)](#TestRotateLeft)
    * [func TestSub64OverflowPanic(t *testing.T)](#TestSub64OverflowPanic)
    * [func TestTrailingZeros(t *testing.T)](#TestTrailingZeros)
    * [func TestUintSize(t *testing.T)](#TestUintSize)
    * [func init()](#init.bits_test.go)
    * [func testOnesCount(t *testing.T, x uint64, want int)](#testOnesCount)
    * [func testReverse(t *testing.T, x64, want64 uint64)](#testReverse)
    * [func testReverseBytes(t *testing.T, x64, want64 uint64)](#testReverseBytes)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="divZeroError" href="#divZeroError">const divZeroError</a>

```
searchKey: bits_test.divZeroError
tags: [constant string private]
```

```Go
const divZeroError = "runtime error: integer divide by zero"
```

### <a id="overflowError" href="#overflowError">const overflowError</a>

```
searchKey: bits_test.overflowError
tags: [constant string private]
```

```Go
const overflowError = "runtime error: integer overflow"
```

### <a id="_M" href="#_M">const _M</a>

```
searchKey: bits_test._M
tags: [constant number private]
```

```Go
const _M = 1<<UintSize - 1
```

### <a id="_M32" href="#_M32">const _M32</a>

```
searchKey: bits_test._M32
tags: [constant number private]
```

```Go
const _M32 = 1<<32 - 1
```

### <a id="_M64" href="#_M64">const _M64</a>

```
searchKey: bits_test._M64
tags: [constant number private]
```

```Go
const _M64 = 1<<64 - 1
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="Input" href="#Input">var Input</a>

```
searchKey: bits_test.Input
tags: [variable number private]
```

```Go
var Input uint64 = DeBruijn64
```

Exported (global) variable serving as input for some of the benchmarks to ensure side-effect free calls are not optimized away. 

### <a id="Output" href="#Output">var Output</a>

```
searchKey: bits_test.Output
tags: [variable number private]
```

```Go
var Output int
```

Exported (global) variable to store function results during benchmarking to ensure side-effect free calls are not optimized away. 

### <a id="tab" href="#tab">var tab</a>

```
searchKey: bits_test.tab
tags: [variable array struct private]
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
tags: [struct private]
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

### <a id="BenchmarkAdd" href="#BenchmarkAdd">func BenchmarkAdd(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkAdd
tags: [function private benchmark]
```

```Go
func BenchmarkAdd(b *testing.B)
```

### <a id="BenchmarkAdd32" href="#BenchmarkAdd32">func BenchmarkAdd32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkAdd32
tags: [function private benchmark]
```

```Go
func BenchmarkAdd32(b *testing.B)
```

### <a id="BenchmarkAdd64" href="#BenchmarkAdd64">func BenchmarkAdd64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkAdd64
tags: [function private benchmark]
```

```Go
func BenchmarkAdd64(b *testing.B)
```

### <a id="BenchmarkAdd64multiple" href="#BenchmarkAdd64multiple">func BenchmarkAdd64multiple(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkAdd64multiple
tags: [function private benchmark]
```

```Go
func BenchmarkAdd64multiple(b *testing.B)
```

### <a id="BenchmarkDiv" href="#BenchmarkDiv">func BenchmarkDiv(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkDiv
tags: [function private benchmark]
```

```Go
func BenchmarkDiv(b *testing.B)
```

### <a id="BenchmarkDiv32" href="#BenchmarkDiv32">func BenchmarkDiv32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkDiv32
tags: [function private benchmark]
```

```Go
func BenchmarkDiv32(b *testing.B)
```

### <a id="BenchmarkDiv64" href="#BenchmarkDiv64">func BenchmarkDiv64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkDiv64
tags: [function private benchmark]
```

```Go
func BenchmarkDiv64(b *testing.B)
```

### <a id="BenchmarkLeadingZeros" href="#BenchmarkLeadingZeros">func BenchmarkLeadingZeros(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkLeadingZeros
tags: [function private benchmark]
```

```Go
func BenchmarkLeadingZeros(b *testing.B)
```

### <a id="BenchmarkLeadingZeros16" href="#BenchmarkLeadingZeros16">func BenchmarkLeadingZeros16(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkLeadingZeros16
tags: [function private benchmark]
```

```Go
func BenchmarkLeadingZeros16(b *testing.B)
```

### <a id="BenchmarkLeadingZeros32" href="#BenchmarkLeadingZeros32">func BenchmarkLeadingZeros32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkLeadingZeros32
tags: [function private benchmark]
```

```Go
func BenchmarkLeadingZeros32(b *testing.B)
```

### <a id="BenchmarkLeadingZeros64" href="#BenchmarkLeadingZeros64">func BenchmarkLeadingZeros64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkLeadingZeros64
tags: [function private benchmark]
```

```Go
func BenchmarkLeadingZeros64(b *testing.B)
```

### <a id="BenchmarkLeadingZeros8" href="#BenchmarkLeadingZeros8">func BenchmarkLeadingZeros8(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkLeadingZeros8
tags: [function private benchmark]
```

```Go
func BenchmarkLeadingZeros8(b *testing.B)
```

### <a id="BenchmarkMul" href="#BenchmarkMul">func BenchmarkMul(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkMul
tags: [function private benchmark]
```

```Go
func BenchmarkMul(b *testing.B)
```

### <a id="BenchmarkMul32" href="#BenchmarkMul32">func BenchmarkMul32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkMul32
tags: [function private benchmark]
```

```Go
func BenchmarkMul32(b *testing.B)
```

### <a id="BenchmarkMul64" href="#BenchmarkMul64">func BenchmarkMul64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkMul64
tags: [function private benchmark]
```

```Go
func BenchmarkMul64(b *testing.B)
```

### <a id="BenchmarkOnesCount" href="#BenchmarkOnesCount">func BenchmarkOnesCount(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkOnesCount
tags: [function private benchmark]
```

```Go
func BenchmarkOnesCount(b *testing.B)
```

### <a id="BenchmarkOnesCount16" href="#BenchmarkOnesCount16">func BenchmarkOnesCount16(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkOnesCount16
tags: [function private benchmark]
```

```Go
func BenchmarkOnesCount16(b *testing.B)
```

### <a id="BenchmarkOnesCount32" href="#BenchmarkOnesCount32">func BenchmarkOnesCount32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkOnesCount32
tags: [function private benchmark]
```

```Go
func BenchmarkOnesCount32(b *testing.B)
```

### <a id="BenchmarkOnesCount64" href="#BenchmarkOnesCount64">func BenchmarkOnesCount64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkOnesCount64
tags: [function private benchmark]
```

```Go
func BenchmarkOnesCount64(b *testing.B)
```

### <a id="BenchmarkOnesCount8" href="#BenchmarkOnesCount8">func BenchmarkOnesCount8(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkOnesCount8
tags: [function private benchmark]
```

```Go
func BenchmarkOnesCount8(b *testing.B)
```

### <a id="BenchmarkReverse" href="#BenchmarkReverse">func BenchmarkReverse(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverse
tags: [function private benchmark]
```

```Go
func BenchmarkReverse(b *testing.B)
```

### <a id="BenchmarkReverse16" href="#BenchmarkReverse16">func BenchmarkReverse16(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverse16
tags: [function private benchmark]
```

```Go
func BenchmarkReverse16(b *testing.B)
```

### <a id="BenchmarkReverse32" href="#BenchmarkReverse32">func BenchmarkReverse32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverse32
tags: [function private benchmark]
```

```Go
func BenchmarkReverse32(b *testing.B)
```

### <a id="BenchmarkReverse64" href="#BenchmarkReverse64">func BenchmarkReverse64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverse64
tags: [function private benchmark]
```

```Go
func BenchmarkReverse64(b *testing.B)
```

### <a id="BenchmarkReverse8" href="#BenchmarkReverse8">func BenchmarkReverse8(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverse8
tags: [function private benchmark]
```

```Go
func BenchmarkReverse8(b *testing.B)
```

### <a id="BenchmarkReverseBytes" href="#BenchmarkReverseBytes">func BenchmarkReverseBytes(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverseBytes
tags: [function private benchmark]
```

```Go
func BenchmarkReverseBytes(b *testing.B)
```

### <a id="BenchmarkReverseBytes16" href="#BenchmarkReverseBytes16">func BenchmarkReverseBytes16(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverseBytes16
tags: [function private benchmark]
```

```Go
func BenchmarkReverseBytes16(b *testing.B)
```

### <a id="BenchmarkReverseBytes32" href="#BenchmarkReverseBytes32">func BenchmarkReverseBytes32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverseBytes32
tags: [function private benchmark]
```

```Go
func BenchmarkReverseBytes32(b *testing.B)
```

### <a id="BenchmarkReverseBytes64" href="#BenchmarkReverseBytes64">func BenchmarkReverseBytes64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkReverseBytes64
tags: [function private benchmark]
```

```Go
func BenchmarkReverseBytes64(b *testing.B)
```

### <a id="BenchmarkRotateLeft" href="#BenchmarkRotateLeft">func BenchmarkRotateLeft(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkRotateLeft
tags: [function private benchmark]
```

```Go
func BenchmarkRotateLeft(b *testing.B)
```

### <a id="BenchmarkRotateLeft16" href="#BenchmarkRotateLeft16">func BenchmarkRotateLeft16(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkRotateLeft16
tags: [function private benchmark]
```

```Go
func BenchmarkRotateLeft16(b *testing.B)
```

### <a id="BenchmarkRotateLeft32" href="#BenchmarkRotateLeft32">func BenchmarkRotateLeft32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkRotateLeft32
tags: [function private benchmark]
```

```Go
func BenchmarkRotateLeft32(b *testing.B)
```

### <a id="BenchmarkRotateLeft64" href="#BenchmarkRotateLeft64">func BenchmarkRotateLeft64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkRotateLeft64
tags: [function private benchmark]
```

```Go
func BenchmarkRotateLeft64(b *testing.B)
```

### <a id="BenchmarkRotateLeft8" href="#BenchmarkRotateLeft8">func BenchmarkRotateLeft8(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkRotateLeft8
tags: [function private benchmark]
```

```Go
func BenchmarkRotateLeft8(b *testing.B)
```

### <a id="BenchmarkSub" href="#BenchmarkSub">func BenchmarkSub(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkSub
tags: [function private benchmark]
```

```Go
func BenchmarkSub(b *testing.B)
```

### <a id="BenchmarkSub32" href="#BenchmarkSub32">func BenchmarkSub32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkSub32
tags: [function private benchmark]
```

```Go
func BenchmarkSub32(b *testing.B)
```

### <a id="BenchmarkSub64" href="#BenchmarkSub64">func BenchmarkSub64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkSub64
tags: [function private benchmark]
```

```Go
func BenchmarkSub64(b *testing.B)
```

### <a id="BenchmarkSub64multiple" href="#BenchmarkSub64multiple">func BenchmarkSub64multiple(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkSub64multiple
tags: [function private benchmark]
```

```Go
func BenchmarkSub64multiple(b *testing.B)
```

### <a id="BenchmarkTrailingZeros" href="#BenchmarkTrailingZeros">func BenchmarkTrailingZeros(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkTrailingZeros
tags: [function private benchmark]
```

```Go
func BenchmarkTrailingZeros(b *testing.B)
```

### <a id="BenchmarkTrailingZeros16" href="#BenchmarkTrailingZeros16">func BenchmarkTrailingZeros16(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkTrailingZeros16
tags: [function private benchmark]
```

```Go
func BenchmarkTrailingZeros16(b *testing.B)
```

### <a id="BenchmarkTrailingZeros32" href="#BenchmarkTrailingZeros32">func BenchmarkTrailingZeros32(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkTrailingZeros32
tags: [function private benchmark]
```

```Go
func BenchmarkTrailingZeros32(b *testing.B)
```

### <a id="BenchmarkTrailingZeros64" href="#BenchmarkTrailingZeros64">func BenchmarkTrailingZeros64(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkTrailingZeros64
tags: [function private benchmark]
```

```Go
func BenchmarkTrailingZeros64(b *testing.B)
```

### <a id="BenchmarkTrailingZeros8" href="#BenchmarkTrailingZeros8">func BenchmarkTrailingZeros8(b *testing.B)</a>

```
searchKey: bits_test.BenchmarkTrailingZeros8
tags: [function private benchmark]
```

```Go
func BenchmarkTrailingZeros8(b *testing.B)
```

### <a id="ExampleLeadingZeros16" href="#ExampleLeadingZeros16">func ExampleLeadingZeros16()</a>

```
searchKey: bits_test.ExampleLeadingZeros16
tags: [function private]
```

```Go
func ExampleLeadingZeros16()
```

### <a id="ExampleLeadingZeros32" href="#ExampleLeadingZeros32">func ExampleLeadingZeros32()</a>

```
searchKey: bits_test.ExampleLeadingZeros32
tags: [function private]
```

```Go
func ExampleLeadingZeros32()
```

### <a id="ExampleLeadingZeros64" href="#ExampleLeadingZeros64">func ExampleLeadingZeros64()</a>

```
searchKey: bits_test.ExampleLeadingZeros64
tags: [function private]
```

```Go
func ExampleLeadingZeros64()
```

### <a id="ExampleLeadingZeros8" href="#ExampleLeadingZeros8">func ExampleLeadingZeros8()</a>

```
searchKey: bits_test.ExampleLeadingZeros8
tags: [function private]
```

```Go
func ExampleLeadingZeros8()
```

### <a id="ExampleLen16" href="#ExampleLen16">func ExampleLen16()</a>

```
searchKey: bits_test.ExampleLen16
tags: [function private]
```

```Go
func ExampleLen16()
```

### <a id="ExampleLen32" href="#ExampleLen32">func ExampleLen32()</a>

```
searchKey: bits_test.ExampleLen32
tags: [function private]
```

```Go
func ExampleLen32()
```

### <a id="ExampleLen64" href="#ExampleLen64">func ExampleLen64()</a>

```
searchKey: bits_test.ExampleLen64
tags: [function private]
```

```Go
func ExampleLen64()
```

### <a id="ExampleLen8" href="#ExampleLen8">func ExampleLen8()</a>

```
searchKey: bits_test.ExampleLen8
tags: [function private]
```

```Go
func ExampleLen8()
```

### <a id="ExampleOnesCount" href="#ExampleOnesCount">func ExampleOnesCount()</a>

```
searchKey: bits_test.ExampleOnesCount
tags: [function private]
```

```Go
func ExampleOnesCount()
```

### <a id="ExampleOnesCount16" href="#ExampleOnesCount16">func ExampleOnesCount16()</a>

```
searchKey: bits_test.ExampleOnesCount16
tags: [function private]
```

```Go
func ExampleOnesCount16()
```

### <a id="ExampleOnesCount32" href="#ExampleOnesCount32">func ExampleOnesCount32()</a>

```
searchKey: bits_test.ExampleOnesCount32
tags: [function private]
```

```Go
func ExampleOnesCount32()
```

### <a id="ExampleOnesCount64" href="#ExampleOnesCount64">func ExampleOnesCount64()</a>

```
searchKey: bits_test.ExampleOnesCount64
tags: [function private]
```

```Go
func ExampleOnesCount64()
```

### <a id="ExampleOnesCount8" href="#ExampleOnesCount8">func ExampleOnesCount8()</a>

```
searchKey: bits_test.ExampleOnesCount8
tags: [function private]
```

```Go
func ExampleOnesCount8()
```

### <a id="ExampleReverse16" href="#ExampleReverse16">func ExampleReverse16()</a>

```
searchKey: bits_test.ExampleReverse16
tags: [function private]
```

```Go
func ExampleReverse16()
```

### <a id="ExampleReverse32" href="#ExampleReverse32">func ExampleReverse32()</a>

```
searchKey: bits_test.ExampleReverse32
tags: [function private]
```

```Go
func ExampleReverse32()
```

### <a id="ExampleReverse64" href="#ExampleReverse64">func ExampleReverse64()</a>

```
searchKey: bits_test.ExampleReverse64
tags: [function private]
```

```Go
func ExampleReverse64()
```

### <a id="ExampleReverse8" href="#ExampleReverse8">func ExampleReverse8()</a>

```
searchKey: bits_test.ExampleReverse8
tags: [function private]
```

```Go
func ExampleReverse8()
```

### <a id="ExampleReverseBytes16" href="#ExampleReverseBytes16">func ExampleReverseBytes16()</a>

```
searchKey: bits_test.ExampleReverseBytes16
tags: [function private]
```

```Go
func ExampleReverseBytes16()
```

### <a id="ExampleReverseBytes32" href="#ExampleReverseBytes32">func ExampleReverseBytes32()</a>

```
searchKey: bits_test.ExampleReverseBytes32
tags: [function private]
```

```Go
func ExampleReverseBytes32()
```

### <a id="ExampleReverseBytes64" href="#ExampleReverseBytes64">func ExampleReverseBytes64()</a>

```
searchKey: bits_test.ExampleReverseBytes64
tags: [function private]
```

```Go
func ExampleReverseBytes64()
```

### <a id="ExampleRotateLeft16" href="#ExampleRotateLeft16">func ExampleRotateLeft16()</a>

```
searchKey: bits_test.ExampleRotateLeft16
tags: [function private]
```

```Go
func ExampleRotateLeft16()
```

### <a id="ExampleRotateLeft32" href="#ExampleRotateLeft32">func ExampleRotateLeft32()</a>

```
searchKey: bits_test.ExampleRotateLeft32
tags: [function private]
```

```Go
func ExampleRotateLeft32()
```

### <a id="ExampleRotateLeft64" href="#ExampleRotateLeft64">func ExampleRotateLeft64()</a>

```
searchKey: bits_test.ExampleRotateLeft64
tags: [function private]
```

```Go
func ExampleRotateLeft64()
```

### <a id="ExampleRotateLeft8" href="#ExampleRotateLeft8">func ExampleRotateLeft8()</a>

```
searchKey: bits_test.ExampleRotateLeft8
tags: [function private]
```

```Go
func ExampleRotateLeft8()
```

### <a id="ExampleTrailingZeros16" href="#ExampleTrailingZeros16">func ExampleTrailingZeros16()</a>

```
searchKey: bits_test.ExampleTrailingZeros16
tags: [function private]
```

```Go
func ExampleTrailingZeros16()
```

### <a id="ExampleTrailingZeros32" href="#ExampleTrailingZeros32">func ExampleTrailingZeros32()</a>

```
searchKey: bits_test.ExampleTrailingZeros32
tags: [function private]
```

```Go
func ExampleTrailingZeros32()
```

### <a id="ExampleTrailingZeros64" href="#ExampleTrailingZeros64">func ExampleTrailingZeros64()</a>

```
searchKey: bits_test.ExampleTrailingZeros64
tags: [function private]
```

```Go
func ExampleTrailingZeros64()
```

### <a id="ExampleTrailingZeros8" href="#ExampleTrailingZeros8">func ExampleTrailingZeros8()</a>

```
searchKey: bits_test.ExampleTrailingZeros8
tags: [function private]
```

```Go
func ExampleTrailingZeros8()
```

### <a id="TestAdd64OverflowPanic" href="#TestAdd64OverflowPanic">func TestAdd64OverflowPanic(t *testing.T)</a>

```
searchKey: bits_test.TestAdd64OverflowPanic
tags: [function private test]
```

```Go
func TestAdd64OverflowPanic(t *testing.T)
```

### <a id="TestAddSubUint" href="#TestAddSubUint">func TestAddSubUint(t *testing.T)</a>

```
searchKey: bits_test.TestAddSubUint
tags: [function private test]
```

```Go
func TestAddSubUint(t *testing.T)
```

### <a id="TestAddSubUint32" href="#TestAddSubUint32">func TestAddSubUint32(t *testing.T)</a>

```
searchKey: bits_test.TestAddSubUint32
tags: [function private test]
```

```Go
func TestAddSubUint32(t *testing.T)
```

### <a id="TestAddSubUint64" href="#TestAddSubUint64">func TestAddSubUint64(t *testing.T)</a>

```
searchKey: bits_test.TestAddSubUint64
tags: [function private test]
```

```Go
func TestAddSubUint64(t *testing.T)
```

### <a id="TestDiv32PanicOverflow" href="#TestDiv32PanicOverflow">func TestDiv32PanicOverflow(t *testing.T)</a>

```
searchKey: bits_test.TestDiv32PanicOverflow
tags: [function private test]
```

```Go
func TestDiv32PanicOverflow(t *testing.T)
```

### <a id="TestDiv32PanicZero" href="#TestDiv32PanicZero">func TestDiv32PanicZero(t *testing.T)</a>

```
searchKey: bits_test.TestDiv32PanicZero
tags: [function private test]
```

```Go
func TestDiv32PanicZero(t *testing.T)
```

### <a id="TestDiv64PanicOverflow" href="#TestDiv64PanicOverflow">func TestDiv64PanicOverflow(t *testing.T)</a>

```
searchKey: bits_test.TestDiv64PanicOverflow
tags: [function private test]
```

```Go
func TestDiv64PanicOverflow(t *testing.T)
```

### <a id="TestDiv64PanicZero" href="#TestDiv64PanicZero">func TestDiv64PanicZero(t *testing.T)</a>

```
searchKey: bits_test.TestDiv64PanicZero
tags: [function private test]
```

```Go
func TestDiv64PanicZero(t *testing.T)
```

### <a id="TestDivPanicOverflow" href="#TestDivPanicOverflow">func TestDivPanicOverflow(t *testing.T)</a>

```
searchKey: bits_test.TestDivPanicOverflow
tags: [function private test]
```

```Go
func TestDivPanicOverflow(t *testing.T)
```

### <a id="TestDivPanicZero" href="#TestDivPanicZero">func TestDivPanicZero(t *testing.T)</a>

```
searchKey: bits_test.TestDivPanicZero
tags: [function private test]
```

```Go
func TestDivPanicZero(t *testing.T)
```

### <a id="TestLeadingZeros" href="#TestLeadingZeros">func TestLeadingZeros(t *testing.T)</a>

```
searchKey: bits_test.TestLeadingZeros
tags: [function private test]
```

```Go
func TestLeadingZeros(t *testing.T)
```

### <a id="TestLen" href="#TestLen">func TestLen(t *testing.T)</a>

```
searchKey: bits_test.TestLen
tags: [function private test]
```

```Go
func TestLen(t *testing.T)
```

### <a id="TestMulDiv" href="#TestMulDiv">func TestMulDiv(t *testing.T)</a>

```
searchKey: bits_test.TestMulDiv
tags: [function private test]
```

```Go
func TestMulDiv(t *testing.T)
```

### <a id="TestMulDiv32" href="#TestMulDiv32">func TestMulDiv32(t *testing.T)</a>

```
searchKey: bits_test.TestMulDiv32
tags: [function private test]
```

```Go
func TestMulDiv32(t *testing.T)
```

### <a id="TestMulDiv64" href="#TestMulDiv64">func TestMulDiv64(t *testing.T)</a>

```
searchKey: bits_test.TestMulDiv64
tags: [function private test]
```

```Go
func TestMulDiv64(t *testing.T)
```

### <a id="TestOnesCount" href="#TestOnesCount">func TestOnesCount(t *testing.T)</a>

```
searchKey: bits_test.TestOnesCount
tags: [function private test]
```

```Go
func TestOnesCount(t *testing.T)
```

### <a id="TestRem32" href="#TestRem32">func TestRem32(t *testing.T)</a>

```
searchKey: bits_test.TestRem32
tags: [function private test]
```

```Go
func TestRem32(t *testing.T)
```

### <a id="TestRem32Overflow" href="#TestRem32Overflow">func TestRem32Overflow(t *testing.T)</a>

```
searchKey: bits_test.TestRem32Overflow
tags: [function private test]
```

```Go
func TestRem32Overflow(t *testing.T)
```

### <a id="TestRem64" href="#TestRem64">func TestRem64(t *testing.T)</a>

```
searchKey: bits_test.TestRem64
tags: [function private test]
```

```Go
func TestRem64(t *testing.T)
```

### <a id="TestRem64Overflow" href="#TestRem64Overflow">func TestRem64Overflow(t *testing.T)</a>

```
searchKey: bits_test.TestRem64Overflow
tags: [function private test]
```

```Go
func TestRem64Overflow(t *testing.T)
```

### <a id="TestReverse" href="#TestReverse">func TestReverse(t *testing.T)</a>

```
searchKey: bits_test.TestReverse
tags: [function private test]
```

```Go
func TestReverse(t *testing.T)
```

### <a id="TestReverseBytes" href="#TestReverseBytes">func TestReverseBytes(t *testing.T)</a>

```
searchKey: bits_test.TestReverseBytes
tags: [function private test]
```

```Go
func TestReverseBytes(t *testing.T)
```

### <a id="TestRotateLeft" href="#TestRotateLeft">func TestRotateLeft(t *testing.T)</a>

```
searchKey: bits_test.TestRotateLeft
tags: [function private test]
```

```Go
func TestRotateLeft(t *testing.T)
```

### <a id="TestSub64OverflowPanic" href="#TestSub64OverflowPanic">func TestSub64OverflowPanic(t *testing.T)</a>

```
searchKey: bits_test.TestSub64OverflowPanic
tags: [function private test]
```

```Go
func TestSub64OverflowPanic(t *testing.T)
```

### <a id="TestTrailingZeros" href="#TestTrailingZeros">func TestTrailingZeros(t *testing.T)</a>

```
searchKey: bits_test.TestTrailingZeros
tags: [function private test]
```

```Go
func TestTrailingZeros(t *testing.T)
```

### <a id="TestUintSize" href="#TestUintSize">func TestUintSize(t *testing.T)</a>

```
searchKey: bits_test.TestUintSize
tags: [function private test]
```

```Go
func TestUintSize(t *testing.T)
```

### <a id="init.bits_test.go" href="#init.bits_test.go">func init()</a>

```
searchKey: bits_test.init
tags: [function private]
```

```Go
func init()
```

### <a id="testOnesCount" href="#testOnesCount">func testOnesCount(t *testing.T, x uint64, want int)</a>

```
searchKey: bits_test.testOnesCount
tags: [function private]
```

```Go
func testOnesCount(t *testing.T, x uint64, want int)
```

### <a id="testReverse" href="#testReverse">func testReverse(t *testing.T, x64, want64 uint64)</a>

```
searchKey: bits_test.testReverse
tags: [function private]
```

```Go
func testReverse(t *testing.T, x64, want64 uint64)
```

### <a id="testReverseBytes" href="#testReverseBytes">func testReverseBytes(t *testing.T, x64, want64 uint64)</a>

```
searchKey: bits_test.testReverseBytes
tags: [function private]
```

```Go
func testReverseBytes(t *testing.T, x64, want64 uint64)
```

