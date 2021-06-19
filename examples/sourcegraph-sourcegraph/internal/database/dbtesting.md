# Package dbtesting

Package dbtesting provides database test helpers. 

## Index

* [Variables](#var)
    * [var MockHashPassword](#MockHashPassword)
    * [var MockValidPassword](#MockValidPassword)
    * [var BeforeTest](#BeforeTest)
    * [var DBNameSuffix](#DBNameSuffix)
    * [var connectOnce](#connectOnce)
    * [var connectErr](#connectErr)
* [Types](#type)
    * [type MockDB struct{}](#MockDB)
        * [func (db *MockDB) QueryContext(ctx context.Context, q string, args ...interface{}) (*sql.Rows, error)](#MockDB.QueryContext)
        * [func (db *MockDB) ExecContext(ctx context.Context, query string, args ...interface{}) (sql.Result, error)](#MockDB.ExecContext)
        * [func (db *MockDB) QueryRowContext(ctx context.Context, query string, args ...interface{}) *sql.Row](#MockDB.QueryRowContext)
* [Functions](#func)
    * [func useFastPasswordMocks()](#useFastPasswordMocks)
    * [func SetupGlobalTestDB(t testing.TB)](#SetupGlobalTestDB)
    * [func GetDB(t testing.TB) *sql.DB](#GetDB)
    * [func emptyDBPreserveSchema(t testing.TB, d *sql.DB)](#emptyDBPreserveSchema)
    * [func initTest(nameSuffix string) error](#initTest)


## <a id="var" href="#var">Variables</a>

### <a id="MockHashPassword" href="#MockHashPassword">var MockHashPassword</a>

```
searchKey: dbtesting.MockHashPassword
tags: [exported]
```

```Go
var MockHashPassword func(password string) (sql.NullString, error)
```

MockHashPassword if non-nil is used instead of database.hashPassword. This is useful when running tests since we can use a faster implementation. 

### <a id="MockValidPassword" href="#MockValidPassword">var MockValidPassword</a>

```
searchKey: dbtesting.MockValidPassword
tags: [exported]
```

```Go
var MockValidPassword func(hash, password string) bool
```

### <a id="BeforeTest" href="#BeforeTest">var BeforeTest</a>

```
searchKey: dbtesting.BeforeTest
tags: [exported]
```

```Go
var BeforeTest []func()
```

BeforeTest functions are called before each test is run (by SetupGlobalTestDB). 

### <a id="DBNameSuffix" href="#DBNameSuffix">var DBNameSuffix</a>

```
searchKey: dbtesting.DBNameSuffix
tags: [exported]
```

```Go
var DBNameSuffix = "database"
```

DBNameSuffix must be set by DB test packages at init time to a value that is unique among all other such values used by other DB test packages. This is necessary to ensure the tests do not concurrently use the same DB (which would cause test failures). 

### <a id="connectOnce" href="#connectOnce">var connectOnce</a>

```
searchKey: dbtesting.connectOnce
```

```Go
var connectOnce sync.Once
```

### <a id="connectErr" href="#connectErr">var connectErr</a>

```
searchKey: dbtesting.connectErr
```

```Go
var connectErr error
```

## <a id="type" href="#type">Types</a>

### <a id="MockDB" href="#MockDB">type MockDB struct{}</a>

```
searchKey: dbtesting.MockDB
tags: [exported]
```

```Go
type MockDB struct{}
```

MockDB implements the dbutil.DB interface and is intended to be used in tests that require the database handle but never call it. 

#### <a id="MockDB.QueryContext" href="#MockDB.QueryContext">func (db *MockDB) QueryContext(ctx context.Context, q string, args ...interface{}) (*sql.Rows, error)</a>

```
searchKey: dbtesting.MockDB.QueryContext
tags: [exported]
```

```Go
func (db *MockDB) QueryContext(ctx context.Context, q string, args ...interface{}) (*sql.Rows, error)
```

#### <a id="MockDB.ExecContext" href="#MockDB.ExecContext">func (db *MockDB) ExecContext(ctx context.Context, query string, args ...interface{}) (sql.Result, error)</a>

```
searchKey: dbtesting.MockDB.ExecContext
tags: [exported]
```

```Go
func (db *MockDB) ExecContext(ctx context.Context, query string, args ...interface{}) (sql.Result, error)
```

#### <a id="MockDB.QueryRowContext" href="#MockDB.QueryRowContext">func (db *MockDB) QueryRowContext(ctx context.Context, query string, args ...interface{}) *sql.Row</a>

```
searchKey: dbtesting.MockDB.QueryRowContext
tags: [exported]
```

```Go
func (db *MockDB) QueryRowContext(ctx context.Context, query string, args ...interface{}) *sql.Row
```

## <a id="func" href="#func">Functions</a>

### <a id="useFastPasswordMocks" href="#useFastPasswordMocks">func useFastPasswordMocks()</a>

```
searchKey: dbtesting.useFastPasswordMocks
```

```Go
func useFastPasswordMocks()
```

### <a id="SetupGlobalTestDB" href="#SetupGlobalTestDB">func SetupGlobalTestDB(t testing.TB)</a>

```
searchKey: dbtesting.SetupGlobalTestDB
tags: [exported]
```

```Go
func SetupGlobalTestDB(t testing.TB)
```

SetupGlobalTestDB creates a temporary test DB handle, sets `dbconn.Global` to it and setups other test configuration. 

Callers (other than github.com/sourcegraph/sourcegraph/internal/database) must set a name in this package's DBNameSuffix var that is unique among all other test packages that call SetupGlobalTestDB, so that each package's tests run in separate DBs and do not conflict. 

### <a id="GetDB" href="#GetDB">func GetDB(t testing.TB) *sql.DB</a>

```
searchKey: dbtesting.GetDB
tags: [exported]
```

```Go
func GetDB(t testing.TB) *sql.DB
```

GetDB calls SetupGlobalTestDB and returns dbconn.Global. It is meant to ease the migration away from dbconn.Global. 

New callers and callers actually wishing to migrate fully away from a global DB connection should use the new ../dbtest package instead of this one. 

### <a id="emptyDBPreserveSchema" href="#emptyDBPreserveSchema">func emptyDBPreserveSchema(t testing.TB, d *sql.DB)</a>

```
searchKey: dbtesting.emptyDBPreserveSchema
```

```Go
func emptyDBPreserveSchema(t testing.TB, d *sql.DB)
```

### <a id="initTest" href="#initTest">func initTest(nameSuffix string) error</a>

```
searchKey: dbtesting.initTest
```

```Go
func initTest(nameSuffix string) error
```

initTest creates a test database, named with the given suffix (dropping it if it already exists), and configures this package to use it. It is called by integration tests (in a package init func) that need to use a real database. 

