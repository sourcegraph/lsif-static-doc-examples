# Package search

Package search is a service which exposes an API to text search a repo at a specific commit. 

Architecture Notes: * Archive is fetched from gitserver * Simple HTTP API exposed * Currently no concept of authorization * On disk cache of fetched archives to reduce load on gitserver * Run search on archive. Rely on OS file buffers * Simple to scale up since stateless * Use ingress with affinity to increase local cache hit ratio 

## Index

* [Constants](#const)
    * [const defaultMaxSearchResults](#defaultMaxSearchResults)
    * [const maxFileMatchLimit](#maxFileMatchLimit)
    * [const maxFileMatches](#maxFileMatches)
    * [const maxLineMatches](#maxLineMatches)
    * [const megabyte](#megabyte)
    * [const numWorkers](#numWorkers)
* [Variables](#var)
    * [var All](#All)
    * [var archiveFiles](#archiveFiles)
    * [var archiveSize](#archiveSize)
    * [var decoder](#decoder)
    * [var endpointMap](#endpointMap)
    * [var errNoResultsInTimeout](#errNoResultsInTimeout)
    * [var githubStore](#githubStore)
    * [var isValidMatcher](#isValidMatcher)
    * [var lowerTable](#lowerTable)
    * [var requestTotal](#requestTotal)
    * [var requestTotalStructuralSearch](#requestTotalStructuralSearch)
    * [var running](#running)
    * [var zoektClient](#zoektClient)
    * [var zoektOnce](#zoektOnce)
* [Types](#type)
    * [type Service struct](#Service)
        * [func (s *Service) ServeHTTP(w http.ResponseWriter, r *http.Request)](#Service.ServeHTTP)
        * [func (s *Service) search(ctx context.Context, p *protocol.Request) (matches []protocol.FileMatch, limitHit, deadlineHit bool, err error)](#Service.search)
    * [type Subset []string](#Subset)
        * [func (Subset) Value()](#Subset.Value)
    * [type UniversalSet struct{}](#UniversalSet)
        * [func (UniversalSet) Value()](#UniversalSet.Value)
    * [type atomicEndpoints struct](#atomicEndpoints)
        * [func (a *atomicEndpoints) Endpoints() (map[string]struct{}, error)](#atomicEndpoints.Endpoints)
        * [func (a *atomicEndpoints) Set(endpoints []string)](#atomicEndpoints.Set)
        * [func (a *atomicEndpoints) needsUpdate(endpoints []string) bool](#atomicEndpoints.needsUpdate)
    * [type badRequestError struct](#badRequestError)
        * [func (e badRequestError) BadRequest() bool](#badRequestError.BadRequest)
        * [func (e badRequestError) Error() string](#badRequestError.Error)
    * [type filePatterns interface](#filePatterns)
    * [type readerGrep struct](#readerGrep)
        * [func compile(p *protocol.PatternInfo) (*readerGrep, error)](#compile)
        * [func (rg *readerGrep) Copy() *readerGrep](#readerGrep.Copy)
        * [func (rg *readerGrep) Find(zf *store.ZipFile, f *store.SrcFile) (matches []protocol.LineMatch, limitHit bool, err error)](#readerGrep.Find)
        * [func (rg *readerGrep) FindZip(zf *store.ZipFile, f *store.SrcFile) (protocol.FileMatch, error)](#readerGrep.FindZip)
        * [func (rg *readerGrep) matchString(s string) bool](#readerGrep.matchString)
    * [type zoektSearchStreamEvent struct](#zoektSearchStreamEvent)
* [Functions](#func)
    * [func BenchmarkBytesToLowerASCII(b *testing.B)](#BenchmarkBytesToLowerASCII)
    * [func BenchmarkSearchRegex_large_fixed(b *testing.B)](#BenchmarkSearchRegex_large_fixed)
    * [func BenchmarkSearchRegex_large_fixed_casesensitive(b *testing.B)](#BenchmarkSearchRegex_large_fixed_casesensitive)
    * [func BenchmarkSearchRegex_large_path(b *testing.B)](#BenchmarkSearchRegex_large_path)
    * [func BenchmarkSearchRegex_large_re_anchor(b *testing.B)](#BenchmarkSearchRegex_large_re_anchor)
    * [func BenchmarkSearchRegex_large_re_common(b *testing.B)](#BenchmarkSearchRegex_large_re_common)
    * [func BenchmarkSearchRegex_large_re_dotstar(b *testing.B)](#BenchmarkSearchRegex_large_re_dotstar)
    * [func BenchmarkSearchRegex_small_fixed(b *testing.B)](#BenchmarkSearchRegex_small_fixed)
    * [func BenchmarkSearchRegex_small_fixed_casesensitive(b *testing.B)](#BenchmarkSearchRegex_small_fixed_casesensitive)
    * [func BenchmarkSearchRegex_small_re_anchor(b *testing.B)](#BenchmarkSearchRegex_small_re_anchor)
    * [func BenchmarkSearchRegex_small_re_common(b *testing.B)](#BenchmarkSearchRegex_small_re_common)
    * [func BenchmarkSearchRegex_small_re_dotstar(b *testing.B)](#BenchmarkSearchRegex_small_re_dotstar)
    * [func HandleFilePathPatterns(query *search.TextPatternInfo) (zoektquery.Q, error)](#HandleFilePathPatterns)
    * [func NewFilter(ctx context.Context, repo api.RepoName, commit api.CommitID) (store.FilterFunc, error)](#NewFilter)
    * [func TestBuildQuery(t *testing.T)](#TestBuildQuery)
    * [func TestBytesToLowerASCII(t *testing.T)](#TestBytesToLowerASCII)
    * [func TestHighlightMultipleLines(t *testing.T)](#TestHighlightMultipleLines)
    * [func TestIncludePatterns(t *testing.T)](#TestIncludePatterns)
    * [func TestInferredMatcher(t *testing.T)](#TestInferredMatcher)
    * [func TestLongestLiteral(t *testing.T)](#TestLongestLiteral)
    * [func TestLowerRegexp(t *testing.T)](#TestLowerRegexp)
    * [func TestMatchCountForMultilineMatches(t *testing.T)](#TestMatchCountForMultilineMatches)
    * [func TestMatcherLookupByExtension(t *testing.T)](#TestMatcherLookupByExtension)
    * [func TestMatcherLookupByLanguage(t *testing.T)](#TestMatcherLookupByLanguage)
    * [func TestMaxMatches(t *testing.T)](#TestMaxMatches)
    * [func TestMissingIgnoreFile(t *testing.T)](#TestMissingIgnoreFile)
    * [func TestNewIgnoreMatcher(t *testing.T)](#TestNewIgnoreMatcher)
    * [func TestPathMatches(t *testing.T)](#TestPathMatches)
    * [func TestReadAll(t *testing.T)](#TestReadAll)
    * [func TestRecordMetrics(t *testing.T)](#TestRecordMetrics)
    * [func TestRegexSearch(t *testing.T)](#TestRegexSearch)
    * [func TestRule(t *testing.T)](#TestRule)
    * [func ToFileMatch(combyMatches []comby.FileMatch) (matches []protocol.FileMatch)](#ToFileMatch)
    * [func appendMatches(matches []protocol.LineMatch, fileBuf []byte, matchLineBuf []byte, lineNumber, start, end int) []protocol.LineMatch](#appendMatches)
    * [func benchBytesToLower(b *testing.B, src []byte)](#benchBytesToLower)
    * [func benchSearchRegex(b *testing.B, p *protocol.Request)](#benchSearchRegex)
    * [func buildQuery(args *search.TextPatternInfo, repoBranches map[string][]string, filePathPatterns zoektquery.Q, shortcircuit bool) (zoektquery.Q, error)](#buildQuery)
    * [func bytesToLowerASCII(dst, src []byte)](#bytesToLowerASCII)
    * [func bytesToLowerASCIIgeneric(dst, src []byte)](#bytesToLowerASCIIgeneric)
    * [func checkBytesToLower(t *testing.T, b []byte)](#checkBytesToLower)
    * [func contextWithoutDeadline(cOld context.Context) (context.Context, context.CancelFunc)](#contextWithoutDeadline)
    * [func extensionToMatcher(extension string) string](#extensionToMatcher)
    * [func filteredStructuralSearch(ctx context.Context, zipPath string, zipFile *store.ZipFile, p *protocol.PatternInfo, repo api.RepoName) (matches []protocol.FileMatch, limitHit bool, err error)](#filteredStructuralSearch)
    * [func getZoektClient(indexerEndpoints []string) zoekt.Streamer](#getZoektClient)
    * [func highlightMultipleLines(r *comby.Match) (matches []protocol.LineMatch)](#highlightMultipleLines)
    * [func hydrateLineNumbers(fileBuf []byte, lastLineNumber, lastMatchIndex, lineStart int, match []int) (lineNumber, matchIndex int)](#hydrateLineNumbers)
    * [func init()](#init.search.go)
    * [func init()](#init.search_regex_test.go)
    * [func isBadRequest(err error) bool](#isBadRequest)
    * [func isTemporary(err error) bool](#isTemporary)
    * [func longestLiteral(re *syntax.Regexp) string](#longestLiteral)
    * [func lookupMatcher(language string) string](#lookupMatcher)
    * [func lowerRegexpASCII(re *syntax.Regexp)](#lowerRegexpASCII)
    * [func newIgnoreMatcher(ctx context.Context, repo api.RepoName, commit api.CommitID) (*ignore.Matcher, error)](#newIgnoreMatcher)
    * [func readAll(r io.Reader, b []byte) (int, error)](#readAll)
    * [func regexSearch(ctx context.Context, rg *readerGrep, zf *store.ZipFile, fileMatchLimit int, patternMatchesContent, patternMatchesPaths bool, isPatternNegated bool) (fm []protocol.FileMatch, limitHit bool, err error)](#regexSearch)
    * [func structuralSearch(ctx context.Context, zipPath string, paths filePatterns, extensionHint, pattern, rule string, languages []string, repo api.RepoName) (matches []protocol.FileMatch, limitHit bool, err error)](#structuralSearch)
    * [func structuralSearchWithZoekt(ctx context.Context, p *protocol.Request) (matches []protocol.FileMatch, limitHit, deadlineHit bool, err error)](#structuralSearchWithZoekt)
    * [func toMatcher(languages []string, extensionHint string) string](#toMatcher)
    * [func validateParams(p *protocol.Request) error](#validateParams)
    * [func writeZip(ctx context.Context, w io.Writer, fileMatches []zoekt.FileMatch) (err error)](#writeZip)
    * [func zoektSearch(ctx context.Context, args *search.TextPatternInfo, repoBranches map[string][]string, since func(t time.Time) time.Duration, endpoints []string, useFullDeadline bool, c chan<- zoektSearchStreamEvent) (fm []zoekt.FileMatch, limitHit bool, partial map[api.RepoID]struct{}, err error)](#zoektSearch)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="defaultMaxSearchResults" href="#defaultMaxSearchResults">const defaultMaxSearchResults</a>

```
searchKey: search.defaultMaxSearchResults
tags: [constant number private]
```

```Go
const defaultMaxSearchResults = 30
```

### <a id="maxFileMatchLimit" href="#maxFileMatchLimit">const maxFileMatchLimit</a>

```
searchKey: search.maxFileMatchLimit
tags: [constant number private]
```

```Go
const maxFileMatchLimit = 100
```

### <a id="maxFileMatches" href="#maxFileMatches">const maxFileMatches</a>

```
searchKey: search.maxFileMatches
tags: [constant number private]
```

```Go
const maxFileMatches = 1000
```

maxFileMatches is the limit on number of matching files we return. 

### <a id="maxLineMatches" href="#maxLineMatches">const maxLineMatches</a>

```
searchKey: search.maxLineMatches
tags: [constant number private]
```

```Go
const maxLineMatches = 100
```

maxLineMatches is the limit on number of matches to return in a file. 

### <a id="megabyte" href="#megabyte">const megabyte</a>

```
searchKey: search.megabyte
tags: [constant number private]
```

```Go
const megabyte = float64(1000 * 1000)
```

### <a id="numWorkers" href="#numWorkers">const numWorkers</a>

```
searchKey: search.numWorkers
tags: [constant number private]
```

```Go
const numWorkers = 8
```

numWorkers is how many concurrent readerGreps run in the case of regexSearch, and the number of parallel workers in the case of structuralSearch. 

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="All" href="#All">var All</a>

```
searchKey: search.All
tags: [variable struct]
```

```Go
var All UniversalSet = struct{}{}
```

### <a id="archiveFiles" href="#archiveFiles">var archiveFiles</a>

```
searchKey: search.archiveFiles
tags: [variable interface private]
```

```Go
var archiveFiles = ...
```

### <a id="archiveSize" href="#archiveSize">var archiveSize</a>

```
searchKey: search.archiveSize
tags: [variable interface private]
```

```Go
var archiveSize = ...
```

### <a id="decoder" href="#decoder">var decoder</a>

```
searchKey: search.decoder
tags: [variable struct private]
```

```Go
var decoder = schema.NewDecoder()
```

### <a id="endpointMap" href="#endpointMap">var endpointMap</a>

```
searchKey: search.endpointMap
tags: [variable struct private]
```

```Go
var endpointMap atomicEndpoints
```

### <a id="errNoResultsInTimeout" href="#errNoResultsInTimeout">var errNoResultsInTimeout</a>

```
searchKey: search.errNoResultsInTimeout
tags: [variable interface private]
```

```Go
var errNoResultsInTimeout = errors.New("no results found in specified timeout")
```

### <a id="githubStore" href="#githubStore">var githubStore</a>

```
searchKey: search.githubStore
tags: [variable struct private]
```

```Go
var githubStore = ...
```

githubStore fetches from github and caches across test runs. 

### <a id="isValidMatcher" href="#isValidMatcher">var isValidMatcher</a>

```
searchKey: search.isValidMatcher
tags: [variable struct private]
```

```Go
var isValidMatcher = ...
```

### <a id="lowerTable" href="#lowerTable">var lowerTable</a>

```
searchKey: search.lowerTable
tags: [variable array number private]
```

```Go
var lowerTable = ...
```

python to generate ', '.join(hex(ord(chr(i).lower())) for i in range(256)) 

### <a id="requestTotal" href="#requestTotal">var requestTotal</a>

```
searchKey: search.requestTotal
tags: [variable struct private]
```

```Go
var requestTotal = ...
```

### <a id="requestTotalStructuralSearch" href="#requestTotalStructuralSearch">var requestTotalStructuralSearch</a>

```
searchKey: search.requestTotalStructuralSearch
tags: [variable struct private]
```

```Go
var requestTotalStructuralSearch = ...
```

### <a id="running" href="#running">var running</a>

```
searchKey: search.running
tags: [variable interface private]
```

```Go
var running = ...
```

### <a id="zoektClient" href="#zoektClient">var zoektClient</a>

```
searchKey: search.zoektClient
tags: [variable interface private]
```

```Go
var zoektClient zoekt.Streamer
```

### <a id="zoektOnce" href="#zoektOnce">var zoektOnce</a>

```
searchKey: search.zoektOnce
tags: [variable struct private]
```

```Go
var zoektOnce sync.Once
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Service" href="#Service">type Service struct</a>

```
searchKey: search.Service
tags: [struct]
```

```Go
type Service struct {
	Store *store.Store
	Log   log15.Logger
}
```

Service is the search service. It is an http.Handler. 

#### <a id="Service.ServeHTTP" href="#Service.ServeHTTP">func (s *Service) ServeHTTP(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: search.Service.ServeHTTP
tags: [method]
```

```Go
func (s *Service) ServeHTTP(w http.ResponseWriter, r *http.Request)
```

ServeHTTP handles HTTP based search requests 

#### <a id="Service.search" href="#Service.search">func (s *Service) search(ctx context.Context, p *protocol.Request) (matches []protocol.FileMatch, limitHit, deadlineHit bool, err error)</a>

```
searchKey: search.Service.search
tags: [method private]
```

```Go
func (s *Service) search(ctx context.Context, p *protocol.Request) (matches []protocol.FileMatch, limitHit, deadlineHit bool, err error)
```

### <a id="Subset" href="#Subset">type Subset []string</a>

```
searchKey: search.Subset
tags: [array string]
```

```Go
type Subset []string
```

#### <a id="Subset.Value" href="#Subset.Value">func (Subset) Value()</a>

```
searchKey: search.Subset.Value
tags: [function]
```

```Go
func (Subset) Value()
```

### <a id="UniversalSet" href="#UniversalSet">type UniversalSet struct{}</a>

```
searchKey: search.UniversalSet
tags: [struct]
```

```Go
type UniversalSet struct{}
```

#### <a id="UniversalSet.Value" href="#UniversalSet.Value">func (UniversalSet) Value()</a>

```
searchKey: search.UniversalSet.Value
tags: [function]
```

```Go
func (UniversalSet) Value()
```

### <a id="atomicEndpoints" href="#atomicEndpoints">type atomicEndpoints struct</a>

```
searchKey: search.atomicEndpoints
tags: [struct private]
```

```Go
type atomicEndpoints struct {
	endpoints atomic.Value
}
```

atomicEndpoints allows us to update the endpoints used by our zoekt client. 

#### <a id="atomicEndpoints.Endpoints" href="#atomicEndpoints.Endpoints">func (a *atomicEndpoints) Endpoints() (map[string]struct{}, error)</a>

```
searchKey: search.atomicEndpoints.Endpoints
tags: [function private]
```

```Go
func (a *atomicEndpoints) Endpoints() (map[string]struct{}, error)
```

#### <a id="atomicEndpoints.Set" href="#atomicEndpoints.Set">func (a *atomicEndpoints) Set(endpoints []string)</a>

```
searchKey: search.atomicEndpoints.Set
tags: [method private]
```

```Go
func (a *atomicEndpoints) Set(endpoints []string)
```

#### <a id="atomicEndpoints.needsUpdate" href="#atomicEndpoints.needsUpdate">func (a *atomicEndpoints) needsUpdate(endpoints []string) bool</a>

```
searchKey: search.atomicEndpoints.needsUpdate
tags: [method private]
```

```Go
func (a *atomicEndpoints) needsUpdate(endpoints []string) bool
```

### <a id="badRequestError" href="#badRequestError">type badRequestError struct</a>

```
searchKey: search.badRequestError
tags: [struct private]
```

```Go
type badRequestError struct{ msg string }
```

#### <a id="badRequestError.BadRequest" href="#badRequestError.BadRequest">func (e badRequestError) BadRequest() bool</a>

```
searchKey: search.badRequestError.BadRequest
tags: [function private]
```

```Go
func (e badRequestError) BadRequest() bool
```

#### <a id="badRequestError.Error" href="#badRequestError.Error">func (e badRequestError) Error() string</a>

```
searchKey: search.badRequestError.Error
tags: [function private]
```

```Go
func (e badRequestError) Error() string
```

### <a id="filePatterns" href="#filePatterns">type filePatterns interface</a>

```
searchKey: search.filePatterns
tags: [interface private]
```

```Go
type filePatterns interface {
	Value()
}
```

A variant type that represents whether to search all files in a Zip file (type UniversalSet), or just a subset (type Subset). 

### <a id="readerGrep" href="#readerGrep">type readerGrep struct</a>

```
searchKey: search.readerGrep
tags: [struct private]
```

```Go
type readerGrep struct {
	// re is the regexp to match, or nil if empty ("match all files' content").
	re *regexp.Regexp

	// ignoreCase if true means we need to do case insensitive matching.
	ignoreCase bool

	// transformBuf is reused between file searches to avoid
	// re-allocating. It is only used if we need to transform the input
	// before matching. For example we lower case the input in the case of
	// ignoreCase.
	transformBuf []byte

	// matchPath is compiled from the include/exclude path patterns and reports
	// whether a file path matches (and should be searched).
	matchPath pathmatch.PathMatcher

	// literalSubstring is used to test if a file is worth considering for
	// matches. literalSubstring is guaranteed to appear in any match found by
	// re. It is the output of the longestLiteral function. It is only set if
	// the regex has an empty LiteralPrefix.
	literalSubstring []byte
}
```

readerGrep is responsible for finding LineMatches. It is not concurrency safe (it reuses buffers for performance). 

This code is base on reading the techniques detailed in [http://blog.burntsushi.net/ripgrep/](http://blog.burntsushi.net/ripgrep/) 

The stdlib regexp is pretty powerful and in fact implements many of the features in ripgrep. Our implementation gives high performance via pruning aggressively which files to consider (non-binary under a limit) and optimizing for assuming most lines will not contain a match. The pruning of files is done by the store. 

If there is no more low-hanging fruit and perf is not acceptable, we could consider using ripgrep directly (modify it to search zip archives). 

TODO(keegan) return search statistics 

#### <a id="compile" href="#compile">func compile(p *protocol.PatternInfo) (*readerGrep, error)</a>

```
searchKey: search.compile
tags: [method private]
```

```Go
func compile(p *protocol.PatternInfo) (*readerGrep, error)
```

compile returns a readerGrep for matching p. 

#### <a id="readerGrep.Copy" href="#readerGrep.Copy">func (rg *readerGrep) Copy() *readerGrep</a>

```
searchKey: search.readerGrep.Copy
tags: [function private]
```

```Go
func (rg *readerGrep) Copy() *readerGrep
```

Copy returns a copied version of rg that is safe to use from another goroutine. 

#### <a id="readerGrep.Find" href="#readerGrep.Find">func (rg *readerGrep) Find(zf *store.ZipFile, f *store.SrcFile) (matches []protocol.LineMatch, limitHit bool, err error)</a>

```
searchKey: search.readerGrep.Find
tags: [method private]
```

```Go
func (rg *readerGrep) Find(zf *store.ZipFile, f *store.SrcFile) (matches []protocol.LineMatch, limitHit bool, err error)
```

Find returns a LineMatch for each line that matches rg in reader. LimitHit is true if some matches may not have been included in the result. NOTE: This is not safe to use concurrently. 

#### <a id="readerGrep.FindZip" href="#readerGrep.FindZip">func (rg *readerGrep) FindZip(zf *store.ZipFile, f *store.SrcFile) (protocol.FileMatch, error)</a>

```
searchKey: search.readerGrep.FindZip
tags: [method private]
```

```Go
func (rg *readerGrep) FindZip(zf *store.ZipFile, f *store.SrcFile) (protocol.FileMatch, error)
```

FindZip is a convenience function to run Find on f. 

#### <a id="readerGrep.matchString" href="#readerGrep.matchString">func (rg *readerGrep) matchString(s string) bool</a>

```
searchKey: search.readerGrep.matchString
tags: [method private]
```

```Go
func (rg *readerGrep) matchString(s string) bool
```

matchString returns whether rg's regexp pattern matches s. It is intended to be used to match file paths. 

### <a id="zoektSearchStreamEvent" href="#zoektSearchStreamEvent">type zoektSearchStreamEvent struct</a>

```
searchKey: search.zoektSearchStreamEvent
tags: [struct private]
```

```Go
type zoektSearchStreamEvent struct {
	fm       []zoekt.FileMatch
	limitHit bool
	partial  map[api.RepoID]struct{}
	err      error
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkBytesToLowerASCII" href="#BenchmarkBytesToLowerASCII">func BenchmarkBytesToLowerASCII(b *testing.B)</a>

```
searchKey: search.BenchmarkBytesToLowerASCII
tags: [method private benchmark]
```

```Go
func BenchmarkBytesToLowerASCII(b *testing.B)
```

### <a id="BenchmarkSearchRegex_large_fixed" href="#BenchmarkSearchRegex_large_fixed">func BenchmarkSearchRegex_large_fixed(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_large_fixed
tags: [method private benchmark]
```

```Go
func BenchmarkSearchRegex_large_fixed(b *testing.B)
```

### <a id="BenchmarkSearchRegex_large_fixed_casesensitive" href="#BenchmarkSearchRegex_large_fixed_casesensitive">func BenchmarkSearchRegex_large_fixed_casesensitive(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_large_fixed_casesensitive
tags: [method private benchmark]
```

```Go
func BenchmarkSearchRegex_large_fixed_casesensitive(b *testing.B)
```

### <a id="BenchmarkSearchRegex_large_path" href="#BenchmarkSearchRegex_large_path">func BenchmarkSearchRegex_large_path(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_large_path
tags: [method private benchmark]
```

```Go
func BenchmarkSearchRegex_large_path(b *testing.B)
```

### <a id="BenchmarkSearchRegex_large_re_anchor" href="#BenchmarkSearchRegex_large_re_anchor">func BenchmarkSearchRegex_large_re_anchor(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_large_re_anchor
tags: [method private benchmark]
```

```Go
func BenchmarkSearchRegex_large_re_anchor(b *testing.B)
```

### <a id="BenchmarkSearchRegex_large_re_common" href="#BenchmarkSearchRegex_large_re_common">func BenchmarkSearchRegex_large_re_common(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_large_re_common
tags: [method private benchmark]
```

```Go
func BenchmarkSearchRegex_large_re_common(b *testing.B)
```

### <a id="BenchmarkSearchRegex_large_re_dotstar" href="#BenchmarkSearchRegex_large_re_dotstar">func BenchmarkSearchRegex_large_re_dotstar(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_large_re_dotstar
tags: [method private benchmark]
```

```Go
func BenchmarkSearchRegex_large_re_dotstar(b *testing.B)
```

### <a id="BenchmarkSearchRegex_small_fixed" href="#BenchmarkSearchRegex_small_fixed">func BenchmarkSearchRegex_small_fixed(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_small_fixed
tags: [method private benchmark]
```

```Go
func BenchmarkSearchRegex_small_fixed(b *testing.B)
```

### <a id="BenchmarkSearchRegex_small_fixed_casesensitive" href="#BenchmarkSearchRegex_small_fixed_casesensitive">func BenchmarkSearchRegex_small_fixed_casesensitive(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_small_fixed_casesensitive
tags: [method private benchmark]
```

```Go
func BenchmarkSearchRegex_small_fixed_casesensitive(b *testing.B)
```

### <a id="BenchmarkSearchRegex_small_re_anchor" href="#BenchmarkSearchRegex_small_re_anchor">func BenchmarkSearchRegex_small_re_anchor(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_small_re_anchor
tags: [method private benchmark]
```

```Go
func BenchmarkSearchRegex_small_re_anchor(b *testing.B)
```

### <a id="BenchmarkSearchRegex_small_re_common" href="#BenchmarkSearchRegex_small_re_common">func BenchmarkSearchRegex_small_re_common(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_small_re_common
tags: [method private benchmark]
```

```Go
func BenchmarkSearchRegex_small_re_common(b *testing.B)
```

### <a id="BenchmarkSearchRegex_small_re_dotstar" href="#BenchmarkSearchRegex_small_re_dotstar">func BenchmarkSearchRegex_small_re_dotstar(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_small_re_dotstar
tags: [method private benchmark]
```

```Go
func BenchmarkSearchRegex_small_re_dotstar(b *testing.B)
```

### <a id="HandleFilePathPatterns" href="#HandleFilePathPatterns">func HandleFilePathPatterns(query *search.TextPatternInfo) (zoektquery.Q, error)</a>

```
searchKey: search.HandleFilePathPatterns
tags: [method]
```

```Go
func HandleFilePathPatterns(query *search.TextPatternInfo) (zoektquery.Q, error)
```

### <a id="NewFilter" href="#NewFilter">func NewFilter(ctx context.Context, repo api.RepoName, commit api.CommitID) (store.FilterFunc, error)</a>

```
searchKey: search.NewFilter
tags: [method]
```

```Go
func NewFilter(ctx context.Context, repo api.RepoName, commit api.CommitID) (store.FilterFunc, error)
```

NewFilter is a wrapper around newIgnoreMatcher. 

### <a id="TestBuildQuery" href="#TestBuildQuery">func TestBuildQuery(t *testing.T)</a>

```
searchKey: search.TestBuildQuery
tags: [method private test]
```

```Go
func TestBuildQuery(t *testing.T)
```

### <a id="TestBytesToLowerASCII" href="#TestBytesToLowerASCII">func TestBytesToLowerASCII(t *testing.T)</a>

```
searchKey: search.TestBytesToLowerASCII
tags: [method private test]
```

```Go
func TestBytesToLowerASCII(t *testing.T)
```

### <a id="TestHighlightMultipleLines" href="#TestHighlightMultipleLines">func TestHighlightMultipleLines(t *testing.T)</a>

```
searchKey: search.TestHighlightMultipleLines
tags: [method private test]
```

```Go
func TestHighlightMultipleLines(t *testing.T)
```

### <a id="TestIncludePatterns" href="#TestIncludePatterns">func TestIncludePatterns(t *testing.T)</a>

```
searchKey: search.TestIncludePatterns
tags: [method private test]
```

```Go
func TestIncludePatterns(t *testing.T)
```

Tests that includePatterns works. includePatterns serve a similar role in structural search compared to regex search, but is interpreted _differently_. includePatterns cannot be a regex expression (as in traditional search), but instead (currently) expects a list of patterns that represent a set of file paths to search. 

### <a id="TestInferredMatcher" href="#TestInferredMatcher">func TestInferredMatcher(t *testing.T)</a>

```
searchKey: search.TestInferredMatcher
tags: [method private test]
```

```Go
func TestInferredMatcher(t *testing.T)
```

Tests that structural search correctly infers the Go matcher from the .go file extension. 

### <a id="TestLongestLiteral" href="#TestLongestLiteral">func TestLongestLiteral(t *testing.T)</a>

```
searchKey: search.TestLongestLiteral
tags: [method private test]
```

```Go
func TestLongestLiteral(t *testing.T)
```

### <a id="TestLowerRegexp" href="#TestLowerRegexp">func TestLowerRegexp(t *testing.T)</a>

```
searchKey: search.TestLowerRegexp
tags: [method private test]
```

```Go
func TestLowerRegexp(t *testing.T)
```

### <a id="TestMatchCountForMultilineMatches" href="#TestMatchCountForMultilineMatches">func TestMatchCountForMultilineMatches(t *testing.T)</a>

```
searchKey: search.TestMatchCountForMultilineMatches
tags: [method private test]
```

```Go
func TestMatchCountForMultilineMatches(t *testing.T)
```

### <a id="TestMatcherLookupByExtension" href="#TestMatcherLookupByExtension">func TestMatcherLookupByExtension(t *testing.T)</a>

```
searchKey: search.TestMatcherLookupByExtension
tags: [method private test]
```

```Go
func TestMatcherLookupByExtension(t *testing.T)
```

### <a id="TestMatcherLookupByLanguage" href="#TestMatcherLookupByLanguage">func TestMatcherLookupByLanguage(t *testing.T)</a>

```
searchKey: search.TestMatcherLookupByLanguage
tags: [method private test]
```

```Go
func TestMatcherLookupByLanguage(t *testing.T)
```

### <a id="TestMaxMatches" href="#TestMaxMatches">func TestMaxMatches(t *testing.T)</a>

```
searchKey: search.TestMaxMatches
tags: [method private test]
```

```Go
func TestMaxMatches(t *testing.T)
```

### <a id="TestMissingIgnoreFile" href="#TestMissingIgnoreFile">func TestMissingIgnoreFile(t *testing.T)</a>

```
searchKey: search.TestMissingIgnoreFile
tags: [method private test]
```

```Go
func TestMissingIgnoreFile(t *testing.T)
```

### <a id="TestNewIgnoreMatcher" href="#TestNewIgnoreMatcher">func TestNewIgnoreMatcher(t *testing.T)</a>

```
searchKey: search.TestNewIgnoreMatcher
tags: [method private test]
```

```Go
func TestNewIgnoreMatcher(t *testing.T)
```

### <a id="TestPathMatches" href="#TestPathMatches">func TestPathMatches(t *testing.T)</a>

```
searchKey: search.TestPathMatches
tags: [method private test]
```

```Go
func TestPathMatches(t *testing.T)
```

Tests that: 

- IncludePatterns can match the path in any order - A path must match all (not any) of the IncludePatterns - An empty pattern is allowed 

### <a id="TestReadAll" href="#TestReadAll">func TestReadAll(t *testing.T)</a>

```
searchKey: search.TestReadAll
tags: [method private test]
```

```Go
func TestReadAll(t *testing.T)
```

### <a id="TestRecordMetrics" href="#TestRecordMetrics">func TestRecordMetrics(t *testing.T)</a>

```
searchKey: search.TestRecordMetrics
tags: [method private test]
```

```Go
func TestRecordMetrics(t *testing.T)
```

### <a id="TestRegexSearch" href="#TestRegexSearch">func TestRegexSearch(t *testing.T)</a>

```
searchKey: search.TestRegexSearch
tags: [method private test]
```

```Go
func TestRegexSearch(t *testing.T)
```

### <a id="TestRule" href="#TestRule">func TestRule(t *testing.T)</a>

```
searchKey: search.TestRule
tags: [method private test]
```

```Go
func TestRule(t *testing.T)
```

### <a id="ToFileMatch" href="#ToFileMatch">func ToFileMatch(combyMatches []comby.FileMatch) (matches []protocol.FileMatch)</a>

```
searchKey: search.ToFileMatch
tags: [method]
```

```Go
func ToFileMatch(combyMatches []comby.FileMatch) (matches []protocol.FileMatch)
```

### <a id="appendMatches" href="#appendMatches">func appendMatches(matches []protocol.LineMatch, fileBuf []byte, matchLineBuf []byte, lineNumber, start, end int) []protocol.LineMatch</a>

```
searchKey: search.appendMatches
tags: [method private]
```

```Go
func appendMatches(matches []protocol.LineMatch, fileBuf []byte, matchLineBuf []byte, lineNumber, start, end int) []protocol.LineMatch
```

matchLineBuf is a byte slice that contains the full line(s) that the match appears on. 

### <a id="benchBytesToLower" href="#benchBytesToLower">func benchBytesToLower(b *testing.B, src []byte)</a>

```
searchKey: search.benchBytesToLower
tags: [method private]
```

```Go
func benchBytesToLower(b *testing.B, src []byte)
```

### <a id="benchSearchRegex" href="#benchSearchRegex">func benchSearchRegex(b *testing.B, p *protocol.Request)</a>

```
searchKey: search.benchSearchRegex
tags: [method private]
```

```Go
func benchSearchRegex(b *testing.B, p *protocol.Request)
```

### <a id="buildQuery" href="#buildQuery">func buildQuery(args *search.TextPatternInfo, repoBranches map[string][]string, filePathPatterns zoektquery.Q, shortcircuit bool) (zoektquery.Q, error)</a>

```
searchKey: search.buildQuery
tags: [method private]
```

```Go
func buildQuery(args *search.TextPatternInfo, repoBranches map[string][]string, filePathPatterns zoektquery.Q, shortcircuit bool) (zoektquery.Q, error)
```

### <a id="bytesToLowerASCII" href="#bytesToLowerASCII">func bytesToLowerASCII(dst, src []byte)</a>

```
searchKey: search.bytesToLowerASCII
tags: [method private]
```

```Go
func bytesToLowerASCII(dst, src []byte)
```

implemented in assembly, see lower_amd64.s 

### <a id="bytesToLowerASCIIgeneric" href="#bytesToLowerASCIIgeneric">func bytesToLowerASCIIgeneric(dst, src []byte)</a>

```
searchKey: search.bytesToLowerASCIIgeneric
tags: [method private]
```

```Go
func bytesToLowerASCIIgeneric(dst, src []byte)
```

### <a id="checkBytesToLower" href="#checkBytesToLower">func checkBytesToLower(t *testing.T, b []byte)</a>

```
searchKey: search.checkBytesToLower
tags: [method private]
```

```Go
func checkBytesToLower(t *testing.T, b []byte)
```

### <a id="contextWithoutDeadline" href="#contextWithoutDeadline">func contextWithoutDeadline(cOld context.Context) (context.Context, context.CancelFunc)</a>

```
searchKey: search.contextWithoutDeadline
tags: [method private]
```

```Go
func contextWithoutDeadline(cOld context.Context) (context.Context, context.CancelFunc)
```

contextWithoutDeadline returns a context which will cancel if the cOld is canceled. 

### <a id="extensionToMatcher" href="#extensionToMatcher">func extensionToMatcher(extension string) string</a>

```
searchKey: search.extensionToMatcher
tags: [method private]
```

```Go
func extensionToMatcher(extension string) string
```

### <a id="filteredStructuralSearch" href="#filteredStructuralSearch">func filteredStructuralSearch(ctx context.Context, zipPath string, zipFile *store.ZipFile, p *protocol.PatternInfo, repo api.RepoName) (matches []protocol.FileMatch, limitHit bool, err error)</a>

```
searchKey: search.filteredStructuralSearch
tags: [method private]
```

```Go
func filteredStructuralSearch(ctx context.Context, zipPath string, zipFile *store.ZipFile, p *protocol.PatternInfo, repo api.RepoName) (matches []protocol.FileMatch, limitHit bool, err error)
```

filteredStructuralSearch filters the list of files with a regex search before passing the zip to comby 

### <a id="getZoektClient" href="#getZoektClient">func getZoektClient(indexerEndpoints []string) zoekt.Streamer</a>

```
searchKey: search.getZoektClient
tags: [method private]
```

```Go
func getZoektClient(indexerEndpoints []string) zoekt.Streamer
```

### <a id="highlightMultipleLines" href="#highlightMultipleLines">func highlightMultipleLines(r *comby.Match) (matches []protocol.LineMatch)</a>

```
searchKey: search.highlightMultipleLines
tags: [method private]
```

```Go
func highlightMultipleLines(r *comby.Match) (matches []protocol.LineMatch)
```

The Sourcegraph frontend and interface only allow LineMatches (matches on a single line) and it isn't possible to specify a line and column range spanning multiple lines for highlighting. This function chops up potentially multiline matches into multiple LineMatches. 

### <a id="hydrateLineNumbers" href="#hydrateLineNumbers">func hydrateLineNumbers(fileBuf []byte, lastLineNumber, lastMatchIndex, lineStart int, match []int) (lineNumber, matchIndex int)</a>

```
searchKey: search.hydrateLineNumbers
tags: [method private]
```

```Go
func hydrateLineNumbers(fileBuf []byte, lastLineNumber, lastMatchIndex, lineStart int, match []int) (lineNumber, matchIndex int)
```

### <a id="init.search.go" href="#init.search.go">func init()</a>

```
searchKey: search.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.search_regex_test.go" href="#init.search_regex_test.go">func init()</a>

```
searchKey: search.init
tags: [function private]
```

```Go
func init()
```

### <a id="isBadRequest" href="#isBadRequest">func isBadRequest(err error) bool</a>

```
searchKey: search.isBadRequest
tags: [method private]
```

```Go
func isBadRequest(err error) bool
```

### <a id="isTemporary" href="#isTemporary">func isTemporary(err error) bool</a>

```
searchKey: search.isTemporary
tags: [method private]
```

```Go
func isTemporary(err error) bool
```

### <a id="longestLiteral" href="#longestLiteral">func longestLiteral(re *syntax.Regexp) string</a>

```
searchKey: search.longestLiteral
tags: [method private]
```

```Go
func longestLiteral(re *syntax.Regexp) string
```

longestLiteral finds the longest substring that is guaranteed to appear in a match of re. 

Note: There may be a longer substring that is guaranteed to appear. For example we do not find the longest common substring in alternating group. Nor do we handle concatting simple capturing groups. 

### <a id="lookupMatcher" href="#lookupMatcher">func lookupMatcher(language string) string</a>

```
searchKey: search.lookupMatcher
tags: [method private]
```

```Go
func lookupMatcher(language string) string
```

lookupMatcher looks up a key for specifying -matcher in comby. Comby accepts a representative file extension to set a language, so this lookup does not need to consider all possible file extensions for a language. There is a generic fallback language, so this lookup does not need to be exhaustive either. 

### <a id="lowerRegexpASCII" href="#lowerRegexpASCII">func lowerRegexpASCII(re *syntax.Regexp)</a>

```
searchKey: search.lowerRegexpASCII
tags: [method private]
```

```Go
func lowerRegexpASCII(re *syntax.Regexp)
```

lowerRegexpASCII lowers rune literals and expands char classes to include lowercase. It does it inplace. We can't just use strings.ToLower since it will change the meaning of regex shorthands like \S or \B. 

### <a id="newIgnoreMatcher" href="#newIgnoreMatcher">func newIgnoreMatcher(ctx context.Context, repo api.RepoName, commit api.CommitID) (*ignore.Matcher, error)</a>

```
searchKey: search.newIgnoreMatcher
tags: [method private]
```

```Go
func newIgnoreMatcher(ctx context.Context, repo api.RepoName, commit api.CommitID) (*ignore.Matcher, error)
```

newIgnoreMatcher calls gitserver to retrieve the ignore-file. If the file doesn't exist we return an empty ignore.Matcher. 

### <a id="readAll" href="#readAll">func readAll(r io.Reader, b []byte) (int, error)</a>

```
searchKey: search.readAll
tags: [method private]
```

```Go
func readAll(r io.Reader, b []byte) (int, error)
```

readAll will read r until EOF into b. It returns the number of bytes read. If we do not reach EOF, an error is returned. 

### <a id="regexSearch" href="#regexSearch">func regexSearch(ctx context.Context, rg *readerGrep, zf *store.ZipFile, fileMatchLimit int, patternMatchesContent, patternMatchesPaths bool, isPatternNegated bool) (fm []protocol.FileMatch, limitHit bool, err error)</a>

```
searchKey: search.regexSearch
tags: [method private]
```

```Go
func regexSearch(ctx context.Context, rg *readerGrep, zf *store.ZipFile, fileMatchLimit int, patternMatchesContent, patternMatchesPaths bool, isPatternNegated bool) (fm []protocol.FileMatch, limitHit bool, err error)
```

regexSearch concurrently searches files in zr looking for matches using rg. 

### <a id="structuralSearch" href="#structuralSearch">func structuralSearch(ctx context.Context, zipPath string, paths filePatterns, extensionHint, pattern, rule string, languages []string, repo api.RepoName) (matches []protocol.FileMatch, limitHit bool, err error)</a>

```
searchKey: search.structuralSearch
tags: [method private]
```

```Go
func structuralSearch(ctx context.Context, zipPath string, paths filePatterns, extensionHint, pattern, rule string, languages []string, repo api.RepoName) (matches []protocol.FileMatch, limitHit bool, err error)
```

### <a id="structuralSearchWithZoekt" href="#structuralSearchWithZoekt">func structuralSearchWithZoekt(ctx context.Context, p *protocol.Request) (matches []protocol.FileMatch, limitHit, deadlineHit bool, err error)</a>

```
searchKey: search.structuralSearchWithZoekt
tags: [method private]
```

```Go
func structuralSearchWithZoekt(ctx context.Context, p *protocol.Request) (matches []protocol.FileMatch, limitHit, deadlineHit bool, err error)
```

### <a id="toMatcher" href="#toMatcher">func toMatcher(languages []string, extensionHint string) string</a>

```
searchKey: search.toMatcher
tags: [method private]
```

```Go
func toMatcher(languages []string, extensionHint string) string
```

toMatcher returns the matcher that parameterizes structural search. It derives either from an explicit language, or an inferred extension hint. 

### <a id="validateParams" href="#validateParams">func validateParams(p *protocol.Request) error</a>

```
searchKey: search.validateParams
tags: [method private]
```

```Go
func validateParams(p *protocol.Request) error
```

### <a id="writeZip" href="#writeZip">func writeZip(ctx context.Context, w io.Writer, fileMatches []zoekt.FileMatch) (err error)</a>

```
searchKey: search.writeZip
tags: [method private]
```

```Go
func writeZip(ctx context.Context, w io.Writer, fileMatches []zoekt.FileMatch) (err error)
```

### <a id="zoektSearch" href="#zoektSearch">func zoektSearch(ctx context.Context, args *search.TextPatternInfo, repoBranches map[string][]string, since func(t time.Time) time.Duration, endpoints []string, useFullDeadline bool, c chan<- zoektSearchStreamEvent) (fm []zoekt.FileMatch, limitHit bool, partial map[api.RepoID]struct{}, err error)</a>

```
searchKey: search.zoektSearch
tags: [method private]
```

```Go
func zoektSearch(ctx context.Context, args *search.TextPatternInfo, repoBranches map[string][]string, since func(t time.Time) time.Duration, endpoints []string, useFullDeadline bool, c chan<- zoektSearchStreamEvent) (fm []zoekt.FileMatch, limitHit bool, partial map[api.RepoID]struct{}, err error)
```

zoektSearch searches repositories using zoekt, returning file contents for files that match the given pattern. 

Timeouts are reported through the context, and as a special case errNoResultsInTimeout is returned if no results are found in the given timeout (instead of the more common case of finding partial or full results in the given timeout). 

