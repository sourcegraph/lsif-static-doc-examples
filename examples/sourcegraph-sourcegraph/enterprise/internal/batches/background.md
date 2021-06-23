# Package background

## Index

* [Constants](#const)
    * [const bulkProcessorMaxNumRetries](#bulkProcessorMaxNumRetries)
    * [const bulkProcessorMaxNumResets](#bulkProcessorMaxNumResets)
    * [const BatchChangesSSHMigrationID](#BatchChangesSSHMigrationID)
    * [const BatchChangesUserCredentialMigrationID](#BatchChangesUserCredentialMigrationID)
    * [const BatchChangesSiteCredentialMigrationID](#BatchChangesSiteCredentialMigrationID)
    * [const reconcilerMaxNumRetries](#reconcilerMaxNumRetries)
    * [const reconcilerMaxNumResets](#reconcilerMaxNumResets)
    * [const siteCredentialMigrationCountPerRun](#siteCredentialMigrationCountPerRun)
    * [const siteCredentialMigratorProgressQuery](#siteCredentialMigratorProgressQuery)
    * [const sshMigrationCountPerRun](#sshMigrationCountPerRun)
    * [const sshMigratorProgressQuery](#sshMigratorProgressQuery)
    * [const userCredentialMigrationCountPerRun](#userCredentialMigrationCountPerRun)
    * [const userCredentialMigratorProgressQuery](#userCredentialMigratorProgressQuery)
* [Types](#type)
    * [type unknownJobTypeErr struct](#unknownJobTypeErr)
        * [func (e unknownJobTypeErr) Error() string](#unknownJobTypeErr.Error)
        * [func (e unknownJobTypeErr) NonRetryable() bool](#unknownJobTypeErr.NonRetryable)
    * [type bulkProcessor struct](#bulkProcessor)
        * [func (b *bulkProcessor) process(ctx context.Context, job *btypes.ChangesetJob) (err error)](#bulkProcessor.process)
        * [func (b *bulkProcessor) comment(ctx context.Context, job *btypes.ChangesetJob) error](#bulkProcessor.comment)
        * [func (b *bulkProcessor) detach(ctx context.Context, job *btypes.ChangesetJob) error](#bulkProcessor.detach)
        * [func (b *bulkProcessor) reenqueueChangeset(ctx context.Context, job *btypes.ChangesetJob) error](#bulkProcessor.reenqueueChangeset)
        * [func (b *bulkProcessor) mergeChangeset(ctx context.Context, job *btypes.ChangesetJob) (err error)](#bulkProcessor.mergeChangeset)
    * [type bulkProcessorWorker struct](#bulkProcessorWorker)
        * [func (b *bulkProcessorWorker) HandlerFunc() dbworker.HandlerFunc](#bulkProcessorWorker.HandlerFunc)
    * [type batchChangesMetrics struct](#batchChangesMetrics)
        * [func newMetrics() batchChangesMetrics](#newMetrics)
    * [type siteCredentialMigrator struct](#siteCredentialMigrator)
        * [func (m *siteCredentialMigrator) Progress(ctx context.Context) (float64, error)](#siteCredentialMigrator.Progress)
        * [func (m *siteCredentialMigrator) Up(ctx context.Context) error](#siteCredentialMigrator.Up)
        * [func (m *siteCredentialMigrator) Down(ctx context.Context) error](#siteCredentialMigrator.Down)
    * [type sshMigrator struct](#sshMigrator)
        * [func (m *sshMigrator) Progress(ctx context.Context) (float64, error)](#sshMigrator.Progress)
        * [func (m *sshMigrator) Up(ctx context.Context) error](#sshMigrator.Up)
        * [func (m *sshMigrator) Down(ctx context.Context) error](#sshMigrator.Down)
    * [type userCredentialMigrator struct](#userCredentialMigrator)
        * [func (m *userCredentialMigrator) Progress(ctx context.Context) (float64, error)](#userCredentialMigrator.Progress)
        * [func (m *userCredentialMigrator) Up(ctx context.Context) error](#userCredentialMigrator.Up)
        * [func (m *userCredentialMigrator) Down(ctx context.Context) error](#userCredentialMigrator.Down)
* [Functions](#func)
    * [func Routines(ctx context.Context, batchesStore *store.Store, cf *httpcli.Factory) []goroutine.BackgroundRoutine](#Routines)
    * [func newBulkOperationWorker(ctx context.Context,...](#newBulkOperationWorker)
    * [func newBulkOperationWorkerResetter(s *store.Store, metrics batchChangesMetrics) *dbworker.Resetter](#newBulkOperationWorkerResetter)
    * [func createBulkOperationDBWorkerStore(s *store.Store) dbworkerstore.Store](#createBulkOperationDBWorkerStore)
    * [func scanFirstChangesetJobRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)](#scanFirstChangesetJobRecord)
    * [func makeResetterMetrics(observationContext *observation.Context, workerName string) dbworker.ResetterMetrics](#makeResetterMetrics)
    * [func RegisterMigrations(cstore *store.Store, outOfBandMigrationRunner *oobmigration.Runner) error](#RegisterMigrations)
    * [func newReconcilerWorker(ctx context.Context,...](#newReconcilerWorker)
    * [func newReconcilerWorkerResetter(s *store.Store, metrics batchChangesMetrics) *dbworker.Resetter](#newReconcilerWorkerResetter)
    * [func scanFirstChangesetRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)](#scanFirstChangesetRecord)
    * [func createReconcilerDBWorkerStore(s *store.Store) dbworkerstore.Store](#createReconcilerDBWorkerStore)
    * [func newSpecExpireWorker(ctx context.Context, cstore *store.Store) goroutine.BackgroundRoutine](#newSpecExpireWorker)
    * [func TestBulkProcessor(t *testing.T)](#TestBulkProcessor)
    * [func TestReconcilerWorkerView(t *testing.T)](#TestReconcilerWorkerView)
    * [func assertReturnedChangesetIDs(t *testing.T, ctx context.Context, db dbutil.DB, want []int)](#assertReturnedChangesetIDs)
    * [func TestSiteCredentialMigrator(t *testing.T)](#TestSiteCredentialMigrator)
    * [func TestSSHMigrator(t *testing.T)](#TestSSHMigrator)
    * [func TestUserCredentialMigrator(t *testing.T)](#TestUserCredentialMigrator)
    * [func assertProgress(t *testing.T, ctx context.Context, want float64, migrator interface {...](#assertProgress)
    * [func createUnencryptedUserCredential(t *testing.T,...](#createUnencryptedUserCredential)
    * [func createPreviouslyEncryptedUserCredential(t *testing.T,...](#createPreviouslyEncryptedUserCredential)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="bulkProcessorMaxNumRetries" href="#bulkProcessorMaxNumRetries">const bulkProcessorMaxNumRetries</a>

```
searchKey: background.bulkProcessorMaxNumRetries
tags: [private]
```

```Go
const bulkProcessorMaxNumRetries = 10
```

bulkProcessorMaxNumRetries is the maximum number of attempts the bulkProcessor makes to process a changeset job when it fails. 

### <a id="bulkProcessorMaxNumResets" href="#bulkProcessorMaxNumResets">const bulkProcessorMaxNumResets</a>

```
searchKey: background.bulkProcessorMaxNumResets
tags: [private]
```

```Go
const bulkProcessorMaxNumResets = 60
```

bulkProcessorMaxNumResets is the maximum number of attempts the bulkProcessor makes to process a changeset job when it stalls (process crashes, etc.). 

### <a id="BatchChangesSSHMigrationID" href="#BatchChangesSSHMigrationID">const BatchChangesSSHMigrationID</a>

```
searchKey: background.BatchChangesSSHMigrationID
```

```Go
const BatchChangesSSHMigrationID = 2
```

BatchChangesSSHMigrationID is the ID of row holding the ssh migration. It is defined in `1528395788_campaigns_ssh_key_migration.up`. 

### <a id="BatchChangesUserCredentialMigrationID" href="#BatchChangesUserCredentialMigrationID">const BatchChangesUserCredentialMigrationID</a>

```
searchKey: background.BatchChangesUserCredentialMigrationID
```

```Go
const BatchChangesUserCredentialMigrationID = 9
```

BatchChangesUserCredentialMigrationID is the ID of the row holding the user credential migration. It is defined in `1528395819_oob_credential_encryption_up.sql`. 

### <a id="BatchChangesSiteCredentialMigrationID" href="#BatchChangesSiteCredentialMigrationID">const BatchChangesSiteCredentialMigrationID</a>

```
searchKey: background.BatchChangesSiteCredentialMigrationID
```

```Go
const BatchChangesSiteCredentialMigrationID = 10
```

BatchChangesSiteCredentialMigrationID is the ID of the row holding the site credential migration. It is defined in `1528395821_oob_site_credential_encryption_up.sql`. 

### <a id="reconcilerMaxNumRetries" href="#reconcilerMaxNumRetries">const reconcilerMaxNumRetries</a>

```
searchKey: background.reconcilerMaxNumRetries
tags: [private]
```

```Go
const reconcilerMaxNumRetries = 60
```

reconcilerMaxNumRetries is the maximum number of attempts the reconciler makes to process a changeset when it fails. 

### <a id="reconcilerMaxNumResets" href="#reconcilerMaxNumResets">const reconcilerMaxNumResets</a>

```
searchKey: background.reconcilerMaxNumResets
tags: [private]
```

```Go
const reconcilerMaxNumResets = 60
```

reconcilerMaxNumResets is the maximum number of attempts the reconciler makes to process a changeset when it stalls (process crashes, etc.). 

### <a id="siteCredentialMigrationCountPerRun" href="#siteCredentialMigrationCountPerRun">const siteCredentialMigrationCountPerRun</a>

```
searchKey: background.siteCredentialMigrationCountPerRun
tags: [private]
```

```Go
const siteCredentialMigrationCountPerRun = 5
```

### <a id="siteCredentialMigratorProgressQuery" href="#siteCredentialMigratorProgressQuery">const siteCredentialMigratorProgressQuery</a>

```
searchKey: background.siteCredentialMigratorProgressQuery
tags: [private]
```

```Go
const siteCredentialMigratorProgressQuery = ...
```

### <a id="sshMigrationCountPerRun" href="#sshMigrationCountPerRun">const sshMigrationCountPerRun</a>

```
searchKey: background.sshMigrationCountPerRun
tags: [private]
```

```Go
const sshMigrationCountPerRun = 5
```

### <a id="sshMigratorProgressQuery" href="#sshMigratorProgressQuery">const sshMigratorProgressQuery</a>

```
searchKey: background.sshMigratorProgressQuery
tags: [private]
```

```Go
const sshMigratorProgressQuery = ...
```

### <a id="userCredentialMigrationCountPerRun" href="#userCredentialMigrationCountPerRun">const userCredentialMigrationCountPerRun</a>

```
searchKey: background.userCredentialMigrationCountPerRun
tags: [private]
```

```Go
const userCredentialMigrationCountPerRun = 5
```

### <a id="userCredentialMigratorProgressQuery" href="#userCredentialMigratorProgressQuery">const userCredentialMigratorProgressQuery</a>

```
searchKey: background.userCredentialMigratorProgressQuery
tags: [private]
```

```Go
const userCredentialMigratorProgressQuery = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="unknownJobTypeErr" href="#unknownJobTypeErr">type unknownJobTypeErr struct</a>

```
searchKey: background.unknownJobTypeErr
tags: [private]
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
tags: [private]
```

```Go
func (e unknownJobTypeErr) Error() string
```

#### <a id="unknownJobTypeErr.NonRetryable" href="#unknownJobTypeErr.NonRetryable">func (e unknownJobTypeErr) NonRetryable() bool</a>

```
searchKey: background.unknownJobTypeErr.NonRetryable
tags: [private]
```

```Go
func (e unknownJobTypeErr) NonRetryable() bool
```

### <a id="bulkProcessor" href="#bulkProcessor">type bulkProcessor struct</a>

```
searchKey: background.bulkProcessor
tags: [private]
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

#### <a id="bulkProcessor.process" href="#bulkProcessor.process">func (b *bulkProcessor) process(ctx context.Context, job *btypes.ChangesetJob) (err error)</a>

```
searchKey: background.bulkProcessor.process
tags: [private]
```

```Go
func (b *bulkProcessor) process(ctx context.Context, job *btypes.ChangesetJob) (err error)
```

#### <a id="bulkProcessor.comment" href="#bulkProcessor.comment">func (b *bulkProcessor) comment(ctx context.Context, job *btypes.ChangesetJob) error</a>

```
searchKey: background.bulkProcessor.comment
tags: [private]
```

```Go
func (b *bulkProcessor) comment(ctx context.Context, job *btypes.ChangesetJob) error
```

#### <a id="bulkProcessor.detach" href="#bulkProcessor.detach">func (b *bulkProcessor) detach(ctx context.Context, job *btypes.ChangesetJob) error</a>

```
searchKey: background.bulkProcessor.detach
tags: [private]
```

```Go
func (b *bulkProcessor) detach(ctx context.Context, job *btypes.ChangesetJob) error
```

#### <a id="bulkProcessor.reenqueueChangeset" href="#bulkProcessor.reenqueueChangeset">func (b *bulkProcessor) reenqueueChangeset(ctx context.Context, job *btypes.ChangesetJob) error</a>

```
searchKey: background.bulkProcessor.reenqueueChangeset
tags: [private]
```

```Go
func (b *bulkProcessor) reenqueueChangeset(ctx context.Context, job *btypes.ChangesetJob) error
```

#### <a id="bulkProcessor.mergeChangeset" href="#bulkProcessor.mergeChangeset">func (b *bulkProcessor) mergeChangeset(ctx context.Context, job *btypes.ChangesetJob) (err error)</a>

```
searchKey: background.bulkProcessor.mergeChangeset
tags: [private]
```

```Go
func (b *bulkProcessor) mergeChangeset(ctx context.Context, job *btypes.ChangesetJob) (err error)
```

### <a id="bulkProcessorWorker" href="#bulkProcessorWorker">type bulkProcessorWorker struct</a>

```
searchKey: background.bulkProcessorWorker
tags: [private]
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
tags: [private]
```

```Go
func (b *bulkProcessorWorker) HandlerFunc() dbworker.HandlerFunc
```

### <a id="batchChangesMetrics" href="#batchChangesMetrics">type batchChangesMetrics struct</a>

```
searchKey: background.batchChangesMetrics
tags: [private]
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
tags: [private]
```

```Go
func newMetrics() batchChangesMetrics
```

### <a id="siteCredentialMigrator" href="#siteCredentialMigrator">type siteCredentialMigrator struct</a>

```
searchKey: background.siteCredentialMigrator
tags: [private]
```

```Go
type siteCredentialMigrator struct {
	store        *store.Store
	allowDecrypt bool
}
```

#### <a id="siteCredentialMigrator.Progress" href="#siteCredentialMigrator.Progress">func (m *siteCredentialMigrator) Progress(ctx context.Context) (float64, error)</a>

```
searchKey: background.siteCredentialMigrator.Progress
tags: [private]
```

```Go
func (m *siteCredentialMigrator) Progress(ctx context.Context) (float64, error)
```

#### <a id="siteCredentialMigrator.Up" href="#siteCredentialMigrator.Up">func (m *siteCredentialMigrator) Up(ctx context.Context) error</a>

```
searchKey: background.siteCredentialMigrator.Up
tags: [private]
```

```Go
func (m *siteCredentialMigrator) Up(ctx context.Context) error
```

#### <a id="siteCredentialMigrator.Down" href="#siteCredentialMigrator.Down">func (m *siteCredentialMigrator) Down(ctx context.Context) error</a>

```
searchKey: background.siteCredentialMigrator.Down
tags: [private]
```

```Go
func (m *siteCredentialMigrator) Down(ctx context.Context) error
```

### <a id="sshMigrator" href="#sshMigrator">type sshMigrator struct</a>

```
searchKey: background.sshMigrator
tags: [private]
```

```Go
type sshMigrator struct {
	store *store.Store
}
```

sshMigrator migrates existing batch changes credentials that have no SSH key stored to a variant that includes it. 

#### <a id="sshMigrator.Progress" href="#sshMigrator.Progress">func (m *sshMigrator) Progress(ctx context.Context) (float64, error)</a>

```
searchKey: background.sshMigrator.Progress
tags: [private]
```

```Go
func (m *sshMigrator) Progress(ctx context.Context) (float64, error)
```

Progress returns the ratio of migrated records to total records. Any record with a credential type that ends on WithSSH is considered migrated. 

#### <a id="sshMigrator.Up" href="#sshMigrator.Up">func (m *sshMigrator) Up(ctx context.Context) error</a>

```
searchKey: background.sshMigrator.Up
tags: [private]
```

```Go
func (m *sshMigrator) Up(ctx context.Context) error
```

Up loops over all credentials and finds authenticators that are missing SSH credentials, generates a keypair for them and upgrades them. 

#### <a id="sshMigrator.Down" href="#sshMigrator.Down">func (m *sshMigrator) Down(ctx context.Context) error</a>

```
searchKey: background.sshMigrator.Down
tags: [private]
```

```Go
func (m *sshMigrator) Down(ctx context.Context) error
```

Down converts all credentials that have an SSH key back to a version without, so an older version of Sourcegraph would be able to match those credentials again. 

### <a id="userCredentialMigrator" href="#userCredentialMigrator">type userCredentialMigrator struct</a>

```
searchKey: background.userCredentialMigrator
tags: [private]
```

```Go
type userCredentialMigrator struct {
	store        *store.Store
	allowDecrypt bool
}
```

#### <a id="userCredentialMigrator.Progress" href="#userCredentialMigrator.Progress">func (m *userCredentialMigrator) Progress(ctx context.Context) (float64, error)</a>

```
searchKey: background.userCredentialMigrator.Progress
tags: [private]
```

```Go
func (m *userCredentialMigrator) Progress(ctx context.Context) (float64, error)
```

#### <a id="userCredentialMigrator.Up" href="#userCredentialMigrator.Up">func (m *userCredentialMigrator) Up(ctx context.Context) error</a>

```
searchKey: background.userCredentialMigrator.Up
tags: [private]
```

```Go
func (m *userCredentialMigrator) Up(ctx context.Context) error
```

#### <a id="userCredentialMigrator.Down" href="#userCredentialMigrator.Down">func (m *userCredentialMigrator) Down(ctx context.Context) error</a>

```
searchKey: background.userCredentialMigrator.Down
tags: [private]
```

```Go
func (m *userCredentialMigrator) Down(ctx context.Context) error
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Routines" href="#Routines">func Routines(ctx context.Context, batchesStore *store.Store, cf *httpcli.Factory) []goroutine.BackgroundRoutine</a>

```
searchKey: background.Routines
```

```Go
func Routines(ctx context.Context, batchesStore *store.Store, cf *httpcli.Factory) []goroutine.BackgroundRoutine
```

### <a id="newBulkOperationWorker" href="#newBulkOperationWorker">func newBulkOperationWorker(ctx context.Context,...</a>

```
searchKey: background.newBulkOperationWorker
tags: [private]
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
tags: [private]
```

```Go
func newBulkOperationWorkerResetter(s *store.Store, metrics batchChangesMetrics) *dbworker.Resetter
```

newBulkOperationWorkerResetter creates a dbworker.Resetter that reenqueues lost jobs for processing. 

### <a id="createBulkOperationDBWorkerStore" href="#createBulkOperationDBWorkerStore">func createBulkOperationDBWorkerStore(s *store.Store) dbworkerstore.Store</a>

```
searchKey: background.createBulkOperationDBWorkerStore
tags: [private]
```

```Go
func createBulkOperationDBWorkerStore(s *store.Store) dbworkerstore.Store
```

### <a id="scanFirstChangesetJobRecord" href="#scanFirstChangesetJobRecord">func scanFirstChangesetJobRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)</a>

```
searchKey: background.scanFirstChangesetJobRecord
tags: [private]
```

```Go
func scanFirstChangesetJobRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)
```

scanFirstChangesetJobRecord wraps store.ScanFirstChangesetJob to return a generic workerutil.Record. 

### <a id="makeResetterMetrics" href="#makeResetterMetrics">func makeResetterMetrics(observationContext *observation.Context, workerName string) dbworker.ResetterMetrics</a>

```
searchKey: background.makeResetterMetrics
tags: [private]
```

```Go
func makeResetterMetrics(observationContext *observation.Context, workerName string) dbworker.ResetterMetrics
```

### <a id="RegisterMigrations" href="#RegisterMigrations">func RegisterMigrations(cstore *store.Store, outOfBandMigrationRunner *oobmigration.Runner) error</a>

```
searchKey: background.RegisterMigrations
```

```Go
func RegisterMigrations(cstore *store.Store, outOfBandMigrationRunner *oobmigration.Runner) error
```

RegisterMigrations registers all currently implemented out of band migrations by batch changes with the migration runner. 

### <a id="newReconcilerWorker" href="#newReconcilerWorker">func newReconcilerWorker(ctx context.Context,...</a>

```
searchKey: background.newReconcilerWorker
tags: [private]
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
tags: [private]
```

```Go
func newReconcilerWorkerResetter(s *store.Store, metrics batchChangesMetrics) *dbworker.Resetter
```

### <a id="scanFirstChangesetRecord" href="#scanFirstChangesetRecord">func scanFirstChangesetRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)</a>

```
searchKey: background.scanFirstChangesetRecord
tags: [private]
```

```Go
func scanFirstChangesetRecord(rows *sql.Rows, err error) (workerutil.Record, bool, error)
```

### <a id="createReconcilerDBWorkerStore" href="#createReconcilerDBWorkerStore">func createReconcilerDBWorkerStore(s *store.Store) dbworkerstore.Store</a>

```
searchKey: background.createReconcilerDBWorkerStore
tags: [private]
```

```Go
func createReconcilerDBWorkerStore(s *store.Store) dbworkerstore.Store
```

### <a id="newSpecExpireWorker" href="#newSpecExpireWorker">func newSpecExpireWorker(ctx context.Context, cstore *store.Store) goroutine.BackgroundRoutine</a>

```
searchKey: background.newSpecExpireWorker
tags: [private]
```

```Go
func newSpecExpireWorker(ctx context.Context, cstore *store.Store) goroutine.BackgroundRoutine
```

### <a id="TestBulkProcessor" href="#TestBulkProcessor">func TestBulkProcessor(t *testing.T)</a>

```
searchKey: background.TestBulkProcessor
tags: [private]
```

```Go
func TestBulkProcessor(t *testing.T)
```

### <a id="TestReconcilerWorkerView" href="#TestReconcilerWorkerView">func TestReconcilerWorkerView(t *testing.T)</a>

```
searchKey: background.TestReconcilerWorkerView
tags: [private]
```

```Go
func TestReconcilerWorkerView(t *testing.T)
```

### <a id="assertReturnedChangesetIDs" href="#assertReturnedChangesetIDs">func assertReturnedChangesetIDs(t *testing.T, ctx context.Context, db dbutil.DB, want []int)</a>

```
searchKey: background.assertReturnedChangesetIDs
tags: [private]
```

```Go
func assertReturnedChangesetIDs(t *testing.T, ctx context.Context, db dbutil.DB, want []int)
```

### <a id="TestSiteCredentialMigrator" href="#TestSiteCredentialMigrator">func TestSiteCredentialMigrator(t *testing.T)</a>

```
searchKey: background.TestSiteCredentialMigrator
tags: [private]
```

```Go
func TestSiteCredentialMigrator(t *testing.T)
```

### <a id="TestSSHMigrator" href="#TestSSHMigrator">func TestSSHMigrator(t *testing.T)</a>

```
searchKey: background.TestSSHMigrator
tags: [private]
```

```Go
func TestSSHMigrator(t *testing.T)
```

### <a id="TestUserCredentialMigrator" href="#TestUserCredentialMigrator">func TestUserCredentialMigrator(t *testing.T)</a>

```
searchKey: background.TestUserCredentialMigrator
tags: [private]
```

```Go
func TestUserCredentialMigrator(t *testing.T)
```

### <a id="assertProgress" href="#assertProgress">func assertProgress(t *testing.T, ctx context.Context, want float64, migrator interface {...</a>

```
searchKey: background.assertProgress
tags: [private]
```

```Go
func assertProgress(t *testing.T, ctx context.Context, want float64, migrator interface {
	Progress(context.Context) (float64, error)
})
```

### <a id="createUnencryptedUserCredential" href="#createUnencryptedUserCredential">func createUnencryptedUserCredential(t *testing.T,...</a>

```
searchKey: background.createUnencryptedUserCredential
tags: [private]
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

### <a id="createPreviouslyEncryptedUserCredential" href="#createPreviouslyEncryptedUserCredential">func createPreviouslyEncryptedUserCredential(t *testing.T,...</a>

```
searchKey: background.createPreviouslyEncryptedUserCredential
tags: [private]
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

