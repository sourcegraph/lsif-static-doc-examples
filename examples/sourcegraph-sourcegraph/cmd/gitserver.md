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

### <a id="reposDir" href="#reposDir">var reposDir</a>

```
searchKey: main.reposDir
tags: [private]
```

```Go
var reposDir = env.Get("SRC_REPOS_DIR", "/data/repos", "Root dir containing repos.")
```

### <a id="wantPctFree" href="#wantPctFree">var wantPctFree</a>

```
searchKey: main.wantPctFree
tags: [private]
```

```Go
var wantPctFree = ...
```

### <a id="janitorInterval" href="#janitorInterval">var janitorInterval</a>

```
searchKey: main.janitorInterval
tags: [private]
```

```Go
var janitorInterval = ...
```

### <a id="syncRepoStateInterval" href="#syncRepoStateInterval">var syncRepoStateInterval</a>

```
searchKey: main.syncRepoStateInterval
tags: [private]
```

```Go
var syncRepoStateInterval = ...
```

### <a id="syncRepoStateBatchSize" href="#syncRepoStateBatchSize">var syncRepoStateBatchSize</a>

```
searchKey: main.syncRepoStateBatchSize
tags: [private]
```

```Go
var syncRepoStateBatchSize = ...
```

### <a id="syncRepoStateUpsertPerSecond" href="#syncRepoStateUpsertPerSecond">var syncRepoStateUpsertPerSecond</a>

```
searchKey: main.syncRepoStateUpsertPerSecond
tags: [private]
```

```Go
var syncRepoStateUpsertPerSecond = ...
```

### <a id="envHostname" href="#envHostname">var envHostname</a>

```
searchKey: main.envHostname
tags: [private]
```

```Go
var envHostname = env.Get("HOSTNAME", "", "Hostname override")
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

### <a id="hostnameBestEffort" href="#hostnameBestEffort">func hostnameBestEffort() string</a>

```
searchKey: main.hostnameBestEffort
tags: [private]
```

```Go
func hostnameBestEffort() string
```

### <a id="getPercent" href="#getPercent">func getPercent(p int) (int, error)</a>

```
searchKey: main.getPercent
tags: [private]
```

```Go
func getPercent(p int) (int, error)
```

### <a id="getDB" href="#getDB">func getDB() (dbutil.DB, error)</a>

```
searchKey: main.getDB
tags: [private]
```

```Go
func getDB() (dbutil.DB, error)
```

getStores initializes a connection to the database and returns RepoStore and ExternalServiceStore. 

### <a id="TestParsePercent" href="#TestParsePercent">func TestParsePercent(t *testing.T)</a>

```
searchKey: main.TestParsePercent
tags: [private]
```

```Go
func TestParsePercent(t *testing.T)
```

