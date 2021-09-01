# Package handlerutil

Package handlerutil contains common helper functions used by both the app and API HTTP handlers. 

## Index

* [Variables](#var)
    * [var ravenClient](#ravenClient)
* [Types](#type)
    * [type HandlerWithErrorReturn struct](#HandlerWithErrorReturn)
        * [func (h HandlerWithErrorReturn) ServeHTTP(w http.ResponseWriter, r *http.Request)](#HandlerWithErrorReturn.ServeHTTP)
    * [type URLMovedError struct](#URLMovedError)
        * [func (e *URLMovedError) Error() string](#URLMovedError.Error)
* [Functions](#func)
    * [func CSRFMiddleware(next http.Handler, isSecure func() bool) http.Handler](#CSRFMiddleware)
    * [func GetRepo(ctx context.Context, vars map[string]string) (*types.Repo, error)](#GetRepo)
    * [func GetRepoAndRev(ctx context.Context, vars map[string]string) (*types.Repo, api.CommitID, error)](#GetRepoAndRev)
    * [func RedirectToNewRepoName(w http.ResponseWriter, r *http.Request, newRepoName api.RepoName) error](#RedirectToNewRepoName)
    * [func TestGetRepo(t *testing.T)](#TestGetRepo)
    * [func collapseMultipleErrors(err error) error](#collapseMultipleErrors)
    * [func getRepoRev(ctx context.Context, vars map[string]string, repoID api.RepoID) (api.RepoID, api.CommitID, error)](#getRepoRev)
    * [func httpErrCode(r *http.Request, err error) int](#httpErrCode)
    * [func init()](#init.error_reporting.go)
    * [func reportError(r *http.Request, status int, err error, panicked bool)](#reportError)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ravenClient" href="#ravenClient">var ravenClient</a>

```
searchKey: handlerutil.ravenClient
tags: [variable struct private]
```

```Go
var ravenClient *raven.Client
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="HandlerWithErrorReturn" href="#HandlerWithErrorReturn">type HandlerWithErrorReturn struct</a>

```
searchKey: handlerutil.HandlerWithErrorReturn
tags: [struct]
```

```Go
type HandlerWithErrorReturn struct {
	Handler func(http.ResponseWriter, *http.Request) error       // the underlying handler
	Error   func(http.ResponseWriter, *http.Request, int, error) // called to send an error response (e.g., an error page), it must not panic

	PretendPanic bool
}
```

HandlerWithErrorReturn wraps a http.HandlerFunc-like func that also returns an error.  If the error is nil, this wrapper is a no-op. If the error is non-nil, it attempts to determine the HTTP status code equivalent of the returned error (if non-nil) and set that as the HTTP status. 

Error must never panic. If it has to execute something that may panic (for example, call out into an external code), then it must use recover to catch potential panics. If Error panics, the panic will propagate upstream. 

#### <a id="HandlerWithErrorReturn.ServeHTTP" href="#HandlerWithErrorReturn.ServeHTTP">func (h HandlerWithErrorReturn) ServeHTTP(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: handlerutil.HandlerWithErrorReturn.ServeHTTP
tags: [method]
```

```Go
func (h HandlerWithErrorReturn) ServeHTTP(w http.ResponseWriter, r *http.Request)
```

### <a id="URLMovedError" href="#URLMovedError">type URLMovedError struct</a>

```
searchKey: handlerutil.URLMovedError
tags: [struct]
```

```Go
type URLMovedError struct {
	NewRepo api.RepoName `json:"RedirectTo"`
}
```

URLMovedError should be returned when a requested resource has moved to a new address. 

#### <a id="URLMovedError.Error" href="#URLMovedError.Error">func (e *URLMovedError) Error() string</a>

```
searchKey: handlerutil.URLMovedError.Error
tags: [method]
```

```Go
func (e *URLMovedError) Error() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="CSRFMiddleware" href="#CSRFMiddleware">func CSRFMiddleware(next http.Handler, isSecure func() bool) http.Handler</a>

```
searchKey: handlerutil.CSRFMiddleware
tags: [function]
```

```Go
func CSRFMiddleware(next http.Handler, isSecure func() bool) http.Handler
```

CSRFMiddleware is HTTP middleware that helps prevent cross-site request forgery. To make your forms compliant you will have to submit the token via the X-Csrf-Token header, which is made available in the client-side context. 

### <a id="GetRepo" href="#GetRepo">func GetRepo(ctx context.Context, vars map[string]string) (*types.Repo, error)</a>

```
searchKey: handlerutil.GetRepo
tags: [function]
```

```Go
func GetRepo(ctx context.Context, vars map[string]string) (*types.Repo, error)
```

GetRepo gets the repo (from the reposSvc) specified in the URL's Repo route param. Callers should ideally check for a return error of type URLMovedError and handle this scenario by warning or redirecting the user. 

### <a id="GetRepoAndRev" href="#GetRepoAndRev">func GetRepoAndRev(ctx context.Context, vars map[string]string) (*types.Repo, api.CommitID, error)</a>

```
searchKey: handlerutil.GetRepoAndRev
tags: [function]
```

```Go
func GetRepoAndRev(ctx context.Context, vars map[string]string) (*types.Repo, api.CommitID, error)
```

GetRepoAndRev returns the repo object and the commit ID for a repository. It may also return custom error URLMovedError to allow special handling of this case, such as for example redirecting the user. 

### <a id="RedirectToNewRepoName" href="#RedirectToNewRepoName">func RedirectToNewRepoName(w http.ResponseWriter, r *http.Request, newRepoName api.RepoName) error</a>

```
searchKey: handlerutil.RedirectToNewRepoName
tags: [function]
```

```Go
func RedirectToNewRepoName(w http.ResponseWriter, r *http.Request, newRepoName api.RepoName) error
```

RedirectToNewRepoName writes an HTTP redirect response with a Location that matches the request's location except with the Repo route var updated to refer to newRepoName (instead of the originally requested repo name). 

### <a id="TestGetRepo" href="#TestGetRepo">func TestGetRepo(t *testing.T)</a>

```
searchKey: handlerutil.TestGetRepo
tags: [function private test]
```

```Go
func TestGetRepo(t *testing.T)
```

### <a id="collapseMultipleErrors" href="#collapseMultipleErrors">func collapseMultipleErrors(err error) error</a>

```
searchKey: handlerutil.collapseMultipleErrors
tags: [function private]
```

```Go
func collapseMultipleErrors(err error) error
```

collapseMultipleErrors returns the first err if err is a parallel.Errors list of length 1. Otherwise it returns err unchanged. This lets us return the proper HTTP status code for single errors. 

### <a id="getRepoRev" href="#getRepoRev">func getRepoRev(ctx context.Context, vars map[string]string, repoID api.RepoID) (api.RepoID, api.CommitID, error)</a>

```
searchKey: handlerutil.getRepoRev
tags: [function private]
```

```Go
func getRepoRev(ctx context.Context, vars map[string]string, repoID api.RepoID) (api.RepoID, api.CommitID, error)
```

getRepoRev resolves the repository and commit specified in the route vars. 

### <a id="httpErrCode" href="#httpErrCode">func httpErrCode(r *http.Request, err error) int</a>

```
searchKey: handlerutil.httpErrCode
tags: [function private]
```

```Go
func httpErrCode(r *http.Request, err error) int
```

httpErrCode maps an error to a status code. If the client canceled the request we return the non-standard "499 Client Closed Request" used by nginx. 

### <a id="init.error_reporting.go" href="#init.error_reporting.go">func init()</a>

```
searchKey: handlerutil.init
tags: [function private]
```

```Go
func init()
```

### <a id="reportError" href="#reportError">func reportError(r *http.Request, status int, err error, panicked bool)</a>

```
searchKey: handlerutil.reportError
tags: [function private]
```

```Go
func reportError(r *http.Request, status int, err error, panicked bool)
```

reportError reports an error to Sentry. 

