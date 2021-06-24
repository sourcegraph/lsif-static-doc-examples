# Package providers

## Index

* [Variables](#var)
    * [var MockProviders](#MockProviders)
    * [var curProviders](#curProviders)
    * [var curProvidersMu](#curProvidersMu)
* [Types](#type)
    * [type ConfigID struct](#ConfigID)
    * [type Info struct](#Info)
    * [type Provider interface](#Provider)
        * [func GetProviderByConfigID(id ConfigID) Provider](#GetProviderByConfigID)
    * [type sortProviders []providers.Provider](#sortProviders)
        * [func (p sortProviders) Len() int](#sortProviders.Len)
        * [func (p sortProviders) Less(i, j int) bool](#sortProviders.Less)
        * [func (p sortProviders) Swap(i, j int)](#sortProviders.Swap)
* [Functions](#func)
    * [func BuiltinAuthEnabled() bool](#BuiltinAuthEnabled)
    * [func Providers() []Provider](#Providers)
    * [func Update(pkgName string, providers []Provider)](#Update)


## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="MockProviders" href="#MockProviders">var MockProviders</a>

```
searchKey: providers.MockProviders
tags: [variable array interface]
```

```Go
var MockProviders []Provider
```

### <a id="curProviders" href="#curProviders">var curProviders</a>

```
searchKey: providers.curProviders
tags: [variable object private]
```

```Go
var curProviders = map[string]map[string]Provider{}
```

curProviders is a map (package name -> (config string -> Provider)). The first key is the package name under which the provider was registered (this should be unique among packages). The second key is the normalized JSON serialization of Provider.Config().  We keep track of providers by package, so that when a given package updates its set of registered providers, we can easily remove its providers that are no longer present. 

### <a id="curProvidersMu" href="#curProvidersMu">var curProvidersMu</a>

```
searchKey: providers.curProvidersMu
tags: [variable struct private]
```

```Go
var curProvidersMu sync.RWMutex
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="ConfigID" href="#ConfigID">type ConfigID struct</a>

```
searchKey: providers.ConfigID
tags: [struct]
```

```Go
type ConfigID struct {
	// Type is the type of this auth provider (equal to its "type" property in its entry in the
	// auth.providers array in site configuration).
	Type string

	// ID is an identifier that uniquely represents a provider's config among all other provider
	// configs of the same type.
	//
	// This value MUST NOT be persisted or used to associate accounts with this provider because it
	// can change when any property in this provider's config changes, even when those changes are
	// not material for identification (such as changing the display name).
	//
	// 🚨 SECURITY: This MUST NOT contain secret information because it is shown to unauthenticated
	// and anonymous clients.
	ID string
}
```

ConfigID identifies a provider config object in the auth.providers site configuration array. 

🚨 SECURITY: This MUST NOT contain secret information because it is shown to unauthenticated and anonymous clients. 

### <a id="Info" href="#Info">type Info struct</a>

```
searchKey: providers.Info
tags: [struct]
```

```Go
type Info struct {
	// ServiceID identifies the external service that this authentication provider represents. It is
	// a stable identifier.
	ServiceID string

	// ClientID identifies the external service client used when communicating with the external
	// service. It is a stable identifier.
	ClientID string

	// DisplayName is the name to use when displaying the provider in the UI.
	DisplayName string

	// AuthenticationURL is the URL to visit in order to initiate authenticating via this provider.
	AuthenticationURL string
}
```

Info contains information about an authentication provider. 

### <a id="Provider" href="#Provider">type Provider interface</a>

```
searchKey: providers.Provider
tags: [interface]
```

```Go
type Provider interface {
	// ConfigID returns the identifier for this provider's config in the auth.providers site
	// configuration array.
	//
	// 🚨 SECURITY: This MUST NOT contain secret information because it is shown to unauthenticated
	// and anonymous clients.
	ConfigID() ConfigID

	// Config is the entry in the site configuration "auth.providers" array that this provider
	// represents.
	//
	// 🚨 SECURITY: This value contains secret information that must not be shown to
	// non-site-admins.
	Config() schema.AuthProviders

	// CachedInfo returns cached information about the provider.
	CachedInfo() *Info

	// Refresh refreshes the provider's information with an external service, if any.
	Refresh(ctx context.Context) error
}
```

A Provider represents a user authentication provider (which provides functionality related to signing in and signing up, user identity, etc.) that is present in the site configuration "auth.providers" array. 

An authentication provider implementation can have multiple Provider instances. For example, a site may support OpenID Connect authentication either via Google Workspace or Okta, each of which would be represented by its own Provider instance. 

#### <a id="GetProviderByConfigID" href="#GetProviderByConfigID">func GetProviderByConfigID(id ConfigID) Provider</a>

```
searchKey: providers.GetProviderByConfigID
tags: [method]
```

```Go
func GetProviderByConfigID(id ConfigID) Provider
```

### <a id="sortProviders" href="#sortProviders">type sortProviders []providers.Provider</a>

```
searchKey: providers.sortProviders
tags: [array interface private]
```

```Go
type sortProviders []Provider
```

#### <a id="sortProviders.Len" href="#sortProviders.Len">func (p sortProviders) Len() int</a>

```
searchKey: providers.sortProviders.Len
tags: [function private]
```

```Go
func (p sortProviders) Len() int
```

#### <a id="sortProviders.Less" href="#sortProviders.Less">func (p sortProviders) Less(i, j int) bool</a>

```
searchKey: providers.sortProviders.Less
tags: [method private]
```

```Go
func (p sortProviders) Less(i, j int) bool
```

Less puts the builtin provider first and sorts the others alphabetically by type and then ID. 

#### <a id="sortProviders.Swap" href="#sortProviders.Swap">func (p sortProviders) Swap(i, j int)</a>

```
searchKey: providers.sortProviders.Swap
tags: [method private]
```

```Go
func (p sortProviders) Swap(i, j int)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BuiltinAuthEnabled" href="#BuiltinAuthEnabled">func BuiltinAuthEnabled() bool</a>

```
searchKey: providers.BuiltinAuthEnabled
tags: [function]
```

```Go
func BuiltinAuthEnabled() bool
```

### <a id="Providers" href="#Providers">func Providers() []Provider</a>

```
searchKey: providers.Providers
tags: [function]
```

```Go
func Providers() []Provider
```

Providers returns the set of currently registered authentication providers. When no providers are registered, returns nil (and sign-in is effectively disabled). 

### <a id="Update" href="#Update">func Update(pkgName string, providers []Provider)</a>

```
searchKey: providers.Update
tags: [method]
```

```Go
func Update(pkgName string, providers []Provider)
```

Update updates the set of active authentication provider instances. It replaces the current set of Providers under the specified pkgName with the new set. 

