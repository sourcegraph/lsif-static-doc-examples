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

### <a id="workerJobs" href="#workerJobs">var workerJobs</a>

```
searchKey: definitions.workerJobs
tags: [private]
```

```Go
var workerJobs = ...
```

## <a id="func" href="#func">Functions</a>

### <a id="ExecutorQueue" href="#ExecutorQueue">func ExecutorQueue() *monitoring.Container</a>

```
searchKey: definitions.ExecutorQueue
```

```Go
func ExecutorQueue() *monitoring.Container
```

### <a id="Frontend" href="#Frontend">func Frontend() *monitoring.Container</a>

```
searchKey: definitions.Frontend
```

```Go
func Frontend() *monitoring.Container
```

### <a id="GitServer" href="#GitServer">func GitServer() *monitoring.Container</a>

```
searchKey: definitions.GitServer
```

```Go
func GitServer() *monitoring.Container
```

### <a id="GitHubProxy" href="#GitHubProxy">func GitHubProxy() *monitoring.Container</a>

```
searchKey: definitions.GitHubProxy
```

```Go
func GitHubProxy() *monitoring.Container
```

### <a id="Postgres" href="#Postgres">func Postgres() *monitoring.Container</a>

```
searchKey: definitions.Postgres
```

```Go
func Postgres() *monitoring.Container
```

### <a id="PreciseCodeIntelIndexer" href="#PreciseCodeIntelIndexer">func PreciseCodeIntelIndexer() *monitoring.Container</a>

```
searchKey: definitions.PreciseCodeIntelIndexer
```

```Go
func PreciseCodeIntelIndexer() *monitoring.Container
```

### <a id="PreciseCodeIntelWorker" href="#PreciseCodeIntelWorker">func PreciseCodeIntelWorker() *monitoring.Container</a>

```
searchKey: definitions.PreciseCodeIntelWorker
```

```Go
func PreciseCodeIntelWorker() *monitoring.Container
```

### <a id="Prometheus" href="#Prometheus">func Prometheus() *monitoring.Container</a>

```
searchKey: definitions.Prometheus
```

```Go
func Prometheus() *monitoring.Container
```

### <a id="QueryRunner" href="#QueryRunner">func QueryRunner() *monitoring.Container</a>

```
searchKey: definitions.QueryRunner
```

```Go
func QueryRunner() *monitoring.Container
```

### <a id="RepoUpdater" href="#RepoUpdater">func RepoUpdater() *monitoring.Container</a>

```
searchKey: definitions.RepoUpdater
```

```Go
func RepoUpdater() *monitoring.Container
```

### <a id="Searcher" href="#Searcher">func Searcher() *monitoring.Container</a>

```
searchKey: definitions.Searcher
```

```Go
func Searcher() *monitoring.Container
```

### <a id="Symbols" href="#Symbols">func Symbols() *monitoring.Container</a>

```
searchKey: definitions.Symbols
```

```Go
func Symbols() *monitoring.Container
```

### <a id="SyntectServer" href="#SyntectServer">func SyntectServer() *monitoring.Container</a>

```
searchKey: definitions.SyntectServer
```

```Go
func SyntectServer() *monitoring.Container
```

### <a id="Worker" href="#Worker">func Worker() *monitoring.Container</a>

```
searchKey: definitions.Worker
```

```Go
func Worker() *monitoring.Container
```

### <a id="createWorkerActiveJobRows" href="#createWorkerActiveJobRows">func createWorkerActiveJobRows() []monitoring.Row</a>

```
searchKey: definitions.createWorkerActiveJobRows
tags: [private]
```

```Go
func createWorkerActiveJobRows() []monitoring.Row
```

### <a id="ZoektIndexServer" href="#ZoektIndexServer">func ZoektIndexServer() *monitoring.Container</a>

```
searchKey: definitions.ZoektIndexServer
```

```Go
func ZoektIndexServer() *monitoring.Container
```

### <a id="ZoektWebServer" href="#ZoektWebServer">func ZoektWebServer() *monitoring.Container</a>

```
searchKey: definitions.ZoektWebServer
```

```Go
func ZoektWebServer() *monitoring.Container
```

