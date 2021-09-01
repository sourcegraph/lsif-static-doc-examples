# Package subtle

Package subtle implements functions that are often useful in cryptographic code but require careful thought to use correctly. 

## Index

* [Variables](#var)
    * [var benchmarkGlobal](#benchmarkGlobal)
    * [var lessOrEqTests](#lessOrEqTests)
    * [var testConstandTimeByteEqData](#testConstandTimeByteEqData)
    * [var testConstantTimeCompareData](#testConstantTimeCompareData)
* [Types](#type)
    * [type TestConstantTimeByteEqStruct struct](#TestConstantTimeByteEqStruct)
    * [type TestConstantTimeCompareStruct struct](#TestConstantTimeCompareStruct)
* [Functions](#func)
    * [func BenchmarkConstantTimeByteEq(b *testing.B)](#BenchmarkConstantTimeByteEq)
    * [func BenchmarkConstantTimeEq(b *testing.B)](#BenchmarkConstantTimeEq)
    * [func BenchmarkConstantTimeLessOrEq(b *testing.B)](#BenchmarkConstantTimeLessOrEq)
    * [func ConstantTimeByteEq(x, y uint8) int](#ConstantTimeByteEq)
    * [func ConstantTimeCompare(x, y []byte) int](#ConstantTimeCompare)
    * [func ConstantTimeCopy(v int, x, y []byte)](#ConstantTimeCopy)
    * [func ConstantTimeEq(x, y int32) int](#ConstantTimeEq)
    * [func ConstantTimeLessOrEq(x, y int) int](#ConstantTimeLessOrEq)
    * [func ConstantTimeSelect(v, x, y int) int](#ConstantTimeSelect)
    * [func TestConstantTimeByteEq(t *testing.T)](#TestConstantTimeByteEq)
    * [func TestConstantTimeCompare(t *testing.T)](#TestConstantTimeCompare)
    * [func TestConstantTimeCopy(t *testing.T)](#TestConstantTimeCopy)
    * [func TestConstantTimeEq(t *testing.T)](#TestConstantTimeEq)
    * [func TestConstantTimeLessOrEq(t *testing.T)](#TestConstantTimeLessOrEq)
    * [func byteEq(a, b uint8) int](#byteEq)
    * [func constantTimeCopyWrapper(v int, x, y []byte) []byte](#constantTimeCopyWrapper)
    * [func eq(a, b int32) int](#eq)
    * [func makeCopy(v int, x, y []byte) []byte](#makeCopy)


## <a id="var" href="#var">Variables</a>

### <a id="benchmarkGlobal" href="#benchmarkGlobal">var benchmarkGlobal</a>

```
searchKey: subtle.benchmarkGlobal
tags: [variable number private]
```

```Go
var benchmarkGlobal uint8
```

### <a id="lessOrEqTests" href="#lessOrEqTests">var lessOrEqTests</a>

```
searchKey: subtle.lessOrEqTests
tags: [variable array struct private]
```

```Go
var lessOrEqTests = ...
```

### <a id="testConstandTimeByteEqData" href="#testConstandTimeByteEqData">var testConstandTimeByteEqData</a>

```
searchKey: subtle.testConstandTimeByteEqData
tags: [variable array struct private]
```

```Go
var testConstandTimeByteEqData = ...
```

### <a id="testConstantTimeCompareData" href="#testConstantTimeCompareData">var testConstantTimeCompareData</a>

```
searchKey: subtle.testConstantTimeCompareData
tags: [variable array struct private]
```

```Go
var testConstantTimeCompareData = ...
```

## <a id="type" href="#type">Types</a>

### <a id="TestConstantTimeByteEqStruct" href="#TestConstantTimeByteEqStruct">type TestConstantTimeByteEqStruct struct</a>

```
searchKey: subtle.TestConstantTimeByteEqStruct
tags: [struct private]
```

```Go
type TestConstantTimeByteEqStruct struct {
	a, b uint8
	out  int
}
```

### <a id="TestConstantTimeCompareStruct" href="#TestConstantTimeCompareStruct">type TestConstantTimeCompareStruct struct</a>

```
searchKey: subtle.TestConstantTimeCompareStruct
tags: [struct private]
```

```Go
type TestConstantTimeCompareStruct struct {
	a, b []byte
	out  int
}
```

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkConstantTimeByteEq" href="#BenchmarkConstantTimeByteEq">func BenchmarkConstantTimeByteEq(b *testing.B)</a>

```
searchKey: subtle.BenchmarkConstantTimeByteEq
tags: [function private benchmark]
```

```Go
func BenchmarkConstantTimeByteEq(b *testing.B)
```

### <a id="BenchmarkConstantTimeEq" href="#BenchmarkConstantTimeEq">func BenchmarkConstantTimeEq(b *testing.B)</a>

```
searchKey: subtle.BenchmarkConstantTimeEq
tags: [function private benchmark]
```

```Go
func BenchmarkConstantTimeEq(b *testing.B)
```

### <a id="BenchmarkConstantTimeLessOrEq" href="#BenchmarkConstantTimeLessOrEq">func BenchmarkConstantTimeLessOrEq(b *testing.B)</a>

```
searchKey: subtle.BenchmarkConstantTimeLessOrEq
tags: [function private benchmark]
```

```Go
func BenchmarkConstantTimeLessOrEq(b *testing.B)
```

### <a id="ConstantTimeByteEq" href="#ConstantTimeByteEq">func ConstantTimeByteEq(x, y uint8) int</a>

```
searchKey: subtle.ConstantTimeByteEq
tags: [function]
```

```Go
func ConstantTimeByteEq(x, y uint8) int
```

ConstantTimeByteEq returns 1 if x == y and 0 otherwise. 

### <a id="ConstantTimeCompare" href="#ConstantTimeCompare">func ConstantTimeCompare(x, y []byte) int</a>

```
searchKey: subtle.ConstantTimeCompare
tags: [function]
```

```Go
func ConstantTimeCompare(x, y []byte) int
```

ConstantTimeCompare returns 1 if the two slices, x and y, have equal contents and 0 otherwise. The time taken is a function of the length of the slices and is independent of the contents. 

### <a id="ConstantTimeCopy" href="#ConstantTimeCopy">func ConstantTimeCopy(v int, x, y []byte)</a>

```
searchKey: subtle.ConstantTimeCopy
tags: [function]
```

```Go
func ConstantTimeCopy(v int, x, y []byte)
```

ConstantTimeCopy copies the contents of y into x (a slice of equal length) if v == 1. If v == 0, x is left unchanged. Its behavior is undefined if v takes any other value. 

### <a id="ConstantTimeEq" href="#ConstantTimeEq">func ConstantTimeEq(x, y int32) int</a>

```
searchKey: subtle.ConstantTimeEq
tags: [function]
```

```Go
func ConstantTimeEq(x, y int32) int
```

ConstantTimeEq returns 1 if x == y and 0 otherwise. 

### <a id="ConstantTimeLessOrEq" href="#ConstantTimeLessOrEq">func ConstantTimeLessOrEq(x, y int) int</a>

```
searchKey: subtle.ConstantTimeLessOrEq
tags: [function]
```

```Go
func ConstantTimeLessOrEq(x, y int) int
```

ConstantTimeLessOrEq returns 1 if x <= y and 0 otherwise. Its behavior is undefined if x or y are negative or > 2**31 - 1. 

### <a id="ConstantTimeSelect" href="#ConstantTimeSelect">func ConstantTimeSelect(v, x, y int) int</a>

```
searchKey: subtle.ConstantTimeSelect
tags: [function]
```

```Go
func ConstantTimeSelect(v, x, y int) int
```

ConstantTimeSelect returns x if v == 1 and y if v == 0. Its behavior is undefined if v takes any other value. 

### <a id="TestConstantTimeByteEq" href="#TestConstantTimeByteEq">func TestConstantTimeByteEq(t *testing.T)</a>

```
searchKey: subtle.TestConstantTimeByteEq
tags: [function private test]
```

```Go
func TestConstantTimeByteEq(t *testing.T)
```

### <a id="TestConstantTimeCompare" href="#TestConstantTimeCompare">func TestConstantTimeCompare(t *testing.T)</a>

```
searchKey: subtle.TestConstantTimeCompare
tags: [function private test]
```

```Go
func TestConstantTimeCompare(t *testing.T)
```

### <a id="TestConstantTimeCopy" href="#TestConstantTimeCopy">func TestConstantTimeCopy(t *testing.T)</a>

```
searchKey: subtle.TestConstantTimeCopy
tags: [function private test]
```

```Go
func TestConstantTimeCopy(t *testing.T)
```

### <a id="TestConstantTimeEq" href="#TestConstantTimeEq">func TestConstantTimeEq(t *testing.T)</a>

```
searchKey: subtle.TestConstantTimeEq
tags: [function private test]
```

```Go
func TestConstantTimeEq(t *testing.T)
```

### <a id="TestConstantTimeLessOrEq" href="#TestConstantTimeLessOrEq">func TestConstantTimeLessOrEq(t *testing.T)</a>

```
searchKey: subtle.TestConstantTimeLessOrEq
tags: [function private test]
```

```Go
func TestConstantTimeLessOrEq(t *testing.T)
```

### <a id="byteEq" href="#byteEq">func byteEq(a, b uint8) int</a>

```
searchKey: subtle.byteEq
tags: [function private]
```

```Go
func byteEq(a, b uint8) int
```

### <a id="constantTimeCopyWrapper" href="#constantTimeCopyWrapper">func constantTimeCopyWrapper(v int, x, y []byte) []byte</a>

```
searchKey: subtle.constantTimeCopyWrapper
tags: [function private]
```

```Go
func constantTimeCopyWrapper(v int, x, y []byte) []byte
```

### <a id="eq" href="#eq">func eq(a, b int32) int</a>

```
searchKey: subtle.eq
tags: [function private]
```

```Go
func eq(a, b int32) int
```

### <a id="makeCopy" href="#makeCopy">func makeCopy(v int, x, y []byte) []byte</a>

```
searchKey: subtle.makeCopy
tags: [function private]
```

```Go
func makeCopy(v int, x, y []byte) []byte
```

