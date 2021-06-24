# Package dbtesting

## Index

* [Functions](#func)
    * [func TimescaleDB(t testing.TB) (db *sql.DB, cleanup func())](#TimescaleDB)


## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="TimescaleDB" href="#TimescaleDB">func TimescaleDB(t testing.TB) (db *sql.DB, cleanup func())</a>

```
searchKey: dbtesting.TimescaleDB
tags: [method]
```

```Go
func TimescaleDB(t testing.TB) (db *sql.DB, cleanup func())
```

TimescaleDB returns a handle to the Code Insights TimescaleDB instance. 

The returned DB handle is initialized with a unique database just for the specified test, with all migrations applied. 

