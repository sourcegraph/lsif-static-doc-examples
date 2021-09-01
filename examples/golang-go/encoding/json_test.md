# Package json_test

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
        * [func (a Animal) MarshalJSON() ([]byte, error)](#Animal.MarshalJSON)
        * [func (a *Animal) UnmarshalJSON(b []byte) error](#Animal.UnmarshalJSON)
    * [type Size int](#Size)
        * [func (s Size) MarshalText() ([]byte, error)](#Size.MarshalText)
        * [func (s *Size) UnmarshalText(text []byte) error](#Size.UnmarshalText)
* [Functions](#func)
    * [func ExampleDecoder()](#ExampleDecoder)
    * [func ExampleDecoder_Decode_stream()](#ExampleDecoder_Decode_stream)
    * [func ExampleDecoder_Token()](#ExampleDecoder_Token)
    * [func ExampleHTMLEscape()](#ExampleHTMLEscape)
    * [func ExampleIndent()](#ExampleIndent)
    * [func ExampleMarshal()](#ExampleMarshal)
    * [func ExampleMarshalIndent()](#ExampleMarshalIndent)
    * [func ExampleRawMessage_marshal()](#ExampleRawMessage_marshal)
    * [func ExampleRawMessage_unmarshal()](#ExampleRawMessage_unmarshal)
    * [func ExampleUnmarshal()](#ExampleUnmarshal)
    * [func ExampleValid()](#ExampleValid)
    * [func Example_customMarshalJSON()](#Example_customMarshalJSON)
    * [func Example_textMarshalJSON()](#Example_textMarshalJSON)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="Gopher" href="#Gopher">const Gopher</a>

```
searchKey: json_test.Gopher
tags: [constant number private]
```

```Go
const Gopher
```

### <a id="Large" href="#Large">const Large</a>

```
searchKey: json_test.Large
tags: [constant number private]
```

```Go
const Large
```

### <a id="Small" href="#Small">const Small</a>

```
searchKey: json_test.Small
tags: [constant number private]
```

```Go
const Small
```

### <a id="Unknown" href="#Unknown">const Unknown</a>

```
searchKey: json_test.Unknown
tags: [constant number private]
```

```Go
const Unknown Animal = iota
```

### <a id="Unrecognized" href="#Unrecognized">const Unrecognized</a>

```
searchKey: json_test.Unrecognized
tags: [constant number private]
```

```Go
const Unrecognized Size = iota
```

### <a id="Zebra" href="#Zebra">const Zebra</a>

```
searchKey: json_test.Zebra
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
searchKey: json_test.Animal
tags: [number private]
```

```Go
type Animal int
```

#### <a id="Animal.MarshalJSON" href="#Animal.MarshalJSON">func (a Animal) MarshalJSON() ([]byte, error)</a>

```
searchKey: json_test.Animal.MarshalJSON
tags: [method private]
```

```Go
func (a Animal) MarshalJSON() ([]byte, error)
```

#### <a id="Animal.UnmarshalJSON" href="#Animal.UnmarshalJSON">func (a *Animal) UnmarshalJSON(b []byte) error</a>

```
searchKey: json_test.Animal.UnmarshalJSON
tags: [method private]
```

```Go
func (a *Animal) UnmarshalJSON(b []byte) error
```

### <a id="Size" href="#Size">type Size int</a>

```
searchKey: json_test.Size
tags: [number private]
```

```Go
type Size int
```

#### <a id="Size.MarshalText" href="#Size.MarshalText">func (s Size) MarshalText() ([]byte, error)</a>

```
searchKey: json_test.Size.MarshalText
tags: [method private]
```

```Go
func (s Size) MarshalText() ([]byte, error)
```

#### <a id="Size.UnmarshalText" href="#Size.UnmarshalText">func (s *Size) UnmarshalText(text []byte) error</a>

```
searchKey: json_test.Size.UnmarshalText
tags: [method private]
```

```Go
func (s *Size) UnmarshalText(text []byte) error
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ExampleDecoder" href="#ExampleDecoder">func ExampleDecoder()</a>

```
searchKey: json_test.ExampleDecoder
tags: [function private]
```

```Go
func ExampleDecoder()
```

This example uses a Decoder to decode a stream of distinct JSON values. 

### <a id="ExampleDecoder_Decode_stream" href="#ExampleDecoder_Decode_stream">func ExampleDecoder_Decode_stream()</a>

```
searchKey: json_test.ExampleDecoder_Decode_stream
tags: [function private]
```

```Go
func ExampleDecoder_Decode_stream()
```

This example uses a Decoder to decode a streaming array of JSON objects. 

### <a id="ExampleDecoder_Token" href="#ExampleDecoder_Token">func ExampleDecoder_Token()</a>

```
searchKey: json_test.ExampleDecoder_Token
tags: [function private]
```

```Go
func ExampleDecoder_Token()
```

This example uses a Decoder to decode a stream of distinct JSON values. 

### <a id="ExampleHTMLEscape" href="#ExampleHTMLEscape">func ExampleHTMLEscape()</a>

```
searchKey: json_test.ExampleHTMLEscape
tags: [function private]
```

```Go
func ExampleHTMLEscape()
```

### <a id="ExampleIndent" href="#ExampleIndent">func ExampleIndent()</a>

```
searchKey: json_test.ExampleIndent
tags: [function private]
```

```Go
func ExampleIndent()
```

### <a id="ExampleMarshal" href="#ExampleMarshal">func ExampleMarshal()</a>

```
searchKey: json_test.ExampleMarshal
tags: [function private]
```

```Go
func ExampleMarshal()
```

### <a id="ExampleMarshalIndent" href="#ExampleMarshalIndent">func ExampleMarshalIndent()</a>

```
searchKey: json_test.ExampleMarshalIndent
tags: [function private]
```

```Go
func ExampleMarshalIndent()
```

### <a id="ExampleRawMessage_marshal" href="#ExampleRawMessage_marshal">func ExampleRawMessage_marshal()</a>

```
searchKey: json_test.ExampleRawMessage_marshal
tags: [function private]
```

```Go
func ExampleRawMessage_marshal()
```

This example uses RawMessage to use a precomputed JSON during marshal. 

### <a id="ExampleRawMessage_unmarshal" href="#ExampleRawMessage_unmarshal">func ExampleRawMessage_unmarshal()</a>

```
searchKey: json_test.ExampleRawMessage_unmarshal
tags: [function private]
```

```Go
func ExampleRawMessage_unmarshal()
```

This example uses RawMessage to delay parsing part of a JSON message. 

### <a id="ExampleUnmarshal" href="#ExampleUnmarshal">func ExampleUnmarshal()</a>

```
searchKey: json_test.ExampleUnmarshal
tags: [function private]
```

```Go
func ExampleUnmarshal()
```

### <a id="ExampleValid" href="#ExampleValid">func ExampleValid()</a>

```
searchKey: json_test.ExampleValid
tags: [function private]
```

```Go
func ExampleValid()
```

### <a id="Example_customMarshalJSON" href="#Example_customMarshalJSON">func Example_customMarshalJSON()</a>

```
searchKey: json_test.Example_customMarshalJSON
tags: [function private]
```

```Go
func Example_customMarshalJSON()
```

### <a id="Example_textMarshalJSON" href="#Example_textMarshalJSON">func Example_textMarshalJSON()</a>

```
searchKey: json_test.Example_textMarshalJSON
tags: [function private]
```

```Go
func Example_textMarshalJSON()
```

