# Package atomic

## Index

* [Functions](#func)
    * [func Load(ptr *uint32) uint32](#Load)
    * [func Loadp(ptr unsafe.Pointer) unsafe.Pointer](#Loadp)
    * [func Load64(ptr *uint64) uint64](#Load64)
    * [func LoadAcq(ptr *uint32) uint32](#LoadAcq)
    * [func LoadAcq64(ptr *uint64) uint64](#LoadAcq64)
    * [func LoadAcquintptr(ptr *uintptr) uintptr](#LoadAcquintptr)
    * [func Xadd(ptr *uint32, delta int32) uint32](#Xadd)
    * [func Xadd64(ptr *uint64, delta int64) uint64](#Xadd64)
    * [func Xadduintptr(ptr *uintptr, delta uintptr) uintptr](#Xadduintptr)
    * [func Xchg(ptr *uint32, new uint32) uint32](#Xchg)
    * [func Xchg64(ptr *uint64, new uint64) uint64](#Xchg64)
    * [func Xchguintptr(ptr *uintptr, new uintptr) uintptr](#Xchguintptr)
    * [func Load8(ptr *uint8) uint8](#Load8)
    * [func And8(ptr *uint8, val uint8)](#And8)
    * [func Or8(ptr *uint8, val uint8)](#Or8)
    * [func And(ptr *uint32, val uint32)](#And)
    * [func Or(ptr *uint32, val uint32)](#Or)
    * [func Cas64(ptr *uint64, old, new uint64) bool](#Cas64)
    * [func CasRel(ptr *uint32, old, new uint32) bool](#CasRel)
    * [func Store(ptr *uint32, val uint32)](#Store)
    * [func Store8(ptr *uint8, val uint8)](#Store8)
    * [func Store64(ptr *uint64, val uint64)](#Store64)
    * [func StoreRel(ptr *uint32, val uint32)](#StoreRel)
    * [func StoreRel64(ptr *uint64, val uint64)](#StoreRel64)
    * [func StoreReluintptr(ptr *uintptr, val uintptr)](#StoreReluintptr)
    * [func StorepNoWB(ptr unsafe.Pointer, val unsafe.Pointer)](#StorepNoWB)
    * [func Cas(ptr *uint32, old, new uint32) bool](#Cas)
    * [func Casp1(ptr *unsafe.Pointer, old, new unsafe.Pointer) bool](#Casp1)
    * [func Casint32(ptr *int32, old, new int32) bool](#Casint32)
    * [func Casint64(ptr *int64, old, new int64) bool](#Casint64)
    * [func Casuintptr(ptr *uintptr, old, new uintptr) bool](#Casuintptr)
    * [func Storeint32(ptr *int32, new int32)](#Storeint32)
    * [func Storeint64(ptr *int64, new int64)](#Storeint64)
    * [func Storeuintptr(ptr *uintptr, new uintptr)](#Storeuintptr)
    * [func Loaduintptr(ptr *uintptr) uintptr](#Loaduintptr)
    * [func Loaduint(ptr *uint) uint](#Loaduint)
    * [func Loadint32(ptr *int32) int32](#Loadint32)
    * [func Loadint64(ptr *int64) int64](#Loadint64)
    * [func Xaddint32(ptr *int32, delta int32) int32](#Xaddint32)
    * [func Xaddint64(ptr *int64, delta int64) int64](#Xaddint64)
    * [func Xchgint32(ptr *int32, new int32) int32](#Xchgint32)
    * [func Xchgint64(ptr *int64, new int64) int64](#Xchgint64)
    * [func panicUnaligned()](#panicUnaligned)


## <a id="func" href="#func">Functions</a>

### <a id="Load" href="#Load">func Load(ptr *uint32) uint32</a>

```
searchKey: atomic.Load
tags: [exported]
```

```Go
func Load(ptr *uint32) uint32
```

### <a id="Loadp" href="#Loadp">func Loadp(ptr unsafe.Pointer) unsafe.Pointer</a>

```
searchKey: atomic.Loadp
tags: [exported]
```

```Go
func Loadp(ptr unsafe.Pointer) unsafe.Pointer
```

### <a id="Load64" href="#Load64">func Load64(ptr *uint64) uint64</a>

```
searchKey: atomic.Load64
tags: [exported]
```

```Go
func Load64(ptr *uint64) uint64
```

### <a id="LoadAcq" href="#LoadAcq">func LoadAcq(ptr *uint32) uint32</a>

```
searchKey: atomic.LoadAcq
tags: [exported]
```

```Go
func LoadAcq(ptr *uint32) uint32
```

### <a id="LoadAcq64" href="#LoadAcq64">func LoadAcq64(ptr *uint64) uint64</a>

```
searchKey: atomic.LoadAcq64
tags: [exported]
```

```Go
func LoadAcq64(ptr *uint64) uint64
```

### <a id="LoadAcquintptr" href="#LoadAcquintptr">func LoadAcquintptr(ptr *uintptr) uintptr</a>

```
searchKey: atomic.LoadAcquintptr
tags: [exported]
```

```Go
func LoadAcquintptr(ptr *uintptr) uintptr
```

### <a id="Xadd" href="#Xadd">func Xadd(ptr *uint32, delta int32) uint32</a>

```
searchKey: atomic.Xadd
tags: [exported]
```

```Go
func Xadd(ptr *uint32, delta int32) uint32
```

### <a id="Xadd64" href="#Xadd64">func Xadd64(ptr *uint64, delta int64) uint64</a>

```
searchKey: atomic.Xadd64
tags: [exported]
```

```Go
func Xadd64(ptr *uint64, delta int64) uint64
```

### <a id="Xadduintptr" href="#Xadduintptr">func Xadduintptr(ptr *uintptr, delta uintptr) uintptr</a>

```
searchKey: atomic.Xadduintptr
tags: [exported]
```

```Go
func Xadduintptr(ptr *uintptr, delta uintptr) uintptr
```

### <a id="Xchg" href="#Xchg">func Xchg(ptr *uint32, new uint32) uint32</a>

```
searchKey: atomic.Xchg
tags: [exported]
```

```Go
func Xchg(ptr *uint32, new uint32) uint32
```

### <a id="Xchg64" href="#Xchg64">func Xchg64(ptr *uint64, new uint64) uint64</a>

```
searchKey: atomic.Xchg64
tags: [exported]
```

```Go
func Xchg64(ptr *uint64, new uint64) uint64
```

### <a id="Xchguintptr" href="#Xchguintptr">func Xchguintptr(ptr *uintptr, new uintptr) uintptr</a>

```
searchKey: atomic.Xchguintptr
tags: [exported]
```

```Go
func Xchguintptr(ptr *uintptr, new uintptr) uintptr
```

### <a id="Load8" href="#Load8">func Load8(ptr *uint8) uint8</a>

```
searchKey: atomic.Load8
tags: [exported]
```

```Go
func Load8(ptr *uint8) uint8
```

### <a id="And8" href="#And8">func And8(ptr *uint8, val uint8)</a>

```
searchKey: atomic.And8
tags: [exported]
```

```Go
func And8(ptr *uint8, val uint8)
```

### <a id="Or8" href="#Or8">func Or8(ptr *uint8, val uint8)</a>

```
searchKey: atomic.Or8
tags: [exported]
```

```Go
func Or8(ptr *uint8, val uint8)
```

### <a id="And" href="#And">func And(ptr *uint32, val uint32)</a>

```
searchKey: atomic.And
tags: [exported]
```

```Go
func And(ptr *uint32, val uint32)
```

### <a id="Or" href="#Or">func Or(ptr *uint32, val uint32)</a>

```
searchKey: atomic.Or
tags: [exported]
```

```Go
func Or(ptr *uint32, val uint32)
```

### <a id="Cas64" href="#Cas64">func Cas64(ptr *uint64, old, new uint64) bool</a>

```
searchKey: atomic.Cas64
tags: [exported]
```

```Go
func Cas64(ptr *uint64, old, new uint64) bool
```

### <a id="CasRel" href="#CasRel">func CasRel(ptr *uint32, old, new uint32) bool</a>

```
searchKey: atomic.CasRel
tags: [exported]
```

```Go
func CasRel(ptr *uint32, old, new uint32) bool
```

### <a id="Store" href="#Store">func Store(ptr *uint32, val uint32)</a>

```
searchKey: atomic.Store
tags: [exported]
```

```Go
func Store(ptr *uint32, val uint32)
```

### <a id="Store8" href="#Store8">func Store8(ptr *uint8, val uint8)</a>

```
searchKey: atomic.Store8
tags: [exported]
```

```Go
func Store8(ptr *uint8, val uint8)
```

### <a id="Store64" href="#Store64">func Store64(ptr *uint64, val uint64)</a>

```
searchKey: atomic.Store64
tags: [exported]
```

```Go
func Store64(ptr *uint64, val uint64)
```

### <a id="StoreRel" href="#StoreRel">func StoreRel(ptr *uint32, val uint32)</a>

```
searchKey: atomic.StoreRel
tags: [exported]
```

```Go
func StoreRel(ptr *uint32, val uint32)
```

### <a id="StoreRel64" href="#StoreRel64">func StoreRel64(ptr *uint64, val uint64)</a>

```
searchKey: atomic.StoreRel64
tags: [exported]
```

```Go
func StoreRel64(ptr *uint64, val uint64)
```

### <a id="StoreReluintptr" href="#StoreReluintptr">func StoreReluintptr(ptr *uintptr, val uintptr)</a>

```
searchKey: atomic.StoreReluintptr
tags: [exported]
```

```Go
func StoreReluintptr(ptr *uintptr, val uintptr)
```

### <a id="StorepNoWB" href="#StorepNoWB">func StorepNoWB(ptr unsafe.Pointer, val unsafe.Pointer)</a>

```
searchKey: atomic.StorepNoWB
tags: [exported]
```

```Go
func StorepNoWB(ptr unsafe.Pointer, val unsafe.Pointer)
```

StorepNoWB performs *ptr = val atomically and without a write barrier. 

NO go:noescape annotation; see atomic_pointer.go. 

### <a id="Cas" href="#Cas">func Cas(ptr *uint32, old, new uint32) bool</a>

```
searchKey: atomic.Cas
tags: [exported]
```

```Go
func Cas(ptr *uint32, old, new uint32) bool
```

### <a id="Casp1" href="#Casp1">func Casp1(ptr *unsafe.Pointer, old, new unsafe.Pointer) bool</a>

```
searchKey: atomic.Casp1
tags: [exported]
```

```Go
func Casp1(ptr *unsafe.Pointer, old, new unsafe.Pointer) bool
```

NO go:noescape annotation; see atomic_pointer.go. 

### <a id="Casint32" href="#Casint32">func Casint32(ptr *int32, old, new int32) bool</a>

```
searchKey: atomic.Casint32
tags: [exported]
```

```Go
func Casint32(ptr *int32, old, new int32) bool
```

### <a id="Casint64" href="#Casint64">func Casint64(ptr *int64, old, new int64) bool</a>

```
searchKey: atomic.Casint64
tags: [exported]
```

```Go
func Casint64(ptr *int64, old, new int64) bool
```

### <a id="Casuintptr" href="#Casuintptr">func Casuintptr(ptr *uintptr, old, new uintptr) bool</a>

```
searchKey: atomic.Casuintptr
tags: [exported]
```

```Go
func Casuintptr(ptr *uintptr, old, new uintptr) bool
```

### <a id="Storeint32" href="#Storeint32">func Storeint32(ptr *int32, new int32)</a>

```
searchKey: atomic.Storeint32
tags: [exported]
```

```Go
func Storeint32(ptr *int32, new int32)
```

### <a id="Storeint64" href="#Storeint64">func Storeint64(ptr *int64, new int64)</a>

```
searchKey: atomic.Storeint64
tags: [exported]
```

```Go
func Storeint64(ptr *int64, new int64)
```

### <a id="Storeuintptr" href="#Storeuintptr">func Storeuintptr(ptr *uintptr, new uintptr)</a>

```
searchKey: atomic.Storeuintptr
tags: [exported]
```

```Go
func Storeuintptr(ptr *uintptr, new uintptr)
```

### <a id="Loaduintptr" href="#Loaduintptr">func Loaduintptr(ptr *uintptr) uintptr</a>

```
searchKey: atomic.Loaduintptr
tags: [exported]
```

```Go
func Loaduintptr(ptr *uintptr) uintptr
```

### <a id="Loaduint" href="#Loaduint">func Loaduint(ptr *uint) uint</a>

```
searchKey: atomic.Loaduint
tags: [exported]
```

```Go
func Loaduint(ptr *uint) uint
```

### <a id="Loadint32" href="#Loadint32">func Loadint32(ptr *int32) int32</a>

```
searchKey: atomic.Loadint32
tags: [exported]
```

```Go
func Loadint32(ptr *int32) int32
```

### <a id="Loadint64" href="#Loadint64">func Loadint64(ptr *int64) int64</a>

```
searchKey: atomic.Loadint64
tags: [exported]
```

```Go
func Loadint64(ptr *int64) int64
```

### <a id="Xaddint32" href="#Xaddint32">func Xaddint32(ptr *int32, delta int32) int32</a>

```
searchKey: atomic.Xaddint32
tags: [exported]
```

```Go
func Xaddint32(ptr *int32, delta int32) int32
```

### <a id="Xaddint64" href="#Xaddint64">func Xaddint64(ptr *int64, delta int64) int64</a>

```
searchKey: atomic.Xaddint64
tags: [exported]
```

```Go
func Xaddint64(ptr *int64, delta int64) int64
```

### <a id="Xchgint32" href="#Xchgint32">func Xchgint32(ptr *int32, new int32) int32</a>

```
searchKey: atomic.Xchgint32
tags: [exported]
```

```Go
func Xchgint32(ptr *int32, new int32) int32
```

### <a id="Xchgint64" href="#Xchgint64">func Xchgint64(ptr *int64, new int64) int64</a>

```
searchKey: atomic.Xchgint64
tags: [exported]
```

```Go
func Xchgint64(ptr *int64, new int64) int64
```

### <a id="panicUnaligned" href="#panicUnaligned">func panicUnaligned()</a>

```
searchKey: atomic.panicUnaligned
```

```Go
func panicUnaligned()
```

