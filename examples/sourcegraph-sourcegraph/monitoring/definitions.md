# Package definitions

## Index

* Subpages
  * [monitoring/definitions/shared](definitions/shared.md)
* [Variables](#var)
    * [var workerJobs](#workerJobs)
* [Functions](#func)
    * [func ExecutorQueue() *monitoring.Container](#ExecutorQueue)
    * [func Frontend() *monitoring.Container](#Frontend)
    * [func GitServer() *monitoring.Container](#GitServer)
    * [func GitHubProxy() *monitoring.Container](#GitHubProxy)
    * [func Postgres() *monitoring.Container](#Postgres)
    * [func PreciseCodeIntelIndexer() *monitoring.Container](#PreciseCodeIntelIndexer)
    * [func PreciseCodeIntelWorker() *monitoring.Container](#PreciseCodeIntelWorker)
    * [func Prometheus() *monitoring.Container](#Prometheus)
    * [func QueryRunner() *monitoring.Container](#QueryRunner)
    * [func RepoUpdater() *monitoring.Container](#RepoUpdater)
    * [func Searcher() *monitoring.Container](#Searcher)
    * [func Symbols() *monitoring.Container](#Symbols)
    * [func SyntectServer() *monitoring.Container](#SyntectServer)
    * [func Worker() *monitoring.Container](#Worker)
    * [func createWorkerActiveJobRows() []monitoring.Row](#createWorkerActiveJobRows)
    * [func ZoektIndexServer() *monitoring.Container](#ZoektIndexServer)
    * [func ZoektWebServer() *monitoring.Container](#ZoektWebServer)


## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="workerJobs" href="#workerJobs">var workerJobs</a>

```
searchKey: definitions.workerJobs
```

```Go
var workerJobs = ...
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="ExecutorQueue" href="#ExecutorQueue">func ExecutorQueue() *monitoring.Container</a>

```
searchKey: definitions.ExecutorQueue
tags: [exported]
```

```Go
func ExecutorQueue() *monitoring.Container
```

### <a id="Frontend" href="#Frontend">func Frontend() *monitoring.Container</a>

```
searchKey: definitions.Frontend
tags: [exported]
```

```Go
func Frontend() *monitoring.Container
```

### <a id="GitServer" href="#GitServer">func GitServer() *monitoring.Container</a>

```
searchKey: definitions.GitServer
tags: [exported]
```

```Go
func GitServer() *monitoring.Container
```

### <a id="GitHubProxy" href="#GitHubProxy">func GitHubProxy() *monitoring.Container</a>

```
searchKey: definitions.GitHubProxy
tags: [exported]
```

```Go
func GitHubProxy() *monitoring.Container
```

### <a id="Postgres" href="#Postgres">func Postgres() *monitoring.Container</a>

```
searchKey: definitions.Postgres
tags: [exported]
```

```Go
func Postgres() *monitoring.Container
```

### <a id="PreciseCodeIntelIndexer" href="#PreciseCodeIntelIndexer">func PreciseCodeIntelIndexer() *monitoring.Container</a>

```
searchKey: definitions.PreciseCodeIntelIndexer
tags: [exported]
```

```Go
func PreciseCodeIntelIndexer() *monitoring.Container
```

### <a id="PreciseCodeIntelWorker" href="#PreciseCodeIntelWorker">func PreciseCodeIntelWorker() *monitoring.Container</a>

```
searchKey: definitions.PreciseCodeIntelWorker
tags: [exported]
```

```Go
func PreciseCodeIntelWorker() *monitoring.Container
```

### <a id="Prometheus" href="#Prometheus">func Prometheus() *monitoring.Container</a>

```
searchKey: definitions.Prometheus
tags: [exported]
```

```Go
func Prometheus() *monitoring.Container
```

### <a id="QueryRunner" href="#QueryRunner">func QueryRunner() *monitoring.Container</a>

```
searchKey: definitions.QueryRunner
tags: [exported]
```

```Go
func QueryRunner() *monitoring.Container
```

### <a id="RepoUpdater" href="#RepoUpdater">func RepoUpdater() *monitoring.Container</a>

```
searchKey: definitions.RepoUpdater
tags: [exported]
```

```Go
func RepoUpdater() *monitoring.Container
```

### <a id="Searcher" href="#Searcher">func Searcher() *monitoring.Container</a>

```
searchKey: definitions.Searcher
tags: [exported]
```

```Go
func Searcher() *monitoring.Container
```

### <a id="Symbols" href="#Symbols">func Symbols() *monitoring.Container</a>

```
searchKey: definitions.Symbols
tags: [exported]
```

```Go
func Symbols() *monitoring.Container
```

### <a id="SyntectServer" href="#SyntectServer">func SyntectServer() *monitoring.Container</a>

```
searchKey: definitions.SyntectServer
tags: [exported]
```

```Go
func SyntectServer() *monitoring.Container
```

### <a id="Worker" href="#Worker">func Worker() *monitoring.Container</a>

```
searchKey: definitions.Worker
tags: [exported]
```

```Go
func Worker() *monitoring.Container
```

### <a id="createWorkerActiveJobRows" href="#createWorkerActiveJobRows">func createWorkerActiveJobRows() []monitoring.Row</a>

```
searchKey: definitions.createWorkerActiveJobRows
```

```Go
func createWorkerActiveJobRows() []monitoring.Row
```

### <a id="ZoektIndexServer" href="#ZoektIndexServer">func ZoektIndexServer() *monitoring.Container</a>

```
searchKey: definitions.ZoektIndexServer
tags: [exported]
```

```Go
func ZoektIndexServer() *monitoring.Container
```

### <a id="ZoektWebServer" href="#ZoektWebServer">func ZoektWebServer() *monitoring.Container</a>

```
searchKey: definitions.ZoektWebServer
tags: [exported]
```

```Go
func ZoektWebServer() *monitoring.Container
```

