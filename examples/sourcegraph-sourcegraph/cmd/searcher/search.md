# Package search

Package search is a service which exposes an API to text search a repo at a specific commit. 

Architecture Notes: * Archive is fetched from gitserver * Simple HTTP API exposed * Currently no concept of authorization * On disk cache of fetched archives to reduce load on gitserver * Run search on archive. Rely on OS file buffers * Simple to scale up since stateless * Use ingress with affinity to increase local cache hit ratio 

## Index

* [Constants](#const)
    * [const maxFileMatches](#maxFileMatches)
    * [const maxLineMatches](#maxLineMatches)
    * [const numWorkers](#numWorkers)
    * [const maxFileMatchLimit](#maxFileMatchLimit)
    * [const megabyte](#megabyte)
    * [const defaultMaxSearchResults](#defaultMaxSearchResults)
* [Variables](#var)
    * [var lowerTable](#lowerTable)
    * [var decoder](#decoder)
    * [var running](#running)
    * [var archiveSize](#archiveSize)
    * [var archiveFiles](#archiveFiles)
    * [var requestTotal](#requestTotal)
    * [var isValidMatcher](#isValidMatcher)
    * [var All](#All)
    * [var requestTotalStructuralSearch](#requestTotalStructuralSearch)
    * [var zoektOnce](#zoektOnce)
    * [var endpointMap](#endpointMap)
    * [var zoektClient](#zoektClient)
    * [var errNoResultsInTimeout](#errNoResultsInTimeout)
    * [var githubStore](#githubStore)
* [Types](#type)
    * [type Service struct](#Service)
        * [func (s *Service) ServeHTTP(w http.ResponseWriter, r *http.Request)](#Service.ServeHTTP)
        * [func (s *Service) search(ctx context.Context, p *protocol.Request) (matches []protocol.FileMatch, limitHit, deadlineHit bool, err error)](#Service.search)
    * [type badRequestError struct](#badRequestError)
        * [func (e badRequestError) Error() string](#badRequestError.Error)
        * [func (e badRequestError) BadRequest() bool](#badRequestError.BadRequest)
    * [type readerGrep struct](#readerGrep)
        * [func compile(p *protocol.PatternInfo) (*readerGrep, error)](#compile)
        * [func (rg *readerGrep) Copy() *readerGrep](#readerGrep.Copy)
        * [func (rg *readerGrep) matchString(s string) bool](#readerGrep.matchString)
        * [func (rg *readerGrep) Find(zf *store.ZipFile, f *store.SrcFile) (matches []protocol.LineMatch, limitHit bool, err error)](#readerGrep.Find)
        * [func (rg *readerGrep) FindZip(zf *store.ZipFile, f *store.SrcFile) (protocol.FileMatch, error)](#readerGrep.FindZip)
    * [type filePatterns interface](#filePatterns)
    * [type UniversalSet struct{}](#UniversalSet)
        * [func (UniversalSet) Value()](#UniversalSet.Value)
    * [type Subset []string](#Subset)
        * [func (Subset) Value()](#Subset.Value)
    * [type zoektSearchStreamEvent struct](#zoektSearchStreamEvent)
    * [type atomicEndpoints struct](#atomicEndpoints)
        * [func (a *atomicEndpoints) Endpoints() (map[string]struct{}, error)](#atomicEndpoints.Endpoints)
        * [func (a *atomicEndpoints) Set(endpoints []string)](#atomicEndpoints.Set)
        * [func (a *atomicEndpoints) needsUpdate(endpoints []string) bool](#atomicEndpoints.needsUpdate)
* [Functions](#func)
    * [func NewFilter(ctx context.Context, repo api.RepoName, commit api.CommitID) (store.FilterFunc, error)](#NewFilter)
    * [func newIgnoreMatcher(ctx context.Context, repo api.RepoName, commit api.CommitID) (*ignore.Matcher, error)](#newIgnoreMatcher)
    * [func bytesToLowerASCIIgeneric(dst, src []byte)](#bytesToLowerASCIIgeneric)
    * [func bytesToLowerASCII(dst, src []byte)](#bytesToLowerASCII)
    * [func init()](#init)
    * [func validateParams(p *protocol.Request) error](#validateParams)
    * [func isBadRequest(err error) bool](#isBadRequest)
    * [func isTemporary(err error) bool](#isTemporary)
    * [func hydrateLineNumbers(fileBuf []byte, lastLineNumber, lastMatchIndex, lineStart int, match []int) (lineNumber, matchIndex int)](#hydrateLineNumbers)
    * [func appendMatches(matches []protocol.LineMatch, fileBuf []byte, matchLineBuf []byte, lineNumber, start, end int) []protocol.LineMatch](#appendMatches)
    * [func regexSearch(ctx context.Context, rg *readerGrep, zf *store.ZipFile, fileMatchLimit int, patternMatchesContent, patternMatchesPaths bool, isPatternNegated bool) (fm []protocol.FileMatch, limitHit bool, err error)](#regexSearch)
    * [func lowerRegexpASCII(re *syntax.Regexp)](#lowerRegexpASCII)
    * [func longestLiteral(re *syntax.Regexp) string](#longestLiteral)
    * [func readAll(r io.Reader, b []byte) (int, error)](#readAll)
    * [func highlightMultipleLines(r *comby.Match) (matches []protocol.LineMatch)](#highlightMultipleLines)
    * [func ToFileMatch(combyMatches []comby.FileMatch) (matches []protocol.FileMatch)](#ToFileMatch)
    * [func extensionToMatcher(extension string) string](#extensionToMatcher)
    * [func lookupMatcher(language string) string](#lookupMatcher)
    * [func filteredStructuralSearch(ctx context.Context, zipPath string, zipFile *store.ZipFile, p *protocol.PatternInfo, repo api.RepoName) (matches []protocol.FileMatch, limitHit bool, err error)](#filteredStructuralSearch)
    * [func toMatcher(languages []string, extensionHint string) string](#toMatcher)
    * [func structuralSearch(ctx context.Context, zipPath string, paths filePatterns, extensionHint, pattern, rule string, languages []string, repo api.RepoName) (matches []protocol.FileMatch, limitHit bool, err error)](#structuralSearch)
    * [func structuralSearchWithZoekt(ctx context.Context, p *protocol.Request) (matches []protocol.FileMatch, limitHit, deadlineHit bool, err error)](#structuralSearchWithZoekt)
    * [func getZoektClient(indexerEndpoints []string) zoekt.Streamer](#getZoektClient)
    * [func HandleFilePathPatterns(query *search.TextPatternInfo) (zoektquery.Q, error)](#HandleFilePathPatterns)
    * [func buildQuery(args *search.TextPatternInfo, repoBranches map[string][]string, filePathPatterns zoektquery.Q, shortcircuit bool) (zoektquery.Q, error)](#buildQuery)
    * [func zoektSearch(ctx context.Context, args *search.TextPatternInfo, repoBranches map[string][]string, since func(t time.Time) time.Duration, endpoints []string, useFullDeadline bool, c chan<- zoektSearchStreamEvent) (fm []zoekt.FileMatch, limitHit bool, partial map[api.RepoID]struct{}, err error)](#zoektSearch)
    * [func writeZip(ctx context.Context, w io.Writer, fileMatches []zoekt.FileMatch) (err error)](#writeZip)
    * [func contextWithoutDeadline(cOld context.Context) (context.Context, context.CancelFunc)](#contextWithoutDeadline)
    * [func TestNewIgnoreMatcher(t *testing.T)](#TestNewIgnoreMatcher)
    * [func TestMissingIgnoreFile(t *testing.T)](#TestMissingIgnoreFile)
    * [func benchBytesToLower(b *testing.B, src []byte)](#benchBytesToLower)
    * [func BenchmarkBytesToLowerASCII(b *testing.B)](#BenchmarkBytesToLowerASCII)
    * [func checkBytesToLower(t *testing.T, b []byte)](#checkBytesToLower)
    * [func TestBytesToLowerASCII(t *testing.T)](#TestBytesToLowerASCII)
    * [func BenchmarkSearchRegex_large_fixed(b *testing.B)](#BenchmarkSearchRegex_large_fixed)
    * [func BenchmarkSearchRegex_large_fixed_casesensitive(b *testing.B)](#BenchmarkSearchRegex_large_fixed_casesensitive)
    * [func BenchmarkSearchRegex_large_re_dotstar(b *testing.B)](#BenchmarkSearchRegex_large_re_dotstar)
    * [func BenchmarkSearchRegex_large_re_common(b *testing.B)](#BenchmarkSearchRegex_large_re_common)
    * [func BenchmarkSearchRegex_large_re_anchor(b *testing.B)](#BenchmarkSearchRegex_large_re_anchor)
    * [func BenchmarkSearchRegex_large_path(b *testing.B)](#BenchmarkSearchRegex_large_path)
    * [func BenchmarkSearchRegex_small_fixed(b *testing.B)](#BenchmarkSearchRegex_small_fixed)
    * [func BenchmarkSearchRegex_small_fixed_casesensitive(b *testing.B)](#BenchmarkSearchRegex_small_fixed_casesensitive)
    * [func BenchmarkSearchRegex_small_re_dotstar(b *testing.B)](#BenchmarkSearchRegex_small_re_dotstar)
    * [func BenchmarkSearchRegex_small_re_common(b *testing.B)](#BenchmarkSearchRegex_small_re_common)
    * [func BenchmarkSearchRegex_small_re_anchor(b *testing.B)](#BenchmarkSearchRegex_small_re_anchor)
    * [func benchSearchRegex(b *testing.B, p *protocol.Request)](#benchSearchRegex)
    * [func TestLowerRegexp(t *testing.T)](#TestLowerRegexp)
    * [func TestLongestLiteral(t *testing.T)](#TestLongestLiteral)
    * [func TestReadAll(t *testing.T)](#TestReadAll)
    * [func TestMaxMatches(t *testing.T)](#TestMaxMatches)
    * [func TestPathMatches(t *testing.T)](#TestPathMatches)
    * [func init()](#init)
    * [func TestRegexSearch(t *testing.T)](#TestRegexSearch)
    * [func TestMatcherLookupByLanguage(t *testing.T)](#TestMatcherLookupByLanguage)
    * [func TestMatcherLookupByExtension(t *testing.T)](#TestMatcherLookupByExtension)
    * [func TestInferredMatcher(t *testing.T)](#TestInferredMatcher)
    * [func TestRecordMetrics(t *testing.T)](#TestRecordMetrics)
    * [func TestIncludePatterns(t *testing.T)](#TestIncludePatterns)
    * [func TestRule(t *testing.T)](#TestRule)
    * [func TestHighlightMultipleLines(t *testing.T)](#TestHighlightMultipleLines)
    * [func TestMatchCountForMultilineMatches(t *testing.T)](#TestMatchCountForMultilineMatches)
    * [func TestBuildQuery(t *testing.T)](#TestBuildQuery)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="maxFileMatches" href="#maxFileMatches">const maxFileMatches</a>

```
searchKey: search.maxFileMatches
```

```Go
const maxFileMatches = 1000
```

maxFileMatches is the limit on number of matching files we return. 

### <a id="maxLineMatches" href="#maxLineMatches">const maxLineMatches</a>

```
searchKey: search.maxLineMatches
```

```Go
const maxLineMatches = 100
```

maxLineMatches is the limit on number of matches to return in a file. 

### <a id="numWorkers" href="#numWorkers">const numWorkers</a>

```
searchKey: search.numWorkers
```

```Go
const numWorkers = 8
```

numWorkers is how many concurrent readerGreps run in the case of regexSearch, and the number of parallel workers in the case of structuralSearch. 

### <a id="maxFileMatchLimit" href="#maxFileMatchLimit">const maxFileMatchLimit</a>

```
searchKey: search.maxFileMatchLimit
```

```Go
const maxFileMatchLimit = 100
```

### <a id="megabyte" href="#megabyte">const megabyte</a>

```
searchKey: search.megabyte
```

```Go
const megabyte = float64(1000 * 1000)
```

### <a id="defaultMaxSearchResults" href="#defaultMaxSearchResults">const defaultMaxSearchResults</a>

```
searchKey: search.defaultMaxSearchResults
```

```Go
const defaultMaxSearchResults = 30
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="lowerTable" href="#lowerTable">var lowerTable</a>

```
searchKey: search.lowerTable
```

```Go
var lowerTable = ...
```

python to generate ', '.join(hex(ord(chr(i).lower())) for i in range(256)) 

### <a id="decoder" href="#decoder">var decoder</a>

```
searchKey: search.decoder
```

```Go
var decoder = schema.NewDecoder()
```

### <a id="running" href="#running">var running</a>

```
searchKey: search.running
```

```Go
var running = ...
```

### <a id="archiveSize" href="#archiveSize">var archiveSize</a>

```
searchKey: search.archiveSize
```

```Go
var archiveSize = ...
```

### <a id="archiveFiles" href="#archiveFiles">var archiveFiles</a>

```
searchKey: search.archiveFiles
```

```Go
var archiveFiles = ...
```

### <a id="requestTotal" href="#requestTotal">var requestTotal</a>

```
searchKey: search.requestTotal
```

```Go
var requestTotal = ...
```

### <a id="isValidMatcher" href="#isValidMatcher">var isValidMatcher</a>

```
searchKey: search.isValidMatcher
```

```Go
var isValidMatcher = ...
```

### <a id="All" href="#All">var All</a>

```
searchKey: search.All
tags: [exported]
```

```Go
var All UniversalSet = struct{}{}
```

### <a id="requestTotalStructuralSearch" href="#requestTotalStructuralSearch">var requestTotalStructuralSearch</a>

```
searchKey: search.requestTotalStructuralSearch
```

```Go
var requestTotalStructuralSearch = ...
```

### <a id="zoektOnce" href="#zoektOnce">var zoektOnce</a>

```
searchKey: search.zoektOnce
```

```Go
var zoektOnce sync.Once
```

### <a id="endpointMap" href="#endpointMap">var endpointMap</a>

```
searchKey: search.endpointMap
```

```Go
var endpointMap atomicEndpoints
```

### <a id="zoektClient" href="#zoektClient">var zoektClient</a>

```
searchKey: search.zoektClient
```

```Go
var zoektClient zoekt.Streamer
```

### <a id="errNoResultsInTimeout" href="#errNoResultsInTimeout">var errNoResultsInTimeout</a>

```
searchKey: search.errNoResultsInTimeout
```

```Go
var errNoResultsInTimeout = errors.New("no results found in specified timeout")
```

### <a id="githubStore" href="#githubStore">var githubStore</a>

```
searchKey: search.githubStore
```

```Go
var githubStore = ...
```

githubStore fetches from github and caches across test runs. 

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Service" href="#Service">type Service struct</a>

```
searchKey: search.Service
tags: [exported]
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
tags: [exported]
```

```Go
func (s *Service) ServeHTTP(w http.ResponseWriter, r *http.Request)
```

ServeHTTP handles HTTP based search requests 

#### <a id="Service.search" href="#Service.search">func (s *Service) search(ctx context.Context, p *protocol.Request) (matches []protocol.FileMatch, limitHit, deadlineHit bool, err error)</a>

```
searchKey: search.Service.search
```

```Go
func (s *Service) search(ctx context.Context, p *protocol.Request) (matches []protocol.FileMatch, limitHit, deadlineHit bool, err error)
```

### <a id="badRequestError" href="#badRequestError">type badRequestError struct</a>

```
searchKey: search.badRequestError
```

```Go
type badRequestError struct{ msg string }
```

#### <a id="badRequestError.Error" href="#badRequestError.Error">func (e badRequestError) Error() string</a>

```
searchKey: search.badRequestError.Error
```

```Go
func (e badRequestError) Error() string
```

#### <a id="badRequestError.BadRequest" href="#badRequestError.BadRequest">func (e badRequestError) BadRequest() bool</a>

```
searchKey: search.badRequestError.BadRequest
```

```Go
func (e badRequestError) BadRequest() bool
```

### <a id="readerGrep" href="#readerGrep">type readerGrep struct</a>

```
searchKey: search.readerGrep
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
```

```Go
func compile(p *protocol.PatternInfo) (*readerGrep, error)
```

compile returns a readerGrep for matching p. 

#### <a id="readerGrep.Copy" href="#readerGrep.Copy">func (rg *readerGrep) Copy() *readerGrep</a>

```
searchKey: search.readerGrep.Copy
```

```Go
func (rg *readerGrep) Copy() *readerGrep
```

Copy returns a copied version of rg that is safe to use from another goroutine. 

#### <a id="readerGrep.matchString" href="#readerGrep.matchString">func (rg *readerGrep) matchString(s string) bool</a>

```
searchKey: search.readerGrep.matchString
```

```Go
func (rg *readerGrep) matchString(s string) bool
```

matchString returns whether rg's regexp pattern matches s. It is intended to be used to match file paths. 

#### <a id="readerGrep.Find" href="#readerGrep.Find">func (rg *readerGrep) Find(zf *store.ZipFile, f *store.SrcFile) (matches []protocol.LineMatch, limitHit bool, err error)</a>

```
searchKey: search.readerGrep.Find
```

```Go
func (rg *readerGrep) Find(zf *store.ZipFile, f *store.SrcFile) (matches []protocol.LineMatch, limitHit bool, err error)
```

Find returns a LineMatch for each line that matches rg in reader. LimitHit is true if some matches may not have been included in the result. NOTE: This is not safe to use concurrently. 

#### <a id="readerGrep.FindZip" href="#readerGrep.FindZip">func (rg *readerGrep) FindZip(zf *store.ZipFile, f *store.SrcFile) (protocol.FileMatch, error)</a>

```
searchKey: search.readerGrep.FindZip
```

```Go
func (rg *readerGrep) FindZip(zf *store.ZipFile, f *store.SrcFile) (protocol.FileMatch, error)
```

FindZip is a convenience function to run Find on f. 

### <a id="filePatterns" href="#filePatterns">type filePatterns interface</a>

```
searchKey: search.filePatterns
```

```Go
type filePatterns interface {
	Value()
}
```

A variant type that represents whether to search all files in a Zip file (type UniversalSet), or just a subset (type Subset). 

### <a id="UniversalSet" href="#UniversalSet">type UniversalSet struct{}</a>

```
searchKey: search.UniversalSet
tags: [exported]
```

```Go
type UniversalSet struct{}
```

#### <a id="UniversalSet.Value" href="#UniversalSet.Value">func (UniversalSet) Value()</a>

```
searchKey: search.UniversalSet.Value
tags: [exported]
```

```Go
func (UniversalSet) Value()
```

### <a id="Subset" href="#Subset">type Subset []string</a>

```
searchKey: search.Subset
tags: [exported]
```

```Go
type Subset []string
```

#### <a id="Subset.Value" href="#Subset.Value">func (Subset) Value()</a>

```
searchKey: search.Subset.Value
tags: [exported]
```

```Go
func (Subset) Value()
```

### <a id="zoektSearchStreamEvent" href="#zoektSearchStreamEvent">type zoektSearchStreamEvent struct</a>

```
searchKey: search.zoektSearchStreamEvent
```

```Go
type zoektSearchStreamEvent struct {
	fm       []zoekt.FileMatch
	limitHit bool
	partial  map[api.RepoID]struct{}
	err      error
}
```

### <a id="atomicEndpoints" href="#atomicEndpoints">type atomicEndpoints struct</a>

```
searchKey: search.atomicEndpoints
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
```

```Go
func (a *atomicEndpoints) Endpoints() (map[string]struct{}, error)
```

#### <a id="atomicEndpoints.Set" href="#atomicEndpoints.Set">func (a *atomicEndpoints) Set(endpoints []string)</a>

```
searchKey: search.atomicEndpoints.Set
```

```Go
func (a *atomicEndpoints) Set(endpoints []string)
```

#### <a id="atomicEndpoints.needsUpdate" href="#atomicEndpoints.needsUpdate">func (a *atomicEndpoints) needsUpdate(endpoints []string) bool</a>

```
searchKey: search.atomicEndpoints.needsUpdate
```

```Go
func (a *atomicEndpoints) needsUpdate(endpoints []string) bool
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="NewFilter" href="#NewFilter">func NewFilter(ctx context.Context, repo api.RepoName, commit api.CommitID) (store.FilterFunc, error)</a>

```
searchKey: search.NewFilter
tags: [exported]
```

```Go
func NewFilter(ctx context.Context, repo api.RepoName, commit api.CommitID) (store.FilterFunc, error)
```

NewFilter is a wrapper around newIgnoreMatcher. 

### <a id="newIgnoreMatcher" href="#newIgnoreMatcher">func newIgnoreMatcher(ctx context.Context, repo api.RepoName, commit api.CommitID) (*ignore.Matcher, error)</a>

```
searchKey: search.newIgnoreMatcher
```

```Go
func newIgnoreMatcher(ctx context.Context, repo api.RepoName, commit api.CommitID) (*ignore.Matcher, error)
```

newIgnoreMatcher calls gitserver to retrieve the ignore-file. If the file doesn't exist we return an empty ignore.Matcher. 

### <a id="bytesToLowerASCIIgeneric" href="#bytesToLowerASCIIgeneric">func bytesToLowerASCIIgeneric(dst, src []byte)</a>

```
searchKey: search.bytesToLowerASCIIgeneric
```

```Go
func bytesToLowerASCIIgeneric(dst, src []byte)
```

### <a id="bytesToLowerASCII" href="#bytesToLowerASCII">func bytesToLowerASCII(dst, src []byte)</a>

```
searchKey: search.bytesToLowerASCII
```

```Go
func bytesToLowerASCII(dst, src []byte)
```

implemented in assembly, see lower_amd64.s 

### <a id="init" href="#init">func init()</a>

```
searchKey: search.init
```

```Go
func init()
```

### <a id="validateParams" href="#validateParams">func validateParams(p *protocol.Request) error</a>

```
searchKey: search.validateParams
```

```Go
func validateParams(p *protocol.Request) error
```

### <a id="isBadRequest" href="#isBadRequest">func isBadRequest(err error) bool</a>

```
searchKey: search.isBadRequest
```

```Go
func isBadRequest(err error) bool
```

### <a id="isTemporary" href="#isTemporary">func isTemporary(err error) bool</a>

```
searchKey: search.isTemporary
```

```Go
func isTemporary(err error) bool
```

### <a id="hydrateLineNumbers" href="#hydrateLineNumbers">func hydrateLineNumbers(fileBuf []byte, lastLineNumber, lastMatchIndex, lineStart int, match []int) (lineNumber, matchIndex int)</a>

```
searchKey: search.hydrateLineNumbers
```

```Go
func hydrateLineNumbers(fileBuf []byte, lastLineNumber, lastMatchIndex, lineStart int, match []int) (lineNumber, matchIndex int)
```

### <a id="appendMatches" href="#appendMatches">func appendMatches(matches []protocol.LineMatch, fileBuf []byte, matchLineBuf []byte, lineNumber, start, end int) []protocol.LineMatch</a>

```
searchKey: search.appendMatches
```

```Go
func appendMatches(matches []protocol.LineMatch, fileBuf []byte, matchLineBuf []byte, lineNumber, start, end int) []protocol.LineMatch
```

matchLineBuf is a byte slice that contains the full line(s) that the match appears on. 

### <a id="regexSearch" href="#regexSearch">func regexSearch(ctx context.Context, rg *readerGrep, zf *store.ZipFile, fileMatchLimit int, patternMatchesContent, patternMatchesPaths bool, isPatternNegated bool) (fm []protocol.FileMatch, limitHit bool, err error)</a>

```
searchKey: search.regexSearch
```

```Go
func regexSearch(ctx context.Context, rg *readerGrep, zf *store.ZipFile, fileMatchLimit int, patternMatchesContent, patternMatchesPaths bool, isPatternNegated bool) (fm []protocol.FileMatch, limitHit bool, err error)
```

regexSearch concurrently searches files in zr looking for matches using rg. 

### <a id="lowerRegexpASCII" href="#lowerRegexpASCII">func lowerRegexpASCII(re *syntax.Regexp)</a>

```
searchKey: search.lowerRegexpASCII
```

```Go
func lowerRegexpASCII(re *syntax.Regexp)
```

lowerRegexpASCII lowers rune literals and expands char classes to include lowercase. It does it inplace. We can't just use strings.ToLower since it will change the meaning of regex shorthands like \S or \B. 

### <a id="longestLiteral" href="#longestLiteral">func longestLiteral(re *syntax.Regexp) string</a>

```
searchKey: search.longestLiteral
```

```Go
func longestLiteral(re *syntax.Regexp) string
```

longestLiteral finds the longest substring that is guaranteed to appear in a match of re. 

Note: There may be a longer substring that is guaranteed to appear. For example we do not find the longest common substring in alternating group. Nor do we handle concatting simple capturing groups. 

### <a id="readAll" href="#readAll">func readAll(r io.Reader, b []byte) (int, error)</a>

```
searchKey: search.readAll
```

```Go
func readAll(r io.Reader, b []byte) (int, error)
```

readAll will read r until EOF into b. It returns the number of bytes read. If we do not reach EOF, an error is returned. 

### <a id="highlightMultipleLines" href="#highlightMultipleLines">func highlightMultipleLines(r *comby.Match) (matches []protocol.LineMatch)</a>

```
searchKey: search.highlightMultipleLines
```

```Go
func highlightMultipleLines(r *comby.Match) (matches []protocol.LineMatch)
```

The Sourcegraph frontend and interface only allow LineMatches (matches on a single line) and it isn't possible to specify a line and column range spanning multiple lines for highlighting. This function chops up potentially multiline matches into multiple LineMatches. 

### <a id="ToFileMatch" href="#ToFileMatch">func ToFileMatch(combyMatches []comby.FileMatch) (matches []protocol.FileMatch)</a>

```
searchKey: search.ToFileMatch
tags: [exported]
```

```Go
func ToFileMatch(combyMatches []comby.FileMatch) (matches []protocol.FileMatch)
```

### <a id="extensionToMatcher" href="#extensionToMatcher">func extensionToMatcher(extension string) string</a>

```
searchKey: search.extensionToMatcher
```

```Go
func extensionToMatcher(extension string) string
```

### <a id="lookupMatcher" href="#lookupMatcher">func lookupMatcher(language string) string</a>

```
searchKey: search.lookupMatcher
```

```Go
func lookupMatcher(language string) string
```

lookupMatcher looks up a key for specifying -matcher in comby. Comby accepts a representative file extension to set a language, so this lookup does not need to consider all possible file extensions for a language. There is a generic fallback language, so this lookup does not need to be exhaustive either. 

### <a id="filteredStructuralSearch" href="#filteredStructuralSearch">func filteredStructuralSearch(ctx context.Context, zipPath string, zipFile *store.ZipFile, p *protocol.PatternInfo, repo api.RepoName) (matches []protocol.FileMatch, limitHit bool, err error)</a>

```
searchKey: search.filteredStructuralSearch
```

```Go
func filteredStructuralSearch(ctx context.Context, zipPath string, zipFile *store.ZipFile, p *protocol.PatternInfo, repo api.RepoName) (matches []protocol.FileMatch, limitHit bool, err error)
```

filteredStructuralSearch filters the list of files with a regex search before passing the zip to comby 

### <a id="toMatcher" href="#toMatcher">func toMatcher(languages []string, extensionHint string) string</a>

```
searchKey: search.toMatcher
```

```Go
func toMatcher(languages []string, extensionHint string) string
```

toMatcher returns the matcher that parameterizes structural search. It derives either from an explicit language, or an inferred extension hint. 

### <a id="structuralSearch" href="#structuralSearch">func structuralSearch(ctx context.Context, zipPath string, paths filePatterns, extensionHint, pattern, rule string, languages []string, repo api.RepoName) (matches []protocol.FileMatch, limitHit bool, err error)</a>

```
searchKey: search.structuralSearch
```

```Go
func structuralSearch(ctx context.Context, zipPath string, paths filePatterns, extensionHint, pattern, rule string, languages []string, repo api.RepoName) (matches []protocol.FileMatch, limitHit bool, err error)
```

### <a id="structuralSearchWithZoekt" href="#structuralSearchWithZoekt">func structuralSearchWithZoekt(ctx context.Context, p *protocol.Request) (matches []protocol.FileMatch, limitHit, deadlineHit bool, err error)</a>

```
searchKey: search.structuralSearchWithZoekt
```

```Go
func structuralSearchWithZoekt(ctx context.Context, p *protocol.Request) (matches []protocol.FileMatch, limitHit, deadlineHit bool, err error)
```

### <a id="getZoektClient" href="#getZoektClient">func getZoektClient(indexerEndpoints []string) zoekt.Streamer</a>

```
searchKey: search.getZoektClient
```

```Go
func getZoektClient(indexerEndpoints []string) zoekt.Streamer
```

### <a id="HandleFilePathPatterns" href="#HandleFilePathPatterns">func HandleFilePathPatterns(query *search.TextPatternInfo) (zoektquery.Q, error)</a>

```
searchKey: search.HandleFilePathPatterns
tags: [exported]
```

```Go
func HandleFilePathPatterns(query *search.TextPatternInfo) (zoektquery.Q, error)
```

### <a id="buildQuery" href="#buildQuery">func buildQuery(args *search.TextPatternInfo, repoBranches map[string][]string, filePathPatterns zoektquery.Q, shortcircuit bool) (zoektquery.Q, error)</a>

```
searchKey: search.buildQuery
```

```Go
func buildQuery(args *search.TextPatternInfo, repoBranches map[string][]string, filePathPatterns zoektquery.Q, shortcircuit bool) (zoektquery.Q, error)
```

### <a id="zoektSearch" href="#zoektSearch">func zoektSearch(ctx context.Context, args *search.TextPatternInfo, repoBranches map[string][]string, since func(t time.Time) time.Duration, endpoints []string, useFullDeadline bool, c chan<- zoektSearchStreamEvent) (fm []zoekt.FileMatch, limitHit bool, partial map[api.RepoID]struct{}, err error)</a>

```
searchKey: search.zoektSearch
```

```Go
func zoektSearch(ctx context.Context, args *search.TextPatternInfo, repoBranches map[string][]string, since func(t time.Time) time.Duration, endpoints []string, useFullDeadline bool, c chan<- zoektSearchStreamEvent) (fm []zoekt.FileMatch, limitHit bool, partial map[api.RepoID]struct{}, err error)
```

zoektSearch searches repositories using zoekt, returning file contents for files that match the given pattern. 

Timeouts are reported through the context, and as a special case errNoResultsInTimeout is returned if no results are found in the given timeout (instead of the more common case of finding partial or full results in the given timeout). 

### <a id="writeZip" href="#writeZip">func writeZip(ctx context.Context, w io.Writer, fileMatches []zoekt.FileMatch) (err error)</a>

```
searchKey: search.writeZip
```

```Go
func writeZip(ctx context.Context, w io.Writer, fileMatches []zoekt.FileMatch) (err error)
```

### <a id="contextWithoutDeadline" href="#contextWithoutDeadline">func contextWithoutDeadline(cOld context.Context) (context.Context, context.CancelFunc)</a>

```
searchKey: search.contextWithoutDeadline
```

```Go
func contextWithoutDeadline(cOld context.Context) (context.Context, context.CancelFunc)
```

contextWithoutDeadline returns a context which will cancel if the cOld is canceled. 

### <a id="TestNewIgnoreMatcher" href="#TestNewIgnoreMatcher">func TestNewIgnoreMatcher(t *testing.T)</a>

```
searchKey: search.TestNewIgnoreMatcher
```

```Go
func TestNewIgnoreMatcher(t *testing.T)
```

### <a id="TestMissingIgnoreFile" href="#TestMissingIgnoreFile">func TestMissingIgnoreFile(t *testing.T)</a>

```
searchKey: search.TestMissingIgnoreFile
```

```Go
func TestMissingIgnoreFile(t *testing.T)
```

### <a id="benchBytesToLower" href="#benchBytesToLower">func benchBytesToLower(b *testing.B, src []byte)</a>

```
searchKey: search.benchBytesToLower
```

```Go
func benchBytesToLower(b *testing.B, src []byte)
```

### <a id="BenchmarkBytesToLowerASCII" href="#BenchmarkBytesToLowerASCII">func BenchmarkBytesToLowerASCII(b *testing.B)</a>

```
searchKey: search.BenchmarkBytesToLowerASCII
```

```Go
func BenchmarkBytesToLowerASCII(b *testing.B)
```

### <a id="checkBytesToLower" href="#checkBytesToLower">func checkBytesToLower(t *testing.T, b []byte)</a>

```
searchKey: search.checkBytesToLower
```

```Go
func checkBytesToLower(t *testing.T, b []byte)
```

### <a id="TestBytesToLowerASCII" href="#TestBytesToLowerASCII">func TestBytesToLowerASCII(t *testing.T)</a>

```
searchKey: search.TestBytesToLowerASCII
```

```Go
func TestBytesToLowerASCII(t *testing.T)
```

### <a id="BenchmarkSearchRegex_large_fixed" href="#BenchmarkSearchRegex_large_fixed">func BenchmarkSearchRegex_large_fixed(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_large_fixed
```

```Go
func BenchmarkSearchRegex_large_fixed(b *testing.B)
```

### <a id="BenchmarkSearchRegex_large_fixed_casesensitive" href="#BenchmarkSearchRegex_large_fixed_casesensitive">func BenchmarkSearchRegex_large_fixed_casesensitive(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_large_fixed_casesensitive
```

```Go
func BenchmarkSearchRegex_large_fixed_casesensitive(b *testing.B)
```

### <a id="BenchmarkSearchRegex_large_re_dotstar" href="#BenchmarkSearchRegex_large_re_dotstar">func BenchmarkSearchRegex_large_re_dotstar(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_large_re_dotstar
```

```Go
func BenchmarkSearchRegex_large_re_dotstar(b *testing.B)
```

### <a id="BenchmarkSearchRegex_large_re_common" href="#BenchmarkSearchRegex_large_re_common">func BenchmarkSearchRegex_large_re_common(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_large_re_common
```

```Go
func BenchmarkSearchRegex_large_re_common(b *testing.B)
```

### <a id="BenchmarkSearchRegex_large_re_anchor" href="#BenchmarkSearchRegex_large_re_anchor">func BenchmarkSearchRegex_large_re_anchor(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_large_re_anchor
```

```Go
func BenchmarkSearchRegex_large_re_anchor(b *testing.B)
```

### <a id="BenchmarkSearchRegex_large_path" href="#BenchmarkSearchRegex_large_path">func BenchmarkSearchRegex_large_path(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_large_path
```

```Go
func BenchmarkSearchRegex_large_path(b *testing.B)
```

### <a id="BenchmarkSearchRegex_small_fixed" href="#BenchmarkSearchRegex_small_fixed">func BenchmarkSearchRegex_small_fixed(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_small_fixed
```

```Go
func BenchmarkSearchRegex_small_fixed(b *testing.B)
```

### <a id="BenchmarkSearchRegex_small_fixed_casesensitive" href="#BenchmarkSearchRegex_small_fixed_casesensitive">func BenchmarkSearchRegex_small_fixed_casesensitive(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_small_fixed_casesensitive
```

```Go
func BenchmarkSearchRegex_small_fixed_casesensitive(b *testing.B)
```

### <a id="BenchmarkSearchRegex_small_re_dotstar" href="#BenchmarkSearchRegex_small_re_dotstar">func BenchmarkSearchRegex_small_re_dotstar(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_small_re_dotstar
```

```Go
func BenchmarkSearchRegex_small_re_dotstar(b *testing.B)
```

### <a id="BenchmarkSearchRegex_small_re_common" href="#BenchmarkSearchRegex_small_re_common">func BenchmarkSearchRegex_small_re_common(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_small_re_common
```

```Go
func BenchmarkSearchRegex_small_re_common(b *testing.B)
```

### <a id="BenchmarkSearchRegex_small_re_anchor" href="#BenchmarkSearchRegex_small_re_anchor">func BenchmarkSearchRegex_small_re_anchor(b *testing.B)</a>

```
searchKey: search.BenchmarkSearchRegex_small_re_anchor
```

```Go
func BenchmarkSearchRegex_small_re_anchor(b *testing.B)
```

### <a id="benchSearchRegex" href="#benchSearchRegex">func benchSearchRegex(b *testing.B, p *protocol.Request)</a>

```
searchKey: search.benchSearchRegex
```

```Go
func benchSearchRegex(b *testing.B, p *protocol.Request)
```

### <a id="TestLowerRegexp" href="#TestLowerRegexp">func TestLowerRegexp(t *testing.T)</a>

```
searchKey: search.TestLowerRegexp
```

```Go
func TestLowerRegexp(t *testing.T)
```

### <a id="TestLongestLiteral" href="#TestLongestLiteral">func TestLongestLiteral(t *testing.T)</a>

```
searchKey: search.TestLongestLiteral
```

```Go
func TestLongestLiteral(t *testing.T)
```

### <a id="TestReadAll" href="#TestReadAll">func TestReadAll(t *testing.T)</a>

```
searchKey: search.TestReadAll
```

```Go
func TestReadAll(t *testing.T)
```

### <a id="TestMaxMatches" href="#TestMaxMatches">func TestMaxMatches(t *testing.T)</a>

```
searchKey: search.TestMaxMatches
```

```Go
func TestMaxMatches(t *testing.T)
```

### <a id="TestPathMatches" href="#TestPathMatches">func TestPathMatches(t *testing.T)</a>

```
searchKey: search.TestPathMatches
```

```Go
func TestPathMatches(t *testing.T)
```

Tests that: 

- IncludePatterns can match the path in any order - A path must match all (not any) of the IncludePatterns - An empty pattern is allowed 

### <a id="init" href="#init">func init()</a>

```
searchKey: search.init
```

```Go
func init()
```

### <a id="TestRegexSearch" href="#TestRegexSearch">func TestRegexSearch(t *testing.T)</a>

```
searchKey: search.TestRegexSearch
```

```Go
func TestRegexSearch(t *testing.T)
```

### <a id="TestMatcherLookupByLanguage" href="#TestMatcherLookupByLanguage">func TestMatcherLookupByLanguage(t *testing.T)</a>

```
searchKey: search.TestMatcherLookupByLanguage
```

```Go
func TestMatcherLookupByLanguage(t *testing.T)
```

### <a id="TestMatcherLookupByExtension" href="#TestMatcherLookupByExtension">func TestMatcherLookupByExtension(t *testing.T)</a>

```
searchKey: search.TestMatcherLookupByExtension
```

```Go
func TestMatcherLookupByExtension(t *testing.T)
```

### <a id="TestInferredMatcher" href="#TestInferredMatcher">func TestInferredMatcher(t *testing.T)</a>

```
searchKey: search.TestInferredMatcher
```

```Go
func TestInferredMatcher(t *testing.T)
```

Tests that structural search correctly infers the Go matcher from the .go file extension. 

### <a id="TestRecordMetrics" href="#TestRecordMetrics">func TestRecordMetrics(t *testing.T)</a>

```
searchKey: search.TestRecordMetrics
```

```Go
func TestRecordMetrics(t *testing.T)
```

### <a id="TestIncludePatterns" href="#TestIncludePatterns">func TestIncludePatterns(t *testing.T)</a>

```
searchKey: search.TestIncludePatterns
```

```Go
func TestIncludePatterns(t *testing.T)
```

Tests that includePatterns works. includePatterns serve a similar role in structural search compared to regex search, but is interpreted _differently_. includePatterns cannot be a regex expression (as in traditional search), but instead (currently) expects a list of patterns that represent a set of file paths to search. 

### <a id="TestRule" href="#TestRule">func TestRule(t *testing.T)</a>

```
searchKey: search.TestRule
```

```Go
func TestRule(t *testing.T)
```

### <a id="TestHighlightMultipleLines" href="#TestHighlightMultipleLines">func TestHighlightMultipleLines(t *testing.T)</a>

```
searchKey: search.TestHighlightMultipleLines
```

```Go
func TestHighlightMultipleLines(t *testing.T)
```

### <a id="TestMatchCountForMultilineMatches" href="#TestMatchCountForMultilineMatches">func TestMatchCountForMultilineMatches(t *testing.T)</a>

```
searchKey: search.TestMatchCountForMultilineMatches
```

```Go
func TestMatchCountForMultilineMatches(t *testing.T)
```

### <a id="TestBuildQuery" href="#TestBuildQuery">func TestBuildQuery(t *testing.T)</a>

```
searchKey: search.TestBuildQuery
```

```Go
func TestBuildQuery(t *testing.T)
```

