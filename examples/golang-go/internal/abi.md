# Package abi

## Index

* [Constants](#const)
    * [const EffectiveFloatRegSize](#EffectiveFloatRegSize)
    * [const FloatArgRegs](#FloatArgRegs)
    * [const IntArgRegs](#IntArgRegs)
* [Variables](#var)
    * [var FuncPCTestFnAddr](#FuncPCTestFnAddr)
* [Types](#type)
    * [type IntArgRegBitmap [0]uint8](#IntArgRegBitmap)
        * [func (b *IntArgRegBitmap) Get(i int) bool](#IntArgRegBitmap.Get)
        * [func (b *IntArgRegBitmap) Set(i int)](#IntArgRegBitmap.Set)
    * [type RegArgs struct](#RegArgs)
* [Functions](#func)
    * [func FuncPCABI0(f interface{}) uintptr](#FuncPCABI0)
    * [func FuncPCABIInternal(f interface{}) uintptr](#FuncPCABIInternal)
    * [func FuncPCTest() uintptr](#FuncPCTest)
    * [func FuncPCTestFn()](#FuncPCTestFn)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="EffectiveFloatRegSize" href="#EffectiveFloatRegSize">const EffectiveFloatRegSize</a>

```
searchKey: abi.EffectiveFloatRegSize
tags: [constant number]
```

```Go
const EffectiveFloatRegSize = 0
```

EffectiveFloatRegSize describes the width of floating point registers on the current platform from the ABI's perspective. 

Since Go only supports 32-bit and 64-bit floating point primitives, this number should be either 0, 4, or 8. 0 indicates no floating point registers for the ABI or that floating point values will be passed via the softfloat ABI. 

For platforms that support larger floating point register widths, such as x87's 80-bit "registers" (not that we support x87 currently), use 8. 

### <a id="FloatArgRegs" href="#FloatArgRegs">const FloatArgRegs</a>

```
searchKey: abi.FloatArgRegs
tags: [constant number]
```

```Go
const FloatArgRegs = 0
```

FloatArgRegs is the number of registers dedicated to passing floating-point argument values. Result registers are identical to argument registers, so this number is used for those too. 

### <a id="IntArgRegs" href="#IntArgRegs">const IntArgRegs</a>

```
searchKey: abi.IntArgRegs
tags: [constant number]
```

```Go
const IntArgRegs = 0
```

IntArgRegs is the number of registers dedicated to passing integer argument values. Result registers are identical to argument registers, so this number is used for those too. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="FuncPCTestFnAddr" href="#FuncPCTestFnAddr">var FuncPCTestFnAddr</a>

```
searchKey: abi.FuncPCTestFnAddr
tags: [variable number private]
```

```Go
var FuncPCTestFnAddr uintptr // address of FuncPCTestFn, directly retrieved from assembly

```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="IntArgRegBitmap" href="#IntArgRegBitmap">type IntArgRegBitmap [0]uint8</a>

```
searchKey: abi.IntArgRegBitmap
tags: [array number]
```

```Go
type IntArgRegBitmap [(IntArgRegs + 7) / 8]uint8
```

IntArgRegBitmap is a bitmap large enough to hold one bit per integer argument/return register. 

#### <a id="IntArgRegBitmap.Get" href="#IntArgRegBitmap.Get">func (b *IntArgRegBitmap) Get(i int) bool</a>

```
searchKey: abi.IntArgRegBitmap.Get
tags: [method]
```

```Go
func (b *IntArgRegBitmap) Get(i int) bool
```

Get returns whether the i'th bit of the bitmap is set. 

nosplit because it's called in extremely sensitive contexts, like on the reflectcall return path. 

#### <a id="IntArgRegBitmap.Set" href="#IntArgRegBitmap.Set">func (b *IntArgRegBitmap) Set(i int)</a>

```
searchKey: abi.IntArgRegBitmap.Set
tags: [method]
```

```Go
func (b *IntArgRegBitmap) Set(i int)
```

Set sets the i'th bit of the bitmap to 1. 

### <a id="RegArgs" href="#RegArgs">type RegArgs struct</a>

```
searchKey: abi.RegArgs
tags: [struct]
```

```Go
type RegArgs struct {
	Ints   [IntArgRegs]uintptr  // untyped integer registers
	Floats [FloatArgRegs]uint64 // untyped float registers

	// Ptrs is a space that duplicates Ints but with pointer type,
	// used to make pointers passed or returned  in registers
	// visible to the GC by making the type unsafe.Pointer.
	Ptrs [IntArgRegs]unsafe.Pointer

	// ReturnIsPtr is a bitmap that indicates which registers
	// contain or will contain pointers on the return path from
	// a reflectcall. The i'th bit indicates whether the i'th
	// register contains or will contain a valid Go pointer.
	ReturnIsPtr IntArgRegBitmap
}
```

RegArgs is a struct that has space for each argument and return value register on the current architecture. 

Assembly code knows the layout of the first two fields of RegArgs. 

RegArgs also contains additional space to hold pointers when it may not be safe to keep them only in the integer register space otherwise. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="FuncPCABI0" href="#FuncPCABI0">func FuncPCABI0(f interface{}) uintptr</a>

```
searchKey: abi.FuncPCABI0
tags: [function]
```

```Go
func FuncPCABI0(f interface{}) uintptr
```

FuncPCABI0 returns the entry PC of the function f, which must be a direct reference of a function defined as ABI0. Otherwise it is a compile-time error. 

Implemented as a compile intrinsic. 

### <a id="FuncPCABIInternal" href="#FuncPCABIInternal">func FuncPCABIInternal(f interface{}) uintptr</a>

```
searchKey: abi.FuncPCABIInternal
tags: [function]
```

```Go
func FuncPCABIInternal(f interface{}) uintptr
```

FuncPCABIInternal returns the entry PC of the function f. If f is a direct reference of a function, it must be defined as ABIInternal. Otherwise it is a compile-time error. If f is not a direct reference of a defined function, it assumes that f is a func value. Otherwise the behavior is undefined. 

Implemented as a compile intrinsic. 

### <a id="FuncPCTest" href="#FuncPCTest">func FuncPCTest() uintptr</a>

```
searchKey: abi.FuncPCTest
tags: [function private]
```

```Go
func FuncPCTest() uintptr
```

### <a id="FuncPCTestFn" href="#FuncPCTestFn">func FuncPCTestFn()</a>

```
searchKey: abi.FuncPCTestFn
tags: [function private]
```

```Go
func FuncPCTestFn()
```

