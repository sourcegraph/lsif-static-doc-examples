# Package httpheader

Package httpheader implements auth via HTTP Headers. 

## Index

* [Constants](#const)
    * [const providerType](#providerType)
* [Variables](#var)
    * [var Middleware](#Middleware)
* [Types](#type)
    * [type provider struct](#provider)
        * [func (provider) ConfigID() providers.ConfigID](#provider.ConfigID)
        * [func (p provider) Config() schema.AuthProviders](#provider.Config)
        * [func (p provider) Refresh(context.Context) error](#provider.Refresh)
        * [func (p provider) CachedInfo() *providers.Info](#provider.CachedInfo)
* [Functions](#func)
    * [func getProviderConfig() (pc *schema.HTTPHeaderAuthProvider, multiple bool)](#getProviderConfig)
    * [func init()](#init)
    * [func validateConfig(c conf.Unified) (problems conf.Problems)](#validateConfig)
    * [func init()](#init)
    * [func middleware(next http.Handler) http.Handler](#middleware)
    * [func TestValidateCustom(t *testing.T)](#TestValidateCustom)
    * [func TestMiddleware(t *testing.T)](#TestMiddleware)
    * [func TestMiddleware_stripPrefix(t *testing.T)](#TestMiddleware_stripPrefix)


## <a id="const" href="#const">Constants</a>

### <a id="providerType" href="#providerType">const providerType</a>

```
searchKey: httpheader.providerType
```

```Go
const providerType = "http-header"
```

## <a id="var" href="#var">Variables</a>

### <a id="Middleware" href="#Middleware">var Middleware</a>

```
searchKey: httpheader.Middleware
tags: [exported]
```

```Go
var Middleware = &auth.Middleware{
	API: middleware,
	App: middleware,
}
```

Middleware is the same for both the app and API because the HTTP proxy is assumed to wrap requests to both the app and API and add headers. 

See the "func middleware" docs for more information. 

## <a id="type" href="#type">Types</a>

### <a id="provider" href="#provider">type provider struct</a>

```
searchKey: httpheader.provider
```

```Go
type provider struct {
	c *schema.HTTPHeaderAuthProvider
}
```

#### <a id="provider.ConfigID" href="#provider.ConfigID">func (provider) ConfigID() providers.ConfigID</a>

```
searchKey: httpheader.provider.ConfigID
```

```Go
func (provider) ConfigID() providers.ConfigID
```

ConfigID implements providers.Provider. 

#### <a id="provider.Config" href="#provider.Config">func (p provider) Config() schema.AuthProviders</a>

```
searchKey: httpheader.provider.Config
```

```Go
func (p provider) Config() schema.AuthProviders
```

Config implements providers.Provider. 

#### <a id="provider.Refresh" href="#provider.Refresh">func (p provider) Refresh(context.Context) error</a>

```
searchKey: httpheader.provider.Refresh
```

```Go
func (p provider) Refresh(context.Context) error
```

Refresh implements providers.Provider. 

#### <a id="provider.CachedInfo" href="#provider.CachedInfo">func (p provider) CachedInfo() *providers.Info</a>

```
searchKey: httpheader.provider.CachedInfo
```

```Go
func (p provider) CachedInfo() *providers.Info
```

CachedInfo implements providers.Provider. 

## <a id="func" href="#func">Functions</a>

### <a id="getProviderConfig" href="#getProviderConfig">func getProviderConfig() (pc *schema.HTTPHeaderAuthProvider, multiple bool)</a>

```
searchKey: httpheader.getProviderConfig
```

```Go
func getProviderConfig() (pc *schema.HTTPHeaderAuthProvider, multiple bool)
```

getProviderConfig returns the HTTP header auth provider config. At most 1 can be specified in site config; if there is more than 1, it returns multiple == true (which the caller should handle by returning an error and refusing to proceed with auth). 

### <a id="init" href="#init">func init()</a>

```
searchKey: httpheader.init
```

```Go
func init()
```

### <a id="validateConfig" href="#validateConfig">func validateConfig(c conf.Unified) (problems conf.Problems)</a>

```
searchKey: httpheader.validateConfig
```

```Go
func validateConfig(c conf.Unified) (problems conf.Problems)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: httpheader.init
```

```Go
func init()
```

Watch for configuration changes related to the http-header auth provider. 

### <a id="middleware" href="#middleware">func middleware(next http.Handler) http.Handler</a>

```
searchKey: httpheader.middleware
```

```Go
func middleware(next http.Handler) http.Handler
```

middleware is middleware that checks for an HTTP header from an auth proxy that specifies the client's authenticated username. It's for use with auth proxies like [https://github.com/bitly/oauth2_proxy](https://github.com/bitly/oauth2_proxy) and is configured with the http-header auth provider in site config. 

TESTING: Use the testproxy test program to test HTTP auth proxy behavior. For example, run `go run cmd/frontend/auth/httpheader/testproxy.go -username=alice` then go to [http://localhost:4080](http://localhost:4080). See `-h` for flag help. 

🚨 SECURITY 

### <a id="TestValidateCustom" href="#TestValidateCustom">func TestValidateCustom(t *testing.T)</a>

```
searchKey: httpheader.TestValidateCustom
```

```Go
func TestValidateCustom(t *testing.T)
```

### <a id="TestMiddleware" href="#TestMiddleware">func TestMiddleware(t *testing.T)</a>

```
searchKey: httpheader.TestMiddleware
```

```Go
func TestMiddleware(t *testing.T)
```

SEE ALSO FOR MANUAL TESTING: See the Middleware docstring for information about the testproxy helper program, which helps with manual testing of the HTTP auth proxy behavior. 

### <a id="TestMiddleware_stripPrefix" href="#TestMiddleware_stripPrefix">func TestMiddleware_stripPrefix(t *testing.T)</a>

```
searchKey: httpheader.TestMiddleware_stripPrefix
```

```Go
func TestMiddleware_stripPrefix(t *testing.T)
```

