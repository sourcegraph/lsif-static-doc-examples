# Package resolvers

## Index

* [Variables](#var)
    * [var testRealGlobalSettings](#testRealGlobalSettings)
* [Types](#type)
    * [type insightConnectionResolver struct](#insightConnectionResolver)
        * [func (r *insightConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.InsightResolver, error)](#insightConnectionResolver.Nodes)
        * [func (r *insightConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#insightConnectionResolver.TotalCount)
        * [func (r *insightConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#insightConnectionResolver.PageInfo)
        * [func (r *insightConnectionResolver) compute(ctx context.Context) ([]*schema.Insight, int64, error)](#insightConnectionResolver.compute)
    * [type insightResolver struct](#insightResolver)
        * [func (r *insightResolver) Title() string](#insightResolver.Title)
        * [func (r *insightResolver) Description() string](#insightResolver.Description)
        * [func (r *insightResolver) Series() []graphqlbackend.InsightSeriesResolver](#insightResolver.Series)
    * [type insightSeriesResolver struct](#insightSeriesResolver)
        * [func (r *insightSeriesResolver) Label() string](#insightSeriesResolver.Label)
        * [func (r *insightSeriesResolver) Points(ctx context.Context, args *graphqlbackend.InsightsPointsArgs) ([]graphqlbackend.InsightsDataPointResolver, error)](#insightSeriesResolver.Points)
        * [func (r *insightSeriesResolver) Status(ctx context.Context) (graphqlbackend.InsightStatusResolver, error)](#insightSeriesResolver.Status)
    * [type insightsDataPointResolver struct](#insightsDataPointResolver)
        * [func (i insightsDataPointResolver) DateTime() graphqlbackend.DateTime](#insightsDataPointResolver.DateTime)
        * [func (i insightsDataPointResolver) Value() float64](#insightsDataPointResolver.Value)
    * [type insightStatusResolver struct](#insightStatusResolver)
        * [func (i insightStatusResolver) TotalPoints() int32](#insightStatusResolver.TotalPoints)
        * [func (i insightStatusResolver) PendingJobs() int32](#insightStatusResolver.PendingJobs)
        * [func (i insightStatusResolver) CompletedJobs() int32](#insightStatusResolver.CompletedJobs)
        * [func (i insightStatusResolver) FailedJobs() int32](#insightStatusResolver.FailedJobs)
    * [type Resolver struct](#Resolver)
        * [func newWithClock(timescale, postgres dbutil.DB, clock func() time.Time) *Resolver](#newWithClock)
        * [func (r *Resolver) Insights(ctx context.Context) (graphqlbackend.InsightConnectionResolver, error)](#Resolver.Insights)
    * [type disabledResolver struct](#disabledResolver)
        * [func (r *disabledResolver) Insights(ctx context.Context) (graphqlbackend.InsightConnectionResolver, error)](#disabledResolver.Insights)
* [Functions](#func)
    * [func New(timescale, postgres dbutil.DB) graphqlbackend.InsightsResolver](#New)
    * [func NewDisabledResolver(reason string) graphqlbackend.InsightsResolver](#NewDisabledResolver)
    * [func TestResolver_InsightConnection(t *testing.T)](#TestResolver_InsightConnection)
    * [func TestResolver_InsightSeries(t *testing.T)](#TestResolver_InsightSeries)
    * [func init()](#init)
    * [func TestResolver_Insights(t *testing.T)](#TestResolver_Insights)


## <a id="var" href="#var">Variables</a>

### <a id="testRealGlobalSettings" href="#testRealGlobalSettings">var testRealGlobalSettings</a>

```
searchKey: resolvers.testRealGlobalSettings
```

```Go
var testRealGlobalSettings = ...
```

## <a id="type" href="#type">Types</a>

### <a id="insightConnectionResolver" href="#insightConnectionResolver">type insightConnectionResolver struct</a>

```
searchKey: resolvers.insightConnectionResolver
```

```Go
type insightConnectionResolver struct {
	insightsStore   store.Interface
	workerBaseStore *basestore.Store
	settingStore    discovery.SettingStore

	// cache results because they are used by multiple fields
	once     sync.Once
	insights []*schema.Insight
	next     int64
	err      error
}
```

#### <a id="insightConnectionResolver.Nodes" href="#insightConnectionResolver.Nodes">func (r *insightConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.InsightResolver, error)</a>

```
searchKey: resolvers.insightConnectionResolver.Nodes
```

```Go
func (r *insightConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.InsightResolver, error)
```

#### <a id="insightConnectionResolver.TotalCount" href="#insightConnectionResolver.TotalCount">func (r *insightConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: resolvers.insightConnectionResolver.TotalCount
```

```Go
func (r *insightConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="insightConnectionResolver.PageInfo" href="#insightConnectionResolver.PageInfo">func (r *insightConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.insightConnectionResolver.PageInfo
```

```Go
func (r *insightConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="insightConnectionResolver.compute" href="#insightConnectionResolver.compute">func (r *insightConnectionResolver) compute(ctx context.Context) ([]*schema.Insight, int64, error)</a>

```
searchKey: resolvers.insightConnectionResolver.compute
```

```Go
func (r *insightConnectionResolver) compute(ctx context.Context) ([]*schema.Insight, int64, error)
```

### <a id="insightResolver" href="#insightResolver">type insightResolver struct</a>

```
searchKey: resolvers.insightResolver
```

```Go
type insightResolver struct {
	insightsStore   store.Interface
	workerBaseStore *basestore.Store
	insight         *schema.Insight
}
```

#### <a id="insightResolver.Title" href="#insightResolver.Title">func (r *insightResolver) Title() string</a>

```
searchKey: resolvers.insightResolver.Title
```

```Go
func (r *insightResolver) Title() string
```

#### <a id="insightResolver.Description" href="#insightResolver.Description">func (r *insightResolver) Description() string</a>

```
searchKey: resolvers.insightResolver.Description
```

```Go
func (r *insightResolver) Description() string
```

#### <a id="insightResolver.Series" href="#insightResolver.Series">func (r *insightResolver) Series() []graphqlbackend.InsightSeriesResolver</a>

```
searchKey: resolvers.insightResolver.Series
```

```Go
func (r *insightResolver) Series() []graphqlbackend.InsightSeriesResolver
```

### <a id="insightSeriesResolver" href="#insightSeriesResolver">type insightSeriesResolver struct</a>

```
searchKey: resolvers.insightSeriesResolver
```

```Go
type insightSeriesResolver struct {
	insightsStore   store.Interface
	workerBaseStore *basestore.Store
	series          *schema.InsightSeries
}
```

#### <a id="insightSeriesResolver.Label" href="#insightSeriesResolver.Label">func (r *insightSeriesResolver) Label() string</a>

```
searchKey: resolvers.insightSeriesResolver.Label
```

```Go
func (r *insightSeriesResolver) Label() string
```

#### <a id="insightSeriesResolver.Points" href="#insightSeriesResolver.Points">func (r *insightSeriesResolver) Points(ctx context.Context, args *graphqlbackend.InsightsPointsArgs) ([]graphqlbackend.InsightsDataPointResolver, error)</a>

```
searchKey: resolvers.insightSeriesResolver.Points
```

```Go
func (r *insightSeriesResolver) Points(ctx context.Context, args *graphqlbackend.InsightsPointsArgs) ([]graphqlbackend.InsightsDataPointResolver, error)
```

#### <a id="insightSeriesResolver.Status" href="#insightSeriesResolver.Status">func (r *insightSeriesResolver) Status(ctx context.Context) (graphqlbackend.InsightStatusResolver, error)</a>

```
searchKey: resolvers.insightSeriesResolver.Status
```

```Go
func (r *insightSeriesResolver) Status(ctx context.Context) (graphqlbackend.InsightStatusResolver, error)
```

### <a id="insightsDataPointResolver" href="#insightsDataPointResolver">type insightsDataPointResolver struct</a>

```
searchKey: resolvers.insightsDataPointResolver
```

```Go
type insightsDataPointResolver struct{ p store.SeriesPoint }
```

#### <a id="insightsDataPointResolver.DateTime" href="#insightsDataPointResolver.DateTime">func (i insightsDataPointResolver) DateTime() graphqlbackend.DateTime</a>

```
searchKey: resolvers.insightsDataPointResolver.DateTime
```

```Go
func (i insightsDataPointResolver) DateTime() graphqlbackend.DateTime
```

#### <a id="insightsDataPointResolver.Value" href="#insightsDataPointResolver.Value">func (i insightsDataPointResolver) Value() float64</a>

```
searchKey: resolvers.insightsDataPointResolver.Value
```

```Go
func (i insightsDataPointResolver) Value() float64
```

### <a id="insightStatusResolver" href="#insightStatusResolver">type insightStatusResolver struct</a>

```
searchKey: resolvers.insightStatusResolver
```

```Go
type insightStatusResolver struct {
	totalPoints, pendingJobs, completedJobs, failedJobs int32
}
```

#### <a id="insightStatusResolver.TotalPoints" href="#insightStatusResolver.TotalPoints">func (i insightStatusResolver) TotalPoints() int32</a>

```
searchKey: resolvers.insightStatusResolver.TotalPoints
```

```Go
func (i insightStatusResolver) TotalPoints() int32
```

#### <a id="insightStatusResolver.PendingJobs" href="#insightStatusResolver.PendingJobs">func (i insightStatusResolver) PendingJobs() int32</a>

```
searchKey: resolvers.insightStatusResolver.PendingJobs
```

```Go
func (i insightStatusResolver) PendingJobs() int32
```

#### <a id="insightStatusResolver.CompletedJobs" href="#insightStatusResolver.CompletedJobs">func (i insightStatusResolver) CompletedJobs() int32</a>

```
searchKey: resolvers.insightStatusResolver.CompletedJobs
```

```Go
func (i insightStatusResolver) CompletedJobs() int32
```

#### <a id="insightStatusResolver.FailedJobs" href="#insightStatusResolver.FailedJobs">func (i insightStatusResolver) FailedJobs() int32</a>

```
searchKey: resolvers.insightStatusResolver.FailedJobs
```

```Go
func (i insightStatusResolver) FailedJobs() int32
```

### <a id="Resolver" href="#Resolver">type Resolver struct</a>

```
searchKey: resolvers.Resolver
tags: [exported]
```

```Go
type Resolver struct {
	insightsStore   store.Interface
	workerBaseStore *basestore.Store
	settingStore    *database.SettingStore
}
```

Resolver is the GraphQL resolver of all things related to Insights. 

#### <a id="newWithClock" href="#newWithClock">func newWithClock(timescale, postgres dbutil.DB, clock func() time.Time) *Resolver</a>

```
searchKey: resolvers.newWithClock
```

```Go
func newWithClock(timescale, postgres dbutil.DB, clock func() time.Time) *Resolver
```

newWithClock returns a new Resolver whose store uses the given Timescale and Postgres DBs, and the given clock for timestamps. 

#### <a id="Resolver.Insights" href="#Resolver.Insights">func (r *Resolver) Insights(ctx context.Context) (graphqlbackend.InsightConnectionResolver, error)</a>

```
searchKey: resolvers.Resolver.Insights
tags: [exported]
```

```Go
func (r *Resolver) Insights(ctx context.Context) (graphqlbackend.InsightConnectionResolver, error)
```

### <a id="disabledResolver" href="#disabledResolver">type disabledResolver struct</a>

```
searchKey: resolvers.disabledResolver
```

```Go
type disabledResolver struct {
	reason string
}
```

#### <a id="disabledResolver.Insights" href="#disabledResolver.Insights">func (r *disabledResolver) Insights(ctx context.Context) (graphqlbackend.InsightConnectionResolver, error)</a>

```
searchKey: resolvers.disabledResolver.Insights
```

```Go
func (r *disabledResolver) Insights(ctx context.Context) (graphqlbackend.InsightConnectionResolver, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="New" href="#New">func New(timescale, postgres dbutil.DB) graphqlbackend.InsightsResolver</a>

```
searchKey: resolvers.New
tags: [exported]
```

```Go
func New(timescale, postgres dbutil.DB) graphqlbackend.InsightsResolver
```

New returns a new Resolver whose store uses the given Timescale and Postgres DBs. 

### <a id="NewDisabledResolver" href="#NewDisabledResolver">func NewDisabledResolver(reason string) graphqlbackend.InsightsResolver</a>

```
searchKey: resolvers.NewDisabledResolver
tags: [exported]
```

```Go
func NewDisabledResolver(reason string) graphqlbackend.InsightsResolver
```

### <a id="TestResolver_InsightConnection" href="#TestResolver_InsightConnection">func TestResolver_InsightConnection(t *testing.T)</a>

```
searchKey: resolvers.TestResolver_InsightConnection
```

```Go
func TestResolver_InsightConnection(t *testing.T)
```

TestResolver_InsightConnection tests that the InsightConnection GraphQL resolver works. 

### <a id="TestResolver_InsightSeries" href="#TestResolver_InsightSeries">func TestResolver_InsightSeries(t *testing.T)</a>

```
searchKey: resolvers.TestResolver_InsightSeries
```

```Go
func TestResolver_InsightSeries(t *testing.T)
```

TestResolver_InsightSeries tests that the InsightSeries GraphQL resolver works. 

### <a id="init" href="#init">func init()</a>

```
searchKey: resolvers.init
```

```Go
func init()
```

### <a id="TestResolver_Insights" href="#TestResolver_Insights">func TestResolver_Insights(t *testing.T)</a>

```
searchKey: resolvers.TestResolver_Insights
```

```Go
func TestResolver_Insights(t *testing.T)
```

TestResolver_Insights just checks that root resolver setup and getting an insights connection does not result in any errors. It is a pretty minimal test. 

