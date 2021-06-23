# Package codeintel

## Index

* [Constants](#const)
    * [const StalledJobMaximumAge](#StalledJobMaximumAge)
    * [const MaximumNumResets](#MaximumNumResets)
    * [const defaultOutfile](#defaultOutfile)
    * [const uploadRoute](#uploadRoute)
* [Types](#type)
    * [type Config struct](#Config)
        * [func (c *Config) Load()](#Config.Load)
* [Functions](#func)
    * [func QueueOptions(db dbutil.DB, config *Config, observationContext *observation.Context) apiserver.QueueOptions](#QueueOptions)
    * [func newWorkerStore(db dbutil.DB, observationContext *observation.Context) dbworkerstore.Store](#newWorkerStore)
    * [func transformRecord(index store.Index, config *Config) (apiclient.Job, error)](#transformRecord)
    * [func makeURL(base, username, password string) (string, error)](#makeURL)
    * [func TestTransformRecord(t *testing.T)](#TestTransformRecord)
    * [func TestTransformRecordWithoutIndexer(t *testing.T)](#TestTransformRecordWithoutIndexer)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="StalledJobMaximumAge" href="#StalledJobMaximumAge">const StalledJobMaximumAge</a>

```
searchKey: codeintel.StalledJobMaximumAge
```

```Go
const StalledJobMaximumAge = time.Second * 5
```

StalledJobMaximumAge is the maximum allowable duration between updating the state of a job as "processing" and locking the record during processing. An unlocked row that is marked as processing likely indicates that the executor that dequeued the job has died. There should be a nearly-zero delay between these states during normal operation. 

### <a id="MaximumNumResets" href="#MaximumNumResets">const MaximumNumResets</a>

```
searchKey: codeintel.MaximumNumResets
```

```Go
const MaximumNumResets = 3
```

MaximumNumResets is the maximum number of times a job can be reset. If a job's failed attempts counter reaches this threshold, it will be moved into "errored" rather than "queued" on its next reset. 

### <a id="defaultOutfile" href="#defaultOutfile">const defaultOutfile</a>

```
searchKey: codeintel.defaultOutfile
tags: [private]
```

```Go
const defaultOutfile = "dump.lsif"
```

### <a id="uploadRoute" href="#uploadRoute">const uploadRoute</a>

```
searchKey: codeintel.uploadRoute
tags: [private]
```

```Go
const uploadRoute = "/.executors/lsif/upload"
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: codeintel.Config
```

```Go
type Config struct {
	env.BaseConfig

	FrontendURL      string
	FrontendUsername string
	FrontendPassword string
}
```

#### <a id="Config.Load" href="#Config.Load">func (c *Config) Load()</a>

```
searchKey: codeintel.Config.Load
```

```Go
func (c *Config) Load()
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="QueueOptions" href="#QueueOptions">func QueueOptions(db dbutil.DB, config *Config, observationContext *observation.Context) apiserver.QueueOptions</a>

```
searchKey: codeintel.QueueOptions
```

```Go
func QueueOptions(db dbutil.DB, config *Config, observationContext *observation.Context) apiserver.QueueOptions
```

### <a id="newWorkerStore" href="#newWorkerStore">func newWorkerStore(db dbutil.DB, observationContext *observation.Context) dbworkerstore.Store</a>

```
searchKey: codeintel.newWorkerStore
tags: [private]
```

```Go
func newWorkerStore(db dbutil.DB, observationContext *observation.Context) dbworkerstore.Store
```

newWorkerStore creates a dbworker store that wraps the lsif_indexes table. 

### <a id="transformRecord" href="#transformRecord">func transformRecord(index store.Index, config *Config) (apiclient.Job, error)</a>

```
searchKey: codeintel.transformRecord
tags: [private]
```

```Go
func transformRecord(index store.Index, config *Config) (apiclient.Job, error)
```

### <a id="makeURL" href="#makeURL">func makeURL(base, username, password string) (string, error)</a>

```
searchKey: codeintel.makeURL
tags: [private]
```

```Go
func makeURL(base, username, password string) (string, error)
```

### <a id="TestTransformRecord" href="#TestTransformRecord">func TestTransformRecord(t *testing.T)</a>

```
searchKey: codeintel.TestTransformRecord
tags: [private]
```

```Go
func TestTransformRecord(t *testing.T)
```

### <a id="TestTransformRecordWithoutIndexer" href="#TestTransformRecordWithoutIndexer">func TestTransformRecordWithoutIndexer(t *testing.T)</a>

```
searchKey: codeintel.TestTransformRecordWithoutIndexer
tags: [private]
```

```Go
func TestTransformRecordWithoutIndexer(t *testing.T)
```

