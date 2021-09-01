# Package basestore

## Index

* [Constants](#const)
    * [const commitSavepointQuery](#commitSavepointQuery)
    * [const rollbackSavepointQuery](#rollbackSavepointQuery)
    * [const savepointQuery](#savepointQuery)
* [Variables](#var)
    * [var ErrNotTransactable](#ErrNotTransactable)
* [Types](#type)
    * [type ShareableStore interface](#ShareableStore)
    * [type Store struct](#Store)
        * [func New(postgresDSN, app string, txOptions sql.TxOptions) (*Store, error)](#New)
        * [func NewWithDB(db dbutil.DB, txOptions sql.TxOptions) *Store](#NewWithDB)
        * [func NewWithHandle(handle *TransactableHandle) *Store](#NewWithHandle)
        * [func testStore(db dbutil.DB) *Store](#testStore)
        * [func (s *Store) Done(err error) error](#Store.Done)
        * [func (s *Store) Exec(ctx context.Context, query *sqlf.Query) error](#Store.Exec)
        * [func (s *Store) ExecResult(ctx context.Context, query *sqlf.Query) (sql.Result, error)](#Store.ExecResult)
        * [func (s *Store) Handle() *TransactableHandle](#Store.Handle)
        * [func (s *Store) InTransaction() bool](#Store.InTransaction)
        * [func (s *Store) Query(ctx context.Context, query *sqlf.Query) (*sql.Rows, error)](#Store.Query)
        * [func (s *Store) QueryRow(ctx context.Context, query *sqlf.Query) *sql.Row](#Store.QueryRow)
        * [func (s *Store) Transact(ctx context.Context) (*Store, error)](#Store.Transact)
        * [func (s *Store) With(other ShareableStore) *Store](#Store.With)
    * [type TransactableHandle struct](#TransactableHandle)
        * [func NewHandle(postgresDSN, app string, txOptions sql.TxOptions) (*TransactableHandle, error)](#NewHandle)
        * [func NewHandleWithDB(db dbutil.DB, txOptions sql.TxOptions) *TransactableHandle](#NewHandleWithDB)
        * [func (h *TransactableHandle) DB() dbutil.DB](#TransactableHandle.DB)
        * [func (h *TransactableHandle) Done(err error) error](#TransactableHandle.Done)
        * [func (h *TransactableHandle) InTransaction() bool](#TransactableHandle.InTransaction)
        * [func (h *TransactableHandle) Transact(ctx context.Context) (*TransactableHandle, error)](#TransactableHandle.Transact)
    * [type savepoint struct](#savepoint)
        * [func newSavepoint(ctx context.Context, db dbutil.DB) (*savepoint, error)](#newSavepoint)
        * [func (s *savepoint) Commit() error](#savepoint.Commit)
        * [func (s *savepoint) Rollback() error](#savepoint.Rollback)
        * [func (s *savepoint) apply(query string) error](#savepoint.apply)
* [Functions](#func)
    * [func CloseRows(rows *sql.Rows, err error) error](#CloseRows)
    * [func ScanBools(rows *sql.Rows, queryErr error) (_ []bool, err error)](#ScanBools)
    * [func ScanFirstBool(rows *sql.Rows, queryErr error) (value bool, exists bool, err error)](#ScanFirstBool)
    * [func ScanFirstFloat(rows *sql.Rows, queryErr error) (_ float64, _ bool, err error)](#ScanFirstFloat)
    * [func ScanFirstInt(rows *sql.Rows, queryErr error) (_ int, _ bool, err error)](#ScanFirstInt)
    * [func ScanFirstNullString(rows *sql.Rows, queryErr error) (_ string, _ bool, err error)](#ScanFirstNullString)
    * [func ScanFirstString(rows *sql.Rows, queryErr error) (_ string, _ bool, err error)](#ScanFirstString)
    * [func ScanFirstTime(rows *sql.Rows, queryErr error) (_ time.Time, _ bool, err error)](#ScanFirstTime)
    * [func ScanFloats(rows *sql.Rows, queryErr error) (_ []float64, err error)](#ScanFloats)
    * [func ScanInt32s(rows *sql.Rows, queryErr error) (_ []int32, err error)](#ScanInt32s)
    * [func ScanInts(rows *sql.Rows, queryErr error) (_ []int, err error)](#ScanInts)
    * [func ScanStrings(rows *sql.Rows, queryErr error) (_ []string, err error)](#ScanStrings)
    * [func ScanTimes(rows *sql.Rows, queryErr error) (_ []time.Time, err error)](#ScanTimes)
    * [func TestSavepoints(t *testing.T)](#TestSavepoints)
    * [func TestTransaction(t *testing.T)](#TestTransaction)
    * [func assertCounts(t *testing.T, db dbutil.DB, expectedCounts map[int]int)](#assertCounts)
    * [func combineErrors(errs ...error) (err error)](#combineErrors)
    * [func init()](#init.store_test.go)
    * [func makeSavepointID() (string, error)](#makeSavepointID)
    * [func recurSavepoints(t *testing.T, store *Store, index, rollbackAt int)](#recurSavepoints)
    * [func setupStoreTest(t *testing.T, db dbutil.DB)](#setupStoreTest)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="commitSavepointQuery" href="#commitSavepointQuery">const commitSavepointQuery</a>

```
searchKey: basestore.commitSavepointQuery
tags: [constant string private]
```

```Go
const commitSavepointQuery = "RELEASE %s"
```

### <a id="rollbackSavepointQuery" href="#rollbackSavepointQuery">const rollbackSavepointQuery</a>

```
searchKey: basestore.rollbackSavepointQuery
tags: [constant string private]
```

```Go
const rollbackSavepointQuery = "ROLLBACK TO %s"
```

### <a id="savepointQuery" href="#savepointQuery">const savepointQuery</a>

```
searchKey: basestore.savepointQuery
tags: [constant string private]
```

```Go
const savepointQuery = "SAVEPOINT %s"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ErrNotTransactable" href="#ErrNotTransactable">var ErrNotTransactable</a>

```
searchKey: basestore.ErrNotTransactable
tags: [variable interface]
```

```Go
var ErrNotTransactable = errors.New("store: not transactable")
```

ErrNotTransactable occurs when Transact is called on a Store instance whose underlying database handle does not support beginning a transaction. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="ShareableStore" href="#ShareableStore">type ShareableStore interface</a>

```
searchKey: basestore.ShareableStore
tags: [interface]
```

```Go
type ShareableStore interface {
	// Handle returns the underlying transactable database handle.
	Handle() *TransactableHandle
}
```

ShareableStore is implemented by stores to explicitly allow distinct store instances to reference the store's underlying handle. This is used to share transactions between multiple stores. See `Store.With` for additional details. 

### <a id="Store" href="#Store">type Store struct</a>

```
searchKey: basestore.Store
tags: [struct]
```

```Go
type Store struct {
	handle *TransactableHandle
}
```

Store is an abstract Postgres-backed data access layer. Instances of this struct should not be used directly, but should be used compositionally by other stores that implement logic specific to a domain. 

The following is a minimal example of decorating the base store that preserves the correct behavior of the underlying base store. Note that `With` and `Transact` must be re-defined in the outer layer in order to create a useful return value. Failure to re-define these methods will result in `With` and `Transact` methods that return a modified base store with no methods from the outer layer. All other methods of the base store are available on the outer layer without needing to be re-defined. 

```
type SprocketStore struct {
    *basestore.Store
}

func NewWithDB(database dbutil.DB) *SprocketStore {
    return &SprocketStore{Store: basestore.NewWithDB(database, sql.TxOptions{})}
}

func (s *SprocketStore) With(other basestore.ShareableStore) *SprocketStore {
    return &SprocketStore{Store: s.Store.With(other)}
}

func (s *SprocketStore) Transact(ctx context.Context) (*SprocketStore, error) {
    txBase, err := s.Store.Transact(ctx)
    return &SprocketStore{Store: txBase}, err
}

```
#### <a id="New" href="#New">func New(postgresDSN, app string, txOptions sql.TxOptions) (*Store, error)</a>

```
searchKey: basestore.New
tags: [function]
```

```Go
func New(postgresDSN, app string, txOptions sql.TxOptions) (*Store, error)
```

New returns a new base store connected to the given dsn (data store name). 

#### <a id="NewWithDB" href="#NewWithDB">func NewWithDB(db dbutil.DB, txOptions sql.TxOptions) *Store</a>

```
searchKey: basestore.NewWithDB
tags: [function]
```

```Go
func NewWithDB(db dbutil.DB, txOptions sql.TxOptions) *Store
```

NewHandleWithDB returns a new base store connected to the given connection. 

#### <a id="NewWithHandle" href="#NewWithHandle">func NewWithHandle(handle *TransactableHandle) *Store</a>

```
searchKey: basestore.NewWithHandle
tags: [function]
```

```Go
func NewWithHandle(handle *TransactableHandle) *Store
```

NewWithHandle returns a new base store using the given database handle. 

#### <a id="testStore" href="#testStore">func testStore(db dbutil.DB) *Store</a>

```
searchKey: basestore.testStore
tags: [function private]
```

```Go
func testStore(db dbutil.DB) *Store
```

#### <a id="Store.Done" href="#Store.Done">func (s *Store) Done(err error) error</a>

```
searchKey: basestore.Store.Done
tags: [method]
```

```Go
func (s *Store) Done(err error) error
```

Done performs a commit or rollback of the underlying transaction/savepoint depending on the value of the error parameter. The resulting error value is a multierror containing the error parameter along with any error that occurs during commit or rollback of the transaction/savepoint. If the store does not wrap a transaction the original error value is returned unchanged. 

#### <a id="Store.Exec" href="#Store.Exec">func (s *Store) Exec(ctx context.Context, query *sqlf.Query) error</a>

```
searchKey: basestore.Store.Exec
tags: [method]
```

```Go
func (s *Store) Exec(ctx context.Context, query *sqlf.Query) error
```

Exec performs a query without returning any rows. 

#### <a id="Store.ExecResult" href="#Store.ExecResult">func (s *Store) ExecResult(ctx context.Context, query *sqlf.Query) (sql.Result, error)</a>

```
searchKey: basestore.Store.ExecResult
tags: [method]
```

```Go
func (s *Store) ExecResult(ctx context.Context, query *sqlf.Query) (sql.Result, error)
```

ExecResult performs a query without returning any rows, but includes the result of the execution. 

#### <a id="Store.Handle" href="#Store.Handle">func (s *Store) Handle() *TransactableHandle</a>

```
searchKey: basestore.Store.Handle
tags: [method]
```

```Go
func (s *Store) Handle() *TransactableHandle
```

Handle returns the underlying transactable database handle. 

#### <a id="Store.InTransaction" href="#Store.InTransaction">func (s *Store) InTransaction() bool</a>

```
searchKey: basestore.Store.InTransaction
tags: [method]
```

```Go
func (s *Store) InTransaction() bool
```

InTransaction returns true if the underlying database handle is in a transaction. 

#### <a id="Store.Query" href="#Store.Query">func (s *Store) Query(ctx context.Context, query *sqlf.Query) (*sql.Rows, error)</a>

```
searchKey: basestore.Store.Query
tags: [method]
```

```Go
func (s *Store) Query(ctx context.Context, query *sqlf.Query) (*sql.Rows, error)
```

Query performs QueryContext on the underlying connection. 

#### <a id="Store.QueryRow" href="#Store.QueryRow">func (s *Store) QueryRow(ctx context.Context, query *sqlf.Query) *sql.Row</a>

```
searchKey: basestore.Store.QueryRow
tags: [method]
```

```Go
func (s *Store) QueryRow(ctx context.Context, query *sqlf.Query) *sql.Row
```

QueryRow performs QueryRowContext on the underlying connection. 

#### <a id="Store.Transact" href="#Store.Transact">func (s *Store) Transact(ctx context.Context) (*Store, error)</a>

```
searchKey: basestore.Store.Transact
tags: [method]
```

```Go
func (s *Store) Transact(ctx context.Context) (*Store, error)
```

Transact returns a new store whose methods operate within the context of a new transaction or a new savepoint. This method will return an error if the underlying connection cannot be interface upgraded to a TxBeginner. 

#### <a id="Store.With" href="#Store.With">func (s *Store) With(other ShareableStore) *Store</a>

```
searchKey: basestore.Store.With
tags: [method]
```

```Go
func (s *Store) With(other ShareableStore) *Store
```

With creates a new store with the underlying database handle from the given store. This method should be used when two distinct store instances need to perform an operation within the same shared transaction. 

```
txn1 := store1.Transact(ctx) // Creates a transaction
txn2 := store2.With(txn1)    // References the same transaction

txn1.A(ctx) // Occurs within shared transaction
txn2.B(ctx) // Occurs within shared transaction
txn1.Done() // closes shared transaction

```
Note that once a handle is shared between two stores, committing or rolling back a transaction will affect the handle of both stores. Most notably, two stores that share the same handle are unable to begin independent transactions. 

### <a id="TransactableHandle" href="#TransactableHandle">type TransactableHandle struct</a>

```
searchKey: basestore.TransactableHandle
tags: [struct]
```

```Go
type TransactableHandle struct {
	db         dbutil.DB
	savepoints []*savepoint
	txOptions  sql.TxOptions
}
```

TransactableHandle is a wrapper around a database connection that provides nested transactions through registration and finalization of savepoints. A transactable database handler can be shared by multiple stores. 

#### <a id="NewHandle" href="#NewHandle">func NewHandle(postgresDSN, app string, txOptions sql.TxOptions) (*TransactableHandle, error)</a>

```
searchKey: basestore.NewHandle
tags: [function]
```

```Go
func NewHandle(postgresDSN, app string, txOptions sql.TxOptions) (*TransactableHandle, error)
```

NewHandle returns a new transactable database handle connected to the given dsn (data store name). 

#### <a id="NewHandleWithDB" href="#NewHandleWithDB">func NewHandleWithDB(db dbutil.DB, txOptions sql.TxOptions) *TransactableHandle</a>

```
searchKey: basestore.NewHandleWithDB
tags: [function]
```

```Go
func NewHandleWithDB(db dbutil.DB, txOptions sql.TxOptions) *TransactableHandle
```

NewHandleWithDB returns a new transactable database handle using the given database connection. 

#### <a id="TransactableHandle.DB" href="#TransactableHandle.DB">func (h *TransactableHandle) DB() dbutil.DB</a>

```
searchKey: basestore.TransactableHandle.DB
tags: [method]
```

```Go
func (h *TransactableHandle) DB() dbutil.DB
```

DB returns the underlying database handle. 

#### <a id="TransactableHandle.Done" href="#TransactableHandle.Done">func (h *TransactableHandle) Done(err error) error</a>

```
searchKey: basestore.TransactableHandle.Done
tags: [method]
```

```Go
func (h *TransactableHandle) Done(err error) error
```

Done performs a commit or rollback of the underlying transaction/savepoint depending on the value of the error parameter. The resulting error value is a multierror containing the error parameter along with any error that occurs during commit or rollback of the transaction/savepoint. If the store does not wrap a transaction the original error value is returned unchanged. 

#### <a id="TransactableHandle.InTransaction" href="#TransactableHandle.InTransaction">func (h *TransactableHandle) InTransaction() bool</a>

```
searchKey: basestore.TransactableHandle.InTransaction
tags: [method]
```

```Go
func (h *TransactableHandle) InTransaction() bool
```

InTransaction returns true if the underlying database handle is in a transaction. 

#### <a id="TransactableHandle.Transact" href="#TransactableHandle.Transact">func (h *TransactableHandle) Transact(ctx context.Context) (*TransactableHandle, error)</a>

```
searchKey: basestore.TransactableHandle.Transact
tags: [method]
```

```Go
func (h *TransactableHandle) Transact(ctx context.Context) (*TransactableHandle, error)
```

Transact returns a new transactional database handle whose methods operate within the context of a new transaction or a new savepoint. This method will return an error if the underlying connection cannot be interface upgraded to a TxBeginner. 

Note that it is not valid to call Transact or Done on the same database handle from distinct goroutines. Because we support properly nested transactions via savepoints, calling Transact from two different goroutines on the same handle will not be deterministic: either transaction could nest the other one, and calling Done in one goroutine may not finalize the expected unit of work. 

### <a id="savepoint" href="#savepoint">type savepoint struct</a>

```
searchKey: basestore.savepoint
tags: [struct private]
```

```Go
type savepoint struct {
	db          dbutil.DB
	savepointID string
}
```

savepoint is a small wrapper around committing/rolling back a "nested transaction". Each savepoint has an identifier unique to that connection and must be referenced by name on finalization. The transactional database handler takes care to finalize the savepoints in the same order they were created for a particular store. 

#### <a id="newSavepoint" href="#newSavepoint">func newSavepoint(ctx context.Context, db dbutil.DB) (*savepoint, error)</a>

```
searchKey: basestore.newSavepoint
tags: [function private]
```

```Go
func newSavepoint(ctx context.Context, db dbutil.DB) (*savepoint, error)
```

#### <a id="savepoint.Commit" href="#savepoint.Commit">func (s *savepoint) Commit() error</a>

```
searchKey: basestore.savepoint.Commit
tags: [method private]
```

```Go
func (s *savepoint) Commit() error
```

#### <a id="savepoint.Rollback" href="#savepoint.Rollback">func (s *savepoint) Rollback() error</a>

```
searchKey: basestore.savepoint.Rollback
tags: [method private]
```

```Go
func (s *savepoint) Rollback() error
```

#### <a id="savepoint.apply" href="#savepoint.apply">func (s *savepoint) apply(query string) error</a>

```
searchKey: basestore.savepoint.apply
tags: [method private]
```

```Go
func (s *savepoint) apply(query string) error
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="CloseRows" href="#CloseRows">func CloseRows(rows *sql.Rows, err error) error</a>

```
searchKey: basestore.CloseRows
tags: [function]
```

```Go
func CloseRows(rows *sql.Rows, err error) error
```

CloseRows closes the given rows object. The resulting error is a multierror containing the error parameter along with any errors that occur during scanning or closing the rows object. The rows object is assumed to be non-nil. 

The signature of this function allows scan methods to be written uniformly: 

```
func ScanThings(rows *sql.Rows, queryErr error) (_ []Thing, err error) {
    if queryErr != nil {
        return nil, queryErr
    }
    defer func() { err = CloseRows(rows, err) }()

    // read things from rows
}

```
Scan methods should be called directly with the results of `*store.Query` to ensure that the rows are always properly handled. 

```
things, err := ScanThings(store.Query(ctx, query))

```
### <a id="ScanBools" href="#ScanBools">func ScanBools(rows *sql.Rows, queryErr error) (_ []bool, err error)</a>

```
searchKey: basestore.ScanBools
tags: [function]
```

```Go
func ScanBools(rows *sql.Rows, queryErr error) (_ []bool, err error)
```

ScanBools reads bool values from the given row object. 

### <a id="ScanFirstBool" href="#ScanFirstBool">func ScanFirstBool(rows *sql.Rows, queryErr error) (value bool, exists bool, err error)</a>

```
searchKey: basestore.ScanFirstBool
tags: [function]
```

```Go
func ScanFirstBool(rows *sql.Rows, queryErr error) (value bool, exists bool, err error)
```

ScanFirstBool reads bool values from the given row object and returns the first one. If no rows match the query, a false-valued flag is returned. 

### <a id="ScanFirstFloat" href="#ScanFirstFloat">func ScanFirstFloat(rows *sql.Rows, queryErr error) (_ float64, _ bool, err error)</a>

```
searchKey: basestore.ScanFirstFloat
tags: [function]
```

```Go
func ScanFirstFloat(rows *sql.Rows, queryErr error) (_ float64, _ bool, err error)
```

ScanFirstFloat reads float values from the given row object and returns the first one. If no rows match the query, a false-valued flag is returned. 

### <a id="ScanFirstInt" href="#ScanFirstInt">func ScanFirstInt(rows *sql.Rows, queryErr error) (_ int, _ bool, err error)</a>

```
searchKey: basestore.ScanFirstInt
tags: [function]
```

```Go
func ScanFirstInt(rows *sql.Rows, queryErr error) (_ int, _ bool, err error)
```

ScanFirstInt reads integer values from the given row object and returns the first one. If no rows match the query, a false-valued flag is returned. 

### <a id="ScanFirstNullString" href="#ScanFirstNullString">func ScanFirstNullString(rows *sql.Rows, queryErr error) (_ string, _ bool, err error)</a>

```
searchKey: basestore.ScanFirstNullString
tags: [function]
```

```Go
func ScanFirstNullString(rows *sql.Rows, queryErr error) (_ string, _ bool, err error)
```

ScanFirstNullString reads possibly null string values from the given row object and returns the first one. If no rows match the query, a false-valued flag is returned. 

### <a id="ScanFirstString" href="#ScanFirstString">func ScanFirstString(rows *sql.Rows, queryErr error) (_ string, _ bool, err error)</a>

```
searchKey: basestore.ScanFirstString
tags: [function]
```

```Go
func ScanFirstString(rows *sql.Rows, queryErr error) (_ string, _ bool, err error)
```

ScanFirstString reads string values from the given row object and returns the first one. If no rows match the query, a false-valued flag is returned. 

### <a id="ScanFirstTime" href="#ScanFirstTime">func ScanFirstTime(rows *sql.Rows, queryErr error) (_ time.Time, _ bool, err error)</a>

```
searchKey: basestore.ScanFirstTime
tags: [function]
```

```Go
func ScanFirstTime(rows *sql.Rows, queryErr error) (_ time.Time, _ bool, err error)
```

ScanFirstTime reads time values from the given row object and returns the first one. If no rows match the query, a false-valued flag is returned. 

### <a id="ScanFloats" href="#ScanFloats">func ScanFloats(rows *sql.Rows, queryErr error) (_ []float64, err error)</a>

```
searchKey: basestore.ScanFloats
tags: [function]
```

```Go
func ScanFloats(rows *sql.Rows, queryErr error) (_ []float64, err error)
```

ScanFloats reads float values from the given row object. 

### <a id="ScanInt32s" href="#ScanInt32s">func ScanInt32s(rows *sql.Rows, queryErr error) (_ []int32, err error)</a>

```
searchKey: basestore.ScanInt32s
tags: [function]
```

```Go
func ScanInt32s(rows *sql.Rows, queryErr error) (_ []int32, err error)
```

ScanInt32s reads integer values from the given row object. 

### <a id="ScanInts" href="#ScanInts">func ScanInts(rows *sql.Rows, queryErr error) (_ []int, err error)</a>

```
searchKey: basestore.ScanInts
tags: [function]
```

```Go
func ScanInts(rows *sql.Rows, queryErr error) (_ []int, err error)
```

ScanInts reads integer values from the given row object. 

### <a id="ScanStrings" href="#ScanStrings">func ScanStrings(rows *sql.Rows, queryErr error) (_ []string, err error)</a>

```
searchKey: basestore.ScanStrings
tags: [function]
```

```Go
func ScanStrings(rows *sql.Rows, queryErr error) (_ []string, err error)
```

ScanStrings reads string values from the given row object. 

### <a id="ScanTimes" href="#ScanTimes">func ScanTimes(rows *sql.Rows, queryErr error) (_ []time.Time, err error)</a>

```
searchKey: basestore.ScanTimes
tags: [function]
```

```Go
func ScanTimes(rows *sql.Rows, queryErr error) (_ []time.Time, err error)
```

ScanTimes reads time values from the given row object. 

### <a id="TestSavepoints" href="#TestSavepoints">func TestSavepoints(t *testing.T)</a>

```
searchKey: basestore.TestSavepoints
tags: [function private test]
```

```Go
func TestSavepoints(t *testing.T)
```

### <a id="TestTransaction" href="#TestTransaction">func TestTransaction(t *testing.T)</a>

```
searchKey: basestore.TestTransaction
tags: [function private test]
```

```Go
func TestTransaction(t *testing.T)
```

### <a id="assertCounts" href="#assertCounts">func assertCounts(t *testing.T, db dbutil.DB, expectedCounts map[int]int)</a>

```
searchKey: basestore.assertCounts
tags: [function private]
```

```Go
func assertCounts(t *testing.T, db dbutil.DB, expectedCounts map[int]int)
```

### <a id="combineErrors" href="#combineErrors">func combineErrors(errs ...error) (err error)</a>

```
searchKey: basestore.combineErrors
tags: [function private]
```

```Go
func combineErrors(errs ...error) (err error)
```

combineErrors returns a multierror containing all fo the non-nil error parameter values. This method should be used over multierror when it is not guaranteed that the original error was non-nil (multierror.Append creates a non-nil error even if it is empty). 

### <a id="init.store_test.go" href="#init.store_test.go">func init()</a>

```
searchKey: basestore.init
tags: [function private]
```

```Go
func init()
```

### <a id="makeSavepointID" href="#makeSavepointID">func makeSavepointID() (string, error)</a>

```
searchKey: basestore.makeSavepointID
tags: [function private]
```

```Go
func makeSavepointID() (string, error)
```

### <a id="recurSavepoints" href="#recurSavepoints">func recurSavepoints(t *testing.T, store *Store, index, rollbackAt int)</a>

```
searchKey: basestore.recurSavepoints
tags: [function private]
```

```Go
func recurSavepoints(t *testing.T, store *Store, index, rollbackAt int)
```

### <a id="setupStoreTest" href="#setupStoreTest">func setupStoreTest(t *testing.T, db dbutil.DB)</a>

```
searchKey: basestore.setupStoreTest
tags: [function private]
```

```Go
func setupStoreTest(t *testing.T, db dbutil.DB)
```

setupStoreTest creates a table used only for testing. This table does not need to be truncated between tests as all tables in the test database are truncated by SetupGlobalTestDB. 

