# Package assetsutil

Package assetsutil is a utils package for static files. 

## Index

* [Variables](#var)
    * [var assetsRoot](#assetsRoot)
    * [var baseURL](#baseURL)
* [Functions](#func)
    * [func Mount(mux *http.ServeMux)](#Mount)
    * [func URL(p string) *url.URL](#URL)
    * [func init()](#init.handler.go)
    * [func isPhabricatorAsset(path string) bool](#isPhabricatorAsset)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="assetsRoot" href="#assetsRoot">var assetsRoot</a>

```
searchKey: assetsutil.assetsRoot
tags: [variable string private]
```

```Go
var assetsRoot = env.Get("ASSETS_ROOT", "/.assets", "URL to web assets")
```

### <a id="baseURL" href="#baseURL">var baseURL</a>

```
searchKey: assetsutil.baseURL
tags: [variable struct private]
```

```Go
var baseURL = &url.URL{}
```

baseURL is the path prefix under which static assets should be served. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Mount" href="#Mount">func Mount(mux *http.ServeMux)</a>

```
searchKey: assetsutil.Mount
tags: [method]
```

```Go
func Mount(mux *http.ServeMux)
```

Mount mounts the static asset handler. 

### <a id="URL" href="#URL">func URL(p string) *url.URL</a>

```
searchKey: assetsutil.URL
tags: [method]
```

```Go
func URL(p string) *url.URL
```

URL returns a URL, possibly relative, to the asset at path p. 

### <a id="init.handler.go" href="#init.handler.go">func init()</a>

```
searchKey: assetsutil.init
tags: [function private]
```

```Go
func init()
```

### <a id="isPhabricatorAsset" href="#isPhabricatorAsset">func isPhabricatorAsset(path string) bool</a>

```
searchKey: assetsutil.isPhabricatorAsset
tags: [method private]
```

```Go
func isPhabricatorAsset(path string) bool
```

