# Package client

Package client contains a partial implementation of the extension registry. 

## Index

* [Constants](#const)
    * [const APIVersion](#APIVersion)
    * [const AcceptHeader](#AcceptHeader)
    * [const MediaTypeHeaderName](#MediaTypeHeaderName)
    * [const MediaType](#MediaType)
    * [const remoteRegistryErrorMessage](#remoteRegistryErrorMessage)
* [Types](#type)
    * [type notFoundError struct](#notFoundError)
        * [func (notFoundError) NotFound() bool](#notFoundError.NotFound)
        * [func (e *notFoundError) Error() string](#notFoundError.Error)
    * [type httpError int](#httpError)
        * [func (e httpError) Error() string](#httpError.Error)
    * [type Extension struct](#Extension)
        * [func GetByUUID(ctx context.Context, registry *url.URL, uuidStr string) (*Extension, error)](#GetByUUID)
        * [func GetByExtensionID(ctx context.Context, registry *url.URL, extensionID string) (*Extension, error)](#GetByExtensionID)
        * [func getBy(ctx context.Context, registry *url.URL, op, field, value string) (*Extension, error)](#getBy)
    * [type Publisher struct](#Publisher)
* [Functions](#func)
    * [func List(ctx context.Context, registry *url.URL, query string) ([]*Extension, error)](#List)
    * [func GetFeaturedExtensions(ctx context.Context, registry *url.URL) ([]*Extension, error)](#GetFeaturedExtensions)
    * [func httpGet(ctx context.Context, op, urlStr string, result interface{}) (err error)](#httpGet)
    * [func IsRemoteRegistryError(err error) bool](#IsRemoteRegistryError)
    * [func Name(registry *url.URL) string](#Name)
    * [func toURL(registry *url.URL, pathStr string, query url.Values) string](#toURL)


## <a id="const" href="#const">Constants</a>

### <a id="APIVersion" href="#APIVersion">const APIVersion</a>

```
searchKey: client.APIVersion
```

```Go
const APIVersion = "20180621"
```

APIVersion is a string that uniquely identifies this API version. 

### <a id="AcceptHeader" href="#AcceptHeader">const AcceptHeader</a>

```
searchKey: client.AcceptHeader
```

```Go
const AcceptHeader = "application/vnd.sourcegraph.api+json;version=" + APIVersion
```

AcceptHeader is the value of the "Accept" HTTP request header sent by the client. 

### <a id="MediaTypeHeaderName" href="#MediaTypeHeaderName">const MediaTypeHeaderName</a>

```
searchKey: client.MediaTypeHeaderName
```

```Go
const MediaTypeHeaderName = "X-Sourcegraph-Media-Type"
```

MediaTypeHeaderName is the name of the HTTP response header whose value the client expects to equal MediaType. 

### <a id="MediaType" href="#MediaType">const MediaType</a>

```
searchKey: client.MediaType
```

```Go
const MediaType = "sourcegraph.v" + APIVersion + "; format=json"
```

MediaType is the client's expected value for the MediaTypeHeaderName HTTP response header. 

### <a id="remoteRegistryErrorMessage" href="#remoteRegistryErrorMessage">const remoteRegistryErrorMessage</a>

```
searchKey: client.remoteRegistryErrorMessage
tags: [private]
```

```Go
const remoteRegistryErrorMessage = "unable to contact extension registry"
```

## <a id="type" href="#type">Types</a>

### <a id="notFoundError" href="#notFoundError">type notFoundError struct</a>

```
searchKey: client.notFoundError
tags: [private]
```

```Go
type notFoundError struct{ field, value string }
```

#### <a id="notFoundError.NotFound" href="#notFoundError.NotFound">func (notFoundError) NotFound() bool</a>

```
searchKey: client.notFoundError.NotFound
tags: [private]
```

```Go
func (notFoundError) NotFound() bool
```

#### <a id="notFoundError.Error" href="#notFoundError.Error">func (e *notFoundError) Error() string</a>

```
searchKey: client.notFoundError.Error
tags: [private]
```

```Go
func (e *notFoundError) Error() string
```

### <a id="httpError" href="#httpError">type httpError int</a>

```
searchKey: client.httpError
tags: [private]
```

```Go
type httpError int
```

#### <a id="httpError.Error" href="#httpError.Error">func (e httpError) Error() string</a>

```
searchKey: client.httpError.Error
tags: [private]
```

```Go
func (e httpError) Error() string
```

### <a id="Extension" href="#Extension">type Extension struct</a>

```
searchKey: client.Extension
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

#### <a id="GetByUUID" href="#GetByUUID">func GetByUUID(ctx context.Context, registry *url.URL, uuidStr string) (*Extension, error)</a>

```
searchKey: client.GetByUUID
```

```Go
func GetByUUID(ctx context.Context, registry *url.URL, uuidStr string) (*Extension, error)
```

GetByUUID gets the extension from the remote registry with the given UUID. If the remote registry reports that the extension is not found, the returned error implements errcode.NotFounder. 

#### <a id="GetByExtensionID" href="#GetByExtensionID">func GetByExtensionID(ctx context.Context, registry *url.URL, extensionID string) (*Extension, error)</a>

```
searchKey: client.GetByExtensionID
```

```Go
func GetByExtensionID(ctx context.Context, registry *url.URL, extensionID string) (*Extension, error)
```

GetByExtensionID gets the extension from the remote registry with the given extension ID. If the remote registry reports that the extension is not found, the returned error implements errcode.NotFounder. 

#### <a id="getBy" href="#getBy">func getBy(ctx context.Context, registry *url.URL, op, field, value string) (*Extension, error)</a>

```
searchKey: client.getBy
tags: [private]
```

```Go
func getBy(ctx context.Context, registry *url.URL, op, field, value string) (*Extension, error)
```

### <a id="Publisher" href="#Publisher">type Publisher struct</a>

```
searchKey: client.Publisher
```

```Go
type Publisher struct {
	Name string `json:"name"`
	URL  string `json:"url"`
}
```

Publisher describes a publisher in the extension registry. 

## <a id="func" href="#func">Functions</a>

### <a id="List" href="#List">func List(ctx context.Context, registry *url.URL, query string) ([]*Extension, error)</a>

```
searchKey: client.List
```

```Go
func List(ctx context.Context, registry *url.URL, query string) ([]*Extension, error)
```

List lists extensions on the remote registry matching the query (or all if the query is empty). 

### <a id="GetFeaturedExtensions" href="#GetFeaturedExtensions">func GetFeaturedExtensions(ctx context.Context, registry *url.URL) ([]*Extension, error)</a>

```
searchKey: client.GetFeaturedExtensions
```

```Go
func GetFeaturedExtensions(ctx context.Context, registry *url.URL) ([]*Extension, error)
```

### <a id="httpGet" href="#httpGet">func httpGet(ctx context.Context, op, urlStr string, result interface{}) (err error)</a>

```
searchKey: client.httpGet
tags: [private]
```

```Go
func httpGet(ctx context.Context, op, urlStr string, result interface{}) (err error)
```

### <a id="IsRemoteRegistryError" href="#IsRemoteRegistryError">func IsRemoteRegistryError(err error) bool</a>

```
searchKey: client.IsRemoteRegistryError
```

```Go
func IsRemoteRegistryError(err error) bool
```

IsRemoteRegistryError reports whether the err is (likely) from this package's interaction with the remote registry. 

### <a id="Name" href="#Name">func Name(registry *url.URL) string</a>

```
searchKey: client.Name
```

```Go
func Name(registry *url.URL) string
```

Name returns the registry name given its URL. 

### <a id="toURL" href="#toURL">func toURL(registry *url.URL, pathStr string, query url.Values) string</a>

```
searchKey: client.toURL
tags: [private]
```

```Go
func toURL(registry *url.URL, pathStr string, query url.Values) string
```

