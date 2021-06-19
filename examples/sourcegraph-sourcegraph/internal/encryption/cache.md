# Package cache

## Index

* [Types](#type)
    * [type Key struct](#Key)
        * [func New(k encryption.Key, size int) (*Key, error)](#New)
        * [func (k *Key) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)](#Key.Decrypt)
    * [type testKey struct](#testKey)
        * [func (k *testKey) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)](#testKey.Decrypt)
* [Functions](#func)
    * [func hash(v []byte) uint64](#hash)
    * [func TestCacheKey(t *testing.T)](#TestCacheKey)


## <a id="type" href="#type">Types</a>

### <a id="Key" href="#Key">type Key struct</a>

```
searchKey: cache.Key
tags: [exported]
```

```Go
type Key struct {
	encryption.Key

	cache *lru.Cache
}
```

Key provides an LRU cache wrapper for any encryption.Key implementation, caching the decrypted value based on the ciphertext passed. 

#### <a id="New" href="#New">func New(k encryption.Key, size int) (*Key, error)</a>

```
searchKey: cache.New
tags: [exported]
```

```Go
func New(k encryption.Key, size int) (*Key, error)
```

New returns a cache.Key with an LRU cache of `size` values, wrapping the passed key. 

#### <a id="Key.Decrypt" href="#Key.Decrypt">func (k *Key) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)</a>

```
searchKey: cache.Key.Decrypt
tags: [exported]
```

```Go
func (k *Key) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)
```

Decrypt attempts to find the decrypted ciphertext in the cache, if it is not found, the underlying key implementation is used, and the result is added to the cache. 

### <a id="testKey" href="#testKey">type testKey struct</a>

```
searchKey: cache.testKey
```

```Go
type testKey struct {
	encryption.Key
	fn func([]byte)
}
```

#### <a id="testKey.Decrypt" href="#testKey.Decrypt">func (k *testKey) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)</a>

```
searchKey: cache.testKey.Decrypt
```

```Go
func (k *testKey) Decrypt(ctx context.Context, ciphertext []byte) (*encryption.Secret, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="hash" href="#hash">func hash(v []byte) uint64</a>

```
searchKey: cache.hash
```

```Go
func hash(v []byte) uint64
```

### <a id="TestCacheKey" href="#TestCacheKey">func TestCacheKey(t *testing.T)</a>

```
searchKey: cache.TestCacheKey
```

```Go
func TestCacheKey(t *testing.T)
```

