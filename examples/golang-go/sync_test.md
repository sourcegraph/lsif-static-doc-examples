# Package sync_test

## Index

* [Constants](#const)
    * [const opLoad](#opLoad)
    * [const opStore](#opStore)
    * [const opLoadOrStore](#opLoadOrStore)
    * [const opLoadAndDelete](#opLoadAndDelete)
    * [const opDelete](#opDelete)
* [Variables](#var)
    * [var bufPool](#bufPool)
    * [var http](#http)
    * [var mapOps](#mapOps)
    * [var misuseTests](#misuseTests)
    * [var globalSink](#globalSink)
* [Types](#type)
    * [type httpPkg struct{}](#httpPkg)
        * [func (httpPkg) Get(url string)](#httpPkg.Get)
    * [type bench struct](#bench)
    * [type mapInterface interface](#mapInterface)
    * [type RWMutexMap struct](#RWMutexMap)
        * [func (m *RWMutexMap) Load(key interface{}) (value interface{}, ok bool)](#RWMutexMap.Load)
        * [func (m *RWMutexMap) Store(key, value interface{})](#RWMutexMap.Store)
        * [func (m *RWMutexMap) LoadOrStore(key, value interface{}) (actual interface{}, loaded bool)](#RWMutexMap.LoadOrStore)
        * [func (m *RWMutexMap) LoadAndDelete(key interface{}) (value interface{}, loaded bool)](#RWMutexMap.LoadAndDelete)
        * [func (m *RWMutexMap) Delete(key interface{})](#RWMutexMap.Delete)
        * [func (m *RWMutexMap) Range(f func(key, value interface{}) (shouldContinue bool))](#RWMutexMap.Range)
    * [type DeepCopyMap struct](#DeepCopyMap)
        * [func (m *DeepCopyMap) Load(key interface{}) (value interface{}, ok bool)](#DeepCopyMap.Load)
        * [func (m *DeepCopyMap) Store(key, value interface{})](#DeepCopyMap.Store)
        * [func (m *DeepCopyMap) LoadOrStore(key, value interface{}) (actual interface{}, loaded bool)](#DeepCopyMap.LoadOrStore)
        * [func (m *DeepCopyMap) LoadAndDelete(key interface{}) (value interface{}, loaded bool)](#DeepCopyMap.LoadAndDelete)
        * [func (m *DeepCopyMap) Delete(key interface{})](#DeepCopyMap.Delete)
        * [func (m *DeepCopyMap) Range(f func(key, value interface{}) (shouldContinue bool))](#DeepCopyMap.Range)
        * [func (m *DeepCopyMap) dirty() map[interface{}]interface{}](#DeepCopyMap.dirty)
    * [type mapOp string](#mapOp)
    * [type mapCall struct](#mapCall)
        * [func (c mapCall) apply(m mapInterface) (interface{}, bool)](#mapCall.apply)
        * [func (mapCall) Generate(r *rand.Rand, size int) reflect.Value](#mapCall.Generate)
    * [type mapResult struct](#mapResult)
    * [type one int](#one)
        * [func (o *one) Increment()](#one.Increment)
* [Functions](#func)
    * [func TestCondSignal(t *testing.T)](#TestCondSignal)
    * [func TestCondSignalGenerations(t *testing.T)](#TestCondSignalGenerations)
    * [func TestCondBroadcast(t *testing.T)](#TestCondBroadcast)
    * [func TestRace(t *testing.T)](#TestRace)
    * [func TestCondSignalStealing(t *testing.T)](#TestCondSignalStealing)
    * [func TestCondCopy(t *testing.T)](#TestCondCopy)
    * [func BenchmarkCond1(b *testing.B)](#BenchmarkCond1)
    * [func BenchmarkCond2(b *testing.B)](#BenchmarkCond2)
    * [func BenchmarkCond4(b *testing.B)](#BenchmarkCond4)
    * [func BenchmarkCond8(b *testing.B)](#BenchmarkCond8)
    * [func BenchmarkCond16(b *testing.B)](#BenchmarkCond16)
    * [func BenchmarkCond32(b *testing.B)](#BenchmarkCond32)
    * [func benchmarkCond(b *testing.B, waiters int)](#benchmarkCond)
    * [func timeNow() time.Time](#timeNow)
    * [func Log(w io.Writer, key, val string)](#Log)
    * [func ExamplePool()](#ExamplePool)
    * [func ExampleWaitGroup()](#ExampleWaitGroup)
    * [func ExampleOnce()](#ExampleOnce)
    * [func benchMap(b *testing.B, bench bench)](#benchMap)
    * [func BenchmarkLoadMostlyHits(b *testing.B)](#BenchmarkLoadMostlyHits)
    * [func BenchmarkLoadMostlyMisses(b *testing.B)](#BenchmarkLoadMostlyMisses)
    * [func BenchmarkLoadOrStoreBalanced(b *testing.B)](#BenchmarkLoadOrStoreBalanced)
    * [func BenchmarkLoadOrStoreUnique(b *testing.B)](#BenchmarkLoadOrStoreUnique)
    * [func BenchmarkLoadOrStoreCollision(b *testing.B)](#BenchmarkLoadOrStoreCollision)
    * [func BenchmarkLoadAndDeleteBalanced(b *testing.B)](#BenchmarkLoadAndDeleteBalanced)
    * [func BenchmarkLoadAndDeleteUnique(b *testing.B)](#BenchmarkLoadAndDeleteUnique)
    * [func BenchmarkLoadAndDeleteCollision(b *testing.B)](#BenchmarkLoadAndDeleteCollision)
    * [func BenchmarkRange(b *testing.B)](#BenchmarkRange)
    * [func BenchmarkAdversarialAlloc(b *testing.B)](#BenchmarkAdversarialAlloc)
    * [func BenchmarkAdversarialDelete(b *testing.B)](#BenchmarkAdversarialDelete)
    * [func BenchmarkDeleteCollision(b *testing.B)](#BenchmarkDeleteCollision)
    * [func randValue(r *rand.Rand) interface{}](#randValue)
    * [func applyCalls(m mapInterface, calls []mapCall) (results []mapResult, final map[interface{}]interface{})](#applyCalls)
    * [func applyMap(calls []mapCall) ([]mapResult, map[interface{}]interface{})](#applyMap)
    * [func applyRWMutexMap(calls []mapCall) ([]mapResult, map[interface{}]interface{})](#applyRWMutexMap)
    * [func applyDeepCopyMap(calls []mapCall) ([]mapResult, map[interface{}]interface{})](#applyDeepCopyMap)
    * [func TestMapMatchesRWMutex(t *testing.T)](#TestMapMatchesRWMutex)
    * [func TestMapMatchesDeepCopy(t *testing.T)](#TestMapMatchesDeepCopy)
    * [func TestConcurrentRange(t *testing.T)](#TestConcurrentRange)
    * [func TestIssue40999(t *testing.T)](#TestIssue40999)
    * [func HammerSemaphore(s *uint32, loops int, cdone chan bool)](#HammerSemaphore)
    * [func TestSemaphore(t *testing.T)](#TestSemaphore)
    * [func BenchmarkUncontendedSemaphore(b *testing.B)](#BenchmarkUncontendedSemaphore)
    * [func BenchmarkContendedSemaphore(b *testing.B)](#BenchmarkContendedSemaphore)
    * [func HammerMutex(m *Mutex, loops int, cdone chan bool)](#HammerMutex)
    * [func TestMutex(t *testing.T)](#TestMutex)
    * [func init()](#init)
    * [func TestMutexMisuse(t *testing.T)](#TestMutexMisuse)
    * [func TestMutexFairness(t *testing.T)](#TestMutexFairness)
    * [func BenchmarkMutexUncontended(b *testing.B)](#BenchmarkMutexUncontended)
    * [func benchmarkMutex(b *testing.B, slack, work bool)](#benchmarkMutex)
    * [func BenchmarkMutex(b *testing.B)](#BenchmarkMutex)
    * [func BenchmarkMutexSlack(b *testing.B)](#BenchmarkMutexSlack)
    * [func BenchmarkMutexWork(b *testing.B)](#BenchmarkMutexWork)
    * [func BenchmarkMutexWorkSlack(b *testing.B)](#BenchmarkMutexWorkSlack)
    * [func BenchmarkMutexNoSpin(b *testing.B)](#BenchmarkMutexNoSpin)
    * [func BenchmarkMutexSpin(b *testing.B)](#BenchmarkMutexSpin)
    * [func run(t *testing.T, once *Once, o *one, c chan bool)](#run)
    * [func TestOnce(t *testing.T)](#TestOnce)
    * [func TestOncePanic(t *testing.T)](#TestOncePanic)
    * [func BenchmarkOnce(b *testing.B)](#BenchmarkOnce)
    * [func TestPool(t *testing.T)](#TestPool)
    * [func TestPoolNew(t *testing.T)](#TestPoolNew)
    * [func TestPoolGC(t *testing.T)](#TestPoolGC)
    * [func TestPoolRelease(t *testing.T)](#TestPoolRelease)
    * [func testPool(t *testing.T, drain bool)](#testPool)
    * [func TestPoolStress(t *testing.T)](#TestPoolStress)
    * [func TestPoolDequeue(t *testing.T)](#TestPoolDequeue)
    * [func TestPoolChain(t *testing.T)](#TestPoolChain)
    * [func testPoolDequeue(t *testing.T, d PoolDequeue)](#testPoolDequeue)
    * [func BenchmarkPool(b *testing.B)](#BenchmarkPool)
    * [func BenchmarkPoolOverflow(b *testing.B)](#BenchmarkPoolOverflow)
    * [func BenchmarkPoolSTW(b *testing.B)](#BenchmarkPoolSTW)
    * [func BenchmarkPoolExpensiveNew(b *testing.B)](#BenchmarkPoolExpensiveNew)
    * [func BenchmarkSemaUncontended(b *testing.B)](#BenchmarkSemaUncontended)
    * [func benchmarkSema(b *testing.B, block, work bool)](#benchmarkSema)
    * [func BenchmarkSemaSyntNonblock(b *testing.B)](#BenchmarkSemaSyntNonblock)
    * [func BenchmarkSemaSyntBlock(b *testing.B)](#BenchmarkSemaSyntBlock)
    * [func BenchmarkSemaWorkNonblock(b *testing.B)](#BenchmarkSemaWorkNonblock)
    * [func BenchmarkSemaWorkBlock(b *testing.B)](#BenchmarkSemaWorkBlock)
    * [func parallelReader(m *RWMutex, clocked, cunlock, cdone chan bool)](#parallelReader)
    * [func doTestParallelReaders(numReaders, gomaxprocs int)](#doTestParallelReaders)
    * [func TestParallelReaders(t *testing.T)](#TestParallelReaders)
    * [func reader(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)](#reader)
    * [func writer(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)](#writer)
    * [func HammerRWMutex(gomaxprocs, numReaders, num_iterations int)](#HammerRWMutex)
    * [func TestRWMutex(t *testing.T)](#TestRWMutex)
    * [func TestRLocker(t *testing.T)](#TestRLocker)
    * [func BenchmarkRWMutexUncontended(b *testing.B)](#BenchmarkRWMutexUncontended)
    * [func benchmarkRWMutex(b *testing.B, localWork, writeRatio int)](#benchmarkRWMutex)
    * [func BenchmarkRWMutexWrite100(b *testing.B)](#BenchmarkRWMutexWrite100)
    * [func BenchmarkRWMutexWrite10(b *testing.B)](#BenchmarkRWMutexWrite10)
    * [func BenchmarkRWMutexWorkWrite100(b *testing.B)](#BenchmarkRWMutexWorkWrite100)
    * [func BenchmarkRWMutexWorkWrite10(b *testing.B)](#BenchmarkRWMutexWorkWrite10)
    * [func testWaitGroup(t *testing.T, wg1 *WaitGroup, wg2 *WaitGroup)](#testWaitGroup)
    * [func TestWaitGroup(t *testing.T)](#TestWaitGroup)
    * [func knownRacy(t *testing.T)](#knownRacy)
    * [func TestWaitGroupMisuse(t *testing.T)](#TestWaitGroupMisuse)
    * [func pollUntilEqual(v *uint32, target uint32)](#pollUntilEqual)
    * [func TestWaitGroupMisuse2(t *testing.T)](#TestWaitGroupMisuse2)
    * [func TestWaitGroupMisuse3(t *testing.T)](#TestWaitGroupMisuse3)
    * [func TestWaitGroupRace(t *testing.T)](#TestWaitGroupRace)
    * [func TestWaitGroupAlign(t *testing.T)](#TestWaitGroupAlign)
    * [func BenchmarkWaitGroupUncontended(b *testing.B)](#BenchmarkWaitGroupUncontended)
    * [func benchmarkWaitGroupAddDone(b *testing.B, localWork int)](#benchmarkWaitGroupAddDone)
    * [func BenchmarkWaitGroupAddDone(b *testing.B)](#BenchmarkWaitGroupAddDone)
    * [func BenchmarkWaitGroupAddDoneWork(b *testing.B)](#BenchmarkWaitGroupAddDoneWork)
    * [func benchmarkWaitGroupWait(b *testing.B, localWork int)](#benchmarkWaitGroupWait)
    * [func BenchmarkWaitGroupWait(b *testing.B)](#BenchmarkWaitGroupWait)
    * [func BenchmarkWaitGroupWaitWork(b *testing.B)](#BenchmarkWaitGroupWaitWork)
    * [func BenchmarkWaitGroupActuallyWait(b *testing.B)](#BenchmarkWaitGroupActuallyWait)


## <a id="const" href="#const">Constants</a>

### <a id="opLoad" href="#opLoad">const opLoad</a>

```
searchKey: sync_test.opLoad
```

```Go
const opLoad = mapOp("Load")
```

### <a id="opStore" href="#opStore">const opStore</a>

```
searchKey: sync_test.opStore
```

```Go
const opStore = mapOp("Store")
```

### <a id="opLoadOrStore" href="#opLoadOrStore">const opLoadOrStore</a>

```
searchKey: sync_test.opLoadOrStore
```

```Go
const opLoadOrStore = mapOp("LoadOrStore")
```

### <a id="opLoadAndDelete" href="#opLoadAndDelete">const opLoadAndDelete</a>

```
searchKey: sync_test.opLoadAndDelete
```

```Go
const opLoadAndDelete = mapOp("LoadAndDelete")
```

### <a id="opDelete" href="#opDelete">const opDelete</a>

```
searchKey: sync_test.opDelete
```

```Go
const opDelete = mapOp("Delete")
```

## <a id="var" href="#var">Variables</a>

### <a id="bufPool" href="#bufPool">var bufPool</a>

```
searchKey: sync_test.bufPool
```

```Go
var bufPool = sync.Pool{
	New: func() interface{} {

		return new(bytes.Buffer)
	},
}
```

### <a id="http" href="#http">var http</a>

```
searchKey: sync_test.http
```

```Go
var http httpPkg
```

### <a id="mapOps" href="#mapOps">var mapOps</a>

```
searchKey: sync_test.mapOps
```

```Go
var mapOps = [...]mapOp{opLoad, opStore, opLoadOrStore, opLoadAndDelete, opDelete}
```

### <a id="misuseTests" href="#misuseTests">var misuseTests</a>

```
searchKey: sync_test.misuseTests
```

```Go
var misuseTests = ...
```

### <a id="globalSink" href="#globalSink">var globalSink</a>

```
searchKey: sync_test.globalSink
```

```Go
var globalSink interface{}
```

## <a id="type" href="#type">Types</a>

### <a id="httpPkg" href="#httpPkg">type httpPkg struct{}</a>

```
searchKey: sync_test.httpPkg
```

```Go
type httpPkg struct{}
```

#### <a id="httpPkg.Get" href="#httpPkg.Get">func (httpPkg) Get(url string)</a>

```
searchKey: sync_test.httpPkg.Get
```

```Go
func (httpPkg) Get(url string)
```

### <a id="bench" href="#bench">type bench struct</a>

```
searchKey: sync_test.bench
```

```Go
type bench struct {
	setup func(*testing.B, mapInterface)
	perG  func(b *testing.B, pb *testing.PB, i int, m mapInterface)
}
```

### <a id="mapInterface" href="#mapInterface">type mapInterface interface</a>

```
searchKey: sync_test.mapInterface
```

```Go
type mapInterface interface {
	Load(interface{}) (interface{}, bool)
	Store(key, value interface{})
	LoadOrStore(key, value interface{}) (actual interface{}, loaded bool)
	LoadAndDelete(key interface{}) (value interface{}, loaded bool)
	Delete(interface{})
	Range(func(key, value interface{}) (shouldContinue bool))
}
```

mapInterface is the interface Map implements. 

### <a id="RWMutexMap" href="#RWMutexMap">type RWMutexMap struct</a>

```
searchKey: sync_test.RWMutexMap
```

```Go
type RWMutexMap struct {
	mu    sync.RWMutex
	dirty map[interface{}]interface{}
}
```

RWMutexMap is an implementation of mapInterface using a sync.RWMutex. 

#### <a id="RWMutexMap.Load" href="#RWMutexMap.Load">func (m *RWMutexMap) Load(key interface{}) (value interface{}, ok bool)</a>

```
searchKey: sync_test.RWMutexMap.Load
```

```Go
func (m *RWMutexMap) Load(key interface{}) (value interface{}, ok bool)
```

#### <a id="RWMutexMap.Store" href="#RWMutexMap.Store">func (m *RWMutexMap) Store(key, value interface{})</a>

```
searchKey: sync_test.RWMutexMap.Store
```

```Go
func (m *RWMutexMap) Store(key, value interface{})
```

#### <a id="RWMutexMap.LoadOrStore" href="#RWMutexMap.LoadOrStore">func (m *RWMutexMap) LoadOrStore(key, value interface{}) (actual interface{}, loaded bool)</a>

```
searchKey: sync_test.RWMutexMap.LoadOrStore
```

```Go
func (m *RWMutexMap) LoadOrStore(key, value interface{}) (actual interface{}, loaded bool)
```

#### <a id="RWMutexMap.LoadAndDelete" href="#RWMutexMap.LoadAndDelete">func (m *RWMutexMap) LoadAndDelete(key interface{}) (value interface{}, loaded bool)</a>

```
searchKey: sync_test.RWMutexMap.LoadAndDelete
```

```Go
func (m *RWMutexMap) LoadAndDelete(key interface{}) (value interface{}, loaded bool)
```

#### <a id="RWMutexMap.Delete" href="#RWMutexMap.Delete">func (m *RWMutexMap) Delete(key interface{})</a>

```
searchKey: sync_test.RWMutexMap.Delete
```

```Go
func (m *RWMutexMap) Delete(key interface{})
```

#### <a id="RWMutexMap.Range" href="#RWMutexMap.Range">func (m *RWMutexMap) Range(f func(key, value interface{}) (shouldContinue bool))</a>

```
searchKey: sync_test.RWMutexMap.Range
```

```Go
func (m *RWMutexMap) Range(f func(key, value interface{}) (shouldContinue bool))
```

### <a id="DeepCopyMap" href="#DeepCopyMap">type DeepCopyMap struct</a>

```
searchKey: sync_test.DeepCopyMap
```

```Go
type DeepCopyMap struct {
	mu    sync.Mutex
	clean atomic.Value
}
```

DeepCopyMap is an implementation of mapInterface using a Mutex and atomic.Value.  It makes deep copies of the map on every write to avoid acquiring the Mutex in Load. 

#### <a id="DeepCopyMap.Load" href="#DeepCopyMap.Load">func (m *DeepCopyMap) Load(key interface{}) (value interface{}, ok bool)</a>

```
searchKey: sync_test.DeepCopyMap.Load
```

```Go
func (m *DeepCopyMap) Load(key interface{}) (value interface{}, ok bool)
```

#### <a id="DeepCopyMap.Store" href="#DeepCopyMap.Store">func (m *DeepCopyMap) Store(key, value interface{})</a>

```
searchKey: sync_test.DeepCopyMap.Store
```

```Go
func (m *DeepCopyMap) Store(key, value interface{})
```

#### <a id="DeepCopyMap.LoadOrStore" href="#DeepCopyMap.LoadOrStore">func (m *DeepCopyMap) LoadOrStore(key, value interface{}) (actual interface{}, loaded bool)</a>

```
searchKey: sync_test.DeepCopyMap.LoadOrStore
```

```Go
func (m *DeepCopyMap) LoadOrStore(key, value interface{}) (actual interface{}, loaded bool)
```

#### <a id="DeepCopyMap.LoadAndDelete" href="#DeepCopyMap.LoadAndDelete">func (m *DeepCopyMap) LoadAndDelete(key interface{}) (value interface{}, loaded bool)</a>

```
searchKey: sync_test.DeepCopyMap.LoadAndDelete
```

```Go
func (m *DeepCopyMap) LoadAndDelete(key interface{}) (value interface{}, loaded bool)
```

#### <a id="DeepCopyMap.Delete" href="#DeepCopyMap.Delete">func (m *DeepCopyMap) Delete(key interface{})</a>

```
searchKey: sync_test.DeepCopyMap.Delete
```

```Go
func (m *DeepCopyMap) Delete(key interface{})
```

#### <a id="DeepCopyMap.Range" href="#DeepCopyMap.Range">func (m *DeepCopyMap) Range(f func(key, value interface{}) (shouldContinue bool))</a>

```
searchKey: sync_test.DeepCopyMap.Range
```

```Go
func (m *DeepCopyMap) Range(f func(key, value interface{}) (shouldContinue bool))
```

#### <a id="DeepCopyMap.dirty" href="#DeepCopyMap.dirty">func (m *DeepCopyMap) dirty() map[interface{}]interface{}</a>

```
searchKey: sync_test.DeepCopyMap.dirty
```

```Go
func (m *DeepCopyMap) dirty() map[interface{}]interface{}
```

### <a id="mapOp" href="#mapOp">type mapOp string</a>

```
searchKey: sync_test.mapOp
```

```Go
type mapOp string
```

### <a id="mapCall" href="#mapCall">type mapCall struct</a>

```
searchKey: sync_test.mapCall
```

```Go
type mapCall struct {
	op   mapOp
	k, v interface{}
}
```

mapCall is a quick.Generator for calls on mapInterface. 

#### <a id="mapCall.apply" href="#mapCall.apply">func (c mapCall) apply(m mapInterface) (interface{}, bool)</a>

```
searchKey: sync_test.mapCall.apply
```

```Go
func (c mapCall) apply(m mapInterface) (interface{}, bool)
```

#### <a id="mapCall.Generate" href="#mapCall.Generate">func (mapCall) Generate(r *rand.Rand, size int) reflect.Value</a>

```
searchKey: sync_test.mapCall.Generate
```

```Go
func (mapCall) Generate(r *rand.Rand, size int) reflect.Value
```

### <a id="mapResult" href="#mapResult">type mapResult struct</a>

```
searchKey: sync_test.mapResult
```

```Go
type mapResult struct {
	value interface{}
	ok    bool
}
```

### <a id="one" href="#one">type one int</a>

```
searchKey: sync_test.one
```

```Go
type one int
```

#### <a id="one.Increment" href="#one.Increment">func (o *one) Increment()</a>

```
searchKey: sync_test.one.Increment
```

```Go
func (o *one) Increment()
```

## <a id="func" href="#func">Functions</a>

### <a id="TestCondSignal" href="#TestCondSignal">func TestCondSignal(t *testing.T)</a>

```
searchKey: sync_test.TestCondSignal
```

```Go
func TestCondSignal(t *testing.T)
```

### <a id="TestCondSignalGenerations" href="#TestCondSignalGenerations">func TestCondSignalGenerations(t *testing.T)</a>

```
searchKey: sync_test.TestCondSignalGenerations
```

```Go
func TestCondSignalGenerations(t *testing.T)
```

### <a id="TestCondBroadcast" href="#TestCondBroadcast">func TestCondBroadcast(t *testing.T)</a>

```
searchKey: sync_test.TestCondBroadcast
```

```Go
func TestCondBroadcast(t *testing.T)
```

### <a id="TestRace" href="#TestRace">func TestRace(t *testing.T)</a>

```
searchKey: sync_test.TestRace
```

```Go
func TestRace(t *testing.T)
```

### <a id="TestCondSignalStealing" href="#TestCondSignalStealing">func TestCondSignalStealing(t *testing.T)</a>

```
searchKey: sync_test.TestCondSignalStealing
```

```Go
func TestCondSignalStealing(t *testing.T)
```

### <a id="TestCondCopy" href="#TestCondCopy">func TestCondCopy(t *testing.T)</a>

```
searchKey: sync_test.TestCondCopy
```

```Go
func TestCondCopy(t *testing.T)
```

### <a id="BenchmarkCond1" href="#BenchmarkCond1">func BenchmarkCond1(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkCond1
```

```Go
func BenchmarkCond1(b *testing.B)
```

### <a id="BenchmarkCond2" href="#BenchmarkCond2">func BenchmarkCond2(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkCond2
```

```Go
func BenchmarkCond2(b *testing.B)
```

### <a id="BenchmarkCond4" href="#BenchmarkCond4">func BenchmarkCond4(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkCond4
```

```Go
func BenchmarkCond4(b *testing.B)
```

### <a id="BenchmarkCond8" href="#BenchmarkCond8">func BenchmarkCond8(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkCond8
```

```Go
func BenchmarkCond8(b *testing.B)
```

### <a id="BenchmarkCond16" href="#BenchmarkCond16">func BenchmarkCond16(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkCond16
```

```Go
func BenchmarkCond16(b *testing.B)
```

### <a id="BenchmarkCond32" href="#BenchmarkCond32">func BenchmarkCond32(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkCond32
```

```Go
func BenchmarkCond32(b *testing.B)
```

### <a id="benchmarkCond" href="#benchmarkCond">func benchmarkCond(b *testing.B, waiters int)</a>

```
searchKey: sync_test.benchmarkCond
```

```Go
func benchmarkCond(b *testing.B, waiters int)
```

### <a id="timeNow" href="#timeNow">func timeNow() time.Time</a>

```
searchKey: sync_test.timeNow
```

```Go
func timeNow() time.Time
```

timeNow is a fake version of time.Now for tests. 

### <a id="Log" href="#Log">func Log(w io.Writer, key, val string)</a>

```
searchKey: sync_test.Log
```

```Go
func Log(w io.Writer, key, val string)
```

### <a id="ExamplePool" href="#ExamplePool">func ExamplePool()</a>

```
searchKey: sync_test.ExamplePool
```

```Go
func ExamplePool()
```

### <a id="ExampleWaitGroup" href="#ExampleWaitGroup">func ExampleWaitGroup()</a>

```
searchKey: sync_test.ExampleWaitGroup
```

```Go
func ExampleWaitGroup()
```

This example fetches several URLs concurrently, using a WaitGroup to block until all the fetches are complete. 

### <a id="ExampleOnce" href="#ExampleOnce">func ExampleOnce()</a>

```
searchKey: sync_test.ExampleOnce
```

```Go
func ExampleOnce()
```

### <a id="benchMap" href="#benchMap">func benchMap(b *testing.B, bench bench)</a>

```
searchKey: sync_test.benchMap
```

```Go
func benchMap(b *testing.B, bench bench)
```

### <a id="BenchmarkLoadMostlyHits" href="#BenchmarkLoadMostlyHits">func BenchmarkLoadMostlyHits(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkLoadMostlyHits
```

```Go
func BenchmarkLoadMostlyHits(b *testing.B)
```

### <a id="BenchmarkLoadMostlyMisses" href="#BenchmarkLoadMostlyMisses">func BenchmarkLoadMostlyMisses(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkLoadMostlyMisses
```

```Go
func BenchmarkLoadMostlyMisses(b *testing.B)
```

### <a id="BenchmarkLoadOrStoreBalanced" href="#BenchmarkLoadOrStoreBalanced">func BenchmarkLoadOrStoreBalanced(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkLoadOrStoreBalanced
```

```Go
func BenchmarkLoadOrStoreBalanced(b *testing.B)
```

### <a id="BenchmarkLoadOrStoreUnique" href="#BenchmarkLoadOrStoreUnique">func BenchmarkLoadOrStoreUnique(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkLoadOrStoreUnique
```

```Go
func BenchmarkLoadOrStoreUnique(b *testing.B)
```

### <a id="BenchmarkLoadOrStoreCollision" href="#BenchmarkLoadOrStoreCollision">func BenchmarkLoadOrStoreCollision(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkLoadOrStoreCollision
```

```Go
func BenchmarkLoadOrStoreCollision(b *testing.B)
```

### <a id="BenchmarkLoadAndDeleteBalanced" href="#BenchmarkLoadAndDeleteBalanced">func BenchmarkLoadAndDeleteBalanced(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkLoadAndDeleteBalanced
```

```Go
func BenchmarkLoadAndDeleteBalanced(b *testing.B)
```

### <a id="BenchmarkLoadAndDeleteUnique" href="#BenchmarkLoadAndDeleteUnique">func BenchmarkLoadAndDeleteUnique(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkLoadAndDeleteUnique
```

```Go
func BenchmarkLoadAndDeleteUnique(b *testing.B)
```

### <a id="BenchmarkLoadAndDeleteCollision" href="#BenchmarkLoadAndDeleteCollision">func BenchmarkLoadAndDeleteCollision(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkLoadAndDeleteCollision
```

```Go
func BenchmarkLoadAndDeleteCollision(b *testing.B)
```

### <a id="BenchmarkRange" href="#BenchmarkRange">func BenchmarkRange(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkRange
```

```Go
func BenchmarkRange(b *testing.B)
```

### <a id="BenchmarkAdversarialAlloc" href="#BenchmarkAdversarialAlloc">func BenchmarkAdversarialAlloc(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkAdversarialAlloc
```

```Go
func BenchmarkAdversarialAlloc(b *testing.B)
```

BenchmarkAdversarialAlloc tests performance when we store a new value immediately whenever the map is promoted to clean and otherwise load a unique, missing key. 

This forces the Load calls to always acquire the map's mutex. 

### <a id="BenchmarkAdversarialDelete" href="#BenchmarkAdversarialDelete">func BenchmarkAdversarialDelete(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkAdversarialDelete
```

```Go
func BenchmarkAdversarialDelete(b *testing.B)
```

BenchmarkAdversarialDelete tests performance when we periodically delete one key and add a different one in a large map. 

This forces the Load calls to always acquire the map's mutex and periodically makes a full copy of the map despite changing only one entry. 

### <a id="BenchmarkDeleteCollision" href="#BenchmarkDeleteCollision">func BenchmarkDeleteCollision(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkDeleteCollision
```

```Go
func BenchmarkDeleteCollision(b *testing.B)
```

### <a id="randValue" href="#randValue">func randValue(r *rand.Rand) interface{}</a>

```
searchKey: sync_test.randValue
```

```Go
func randValue(r *rand.Rand) interface{}
```

### <a id="applyCalls" href="#applyCalls">func applyCalls(m mapInterface, calls []mapCall) (results []mapResult, final map[interface{}]interface{})</a>

```
searchKey: sync_test.applyCalls
```

```Go
func applyCalls(m mapInterface, calls []mapCall) (results []mapResult, final map[interface{}]interface{})
```

### <a id="applyMap" href="#applyMap">func applyMap(calls []mapCall) ([]mapResult, map[interface{}]interface{})</a>

```
searchKey: sync_test.applyMap
```

```Go
func applyMap(calls []mapCall) ([]mapResult, map[interface{}]interface{})
```

### <a id="applyRWMutexMap" href="#applyRWMutexMap">func applyRWMutexMap(calls []mapCall) ([]mapResult, map[interface{}]interface{})</a>

```
searchKey: sync_test.applyRWMutexMap
```

```Go
func applyRWMutexMap(calls []mapCall) ([]mapResult, map[interface{}]interface{})
```

### <a id="applyDeepCopyMap" href="#applyDeepCopyMap">func applyDeepCopyMap(calls []mapCall) ([]mapResult, map[interface{}]interface{})</a>

```
searchKey: sync_test.applyDeepCopyMap
```

```Go
func applyDeepCopyMap(calls []mapCall) ([]mapResult, map[interface{}]interface{})
```

### <a id="TestMapMatchesRWMutex" href="#TestMapMatchesRWMutex">func TestMapMatchesRWMutex(t *testing.T)</a>

```
searchKey: sync_test.TestMapMatchesRWMutex
```

```Go
func TestMapMatchesRWMutex(t *testing.T)
```

### <a id="TestMapMatchesDeepCopy" href="#TestMapMatchesDeepCopy">func TestMapMatchesDeepCopy(t *testing.T)</a>

```
searchKey: sync_test.TestMapMatchesDeepCopy
```

```Go
func TestMapMatchesDeepCopy(t *testing.T)
```

### <a id="TestConcurrentRange" href="#TestConcurrentRange">func TestConcurrentRange(t *testing.T)</a>

```
searchKey: sync_test.TestConcurrentRange
```

```Go
func TestConcurrentRange(t *testing.T)
```

### <a id="TestIssue40999" href="#TestIssue40999">func TestIssue40999(t *testing.T)</a>

```
searchKey: sync_test.TestIssue40999
```

```Go
func TestIssue40999(t *testing.T)
```

### <a id="HammerSemaphore" href="#HammerSemaphore">func HammerSemaphore(s *uint32, loops int, cdone chan bool)</a>

```
searchKey: sync_test.HammerSemaphore
```

```Go
func HammerSemaphore(s *uint32, loops int, cdone chan bool)
```

### <a id="TestSemaphore" href="#TestSemaphore">func TestSemaphore(t *testing.T)</a>

```
searchKey: sync_test.TestSemaphore
```

```Go
func TestSemaphore(t *testing.T)
```

### <a id="BenchmarkUncontendedSemaphore" href="#BenchmarkUncontendedSemaphore">func BenchmarkUncontendedSemaphore(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkUncontendedSemaphore
```

```Go
func BenchmarkUncontendedSemaphore(b *testing.B)
```

### <a id="BenchmarkContendedSemaphore" href="#BenchmarkContendedSemaphore">func BenchmarkContendedSemaphore(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkContendedSemaphore
```

```Go
func BenchmarkContendedSemaphore(b *testing.B)
```

### <a id="HammerMutex" href="#HammerMutex">func HammerMutex(m *Mutex, loops int, cdone chan bool)</a>

```
searchKey: sync_test.HammerMutex
```

```Go
func HammerMutex(m *Mutex, loops int, cdone chan bool)
```

### <a id="TestMutex" href="#TestMutex">func TestMutex(t *testing.T)</a>

```
searchKey: sync_test.TestMutex
```

```Go
func TestMutex(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: sync_test.init
```

```Go
func init()
```

### <a id="TestMutexMisuse" href="#TestMutexMisuse">func TestMutexMisuse(t *testing.T)</a>

```
searchKey: sync_test.TestMutexMisuse
```

```Go
func TestMutexMisuse(t *testing.T)
```

### <a id="TestMutexFairness" href="#TestMutexFairness">func TestMutexFairness(t *testing.T)</a>

```
searchKey: sync_test.TestMutexFairness
```

```Go
func TestMutexFairness(t *testing.T)
```

### <a id="BenchmarkMutexUncontended" href="#BenchmarkMutexUncontended">func BenchmarkMutexUncontended(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkMutexUncontended
```

```Go
func BenchmarkMutexUncontended(b *testing.B)
```

### <a id="benchmarkMutex" href="#benchmarkMutex">func benchmarkMutex(b *testing.B, slack, work bool)</a>

```
searchKey: sync_test.benchmarkMutex
```

```Go
func benchmarkMutex(b *testing.B, slack, work bool)
```

### <a id="BenchmarkMutex" href="#BenchmarkMutex">func BenchmarkMutex(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkMutex
```

```Go
func BenchmarkMutex(b *testing.B)
```

### <a id="BenchmarkMutexSlack" href="#BenchmarkMutexSlack">func BenchmarkMutexSlack(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkMutexSlack
```

```Go
func BenchmarkMutexSlack(b *testing.B)
```

### <a id="BenchmarkMutexWork" href="#BenchmarkMutexWork">func BenchmarkMutexWork(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkMutexWork
```

```Go
func BenchmarkMutexWork(b *testing.B)
```

### <a id="BenchmarkMutexWorkSlack" href="#BenchmarkMutexWorkSlack">func BenchmarkMutexWorkSlack(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkMutexWorkSlack
```

```Go
func BenchmarkMutexWorkSlack(b *testing.B)
```

### <a id="BenchmarkMutexNoSpin" href="#BenchmarkMutexNoSpin">func BenchmarkMutexNoSpin(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkMutexNoSpin
```

```Go
func BenchmarkMutexNoSpin(b *testing.B)
```

### <a id="BenchmarkMutexSpin" href="#BenchmarkMutexSpin">func BenchmarkMutexSpin(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkMutexSpin
```

```Go
func BenchmarkMutexSpin(b *testing.B)
```

### <a id="run" href="#run">func run(t *testing.T, once *Once, o *one, c chan bool)</a>

```
searchKey: sync_test.run
```

```Go
func run(t *testing.T, once *Once, o *one, c chan bool)
```

### <a id="TestOnce" href="#TestOnce">func TestOnce(t *testing.T)</a>

```
searchKey: sync_test.TestOnce
```

```Go
func TestOnce(t *testing.T)
```

### <a id="TestOncePanic" href="#TestOncePanic">func TestOncePanic(t *testing.T)</a>

```
searchKey: sync_test.TestOncePanic
```

```Go
func TestOncePanic(t *testing.T)
```

### <a id="BenchmarkOnce" href="#BenchmarkOnce">func BenchmarkOnce(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkOnce
```

```Go
func BenchmarkOnce(b *testing.B)
```

### <a id="TestPool" href="#TestPool">func TestPool(t *testing.T)</a>

```
searchKey: sync_test.TestPool
```

```Go
func TestPool(t *testing.T)
```

### <a id="TestPoolNew" href="#TestPoolNew">func TestPoolNew(t *testing.T)</a>

```
searchKey: sync_test.TestPoolNew
```

```Go
func TestPoolNew(t *testing.T)
```

### <a id="TestPoolGC" href="#TestPoolGC">func TestPoolGC(t *testing.T)</a>

```
searchKey: sync_test.TestPoolGC
```

```Go
func TestPoolGC(t *testing.T)
```

Test that Pool does not hold pointers to previously cached resources. 

### <a id="TestPoolRelease" href="#TestPoolRelease">func TestPoolRelease(t *testing.T)</a>

```
searchKey: sync_test.TestPoolRelease
```

```Go
func TestPoolRelease(t *testing.T)
```

Test that Pool releases resources on GC. 

### <a id="testPool" href="#testPool">func testPool(t *testing.T, drain bool)</a>

```
searchKey: sync_test.testPool
```

```Go
func testPool(t *testing.T, drain bool)
```

### <a id="TestPoolStress" href="#TestPoolStress">func TestPoolStress(t *testing.T)</a>

```
searchKey: sync_test.TestPoolStress
```

```Go
func TestPoolStress(t *testing.T)
```

### <a id="TestPoolDequeue" href="#TestPoolDequeue">func TestPoolDequeue(t *testing.T)</a>

```
searchKey: sync_test.TestPoolDequeue
```

```Go
func TestPoolDequeue(t *testing.T)
```

### <a id="TestPoolChain" href="#TestPoolChain">func TestPoolChain(t *testing.T)</a>

```
searchKey: sync_test.TestPoolChain
```

```Go
func TestPoolChain(t *testing.T)
```

### <a id="testPoolDequeue" href="#testPoolDequeue">func testPoolDequeue(t *testing.T, d PoolDequeue)</a>

```
searchKey: sync_test.testPoolDequeue
```

```Go
func testPoolDequeue(t *testing.T, d PoolDequeue)
```

### <a id="BenchmarkPool" href="#BenchmarkPool">func BenchmarkPool(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkPool
```

```Go
func BenchmarkPool(b *testing.B)
```

### <a id="BenchmarkPoolOverflow" href="#BenchmarkPoolOverflow">func BenchmarkPoolOverflow(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkPoolOverflow
```

```Go
func BenchmarkPoolOverflow(b *testing.B)
```

### <a id="BenchmarkPoolSTW" href="#BenchmarkPoolSTW">func BenchmarkPoolSTW(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkPoolSTW
```

```Go
func BenchmarkPoolSTW(b *testing.B)
```

### <a id="BenchmarkPoolExpensiveNew" href="#BenchmarkPoolExpensiveNew">func BenchmarkPoolExpensiveNew(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkPoolExpensiveNew
```

```Go
func BenchmarkPoolExpensiveNew(b *testing.B)
```

### <a id="BenchmarkSemaUncontended" href="#BenchmarkSemaUncontended">func BenchmarkSemaUncontended(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkSemaUncontended
```

```Go
func BenchmarkSemaUncontended(b *testing.B)
```

### <a id="benchmarkSema" href="#benchmarkSema">func benchmarkSema(b *testing.B, block, work bool)</a>

```
searchKey: sync_test.benchmarkSema
```

```Go
func benchmarkSema(b *testing.B, block, work bool)
```

### <a id="BenchmarkSemaSyntNonblock" href="#BenchmarkSemaSyntNonblock">func BenchmarkSemaSyntNonblock(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkSemaSyntNonblock
```

```Go
func BenchmarkSemaSyntNonblock(b *testing.B)
```

### <a id="BenchmarkSemaSyntBlock" href="#BenchmarkSemaSyntBlock">func BenchmarkSemaSyntBlock(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkSemaSyntBlock
```

```Go
func BenchmarkSemaSyntBlock(b *testing.B)
```

### <a id="BenchmarkSemaWorkNonblock" href="#BenchmarkSemaWorkNonblock">func BenchmarkSemaWorkNonblock(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkSemaWorkNonblock
```

```Go
func BenchmarkSemaWorkNonblock(b *testing.B)
```

### <a id="BenchmarkSemaWorkBlock" href="#BenchmarkSemaWorkBlock">func BenchmarkSemaWorkBlock(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkSemaWorkBlock
```

```Go
func BenchmarkSemaWorkBlock(b *testing.B)
```

### <a id="parallelReader" href="#parallelReader">func parallelReader(m *RWMutex, clocked, cunlock, cdone chan bool)</a>

```
searchKey: sync_test.parallelReader
```

```Go
func parallelReader(m *RWMutex, clocked, cunlock, cdone chan bool)
```

### <a id="doTestParallelReaders" href="#doTestParallelReaders">func doTestParallelReaders(numReaders, gomaxprocs int)</a>

```
searchKey: sync_test.doTestParallelReaders
```

```Go
func doTestParallelReaders(numReaders, gomaxprocs int)
```

### <a id="TestParallelReaders" href="#TestParallelReaders">func TestParallelReaders(t *testing.T)</a>

```
searchKey: sync_test.TestParallelReaders
```

```Go
func TestParallelReaders(t *testing.T)
```

### <a id="reader" href="#reader">func reader(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)</a>

```
searchKey: sync_test.reader
```

```Go
func reader(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)
```

### <a id="writer" href="#writer">func writer(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)</a>

```
searchKey: sync_test.writer
```

```Go
func writer(rwm *RWMutex, num_iterations int, activity *int32, cdone chan bool)
```

### <a id="HammerRWMutex" href="#HammerRWMutex">func HammerRWMutex(gomaxprocs, numReaders, num_iterations int)</a>

```
searchKey: sync_test.HammerRWMutex
```

```Go
func HammerRWMutex(gomaxprocs, numReaders, num_iterations int)
```

### <a id="TestRWMutex" href="#TestRWMutex">func TestRWMutex(t *testing.T)</a>

```
searchKey: sync_test.TestRWMutex
```

```Go
func TestRWMutex(t *testing.T)
```

### <a id="TestRLocker" href="#TestRLocker">func TestRLocker(t *testing.T)</a>

```
searchKey: sync_test.TestRLocker
```

```Go
func TestRLocker(t *testing.T)
```

### <a id="BenchmarkRWMutexUncontended" href="#BenchmarkRWMutexUncontended">func BenchmarkRWMutexUncontended(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkRWMutexUncontended
```

```Go
func BenchmarkRWMutexUncontended(b *testing.B)
```

### <a id="benchmarkRWMutex" href="#benchmarkRWMutex">func benchmarkRWMutex(b *testing.B, localWork, writeRatio int)</a>

```
searchKey: sync_test.benchmarkRWMutex
```

```Go
func benchmarkRWMutex(b *testing.B, localWork, writeRatio int)
```

### <a id="BenchmarkRWMutexWrite100" href="#BenchmarkRWMutexWrite100">func BenchmarkRWMutexWrite100(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkRWMutexWrite100
```

```Go
func BenchmarkRWMutexWrite100(b *testing.B)
```

### <a id="BenchmarkRWMutexWrite10" href="#BenchmarkRWMutexWrite10">func BenchmarkRWMutexWrite10(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkRWMutexWrite10
```

```Go
func BenchmarkRWMutexWrite10(b *testing.B)
```

### <a id="BenchmarkRWMutexWorkWrite100" href="#BenchmarkRWMutexWorkWrite100">func BenchmarkRWMutexWorkWrite100(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkRWMutexWorkWrite100
```

```Go
func BenchmarkRWMutexWorkWrite100(b *testing.B)
```

### <a id="BenchmarkRWMutexWorkWrite10" href="#BenchmarkRWMutexWorkWrite10">func BenchmarkRWMutexWorkWrite10(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkRWMutexWorkWrite10
```

```Go
func BenchmarkRWMutexWorkWrite10(b *testing.B)
```

### <a id="testWaitGroup" href="#testWaitGroup">func testWaitGroup(t *testing.T, wg1 *WaitGroup, wg2 *WaitGroup)</a>

```
searchKey: sync_test.testWaitGroup
```

```Go
func testWaitGroup(t *testing.T, wg1 *WaitGroup, wg2 *WaitGroup)
```

### <a id="TestWaitGroup" href="#TestWaitGroup">func TestWaitGroup(t *testing.T)</a>

```
searchKey: sync_test.TestWaitGroup
```

```Go
func TestWaitGroup(t *testing.T)
```

### <a id="knownRacy" href="#knownRacy">func knownRacy(t *testing.T)</a>

```
searchKey: sync_test.knownRacy
```

```Go
func knownRacy(t *testing.T)
```

### <a id="TestWaitGroupMisuse" href="#TestWaitGroupMisuse">func TestWaitGroupMisuse(t *testing.T)</a>

```
searchKey: sync_test.TestWaitGroupMisuse
```

```Go
func TestWaitGroupMisuse(t *testing.T)
```

### <a id="pollUntilEqual" href="#pollUntilEqual">func pollUntilEqual(v *uint32, target uint32)</a>

```
searchKey: sync_test.pollUntilEqual
```

```Go
func pollUntilEqual(v *uint32, target uint32)
```

pollUntilEqual blocks until v, loaded atomically, is equal to the target. 

### <a id="TestWaitGroupMisuse2" href="#TestWaitGroupMisuse2">func TestWaitGroupMisuse2(t *testing.T)</a>

```
searchKey: sync_test.TestWaitGroupMisuse2
```

```Go
func TestWaitGroupMisuse2(t *testing.T)
```

### <a id="TestWaitGroupMisuse3" href="#TestWaitGroupMisuse3">func TestWaitGroupMisuse3(t *testing.T)</a>

```
searchKey: sync_test.TestWaitGroupMisuse3
```

```Go
func TestWaitGroupMisuse3(t *testing.T)
```

### <a id="TestWaitGroupRace" href="#TestWaitGroupRace">func TestWaitGroupRace(t *testing.T)</a>

```
searchKey: sync_test.TestWaitGroupRace
```

```Go
func TestWaitGroupRace(t *testing.T)
```

### <a id="TestWaitGroupAlign" href="#TestWaitGroupAlign">func TestWaitGroupAlign(t *testing.T)</a>

```
searchKey: sync_test.TestWaitGroupAlign
```

```Go
func TestWaitGroupAlign(t *testing.T)
```

### <a id="BenchmarkWaitGroupUncontended" href="#BenchmarkWaitGroupUncontended">func BenchmarkWaitGroupUncontended(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkWaitGroupUncontended
```

```Go
func BenchmarkWaitGroupUncontended(b *testing.B)
```

### <a id="benchmarkWaitGroupAddDone" href="#benchmarkWaitGroupAddDone">func benchmarkWaitGroupAddDone(b *testing.B, localWork int)</a>

```
searchKey: sync_test.benchmarkWaitGroupAddDone
```

```Go
func benchmarkWaitGroupAddDone(b *testing.B, localWork int)
```

### <a id="BenchmarkWaitGroupAddDone" href="#BenchmarkWaitGroupAddDone">func BenchmarkWaitGroupAddDone(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkWaitGroupAddDone
```

```Go
func BenchmarkWaitGroupAddDone(b *testing.B)
```

### <a id="BenchmarkWaitGroupAddDoneWork" href="#BenchmarkWaitGroupAddDoneWork">func BenchmarkWaitGroupAddDoneWork(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkWaitGroupAddDoneWork
```

```Go
func BenchmarkWaitGroupAddDoneWork(b *testing.B)
```

### <a id="benchmarkWaitGroupWait" href="#benchmarkWaitGroupWait">func benchmarkWaitGroupWait(b *testing.B, localWork int)</a>

```
searchKey: sync_test.benchmarkWaitGroupWait
```

```Go
func benchmarkWaitGroupWait(b *testing.B, localWork int)
```

### <a id="BenchmarkWaitGroupWait" href="#BenchmarkWaitGroupWait">func BenchmarkWaitGroupWait(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkWaitGroupWait
```

```Go
func BenchmarkWaitGroupWait(b *testing.B)
```

### <a id="BenchmarkWaitGroupWaitWork" href="#BenchmarkWaitGroupWaitWork">func BenchmarkWaitGroupWaitWork(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkWaitGroupWaitWork
```

```Go
func BenchmarkWaitGroupWaitWork(b *testing.B)
```

### <a id="BenchmarkWaitGroupActuallyWait" href="#BenchmarkWaitGroupActuallyWait">func BenchmarkWaitGroupActuallyWait(b *testing.B)</a>

```
searchKey: sync_test.BenchmarkWaitGroupActuallyWait
```

```Go
func BenchmarkWaitGroupActuallyWait(b *testing.B)
```

