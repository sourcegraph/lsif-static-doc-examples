# Package rcache

## Index

* [Constants](#const)
    * [const DefaultMutexDelay](#DefaultMutexDelay)
    * [const DefaultMutexExpiry](#DefaultMutexExpiry)
    * [const DefaultMutexTries](#DefaultMutexTries)
    * [const dataVersion](#dataVersion)
    * [const dataVersionToDelete](#dataVersionToDelete)
* [Variables](#var)
    * [var deleteBatchSize](#deleteBatchSize)
    * [var globalPrefix](#globalPrefix)
    * [var pool](#pool)
* [Types](#type)
    * [type Cache struct](#Cache)
        * [func New(keyPrefix string) *Cache](#New)
        * [func NewWithTTL(keyPrefix string, ttlSeconds int) *Cache](#NewWithTTL)
        * [func (r *Cache) Delete(key string)](#Cache.Delete)
        * [func (r *Cache) Get(key string) ([]byte, bool)](#Cache.Get)
        * [func (r *Cache) GetMulti(keys ...string) [][]byte](#Cache.GetMulti)
        * [func (r *Cache) Set(key string, b []byte)](#Cache.Set)
        * [func (r *Cache) SetMulti(keyvals ...[2]string)](#Cache.SetMulti)
        * [func (r *Cache) rkeyPrefix() string](#Cache.rkeyPrefix)
    * [type MutexOptions struct](#MutexOptions)
    * [type TB interface](#TB)
* [Functions](#func)
    * [func DeleteOldCacheData(c redis.Conn) error](#DeleteOldCacheData)
    * [func SetupForTest(t TB)](#SetupForTest)
    * [func TestCache_deleteKeysWithPrefix(t *testing.T)](#TestCache_deleteKeysWithPrefix)
    * [func TestCache_multi(t *testing.T)](#TestCache_multi)
    * [func TestCache_namespace(t *testing.T)](#TestCache_namespace)
    * [func TestCache_simple(t *testing.T)](#TestCache_simple)
    * [func TestTryAcquireMutex(t *testing.T)](#TestTryAcquireMutex)
    * [func TryAcquireMutex(ctx context.Context, name string, options MutexOptions) (context.Context, func(), bool)](#TryAcquireMutex)
    * [func bytes(s ...string) [][]byte](#bytes)
    * [func deleteKeysWithPrefix(c redis.Conn, prefix string) error](#deleteKeysWithPrefix)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="DefaultMutexDelay" href="#DefaultMutexDelay">const DefaultMutexDelay</a>

```
searchKey: rcache.DefaultMutexDelay
tags: [constant number]
```

```Go
const DefaultMutexDelay = 512 * time.Millisecond
```

### <a id="DefaultMutexExpiry" href="#DefaultMutexExpiry">const DefaultMutexExpiry</a>

```
searchKey: rcache.DefaultMutexExpiry
tags: [constant number]
```

```Go
const DefaultMutexExpiry = time.Minute
```

### <a id="DefaultMutexTries" href="#DefaultMutexTries">const DefaultMutexTries</a>

```
searchKey: rcache.DefaultMutexTries
tags: [constant number]
```

```Go
const DefaultMutexTries = 3
```

We make it low since we want to give up quickly. Failing to acquire the lock will be unrelated to failing to reach quorum. 

### <a id="dataVersion" href="#dataVersion">const dataVersion</a>

```
searchKey: rcache.dataVersion
tags: [constant string private]
```

```Go
const dataVersion = "v2"
```

dataVersion is used for releases that change type structure for data that may already be cached. Increasing this number will change the key prefix that is used for all hash keys, effectively resetting the cache at the same time the new code is deployed. 

### <a id="dataVersionToDelete" href="#dataVersionToDelete">const dataVersionToDelete</a>

```
searchKey: rcache.dataVersionToDelete
tags: [constant string private]
```

```Go
const dataVersionToDelete = "v1"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="deleteBatchSize" href="#deleteBatchSize">var deleteBatchSize</a>

```
searchKey: rcache.deleteBatchSize
tags: [variable number private]
```

```Go
var deleteBatchSize = 5000
```

The number of keys to delete per batch. The maximum number of keys that can be unpacked is determined by the Lua config LUAI_MAXCSTACK which is 8000 by default. See [https://www.lua.org/source/5.1/luaconf.h.html](https://www.lua.org/source/5.1/luaconf.h.html) 

### <a id="globalPrefix" href="#globalPrefix">var globalPrefix</a>

```
searchKey: rcache.globalPrefix
tags: [variable string private]
```

```Go
var globalPrefix = dataVersion
```

### <a id="pool" href="#pool">var pool</a>

```
searchKey: rcache.pool
tags: [variable struct private]
```

```Go
var pool = redispool.Cache
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Cache" href="#Cache">type Cache struct</a>

```
searchKey: rcache.Cache
tags: [struct]
```

```Go
type Cache struct {
	keyPrefix  string
	ttlSeconds int
}
```

Cache implements httpcache.Cache 

#### <a id="New" href="#New">func New(keyPrefix string) *Cache</a>

```
searchKey: rcache.New
tags: [function]
```

```Go
func New(keyPrefix string) *Cache
```

New creates a redis backed Cache 

#### <a id="NewWithTTL" href="#NewWithTTL">func NewWithTTL(keyPrefix string, ttlSeconds int) *Cache</a>

```
searchKey: rcache.NewWithTTL
tags: [function]
```

```Go
func NewWithTTL(keyPrefix string, ttlSeconds int) *Cache
```

NewWithTTL creates a redis backed Cache which expires values after ttlSeconds. 

#### <a id="Cache.Delete" href="#Cache.Delete">func (r *Cache) Delete(key string)</a>

```
searchKey: rcache.Cache.Delete
tags: [method]
```

```Go
func (r *Cache) Delete(key string)
```

Delete implements httpcache.Cache.Delete 

#### <a id="Cache.Get" href="#Cache.Get">func (r *Cache) Get(key string) ([]byte, bool)</a>

```
searchKey: rcache.Cache.Get
tags: [method]
```

```Go
func (r *Cache) Get(key string) ([]byte, bool)
```

Get implements httpcache.Cache.Get 

#### <a id="Cache.GetMulti" href="#Cache.GetMulti">func (r *Cache) GetMulti(keys ...string) [][]byte</a>

```
searchKey: rcache.Cache.GetMulti
tags: [method]
```

```Go
func (r *Cache) GetMulti(keys ...string) [][]byte
```

#### <a id="Cache.Set" href="#Cache.Set">func (r *Cache) Set(key string, b []byte)</a>

```
searchKey: rcache.Cache.Set
tags: [method]
```

```Go
func (r *Cache) Set(key string, b []byte)
```

Set implements httpcache.Cache.Set 

#### <a id="Cache.SetMulti" href="#Cache.SetMulti">func (r *Cache) SetMulti(keyvals ...[2]string)</a>

```
searchKey: rcache.Cache.SetMulti
tags: [method]
```

```Go
func (r *Cache) SetMulti(keyvals ...[2]string)
```

#### <a id="Cache.rkeyPrefix" href="#Cache.rkeyPrefix">func (r *Cache) rkeyPrefix() string</a>

```
searchKey: rcache.Cache.rkeyPrefix
tags: [method private]
```

```Go
func (r *Cache) rkeyPrefix() string
```

rkeyPrefix generates the actual key prefix we use on redis. 

### <a id="MutexOptions" href="#MutexOptions">type MutexOptions struct</a>

```
searchKey: rcache.MutexOptions
tags: [struct]
```

```Go
type MutexOptions struct {
	// Expiry sets how long a lock should be held. Under normal
	// operation it will be extended on an interval of (Expiry / 2)
	Expiry time.Duration
	// Tries is how many tries we have before we give up acquiring a
	// lock.
	Tries int
	// RetryDelay is how long to sleep between attempts to lock
	RetryDelay time.Duration
}
```

MutexOptions hold options passed to TryAcquireMutex. It is safe to pass zero values in which case defaults will be used instead. 

### <a id="TB" href="#TB">type TB interface</a>

```
searchKey: rcache.TB
tags: [interface]
```

```Go
type TB interface {
	Name() string
	Skip(args ...interface{})
	Helper()
}
```

TB is a subset of testing.TB 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="DeleteOldCacheData" href="#DeleteOldCacheData">func DeleteOldCacheData(c redis.Conn) error</a>

```
searchKey: rcache.DeleteOldCacheData
tags: [function]
```

```Go
func DeleteOldCacheData(c redis.Conn) error
```

DeleteOldCacheData deletes the rcache data in the given Redis instance that's prefixed with dataVersionToDelete 

### <a id="SetupForTest" href="#SetupForTest">func SetupForTest(t TB)</a>

```
searchKey: rcache.SetupForTest
tags: [function]
```

```Go
func SetupForTest(t TB)
```

SetupForTest adjusts the globalPrefix and clears it out. You will have conflicts if you do `t.Parallel()` 

### <a id="TestCache_deleteKeysWithPrefix" href="#TestCache_deleteKeysWithPrefix">func TestCache_deleteKeysWithPrefix(t *testing.T)</a>

```
searchKey: rcache.TestCache_deleteKeysWithPrefix
tags: [function private test]
```

```Go
func TestCache_deleteKeysWithPrefix(t *testing.T)
```

### <a id="TestCache_multi" href="#TestCache_multi">func TestCache_multi(t *testing.T)</a>

```
searchKey: rcache.TestCache_multi
tags: [function private test]
```

```Go
func TestCache_multi(t *testing.T)
```

### <a id="TestCache_namespace" href="#TestCache_namespace">func TestCache_namespace(t *testing.T)</a>

```
searchKey: rcache.TestCache_namespace
tags: [function private test]
```

```Go
func TestCache_namespace(t *testing.T)
```

### <a id="TestCache_simple" href="#TestCache_simple">func TestCache_simple(t *testing.T)</a>

```
searchKey: rcache.TestCache_simple
tags: [function private test]
```

```Go
func TestCache_simple(t *testing.T)
```

### <a id="TestTryAcquireMutex" href="#TestTryAcquireMutex">func TestTryAcquireMutex(t *testing.T)</a>

```
searchKey: rcache.TestTryAcquireMutex
tags: [function private test]
```

```Go
func TestTryAcquireMutex(t *testing.T)
```

### <a id="TryAcquireMutex" href="#TryAcquireMutex">func TryAcquireMutex(ctx context.Context, name string, options MutexOptions) (context.Context, func(), bool)</a>

```
searchKey: rcache.TryAcquireMutex
tags: [function]
```

```Go
func TryAcquireMutex(ctx context.Context, name string, options MutexOptions) (context.Context, func(), bool)
```

TryAcquireMutex tries to Lock a distributed mutex. If the mutex is already locked, it will return `ctx, nil, false`. Otherwise it returns `ctx, release, true`. Release must be called to free the lock. The lock has a 1 minute lifetime, but a background routine extends it every 30 seconds. If, on release, we are unable to unlock the mutex it will continue to be locked until it is expired by Redis. The returned context will be cancelled if any of the following occur: * The parent context in cancelled * The release function is called * There is an error extending the lock expiry or the expiry can't be extended because 

```
they key no longer exists in Redis

```
A caller can therefore assume that they are the sole holder of the lock as long as the context has not been cancelled. 

### <a id="bytes" href="#bytes">func bytes(s ...string) [][]byte</a>

```
searchKey: rcache.bytes
tags: [function private]
```

```Go
func bytes(s ...string) [][]byte
```

### <a id="deleteKeysWithPrefix" href="#deleteKeysWithPrefix">func deleteKeysWithPrefix(c redis.Conn, prefix string) error</a>

```
searchKey: rcache.deleteKeysWithPrefix
tags: [function private]
```

```Go
func deleteKeysWithPrefix(c redis.Conn, prefix string) error
```

