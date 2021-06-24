# Package main

gitserver is the gitserver server. 

gitserver is the gitserver server. 

## Index

* Subpages
  * [cmd/gitserver/server](gitserver/server.md)
* [Variables](#var)
    * [var envHostname](#envHostname)
    * [var janitorInterval](#janitorInterval)
    * [var reposDir](#reposDir)
    * [var syncRepoStateBatchSize](#syncRepoStateBatchSize)
    * [var syncRepoStateInterval](#syncRepoStateInterval)
    * [var syncRepoStateUpsertPerSecond](#syncRepoStateUpsertPerSecond)
    * [var wantPctFree](#wantPctFree)
* [Functions](#func)
    * [func TestParsePercent(t *testing.T)](#TestParsePercent)
    * [func getDB() (dbutil.DB, error)](#getDB)
    * [func getPercent(p int) (int, error)](#getPercent)
    * [func hostnameBestEffort() string](#hostnameBestEffort)
    * [func main()](#main)


## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="envHostname" href="#envHostname">var envHostname</a>

```
searchKey: main.envHostname
tags: [variable string private]
```

```Go
var envHostname = env.Get("HOSTNAME", "", "Hostname override")
```

### <a id="janitorInterval" href="#janitorInterval">var janitorInterval</a>

```
searchKey: main.janitorInterval
tags: [variable number private]
```

```Go
var janitorInterval = ...
```

### <a id="reposDir" href="#reposDir">var reposDir</a>

```
searchKey: main.reposDir
tags: [variable string private]
```

```Go
var reposDir = env.Get("SRC_REPOS_DIR", "/data/repos", "Root dir containing repos.")
```

### <a id="syncRepoStateBatchSize" href="#syncRepoStateBatchSize">var syncRepoStateBatchSize</a>

```
searchKey: main.syncRepoStateBatchSize
tags: [variable number private]
```

```Go
var syncRepoStateBatchSize = ...
```

### <a id="syncRepoStateInterval" href="#syncRepoStateInterval">var syncRepoStateInterval</a>

```
searchKey: main.syncRepoStateInterval
tags: [variable number private]
```

```Go
var syncRepoStateInterval = ...
```

### <a id="syncRepoStateUpsertPerSecond" href="#syncRepoStateUpsertPerSecond">var syncRepoStateUpsertPerSecond</a>

```
searchKey: main.syncRepoStateUpsertPerSecond
tags: [variable number private]
```

```Go
var syncRepoStateUpsertPerSecond = ...
```

### <a id="wantPctFree" href="#wantPctFree">var wantPctFree</a>

```
searchKey: main.wantPctFree
tags: [variable number private]
```

```Go
var wantPctFree = ...
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="TestParsePercent" href="#TestParsePercent">func TestParsePercent(t *testing.T)</a>

```
searchKey: main.TestParsePercent
tags: [method private test]
```

```Go
func TestParsePercent(t *testing.T)
```

### <a id="getDB" href="#getDB">func getDB() (dbutil.DB, error)</a>

```
searchKey: main.getDB
tags: [function private]
```

```Go
func getDB() (dbutil.DB, error)
```

getStores initializes a connection to the database and returns RepoStore and ExternalServiceStore. 

### <a id="getPercent" href="#getPercent">func getPercent(p int) (int, error)</a>

```
searchKey: main.getPercent
tags: [method private]
```

```Go
func getPercent(p int) (int, error)
```

### <a id="hostnameBestEffort" href="#hostnameBestEffort">func hostnameBestEffort() string</a>

```
searchKey: main.hostnameBestEffort
tags: [function private]
```

```Go
func hostnameBestEffort() string
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [function private]
```

```Go
func main()
```

