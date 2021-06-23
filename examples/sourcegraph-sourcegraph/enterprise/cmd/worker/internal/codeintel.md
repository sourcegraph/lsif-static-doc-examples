# Package codeintel

## Index

* Subpages
  * [enterprise/cmd/worker/internal/codeintel/commitgraph](codeintel/commitgraph.md)
  * [enterprise/cmd/worker/internal/codeintel/indexing](codeintel/indexing.md)
  * [enterprise/cmd/worker/internal/codeintel/janitor](codeintel/janitor.md)
* [Variables](#var)
    * [var initCodeIntelDatabaseMemo](#initCodeIntelDatabaseMemo)
    * [var commitGraphConfigInst](#commitGraphConfigInst)
    * [var initDBStore](#initDBStore)
    * [var initGitserverClient](#initGitserverClient)
    * [var indexingConfigInst](#indexingConfigInst)
    * [var janitorConfigInst](#janitorConfigInst)
    * [var initLSFIStore](#initLSFIStore)
* [Types](#type)
    * [type commitGraphConfig struct](#commitGraphConfig)
        * [func (c *commitGraphConfig) Load()](#commitGraphConfig.Load)
    * [type commitGraphJob struct{}](#commitGraphJob)
        * [func (j *commitGraphJob) Config() []env.Config](#commitGraphJob.Config)
        * [func (j *commitGraphJob) Routines(ctx context.Context) ([]goroutine.BackgroundRoutine, error)](#commitGraphJob.Routines)
    * [type indexingConfig struct](#indexingConfig)
        * [func (c *indexingConfig) Load()](#indexingConfig.Load)
    * [type indexingJob struct{}](#indexingJob)
        * [func (j *indexingJob) Config() []env.Config](#indexingJob.Config)
        * [func (j *indexingJob) Routines(ctx context.Context) ([]goroutine.BackgroundRoutine, error)](#indexingJob.Routines)
    * [type janitorConfig struct](#janitorConfig)
        * [func (c *janitorConfig) Load()](#janitorConfig.Load)
    * [type janitorJob struct{}](#janitorJob)
        * [func (j *janitorJob) Config() []env.Config](#janitorJob.Config)
        * [func (j *janitorJob) Routines(ctx context.Context) ([]goroutine.BackgroundRoutine, error)](#janitorJob.Routines)
* [Functions](#func)
    * [func InitCodeIntelDatabase() (*sql.DB, error)](#InitCodeIntelDatabase)
    * [func NewCommitGraphJob() shared.Job](#NewCommitGraphJob)
    * [func InitDBStore() (*dbstore.Store, error)](#InitDBStore)
    * [func InitGitserverClient() (*gitserver.Client, error)](#InitGitserverClient)
    * [func NewIndexingJob() shared.Job](#NewIndexingJob)
    * [func NewJanitorJob() shared.Job](#NewJanitorJob)
    * [func InitLSIFStore() (*lsifstore.Store, error)](#InitLSIFStore)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="initCodeIntelDatabaseMemo" href="#initCodeIntelDatabaseMemo">var initCodeIntelDatabaseMemo</a>

```
searchKey: codeintel.initCodeIntelDatabaseMemo
tags: [private]
```

```Go
var initCodeIntelDatabaseMemo = ...
```

### <a id="commitGraphConfigInst" href="#commitGraphConfigInst">var commitGraphConfigInst</a>

```
searchKey: codeintel.commitGraphConfigInst
tags: [private]
```

```Go
var commitGraphConfigInst = &commitGraphConfig{}
```

### <a id="initDBStore" href="#initDBStore">var initDBStore</a>

```
searchKey: codeintel.initDBStore
tags: [private]
```

```Go
var initDBStore = ...
```

### <a id="initGitserverClient" href="#initGitserverClient">var initGitserverClient</a>

```
searchKey: codeintel.initGitserverClient
tags: [private]
```

```Go
var initGitserverClient = ...
```

### <a id="indexingConfigInst" href="#indexingConfigInst">var indexingConfigInst</a>

```
searchKey: codeintel.indexingConfigInst
tags: [private]
```

```Go
var indexingConfigInst = &indexingConfig{}
```

### <a id="janitorConfigInst" href="#janitorConfigInst">var janitorConfigInst</a>

```
searchKey: codeintel.janitorConfigInst
tags: [private]
```

```Go
var janitorConfigInst = &janitorConfig{}
```

### <a id="initLSFIStore" href="#initLSFIStore">var initLSFIStore</a>

```
searchKey: codeintel.initLSFIStore
tags: [private]
```

```Go
var initLSFIStore = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="commitGraphConfig" href="#commitGraphConfig">type commitGraphConfig struct</a>

```
searchKey: codeintel.commitGraphConfig
tags: [private]
```

```Go
type commitGraphConfig struct {
	env.BaseConfig

	CommitGraphUpdateTaskInterval time.Duration
}
```

#### <a id="commitGraphConfig.Load" href="#commitGraphConfig.Load">func (c *commitGraphConfig) Load()</a>

```
searchKey: codeintel.commitGraphConfig.Load
tags: [private]
```

```Go
func (c *commitGraphConfig) Load()
```

### <a id="commitGraphJob" href="#commitGraphJob">type commitGraphJob struct{}</a>

```
searchKey: codeintel.commitGraphJob
tags: [private]
```

```Go
type commitGraphJob struct{}
```

#### <a id="commitGraphJob.Config" href="#commitGraphJob.Config">func (j *commitGraphJob) Config() []env.Config</a>

```
searchKey: codeintel.commitGraphJob.Config
tags: [private]
```

```Go
func (j *commitGraphJob) Config() []env.Config
```

#### <a id="commitGraphJob.Routines" href="#commitGraphJob.Routines">func (j *commitGraphJob) Routines(ctx context.Context) ([]goroutine.BackgroundRoutine, error)</a>

```
searchKey: codeintel.commitGraphJob.Routines
tags: [private]
```

```Go
func (j *commitGraphJob) Routines(ctx context.Context) ([]goroutine.BackgroundRoutine, error)
```

### <a id="indexingConfig" href="#indexingConfig">type indexingConfig struct</a>

```
searchKey: codeintel.indexingConfig
tags: [private]
```

```Go
type indexingConfig struct {
	env.BaseConfig

	AutoIndexingTaskInterval               time.Duration
	DependencyIndexerSchedulerPollInterval time.Duration
	DependencyIndexerSchedulerConcurrency  int
}
```

#### <a id="indexingConfig.Load" href="#indexingConfig.Load">func (c *indexingConfig) Load()</a>

```
searchKey: codeintel.indexingConfig.Load
tags: [private]
```

```Go
func (c *indexingConfig) Load()
```

### <a id="indexingJob" href="#indexingJob">type indexingJob struct{}</a>

```
searchKey: codeintel.indexingJob
tags: [private]
```

```Go
type indexingJob struct{}
```

#### <a id="indexingJob.Config" href="#indexingJob.Config">func (j *indexingJob) Config() []env.Config</a>

```
searchKey: codeintel.indexingJob.Config
tags: [private]
```

```Go
func (j *indexingJob) Config() []env.Config
```

#### <a id="indexingJob.Routines" href="#indexingJob.Routines">func (j *indexingJob) Routines(ctx context.Context) ([]goroutine.BackgroundRoutine, error)</a>

```
searchKey: codeintel.indexingJob.Routines
tags: [private]
```

```Go
func (j *indexingJob) Routines(ctx context.Context) ([]goroutine.BackgroundRoutine, error)
```

### <a id="janitorConfig" href="#janitorConfig">type janitorConfig struct</a>

```
searchKey: codeintel.janitorConfig
tags: [private]
```

```Go
type janitorConfig struct {
	env.BaseConfig

	DataTTL                                 time.Duration
	UploadTimeout                           time.Duration
	CleanupTaskInterval                     time.Duration
	CommitResolverTaskInterval              time.Duration
	CommitResolverMinimumTimeSinceLastCheck time.Duration
	CommitResolverBatchSize                 int
}
```

#### <a id="janitorConfig.Load" href="#janitorConfig.Load">func (c *janitorConfig) Load()</a>

```
searchKey: codeintel.janitorConfig.Load
tags: [private]
```

```Go
func (c *janitorConfig) Load()
```

### <a id="janitorJob" href="#janitorJob">type janitorJob struct{}</a>

```
searchKey: codeintel.janitorJob
tags: [private]
```

```Go
type janitorJob struct{}
```

#### <a id="janitorJob.Config" href="#janitorJob.Config">func (j *janitorJob) Config() []env.Config</a>

```
searchKey: codeintel.janitorJob.Config
tags: [private]
```

```Go
func (j *janitorJob) Config() []env.Config
```

#### <a id="janitorJob.Routines" href="#janitorJob.Routines">func (j *janitorJob) Routines(ctx context.Context) ([]goroutine.BackgroundRoutine, error)</a>

```
searchKey: codeintel.janitorJob.Routines
tags: [private]
```

```Go
func (j *janitorJob) Routines(ctx context.Context) ([]goroutine.BackgroundRoutine, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="InitCodeIntelDatabase" href="#InitCodeIntelDatabase">func InitCodeIntelDatabase() (*sql.DB, error)</a>

```
searchKey: codeintel.InitCodeIntelDatabase
```

```Go
func InitCodeIntelDatabase() (*sql.DB, error)
```

InitCodeIntelDatabase initializes and returns a connection to the codeintel db. 

### <a id="NewCommitGraphJob" href="#NewCommitGraphJob">func NewCommitGraphJob() shared.Job</a>

```
searchKey: codeintel.NewCommitGraphJob
```

```Go
func NewCommitGraphJob() shared.Job
```

### <a id="InitDBStore" href="#InitDBStore">func InitDBStore() (*dbstore.Store, error)</a>

```
searchKey: codeintel.InitDBStore
```

```Go
func InitDBStore() (*dbstore.Store, error)
```

InitDBStore initializes and returns a db store instance. 

### <a id="InitGitserverClient" href="#InitGitserverClient">func InitGitserverClient() (*gitserver.Client, error)</a>

```
searchKey: codeintel.InitGitserverClient
```

```Go
func InitGitserverClient() (*gitserver.Client, error)
```

InitGitserverClient initializes and returns a gitserver client. 

### <a id="NewIndexingJob" href="#NewIndexingJob">func NewIndexingJob() shared.Job</a>

```
searchKey: codeintel.NewIndexingJob
```

```Go
func NewIndexingJob() shared.Job
```

### <a id="NewJanitorJob" href="#NewJanitorJob">func NewJanitorJob() shared.Job</a>

```
searchKey: codeintel.NewJanitorJob
```

```Go
func NewJanitorJob() shared.Job
```

### <a id="InitLSIFStore" href="#InitLSIFStore">func InitLSIFStore() (*lsifstore.Store, error)</a>

```
searchKey: codeintel.InitLSIFStore
```

```Go
func InitLSIFStore() (*lsifstore.Store, error)
```

InitLSIFStore initializes and returns an LSIF store instance. 

