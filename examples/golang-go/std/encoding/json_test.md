# Package json_test

## Index

* [Constants](#const)
    * [const Unknown](#Unknown)
    * [const Gopher](#Gopher)
    * [const Zebra](#Zebra)
    * [const Unrecognized](#Unrecognized)
    * [const Small](#Small)
    * [const Large](#Large)
* [Types](#type)
    * [type Animal int](#Animal)
        * [func (a *Animal) UnmarshalJSON(b []byte) error](#Animal.UnmarshalJSON)
        * [func (a Animal) MarshalJSON() ([]byte, error)](#Animal.MarshalJSON)
    * [type Size int](#Size)
        * [func (s *Size) UnmarshalText(text []byte) error](#Size.UnmarshalText)
        * [func (s Size) MarshalText() ([]byte, error)](#Size.MarshalText)
* [Functions](#func)
    * [func Example_customMarshalJSON()](#Example_customMarshalJSON)
    * [func ExampleMarshal()](#ExampleMarshal)
    * [func ExampleUnmarshal()](#ExampleUnmarshal)
    * [func ExampleDecoder()](#ExampleDecoder)
    * [func ExampleDecoder_Token()](#ExampleDecoder_Token)
    * [func ExampleDecoder_Decode_stream()](#ExampleDecoder_Decode_stream)
    * [func ExampleRawMessage_unmarshal()](#ExampleRawMessage_unmarshal)
    * [func ExampleRawMessage_marshal()](#ExampleRawMessage_marshal)
    * [func ExampleIndent()](#ExampleIndent)
    * [func ExampleMarshalIndent()](#ExampleMarshalIndent)
    * [func ExampleValid()](#ExampleValid)
    * [func ExampleHTMLEscape()](#ExampleHTMLEscape)
    * [func Example_textMarshalJSON()](#Example_textMarshalJSON)


## <a id="const" href="#const">Constants</a>

### <a id="Unknown" href="#Unknown">const Unknown</a>

```
searchKey: json_test.Unknown
```

```Go
const Unknown Animal = iota
```

### <a id="Gopher" href="#Gopher">const Gopher</a>

```
searchKey: json_test.Gopher
```

```Go
const Gopher
```

### <a id="Zebra" href="#Zebra">const Zebra</a>

```
searchKey: json_test.Zebra
```

```Go
const Zebra
```

### <a id="Unrecognized" href="#Unrecognized">const Unrecognized</a>

```
searchKey: json_test.Unrecognized
```

```Go
const Unrecognized Size = iota
```

### <a id="Small" href="#Small">const Small</a>

```
searchKey: json_test.Small
```

```Go
const Small
```

### <a id="Large" href="#Large">const Large</a>

```
searchKey: json_test.Large
```

```Go
const Large
```

## <a id="type" href="#type">Types</a>

### <a id="Animal" href="#Animal">type Animal int</a>

```
searchKey: json_test.Animal
```

```Go
type Animal int
```

#### <a id="Animal.UnmarshalJSON" href="#Animal.UnmarshalJSON">func (a *Animal) UnmarshalJSON(b []byte) error</a>

```
searchKey: json_test.Animal.UnmarshalJSON
```

```Go
func (a *Animal) UnmarshalJSON(b []byte) error
```

#### <a id="Animal.MarshalJSON" href="#Animal.MarshalJSON">func (a Animal) MarshalJSON() ([]byte, error)</a>

```
searchKey: json_test.Animal.MarshalJSON
```

```Go
func (a Animal) MarshalJSON() ([]byte, error)
```

### <a id="Size" href="#Size">type Size int</a>

```
searchKey: json_test.Size
```

```Go
type Size int
```

#### <a id="Size.UnmarshalText" href="#Size.UnmarshalText">func (s *Size) UnmarshalText(text []byte) error</a>

```
searchKey: json_test.Size.UnmarshalText
```

```Go
func (s *Size) UnmarshalText(text []byte) error
```

#### <a id="Size.MarshalText" href="#Size.MarshalText">func (s Size) MarshalText() ([]byte, error)</a>

```
searchKey: json_test.Size.MarshalText
```

```Go
func (s Size) MarshalText() ([]byte, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="Example_customMarshalJSON" href="#Example_customMarshalJSON">func Example_customMarshalJSON()</a>

```
searchKey: json_test.Example_customMarshalJSON
```

```Go
func Example_customMarshalJSON()
```

### <a id="ExampleMarshal" href="#ExampleMarshal">func ExampleMarshal()</a>

```
searchKey: json_test.ExampleMarshal
```

```Go
func ExampleMarshal()
```

### <a id="ExampleUnmarshal" href="#ExampleUnmarshal">func ExampleUnmarshal()</a>

```
searchKey: json_test.ExampleUnmarshal
```

```Go
func ExampleUnmarshal()
```

### <a id="ExampleDecoder" href="#ExampleDecoder">func ExampleDecoder()</a>

```
searchKey: json_test.ExampleDecoder
```

```Go
func ExampleDecoder()
```

This example uses a Decoder to decode a stream of distinct JSON values. 

### <a id="ExampleDecoder_Token" href="#ExampleDecoder_Token">func ExampleDecoder_Token()</a>

```
searchKey: json_test.ExampleDecoder_Token
```

```Go
func ExampleDecoder_Token()
```

This example uses a Decoder to decode a stream of distinct JSON values. 

### <a id="ExampleDecoder_Decode_stream" href="#ExampleDecoder_Decode_stream">func ExampleDecoder_Decode_stream()</a>

```
searchKey: json_test.ExampleDecoder_Decode_stream
```

```Go
func ExampleDecoder_Decode_stream()
```

This example uses a Decoder to decode a streaming array of JSON objects. 

### <a id="ExampleRawMessage_unmarshal" href="#ExampleRawMessage_unmarshal">func ExampleRawMessage_unmarshal()</a>

```
searchKey: json_test.ExampleRawMessage_unmarshal
```

```Go
func ExampleRawMessage_unmarshal()
```

This example uses RawMessage to delay parsing part of a JSON message. 

### <a id="ExampleRawMessage_marshal" href="#ExampleRawMessage_marshal">func ExampleRawMessage_marshal()</a>

```
searchKey: json_test.ExampleRawMessage_marshal
```

```Go
func ExampleRawMessage_marshal()
```

This example uses RawMessage to use a precomputed JSON during marshal. 

### <a id="ExampleIndent" href="#ExampleIndent">func ExampleIndent()</a>

```
searchKey: json_test.ExampleIndent
```

```Go
func ExampleIndent()
```

### <a id="ExampleMarshalIndent" href="#ExampleMarshalIndent">func ExampleMarshalIndent()</a>

```
searchKey: json_test.ExampleMarshalIndent
```

```Go
func ExampleMarshalIndent()
```

### <a id="ExampleValid" href="#ExampleValid">func ExampleValid()</a>

```
searchKey: json_test.ExampleValid
```

```Go
func ExampleValid()
```

### <a id="ExampleHTMLEscape" href="#ExampleHTMLEscape">func ExampleHTMLEscape()</a>

```
searchKey: json_test.ExampleHTMLEscape
```

```Go
func ExampleHTMLEscape()
```

### <a id="Example_textMarshalJSON" href="#Example_textMarshalJSON">func Example_textMarshalJSON()</a>

```
searchKey: json_test.Example_textMarshalJSON
```

```Go
func Example_textMarshalJSON()
```
