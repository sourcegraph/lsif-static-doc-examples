# Package repos_test

## Index

* [Variables](#var)
    * [var errRollback](#errRollback)
    * [var dsn](#dsn)
* [Types](#type)
    * [type fakeRepoSyncHandler struct](#fakeRepoSyncHandler)
        * [func (h *fakeRepoSyncHandler) Handle(ctx context.Context, tx dbws.Store, record workerutil.Record) error](#fakeRepoSyncHandler.Handle)
* [Functions](#func)
    * [func TestIntegration(t *testing.T)](#TestIntegration)
    * [func insertTestUser(t *testing.T, db *sql.DB) (userID int32)](#insertTestUser)
    * [func testStoreUpsertRepos(t *testing.T, store *repos.Store) func(*testing.T)](#testStoreUpsertRepos)
    * [func testStoreUpsertSources(t *testing.T, store *repos.Store) func(*testing.T)](#testStoreUpsertSources)
    * [func testStoreSetClonedRepos(t *testing.T, store *repos.Store) func(*testing.T)](#testStoreSetClonedRepos)
    * [func testStoreCountNotClonedRepos(t *testing.T, store *repos.Store) func(*testing.T)](#testStoreCountNotClonedRepos)
    * [func hasNoID(r *types.Repo) bool](#hasNoID)
    * [func hasID(ids ...api.RepoID) func(r *types.Repo) bool](#hasID)
    * [func testStoreListExternalRepoSpecs(db *sql.DB) func(t *testing.T, repoStore *repos.Store) func(*testing.T)](#testStoreListExternalRepoSpecs)
    * [func testSyncRateLimiters(t *testing.T, store *repos.Store) func(*testing.T)](#testSyncRateLimiters)
    * [func testStoreEnqueueSyncJobs(db *sql.DB, store *repos.Store) func(t *testing.T, store *repos.Store) func(*testing.T)](#testStoreEnqueueSyncJobs)
    * [func testStoreEnqueueSingleSyncJob(db *sql.DB) func(t *testing.T, store *repos.Store) func(*testing.T)](#testStoreEnqueueSingleSyncJob)
    * [func mkRepos(n int, base ...*types.Repo) types.Repos](#mkRepos)
    * [func generateExternalServices(n int, base ...*types.ExternalService) types.ExternalServices](#generateExternalServices)
    * [func transact(ctx context.Context, s *repos.Store, test func(testing.TB, *repos.Store)) func(*testing.T)](#transact)
    * [func createExternalServices(t *testing.T, store *repos.Store) map[string]*types.ExternalService](#createExternalServices)
    * [func mkExternalServices(now time.Time) types.ExternalServices](#mkExternalServices)
    * [func testSyncWorkerPlumbing(db *sql.DB) func(t *testing.T, repoStore *repos.Store) func(t *testing.T)](#testSyncWorkerPlumbing)
    * [func testSyncerSync(t *testing.T, s *repos.Store) func(*testing.T)](#testSyncerSync)
    * [func testSyncRepo(t *testing.T, s *repos.Store) func(*testing.T)](#testSyncRepo)
    * [func TestDiff(t *testing.T)](#TestDiff)
    * [func testSyncRun(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testSyncRun)
    * [func testSyncer(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testSyncer)
    * [func testOrphanedRepo(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testOrphanedRepo)
    * [func testConflictingSyncers(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testConflictingSyncers)
    * [func testSyncRepoMaintainsOtherSources(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testSyncRepoMaintainsOtherSources)
    * [func testUserAddedRepos(db *sql.DB, userID int32) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testUserAddedRepos)
    * [func testNameOnConflictDiscardOld(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testNameOnConflictDiscardOld)
    * [func testNameOnConflictDiscardNew(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testNameOnConflictDiscardNew)
    * [func testNameOnConflictOnRename(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testNameOnConflictOnRename)
    * [func testDeleteExternalService(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testDeleteExternalService)
    * [func assertSourceCount(ctx context.Context, t *testing.T, db *sql.DB, want int)](#assertSourceCount)
    * [func assertDeletedRepoCount(ctx context.Context, t *testing.T, db *sql.DB, want int)](#assertDeletedRepoCount)


## <a id="var" href="#var">Variables</a>

### <a id="errRollback" href="#errRollback">var errRollback</a>

```
searchKey: repos_test.errRollback
```

```Go
var errRollback = errors.New("tx: rollback")
```

This error is passed to txstore.Done in order to always roll-back the transaction a test case executes in. This is meant to ensure each test case has a clean slate. 

### <a id="dsn" href="#dsn">var dsn</a>

```
searchKey: repos_test.dsn
```

```Go
var dsn = flag.String("dsn", "", "Database connection string to use in integration tests")
```

## <a id="type" href="#type">Types</a>

### <a id="fakeRepoSyncHandler" href="#fakeRepoSyncHandler">type fakeRepoSyncHandler struct</a>

```
searchKey: repos_test.fakeRepoSyncHandler
```

```Go
type fakeRepoSyncHandler struct {
	jobChan chan *repos.SyncJob
}
```

#### <a id="fakeRepoSyncHandler.Handle" href="#fakeRepoSyncHandler.Handle">func (h *fakeRepoSyncHandler) Handle(ctx context.Context, tx dbws.Store, record workerutil.Record) error</a>

```
searchKey: repos_test.fakeRepoSyncHandler.Handle
```

```Go
func (h *fakeRepoSyncHandler) Handle(ctx context.Context, tx dbws.Store, record workerutil.Record) error
```

## <a id="func" href="#func">Functions</a>

### <a id="TestIntegration" href="#TestIntegration">func TestIntegration(t *testing.T)</a>

```
searchKey: repos_test.TestIntegration
```

```Go
func TestIntegration(t *testing.T)
```

### <a id="insertTestUser" href="#insertTestUser">func insertTestUser(t *testing.T, db *sql.DB) (userID int32)</a>

```
searchKey: repos_test.insertTestUser
```

```Go
func insertTestUser(t *testing.T, db *sql.DB) (userID int32)
```

### <a id="testStoreUpsertRepos" href="#testStoreUpsertRepos">func testStoreUpsertRepos(t *testing.T, store *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testStoreUpsertRepos
```

```Go
func testStoreUpsertRepos(t *testing.T, store *repos.Store) func(*testing.T)
```

### <a id="testStoreUpsertSources" href="#testStoreUpsertSources">func testStoreUpsertSources(t *testing.T, store *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testStoreUpsertSources
```

```Go
func testStoreUpsertSources(t *testing.T, store *repos.Store) func(*testing.T)
```

### <a id="testStoreSetClonedRepos" href="#testStoreSetClonedRepos">func testStoreSetClonedRepos(t *testing.T, store *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testStoreSetClonedRepos
```

```Go
func testStoreSetClonedRepos(t *testing.T, store *repos.Store) func(*testing.T)
```

### <a id="testStoreCountNotClonedRepos" href="#testStoreCountNotClonedRepos">func testStoreCountNotClonedRepos(t *testing.T, store *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testStoreCountNotClonedRepos
```

```Go
func testStoreCountNotClonedRepos(t *testing.T, store *repos.Store) func(*testing.T)
```

### <a id="hasNoID" href="#hasNoID">func hasNoID(r *types.Repo) bool</a>

```
searchKey: repos_test.hasNoID
```

```Go
func hasNoID(r *types.Repo) bool
```

### <a id="hasID" href="#hasID">func hasID(ids ...api.RepoID) func(r *types.Repo) bool</a>

```
searchKey: repos_test.hasID
```

```Go
func hasID(ids ...api.RepoID) func(r *types.Repo) bool
```

### <a id="testStoreListExternalRepoSpecs" href="#testStoreListExternalRepoSpecs">func testStoreListExternalRepoSpecs(db *sql.DB) func(t *testing.T, repoStore *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testStoreListExternalRepoSpecs
```

```Go
func testStoreListExternalRepoSpecs(db *sql.DB) func(t *testing.T, repoStore *repos.Store) func(*testing.T)
```

### <a id="testSyncRateLimiters" href="#testSyncRateLimiters">func testSyncRateLimiters(t *testing.T, store *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testSyncRateLimiters
```

```Go
func testSyncRateLimiters(t *testing.T, store *repos.Store) func(*testing.T)
```

### <a id="testStoreEnqueueSyncJobs" href="#testStoreEnqueueSyncJobs">func testStoreEnqueueSyncJobs(db *sql.DB, store *repos.Store) func(t *testing.T, store *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testStoreEnqueueSyncJobs
```

```Go
func testStoreEnqueueSyncJobs(db *sql.DB, store *repos.Store) func(t *testing.T, store *repos.Store) func(*testing.T)
```

### <a id="testStoreEnqueueSingleSyncJob" href="#testStoreEnqueueSingleSyncJob">func testStoreEnqueueSingleSyncJob(db *sql.DB) func(t *testing.T, store *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testStoreEnqueueSingleSyncJob
```

```Go
func testStoreEnqueueSingleSyncJob(db *sql.DB) func(t *testing.T, store *repos.Store) func(*testing.T)
```

### <a id="mkRepos" href="#mkRepos">func mkRepos(n int, base ...*types.Repo) types.Repos</a>

```
searchKey: repos_test.mkRepos
```

```Go
func mkRepos(n int, base ...*types.Repo) types.Repos
```

### <a id="generateExternalServices" href="#generateExternalServices">func generateExternalServices(n int, base ...*types.ExternalService) types.ExternalServices</a>

```
searchKey: repos_test.generateExternalServices
```

```Go
func generateExternalServices(n int, base ...*types.ExternalService) types.ExternalServices
```

### <a id="transact" href="#transact">func transact(ctx context.Context, s *repos.Store, test func(testing.TB, *repos.Store)) func(*testing.T)</a>

```
searchKey: repos_test.transact
```

```Go
func transact(ctx context.Context, s *repos.Store, test func(testing.TB, *repos.Store)) func(*testing.T)
```

### <a id="createExternalServices" href="#createExternalServices">func createExternalServices(t *testing.T, store *repos.Store) map[string]*types.ExternalService</a>

```
searchKey: repos_test.createExternalServices
```

```Go
func createExternalServices(t *testing.T, store *repos.Store) map[string]*types.ExternalService
```

### <a id="mkExternalServices" href="#mkExternalServices">func mkExternalServices(now time.Time) types.ExternalServices</a>

```
searchKey: repos_test.mkExternalServices
```

```Go
func mkExternalServices(now time.Time) types.ExternalServices
```

### <a id="testSyncWorkerPlumbing" href="#testSyncWorkerPlumbing">func testSyncWorkerPlumbing(db *sql.DB) func(t *testing.T, repoStore *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testSyncWorkerPlumbing
```

```Go
func testSyncWorkerPlumbing(db *sql.DB) func(t *testing.T, repoStore *repos.Store) func(t *testing.T)
```

### <a id="testSyncerSync" href="#testSyncerSync">func testSyncerSync(t *testing.T, s *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testSyncerSync
```

```Go
func testSyncerSync(t *testing.T, s *repos.Store) func(*testing.T)
```

### <a id="testSyncRepo" href="#testSyncRepo">func testSyncRepo(t *testing.T, s *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testSyncRepo
```

```Go
func testSyncRepo(t *testing.T, s *repos.Store) func(*testing.T)
```

### <a id="TestDiff" href="#TestDiff">func TestDiff(t *testing.T)</a>

```
searchKey: repos_test.TestDiff
```

```Go
func TestDiff(t *testing.T)
```

### <a id="testSyncRun" href="#testSyncRun">func testSyncRun(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testSyncRun
```

```Go
func testSyncRun(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testSyncer" href="#testSyncer">func testSyncer(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testSyncer
```

```Go
func testSyncer(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testOrphanedRepo" href="#testOrphanedRepo">func testOrphanedRepo(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testOrphanedRepo
```

```Go
func testOrphanedRepo(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testConflictingSyncers" href="#testConflictingSyncers">func testConflictingSyncers(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testConflictingSyncers
```

```Go
func testConflictingSyncers(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testSyncRepoMaintainsOtherSources" href="#testSyncRepoMaintainsOtherSources">func testSyncRepoMaintainsOtherSources(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testSyncRepoMaintainsOtherSources
```

```Go
func testSyncRepoMaintainsOtherSources(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

Test that sync repo does not clear out any other repo relationships 

### <a id="testUserAddedRepos" href="#testUserAddedRepos">func testUserAddedRepos(db *sql.DB, userID int32) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testUserAddedRepos
```

```Go
func testUserAddedRepos(db *sql.DB, userID int32) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testNameOnConflictDiscardOld" href="#testNameOnConflictDiscardOld">func testNameOnConflictDiscardOld(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testNameOnConflictDiscardOld
```

```Go
func testNameOnConflictDiscardOld(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testNameOnConflictDiscardNew" href="#testNameOnConflictDiscardNew">func testNameOnConflictDiscardNew(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testNameOnConflictDiscardNew
```

```Go
func testNameOnConflictDiscardNew(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testNameOnConflictOnRename" href="#testNameOnConflictOnRename">func testNameOnConflictOnRename(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testNameOnConflictOnRename
```

```Go
func testNameOnConflictOnRename(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testDeleteExternalService" href="#testDeleteExternalService">func testDeleteExternalService(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testDeleteExternalService
```

```Go
func testDeleteExternalService(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="assertSourceCount" href="#assertSourceCount">func assertSourceCount(ctx context.Context, t *testing.T, db *sql.DB, want int)</a>

```
searchKey: repos_test.assertSourceCount
```

```Go
func assertSourceCount(ctx context.Context, t *testing.T, db *sql.DB, want int)
```

### <a id="assertDeletedRepoCount" href="#assertDeletedRepoCount">func assertDeletedRepoCount(ctx context.Context, t *testing.T, db *sql.DB, want int)</a>

```
searchKey: repos_test.assertDeletedRepoCount
```

```Go
func assertDeletedRepoCount(ctx context.Context, t *testing.T, db *sql.DB, want int)
```

