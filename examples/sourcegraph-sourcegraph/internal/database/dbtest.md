# Package dbtest

## Index

* [Constants](#const)
    * [const killClientConnsQuery](#killClientConnsQuery)
* [Variables](#var)
    * [var rng](#rng)
    * [var rngLock](#rngLock)
    * [var templateOnce](#templateOnce)
* [Functions](#func)
    * [func NewTx(t testing.TB, db *sql.DB) *sql.Tx](#NewTx)
    * [func NewDB(t testing.TB, dsn string) *sql.DB](#NewDB)
    * [func initTemplateDB(t testing.TB, config *url.URL)](#initTemplateDB)
    * [func templateDBName() string](#templateDBName)
    * [func wdHash() string](#wdHash)
    * [func dbConn(t testing.TB, cfg *url.URL) *sql.DB](#dbConn)
    * [func dbExec(t testing.TB, db *sql.DB, q string, args ...interface{})](#dbExec)
    * [func updateDSNFromEnv(dsn *url.URL)](#updateDSNFromEnv)


## <a id="const" href="#const">Constants</a>

### <a id="killClientConnsQuery" href="#killClientConnsQuery">const killClientConnsQuery</a>

```
searchKey: dbtest.killClientConnsQuery
```

```Go
const killClientConnsQuery = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="rng" href="#rng">var rng</a>

```
searchKey: dbtest.rng
```

```Go
var rng = ...
```

Use a shared, locked RNG to avoid issues with multiple concurrent tests getting the same random database number (unlikely, but has been observed). Use crypto/rand.Read() to use an OS source of entropy, since, against all odds, using nanotime was causing conflicts. 

### <a id="rngLock" href="#rngLock">var rngLock</a>

```
searchKey: dbtest.rngLock
```

```Go
var rngLock sync.Mutex
```

### <a id="templateOnce" href="#templateOnce">var templateOnce</a>

```
searchKey: dbtest.templateOnce
```

```Go
var templateOnce sync.Once
```

## <a id="func" href="#func">Functions</a>

### <a id="NewTx" href="#NewTx">func NewTx(t testing.TB, db *sql.DB) *sql.Tx</a>

```
searchKey: dbtest.NewTx
tags: [exported]
```

```Go
func NewTx(t testing.TB, db *sql.DB) *sql.Tx
```

NewTx opens a transaction off of the given database, returning that transaction if an error didn't occur. 

After opening this transaction, it executes the query 

```
SET CONSTRAINTS ALL DEFERRED

```
which aids in testing. 

### <a id="NewDB" href="#NewDB">func NewDB(t testing.TB, dsn string) *sql.DB</a>

```
searchKey: dbtest.NewDB
tags: [exported]
```

```Go
func NewDB(t testing.TB, dsn string) *sql.DB
```

NewDB returns a connection to a clean, new temporary testing database with the same schema as Sourcegraph's production Postgres database. 

### <a id="initTemplateDB" href="#initTemplateDB">func initTemplateDB(t testing.TB, config *url.URL)</a>

```
searchKey: dbtest.initTemplateDB
```

```Go
func initTemplateDB(t testing.TB, config *url.URL)
```

initTemplateDB creates a template database with a fully migrated schema for the current package. New databases can then do a cheap copy of the migrated schema rather than running the full migration every time. 

### <a id="templateDBName" href="#templateDBName">func templateDBName() string</a>

```
searchKey: dbtest.templateDBName
```

```Go
func templateDBName() string
```

templateDBName returns the name of the template database for the currently running package. 

### <a id="wdHash" href="#wdHash">func wdHash() string</a>

```
searchKey: dbtest.wdHash
```

```Go
func wdHash() string
```

wdHash returns a hash of the current working directory. This is useful to get a stable identifier for the package running the tests. 

### <a id="dbConn" href="#dbConn">func dbConn(t testing.TB, cfg *url.URL) *sql.DB</a>

```
searchKey: dbtest.dbConn
```

```Go
func dbConn(t testing.TB, cfg *url.URL) *sql.DB
```

### <a id="dbExec" href="#dbExec">func dbExec(t testing.TB, db *sql.DB, q string, args ...interface{})</a>

```
searchKey: dbtest.dbExec
```

```Go
func dbExec(t testing.TB, db *sql.DB, q string, args ...interface{})
```

### <a id="updateDSNFromEnv" href="#updateDSNFromEnv">func updateDSNFromEnv(dsn *url.URL)</a>

```
searchKey: dbtest.updateDSNFromEnv
```

```Go
func updateDSNFromEnv(dsn *url.URL)
```

updateDSNFromEnv updates dsn based on PGXXX environment variables set on the frontend. 

