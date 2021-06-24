# Package background

## Index

* Subpages
  * [enterprise/internal/insights/background/queryrunner](background/queryrunner.md)
* [Constants](#const)
    * [const queryJobOffsetTime](#queryJobOffsetTime)
* [Variables](#var)
    * [var testRealGlobalSettings](#testRealGlobalSettings)
* [Types](#type)
    * [type MockRepoStore struct](#MockRepoStore)
        * [func NewMockRepoStore() *MockRepoStore](#NewMockRepoStore)
        * [func NewMockRepoStoreFrom(i RepoStore) *MockRepoStore](#NewMockRepoStoreFrom)
        * [func (m *MockRepoStore) GetByName(v0 context.Context, v1 api.RepoName) (*types.Repo, error)](#MockRepoStore.GetByName)
    * [type RepoStore interface](#RepoStore)
    * [type RepoStoreGetByNameFunc struct](#RepoStoreGetByNameFunc)
        * [func (f *RepoStoreGetByNameFunc) History() []RepoStoreGetByNameFuncCall](#RepoStoreGetByNameFunc.History)
        * [func (f *RepoStoreGetByNameFunc) PushHook(hook func(context.Context, api.RepoName) (*types.Repo, error))](#RepoStoreGetByNameFunc.PushHook)
        * [func (f *RepoStoreGetByNameFunc) PushReturn(r0 *types.Repo, r1 error)](#RepoStoreGetByNameFunc.PushReturn)
        * [func (f *RepoStoreGetByNameFunc) SetDefaultHook(hook func(context.Context, api.RepoName) (*types.Repo, error))](#RepoStoreGetByNameFunc.SetDefaultHook)
        * [func (f *RepoStoreGetByNameFunc) SetDefaultReturn(r0 *types.Repo, r1 error)](#RepoStoreGetByNameFunc.SetDefaultReturn)
        * [func (f *RepoStoreGetByNameFunc) appendCall(r0 RepoStoreGetByNameFuncCall)](#RepoStoreGetByNameFunc.appendCall)
        * [func (f *RepoStoreGetByNameFunc) nextHook() func(context.Context, api.RepoName) (*types.Repo, error)](#RepoStoreGetByNameFunc.nextHook)
    * [type RepoStoreGetByNameFuncCall struct](#RepoStoreGetByNameFuncCall)
        * [func (c RepoStoreGetByNameFuncCall) Args() []interface{}](#RepoStoreGetByNameFuncCall.Args)
        * [func (c RepoStoreGetByNameFuncCall) Results() []interface{}](#RepoStoreGetByNameFuncCall.Results)
    * [type buildSeriesContext struct](#buildSeriesContext)
    * [type cachedGitFirstEverCommit struct](#cachedGitFirstEverCommit)
        * [func (c *cachedGitFirstEverCommit) gitFirstEverCommit(ctx context.Context, repoName api.RepoName) (*git.Commit, error)](#cachedGitFirstEverCommit.gitFirstEverCommit)
    * [type historicalEnqueuer struct](#historicalEnqueuer)
        * [func (h *historicalEnqueuer) Handler(ctx context.Context) error](#historicalEnqueuer.Handler)
        * [func (h *historicalEnqueuer) buildFrame(ctx context.Context,...](#historicalEnqueuer.buildFrame)
        * [func (h *historicalEnqueuer) buildFrames(ctx context.Context, uniqueSeries map[string]*schema.InsightSeries, sortedSeriesIDs []string) error](#historicalEnqueuer.buildFrames)
        * [func (h *historicalEnqueuer) buildSeries(ctx context.Context, bctx *buildSeriesContext) (hardErr, softErr error)](#historicalEnqueuer.buildSeries)
    * [type testParams struct](#testParams)
    * [type testResults struct](#testResults)
        * [func testHistoricalEnqueuer(t *testing.T, p *testParams) *testResults](#testHistoricalEnqueuer)
* [Functions](#func)
    * [func StartBackgroundJobs(ctx context.Context, mainAppDB *sql.DB)](#StartBackgroundJobs)
    * [func Test_discoverAndEnqueueInsights(t *testing.T)](#Test_discoverAndEnqueueInsights)
    * [func Test_historicalEnqueuer(t *testing.T)](#Test_historicalEnqueuer)
    * [func discoverAndEnqueueInsights(ctx context.Context,...](#discoverAndEnqueueInsights)
    * [func getRateLimit(defaultValue rate.Limit) func() rate.Limit](#getRateLimit)
    * [func newInsightEnqueuer(ctx context.Context, workerBaseStore *basestore.Store, settingStore discovery.SettingStore, observationContext *observation.Context) goroutine.BackgroundRoutine](#newInsightEnqueuer)
    * [func newInsightHistoricalEnqueuer(ctx context.Context, workerBaseStore *basestore.Store, settingStore discovery.SettingStore, insightsStore *store.Store, observationContext *observation.Context) goroutine.BackgroundRoutine](#newInsightHistoricalEnqueuer)
    * [func newWorkerMetrics(observationContext *observation.Context, workerName string) (workerutil.WorkerMetrics, dbworker.ResetterMetrics)](#newWorkerMetrics)
    * [func withCountUnlimited(s string) string](#withCountUnlimited)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="queryJobOffsetTime" href="#queryJobOffsetTime">const queryJobOffsetTime</a>

```
searchKey: background.queryJobOffsetTime
tags: [constant number private]
```

```Go
const queryJobOffsetTime = 30 * time.Second
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="testRealGlobalSettings" href="#testRealGlobalSettings">var testRealGlobalSettings</a>

```
searchKey: background.testRealGlobalSettings
tags: [variable struct private]
```

```Go
var testRealGlobalSettings = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="MockRepoStore" href="#MockRepoStore">type MockRepoStore struct</a>

```
searchKey: background.MockRepoStore
tags: [struct]
```

```Go
type MockRepoStore struct {
	// GetByNameFunc is an instance of a mock function object controlling
	// the behavior of the method GetByName.
	GetByNameFunc *RepoStoreGetByNameFunc
}
```

MockRepoStore is a mock implementation of the RepoStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/insights/background) used for unit testing. 

#### <a id="NewMockRepoStore" href="#NewMockRepoStore">func NewMockRepoStore() *MockRepoStore</a>

```
searchKey: background.NewMockRepoStore
tags: [function]
```

```Go
func NewMockRepoStore() *MockRepoStore
```

NewMockRepoStore creates a new mock of the RepoStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockRepoStoreFrom" href="#NewMockRepoStoreFrom">func NewMockRepoStoreFrom(i RepoStore) *MockRepoStore</a>

```
searchKey: background.NewMockRepoStoreFrom
tags: [method]
```

```Go
func NewMockRepoStoreFrom(i RepoStore) *MockRepoStore
```

NewMockRepoStoreFrom creates a new mock of the MockRepoStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockRepoStore.GetByName" href="#MockRepoStore.GetByName">func (m *MockRepoStore) GetByName(v0 context.Context, v1 api.RepoName) (*types.Repo, error)</a>

```
searchKey: background.MockRepoStore.GetByName
tags: [method]
```

```Go
func (m *MockRepoStore) GetByName(v0 context.Context, v1 api.RepoName) (*types.Repo, error)
```

GetByName delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="RepoStore" href="#RepoStore">type RepoStore interface</a>

```
searchKey: background.RepoStore
tags: [interface]
```

```Go
type RepoStore interface {
	GetByName(ctx context.Context, name api.RepoName) (*types.Repo, error)
}
```

RepoStore is a subset of the API exposed by the database.Repos() store (only the subset used by historicalEnqueuer.) 

### <a id="RepoStoreGetByNameFunc" href="#RepoStoreGetByNameFunc">type RepoStoreGetByNameFunc struct</a>

```
searchKey: background.RepoStoreGetByNameFunc
tags: [struct]
```

```Go
type RepoStoreGetByNameFunc struct {
	defaultHook func(context.Context, api.RepoName) (*types.Repo, error)
	hooks       []func(context.Context, api.RepoName) (*types.Repo, error)
	history     []RepoStoreGetByNameFuncCall
	mutex       sync.Mutex
}
```

RepoStoreGetByNameFunc describes the behavior when the GetByName method of the parent MockRepoStore instance is invoked. 

#### <a id="RepoStoreGetByNameFunc.History" href="#RepoStoreGetByNameFunc.History">func (f *RepoStoreGetByNameFunc) History() []RepoStoreGetByNameFuncCall</a>

```
searchKey: background.RepoStoreGetByNameFunc.History
tags: [function]
```

```Go
func (f *RepoStoreGetByNameFunc) History() []RepoStoreGetByNameFuncCall
```

History returns a sequence of RepoStoreGetByNameFuncCall objects describing the invocations of this function. 

#### <a id="RepoStoreGetByNameFunc.PushHook" href="#RepoStoreGetByNameFunc.PushHook">func (f *RepoStoreGetByNameFunc) PushHook(hook func(context.Context, api.RepoName) (*types.Repo, error))</a>

```
searchKey: background.RepoStoreGetByNameFunc.PushHook
tags: [method]
```

```Go
func (f *RepoStoreGetByNameFunc) PushHook(hook func(context.Context, api.RepoName) (*types.Repo, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetByName method of the parent MockRepoStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="RepoStoreGetByNameFunc.PushReturn" href="#RepoStoreGetByNameFunc.PushReturn">func (f *RepoStoreGetByNameFunc) PushReturn(r0 *types.Repo, r1 error)</a>

```
searchKey: background.RepoStoreGetByNameFunc.PushReturn
tags: [method]
```

```Go
func (f *RepoStoreGetByNameFunc) PushReturn(r0 *types.Repo, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="RepoStoreGetByNameFunc.SetDefaultHook" href="#RepoStoreGetByNameFunc.SetDefaultHook">func (f *RepoStoreGetByNameFunc) SetDefaultHook(hook func(context.Context, api.RepoName) (*types.Repo, error))</a>

```
searchKey: background.RepoStoreGetByNameFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *RepoStoreGetByNameFunc) SetDefaultHook(hook func(context.Context, api.RepoName) (*types.Repo, error))
```

SetDefaultHook sets function that is called when the GetByName method of the parent MockRepoStore instance is invoked and the hook queue is empty. 

#### <a id="RepoStoreGetByNameFunc.SetDefaultReturn" href="#RepoStoreGetByNameFunc.SetDefaultReturn">func (f *RepoStoreGetByNameFunc) SetDefaultReturn(r0 *types.Repo, r1 error)</a>

```
searchKey: background.RepoStoreGetByNameFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *RepoStoreGetByNameFunc) SetDefaultReturn(r0 *types.Repo, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="RepoStoreGetByNameFunc.appendCall" href="#RepoStoreGetByNameFunc.appendCall">func (f *RepoStoreGetByNameFunc) appendCall(r0 RepoStoreGetByNameFuncCall)</a>

```
searchKey: background.RepoStoreGetByNameFunc.appendCall
tags: [method private]
```

```Go
func (f *RepoStoreGetByNameFunc) appendCall(r0 RepoStoreGetByNameFuncCall)
```

#### <a id="RepoStoreGetByNameFunc.nextHook" href="#RepoStoreGetByNameFunc.nextHook">func (f *RepoStoreGetByNameFunc) nextHook() func(context.Context, api.RepoName) (*types.Repo, error)</a>

```
searchKey: background.RepoStoreGetByNameFunc.nextHook
tags: [function private]
```

```Go
func (f *RepoStoreGetByNameFunc) nextHook() func(context.Context, api.RepoName) (*types.Repo, error)
```

### <a id="RepoStoreGetByNameFuncCall" href="#RepoStoreGetByNameFuncCall">type RepoStoreGetByNameFuncCall struct</a>

```
searchKey: background.RepoStoreGetByNameFuncCall
tags: [struct]
```

```Go
type RepoStoreGetByNameFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 api.RepoName
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *types.Repo
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

RepoStoreGetByNameFuncCall is an object that describes an invocation of method GetByName on an instance of MockRepoStore. 

#### <a id="RepoStoreGetByNameFuncCall.Args" href="#RepoStoreGetByNameFuncCall.Args">func (c RepoStoreGetByNameFuncCall) Args() []interface{}</a>

```
searchKey: background.RepoStoreGetByNameFuncCall.Args
tags: [function]
```

```Go
func (c RepoStoreGetByNameFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="RepoStoreGetByNameFuncCall.Results" href="#RepoStoreGetByNameFuncCall.Results">func (c RepoStoreGetByNameFuncCall) Results() []interface{}</a>

```
searchKey: background.RepoStoreGetByNameFuncCall.Results
tags: [function]
```

```Go
func (c RepoStoreGetByNameFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="buildSeriesContext" href="#buildSeriesContext">type buildSeriesContext struct</a>

```
searchKey: background.buildSeriesContext
tags: [struct private]
```

```Go
type buildSeriesContext struct {
	// The timeframe we're building historical data for.
	from, to time.Time

	// The repository we're building historical data for.
	repo *types.Repo

	// The first commit made in the repository on the default branch.
	firstHEADCommit *git.Commit

	// The series we're building historical data for.
	seriesID string
	series   *schema.InsightSeries
}
```

buildSeriesContext describes context/parameters for a call to buildSeries() 

### <a id="cachedGitFirstEverCommit" href="#cachedGitFirstEverCommit">type cachedGitFirstEverCommit struct</a>

```
searchKey: background.cachedGitFirstEverCommit
tags: [struct private]
```

```Go
type cachedGitFirstEverCommit struct {
	impl func(ctx context.Context, repoName api.RepoName) (*git.Commit, error)

	mu    sync.Mutex
	cache map[api.RepoName]*git.Commit
}
```

cachedGitFirstEverCommit is a simple in-memory cache for gitFirstEverCommit calls. It does so using a map, and entries are never evicted because they are expected to be small and in general unchanging. 

#### <a id="cachedGitFirstEverCommit.gitFirstEverCommit" href="#cachedGitFirstEverCommit.gitFirstEverCommit">func (c *cachedGitFirstEverCommit) gitFirstEverCommit(ctx context.Context, repoName api.RepoName) (*git.Commit, error)</a>

```
searchKey: background.cachedGitFirstEverCommit.gitFirstEverCommit
tags: [method private]
```

```Go
func (c *cachedGitFirstEverCommit) gitFirstEverCommit(ctx context.Context, repoName api.RepoName) (*git.Commit, error)
```

### <a id="historicalEnqueuer" href="#historicalEnqueuer">type historicalEnqueuer struct</a>

```
searchKey: background.historicalEnqueuer
tags: [struct private]
```

```Go
type historicalEnqueuer struct {
	// Required fields used for mocking in tests.
	now                   func() time.Time
	settingStore          discovery.SettingStore
	insightsStore         store.Interface
	repoStore             RepoStore
	enqueueQueryRunnerJob func(ctx context.Context, job *queryrunner.Job) error
	gitFirstEverCommit    func(ctx context.Context, repoName api.RepoName) (*git.Commit, error)
	gitFindNearestCommit  func(ctx context.Context, repoName api.RepoName, revSpec string, target time.Time) (*git.Commit, error)

	// framesToBackfill describes the number of historical timeframes to backfill data for.
	framesToBackfill func() int

	// frameLength describes the length of each timeframe to backfill data for.
	frameLength func() time.Duration

	// The iterator to use for walking over all repositories on Sourcegraph.
	allReposIterator func(ctx context.Context, each func(repoName string) error) error
	limiter          *rate.Limiter
}
```

historicalEnqueuer effectively enqueues jobs that generate historical data for insights. Right now, it only supports search insights. It does this by adjusting the user's search query to be for a specific repo and commit like `repo:<repo>@<commit>`, where `<repo>` is every repository on Sourcegraph (one search per) and `<commit>` is a Git commit closest in time to the historical point in time we're trying to generate data for. A lot of effort is placed into doing the work slowly, linearly, and consistently over time without harming any other part of Sourcegraph (including the search API, by performing searches slowly and on single repositories at a time only.) 

It works roughly like this: 

* For every timeframe we want to backfill (e.g. 1 point every week for the past 52 weeks): 

```
* For every repository on Sourcegraph (a subset on Sourcegraph.com):
  * Consider yielding/sleeping.
  * Find the oldest commit in the repository.
    * For every unique search insight series (i.e. search query):
      * Consider yielding/sleeping.
      * If the series has data for this timeframe+repo already, nothing to do.
      * If the timeframe we're generating data for is before the oldest commit in the repo, record a zero value.
      * Else, locate the commit nearest to the point in time we're trying to get data for and
        enqueue a queryrunner job to search that repository commit - recording historical data
        for it.

```
As you can no doubt see, there is much complexity and potential room for duplicative API calls here (e.g. "for every timeframe we list every repository"). For this exact reason, we do two things: 

1. Cache duplicative calls to prevent performing heavy operations multiple times. 2. Lift heavy operations to the layer/loop one level higher, when it is sane to do so. 3. Ensure we perform work slowly, linearly, and with yielding/sleeping between any substantial 

```
work being performed.

```
#### <a id="historicalEnqueuer.Handler" href="#historicalEnqueuer.Handler">func (h *historicalEnqueuer) Handler(ctx context.Context) error</a>

```
searchKey: background.historicalEnqueuer.Handler
tags: [method private]
```

```Go
func (h *historicalEnqueuer) Handler(ctx context.Context) error
```

#### <a id="historicalEnqueuer.buildFrame" href="#historicalEnqueuer.buildFrame">func (h *historicalEnqueuer) buildFrame(ctx context.Context,...</a>

```
searchKey: background.historicalEnqueuer.buildFrame
tags: [method private]
```

```Go
func (h *historicalEnqueuer) buildFrame(
	ctx context.Context,
	uniqueSeries map[string]*schema.InsightSeries,
	sortedSeriesIDs []string,
	from time.Time,
	to time.Time,
) (hardErr, softErr error)
```

buildFrame is invoked to build historical data for a specific past timeframe that we care about backfilling data for. 

It is expected to backfill data for all unique series that are missing data, across all repos (using h.allReposIterator.) 

It may return both hard errors (e.g. DB connection failure, future frames are unlikely to build) and soft errors (e.g. user made a mistake or we did partial work, future frames will likely succeed.) 

#### <a id="historicalEnqueuer.buildFrames" href="#historicalEnqueuer.buildFrames">func (h *historicalEnqueuer) buildFrames(ctx context.Context, uniqueSeries map[string]*schema.InsightSeries, sortedSeriesIDs []string) error</a>

```
searchKey: background.historicalEnqueuer.buildFrames
tags: [method private]
```

```Go
func (h *historicalEnqueuer) buildFrames(ctx context.Context, uniqueSeries map[string]*schema.InsightSeries, sortedSeriesIDs []string) error
```

buildFrames is invoked to build historical data for all past timeframes that we care about backfilling data for. This is done in small chunks, e.g. 52 frames to backfill with each frame being 7 days long, specifically so that we perform work incrementally. 

It is only called if there is at least one insights series defined. 

It will return instantly if there are no unique series. 

#### <a id="historicalEnqueuer.buildSeries" href="#historicalEnqueuer.buildSeries">func (h *historicalEnqueuer) buildSeries(ctx context.Context, bctx *buildSeriesContext) (hardErr, softErr error)</a>

```
searchKey: background.historicalEnqueuer.buildSeries
tags: [method private]
```

```Go
func (h *historicalEnqueuer) buildSeries(ctx context.Context, bctx *buildSeriesContext) (hardErr, softErr error)
```

buildSeries is invoked to build historical data for every unique timeframe * repo * series that could need backfilling. Note that this means that for a single search insight, this means this function may be called e.g. (52 timeframes) * (500000 repos) * (1 series) times. 

It may return both hard errors (e.g. DB connection failure, future series are unlikely to build) and soft errors (e.g. user's search query is invalid, future series are likely to build.) 

### <a id="testParams" href="#testParams">type testParams struct</a>

```
searchKey: background.testParams
tags: [struct private]
```

```Go
type testParams struct {
	settings              *api.Settings
	numRepos              int
	frames                int
	recordSleepOperations bool
	haveData              bool
}
```

### <a id="testResults" href="#testResults">type testResults struct</a>

```
searchKey: background.testResults
tags: [struct private]
```

```Go
type testResults struct {
	allReposIteratorCalls int
	sleeps                int
	totalSleepTimeMS      int
	reposGetByName        int
	operations            []string
}
```

#### <a id="testHistoricalEnqueuer" href="#testHistoricalEnqueuer">func testHistoricalEnqueuer(t *testing.T, p *testParams) *testResults</a>

```
searchKey: background.testHistoricalEnqueuer
tags: [method private]
```

```Go
func testHistoricalEnqueuer(t *testing.T, p *testParams) *testResults
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="StartBackgroundJobs" href="#StartBackgroundJobs">func StartBackgroundJobs(ctx context.Context, mainAppDB *sql.DB)</a>

```
searchKey: background.StartBackgroundJobs
tags: [method]
```

```Go
func StartBackgroundJobs(ctx context.Context, mainAppDB *sql.DB)
```

StartBackgroundJobs is the main entrypoint which starts background jobs for code insights. It is called from the repo-updater service, currently. 

### <a id="Test_discoverAndEnqueueInsights" href="#Test_discoverAndEnqueueInsights">func Test_discoverAndEnqueueInsights(t *testing.T)</a>

```
searchKey: background.Test_discoverAndEnqueueInsights
tags: [method private test]
```

```Go
func Test_discoverAndEnqueueInsights(t *testing.T)
```

Test_discoverAndEnqueueInsights tests that insight discovery and job enqueueing works and adheres to a few properties: 

1. Webhook insights are not enqueued (not yet supported.) 2. Duplicate insights are deduplicated / do not submit multiple jobs. 3. Jobs are scheduled not to all run at the same time. 

### <a id="Test_historicalEnqueuer" href="#Test_historicalEnqueuer">func Test_historicalEnqueuer(t *testing.T)</a>

```
searchKey: background.Test_historicalEnqueuer
tags: [method private test]
```

```Go
func Test_historicalEnqueuer(t *testing.T)
```

### <a id="discoverAndEnqueueInsights" href="#discoverAndEnqueueInsights">func discoverAndEnqueueInsights(ctx context.Context,...</a>

```
searchKey: background.discoverAndEnqueueInsights
tags: [method private]
```

```Go
func discoverAndEnqueueInsights(
	ctx context.Context,
	now func() time.Time,
	settingStore discovery.SettingStore,
	enqueueQueryRunnerJob func(ctx context.Context, job *queryrunner.Job) error,
) error
```

discoverAndEnqueueInsights discovers insights defined in the given setting store from user/org/global settings and enqueues them to be executed and have insights recorded. 

### <a id="getRateLimit" href="#getRateLimit">func getRateLimit(defaultValue rate.Limit) func() rate.Limit</a>

```
searchKey: background.getRateLimit
tags: [method private]
```

```Go
func getRateLimit(defaultValue rate.Limit) func() rate.Limit
```

### <a id="newInsightEnqueuer" href="#newInsightEnqueuer">func newInsightEnqueuer(ctx context.Context, workerBaseStore *basestore.Store, settingStore discovery.SettingStore, observationContext *observation.Context) goroutine.BackgroundRoutine</a>

```
searchKey: background.newInsightEnqueuer
tags: [method private]
```

```Go
func newInsightEnqueuer(ctx context.Context, workerBaseStore *basestore.Store, settingStore discovery.SettingStore, observationContext *observation.Context) goroutine.BackgroundRoutine
```

newInsightEnqueuer returns a background goroutine which will periodically find all of the search and webhook insights across all user settings, and enqueue work for the query runner and webhook runner workers to perform. 

### <a id="newInsightHistoricalEnqueuer" href="#newInsightHistoricalEnqueuer">func newInsightHistoricalEnqueuer(ctx context.Context, workerBaseStore *basestore.Store, settingStore discovery.SettingStore, insightsStore *store.Store, observationContext *observation.Context) goroutine.BackgroundRoutine</a>

```
searchKey: background.newInsightHistoricalEnqueuer
tags: [method private]
```

```Go
func newInsightHistoricalEnqueuer(ctx context.Context, workerBaseStore *basestore.Store, settingStore discovery.SettingStore, insightsStore *store.Store, observationContext *observation.Context) goroutine.BackgroundRoutine
```

newInsightHistoricalEnqueuer returns a background goroutine which will periodically find all of the search insights across all user settings, and determine for which dates they do not have data and attempt to backfill them by enqueueing work for executing searches with `before:` and `after:` filter ranges. 

### <a id="newWorkerMetrics" href="#newWorkerMetrics">func newWorkerMetrics(observationContext *observation.Context, workerName string) (workerutil.WorkerMetrics, dbworker.ResetterMetrics)</a>

```
searchKey: background.newWorkerMetrics
tags: [method private]
```

```Go
func newWorkerMetrics(observationContext *observation.Context, workerName string) (workerutil.WorkerMetrics, dbworker.ResetterMetrics)
```

newWorkerMetrics returns a basic set of metrics to be used for a worker and its resetter: 

* WorkerMetrics records worker operations & number of jobs. * ResetterMetrics records the number of jobs that got reset because workers timed out / took too 

```
long.

```
Individual insights workers may then _also_ want to register their own metrics, if desired, in their NewWorker functions. 

### <a id="withCountUnlimited" href="#withCountUnlimited">func withCountUnlimited(s string) string</a>

```
searchKey: background.withCountUnlimited
tags: [method private]
```

```Go
func withCountUnlimited(s string) string
```

withCountUnlimited adds `count:9999999` to the given search query string iff `count:` does not exist in the query string. This is extremely important as otherwise the number of results our search query would return would be incomplete and fluctuate. 

TODO(slimsag): future: we should pull in the search query parser to avoid cases where `count:` is actually e.g. a search query like `content:"count:"`. 

