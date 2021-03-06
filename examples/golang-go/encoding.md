# Package encoding

Package encoding defines interfaces shared by other packages that convert data to and from byte-level and textual representations. Packages that check for these interfaces include encoding/gob, encoding/json, and encoding/xml. As a result, implementing an interface once can make a type useful in multiple encodings. Standard types that implement these interfaces include time.Time and net.IP. The interfaces come in pairs that produce and consume encoded data. 

## Index

* Subpages
  * [encoding/ascii85](encoding/ascii85.md)
  * [encoding/asn1](encoding/asn1.md)
  * [encoding/base32](encoding/base32.md)
  * [encoding/base32_test](encoding/base32_test.md)
  * [encoding/base64](encoding/base64.md)
  * [encoding/base64_test](encoding/base64_test.md)
  * [encoding/binary](encoding/binary.md)
  * [encoding/binary_test](encoding/binary_test.md)
  * [encoding/csv](encoding/csv.md)
  * [encoding/csv_test](encoding/csv_test.md)
  * [encoding/gob](encoding/gob.md)
  * [encoding/gob_test](encoding/gob_test.md)
  * [encoding/hex](encoding/hex.md)
  * [encoding/hex_test](encoding/hex_test.md)
  * [encoding/json](encoding/json.md)
  * [encoding/json_test](encoding/json_test.md)
  * [encoding/pem](encoding/pem.md)
  * [encoding/pem_test](encoding/pem_test.md)
  * [encoding/xml](encoding/xml.md)
  * [encoding/xml_test](encoding/xml_test.md)
* [Types](#type)
    * [type BinaryMarshaler interface](#BinaryMarshaler)
    * [type BinaryUnmarshaler interface](#BinaryUnmarshaler)
    * [type TextMarshaler interface](#TextMarshaler)
    * [type TextUnmarshaler interface](#TextUnmarshaler)


## <a id="type" href="#type">Types</a>

### <a id="BinaryMarshaler" href="#BinaryMarshaler">type BinaryMarshaler interface</a>

```
searchKey: encoding.BinaryMarshaler
tags: [interface]
```

```Go
type BinaryMarshaler interface {
	MarshalBinary() (data []byte, err error)
}
```

BinaryMarshaler is the interface implemented by an object that can marshal itself into a binary form. 

MarshalBinary encodes the receiver into a binary form and returns the result. 

### <a id="BinaryUnmarshaler" href="#BinaryUnmarshaler">type BinaryUnmarshaler interface</a>

```
searchKey: encoding.BinaryUnmarshaler
tags: [interface]
```

```Go
type BinaryUnmarshaler interface {
	UnmarshalBinary(data []byte) error
}
```

BinaryUnmarshaler is the interface implemented by an object that can unmarshal a binary representation of itself. 

UnmarshalBinary must be able to decode the form generated by MarshalBinary. UnmarshalBinary must copy the data if it wishes to retain the data after returning. 

### <a id="TextMarshaler" href="#TextMarshaler">type TextMarshaler interface</a>

```
searchKey: encoding.TextMarshaler
tags: [interface]
```

```Go
type TextMarshaler interface {
	MarshalText() (text []byte, err error)
}
```

TextMarshaler is the interface implemented by an object that can marshal itself into a textual form. 

MarshalText encodes the receiver into UTF-8-encoded text and returns the result. 

### <a id="TextUnmarshaler" href="#TextUnmarshaler">type TextUnmarshaler interface</a>

```
searchKey: encoding.TextUnmarshaler
tags: [interface]
```

```Go
type TextUnmarshaler interface {
	UnmarshalText(text []byte) error
}
```

TextUnmarshaler is the interface implemented by an object that can unmarshal a textual representation of itself. 

UnmarshalText must be able to decode the form generated by MarshalText. UnmarshalText must copy the text if it wishes to retain the text after returning. 

