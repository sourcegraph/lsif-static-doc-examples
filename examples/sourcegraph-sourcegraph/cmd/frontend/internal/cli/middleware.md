# Package middleware

Package middleware contains HTTP middlewares. 

## Index

* [Variables](#var)
    * [var goImportMetaTagTemplate](#goImportMetaTagTemplate)
    * [var httpTrace](#httpTrace)
* [Types](#type)
    * [type goImportMetaTag struct](#goImportMetaTag)
* [Functions](#func)
    * [func BlackHole(next http.Handler) http.Handler](#BlackHole)
    * [func isBlackhole(r *http.Request) bool](#isBlackhole)
    * [func SourcegraphComGoGetHandler(next http.Handler) http.Handler](#SourcegraphComGoGetHandler)
    * [func Trace(next http.Handler) http.Handler](#Trace)


## <a id="var" href="#var">Variables</a>

### <a id="goImportMetaTagTemplate" href="#goImportMetaTagTemplate">var goImportMetaTagTemplate</a>

```
searchKey: middleware.goImportMetaTagTemplate
```

```Go
var goImportMetaTagTemplate = ...
```

goImportMetaTagTemplate is an HTML template for rendering a blank page with a go-import meta tag. 

### <a id="httpTrace" href="#httpTrace">var httpTrace</a>

```
searchKey: middleware.httpTrace
```

```Go
var httpTrace, _ = ...
```

## <a id="type" href="#type">Types</a>

### <a id="goImportMetaTag" href="#goImportMetaTag">type goImportMetaTag struct</a>

```
searchKey: middleware.goImportMetaTag
```

```Go
type goImportMetaTag struct {
	// ImportPrefix is the import path corresponding to the repository root.
	// It must be a prefix or an exact match of the package being fetched with "go get".
	// If it's not an exact match, another http request is made at the prefix to verify
	// the <meta> tags match.
	ImportPrefix string

	// VCS is one of "git", "hg", "svn", etc.
	VCS string

	// RepoRoot is the root of the version control system containing a scheme and
	// not containing a .vcs qualifier.
	RepoRoot string
}
```

goImportMetaTag represents a go-import meta tag. 

## <a id="func" href="#func">Functions</a>

### <a id="BlackHole" href="#BlackHole">func BlackHole(next http.Handler) http.Handler</a>

```
searchKey: middleware.BlackHole
tags: [exported]
```

```Go
func BlackHole(next http.Handler) http.Handler
```

BlackHole is a middleware which returns StatusGone on removed URLs that external systems still regularly hit. 

🚨 SECURITY: This handler is served to all clients, even on private servers to clients who have not authenticated. It must not reveal any sensitive information. 

### <a id="isBlackhole" href="#isBlackhole">func isBlackhole(r *http.Request) bool</a>

```
searchKey: middleware.isBlackhole
```

```Go
func isBlackhole(r *http.Request) bool
```

### <a id="SourcegraphComGoGetHandler" href="#SourcegraphComGoGetHandler">func SourcegraphComGoGetHandler(next http.Handler) http.Handler</a>

```
searchKey: middleware.SourcegraphComGoGetHandler
tags: [exported]
```

```Go
func SourcegraphComGoGetHandler(next http.Handler) http.Handler
```

SourcegraphComGoGetHandler is middleware for serving go-import meta tags for requests with ?go-get=1 query on sourcegraph.com. 

It implements the following mapping: 

1. If the username (first path element) is "sourcegraph", consider it to be a vanity 

```
import path pointing to github.com/sourcegraph/<repo> as the clone URL.

```
2. All other requests are served with 404 Not Found. 

🚨 SECURITY: This handler is served to all clients, even on private servers to clients who have not authenticated. It must not reveal any sensitive information. 

### <a id="Trace" href="#Trace">func Trace(next http.Handler) http.Handler</a>

```
searchKey: middleware.Trace
tags: [exported]
```

```Go
func Trace(next http.Handler) http.Handler
```

Trace is an HTTP middleware that dumps the HTTP request body (to stderr) if the env var `HTTP_TRACE=1`. 

