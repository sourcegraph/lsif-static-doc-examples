# Package atomic_test

## Index

* [Constants](#const)
    * [const magic32](#magic32)
    * [const magic64](#magic64)
    * [const arch32](#arch32)
* [Variables](#var)
    * [var test64err](#test64err)
    * [var global](#global)
    * [var hammer32](#hammer32)
    * [var hammer64](#hammer64)
    * [var Value_SwapTests](#Value_SwapTests)
    * [var heapA](#heapA)
    * [var heapB](#heapB)
    * [var Value_CompareAndSwapTests](#Value_CompareAndSwapTests)
* [Functions](#func)
    * [func TestSwapInt32(t *testing.T)](#TestSwapInt32)
    * [func TestSwapUint32(t *testing.T)](#TestSwapUint32)
    * [func TestSwapInt64(t *testing.T)](#TestSwapInt64)
    * [func TestSwapUint64(t *testing.T)](#TestSwapUint64)
    * [func TestSwapUintptr(t *testing.T)](#TestSwapUintptr)
    * [func testPointers() []unsafe.Pointer](#testPointers)
    * [func TestSwapPointer(t *testing.T)](#TestSwapPointer)
    * [func TestAddInt32(t *testing.T)](#TestAddInt32)
    * [func TestAddUint32(t *testing.T)](#TestAddUint32)
    * [func TestAddInt64(t *testing.T)](#TestAddInt64)
    * [func TestAddUint64(t *testing.T)](#TestAddUint64)
    * [func TestAddUintptr(t *testing.T)](#TestAddUintptr)
    * [func TestCompareAndSwapInt32(t *testing.T)](#TestCompareAndSwapInt32)
    * [func TestCompareAndSwapUint32(t *testing.T)](#TestCompareAndSwapUint32)
    * [func TestCompareAndSwapInt64(t *testing.T)](#TestCompareAndSwapInt64)
    * [func testCompareAndSwapUint64(t *testing.T, cas func(*uint64, uint64, uint64) bool)](#testCompareAndSwapUint64)
    * [func TestCompareAndSwapUint64(t *testing.T)](#TestCompareAndSwapUint64)
    * [func TestCompareAndSwapUintptr(t *testing.T)](#TestCompareAndSwapUintptr)
    * [func TestCompareAndSwapPointer(t *testing.T)](#TestCompareAndSwapPointer)
    * [func TestLoadInt32(t *testing.T)](#TestLoadInt32)
    * [func TestLoadUint32(t *testing.T)](#TestLoadUint32)
    * [func TestLoadInt64(t *testing.T)](#TestLoadInt64)
    * [func TestLoadUint64(t *testing.T)](#TestLoadUint64)
    * [func TestLoadUintptr(t *testing.T)](#TestLoadUintptr)
    * [func TestLoadPointer(t *testing.T)](#TestLoadPointer)
    * [func TestStoreInt32(t *testing.T)](#TestStoreInt32)
    * [func TestStoreUint32(t *testing.T)](#TestStoreUint32)
    * [func TestStoreInt64(t *testing.T)](#TestStoreInt64)
    * [func TestStoreUint64(t *testing.T)](#TestStoreUint64)
    * [func TestStoreUintptr(t *testing.T)](#TestStoreUintptr)
    * [func TestStorePointer(t *testing.T)](#TestStorePointer)
    * [func init()](#init)
    * [func hammerSwapInt32(uaddr *uint32, count int)](#hammerSwapInt32)
    * [func hammerSwapUint32(addr *uint32, count int)](#hammerSwapUint32)
    * [func hammerSwapUintptr32(uaddr *uint32, count int)](#hammerSwapUintptr32)
    * [func hammerAddInt32(uaddr *uint32, count int)](#hammerAddInt32)
    * [func hammerAddUint32(addr *uint32, count int)](#hammerAddUint32)
    * [func hammerAddUintptr32(uaddr *uint32, count int)](#hammerAddUintptr32)
    * [func hammerCompareAndSwapInt32(uaddr *uint32, count int)](#hammerCompareAndSwapInt32)
    * [func hammerCompareAndSwapUint32(addr *uint32, count int)](#hammerCompareAndSwapUint32)
    * [func hammerCompareAndSwapUintptr32(uaddr *uint32, count int)](#hammerCompareAndSwapUintptr32)
    * [func TestHammer32(t *testing.T)](#TestHammer32)
    * [func init()](#init)
    * [func hammerSwapInt64(uaddr *uint64, count int)](#hammerSwapInt64)
    * [func hammerSwapUint64(addr *uint64, count int)](#hammerSwapUint64)
    * [func hammerSwapUintptr64(uaddr *uint64, count int)](#hammerSwapUintptr64)
    * [func hammerAddInt64(uaddr *uint64, count int)](#hammerAddInt64)
    * [func hammerAddUint64(addr *uint64, count int)](#hammerAddUint64)
    * [func hammerAddUintptr64(uaddr *uint64, count int)](#hammerAddUintptr64)
    * [func hammerCompareAndSwapInt64(uaddr *uint64, count int)](#hammerCompareAndSwapInt64)
    * [func hammerCompareAndSwapUint64(addr *uint64, count int)](#hammerCompareAndSwapUint64)
    * [func hammerCompareAndSwapUintptr64(uaddr *uint64, count int)](#hammerCompareAndSwapUintptr64)
    * [func TestHammer64(t *testing.T)](#TestHammer64)
    * [func hammerStoreLoadInt32(t *testing.T, paddr unsafe.Pointer)](#hammerStoreLoadInt32)
    * [func hammerStoreLoadUint32(t *testing.T, paddr unsafe.Pointer)](#hammerStoreLoadUint32)
    * [func hammerStoreLoadInt64(t *testing.T, paddr unsafe.Pointer)](#hammerStoreLoadInt64)
    * [func hammerStoreLoadUint64(t *testing.T, paddr unsafe.Pointer)](#hammerStoreLoadUint64)
    * [func hammerStoreLoadUintptr(t *testing.T, paddr unsafe.Pointer)](#hammerStoreLoadUintptr)
    * [func hammerStoreLoadPointer(t *testing.T, paddr unsafe.Pointer)](#hammerStoreLoadPointer)
    * [func TestHammerStoreLoad(t *testing.T)](#TestHammerStoreLoad)
    * [func TestStoreLoadSeqCst32(t *testing.T)](#TestStoreLoadSeqCst32)
    * [func TestStoreLoadSeqCst64(t *testing.T)](#TestStoreLoadSeqCst64)
    * [func TestStoreLoadRelAcq32(t *testing.T)](#TestStoreLoadRelAcq32)
    * [func TestStoreLoadRelAcq64(t *testing.T)](#TestStoreLoadRelAcq64)
    * [func shouldPanic(t *testing.T, name string, f func())](#shouldPanic)
    * [func TestUnaligned64(t *testing.T)](#TestUnaligned64)
    * [func TestNilDeref(t *testing.T)](#TestNilDeref)
    * [func loadConfig() map[string]string](#loadConfig)
    * [func requests() chan int](#requests)
    * [func ExampleValue_config()](#ExampleValue_config)
    * [func ExampleValue_readMostly()](#ExampleValue_readMostly)
    * [func TestValue(t *testing.T)](#TestValue)
    * [func TestValueLarge(t *testing.T)](#TestValueLarge)
    * [func TestValuePanic(t *testing.T)](#TestValuePanic)
    * [func TestValueConcurrent(t *testing.T)](#TestValueConcurrent)
    * [func BenchmarkValueRead(b *testing.B)](#BenchmarkValueRead)
    * [func TestValue_Swap(t *testing.T)](#TestValue_Swap)
    * [func TestValueSwapConcurrent(t *testing.T)](#TestValueSwapConcurrent)
    * [func TestValue_CompareAndSwap(t *testing.T)](#TestValue_CompareAndSwap)
    * [func TestValueCompareAndSwapConcurrent(t *testing.T)](#TestValueCompareAndSwapConcurrent)


## <a id="const" href="#const">Constants</a>

### <a id="magic32" href="#magic32">const magic32</a>

```
searchKey: atomic_test.magic32
```

```Go
const magic32 = 0xdedbeef
```

### <a id="magic64" href="#magic64">const magic64</a>

```
searchKey: atomic_test.magic64
```

```Go
const magic64 = 0xdeddeadbeefbeef
```

### <a id="arch32" href="#arch32">const arch32</a>

```
searchKey: atomic_test.arch32
```

```Go
const arch32 = unsafe.Sizeof(uintptr(0)) == 4
```

## <a id="var" href="#var">Variables</a>

### <a id="test64err" href="#test64err">var test64err</a>

```
searchKey: atomic_test.test64err
```

```Go
var test64err = ...
```

Do the 64-bit functions panic? If so, don't bother testing. 

### <a id="global" href="#global">var global</a>

```
searchKey: atomic_test.global
```

```Go
var global [1024]byte
```

### <a id="hammer32" href="#hammer32">var hammer32</a>

```
searchKey: atomic_test.hammer32
```

```Go
var hammer32 = ...
```

### <a id="hammer64" href="#hammer64">var hammer64</a>

```
searchKey: atomic_test.hammer64
```

```Go
var hammer64 = ...
```

### <a id="Value_SwapTests" href="#Value_SwapTests">var Value_SwapTests</a>

```
searchKey: atomic_test.Value_SwapTests
```

```Go
var Value_SwapTests = ...
```

### <a id="heapA" href="#heapA">var heapA</a>

```
searchKey: atomic_test.heapA
```

```Go
var heapA, heapB = struct{ uint }{0}, struct{ uint }{0}
```

### <a id="heapB" href="#heapB">var heapB</a>

```
searchKey: atomic_test.heapB
```

```Go
var heapA, heapB = struct{ uint }{0}, struct{ uint }{0}
```

### <a id="Value_CompareAndSwapTests" href="#Value_CompareAndSwapTests">var Value_CompareAndSwapTests</a>

```
searchKey: atomic_test.Value_CompareAndSwapTests
```

```Go
var Value_CompareAndSwapTests = ...
```

## <a id="func" href="#func">Functions</a>

### <a id="TestSwapInt32" href="#TestSwapInt32">func TestSwapInt32(t *testing.T)</a>

```
searchKey: atomic_test.TestSwapInt32
```

```Go
func TestSwapInt32(t *testing.T)
```

### <a id="TestSwapUint32" href="#TestSwapUint32">func TestSwapUint32(t *testing.T)</a>

```
searchKey: atomic_test.TestSwapUint32
```

```Go
func TestSwapUint32(t *testing.T)
```

### <a id="TestSwapInt64" href="#TestSwapInt64">func TestSwapInt64(t *testing.T)</a>

```
searchKey: atomic_test.TestSwapInt64
```

```Go
func TestSwapInt64(t *testing.T)
```

### <a id="TestSwapUint64" href="#TestSwapUint64">func TestSwapUint64(t *testing.T)</a>

```
searchKey: atomic_test.TestSwapUint64
```

```Go
func TestSwapUint64(t *testing.T)
```

### <a id="TestSwapUintptr" href="#TestSwapUintptr">func TestSwapUintptr(t *testing.T)</a>

```
searchKey: atomic_test.TestSwapUintptr
```

```Go
func TestSwapUintptr(t *testing.T)
```

### <a id="testPointers" href="#testPointers">func testPointers() []unsafe.Pointer</a>

```
searchKey: atomic_test.testPointers
```

```Go
func testPointers() []unsafe.Pointer
```

### <a id="TestSwapPointer" href="#TestSwapPointer">func TestSwapPointer(t *testing.T)</a>

```
searchKey: atomic_test.TestSwapPointer
```

```Go
func TestSwapPointer(t *testing.T)
```

### <a id="TestAddInt32" href="#TestAddInt32">func TestAddInt32(t *testing.T)</a>

```
searchKey: atomic_test.TestAddInt32
```

```Go
func TestAddInt32(t *testing.T)
```

### <a id="TestAddUint32" href="#TestAddUint32">func TestAddUint32(t *testing.T)</a>

```
searchKey: atomic_test.TestAddUint32
```

```Go
func TestAddUint32(t *testing.T)
```

### <a id="TestAddInt64" href="#TestAddInt64">func TestAddInt64(t *testing.T)</a>

```
searchKey: atomic_test.TestAddInt64
```

```Go
func TestAddInt64(t *testing.T)
```

### <a id="TestAddUint64" href="#TestAddUint64">func TestAddUint64(t *testing.T)</a>

```
searchKey: atomic_test.TestAddUint64
```

```Go
func TestAddUint64(t *testing.T)
```

### <a id="TestAddUintptr" href="#TestAddUintptr">func TestAddUintptr(t *testing.T)</a>

```
searchKey: atomic_test.TestAddUintptr
```

```Go
func TestAddUintptr(t *testing.T)
```

### <a id="TestCompareAndSwapInt32" href="#TestCompareAndSwapInt32">func TestCompareAndSwapInt32(t *testing.T)</a>

```
searchKey: atomic_test.TestCompareAndSwapInt32
```

```Go
func TestCompareAndSwapInt32(t *testing.T)
```

### <a id="TestCompareAndSwapUint32" href="#TestCompareAndSwapUint32">func TestCompareAndSwapUint32(t *testing.T)</a>

```
searchKey: atomic_test.TestCompareAndSwapUint32
```

```Go
func TestCompareAndSwapUint32(t *testing.T)
```

### <a id="TestCompareAndSwapInt64" href="#TestCompareAndSwapInt64">func TestCompareAndSwapInt64(t *testing.T)</a>

```
searchKey: atomic_test.TestCompareAndSwapInt64
```

```Go
func TestCompareAndSwapInt64(t *testing.T)
```

### <a id="testCompareAndSwapUint64" href="#testCompareAndSwapUint64">func testCompareAndSwapUint64(t *testing.T, cas func(*uint64, uint64, uint64) bool)</a>

```
searchKey: atomic_test.testCompareAndSwapUint64
```

```Go
func testCompareAndSwapUint64(t *testing.T, cas func(*uint64, uint64, uint64) bool)
```

### <a id="TestCompareAndSwapUint64" href="#TestCompareAndSwapUint64">func TestCompareAndSwapUint64(t *testing.T)</a>

```
searchKey: atomic_test.TestCompareAndSwapUint64
```

```Go
func TestCompareAndSwapUint64(t *testing.T)
```

### <a id="TestCompareAndSwapUintptr" href="#TestCompareAndSwapUintptr">func TestCompareAndSwapUintptr(t *testing.T)</a>

```
searchKey: atomic_test.TestCompareAndSwapUintptr
```

```Go
func TestCompareAndSwapUintptr(t *testing.T)
```

### <a id="TestCompareAndSwapPointer" href="#TestCompareAndSwapPointer">func TestCompareAndSwapPointer(t *testing.T)</a>

```
searchKey: atomic_test.TestCompareAndSwapPointer
```

```Go
func TestCompareAndSwapPointer(t *testing.T)
```

### <a id="TestLoadInt32" href="#TestLoadInt32">func TestLoadInt32(t *testing.T)</a>

```
searchKey: atomic_test.TestLoadInt32
```

```Go
func TestLoadInt32(t *testing.T)
```

### <a id="TestLoadUint32" href="#TestLoadUint32">func TestLoadUint32(t *testing.T)</a>

```
searchKey: atomic_test.TestLoadUint32
```

```Go
func TestLoadUint32(t *testing.T)
```

### <a id="TestLoadInt64" href="#TestLoadInt64">func TestLoadInt64(t *testing.T)</a>

```
searchKey: atomic_test.TestLoadInt64
```

```Go
func TestLoadInt64(t *testing.T)
```

### <a id="TestLoadUint64" href="#TestLoadUint64">func TestLoadUint64(t *testing.T)</a>

```
searchKey: atomic_test.TestLoadUint64
```

```Go
func TestLoadUint64(t *testing.T)
```

### <a id="TestLoadUintptr" href="#TestLoadUintptr">func TestLoadUintptr(t *testing.T)</a>

```
searchKey: atomic_test.TestLoadUintptr
```

```Go
func TestLoadUintptr(t *testing.T)
```

### <a id="TestLoadPointer" href="#TestLoadPointer">func TestLoadPointer(t *testing.T)</a>

```
searchKey: atomic_test.TestLoadPointer
```

```Go
func TestLoadPointer(t *testing.T)
```

### <a id="TestStoreInt32" href="#TestStoreInt32">func TestStoreInt32(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreInt32
```

```Go
func TestStoreInt32(t *testing.T)
```

### <a id="TestStoreUint32" href="#TestStoreUint32">func TestStoreUint32(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreUint32
```

```Go
func TestStoreUint32(t *testing.T)
```

### <a id="TestStoreInt64" href="#TestStoreInt64">func TestStoreInt64(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreInt64
```

```Go
func TestStoreInt64(t *testing.T)
```

### <a id="TestStoreUint64" href="#TestStoreUint64">func TestStoreUint64(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreUint64
```

```Go
func TestStoreUint64(t *testing.T)
```

### <a id="TestStoreUintptr" href="#TestStoreUintptr">func TestStoreUintptr(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreUintptr
```

```Go
func TestStoreUintptr(t *testing.T)
```

### <a id="TestStorePointer" href="#TestStorePointer">func TestStorePointer(t *testing.T)</a>

```
searchKey: atomic_test.TestStorePointer
```

```Go
func TestStorePointer(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: atomic_test.init
```

```Go
func init()
```

### <a id="hammerSwapInt32" href="#hammerSwapInt32">func hammerSwapInt32(uaddr *uint32, count int)</a>

```
searchKey: atomic_test.hammerSwapInt32
```

```Go
func hammerSwapInt32(uaddr *uint32, count int)
```

### <a id="hammerSwapUint32" href="#hammerSwapUint32">func hammerSwapUint32(addr *uint32, count int)</a>

```
searchKey: atomic_test.hammerSwapUint32
```

```Go
func hammerSwapUint32(addr *uint32, count int)
```

### <a id="hammerSwapUintptr32" href="#hammerSwapUintptr32">func hammerSwapUintptr32(uaddr *uint32, count int)</a>

```
searchKey: atomic_test.hammerSwapUintptr32
```

```Go
func hammerSwapUintptr32(uaddr *uint32, count int)
```

### <a id="hammerAddInt32" href="#hammerAddInt32">func hammerAddInt32(uaddr *uint32, count int)</a>

```
searchKey: atomic_test.hammerAddInt32
```

```Go
func hammerAddInt32(uaddr *uint32, count int)
```

### <a id="hammerAddUint32" href="#hammerAddUint32">func hammerAddUint32(addr *uint32, count int)</a>

```
searchKey: atomic_test.hammerAddUint32
```

```Go
func hammerAddUint32(addr *uint32, count int)
```

### <a id="hammerAddUintptr32" href="#hammerAddUintptr32">func hammerAddUintptr32(uaddr *uint32, count int)</a>

```
searchKey: atomic_test.hammerAddUintptr32
```

```Go
func hammerAddUintptr32(uaddr *uint32, count int)
```

### <a id="hammerCompareAndSwapInt32" href="#hammerCompareAndSwapInt32">func hammerCompareAndSwapInt32(uaddr *uint32, count int)</a>

```
searchKey: atomic_test.hammerCompareAndSwapInt32
```

```Go
func hammerCompareAndSwapInt32(uaddr *uint32, count int)
```

### <a id="hammerCompareAndSwapUint32" href="#hammerCompareAndSwapUint32">func hammerCompareAndSwapUint32(addr *uint32, count int)</a>

```
searchKey: atomic_test.hammerCompareAndSwapUint32
```

```Go
func hammerCompareAndSwapUint32(addr *uint32, count int)
```

### <a id="hammerCompareAndSwapUintptr32" href="#hammerCompareAndSwapUintptr32">func hammerCompareAndSwapUintptr32(uaddr *uint32, count int)</a>

```
searchKey: atomic_test.hammerCompareAndSwapUintptr32
```

```Go
func hammerCompareAndSwapUintptr32(uaddr *uint32, count int)
```

### <a id="TestHammer32" href="#TestHammer32">func TestHammer32(t *testing.T)</a>

```
searchKey: atomic_test.TestHammer32
```

```Go
func TestHammer32(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: atomic_test.init
```

```Go
func init()
```

### <a id="hammerSwapInt64" href="#hammerSwapInt64">func hammerSwapInt64(uaddr *uint64, count int)</a>

```
searchKey: atomic_test.hammerSwapInt64
```

```Go
func hammerSwapInt64(uaddr *uint64, count int)
```

### <a id="hammerSwapUint64" href="#hammerSwapUint64">func hammerSwapUint64(addr *uint64, count int)</a>

```
searchKey: atomic_test.hammerSwapUint64
```

```Go
func hammerSwapUint64(addr *uint64, count int)
```

### <a id="hammerSwapUintptr64" href="#hammerSwapUintptr64">func hammerSwapUintptr64(uaddr *uint64, count int)</a>

```
searchKey: atomic_test.hammerSwapUintptr64
```

```Go
func hammerSwapUintptr64(uaddr *uint64, count int)
```

### <a id="hammerAddInt64" href="#hammerAddInt64">func hammerAddInt64(uaddr *uint64, count int)</a>

```
searchKey: atomic_test.hammerAddInt64
```

```Go
func hammerAddInt64(uaddr *uint64, count int)
```

### <a id="hammerAddUint64" href="#hammerAddUint64">func hammerAddUint64(addr *uint64, count int)</a>

```
searchKey: atomic_test.hammerAddUint64
```

```Go
func hammerAddUint64(addr *uint64, count int)
```

### <a id="hammerAddUintptr64" href="#hammerAddUintptr64">func hammerAddUintptr64(uaddr *uint64, count int)</a>

```
searchKey: atomic_test.hammerAddUintptr64
```

```Go
func hammerAddUintptr64(uaddr *uint64, count int)
```

### <a id="hammerCompareAndSwapInt64" href="#hammerCompareAndSwapInt64">func hammerCompareAndSwapInt64(uaddr *uint64, count int)</a>

```
searchKey: atomic_test.hammerCompareAndSwapInt64
```

```Go
func hammerCompareAndSwapInt64(uaddr *uint64, count int)
```

### <a id="hammerCompareAndSwapUint64" href="#hammerCompareAndSwapUint64">func hammerCompareAndSwapUint64(addr *uint64, count int)</a>

```
searchKey: atomic_test.hammerCompareAndSwapUint64
```

```Go
func hammerCompareAndSwapUint64(addr *uint64, count int)
```

### <a id="hammerCompareAndSwapUintptr64" href="#hammerCompareAndSwapUintptr64">func hammerCompareAndSwapUintptr64(uaddr *uint64, count int)</a>

```
searchKey: atomic_test.hammerCompareAndSwapUintptr64
```

```Go
func hammerCompareAndSwapUintptr64(uaddr *uint64, count int)
```

### <a id="TestHammer64" href="#TestHammer64">func TestHammer64(t *testing.T)</a>

```
searchKey: atomic_test.TestHammer64
```

```Go
func TestHammer64(t *testing.T)
```

### <a id="hammerStoreLoadInt32" href="#hammerStoreLoadInt32">func hammerStoreLoadInt32(t *testing.T, paddr unsafe.Pointer)</a>

```
searchKey: atomic_test.hammerStoreLoadInt32
```

```Go
func hammerStoreLoadInt32(t *testing.T, paddr unsafe.Pointer)
```

### <a id="hammerStoreLoadUint32" href="#hammerStoreLoadUint32">func hammerStoreLoadUint32(t *testing.T, paddr unsafe.Pointer)</a>

```
searchKey: atomic_test.hammerStoreLoadUint32
```

```Go
func hammerStoreLoadUint32(t *testing.T, paddr unsafe.Pointer)
```

### <a id="hammerStoreLoadInt64" href="#hammerStoreLoadInt64">func hammerStoreLoadInt64(t *testing.T, paddr unsafe.Pointer)</a>

```
searchKey: atomic_test.hammerStoreLoadInt64
```

```Go
func hammerStoreLoadInt64(t *testing.T, paddr unsafe.Pointer)
```

### <a id="hammerStoreLoadUint64" href="#hammerStoreLoadUint64">func hammerStoreLoadUint64(t *testing.T, paddr unsafe.Pointer)</a>

```
searchKey: atomic_test.hammerStoreLoadUint64
```

```Go
func hammerStoreLoadUint64(t *testing.T, paddr unsafe.Pointer)
```

### <a id="hammerStoreLoadUintptr" href="#hammerStoreLoadUintptr">func hammerStoreLoadUintptr(t *testing.T, paddr unsafe.Pointer)</a>

```
searchKey: atomic_test.hammerStoreLoadUintptr
```

```Go
func hammerStoreLoadUintptr(t *testing.T, paddr unsafe.Pointer)
```

### <a id="hammerStoreLoadPointer" href="#hammerStoreLoadPointer">func hammerStoreLoadPointer(t *testing.T, paddr unsafe.Pointer)</a>

```
searchKey: atomic_test.hammerStoreLoadPointer
```

```Go
func hammerStoreLoadPointer(t *testing.T, paddr unsafe.Pointer)
```

This code is just testing that LoadPointer/StorePointer operate atomically; it's not actually calculating pointers. 

### <a id="TestHammerStoreLoad" href="#TestHammerStoreLoad">func TestHammerStoreLoad(t *testing.T)</a>

```
searchKey: atomic_test.TestHammerStoreLoad
```

```Go
func TestHammerStoreLoad(t *testing.T)
```

### <a id="TestStoreLoadSeqCst32" href="#TestStoreLoadSeqCst32">func TestStoreLoadSeqCst32(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreLoadSeqCst32
```

```Go
func TestStoreLoadSeqCst32(t *testing.T)
```

### <a id="TestStoreLoadSeqCst64" href="#TestStoreLoadSeqCst64">func TestStoreLoadSeqCst64(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreLoadSeqCst64
```

```Go
func TestStoreLoadSeqCst64(t *testing.T)
```

### <a id="TestStoreLoadRelAcq32" href="#TestStoreLoadRelAcq32">func TestStoreLoadRelAcq32(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreLoadRelAcq32
```

```Go
func TestStoreLoadRelAcq32(t *testing.T)
```

### <a id="TestStoreLoadRelAcq64" href="#TestStoreLoadRelAcq64">func TestStoreLoadRelAcq64(t *testing.T)</a>

```
searchKey: atomic_test.TestStoreLoadRelAcq64
```

```Go
func TestStoreLoadRelAcq64(t *testing.T)
```

### <a id="shouldPanic" href="#shouldPanic">func shouldPanic(t *testing.T, name string, f func())</a>

```
searchKey: atomic_test.shouldPanic
```

```Go
func shouldPanic(t *testing.T, name string, f func())
```

### <a id="TestUnaligned64" href="#TestUnaligned64">func TestUnaligned64(t *testing.T)</a>

```
searchKey: atomic_test.TestUnaligned64
```

```Go
func TestUnaligned64(t *testing.T)
```

### <a id="TestNilDeref" href="#TestNilDeref">func TestNilDeref(t *testing.T)</a>

```
searchKey: atomic_test.TestNilDeref
```

```Go
func TestNilDeref(t *testing.T)
```

### <a id="loadConfig" href="#loadConfig">func loadConfig() map[string]string</a>

```
searchKey: atomic_test.loadConfig
```

```Go
func loadConfig() map[string]string
```

### <a id="requests" href="#requests">func requests() chan int</a>

```
searchKey: atomic_test.requests
```

```Go
func requests() chan int
```

### <a id="ExampleValue_config" href="#ExampleValue_config">func ExampleValue_config()</a>

```
searchKey: atomic_test.ExampleValue_config
```

```Go
func ExampleValue_config()
```

The following example shows how to use Value for periodic program config updates and propagation of the changes to worker goroutines. 

### <a id="ExampleValue_readMostly" href="#ExampleValue_readMostly">func ExampleValue_readMostly()</a>

```
searchKey: atomic_test.ExampleValue_readMostly
```

```Go
func ExampleValue_readMostly()
```

The following example shows how to maintain a scalable frequently read, but infrequently updated data structure using copy-on-write idiom. 

### <a id="TestValue" href="#TestValue">func TestValue(t *testing.T)</a>

```
searchKey: atomic_test.TestValue
```

```Go
func TestValue(t *testing.T)
```

### <a id="TestValueLarge" href="#TestValueLarge">func TestValueLarge(t *testing.T)</a>

```
searchKey: atomic_test.TestValueLarge
```

```Go
func TestValueLarge(t *testing.T)
```

### <a id="TestValuePanic" href="#TestValuePanic">func TestValuePanic(t *testing.T)</a>

```
searchKey: atomic_test.TestValuePanic
```

```Go
func TestValuePanic(t *testing.T)
```

### <a id="TestValueConcurrent" href="#TestValueConcurrent">func TestValueConcurrent(t *testing.T)</a>

```
searchKey: atomic_test.TestValueConcurrent
```

```Go
func TestValueConcurrent(t *testing.T)
```

### <a id="BenchmarkValueRead" href="#BenchmarkValueRead">func BenchmarkValueRead(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkValueRead
```

```Go
func BenchmarkValueRead(b *testing.B)
```

### <a id="TestValue_Swap" href="#TestValue_Swap">func TestValue_Swap(t *testing.T)</a>

```
searchKey: atomic_test.TestValue_Swap
```

```Go
func TestValue_Swap(t *testing.T)
```

### <a id="TestValueSwapConcurrent" href="#TestValueSwapConcurrent">func TestValueSwapConcurrent(t *testing.T)</a>

```
searchKey: atomic_test.TestValueSwapConcurrent
```

```Go
func TestValueSwapConcurrent(t *testing.T)
```

### <a id="TestValue_CompareAndSwap" href="#TestValue_CompareAndSwap">func TestValue_CompareAndSwap(t *testing.T)</a>

```
searchKey: atomic_test.TestValue_CompareAndSwap
```

```Go
func TestValue_CompareAndSwap(t *testing.T)
```

### <a id="TestValueCompareAndSwapConcurrent" href="#TestValueCompareAndSwapConcurrent">func TestValueCompareAndSwapConcurrent(t *testing.T)</a>

```
searchKey: atomic_test.TestValueCompareAndSwapConcurrent
```

```Go
func TestValueCompareAndSwapConcurrent(t *testing.T)
```

