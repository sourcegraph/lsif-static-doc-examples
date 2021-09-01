# Package globals

Package globals contains global variables that should be set by the frontend's main function on initialization. 

## Index

* [Variables](#var)
    * [var ConfigurationServerFrontendOnly](#ConfigurationServerFrontendOnly)
    * [var branding](#branding)
    * [var brandingWatchers](#brandingWatchers)
    * [var defaultBranding](#defaultBranding)
    * [var defaultPermissionsUserMapping](#defaultPermissionsUserMapping)
    * [var defaultexternalURL](#defaultexternalURL)
    * [var externalURL](#externalURL)
    * [var externalURLWatchers](#externalURLWatchers)
    * [var permissionsUserMapping](#permissionsUserMapping)
    * [var permissionsUserMappingWatchers](#permissionsUserMappingWatchers)
* [Functions](#func)
    * [func Branding() *schema.Branding](#Branding)
    * [func ExternalURL() *url.URL](#ExternalURL)
    * [func PermissionsUserMapping() *schema.PermissionsUserMapping](#PermissionsUserMapping)
    * [func SetBranding(u *schema.Branding)](#SetBranding)
    * [func SetExternalURL(u *url.URL)](#SetExternalURL)
    * [func SetPermissionsUserMapping(u *schema.PermissionsUserMapping)](#SetPermissionsUserMapping)
    * [func WatchBranding(licenseChecker func() error)](#WatchBranding)
    * [func WatchExternalURL(defaultURL *url.URL)](#WatchExternalURL)
    * [func WatchPermissionsUserMapping()](#WatchPermissionsUserMapping)


## <a id="var" href="#var">Variables</a>

### <a id="ConfigurationServerFrontendOnly" href="#ConfigurationServerFrontendOnly">var ConfigurationServerFrontendOnly</a>

```
searchKey: globals.ConfigurationServerFrontendOnly
tags: [variable struct]
```

```Go
var ConfigurationServerFrontendOnly *conf.Server
```

ConfigurationServerFrontendOnly provides the contents of the site configuration to other services and manages modifications to it. 

Any another service that attempts to use this variable will panic. 

### <a id="branding" href="#branding">var branding</a>

```
searchKey: globals.branding
tags: [variable struct private]
```

```Go
var branding = func() atomic.Value {
	var v atomic.Value
	v.Store(defaultBranding)
	return v
}()
```

branding mirrors the value of `branding` in the site configuration. This variable is used to monitor configuration change via conf.Watch and must be operated atomically. 

### <a id="brandingWatchers" href="#brandingWatchers">var brandingWatchers</a>

```
searchKey: globals.brandingWatchers
tags: [variable number private]
```

```Go
var brandingWatchers uint32
```

### <a id="defaultBranding" href="#defaultBranding">var defaultBranding</a>

```
searchKey: globals.defaultBranding
tags: [variable struct private]
```

```Go
var defaultBranding = &schema.Branding{
	BrandName: "Sourcegraph",
}
```

### <a id="defaultPermissionsUserMapping" href="#defaultPermissionsUserMapping">var defaultPermissionsUserMapping</a>

```
searchKey: globals.defaultPermissionsUserMapping
tags: [variable struct private]
```

```Go
var defaultPermissionsUserMapping = ...
```

### <a id="defaultexternalURL" href="#defaultexternalURL">var defaultexternalURL</a>

```
searchKey: globals.defaultexternalURL
tags: [variable struct private]
```

```Go
var defaultexternalURL = &url.URL{
	Scheme: "http",
	Host:   "example.com",
}
```

### <a id="externalURL" href="#externalURL">var externalURL</a>

```
searchKey: globals.externalURL
tags: [variable struct private]
```

```Go
var externalURL = ...
```

### <a id="externalURLWatchers" href="#externalURLWatchers">var externalURLWatchers</a>

```
searchKey: globals.externalURLWatchers
tags: [variable number private]
```

```Go
var externalURLWatchers uint32
```

### <a id="permissionsUserMapping" href="#permissionsUserMapping">var permissionsUserMapping</a>

```
searchKey: globals.permissionsUserMapping
tags: [variable struct private]
```

```Go
var permissionsUserMapping = ...
```

permissionsUserMapping mirrors the value of `permissions.userMapping` in the site configuration. This variable is used to monitor configuration change via conf.Watch and must be operated atomically. 

### <a id="permissionsUserMappingWatchers" href="#permissionsUserMappingWatchers">var permissionsUserMappingWatchers</a>

```
searchKey: globals.permissionsUserMappingWatchers
tags: [variable number private]
```

```Go
var permissionsUserMappingWatchers uint32
```

## <a id="func" href="#func">Functions</a>

### <a id="Branding" href="#Branding">func Branding() *schema.Branding</a>

```
searchKey: globals.Branding
tags: [function]
```

```Go
func Branding() *schema.Branding
```

Branding returns the last valid value of branding in the site configuration. Callers must not mutate the returned pointer. 

### <a id="ExternalURL" href="#ExternalURL">func ExternalURL() *url.URL</a>

```
searchKey: globals.ExternalURL
tags: [function]
```

```Go
func ExternalURL() *url.URL
```

ExternalURL returns the fully-resolved, externally accessible frontend URL. Callers must not mutate the returned pointer. 

### <a id="PermissionsUserMapping" href="#PermissionsUserMapping">func PermissionsUserMapping() *schema.PermissionsUserMapping</a>

```
searchKey: globals.PermissionsUserMapping
tags: [function]
```

```Go
func PermissionsUserMapping() *schema.PermissionsUserMapping
```

PermissionsUserMapping returns the last valid value of permissions user mapping in the site configuration. Callers must not mutate the returned pointer. 

### <a id="SetBranding" href="#SetBranding">func SetBranding(u *schema.Branding)</a>

```
searchKey: globals.SetBranding
tags: [function]
```

```Go
func SetBranding(u *schema.Branding)
```

SetBranding sets a valid value for the branding. 

### <a id="SetExternalURL" href="#SetExternalURL">func SetExternalURL(u *url.URL)</a>

```
searchKey: globals.SetExternalURL
tags: [function]
```

```Go
func SetExternalURL(u *url.URL)
```

SetExternalURL sets the fully-resolved, externally accessible frontend URL. 

### <a id="SetPermissionsUserMapping" href="#SetPermissionsUserMapping">func SetPermissionsUserMapping(u *schema.PermissionsUserMapping)</a>

```
searchKey: globals.SetPermissionsUserMapping
tags: [function]
```

```Go
func SetPermissionsUserMapping(u *schema.PermissionsUserMapping)
```

SetPermissionsUserMapping sets a valid value for the permissions user mapping. 

### <a id="WatchBranding" href="#WatchBranding">func WatchBranding(licenseChecker func() error)</a>

```
searchKey: globals.WatchBranding
tags: [function]
```

```Go
func WatchBranding(licenseChecker func() error)
```

WatchBranding watches for changes in the `branding` site configuration so that changes are reflected in what is returned by the Branding function. This should only be called once and will panic otherwise. 

### <a id="WatchExternalURL" href="#WatchExternalURL">func WatchExternalURL(defaultURL *url.URL)</a>

```
searchKey: globals.WatchExternalURL
tags: [function]
```

```Go
func WatchExternalURL(defaultURL *url.URL)
```

WatchExternalURL watches for changes in the `externalURL` site configuration so that changes are reflected in what is returned by the ExternalURL function. In case the setting is not set, defaultURL is used. This should only be called once and will panic otherwise. 

### <a id="WatchPermissionsUserMapping" href="#WatchPermissionsUserMapping">func WatchPermissionsUserMapping()</a>

```
searchKey: globals.WatchPermissionsUserMapping
tags: [function]
```

```Go
func WatchPermissionsUserMapping()
```

WatchPermissionsUserMapping watches for changes in the `permissions.userMapping` site configuration so that changes are reflected in what is returned by the PermissionsUserMapping function. This should only be called once and will panic otherwise. 

