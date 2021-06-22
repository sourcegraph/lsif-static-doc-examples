# Package bits

Package bits implements bit counting and manipulation functions for the predeclared unsigned integer types. 

## Index

* [Constants](#const)
    * [const uintSize](#uintSize)
    * [const UintSize](#UintSize)
    * [const deBruijn32](#deBruijn32)
    * [const deBruijn64](#deBruijn64)
    * [const m0](#m0)
    * [const m1](#m1)
    * [const m2](#m2)
    * [const m3](#m3)
    * [const m4](#m4)
    * [const ntz8tab](#ntz8tab)
    * [const pop8tab](#pop8tab)
    * [const rev8tab](#rev8tab)
    * [const len8tab](#len8tab)
    * [const DeBruijn64](#DeBruijn64)
* [Variables](#var)
    * [var deBruijn32tab](#deBruijn32tab)
    * [var deBruijn64tab](#deBruijn64tab)
    * [var overflowError](#overflowError)
    * [var divideError](#divideError)
* [Functions](#func)
    * [func LeadingZeros(x uint) int](#LeadingZeros)
    * [func LeadingZeros8(x uint8) int](#LeadingZeros8)
    * [func LeadingZeros16(x uint16) int](#LeadingZeros16)
    * [func LeadingZeros32(x uint32) int](#LeadingZeros32)
    * [func LeadingZeros64(x uint64) int](#LeadingZeros64)
    * [func TrailingZeros(x uint) int](#TrailingZeros)
    * [func TrailingZeros8(x uint8) int](#TrailingZeros8)
    * [func TrailingZeros16(x uint16) int](#TrailingZeros16)
    * [func TrailingZeros32(x uint32) int](#TrailingZeros32)
    * [func TrailingZeros64(x uint64) int](#TrailingZeros64)
    * [func OnesCount(x uint) int](#OnesCount)
    * [func OnesCount8(x uint8) int](#OnesCount8)
    * [func OnesCount16(x uint16) int](#OnesCount16)
    * [func OnesCount32(x uint32) int](#OnesCount32)
    * [func OnesCount64(x uint64) int](#OnesCount64)
    * [func RotateLeft(x uint, k int) uint](#RotateLeft)
    * [func RotateLeft8(x uint8, k int) uint8](#RotateLeft8)
    * [func RotateLeft16(x uint16, k int) uint16](#RotateLeft16)
    * [func RotateLeft32(x uint32, k int) uint32](#RotateLeft32)
    * [func RotateLeft64(x uint64, k int) uint64](#RotateLeft64)
    * [func Reverse(x uint) uint](#Reverse)
    * [func Reverse8(x uint8) uint8](#Reverse8)
    * [func Reverse16(x uint16) uint16](#Reverse16)
    * [func Reverse32(x uint32) uint32](#Reverse32)
    * [func Reverse64(x uint64) uint64](#Reverse64)
    * [func ReverseBytes(x uint) uint](#ReverseBytes)
    * [func ReverseBytes16(x uint16) uint16](#ReverseBytes16)
    * [func ReverseBytes32(x uint32) uint32](#ReverseBytes32)
    * [func ReverseBytes64(x uint64) uint64](#ReverseBytes64)
    * [func Len(x uint) int](#Len)
    * [func Len8(x uint8) int](#Len8)
    * [func Len16(x uint16) (n int)](#Len16)
    * [func Len32(x uint32) (n int)](#Len32)
    * [func Len64(x uint64) (n int)](#Len64)
    * [func Add(x, y, carry uint) (sum, carryOut uint)](#Add)
    * [func Add32(x, y, carry uint32) (sum, carryOut uint32)](#Add32)
    * [func Add64(x, y, carry uint64) (sum, carryOut uint64)](#Add64)
    * [func Sub(x, y, borrow uint) (diff, borrowOut uint)](#Sub)
    * [func Sub32(x, y, borrow uint32) (diff, borrowOut uint32)](#Sub32)
    * [func Sub64(x, y, borrow uint64) (diff, borrowOut uint64)](#Sub64)
    * [func Mul(x, y uint) (hi, lo uint)](#Mul)
    * [func Mul32(x, y uint32) (hi, lo uint32)](#Mul32)
    * [func Mul64(x, y uint64) (hi, lo uint64)](#Mul64)
    * [func Div(hi, lo, y uint) (quo, rem uint)](#Div)
    * [func Div32(hi, lo, y uint32) (quo, rem uint32)](#Div32)
    * [func Div64(hi, lo, y uint64) (quo, rem uint64)](#Div64)
    * [func Rem(hi, lo, y uint) uint](#Rem)
    * [func Rem32(hi, lo, y uint32) uint32](#Rem32)
    * [func Rem64(hi, lo, y uint64) uint64](#Rem64)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="uintSize" href="#uintSize">const uintSize</a>

```
searchKey: bits.uintSize
```

```Go
const uintSize = 32 << (^uint(0) >> 63) // 32 or 64

```

### <a id="UintSize" href="#UintSize">const UintSize</a>

```
searchKey: bits.UintSize
tags: [exported]
```

```Go
const UintSize = uintSize
```

UintSize is the size of a uint in bits. 

### <a id="deBruijn32" href="#deBruijn32">const deBruijn32</a>

```
searchKey: bits.deBruijn32
```

```Go
const deBruijn32 = 0x077CB531
```

See [http://supertech.csail.mit.edu/papers/debruijn.pdf](http://supertech.csail.mit.edu/papers/debruijn.pdf) 

### <a id="deBruijn64" href="#deBruijn64">const deBruijn64</a>

```
searchKey: bits.deBruijn64
```

```Go
const deBruijn64 = 0x03f79d71b4ca8b09
```

### <a id="m0" href="#m0">const m0</a>

```
searchKey: bits.m0
```

```Go
const m0 = 0x5555555555555555 // 01010101 ...

```

### <a id="m1" href="#m1">const m1</a>

```
searchKey: bits.m1
```

```Go
const m1 = 0x3333333333333333 // 00110011 ...

```

### <a id="m2" href="#m2">const m2</a>

```
searchKey: bits.m2
```

```Go
const m2 = 0x0f0f0f0f0f0f0f0f // 00001111 ...

```

### <a id="m3" href="#m3">const m3</a>

```
searchKey: bits.m3
```

```Go
const m3 = 0x00ff00ff00ff00ff // etc.

```

### <a id="m4" href="#m4">const m4</a>

```
searchKey: bits.m4
```

```Go
const m4 = 0x0000ffff0000ffff
```

### <a id="ntz8tab" href="#ntz8tab">const ntz8tab</a>

```
searchKey: bits.ntz8tab
```

```Go
const ntz8tab = ...
```

### <a id="pop8tab" href="#pop8tab">const pop8tab</a>

```
searchKey: bits.pop8tab
```

```Go
const pop8tab = ...
```

### <a id="rev8tab" href="#rev8tab">const rev8tab</a>

```
searchKey: bits.rev8tab
```

```Go
const rev8tab = ...
```

### <a id="len8tab" href="#len8tab">const len8tab</a>

```
searchKey: bits.len8tab
```

```Go
const len8tab = ...
```

### <a id="DeBruijn64" href="#DeBruijn64">const DeBruijn64</a>

```
searchKey: bits.DeBruijn64
```

```Go
const DeBruijn64 = deBruijn64
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="deBruijn32tab" href="#deBruijn32tab">var deBruijn32tab</a>

```
searchKey: bits.deBruijn32tab
```

```Go
var deBruijn32tab = ...
```

### <a id="deBruijn64tab" href="#deBruijn64tab">var deBruijn64tab</a>

```
searchKey: bits.deBruijn64tab
```

```Go
var deBruijn64tab = ...
```

### <a id="overflowError" href="#overflowError">var overflowError</a>

```
searchKey: bits.overflowError
```

```Go
var overflowError error
```

### <a id="divideError" href="#divideError">var divideError</a>

```
searchKey: bits.divideError
```

```Go
var divideError error
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="LeadingZeros" href="#LeadingZeros">func LeadingZeros(x uint) int</a>

```
searchKey: bits.LeadingZeros
tags: [exported]
```

```Go
func LeadingZeros(x uint) int
```

LeadingZeros returns the number of leading zero bits in x; the result is UintSize for x == 0. 

### <a id="LeadingZeros8" href="#LeadingZeros8">func LeadingZeros8(x uint8) int</a>

```
searchKey: bits.LeadingZeros8
tags: [exported]
```

```Go
func LeadingZeros8(x uint8) int
```

LeadingZeros8 returns the number of leading zero bits in x; the result is 8 for x == 0. 

### <a id="LeadingZeros16" href="#LeadingZeros16">func LeadingZeros16(x uint16) int</a>

```
searchKey: bits.LeadingZeros16
tags: [exported]
```

```Go
func LeadingZeros16(x uint16) int
```

LeadingZeros16 returns the number of leading zero bits in x; the result is 16 for x == 0. 

### <a id="LeadingZeros32" href="#LeadingZeros32">func LeadingZeros32(x uint32) int</a>

```
searchKey: bits.LeadingZeros32
tags: [exported]
```

```Go
func LeadingZeros32(x uint32) int
```

LeadingZeros32 returns the number of leading zero bits in x; the result is 32 for x == 0. 

### <a id="LeadingZeros64" href="#LeadingZeros64">func LeadingZeros64(x uint64) int</a>

```
searchKey: bits.LeadingZeros64
tags: [exported]
```

```Go
func LeadingZeros64(x uint64) int
```

LeadingZeros64 returns the number of leading zero bits in x; the result is 64 for x == 0. 

### <a id="TrailingZeros" href="#TrailingZeros">func TrailingZeros(x uint) int</a>

```
searchKey: bits.TrailingZeros
tags: [exported]
```

```Go
func TrailingZeros(x uint) int
```

TrailingZeros returns the number of trailing zero bits in x; the result is UintSize for x == 0. 

### <a id="TrailingZeros8" href="#TrailingZeros8">func TrailingZeros8(x uint8) int</a>

```
searchKey: bits.TrailingZeros8
tags: [exported]
```

```Go
func TrailingZeros8(x uint8) int
```

TrailingZeros8 returns the number of trailing zero bits in x; the result is 8 for x == 0. 

### <a id="TrailingZeros16" href="#TrailingZeros16">func TrailingZeros16(x uint16) int</a>

```
searchKey: bits.TrailingZeros16
tags: [exported]
```

```Go
func TrailingZeros16(x uint16) int
```

TrailingZeros16 returns the number of trailing zero bits in x; the result is 16 for x == 0. 

### <a id="TrailingZeros32" href="#TrailingZeros32">func TrailingZeros32(x uint32) int</a>

```
searchKey: bits.TrailingZeros32
tags: [exported]
```

```Go
func TrailingZeros32(x uint32) int
```

TrailingZeros32 returns the number of trailing zero bits in x; the result is 32 for x == 0. 

### <a id="TrailingZeros64" href="#TrailingZeros64">func TrailingZeros64(x uint64) int</a>

```
searchKey: bits.TrailingZeros64
tags: [exported]
```

```Go
func TrailingZeros64(x uint64) int
```

TrailingZeros64 returns the number of trailing zero bits in x; the result is 64 for x == 0. 

### <a id="OnesCount" href="#OnesCount">func OnesCount(x uint) int</a>

```
searchKey: bits.OnesCount
tags: [exported]
```

```Go
func OnesCount(x uint) int
```

OnesCount returns the number of one bits ("population count") in x. 

### <a id="OnesCount8" href="#OnesCount8">func OnesCount8(x uint8) int</a>

```
searchKey: bits.OnesCount8
tags: [exported]
```

```Go
func OnesCount8(x uint8) int
```

OnesCount8 returns the number of one bits ("population count") in x. 

### <a id="OnesCount16" href="#OnesCount16">func OnesCount16(x uint16) int</a>

```
searchKey: bits.OnesCount16
tags: [exported]
```

```Go
func OnesCount16(x uint16) int
```

OnesCount16 returns the number of one bits ("population count") in x. 

### <a id="OnesCount32" href="#OnesCount32">func OnesCount32(x uint32) int</a>

```
searchKey: bits.OnesCount32
tags: [exported]
```

```Go
func OnesCount32(x uint32) int
```

OnesCount32 returns the number of one bits ("population count") in x. 

### <a id="OnesCount64" href="#OnesCount64">func OnesCount64(x uint64) int</a>

```
searchKey: bits.OnesCount64
tags: [exported]
```

```Go
func OnesCount64(x uint64) int
```

OnesCount64 returns the number of one bits ("population count") in x. 

### <a id="RotateLeft" href="#RotateLeft">func RotateLeft(x uint, k int) uint</a>

```
searchKey: bits.RotateLeft
tags: [exported]
```

```Go
func RotateLeft(x uint, k int) uint
```

RotateLeft returns the value of x rotated left by (k mod UintSize) bits. To rotate x right by k bits, call RotateLeft(x, -k). 

This function's execution time does not depend on the inputs. 

### <a id="RotateLeft8" href="#RotateLeft8">func RotateLeft8(x uint8, k int) uint8</a>

```
searchKey: bits.RotateLeft8
tags: [exported]
```

```Go
func RotateLeft8(x uint8, k int) uint8
```

RotateLeft8 returns the value of x rotated left by (k mod 8) bits. To rotate x right by k bits, call RotateLeft8(x, -k). 

This function's execution time does not depend on the inputs. 

### <a id="RotateLeft16" href="#RotateLeft16">func RotateLeft16(x uint16, k int) uint16</a>

```
searchKey: bits.RotateLeft16
tags: [exported]
```

```Go
func RotateLeft16(x uint16, k int) uint16
```

RotateLeft16 returns the value of x rotated left by (k mod 16) bits. To rotate x right by k bits, call RotateLeft16(x, -k). 

This function's execution time does not depend on the inputs. 

### <a id="RotateLeft32" href="#RotateLeft32">func RotateLeft32(x uint32, k int) uint32</a>

```
searchKey: bits.RotateLeft32
tags: [exported]
```

```Go
func RotateLeft32(x uint32, k int) uint32
```

RotateLeft32 returns the value of x rotated left by (k mod 32) bits. To rotate x right by k bits, call RotateLeft32(x, -k). 

This function's execution time does not depend on the inputs. 

### <a id="RotateLeft64" href="#RotateLeft64">func RotateLeft64(x uint64, k int) uint64</a>

```
searchKey: bits.RotateLeft64
tags: [exported]
```

```Go
func RotateLeft64(x uint64, k int) uint64
```

RotateLeft64 returns the value of x rotated left by (k mod 64) bits. To rotate x right by k bits, call RotateLeft64(x, -k). 

This function's execution time does not depend on the inputs. 

### <a id="Reverse" href="#Reverse">func Reverse(x uint) uint</a>

```
searchKey: bits.Reverse
tags: [exported]
```

```Go
func Reverse(x uint) uint
```

Reverse returns the value of x with its bits in reversed order. 

### <a id="Reverse8" href="#Reverse8">func Reverse8(x uint8) uint8</a>

```
searchKey: bits.Reverse8
tags: [exported]
```

```Go
func Reverse8(x uint8) uint8
```

Reverse8 returns the value of x with its bits in reversed order. 

### <a id="Reverse16" href="#Reverse16">func Reverse16(x uint16) uint16</a>

```
searchKey: bits.Reverse16
tags: [exported]
```

```Go
func Reverse16(x uint16) uint16
```

Reverse16 returns the value of x with its bits in reversed order. 

### <a id="Reverse32" href="#Reverse32">func Reverse32(x uint32) uint32</a>

```
searchKey: bits.Reverse32
tags: [exported]
```

```Go
func Reverse32(x uint32) uint32
```

Reverse32 returns the value of x with its bits in reversed order. 

### <a id="Reverse64" href="#Reverse64">func Reverse64(x uint64) uint64</a>

```
searchKey: bits.Reverse64
tags: [exported]
```

```Go
func Reverse64(x uint64) uint64
```

Reverse64 returns the value of x with its bits in reversed order. 

### <a id="ReverseBytes" href="#ReverseBytes">func ReverseBytes(x uint) uint</a>

```
searchKey: bits.ReverseBytes
tags: [exported]
```

```Go
func ReverseBytes(x uint) uint
```

ReverseBytes returns the value of x with its bytes in reversed order. 

This function's execution time does not depend on the inputs. 

### <a id="ReverseBytes16" href="#ReverseBytes16">func ReverseBytes16(x uint16) uint16</a>

```
searchKey: bits.ReverseBytes16
tags: [exported]
```

```Go
func ReverseBytes16(x uint16) uint16
```

ReverseBytes16 returns the value of x with its bytes in reversed order. 

This function's execution time does not depend on the inputs. 

### <a id="ReverseBytes32" href="#ReverseBytes32">func ReverseBytes32(x uint32) uint32</a>

```
searchKey: bits.ReverseBytes32
tags: [exported]
```

```Go
func ReverseBytes32(x uint32) uint32
```

ReverseBytes32 returns the value of x with its bytes in reversed order. 

This function's execution time does not depend on the inputs. 

### <a id="ReverseBytes64" href="#ReverseBytes64">func ReverseBytes64(x uint64) uint64</a>

```
searchKey: bits.ReverseBytes64
tags: [exported]
```

```Go
func ReverseBytes64(x uint64) uint64
```

ReverseBytes64 returns the value of x with its bytes in reversed order. 

This function's execution time does not depend on the inputs. 

### <a id="Len" href="#Len">func Len(x uint) int</a>

```
searchKey: bits.Len
tags: [exported]
```

```Go
func Len(x uint) int
```

Len returns the minimum number of bits required to represent x; the result is 0 for x == 0. 

### <a id="Len8" href="#Len8">func Len8(x uint8) int</a>

```
searchKey: bits.Len8
tags: [exported]
```

```Go
func Len8(x uint8) int
```

Len8 returns the minimum number of bits required to represent x; the result is 0 for x == 0. 

### <a id="Len16" href="#Len16">func Len16(x uint16) (n int)</a>

```
searchKey: bits.Len16
tags: [exported]
```

```Go
func Len16(x uint16) (n int)
```

Len16 returns the minimum number of bits required to represent x; the result is 0 for x == 0. 

### <a id="Len32" href="#Len32">func Len32(x uint32) (n int)</a>

```
searchKey: bits.Len32
tags: [exported]
```

```Go
func Len32(x uint32) (n int)
```

Len32 returns the minimum number of bits required to represent x; the result is 0 for x == 0. 

### <a id="Len64" href="#Len64">func Len64(x uint64) (n int)</a>

```
searchKey: bits.Len64
tags: [exported]
```

```Go
func Len64(x uint64) (n int)
```

Len64 returns the minimum number of bits required to represent x; the result is 0 for x == 0. 

### <a id="Add" href="#Add">func Add(x, y, carry uint) (sum, carryOut uint)</a>

```
searchKey: bits.Add
tags: [exported]
```

```Go
func Add(x, y, carry uint) (sum, carryOut uint)
```

Add returns the sum with carry of x, y and carry: sum = x + y + carry. The carry input must be 0 or 1; otherwise the behavior is undefined. The carryOut output is guaranteed to be 0 or 1. 

This function's execution time does not depend on the inputs. 

### <a id="Add32" href="#Add32">func Add32(x, y, carry uint32) (sum, carryOut uint32)</a>

```
searchKey: bits.Add32
tags: [exported]
```

```Go
func Add32(x, y, carry uint32) (sum, carryOut uint32)
```

Add32 returns the sum with carry of x, y and carry: sum = x + y + carry. The carry input must be 0 or 1; otherwise the behavior is undefined. The carryOut output is guaranteed to be 0 or 1. 

This function's execution time does not depend on the inputs. 

### <a id="Add64" href="#Add64">func Add64(x, y, carry uint64) (sum, carryOut uint64)</a>

```
searchKey: bits.Add64
tags: [exported]
```

```Go
func Add64(x, y, carry uint64) (sum, carryOut uint64)
```

Add64 returns the sum with carry of x, y and carry: sum = x + y + carry. The carry input must be 0 or 1; otherwise the behavior is undefined. The carryOut output is guaranteed to be 0 or 1. 

This function's execution time does not depend on the inputs. 

### <a id="Sub" href="#Sub">func Sub(x, y, borrow uint) (diff, borrowOut uint)</a>

```
searchKey: bits.Sub
tags: [exported]
```

```Go
func Sub(x, y, borrow uint) (diff, borrowOut uint)
```

Sub returns the difference of x, y and borrow: diff = x - y - borrow. The borrow input must be 0 or 1; otherwise the behavior is undefined. The borrowOut output is guaranteed to be 0 or 1. 

This function's execution time does not depend on the inputs. 

### <a id="Sub32" href="#Sub32">func Sub32(x, y, borrow uint32) (diff, borrowOut uint32)</a>

```
searchKey: bits.Sub32
tags: [exported]
```

```Go
func Sub32(x, y, borrow uint32) (diff, borrowOut uint32)
```

Sub32 returns the difference of x, y and borrow, diff = x - y - borrow. The borrow input must be 0 or 1; otherwise the behavior is undefined. The borrowOut output is guaranteed to be 0 or 1. 

This function's execution time does not depend on the inputs. 

### <a id="Sub64" href="#Sub64">func Sub64(x, y, borrow uint64) (diff, borrowOut uint64)</a>

```
searchKey: bits.Sub64
tags: [exported]
```

```Go
func Sub64(x, y, borrow uint64) (diff, borrowOut uint64)
```

Sub64 returns the difference of x, y and borrow: diff = x - y - borrow. The borrow input must be 0 or 1; otherwise the behavior is undefined. The borrowOut output is guaranteed to be 0 or 1. 

This function's execution time does not depend on the inputs. 

### <a id="Mul" href="#Mul">func Mul(x, y uint) (hi, lo uint)</a>

```
searchKey: bits.Mul
tags: [exported]
```

```Go
func Mul(x, y uint) (hi, lo uint)
```

Mul returns the full-width product of x and y: (hi, lo) = x * y with the product bits' upper half returned in hi and the lower half returned in lo. 

This function's execution time does not depend on the inputs. 

### <a id="Mul32" href="#Mul32">func Mul32(x, y uint32) (hi, lo uint32)</a>

```
searchKey: bits.Mul32
tags: [exported]
```

```Go
func Mul32(x, y uint32) (hi, lo uint32)
```

Mul32 returns the 64-bit product of x and y: (hi, lo) = x * y with the product bits' upper half returned in hi and the lower half returned in lo. 

This function's execution time does not depend on the inputs. 

### <a id="Mul64" href="#Mul64">func Mul64(x, y uint64) (hi, lo uint64)</a>

```
searchKey: bits.Mul64
tags: [exported]
```

```Go
func Mul64(x, y uint64) (hi, lo uint64)
```

Mul64 returns the 128-bit product of x and y: (hi, lo) = x * y with the product bits' upper half returned in hi and the lower half returned in lo. 

This function's execution time does not depend on the inputs. 

### <a id="Div" href="#Div">func Div(hi, lo, y uint) (quo, rem uint)</a>

```
searchKey: bits.Div
tags: [exported]
```

```Go
func Div(hi, lo, y uint) (quo, rem uint)
```

Div returns the quotient and remainder of (hi, lo) divided by y: quo = (hi, lo)/y, rem = (hi, lo)%y with the dividend bits' upper half in parameter hi and the lower half in parameter lo. Div panics for y == 0 (division by zero) or y <= hi (quotient overflow). 

### <a id="Div32" href="#Div32">func Div32(hi, lo, y uint32) (quo, rem uint32)</a>

```
searchKey: bits.Div32
tags: [exported]
```

```Go
func Div32(hi, lo, y uint32) (quo, rem uint32)
```

Div32 returns the quotient and remainder of (hi, lo) divided by y: quo = (hi, lo)/y, rem = (hi, lo)%y with the dividend bits' upper half in parameter hi and the lower half in parameter lo. Div32 panics for y == 0 (division by zero) or y <= hi (quotient overflow). 

### <a id="Div64" href="#Div64">func Div64(hi, lo, y uint64) (quo, rem uint64)</a>

```
searchKey: bits.Div64
tags: [exported]
```

```Go
func Div64(hi, lo, y uint64) (quo, rem uint64)
```

Div64 returns the quotient and remainder of (hi, lo) divided by y: quo = (hi, lo)/y, rem = (hi, lo)%y with the dividend bits' upper half in parameter hi and the lower half in parameter lo. Div64 panics for y == 0 (division by zero) or y <= hi (quotient overflow). 

### <a id="Rem" href="#Rem">func Rem(hi, lo, y uint) uint</a>

```
searchKey: bits.Rem
tags: [exported]
```

```Go
func Rem(hi, lo, y uint) uint
```

Rem returns the remainder of (hi, lo) divided by y. Rem panics for y == 0 (division by zero) but, unlike Div, it doesn't panic on a quotient overflow. 

### <a id="Rem32" href="#Rem32">func Rem32(hi, lo, y uint32) uint32</a>

```
searchKey: bits.Rem32
tags: [exported]
```

```Go
func Rem32(hi, lo, y uint32) uint32
```

Rem32 returns the remainder of (hi, lo) divided by y. Rem32 panics for y == 0 (division by zero) but, unlike Div32, it doesn't panic on a quotient overflow. 

### <a id="Rem64" href="#Rem64">func Rem64(hi, lo, y uint64) uint64</a>

```
searchKey: bits.Rem64
tags: [exported]
```

```Go
func Rem64(hi, lo, y uint64) uint64
```

Rem64 returns the remainder of (hi, lo) divided by y. Rem64 panics for y == 0 (division by zero) but, unlike Div64, it doesn't panic on a quotient overflow. 

