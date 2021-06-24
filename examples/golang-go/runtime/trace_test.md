# Package trace_test

## Index

* [Variables](#var)
    * [var saveTraces](#saveTraces)
* [Types](#type)
    * [type frame struct](#frame)
* [Functions](#func)
    * [func BenchmarkNewTask(b *testing.B)](#BenchmarkNewTask)
    * [func BenchmarkStartRegion(b *testing.B)](#BenchmarkStartRegion)
    * [func Example()](#Example)
    * [func RunMyProgram()](#RunMyProgram)
    * [func TestEventBatch(t *testing.T)](#TestEventBatch)
    * [func TestTrace(t *testing.T)](#TestTrace)
    * [func TestTraceDoubleStart(t *testing.T)](#TestTraceDoubleStart)
    * [func TestTraceFutileWakeup(t *testing.T)](#TestTraceFutileWakeup)
    * [func TestTraceStartStop(t *testing.T)](#TestTraceStartStop)
    * [func TestTraceStress(t *testing.T)](#TestTraceStress)
    * [func TestTraceStressStartStop(t *testing.T)](#TestTraceStressStartStop)
    * [func TestTraceSymbolize(t *testing.T)](#TestTraceSymbolize)
    * [func TestUserTaskRegion(t *testing.T)](#TestUserTaskRegion)
    * [func dumpEventStacks(typ byte, events []*trace.Event) ([]byte, int)](#dumpEventStacks)
    * [func dumpFrames(frames []frame) []byte](#dumpFrames)
    * [func isMemoryConstrained() bool](#isMemoryConstrained)
    * [func parseTrace(t *testing.T, r io.Reader) ([]*trace.Event, map[uint64]*trace.GDesc)](#parseTrace)
    * [func saveTrace(t *testing.T, buf *bytes.Buffer, name string)](#saveTrace)
    * [func skipTraceSymbolizeTestIfNecessary(t *testing.T)](#skipTraceSymbolizeTestIfNecessary)
    * [func testBrokenTimestamps(t *testing.T, data []byte)](#testBrokenTimestamps)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="saveTraces" href="#saveTraces">var saveTraces</a>

```
searchKey: trace_test.saveTraces
tags: [variable boolean private]
```

```Go
var saveTraces = flag.Bool("savetraces", false, "save traces collected by tests")
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="frame" href="#frame">type frame struct</a>

```
searchKey: trace_test.frame
tags: [struct private]
```

```Go
type frame struct {
	Fn   string
	Line int
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="BenchmarkNewTask" href="#BenchmarkNewTask">func BenchmarkNewTask(b *testing.B)</a>

```
searchKey: trace_test.BenchmarkNewTask
tags: [method private benchmark]
```

```Go
func BenchmarkNewTask(b *testing.B)
```

### <a id="BenchmarkStartRegion" href="#BenchmarkStartRegion">func BenchmarkStartRegion(b *testing.B)</a>

```
searchKey: trace_test.BenchmarkStartRegion
tags: [method private benchmark]
```

```Go
func BenchmarkStartRegion(b *testing.B)
```

### <a id="Example" href="#Example">func Example()</a>

```
searchKey: trace_test.Example
tags: [function private]
```

```Go
func Example()
```

Example demonstrates the use of the trace package to trace the execution of a Go program. The trace output will be written to the file trace.out 

### <a id="RunMyProgram" href="#RunMyProgram">func RunMyProgram()</a>

```
searchKey: trace_test.RunMyProgram
tags: [function private]
```

```Go
func RunMyProgram()
```

### <a id="TestEventBatch" href="#TestEventBatch">func TestEventBatch(t *testing.T)</a>

```
searchKey: trace_test.TestEventBatch
tags: [method private test]
```

```Go
func TestEventBatch(t *testing.T)
```

TestEventBatch tests Flush calls that happen during Start don't produce corrupted traces. 

### <a id="TestTrace" href="#TestTrace">func TestTrace(t *testing.T)</a>

```
searchKey: trace_test.TestTrace
tags: [method private test]
```

```Go
func TestTrace(t *testing.T)
```

### <a id="TestTraceDoubleStart" href="#TestTraceDoubleStart">func TestTraceDoubleStart(t *testing.T)</a>

```
searchKey: trace_test.TestTraceDoubleStart
tags: [method private test]
```

```Go
func TestTraceDoubleStart(t *testing.T)
```

### <a id="TestTraceFutileWakeup" href="#TestTraceFutileWakeup">func TestTraceFutileWakeup(t *testing.T)</a>

```
searchKey: trace_test.TestTraceFutileWakeup
tags: [method private test]
```

```Go
func TestTraceFutileWakeup(t *testing.T)
```

### <a id="TestTraceStartStop" href="#TestTraceStartStop">func TestTraceStartStop(t *testing.T)</a>

```
searchKey: trace_test.TestTraceStartStop
tags: [method private test]
```

```Go
func TestTraceStartStop(t *testing.T)
```

### <a id="TestTraceStress" href="#TestTraceStress">func TestTraceStress(t *testing.T)</a>

```
searchKey: trace_test.TestTraceStress
tags: [method private test]
```

```Go
func TestTraceStress(t *testing.T)
```

### <a id="TestTraceStressStartStop" href="#TestTraceStressStartStop">func TestTraceStressStartStop(t *testing.T)</a>

```
searchKey: trace_test.TestTraceStressStartStop
tags: [method private test]
```

```Go
func TestTraceStressStartStop(t *testing.T)
```

Do a bunch of various stuff (timers, GC, network, etc) in a separate goroutine. And concurrently with all that start/stop trace 3 times. 

### <a id="TestTraceSymbolize" href="#TestTraceSymbolize">func TestTraceSymbolize(t *testing.T)</a>

```
searchKey: trace_test.TestTraceSymbolize
tags: [method private test]
```

```Go
func TestTraceSymbolize(t *testing.T)
```

TestTraceSymbolize tests symbolization and that events has proper stacks. In particular that we strip bottom uninteresting frames like goexit, top uninteresting frames (runtime guts). 

### <a id="TestUserTaskRegion" href="#TestUserTaskRegion">func TestUserTaskRegion(t *testing.T)</a>

```
searchKey: trace_test.TestUserTaskRegion
tags: [method private test]
```

```Go
func TestUserTaskRegion(t *testing.T)
```

### <a id="dumpEventStacks" href="#dumpEventStacks">func dumpEventStacks(typ byte, events []*trace.Event) ([]byte, int)</a>

```
searchKey: trace_test.dumpEventStacks
tags: [method private]
```

```Go
func dumpEventStacks(typ byte, events []*trace.Event) ([]byte, int)
```

### <a id="dumpFrames" href="#dumpFrames">func dumpFrames(frames []frame) []byte</a>

```
searchKey: trace_test.dumpFrames
tags: [method private]
```

```Go
func dumpFrames(frames []frame) []byte
```

### <a id="isMemoryConstrained" href="#isMemoryConstrained">func isMemoryConstrained() bool</a>

```
searchKey: trace_test.isMemoryConstrained
tags: [function private]
```

```Go
func isMemoryConstrained() bool
```

isMemoryConstrained reports whether the current machine is likely to be memory constrained. This was originally for the openbsd/arm builder (Issue 12032). TODO: move this to testenv? Make this look at memory? Look at GO_BUILDER_NAME? 

### <a id="parseTrace" href="#parseTrace">func parseTrace(t *testing.T, r io.Reader) ([]*trace.Event, map[uint64]*trace.GDesc)</a>

```
searchKey: trace_test.parseTrace
tags: [method private]
```

```Go
func parseTrace(t *testing.T, r io.Reader) ([]*trace.Event, map[uint64]*trace.GDesc)
```

### <a id="saveTrace" href="#saveTrace">func saveTrace(t *testing.T, buf *bytes.Buffer, name string)</a>

```
searchKey: trace_test.saveTrace
tags: [method private]
```

```Go
func saveTrace(t *testing.T, buf *bytes.Buffer, name string)
```

### <a id="skipTraceSymbolizeTestIfNecessary" href="#skipTraceSymbolizeTestIfNecessary">func skipTraceSymbolizeTestIfNecessary(t *testing.T)</a>

```
searchKey: trace_test.skipTraceSymbolizeTestIfNecessary
tags: [method private]
```

```Go
func skipTraceSymbolizeTestIfNecessary(t *testing.T)
```

### <a id="testBrokenTimestamps" href="#testBrokenTimestamps">func testBrokenTimestamps(t *testing.T, data []byte)</a>

```
searchKey: trace_test.testBrokenTimestamps
tags: [method private]
```

```Go
func testBrokenTimestamps(t *testing.T, data []byte)
```

