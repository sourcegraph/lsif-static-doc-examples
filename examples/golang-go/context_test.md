# Package context_test

## Index

* [Constants](#const)
    * [const shortDuration](#shortDuration)
* [Functions](#func)
    * [func BenchmarkCommonParentCancel(b *testing.B)](#BenchmarkCommonParentCancel)
    * [func BenchmarkWithTimeout(b *testing.B)](#BenchmarkWithTimeout)
    * [func benchmarkWithTimeout(b *testing.B, concurrentContexts int)](#benchmarkWithTimeout)
    * [func BenchmarkCancelTree(b *testing.B)](#BenchmarkCancelTree)
    * [func buildContextTree(root Context, depth int)](#buildContextTree)
    * [func BenchmarkCheckCanceled(b *testing.B)](#BenchmarkCheckCanceled)
    * [func BenchmarkContextCancelDone(b *testing.B)](#BenchmarkContextCancelDone)
    * [func ExampleWithCancel()](#ExampleWithCancel)
    * [func ExampleWithDeadline()](#ExampleWithDeadline)
    * [func ExampleWithTimeout()](#ExampleWithTimeout)
    * [func ExampleWithValue()](#ExampleWithValue)
    * [func TestDeadlineExceededIsNetError(t *testing.T)](#TestDeadlineExceededIsNetError)
    * [func TestBackground(t *testing.T)](#TestBackground)
    * [func TestTODO(t *testing.T)](#TestTODO)
    * [func TestWithCancel(t *testing.T)](#TestWithCancel)
    * [func TestParentFinishesChild(t *testing.T)](#TestParentFinishesChild)
    * [func TestChildFinishesFirst(t *testing.T)](#TestChildFinishesFirst)
    * [func TestDeadline(t *testing.T)](#TestDeadline)
    * [func TestTimeout(t *testing.T)](#TestTimeout)
    * [func TestCanceledTimeout(t *testing.T)](#TestCanceledTimeout)
    * [func TestValues(t *testing.T)](#TestValues)
    * [func TestAllocs(t *testing.T)](#TestAllocs)
    * [func TestSimultaneousCancels(t *testing.T)](#TestSimultaneousCancels)
    * [func TestInterlockedCancels(t *testing.T)](#TestInterlockedCancels)
    * [func TestLayersCancel(t *testing.T)](#TestLayersCancel)
    * [func TestLayersTimeout(t *testing.T)](#TestLayersTimeout)
    * [func TestCancelRemoves(t *testing.T)](#TestCancelRemoves)
    * [func TestWithCancelCanceledParent(t *testing.T)](#TestWithCancelCanceledParent)
    * [func TestWithValueChecksKey(t *testing.T)](#TestWithValueChecksKey)
    * [func TestInvalidDerivedFail(t *testing.T)](#TestInvalidDerivedFail)
    * [func TestDeadlineExceededSupportsTimeout(t *testing.T)](#TestDeadlineExceededSupportsTimeout)
    * [func TestCustomContextGoroutines(t *testing.T)](#TestCustomContextGoroutines)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="shortDuration" href="#shortDuration">const shortDuration</a>

```
searchKey: context_test.shortDuration
tags: [private]
```

```Go
const shortDuration = 1 * time.Millisecond // a reasonable duration to block in an example

```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="BenchmarkCommonParentCancel" href="#BenchmarkCommonParentCancel">func BenchmarkCommonParentCancel(b *testing.B)</a>

```
searchKey: context_test.BenchmarkCommonParentCancel
tags: [private]
```

```Go
func BenchmarkCommonParentCancel(b *testing.B)
```

### <a id="BenchmarkWithTimeout" href="#BenchmarkWithTimeout">func BenchmarkWithTimeout(b *testing.B)</a>

```
searchKey: context_test.BenchmarkWithTimeout
tags: [private]
```

```Go
func BenchmarkWithTimeout(b *testing.B)
```

### <a id="benchmarkWithTimeout" href="#benchmarkWithTimeout">func benchmarkWithTimeout(b *testing.B, concurrentContexts int)</a>

```
searchKey: context_test.benchmarkWithTimeout
tags: [private]
```

```Go
func benchmarkWithTimeout(b *testing.B, concurrentContexts int)
```

### <a id="BenchmarkCancelTree" href="#BenchmarkCancelTree">func BenchmarkCancelTree(b *testing.B)</a>

```
searchKey: context_test.BenchmarkCancelTree
tags: [private]
```

```Go
func BenchmarkCancelTree(b *testing.B)
```

### <a id="buildContextTree" href="#buildContextTree">func buildContextTree(root Context, depth int)</a>

```
searchKey: context_test.buildContextTree
tags: [private]
```

```Go
func buildContextTree(root Context, depth int)
```

### <a id="BenchmarkCheckCanceled" href="#BenchmarkCheckCanceled">func BenchmarkCheckCanceled(b *testing.B)</a>

```
searchKey: context_test.BenchmarkCheckCanceled
tags: [private]
```

```Go
func BenchmarkCheckCanceled(b *testing.B)
```

### <a id="BenchmarkContextCancelDone" href="#BenchmarkContextCancelDone">func BenchmarkContextCancelDone(b *testing.B)</a>

```
searchKey: context_test.BenchmarkContextCancelDone
tags: [private]
```

```Go
func BenchmarkContextCancelDone(b *testing.B)
```

### <a id="ExampleWithCancel" href="#ExampleWithCancel">func ExampleWithCancel()</a>

```
searchKey: context_test.ExampleWithCancel
tags: [private]
```

```Go
func ExampleWithCancel()
```

This example demonstrates the use of a cancelable context to prevent a goroutine leak. By the end of the example function, the goroutine started by gen will return without leaking. 

### <a id="ExampleWithDeadline" href="#ExampleWithDeadline">func ExampleWithDeadline()</a>

```
searchKey: context_test.ExampleWithDeadline
tags: [private]
```

```Go
func ExampleWithDeadline()
```

This example passes a context with an arbitrary deadline to tell a blocking function that it should abandon its work as soon as it gets to it. 

### <a id="ExampleWithTimeout" href="#ExampleWithTimeout">func ExampleWithTimeout()</a>

```
searchKey: context_test.ExampleWithTimeout
tags: [private]
```

```Go
func ExampleWithTimeout()
```

This example passes a context with a timeout to tell a blocking function that it should abandon its work after the timeout elapses. 

### <a id="ExampleWithValue" href="#ExampleWithValue">func ExampleWithValue()</a>

```
searchKey: context_test.ExampleWithValue
tags: [private]
```

```Go
func ExampleWithValue()
```

This example demonstrates how a value can be passed to the context and also how to retrieve it if it exists. 

### <a id="TestDeadlineExceededIsNetError" href="#TestDeadlineExceededIsNetError">func TestDeadlineExceededIsNetError(t *testing.T)</a>

```
searchKey: context_test.TestDeadlineExceededIsNetError
tags: [private]
```

```Go
func TestDeadlineExceededIsNetError(t *testing.T)
```

### <a id="TestBackground" href="#TestBackground">func TestBackground(t *testing.T)</a>

```
searchKey: context_test.TestBackground
tags: [private]
```

```Go
func TestBackground(t *testing.T)
```

### <a id="TestTODO" href="#TestTODO">func TestTODO(t *testing.T)</a>

```
searchKey: context_test.TestTODO
tags: [private]
```

```Go
func TestTODO(t *testing.T)
```

### <a id="TestWithCancel" href="#TestWithCancel">func TestWithCancel(t *testing.T)</a>

```
searchKey: context_test.TestWithCancel
tags: [private]
```

```Go
func TestWithCancel(t *testing.T)
```

### <a id="TestParentFinishesChild" href="#TestParentFinishesChild">func TestParentFinishesChild(t *testing.T)</a>

```
searchKey: context_test.TestParentFinishesChild
tags: [private]
```

```Go
func TestParentFinishesChild(t *testing.T)
```

### <a id="TestChildFinishesFirst" href="#TestChildFinishesFirst">func TestChildFinishesFirst(t *testing.T)</a>

```
searchKey: context_test.TestChildFinishesFirst
tags: [private]
```

```Go
func TestChildFinishesFirst(t *testing.T)
```

### <a id="TestDeadline" href="#TestDeadline">func TestDeadline(t *testing.T)</a>

```
searchKey: context_test.TestDeadline
tags: [private]
```

```Go
func TestDeadline(t *testing.T)
```

### <a id="TestTimeout" href="#TestTimeout">func TestTimeout(t *testing.T)</a>

```
searchKey: context_test.TestTimeout
tags: [private]
```

```Go
func TestTimeout(t *testing.T)
```

### <a id="TestCanceledTimeout" href="#TestCanceledTimeout">func TestCanceledTimeout(t *testing.T)</a>

```
searchKey: context_test.TestCanceledTimeout
tags: [private]
```

```Go
func TestCanceledTimeout(t *testing.T)
```

### <a id="TestValues" href="#TestValues">func TestValues(t *testing.T)</a>

```
searchKey: context_test.TestValues
tags: [private]
```

```Go
func TestValues(t *testing.T)
```

### <a id="TestAllocs" href="#TestAllocs">func TestAllocs(t *testing.T)</a>

```
searchKey: context_test.TestAllocs
tags: [private]
```

```Go
func TestAllocs(t *testing.T)
```

### <a id="TestSimultaneousCancels" href="#TestSimultaneousCancels">func TestSimultaneousCancels(t *testing.T)</a>

```
searchKey: context_test.TestSimultaneousCancels
tags: [private]
```

```Go
func TestSimultaneousCancels(t *testing.T)
```

### <a id="TestInterlockedCancels" href="#TestInterlockedCancels">func TestInterlockedCancels(t *testing.T)</a>

```
searchKey: context_test.TestInterlockedCancels
tags: [private]
```

```Go
func TestInterlockedCancels(t *testing.T)
```

### <a id="TestLayersCancel" href="#TestLayersCancel">func TestLayersCancel(t *testing.T)</a>

```
searchKey: context_test.TestLayersCancel
tags: [private]
```

```Go
func TestLayersCancel(t *testing.T)
```

### <a id="TestLayersTimeout" href="#TestLayersTimeout">func TestLayersTimeout(t *testing.T)</a>

```
searchKey: context_test.TestLayersTimeout
tags: [private]
```

```Go
func TestLayersTimeout(t *testing.T)
```

### <a id="TestCancelRemoves" href="#TestCancelRemoves">func TestCancelRemoves(t *testing.T)</a>

```
searchKey: context_test.TestCancelRemoves
tags: [private]
```

```Go
func TestCancelRemoves(t *testing.T)
```

### <a id="TestWithCancelCanceledParent" href="#TestWithCancelCanceledParent">func TestWithCancelCanceledParent(t *testing.T)</a>

```
searchKey: context_test.TestWithCancelCanceledParent
tags: [private]
```

```Go
func TestWithCancelCanceledParent(t *testing.T)
```

### <a id="TestWithValueChecksKey" href="#TestWithValueChecksKey">func TestWithValueChecksKey(t *testing.T)</a>

```
searchKey: context_test.TestWithValueChecksKey
tags: [private]
```

```Go
func TestWithValueChecksKey(t *testing.T)
```

### <a id="TestInvalidDerivedFail" href="#TestInvalidDerivedFail">func TestInvalidDerivedFail(t *testing.T)</a>

```
searchKey: context_test.TestInvalidDerivedFail
tags: [private]
```

```Go
func TestInvalidDerivedFail(t *testing.T)
```

### <a id="TestDeadlineExceededSupportsTimeout" href="#TestDeadlineExceededSupportsTimeout">func TestDeadlineExceededSupportsTimeout(t *testing.T)</a>

```
searchKey: context_test.TestDeadlineExceededSupportsTimeout
tags: [private]
```

```Go
func TestDeadlineExceededSupportsTimeout(t *testing.T)
```

### <a id="TestCustomContextGoroutines" href="#TestCustomContextGoroutines">func TestCustomContextGoroutines(t *testing.T)</a>

```
searchKey: context_test.TestCustomContextGoroutines
tags: [private]
```

```Go
func TestCustomContextGoroutines(t *testing.T)
```

