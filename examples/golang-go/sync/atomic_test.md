# Package atomic_test

## Index

* [Constants](#const)
    * [const arch32](#arch32)
    * [const magic32](#magic32)
    * [const magic64](#magic64)
* [Variables](#var)
    * [var Value_CompareAndSwapTests](#Value_CompareAndSwapTests)
    * [var Value_SwapTests](#Value_SwapTests)
    * [var global](#global)
    * [var hammer32](#hammer32)
    * [var hammer64](#hammer64)
    * [var heapA](#heapA)
    * [var heapB](#heapB)
    * [var test64err](#test64err)
* [Functions](#func)
    * [func BenchmarkValueRead(b *testing.B)](#BenchmarkValueRead)
    * [func ExampleValue_config()](#ExampleValue_config)
    * [func ExampleValue_readMostly()](#ExampleValue_readMostly)
    * [func TestAddInt32(t *testing.T)](#TestAddInt32)
    * [func TestAddInt64(t *testing.T)](#TestAddInt64)
    * [func TestAddUint32(t *testing.T)](#TestAddUint32)
    * [func TestAddUint64(t *testing.T)](#TestAddUint64)
    * [func TestAddUintptr(t *testing.T)](#TestAddUintptr)
    * [func TestCompareAndSwapInt32(t *testing.T)](#TestCompareAndSwapInt32)
    * [func TestCompareAndSwapInt64(t *testing.T)](#TestCompareAndSwapInt64)
    * [func TestCompareAndSwapPointer(t *testing.T)](#TestCompareAndSwapPointer)
    * [func TestCompareAndSwapUint32(t *testing.T)](#TestCompareAndSwapUint32)
    * [func TestCompareAndSwapUint64(t *testing.T)](#TestCompareAndSwapUint64)
    * [func TestCompareAndSwapUintptr(t *testing.T)](#TestCompareAndSwapUintptr)
    * [func TestHammer32(t *testing.T)](#TestHammer32)
    * [func TestHammer64(t *testing.T)](#TestHammer64)
    * [func TestHammerStoreLoad(t *testing.T)](#TestHammerStoreLoad)
    * [func TestLoadInt32(t *testing.T)](#TestLoadInt32)
    * [func TestLoadInt64(t *testing.T)](#TestLoadInt64)
    * [func TestLoadPointer(t *testing.T)](#TestLoadPointer)
    * [func TestLoadUint32(t *testing.T)](#TestLoadUint32)
    * [func TestLoadUint64(t *testing.T)](#TestLoadUint64)
    * [func TestLoadUintptr(t *testing.T)](#TestLoadUintptr)
    * [func TestNilDeref(t *testing.T)](#TestNilDeref)
    * [func TestStoreInt32(t *testing.T)](#TestStoreInt32)
    * [func TestStoreInt64(t *testing.T)](#TestStoreInt64)
    * [func TestStoreLoadRelAcq32(t *testing.T)](#TestStoreLoadRelAcq32)
    * [func TestStoreLoadRelAcq64(t *testing.T)](#TestStoreLoadRelAcq64)
    * [func TestStoreLoadSeqCst32(t *testing.T)](#TestStoreLoadSeqCst32)
    * [func TestStoreLoadSeqCst64(t *testing.T)](#TestStoreLoadSeqCst64)
    * [func TestStorePointer(t *testing.T)](#TestStorePointer)
    * [func TestStoreUint32(t *testing.T)](#TestStoreUint32)
    * [func TestStoreUint64(t *testing.T)](#TestStoreUint64)
    * [func TestStoreUintptr(t *testing.T)](#TestStoreUintptr)
    * [func TestSwapInt32(t *testing.T)](#TestSwapInt32)
    * [func TestSwapInt64(t *testing.T)](#TestSwapInt64)
    * [func TestSwapPointer(t *testing.T)](#TestSwapPointer)
    * [func TestSwapUint32(t *testing.T)](#TestSwapUint32)
    * [func TestSwapUint64(t *testing.T)](#TestSwapUint64)
    * [func TestSwapUintptr(t *testing.T)](#TestSwapUintptr)
    * [func TestUnaligned64(t *testing.T)](#TestUnaligned64)
    * [func TestValue(t *testing.T)](#TestValue)
    * [func TestValueCompareAndSwapConcurrent(t *testing.T)](#TestValueCompareAndSwapConcurrent)
    * [func TestValueConcurrent(t *testing.T)](#TestValueConcurrent)
    * [func TestValueLarge(t *testing.T)](#TestValueLarge)
    * [func TestValuePanic(t *testing.T)](#TestValuePanic)
    * [func TestValueSwapConcurrent(t *testing.T)](#TestValueSwapConcurrent)
    * [func TestValue_CompareAndSwap(t *testing.T)](#TestValue_CompareAndSwap)
    * [func TestValue_Swap(t *testing.T)](#TestValue_Swap)
    * [func hammerAddInt32(uaddr *uint32, count int)](#hammerAddInt32)
    * [func hammerAddInt64(uaddr *uint64, count int)](#hammerAddInt64)
    * [func hammerAddUint32(addr *uint32, count int)](#hammerAddUint32)
    * [func hammerAddUint64(addr *uint64, count int)](#hammerAddUint64)
    * [func hammerAddUintptr32(uaddr *uint32, count int)](#hammerAddUintptr32)
    * [func hammerAddUintptr64(uaddr *uint64, count int)](#hammerAddUintptr64)
    * [func hammerCompareAndSwapInt32(uaddr *uint32, count int)](#hammerCompareAndSwapInt32)
    * [func hammerCompareAndSwapInt64(uaddr *uint64, count int)](#hammerCompareAndSwapInt64)
    * [func hammerCompareAndSwapUint32(addr *uint32, count int)](#hammerCompareAndSwapUint32)
    * [func hammerCompareAndSwapUint64(addr *uint64, count int)](#hammerCompareAndSwapUint64)
    * [func hammerCompareAndSwapUintptr32(uaddr *uint32, count int)](#hammerCompareAndSwapUintptr32)
    * [func hammerCompareAndSwapUintptr64(uaddr *uint64, count int)](#hammerCompareAndSwapUintptr64)
    * [func hammerStoreLoadInt32(t *testing.T, paddr unsafe.Pointer)](#hammerStoreLoadInt32)
    * [func hammerStoreLoadInt64(t *testing.T, paddr unsafe.Pointer)](#hammerStoreLoadInt64)
    * [func hammerStoreLoadPointer(t *testing.T, paddr unsafe.Pointer)](#hammerStoreLoadPointer)
    * [func hammerStoreLoadUint32(t *testing.T, paddr unsafe.Pointer)](#hammerStoreLoadUint32)
    * [func hammerStoreLoadUint64(t *testing.T, paddr unsafe.Pointer)](#hammerStoreLoadUint64)
    * [func hammerStoreLoadUintptr(t *testing.T, paddr unsafe.Pointer)](#hammerStoreLoadUintptr)
    * [func hammerSwapInt32(uaddr *uint32, count int)](#hammerSwapInt32)
    * [func hammerSwapInt64(uaddr *uint64, count int)](#hammerSwapInt64)
    * [func hammerSwapUint32(addr *uint32, count int)](#hammerSwapUint32)
    * [func hammerSwapUint64(addr *uint64, count int)](#hammerSwapUint64)
    * [func hammerSwapUintptr32(uaddr *uint32, count int)](#hammerSwapUintptr32)
    * [func hammerSwapUintptr64(uaddr *uint64, count int)](#hammerSwapUintptr64)
    * [func init()](#init.atomic_test.go)
    * [func init()](#init.atomic_test.go.0xc049df88f0)
    * [func loadConfig() map[string]string](#loadConfig)
    * [func requests() chan int](#requests)
    * [func shouldPanic(t *testing.T, name string, f func())](#shouldPanic)
    * [func testCompareAndSwapUint64(t *testing.T, cas func(*uint64, uint64, uint64) bool)](#testCompareAndSwapUint64)
    * [func testPointers() []unsafe.Pointer](#testPointers)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="arch32" href="#arch32">const arch32</a>

```
searchKey: atomic_test.arch32
tags: [constant boolean private]
```

```Go
const arch32 = unsafe.Sizeof(uintptr(0)) == 4
```

### <a id="magic32" href="#magic32">const magic32</a>

```
searchKey: atomic_test.magic32
tags: [constant number private]
```

```Go
const magic32 = 0xdedbeef
```

### <a id="magic64" href="#magic64">const magic64</a>

```
searchKey: atomic_test.magic64
tags: [constant number private]
```

```Go
const magic64 = 0xdeddeadbeefbeef
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="Value_CompareAndSwapTests" href="#Value_CompareAndSwapTests">var Value_CompareAndSwapTests</a>

```
searchKey: atomic_test.Value_CompareAndSwapTests
tags: [variable array struct private]
```

```Go
var Value_CompareAndSwapTests = ...
```

### <a id="Value_SwapTests" href="#Value_SwapTests">var Value_SwapTests</a>

```
searchKey: atomic_test.Value_SwapTests
tags: [variable array struct private]
```

```Go
var Value_SwapTests = ...
```

### <a id="global" href="#global">var global</a>

```
searchKey: atomic_test.global
tags: [variable array number private]
```

```Go
var global [1024]byte
```

### <a id="hammer32" href="#hammer32">var hammer32</a>

```
searchKey: atomic_test.hammer32
tags: [variable object private]
```

```Go
var hammer32 = ...
```

### <a id="hammer64" href="#hammer64">var hammer64</a>

```
searchKey: atomic_test.hammer64
tags: [variable object private]
```

```Go
var hammer64 = ...
```

### <a id="heapA" href="#heapA">var heapA</a>

```
searchKey: atomic_test.heapA
tags: [variable struct private]
```

```Go
var heapA, heapB = struct{ uint }{0}, struct{ uint }{0}
```

### <a id="heapB" href="#heapB">var heapB</a>

```
searchKey: atomic_test.heapB
tags: [variable struct private]
```

```Go
var heapA, heapB = struct{ uint }{0}, struct{ uint }{0}
```

### <a id="test64err" href="#test64err">var test64err</a>

```
searchKey: atomic_test.test64err
tags: [variable interface private]
```

```Go
var test64err = ...
```

Do the 64-bit functions panic? If so, don't bother testing. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="BenchmarkValueRead" href="#BenchmarkValueRead">func BenchmarkValueRead(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkValueRead
tags: [method private benchmark]
```

```Go
func BenchmarkValueRead(b *testing.B)
```

### <a id="ExampleValue_config" href="#ExampleValue_config">func ExampleValue_config()</a>

```
searchKey: atomic_test.ExampleValue_config
tags: [function private]
```

```Go
func ExampleValue_config()
```

The following example shows how to use Value for periodic program config updates and propagation of the changes to worker goroutines. 

### <a id="ExampleValue_readMostly" href="#ExampleValue_readMostly">func ExampleValue_readMostly()</a>

```
searchKey: atomic_test.ExampleValue_readMostly
tags: [function private]
```

```Go
func ExampleValue_readMostly()
```

The following example shows how to maintain a scalable frequently read, but infrequently updated data structure using copy-on-write idiom. 

### <a id="TestAddInt32" href="#TestAddInt32">func TestAddInt32(t *testing.T)</a>

```
searchKey: atomic_test.TestAddInt32
tags: [method private test]
```

```Go
func TestAddInt32(t *testing.T)
```

### <a id="TestAddInt64" href="#TestAddInt64">func TestAddInt64(t *testing.T)</a>

```
searchKey: atomic_test.TestAddInt64
tags: [method private test]
```

```Go
func TestAddInt64(t *testing.T)
```

### <a id="TestAddUint32" href="#TestAddUint32">func TestAddUint32(t *testing.T)</a>

```
searchKey: atomic_test.TestAddUint32
tags: [method private test]
```

```Go
func TestAddUint32(t *testing.T)
```

### <a id="TestAddUint64" href="#TestAddUint64">func TestAddUint64(t *testing.T)</a>

```
searchKey: atomic_test.TestAddUint64
tags: [method private test]
```

```Go
func TestAddUint64(t *testing.T)
```

### <a id="TestAddUintptr" href="#TestAddUintptr">func TestAddUintptr(t *testing.T)</a>

```
searchKey: atomic_test.TestAddUintptr
tags: [method private test]
```

```Go
func TestAddUintptr(t *testing.T)
```

### <a id="TestCompareAndSwapInt32" href="#TestCompareAndSwapInt32">func TestCompareAndSwapInt32(t *testing.T)</a>

```
searchKey: atomic_test.TestCompareAndSwapInt32
tags: [method private test]
```

```Go
func TestCompareAndSwapInt32(t *testing.T)
```

### <a id="TestCompareAndSwapInt64" href="#TestCompareAndSwapInt64">func TestCompareAndSwapInt64(t *testing.T)</a>

```
searchKey: atomic_test.TestCompareAndSwapInt64
tags: [method private test]
```

```Go
func TestCompareAndSwapInt64(t *testing.T)
```

### <a id="TestCompareAndSwapPointer" href="#TestCompareAndSwapPointer">func TestCompareAndSwapPointer(t *testing.T)</a>

```
searchKey: atomic_test.TestCompareAndSwapPointer
tags: [method private test]
```

```Go
func TestCompareAndSwapPointer(t *testing.T)
```

### <a id="TestCompareAndSwapUint32" href="#TestCompareAndSwapUint32">func TestCompareAndSwapUint32(t *testing.T)</a>

```
searchKey: atomic_test.TestCompareAndSwapUint32
tags: [method private test]
```

```Go
func TestCompareAndSwapUint32(t *testing.T)
```

### <a id="TestCompareAndSwapUint64" href="#TestCompareAndSwapUint64">func TestCompareAndSwapUint64(t *testing.T)</a>

```
searchKey: atomic_test.TestCompareAndSwapUint64
tags: [method private test]
```

```Go
func TestCompareAndSwapUint64(t *testing.T)
```

### <a id="TestCompareAndSwapUintptr" href="#TestCompareAndSwapUintptr">func TestCompareAndSwapUintptr(t *testing.T)</a>

```
searchKey: atomic_test.TestCompareAndSwapUintptr
tags: [method private test]
```

```Go
func TestCompareAndSwapUintptr(t *testing.T)
```

### <a id="TestHammer32" href="#TestHammer32">func TestHammer32(t *testing.T)</a>

```
searchKey: atomic_test.TestHammer32
tags: [method private test]
```

```Go
func TestHammer32(t *testing.T)
```

### <a id="TestHammer64" href="#TestHammer64">func TestHammer64(t *testing.T)</a>

```
searchKey: atomic_test.TestHammer64
tags: [method private test]
```

```Go
func TestHammer64(t *testing.T)
```

### <a id="TestHammerStoreLoad" href="#TestHammerStoreLoad">func TestHammerStoreLoad(t *testing.T)</a>

```
searchKey: atomic_test.TestHammerStoreLoad
tags: [method private test]
```

```Go
func TestHammerStoreLoad(t *testing.T)
```

### <a id="TestLoadInt32" href="#TestLoadInt32">func TestLoadInt32(t *testing.T)</a>

```
searchKey: atomic_test.TestLoadInt32
tags: [method private test]
```

```Go
func TestLoadInt32(t *testing.T)
```

### <a id="TestLoadInt64" href="#TestLoadInt64">func TestLoadInt64(t *testing.T)</a>

```
searchKey: atomic_test.TestLoadInt64
tags: [method private test]
```

```Go
func TestLoadInt64(t *testing.T)
```

### <a id="TestLoadPointer" href="#TestLoadPointer">func TestLoadPointer(t *testing.T)</a>

```
searchKey: atomic_test.TestLoadPointer
tags: [method private test]
```

```Go
func TestLoadPointer(t *testing.T)
```

### <a id="TestLoadUint32" href="#TestLoadUint32">func TestLoadUint32(t *testing.T)</a>

```
searchKey: atomic_test.TestLoadUint32
tags: [method private test]
```

```Go
func TestLoadUint32(t *testing.T)
```

### <a id="TestLoadUint64" href="#TestLoadUint64">func TestLoadUint64(t *testing.T)</a>

```
searchKey: atomic_test.TestLoadUint64
tags: [method private test]
```

```Go
func TestLoadUint64(t *testing.T)
```

### <a id="TestLoadUintptr" href="#TestLoadUintptr">func TestLoadUintptr(t *testing.T)</a>

```
searchKey: atomic_test.TestLoadUintptr
tags: [method private test]
```

```Go
func TestLoadUintptr(t *testing.T)
```

### <a id="TestNilDeref" href="#TestNilDeref">func TestNilDeref(t *testing.T)</a>

```
searchKey: atomic_test.TestNilDeref
tags: [method private test]
```

```Go
func TestNilDeref(t *testing.T)
```

### <a id="TestStoreInt32" href="#TestStoreInt32">func TestStoreInt32(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreInt32
tags: [method private test]
```

```Go
func TestStoreInt32(t *testing.T)
```

### <a id="TestStoreInt64" href="#TestStoreInt64">func TestStoreInt64(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreInt64
tags: [method private test]
```

```Go
func TestStoreInt64(t *testing.T)
```

### <a id="TestStoreLoadRelAcq32" href="#TestStoreLoadRelAcq32">func TestStoreLoadRelAcq32(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreLoadRelAcq32
tags: [method private test]
```

```Go
func TestStoreLoadRelAcq32(t *testing.T)
```

### <a id="TestStoreLoadRelAcq64" href="#TestStoreLoadRelAcq64">func TestStoreLoadRelAcq64(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreLoadRelAcq64
tags: [method private test]
```

```Go
func TestStoreLoadRelAcq64(t *testing.T)
```

### <a id="TestStoreLoadSeqCst32" href="#TestStoreLoadSeqCst32">func TestStoreLoadSeqCst32(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreLoadSeqCst32
tags: [method private test]
```

```Go
func TestStoreLoadSeqCst32(t *testing.T)
```

### <a id="TestStoreLoadSeqCst64" href="#TestStoreLoadSeqCst64">func TestStoreLoadSeqCst64(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreLoadSeqCst64
tags: [method private test]
```

```Go
func TestStoreLoadSeqCst64(t *testing.T)
```

### <a id="TestStorePointer" href="#TestStorePointer">func TestStorePointer(t *testing.T)</a>

```
searchKey: atomic_test.TestStorePointer
tags: [method private test]
```

```Go
func TestStorePointer(t *testing.T)
```

### <a id="TestStoreUint32" href="#TestStoreUint32">func TestStoreUint32(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreUint32
tags: [method private test]
```

```Go
func TestStoreUint32(t *testing.T)
```

### <a id="TestStoreUint64" href="#TestStoreUint64">func TestStoreUint64(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreUint64
tags: [method private test]
```

```Go
func TestStoreUint64(t *testing.T)
```

### <a id="TestStoreUintptr" href="#TestStoreUintptr">func TestStoreUintptr(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreUintptr
tags: [method private test]
```

```Go
func TestStoreUintptr(t *testing.T)
```

### <a id="TestSwapInt32" href="#TestSwapInt32">func TestSwapInt32(t *testing.T)</a>

```
searchKey: atomic_test.TestSwapInt32
tags: [method private test]
```

```Go
func TestSwapInt32(t *testing.T)
```

### <a id="TestSwapInt64" href="#TestSwapInt64">func TestSwapInt64(t *testing.T)</a>

```
searchKey: atomic_test.TestSwapInt64
tags: [method private test]
```

```Go
func TestSwapInt64(t *testing.T)
```

### <a id="TestSwapPointer" href="#TestSwapPointer">func TestSwapPointer(t *testing.T)</a>

```
searchKey: atomic_test.TestSwapPointer
tags: [method private test]
```

```Go
func TestSwapPointer(t *testing.T)
```

### <a id="TestSwapUint32" href="#TestSwapUint32">func TestSwapUint32(t *testing.T)</a>

```
searchKey: atomic_test.TestSwapUint32
tags: [method private test]
```

```Go
func TestSwapUint32(t *testing.T)
```

### <a id="TestSwapUint64" href="#TestSwapUint64">func TestSwapUint64(t *testing.T)</a>

```
searchKey: atomic_test.TestSwapUint64
tags: [method private test]
```

```Go
func TestSwapUint64(t *testing.T)
```

### <a id="TestSwapUintptr" href="#TestSwapUintptr">func TestSwapUintptr(t *testing.T)</a>

```
searchKey: atomic_test.TestSwapUintptr
tags: [method private test]
```

```Go
func TestSwapUintptr(t *testing.T)
```

### <a id="TestUnaligned64" href="#TestUnaligned64">func TestUnaligned64(t *testing.T)</a>

```
searchKey: atomic_test.TestUnaligned64
tags: [method private test]
```

```Go
func TestUnaligned64(t *testing.T)
```

### <a id="TestValue" href="#TestValue">func TestValue(t *testing.T)</a>

```
searchKey: atomic_test.TestValue
tags: [method private test]
```

```Go
func TestValue(t *testing.T)
```

### <a id="TestValueCompareAndSwapConcurrent" href="#TestValueCompareAndSwapConcurrent">func TestValueCompareAndSwapConcurrent(t *testing.T)</a>

```
searchKey: atomic_test.TestValueCompareAndSwapConcurrent
tags: [method private test]
```

```Go
func TestValueCompareAndSwapConcurrent(t *testing.T)
```

### <a id="TestValueConcurrent" href="#TestValueConcurrent">func TestValueConcurrent(t *testing.T)</a>

```
searchKey: atomic_test.TestValueConcurrent
tags: [method private test]
```

```Go
func TestValueConcurrent(t *testing.T)
```

### <a id="TestValueLarge" href="#TestValueLarge">func TestValueLarge(t *testing.T)</a>

```
searchKey: atomic_test.TestValueLarge
tags: [method private test]
```

```Go
func TestValueLarge(t *testing.T)
```

### <a id="TestValuePanic" href="#TestValuePanic">func TestValuePanic(t *testing.T)</a>

```
searchKey: atomic_test.TestValuePanic
tags: [method private test]
```

```Go
func TestValuePanic(t *testing.T)
```

### <a id="TestValueSwapConcurrent" href="#TestValueSwapConcurrent">func TestValueSwapConcurrent(t *testing.T)</a>

```
searchKey: atomic_test.TestValueSwapConcurrent
tags: [method private test]
```

```Go
func TestValueSwapConcurrent(t *testing.T)
```

### <a id="TestValue_CompareAndSwap" href="#TestValue_CompareAndSwap">func TestValue_CompareAndSwap(t *testing.T)</a>

```
searchKey: atomic_test.TestValue_CompareAndSwap
tags: [method private test]
```

```Go
func TestValue_CompareAndSwap(t *testing.T)
```

### <a id="TestValue_Swap" href="#TestValue_Swap">func TestValue_Swap(t *testing.T)</a>

```
searchKey: atomic_test.TestValue_Swap
tags: [method private test]
```

```Go
func TestValue_Swap(t *testing.T)
```

### <a id="hammerAddInt32" href="#hammerAddInt32">func hammerAddInt32(uaddr *uint32, count int)</a>

```
searchKey: atomic_test.hammerAddInt32
tags: [method private]
```

```Go
func hammerAddInt32(uaddr *uint32, count int)
```

### <a id="hammerAddInt64" href="#hammerAddInt64">func hammerAddInt64(uaddr *uint64, count int)</a>

```
searchKey: atomic_test.hammerAddInt64
tags: [method private]
```

```Go
func hammerAddInt64(uaddr *uint64, count int)
```

### <a id="hammerAddUint32" href="#hammerAddUint32">func hammerAddUint32(addr *uint32, count int)</a>

```
searchKey: atomic_test.hammerAddUint32
tags: [method private]
```

```Go
func hammerAddUint32(addr *uint32, count int)
```

### <a id="hammerAddUint64" href="#hammerAddUint64">func hammerAddUint64(addr *uint64, count int)</a>

```
searchKey: atomic_test.hammerAddUint64
tags: [method private]
```

```Go
func hammerAddUint64(addr *uint64, count int)
```

### <a id="hammerAddUintptr32" href="#hammerAddUintptr32">func hammerAddUintptr32(uaddr *uint32, count int)</a>

```
searchKey: atomic_test.hammerAddUintptr32
tags: [method private]
```

```Go
func hammerAddUintptr32(uaddr *uint32, count int)
```

### <a id="hammerAddUintptr64" href="#hammerAddUintptr64">func hammerAddUintptr64(uaddr *uint64, count int)</a>

```
searchKey: atomic_test.hammerAddUintptr64
tags: [method private]
```

```Go
func hammerAddUintptr64(uaddr *uint64, count int)
```

### <a id="hammerCompareAndSwapInt32" href="#hammerCompareAndSwapInt32">func hammerCompareAndSwapInt32(uaddr *uint32, count int)</a>

```
searchKey: atomic_test.hammerCompareAndSwapInt32
tags: [method private]
```

```Go
func hammerCompareAndSwapInt32(uaddr *uint32, count int)
```

### <a id="hammerCompareAndSwapInt64" href="#hammerCompareAndSwapInt64">func hammerCompareAndSwapInt64(uaddr *uint64, count int)</a>

```
searchKey: atomic_test.hammerCompareAndSwapInt64
tags: [method private]
```

```Go
func hammerCompareAndSwapInt64(uaddr *uint64, count int)
```

### <a id="hammerCompareAndSwapUint32" href="#hammerCompareAndSwapUint32">func hammerCompareAndSwapUint32(addr *uint32, count int)</a>

```
searchKey: atomic_test.hammerCompareAndSwapUint32
tags: [method private]
```

```Go
func hammerCompareAndSwapUint32(addr *uint32, count int)
```

### <a id="hammerCompareAndSwapUint64" href="#hammerCompareAndSwapUint64">func hammerCompareAndSwapUint64(addr *uint64, count int)</a>

```
searchKey: atomic_test.hammerCompareAndSwapUint64
tags: [method private]
```

```Go
func hammerCompareAndSwapUint64(addr *uint64, count int)
```

### <a id="hammerCompareAndSwapUintptr32" href="#hammerCompareAndSwapUintptr32">func hammerCompareAndSwapUintptr32(uaddr *uint32, count int)</a>

```
searchKey: atomic_test.hammerCompareAndSwapUintptr32
tags: [method private]
```

```Go
func hammerCompareAndSwapUintptr32(uaddr *uint32, count int)
```

### <a id="hammerCompareAndSwapUintptr64" href="#hammerCompareAndSwapUintptr64">func hammerCompareAndSwapUintptr64(uaddr *uint64, count int)</a>

```
searchKey: atomic_test.hammerCompareAndSwapUintptr64
tags: [method private]
```

```Go
func hammerCompareAndSwapUintptr64(uaddr *uint64, count int)
```

### <a id="hammerStoreLoadInt32" href="#hammerStoreLoadInt32">func hammerStoreLoadInt32(t *testing.T, paddr unsafe.Pointer)</a>

```
searchKey: atomic_test.hammerStoreLoadInt32
tags: [method private]
```

```Go
func hammerStoreLoadInt32(t *testing.T, paddr unsafe.Pointer)
```

### <a id="hammerStoreLoadInt64" href="#hammerStoreLoadInt64">func hammerStoreLoadInt64(t *testing.T, paddr unsafe.Pointer)</a>

```
searchKey: atomic_test.hammerStoreLoadInt64
tags: [method private]
```

```Go
func hammerStoreLoadInt64(t *testing.T, paddr unsafe.Pointer)
```

### <a id="hammerStoreLoadPointer" href="#hammerStoreLoadPointer">func hammerStoreLoadPointer(t *testing.T, paddr unsafe.Pointer)</a>

```
searchKey: atomic_test.hammerStoreLoadPointer
tags: [method private]
```

```Go
func hammerStoreLoadPointer(t *testing.T, paddr unsafe.Pointer)
```

This code is just testing that LoadPointer/StorePointer operate atomically; it's not actually calculating pointers. 

### <a id="hammerStoreLoadUint32" href="#hammerStoreLoadUint32">func hammerStoreLoadUint32(t *testing.T, paddr unsafe.Pointer)</a>

```
searchKey: atomic_test.hammerStoreLoadUint32
tags: [method private]
```

```Go
func hammerStoreLoadUint32(t *testing.T, paddr unsafe.Pointer)
```

### <a id="hammerStoreLoadUint64" href="#hammerStoreLoadUint64">func hammerStoreLoadUint64(t *testing.T, paddr unsafe.Pointer)</a>

```
searchKey: atomic_test.hammerStoreLoadUint64
tags: [method private]
```

```Go
func hammerStoreLoadUint64(t *testing.T, paddr unsafe.Pointer)
```

### <a id="hammerStoreLoadUintptr" href="#hammerStoreLoadUintptr">func hammerStoreLoadUintptr(t *testing.T, paddr unsafe.Pointer)</a>

```
searchKey: atomic_test.hammerStoreLoadUintptr
tags: [method private]
```

```Go
func hammerStoreLoadUintptr(t *testing.T, paddr unsafe.Pointer)
```

### <a id="hammerSwapInt32" href="#hammerSwapInt32">func hammerSwapInt32(uaddr *uint32, count int)</a>

```
searchKey: atomic_test.hammerSwapInt32
tags: [method private]
```

```Go
func hammerSwapInt32(uaddr *uint32, count int)
```

### <a id="hammerSwapInt64" href="#hammerSwapInt64">func hammerSwapInt64(uaddr *uint64, count int)</a>

```
searchKey: atomic_test.hammerSwapInt64
tags: [method private]
```

```Go
func hammerSwapInt64(uaddr *uint64, count int)
```

### <a id="hammerSwapUint32" href="#hammerSwapUint32">func hammerSwapUint32(addr *uint32, count int)</a>

```
searchKey: atomic_test.hammerSwapUint32
tags: [method private]
```

```Go
func hammerSwapUint32(addr *uint32, count int)
```

### <a id="hammerSwapUint64" href="#hammerSwapUint64">func hammerSwapUint64(addr *uint64, count int)</a>

```
searchKey: atomic_test.hammerSwapUint64
tags: [method private]
```

```Go
func hammerSwapUint64(addr *uint64, count int)
```

### <a id="hammerSwapUintptr32" href="#hammerSwapUintptr32">func hammerSwapUintptr32(uaddr *uint32, count int)</a>

```
searchKey: atomic_test.hammerSwapUintptr32
tags: [method private]
```

```Go
func hammerSwapUintptr32(uaddr *uint32, count int)
```

### <a id="hammerSwapUintptr64" href="#hammerSwapUintptr64">func hammerSwapUintptr64(uaddr *uint64, count int)</a>

```
searchKey: atomic_test.hammerSwapUintptr64
tags: [method private]
```

```Go
func hammerSwapUintptr64(uaddr *uint64, count int)
```

### <a id="init.atomic_test.go" href="#init.atomic_test.go">func init()</a>

```
searchKey: atomic_test.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.atomic_test.go.0xc049df88f0" href="#init.atomic_test.go.0xc049df88f0">func init()</a>

```
searchKey: atomic_test.init
tags: [function private]
```

```Go
func init()
```

### <a id="loadConfig" href="#loadConfig">func loadConfig() map[string]string</a>

```
searchKey: atomic_test.loadConfig
tags: [function private]
```

```Go
func loadConfig() map[string]string
```

### <a id="requests" href="#requests">func requests() chan int</a>

```
searchKey: atomic_test.requests
tags: [function private]
```

```Go
func requests() chan int
```

### <a id="shouldPanic" href="#shouldPanic">func shouldPanic(t *testing.T, name string, f func())</a>

```
searchKey: atomic_test.shouldPanic
tags: [method private]
```

```Go
func shouldPanic(t *testing.T, name string, f func())
```

### <a id="testCompareAndSwapUint64" href="#testCompareAndSwapUint64">func testCompareAndSwapUint64(t *testing.T, cas func(*uint64, uint64, uint64) bool)</a>

```
searchKey: atomic_test.testCompareAndSwapUint64
tags: [method private]
```

```Go
func testCompareAndSwapUint64(t *testing.T, cas func(*uint64, uint64, uint64) bool)
```

### <a id="testPointers" href="#testPointers">func testPointers() []unsafe.Pointer</a>

```
searchKey: atomic_test.testPointers
tags: [function private]
```

```Go
func testPointers() []unsafe.Pointer
```

