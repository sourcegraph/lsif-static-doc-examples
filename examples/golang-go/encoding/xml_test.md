# Package xml_test

## Index

* [Constants](#const)
    * [const Gopher](#Gopher)
    * [const Large](#Large)
    * [const Small](#Small)
    * [const Unknown](#Unknown)
    * [const Unrecognized](#Unrecognized)
    * [const Zebra](#Zebra)
* [Types](#type)
    * [type Animal int](#Animal)
        * [func (a Animal) MarshalXML(e *xml.Encoder, start xml.StartElement) error](#Animal.MarshalXML)
        * [func (a *Animal) UnmarshalXML(d *xml.Decoder, start xml.StartElement) error](#Animal.UnmarshalXML)
    * [type Size int](#Size)
        * [func (s Size) MarshalText() ([]byte, error)](#Size.MarshalText)
        * [func (s *Size) UnmarshalText(text []byte) error](#Size.UnmarshalText)
* [Functions](#func)
    * [func ExampleEncoder()](#ExampleEncoder)
    * [func ExampleMarshalIndent()](#ExampleMarshalIndent)
    * [func ExampleUnmarshal()](#ExampleUnmarshal)
    * [func Example_customMarshalXML()](#Example_customMarshalXML)
    * [func Example_textMarshalXML()](#Example_textMarshalXML)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="Gopher" href="#Gopher">const Gopher</a>

```
searchKey: xml_test.Gopher
tags: [constant number private]
```

```Go
const Gopher
```

### <a id="Large" href="#Large">const Large</a>

```
searchKey: xml_test.Large
tags: [constant number private]
```

```Go
const Large
```

### <a id="Small" href="#Small">const Small</a>

```
searchKey: xml_test.Small
tags: [constant number private]
```

```Go
const Small
```

### <a id="Unknown" href="#Unknown">const Unknown</a>

```
searchKey: xml_test.Unknown
tags: [constant number private]
```

```Go
const Unknown Animal = iota
```

### <a id="Unrecognized" href="#Unrecognized">const Unrecognized</a>

```
searchKey: xml_test.Unrecognized
tags: [constant number private]
```

```Go
const Unrecognized Size = iota
```

### <a id="Zebra" href="#Zebra">const Zebra</a>

```
searchKey: xml_test.Zebra
tags: [constant number private]
```

```Go
const Zebra
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Animal" href="#Animal">type Animal int</a>

```
searchKey: xml_test.Animal
tags: [number private]
```

```Go
type Animal int
```

#### <a id="Animal.MarshalXML" href="#Animal.MarshalXML">func (a Animal) MarshalXML(e *xml.Encoder, start xml.StartElement) error</a>

```
searchKey: xml_test.Animal.MarshalXML
tags: [method private]
```

```Go
func (a Animal) MarshalXML(e *xml.Encoder, start xml.StartElement) error
```

#### <a id="Animal.UnmarshalXML" href="#Animal.UnmarshalXML">func (a *Animal) UnmarshalXML(d *xml.Decoder, start xml.StartElement) error</a>

```
searchKey: xml_test.Animal.UnmarshalXML
tags: [method private]
```

```Go
func (a *Animal) UnmarshalXML(d *xml.Decoder, start xml.StartElement) error
```

### <a id="Size" href="#Size">type Size int</a>

```
searchKey: xml_test.Size
tags: [number private]
```

```Go
type Size int
```

#### <a id="Size.MarshalText" href="#Size.MarshalText">func (s Size) MarshalText() ([]byte, error)</a>

```
searchKey: xml_test.Size.MarshalText
tags: [method private]
```

```Go
func (s Size) MarshalText() ([]byte, error)
```

#### <a id="Size.UnmarshalText" href="#Size.UnmarshalText">func (s *Size) UnmarshalText(text []byte) error</a>

```
searchKey: xml_test.Size.UnmarshalText
tags: [method private]
```

```Go
func (s *Size) UnmarshalText(text []byte) error
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ExampleEncoder" href="#ExampleEncoder">func ExampleEncoder()</a>

```
searchKey: xml_test.ExampleEncoder
tags: [function private]
```

```Go
func ExampleEncoder()
```

### <a id="ExampleMarshalIndent" href="#ExampleMarshalIndent">func ExampleMarshalIndent()</a>

```
searchKey: xml_test.ExampleMarshalIndent
tags: [function private]
```

```Go
func ExampleMarshalIndent()
```

### <a id="ExampleUnmarshal" href="#ExampleUnmarshal">func ExampleUnmarshal()</a>

```
searchKey: xml_test.ExampleUnmarshal
tags: [function private]
```

```Go
func ExampleUnmarshal()
```

This example demonstrates unmarshaling an XML excerpt into a value with some preset fields. Note that the Phone field isn't modified and that the XML <Company> element is ignored. Also, the Groups field is assigned considering the element path provided in its tag. 

### <a id="Example_customMarshalXML" href="#Example_customMarshalXML">func Example_customMarshalXML()</a>

```
searchKey: xml_test.Example_customMarshalXML
tags: [function private]
```

```Go
func Example_customMarshalXML()
```

### <a id="Example_textMarshalXML" href="#Example_textMarshalXML">func Example_textMarshalXML()</a>

```
searchKey: xml_test.Example_textMarshalXML
tags: [function private]
```

```Go
func Example_textMarshalXML()
```

