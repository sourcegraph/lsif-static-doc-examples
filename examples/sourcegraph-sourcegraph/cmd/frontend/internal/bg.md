# Package bg

Package bg defines init and background tasks. 

Because there can be multiple frontend processes running, these tasks must be idempotent and not racy amid concurrent frontend processes. 

## Index

* [Constants](#const)
    * [const recommendedPolicy](#recommendedPolicy)
* [Functions](#func)
    * [func CheckRedisCacheEvictionPolicy()](#CheckRedisCacheEvictionPolicy)
    * [func getRunID(c redis.Conn) (string, error)](#getRunID)
    * [func DeleteOldCacheDataInRedis()](#DeleteOldCacheDataInRedis)
    * [func DeleteOldEventLogsInPostgres(ctx context.Context, db dbutil.DB)](#DeleteOldEventLogsInPostgres)
    * [func DeleteOldSecurityEventLogsInPostgres(ctx context.Context, db dbutil.DB)](#DeleteOldSecurityEventLogsInPostgres)
    * [func init()](#init)


## <a id="const" href="#const">Constants</a>

### <a id="recommendedPolicy" href="#recommendedPolicy">const recommendedPolicy</a>

```
searchKey: bg.recommendedPolicy
```

```Go
const recommendedPolicy = "allkeys-lru"
```

## <a id="func" href="#func">Functions</a>

### <a id="CheckRedisCacheEvictionPolicy" href="#CheckRedisCacheEvictionPolicy">func CheckRedisCacheEvictionPolicy()</a>

```
searchKey: bg.CheckRedisCacheEvictionPolicy
tags: [exported]
```

```Go
func CheckRedisCacheEvictionPolicy()
```

### <a id="getRunID" href="#getRunID">func getRunID(c redis.Conn) (string, error)</a>

```
searchKey: bg.getRunID
```

```Go
func getRunID(c redis.Conn) (string, error)
```

### <a id="DeleteOldCacheDataInRedis" href="#DeleteOldCacheDataInRedis">func DeleteOldCacheDataInRedis()</a>

```
searchKey: bg.DeleteOldCacheDataInRedis
tags: [exported]
```

```Go
func DeleteOldCacheDataInRedis()
```

### <a id="DeleteOldEventLogsInPostgres" href="#DeleteOldEventLogsInPostgres">func DeleteOldEventLogsInPostgres(ctx context.Context, db dbutil.DB)</a>

```
searchKey: bg.DeleteOldEventLogsInPostgres
tags: [exported]
```

```Go
func DeleteOldEventLogsInPostgres(ctx context.Context, db dbutil.DB)
```

### <a id="DeleteOldSecurityEventLogsInPostgres" href="#DeleteOldSecurityEventLogsInPostgres">func DeleteOldSecurityEventLogsInPostgres(ctx context.Context, db dbutil.DB)</a>

```
searchKey: bg.DeleteOldSecurityEventLogsInPostgres
tags: [exported]
```

```Go
func DeleteOldSecurityEventLogsInPostgres(ctx context.Context, db dbutil.DB)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: bg.init
```

```Go
func init()
```

