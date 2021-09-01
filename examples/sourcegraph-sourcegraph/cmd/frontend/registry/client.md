# Package client

Package client contains a partial implementation of the extension registry. 

## Index

* [Constants](#const)
    * [const APIVersion](#APIVersion)
    * [const AcceptHeader](#AcceptHeader)
    * [const MediaType](#MediaType)
    * [const MediaTypeHeaderName](#MediaTypeHeaderName)
    * [const remoteRegistryErrorMessage](#remoteRegistryErrorMessage)
* [Types](#type)
    * [type Extension struct](#Extension)
        * [func GetByExtensionID(ctx context.Context, registry *url.URL, extensionID string) (*Extension, error)](#GetByExtensionID)
        * [func GetByUUID(ctx context.Context, registry *url.URL, uuidStr string) (*Extension, error)](#GetByUUID)
        * [func getBy(ctx context.Context, registry *url.URL, op, field, value string) (*Extension, error)](#getBy)
    * [type Publisher struct](#Publisher)
    * [type httpError int](#httpError)
        * [func (e httpError) Error() string](#httpError.Error)
    * [type notFoundError struct](#notFoundError)
        * [func (e *notFoundError) Error() string](#notFoundError.Error)
        * [func (notFoundError) NotFound() bool](#notFoundError.NotFound)
* [Functions](#func)
    * [func GetFeaturedExtensions(ctx context.Context, registry *url.URL) ([]*Extension, error)](#GetFeaturedExtensions)
    * [func IsRemoteRegistryError(err error) bool](#IsRemoteRegistryError)
    * [func List(ctx context.Context, registry *url.URL, query string) ([]*Extension, error)](#List)
    * [func Name(registry *url.URL) string](#Name)
    * [func httpGet(ctx context.Context, op, urlStr string, result interface{}) (err error)](#httpGet)
    * [func toURL(registry *url.URL, pathStr string, query url.Values) string](#toURL)


## <a id="const" href="#const">Constants</a>

### <a id="APIVersion" href="#APIVersion">const APIVersion</a>

```
searchKey: client.APIVersion
tags: [constant string]
```

```Go
const APIVersion = "20180621"
```

APIVersion is a string that uniquely identifies this API version. 

### <a id="AcceptHeader" href="#AcceptHeader">const AcceptHeader</a>

```
searchKey: client.AcceptHeader
tags: [constant string]
```

```Go
const AcceptHeader = "application/vnd.sourcegraph.api+json;version=" + APIVersion
```

AcceptHeader is the value of the "Accept" HTTP request header sent by the client. 

### <a id="MediaType" href="#MediaType">const MediaType</a>

```
searchKey: client.MediaType
tags: [constant string]
```

```Go
const MediaType = "sourcegraph.v" + APIVersion + "; format=json"
```

MediaType is the client's expected value for the MediaTypeHeaderName HTTP response header. 

### <a id="MediaTypeHeaderName" href="#MediaTypeHeaderName">const MediaTypeHeaderName</a>

```
searchKey: client.MediaTypeHeaderName
tags: [constant string]
```

```Go
const MediaTypeHeaderName = "X-Sourcegraph-Media-Type"
```

MediaTypeHeaderName is the name of the HTTP response header whose value the client expects to equal MediaType. 

### <a id="remoteRegistryErrorMessage" href="#remoteRegistryErrorMessage">const remoteRegistryErrorMessage</a>

```
searchKey: client.remoteRegistryErrorMessage
tags: [constant string private]
```

```Go
const remoteRegistryErrorMessage = "unable to contact extension registry"
```

## <a id="type" href="#type">Types</a>

### <a id="Extension" href="#Extension">type Extension struct</a>

```
searchKey: client.Extension
tags: [struct]
```

```Go
type Extension struct {
	UUID        string    `json:"uuid"`
	ExtensionID string    `json:"extensionID"`
	Publisher   Publisher `json:"publisher"`
	Name        string    `json:"name"`
	Manifest    *string   `json:"manifest"`
	CreatedAt   time.Time `json:"createdAt"`
	UpdatedAt   time.Time `json:"updatedAt"`
	PublishedAt time.Time `json:"publishedAt"`
	URL         string    `json:"url"`

	// RegistryURL is the URL of the remote registry that this extension was retrieved from. It is
	// not set by package registry.
	RegistryURL string `json:"-"`
}
```

Extension describes an extension in the extension registry. 

It is the external form of github.com/sourcegraph/sourcegraph/cmd/frontend/types.RegistryExtension (which is the internal DB type). These types should generally be kept in sync, but registry.Extension updates require backcompat. 

#### <a id="GetByExtensionID" href="#GetByExtensionID">func GetByExtensionID(ctx context.Context, registry *url.URL, extensionID string) (*Extension, error)</a>

```
searchKey: client.GetByExtensionID
tags: [function]
```

```Go
func GetByExtensionID(ctx context.Context, registry *url.URL, extensionID string) (*Extension, error)
```

GetByExtensionID gets the extension from the remote registry with the given extension ID. If the remote registry reports that the extension is not found, the returned error implements errcode.NotFounder. 

#### <a id="GetByUUID" href="#GetByUUID">func GetByUUID(ctx context.Context, registry *url.URL, uuidStr string) (*Extension, error)</a>

```
searchKey: client.GetByUUID
tags: [function]
```

```Go
func GetByUUID(ctx context.Context, registry *url.URL, uuidStr string) (*Extension, error)
```

GetByUUID gets the extension from the remote registry with the given UUID. If the remote registry reports that the extension is not found, the returned error implements errcode.NotFounder. 

#### <a id="getBy" href="#getBy">func getBy(ctx context.Context, registry *url.URL, op, field, value string) (*Extension, error)</a>

```
searchKey: client.getBy
tags: [function private]
```

```Go
func getBy(ctx context.Context, registry *url.URL, op, field, value string) (*Extension, error)
```

### <a id="Publisher" href="#Publisher">type Publisher struct</a>

```
searchKey: client.Publisher
tags: [struct]
```

```Go
type Publisher struct {
	Name string `json:"name"`
	URL  string `json:"url"`
}
```

Publisher describes a publisher in the extension registry. 

### <a id="httpError" href="#httpError">type httpError int</a>

```
searchKey: client.httpError
tags: [number private]
```

```Go
type httpError int
```

#### <a id="httpError.Error" href="#httpError.Error">func (e httpError) Error() string</a>

```
searchKey: client.httpError.Error
tags: [method private]
```

```Go
func (e httpError) Error() string
```

### <a id="notFoundError" href="#notFoundError">type notFoundError struct</a>

```
searchKey: client.notFoundError
tags: [struct private]
```

```Go
type notFoundError struct{ field, value string }
```

#### <a id="notFoundError.Error" href="#notFoundError.Error">func (e *notFoundError) Error() string</a>

```
searchKey: client.notFoundError.Error
tags: [method private]
```

```Go
func (e *notFoundError) Error() string
```

#### <a id="notFoundError.NotFound" href="#notFoundError.NotFound">func (notFoundError) NotFound() bool</a>

```
searchKey: client.notFoundError.NotFound
tags: [method private]
```

```Go
func (notFoundError) NotFound() bool
```

## <a id="func" href="#func">Functions</a>

### <a id="GetFeaturedExtensions" href="#GetFeaturedExtensions">func GetFeaturedExtensions(ctx context.Context, registry *url.URL) ([]*Extension, error)</a>

```
searchKey: client.GetFeaturedExtensions
tags: [function]
```

```Go
func GetFeaturedExtensions(ctx context.Context, registry *url.URL) ([]*Extension, error)
```

### <a id="IsRemoteRegistryError" href="#IsRemoteRegistryError">func IsRemoteRegistryError(err error) bool</a>

```
searchKey: client.IsRemoteRegistryError
tags: [function]
```

```Go
func IsRemoteRegistryError(err error) bool
```

IsRemoteRegistryError reports whether the err is (likely) from this package's interaction with the remote registry. 

### <a id="List" href="#List">func List(ctx context.Context, registry *url.URL, query string) ([]*Extension, error)</a>

```
searchKey: client.List
tags: [function]
```

```Go
func List(ctx context.Context, registry *url.URL, query string) ([]*Extension, error)
```

List lists extensions on the remote registry matching the query (or all if the query is empty). 

### <a id="Name" href="#Name">func Name(registry *url.URL) string</a>

```
searchKey: client.Name
tags: [function]
```

```Go
func Name(registry *url.URL) string
```

Name returns the registry name given its URL. 

### <a id="httpGet" href="#httpGet">func httpGet(ctx context.Context, op, urlStr string, result interface{}) (err error)</a>

```
searchKey: client.httpGet
tags: [function private]
```

```Go
func httpGet(ctx context.Context, op, urlStr string, result interface{}) (err error)
```

### <a id="toURL" href="#toURL">func toURL(registry *url.URL, pathStr string, query url.Values) string</a>

```
searchKey: client.toURL
tags: [function private]
```

```Go
func toURL(registry *url.URL, pathStr string, query url.Values) string
```

