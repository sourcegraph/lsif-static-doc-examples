# Package protocol

## Index

* [Types](#type)
    * [type RepoUpdateSchedulerInfoArgs struct](#RepoUpdateSchedulerInfoArgs)
    * [type RepoUpdateSchedulerInfoResult struct](#RepoUpdateSchedulerInfoResult)
    * [type RepoScheduleState struct](#RepoScheduleState)
    * [type RepoQueueState struct](#RepoQueueState)
    * [type RepoExternalServicesRequest struct](#RepoExternalServicesRequest)
    * [type RepoExternalServicesResponse struct](#RepoExternalServicesResponse)
    * [type RepoLookupArgs struct](#RepoLookupArgs)
        * [func (a *RepoLookupArgs) String() string](#RepoLookupArgs.String)
    * [type RepoLookupResult struct](#RepoLookupResult)
        * [func (r *RepoLookupResult) String() string](#RepoLookupResult.String)
    * [type RepoInfo struct](#RepoInfo)
        * [func (r *RepoInfo) String() string](#RepoInfo.String)
    * [type VCSInfo struct](#VCSInfo)
    * [type RepoLinks struct](#RepoLinks)
    * [type RepoUpdateRequest struct](#RepoUpdateRequest)
        * [func (a *RepoUpdateRequest) String() string](#RepoUpdateRequest.String)
    * [type RepoUpdateResponse struct](#RepoUpdateResponse)
    * [type ChangesetSyncRequest struct](#ChangesetSyncRequest)
    * [type ChangesetSyncResponse struct](#ChangesetSyncResponse)
    * [type PermsSyncRequest struct](#PermsSyncRequest)
    * [type PermsSyncResponse struct](#PermsSyncResponse)
    * [type ExternalServiceSyncRequest struct](#ExternalServiceSyncRequest)
    * [type ExternalServiceSyncResult struct](#ExternalServiceSyncResult)


## <a id="type" href="#type">Types</a>

### <a id="RepoUpdateSchedulerInfoArgs" href="#RepoUpdateSchedulerInfoArgs">type RepoUpdateSchedulerInfoArgs struct</a>

```
searchKey: protocol.RepoUpdateSchedulerInfoArgs
tags: [exported]
```

```Go
type RepoUpdateSchedulerInfoArgs struct {
	// RepoName is the repository name to look up.
	// XXX(tsenart): Depreacted. Remove after lookup by ID is rolled out.
	RepoName api.RepoName
	// The ID of the repo to lookup the schedule for.
	ID api.RepoID
}
```

### <a id="RepoUpdateSchedulerInfoResult" href="#RepoUpdateSchedulerInfoResult">type RepoUpdateSchedulerInfoResult struct</a>

```
searchKey: protocol.RepoUpdateSchedulerInfoResult
tags: [exported]
```

```Go
type RepoUpdateSchedulerInfoResult struct {
	Schedule *RepoScheduleState `json:",omitempty"`
	Queue    *RepoQueueState    `json:",omitempty"`
}
```

### <a id="RepoScheduleState" href="#RepoScheduleState">type RepoScheduleState struct</a>

```
searchKey: protocol.RepoScheduleState
tags: [exported]
```

```Go
type RepoScheduleState struct {
	Index           int
	Total           int
	IntervalSeconds int
	Due             time.Time
}
```

### <a id="RepoQueueState" href="#RepoQueueState">type RepoQueueState struct</a>

```
searchKey: protocol.RepoQueueState
tags: [exported]
```

```Go
type RepoQueueState struct {
	Index    int
	Total    int
	Updating bool
}
```

### <a id="RepoExternalServicesRequest" href="#RepoExternalServicesRequest">type RepoExternalServicesRequest struct</a>

```
searchKey: protocol.RepoExternalServicesRequest
tags: [exported]
```

```Go
type RepoExternalServicesRequest struct {
	// ID of the repository being queried.
	ID api.RepoID
}
```

RepoExternalServicesRequest is a request for the external services associated with a repository. 

### <a id="RepoExternalServicesResponse" href="#RepoExternalServicesResponse">type RepoExternalServicesResponse struct</a>

```
searchKey: protocol.RepoExternalServicesResponse
tags: [exported]
```

```Go
type RepoExternalServicesResponse struct {
	ExternalServices []api.ExternalService
}
```

RepoExternalServicesResponse is returned in response to an RepoExternalServicesRequest. 

### <a id="RepoLookupArgs" href="#RepoLookupArgs">type RepoLookupArgs struct</a>

```
searchKey: protocol.RepoLookupArgs
tags: [exported]
```

```Go
type RepoLookupArgs struct {
	// Repo is the repository name to look up.
	Repo api.RepoName `json:",omitempty"`
}
```

RepoLookupArgs is a request for information about a repository on repoupdater. 

Exactly one of Repo and ExternalRepo should be set. 

#### <a id="RepoLookupArgs.String" href="#RepoLookupArgs.String">func (a *RepoLookupArgs) String() string</a>

```
searchKey: protocol.RepoLookupArgs.String
tags: [exported]
```

```Go
func (a *RepoLookupArgs) String() string
```

### <a id="RepoLookupResult" href="#RepoLookupResult">type RepoLookupResult struct</a>

```
searchKey: protocol.RepoLookupResult
tags: [exported]
```

```Go
type RepoLookupResult struct {
	// Repo contains information about the repository, if it is found. If an error occurred, it is nil.
	Repo *RepoInfo

	ErrorNotFound               bool // the repository host reported that the repository was not found
	ErrorUnauthorized           bool // the repository host rejected the client's authorization
	ErrorTemporarilyUnavailable bool // the repository host was temporarily unavailable (e.g., rate limit exceeded)
}
```

RepoLookupResult is the response to a repository information request (RepoLookupArgs). 

#### <a id="RepoLookupResult.String" href="#RepoLookupResult.String">func (r *RepoLookupResult) String() string</a>

```
searchKey: protocol.RepoLookupResult.String
tags: [exported]
```

```Go
func (r *RepoLookupResult) String() string
```

### <a id="RepoInfo" href="#RepoInfo">type RepoInfo struct</a>

```
searchKey: protocol.RepoInfo
tags: [exported]
```

```Go
type RepoInfo struct {
	// Name the canonical name of the repository. Its case (uppercase/lowercase) may differ from the name arg used
	// in the lookup. If the repository was renamed on the external service, this name is the new name.
	Name api.RepoName

	Description string // repository description (from the external service)
	Fork        bool   // whether this repository is a fork of another repository (from the external service)
	Archived    bool   // whether this repository is archived (from the external service)
	Private     bool   // whether this repository is private (from the external service)

	VCS VCSInfo // VCS-related information (for cloning/updating)

	Links *RepoLinks // link URLs related to this repository

	// ExternalRepo specifies this repository's ID on the external service where it resides (and the external
	// service itself).
	ExternalRepo api.ExternalRepoSpec
}
```

RepoInfo is information about a repository that lives on an external service (such as GitHub or GitLab). 

#### <a id="RepoInfo.String" href="#RepoInfo.String">func (r *RepoInfo) String() string</a>

```
searchKey: protocol.RepoInfo.String
tags: [exported]
```

```Go
func (r *RepoInfo) String() string
```

### <a id="VCSInfo" href="#VCSInfo">type VCSInfo struct</a>

```
searchKey: protocol.VCSInfo
tags: [exported]
```

```Go
type VCSInfo struct {
	URL string // the Git remote URL
}
```

VCSInfo describes how to access an external repository's Git data (to clone or update it). 

### <a id="RepoLinks" href="#RepoLinks">type RepoLinks struct</a>

```
searchKey: protocol.RepoLinks
tags: [exported]
```

```Go
type RepoLinks struct {
	Root   string // the repository's main (root) page URL
	Tree   string // the URL to a tree, with {rev} and {path} substitution variables
	Blob   string // the URL to a blob, with {rev} and {path} substitution variables
	Commit string // the URL to a commit, with {commit} substitution variable
}
```

RepoLinks contains URLs and URL patterns for objects in this repository. 

### <a id="RepoUpdateRequest" href="#RepoUpdateRequest">type RepoUpdateRequest struct</a>

```
searchKey: protocol.RepoUpdateRequest
tags: [exported]
```

```Go
type RepoUpdateRequest struct {
	Repo api.RepoName `json:"repo"`
}
```

RepoUpdateRequest is a request to update the contents of a given repo, or clone it if it doesn't exist. 

#### <a id="RepoUpdateRequest.String" href="#RepoUpdateRequest.String">func (a *RepoUpdateRequest) String() string</a>

```
searchKey: protocol.RepoUpdateRequest.String
tags: [exported]
```

```Go
func (a *RepoUpdateRequest) String() string
```

### <a id="RepoUpdateResponse" href="#RepoUpdateResponse">type RepoUpdateResponse struct</a>

```
searchKey: protocol.RepoUpdateResponse
tags: [exported]
```

```Go
type RepoUpdateResponse struct {
	// ID of the repo that got an update request.
	ID api.RepoID `json:"id"`
	// Name of the repo that got an update request.
	Name string `json:"name"`
	// URL of the repo that got an update request.
	URL string `json:"url"`
}
```

RepoUpdateResponse is a response type to a RepoUpdateRequest. 

### <a id="ChangesetSyncRequest" href="#ChangesetSyncRequest">type ChangesetSyncRequest struct</a>

```
searchKey: protocol.ChangesetSyncRequest
tags: [exported]
```

```Go
type ChangesetSyncRequest struct {
	IDs []int64
}
```

ChangesetSyncRequest is a request to sync a number of changesets 

### <a id="ChangesetSyncResponse" href="#ChangesetSyncResponse">type ChangesetSyncResponse struct</a>

```
searchKey: protocol.ChangesetSyncResponse
tags: [exported]
```

```Go
type ChangesetSyncResponse struct {
	Error string
}
```

ChangesetSyncResponse is a response to sync a number of changesets 

### <a id="PermsSyncRequest" href="#PermsSyncRequest">type PermsSyncRequest struct</a>

```
searchKey: protocol.PermsSyncRequest
tags: [exported]
```

```Go
type PermsSyncRequest struct {
	UserIDs []int32      `json:"user_ids"`
	RepoIDs []api.RepoID `json:"repo_ids"`
}
```

PermsSyncRequest is a request to sync permissions. 

### <a id="PermsSyncResponse" href="#PermsSyncResponse">type PermsSyncResponse struct</a>

```
searchKey: protocol.PermsSyncResponse
tags: [exported]
```

```Go
type PermsSyncResponse struct {
	Error string
}
```

PermsSyncResponse is a response to sync permissions. 

### <a id="ExternalServiceSyncRequest" href="#ExternalServiceSyncRequest">type ExternalServiceSyncRequest struct</a>

```
searchKey: protocol.ExternalServiceSyncRequest
tags: [exported]
```

```Go
type ExternalServiceSyncRequest struct {
	ExternalService api.ExternalService
}
```

ExternalServiceSyncRequest is a request to sync a specific external service eagerly. 

The FrontendAPI is one of the issuers of this request. It does so when creating or updating an external service so that admins don't have to wait until the next sync run to see their repos being synced. 

### <a id="ExternalServiceSyncResult" href="#ExternalServiceSyncResult">type ExternalServiceSyncResult struct</a>

```
searchKey: protocol.ExternalServiceSyncResult
tags: [exported]
```

```Go
type ExternalServiceSyncResult struct {
	ExternalService api.ExternalService
	Error           string
}
```

ExternalServiceSyncResult is a result type of an external service's sync request. 

