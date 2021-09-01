# Package hash

Package hash provides interfaces for hash functions. 

## Index

* Subpages
  * [hash/adler32](hash/adler32.md)
  * [hash/crc32](hash/crc32.md)
  * [hash/crc32_test](hash/crc32_test.md)
  * [hash/crc64](hash/crc64.md)
  * [hash/fnv](hash/fnv.md)
  * [hash/maphash](hash/maphash.md)
  * [hash/maphash_test](hash/maphash_test.md)
* [Types](#type)
    * [type Hash interface](#Hash)
    * [type Hash32 interface](#Hash32)
    * [type Hash64 interface](#Hash64)


## <a id="type" href="#type">Types</a>

### <a id="Hash" href="#Hash">type Hash interface</a>

```
searchKey: hash.Hash
tags: [interface]
```

```Go
type Hash interface {
	// Write (via the embedded io.Writer interface) adds more data to the running hash.
	// It never returns an error.
	io.Writer

	// Sum appends the current hash to b and returns the resulting slice.
	// It does not change the underlying hash state.
	Sum(b []byte) []byte

	// Reset resets the Hash to its initial state.
	Reset()

	// Size returns the number of bytes Sum will return.
	Size() int

	// BlockSize returns the hash's underlying block size.
	// The Write method must be able to accept any amount
	// of data, but it may operate more efficiently if all writes
	// are a multiple of the block size.
	BlockSize() int
}
```

Hash is the common interface implemented by all hash functions. 

Hash implementations in the standard library (e.g. hash/crc32 and crypto/sha256) implement the encoding.BinaryMarshaler and encoding.BinaryUnmarshaler interfaces. Marshaling a hash implementation allows its internal state to be saved and used for additional processing later, without having to re-write the data previously written to the hash. The hash state may contain portions of the input in its original form, which users are expected to handle for any possible security implications. 

Compatibility: Any future changes to hash or crypto packages will endeavor to maintain compatibility with state encoded using previous versions. That is, any released versions of the packages should be able to decode data written with any previously released version, subject to issues such as security fixes. See the Go compatibility document for background: [https://golang.org/doc/go1compat](https://golang.org/doc/go1compat) 

### <a id="Hash32" href="#Hash32">type Hash32 interface</a>

```
searchKey: hash.Hash32
tags: [interface]
```

```Go
type Hash32 interface {
	Hash
	Sum32() uint32
}
```

Hash32 is the common interface implemented by all 32-bit hash functions. 

### <a id="Hash64" href="#Hash64">type Hash64 interface</a>

```
searchKey: hash.Hash64
tags: [interface]
```

```Go
type Hash64 interface {
	Hash
	Sum64() uint64
}
```

Hash64 is the common interface implemented by all 64-bit hash functions. 

