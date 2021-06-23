# Package debug_test

## Index

* [Variables](#var)
    * [var big](#big)
    * [var setGCPercentBallast](#setGCPercentBallast)
    * [var setGCPercentSink](#setGCPercentSink)
* [Types](#type)
    * [type Obj struct](#Obj)
    * [type T int](#T)
        * [func (t *T) ptrmethod() []byte](#T.ptrmethod)
        * [func (t T) method() []byte](#T.method)
* [Functions](#func)
    * [func TestReadGCStats(t *testing.T)](#TestReadGCStats)
    * [func TestFreeOSMemory(t *testing.T)](#TestFreeOSMemory)
    * [func TestSetGCPercent(t *testing.T)](#TestSetGCPercent)
    * [func abs64(a int64) int64](#abs64)
    * [func TestSetMaxThreadsOvf(t *testing.T)](#TestSetMaxThreadsOvf)
    * [func TestWriteHeapDumpNonempty(t *testing.T)](#TestWriteHeapDumpNonempty)
    * [func objfin(x *Obj)](#objfin)
    * [func TestWriteHeapDumpFinalizers(t *testing.T)](#TestWriteHeapDumpFinalizers)
    * [func TestPanicOnFault(t *testing.T)](#TestPanicOnFault)
    * [func TestStack(t *testing.T)](#TestStack)
    * [func check(t *testing.T, line, has string)](#check)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="big" href="#big">var big</a>

```
searchKey: debug_test.big
tags: [private]
```

```Go
var big = make([]byte, 1<<20)
```

### <a id="setGCPercentBallast" href="#setGCPercentBallast">var setGCPercentBallast</a>

```
searchKey: debug_test.setGCPercentBallast
tags: [private]
```

```Go
var setGCPercentBallast interface{}
```

### <a id="setGCPercentSink" href="#setGCPercentSink">var setGCPercentSink</a>

```
searchKey: debug_test.setGCPercentSink
tags: [private]
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
tags: [private]
```

```Go
type Obj struct {
	x, y int
}
```

### <a id="T" href="#T">type T int</a>

```
searchKey: debug_test.T
tags: [private]
```

```Go
type T int
```

#### <a id="T.ptrmethod" href="#T.ptrmethod">func (t *T) ptrmethod() []byte</a>

```
searchKey: debug_test.T.ptrmethod
tags: [private]
```

```Go
func (t *T) ptrmethod() []byte
```

#### <a id="T.method" href="#T.method">func (t T) method() []byte</a>

```
searchKey: debug_test.T.method
tags: [private]
```

```Go
func (t T) method() []byte
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestReadGCStats" href="#TestReadGCStats">func TestReadGCStats(t *testing.T)</a>

```
searchKey: debug_test.TestReadGCStats
tags: [private]
```

```Go
func TestReadGCStats(t *testing.T)
```

### <a id="TestFreeOSMemory" href="#TestFreeOSMemory">func TestFreeOSMemory(t *testing.T)</a>

```
searchKey: debug_test.TestFreeOSMemory
tags: [private]
```

```Go
func TestFreeOSMemory(t *testing.T)
```

### <a id="TestSetGCPercent" href="#TestSetGCPercent">func TestSetGCPercent(t *testing.T)</a>

```
searchKey: debug_test.TestSetGCPercent
tags: [private]
```

```Go
func TestSetGCPercent(t *testing.T)
```

### <a id="abs64" href="#abs64">func abs64(a int64) int64</a>

```
searchKey: debug_test.abs64
tags: [private]
```

```Go
func abs64(a int64) int64
```

### <a id="TestSetMaxThreadsOvf" href="#TestSetMaxThreadsOvf">func TestSetMaxThreadsOvf(t *testing.T)</a>

```
searchKey: debug_test.TestSetMaxThreadsOvf
tags: [private]
```

```Go
func TestSetMaxThreadsOvf(t *testing.T)
```

### <a id="TestWriteHeapDumpNonempty" href="#TestWriteHeapDumpNonempty">func TestWriteHeapDumpNonempty(t *testing.T)</a>

```
searchKey: debug_test.TestWriteHeapDumpNonempty
tags: [private]
```

```Go
func TestWriteHeapDumpNonempty(t *testing.T)
```

### <a id="objfin" href="#objfin">func objfin(x *Obj)</a>

```
searchKey: debug_test.objfin
tags: [private]
```

```Go
func objfin(x *Obj)
```

### <a id="TestWriteHeapDumpFinalizers" href="#TestWriteHeapDumpFinalizers">func TestWriteHeapDumpFinalizers(t *testing.T)</a>

```
searchKey: debug_test.TestWriteHeapDumpFinalizers
tags: [private]
```

```Go
func TestWriteHeapDumpFinalizers(t *testing.T)
```

### <a id="TestPanicOnFault" href="#TestPanicOnFault">func TestPanicOnFault(t *testing.T)</a>

```
searchKey: debug_test.TestPanicOnFault
tags: [private]
```

```Go
func TestPanicOnFault(t *testing.T)
```

### <a id="TestStack" href="#TestStack">func TestStack(t *testing.T)</a>

```
searchKey: debug_test.TestStack
tags: [private]
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
### <a id="check" href="#check">func check(t *testing.T, line, has string)</a>

```
searchKey: debug_test.check
tags: [private]
```

```Go
func check(t *testing.T, line, has string)
```

