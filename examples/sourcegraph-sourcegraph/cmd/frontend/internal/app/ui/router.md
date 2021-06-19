# Package router

Package router contains the route names for our app UI. 

## Index

* [Constants](#const)
    * [const RouteSignIn](#RouteSignIn)
    * [const RouteSignUp](#RouteSignUp)
    * [const RoutePasswordReset](#RoutePasswordReset)
    * [const RouteRaw](#RouteRaw)
    * [const RoutePingFromSelfHosted](#RoutePingFromSelfHosted)
* [Variables](#var)
    * [var Router](#Router)
* [Functions](#func)
    * [func Extension(extensionID string) string](#Extension)
    * [func RegistryPublisherExtensions(isUser, isOrg bool, name string) string](#RegistryPublisherExtensions)


## <a id="const" href="#const">Constants</a>

### <a id="RouteSignIn" href="#RouteSignIn">const RouteSignIn</a>

```
searchKey: router.RouteSignIn
tags: [exported]
```

```Go
const RouteSignIn = "sign-in"
```

These route names are used by other packages that can't import the ../ui package without creating an import cycle. 

### <a id="RouteSignUp" href="#RouteSignUp">const RouteSignUp</a>

```
searchKey: router.RouteSignUp
tags: [exported]
```

```Go
const RouteSignUp = "sign-up"
```

These route names are used by other packages that can't import the ../ui package without creating an import cycle. 

### <a id="RoutePasswordReset" href="#RoutePasswordReset">const RoutePasswordReset</a>

```
searchKey: router.RoutePasswordReset
tags: [exported]
```

```Go
const RoutePasswordReset = "password-reset"
```

These route names are used by other packages that can't import the ../ui package without creating an import cycle. 

### <a id="RouteRaw" href="#RouteRaw">const RouteRaw</a>

```
searchKey: router.RouteRaw
tags: [exported]
```

```Go
const RouteRaw = "raw"
```

These route names are used by other packages that can't import the ../ui package without creating an import cycle. 

### <a id="RoutePingFromSelfHosted" href="#RoutePingFromSelfHosted">const RoutePingFromSelfHosted</a>

```
searchKey: router.RoutePingFromSelfHosted
tags: [exported]
```

```Go
const RoutePingFromSelfHosted = "ping-from-self-hosted"
```

These route names are used by other packages that can't import the ../ui package without creating an import cycle. 

## <a id="var" href="#var">Variables</a>

### <a id="Router" href="#Router">var Router</a>

```
searchKey: router.Router
tags: [exported]
```

```Go
var Router *mux.Router
```

Router is the UI router. 

It is used by packages that can't import the ../ui package without creating an import cycle. 

## <a id="func" href="#func">Functions</a>

### <a id="Extension" href="#Extension">func Extension(extensionID string) string</a>

```
searchKey: router.Extension
tags: [exported]
```

```Go
func Extension(extensionID string) string
```

### <a id="RegistryPublisherExtensions" href="#RegistryPublisherExtensions">func RegistryPublisherExtensions(isUser, isOrg bool, name string) string</a>

```
searchKey: router.RegistryPublisherExtensions
tags: [exported]
```

```Go
func RegistryPublisherExtensions(isUser, isOrg bool, name string) string
```

