# Package httpcli

Package httpcli provides higher level abstractions for constructing http.Clients 

## Index

* [Variables](#var)
    * [var externalDoer](#externalDoer)
    * [var externalHTTPClient](#externalHTTPClient)
    * [var externalOnce](#externalOnce)
    * [var redisCache](#redisCache)
* [Types](#type)
    * [type Doer interface](#Doer)
        * [func ContextErrorMiddleware(cli Doer) Doer](#ContextErrorMiddleware)
        * [func ExternalDoer() Doer](#ExternalDoer)
        * [func GitHubProxyRedirectMiddleware(cli Doer) Doer](#GitHubProxyRedirectMiddleware)
        * [func newFakeClient(code int, body []byte, err error) Doer](#newFakeClient)
    * [type DoerFunc func(*net/http.Request) (*net/http.Response, error)](#DoerFunc)
        * [func (f DoerFunc) Do(req *http.Request) (*http.Response, error)](#DoerFunc.Do)
    * [type Factory struct](#Factory)
        * [func NewExternalHTTPClientFactory() *Factory](#NewExternalHTTPClientFactory)
        * [func NewFactory(stack Middleware, common ...Opt) *Factory](#NewFactory)
        * [func (f Factory) Client(base ...Opt) (*http.Client, error)](#Factory.Client)
        * [func (f Factory) Doer(base ...Opt) (Doer, error)](#Factory.Doer)
    * [type Middleware func(github.com/sourcegraph/sourcegraph/internal/httpcli.Doer) github.com/sourcegraph/sourcegraph/internal/httpcli.Doer](#Middleware)
        * [func HeadersMiddleware(headers ...string) Middleware](#HeadersMiddleware)
        * [func NewMiddleware(mws ...Middleware) Middleware](#NewMiddleware)
    * [type Opt func(*net/http.Client) error](#Opt)
        * [func NewCachedTransportOpt(c httpcache.Cache, markCachedResponses bool) Opt](#NewCachedTransportOpt)
        * [func NewCertPoolOpt(certs ...string) Opt](#NewCertPoolOpt)
        * [func NewIdleConnTimeoutOpt(timeout time.Duration) Opt](#NewIdleConnTimeoutOpt)
        * [func NewTimeoutOpt(timeout time.Duration) Opt](#NewTimeoutOpt)
    * [type bogusTransport struct{}](#bogusTransport)
        * [func (t bogusTransport) RoundTrip(*http.Request) (*http.Response, error)](#bogusTransport.RoundTrip)
    * [type externalTransport struct](#externalTransport)
        * [func (t *externalTransport) RoundTrip(r *http.Request) (*http.Response, error)](#externalTransport.RoundTrip)
        * [func (t *externalTransport) update() *http.Transport](#externalTransport.update)
* [Functions](#func)
    * [func ExternalHTTPClient() *http.Client](#ExternalHTTPClient)
    * [func ExternalTransportOpt(cli *http.Client) error](#ExternalTransportOpt)
    * [func TestContextErrorMiddleware(t *testing.T)](#TestContextErrorMiddleware)
    * [func TestHeadersMiddleware(t *testing.T)](#TestHeadersMiddleware)
    * [func TestNewCertPool(t *testing.T)](#TestNewCertPool)
    * [func TestNewIdleConnTimeoutOpt(t *testing.T)](#TestNewIdleConnTimeoutOpt)
    * [func TestNewTimeoutOpt(t *testing.T)](#TestNewTimeoutOpt)
    * [func TracedTransportOpt(cli *http.Client) error](#TracedTransportOpt)
    * [func externalInit()](#externalInit)
    * [func genCert(subject string) (string, error)](#genCert)
    * [func getTransportForMutation(cli *http.Client) (*http.Transport, error)](#getTransportForMutation)
    * [func isUnwrappableTransport(cli *http.Client) bool](#isUnwrappableTransport)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="externalDoer" href="#externalDoer">var externalDoer</a>

```
searchKey: httpcli.externalDoer
tags: [variable interface private]
```

```Go
var externalDoer Doer
```

### <a id="externalHTTPClient" href="#externalHTTPClient">var externalHTTPClient</a>

```
searchKey: httpcli.externalHTTPClient
tags: [variable struct private]
```

```Go
var externalHTTPClient *http.Client
```

### <a id="externalOnce" href="#externalOnce">var externalOnce</a>

```
searchKey: httpcli.externalOnce
tags: [variable struct private]
```

```Go
var externalOnce sync.Once
```

### <a id="redisCache" href="#redisCache">var redisCache</a>

```
searchKey: httpcli.redisCache
tags: [variable struct private]
```

```Go
var redisCache = rcache.NewWithTTL("http", 604800)
```

redisCache is a HTTP cache backed by Redis. The TTL of a week is a balance between caching values for a useful amount of time versus growing the cache too large. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Doer" href="#Doer">type Doer interface</a>

```
searchKey: httpcli.Doer
tags: [interface]
```

```Go
type Doer interface {
	Do(*http.Request) (*http.Response, error)
}
```

A Doer captures the Do method of an http.Client. It facilitates decorating an http.Client with orthogonal concerns such as logging, metrics, retries, etc. 

#### <a id="ContextErrorMiddleware" href="#ContextErrorMiddleware">func ContextErrorMiddleware(cli Doer) Doer</a>

```
searchKey: httpcli.ContextErrorMiddleware
tags: [function]
```

```Go
func ContextErrorMiddleware(cli Doer) Doer
```

ContextErrorMiddleware wraps a Doer with context.Context error handling.  It checks if the request context is done, and if so, returns its error. Otherwise it returns the error from the inner Doer call. 

#### <a id="ExternalDoer" href="#ExternalDoer">func ExternalDoer() Doer</a>

```
searchKey: httpcli.ExternalDoer
tags: [function]
```

```Go
func ExternalDoer() Doer
```

ExternalDoer returns a shared client for external communication. This is a convenience for existing uses of http.DefaultClient. 

NOTE: Use this for legacy code. New code should generally take in a httpcli.Doer and at a high level NewExternalHTTPClientFactory() is called and passed down. 

#### <a id="GitHubProxyRedirectMiddleware" href="#GitHubProxyRedirectMiddleware">func GitHubProxyRedirectMiddleware(cli Doer) Doer</a>

```
searchKey: httpcli.GitHubProxyRedirectMiddleware
tags: [function]
```

```Go
func GitHubProxyRedirectMiddleware(cli Doer) Doer
```

GitHubProxyRedirectMiddleware rewrites requests to the "github-proxy" host to "[https://api.github.com](https://api.github.com)". 

#### <a id="newFakeClient" href="#newFakeClient">func newFakeClient(code int, body []byte, err error) Doer</a>

```
searchKey: httpcli.newFakeClient
tags: [function private]
```

```Go
func newFakeClient(code int, body []byte, err error) Doer
```

### <a id="DoerFunc" href="#DoerFunc">type DoerFunc func(*net/http.Request) (*net/http.Response, error)</a>

```
searchKey: httpcli.DoerFunc
tags: [function]
```

```Go
type DoerFunc func(*http.Request) (*http.Response, error)
```

DoerFunc is function adapter that implements the http.RoundTripper interface by calling itself. 

#### <a id="DoerFunc.Do" href="#DoerFunc.Do">func (f DoerFunc) Do(req *http.Request) (*http.Response, error)</a>

```
searchKey: httpcli.DoerFunc.Do
tags: [method]
```

```Go
func (f DoerFunc) Do(req *http.Request) (*http.Response, error)
```

Do implements the Doer interface. 

### <a id="Factory" href="#Factory">type Factory struct</a>

```
searchKey: httpcli.Factory
tags: [struct]
```

```Go
type Factory struct {
	stack  Middleware
	common []Opt
}
```

A Factory constructs an http.Client with the given functional options applied, returning an aggregate error of the errors returned by all those options. 

#### <a id="NewExternalHTTPClientFactory" href="#NewExternalHTTPClientFactory">func NewExternalHTTPClientFactory() *Factory</a>

```
searchKey: httpcli.NewExternalHTTPClientFactory
tags: [function]
```

```Go
func NewExternalHTTPClientFactory() *Factory
```

NewExternalHTTPClientFactory returns an httpcli.Factory with common options and middleware pre-set for communicating to external services. 

#### <a id="NewFactory" href="#NewFactory">func NewFactory(stack Middleware, common ...Opt) *Factory</a>

```
searchKey: httpcli.NewFactory
tags: [function]
```

```Go
func NewFactory(stack Middleware, common ...Opt) *Factory
```

NewFactory returns a Factory that applies the given common Opts after the ones provided on each invocation of Client or Doer. 

If the given Middleware stack is not nil, the final configured client will be wrapped by it before being returned from a call to Doer, but not Client. 

#### <a id="Factory.Client" href="#Factory.Client">func (f Factory) Client(base ...Opt) (*http.Client, error)</a>

```
searchKey: httpcli.Factory.Client
tags: [method]
```

```Go
func (f Factory) Client(base ...Opt) (*http.Client, error)
```

Client returns a new http.Client configured with the given common and base opts, but not wrapped with any middleware. 

#### <a id="Factory.Doer" href="#Factory.Doer">func (f Factory) Doer(base ...Opt) (Doer, error)</a>

```
searchKey: httpcli.Factory.Doer
tags: [method]
```

```Go
func (f Factory) Doer(base ...Opt) (Doer, error)
```

Doer returns a new Doer wrapped with the middleware stack provided in the Factory constructor and with the given common and base opts applied to it. 

### <a id="Middleware" href="#Middleware">type Middleware func(github.com/sourcegraph/sourcegraph/internal/httpcli.Doer) github.com/sourcegraph/sourcegraph/internal/httpcli.Doer</a>

```
searchKey: httpcli.Middleware
tags: [function]
```

```Go
type Middleware func(Doer) Doer
```

A Middleware function wraps a Doer with a layer of behaviour. It's used to decorate an http.Client with orthogonal layers of behaviour such as logging, instrumentation, retries, etc. 

#### <a id="HeadersMiddleware" href="#HeadersMiddleware">func HeadersMiddleware(headers ...string) Middleware</a>

```
searchKey: httpcli.HeadersMiddleware
tags: [function]
```

```Go
func HeadersMiddleware(headers ...string) Middleware
```

HeadersMiddleware returns a middleware that wraps a Doer and sets the given headers. 

#### <a id="NewMiddleware" href="#NewMiddleware">func NewMiddleware(mws ...Middleware) Middleware</a>

```
searchKey: httpcli.NewMiddleware
tags: [function]
```

```Go
func NewMiddleware(mws ...Middleware) Middleware
```

NewMiddleware returns a Middleware stack composed of the given Middlewares. 

### <a id="Opt" href="#Opt">type Opt func(*net/http.Client) error</a>

```
searchKey: httpcli.Opt
tags: [function]
```

```Go
type Opt func(*http.Client) error
```

A Opt configures an aspect of a given *http.Client, returning an error in case of failure. 

#### <a id="NewCachedTransportOpt" href="#NewCachedTransportOpt">func NewCachedTransportOpt(c httpcache.Cache, markCachedResponses bool) Opt</a>

```
searchKey: httpcli.NewCachedTransportOpt
tags: [function]
```

```Go
func NewCachedTransportOpt(c httpcache.Cache, markCachedResponses bool) Opt
```

NewCachedTransportOpt returns an Opt that wraps the existing http.Transport of an http.Client with caching using the given Cache. 

#### <a id="NewCertPoolOpt" href="#NewCertPoolOpt">func NewCertPoolOpt(certs ...string) Opt</a>

```
searchKey: httpcli.NewCertPoolOpt
tags: [function]
```

```Go
func NewCertPoolOpt(certs ...string) Opt
```

NewCertPoolOpt returns a Opt that sets the RootCAs pool of an http.Client's transport. 

#### <a id="NewIdleConnTimeoutOpt" href="#NewIdleConnTimeoutOpt">func NewIdleConnTimeoutOpt(timeout time.Duration) Opt</a>

```
searchKey: httpcli.NewIdleConnTimeoutOpt
tags: [function]
```

```Go
func NewIdleConnTimeoutOpt(timeout time.Duration) Opt
```

NewIdleConnTimeoutOpt returns a Opt that sets the IdleConnTimeout of an http.Client's transport. 

#### <a id="NewTimeoutOpt" href="#NewTimeoutOpt">func NewTimeoutOpt(timeout time.Duration) Opt</a>

```
searchKey: httpcli.NewTimeoutOpt
tags: [function]
```

```Go
func NewTimeoutOpt(timeout time.Duration) Opt
```

NewTimeoutOpt returns a Opt that sets the Timeout field of an http.Client. 

### <a id="bogusTransport" href="#bogusTransport">type bogusTransport struct{}</a>

```
searchKey: httpcli.bogusTransport
tags: [struct private]
```

```Go
type bogusTransport struct{}
```

#### <a id="bogusTransport.RoundTrip" href="#bogusTransport.RoundTrip">func (t bogusTransport) RoundTrip(*http.Request) (*http.Response, error)</a>

```
searchKey: httpcli.bogusTransport.RoundTrip
tags: [method private]
```

```Go
func (t bogusTransport) RoundTrip(*http.Request) (*http.Response, error)
```

### <a id="externalTransport" href="#externalTransport">type externalTransport struct</a>

```
searchKey: httpcli.externalTransport
tags: [struct private]
```

```Go
type externalTransport struct {
	base *http.Transport

	mu        sync.RWMutex
	config    *schema.TlsExternal
	effective *http.Transport
}
```

#### <a id="externalTransport.RoundTrip" href="#externalTransport.RoundTrip">func (t *externalTransport) RoundTrip(r *http.Request) (*http.Response, error)</a>

```
searchKey: httpcli.externalTransport.RoundTrip
tags: [method private]
```

```Go
func (t *externalTransport) RoundTrip(r *http.Request) (*http.Response, error)
```

#### <a id="externalTransport.update" href="#externalTransport.update">func (t *externalTransport) update() *http.Transport</a>

```
searchKey: httpcli.externalTransport.update
tags: [method private]
```

```Go
func (t *externalTransport) update() *http.Transport
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ExternalHTTPClient" href="#ExternalHTTPClient">func ExternalHTTPClient() *http.Client</a>

```
searchKey: httpcli.ExternalHTTPClient
tags: [function]
```

```Go
func ExternalHTTPClient() *http.Client
```

ExternalHTTPClient returns a shared client for external communication. This is a convenience for existing uses of http.DefaultClient. 

NOTE: Use this for legacy code. New code should generally take in a httpcli.Doer and at a high level NewExternalHTTPClientFactory() is called and passed down. 

### <a id="ExternalTransportOpt" href="#ExternalTransportOpt">func ExternalTransportOpt(cli *http.Client) error</a>

```
searchKey: httpcli.ExternalTransportOpt
tags: [function]
```

```Go
func ExternalTransportOpt(cli *http.Client) error
```

ExternalTransportOpt returns an Opt that ensures the http.Client.Transport can contact non-Sourcegraph services. For example Admins can configure TLS/SSL settings. 

### <a id="TestContextErrorMiddleware" href="#TestContextErrorMiddleware">func TestContextErrorMiddleware(t *testing.T)</a>

```
searchKey: httpcli.TestContextErrorMiddleware
tags: [function private test]
```

```Go
func TestContextErrorMiddleware(t *testing.T)
```

### <a id="TestHeadersMiddleware" href="#TestHeadersMiddleware">func TestHeadersMiddleware(t *testing.T)</a>

```
searchKey: httpcli.TestHeadersMiddleware
tags: [function private test]
```

```Go
func TestHeadersMiddleware(t *testing.T)
```

### <a id="TestNewCertPool" href="#TestNewCertPool">func TestNewCertPool(t *testing.T)</a>

```
searchKey: httpcli.TestNewCertPool
tags: [function private test]
```

```Go
func TestNewCertPool(t *testing.T)
```

### <a id="TestNewIdleConnTimeoutOpt" href="#TestNewIdleConnTimeoutOpt">func TestNewIdleConnTimeoutOpt(t *testing.T)</a>

```
searchKey: httpcli.TestNewIdleConnTimeoutOpt
tags: [function private test]
```

```Go
func TestNewIdleConnTimeoutOpt(t *testing.T)
```

### <a id="TestNewTimeoutOpt" href="#TestNewTimeoutOpt">func TestNewTimeoutOpt(t *testing.T)</a>

```
searchKey: httpcli.TestNewTimeoutOpt
tags: [function private test]
```

```Go
func TestNewTimeoutOpt(t *testing.T)
```

### <a id="TracedTransportOpt" href="#TracedTransportOpt">func TracedTransportOpt(cli *http.Client) error</a>

```
searchKey: httpcli.TracedTransportOpt
tags: [function]
```

```Go
func TracedTransportOpt(cli *http.Client) error
```

TracedTransportOpt wraps an existing http.Transport of an http.Client with tracing functionality. 

### <a id="externalInit" href="#externalInit">func externalInit()</a>

```
searchKey: httpcli.externalInit
tags: [function private]
```

```Go
func externalInit()
```

### <a id="genCert" href="#genCert">func genCert(subject string) (string, error)</a>

```
searchKey: httpcli.genCert
tags: [function private]
```

```Go
func genCert(subject string) (string, error)
```

### <a id="getTransportForMutation" href="#getTransportForMutation">func getTransportForMutation(cli *http.Client) (*http.Transport, error)</a>

```
searchKey: httpcli.getTransportForMutation
tags: [function private]
```

```Go
func getTransportForMutation(cli *http.Client) (*http.Transport, error)
```

getTransport returns the http.Transport for cli. If Transport is nil, it is set to a copy of the DefaultTransport. If it is the DefaultTransport, it is updated to a copy of the DefaultTransport. 

Use this function when you intend on mutating the transport. 

### <a id="isUnwrappableTransport" href="#isUnwrappableTransport">func isUnwrappableTransport(cli *http.Client) bool</a>

```
searchKey: httpcli.isUnwrappableTransport
tags: [function private]
```

```Go
func isUnwrappableTransport(cli *http.Client) bool
```

