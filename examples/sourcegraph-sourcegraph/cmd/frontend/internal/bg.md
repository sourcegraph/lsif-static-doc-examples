# Package bg

Package bg defines init and background tasks. 

Because there can be multiple frontend processes running, these tasks must be idempotent and not racy amid concurrent frontend processes. 

## Index

* [Constants](#const)
    * [const recommendedPolicy](#recommendedPolicy)
* [Functions](#func)
    * [func CheckRedisCacheEvictionPolicy()](#CheckRedisCacheEvictionPolicy)
    * [func DeleteOldCacheDataInRedis()](#DeleteOldCacheDataInRedis)
    * [func DeleteOldEventLogsInPostgres(ctx context.Context, db dbutil.DB)](#DeleteOldEventLogsInPostgres)
    * [func DeleteOldSecurityEventLogsInPostgres(ctx context.Context, db dbutil.DB)](#DeleteOldSecurityEventLogsInPostgres)
    * [func getRunID(c redis.Conn) (string, error)](#getRunID)
    * [func init()](#init.db_test.go)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="recommendedPolicy" href="#recommendedPolicy">const recommendedPolicy</a>

```
searchKey: bg.recommendedPolicy
tags: [constant string private]
```

```Go
const recommendedPolicy = "allkeys-lru"
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="CheckRedisCacheEvictionPolicy" href="#CheckRedisCacheEvictionPolicy">func CheckRedisCacheEvictionPolicy()</a>

```
searchKey: bg.CheckRedisCacheEvictionPolicy
tags: [function]
```

```Go
func CheckRedisCacheEvictionPolicy()
```

### <a id="DeleteOldCacheDataInRedis" href="#DeleteOldCacheDataInRedis">func DeleteOldCacheDataInRedis()</a>

```
searchKey: bg.DeleteOldCacheDataInRedis
tags: [function]
```

```Go
func DeleteOldCacheDataInRedis()
```

### <a id="DeleteOldEventLogsInPostgres" href="#DeleteOldEventLogsInPostgres">func DeleteOldEventLogsInPostgres(ctx context.Context, db dbutil.DB)</a>

```
searchKey: bg.DeleteOldEventLogsInPostgres
tags: [function]
```

```Go
func DeleteOldEventLogsInPostgres(ctx context.Context, db dbutil.DB)
```

### <a id="DeleteOldSecurityEventLogsInPostgres" href="#DeleteOldSecurityEventLogsInPostgres">func DeleteOldSecurityEventLogsInPostgres(ctx context.Context, db dbutil.DB)</a>

```
searchKey: bg.DeleteOldSecurityEventLogsInPostgres
tags: [function]
```

```Go
func DeleteOldSecurityEventLogsInPostgres(ctx context.Context, db dbutil.DB)
```

### <a id="getRunID" href="#getRunID">func getRunID(c redis.Conn) (string, error)</a>

```
searchKey: bg.getRunID
tags: [function private]
```

```Go
func getRunID(c redis.Conn) (string, error)
```

### <a id="init.db_test.go" href="#init.db_test.go">func init()</a>

```
searchKey: bg.init
tags: [function private]
```

```Go
func init()
```

