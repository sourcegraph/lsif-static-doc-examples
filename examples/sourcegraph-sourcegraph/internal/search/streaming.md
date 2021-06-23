# Package streaming

## Index

* Subpages
  * [internal/search/streaming/api](streaming/api.md)
  * [internal/search/streaming/http](streaming/http.md)
* [Variables](#var)
    * [var commonFileFilters](#commonFileFilters)
* [Types](#type)
    * [type Filter struct](#Filter)
        * [func (f *Filter) Less(o *Filter) bool](#Filter.Less)
    * [type Filters map[string]*streaming.Filter](#Filters)
        * [func (m Filters) Add(value string, label string, count int32, limitHit bool, kind string)](#Filters.Add)
        * [func (m Filters) MarkImportant(value string)](#Filters.MarkImportant)
        * [func (m Filters) Compute() []*Filter](#Filters.Compute)
    * [type filterSlice []*streaming.Filter](#filterSlice)
        * [func (fs filterSlice) Len() int](#filterSlice.Len)
        * [func (fs filterSlice) Less(i, j int) bool](#filterSlice.Less)
        * [func (fs filterSlice) Swap(i, j int)](#filterSlice.Swap)
    * [type filterHeap struct](#filterHeap)
        * [func (h *filterHeap) Add(f *Filter)](#filterHeap.Add)
        * [func (h *filterHeap) Less(i, j int) bool](#filterHeap.Less)
        * [func (h *filterHeap) Push(x interface{})](#filterHeap.Push)
        * [func (h *filterHeap) Pop() interface{}](#filterHeap.Pop)
    * [type Stats struct](#Stats)
        * [func CollectStream(search func(Sender) error) ([]result.Match, Stats, error)](#CollectStream)
        * [func (c *Stats) Update(other *Stats)](#Stats.Update)
        * [func (c *Stats) Zero() bool](#Stats.Zero)
        * [func (c *Stats) String() string](#Stats.String)
        * [func (c *Stats) Equal(other *Stats) bool](#Stats.Equal)
        * [func (c *Stats) AllReposTimedOut() bool](#Stats.AllReposTimedOut)
    * [type SearchFilters struct](#SearchFilters)
        * [func (s *SearchFilters) Update(event SearchEvent)](#SearchFilters.Update)
        * [func (s *SearchFilters) Compute() []*Filter](#SearchFilters.Compute)
    * [type SearchEvent struct](#SearchEvent)
    * [type Sender interface](#Sender)
        * [func WithLimit(ctx context.Context, parent Sender, limit int) (context.Context, Sender, context.CancelFunc)](#WithLimit)
        * [func WithSelect(parent Sender, s filter.SelectPath) Sender](#WithSelect)
    * [type LimitStream struct](#LimitStream)
        * [func (s *LimitStream) Send(event SearchEvent)](#LimitStream.Send)
    * [type StreamFunc func(github.com/sourcegraph/sourcegraph/internal/search/streaming.SearchEvent)](#StreamFunc)
        * [func (f StreamFunc) Send(se SearchEvent)](#StreamFunc.Send)
* [Functions](#func)
    * [func TestFilters(t *testing.T)](#TestFilters)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="commonFileFilters" href="#commonFileFilters">var commonFileFilters</a>

```
searchKey: streaming.commonFileFilters
tags: [private]
```

```Go
var commonFileFilters = ...
```

commonFileFilters are common filters used. It is used by SearchFilters to propose them if they match shown results. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Filter" href="#Filter">type Filter struct</a>

```
searchKey: streaming.Filter
```

```Go
type Filter struct {
	Value string

	// Label is the string to be displayed in the UI.
	Label string

	// Count is the number of matches in a particular repository. Only used
	// for `repo:` filters.
	Count int

	// IsLimitHit is true if the results returned for a repository are
	// incomplete.
	IsLimitHit bool

	// Kind of filter. Should be "repo", "file", or "lang".
	Kind string

	// Important is used to prioritize the order that filters appear in.
	Important bool
}
```

#### <a id="Filter.Less" href="#Filter.Less">func (f *Filter) Less(o *Filter) bool</a>

```
searchKey: streaming.Filter.Less
```

```Go
func (f *Filter) Less(o *Filter) bool
```

Less returns true if f is more important the o. 

### <a id="Filters" href="#Filters">type Filters map[string]*streaming.Filter</a>

```
searchKey: streaming.Filters
```

```Go
type Filters map[string]*Filter
```

Filters is a map of filter values to the Filter. 

#### <a id="Filters.Add" href="#Filters.Add">func (m Filters) Add(value string, label string, count int32, limitHit bool, kind string)</a>

```
searchKey: streaming.Filters.Add
```

```Go
func (m Filters) Add(value string, label string, count int32, limitHit bool, kind string)
```

Add the count to the filter with value. 

#### <a id="Filters.MarkImportant" href="#Filters.MarkImportant">func (m Filters) MarkImportant(value string)</a>

```
searchKey: streaming.Filters.MarkImportant
```

```Go
func (m Filters) MarkImportant(value string)
```

MarkImportant sets the filter with value as important. Can only be called after Add. 

#### <a id="Filters.Compute" href="#Filters.Compute">func (m Filters) Compute() []*Filter</a>

```
searchKey: streaming.Filters.Compute
```

```Go
func (m Filters) Compute() []*Filter
```

Compute returns an ordered slice of Filter to present to the user. 

### <a id="filterSlice" href="#filterSlice">type filterSlice []*streaming.Filter</a>

```
searchKey: streaming.filterSlice
tags: [private]
```

```Go
type filterSlice []*Filter
```

#### <a id="filterSlice.Len" href="#filterSlice.Len">func (fs filterSlice) Len() int</a>

```
searchKey: streaming.filterSlice.Len
tags: [private]
```

```Go
func (fs filterSlice) Len() int
```

#### <a id="filterSlice.Less" href="#filterSlice.Less">func (fs filterSlice) Less(i, j int) bool</a>

```
searchKey: streaming.filterSlice.Less
tags: [private]
```

```Go
func (fs filterSlice) Less(i, j int) bool
```

#### <a id="filterSlice.Swap" href="#filterSlice.Swap">func (fs filterSlice) Swap(i, j int)</a>

```
searchKey: streaming.filterSlice.Swap
tags: [private]
```

```Go
func (fs filterSlice) Swap(i, j int)
```

### <a id="filterHeap" href="#filterHeap">type filterHeap struct</a>

```
searchKey: streaming.filterHeap
tags: [private]
```

```Go
type filterHeap struct {
	filterSlice
	max int
}
```

filterHeap allows us to avoid creating an O(N) slice, sorting it O(NlogN) and then keeping the max elements. Instead we use a heap to use O(max) space and O(Nlogmax) runtime. 

#### <a id="filterHeap.Add" href="#filterHeap.Add">func (h *filterHeap) Add(f *Filter)</a>

```
searchKey: streaming.filterHeap.Add
tags: [private]
```

```Go
func (h *filterHeap) Add(f *Filter)
```

#### <a id="filterHeap.Less" href="#filterHeap.Less">func (h *filterHeap) Less(i, j int) bool</a>

```
searchKey: streaming.filterHeap.Less
tags: [private]
```

```Go
func (h *filterHeap) Less(i, j int) bool
```

#### <a id="filterHeap.Push" href="#filterHeap.Push">func (h *filterHeap) Push(x interface{})</a>

```
searchKey: streaming.filterHeap.Push
tags: [private]
```

```Go
func (h *filterHeap) Push(x interface{})
```

#### <a id="filterHeap.Pop" href="#filterHeap.Pop">func (h *filterHeap) Pop() interface{}</a>

```
searchKey: streaming.filterHeap.Pop
tags: [private]
```

```Go
func (h *filterHeap) Pop() interface{}
```

### <a id="Stats" href="#Stats">type Stats struct</a>

```
searchKey: streaming.Stats
```

```Go
type Stats struct {
	// IsLimitHit is true if we do not have all results that match the query.
	IsLimitHit bool

	// Repos that were matched by the repo-related filters. This should only
	// be set once by search, when we have resolved Repos.
	Repos map[api.RepoID]types.RepoName

	// Status is a RepoStatusMap of repository search statuses.
	Status search.RepoStatusMap

	// ExcludedForks is the count of excluded forked repos because the search
	// query doesn't apply to them, but that we want to know about.
	ExcludedForks int

	// ExcludedArchived is the count of excluded archived repos because the
	// search query doesn't apply to them, but that we want to know about.
	ExcludedArchived int

	// IsIndexUnavailable is true if indexed search was unavailable.
	IsIndexUnavailable bool
}
```

Stats contains fields that should be returned by all funcs that contribute to the overall search result set. 

#### <a id="CollectStream" href="#CollectStream">func CollectStream(search func(Sender) error) ([]result.Match, Stats, error)</a>

```
searchKey: streaming.CollectStream
```

```Go
func CollectStream(search func(Sender) error) ([]result.Match, Stats, error)
```

CollectStream will call search and aggregates all events it sends. It then returns the aggregate event and any error it returns. 

#### <a id="Stats.Update" href="#Stats.Update">func (c *Stats) Update(other *Stats)</a>

```
searchKey: streaming.Stats.Update
```

```Go
func (c *Stats) Update(other *Stats)
```

update updates c with the other data, deduping as necessary. It modifies c but does not modify other. 

#### <a id="Stats.Zero" href="#Stats.Zero">func (c *Stats) Zero() bool</a>

```
searchKey: streaming.Stats.Zero
```

```Go
func (c *Stats) Zero() bool
```

Zero returns true if stats is empty. IE calling Update will result in no change. 

#### <a id="Stats.String" href="#Stats.String">func (c *Stats) String() string</a>

```
searchKey: streaming.Stats.String
```

```Go
func (c *Stats) String() string
```

#### <a id="Stats.Equal" href="#Stats.Equal">func (c *Stats) Equal(other *Stats) bool</a>

```
searchKey: streaming.Stats.Equal
```

```Go
func (c *Stats) Equal(other *Stats) bool
```

Equal provides custom comparison which is used by go-cmp 

#### <a id="Stats.AllReposTimedOut" href="#Stats.AllReposTimedOut">func (c *Stats) AllReposTimedOut() bool</a>

```
searchKey: streaming.Stats.AllReposTimedOut
```

```Go
func (c *Stats) AllReposTimedOut() bool
```

### <a id="SearchFilters" href="#SearchFilters">type SearchFilters struct</a>

```
searchKey: streaming.SearchFilters
```

```Go
type SearchFilters struct {
	// Globbing is true if the user has enabled globbing support.
	Globbing bool

	filters Filters
}
```

SearchFilters computes the filters to show a user based on results. 

Note: it currently live in graphqlbackend. However, once we have a non resolver based SearchResult type it can be extracted. It lives in its own file to make that more obvious. We already have the filter type extracted (Filter). 

#### <a id="SearchFilters.Update" href="#SearchFilters.Update">func (s *SearchFilters) Update(event SearchEvent)</a>

```
searchKey: streaming.SearchFilters.Update
```

```Go
func (s *SearchFilters) Update(event SearchEvent)
```

Update internal state for the results in event. 

#### <a id="SearchFilters.Compute" href="#SearchFilters.Compute">func (s *SearchFilters) Compute() []*Filter</a>

```
searchKey: streaming.SearchFilters.Compute
```

```Go
func (s *SearchFilters) Compute() []*Filter
```

Compute returns an ordered slice of Filters to present to the user based on events passed to Next. 

### <a id="SearchEvent" href="#SearchEvent">type SearchEvent struct</a>

```
searchKey: streaming.SearchEvent
```

```Go
type SearchEvent struct {
	Results []result.Match
	Stats   Stats
}
```

### <a id="Sender" href="#Sender">type Sender interface</a>

```
searchKey: streaming.Sender
```

```Go
type Sender interface {
	Send(SearchEvent)
}
```

#### <a id="WithLimit" href="#WithLimit">func WithLimit(ctx context.Context, parent Sender, limit int) (context.Context, Sender, context.CancelFunc)</a>

```
searchKey: streaming.WithLimit
```

```Go
func WithLimit(ctx context.Context, parent Sender, limit int) (context.Context, Sender, context.CancelFunc)
```

WithLimit returns a child Stream of parent as well as a child Context of ctx. The child stream passes on all events to parent. Once more than limit ResultCount are sent on the child stream the context is canceled and an IsLimitHit event is sent. 

Canceling this context releases resources associated with it, so code should call cancel as soon as the operations running in this Context and Stream are complete. 

#### <a id="WithSelect" href="#WithSelect">func WithSelect(parent Sender, s filter.SelectPath) Sender</a>

```
searchKey: streaming.WithSelect
```

```Go
func WithSelect(parent Sender, s filter.SelectPath) Sender
```

WithSelect returns a child Stream of parent that runs the select operation on each event, deduplicating where possible. 

### <a id="LimitStream" href="#LimitStream">type LimitStream struct</a>

```
searchKey: streaming.LimitStream
```

```Go
type LimitStream struct {
	s         Sender
	cancel    context.CancelFunc
	remaining atomic.Int64
}
```

#### <a id="LimitStream.Send" href="#LimitStream.Send">func (s *LimitStream) Send(event SearchEvent)</a>

```
searchKey: streaming.LimitStream.Send
```

```Go
func (s *LimitStream) Send(event SearchEvent)
```

### <a id="StreamFunc" href="#StreamFunc">type StreamFunc func(github.com/sourcegraph/sourcegraph/internal/search/streaming.SearchEvent)</a>

```
searchKey: streaming.StreamFunc
```

```Go
type StreamFunc func(SearchEvent)
```

#### <a id="StreamFunc.Send" href="#StreamFunc.Send">func (f StreamFunc) Send(se SearchEvent)</a>

```
searchKey: streaming.StreamFunc.Send
```

```Go
func (f StreamFunc) Send(se SearchEvent)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestFilters" href="#TestFilters">func TestFilters(t *testing.T)</a>

```
searchKey: streaming.TestFilters
tags: [private]
```

```Go
func TestFilters(t *testing.T)
```

