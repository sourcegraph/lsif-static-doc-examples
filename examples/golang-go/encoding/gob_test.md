# Package gob_test

## Index

* [Types](#type)
    * [type P struct](#P)
    * [type Point struct](#Point)
        * [func (p Point) Hypotenuse() float64](#Point.Hypotenuse)
    * [type Pythagoras interface](#Pythagoras)
        * [func interfaceDecode(dec *gob.Decoder) Pythagoras](#interfaceDecode)
    * [type Q struct](#Q)
    * [type Vector struct](#Vector)
        * [func (v Vector) MarshalBinary() ([]byte, error)](#Vector.MarshalBinary)
        * [func (v *Vector) UnmarshalBinary(data []byte) error](#Vector.UnmarshalBinary)
* [Functions](#func)
    * [func Example_basic()](#Example_basic)
    * [func Example_encodeDecode()](#Example_encodeDecode)
    * [func Example_interface()](#Example_interface)
    * [func interfaceEncode(enc *gob.Encoder, p Pythagoras)](#interfaceEncode)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="P" href="#P">type P struct</a>

```
searchKey: gob_test.P
tags: [struct private]
```

```Go
type P struct {
	X, Y, Z int
	Name    string
}
```

### <a id="Point" href="#Point">type Point struct</a>

```
searchKey: gob_test.Point
tags: [struct private]
```

```Go
type Point struct {
	X, Y int
}
```

#### <a id="Point.Hypotenuse" href="#Point.Hypotenuse">func (p Point) Hypotenuse() float64</a>

```
searchKey: gob_test.Point.Hypotenuse
tags: [function private]
```

```Go
func (p Point) Hypotenuse() float64
```

### <a id="Pythagoras" href="#Pythagoras">type Pythagoras interface</a>

```
searchKey: gob_test.Pythagoras
tags: [interface private]
```

```Go
type Pythagoras interface {
	Hypotenuse() float64
}
```

#### <a id="interfaceDecode" href="#interfaceDecode">func interfaceDecode(dec *gob.Decoder) Pythagoras</a>

```
searchKey: gob_test.interfaceDecode
tags: [method private]
```

```Go
func interfaceDecode(dec *gob.Decoder) Pythagoras
```

interfaceDecode decodes the next interface value from the stream and returns it. 

### <a id="Q" href="#Q">type Q struct</a>

```
searchKey: gob_test.Q
tags: [struct private]
```

```Go
type Q struct {
	X, Y *int32
	Name string
}
```

### <a id="Vector" href="#Vector">type Vector struct</a>

```
searchKey: gob_test.Vector
tags: [struct private]
```

```Go
type Vector struct {
	x, y, z int
}
```

The Vector type has unexported fields, which the package cannot access. We therefore write a BinaryMarshal/BinaryUnmarshal method pair to allow us to send and receive the type with the gob package. These interfaces are defined in the "encoding" package. We could equivalently use the locally defined GobEncode/GobDecoder interfaces. 

#### <a id="Vector.MarshalBinary" href="#Vector.MarshalBinary">func (v Vector) MarshalBinary() ([]byte, error)</a>

```
searchKey: gob_test.Vector.MarshalBinary
tags: [function private]
```

```Go
func (v Vector) MarshalBinary() ([]byte, error)
```

#### <a id="Vector.UnmarshalBinary" href="#Vector.UnmarshalBinary">func (v *Vector) UnmarshalBinary(data []byte) error</a>

```
searchKey: gob_test.Vector.UnmarshalBinary
tags: [method private]
```

```Go
func (v *Vector) UnmarshalBinary(data []byte) error
```

UnmarshalBinary modifies the receiver so it must take a pointer receiver. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Example_basic" href="#Example_basic">func Example_basic()</a>

```
searchKey: gob_test.Example_basic
tags: [function private]
```

```Go
func Example_basic()
```

This example shows the basic usage of the package: Create an encoder, transmit some values, receive them with a decoder. 

### <a id="Example_encodeDecode" href="#Example_encodeDecode">func Example_encodeDecode()</a>

```
searchKey: gob_test.Example_encodeDecode
tags: [function private]
```

```Go
func Example_encodeDecode()
```

This example transmits a value that implements the custom encoding and decoding methods. 

### <a id="Example_interface" href="#Example_interface">func Example_interface()</a>

```
searchKey: gob_test.Example_interface
tags: [function private]
```

```Go
func Example_interface()
```

This example shows how to encode an interface value. The key distinction from regular types is to register the concrete type that implements the interface. 

### <a id="interfaceEncode" href="#interfaceEncode">func interfaceEncode(enc *gob.Encoder, p Pythagoras)</a>

```
searchKey: gob_test.interfaceEncode
tags: [method private]
```

```Go
func interfaceEncode(enc *gob.Encoder, p Pythagoras)
```

interfaceEncode encodes the interface value into the encoder. 

