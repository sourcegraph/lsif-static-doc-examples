# Package gob_test

## Index

* [Types](#type)
    * [type Vector struct](#Vector)
        * [func (v Vector) MarshalBinary() ([]byte, error)](#Vector.MarshalBinary)
        * [func (v *Vector) UnmarshalBinary(data []byte) error](#Vector.UnmarshalBinary)
    * [type Point struct](#Point)
        * [func (p Point) Hypotenuse() float64](#Point.Hypotenuse)
    * [type Pythagoras interface](#Pythagoras)
        * [func interfaceDecode(dec *gob.Decoder) Pythagoras](#interfaceDecode)
    * [type P struct](#P)
    * [type Q struct](#Q)
* [Functions](#func)
    * [func Example_encodeDecode()](#Example_encodeDecode)
    * [func Example_interface()](#Example_interface)
    * [func interfaceEncode(enc *gob.Encoder, p Pythagoras)](#interfaceEncode)
    * [func Example_basic()](#Example_basic)


## <a id="type" href="#type">Types</a>

### <a id="Vector" href="#Vector">type Vector struct</a>

```
searchKey: gob_test.Vector
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
```

```Go
func (v Vector) MarshalBinary() ([]byte, error)
```

#### <a id="Vector.UnmarshalBinary" href="#Vector.UnmarshalBinary">func (v *Vector) UnmarshalBinary(data []byte) error</a>

```
searchKey: gob_test.Vector.UnmarshalBinary
```

```Go
func (v *Vector) UnmarshalBinary(data []byte) error
```

UnmarshalBinary modifies the receiver so it must take a pointer receiver. 

### <a id="Point" href="#Point">type Point struct</a>

```
searchKey: gob_test.Point
```

```Go
type Point struct {
	X, Y int
}
```

#### <a id="Point.Hypotenuse" href="#Point.Hypotenuse">func (p Point) Hypotenuse() float64</a>

```
searchKey: gob_test.Point.Hypotenuse
```

```Go
func (p Point) Hypotenuse() float64
```

### <a id="Pythagoras" href="#Pythagoras">type Pythagoras interface</a>

```
searchKey: gob_test.Pythagoras
```

```Go
type Pythagoras interface {
	Hypotenuse() float64
}
```

#### <a id="interfaceDecode" href="#interfaceDecode">func interfaceDecode(dec *gob.Decoder) Pythagoras</a>

```
searchKey: gob_test.interfaceDecode
```

```Go
func interfaceDecode(dec *gob.Decoder) Pythagoras
```

interfaceDecode decodes the next interface value from the stream and returns it. 

### <a id="P" href="#P">type P struct</a>

```
searchKey: gob_test.P
```

```Go
type P struct {
	X, Y, Z int
	Name    string
}
```

### <a id="Q" href="#Q">type Q struct</a>

```
searchKey: gob_test.Q
```

```Go
type Q struct {
	X, Y *int32
	Name string
}
```

## <a id="func" href="#func">Functions</a>

### <a id="Example_encodeDecode" href="#Example_encodeDecode">func Example_encodeDecode()</a>

```
searchKey: gob_test.Example_encodeDecode
```

```Go
func Example_encodeDecode()
```

This example transmits a value that implements the custom encoding and decoding methods. 

### <a id="Example_interface" href="#Example_interface">func Example_interface()</a>

```
searchKey: gob_test.Example_interface
```

```Go
func Example_interface()
```

This example shows how to encode an interface value. The key distinction from regular types is to register the concrete type that implements the interface. 

### <a id="interfaceEncode" href="#interfaceEncode">func interfaceEncode(enc *gob.Encoder, p Pythagoras)</a>

```
searchKey: gob_test.interfaceEncode
```

```Go
func interfaceEncode(enc *gob.Encoder, p Pythagoras)
```

interfaceEncode encodes the interface value into the encoder. 

### <a id="Example_basic" href="#Example_basic">func Example_basic()</a>

```
searchKey: gob_test.Example_basic
```

```Go
func Example_basic()
```

This example shows the basic usage of the package: Create an encoder, transmit some values, receive them with a decoder. 

