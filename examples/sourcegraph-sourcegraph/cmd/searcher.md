# Package main

Command searcher is a simple service which exposes an API to text search a repo at a specific commit. See the searcher package for more information. 

## Index

* Subpages
  * [cmd/searcher/protocol](searcher/protocol.md)
  * [cmd/searcher/search](searcher/search.md)
  * [cmd/searcher/search_test](searcher/search_test.md)
* [Constants](#const)
    * [const port](#port)
* [Variables](#var)
    * [var cacheDir](#cacheDir)
    * [var cacheSizeMB](#cacheSizeMB)
* [Functions](#func)
    * [func main()](#main)
    * [func shutdownOnSIGINT(s *http.Server)](#shutdownOnSIGINT)


## <a id="const" href="#const">Constants</a>

### <a id="port" href="#port">const port</a>

```
searchKey: main.port
tags: [constant string private]
```

```Go
const port = "3181"
```

## <a id="var" href="#var">Variables</a>

### <a id="cacheDir" href="#cacheDir">var cacheDir</a>

```
searchKey: main.cacheDir
tags: [variable string private]
```

```Go
var cacheDir = env.Get("CACHE_DIR", "/tmp", "directory to store cached archives.")
```

### <a id="cacheSizeMB" href="#cacheSizeMB">var cacheSizeMB</a>

```
searchKey: main.cacheSizeMB
tags: [variable string private]
```

```Go
var cacheSizeMB = ...
```

## <a id="func" href="#func">Functions</a>

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [function private]
```

```Go
func main()
```

### <a id="shutdownOnSIGINT" href="#shutdownOnSIGINT">func shutdownOnSIGINT(s *http.Server)</a>

```
searchKey: main.shutdownOnSIGINT
tags: [function private]
```

```Go
func shutdownOnSIGINT(s *http.Server)
```

