# Package math

## Index

* [Constants](#const)
    * [const MaxUintptr](#MaxUintptr)
* [Functions](#func)
    * [func MulUintptr(a, b uintptr) (uintptr, bool)](#MulUintptr)
    * [func Mul64(x, y uint64) (hi, lo uint64)](#Mul64)


## <a id="const" href="#const">Constants</a>

### <a id="MaxUintptr" href="#MaxUintptr">const MaxUintptr</a>

```
searchKey: math.MaxUintptr
tags: [exported]
```

```Go
const MaxUintptr = ^uintptr(0)
```

## <a id="func" href="#func">Functions</a>

### <a id="MulUintptr" href="#MulUintptr">func MulUintptr(a, b uintptr) (uintptr, bool)</a>

```
searchKey: math.MulUintptr
tags: [exported]
```

```Go
func MulUintptr(a, b uintptr) (uintptr, bool)
```

MulUintptr returns a * b and whether the multiplication overflowed. On supported platforms this is an intrinsic lowered by the compiler. 

### <a id="Mul64" href="#Mul64">func Mul64(x, y uint64) (hi, lo uint64)</a>

```
searchKey: math.Mul64
tags: [exported]
```

```Go
func Mul64(x, y uint64) (hi, lo uint64)
```

Mul64 returns the 128-bit product of x and y: (hi, lo) = x * y with the product bits' upper half returned in hi and the lower half returned in lo. This is a copy from math/bits.Mul64 On supported platforms this is an intrinsic lowered by the compiler. 

