# Package debug_test

## Index

* [Variables](#var)
    * [var big](#big)
    * [var setGCPercentBallast](#setGCPercentBallast)
    * [var setGCPercentSink](#setGCPercentSink)
* [Types](#type)
    * [type Obj struct](#Obj)
    * [type T int](#T)
        * [func (t T) method() []byte](#T.method)
        * [func (t *T) ptrmethod() []byte](#T.ptrmethod)
* [Functions](#func)
    * [func TestFreeOSMemory(t *testing.T)](#TestFreeOSMemory)
    * [func TestPanicOnFault(t *testing.T)](#TestPanicOnFault)
    * [func TestReadGCStats(t *testing.T)](#TestReadGCStats)
    * [func TestSetGCPercent(t *testing.T)](#TestSetGCPercent)
    * [func TestSetMaxThreadsOvf(t *testing.T)](#TestSetMaxThreadsOvf)
    * [func TestStack(t *testing.T)](#TestStack)
    * [func TestWriteHeapDumpFinalizers(t *testing.T)](#TestWriteHeapDumpFinalizers)
    * [func TestWriteHeapDumpNonempty(t *testing.T)](#TestWriteHeapDumpNonempty)
    * [func abs64(a int64) int64](#abs64)
    * [func check(t *testing.T, line, has string)](#check)
    * [func objfin(x *Obj)](#objfin)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="big" href="#big">var big</a>

```
searchKey: debug_test.big
tags: [variable array number private]
```

```Go
var big = make([]byte, 1<<20)
```

### <a id="setGCPercentBallast" href="#setGCPercentBallast">var setGCPercentBallast</a>

```
searchKey: debug_test.setGCPercentBallast
tags: [variable interface private]
```

```Go
var setGCPercentBallast interface{}
```

### <a id="setGCPercentSink" href="#setGCPercentSink">var setGCPercentSink</a>

```
searchKey: debug_test.setGCPercentSink
tags: [variable interface private]
```

```Go
var setGCPercentSink interface{}
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Obj" href="#Obj">type Obj struct</a>

```
searchKey: debug_test.Obj
tags: [struct private]
```

```Go
type Obj struct {
	x, y int
}
```

### <a id="T" href="#T">type T int</a>

```
searchKey: debug_test.T
tags: [number private]
```

```Go
type T int
```

#### <a id="T.method" href="#T.method">func (t T) method() []byte</a>

```
searchKey: debug_test.T.method
tags: [method private]
```

```Go
func (t T) method() []byte
```

#### <a id="T.ptrmethod" href="#T.ptrmethod">func (t *T) ptrmethod() []byte</a>

```
searchKey: debug_test.T.ptrmethod
tags: [method private]
```

```Go
func (t *T) ptrmethod() []byte
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestFreeOSMemory" href="#TestFreeOSMemory">func TestFreeOSMemory(t *testing.T)</a>

```
searchKey: debug_test.TestFreeOSMemory
tags: [function private test]
```

```Go
func TestFreeOSMemory(t *testing.T)
```

### <a id="TestPanicOnFault" href="#TestPanicOnFault">func TestPanicOnFault(t *testing.T)</a>

```
searchKey: debug_test.TestPanicOnFault
tags: [function private test]
```

```Go
func TestPanicOnFault(t *testing.T)
```

### <a id="TestReadGCStats" href="#TestReadGCStats">func TestReadGCStats(t *testing.T)</a>

```
searchKey: debug_test.TestReadGCStats
tags: [function private test]
```

```Go
func TestReadGCStats(t *testing.T)
```

### <a id="TestSetGCPercent" href="#TestSetGCPercent">func TestSetGCPercent(t *testing.T)</a>

```
searchKey: debug_test.TestSetGCPercent
tags: [function private test]
```

```Go
func TestSetGCPercent(t *testing.T)
```

### <a id="TestSetMaxThreadsOvf" href="#TestSetMaxThreadsOvf">func TestSetMaxThreadsOvf(t *testing.T)</a>

```
searchKey: debug_test.TestSetMaxThreadsOvf
tags: [function private test]
```

```Go
func TestSetMaxThreadsOvf(t *testing.T)
```

### <a id="TestStack" href="#TestStack">func TestStack(t *testing.T)</a>

```
searchKey: debug_test.TestStack
tags: [function private test]
```

```Go
func TestStack(t *testing.T)
```

The traceback should look something like this, modulo line numbers and hex constants. Don't worry much about the base levels, but check the ones in our own package. 

```
goroutine 10 [running]:
runtime/debug.Stack(0x0, 0x0, 0x0)
	/Users/r/go/src/runtime/debug/stack.go:28 +0x80
runtime/debug.(*T).ptrmethod(0xc82005ee70, 0x0, 0x0, 0x0)
	/Users/r/go/src/runtime/debug/stack_test.go:15 +0x29
runtime/debug.T.method(0x0, 0x0, 0x0, 0x0)
	/Users/r/go/src/runtime/debug/stack_test.go:18 +0x32
runtime/debug.TestStack(0xc8201ce000)
	/Users/r/go/src/runtime/debug/stack_test.go:37 +0x38
testing.tRunner(0xc8201ce000, 0x664b58)
	/Users/r/go/src/testing/testing.go:456 +0x98
created by testing.RunTests
	/Users/r/go/src/testing/testing.go:561 +0x86d

```
### <a id="TestWriteHeapDumpFinalizers" href="#TestWriteHeapDumpFinalizers">func TestWriteHeapDumpFinalizers(t *testing.T)</a>

```
searchKey: debug_test.TestWriteHeapDumpFinalizers
tags: [function private test]
```

```Go
func TestWriteHeapDumpFinalizers(t *testing.T)
```

### <a id="TestWriteHeapDumpNonempty" href="#TestWriteHeapDumpNonempty">func TestWriteHeapDumpNonempty(t *testing.T)</a>

```
searchKey: debug_test.TestWriteHeapDumpNonempty
tags: [function private test]
```

```Go
func TestWriteHeapDumpNonempty(t *testing.T)
```

### <a id="abs64" href="#abs64">func abs64(a int64) int64</a>

```
searchKey: debug_test.abs64
tags: [function private]
```

```Go
func abs64(a int64) int64
```

### <a id="check" href="#check">func check(t *testing.T, line, has string)</a>

```
searchKey: debug_test.check
tags: [function private]
```

```Go
func check(t *testing.T, line, has string)
```

### <a id="objfin" href="#objfin">func objfin(x *Obj)</a>

```
searchKey: debug_test.objfin
tags: [function private]
```

```Go
func objfin(x *Obj)
```

