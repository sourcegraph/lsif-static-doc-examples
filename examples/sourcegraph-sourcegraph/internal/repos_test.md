# Package repos_test

## Index

* [Variables](#var)
    * [var dsn](#dsn)
    * [var errRollback](#errRollback)
* [Types](#type)
    * [type fakeRepoSyncHandler struct](#fakeRepoSyncHandler)
        * [func (h *fakeRepoSyncHandler) Handle(ctx context.Context, tx dbws.Store, record workerutil.Record) error](#fakeRepoSyncHandler.Handle)
* [Functions](#func)
    * [func TestDiff(t *testing.T)](#TestDiff)
    * [func TestIntegration(t *testing.T)](#TestIntegration)
    * [func assertDeletedRepoCount(ctx context.Context, t *testing.T, db *sql.DB, want int)](#assertDeletedRepoCount)
    * [func assertSourceCount(ctx context.Context, t *testing.T, db *sql.DB, want int)](#assertSourceCount)
    * [func createExternalServices(t *testing.T, store *repos.Store) map[string]*types.ExternalService](#createExternalServices)
    * [func generateExternalServices(n int, base ...*types.ExternalService) types.ExternalServices](#generateExternalServices)
    * [func hasID(ids ...api.RepoID) func(r *types.Repo) bool](#hasID)
    * [func hasNoID(r *types.Repo) bool](#hasNoID)
    * [func insertTestUser(t *testing.T, db *sql.DB) (userID int32)](#insertTestUser)
    * [func mkExternalServices(now time.Time) types.ExternalServices](#mkExternalServices)
    * [func mkRepos(n int, base ...*types.Repo) types.Repos](#mkRepos)
    * [func testConflictingSyncers(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testConflictingSyncers)
    * [func testDeleteExternalService(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testDeleteExternalService)
    * [func testNameOnConflictDiscardNew(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testNameOnConflictDiscardNew)
    * [func testNameOnConflictDiscardOld(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testNameOnConflictDiscardOld)
    * [func testNameOnConflictOnRename(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testNameOnConflictOnRename)
    * [func testOrphanedRepo(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testOrphanedRepo)
    * [func testStoreCountNotClonedRepos(t *testing.T, store *repos.Store) func(*testing.T)](#testStoreCountNotClonedRepos)
    * [func testStoreEnqueueSingleSyncJob(db *sql.DB) func(t *testing.T, store *repos.Store) func(*testing.T)](#testStoreEnqueueSingleSyncJob)
    * [func testStoreEnqueueSyncJobs(db *sql.DB, store *repos.Store) func(t *testing.T, store *repos.Store) func(*testing.T)](#testStoreEnqueueSyncJobs)
    * [func testStoreListExternalRepoSpecs(db *sql.DB) func(t *testing.T, repoStore *repos.Store) func(*testing.T)](#testStoreListExternalRepoSpecs)
    * [func testStoreSetClonedRepos(t *testing.T, store *repos.Store) func(*testing.T)](#testStoreSetClonedRepos)
    * [func testStoreUpsertRepos(t *testing.T, store *repos.Store) func(*testing.T)](#testStoreUpsertRepos)
    * [func testStoreUpsertSources(t *testing.T, store *repos.Store) func(*testing.T)](#testStoreUpsertSources)
    * [func testSyncRateLimiters(t *testing.T, store *repos.Store) func(*testing.T)](#testSyncRateLimiters)
    * [func testSyncRepo(t *testing.T, s *repos.Store) func(*testing.T)](#testSyncRepo)
    * [func testSyncRepoMaintainsOtherSources(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testSyncRepoMaintainsOtherSources)
    * [func testSyncRun(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testSyncRun)
    * [func testSyncWorkerPlumbing(db *sql.DB) func(t *testing.T, repoStore *repos.Store) func(t *testing.T)](#testSyncWorkerPlumbing)
    * [func testSyncer(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testSyncer)
    * [func testSyncerSync(t *testing.T, s *repos.Store) func(*testing.T)](#testSyncerSync)
    * [func testUserAddedRepos(db *sql.DB, userID int32) func(t *testing.T, store *repos.Store) func(t *testing.T)](#testUserAddedRepos)
    * [func transact(ctx context.Context, s *repos.Store, test func(testing.TB, *repos.Store)) func(*testing.T)](#transact)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="dsn" href="#dsn">var dsn</a>

```
searchKey: repos_test.dsn
tags: [variable string private]
```

```Go
var dsn = flag.String("dsn", "", "Database connection string to use in integration tests")
```

### <a id="errRollback" href="#errRollback">var errRollback</a>

```
searchKey: repos_test.errRollback
tags: [variable interface private]
```

```Go
var errRollback = errors.New("tx: rollback")
```

This error is passed to txstore.Done in order to always roll-back the transaction a test case executes in. This is meant to ensure each test case has a clean slate. 

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="fakeRepoSyncHandler" href="#fakeRepoSyncHandler">type fakeRepoSyncHandler struct</a>

```
searchKey: repos_test.fakeRepoSyncHandler
tags: [struct private]
```

```Go
type fakeRepoSyncHandler struct {
	jobChan chan *repos.SyncJob
}
```

#### <a id="fakeRepoSyncHandler.Handle" href="#fakeRepoSyncHandler.Handle">func (h *fakeRepoSyncHandler) Handle(ctx context.Context, tx dbws.Store, record workerutil.Record) error</a>

```
searchKey: repos_test.fakeRepoSyncHandler.Handle
tags: [method private]
```

```Go
func (h *fakeRepoSyncHandler) Handle(ctx context.Context, tx dbws.Store, record workerutil.Record) error
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="TestDiff" href="#TestDiff">func TestDiff(t *testing.T)</a>

```
searchKey: repos_test.TestDiff
tags: [method private test]
```

```Go
func TestDiff(t *testing.T)
```

### <a id="TestIntegration" href="#TestIntegration">func TestIntegration(t *testing.T)</a>

```
searchKey: repos_test.TestIntegration
tags: [method private test]
```

```Go
func TestIntegration(t *testing.T)
```

### <a id="assertDeletedRepoCount" href="#assertDeletedRepoCount">func assertDeletedRepoCount(ctx context.Context, t *testing.T, db *sql.DB, want int)</a>

```
searchKey: repos_test.assertDeletedRepoCount
tags: [method private]
```

```Go
func assertDeletedRepoCount(ctx context.Context, t *testing.T, db *sql.DB, want int)
```

### <a id="assertSourceCount" href="#assertSourceCount">func assertSourceCount(ctx context.Context, t *testing.T, db *sql.DB, want int)</a>

```
searchKey: repos_test.assertSourceCount
tags: [method private]
```

```Go
func assertSourceCount(ctx context.Context, t *testing.T, db *sql.DB, want int)
```

### <a id="createExternalServices" href="#createExternalServices">func createExternalServices(t *testing.T, store *repos.Store) map[string]*types.ExternalService</a>

```
searchKey: repos_test.createExternalServices
tags: [method private]
```

```Go
func createExternalServices(t *testing.T, store *repos.Store) map[string]*types.ExternalService
```

### <a id="generateExternalServices" href="#generateExternalServices">func generateExternalServices(n int, base ...*types.ExternalService) types.ExternalServices</a>

```
searchKey: repos_test.generateExternalServices
tags: [method private]
```

```Go
func generateExternalServices(n int, base ...*types.ExternalService) types.ExternalServices
```

### <a id="hasID" href="#hasID">func hasID(ids ...api.RepoID) func(r *types.Repo) bool</a>

```
searchKey: repos_test.hasID
tags: [method private]
```

```Go
func hasID(ids ...api.RepoID) func(r *types.Repo) bool
```

### <a id="hasNoID" href="#hasNoID">func hasNoID(r *types.Repo) bool</a>

```
searchKey: repos_test.hasNoID
tags: [method private]
```

```Go
func hasNoID(r *types.Repo) bool
```

### <a id="insertTestUser" href="#insertTestUser">func insertTestUser(t *testing.T, db *sql.DB) (userID int32)</a>

```
searchKey: repos_test.insertTestUser
tags: [method private]
```

```Go
func insertTestUser(t *testing.T, db *sql.DB) (userID int32)
```

### <a id="mkExternalServices" href="#mkExternalServices">func mkExternalServices(now time.Time) types.ExternalServices</a>

```
searchKey: repos_test.mkExternalServices
tags: [method private]
```

```Go
func mkExternalServices(now time.Time) types.ExternalServices
```

### <a id="mkRepos" href="#mkRepos">func mkRepos(n int, base ...*types.Repo) types.Repos</a>

```
searchKey: repos_test.mkRepos
tags: [method private]
```

```Go
func mkRepos(n int, base ...*types.Repo) types.Repos
```

### <a id="testConflictingSyncers" href="#testConflictingSyncers">func testConflictingSyncers(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testConflictingSyncers
tags: [method private]
```

```Go
func testConflictingSyncers(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testDeleteExternalService" href="#testDeleteExternalService">func testDeleteExternalService(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testDeleteExternalService
tags: [method private]
```

```Go
func testDeleteExternalService(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testNameOnConflictDiscardNew" href="#testNameOnConflictDiscardNew">func testNameOnConflictDiscardNew(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testNameOnConflictDiscardNew
tags: [method private]
```

```Go
func testNameOnConflictDiscardNew(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testNameOnConflictDiscardOld" href="#testNameOnConflictDiscardOld">func testNameOnConflictDiscardOld(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testNameOnConflictDiscardOld
tags: [method private]
```

```Go
func testNameOnConflictDiscardOld(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testNameOnConflictOnRename" href="#testNameOnConflictOnRename">func testNameOnConflictOnRename(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testNameOnConflictOnRename
tags: [method private]
```

```Go
func testNameOnConflictOnRename(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testOrphanedRepo" href="#testOrphanedRepo">func testOrphanedRepo(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testOrphanedRepo
tags: [method private]
```

```Go
func testOrphanedRepo(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testStoreCountNotClonedRepos" href="#testStoreCountNotClonedRepos">func testStoreCountNotClonedRepos(t *testing.T, store *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testStoreCountNotClonedRepos
tags: [method private]
```

```Go
func testStoreCountNotClonedRepos(t *testing.T, store *repos.Store) func(*testing.T)
```

### <a id="testStoreEnqueueSingleSyncJob" href="#testStoreEnqueueSingleSyncJob">func testStoreEnqueueSingleSyncJob(db *sql.DB) func(t *testing.T, store *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testStoreEnqueueSingleSyncJob
tags: [method private]
```

```Go
func testStoreEnqueueSingleSyncJob(db *sql.DB) func(t *testing.T, store *repos.Store) func(*testing.T)
```

### <a id="testStoreEnqueueSyncJobs" href="#testStoreEnqueueSyncJobs">func testStoreEnqueueSyncJobs(db *sql.DB, store *repos.Store) func(t *testing.T, store *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testStoreEnqueueSyncJobs
tags: [method private]
```

```Go
func testStoreEnqueueSyncJobs(db *sql.DB, store *repos.Store) func(t *testing.T, store *repos.Store) func(*testing.T)
```

### <a id="testStoreListExternalRepoSpecs" href="#testStoreListExternalRepoSpecs">func testStoreListExternalRepoSpecs(db *sql.DB) func(t *testing.T, repoStore *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testStoreListExternalRepoSpecs
tags: [method private]
```

```Go
func testStoreListExternalRepoSpecs(db *sql.DB) func(t *testing.T, repoStore *repos.Store) func(*testing.T)
```

### <a id="testStoreSetClonedRepos" href="#testStoreSetClonedRepos">func testStoreSetClonedRepos(t *testing.T, store *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testStoreSetClonedRepos
tags: [method private]
```

```Go
func testStoreSetClonedRepos(t *testing.T, store *repos.Store) func(*testing.T)
```

### <a id="testStoreUpsertRepos" href="#testStoreUpsertRepos">func testStoreUpsertRepos(t *testing.T, store *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testStoreUpsertRepos
tags: [method private]
```

```Go
func testStoreUpsertRepos(t *testing.T, store *repos.Store) func(*testing.T)
```

### <a id="testStoreUpsertSources" href="#testStoreUpsertSources">func testStoreUpsertSources(t *testing.T, store *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testStoreUpsertSources
tags: [method private]
```

```Go
func testStoreUpsertSources(t *testing.T, store *repos.Store) func(*testing.T)
```

### <a id="testSyncRateLimiters" href="#testSyncRateLimiters">func testSyncRateLimiters(t *testing.T, store *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testSyncRateLimiters
tags: [method private]
```

```Go
func testSyncRateLimiters(t *testing.T, store *repos.Store) func(*testing.T)
```

### <a id="testSyncRepo" href="#testSyncRepo">func testSyncRepo(t *testing.T, s *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testSyncRepo
tags: [method private]
```

```Go
func testSyncRepo(t *testing.T, s *repos.Store) func(*testing.T)
```

### <a id="testSyncRepoMaintainsOtherSources" href="#testSyncRepoMaintainsOtherSources">func testSyncRepoMaintainsOtherSources(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testSyncRepoMaintainsOtherSources
tags: [method private]
```

```Go
func testSyncRepoMaintainsOtherSources(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

Test that sync repo does not clear out any other repo relationships 

### <a id="testSyncRun" href="#testSyncRun">func testSyncRun(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testSyncRun
tags: [method private]
```

```Go
func testSyncRun(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testSyncWorkerPlumbing" href="#testSyncWorkerPlumbing">func testSyncWorkerPlumbing(db *sql.DB) func(t *testing.T, repoStore *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testSyncWorkerPlumbing
tags: [method private]
```

```Go
func testSyncWorkerPlumbing(db *sql.DB) func(t *testing.T, repoStore *repos.Store) func(t *testing.T)
```

### <a id="testSyncer" href="#testSyncer">func testSyncer(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testSyncer
tags: [method private]
```

```Go
func testSyncer(db *sql.DB) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="testSyncerSync" href="#testSyncerSync">func testSyncerSync(t *testing.T, s *repos.Store) func(*testing.T)</a>

```
searchKey: repos_test.testSyncerSync
tags: [method private]
```

```Go
func testSyncerSync(t *testing.T, s *repos.Store) func(*testing.T)
```

### <a id="testUserAddedRepos" href="#testUserAddedRepos">func testUserAddedRepos(db *sql.DB, userID int32) func(t *testing.T, store *repos.Store) func(t *testing.T)</a>

```
searchKey: repos_test.testUserAddedRepos
tags: [method private]
```

```Go
func testUserAddedRepos(db *sql.DB, userID int32) func(t *testing.T, store *repos.Store) func(t *testing.T)
```

### <a id="transact" href="#transact">func transact(ctx context.Context, s *repos.Store, test func(testing.TB, *repos.Store)) func(*testing.T)</a>

```
searchKey: repos_test.transact
tags: [method private]
```

```Go
func transact(ctx context.Context, s *repos.Store, test func(testing.TB, *repos.Store)) func(*testing.T)
```

