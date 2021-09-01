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
    * [func initializeUploadStore(ctx context.Context, uploadStore uploadstore.Store) error](#initializeUploadStore)
    * [func isRequestError(err error) bool](#isRequestError)
    * [func main()](#main)
    * [func makeWorkerMetrics(observationContext *observation.Context) workerutil.WorkerMetrics](#makeWorkerMetrics)
    * [func mustInitializeCodeIntelDB() *sql.DB](#mustInitializeCodeIntelDB)
    * [func mustInitializeDB() *sql.DB](#mustInitializeDB)
    * [func mustRegisterQueueMetric(observationContext *observation.Context, workerStore dbworkerstore.Store)](#mustRegisterQueueMetric)


## <a id="const" href="#const">Constants</a>

### <a id="addr" href="#addr">const addr</a>

```
searchKey: main.addr
tags: [constant string private]
```

```Go
const addr = ":3188"
```

## <a id="type" href="#type">Types</a>

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: main.Config
tags: [struct]
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
tags: [method]
```

```Go
func (c *Config) Load()
```

## <a id="func" href="#func">Functions</a>

### <a id="initializeUploadStore" href="#initializeUploadStore">func initializeUploadStore(ctx context.Context, uploadStore uploadstore.Store) error</a>

```
searchKey: main.initializeUploadStore
tags: [function private]
```

```Go
func initializeUploadStore(ctx context.Context, uploadStore uploadstore.Store) error
```

### <a id="isRequestError" href="#isRequestError">func isRequestError(err error) bool</a>

```
searchKey: main.isRequestError
tags: [function private]
```

```Go
func isRequestError(err error) bool
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [function private]
```

```Go
func main()
```

### <a id="makeWorkerMetrics" href="#makeWorkerMetrics">func makeWorkerMetrics(observationContext *observation.Context) workerutil.WorkerMetrics</a>

```
searchKey: main.makeWorkerMetrics
tags: [function private]
```

```Go
func makeWorkerMetrics(observationContext *observation.Context) workerutil.WorkerMetrics
```

### <a id="mustInitializeCodeIntelDB" href="#mustInitializeCodeIntelDB">func mustInitializeCodeIntelDB() *sql.DB</a>

```
searchKey: main.mustInitializeCodeIntelDB
tags: [function private]
```

```Go
func mustInitializeCodeIntelDB() *sql.DB
```

### <a id="mustInitializeDB" href="#mustInitializeDB">func mustInitializeDB() *sql.DB</a>

```
searchKey: main.mustInitializeDB
tags: [function private]
```

```Go
func mustInitializeDB() *sql.DB
```

### <a id="mustRegisterQueueMetric" href="#mustRegisterQueueMetric">func mustRegisterQueueMetric(observationContext *observation.Context, workerStore dbworkerstore.Store)</a>

```
searchKey: main.mustRegisterQueueMetric
tags: [function private]
```

```Go
func mustRegisterQueueMetric(observationContext *observation.Context, workerStore dbworkerstore.Store)
```

