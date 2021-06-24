# Package repoupdater

## Index

* Subpages
  * [internal/repoupdater/protocol](repoupdater/protocol.md)
* [Variables](#var)
    * [var DefaultClient](#DefaultClient)
    * [var MockEnqueueChangesetSync](#MockEnqueueChangesetSync)
    * [var MockEnqueueRepoUpdate](#MockEnqueueRepoUpdate)
    * [var MockRepoLookup](#MockRepoLookup)
    * [var requestMeter](#requestMeter)
* [Types](#type)
    * [type Client struct](#Client)
        * [func NewClient(serverURL string) *Client](#NewClient)
        * [func (c *Client) EnqueueChangesetSync(ctx context.Context, ids []int64) error](#Client.EnqueueChangesetSync)
        * [func (c *Client) EnqueueRepoUpdate(ctx context.Context, repo api.RepoName) (*protocol.RepoUpdateResponse, error)](#Client.EnqueueRepoUpdate)
        * [func (c *Client) RepoExternalServices(ctx context.Context, id api.RepoID) ([]api.ExternalService, error)](#Client.RepoExternalServices)
        * [func (c *Client) RepoLookup(ctx context.Context, args protocol.RepoLookupArgs) (result *protocol.RepoLookupResult, err error)](#Client.RepoLookup)
        * [func (c *Client) RepoUpdateSchedulerInfo(ctx context.Context, args protocol.RepoUpdateSchedulerInfoArgs) (result *protocol.RepoUpdateSchedulerInfoResult, err error)](#Client.RepoUpdateSchedulerInfo)
        * [func (c *Client) SchedulePermsSync(ctx context.Context, args protocol.PermsSyncRequest) error](#Client.SchedulePermsSync)
        * [func (c *Client) SyncExternalService(ctx context.Context, svc api.ExternalService) (*protocol.ExternalServiceSyncResult, error)](#Client.SyncExternalService)
        * [func (c *Client) do(ctx context.Context, req *http.Request) (_ *http.Response, err error)](#Client.do)
        * [func (c *Client) httpPost(ctx context.Context, method string, payload interface{}) (resp *http.Response, err error)](#Client.httpPost)
    * [type ErrNotFound struct](#ErrNotFound)
        * [func (e *ErrNotFound) Error() string](#ErrNotFound.Error)
        * [func (e *ErrNotFound) NotFound() bool](#ErrNotFound.NotFound)
    * [type ErrTemporary struct](#ErrTemporary)
        * [func (e *ErrTemporary) Error() string](#ErrTemporary.Error)
        * [func (e *ErrTemporary) Temporary() bool](#ErrTemporary.Temporary)
    * [type ErrUnauthorized struct](#ErrUnauthorized)
        * [func (e *ErrUnauthorized) Error() string](#ErrUnauthorized.Error)
        * [func (e *ErrUnauthorized) Unauthorized() bool](#ErrUnauthorized.Unauthorized)
    * [type repoNotFoundError struct](#repoNotFoundError)
        * [func (e *repoNotFoundError) Error() string](#repoNotFoundError.Error)
        * [func (repoNotFoundError) NotFound() bool](#repoNotFoundError.NotFound)
* [Functions](#func)
    * [func TestNewClient(t *testing.T)](#TestNewClient)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="DefaultClient" href="#DefaultClient">var DefaultClient</a>

```
searchKey: repoupdater.DefaultClient
tags: [variable struct]
```

```Go
var DefaultClient = ...
```

DefaultClient is the default Client. Unless overwritten, it is connected to the server specified by the REPO_UPDATER_URL environment variable. 

### <a id="MockEnqueueChangesetSync" href="#MockEnqueueChangesetSync">var MockEnqueueChangesetSync</a>

```
searchKey: repoupdater.MockEnqueueChangesetSync
tags: [variable function]
```

```Go
var MockEnqueueChangesetSync func(ctx context.Context, ids []int64) error
```

MockEnqueueChangesetSync mocks (*Client).EnqueueChangesetSync for tests. 

### <a id="MockEnqueueRepoUpdate" href="#MockEnqueueRepoUpdate">var MockEnqueueRepoUpdate</a>

```
searchKey: repoupdater.MockEnqueueRepoUpdate
tags: [variable function]
```

```Go
var MockEnqueueRepoUpdate func(ctx context.Context, repo api.RepoName) (*protocol.RepoUpdateResponse, error) = ...
```

MockEnqueueRepoUpdate mocks (*Client).EnqueueRepoUpdate for tests. 

### <a id="MockRepoLookup" href="#MockRepoLookup">var MockRepoLookup</a>

```
searchKey: repoupdater.MockRepoLookup
tags: [variable function]
```

```Go
var MockRepoLookup func(protocol.RepoLookupArgs) (*protocol.RepoLookupResult, error)
```

MockRepoLookup mocks (*Client).RepoLookup for tests. 

### <a id="requestMeter" href="#requestMeter">var requestMeter</a>

```
searchKey: repoupdater.requestMeter
tags: [variable struct private]
```

```Go
var requestMeter = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: repoupdater.Client
tags: [struct]
```

```Go
type Client struct {
	// URL to repoupdater server.
	URL string

	// HTTP client to use
	HTTPClient *http.Client
}
```

Client is a repoupdater client. 

#### <a id="NewClient" href="#NewClient">func NewClient(serverURL string) *Client</a>

```
searchKey: repoupdater.NewClient
tags: [method]
```

```Go
func NewClient(serverURL string) *Client
```

NewClient will initiate a new repoupdater Client with the given serverURL. 

#### <a id="Client.EnqueueChangesetSync" href="#Client.EnqueueChangesetSync">func (c *Client) EnqueueChangesetSync(ctx context.Context, ids []int64) error</a>

```
searchKey: repoupdater.Client.EnqueueChangesetSync
tags: [method]
```

```Go
func (c *Client) EnqueueChangesetSync(ctx context.Context, ids []int64) error
```

#### <a id="Client.EnqueueRepoUpdate" href="#Client.EnqueueRepoUpdate">func (c *Client) EnqueueRepoUpdate(ctx context.Context, repo api.RepoName) (*protocol.RepoUpdateResponse, error)</a>

```
searchKey: repoupdater.Client.EnqueueRepoUpdate
tags: [method]
```

```Go
func (c *Client) EnqueueRepoUpdate(ctx context.Context, repo api.RepoName) (*protocol.RepoUpdateResponse, error)
```

EnqueueRepoUpdate requests that the named repository be updated in the near future. It does not wait for the update. 

#### <a id="Client.RepoExternalServices" href="#Client.RepoExternalServices">func (c *Client) RepoExternalServices(ctx context.Context, id api.RepoID) ([]api.ExternalService, error)</a>

```
searchKey: repoupdater.Client.RepoExternalServices
tags: [method]
```

```Go
func (c *Client) RepoExternalServices(ctx context.Context, id api.RepoID) ([]api.ExternalService, error)
```

RepoExternalServices requests the external services associated with a repository with the given id. 

#### <a id="Client.RepoLookup" href="#Client.RepoLookup">func (c *Client) RepoLookup(ctx context.Context, args protocol.RepoLookupArgs) (result *protocol.RepoLookupResult, err error)</a>

```
searchKey: repoupdater.Client.RepoLookup
tags: [method]
```

```Go
func (c *Client) RepoLookup(ctx context.Context, args protocol.RepoLookupArgs) (result *protocol.RepoLookupResult, err error)
```

RepoLookup retrieves information about the repository on repoupdater. 

#### <a id="Client.RepoUpdateSchedulerInfo" href="#Client.RepoUpdateSchedulerInfo">func (c *Client) RepoUpdateSchedulerInfo(ctx context.Context, args protocol.RepoUpdateSchedulerInfoArgs) (result *protocol.RepoUpdateSchedulerInfoResult, err error)</a>

```
searchKey: repoupdater.Client.RepoUpdateSchedulerInfo
tags: [method]
```

```Go
func (c *Client) RepoUpdateSchedulerInfo(ctx context.Context, args protocol.RepoUpdateSchedulerInfoArgs) (result *protocol.RepoUpdateSchedulerInfoResult, err error)
```

RepoUpdateSchedulerInfo returns information about the state of the repo in the update scheduler. 

#### <a id="Client.SchedulePermsSync" href="#Client.SchedulePermsSync">func (c *Client) SchedulePermsSync(ctx context.Context, args protocol.PermsSyncRequest) error</a>

```
searchKey: repoupdater.Client.SchedulePermsSync
tags: [method]
```

```Go
func (c *Client) SchedulePermsSync(ctx context.Context, args protocol.PermsSyncRequest) error
```

#### <a id="Client.SyncExternalService" href="#Client.SyncExternalService">func (c *Client) SyncExternalService(ctx context.Context, svc api.ExternalService) (*protocol.ExternalServiceSyncResult, error)</a>

```
searchKey: repoupdater.Client.SyncExternalService
tags: [method]
```

```Go
func (c *Client) SyncExternalService(ctx context.Context, svc api.ExternalService) (*protocol.ExternalServiceSyncResult, error)
```

SyncExternalService requests the given external service to be synced. 

#### <a id="Client.do" href="#Client.do">func (c *Client) do(ctx context.Context, req *http.Request) (_ *http.Response, err error)</a>

```
searchKey: repoupdater.Client.do
tags: [method private]
```

```Go
func (c *Client) do(ctx context.Context, req *http.Request) (_ *http.Response, err error)
```

#### <a id="Client.httpPost" href="#Client.httpPost">func (c *Client) httpPost(ctx context.Context, method string, payload interface{}) (resp *http.Response, err error)</a>

```
searchKey: repoupdater.Client.httpPost
tags: [method private]
```

```Go
func (c *Client) httpPost(ctx context.Context, method string, payload interface{}) (resp *http.Response, err error)
```

### <a id="ErrNotFound" href="#ErrNotFound">type ErrNotFound struct</a>

```
searchKey: repoupdater.ErrNotFound
tags: [struct]
```

```Go
type ErrNotFound struct {
	Repo       api.RepoName
	IsNotFound bool
}
```

ErrNotFound is an error that occurs when a Repo doesn't exist. 

#### <a id="ErrNotFound.Error" href="#ErrNotFound.Error">func (e *ErrNotFound) Error() string</a>

```
searchKey: repoupdater.ErrNotFound.Error
tags: [function]
```

```Go
func (e *ErrNotFound) Error() string
```

#### <a id="ErrNotFound.NotFound" href="#ErrNotFound.NotFound">func (e *ErrNotFound) NotFound() bool</a>

```
searchKey: repoupdater.ErrNotFound.NotFound
tags: [function]
```

```Go
func (e *ErrNotFound) NotFound() bool
```

NotFound returns true if the repo does Not exist. 

### <a id="ErrTemporary" href="#ErrTemporary">type ErrTemporary struct</a>

```
searchKey: repoupdater.ErrTemporary
tags: [struct]
```

```Go
type ErrTemporary struct {
	Repo        api.RepoName
	IsTemporary bool
}
```

ErrTemporary is an error that can be retried 

#### <a id="ErrTemporary.Error" href="#ErrTemporary.Error">func (e *ErrTemporary) Error() string</a>

```
searchKey: repoupdater.ErrTemporary.Error
tags: [function]
```

```Go
func (e *ErrTemporary) Error() string
```

#### <a id="ErrTemporary.Temporary" href="#ErrTemporary.Temporary">func (e *ErrTemporary) Temporary() bool</a>

```
searchKey: repoupdater.ErrTemporary.Temporary
tags: [function]
```

```Go
func (e *ErrTemporary) Temporary() bool
```

Temporary is when the repository was reported as being temporarily unavailable. 

### <a id="ErrUnauthorized" href="#ErrUnauthorized">type ErrUnauthorized struct</a>

```
searchKey: repoupdater.ErrUnauthorized
tags: [struct]
```

```Go
type ErrUnauthorized struct {
	Repo    api.RepoName
	NoAuthz bool
}
```

ErrUnauthorized is an error that occurs when repo access is unauthorized. 

#### <a id="ErrUnauthorized.Error" href="#ErrUnauthorized.Error">func (e *ErrUnauthorized) Error() string</a>

```
searchKey: repoupdater.ErrUnauthorized.Error
tags: [function]
```

```Go
func (e *ErrUnauthorized) Error() string
```

#### <a id="ErrUnauthorized.Unauthorized" href="#ErrUnauthorized.Unauthorized">func (e *ErrUnauthorized) Unauthorized() bool</a>

```
searchKey: repoupdater.ErrUnauthorized.Unauthorized
tags: [function]
```

```Go
func (e *ErrUnauthorized) Unauthorized() bool
```

Unauthorized returns true if repo access is unauthorized. 

### <a id="repoNotFoundError" href="#repoNotFoundError">type repoNotFoundError struct</a>

```
searchKey: repoupdater.repoNotFoundError
tags: [struct private]
```

```Go
type repoNotFoundError struct {
	repo         string
	responseBody string
}
```

#### <a id="repoNotFoundError.Error" href="#repoNotFoundError.Error">func (e *repoNotFoundError) Error() string</a>

```
searchKey: repoupdater.repoNotFoundError.Error
tags: [function private]
```

```Go
func (e *repoNotFoundError) Error() string
```

#### <a id="repoNotFoundError.NotFound" href="#repoNotFoundError.NotFound">func (repoNotFoundError) NotFound() bool</a>

```
searchKey: repoupdater.repoNotFoundError.NotFound
tags: [function private]
```

```Go
func (repoNotFoundError) NotFound() bool
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="TestNewClient" href="#TestNewClient">func TestNewClient(t *testing.T)</a>

```
searchKey: repoupdater.TestNewClient
tags: [method private test]
```

```Go
func TestNewClient(t *testing.T)
```

