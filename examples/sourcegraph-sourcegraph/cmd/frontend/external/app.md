# Package app

Package app exports symbols from frontend/internal/app. See the parent package godoc for more information. 

## Index

* [Variables](#var)
    * [var RegisterSSOSignOutHandler](#RegisterSSOSignOutHandler)
* [Types](#type)
    * [type SignOutURL app.SignOutURL](#SignOutURL)
* [Functions](#func)
    * [func SetBillingPublishableKey(value string)](#SetBillingPublishableKey)
    * [func SetPreMountGrafanaHook(hookFn func() error)](#SetPreMountGrafanaHook)


## <a id="var" href="#var">Variables</a>

### <a id="RegisterSSOSignOutHandler" href="#RegisterSSOSignOutHandler">var RegisterSSOSignOutHandler</a>

```
searchKey: app.RegisterSSOSignOutHandler
```

```Go
var RegisterSSOSignOutHandler = app.RegisterSSOSignOutHandler
```

## <a id="type" href="#type">Types</a>

### <a id="SignOutURL" href="#SignOutURL">type SignOutURL app.SignOutURL</a>

```
searchKey: app.SignOutURL
```

```Go
type SignOutURL = app.SignOutURL
```

## <a id="func" href="#func">Functions</a>

### <a id="SetBillingPublishableKey" href="#SetBillingPublishableKey">func SetBillingPublishableKey(value string)</a>

```
searchKey: app.SetBillingPublishableKey
```

```Go
func SetBillingPublishableKey(value string)
```

### <a id="SetPreMountGrafanaHook" href="#SetPreMountGrafanaHook">func SetPreMountGrafanaHook(hookFn func() error)</a>

```
searchKey: app.SetPreMountGrafanaHook
```

```Go
func SetPreMountGrafanaHook(hookFn func() error)
```

SetPreMountGrafanaHook allows the enterprise package to inject a tier enforcement function during initialization. 

