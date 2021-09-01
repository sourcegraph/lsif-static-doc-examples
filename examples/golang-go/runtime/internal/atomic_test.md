# Package atomic_test

## Index

* [Variables](#var)
    * [var sink](#sink)
* [Functions](#func)
    * [func BenchmarkAnd(b *testing.B)](#BenchmarkAnd)
    * [func BenchmarkAnd8(b *testing.B)](#BenchmarkAnd8)
    * [func BenchmarkAnd8Parallel(b *testing.B)](#BenchmarkAnd8Parallel)
    * [func BenchmarkAndParallel(b *testing.B)](#BenchmarkAndParallel)
    * [func BenchmarkAtomicLoad(b *testing.B)](#BenchmarkAtomicLoad)
    * [func BenchmarkAtomicLoad64(b *testing.B)](#BenchmarkAtomicLoad64)
    * [func BenchmarkAtomicStore(b *testing.B)](#BenchmarkAtomicStore)
    * [func BenchmarkAtomicStore64(b *testing.B)](#BenchmarkAtomicStore64)
    * [func BenchmarkCas(b *testing.B)](#BenchmarkCas)
    * [func BenchmarkCas64(b *testing.B)](#BenchmarkCas64)
    * [func BenchmarkOr(b *testing.B)](#BenchmarkOr)
    * [func BenchmarkOr8(b *testing.B)](#BenchmarkOr8)
    * [func BenchmarkOr8Parallel(b *testing.B)](#BenchmarkOr8Parallel)
    * [func BenchmarkOrParallel(b *testing.B)](#BenchmarkOrParallel)
    * [func BenchmarkXadd(b *testing.B)](#BenchmarkXadd)
    * [func BenchmarkXadd64(b *testing.B)](#BenchmarkXadd64)
    * [func BenchmarkXchg(b *testing.B)](#BenchmarkXchg)
    * [func BenchmarkXchg64(b *testing.B)](#BenchmarkXchg64)
    * [func TestAnd(t *testing.T)](#TestAnd)
    * [func TestAnd8(t *testing.T)](#TestAnd8)
    * [func TestBitwiseContended(t *testing.T)](#TestBitwiseContended)
    * [func TestBitwiseContended8(t *testing.T)](#TestBitwiseContended8)
    * [func TestOr(t *testing.T)](#TestOr)
    * [func TestOr8(t *testing.T)](#TestOr8)
    * [func TestStorepNoWB(t *testing.T)](#TestStorepNoWB)
    * [func TestUnaligned64(t *testing.T)](#TestUnaligned64)
    * [func TestXadduintptr(t *testing.T)](#TestXadduintptr)
    * [func TestXadduintptrOnUint64(t *testing.T)](#TestXadduintptrOnUint64)
    * [func runParallel(N, iter int, f func())](#runParallel)
    * [func shouldPanic(t *testing.T, name string, f func())](#shouldPanic)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="sink" href="#sink">var sink</a>

```
searchKey: atomic_test.sink
tags: [variable interface private]
```

```Go
var sink interface{}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="BenchmarkAnd" href="#BenchmarkAnd">func BenchmarkAnd(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkAnd
tags: [function private benchmark]
```

```Go
func BenchmarkAnd(b *testing.B)
```

### <a id="BenchmarkAnd8" href="#BenchmarkAnd8">func BenchmarkAnd8(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkAnd8
tags: [function private benchmark]
```

```Go
func BenchmarkAnd8(b *testing.B)
```

### <a id="BenchmarkAnd8Parallel" href="#BenchmarkAnd8Parallel">func BenchmarkAnd8Parallel(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkAnd8Parallel
tags: [function private benchmark]
```

```Go
func BenchmarkAnd8Parallel(b *testing.B)
```

### <a id="BenchmarkAndParallel" href="#BenchmarkAndParallel">func BenchmarkAndParallel(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkAndParallel
tags: [function private benchmark]
```

```Go
func BenchmarkAndParallel(b *testing.B)
```

### <a id="BenchmarkAtomicLoad" href="#BenchmarkAtomicLoad">func BenchmarkAtomicLoad(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkAtomicLoad
tags: [function private benchmark]
```

```Go
func BenchmarkAtomicLoad(b *testing.B)
```

### <a id="BenchmarkAtomicLoad64" href="#BenchmarkAtomicLoad64">func BenchmarkAtomicLoad64(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkAtomicLoad64
tags: [function private benchmark]
```

```Go
func BenchmarkAtomicLoad64(b *testing.B)
```

### <a id="BenchmarkAtomicStore" href="#BenchmarkAtomicStore">func BenchmarkAtomicStore(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkAtomicStore
tags: [function private benchmark]
```

```Go
func BenchmarkAtomicStore(b *testing.B)
```

### <a id="BenchmarkAtomicStore64" href="#BenchmarkAtomicStore64">func BenchmarkAtomicStore64(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkAtomicStore64
tags: [function private benchmark]
```

```Go
func BenchmarkAtomicStore64(b *testing.B)
```

### <a id="BenchmarkCas" href="#BenchmarkCas">func BenchmarkCas(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkCas
tags: [function private benchmark]
```

```Go
func BenchmarkCas(b *testing.B)
```

### <a id="BenchmarkCas64" href="#BenchmarkCas64">func BenchmarkCas64(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkCas64
tags: [function private benchmark]
```

```Go
func BenchmarkCas64(b *testing.B)
```

### <a id="BenchmarkOr" href="#BenchmarkOr">func BenchmarkOr(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkOr
tags: [function private benchmark]
```

```Go
func BenchmarkOr(b *testing.B)
```

### <a id="BenchmarkOr8" href="#BenchmarkOr8">func BenchmarkOr8(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkOr8
tags: [function private benchmark]
```

```Go
func BenchmarkOr8(b *testing.B)
```

### <a id="BenchmarkOr8Parallel" href="#BenchmarkOr8Parallel">func BenchmarkOr8Parallel(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkOr8Parallel
tags: [function private benchmark]
```

```Go
func BenchmarkOr8Parallel(b *testing.B)
```

### <a id="BenchmarkOrParallel" href="#BenchmarkOrParallel">func BenchmarkOrParallel(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkOrParallel
tags: [function private benchmark]
```

```Go
func BenchmarkOrParallel(b *testing.B)
```

### <a id="BenchmarkXadd" href="#BenchmarkXadd">func BenchmarkXadd(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkXadd
tags: [function private benchmark]
```

```Go
func BenchmarkXadd(b *testing.B)
```

### <a id="BenchmarkXadd64" href="#BenchmarkXadd64">func BenchmarkXadd64(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkXadd64
tags: [function private benchmark]
```

```Go
func BenchmarkXadd64(b *testing.B)
```

### <a id="BenchmarkXchg" href="#BenchmarkXchg">func BenchmarkXchg(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkXchg
tags: [function private benchmark]
```

```Go
func BenchmarkXchg(b *testing.B)
```

### <a id="BenchmarkXchg64" href="#BenchmarkXchg64">func BenchmarkXchg64(b *testing.B)</a>

```
searchKey: atomic_test.BenchmarkXchg64
tags: [function private benchmark]
```

```Go
func BenchmarkXchg64(b *testing.B)
```

### <a id="TestAnd" href="#TestAnd">func TestAnd(t *testing.T)</a>

```
searchKey: atomic_test.TestAnd
tags: [function private test]
```

```Go
func TestAnd(t *testing.T)
```

### <a id="TestAnd8" href="#TestAnd8">func TestAnd8(t *testing.T)</a>

```
searchKey: atomic_test.TestAnd8
tags: [function private test]
```

```Go
func TestAnd8(t *testing.T)
```

### <a id="TestBitwiseContended" href="#TestBitwiseContended">func TestBitwiseContended(t *testing.T)</a>

```
searchKey: atomic_test.TestBitwiseContended
tags: [function private test]
```

```Go
func TestBitwiseContended(t *testing.T)
```

### <a id="TestBitwiseContended8" href="#TestBitwiseContended8">func TestBitwiseContended8(t *testing.T)</a>

```
searchKey: atomic_test.TestBitwiseContended8
tags: [function private test]
```

```Go
func TestBitwiseContended8(t *testing.T)
```

### <a id="TestOr" href="#TestOr">func TestOr(t *testing.T)</a>

```
searchKey: atomic_test.TestOr
tags: [function private test]
```

```Go
func TestOr(t *testing.T)
```

### <a id="TestOr8" href="#TestOr8">func TestOr8(t *testing.T)</a>

```
searchKey: atomic_test.TestOr8
tags: [function private test]
```

```Go
func TestOr8(t *testing.T)
```

### <a id="TestStorepNoWB" href="#TestStorepNoWB">func TestStorepNoWB(t *testing.T)</a>

```
searchKey: atomic_test.TestStorepNoWB
tags: [function private test]
```

```Go
func TestStorepNoWB(t *testing.T)
```

### <a id="TestUnaligned64" href="#TestUnaligned64">func TestUnaligned64(t *testing.T)</a>

```
searchKey: atomic_test.TestUnaligned64
tags: [function private test]
```

```Go
func TestUnaligned64(t *testing.T)
```

Variant of sync/atomic's TestUnaligned64: 

### <a id="TestXadduintptr" href="#TestXadduintptr">func TestXadduintptr(t *testing.T)</a>

```
searchKey: atomic_test.TestXadduintptr
tags: [function private test]
```

```Go
func TestXadduintptr(t *testing.T)
```

### <a id="TestXadduintptrOnUint64" href="#TestXadduintptrOnUint64">func TestXadduintptrOnUint64(t *testing.T)</a>

```
searchKey: atomic_test.TestXadduintptrOnUint64
tags: [function private test]
```

```Go
func TestXadduintptrOnUint64(t *testing.T)
```

Tests that xadduintptr correctly updates 64-bit values. The place where we actually do so is mstats.go, functions mSysStat{Inc,Dec}. 

### <a id="runParallel" href="#runParallel">func runParallel(N, iter int, f func())</a>

```
searchKey: atomic_test.runParallel
tags: [function private]
```

```Go
func runParallel(N, iter int, f func())
```

### <a id="shouldPanic" href="#shouldPanic">func shouldPanic(t *testing.T, name string, f func())</a>

```
searchKey: atomic_test.shouldPanic
tags: [function private]
```

```Go
func shouldPanic(t *testing.T, name string, f func())
```

