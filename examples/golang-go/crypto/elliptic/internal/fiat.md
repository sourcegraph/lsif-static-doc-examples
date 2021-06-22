# Package fiat

Package fiat implements prime order fields using formally verified algorithms from the Fiat Cryptography project. 

## Index

* [Variables](#var)
    * [var p521ZeroEncoding](#p521ZeroEncoding)
* [Types](#type)
    * [type P521Element struct](#P521Element)
        * [func (e *P521Element) One() *P521Element](#P521Element.One)
        * [func (e *P521Element) Equal(t *P521Element) int](#P521Element.Equal)
        * [func (e *P521Element) IsZero() int](#P521Element.IsZero)
        * [func (e *P521Element) Set(t *P521Element) *P521Element](#P521Element.Set)
        * [func (e *P521Element) Bytes() []byte](#P521Element.Bytes)
        * [func (e *P521Element) SetBytes(v []byte) (*P521Element, error)](#P521Element.SetBytes)
        * [func (e *P521Element) Add(t1, t2 *P521Element) *P521Element](#P521Element.Add)
        * [func (e *P521Element) Sub(t1, t2 *P521Element) *P521Element](#P521Element.Sub)
        * [func (e *P521Element) Mul(t1, t2 *P521Element) *P521Element](#P521Element.Mul)
        * [func (e *P521Element) Square(t *P521Element) *P521Element](#P521Element.Square)
        * [func (v *P521Element) Select(a, b *P521Element, cond int) *P521Element](#P521Element.Select)
        * [func (e *P521Element) Invert(t *P521Element) *P521Element](#P521Element.Invert)
    * [type p521Uint1 uint8](#p521Uint1)
        * [func p521AddcarryxU64(x uint64, y uint64, carry p521Uint1) (uint64, p521Uint1)](#p521AddcarryxU64)
        * [func p521SubborrowxU64(x uint64, y uint64, carry p521Uint1) (uint64, p521Uint1)](#p521SubborrowxU64)
    * [type p521Int1 int8](#p521Int1)
* [Functions](#func)
    * [func p521AddcarryxU58(out1 *uint64, out2 *p521Uint1, arg1 p521Uint1, arg2 uint64, arg3 uint64)](#p521AddcarryxU58)
    * [func p521SubborrowxU58(out1 *uint64, out2 *p521Uint1, arg1 p521Uint1, arg2 uint64, arg3 uint64)](#p521SubborrowxU58)
    * [func p521AddcarryxU57(out1 *uint64, out2 *p521Uint1, arg1 p521Uint1, arg2 uint64, arg3 uint64)](#p521AddcarryxU57)
    * [func p521SubborrowxU57(out1 *uint64, out2 *p521Uint1, arg1 p521Uint1, arg2 uint64, arg3 uint64)](#p521SubborrowxU57)
    * [func p521CmovznzU64(out1 *uint64, arg1 p521Uint1, arg2 uint64, arg3 uint64)](#p521CmovznzU64)
    * [func p521CarryMul(out1 *[9]uint64, arg1 *[9]uint64, arg2 *[9]uint64)](#p521CarryMul)
    * [func p521CarrySquare(out1 *[9]uint64, arg1 *[9]uint64)](#p521CarrySquare)
    * [func p521Carry(out1 *[9]uint64, arg1 *[9]uint64)](#p521Carry)
    * [func p521Add(out1 *[9]uint64, arg1 *[9]uint64, arg2 *[9]uint64)](#p521Add)
    * [func p521Sub(out1 *[9]uint64, arg1 *[9]uint64, arg2 *[9]uint64)](#p521Sub)
    * [func p521ToBytes(out1 *[66]uint8, arg1 *[9]uint64)](#p521ToBytes)
    * [func p521FromBytes(out1 *[9]uint64, arg1 *[66]uint8)](#p521FromBytes)
    * [func p521Selectznz(out1 *[9]uint64, arg1 p521Uint1, arg2 *[9]uint64, arg3 *[9]uint64)](#p521Selectznz)


## <a id="var" href="#var">Variables</a>

### <a id="p521ZeroEncoding" href="#p521ZeroEncoding">var p521ZeroEncoding</a>

```
searchKey: fiat.p521ZeroEncoding
```

```Go
var p521ZeroEncoding = new(P521Element).Bytes()
```

## <a id="type" href="#type">Types</a>

### <a id="P521Element" href="#P521Element">type P521Element struct</a>

```
searchKey: fiat.P521Element
tags: [exported]
```

```Go
type P521Element struct {
	// This element has the following bounds, which are tighter than
	// the output bounds of some operations. Those operations must be
	// followed by a carry.
	//
	// [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000],
	// [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000],
	// [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x200000000000000]
	x [9]uint64
}
```

P521Element is an integer modulo 2^521 - 1. 

The zero value is a valid zero element. 

#### <a id="P521Element.One" href="#P521Element.One">func (e *P521Element) One() *P521Element</a>

```
searchKey: fiat.P521Element.One
tags: [exported]
```

```Go
func (e *P521Element) One() *P521Element
```

One sets e = 1, and returns e. 

#### <a id="P521Element.Equal" href="#P521Element.Equal">func (e *P521Element) Equal(t *P521Element) int</a>

```
searchKey: fiat.P521Element.Equal
tags: [exported]
```

```Go
func (e *P521Element) Equal(t *P521Element) int
```

Equal returns 1 if e == t, and zero otherwise. 

#### <a id="P521Element.IsZero" href="#P521Element.IsZero">func (e *P521Element) IsZero() int</a>

```
searchKey: fiat.P521Element.IsZero
tags: [exported]
```

```Go
func (e *P521Element) IsZero() int
```

IsZero returns 1 if e == 0, and zero otherwise. 

#### <a id="P521Element.Set" href="#P521Element.Set">func (e *P521Element) Set(t *P521Element) *P521Element</a>

```
searchKey: fiat.P521Element.Set
tags: [exported]
```

```Go
func (e *P521Element) Set(t *P521Element) *P521Element
```

Set sets e = t, and returns e. 

#### <a id="P521Element.Bytes" href="#P521Element.Bytes">func (e *P521Element) Bytes() []byte</a>

```
searchKey: fiat.P521Element.Bytes
tags: [exported]
```

```Go
func (e *P521Element) Bytes() []byte
```

Bytes returns the 66-byte little-endian encoding of e. 

#### <a id="P521Element.SetBytes" href="#P521Element.SetBytes">func (e *P521Element) SetBytes(v []byte) (*P521Element, error)</a>

```
searchKey: fiat.P521Element.SetBytes
tags: [exported]
```

```Go
func (e *P521Element) SetBytes(v []byte) (*P521Element, error)
```

SetBytes sets e = v, where v is a little-endian 66-byte encoding, and returns e. If v is not 66 bytes or it encodes a value higher than 2^521 - 1, SetBytes returns nil and an error, and e is unchanged. 

#### <a id="P521Element.Add" href="#P521Element.Add">func (e *P521Element) Add(t1, t2 *P521Element) *P521Element</a>

```
searchKey: fiat.P521Element.Add
tags: [exported]
```

```Go
func (e *P521Element) Add(t1, t2 *P521Element) *P521Element
```

Add sets e = t1 + t2, and returns e. 

#### <a id="P521Element.Sub" href="#P521Element.Sub">func (e *P521Element) Sub(t1, t2 *P521Element) *P521Element</a>

```
searchKey: fiat.P521Element.Sub
tags: [exported]
```

```Go
func (e *P521Element) Sub(t1, t2 *P521Element) *P521Element
```

Sub sets e = t1 - t2, and returns e. 

#### <a id="P521Element.Mul" href="#P521Element.Mul">func (e *P521Element) Mul(t1, t2 *P521Element) *P521Element</a>

```
searchKey: fiat.P521Element.Mul
tags: [exported]
```

```Go
func (e *P521Element) Mul(t1, t2 *P521Element) *P521Element
```

Mul sets e = t1 * t2, and returns e. 

#### <a id="P521Element.Square" href="#P521Element.Square">func (e *P521Element) Square(t *P521Element) *P521Element</a>

```
searchKey: fiat.P521Element.Square
tags: [exported]
```

```Go
func (e *P521Element) Square(t *P521Element) *P521Element
```

Square sets e = t * t, and returns e. 

#### <a id="P521Element.Select" href="#P521Element.Select">func (v *P521Element) Select(a, b *P521Element, cond int) *P521Element</a>

```
searchKey: fiat.P521Element.Select
tags: [exported]
```

```Go
func (v *P521Element) Select(a, b *P521Element, cond int) *P521Element
```

Select sets e to a if cond == 1, and to b if cond == 0. 

#### <a id="P521Element.Invert" href="#P521Element.Invert">func (e *P521Element) Invert(t *P521Element) *P521Element</a>

```
searchKey: fiat.P521Element.Invert
tags: [exported]
```

```Go
func (e *P521Element) Invert(t *P521Element) *P521Element
```

Invert sets e = 1/t, and returns e. 

If t == 0, Invert returns e = 0. 

### <a id="p521Uint1" href="#p521Uint1">type p521Uint1 uint8</a>

```
searchKey: fiat.p521Uint1
```

```Go
type p521Uint1 uint8
```

#### <a id="p521AddcarryxU64" href="#p521AddcarryxU64">func p521AddcarryxU64(x uint64, y uint64, carry p521Uint1) (uint64, p521Uint1)</a>

```
searchKey: fiat.p521AddcarryxU64
```

```Go
func p521AddcarryxU64(x uint64, y uint64, carry p521Uint1) (uint64, p521Uint1)
```

p521AddcarryxU64 is a thin wrapper around bits.Add64 that uses p521Uint1 rather than uint64 

#### <a id="p521SubborrowxU64" href="#p521SubborrowxU64">func p521SubborrowxU64(x uint64, y uint64, carry p521Uint1) (uint64, p521Uint1)</a>

```
searchKey: fiat.p521SubborrowxU64
```

```Go
func p521SubborrowxU64(x uint64, y uint64, carry p521Uint1) (uint64, p521Uint1)
```

p521SubborrowxU64 is a thin wrapper around bits.Sub64 that uses p521Uint1 rather than uint64 

### <a id="p521Int1" href="#p521Int1">type p521Int1 int8</a>

```
searchKey: fiat.p521Int1
```

```Go
type p521Int1 int8
```

## <a id="func" href="#func">Functions</a>

### <a id="p521AddcarryxU58" href="#p521AddcarryxU58">func p521AddcarryxU58(out1 *uint64, out2 *p521Uint1, arg1 p521Uint1, arg2 uint64, arg3 uint64)</a>

```
searchKey: fiat.p521AddcarryxU58
```

```Go
func p521AddcarryxU58(out1 *uint64, out2 *p521Uint1, arg1 p521Uint1, arg2 uint64, arg3 uint64)
```

p521AddcarryxU58 is an addition with carry. 

Postconditions: 

```
out1 = (arg1 + arg2 + arg3) mod 2^58
out2 = ⌊(arg1 + arg2 + arg3) / 2^58⌋

```
Input Bounds: 

```
arg1: [0x0 ~> 0x1]
arg2: [0x0 ~> 0x3ffffffffffffff]
arg3: [0x0 ~> 0x3ffffffffffffff]

```
Output Bounds: 

```
out1: [0x0 ~> 0x3ffffffffffffff]
out2: [0x0 ~> 0x1]

```
### <a id="p521SubborrowxU58" href="#p521SubborrowxU58">func p521SubborrowxU58(out1 *uint64, out2 *p521Uint1, arg1 p521Uint1, arg2 uint64, arg3 uint64)</a>

```
searchKey: fiat.p521SubborrowxU58
```

```Go
func p521SubborrowxU58(out1 *uint64, out2 *p521Uint1, arg1 p521Uint1, arg2 uint64, arg3 uint64)
```

p521SubborrowxU58 is a subtraction with borrow. 

Postconditions: 

```
out1 = (-arg1 + arg2 + -arg3) mod 2^58
out2 = -⌊(-arg1 + arg2 + -arg3) / 2^58⌋

```
Input Bounds: 

```
arg1: [0x0 ~> 0x1]
arg2: [0x0 ~> 0x3ffffffffffffff]
arg3: [0x0 ~> 0x3ffffffffffffff]

```
Output Bounds: 

```
out1: [0x0 ~> 0x3ffffffffffffff]
out2: [0x0 ~> 0x1]

```
### <a id="p521AddcarryxU57" href="#p521AddcarryxU57">func p521AddcarryxU57(out1 *uint64, out2 *p521Uint1, arg1 p521Uint1, arg2 uint64, arg3 uint64)</a>

```
searchKey: fiat.p521AddcarryxU57
```

```Go
func p521AddcarryxU57(out1 *uint64, out2 *p521Uint1, arg1 p521Uint1, arg2 uint64, arg3 uint64)
```

p521AddcarryxU57 is an addition with carry. 

Postconditions: 

```
out1 = (arg1 + arg2 + arg3) mod 2^57
out2 = ⌊(arg1 + arg2 + arg3) / 2^57⌋

```
Input Bounds: 

```
arg1: [0x0 ~> 0x1]
arg2: [0x0 ~> 0x1ffffffffffffff]
arg3: [0x0 ~> 0x1ffffffffffffff]

```
Output Bounds: 

```
out1: [0x0 ~> 0x1ffffffffffffff]
out2: [0x0 ~> 0x1]

```
### <a id="p521SubborrowxU57" href="#p521SubborrowxU57">func p521SubborrowxU57(out1 *uint64, out2 *p521Uint1, arg1 p521Uint1, arg2 uint64, arg3 uint64)</a>

```
searchKey: fiat.p521SubborrowxU57
```

```Go
func p521SubborrowxU57(out1 *uint64, out2 *p521Uint1, arg1 p521Uint1, arg2 uint64, arg3 uint64)
```

p521SubborrowxU57 is a subtraction with borrow. 

Postconditions: 

```
out1 = (-arg1 + arg2 + -arg3) mod 2^57
out2 = -⌊(-arg1 + arg2 + -arg3) / 2^57⌋

```
Input Bounds: 

```
arg1: [0x0 ~> 0x1]
arg2: [0x0 ~> 0x1ffffffffffffff]
arg3: [0x0 ~> 0x1ffffffffffffff]

```
Output Bounds: 

```
out1: [0x0 ~> 0x1ffffffffffffff]
out2: [0x0 ~> 0x1]

```
### <a id="p521CmovznzU64" href="#p521CmovznzU64">func p521CmovznzU64(out1 *uint64, arg1 p521Uint1, arg2 uint64, arg3 uint64)</a>

```
searchKey: fiat.p521CmovznzU64
```

```Go
func p521CmovznzU64(out1 *uint64, arg1 p521Uint1, arg2 uint64, arg3 uint64)
```

p521CmovznzU64 is a single-word conditional move. 

Postconditions: 

```
out1 = (if arg1 = 0 then arg2 else arg3)

```
Input Bounds: 

```
arg1: [0x0 ~> 0x1]
arg2: [0x0 ~> 0xffffffffffffffff]
arg3: [0x0 ~> 0xffffffffffffffff]

```
Output Bounds: 

```
out1: [0x0 ~> 0xffffffffffffffff]

```
### <a id="p521CarryMul" href="#p521CarryMul">func p521CarryMul(out1 *[9]uint64, arg1 *[9]uint64, arg2 *[9]uint64)</a>

```
searchKey: fiat.p521CarryMul
```

```Go
func p521CarryMul(out1 *[9]uint64, arg1 *[9]uint64, arg2 *[9]uint64)
```

p521CarryMul multiplies two field elements and reduces the result. 

Postconditions: 

```
eval out1 mod m = (eval arg1 * eval arg2) mod m

```
Input Bounds: 

```
arg1: [[0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0x600000000000000]]
arg2: [[0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0x600000000000000]]

```
Output Bounds: 

```
out1: [[0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x200000000000000]]

```
### <a id="p521CarrySquare" href="#p521CarrySquare">func p521CarrySquare(out1 *[9]uint64, arg1 *[9]uint64)</a>

```
searchKey: fiat.p521CarrySquare
```

```Go
func p521CarrySquare(out1 *[9]uint64, arg1 *[9]uint64)
```

p521CarrySquare squares a field element and reduces the result. 

Postconditions: 

```
eval out1 mod m = (eval arg1 * eval arg1) mod m

```
Input Bounds: 

```
arg1: [[0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0x600000000000000]]

```
Output Bounds: 

```
out1: [[0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x200000000000000]]

```
### <a id="p521Carry" href="#p521Carry">func p521Carry(out1 *[9]uint64, arg1 *[9]uint64)</a>

```
searchKey: fiat.p521Carry
```

```Go
func p521Carry(out1 *[9]uint64, arg1 *[9]uint64)
```

p521Carry reduces a field element. 

Postconditions: 

```
eval out1 mod m = eval arg1 mod m

```
Input Bounds: 

```
arg1: [[0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0x600000000000000]]

```
Output Bounds: 

```
out1: [[0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x200000000000000]]

```
### <a id="p521Add" href="#p521Add">func p521Add(out1 *[9]uint64, arg1 *[9]uint64, arg2 *[9]uint64)</a>

```
searchKey: fiat.p521Add
```

```Go
func p521Add(out1 *[9]uint64, arg1 *[9]uint64, arg2 *[9]uint64)
```

p521Add adds two field elements. 

Postconditions: 

```
eval out1 mod m = (eval arg1 + eval arg2) mod m

```
Input Bounds: 

```
arg1: [[0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x200000000000000]]
arg2: [[0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x200000000000000]]

```
Output Bounds: 

```
out1: [[0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0x600000000000000]]

```
### <a id="p521Sub" href="#p521Sub">func p521Sub(out1 *[9]uint64, arg1 *[9]uint64, arg2 *[9]uint64)</a>

```
searchKey: fiat.p521Sub
```

```Go
func p521Sub(out1 *[9]uint64, arg1 *[9]uint64, arg2 *[9]uint64)
```

p521Sub subtracts two field elements. 

Postconditions: 

```
eval out1 mod m = (eval arg1 - eval arg2) mod m

```
Input Bounds: 

```
arg1: [[0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x200000000000000]]
arg2: [[0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x200000000000000]]

```
Output Bounds: 

```
out1: [[0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0xc00000000000000], [0x0 ~> 0x600000000000000]]

```
### <a id="p521ToBytes" href="#p521ToBytes">func p521ToBytes(out1 *[66]uint8, arg1 *[9]uint64)</a>

```
searchKey: fiat.p521ToBytes
```

```Go
func p521ToBytes(out1 *[66]uint8, arg1 *[9]uint64)
```

p521ToBytes serializes a field element to bytes in little-endian order. 

Postconditions: 

```
out1 = map (λ x, ⌊((eval arg1 mod m) mod 2^(8 * (x + 1))) / 2^(8 * x)⌋) [0..65]

```
Input Bounds: 

```
arg1: [[0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x200000000000000]]

```
Output Bounds: 

```
out1: [[0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0x1]]

```
### <a id="p521FromBytes" href="#p521FromBytes">func p521FromBytes(out1 *[9]uint64, arg1 *[66]uint8)</a>

```
searchKey: fiat.p521FromBytes
```

```Go
func p521FromBytes(out1 *[9]uint64, arg1 *[66]uint8)
```

p521FromBytes deserializes a field element from bytes in little-endian order. 

Postconditions: 

```
eval out1 mod m = bytes_eval arg1 mod m

```
Input Bounds: 

```
arg1: [[0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0xff], [0x0 ~> 0x1]]

```
Output Bounds: 

```
out1: [[0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x400000000000000], [0x0 ~> 0x200000000000000]]

```
### <a id="p521Selectznz" href="#p521Selectznz">func p521Selectznz(out1 *[9]uint64, arg1 p521Uint1, arg2 *[9]uint64, arg3 *[9]uint64)</a>

```
searchKey: fiat.p521Selectznz
```

```Go
func p521Selectznz(out1 *[9]uint64, arg1 p521Uint1, arg2 *[9]uint64, arg3 *[9]uint64)
```

p521Selectznz is a multi-limb conditional select. 

Postconditions: 

```
eval out1 = (if arg1 = 0 then eval arg2 else eval arg3)

```
Input Bounds: 

```
arg1: [0x0 ~> 0x1]
arg2: [[0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff]]
arg3: [[0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff]]

```
Output Bounds: 

```
out1: [[0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff], [0x0 ~> 0xffffffffffffffff]]

```
