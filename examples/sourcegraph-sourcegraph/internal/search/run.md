# Package run

## Index

* [Constants](#const)
    * [const defaultMaxSearchResults](#defaultMaxSearchResults)
    * [const DefaultSymbolLimit](#DefaultSymbolLimit)
* [Variables](#var)
    * [var MockSearchRepositories](#MockSearchRepositories)
    * [var MockSearchSymbols](#MockSearchSymbols)
    * [var textSearchLimiter](#textSearchLimiter)
    * [var mockSearchFilesInRepo](#mockSearchFilesInRepo)
    * [var MockSearchFilesInRepos](#MockSearchFilesInRepos)
* [Types](#type)
    * [type Aggregator struct](#Aggregator)
        * [func NewAggregator(db dbutil.DB, stream streaming.Sender) *Aggregator](#NewAggregator)
        * [func (a *Aggregator) Get() ([]result.Match, streaming.Stats, *multierror.Error)](#Aggregator.Get)
        * [func (a *Aggregator) Send(event streaming.SearchEvent)](#Aggregator.Send)
        * [func (a *Aggregator) Error(err error)](#Aggregator.Error)
        * [func (a *Aggregator) DoRepoSearch(ctx context.Context, args *search.TextParameters, limit int32) (err error)](#Aggregator.DoRepoSearch)
        * [func (a *Aggregator) DoSymbolSearch(ctx context.Context, args *search.TextParameters, limit int) (err error)](#Aggregator.DoSymbolSearch)
        * [func (a *Aggregator) DoFilePathSearch(ctx context.Context, args *search.TextParameters) (err error)](#Aggregator.DoFilePathSearch)
        * [func (a *Aggregator) DoDiffSearch(ctx context.Context, tp *search.TextParameters) (err error)](#Aggregator.DoDiffSearch)
        * [func (a *Aggregator) DoCommitSearch(ctx context.Context, tp *search.TextParameters) (err error)](#Aggregator.DoCommitSearch)
    * [type DiffCommitError struct](#DiffCommitError)
    * [type RepoLimitError run.DiffCommitError](#RepoLimitError)
        * [func (*RepoLimitError) Error() string](#RepoLimitError.Error)
    * [type TimeLimitError run.DiffCommitError](#TimeLimitError)
        * [func (*TimeLimitError) Error() string](#TimeLimitError.Error)
    * [type SearchCommitsInReposParameters struct](#SearchCommitsInReposParameters)
    * [type SearchInputs struct](#SearchInputs)
        * [func (inputs SearchInputs) MaxResults() int](#SearchInputs.MaxResults)
    * [type SearchPaginationInfo struct](#SearchPaginationInfo)
    * [type SearchCursor struct](#SearchCursor)
* [Functions](#func)
    * [func checkDiffCommitSearchLimits(ctx context.Context, args *search.TextParameters, resultType string) error](#checkDiffCommitSearchLimits)
    * [func commitParametersToDiffParameters(ctx context.Context, db dbutil.DB, op *search.CommitParameters) (*search.DiffParameters, error)](#commitParametersToDiffParameters)
    * [func SearchCommitsInRepoStream(ctx context.Context, db dbutil.DB, op search.CommitParameters, s streaming.Sender) (err error)](#SearchCommitsInRepoStream)
    * [func errorName(diff bool) string](#errorName)
    * [func orderedFuzzyRegexp(pieces []string) string](#orderedFuzzyRegexp)
    * [func logCommitSearchResultsToMatches(op *search.CommitParameters, repoName types.RepoName, rawResults []*git.LogCommitSearchResult) []*result.CommitMatch](#logCommitSearchResultsToMatches)
    * [func fromVCSHighlights(vcsHighlights []git.Highlight) []result.HighlightedRange](#fromVCSHighlights)
    * [func cleanDiffPreview(highlights []result.HighlightedRange, rawDiffResult string) (string, []result.HighlightedRange)](#cleanDiffPreview)
    * [func highlightMatches(pattern *regexp.Regexp, data []byte) *result.HighlightedString](#highlightMatches)
    * [func ResolveCommitParameters(ctx context.Context, tp *search.TextParameters) (*search.TextParametersForCommitParameters, error)](#ResolveCommitParameters)
    * [func SearchCommitsInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, params SearchCommitsInReposParameters) (err error)](#SearchCommitsInRepos)
    * [func SearchCommitDiffsInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, resultChannel streaming.Sender) error](#SearchCommitDiffsInRepos)
    * [func SearchCommitLogInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, resultChannel streaming.Sender) error](#SearchCommitLogInRepos)
    * [func commitMatchesToMatches(commitMatches []*result.CommitMatch) []result.Match](#commitMatchesToMatches)
    * [func expandUsernamesToEmails(ctx context.Context, db dbutil.DB, values []string) (expandedValues []string, err error)](#expandUsernamesToEmails)
    * [func SearchRepositories(ctx context.Context, args *search.TextParameters, limit int32, stream streaming.Sender) (err error)](#SearchRepositories)
    * [func repoRevsToRepoMatches(ctx context.Context, repos []*search.RepositoryRevisions) []result.Match](#repoRevsToRepoMatches)
    * [func matchRepos(pattern *regexp.Regexp, resolved []*search.RepositoryRevisions, results chan<- []*search.RepositoryRevisions)](#matchRepos)
    * [func reposToAdd(ctx context.Context, args *search.TextParameters, repos []*search.RepositoryRevisions) ([]*search.RepositoryRevisions, error)](#reposToAdd)
    * [func handleRepoSearchResult(repoRev *search.RepositoryRevisions, limitHit, timedOut bool, searchErr error) (_ streaming.Stats, fatalErr error)](#handleRepoSearchResult)
    * [func getRepos(ctx context.Context, p *search.Promise) ([]*search.RepositoryRevisions, error)](#getRepos)
    * [func statsDeref(s *streaming.Stats) streaming.Stats](#statsDeref)
    * [func SearchSymbols(ctx context.Context, args *search.TextParameters, limit int, stream streaming.Sender) (err error)](#SearchSymbols)
    * [func searchSymbolsInRepo(ctx context.Context, repoRevs *search.RepositoryRevisions, patternInfo *search.TextPatternInfo, limit int) (res []*result.FileMatch, err error)](#searchSymbolsInRepo)
    * [func indexedSymbolsBranch(ctx context.Context, repository, commit string) string](#indexedSymbolsBranch)
    * [func searchZoektSymbols(ctx context.Context, repoName types.RepoName, commitID api.CommitID, inputRev *string, branch string, queryString *string, first *int32, includePatterns *[]string) (res []*result.SymbolMatch, err error)](#searchZoektSymbols)
    * [func ComputeSymbols(ctx context.Context, repoName types.RepoName, commitID api.CommitID, inputRev *string, query *string, first *int32, includePatterns *[]string) (res []*result.SymbolMatch, err error)](#ComputeSymbols)
    * [func limitOrDefault(first *int32) int](#limitOrDefault)
    * [func SearchFilesInRepo(ctx context.Context, searcherURLs *endpoint.Map, repo types.RepoName, gitserverRepo api.RepoName, rev string, index bool, info *search.TextPatternInfo, fetchTimeout time.Duration) ([]*result.FileMatch, bool, error)](#SearchFilesInRepo)
    * [func repoShouldBeSearched(ctx context.Context, searcherURLs *endpoint.Map, searchPattern *search.TextPatternInfo, gitserverRepo api.RepoName, commit api.CommitID, fetchTimeout time.Duration) (shouldBeSearched bool, err error)](#repoShouldBeSearched)
    * [func repoHasFilesWithNamesMatching(ctx context.Context, searcherURLs *endpoint.Map, include bool, repoHasFileFlag []string, gitserverRepo api.RepoName, commit api.CommitID, fetchTimeout time.Duration) (bool, error)](#repoHasFilesWithNamesMatching)
    * [func fileMatchesToMatches(fms []*result.FileMatch) []result.Match](#fileMatchesToMatches)
    * [func matchesToFileMatches(matches []result.Match) ([]*result.FileMatch, error)](#matchesToFileMatches)
    * [func SearchFilesInReposBatch(ctx context.Context, args *search.TextParameters) ([]*result.FileMatch, streaming.Stats, error)](#SearchFilesInReposBatch)
    * [func SearchFilesInRepos(ctx context.Context, args *search.TextParameters, stream streaming.Sender) (err error)](#SearchFilesInRepos)
    * [func callSearcherOverRepos(ctx context.Context,...](#callSearcherOverRepos)
    * [func TestCheckDiffCommitSearchLimits(t *testing.T)](#TestCheckDiffCommitSearchLimits)
    * [func TestSearchCommitsInRepo(t *testing.T)](#TestSearchCommitsInRepo)
    * [func resetMocks()](#resetMocks)
    * [func TestExpandUsernamesToEmails(t *testing.T)](#TestExpandUsernamesToEmails)
    * [func TestHighlightMatches(t *testing.T)](#TestHighlightMatches)
    * [func Benchmark_highlightMatches(b *testing.B)](#Benchmark_highlightMatches)
    * [func searchCommitsInRepo(ctx context.Context, db dbutil.DB, op search.CommitParameters) (results []*result.CommitMatch, limitHit, timedOut bool, err error)](#searchCommitsInRepo)
    * [func TestCommitSearchResult_Limit(t *testing.T)](#TestCommitSearchResult_Limit)
    * [func TestSearchRepositories(t *testing.T)](#TestSearchRepositories)
    * [func searchRepositoriesBatch(ctx context.Context, args *search.TextParameters, limit int32) ([]result.Match, streaming.Stats, error)](#searchRepositoriesBatch)
    * [func TestRepoShouldBeAdded(t *testing.T)](#TestRepoShouldBeAdded)
    * [func repoShouldBeAdded(ctx context.Context, zoekt *searchbackend.Zoekt, repo *search.RepositoryRevisions, pattern *search.TextPatternInfo) (bool, error)](#repoShouldBeAdded)
    * [func TestMatchRepos(t *testing.T)](#TestMatchRepos)
    * [func BenchmarkSearchRepositories(b *testing.B)](#BenchmarkSearchRepositories)
    * [func TestOrderedFuzzyRegexp(t *testing.T)](#TestOrderedFuzzyRegexp)
    * [func TestSearchFilesInRepos(t *testing.T)](#TestSearchFilesInRepos)
    * [func TestSearchFilesInReposStream(t *testing.T)](#TestSearchFilesInReposStream)
    * [func assertReposStatus(t *testing.T, repoNames map[api.RepoID]string, got search.RepoStatusMap, want map[string]search.RepoStatus)](#assertReposStatus)
    * [func TestSearchFilesInRepos_multipleRevsPerRepo(t *testing.T)](#TestSearchFilesInRepos_multipleRevsPerRepo)
    * [func TestRepoShouldBeSearched(t *testing.T)](#TestRepoShouldBeSearched)
    * [func makeRepositoryRevisions(repos ...string) []*search.RepositoryRevisions](#makeRepositoryRevisions)
    * [func mkRepos(names ...string) []types.RepoName](#mkRepos)
    * [func TestFileMatch_Limit(t *testing.T)](#TestFileMatch_Limit)


## <a id="const" href="#const">Constants</a>

### <a id="defaultMaxSearchResults" href="#defaultMaxSearchResults">const defaultMaxSearchResults</a>

```
searchKey: run.defaultMaxSearchResults
```

```Go
const defaultMaxSearchResults = 30
```

### <a id="DefaultSymbolLimit" href="#DefaultSymbolLimit">const DefaultSymbolLimit</a>

```
searchKey: run.DefaultSymbolLimit
tags: [exported]
```

```Go
const DefaultSymbolLimit = 100
```

## <a id="var" href="#var">Variables</a>

### <a id="MockSearchRepositories" href="#MockSearchRepositories">var MockSearchRepositories</a>

```
searchKey: run.MockSearchRepositories
tags: [exported]
```

```Go
var MockSearchRepositories func(args *search.TextParameters) ([]result.Match, *streaming.Stats, error) = ...
```

### <a id="MockSearchSymbols" href="#MockSearchSymbols">var MockSearchSymbols</a>

```
searchKey: run.MockSearchSymbols
tags: [exported]
```

```Go
var MockSearchSymbols func(ctx context.Context, args *search.TextParameters, limit int) (res []*result.FileMatch, stats *streaming.Stats, err error) = ...
```

### <a id="textSearchLimiter" href="#textSearchLimiter">var textSearchLimiter</a>

```
searchKey: run.textSearchLimiter
```

```Go
var textSearchLimiter = mutablelimiter.New(32)
```

A global limiter on number of concurrent searcher searches. 

### <a id="mockSearchFilesInRepo" href="#mockSearchFilesInRepo">var mockSearchFilesInRepo</a>

```
searchKey: run.mockSearchFilesInRepo
```

```Go
var mockSearchFilesInRepo func(ctx context.Context, repo types.RepoName, gitserverRepo api.RepoName, rev string, info *search.TextPatternInfo, fetchTimeout time.Duration) (matches []*result.FileMatch, limitHit bool, err error) = ...
```

### <a id="MockSearchFilesInRepos" href="#MockSearchFilesInRepos">var MockSearchFilesInRepos</a>

```
searchKey: run.MockSearchFilesInRepos
tags: [exported]
```

```Go
var MockSearchFilesInRepos func(args *search.TextParameters) ([]*result.FileMatch, *streaming.Stats, error) = ...
```

## <a id="type" href="#type">Types</a>

### <a id="Aggregator" href="#Aggregator">type Aggregator struct</a>

```
searchKey: run.Aggregator
tags: [exported]
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
tags: [exported]
```

```Go
func NewAggregator(db dbutil.DB, stream streaming.Sender) *Aggregator
```

#### <a id="Aggregator.Get" href="#Aggregator.Get">func (a *Aggregator) Get() ([]result.Match, streaming.Stats, *multierror.Error)</a>

```
searchKey: run.Aggregator.Get
tags: [exported]
```

```Go
func (a *Aggregator) Get() ([]result.Match, streaming.Stats, *multierror.Error)
```

Get finalises aggregation over the stream and returns the aggregated result. It should only be called once each do* function is finished running. 

#### <a id="Aggregator.Send" href="#Aggregator.Send">func (a *Aggregator) Send(event streaming.SearchEvent)</a>

```
searchKey: run.Aggregator.Send
tags: [exported]
```

```Go
func (a *Aggregator) Send(event streaming.SearchEvent)
```

#### <a id="Aggregator.Error" href="#Aggregator.Error">func (a *Aggregator) Error(err error)</a>

```
searchKey: run.Aggregator.Error
tags: [exported]
```

```Go
func (a *Aggregator) Error(err error)
```

#### <a id="Aggregator.DoRepoSearch" href="#Aggregator.DoRepoSearch">func (a *Aggregator) DoRepoSearch(ctx context.Context, args *search.TextParameters, limit int32) (err error)</a>

```
searchKey: run.Aggregator.DoRepoSearch
tags: [exported]
```

```Go
func (a *Aggregator) DoRepoSearch(ctx context.Context, args *search.TextParameters, limit int32) (err error)
```

#### <a id="Aggregator.DoSymbolSearch" href="#Aggregator.DoSymbolSearch">func (a *Aggregator) DoSymbolSearch(ctx context.Context, args *search.TextParameters, limit int) (err error)</a>

```
searchKey: run.Aggregator.DoSymbolSearch
tags: [exported]
```

```Go
func (a *Aggregator) DoSymbolSearch(ctx context.Context, args *search.TextParameters, limit int) (err error)
```

#### <a id="Aggregator.DoFilePathSearch" href="#Aggregator.DoFilePathSearch">func (a *Aggregator) DoFilePathSearch(ctx context.Context, args *search.TextParameters) (err error)</a>

```
searchKey: run.Aggregator.DoFilePathSearch
tags: [exported]
```

```Go
func (a *Aggregator) DoFilePathSearch(ctx context.Context, args *search.TextParameters) (err error)
```

#### <a id="Aggregator.DoDiffSearch" href="#Aggregator.DoDiffSearch">func (a *Aggregator) DoDiffSearch(ctx context.Context, tp *search.TextParameters) (err error)</a>

```
searchKey: run.Aggregator.DoDiffSearch
tags: [exported]
```

```Go
func (a *Aggregator) DoDiffSearch(ctx context.Context, tp *search.TextParameters) (err error)
```

#### <a id="Aggregator.DoCommitSearch" href="#Aggregator.DoCommitSearch">func (a *Aggregator) DoCommitSearch(ctx context.Context, tp *search.TextParameters) (err error)</a>

```
searchKey: run.Aggregator.DoCommitSearch
tags: [exported]
```

```Go
func (a *Aggregator) DoCommitSearch(ctx context.Context, tp *search.TextParameters) (err error)
```

### <a id="DiffCommitError" href="#DiffCommitError">type DiffCommitError struct</a>

```
searchKey: run.DiffCommitError
tags: [exported]
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
tags: [exported]
```

```Go
type RepoLimitError DiffCommitError
```

#### <a id="RepoLimitError.Error" href="#RepoLimitError.Error">func (*RepoLimitError) Error() string</a>

```
searchKey: run.RepoLimitError.Error
tags: [exported]
```

```Go
func (*RepoLimitError) Error() string
```

### <a id="TimeLimitError" href="#TimeLimitError">type TimeLimitError run.DiffCommitError</a>

```
searchKey: run.TimeLimitError
tags: [exported]
```

```Go
type TimeLimitError DiffCommitError
```

#### <a id="TimeLimitError.Error" href="#TimeLimitError.Error">func (*TimeLimitError) Error() string</a>

```
searchKey: run.TimeLimitError.Error
tags: [exported]
```

```Go
func (*TimeLimitError) Error() string
```

### <a id="SearchCommitsInReposParameters" href="#SearchCommitsInReposParameters">type SearchCommitsInReposParameters struct</a>

```
searchKey: run.SearchCommitsInReposParameters
tags: [exported]
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

### <a id="SearchInputs" href="#SearchInputs">type SearchInputs struct</a>

```
searchKey: run.SearchInputs
tags: [exported]
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
tags: [exported]
```

```Go
func (inputs SearchInputs) MaxResults() int
```

MaxResults computes the limit for the query. 

### <a id="SearchPaginationInfo" href="#SearchPaginationInfo">type SearchPaginationInfo struct</a>

```
searchKey: run.SearchPaginationInfo
tags: [exported]
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

### <a id="SearchCursor" href="#SearchCursor">type SearchCursor struct</a>

```
searchKey: run.SearchCursor
tags: [exported]
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

## <a id="func" href="#func">Functions</a>

### <a id="checkDiffCommitSearchLimits" href="#checkDiffCommitSearchLimits">func checkDiffCommitSearchLimits(ctx context.Context, args *search.TextParameters, resultType string) error</a>

```
searchKey: run.checkDiffCommitSearchLimits
```

```Go
func checkDiffCommitSearchLimits(ctx context.Context, args *search.TextParameters, resultType string) error
```

### <a id="commitParametersToDiffParameters" href="#commitParametersToDiffParameters">func commitParametersToDiffParameters(ctx context.Context, db dbutil.DB, op *search.CommitParameters) (*search.DiffParameters, error)</a>

```
searchKey: run.commitParametersToDiffParameters
```

```Go
func commitParametersToDiffParameters(ctx context.Context, db dbutil.DB, op *search.CommitParameters) (*search.DiffParameters, error)
```

### <a id="SearchCommitsInRepoStream" href="#SearchCommitsInRepoStream">func SearchCommitsInRepoStream(ctx context.Context, db dbutil.DB, op search.CommitParameters, s streaming.Sender) (err error)</a>

```
searchKey: run.SearchCommitsInRepoStream
tags: [exported]
```

```Go
func SearchCommitsInRepoStream(ctx context.Context, db dbutil.DB, op search.CommitParameters, s streaming.Sender) (err error)
```

SearchCommitsInRepoStream searches for commits based on op. 

### <a id="errorName" href="#errorName">func errorName(diff bool) string</a>

```
searchKey: run.errorName
```

```Go
func errorName(diff bool) string
```

### <a id="orderedFuzzyRegexp" href="#orderedFuzzyRegexp">func orderedFuzzyRegexp(pieces []string) string</a>

```
searchKey: run.orderedFuzzyRegexp
```

```Go
func orderedFuzzyRegexp(pieces []string) string
```

orderedFuzzyRegexp interpolate a lazy 'match everything' regexp pattern to achieve an ordered fuzzy regexp match. 

### <a id="logCommitSearchResultsToMatches" href="#logCommitSearchResultsToMatches">func logCommitSearchResultsToMatches(op *search.CommitParameters, repoName types.RepoName, rawResults []*git.LogCommitSearchResult) []*result.CommitMatch</a>

```
searchKey: run.logCommitSearchResultsToMatches
```

```Go
func logCommitSearchResultsToMatches(op *search.CommitParameters, repoName types.RepoName, rawResults []*git.LogCommitSearchResult) []*result.CommitMatch
```

### <a id="fromVCSHighlights" href="#fromVCSHighlights">func fromVCSHighlights(vcsHighlights []git.Highlight) []result.HighlightedRange</a>

```
searchKey: run.fromVCSHighlights
```

```Go
func fromVCSHighlights(vcsHighlights []git.Highlight) []result.HighlightedRange
```

### <a id="cleanDiffPreview" href="#cleanDiffPreview">func cleanDiffPreview(highlights []result.HighlightedRange, rawDiffResult string) (string, []result.HighlightedRange)</a>

```
searchKey: run.cleanDiffPreview
```

```Go
func cleanDiffPreview(highlights []result.HighlightedRange, rawDiffResult string) (string, []result.HighlightedRange)
```

### <a id="highlightMatches" href="#highlightMatches">func highlightMatches(pattern *regexp.Regexp, data []byte) *result.HighlightedString</a>

```
searchKey: run.highlightMatches
```

```Go
func highlightMatches(pattern *regexp.Regexp, data []byte) *result.HighlightedString
```

### <a id="ResolveCommitParameters" href="#ResolveCommitParameters">func ResolveCommitParameters(ctx context.Context, tp *search.TextParameters) (*search.TextParametersForCommitParameters, error)</a>

```
searchKey: run.ResolveCommitParameters
tags: [exported]
```

```Go
func ResolveCommitParameters(ctx context.Context, tp *search.TextParameters) (*search.TextParametersForCommitParameters, error)
```

ResolveCommitParameters creates parameters for commit search from tp. It will wait for the list of repos to be resolved. 

### <a id="SearchCommitsInRepos" href="#SearchCommitsInRepos">func SearchCommitsInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, params SearchCommitsInReposParameters) (err error)</a>

```
searchKey: run.SearchCommitsInRepos
tags: [exported]
```

```Go
func SearchCommitsInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, params SearchCommitsInReposParameters) (err error)
```

### <a id="SearchCommitDiffsInRepos" href="#SearchCommitDiffsInRepos">func SearchCommitDiffsInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, resultChannel streaming.Sender) error</a>

```
searchKey: run.SearchCommitDiffsInRepos
tags: [exported]
```

```Go
func SearchCommitDiffsInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, resultChannel streaming.Sender) error
```

SearchCommitDiffsInRepos searches a set of repos for matching commit diffs. 

### <a id="SearchCommitLogInRepos" href="#SearchCommitLogInRepos">func SearchCommitLogInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, resultChannel streaming.Sender) error</a>

```
searchKey: run.SearchCommitLogInRepos
tags: [exported]
```

```Go
func SearchCommitLogInRepos(ctx context.Context, db dbutil.DB, args *search.TextParametersForCommitParameters, resultChannel streaming.Sender) error
```

SearchCommitLogInRepos searches a set of repos for matching commits. 

### <a id="commitMatchesToMatches" href="#commitMatchesToMatches">func commitMatchesToMatches(commitMatches []*result.CommitMatch) []result.Match</a>

```
searchKey: run.commitMatchesToMatches
```

```Go
func commitMatchesToMatches(commitMatches []*result.CommitMatch) []result.Match
```

### <a id="expandUsernamesToEmails" href="#expandUsernamesToEmails">func expandUsernamesToEmails(ctx context.Context, db dbutil.DB, values []string) (expandedValues []string, err error)</a>

```
searchKey: run.expandUsernamesToEmails
```

```Go
func expandUsernamesToEmails(ctx context.Context, db dbutil.DB, values []string) (expandedValues []string, err error)
```

expandUsernamesToEmails expands references to usernames to mention all possible (known and verified) email addresses for the user. 

For example, given a list ["foo", "@alice"] where the user "alice" has 2 email addresses "alice@example.com" and "alice@example.org", it would return ["foo", "alice@example\\.com", "alice@example\\.org"]. 

### <a id="SearchRepositories" href="#SearchRepositories">func SearchRepositories(ctx context.Context, args *search.TextParameters, limit int32, stream streaming.Sender) (err error)</a>

```
searchKey: run.SearchRepositories
tags: [exported]
```

```Go
func SearchRepositories(ctx context.Context, args *search.TextParameters, limit int32, stream streaming.Sender) (err error)
```

SearchRepositories searches for repositories by name. 

For a repository to match a query, the repository's name must match all of the repo: patterns AND the default patterns (i.e., the patterns that are not prefixed with any search field). 

### <a id="repoRevsToRepoMatches" href="#repoRevsToRepoMatches">func repoRevsToRepoMatches(ctx context.Context, repos []*search.RepositoryRevisions) []result.Match</a>

```
searchKey: run.repoRevsToRepoMatches
```

```Go
func repoRevsToRepoMatches(ctx context.Context, repos []*search.RepositoryRevisions) []result.Match
```

### <a id="matchRepos" href="#matchRepos">func matchRepos(pattern *regexp.Regexp, resolved []*search.RepositoryRevisions, results chan<- []*search.RepositoryRevisions)</a>

```
searchKey: run.matchRepos
```

```Go
func matchRepos(pattern *regexp.Regexp, resolved []*search.RepositoryRevisions, results chan<- []*search.RepositoryRevisions)
```

### <a id="reposToAdd" href="#reposToAdd">func reposToAdd(ctx context.Context, args *search.TextParameters, repos []*search.RepositoryRevisions) ([]*search.RepositoryRevisions, error)</a>

```
searchKey: run.reposToAdd
```

```Go
func reposToAdd(ctx context.Context, args *search.TextParameters, repos []*search.RepositoryRevisions) ([]*search.RepositoryRevisions, error)
```

reposToAdd determines which repositories should be included in the result set based on whether they fit in the subset of repostiories specified in the query's `repohasfile` and `-repohasfile` fields if they exist. 

### <a id="handleRepoSearchResult" href="#handleRepoSearchResult">func handleRepoSearchResult(repoRev *search.RepositoryRevisions, limitHit, timedOut bool, searchErr error) (_ streaming.Stats, fatalErr error)</a>

```
searchKey: run.handleRepoSearchResult
```

```Go
func handleRepoSearchResult(repoRev *search.RepositoryRevisions, limitHit, timedOut bool, searchErr error) (_ streaming.Stats, fatalErr error)
```

handleRepoSearchResult handles the limitHit and searchErr returned by a search function, returning common as to reflect that new information. If searchErr is a fatal error, it returns a non-nil error; otherwise, if searchErr == nil or a non-fatal error, it returns a nil error. 

### <a id="getRepos" href="#getRepos">func getRepos(ctx context.Context, p *search.Promise) ([]*search.RepositoryRevisions, error)</a>

```
searchKey: run.getRepos
```

```Go
func getRepos(ctx context.Context, p *search.Promise) ([]*search.RepositoryRevisions, error)
```

getRepos is a wrapper around p.Get. It returns an error if the promise contains an underlying type other than []*search.RepositoryRevisions. 

### <a id="statsDeref" href="#statsDeref">func statsDeref(s *streaming.Stats) streaming.Stats</a>

```
searchKey: run.statsDeref
```

```Go
func statsDeref(s *streaming.Stats) streaming.Stats
```

### <a id="SearchSymbols" href="#SearchSymbols">func SearchSymbols(ctx context.Context, args *search.TextParameters, limit int, stream streaming.Sender) (err error)</a>

```
searchKey: run.SearchSymbols
tags: [exported]
```

```Go
func SearchSymbols(ctx context.Context, args *search.TextParameters, limit int, stream streaming.Sender) (err error)
```

SearchSymbols searches the given repos in parallel for symbols matching the given search query it can be used for both search suggestions and search results 

May return partial results and an error 

### <a id="searchSymbolsInRepo" href="#searchSymbolsInRepo">func searchSymbolsInRepo(ctx context.Context, repoRevs *search.RepositoryRevisions, patternInfo *search.TextPatternInfo, limit int) (res []*result.FileMatch, err error)</a>

```
searchKey: run.searchSymbolsInRepo
```

```Go
func searchSymbolsInRepo(ctx context.Context, repoRevs *search.RepositoryRevisions, patternInfo *search.TextPatternInfo, limit int) (res []*result.FileMatch, err error)
```

### <a id="indexedSymbolsBranch" href="#indexedSymbolsBranch">func indexedSymbolsBranch(ctx context.Context, repository, commit string) string</a>

```
searchKey: run.indexedSymbolsBranch
```

```Go
func indexedSymbolsBranch(ctx context.Context, repository, commit string) string
```

indexedSymbols checks to see if Zoekt has indexed symbols information for a repository at a specific commit. If it has it returns the branch name (for use when querying zoekt). Otherwise an empty string is returned. 

### <a id="searchZoektSymbols" href="#searchZoektSymbols">func searchZoektSymbols(ctx context.Context, repoName types.RepoName, commitID api.CommitID, inputRev *string, branch string, queryString *string, first *int32, includePatterns *[]string) (res []*result.SymbolMatch, err error)</a>

```
searchKey: run.searchZoektSymbols
```

```Go
func searchZoektSymbols(ctx context.Context, repoName types.RepoName, commitID api.CommitID, inputRev *string, branch string, queryString *string, first *int32, includePatterns *[]string) (res []*result.SymbolMatch, err error)
```

### <a id="ComputeSymbols" href="#ComputeSymbols">func ComputeSymbols(ctx context.Context, repoName types.RepoName, commitID api.CommitID, inputRev *string, query *string, first *int32, includePatterns *[]string) (res []*result.SymbolMatch, err error)</a>

```
searchKey: run.ComputeSymbols
tags: [exported]
```

```Go
func ComputeSymbols(ctx context.Context, repoName types.RepoName, commitID api.CommitID, inputRev *string, query *string, first *int32, includePatterns *[]string) (res []*result.SymbolMatch, err error)
```

### <a id="limitOrDefault" href="#limitOrDefault">func limitOrDefault(first *int32) int</a>

```
searchKey: run.limitOrDefault
```

```Go
func limitOrDefault(first *int32) int
```

### <a id="SearchFilesInRepo" href="#SearchFilesInRepo">func SearchFilesInRepo(ctx context.Context, searcherURLs *endpoint.Map, repo types.RepoName, gitserverRepo api.RepoName, rev string, index bool, info *search.TextPatternInfo, fetchTimeout time.Duration) ([]*result.FileMatch, bool, error)</a>

```
searchKey: run.SearchFilesInRepo
tags: [exported]
```

```Go
func SearchFilesInRepo(ctx context.Context, searcherURLs *endpoint.Map, repo types.RepoName, gitserverRepo api.RepoName, rev string, index bool, info *search.TextPatternInfo, fetchTimeout time.Duration) ([]*result.FileMatch, bool, error)
```

### <a id="repoShouldBeSearched" href="#repoShouldBeSearched">func repoShouldBeSearched(ctx context.Context, searcherURLs *endpoint.Map, searchPattern *search.TextPatternInfo, gitserverRepo api.RepoName, commit api.CommitID, fetchTimeout time.Duration) (shouldBeSearched bool, err error)</a>

```
searchKey: run.repoShouldBeSearched
```

```Go
func repoShouldBeSearched(ctx context.Context, searcherURLs *endpoint.Map, searchPattern *search.TextPatternInfo, gitserverRepo api.RepoName, commit api.CommitID, fetchTimeout time.Duration) (shouldBeSearched bool, err error)
```

repoShouldBeSearched determines whether a repository should be searched in, based on whether the repository fits in the subset of repositories specified in the query's `repohasfile` and `-repohasfile` flags if they exist. 

### <a id="repoHasFilesWithNamesMatching" href="#repoHasFilesWithNamesMatching">func repoHasFilesWithNamesMatching(ctx context.Context, searcherURLs *endpoint.Map, include bool, repoHasFileFlag []string, gitserverRepo api.RepoName, commit api.CommitID, fetchTimeout time.Duration) (bool, error)</a>

```
searchKey: run.repoHasFilesWithNamesMatching
```

```Go
func repoHasFilesWithNamesMatching(ctx context.Context, searcherURLs *endpoint.Map, include bool, repoHasFileFlag []string, gitserverRepo api.RepoName, commit api.CommitID, fetchTimeout time.Duration) (bool, error)
```

repoHasFilesWithNamesMatching searches in a repository for matches for the patterns in the `repohasfile` or `-repohasfile` flags, and returns whether or not the repoShouldBeSearched in or not, based on whether matches were returned. 

### <a id="fileMatchesToMatches" href="#fileMatchesToMatches">func fileMatchesToMatches(fms []*result.FileMatch) []result.Match</a>

```
searchKey: run.fileMatchesToMatches
```

```Go
func fileMatchesToMatches(fms []*result.FileMatch) []result.Match
```

### <a id="matchesToFileMatches" href="#matchesToFileMatches">func matchesToFileMatches(matches []result.Match) ([]*result.FileMatch, error)</a>

```
searchKey: run.matchesToFileMatches
```

```Go
func matchesToFileMatches(matches []result.Match) ([]*result.FileMatch, error)
```

### <a id="SearchFilesInReposBatch" href="#SearchFilesInReposBatch">func SearchFilesInReposBatch(ctx context.Context, args *search.TextParameters) ([]*result.FileMatch, streaming.Stats, error)</a>

```
searchKey: run.SearchFilesInReposBatch
tags: [exported]
```

```Go
func SearchFilesInReposBatch(ctx context.Context, args *search.TextParameters) ([]*result.FileMatch, streaming.Stats, error)
```

SearchFilesInRepoBatch is a convenience function around searchFilesInRepos which collects the results from the stream. 

### <a id="SearchFilesInRepos" href="#SearchFilesInRepos">func SearchFilesInRepos(ctx context.Context, args *search.TextParameters, stream streaming.Sender) (err error)</a>

```
searchKey: run.SearchFilesInRepos
tags: [exported]
```

```Go
func SearchFilesInRepos(ctx context.Context, args *search.TextParameters, stream streaming.Sender) (err error)
```

SearchFilesInRepos searches a set of repos for a pattern. 

### <a id="callSearcherOverRepos" href="#callSearcherOverRepos">func callSearcherOverRepos(ctx context.Context,...</a>

```
searchKey: run.callSearcherOverRepos
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

### <a id="TestCheckDiffCommitSearchLimits" href="#TestCheckDiffCommitSearchLimits">func TestCheckDiffCommitSearchLimits(t *testing.T)</a>

```
searchKey: run.TestCheckDiffCommitSearchLimits
```

```Go
func TestCheckDiffCommitSearchLimits(t *testing.T)
```

### <a id="TestSearchCommitsInRepo" href="#TestSearchCommitsInRepo">func TestSearchCommitsInRepo(t *testing.T)</a>

```
searchKey: run.TestSearchCommitsInRepo
```

```Go
func TestSearchCommitsInRepo(t *testing.T)
```

### <a id="resetMocks" href="#resetMocks">func resetMocks()</a>

```
searchKey: run.resetMocks
```

```Go
func resetMocks()
```

### <a id="TestExpandUsernamesToEmails" href="#TestExpandUsernamesToEmails">func TestExpandUsernamesToEmails(t *testing.T)</a>

```
searchKey: run.TestExpandUsernamesToEmails
```

```Go
func TestExpandUsernamesToEmails(t *testing.T)
```

### <a id="TestHighlightMatches" href="#TestHighlightMatches">func TestHighlightMatches(t *testing.T)</a>

```
searchKey: run.TestHighlightMatches
```

```Go
func TestHighlightMatches(t *testing.T)
```

### <a id="Benchmark_highlightMatches" href="#Benchmark_highlightMatches">func Benchmark_highlightMatches(b *testing.B)</a>

```
searchKey: run.Benchmark_highlightMatches
```

```Go
func Benchmark_highlightMatches(b *testing.B)
```

### <a id="searchCommitsInRepo" href="#searchCommitsInRepo">func searchCommitsInRepo(ctx context.Context, db dbutil.DB, op search.CommitParameters) (results []*result.CommitMatch, limitHit, timedOut bool, err error)</a>

```
searchKey: run.searchCommitsInRepo
```

```Go
func searchCommitsInRepo(ctx context.Context, db dbutil.DB, op search.CommitParameters) (results []*result.CommitMatch, limitHit, timedOut bool, err error)
```

searchCommitsInRepo is a blocking version of searchCommitsInRepoStream. 

### <a id="TestCommitSearchResult_Limit" href="#TestCommitSearchResult_Limit">func TestCommitSearchResult_Limit(t *testing.T)</a>

```
searchKey: run.TestCommitSearchResult_Limit
```

```Go
func TestCommitSearchResult_Limit(t *testing.T)
```

### <a id="TestSearchRepositories" href="#TestSearchRepositories">func TestSearchRepositories(t *testing.T)</a>

```
searchKey: run.TestSearchRepositories
```

```Go
func TestSearchRepositories(t *testing.T)
```

### <a id="searchRepositoriesBatch" href="#searchRepositoriesBatch">func searchRepositoriesBatch(ctx context.Context, args *search.TextParameters, limit int32) ([]result.Match, streaming.Stats, error)</a>

```
searchKey: run.searchRepositoriesBatch
```

```Go
func searchRepositoriesBatch(ctx context.Context, args *search.TextParameters, limit int32) ([]result.Match, streaming.Stats, error)
```

### <a id="TestRepoShouldBeAdded" href="#TestRepoShouldBeAdded">func TestRepoShouldBeAdded(t *testing.T)</a>

```
searchKey: run.TestRepoShouldBeAdded
```

```Go
func TestRepoShouldBeAdded(t *testing.T)
```

### <a id="repoShouldBeAdded" href="#repoShouldBeAdded">func repoShouldBeAdded(ctx context.Context, zoekt *searchbackend.Zoekt, repo *search.RepositoryRevisions, pattern *search.TextPatternInfo) (bool, error)</a>

```
searchKey: run.repoShouldBeAdded
```

```Go
func repoShouldBeAdded(ctx context.Context, zoekt *searchbackend.Zoekt, repo *search.RepositoryRevisions, pattern *search.TextPatternInfo) (bool, error)
```

repoShouldBeAdded determines whether a repository should be included in the result set based on whether the repository fits in the subset of repostiories specified in the query's `repohasfile` and `-repohasfile` fields if they exist. 

### <a id="TestMatchRepos" href="#TestMatchRepos">func TestMatchRepos(t *testing.T)</a>

```
searchKey: run.TestMatchRepos
```

```Go
func TestMatchRepos(t *testing.T)
```

### <a id="BenchmarkSearchRepositories" href="#BenchmarkSearchRepositories">func BenchmarkSearchRepositories(b *testing.B)</a>

```
searchKey: run.BenchmarkSearchRepositories
```

```Go
func BenchmarkSearchRepositories(b *testing.B)
```

### <a id="TestOrderedFuzzyRegexp" href="#TestOrderedFuzzyRegexp">func TestOrderedFuzzyRegexp(t *testing.T)</a>

```
searchKey: run.TestOrderedFuzzyRegexp
```

```Go
func TestOrderedFuzzyRegexp(t *testing.T)
```

### <a id="TestSearchFilesInRepos" href="#TestSearchFilesInRepos">func TestSearchFilesInRepos(t *testing.T)</a>

```
searchKey: run.TestSearchFilesInRepos
```

```Go
func TestSearchFilesInRepos(t *testing.T)
```

### <a id="TestSearchFilesInReposStream" href="#TestSearchFilesInReposStream">func TestSearchFilesInReposStream(t *testing.T)</a>

```
searchKey: run.TestSearchFilesInReposStream
```

```Go
func TestSearchFilesInReposStream(t *testing.T)
```

### <a id="assertReposStatus" href="#assertReposStatus">func assertReposStatus(t *testing.T, repoNames map[api.RepoID]string, got search.RepoStatusMap, want map[string]search.RepoStatus)</a>

```
searchKey: run.assertReposStatus
```

```Go
func assertReposStatus(t *testing.T, repoNames map[api.RepoID]string, got search.RepoStatusMap, want map[string]search.RepoStatus)
```

### <a id="TestSearchFilesInRepos_multipleRevsPerRepo" href="#TestSearchFilesInRepos_multipleRevsPerRepo">func TestSearchFilesInRepos_multipleRevsPerRepo(t *testing.T)</a>

```
searchKey: run.TestSearchFilesInRepos_multipleRevsPerRepo
```

```Go
func TestSearchFilesInRepos_multipleRevsPerRepo(t *testing.T)
```

### <a id="TestRepoShouldBeSearched" href="#TestRepoShouldBeSearched">func TestRepoShouldBeSearched(t *testing.T)</a>

```
searchKey: run.TestRepoShouldBeSearched
```

```Go
func TestRepoShouldBeSearched(t *testing.T)
```

### <a id="makeRepositoryRevisions" href="#makeRepositoryRevisions">func makeRepositoryRevisions(repos ...string) []*search.RepositoryRevisions</a>

```
searchKey: run.makeRepositoryRevisions
```

```Go
func makeRepositoryRevisions(repos ...string) []*search.RepositoryRevisions
```

### <a id="mkRepos" href="#mkRepos">func mkRepos(names ...string) []types.RepoName</a>

```
searchKey: run.mkRepos
```

```Go
func mkRepos(names ...string) []types.RepoName
```

### <a id="TestFileMatch_Limit" href="#TestFileMatch_Limit">func TestFileMatch_Limit(t *testing.T)</a>

```
searchKey: run.TestFileMatch_Limit
```

```Go
func TestFileMatch_Limit(t *testing.T)
```

