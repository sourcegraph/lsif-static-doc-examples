# Package api

Package api contains a partial implementation of the extension registry. 

## Index

* [Constants](#const)
    * [const WorkInProgressExtensionTitlePostgreSQLPattern](#WorkInProgressExtensionTitlePostgreSQLPattern)
* [Variables](#var)
    * [var CountLocalRegistryExtensions](#CountLocalRegistryExtensions)
    * [var ExtensionRegistry](#ExtensionRegistry)
    * [var ExtensionURL](#ExtensionURL)
    * [var FilterRemoteExtensions](#FilterRemoteExtensions)
    * [var GetLocalExtensionByExtensionID](#GetLocalExtensionByExtensionID)
    * [var GetLocalFeaturedExtensions](#GetLocalFeaturedExtensions)
    * [var HandleRegistry](#HandleRegistry)
    * [var HandleRegistryExtensionBundle](#HandleRegistryExtensionBundle)
    * [var IsRemoteExtensionAllowed](#IsRemoteExtensionAllowed)
    * [var ListLocalRegistryExtensions](#ListLocalRegistryExtensions)
    * [var PublisherExtensionsURL](#PublisherExtensionsURL)
    * [var RegistryExtensionByIDInt32](#RegistryExtensionByIDInt32)
    * [var RegistryPublisherByID](#RegistryPublisherByID)
    * [var errNoLocalExtensionRegistry](#errNoLocalExtensionRegistry)
    * [var mockGetRemoteRegistryExtension](#mockGetRemoteRegistryExtension)
    * [var mockLocalRegistryExtensionIDPrefix](#mockLocalRegistryExtensionIDPrefix)
    * [var strnilptr](#strnilptr)
* [Types](#type)
    * [type ExtensionRegistryMutationResult struct](#ExtensionRegistryMutationResult)
        * [func (r *ExtensionRegistryMutationResult) Extension(ctx context.Context) (graphqlbackend.RegistryExtension, error)](#ExtensionRegistryMutationResult.Extension)
    * [type RegistryExtensionID struct](#RegistryExtensionID)
        * [func UnmarshalRegistryExtensionID(id graphql.ID) (registryExtensionID RegistryExtensionID, err error)](#UnmarshalRegistryExtensionID)
    * [type extensionManifest struct](#extensionManifest)
        * [func (r *extensionManifest) BundleURL() (*string, error)](#extensionManifest.BundleURL)
        * [func (r *extensionManifest) Description() (*string, error)](#extensionManifest.Description)
        * [func (r *extensionManifest) Raw() string](#extensionManifest.Raw)
        * [func (r *extensionManifest) parse() (*schema.SourcegraphExtensionManifest, error)](#extensionManifest.parse)
    * [type extensionRegistryResolver struct](#extensionRegistryResolver)
        * [func (r *extensionRegistryResolver) CreateExtension(ctx context.Context, args *graphqlbackend.ExtensionRegistryCreateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)](#extensionRegistryResolver.CreateExtension)
        * [func (r *extensionRegistryResolver) DeleteExtension(ctx context.Context, args *graphqlbackend.ExtensionRegistryDeleteExtensionArgs) (*graphqlbackend.EmptyResponse, error)](#extensionRegistryResolver.DeleteExtension)
        * [func (r *extensionRegistryResolver) Extension(ctx context.Context, args *graphqlbackend.ExtensionRegistryExtensionArgs) (graphqlbackend.RegistryExtension, error)](#extensionRegistryResolver.Extension)
        * [func (r *extensionRegistryResolver) Extensions(ctx context.Context, args *graphqlbackend.RegistryExtensionConnectionArgs) (graphqlbackend.RegistryExtensionConnection, error)](#extensionRegistryResolver.Extensions)
        * [func (r *extensionRegistryResolver) FeaturedExtensions(ctx context.Context) (graphqlbackend.FeaturedExtensionsConnection, error)](#extensionRegistryResolver.FeaturedExtensions)
        * [func (r *extensionRegistryResolver) FilterRemoteExtensions(ids []string) []string](#extensionRegistryResolver.FilterRemoteExtensions)
        * [func (r *extensionRegistryResolver) ImplementsLocalExtensionRegistry() bool](#extensionRegistryResolver.ImplementsLocalExtensionRegistry)
        * [func (*extensionRegistryResolver) LocalExtensionIDPrefix() *string](#extensionRegistryResolver.LocalExtensionIDPrefix)
        * [func (r *extensionRegistryResolver) PublishExtension(ctx context.Context, args *graphqlbackend.ExtensionRegistryPublishExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)](#extensionRegistryResolver.PublishExtension)
        * [func (r *extensionRegistryResolver) Publishers(ctx context.Context, args *graphqlutil.ConnectionArgs) (graphqlbackend.RegistryPublisherConnection, error)](#extensionRegistryResolver.Publishers)
        * [func (r *extensionRegistryResolver) UpdateExtension(ctx context.Context, args *graphqlbackend.ExtensionRegistryUpdateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)](#extensionRegistryResolver.UpdateExtension)
        * [func (r *extensionRegistryResolver) ViewerPublishers(ctx context.Context) ([]graphqlbackend.RegistryPublisher, error)](#extensionRegistryResolver.ViewerPublishers)
    * [type featuredExtensionsResolver struct](#featuredExtensionsResolver)
        * [func (r *featuredExtensionsResolver) Error(ctx context.Context) *string](#featuredExtensionsResolver.Error)
        * [func (r *featuredExtensionsResolver) Nodes(ctx context.Context) ([]graphqlbackend.RegistryExtension, error)](#featuredExtensionsResolver.Nodes)
        * [func (r *featuredExtensionsResolver) compute(ctx context.Context) ([]graphqlbackend.RegistryExtension, error)](#featuredExtensionsResolver.compute)
    * [type mockRegistryExtension struct](#mockRegistryExtension)
    * [type registryExtensionConnectionResolver struct](#registryExtensionConnectionResolver)
        * [func (r *registryExtensionConnectionResolver) Error(ctx context.Context) *string](#registryExtensionConnectionResolver.Error)
        * [func (r *registryExtensionConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.RegistryExtension, error)](#registryExtensionConnectionResolver.Nodes)
        * [func (r *registryExtensionConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#registryExtensionConnectionResolver.PageInfo)
        * [func (r *registryExtensionConnectionResolver) TotalCount(ctx context.Context) (int32, error)](#registryExtensionConnectionResolver.TotalCount)
        * [func (r *registryExtensionConnectionResolver) URL(ctx context.Context) (*string, error)](#registryExtensionConnectionResolver.URL)
        * [func (r *registryExtensionConnectionResolver) compute(ctx context.Context) ([]graphqlbackend.RegistryExtension, error)](#registryExtensionConnectionResolver.compute)
    * [type registryExtensionRemoteID struct](#registryExtensionRemoteID)
    * [type registryExtensionRemoteResolver struct](#registryExtensionRemoteResolver)
        * [func (r *registryExtensionRemoteResolver) CreatedAt() *graphqlbackend.DateTime](#registryExtensionRemoteResolver.CreatedAt)
        * [func (r *registryExtensionRemoteResolver) ExtensionID() string](#registryExtensionRemoteResolver.ExtensionID)
        * [func (r *registryExtensionRemoteResolver) ExtensionIDWithoutRegistry() string](#registryExtensionRemoteResolver.ExtensionIDWithoutRegistry)
        * [func (r *registryExtensionRemoteResolver) ID() graphql.ID](#registryExtensionRemoteResolver.ID)
        * [func (r *registryExtensionRemoteResolver) IsLocal() bool](#registryExtensionRemoteResolver.IsLocal)
        * [func (r *registryExtensionRemoteResolver) IsWorkInProgress() bool](#registryExtensionRemoteResolver.IsWorkInProgress)
        * [func (r *registryExtensionRemoteResolver) Manifest(context.Context) (graphqlbackend.ExtensionManifest, error)](#registryExtensionRemoteResolver.Manifest)
        * [func (r *registryExtensionRemoteResolver) Name() string](#registryExtensionRemoteResolver.Name)
        * [func (r *registryExtensionRemoteResolver) PublishedAt(context.Context) (*graphqlbackend.DateTime, error)](#registryExtensionRemoteResolver.PublishedAt)
        * [func (r *registryExtensionRemoteResolver) Publisher(ctx context.Context) (graphqlbackend.RegistryPublisher, error)](#registryExtensionRemoteResolver.Publisher)
        * [func (r *registryExtensionRemoteResolver) RegistryName() (string, error)](#registryExtensionRemoteResolver.RegistryName)
        * [func (r *registryExtensionRemoteResolver) RemoteURL() *string](#registryExtensionRemoteResolver.RemoteURL)
        * [func (r *registryExtensionRemoteResolver) URL() string](#registryExtensionRemoteResolver.URL)
        * [func (r *registryExtensionRemoteResolver) UUID() string](#registryExtensionRemoteResolver.UUID)
        * [func (r *registryExtensionRemoteResolver) UpdatedAt() *graphqlbackend.DateTime](#registryExtensionRemoteResolver.UpdatedAt)
        * [func (r *registryExtensionRemoteResolver) ViewerCanAdminister(ctx context.Context) (bool, error)](#registryExtensionRemoteResolver.ViewerCanAdminister)
* [Functions](#func)
    * [func FilterRegistryExtensions(extensions []*registry.Extension, query string) []*registry.Extension](#FilterRegistryExtensions)
    * [func FindRegistryExtension(extensions []*registry.Extension, field, value string) *registry.Extension](#FindRegistryExtension)
    * [func GetExtensionByExtensionID(ctx context.Context, db dbutil.DB, extensionID string) (local graphqlbackend.RegistryExtension, remote *registry.Extension, err error)](#GetExtensionByExtensionID)
    * [func GetFeaturedExtensions(ctx context.Context, db dbutil.DB) ([]graphqlbackend.RegistryExtension, error)](#GetFeaturedExtensions)
    * [func GetLocalRegistryExtensionIDPrefix() *string](#GetLocalRegistryExtensionIDPrefix)
    * [func IsWorkInProgressExtension(manifest *string) bool](#IsWorkInProgressExtension)
    * [func MarshalRegistryExtensionID(id RegistryExtensionID) graphql.ID](#MarshalRegistryExtensionID)
    * [func NewExtensionManifest(raw *string) graphqlbackend.ExtensionManifest](#NewExtensionManifest)
    * [func ParseExtensionID(extensionID string) (prefix, extensionIDWithoutPrefix string, isLocal bool, err error)](#ParseExtensionID)
    * [func SplitExtensionID(extensionID string) (prefix, publisher, name string, err error)](#SplitExtensionID)
    * [func TestGetExtensionByExtensionID(t *testing.T)](#TestGetExtensionByExtensionID)
    * [func TestIsWorkInProgressExtension(t *testing.T)](#TestIsWorkInProgressExtension)
    * [func TestParseExtensionID(t *testing.T)](#TestParseExtensionID)
    * [func TestSplitExtensionID(t *testing.T)](#TestSplitExtensionID)
    * [func getExtensionByExtensionID(ctx context.Context, db dbutil.DB, extensionID string) (graphqlbackend.RegistryExtension, error)](#getExtensionByExtensionID)
    * [func getLocalRegistryName() string](#getLocalRegistryName)
    * [func getRemoteRegistryExtension(ctx context.Context, field, value string) (*registry.Extension, error)](#getRemoteRegistryExtension)
    * [func getRemoteRegistryURL() (*url.URL, error)](#getRemoteRegistryURL)
    * [func init()](#init.extension_graphql.go)
    * [func init()](#init.registry_graphql.go)
    * [func listRemoteRegistryExtensions(ctx context.Context, query string) ([]*registry.Extension, error)](#listRemoteRegistryExtensions)
    * [func makePrioritizeExtensionIDsSet(args graphqlbackend.RegistryExtensionConnectionArgs) map[string]struct{}](#makePrioritizeExtensionIDsSet)
    * [func registryExtensionByID(ctx context.Context, db dbutil.DB, id graphql.ID) (graphqlbackend.RegistryExtension, error)](#registryExtensionByID)
    * [func strptr(s string) *string](#strptr)
    * [func strptrptr(s string) **string](#strptrptr)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="WorkInProgressExtensionTitlePostgreSQLPattern" href="#WorkInProgressExtensionTitlePostgreSQLPattern">const WorkInProgressExtensionTitlePostgreSQLPattern</a>

```
searchKey: api.WorkInProgressExtensionTitlePostgreSQLPattern
tags: [constant string]
```

```Go
const WorkInProgressExtensionTitlePostgreSQLPattern = `(\[WIP]|WIP:)%`
```

WorkInProgressExtensionTitlePostgreSQLPattern is the PostgreSQL "SIMILAR TO" pattern that matches the extension manifest's "title" property. See [https://www.postgresql.org/docs/9.3/functions-matching.html](https://www.postgresql.org/docs/9.3/functions-matching.html). 

NOTE: Keep this pattern in sync with IsWorkInProgressExtension. 

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="CountLocalRegistryExtensions" href="#CountLocalRegistryExtensions">var CountLocalRegistryExtensions</a>

```
searchKey: api.CountLocalRegistryExtensions
tags: [variable function]
```

```Go
var CountLocalRegistryExtensions func(context.Context, dbutil.DB, graphqlbackend.RegistryExtensionConnectionArgs) (int, error) = ...
```

CountLocalRegistryExtensions returns the count of local registry extensions according to the args. Pagination-related args are ignored. If there is no local extension registry, it is not implemented. 

### <a id="ExtensionRegistry" href="#ExtensionRegistry">var ExtensionRegistry</a>

```
searchKey: api.ExtensionRegistry
tags: [variable struct]
```

```Go
var ExtensionRegistry extensionRegistryResolver
```

ExtensionRegistry is the implementation of the GraphQL types ExtensionRegistry and ExtensionRegistryMutation. 

To supply implementations of extension registry functionality, use the fields on this value of extensionRegistryResolver. 

### <a id="ExtensionURL" href="#ExtensionURL">var ExtensionURL</a>

```
searchKey: api.ExtensionURL
tags: [variable function]
```

```Go
var ExtensionURL = router.Extension
```

ExtensionURL returns the URL path to an extension. 

### <a id="FilterRemoteExtensions" href="#FilterRemoteExtensions">var FilterRemoteExtensions</a>

```
searchKey: api.FilterRemoteExtensions
tags: [variable function]
```

```Go
var FilterRemoteExtensions = ...
```

FilterRemoteExtensions is called to filter the list of extensions retrieved from the remote registry before the list is used by any other part of the application. 

It can be overridden to use custom logic. 

### <a id="GetLocalExtensionByExtensionID" href="#GetLocalExtensionByExtensionID">var GetLocalExtensionByExtensionID</a>

```
searchKey: api.GetLocalExtensionByExtensionID
tags: [variable function]
```

```Go
var GetLocalExtensionByExtensionID func(ctx context.Context, db dbutil.DB, extensionIDWithoutPrefix string) (local graphqlbackend.RegistryExtension, err error) = ...
```

GetLocalExtensionByExtensionID looks up and returns the registry extension in the local registry with the given extension ID. If there is no local extension registry, it is not implemented. 

### <a id="GetLocalFeaturedExtensions" href="#GetLocalFeaturedExtensions">var GetLocalFeaturedExtensions</a>

```
searchKey: api.GetLocalFeaturedExtensions
tags: [variable function]
```

```Go
var GetLocalFeaturedExtensions func(ctx context.Context, db dbutil.DB) ([]graphqlbackend.RegistryExtension, error) = ...
```

GetLocalFeaturedExtensions looks up and returns the featured registry extensions in the local registry If this is not sourcegraph.com, it is not implemented. 

### <a id="HandleRegistry" href="#HandleRegistry">var HandleRegistry</a>

```
searchKey: api.HandleRegistry
tags: [variable function]
```

```Go
var HandleRegistry = ...
```

HandleRegistry is called to handle HTTP requests for the extension registry. If there is no local extension registry, it returns an HTTP error response. 

### <a id="HandleRegistryExtensionBundle" href="#HandleRegistryExtensionBundle">var HandleRegistryExtensionBundle</a>

```
searchKey: api.HandleRegistryExtensionBundle
tags: [variable function]
```

```Go
var HandleRegistryExtensionBundle = ...
```

HandleRegistryExtensionBundle is called to handle HTTP requests for an extension's JavaScript bundle and other assets. If there is no local extension registry, it returns an HTTP error response. 

### <a id="IsRemoteExtensionAllowed" href="#IsRemoteExtensionAllowed">var IsRemoteExtensionAllowed</a>

```
searchKey: api.IsRemoteExtensionAllowed
tags: [variable function]
```

```Go
var IsRemoteExtensionAllowed = func(extensionID string) bool {

	return true
}
```

IsRemoteExtensionAllowed reports whether to allow usage of the remote extension with the given extension ID. 

It can be overridden to use custom logic. 

### <a id="ListLocalRegistryExtensions" href="#ListLocalRegistryExtensions">var ListLocalRegistryExtensions</a>

```
searchKey: api.ListLocalRegistryExtensions
tags: [variable function]
```

```Go
var ListLocalRegistryExtensions func(context.Context, dbutil.DB, graphqlbackend.RegistryExtensionConnectionArgs) ([]graphqlbackend.RegistryExtension, error) = ...
```

ListLocalRegistryExtensions lists and returns local registry extensions according to the args. If there is no local extension registry, it is not implemented. 

### <a id="PublisherExtensionsURL" href="#PublisherExtensionsURL">var PublisherExtensionsURL</a>

```
searchKey: api.PublisherExtensionsURL
tags: [variable function]
```

```Go
var PublisherExtensionsURL = router.RegistryPublisherExtensions
```

PublisherExtensionsURL returns the URL path to a publisher's extensions. 

### <a id="RegistryExtensionByIDInt32" href="#RegistryExtensionByIDInt32">var RegistryExtensionByIDInt32</a>

```
searchKey: api.RegistryExtensionByIDInt32
tags: [variable function]
```

```Go
var RegistryExtensionByIDInt32 func(context.Context, dbutil.DB, int32) (graphqlbackend.RegistryExtension, error) = ...
```

RegistryExtensionByIDInt32 looks up and returns the registry extension in the database with the given ID. If no such extension exists, an error is returned. The func is nil when there is no local registry. 

### <a id="RegistryPublisherByID" href="#RegistryPublisherByID">var RegistryPublisherByID</a>

```
searchKey: api.RegistryPublisherByID
tags: [variable function]
```

```Go
var RegistryPublisherByID func(context.Context, graphql.ID) (graphqlbackend.RegistryPublisher, error) = ...
```

RegistryPublisherByID looks up and returns the registry publisher by GraphQL ID. If there is no local registry, it is not implemented. 

### <a id="errNoLocalExtensionRegistry" href="#errNoLocalExtensionRegistry">var errNoLocalExtensionRegistry</a>

```
searchKey: api.errNoLocalExtensionRegistry
tags: [variable interface private]
```

```Go
var errNoLocalExtensionRegistry = errors.New("no local extension registry exists")
```

### <a id="mockGetRemoteRegistryExtension" href="#mockGetRemoteRegistryExtension">var mockGetRemoteRegistryExtension</a>

```
searchKey: api.mockGetRemoteRegistryExtension
tags: [variable function private]
```

```Go
var mockGetRemoteRegistryExtension func(field, value string) (*registry.Extension, error)
```

### <a id="mockLocalRegistryExtensionIDPrefix" href="#mockLocalRegistryExtensionIDPrefix">var mockLocalRegistryExtensionIDPrefix</a>

```
searchKey: api.mockLocalRegistryExtensionIDPrefix
tags: [variable string private]
```

```Go
var mockLocalRegistryExtensionIDPrefix **string
```

### <a id="strnilptr" href="#strnilptr">var strnilptr</a>

```
searchKey: api.strnilptr
tags: [variable string private]
```

```Go
var strnilptr *string
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="ExtensionRegistryMutationResult" href="#ExtensionRegistryMutationResult">type ExtensionRegistryMutationResult struct</a>

```
searchKey: api.ExtensionRegistryMutationResult
tags: [struct]
```

```Go
type ExtensionRegistryMutationResult struct {
	ID int32 // this is only used for local extensions, so it's OK that this only accepts a local extension ID
	DB dbutil.DB
}
```

#### <a id="ExtensionRegistryMutationResult.Extension" href="#ExtensionRegistryMutationResult.Extension">func (r *ExtensionRegistryMutationResult) Extension(ctx context.Context) (graphqlbackend.RegistryExtension, error)</a>

```
searchKey: api.ExtensionRegistryMutationResult.Extension
tags: [method]
```

```Go
func (r *ExtensionRegistryMutationResult) Extension(ctx context.Context) (graphqlbackend.RegistryExtension, error)
```

### <a id="RegistryExtensionID" href="#RegistryExtensionID">type RegistryExtensionID struct</a>

```
searchKey: api.RegistryExtensionID
tags: [struct]
```

```Go
type RegistryExtensionID struct {
	LocalID  int32                      `json:"l,omitempty"`
	RemoteID *registryExtensionRemoteID `json:"r,omitempty"`
}
```

RegistryExtensionID identifies a registry extension, either locally or on a remote registry. Exactly 1 field must be set. 

#### <a id="UnmarshalRegistryExtensionID" href="#UnmarshalRegistryExtensionID">func UnmarshalRegistryExtensionID(id graphql.ID) (registryExtensionID RegistryExtensionID, err error)</a>

```
searchKey: api.UnmarshalRegistryExtensionID
tags: [method]
```

```Go
func UnmarshalRegistryExtensionID(id graphql.ID) (registryExtensionID RegistryExtensionID, err error)
```

### <a id="extensionManifest" href="#extensionManifest">type extensionManifest struct</a>

```
searchKey: api.extensionManifest
tags: [struct private]
```

```Go
type extensionManifest struct {
	raw string

	// cache result because it is used by multiple fields
	once   sync.Once
	result *schema.SourcegraphExtensionManifest
	err    error
}
```

extensionManifest implements the GraphQL type ExtensionManifest. 

#### <a id="extensionManifest.BundleURL" href="#extensionManifest.BundleURL">func (r *extensionManifest) BundleURL() (*string, error)</a>

```
searchKey: api.extensionManifest.BundleURL
tags: [function private]
```

```Go
func (r *extensionManifest) BundleURL() (*string, error)
```

#### <a id="extensionManifest.Description" href="#extensionManifest.Description">func (r *extensionManifest) Description() (*string, error)</a>

```
searchKey: api.extensionManifest.Description
tags: [function private]
```

```Go
func (r *extensionManifest) Description() (*string, error)
```

#### <a id="extensionManifest.Raw" href="#extensionManifest.Raw">func (r *extensionManifest) Raw() string</a>

```
searchKey: api.extensionManifest.Raw
tags: [function private]
```

```Go
func (r *extensionManifest) Raw() string
```

#### <a id="extensionManifest.parse" href="#extensionManifest.parse">func (r *extensionManifest) parse() (*schema.SourcegraphExtensionManifest, error)</a>

```
searchKey: api.extensionManifest.parse
tags: [function private]
```

```Go
func (r *extensionManifest) parse() (*schema.SourcegraphExtensionManifest, error)
```

### <a id="extensionRegistryResolver" href="#extensionRegistryResolver">type extensionRegistryResolver struct</a>

```
searchKey: api.extensionRegistryResolver
tags: [struct private]
```

```Go
type extensionRegistryResolver struct {
	db                   dbutil.DB
	ViewerPublishersFunc func(context.Context, dbutil.DB) ([]graphqlbackend.RegistryPublisher, error)
	PublishersFunc       func(context.Context, dbutil.DB, *graphqlutil.ConnectionArgs) (graphqlbackend.RegistryPublisherConnection, error)
	CreateExtensionFunc  func(context.Context, dbutil.DB, *graphqlbackend.ExtensionRegistryCreateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)
	UpdateExtensionFunc  func(context.Context, dbutil.DB, *graphqlbackend.ExtensionRegistryUpdateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)
	PublishExtensionFunc func(context.Context, dbutil.DB, *graphqlbackend.ExtensionRegistryPublishExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)
	DeleteExtensionFunc  func(context.Context, dbutil.DB, *graphqlbackend.ExtensionRegistryDeleteExtensionArgs) (*graphqlbackend.EmptyResponse, error)
}
```

extensionRegistryResolver implements the GraphQL types ExtensionRegistry and ExtensionRegistryMutation. 

Some methods are only implemented if there is a local extension registry. For these methods, the implementation (if one exists) is set on the XyzFunc struct field. 

#### <a id="extensionRegistryResolver.CreateExtension" href="#extensionRegistryResolver.CreateExtension">func (r *extensionRegistryResolver) CreateExtension(ctx context.Context, args *graphqlbackend.ExtensionRegistryCreateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)</a>

```
searchKey: api.extensionRegistryResolver.CreateExtension
tags: [method private]
```

```Go
func (r *extensionRegistryResolver) CreateExtension(ctx context.Context, args *graphqlbackend.ExtensionRegistryCreateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)
```

#### <a id="extensionRegistryResolver.DeleteExtension" href="#extensionRegistryResolver.DeleteExtension">func (r *extensionRegistryResolver) DeleteExtension(ctx context.Context, args *graphqlbackend.ExtensionRegistryDeleteExtensionArgs) (*graphqlbackend.EmptyResponse, error)</a>

```
searchKey: api.extensionRegistryResolver.DeleteExtension
tags: [method private]
```

```Go
func (r *extensionRegistryResolver) DeleteExtension(ctx context.Context, args *graphqlbackend.ExtensionRegistryDeleteExtensionArgs) (*graphqlbackend.EmptyResponse, error)
```

#### <a id="extensionRegistryResolver.Extension" href="#extensionRegistryResolver.Extension">func (r *extensionRegistryResolver) Extension(ctx context.Context, args *graphqlbackend.ExtensionRegistryExtensionArgs) (graphqlbackend.RegistryExtension, error)</a>

```
searchKey: api.extensionRegistryResolver.Extension
tags: [method private]
```

```Go
func (r *extensionRegistryResolver) Extension(ctx context.Context, args *graphqlbackend.ExtensionRegistryExtensionArgs) (graphqlbackend.RegistryExtension, error)
```

#### <a id="extensionRegistryResolver.Extensions" href="#extensionRegistryResolver.Extensions">func (r *extensionRegistryResolver) Extensions(ctx context.Context, args *graphqlbackend.RegistryExtensionConnectionArgs) (graphqlbackend.RegistryExtensionConnection, error)</a>

```
searchKey: api.extensionRegistryResolver.Extensions
tags: [method private]
```

```Go
func (r *extensionRegistryResolver) Extensions(ctx context.Context, args *graphqlbackend.RegistryExtensionConnectionArgs) (graphqlbackend.RegistryExtensionConnection, error)
```

#### <a id="extensionRegistryResolver.FeaturedExtensions" href="#extensionRegistryResolver.FeaturedExtensions">func (r *extensionRegistryResolver) FeaturedExtensions(ctx context.Context) (graphqlbackend.FeaturedExtensionsConnection, error)</a>

```
searchKey: api.extensionRegistryResolver.FeaturedExtensions
tags: [method private]
```

```Go
func (r *extensionRegistryResolver) FeaturedExtensions(ctx context.Context) (graphqlbackend.FeaturedExtensionsConnection, error)
```

#### <a id="extensionRegistryResolver.FilterRemoteExtensions" href="#extensionRegistryResolver.FilterRemoteExtensions">func (r *extensionRegistryResolver) FilterRemoteExtensions(ids []string) []string</a>

```
searchKey: api.extensionRegistryResolver.FilterRemoteExtensions
tags: [method private]
```

```Go
func (r *extensionRegistryResolver) FilterRemoteExtensions(ids []string) []string
```

#### <a id="extensionRegistryResolver.ImplementsLocalExtensionRegistry" href="#extensionRegistryResolver.ImplementsLocalExtensionRegistry">func (r *extensionRegistryResolver) ImplementsLocalExtensionRegistry() bool</a>

```
searchKey: api.extensionRegistryResolver.ImplementsLocalExtensionRegistry
tags: [function private]
```

```Go
func (r *extensionRegistryResolver) ImplementsLocalExtensionRegistry() bool
```

ImplementsLocalExtensionRegistry reports whether there is an implementation of a local extension registry (which is a Sourcegraph Enterprise feature). 

#### <a id="extensionRegistryResolver.LocalExtensionIDPrefix" href="#extensionRegistryResolver.LocalExtensionIDPrefix">func (*extensionRegistryResolver) LocalExtensionIDPrefix() *string</a>

```
searchKey: api.extensionRegistryResolver.LocalExtensionIDPrefix
tags: [function private]
```

```Go
func (*extensionRegistryResolver) LocalExtensionIDPrefix() *string
```

#### <a id="extensionRegistryResolver.PublishExtension" href="#extensionRegistryResolver.PublishExtension">func (r *extensionRegistryResolver) PublishExtension(ctx context.Context, args *graphqlbackend.ExtensionRegistryPublishExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)</a>

```
searchKey: api.extensionRegistryResolver.PublishExtension
tags: [method private]
```

```Go
func (r *extensionRegistryResolver) PublishExtension(ctx context.Context, args *graphqlbackend.ExtensionRegistryPublishExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)
```

#### <a id="extensionRegistryResolver.Publishers" href="#extensionRegistryResolver.Publishers">func (r *extensionRegistryResolver) Publishers(ctx context.Context, args *graphqlutil.ConnectionArgs) (graphqlbackend.RegistryPublisherConnection, error)</a>

```
searchKey: api.extensionRegistryResolver.Publishers
tags: [method private]
```

```Go
func (r *extensionRegistryResolver) Publishers(ctx context.Context, args *graphqlutil.ConnectionArgs) (graphqlbackend.RegistryPublisherConnection, error)
```

#### <a id="extensionRegistryResolver.UpdateExtension" href="#extensionRegistryResolver.UpdateExtension">func (r *extensionRegistryResolver) UpdateExtension(ctx context.Context, args *graphqlbackend.ExtensionRegistryUpdateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)</a>

```
searchKey: api.extensionRegistryResolver.UpdateExtension
tags: [method private]
```

```Go
func (r *extensionRegistryResolver) UpdateExtension(ctx context.Context, args *graphqlbackend.ExtensionRegistryUpdateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)
```

#### <a id="extensionRegistryResolver.ViewerPublishers" href="#extensionRegistryResolver.ViewerPublishers">func (r *extensionRegistryResolver) ViewerPublishers(ctx context.Context) ([]graphqlbackend.RegistryPublisher, error)</a>

```
searchKey: api.extensionRegistryResolver.ViewerPublishers
tags: [method private]
```

```Go
func (r *extensionRegistryResolver) ViewerPublishers(ctx context.Context) ([]graphqlbackend.RegistryPublisher, error)
```

### <a id="featuredExtensionsResolver" href="#featuredExtensionsResolver">type featuredExtensionsResolver struct</a>

```
searchKey: api.featuredExtensionsResolver
tags: [struct private]
```

```Go
type featuredExtensionsResolver struct {
	// cache results because they are used by multiple fields
	once sync.Once

	featuredExtensions []graphqlbackend.RegistryExtension
	err                error
	db                 dbutil.DB
}
```

#### <a id="featuredExtensionsResolver.Error" href="#featuredExtensionsResolver.Error">func (r *featuredExtensionsResolver) Error(ctx context.Context) *string</a>

```
searchKey: api.featuredExtensionsResolver.Error
tags: [method private]
```

```Go
func (r *featuredExtensionsResolver) Error(ctx context.Context) *string
```

#### <a id="featuredExtensionsResolver.Nodes" href="#featuredExtensionsResolver.Nodes">func (r *featuredExtensionsResolver) Nodes(ctx context.Context) ([]graphqlbackend.RegistryExtension, error)</a>

```
searchKey: api.featuredExtensionsResolver.Nodes
tags: [method private]
```

```Go
func (r *featuredExtensionsResolver) Nodes(ctx context.Context) ([]graphqlbackend.RegistryExtension, error)
```

#### <a id="featuredExtensionsResolver.compute" href="#featuredExtensionsResolver.compute">func (r *featuredExtensionsResolver) compute(ctx context.Context) ([]graphqlbackend.RegistryExtension, error)</a>

```
searchKey: api.featuredExtensionsResolver.compute
tags: [method private]
```

```Go
func (r *featuredExtensionsResolver) compute(ctx context.Context) ([]graphqlbackend.RegistryExtension, error)
```

### <a id="mockRegistryExtension" href="#mockRegistryExtension">type mockRegistryExtension struct</a>

```
searchKey: api.mockRegistryExtension
tags: [struct private]
```

```Go
type mockRegistryExtension struct {
	id   int32
	name string
	graphqlbackend.RegistryExtension
}
```

### <a id="registryExtensionConnectionResolver" href="#registryExtensionConnectionResolver">type registryExtensionConnectionResolver struct</a>

```
searchKey: api.registryExtensionConnectionResolver
tags: [struct private]
```

```Go
type registryExtensionConnectionResolver struct {
	args graphqlbackend.RegistryExtensionConnectionArgs

	// cache results because they are used by multiple fields
	once               sync.Once
	registryExtensions []graphqlbackend.RegistryExtension
	err                error
	db                 dbutil.DB
}
```

registryExtensionConnectionResolver resolves a list of registry extensions. 

#### <a id="registryExtensionConnectionResolver.Error" href="#registryExtensionConnectionResolver.Error">func (r *registryExtensionConnectionResolver) Error(ctx context.Context) *string</a>

```
searchKey: api.registryExtensionConnectionResolver.Error
tags: [method private]
```

```Go
func (r *registryExtensionConnectionResolver) Error(ctx context.Context) *string
```

#### <a id="registryExtensionConnectionResolver.Nodes" href="#registryExtensionConnectionResolver.Nodes">func (r *registryExtensionConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.RegistryExtension, error)</a>

```
searchKey: api.registryExtensionConnectionResolver.Nodes
tags: [method private]
```

```Go
func (r *registryExtensionConnectionResolver) Nodes(ctx context.Context) ([]graphqlbackend.RegistryExtension, error)
```

#### <a id="registryExtensionConnectionResolver.PageInfo" href="#registryExtensionConnectionResolver.PageInfo">func (r *registryExtensionConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: api.registryExtensionConnectionResolver.PageInfo
tags: [method private]
```

```Go
func (r *registryExtensionConnectionResolver) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="registryExtensionConnectionResolver.TotalCount" href="#registryExtensionConnectionResolver.TotalCount">func (r *registryExtensionConnectionResolver) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: api.registryExtensionConnectionResolver.TotalCount
tags: [method private]
```

```Go
func (r *registryExtensionConnectionResolver) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="registryExtensionConnectionResolver.URL" href="#registryExtensionConnectionResolver.URL">func (r *registryExtensionConnectionResolver) URL(ctx context.Context) (*string, error)</a>

```
searchKey: api.registryExtensionConnectionResolver.URL
tags: [method private]
```

```Go
func (r *registryExtensionConnectionResolver) URL(ctx context.Context) (*string, error)
```

#### <a id="registryExtensionConnectionResolver.compute" href="#registryExtensionConnectionResolver.compute">func (r *registryExtensionConnectionResolver) compute(ctx context.Context) ([]graphqlbackend.RegistryExtension, error)</a>

```
searchKey: api.registryExtensionConnectionResolver.compute
tags: [method private]
```

```Go
func (r *registryExtensionConnectionResolver) compute(ctx context.Context) ([]graphqlbackend.RegistryExtension, error)
```

### <a id="registryExtensionRemoteID" href="#registryExtensionRemoteID">type registryExtensionRemoteID struct</a>

```
searchKey: api.registryExtensionRemoteID
tags: [struct private]
```

```Go
type registryExtensionRemoteID struct {
	Registry string `json:"r"`
	UUID     string `json:"u"`
}
```

registryExtensionRemoteID identifies a registry extension on a remote registry. It is encoded in RegistryExtensionID. 

### <a id="registryExtensionRemoteResolver" href="#registryExtensionRemoteResolver">type registryExtensionRemoteResolver struct</a>

```
searchKey: api.registryExtensionRemoteResolver
tags: [struct private]
```

```Go
type registryExtensionRemoteResolver struct {
	v *registry.Extension
}
```

registryExtensionRemoteResolver implements the GraphQL type RegistryExtension with data from a remote registry. 

#### <a id="registryExtensionRemoteResolver.CreatedAt" href="#registryExtensionRemoteResolver.CreatedAt">func (r *registryExtensionRemoteResolver) CreatedAt() *graphqlbackend.DateTime</a>

```
searchKey: api.registryExtensionRemoteResolver.CreatedAt
tags: [function private]
```

```Go
func (r *registryExtensionRemoteResolver) CreatedAt() *graphqlbackend.DateTime
```

#### <a id="registryExtensionRemoteResolver.ExtensionID" href="#registryExtensionRemoteResolver.ExtensionID">func (r *registryExtensionRemoteResolver) ExtensionID() string</a>

```
searchKey: api.registryExtensionRemoteResolver.ExtensionID
tags: [function private]
```

```Go
func (r *registryExtensionRemoteResolver) ExtensionID() string
```

#### <a id="registryExtensionRemoteResolver.ExtensionIDWithoutRegistry" href="#registryExtensionRemoteResolver.ExtensionIDWithoutRegistry">func (r *registryExtensionRemoteResolver) ExtensionIDWithoutRegistry() string</a>

```
searchKey: api.registryExtensionRemoteResolver.ExtensionIDWithoutRegistry
tags: [function private]
```

```Go
func (r *registryExtensionRemoteResolver) ExtensionIDWithoutRegistry() string
```

#### <a id="registryExtensionRemoteResolver.ID" href="#registryExtensionRemoteResolver.ID">func (r *registryExtensionRemoteResolver) ID() graphql.ID</a>

```
searchKey: api.registryExtensionRemoteResolver.ID
tags: [function private]
```

```Go
func (r *registryExtensionRemoteResolver) ID() graphql.ID
```

#### <a id="registryExtensionRemoteResolver.IsLocal" href="#registryExtensionRemoteResolver.IsLocal">func (r *registryExtensionRemoteResolver) IsLocal() bool</a>

```
searchKey: api.registryExtensionRemoteResolver.IsLocal
tags: [function private]
```

```Go
func (r *registryExtensionRemoteResolver) IsLocal() bool
```

#### <a id="registryExtensionRemoteResolver.IsWorkInProgress" href="#registryExtensionRemoteResolver.IsWorkInProgress">func (r *registryExtensionRemoteResolver) IsWorkInProgress() bool</a>

```
searchKey: api.registryExtensionRemoteResolver.IsWorkInProgress
tags: [function private]
```

```Go
func (r *registryExtensionRemoteResolver) IsWorkInProgress() bool
```

#### <a id="registryExtensionRemoteResolver.Manifest" href="#registryExtensionRemoteResolver.Manifest">func (r *registryExtensionRemoteResolver) Manifest(context.Context) (graphqlbackend.ExtensionManifest, error)</a>

```
searchKey: api.registryExtensionRemoteResolver.Manifest
tags: [method private]
```

```Go
func (r *registryExtensionRemoteResolver) Manifest(context.Context) (graphqlbackend.ExtensionManifest, error)
```

#### <a id="registryExtensionRemoteResolver.Name" href="#registryExtensionRemoteResolver.Name">func (r *registryExtensionRemoteResolver) Name() string</a>

```
searchKey: api.registryExtensionRemoteResolver.Name
tags: [function private]
```

```Go
func (r *registryExtensionRemoteResolver) Name() string
```

#### <a id="registryExtensionRemoteResolver.PublishedAt" href="#registryExtensionRemoteResolver.PublishedAt">func (r *registryExtensionRemoteResolver) PublishedAt(context.Context) (*graphqlbackend.DateTime, error)</a>

```
searchKey: api.registryExtensionRemoteResolver.PublishedAt
tags: [method private]
```

```Go
func (r *registryExtensionRemoteResolver) PublishedAt(context.Context) (*graphqlbackend.DateTime, error)
```

#### <a id="registryExtensionRemoteResolver.Publisher" href="#registryExtensionRemoteResolver.Publisher">func (r *registryExtensionRemoteResolver) Publisher(ctx context.Context) (graphqlbackend.RegistryPublisher, error)</a>

```
searchKey: api.registryExtensionRemoteResolver.Publisher
tags: [method private]
```

```Go
func (r *registryExtensionRemoteResolver) Publisher(ctx context.Context) (graphqlbackend.RegistryPublisher, error)
```

#### <a id="registryExtensionRemoteResolver.RegistryName" href="#registryExtensionRemoteResolver.RegistryName">func (r *registryExtensionRemoteResolver) RegistryName() (string, error)</a>

```
searchKey: api.registryExtensionRemoteResolver.RegistryName
tags: [function private]
```

```Go
func (r *registryExtensionRemoteResolver) RegistryName() (string, error)
```

#### <a id="registryExtensionRemoteResolver.RemoteURL" href="#registryExtensionRemoteResolver.RemoteURL">func (r *registryExtensionRemoteResolver) RemoteURL() *string</a>

```
searchKey: api.registryExtensionRemoteResolver.RemoteURL
tags: [function private]
```

```Go
func (r *registryExtensionRemoteResolver) RemoteURL() *string
```

#### <a id="registryExtensionRemoteResolver.URL" href="#registryExtensionRemoteResolver.URL">func (r *registryExtensionRemoteResolver) URL() string</a>

```
searchKey: api.registryExtensionRemoteResolver.URL
tags: [function private]
```

```Go
func (r *registryExtensionRemoteResolver) URL() string
```

#### <a id="registryExtensionRemoteResolver.UUID" href="#registryExtensionRemoteResolver.UUID">func (r *registryExtensionRemoteResolver) UUID() string</a>

```
searchKey: api.registryExtensionRemoteResolver.UUID
tags: [function private]
```

```Go
func (r *registryExtensionRemoteResolver) UUID() string
```

#### <a id="registryExtensionRemoteResolver.UpdatedAt" href="#registryExtensionRemoteResolver.UpdatedAt">func (r *registryExtensionRemoteResolver) UpdatedAt() *graphqlbackend.DateTime</a>

```
searchKey: api.registryExtensionRemoteResolver.UpdatedAt
tags: [function private]
```

```Go
func (r *registryExtensionRemoteResolver) UpdatedAt() *graphqlbackend.DateTime
```

#### <a id="registryExtensionRemoteResolver.ViewerCanAdminister" href="#registryExtensionRemoteResolver.ViewerCanAdminister">func (r *registryExtensionRemoteResolver) ViewerCanAdminister(ctx context.Context) (bool, error)</a>

```
searchKey: api.registryExtensionRemoteResolver.ViewerCanAdminister
tags: [method private]
```

```Go
func (r *registryExtensionRemoteResolver) ViewerCanAdminister(ctx context.Context) (bool, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="FilterRegistryExtensions" href="#FilterRegistryExtensions">func FilterRegistryExtensions(extensions []*registry.Extension, query string) []*registry.Extension</a>

```
searchKey: api.FilterRegistryExtensions
tags: [method]
```

```Go
func FilterRegistryExtensions(extensions []*registry.Extension, query string) []*registry.Extension
```

FilterRegistryExtensions returns the subset of extensions that match the query. It does not modify its arguments. 

### <a id="FindRegistryExtension" href="#FindRegistryExtension">func FindRegistryExtension(extensions []*registry.Extension, field, value string) *registry.Extension</a>

```
searchKey: api.FindRegistryExtension
tags: [method]
```

```Go
func FindRegistryExtension(extensions []*registry.Extension, field, value string) *registry.Extension
```

FindRegistryExtension returns the first (and, hopefully, only, although that's not enforced) extension whose field matches the given value, or nil if none match. 

### <a id="GetExtensionByExtensionID" href="#GetExtensionByExtensionID">func GetExtensionByExtensionID(ctx context.Context, db dbutil.DB, extensionID string) (local graphqlbackend.RegistryExtension, remote *registry.Extension, err error)</a>

```
searchKey: api.GetExtensionByExtensionID
tags: [method]
```

```Go
func GetExtensionByExtensionID(ctx context.Context, db dbutil.DB, extensionID string) (local graphqlbackend.RegistryExtension, remote *registry.Extension, err error)
```

GetExtensionByExtensionID gets the extension with the given extension ID. 

It returns either a local or remote extension, depending on what the extension ID refers to. 

The format of an extension ID is [host/]publisher/name. If the host is omitted, the host defaults to the remote registry specified in site configuration (usually sourcegraph.com). The host must be specified to refer to a local extension on the current Sourcegraph site (e.g., sourcegraph.example.com/publisher/name). 

### <a id="GetFeaturedExtensions" href="#GetFeaturedExtensions">func GetFeaturedExtensions(ctx context.Context, db dbutil.DB) ([]graphqlbackend.RegistryExtension, error)</a>

```
searchKey: api.GetFeaturedExtensions
tags: [method]
```

```Go
func GetFeaturedExtensions(ctx context.Context, db dbutil.DB) ([]graphqlbackend.RegistryExtension, error)
```

GetFeaturedExtensions returns the set of featured extensions. 

If this is sourcegraph.com, these are local extensions. Otherwise, these are remote extensions retrieved from sourcegraph.com. 

### <a id="GetLocalRegistryExtensionIDPrefix" href="#GetLocalRegistryExtensionIDPrefix">func GetLocalRegistryExtensionIDPrefix() *string</a>

```
searchKey: api.GetLocalRegistryExtensionIDPrefix
tags: [function]
```

```Go
func GetLocalRegistryExtensionIDPrefix() *string
```

GetLocalRegistryExtensionIDPrefix returns the extension ID prefix (if any) of extensions in the local registry. 

### <a id="IsWorkInProgressExtension" href="#IsWorkInProgressExtension">func IsWorkInProgressExtension(manifest *string) bool</a>

```
searchKey: api.IsWorkInProgressExtension
tags: [method]
```

```Go
func IsWorkInProgressExtension(manifest *string) bool
```

IsWorkInProgressExtension reports whether the extension manifest indicates that this extension is marked as a work-in-progress extension (by having a "wip": true property, or (for backcompat) a title that begins with "WIP:" or "[WIP]"). 

BACKCOMPAT: This still supports titles even though extensions no longer have titles. In Feb 2019 it will probably be safe to remove the title handling. 

NOTE: Keep this pattern in sync with WorkInProgressExtensionTitlePostgreSQLPattern. 

### <a id="MarshalRegistryExtensionID" href="#MarshalRegistryExtensionID">func MarshalRegistryExtensionID(id RegistryExtensionID) graphql.ID</a>

```
searchKey: api.MarshalRegistryExtensionID
tags: [method]
```

```Go
func MarshalRegistryExtensionID(id RegistryExtensionID) graphql.ID
```

### <a id="NewExtensionManifest" href="#NewExtensionManifest">func NewExtensionManifest(raw *string) graphqlbackend.ExtensionManifest</a>

```
searchKey: api.NewExtensionManifest
tags: [method]
```

```Go
func NewExtensionManifest(raw *string) graphqlbackend.ExtensionManifest
```

NewExtensionManifest creates a new resolver for the GraphQL type ExtensionManifest with the given raw contents of an extension manifest. 

### <a id="ParseExtensionID" href="#ParseExtensionID">func ParseExtensionID(extensionID string) (prefix, extensionIDWithoutPrefix string, isLocal bool, err error)</a>

```
searchKey: api.ParseExtensionID
tags: [method]
```

```Go
func ParseExtensionID(extensionID string) (prefix, extensionIDWithoutPrefix string, isLocal bool, err error)
```

ParseExtensionID parses an extension ID of the form [host/]publisher/name (where [host/] is the optional registry prefix), such as "alice/myextension" or "sourcegraph.example.com/bob/myextension". It validates that the registry prefix is correct given the current configuration. 

### <a id="SplitExtensionID" href="#SplitExtensionID">func SplitExtensionID(extensionID string) (prefix, publisher, name string, err error)</a>

```
searchKey: api.SplitExtensionID
tags: [method]
```

```Go
func SplitExtensionID(extensionID string) (prefix, publisher, name string, err error)
```

SplitExtensionID splits an extension ID of the form [host/]publisher/name (where [host/] is the optional registry prefix), such as "alice/myextension" or "sourcegraph.example.com/bob/myextension". It returns the components, or a non-nil error if parsing failed. 

### <a id="TestGetExtensionByExtensionID" href="#TestGetExtensionByExtensionID">func TestGetExtensionByExtensionID(t *testing.T)</a>

```
searchKey: api.TestGetExtensionByExtensionID
tags: [method private test]
```

```Go
func TestGetExtensionByExtensionID(t *testing.T)
```

### <a id="TestIsWorkInProgressExtension" href="#TestIsWorkInProgressExtension">func TestIsWorkInProgressExtension(t *testing.T)</a>

```
searchKey: api.TestIsWorkInProgressExtension
tags: [method private test]
```

```Go
func TestIsWorkInProgressExtension(t *testing.T)
```

### <a id="TestParseExtensionID" href="#TestParseExtensionID">func TestParseExtensionID(t *testing.T)</a>

```
searchKey: api.TestParseExtensionID
tags: [method private test]
```

```Go
func TestParseExtensionID(t *testing.T)
```

### <a id="TestSplitExtensionID" href="#TestSplitExtensionID">func TestSplitExtensionID(t *testing.T)</a>

```
searchKey: api.TestSplitExtensionID
tags: [method private test]
```

```Go
func TestSplitExtensionID(t *testing.T)
```

### <a id="getExtensionByExtensionID" href="#getExtensionByExtensionID">func getExtensionByExtensionID(ctx context.Context, db dbutil.DB, extensionID string) (graphqlbackend.RegistryExtension, error)</a>

```
searchKey: api.getExtensionByExtensionID
tags: [method private]
```

```Go
func getExtensionByExtensionID(ctx context.Context, db dbutil.DB, extensionID string) (graphqlbackend.RegistryExtension, error)
```

### <a id="getLocalRegistryName" href="#getLocalRegistryName">func getLocalRegistryName() string</a>

```
searchKey: api.getLocalRegistryName
tags: [function private]
```

```Go
func getLocalRegistryName() string
```

getLocalRegistryName returns the name of the local registry. 

### <a id="getRemoteRegistryExtension" href="#getRemoteRegistryExtension">func getRemoteRegistryExtension(ctx context.Context, field, value string) (*registry.Extension, error)</a>

```
searchKey: api.getRemoteRegistryExtension
tags: [method private]
```

```Go
func getRemoteRegistryExtension(ctx context.Context, field, value string) (*registry.Extension, error)
```

getRemoteRegistryExtension gets the remote registry extension and rewrites its fields to be from the frame-of-reference of this site. The field is either "uuid" or "extensionID". 

### <a id="getRemoteRegistryURL" href="#getRemoteRegistryURL">func getRemoteRegistryURL() (*url.URL, error)</a>

```
searchKey: api.getRemoteRegistryURL
tags: [function private]
```

```Go
func getRemoteRegistryURL() (*url.URL, error)
```

getRemoteRegistryURL returns the remote registry URL from site configuration, or nil if there is none. If an error exists while parsing the value in site configuration, the error is returned. 

### <a id="init.extension_graphql.go" href="#init.extension_graphql.go">func init()</a>

```
searchKey: api.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.registry_graphql.go" href="#init.registry_graphql.go">func init()</a>

```
searchKey: api.init
tags: [function private]
```

```Go
func init()
```

### <a id="listRemoteRegistryExtensions" href="#listRemoteRegistryExtensions">func listRemoteRegistryExtensions(ctx context.Context, query string) ([]*registry.Extension, error)</a>

```
searchKey: api.listRemoteRegistryExtensions
tags: [method private]
```

```Go
func listRemoteRegistryExtensions(ctx context.Context, query string) ([]*registry.Extension, error)
```

listRemoteRegistryExtensions lists the remote registry extensions and rewrites their fields to be from the frame-of-reference of this site. 

### <a id="makePrioritizeExtensionIDsSet" href="#makePrioritizeExtensionIDsSet">func makePrioritizeExtensionIDsSet(args graphqlbackend.RegistryExtensionConnectionArgs) map[string]struct{}</a>

```
searchKey: api.makePrioritizeExtensionIDsSet
tags: [method private]
```

```Go
func makePrioritizeExtensionIDsSet(args graphqlbackend.RegistryExtensionConnectionArgs) map[string]struct{}
```

makePrioritizeExtensionIDsSet returns a set whose values are the elements of args.PrioritizeExtensionIDs. 

### <a id="registryExtensionByID" href="#registryExtensionByID">func registryExtensionByID(ctx context.Context, db dbutil.DB, id graphql.ID) (graphqlbackend.RegistryExtension, error)</a>

```
searchKey: api.registryExtensionByID
tags: [method private]
```

```Go
func registryExtensionByID(ctx context.Context, db dbutil.DB, id graphql.ID) (graphqlbackend.RegistryExtension, error)
```

### <a id="strptr" href="#strptr">func strptr(s string) *string</a>

```
searchKey: api.strptr
tags: [method private]
```

```Go
func strptr(s string) *string
```

### <a id="strptrptr" href="#strptrptr">func strptrptr(s string) **string</a>

```
searchKey: api.strptrptr
tags: [method private]
```

```Go
func strptrptr(s string) **string
```

