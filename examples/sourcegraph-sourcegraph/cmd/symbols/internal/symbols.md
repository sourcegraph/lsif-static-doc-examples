# Package symbols

Package symbols implements the symbol search service. 

## Index

* [Constants](#const)
    * [const debugLogs](#debugLogs)
    * [const maxFileSize](#maxFileSize)
    * [const symbolsDBVersion](#symbolsDBVersion)
* [Variables](#var)
    * [var logErrors](#logErrors)
    * [var ctagsCommand](#ctagsCommand)
    * [var rawPatternLengthLimit](#rawPatternLengthLimit)
    * [var fetching](#fetching)
    * [var fetchQueueSize](#fetchQueueSize)
    * [var fetchFailed](#fetchFailed)
    * [var parsing](#parsing)
    * [var parseQueueSize](#parseQueueSize)
    * [var parseQueueTimeouts](#parseQueueTimeouts)
    * [var parseFailed](#parseFailed)
    * [var cacheSizeBytes](#cacheSizeBytes)
    * [var evictions](#evictions)
* [Types](#type)
    * [type parseRequest struct](#parseRequest)
    * [type symbolInDB struct](#symbolInDB)
        * [func symbolToSymbolInDB(symbol result.Symbol) symbolInDB](#symbolToSymbolInDB)
    * [type Service struct](#Service)
        * [func (s *Service) fetchRepositoryArchive(ctx context.Context, repo api.RepoName, commitID api.CommitID) (<-chan parseRequest, <-chan error, error)](#Service.fetchRepositoryArchive)
        * [func (s *Service) startParsers() error](#Service.startParsers)
        * [func (s *Service) parseUncached(ctx context.Context, repo api.RepoName, commitID api.CommitID, callback func(symbol result.Symbol) error) (err error)](#Service.parseUncached)
        * [func (s *Service) parse(ctx context.Context, req parseRequest) (entries []*ctags.Entry, err error)](#Service.parse)
        * [func (s *Service) handleSearch(w http.ResponseWriter, r *http.Request)](#Service.handleSearch)
        * [func (s *Service) search(ctx context.Context, args protocol.SearchArgs) (*result.Symbols, error)](#Service.search)
        * [func (s *Service) getDBFile(ctx context.Context, args protocol.SearchArgs) (string, error)](#Service.getDBFile)
        * [func (s *Service) writeAllSymbolsToNewDB(ctx context.Context, dbFile string, repoName api.RepoName, commitID api.CommitID) error](#Service.writeAllSymbolsToNewDB)
        * [func (s *Service) Start() error](#Service.Start)
        * [func (s *Service) Handler() http.Handler](#Service.Handler)
        * [func (s *Service) handleHealthCheck(w http.ResponseWriter, r *http.Request)](#Service.handleHealthCheck)
        * [func (s *Service) watchAndEvict()](#Service.watchAndEvict)
    * [type mockParser []string](#mockParser)
        * [func (m mockParser) Parse(name string, content []byte) ([]*ctags.Entry, error)](#mockParser.Parse)
        * [func (mockParser) Close()](#mockParser.Close)
* [Functions](#func)
    * [func NewParser() (ctags.Parser, error)](#NewParser)
    * [func entryToSymbol(e *ctags.Entry) result.Symbol](#entryToSymbol)
    * [func isLiteralEquality(expr string) (ok bool, lit string, err error)](#isLiteralEquality)
    * [func filterSymbols(ctx context.Context, db *sqlx.DB, args protocol.SearchArgs) (res []result.Symbol, err error)](#filterSymbols)
    * [func symbolInDBToSymbol(symbolInDB symbolInDB) result.Symbol](#symbolInDBToSymbol)
    * [func TestParser(t *testing.T)](#TestParser)
    * [func BenchmarkSearch(b *testing.B)](#BenchmarkSearch)
    * [func init()](#init.service_test.go)
    * [func TestIsLiteralEquality(t *testing.T)](#TestIsLiteralEquality)
    * [func TestService(t *testing.T)](#TestService)
    * [func createTar(files map[string]string) (io.ReadCloser, error)](#createTar)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="debugLogs" href="#debugLogs">const debugLogs</a>

```
searchKey: symbols.debugLogs
tags: [private]
```

```Go
const debugLogs = false
```

### <a id="maxFileSize" href="#maxFileSize">const maxFileSize</a>

```
searchKey: symbols.maxFileSize
tags: [private]
```

```Go
const maxFileSize = 1 << 19 // 512KB

```

maxFileSize is the limit on file size in bytes. Only files smaller than this are processed. 

### <a id="symbolsDBVersion" href="#symbolsDBVersion">const symbolsDBVersion</a>

```
searchKey: symbols.symbolsDBVersion
tags: [private]
```

```Go
const symbolsDBVersion = 3
```

The version of the symbols database schema. This is included in the database filenames to prevent a newer version of the symbols service from attempting to read from a database created by an older (and likely incompatible) symbols service. Increment this when you change the database schema. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="logErrors" href="#logErrors">var logErrors</a>

```
searchKey: symbols.logErrors
tags: [private]
```

```Go
var logErrors = os.Getenv("DEPLOY_TYPE") == "dev"
```

### <a id="ctagsCommand" href="#ctagsCommand">var ctagsCommand</a>

```
searchKey: symbols.ctagsCommand
tags: [private]
```

```Go
var ctagsCommand = ...
```

### <a id="rawPatternLengthLimit" href="#rawPatternLengthLimit">var rawPatternLengthLimit</a>

```
searchKey: symbols.rawPatternLengthLimit
tags: [private]
```

```Go
var rawPatternLengthLimit = ...
```

Increasing this value may increase the size of the symbols cache, but will also stop long lines containing symbols from being highlighted improperly. See [https://github.com/sourcegraph/sourcegraph/issues/7668](https://github.com/sourcegraph/sourcegraph/issues/7668). 

### <a id="fetching" href="#fetching">var fetching</a>

```
searchKey: symbols.fetching
tags: [private]
```

```Go
var fetching = ...
```

### <a id="fetchQueueSize" href="#fetchQueueSize">var fetchQueueSize</a>

```
searchKey: symbols.fetchQueueSize
tags: [private]
```

```Go
var fetchQueueSize = ...
```

### <a id="fetchFailed" href="#fetchFailed">var fetchFailed</a>

```
searchKey: symbols.fetchFailed
tags: [private]
```

```Go
var fetchFailed = ...
```

### <a id="parsing" href="#parsing">var parsing</a>

```
searchKey: symbols.parsing
tags: [private]
```

```Go
var parsing = ...
```

### <a id="parseQueueSize" href="#parseQueueSize">var parseQueueSize</a>

```
searchKey: symbols.parseQueueSize
tags: [private]
```

```Go
var parseQueueSize = ...
```

### <a id="parseQueueTimeouts" href="#parseQueueTimeouts">var parseQueueTimeouts</a>

```
searchKey: symbols.parseQueueTimeouts
tags: [private]
```

```Go
var parseQueueTimeouts = ...
```

### <a id="parseFailed" href="#parseFailed">var parseFailed</a>

```
searchKey: symbols.parseFailed
tags: [private]
```

```Go
var parseFailed = ...
```

### <a id="cacheSizeBytes" href="#cacheSizeBytes">var cacheSizeBytes</a>

```
searchKey: symbols.cacheSizeBytes
tags: [private]
```

```Go
var cacheSizeBytes = ...
```

### <a id="evictions" href="#evictions">var evictions</a>

```
searchKey: symbols.evictions
tags: [private]
```

```Go
var evictions = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="parseRequest" href="#parseRequest">type parseRequest struct</a>

```
searchKey: symbols.parseRequest
tags: [private]
```

```Go
type parseRequest struct {
	path string
	data []byte
}
```

### <a id="symbolInDB" href="#symbolInDB">type symbolInDB struct</a>

```
searchKey: symbols.symbolInDB
tags: [private]
```

```Go
type symbolInDB struct {
	Name          string
	NameLowercase string // derived from `Name`
	Path          string
	PathLowercase string // derived from `Path`
	Line          int
	Kind          string
	Language      string
	Parent        string
	ParentKind    string
	Signature     string
	Pattern       string

	FileLimited bool
}
```

symbolInDB is the same as `protocol.Symbol`, but with two additional columns: namelowercase and pathlowercase, which enable indexed case insensitive queries. 

#### <a id="symbolToSymbolInDB" href="#symbolToSymbolInDB">func symbolToSymbolInDB(symbol result.Symbol) symbolInDB</a>

```
searchKey: symbols.symbolToSymbolInDB
tags: [private]
```

```Go
func symbolToSymbolInDB(symbol result.Symbol) symbolInDB
```

### <a id="Service" href="#Service">type Service struct</a>

```
searchKey: symbols.Service
```

```Go
type Service struct {
	// FetchTar returns an io.ReadCloser to a tar archive of a repository at the specified Git
	// remote URL and commit ID. If the error implements "BadRequest() bool", it will be used to
	// determine if the error is a bad request (eg invalid repo).
	FetchTar func(context.Context, api.RepoName, api.CommitID) (io.ReadCloser, error)

	// MaxConcurrentFetchTar is the maximum number of concurrent calls allowed
	// to FetchTar. It defaults to 15.
	MaxConcurrentFetchTar int

	NewParser func() (ctags.Parser, error)

	// NumParserProcesses is the maximum number of ctags parser child processes to run.
	NumParserProcesses int

	// Path is the directory in which to store the cache.
	Path string

	// MaxCacheSizeBytes is the maximum size of the cache in bytes. Note:
	// We can temporarily be larger than MaxCacheSizeBytes. When we go
	// over MaxCacheSizeBytes we trigger delete files until we get below
	// MaxCacheSizeBytes.
	MaxCacheSizeBytes int64

	// cache is the disk backed cache.
	cache *diskcache.Store

	// fetchSem is a semaphore to limit concurrent calls to FetchTar. The
	// semaphore size is controlled by MaxConcurrentFetchTar
	fetchSem chan int

	// pool of ctags parser child processes
	parsers chan ctags.Parser
}
```

Service is the symbols service. 

#### <a id="Service.fetchRepositoryArchive" href="#Service.fetchRepositoryArchive">func (s *Service) fetchRepositoryArchive(ctx context.Context, repo api.RepoName, commitID api.CommitID) (<-chan parseRequest, <-chan error, error)</a>

```
searchKey: symbols.Service.fetchRepositoryArchive
tags: [private]
```

```Go
func (s *Service) fetchRepositoryArchive(ctx context.Context, repo api.RepoName, commitID api.CommitID) (<-chan parseRequest, <-chan error, error)
```

#### <a id="Service.startParsers" href="#Service.startParsers">func (s *Service) startParsers() error</a>

```
searchKey: symbols.Service.startParsers
tags: [private]
```

```Go
func (s *Service) startParsers() error
```

startParsers starts the parser process pool. 

#### <a id="Service.parseUncached" href="#Service.parseUncached">func (s *Service) parseUncached(ctx context.Context, repo api.RepoName, commitID api.CommitID, callback func(symbol result.Symbol) error) (err error)</a>

```
searchKey: symbols.Service.parseUncached
tags: [private]
```

```Go
func (s *Service) parseUncached(ctx context.Context, repo api.RepoName, commitID api.CommitID, callback func(symbol result.Symbol) error) (err error)
```

#### <a id="Service.parse" href="#Service.parse">func (s *Service) parse(ctx context.Context, req parseRequest) (entries []*ctags.Entry, err error)</a>

```
searchKey: symbols.Service.parse
tags: [private]
```

```Go
func (s *Service) parse(ctx context.Context, req parseRequest) (entries []*ctags.Entry, err error)
```

parse gets a parser from the pool and uses it to satisfy the parse request. 

#### <a id="Service.handleSearch" href="#Service.handleSearch">func (s *Service) handleSearch(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: symbols.Service.handleSearch
tags: [private]
```

```Go
func (s *Service) handleSearch(w http.ResponseWriter, r *http.Request)
```

#### <a id="Service.search" href="#Service.search">func (s *Service) search(ctx context.Context, args protocol.SearchArgs) (*result.Symbols, error)</a>

```
searchKey: symbols.Service.search
tags: [private]
```

```Go
func (s *Service) search(ctx context.Context, args protocol.SearchArgs) (*result.Symbols, error)
```

#### <a id="Service.getDBFile" href="#Service.getDBFile">func (s *Service) getDBFile(ctx context.Context, args protocol.SearchArgs) (string, error)</a>

```
searchKey: symbols.Service.getDBFile
tags: [private]
```

```Go
func (s *Service) getDBFile(ctx context.Context, args protocol.SearchArgs) (string, error)
```

getDBFile returns the path to the sqlite3 database for the repo@commit specified in `args`. If the database doesn't already exist in the disk cache, it will create a new one and write all the symbols into it. 

#### <a id="Service.writeAllSymbolsToNewDB" href="#Service.writeAllSymbolsToNewDB">func (s *Service) writeAllSymbolsToNewDB(ctx context.Context, dbFile string, repoName api.RepoName, commitID api.CommitID) error</a>

```
searchKey: symbols.Service.writeAllSymbolsToNewDB
tags: [private]
```

```Go
func (s *Service) writeAllSymbolsToNewDB(ctx context.Context, dbFile string, repoName api.RepoName, commitID api.CommitID) error
```

writeAllSymbolsToNewDB fetches the repo@commit from gitserver, parses all the symbols, and writes them to the blank database file `dbFile`. 

#### <a id="Service.Start" href="#Service.Start">func (s *Service) Start() error</a>

```
searchKey: symbols.Service.Start
```

```Go
func (s *Service) Start() error
```

Start must be called before any requests are handled. 

#### <a id="Service.Handler" href="#Service.Handler">func (s *Service) Handler() http.Handler</a>

```
searchKey: symbols.Service.Handler
```

```Go
func (s *Service) Handler() http.Handler
```

Handler returns the http.Handler that should be used to serve requests. 

#### <a id="Service.handleHealthCheck" href="#Service.handleHealthCheck">func (s *Service) handleHealthCheck(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: symbols.Service.handleHealthCheck
tags: [private]
```

```Go
func (s *Service) handleHealthCheck(w http.ResponseWriter, r *http.Request)
```

#### <a id="Service.watchAndEvict" href="#Service.watchAndEvict">func (s *Service) watchAndEvict()</a>

```
searchKey: symbols.Service.watchAndEvict
tags: [private]
```

```Go
func (s *Service) watchAndEvict()
```

watchAndEvict is a loop which periodically checks the size of the cache and evicts/deletes items if the store gets too large. 

### <a id="mockParser" href="#mockParser">type mockParser []string</a>

```
searchKey: symbols.mockParser
tags: [private]
```

```Go
type mockParser []string
```

#### <a id="mockParser.Parse" href="#mockParser.Parse">func (m mockParser) Parse(name string, content []byte) ([]*ctags.Entry, error)</a>

```
searchKey: symbols.mockParser.Parse
tags: [private]
```

```Go
func (m mockParser) Parse(name string, content []byte) ([]*ctags.Entry, error)
```

#### <a id="mockParser.Close" href="#mockParser.Close">func (mockParser) Close()</a>

```
searchKey: symbols.mockParser.Close
tags: [private]
```

```Go
func (mockParser) Close()
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="NewParser" href="#NewParser">func NewParser() (ctags.Parser, error)</a>

```
searchKey: symbols.NewParser
```

```Go
func NewParser() (ctags.Parser, error)
```

NewParser runs the ctags command from the CTAGS_COMMAND environment variable, falling back to `universal-ctags`. 

### <a id="entryToSymbol" href="#entryToSymbol">func entryToSymbol(e *ctags.Entry) result.Symbol</a>

```
searchKey: symbols.entryToSymbol
tags: [private]
```

```Go
func entryToSymbol(e *ctags.Entry) result.Symbol
```

### <a id="isLiteralEquality" href="#isLiteralEquality">func isLiteralEquality(expr string) (ok bool, lit string, err error)</a>

```
searchKey: symbols.isLiteralEquality
tags: [private]
```

```Go
func isLiteralEquality(expr string) (ok bool, lit string, err error)
```

isLiteralEquality checks if the given regex matches literal strings exactly. Returns whether or not the regex is exact, along with the literal string if so. 

### <a id="filterSymbols" href="#filterSymbols">func filterSymbols(ctx context.Context, db *sqlx.DB, args protocol.SearchArgs) (res []result.Symbol, err error)</a>

```
searchKey: symbols.filterSymbols
tags: [private]
```

```Go
func filterSymbols(ctx context.Context, db *sqlx.DB, args protocol.SearchArgs) (res []result.Symbol, err error)
```

### <a id="symbolInDBToSymbol" href="#symbolInDBToSymbol">func symbolInDBToSymbol(symbolInDB symbolInDB) result.Symbol</a>

```
searchKey: symbols.symbolInDBToSymbol
tags: [private]
```

```Go
func symbolInDBToSymbol(symbolInDB symbolInDB) result.Symbol
```

### <a id="TestParser" href="#TestParser">func TestParser(t *testing.T)</a>

```
searchKey: symbols.TestParser
tags: [private]
```

```Go
func TestParser(t *testing.T)
```

### <a id="BenchmarkSearch" href="#BenchmarkSearch">func BenchmarkSearch(b *testing.B)</a>

```
searchKey: symbols.BenchmarkSearch
tags: [private]
```

```Go
func BenchmarkSearch(b *testing.B)
```

### <a id="init.service_test.go" href="#init.service_test.go">func init()</a>

```
searchKey: symbols.init
tags: [private]
```

```Go
func init()
```

### <a id="TestIsLiteralEquality" href="#TestIsLiteralEquality">func TestIsLiteralEquality(t *testing.T)</a>

```
searchKey: symbols.TestIsLiteralEquality
tags: [private]
```

```Go
func TestIsLiteralEquality(t *testing.T)
```

### <a id="TestService" href="#TestService">func TestService(t *testing.T)</a>

```
searchKey: symbols.TestService
tags: [private]
```

```Go
func TestService(t *testing.T)
```

### <a id="createTar" href="#createTar">func createTar(files map[string]string) (io.ReadCloser, error)</a>

```
searchKey: symbols.createTar
tags: [private]
```

```Go
func createTar(files map[string]string) (io.ReadCloser, error)
```

