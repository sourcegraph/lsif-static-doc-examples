# Package main

## Index

* Subpages
  * [enterprise/cmd/precise-code-intel-worker/internal](precise-code-intel-worker/internal.md)
* [Constants](#const)
    * [const addr](#addr)
* [Types](#type)
    * [type Config struct](#Config)
        * [func (c *Config) Load()](#Config.Load)
* [Functions](#func)
    * [func main()](#main)
    * [func mustInitializeDB() *sql.DB](#mustInitializeDB)
    * [func mustInitializeCodeIntelDB() *sql.DB](#mustInitializeCodeIntelDB)
    * [func mustRegisterQueueMetric(observationContext *observation.Context, workerStore dbworkerstore.Store)](#mustRegisterQueueMetric)
    * [func makeWorkerMetrics(observationContext *observation.Context) workerutil.WorkerMetrics](#makeWorkerMetrics)
    * [func initializeUploadStore(ctx context.Context, uploadStore uploadstore.Store) error](#initializeUploadStore)
    * [func isRequestError(err error) bool](#isRequestError)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="addr" href="#addr">const addr</a>

```
searchKey: main.addr
```

```Go
const addr = ":3188"
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: main.Config
tags: [exported]
```

```Go
type Config struct {
	env.BaseConfig

	UploadStoreConfig  *uploadstore.Config
	WorkerPollInterval time.Duration
	WorkerConcurrency  int
	WorkerBudget       int64
}
```

#### <a id="Config.Load" href="#Config.Load">func (c *Config) Load()</a>

```
searchKey: main.Config.Load
tags: [exported]
```

```Go
func (c *Config) Load()
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
```

```Go
func main()
```

### <a id="mustInitializeDB" href="#mustInitializeDB">func mustInitializeDB() *sql.DB</a>

```
searchKey: main.mustInitializeDB
```

```Go
func mustInitializeDB() *sql.DB
```

### <a id="mustInitializeCodeIntelDB" href="#mustInitializeCodeIntelDB">func mustInitializeCodeIntelDB() *sql.DB</a>

```
searchKey: main.mustInitializeCodeIntelDB
```

```Go
func mustInitializeCodeIntelDB() *sql.DB
```

### <a id="mustRegisterQueueMetric" href="#mustRegisterQueueMetric">func mustRegisterQueueMetric(observationContext *observation.Context, workerStore dbworkerstore.Store)</a>

```
searchKey: main.mustRegisterQueueMetric
```

```Go
func mustRegisterQueueMetric(observationContext *observation.Context, workerStore dbworkerstore.Store)
```

### <a id="makeWorkerMetrics" href="#makeWorkerMetrics">func makeWorkerMetrics(observationContext *observation.Context) workerutil.WorkerMetrics</a>

```
searchKey: main.makeWorkerMetrics
```

```Go
func makeWorkerMetrics(observationContext *observation.Context) workerutil.WorkerMetrics
```

### <a id="initializeUploadStore" href="#initializeUploadStore">func initializeUploadStore(ctx context.Context, uploadStore uploadstore.Store) error</a>

```
searchKey: main.initializeUploadStore
```

```Go
func initializeUploadStore(ctx context.Context, uploadStore uploadstore.Store) error
```

### <a id="isRequestError" href="#isRequestError">func isRequestError(err error) bool</a>

```
searchKey: main.isRequestError
```

```Go
func isRequestError(err error) bool
```

