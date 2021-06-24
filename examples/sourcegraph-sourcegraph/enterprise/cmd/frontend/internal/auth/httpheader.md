# Package httpheader

Package httpheader implements auth via HTTP Headers. 

## Index

* [Constants](#const)
    * [const providerType](#providerType)
* [Variables](#var)
    * [var Middleware](#Middleware)
* [Types](#type)
    * [type provider struct](#provider)
        * [func (p provider) CachedInfo() *providers.Info](#provider.CachedInfo)
        * [func (p provider) Config() schema.AuthProviders](#provider.Config)
        * [func (provider) ConfigID() providers.ConfigID](#provider.ConfigID)
        * [func (p provider) Refresh(context.Context) error](#provider.Refresh)
* [Functions](#func)
    * [func TestMiddleware(t *testing.T)](#TestMiddleware)
    * [func TestMiddleware_stripPrefix(t *testing.T)](#TestMiddleware_stripPrefix)
    * [func TestValidateCustom(t *testing.T)](#TestValidateCustom)
    * [func getProviderConfig() (pc *schema.HTTPHeaderAuthProvider, multiple bool)](#getProviderConfig)
    * [func init()](#init.config.go)
    * [func init()](#init.config_watch.go)
    * [func middleware(next http.Handler) http.Handler](#middleware)
    * [func validateConfig(c conf.Unified) (problems conf.Problems)](#validateConfig)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="providerType" href="#providerType">const providerType</a>

```
searchKey: httpheader.providerType
tags: [constant string private]
```

```Go
const providerType = "http-header"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="Middleware" href="#Middleware">var Middleware</a>

```
searchKey: httpheader.Middleware
tags: [variable struct]
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

```
tags: [package private]
```

### <a id="provider" href="#provider">type provider struct</a>

```
searchKey: httpheader.provider
tags: [struct private]
```

```Go
type provider struct {
	c *schema.HTTPHeaderAuthProvider
}
```

#### <a id="provider.CachedInfo" href="#provider.CachedInfo">func (p provider) CachedInfo() *providers.Info</a>

```
searchKey: httpheader.provider.CachedInfo
tags: [function private]
```

```Go
func (p provider) CachedInfo() *providers.Info
```

CachedInfo implements providers.Provider. 

#### <a id="provider.Config" href="#provider.Config">func (p provider) Config() schema.AuthProviders</a>

```
searchKey: httpheader.provider.Config
tags: [function private]
```

```Go
func (p provider) Config() schema.AuthProviders
```

Config implements providers.Provider. 

#### <a id="provider.ConfigID" href="#provider.ConfigID">func (provider) ConfigID() providers.ConfigID</a>

```
searchKey: httpheader.provider.ConfigID
tags: [function private]
```

```Go
func (provider) ConfigID() providers.ConfigID
```

ConfigID implements providers.Provider. 

#### <a id="provider.Refresh" href="#provider.Refresh">func (p provider) Refresh(context.Context) error</a>

```
searchKey: httpheader.provider.Refresh
tags: [method private]
```

```Go
func (p provider) Refresh(context.Context) error
```

Refresh implements providers.Provider. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="TestMiddleware" href="#TestMiddleware">func TestMiddleware(t *testing.T)</a>

```
searchKey: httpheader.TestMiddleware
tags: [method private test]
```

```Go
func TestMiddleware(t *testing.T)
```

SEE ALSO FOR MANUAL TESTING: See the Middleware docstring for information about the testproxy helper program, which helps with manual testing of the HTTP auth proxy behavior. 

### <a id="TestMiddleware_stripPrefix" href="#TestMiddleware_stripPrefix">func TestMiddleware_stripPrefix(t *testing.T)</a>

```
searchKey: httpheader.TestMiddleware_stripPrefix
tags: [method private test]
```

```Go
func TestMiddleware_stripPrefix(t *testing.T)
```

### <a id="TestValidateCustom" href="#TestValidateCustom">func TestValidateCustom(t *testing.T)</a>

```
searchKey: httpheader.TestValidateCustom
tags: [method private test]
```

```Go
func TestValidateCustom(t *testing.T)
```

### <a id="getProviderConfig" href="#getProviderConfig">func getProviderConfig() (pc *schema.HTTPHeaderAuthProvider, multiple bool)</a>

```
searchKey: httpheader.getProviderConfig
tags: [function private]
```

```Go
func getProviderConfig() (pc *schema.HTTPHeaderAuthProvider, multiple bool)
```

getProviderConfig returns the HTTP header auth provider config. At most 1 can be specified in site config; if there is more than 1, it returns multiple == true (which the caller should handle by returning an error and refusing to proceed with auth). 

### <a id="init.config.go" href="#init.config.go">func init()</a>

```
searchKey: httpheader.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.config_watch.go" href="#init.config_watch.go">func init()</a>

```
searchKey: httpheader.init
tags: [function private]
```

```Go
func init()
```

Watch for configuration changes related to the http-header auth provider. 

### <a id="middleware" href="#middleware">func middleware(next http.Handler) http.Handler</a>

```
searchKey: httpheader.middleware
tags: [method private]
```

```Go
func middleware(next http.Handler) http.Handler
```

middleware is middleware that checks for an HTTP header from an auth proxy that specifies the client's authenticated username. It's for use with auth proxies like [https://github.com/bitly/oauth2_proxy](https://github.com/bitly/oauth2_proxy) and is configured with the http-header auth provider in site config. 

TESTING: Use the testproxy test program to test HTTP auth proxy behavior. For example, run `go run cmd/frontend/auth/httpheader/testproxy.go -username=alice` then go to [http://localhost:4080](http://localhost:4080). See `-h` for flag help. 

🚨 SECURITY 

### <a id="validateConfig" href="#validateConfig">func validateConfig(c conf.Unified) (problems conf.Problems)</a>

```
searchKey: httpheader.validateConfig
tags: [method private]
```

```Go
func validateConfig(c conf.Unified) (problems conf.Problems)
```

