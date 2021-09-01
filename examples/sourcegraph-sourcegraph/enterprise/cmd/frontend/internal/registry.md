# Package registry

Package registry contains the implementation of the extension registry. 

## Index

* [Constants](#const)
    * [const extensionIDExpr](#extensionIDExpr)
    * [const extensionPublisherNameExpr](#extensionPublisherNameExpr)
* [Variables](#var)
    * [var errInvalidJSONInManifest](#errInvalidJSONInManifest)
    * [var errRegistryUnknownPublisher](#errRegistryUnknownPublisher)
    * [var extensionIsWIPExpr](#extensionIsWIPExpr)
    * [var featuredExtensionIDs](#featuredExtensionIDs)
    * [var mocks](#mocks)
    * [var nonLettersDigits](#nonLettersDigits)
    * [var registryExtensionNamesForTests](#registryExtensionNamesForTests)
    * [var registryGetByExtensionID](#registryGetByExtensionID)
    * [var registryGetByUUID](#registryGetByUUID)
    * [var registryGetFeaturedExtensions](#registryGetFeaturedExtensions)
    * [var registryList](#registryList)
    * [var registryRequestsDuration](#registryRequestsDuration)
    * [var sourceMappingURLLineRegex](#sourceMappingURLLineRegex)
* [Types](#type)
    * [type dbExtension struct](#dbExtension)
    * [type dbExtensions struct{}](#dbExtensions)
        * [func (s dbExtensions) Count(ctx context.Context, opt dbExtensionsListOptions) (int, error)](#dbExtensions.Count)
        * [func (s dbExtensions) CountPublishers(ctx context.Context, opt dbPublishersListOptions) (int, error)](#dbExtensions.CountPublishers)
        * [func (s dbExtensions) Create(ctx context.Context, publisherUserID, publisherOrgID int32, name string) (id int32, err error)](#dbExtensions.Create)
        * [func (dbExtensions) Delete(ctx context.Context, id int32) error](#dbExtensions.Delete)
        * [func (s dbExtensions) GetByExtensionID(ctx context.Context, extensionID string) (*dbExtension, error)](#dbExtensions.GetByExtensionID)
        * [func (s dbExtensions) GetByID(ctx context.Context, id int32) (*dbExtension, error)](#dbExtensions.GetByID)
        * [func (s dbExtensions) GetByUUID(ctx context.Context, uuid string) (*dbExtension, error)](#dbExtensions.GetByUUID)
        * [func (s dbExtensions) GetFeaturedExtensions(ctx context.Context) ([]*dbExtension, error)](#dbExtensions.GetFeaturedExtensions)
        * [func (s dbExtensions) GetPublisher(ctx context.Context, name string) (*dbPublisher, error)](#dbExtensions.GetPublisher)
        * [func (s dbExtensions) List(ctx context.Context, opt dbExtensionsListOptions) ([]*dbExtension, error)](#dbExtensions.List)
        * [func (s dbExtensions) ListPublishers(ctx context.Context, opt dbPublishersListOptions) ([]*dbPublisher, error)](#dbExtensions.ListPublishers)
        * [func (dbExtensions) Update(ctx context.Context, id int32, name *string) error](#dbExtensions.Update)
        * [func (s dbExtensions) getFeaturedExtensions(ctx context.Context, featuredExtensionIDs []string) ([]*dbExtension, error)](#dbExtensions.getFeaturedExtensions)
        * [func (s dbExtensions) list(ctx context.Context, conds, order []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbExtension, error)](#dbExtensions.list)
        * [func (dbExtensions) listCountSQL(conds []*sqlf.Query) *sqlf.Query](#dbExtensions.listCountSQL)
        * [func (s dbExtensions) listPublishers(ctx context.Context, conds []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbPublisher, error)](#dbExtensions.listPublishers)
        * [func (dbExtensions) publishersSQLCTE() *sqlf.Query](#dbExtensions.publishersSQLCTE)
    * [type dbExtensionsListOptions struct](#dbExtensionsListOptions)
        * [func toDBExtensionsListOptions(args graphqlbackend.RegistryExtensionConnectionArgs) (dbExtensionsListOptions, error)](#toDBExtensionsListOptions)
        * [func (o dbExtensionsListOptions) sqlConditions() []*sqlf.Query](#dbExtensionsListOptions.sqlConditions)
        * [func (o dbExtensionsListOptions) sqlOrder() []*sqlf.Query](#dbExtensionsListOptions.sqlOrder)
    * [type dbMocks struct](#dbMocks)
    * [type dbPublisher struct](#dbPublisher)
        * [func (p dbPublisher) IsZero() bool](#dbPublisher.IsZero)
    * [type dbPublishersListOptions struct](#dbPublishersListOptions)
        * [func (o dbPublishersListOptions) sqlConditions() []*sqlf.Query](#dbPublishersListOptions.sqlConditions)
    * [type dbRelease struct](#dbRelease)
        * [func getLatestRelease(ctx context.Context, extensionID string, registryExtensionID int32, releaseTag string) (*dbRelease, error)](#getLatestRelease)
    * [type dbReleases struct{}](#dbReleases)
        * [func (dbReleases) Create(ctx context.Context, release *dbRelease) (id int64, err error)](#dbReleases.Create)
        * [func (dbReleases) GetArtifacts(ctx context.Context, id int64) (bundle, sourcemap []byte, err error)](#dbReleases.GetArtifacts)
        * [func (dbReleases) GetLatest(ctx context.Context, registryExtensionID int32, releaseTag string, includeArtifacts bool) (*dbRelease, error)](#dbReleases.GetLatest)
        * [func (dbReleases) GetLatestBatch(ctx context.Context, registryExtensionIDs []int32, releaseTag string, includeArtifacts bool) ([]*dbRelease, error)](#dbReleases.GetLatestBatch)
    * [type extensionDBResolver struct](#extensionDBResolver)
        * [func (r *extensionDBResolver) CreatedAt() *graphqlbackend.DateTime](#extensionDBResolver.CreatedAt)
        * [func (r *extensionDBResolver) ExtensionID() string](#extensionDBResolver.ExtensionID)
        * [func (r *extensionDBResolver) ExtensionIDWithoutRegistry() string](#extensionDBResolver.ExtensionIDWithoutRegistry)
        * [func (r *extensionDBResolver) ID() graphql.ID](#extensionDBResolver.ID)
        * [func (r *extensionDBResolver) IsLocal() bool](#extensionDBResolver.IsLocal)
        * [func (r *extensionDBResolver) IsWorkInProgress() bool](#extensionDBResolver.IsWorkInProgress)
        * [func (r *extensionDBResolver) Manifest(ctx context.Context) (graphqlbackend.ExtensionManifest, error)](#extensionDBResolver.Manifest)
        * [func (r *extensionDBResolver) Name() string](#extensionDBResolver.Name)
        * [func (r *extensionDBResolver) PublishedAt(ctx context.Context) (*graphqlbackend.DateTime, error)](#extensionDBResolver.PublishedAt)
        * [func (r *extensionDBResolver) Publisher(ctx context.Context) (graphqlbackend.RegistryPublisher, error)](#extensionDBResolver.Publisher)
        * [func (r *extensionDBResolver) RegistryName() (string, error)](#extensionDBResolver.RegistryName)
        * [func (r *extensionDBResolver) RemoteURL() *string](#extensionDBResolver.RemoteURL)
        * [func (r *extensionDBResolver) URL() string](#extensionDBResolver.URL)
        * [func (r *extensionDBResolver) UUID() string](#extensionDBResolver.UUID)
        * [func (r *extensionDBResolver) UpdatedAt() *graphqlbackend.DateTime](#extensionDBResolver.UpdatedAt)
        * [func (r *extensionDBResolver) ViewerCanAdminister(ctx context.Context) (bool, error)](#extensionDBResolver.ViewerCanAdminister)
        * [func (r *extensionDBResolver) release(ctx context.Context) (*dbRelease, error)](#extensionDBResolver.release)
    * [type extensionNotFoundError struct](#extensionNotFoundError)
        * [func (err extensionNotFoundError) Error() string](#extensionNotFoundError.Error)
        * [func (err extensionNotFoundError) NotFound() bool](#extensionNotFoundError.NotFound)
    * [type mockExtensions struct](#mockExtensions)
    * [type mockReleases struct](#mockReleases)
    * [type publisherNotFoundError struct](#publisherNotFoundError)
        * [func (err publisherNotFoundError) Error() string](#publisherNotFoundError.Error)
        * [func (err publisherNotFoundError) NotFound() bool](#publisherNotFoundError.NotFound)
    * [type registryPublisher struct](#registryPublisher)
        * [func getRegistryPublisher(ctx context.Context, db dbutil.DB, publisher dbPublisher) (*registryPublisher, error)](#getRegistryPublisher)
        * [func (r *registryPublisher) RegistryExtensionConnectionURL() (*string, error)](#registryPublisher.RegistryExtensionConnectionURL)
        * [func (r *registryPublisher) ToOrg() (*graphqlbackend.OrgResolver, bool)](#registryPublisher.ToOrg)
        * [func (r *registryPublisher) ToUser() (*graphqlbackend.UserResolver, bool)](#registryPublisher.ToUser)
        * [func (r *registryPublisher) toDBRegistryPublisher() dbPublisher](#registryPublisher.toDBRegistryPublisher)
    * [type registryPublisherConnection struct](#registryPublisherConnection)
        * [func (r *registryPublisherConnection) Nodes(ctx context.Context) ([]graphqlbackend.RegistryPublisher, error)](#registryPublisherConnection.Nodes)
        * [func (r *registryPublisherConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#registryPublisherConnection.PageInfo)
        * [func (r *registryPublisherConnection) TotalCount(ctx context.Context) (int32, error)](#registryPublisherConnection.TotalCount)
        * [func (r *registryPublisherConnection) compute(ctx context.Context) ([]*dbPublisher, error)](#registryPublisherConnection.compute)
    * [type registryPublisherID struct](#registryPublisherID)
        * [func toRegistryPublisherID(extension *dbExtension) *registryPublisherID](#toRegistryPublisherID)
        * [func unmarshalRegistryPublisherID(id graphql.ID) (*registryPublisherID, error)](#unmarshalRegistryPublisherID)
        * [func (p *registryPublisherID) viewerCanAdminister(ctx context.Context, db dbutil.DB) error](#registryPublisherID.viewerCanAdminister)
    * [type releaseNotFoundError struct](#releaseNotFoundError)
        * [func (err releaseNotFoundError) Error() string](#releaseNotFoundError.Error)
        * [func (err releaseNotFoundError) NotFound() bool](#releaseNotFoundError.NotFound)
    * [type responseRecorder struct](#responseRecorder)
        * [func (r *responseRecorder) WriteHeader(code int)](#responseRecorder.WriteHeader)
* [Functions](#func)
    * [func TestFeaturedExtensions(t *testing.T)](#TestFeaturedExtensions)
    * [func TestFilterRemoteExtensions(t *testing.T)](#TestFilterRemoteExtensions)
    * [func TestFilteringExtensionIDs(t *testing.T)](#TestFilteringExtensionIDs)
    * [func TestGetExtensionManifestWithBundleURL(t *testing.T)](#TestGetExtensionManifestWithBundleURL)
    * [func TestIsRemoteExtensionAllowed(t *testing.T)](#TestIsRemoteExtensionAllowed)
    * [func TestParseExtensionBundleFilename(t *testing.T)](#TestParseExtensionBundleFilename)
    * [func TestRegistryExtensionReleases(t *testing.T)](#TestRegistryExtensionReleases)
    * [func TestRegistryExtensions(t *testing.T)](#TestRegistryExtensions)
    * [func TestRegistryExtensions_ListCount(t *testing.T)](#TestRegistryExtensions_ListCount)
    * [func TestRegistryExtensions_validNames(t *testing.T)](#TestRegistryExtensions_validNames)
    * [func TestToDBExtensionsListOptions(t *testing.T)](#TestToDBExtensionsListOptions)
    * [func asJSON(t *testing.T, v interface{}) string](#asJSON)
    * [func countLocalRegistryExtensions(ctx context.Context, db dbutil.DB, args graphqlbackend.RegistryExtensionConnectionArgs) (int, error)](#countLocalRegistryExtensions)
    * [func extensionRegistryCreateExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryCreateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)](#extensionRegistryCreateExtension)
    * [func extensionRegistryDeleteExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryDeleteExtensionArgs) (*graphqlbackend.EmptyResponse, error)](#extensionRegistryDeleteExtension)
    * [func extensionRegistryPublishExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryPublishExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)](#extensionRegistryPublishExtension)
    * [func extensionRegistryPublishers(ctx context.Context, db dbutil.DB, args *graphqlutil.ConnectionArgs) (graphqlbackend.RegistryPublisherConnection, error)](#extensionRegistryPublishers)
    * [func extensionRegistryUpdateExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryUpdateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)](#extensionRegistryUpdateExtension)
    * [func extensionRegistryViewerPublishers(ctx context.Context, db dbutil.DB) ([]graphqlbackend.RegistryPublisher, error)](#extensionRegistryViewerPublishers)
    * [func filterStripLocalExtensionIDs(extensionIDs []string) []string](#filterStripLocalExtensionIDs)
    * [func getAllowedExtensionsFromSiteConfig() []string](#getAllowedExtensionsFromSiteConfig)
    * [func getLatestForBatch(ctx context.Context, vs []*dbExtension) (map[int32]*dbRelease, error)](#getLatestForBatch)
    * [func handleRegistry(w http.ResponseWriter, r *http.Request) (err error)](#handleRegistry)
    * [func handleRegistryExtensionBundle(w http.ResponseWriter, r *http.Request)](#handleRegistryExtensionBundle)
    * [func init()](#init.allow.go)
    * [func init()](#init.db_test.go)
    * [func init()](#init.extension_bundle.go)
    * [func init()](#init.extension_connection_graphql.go)
    * [func init()](#init.extensions.go)
    * [func init()](#init.http_api.go)
    * [func init()](#init.http_api.go.0xc07d83df90)
    * [func init()](#init.publisher_connection_graphql.go)
    * [func init()](#init.publisher_graphql.go)
    * [func init()](#init.registry_graphql.go)
    * [func jsonDeepEqual(a, b string) bool](#jsonDeepEqual)
    * [func listLocalRegistryExtensions(ctx context.Context, db dbutil.DB, args graphqlbackend.RegistryExtensionConnectionArgs) ([]graphqlbackend.RegistryExtension, error)](#listLocalRegistryExtensions)
    * [func makeExtensionBundleURL(registryExtensionReleaseID int64, timestamp int64, extensionIDHint string) (string, error)](#makeExtensionBundleURL)
    * [func newExtension(v *dbExtension, manifest *string, publishedAt time.Time) *registry.Extension](#newExtension)
    * [func parseExtensionBundleFilename(filename string) (int64, error)](#parseExtensionBundleFilename)
    * [func parseExtensionQuery(q string) (text, category, tag string)](#parseExtensionQuery)
    * [func prefixLocalExtensionID(xs ...*dbExtension) error](#prefixLocalExtensionID)
    * [func prepReleaseManifest(extensionID string, release *dbRelease) error](#prepReleaseManifest)
    * [func registryExtensionByIDInt32(ctx context.Context, db dbutil.DB, id int32) (graphqlbackend.RegistryExtension, error)](#registryExtensionByIDInt32)
    * [func resetMocks()](#resetMocks)
    * [func sameElements(a, b []string) bool](#sameElements)
    * [func strarrayptr(values []string) *[]string](#strarrayptr)
    * [func strptr(s string) *string](#strptr)
    * [func toRegistryAPIExtension(ctx context.Context, v *dbExtension) (*registry.Extension, error)](#toRegistryAPIExtension)
    * [func toRegistryAPIExtensionBatch(ctx context.Context, vs []*dbExtension) ([]*registry.Extension, error)](#toRegistryAPIExtensionBatch)
    * [func validateExtensionManifest(text string) error](#validateExtensionManifest)
    * [func viewerCanAdministerExtension(ctx context.Context, db dbutil.DB, id frontendregistry.RegistryExtensionID) error](#viewerCanAdministerExtension)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="extensionIDExpr" href="#extensionIDExpr">const extensionIDExpr</a>

```
searchKey: registry.extensionIDExpr
tags: [constant string private]
```

```Go
const extensionIDExpr = "CONCAT(" + extensionPublisherNameExpr + ", '/', x.name)"
```

extensionIDExpr is the SQL expression for the extension ID (using the table aliases created by (dbExtensions).listCountSQL. 

### <a id="extensionPublisherNameExpr" href="#extensionPublisherNameExpr">const extensionPublisherNameExpr</a>

```
searchKey: registry.extensionPublisherNameExpr
tags: [constant string private]
```

```Go
const extensionPublisherNameExpr = "COALESCE(users.username, orgs.name)"
```

extensionPublisherNameExpr is the SQL expression for the extension's publisher's name (using the table aliases created by (dbExtensions).listCountSQL. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="errInvalidJSONInManifest" href="#errInvalidJSONInManifest">var errInvalidJSONInManifest</a>

```
searchKey: registry.errInvalidJSONInManifest
tags: [variable interface private]
```

```Go
var errInvalidJSONInManifest = errors.New("invalid syntax in extension manifest JSON")
```

### <a id="errRegistryUnknownPublisher" href="#errRegistryUnknownPublisher">var errRegistryUnknownPublisher</a>

```
searchKey: registry.errRegistryUnknownPublisher
tags: [variable interface private]
```

```Go
var errRegistryUnknownPublisher = errors.New("unknown registry extension publisher")
```

### <a id="extensionIsWIPExpr" href="#extensionIsWIPExpr">var extensionIsWIPExpr</a>

```
searchKey: registry.extensionIsWIPExpr
tags: [variable struct private]
```

```Go
var extensionIsWIPExpr = ...
```

extensionIsWIPExpr is the SQL expression for whether the extension is a WIP extension. 

BACKCOMPAT: It still reads the title property even though extensions no longer have titles. 

### <a id="featuredExtensionIDs" href="#featuredExtensionIDs">var featuredExtensionIDs</a>

```
searchKey: registry.featuredExtensionIDs
tags: [variable array string private]
```

```Go
var featuredExtensionIDs = ...
```

Temporary: we manually set these. Featured extensions live on sourcegraph.com, all other instances ask dotcom for these extensions and filter based on site configuration. 

### <a id="mocks" href="#mocks">var mocks</a>

```
searchKey: registry.mocks
tags: [variable struct private]
```

```Go
var mocks dbMocks
```

### <a id="nonLettersDigits" href="#nonLettersDigits">var nonLettersDigits</a>

```
searchKey: registry.nonLettersDigits
tags: [variable struct private]
```

```Go
var nonLettersDigits = lazyregexp.New(`[^a-zA-Z0-9-]`)
```

### <a id="registryExtensionNamesForTests" href="#registryExtensionNamesForTests">var registryExtensionNamesForTests</a>

```
searchKey: registry.registryExtensionNamesForTests
tags: [variable array struct private]
```

```Go
var registryExtensionNamesForTests = ...
```

registryExtensionNamesForTests is a list of test cases containing valid and invalid registry extension names. 

### <a id="registryGetByExtensionID" href="#registryGetByExtensionID">var registryGetByExtensionID</a>

```
searchKey: registry.registryGetByExtensionID
tags: [variable function private]
```

```Go
var registryGetByExtensionID = ...
```

Funcs called by serveRegistry to get registry data. If fakeRegistryData is set, it is used as the data source instead of the database. 

### <a id="registryGetByUUID" href="#registryGetByUUID">var registryGetByUUID</a>

```
searchKey: registry.registryGetByUUID
tags: [variable function private]
```

```Go
var registryGetByUUID = ...
```

Funcs called by serveRegistry to get registry data. If fakeRegistryData is set, it is used as the data source instead of the database. 

### <a id="registryGetFeaturedExtensions" href="#registryGetFeaturedExtensions">var registryGetFeaturedExtensions</a>

```
searchKey: registry.registryGetFeaturedExtensions
tags: [variable function private]
```

```Go
var registryGetFeaturedExtensions = ...
```

Funcs called by serveRegistry to get registry data. If fakeRegistryData is set, it is used as the data source instead of the database. 

### <a id="registryList" href="#registryList">var registryList</a>

```
searchKey: registry.registryList
tags: [variable function private]
```

```Go
var registryList = ...
```

Funcs called by serveRegistry to get registry data. If fakeRegistryData is set, it is used as the data source instead of the database. 

### <a id="registryRequestsDuration" href="#registryRequestsDuration">var registryRequestsDuration</a>

```
searchKey: registry.registryRequestsDuration
tags: [variable struct private]
```

```Go
var registryRequestsDuration = ...
```

### <a id="sourceMappingURLLineRegex" href="#sourceMappingURLLineRegex">var sourceMappingURLLineRegex</a>

```
searchKey: registry.sourceMappingURLLineRegex
tags: [variable struct private]
```

```Go
var sourceMappingURLLineRegex = lazyregexp.New(`(?m)\r?\n?^//# sourceMappingURL=.+$`)
```

sourceMappingURLLineRegex is a regular expression that matches all lines with a `//# sourceMappingURL` comment 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="dbExtension" href="#dbExtension">type dbExtension struct</a>

```
searchKey: registry.dbExtension
tags: [struct private]
```

```Go
type dbExtension struct {
	ID        int32
	UUID      string
	Publisher dbPublisher
	Name      string
	CreatedAt time.Time
	UpdatedAt time.Time

	// NonCanonicalExtensionID is the denormalized fully qualified extension ID
	// ("[registry/]publisher/name" format), using the username/name of the extension's publisher
	// (joined from another table) as of when the query executed. Do not persist this, because the
	// (denormalized) registry and publisher names can change.
	//
	// If this value is obtained directly from a method on RegistryExtensions, this field will never
	// contain the registry name prefix (which is necessary to distinguish local extensions from
	// remote extensions). Call prefixLocalExtensionID to add it. The recommended way to apply this
	// automatically (when needed) is to use registry.GetExtensionByExtensionID instead of
	// (dbExtensions).GetByExtensionID.
	NonCanonicalExtensionID string

	// NonCanonicalRegistry is the denormalized registry name (as of when this field was set). This
	// field is only set by prefixLocalExtensionID and is always empty if this value is obtained
	// directly from a method on RegistryExtensions. Do not persist this value, because the
	// (denormalized) registry name can change.
	NonCanonicalRegistry string

	// NonCanonicalIsWorkInProgress is whether this extension was marked as a WIP extension when it
	// was fetched. This information comes from a separate table (registry_extension_releases, not
	// registry_extensions), so it is not canonical.
	NonCanonicalIsWorkInProgress bool
}
```

dbExtension describes an extension in the extension registry. 

It is the internal form of github.com/sourcegraph/sourcegraph/internal/registry.Extension (which is the external API type). These types should generally be kept in sync, but registry.Extension updates require backcompat. 

### <a id="dbExtensions" href="#dbExtensions">type dbExtensions struct{}</a>

```
searchKey: registry.dbExtensions
tags: [struct private]
```

```Go
type dbExtensions struct{}
```

#### <a id="dbExtensions.Count" href="#dbExtensions.Count">func (s dbExtensions) Count(ctx context.Context, opt dbExtensionsListOptions) (int, error)</a>

```
searchKey: registry.dbExtensions.Count
tags: [method private]
```

```Go
func (s dbExtensions) Count(ctx context.Context, opt dbExtensionsListOptions) (int, error)
```

Count counts all registry extensions that satisfy the options (ignoring limit and offset). 

🚨 SECURITY: The caller must ensure that the actor is permitted to count the results. 

#### <a id="dbExtensions.CountPublishers" href="#dbExtensions.CountPublishers">func (s dbExtensions) CountPublishers(ctx context.Context, opt dbPublishersListOptions) (int, error)</a>

```
searchKey: registry.dbExtensions.CountPublishers
tags: [method private]
```

```Go
func (s dbExtensions) CountPublishers(ctx context.Context, opt dbPublishersListOptions) (int, error)
```

CountPublishers counts all registry publishers that satisfy the options (ignoring limit and offset). 

🚨 SECURITY: The caller must ensure that the actor is permitted to count the results. 

#### <a id="dbExtensions.Create" href="#dbExtensions.Create">func (s dbExtensions) Create(ctx context.Context, publisherUserID, publisherOrgID int32, name string) (id int32, err error)</a>

```
searchKey: registry.dbExtensions.Create
tags: [method private]
```

```Go
func (s dbExtensions) Create(ctx context.Context, publisherUserID, publisherOrgID int32, name string) (id int32, err error)
```

Create creates a new extension in the extension registry. Exactly 1 of publisherUserID and publisherOrgID must be nonzero. 

#### <a id="dbExtensions.Delete" href="#dbExtensions.Delete">func (dbExtensions) Delete(ctx context.Context, id int32) error</a>

```
searchKey: registry.dbExtensions.Delete
tags: [method private]
```

```Go
func (dbExtensions) Delete(ctx context.Context, id int32) error
```

Delete marks an registry extension as deleted. 

#### <a id="dbExtensions.GetByExtensionID" href="#dbExtensions.GetByExtensionID">func (s dbExtensions) GetByExtensionID(ctx context.Context, extensionID string) (*dbExtension, error)</a>

```
searchKey: registry.dbExtensions.GetByExtensionID
tags: [method private]
```

```Go
func (s dbExtensions) GetByExtensionID(ctx context.Context, extensionID string) (*dbExtension, error)
```

GetByExtensionID retrieves the registry extension (if any) given its extension ID, which is the concatenation of the publisher name, a slash ("/"), and the extension name. 

🚨 SECURITY: The caller must ensure that the actor is permitted to view this registry extension. 

#### <a id="dbExtensions.GetByID" href="#dbExtensions.GetByID">func (s dbExtensions) GetByID(ctx context.Context, id int32) (*dbExtension, error)</a>

```
searchKey: registry.dbExtensions.GetByID
tags: [method private]
```

```Go
func (s dbExtensions) GetByID(ctx context.Context, id int32) (*dbExtension, error)
```

GetByID retrieves the registry extension (if any) given its ID. 

🚨 SECURITY: The caller must ensure that the actor is permitted to view this registry extension. 

#### <a id="dbExtensions.GetByUUID" href="#dbExtensions.GetByUUID">func (s dbExtensions) GetByUUID(ctx context.Context, uuid string) (*dbExtension, error)</a>

```
searchKey: registry.dbExtensions.GetByUUID
tags: [method private]
```

```Go
func (s dbExtensions) GetByUUID(ctx context.Context, uuid string) (*dbExtension, error)
```

GetByUUID retrieves the registry extension (if any) given its UUID. 

🚨 SECURITY: The caller must ensure that the actor is permitted to view this registry extension. 

#### <a id="dbExtensions.GetFeaturedExtensions" href="#dbExtensions.GetFeaturedExtensions">func (s dbExtensions) GetFeaturedExtensions(ctx context.Context) ([]*dbExtension, error)</a>

```
searchKey: registry.dbExtensions.GetFeaturedExtensions
tags: [method private]
```

```Go
func (s dbExtensions) GetFeaturedExtensions(ctx context.Context) ([]*dbExtension, error)
```

GetFeaturedExtensions retrieves the set of currently featured extensions. This should only be called on dotcom; all other instances should retrieve these extensions from dotcom through the HTTP API. 

🚨 SECURITY: The caller must ensure that the actor is permitted to view these registry extensions. 

#### <a id="dbExtensions.GetPublisher" href="#dbExtensions.GetPublisher">func (s dbExtensions) GetPublisher(ctx context.Context, name string) (*dbPublisher, error)</a>

```
searchKey: registry.dbExtensions.GetPublisher
tags: [method private]
```

```Go
func (s dbExtensions) GetPublisher(ctx context.Context, name string) (*dbPublisher, error)
```

GePublisher gets the registry publisher with the given name. 

#### <a id="dbExtensions.List" href="#dbExtensions.List">func (s dbExtensions) List(ctx context.Context, opt dbExtensionsListOptions) ([]*dbExtension, error)</a>

```
searchKey: registry.dbExtensions.List
tags: [method private]
```

```Go
func (s dbExtensions) List(ctx context.Context, opt dbExtensionsListOptions) ([]*dbExtension, error)
```

List lists all registry extensions that satisfy the options. 

🚨 SECURITY: The caller must ensure that the actor is permitted to list with the specified options. 

#### <a id="dbExtensions.ListPublishers" href="#dbExtensions.ListPublishers">func (s dbExtensions) ListPublishers(ctx context.Context, opt dbPublishersListOptions) ([]*dbPublisher, error)</a>

```
searchKey: registry.dbExtensions.ListPublishers
tags: [method private]
```

```Go
func (s dbExtensions) ListPublishers(ctx context.Context, opt dbPublishersListOptions) ([]*dbPublisher, error)
```

ListPublishers lists all publishers of extensions to the registry. 

🚨 SECURITY: The caller must ensure that the actor is permitted to list with the specified options. 

#### <a id="dbExtensions.Update" href="#dbExtensions.Update">func (dbExtensions) Update(ctx context.Context, id int32, name *string) error</a>

```
searchKey: registry.dbExtensions.Update
tags: [method private]
```

```Go
func (dbExtensions) Update(ctx context.Context, id int32, name *string) error
```

Update updates information about the registry extension. 

#### <a id="dbExtensions.getFeaturedExtensions" href="#dbExtensions.getFeaturedExtensions">func (s dbExtensions) getFeaturedExtensions(ctx context.Context, featuredExtensionIDs []string) ([]*dbExtension, error)</a>

```
searchKey: registry.dbExtensions.getFeaturedExtensions
tags: [method private]
```

```Go
func (s dbExtensions) getFeaturedExtensions(ctx context.Context, featuredExtensionIDs []string) ([]*dbExtension, error)
```

#### <a id="dbExtensions.list" href="#dbExtensions.list">func (s dbExtensions) list(ctx context.Context, conds, order []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbExtension, error)</a>

```
searchKey: registry.dbExtensions.list
tags: [method private]
```

```Go
func (s dbExtensions) list(ctx context.Context, conds, order []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbExtension, error)
```

#### <a id="dbExtensions.listCountSQL" href="#dbExtensions.listCountSQL">func (dbExtensions) listCountSQL(conds []*sqlf.Query) *sqlf.Query</a>

```
searchKey: registry.dbExtensions.listCountSQL
tags: [method private]
```

```Go
func (dbExtensions) listCountSQL(conds []*sqlf.Query) *sqlf.Query
```

#### <a id="dbExtensions.listPublishers" href="#dbExtensions.listPublishers">func (s dbExtensions) listPublishers(ctx context.Context, conds []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbPublisher, error)</a>

```
searchKey: registry.dbExtensions.listPublishers
tags: [method private]
```

```Go
func (s dbExtensions) listPublishers(ctx context.Context, conds []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbPublisher, error)
```

#### <a id="dbExtensions.publishersSQLCTE" href="#dbExtensions.publishersSQLCTE">func (dbExtensions) publishersSQLCTE() *sqlf.Query</a>

```
searchKey: registry.dbExtensions.publishersSQLCTE
tags: [method private]
```

```Go
func (dbExtensions) publishersSQLCTE() *sqlf.Query
```

### <a id="dbExtensionsListOptions" href="#dbExtensionsListOptions">type dbExtensionsListOptions struct</a>

```
searchKey: registry.dbExtensionsListOptions
tags: [struct private]
```

```Go
type dbExtensionsListOptions struct {
	Publisher              dbPublisher
	Query                  string // matches the extension ID and latest release's manifest's title
	Category               string // matches the latest release's manifest's categories array
	Tag                    string // matches the latest release's manifest's tags array
	PrioritizeExtensionIDs []string
	*database.LimitOffset
}
```

dbExtensionsListOptions contains options for listing registry extensions. 

#### <a id="toDBExtensionsListOptions" href="#toDBExtensionsListOptions">func toDBExtensionsListOptions(args graphqlbackend.RegistryExtensionConnectionArgs) (dbExtensionsListOptions, error)</a>

```
searchKey: registry.toDBExtensionsListOptions
tags: [function private]
```

```Go
func toDBExtensionsListOptions(args graphqlbackend.RegistryExtensionConnectionArgs) (dbExtensionsListOptions, error)
```

#### <a id="dbExtensionsListOptions.sqlConditions" href="#dbExtensionsListOptions.sqlConditions">func (o dbExtensionsListOptions) sqlConditions() []*sqlf.Query</a>

```
searchKey: registry.dbExtensionsListOptions.sqlConditions
tags: [method private]
```

```Go
func (o dbExtensionsListOptions) sqlConditions() []*sqlf.Query
```

#### <a id="dbExtensionsListOptions.sqlOrder" href="#dbExtensionsListOptions.sqlOrder">func (o dbExtensionsListOptions) sqlOrder() []*sqlf.Query</a>

```
searchKey: registry.dbExtensionsListOptions.sqlOrder
tags: [method private]
```

```Go
func (o dbExtensionsListOptions) sqlOrder() []*sqlf.Query
```

### <a id="dbMocks" href="#dbMocks">type dbMocks struct</a>

```
searchKey: registry.dbMocks
tags: [struct private]
```

```Go
type dbMocks struct {
	extensions mockExtensions
	releases   mockReleases
}
```

### <a id="dbPublisher" href="#dbPublisher">type dbPublisher struct</a>

```
searchKey: registry.dbPublisher
tags: [struct private]
```

```Go
type dbPublisher struct {
	UserID, OrgID int32 // exactly 1 is nonzero

	// NonCanonicalExtensionID is the publisher's username (for a user) or name (for an org) as of
	// when the query executed. Do not persist this.
	NonCanonicalName string
}
```

dbPublisher is a publisher of extensions to the registry. 

#### <a id="dbPublisher.IsZero" href="#dbPublisher.IsZero">func (p dbPublisher) IsZero() bool</a>

```
searchKey: registry.dbPublisher.IsZero
tags: [method private]
```

```Go
func (p dbPublisher) IsZero() bool
```

IsZero reports whether p is the zero value. 

### <a id="dbPublishersListOptions" href="#dbPublishersListOptions">type dbPublishersListOptions struct</a>

```
searchKey: registry.dbPublishersListOptions
tags: [struct private]
```

```Go
type dbPublishersListOptions struct {
	*database.LimitOffset
}
```

dbPublishersListOptions contains options for listing publishers of extensions in the registry. 

#### <a id="dbPublishersListOptions.sqlConditions" href="#dbPublishersListOptions.sqlConditions">func (o dbPublishersListOptions) sqlConditions() []*sqlf.Query</a>

```
searchKey: registry.dbPublishersListOptions.sqlConditions
tags: [method private]
```

```Go
func (o dbPublishersListOptions) sqlConditions() []*sqlf.Query
```

### <a id="dbRelease" href="#dbRelease">type dbRelease struct</a>

```
searchKey: registry.dbRelease
tags: [struct private]
```

```Go
type dbRelease struct {
	ID                  int64
	RegistryExtensionID int32
	CreatorUserID       int32
	ReleaseVersion      *string
	ReleaseTag          string
	Manifest            string
	Bundle              *string
	SourceMap           *string
	CreatedAt           time.Time
}
```

dbRelease describes a release of an extension in the extension registry. 

#### <a id="getLatestRelease" href="#getLatestRelease">func getLatestRelease(ctx context.Context, extensionID string, registryExtensionID int32, releaseTag string) (*dbRelease, error)</a>

```
searchKey: registry.getLatestRelease
tags: [function private]
```

```Go
func getLatestRelease(ctx context.Context, extensionID string, registryExtensionID int32, releaseTag string) (*dbRelease, error)
```

getLatestRelease returns the release with the extension manifest as JSON. If there are no releases, it returns a nil manifest. If the manifest has no "url" field itself, a "url" field pointing to the extension's bundle is inserted. It also returns the date that the release was published. 

### <a id="dbReleases" href="#dbReleases">type dbReleases struct{}</a>

```
searchKey: registry.dbReleases
tags: [struct private]
```

```Go
type dbReleases struct{}
```

#### <a id="dbReleases.Create" href="#dbReleases.Create">func (dbReleases) Create(ctx context.Context, release *dbRelease) (id int64, err error)</a>

```
searchKey: registry.dbReleases.Create
tags: [method private]
```

```Go
func (dbReleases) Create(ctx context.Context, release *dbRelease) (id int64, err error)
```

Create creates a new release of an extension in the extension registry. The release.ID and release.CreatedAt fields are ignored (they are populated automatically by the database). 

#### <a id="dbReleases.GetArtifacts" href="#dbReleases.GetArtifacts">func (dbReleases) GetArtifacts(ctx context.Context, id int64) (bundle, sourcemap []byte, err error)</a>

```
searchKey: registry.dbReleases.GetArtifacts
tags: [method private]
```

```Go
func (dbReleases) GetArtifacts(ctx context.Context, id int64) (bundle, sourcemap []byte, err error)
```

GetArtifacts gets the bundled JavaScript source file contents and the source map for a release (by ID). 

#### <a id="dbReleases.GetLatest" href="#dbReleases.GetLatest">func (dbReleases) GetLatest(ctx context.Context, registryExtensionID int32, releaseTag string, includeArtifacts bool) (*dbRelease, error)</a>

```
searchKey: registry.dbReleases.GetLatest
tags: [method private]
```

```Go
func (dbReleases) GetLatest(ctx context.Context, registryExtensionID int32, releaseTag string, includeArtifacts bool) (*dbRelease, error)
```

GetLatest gets the latest release for the extension with the given release tag (e.g., "release"). If includeArtifacts is true, it populates the (*dbRelease).{Bundle,SourceMap} fields, which may be large. 

#### <a id="dbReleases.GetLatestBatch" href="#dbReleases.GetLatestBatch">func (dbReleases) GetLatestBatch(ctx context.Context, registryExtensionIDs []int32, releaseTag string, includeArtifacts bool) ([]*dbRelease, error)</a>

```
searchKey: registry.dbReleases.GetLatestBatch
tags: [method private]
```

```Go
func (dbReleases) GetLatestBatch(ctx context.Context, registryExtensionIDs []int32, releaseTag string, includeArtifacts bool) ([]*dbRelease, error)
```

GetLatestBatch gets the latest releases for the extensions with the given release tag (e.g., "release"). If includeArtifacts is true, it populates the (*dbRelease).{Bundle,SourceMap} fields, which may be large. 

### <a id="extensionDBResolver" href="#extensionDBResolver">type extensionDBResolver struct</a>

```
searchKey: registry.extensionDBResolver
tags: [struct private]
```

```Go
type extensionDBResolver struct {
	db dbutil.DB
	v  *dbExtension

	// Supplied as part of list endpoints, but
	// calculated as part of single-extension endpoints
	r *dbRelease
}
```

extensionDBResolver implements the GraphQL type RegistryExtension. 

#### <a id="extensionDBResolver.CreatedAt" href="#extensionDBResolver.CreatedAt">func (r *extensionDBResolver) CreatedAt() *graphqlbackend.DateTime</a>

```
searchKey: registry.extensionDBResolver.CreatedAt
tags: [method private]
```

```Go
func (r *extensionDBResolver) CreatedAt() *graphqlbackend.DateTime
```

#### <a id="extensionDBResolver.ExtensionID" href="#extensionDBResolver.ExtensionID">func (r *extensionDBResolver) ExtensionID() string</a>

```
searchKey: registry.extensionDBResolver.ExtensionID
tags: [method private]
```

```Go
func (r *extensionDBResolver) ExtensionID() string
```

#### <a id="extensionDBResolver.ExtensionIDWithoutRegistry" href="#extensionDBResolver.ExtensionIDWithoutRegistry">func (r *extensionDBResolver) ExtensionIDWithoutRegistry() string</a>

```
searchKey: registry.extensionDBResolver.ExtensionIDWithoutRegistry
tags: [method private]
```

```Go
func (r *extensionDBResolver) ExtensionIDWithoutRegistry() string
```

#### <a id="extensionDBResolver.ID" href="#extensionDBResolver.ID">func (r *extensionDBResolver) ID() graphql.ID</a>

```
searchKey: registry.extensionDBResolver.ID
tags: [method private]
```

```Go
func (r *extensionDBResolver) ID() graphql.ID
```

#### <a id="extensionDBResolver.IsLocal" href="#extensionDBResolver.IsLocal">func (r *extensionDBResolver) IsLocal() bool</a>

```
searchKey: registry.extensionDBResolver.IsLocal
tags: [method private]
```

```Go
func (r *extensionDBResolver) IsLocal() bool
```

#### <a id="extensionDBResolver.IsWorkInProgress" href="#extensionDBResolver.IsWorkInProgress">func (r *extensionDBResolver) IsWorkInProgress() bool</a>

```
searchKey: registry.extensionDBResolver.IsWorkInProgress
tags: [method private]
```

```Go
func (r *extensionDBResolver) IsWorkInProgress() bool
```

#### <a id="extensionDBResolver.Manifest" href="#extensionDBResolver.Manifest">func (r *extensionDBResolver) Manifest(ctx context.Context) (graphqlbackend.ExtensionManifest, error)</a>

```
searchKey: registry.extensionDBResolver.Manifest
tags: [method private]
```

```Go
func (r *extensionDBResolver) Manifest(ctx context.Context) (graphqlbackend.ExtensionManifest, error)
```

#### <a id="extensionDBResolver.Name" href="#extensionDBResolver.Name">func (r *extensionDBResolver) Name() string</a>

```
searchKey: registry.extensionDBResolver.Name
tags: [method private]
```

```Go
func (r *extensionDBResolver) Name() string
```

#### <a id="extensionDBResolver.PublishedAt" href="#extensionDBResolver.PublishedAt">func (r *extensionDBResolver) PublishedAt(ctx context.Context) (*graphqlbackend.DateTime, error)</a>

```
searchKey: registry.extensionDBResolver.PublishedAt
tags: [method private]
```

```Go
func (r *extensionDBResolver) PublishedAt(ctx context.Context) (*graphqlbackend.DateTime, error)
```

#### <a id="extensionDBResolver.Publisher" href="#extensionDBResolver.Publisher">func (r *extensionDBResolver) Publisher(ctx context.Context) (graphqlbackend.RegistryPublisher, error)</a>

```
searchKey: registry.extensionDBResolver.Publisher
tags: [method private]
```

```Go
func (r *extensionDBResolver) Publisher(ctx context.Context) (graphqlbackend.RegistryPublisher, error)
```

#### <a id="extensionDBResolver.RegistryName" href="#extensionDBResolver.RegistryName">func (r *extensionDBResolver) RegistryName() (string, error)</a>

```
searchKey: registry.extensionDBResolver.RegistryName
tags: [method private]
```

```Go
func (r *extensionDBResolver) RegistryName() (string, error)
```

#### <a id="extensionDBResolver.RemoteURL" href="#extensionDBResolver.RemoteURL">func (r *extensionDBResolver) RemoteURL() *string</a>

```
searchKey: registry.extensionDBResolver.RemoteURL
tags: [method private]
```

```Go
func (r *extensionDBResolver) RemoteURL() *string
```

#### <a id="extensionDBResolver.URL" href="#extensionDBResolver.URL">func (r *extensionDBResolver) URL() string</a>

```
searchKey: registry.extensionDBResolver.URL
tags: [method private]
```

```Go
func (r *extensionDBResolver) URL() string
```

#### <a id="extensionDBResolver.UUID" href="#extensionDBResolver.UUID">func (r *extensionDBResolver) UUID() string</a>

```
searchKey: registry.extensionDBResolver.UUID
tags: [method private]
```

```Go
func (r *extensionDBResolver) UUID() string
```

#### <a id="extensionDBResolver.UpdatedAt" href="#extensionDBResolver.UpdatedAt">func (r *extensionDBResolver) UpdatedAt() *graphqlbackend.DateTime</a>

```
searchKey: registry.extensionDBResolver.UpdatedAt
tags: [method private]
```

```Go
func (r *extensionDBResolver) UpdatedAt() *graphqlbackend.DateTime
```

#### <a id="extensionDBResolver.ViewerCanAdminister" href="#extensionDBResolver.ViewerCanAdminister">func (r *extensionDBResolver) ViewerCanAdminister(ctx context.Context) (bool, error)</a>

```
searchKey: registry.extensionDBResolver.ViewerCanAdminister
tags: [method private]
```

```Go
func (r *extensionDBResolver) ViewerCanAdminister(ctx context.Context) (bool, error)
```

#### <a id="extensionDBResolver.release" href="#extensionDBResolver.release">func (r *extensionDBResolver) release(ctx context.Context) (*dbRelease, error)</a>

```
searchKey: registry.extensionDBResolver.release
tags: [method private]
```

```Go
func (r *extensionDBResolver) release(ctx context.Context) (*dbRelease, error)
```

### <a id="extensionNotFoundError" href="#extensionNotFoundError">type extensionNotFoundError struct</a>

```
searchKey: registry.extensionNotFoundError
tags: [struct private]
```

```Go
type extensionNotFoundError struct {
	args []interface{}
}
```

extensionNotFoundError occurs when an extension is not found in the extension registry. 

#### <a id="extensionNotFoundError.Error" href="#extensionNotFoundError.Error">func (err extensionNotFoundError) Error() string</a>

```
searchKey: registry.extensionNotFoundError.Error
tags: [method private]
```

```Go
func (err extensionNotFoundError) Error() string
```

#### <a id="extensionNotFoundError.NotFound" href="#extensionNotFoundError.NotFound">func (err extensionNotFoundError) NotFound() bool</a>

```
searchKey: registry.extensionNotFoundError.NotFound
tags: [method private]
```

```Go
func (err extensionNotFoundError) NotFound() bool
```

NotFound implements errcode.NotFounder. 

### <a id="mockExtensions" href="#mockExtensions">type mockExtensions struct</a>

```
searchKey: registry.mockExtensions
tags: [struct private]
```

```Go
type mockExtensions struct {
	Create                func(publisherUserID, publisherOrgID int32, name string) (int32, error)
	GetByID               func(id int32) (*dbExtension, error)
	GetByUUID             func(uuid string) (*dbExtension, error)
	GetByExtensionID      func(extensionID string) (*dbExtension, error)
	GetFeaturedExtensions func() ([]*dbExtension, error)
	Update                func(id int32, name *string) error
	Delete                func(id int32) error
}
```

mockExtensions mocks the registry extensions store. 

### <a id="mockReleases" href="#mockReleases">type mockReleases struct</a>

```
searchKey: registry.mockReleases
tags: [struct private]
```

```Go
type mockReleases struct {
	Create         func(release *dbRelease) (int64, error)
	GetLatest      func(registryExtensionID int32, releaseTag string, includeArtifacts bool) (*dbRelease, error)
	GetLatestBatch func(registryExtensionIDs []int32, releaseTag string, includeArtifacts bool) ([]*dbRelease, error)
}
```

mockReleases mocks the registry extension releases store. 

### <a id="publisherNotFoundError" href="#publisherNotFoundError">type publisherNotFoundError struct</a>

```
searchKey: registry.publisherNotFoundError
tags: [struct private]
```

```Go
type publisherNotFoundError struct {
	args []interface{}
}
```

publisherNotFoundError occurs when a registry extension publisher is not found. 

#### <a id="publisherNotFoundError.Error" href="#publisherNotFoundError.Error">func (err publisherNotFoundError) Error() string</a>

```
searchKey: registry.publisherNotFoundError.Error
tags: [method private]
```

```Go
func (err publisherNotFoundError) Error() string
```

#### <a id="publisherNotFoundError.NotFound" href="#publisherNotFoundError.NotFound">func (err publisherNotFoundError) NotFound() bool</a>

```
searchKey: registry.publisherNotFoundError.NotFound
tags: [method private]
```

```Go
func (err publisherNotFoundError) NotFound() bool
```

NotFound implements errcode.NotFounder. 

### <a id="registryPublisher" href="#registryPublisher">type registryPublisher struct</a>

```
searchKey: registry.registryPublisher
tags: [struct private]
```

```Go
type registryPublisher struct {
	user *graphqlbackend.UserResolver
	org  *graphqlbackend.OrgResolver
}
```

registryPublisher implements the GraphQL type RegistryPublisher. 

#### <a id="getRegistryPublisher" href="#getRegistryPublisher">func getRegistryPublisher(ctx context.Context, db dbutil.DB, publisher dbPublisher) (*registryPublisher, error)</a>

```
searchKey: registry.getRegistryPublisher
tags: [function private]
```

```Go
func getRegistryPublisher(ctx context.Context, db dbutil.DB, publisher dbPublisher) (*registryPublisher, error)
```

#### <a id="registryPublisher.RegistryExtensionConnectionURL" href="#registryPublisher.RegistryExtensionConnectionURL">func (r *registryPublisher) RegistryExtensionConnectionURL() (*string, error)</a>

```
searchKey: registry.registryPublisher.RegistryExtensionConnectionURL
tags: [method private]
```

```Go
func (r *registryPublisher) RegistryExtensionConnectionURL() (*string, error)
```

#### <a id="registryPublisher.ToOrg" href="#registryPublisher.ToOrg">func (r *registryPublisher) ToOrg() (*graphqlbackend.OrgResolver, bool)</a>

```
searchKey: registry.registryPublisher.ToOrg
tags: [method private]
```

```Go
func (r *registryPublisher) ToOrg() (*graphqlbackend.OrgResolver, bool)
```

#### <a id="registryPublisher.ToUser" href="#registryPublisher.ToUser">func (r *registryPublisher) ToUser() (*graphqlbackend.UserResolver, bool)</a>

```
searchKey: registry.registryPublisher.ToUser
tags: [method private]
```

```Go
func (r *registryPublisher) ToUser() (*graphqlbackend.UserResolver, bool)
```

#### <a id="registryPublisher.toDBRegistryPublisher" href="#registryPublisher.toDBRegistryPublisher">func (r *registryPublisher) toDBRegistryPublisher() dbPublisher</a>

```
searchKey: registry.registryPublisher.toDBRegistryPublisher
tags: [method private]
```

```Go
func (r *registryPublisher) toDBRegistryPublisher() dbPublisher
```

### <a id="registryPublisherConnection" href="#registryPublisherConnection">type registryPublisherConnection struct</a>

```
searchKey: registry.registryPublisherConnection
tags: [struct private]
```

```Go
type registryPublisherConnection struct {
	opt dbPublishersListOptions

	// cache results because they are used by multiple fields
	once               sync.Once
	registryPublishers []*dbPublisher
	err                error
	db                 dbutil.DB
}
```

registryPublisherConnection resolves a list of registry publishers. 

#### <a id="registryPublisherConnection.Nodes" href="#registryPublisherConnection.Nodes">func (r *registryPublisherConnection) Nodes(ctx context.Context) ([]graphqlbackend.RegistryPublisher, error)</a>

```
searchKey: registry.registryPublisherConnection.Nodes
tags: [method private]
```

```Go
func (r *registryPublisherConnection) Nodes(ctx context.Context) ([]graphqlbackend.RegistryPublisher, error)
```

#### <a id="registryPublisherConnection.PageInfo" href="#registryPublisherConnection.PageInfo">func (r *registryPublisherConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: registry.registryPublisherConnection.PageInfo
tags: [method private]
```

```Go
func (r *registryPublisherConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="registryPublisherConnection.TotalCount" href="#registryPublisherConnection.TotalCount">func (r *registryPublisherConnection) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: registry.registryPublisherConnection.TotalCount
tags: [method private]
```

```Go
func (r *registryPublisherConnection) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="registryPublisherConnection.compute" href="#registryPublisherConnection.compute">func (r *registryPublisherConnection) compute(ctx context.Context) ([]*dbPublisher, error)</a>

```
searchKey: registry.registryPublisherConnection.compute
tags: [method private]
```

```Go
func (r *registryPublisherConnection) compute(ctx context.Context) ([]*dbPublisher, error)
```

### <a id="registryPublisherID" href="#registryPublisherID">type registryPublisherID struct</a>

```
searchKey: registry.registryPublisherID
tags: [struct private]
```

```Go
type registryPublisherID struct {
	userID, orgID int32
}
```

#### <a id="toRegistryPublisherID" href="#toRegistryPublisherID">func toRegistryPublisherID(extension *dbExtension) *registryPublisherID</a>

```
searchKey: registry.toRegistryPublisherID
tags: [function private]
```

```Go
func toRegistryPublisherID(extension *dbExtension) *registryPublisherID
```

#### <a id="unmarshalRegistryPublisherID" href="#unmarshalRegistryPublisherID">func unmarshalRegistryPublisherID(id graphql.ID) (*registryPublisherID, error)</a>

```
searchKey: registry.unmarshalRegistryPublisherID
tags: [function private]
```

```Go
func unmarshalRegistryPublisherID(id graphql.ID) (*registryPublisherID, error)
```

unmarshalRegistryPublisherID unmarshals the GraphQL ID into the possible publisher ID types. 

🚨 SECURITY 

#### <a id="registryPublisherID.viewerCanAdminister" href="#registryPublisherID.viewerCanAdminister">func (p *registryPublisherID) viewerCanAdminister(ctx context.Context, db dbutil.DB) error</a>

```
searchKey: registry.registryPublisherID.viewerCanAdminister
tags: [method private]
```

```Go
func (p *registryPublisherID) viewerCanAdminister(ctx context.Context, db dbutil.DB) error
```

viewerCanAdminister returns whether the current user is allowed to perform mutations on a registry extension with the given publisher. 

🚨 SECURITY 

### <a id="releaseNotFoundError" href="#releaseNotFoundError">type releaseNotFoundError struct</a>

```
searchKey: registry.releaseNotFoundError
tags: [struct private]
```

```Go
type releaseNotFoundError struct {
	args []interface{}
}
```

releaseNotFoundError occurs when an extension release is not found in the extension registry. 

#### <a id="releaseNotFoundError.Error" href="#releaseNotFoundError.Error">func (err releaseNotFoundError) Error() string</a>

```
searchKey: registry.releaseNotFoundError.Error
tags: [method private]
```

```Go
func (err releaseNotFoundError) Error() string
```

#### <a id="releaseNotFoundError.NotFound" href="#releaseNotFoundError.NotFound">func (err releaseNotFoundError) NotFound() bool</a>

```
searchKey: registry.releaseNotFoundError.NotFound
tags: [method private]
```

```Go
func (err releaseNotFoundError) NotFound() bool
```

NotFound implements errcode.NotFounder. 

### <a id="responseRecorder" href="#responseRecorder">type responseRecorder struct</a>

```
searchKey: registry.responseRecorder
tags: [struct private]
```

```Go
type responseRecorder struct {
	http.ResponseWriter
	code int
}
```

#### <a id="responseRecorder.WriteHeader" href="#responseRecorder.WriteHeader">func (r *responseRecorder) WriteHeader(code int)</a>

```
searchKey: registry.responseRecorder.WriteHeader
tags: [method private]
```

```Go
func (r *responseRecorder) WriteHeader(code int)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestFeaturedExtensions" href="#TestFeaturedExtensions">func TestFeaturedExtensions(t *testing.T)</a>

```
searchKey: registry.TestFeaturedExtensions
tags: [function private test]
```

```Go
func TestFeaturedExtensions(t *testing.T)
```

### <a id="TestFilterRemoteExtensions" href="#TestFilterRemoteExtensions">func TestFilterRemoteExtensions(t *testing.T)</a>

```
searchKey: registry.TestFilterRemoteExtensions
tags: [function private test]
```

```Go
func TestFilterRemoteExtensions(t *testing.T)
```

### <a id="TestFilteringExtensionIDs" href="#TestFilteringExtensionIDs">func TestFilteringExtensionIDs(t *testing.T)</a>

```
searchKey: registry.TestFilteringExtensionIDs
tags: [function private test]
```

```Go
func TestFilteringExtensionIDs(t *testing.T)
```

### <a id="TestGetExtensionManifestWithBundleURL" href="#TestGetExtensionManifestWithBundleURL">func TestGetExtensionManifestWithBundleURL(t *testing.T)</a>

```
searchKey: registry.TestGetExtensionManifestWithBundleURL
tags: [function private test]
```

```Go
func TestGetExtensionManifestWithBundleURL(t *testing.T)
```

### <a id="TestIsRemoteExtensionAllowed" href="#TestIsRemoteExtensionAllowed">func TestIsRemoteExtensionAllowed(t *testing.T)</a>

```
searchKey: registry.TestIsRemoteExtensionAllowed
tags: [function private test]
```

```Go
func TestIsRemoteExtensionAllowed(t *testing.T)
```

### <a id="TestParseExtensionBundleFilename" href="#TestParseExtensionBundleFilename">func TestParseExtensionBundleFilename(t *testing.T)</a>

```
searchKey: registry.TestParseExtensionBundleFilename
tags: [function private test]
```

```Go
func TestParseExtensionBundleFilename(t *testing.T)
```

### <a id="TestRegistryExtensionReleases" href="#TestRegistryExtensionReleases">func TestRegistryExtensionReleases(t *testing.T)</a>

```
searchKey: registry.TestRegistryExtensionReleases
tags: [function private test]
```

```Go
func TestRegistryExtensionReleases(t *testing.T)
```

### <a id="TestRegistryExtensions" href="#TestRegistryExtensions">func TestRegistryExtensions(t *testing.T)</a>

```
searchKey: registry.TestRegistryExtensions
tags: [function private test]
```

```Go
func TestRegistryExtensions(t *testing.T)
```

### <a id="TestRegistryExtensions_ListCount" href="#TestRegistryExtensions_ListCount">func TestRegistryExtensions_ListCount(t *testing.T)</a>

```
searchKey: registry.TestRegistryExtensions_ListCount
tags: [function private test]
```

```Go
func TestRegistryExtensions_ListCount(t *testing.T)
```

### <a id="TestRegistryExtensions_validNames" href="#TestRegistryExtensions_validNames">func TestRegistryExtensions_validNames(t *testing.T)</a>

```
searchKey: registry.TestRegistryExtensions_validNames
tags: [function private test]
```

```Go
func TestRegistryExtensions_validNames(t *testing.T)
```

### <a id="TestToDBExtensionsListOptions" href="#TestToDBExtensionsListOptions">func TestToDBExtensionsListOptions(t *testing.T)</a>

```
searchKey: registry.TestToDBExtensionsListOptions
tags: [function private test]
```

```Go
func TestToDBExtensionsListOptions(t *testing.T)
```

### <a id="asJSON" href="#asJSON">func asJSON(t *testing.T, v interface{}) string</a>

```
searchKey: registry.asJSON
tags: [function private]
```

```Go
func asJSON(t *testing.T, v interface{}) string
```

### <a id="countLocalRegistryExtensions" href="#countLocalRegistryExtensions">func countLocalRegistryExtensions(ctx context.Context, db dbutil.DB, args graphqlbackend.RegistryExtensionConnectionArgs) (int, error)</a>

```
searchKey: registry.countLocalRegistryExtensions
tags: [function private]
```

```Go
func countLocalRegistryExtensions(ctx context.Context, db dbutil.DB, args graphqlbackend.RegistryExtensionConnectionArgs) (int, error)
```

### <a id="extensionRegistryCreateExtension" href="#extensionRegistryCreateExtension">func extensionRegistryCreateExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryCreateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)</a>

```
searchKey: registry.extensionRegistryCreateExtension
tags: [function private]
```

```Go
func extensionRegistryCreateExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryCreateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)
```

### <a id="extensionRegistryDeleteExtension" href="#extensionRegistryDeleteExtension">func extensionRegistryDeleteExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryDeleteExtensionArgs) (*graphqlbackend.EmptyResponse, error)</a>

```
searchKey: registry.extensionRegistryDeleteExtension
tags: [function private]
```

```Go
func extensionRegistryDeleteExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryDeleteExtensionArgs) (*graphqlbackend.EmptyResponse, error)
```

### <a id="extensionRegistryPublishExtension" href="#extensionRegistryPublishExtension">func extensionRegistryPublishExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryPublishExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)</a>

```
searchKey: registry.extensionRegistryPublishExtension
tags: [function private]
```

```Go
func extensionRegistryPublishExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryPublishExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)
```

### <a id="extensionRegistryPublishers" href="#extensionRegistryPublishers">func extensionRegistryPublishers(ctx context.Context, db dbutil.DB, args *graphqlutil.ConnectionArgs) (graphqlbackend.RegistryPublisherConnection, error)</a>

```
searchKey: registry.extensionRegistryPublishers
tags: [function private]
```

```Go
func extensionRegistryPublishers(ctx context.Context, db dbutil.DB, args *graphqlutil.ConnectionArgs) (graphqlbackend.RegistryPublisherConnection, error)
```

### <a id="extensionRegistryUpdateExtension" href="#extensionRegistryUpdateExtension">func extensionRegistryUpdateExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryUpdateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)</a>

```
searchKey: registry.extensionRegistryUpdateExtension
tags: [function private]
```

```Go
func extensionRegistryUpdateExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryUpdateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)
```

### <a id="extensionRegistryViewerPublishers" href="#extensionRegistryViewerPublishers">func extensionRegistryViewerPublishers(ctx context.Context, db dbutil.DB) ([]graphqlbackend.RegistryPublisher, error)</a>

```
searchKey: registry.extensionRegistryViewerPublishers
tags: [function private]
```

```Go
func extensionRegistryViewerPublishers(ctx context.Context, db dbutil.DB) ([]graphqlbackend.RegistryPublisher, error)
```

### <a id="filterStripLocalExtensionIDs" href="#filterStripLocalExtensionIDs">func filterStripLocalExtensionIDs(extensionIDs []string) []string</a>

```
searchKey: registry.filterStripLocalExtensionIDs
tags: [function private]
```

```Go
func filterStripLocalExtensionIDs(extensionIDs []string) []string
```

filterStripLocalExtensionIDs filters to local extension IDs and strips the host prefix. 

### <a id="getAllowedExtensionsFromSiteConfig" href="#getAllowedExtensionsFromSiteConfig">func getAllowedExtensionsFromSiteConfig() []string</a>

```
searchKey: registry.getAllowedExtensionsFromSiteConfig
tags: [function private]
```

```Go
func getAllowedExtensionsFromSiteConfig() []string
```

### <a id="getLatestForBatch" href="#getLatestForBatch">func getLatestForBatch(ctx context.Context, vs []*dbExtension) (map[int32]*dbRelease, error)</a>

```
searchKey: registry.getLatestForBatch
tags: [function private]
```

```Go
func getLatestForBatch(ctx context.Context, vs []*dbExtension) (map[int32]*dbRelease, error)
```

getLatestForBatch returns a map from extension identifiers to the latest DB release with the extension manifest as JSON for that extension. If there are no releases, it returns a nil manifest. If the manifest has no "url" field itself, a "url" field pointing to the extension's bundle is inserted. It also returns the date that the release was published. 

### <a id="handleRegistry" href="#handleRegistry">func handleRegistry(w http.ResponseWriter, r *http.Request) (err error)</a>

```
searchKey: registry.handleRegistry
tags: [function private]
```

```Go
func handleRegistry(w http.ResponseWriter, r *http.Request) (err error)
```

handleRegistry serves the external HTTP API for the extension registry. 

### <a id="handleRegistryExtensionBundle" href="#handleRegistryExtensionBundle">func handleRegistryExtensionBundle(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: registry.handleRegistryExtensionBundle
tags: [function private]
```

```Go
func handleRegistryExtensionBundle(w http.ResponseWriter, r *http.Request)
```

handleRegistryExtensionBundle serves the bundled JavaScript source file or the source map for an extension in the registry as a raw JavaScript or JSON file. 

### <a id="init.allow.go" href="#init.allow.go">func init()</a>

```
searchKey: registry.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.db_test.go" href="#init.db_test.go">func init()</a>

```
searchKey: registry.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.extension_bundle.go" href="#init.extension_bundle.go">func init()</a>

```
searchKey: registry.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.extension_connection_graphql.go" href="#init.extension_connection_graphql.go">func init()</a>

```
searchKey: registry.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.extensions.go" href="#init.extensions.go">func init()</a>

```
searchKey: registry.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.http_api.go" href="#init.http_api.go">func init()</a>

```
searchKey: registry.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.http_api.go.0xc07d83df90" href="#init.http_api.go.0xc07d83df90">func init()</a>

```
searchKey: registry.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.publisher_connection_graphql.go" href="#init.publisher_connection_graphql.go">func init()</a>

```
searchKey: registry.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.publisher_graphql.go" href="#init.publisher_graphql.go">func init()</a>

```
searchKey: registry.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.registry_graphql.go" href="#init.registry_graphql.go">func init()</a>

```
searchKey: registry.init
tags: [function private]
```

```Go
func init()
```

### <a id="jsonDeepEqual" href="#jsonDeepEqual">func jsonDeepEqual(a, b string) bool</a>

```
searchKey: registry.jsonDeepEqual
tags: [function private]
```

```Go
func jsonDeepEqual(a, b string) bool
```

### <a id="listLocalRegistryExtensions" href="#listLocalRegistryExtensions">func listLocalRegistryExtensions(ctx context.Context, db dbutil.DB, args graphqlbackend.RegistryExtensionConnectionArgs) ([]graphqlbackend.RegistryExtension, error)</a>

```
searchKey: registry.listLocalRegistryExtensions
tags: [function private]
```

```Go
func listLocalRegistryExtensions(ctx context.Context, db dbutil.DB, args graphqlbackend.RegistryExtensionConnectionArgs) ([]graphqlbackend.RegistryExtension, error)
```

### <a id="makeExtensionBundleURL" href="#makeExtensionBundleURL">func makeExtensionBundleURL(registryExtensionReleaseID int64, timestamp int64, extensionIDHint string) (string, error)</a>

```
searchKey: registry.makeExtensionBundleURL
tags: [function private]
```

```Go
func makeExtensionBundleURL(registryExtensionReleaseID int64, timestamp int64, extensionIDHint string) (string, error)
```

### <a id="newExtension" href="#newExtension">func newExtension(v *dbExtension, manifest *string, publishedAt time.Time) *registry.Extension</a>

```
searchKey: registry.newExtension
tags: [function private]
```

```Go
func newExtension(v *dbExtension, manifest *string, publishedAt time.Time) *registry.Extension
```

### <a id="parseExtensionBundleFilename" href="#parseExtensionBundleFilename">func parseExtensionBundleFilename(filename string) (int64, error)</a>

```
searchKey: registry.parseExtensionBundleFilename
tags: [function private]
```

```Go
func parseExtensionBundleFilename(filename string) (int64, error)
```

parseExtensionBundleFilename parses the release ID from the extension bundle's filename, which is of the form "1234-publisher-extension-id.js" or ".map". The part of the filename after the "-" and before the extension is ignored; it exists to help distinguish log messages from different extensions in debugging. 

### <a id="parseExtensionQuery" href="#parseExtensionQuery">func parseExtensionQuery(q string) (text, category, tag string)</a>

```
searchKey: registry.parseExtensionQuery
tags: [function private]
```

```Go
func parseExtensionQuery(q string) (text, category, tag string)
```

parseExtensionQuery parses an extension registry query consisting of terms and the operators `category:"My category"`, `tag:"mytag"`, #installed, #enabled, and #disabled. 

This is an intentionally simple, unoptimized parser. 

### <a id="prefixLocalExtensionID" href="#prefixLocalExtensionID">func prefixLocalExtensionID(xs ...*dbExtension) error</a>

```
searchKey: registry.prefixLocalExtensionID
tags: [function private]
```

```Go
func prefixLocalExtensionID(xs ...*dbExtension) error
```

prefixLocalExtensionID adds the local registry's extension ID prefix (from GetLocalRegistryExtensionIDPrefix) to all extensions' extension IDs in the list. 

### <a id="prepReleaseManifest" href="#prepReleaseManifest">func prepReleaseManifest(extensionID string, release *dbRelease) error</a>

```
searchKey: registry.prepReleaseManifest
tags: [function private]
```

```Go
func prepReleaseManifest(extensionID string, release *dbRelease) error
```

prepReleaseManifest will set the Manifest field of the release. If the manifest has no "url" field itself, a "url" field pointing to the extension's bundle is inserted. It also returns the date that the release was published. 

### <a id="registryExtensionByIDInt32" href="#registryExtensionByIDInt32">func registryExtensionByIDInt32(ctx context.Context, db dbutil.DB, id int32) (graphqlbackend.RegistryExtension, error)</a>

```
searchKey: registry.registryExtensionByIDInt32
tags: [function private]
```

```Go
func registryExtensionByIDInt32(ctx context.Context, db dbutil.DB, id int32) (graphqlbackend.RegistryExtension, error)
```

### <a id="resetMocks" href="#resetMocks">func resetMocks()</a>

```
searchKey: registry.resetMocks
tags: [function private]
```

```Go
func resetMocks()
```

### <a id="sameElements" href="#sameElements">func sameElements(a, b []string) bool</a>

```
searchKey: registry.sameElements
tags: [function private]
```

```Go
func sameElements(a, b []string) bool
```

### <a id="strarrayptr" href="#strarrayptr">func strarrayptr(values []string) *[]string</a>

```
searchKey: registry.strarrayptr
tags: [function private]
```

```Go
func strarrayptr(values []string) *[]string
```

### <a id="strptr" href="#strptr">func strptr(s string) *string</a>

```
searchKey: registry.strptr
tags: [function private]
```

```Go
func strptr(s string) *string
```

### <a id="toRegistryAPIExtension" href="#toRegistryAPIExtension">func toRegistryAPIExtension(ctx context.Context, v *dbExtension) (*registry.Extension, error)</a>

```
searchKey: registry.toRegistryAPIExtension
tags: [function private]
```

```Go
func toRegistryAPIExtension(ctx context.Context, v *dbExtension) (*registry.Extension, error)
```

### <a id="toRegistryAPIExtensionBatch" href="#toRegistryAPIExtensionBatch">func toRegistryAPIExtensionBatch(ctx context.Context, vs []*dbExtension) ([]*registry.Extension, error)</a>

```
searchKey: registry.toRegistryAPIExtensionBatch
tags: [function private]
```

```Go
func toRegistryAPIExtensionBatch(ctx context.Context, vs []*dbExtension) ([]*registry.Extension, error)
```

### <a id="validateExtensionManifest" href="#validateExtensionManifest">func validateExtensionManifest(text string) error</a>

```
searchKey: registry.validateExtensionManifest
tags: [function private]
```

```Go
func validateExtensionManifest(text string) error
```

validateExtensionManifest validates a JSON extension manifest for syntax. 

TODO(sqs): Also validate it against the JSON Schema. 

### <a id="viewerCanAdministerExtension" href="#viewerCanAdministerExtension">func viewerCanAdministerExtension(ctx context.Context, db dbutil.DB, id frontendregistry.RegistryExtensionID) error</a>

```
searchKey: registry.viewerCanAdministerExtension
tags: [function private]
```

```Go
func viewerCanAdministerExtension(ctx context.Context, db dbutil.DB, id frontendregistry.RegistryExtensionID) error
```

