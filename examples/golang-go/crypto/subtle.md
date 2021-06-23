# Package subtle

Package subtle implements functions that are often useful in cryptographic code but require careful thought to use correctly. 

## Index

* [Variables](#var)
    * [var testConstantTimeCompareData](#testConstantTimeCompareData)
    * [var testConstandTimeByteEqData](#testConstandTimeByteEqData)
    * [var lessOrEqTests](#lessOrEqTests)
    * [var benchmarkGlobal](#benchmarkGlobal)
* [Types](#type)
    * [type TestConstantTimeCompareStruct struct](#TestConstantTimeCompareStruct)
    * [type TestConstantTimeByteEqStruct struct](#TestConstantTimeByteEqStruct)
* [Functions](#func)
    * [func ConstantTimeCompare(x, y []byte) int](#ConstantTimeCompare)
    * [func ConstantTimeSelect(v, x, y int) int](#ConstantTimeSelect)
    * [func ConstantTimeByteEq(x, y uint8) int](#ConstantTimeByteEq)
    * [func ConstantTimeEq(x, y int32) int](#ConstantTimeEq)
    * [func ConstantTimeCopy(v int, x, y []byte)](#ConstantTimeCopy)
    * [func ConstantTimeLessOrEq(x, y int) int](#ConstantTimeLessOrEq)
    * [func TestConstantTimeCompare(t *testing.T)](#TestConstantTimeCompare)
    * [func byteEq(a, b uint8) int](#byteEq)
    * [func TestConstantTimeByteEq(t *testing.T)](#TestConstantTimeByteEq)
    * [func eq(a, b int32) int](#eq)
    * [func TestConstantTimeEq(t *testing.T)](#TestConstantTimeEq)
    * [func makeCopy(v int, x, y []byte) []byte](#makeCopy)
    * [func constantTimeCopyWrapper(v int, x, y []byte) []byte](#constantTimeCopyWrapper)
    * [func TestConstantTimeCopy(t *testing.T)](#TestConstantTimeCopy)
    * [func TestConstantTimeLessOrEq(t *testing.T)](#TestConstantTimeLessOrEq)
    * [func BenchmarkConstantTimeByteEq(b *testing.B)](#BenchmarkConstantTimeByteEq)
    * [func BenchmarkConstantTimeEq(b *testing.B)](#BenchmarkConstantTimeEq)
    * [func BenchmarkConstantTimeLessOrEq(b *testing.B)](#BenchmarkConstantTimeLessOrEq)


## <a id="var" href="#var">Variables</a>

### <a id="testConstantTimeCompareData" href="#testConstantTimeCompareData">var testConstantTimeCompareData</a>

```
searchKey: subtle.testConstantTimeCompareData
tags: [private]
```

```Go
var testConstantTimeCompareData = ...
```

### <a id="testConstandTimeByteEqData" href="#testConstandTimeByteEqData">var testConstandTimeByteEqData</a>

```
searchKey: subtle.testConstandTimeByteEqData
tags: [private]
```

```Go
var testConstandTimeByteEqData = ...
```

### <a id="lessOrEqTests" href="#lessOrEqTests">var lessOrEqTests</a>

```
searchKey: subtle.lessOrEqTests
tags: [private]
```

```Go
var lessOrEqTests = ...
```

### <a id="benchmarkGlobal" href="#benchmarkGlobal">var benchmarkGlobal</a>

```
searchKey: subtle.benchmarkGlobal
tags: [private]
```

```Go
var benchmarkGlobal uint8
```

## <a id="type" href="#type">Types</a>

### <a id="TestConstantTimeCompareStruct" href="#TestConstantTimeCompareStruct">type TestConstantTimeCompareStruct struct</a>

```
searchKey: subtle.TestConstantTimeCompareStruct
tags: [private]
```

```Go
type TestConstantTimeCompareStruct struct {
	a, b []byte
	out  int
}
```

### <a id="TestConstantTimeByteEqStruct" href="#TestConstantTimeByteEqStruct">type TestConstantTimeByteEqStruct struct</a>

```
searchKey: subtle.TestConstantTimeByteEqStruct
tags: [private]
```

```Go
type TestConstantTimeByteEqStruct struct {
	a, b uint8
	out  int
}
```

## <a id="func" href="#func">Functions</a>

### <a id="ConstantTimeCompare" href="#ConstantTimeCompare">func ConstantTimeCompare(x, y []byte) int</a>

```
searchKey: subtle.ConstantTimeCompare
```

```Go
func ConstantTimeCompare(x, y []byte) int
```

ConstantTimeCompare returns 1 if the two slices, x and y, have equal contents and 0 otherwise. The time taken is a function of the length of the slices and is independent of the contents. 

### <a id="ConstantTimeSelect" href="#ConstantTimeSelect">func ConstantTimeSelect(v, x, y int) int</a>

```
searchKey: subtle.ConstantTimeSelect
```

```Go
func ConstantTimeSelect(v, x, y int) int
```

ConstantTimeSelect returns x if v == 1 and y if v == 0. Its behavior is undefined if v takes any other value. 

### <a id="ConstantTimeByteEq" href="#ConstantTimeByteEq">func ConstantTimeByteEq(x, y uint8) int</a>

```
searchKey: subtle.ConstantTimeByteEq
```

```Go
func ConstantTimeByteEq(x, y uint8) int
```

ConstantTimeByteEq returns 1 if x == y and 0 otherwise. 

### <a id="ConstantTimeEq" href="#ConstantTimeEq">func ConstantTimeEq(x, y int32) int</a>

```
searchKey: subtle.ConstantTimeEq
```

```Go
func ConstantTimeEq(x, y int32) int
```

ConstantTimeEq returns 1 if x == y and 0 otherwise. 

### <a id="ConstantTimeCopy" href="#ConstantTimeCopy">func ConstantTimeCopy(v int, x, y []byte)</a>

```
searchKey: subtle.ConstantTimeCopy
```

```Go
func ConstantTimeCopy(v int, x, y []byte)
```

ConstantTimeCopy copies the contents of y into x (a slice of equal length) if v == 1. If v == 0, x is left unchanged. Its behavior is undefined if v takes any other value. 

### <a id="ConstantTimeLessOrEq" href="#ConstantTimeLessOrEq">func ConstantTimeLessOrEq(x, y int) int</a>

```
searchKey: subtle.ConstantTimeLessOrEq
```

```Go
func ConstantTimeLessOrEq(x, y int) int
```

ConstantTimeLessOrEq returns 1 if x <= y and 0 otherwise. Its behavior is undefined if x or y are negative or > 2**31 - 1. 

### <a id="TestConstantTimeCompare" href="#TestConstantTimeCompare">func TestConstantTimeCompare(t *testing.T)</a>

```
searchKey: subtle.TestConstantTimeCompare
tags: [private]
```

```Go
func TestConstantTimeCompare(t *testing.T)
```

### <a id="byteEq" href="#byteEq">func byteEq(a, b uint8) int</a>

```
searchKey: subtle.byteEq
tags: [private]
```

```Go
func byteEq(a, b uint8) int
```

### <a id="TestConstantTimeByteEq" href="#TestConstantTimeByteEq">func TestConstantTimeByteEq(t *testing.T)</a>

```
searchKey: subtle.TestConstantTimeByteEq
tags: [private]
```

```Go
func TestConstantTimeByteEq(t *testing.T)
```

### <a id="eq" href="#eq">func eq(a, b int32) int</a>

```
searchKey: subtle.eq
tags: [private]
```

```Go
func eq(a, b int32) int
```

### <a id="TestConstantTimeEq" href="#TestConstantTimeEq">func TestConstantTimeEq(t *testing.T)</a>

```
searchKey: subtle.TestConstantTimeEq
tags: [private]
```

```Go
func TestConstantTimeEq(t *testing.T)
```

### <a id="makeCopy" href="#makeCopy">func makeCopy(v int, x, y []byte) []byte</a>

```
searchKey: subtle.makeCopy
tags: [private]
```

```Go
func makeCopy(v int, x, y []byte) []byte
```

### <a id="constantTimeCopyWrapper" href="#constantTimeCopyWrapper">func constantTimeCopyWrapper(v int, x, y []byte) []byte</a>

```
searchKey: subtle.constantTimeCopyWrapper
tags: [private]
```

```Go
func constantTimeCopyWrapper(v int, x, y []byte) []byte
```

### <a id="TestConstantTimeCopy" href="#TestConstantTimeCopy">func TestConstantTimeCopy(t *testing.T)</a>

```
searchKey: subtle.TestConstantTimeCopy
tags: [private]
```

```Go
func TestConstantTimeCopy(t *testing.T)
```

### <a id="TestConstantTimeLessOrEq" href="#TestConstantTimeLessOrEq">func TestConstantTimeLessOrEq(t *testing.T)</a>

```
searchKey: subtle.TestConstantTimeLessOrEq
tags: [private]
```

```Go
func TestConstantTimeLessOrEq(t *testing.T)
```

### <a id="BenchmarkConstantTimeByteEq" href="#BenchmarkConstantTimeByteEq">func BenchmarkConstantTimeByteEq(b *testing.B)</a>

```
searchKey: subtle.BenchmarkConstantTimeByteEq
tags: [private]
```

```Go
func BenchmarkConstantTimeByteEq(b *testing.B)
```

### <a id="BenchmarkConstantTimeEq" href="#BenchmarkConstantTimeEq">func BenchmarkConstantTimeEq(b *testing.B)</a>

```
searchKey: subtle.BenchmarkConstantTimeEq
tags: [private]
```

```Go
func BenchmarkConstantTimeEq(b *testing.B)
```

### <a id="BenchmarkConstantTimeLessOrEq" href="#BenchmarkConstantTimeLessOrEq">func BenchmarkConstantTimeLessOrEq(b *testing.B)</a>

```
searchKey: subtle.BenchmarkConstantTimeLessOrEq
tags: [private]
```

```Go
func BenchmarkConstantTimeLessOrEq(b *testing.B)
```

