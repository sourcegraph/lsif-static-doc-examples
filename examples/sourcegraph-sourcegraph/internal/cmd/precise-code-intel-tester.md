# Package main

## Index

* Subpages
  * [internal/cmd/precise-code-intel-tester/util](precise-code-intel-tester/util.md)
* [Constants](#const)
    * [const uploadQueryFragment](#uploadQueryFragment)
    * [const repositoryQueryFragment](#repositoryQueryFragment)
* [Variables](#var)
    * [var endpoint](#endpoint)
    * [var token](#token)
    * [var indexDir](#indexDir)
    * [var numConcurrentUploads](#numConcurrentUploads)
    * [var numConcurrentRequests](#numConcurrentRequests)
    * [var checkQueryResult](#checkQueryResult)
    * [var queryReferencesOfReferences](#queryReferencesOfReferences)
    * [var commands](#commands)
    * [var queryGenerators](#queryGenerators)
    * [var testCases](#testCases)
    * [var indexFilenamePattern](#indexFilenamePattern)
    * [var ErrProcessingFailed](#ErrProcessingFailed)
    * [var uploadIDPattern](#uploadIDPattern)
* [Types](#type)
    * [type QueryFunc func(context.Context, github.com/sourcegraph/sourcegraph/internal/cmd/precise-code-intel-tester.Location) ([]github.com/sourcegraph/sourcegraph/internal/cmd/precise-code-intel-tester.Location, error)](#QueryFunc)
    * [type QueryResponse struct](#QueryResponse)
    * [type Definitions struct](#Definitions)
    * [type References struct](#References)
    * [type Node struct](#Node)
    * [type Resource struct](#Resource)
    * [type Repository struct](#Repository)
    * [type Commit struct](#Commit)
    * [type Range struct](#Range)
    * [type Position struct](#Position)
    * [type PageInfo struct](#PageInfo)
    * [type Location struct](#Location)
    * [type Upload struct](#Upload)
    * [type refreshState struct](#refreshState)
* [Functions](#func)
    * [func main()](#main)
    * [func commandNameList() string](#commandNameList)
    * [func queryCommand() error](#queryCommand)
    * [func referencesFromDefinitionsQueries() []util.ParallelFn](#referencesFromDefinitionsQueries)
    * [func definitionsFromReferencesQueries() []util.ParallelFn](#definitionsFromReferencesQueries)
    * [func referencesFromReferencesQueries() []util.ParallelFn](#referencesFromReferencesQueries)
    * [func makeTestQueryFunction(name string, location Location, expectedLocations []Location, f QueryFunc) util.ParallelFn](#makeTestQueryFunction)
    * [func queryDefinitions(ctx context.Context, location Location) (locations []Location, err error)](#queryDefinitions)
    * [func queryReferences(ctx context.Context, location Location) (locations []Location, err error)](#queryReferences)
    * [func sortLocations(locations []Location)](#sortLocations)
    * [func compareLocations(a, b Location) int](#compareLocations)
    * [func uploadCommand() error](#uploadCommand)
    * [func uploadIndexes(ctx context.Context) error](#uploadIndexes)
    * [func readRevsByRepo() (map[string][]string, error)](#readRevsByRepo)
    * [func countRevs(revsByRepo map[string][]string) int](#countRevs)
    * [func makeProcessedSignals(revsByRepo map[string][]string) map[string]map[string]chan error](#makeProcessedSignals)
    * [func makeRefreshedSignals(revsByRepo map[string][]string) map[string]chan refreshState](#makeRefreshedSignals)
    * [func watchStateChanges(ctx context.Context,...](#watchStateChanges)
    * [func uploadStates(ctx context.Context, ids, names []string) (stateByUpload map[string]string, staleCommitGraphByRepo map[string]bool, _ error)](#uploadStates)
    * [func makeTestUploadForRepositoryFunction(name string,...](#makeTestUploadForRepositoryFunction)
    * [func upload(ctx context.Context, name string, index int, rev string, limiter *util.Limiter) (string, error)](#upload)


## <a id="const" href="#const">Constants</a>

### <a id="uploadQueryFragment" href="#uploadQueryFragment">const uploadQueryFragment</a>

```
searchKey: main.uploadQueryFragment
```

```Go
const uploadQueryFragment = `
	u%d: node(id: "%s") {
		... on LSIFUpload { state }
	}
`
```

### <a id="repositoryQueryFragment" href="#repositoryQueryFragment">const repositoryQueryFragment</a>

```
searchKey: main.repositoryQueryFragment
```

```Go
const repositoryQueryFragment = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="endpoint" href="#endpoint">var endpoint</a>

```
searchKey: main.endpoint
```

```Go
var endpoint = ...
```

### <a id="token" href="#token">var token</a>

```
searchKey: main.token
```

```Go
var token = env.Get("SOURCEGRAPH_SUDO_TOKEN", "", "Access token")
```

### <a id="indexDir" href="#indexDir">var indexDir</a>

```
searchKey: main.indexDir
```

```Go
var indexDir string
```

Flags 

### <a id="numConcurrentUploads" href="#numConcurrentUploads">var numConcurrentUploads</a>

```
searchKey: main.numConcurrentUploads
```

```Go
var numConcurrentUploads int
```

### <a id="numConcurrentRequests" href="#numConcurrentRequests">var numConcurrentRequests</a>

```
searchKey: main.numConcurrentRequests
```

```Go
var numConcurrentRequests int
```

### <a id="checkQueryResult" href="#checkQueryResult">var checkQueryResult</a>

```
searchKey: main.checkQueryResult
```

```Go
var checkQueryResult bool
```

### <a id="queryReferencesOfReferences" href="#queryReferencesOfReferences">var queryReferencesOfReferences</a>

```
searchKey: main.queryReferencesOfReferences
```

```Go
var queryReferencesOfReferences bool
```

### <a id="commands" href="#commands">var commands</a>

```
searchKey: main.commands
```

```Go
var commands = map[string]func() error{
	"upload": uploadCommand,
	"query":  queryCommand,
}
```

Entrypoints 

### <a id="queryGenerators" href="#queryGenerators">var queryGenerators</a>

```
searchKey: main.queryGenerators
```

```Go
var queryGenerators = ...
```

queryGenerators is the list of functions that create query test functions. 

### <a id="testCases" href="#testCases">var testCases</a>

```
searchKey: main.testCases
```

```Go
var testCases = ...
```

### <a id="indexFilenamePattern" href="#indexFilenamePattern">var indexFilenamePattern</a>

```
searchKey: main.indexFilenamePattern
```

```Go
var indexFilenamePattern = regexp.MustCompile(`^(.+)\.\d+\.([0-9A-Fa-f]{40})\.dump$`)
```

indexFilenamePattern extracts a repo name and rev from the index filename. We assume that the index segment here (the non-captured `.\d+.`) occupies [0,n) without gaps for each repository. 

### <a id="ErrProcessingFailed" href="#ErrProcessingFailed">var ErrProcessingFailed</a>

```
searchKey: main.ErrProcessingFailed
tags: [exported]
```

```Go
var ErrProcessingFailed = errors.New("processing failed")
```

ErrProcessingFailed occurs when an upload enters the ERRORED state. 

### <a id="uploadIDPattern" href="#uploadIDPattern">var uploadIDPattern</a>

```
searchKey: main.uploadIDPattern
```

```Go
var uploadIDPattern = regexp.MustCompile(`/settings/code-intelligence/lsif-uploads/([0-9A-Za-z=]+)`)
```

uploadIDPattern extracts a GraphQL identifier from the output of the `src lsif upload` command. 

## <a id="type" href="#type">Types</a>

### <a id="QueryFunc" href="#QueryFunc">type QueryFunc func(context.Context, github.com/sourcegraph/sourcegraph/internal/cmd/precise-code-intel-tester.Location) ([]github.com/sourcegraph/sourcegraph/internal/cmd/precise-code-intel-tester.Location, error)</a>

```
searchKey: main.QueryFunc
tags: [exported]
```

```Go
type QueryFunc func(context.Context, Location) ([]Location, error)
```

QueryFunc performs a GraphQL query (definition or references) given the source location. 

### <a id="QueryResponse" href="#QueryResponse">type QueryResponse struct</a>

```
searchKey: main.QueryResponse
tags: [exported]
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

### <a id="Definitions" href="#Definitions">type Definitions struct</a>

```
searchKey: main.Definitions
tags: [exported]
```

```Go
type Definitions struct {
	Nodes []Node `json:"nodes"`
}
```

### <a id="References" href="#References">type References struct</a>

```
searchKey: main.References
tags: [exported]
```

```Go
type References struct {
	Nodes    []Node   `json:"nodes"`
	PageInfo PageInfo `json:"pageInfo"`
}
```

### <a id="Node" href="#Node">type Node struct</a>

```
searchKey: main.Node
tags: [exported]
```

```Go
type Node struct {
	Resource `json:"resource"`
	Range    `json:"range"`
}
```

### <a id="Resource" href="#Resource">type Resource struct</a>

```
searchKey: main.Resource
tags: [exported]
```

```Go
type Resource struct {
	Path       string     `json:"path"`
	Repository Repository `json:"repository"`
	Commit     Commit     `json:"commit"`
}
```

### <a id="Repository" href="#Repository">type Repository struct</a>

```
searchKey: main.Repository
tags: [exported]
```

```Go
type Repository struct {
	Name string `json:"name"`
}
```

### <a id="Commit" href="#Commit">type Commit struct</a>

```
searchKey: main.Commit
tags: [exported]
```

```Go
type Commit struct {
	Oid string `json:"oid"`
}
```

### <a id="Range" href="#Range">type Range struct</a>

```
searchKey: main.Range
tags: [exported]
```

```Go
type Range struct {
	Start Position `json:"start"`
	End   Position `json:"end"`
}
```

### <a id="Position" href="#Position">type Position struct</a>

```
searchKey: main.Position
tags: [exported]
```

```Go
type Position struct {
	Line      int `json:"line"`
	Character int `json:"character"`
}
```

### <a id="PageInfo" href="#PageInfo">type PageInfo struct</a>

```
searchKey: main.PageInfo
tags: [exported]
```

```Go
type PageInfo struct {
	EndCursor string `json:"endCursor"`
}
```

### <a id="Location" href="#Location">type Location struct</a>

```
searchKey: main.Location
tags: [exported]
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

### <a id="Upload" href="#Upload">type Upload struct</a>

```
searchKey: main.Upload
tags: [exported]
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
```

```Go
type refreshState struct {
	Stale bool
	Err   error
}
```

## <a id="func" href="#func">Functions</a>

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
```

```Go
func main()
```

### <a id="commandNameList" href="#commandNameList">func commandNameList() string</a>

```
searchKey: main.commandNameList
```

```Go
func commandNameList() string
```

commandNameList returns a comma-separated list of valid command names. 

### <a id="queryCommand" href="#queryCommand">func queryCommand() error</a>

```
searchKey: main.queryCommand
```

```Go
func queryCommand() error
```

queryCommand runs the "query" command. 

### <a id="referencesFromDefinitionsQueries" href="#referencesFromDefinitionsQueries">func referencesFromDefinitionsQueries() []util.ParallelFn</a>

```
searchKey: main.referencesFromDefinitionsQueries
```

```Go
func referencesFromDefinitionsQueries() []util.ParallelFn
```

referencesFromDefinitionsQueries returns a list of test functions that queries the references of all the test cases definitions. 

### <a id="definitionsFromReferencesQueries" href="#definitionsFromReferencesQueries">func definitionsFromReferencesQueries() []util.ParallelFn</a>

```
searchKey: main.definitionsFromReferencesQueries
```

```Go
func definitionsFromReferencesQueries() []util.ParallelFn
```

definitionsFromReferencesQueries returns a list of test functions that queries the definitions of all the test cases references. 

### <a id="referencesFromReferencesQueries" href="#referencesFromReferencesQueries">func referencesFromReferencesQueries() []util.ParallelFn</a>

```
searchKey: main.referencesFromReferencesQueries
```

```Go
func referencesFromReferencesQueries() []util.ParallelFn
```

referencesFromReferencesQueries returns a list of test functions that queries the references of all the test cases references. 

### <a id="makeTestQueryFunction" href="#makeTestQueryFunction">func makeTestQueryFunction(name string, location Location, expectedLocations []Location, f QueryFunc) util.ParallelFn</a>

```
searchKey: main.makeTestQueryFunction
```

```Go
func makeTestQueryFunction(name string, location Location, expectedLocations []Location, f QueryFunc) util.ParallelFn
```

makeTestQueryFunction constructs a function for RunParallel that invokes the given query function and checks the returned locations against the given expected locations. 

### <a id="queryDefinitions" href="#queryDefinitions">func queryDefinitions(ctx context.Context, location Location) (locations []Location, err error)</a>

```
searchKey: main.queryDefinitions
```

```Go
func queryDefinitions(ctx context.Context, location Location) (locations []Location, err error)
```

queryDefinitions returns all of the LSIF definitions for the given location. 

### <a id="queryReferences" href="#queryReferences">func queryReferences(ctx context.Context, location Location) (locations []Location, err error)</a>

```
searchKey: main.queryReferences
```

```Go
func queryReferences(ctx context.Context, location Location) (locations []Location, err error)
```

queryReferences returns all of the LSIF references for the given location. 

### <a id="sortLocations" href="#sortLocations">func sortLocations(locations []Location)</a>

```
searchKey: main.sortLocations
```

```Go
func sortLocations(locations []Location)
```

sortLocations sorts a slice of Locations by repo, rev, path, line, then character. 

### <a id="compareLocations" href="#compareLocations">func compareLocations(a, b Location) int</a>

```
searchKey: main.compareLocations
```

```Go
func compareLocations(a, b Location) int
```

Compare returns an integer comparing two locations. The result will be 0 if a == b, -1 if a < b, and +1 if a > b. 

### <a id="uploadCommand" href="#uploadCommand">func uploadCommand() error</a>

```
searchKey: main.uploadCommand
```

```Go
func uploadCommand() error
```

uploadCommand runs the "upload" command. 

### <a id="uploadIndexes" href="#uploadIndexes">func uploadIndexes(ctx context.Context) error</a>

```
searchKey: main.uploadIndexes
```

```Go
func uploadIndexes(ctx context.Context) error
```

uploadIndexes uploads each file in the index directory and blocks until each upload has been successfully processed. 

### <a id="readRevsByRepo" href="#readRevsByRepo">func readRevsByRepo() (map[string][]string, error)</a>

```
searchKey: main.readRevsByRepo
```

```Go
func readRevsByRepo() (map[string][]string, error)
```

readRevsByRepo returns a list of revisions by repository names for which there is an index file. 

### <a id="countRevs" href="#countRevs">func countRevs(revsByRepo map[string][]string) int</a>

```
searchKey: main.countRevs
```

```Go
func countRevs(revsByRepo map[string][]string) int
```

countRevs returns the total number of revision. 

### <a id="makeProcessedSignals" href="#makeProcessedSignals">func makeProcessedSignals(revsByRepo map[string][]string) map[string]map[string]chan error</a>

```
searchKey: main.makeProcessedSignals
```

```Go
func makeProcessedSignals(revsByRepo map[string][]string) map[string]map[string]chan error
```

makeProcessedSignals returns a map of error channels for each revision. 

### <a id="makeRefreshedSignals" href="#makeRefreshedSignals">func makeRefreshedSignals(revsByRepo map[string][]string) map[string]chan refreshState</a>

```
searchKey: main.makeRefreshedSignals
```

```Go
func makeRefreshedSignals(revsByRepo map[string][]string) map[string]chan refreshState
```

refreshedSignals returns a map of error channels for each repository. 

### <a id="watchStateChanges" href="#watchStateChanges">func watchStateChanges(ctx context.Context,...</a>

```
searchKey: main.watchStateChanges
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

### <a id="uploadStates" href="#uploadStates">func uploadStates(ctx context.Context, ids, names []string) (stateByUpload map[string]string, staleCommitGraphByRepo map[string]bool, _ error)</a>

```
searchKey: main.uploadStates
```

```Go
func uploadStates(ctx context.Context, ids, names []string) (stateByUpload map[string]string, staleCommitGraphByRepo map[string]bool, _ error)
```

uploadStates returns a map from upload identifier to its current state. 

### <a id="makeTestUploadForRepositoryFunction" href="#makeTestUploadForRepositoryFunction">func makeTestUploadForRepositoryFunction(name string,...</a>

```
searchKey: main.makeTestUploadForRepositoryFunction
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

### <a id="upload" href="#upload">func upload(ctx context.Context, name string, index int, rev string, limiter *util.Limiter) (string, error)</a>

```
searchKey: main.upload
```

```Go
func upload(ctx context.Context, name string, index int, rev string, limiter *util.Limiter) (string, error)
```

upload invokes the `src lsif upload` command. This requires that src is installed on the current user's $PATH and is relatively up to date. 

