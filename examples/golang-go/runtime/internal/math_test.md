# Package math_test

## Index

* [Constants](#const)
    * [const UintptrSize](#UintptrSize)
* [Variables](#var)
    * [var SinkBool](#SinkBool)
    * [var SinkUintptr](#SinkUintptr)
    * [var mulUintptrTests](#mulUintptrTests)
    * [var x](#x)
    * [var y](#y)
* [Types](#type)
    * [type mulUintptrTest struct](#mulUintptrTest)
* [Functions](#func)
    * [func BenchmarkMulUintptr(b *testing.B)](#BenchmarkMulUintptr)
    * [func TestMulUintptr(t *testing.T)](#TestMulUintptr)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="UintptrSize" href="#UintptrSize">const UintptrSize</a>

```
searchKey: math_test.UintptrSize
tags: [constant number private]
```

```Go
const UintptrSize = 32 << (^uintptr(0) >> 63)
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="SinkBool" href="#SinkBool">var SinkBool</a>

```
searchKey: math_test.SinkBool
tags: [variable boolean private]
```

```Go
var SinkBool bool
```

### <a id="SinkUintptr" href="#SinkUintptr">var SinkUintptr</a>

```
searchKey: math_test.SinkUintptr
tags: [variable number private]
```

```Go
var SinkUintptr uintptr
```

### <a id="mulUintptrTests" href="#mulUintptrTests">var mulUintptrTests</a>

```
searchKey: math_test.mulUintptrTests
tags: [variable array struct private]
```

```Go
var mulUintptrTests = ...
```

### <a id="x" href="#x">var x</a>

```
searchKey: math_test.x
tags: [variable number private]
```

```Go
var x, y uintptr
```

### <a id="y" href="#y">var y</a>

```
searchKey: math_test.y
tags: [variable number private]
```

```Go
var x, y uintptr
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="mulUintptrTest" href="#mulUintptrTest">type mulUintptrTest struct</a>

```
searchKey: math_test.mulUintptrTest
tags: [struct private]
```

```Go
type mulUintptrTest struct {
	a        uintptr
	b        uintptr
	overflow bool
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="BenchmarkMulUintptr" href="#BenchmarkMulUintptr">func BenchmarkMulUintptr(b *testing.B)</a>

```
searchKey: math_test.BenchmarkMulUintptr
tags: [function private benchmark]
```

```Go
func BenchmarkMulUintptr(b *testing.B)
```

### <a id="TestMulUintptr" href="#TestMulUintptr">func TestMulUintptr(t *testing.T)</a>

```
searchKey: math_test.TestMulUintptr
tags: [function private test]
```

```Go
func TestMulUintptr(t *testing.T)
```

