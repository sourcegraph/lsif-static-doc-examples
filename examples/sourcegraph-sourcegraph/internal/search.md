# Package search

Validation logic for CommitPatternInfo 

Validation logic for TextPatternInfo 

## Index

* Subpages
  * [internal/search/backend](search/backend.md)
  * [internal/search/filter](search/filter.md)
  * [internal/search/query](search/query.md)
  * [internal/search/repos](search/repos.md)
  * [internal/search/result](search/result.md)
  * [internal/search/run](search/run.md)
  * [internal/search/searchcontexts](search/searchcontexts.md)
  * [internal/search/searcher](search/searcher.md)
  * [internal/search/streaming](search/streaming.md)
  * [internal/search/zoekt](search/zoekt.md)
* [Constants](#const)
    * [const Batch](#Batch)
    * [const NoFilePath](#NoFilePath)
    * [const Pagination](#Pagination)
    * [const RepoStatusCloning](#RepoStatusCloning)
    * [const RepoStatusLimitHit](#RepoStatusLimitHit)
    * [const RepoStatusMissing](#RepoStatusMissing)
    * [const RepoStatusTimedout](#RepoStatusTimedout)
    * [const SearcherOnly](#SearcherOnly)
    * [const Streaming](#Streaming)
    * [const ZoektGlobalSearch](#ZoektGlobalSearch)
    * [const defaultMaxSearchResults](#defaultMaxSearchResults)
    * [const defaultMaxSearchResultsStreaming](#defaultMaxSearchResultsStreaming)
* [Variables](#var)
    * [var globalSearchModeStrings](#globalSearchModeStrings)
    * [var indexedSearch](#indexedSearch)
    * [var indexedSearchOnce](#indexedSearchOnce)
    * [var indexers](#indexers)
    * [var indexersOnce](#indexersOnce)
    * [var repoStatusName](#repoStatusName)
    * [var searcherURL](#searcherURL)
    * [var searcherURLs](#searcherURLs)
    * [var searcherURLsOnce](#searcherURLsOnce)
* [Types](#type)
    * [type CommitParameters struct](#CommitParameters)
        * [func (CommitParameters) typeParametersValue()](#CommitParameters.typeParametersValue)
    * [type CommitPatternInfo struct](#CommitPatternInfo)
        * [func (p *CommitPatternInfo) IsEmpty() bool](#CommitPatternInfo.IsEmpty)
        * [func (p *CommitPatternInfo) Validate() error](#CommitPatternInfo.Validate)
    * [type DiffParameters struct](#DiffParameters)
        * [func (DiffParameters) typeParametersValue()](#DiffParameters.typeParametersValue)
    * [type GlobalSearchMode int](#GlobalSearchMode)
        * [func (m GlobalSearchMode) String() string](#GlobalSearchMode.String)
    * [type Promise struct](#Promise)
        * [func (p *Promise) Get(ctx context.Context) (interface{}, error)](#Promise.Get)
        * [func (p *Promise) Resolve(v interface{}) *Promise](#Promise.Resolve)
        * [func (p *Promise) init()](#Promise.init.promise.go)
    * [type Protocol int](#Protocol)
    * [type RepoStatus uint8](#RepoStatus)
        * [func (s RepoStatus) String() string](#RepoStatus.String)
    * [type RepoStatusMap struct](#RepoStatusMap)
        * [func RepoStatusSingleton(id api.RepoID, status RepoStatus) RepoStatusMap](#RepoStatusSingleton)
        * [func mkStatusMap(m map[api.RepoID]RepoStatus) RepoStatusMap](#mkStatusMap)
        * [func (m *RepoStatusMap) All(status RepoStatus) bool](#RepoStatusMap.All)
        * [func (m *RepoStatusMap) Any(mask RepoStatus) bool](#RepoStatusMap.Any)
        * [func (m *RepoStatusMap) Filter(mask RepoStatus, f func(api.RepoID))](#RepoStatusMap.Filter)
        * [func (m *RepoStatusMap) Get(id api.RepoID) RepoStatus](#RepoStatusMap.Get)
        * [func (m *RepoStatusMap) Iterate(f func(api.RepoID, RepoStatus))](#RepoStatusMap.Iterate)
        * [func (m *RepoStatusMap) Len() int](#RepoStatusMap.Len)
        * [func (m *RepoStatusMap) String() string](#RepoStatusMap.String)
        * [func (m *RepoStatusMap) Union(o *RepoStatusMap)](#RepoStatusMap.Union)
        * [func (m *RepoStatusMap) Update(id api.RepoID, status RepoStatus)](#RepoStatusMap.Update)
    * [type RepositoryRevisions struct](#RepositoryRevisions)
        * [func (r *RepositoryRevisions) Copy() *RepositoryRevisions](#RepositoryRevisions.Copy)
        * [func (r *RepositoryRevisions) Equal(other *RepositoryRevisions) bool](#RepositoryRevisions.Equal)
        * [func (r *RepositoryRevisions) ExpandedRevSpecs(ctx context.Context) ([]string, error)](#RepositoryRevisions.ExpandedRevSpecs)
        * [func (r *RepositoryRevisions) GitserverRepo() api.RepoName](#RepositoryRevisions.GitserverRepo)
        * [func (r *RepositoryRevisions) OnlyExplicit() bool](#RepositoryRevisions.OnlyExplicit)
        * [func (r *RepositoryRevisions) RevSpecs() []string](#RepositoryRevisions.RevSpecs)
        * [func (r *RepositoryRevisions) String() string](#RepositoryRevisions.String)
    * [type RevisionSpecifier struct](#RevisionSpecifier)
        * [func parseRev(spec string) RevisionSpecifier](#parseRev)
        * [func (r1 RevisionSpecifier) Less(r2 RevisionSpecifier) bool](#RevisionSpecifier.Less)
        * [func (r1 RevisionSpecifier) String() string](#RevisionSpecifier.String)
    * [type SymbolsParameters struct](#SymbolsParameters)
        * [func (SymbolsParameters) typeParametersValue()](#SymbolsParameters.typeParametersValue)
    * [type TextParameters struct](#TextParameters)
        * [func (TextParameters) typeParametersValue()](#TextParameters.typeParametersValue)
    * [type TextParametersForCommitParameters struct](#TextParametersForCommitParameters)
    * [type TextPatternInfo struct](#TextPatternInfo)
        * [func ToTextPatternInfo(q query.Basic, p Protocol, transform query.BasicPass) *TextPatternInfo](#ToTextPatternInfo)
        * [func (p *TextPatternInfo) IsEmpty() bool](#TextPatternInfo.IsEmpty)
        * [func (p *TextPatternInfo) String() string](#TextPatternInfo.String)
        * [func (p *TextPatternInfo) Validate() error](#TextPatternInfo.Validate)
    * [type TypeParameters interface](#TypeParameters)
* [Functions](#func)
    * [func IncludeExcludeValues(q query.Basic, field string) (include, exclude []string)](#IncludeExcludeValues)
    * [func Indexed() *backend.Zoekt](#Indexed)
    * [func Indexers() *backend.Indexers](#Indexers)
    * [func ParseRepositoryRevisions(repoAndOptionalRev string) (string, []RevisionSpecifier)](#ParseRepositoryRevisions)
    * [func SearcherURLs() *endpoint.Map](#SearcherURLs)
    * [func TestParseRepositoryRevisions(t *testing.T)](#TestParseRepositoryRevisions)
    * [func TestPromiseGet(t *testing.T)](#TestPromiseGet)
    * [func TestPromiseGetConcurrent(t *testing.T)](#TestPromiseGetConcurrent)
    * [func TestPromiseGetWithCancel(t *testing.T)](#TestPromiseGetWithCancel)
    * [func TestRepoStatusMap(t *testing.T)](#TestRepoStatusMap)
    * [func TestRepoStatusMap_nil(t *testing.T)](#TestRepoStatusMap_nil)
    * [func TestRepoStatusSingleton(t *testing.T)](#TestRepoStatusSingleton)
    * [func TestToTextPatternInfo(t *testing.T)](#TestToTextPatternInfo)
    * [func TestZoektAddr(t *testing.T)](#TestZoektAddr)
    * [func assertReposStatusEqual(t *testing.T, want, got RepoStatusMap)](#assertReposStatusEqual)
    * [func count(q query.Basic, p Protocol) int](#count)
    * [func expandedRevSpec(ctx context.Context, r *RepositoryRevisions) ([]string, error)](#expandedRevSpec)
    * [func getEnv(environ []string, key string) (string, bool)](#getEnv)
    * [func langToFileRegexp(lang string) string](#langToFileRegexp)
    * [func mapSlice(values []string, f func(string) string) []string](#mapSlice)
    * [func overrideSearchType(input string, searchType query.SearchType) query.SearchType](#overrideSearchType)
    * [func reposAtEndpoint(ctx context.Context, endpoint string) map[string]struct{}](#reposAtEndpoint)
    * [func unionRegexp(values []string) string](#unionRegexp)
    * [func zoektAddr(environ []string) string](#zoektAddr)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="Batch" href="#Batch">const Batch</a>

```
searchKey: search.Batch
tags: [constant number]
```

```Go
const Batch
```

### <a id="NoFilePath" href="#NoFilePath">const NoFilePath</a>

```
searchKey: search.NoFilePath
tags: [constant number]
```

```Go
const NoFilePath
```

Disables file/path search. Used only in conjunction with ZoektGlobalSearch on Sourcegraph.com. 

### <a id="Pagination" href="#Pagination">const Pagination</a>

```
searchKey: search.Pagination
tags: [constant number]
```

```Go
const Pagination
```

### <a id="RepoStatusCloning" href="#RepoStatusCloning">const RepoStatusCloning</a>

```
searchKey: search.RepoStatusCloning
tags: [constant number]
```

```Go
const RepoStatusCloning RepoStatus // could not be searched because they were still being cloned
 = ...
```

### <a id="RepoStatusLimitHit" href="#RepoStatusLimitHit">const RepoStatusLimitHit</a>

```
searchKey: search.RepoStatusLimitHit
tags: [constant number]
```

```Go
const RepoStatusLimitHit // searched, but have results that were not returned due to exceeded limits
 = ...
```

### <a id="RepoStatusMissing" href="#RepoStatusMissing">const RepoStatusMissing</a>

```
searchKey: search.RepoStatusMissing
tags: [constant number]
```

```Go
const RepoStatusMissing // could not be searched because they do not exist

```

### <a id="RepoStatusTimedout" href="#RepoStatusTimedout">const RepoStatusTimedout</a>

```
searchKey: search.RepoStatusTimedout
tags: [constant number]
```

```Go
const RepoStatusTimedout // repos that were not searched due to timeout

```

### <a id="SearcherOnly" href="#SearcherOnly">const SearcherOnly</a>

```
searchKey: search.SearcherOnly
tags: [constant number]
```

```Go
const SearcherOnly
```

SearcherOnly designated a code path on which we skip indexed search, even if the user specified index:yes. SearcherOnly is used in conjunction with ZoektGlobalSearch and designates the non-indexed part of the performance optimised code path. 

### <a id="Streaming" href="#Streaming">const Streaming</a>

```
searchKey: search.Streaming
tags: [constant number]
```

```Go
const Streaming Protocol = iota
```

### <a id="ZoektGlobalSearch" href="#ZoektGlobalSearch">const ZoektGlobalSearch</a>

```
searchKey: search.ZoektGlobalSearch
tags: [constant number]
```

```Go
const ZoektGlobalSearch GlobalSearchMode = iota + 1
```

ZoektGlobalSearch designates a performance optimised code path for indexed searches. For a global search we don't need to resolve repos before searching shards on Zoekt, instead we can resolve repos and call Zoekt concurrently. 

Note: Even for a global search we have to resolve repos to filter search results returned by Zoekt. 

### <a id="defaultMaxSearchResults" href="#defaultMaxSearchResults">const defaultMaxSearchResults</a>

```
searchKey: search.defaultMaxSearchResults
tags: [constant number private]
```

```Go
const defaultMaxSearchResults = 30
```

### <a id="defaultMaxSearchResultsStreaming" href="#defaultMaxSearchResultsStreaming">const defaultMaxSearchResultsStreaming</a>

```
searchKey: search.defaultMaxSearchResultsStreaming
tags: [constant number private]
```

```Go
const defaultMaxSearchResultsStreaming = 500
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="globalSearchModeStrings" href="#globalSearchModeStrings">var globalSearchModeStrings</a>

```
searchKey: search.globalSearchModeStrings
tags: [variable object private]
```

```Go
var globalSearchModeStrings = ...
```

### <a id="indexedSearch" href="#indexedSearch">var indexedSearch</a>

```
searchKey: search.indexedSearch
tags: [variable struct private]
```

```Go
var indexedSearch *backend.Zoekt
```

### <a id="indexedSearchOnce" href="#indexedSearchOnce">var indexedSearchOnce</a>

```
searchKey: search.indexedSearchOnce
tags: [variable struct private]
```

```Go
var indexedSearchOnce sync.Once
```

### <a id="indexers" href="#indexers">var indexers</a>

```
searchKey: search.indexers
tags: [variable struct private]
```

```Go
var indexers *backend.Indexers
```

### <a id="indexersOnce" href="#indexersOnce">var indexersOnce</a>

```
searchKey: search.indexersOnce
tags: [variable struct private]
```

```Go
var indexersOnce sync.Once
```

### <a id="repoStatusName" href="#repoStatusName">var repoStatusName</a>

```
searchKey: search.repoStatusName
tags: [variable array struct private]
```

```Go
var repoStatusName = ...
```

### <a id="searcherURL" href="#searcherURL">var searcherURL</a>

```
searchKey: search.searcherURL
tags: [variable string private]
```

```Go
var searcherURL = env.Get("SEARCHER_URL", "k8s+http://searcher:3181", "searcher server URL")
```

### <a id="searcherURLs" href="#searcherURLs">var searcherURLs</a>

```
searchKey: search.searcherURLs
tags: [variable struct private]
```

```Go
var searcherURLs *endpoint.Map
```

### <a id="searcherURLsOnce" href="#searcherURLsOnce">var searcherURLsOnce</a>

```
searchKey: search.searcherURLsOnce
tags: [variable struct private]
```

```Go
var searcherURLsOnce sync.Once
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="CommitParameters" href="#CommitParameters">type CommitParameters struct</a>

```
searchKey: search.CommitParameters
tags: [struct]
```

```Go
type CommitParameters struct {
	RepoRevs           *RepositoryRevisions
	PatternInfo        *CommitPatternInfo
	Query              query.Q
	Diff               bool
	ExtraMessageValues []string
}
```

#### <a id="CommitParameters.typeParametersValue" href="#CommitParameters.typeParametersValue">func (CommitParameters) typeParametersValue()</a>

```
searchKey: search.CommitParameters.typeParametersValue
tags: [method private]
```

```Go
func (CommitParameters) typeParametersValue()
```

### <a id="CommitPatternInfo" href="#CommitPatternInfo">type CommitPatternInfo struct</a>

```
searchKey: search.CommitPatternInfo
tags: [struct]
```

```Go
type CommitPatternInfo struct {
	Pattern         string
	IsRegExp        bool
	IsCaseSensitive bool
	FileMatchLimit  int32

	IncludePatterns []string
	ExcludePattern  string

	PathPatternsAreRegExps       bool
	PathPatternsAreCaseSensitive bool
}
```

CommitPatternInfo is the data type that describes the properties of a pattern used for commit search. 

#### <a id="CommitPatternInfo.IsEmpty" href="#CommitPatternInfo.IsEmpty">func (p *CommitPatternInfo) IsEmpty() bool</a>

```
searchKey: search.CommitPatternInfo.IsEmpty
tags: [method]
```

```Go
func (p *CommitPatternInfo) IsEmpty() bool
```

#### <a id="CommitPatternInfo.Validate" href="#CommitPatternInfo.Validate">func (p *CommitPatternInfo) Validate() error</a>

```
searchKey: search.CommitPatternInfo.Validate
tags: [method]
```

```Go
func (p *CommitPatternInfo) Validate() error
```

### <a id="DiffParameters" href="#DiffParameters">type DiffParameters struct</a>

```
searchKey: search.DiffParameters
tags: [struct]
```

```Go
type DiffParameters struct {
	Repo    api.RepoName
	Options git.RawLogDiffSearchOptions
}
```

#### <a id="DiffParameters.typeParametersValue" href="#DiffParameters.typeParametersValue">func (DiffParameters) typeParametersValue()</a>

```
searchKey: search.DiffParameters.typeParametersValue
tags: [method private]
```

```Go
func (DiffParameters) typeParametersValue()
```

### <a id="GlobalSearchMode" href="#GlobalSearchMode">type GlobalSearchMode int</a>

```
searchKey: search.GlobalSearchMode
tags: [number]
```

```Go
type GlobalSearchMode int
```

GlobalSearchMode designates code paths which optimize performance for global searches, i.e., literal or regexp, indexed searches without repo: filter. 

#### <a id="GlobalSearchMode.String" href="#GlobalSearchMode.String">func (m GlobalSearchMode) String() string</a>

```
searchKey: search.GlobalSearchMode.String
tags: [method]
```

```Go
func (m GlobalSearchMode) String() string
```

### <a id="Promise" href="#Promise">type Promise struct</a>

```
searchKey: search.Promise
tags: [struct]
```

```Go
type Promise struct {
	initOnce sync.Once
	done     chan struct{}

	valueOnce sync.Once
	value     interface{}
}
```

#### <a id="Promise.Get" href="#Promise.Get">func (p *Promise) Get(ctx context.Context) (interface{}, error)</a>

```
searchKey: search.Promise.Get
tags: [method]
```

```Go
func (p *Promise) Get(ctx context.Context) (interface{}, error)
```

Get returns the value. It blocks until the promise resolves or the context is canceled. 

#### <a id="Promise.Resolve" href="#Promise.Resolve">func (p *Promise) Resolve(v interface{}) *Promise</a>

```
searchKey: search.Promise.Resolve
tags: [method]
```

```Go
func (p *Promise) Resolve(v interface{}) *Promise
```

Resolve returns a promise that is resolved with a given value. 

#### <a id="Promise.init.promise.go" href="#Promise.init.promise.go">func (p *Promise) init()</a>

```
searchKey: search.Promise.init
tags: [method private]
```

```Go
func (p *Promise) init()
```

### <a id="Protocol" href="#Protocol">type Protocol int</a>

```
searchKey: search.Protocol
tags: [number]
```

```Go
type Protocol int
```

### <a id="RepoStatus" href="#RepoStatus">type RepoStatus uint8</a>

```
searchKey: search.RepoStatus
tags: [number]
```

```Go
type RepoStatus uint8
```

RepoStatus is a bit flag encoding the status of a search on a repository. A repository can be in many states, so any bit may be set. 

#### <a id="RepoStatus.String" href="#RepoStatus.String">func (s RepoStatus) String() string</a>

```
searchKey: search.RepoStatus.String
tags: [method]
```

```Go
func (s RepoStatus) String() string
```

### <a id="RepoStatusMap" href="#RepoStatusMap">type RepoStatusMap struct</a>

```
searchKey: search.RepoStatusMap
tags: [struct]
```

```Go
type RepoStatusMap struct {
	m map[api.RepoID]RepoStatus

	// status is a union of all repo status.
	status RepoStatus
}
```

RepoStatusMap is a mutable map from repository IDs to a union of RepoStatus. 

#### <a id="RepoStatusSingleton" href="#RepoStatusSingleton">func RepoStatusSingleton(id api.RepoID, status RepoStatus) RepoStatusMap</a>

```
searchKey: search.RepoStatusSingleton
tags: [function]
```

```Go
func RepoStatusSingleton(id api.RepoID, status RepoStatus) RepoStatusMap
```

RepoStatusSingleton is a convenience function to contain a RepoStatusMap with one entry. 

#### <a id="mkStatusMap" href="#mkStatusMap">func mkStatusMap(m map[api.RepoID]RepoStatus) RepoStatusMap</a>

```
searchKey: search.mkStatusMap
tags: [function private]
```

```Go
func mkStatusMap(m map[api.RepoID]RepoStatus) RepoStatusMap
```

#### <a id="RepoStatusMap.All" href="#RepoStatusMap.All">func (m *RepoStatusMap) All(status RepoStatus) bool</a>

```
searchKey: search.RepoStatusMap.All
tags: [method]
```

```Go
func (m *RepoStatusMap) All(status RepoStatus) bool
```

All returns true if all entries contain status. 

#### <a id="RepoStatusMap.Any" href="#RepoStatusMap.Any">func (m *RepoStatusMap) Any(mask RepoStatus) bool</a>

```
searchKey: search.RepoStatusMap.Any
tags: [method]
```

```Go
func (m *RepoStatusMap) Any(mask RepoStatus) bool
```

Any returns true if there are any entries which contain a status in mask. 

#### <a id="RepoStatusMap.Filter" href="#RepoStatusMap.Filter">func (m *RepoStatusMap) Filter(mask RepoStatus, f func(api.RepoID))</a>

```
searchKey: search.RepoStatusMap.Filter
tags: [method]
```

```Go
func (m *RepoStatusMap) Filter(mask RepoStatus, f func(api.RepoID))
```

Filter calls f for each repo RepoID where mask is a subset of the repo status. 

#### <a id="RepoStatusMap.Get" href="#RepoStatusMap.Get">func (m *RepoStatusMap) Get(id api.RepoID) RepoStatus</a>

```
searchKey: search.RepoStatusMap.Get
tags: [method]
```

```Go
func (m *RepoStatusMap) Get(id api.RepoID) RepoStatus
```

Get returns the RepoStatus for id. 

#### <a id="RepoStatusMap.Iterate" href="#RepoStatusMap.Iterate">func (m *RepoStatusMap) Iterate(f func(api.RepoID, RepoStatus))</a>

```
searchKey: search.RepoStatusMap.Iterate
tags: [method]
```

```Go
func (m *RepoStatusMap) Iterate(f func(api.RepoID, RepoStatus))
```

Iterate will call f for each RepoID in m. 

#### <a id="RepoStatusMap.Len" href="#RepoStatusMap.Len">func (m *RepoStatusMap) Len() int</a>

```
searchKey: search.RepoStatusMap.Len
tags: [method]
```

```Go
func (m *RepoStatusMap) Len() int
```

Len is the number of entries in the map. 

#### <a id="RepoStatusMap.String" href="#RepoStatusMap.String">func (m *RepoStatusMap) String() string</a>

```
searchKey: search.RepoStatusMap.String
tags: [method]
```

```Go
func (m *RepoStatusMap) String() string
```

#### <a id="RepoStatusMap.Union" href="#RepoStatusMap.Union">func (m *RepoStatusMap) Union(o *RepoStatusMap)</a>

```
searchKey: search.RepoStatusMap.Union
tags: [method]
```

```Go
func (m *RepoStatusMap) Union(o *RepoStatusMap)
```

Union is a fast path for calling m.Update on all entries in o. 

#### <a id="RepoStatusMap.Update" href="#RepoStatusMap.Update">func (m *RepoStatusMap) Update(id api.RepoID, status RepoStatus)</a>

```
searchKey: search.RepoStatusMap.Update
tags: [method]
```

```Go
func (m *RepoStatusMap) Update(id api.RepoID, status RepoStatus)
```

Update unions status for id with the current status. 

### <a id="RepositoryRevisions" href="#RepositoryRevisions">type RepositoryRevisions struct</a>

```
searchKey: search.RepositoryRevisions
tags: [struct]
```

```Go
type RepositoryRevisions struct {
	Repo types.RepoName
	Revs []RevisionSpecifier

	// resolveOnce protects resolvedRevs
	resolveOnce sync.Once

	// resolvedRevs is set by ExpandedRevSpecs and contains all revisions
	// including resolved ref-globs.
	resolvedRevs []string

	// resolveErr stores the error returned by the first call to ExpandedRevSpecs. It
	// gives the caller the chance to distinguish between an error and an empty resolvedRevs.
	resolveErr error

	// ListRefs is called to list all Git refs for a repository. It is intended to be mocked by
	// tests. If nil, git.ListRefs is used.
	ListRefs func(context.Context, api.RepoName) ([]git.Ref, error)
}
```

RepositoryRevisions specifies a repository and 0 or more revspecs and ref globs.  If no revspecs and no ref globs are specified, then the repository's default branch is used. 

#### <a id="RepositoryRevisions.Copy" href="#RepositoryRevisions.Copy">func (r *RepositoryRevisions) Copy() *RepositoryRevisions</a>

```
searchKey: search.RepositoryRevisions.Copy
tags: [method]
```

```Go
func (r *RepositoryRevisions) Copy() *RepositoryRevisions
```

#### <a id="RepositoryRevisions.Equal" href="#RepositoryRevisions.Equal">func (r *RepositoryRevisions) Equal(other *RepositoryRevisions) bool</a>

```
searchKey: search.RepositoryRevisions.Equal
tags: [method]
```

```Go
func (r *RepositoryRevisions) Equal(other *RepositoryRevisions) bool
```

Equal provides custom comparison which is used by go-cmp 

#### <a id="RepositoryRevisions.ExpandedRevSpecs" href="#RepositoryRevisions.ExpandedRevSpecs">func (r *RepositoryRevisions) ExpandedRevSpecs(ctx context.Context) ([]string, error)</a>

```
searchKey: search.RepositoryRevisions.ExpandedRevSpecs
tags: [method]
```

```Go
func (r *RepositoryRevisions) ExpandedRevSpecs(ctx context.Context) ([]string, error)
```

ExpandedRevSpecs is a wrapper around expandedRevSpecs. It uses a sync.Once to ensure we only resolve revisions once. The resolved revisions and the error response are stored in r and returned to future callers. 

Note that storing the error causes all callers to return the same error. For example, if the first caller has a context error, all other callers will return a context error, too. 

Not all callers need to expand ref glob expressions. If a caller is passing the ref globs as command-line args to `git` directly (e.g., to `git log --glob ... --exclude ...`), it does not need to use this function. 

#### <a id="RepositoryRevisions.GitserverRepo" href="#RepositoryRevisions.GitserverRepo">func (r *RepositoryRevisions) GitserverRepo() api.RepoName</a>

```
searchKey: search.RepositoryRevisions.GitserverRepo
tags: [method]
```

```Go
func (r *RepositoryRevisions) GitserverRepo() api.RepoName
```

GitserverRepo is a convenience function to return the api.RepoName for r.Repo. The returned Repo will not have the URL set, only the name. 

#### <a id="RepositoryRevisions.OnlyExplicit" href="#RepositoryRevisions.OnlyExplicit">func (r *RepositoryRevisions) OnlyExplicit() bool</a>

```
searchKey: search.RepositoryRevisions.OnlyExplicit
tags: [method]
```

```Go
func (r *RepositoryRevisions) OnlyExplicit() bool
```

OnlyExplicit returns true if all revspecs in Revs are explicit. 

#### <a id="RepositoryRevisions.RevSpecs" href="#RepositoryRevisions.RevSpecs">func (r *RepositoryRevisions) RevSpecs() []string</a>

```
searchKey: search.RepositoryRevisions.RevSpecs
tags: [method]
```

```Go
func (r *RepositoryRevisions) RevSpecs() []string
```

RevSpecs returns a list of all explicitly listed Git revspecs. It does not expand ref globs to their matching revspecs. 

#### <a id="RepositoryRevisions.String" href="#RepositoryRevisions.String">func (r *RepositoryRevisions) String() string</a>

```
searchKey: search.RepositoryRevisions.String
tags: [method]
```

```Go
func (r *RepositoryRevisions) String() string
```

### <a id="RevisionSpecifier" href="#RevisionSpecifier">type RevisionSpecifier struct</a>

```
searchKey: search.RevisionSpecifier
tags: [struct]
```

```Go
type RevisionSpecifier struct {
	// RevSpec is a revision range specifier suitable for passing to git. See
	// the manpage gitrevisions(7).
	RevSpec string

	// RefGlob is a reference glob to pass to git. See the documentation for
	// "--glob" in git-log.
	RefGlob string

	// ExcludeRefGlob is a glob for references to exclude. See the
	// documentation for "--exclude" in git-log.
	ExcludeRefGlob string
}
```

RevisionSpecifier represents either a revspec or a ref glob. At most one field is set. The default branch is represented by all fields being empty. 

#### <a id="parseRev" href="#parseRev">func parseRev(spec string) RevisionSpecifier</a>

```
searchKey: search.parseRev
tags: [function private]
```

```Go
func parseRev(spec string) RevisionSpecifier
```

#### <a id="RevisionSpecifier.Less" href="#RevisionSpecifier.Less">func (r1 RevisionSpecifier) Less(r2 RevisionSpecifier) bool</a>

```
searchKey: search.RevisionSpecifier.Less
tags: [method]
```

```Go
func (r1 RevisionSpecifier) Less(r2 RevisionSpecifier) bool
```

Less compares two revspecOrRefGlob entities, suitable for use with sort.Slice() 

possibly-undesired: this results in treating an entity with no revspec, but a refGlob, as "earlier" than any revspec. 

#### <a id="RevisionSpecifier.String" href="#RevisionSpecifier.String">func (r1 RevisionSpecifier) String() string</a>

```
searchKey: search.RevisionSpecifier.String
tags: [method]
```

```Go
func (r1 RevisionSpecifier) String() string
```

### <a id="SymbolsParameters" href="#SymbolsParameters">type SymbolsParameters struct</a>

```
searchKey: search.SymbolsParameters
tags: [struct]
```

```Go
type SymbolsParameters struct {
	// Repo is the name of the repository to search in.
	Repo api.RepoName `json:"repo"`

	// CommitID is the commit to search in.
	CommitID api.CommitID `json:"commitID"`

	// Query is the search query.
	Query string

	// IsRegExp if true will treat the Pattern as a regular expression.
	IsRegExp bool

	// IsCaseSensitive if false will ignore the case of query and file pattern
	// when finding matches.
	IsCaseSensitive bool

	// IncludePatterns is a list of regexes that symbol's file paths
	// need to match to get included in the result
	//
	// The patterns are ANDed together; a file's path must match all patterns
	// for it to be kept. That is also why it is a list (unlike the singular
	// ExcludePattern); it is not possible in general to construct a single
	// glob or Go regexp that represents multiple such patterns ANDed together.
	IncludePatterns []string

	// ExcludePattern is an optional regex that symbol's file paths
	// need to match to get included in the result
	ExcludePattern string

	// First indicates that only the first n symbols should be returned.
	First int
}
```

#### <a id="SymbolsParameters.typeParametersValue" href="#SymbolsParameters.typeParametersValue">func (SymbolsParameters) typeParametersValue()</a>

```
searchKey: search.SymbolsParameters.typeParametersValue
tags: [method private]
```

```Go
func (SymbolsParameters) typeParametersValue()
```

### <a id="TextParameters" href="#TextParameters">type TextParameters struct</a>

```
searchKey: search.TextParameters
tags: [struct]
```

```Go
type TextParameters struct {
	PatternInfo *TextPatternInfo

	// Performance optimization: For global queries, resolving repositories and
	// querying zoekt happens concurrently.
	RepoPromise *Promise
	Mode        GlobalSearchMode

	// Query is the parsed query from the user. You should be using Pattern
	// instead, but Query is useful for checking extra fields that are set and
	// ignored by Pattern, such as index:no
	Query query.Q

	// UseFullDeadline indicates that the search should try do as much work as
	// it can within context.Deadline. If false the search should try and be
	// as fast as possible, even if a "slow" deadline is set.
	//
	// For example searcher will wait to full its archive cache for a
	// repository if this field is true. Another example is we set this field
	// to true if the user requests a specific timeout or maximum result size.
	UseFullDeadline bool

	Zoekt        *searchbackend.Zoekt
	SearcherURLs *endpoint.Map
}
```

TextParameters are the parameters passed to a search backend. It contains the Pattern to search for, as well as the hydrated list of repository revisions to search. It defines behavior for text search on repository names, file names, and file content. 

#### <a id="TextParameters.typeParametersValue" href="#TextParameters.typeParametersValue">func (TextParameters) typeParametersValue()</a>

```
searchKey: search.TextParameters.typeParametersValue
tags: [method private]
```

```Go
func (TextParameters) typeParametersValue()
```

### <a id="TextParametersForCommitParameters" href="#TextParametersForCommitParameters">type TextParametersForCommitParameters struct</a>

```
searchKey: search.TextParametersForCommitParameters
tags: [struct]
```

```Go
type TextParametersForCommitParameters struct {
	PatternInfo *CommitPatternInfo
	Repos       []*RepositoryRevisions
	Query       query.Q
}
```

TextParametersForCommitParameters is an intermediate type based on TextParameters that encodes parameters exclusively for a commit search. The commit search internals converts this type to CommitParameters. The commitParameter type definitions will be merged in future. 

### <a id="TextPatternInfo" href="#TextPatternInfo">type TextPatternInfo struct</a>

```
searchKey: search.TextPatternInfo
tags: [struct]
```

```Go
type TextPatternInfo struct {
	Pattern         string
	IsNegated       bool
	IsRegExp        bool
	IsStructuralPat bool
	CombyRule       string
	IsWordMatch     bool
	IsCaseSensitive bool
	FileMatchLimit  int32
	Index           query.YesNoOnly
	Select          filter.SelectPath

	// We do not support IsMultiline
	// IsMultiline     bool
	IncludePatterns []string
	ExcludePattern  string

	FilePatternsReposMustInclude []string
	FilePatternsReposMustExclude []string

	PathPatternsAreCaseSensitive bool

	PatternMatchesContent bool
	PatternMatchesPath    bool

	Languages []string
}
```

TextPatternInfo is the struct used by vscode pass on search queries. Keep it in sync with pkg/searcher/protocol.PatternInfo. 

#### <a id="ToTextPatternInfo" href="#ToTextPatternInfo">func ToTextPatternInfo(q query.Basic, p Protocol, transform query.BasicPass) *TextPatternInfo</a>

```
searchKey: search.ToTextPatternInfo
tags: [function]
```

```Go
func ToTextPatternInfo(q query.Basic, p Protocol, transform query.BasicPass) *TextPatternInfo
```

ToTextPatternInfo converts a an atomic query to internal values that drive text search. An atomic query is a Basic query where the Pattern is either nil, or comprises only one Pattern node (hence, an atom, and not an expression). See TextPatternInfo for the values it computes and populates. 

#### <a id="TextPatternInfo.IsEmpty" href="#TextPatternInfo.IsEmpty">func (p *TextPatternInfo) IsEmpty() bool</a>

```
searchKey: search.TextPatternInfo.IsEmpty
tags: [method]
```

```Go
func (p *TextPatternInfo) IsEmpty() bool
```

#### <a id="TextPatternInfo.String" href="#TextPatternInfo.String">func (p *TextPatternInfo) String() string</a>

```
searchKey: search.TextPatternInfo.String
tags: [method]
```

```Go
func (p *TextPatternInfo) String() string
```

#### <a id="TextPatternInfo.Validate" href="#TextPatternInfo.Validate">func (p *TextPatternInfo) Validate() error</a>

```
searchKey: search.TextPatternInfo.Validate
tags: [method]
```

```Go
func (p *TextPatternInfo) Validate() error
```

### <a id="TypeParameters" href="#TypeParameters">type TypeParameters interface</a>

```
searchKey: search.TypeParameters
tags: [interface]
```

```Go
type TypeParameters interface {
	typeParametersValue()
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="IncludeExcludeValues" href="#IncludeExcludeValues">func IncludeExcludeValues(q query.Basic, field string) (include, exclude []string)</a>

```
searchKey: search.IncludeExcludeValues
tags: [function]
```

```Go
func IncludeExcludeValues(q query.Basic, field string) (include, exclude []string)
```

### <a id="Indexed" href="#Indexed">func Indexed() *backend.Zoekt</a>

```
searchKey: search.Indexed
tags: [function]
```

```Go
func Indexed() *backend.Zoekt
```

### <a id="Indexers" href="#Indexers">func Indexers() *backend.Indexers</a>

```
searchKey: search.Indexers
tags: [function]
```

```Go
func Indexers() *backend.Indexers
```

### <a id="ParseRepositoryRevisions" href="#ParseRepositoryRevisions">func ParseRepositoryRevisions(repoAndOptionalRev string) (string, []RevisionSpecifier)</a>

```
searchKey: search.ParseRepositoryRevisions
tags: [function]
```

```Go
func ParseRepositoryRevisions(repoAndOptionalRev string) (string, []RevisionSpecifier)
```

ParseRepositoryRevisions parses strings that refer to a repository and 0 or more revspecs. The format is: 

```
repo@revs

```
where repo is a repository regex and revs is a ':'-separated list of revspecs and/or ref globs. A ref glob is a revspec prefixed with '*' (which is not a valid revspec or ref itself; see `man git-check-ref-format`). The '@' and revs may be omitted to refer to the default branch. 

For example: 

- 'foo' refers to the 'foo' repo at the default branch - 'foo@bar' refers to the 'foo' repo and the 'bar' revspec. - 'foo@bar:baz:qux' refers to the 'foo' repo and 3 revspecs: 'bar', 'baz', 

```
and 'qux'.

```
- 'foo@*bar' refers to the 'foo' repo and all refs matching the glob 'bar/*', 

```
because git interprets the ref glob 'bar' as being 'bar/*' (see `man git-log`
section on the --glob flag)

```
### <a id="SearcherURLs" href="#SearcherURLs">func SearcherURLs() *endpoint.Map</a>

```
searchKey: search.SearcherURLs
tags: [function]
```

```Go
func SearcherURLs() *endpoint.Map
```

### <a id="TestParseRepositoryRevisions" href="#TestParseRepositoryRevisions">func TestParseRepositoryRevisions(t *testing.T)</a>

```
searchKey: search.TestParseRepositoryRevisions
tags: [function private test]
```

```Go
func TestParseRepositoryRevisions(t *testing.T)
```

### <a id="TestPromiseGet" href="#TestPromiseGet">func TestPromiseGet(t *testing.T)</a>

```
searchKey: search.TestPromiseGet
tags: [function private test]
```

```Go
func TestPromiseGet(t *testing.T)
```

### <a id="TestPromiseGetConcurrent" href="#TestPromiseGetConcurrent">func TestPromiseGetConcurrent(t *testing.T)</a>

```
searchKey: search.TestPromiseGetConcurrent
tags: [function private test]
```

```Go
func TestPromiseGetConcurrent(t *testing.T)
```

### <a id="TestPromiseGetWithCancel" href="#TestPromiseGetWithCancel">func TestPromiseGetWithCancel(t *testing.T)</a>

```
searchKey: search.TestPromiseGetWithCancel
tags: [function private test]
```

```Go
func TestPromiseGetWithCancel(t *testing.T)
```

### <a id="TestRepoStatusMap" href="#TestRepoStatusMap">func TestRepoStatusMap(t *testing.T)</a>

```
searchKey: search.TestRepoStatusMap
tags: [function private test]
```

```Go
func TestRepoStatusMap(t *testing.T)
```

### <a id="TestRepoStatusMap_nil" href="#TestRepoStatusMap_nil">func TestRepoStatusMap_nil(t *testing.T)</a>

```
searchKey: search.TestRepoStatusMap_nil
tags: [function private test]
```

```Go
func TestRepoStatusMap_nil(t *testing.T)
```

Test we have reasonable behaviour on nil maps 

### <a id="TestRepoStatusSingleton" href="#TestRepoStatusSingleton">func TestRepoStatusSingleton(t *testing.T)</a>

```
searchKey: search.TestRepoStatusSingleton
tags: [function private test]
```

```Go
func TestRepoStatusSingleton(t *testing.T)
```

### <a id="TestToTextPatternInfo" href="#TestToTextPatternInfo">func TestToTextPatternInfo(t *testing.T)</a>

```
searchKey: search.TestToTextPatternInfo
tags: [function private test]
```

```Go
func TestToTextPatternInfo(t *testing.T)
```

### <a id="TestZoektAddr" href="#TestZoektAddr">func TestZoektAddr(t *testing.T)</a>

```
searchKey: search.TestZoektAddr
tags: [function private test]
```

```Go
func TestZoektAddr(t *testing.T)
```

### <a id="assertReposStatusEqual" href="#assertReposStatusEqual">func assertReposStatusEqual(t *testing.T, want, got RepoStatusMap)</a>

```
searchKey: search.assertReposStatusEqual
tags: [function private]
```

```Go
func assertReposStatusEqual(t *testing.T, want, got RepoStatusMap)
```

### <a id="count" href="#count">func count(q query.Basic, p Protocol) int</a>

```
searchKey: search.count
tags: [function private]
```

```Go
func count(q query.Basic, p Protocol) int
```

### <a id="expandedRevSpec" href="#expandedRevSpec">func expandedRevSpec(ctx context.Context, r *RepositoryRevisions) ([]string, error)</a>

```
searchKey: search.expandedRevSpec
tags: [function private]
```

```Go
func expandedRevSpec(ctx context.Context, r *RepositoryRevisions) ([]string, error)
```

expandedRevSpecs evaluates all of r's ref glob expressions and returns the full, current list of refs matched or resolved by them, plus the explicitly listed Git revspecs. See git.CompileRefGlobs for information on how ref include/exclude globs are handled. 

### <a id="getEnv" href="#getEnv">func getEnv(environ []string, key string) (string, bool)</a>

```
searchKey: search.getEnv
tags: [function private]
```

```Go
func getEnv(environ []string, key string) (string, bool)
```

### <a id="langToFileRegexp" href="#langToFileRegexp">func langToFileRegexp(lang string) string</a>

```
searchKey: search.langToFileRegexp
tags: [function private]
```

```Go
func langToFileRegexp(lang string) string
```

langToFileRegexp converts a lang: parameter to its corresponding file patterns for file filters. The lang value must be valid, cf. validate.go 

### <a id="mapSlice" href="#mapSlice">func mapSlice(values []string, f func(string) string) []string</a>

```
searchKey: search.mapSlice
tags: [function private]
```

```Go
func mapSlice(values []string, f func(string) string) []string
```

### <a id="overrideSearchType" href="#overrideSearchType">func overrideSearchType(input string, searchType query.SearchType) query.SearchType</a>

```
searchKey: search.overrideSearchType
tags: [function private]
```

```Go
func overrideSearchType(input string, searchType query.SearchType) query.SearchType
```

### <a id="reposAtEndpoint" href="#reposAtEndpoint">func reposAtEndpoint(ctx context.Context, endpoint string) map[string]struct{}</a>

```
searchKey: search.reposAtEndpoint
tags: [function private]
```

```Go
func reposAtEndpoint(ctx context.Context, endpoint string) map[string]struct{}
```

### <a id="unionRegexp" href="#unionRegexp">func unionRegexp(values []string) string</a>

```
searchKey: search.unionRegexp
tags: [function private]
```

```Go
func unionRegexp(values []string) string
```

unionRegexp separates values with a | operator to create a string representing a union of regexp patterns. 

### <a id="zoektAddr" href="#zoektAddr">func zoektAddr(environ []string) string</a>

```
searchKey: search.zoektAddr
tags: [function private]
```

```Go
func zoektAddr(environ []string) string
```

