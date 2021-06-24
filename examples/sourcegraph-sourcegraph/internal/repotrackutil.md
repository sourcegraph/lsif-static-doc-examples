# Package repotrackutil

## Index

* [Variables](#var)
    * [var trackedRepo](#trackedRepo)
    * [var trackedRepoRe](#trackedRepoRe)
* [Functions](#func)
    * [func GetTrackedRepo(repoPath api.RepoName) string](#GetTrackedRepo)
    * [func TestGetTrackedRepo(t *testing.T)](#TestGetTrackedRepo)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="trackedRepo" href="#trackedRepo">var trackedRepo</a>

```
searchKey: repotrackutil.trackedRepo
tags: [variable array string private]
```

```Go
var trackedRepo = ...
```

### <a id="trackedRepoRe" href="#trackedRepoRe">var trackedRepoRe</a>

```
searchKey: repotrackutil.trackedRepoRe
tags: [variable struct private]
```

```Go
var trackedRepoRe = lazyregexp.New(`\b(` + strings.Join(trackedRepo, "|") + `)\b`)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="GetTrackedRepo" href="#GetTrackedRepo">func GetTrackedRepo(repoPath api.RepoName) string</a>

```
searchKey: repotrackutil.GetTrackedRepo
tags: [method]
```

```Go
func GetTrackedRepo(repoPath api.RepoName) string
```

GetTrackedRepo guesses which repo a request URL path is for. It only looks at a certain subset of repos for its guess. 

### <a id="TestGetTrackedRepo" href="#TestGetTrackedRepo">func TestGetTrackedRepo(t *testing.T)</a>

```
searchKey: repotrackutil.TestGetTrackedRepo
tags: [method private test]
```

```Go
func TestGetTrackedRepo(t *testing.T)
```

