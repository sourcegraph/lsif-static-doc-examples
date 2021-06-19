# Package main

gitserver is the gitserver server. 

gitserver is the gitserver server. 

## Index

* Subpages
  * [cmd/gitserver/server](gitserver/server.md)
* [Variables](#var)
    * [var reposDir](#reposDir)
    * [var wantPctFree](#wantPctFree)
    * [var janitorInterval](#janitorInterval)
    * [var syncRepoStateInterval](#syncRepoStateInterval)
    * [var syncRepoStateBatchSize](#syncRepoStateBatchSize)
    * [var syncRepoStateUpsertPerSecond](#syncRepoStateUpsertPerSecond)
    * [var envHostname](#envHostname)
* [Functions](#func)
    * [func main()](#main)
    * [func hostnameBestEffort() string](#hostnameBestEffort)
    * [func getPercent(p int) (int, error)](#getPercent)
    * [func getDB() (dbutil.DB, error)](#getDB)
    * [func TestParsePercent(t *testing.T)](#TestParsePercent)


## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="reposDir" href="#reposDir">var reposDir</a>

```
searchKey: main.reposDir
```

```Go
var reposDir = env.Get("SRC_REPOS_DIR", "/data/repos", "Root dir containing repos.")
```

### <a id="wantPctFree" href="#wantPctFree">var wantPctFree</a>

```
searchKey: main.wantPctFree
```

```Go
var wantPctFree = ...
```

### <a id="janitorInterval" href="#janitorInterval">var janitorInterval</a>

```
searchKey: main.janitorInterval
```

```Go
var janitorInterval = ...
```

### <a id="syncRepoStateInterval" href="#syncRepoStateInterval">var syncRepoStateInterval</a>

```
searchKey: main.syncRepoStateInterval
```

```Go
var syncRepoStateInterval = ...
```

### <a id="syncRepoStateBatchSize" href="#syncRepoStateBatchSize">var syncRepoStateBatchSize</a>

```
searchKey: main.syncRepoStateBatchSize
```

```Go
var syncRepoStateBatchSize = ...
```

### <a id="syncRepoStateUpsertPerSecond" href="#syncRepoStateUpsertPerSecond">var syncRepoStateUpsertPerSecond</a>

```
searchKey: main.syncRepoStateUpsertPerSecond
```

```Go
var syncRepoStateUpsertPerSecond = ...
```

### <a id="envHostname" href="#envHostname">var envHostname</a>

```
searchKey: main.envHostname
```

```Go
var envHostname = env.Get("HOSTNAME", "", "Hostname override")
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

### <a id="hostnameBestEffort" href="#hostnameBestEffort">func hostnameBestEffort() string</a>

```
searchKey: main.hostnameBestEffort
```

```Go
func hostnameBestEffort() string
```

### <a id="getPercent" href="#getPercent">func getPercent(p int) (int, error)</a>

```
searchKey: main.getPercent
```

```Go
func getPercent(p int) (int, error)
```

### <a id="getDB" href="#getDB">func getDB() (dbutil.DB, error)</a>

```
searchKey: main.getDB
```

```Go
func getDB() (dbutil.DB, error)
```

getStores initializes a connection to the database and returns RepoStore and ExternalServiceStore. 

### <a id="TestParsePercent" href="#TestParsePercent">func TestParsePercent(t *testing.T)</a>

```
searchKey: main.TestParsePercent
```

```Go
func TestParsePercent(t *testing.T)
```

