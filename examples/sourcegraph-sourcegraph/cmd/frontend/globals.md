# Package globals

Package globals contains global variables that should be set by the frontend's main function on initialization. 

## Index

* [Variables](#var)
    * [var externalURLWatchers](#externalURLWatchers)
    * [var defaultexternalURL](#defaultexternalURL)
    * [var externalURL](#externalURL)
    * [var defaultPermissionsUserMapping](#defaultPermissionsUserMapping)
    * [var permissionsUserMapping](#permissionsUserMapping)
    * [var permissionsUserMappingWatchers](#permissionsUserMappingWatchers)
    * [var defaultBranding](#defaultBranding)
    * [var branding](#branding)
    * [var brandingWatchers](#brandingWatchers)
    * [var ConfigurationServerFrontendOnly](#ConfigurationServerFrontendOnly)
* [Functions](#func)
    * [func WatchExternalURL(defaultURL *url.URL)](#WatchExternalURL)
    * [func ExternalURL() *url.URL](#ExternalURL)
    * [func SetExternalURL(u *url.URL)](#SetExternalURL)
    * [func WatchPermissionsUserMapping()](#WatchPermissionsUserMapping)
    * [func PermissionsUserMapping() *schema.PermissionsUserMapping](#PermissionsUserMapping)
    * [func SetPermissionsUserMapping(u *schema.PermissionsUserMapping)](#SetPermissionsUserMapping)
    * [func WatchBranding(licenseChecker func() error)](#WatchBranding)
    * [func Branding() *schema.Branding](#Branding)
    * [func SetBranding(u *schema.Branding)](#SetBranding)


## <a id="var" href="#var">Variables</a>

### <a id="externalURLWatchers" href="#externalURLWatchers">var externalURLWatchers</a>

```
searchKey: globals.externalURLWatchers
tags: [private]
```

```Go
var externalURLWatchers uint32
```

### <a id="defaultexternalURL" href="#defaultexternalURL">var defaultexternalURL</a>

```
searchKey: globals.defaultexternalURL
tags: [private]
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
tags: [private]
```

```Go
var externalURL = ...
```

### <a id="defaultPermissionsUserMapping" href="#defaultPermissionsUserMapping">var defaultPermissionsUserMapping</a>

```
searchKey: globals.defaultPermissionsUserMapping
tags: [private]
```

```Go
var defaultPermissionsUserMapping = ...
```

### <a id="permissionsUserMapping" href="#permissionsUserMapping">var permissionsUserMapping</a>

```
searchKey: globals.permissionsUserMapping
tags: [private]
```

```Go
var permissionsUserMapping = ...
```

permissionsUserMapping mirrors the value of `permissions.userMapping` in the site configuration. This variable is used to monitor configuration change via conf.Watch and must be operated atomically. 

### <a id="permissionsUserMappingWatchers" href="#permissionsUserMappingWatchers">var permissionsUserMappingWatchers</a>

```
searchKey: globals.permissionsUserMappingWatchers
tags: [private]
```

```Go
var permissionsUserMappingWatchers uint32
```

### <a id="defaultBranding" href="#defaultBranding">var defaultBranding</a>

```
searchKey: globals.defaultBranding
tags: [private]
```

```Go
var defaultBranding = &schema.Branding{
	BrandName: "Sourcegraph",
}
```

### <a id="branding" href="#branding">var branding</a>

```
searchKey: globals.branding
tags: [private]
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
tags: [private]
```

```Go
var brandingWatchers uint32
```

### <a id="ConfigurationServerFrontendOnly" href="#ConfigurationServerFrontendOnly">var ConfigurationServerFrontendOnly</a>

```
searchKey: globals.ConfigurationServerFrontendOnly
```

```Go
var ConfigurationServerFrontendOnly *conf.Server
```

ConfigurationServerFrontendOnly provides the contents of the site configuration to other services and manages modifications to it. 

Any another service that attempts to use this variable will panic. 

## <a id="func" href="#func">Functions</a>

### <a id="WatchExternalURL" href="#WatchExternalURL">func WatchExternalURL(defaultURL *url.URL)</a>

```
searchKey: globals.WatchExternalURL
```

```Go
func WatchExternalURL(defaultURL *url.URL)
```

WatchExternalURL watches for changes in the `externalURL` site configuration so that changes are reflected in what is returned by the ExternalURL function. In case the setting is not set, defaultURL is used. This should only be called once and will panic otherwise. 

### <a id="ExternalURL" href="#ExternalURL">func ExternalURL() *url.URL</a>

```
searchKey: globals.ExternalURL
```

```Go
func ExternalURL() *url.URL
```

ExternalURL returns the fully-resolved, externally accessible frontend URL. Callers must not mutate the returned pointer. 

### <a id="SetExternalURL" href="#SetExternalURL">func SetExternalURL(u *url.URL)</a>

```
searchKey: globals.SetExternalURL
```

```Go
func SetExternalURL(u *url.URL)
```

SetExternalURL sets the fully-resolved, externally accessible frontend URL. 

### <a id="WatchPermissionsUserMapping" href="#WatchPermissionsUserMapping">func WatchPermissionsUserMapping()</a>

```
searchKey: globals.WatchPermissionsUserMapping
```

```Go
func WatchPermissionsUserMapping()
```

WatchPermissionsUserMapping watches for changes in the `permissions.userMapping` site configuration so that changes are reflected in what is returned by the PermissionsUserMapping function. This should only be called once and will panic otherwise. 

### <a id="PermissionsUserMapping" href="#PermissionsUserMapping">func PermissionsUserMapping() *schema.PermissionsUserMapping</a>

```
searchKey: globals.PermissionsUserMapping
```

```Go
func PermissionsUserMapping() *schema.PermissionsUserMapping
```

PermissionsUserMapping returns the last valid value of permissions user mapping in the site configuration. Callers must not mutate the returned pointer. 

### <a id="SetPermissionsUserMapping" href="#SetPermissionsUserMapping">func SetPermissionsUserMapping(u *schema.PermissionsUserMapping)</a>

```
searchKey: globals.SetPermissionsUserMapping
```

```Go
func SetPermissionsUserMapping(u *schema.PermissionsUserMapping)
```

SetPermissionsUserMapping sets a valid value for the permissions user mapping. 

### <a id="WatchBranding" href="#WatchBranding">func WatchBranding(licenseChecker func() error)</a>

```
searchKey: globals.WatchBranding
```

```Go
func WatchBranding(licenseChecker func() error)
```

WatchBranding watches for changes in the `branding` site configuration so that changes are reflected in what is returned by the Branding function. This should only be called once and will panic otherwise. 

### <a id="Branding" href="#Branding">func Branding() *schema.Branding</a>

```
searchKey: globals.Branding
```

```Go
func Branding() *schema.Branding
```

Branding returns the last valid value of branding in the site configuration. Callers must not mutate the returned pointer. 

### <a id="SetBranding" href="#SetBranding">func SetBranding(u *schema.Branding)</a>

```
searchKey: globals.SetBranding
```

```Go
func SetBranding(u *schema.Branding)
```

SetBranding sets a valid value for the branding. 

