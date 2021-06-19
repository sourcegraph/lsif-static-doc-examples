# Package store

## Index

* Subpages
  * [internal/workerutil/dbworker/store/mocks](store/mocks.md)
* [Constants](#const)
    * [const queuedCountQuery](#queuedCountQuery)
    * [const selectCandidateQuery](#selectCandidateQuery)
    * [const lockQuery](#lockQuery)
    * [const selectRecordQuery](#selectRecordQuery)
    * [const requeueQuery](#requeueQuery)
    * [const addExecutionLogEntryQuery](#addExecutionLogEntryQuery)
    * [const markCompleteQuery](#markCompleteQuery)
    * [const markErroredQuery](#markErroredQuery)
    * [const markFailedQuery](#markFailedQuery)
    * [const resetStalledQuery](#resetStalledQuery)
    * [const resetStalledMaxResetsQuery](#resetStalledMaxResetsQuery)
* [Variables](#var)
    * [var ErrDequeueTransaction](#ErrDequeueTransaction)
    * [var ErrDequeueRace](#ErrDequeueRace)
    * [var ErrNoRecord](#ErrNoRecord)
    * [var columnNames](#columnNames)
    * [var defaultTestStoreOptions](#defaultTestStoreOptions)
* [Types](#type)
    * [type operations struct](#operations)
        * [func newOperations(storeName string, observationContext *observation.Context) *operations](#newOperations)
    * [type Store interface](#Store)
        * [func New(handle *basestore.TransactableHandle, options Options) Store](#New)
        * [func NewWithMetrics(handle *basestore.TransactableHandle, options Options, observationContext *observation.Context) Store](#NewWithMetrics)
    * [type ExecutionLogEntry workerutil.ExecutionLogEntry](#ExecutionLogEntry)
        * [func (e *ExecutionLogEntry) Scan(value interface{}) error](#ExecutionLogEntry.Scan)
        * [func (e ExecutionLogEntry) Value() (driver.Value, error)](#ExecutionLogEntry.Value)
    * [type store struct](#store)
        * [func newStore(handle *basestore.TransactableHandle, options Options, observationContext *observation.Context) *store](#newStore)
        * [func testStore(db dbutil.DB, options Options) *store](#testStore)
        * [func (s *store) Transact(ctx context.Context) (*store, error)](#store.Transact)
        * [func (s *store) QueuedCount(ctx context.Context, conditions []*sqlf.Query) (_ int, err error)](#store.QueuedCount)
        * [func (s *store) Dequeue(ctx context.Context, conditions []*sqlf.Query) (record workerutil.Record, _ Store, exists bool, err error)](#store.Dequeue)
        * [func (s *store) DequeueWithIndependentTransactionContext(ctx context.Context, conditions []*sqlf.Query) (workerutil.Record, Store, bool, error)](#store.DequeueWithIndependentTransactionContext)
        * [func (s *store) dequeue(ctx context.Context, conditions []*sqlf.Query, independentTxCtx bool) (record workerutil.Record, _ Store, exists bool, err error)](#store.dequeue)
        * [func (s *store) Requeue(ctx context.Context, id int, after time.Time) (err error)](#store.Requeue)
        * [func (s *store) AddExecutionLogEntry(ctx context.Context, id int, entry workerutil.ExecutionLogEntry) (err error)](#store.AddExecutionLogEntry)
        * [func (s *store) MarkComplete(ctx context.Context, id int) (_ bool, err error)](#store.MarkComplete)
        * [func (s *store) MarkErrored(ctx context.Context, id int, failureMessage string) (_ bool, err error)](#store.MarkErrored)
        * [func (s *store) MarkFailed(ctx context.Context, id int, failureMessage string) (_ bool, err error)](#store.MarkFailed)
        * [func (s *store) ResetStalled(ctx context.Context) (resetIDs, erroredIDs []int, err error)](#store.ResetStalled)
        * [func (s *store) resetStalled(ctx context.Context, q string) ([]int, error)](#store.resetStalled)
        * [func (s *store) formatQuery(query string, args ...interface{}) *sqlf.Query](#store.formatQuery)
    * [type Options struct](#Options)
    * [type RecordScanFn func(rows *database/sql.Rows, err error) (github.com/sourcegraph/sourcegraph/internal/workerutil.Record, bool, error)](#RecordScanFn)
    * [type TestRecord struct](#TestRecord)
        * [func (v TestRecord) RecordID() int](#TestRecord.RecordID)
    * [type TestRecordView struct](#TestRecordView)
        * [func (v TestRecordView) RecordID() int](#TestRecordView.RecordID)
    * [type TestRecordRetry struct](#TestRecordRetry)
        * [func (v TestRecordRetry) RecordID() int](#TestRecordRetry.RecordID)
* [Functions](#func)
    * [func ExecutionLogEntries(raw []workerutil.ExecutionLogEntry) (entries []ExecutionLogEntry)](#ExecutionLogEntries)
    * [func DefaultColumnExpressions() []*sqlf.Query](#DefaultColumnExpressions)
    * [func quote(s string) *sqlf.Query](#quote)
    * [func makeConditionSuffix(conditions []*sqlf.Query) *sqlf.Query](#makeConditionSuffix)
    * [func testScanFirstRecord(rows *sql.Rows, queryErr error) (v workerutil.Record, _ bool, err error)](#testScanFirstRecord)
    * [func testScanFirstRecordView(rows *sql.Rows, queryErr error) (v workerutil.Record, exists bool, err error)](#testScanFirstRecordView)
    * [func testScanFirstRecordRetry(rows *sql.Rows, queryErr error) (v workerutil.Record, exists bool, err error)](#testScanFirstRecordRetry)
    * [func setupStoreTest(t *testing.T) dbutil.DB](#setupStoreTest)
    * [func assertDequeueRecordResult(t *testing.T, expectedID int, record interface{}, tx Store, ok bool, err error)](#assertDequeueRecordResult)
    * [func assertDequeueRecordViewResult(t *testing.T, expectedID, expectedNewField int, record interface{}, tx Store, ok bool, err error)](#assertDequeueRecordViewResult)
    * [func assertDequeueRecordRetryResult(t *testing.T, expectedID, record interface{}, tx Store, ok bool, err error)](#assertDequeueRecordRetryResult)
    * [func testNow() time.Time](#testNow)
    * [func init()](#init)
    * [func TestStoreQueuedCount(t *testing.T)](#TestStoreQueuedCount)
    * [func TestStoreQueuedCountFailed(t *testing.T)](#TestStoreQueuedCountFailed)
    * [func TestStoreQueuedCountConditions(t *testing.T)](#TestStoreQueuedCountConditions)
    * [func TestStoreDequeueState(t *testing.T)](#TestStoreDequeueState)
    * [func TestStoreDequeueOrder(t *testing.T)](#TestStoreDequeueOrder)
    * [func TestStoreDequeueConditions(t *testing.T)](#TestStoreDequeueConditions)
    * [func TestStoreDequeueDelay(t *testing.T)](#TestStoreDequeueDelay)
    * [func TestStoreDequeueView(t *testing.T)](#TestStoreDequeueView)
    * [func TestStoreDequeueConcurrent(t *testing.T)](#TestStoreDequeueConcurrent)
    * [func TestStoreDequeueRetryAfter(t *testing.T)](#TestStoreDequeueRetryAfter)
    * [func TestStoreDequeueRetryAfterDisabled(t *testing.T)](#TestStoreDequeueRetryAfterDisabled)
    * [func TestStoreRequeue(t *testing.T)](#TestStoreRequeue)
    * [func TestStoreAddExecutionLogEntry(t *testing.T)](#TestStoreAddExecutionLogEntry)
    * [func TestStoreMarkComplete(t *testing.T)](#TestStoreMarkComplete)
    * [func TestStoreMarkCompleteNotProcessing(t *testing.T)](#TestStoreMarkCompleteNotProcessing)
    * [func TestStoreMarkErrored(t *testing.T)](#TestStoreMarkErrored)
    * [func TestStoreMarkFailed(t *testing.T)](#TestStoreMarkFailed)
    * [func TestStoreMarkErroredAlreadyCompleted(t *testing.T)](#TestStoreMarkErroredAlreadyCompleted)
    * [func TestStoreMarkErroredAlreadyErrored(t *testing.T)](#TestStoreMarkErroredAlreadyErrored)
    * [func TestStoreMarkErroredRetriesExhausted(t *testing.T)](#TestStoreMarkErroredRetriesExhausted)
    * [func TestStoreResetStalled(t *testing.T)](#TestStoreResetStalled)


## <a id="const" href="#const">Constants</a>

### <a id="queuedCountQuery" href="#queuedCountQuery">const queuedCountQuery</a>

```
searchKey: store.queuedCountQuery
```

```Go
const queuedCountQuery = ...
```

### <a id="selectCandidateQuery" href="#selectCandidateQuery">const selectCandidateQuery</a>

```
searchKey: store.selectCandidateQuery
```

```Go
const selectCandidateQuery = ...
```

### <a id="lockQuery" href="#lockQuery">const lockQuery</a>

```
searchKey: store.lockQuery
```

```Go
const lockQuery = ...
```

### <a id="selectRecordQuery" href="#selectRecordQuery">const selectRecordQuery</a>

```
searchKey: store.selectRecordQuery
```

```Go
const selectRecordQuery = ...
```

### <a id="requeueQuery" href="#requeueQuery">const requeueQuery</a>

```
searchKey: store.requeueQuery
```

```Go
const requeueQuery = ...
```

### <a id="addExecutionLogEntryQuery" href="#addExecutionLogEntryQuery">const addExecutionLogEntryQuery</a>

```
searchKey: store.addExecutionLogEntryQuery
```

```Go
const addExecutionLogEntryQuery = ...
```

### <a id="markCompleteQuery" href="#markCompleteQuery">const markCompleteQuery</a>

```
searchKey: store.markCompleteQuery
```

```Go
const markCompleteQuery = ...
```

### <a id="markErroredQuery" href="#markErroredQuery">const markErroredQuery</a>

```
searchKey: store.markErroredQuery
```

```Go
const markErroredQuery = ...
```

### <a id="markFailedQuery" href="#markFailedQuery">const markFailedQuery</a>

```
searchKey: store.markFailedQuery
```

```Go
const markFailedQuery = ...
```

### <a id="resetStalledQuery" href="#resetStalledQuery">const resetStalledQuery</a>

```
searchKey: store.resetStalledQuery
```

```Go
const resetStalledQuery = ...
```

### <a id="resetStalledMaxResetsQuery" href="#resetStalledMaxResetsQuery">const resetStalledMaxResetsQuery</a>

```
searchKey: store.resetStalledMaxResetsQuery
```

```Go
const resetStalledMaxResetsQuery = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="ErrDequeueTransaction" href="#ErrDequeueTransaction">var ErrDequeueTransaction</a>

```
searchKey: store.ErrDequeueTransaction
tags: [exported]
```

```Go
var ErrDequeueTransaction = errors.New("unexpected transaction")
```

ErrDequeueTransaction occurs when Dequeue is called from inside a transaction. 

### <a id="ErrDequeueRace" href="#ErrDequeueRace">var ErrDequeueRace</a>

```
searchKey: store.ErrDequeueRace
tags: [exported]
```

```Go
var ErrDequeueRace = errors.New("dequeue race")
```

ErrDequeueRace occurs when a record selected for dequeue has been locked by another worker. 

### <a id="ErrNoRecord" href="#ErrNoRecord">var ErrNoRecord</a>

```
searchKey: store.ErrNoRecord
tags: [exported]
```

```Go
var ErrNoRecord = errors.New("locked record not found")
```

ErrNoRecord occurs when a record cannot be selected after it has been locked. 

### <a id="columnNames" href="#columnNames">var columnNames</a>

```
searchKey: store.columnNames
```

```Go
var columnNames = ...
```

ColumnNames are the names of the columns expected to be defined by the target table. 

### <a id="defaultTestStoreOptions" href="#defaultTestStoreOptions">var defaultTestStoreOptions</a>

```
searchKey: store.defaultTestStoreOptions
```

```Go
var defaultTestStoreOptions = ...
```

## <a id="type" href="#type">Types</a>

### <a id="operations" href="#operations">type operations struct</a>

```
searchKey: store.operations
```

```Go
type operations struct {
	queuedCount          *observation.Operation
	dequeue              *observation.Operation
	requeue              *observation.Operation
	addExecutionLogEntry *observation.Operation
	markComplete         *observation.Operation
	markErrored          *observation.Operation
	markFailed           *observation.Operation
	resetStalled         *observation.Operation
}
```

#### <a id="newOperations" href="#newOperations">func newOperations(storeName string, observationContext *observation.Context) *operations</a>

```
searchKey: store.newOperations
```

```Go
func newOperations(storeName string, observationContext *observation.Context) *operations
```

### <a id="Store" href="#Store">type Store interface</a>

```
searchKey: store.Store
tags: [exported]
```

```Go
type Store interface {
	basestore.ShareableStore

	// Done performs a commit or rollback of the underlying transaction/savepoint depending
	// returned from the Dequeue method. See basestore.Store#Done for additional documentation.
	Done(err error) error

	// QueuedCount returns the number of records in the queued state matching the given conditions.
	QueuedCount(ctx context.Context, conditions []*sqlf.Query) (int, error)

	// Dequeue selects the first unlocked record matching the given conditions and locks it in a new transaction that
	// should be held by the worker process. If there is such a record, it is returned along with a new store instance
	// that wraps the transaction. The resulting transaction must be closed by the caller, and the transaction should
	// include a state transition of the record into a terminal state. If there is no such unlocked record, a nil record
	// and a nil store will be returned along with a false-valued flag. This method must not be called from within a
	// transaction.
	//
	// The supplied conditions may use the alias provided in `ViewName`, if one was supplied.
	Dequeue(ctx context.Context, conditions []*sqlf.Query) (record workerutil.Record, tx Store, exists bool, err error)

	// DequeueWithIndependentTransactionContext is like Dequeue, but will use a context.Background() for the underlying
	// transaction context. This method allows the transaction to lexically outlive the code in which it was created. This
	// is useful if a longer-running transaction is managed explicitly between multiple goroutines.
	DequeueWithIndependentTransactionContext(ctx context.Context, conditions []*sqlf.Query) (workerutil.Record, Store, bool, error)

	// Requeue updates the state of the record with the given identifier to queued and adds a processing delay before
	// the next dequeue of this record can be performed.
	Requeue(ctx context.Context, id int, after time.Time) error

	// AddExecutionLogEntry adds an executor log entry to the record.
	AddExecutionLogEntry(ctx context.Context, id int, entry workerutil.ExecutionLogEntry) error

	// MarkComplete attempts to update the state of the record to complete. If this record has already been moved from
	// the processing state to a terminal state, this method will have no effect. This method returns a boolean flag
	// indicating if the record was updated.
	MarkComplete(ctx context.Context, id int) (bool, error)

	// MarkErrored attempts to update the state of the record to errored. This method will only have an effect
	// if the current state of the record is processing or completed. A requeued record or a record already marked
	// with an error will not be updated. This method returns a boolean flag indicating if the record was updated.
	MarkErrored(ctx context.Context, id int, failureMessage string) (bool, error)

	// MarkFailed attempts to update the state of the record to failed. This method will only have an effect
	// if the current state of the record is processing or completed. A requeued record or a record already marked
	// with an error will not be updated. This method returns a boolean flag indicating if the record was updated.
	MarkFailed(ctx context.Context, id int, failureMessage string) (bool, error)

	// ResetStalled moves all unlocked records in the processing state for more than `StalledMaxAge` back to the queued
	// state. In order to prevent input that continually crashes worker instances, records that have been reset more
	// than `MaxNumResets` times will be marked as errored. This method returns a list of record identifiers that have
	// been reset and a list of record identifiers that have been marked as errored.
	ResetStalled(ctx context.Context) (resetIDs, erroredIDs []int, err error)
}
```

Store is the persistence layer for the dbworker package that handles worker-side operations backed by a Postgres database. See Options for details on the required shape of the database tables (e.g. table column names/types). 

#### <a id="New" href="#New">func New(handle *basestore.TransactableHandle, options Options) Store</a>

```
searchKey: store.New
tags: [exported]
```

```Go
func New(handle *basestore.TransactableHandle, options Options) Store
```

New creates a new store with the given database handle and options. 

#### <a id="NewWithMetrics" href="#NewWithMetrics">func NewWithMetrics(handle *basestore.TransactableHandle, options Options, observationContext *observation.Context) Store</a>

```
searchKey: store.NewWithMetrics
tags: [exported]
```

```Go
func NewWithMetrics(handle *basestore.TransactableHandle, options Options, observationContext *observation.Context) Store
```

### <a id="ExecutionLogEntry" href="#ExecutionLogEntry">type ExecutionLogEntry workerutil.ExecutionLogEntry</a>

```
searchKey: store.ExecutionLogEntry
tags: [exported]
```

```Go
type ExecutionLogEntry workerutil.ExecutionLogEntry
```

#### <a id="ExecutionLogEntry.Scan" href="#ExecutionLogEntry.Scan">func (e *ExecutionLogEntry) Scan(value interface{}) error</a>

```
searchKey: store.ExecutionLogEntry.Scan
tags: [exported]
```

```Go
func (e *ExecutionLogEntry) Scan(value interface{}) error
```

#### <a id="ExecutionLogEntry.Value" href="#ExecutionLogEntry.Value">func (e ExecutionLogEntry) Value() (driver.Value, error)</a>

```
searchKey: store.ExecutionLogEntry.Value
tags: [exported]
```

```Go
func (e ExecutionLogEntry) Value() (driver.Value, error)
```

### <a id="store" href="#store">type store struct</a>

```
searchKey: store.store
```

```Go
type store struct {
	*basestore.Store
	options        Options
	columnReplacer *strings.Replacer
	operations     *operations
}
```

#### <a id="newStore" href="#newStore">func newStore(handle *basestore.TransactableHandle, options Options, observationContext *observation.Context) *store</a>

```
searchKey: store.newStore
```

```Go
func newStore(handle *basestore.TransactableHandle, options Options, observationContext *observation.Context) *store
```

#### <a id="testStore" href="#testStore">func testStore(db dbutil.DB, options Options) *store</a>

```
searchKey: store.testStore
```

```Go
func testStore(db dbutil.DB, options Options) *store
```

#### <a id="store.Transact" href="#store.Transact">func (s *store) Transact(ctx context.Context) (*store, error)</a>

```
searchKey: store.store.Transact
```

```Go
func (s *store) Transact(ctx context.Context) (*store, error)
```

#### <a id="store.QueuedCount" href="#store.QueuedCount">func (s *store) QueuedCount(ctx context.Context, conditions []*sqlf.Query) (_ int, err error)</a>

```
searchKey: store.store.QueuedCount
```

```Go
func (s *store) QueuedCount(ctx context.Context, conditions []*sqlf.Query) (_ int, err error)
```

QueuedCount returns the number of records in the queued state matching the given conditions. 

#### <a id="store.Dequeue" href="#store.Dequeue">func (s *store) Dequeue(ctx context.Context, conditions []*sqlf.Query) (record workerutil.Record, _ Store, exists bool, err error)</a>

```
searchKey: store.store.Dequeue
```

```Go
func (s *store) Dequeue(ctx context.Context, conditions []*sqlf.Query) (record workerutil.Record, _ Store, exists bool, err error)
```

Dequeue selects the first unlocked record matching the given conditions and locks it in a new transaction that should be held by the worker process. If there is such a record, it is returned along with a new store instance that wraps the transaction. The resulting transaction must be closed by the caller, and the transaction should include a state transition of the record into a terminal state. If there is no such unlocked record, a nil record and a nil store will be returned along with a false-valued flag. This method must not be called from within a transaction. 

The supplied conditions may use the alias provided in `ViewName`, if one was supplied. 

#### <a id="store.DequeueWithIndependentTransactionContext" href="#store.DequeueWithIndependentTransactionContext">func (s *store) DequeueWithIndependentTransactionContext(ctx context.Context, conditions []*sqlf.Query) (workerutil.Record, Store, bool, error)</a>

```
searchKey: store.store.DequeueWithIndependentTransactionContext
```

```Go
func (s *store) DequeueWithIndependentTransactionContext(ctx context.Context, conditions []*sqlf.Query) (workerutil.Record, Store, bool, error)
```

DequeueWithIndependentTransactionContext is like Dequeue, but will use a context.Background() for the underlying transaction context. This method allows the transaction to lexically outlive the code in which it was created. This is useful if a longer-running transaction is managed explicitly between multiple goroutines. 

#### <a id="store.dequeue" href="#store.dequeue">func (s *store) dequeue(ctx context.Context, conditions []*sqlf.Query, independentTxCtx bool) (record workerutil.Record, _ Store, exists bool, err error)</a>

```
searchKey: store.store.dequeue
```

```Go
func (s *store) dequeue(ctx context.Context, conditions []*sqlf.Query, independentTxCtx bool) (record workerutil.Record, _ Store, exists bool, err error)
```

#### <a id="store.Requeue" href="#store.Requeue">func (s *store) Requeue(ctx context.Context, id int, after time.Time) (err error)</a>

```
searchKey: store.store.Requeue
```

```Go
func (s *store) Requeue(ctx context.Context, id int, after time.Time) (err error)
```

Requeue updates the state of the record with the given identifier to queued and adds a processing delay before the next dequeue of this record can be performed. 

#### <a id="store.AddExecutionLogEntry" href="#store.AddExecutionLogEntry">func (s *store) AddExecutionLogEntry(ctx context.Context, id int, entry workerutil.ExecutionLogEntry) (err error)</a>

```
searchKey: store.store.AddExecutionLogEntry
```

```Go
func (s *store) AddExecutionLogEntry(ctx context.Context, id int, entry workerutil.ExecutionLogEntry) (err error)
```

AddExecutionLogEntry adds an executor log entry to the record. 

#### <a id="store.MarkComplete" href="#store.MarkComplete">func (s *store) MarkComplete(ctx context.Context, id int) (_ bool, err error)</a>

```
searchKey: store.store.MarkComplete
```

```Go
func (s *store) MarkComplete(ctx context.Context, id int) (_ bool, err error)
```

MarkComplete attempts to update the state of the record to complete. If this record has already been moved from the processing state to a terminal state, this method will have no effect. This method returns a boolean flag indicating if the record was updated. 

#### <a id="store.MarkErrored" href="#store.MarkErrored">func (s *store) MarkErrored(ctx context.Context, id int, failureMessage string) (_ bool, err error)</a>

```
searchKey: store.store.MarkErrored
```

```Go
func (s *store) MarkErrored(ctx context.Context, id int, failureMessage string) (_ bool, err error)
```

MarkErrored attempts to update the state of the record to errored. This method will only have an effect if the current state of the record is processing or completed. A requeued record or a record already marked with an error will not be updated. This method returns a boolean flag indicating if the record was updated. 

#### <a id="store.MarkFailed" href="#store.MarkFailed">func (s *store) MarkFailed(ctx context.Context, id int, failureMessage string) (_ bool, err error)</a>

```
searchKey: store.store.MarkFailed
```

```Go
func (s *store) MarkFailed(ctx context.Context, id int, failureMessage string) (_ bool, err error)
```

MarkFailed attempts to update the state of the record to failed. This method will only have an effect if the current state of the record is processing or completed. A requeued record or a record already marked with an error will not be updated. This method returns a boolean flag indicating if the record was updated. 

#### <a id="store.ResetStalled" href="#store.ResetStalled">func (s *store) ResetStalled(ctx context.Context) (resetIDs, erroredIDs []int, err error)</a>

```
searchKey: store.store.ResetStalled
```

```Go
func (s *store) ResetStalled(ctx context.Context) (resetIDs, erroredIDs []int, err error)
```

ResetStalled moves all unlocked records in the processing state for more than `StalledMaxAge` back to the queued state. In order to prevent input that continually crashes worker instances, records that have been reset more than `MaxNumResets` times will be marked as errored. This method returns a list of record identifiers that have been reset and a list of record identifiers that have been marked as errored. 

#### <a id="store.resetStalled" href="#store.resetStalled">func (s *store) resetStalled(ctx context.Context, q string) ([]int, error)</a>

```
searchKey: store.store.resetStalled
```

```Go
func (s *store) resetStalled(ctx context.Context, q string) ([]int, error)
```

#### <a id="store.formatQuery" href="#store.formatQuery">func (s *store) formatQuery(query string, args ...interface{}) *sqlf.Query</a>

```
searchKey: store.store.formatQuery
```

```Go
func (s *store) formatQuery(query string, args ...interface{}) *sqlf.Query
```

### <a id="Options" href="#Options">type Options struct</a>

```
searchKey: store.Options
tags: [exported]
```

```Go
type Options struct {
	// Name denotes the name of the store used to distinguish log messages and emitted metrics. The
	// store constructor will fail if this field is not supplied.
	Name string

	// TableName is the name of the table containing work records.
	//
	// The target table (and the target view referenced by `ViewName`) must have the following columns
	// and types:
	//
	//   - id: integer primary key
	//   - state: text (may be updated to `queued`, `processing`, `errored`, or `failed`)
	//   - failure_message: text
	//   - started_at: timestamp with time zone
	//   - finished_at: timestamp with time zone
	//   - process_after: timestamp with time zone
	//   - num_resets: integer not null
	//   - num_failures: integer not null
	//   - execution_logs: json[] (each entry has the form of `ExecutionLogEntry`)
	//
	// The names of these columns may be customized based on the table name by adding a replacement
	// pair in the AlternateColumnNames mapping.
	//
	// It's recommended to put an index or (or partial index) on the state column for more efficient
	// dequeue operations.
	TableName string

	// AlternateColumnNames is a map from expected column names to actual column names in the target
	// table. This allows existing tables to be more easily retrofitted into the expected record
	// shape.
	AlternateColumnNames map[string]string

	// ViewName is an optional name of a view on top of the table containing work records to query when
	// selecting a candidate and when selecting the record after it has been locked. If this value is
	// not supplied, `TableName` will be used. The value supplied may also indicate a table alias, which
	// can be referenced in `OrderByExpression`, `ColumnExpressions`, and the conditions supplied to
	// `Dequeue`.
	//
	// The target of this column must be a view on top of the configured table with the same column
	// requirements as the base table described above.
	//
	// Example use case:
	// The processor for LSIF uploads supplies `lsif_uploads_with_repository_name`, a view on top of the
	// `lsif_uploads` table that joins work records with the `repo` table and adds an additional repository
	// name column. This allows `Dequeue` to return a record with additional data so that a second query
	// is not necessary by the caller.
	ViewName string

	// Scan is the function used to convert a rows object into a record of the expected shape.
	Scan RecordScanFn

	// OrderByExpression is the SQL expression used to order candidate records when selecting the next
	// batch of work to perform. This expression may use the alias provided in `ViewName`, if one was
	// supplied.
	OrderByExpression *sqlf.Query

	// ColumnExpressions are the target columns provided to the query when selecting a locked record.
	// These expressions may use the alias provided in `ViewName`, if one was supplied.
	ColumnExpressions []*sqlf.Query

	// StalledMaxAge is the maximum allow duration between updating the state of a record as "processing"
	// and locking the record row during processing. An unlocked row that is marked as processing likely
	// indicates that the worker that dequeued the record has died. There should be a nearly-zero delay
	// between these states during normal operation.
	StalledMaxAge time.Duration

	// MaxNumResets is the maximum number of times a record can be implicitly reset back to the queued
	// state (via `ResetStalled`). If a record's reset attempts counter reaches this threshold, it will
	// be moved into the errored state rather than queued on its next reset to prevent an infinite retry
	// cycle of the same input.
	MaxNumResets int

	// RetryAfter determines whether the store dequeues jobs that have errored more than RetryAfter ago.
	// Setting this value to zero will disable retries entirely.
	//
	// If RetryAfter is a non-zero duration, the store dequeues records where:
	//
	//   - the state is 'errored'
	//   - the failed attempts counter hasn't reached MaxNumRetries
	//   - the finished_at timestamp was more than RetryAfter ago
	RetryAfter time.Duration

	// MaxNumRetries is the maximum number of times a record can be retried after an explicit failure.
	// Setting this value to zero will disable retries entirely.
	MaxNumRetries int
}
```

Options configure the behavior of Store over a particular set of tables, columns, and expressions. 

### <a id="RecordScanFn" href="#RecordScanFn">type RecordScanFn func(rows *database/sql.Rows, err error) (github.com/sourcegraph/sourcegraph/internal/workerutil.Record, bool, error)</a>

```
searchKey: store.RecordScanFn
tags: [exported]
```

```Go
type RecordScanFn func(rows *sql.Rows, err error) (workerutil.Record, bool, error)
```

RecordScanFn is a function that interprets row values as a particular record. This function should return a false-valued flag if the given result set was empty. This function must close the rows value if the given error value is nil. 

See the `CloseRows` function in the store/base package for suggested implementation details. 

### <a id="TestRecord" href="#TestRecord">type TestRecord struct</a>

```
searchKey: store.TestRecord
```

```Go
type TestRecord struct {
	ID    int
	State string
}
```

#### <a id="TestRecord.RecordID" href="#TestRecord.RecordID">func (v TestRecord) RecordID() int</a>

```
searchKey: store.TestRecord.RecordID
```

```Go
func (v TestRecord) RecordID() int
```

### <a id="TestRecordView" href="#TestRecordView">type TestRecordView struct</a>

```
searchKey: store.TestRecordView
```

```Go
type TestRecordView struct {
	ID       int
	State    string
	NewField int
}
```

#### <a id="TestRecordView.RecordID" href="#TestRecordView.RecordID">func (v TestRecordView) RecordID() int</a>

```
searchKey: store.TestRecordView.RecordID
```

```Go
func (v TestRecordView) RecordID() int
```

### <a id="TestRecordRetry" href="#TestRecordRetry">type TestRecordRetry struct</a>

```
searchKey: store.TestRecordRetry
```

```Go
type TestRecordRetry struct {
	ID        int
	State     string
	NumResets int
}
```

#### <a id="TestRecordRetry.RecordID" href="#TestRecordRetry.RecordID">func (v TestRecordRetry) RecordID() int</a>

```
searchKey: store.TestRecordRetry.RecordID
```

```Go
func (v TestRecordRetry) RecordID() int
```

## <a id="func" href="#func">Functions</a>

### <a id="ExecutionLogEntries" href="#ExecutionLogEntries">func ExecutionLogEntries(raw []workerutil.ExecutionLogEntry) (entries []ExecutionLogEntry)</a>

```
searchKey: store.ExecutionLogEntries
tags: [exported]
```

```Go
func ExecutionLogEntries(raw []workerutil.ExecutionLogEntry) (entries []ExecutionLogEntry)
```

### <a id="DefaultColumnExpressions" href="#DefaultColumnExpressions">func DefaultColumnExpressions() []*sqlf.Query</a>

```
searchKey: store.DefaultColumnExpressions
tags: [exported]
```

```Go
func DefaultColumnExpressions() []*sqlf.Query
```

DefaultColumnExpressions returns a slice of expressions for the default column name we expect. 

### <a id="quote" href="#quote">func quote(s string) *sqlf.Query</a>

```
searchKey: store.quote
```

```Go
func quote(s string) *sqlf.Query
```

quote wraps the given string in a *sqlf.Query so that it is not passed to the database as a parameter. It is necessary to quote things such as table names, columns, and other expressions that are not simple values. 

### <a id="makeConditionSuffix" href="#makeConditionSuffix">func makeConditionSuffix(conditions []*sqlf.Query) *sqlf.Query</a>

```
searchKey: store.makeConditionSuffix
```

```Go
func makeConditionSuffix(conditions []*sqlf.Query) *sqlf.Query
```

makeConditionSuffix returns a *sqlf.Query containing "AND {c1 AND c2 AND ...}" when the given set of conditions is non-empty, and an empty string otherwise. 

### <a id="testScanFirstRecord" href="#testScanFirstRecord">func testScanFirstRecord(rows *sql.Rows, queryErr error) (v workerutil.Record, _ bool, err error)</a>

```
searchKey: store.testScanFirstRecord
```

```Go
func testScanFirstRecord(rows *sql.Rows, queryErr error) (v workerutil.Record, _ bool, err error)
```

### <a id="testScanFirstRecordView" href="#testScanFirstRecordView">func testScanFirstRecordView(rows *sql.Rows, queryErr error) (v workerutil.Record, exists bool, err error)</a>

```
searchKey: store.testScanFirstRecordView
```

```Go
func testScanFirstRecordView(rows *sql.Rows, queryErr error) (v workerutil.Record, exists bool, err error)
```

### <a id="testScanFirstRecordRetry" href="#testScanFirstRecordRetry">func testScanFirstRecordRetry(rows *sql.Rows, queryErr error) (v workerutil.Record, exists bool, err error)</a>

```
searchKey: store.testScanFirstRecordRetry
```

```Go
func testScanFirstRecordRetry(rows *sql.Rows, queryErr error) (v workerutil.Record, exists bool, err error)
```

### <a id="setupStoreTest" href="#setupStoreTest">func setupStoreTest(t *testing.T) dbutil.DB</a>

```
searchKey: store.setupStoreTest
```

```Go
func setupStoreTest(t *testing.T) dbutil.DB
```

### <a id="assertDequeueRecordResult" href="#assertDequeueRecordResult">func assertDequeueRecordResult(t *testing.T, expectedID int, record interface{}, tx Store, ok bool, err error)</a>

```
searchKey: store.assertDequeueRecordResult
```

```Go
func assertDequeueRecordResult(t *testing.T, expectedID int, record interface{}, tx Store, ok bool, err error)
```

### <a id="assertDequeueRecordViewResult" href="#assertDequeueRecordViewResult">func assertDequeueRecordViewResult(t *testing.T, expectedID, expectedNewField int, record interface{}, tx Store, ok bool, err error)</a>

```
searchKey: store.assertDequeueRecordViewResult
```

```Go
func assertDequeueRecordViewResult(t *testing.T, expectedID, expectedNewField int, record interface{}, tx Store, ok bool, err error)
```

### <a id="assertDequeueRecordRetryResult" href="#assertDequeueRecordRetryResult">func assertDequeueRecordRetryResult(t *testing.T, expectedID, record interface{}, tx Store, ok bool, err error)</a>

```
searchKey: store.assertDequeueRecordRetryResult
```

```Go
func assertDequeueRecordRetryResult(t *testing.T, expectedID, record interface{}, tx Store, ok bool, err error)
```

### <a id="testNow" href="#testNow">func testNow() time.Time</a>

```
searchKey: store.testNow
```

```Go
func testNow() time.Time
```

### <a id="init" href="#init">func init()</a>

```
searchKey: store.init
```

```Go
func init()
```

### <a id="TestStoreQueuedCount" href="#TestStoreQueuedCount">func TestStoreQueuedCount(t *testing.T)</a>

```
searchKey: store.TestStoreQueuedCount
```

```Go
func TestStoreQueuedCount(t *testing.T)
```

### <a id="TestStoreQueuedCountFailed" href="#TestStoreQueuedCountFailed">func TestStoreQueuedCountFailed(t *testing.T)</a>

```
searchKey: store.TestStoreQueuedCountFailed
```

```Go
func TestStoreQueuedCountFailed(t *testing.T)
```

### <a id="TestStoreQueuedCountConditions" href="#TestStoreQueuedCountConditions">func TestStoreQueuedCountConditions(t *testing.T)</a>

```
searchKey: store.TestStoreQueuedCountConditions
```

```Go
func TestStoreQueuedCountConditions(t *testing.T)
```

### <a id="TestStoreDequeueState" href="#TestStoreDequeueState">func TestStoreDequeueState(t *testing.T)</a>

```
searchKey: store.TestStoreDequeueState
```

```Go
func TestStoreDequeueState(t *testing.T)
```

### <a id="TestStoreDequeueOrder" href="#TestStoreDequeueOrder">func TestStoreDequeueOrder(t *testing.T)</a>

```
searchKey: store.TestStoreDequeueOrder
```

```Go
func TestStoreDequeueOrder(t *testing.T)
```

### <a id="TestStoreDequeueConditions" href="#TestStoreDequeueConditions">func TestStoreDequeueConditions(t *testing.T)</a>

```
searchKey: store.TestStoreDequeueConditions
```

```Go
func TestStoreDequeueConditions(t *testing.T)
```

### <a id="TestStoreDequeueDelay" href="#TestStoreDequeueDelay">func TestStoreDequeueDelay(t *testing.T)</a>

```
searchKey: store.TestStoreDequeueDelay
```

```Go
func TestStoreDequeueDelay(t *testing.T)
```

### <a id="TestStoreDequeueView" href="#TestStoreDequeueView">func TestStoreDequeueView(t *testing.T)</a>

```
searchKey: store.TestStoreDequeueView
```

```Go
func TestStoreDequeueView(t *testing.T)
```

### <a id="TestStoreDequeueConcurrent" href="#TestStoreDequeueConcurrent">func TestStoreDequeueConcurrent(t *testing.T)</a>

```
searchKey: store.TestStoreDequeueConcurrent
```

```Go
func TestStoreDequeueConcurrent(t *testing.T)
```

### <a id="TestStoreDequeueRetryAfter" href="#TestStoreDequeueRetryAfter">func TestStoreDequeueRetryAfter(t *testing.T)</a>

```
searchKey: store.TestStoreDequeueRetryAfter
```

```Go
func TestStoreDequeueRetryAfter(t *testing.T)
```

### <a id="TestStoreDequeueRetryAfterDisabled" href="#TestStoreDequeueRetryAfterDisabled">func TestStoreDequeueRetryAfterDisabled(t *testing.T)</a>

```
searchKey: store.TestStoreDequeueRetryAfterDisabled
```

```Go
func TestStoreDequeueRetryAfterDisabled(t *testing.T)
```

### <a id="TestStoreRequeue" href="#TestStoreRequeue">func TestStoreRequeue(t *testing.T)</a>

```
searchKey: store.TestStoreRequeue
```

```Go
func TestStoreRequeue(t *testing.T)
```

### <a id="TestStoreAddExecutionLogEntry" href="#TestStoreAddExecutionLogEntry">func TestStoreAddExecutionLogEntry(t *testing.T)</a>

```
searchKey: store.TestStoreAddExecutionLogEntry
```

```Go
func TestStoreAddExecutionLogEntry(t *testing.T)
```

### <a id="TestStoreMarkComplete" href="#TestStoreMarkComplete">func TestStoreMarkComplete(t *testing.T)</a>

```
searchKey: store.TestStoreMarkComplete
```

```Go
func TestStoreMarkComplete(t *testing.T)
```

### <a id="TestStoreMarkCompleteNotProcessing" href="#TestStoreMarkCompleteNotProcessing">func TestStoreMarkCompleteNotProcessing(t *testing.T)</a>

```
searchKey: store.TestStoreMarkCompleteNotProcessing
```

```Go
func TestStoreMarkCompleteNotProcessing(t *testing.T)
```

### <a id="TestStoreMarkErrored" href="#TestStoreMarkErrored">func TestStoreMarkErrored(t *testing.T)</a>

```
searchKey: store.TestStoreMarkErrored
```

```Go
func TestStoreMarkErrored(t *testing.T)
```

### <a id="TestStoreMarkFailed" href="#TestStoreMarkFailed">func TestStoreMarkFailed(t *testing.T)</a>

```
searchKey: store.TestStoreMarkFailed
```

```Go
func TestStoreMarkFailed(t *testing.T)
```

### <a id="TestStoreMarkErroredAlreadyCompleted" href="#TestStoreMarkErroredAlreadyCompleted">func TestStoreMarkErroredAlreadyCompleted(t *testing.T)</a>

```
searchKey: store.TestStoreMarkErroredAlreadyCompleted
```

```Go
func TestStoreMarkErroredAlreadyCompleted(t *testing.T)
```

### <a id="TestStoreMarkErroredAlreadyErrored" href="#TestStoreMarkErroredAlreadyErrored">func TestStoreMarkErroredAlreadyErrored(t *testing.T)</a>

```
searchKey: store.TestStoreMarkErroredAlreadyErrored
```

```Go
func TestStoreMarkErroredAlreadyErrored(t *testing.T)
```

### <a id="TestStoreMarkErroredRetriesExhausted" href="#TestStoreMarkErroredRetriesExhausted">func TestStoreMarkErroredRetriesExhausted(t *testing.T)</a>

```
searchKey: store.TestStoreMarkErroredRetriesExhausted
```

```Go
func TestStoreMarkErroredRetriesExhausted(t *testing.T)
```

### <a id="TestStoreResetStalled" href="#TestStoreResetStalled">func TestStoreResetStalled(t *testing.T)</a>

```
searchKey: store.TestStoreResetStalled
```

```Go
func TestStoreResetStalled(t *testing.T)
```

