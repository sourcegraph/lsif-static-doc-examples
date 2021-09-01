# Package run

## Index

* [Constants](#const)
    * [const DefaultSymbolLimit](#DefaultSymbolLimit)
    * [const defaultMaxSearchResults](#defaultMaxSearchResults)
* [Variables](#var)
    * [var MockSearchFilesInRepos](#MockSearchFilesInRepos)
    * [var MockSearchRepositories](#MockSearchRepositories)
    * [var MockSearchSymbols](#MockSearchSymbols)
    * [var mockSearchFilesInRepo](#mockSearchFilesInRepo)
    * [var textSearchLimiter](#textSearchLimiter)
* [Types](#type)
    * [type Aggregator struct](#Aggregator)
        * [func NewAggregator(db dbutil.DB, stream streaming.Sender) *Aggregator](#NewAggregator)
        * [func (a *Aggregator) DoCommitSearch(ctx context.Context, tp *search.TextParameters) (err error)](#Aggregator.DoCommitSearch)
        * [func (a *Aggregator) DoDiffSearch(ctx context.Context, tp *search.TextParameters) (err error)](#Aggregator.DoDiffSearch)
        * [func (a *Aggregator) DoFilePathSearch(ctx context.Context, args *search.TextParameters) (err error)](#Aggregator.DoFilePathSearch)
        * [func (a *Aggregator) DoRepoSearch(ctx context.Context, args *search.TextParameters, limit int32) (err error)](#Aggregator.DoRepoSearch)
        * [func (a *Aggregator) DoSymbolSearch(ctx context.Context, args *search.TextParameters, limit int) (err error)](#Aggregator.DoSymbolSearch)
        * [func (a *Aggregator) Error(err error)](#Aggregator.Error)
        * [func (a *Aggregator) Get() ([]result.Match, streaming.Stats, *multierror.Error)](#Aggregator.Get)
        * [func (a *Aggregator) Send(event streaming.SearchEvent)](#Aggregator.Send)
    * [type DiffCommitError struct](#DiffCommitError)
    * [type RepoLimitError run.DiffCommitError](#RepoLimitError)
        * [func (*RepoLimitError) Error() string](#RepoLimitError.Error)
    * [type SearchCommitsInReposParameters struct](#SearchCommitsInReposParameters)
    * [type SearchCursor struct](#SearchCursor)
    * [type SearchInputs struct](#SearchInputs)
        * [func (inputs SearchInputs) MaxResults() int](#SearchInputs.MaxResults)
    * [type SearchPaginationInfo struct](#SearchPaginationInfo)
    * [type TimeLimitError run.DiffCommitError](#TimeLimitError)
        * [func (*TimeLimitError) Error() string](#TimeLimitError.Error)
* [Functions](#func)
    * [func BenchmarkSearchRepositories(b *testing.B)](#BenchmarkSearchRepositories)
    * [func Benchmark_highlightMatches(b *testing.B)](#Benchmark_highlightMatches)
    * [func ComputeSymbols(ctx context.Context, repoName types.RepoName, commitID api.CommitID, inputRev *string, query *string, first *int32, includePatterns *[]string) (res []*result.SymbolMatch, err error)](#ComputeSymbols)
    * [func ResolveCommitParameters(ctx context.Context, tp *search.TextParameters) (*search.TextParametersForCommitParameters, error)](#ResolveCommitParameters)
    * [func SearchCommitDiffsInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, resultChannel streaming.Sender) error](#SearchCommitDiffsInRepos)
    * [func SearchCommitLogInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, resultChannel streaming.Sender) error](#SearchCommitLogInRepos)
    * [func SearchCommitsInRepoStream(ctx context.Context, db dbutil.DB, op search.CommitParameters, s streaming.Sender) (err error)](#SearchCommitsInRepoStream)
    * [func SearchCommitsInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, params SearchCommitsInReposParameters) (err error)](#SearchCommitsInRepos)
    * [func SearchFilesInRepo(ctx context.Context, searcherURLs *endpoint.Map, repo types.RepoName, gitserverRepo api.RepoName, rev string, index bool, info *search.TextPatternInfo, fetchTimeout time.Duration) ([]*result.FileMatch, bool, error)](#SearchFilesInRepo)
    * [func SearchFilesInRepos(ctx context.Context, args *search.TextParameters, stream streaming.Sender) (err error)](#SearchFilesInRepos)
    * [func SearchFilesInReposBatch(ctx context.Context, args *search.TextParameters) ([]*result.FileMatch, streaming.Stats, error)](#SearchFilesInReposBatch)
    * [func SearchRepositories(ctx context.Context, args *search.TextParameters, limit int32, stream streaming.Sender) (err error)](#SearchRepositories)
    * [func SearchSymbols(ctx context.Context, args *search.TextParameters, limit int, stream streaming.Sender) (err error)](#SearchSymbols)
    * [func TestCheckDiffCommitSearchLimits(t *testing.T)](#TestCheckDiffCommitSearchLimits)
    * [func TestCommitSearchResult_Limit(t *testing.T)](#TestCommitSearchResult_Limit)
    * [func TestExpandUsernamesToEmails(t *testing.T)](#TestExpandUsernamesToEmails)
    * [func TestFileMatch_Limit(t *testing.T)](#TestFileMatch_Limit)
    * [func TestHighlightMatches(t *testing.T)](#TestHighlightMatches)
    * [func TestMatchRepos(t *testing.T)](#TestMatchRepos)
    * [func TestOrderedFuzzyRegexp(t *testing.T)](#TestOrderedFuzzyRegexp)
    * [func TestRepoShouldBeAdded(t *testing.T)](#TestRepoShouldBeAdded)
    * [func TestRepoShouldBeSearched(t *testing.T)](#TestRepoShouldBeSearched)
    * [func TestSearchCommitsInRepo(t *testing.T)](#TestSearchCommitsInRepo)
    * [func TestSearchFilesInRepos(t *testing.T)](#TestSearchFilesInRepos)
    * [func TestSearchFilesInReposStream(t *testing.T)](#TestSearchFilesInReposStream)
    * [func TestSearchFilesInRepos_multipleRevsPerRepo(t *testing.T)](#TestSearchFilesInRepos_multipleRevsPerRepo)
    * [func TestSearchRepositories(t *testing.T)](#TestSearchRepositories)
    * [func assertReposStatus(t *testing.T, repoNames map[api.RepoID]string, got search.RepoStatusMap, want map[string]search.RepoStatus)](#assertReposStatus)
    * [func callSearcherOverRepos(ctx context.Context,...](#callSearcherOverRepos)
    * [func checkDiffCommitSearchLimits(ctx context.Context, args *search.TextParameters, resultType string) error](#checkDiffCommitSearchLimits)
    * [func cleanDiffPreview(highlights []result.HighlightedRange, rawDiffResult string) (string, []result.HighlightedRange)](#cleanDiffPreview)
    * [func commitMatchesToMatches(commitMatches []*result.CommitMatch) []result.Match](#commitMatchesToMatches)
    * [func commitParametersToDiffParameters(ctx context.Context, db dbutil.DB, op *search.CommitParameters) (*search.DiffParameters, error)](#commitParametersToDiffParameters)
    * [func errorName(diff bool) string](#errorName)
    * [func expandUsernamesToEmails(ctx context.Context, db dbutil.DB, values []string) (expandedValues []string, err error)](#expandUsernamesToEmails)
    * [func fileMatchesToMatches(fms []*result.FileMatch) []result.Match](#fileMatchesToMatches)
    * [func fromVCSHighlights(vcsHighlights []git.Highlight) []result.HighlightedRange](#fromVCSHighlights)
    * [func getRepos(ctx context.Context, p *search.Promise) ([]*search.RepositoryRevisions, error)](#getRepos)
    * [func handleRepoSearchResult(repoRev *search.RepositoryRevisions, limitHit, timedOut bool, searchErr error) (_ streaming.Stats, fatalErr error)](#handleRepoSearchResult)
    * [func highlightMatches(pattern *regexp.Regexp, data []byte) *result.HighlightedString](#highlightMatches)
    * [func indexedSymbolsBranch(ctx context.Context, repository, commit string) string](#indexedSymbolsBranch)
    * [func limitOrDefault(first *int32) int](#limitOrDefault)
    * [func logCommitSearchResultsToMatches(op *search.CommitParameters, repoName types.RepoName, rawResults []*git.LogCommitSearchResult) []*result.CommitMatch](#logCommitSearchResultsToMatches)
    * [func makeRepositoryRevisions(repos ...string) []*search.RepositoryRevisions](#makeRepositoryRevisions)
    * [func matchRepos(pattern *regexp.Regexp, resolved []*search.RepositoryRevisions, results chan<- []*search.RepositoryRevisions)](#matchRepos)
    * [func matchesToFileMatches(matches []result.Match) ([]*result.FileMatch, error)](#matchesToFileMatches)
    * [func mkRepos(names ...string) []types.RepoName](#mkRepos)
    * [func orderedFuzzyRegexp(pieces []string) string](#orderedFuzzyRegexp)
    * [func repoHasFilesWithNamesMatching(ctx context.Context, searcherURLs *endpoint.Map, include bool, repoHasFileFlag []string, gitserverRepo api.RepoName, commit api.CommitID, fetchTimeout time.Duration) (bool, error)](#repoHasFilesWithNamesMatching)
    * [func repoRevsToRepoMatches(ctx context.Context, repos []*search.RepositoryRevisions) []result.Match](#repoRevsToRepoMatches)
    * [func repoShouldBeAdded(ctx context.Context, zoekt *searchbackend.Zoekt, repo *search.RepositoryRevisions, pattern *search.TextPatternInfo) (bool, error)](#repoShouldBeAdded)
    * [func repoShouldBeSearched(ctx context.Context, searcherURLs *endpoint.Map, searchPattern *search.TextPatternInfo, gitserverRepo api.RepoName, commit api.CommitID, fetchTimeout time.Duration) (shouldBeSearched bool, err error)](#repoShouldBeSearched)
    * [func reposToAdd(ctx context.Context, args *search.TextParameters, repos []*search.RepositoryRevisions) ([]*search.RepositoryRevisions, error)](#reposToAdd)
    * [func resetMocks()](#resetMocks)
    * [func searchCommitsInRepo(ctx context.Context, db dbutil.DB, op search.CommitParameters) (results []*result.CommitMatch, limitHit, timedOut bool, err error)](#searchCommitsInRepo)
    * [func searchRepositoriesBatch(ctx context.Context, args *search.TextParameters, limit int32) ([]result.Match, streaming.Stats, error)](#searchRepositoriesBatch)
    * [func searchSymbolsInRepo(ctx context.Context, repoRevs *search.RepositoryRevisions, patternInfo *search.TextPatternInfo, limit int) (res []*result.FileMatch, err error)](#searchSymbolsInRepo)
    * [func searchZoektSymbols(ctx context.Context, repoName types.RepoName, commitID api.CommitID, inputRev *string, branch string, queryString *string, first *int32, includePatterns *[]string) (res []*result.SymbolMatch, err error)](#searchZoektSymbols)
    * [func statsDeref(s *streaming.Stats) streaming.Stats](#statsDeref)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="DefaultSymbolLimit" href="#DefaultSymbolLimit">const DefaultSymbolLimit</a>

```
searchKey: run.DefaultSymbolLimit
tags: [constant number]
```

```Go
const DefaultSymbolLimit = 100
```

### <a id="defaultMaxSearchResults" href="#defaultMaxSearchResults">const defaultMaxSearchResults</a>

```
searchKey: run.defaultMaxSearchResults
tags: [constant number private]
```

```Go
const defaultMaxSearchResults = 30
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="MockSearchFilesInRepos" href="#MockSearchFilesInRepos">var MockSearchFilesInRepos</a>

```
searchKey: run.MockSearchFilesInRepos
tags: [variable function]
```

```Go
var MockSearchFilesInRepos func(args *search.TextParameters) ([]*result.FileMatch, *streaming.Stats, error) = ...
```

### <a id="MockSearchRepositories" href="#MockSearchRepositories">var MockSearchRepositories</a>

```
searchKey: run.MockSearchRepositories
tags: [variable function]
```

```Go
var MockSearchRepositories func(args *search.TextParameters) ([]result.Match, *streaming.Stats, error) = ...
```

### <a id="MockSearchSymbols" href="#MockSearchSymbols">var MockSearchSymbols</a>

```
searchKey: run.MockSearchSymbols
tags: [variable function]
```

```Go
var MockSearchSymbols func(ctx context.Context, args *search.TextParameters, limit int) (res []*result.FileMatch, stats *streaming.Stats, err error) = ...
```

### <a id="mockSearchFilesInRepo" href="#mockSearchFilesInRepo">var mockSearchFilesInRepo</a>

```
searchKey: run.mockSearchFilesInRepo
tags: [variable function private]
```

```Go
var mockSearchFilesInRepo func(ctx context.Context, repo types.RepoName, gitserverRepo api.RepoName, rev string, info *search.TextPatternInfo, fetchTimeout time.Duration) (matches []*result.FileMatch, limitHit bool, err error) = ...
```

### <a id="textSearchLimiter" href="#textSearchLimiter">var textSearchLimiter</a>

```
searchKey: run.textSearchLimiter
tags: [variable struct private]
```

```Go
var textSearchLimiter = mutablelimiter.New(32)
```

A global limiter on number of concurrent searcher searches. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Aggregator" href="#Aggregator">type Aggregator struct</a>

```
searchKey: run.Aggregator
tags: [struct]
```

```Go
type Aggregator struct {
	parentStream streaming.Sender
	db           dbutil.DB

	mu      sync.Mutex
	results []result.Match
	stats   streaming.Stats
	errors  *multierror.Error
}
```

#### <a id="NewAggregator" href="#NewAggregator">func NewAggregator(db dbutil.DB, stream streaming.Sender) *Aggregator</a>

```
searchKey: run.NewAggregator
tags: [function]
```

```Go
func NewAggregator(db dbutil.DB, stream streaming.Sender) *Aggregator
```

#### <a id="Aggregator.DoCommitSearch" href="#Aggregator.DoCommitSearch">func (a *Aggregator) DoCommitSearch(ctx context.Context, tp *search.TextParameters) (err error)</a>

```
searchKey: run.Aggregator.DoCommitSearch
tags: [method]
```

```Go
func (a *Aggregator) DoCommitSearch(ctx context.Context, tp *search.TextParameters) (err error)
```

#### <a id="Aggregator.DoDiffSearch" href="#Aggregator.DoDiffSearch">func (a *Aggregator) DoDiffSearch(ctx context.Context, tp *search.TextParameters) (err error)</a>

```
searchKey: run.Aggregator.DoDiffSearch
tags: [method]
```

```Go
func (a *Aggregator) DoDiffSearch(ctx context.Context, tp *search.TextParameters) (err error)
```

#### <a id="Aggregator.DoFilePathSearch" href="#Aggregator.DoFilePathSearch">func (a *Aggregator) DoFilePathSearch(ctx context.Context, args *search.TextParameters) (err error)</a>

```
searchKey: run.Aggregator.DoFilePathSearch
tags: [method]
```

```Go
func (a *Aggregator) DoFilePathSearch(ctx context.Context, args *search.TextParameters) (err error)
```

#### <a id="Aggregator.DoRepoSearch" href="#Aggregator.DoRepoSearch">func (a *Aggregator) DoRepoSearch(ctx context.Context, args *search.TextParameters, limit int32) (err error)</a>

```
searchKey: run.Aggregator.DoRepoSearch
tags: [method]
```

```Go
func (a *Aggregator) DoRepoSearch(ctx context.Context, args *search.TextParameters, limit int32) (err error)
```

#### <a id="Aggregator.DoSymbolSearch" href="#Aggregator.DoSymbolSearch">func (a *Aggregator) DoSymbolSearch(ctx context.Context, args *search.TextParameters, limit int) (err error)</a>

```
searchKey: run.Aggregator.DoSymbolSearch
tags: [method]
```

```Go
func (a *Aggregator) DoSymbolSearch(ctx context.Context, args *search.TextParameters, limit int) (err error)
```

#### <a id="Aggregator.Error" href="#Aggregator.Error">func (a *Aggregator) Error(err error)</a>

```
searchKey: run.Aggregator.Error
tags: [method]
```

```Go
func (a *Aggregator) Error(err error)
```

#### <a id="Aggregator.Get" href="#Aggregator.Get">func (a *Aggregator) Get() ([]result.Match, streaming.Stats, *multierror.Error)</a>

```
searchKey: run.Aggregator.Get
tags: [method]
```

```Go
func (a *Aggregator) Get() ([]result.Match, streaming.Stats, *multierror.Error)
```

Get finalises aggregation over the stream and returns the aggregated result. It should only be called once each do* function is finished running. 

#### <a id="Aggregator.Send" href="#Aggregator.Send">func (a *Aggregator) Send(event streaming.SearchEvent)</a>

```
searchKey: run.Aggregator.Send
tags: [method]
```

```Go
func (a *Aggregator) Send(event streaming.SearchEvent)
```

### <a id="DiffCommitError" href="#DiffCommitError">type DiffCommitError struct</a>

```
searchKey: run.DiffCommitError
tags: [struct]
```

```Go
type DiffCommitError struct {
	ResultType string
	Max        int
}
```

### <a id="RepoLimitError" href="#RepoLimitError">type RepoLimitError run.DiffCommitError</a>

```
searchKey: run.RepoLimitError
tags: [struct]
```

```Go
type RepoLimitError DiffCommitError
```

#### <a id="RepoLimitError.Error" href="#RepoLimitError.Error">func (*RepoLimitError) Error() string</a>

```
searchKey: run.RepoLimitError.Error
tags: [method]
```

```Go
func (*RepoLimitError) Error() string
```

### <a id="SearchCommitsInReposParameters" href="#SearchCommitsInReposParameters">type SearchCommitsInReposParameters struct</a>

```
searchKey: run.SearchCommitsInReposParameters
tags: [struct]
```

```Go
type SearchCommitsInReposParameters struct {
	TraceName string

	// CommitParams are the base commit parameters passed to
	// searchCommitsInRepoStream. For each repository revision this is copied
	// with the RepoRevs field set.
	CommitParams search.CommitParameters

	ResultChannel streaming.Sender
}
```

### <a id="SearchCursor" href="#SearchCursor">type SearchCursor struct</a>

```
searchKey: run.SearchCursor
tags: [struct]
```

```Go
type SearchCursor struct {
	// RepositoryOffset indicates how many repositories (which are globally
	// sorted and ordered) to offset by.
	RepositoryOffset int32

	// ResultOffset indicates how many results within the first repository we
	// would search in to further offset by. This is so that we can paginate
	// results within e.g. a single large repository.
	ResultOffset int32

	// Finished tells if there are more results for the query or if we've
	// consumed them all.
	Finished bool
}
```

SearchCursor represents a decoded search pagination cursor. From an API consumer standpoint, it is an encoded opaque string. 

### <a id="SearchInputs" href="#SearchInputs">type SearchInputs struct</a>

```
searchKey: run.SearchInputs
tags: [struct]
```

```Go
type SearchInputs struct {
	Plan           query.Plan            // the comprehensive query plan
	Query          query.Q               // the current basic query being evaluated, one part of query.Plan
	OriginalQuery  string                // the raw string of the original search query
	Pagination     *SearchPaginationInfo // pagination information, or nil if the request is not paginated.
	PatternType    query.SearchType
	VersionContext *string
	UserSettings   *schema.Settings

	// DefaultLimit is the default limit to use if not specified in query.
	DefaultLimit int
}
```

SearchInputs contains fields we set before kicking off search. 

#### <a id="SearchInputs.MaxResults" href="#SearchInputs.MaxResults">func (inputs SearchInputs) MaxResults() int</a>

```
searchKey: run.SearchInputs.MaxResults
tags: [method]
```

```Go
func (inputs SearchInputs) MaxResults() int
```

MaxResults computes the limit for the query. 

### <a id="SearchPaginationInfo" href="#SearchPaginationInfo">type SearchPaginationInfo struct</a>

```
searchKey: run.SearchPaginationInfo
tags: [struct]
```

```Go
type SearchPaginationInfo struct {
	// cursor indicates where to resume searching from (see docstrings on
	// SearchCursor) or nil when requesting the first page of results.
	Cursor *SearchCursor

	// limit indicates at max how many search results to return.
	Limit int32
}
```

SearchPaginationInfo describes information around a paginated search request. 

### <a id="TimeLimitError" href="#TimeLimitError">type TimeLimitError run.DiffCommitError</a>

```
searchKey: run.TimeLimitError
tags: [struct]
```

```Go
type TimeLimitError DiffCommitError
```

#### <a id="TimeLimitError.Error" href="#TimeLimitError.Error">func (*TimeLimitError) Error() string</a>

```
searchKey: run.TimeLimitError.Error
tags: [method]
```

```Go
func (*TimeLimitError) Error() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="BenchmarkSearchRepositories" href="#BenchmarkSearchRepositories">func BenchmarkSearchRepositories(b *testing.B)</a>

```
searchKey: run.BenchmarkSearchRepositories
tags: [function private benchmark]
```

```Go
func BenchmarkSearchRepositories(b *testing.B)
```

### <a id="Benchmark_highlightMatches" href="#Benchmark_highlightMatches">func Benchmark_highlightMatches(b *testing.B)</a>

```
searchKey: run.Benchmark_highlightMatches
tags: [function private benchmark]
```

```Go
func Benchmark_highlightMatches(b *testing.B)
```

### <a id="ComputeSymbols" href="#ComputeSymbols">func ComputeSymbols(ctx context.Context, repoName types.RepoName, commitID api.CommitID, inputRev *string, query *string, first *int32, includePatterns *[]string) (res []*result.SymbolMatch, err error)</a>

```
searchKey: run.ComputeSymbols
tags: [function]
```

```Go
func ComputeSymbols(ctx context.Context, repoName types.RepoName, commitID api.CommitID, inputRev *string, query *string, first *int32, includePatterns *[]string) (res []*result.SymbolMatch, err error)
```

### <a id="ResolveCommitParameters" href="#ResolveCommitParameters">func ResolveCommitParameters(ctx context.Context, tp *search.TextParameters) (*search.TextParametersForCommitParameters, error)</a>

```
searchKey: run.ResolveCommitParameters
tags: [function]
```

```Go
func ResolveCommitParameters(ctx context.Context, tp *search.TextParameters) (*search.TextParametersForCommitParameters, error)
```

ResolveCommitParameters creates parameters for commit search from tp. It will wait for the list of repos to be resolved. 

### <a id="SearchCommitDiffsInRepos" href="#SearchCommitDiffsInRepos">func SearchCommitDiffsInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, resultChannel streaming.Sender) error</a>

```
searchKey: run.SearchCommitDiffsInRepos
tags: [function]
```

```Go
func SearchCommitDiffsInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, resultChannel streaming.Sender) error
```

SearchCommitDiffsInRepos searches a set of repos for matching commit diffs. 

### <a id="SearchCommitLogInRepos" href="#SearchCommitLogInRepos">func SearchCommitLogInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, resultChannel streaming.Sender) error</a>

```
searchKey: run.SearchCommitLogInRepos
tags: [function]
```

```Go
func SearchCommitLogInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, resultChannel streaming.Sender) error
```

SearchCommitLogInRepos searches a set of repos for matching commits. 

### <a id="SearchCommitsInRepoStream" href="#SearchCommitsInRepoStream">func SearchCommitsInRepoStream(ctx context.Context, db dbutil.DB, op search.CommitParameters, s streaming.Sender) (err error)</a>

```
searchKey: run.SearchCommitsInRepoStream
tags: [function]
```

```Go
func SearchCommitsInRepoStream(ctx context.Context, db dbutil.DB, op search.CommitParameters, s streaming.Sender) (err error)
```

SearchCommitsInRepoStream searches for commits based on op. 

### <a id="SearchCommitsInRepos" href="#SearchCommitsInRepos">func SearchCommitsInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, params SearchCommitsInReposParameters) (err error)</a>

```
searchKey: run.SearchCommitsInRepos
tags: [function]
```

```Go
func SearchCommitsInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, params SearchCommitsInReposParameters) (err error)
```

### <a id="SearchFilesInRepo" href="#SearchFilesInRepo">func SearchFilesInRepo(ctx context.Context, searcherURLs *endpoint.Map, repo types.RepoName, gitserverRepo api.RepoName, rev string, index bool, info *search.TextPatternInfo, fetchTimeout time.Duration) ([]*result.FileMatch, bool, error)</a>

```
searchKey: run.SearchFilesInRepo
tags: [function]
```

```Go
func SearchFilesInRepo(ctx context.Context, searcherURLs *endpoint.Map, repo types.RepoName, gitserverRepo api.RepoName, rev string, index bool, info *search.TextPatternInfo, fetchTimeout time.Duration) ([]*result.FileMatch, bool, error)
```

### <a id="SearchFilesInRepos" href="#SearchFilesInRepos">func SearchFilesInRepos(ctx context.Context, args *search.TextParameters, stream streaming.Sender) (err error)</a>

```
searchKey: run.SearchFilesInRepos
tags: [function]
```

```Go
func SearchFilesInRepos(ctx context.Context, args *search.TextParameters, stream streaming.Sender) (err error)
```

SearchFilesInRepos searches a set of repos for a pattern. 

### <a id="SearchFilesInReposBatch" href="#SearchFilesInReposBatch">func SearchFilesInReposBatch(ctx context.Context, args *search.TextParameters) ([]*result.FileMatch, streaming.Stats, error)</a>

```
searchKey: run.SearchFilesInReposBatch
tags: [function]
```

```Go
func SearchFilesInReposBatch(ctx context.Context, args *search.TextParameters) ([]*result.FileMatch, streaming.Stats, error)
```

SearchFilesInRepoBatch is a convenience function around searchFilesInRepos which collects the results from the stream. 

### <a id="SearchRepositories" href="#SearchRepositories">func SearchRepositories(ctx context.Context, args *search.TextParameters, limit int32, stream streaming.Sender) (err error)</a>

```
searchKey: run.SearchRepositories
tags: [function]
```

```Go
func SearchRepositories(ctx context.Context, args *search.TextParameters, limit int32, stream streaming.Sender) (err error)
```

SearchRepositories searches for repositories by name. 

For a repository to match a query, the repository's name must match all of the repo: patterns AND the default patterns (i.e., the patterns that are not prefixed with any search field). 

### <a id="SearchSymbols" href="#SearchSymbols">func SearchSymbols(ctx context.Context, args *search.TextParameters, limit int, stream streaming.Sender) (err error)</a>

```
searchKey: run.SearchSymbols
tags: [function]
```

```Go
func SearchSymbols(ctx context.Context, args *search.TextParameters, limit int, stream streaming.Sender) (err error)
```

SearchSymbols searches the given repos in parallel for symbols matching the given search query it can be used for both search suggestions and search results 

May return partial results and an error 

### <a id="TestCheckDiffCommitSearchLimits" href="#TestCheckDiffCommitSearchLimits">func TestCheckDiffCommitSearchLimits(t *testing.T)</a>

```
searchKey: run.TestCheckDiffCommitSearchLimits
tags: [function private test]
```

```Go
func TestCheckDiffCommitSearchLimits(t *testing.T)
```

### <a id="TestCommitSearchResult_Limit" href="#TestCommitSearchResult_Limit">func TestCommitSearchResult_Limit(t *testing.T)</a>

```
searchKey: run.TestCommitSearchResult_Limit
tags: [function private test]
```

```Go
func TestCommitSearchResult_Limit(t *testing.T)
```

### <a id="TestExpandUsernamesToEmails" href="#TestExpandUsernamesToEmails">func TestExpandUsernamesToEmails(t *testing.T)</a>

```
searchKey: run.TestExpandUsernamesToEmails
tags: [function private test]
```

```Go
func TestExpandUsernamesToEmails(t *testing.T)
```

### <a id="TestFileMatch_Limit" href="#TestFileMatch_Limit">func TestFileMatch_Limit(t *testing.T)</a>

```
searchKey: run.TestFileMatch_Limit
tags: [function private test]
```

```Go
func TestFileMatch_Limit(t *testing.T)
```

### <a id="TestHighlightMatches" href="#TestHighlightMatches">func TestHighlightMatches(t *testing.T)</a>

```
searchKey: run.TestHighlightMatches
tags: [function private test]
```

```Go
func TestHighlightMatches(t *testing.T)
```

### <a id="TestMatchRepos" href="#TestMatchRepos">func TestMatchRepos(t *testing.T)</a>

```
searchKey: run.TestMatchRepos
tags: [function private test]
```

```Go
func TestMatchRepos(t *testing.T)
```

### <a id="TestOrderedFuzzyRegexp" href="#TestOrderedFuzzyRegexp">func TestOrderedFuzzyRegexp(t *testing.T)</a>

```
searchKey: run.TestOrderedFuzzyRegexp
tags: [function private test]
```

```Go
func TestOrderedFuzzyRegexp(t *testing.T)
```

### <a id="TestRepoShouldBeAdded" href="#TestRepoShouldBeAdded">func TestRepoShouldBeAdded(t *testing.T)</a>

```
searchKey: run.TestRepoShouldBeAdded
tags: [function private test]
```

```Go
func TestRepoShouldBeAdded(t *testing.T)
```

### <a id="TestRepoShouldBeSearched" href="#TestRepoShouldBeSearched">func TestRepoShouldBeSearched(t *testing.T)</a>

```
searchKey: run.TestRepoShouldBeSearched
tags: [function private test]
```

```Go
func TestRepoShouldBeSearched(t *testing.T)
```

### <a id="TestSearchCommitsInRepo" href="#TestSearchCommitsInRepo">func TestSearchCommitsInRepo(t *testing.T)</a>

```
searchKey: run.TestSearchCommitsInRepo
tags: [function private test]
```

```Go
func TestSearchCommitsInRepo(t *testing.T)
```

### <a id="TestSearchFilesInRepos" href="#TestSearchFilesInRepos">func TestSearchFilesInRepos(t *testing.T)</a>

```
searchKey: run.TestSearchFilesInRepos
tags: [function private test]
```

```Go
func TestSearchFilesInRepos(t *testing.T)
```

### <a id="TestSearchFilesInReposStream" href="#TestSearchFilesInReposStream">func TestSearchFilesInReposStream(t *testing.T)</a>

```
searchKey: run.TestSearchFilesInReposStream
tags: [function private test]
```

```Go
func TestSearchFilesInReposStream(t *testing.T)
```

### <a id="TestSearchFilesInRepos_multipleRevsPerRepo" href="#TestSearchFilesInRepos_multipleRevsPerRepo">func TestSearchFilesInRepos_multipleRevsPerRepo(t *testing.T)</a>

```
searchKey: run.TestSearchFilesInRepos_multipleRevsPerRepo
tags: [function private test]
```

```Go
func TestSearchFilesInRepos_multipleRevsPerRepo(t *testing.T)
```

### <a id="TestSearchRepositories" href="#TestSearchRepositories">func TestSearchRepositories(t *testing.T)</a>

```
searchKey: run.TestSearchRepositories
tags: [function private test]
```

```Go
func TestSearchRepositories(t *testing.T)
```

### <a id="assertReposStatus" href="#assertReposStatus">func assertReposStatus(t *testing.T, repoNames map[api.RepoID]string, got search.RepoStatusMap, want map[string]search.RepoStatus)</a>

```
searchKey: run.assertReposStatus
tags: [function private]
```

```Go
func assertReposStatus(t *testing.T, repoNames map[api.RepoID]string, got search.RepoStatusMap, want map[string]search.RepoStatus)
```

### <a id="callSearcherOverRepos" href="#callSearcherOverRepos">func callSearcherOverRepos(ctx context.Context,...</a>

```
searchKey: run.callSearcherOverRepos
tags: [function private]
```

```Go
func callSearcherOverRepos(
	ctx context.Context,
	args *search.TextParameters,
	stream streaming.Sender,
	searcherRepos []*search.RepositoryRevisions,
	index bool,
) (err error)
```

callSearcherOverRepos calls searcher on searcherRepos. 

### <a id="checkDiffCommitSearchLimits" href="#checkDiffCommitSearchLimits">func checkDiffCommitSearchLimits(ctx context.Context, args *search.TextParameters, resultType string) error</a>

```
searchKey: run.checkDiffCommitSearchLimits
tags: [function private]
```

```Go
func checkDiffCommitSearchLimits(ctx context.Context, args *search.TextParameters, resultType string) error
```

### <a id="cleanDiffPreview" href="#cleanDiffPreview">func cleanDiffPreview(highlights []result.HighlightedRange, rawDiffResult string) (string, []result.HighlightedRange)</a>

```
searchKey: run.cleanDiffPreview
tags: [function private]
```

```Go
func cleanDiffPreview(highlights []result.HighlightedRange, rawDiffResult string) (string, []result.HighlightedRange)
```

### <a id="commitMatchesToMatches" href="#commitMatchesToMatches">func commitMatchesToMatches(commitMatches []*result.CommitMatch) []result.Match</a>

```
searchKey: run.commitMatchesToMatches
tags: [function private]
```

```Go
func commitMatchesToMatches(commitMatches []*result.CommitMatch) []result.Match
```

### <a id="commitParametersToDiffParameters" href="#commitParametersToDiffParameters">func commitParametersToDiffParameters(ctx context.Context, db dbutil.DB, op *search.CommitParameters) (*search.DiffParameters, error)</a>

```
searchKey: run.commitParametersToDiffParameters
tags: [function private]
```

```Go
func commitParametersToDiffParameters(ctx context.Context, db dbutil.DB, op *search.CommitParameters) (*search.DiffParameters, error)
```

### <a id="errorName" href="#errorName">func errorName(diff bool) string</a>

```
searchKey: run.errorName
tags: [function private]
```

```Go
func errorName(diff bool) string
```

### <a id="expandUsernamesToEmails" href="#expandUsernamesToEmails">func expandUsernamesToEmails(ctx context.Context, db dbutil.DB, values []string) (expandedValues []string, err error)</a>

```
searchKey: run.expandUsernamesToEmails
tags: [function private]
```

```Go
func expandUsernamesToEmails(ctx context.Context, db dbutil.DB, values []string) (expandedValues []string, err error)
```

expandUsernamesToEmails expands references to usernames to mention all possible (known and verified) email addresses for the user. 

For example, given a list ["foo", "@alice"] where the user "alice" has 2 email addresses "alice@example.com" and "alice@example.org", it would return ["foo", "alice@example\\.com", "alice@example\\.org"]. 

### <a id="fileMatchesToMatches" href="#fileMatchesToMatches">func fileMatchesToMatches(fms []*result.FileMatch) []result.Match</a>

```
searchKey: run.fileMatchesToMatches
tags: [function private]
```

```Go
func fileMatchesToMatches(fms []*result.FileMatch) []result.Match
```

### <a id="fromVCSHighlights" href="#fromVCSHighlights">func fromVCSHighlights(vcsHighlights []git.Highlight) []result.HighlightedRange</a>

```
searchKey: run.fromVCSHighlights
tags: [function private]
```

```Go
func fromVCSHighlights(vcsHighlights []git.Highlight) []result.HighlightedRange
```

### <a id="getRepos" href="#getRepos">func getRepos(ctx context.Context, p *search.Promise) ([]*search.RepositoryRevisions, error)</a>

```
searchKey: run.getRepos
tags: [function private]
```

```Go
func getRepos(ctx context.Context, p *search.Promise) ([]*search.RepositoryRevisions, error)
```

getRepos is a wrapper around p.Get. It returns an error if the promise contains an underlying type other than []*search.RepositoryRevisions. 

### <a id="handleRepoSearchResult" href="#handleRepoSearchResult">func handleRepoSearchResult(repoRev *search.RepositoryRevisions, limitHit, timedOut bool, searchErr error) (_ streaming.Stats, fatalErr error)</a>

```
searchKey: run.handleRepoSearchResult
tags: [function private]
```

```Go
func handleRepoSearchResult(repoRev *search.RepositoryRevisions, limitHit, timedOut bool, searchErr error) (_ streaming.Stats, fatalErr error)
```

handleRepoSearchResult handles the limitHit and searchErr returned by a search function, returning common as to reflect that new information. If searchErr is a fatal error, it returns a non-nil error; otherwise, if searchErr == nil or a non-fatal error, it returns a nil error. 

### <a id="highlightMatches" href="#highlightMatches">func highlightMatches(pattern *regexp.Regexp, data []byte) *result.HighlightedString</a>

```
searchKey: run.highlightMatches
tags: [function private]
```

```Go
func highlightMatches(pattern *regexp.Regexp, data []byte) *result.HighlightedString
```

### <a id="indexedSymbolsBranch" href="#indexedSymbolsBranch">func indexedSymbolsBranch(ctx context.Context, repository, commit string) string</a>

```
searchKey: run.indexedSymbolsBranch
tags: [function private]
```

```Go
func indexedSymbolsBranch(ctx context.Context, repository, commit string) string
```

indexedSymbols checks to see if Zoekt has indexed symbols information for a repository at a specific commit. If it has it returns the branch name (for use when querying zoekt). Otherwise an empty string is returned. 

### <a id="limitOrDefault" href="#limitOrDefault">func limitOrDefault(first *int32) int</a>

```
searchKey: run.limitOrDefault
tags: [function private]
```

```Go
func limitOrDefault(first *int32) int
```

### <a id="logCommitSearchResultsToMatches" href="#logCommitSearchResultsToMatches">func logCommitSearchResultsToMatches(op *search.CommitParameters, repoName types.RepoName, rawResults []*git.LogCommitSearchResult) []*result.CommitMatch</a>

```
searchKey: run.logCommitSearchResultsToMatches
tags: [function private]
```

```Go
func logCommitSearchResultsToMatches(op *search.CommitParameters, repoName types.RepoName, rawResults []*git.LogCommitSearchResult) []*result.CommitMatch
```

### <a id="makeRepositoryRevisions" href="#makeRepositoryRevisions">func makeRepositoryRevisions(repos ...string) []*search.RepositoryRevisions</a>

```
searchKey: run.makeRepositoryRevisions
tags: [function private]
```

```Go
func makeRepositoryRevisions(repos ...string) []*search.RepositoryRevisions
```

### <a id="matchRepos" href="#matchRepos">func matchRepos(pattern *regexp.Regexp, resolved []*search.RepositoryRevisions, results chan<- []*search.RepositoryRevisions)</a>

```
searchKey: run.matchRepos
tags: [function private]
```

```Go
func matchRepos(pattern *regexp.Regexp, resolved []*search.RepositoryRevisions, results chan<- []*search.RepositoryRevisions)
```

### <a id="matchesToFileMatches" href="#matchesToFileMatches">func matchesToFileMatches(matches []result.Match) ([]*result.FileMatch, error)</a>

```
searchKey: run.matchesToFileMatches
tags: [function private]
```

```Go
func matchesToFileMatches(matches []result.Match) ([]*result.FileMatch, error)
```

### <a id="mkRepos" href="#mkRepos">func mkRepos(names ...string) []types.RepoName</a>

```
searchKey: run.mkRepos
tags: [function private]
```

```Go
func mkRepos(names ...string) []types.RepoName
```

### <a id="orderedFuzzyRegexp" href="#orderedFuzzyRegexp">func orderedFuzzyRegexp(pieces []string) string</a>

```
searchKey: run.orderedFuzzyRegexp
tags: [function private]
```

```Go
func orderedFuzzyRegexp(pieces []string) string
```

orderedFuzzyRegexp interpolate a lazy 'match everything' regexp pattern to achieve an ordered fuzzy regexp match. 

### <a id="repoHasFilesWithNamesMatching" href="#repoHasFilesWithNamesMatching">func repoHasFilesWithNamesMatching(ctx context.Context, searcherURLs *endpoint.Map, include bool, repoHasFileFlag []string, gitserverRepo api.RepoName, commit api.CommitID, fetchTimeout time.Duration) (bool, error)</a>

```
searchKey: run.repoHasFilesWithNamesMatching
tags: [function private]
```

```Go
func repoHasFilesWithNamesMatching(ctx context.Context, searcherURLs *endpoint.Map, include bool, repoHasFileFlag []string, gitserverRepo api.RepoName, commit api.CommitID, fetchTimeout time.Duration) (bool, error)
```

repoHasFilesWithNamesMatching searches in a repository for matches for the patterns in the `repohasfile` or `-repohasfile` flags, and returns whether or not the repoShouldBeSearched in or not, based on whether matches were returned. 

### <a id="repoRevsToRepoMatches" href="#repoRevsToRepoMatches">func repoRevsToRepoMatches(ctx context.Context, repos []*search.RepositoryRevisions) []result.Match</a>

```
searchKey: run.repoRevsToRepoMatches
tags: [function private]
```

```Go
func repoRevsToRepoMatches(ctx context.Context, repos []*search.RepositoryRevisions) []result.Match
```

### <a id="repoShouldBeAdded" href="#repoShouldBeAdded">func repoShouldBeAdded(ctx context.Context, zoekt *searchbackend.Zoekt, repo *search.RepositoryRevisions, pattern *search.TextPatternInfo) (bool, error)</a>

```
searchKey: run.repoShouldBeAdded
tags: [function private]
```

```Go
func repoShouldBeAdded(ctx context.Context, zoekt *searchbackend.Zoekt, repo *search.RepositoryRevisions, pattern *search.TextPatternInfo) (bool, error)
```

repoShouldBeAdded determines whether a repository should be included in the result set based on whether the repository fits in the subset of repostiories specified in the query's `repohasfile` and `-repohasfile` fields if they exist. 

### <a id="repoShouldBeSearched" href="#repoShouldBeSearched">func repoShouldBeSearched(ctx context.Context, searcherURLs *endpoint.Map, searchPattern *search.TextPatternInfo, gitserverRepo api.RepoName, commit api.CommitID, fetchTimeout time.Duration) (shouldBeSearched bool, err error)</a>

```
searchKey: run.repoShouldBeSearched
tags: [function private]
```

```Go
func repoShouldBeSearched(ctx context.Context, searcherURLs *endpoint.Map, searchPattern *search.TextPatternInfo, gitserverRepo api.RepoName, commit api.CommitID, fetchTimeout time.Duration) (shouldBeSearched bool, err error)
```

repoShouldBeSearched determines whether a repository should be searched in, based on whether the repository fits in the subset of repositories specified in the query's `repohasfile` and `-repohasfile` flags if they exist. 

### <a id="reposToAdd" href="#reposToAdd">func reposToAdd(ctx context.Context, args *search.TextParameters, repos []*search.RepositoryRevisions) ([]*search.RepositoryRevisions, error)</a>

```
searchKey: run.reposToAdd
tags: [function private]
```

```Go
func reposToAdd(ctx context.Context, args *search.TextParameters, repos []*search.RepositoryRevisions) ([]*search.RepositoryRevisions, error)
```

reposToAdd determines which repositories should be included in the result set based on whether they fit in the subset of repostiories specified in the query's `repohasfile` and `-repohasfile` fields if they exist. 

### <a id="resetMocks" href="#resetMocks">func resetMocks()</a>

```
searchKey: run.resetMocks
tags: [function private]
```

```Go
func resetMocks()
```

### <a id="searchCommitsInRepo" href="#searchCommitsInRepo">func searchCommitsInRepo(ctx context.Context, db dbutil.DB, op search.CommitParameters) (results []*result.CommitMatch, limitHit, timedOut bool, err error)</a>

```
searchKey: run.searchCommitsInRepo
tags: [function private]
```

```Go
func searchCommitsInRepo(ctx context.Context, db dbutil.DB, op search.CommitParameters) (results []*result.CommitMatch, limitHit, timedOut bool, err error)
```

searchCommitsInRepo is a blocking version of searchCommitsInRepoStream. 

### <a id="searchRepositoriesBatch" href="#searchRepositoriesBatch">func searchRepositoriesBatch(ctx context.Context, args *search.TextParameters, limit int32) ([]result.Match, streaming.Stats, error)</a>

```
searchKey: run.searchRepositoriesBatch
tags: [function private]
```

```Go
func searchRepositoriesBatch(ctx context.Context, args *search.TextParameters, limit int32) ([]result.Match, streaming.Stats, error)
```

### <a id="searchSymbolsInRepo" href="#searchSymbolsInRepo">func searchSymbolsInRepo(ctx context.Context, repoRevs *search.RepositoryRevisions, patternInfo *search.TextPatternInfo, limit int) (res []*result.FileMatch, err error)</a>

```
searchKey: run.searchSymbolsInRepo
tags: [function private]
```

```Go
func searchSymbolsInRepo(ctx context.Context, repoRevs *search.RepositoryRevisions, patternInfo *search.TextPatternInfo, limit int) (res []*result.FileMatch, err error)
```

### <a id="searchZoektSymbols" href="#searchZoektSymbols">func searchZoektSymbols(ctx context.Context, repoName types.RepoName, commitID api.CommitID, inputRev *string, branch string, queryString *string, first *int32, includePatterns *[]string) (res []*result.SymbolMatch, err error)</a>

```
searchKey: run.searchZoektSymbols
tags: [function private]
```

```Go
func searchZoektSymbols(ctx context.Context, repoName types.RepoName, commitID api.CommitID, inputRev *string, branch string, queryString *string, first *int32, includePatterns *[]string) (res []*result.SymbolMatch, err error)
```

### <a id="statsDeref" href="#statsDeref">func statsDeref(s *streaming.Stats) streaming.Stats</a>

```
searchKey: run.statsDeref
tags: [function private]
```

```Go
func statsDeref(s *streaming.Stats) streaming.Stats
```

