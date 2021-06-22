# Package math_test

## Index

* [Constants](#const)
    * [const UintptrSize](#UintptrSize)
* [Variables](#var)
    * [var mulUintptrTests](#mulUintptrTests)
    * [var SinkUintptr](#SinkUintptr)
    * [var SinkBool](#SinkBool)
    * [var x](#x)
    * [var y](#y)
* [Types](#type)
    * [type mulUintptrTest struct](#mulUintptrTest)
* [Functions](#func)
    * [func TestMulUintptr(t *testing.T)](#TestMulUintptr)
    * [func BenchmarkMulUintptr(b *testing.B)](#BenchmarkMulUintptr)


## <a id="const" href="#const">Constants</a>

### <a id="UintptrSize" href="#UintptrSize">const UintptrSize</a>

```
searchKey: math_test.UintptrSize
```

```Go
const UintptrSize = 32 << (^uintptr(0) >> 63)
```

## <a id="var" href="#var">Variables</a>

### <a id="mulUintptrTests" href="#mulUintptrTests">var mulUintptrTests</a>

```
searchKey: math_test.mulUintptrTests
```

```Go
var mulUintptrTests = ...
```

### <a id="SinkUintptr" href="#SinkUintptr">var SinkUintptr</a>

```
searchKey: math_test.SinkUintptr
```

```Go
var SinkUintptr uintptr
```

### <a id="SinkBool" href="#SinkBool">var SinkBool</a>

```
searchKey: math_test.SinkBool
```

```Go
var SinkBool bool
```

### <a id="x" href="#x">var x</a>

```
searchKey: math_test.x
```

```Go
var x, y uintptr
```

### <a id="y" href="#y">var y</a>

```
searchKey: math_test.y
```

```Go
var x, y uintptr
```

## <a id="type" href="#type">Types</a>

### <a id="mulUintptrTest" href="#mulUintptrTest">type mulUintptrTest struct</a>

```
searchKey: math_test.mulUintptrTest
```

```Go
type mulUintptrTest struct {
	a        uintptr
	b        uintptr
	overflow bool
}
```

## <a id="func" href="#func">Functions</a>

### <a id="TestMulUintptr" href="#TestMulUintptr">func TestMulUintptr(t *testing.T)</a>

```
searchKey: math_test.TestMulUintptr
```

```Go
func TestMulUintptr(t *testing.T)
```

### <a id="BenchmarkMulUintptr" href="#BenchmarkMulUintptr">func BenchmarkMulUintptr(b *testing.B)</a>

```
searchKey: math_test.BenchmarkMulUintptr
```

```Go
func BenchmarkMulUintptr(b *testing.B)
```

