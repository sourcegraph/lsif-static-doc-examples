# Package queryrunner

## Index

* [Constants](#const)
    * [const cleanJobsFmtStr](#cleanJobsFmtStr)
    * [const dequeueJobFmtStr](#dequeueJobFmtStr)
    * [const enqueueJobFmtStr](#enqueueJobFmtStr)
    * [const gqlSearchQuery](#gqlSearchQuery)
    * [const queryJobsStatusFmtStr](#queryJobsStatusFmtStr)
* [Variables](#var)
    * [var jobsColumns](#jobsColumns)
* [Types](#type)
    * [type Job struct](#Job)
        * [func dequeueJob(ctx context.Context, workerBaseStore *basestore.Store, recordID int) (*Job, error)](#dequeueJob)
        * [func (j *Job) RecordID() int](#Job.RecordID)
    * [type JobsStatus struct](#JobsStatus)
        * [func QueryJobsStatus(ctx context.Context, workerBaseStore *basestore.Store, seriesID string) (*JobsStatus, error)](#QueryJobsStatus)
    * [type commitSearchResult struct](#commitSearchResult)
        * [func (r *commitSearchResult) matchCount() int](#commitSearchResult.matchCount)
        * [func (r *commitSearchResult) repoID() string](#commitSearchResult.repoID)
    * [type fileMatch struct](#fileMatch)
        * [func (r *fileMatch) matchCount() int](#fileMatch.matchCount)
        * [func (r *fileMatch) repoID() string](#fileMatch.repoID)
    * [type gqlSearchResponse struct](#gqlSearchResponse)
        * [func search(ctx context.Context, query string) (*gqlSearchResponse, error)](#search)
    * [type gqlSearchVars struct](#gqlSearchVars)
    * [type graphQLQuery struct](#graphQLQuery)
    * [type repository struct](#repository)
        * [func (r *repository) matchCount() int](#repository.matchCount)
        * [func (r *repository) repoID() string](#repository.repoID)
    * [type result interface](#result)
        * [func decodeResult(result json.RawMessage) (result, error)](#decodeResult)
    * [type workHandler struct](#workHandler)
        * [func (r *workHandler) Handle(ctx context.Context, workerStore dbworkerstore.Store, record workerutil.Record) (err error)](#workHandler.Handle)
* [Functions](#func)
    * [func EnqueueJob(ctx context.Context, workerBaseStore *basestore.Store, job *Job) (id int, err error)](#EnqueueJob)
    * [func NewCleaner(ctx context.Context, workerBaseStore *basestore.Store, observationContext *observation.Context) goroutine.BackgroundRoutine](#NewCleaner)
    * [func NewResetter(ctx context.Context, workerBaseStore *basestore.Store, metrics dbworker.ResetterMetrics) *dbworker.Resetter](#NewResetter)
    * [func NewWorker(ctx context.Context, workerBaseStore *basestore.Store, insightsStore *store.Store, metrics workerutil.WorkerMetrics) *workerutil.Worker](#NewWorker)
    * [func TestJobQueue(t *testing.T)](#TestJobQueue)
    * [func cleanJobs(ctx context.Context, workerBaseStore *basestore.Store) (numCleaned int, err error)](#cleanJobs)
    * [func createDBWorkerStore(s *basestore.Store) dbworkerstore.Store](#createDBWorkerStore)
    * [func doScanJobs(rows *sql.Rows, err error) ([]*Job, error)](#doScanJobs)
    * [func getRateLimit(defaultValue rate.Limit) func() rate.Limit](#getRateLimit)
    * [func gqlURL(queryName string) (string, error)](#gqlURL)
    * [func init()](#init.worker_test.go)
    * [func scanJobs(rows *sql.Rows, err error) (workerutil.Record, bool, error)](#scanJobs)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="cleanJobsFmtStr" href="#cleanJobsFmtStr">const cleanJobsFmtStr</a>

```
searchKey: queryrunner.cleanJobsFmtStr
tags: [constant string private]
```

```Go
const cleanJobsFmtStr = ...
```

### <a id="dequeueJobFmtStr" href="#dequeueJobFmtStr">const dequeueJobFmtStr</a>

```
searchKey: queryrunner.dequeueJobFmtStr
tags: [constant string private]
```

```Go
const dequeueJobFmtStr = ...
```

### <a id="enqueueJobFmtStr" href="#enqueueJobFmtStr">const enqueueJobFmtStr</a>

```
searchKey: queryrunner.enqueueJobFmtStr
tags: [constant string private]
```

```Go
const enqueueJobFmtStr = ...
```

### <a id="gqlSearchQuery" href="#gqlSearchQuery">const gqlSearchQuery</a>

```
searchKey: queryrunner.gqlSearchQuery
tags: [constant string private]
```

```Go
const gqlSearchQuery = ...
```

### <a id="queryJobsStatusFmtStr" href="#queryJobsStatusFmtStr">const queryJobsStatusFmtStr</a>

```
searchKey: queryrunner.queryJobsStatusFmtStr
tags: [constant string private]
```

```Go
const queryJobsStatusFmtStr = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="jobsColumns" href="#jobsColumns">var jobsColumns</a>

```
searchKey: queryrunner.jobsColumns
tags: [variable array struct private]
```

```Go
var jobsColumns = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Job" href="#Job">type Job struct</a>

```
searchKey: queryrunner.Job
tags: [struct]
```

```Go
type Job struct {
	// Query runner fields.
	SeriesID    string
	SearchQuery string
	RecordTime  *time.Time // If non-nil, record results at this time instead of the time at which search results were found.

	// Standard/required dbworker fields. If enqueuing a job, these may all be zero values except State.
	//
	// See https://sourcegraph.com/github.com/sourcegraph/sourcegraph@cd0b3904c674ee3568eb2ef5d7953395b6432d20/-/blob/internal/workerutil/dbworker/store/store.go#L114-134
	ID             int
	State          string // If enqueing a job, set to "queued"
	FailureMessage *string
	StartedAt      *time.Time
	FinishedAt     *time.Time
	ProcessAfter   *time.Time
	NumResets      int32
	NumFailures    int32
	ExecutionLogs  []workerutil.ExecutionLogEntry
}
```

Job represents a single job for the query runner worker to perform. When enqueued, it is stored in the insights_query_runner_jobs table - then the worker dequeues it by reading it from that table. 

See internal/workerutil/dbworker for more information about dbworkers. 

#### <a id="dequeueJob" href="#dequeueJob">func dequeueJob(ctx context.Context, workerBaseStore *basestore.Store, recordID int) (*Job, error)</a>

```
searchKey: queryrunner.dequeueJob
tags: [method private]
```

```Go
func dequeueJob(ctx context.Context, workerBaseStore *basestore.Store, recordID int) (*Job, error)
```

#### <a id="Job.RecordID" href="#Job.RecordID">func (j *Job) RecordID() int</a>

```
searchKey: queryrunner.Job.RecordID
tags: [function]
```

```Go
func (j *Job) RecordID() int
```

Implements the internal/workerutil.Record interface, used by the work handler to locate the job once executing (see work_handler.go:Handle). 

### <a id="JobsStatus" href="#JobsStatus">type JobsStatus struct</a>

```
searchKey: queryrunner.JobsStatus
tags: [struct]
```

```Go
type JobsStatus struct {
	Queued, Processing uint64
	Completed          uint64
	Errored, Failed    uint64
}
```

#### <a id="QueryJobsStatus" href="#QueryJobsStatus">func QueryJobsStatus(ctx context.Context, workerBaseStore *basestore.Store, seriesID string) (*JobsStatus, error)</a>

```
searchKey: queryrunner.QueryJobsStatus
tags: [method]
```

```Go
func QueryJobsStatus(ctx context.Context, workerBaseStore *basestore.Store, seriesID string) (*JobsStatus, error)
```

QueryJobsStatus queries the current status of jobs for the specified series. 

### <a id="commitSearchResult" href="#commitSearchResult">type commitSearchResult struct</a>

```
searchKey: queryrunner.commitSearchResult
tags: [struct private]
```

```Go
type commitSearchResult struct {
	Matches struct {
		Highlights []struct {
			Line int
		}
	}
	Commit struct {
		Repository struct {
			ID string
		}
	}
}
```

#### <a id="commitSearchResult.matchCount" href="#commitSearchResult.matchCount">func (r *commitSearchResult) matchCount() int</a>

```
searchKey: queryrunner.commitSearchResult.matchCount
tags: [function private]
```

```Go
func (r *commitSearchResult) matchCount() int
```

#### <a id="commitSearchResult.repoID" href="#commitSearchResult.repoID">func (r *commitSearchResult) repoID() string</a>

```
searchKey: queryrunner.commitSearchResult.repoID
tags: [function private]
```

```Go
func (r *commitSearchResult) repoID() string
```

### <a id="fileMatch" href="#fileMatch">type fileMatch struct</a>

```
searchKey: queryrunner.fileMatch
tags: [struct private]
```

```Go
type fileMatch struct {
	Repository struct {
		ID string
	}
	LineMatches []struct {
		OffsetAndLengths [][]int
	}
	Symbols []struct {
		Name string
	}
}
```

#### <a id="fileMatch.matchCount" href="#fileMatch.matchCount">func (r *fileMatch) matchCount() int</a>

```
searchKey: queryrunner.fileMatch.matchCount
tags: [function private]
```

```Go
func (r *fileMatch) matchCount() int
```

#### <a id="fileMatch.repoID" href="#fileMatch.repoID">func (r *fileMatch) repoID() string</a>

```
searchKey: queryrunner.fileMatch.repoID
tags: [function private]
```

```Go
func (r *fileMatch) repoID() string
```

### <a id="gqlSearchResponse" href="#gqlSearchResponse">type gqlSearchResponse struct</a>

```
searchKey: queryrunner.gqlSearchResponse
tags: [struct private]
```

```Go
type gqlSearchResponse struct {
	Data struct {
		Search struct {
			Results struct {
				LimitHit   bool
				Cloning    []*api.Repo
				Missing    []*api.Repo
				Timedout   []*api.Repo
				MatchCount int
				Results    []json.RawMessage
				Alert      *struct {
					Title       string
					Description string
				}
			}
		}
	}
	Errors []interface{}
}
```

#### <a id="search" href="#search">func search(ctx context.Context, query string) (*gqlSearchResponse, error)</a>

```
searchKey: queryrunner.search
tags: [method private]
```

```Go
func search(ctx context.Context, query string) (*gqlSearchResponse, error)
```

search executes the given search query. 

### <a id="gqlSearchVars" href="#gqlSearchVars">type gqlSearchVars struct</a>

```
searchKey: queryrunner.gqlSearchVars
tags: [struct private]
```

```Go
type gqlSearchVars struct {
	Query string `json:"query"`
}
```

### <a id="graphQLQuery" href="#graphQLQuery">type graphQLQuery struct</a>

```
searchKey: queryrunner.graphQLQuery
tags: [struct private]
```

```Go
type graphQLQuery struct {
	Query     string      `json:"query"`
	Variables interface{} `json:"variables"`
}
```

graphQLQuery describes a general GraphQL query and its variables. 

### <a id="repository" href="#repository">type repository struct</a>

```
searchKey: queryrunner.repository
tags: [struct private]
```

```Go
type repository struct {
	ID string
}
```

#### <a id="repository.matchCount" href="#repository.matchCount">func (r *repository) matchCount() int</a>

```
searchKey: queryrunner.repository.matchCount
tags: [function private]
```

```Go
func (r *repository) matchCount() int
```

#### <a id="repository.repoID" href="#repository.repoID">func (r *repository) repoID() string</a>

```
searchKey: queryrunner.repository.repoID
tags: [function private]
```

```Go
func (r *repository) repoID() string
```

### <a id="result" href="#result">type result interface</a>

```
searchKey: queryrunner.result
tags: [interface private]
```

```Go
type result interface {
	repoID() string
	matchCount() int
}
```

#### <a id="decodeResult" href="#decodeResult">func decodeResult(result json.RawMessage) (result, error)</a>

```
searchKey: queryrunner.decodeResult
tags: [method private]
```

```Go
func decodeResult(result json.RawMessage) (result, error)
```

### <a id="workHandler" href="#workHandler">type workHandler struct</a>

```
searchKey: queryrunner.workHandler
tags: [struct private]
```

```Go
type workHandler struct {
	workerBaseStore *basestore.Store
	insightsStore   *store.Store
	limiter         *rate.Limiter
}
```

workHandler implements the dbworker.Handler interface by executing search queries and inserting insights about them to the insights Timescale database. 

#### <a id="workHandler.Handle" href="#workHandler.Handle">func (r *workHandler) Handle(ctx context.Context, workerStore dbworkerstore.Store, record workerutil.Record) (err error)</a>

```
searchKey: queryrunner.workHandler.Handle
tags: [method private]
```

```Go
func (r *workHandler) Handle(ctx context.Context, workerStore dbworkerstore.Store, record workerutil.Record) (err error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="EnqueueJob" href="#EnqueueJob">func EnqueueJob(ctx context.Context, workerBaseStore *basestore.Store, job *Job) (id int, err error)</a>

```
searchKey: queryrunner.EnqueueJob
tags: [method]
```

```Go
func EnqueueJob(ctx context.Context, workerBaseStore *basestore.Store, job *Job) (id int, err error)
```

EnqueueJob enqueues a job for the query runner worker to execute later. 

### <a id="NewCleaner" href="#NewCleaner">func NewCleaner(ctx context.Context, workerBaseStore *basestore.Store, observationContext *observation.Context) goroutine.BackgroundRoutine</a>

```
searchKey: queryrunner.NewCleaner
tags: [method]
```

```Go
func NewCleaner(ctx context.Context, workerBaseStore *basestore.Store, observationContext *observation.Context) goroutine.BackgroundRoutine
```

NewCleaner returns a background goroutine which will periodically find jobs left in the "completed" or "failed" state that are over 12 hours old and removes them. 

This is particularly important because the historical enqueuer can produce e.g. num_series*num_repos*num_timeframes jobs (example: 20*40,000*6 in an average case) which can quickly add up to be millions of jobs left in a "completed" state in the DB. 

### <a id="NewResetter" href="#NewResetter">func NewResetter(ctx context.Context, workerBaseStore *basestore.Store, metrics dbworker.ResetterMetrics) *dbworker.Resetter</a>

```
searchKey: queryrunner.NewResetter
tags: [method]
```

```Go
func NewResetter(ctx context.Context, workerBaseStore *basestore.Store, metrics dbworker.ResetterMetrics) *dbworker.Resetter
```

NewResetter returns a resetter that will reset pending query runner jobs if they take too long to complete. 

### <a id="NewWorker" href="#NewWorker">func NewWorker(ctx context.Context, workerBaseStore *basestore.Store, insightsStore *store.Store, metrics workerutil.WorkerMetrics) *workerutil.Worker</a>

```
searchKey: queryrunner.NewWorker
tags: [method]
```

```Go
func NewWorker(ctx context.Context, workerBaseStore *basestore.Store, insightsStore *store.Store, metrics workerutil.WorkerMetrics) *workerutil.Worker
```

NewWorker returns a worker that will execute search queries and insert information about the results into the code insights database. 

### <a id="TestJobQueue" href="#TestJobQueue">func TestJobQueue(t *testing.T)</a>

```
searchKey: queryrunner.TestJobQueue
tags: [method private test]
```

```Go
func TestJobQueue(t *testing.T)
```

TestJobQueue tests that EnqueueJob and dequeueJob work mutually to transfer jobs to/from the database. 

### <a id="cleanJobs" href="#cleanJobs">func cleanJobs(ctx context.Context, workerBaseStore *basestore.Store) (numCleaned int, err error)</a>

```
searchKey: queryrunner.cleanJobs
tags: [method private]
```

```Go
func cleanJobs(ctx context.Context, workerBaseStore *basestore.Store) (numCleaned int, err error)
```

cleanJobs 

### <a id="createDBWorkerStore" href="#createDBWorkerStore">func createDBWorkerStore(s *basestore.Store) dbworkerstore.Store</a>

```
searchKey: queryrunner.createDBWorkerStore
tags: [method private]
```

```Go
func createDBWorkerStore(s *basestore.Store) dbworkerstore.Store
```

createDBWorkerStore creates the dbworker store for the query runner worker. 

See internal/workerutil/dbworker for more information about dbworkers. 

### <a id="doScanJobs" href="#doScanJobs">func doScanJobs(rows *sql.Rows, err error) ([]*Job, error)</a>

```
searchKey: queryrunner.doScanJobs
tags: [method private]
```

```Go
func doScanJobs(rows *sql.Rows, err error) ([]*Job, error)
```

### <a id="getRateLimit" href="#getRateLimit">func getRateLimit(defaultValue rate.Limit) func() rate.Limit</a>

```
searchKey: queryrunner.getRateLimit
tags: [method private]
```

```Go
func getRateLimit(defaultValue rate.Limit) func() rate.Limit
```

### <a id="gqlURL" href="#gqlURL">func gqlURL(queryName string) (string, error)</a>

```
searchKey: queryrunner.gqlURL
tags: [method private]
```

```Go
func gqlURL(queryName string) (string, error)
```

gqlURL returns the frontend's internal GraphQL API URL, with the given ?queryName parameter which is used to keep track of the source and type of GraphQL queries. 

### <a id="init.worker_test.go" href="#init.worker_test.go">func init()</a>

```
searchKey: queryrunner.init
tags: [function private]
```

```Go
func init()
```

### <a id="scanJobs" href="#scanJobs">func scanJobs(rows *sql.Rows, err error) (workerutil.Record, bool, error)</a>

```
searchKey: queryrunner.scanJobs
tags: [method private]
```

```Go
func scanJobs(rows *sql.Rows, err error) (workerutil.Record, bool, error)
```

