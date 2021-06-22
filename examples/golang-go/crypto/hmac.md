# Package hmac

Package hmac implements the Keyed-Hash Message Authentication Code (HMAC) as defined in U.S. Federal Information Processing Standards Publication 198. An HMAC is a cryptographic hash that uses a key to sign a message. The receiver verifies the hash by recomputing it using the same key. 

Receivers should be careful to use Equal to compare MACs in order to avoid timing side-channels: 

```
// ValidMAC reports whether messageMAC is a valid HMAC tag for message.
func ValidMAC(message, messageMAC, key []byte) bool {
	mac := hmac.New(sha256.New, key)
	mac.Write(message)
	expectedMAC := mac.Sum(nil)
	return hmac.Equal(messageMAC, expectedMAC)
}

```
## Index

* [Variables](#var)
    * [var hmacTests](#hmacTests)
* [Types](#type)
    * [type marshalable interface](#marshalable)
    * [type hmac struct](#hmac)
        * [func (h *hmac) Sum(in []byte) []byte](#hmac.Sum)
        * [func (h *hmac) Write(p []byte) (n int, err error)](#hmac.Write)
        * [func (h *hmac) Size() int](#hmac.Size)
        * [func (h *hmac) BlockSize() int](#hmac.BlockSize)
        * [func (h *hmac) Reset()](#hmac.Reset)
    * [type hmacTest struct](#hmacTest)
    * [type justHash struct](#justHash)
* [Functions](#func)
    * [func New(h func() hash.Hash, key []byte) hash.Hash](#New)
    * [func Equal(mac1, mac2 []byte) bool](#Equal)
    * [func TestHMAC(t *testing.T)](#TestHMAC)
    * [func TestNonUniqueHash(t *testing.T)](#TestNonUniqueHash)
    * [func TestEqual(t *testing.T)](#TestEqual)
    * [func BenchmarkHMACSHA256_1K(b *testing.B)](#BenchmarkHMACSHA256_1K)
    * [func BenchmarkHMACSHA256_32(b *testing.B)](#BenchmarkHMACSHA256_32)
    * [func BenchmarkNewWriteSum(b *testing.B)](#BenchmarkNewWriteSum)


## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="hmacTests" href="#hmacTests">var hmacTests</a>

```
searchKey: hmac.hmacTests
```

```Go
var hmacTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="marshalable" href="#marshalable">type marshalable interface</a>

```
searchKey: hmac.marshalable
```

```Go
type marshalable interface {
	MarshalBinary() ([]byte, error)
	UnmarshalBinary([]byte) error
}
```

Marshalable is the combination of encoding.BinaryMarshaler and encoding.BinaryUnmarshaler. Their method definitions are repeated here to avoid a dependency on the encoding package. 

### <a id="hmac" href="#hmac">type hmac struct</a>

```
searchKey: hmac.hmac
```

```Go
type hmac struct {
	opad, ipad   []byte
	outer, inner hash.Hash

	// If marshaled is true, then opad and ipad do not contain a padded
	// copy of the key, but rather the marshaled state of outer/inner after
	// opad/ipad has been fed into it.
	marshaled bool
}
```

#### <a id="hmac.Sum" href="#hmac.Sum">func (h *hmac) Sum(in []byte) []byte</a>

```
searchKey: hmac.hmac.Sum
```

```Go
func (h *hmac) Sum(in []byte) []byte
```

#### <a id="hmac.Write" href="#hmac.Write">func (h *hmac) Write(p []byte) (n int, err error)</a>

```
searchKey: hmac.hmac.Write
```

```Go
func (h *hmac) Write(p []byte) (n int, err error)
```

#### <a id="hmac.Size" href="#hmac.Size">func (h *hmac) Size() int</a>

```
searchKey: hmac.hmac.Size
```

```Go
func (h *hmac) Size() int
```

#### <a id="hmac.BlockSize" href="#hmac.BlockSize">func (h *hmac) BlockSize() int</a>

```
searchKey: hmac.hmac.BlockSize
```

```Go
func (h *hmac) BlockSize() int
```

#### <a id="hmac.Reset" href="#hmac.Reset">func (h *hmac) Reset()</a>

```
searchKey: hmac.hmac.Reset
```

```Go
func (h *hmac) Reset()
```

### <a id="hmacTest" href="#hmacTest">type hmacTest struct</a>

```
searchKey: hmac.hmacTest
```

```Go
type hmacTest struct {
	hash      func() hash.Hash
	key       []byte
	in        []byte
	out       string
	size      int
	blocksize int
}
```

### <a id="justHash" href="#justHash">type justHash struct</a>

```
searchKey: hmac.justHash
```

```Go
type justHash struct {
	hash.Hash
}
```

justHash implements just the hash.Hash methods and nothing else 

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="New" href="#New">func New(h func() hash.Hash, key []byte) hash.Hash</a>

```
searchKey: hmac.New
tags: [exported]
```

```Go
func New(h func() hash.Hash, key []byte) hash.Hash
```

New returns a new HMAC hash using the given hash.Hash type and key. New functions like sha256.New from crypto/sha256 can be used as h. h must return a new Hash every time it is called. Note that unlike other hash implementations in the standard library, the returned Hash does not implement encoding.BinaryMarshaler or encoding.BinaryUnmarshaler. 

### <a id="Equal" href="#Equal">func Equal(mac1, mac2 []byte) bool</a>

```
searchKey: hmac.Equal
tags: [exported]
```

```Go
func Equal(mac1, mac2 []byte) bool
```

Equal compares two MACs for equality without leaking timing information. 

### <a id="TestHMAC" href="#TestHMAC">func TestHMAC(t *testing.T)</a>

```
searchKey: hmac.TestHMAC
```

```Go
func TestHMAC(t *testing.T)
```

### <a id="TestNonUniqueHash" href="#TestNonUniqueHash">func TestNonUniqueHash(t *testing.T)</a>

```
searchKey: hmac.TestNonUniqueHash
```

```Go
func TestNonUniqueHash(t *testing.T)
```

### <a id="TestEqual" href="#TestEqual">func TestEqual(t *testing.T)</a>

```
searchKey: hmac.TestEqual
```

```Go
func TestEqual(t *testing.T)
```

### <a id="BenchmarkHMACSHA256_1K" href="#BenchmarkHMACSHA256_1K">func BenchmarkHMACSHA256_1K(b *testing.B)</a>

```
searchKey: hmac.BenchmarkHMACSHA256_1K
```

```Go
func BenchmarkHMACSHA256_1K(b *testing.B)
```

### <a id="BenchmarkHMACSHA256_32" href="#BenchmarkHMACSHA256_32">func BenchmarkHMACSHA256_32(b *testing.B)</a>

```
searchKey: hmac.BenchmarkHMACSHA256_32
```

```Go
func BenchmarkHMACSHA256_32(b *testing.B)
```

### <a id="BenchmarkNewWriteSum" href="#BenchmarkNewWriteSum">func BenchmarkNewWriteSum(b *testing.B)</a>

```
searchKey: hmac.BenchmarkNewWriteSum
```

```Go
func BenchmarkNewWriteSum(b *testing.B)
```

