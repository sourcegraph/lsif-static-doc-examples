# Package background

## Index

* [Constants](#const)
    * [const BatchChangesSSHMigrationID](#BatchChangesSSHMigrationID)
    * [const BatchChangesSiteCredentialMigrationID](#BatchChangesSiteCredentialMigrationID)
    * [const BatchChangesUserCredentialMigrationID](#BatchChangesUserCredentialMigrationID)
    * [const bulkProcessorMaxNumResets](#bulkProcessorMaxNumResets)
    * [const bulkProcessorMaxNumRetries](#bulkProcessorMaxNumRetries)
    * [const reconcilerMaxNumResets](#reconcilerMaxNumResets)
    * [const reconcilerMaxNumRetries](#reconcilerMaxNumRetries)
    * [const siteCredentialMigrationCountPerRun](#siteCredentialMigrationCountPerRun)
    * [const siteCredentialMigratorProgressQuery](#siteCredentialMigratorProgressQuery)
    * [const sshMigrationCountPerRun](#sshMigrationCountPerRun)
    * [const sshMigratorProgressQuery](#sshMigratorProgressQuery)
    * [const userCredentialMigrationCountPerRun](#userCredentialMigrationCountPerRun)
    * [const userCredentialMigratorProgressQuery](#userCredentialMigratorProgressQuery)
* [Types](#type)
    * [type batchChangesMetrics struct](#batchChangesMetrics)
        * [func newMetrics() batchChangesMetrics](#newMetrics)
    * [type bulkProcessor struct](#bulkProcessor)
        * [func (b *bulkProcessor) comment(ctx context.Context, job *btypes.ChangesetJob) error](#bulkProcessor.comment)
        * [func (b *bulkProcessor) detach(ctx context.Context, job *btypes.ChangesetJob) error](#bulkProcessor.detach)
        * [func (b *bulkProcessor) mergeChangeset(ctx context.Context, job *btypes.ChangesetJob) (err error)](#bulkProcessor.mergeChangeset)
        * [func (b *bulkProcessor) process(ctx context.Context, job *btypes.ChangesetJob) (err error)](#bulkProcessor.process)
        * [func (b *bulkProcessor) reenqueueChangeset(ctx context.Context, job *btypes.ChangesetJob) error](#bulkProcessor.reenqueueChangeset)
    * [type bulkProcessorWorker struct](#bulkProcessorWorker)
        * [func (b *bulkProcessorWorker) HandlerFunc() dbworker.HandlerFunc](#bulkProcessorWorker.HandlerFunc)
    * [type siteCredentialMigrator struct](#siteCredentialMigrator)
        * [func (m *siteCredentialMigrator) Down(ctx context.Context) error](#siteCredentialMigrator.Down)
        * [func (m *siteCredentialMigrator) Progress(ctx context.Context) (float64, error)](#siteCredentialMigrator.Progress)
        * [func (m *siteCredentialMigrator) Up(ctx context.Context) error](#siteCredentialMigrator.Up)
    * [type sshMigrator struct](#sshMigrator)
        * [func (m *sshMigrator) Down(ctx context.Context) error](#sshMigrator.Down)
        * [func (m *sshMigrator) Progress(ctx context.Context) (float64, error)](#sshMigrator.Progress)
        * [func (m *sshMigrator) Up(ctx context.Context) error](#sshMigrator.Up)
    * [type unknownJobTypeErr struct](#unknownJobTypeErr)
        * [func (e unknownJobTypeErr) Error() string](#unknownJobTypeErr.Error)
        * [func (e unknownJobTypeErr) NonRetryable() bool](#unknownJobTypeErr.NonRetryable)
    * [type userCredentialMigrator struct](#userCredentialMigrator)
        * [func (m *userCredentialMigrator) Down(ctx context.Context) error](#userCredentialMigrator.Down)
        * [func (m *userCredentialMigrator) Progress(ctx context.Context) (float64, error)](#userCredentialMigrator.Progress)
        * [func (m *userCredentialMigrator) Up(ctx context.Context) error](#userCredentialMigrator.Up)
* [Functions](#func)
    * [func RegisterMigrations(cstore *store.Store, outOfBandMigrationRunner *oobmigration.Runner) error](#RegisterMigrations)
    * [func Routines(ctx context.Context, batchesStore *store.Store, cf *httpcli.Factory) []goroutine.BackgroundRoutine](#Routines)
    * [func TestBulkProcessor(t *testing.T)](#TestBulkProcessor)
    * [func TestReconcilerWorkerView(t *testing.T)](#TestReconcilerWorkerView)
    * [func TestSSHMigrator(t *testing.T)](#TestSSHMigrator)
    * [func TestSiteCredentialMigrator(t *testing.T)](#TestSiteCredentialMigrator)
    * [func TestUserCredentialMigrator(t *testing.T)](#TestUserCredentialMigrator)
    * [func assertProgress(t *testing.T, ctx context.Context, want float64, migrator interface {...](#assertProgress)
    * [func assertReturnedChangesetIDs(t *testing.T, ctx context.Context, db dbutil.DB, want []int)](#assertReturnedChangesetIDs)
    * [func createBulkOperationDBWorkerStore(s *store.Store) dbworkerstore.Store](#createBulkOperationDBWorkerStore)
    * [func createPreviouslyEncryptedUserCredential(t *testing.T,...](#createPreviouslyEncryptedUserCredential)
    * [func createReconcilerDBWorkerStore(s *store.Store) dbworkerstore.Store](#createReconcilerDBWorkerStore)
    * [func createUnencryptedUserCredential(t *testing.T,...](#createUnencryptedUserCredential)
    * [func makeResetterMetrics(observationContext *observation.Context, workerName string) dbworker.ResetterMetrics](#makeResetterMetrics)
    * [func newBulkOperationWorker(ctx context.Context,...](#newBulkOperationWorker)
    * [func newBulkOperationWorkerResetter(s *store.Store, metrics batchChangesMetrics) *dbworker.Resetter](#newBulkOperationWorkerResetter)
    * [func newReconcilerWorker(ctx context.Context,...](#newReconcilerWorker)
    * [func newReconcilerWorkerResetter(s *store.Store, metrics batchChangesMetrics) *dbworker.Resetter](#newReconcilerWorkerResetter)
    * [func newSpecExpireWorker(ctx context.Context, cstore *store.Store) goroutine.BackgroundRoutine](#newSpecExpireWorker)
    * [func scanFirstChangesetJobRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)](#scanFirstChangesetJobRecord)
    * [func scanFirstChangesetRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)](#scanFirstChangesetRecord)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="BatchChangesSSHMigrationID" href="#BatchChangesSSHMigrationID">const BatchChangesSSHMigrationID</a>

```
searchKey: background.BatchChangesSSHMigrationID
tags: [constant number]
```

```Go
const BatchChangesSSHMigrationID = 2
```

BatchChangesSSHMigrationID is the ID of row holding the ssh migration. It is defined in `1528395788_campaigns_ssh_key_migration.up`. 

### <a id="BatchChangesSiteCredentialMigrationID" href="#BatchChangesSiteCredentialMigrationID">const BatchChangesSiteCredentialMigrationID</a>

```
searchKey: background.BatchChangesSiteCredentialMigrationID
tags: [constant number]
```

```Go
const BatchChangesSiteCredentialMigrationID = 10
```

BatchChangesSiteCredentialMigrationID is the ID of the row holding the site credential migration. It is defined in `1528395821_oob_site_credential_encryption_up.sql`. 

### <a id="BatchChangesUserCredentialMigrationID" href="#BatchChangesUserCredentialMigrationID">const BatchChangesUserCredentialMigrationID</a>

```
searchKey: background.BatchChangesUserCredentialMigrationID
tags: [constant number]
```

```Go
const BatchChangesUserCredentialMigrationID = 9
```

BatchChangesUserCredentialMigrationID is the ID of the row holding the user credential migration. It is defined in `1528395819_oob_credential_encryption_up.sql`. 

### <a id="bulkProcessorMaxNumResets" href="#bulkProcessorMaxNumResets">const bulkProcessorMaxNumResets</a>

```
searchKey: background.bulkProcessorMaxNumResets
tags: [constant number private]
```

```Go
const bulkProcessorMaxNumResets = 60
```

bulkProcessorMaxNumResets is the maximum number of attempts the bulkProcessor makes to process a changeset job when it stalls (process crashes, etc.). 

### <a id="bulkProcessorMaxNumRetries" href="#bulkProcessorMaxNumRetries">const bulkProcessorMaxNumRetries</a>

```
searchKey: background.bulkProcessorMaxNumRetries
tags: [constant number private]
```

```Go
const bulkProcessorMaxNumRetries = 10
```

bulkProcessorMaxNumRetries is the maximum number of attempts the bulkProcessor makes to process a changeset job when it fails. 

### <a id="reconcilerMaxNumResets" href="#reconcilerMaxNumResets">const reconcilerMaxNumResets</a>

```
searchKey: background.reconcilerMaxNumResets
tags: [constant number private]
```

```Go
const reconcilerMaxNumResets = 60
```

reconcilerMaxNumResets is the maximum number of attempts the reconciler makes to process a changeset when it stalls (process crashes, etc.). 

### <a id="reconcilerMaxNumRetries" href="#reconcilerMaxNumRetries">const reconcilerMaxNumRetries</a>

```
searchKey: background.reconcilerMaxNumRetries
tags: [constant number private]
```

```Go
const reconcilerMaxNumRetries = 60
```

reconcilerMaxNumRetries is the maximum number of attempts the reconciler makes to process a changeset when it fails. 

### <a id="siteCredentialMigrationCountPerRun" href="#siteCredentialMigrationCountPerRun">const siteCredentialMigrationCountPerRun</a>

```
searchKey: background.siteCredentialMigrationCountPerRun
tags: [constant number private]
```

```Go
const siteCredentialMigrationCountPerRun = 5
```

### <a id="siteCredentialMigratorProgressQuery" href="#siteCredentialMigratorProgressQuery">const siteCredentialMigratorProgressQuery</a>

```
searchKey: background.siteCredentialMigratorProgressQuery
tags: [constant string private]
```

```Go
const siteCredentialMigratorProgressQuery = ...
```

### <a id="sshMigrationCountPerRun" href="#sshMigrationCountPerRun">const sshMigrationCountPerRun</a>

```
searchKey: background.sshMigrationCountPerRun
tags: [constant number private]
```

```Go
const sshMigrationCountPerRun = 5
```

### <a id="sshMigratorProgressQuery" href="#sshMigratorProgressQuery">const sshMigratorProgressQuery</a>

```
searchKey: background.sshMigratorProgressQuery
tags: [constant string private]
```

```Go
const sshMigratorProgressQuery = ...
```

### <a id="userCredentialMigrationCountPerRun" href="#userCredentialMigrationCountPerRun">const userCredentialMigrationCountPerRun</a>

```
searchKey: background.userCredentialMigrationCountPerRun
tags: [constant number private]
```

```Go
const userCredentialMigrationCountPerRun = 5
```

### <a id="userCredentialMigratorProgressQuery" href="#userCredentialMigratorProgressQuery">const userCredentialMigratorProgressQuery</a>

```
searchKey: background.userCredentialMigratorProgressQuery
tags: [constant string private]
```

```Go
const userCredentialMigratorProgressQuery = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="batchChangesMetrics" href="#batchChangesMetrics">type batchChangesMetrics struct</a>

```
searchKey: background.batchChangesMetrics
tags: [struct private]
```

```Go
type batchChangesMetrics struct {
	reconcilerWorkerMetrics            workerutil.WorkerMetrics
	bulkProcessorWorkerMetrics         workerutil.WorkerMetrics
	reconcilerWorkerResetterMetrics    dbworker.ResetterMetrics
	bulkProcessorWorkerResetterMetrics dbworker.ResetterMetrics
}
```

#### <a id="newMetrics" href="#newMetrics">func newMetrics() batchChangesMetrics</a>

```
searchKey: background.newMetrics
tags: [function private]
```

```Go
func newMetrics() batchChangesMetrics
```

### <a id="bulkProcessor" href="#bulkProcessor">type bulkProcessor struct</a>

```
searchKey: background.bulkProcessor
tags: [struct private]
```

```Go
type bulkProcessor struct {
	tx      *store.Store
	sourcer sources.Sourcer

	css  sources.ChangesetSource
	repo *types.Repo
	ch   *btypes.Changeset
}
```

#### <a id="bulkProcessor.comment" href="#bulkProcessor.comment">func (b *bulkProcessor) comment(ctx context.Context, job *btypes.ChangesetJob) error</a>

```
searchKey: background.bulkProcessor.comment
tags: [method private]
```

```Go
func (b *bulkProcessor) comment(ctx context.Context, job *btypes.ChangesetJob) error
```

#### <a id="bulkProcessor.detach" href="#bulkProcessor.detach">func (b *bulkProcessor) detach(ctx context.Context, job *btypes.ChangesetJob) error</a>

```
searchKey: background.bulkProcessor.detach
tags: [method private]
```

```Go
func (b *bulkProcessor) detach(ctx context.Context, job *btypes.ChangesetJob) error
```

#### <a id="bulkProcessor.mergeChangeset" href="#bulkProcessor.mergeChangeset">func (b *bulkProcessor) mergeChangeset(ctx context.Context, job *btypes.ChangesetJob) (err error)</a>

```
searchKey: background.bulkProcessor.mergeChangeset
tags: [method private]
```

```Go
func (b *bulkProcessor) mergeChangeset(ctx context.Context, job *btypes.ChangesetJob) (err error)
```

#### <a id="bulkProcessor.process" href="#bulkProcessor.process">func (b *bulkProcessor) process(ctx context.Context, job *btypes.ChangesetJob) (err error)</a>

```
searchKey: background.bulkProcessor.process
tags: [method private]
```

```Go
func (b *bulkProcessor) process(ctx context.Context, job *btypes.ChangesetJob) (err error)
```

#### <a id="bulkProcessor.reenqueueChangeset" href="#bulkProcessor.reenqueueChangeset">func (b *bulkProcessor) reenqueueChangeset(ctx context.Context, job *btypes.ChangesetJob) error</a>

```
searchKey: background.bulkProcessor.reenqueueChangeset
tags: [method private]
```

```Go
func (b *bulkProcessor) reenqueueChangeset(ctx context.Context, job *btypes.ChangesetJob) error
```

### <a id="bulkProcessorWorker" href="#bulkProcessorWorker">type bulkProcessorWorker struct</a>

```
searchKey: background.bulkProcessorWorker
tags: [struct private]
```

```Go
type bulkProcessorWorker struct {
	store   *store.Store
	sourcer sources.Sourcer
}
```

bulkProcessorWorker is a wrapper for the workerutil handlerfunc to create a bulkProcessor with a source and store. 

#### <a id="bulkProcessorWorker.HandlerFunc" href="#bulkProcessorWorker.HandlerFunc">func (b *bulkProcessorWorker) HandlerFunc() dbworker.HandlerFunc</a>

```
searchKey: background.bulkProcessorWorker.HandlerFunc
tags: [method private]
```

```Go
func (b *bulkProcessorWorker) HandlerFunc() dbworker.HandlerFunc
```

### <a id="siteCredentialMigrator" href="#siteCredentialMigrator">type siteCredentialMigrator struct</a>

```
searchKey: background.siteCredentialMigrator
tags: [struct private]
```

```Go
type siteCredentialMigrator struct {
	store        *store.Store
	allowDecrypt bool
}
```

#### <a id="siteCredentialMigrator.Down" href="#siteCredentialMigrator.Down">func (m *siteCredentialMigrator) Down(ctx context.Context) error</a>

```
searchKey: background.siteCredentialMigrator.Down
tags: [method private]
```

```Go
func (m *siteCredentialMigrator) Down(ctx context.Context) error
```

#### <a id="siteCredentialMigrator.Progress" href="#siteCredentialMigrator.Progress">func (m *siteCredentialMigrator) Progress(ctx context.Context) (float64, error)</a>

```
searchKey: background.siteCredentialMigrator.Progress
tags: [method private]
```

```Go
func (m *siteCredentialMigrator) Progress(ctx context.Context) (float64, error)
```

#### <a id="siteCredentialMigrator.Up" href="#siteCredentialMigrator.Up">func (m *siteCredentialMigrator) Up(ctx context.Context) error</a>

```
searchKey: background.siteCredentialMigrator.Up
tags: [method private]
```

```Go
func (m *siteCredentialMigrator) Up(ctx context.Context) error
```

### <a id="sshMigrator" href="#sshMigrator">type sshMigrator struct</a>

```
searchKey: background.sshMigrator
tags: [struct private]
```

```Go
type sshMigrator struct {
	store *store.Store
}
```

sshMigrator migrates existing batch changes credentials that have no SSH key stored to a variant that includes it. 

#### <a id="sshMigrator.Down" href="#sshMigrator.Down">func (m *sshMigrator) Down(ctx context.Context) error</a>

```
searchKey: background.sshMigrator.Down
tags: [method private]
```

```Go
func (m *sshMigrator) Down(ctx context.Context) error
```

Down converts all credentials that have an SSH key back to a version without, so an older version of Sourcegraph would be able to match those credentials again. 

#### <a id="sshMigrator.Progress" href="#sshMigrator.Progress">func (m *sshMigrator) Progress(ctx context.Context) (float64, error)</a>

```
searchKey: background.sshMigrator.Progress
tags: [method private]
```

```Go
func (m *sshMigrator) Progress(ctx context.Context) (float64, error)
```

Progress returns the ratio of migrated records to total records. Any record with a credential type that ends on WithSSH is considered migrated. 

#### <a id="sshMigrator.Up" href="#sshMigrator.Up">func (m *sshMigrator) Up(ctx context.Context) error</a>

```
searchKey: background.sshMigrator.Up
tags: [method private]
```

```Go
func (m *sshMigrator) Up(ctx context.Context) error
```

Up loops over all credentials and finds authenticators that are missing SSH credentials, generates a keypair for them and upgrades them. 

### <a id="unknownJobTypeErr" href="#unknownJobTypeErr">type unknownJobTypeErr struct</a>

```
searchKey: background.unknownJobTypeErr
tags: [struct private]
```

```Go
type unknownJobTypeErr struct {
	jobType string
}
```

unknownJobTypeErr is returned when a ChangesetJob record is of an unknown type and hence cannot be executed. 

#### <a id="unknownJobTypeErr.Error" href="#unknownJobTypeErr.Error">func (e unknownJobTypeErr) Error() string</a>

```
searchKey: background.unknownJobTypeErr.Error
tags: [method private]
```

```Go
func (e unknownJobTypeErr) Error() string
```

#### <a id="unknownJobTypeErr.NonRetryable" href="#unknownJobTypeErr.NonRetryable">func (e unknownJobTypeErr) NonRetryable() bool</a>

```
searchKey: background.unknownJobTypeErr.NonRetryable
tags: [method private]
```

```Go
func (e unknownJobTypeErr) NonRetryable() bool
```

### <a id="userCredentialMigrator" href="#userCredentialMigrator">type userCredentialMigrator struct</a>

```
searchKey: background.userCredentialMigrator
tags: [struct private]
```

```Go
type userCredentialMigrator struct {
	store        *store.Store
	allowDecrypt bool
}
```

#### <a id="userCredentialMigrator.Down" href="#userCredentialMigrator.Down">func (m *userCredentialMigrator) Down(ctx context.Context) error</a>

```
searchKey: background.userCredentialMigrator.Down
tags: [method private]
```

```Go
func (m *userCredentialMigrator) Down(ctx context.Context) error
```

#### <a id="userCredentialMigrator.Progress" href="#userCredentialMigrator.Progress">func (m *userCredentialMigrator) Progress(ctx context.Context) (float64, error)</a>

```
searchKey: background.userCredentialMigrator.Progress
tags: [method private]
```

```Go
func (m *userCredentialMigrator) Progress(ctx context.Context) (float64, error)
```

#### <a id="userCredentialMigrator.Up" href="#userCredentialMigrator.Up">func (m *userCredentialMigrator) Up(ctx context.Context) error</a>

```
searchKey: background.userCredentialMigrator.Up
tags: [method private]
```

```Go
func (m *userCredentialMigrator) Up(ctx context.Context) error
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="RegisterMigrations" href="#RegisterMigrations">func RegisterMigrations(cstore *store.Store, outOfBandMigrationRunner *oobmigration.Runner) error</a>

```
searchKey: background.RegisterMigrations
tags: [function]
```

```Go
func RegisterMigrations(cstore *store.Store, outOfBandMigrationRunner *oobmigration.Runner) error
```

RegisterMigrations registers all currently implemented out of band migrations by batch changes with the migration runner. 

### <a id="Routines" href="#Routines">func Routines(ctx context.Context, batchesStore *store.Store, cf *httpcli.Factory) []goroutine.BackgroundRoutine</a>

```
searchKey: background.Routines
tags: [function]
```

```Go
func Routines(ctx context.Context, batchesStore *store.Store, cf *httpcli.Factory) []goroutine.BackgroundRoutine
```

### <a id="TestBulkProcessor" href="#TestBulkProcessor">func TestBulkProcessor(t *testing.T)</a>

```
searchKey: background.TestBulkProcessor
tags: [function private test]
```

```Go
func TestBulkProcessor(t *testing.T)
```

### <a id="TestReconcilerWorkerView" href="#TestReconcilerWorkerView">func TestReconcilerWorkerView(t *testing.T)</a>

```
searchKey: background.TestReconcilerWorkerView
tags: [function private test]
```

```Go
func TestReconcilerWorkerView(t *testing.T)
```

### <a id="TestSSHMigrator" href="#TestSSHMigrator">func TestSSHMigrator(t *testing.T)</a>

```
searchKey: background.TestSSHMigrator
tags: [function private test]
```

```Go
func TestSSHMigrator(t *testing.T)
```

### <a id="TestSiteCredentialMigrator" href="#TestSiteCredentialMigrator">func TestSiteCredentialMigrator(t *testing.T)</a>

```
searchKey: background.TestSiteCredentialMigrator
tags: [function private test]
```

```Go
func TestSiteCredentialMigrator(t *testing.T)
```

### <a id="TestUserCredentialMigrator" href="#TestUserCredentialMigrator">func TestUserCredentialMigrator(t *testing.T)</a>

```
searchKey: background.TestUserCredentialMigrator
tags: [function private test]
```

```Go
func TestUserCredentialMigrator(t *testing.T)
```

### <a id="assertProgress" href="#assertProgress">func assertProgress(t *testing.T, ctx context.Context, want float64, migrator interface {...</a>

```
searchKey: background.assertProgress
tags: [function private]
```

```Go
func assertProgress(t *testing.T, ctx context.Context, want float64, migrator interface {
	Progress(context.Context) (float64, error)
})
```

### <a id="assertReturnedChangesetIDs" href="#assertReturnedChangesetIDs">func assertReturnedChangesetIDs(t *testing.T, ctx context.Context, db dbutil.DB, want []int)</a>

```
searchKey: background.assertReturnedChangesetIDs
tags: [function private]
```

```Go
func assertReturnedChangesetIDs(t *testing.T, ctx context.Context, db dbutil.DB, want []int)
```

### <a id="createBulkOperationDBWorkerStore" href="#createBulkOperationDBWorkerStore">func createBulkOperationDBWorkerStore(s *store.Store) dbworkerstore.Store</a>

```
searchKey: background.createBulkOperationDBWorkerStore
tags: [function private]
```

```Go
func createBulkOperationDBWorkerStore(s *store.Store) dbworkerstore.Store
```

### <a id="createPreviouslyEncryptedUserCredential" href="#createPreviouslyEncryptedUserCredential">func createPreviouslyEncryptedUserCredential(t *testing.T,...</a>

```
searchKey: background.createPreviouslyEncryptedUserCredential
tags: [function private]
```

```Go
func createPreviouslyEncryptedUserCredential(
	t *testing.T,
	ctx context.Context,
	store *store.Store,
	scope database.UserCredentialScope,
	a auth.Authenticator,
) *database.UserCredential
```

### <a id="createReconcilerDBWorkerStore" href="#createReconcilerDBWorkerStore">func createReconcilerDBWorkerStore(s *store.Store) dbworkerstore.Store</a>

```
searchKey: background.createReconcilerDBWorkerStore
tags: [function private]
```

```Go
func createReconcilerDBWorkerStore(s *store.Store) dbworkerstore.Store
```

### <a id="createUnencryptedUserCredential" href="#createUnencryptedUserCredential">func createUnencryptedUserCredential(t *testing.T,...</a>

```
searchKey: background.createUnencryptedUserCredential
tags: [function private]
```

```Go
func createUnencryptedUserCredential(
	t *testing.T,
	ctx context.Context,
	store *store.Store,
	scope database.UserCredentialScope,
	a auth.Authenticator,
) *database.UserCredential
```

### <a id="makeResetterMetrics" href="#makeResetterMetrics">func makeResetterMetrics(observationContext *observation.Context, workerName string) dbworker.ResetterMetrics</a>

```
searchKey: background.makeResetterMetrics
tags: [function private]
```

```Go
func makeResetterMetrics(observationContext *observation.Context, workerName string) dbworker.ResetterMetrics
```

### <a id="newBulkOperationWorker" href="#newBulkOperationWorker">func newBulkOperationWorker(ctx context.Context,...</a>

```
searchKey: background.newBulkOperationWorker
tags: [function private]
```

```Go
func newBulkOperationWorker(
	ctx context.Context,
	s *store.Store,
	sourcer sources.Sourcer,
	metrics batchChangesMetrics,
) *workerutil.Worker
```

newBulkOperationWorker creates a dbworker.Worker that fetches enqueued changeset_jobs from the database and passes them to the bulk executor for processing. 

### <a id="newBulkOperationWorkerResetter" href="#newBulkOperationWorkerResetter">func newBulkOperationWorkerResetter(s *store.Store, metrics batchChangesMetrics) *dbworker.Resetter</a>

```
searchKey: background.newBulkOperationWorkerResetter
tags: [function private]
```

```Go
func newBulkOperationWorkerResetter(s *store.Store, metrics batchChangesMetrics) *dbworker.Resetter
```

newBulkOperationWorkerResetter creates a dbworker.Resetter that reenqueues lost jobs for processing. 

### <a id="newReconcilerWorker" href="#newReconcilerWorker">func newReconcilerWorker(ctx context.Context,...</a>

```
searchKey: background.newReconcilerWorker
tags: [function private]
```

```Go
func newReconcilerWorker(
	ctx context.Context,
	s *store.Store,
	gitClient reconciler.GitserverClient,
	sourcer sources.Sourcer,
	metrics batchChangesMetrics,
) *workerutil.Worker
```

newReconcilerWorker creates a dbworker.newWorker that fetches enqueued changesets from the database and passes them to the changeset reconciler for processing. 

### <a id="newReconcilerWorkerResetter" href="#newReconcilerWorkerResetter">func newReconcilerWorkerResetter(s *store.Store, metrics batchChangesMetrics) *dbworker.Resetter</a>

```
searchKey: background.newReconcilerWorkerResetter
tags: [function private]
```

```Go
func newReconcilerWorkerResetter(s *store.Store, metrics batchChangesMetrics) *dbworker.Resetter
```

### <a id="newSpecExpireWorker" href="#newSpecExpireWorker">func newSpecExpireWorker(ctx context.Context, cstore *store.Store) goroutine.BackgroundRoutine</a>

```
searchKey: background.newSpecExpireWorker
tags: [function private]
```

```Go
func newSpecExpireWorker(ctx context.Context, cstore *store.Store) goroutine.BackgroundRoutine
```

### <a id="scanFirstChangesetJobRecord" href="#scanFirstChangesetJobRecord">func scanFirstChangesetJobRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)</a>

```
searchKey: background.scanFirstChangesetJobRecord
tags: [function private]
```

```Go
func scanFirstChangesetJobRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)
```

scanFirstChangesetJobRecord wraps store.ScanFirstChangesetJob to return a generic workerutil.Record. 

### <a id="scanFirstChangesetRecord" href="#scanFirstChangesetRecord">func scanFirstChangesetRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)</a>

```
searchKey: background.scanFirstChangesetRecord
tags: [function private]
```

```Go
func scanFirstChangesetRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)
```

