# Package sql_test

## Index

* [Variables](#var)
    * [var pool](#pool)
    * [var ctx](#ctx)
    * [var db](#db)
* [Types](#type)
    * [type Service struct](#Service)
        * [func (s *Service) ServeHTTP(w http.ResponseWriter, r *http.Request)](#Service.ServeHTTP)
* [Functions](#func)
    * [func Example_openDBCLI()](#Example_openDBCLI)
    * [func Ping(ctx context.Context)](#Ping)
    * [func Query(ctx context.Context, id int64)](#Query)
    * [func Example_openDBService()](#Example_openDBService)
    * [func ExampleDB_QueryContext()](#ExampleDB_QueryContext)
    * [func ExampleDB_QueryRowContext()](#ExampleDB_QueryRowContext)
    * [func ExampleDB_ExecContext()](#ExampleDB_ExecContext)
    * [func ExampleDB_Query_multipleResultSets()](#ExampleDB_Query_multipleResultSets)
    * [func ExampleDB_PingContext()](#ExampleDB_PingContext)
    * [func ExampleDB_Prepare()](#ExampleDB_Prepare)
    * [func ExampleTx_Prepare()](#ExampleTx_Prepare)
    * [func ExampleDB_BeginTx()](#ExampleDB_BeginTx)
    * [func ExampleConn_ExecContext()](#ExampleConn_ExecContext)
    * [func ExampleTx_ExecContext()](#ExampleTx_ExecContext)
    * [func ExampleTx_Rollback()](#ExampleTx_Rollback)
    * [func ExampleStmt()](#ExampleStmt)
    * [func ExampleStmt_QueryRowContext()](#ExampleStmt_QueryRowContext)
    * [func ExampleRows()](#ExampleRows)


## <a id="var" href="#var">Variables</a>

### <a id="pool" href="#pool">var pool</a>

```
searchKey: sql_test.pool
```

```Go
var pool *sql.DB // Database connection pool.

```

### <a id="ctx" href="#ctx">var ctx</a>

```
searchKey: sql_test.ctx
```

```Go
var ctx context.Context
```

### <a id="db" href="#db">var db</a>

```
searchKey: sql_test.db
```

```Go
var db *sql.DB
```

## <a id="type" href="#type">Types</a>

### <a id="Service" href="#Service">type Service struct</a>

```
searchKey: sql_test.Service
```

```Go
type Service struct {
	db *sql.DB
}
```

#### <a id="Service.ServeHTTP" href="#Service.ServeHTTP">func (s *Service) ServeHTTP(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: sql_test.Service.ServeHTTP
```

```Go
func (s *Service) ServeHTTP(w http.ResponseWriter, r *http.Request)
```

## <a id="func" href="#func">Functions</a>

### <a id="Example_openDBCLI" href="#Example_openDBCLI">func Example_openDBCLI()</a>

```
searchKey: sql_test.Example_openDBCLI
```

```Go
func Example_openDBCLI()
```

### <a id="Ping" href="#Ping">func Ping(ctx context.Context)</a>

```
searchKey: sql_test.Ping
```

```Go
func Ping(ctx context.Context)
```

Ping the database to verify DSN provided by the user is valid and the server accessible. If the ping fails exit the program with an error. 

### <a id="Query" href="#Query">func Query(ctx context.Context, id int64)</a>

```
searchKey: sql_test.Query
```

```Go
func Query(ctx context.Context, id int64)
```

Query the database for the information requested and prints the results. If the query fails exit the program with an error. 

### <a id="Example_openDBService" href="#Example_openDBService">func Example_openDBService()</a>

```
searchKey: sql_test.Example_openDBService
```

```Go
func Example_openDBService()
```

### <a id="ExampleDB_QueryContext" href="#ExampleDB_QueryContext">func ExampleDB_QueryContext()</a>

```
searchKey: sql_test.ExampleDB_QueryContext
```

```Go
func ExampleDB_QueryContext()
```

### <a id="ExampleDB_QueryRowContext" href="#ExampleDB_QueryRowContext">func ExampleDB_QueryRowContext()</a>

```
searchKey: sql_test.ExampleDB_QueryRowContext
```

```Go
func ExampleDB_QueryRowContext()
```

### <a id="ExampleDB_ExecContext" href="#ExampleDB_ExecContext">func ExampleDB_ExecContext()</a>

```
searchKey: sql_test.ExampleDB_ExecContext
```

```Go
func ExampleDB_ExecContext()
```

### <a id="ExampleDB_Query_multipleResultSets" href="#ExampleDB_Query_multipleResultSets">func ExampleDB_Query_multipleResultSets()</a>

```
searchKey: sql_test.ExampleDB_Query_multipleResultSets
```

```Go
func ExampleDB_Query_multipleResultSets()
```

### <a id="ExampleDB_PingContext" href="#ExampleDB_PingContext">func ExampleDB_PingContext()</a>

```
searchKey: sql_test.ExampleDB_PingContext
```

```Go
func ExampleDB_PingContext()
```

### <a id="ExampleDB_Prepare" href="#ExampleDB_Prepare">func ExampleDB_Prepare()</a>

```
searchKey: sql_test.ExampleDB_Prepare
```

```Go
func ExampleDB_Prepare()
```

### <a id="ExampleTx_Prepare" href="#ExampleTx_Prepare">func ExampleTx_Prepare()</a>

```
searchKey: sql_test.ExampleTx_Prepare
```

```Go
func ExampleTx_Prepare()
```

### <a id="ExampleDB_BeginTx" href="#ExampleDB_BeginTx">func ExampleDB_BeginTx()</a>

```
searchKey: sql_test.ExampleDB_BeginTx
```

```Go
func ExampleDB_BeginTx()
```

### <a id="ExampleConn_ExecContext" href="#ExampleConn_ExecContext">func ExampleConn_ExecContext()</a>

```
searchKey: sql_test.ExampleConn_ExecContext
```

```Go
func ExampleConn_ExecContext()
```

### <a id="ExampleTx_ExecContext" href="#ExampleTx_ExecContext">func ExampleTx_ExecContext()</a>

```
searchKey: sql_test.ExampleTx_ExecContext
```

```Go
func ExampleTx_ExecContext()
```

### <a id="ExampleTx_Rollback" href="#ExampleTx_Rollback">func ExampleTx_Rollback()</a>

```
searchKey: sql_test.ExampleTx_Rollback
```

```Go
func ExampleTx_Rollback()
```

### <a id="ExampleStmt" href="#ExampleStmt">func ExampleStmt()</a>

```
searchKey: sql_test.ExampleStmt
```

```Go
func ExampleStmt()
```

### <a id="ExampleStmt_QueryRowContext" href="#ExampleStmt_QueryRowContext">func ExampleStmt_QueryRowContext()</a>

```
searchKey: sql_test.ExampleStmt_QueryRowContext
```

```Go
func ExampleStmt_QueryRowContext()
```

### <a id="ExampleRows" href="#ExampleRows">func ExampleRows()</a>

```
searchKey: sql_test.ExampleRows
```

```Go
func ExampleRows()
```

