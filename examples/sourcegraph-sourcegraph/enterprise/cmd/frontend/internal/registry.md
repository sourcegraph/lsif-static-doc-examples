# Package registry

Package registry contains the implementation of the extension registry. 

## Index

* [Constants](#const)
    * [const extensionPublisherNameExpr](#extensionPublisherNameExpr)
    * [const extensionIDExpr](#extensionIDExpr)
* [Variables](#var)
    * [var sourceMappingURLLineRegex](#sourceMappingURLLineRegex)
    * [var nonLettersDigits](#nonLettersDigits)
    * [var featuredExtensionIDs](#featuredExtensionIDs)
    * [var extensionIsWIPExpr](#extensionIsWIPExpr)
    * [var registryList](#registryList)
    * [var registryGetByUUID](#registryGetByUUID)
    * [var registryGetByExtensionID](#registryGetByExtensionID)
    * [var registryGetFeaturedExtensions](#registryGetFeaturedExtensions)
    * [var registryRequestsDuration](#registryRequestsDuration)
    * [var mocks](#mocks)
    * [var errRegistryUnknownPublisher](#errRegistryUnknownPublisher)
    * [var errInvalidJSONInManifest](#errInvalidJSONInManifest)
    * [var registryExtensionNamesForTests](#registryExtensionNamesForTests)
* [Types](#type)
    * [type extensionDBResolver struct](#extensionDBResolver)
        * [func (r *extensionDBResolver) ID() graphql.ID](#extensionDBResolver.ID)
        * [func (r *extensionDBResolver) UUID() string](#extensionDBResolver.UUID)
        * [func (r *extensionDBResolver) ExtensionID() string](#extensionDBResolver.ExtensionID)
        * [func (r *extensionDBResolver) ExtensionIDWithoutRegistry() string](#extensionDBResolver.ExtensionIDWithoutRegistry)
        * [func (r *extensionDBResolver) Publisher(ctx context.Context) (graphqlbackend.RegistryPublisher, error)](#extensionDBResolver.Publisher)
        * [func (r *extensionDBResolver) Name() string](#extensionDBResolver.Name)
        * [func (r *extensionDBResolver) Manifest(ctx context.Context) (graphqlbackend.ExtensionManifest, error)](#extensionDBResolver.Manifest)
        * [func (r *extensionDBResolver) CreatedAt() *graphqlbackend.DateTime](#extensionDBResolver.CreatedAt)
        * [func (r *extensionDBResolver) UpdatedAt() *graphqlbackend.DateTime](#extensionDBResolver.UpdatedAt)
        * [func (r *extensionDBResolver) PublishedAt(ctx context.Context) (*graphqlbackend.DateTime, error)](#extensionDBResolver.PublishedAt)
        * [func (r *extensionDBResolver) URL() string](#extensionDBResolver.URL)
        * [func (r *extensionDBResolver) RemoteURL() *string](#extensionDBResolver.RemoteURL)
        * [func (r *extensionDBResolver) RegistryName() (string, error)](#extensionDBResolver.RegistryName)
        * [func (r *extensionDBResolver) IsLocal() bool](#extensionDBResolver.IsLocal)
        * [func (r *extensionDBResolver) IsWorkInProgress() bool](#extensionDBResolver.IsWorkInProgress)
        * [func (r *extensionDBResolver) ViewerCanAdminister(ctx context.Context) (bool, error)](#extensionDBResolver.ViewerCanAdminister)
        * [func (r *extensionDBResolver) release(ctx context.Context) (*dbRelease, error)](#extensionDBResolver.release)
    * [type dbExtension struct](#dbExtension)
    * [type dbExtensions struct{}](#dbExtensions)
        * [func (s dbExtensions) Create(ctx context.Context, publisherUserID, publisherOrgID int32, name string) (id int32, err error)](#dbExtensions.Create)
        * [func (s dbExtensions) GetByID(ctx context.Context, id int32) (*dbExtension, error)](#dbExtensions.GetByID)
        * [func (s dbExtensions) GetByUUID(ctx context.Context, uuid string) (*dbExtension, error)](#dbExtensions.GetByUUID)
        * [func (s dbExtensions) GetByExtensionID(ctx context.Context, extensionID string) (*dbExtension, error)](#dbExtensions.GetByExtensionID)
        * [func (s dbExtensions) GetFeaturedExtensions(ctx context.Context) ([]*dbExtension, error)](#dbExtensions.GetFeaturedExtensions)
        * [func (s dbExtensions) getFeaturedExtensions(ctx context.Context, featuredExtensionIDs []string) ([]*dbExtension, error)](#dbExtensions.getFeaturedExtensions)
        * [func (s dbExtensions) List(ctx context.Context, opt dbExtensionsListOptions) ([]*dbExtension, error)](#dbExtensions.List)
        * [func (dbExtensions) listCountSQL(conds []*sqlf.Query) *sqlf.Query](#dbExtensions.listCountSQL)
        * [func (s dbExtensions) list(ctx context.Context, conds, order []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbExtension, error)](#dbExtensions.list)
        * [func (s dbExtensions) Count(ctx context.Context, opt dbExtensionsListOptions) (int, error)](#dbExtensions.Count)
        * [func (dbExtensions) Update(ctx context.Context, id int32, name *string) error](#dbExtensions.Update)
        * [func (dbExtensions) Delete(ctx context.Context, id int32) error](#dbExtensions.Delete)
        * [func (s dbExtensions) ListPublishers(ctx context.Context, opt dbPublishersListOptions) ([]*dbPublisher, error)](#dbExtensions.ListPublishers)
        * [func (dbExtensions) publishersSQLCTE() *sqlf.Query](#dbExtensions.publishersSQLCTE)
        * [func (s dbExtensions) listPublishers(ctx context.Context, conds []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbPublisher, error)](#dbExtensions.listPublishers)
        * [func (s dbExtensions) CountPublishers(ctx context.Context, opt dbPublishersListOptions) (int, error)](#dbExtensions.CountPublishers)
        * [func (s dbExtensions) GetPublisher(ctx context.Context, name string) (*dbPublisher, error)](#dbExtensions.GetPublisher)
    * [type extensionNotFoundError struct](#extensionNotFoundError)
        * [func (err extensionNotFoundError) NotFound() bool](#extensionNotFoundError.NotFound)
        * [func (err extensionNotFoundError) Error() string](#extensionNotFoundError.Error)
    * [type dbExtensionsListOptions struct](#dbExtensionsListOptions)
        * [func toDBExtensionsListOptions(args graphqlbackend.RegistryExtensionConnectionArgs) (dbExtensionsListOptions, error)](#toDBExtensionsListOptions)
        * [func (o dbExtensionsListOptions) sqlConditions() []*sqlf.Query](#dbExtensionsListOptions.sqlConditions)
        * [func (o dbExtensionsListOptions) sqlOrder() []*sqlf.Query](#dbExtensionsListOptions.sqlOrder)
    * [type mockExtensions struct](#mockExtensions)
    * [type responseRecorder struct](#responseRecorder)
        * [func (r *responseRecorder) WriteHeader(code int)](#responseRecorder.WriteHeader)
    * [type dbMocks struct](#dbMocks)
    * [type registryPublisherConnection struct](#registryPublisherConnection)
        * [func (r *registryPublisherConnection) compute(ctx context.Context) ([]*dbPublisher, error)](#registryPublisherConnection.compute)
        * [func (r *registryPublisherConnection) Nodes(ctx context.Context) ([]graphqlbackend.RegistryPublisher, error)](#registryPublisherConnection.Nodes)
        * [func (r *registryPublisherConnection) TotalCount(ctx context.Context) (int32, error)](#registryPublisherConnection.TotalCount)
        * [func (r *registryPublisherConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#registryPublisherConnection.PageInfo)
    * [type registryPublisher struct](#registryPublisher)
        * [func getRegistryPublisher(ctx context.Context, db dbutil.DB, publisher dbPublisher) (*registryPublisher, error)](#getRegistryPublisher)
        * [func (r *registryPublisher) ToUser() (*graphqlbackend.UserResolver, bool)](#registryPublisher.ToUser)
        * [func (r *registryPublisher) ToOrg() (*graphqlbackend.OrgResolver, bool)](#registryPublisher.ToOrg)
        * [func (r *registryPublisher) toDBRegistryPublisher() dbPublisher](#registryPublisher.toDBRegistryPublisher)
        * [func (r *registryPublisher) RegistryExtensionConnectionURL() (*string, error)](#registryPublisher.RegistryExtensionConnectionURL)
    * [type registryPublisherID struct](#registryPublisherID)
        * [func toRegistryPublisherID(extension *dbExtension) *registryPublisherID](#toRegistryPublisherID)
        * [func unmarshalRegistryPublisherID(id graphql.ID) (*registryPublisherID, error)](#unmarshalRegistryPublisherID)
        * [func (p *registryPublisherID) viewerCanAdminister(ctx context.Context, db dbutil.DB) error](#registryPublisherID.viewerCanAdminister)
    * [type dbPublisher struct](#dbPublisher)
        * [func (p dbPublisher) IsZero() bool](#dbPublisher.IsZero)
    * [type publisherNotFoundError struct](#publisherNotFoundError)
        * [func (err publisherNotFoundError) NotFound() bool](#publisherNotFoundError.NotFound)
        * [func (err publisherNotFoundError) Error() string](#publisherNotFoundError.Error)
    * [type dbPublishersListOptions struct](#dbPublishersListOptions)
        * [func (o dbPublishersListOptions) sqlConditions() []*sqlf.Query](#dbPublishersListOptions.sqlConditions)
    * [type dbRelease struct](#dbRelease)
        * [func getLatestRelease(ctx context.Context, extensionID string, registryExtensionID int32, releaseTag string) (*dbRelease, error)](#getLatestRelease)
    * [type dbReleases struct{}](#dbReleases)
        * [func (dbReleases) Create(ctx context.Context, release *dbRelease) (id int64, err error)](#dbReleases.Create)
        * [func (dbReleases) GetLatest(ctx context.Context, registryExtensionID int32, releaseTag string, includeArtifacts bool) (*dbRelease, error)](#dbReleases.GetLatest)
        * [func (dbReleases) GetLatestBatch(ctx context.Context, registryExtensionIDs []int32, releaseTag string, includeArtifacts bool) ([]*dbRelease, error)](#dbReleases.GetLatestBatch)
        * [func (dbReleases) GetArtifacts(ctx context.Context, id int64) (bundle, sourcemap []byte, err error)](#dbReleases.GetArtifacts)
    * [type releaseNotFoundError struct](#releaseNotFoundError)
        * [func (err releaseNotFoundError) NotFound() bool](#releaseNotFoundError.NotFound)
        * [func (err releaseNotFoundError) Error() string](#releaseNotFoundError.Error)
    * [type mockReleases struct](#mockReleases)
* [Functions](#func)
    * [func init()](#init)
    * [func getAllowedExtensionsFromSiteConfig() []string](#getAllowedExtensionsFromSiteConfig)
    * [func init()](#init)
    * [func handleRegistryExtensionBundle(w http.ResponseWriter, r *http.Request)](#handleRegistryExtensionBundle)
    * [func parseExtensionBundleFilename(filename string) (int64, error)](#parseExtensionBundleFilename)
    * [func init()](#init)
    * [func listLocalRegistryExtensions(ctx context.Context, db dbutil.DB, args graphqlbackend.RegistryExtensionConnectionArgs) ([]graphqlbackend.RegistryExtension, error)](#listLocalRegistryExtensions)
    * [func countLocalRegistryExtensions(ctx context.Context, db dbutil.DB, args graphqlbackend.RegistryExtensionConnectionArgs) (int, error)](#countLocalRegistryExtensions)
    * [func parseExtensionQuery(q string) (text, category, tag string)](#parseExtensionQuery)
    * [func filterStripLocalExtensionIDs(extensionIDs []string) []string](#filterStripLocalExtensionIDs)
    * [func strptr(s string) *string](#strptr)
    * [func validateExtensionManifest(text string) error](#validateExtensionManifest)
    * [func getLatestForBatch(ctx context.Context, vs []*dbExtension) (map[int32]*dbRelease, error)](#getLatestForBatch)
    * [func prepReleaseManifest(extensionID string, release *dbRelease) error](#prepReleaseManifest)
    * [func makeExtensionBundleURL(registryExtensionReleaseID int64, timestamp int64, extensionIDHint string) (string, error)](#makeExtensionBundleURL)
    * [func init()](#init)
    * [func prefixLocalExtensionID(xs ...*dbExtension) error](#prefixLocalExtensionID)
    * [func init()](#init)
    * [func toRegistryAPIExtension(ctx context.Context, v *dbExtension) (*registry.Extension, error)](#toRegistryAPIExtension)
    * [func toRegistryAPIExtensionBatch(ctx context.Context, vs []*dbExtension) ([]*registry.Extension, error)](#toRegistryAPIExtensionBatch)
    * [func newExtension(v *dbExtension, manifest *string, publishedAt time.Time) *registry.Extension](#newExtension)
    * [func handleRegistry(w http.ResponseWriter, r *http.Request) (err error)](#handleRegistry)
    * [func init()](#init)
    * [func resetMocks()](#resetMocks)
    * [func init()](#init)
    * [func extensionRegistryPublishers(ctx context.Context, db dbutil.DB, args *graphqlutil.ConnectionArgs) (graphqlbackend.RegistryPublisherConnection, error)](#extensionRegistryPublishers)
    * [func init()](#init)
    * [func extensionRegistryViewerPublishers(ctx context.Context, db dbutil.DB) ([]graphqlbackend.RegistryPublisher, error)](#extensionRegistryViewerPublishers)
    * [func init()](#init)
    * [func registryExtensionByIDInt32(ctx context.Context, db dbutil.DB, id int32) (graphqlbackend.RegistryExtension, error)](#registryExtensionByIDInt32)
    * [func extensionRegistryCreateExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryCreateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)](#extensionRegistryCreateExtension)
    * [func viewerCanAdministerExtension(ctx context.Context, db dbutil.DB, id frontendregistry.RegistryExtensionID) error](#viewerCanAdministerExtension)
    * [func extensionRegistryUpdateExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryUpdateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)](#extensionRegistryUpdateExtension)
    * [func extensionRegistryDeleteExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryDeleteExtensionArgs) (*graphqlbackend.EmptyResponse, error)](#extensionRegistryDeleteExtension)
    * [func extensionRegistryPublishExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryPublishExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)](#extensionRegistryPublishExtension)
    * [func TestIsRemoteExtensionAllowed(t *testing.T)](#TestIsRemoteExtensionAllowed)
    * [func sameElements(a, b []string) bool](#sameElements)
    * [func TestFilterRemoteExtensions(t *testing.T)](#TestFilterRemoteExtensions)
    * [func init()](#init)
    * [func TestParseExtensionBundleFilename(t *testing.T)](#TestParseExtensionBundleFilename)
    * [func TestFilteringExtensionIDs(t *testing.T)](#TestFilteringExtensionIDs)
    * [func TestToDBExtensionsListOptions(t *testing.T)](#TestToDBExtensionsListOptions)
    * [func strarrayptr(values []string) *[]string](#strarrayptr)
    * [func TestGetExtensionManifestWithBundleURL(t *testing.T)](#TestGetExtensionManifestWithBundleURL)
    * [func jsonDeepEqual(a, b string) bool](#jsonDeepEqual)
    * [func TestRegistryExtensions_validNames(t *testing.T)](#TestRegistryExtensions_validNames)
    * [func TestRegistryExtensions(t *testing.T)](#TestRegistryExtensions)
    * [func TestRegistryExtensions_ListCount(t *testing.T)](#TestRegistryExtensions_ListCount)
    * [func TestFeaturedExtensions(t *testing.T)](#TestFeaturedExtensions)
    * [func asJSON(t *testing.T, v interface{}) string](#asJSON)
    * [func TestRegistryExtensionReleases(t *testing.T)](#TestRegistryExtensionReleases)


## <a id="const" href="#const">Constants</a>

### <a id="extensionPublisherNameExpr" href="#extensionPublisherNameExpr">const extensionPublisherNameExpr</a>

```
searchKey: registry.extensionPublisherNameExpr
```

```Go
const extensionPublisherNameExpr = "COALESCE(users.username, orgs.name)"
```

extensionPublisherNameExpr is the SQL expression for the extension's publisher's name (using the table aliases created by (dbExtensions).listCountSQL. 

### <a id="extensionIDExpr" href="#extensionIDExpr">const extensionIDExpr</a>

```
searchKey: registry.extensionIDExpr
```

```Go
const extensionIDExpr = "CONCAT(" + extensionPublisherNameExpr + ", '/', x.name)"
```

extensionIDExpr is the SQL expression for the extension ID (using the table aliases created by (dbExtensions).listCountSQL. 

## <a id="var" href="#var">Variables</a>

### <a id="sourceMappingURLLineRegex" href="#sourceMappingURLLineRegex">var sourceMappingURLLineRegex</a>

```
searchKey: registry.sourceMappingURLLineRegex
```

```Go
var sourceMappingURLLineRegex = lazyregexp.New(`(?m)\r?\n?^//# sourceMappingURL=.+$`)
```

sourceMappingURLLineRegex is a regular expression that matches all lines with a `//# sourceMappingURL` comment 

### <a id="nonLettersDigits" href="#nonLettersDigits">var nonLettersDigits</a>

```
searchKey: registry.nonLettersDigits
```

```Go
var nonLettersDigits = lazyregexp.New(`[^a-zA-Z0-9-]`)
```

### <a id="featuredExtensionIDs" href="#featuredExtensionIDs">var featuredExtensionIDs</a>

```
searchKey: registry.featuredExtensionIDs
```

```Go
var featuredExtensionIDs = ...
```

Temporary: we manually set these. Featured extensions live on sourcegraph.com, all other instances ask dotcom for these extensions and filter based on site configuration. 

### <a id="extensionIsWIPExpr" href="#extensionIsWIPExpr">var extensionIsWIPExpr</a>

```
searchKey: registry.extensionIsWIPExpr
```

```Go
var extensionIsWIPExpr = ...
```

extensionIsWIPExpr is the SQL expression for whether the extension is a WIP extension. 

BACKCOMPAT: It still reads the title property even though extensions no longer have titles. 

### <a id="registryList" href="#registryList">var registryList</a>

```
searchKey: registry.registryList
```

```Go
var registryList = ...
```

Funcs called by serveRegistry to get registry data. If fakeRegistryData is set, it is used as the data source instead of the database. 

### <a id="registryGetByUUID" href="#registryGetByUUID">var registryGetByUUID</a>

```
searchKey: registry.registryGetByUUID
```

```Go
var registryGetByUUID = ...
```

Funcs called by serveRegistry to get registry data. If fakeRegistryData is set, it is used as the data source instead of the database. 

### <a id="registryGetByExtensionID" href="#registryGetByExtensionID">var registryGetByExtensionID</a>

```
searchKey: registry.registryGetByExtensionID
```

```Go
var registryGetByExtensionID = ...
```

Funcs called by serveRegistry to get registry data. If fakeRegistryData is set, it is used as the data source instead of the database. 

### <a id="registryGetFeaturedExtensions" href="#registryGetFeaturedExtensions">var registryGetFeaturedExtensions</a>

```
searchKey: registry.registryGetFeaturedExtensions
```

```Go
var registryGetFeaturedExtensions = ...
```

Funcs called by serveRegistry to get registry data. If fakeRegistryData is set, it is used as the data source instead of the database. 

### <a id="registryRequestsDuration" href="#registryRequestsDuration">var registryRequestsDuration</a>

```
searchKey: registry.registryRequestsDuration
```

```Go
var registryRequestsDuration = ...
```

### <a id="mocks" href="#mocks">var mocks</a>

```
searchKey: registry.mocks
```

```Go
var mocks dbMocks
```

### <a id="errRegistryUnknownPublisher" href="#errRegistryUnknownPublisher">var errRegistryUnknownPublisher</a>

```
searchKey: registry.errRegistryUnknownPublisher
```

```Go
var errRegistryUnknownPublisher = errors.New("unknown registry extension publisher")
```

### <a id="errInvalidJSONInManifest" href="#errInvalidJSONInManifest">var errInvalidJSONInManifest</a>

```
searchKey: registry.errInvalidJSONInManifest
```

```Go
var errInvalidJSONInManifest = errors.New("invalid syntax in extension manifest JSON")
```

### <a id="registryExtensionNamesForTests" href="#registryExtensionNamesForTests">var registryExtensionNamesForTests</a>

```
searchKey: registry.registryExtensionNamesForTests
```

```Go
var registryExtensionNamesForTests = ...
```

registryExtensionNamesForTests is a list of test cases containing valid and invalid registry extension names. 

## <a id="type" href="#type">Types</a>

### <a id="extensionDBResolver" href="#extensionDBResolver">type extensionDBResolver struct</a>

```
searchKey: registry.extensionDBResolver
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

#### <a id="extensionDBResolver.ID" href="#extensionDBResolver.ID">func (r *extensionDBResolver) ID() graphql.ID</a>

```
searchKey: registry.extensionDBResolver.ID
```

```Go
func (r *extensionDBResolver) ID() graphql.ID
```

#### <a id="extensionDBResolver.UUID" href="#extensionDBResolver.UUID">func (r *extensionDBResolver) UUID() string</a>

```
searchKey: registry.extensionDBResolver.UUID
```

```Go
func (r *extensionDBResolver) UUID() string
```

#### <a id="extensionDBResolver.ExtensionID" href="#extensionDBResolver.ExtensionID">func (r *extensionDBResolver) ExtensionID() string</a>

```
searchKey: registry.extensionDBResolver.ExtensionID
```

```Go
func (r *extensionDBResolver) ExtensionID() string
```

#### <a id="extensionDBResolver.ExtensionIDWithoutRegistry" href="#extensionDBResolver.ExtensionIDWithoutRegistry">func (r *extensionDBResolver) ExtensionIDWithoutRegistry() string</a>

```
searchKey: registry.extensionDBResolver.ExtensionIDWithoutRegistry
```

```Go
func (r *extensionDBResolver) ExtensionIDWithoutRegistry() string
```

#### <a id="extensionDBResolver.Publisher" href="#extensionDBResolver.Publisher">func (r *extensionDBResolver) Publisher(ctx context.Context) (graphqlbackend.RegistryPublisher, error)</a>

```
searchKey: registry.extensionDBResolver.Publisher
```

```Go
func (r *extensionDBResolver) Publisher(ctx context.Context) (graphqlbackend.RegistryPublisher, error)
```

#### <a id="extensionDBResolver.Name" href="#extensionDBResolver.Name">func (r *extensionDBResolver) Name() string</a>

```
searchKey: registry.extensionDBResolver.Name
```

```Go
func (r *extensionDBResolver) Name() string
```

#### <a id="extensionDBResolver.Manifest" href="#extensionDBResolver.Manifest">func (r *extensionDBResolver) Manifest(ctx context.Context) (graphqlbackend.ExtensionManifest, error)</a>

```
searchKey: registry.extensionDBResolver.Manifest
```

```Go
func (r *extensionDBResolver) Manifest(ctx context.Context) (graphqlbackend.ExtensionManifest, error)
```

#### <a id="extensionDBResolver.CreatedAt" href="#extensionDBResolver.CreatedAt">func (r *extensionDBResolver) CreatedAt() *graphqlbackend.DateTime</a>

```
searchKey: registry.extensionDBResolver.CreatedAt
```

```Go
func (r *extensionDBResolver) CreatedAt() *graphqlbackend.DateTime
```

#### <a id="extensionDBResolver.UpdatedAt" href="#extensionDBResolver.UpdatedAt">func (r *extensionDBResolver) UpdatedAt() *graphqlbackend.DateTime</a>

```
searchKey: registry.extensionDBResolver.UpdatedAt
```

```Go
func (r *extensionDBResolver) UpdatedAt() *graphqlbackend.DateTime
```

#### <a id="extensionDBResolver.PublishedAt" href="#extensionDBResolver.PublishedAt">func (r *extensionDBResolver) PublishedAt(ctx context.Context) (*graphqlbackend.DateTime, error)</a>

```
searchKey: registry.extensionDBResolver.PublishedAt
```

```Go
func (r *extensionDBResolver) PublishedAt(ctx context.Context) (*graphqlbackend.DateTime, error)
```

#### <a id="extensionDBResolver.URL" href="#extensionDBResolver.URL">func (r *extensionDBResolver) URL() string</a>

```
searchKey: registry.extensionDBResolver.URL
```

```Go
func (r *extensionDBResolver) URL() string
```

#### <a id="extensionDBResolver.RemoteURL" href="#extensionDBResolver.RemoteURL">func (r *extensionDBResolver) RemoteURL() *string</a>

```
searchKey: registry.extensionDBResolver.RemoteURL
```

```Go
func (r *extensionDBResolver) RemoteURL() *string
```

#### <a id="extensionDBResolver.RegistryName" href="#extensionDBResolver.RegistryName">func (r *extensionDBResolver) RegistryName() (string, error)</a>

```
searchKey: registry.extensionDBResolver.RegistryName
```

```Go
func (r *extensionDBResolver) RegistryName() (string, error)
```

#### <a id="extensionDBResolver.IsLocal" href="#extensionDBResolver.IsLocal">func (r *extensionDBResolver) IsLocal() bool</a>

```
searchKey: registry.extensionDBResolver.IsLocal
```

```Go
func (r *extensionDBResolver) IsLocal() bool
```

#### <a id="extensionDBResolver.IsWorkInProgress" href="#extensionDBResolver.IsWorkInProgress">func (r *extensionDBResolver) IsWorkInProgress() bool</a>

```
searchKey: registry.extensionDBResolver.IsWorkInProgress
```

```Go
func (r *extensionDBResolver) IsWorkInProgress() bool
```

#### <a id="extensionDBResolver.ViewerCanAdminister" href="#extensionDBResolver.ViewerCanAdminister">func (r *extensionDBResolver) ViewerCanAdminister(ctx context.Context) (bool, error)</a>

```
searchKey: registry.extensionDBResolver.ViewerCanAdminister
```

```Go
func (r *extensionDBResolver) ViewerCanAdminister(ctx context.Context) (bool, error)
```

#### <a id="extensionDBResolver.release" href="#extensionDBResolver.release">func (r *extensionDBResolver) release(ctx context.Context) (*dbRelease, error)</a>

```
searchKey: registry.extensionDBResolver.release
```

```Go
func (r *extensionDBResolver) release(ctx context.Context) (*dbRelease, error)
```

### <a id="dbExtension" href="#dbExtension">type dbExtension struct</a>

```
searchKey: registry.dbExtension
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
```

```Go
type dbExtensions struct{}
```

#### <a id="dbExtensions.Create" href="#dbExtensions.Create">func (s dbExtensions) Create(ctx context.Context, publisherUserID, publisherOrgID int32, name string) (id int32, err error)</a>

```
searchKey: registry.dbExtensions.Create
```

```Go
func (s dbExtensions) Create(ctx context.Context, publisherUserID, publisherOrgID int32, name string) (id int32, err error)
```

Create creates a new extension in the extension registry. Exactly 1 of publisherUserID and publisherOrgID must be nonzero. 

#### <a id="dbExtensions.GetByID" href="#dbExtensions.GetByID">func (s dbExtensions) GetByID(ctx context.Context, id int32) (*dbExtension, error)</a>

```
searchKey: registry.dbExtensions.GetByID
```

```Go
func (s dbExtensions) GetByID(ctx context.Context, id int32) (*dbExtension, error)
```

GetByID retrieves the registry extension (if any) given its ID. 

🚨 SECURITY: The caller must ensure that the actor is permitted to view this registry extension. 

#### <a id="dbExtensions.GetByUUID" href="#dbExtensions.GetByUUID">func (s dbExtensions) GetByUUID(ctx context.Context, uuid string) (*dbExtension, error)</a>

```
searchKey: registry.dbExtensions.GetByUUID
```

```Go
func (s dbExtensions) GetByUUID(ctx context.Context, uuid string) (*dbExtension, error)
```

GetByUUID retrieves the registry extension (if any) given its UUID. 

🚨 SECURITY: The caller must ensure that the actor is permitted to view this registry extension. 

#### <a id="dbExtensions.GetByExtensionID" href="#dbExtensions.GetByExtensionID">func (s dbExtensions) GetByExtensionID(ctx context.Context, extensionID string) (*dbExtension, error)</a>

```
searchKey: registry.dbExtensions.GetByExtensionID
```

```Go
func (s dbExtensions) GetByExtensionID(ctx context.Context, extensionID string) (*dbExtension, error)
```

GetByExtensionID retrieves the registry extension (if any) given its extension ID, which is the concatenation of the publisher name, a slash ("/"), and the extension name. 

🚨 SECURITY: The caller must ensure that the actor is permitted to view this registry extension. 

#### <a id="dbExtensions.GetFeaturedExtensions" href="#dbExtensions.GetFeaturedExtensions">func (s dbExtensions) GetFeaturedExtensions(ctx context.Context) ([]*dbExtension, error)</a>

```
searchKey: registry.dbExtensions.GetFeaturedExtensions
```

```Go
func (s dbExtensions) GetFeaturedExtensions(ctx context.Context) ([]*dbExtension, error)
```

GetFeaturedExtensions retrieves the set of currently featured extensions. This should only be called on dotcom; all other instances should retrieve these extensions from dotcom through the HTTP API. 

🚨 SECURITY: The caller must ensure that the actor is permitted to view these registry extensions. 

#### <a id="dbExtensions.getFeaturedExtensions" href="#dbExtensions.getFeaturedExtensions">func (s dbExtensions) getFeaturedExtensions(ctx context.Context, featuredExtensionIDs []string) ([]*dbExtension, error)</a>

```
searchKey: registry.dbExtensions.getFeaturedExtensions
```

```Go
func (s dbExtensions) getFeaturedExtensions(ctx context.Context, featuredExtensionIDs []string) ([]*dbExtension, error)
```

#### <a id="dbExtensions.List" href="#dbExtensions.List">func (s dbExtensions) List(ctx context.Context, opt dbExtensionsListOptions) ([]*dbExtension, error)</a>

```
searchKey: registry.dbExtensions.List
```

```Go
func (s dbExtensions) List(ctx context.Context, opt dbExtensionsListOptions) ([]*dbExtension, error)
```

List lists all registry extensions that satisfy the options. 

🚨 SECURITY: The caller must ensure that the actor is permitted to list with the specified options. 

#### <a id="dbExtensions.listCountSQL" href="#dbExtensions.listCountSQL">func (dbExtensions) listCountSQL(conds []*sqlf.Query) *sqlf.Query</a>

```
searchKey: registry.dbExtensions.listCountSQL
```

```Go
func (dbExtensions) listCountSQL(conds []*sqlf.Query) *sqlf.Query
```

#### <a id="dbExtensions.list" href="#dbExtensions.list">func (s dbExtensions) list(ctx context.Context, conds, order []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbExtension, error)</a>

```
searchKey: registry.dbExtensions.list
```

```Go
func (s dbExtensions) list(ctx context.Context, conds, order []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbExtension, error)
```

#### <a id="dbExtensions.Count" href="#dbExtensions.Count">func (s dbExtensions) Count(ctx context.Context, opt dbExtensionsListOptions) (int, error)</a>

```
searchKey: registry.dbExtensions.Count
```

```Go
func (s dbExtensions) Count(ctx context.Context, opt dbExtensionsListOptions) (int, error)
```

Count counts all registry extensions that satisfy the options (ignoring limit and offset). 

🚨 SECURITY: The caller must ensure that the actor is permitted to count the results. 

#### <a id="dbExtensions.Update" href="#dbExtensions.Update">func (dbExtensions) Update(ctx context.Context, id int32, name *string) error</a>

```
searchKey: registry.dbExtensions.Update
```

```Go
func (dbExtensions) Update(ctx context.Context, id int32, name *string) error
```

Update updates information about the registry extension. 

#### <a id="dbExtensions.Delete" href="#dbExtensions.Delete">func (dbExtensions) Delete(ctx context.Context, id int32) error</a>

```
searchKey: registry.dbExtensions.Delete
```

```Go
func (dbExtensions) Delete(ctx context.Context, id int32) error
```

Delete marks an registry extension as deleted. 

#### <a id="dbExtensions.ListPublishers" href="#dbExtensions.ListPublishers">func (s dbExtensions) ListPublishers(ctx context.Context, opt dbPublishersListOptions) ([]*dbPublisher, error)</a>

```
searchKey: registry.dbExtensions.ListPublishers
```

```Go
func (s dbExtensions) ListPublishers(ctx context.Context, opt dbPublishersListOptions) ([]*dbPublisher, error)
```

ListPublishers lists all publishers of extensions to the registry. 

🚨 SECURITY: The caller must ensure that the actor is permitted to list with the specified options. 

#### <a id="dbExtensions.publishersSQLCTE" href="#dbExtensions.publishersSQLCTE">func (dbExtensions) publishersSQLCTE() *sqlf.Query</a>

```
searchKey: registry.dbExtensions.publishersSQLCTE
```

```Go
func (dbExtensions) publishersSQLCTE() *sqlf.Query
```

#### <a id="dbExtensions.listPublishers" href="#dbExtensions.listPublishers">func (s dbExtensions) listPublishers(ctx context.Context, conds []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbPublisher, error)</a>

```
searchKey: registry.dbExtensions.listPublishers
```

```Go
func (s dbExtensions) listPublishers(ctx context.Context, conds []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbPublisher, error)
```

#### <a id="dbExtensions.CountPublishers" href="#dbExtensions.CountPublishers">func (s dbExtensions) CountPublishers(ctx context.Context, opt dbPublishersListOptions) (int, error)</a>

```
searchKey: registry.dbExtensions.CountPublishers
```

```Go
func (s dbExtensions) CountPublishers(ctx context.Context, opt dbPublishersListOptions) (int, error)
```

CountPublishers counts all registry publishers that satisfy the options (ignoring limit and offset). 

🚨 SECURITY: The caller must ensure that the actor is permitted to count the results. 

#### <a id="dbExtensions.GetPublisher" href="#dbExtensions.GetPublisher">func (s dbExtensions) GetPublisher(ctx context.Context, name string) (*dbPublisher, error)</a>

```
searchKey: registry.dbExtensions.GetPublisher
```

```Go
func (s dbExtensions) GetPublisher(ctx context.Context, name string) (*dbPublisher, error)
```

GePublisher gets the registry publisher with the given name. 

### <a id="extensionNotFoundError" href="#extensionNotFoundError">type extensionNotFoundError struct</a>

```
searchKey: registry.extensionNotFoundError
```

```Go
type extensionNotFoundError struct {
	args []interface{}
}
```

extensionNotFoundError occurs when an extension is not found in the extension registry. 

#### <a id="extensionNotFoundError.NotFound" href="#extensionNotFoundError.NotFound">func (err extensionNotFoundError) NotFound() bool</a>

```
searchKey: registry.extensionNotFoundError.NotFound
```

```Go
func (err extensionNotFoundError) NotFound() bool
```

NotFound implements errcode.NotFounder. 

#### <a id="extensionNotFoundError.Error" href="#extensionNotFoundError.Error">func (err extensionNotFoundError) Error() string</a>

```
searchKey: registry.extensionNotFoundError.Error
```

```Go
func (err extensionNotFoundError) Error() string
```

### <a id="dbExtensionsListOptions" href="#dbExtensionsListOptions">type dbExtensionsListOptions struct</a>

```
searchKey: registry.dbExtensionsListOptions
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
```

```Go
func toDBExtensionsListOptions(args graphqlbackend.RegistryExtensionConnectionArgs) (dbExtensionsListOptions, error)
```

#### <a id="dbExtensionsListOptions.sqlConditions" href="#dbExtensionsListOptions.sqlConditions">func (o dbExtensionsListOptions) sqlConditions() []*sqlf.Query</a>

```
searchKey: registry.dbExtensionsListOptions.sqlConditions
```

```Go
func (o dbExtensionsListOptions) sqlConditions() []*sqlf.Query
```

#### <a id="dbExtensionsListOptions.sqlOrder" href="#dbExtensionsListOptions.sqlOrder">func (o dbExtensionsListOptions) sqlOrder() []*sqlf.Query</a>

```
searchKey: registry.dbExtensionsListOptions.sqlOrder
```

```Go
func (o dbExtensionsListOptions) sqlOrder() []*sqlf.Query
```

### <a id="mockExtensions" href="#mockExtensions">type mockExtensions struct</a>

```
searchKey: registry.mockExtensions
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

### <a id="responseRecorder" href="#responseRecorder">type responseRecorder struct</a>

```
searchKey: registry.responseRecorder
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
```

```Go
func (r *responseRecorder) WriteHeader(code int)
```

### <a id="dbMocks" href="#dbMocks">type dbMocks struct</a>

```
searchKey: registry.dbMocks
```

```Go
type dbMocks struct {
	extensions mockExtensions
	releases   mockReleases
}
```

### <a id="registryPublisherConnection" href="#registryPublisherConnection">type registryPublisherConnection struct</a>

```
searchKey: registry.registryPublisherConnection
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

#### <a id="registryPublisherConnection.compute" href="#registryPublisherConnection.compute">func (r *registryPublisherConnection) compute(ctx context.Context) ([]*dbPublisher, error)</a>

```
searchKey: registry.registryPublisherConnection.compute
```

```Go
func (r *registryPublisherConnection) compute(ctx context.Context) ([]*dbPublisher, error)
```

#### <a id="registryPublisherConnection.Nodes" href="#registryPublisherConnection.Nodes">func (r *registryPublisherConnection) Nodes(ctx context.Context) ([]graphqlbackend.RegistryPublisher, error)</a>

```
searchKey: registry.registryPublisherConnection.Nodes
```

```Go
func (r *registryPublisherConnection) Nodes(ctx context.Context) ([]graphqlbackend.RegistryPublisher, error)
```

#### <a id="registryPublisherConnection.TotalCount" href="#registryPublisherConnection.TotalCount">func (r *registryPublisherConnection) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: registry.registryPublisherConnection.TotalCount
```

```Go
func (r *registryPublisherConnection) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="registryPublisherConnection.PageInfo" href="#registryPublisherConnection.PageInfo">func (r *registryPublisherConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: registry.registryPublisherConnection.PageInfo
```

```Go
func (r *registryPublisherConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

### <a id="registryPublisher" href="#registryPublisher">type registryPublisher struct</a>

```
searchKey: registry.registryPublisher
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
```

```Go
func getRegistryPublisher(ctx context.Context, db dbutil.DB, publisher dbPublisher) (*registryPublisher, error)
```

#### <a id="registryPublisher.ToUser" href="#registryPublisher.ToUser">func (r *registryPublisher) ToUser() (*graphqlbackend.UserResolver, bool)</a>

```
searchKey: registry.registryPublisher.ToUser
```

```Go
func (r *registryPublisher) ToUser() (*graphqlbackend.UserResolver, bool)
```

#### <a id="registryPublisher.ToOrg" href="#registryPublisher.ToOrg">func (r *registryPublisher) ToOrg() (*graphqlbackend.OrgResolver, bool)</a>

```
searchKey: registry.registryPublisher.ToOrg
```

```Go
func (r *registryPublisher) ToOrg() (*graphqlbackend.OrgResolver, bool)
```

#### <a id="registryPublisher.toDBRegistryPublisher" href="#registryPublisher.toDBRegistryPublisher">func (r *registryPublisher) toDBRegistryPublisher() dbPublisher</a>

```
searchKey: registry.registryPublisher.toDBRegistryPublisher
```

```Go
func (r *registryPublisher) toDBRegistryPublisher() dbPublisher
```

#### <a id="registryPublisher.RegistryExtensionConnectionURL" href="#registryPublisher.RegistryExtensionConnectionURL">func (r *registryPublisher) RegistryExtensionConnectionURL() (*string, error)</a>

```
searchKey: registry.registryPublisher.RegistryExtensionConnectionURL
```

```Go
func (r *registryPublisher) RegistryExtensionConnectionURL() (*string, error)
```

### <a id="registryPublisherID" href="#registryPublisherID">type registryPublisherID struct</a>

```
searchKey: registry.registryPublisherID
```

```Go
type registryPublisherID struct {
	userID, orgID int32
}
```

#### <a id="toRegistryPublisherID" href="#toRegistryPublisherID">func toRegistryPublisherID(extension *dbExtension) *registryPublisherID</a>

```
searchKey: registry.toRegistryPublisherID
```

```Go
func toRegistryPublisherID(extension *dbExtension) *registryPublisherID
```

#### <a id="unmarshalRegistryPublisherID" href="#unmarshalRegistryPublisherID">func unmarshalRegistryPublisherID(id graphql.ID) (*registryPublisherID, error)</a>

```
searchKey: registry.unmarshalRegistryPublisherID
```

```Go
func unmarshalRegistryPublisherID(id graphql.ID) (*registryPublisherID, error)
```

unmarshalRegistryPublisherID unmarshals the GraphQL ID into the possible publisher ID types. 

🚨 SECURITY 

#### <a id="registryPublisherID.viewerCanAdminister" href="#registryPublisherID.viewerCanAdminister">func (p *registryPublisherID) viewerCanAdminister(ctx context.Context, db dbutil.DB) error</a>

```
searchKey: registry.registryPublisherID.viewerCanAdminister
```

```Go
func (p *registryPublisherID) viewerCanAdminister(ctx context.Context, db dbutil.DB) error
```

viewerCanAdminister returns whether the current user is allowed to perform mutations on a registry extension with the given publisher. 

🚨 SECURITY 

### <a id="dbPublisher" href="#dbPublisher">type dbPublisher struct</a>

```
searchKey: registry.dbPublisher
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
```

```Go
func (p dbPublisher) IsZero() bool
```

IsZero reports whether p is the zero value. 

### <a id="publisherNotFoundError" href="#publisherNotFoundError">type publisherNotFoundError struct</a>

```
searchKey: registry.publisherNotFoundError
```

```Go
type publisherNotFoundError struct {
	args []interface{}
}
```

publisherNotFoundError occurs when a registry extension publisher is not found. 

#### <a id="publisherNotFoundError.NotFound" href="#publisherNotFoundError.NotFound">func (err publisherNotFoundError) NotFound() bool</a>

```
searchKey: registry.publisherNotFoundError.NotFound
```

```Go
func (err publisherNotFoundError) NotFound() bool
```

NotFound implements errcode.NotFounder. 

#### <a id="publisherNotFoundError.Error" href="#publisherNotFoundError.Error">func (err publisherNotFoundError) Error() string</a>

```
searchKey: registry.publisherNotFoundError.Error
```

```Go
func (err publisherNotFoundError) Error() string
```

### <a id="dbPublishersListOptions" href="#dbPublishersListOptions">type dbPublishersListOptions struct</a>

```
searchKey: registry.dbPublishersListOptions
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
```

```Go
func (o dbPublishersListOptions) sqlConditions() []*sqlf.Query
```

### <a id="dbRelease" href="#dbRelease">type dbRelease struct</a>

```
searchKey: registry.dbRelease
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
```

```Go
func getLatestRelease(ctx context.Context, extensionID string, registryExtensionID int32, releaseTag string) (*dbRelease, error)
```

getLatestRelease returns the release with the extension manifest as JSON. If there are no releases, it returns a nil manifest. If the manifest has no "url" field itself, a "url" field pointing to the extension's bundle is inserted. It also returns the date that the release was published. 

### <a id="dbReleases" href="#dbReleases">type dbReleases struct{}</a>

```
searchKey: registry.dbReleases
```

```Go
type dbReleases struct{}
```

#### <a id="dbReleases.Create" href="#dbReleases.Create">func (dbReleases) Create(ctx context.Context, release *dbRelease) (id int64, err error)</a>

```
searchKey: registry.dbReleases.Create
```

```Go
func (dbReleases) Create(ctx context.Context, release *dbRelease) (id int64, err error)
```

Create creates a new release of an extension in the extension registry. The release.ID and release.CreatedAt fields are ignored (they are populated automatically by the database). 

#### <a id="dbReleases.GetLatest" href="#dbReleases.GetLatest">func (dbReleases) GetLatest(ctx context.Context, registryExtensionID int32, releaseTag string, includeArtifacts bool) (*dbRelease, error)</a>

```
searchKey: registry.dbReleases.GetLatest
```

```Go
func (dbReleases) GetLatest(ctx context.Context, registryExtensionID int32, releaseTag string, includeArtifacts bool) (*dbRelease, error)
```

GetLatest gets the latest release for the extension with the given release tag (e.g., "release"). If includeArtifacts is true, it populates the (*dbRelease).{Bundle,SourceMap} fields, which may be large. 

#### <a id="dbReleases.GetLatestBatch" href="#dbReleases.GetLatestBatch">func (dbReleases) GetLatestBatch(ctx context.Context, registryExtensionIDs []int32, releaseTag string, includeArtifacts bool) ([]*dbRelease, error)</a>

```
searchKey: registry.dbReleases.GetLatestBatch
```

```Go
func (dbReleases) GetLatestBatch(ctx context.Context, registryExtensionIDs []int32, releaseTag string, includeArtifacts bool) ([]*dbRelease, error)
```

GetLatestBatch gets the latest releases for the extensions with the given release tag (e.g., "release"). If includeArtifacts is true, it populates the (*dbRelease).{Bundle,SourceMap} fields, which may be large. 

#### <a id="dbReleases.GetArtifacts" href="#dbReleases.GetArtifacts">func (dbReleases) GetArtifacts(ctx context.Context, id int64) (bundle, sourcemap []byte, err error)</a>

```
searchKey: registry.dbReleases.GetArtifacts
```

```Go
func (dbReleases) GetArtifacts(ctx context.Context, id int64) (bundle, sourcemap []byte, err error)
```

GetArtifacts gets the bundled JavaScript source file contents and the source map for a release (by ID). 

### <a id="releaseNotFoundError" href="#releaseNotFoundError">type releaseNotFoundError struct</a>

```
searchKey: registry.releaseNotFoundError
```

```Go
type releaseNotFoundError struct {
	args []interface{}
}
```

releaseNotFoundError occurs when an extension release is not found in the extension registry. 

#### <a id="releaseNotFoundError.NotFound" href="#releaseNotFoundError.NotFound">func (err releaseNotFoundError) NotFound() bool</a>

```
searchKey: registry.releaseNotFoundError.NotFound
```

```Go
func (err releaseNotFoundError) NotFound() bool
```

NotFound implements errcode.NotFounder. 

#### <a id="releaseNotFoundError.Error" href="#releaseNotFoundError.Error">func (err releaseNotFoundError) Error() string</a>

```
searchKey: registry.releaseNotFoundError.Error
```

```Go
func (err releaseNotFoundError) Error() string
```

### <a id="mockReleases" href="#mockReleases">type mockReleases struct</a>

```
searchKey: registry.mockReleases
```

```Go
type mockReleases struct {
	Create         func(release *dbRelease) (int64, error)
	GetLatest      func(registryExtensionID int32, releaseTag string, includeArtifacts bool) (*dbRelease, error)
	GetLatestBatch func(registryExtensionIDs []int32, releaseTag string, includeArtifacts bool) ([]*dbRelease, error)
}
```

mockReleases mocks the registry extension releases store. 

## <a id="func" href="#func">Functions</a>

### <a id="init" href="#init">func init()</a>

```
searchKey: registry.init
```

```Go
func init()
```

### <a id="getAllowedExtensionsFromSiteConfig" href="#getAllowedExtensionsFromSiteConfig">func getAllowedExtensionsFromSiteConfig() []string</a>

```
searchKey: registry.getAllowedExtensionsFromSiteConfig
```

```Go
func getAllowedExtensionsFromSiteConfig() []string
```

### <a id="init" href="#init">func init()</a>

```
searchKey: registry.init
```

```Go
func init()
```

### <a id="handleRegistryExtensionBundle" href="#handleRegistryExtensionBundle">func handleRegistryExtensionBundle(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: registry.handleRegistryExtensionBundle
```

```Go
func handleRegistryExtensionBundle(w http.ResponseWriter, r *http.Request)
```

handleRegistryExtensionBundle serves the bundled JavaScript source file or the source map for an extension in the registry as a raw JavaScript or JSON file. 

### <a id="parseExtensionBundleFilename" href="#parseExtensionBundleFilename">func parseExtensionBundleFilename(filename string) (int64, error)</a>

```
searchKey: registry.parseExtensionBundleFilename
```

```Go
func parseExtensionBundleFilename(filename string) (int64, error)
```

parseExtensionBundleFilename parses the release ID from the extension bundle's filename, which is of the form "1234-publisher-extension-id.js" or ".map". The part of the filename after the "-" and before the extension is ignored; it exists to help distinguish log messages from different extensions in debugging. 

### <a id="init" href="#init">func init()</a>

```
searchKey: registry.init
```

```Go
func init()
```

### <a id="listLocalRegistryExtensions" href="#listLocalRegistryExtensions">func listLocalRegistryExtensions(ctx context.Context, db dbutil.DB, args graphqlbackend.RegistryExtensionConnectionArgs) ([]graphqlbackend.RegistryExtension, error)</a>

```
searchKey: registry.listLocalRegistryExtensions
```

```Go
func listLocalRegistryExtensions(ctx context.Context, db dbutil.DB, args graphqlbackend.RegistryExtensionConnectionArgs) ([]graphqlbackend.RegistryExtension, error)
```

### <a id="countLocalRegistryExtensions" href="#countLocalRegistryExtensions">func countLocalRegistryExtensions(ctx context.Context, db dbutil.DB, args graphqlbackend.RegistryExtensionConnectionArgs) (int, error)</a>

```
searchKey: registry.countLocalRegistryExtensions
```

```Go
func countLocalRegistryExtensions(ctx context.Context, db dbutil.DB, args graphqlbackend.RegistryExtensionConnectionArgs) (int, error)
```

### <a id="parseExtensionQuery" href="#parseExtensionQuery">func parseExtensionQuery(q string) (text, category, tag string)</a>

```
searchKey: registry.parseExtensionQuery
```

```Go
func parseExtensionQuery(q string) (text, category, tag string)
```

parseExtensionQuery parses an extension registry query consisting of terms and the operators `category:"My category"`, `tag:"mytag"`, #installed, #enabled, and #disabled. 

This is an intentionally simple, unoptimized parser. 

### <a id="filterStripLocalExtensionIDs" href="#filterStripLocalExtensionIDs">func filterStripLocalExtensionIDs(extensionIDs []string) []string</a>

```
searchKey: registry.filterStripLocalExtensionIDs
```

```Go
func filterStripLocalExtensionIDs(extensionIDs []string) []string
```

filterStripLocalExtensionIDs filters to local extension IDs and strips the host prefix. 

### <a id="strptr" href="#strptr">func strptr(s string) *string</a>

```
searchKey: registry.strptr
```

```Go
func strptr(s string) *string
```

### <a id="validateExtensionManifest" href="#validateExtensionManifest">func validateExtensionManifest(text string) error</a>

```
searchKey: registry.validateExtensionManifest
```

```Go
func validateExtensionManifest(text string) error
```

validateExtensionManifest validates a JSON extension manifest for syntax. 

TODO(sqs): Also validate it against the JSON Schema. 

### <a id="getLatestForBatch" href="#getLatestForBatch">func getLatestForBatch(ctx context.Context, vs []*dbExtension) (map[int32]*dbRelease, error)</a>

```
searchKey: registry.getLatestForBatch
```

```Go
func getLatestForBatch(ctx context.Context, vs []*dbExtension) (map[int32]*dbRelease, error)
```

getLatestForBatch returns a map from extension identifiers to the latest DB release with the extension manifest as JSON for that extension. If there are no releases, it returns a nil manifest. If the manifest has no "url" field itself, a "url" field pointing to the extension's bundle is inserted. It also returns the date that the release was published. 

### <a id="prepReleaseManifest" href="#prepReleaseManifest">func prepReleaseManifest(extensionID string, release *dbRelease) error</a>

```
searchKey: registry.prepReleaseManifest
```

```Go
func prepReleaseManifest(extensionID string, release *dbRelease) error
```

prepReleaseManifest will set the Manifest field of the release. If the manifest has no "url" field itself, a "url" field pointing to the extension's bundle is inserted. It also returns the date that the release was published. 

### <a id="makeExtensionBundleURL" href="#makeExtensionBundleURL">func makeExtensionBundleURL(registryExtensionReleaseID int64, timestamp int64, extensionIDHint string) (string, error)</a>

```
searchKey: registry.makeExtensionBundleURL
```

```Go
func makeExtensionBundleURL(registryExtensionReleaseID int64, timestamp int64, extensionIDHint string) (string, error)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: registry.init
```

```Go
func init()
```

### <a id="prefixLocalExtensionID" href="#prefixLocalExtensionID">func prefixLocalExtensionID(xs ...*dbExtension) error</a>

```
searchKey: registry.prefixLocalExtensionID
```

```Go
func prefixLocalExtensionID(xs ...*dbExtension) error
```

prefixLocalExtensionID adds the local registry's extension ID prefix (from GetLocalRegistryExtensionIDPrefix) to all extensions' extension IDs in the list. 

### <a id="init" href="#init">func init()</a>

```
searchKey: registry.init
```

```Go
func init()
```

### <a id="toRegistryAPIExtension" href="#toRegistryAPIExtension">func toRegistryAPIExtension(ctx context.Context, v *dbExtension) (*registry.Extension, error)</a>

```
searchKey: registry.toRegistryAPIExtension
```

```Go
func toRegistryAPIExtension(ctx context.Context, v *dbExtension) (*registry.Extension, error)
```

### <a id="toRegistryAPIExtensionBatch" href="#toRegistryAPIExtensionBatch">func toRegistryAPIExtensionBatch(ctx context.Context, vs []*dbExtension) ([]*registry.Extension, error)</a>

```
searchKey: registry.toRegistryAPIExtensionBatch
```

```Go
func toRegistryAPIExtensionBatch(ctx context.Context, vs []*dbExtension) ([]*registry.Extension, error)
```

### <a id="newExtension" href="#newExtension">func newExtension(v *dbExtension, manifest *string, publishedAt time.Time) *registry.Extension</a>

```
searchKey: registry.newExtension
```

```Go
func newExtension(v *dbExtension, manifest *string, publishedAt time.Time) *registry.Extension
```

### <a id="handleRegistry" href="#handleRegistry">func handleRegistry(w http.ResponseWriter, r *http.Request) (err error)</a>

```
searchKey: registry.handleRegistry
```

```Go
func handleRegistry(w http.ResponseWriter, r *http.Request) (err error)
```

handleRegistry serves the external HTTP API for the extension registry. 

### <a id="init" href="#init">func init()</a>

```
searchKey: registry.init
```

```Go
func init()
```

### <a id="resetMocks" href="#resetMocks">func resetMocks()</a>

```
searchKey: registry.resetMocks
```

```Go
func resetMocks()
```

### <a id="init" href="#init">func init()</a>

```
searchKey: registry.init
```

```Go
func init()
```

### <a id="extensionRegistryPublishers" href="#extensionRegistryPublishers">func extensionRegistryPublishers(ctx context.Context, db dbutil.DB, args *graphqlutil.ConnectionArgs) (graphqlbackend.RegistryPublisherConnection, error)</a>

```
searchKey: registry.extensionRegistryPublishers
```

```Go
func extensionRegistryPublishers(ctx context.Context, db dbutil.DB, args *graphqlutil.ConnectionArgs) (graphqlbackend.RegistryPublisherConnection, error)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: registry.init
```

```Go
func init()
```

### <a id="extensionRegistryViewerPublishers" href="#extensionRegistryViewerPublishers">func extensionRegistryViewerPublishers(ctx context.Context, db dbutil.DB) ([]graphqlbackend.RegistryPublisher, error)</a>

```
searchKey: registry.extensionRegistryViewerPublishers
```

```Go
func extensionRegistryViewerPublishers(ctx context.Context, db dbutil.DB) ([]graphqlbackend.RegistryPublisher, error)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: registry.init
```

```Go
func init()
```

### <a id="registryExtensionByIDInt32" href="#registryExtensionByIDInt32">func registryExtensionByIDInt32(ctx context.Context, db dbutil.DB, id int32) (graphqlbackend.RegistryExtension, error)</a>

```
searchKey: registry.registryExtensionByIDInt32
```

```Go
func registryExtensionByIDInt32(ctx context.Context, db dbutil.DB, id int32) (graphqlbackend.RegistryExtension, error)
```

### <a id="extensionRegistryCreateExtension" href="#extensionRegistryCreateExtension">func extensionRegistryCreateExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryCreateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)</a>

```
searchKey: registry.extensionRegistryCreateExtension
```

```Go
func extensionRegistryCreateExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryCreateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)
```

### <a id="viewerCanAdministerExtension" href="#viewerCanAdministerExtension">func viewerCanAdministerExtension(ctx context.Context, db dbutil.DB, id frontendregistry.RegistryExtensionID) error</a>

```
searchKey: registry.viewerCanAdministerExtension
```

```Go
func viewerCanAdministerExtension(ctx context.Context, db dbutil.DB, id frontendregistry.RegistryExtensionID) error
```

### <a id="extensionRegistryUpdateExtension" href="#extensionRegistryUpdateExtension">func extensionRegistryUpdateExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryUpdateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)</a>

```
searchKey: registry.extensionRegistryUpdateExtension
```

```Go
func extensionRegistryUpdateExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryUpdateExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)
```

### <a id="extensionRegistryDeleteExtension" href="#extensionRegistryDeleteExtension">func extensionRegistryDeleteExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryDeleteExtensionArgs) (*graphqlbackend.EmptyResponse, error)</a>

```
searchKey: registry.extensionRegistryDeleteExtension
```

```Go
func extensionRegistryDeleteExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryDeleteExtensionArgs) (*graphqlbackend.EmptyResponse, error)
```

### <a id="extensionRegistryPublishExtension" href="#extensionRegistryPublishExtension">func extensionRegistryPublishExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryPublishExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)</a>

```
searchKey: registry.extensionRegistryPublishExtension
```

```Go
func extensionRegistryPublishExtension(ctx context.Context, db dbutil.DB, args *graphqlbackend.ExtensionRegistryPublishExtensionArgs) (graphqlbackend.ExtensionRegistryMutationResult, error)
```

### <a id="TestIsRemoteExtensionAllowed" href="#TestIsRemoteExtensionAllowed">func TestIsRemoteExtensionAllowed(t *testing.T)</a>

```
searchKey: registry.TestIsRemoteExtensionAllowed
```

```Go
func TestIsRemoteExtensionAllowed(t *testing.T)
```

### <a id="sameElements" href="#sameElements">func sameElements(a, b []string) bool</a>

```
searchKey: registry.sameElements
```

```Go
func sameElements(a, b []string) bool
```

### <a id="TestFilterRemoteExtensions" href="#TestFilterRemoteExtensions">func TestFilterRemoteExtensions(t *testing.T)</a>

```
searchKey: registry.TestFilterRemoteExtensions
```

```Go
func TestFilterRemoteExtensions(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: registry.init
```

```Go
func init()
```

### <a id="TestParseExtensionBundleFilename" href="#TestParseExtensionBundleFilename">func TestParseExtensionBundleFilename(t *testing.T)</a>

```
searchKey: registry.TestParseExtensionBundleFilename
```

```Go
func TestParseExtensionBundleFilename(t *testing.T)
```

### <a id="TestFilteringExtensionIDs" href="#TestFilteringExtensionIDs">func TestFilteringExtensionIDs(t *testing.T)</a>

```
searchKey: registry.TestFilteringExtensionIDs
```

```Go
func TestFilteringExtensionIDs(t *testing.T)
```

### <a id="TestToDBExtensionsListOptions" href="#TestToDBExtensionsListOptions">func TestToDBExtensionsListOptions(t *testing.T)</a>

```
searchKey: registry.TestToDBExtensionsListOptions
```

```Go
func TestToDBExtensionsListOptions(t *testing.T)
```

### <a id="strarrayptr" href="#strarrayptr">func strarrayptr(values []string) *[]string</a>

```
searchKey: registry.strarrayptr
```

```Go
func strarrayptr(values []string) *[]string
```

### <a id="TestGetExtensionManifestWithBundleURL" href="#TestGetExtensionManifestWithBundleURL">func TestGetExtensionManifestWithBundleURL(t *testing.T)</a>

```
searchKey: registry.TestGetExtensionManifestWithBundleURL
```

```Go
func TestGetExtensionManifestWithBundleURL(t *testing.T)
```

### <a id="jsonDeepEqual" href="#jsonDeepEqual">func jsonDeepEqual(a, b string) bool</a>

```
searchKey: registry.jsonDeepEqual
```

```Go
func jsonDeepEqual(a, b string) bool
```

### <a id="TestRegistryExtensions_validNames" href="#TestRegistryExtensions_validNames">func TestRegistryExtensions_validNames(t *testing.T)</a>

```
searchKey: registry.TestRegistryExtensions_validNames
```

```Go
func TestRegistryExtensions_validNames(t *testing.T)
```

### <a id="TestRegistryExtensions" href="#TestRegistryExtensions">func TestRegistryExtensions(t *testing.T)</a>

```
searchKey: registry.TestRegistryExtensions
```

```Go
func TestRegistryExtensions(t *testing.T)
```

### <a id="TestRegistryExtensions_ListCount" href="#TestRegistryExtensions_ListCount">func TestRegistryExtensions_ListCount(t *testing.T)</a>

```
searchKey: registry.TestRegistryExtensions_ListCount
```

```Go
func TestRegistryExtensions_ListCount(t *testing.T)
```

### <a id="TestFeaturedExtensions" href="#TestFeaturedExtensions">func TestFeaturedExtensions(t *testing.T)</a>

```
searchKey: registry.TestFeaturedExtensions
```

```Go
func TestFeaturedExtensions(t *testing.T)
```

### <a id="asJSON" href="#asJSON">func asJSON(t *testing.T, v interface{}) string</a>

```
searchKey: registry.asJSON
```

```Go
func asJSON(t *testing.T, v interface{}) string
```

### <a id="TestRegistryExtensionReleases" href="#TestRegistryExtensionReleases">func TestRegistryExtensionReleases(t *testing.T)</a>

```
searchKey: registry.TestRegistryExtensionReleases
```

```Go
func TestRegistryExtensionReleases(t *testing.T)
```

