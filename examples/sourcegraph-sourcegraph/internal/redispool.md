# Package redispool

Package redispool exports pools to specific redis instances. 

## Index

* [Variables](#var)
    * [var Cache](#Cache)
    * [var Store](#Store)
    * [var addrCache](#addrCache)
    * [var addrStore](#addrStore)
    * [var schemeMatcher](#schemeMatcher)
    * [var timeout](#timeout)
* [Functions](#func)
    * [func TestSchemeMatcher(t *testing.T)](#TestSchemeMatcher)
    * [func dialRedis(rawEndpoint string) (redis.Conn, error)](#dialRedis)
    * [func init()](#init.redispool.go)
    * [func init()](#init.sysreq.go)
    * [func redisCheck(name, addr string, timeout time.Duration, pool *redis.Pool) sysreq.CheckFunc](#redisCheck)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="Cache" href="#Cache">var Cache</a>

```
searchKey: redispool.Cache
tags: [variable struct]
```

```Go
var Cache = ...
```

Cache is a redis configured for caching. You usually want to use this. Only store data that can be recomputed here. Although this data is treated as ephemeral, Sourcegraph depends on it to operate performantly, so we persist in Redis to avoid cold starts, rather than having it in-memory only. 

In Kubernetes the service is called redis-cache. 

### <a id="Store" href="#Store">var Store</a>

```
searchKey: redispool.Store
tags: [variable struct]
```

```Go
var Store = ...
```

Store is a redis configured for persisting data. Do not abuse this pool, only use if you have data with a high write rate. 

In Kubernetes the service is called redis-store. 

### <a id="addrCache" href="#addrCache">var addrCache</a>

```
searchKey: redispool.addrCache
tags: [variable string private]
```

```Go
var addrCache string
```

addrCache is the network address of redis cache. 

### <a id="addrStore" href="#addrStore">var addrStore</a>

```
searchKey: redispool.addrStore
tags: [variable string private]
```

```Go
var addrStore string
```

addrStore is the network address of redis store. 

### <a id="schemeMatcher" href="#schemeMatcher">var schemeMatcher</a>

```
searchKey: redispool.schemeMatcher
tags: [variable struct private]
```

```Go
var schemeMatcher = lazyregexp.New(`^[A-Za-z][A-Za-z0-9\+\-\.]*://`)
```

### <a id="timeout" href="#timeout">var timeout</a>

```
searchKey: redispool.timeout
tags: [variable number private]
```

```Go
var timeout, _ = ...
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestSchemeMatcher" href="#TestSchemeMatcher">func TestSchemeMatcher(t *testing.T)</a>

```
searchKey: redispool.TestSchemeMatcher
tags: [function private test]
```

```Go
func TestSchemeMatcher(t *testing.T)
```

### <a id="dialRedis" href="#dialRedis">func dialRedis(rawEndpoint string) (redis.Conn, error)</a>

```
searchKey: redispool.dialRedis
tags: [function private]
```

```Go
func dialRedis(rawEndpoint string) (redis.Conn, error)
```

dialRedis dials Redis given the raw endpoint string. The string can have two formats: 1) If there is a HTTP scheme, it should be either be "redis://" or "rediss://" and the URL 

```
must be of the format specified in [https://www.iana.org/assignments/uri-schemes/prov/redis](https://www.iana.org/assignments/uri-schemes/prov/redis).

```
2) Otherwise, it is assumed to be of the format $HOSTNAME:$PORT. 

### <a id="init.redispool.go" href="#init.redispool.go">func init()</a>

```
searchKey: redispool.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.sysreq.go" href="#init.sysreq.go">func init()</a>

```
searchKey: redispool.init
tags: [function private]
```

```Go
func init()
```

### <a id="redisCheck" href="#redisCheck">func redisCheck(name, addr string, timeout time.Duration, pool *redis.Pool) sysreq.CheckFunc</a>

```
searchKey: redispool.redisCheck
tags: [function private]
```

```Go
func redisCheck(name, addr string, timeout time.Duration, pool *redis.Pool) sysreq.CheckFunc
```

