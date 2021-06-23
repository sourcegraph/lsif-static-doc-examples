# Package background

## Index

* [Constants](#const)
    * [const gqlSearchQuery](#gqlSearchQuery)
    * [const eventRetentionInDays](#eventRetentionInDays)
* [Types](#type)
    * [type graphQLQuery struct](#graphQLQuery)
    * [type gqlSearchVars struct](#gqlSearchVars)
    * [type gqlSearchResponse struct](#gqlSearchResponse)
        * [func search(ctx context.Context, query string) (*gqlSearchResponse, error)](#search)
    * [type codeMonitorsMetrics struct](#codeMonitorsMetrics)
        * [func newMetricsForTriggerQueries() codeMonitorsMetrics](#newMetricsForTriggerQueries)
        * [func newActionMetrics() codeMonitorsMetrics](#newActionMetrics)
    * [type queryRunner struct](#queryRunner)
        * [func (r *queryRunner) Handle(ctx context.Context, workerStore dbworkerstore.Store, record workerutil.Record) (err error)](#queryRunner.Handle)
    * [type actionRunner struct](#actionRunner)
        * [func (r *actionRunner) Handle(ctx context.Context, workerStore dbworkerstore.Store, record workerutil.Record) (err error)](#actionRunner.Handle)
* [Functions](#func)
    * [func StartBackgroundJobs(ctx context.Context, db *sql.DB)](#StartBackgroundJobs)
    * [func gqlURL(queryName string) (string, error)](#gqlURL)
    * [func extractTime(result interface{}) (t *time.Time, err error)](#extractTime)
    * [func newTriggerQueryRunner(ctx context.Context, s *cm.Store, metrics codeMonitorsMetrics) *workerutil.Worker](#newTriggerQueryRunner)
    * [func newTriggerQueryEnqueuer(ctx context.Context, store *cm.Store) goroutine.BackgroundRoutine](#newTriggerQueryEnqueuer)
    * [func newTriggerQueryResetter(ctx context.Context, s *cm.Store, metrics codeMonitorsMetrics) *dbworker.Resetter](#newTriggerQueryResetter)
    * [func newTriggerJobsLogDeleter(ctx context.Context, store *cm.Store) goroutine.BackgroundRoutine](#newTriggerJobsLogDeleter)
    * [func newActionRunner(ctx context.Context, s *cm.Store, metrics codeMonitorsMetrics) *workerutil.Worker](#newActionRunner)
    * [func newActionJobResetter(ctx context.Context, s *cm.Store, metrics codeMonitorsMetrics) *dbworker.Resetter](#newActionJobResetter)
    * [func createDBWorkerStoreForTriggerJobs(s *cm.Store) dbworkerstore.Store](#createDBWorkerStoreForTriggerJobs)
    * [func createDBWorkerStoreForActionJobs(s *cm.Store) dbworkerstore.Store](#createDBWorkerStoreForActionJobs)
    * [func newQueryWithAfterFilter(q *cm.MonitorQuery) string](#newQueryWithAfterFilter)
    * [func latestResultTime(previousLastResult *time.Time, v *gqlSearchResponse, searchErr error) time.Time](#latestResultTime)
    * [func zeroOrVal(i *int) int](#zeroOrVal)
    * [func init()](#init.workers_test.go)
    * [func TestActionRunner(t *testing.T)](#TestActionRunner)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="gqlSearchQuery" href="#gqlSearchQuery">const gqlSearchQuery</a>

```
searchKey: background.gqlSearchQuery
tags: [private]
```

```Go
const gqlSearchQuery = ...
```

### <a id="eventRetentionInDays" href="#eventRetentionInDays">const eventRetentionInDays</a>

```
searchKey: background.eventRetentionInDays
tags: [private]
```

```Go
const eventRetentionInDays int = 7
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="graphQLQuery" href="#graphQLQuery">type graphQLQuery struct</a>

```
searchKey: background.graphQLQuery
tags: [private]
```

```Go
type graphQLQuery struct {
	Query     string      `json:"query"`
	Variables interface{} `json:"variables"`
}
```

### <a id="gqlSearchVars" href="#gqlSearchVars">type gqlSearchVars struct</a>

```
searchKey: background.gqlSearchVars
tags: [private]
```

```Go
type gqlSearchVars struct {
	Query string `json:"query"`
}
```

### <a id="gqlSearchResponse" href="#gqlSearchResponse">type gqlSearchResponse struct</a>

```
searchKey: background.gqlSearchResponse
tags: [private]
```

```Go
type gqlSearchResponse struct {
	Data struct {
		Search struct {
			Results struct {
				ApproximateResultCount string
				Cloning                []*api.Repo
				Timedout               []*api.Repo
				Results                []interface{}
			}
		}
	}
	Errors []interface{}
}
```

#### <a id="search" href="#search">func search(ctx context.Context, query string) (*gqlSearchResponse, error)</a>

```
searchKey: background.search
tags: [private]
```

```Go
func search(ctx context.Context, query string) (*gqlSearchResponse, error)
```

### <a id="codeMonitorsMetrics" href="#codeMonitorsMetrics">type codeMonitorsMetrics struct</a>

```
searchKey: background.codeMonitorsMetrics
tags: [private]
```

```Go
type codeMonitorsMetrics struct {
	workerMetrics workerutil.WorkerMetrics
	resets        prometheus.Counter
	resetFailures prometheus.Counter
	errors        prometheus.Counter
}
```

#### <a id="newMetricsForTriggerQueries" href="#newMetricsForTriggerQueries">func newMetricsForTriggerQueries() codeMonitorsMetrics</a>

```
searchKey: background.newMetricsForTriggerQueries
tags: [private]
```

```Go
func newMetricsForTriggerQueries() codeMonitorsMetrics
```

#### <a id="newActionMetrics" href="#newActionMetrics">func newActionMetrics() codeMonitorsMetrics</a>

```
searchKey: background.newActionMetrics
tags: [private]
```

```Go
func newActionMetrics() codeMonitorsMetrics
```

### <a id="queryRunner" href="#queryRunner">type queryRunner struct</a>

```
searchKey: background.queryRunner
tags: [private]
```

```Go
type queryRunner struct {
	*cm.Store
}
```

#### <a id="queryRunner.Handle" href="#queryRunner.Handle">func (r *queryRunner) Handle(ctx context.Context, workerStore dbworkerstore.Store, record workerutil.Record) (err error)</a>

```
searchKey: background.queryRunner.Handle
tags: [private]
```

```Go
func (r *queryRunner) Handle(ctx context.Context, workerStore dbworkerstore.Store, record workerutil.Record) (err error)
```

### <a id="actionRunner" href="#actionRunner">type actionRunner struct</a>

```
searchKey: background.actionRunner
tags: [private]
```

```Go
type actionRunner struct {
	*cm.Store
}
```

#### <a id="actionRunner.Handle" href="#actionRunner.Handle">func (r *actionRunner) Handle(ctx context.Context, workerStore dbworkerstore.Store, record workerutil.Record) (err error)</a>

```
searchKey: background.actionRunner.Handle
tags: [private]
```

```Go
func (r *actionRunner) Handle(ctx context.Context, workerStore dbworkerstore.Store, record workerutil.Record) (err error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="StartBackgroundJobs" href="#StartBackgroundJobs">func StartBackgroundJobs(ctx context.Context, db *sql.DB)</a>

```
searchKey: background.StartBackgroundJobs
```

```Go
func StartBackgroundJobs(ctx context.Context, db *sql.DB)
```

### <a id="gqlURL" href="#gqlURL">func gqlURL(queryName string) (string, error)</a>

```
searchKey: background.gqlURL
tags: [private]
```

```Go
func gqlURL(queryName string) (string, error)
```

### <a id="extractTime" href="#extractTime">func extractTime(result interface{}) (t *time.Time, err error)</a>

```
searchKey: background.extractTime
tags: [private]
```

```Go
func extractTime(result interface{}) (t *time.Time, err error)
```

extractTime extracts the time from the given search result. 

### <a id="newTriggerQueryRunner" href="#newTriggerQueryRunner">func newTriggerQueryRunner(ctx context.Context, s *cm.Store, metrics codeMonitorsMetrics) *workerutil.Worker</a>

```
searchKey: background.newTriggerQueryRunner
tags: [private]
```

```Go
func newTriggerQueryRunner(ctx context.Context, s *cm.Store, metrics codeMonitorsMetrics) *workerutil.Worker
```

### <a id="newTriggerQueryEnqueuer" href="#newTriggerQueryEnqueuer">func newTriggerQueryEnqueuer(ctx context.Context, store *cm.Store) goroutine.BackgroundRoutine</a>

```
searchKey: background.newTriggerQueryEnqueuer
tags: [private]
```

```Go
func newTriggerQueryEnqueuer(ctx context.Context, store *cm.Store) goroutine.BackgroundRoutine
```

### <a id="newTriggerQueryResetter" href="#newTriggerQueryResetter">func newTriggerQueryResetter(ctx context.Context, s *cm.Store, metrics codeMonitorsMetrics) *dbworker.Resetter</a>

```
searchKey: background.newTriggerQueryResetter
tags: [private]
```

```Go
func newTriggerQueryResetter(ctx context.Context, s *cm.Store, metrics codeMonitorsMetrics) *dbworker.Resetter
```

### <a id="newTriggerJobsLogDeleter" href="#newTriggerJobsLogDeleter">func newTriggerJobsLogDeleter(ctx context.Context, store *cm.Store) goroutine.BackgroundRoutine</a>

```
searchKey: background.newTriggerJobsLogDeleter
tags: [private]
```

```Go
func newTriggerJobsLogDeleter(ctx context.Context, store *cm.Store) goroutine.BackgroundRoutine
```

### <a id="newActionRunner" href="#newActionRunner">func newActionRunner(ctx context.Context, s *cm.Store, metrics codeMonitorsMetrics) *workerutil.Worker</a>

```
searchKey: background.newActionRunner
tags: [private]
```

```Go
func newActionRunner(ctx context.Context, s *cm.Store, metrics codeMonitorsMetrics) *workerutil.Worker
```

### <a id="newActionJobResetter" href="#newActionJobResetter">func newActionJobResetter(ctx context.Context, s *cm.Store, metrics codeMonitorsMetrics) *dbworker.Resetter</a>

```
searchKey: background.newActionJobResetter
tags: [private]
```

```Go
func newActionJobResetter(ctx context.Context, s *cm.Store, metrics codeMonitorsMetrics) *dbworker.Resetter
```

### <a id="createDBWorkerStoreForTriggerJobs" href="#createDBWorkerStoreForTriggerJobs">func createDBWorkerStoreForTriggerJobs(s *cm.Store) dbworkerstore.Store</a>

```
searchKey: background.createDBWorkerStoreForTriggerJobs
tags: [private]
```

```Go
func createDBWorkerStoreForTriggerJobs(s *cm.Store) dbworkerstore.Store
```

### <a id="createDBWorkerStoreForActionJobs" href="#createDBWorkerStoreForActionJobs">func createDBWorkerStoreForActionJobs(s *cm.Store) dbworkerstore.Store</a>

```
searchKey: background.createDBWorkerStoreForActionJobs
tags: [private]
```

```Go
func createDBWorkerStoreForActionJobs(s *cm.Store) dbworkerstore.Store
```

### <a id="newQueryWithAfterFilter" href="#newQueryWithAfterFilter">func newQueryWithAfterFilter(q *cm.MonitorQuery) string</a>

```
searchKey: background.newQueryWithAfterFilter
tags: [private]
```

```Go
func newQueryWithAfterFilter(q *cm.MonitorQuery) string
```

newQueryWithAfterFilter constructs a new query which finds search results introduced after the last time we queried. 

### <a id="latestResultTime" href="#latestResultTime">func latestResultTime(previousLastResult *time.Time, v *gqlSearchResponse, searchErr error) time.Time</a>

```
searchKey: background.latestResultTime
tags: [private]
```

```Go
func latestResultTime(previousLastResult *time.Time, v *gqlSearchResponse, searchErr error) time.Time
```

### <a id="zeroOrVal" href="#zeroOrVal">func zeroOrVal(i *int) int</a>

```
searchKey: background.zeroOrVal
tags: [private]
```

```Go
func zeroOrVal(i *int) int
```

### <a id="init.workers_test.go" href="#init.workers_test.go">func init()</a>

```
searchKey: background.init
tags: [private]
```

```Go
func init()
```

### <a id="TestActionRunner" href="#TestActionRunner">func TestActionRunner(t *testing.T)</a>

```
searchKey: background.TestActionRunner
tags: [private]
```

```Go
func TestActionRunner(t *testing.T)
```

