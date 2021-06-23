# Package backend

## Index

* [Variables](#var)
    * [var requestDuration](#requestDuration)
    * [var metricListAllCount](#metricListAllCount)
    * [var metricListAllWithID](#metricListAllWithID)
    * [var metricListAllTimestamp](#metricListAllTimestamp)
    * [var zoektHTTPClient](#zoektHTTPClient)
* [Types](#type)
    * [type FakeSearcher struct](#FakeSearcher)
        * [func (ss *FakeSearcher) Search(ctx context.Context, q zoektquery.Q, opts *zoekt.SearchOptions) (*zoekt.SearchResult, error)](#FakeSearcher.Search)
        * [func (ss *FakeSearcher) StreamSearch(ctx context.Context, q zoektquery.Q, opts *zoekt.SearchOptions, z zoekt.Sender) error](#FakeSearcher.StreamSearch)
        * [func (ss *FakeSearcher) List(ctx context.Context, q zoektquery.Q) (*zoekt.RepoList, error)](#FakeSearcher.List)
        * [func (ss *FakeSearcher) String() string](#FakeSearcher.String)
    * [type HorizontalSearcher struct](#HorizontalSearcher)
        * [func (s *HorizontalSearcher) StreamSearch(ctx context.Context, q query.Q, opts *zoekt.SearchOptions, streamer zoekt.Sender) error](#HorizontalSearcher.StreamSearch)
        * [func (s *HorizontalSearcher) Search(ctx context.Context, q query.Q, opts *zoekt.SearchOptions) (*zoekt.SearchResult, error)](#HorizontalSearcher.Search)
        * [func (s *HorizontalSearcher) List(ctx context.Context, q query.Q) (*zoekt.RepoList, error)](#HorizontalSearcher.List)
        * [func (s *HorizontalSearcher) Close()](#HorizontalSearcher.Close)
        * [func (s *HorizontalSearcher) String() string](#HorizontalSearcher.String)
        * [func (s *HorizontalSearcher) searchers() (map[string]zoekt.Streamer, error)](#HorizontalSearcher.searchers)
        * [func (s *HorizontalSearcher) syncSearchers() (map[string]zoekt.Streamer, error)](#HorizontalSearcher.syncSearchers)
    * [type dedupper map[string]string](#dedupper)
        * [func (repoEndpoint dedupper) Dedup(endpoint string, fms []zoekt.FileMatch) []zoekt.FileMatch](#dedupper.Dedup)
    * [type zoektIndexOptions struct](#zoektIndexOptions)
    * [type RepoIndexOptions struct](#RepoIndexOptions)
    * [type EndpointMap interface](#EndpointMap)
    * [type Indexers struct](#Indexers)
        * [func (c *Indexers) ReposSubset(ctx context.Context, hostname string, indexed map[string]struct{}, repoNames []string) ([]string, error)](#Indexers.ReposSubset)
        * [func (c *Indexers) Enabled() bool](#Indexers.Enabled)
    * [type meteredSearcher struct](#meteredSearcher)
        * [func (m *meteredSearcher) StreamSearch(ctx context.Context, q query.Q, opts *zoekt.SearchOptions, c zoekt.Sender) (err error)](#meteredSearcher.StreamSearch)
        * [func (m *meteredSearcher) Search(ctx context.Context, q query.Q, opts *zoekt.SearchOptions) (*zoekt.SearchResult, error)](#meteredSearcher.Search)
        * [func (m *meteredSearcher) List(ctx context.Context, q query.Q) (*zoekt.RepoList, error)](#meteredSearcher.List)
        * [func (m *meteredSearcher) String() string](#meteredSearcher.String)
    * [type Zoekt struct](#Zoekt)
        * [func (c *Zoekt) Close()](#Zoekt.Close)
        * [func (c *Zoekt) String() string](#Zoekt.String)
        * [func (c *Zoekt) ListAll(ctx context.Context) (map[string]*zoekt.Repository, error)](#Zoekt.ListAll)
        * [func (c *Zoekt) SetEnabled(b bool)](#Zoekt.SetEnabled)
        * [func (c *Zoekt) Enabled() bool](#Zoekt.Enabled)
        * [func (c *Zoekt) list(ctx context.Context) (map[string]*zoekt.Repository, error)](#Zoekt.list)
        * [func (c *Zoekt) start()](#Zoekt.start)
    * [type ZoektStreamFunc func(*github.com/google/zoekt.SearchResult)](#ZoektStreamFunc)
        * [func (f ZoektStreamFunc) Send(event *zoekt.SearchResult)](#ZoektStreamFunc.Send)
    * [type StreamSearchEvent struct](#StreamSearchEvent)
    * [type StreamSearchAdapter struct](#StreamSearchAdapter)
        * [func (s *StreamSearchAdapter) StreamSearch(ctx context.Context, q query.Q, opts *zoekt.SearchOptions, c zoekt.Sender) error](#StreamSearchAdapter.StreamSearch)
        * [func (s *StreamSearchAdapter) String() string](#StreamSearchAdapter.String)
    * [type zoektStream struct](#zoektStream)
    * [type mockSearcher struct](#mockSearcher)
        * [func (s *mockSearcher) Search(context.Context, query.Q, *zoekt.SearchOptions) (*zoekt.SearchResult, error)](#mockSearcher.Search)
        * [func (s *mockSearcher) StreamSearch(ctx context.Context, q query.Q, opts *zoekt.SearchOptions, streamer zoekt.Sender) error](#mockSearcher.StreamSearch)
        * [func (s *mockSearcher) List(context.Context, query.Q) (*zoekt.RepoList, error)](#mockSearcher.List)
        * [func (*mockSearcher) Close()](#mockSearcher.Close)
        * [func (*mockSearcher) String() string](#mockSearcher.String)
    * [type atomicMap struct](#atomicMap)
        * [func (m *atomicMap) Endpoints() (map[string]struct{}, error)](#atomicMap.Endpoints)
        * [func (m *atomicMap) GetMany(keys ...string) ([]string, error)](#atomicMap.GetMany)
    * [type prefixMap []string](#prefixMap)
        * [func (m prefixMap) Endpoints() (map[string]struct{}, error)](#prefixMap.Endpoints)
        * [func (m prefixMap) GetMany(keys ...string) ([]string, error)](#prefixMap.GetMany)
* [Functions](#func)
    * [func AggregateStreamSearch(ctx context.Context, streamSearch func(context.Context, query.Q, *zoekt.SearchOptions, zoekt.Sender) error, q query.Q, opts *zoekt.SearchOptions) (*zoekt.SearchResult, error)](#AggregateStreamSearch)
    * [func equalKeys(a map[string]zoekt.Streamer, b map[string]struct{}) bool](#equalKeys)
    * [func GetIndexOptions(c *schema.SiteConfiguration,...](#GetIndexOptions)
    * [func getIndexOptions(c *schema.SiteConfiguration,...](#getIndexOptions)
    * [func getBoolPtr(b *bool, default_ bool) bool](#getBoolPtr)
    * [func marshal(o *zoektIndexOptions) []byte](#marshal)
    * [func findEndpoint(eps map[string]struct{}, hostname string) (string, error)](#findEndpoint)
    * [func endpointsString(m map[string]struct{}) string](#endpointsString)
    * [func NewMeteredSearcher(hostname string, z zoekt.Streamer) zoekt.Streamer](#NewMeteredSearcher)
    * [func queryString(q query.Q) string](#queryString)
    * [func randSleep(d, jitter time.Duration)](#randSleep)
    * [func ZoektDial(endpoint string) zoekt.Streamer](#ZoektDial)
    * [func TestHorizontalSearcher(t *testing.T)](#TestHorizontalSearcher)
    * [func TestDoStreamSearch(t *testing.T)](#TestDoStreamSearch)
    * [func TestSyncSearchers(t *testing.T)](#TestSyncSearchers)
    * [func TestDedupper(t *testing.T)](#TestDedupper)
    * [func BenchmarkDedup(b *testing.B)](#BenchmarkDedup)
    * [func backgroundSearch(searcher zoekt.Searcher) func(t *testing.T)](#backgroundSearch)
    * [func TestGetIndexOptions(t *testing.T)](#TestGetIndexOptions)
    * [func TestGetIndexOptions_getVersion(t *testing.T)](#TestGetIndexOptions_getVersion)
    * [func TestGetIndexOptions_batch(t *testing.T)](#TestGetIndexOptions_batch)
    * [func parseVersionContext(name string, repoRevStrs ...string) *schema.VersionContext](#parseVersionContext)
    * [func boolPtr(b bool) *bool](#boolPtr)
    * [func TestReposSubset(t *testing.T)](#TestReposSubset)
    * [func TestFindEndpoint(t *testing.T)](#TestFindEndpoint)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="requestDuration" href="#requestDuration">var requestDuration</a>

```
searchKey: backend.requestDuration
tags: [private]
```

```Go
var requestDuration = ...
```

### <a id="metricListAllCount" href="#metricListAllCount">var metricListAllCount</a>

```
searchKey: backend.metricListAllCount
tags: [private]
```

```Go
var metricListAllCount = ...
```

### <a id="metricListAllWithID" href="#metricListAllWithID">var metricListAllWithID</a>

```
searchKey: backend.metricListAllWithID
tags: [private]
```

```Go
var metricListAllWithID = ...
```

### <a id="metricListAllTimestamp" href="#metricListAllTimestamp">var metricListAllTimestamp</a>

```
searchKey: backend.metricListAllTimestamp
tags: [private]
```

```Go
var metricListAllTimestamp = ...
```

### <a id="zoektHTTPClient" href="#zoektHTTPClient">var zoektHTTPClient</a>

```
searchKey: backend.zoektHTTPClient
tags: [private]
```

```Go
var zoektHTTPClient = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="FakeSearcher" href="#FakeSearcher">type FakeSearcher struct</a>

```
searchKey: backend.FakeSearcher
```

```Go
type FakeSearcher struct {
	Result *zoekt.SearchResult

	Repos []*zoekt.RepoListEntry

	// Default all unimplemented zoekt.Searcher methods to panic.
	zoekt.Searcher
}
```

FakeSearcher is a zoekt.Searcher that returns a predefined search Result. 

#### <a id="FakeSearcher.Search" href="#FakeSearcher.Search">func (ss *FakeSearcher) Search(ctx context.Context, q zoektquery.Q, opts *zoekt.SearchOptions) (*zoekt.SearchResult, error)</a>

```
searchKey: backend.FakeSearcher.Search
```

```Go
func (ss *FakeSearcher) Search(ctx context.Context, q zoektquery.Q, opts *zoekt.SearchOptions) (*zoekt.SearchResult, error)
```

#### <a id="FakeSearcher.StreamSearch" href="#FakeSearcher.StreamSearch">func (ss *FakeSearcher) StreamSearch(ctx context.Context, q zoektquery.Q, opts *zoekt.SearchOptions, z zoekt.Sender) error</a>

```
searchKey: backend.FakeSearcher.StreamSearch
```

```Go
func (ss *FakeSearcher) StreamSearch(ctx context.Context, q zoektquery.Q, opts *zoekt.SearchOptions, z zoekt.Sender) error
```

#### <a id="FakeSearcher.List" href="#FakeSearcher.List">func (ss *FakeSearcher) List(ctx context.Context, q zoektquery.Q) (*zoekt.RepoList, error)</a>

```
searchKey: backend.FakeSearcher.List
```

```Go
func (ss *FakeSearcher) List(ctx context.Context, q zoektquery.Q) (*zoekt.RepoList, error)
```

#### <a id="FakeSearcher.String" href="#FakeSearcher.String">func (ss *FakeSearcher) String() string</a>

```
searchKey: backend.FakeSearcher.String
```

```Go
func (ss *FakeSearcher) String() string
```

### <a id="HorizontalSearcher" href="#HorizontalSearcher">type HorizontalSearcher struct</a>

```
searchKey: backend.HorizontalSearcher
```

```Go
type HorizontalSearcher struct {
	// Map is a subset of EndpointMap only using the Endpoints function. We
	// use this to find the endpoints to dial over time.
	Map interface {
		Endpoints() (map[string]struct{}, error)
	}
	Dial func(endpoint string) zoekt.Streamer

	mu      sync.RWMutex
	clients map[string]zoekt.Streamer // addr -> client
}
```

HorizontalSearcher is a Streamer which aggregates searches over Map. It manages the connections to Map as the endpoints come and go. 

#### <a id="HorizontalSearcher.StreamSearch" href="#HorizontalSearcher.StreamSearch">func (s *HorizontalSearcher) StreamSearch(ctx context.Context, q query.Q, opts *zoekt.SearchOptions, streamer zoekt.Sender) error</a>

```
searchKey: backend.HorizontalSearcher.StreamSearch
```

```Go
func (s *HorizontalSearcher) StreamSearch(ctx context.Context, q query.Q, opts *zoekt.SearchOptions, streamer zoekt.Sender) error
```

StreamSearch does a search which merges the stream from every endpoint in Map. 

#### <a id="HorizontalSearcher.Search" href="#HorizontalSearcher.Search">func (s *HorizontalSearcher) Search(ctx context.Context, q query.Q, opts *zoekt.SearchOptions) (*zoekt.SearchResult, error)</a>

```
searchKey: backend.HorizontalSearcher.Search
```

```Go
func (s *HorizontalSearcher) Search(ctx context.Context, q query.Q, opts *zoekt.SearchOptions) (*zoekt.SearchResult, error)
```

Search aggregates search over every endpoint in Map. 

#### <a id="HorizontalSearcher.List" href="#HorizontalSearcher.List">func (s *HorizontalSearcher) List(ctx context.Context, q query.Q) (*zoekt.RepoList, error)</a>

```
searchKey: backend.HorizontalSearcher.List
```

```Go
func (s *HorizontalSearcher) List(ctx context.Context, q query.Q) (*zoekt.RepoList, error)
```

List aggregates list over every endpoint in Map. 

#### <a id="HorizontalSearcher.Close" href="#HorizontalSearcher.Close">func (s *HorizontalSearcher) Close()</a>

```
searchKey: backend.HorizontalSearcher.Close
```

```Go
func (s *HorizontalSearcher) Close()
```

Close will close all connections in Map. 

#### <a id="HorizontalSearcher.String" href="#HorizontalSearcher.String">func (s *HorizontalSearcher) String() string</a>

```
searchKey: backend.HorizontalSearcher.String
```

```Go
func (s *HorizontalSearcher) String() string
```

#### <a id="HorizontalSearcher.searchers" href="#HorizontalSearcher.searchers">func (s *HorizontalSearcher) searchers() (map[string]zoekt.Streamer, error)</a>

```
searchKey: backend.HorizontalSearcher.searchers
tags: [private]
```

```Go
func (s *HorizontalSearcher) searchers() (map[string]zoekt.Streamer, error)
```

searchers returns the list of clients to aggregate over. 

#### <a id="HorizontalSearcher.syncSearchers" href="#HorizontalSearcher.syncSearchers">func (s *HorizontalSearcher) syncSearchers() (map[string]zoekt.Streamer, error)</a>

```
searchKey: backend.HorizontalSearcher.syncSearchers
tags: [private]
```

```Go
func (s *HorizontalSearcher) syncSearchers() (map[string]zoekt.Streamer, error)
```

syncSearchers syncs the set of clients with the set of endpoints. It is the slow-path of "searchers" since it obtains an write lock on the state before proceeding. 

### <a id="dedupper" href="#dedupper">type dedupper map[string]string</a>

```
searchKey: backend.dedupper
tags: [private]
```

```Go
type dedupper map[string]string // repoName -> endpoint

```

#### <a id="dedupper.Dedup" href="#dedupper.Dedup">func (repoEndpoint dedupper) Dedup(endpoint string, fms []zoekt.FileMatch) []zoekt.FileMatch</a>

```
searchKey: backend.dedupper.Dedup
tags: [private]
```

```Go
func (repoEndpoint dedupper) Dedup(endpoint string, fms []zoekt.FileMatch) []zoekt.FileMatch
```

Dedup will in-place filter out matches on Repositories we have already seen. A Repository has been seen if a previous call to Dedup had a match in it with a different endpoint. 

### <a id="zoektIndexOptions" href="#zoektIndexOptions">type zoektIndexOptions struct</a>

```
searchKey: backend.zoektIndexOptions
tags: [private]
```

```Go
type zoektIndexOptions struct {
	// RepoID is the Sourcegraph Repository ID.
	RepoID int32

	// Public is true if the repository is public and does not require auth
	// filtering.
	Public bool

	// LargeFiles is a slice of glob patterns where matching file paths should
	// be indexed regardless of their size. The pattern syntax can be found
	// here: https://golang.org/pkg/path/filepath/#Match.
	LargeFiles []string

	// Symbols if true will make zoekt index the output of ctags.
	Symbols bool

	// Branches is a slice of branches to index.
	Branches []zoekt.RepositoryBranch `json:",omitempty"`

	// Priority indicates ranking in results, higher first.
	Priority float64 `json:",omitempty"`

	// Error if non-empty indicates the request failed for the repo.
	Error string `json:",omitempty"`
}
```

zoektIndexOptions are options which change what we index for a repository. Everytime a repository is indexed by zoekt this structure is fetched. See getIndexOptions in the zoekt codebase. 

We only specify a subset of the fields. 

### <a id="RepoIndexOptions" href="#RepoIndexOptions">type RepoIndexOptions struct</a>

```
searchKey: backend.RepoIndexOptions
```

```Go
type RepoIndexOptions struct {
	// RepoID is the Sourcegraph Repository ID.
	RepoID int32

	// Public is true if the repository is public and does not require auth
	// filtering.
	Public bool

	// Priority indicates ranking in results, higher first.
	Priority float64

	// GetVersion is used to resolve revisions for a repo. If it fails, the
	// error is encoded in the body. If the revision is missing, an empty
	// string should be returned rather than an error.
	GetVersion func(branch string) (string, error)
}
```

RepoIndexOptions are the options used by GetIndexOptions for a specific repository. 

### <a id="EndpointMap" href="#EndpointMap">type EndpointMap interface</a>

```
searchKey: backend.EndpointMap
```

```Go
type EndpointMap interface {
	// Endpoints returns a set of all addresses. Do not modify the returned value.
	Endpoints() (map[string]struct{}, error)
	// GetMany returns the endpoint for each key. (consistent hashing).
	GetMany(...string) ([]string, error)
}
```

EndpointMap is the subset of endpoint.Map (consistent hashmap) methods we use. Declared as an interface for testing. 

### <a id="Indexers" href="#Indexers">type Indexers struct</a>

```
searchKey: backend.Indexers
```

```Go
type Indexers struct {
	// Map is the desired mapping from repository names to endpoints.
	Map EndpointMap

	// Indexed returns a set of repository names currently indexed on
	// endpoint. If indexed fails, it is expected to return an empty set.
	Indexed func(ctx context.Context, endpoint string) map[string]struct{}
}
```

Indexers provides methods over the set of indexed-search servers in a Sourcegraph cluster. 

#### <a id="Indexers.ReposSubset" href="#Indexers.ReposSubset">func (c *Indexers) ReposSubset(ctx context.Context, hostname string, indexed map[string]struct{}, repoNames []string) ([]string, error)</a>

```
searchKey: backend.Indexers.ReposSubset
```

```Go
func (c *Indexers) ReposSubset(ctx context.Context, hostname string, indexed map[string]struct{}, repoNames []string) ([]string, error)
```

ReposSubset returns the subset of repoNames that hostname should index. 

ReposSubset reuses the underlying array of repoNames. 

indexed is the set of repositories currently indexed by hostname. 

An error is returned if hostname is not part of the Indexers endpoints. 

#### <a id="Indexers.Enabled" href="#Indexers.Enabled">func (c *Indexers) Enabled() bool</a>

```
searchKey: backend.Indexers.Enabled
```

```Go
func (c *Indexers) Enabled() bool
```

Enabled returns true if this feature is enabled. At first horizontal sharding will be disabled, if so the functions here fallback to single shard behaviour. 

### <a id="meteredSearcher" href="#meteredSearcher">type meteredSearcher struct</a>

```
searchKey: backend.meteredSearcher
tags: [private]
```

```Go
type meteredSearcher struct {
	zoekt.Streamer

	hostname string
}
```

#### <a id="meteredSearcher.StreamSearch" href="#meteredSearcher.StreamSearch">func (m *meteredSearcher) StreamSearch(ctx context.Context, q query.Q, opts *zoekt.SearchOptions, c zoekt.Sender) (err error)</a>

```
searchKey: backend.meteredSearcher.StreamSearch
tags: [private]
```

```Go
func (m *meteredSearcher) StreamSearch(ctx context.Context, q query.Q, opts *zoekt.SearchOptions, c zoekt.Sender) (err error)
```

#### <a id="meteredSearcher.Search" href="#meteredSearcher.Search">func (m *meteredSearcher) Search(ctx context.Context, q query.Q, opts *zoekt.SearchOptions) (*zoekt.SearchResult, error)</a>

```
searchKey: backend.meteredSearcher.Search
tags: [private]
```

```Go
func (m *meteredSearcher) Search(ctx context.Context, q query.Q, opts *zoekt.SearchOptions) (*zoekt.SearchResult, error)
```

#### <a id="meteredSearcher.List" href="#meteredSearcher.List">func (m *meteredSearcher) List(ctx context.Context, q query.Q) (*zoekt.RepoList, error)</a>

```
searchKey: backend.meteredSearcher.List
tags: [private]
```

```Go
func (m *meteredSearcher) List(ctx context.Context, q query.Q) (*zoekt.RepoList, error)
```

#### <a id="meteredSearcher.String" href="#meteredSearcher.String">func (m *meteredSearcher) String() string</a>

```
searchKey: backend.meteredSearcher.String
tags: [private]
```

```Go
func (m *meteredSearcher) String() string
```

### <a id="Zoekt" href="#Zoekt">type Zoekt struct</a>

```
searchKey: backend.Zoekt
```

```Go
type Zoekt struct {
	Client zoekt.Streamer

	// DisableCache when true prevents caching of Client.List. Useful in
	// tests.
	DisableCache bool

	mu       sync.RWMutex
	state    int32 // 0 not running, 1 running, 2 stopped
	set      map[string]*zoekt.Repository
	err      error
	disabled bool
}
```

Zoekt wraps a zoekt.Searcher. 

Note: Zoekt starts up background goroutines, so call Close when done using the Client. 

#### <a id="Zoekt.Close" href="#Zoekt.Close">func (c *Zoekt) Close()</a>

```
searchKey: backend.Zoekt.Close
```

```Go
func (c *Zoekt) Close()
```

Close will tear down the background goroutines. 

#### <a id="Zoekt.String" href="#Zoekt.String">func (c *Zoekt) String() string</a>

```
searchKey: backend.Zoekt.String
```

```Go
func (c *Zoekt) String() string
```

#### <a id="Zoekt.ListAll" href="#Zoekt.ListAll">func (c *Zoekt) ListAll(ctx context.Context) (map[string]*zoekt.Repository, error)</a>

```
searchKey: backend.Zoekt.ListAll
```

```Go
func (c *Zoekt) ListAll(ctx context.Context) (map[string]*zoekt.Repository, error)
```

ListAll returns the response of List without any restrictions. 

#### <a id="Zoekt.SetEnabled" href="#Zoekt.SetEnabled">func (c *Zoekt) SetEnabled(b bool)</a>

```
searchKey: backend.Zoekt.SetEnabled
```

```Go
func (c *Zoekt) SetEnabled(b bool)
```

SetEnabled will disable zoekt if b is false. 

#### <a id="Zoekt.Enabled" href="#Zoekt.Enabled">func (c *Zoekt) Enabled() bool</a>

```
searchKey: backend.Zoekt.Enabled
```

```Go
func (c *Zoekt) Enabled() bool
```

Enabled returns true if Zoekt is enabled. It is enabled if Client is non-nil and it hasn't been disabled by SetEnable. 

#### <a id="Zoekt.list" href="#Zoekt.list">func (c *Zoekt) list(ctx context.Context) (map[string]*zoekt.Repository, error)</a>

```
searchKey: backend.Zoekt.list
tags: [private]
```

```Go
func (c *Zoekt) list(ctx context.Context) (map[string]*zoekt.Repository, error)
```

#### <a id="Zoekt.start" href="#Zoekt.start">func (c *Zoekt) start()</a>

```
searchKey: backend.Zoekt.start
tags: [private]
```

```Go
func (c *Zoekt) start()
```

start starts a goroutine that keeps the listResp and listErr fields updated from the Zoekt server, as a local cache. 

### <a id="ZoektStreamFunc" href="#ZoektStreamFunc">type ZoektStreamFunc func(*github.com/google/zoekt.SearchResult)</a>

```
searchKey: backend.ZoektStreamFunc
```

```Go
type ZoektStreamFunc func(*zoekt.SearchResult)
```

ZoektStreamFunc is a convenience function to create a stream receiver from a function. 

#### <a id="ZoektStreamFunc.Send" href="#ZoektStreamFunc.Send">func (f ZoektStreamFunc) Send(event *zoekt.SearchResult)</a>

```
searchKey: backend.ZoektStreamFunc.Send
```

```Go
func (f ZoektStreamFunc) Send(event *zoekt.SearchResult)
```

### <a id="StreamSearchEvent" href="#StreamSearchEvent">type StreamSearchEvent struct</a>

```
searchKey: backend.StreamSearchEvent
```

```Go
type StreamSearchEvent struct {
	// SearchResult is non-nil if this event is a search result. These should be
	// combined with previous and later SearchResults.
	SearchResult *zoekt.SearchResult
}
```

StreamSearchEvent has fields optionally set representing events that happen during a search. 

This is a Sourcegraph extension. 

### <a id="StreamSearchAdapter" href="#StreamSearchAdapter">type StreamSearchAdapter struct</a>

```
searchKey: backend.StreamSearchAdapter
```

```Go
type StreamSearchAdapter struct {
	zoekt.Searcher
}
```

StreamSearchAdapter adapts a zoekt.Searcher to conform to the StreamSearch interface by calling zoekt.Searcher.Search. 

#### <a id="StreamSearchAdapter.StreamSearch" href="#StreamSearchAdapter.StreamSearch">func (s *StreamSearchAdapter) StreamSearch(ctx context.Context, q query.Q, opts *zoekt.SearchOptions, c zoekt.Sender) error</a>

```
searchKey: backend.StreamSearchAdapter.StreamSearch
```

```Go
func (s *StreamSearchAdapter) StreamSearch(ctx context.Context, q query.Q, opts *zoekt.SearchOptions, c zoekt.Sender) error
```

#### <a id="StreamSearchAdapter.String" href="#StreamSearchAdapter.String">func (s *StreamSearchAdapter) String() string</a>

```
searchKey: backend.StreamSearchAdapter.String
```

```Go
func (s *StreamSearchAdapter) String() string
```

### <a id="zoektStream" href="#zoektStream">type zoektStream struct</a>

```
searchKey: backend.zoektStream
tags: [private]
```

```Go
type zoektStream struct {
	zoekt.Searcher
	*zoektstream.Client
}
```

### <a id="mockSearcher" href="#mockSearcher">type mockSearcher struct</a>

```
searchKey: backend.mockSearcher
tags: [private]
```

```Go
type mockSearcher struct {
	searchResult *zoekt.SearchResult
	searchError  error
	listResult   *zoekt.RepoList
	listError    error
}
```

#### <a id="mockSearcher.Search" href="#mockSearcher.Search">func (s *mockSearcher) Search(context.Context, query.Q, *zoekt.SearchOptions) (*zoekt.SearchResult, error)</a>

```
searchKey: backend.mockSearcher.Search
tags: [private]
```

```Go
func (s *mockSearcher) Search(context.Context, query.Q, *zoekt.SearchOptions) (*zoekt.SearchResult, error)
```

#### <a id="mockSearcher.StreamSearch" href="#mockSearcher.StreamSearch">func (s *mockSearcher) StreamSearch(ctx context.Context, q query.Q, opts *zoekt.SearchOptions, streamer zoekt.Sender) error</a>

```
searchKey: backend.mockSearcher.StreamSearch
tags: [private]
```

```Go
func (s *mockSearcher) StreamSearch(ctx context.Context, q query.Q, opts *zoekt.SearchOptions, streamer zoekt.Sender) error
```

#### <a id="mockSearcher.List" href="#mockSearcher.List">func (s *mockSearcher) List(context.Context, query.Q) (*zoekt.RepoList, error)</a>

```
searchKey: backend.mockSearcher.List
tags: [private]
```

```Go
func (s *mockSearcher) List(context.Context, query.Q) (*zoekt.RepoList, error)
```

#### <a id="mockSearcher.Close" href="#mockSearcher.Close">func (*mockSearcher) Close()</a>

```
searchKey: backend.mockSearcher.Close
tags: [private]
```

```Go
func (*mockSearcher) Close()
```

#### <a id="mockSearcher.String" href="#mockSearcher.String">func (*mockSearcher) String() string</a>

```
searchKey: backend.mockSearcher.String
tags: [private]
```

```Go
func (*mockSearcher) String() string
```

### <a id="atomicMap" href="#atomicMap">type atomicMap struct</a>

```
searchKey: backend.atomicMap
tags: [private]
```

```Go
type atomicMap struct {
	atomic.Value
}
```

#### <a id="atomicMap.Endpoints" href="#atomicMap.Endpoints">func (m *atomicMap) Endpoints() (map[string]struct{}, error)</a>

```
searchKey: backend.atomicMap.Endpoints
tags: [private]
```

```Go
func (m *atomicMap) Endpoints() (map[string]struct{}, error)
```

#### <a id="atomicMap.GetMany" href="#atomicMap.GetMany">func (m *atomicMap) GetMany(keys ...string) ([]string, error)</a>

```
searchKey: backend.atomicMap.GetMany
tags: [private]
```

```Go
func (m *atomicMap) GetMany(keys ...string) ([]string, error)
```

### <a id="prefixMap" href="#prefixMap">type prefixMap []string</a>

```
searchKey: backend.prefixMap
tags: [private]
```

```Go
type prefixMap []string
```

prefixMap assigns keys to values if the value is a prefix of key. 

#### <a id="prefixMap.Endpoints" href="#prefixMap.Endpoints">func (m prefixMap) Endpoints() (map[string]struct{}, error)</a>

```
searchKey: backend.prefixMap.Endpoints
tags: [private]
```

```Go
func (m prefixMap) Endpoints() (map[string]struct{}, error)
```

#### <a id="prefixMap.GetMany" href="#prefixMap.GetMany">func (m prefixMap) GetMany(keys ...string) ([]string, error)</a>

```
searchKey: backend.prefixMap.GetMany
tags: [private]
```

```Go
func (m prefixMap) GetMany(keys ...string) ([]string, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="AggregateStreamSearch" href="#AggregateStreamSearch">func AggregateStreamSearch(ctx context.Context, streamSearch func(context.Context, query.Q, *zoekt.SearchOptions, zoekt.Sender) error, q query.Q, opts *zoekt.SearchOptions) (*zoekt.SearchResult, error)</a>

```
searchKey: backend.AggregateStreamSearch
```

```Go
func AggregateStreamSearch(ctx context.Context, streamSearch func(context.Context, query.Q, *zoekt.SearchOptions, zoekt.Sender) error, q query.Q, opts *zoekt.SearchOptions) (*zoekt.SearchResult, error)
```

AggregateStreamSearch aggregates the stream events into a single batch result. 

### <a id="equalKeys" href="#equalKeys">func equalKeys(a map[string]zoekt.Streamer, b map[string]struct{}) bool</a>

```
searchKey: backend.equalKeys
tags: [private]
```

```Go
func equalKeys(a map[string]zoekt.Streamer, b map[string]struct{}) bool
```

### <a id="GetIndexOptions" href="#GetIndexOptions">func GetIndexOptions(c *schema.SiteConfiguration,...</a>

```
searchKey: backend.GetIndexOptions
```

```Go
func GetIndexOptions(
	c *schema.SiteConfiguration,
	getRepoIndexOptions func(repo string) (*RepoIndexOptions, error),
	getSearchContextRevisions func(repoID int32) ([]string, error),
	repos ...string,
) []byte
```

GetIndexOptions returns a json blob for consumption by sourcegraph-zoekt-indexserver. It is for repos based on site settings c. 

### <a id="getIndexOptions" href="#getIndexOptions">func getIndexOptions(c *schema.SiteConfiguration,...</a>

```
searchKey: backend.getIndexOptions
tags: [private]
```

```Go
func getIndexOptions(
	c *schema.SiteConfiguration,
	repoName string,
	getRepoIndexOptions func(repo string) (*RepoIndexOptions, error),
	getSearchContextRevisions func(repo int32) ([]string, error),
) []byte
```

### <a id="getBoolPtr" href="#getBoolPtr">func getBoolPtr(b *bool, default_ bool) bool</a>

```
searchKey: backend.getBoolPtr
tags: [private]
```

```Go
func getBoolPtr(b *bool, default_ bool) bool
```

### <a id="marshal" href="#marshal">func marshal(o *zoektIndexOptions) []byte</a>

```
searchKey: backend.marshal
tags: [private]
```

```Go
func marshal(o *zoektIndexOptions) []byte
```

### <a id="findEndpoint" href="#findEndpoint">func findEndpoint(eps map[string]struct{}, hostname string) (string, error)</a>

```
searchKey: backend.findEndpoint
tags: [private]
```

```Go
func findEndpoint(eps map[string]struct{}, hostname string) (string, error)
```

findEndpoint returns the endpoint in eps which matches hostname. 

### <a id="endpointsString" href="#endpointsString">func endpointsString(m map[string]struct{}) string</a>

```
searchKey: backend.endpointsString
tags: [private]
```

```Go
func endpointsString(m map[string]struct{}) string
```

endpointsString creates a user readable String for an endpoint map. 

### <a id="NewMeteredSearcher" href="#NewMeteredSearcher">func NewMeteredSearcher(hostname string, z zoekt.Streamer) zoekt.Streamer</a>

```
searchKey: backend.NewMeteredSearcher
```

```Go
func NewMeteredSearcher(hostname string, z zoekt.Streamer) zoekt.Streamer
```

### <a id="queryString" href="#queryString">func queryString(q query.Q) string</a>

```
searchKey: backend.queryString
tags: [private]
```

```Go
func queryString(q query.Q) string
```

### <a id="randSleep" href="#randSleep">func randSleep(d, jitter time.Duration)</a>

```
searchKey: backend.randSleep
tags: [private]
```

```Go
func randSleep(d, jitter time.Duration)
```

randSleep will sleep for an expected d duration with a jitter in [-jitter / 2, jitter / 2]. 

### <a id="ZoektDial" href="#ZoektDial">func ZoektDial(endpoint string) zoekt.Streamer</a>

```
searchKey: backend.ZoektDial
```

```Go
func ZoektDial(endpoint string) zoekt.Streamer
```

ZoektDial connects to a Searcher HTTP RPC server at address (host:port). 

### <a id="TestHorizontalSearcher" href="#TestHorizontalSearcher">func TestHorizontalSearcher(t *testing.T)</a>

```
searchKey: backend.TestHorizontalSearcher
tags: [private]
```

```Go
func TestHorizontalSearcher(t *testing.T)
```

### <a id="TestDoStreamSearch" href="#TestDoStreamSearch">func TestDoStreamSearch(t *testing.T)</a>

```
searchKey: backend.TestDoStreamSearch
tags: [private]
```

```Go
func TestDoStreamSearch(t *testing.T)
```

### <a id="TestSyncSearchers" href="#TestSyncSearchers">func TestSyncSearchers(t *testing.T)</a>

```
searchKey: backend.TestSyncSearchers
tags: [private]
```

```Go
func TestSyncSearchers(t *testing.T)
```

### <a id="TestDedupper" href="#TestDedupper">func TestDedupper(t *testing.T)</a>

```
searchKey: backend.TestDedupper
tags: [private]
```

```Go
func TestDedupper(t *testing.T)
```

### <a id="BenchmarkDedup" href="#BenchmarkDedup">func BenchmarkDedup(b *testing.B)</a>

```
searchKey: backend.BenchmarkDedup
tags: [private]
```

```Go
func BenchmarkDedup(b *testing.B)
```

### <a id="backgroundSearch" href="#backgroundSearch">func backgroundSearch(searcher zoekt.Searcher) func(t *testing.T)</a>

```
searchKey: backend.backgroundSearch
tags: [private]
```

```Go
func backgroundSearch(searcher zoekt.Searcher) func(t *testing.T)
```

### <a id="TestGetIndexOptions" href="#TestGetIndexOptions">func TestGetIndexOptions(t *testing.T)</a>

```
searchKey: backend.TestGetIndexOptions
tags: [private]
```

```Go
func TestGetIndexOptions(t *testing.T)
```

### <a id="TestGetIndexOptions_getVersion" href="#TestGetIndexOptions_getVersion">func TestGetIndexOptions_getVersion(t *testing.T)</a>

```
searchKey: backend.TestGetIndexOptions_getVersion
tags: [private]
```

```Go
func TestGetIndexOptions_getVersion(t *testing.T)
```

### <a id="TestGetIndexOptions_batch" href="#TestGetIndexOptions_batch">func TestGetIndexOptions_batch(t *testing.T)</a>

```
searchKey: backend.TestGetIndexOptions_batch
tags: [private]
```

```Go
func TestGetIndexOptions_batch(t *testing.T)
```

### <a id="parseVersionContext" href="#parseVersionContext">func parseVersionContext(name string, repoRevStrs ...string) *schema.VersionContext</a>

```
searchKey: backend.parseVersionContext
tags: [private]
```

```Go
func parseVersionContext(name string, repoRevStrs ...string) *schema.VersionContext
```

### <a id="boolPtr" href="#boolPtr">func boolPtr(b bool) *bool</a>

```
searchKey: backend.boolPtr
tags: [private]
```

```Go
func boolPtr(b bool) *bool
```

### <a id="TestReposSubset" href="#TestReposSubset">func TestReposSubset(t *testing.T)</a>

```
searchKey: backend.TestReposSubset
tags: [private]
```

```Go
func TestReposSubset(t *testing.T)
```

### <a id="TestFindEndpoint" href="#TestFindEndpoint">func TestFindEndpoint(t *testing.T)</a>

```
searchKey: backend.TestFindEndpoint
tags: [private]
```

```Go
func TestFindEndpoint(t *testing.T)
```

