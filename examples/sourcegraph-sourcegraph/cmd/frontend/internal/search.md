# Package search

package search is search specific logic for the frontend. Also see github.com/sourcegraph/sourcegraph/internal/search for more generic search code. 

## Index

* Subpages
  * [cmd/frontend/internal/search/logs](search/logs.md)
* [Constants](#const)
    * [const commitMatch](#commitMatch)
    * [const fileMatch](#fileMatch)
    * [const repoMatch](#repoMatch)
    * [const symbolMatch](#symbolMatch)
* [Variables](#var)
    * [var metricLatency](#metricLatency)
    * [var searchBlitzUserAgentRegexp](#searchBlitzUserAgentRegexp)
* [Types](#type)
    * [type args struct](#args)
        * [func parseURLQuery(q url.Values) (*args, error)](#parseURLQuery)
    * [type jsonArrayBuf struct](#jsonArrayBuf)
        * [func (j *jsonArrayBuf) Append(v interface{}) error](#jsonArrayBuf.Append)
        * [func (j *jsonArrayBuf) Flush() error](#jsonArrayBuf.Flush)
        * [func (j *jsonArrayBuf) Len() int](#jsonArrayBuf.Len)
    * [type matchType int](#matchType)
        * [func (t matchType) MarshalJSON() ([]byte, error)](#matchType.MarshalJSON)
    * [type mockSearchResolver struct](#mockSearchResolver)
        * [func (h *mockSearchResolver) Close()](#mockSearchResolver.Close)
        * [func (h *mockSearchResolver) Inputs() run.SearchInputs](#mockSearchResolver.Inputs)
        * [func (h *mockSearchResolver) Results(ctx context.Context) (*graphqlbackend.SearchResultsResolver, error)](#mockSearchResolver.Results)
    * [type namerFunc string](#namerFunc)
        * [func (n namerFunc) Name() string](#namerFunc.Name)
    * [type progressAggregator struct](#progressAggregator)
        * [func (p *progressAggregator) Current() api.Progress](#progressAggregator.Current)
        * [func (p *progressAggregator) Final() api.Progress](#progressAggregator.Final)
        * [func (p *progressAggregator) Update(event streaming.SearchEvent)](#progressAggregator.Update)
        * [func (p *progressAggregator) currentStats() api.ProgressStats](#progressAggregator.currentStats)
    * [type searchResolver interface](#searchResolver)
        * [func defaultNewSearchResolver(ctx context.Context, db dbutil.DB, args *graphqlbackend.SearchArgs) (searchResolver, error)](#defaultNewSearchResolver)
    * [type streamHandler struct](#streamHandler)
        * [func (h *streamHandler) ServeHTTP(w http.ResponseWriter, r *http.Request)](#streamHandler.ServeHTTP)
        * [func (h *streamHandler) getEventRepoMetadata(ctx context.Context, event streaming.SearchEvent) map[api.RepoID]*types.Repo](#streamHandler.getEventRepoMetadata)
        * [func (h *streamHandler) startSearch(ctx context.Context, a *args) (events <-chan streaming.SearchEvent, inputs run.SearchInputs, results func() (*graphqlbackend.SearchResultsResolver, error))](#streamHandler.startSearch)
* [Functions](#func)
    * [func GuessSource(r *http.Request) trace.SourceType](#GuessSource)
    * [func StreamHandler(db dbutil.DB) http.Handler](#StreamHandler)
    * [func TestDefaultNewSearchResolver(t *testing.T)](#TestDefaultNewSearchResolver)
    * [func TestDisplayLimit(t *testing.T)](#TestDisplayLimit)
    * [func TestServeStream_empty(t *testing.T)](#TestServeStream_empty)
    * [func batchEvents(source <-chan streaming.SearchEvent, delay time.Duration) <-chan streaming.SearchEvent](#batchEvents)
    * [func eventStreamOTHook(log func(...otlog.Field)) func(streamhttp.WriterStat)](#eventStreamOTHook)
    * [func fromCommit(commit *result.CommitMatch, repoCache map[api.RepoID]*types.Repo) *streamhttp.EventCommitMatch](#fromCommit)
    * [func fromFileMatch(fm *result.FileMatch, repoCache map[api.RepoID]*types.Repo) streamhttp.EventMatch](#fromFileMatch)
    * [func fromMatch(match result.Match, repoCache map[api.RepoID]*types.Repo) streamhttp.EventMatch](#fromMatch)
    * [func fromRepository(rm *result.RepoMatch, repoCache map[api.RepoID]*types.Repo) *streamhttp.EventRepoMatch](#fromRepository)
    * [func fromStrPtr(s *string) string](#fromStrPtr)
    * [func fromSymbolMatch(fm *result.FileMatch, repoCache map[api.RepoID]*types.Repo) *streamhttp.EventSymbolMatch](#fromSymbolMatch)
    * [func getNames(stats streaming.Stats, status searchshared.RepoStatus) []api.Namer](#getNames)
    * [func intPtr(i int) *int](#intPtr)
    * [func mkRepoMatch(id int) *result.RepoMatch](#mkRepoMatch)
    * [func repoIDs(results []result.Match) []api.RepoID](#repoIDs)
    * [func strPtr(s string) *string](#strPtr)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="commitMatch" href="#commitMatch">const commitMatch</a>

```
searchKey: search.commitMatch
tags: [constant number private]
```

```Go
const commitMatch
```

### <a id="fileMatch" href="#fileMatch">const fileMatch</a>

```
searchKey: search.fileMatch
tags: [constant number private]
```

```Go
const fileMatch matchType = iota
```

### <a id="repoMatch" href="#repoMatch">const repoMatch</a>

```
searchKey: search.repoMatch
tags: [constant number private]
```

```Go
const repoMatch
```

### <a id="symbolMatch" href="#symbolMatch">const symbolMatch</a>

```
searchKey: search.symbolMatch
tags: [constant number private]
```

```Go
const symbolMatch
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="metricLatency" href="#metricLatency">var metricLatency</a>

```
searchKey: search.metricLatency
tags: [variable struct private]
```

```Go
var metricLatency = ...
```

### <a id="searchBlitzUserAgentRegexp" href="#searchBlitzUserAgentRegexp">var searchBlitzUserAgentRegexp</a>

```
searchKey: search.searchBlitzUserAgentRegexp
tags: [variable struct private]
```

```Go
var searchBlitzUserAgentRegexp = lazyregexp.New(`^SearchBlitz \(([^\)]+)\)$`)
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="args" href="#args">type args struct</a>

```
searchKey: search.args
tags: [struct private]
```

```Go
type args struct {
	Query          string
	Version        string
	PatternType    string
	VersionContext string
	Display        int
}
```

#### <a id="parseURLQuery" href="#parseURLQuery">func parseURLQuery(q url.Values) (*args, error)</a>

```
searchKey: search.parseURLQuery
tags: [method private]
```

```Go
func parseURLQuery(q url.Values) (*args, error)
```

### <a id="jsonArrayBuf" href="#jsonArrayBuf">type jsonArrayBuf struct</a>

```
searchKey: search.jsonArrayBuf
tags: [struct private]
```

```Go
type jsonArrayBuf struct {
	FlushSize int
	Write     func([]byte) error

	buf bytes.Buffer
}
```

jsonArrayBuf builds up a JSON array by marshalling per item. Once the array has reached FlushSize it will be written out via Write and the buffer will be reset. 

#### <a id="jsonArrayBuf.Append" href="#jsonArrayBuf.Append">func (j *jsonArrayBuf) Append(v interface{}) error</a>

```
searchKey: search.jsonArrayBuf.Append
tags: [method private]
```

```Go
func (j *jsonArrayBuf) Append(v interface{}) error
```

Append marshals v and adds it to the json array buffer. If the size of the buffer exceed FlushSize the buffer is written out. 

#### <a id="jsonArrayBuf.Flush" href="#jsonArrayBuf.Flush">func (j *jsonArrayBuf) Flush() error</a>

```
searchKey: search.jsonArrayBuf.Flush
tags: [function private]
```

```Go
func (j *jsonArrayBuf) Flush() error
```

Flush writes and resets the buffer if there is data to write. 

#### <a id="jsonArrayBuf.Len" href="#jsonArrayBuf.Len">func (j *jsonArrayBuf) Len() int</a>

```
searchKey: search.jsonArrayBuf.Len
tags: [function private]
```

```Go
func (j *jsonArrayBuf) Len() int
```

### <a id="matchType" href="#matchType">type matchType int</a>

```
searchKey: search.matchType
tags: [number private]
```

```Go
type matchType int
```

#### <a id="matchType.MarshalJSON" href="#matchType.MarshalJSON">func (t matchType) MarshalJSON() ([]byte, error)</a>

```
searchKey: search.matchType.MarshalJSON
tags: [function private]
```

```Go
func (t matchType) MarshalJSON() ([]byte, error)
```

### <a id="mockSearchResolver" href="#mockSearchResolver">type mockSearchResolver struct</a>

```
searchKey: search.mockSearchResolver
tags: [struct private]
```

```Go
type mockSearchResolver struct {
	done   chan struct{}
	c      streaming.Sender
	inputs *run.SearchInputs
}
```

#### <a id="mockSearchResolver.Close" href="#mockSearchResolver.Close">func (h *mockSearchResolver) Close()</a>

```
searchKey: search.mockSearchResolver.Close
tags: [function private]
```

```Go
func (h *mockSearchResolver) Close()
```

#### <a id="mockSearchResolver.Inputs" href="#mockSearchResolver.Inputs">func (h *mockSearchResolver) Inputs() run.SearchInputs</a>

```
searchKey: search.mockSearchResolver.Inputs
tags: [function private]
```

```Go
func (h *mockSearchResolver) Inputs() run.SearchInputs
```

#### <a id="mockSearchResolver.Results" href="#mockSearchResolver.Results">func (h *mockSearchResolver) Results(ctx context.Context) (*graphqlbackend.SearchResultsResolver, error)</a>

```
searchKey: search.mockSearchResolver.Results
tags: [method private]
```

```Go
func (h *mockSearchResolver) Results(ctx context.Context) (*graphqlbackend.SearchResultsResolver, error)
```

### <a id="namerFunc" href="#namerFunc">type namerFunc string</a>

```
searchKey: search.namerFunc
tags: [string private]
```

```Go
type namerFunc string
```

#### <a id="namerFunc.Name" href="#namerFunc.Name">func (n namerFunc) Name() string</a>

```
searchKey: search.namerFunc.Name
tags: [function private]
```

```Go
func (n namerFunc) Name() string
```

### <a id="progressAggregator" href="#progressAggregator">type progressAggregator struct</a>

```
searchKey: search.progressAggregator
tags: [struct private]
```

```Go
type progressAggregator struct {
	Start        time.Time
	MatchCount   int
	Stats        streaming.Stats
	Limit        int
	DisplayLimit int
	Trace        string // may be empty

	// Dirty is true if p has changed since the last call to Current.
	Dirty bool
}
```

#### <a id="progressAggregator.Current" href="#progressAggregator.Current">func (p *progressAggregator) Current() api.Progress</a>

```
searchKey: search.progressAggregator.Current
tags: [function private]
```

```Go
func (p *progressAggregator) Current() api.Progress
```

Current returns the current progress event. 

#### <a id="progressAggregator.Final" href="#progressAggregator.Final">func (p *progressAggregator) Final() api.Progress</a>

```
searchKey: search.progressAggregator.Final
tags: [function private]
```

```Go
func (p *progressAggregator) Final() api.Progress
```

Final returns the current progress event, but with final fields set to indicate it is the last progress event. 

#### <a id="progressAggregator.Update" href="#progressAggregator.Update">func (p *progressAggregator) Update(event streaming.SearchEvent)</a>

```
searchKey: search.progressAggregator.Update
tags: [method private]
```

```Go
func (p *progressAggregator) Update(event streaming.SearchEvent)
```

#### <a id="progressAggregator.currentStats" href="#progressAggregator.currentStats">func (p *progressAggregator) currentStats() api.ProgressStats</a>

```
searchKey: search.progressAggregator.currentStats
tags: [function private]
```

```Go
func (p *progressAggregator) currentStats() api.ProgressStats
```

### <a id="searchResolver" href="#searchResolver">type searchResolver interface</a>

```
searchKey: search.searchResolver
tags: [interface private]
```

```Go
type searchResolver interface {
	Results(context.Context) (*graphqlbackend.SearchResultsResolver, error)
	Inputs() run.SearchInputs
}
```

#### <a id="defaultNewSearchResolver" href="#defaultNewSearchResolver">func defaultNewSearchResolver(ctx context.Context, db dbutil.DB, args *graphqlbackend.SearchArgs) (searchResolver, error)</a>

```
searchKey: search.defaultNewSearchResolver
tags: [method private]
```

```Go
func defaultNewSearchResolver(ctx context.Context, db dbutil.DB, args *graphqlbackend.SearchArgs) (searchResolver, error)
```

### <a id="streamHandler" href="#streamHandler">type streamHandler struct</a>

```
searchKey: search.streamHandler
tags: [struct private]
```

```Go
type streamHandler struct {
	db                  dbutil.DB
	newSearchResolver   func(context.Context, dbutil.DB, *graphqlbackend.SearchArgs) (searchResolver, error)
	flushTickerInternal time.Duration
	pingTickerInterval  time.Duration
}
```

#### <a id="streamHandler.ServeHTTP" href="#streamHandler.ServeHTTP">func (h *streamHandler) ServeHTTP(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: search.streamHandler.ServeHTTP
tags: [method private]
```

```Go
func (h *streamHandler) ServeHTTP(w http.ResponseWriter, r *http.Request)
```

#### <a id="streamHandler.getEventRepoMetadata" href="#streamHandler.getEventRepoMetadata">func (h *streamHandler) getEventRepoMetadata(ctx context.Context, event streaming.SearchEvent) map[api.RepoID]*types.Repo</a>

```
searchKey: search.streamHandler.getEventRepoMetadata
tags: [method private]
```

```Go
func (h *streamHandler) getEventRepoMetadata(ctx context.Context, event streaming.SearchEvent) map[api.RepoID]*types.Repo
```

#### <a id="streamHandler.startSearch" href="#streamHandler.startSearch">func (h *streamHandler) startSearch(ctx context.Context, a *args) (events <-chan streaming.SearchEvent, inputs run.SearchInputs, results func() (*graphqlbackend.SearchResultsResolver, error))</a>

```
searchKey: search.streamHandler.startSearch
tags: [method private]
```

```Go
func (h *streamHandler) startSearch(ctx context.Context, a *args) (events <-chan streaming.SearchEvent, inputs run.SearchInputs, results func() (*graphqlbackend.SearchResultsResolver, error))
```

startSearch will start a search. It returns the events channel which streams out search events. Once events is closed you can call results which will return the results resolver and error. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="GuessSource" href="#GuessSource">func GuessSource(r *http.Request) trace.SourceType</a>

```
searchKey: search.GuessSource
tags: [method]
```

```Go
func GuessSource(r *http.Request) trace.SourceType
```

GuessSource guesses the source the request came from (browser, other HTTP client, etc.) 

### <a id="StreamHandler" href="#StreamHandler">func StreamHandler(db dbutil.DB) http.Handler</a>

```
searchKey: search.StreamHandler
tags: [method]
```

```Go
func StreamHandler(db dbutil.DB) http.Handler
```

StreamHandler is an http handler which streams back search results. 

### <a id="TestDefaultNewSearchResolver" href="#TestDefaultNewSearchResolver">func TestDefaultNewSearchResolver(t *testing.T)</a>

```
searchKey: search.TestDefaultNewSearchResolver
tags: [method private test]
```

```Go
func TestDefaultNewSearchResolver(t *testing.T)
```

Ensures graphqlbackend matches the interface we expect 

### <a id="TestDisplayLimit" href="#TestDisplayLimit">func TestDisplayLimit(t *testing.T)</a>

```
searchKey: search.TestDisplayLimit
tags: [method private test]
```

```Go
func TestDisplayLimit(t *testing.T)
```

### <a id="TestServeStream_empty" href="#TestServeStream_empty">func TestServeStream_empty(t *testing.T)</a>

```
searchKey: search.TestServeStream_empty
tags: [method private test]
```

```Go
func TestServeStream_empty(t *testing.T)
```

### <a id="batchEvents" href="#batchEvents">func batchEvents(source <-chan streaming.SearchEvent, delay time.Duration) <-chan streaming.SearchEvent</a>

```
searchKey: search.batchEvents
tags: [method private]
```

```Go
func batchEvents(source <-chan streaming.SearchEvent, delay time.Duration) <-chan streaming.SearchEvent
```

batchEvents takes an event stream and merges events that come through close in time into a single event. This makes downstream database and network operations more efficient by enabling batch reads. 

### <a id="eventStreamOTHook" href="#eventStreamOTHook">func eventStreamOTHook(log func(...otlog.Field)) func(streamhttp.WriterStat)</a>

```
searchKey: search.eventStreamOTHook
tags: [method private]
```

```Go
func eventStreamOTHook(log func(...otlog.Field)) func(streamhttp.WriterStat)
```

eventStreamOTHook returns a StatHook which logs to log. 

### <a id="fromCommit" href="#fromCommit">func fromCommit(commit *result.CommitMatch, repoCache map[api.RepoID]*types.Repo) *streamhttp.EventCommitMatch</a>

```
searchKey: search.fromCommit
tags: [method private]
```

```Go
func fromCommit(commit *result.CommitMatch, repoCache map[api.RepoID]*types.Repo) *streamhttp.EventCommitMatch
```

### <a id="fromFileMatch" href="#fromFileMatch">func fromFileMatch(fm *result.FileMatch, repoCache map[api.RepoID]*types.Repo) streamhttp.EventMatch</a>

```
searchKey: search.fromFileMatch
tags: [method private]
```

```Go
func fromFileMatch(fm *result.FileMatch, repoCache map[api.RepoID]*types.Repo) streamhttp.EventMatch
```

### <a id="fromMatch" href="#fromMatch">func fromMatch(match result.Match, repoCache map[api.RepoID]*types.Repo) streamhttp.EventMatch</a>

```
searchKey: search.fromMatch
tags: [method private]
```

```Go
func fromMatch(match result.Match, repoCache map[api.RepoID]*types.Repo) streamhttp.EventMatch
```

### <a id="fromRepository" href="#fromRepository">func fromRepository(rm *result.RepoMatch, repoCache map[api.RepoID]*types.Repo) *streamhttp.EventRepoMatch</a>

```
searchKey: search.fromRepository
tags: [method private]
```

```Go
func fromRepository(rm *result.RepoMatch, repoCache map[api.RepoID]*types.Repo) *streamhttp.EventRepoMatch
```

### <a id="fromStrPtr" href="#fromStrPtr">func fromStrPtr(s *string) string</a>

```
searchKey: search.fromStrPtr
tags: [method private]
```

```Go
func fromStrPtr(s *string) string
```

### <a id="fromSymbolMatch" href="#fromSymbolMatch">func fromSymbolMatch(fm *result.FileMatch, repoCache map[api.RepoID]*types.Repo) *streamhttp.EventSymbolMatch</a>

```
searchKey: search.fromSymbolMatch
tags: [method private]
```

```Go
func fromSymbolMatch(fm *result.FileMatch, repoCache map[api.RepoID]*types.Repo) *streamhttp.EventSymbolMatch
```

### <a id="getNames" href="#getNames">func getNames(stats streaming.Stats, status searchshared.RepoStatus) []api.Namer</a>

```
searchKey: search.getNames
tags: [method private]
```

```Go
func getNames(stats streaming.Stats, status searchshared.RepoStatus) []api.Namer
```

### <a id="intPtr" href="#intPtr">func intPtr(i int) *int</a>

```
searchKey: search.intPtr
tags: [method private]
```

```Go
func intPtr(i int) *int
```

### <a id="mkRepoMatch" href="#mkRepoMatch">func mkRepoMatch(id int) *result.RepoMatch</a>

```
searchKey: search.mkRepoMatch
tags: [method private]
```

```Go
func mkRepoMatch(id int) *result.RepoMatch
```

### <a id="repoIDs" href="#repoIDs">func repoIDs(results []result.Match) []api.RepoID</a>

```
searchKey: search.repoIDs
tags: [method private]
```

```Go
func repoIDs(results []result.Match) []api.RepoID
```

### <a id="strPtr" href="#strPtr">func strPtr(s string) *string</a>

```
searchKey: search.strPtr
tags: [method private]
```

```Go
func strPtr(s string) *string
```

