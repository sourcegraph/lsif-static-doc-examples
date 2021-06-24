# Package executor

## Index

* [Variables](#var)
    * [var client](#client)
    * [var getRest](#getRest)
    * [var queueURL](#queueURL)
    * [var sharedPassword](#sharedPassword)
    * [var sharedUsername](#sharedUsername)
* [Functions](#func)
    * [func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error](#Init)
    * [func TestInternalProxyAuthTokenMiddleware(t *testing.T)](#TestInternalProxyAuthTokenMiddleware)
    * [func TestReverseProxyHeaders(t *testing.T)](#TestReverseProxyHeaders)
    * [func TestReverseProxyRedirectWithPayload(t *testing.T)](#TestReverseProxyRedirectWithPayload)
    * [func TestReverseProxySimple(t *testing.T)](#TestReverseProxySimple)
    * [func TestReverseProxyTargetPath(t *testing.T)](#TestReverseProxyTargetPath)
    * [func basicAuthMiddleware(next http.Handler) http.Handler](#basicAuthMiddleware)
    * [func copyHeader(dst, src http.Header)](#copyHeader)
    * [func init()](#init.internal_proxy_handler_test.go)
    * [func makeProxyRequest(r *http.Request, target *url.URL) (*http.Request, error)](#makeProxyRequest)
    * [func newInternalProxyHandler(uploadHandler http.Handler) (func() http.Handler, error)](#newInternalProxyHandler)
    * [func reverseProxy(target *url.URL) http.Handler](#reverseProxy)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="client" href="#client">var client</a>

```
searchKey: executor.client
tags: [variable struct private]
```

```Go
var client = http.DefaultClient
```

TODO(efritz) - add tracing, metrics 

### <a id="getRest" href="#getRest">var getRest</a>

```
searchKey: executor.getRest
tags: [variable function private]
```

```Go
var getRest = func(r *http.Request) string {
	return mux.Vars(r)["rest"]
}
```

getRest returns the "rest" segment of the request's URL. This is a function variable so we can swap it out easily during testing. The gorilla/mux does have a testing function to set variables on a request context, but the context gets lost somewhere between construction of the request and the default client's handling of the request. 

### <a id="queueURL" href="#queueURL">var queueURL</a>

```
searchKey: executor.queueURL
tags: [variable string private]
```

```Go
var queueURL = env.Get("EXECUTOR_QUEUE_URL", "", "HTTP address for the internal executor-queue.")
```

### <a id="sharedPassword" href="#sharedPassword">var sharedPassword</a>

```
searchKey: executor.sharedPassword
tags: [variable string private]
```

```Go
var sharedPassword = ...
```

### <a id="sharedUsername" href="#sharedUsername">var sharedUsername</a>

```
searchKey: executor.sharedUsername
tags: [variable string private]
```

```Go
var sharedUsername = ...
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Init" href="#Init">func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error</a>

```
searchKey: executor.Init
tags: [method]
```

```Go
func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error
```

### <a id="TestInternalProxyAuthTokenMiddleware" href="#TestInternalProxyAuthTokenMiddleware">func TestInternalProxyAuthTokenMiddleware(t *testing.T)</a>

```
searchKey: executor.TestInternalProxyAuthTokenMiddleware
tags: [method private test]
```

```Go
func TestInternalProxyAuthTokenMiddleware(t *testing.T)
```

### <a id="TestReverseProxyHeaders" href="#TestReverseProxyHeaders">func TestReverseProxyHeaders(t *testing.T)</a>

```
searchKey: executor.TestReverseProxyHeaders
tags: [method private test]
```

```Go
func TestReverseProxyHeaders(t *testing.T)
```

### <a id="TestReverseProxyRedirectWithPayload" href="#TestReverseProxyRedirectWithPayload">func TestReverseProxyRedirectWithPayload(t *testing.T)</a>

```
searchKey: executor.TestReverseProxyRedirectWithPayload
tags: [method private test]
```

```Go
func TestReverseProxyRedirectWithPayload(t *testing.T)
```

### <a id="TestReverseProxySimple" href="#TestReverseProxySimple">func TestReverseProxySimple(t *testing.T)</a>

```
searchKey: executor.TestReverseProxySimple
tags: [method private test]
```

```Go
func TestReverseProxySimple(t *testing.T)
```

### <a id="TestReverseProxyTargetPath" href="#TestReverseProxyTargetPath">func TestReverseProxyTargetPath(t *testing.T)</a>

```
searchKey: executor.TestReverseProxyTargetPath
tags: [method private test]
```

```Go
func TestReverseProxyTargetPath(t *testing.T)
```

### <a id="basicAuthMiddleware" href="#basicAuthMiddleware">func basicAuthMiddleware(next http.Handler) http.Handler</a>

```
searchKey: executor.basicAuthMiddleware
tags: [method private]
```

```Go
func basicAuthMiddleware(next http.Handler) http.Handler
```

basicAuthMiddleware rejects requests that do not have a basic auth username and password matching the expected username and password. This should only be used for internal _services_, not users, in which a shared key exchange can be done so safely. 

### <a id="copyHeader" href="#copyHeader">func copyHeader(dst, src http.Header)</a>

```
searchKey: executor.copyHeader
tags: [method private]
```

```Go
func copyHeader(dst, src http.Header)
```

copyHeader adds the header values from src to dst. 

### <a id="init.internal_proxy_handler_test.go" href="#init.internal_proxy_handler_test.go">func init()</a>

```
searchKey: executor.init
tags: [function private]
```

```Go
func init()
```

### <a id="makeProxyRequest" href="#makeProxyRequest">func makeProxyRequest(r *http.Request, target *url.URL) (*http.Request, error)</a>

```
searchKey: executor.makeProxyRequest
tags: [method private]
```

```Go
func makeProxyRequest(r *http.Request, target *url.URL) (*http.Request, error)
```

makeProxyRequest returns a new HTTP request object with the given HTTP request's headers and body. The resulting request's URL is a URL constructed with the given target URL as a base, and the text matching the "{rest:.*}" portion of the given request's route as the additional path segment. The resulting request's GetBody field is populated so that a 307 Temporary Redirect can be followed when making POST requests. This is necessary to properly proxy git service operations without being redirected to an inaccessible API. 

### <a id="newInternalProxyHandler" href="#newInternalProxyHandler">func newInternalProxyHandler(uploadHandler http.Handler) (func() http.Handler, error)</a>

```
searchKey: executor.newInternalProxyHandler
tags: [method private]
```

```Go
func newInternalProxyHandler(uploadHandler http.Handler) (func() http.Handler, error)
```

### <a id="reverseProxy" href="#reverseProxy">func reverseProxy(target *url.URL) http.Handler</a>

```
searchKey: executor.reverseProxy
tags: [method private]
```

```Go
func reverseProxy(target *url.URL) http.Handler
```

reverseProxy creates an HTTP handler that will proxy requests to the given target URL. See makeProxyRequest for details on how the request URI is constructed. 

Note that we do not use httputil.ReverseProxy. We need to ensure that there are no redirect requests to unreachable (internal) routes sent back to the client, and the built-in reverse proxy does not give sufficient control over redirects. 

