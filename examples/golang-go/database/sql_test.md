# Package sql_test

## Index

* [Variables](#var)
    * [var ctx](#ctx)
    * [var db](#db)
    * [var pool](#pool)
* [Types](#type)
    * [type Service struct](#Service)
        * [func (s *Service) ServeHTTP(w http.ResponseWriter, r *http.Request)](#Service.ServeHTTP)
* [Functions](#func)
    * [func ExampleConn_ExecContext()](#ExampleConn_ExecContext)
    * [func ExampleDB_BeginTx()](#ExampleDB_BeginTx)
    * [func ExampleDB_ExecContext()](#ExampleDB_ExecContext)
    * [func ExampleDB_PingContext()](#ExampleDB_PingContext)
    * [func ExampleDB_Prepare()](#ExampleDB_Prepare)
    * [func ExampleDB_QueryContext()](#ExampleDB_QueryContext)
    * [func ExampleDB_QueryRowContext()](#ExampleDB_QueryRowContext)
    * [func ExampleDB_Query_multipleResultSets()](#ExampleDB_Query_multipleResultSets)
    * [func ExampleRows()](#ExampleRows)
    * [func ExampleStmt()](#ExampleStmt)
    * [func ExampleStmt_QueryRowContext()](#ExampleStmt_QueryRowContext)
    * [func ExampleTx_ExecContext()](#ExampleTx_ExecContext)
    * [func ExampleTx_Prepare()](#ExampleTx_Prepare)
    * [func ExampleTx_Rollback()](#ExampleTx_Rollback)
    * [func Example_openDBCLI()](#Example_openDBCLI)
    * [func Example_openDBService()](#Example_openDBService)
    * [func Ping(ctx context.Context)](#Ping)
    * [func Query(ctx context.Context, id int64)](#Query)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ctx" href="#ctx">var ctx</a>

```
searchKey: sql_test.ctx
tags: [variable interface private]
```

```Go
var ctx context.Context
```

### <a id="db" href="#db">var db</a>

```
searchKey: sql_test.db
tags: [variable struct private]
```

```Go
var db *sql.DB
```

### <a id="pool" href="#pool">var pool</a>

```
searchKey: sql_test.pool
tags: [variable struct private]
```

```Go
var pool *sql.DB // Database connection pool.

```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Service" href="#Service">type Service struct</a>

```
searchKey: sql_test.Service
tags: [struct private]
```

```Go
type Service struct {
	db *sql.DB
}
```

#### <a id="Service.ServeHTTP" href="#Service.ServeHTTP">func (s *Service) ServeHTTP(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: sql_test.Service.ServeHTTP
tags: [method private]
```

```Go
func (s *Service) ServeHTTP(w http.ResponseWriter, r *http.Request)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ExampleConn_ExecContext" href="#ExampleConn_ExecContext">func ExampleConn_ExecContext()</a>

```
searchKey: sql_test.ExampleConn_ExecContext
tags: [function private]
```

```Go
func ExampleConn_ExecContext()
```

### <a id="ExampleDB_BeginTx" href="#ExampleDB_BeginTx">func ExampleDB_BeginTx()</a>

```
searchKey: sql_test.ExampleDB_BeginTx
tags: [function private]
```

```Go
func ExampleDB_BeginTx()
```

### <a id="ExampleDB_ExecContext" href="#ExampleDB_ExecContext">func ExampleDB_ExecContext()</a>

```
searchKey: sql_test.ExampleDB_ExecContext
tags: [function private]
```

```Go
func ExampleDB_ExecContext()
```

### <a id="ExampleDB_PingContext" href="#ExampleDB_PingContext">func ExampleDB_PingContext()</a>

```
searchKey: sql_test.ExampleDB_PingContext
tags: [function private]
```

```Go
func ExampleDB_PingContext()
```

### <a id="ExampleDB_Prepare" href="#ExampleDB_Prepare">func ExampleDB_Prepare()</a>

```
searchKey: sql_test.ExampleDB_Prepare
tags: [function private]
```

```Go
func ExampleDB_Prepare()
```

### <a id="ExampleDB_QueryContext" href="#ExampleDB_QueryContext">func ExampleDB_QueryContext()</a>

```
searchKey: sql_test.ExampleDB_QueryContext
tags: [function private]
```

```Go
func ExampleDB_QueryContext()
```

### <a id="ExampleDB_QueryRowContext" href="#ExampleDB_QueryRowContext">func ExampleDB_QueryRowContext()</a>

```
searchKey: sql_test.ExampleDB_QueryRowContext
tags: [function private]
```

```Go
func ExampleDB_QueryRowContext()
```

### <a id="ExampleDB_Query_multipleResultSets" href="#ExampleDB_Query_multipleResultSets">func ExampleDB_Query_multipleResultSets()</a>

```
searchKey: sql_test.ExampleDB_Query_multipleResultSets
tags: [function private]
```

```Go
func ExampleDB_Query_multipleResultSets()
```

### <a id="ExampleRows" href="#ExampleRows">func ExampleRows()</a>

```
searchKey: sql_test.ExampleRows
tags: [function private]
```

```Go
func ExampleRows()
```

### <a id="ExampleStmt" href="#ExampleStmt">func ExampleStmt()</a>

```
searchKey: sql_test.ExampleStmt
tags: [function private]
```

```Go
func ExampleStmt()
```

### <a id="ExampleStmt_QueryRowContext" href="#ExampleStmt_QueryRowContext">func ExampleStmt_QueryRowContext()</a>

```
searchKey: sql_test.ExampleStmt_QueryRowContext
tags: [function private]
```

```Go
func ExampleStmt_QueryRowContext()
```

### <a id="ExampleTx_ExecContext" href="#ExampleTx_ExecContext">func ExampleTx_ExecContext()</a>

```
searchKey: sql_test.ExampleTx_ExecContext
tags: [function private]
```

```Go
func ExampleTx_ExecContext()
```

### <a id="ExampleTx_Prepare" href="#ExampleTx_Prepare">func ExampleTx_Prepare()</a>

```
searchKey: sql_test.ExampleTx_Prepare
tags: [function private]
```

```Go
func ExampleTx_Prepare()
```

### <a id="ExampleTx_Rollback" href="#ExampleTx_Rollback">func ExampleTx_Rollback()</a>

```
searchKey: sql_test.ExampleTx_Rollback
tags: [function private]
```

```Go
func ExampleTx_Rollback()
```

### <a id="Example_openDBCLI" href="#Example_openDBCLI">func Example_openDBCLI()</a>

```
searchKey: sql_test.Example_openDBCLI
tags: [function private]
```

```Go
func Example_openDBCLI()
```

### <a id="Example_openDBService" href="#Example_openDBService">func Example_openDBService()</a>

```
searchKey: sql_test.Example_openDBService
tags: [function private]
```

```Go
func Example_openDBService()
```

### <a id="Ping" href="#Ping">func Ping(ctx context.Context)</a>

```
searchKey: sql_test.Ping
tags: [function private]
```

```Go
func Ping(ctx context.Context)
```

Ping the database to verify DSN provided by the user is valid and the server accessible. If the ping fails exit the program with an error. 

### <a id="Query" href="#Query">func Query(ctx context.Context, id int64)</a>

```
searchKey: sql_test.Query
tags: [function private]
```

```Go
func Query(ctx context.Context, id int64)
```

Query the database for the information requested and prints the results. If the query fails exit the program with an error. 

