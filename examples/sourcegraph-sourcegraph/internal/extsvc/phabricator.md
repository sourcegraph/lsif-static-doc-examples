# Package phabricator

Package phabricator is a package to interact with a Phabricator instance and its Conduit API. 

## Index

* [Variables](#var)
    * [var requestDuration](#requestDuration)
* [Types](#type)
    * [type Client struct](#Client)
        * [func NewClient(ctx context.Context, phabUrl, token string, cli httpcli.Doer) (*Client, error)](#NewClient)
        * [func (c *Client) GetDiffInfo(ctx context.Context, diffID int) (*DiffInfo, error)](#Client.GetDiffInfo)
        * [func (c *Client) GetRawDiff(ctx context.Context, diffID int) (diff string, err error)](#Client.GetRawDiff)
        * [func (c *Client) ListRepos(ctx context.Context, args ListReposArgs) ([]*Repo, *Cursor, error)](#Client.ListRepos)
    * [type Cursor struct](#Cursor)
    * [type DiffInfo struct](#DiffInfo)
    * [type ListReposArgs struct](#ListReposArgs)
    * [type Repo struct](#Repo)
    * [type URI struct](#URI)
    * [type apiRepo struct](#apiRepo)
        * [func (a *apiRepo) ToRepo() *Repo](#apiRepo.ToRepo)
    * [type apiRepoAttachments struct](#apiRepoAttachments)
    * [type apiRepoFields struct](#apiRepoFields)
    * [type apiRepoPolicy struct](#apiRepoPolicy)
    * [type apiURI struct](#apiURI)
    * [type apiURIBultin struct](#apiURIBultin)
    * [type apiURIFields struct](#apiURIFields)
    * [type apiURIs struct](#apiURIs)
    * [type apiURIsContainer struct](#apiURIsContainer)
    * [type meteredConn struct](#meteredConn)
        * [func (mc *meteredConn) CallContext(ctx context.Context,...](#meteredConn.CallContext)
    * [type unixTime struct](#unixTime)
        * [func (d *unixTime) UnmarshalJSON(data []byte) error](#unixTime.UnmarshalJSON)
* [Functions](#func)
    * [func ParseDate(secStr string) (*time.Time, error)](#ParseDate)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="requestDuration" href="#requestDuration">var requestDuration</a>

```
searchKey: phabricator.requestDuration
tags: [variable struct private]
```

```Go
var requestDuration = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: phabricator.Client
tags: [struct]
```

```Go
type Client struct {
	conn *meteredConn
}
```

A Client provides high level methods to a Phabricator Conduit API. 

#### <a id="NewClient" href="#NewClient">func NewClient(ctx context.Context, phabUrl, token string, cli httpcli.Doer) (*Client, error)</a>

```
searchKey: phabricator.NewClient
tags: [function]
```

```Go
func NewClient(ctx context.Context, phabUrl, token string, cli httpcli.Doer) (*Client, error)
```

NewClient returns an authenticated Client, using the given URL and token. If provided, cli will be used to perform the underlying HTTP requests. This constructor needs a context because it calls the Conduit API to negotiate capabilities as part of the dial process. 

#### <a id="Client.GetDiffInfo" href="#Client.GetDiffInfo">func (c *Client) GetDiffInfo(ctx context.Context, diffID int) (*DiffInfo, error)</a>

```
searchKey: phabricator.Client.GetDiffInfo
tags: [method]
```

```Go
func (c *Client) GetDiffInfo(ctx context.Context, diffID int) (*DiffInfo, error)
```

GetDiffInfo retrieves the DiffInfo of the diff with the given id. 

#### <a id="Client.GetRawDiff" href="#Client.GetRawDiff">func (c *Client) GetRawDiff(ctx context.Context, diffID int) (diff string, err error)</a>

```
searchKey: phabricator.Client.GetRawDiff
tags: [method]
```

```Go
func (c *Client) GetRawDiff(ctx context.Context, diffID int) (diff string, err error)
```

GetRawDiff retrieves the raw diff of the diff with the given id. 

#### <a id="Client.ListRepos" href="#Client.ListRepos">func (c *Client) ListRepos(ctx context.Context, args ListReposArgs) ([]*Repo, *Cursor, error)</a>

```
searchKey: phabricator.Client.ListRepos
tags: [method]
```

```Go
func (c *Client) ListRepos(ctx context.Context, args ListReposArgs) ([]*Repo, *Cursor, error)
```

ListRepos lists all repositories matching the given arguments. 

### <a id="Cursor" href="#Cursor">type Cursor struct</a>

```
searchKey: phabricator.Cursor
tags: [struct]
```

```Go
type Cursor struct {
	Limit  uint64 `json:"limit,omitempty"`
	After  string `json:"after,omitempty"`
	Before string `json:"before,omitempty"`
	Order  string `json:"order,omitempty"`
}
```

Cursor represents the pagination cursor on many responses. 

### <a id="DiffInfo" href="#DiffInfo">type DiffInfo struct</a>

```
searchKey: phabricator.DiffInfo
tags: [struct]
```

```Go
type DiffInfo struct {
	Message     string    `json:"description"`
	AuthorName  string    `json:"authorName"`
	AuthorEmail string    `json:"authorEmail"`
	DateCreated string    `json:"dateCreated"`
	Date        time.Time `json:"omitempty"`
}
```

DiffInfo contains information for a diff such as the author 

### <a id="ListReposArgs" href="#ListReposArgs">type ListReposArgs struct</a>

```
searchKey: phabricator.ListReposArgs
tags: [struct]
```

```Go
type ListReposArgs struct {
	*Cursor
}
```

ListReposArgs defines the constraints to be satisfied by the ListRepos method. 

### <a id="Repo" href="#Repo">type Repo struct</a>

```
searchKey: phabricator.Repo
tags: [struct]
```

```Go
type Repo struct {
	ID           uint64
	PHID         string
	Name         string
	VCS          string
	Callsign     string
	Shortname    string
	Status       string
	DateCreated  time.Time
	DateModified time.Time
	ViewPolicy   string
	EditPolicy   string
	URIs         []*URI
}
```

Repo represents a single code repository. 

### <a id="URI" href="#URI">type URI struct</a>

```
searchKey: phabricator.URI
tags: [struct]
```

```Go
type URI struct {
	ID   string
	PHID string

	Display    string
	Effective  string
	Normalized string

	Disabled bool

	BuiltinProtocol   string
	BuiltinIdentifier string

	DateCreated  time.Time
	DateModified time.Time
}
```

URI of a Repository 

### <a id="apiRepo" href="#apiRepo">type apiRepo struct</a>

```
searchKey: phabricator.apiRepo
tags: [struct private]
```

```Go
type apiRepo struct {
	ID          uint64             `json:"id"`
	PHID        string             `json:"phid"`
	Fields      apiRepoFields      `json:"fields"`
	Attachments apiRepoAttachments `json:"attachments"`
}
```

#### <a id="apiRepo.ToRepo" href="#apiRepo.ToRepo">func (a *apiRepo) ToRepo() *Repo</a>

```
searchKey: phabricator.apiRepo.ToRepo
tags: [method private]
```

```Go
func (a *apiRepo) ToRepo() *Repo
```

### <a id="apiRepoAttachments" href="#apiRepoAttachments">type apiRepoAttachments struct</a>

```
searchKey: phabricator.apiRepoAttachments
tags: [struct private]
```

```Go
type apiRepoAttachments struct {
	URIs apiURIsContainer `json:"uris"`
}
```

### <a id="apiRepoFields" href="#apiRepoFields">type apiRepoFields struct</a>

```
searchKey: phabricator.apiRepoFields
tags: [struct private]
```

```Go
type apiRepoFields struct {
	Name         string        `json:"name"`
	VCS          string        `json:"vcs"`
	Callsign     string        `json:"callsign"`
	Shortname    string        `json:"shortname"`
	Status       string        `json:"status"`
	Policy       apiRepoPolicy `json:"policy"`
	DateCreated  unixTime      `json:"dateCreated"`
	DateModified unixTime      `json:"dateModified"`
}
```

### <a id="apiRepoPolicy" href="#apiRepoPolicy">type apiRepoPolicy struct</a>

```
searchKey: phabricator.apiRepoPolicy
tags: [struct private]
```

```Go
type apiRepoPolicy struct {
	View string `json:"view"`
	Edit string `json:"edit"`
}
```

### <a id="apiURI" href="#apiURI">type apiURI struct</a>

```
searchKey: phabricator.apiURI
tags: [struct private]
```

```Go
type apiURI struct {
	ID     string       `json:"id"`
	PHID   string       `json:"phid"`
	Fields apiURIFields `json:"fields"`
}
```

### <a id="apiURIBultin" href="#apiURIBultin">type apiURIBultin struct</a>

```
searchKey: phabricator.apiURIBultin
tags: [struct private]
```

```Go
type apiURIBultin struct {
	Protocol   string `json:"protocol"`
	Identifier string `json:"identifier"`
}
```

### <a id="apiURIFields" href="#apiURIFields">type apiURIFields struct</a>

```
searchKey: phabricator.apiURIFields
tags: [struct private]
```

```Go
type apiURIFields struct {
	URI          apiURIs      `json:"uri"`
	Builtin      apiURIBultin `json:"builtin"`
	Disabled     bool         `json:"disabled"`
	DateCreated  unixTime     `json:"dateCreated"`
	DateModified unixTime     `json:"dateModified"`
}
```

### <a id="apiURIs" href="#apiURIs">type apiURIs struct</a>

```
searchKey: phabricator.apiURIs
tags: [struct private]
```

```Go
type apiURIs struct {
	Display    string `json:"display"`
	Effective  string `json:"effective"`
	Normalized string `json:"normalized"`
}
```

### <a id="apiURIsContainer" href="#apiURIsContainer">type apiURIsContainer struct</a>

```
searchKey: phabricator.apiURIsContainer
tags: [struct private]
```

```Go
type apiURIsContainer struct {
	URIs []apiURI `json:"uris"`
}
```

### <a id="meteredConn" href="#meteredConn">type meteredConn struct</a>

```
searchKey: phabricator.meteredConn
tags: [struct private]
```

```Go
type meteredConn struct {
	gonduit.Conn
}
```

#### <a id="meteredConn.CallContext" href="#meteredConn.CallContext">func (mc *meteredConn) CallContext(ctx context.Context,...</a>

```
searchKey: phabricator.meteredConn.CallContext
tags: [method private]
```

```Go
func (mc *meteredConn) CallContext(
	ctx context.Context,
	method string,
	params interface{},
	result interface{},
) error
```

### <a id="unixTime" href="#unixTime">type unixTime struct</a>

```
searchKey: phabricator.unixTime
tags: [struct private]
```

```Go
type unixTime struct{ t *time.Time }
```

#### <a id="unixTime.UnmarshalJSON" href="#unixTime.UnmarshalJSON">func (d *unixTime) UnmarshalJSON(data []byte) error</a>

```
searchKey: phabricator.unixTime.UnmarshalJSON
tags: [method private]
```

```Go
func (d *unixTime) UnmarshalJSON(data []byte) error
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ParseDate" href="#ParseDate">func ParseDate(secStr string) (*time.Time, error)</a>

```
searchKey: phabricator.ParseDate
tags: [function]
```

```Go
func ParseDate(secStr string) (*time.Time, error)
```

ParseDate parses the given unix timestamp into a time.Time pointer. 

