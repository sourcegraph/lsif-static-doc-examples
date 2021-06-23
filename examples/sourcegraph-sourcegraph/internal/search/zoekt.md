# Package zoekt

## Index

* [Constants](#const)
    * [const TextRequest](#TextRequest)
    * [const SymbolRequest](#SymbolRequest)
    * [const maxUnindexedRepoRevSearchesPerQuery](#maxUnindexedRepoRevSearchesPerQuery)
    * [const defaultMaxSearchResults](#defaultMaxSearchResults)
* [Variables](#var)
    * [var headBranch](#headBranch)
    * [var defaultTimeout](#defaultTimeout)
* [Types](#type)
    * [type IndexedRequestType string](#IndexedRequestType)
    * [type IndexedRepoRevs struct](#IndexedRepoRevs)
        * [func zoektIndexedRepos(indexedSet map[string]*zoekt.Repository, revs []*search.RepositoryRevisions, filter func(*zoekt.Repository) bool) (indexed *IndexedRepoRevs, unindexed []*search.RepositoryRevisions)](#zoektIndexedRepos)
        * [func (rb *IndexedRepoRevs) add(reporev *search.RepositoryRevisions, repo *zoekt.Repository) []search.RevisionSpecifier](#IndexedRepoRevs.add)
        * [func (rb *IndexedRepoRevs) getRepoInputRev(file *zoekt.FileMatch) (repo types.RepoName, inputRevs []string)](#IndexedRepoRevs.getRepoInputRev)
    * [type IndexedSearchRequest struct](#IndexedSearchRequest)
        * [func NewIndexedSearchRequest(ctx context.Context, args *search.TextParameters, typ IndexedRequestType, stream streaming.Sender) (_ *IndexedSearchRequest, err error)](#NewIndexedSearchRequest)
        * [func (s *IndexedSearchRequest) Repos() map[string]*search.RepositoryRevisions](#IndexedSearchRequest.Repos)
        * [func (s *IndexedSearchRequest) Search(ctx context.Context, c streaming.Sender) error](#IndexedSearchRequest.Search)
    * [type repoRevFunc func(file *github.com/google/zoekt.FileMatch) (repo github.com/sourcegraph/sourcegraph/internal/types.RepoName, revs []string, ok bool)](#repoRevFunc)
* [Functions](#func)
    * [func zoektSearch(ctx context.Context, args *search.TextParameters, repos *IndexedRepoRevs, typ IndexedRequestType, since func(t time.Time) time.Duration, c streaming.Sender) error](#zoektSearch)
    * [func getRepos(ctx context.Context, p *search.Promise) ([]*search.RepositoryRevisions, error)](#getRepos)
    * [func bufferedSender(cap int, sender zoekt.Sender) (zoekt.Sender, func())](#bufferedSender)
    * [func zoektSearchReposOnly(ctx context.Context, client zoekt.Streamer, query zoektquery.Q, c streaming.Sender, getRepoRevMap func() map[string]*search.RepositoryRevisions) error](#zoektSearchReposOnly)
    * [func zoektFileMatchToLineMatches(file *zoekt.FileMatch) []*result.LineMatch](#zoektFileMatchToLineMatches)
    * [func escape(s string) string](#escape)
    * [func zoektFileMatchToSymbolResults(repoName types.RepoName, inputRev string, file *zoekt.FileMatch) []*result.SymbolMatch](#zoektFileMatchToSymbolResults)
    * [func contextWithoutDeadline(cOld context.Context) (context.Context, context.CancelFunc)](#contextWithoutDeadline)
    * [func queryToZoektQuery(query *search.TextPatternInfo, typ IndexedRequestType) (zoektquery.Q, error)](#queryToZoektQuery)
    * [func limitUnindexedRepos(unindexed []*search.RepositoryRevisions, limit int, stream streaming.Sender) []*search.RepositoryRevisions](#limitUnindexedRepos)
    * [func FileRe(pattern string, queryIsCaseSensitive bool) (zoektquery.Q, error)](#FileRe)
    * [func noOpAnyChar(re *syntax.Regexp)](#noOpAnyChar)
    * [func parseRe(pattern string, filenameOnly bool, contentOnly bool, queryIsCaseSensitive bool) (zoektquery.Q, error)](#parseRe)
    * [func getSpanContext(ctx context.Context) (shouldTrace bool, spanContext map[string]string)](#getSpanContext)
    * [func SearchOpts(ctx context.Context, k int, query *search.TextPatternInfo) zoekt.SearchOptions](#SearchOpts)
    * [func ResultCountFactor(numRepos int, fileMatchLimit int32, globalSearch bool) (k int)](#ResultCountFactor)
    * [func TestIndexedSearch(t *testing.T)](#TestIndexedSearch)
    * [func mkStatusMap(m map[string]search.RepoStatus) search.RepoStatusMap](#mkStatusMap)
    * [func TestZoektIndexedRepos(t *testing.T)](#TestZoektIndexedRepos)
    * [func TestZoektResultCountFactor(t *testing.T)](#TestZoektResultCountFactor)
    * [func TestQueryToZoektQuery(t *testing.T)](#TestQueryToZoektQuery)
    * [func queryEqual(a, b zoektquery.Q) bool](#queryEqual)
    * [func generateZoektMatches(count int) []zoekt.FileMatch](#generateZoektMatches)
    * [func TestZoektIndexedRepos_single(t *testing.T)](#TestZoektIndexedRepos_single)
    * [func TestZoektFileMatchToSymbolResults(t *testing.T)](#TestZoektFileMatchToSymbolResults)
    * [func repoRevsSliceToMap(rs []*search.RepositoryRevisions) map[string]*search.RepositoryRevisions](#repoRevsSliceToMap)
    * [func TestContextWithoutDeadline(t *testing.T)](#TestContextWithoutDeadline)
    * [func TestContextWithoutDeadline_cancel(t *testing.T)](#TestContextWithoutDeadline_cancel)
    * [func TestBufferedSender(t *testing.T)](#TestBufferedSender)
    * [func makeRepositoryRevisions(repos ...string) []*search.RepositoryRevisions](#makeRepositoryRevisions)
    * [func mkRepos(names ...string) []types.RepoName](#mkRepos)
    * [func matchesToFileMatches(matches []result.Match) ([]*result.FileMatch, error)](#matchesToFileMatches)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="TextRequest" href="#TextRequest">const TextRequest</a>

```
searchKey: zoekt.TextRequest
```

```Go
const TextRequest IndexedRequestType = "text"
```

### <a id="SymbolRequest" href="#SymbolRequest">const SymbolRequest</a>

```
searchKey: zoekt.SymbolRequest
```

```Go
const SymbolRequest IndexedRequestType = "symbol"
```

### <a id="maxUnindexedRepoRevSearchesPerQuery" href="#maxUnindexedRepoRevSearchesPerQuery">const maxUnindexedRepoRevSearchesPerQuery</a>

```
searchKey: zoekt.maxUnindexedRepoRevSearchesPerQuery
tags: [private]
```

```Go
const maxUnindexedRepoRevSearchesPerQuery = 200
```

### <a id="defaultMaxSearchResults" href="#defaultMaxSearchResults">const defaultMaxSearchResults</a>

```
searchKey: zoekt.defaultMaxSearchResults
tags: [private]
```

```Go
const defaultMaxSearchResults = 30
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="headBranch" href="#headBranch">var headBranch</a>

```
searchKey: zoekt.headBranch
tags: [private]
```

```Go
var headBranch = []string{"HEAD"}
```

headBranch is used as a singleton of the indexedRepoRevs.repoBranches to save common-case allocations within indexedRepoRevs.Add. 

### <a id="defaultTimeout" href="#defaultTimeout">var defaultTimeout</a>

```
searchKey: zoekt.defaultTimeout
tags: [private]
```

```Go
var defaultTimeout = 20 * time.Second
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="IndexedRequestType" href="#IndexedRequestType">type IndexedRequestType string</a>

```
searchKey: zoekt.IndexedRequestType
```

```Go
type IndexedRequestType string
```

### <a id="IndexedRepoRevs" href="#IndexedRepoRevs">type IndexedRepoRevs struct</a>

```
searchKey: zoekt.IndexedRepoRevs
```

```Go
type IndexedRepoRevs struct {
	// repoRevs is the Sourcegraph representation of a the list of repoRevs
	// repository and revisions to search.
	repoRevs map[string]*search.RepositoryRevisions

	// repoBranches will be used when we query zoekt. The order of branches
	// must match that in a reporev such that we can map back results. IE this
	// invariant is maintained:
	//
	//  repoBranches[reporev.Repo.Name][i] <-> reporev.Revs[i]
	repoBranches map[string][]string
}
```

indexedRepoRevs creates both the Sourcegraph and Zoekt representation of a list of repository and refs to search. 

#### <a id="zoektIndexedRepos" href="#zoektIndexedRepos">func zoektIndexedRepos(indexedSet map[string]*zoekt.Repository, revs []*search.RepositoryRevisions, filter func(*zoekt.Repository) bool) (indexed *IndexedRepoRevs, unindexed []*search.RepositoryRevisions)</a>

```
searchKey: zoekt.zoektIndexedRepos
tags: [private]
```

```Go
func zoektIndexedRepos(indexedSet map[string]*zoekt.Repository, revs []*search.RepositoryRevisions, filter func(*zoekt.Repository) bool) (indexed *IndexedRepoRevs, unindexed []*search.RepositoryRevisions)
```

zoektIndexedRepos splits the revs into two parts: (1) the repository revisions in indexedSet (indexed) and (2) the repositories that are unindexed. 

#### <a id="IndexedRepoRevs.add" href="#IndexedRepoRevs.add">func (rb *IndexedRepoRevs) add(reporev *search.RepositoryRevisions, repo *zoekt.Repository) []search.RevisionSpecifier</a>

```
searchKey: zoekt.IndexedRepoRevs.add
tags: [private]
```

```Go
func (rb *IndexedRepoRevs) add(reporev *search.RepositoryRevisions, repo *zoekt.Repository) []search.RevisionSpecifier
```

add will add reporev and repo to the list of repository and branches to search if reporev's refs are a subset of repo's branches. It will return the revision specifiers it can't add. 

#### <a id="IndexedRepoRevs.getRepoInputRev" href="#IndexedRepoRevs.getRepoInputRev">func (rb *IndexedRepoRevs) getRepoInputRev(file *zoekt.FileMatch) (repo types.RepoName, inputRevs []string)</a>

```
searchKey: zoekt.IndexedRepoRevs.getRepoInputRev
tags: [private]
```

```Go
func (rb *IndexedRepoRevs) getRepoInputRev(file *zoekt.FileMatch) (repo types.RepoName, inputRevs []string)
```

getRepoInputRev returns the repo and inputRev associated with file. 

### <a id="IndexedSearchRequest" href="#IndexedSearchRequest">type IndexedSearchRequest struct</a>

```
searchKey: zoekt.IndexedSearchRequest
```

```Go
type IndexedSearchRequest struct {
	// Unindexed is a slice of repository revisions that can't be searched by
	// Zoekt. The repository revisions should be searched by the searcher
	// service.
	//
	// If IndexUnavailable is true or the query specifies index:no then all
	// repository revisions will be listed. Otherwise it will just be
	// repository revisions not indexed.
	Unindexed []*search.RepositoryRevisions

	// IndexUnavailable is true if zoekt is offline or disabled.
	IndexUnavailable bool

	// DisableUnindexedSearch is true if the query specified that only index
	// search should be used.
	DisableUnindexedSearch bool

	// inputs
	Args *search.TextParameters
	Typ  IndexedRequestType

	// RepoRevs is the repository revisions that are indexed and will be
	// searched.
	RepoRevs *IndexedRepoRevs

	// since if non-nil will be used instead of time.Since. For tests
	since func(time.Time) time.Duration
}
```

IndexedSearchRequest is responsible for translating a Sourcegraph search query into a Zoekt query and mapping the results from zoekt back to Sourcegraph result types. 

#### <a id="NewIndexedSearchRequest" href="#NewIndexedSearchRequest">func NewIndexedSearchRequest(ctx context.Context, args *search.TextParameters, typ IndexedRequestType, stream streaming.Sender) (_ *IndexedSearchRequest, err error)</a>

```
searchKey: zoekt.NewIndexedSearchRequest
```

```Go
func NewIndexedSearchRequest(ctx context.Context, args *search.TextParameters, typ IndexedRequestType, stream streaming.Sender) (_ *IndexedSearchRequest, err error)
```

#### <a id="IndexedSearchRequest.Repos" href="#IndexedSearchRequest.Repos">func (s *IndexedSearchRequest) Repos() map[string]*search.RepositoryRevisions</a>

```
searchKey: zoekt.IndexedSearchRequest.Repos
```

```Go
func (s *IndexedSearchRequest) Repos() map[string]*search.RepositoryRevisions
```

Repos is a map of repository revisions that are indexed and will be searched by Zoekt. Do not mutate. 

#### <a id="IndexedSearchRequest.Search" href="#IndexedSearchRequest.Search">func (s *IndexedSearchRequest) Search(ctx context.Context, c streaming.Sender) error</a>

```
searchKey: zoekt.IndexedSearchRequest.Search
```

```Go
func (s *IndexedSearchRequest) Search(ctx context.Context, c streaming.Sender) error
```

Search streams 0 or more events to c. 

### <a id="repoRevFunc" href="#repoRevFunc">type repoRevFunc func(file *github.com/google/zoekt.FileMatch) (repo github.com/sourcegraph/sourcegraph/internal/types.RepoName, revs []string, ok bool)</a>

```
searchKey: zoekt.repoRevFunc
tags: [private]
```

```Go
type repoRevFunc func(file *zoekt.FileMatch) (repo types.RepoName, revs []string, ok bool)
```

repoRevFunc is a function which maps repository names returned from Zoekt into the Sourcegraph's resolved repository revisions for the search. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="zoektSearch" href="#zoektSearch">func zoektSearch(ctx context.Context, args *search.TextParameters, repos *IndexedRepoRevs, typ IndexedRequestType, since func(t time.Time) time.Duration, c streaming.Sender) error</a>

```
searchKey: zoekt.zoektSearch
tags: [private]
```

```Go
func zoektSearch(ctx context.Context, args *search.TextParameters, repos *IndexedRepoRevs, typ IndexedRequestType, since func(t time.Time) time.Duration, c streaming.Sender) error
```

zoektSearch searches repositories using zoekt. 

Timeouts are reported through the context, and as a special case errNoResultsInTimeout is returned if no results are found in the given timeout (instead of the more common case of finding partial or full results in the given timeout). 

### <a id="getRepos" href="#getRepos">func getRepos(ctx context.Context, p *search.Promise) ([]*search.RepositoryRevisions, error)</a>

```
searchKey: zoekt.getRepos
tags: [private]
```

```Go
func getRepos(ctx context.Context, p *search.Promise) ([]*search.RepositoryRevisions, error)
```

getRepos is a wrapper around p.Get. It returns an error if the promise contains an underlying type other than []*search.RepositoryRevisions. 

### <a id="bufferedSender" href="#bufferedSender">func bufferedSender(cap int, sender zoekt.Sender) (zoekt.Sender, func())</a>

```
searchKey: zoekt.bufferedSender
tags: [private]
```

```Go
func bufferedSender(cap int, sender zoekt.Sender) (zoekt.Sender, func())
```

bufferedSender returns a buffered Sender with capacity cap, and a cleanup function which blocks until the buffer is drained. The cleanup function may only be called once. For cap=0, bufferedSender returns the input sender. 

### <a id="zoektSearchReposOnly" href="#zoektSearchReposOnly">func zoektSearchReposOnly(ctx context.Context, client zoekt.Streamer, query zoektquery.Q, c streaming.Sender, getRepoRevMap func() map[string]*search.RepositoryRevisions) error</a>

```
searchKey: zoekt.zoektSearchReposOnly
tags: [private]
```

```Go
func zoektSearchReposOnly(ctx context.Context, client zoekt.Streamer, query zoektquery.Q, c streaming.Sender, getRepoRevMap func() map[string]*search.RepositoryRevisions) error
```

zoektSearchReposOnly is used when select:repo is set, in which case we can ask zoekt only for the repos that contain matches for the query. This is a performance optimization, and not required for proper function of select:repo. 

### <a id="zoektFileMatchToLineMatches" href="#zoektFileMatchToLineMatches">func zoektFileMatchToLineMatches(file *zoekt.FileMatch) []*result.LineMatch</a>

```
searchKey: zoekt.zoektFileMatchToLineMatches
tags: [private]
```

```Go
func zoektFileMatchToLineMatches(file *zoekt.FileMatch) []*result.LineMatch
```

### <a id="escape" href="#escape">func escape(s string) string</a>

```
searchKey: zoekt.escape
tags: [private]
```

```Go
func escape(s string) string
```

### <a id="zoektFileMatchToSymbolResults" href="#zoektFileMatchToSymbolResults">func zoektFileMatchToSymbolResults(repoName types.RepoName, inputRev string, file *zoekt.FileMatch) []*result.SymbolMatch</a>

```
searchKey: zoekt.zoektFileMatchToSymbolResults
tags: [private]
```

```Go
func zoektFileMatchToSymbolResults(repoName types.RepoName, inputRev string, file *zoekt.FileMatch) []*result.SymbolMatch
```

### <a id="contextWithoutDeadline" href="#contextWithoutDeadline">func contextWithoutDeadline(cOld context.Context) (context.Context, context.CancelFunc)</a>

```
searchKey: zoekt.contextWithoutDeadline
tags: [private]
```

```Go
func contextWithoutDeadline(cOld context.Context) (context.Context, context.CancelFunc)
```

contextWithoutDeadline returns a context which will cancel if the cOld is canceled. 

### <a id="queryToZoektQuery" href="#queryToZoektQuery">func queryToZoektQuery(query *search.TextPatternInfo, typ IndexedRequestType) (zoektquery.Q, error)</a>

```
searchKey: zoekt.queryToZoektQuery
tags: [private]
```

```Go
func queryToZoektQuery(query *search.TextPatternInfo, typ IndexedRequestType) (zoektquery.Q, error)
```

### <a id="limitUnindexedRepos" href="#limitUnindexedRepos">func limitUnindexedRepos(unindexed []*search.RepositoryRevisions, limit int, stream streaming.Sender) []*search.RepositoryRevisions</a>

```
searchKey: zoekt.limitUnindexedRepos
tags: [private]
```

```Go
func limitUnindexedRepos(unindexed []*search.RepositoryRevisions, limit int, stream streaming.Sender) []*search.RepositoryRevisions
```

limitUnindexedRepos limits the number of repo@revs searched by the unindexed searcher codepath.  Sending many requests to searcher would otherwise cause a flood of system and network requests that result in timeouts or long delays. 

It returns the new repositories destined for the unindexed searcher code path, and sends an event to stream for any repositories that are limited / excluded. 

A slice to the input list is returned, it is not copied. 

### <a id="FileRe" href="#FileRe">func FileRe(pattern string, queryIsCaseSensitive bool) (zoektquery.Q, error)</a>

```
searchKey: zoekt.FileRe
```

```Go
func FileRe(pattern string, queryIsCaseSensitive bool) (zoektquery.Q, error)
```

### <a id="noOpAnyChar" href="#noOpAnyChar">func noOpAnyChar(re *syntax.Regexp)</a>

```
searchKey: zoekt.noOpAnyChar
tags: [private]
```

```Go
func noOpAnyChar(re *syntax.Regexp)
```

### <a id="parseRe" href="#parseRe">func parseRe(pattern string, filenameOnly bool, contentOnly bool, queryIsCaseSensitive bool) (zoektquery.Q, error)</a>

```
searchKey: zoekt.parseRe
tags: [private]
```

```Go
func parseRe(pattern string, filenameOnly bool, contentOnly bool, queryIsCaseSensitive bool) (zoektquery.Q, error)
```

### <a id="getSpanContext" href="#getSpanContext">func getSpanContext(ctx context.Context) (shouldTrace bool, spanContext map[string]string)</a>

```
searchKey: zoekt.getSpanContext
tags: [private]
```

```Go
func getSpanContext(ctx context.Context) (shouldTrace bool, spanContext map[string]string)
```

### <a id="SearchOpts" href="#SearchOpts">func SearchOpts(ctx context.Context, k int, query *search.TextPatternInfo) zoekt.SearchOptions</a>

```
searchKey: zoekt.SearchOpts
```

```Go
func SearchOpts(ctx context.Context, k int, query *search.TextPatternInfo) zoekt.SearchOptions
```

### <a id="ResultCountFactor" href="#ResultCountFactor">func ResultCountFactor(numRepos int, fileMatchLimit int32, globalSearch bool) (k int)</a>

```
searchKey: zoekt.ResultCountFactor
```

```Go
func ResultCountFactor(numRepos int, fileMatchLimit int32, globalSearch bool) (k int)
```

### <a id="TestIndexedSearch" href="#TestIndexedSearch">func TestIndexedSearch(t *testing.T)</a>

```
searchKey: zoekt.TestIndexedSearch
tags: [private]
```

```Go
func TestIndexedSearch(t *testing.T)
```

### <a id="mkStatusMap" href="#mkStatusMap">func mkStatusMap(m map[string]search.RepoStatus) search.RepoStatusMap</a>

```
searchKey: zoekt.mkStatusMap
tags: [private]
```

```Go
func mkStatusMap(m map[string]search.RepoStatus) search.RepoStatusMap
```

### <a id="TestZoektIndexedRepos" href="#TestZoektIndexedRepos">func TestZoektIndexedRepos(t *testing.T)</a>

```
searchKey: zoekt.TestZoektIndexedRepos
tags: [private]
```

```Go
func TestZoektIndexedRepos(t *testing.T)
```

### <a id="TestZoektResultCountFactor" href="#TestZoektResultCountFactor">func TestZoektResultCountFactor(t *testing.T)</a>

```
searchKey: zoekt.TestZoektResultCountFactor
tags: [private]
```

```Go
func TestZoektResultCountFactor(t *testing.T)
```

### <a id="TestQueryToZoektQuery" href="#TestQueryToZoektQuery">func TestQueryToZoektQuery(t *testing.T)</a>

```
searchKey: zoekt.TestQueryToZoektQuery
tags: [private]
```

```Go
func TestQueryToZoektQuery(t *testing.T)
```

### <a id="queryEqual" href="#queryEqual">func queryEqual(a, b zoektquery.Q) bool</a>

```
searchKey: zoekt.queryEqual
tags: [private]
```

```Go
func queryEqual(a, b zoektquery.Q) bool
```

### <a id="generateZoektMatches" href="#generateZoektMatches">func generateZoektMatches(count int) []zoekt.FileMatch</a>

```
searchKey: zoekt.generateZoektMatches
tags: [private]
```

```Go
func generateZoektMatches(count int) []zoekt.FileMatch
```

### <a id="TestZoektIndexedRepos_single" href="#TestZoektIndexedRepos_single">func TestZoektIndexedRepos_single(t *testing.T)</a>

```
searchKey: zoekt.TestZoektIndexedRepos_single
tags: [private]
```

```Go
func TestZoektIndexedRepos_single(t *testing.T)
```

### <a id="TestZoektFileMatchToSymbolResults" href="#TestZoektFileMatchToSymbolResults">func TestZoektFileMatchToSymbolResults(t *testing.T)</a>

```
searchKey: zoekt.TestZoektFileMatchToSymbolResults
tags: [private]
```

```Go
func TestZoektFileMatchToSymbolResults(t *testing.T)
```

### <a id="repoRevsSliceToMap" href="#repoRevsSliceToMap">func repoRevsSliceToMap(rs []*search.RepositoryRevisions) map[string]*search.RepositoryRevisions</a>

```
searchKey: zoekt.repoRevsSliceToMap
tags: [private]
```

```Go
func repoRevsSliceToMap(rs []*search.RepositoryRevisions) map[string]*search.RepositoryRevisions
```

### <a id="TestContextWithoutDeadline" href="#TestContextWithoutDeadline">func TestContextWithoutDeadline(t *testing.T)</a>

```
searchKey: zoekt.TestContextWithoutDeadline
tags: [private]
```

```Go
func TestContextWithoutDeadline(t *testing.T)
```

### <a id="TestContextWithoutDeadline_cancel" href="#TestContextWithoutDeadline_cancel">func TestContextWithoutDeadline_cancel(t *testing.T)</a>

```
searchKey: zoekt.TestContextWithoutDeadline_cancel
tags: [private]
```

```Go
func TestContextWithoutDeadline_cancel(t *testing.T)
```

### <a id="TestBufferedSender" href="#TestBufferedSender">func TestBufferedSender(t *testing.T)</a>

```
searchKey: zoekt.TestBufferedSender
tags: [private]
```

```Go
func TestBufferedSender(t *testing.T)
```

### <a id="makeRepositoryRevisions" href="#makeRepositoryRevisions">func makeRepositoryRevisions(repos ...string) []*search.RepositoryRevisions</a>

```
searchKey: zoekt.makeRepositoryRevisions
tags: [private]
```

```Go
func makeRepositoryRevisions(repos ...string) []*search.RepositoryRevisions
```

### <a id="mkRepos" href="#mkRepos">func mkRepos(names ...string) []types.RepoName</a>

```
searchKey: zoekt.mkRepos
tags: [private]
```

```Go
func mkRepos(names ...string) []types.RepoName
```

### <a id="matchesToFileMatches" href="#matchesToFileMatches">func matchesToFileMatches(matches []result.Match) ([]*result.FileMatch, error)</a>

```
searchKey: zoekt.matchesToFileMatches
tags: [private]
```

```Go
func matchesToFileMatches(matches []result.Match) ([]*result.FileMatch, error)
```

