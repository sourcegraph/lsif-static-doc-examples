# Package atomic

Package atomic provides low-level atomic memory primitives useful for implementing synchronization algorithms. 

These functions require great care to be used correctly. Except for special, low-level applications, synchronization is better done with channels or the facilities of the sync package. Share memory by communicating; don't communicate by sharing memory. 

The swap operation, implemented by the SwapT functions, is the atomic equivalent of: 

```
old = *addr
*addr = new
return old

```
The compare-and-swap operation, implemented by the CompareAndSwapT functions, is the atomic equivalent of: 

```
if *addr == old {
	*addr = new
	return true
}
return false

```
The add operation, implemented by the AddT functions, is the atomic equivalent of: 

```
*addr += delta
return *addr

```
The load and store operations, implemented by the LoadT and StoreT functions, are the atomic equivalents of "return *addr" and "*addr = val". 

## Index

* [Types](#type)
    * [type Value struct](#Value)
        * [func (v *Value) Load() (val interface{})](#Value.Load)
        * [func (v *Value) Store(val interface{})](#Value.Store)
        * [func (v *Value) Swap(new interface{}) (old interface{})](#Value.Swap)
        * [func (v *Value) CompareAndSwap(old, new interface{}) (swapped bool)](#Value.CompareAndSwap)
    * [type ifaceWords struct](#ifaceWords)
* [Functions](#func)
    * [func SwapInt32(addr *int32, new int32) (old int32)](#SwapInt32)
    * [func SwapInt64(addr *int64, new int64) (old int64)](#SwapInt64)
    * [func SwapUint32(addr *uint32, new uint32) (old uint32)](#SwapUint32)
    * [func SwapUint64(addr *uint64, new uint64) (old uint64)](#SwapUint64)
    * [func SwapUintptr(addr *uintptr, new uintptr) (old uintptr)](#SwapUintptr)
    * [func SwapPointer(addr *unsafe.Pointer, new unsafe.Pointer) (old unsafe.Pointer)](#SwapPointer)
    * [func CompareAndSwapInt32(addr *int32, old, new int32) (swapped bool)](#CompareAndSwapInt32)
    * [func CompareAndSwapInt64(addr *int64, old, new int64) (swapped bool)](#CompareAndSwapInt64)
    * [func CompareAndSwapUint32(addr *uint32, old, new uint32) (swapped bool)](#CompareAndSwapUint32)
    * [func CompareAndSwapUint64(addr *uint64, old, new uint64) (swapped bool)](#CompareAndSwapUint64)
    * [func CompareAndSwapUintptr(addr *uintptr, old, new uintptr) (swapped bool)](#CompareAndSwapUintptr)
    * [func CompareAndSwapPointer(addr *unsafe.Pointer, old, new unsafe.Pointer) (swapped bool)](#CompareAndSwapPointer)
    * [func AddInt32(addr *int32, delta int32) (new int32)](#AddInt32)
    * [func AddUint32(addr *uint32, delta uint32) (new uint32)](#AddUint32)
    * [func AddInt64(addr *int64, delta int64) (new int64)](#AddInt64)
    * [func AddUint64(addr *uint64, delta uint64) (new uint64)](#AddUint64)
    * [func AddUintptr(addr *uintptr, delta uintptr) (new uintptr)](#AddUintptr)
    * [func LoadInt32(addr *int32) (val int32)](#LoadInt32)
    * [func LoadInt64(addr *int64) (val int64)](#LoadInt64)
    * [func LoadUint32(addr *uint32) (val uint32)](#LoadUint32)
    * [func LoadUint64(addr *uint64) (val uint64)](#LoadUint64)
    * [func LoadUintptr(addr *uintptr) (val uintptr)](#LoadUintptr)
    * [func LoadPointer(addr *unsafe.Pointer) (val unsafe.Pointer)](#LoadPointer)
    * [func StoreInt32(addr *int32, val int32)](#StoreInt32)
    * [func StoreInt64(addr *int64, val int64)](#StoreInt64)
    * [func StoreUint32(addr *uint32, val uint32)](#StoreUint32)
    * [func StoreUint64(addr *uint64, val uint64)](#StoreUint64)
    * [func StoreUintptr(addr *uintptr, val uintptr)](#StoreUintptr)
    * [func StorePointer(addr *unsafe.Pointer, val unsafe.Pointer)](#StorePointer)
    * [func runtime_procPin()](#runtime_procPin)
    * [func runtime_procUnpin()](#runtime_procUnpin)


## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Value" href="#Value">type Value struct</a>

```
searchKey: atomic.Value
tags: [exported]
```

```Go
type Value struct {
	v interface{}
}
```

A Value provides an atomic load and store of a consistently typed value. The zero value for a Value returns nil from Load. Once Store has been called, a Value must not be copied. 

A Value must not be copied after first use. 

#### <a id="Value.Load" href="#Value.Load">func (v *Value) Load() (val interface{})</a>

```
searchKey: atomic.Value.Load
tags: [exported]
```

```Go
func (v *Value) Load() (val interface{})
```

Load returns the value set by the most recent Store. It returns nil if there has been no call to Store for this Value. 

#### <a id="Value.Store" href="#Value.Store">func (v *Value) Store(val interface{})</a>

```
searchKey: atomic.Value.Store
tags: [exported]
```

```Go
func (v *Value) Store(val interface{})
```

Store sets the value of the Value to x. All calls to Store for a given Value must use values of the same concrete type. Store of an inconsistent type panics, as does Store(nil). 

#### <a id="Value.Swap" href="#Value.Swap">func (v *Value) Swap(new interface{}) (old interface{})</a>

```
searchKey: atomic.Value.Swap
tags: [exported]
```

```Go
func (v *Value) Swap(new interface{}) (old interface{})
```

Swap stores new into Value and returns the previous value. It returns nil if the Value is empty. 

All calls to Swap for a given Value must use values of the same concrete type. Swap of an inconsistent type panics, as does Swap(nil). 

#### <a id="Value.CompareAndSwap" href="#Value.CompareAndSwap">func (v *Value) CompareAndSwap(old, new interface{}) (swapped bool)</a>

```
searchKey: atomic.Value.CompareAndSwap
tags: [exported]
```

```Go
func (v *Value) CompareAndSwap(old, new interface{}) (swapped bool)
```

CompareAndSwapPointer executes the compare-and-swap operation for the Value. 

All calls to CompareAndSwap for a given Value must use values of the same concrete type. CompareAndSwap of an inconsistent type panics, as does CompareAndSwap(old, nil). 

### <a id="ifaceWords" href="#ifaceWords">type ifaceWords struct</a>

```
searchKey: atomic.ifaceWords
```

```Go
type ifaceWords struct {
	typ  unsafe.Pointer
	data unsafe.Pointer
}
```

ifaceWords is interface{} internal representation. 

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="SwapInt32" href="#SwapInt32">func SwapInt32(addr *int32, new int32) (old int32)</a>

```
searchKey: atomic.SwapInt32
tags: [exported]
```

```Go
func SwapInt32(addr *int32, new int32) (old int32)
```

SwapInt32 atomically stores new into *addr and returns the previous *addr value. 

### <a id="SwapInt64" href="#SwapInt64">func SwapInt64(addr *int64, new int64) (old int64)</a>

```
searchKey: atomic.SwapInt64
tags: [exported]
```

```Go
func SwapInt64(addr *int64, new int64) (old int64)
```

SwapInt64 atomically stores new into *addr and returns the previous *addr value. 

### <a id="SwapUint32" href="#SwapUint32">func SwapUint32(addr *uint32, new uint32) (old uint32)</a>

```
searchKey: atomic.SwapUint32
tags: [exported]
```

```Go
func SwapUint32(addr *uint32, new uint32) (old uint32)
```

SwapUint32 atomically stores new into *addr and returns the previous *addr value. 

### <a id="SwapUint64" href="#SwapUint64">func SwapUint64(addr *uint64, new uint64) (old uint64)</a>

```
searchKey: atomic.SwapUint64
tags: [exported]
```

```Go
func SwapUint64(addr *uint64, new uint64) (old uint64)
```

SwapUint64 atomically stores new into *addr and returns the previous *addr value. 

### <a id="SwapUintptr" href="#SwapUintptr">func SwapUintptr(addr *uintptr, new uintptr) (old uintptr)</a>

```
searchKey: atomic.SwapUintptr
tags: [exported]
```

```Go
func SwapUintptr(addr *uintptr, new uintptr) (old uintptr)
```

SwapUintptr atomically stores new into *addr and returns the previous *addr value. 

### <a id="SwapPointer" href="#SwapPointer">func SwapPointer(addr *unsafe.Pointer, new unsafe.Pointer) (old unsafe.Pointer)</a>

```
searchKey: atomic.SwapPointer
tags: [exported]
```

```Go
func SwapPointer(addr *unsafe.Pointer, new unsafe.Pointer) (old unsafe.Pointer)
```

SwapPointer atomically stores new into *addr and returns the previous *addr value. 

### <a id="CompareAndSwapInt32" href="#CompareAndSwapInt32">func CompareAndSwapInt32(addr *int32, old, new int32) (swapped bool)</a>

```
searchKey: atomic.CompareAndSwapInt32
tags: [exported]
```

```Go
func CompareAndSwapInt32(addr *int32, old, new int32) (swapped bool)
```

CompareAndSwapInt32 executes the compare-and-swap operation for an int32 value. 

### <a id="CompareAndSwapInt64" href="#CompareAndSwapInt64">func CompareAndSwapInt64(addr *int64, old, new int64) (swapped bool)</a>

```
searchKey: atomic.CompareAndSwapInt64
tags: [exported]
```

```Go
func CompareAndSwapInt64(addr *int64, old, new int64) (swapped bool)
```

CompareAndSwapInt64 executes the compare-and-swap operation for an int64 value. 

### <a id="CompareAndSwapUint32" href="#CompareAndSwapUint32">func CompareAndSwapUint32(addr *uint32, old, new uint32) (swapped bool)</a>

```
searchKey: atomic.CompareAndSwapUint32
tags: [exported]
```

```Go
func CompareAndSwapUint32(addr *uint32, old, new uint32) (swapped bool)
```

CompareAndSwapUint32 executes the compare-and-swap operation for a uint32 value. 

### <a id="CompareAndSwapUint64" href="#CompareAndSwapUint64">func CompareAndSwapUint64(addr *uint64, old, new uint64) (swapped bool)</a>

```
searchKey: atomic.CompareAndSwapUint64
tags: [exported]
```

```Go
func CompareAndSwapUint64(addr *uint64, old, new uint64) (swapped bool)
```

CompareAndSwapUint64 executes the compare-and-swap operation for a uint64 value. 

### <a id="CompareAndSwapUintptr" href="#CompareAndSwapUintptr">func CompareAndSwapUintptr(addr *uintptr, old, new uintptr) (swapped bool)</a>

```
searchKey: atomic.CompareAndSwapUintptr
tags: [exported]
```

```Go
func CompareAndSwapUintptr(addr *uintptr, old, new uintptr) (swapped bool)
```

CompareAndSwapUintptr executes the compare-and-swap operation for a uintptr value. 

### <a id="CompareAndSwapPointer" href="#CompareAndSwapPointer">func CompareAndSwapPointer(addr *unsafe.Pointer, old, new unsafe.Pointer) (swapped bool)</a>

```
searchKey: atomic.CompareAndSwapPointer
tags: [exported]
```

```Go
func CompareAndSwapPointer(addr *unsafe.Pointer, old, new unsafe.Pointer) (swapped bool)
```

CompareAndSwapPointer executes the compare-and-swap operation for a unsafe.Pointer value. 

### <a id="AddInt32" href="#AddInt32">func AddInt32(addr *int32, delta int32) (new int32)</a>

```
searchKey: atomic.AddInt32
tags: [exported]
```

```Go
func AddInt32(addr *int32, delta int32) (new int32)
```

AddInt32 atomically adds delta to *addr and returns the new value. 

### <a id="AddUint32" href="#AddUint32">func AddUint32(addr *uint32, delta uint32) (new uint32)</a>

```
searchKey: atomic.AddUint32
tags: [exported]
```

```Go
func AddUint32(addr *uint32, delta uint32) (new uint32)
```

AddUint32 atomically adds delta to *addr and returns the new value. To subtract a signed positive constant value c from x, do AddUint32(&x, ^uint32(c-1)). In particular, to decrement x, do AddUint32(&x, ^uint32(0)). 

### <a id="AddInt64" href="#AddInt64">func AddInt64(addr *int64, delta int64) (new int64)</a>

```
searchKey: atomic.AddInt64
tags: [exported]
```

```Go
func AddInt64(addr *int64, delta int64) (new int64)
```

AddInt64 atomically adds delta to *addr and returns the new value. 

### <a id="AddUint64" href="#AddUint64">func AddUint64(addr *uint64, delta uint64) (new uint64)</a>

```
searchKey: atomic.AddUint64
tags: [exported]
```

```Go
func AddUint64(addr *uint64, delta uint64) (new uint64)
```

AddUint64 atomically adds delta to *addr and returns the new value. To subtract a signed positive constant value c from x, do AddUint64(&x, ^uint64(c-1)). In particular, to decrement x, do AddUint64(&x, ^uint64(0)). 

### <a id="AddUintptr" href="#AddUintptr">func AddUintptr(addr *uintptr, delta uintptr) (new uintptr)</a>

```
searchKey: atomic.AddUintptr
tags: [exported]
```

```Go
func AddUintptr(addr *uintptr, delta uintptr) (new uintptr)
```

AddUintptr atomically adds delta to *addr and returns the new value. 

### <a id="LoadInt32" href="#LoadInt32">func LoadInt32(addr *int32) (val int32)</a>

```
searchKey: atomic.LoadInt32
tags: [exported]
```

```Go
func LoadInt32(addr *int32) (val int32)
```

LoadInt32 atomically loads *addr. 

### <a id="LoadInt64" href="#LoadInt64">func LoadInt64(addr *int64) (val int64)</a>

```
searchKey: atomic.LoadInt64
tags: [exported]
```

```Go
func LoadInt64(addr *int64) (val int64)
```

LoadInt64 atomically loads *addr. 

### <a id="LoadUint32" href="#LoadUint32">func LoadUint32(addr *uint32) (val uint32)</a>

```
searchKey: atomic.LoadUint32
tags: [exported]
```

```Go
func LoadUint32(addr *uint32) (val uint32)
```

LoadUint32 atomically loads *addr. 

### <a id="LoadUint64" href="#LoadUint64">func LoadUint64(addr *uint64) (val uint64)</a>

```
searchKey: atomic.LoadUint64
tags: [exported]
```

```Go
func LoadUint64(addr *uint64) (val uint64)
```

LoadUint64 atomically loads *addr. 

### <a id="LoadUintptr" href="#LoadUintptr">func LoadUintptr(addr *uintptr) (val uintptr)</a>

```
searchKey: atomic.LoadUintptr
tags: [exported]
```

```Go
func LoadUintptr(addr *uintptr) (val uintptr)
```

LoadUintptr atomically loads *addr. 

### <a id="LoadPointer" href="#LoadPointer">func LoadPointer(addr *unsafe.Pointer) (val unsafe.Pointer)</a>

```
searchKey: atomic.LoadPointer
tags: [exported]
```

```Go
func LoadPointer(addr *unsafe.Pointer) (val unsafe.Pointer)
```

LoadPointer atomically loads *addr. 

### <a id="StoreInt32" href="#StoreInt32">func StoreInt32(addr *int32, val int32)</a>

```
searchKey: atomic.StoreInt32
tags: [exported]
```

```Go
func StoreInt32(addr *int32, val int32)
```

StoreInt32 atomically stores val into *addr. 

### <a id="StoreInt64" href="#StoreInt64">func StoreInt64(addr *int64, val int64)</a>

```
searchKey: atomic.StoreInt64
tags: [exported]
```

```Go
func StoreInt64(addr *int64, val int64)
```

StoreInt64 atomically stores val into *addr. 

### <a id="StoreUint32" href="#StoreUint32">func StoreUint32(addr *uint32, val uint32)</a>

```
searchKey: atomic.StoreUint32
tags: [exported]
```

```Go
func StoreUint32(addr *uint32, val uint32)
```

StoreUint32 atomically stores val into *addr. 

### <a id="StoreUint64" href="#StoreUint64">func StoreUint64(addr *uint64, val uint64)</a>

```
searchKey: atomic.StoreUint64
tags: [exported]
```

```Go
func StoreUint64(addr *uint64, val uint64)
```

StoreUint64 atomically stores val into *addr. 

### <a id="StoreUintptr" href="#StoreUintptr">func StoreUintptr(addr *uintptr, val uintptr)</a>

```
searchKey: atomic.StoreUintptr
tags: [exported]
```

```Go
func StoreUintptr(addr *uintptr, val uintptr)
```

StoreUintptr atomically stores val into *addr. 

### <a id="StorePointer" href="#StorePointer">func StorePointer(addr *unsafe.Pointer, val unsafe.Pointer)</a>

```
searchKey: atomic.StorePointer
tags: [exported]
```

```Go
func StorePointer(addr *unsafe.Pointer, val unsafe.Pointer)
```

StorePointer atomically stores val into *addr. 

### <a id="runtime_procPin" href="#runtime_procPin">func runtime_procPin()</a>

```
searchKey: atomic.runtime_procPin
```

```Go
func runtime_procPin()
```

Disable/enable preemption, implemented in runtime. 

### <a id="runtime_procUnpin" href="#runtime_procUnpin">func runtime_procUnpin()</a>

```
searchKey: atomic.runtime_procUnpin
```

```Go
func runtime_procUnpin()
```

