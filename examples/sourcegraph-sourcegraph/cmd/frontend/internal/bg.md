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
    * [func init()](#init.db_test.go)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="recommendedPolicy" href="#recommendedPolicy">const recommendedPolicy</a>

```
searchKey: bg.recommendedPolicy
tags: [private]
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
```

```Go
func CheckRedisCacheEvictionPolicy()
```

### <a id="getRunID" href="#getRunID">func getRunID(c redis.Conn) (string, error)</a>

```
searchKey: bg.getRunID
tags: [private]
```

```Go
func getRunID(c redis.Conn) (string, error)
```

### <a id="DeleteOldCacheDataInRedis" href="#DeleteOldCacheDataInRedis">func DeleteOldCacheDataInRedis()</a>

```
searchKey: bg.DeleteOldCacheDataInRedis
```

```Go
func DeleteOldCacheDataInRedis()
```

### <a id="DeleteOldEventLogsInPostgres" href="#DeleteOldEventLogsInPostgres">func DeleteOldEventLogsInPostgres(ctx context.Context, db dbutil.DB)</a>

```
searchKey: bg.DeleteOldEventLogsInPostgres
```

```Go
func DeleteOldEventLogsInPostgres(ctx context.Context, db dbutil.DB)
```

### <a id="DeleteOldSecurityEventLogsInPostgres" href="#DeleteOldSecurityEventLogsInPostgres">func DeleteOldSecurityEventLogsInPostgres(ctx context.Context, db dbutil.DB)</a>

```
searchKey: bg.DeleteOldSecurityEventLogsInPostgres
```

```Go
func DeleteOldSecurityEventLogsInPostgres(ctx context.Context, db dbutil.DB)
```

### <a id="init.db_test.go" href="#init.db_test.go">func init()</a>

```
searchKey: bg.init
tags: [private]
```

```Go
func init()
```

