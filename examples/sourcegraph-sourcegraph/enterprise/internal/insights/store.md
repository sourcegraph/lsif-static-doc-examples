# Package store

## Index

* [Constants](#const)
    * [const countDataFmtstr](#countDataFmtstr)
    * [const recordSeriesPointFmtstr](#recordSeriesPointFmtstr)
    * [const upsertMetadataFmtStr](#upsertMetadataFmtStr)
    * [const upsertRepoNameFmtStr](#upsertRepoNameFmtStr)
* [Variables](#var)
    * [var seriesPointsQueryFmtstr](#seriesPointsQueryFmtstr)
* [Types](#type)
    * [type CountDataOpts struct](#CountDataOpts)
    * [type Interface interface](#Interface)
    * [type InterfaceCountDataFunc struct](#InterfaceCountDataFunc)
        * [func (f *InterfaceCountDataFunc) History() []InterfaceCountDataFuncCall](#InterfaceCountDataFunc.History)
        * [func (f *InterfaceCountDataFunc) PushHook(hook func(context.Context, CountDataOpts) (int, error))](#InterfaceCountDataFunc.PushHook)
        * [func (f *InterfaceCountDataFunc) PushReturn(r0 int, r1 error)](#InterfaceCountDataFunc.PushReturn)
        * [func (f *InterfaceCountDataFunc) SetDefaultHook(hook func(context.Context, CountDataOpts) (int, error))](#InterfaceCountDataFunc.SetDefaultHook)
        * [func (f *InterfaceCountDataFunc) SetDefaultReturn(r0 int, r1 error)](#InterfaceCountDataFunc.SetDefaultReturn)
        * [func (f *InterfaceCountDataFunc) appendCall(r0 InterfaceCountDataFuncCall)](#InterfaceCountDataFunc.appendCall)
        * [func (f *InterfaceCountDataFunc) nextHook() func(context.Context, CountDataOpts) (int, error)](#InterfaceCountDataFunc.nextHook)
    * [type InterfaceCountDataFuncCall struct](#InterfaceCountDataFuncCall)
        * [func (c InterfaceCountDataFuncCall) Args() []interface{}](#InterfaceCountDataFuncCall.Args)
        * [func (c InterfaceCountDataFuncCall) Results() []interface{}](#InterfaceCountDataFuncCall.Results)
    * [type InterfaceRecordSeriesPointFunc struct](#InterfaceRecordSeriesPointFunc)
        * [func (f *InterfaceRecordSeriesPointFunc) History() []InterfaceRecordSeriesPointFuncCall](#InterfaceRecordSeriesPointFunc.History)
        * [func (f *InterfaceRecordSeriesPointFunc) PushHook(hook func(context.Context, RecordSeriesPointArgs) error)](#InterfaceRecordSeriesPointFunc.PushHook)
        * [func (f *InterfaceRecordSeriesPointFunc) PushReturn(r0 error)](#InterfaceRecordSeriesPointFunc.PushReturn)
        * [func (f *InterfaceRecordSeriesPointFunc) SetDefaultHook(hook func(context.Context, RecordSeriesPointArgs) error)](#InterfaceRecordSeriesPointFunc.SetDefaultHook)
        * [func (f *InterfaceRecordSeriesPointFunc) SetDefaultReturn(r0 error)](#InterfaceRecordSeriesPointFunc.SetDefaultReturn)
        * [func (f *InterfaceRecordSeriesPointFunc) appendCall(r0 InterfaceRecordSeriesPointFuncCall)](#InterfaceRecordSeriesPointFunc.appendCall)
        * [func (f *InterfaceRecordSeriesPointFunc) nextHook() func(context.Context, RecordSeriesPointArgs) error](#InterfaceRecordSeriesPointFunc.nextHook)
    * [type InterfaceRecordSeriesPointFuncCall struct](#InterfaceRecordSeriesPointFuncCall)
        * [func (c InterfaceRecordSeriesPointFuncCall) Args() []interface{}](#InterfaceRecordSeriesPointFuncCall.Args)
        * [func (c InterfaceRecordSeriesPointFuncCall) Results() []interface{}](#InterfaceRecordSeriesPointFuncCall.Results)
    * [type InterfaceSeriesPointsFunc struct](#InterfaceSeriesPointsFunc)
        * [func (f *InterfaceSeriesPointsFunc) History() []InterfaceSeriesPointsFuncCall](#InterfaceSeriesPointsFunc.History)
        * [func (f *InterfaceSeriesPointsFunc) PushHook(hook func(context.Context, SeriesPointsOpts) ([]SeriesPoint, error))](#InterfaceSeriesPointsFunc.PushHook)
        * [func (f *InterfaceSeriesPointsFunc) PushReturn(r0 []SeriesPoint, r1 error)](#InterfaceSeriesPointsFunc.PushReturn)
        * [func (f *InterfaceSeriesPointsFunc) SetDefaultHook(hook func(context.Context, SeriesPointsOpts) ([]SeriesPoint, error))](#InterfaceSeriesPointsFunc.SetDefaultHook)
        * [func (f *InterfaceSeriesPointsFunc) SetDefaultReturn(r0 []SeriesPoint, r1 error)](#InterfaceSeriesPointsFunc.SetDefaultReturn)
        * [func (f *InterfaceSeriesPointsFunc) appendCall(r0 InterfaceSeriesPointsFuncCall)](#InterfaceSeriesPointsFunc.appendCall)
        * [func (f *InterfaceSeriesPointsFunc) nextHook() func(context.Context, SeriesPointsOpts) ([]SeriesPoint, error)](#InterfaceSeriesPointsFunc.nextHook)
    * [type InterfaceSeriesPointsFuncCall struct](#InterfaceSeriesPointsFuncCall)
        * [func (c InterfaceSeriesPointsFuncCall) Args() []interface{}](#InterfaceSeriesPointsFuncCall.Args)
        * [func (c InterfaceSeriesPointsFuncCall) Results() []interface{}](#InterfaceSeriesPointsFuncCall.Results)
    * [type MockInterface struct](#MockInterface)
        * [func NewMockInterface() *MockInterface](#NewMockInterface)
        * [func NewMockInterfaceFrom(i Interface) *MockInterface](#NewMockInterfaceFrom)
        * [func (m *MockInterface) CountData(v0 context.Context, v1 CountDataOpts) (int, error)](#MockInterface.CountData)
        * [func (m *MockInterface) RecordSeriesPoint(v0 context.Context, v1 RecordSeriesPointArgs) error](#MockInterface.RecordSeriesPoint)
        * [func (m *MockInterface) SeriesPoints(v0 context.Context, v1 SeriesPointsOpts) ([]SeriesPoint, error)](#MockInterface.SeriesPoints)
    * [type RecordSeriesPointArgs struct](#RecordSeriesPointArgs)
    * [type SeriesPoint struct](#SeriesPoint)
        * [func (s *SeriesPoint) String() string](#SeriesPoint.String)
    * [type SeriesPointsOpts struct](#SeriesPointsOpts)
    * [type Store struct](#Store)
        * [func New(db dbutil.DB) *Store](#New)
        * [func NewWithClock(db dbutil.DB, clock func() time.Time) *Store](#NewWithClock)
        * [func (s *Store) CountData(ctx context.Context, opts CountDataOpts) (int, error)](#Store.CountData)
        * [func (s *Store) Handle() *basestore.TransactableHandle](#Store.Handle)
        * [func (s *Store) RecordSeriesPoint(ctx context.Context, v RecordSeriesPointArgs) (err error)](#Store.RecordSeriesPoint)
        * [func (s *Store) SeriesPoints(ctx context.Context, opts SeriesPointsOpts) ([]SeriesPoint, error)](#Store.SeriesPoints)
        * [func (s *Store) With(other basestore.ShareableStore) *Store](#Store.With)
        * [func (s *Store) query(ctx context.Context, q *sqlf.Query, sc scanFunc) error](#Store.query)
    * [type scanFunc func(github.com/sourcegraph/sourcegraph/enterprise/internal/insights/store.scanner) (err error)](#scanFunc)
    * [type scanner interface](#scanner)
* [Functions](#func)
    * [func TestCountData(t *testing.T)](#TestCountData)
    * [func TestRecordSeriesPoints(t *testing.T)](#TestRecordSeriesPoints)
    * [func TestSeriesPoints(t *testing.T)](#TestSeriesPoints)
    * [func countDataQuery(opts CountDataOpts) *sqlf.Query](#countDataQuery)
    * [func scanAll(rows *sql.Rows, scan scanFunc) (err error)](#scanAll)
    * [func seriesPointsQuery(opts SeriesPointsOpts) *sqlf.Query](#seriesPointsQuery)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="countDataFmtstr" href="#countDataFmtstr">const countDataFmtstr</a>

```
searchKey: store.countDataFmtstr
tags: [constant string private]
```

```Go
const countDataFmtstr = `
SELECT COUNT(*) FROM series_points WHERE %s
`
```

### <a id="recordSeriesPointFmtstr" href="#recordSeriesPointFmtstr">const recordSeriesPointFmtstr</a>

```
searchKey: store.recordSeriesPointFmtstr
tags: [constant string private]
```

```Go
const recordSeriesPointFmtstr = ...
```

### <a id="upsertMetadataFmtStr" href="#upsertMetadataFmtStr">const upsertMetadataFmtStr</a>

```
searchKey: store.upsertMetadataFmtStr
tags: [constant string private]
```

```Go
const upsertMetadataFmtStr = ...
```

### <a id="upsertRepoNameFmtStr" href="#upsertRepoNameFmtStr">const upsertRepoNameFmtStr</a>

```
searchKey: store.upsertRepoNameFmtStr
tags: [constant string private]
```

```Go
const upsertRepoNameFmtStr = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="seriesPointsQueryFmtstr" href="#seriesPointsQueryFmtstr">var seriesPointsQueryFmtstr</a>

```
searchKey: store.seriesPointsQueryFmtstr
tags: [variable string private]
```

```Go
var seriesPointsQueryFmtstr = ...
```

Note that the series_points table may contain duplicate points, or points recorded at irregular intervals. In specific: 

1. It may have multiple points recorded at the same exact point in time, e.g. with different 

```
repo_id (datapoint recorded per repository), or only a single point recorded (datapoint
recorded globally.)

```
2. Rarely, it may contain duplicate data points. For example, when repo-updater is started the 

```
initial jobs for recording insights will be enqueued, and then e.g. 12h later. If repo-updater
gets restarted multiple times, there may be many multiple nearly identical data points recorded
in a short period of time instead of at the 12h interval.

```
3. Data backfilling may not operate at the same interval, or same # of points per interval, and 

```
thus the interval between data points may be irregular.

```
4. Searches may not complete at the same exact time, so even in a perfect world if the interval 

```
should be 12h it may be off by a minute or so.

```
Additionally, it is important to note that there may be data points associated with a repo OR not associated with a repo at all (global.) 

Because we want 1 point per N interval, and do not want to display duplicate points in the UI, we use a time_bucket() with an MAX() aggregation. This gives us one data point for some time interval, even if multiple were recorded in that timeframe. 

One goal of this query is to get e.g. the total number of search results (value) across all repos (or some subset selected by the WHERE clause.) In this case, you can imagine each repo having its results recorded at the 12h interval. There may be duplicate points. The subquery uses a time_bucket() and MAX() aggregation to get the "# of search results per unique repository", eliminating duplicate data points, and the top-level SUM() adds those together to get "# of search results across all repositories." 

Another goal of this query is to get e.g. "total # of services (value) deployed at our company", in which case `repo_id` and other repo fields will be NULL. The inner query still eliminates potential duplicate data points and the outer query in this case just SUMs one data point (as we don't have points per repository.) 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="CountDataOpts" href="#CountDataOpts">type CountDataOpts struct</a>

```
searchKey: store.CountDataOpts
tags: [struct]
```

```Go
type CountDataOpts struct {
	// The time range to look for data, if non-nil.
	From, To *time.Time

	// SeriesID, if non-nil, indicates to look for data with this series ID only.
	SeriesID *string

	// RepoID, if non-nil, indicates to look for data with this repo ID only.
	RepoID *api.RepoID
}
```

### <a id="Interface" href="#Interface">type Interface interface</a>

```
searchKey: store.Interface
tags: [interface]
```

```Go
type Interface interface {
	SeriesPoints(ctx context.Context, opts SeriesPointsOpts) ([]SeriesPoint, error)
	RecordSeriesPoint(ctx context.Context, v RecordSeriesPointArgs) error
	CountData(ctx context.Context, opts CountDataOpts) (int, error)
}
```

Interface is the interface describing a code insights store. See the Store struct for actual API usage. 

### <a id="InterfaceCountDataFunc" href="#InterfaceCountDataFunc">type InterfaceCountDataFunc struct</a>

```
searchKey: store.InterfaceCountDataFunc
tags: [struct]
```

```Go
type InterfaceCountDataFunc struct {
	defaultHook func(context.Context, CountDataOpts) (int, error)
	hooks       []func(context.Context, CountDataOpts) (int, error)
	history     []InterfaceCountDataFuncCall
	mutex       sync.Mutex
}
```

InterfaceCountDataFunc describes the behavior when the CountData method of the parent MockInterface instance is invoked. 

#### <a id="InterfaceCountDataFunc.History" href="#InterfaceCountDataFunc.History">func (f *InterfaceCountDataFunc) History() []InterfaceCountDataFuncCall</a>

```
searchKey: store.InterfaceCountDataFunc.History
tags: [method]
```

```Go
func (f *InterfaceCountDataFunc) History() []InterfaceCountDataFuncCall
```

History returns a sequence of InterfaceCountDataFuncCall objects describing the invocations of this function. 

#### <a id="InterfaceCountDataFunc.PushHook" href="#InterfaceCountDataFunc.PushHook">func (f *InterfaceCountDataFunc) PushHook(hook func(context.Context, CountDataOpts) (int, error))</a>

```
searchKey: store.InterfaceCountDataFunc.PushHook
tags: [method]
```

```Go
func (f *InterfaceCountDataFunc) PushHook(hook func(context.Context, CountDataOpts) (int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the CountData method of the parent MockInterface instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="InterfaceCountDataFunc.PushReturn" href="#InterfaceCountDataFunc.PushReturn">func (f *InterfaceCountDataFunc) PushReturn(r0 int, r1 error)</a>

```
searchKey: store.InterfaceCountDataFunc.PushReturn
tags: [method]
```

```Go
func (f *InterfaceCountDataFunc) PushReturn(r0 int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="InterfaceCountDataFunc.SetDefaultHook" href="#InterfaceCountDataFunc.SetDefaultHook">func (f *InterfaceCountDataFunc) SetDefaultHook(hook func(context.Context, CountDataOpts) (int, error))</a>

```
searchKey: store.InterfaceCountDataFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *InterfaceCountDataFunc) SetDefaultHook(hook func(context.Context, CountDataOpts) (int, error))
```

SetDefaultHook sets function that is called when the CountData method of the parent MockInterface instance is invoked and the hook queue is empty. 

#### <a id="InterfaceCountDataFunc.SetDefaultReturn" href="#InterfaceCountDataFunc.SetDefaultReturn">func (f *InterfaceCountDataFunc) SetDefaultReturn(r0 int, r1 error)</a>

```
searchKey: store.InterfaceCountDataFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *InterfaceCountDataFunc) SetDefaultReturn(r0 int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="InterfaceCountDataFunc.appendCall" href="#InterfaceCountDataFunc.appendCall">func (f *InterfaceCountDataFunc) appendCall(r0 InterfaceCountDataFuncCall)</a>

```
searchKey: store.InterfaceCountDataFunc.appendCall
tags: [method private]
```

```Go
func (f *InterfaceCountDataFunc) appendCall(r0 InterfaceCountDataFuncCall)
```

#### <a id="InterfaceCountDataFunc.nextHook" href="#InterfaceCountDataFunc.nextHook">func (f *InterfaceCountDataFunc) nextHook() func(context.Context, CountDataOpts) (int, error)</a>

```
searchKey: store.InterfaceCountDataFunc.nextHook
tags: [method private]
```

```Go
func (f *InterfaceCountDataFunc) nextHook() func(context.Context, CountDataOpts) (int, error)
```

### <a id="InterfaceCountDataFuncCall" href="#InterfaceCountDataFuncCall">type InterfaceCountDataFuncCall struct</a>

```
searchKey: store.InterfaceCountDataFuncCall
tags: [struct]
```

```Go
type InterfaceCountDataFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 CountDataOpts
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

InterfaceCountDataFuncCall is an object that describes an invocation of method CountData on an instance of MockInterface. 

#### <a id="InterfaceCountDataFuncCall.Args" href="#InterfaceCountDataFuncCall.Args">func (c InterfaceCountDataFuncCall) Args() []interface{}</a>

```
searchKey: store.InterfaceCountDataFuncCall.Args
tags: [method]
```

```Go
func (c InterfaceCountDataFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="InterfaceCountDataFuncCall.Results" href="#InterfaceCountDataFuncCall.Results">func (c InterfaceCountDataFuncCall) Results() []interface{}</a>

```
searchKey: store.InterfaceCountDataFuncCall.Results
tags: [method]
```

```Go
func (c InterfaceCountDataFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="InterfaceRecordSeriesPointFunc" href="#InterfaceRecordSeriesPointFunc">type InterfaceRecordSeriesPointFunc struct</a>

```
searchKey: store.InterfaceRecordSeriesPointFunc
tags: [struct]
```

```Go
type InterfaceRecordSeriesPointFunc struct {
	defaultHook func(context.Context, RecordSeriesPointArgs) error
	hooks       []func(context.Context, RecordSeriesPointArgs) error
	history     []InterfaceRecordSeriesPointFuncCall
	mutex       sync.Mutex
}
```

InterfaceRecordSeriesPointFunc describes the behavior when the RecordSeriesPoint method of the parent MockInterface instance is invoked. 

#### <a id="InterfaceRecordSeriesPointFunc.History" href="#InterfaceRecordSeriesPointFunc.History">func (f *InterfaceRecordSeriesPointFunc) History() []InterfaceRecordSeriesPointFuncCall</a>

```
searchKey: store.InterfaceRecordSeriesPointFunc.History
tags: [method]
```

```Go
func (f *InterfaceRecordSeriesPointFunc) History() []InterfaceRecordSeriesPointFuncCall
```

History returns a sequence of InterfaceRecordSeriesPointFuncCall objects describing the invocations of this function. 

#### <a id="InterfaceRecordSeriesPointFunc.PushHook" href="#InterfaceRecordSeriesPointFunc.PushHook">func (f *InterfaceRecordSeriesPointFunc) PushHook(hook func(context.Context, RecordSeriesPointArgs) error)</a>

```
searchKey: store.InterfaceRecordSeriesPointFunc.PushHook
tags: [method]
```

```Go
func (f *InterfaceRecordSeriesPointFunc) PushHook(hook func(context.Context, RecordSeriesPointArgs) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the RecordSeriesPoint method of the parent MockInterface instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="InterfaceRecordSeriesPointFunc.PushReturn" href="#InterfaceRecordSeriesPointFunc.PushReturn">func (f *InterfaceRecordSeriesPointFunc) PushReturn(r0 error)</a>

```
searchKey: store.InterfaceRecordSeriesPointFunc.PushReturn
tags: [method]
```

```Go
func (f *InterfaceRecordSeriesPointFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="InterfaceRecordSeriesPointFunc.SetDefaultHook" href="#InterfaceRecordSeriesPointFunc.SetDefaultHook">func (f *InterfaceRecordSeriesPointFunc) SetDefaultHook(hook func(context.Context, RecordSeriesPointArgs) error)</a>

```
searchKey: store.InterfaceRecordSeriesPointFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *InterfaceRecordSeriesPointFunc) SetDefaultHook(hook func(context.Context, RecordSeriesPointArgs) error)
```

SetDefaultHook sets function that is called when the RecordSeriesPoint method of the parent MockInterface instance is invoked and the hook queue is empty. 

#### <a id="InterfaceRecordSeriesPointFunc.SetDefaultReturn" href="#InterfaceRecordSeriesPointFunc.SetDefaultReturn">func (f *InterfaceRecordSeriesPointFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: store.InterfaceRecordSeriesPointFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *InterfaceRecordSeriesPointFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="InterfaceRecordSeriesPointFunc.appendCall" href="#InterfaceRecordSeriesPointFunc.appendCall">func (f *InterfaceRecordSeriesPointFunc) appendCall(r0 InterfaceRecordSeriesPointFuncCall)</a>

```
searchKey: store.InterfaceRecordSeriesPointFunc.appendCall
tags: [method private]
```

```Go
func (f *InterfaceRecordSeriesPointFunc) appendCall(r0 InterfaceRecordSeriesPointFuncCall)
```

#### <a id="InterfaceRecordSeriesPointFunc.nextHook" href="#InterfaceRecordSeriesPointFunc.nextHook">func (f *InterfaceRecordSeriesPointFunc) nextHook() func(context.Context, RecordSeriesPointArgs) error</a>

```
searchKey: store.InterfaceRecordSeriesPointFunc.nextHook
tags: [method private]
```

```Go
func (f *InterfaceRecordSeriesPointFunc) nextHook() func(context.Context, RecordSeriesPointArgs) error
```

### <a id="InterfaceRecordSeriesPointFuncCall" href="#InterfaceRecordSeriesPointFuncCall">type InterfaceRecordSeriesPointFuncCall struct</a>

```
searchKey: store.InterfaceRecordSeriesPointFuncCall
tags: [struct]
```

```Go
type InterfaceRecordSeriesPointFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 RecordSeriesPointArgs
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

InterfaceRecordSeriesPointFuncCall is an object that describes an invocation of method RecordSeriesPoint on an instance of MockInterface. 

#### <a id="InterfaceRecordSeriesPointFuncCall.Args" href="#InterfaceRecordSeriesPointFuncCall.Args">func (c InterfaceRecordSeriesPointFuncCall) Args() []interface{}</a>

```
searchKey: store.InterfaceRecordSeriesPointFuncCall.Args
tags: [method]
```

```Go
func (c InterfaceRecordSeriesPointFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="InterfaceRecordSeriesPointFuncCall.Results" href="#InterfaceRecordSeriesPointFuncCall.Results">func (c InterfaceRecordSeriesPointFuncCall) Results() []interface{}</a>

```
searchKey: store.InterfaceRecordSeriesPointFuncCall.Results
tags: [method]
```

```Go
func (c InterfaceRecordSeriesPointFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="InterfaceSeriesPointsFunc" href="#InterfaceSeriesPointsFunc">type InterfaceSeriesPointsFunc struct</a>

```
searchKey: store.InterfaceSeriesPointsFunc
tags: [struct]
```

```Go
type InterfaceSeriesPointsFunc struct {
	defaultHook func(context.Context, SeriesPointsOpts) ([]SeriesPoint, error)
	hooks       []func(context.Context, SeriesPointsOpts) ([]SeriesPoint, error)
	history     []InterfaceSeriesPointsFuncCall
	mutex       sync.Mutex
}
```

InterfaceSeriesPointsFunc describes the behavior when the SeriesPoints method of the parent MockInterface instance is invoked. 

#### <a id="InterfaceSeriesPointsFunc.History" href="#InterfaceSeriesPointsFunc.History">func (f *InterfaceSeriesPointsFunc) History() []InterfaceSeriesPointsFuncCall</a>

```
searchKey: store.InterfaceSeriesPointsFunc.History
tags: [method]
```

```Go
func (f *InterfaceSeriesPointsFunc) History() []InterfaceSeriesPointsFuncCall
```

History returns a sequence of InterfaceSeriesPointsFuncCall objects describing the invocations of this function. 

#### <a id="InterfaceSeriesPointsFunc.PushHook" href="#InterfaceSeriesPointsFunc.PushHook">func (f *InterfaceSeriesPointsFunc) PushHook(hook func(context.Context, SeriesPointsOpts) ([]SeriesPoint, error))</a>

```
searchKey: store.InterfaceSeriesPointsFunc.PushHook
tags: [method]
```

```Go
func (f *InterfaceSeriesPointsFunc) PushHook(hook func(context.Context, SeriesPointsOpts) ([]SeriesPoint, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the SeriesPoints method of the parent MockInterface instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="InterfaceSeriesPointsFunc.PushReturn" href="#InterfaceSeriesPointsFunc.PushReturn">func (f *InterfaceSeriesPointsFunc) PushReturn(r0 []SeriesPoint, r1 error)</a>

```
searchKey: store.InterfaceSeriesPointsFunc.PushReturn
tags: [method]
```

```Go
func (f *InterfaceSeriesPointsFunc) PushReturn(r0 []SeriesPoint, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="InterfaceSeriesPointsFunc.SetDefaultHook" href="#InterfaceSeriesPointsFunc.SetDefaultHook">func (f *InterfaceSeriesPointsFunc) SetDefaultHook(hook func(context.Context, SeriesPointsOpts) ([]SeriesPoint, error))</a>

```
searchKey: store.InterfaceSeriesPointsFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *InterfaceSeriesPointsFunc) SetDefaultHook(hook func(context.Context, SeriesPointsOpts) ([]SeriesPoint, error))
```

SetDefaultHook sets function that is called when the SeriesPoints method of the parent MockInterface instance is invoked and the hook queue is empty. 

#### <a id="InterfaceSeriesPointsFunc.SetDefaultReturn" href="#InterfaceSeriesPointsFunc.SetDefaultReturn">func (f *InterfaceSeriesPointsFunc) SetDefaultReturn(r0 []SeriesPoint, r1 error)</a>

```
searchKey: store.InterfaceSeriesPointsFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *InterfaceSeriesPointsFunc) SetDefaultReturn(r0 []SeriesPoint, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="InterfaceSeriesPointsFunc.appendCall" href="#InterfaceSeriesPointsFunc.appendCall">func (f *InterfaceSeriesPointsFunc) appendCall(r0 InterfaceSeriesPointsFuncCall)</a>

```
searchKey: store.InterfaceSeriesPointsFunc.appendCall
tags: [method private]
```

```Go
func (f *InterfaceSeriesPointsFunc) appendCall(r0 InterfaceSeriesPointsFuncCall)
```

#### <a id="InterfaceSeriesPointsFunc.nextHook" href="#InterfaceSeriesPointsFunc.nextHook">func (f *InterfaceSeriesPointsFunc) nextHook() func(context.Context, SeriesPointsOpts) ([]SeriesPoint, error)</a>

```
searchKey: store.InterfaceSeriesPointsFunc.nextHook
tags: [method private]
```

```Go
func (f *InterfaceSeriesPointsFunc) nextHook() func(context.Context, SeriesPointsOpts) ([]SeriesPoint, error)
```

### <a id="InterfaceSeriesPointsFuncCall" href="#InterfaceSeriesPointsFuncCall">type InterfaceSeriesPointsFuncCall struct</a>

```
searchKey: store.InterfaceSeriesPointsFuncCall
tags: [struct]
```

```Go
type InterfaceSeriesPointsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 SeriesPointsOpts
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []SeriesPoint
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

InterfaceSeriesPointsFuncCall is an object that describes an invocation of method SeriesPoints on an instance of MockInterface. 

#### <a id="InterfaceSeriesPointsFuncCall.Args" href="#InterfaceSeriesPointsFuncCall.Args">func (c InterfaceSeriesPointsFuncCall) Args() []interface{}</a>

```
searchKey: store.InterfaceSeriesPointsFuncCall.Args
tags: [method]
```

```Go
func (c InterfaceSeriesPointsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="InterfaceSeriesPointsFuncCall.Results" href="#InterfaceSeriesPointsFuncCall.Results">func (c InterfaceSeriesPointsFuncCall) Results() []interface{}</a>

```
searchKey: store.InterfaceSeriesPointsFuncCall.Results
tags: [method]
```

```Go
func (c InterfaceSeriesPointsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockInterface" href="#MockInterface">type MockInterface struct</a>

```
searchKey: store.MockInterface
tags: [struct]
```

```Go
type MockInterface struct {
	// CountDataFunc is an instance of a mock function object controlling
	// the behavior of the method CountData.
	CountDataFunc *InterfaceCountDataFunc
	// RecordSeriesPointFunc is an instance of a mock function object
	// controlling the behavior of the method RecordSeriesPoint.
	RecordSeriesPointFunc *InterfaceRecordSeriesPointFunc
	// SeriesPointsFunc is an instance of a mock function object controlling
	// the behavior of the method SeriesPoints.
	SeriesPointsFunc *InterfaceSeriesPointsFunc
}
```

MockInterface is a mock implementation of the Interface interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/insights/store) used for unit testing. 

#### <a id="NewMockInterface" href="#NewMockInterface">func NewMockInterface() *MockInterface</a>

```
searchKey: store.NewMockInterface
tags: [function]
```

```Go
func NewMockInterface() *MockInterface
```

NewMockInterface creates a new mock of the Interface interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockInterfaceFrom" href="#NewMockInterfaceFrom">func NewMockInterfaceFrom(i Interface) *MockInterface</a>

```
searchKey: store.NewMockInterfaceFrom
tags: [function]
```

```Go
func NewMockInterfaceFrom(i Interface) *MockInterface
```

NewMockInterfaceFrom creates a new mock of the MockInterface interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockInterface.CountData" href="#MockInterface.CountData">func (m *MockInterface) CountData(v0 context.Context, v1 CountDataOpts) (int, error)</a>

```
searchKey: store.MockInterface.CountData
tags: [method]
```

```Go
func (m *MockInterface) CountData(v0 context.Context, v1 CountDataOpts) (int, error)
```

CountData delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockInterface.RecordSeriesPoint" href="#MockInterface.RecordSeriesPoint">func (m *MockInterface) RecordSeriesPoint(v0 context.Context, v1 RecordSeriesPointArgs) error</a>

```
searchKey: store.MockInterface.RecordSeriesPoint
tags: [method]
```

```Go
func (m *MockInterface) RecordSeriesPoint(v0 context.Context, v1 RecordSeriesPointArgs) error
```

RecordSeriesPoint delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockInterface.SeriesPoints" href="#MockInterface.SeriesPoints">func (m *MockInterface) SeriesPoints(v0 context.Context, v1 SeriesPointsOpts) ([]SeriesPoint, error)</a>

```
searchKey: store.MockInterface.SeriesPoints
tags: [method]
```

```Go
func (m *MockInterface) SeriesPoints(v0 context.Context, v1 SeriesPointsOpts) ([]SeriesPoint, error)
```

SeriesPoints delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="RecordSeriesPointArgs" href="#RecordSeriesPointArgs">type RecordSeriesPointArgs struct</a>

```
searchKey: store.RecordSeriesPointArgs
tags: [struct]
```

```Go
type RecordSeriesPointArgs struct {
	// SeriesID is the unique series ID to query. It should describe the series of data uniquely,
	// but is not a DB table primary key ID.
	SeriesID string

	// Point is the actual data point recorded and at what time.
	Point SeriesPoint

	// Repository name and DB ID to associate with this data point, if any.
	//
	// Both must be specified if one is specified.
	RepoName *string
	RepoID   *api.RepoID

	// Metadata contains arbitrary JSON metadata to associate with the data point, if any.
	//
	// See the DB schema comments for intended use cases. This should generally be small,
	// low-cardinality data to avoid inflating the table.
	Metadata interface{}
}
```

RecordSeriesPointArgs describes arguments for the RecordSeriesPoint method. 

### <a id="SeriesPoint" href="#SeriesPoint">type SeriesPoint struct</a>

```
searchKey: store.SeriesPoint
tags: [struct]
```

```Go
type SeriesPoint struct {
	// Time (always UTC).
	Time     time.Time
	Value    float64
	Metadata []byte
}
```

SeriesPoint describes a single insights' series data point. 

Some fields that could be queried (series ID, repo ID/names) are omitted as they are primarily only useful for filtering the data you get back, and would inflate the data size considerably otherwise. 

#### <a id="SeriesPoint.String" href="#SeriesPoint.String">func (s *SeriesPoint) String() string</a>

```
searchKey: store.SeriesPoint.String
tags: [method]
```

```Go
func (s *SeriesPoint) String() string
```

### <a id="SeriesPointsOpts" href="#SeriesPointsOpts">type SeriesPointsOpts struct</a>

```
searchKey: store.SeriesPointsOpts
tags: [struct]
```

```Go
type SeriesPointsOpts struct {
	// SeriesID is the unique series ID to query, if non-nil.
	SeriesID *string

	// RepoID, if non-nil, indicates to filter results to only points recorded with this repo ID.
	RepoID *api.RepoID

	// Time ranges to query from/to, if non-nil, in UTC.
	From, To *time.Time

	// Limit is the number of data points to query, if non-zero.
	Limit int
}
```

SeriesPointsOpts describes options for querying insights' series data points. 

### <a id="Store" href="#Store">type Store struct</a>

```
searchKey: store.Store
tags: [struct]
```

```Go
type Store struct {
	*basestore.Store
	now func() time.Time
}
```

Store exposes methods to read and write code insights domain models from persistent storage. 

#### <a id="New" href="#New">func New(db dbutil.DB) *Store</a>

```
searchKey: store.New
tags: [function]
```

```Go
func New(db dbutil.DB) *Store
```

New returns a new Store backed by the given Timescale db. 

#### <a id="NewWithClock" href="#NewWithClock">func NewWithClock(db dbutil.DB, clock func() time.Time) *Store</a>

```
searchKey: store.NewWithClock
tags: [function]
```

```Go
func NewWithClock(db dbutil.DB, clock func() time.Time) *Store
```

NewWithClock returns a new Store backed by the given db and clock for timestamps. 

#### <a id="Store.CountData" href="#Store.CountData">func (s *Store) CountData(ctx context.Context, opts CountDataOpts) (int, error)</a>

```
searchKey: store.Store.CountData
tags: [method]
```

```Go
func (s *Store) CountData(ctx context.Context, opts CountDataOpts) (int, error)
```

CountData counts the amount of data points in a given time range. 

#### <a id="Store.Handle" href="#Store.Handle">func (s *Store) Handle() *basestore.TransactableHandle</a>

```
searchKey: store.Store.Handle
tags: [method]
```

```Go
func (s *Store) Handle() *basestore.TransactableHandle
```

Handle returns the underlying transactable database handle. Needed to implement the ShareableStore interface. 

#### <a id="Store.RecordSeriesPoint" href="#Store.RecordSeriesPoint">func (s *Store) RecordSeriesPoint(ctx context.Context, v RecordSeriesPointArgs) (err error)</a>

```
searchKey: store.Store.RecordSeriesPoint
tags: [method]
```

```Go
func (s *Store) RecordSeriesPoint(ctx context.Context, v RecordSeriesPointArgs) (err error)
```

RecordSeriesPoint records a data point for the specfied series ID (which is a unique ID for the series, not a DB table primary key ID). 

#### <a id="Store.SeriesPoints" href="#Store.SeriesPoints">func (s *Store) SeriesPoints(ctx context.Context, opts SeriesPointsOpts) ([]SeriesPoint, error)</a>

```
searchKey: store.Store.SeriesPoints
tags: [method]
```

```Go
func (s *Store) SeriesPoints(ctx context.Context, opts SeriesPointsOpts) ([]SeriesPoint, error)
```

SeriesPoints queries data points over time for a specific insights' series. 

#### <a id="Store.With" href="#Store.With">func (s *Store) With(other basestore.ShareableStore) *Store</a>

```
searchKey: store.Store.With
tags: [method]
```

```Go
func (s *Store) With(other basestore.ShareableStore) *Store
```

With creates a new Store with the given basestore.Shareable store as the underlying basestore.Store. Needed to implement the basestore.Store interface 

#### <a id="Store.query" href="#Store.query">func (s *Store) query(ctx context.Context, q *sqlf.Query, sc scanFunc) error</a>

```
searchKey: store.Store.query
tags: [method private]
```

```Go
func (s *Store) query(ctx context.Context, q *sqlf.Query, sc scanFunc) error
```

### <a id="scanFunc" href="#scanFunc">type scanFunc func(github.com/sourcegraph/sourcegraph/enterprise/internal/insights/store.scanner) (err error)</a>

```
searchKey: store.scanFunc
tags: [function private]
```

```Go
type scanFunc func(scanner) (err error)
```

a scanFunc scans one or more rows from a scanner, returning the last id column scanned and the count of scanned rows. 

### <a id="scanner" href="#scanner">type scanner interface</a>

```
searchKey: store.scanner
tags: [interface private]
```

```Go
type scanner interface {
	Scan(dst ...interface{}) error
}
```

scanner captures the Scan method of sql.Rows and sql.Row 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestCountData" href="#TestCountData">func TestCountData(t *testing.T)</a>

```
searchKey: store.TestCountData
tags: [function private test]
```

```Go
func TestCountData(t *testing.T)
```

### <a id="TestRecordSeriesPoints" href="#TestRecordSeriesPoints">func TestRecordSeriesPoints(t *testing.T)</a>

```
searchKey: store.TestRecordSeriesPoints
tags: [function private test]
```

```Go
func TestRecordSeriesPoints(t *testing.T)
```

### <a id="TestSeriesPoints" href="#TestSeriesPoints">func TestSeriesPoints(t *testing.T)</a>

```
searchKey: store.TestSeriesPoints
tags: [function private test]
```

```Go
func TestSeriesPoints(t *testing.T)
```

### <a id="countDataQuery" href="#countDataQuery">func countDataQuery(opts CountDataOpts) *sqlf.Query</a>

```
searchKey: store.countDataQuery
tags: [function private]
```

```Go
func countDataQuery(opts CountDataOpts) *sqlf.Query
```

### <a id="scanAll" href="#scanAll">func scanAll(rows *sql.Rows, scan scanFunc) (err error)</a>

```
searchKey: store.scanAll
tags: [function private]
```

```Go
func scanAll(rows *sql.Rows, scan scanFunc) (err error)
```

### <a id="seriesPointsQuery" href="#seriesPointsQuery">func seriesPointsQuery(opts SeriesPointsOpts) *sqlf.Query</a>

```
searchKey: store.seriesPointsQuery
tags: [function private]
```

```Go
func seriesPointsQuery(opts SeriesPointsOpts) *sqlf.Query
```

