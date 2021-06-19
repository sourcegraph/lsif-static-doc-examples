# Package repotrackutil

## Index

* [Variables](#var)
    * [var trackedRepo](#trackedRepo)
    * [var trackedRepoRe](#trackedRepoRe)
* [Functions](#func)
    * [func GetTrackedRepo(repoPath api.RepoName) string](#GetTrackedRepo)
    * [func TestGetTrackedRepo(t *testing.T)](#TestGetTrackedRepo)


## <a id="var" href="#var">Variables</a>

### <a id="trackedRepo" href="#trackedRepo">var trackedRepo</a>

```
searchKey: repotrackutil.trackedRepo
```

```Go
var trackedRepo = ...
```

### <a id="trackedRepoRe" href="#trackedRepoRe">var trackedRepoRe</a>

```
searchKey: repotrackutil.trackedRepoRe
```

```Go
var trackedRepoRe = lazyregexp.New(`\b(` + strings.Join(trackedRepo, "|") + `)\b`)
```

## <a id="func" href="#func">Functions</a>

### <a id="GetTrackedRepo" href="#GetTrackedRepo">func GetTrackedRepo(repoPath api.RepoName) string</a>

```
searchKey: repotrackutil.GetTrackedRepo
tags: [exported]
```

```Go
func GetTrackedRepo(repoPath api.RepoName) string
```

GetTrackedRepo guesses which repo a request URL path is for. It only looks at a certain subset of repos for its guess. 

### <a id="TestGetTrackedRepo" href="#TestGetTrackedRepo">func TestGetTrackedRepo(t *testing.T)</a>

```
searchKey: repotrackutil.TestGetTrackedRepo
```

```Go
func TestGetTrackedRepo(t *testing.T)
```

