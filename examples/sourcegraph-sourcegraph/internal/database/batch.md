# Package batch

## Index

* [Constants](#const)
    * [const maxNumParameters](#maxNumParameters)
* [Variables](#var)
    * [var querySuffixCache](#querySuffixCache)
    * [var querySuffixCacheMutex](#querySuffixCacheMutex)
    * [var setup](#setup)
* [Types](#type)
    * [type Inserter struct](#Inserter)
        * [func NewInserter(ctx context.Context, db dbutil.DB, tableName string, columnNames ...string) *Inserter](#NewInserter)
        * [func NewInserterWithReturn(ctx context.Context,...](#NewInserterWithReturn)
        * [func (i *Inserter) Flush(ctx context.Context) (err error)](#Inserter.Flush)
        * [func (i *Inserter) Insert(ctx context.Context, values ...interface{}) error](#Inserter.Insert)
        * [func (i *Inserter) makeQuery(numValues int) string](#Inserter.makeQuery)
        * [func (i *Inserter) pop() (batch []interface{})](#Inserter.pop)
    * [type ReturningScanner func(rows *database/sql.Rows) error](#ReturningScanner)
* [Functions](#func)
    * [func BenchmarkBatchInserter(b *testing.B)](#BenchmarkBatchInserter)
    * [func BenchmarkBatchInserterLargePayload(b *testing.B)](#BenchmarkBatchInserterLargePayload)
    * [func InsertValues(ctx context.Context, db dbutil.DB, tableName string, columnNames []string, values <-chan []interface{}) error](#InsertValues)
    * [func TestBatchInserter(t *testing.T)](#TestBatchInserter)
    * [func TestBatchInserterWithReturn(t *testing.T)](#TestBatchInserterWithReturn)
    * [func WithInserter(ctx context.Context,...](#WithInserter)
    * [func WithInserterWithReturn(ctx context.Context,...](#WithInserterWithReturn)
    * [func getMaxBatchSize(numColumns int) int](#getMaxBatchSize)
    * [func init()](#init.batch_test.go)
    * [func makePayload(size int) string](#makePayload)
    * [func makeQueryPrefix(tableName string, columnNames []string) string](#makeQueryPrefix)
    * [func makeQuerySuffix(numColumns int) string](#makeQuerySuffix)
    * [func makeReturningSuffix(columnNames []string) string](#makeReturningSuffix)
    * [func makeTestValues(tableSizeFactor, payloadSize int) [][]interface{}](#makeTestValues)
    * [func setupTestTable(t testing.TB, db *sql.DB)](#setupTestTable)
    * [func testInsert(t testing.TB, db *sql.DB, expectedValues [][]interface{})](#testInsert)
    * [func testInsertWithReturn(t testing.TB, db *sql.DB, expectedValues [][]interface{}) (insertedIDs []int)](#testInsertWithReturn)
    * [func with(ctx context.Context, inserter *Inserter, f func(inserter *Inserter) error) (err error)](#with)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="maxNumParameters" href="#maxNumParameters">const maxNumParameters</a>

```
searchKey: batch.maxNumParameters
tags: [constant number private]
```

```Go
const maxNumParameters = 32767
```

maxNumPostgresParameters is the maximum number of placeholder variables allowed by Postgres in a single insert statement. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="querySuffixCache" href="#querySuffixCache">var querySuffixCache</a>

```
searchKey: batch.querySuffixCache
tags: [variable object private]
```

```Go
var querySuffixCache = map[int]string{}
```

### <a id="querySuffixCacheMutex" href="#querySuffixCacheMutex">var querySuffixCacheMutex</a>

```
searchKey: batch.querySuffixCacheMutex
tags: [variable struct private]
```

```Go
var querySuffixCacheMutex sync.Mutex
```

### <a id="setup" href="#setup">var setup</a>

```
searchKey: batch.setup
tags: [variable struct private]
```

```Go
var setup sync.Once
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Inserter" href="#Inserter">type Inserter struct</a>

```
searchKey: batch.Inserter
tags: [struct]
```

```Go
type Inserter struct {
	db               dbutil.DB
	numColumns       int
	maxBatchSize     int
	batch            []interface{}
	queryPrefix      string
	querySuffix      string
	returningSuffix  string
	returningScanner ReturningScanner
}
```

Inserter allows for bulk updates to a single Postgres table. 

#### <a id="NewInserter" href="#NewInserter">func NewInserter(ctx context.Context, db dbutil.DB, tableName string, columnNames ...string) *Inserter</a>

```
searchKey: batch.NewInserter
tags: [function]
```

```Go
func NewInserter(ctx context.Context, db dbutil.DB, tableName string, columnNames ...string) *Inserter
```

NewInserter creates a new batch inserter using the given database handle, table name, and column names. For performance and atomicity, handle should be a transaction. 

#### <a id="NewInserterWithReturn" href="#NewInserterWithReturn">func NewInserterWithReturn(ctx context.Context,...</a>

```
searchKey: batch.NewInserterWithReturn
tags: [function]
```

```Go
func NewInserterWithReturn(
	ctx context.Context,
	db dbutil.DB,
	tableName string,
	columnNames []string,
	returningColumnNames []string,
	returningScanner ReturningScanner,
) *Inserter
```

NewInserterWithReturn creates a new batch inserter using the given database handle, table name, insert column names, and column names to scan on each inserted row. The given scanner will be called once for each row inserted into the target table. Beware that this function may not be called immediately after a call to Insert as rows are only flushed once the current batch is full (or on explicit flush). For performance and atomicity, handle should be a transaction. 

#### <a id="Inserter.Flush" href="#Inserter.Flush">func (i *Inserter) Flush(ctx context.Context) (err error)</a>

```
searchKey: batch.Inserter.Flush
tags: [method]
```

```Go
func (i *Inserter) Flush(ctx context.Context) (err error)
```

Flush ensures that all queued rows are inserted. This method must be invoked at the end of insertion to ensure that all records are flushed to the underlying Execable. 

#### <a id="Inserter.Insert" href="#Inserter.Insert">func (i *Inserter) Insert(ctx context.Context, values ...interface{}) error</a>

```
searchKey: batch.Inserter.Insert
tags: [method]
```

```Go
func (i *Inserter) Insert(ctx context.Context, values ...interface{}) error
```

Insert submits a single row of values to be inserted on the next flush. 

#### <a id="Inserter.makeQuery" href="#Inserter.makeQuery">func (i *Inserter) makeQuery(numValues int) string</a>

```
searchKey: batch.Inserter.makeQuery
tags: [method private]
```

```Go
func (i *Inserter) makeQuery(numValues int) string
```

makeQuery returns a parameterized SQL query that has the given number of values worth of placeholder variables. It is assumed that the number of values is non-zero and also is a multiple of the number of columns of the target table. 

#### <a id="Inserter.pop" href="#Inserter.pop">func (i *Inserter) pop() (batch []interface{})</a>

```
searchKey: batch.Inserter.pop
tags: [method private]
```

```Go
func (i *Inserter) pop() (batch []interface{})
```

pop removes and returns as many values from the current batch that can be attached to a single insert statement. The returned values are the oldest values submitted to the batch (in order). 

### <a id="ReturningScanner" href="#ReturningScanner">type ReturningScanner func(rows *database/sql.Rows) error</a>

```
searchKey: batch.ReturningScanner
tags: [function]
```

```Go
type ReturningScanner func(rows *sql.Rows) error
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="BenchmarkBatchInserter" href="#BenchmarkBatchInserter">func BenchmarkBatchInserter(b *testing.B)</a>

```
searchKey: batch.BenchmarkBatchInserter
tags: [function private benchmark]
```

```Go
func BenchmarkBatchInserter(b *testing.B)
```

### <a id="BenchmarkBatchInserterLargePayload" href="#BenchmarkBatchInserterLargePayload">func BenchmarkBatchInserterLargePayload(b *testing.B)</a>

```
searchKey: batch.BenchmarkBatchInserterLargePayload
tags: [function private benchmark]
```

```Go
func BenchmarkBatchInserterLargePayload(b *testing.B)
```

### <a id="InsertValues" href="#InsertValues">func InsertValues(ctx context.Context, db dbutil.DB, tableName string, columnNames []string, values <-chan []interface{}) error</a>

```
searchKey: batch.InsertValues
tags: [function]
```

```Go
func InsertValues(ctx context.Context, db dbutil.DB, tableName string, columnNames []string, values <-chan []interface{}) error
```

InsertValues creates a new batch inserter using the given database handle, table name, and column names, then reads from the given channel as if they specify values for a single row. The inserter will be flushed and any error that occurred during insertion or flush will be returned. 

### <a id="TestBatchInserter" href="#TestBatchInserter">func TestBatchInserter(t *testing.T)</a>

```
searchKey: batch.TestBatchInserter
tags: [function private test]
```

```Go
func TestBatchInserter(t *testing.T)
```

### <a id="TestBatchInserterWithReturn" href="#TestBatchInserterWithReturn">func TestBatchInserterWithReturn(t *testing.T)</a>

```
searchKey: batch.TestBatchInserterWithReturn
tags: [function private test]
```

```Go
func TestBatchInserterWithReturn(t *testing.T)
```

### <a id="WithInserter" href="#WithInserter">func WithInserter(ctx context.Context,...</a>

```
searchKey: batch.WithInserter
tags: [function]
```

```Go
func WithInserter(
	ctx context.Context,
	db dbutil.DB,
	tableName string,
	columnNames []string,
	f func(inserter *Inserter) error,
) (err error)
```

WithInserter creates a new batch inserter using the given database handle, table name, and column names, then calls the given function with the new inserter as a parameter. The inserter will be flushed regardless of the error condition of the given function. Any error returned from the given function will be decorated with the inserter's flush error, if one occurs. 

### <a id="WithInserterWithReturn" href="#WithInserterWithReturn">func WithInserterWithReturn(ctx context.Context,...</a>

```
searchKey: batch.WithInserterWithReturn
tags: [function]
```

```Go
func WithInserterWithReturn(
	ctx context.Context,
	db dbutil.DB,
	tableName string,
	columnNames []string,
	returningColumnNames []string,
	returningScanner ReturningScanner,
	f func(inserter *Inserter) error,
) (err error)
```

WithInserterWithReturn creates a new batch inserter using the given database handle, table name, column names, returning columns and returning scanner, then calls the given function with the new inserter as a parameter. The inserter will be flushed regardless of the error condition of the given function. Any error returned from the given function will be decorated with the inserter's flush error, if one occurs. 

### <a id="getMaxBatchSize" href="#getMaxBatchSize">func getMaxBatchSize(numColumns int) int</a>

```
searchKey: batch.getMaxBatchSize
tags: [function private]
```

```Go
func getMaxBatchSize(numColumns int) int
```

getMaxBatchSize returns the number of rows that can be inserted into a single table with the given number of columns via a single insert statement. 

### <a id="init.batch_test.go" href="#init.batch_test.go">func init()</a>

```
searchKey: batch.init
tags: [function private]
```

```Go
func init()
```

### <a id="makePayload" href="#makePayload">func makePayload(size int) string</a>

```
searchKey: batch.makePayload
tags: [function private]
```

```Go
func makePayload(size int) string
```

### <a id="makeQueryPrefix" href="#makeQueryPrefix">func makeQueryPrefix(tableName string, columnNames []string) string</a>

```
searchKey: batch.makeQueryPrefix
tags: [function private]
```

```Go
func makeQueryPrefix(tableName string, columnNames []string) string
```

makeQueryPrefix creates the prefix of the batch insert statement (up to `VALUES `) using the given table and column names. 

### <a id="makeQuerySuffix" href="#makeQuerySuffix">func makeQuerySuffix(numColumns int) string</a>

```
searchKey: batch.makeQuerySuffix
tags: [function private]
```

```Go
func makeQuerySuffix(numColumns int) string
```

makeQuerySuffix creates the suffix of the batch insert statement containing the placeholder variables, e.g. `($1,$2,$3),($4,$5,$6),...`. The number of rows will be the maximum number of _full_ rows that can be inserted in one insert statement. 

If a fewer number of rows should be inserted (due to flushing a partial batch), then the caller slice the appropriate nubmer of rows from the beginning of the string. The suffix constructed here is done so with this use case in mind (each placeholder is 5 digits), so finding the right substring index is efficient. 

This method is memoized. 

### <a id="makeReturningSuffix" href="#makeReturningSuffix">func makeReturningSuffix(columnNames []string) string</a>

```
searchKey: batch.makeReturningSuffix
tags: [function private]
```

```Go
func makeReturningSuffix(columnNames []string) string
```

makeReturningSuffix creates a RETURNING ... clause of the batch insert statement, if any returning column names were supplied to the batcher inserter. 

### <a id="makeTestValues" href="#makeTestValues">func makeTestValues(tableSizeFactor, payloadSize int) [][]interface{}</a>

```
searchKey: batch.makeTestValues
tags: [function private]
```

```Go
func makeTestValues(tableSizeFactor, payloadSize int) [][]interface{}
```

### <a id="setupTestTable" href="#setupTestTable">func setupTestTable(t testing.TB, db *sql.DB)</a>

```
searchKey: batch.setupTestTable
tags: [function private]
```

```Go
func setupTestTable(t testing.TB, db *sql.DB)
```

### <a id="testInsert" href="#testInsert">func testInsert(t testing.TB, db *sql.DB, expectedValues [][]interface{})</a>

```
searchKey: batch.testInsert
tags: [function private]
```

```Go
func testInsert(t testing.TB, db *sql.DB, expectedValues [][]interface{})
```

### <a id="testInsertWithReturn" href="#testInsertWithReturn">func testInsertWithReturn(t testing.TB, db *sql.DB, expectedValues [][]interface{}) (insertedIDs []int)</a>

```
searchKey: batch.testInsertWithReturn
tags: [function private]
```

```Go
func testInsertWithReturn(t testing.TB, db *sql.DB, expectedValues [][]interface{}) (insertedIDs []int)
```

### <a id="with" href="#with">func with(ctx context.Context, inserter *Inserter, f func(inserter *Inserter) error) (err error)</a>

```
searchKey: batch.with
tags: [function private]
```

```Go
func with(ctx context.Context, inserter *Inserter, f func(inserter *Inserter) error) (err error)
```

