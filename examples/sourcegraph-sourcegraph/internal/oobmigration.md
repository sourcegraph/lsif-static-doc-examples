# Package oobmigration

## Index

* [Constants](#const)
    * [const getByIDQuery](#getByIDQuery)
    * [const listQuery](#listQuery)
    * [const updateDirectionQuery](#updateDirectionQuery)
    * [const updateProgressQuery](#updateProgressQuery)
    * [const MaxMigrationErrors](#MaxMigrationErrors)
    * [const addErrorQuery](#addErrorQuery)
    * [const addErrorUpdateTimeQuery](#addErrorUpdateTimeQuery)
    * [const addErrorPruneQuery](#addErrorPruneQuery)
    * [const VersionOrderBefore](#VersionOrderBefore)
    * [const VersionOrderEqual](#VersionOrderEqual)
    * [const VersionOrderAfter](#VersionOrderAfter)
* [Variables](#var)
    * [var ErrMigratorConflict](#ErrMigratorConflict)
    * [var ReturnEnterpriseMigrations](#ReturnEnterpriseMigrations)
    * [var testTime](#testTime)
    * [var testMigrations](#testMigrations)
    * [var testEnterpriseMigrations](#testEnterpriseMigrations)
* [Types](#type)
    * [type storeIface interface](#storeIface)
    * [type Migrator interface](#Migrator)
    * [type operations struct](#operations)
        * [func newOperations(observationContext *observation.Context) *operations](#newOperations)
    * [type Runner struct](#Runner)
        * [func NewRunnerWithDB(db dbutil.DB, refreshInterval time.Duration, observationContext *observation.Context) *Runner](#NewRunnerWithDB)
        * [func newRunner(store storeIface, refreshTicker glock.Ticker, observationContext *observation.Context) *Runner](#newRunner)
        * [func (r *Runner) Register(id int, migrator Migrator, options MigratorOptions) error](#Runner.Register)
        * [func (r *Runner) Validate(ctx context.Context, currentVersion, firstVersion Version) error](#Runner.Validate)
        * [func (r *Runner) Start()](#Runner.Start)
        * [func (r *Runner) listMigrations(ctx context.Context) <-chan []Migration](#Runner.listMigrations)
        * [func (r *Runner) ensureProcessorIsRunning(wg *sync.WaitGroup, m map[int]chan Migration, id int, runMigrator func(<-chan Migration))](#Runner.ensureProcessorIsRunning)
        * [func (r *Runner) Stop()](#Runner.Stop)
    * [type migratorAndOption struct](#migratorAndOption)
    * [type MigratorOptions struct](#MigratorOptions)
    * [type migrationStatusError struct](#migrationStatusError)
        * [func (e migrationStatusError) Error() string](#migrationStatusError.Error)
    * [type migratorOptions struct](#migratorOptions)
    * [type Migration struct](#Migration)
        * [func (m Migration) Complete() bool](#Migration.Complete)
    * [type MigrationError struct](#MigrationError)
    * [type Store struct](#Store)
        * [func NewStoreWithDB(db dbutil.DB) *Store](#NewStoreWithDB)
        * [func testStore(t *testing.T, db dbutil.DB) *Store](#testStore)
        * [func (s *Store) With(other basestore.ShareableStore) *Store](#Store.With)
        * [func (s *Store) Transact(ctx context.Context) (*Store, error)](#Store.Transact)
        * [func (s *Store) GetByID(ctx context.Context, id int) (_ Migration, _ bool, err error)](#Store.GetByID)
        * [func (s *Store) List(ctx context.Context) (_ []Migration, err error)](#Store.List)
        * [func (s *Store) UpdateDirection(ctx context.Context, id int, applyReverse bool) error](#Store.UpdateDirection)
        * [func (s *Store) UpdateProgress(ctx context.Context, id int, progress float64) error](#Store.UpdateProgress)
        * [func (s *Store) updateProgress(ctx context.Context, id int, progress float64, now time.Time) error](#Store.updateProgress)
        * [func (s *Store) AddError(ctx context.Context, id int, message string) (err error)](#Store.AddError)
        * [func (s *Store) addError(ctx context.Context, id int, message string, now time.Time) (err error)](#Store.addError)
    * [type Version struct](#Version)
        * [func NewVersion(major, minor int) Version](#NewVersion)
        * [func newVersionPtr(major, minor int) *Version](#newVersionPtr)
        * [func (v Version) String() string](#Version.String)
    * [type VersionOrder int](#VersionOrder)
        * [func compareVersions(a, b Version) (VersionOrder, error)](#compareVersions)
    * [type MockMigrator struct](#MockMigrator)
        * [func NewMockMigrator() *MockMigrator](#NewMockMigrator)
        * [func NewMockMigratorFrom(i Migrator) *MockMigrator](#NewMockMigratorFrom)
        * [func (m *MockMigrator) Down(v0 context.Context) error](#MockMigrator.Down)
        * [func (m *MockMigrator) Progress(v0 context.Context) (float64, error)](#MockMigrator.Progress)
        * [func (m *MockMigrator) Up(v0 context.Context) error](#MockMigrator.Up)
    * [type MigratorDownFunc struct](#MigratorDownFunc)
        * [func (f *MigratorDownFunc) SetDefaultHook(hook func(context.Context) error)](#MigratorDownFunc.SetDefaultHook)
        * [func (f *MigratorDownFunc) PushHook(hook func(context.Context) error)](#MigratorDownFunc.PushHook)
        * [func (f *MigratorDownFunc) SetDefaultReturn(r0 error)](#MigratorDownFunc.SetDefaultReturn)
        * [func (f *MigratorDownFunc) PushReturn(r0 error)](#MigratorDownFunc.PushReturn)
        * [func (f *MigratorDownFunc) nextHook() func(context.Context) error](#MigratorDownFunc.nextHook)
        * [func (f *MigratorDownFunc) appendCall(r0 MigratorDownFuncCall)](#MigratorDownFunc.appendCall)
        * [func (f *MigratorDownFunc) History() []MigratorDownFuncCall](#MigratorDownFunc.History)
    * [type MigratorDownFuncCall struct](#MigratorDownFuncCall)
        * [func (c MigratorDownFuncCall) Args() []interface{}](#MigratorDownFuncCall.Args)
        * [func (c MigratorDownFuncCall) Results() []interface{}](#MigratorDownFuncCall.Results)
    * [type MigratorProgressFunc struct](#MigratorProgressFunc)
        * [func (f *MigratorProgressFunc) SetDefaultHook(hook func(context.Context) (float64, error))](#MigratorProgressFunc.SetDefaultHook)
        * [func (f *MigratorProgressFunc) PushHook(hook func(context.Context) (float64, error))](#MigratorProgressFunc.PushHook)
        * [func (f *MigratorProgressFunc) SetDefaultReturn(r0 float64, r1 error)](#MigratorProgressFunc.SetDefaultReturn)
        * [func (f *MigratorProgressFunc) PushReturn(r0 float64, r1 error)](#MigratorProgressFunc.PushReturn)
        * [func (f *MigratorProgressFunc) nextHook() func(context.Context) (float64, error)](#MigratorProgressFunc.nextHook)
        * [func (f *MigratorProgressFunc) appendCall(r0 MigratorProgressFuncCall)](#MigratorProgressFunc.appendCall)
        * [func (f *MigratorProgressFunc) History() []MigratorProgressFuncCall](#MigratorProgressFunc.History)
    * [type MigratorProgressFuncCall struct](#MigratorProgressFuncCall)
        * [func (c MigratorProgressFuncCall) Args() []interface{}](#MigratorProgressFuncCall.Args)
        * [func (c MigratorProgressFuncCall) Results() []interface{}](#MigratorProgressFuncCall.Results)
    * [type MigratorUpFunc struct](#MigratorUpFunc)
        * [func (f *MigratorUpFunc) SetDefaultHook(hook func(context.Context) error)](#MigratorUpFunc.SetDefaultHook)
        * [func (f *MigratorUpFunc) PushHook(hook func(context.Context) error)](#MigratorUpFunc.PushHook)
        * [func (f *MigratorUpFunc) SetDefaultReturn(r0 error)](#MigratorUpFunc.SetDefaultReturn)
        * [func (f *MigratorUpFunc) PushReturn(r0 error)](#MigratorUpFunc.PushReturn)
        * [func (f *MigratorUpFunc) nextHook() func(context.Context) error](#MigratorUpFunc.nextHook)
        * [func (f *MigratorUpFunc) appendCall(r0 MigratorUpFuncCall)](#MigratorUpFunc.appendCall)
        * [func (f *MigratorUpFunc) History() []MigratorUpFuncCall](#MigratorUpFunc.History)
    * [type MigratorUpFuncCall struct](#MigratorUpFuncCall)
        * [func (c MigratorUpFuncCall) Args() []interface{}](#MigratorUpFuncCall.Args)
        * [func (c MigratorUpFuncCall) Results() []interface{}](#MigratorUpFuncCall.Results)
    * [type MockStoreIface struct](#MockStoreIface)
        * [func NewMockStoreIface() *MockStoreIface](#NewMockStoreIface)
        * [func NewMockStoreIfaceFrom(i surrogateMockStoreIface) *MockStoreIface](#NewMockStoreIfaceFrom)
        * [func (m *MockStoreIface) AddError(v0 context.Context, v1 int, v2 string) error](#MockStoreIface.AddError)
        * [func (m *MockStoreIface) List(v0 context.Context) ([]Migration, error)](#MockStoreIface.List)
        * [func (m *MockStoreIface) UpdateProgress(v0 context.Context, v1 int, v2 float64) error](#MockStoreIface.UpdateProgress)
    * [type surrogateMockStoreIface interface](#surrogateMockStoreIface)
    * [type StoreIfaceAddErrorFunc struct](#StoreIfaceAddErrorFunc)
        * [func (f *StoreIfaceAddErrorFunc) SetDefaultHook(hook func(context.Context, int, string) error)](#StoreIfaceAddErrorFunc.SetDefaultHook)
        * [func (f *StoreIfaceAddErrorFunc) PushHook(hook func(context.Context, int, string) error)](#StoreIfaceAddErrorFunc.PushHook)
        * [func (f *StoreIfaceAddErrorFunc) SetDefaultReturn(r0 error)](#StoreIfaceAddErrorFunc.SetDefaultReturn)
        * [func (f *StoreIfaceAddErrorFunc) PushReturn(r0 error)](#StoreIfaceAddErrorFunc.PushReturn)
        * [func (f *StoreIfaceAddErrorFunc) nextHook() func(context.Context, int, string) error](#StoreIfaceAddErrorFunc.nextHook)
        * [func (f *StoreIfaceAddErrorFunc) appendCall(r0 StoreIfaceAddErrorFuncCall)](#StoreIfaceAddErrorFunc.appendCall)
        * [func (f *StoreIfaceAddErrorFunc) History() []StoreIfaceAddErrorFuncCall](#StoreIfaceAddErrorFunc.History)
    * [type StoreIfaceAddErrorFuncCall struct](#StoreIfaceAddErrorFuncCall)
        * [func (c StoreIfaceAddErrorFuncCall) Args() []interface{}](#StoreIfaceAddErrorFuncCall.Args)
        * [func (c StoreIfaceAddErrorFuncCall) Results() []interface{}](#StoreIfaceAddErrorFuncCall.Results)
    * [type StoreIfaceListFunc struct](#StoreIfaceListFunc)
        * [func (f *StoreIfaceListFunc) SetDefaultHook(hook func(context.Context) ([]Migration, error))](#StoreIfaceListFunc.SetDefaultHook)
        * [func (f *StoreIfaceListFunc) PushHook(hook func(context.Context) ([]Migration, error))](#StoreIfaceListFunc.PushHook)
        * [func (f *StoreIfaceListFunc) SetDefaultReturn(r0 []Migration, r1 error)](#StoreIfaceListFunc.SetDefaultReturn)
        * [func (f *StoreIfaceListFunc) PushReturn(r0 []Migration, r1 error)](#StoreIfaceListFunc.PushReturn)
        * [func (f *StoreIfaceListFunc) nextHook() func(context.Context) ([]Migration, error)](#StoreIfaceListFunc.nextHook)
        * [func (f *StoreIfaceListFunc) appendCall(r0 StoreIfaceListFuncCall)](#StoreIfaceListFunc.appendCall)
        * [func (f *StoreIfaceListFunc) History() []StoreIfaceListFuncCall](#StoreIfaceListFunc.History)
    * [type StoreIfaceListFuncCall struct](#StoreIfaceListFuncCall)
        * [func (c StoreIfaceListFuncCall) Args() []interface{}](#StoreIfaceListFuncCall.Args)
        * [func (c StoreIfaceListFuncCall) Results() []interface{}](#StoreIfaceListFuncCall.Results)
    * [type StoreIfaceUpdateProgressFunc struct](#StoreIfaceUpdateProgressFunc)
        * [func (f *StoreIfaceUpdateProgressFunc) SetDefaultHook(hook func(context.Context, int, float64) error)](#StoreIfaceUpdateProgressFunc.SetDefaultHook)
        * [func (f *StoreIfaceUpdateProgressFunc) PushHook(hook func(context.Context, int, float64) error)](#StoreIfaceUpdateProgressFunc.PushHook)
        * [func (f *StoreIfaceUpdateProgressFunc) SetDefaultReturn(r0 error)](#StoreIfaceUpdateProgressFunc.SetDefaultReturn)
        * [func (f *StoreIfaceUpdateProgressFunc) PushReturn(r0 error)](#StoreIfaceUpdateProgressFunc.PushReturn)
        * [func (f *StoreIfaceUpdateProgressFunc) nextHook() func(context.Context, int, float64) error](#StoreIfaceUpdateProgressFunc.nextHook)
        * [func (f *StoreIfaceUpdateProgressFunc) appendCall(r0 StoreIfaceUpdateProgressFuncCall)](#StoreIfaceUpdateProgressFunc.appendCall)
        * [func (f *StoreIfaceUpdateProgressFunc) History() []StoreIfaceUpdateProgressFuncCall](#StoreIfaceUpdateProgressFunc.History)
    * [type StoreIfaceUpdateProgressFuncCall struct](#StoreIfaceUpdateProgressFuncCall)
        * [func (c StoreIfaceUpdateProgressFuncCall) Args() []interface{}](#StoreIfaceUpdateProgressFuncCall.Args)
        * [func (c StoreIfaceUpdateProgressFuncCall) Results() []interface{}](#StoreIfaceUpdateProgressFuncCall.Results)
* [Functions](#func)
    * [func newMigrationStatusError(id int, expectedProgress, actualProgress float64) error](#newMigrationStatusError)
    * [func wrapMigrationErrors(errs ...error) error](#wrapMigrationErrors)
    * [func runMigrator(ctx context.Context, store storeIface, migrator Migrator, migrations <-chan Migration, options migratorOptions, operations *operations)](#runMigrator)
    * [func runMigrationFunction(ctx context.Context, store storeIface, migration *Migration, migrator Migrator, operations *operations) error](#runMigrationFunction)
    * [func updateProgress(ctx context.Context, store storeIface, migration *Migration, migrator Migrator) error](#updateProgress)
    * [func runMigrationUp(ctx context.Context, migration *Migration, migrator Migrator, operations *operations) (err error)](#runMigrationUp)
    * [func runMigrationDown(ctx context.Context, migration *Migration, migrator Migrator, operations *operations) (err error)](#runMigrationDown)
    * [func scanMigrations(rows *sql.Rows, queryErr error) (_ []Migration, err error)](#scanMigrations)
    * [func TestRunner(t *testing.T)](#TestRunner)
    * [func TestRunnerError(t *testing.T)](#TestRunnerError)
    * [func TestRunnerRemovesCompleted(t *testing.T)](#TestRunnerRemovesCompleted)
    * [func TestRunMigrator(t *testing.T)](#TestRunMigrator)
    * [func TestRunMigratorMigrationErrors(t *testing.T)](#TestRunMigratorMigrationErrors)
    * [func TestRunMigratorMigrationFinishesUp(t *testing.T)](#TestRunMigratorMigrationFinishesUp)
    * [func TestRunMigratorMigrationFinishesDown(t *testing.T)](#TestRunMigratorMigrationFinishesDown)
    * [func TestRunMigratorMigrationChangesDirection(t *testing.T)](#TestRunMigratorMigrationChangesDirection)
    * [func TestRunMigratorMigrationDesyncedFromData(t *testing.T)](#TestRunMigratorMigrationDesyncedFromData)
    * [func runMigratorWrapped(store storeIface, migrator Migrator, ticker glock.Ticker, interact func(migrations chan<- Migration))](#runMigratorWrapped)
    * [func tickN(ticker *glock.MockTicker, n int)](#tickN)
    * [func TestRunnerValidate(t *testing.T)](#TestRunnerValidate)
    * [func TestRunnerValidateUnfinishedUp(t *testing.T)](#TestRunnerValidateUnfinishedUp)
    * [func TestRunnerValidateUnfinishedDown(t *testing.T)](#TestRunnerValidateUnfinishedDown)
    * [func init()](#init.store_test.go)
    * [func TestList(t *testing.T)](#TestList)
    * [func TestListEnterprise(t *testing.T)](#TestListEnterprise)
    * [func TestUpdateDirection(t *testing.T)](#TestUpdateDirection)
    * [func TestUpdateProgress(t *testing.T)](#TestUpdateProgress)
    * [func TestAddError(t *testing.T)](#TestAddError)
    * [func TestAddErrorBounded(t *testing.T)](#TestAddErrorBounded)
    * [func timePtr(t time.Time) *time.Time](#timePtr)
    * [func insertMigration(store *Store, migration Migration, enterpriseOnly bool) error](#insertMigration)
    * [func TestCompareVersions(t *testing.T)](#TestCompareVersions)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="getByIDQuery" href="#getByIDQuery">const getByIDQuery</a>

```
searchKey: oobmigration.getByIDQuery
tags: [private]
```

```Go
const getByIDQuery = ...
```

### <a id="listQuery" href="#listQuery">const listQuery</a>

```
searchKey: oobmigration.listQuery
tags: [private]
```

```Go
const listQuery = ...
```

### <a id="updateDirectionQuery" href="#updateDirectionQuery">const updateDirectionQuery</a>

```
searchKey: oobmigration.updateDirectionQuery
tags: [private]
```

```Go
const updateDirectionQuery = ...
```

### <a id="updateProgressQuery" href="#updateProgressQuery">const updateProgressQuery</a>

```
searchKey: oobmigration.updateProgressQuery
tags: [private]
```

```Go
const updateProgressQuery = ...
```

### <a id="MaxMigrationErrors" href="#MaxMigrationErrors">const MaxMigrationErrors</a>

```
searchKey: oobmigration.MaxMigrationErrors
```

```Go
const MaxMigrationErrors = 100
```

MaxMigrationErrors is the maximum number of errors we'll track for a single migration before pruning older entries. 

### <a id="addErrorQuery" href="#addErrorQuery">const addErrorQuery</a>

```
searchKey: oobmigration.addErrorQuery
tags: [private]
```

```Go
const addErrorQuery = ...
```

### <a id="addErrorUpdateTimeQuery" href="#addErrorUpdateTimeQuery">const addErrorUpdateTimeQuery</a>

```
searchKey: oobmigration.addErrorUpdateTimeQuery
tags: [private]
```

```Go
const addErrorUpdateTimeQuery = ...
```

### <a id="addErrorPruneQuery" href="#addErrorPruneQuery">const addErrorPruneQuery</a>

```
searchKey: oobmigration.addErrorPruneQuery
tags: [private]
```

```Go
const addErrorPruneQuery = ...
```

### <a id="VersionOrderBefore" href="#VersionOrderBefore">const VersionOrderBefore</a>

```
searchKey: oobmigration.VersionOrderBefore
```

```Go
const VersionOrderBefore VersionOrder = iota
```

### <a id="VersionOrderEqual" href="#VersionOrderEqual">const VersionOrderEqual</a>

```
searchKey: oobmigration.VersionOrderEqual
```

```Go
const VersionOrderEqual
```

### <a id="VersionOrderAfter" href="#VersionOrderAfter">const VersionOrderAfter</a>

```
searchKey: oobmigration.VersionOrderAfter
```

```Go
const VersionOrderAfter
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ErrMigratorConflict" href="#ErrMigratorConflict">var ErrMigratorConflict</a>

```
searchKey: oobmigration.ErrMigratorConflict
```

```Go
var ErrMigratorConflict = errors.New("migrator already registered")
```

ErrMigratorConflict occurs when multiple migrator instances are registered to the same out-of-band migration identifier. 

### <a id="ReturnEnterpriseMigrations" href="#ReturnEnterpriseMigrations">var ReturnEnterpriseMigrations</a>

```
searchKey: oobmigration.ReturnEnterpriseMigrations
```

```Go
var ReturnEnterpriseMigrations = false
```

ReturnEnterpriseMigrations is set by the enterprise application to enable the inclusion of enterprise-only migration records in the output of oobmigration.List. 

### <a id="testTime" href="#testTime">var testTime</a>

```
searchKey: oobmigration.testTime
tags: [private]
```

```Go
var testTime = time.Unix(1613414740, 0)
```

### <a id="testMigrations" href="#testMigrations">var testMigrations</a>

```
searchKey: oobmigration.testMigrations
tags: [private]
```

```Go
var testMigrations = ...
```

### <a id="testEnterpriseMigrations" href="#testEnterpriseMigrations">var testEnterpriseMigrations</a>

```
searchKey: oobmigration.testEnterpriseMigrations
tags: [private]
```

```Go
var testEnterpriseMigrations = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="storeIface" href="#storeIface">type storeIface interface</a>

```
searchKey: oobmigration.storeIface
tags: [private]
```

```Go
type storeIface interface {
	List(ctx context.Context) ([]Migration, error)
	UpdateProgress(ctx context.Context, id int, progress float64) error
	AddError(ctx context.Context, id int, message string) error
}
```

storeIface is an interface of the Store methods used by Runner. 

### <a id="Migrator" href="#Migrator">type Migrator interface</a>

```
searchKey: oobmigration.Migrator
```

```Go
type Migrator interface {
	// Progress returns a percentage (in the range range [0, 1]) of data records that need
	// to be upgraded in the forward direction. A value of 1 means that no further action
	// is required. A value < 1 denotes that a future invocation of the Up method could
	// migrate additional data (excluding error conditions and prerequisite migrations).
	Progress(ctx context.Context) (float64, error)

	// Up runs a batch of the migration. This method is called repeatedly until the Progress
	// method reports completion. Errors returned from this method will be associated with the
	// migration record.
	Up(ctx context.Context) error

	// Down runs a batch of the migration in reverse. This does not need to be implemented
	// for migrations which are non-destructive. A non-destructive migration only adds data,
	// and does not transform fields that were read by previous versions of Sourcegraph and
	// therefore do not need to be undone prior to a downgrade.
	Down(ctx context.Context) error
}
```

Migrator handles migrating data from one format into another in a way that cannot easily be done via the in-band migration mechanism. This may be due to a large amount of data, or a process that requires the results of an external API or non-SQL-compatible encoding (e.g., gob-encode or gzipped payloads). 

### <a id="operations" href="#operations">type operations struct</a>

```
searchKey: oobmigration.operations
tags: [private]
```

```Go
type operations struct {
	upForMigration   func(migrationID int) *observation.Operation
	downForMigration func(migrationID int) *observation.Operation
}
```

#### <a id="newOperations" href="#newOperations">func newOperations(observationContext *observation.Context) *operations</a>

```
searchKey: oobmigration.newOperations
tags: [private]
```

```Go
func newOperations(observationContext *observation.Context) *operations
```

### <a id="Runner" href="#Runner">type Runner struct</a>

```
searchKey: oobmigration.Runner
```

```Go
type Runner struct {
	store         storeIface
	refreshTicker glock.Ticker
	operations    *operations
	migrators     map[int]migratorAndOption
	ctx           context.Context    // root context passed to the handler
	cancel        context.CancelFunc // cancels the root context
	finished      chan struct{}      // signals that Start has finished
}
```

Runner correlates out-of-band migration records in the database with a migrator instance, and will run each migration that has no yet completed: either reached 100% in the forward direction or 0% in the reverse direction. 

#### <a id="NewRunnerWithDB" href="#NewRunnerWithDB">func NewRunnerWithDB(db dbutil.DB, refreshInterval time.Duration, observationContext *observation.Context) *Runner</a>

```
searchKey: oobmigration.NewRunnerWithDB
```

```Go
func NewRunnerWithDB(db dbutil.DB, refreshInterval time.Duration, observationContext *observation.Context) *Runner
```

#### <a id="newRunner" href="#newRunner">func newRunner(store storeIface, refreshTicker glock.Ticker, observationContext *observation.Context) *Runner</a>

```
searchKey: oobmigration.newRunner
tags: [private]
```

```Go
func newRunner(store storeIface, refreshTicker glock.Ticker, observationContext *observation.Context) *Runner
```

#### <a id="Runner.Register" href="#Runner.Register">func (r *Runner) Register(id int, migrator Migrator, options MigratorOptions) error</a>

```
searchKey: oobmigration.Runner.Register
```

```Go
func (r *Runner) Register(id int, migrator Migrator, options MigratorOptions) error
```

Register correlates the given migrator with the given migration identifier. An error is returned if a migrator is already associated with this migration. 

#### <a id="Runner.Validate" href="#Runner.Validate">func (r *Runner) Validate(ctx context.Context, currentVersion, firstVersion Version) error</a>

```
searchKey: oobmigration.Runner.Validate
```

```Go
func (r *Runner) Validate(ctx context.Context, currentVersion, firstVersion Version) error
```

Validate checks the migration records present in the database (including their progress) and returns an error if there are unfinished migrations relative to the given version. Specifically, it is illegal for a Sourcegraph instance to start up with a migration that has one of the following properties: 

- A migration with progress != 0 is introduced _after_ the given version - A migration with progress != 1 is deprecated _on or before_ the given version 

This error is used to block startup of the application with an informative message indicating that the site admin must either (1) run the previous version of Sourcegraph longer to allow the unfinished migrations to complete in the case of a premature upgrade, or (2) run a standalone migration utility to rewind changes on an unmoving database in the case of a premature downgrade. 

#### <a id="Runner.Start" href="#Runner.Start">func (r *Runner) Start()</a>

```
searchKey: oobmigration.Runner.Start
```

```Go
func (r *Runner) Start()
```

Start runs registered migrators on a loop until they complete. This method will periodically re-read from the database in order to refresh its current view of the migrations. 

#### <a id="Runner.listMigrations" href="#Runner.listMigrations">func (r *Runner) listMigrations(ctx context.Context) <-chan []Migration</a>

```
searchKey: oobmigration.Runner.listMigrations
tags: [private]
```

```Go
func (r *Runner) listMigrations(ctx context.Context) <-chan []Migration
```

listMigrations returns a channel that will asynchronously receive the full list of out-of-band migrations that exist in the database. This channel will receive a value periodically as long as the given context is active. 

#### <a id="Runner.ensureProcessorIsRunning" href="#Runner.ensureProcessorIsRunning">func (r *Runner) ensureProcessorIsRunning(wg *sync.WaitGroup, m map[int]chan Migration, id int, runMigrator func(<-chan Migration))</a>

```
searchKey: oobmigration.Runner.ensureProcessorIsRunning
tags: [private]
```

```Go
func (r *Runner) ensureProcessorIsRunning(wg *sync.WaitGroup, m map[int]chan Migration, id int, runMigrator func(<-chan Migration))
```

ensureProcessorIsRunning ensures that there is a non-nil channel at m[id]. If this key is not set, a new channel is created and stored in this key. The channel is then passed to runMigrator in a goroutine. 

This method logs the execution of the migration processor in the given wait group. 

#### <a id="Runner.Stop" href="#Runner.Stop">func (r *Runner) Stop()</a>

```
searchKey: oobmigration.Runner.Stop
```

```Go
func (r *Runner) Stop()
```

Stop will cancel the context used in Start, then blocks until Start has returned. 

### <a id="migratorAndOption" href="#migratorAndOption">type migratorAndOption struct</a>

```
searchKey: oobmigration.migratorAndOption
tags: [private]
```

```Go
type migratorAndOption struct {
	Migrator
	migratorOptions
}
```

### <a id="MigratorOptions" href="#MigratorOptions">type MigratorOptions struct</a>

```
searchKey: oobmigration.MigratorOptions
```

```Go
type MigratorOptions struct {
	// Interval specifies the time between invocations of an active migration.
	Interval time.Duration

	// ticker mocks periodic behavior for tests.
	ticker glock.Ticker
}
```

MigratorOptions configures the behavior of a registered migrator. 

### <a id="migrationStatusError" href="#migrationStatusError">type migrationStatusError struct</a>

```
searchKey: oobmigration.migrationStatusError
tags: [private]
```

```Go
type migrationStatusError struct {
	id               int
	expectedProgress float64
	actualProgress   float64
}
```

#### <a id="migrationStatusError.Error" href="#migrationStatusError.Error">func (e migrationStatusError) Error() string</a>

```
searchKey: oobmigration.migrationStatusError.Error
tags: [private]
```

```Go
func (e migrationStatusError) Error() string
```

### <a id="migratorOptions" href="#migratorOptions">type migratorOptions struct</a>

```
searchKey: oobmigration.migratorOptions
tags: [private]
```

```Go
type migratorOptions struct {
	ticker glock.Ticker
}
```

### <a id="Migration" href="#Migration">type Migration struct</a>

```
searchKey: oobmigration.Migration
```

```Go
type Migration struct {
	ID             int
	Team           string
	Component      string
	Description    string
	Introduced     Version
	Deprecated     *Version
	Progress       float64
	Created        time.Time
	LastUpdated    *time.Time
	NonDestructive bool
	ApplyReverse   bool
	Errors         []MigrationError
}
```

Migration stores metadata and tracks progress of an out-of-band migration routine. These fields mirror the out_of_band_migrations table in the database. For docs see the [schema]([https://github.com/sourcegraph/sourcegraph/blob/main/internal/database/schema.md#table-publicout_of_band_migrations](https://github.com/sourcegraph/sourcegraph/blob/main/internal/database/schema.md#table-publicout_of_band_migrations)). 

#### <a id="Migration.Complete" href="#Migration.Complete">func (m Migration) Complete() bool</a>

```
searchKey: oobmigration.Migration.Complete
```

```Go
func (m Migration) Complete() bool
```

Complete returns true if the migration has 0 un-migrated record in whichever direction is indicated by the ApplyReverse flag. 

### <a id="MigrationError" href="#MigrationError">type MigrationError struct</a>

```
searchKey: oobmigration.MigrationError
```

```Go
type MigrationError struct {
	Message string
	Created time.Time
}
```

MigrationError pairs an error message and the time the error occurred. 

### <a id="Store" href="#Store">type Store struct</a>

```
searchKey: oobmigration.Store
```

```Go
type Store struct {
	*basestore.Store
}
```

Store is the interface over the out-of-band migrations tables. 

#### <a id="NewStoreWithDB" href="#NewStoreWithDB">func NewStoreWithDB(db dbutil.DB) *Store</a>

```
searchKey: oobmigration.NewStoreWithDB
```

```Go
func NewStoreWithDB(db dbutil.DB) *Store
```

NewStoreWithDB creates a new Store with the given database connection. 

#### <a id="testStore" href="#testStore">func testStore(t *testing.T, db dbutil.DB) *Store</a>

```
searchKey: oobmigration.testStore
tags: [private]
```

```Go
func testStore(t *testing.T, db dbutil.DB) *Store
```

#### <a id="Store.With" href="#Store.With">func (s *Store) With(other basestore.ShareableStore) *Store</a>

```
searchKey: oobmigration.Store.With
```

```Go
func (s *Store) With(other basestore.ShareableStore) *Store
```

With creates a new store with the underlying database handle from the given store. This method should be used when two distinct store instances need to perform an operation within the same shared transaction. 

This method wraps the basestore.With method. 

#### <a id="Store.Transact" href="#Store.Transact">func (s *Store) Transact(ctx context.Context) (*Store, error)</a>

```
searchKey: oobmigration.Store.Transact
```

```Go
func (s *Store) Transact(ctx context.Context) (*Store, error)
```

Transact returns a new store whose methods operate within the context of a new transaction or a new savepoint. This method will return an error if the underlying connection cannot be interface upgraded to a TxBeginner. 

This method wraps the basestore.Transact method. 

#### <a id="Store.GetByID" href="#Store.GetByID">func (s *Store) GetByID(ctx context.Context, id int) (_ Migration, _ bool, err error)</a>

```
searchKey: oobmigration.Store.GetByID
```

```Go
func (s *Store) GetByID(ctx context.Context, id int) (_ Migration, _ bool, err error)
```

GetByID retrieves a migration by its identifier. If the migration does not exist, a false valued flag is returned. 

#### <a id="Store.List" href="#Store.List">func (s *Store) List(ctx context.Context) (_ []Migration, err error)</a>

```
searchKey: oobmigration.Store.List
```

```Go
func (s *Store) List(ctx context.Context) (_ []Migration, err error)
```

List returns the complete list of out-of-band migrations. 

#### <a id="Store.UpdateDirection" href="#Store.UpdateDirection">func (s *Store) UpdateDirection(ctx context.Context, id int, applyReverse bool) error</a>

```
searchKey: oobmigration.Store.UpdateDirection
```

```Go
func (s *Store) UpdateDirection(ctx context.Context, id int, applyReverse bool) error
```

UpdateDirection updates the direction for the given migration. 

#### <a id="Store.UpdateProgress" href="#Store.UpdateProgress">func (s *Store) UpdateProgress(ctx context.Context, id int, progress float64) error</a>

```
searchKey: oobmigration.Store.UpdateProgress
```

```Go
func (s *Store) UpdateProgress(ctx context.Context, id int, progress float64) error
```

UpdateProgress updates the progress for the given migration. 

#### <a id="Store.updateProgress" href="#Store.updateProgress">func (s *Store) updateProgress(ctx context.Context, id int, progress float64, now time.Time) error</a>

```
searchKey: oobmigration.Store.updateProgress
tags: [private]
```

```Go
func (s *Store) updateProgress(ctx context.Context, id int, progress float64, now time.Time) error
```

#### <a id="Store.AddError" href="#Store.AddError">func (s *Store) AddError(ctx context.Context, id int, message string) (err error)</a>

```
searchKey: oobmigration.Store.AddError
```

```Go
func (s *Store) AddError(ctx context.Context, id int, message string) (err error)
```

AddError associates the given error message with the given migration. While there are more than MaxMigrationErrors errors for this, the oldest error entries will be pruned to keep the error list relevant and short. 

#### <a id="Store.addError" href="#Store.addError">func (s *Store) addError(ctx context.Context, id int, message string, now time.Time) (err error)</a>

```
searchKey: oobmigration.Store.addError
tags: [private]
```

```Go
func (s *Store) addError(ctx context.Context, id int, message string, now time.Time) (err error)
```

### <a id="Version" href="#Version">type Version struct</a>

```
searchKey: oobmigration.Version
```

```Go
type Version struct {
	Major int
	Minor int
}
```

#### <a id="NewVersion" href="#NewVersion">func NewVersion(major, minor int) Version</a>

```
searchKey: oobmigration.NewVersion
```

```Go
func NewVersion(major, minor int) Version
```

#### <a id="newVersionPtr" href="#newVersionPtr">func newVersionPtr(major, minor int) *Version</a>

```
searchKey: oobmigration.newVersionPtr
tags: [private]
```

```Go
func newVersionPtr(major, minor int) *Version
```

#### <a id="Version.String" href="#Version.String">func (v Version) String() string</a>

```
searchKey: oobmigration.Version.String
```

```Go
func (v Version) String() string
```

### <a id="VersionOrder" href="#VersionOrder">type VersionOrder int</a>

```
searchKey: oobmigration.VersionOrder
```

```Go
type VersionOrder int
```

#### <a id="compareVersions" href="#compareVersions">func compareVersions(a, b Version) (VersionOrder, error)</a>

```
searchKey: oobmigration.compareVersions
tags: [private]
```

```Go
func compareVersions(a, b Version) (VersionOrder, error)
```

compareVersions returns the relationship between `a (op) b`. 

### <a id="MockMigrator" href="#MockMigrator">type MockMigrator struct</a>

```
searchKey: oobmigration.MockMigrator
tags: [private]
```

```Go
type MockMigrator struct {
	// DownFunc is an instance of a mock function object controlling the
	// behavior of the method Down.
	DownFunc *MigratorDownFunc
	// ProgressFunc is an instance of a mock function object controlling the
	// behavior of the method Progress.
	ProgressFunc *MigratorProgressFunc
	// UpFunc is an instance of a mock function object controlling the
	// behavior of the method Up.
	UpFunc *MigratorUpFunc
}
```

MockMigrator is a mock implementation of the Migrator interface (from the package github.com/sourcegraph/sourcegraph/internal/oobmigration) used for unit testing. 

#### <a id="NewMockMigrator" href="#NewMockMigrator">func NewMockMigrator() *MockMigrator</a>

```
searchKey: oobmigration.NewMockMigrator
tags: [private]
```

```Go
func NewMockMigrator() *MockMigrator
```

NewMockMigrator creates a new mock of the Migrator interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockMigratorFrom" href="#NewMockMigratorFrom">func NewMockMigratorFrom(i Migrator) *MockMigrator</a>

```
searchKey: oobmigration.NewMockMigratorFrom
tags: [private]
```

```Go
func NewMockMigratorFrom(i Migrator) *MockMigrator
```

NewMockMigratorFrom creates a new mock of the MockMigrator interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockMigrator.Down" href="#MockMigrator.Down">func (m *MockMigrator) Down(v0 context.Context) error</a>

```
searchKey: oobmigration.MockMigrator.Down
tags: [private]
```

```Go
func (m *MockMigrator) Down(v0 context.Context) error
```

Down delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockMigrator.Progress" href="#MockMigrator.Progress">func (m *MockMigrator) Progress(v0 context.Context) (float64, error)</a>

```
searchKey: oobmigration.MockMigrator.Progress
tags: [private]
```

```Go
func (m *MockMigrator) Progress(v0 context.Context) (float64, error)
```

Progress delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockMigrator.Up" href="#MockMigrator.Up">func (m *MockMigrator) Up(v0 context.Context) error</a>

```
searchKey: oobmigration.MockMigrator.Up
tags: [private]
```

```Go
func (m *MockMigrator) Up(v0 context.Context) error
```

Up delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MigratorDownFunc" href="#MigratorDownFunc">type MigratorDownFunc struct</a>

```
searchKey: oobmigration.MigratorDownFunc
tags: [private]
```

```Go
type MigratorDownFunc struct {
	defaultHook func(context.Context) error
	hooks       []func(context.Context) error
	history     []MigratorDownFuncCall
	mutex       sync.Mutex
}
```

MigratorDownFunc describes the behavior when the Down method of the parent MockMigrator instance is invoked. 

#### <a id="MigratorDownFunc.SetDefaultHook" href="#MigratorDownFunc.SetDefaultHook">func (f *MigratorDownFunc) SetDefaultHook(hook func(context.Context) error)</a>

```
searchKey: oobmigration.MigratorDownFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *MigratorDownFunc) SetDefaultHook(hook func(context.Context) error)
```

SetDefaultHook sets function that is called when the Down method of the parent MockMigrator instance is invoked and the hook queue is empty. 

#### <a id="MigratorDownFunc.PushHook" href="#MigratorDownFunc.PushHook">func (f *MigratorDownFunc) PushHook(hook func(context.Context) error)</a>

```
searchKey: oobmigration.MigratorDownFunc.PushHook
tags: [private]
```

```Go
func (f *MigratorDownFunc) PushHook(hook func(context.Context) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Down method of the parent MockMigrator instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="MigratorDownFunc.SetDefaultReturn" href="#MigratorDownFunc.SetDefaultReturn">func (f *MigratorDownFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: oobmigration.MigratorDownFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *MigratorDownFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="MigratorDownFunc.PushReturn" href="#MigratorDownFunc.PushReturn">func (f *MigratorDownFunc) PushReturn(r0 error)</a>

```
searchKey: oobmigration.MigratorDownFunc.PushReturn
tags: [private]
```

```Go
func (f *MigratorDownFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="MigratorDownFunc.nextHook" href="#MigratorDownFunc.nextHook">func (f *MigratorDownFunc) nextHook() func(context.Context) error</a>

```
searchKey: oobmigration.MigratorDownFunc.nextHook
tags: [private]
```

```Go
func (f *MigratorDownFunc) nextHook() func(context.Context) error
```

#### <a id="MigratorDownFunc.appendCall" href="#MigratorDownFunc.appendCall">func (f *MigratorDownFunc) appendCall(r0 MigratorDownFuncCall)</a>

```
searchKey: oobmigration.MigratorDownFunc.appendCall
tags: [private]
```

```Go
func (f *MigratorDownFunc) appendCall(r0 MigratorDownFuncCall)
```

#### <a id="MigratorDownFunc.History" href="#MigratorDownFunc.History">func (f *MigratorDownFunc) History() []MigratorDownFuncCall</a>

```
searchKey: oobmigration.MigratorDownFunc.History
tags: [private]
```

```Go
func (f *MigratorDownFunc) History() []MigratorDownFuncCall
```

History returns a sequence of MigratorDownFuncCall objects describing the invocations of this function. 

### <a id="MigratorDownFuncCall" href="#MigratorDownFuncCall">type MigratorDownFuncCall struct</a>

```
searchKey: oobmigration.MigratorDownFuncCall
tags: [private]
```

```Go
type MigratorDownFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

MigratorDownFuncCall is an object that describes an invocation of method Down on an instance of MockMigrator. 

#### <a id="MigratorDownFuncCall.Args" href="#MigratorDownFuncCall.Args">func (c MigratorDownFuncCall) Args() []interface{}</a>

```
searchKey: oobmigration.MigratorDownFuncCall.Args
tags: [private]
```

```Go
func (c MigratorDownFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="MigratorDownFuncCall.Results" href="#MigratorDownFuncCall.Results">func (c MigratorDownFuncCall) Results() []interface{}</a>

```
searchKey: oobmigration.MigratorDownFuncCall.Results
tags: [private]
```

```Go
func (c MigratorDownFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MigratorProgressFunc" href="#MigratorProgressFunc">type MigratorProgressFunc struct</a>

```
searchKey: oobmigration.MigratorProgressFunc
tags: [private]
```

```Go
type MigratorProgressFunc struct {
	defaultHook func(context.Context) (float64, error)
	hooks       []func(context.Context) (float64, error)
	history     []MigratorProgressFuncCall
	mutex       sync.Mutex
}
```

MigratorProgressFunc describes the behavior when the Progress method of the parent MockMigrator instance is invoked. 

#### <a id="MigratorProgressFunc.SetDefaultHook" href="#MigratorProgressFunc.SetDefaultHook">func (f *MigratorProgressFunc) SetDefaultHook(hook func(context.Context) (float64, error))</a>

```
searchKey: oobmigration.MigratorProgressFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *MigratorProgressFunc) SetDefaultHook(hook func(context.Context) (float64, error))
```

SetDefaultHook sets function that is called when the Progress method of the parent MockMigrator instance is invoked and the hook queue is empty. 

#### <a id="MigratorProgressFunc.PushHook" href="#MigratorProgressFunc.PushHook">func (f *MigratorProgressFunc) PushHook(hook func(context.Context) (float64, error))</a>

```
searchKey: oobmigration.MigratorProgressFunc.PushHook
tags: [private]
```

```Go
func (f *MigratorProgressFunc) PushHook(hook func(context.Context) (float64, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Progress method of the parent MockMigrator instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="MigratorProgressFunc.SetDefaultReturn" href="#MigratorProgressFunc.SetDefaultReturn">func (f *MigratorProgressFunc) SetDefaultReturn(r0 float64, r1 error)</a>

```
searchKey: oobmigration.MigratorProgressFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *MigratorProgressFunc) SetDefaultReturn(r0 float64, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="MigratorProgressFunc.PushReturn" href="#MigratorProgressFunc.PushReturn">func (f *MigratorProgressFunc) PushReturn(r0 float64, r1 error)</a>

```
searchKey: oobmigration.MigratorProgressFunc.PushReturn
tags: [private]
```

```Go
func (f *MigratorProgressFunc) PushReturn(r0 float64, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="MigratorProgressFunc.nextHook" href="#MigratorProgressFunc.nextHook">func (f *MigratorProgressFunc) nextHook() func(context.Context) (float64, error)</a>

```
searchKey: oobmigration.MigratorProgressFunc.nextHook
tags: [private]
```

```Go
func (f *MigratorProgressFunc) nextHook() func(context.Context) (float64, error)
```

#### <a id="MigratorProgressFunc.appendCall" href="#MigratorProgressFunc.appendCall">func (f *MigratorProgressFunc) appendCall(r0 MigratorProgressFuncCall)</a>

```
searchKey: oobmigration.MigratorProgressFunc.appendCall
tags: [private]
```

```Go
func (f *MigratorProgressFunc) appendCall(r0 MigratorProgressFuncCall)
```

#### <a id="MigratorProgressFunc.History" href="#MigratorProgressFunc.History">func (f *MigratorProgressFunc) History() []MigratorProgressFuncCall</a>

```
searchKey: oobmigration.MigratorProgressFunc.History
tags: [private]
```

```Go
func (f *MigratorProgressFunc) History() []MigratorProgressFuncCall
```

History returns a sequence of MigratorProgressFuncCall objects describing the invocations of this function. 

### <a id="MigratorProgressFuncCall" href="#MigratorProgressFuncCall">type MigratorProgressFuncCall struct</a>

```
searchKey: oobmigration.MigratorProgressFuncCall
tags: [private]
```

```Go
type MigratorProgressFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 float64
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

MigratorProgressFuncCall is an object that describes an invocation of method Progress on an instance of MockMigrator. 

#### <a id="MigratorProgressFuncCall.Args" href="#MigratorProgressFuncCall.Args">func (c MigratorProgressFuncCall) Args() []interface{}</a>

```
searchKey: oobmigration.MigratorProgressFuncCall.Args
tags: [private]
```

```Go
func (c MigratorProgressFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="MigratorProgressFuncCall.Results" href="#MigratorProgressFuncCall.Results">func (c MigratorProgressFuncCall) Results() []interface{}</a>

```
searchKey: oobmigration.MigratorProgressFuncCall.Results
tags: [private]
```

```Go
func (c MigratorProgressFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MigratorUpFunc" href="#MigratorUpFunc">type MigratorUpFunc struct</a>

```
searchKey: oobmigration.MigratorUpFunc
tags: [private]
```

```Go
type MigratorUpFunc struct {
	defaultHook func(context.Context) error
	hooks       []func(context.Context) error
	history     []MigratorUpFuncCall
	mutex       sync.Mutex
}
```

MigratorUpFunc describes the behavior when the Up method of the parent MockMigrator instance is invoked. 

#### <a id="MigratorUpFunc.SetDefaultHook" href="#MigratorUpFunc.SetDefaultHook">func (f *MigratorUpFunc) SetDefaultHook(hook func(context.Context) error)</a>

```
searchKey: oobmigration.MigratorUpFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *MigratorUpFunc) SetDefaultHook(hook func(context.Context) error)
```

SetDefaultHook sets function that is called when the Up method of the parent MockMigrator instance is invoked and the hook queue is empty. 

#### <a id="MigratorUpFunc.PushHook" href="#MigratorUpFunc.PushHook">func (f *MigratorUpFunc) PushHook(hook func(context.Context) error)</a>

```
searchKey: oobmigration.MigratorUpFunc.PushHook
tags: [private]
```

```Go
func (f *MigratorUpFunc) PushHook(hook func(context.Context) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Up method of the parent MockMigrator instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="MigratorUpFunc.SetDefaultReturn" href="#MigratorUpFunc.SetDefaultReturn">func (f *MigratorUpFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: oobmigration.MigratorUpFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *MigratorUpFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="MigratorUpFunc.PushReturn" href="#MigratorUpFunc.PushReturn">func (f *MigratorUpFunc) PushReturn(r0 error)</a>

```
searchKey: oobmigration.MigratorUpFunc.PushReturn
tags: [private]
```

```Go
func (f *MigratorUpFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="MigratorUpFunc.nextHook" href="#MigratorUpFunc.nextHook">func (f *MigratorUpFunc) nextHook() func(context.Context) error</a>

```
searchKey: oobmigration.MigratorUpFunc.nextHook
tags: [private]
```

```Go
func (f *MigratorUpFunc) nextHook() func(context.Context) error
```

#### <a id="MigratorUpFunc.appendCall" href="#MigratorUpFunc.appendCall">func (f *MigratorUpFunc) appendCall(r0 MigratorUpFuncCall)</a>

```
searchKey: oobmigration.MigratorUpFunc.appendCall
tags: [private]
```

```Go
func (f *MigratorUpFunc) appendCall(r0 MigratorUpFuncCall)
```

#### <a id="MigratorUpFunc.History" href="#MigratorUpFunc.History">func (f *MigratorUpFunc) History() []MigratorUpFuncCall</a>

```
searchKey: oobmigration.MigratorUpFunc.History
tags: [private]
```

```Go
func (f *MigratorUpFunc) History() []MigratorUpFuncCall
```

History returns a sequence of MigratorUpFuncCall objects describing the invocations of this function. 

### <a id="MigratorUpFuncCall" href="#MigratorUpFuncCall">type MigratorUpFuncCall struct</a>

```
searchKey: oobmigration.MigratorUpFuncCall
tags: [private]
```

```Go
type MigratorUpFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

MigratorUpFuncCall is an object that describes an invocation of method Up on an instance of MockMigrator. 

#### <a id="MigratorUpFuncCall.Args" href="#MigratorUpFuncCall.Args">func (c MigratorUpFuncCall) Args() []interface{}</a>

```
searchKey: oobmigration.MigratorUpFuncCall.Args
tags: [private]
```

```Go
func (c MigratorUpFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="MigratorUpFuncCall.Results" href="#MigratorUpFuncCall.Results">func (c MigratorUpFuncCall) Results() []interface{}</a>

```
searchKey: oobmigration.MigratorUpFuncCall.Results
tags: [private]
```

```Go
func (c MigratorUpFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockStoreIface" href="#MockStoreIface">type MockStoreIface struct</a>

```
searchKey: oobmigration.MockStoreIface
tags: [private]
```

```Go
type MockStoreIface struct {
	// AddErrorFunc is an instance of a mock function object controlling the
	// behavior of the method AddError.
	AddErrorFunc *StoreIfaceAddErrorFunc
	// ListFunc is an instance of a mock function object controlling the
	// behavior of the method List.
	ListFunc *StoreIfaceListFunc
	// UpdateProgressFunc is an instance of a mock function object
	// controlling the behavior of the method UpdateProgress.
	UpdateProgressFunc *StoreIfaceUpdateProgressFunc
}
```

MockStoreIface is a mock implementation of the storeIface interface (from the package github.com/sourcegraph/sourcegraph/internal/oobmigration) used for unit testing. 

#### <a id="NewMockStoreIface" href="#NewMockStoreIface">func NewMockStoreIface() *MockStoreIface</a>

```
searchKey: oobmigration.NewMockStoreIface
tags: [private]
```

```Go
func NewMockStoreIface() *MockStoreIface
```

NewMockStoreIface creates a new mock of the storeIface interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockStoreIfaceFrom" href="#NewMockStoreIfaceFrom">func NewMockStoreIfaceFrom(i surrogateMockStoreIface) *MockStoreIface</a>

```
searchKey: oobmigration.NewMockStoreIfaceFrom
tags: [private]
```

```Go
func NewMockStoreIfaceFrom(i surrogateMockStoreIface) *MockStoreIface
```

NewMockStoreIfaceFrom creates a new mock of the MockStoreIface interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockStoreIface.AddError" href="#MockStoreIface.AddError">func (m *MockStoreIface) AddError(v0 context.Context, v1 int, v2 string) error</a>

```
searchKey: oobmigration.MockStoreIface.AddError
tags: [private]
```

```Go
func (m *MockStoreIface) AddError(v0 context.Context, v1 int, v2 string) error
```

AddError delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStoreIface.List" href="#MockStoreIface.List">func (m *MockStoreIface) List(v0 context.Context) ([]Migration, error)</a>

```
searchKey: oobmigration.MockStoreIface.List
tags: [private]
```

```Go
func (m *MockStoreIface) List(v0 context.Context) ([]Migration, error)
```

List delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStoreIface.UpdateProgress" href="#MockStoreIface.UpdateProgress">func (m *MockStoreIface) UpdateProgress(v0 context.Context, v1 int, v2 float64) error</a>

```
searchKey: oobmigration.MockStoreIface.UpdateProgress
tags: [private]
```

```Go
func (m *MockStoreIface) UpdateProgress(v0 context.Context, v1 int, v2 float64) error
```

UpdateProgress delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="surrogateMockStoreIface" href="#surrogateMockStoreIface">type surrogateMockStoreIface interface</a>

```
searchKey: oobmigration.surrogateMockStoreIface
tags: [private]
```

```Go
type surrogateMockStoreIface interface {
	AddError(context.Context, int, string) error
	List(context.Context) ([]Migration, error)
	UpdateProgress(context.Context, int, float64) error
}
```

surrogateMockStoreIface is a copy of the storeIface interface (from the package github.com/sourcegraph/sourcegraph/internal/oobmigration). It is redefined here as it is unexported in the source package. 

### <a id="StoreIfaceAddErrorFunc" href="#StoreIfaceAddErrorFunc">type StoreIfaceAddErrorFunc struct</a>

```
searchKey: oobmigration.StoreIfaceAddErrorFunc
tags: [private]
```

```Go
type StoreIfaceAddErrorFunc struct {
	defaultHook func(context.Context, int, string) error
	hooks       []func(context.Context, int, string) error
	history     []StoreIfaceAddErrorFuncCall
	mutex       sync.Mutex
}
```

StoreIfaceAddErrorFunc describes the behavior when the AddError method of the parent MockStoreIface instance is invoked. 

#### <a id="StoreIfaceAddErrorFunc.SetDefaultHook" href="#StoreIfaceAddErrorFunc.SetDefaultHook">func (f *StoreIfaceAddErrorFunc) SetDefaultHook(hook func(context.Context, int, string) error)</a>

```
searchKey: oobmigration.StoreIfaceAddErrorFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *StoreIfaceAddErrorFunc) SetDefaultHook(hook func(context.Context, int, string) error)
```

SetDefaultHook sets function that is called when the AddError method of the parent MockStoreIface instance is invoked and the hook queue is empty. 

#### <a id="StoreIfaceAddErrorFunc.PushHook" href="#StoreIfaceAddErrorFunc.PushHook">func (f *StoreIfaceAddErrorFunc) PushHook(hook func(context.Context, int, string) error)</a>

```
searchKey: oobmigration.StoreIfaceAddErrorFunc.PushHook
tags: [private]
```

```Go
func (f *StoreIfaceAddErrorFunc) PushHook(hook func(context.Context, int, string) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the AddError method of the parent MockStoreIface instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreIfaceAddErrorFunc.SetDefaultReturn" href="#StoreIfaceAddErrorFunc.SetDefaultReturn">func (f *StoreIfaceAddErrorFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: oobmigration.StoreIfaceAddErrorFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *StoreIfaceAddErrorFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreIfaceAddErrorFunc.PushReturn" href="#StoreIfaceAddErrorFunc.PushReturn">func (f *StoreIfaceAddErrorFunc) PushReturn(r0 error)</a>

```
searchKey: oobmigration.StoreIfaceAddErrorFunc.PushReturn
tags: [private]
```

```Go
func (f *StoreIfaceAddErrorFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreIfaceAddErrorFunc.nextHook" href="#StoreIfaceAddErrorFunc.nextHook">func (f *StoreIfaceAddErrorFunc) nextHook() func(context.Context, int, string) error</a>

```
searchKey: oobmigration.StoreIfaceAddErrorFunc.nextHook
tags: [private]
```

```Go
func (f *StoreIfaceAddErrorFunc) nextHook() func(context.Context, int, string) error
```

#### <a id="StoreIfaceAddErrorFunc.appendCall" href="#StoreIfaceAddErrorFunc.appendCall">func (f *StoreIfaceAddErrorFunc) appendCall(r0 StoreIfaceAddErrorFuncCall)</a>

```
searchKey: oobmigration.StoreIfaceAddErrorFunc.appendCall
tags: [private]
```

```Go
func (f *StoreIfaceAddErrorFunc) appendCall(r0 StoreIfaceAddErrorFuncCall)
```

#### <a id="StoreIfaceAddErrorFunc.History" href="#StoreIfaceAddErrorFunc.History">func (f *StoreIfaceAddErrorFunc) History() []StoreIfaceAddErrorFuncCall</a>

```
searchKey: oobmigration.StoreIfaceAddErrorFunc.History
tags: [private]
```

```Go
func (f *StoreIfaceAddErrorFunc) History() []StoreIfaceAddErrorFuncCall
```

History returns a sequence of StoreIfaceAddErrorFuncCall objects describing the invocations of this function. 

### <a id="StoreIfaceAddErrorFuncCall" href="#StoreIfaceAddErrorFuncCall">type StoreIfaceAddErrorFuncCall struct</a>

```
searchKey: oobmigration.StoreIfaceAddErrorFuncCall
tags: [private]
```

```Go
type StoreIfaceAddErrorFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

StoreIfaceAddErrorFuncCall is an object that describes an invocation of method AddError on an instance of MockStoreIface. 

#### <a id="StoreIfaceAddErrorFuncCall.Args" href="#StoreIfaceAddErrorFuncCall.Args">func (c StoreIfaceAddErrorFuncCall) Args() []interface{}</a>

```
searchKey: oobmigration.StoreIfaceAddErrorFuncCall.Args
tags: [private]
```

```Go
func (c StoreIfaceAddErrorFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreIfaceAddErrorFuncCall.Results" href="#StoreIfaceAddErrorFuncCall.Results">func (c StoreIfaceAddErrorFuncCall) Results() []interface{}</a>

```
searchKey: oobmigration.StoreIfaceAddErrorFuncCall.Results
tags: [private]
```

```Go
func (c StoreIfaceAddErrorFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreIfaceListFunc" href="#StoreIfaceListFunc">type StoreIfaceListFunc struct</a>

```
searchKey: oobmigration.StoreIfaceListFunc
tags: [private]
```

```Go
type StoreIfaceListFunc struct {
	defaultHook func(context.Context) ([]Migration, error)
	hooks       []func(context.Context) ([]Migration, error)
	history     []StoreIfaceListFuncCall
	mutex       sync.Mutex
}
```

StoreIfaceListFunc describes the behavior when the List method of the parent MockStoreIface instance is invoked. 

#### <a id="StoreIfaceListFunc.SetDefaultHook" href="#StoreIfaceListFunc.SetDefaultHook">func (f *StoreIfaceListFunc) SetDefaultHook(hook func(context.Context) ([]Migration, error))</a>

```
searchKey: oobmigration.StoreIfaceListFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *StoreIfaceListFunc) SetDefaultHook(hook func(context.Context) ([]Migration, error))
```

SetDefaultHook sets function that is called when the List method of the parent MockStoreIface instance is invoked and the hook queue is empty. 

#### <a id="StoreIfaceListFunc.PushHook" href="#StoreIfaceListFunc.PushHook">func (f *StoreIfaceListFunc) PushHook(hook func(context.Context) ([]Migration, error))</a>

```
searchKey: oobmigration.StoreIfaceListFunc.PushHook
tags: [private]
```

```Go
func (f *StoreIfaceListFunc) PushHook(hook func(context.Context) ([]Migration, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the List method of the parent MockStoreIface instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreIfaceListFunc.SetDefaultReturn" href="#StoreIfaceListFunc.SetDefaultReturn">func (f *StoreIfaceListFunc) SetDefaultReturn(r0 []Migration, r1 error)</a>

```
searchKey: oobmigration.StoreIfaceListFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *StoreIfaceListFunc) SetDefaultReturn(r0 []Migration, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreIfaceListFunc.PushReturn" href="#StoreIfaceListFunc.PushReturn">func (f *StoreIfaceListFunc) PushReturn(r0 []Migration, r1 error)</a>

```
searchKey: oobmigration.StoreIfaceListFunc.PushReturn
tags: [private]
```

```Go
func (f *StoreIfaceListFunc) PushReturn(r0 []Migration, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreIfaceListFunc.nextHook" href="#StoreIfaceListFunc.nextHook">func (f *StoreIfaceListFunc) nextHook() func(context.Context) ([]Migration, error)</a>

```
searchKey: oobmigration.StoreIfaceListFunc.nextHook
tags: [private]
```

```Go
func (f *StoreIfaceListFunc) nextHook() func(context.Context) ([]Migration, error)
```

#### <a id="StoreIfaceListFunc.appendCall" href="#StoreIfaceListFunc.appendCall">func (f *StoreIfaceListFunc) appendCall(r0 StoreIfaceListFuncCall)</a>

```
searchKey: oobmigration.StoreIfaceListFunc.appendCall
tags: [private]
```

```Go
func (f *StoreIfaceListFunc) appendCall(r0 StoreIfaceListFuncCall)
```

#### <a id="StoreIfaceListFunc.History" href="#StoreIfaceListFunc.History">func (f *StoreIfaceListFunc) History() []StoreIfaceListFuncCall</a>

```
searchKey: oobmigration.StoreIfaceListFunc.History
tags: [private]
```

```Go
func (f *StoreIfaceListFunc) History() []StoreIfaceListFuncCall
```

History returns a sequence of StoreIfaceListFuncCall objects describing the invocations of this function. 

### <a id="StoreIfaceListFuncCall" href="#StoreIfaceListFuncCall">type StoreIfaceListFuncCall struct</a>

```
searchKey: oobmigration.StoreIfaceListFuncCall
tags: [private]
```

```Go
type StoreIfaceListFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []Migration
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

StoreIfaceListFuncCall is an object that describes an invocation of method List on an instance of MockStoreIface. 

#### <a id="StoreIfaceListFuncCall.Args" href="#StoreIfaceListFuncCall.Args">func (c StoreIfaceListFuncCall) Args() []interface{}</a>

```
searchKey: oobmigration.StoreIfaceListFuncCall.Args
tags: [private]
```

```Go
func (c StoreIfaceListFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreIfaceListFuncCall.Results" href="#StoreIfaceListFuncCall.Results">func (c StoreIfaceListFuncCall) Results() []interface{}</a>

```
searchKey: oobmigration.StoreIfaceListFuncCall.Results
tags: [private]
```

```Go
func (c StoreIfaceListFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreIfaceUpdateProgressFunc" href="#StoreIfaceUpdateProgressFunc">type StoreIfaceUpdateProgressFunc struct</a>

```
searchKey: oobmigration.StoreIfaceUpdateProgressFunc
tags: [private]
```

```Go
type StoreIfaceUpdateProgressFunc struct {
	defaultHook func(context.Context, int, float64) error
	hooks       []func(context.Context, int, float64) error
	history     []StoreIfaceUpdateProgressFuncCall
	mutex       sync.Mutex
}
```

StoreIfaceUpdateProgressFunc describes the behavior when the UpdateProgress method of the parent MockStoreIface instance is invoked. 

#### <a id="StoreIfaceUpdateProgressFunc.SetDefaultHook" href="#StoreIfaceUpdateProgressFunc.SetDefaultHook">func (f *StoreIfaceUpdateProgressFunc) SetDefaultHook(hook func(context.Context, int, float64) error)</a>

```
searchKey: oobmigration.StoreIfaceUpdateProgressFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *StoreIfaceUpdateProgressFunc) SetDefaultHook(hook func(context.Context, int, float64) error)
```

SetDefaultHook sets function that is called when the UpdateProgress method of the parent MockStoreIface instance is invoked and the hook queue is empty. 

#### <a id="StoreIfaceUpdateProgressFunc.PushHook" href="#StoreIfaceUpdateProgressFunc.PushHook">func (f *StoreIfaceUpdateProgressFunc) PushHook(hook func(context.Context, int, float64) error)</a>

```
searchKey: oobmigration.StoreIfaceUpdateProgressFunc.PushHook
tags: [private]
```

```Go
func (f *StoreIfaceUpdateProgressFunc) PushHook(hook func(context.Context, int, float64) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the UpdateProgress method of the parent MockStoreIface instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreIfaceUpdateProgressFunc.SetDefaultReturn" href="#StoreIfaceUpdateProgressFunc.SetDefaultReturn">func (f *StoreIfaceUpdateProgressFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: oobmigration.StoreIfaceUpdateProgressFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *StoreIfaceUpdateProgressFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreIfaceUpdateProgressFunc.PushReturn" href="#StoreIfaceUpdateProgressFunc.PushReturn">func (f *StoreIfaceUpdateProgressFunc) PushReturn(r0 error)</a>

```
searchKey: oobmigration.StoreIfaceUpdateProgressFunc.PushReturn
tags: [private]
```

```Go
func (f *StoreIfaceUpdateProgressFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreIfaceUpdateProgressFunc.nextHook" href="#StoreIfaceUpdateProgressFunc.nextHook">func (f *StoreIfaceUpdateProgressFunc) nextHook() func(context.Context, int, float64) error</a>

```
searchKey: oobmigration.StoreIfaceUpdateProgressFunc.nextHook
tags: [private]
```

```Go
func (f *StoreIfaceUpdateProgressFunc) nextHook() func(context.Context, int, float64) error
```

#### <a id="StoreIfaceUpdateProgressFunc.appendCall" href="#StoreIfaceUpdateProgressFunc.appendCall">func (f *StoreIfaceUpdateProgressFunc) appendCall(r0 StoreIfaceUpdateProgressFuncCall)</a>

```
searchKey: oobmigration.StoreIfaceUpdateProgressFunc.appendCall
tags: [private]
```

```Go
func (f *StoreIfaceUpdateProgressFunc) appendCall(r0 StoreIfaceUpdateProgressFuncCall)
```

#### <a id="StoreIfaceUpdateProgressFunc.History" href="#StoreIfaceUpdateProgressFunc.History">func (f *StoreIfaceUpdateProgressFunc) History() []StoreIfaceUpdateProgressFuncCall</a>

```
searchKey: oobmigration.StoreIfaceUpdateProgressFunc.History
tags: [private]
```

```Go
func (f *StoreIfaceUpdateProgressFunc) History() []StoreIfaceUpdateProgressFuncCall
```

History returns a sequence of StoreIfaceUpdateProgressFuncCall objects describing the invocations of this function. 

### <a id="StoreIfaceUpdateProgressFuncCall" href="#StoreIfaceUpdateProgressFuncCall">type StoreIfaceUpdateProgressFuncCall struct</a>

```
searchKey: oobmigration.StoreIfaceUpdateProgressFuncCall
tags: [private]
```

```Go
type StoreIfaceUpdateProgressFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 float64
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

StoreIfaceUpdateProgressFuncCall is an object that describes an invocation of method UpdateProgress on an instance of MockStoreIface. 

#### <a id="StoreIfaceUpdateProgressFuncCall.Args" href="#StoreIfaceUpdateProgressFuncCall.Args">func (c StoreIfaceUpdateProgressFuncCall) Args() []interface{}</a>

```
searchKey: oobmigration.StoreIfaceUpdateProgressFuncCall.Args
tags: [private]
```

```Go
func (c StoreIfaceUpdateProgressFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreIfaceUpdateProgressFuncCall.Results" href="#StoreIfaceUpdateProgressFuncCall.Results">func (c StoreIfaceUpdateProgressFuncCall) Results() []interface{}</a>

```
searchKey: oobmigration.StoreIfaceUpdateProgressFuncCall.Results
tags: [private]
```

```Go
func (c StoreIfaceUpdateProgressFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="newMigrationStatusError" href="#newMigrationStatusError">func newMigrationStatusError(id int, expectedProgress, actualProgress float64) error</a>

```
searchKey: oobmigration.newMigrationStatusError
tags: [private]
```

```Go
func newMigrationStatusError(id int, expectedProgress, actualProgress float64) error
```

### <a id="wrapMigrationErrors" href="#wrapMigrationErrors">func wrapMigrationErrors(errs ...error) error</a>

```
searchKey: oobmigration.wrapMigrationErrors
tags: [private]
```

```Go
func wrapMigrationErrors(errs ...error) error
```

### <a id="runMigrator" href="#runMigrator">func runMigrator(ctx context.Context, store storeIface, migrator Migrator, migrations <-chan Migration, options migratorOptions, operations *operations)</a>

```
searchKey: oobmigration.runMigrator
tags: [private]
```

```Go
func runMigrator(ctx context.Context, store storeIface, migrator Migrator, migrations <-chan Migration, options migratorOptions, operations *operations)
```

runMigrator runs the given migrator function periodically (on each read from ticker) while the migration is not complete. We will periodically (on each read from migrations) update our current view of the migration progress and (more importantly) its direction. 

### <a id="runMigrationFunction" href="#runMigrationFunction">func runMigrationFunction(ctx context.Context, store storeIface, migration *Migration, migrator Migrator, operations *operations) error</a>

```
searchKey: oobmigration.runMigrationFunction
tags: [private]
```

```Go
func runMigrationFunction(ctx context.Context, store storeIface, migration *Migration, migrator Migrator, operations *operations) error
```

runMigrationFunction invokes the Up or Down method on the given migrator depending on the migration direction. If an error occurs, it will be associated in the database with the migration record. Regardless of the success of the migration function, the progress function on the migrator will be invoked and the progress written to the database. 

### <a id="updateProgress" href="#updateProgress">func updateProgress(ctx context.Context, store storeIface, migration *Migration, migrator Migrator) error</a>

```
searchKey: oobmigration.updateProgress
tags: [private]
```

```Go
func updateProgress(ctx context.Context, store storeIface, migration *Migration, migrator Migrator) error
```

updateProgress invokes the Progress method on the given migrator, updates the Progress field of the given migration record, and updates the record in the database. 

### <a id="runMigrationUp" href="#runMigrationUp">func runMigrationUp(ctx context.Context, migration *Migration, migrator Migrator, operations *operations) (err error)</a>

```
searchKey: oobmigration.runMigrationUp
tags: [private]
```

```Go
func runMigrationUp(ctx context.Context, migration *Migration, migrator Migrator, operations *operations) (err error)
```

### <a id="runMigrationDown" href="#runMigrationDown">func runMigrationDown(ctx context.Context, migration *Migration, migrator Migrator, operations *operations) (err error)</a>

```
searchKey: oobmigration.runMigrationDown
tags: [private]
```

```Go
func runMigrationDown(ctx context.Context, migration *Migration, migrator Migrator, operations *operations) (err error)
```

### <a id="scanMigrations" href="#scanMigrations">func scanMigrations(rows *sql.Rows, queryErr error) (_ []Migration, err error)</a>

```
searchKey: oobmigration.scanMigrations
tags: [private]
```

```Go
func scanMigrations(rows *sql.Rows, queryErr error) (_ []Migration, err error)
```

scanMigrations scans a slice of migrations from the return value of `*Store.query`. 

### <a id="TestRunner" href="#TestRunner">func TestRunner(t *testing.T)</a>

```
searchKey: oobmigration.TestRunner
tags: [private]
```

```Go
func TestRunner(t *testing.T)
```

### <a id="TestRunnerError" href="#TestRunnerError">func TestRunnerError(t *testing.T)</a>

```
searchKey: oobmigration.TestRunnerError
tags: [private]
```

```Go
func TestRunnerError(t *testing.T)
```

### <a id="TestRunnerRemovesCompleted" href="#TestRunnerRemovesCompleted">func TestRunnerRemovesCompleted(t *testing.T)</a>

```
searchKey: oobmigration.TestRunnerRemovesCompleted
tags: [private]
```

```Go
func TestRunnerRemovesCompleted(t *testing.T)
```

### <a id="TestRunMigrator" href="#TestRunMigrator">func TestRunMigrator(t *testing.T)</a>

```
searchKey: oobmigration.TestRunMigrator
tags: [private]
```

```Go
func TestRunMigrator(t *testing.T)
```

### <a id="TestRunMigratorMigrationErrors" href="#TestRunMigratorMigrationErrors">func TestRunMigratorMigrationErrors(t *testing.T)</a>

```
searchKey: oobmigration.TestRunMigratorMigrationErrors
tags: [private]
```

```Go
func TestRunMigratorMigrationErrors(t *testing.T)
```

### <a id="TestRunMigratorMigrationFinishesUp" href="#TestRunMigratorMigrationFinishesUp">func TestRunMigratorMigrationFinishesUp(t *testing.T)</a>

```
searchKey: oobmigration.TestRunMigratorMigrationFinishesUp
tags: [private]
```

```Go
func TestRunMigratorMigrationFinishesUp(t *testing.T)
```

### <a id="TestRunMigratorMigrationFinishesDown" href="#TestRunMigratorMigrationFinishesDown">func TestRunMigratorMigrationFinishesDown(t *testing.T)</a>

```
searchKey: oobmigration.TestRunMigratorMigrationFinishesDown
tags: [private]
```

```Go
func TestRunMigratorMigrationFinishesDown(t *testing.T)
```

### <a id="TestRunMigratorMigrationChangesDirection" href="#TestRunMigratorMigrationChangesDirection">func TestRunMigratorMigrationChangesDirection(t *testing.T)</a>

```
searchKey: oobmigration.TestRunMigratorMigrationChangesDirection
tags: [private]
```

```Go
func TestRunMigratorMigrationChangesDirection(t *testing.T)
```

### <a id="TestRunMigratorMigrationDesyncedFromData" href="#TestRunMigratorMigrationDesyncedFromData">func TestRunMigratorMigrationDesyncedFromData(t *testing.T)</a>

```
searchKey: oobmigration.TestRunMigratorMigrationDesyncedFromData
tags: [private]
```

```Go
func TestRunMigratorMigrationDesyncedFromData(t *testing.T)
```

### <a id="runMigratorWrapped" href="#runMigratorWrapped">func runMigratorWrapped(store storeIface, migrator Migrator, ticker glock.Ticker, interact func(migrations chan<- Migration))</a>

```
searchKey: oobmigration.runMigratorWrapped
tags: [private]
```

```Go
func runMigratorWrapped(store storeIface, migrator Migrator, ticker glock.Ticker, interact func(migrations chan<- Migration))
```

runMigratorWrapped creates a migrations channel, then passes it to both the runMigrator function and the given interact function, which execute concurrently. This channel can control the behavior of the migration controller from within the interact function. 

This method blocks until both functions return. The return of the interact function cancels a context controlling the runMigrator main loop. 

### <a id="tickN" href="#tickN">func tickN(ticker *glock.MockTicker, n int)</a>

```
searchKey: oobmigration.tickN
tags: [private]
```

```Go
func tickN(ticker *glock.MockTicker, n int)
```

tickN advances the given ticker by one second n times with a guaranteed reader. 

### <a id="TestRunnerValidate" href="#TestRunnerValidate">func TestRunnerValidate(t *testing.T)</a>

```
searchKey: oobmigration.TestRunnerValidate
tags: [private]
```

```Go
func TestRunnerValidate(t *testing.T)
```

### <a id="TestRunnerValidateUnfinishedUp" href="#TestRunnerValidateUnfinishedUp">func TestRunnerValidateUnfinishedUp(t *testing.T)</a>

```
searchKey: oobmigration.TestRunnerValidateUnfinishedUp
tags: [private]
```

```Go
func TestRunnerValidateUnfinishedUp(t *testing.T)
```

### <a id="TestRunnerValidateUnfinishedDown" href="#TestRunnerValidateUnfinishedDown">func TestRunnerValidateUnfinishedDown(t *testing.T)</a>

```
searchKey: oobmigration.TestRunnerValidateUnfinishedDown
tags: [private]
```

```Go
func TestRunnerValidateUnfinishedDown(t *testing.T)
```

### <a id="init.store_test.go" href="#init.store_test.go">func init()</a>

```
searchKey: oobmigration.init
tags: [private]
```

```Go
func init()
```

### <a id="TestList" href="#TestList">func TestList(t *testing.T)</a>

```
searchKey: oobmigration.TestList
tags: [private]
```

```Go
func TestList(t *testing.T)
```

### <a id="TestListEnterprise" href="#TestListEnterprise">func TestListEnterprise(t *testing.T)</a>

```
searchKey: oobmigration.TestListEnterprise
tags: [private]
```

```Go
func TestListEnterprise(t *testing.T)
```

### <a id="TestUpdateDirection" href="#TestUpdateDirection">func TestUpdateDirection(t *testing.T)</a>

```
searchKey: oobmigration.TestUpdateDirection
tags: [private]
```

```Go
func TestUpdateDirection(t *testing.T)
```

### <a id="TestUpdateProgress" href="#TestUpdateProgress">func TestUpdateProgress(t *testing.T)</a>

```
searchKey: oobmigration.TestUpdateProgress
tags: [private]
```

```Go
func TestUpdateProgress(t *testing.T)
```

### <a id="TestAddError" href="#TestAddError">func TestAddError(t *testing.T)</a>

```
searchKey: oobmigration.TestAddError
tags: [private]
```

```Go
func TestAddError(t *testing.T)
```

### <a id="TestAddErrorBounded" href="#TestAddErrorBounded">func TestAddErrorBounded(t *testing.T)</a>

```
searchKey: oobmigration.TestAddErrorBounded
tags: [private]
```

```Go
func TestAddErrorBounded(t *testing.T)
```

### <a id="timePtr" href="#timePtr">func timePtr(t time.Time) *time.Time</a>

```
searchKey: oobmigration.timePtr
tags: [private]
```

```Go
func timePtr(t time.Time) *time.Time
```

### <a id="insertMigration" href="#insertMigration">func insertMigration(store *Store, migration Migration, enterpriseOnly bool) error</a>

```
searchKey: oobmigration.insertMigration
tags: [private]
```

```Go
func insertMigration(store *Store, migration Migration, enterpriseOnly bool) error
```

### <a id="TestCompareVersions" href="#TestCompareVersions">func TestCompareVersions(t *testing.T)</a>

```
searchKey: oobmigration.TestCompareVersions
tags: [private]
```

```Go
func TestCompareVersions(t *testing.T)
```

