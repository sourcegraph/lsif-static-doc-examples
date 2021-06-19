# Package auth

## Index

* Subpages
  * [cmd/frontend/internal/auth/userpasswd](auth/userpasswd.md)
* [Constants](#const)
    * [const overrideSecretHeader](#overrideSecretHeader)
    * [const overrideUsernameHeader](#overrideUsernameHeader)
    * [const defaultUsername](#defaultUsername)
* [Variables](#var)
    * [var envOverrideAuthSecret](#envOverrideAuthSecret)
* [Functions](#func)
    * [func init()](#init)
    * [func validateConfig(c conf.Unified) (problems conf.Problems)](#validateConfig)
    * [func ForbidAllRequestsMiddleware(next http.Handler) http.Handler](#ForbidAllRequestsMiddleware)
    * [func OverrideAuthMiddleware(next http.Handler) http.Handler](#OverrideAuthMiddleware)
    * [func TestValidateCustom(t *testing.T)](#TestValidateCustom)
    * [func TestForbidAllMiddleware(t *testing.T)](#TestForbidAllMiddleware)
    * [func TestOverrideAuthMiddleware(t *testing.T)](#TestOverrideAuthMiddleware)


## <a id="const" href="#const">Constants</a>

### <a id="overrideSecretHeader" href="#overrideSecretHeader">const overrideSecretHeader</a>

```
searchKey: auth.overrideSecretHeader
```

```Go
const overrideSecretHeader = "X-Override-Auth-Secret"
```

### <a id="overrideUsernameHeader" href="#overrideUsernameHeader">const overrideUsernameHeader</a>

```
searchKey: auth.overrideUsernameHeader
```

```Go
const overrideUsernameHeader = "X-Override-Auth-Username"
```

### <a id="defaultUsername" href="#defaultUsername">const defaultUsername</a>

```
searchKey: auth.defaultUsername
```

```Go
const defaultUsername = "override-auth-user"
```

## <a id="var" href="#var">Variables</a>

### <a id="envOverrideAuthSecret" href="#envOverrideAuthSecret">var envOverrideAuthSecret</a>

```
searchKey: auth.envOverrideAuthSecret
```

```Go
var envOverrideAuthSecret = ...
```

envOverrideAuthSecret (the env var OVERRIDE_AUTH_SECRET) is the preferred source of the secret for overriding auth. 

## <a id="func" href="#func">Functions</a>

### <a id="init" href="#init">func init()</a>

```
searchKey: auth.init
```

```Go
func init()
```

### <a id="validateConfig" href="#validateConfig">func validateConfig(c conf.Unified) (problems conf.Problems)</a>

```
searchKey: auth.validateConfig
```

```Go
func validateConfig(c conf.Unified) (problems conf.Problems)
```

### <a id="ForbidAllRequestsMiddleware" href="#ForbidAllRequestsMiddleware">func ForbidAllRequestsMiddleware(next http.Handler) http.Handler</a>

```
searchKey: auth.ForbidAllRequestsMiddleware
tags: [exported]
```

```Go
func ForbidAllRequestsMiddleware(next http.Handler) http.Handler
```

ForbidAllRequestsMiddleware forbids all requests. It is used when no auth provider is configured (as a safer default than "server is 100% public, no auth required"). 

### <a id="OverrideAuthMiddleware" href="#OverrideAuthMiddleware">func OverrideAuthMiddleware(next http.Handler) http.Handler</a>

```
searchKey: auth.OverrideAuthMiddleware
tags: [exported]
```

```Go
func OverrideAuthMiddleware(next http.Handler) http.Handler
```

OverrideAuthMiddleware is middleware that causes a new authenticated session (associated with a new user named "anon-user") to be started if the client provides a secret header value specified in site config. 

It is used to enable our e2e tests to authenticate to [https://sourcegraph.sgdev.org](https://sourcegraph.sgdev.org) without needing to give them Google Workspace access. 

### <a id="TestValidateCustom" href="#TestValidateCustom">func TestValidateCustom(t *testing.T)</a>

```
searchKey: auth.TestValidateCustom
```

```Go
func TestValidateCustom(t *testing.T)
```

### <a id="TestForbidAllMiddleware" href="#TestForbidAllMiddleware">func TestForbidAllMiddleware(t *testing.T)</a>

```
searchKey: auth.TestForbidAllMiddleware
```

```Go
func TestForbidAllMiddleware(t *testing.T)
```

### <a id="TestOverrideAuthMiddleware" href="#TestOverrideAuthMiddleware">func TestOverrideAuthMiddleware(t *testing.T)</a>

```
searchKey: auth.TestOverrideAuthMiddleware
```

```Go
func TestOverrideAuthMiddleware(t *testing.T)
```

