# Package assetsutil

Package assetsutil is a utils package for static files. 

## Index

* [Variables](#var)
    * [var assetsRoot](#assetsRoot)
    * [var baseURL](#baseURL)
* [Functions](#func)
    * [func Mount(mux *http.ServeMux)](#Mount)
    * [func init()](#init)
    * [func isPhabricatorAsset(path string) bool](#isPhabricatorAsset)
    * [func URL(p string) *url.URL](#URL)


## <a id="var" href="#var">Variables</a>

### <a id="assetsRoot" href="#assetsRoot">var assetsRoot</a>

```
searchKey: assetsutil.assetsRoot
```

```Go
var assetsRoot = env.Get("ASSETS_ROOT", "/.assets", "URL to web assets")
```

### <a id="baseURL" href="#baseURL">var baseURL</a>

```
searchKey: assetsutil.baseURL
```

```Go
var baseURL = &url.URL{}
```

baseURL is the path prefix under which static assets should be served. 

## <a id="func" href="#func">Functions</a>

### <a id="Mount" href="#Mount">func Mount(mux *http.ServeMux)</a>

```
searchKey: assetsutil.Mount
tags: [exported]
```

```Go
func Mount(mux *http.ServeMux)
```

Mount mounts the static asset handler. 

### <a id="init" href="#init">func init()</a>

```
searchKey: assetsutil.init
```

```Go
func init()
```

### <a id="isPhabricatorAsset" href="#isPhabricatorAsset">func isPhabricatorAsset(path string) bool</a>

```
searchKey: assetsutil.isPhabricatorAsset
```

```Go
func isPhabricatorAsset(path string) bool
```

### <a id="URL" href="#URL">func URL(p string) *url.URL</a>

```
searchKey: assetsutil.URL
tags: [exported]
```

```Go
func URL(p string) *url.URL
```

URL returns a URL, possibly relative, to the asset at path p. 

