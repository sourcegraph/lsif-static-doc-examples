# Package main

## Index

* [Variables](#var)
    * [var left](#left)
    * [var remainingWorkGauge](#remainingWorkGauge)
    * [var reposAlreadyDoneCounter](#reposAlreadyDoneCounter)
    * [var reposFailedCounter](#reposFailedCounter)
    * [var reposProcessedCounter](#reposProcessedCounter)
    * [var reposSucceededCounter](#reposSucceededCounter)
    * [var right](#right)
* [Types](#type)
    * [type feederDB struct](#feederDB)
        * [func newFeederDB(path string) (*feederDB, error)](#newFeederDB)
        * [func (fdr *feederDB) declareOrg(org string) error](#feederDB.declareOrg)
        * [func (fdr *feederDB) declareRepo(ownerRepo string) (alreadyDone bool, err error)](#feederDB.declareRepo)
        * [func (fdr *feederDB) failed(ownerRepo string, errType string) error](#feederDB.failed)
        * [func (fdr *feederDB) succeeded(ownerRepo string, org string) error](#feederDB.succeeded)
    * [type feederError struct](#feederError)
        * [func (e *feederError) Error() string](#feederError.Error)
        * [func (e *feederError) Unwrap() error](#feederError.Unwrap)
    * [type producer struct](#producer)
        * [func (prdc *producer) pump(ctx context.Context) error](#producer.pump)
        * [func (prdc *producer) pumpFile(ctx context.Context, path string) error](#producer.pumpFile)
    * [type worker struct](#worker)
        * [func (wkr *worker) addGHEOrg(ctx context.Context) error](#worker.addGHEOrg)
        * [func (wkr *worker) addGHERepo(ctx context.Context, owner, repo string) (*github.Repository, error)](#worker.addGHERepo)
        * [func (wkr *worker) addRemote(ctx context.Context, gheRepo *github.Repository, owner, repo string) error](#worker.addRemote)
        * [func (wkr *worker) cloneRepo(ctx context.Context, owner, repo string) error](#worker.cloneRepo)
        * [func (wkr *worker) process(ctx context.Context, owner, repo string) error](#worker.process)
        * [func (wkr *worker) pushToGHE(ctx context.Context, owner, repo string) error](#worker.pushToGHE)
        * [func (wkr *worker) run(ctx context.Context)](#worker.run)
* [Functions](#func)
    * [func extractOwnerRepoFromCSVLine(line string) string](#extractOwnerRepoFromCSVLine)
    * [func getRandomName(retry int) string](#getRandomName)
    * [func init()](#init.worker.go)
    * [func main()](#main)
    * [func newGHEClient(ctx context.Context, baseURL, uploadURL, token string) (*github.Client, error)](#newGHEClient)
    * [func numLinesInFile(path string, skipNumLines int64) (int64, int64, error)](#numLinesInFile)
    * [func numLinesTotal(skipNumLines int64) (int64, error)](#numLinesTotal)
    * [func randomOrgNameAndSize() (string, int)](#randomOrgNameAndSize)
    * [func stats(wkrs []*worker, prdc *producer) string](#stats)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="left" href="#left">var left</a>

```
searchKey: main.left
tags: [variable array string private]
```

```Go
var left = ...
```

### <a id="remainingWorkGauge" href="#remainingWorkGauge">var remainingWorkGauge</a>

```
searchKey: main.remainingWorkGauge
tags: [variable interface private]
```

```Go
var remainingWorkGauge = ...
```

### <a id="reposAlreadyDoneCounter" href="#reposAlreadyDoneCounter">var reposAlreadyDoneCounter</a>

```
searchKey: main.reposAlreadyDoneCounter
tags: [variable interface private]
```

```Go
var reposAlreadyDoneCounter = ...
```

### <a id="reposFailedCounter" href="#reposFailedCounter">var reposFailedCounter</a>

```
searchKey: main.reposFailedCounter
tags: [variable struct private]
```

```Go
var reposFailedCounter = ...
```

### <a id="reposProcessedCounter" href="#reposProcessedCounter">var reposProcessedCounter</a>

```
searchKey: main.reposProcessedCounter
tags: [variable struct private]
```

```Go
var reposProcessedCounter = ...
```

### <a id="reposSucceededCounter" href="#reposSucceededCounter">var reposSucceededCounter</a>

```
searchKey: main.reposSucceededCounter
tags: [variable interface private]
```

```Go
var reposSucceededCounter = ...
```

### <a id="right" href="#right">var right</a>

```
searchKey: main.right
tags: [variable array string private]
```

```Go
var right = ...
```

Docker, starting from 0.7.x, generates names from notable scientists and hackers. Please, for any amazing man that you add to the list, consider adding an equally amazing woman to it, and vice versa. 

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="feederDB" href="#feederDB">type feederDB struct</a>

```
searchKey: main.feederDB
tags: [struct private]
```

```Go
type feederDB struct {
	// sqlite is not thread-safe, this mutex protects access to it
	sync.Mutex
	// where the DB file is
	path string
	// the opened DB
	db *sql.DB
	// logger for this feeder DB
	logger log15.Logger
}
```

feederDB is a front to a sqlite DB that records ownerRepo processed, orgs created and whether processing was successful or failed 

#### <a id="newFeederDB" href="#newFeederDB">func newFeederDB(path string) (*feederDB, error)</a>

```
searchKey: main.newFeederDB
tags: [method private]
```

```Go
func newFeederDB(path string) (*feederDB, error)
```

newFeederDB creates or opens the DB, creating the two tables if necessary 

#### <a id="feederDB.declareOrg" href="#feederDB.declareOrg">func (fdr *feederDB) declareOrg(org string) error</a>

```
searchKey: main.feederDB.declareOrg
tags: [method private]
```

```Go
func (fdr *feederDB) declareOrg(org string) error
```

declareOrg adds a newly created org from one of the workers. 

#### <a id="feederDB.declareRepo" href="#feederDB.declareRepo">func (fdr *feederDB) declareRepo(ownerRepo string) (alreadyDone bool, err error)</a>

```
searchKey: main.feederDB.declareRepo
tags: [method private]
```

```Go
func (fdr *feederDB) declareRepo(ownerRepo string) (alreadyDone bool, err error)
```

declareRepo adds the ownerRepo to the DB when it gets pumped into the pipe and made available to the workers for processing. if ownerRepo was already done in a previous run, then returns true, so pump can skip it. 

#### <a id="feederDB.failed" href="#feederDB.failed">func (fdr *feederDB) failed(ownerRepo string, errType string) error</a>

```
searchKey: main.feederDB.failed
tags: [method private]
```

```Go
func (fdr *feederDB) failed(ownerRepo string, errType string) error
```

failed records the fact that the worker processing the specified ownerRepo failed to process it. errType is recorded because specific errTypes are not worth rerunning in a subsequent run (for example if repo is private on github.com and we don't have credentials for it, it's not worth trying again in a next run). 

#### <a id="feederDB.succeeded" href="#feederDB.succeeded">func (fdr *feederDB) succeeded(ownerRepo string, org string) error</a>

```
searchKey: main.feederDB.succeeded
tags: [method private]
```

```Go
func (fdr *feederDB) succeeded(ownerRepo string, org string) error
```

succeeded records that a worker has successfully processed the specified ownerRepo. 

### <a id="feederError" href="#feederError">type feederError struct</a>

```
searchKey: main.feederError
tags: [struct private]
```

```Go
type feederError struct {
	// one of: api, clone, push, unknown
	errType string
	// underlying error
	err error
}
```

feederError is an error while processing an ownerRepo line. errType partitions the errors in 4 major categories to use in metrics in logging: api, clone, push and unknown. 

#### <a id="feederError.Error" href="#feederError.Error">func (e *feederError) Error() string</a>

```
searchKey: main.feederError.Error
tags: [function private]
```

```Go
func (e *feederError) Error() string
```

#### <a id="feederError.Unwrap" href="#feederError.Unwrap">func (e *feederError) Unwrap() error</a>

```
searchKey: main.feederError.Unwrap
tags: [function private]
```

```Go
func (e *feederError) Unwrap() error
```

### <a id="producer" href="#producer">type producer struct</a>

```
searchKey: main.producer
tags: [struct private]
```

```Go
type producer struct {
	// how many lines are remaining to be processed
	remaining int64
	// where to send each ownerRepo. the workers expect 'owner/repo' strings
	pipe chan<- string
	// sqlite DB where each ownerRepo is declared (to keep progress and to implement resume functionality)
	fdr *feederDB
	// how many we have already processed
	numAlreadyDone int64
	// logger for the pump
	logger log15.Logger
	// terminal UI progress bar
	bar *progressbar.ProgressBar
	// skips this many lines from the input before starting to feed into the pipe
	skipNumLines int64
}
```

producer is pumping input line by line into the pipe channel for processing by the workers. 

#### <a id="producer.pump" href="#producer.pump">func (prdc *producer) pump(ctx context.Context) error</a>

```
searchKey: main.producer.pump
tags: [method private]
```

```Go
func (prdc *producer) pump(ctx context.Context) error
```

pump finds all the input files specified as command line by recursively going through all specified directories and looking for '*.csv', '*.json' and '*.txt' files. 

#### <a id="producer.pumpFile" href="#producer.pumpFile">func (prdc *producer) pumpFile(ctx context.Context, path string) error</a>

```
searchKey: main.producer.pumpFile
tags: [method private]
```

```Go
func (prdc *producer) pumpFile(ctx context.Context, path string) error
```

pumpFile reads the specified file line by line and feeds ownerRepo strings into the pipe 

### <a id="worker" href="#worker">type worker struct</a>

```
searchKey: main.worker
tags: [struct private]
```

```Go
type worker struct {
	// used in logs and metrics
	name string
	// index of the worker (which one in range [0, numWorkers)
	index int
	// directory to use for cloning from github.com
	scratchDir string

	// GHE API client
	client *github.Client
	admin  string
	token  string

	// gets the lines of work from this channel (each line has a owner/repo string in some format)
	work <-chan string
	// wait group to decrement when this worker is done working
	wg *sync.WaitGroup
	// terminal UI progress bar
	bar *progressbar.ProgressBar

	// some stats
	numFailed    int64
	numSucceeded int64

	// feeder DB is a sqlite DB, worker marks processed ownerRepos as successfully processed or failed
	fdr *feederDB
	// keeps track of org to which to add repos
	// (when currentNumRepos reaches currentMaxRepos, it generates a new random triple of these)
	currentOrg      string
	currentNumRepos int
	currentMaxRepos int

	// logger has worker name inprinted
	logger log15.Logger

	// rate limiter for the GHE API calls
	rateLimiter *rate.Limiter
	// how many simultaneous `git push` operations to the GHE
	pushSem chan struct{}
	// how many simultaneous `git clone` operations from github.com
	cloneSem chan struct{}
	// how many times to try to clone from github.com
	numCloningAttempts int
	// how long to wait before cutting short a cloning from github.com
	cloneRepoTimeout time.Duration

	// host to add as a remote to a cloned repo pointing to GHE instance
	host string
}
```

worker processes ownerRepo strings, feeding them to GHE instance. it declares orgs if needed, clones from github.com, adds GHE as a remote, declares repo in GHE through API and does a git push to the GHE. there's many workers working at the same time, taking work from a work channel fed by a pump that reads lines from the input. 

#### <a id="worker.addGHEOrg" href="#worker.addGHEOrg">func (wkr *worker) addGHEOrg(ctx context.Context) error</a>

```
searchKey: main.worker.addGHEOrg
tags: [method private]
```

```Go
func (wkr *worker) addGHEOrg(ctx context.Context) error
```

addGHEOrg uses the GHE API to declare the org at the GHE 

#### <a id="worker.addGHERepo" href="#worker.addGHERepo">func (wkr *worker) addGHERepo(ctx context.Context, owner, repo string) (*github.Repository, error)</a>

```
searchKey: main.worker.addGHERepo
tags: [method private]
```

```Go
func (wkr *worker) addGHERepo(ctx context.Context, owner, repo string) (*github.Repository, error)
```

addGHEOrg uses the GHE API to declare the repo at the GHE 

#### <a id="worker.addRemote" href="#worker.addRemote">func (wkr *worker) addRemote(ctx context.Context, gheRepo *github.Repository, owner, repo string) error</a>

```
searchKey: main.worker.addRemote
tags: [method private]
```

```Go
func (wkr *worker) addRemote(ctx context.Context, gheRepo *github.Repository, owner, repo string) error
```

addRemote declares the GHE as a remote to the cloned repo 

#### <a id="worker.cloneRepo" href="#worker.cloneRepo">func (wkr *worker) cloneRepo(ctx context.Context, owner, repo string) error</a>

```
searchKey: main.worker.cloneRepo
tags: [method private]
```

```Go
func (wkr *worker) cloneRepo(ctx context.Context, owner, repo string) error
```

cloneRepo clones the specified repo from github.com into the scratchDir 

#### <a id="worker.process" href="#worker.process">func (wkr *worker) process(ctx context.Context, owner, repo string) error</a>

```
searchKey: main.worker.process
tags: [method private]
```

```Go
func (wkr *worker) process(ctx context.Context, owner, repo string) error
```

process does the necessary work for one ownerRepo string: clone, declare repo in GHE through API, add remote and push 

#### <a id="worker.pushToGHE" href="#worker.pushToGHE">func (wkr *worker) pushToGHE(ctx context.Context, owner, repo string) error</a>

```
searchKey: main.worker.pushToGHE
tags: [method private]
```

```Go
func (wkr *worker) pushToGHE(ctx context.Context, owner, repo string) error
```

pushToGHE does a `git push` command to the GHE remote 

#### <a id="worker.run" href="#worker.run">func (wkr *worker) run(ctx context.Context)</a>

```
searchKey: main.worker.run
tags: [method private]
```

```Go
func (wkr *worker) run(ctx context.Context)
```

run spins until work channel closes or context cancels 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="extractOwnerRepoFromCSVLine" href="#extractOwnerRepoFromCSVLine">func extractOwnerRepoFromCSVLine(line string) string</a>

```
searchKey: main.extractOwnerRepoFromCSVLine
tags: [method private]
```

```Go
func extractOwnerRepoFromCSVLine(line string) string
```

extractOwnerRepoFromCSVLine extracts the owner and repo from a line that comes from a CSV file that a GHE instance created in a repo report (so it has a certain number of fields). for example: 2019-05-23 15:24:16 -0700,4,Organization,sourcegraph,9,tsenart-vegeta,public,1.64 MB,1683,0,false,false we're looking for field number 6 (tsenart-vegeta in the example) and split it into owner/repo by replacing the first '-' with a '/' (the owner and repo were merged when added, this is the owner on github.com, not in the GHE) 

### <a id="getRandomName" href="#getRandomName">func getRandomName(retry int) string</a>

```
searchKey: main.getRandomName
tags: [method private]
```

```Go
func getRandomName(retry int) string
```

GetRandomName generates a random name from the list of adjectives and surnames in this package formatted as "adjective_surname". For example 'focused_turing'. If retry is non-zero, a random integer between 0 and 10 will be added to the end of the name, e.g `focused_turing3` 

### <a id="init.worker.go" href="#init.worker.go">func init()</a>

```
searchKey: main.init
tags: [function private]
```

```Go
func init()
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [function private]
```

```Go
func main()
```

### <a id="newGHEClient" href="#newGHEClient">func newGHEClient(ctx context.Context, baseURL, uploadURL, token string) (*github.Client, error)</a>

```
searchKey: main.newGHEClient
tags: [method private]
```

```Go
func newGHEClient(ctx context.Context, baseURL, uploadURL, token string) (*github.Client, error)
```

### <a id="numLinesInFile" href="#numLinesInFile">func numLinesInFile(path string, skipNumLines int64) (int64, int64, error)</a>

```
searchKey: main.numLinesInFile
tags: [method private]
```

```Go
func numLinesInFile(path string, skipNumLines int64) (int64, int64, error)
```

numLinesInFile counts how many lines are in the specified file (it starts counting only after skipNumLines have been skipped from the file). Returns counted lines, how many lines were skipped and any errors. 

### <a id="numLinesTotal" href="#numLinesTotal">func numLinesTotal(skipNumLines int64) (int64, error)</a>

```
searchKey: main.numLinesTotal
tags: [method private]
```

```Go
func numLinesTotal(skipNumLines int64) (int64, error)
```

numLinesTotal goes through all the inputs and counts how many lines are available for processing. 

### <a id="randomOrgNameAndSize" href="#randomOrgNameAndSize">func randomOrgNameAndSize() (string, int)</a>

```
searchKey: main.randomOrgNameAndSize
tags: [function private]
```

```Go
func randomOrgNameAndSize() (string, int)
```

randomOrgNameAndSize returns a random, unique name for an org and a random size of repos it should have 

### <a id="stats" href="#stats">func stats(wkrs []*worker, prdc *producer) string</a>

```
searchKey: main.stats
tags: [method private]
```

```Go
func stats(wkrs []*worker, prdc *producer) string
```

