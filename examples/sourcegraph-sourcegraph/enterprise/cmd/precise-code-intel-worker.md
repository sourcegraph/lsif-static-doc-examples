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

### <a id="addr" href="#addr">const addr</a>

```
searchKey: main.addr
tags: [private]
```

```Go
const addr = ":3188"
```

## <a id="type" href="#type">Types</a>

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: main.Config
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
```

```Go
func (c *Config) Load()
```

## <a id="func" href="#func">Functions</a>

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [private]
```

```Go
func main()
```

### <a id="mustInitializeDB" href="#mustInitializeDB">func mustInitializeDB() *sql.DB</a>

```
searchKey: main.mustInitializeDB
tags: [private]
```

```Go
func mustInitializeDB() *sql.DB
```

### <a id="mustInitializeCodeIntelDB" href="#mustInitializeCodeIntelDB">func mustInitializeCodeIntelDB() *sql.DB</a>

```
searchKey: main.mustInitializeCodeIntelDB
tags: [private]
```

```Go
func mustInitializeCodeIntelDB() *sql.DB
```

### <a id="mustRegisterQueueMetric" href="#mustRegisterQueueMetric">func mustRegisterQueueMetric(observationContext *observation.Context, workerStore dbworkerstore.Store)</a>

```
searchKey: main.mustRegisterQueueMetric
tags: [private]
```

```Go
func mustRegisterQueueMetric(observationContext *observation.Context, workerStore dbworkerstore.Store)
```

### <a id="makeWorkerMetrics" href="#makeWorkerMetrics">func makeWorkerMetrics(observationContext *observation.Context) workerutil.WorkerMetrics</a>

```
searchKey: main.makeWorkerMetrics
tags: [private]
```

```Go
func makeWorkerMetrics(observationContext *observation.Context) workerutil.WorkerMetrics
```

### <a id="initializeUploadStore" href="#initializeUploadStore">func initializeUploadStore(ctx context.Context, uploadStore uploadstore.Store) error</a>

```
searchKey: main.initializeUploadStore
tags: [private]
```

```Go
func initializeUploadStore(ctx context.Context, uploadStore uploadstore.Store) error
```

### <a id="isRequestError" href="#isRequestError">func isRequestError(err error) bool</a>

```
searchKey: main.isRequestError
tags: [private]
```

```Go
func isRequestError(err error) bool
```

