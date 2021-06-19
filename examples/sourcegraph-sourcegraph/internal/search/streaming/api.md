# Package api

## Index

* [Constants](#const)
    * [const DocumentMatchLimit](#DocumentMatchLimit)
    * [const ShardMatchLimit](#ShardMatchLimit)
    * [const DisplayLimit](#DisplayLimit)
    * [const RepositoryLimit](#RepositoryLimit)
    * [const ShardTimeout](#ShardTimeout)
    * [const RepositoryCloning](#RepositoryCloning)
    * [const RepositoryMissing](#RepositoryMissing)
    * [const ExcludedFork](#ExcludedFork)
    * [const ExcludedArchive](#ExcludedArchive)
    * [const SeverityInfo](#SeverityInfo)
    * [const SeverityWarn](#SeverityWarn)
* [Variables](#var)
    * [var skippedHandlers](#skippedHandlers)
    * [var updateGolden](#updateGolden)
* [Types](#type)
    * [type Namer interface](#Namer)
    * [type ProgressStats struct](#ProgressStats)
    * [type Progress struct](#Progress)
        * [func BuildProgressEvent(stats ProgressStats) Progress](#BuildProgressEvent)
    * [type Skipped struct](#Skipped)
        * [func skippedReposHandler(repos []Namer, titleVerb, messageReason string, base Skipped) (Skipped, bool)](#skippedReposHandler)
        * [func repositoryCloningHandler(resultsResolver ProgressStats) (Skipped, bool)](#repositoryCloningHandler)
        * [func repositoryMissingHandler(resultsResolver ProgressStats) (Skipped, bool)](#repositoryMissingHandler)
        * [func shardTimeoutHandler(resultsResolver ProgressStats) (Skipped, bool)](#shardTimeoutHandler)
        * [func displayLimitHandler(resultsResolver ProgressStats) (Skipped, bool)](#displayLimitHandler)
        * [func shardMatchLimitHandler(resultsResolver ProgressStats) (Skipped, bool)](#shardMatchLimitHandler)
        * [func excludedForkHandler(resultsResolver ProgressStats) (Skipped, bool)](#excludedForkHandler)
        * [func excludedArchiveHandler(resultsResolver ProgressStats) (Skipped, bool)](#excludedArchiveHandler)
    * [type SkippedSuggested struct](#SkippedSuggested)
    * [type SkippedReason string](#SkippedReason)
    * [type SkippedSeverity string](#SkippedSeverity)
    * [type repo struct](#repo)
        * [func (r repo) Name() string](#repo.Name)
* [Functions](#func)
    * [func number(i int) string](#number)
    * [func plural(one, many string, n int) string](#plural)
    * [func TestSearchProgress(t *testing.T)](#TestSearchProgress)
    * [func TestNumber(t *testing.T)](#TestNumber)
    * [func intPtr(i int) *int](#intPtr)


## <a id="const" href="#const">Constants</a>

### <a id="DocumentMatchLimit" href="#DocumentMatchLimit">const DocumentMatchLimit</a>

```
searchKey: api.DocumentMatchLimit
tags: [exported]
```

```Go
const DocumentMatchLimit SkippedReason = "document-match-limit"
```

DocumentMatchLimit is when we found too many matches in a document, so we stopped searching it. 

### <a id="ShardMatchLimit" href="#ShardMatchLimit">const ShardMatchLimit</a>

```
searchKey: api.ShardMatchLimit
tags: [exported]
```

```Go
const ShardMatchLimit SkippedReason = "shard-match-limit"
```

ShardMatchLimit is when we found too many matches in a shard/repository, so we stopped searching it. 

### <a id="DisplayLimit" href="#DisplayLimit">const DisplayLimit</a>

```
searchKey: api.DisplayLimit
tags: [exported]
```

```Go
const DisplayLimit SkippedReason = "display"
```

DisplayLimit is when we found too many matches during a search so we stopped displaying results. 

### <a id="RepositoryLimit" href="#RepositoryLimit">const RepositoryLimit</a>

```
searchKey: api.RepositoryLimit
tags: [exported]
```

```Go
const RepositoryLimit SkippedReason = "repository-limit"
```

RepositoryLimit is when we did not search a repository because the set of repositories to search was too large. 

### <a id="ShardTimeout" href="#ShardTimeout">const ShardTimeout</a>

```
searchKey: api.ShardTimeout
tags: [exported]
```

```Go
const ShardTimeout SkippedReason = "shard-timeout"
```

ShardTimeout is when we ran out of time before searching a shard/repository. 

### <a id="RepositoryCloning" href="#RepositoryCloning">const RepositoryCloning</a>

```
searchKey: api.RepositoryCloning
tags: [exported]
```

```Go
const RepositoryCloning SkippedReason = "repository-cloning"
```

RepositoryCloning is when we could not search a repository because it is not cloned. 

### <a id="RepositoryMissing" href="#RepositoryMissing">const RepositoryMissing</a>

```
searchKey: api.RepositoryMissing
tags: [exported]
```

```Go
const RepositoryMissing SkippedReason = "repository-missing"
```

RepositoryMissing is when we could not search a repository because it is not cloned and we failed to find it on the remote code host. 

### <a id="ExcludedFork" href="#ExcludedFork">const ExcludedFork</a>

```
searchKey: api.ExcludedFork
tags: [exported]
```

```Go
const ExcludedFork SkippedReason = "repository-fork"
```

ExcludedFork is when we did not search a repository because it is a fork. 

### <a id="ExcludedArchive" href="#ExcludedArchive">const ExcludedArchive</a>

```
searchKey: api.ExcludedArchive
tags: [exported]
```

```Go
const ExcludedArchive SkippedReason = "excluded-archive"
```

ExcludedArchive is when we did not search a repository because it is archived. 

### <a id="SeverityInfo" href="#SeverityInfo">const SeverityInfo</a>

```
searchKey: api.SeverityInfo
tags: [exported]
```

```Go
const SeverityInfo SkippedSeverity = "info"
```

### <a id="SeverityWarn" href="#SeverityWarn">const SeverityWarn</a>

```
searchKey: api.SeverityWarn
tags: [exported]
```

```Go
const SeverityWarn SkippedSeverity = "warn"
```

## <a id="var" href="#var">Variables</a>

### <a id="skippedHandlers" href="#skippedHandlers">var skippedHandlers</a>

```
searchKey: api.skippedHandlers
```

```Go
var skippedHandlers = ...
```

TODO implement all skipped reasons 

### <a id="updateGolden" href="#updateGolden">var updateGolden</a>

```
searchKey: api.updateGolden
```

```Go
var updateGolden = flag.Bool("update", false, "Updastdata goldens")
```

## <a id="type" href="#type">Types</a>

### <a id="Namer" href="#Namer">type Namer interface</a>

```
searchKey: api.Namer
tags: [exported]
```

```Go
type Namer interface {
	Name() string
}
```

### <a id="ProgressStats" href="#ProgressStats">type ProgressStats struct</a>

```
searchKey: api.ProgressStats
tags: [exported]
```

```Go
type ProgressStats struct {
	MatchCount          int
	ElapsedMilliseconds int
	RepositoriesCount   *int
	ExcludedArchived    int
	ExcludedForks       int

	Timedout []Namer
	Missing  []Namer
	Cloning  []Namer

	LimitHit bool

	// SuggestedLimit is what to suggest to the user for count if needed.
	SuggestedLimit int

	Trace string // only filled if requested

	DisplayLimit int
}
```

### <a id="Progress" href="#Progress">type Progress struct</a>

```
searchKey: api.Progress
tags: [exported]
```

```Go
type Progress struct {
	// Done is true if this is a final progress event.
	Done bool `json:"done"`

	// RepositoriesCount is the number of repositories being searched. It is
	// non-nil once the set of repositories has been resolved.
	RepositoriesCount *int `json:"repositoriesCount,omitempty"`

	// MatchCount is number of non-overlapping matches. If skipped is
	// non-empty, then this is a lower bound.
	MatchCount int `json:"matchCount"`

	// DurationMs is the wall clock time in milliseconds for this search.
	DurationMs int `json:"durationMs"`

	// Skipped is a description of shards or documents that were skipped. This
	// has a deterministic ordering. More important reasons will be listed
	// first. If a search is repeated, the final skipped list will be the
	// same.  However, within a search stream when a new skipped reason is
	// found, it may appear anywhere in the list.
	Skipped []Skipped `json:"skipped"`

	// Trace is the URL of an associated trace if the query is logging one.
	Trace string `json:"trace,omitempty"`
}
```

Progress is an aggregate type representing a progress update. 

#### <a id="BuildProgressEvent" href="#BuildProgressEvent">func BuildProgressEvent(stats ProgressStats) Progress</a>

```
searchKey: api.BuildProgressEvent
tags: [exported]
```

```Go
func BuildProgressEvent(stats ProgressStats) Progress
```

BuildProgressEvent builds a progress event from a final results resolver. 

### <a id="Skipped" href="#Skipped">type Skipped struct</a>

```
searchKey: api.Skipped
tags: [exported]
```

```Go
type Skipped struct {
	// Reason is why a document/shard/repository was skipped. We group counts
	// by reason. eg ShardTimeout
	Reason SkippedReason `json:"reason"`
	// Title is a short message. eg "1,200 timed out".
	Title string `json:"title"`
	// Message is a message to show the user. Usually includes information
	// explaining the reason, count as well as a sample of the missing items.
	Message  string          `json:"message"`
	Severity SkippedSeverity `json:"severity"`
	// Suggested is a query expression to remedy the skip. eg "archived:yes".
	Suggested *SkippedSuggested `json:"suggested,omitempty"`
}
```

Skipped is a description of shards or documents that were skipped. 

#### <a id="skippedReposHandler" href="#skippedReposHandler">func skippedReposHandler(repos []Namer, titleVerb, messageReason string, base Skipped) (Skipped, bool)</a>

```
searchKey: api.skippedReposHandler
```

```Go
func skippedReposHandler(repos []Namer, titleVerb, messageReason string, base Skipped) (Skipped, bool)
```

#### <a id="repositoryCloningHandler" href="#repositoryCloningHandler">func repositoryCloningHandler(resultsResolver ProgressStats) (Skipped, bool)</a>

```
searchKey: api.repositoryCloningHandler
```

```Go
func repositoryCloningHandler(resultsResolver ProgressStats) (Skipped, bool)
```

#### <a id="repositoryMissingHandler" href="#repositoryMissingHandler">func repositoryMissingHandler(resultsResolver ProgressStats) (Skipped, bool)</a>

```
searchKey: api.repositoryMissingHandler
```

```Go
func repositoryMissingHandler(resultsResolver ProgressStats) (Skipped, bool)
```

#### <a id="shardTimeoutHandler" href="#shardTimeoutHandler">func shardTimeoutHandler(resultsResolver ProgressStats) (Skipped, bool)</a>

```
searchKey: api.shardTimeoutHandler
```

```Go
func shardTimeoutHandler(resultsResolver ProgressStats) (Skipped, bool)
```

#### <a id="displayLimitHandler" href="#displayLimitHandler">func displayLimitHandler(resultsResolver ProgressStats) (Skipped, bool)</a>

```
searchKey: api.displayLimitHandler
```

```Go
func displayLimitHandler(resultsResolver ProgressStats) (Skipped, bool)
```

#### <a id="shardMatchLimitHandler" href="#shardMatchLimitHandler">func shardMatchLimitHandler(resultsResolver ProgressStats) (Skipped, bool)</a>

```
searchKey: api.shardMatchLimitHandler
```

```Go
func shardMatchLimitHandler(resultsResolver ProgressStats) (Skipped, bool)
```

#### <a id="excludedForkHandler" href="#excludedForkHandler">func excludedForkHandler(resultsResolver ProgressStats) (Skipped, bool)</a>

```
searchKey: api.excludedForkHandler
```

```Go
func excludedForkHandler(resultsResolver ProgressStats) (Skipped, bool)
```

#### <a id="excludedArchiveHandler" href="#excludedArchiveHandler">func excludedArchiveHandler(resultsResolver ProgressStats) (Skipped, bool)</a>

```
searchKey: api.excludedArchiveHandler
```

```Go
func excludedArchiveHandler(resultsResolver ProgressStats) (Skipped, bool)
```

### <a id="SkippedSuggested" href="#SkippedSuggested">type SkippedSuggested struct</a>

```
searchKey: api.SkippedSuggested
tags: [exported]
```

```Go
type SkippedSuggested struct {
	Title           string `json:"title"`
	QueryExpression string `json:"queryExpression"`
}
```

SkippedSuggested is a query to suggest to the user to resolve the reason for skipping. 

### <a id="SkippedReason" href="#SkippedReason">type SkippedReason string</a>

```
searchKey: api.SkippedReason
tags: [exported]
```

```Go
type SkippedReason string
```

SkippedReason is an enum for Skipped.Reason. 

### <a id="SkippedSeverity" href="#SkippedSeverity">type SkippedSeverity string</a>

```
searchKey: api.SkippedSeverity
tags: [exported]
```

```Go
type SkippedSeverity string
```

SkippedSeverity is an enum for Skipped.Severity. 

### <a id="repo" href="#repo">type repo struct</a>

```
searchKey: api.repo
```

```Go
type repo struct {
	name string
}
```

#### <a id="repo.Name" href="#repo.Name">func (r repo) Name() string</a>

```
searchKey: api.repo.Name
```

```Go
func (r repo) Name() string
```

## <a id="func" href="#func">Functions</a>

### <a id="number" href="#number">func number(i int) string</a>

```
searchKey: api.number
```

```Go
func number(i int) string
```

### <a id="plural" href="#plural">func plural(one, many string, n int) string</a>

```
searchKey: api.plural
```

```Go
func plural(one, many string, n int) string
```

### <a id="TestSearchProgress" href="#TestSearchProgress">func TestSearchProgress(t *testing.T)</a>

```
searchKey: api.TestSearchProgress
```

```Go
func TestSearchProgress(t *testing.T)
```

### <a id="TestNumber" href="#TestNumber">func TestNumber(t *testing.T)</a>

```
searchKey: api.TestNumber
```

```Go
func TestNumber(t *testing.T)
```

### <a id="intPtr" href="#intPtr">func intPtr(i int) *int</a>

```
searchKey: api.intPtr
```

```Go
func intPtr(i int) *int
```

