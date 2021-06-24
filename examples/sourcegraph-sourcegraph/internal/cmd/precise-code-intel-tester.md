# Package main

## Index

* Subpages
  * [internal/cmd/precise-code-intel-tester/util](precise-code-intel-tester/util.md)
* [Constants](#const)
    * [const repositoryQueryFragment](#repositoryQueryFragment)
    * [const uploadQueryFragment](#uploadQueryFragment)
* [Variables](#var)
    * [var ErrProcessingFailed](#ErrProcessingFailed)
    * [var checkQueryResult](#checkQueryResult)
    * [var commands](#commands)
    * [var endpoint](#endpoint)
    * [var indexDir](#indexDir)
    * [var indexFilenamePattern](#indexFilenamePattern)
    * [var numConcurrentRequests](#numConcurrentRequests)
    * [var numConcurrentUploads](#numConcurrentUploads)
    * [var queryGenerators](#queryGenerators)
    * [var queryReferencesOfReferences](#queryReferencesOfReferences)
    * [var testCases](#testCases)
    * [var token](#token)
    * [var uploadIDPattern](#uploadIDPattern)
* [Types](#type)
    * [type Commit struct](#Commit)
    * [type Definitions struct](#Definitions)
    * [type Location struct](#Location)
    * [type Node struct](#Node)
    * [type PageInfo struct](#PageInfo)
    * [type Position struct](#Position)
    * [type QueryFunc func(context.Context, github.com/sourcegraph/sourcegraph/internal/cmd/precise-code-intel-tester.Location) ([]github.com/sourcegraph/sourcegraph/internal/cmd/precise-code-intel-tester.Location, error)](#QueryFunc)
    * [type QueryResponse struct](#QueryResponse)
    * [type Range struct](#Range)
    * [type References struct](#References)
    * [type Repository struct](#Repository)
    * [type Resource struct](#Resource)
    * [type Upload struct](#Upload)
    * [type refreshState struct](#refreshState)
* [Functions](#func)
    * [func commandNameList() string](#commandNameList)
    * [func compareLocations(a, b Location) int](#compareLocations)
    * [func countRevs(revsByRepo map[string][]string) int](#countRevs)
    * [func definitionsFromReferencesQueries() []util.ParallelFn](#definitionsFromReferencesQueries)
    * [func main()](#main)
    * [func makeProcessedSignals(revsByRepo map[string][]string) map[string]map[string]chan error](#makeProcessedSignals)
    * [func makeRefreshedSignals(revsByRepo map[string][]string) map[string]chan refreshState](#makeRefreshedSignals)
    * [func makeTestQueryFunction(name string, location Location, expectedLocations []Location, f QueryFunc) util.ParallelFn](#makeTestQueryFunction)
    * [func makeTestUploadForRepositoryFunction(name string,...](#makeTestUploadForRepositoryFunction)
    * [func queryCommand() error](#queryCommand)
    * [func queryDefinitions(ctx context.Context, location Location) (locations []Location, err error)](#queryDefinitions)
    * [func queryReferences(ctx context.Context, location Location) (locations []Location, err error)](#queryReferences)
    * [func readRevsByRepo() (map[string][]string, error)](#readRevsByRepo)
    * [func referencesFromDefinitionsQueries() []util.ParallelFn](#referencesFromDefinitionsQueries)
    * [func referencesFromReferencesQueries() []util.ParallelFn](#referencesFromReferencesQueries)
    * [func sortLocations(locations []Location)](#sortLocations)
    * [func upload(ctx context.Context, name string, index int, rev string, limiter *util.Limiter) (string, error)](#upload)
    * [func uploadCommand() error](#uploadCommand)
    * [func uploadIndexes(ctx context.Context) error](#uploadIndexes)
    * [func uploadStates(ctx context.Context, ids, names []string) (stateByUpload map[string]string, staleCommitGraphByRepo map[string]bool, _ error)](#uploadStates)
    * [func watchStateChanges(ctx context.Context,...](#watchStateChanges)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="repositoryQueryFragment" href="#repositoryQueryFragment">const repositoryQueryFragment</a>

```
searchKey: main.repositoryQueryFragment
tags: [constant string private]
```

```Go
const repositoryQueryFragment = ...
```

### <a id="uploadQueryFragment" href="#uploadQueryFragment">const uploadQueryFragment</a>

```
searchKey: main.uploadQueryFragment
tags: [constant string private]
```

```Go
const uploadQueryFragment = `
	u%d: node(id: "%s") {
		... on LSIFUpload { state }
	}
`
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="ErrProcessingFailed" href="#ErrProcessingFailed">var ErrProcessingFailed</a>

```
searchKey: main.ErrProcessingFailed
tags: [variable interface]
```

```Go
var ErrProcessingFailed = errors.New("processing failed")
```

ErrProcessingFailed occurs when an upload enters the ERRORED state. 

### <a id="checkQueryResult" href="#checkQueryResult">var checkQueryResult</a>

```
searchKey: main.checkQueryResult
tags: [variable boolean private]
```

```Go
var checkQueryResult bool
```

### <a id="commands" href="#commands">var commands</a>

```
searchKey: main.commands
tags: [variable object private]
```

```Go
var commands = map[string]func() error{
	"upload": uploadCommand,
	"query":  queryCommand,
}
```

Entrypoints 

### <a id="endpoint" href="#endpoint">var endpoint</a>

```
searchKey: main.endpoint
tags: [variable string private]
```

```Go
var endpoint = ...
```

### <a id="indexDir" href="#indexDir">var indexDir</a>

```
searchKey: main.indexDir
tags: [variable string private]
```

```Go
var indexDir string
```

Flags 

### <a id="indexFilenamePattern" href="#indexFilenamePattern">var indexFilenamePattern</a>

```
searchKey: main.indexFilenamePattern
tags: [variable struct private]
```

```Go
var indexFilenamePattern = regexp.MustCompile(`^(.+)\.\d+\.([0-9A-Fa-f]{40})\.dump$`)
```

indexFilenamePattern extracts a repo name and rev from the index filename. We assume that the index segment here (the non-captured `.\d+.`) occupies [0,n) without gaps for each repository. 

### <a id="numConcurrentRequests" href="#numConcurrentRequests">var numConcurrentRequests</a>

```
searchKey: main.numConcurrentRequests
tags: [variable number private]
```

```Go
var numConcurrentRequests int
```

### <a id="numConcurrentUploads" href="#numConcurrentUploads">var numConcurrentUploads</a>

```
searchKey: main.numConcurrentUploads
tags: [variable number private]
```

```Go
var numConcurrentUploads int
```

### <a id="queryGenerators" href="#queryGenerators">var queryGenerators</a>

```
searchKey: main.queryGenerators
tags: [variable array function private]
```

```Go
var queryGenerators = ...
```

queryGenerators is the list of functions that create query test functions. 

### <a id="queryReferencesOfReferences" href="#queryReferencesOfReferences">var queryReferencesOfReferences</a>

```
searchKey: main.queryReferencesOfReferences
tags: [variable boolean private]
```

```Go
var queryReferencesOfReferences bool
```

### <a id="testCases" href="#testCases">var testCases</a>

```
searchKey: main.testCases
tags: [variable array struct private]
```

```Go
var testCases = ...
```

### <a id="token" href="#token">var token</a>

```
searchKey: main.token
tags: [variable string private]
```

```Go
var token = env.Get("SOURCEGRAPH_SUDO_TOKEN", "", "Access token")
```

### <a id="uploadIDPattern" href="#uploadIDPattern">var uploadIDPattern</a>

```
searchKey: main.uploadIDPattern
tags: [variable struct private]
```

```Go
var uploadIDPattern = regexp.MustCompile(`/settings/code-intelligence/lsif-uploads/([0-9A-Za-z=]+)`)
```

uploadIDPattern extracts a GraphQL identifier from the output of the `src lsif upload` command. 

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Commit" href="#Commit">type Commit struct</a>

```
searchKey: main.Commit
tags: [struct]
```

```Go
type Commit struct {
	Oid string `json:"oid"`
}
```

### <a id="Definitions" href="#Definitions">type Definitions struct</a>

```
searchKey: main.Definitions
tags: [struct]
```

```Go
type Definitions struct {
	Nodes []Node `json:"nodes"`
}
```

### <a id="Location" href="#Location">type Location struct</a>

```
searchKey: main.Location
tags: [struct]
```

```Go
type Location struct {
	Repo      string
	Rev       string
	Path      string
	Line      int
	Character int
}
```

Location specifies the first position in a source range. 

### <a id="Node" href="#Node">type Node struct</a>

```
searchKey: main.Node
tags: [struct]
```

```Go
type Node struct {
	Resource `json:"resource"`
	Range    `json:"range"`
}
```

### <a id="PageInfo" href="#PageInfo">type PageInfo struct</a>

```
searchKey: main.PageInfo
tags: [struct]
```

```Go
type PageInfo struct {
	EndCursor string `json:"endCursor"`
}
```

### <a id="Position" href="#Position">type Position struct</a>

```
searchKey: main.Position
tags: [struct]
```

```Go
type Position struct {
	Line      int `json:"line"`
	Character int `json:"character"`
}
```

### <a id="QueryFunc" href="#QueryFunc">type QueryFunc func(context.Context, github.com/sourcegraph/sourcegraph/internal/cmd/precise-code-intel-tester.Location) ([]github.com/sourcegraph/sourcegraph/internal/cmd/precise-code-intel-tester.Location, error)</a>

```
searchKey: main.QueryFunc
tags: [function]
```

```Go
type QueryFunc func(context.Context, Location) ([]Location, error)
```

QueryFunc performs a GraphQL query (definition or references) given the source location. 

### <a id="QueryResponse" href="#QueryResponse">type QueryResponse struct</a>

```
searchKey: main.QueryResponse
tags: [struct]
```

```Go
type QueryResponse struct {
	Data struct {
		Repository struct {
			Commit struct {
				Blob struct {
					LSIF struct {
						Definitions Definitions `json:"definitions"`
						References  References  `json:"references"`
					} `json:"lsif"`
				} `json:"blob"`
			} `json:"commit"`
		} `json:"repository"`
	} `json:"data"`
}
```

### <a id="Range" href="#Range">type Range struct</a>

```
searchKey: main.Range
tags: [struct]
```

```Go
type Range struct {
	Start Position `json:"start"`
	End   Position `json:"end"`
}
```

### <a id="References" href="#References">type References struct</a>

```
searchKey: main.References
tags: [struct]
```

```Go
type References struct {
	Nodes    []Node   `json:"nodes"`
	PageInfo PageInfo `json:"pageInfo"`
}
```

### <a id="Repository" href="#Repository">type Repository struct</a>

```
searchKey: main.Repository
tags: [struct]
```

```Go
type Repository struct {
	Name string `json:"name"`
}
```

### <a id="Resource" href="#Resource">type Resource struct</a>

```
searchKey: main.Resource
tags: [struct]
```

```Go
type Resource struct {
	Path       string     `json:"path"`
	Repository Repository `json:"repository"`
	Commit     Commit     `json:"commit"`
}
```

### <a id="Upload" href="#Upload">type Upload struct</a>

```
searchKey: main.Upload
tags: [struct]
```

```Go
type Upload struct {
	Name     string
	Index    int
	Rev      string
	UploadID string
}
```

Upload represents a fully uploaded (but possibly unprocessed) LSIF index. 

### <a id="refreshState" href="#refreshState">type refreshState struct</a>

```
searchKey: main.refreshState
tags: [struct private]
```

```Go
type refreshState struct {
	Stale bool
	Err   error
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="commandNameList" href="#commandNameList">func commandNameList() string</a>

```
searchKey: main.commandNameList
tags: [function private]
```

```Go
func commandNameList() string
```

commandNameList returns a comma-separated list of valid command names. 

### <a id="compareLocations" href="#compareLocations">func compareLocations(a, b Location) int</a>

```
searchKey: main.compareLocations
tags: [method private]
```

```Go
func compareLocations(a, b Location) int
```

Compare returns an integer comparing two locations. The result will be 0 if a == b, -1 if a < b, and +1 if a > b. 

### <a id="countRevs" href="#countRevs">func countRevs(revsByRepo map[string][]string) int</a>

```
searchKey: main.countRevs
tags: [method private]
```

```Go
func countRevs(revsByRepo map[string][]string) int
```

countRevs returns the total number of revision. 

### <a id="definitionsFromReferencesQueries" href="#definitionsFromReferencesQueries">func definitionsFromReferencesQueries() []util.ParallelFn</a>

```
searchKey: main.definitionsFromReferencesQueries
tags: [function private]
```

```Go
func definitionsFromReferencesQueries() []util.ParallelFn
```

definitionsFromReferencesQueries returns a list of test functions that queries the definitions of all the test cases references. 

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [function private]
```

```Go
func main()
```

### <a id="makeProcessedSignals" href="#makeProcessedSignals">func makeProcessedSignals(revsByRepo map[string][]string) map[string]map[string]chan error</a>

```
searchKey: main.makeProcessedSignals
tags: [method private]
```

```Go
func makeProcessedSignals(revsByRepo map[string][]string) map[string]map[string]chan error
```

makeProcessedSignals returns a map of error channels for each revision. 

### <a id="makeRefreshedSignals" href="#makeRefreshedSignals">func makeRefreshedSignals(revsByRepo map[string][]string) map[string]chan refreshState</a>

```
searchKey: main.makeRefreshedSignals
tags: [method private]
```

```Go
func makeRefreshedSignals(revsByRepo map[string][]string) map[string]chan refreshState
```

refreshedSignals returns a map of error channels for each repository. 

### <a id="makeTestQueryFunction" href="#makeTestQueryFunction">func makeTestQueryFunction(name string, location Location, expectedLocations []Location, f QueryFunc) util.ParallelFn</a>

```
searchKey: main.makeTestQueryFunction
tags: [method private]
```

```Go
func makeTestQueryFunction(name string, location Location, expectedLocations []Location, f QueryFunc) util.ParallelFn
```

makeTestQueryFunction constructs a function for RunParallel that invokes the given query function and checks the returned locations against the given expected locations. 

### <a id="makeTestUploadForRepositoryFunction" href="#makeTestUploadForRepositoryFunction">func makeTestUploadForRepositoryFunction(name string,...</a>

```
searchKey: main.makeTestUploadForRepositoryFunction
tags: [method private]
```

```Go
func makeTestUploadForRepositoryFunction(
	name string,
	revs []string,
	uploaded chan Upload,
	processedSignals map[string]map[string]chan error,
	refreshedSignals map[string]chan refreshState,
	limiter *util.Limiter,
) util.ParallelFn
```

makeTestUploadForRepositoryFunction constructs a function for RunParallel that uploads the index files for the given repo, then blocks until the upload records enter a terminal state. If any upload fails to process, an error is returned. 

### <a id="queryCommand" href="#queryCommand">func queryCommand() error</a>

```
searchKey: main.queryCommand
tags: [function private]
```

```Go
func queryCommand() error
```

queryCommand runs the "query" command. 

### <a id="queryDefinitions" href="#queryDefinitions">func queryDefinitions(ctx context.Context, location Location) (locations []Location, err error)</a>

```
searchKey: main.queryDefinitions
tags: [method private]
```

```Go
func queryDefinitions(ctx context.Context, location Location) (locations []Location, err error)
```

queryDefinitions returns all of the LSIF definitions for the given location. 

### <a id="queryReferences" href="#queryReferences">func queryReferences(ctx context.Context, location Location) (locations []Location, err error)</a>

```
searchKey: main.queryReferences
tags: [method private]
```

```Go
func queryReferences(ctx context.Context, location Location) (locations []Location, err error)
```

queryReferences returns all of the LSIF references for the given location. 

### <a id="readRevsByRepo" href="#readRevsByRepo">func readRevsByRepo() (map[string][]string, error)</a>

```
searchKey: main.readRevsByRepo
tags: [function private]
```

```Go
func readRevsByRepo() (map[string][]string, error)
```

readRevsByRepo returns a list of revisions by repository names for which there is an index file. 

### <a id="referencesFromDefinitionsQueries" href="#referencesFromDefinitionsQueries">func referencesFromDefinitionsQueries() []util.ParallelFn</a>

```
searchKey: main.referencesFromDefinitionsQueries
tags: [function private]
```

```Go
func referencesFromDefinitionsQueries() []util.ParallelFn
```

referencesFromDefinitionsQueries returns a list of test functions that queries the references of all the test cases definitions. 

### <a id="referencesFromReferencesQueries" href="#referencesFromReferencesQueries">func referencesFromReferencesQueries() []util.ParallelFn</a>

```
searchKey: main.referencesFromReferencesQueries
tags: [function private]
```

```Go
func referencesFromReferencesQueries() []util.ParallelFn
```

referencesFromReferencesQueries returns a list of test functions that queries the references of all the test cases references. 

### <a id="sortLocations" href="#sortLocations">func sortLocations(locations []Location)</a>

```
searchKey: main.sortLocations
tags: [method private]
```

```Go
func sortLocations(locations []Location)
```

sortLocations sorts a slice of Locations by repo, rev, path, line, then character. 

### <a id="upload" href="#upload">func upload(ctx context.Context, name string, index int, rev string, limiter *util.Limiter) (string, error)</a>

```
searchKey: main.upload
tags: [method private]
```

```Go
func upload(ctx context.Context, name string, index int, rev string, limiter *util.Limiter) (string, error)
```

upload invokes the `src lsif upload` command. This requires that src is installed on the current user's $PATH and is relatively up to date. 

### <a id="uploadCommand" href="#uploadCommand">func uploadCommand() error</a>

```
searchKey: main.uploadCommand
tags: [function private]
```

```Go
func uploadCommand() error
```

uploadCommand runs the "upload" command. 

### <a id="uploadIndexes" href="#uploadIndexes">func uploadIndexes(ctx context.Context) error</a>

```
searchKey: main.uploadIndexes
tags: [method private]
```

```Go
func uploadIndexes(ctx context.Context) error
```

uploadIndexes uploads each file in the index directory and blocks until each upload has been successfully processed. 

### <a id="uploadStates" href="#uploadStates">func uploadStates(ctx context.Context, ids, names []string) (stateByUpload map[string]string, staleCommitGraphByRepo map[string]bool, _ error)</a>

```
searchKey: main.uploadStates
tags: [method private]
```

```Go
func uploadStates(ctx context.Context, ids, names []string) (stateByUpload map[string]string, staleCommitGraphByRepo map[string]bool, _ error)
```

uploadStates returns a map from upload identifier to its current state. 

### <a id="watchStateChanges" href="#watchStateChanges">func watchStateChanges(ctx context.Context,...</a>

```
searchKey: main.watchStateChanges
tags: [method private]
```

```Go
func watchStateChanges(
	ctx context.Context,
	uploaded chan Upload,
	processedSignals map[string]map[string]chan error,
	refreshedSignals map[string]chan refreshState,
)
```

watchStateChanges maintains a list of uploaded but nonterminal upload records. This function polls the API and signals the worker when their upload has been processed. If an upload fails to process, the error will be sent to the worker. 

