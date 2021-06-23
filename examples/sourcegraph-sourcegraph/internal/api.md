# Package api

Package api contains an API client and types for cross-service communication. 

## Index

* [Variables](#var)
    * [var frontendInternal](#frontendInternal)
    * [var InternalClient](#InternalClient)
    * [var requestDuration](#requestDuration)
    * [var MockOrgsListUsers](#MockOrgsListUsers)
    * [var MockInternalClientConfiguration](#MockInternalClientConfiguration)
    * [var MockExternalServiceConfigs](#MockExternalServiceConfigs)
* [Types](#type)
    * [type RepoID int32](#RepoID)
    * [type RepoName string](#RepoName)
    * [type CommitID string](#CommitID)
        * [func (c CommitID) Short() string](#CommitID.Short)
    * [type Repo struct](#Repo)
    * [type ExternalRepoSpec struct](#ExternalRepoSpec)
        * [func (r ExternalRepoSpec) Equal(s *ExternalRepoSpec) bool](#ExternalRepoSpec.Equal)
        * [func (r ExternalRepoSpec) Compare(s ExternalRepoSpec) int](#ExternalRepoSpec.Compare)
        * [func (r ExternalRepoSpec) String() string](#ExternalRepoSpec.String)
    * [type SettingsSubject struct](#SettingsSubject)
        * [func (s SettingsSubject) String() string](#SettingsSubject.String)
    * [type Settings struct](#Settings)
    * [type ExternalService struct](#ExternalService)
    * [type RepoCreateOrUpdateRequest struct](#RepoCreateOrUpdateRequest)
    * [type PhabricatorRepoCreateRequest struct](#PhabricatorRepoCreateRequest)
    * [type ExternalServiceConfigsRequest struct](#ExternalServiceConfigsRequest)
    * [type ExternalServicesListRequest struct](#ExternalServicesListRequest)
    * [type internalClient struct](#internalClient)
        * [func (c *internalClient) WaitForFrontend(ctx context.Context) error](#internalClient.WaitForFrontend)
        * [func (c *internalClient) SavedQueriesListAll(ctx context.Context) (map[SavedQueryIDSpec]ConfigSavedQuery, error)](#internalClient.SavedQueriesListAll)
        * [func (c *internalClient) SavedQueriesGetInfo(ctx context.Context, query string) (*SavedQueryInfo, error)](#internalClient.SavedQueriesGetInfo)
        * [func (c *internalClient) SavedQueriesSetInfo(ctx context.Context, info *SavedQueryInfo) error](#internalClient.SavedQueriesSetInfo)
        * [func (c *internalClient) SavedQueriesDeleteInfo(ctx context.Context, query string) error](#internalClient.SavedQueriesDeleteInfo)
        * [func (c *internalClient) SettingsGetForSubject(ctx context.Context, subject SettingsSubject) (parsed *schema.Settings, settings *Settings, err error)](#internalClient.SettingsGetForSubject)
        * [func (c *internalClient) OrgsListUsers(ctx context.Context, orgID int32) (users []int32, err error)](#internalClient.OrgsListUsers)
        * [func (c *internalClient) OrgsGetByName(ctx context.Context, orgName string) (orgID *int32, err error)](#internalClient.OrgsGetByName)
        * [func (c *internalClient) UsersGetByUsername(ctx context.Context, username string) (user *int32, err error)](#internalClient.UsersGetByUsername)
        * [func (c *internalClient) UserEmailsGetEmail(ctx context.Context, userID int32) (email *string, err error)](#internalClient.UserEmailsGetEmail)
        * [func (c *internalClient) ExternalURL(ctx context.Context) (string, error)](#internalClient.ExternalURL)
        * [func (c *internalClient) CanSendEmail(ctx context.Context) (canSendEmail bool, err error)](#internalClient.CanSendEmail)
        * [func (c *internalClient) SendEmail(ctx context.Context, message txtypes.Message) error](#internalClient.SendEmail)
        * [func (c *internalClient) ReposListEnabled(ctx context.Context) ([]RepoName, error)](#internalClient.ReposListEnabled)
        * [func (c *internalClient) Configuration(ctx context.Context) (conftypes.RawUnified, error)](#internalClient.Configuration)
        * [func (c *internalClient) ReposGetByName(ctx context.Context, repoName RepoName) (*Repo, error)](#internalClient.ReposGetByName)
        * [func (c *internalClient) PhabricatorRepoCreate(ctx context.Context, repo RepoName, callsign, url string) error](#internalClient.PhabricatorRepoCreate)
        * [func (c *internalClient) ExternalServiceConfigs(ctx context.Context, kind string, result interface{}) error](#internalClient.ExternalServiceConfigs)
        * [func (c *internalClient) ExternalServicesList(ctx context.Context, opts ExternalServicesListRequest) ([]*ExternalService, error)](#internalClient.ExternalServicesList)
        * [func (c *internalClient) LogTelemetry(ctx context.Context, reqBody interface{}) error](#internalClient.LogTelemetry)
        * [func (c *internalClient) postInternal(ctx context.Context, route string, reqBody, respBody interface{}) error](#internalClient.postInternal)
        * [func (c *internalClient) meteredPost(ctx context.Context, route string, reqBody, respBody interface{}) error](#internalClient.meteredPost)
        * [func (c *internalClient) post(ctx context.Context, route string, reqBody, respBody interface{}) (int, error)](#internalClient.post)
    * [type SavedQueryIDSpec struct](#SavedQueryIDSpec)
    * [type ConfigSavedQuery struct](#ConfigSavedQuery)
        * [func (sq ConfigSavedQuery) Equals(other ConfigSavedQuery) bool](#ConfigSavedQuery.Equals)
    * [type PartialConfigSavedQueries struct](#PartialConfigSavedQueries)
    * [type SavedQuerySpecAndConfig struct](#SavedQuerySpecAndConfig)
    * [type SavedQueryInfo struct](#SavedQueryInfo)
* [Functions](#func)
    * [func cmp(a, b string) int](#cmp)
    * [func checkAPIResponse(resp *http.Response) error](#checkAPIResponse)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="frontendInternal" href="#frontendInternal">var frontendInternal</a>

```
searchKey: api.frontendInternal
tags: [private]
```

```Go
var frontendInternal = ...
```

### <a id="InternalClient" href="#InternalClient">var InternalClient</a>

```
searchKey: api.InternalClient
```

```Go
var InternalClient = &internalClient{URL: "http://" + frontendInternal}
```

### <a id="requestDuration" href="#requestDuration">var requestDuration</a>

```
searchKey: api.requestDuration
tags: [private]
```

```Go
var requestDuration = ...
```

### <a id="MockOrgsListUsers" href="#MockOrgsListUsers">var MockOrgsListUsers</a>

```
searchKey: api.MockOrgsListUsers
```

```Go
var MockOrgsListUsers func(orgID int32) (users []int32, err error)
```

### <a id="MockInternalClientConfiguration" href="#MockInternalClientConfiguration">var MockInternalClientConfiguration</a>

```
searchKey: api.MockInternalClientConfiguration
```

```Go
var MockInternalClientConfiguration func() (conftypes.RawUnified, error)
```

MockInternalClientConfiguration mocks (*internalClient).Configuration. 

### <a id="MockExternalServiceConfigs" href="#MockExternalServiceConfigs">var MockExternalServiceConfigs</a>

```
searchKey: api.MockExternalServiceConfigs
```

```Go
var MockExternalServiceConfigs func(kind string, result interface{}) error
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="RepoID" href="#RepoID">type RepoID int32</a>

```
searchKey: api.RepoID
```

```Go
type RepoID int32
```

RepoID is the unique identifier for a repository. 

### <a id="RepoName" href="#RepoName">type RepoName string</a>

```
searchKey: api.RepoName
```

```Go
type RepoName string
```

RepoName is the name of a repository, consisting of one or more "/"-separated path components. 

Previously, this was called RepoURI. 

### <a id="CommitID" href="#CommitID">type CommitID string</a>

```
searchKey: api.CommitID
```

```Go
type CommitID string
```

CommitID is the 40-character SHA-1 hash for a Git commit. 

#### <a id="CommitID.Short" href="#CommitID.Short">func (c CommitID) Short() string</a>

```
searchKey: api.CommitID.Short
```

```Go
func (c CommitID) Short() string
```

Short returns the SHA-1 commit hash truncated to 7 characters 

### <a id="Repo" href="#Repo">type Repo struct</a>

```
searchKey: api.Repo
```

```Go
type Repo struct {
	// ID is the unique numeric ID for this repository on Sourcegraph.
	ID RepoID

	// ExternalRepo identifies this repository by its ID on the external service where it resides (and the external
	// service itself).
	ExternalRepo *ExternalRepoSpec

	// Name is the name of the repository (such as "github.com/user/repo").
	Name RepoName
	// Enabled is whether the repository is enabled. Disabled repositories are
	// not accessible by users (except site admins).
	Enabled bool
}
```

Repo represents a source code repository. 

### <a id="ExternalRepoSpec" href="#ExternalRepoSpec">type ExternalRepoSpec struct</a>

```
searchKey: api.ExternalRepoSpec
```

```Go
type ExternalRepoSpec struct {
	// ID is the repository's ID on the external service. Its value is opaque except to the repo-updater.
	//
	// For GitHub, this is the GitHub GraphQL API's node ID for the repository.
	ID string

	// ServiceType is the type of external service. Its value is opaque except to the repo-updater.
	//
	// Example: "github", "gitlab", etc.
	ServiceType string

	// ServiceID is the particular instance of the external service where this repository resides. Its value is
	// opaque but typically consists of the canonical base URL to the service.
	//
	// Implementations must take care to normalize this URL. For example, if different GitHub.com repository code
	// paths used slightly different values here (such as "https://github.com/" and "https://github.com", note the
	// lack of trailing slash), then the same logical repository would be incorrectly treated as multiple distinct
	// repositories depending on the code path that provided its ServiceID value.
	//
	// Example: "https://github.com/", "https://github-enterprise.example.com/"
	ServiceID string
}
```

ExternalRepoSpec specifies a repository on an external service (such as GitHub or GitLab). 

#### <a id="ExternalRepoSpec.Equal" href="#ExternalRepoSpec.Equal">func (r ExternalRepoSpec) Equal(s *ExternalRepoSpec) bool</a>

```
searchKey: api.ExternalRepoSpec.Equal
```

```Go
func (r ExternalRepoSpec) Equal(s *ExternalRepoSpec) bool
```

Equal returns true if r is equal to s. 

#### <a id="ExternalRepoSpec.Compare" href="#ExternalRepoSpec.Compare">func (r ExternalRepoSpec) Compare(s ExternalRepoSpec) int</a>

```
searchKey: api.ExternalRepoSpec.Compare
```

```Go
func (r ExternalRepoSpec) Compare(s ExternalRepoSpec) int
```

Compare returns -1 if r < s, 0 if r == s or 1 if r > s 

#### <a id="ExternalRepoSpec.String" href="#ExternalRepoSpec.String">func (r ExternalRepoSpec) String() string</a>

```
searchKey: api.ExternalRepoSpec.String
```

```Go
func (r ExternalRepoSpec) String() string
```

### <a id="SettingsSubject" href="#SettingsSubject">type SettingsSubject struct</a>

```
searchKey: api.SettingsSubject
```

```Go
type SettingsSubject struct {
	Default bool   // whether this is for default settings
	Site    bool   // whether this is for global settings
	Org     *int32 // the org's ID
	User    *int32 // the user's ID
}
```

A SettingsSubject is something that can have settings. Exactly 1 field must be nonzero. 

#### <a id="SettingsSubject.String" href="#SettingsSubject.String">func (s SettingsSubject) String() string</a>

```
searchKey: api.SettingsSubject.String
```

```Go
func (s SettingsSubject) String() string
```

### <a id="Settings" href="#Settings">type Settings struct</a>

```
searchKey: api.Settings
```

```Go
type Settings struct {
	ID           int32           // the unique ID of this settings value
	Subject      SettingsSubject // the subject of these settings
	AuthorUserID *int32          // the ID of the user who authored this settings value
	Contents     string          // the raw JSON (with comments and trailing commas allowed)
	CreatedAt    time.Time       // the date when this settings value was created
}
```

Settings contains settings for a subject. 

### <a id="ExternalService" href="#ExternalService">type ExternalService struct</a>

```
searchKey: api.ExternalService
```

```Go
type ExternalService struct {
	ID              int64
	Kind            string
	DisplayName     string
	Config          string
	CreatedAt       time.Time
	UpdatedAt       time.Time
	DeletedAt       time.Time
	LastSyncAt      time.Time
	NextSyncAt      time.Time
	NamespaceUserID int32
	Unrestricted    bool
	CloudDefault    bool
}
```

ExternalService represents an complete external service record. 

### <a id="RepoCreateOrUpdateRequest" href="#RepoCreateOrUpdateRequest">type RepoCreateOrUpdateRequest struct</a>

```
searchKey: api.RepoCreateOrUpdateRequest
```

```Go
type RepoCreateOrUpdateRequest struct {
	// ExternalRepo identifies this repository by its ID on the external service where it resides (and the external
	// service itself).
	ExternalRepo ExternalRepoSpec

	// RepoName is the repository's name.
	//
	// TODO(sqs): Add a way for callers to request that this repository be renamed.
	RepoName `json:"repo"`

	// Enabled is whether the repository should be enabled when initially created.
	//
	// NOTE: If the repository already exists when this request is received, its enablement is not updated. This
	// field is used only when creating the repository.
	Enabled bool `json:"enabled"`

	// Description is the repository's description on its external origin.
	Description string `json:"description"`

	// Fork is whether this repository is a fork (according to its external origin).
	Fork bool `json:"fork"`

	// Archived is whether this repository is archived (according to its external origin).
	Archived bool `json:"archived"`
}
```

RepoCreateOrUpdateRequest is a request to create or update a repository. 

The request handler determines if the request refers to an existing repository (and should therefore update instead of create). If ExternalRepo is set, then it tries to find a stored repository with the same ExternalRepo values. If ExternalRepo is not set, then it tries to find a stored repository with the same RepoName value. 

NOTE: Some fields are only used during creation (and are not used to update an existing repository). 

### <a id="PhabricatorRepoCreateRequest" href="#PhabricatorRepoCreateRequest">type PhabricatorRepoCreateRequest struct</a>

```
searchKey: api.PhabricatorRepoCreateRequest
```

```Go
type PhabricatorRepoCreateRequest struct {
	RepoName `json:"repo"`
	Callsign string `json:"callsign"`
	URL      string `json:"url"`
}
```

### <a id="ExternalServiceConfigsRequest" href="#ExternalServiceConfigsRequest">type ExternalServiceConfigsRequest struct</a>

```
searchKey: api.ExternalServiceConfigsRequest
```

```Go
type ExternalServiceConfigsRequest struct {
	Kind    string `json:"kind"`
	Limit   int    `json:"limit"`
	AfterID int    `json:"after_id"`
}
```

### <a id="ExternalServicesListRequest" href="#ExternalServicesListRequest">type ExternalServicesListRequest struct</a>

```
searchKey: api.ExternalServicesListRequest
```

```Go
type ExternalServicesListRequest struct {
	// NOTE(tsenart): We must keep this field in addition to the
	// Kinds field until after we roll-out this change, for backwards compatibility.
	Kind    string   `json:"kind"`
	Kinds   []string `json:"kinds"`
	Limit   int      `json:"limit"`
	AfterID int      `json:"after_id"`
}
```

### <a id="internalClient" href="#internalClient">type internalClient struct</a>

```
searchKey: api.internalClient
tags: [private]
```

```Go
type internalClient struct {
	// URL is the root to the internal API frontend server.
	URL string
}
```

#### <a id="internalClient.WaitForFrontend" href="#internalClient.WaitForFrontend">func (c *internalClient) WaitForFrontend(ctx context.Context) error</a>

```
searchKey: api.internalClient.WaitForFrontend
tags: [private]
```

```Go
func (c *internalClient) WaitForFrontend(ctx context.Context) error
```

WaitForFrontend retries a noop request to the internal API until it is able to reach the endpoint, indicating that the frontend is available. 

#### <a id="internalClient.SavedQueriesListAll" href="#internalClient.SavedQueriesListAll">func (c *internalClient) SavedQueriesListAll(ctx context.Context) (map[SavedQueryIDSpec]ConfigSavedQuery, error)</a>

```
searchKey: api.internalClient.SavedQueriesListAll
tags: [private]
```

```Go
func (c *internalClient) SavedQueriesListAll(ctx context.Context) (map[SavedQueryIDSpec]ConfigSavedQuery, error)
```

SavedQueriesListAll lists all saved queries, from every user, org, etc. 

#### <a id="internalClient.SavedQueriesGetInfo" href="#internalClient.SavedQueriesGetInfo">func (c *internalClient) SavedQueriesGetInfo(ctx context.Context, query string) (*SavedQueryInfo, error)</a>

```
searchKey: api.internalClient.SavedQueriesGetInfo
tags: [private]
```

```Go
func (c *internalClient) SavedQueriesGetInfo(ctx context.Context, query string) (*SavedQueryInfo, error)
```

SavedQueriesGetInfo gets the info from the DB for the given saved query. nil is returned if there is no existing info for the saved query. 

#### <a id="internalClient.SavedQueriesSetInfo" href="#internalClient.SavedQueriesSetInfo">func (c *internalClient) SavedQueriesSetInfo(ctx context.Context, info *SavedQueryInfo) error</a>

```
searchKey: api.internalClient.SavedQueriesSetInfo
tags: [private]
```

```Go
func (c *internalClient) SavedQueriesSetInfo(ctx context.Context, info *SavedQueryInfo) error
```

SavedQueriesSetInfo sets the info in the DB for the given query. 

#### <a id="internalClient.SavedQueriesDeleteInfo" href="#internalClient.SavedQueriesDeleteInfo">func (c *internalClient) SavedQueriesDeleteInfo(ctx context.Context, query string) error</a>

```
searchKey: api.internalClient.SavedQueriesDeleteInfo
tags: [private]
```

```Go
func (c *internalClient) SavedQueriesDeleteInfo(ctx context.Context, query string) error
```

#### <a id="internalClient.SettingsGetForSubject" href="#internalClient.SettingsGetForSubject">func (c *internalClient) SettingsGetForSubject(ctx context.Context, subject SettingsSubject) (parsed *schema.Settings, settings *Settings, err error)</a>

```
searchKey: api.internalClient.SettingsGetForSubject
tags: [private]
```

```Go
func (c *internalClient) SettingsGetForSubject(ctx context.Context, subject SettingsSubject) (parsed *schema.Settings, settings *Settings, err error)
```

#### <a id="internalClient.OrgsListUsers" href="#internalClient.OrgsListUsers">func (c *internalClient) OrgsListUsers(ctx context.Context, orgID int32) (users []int32, err error)</a>

```
searchKey: api.internalClient.OrgsListUsers
tags: [private]
```

```Go
func (c *internalClient) OrgsListUsers(ctx context.Context, orgID int32) (users []int32, err error)
```

#### <a id="internalClient.OrgsGetByName" href="#internalClient.OrgsGetByName">func (c *internalClient) OrgsGetByName(ctx context.Context, orgName string) (orgID *int32, err error)</a>

```
searchKey: api.internalClient.OrgsGetByName
tags: [private]
```

```Go
func (c *internalClient) OrgsGetByName(ctx context.Context, orgName string) (orgID *int32, err error)
```

#### <a id="internalClient.UsersGetByUsername" href="#internalClient.UsersGetByUsername">func (c *internalClient) UsersGetByUsername(ctx context.Context, username string) (user *int32, err error)</a>

```
searchKey: api.internalClient.UsersGetByUsername
tags: [private]
```

```Go
func (c *internalClient) UsersGetByUsername(ctx context.Context, username string) (user *int32, err error)
```

#### <a id="internalClient.UserEmailsGetEmail" href="#internalClient.UserEmailsGetEmail">func (c *internalClient) UserEmailsGetEmail(ctx context.Context, userID int32) (email *string, err error)</a>

```
searchKey: api.internalClient.UserEmailsGetEmail
tags: [private]
```

```Go
func (c *internalClient) UserEmailsGetEmail(ctx context.Context, userID int32) (email *string, err error)
```

#### <a id="internalClient.ExternalURL" href="#internalClient.ExternalURL">func (c *internalClient) ExternalURL(ctx context.Context) (string, error)</a>

```
searchKey: api.internalClient.ExternalURL
tags: [private]
```

```Go
func (c *internalClient) ExternalURL(ctx context.Context) (string, error)
```

TODO(slimsag): In the future, once we're no longer using environment variables to build ExternalURL, remove this in favor of services just reading it directly from the configuration file. 

TODO(slimsag): needs cleanup as part of upcoming configuration refactor. 

#### <a id="internalClient.CanSendEmail" href="#internalClient.CanSendEmail">func (c *internalClient) CanSendEmail(ctx context.Context) (canSendEmail bool, err error)</a>

```
searchKey: api.internalClient.CanSendEmail
tags: [private]
```

```Go
func (c *internalClient) CanSendEmail(ctx context.Context) (canSendEmail bool, err error)
```

TODO(slimsag): needs cleanup as part of upcoming configuration refactor. 

#### <a id="internalClient.SendEmail" href="#internalClient.SendEmail">func (c *internalClient) SendEmail(ctx context.Context, message txtypes.Message) error</a>

```
searchKey: api.internalClient.SendEmail
tags: [private]
```

```Go
func (c *internalClient) SendEmail(ctx context.Context, message txtypes.Message) error
```

TODO(slimsag): needs cleanup as part of upcoming configuration refactor. 

#### <a id="internalClient.ReposListEnabled" href="#internalClient.ReposListEnabled">func (c *internalClient) ReposListEnabled(ctx context.Context) ([]RepoName, error)</a>

```
searchKey: api.internalClient.ReposListEnabled
tags: [private]
```

```Go
func (c *internalClient) ReposListEnabled(ctx context.Context) ([]RepoName, error)
```

ReposListEnabled returns a list of all enabled repository names. 

#### <a id="internalClient.Configuration" href="#internalClient.Configuration">func (c *internalClient) Configuration(ctx context.Context) (conftypes.RawUnified, error)</a>

```
searchKey: api.internalClient.Configuration
tags: [private]
```

```Go
func (c *internalClient) Configuration(ctx context.Context) (conftypes.RawUnified, error)
```

#### <a id="internalClient.ReposGetByName" href="#internalClient.ReposGetByName">func (c *internalClient) ReposGetByName(ctx context.Context, repoName RepoName) (*Repo, error)</a>

```
searchKey: api.internalClient.ReposGetByName
tags: [private]
```

```Go
func (c *internalClient) ReposGetByName(ctx context.Context, repoName RepoName) (*Repo, error)
```

#### <a id="internalClient.PhabricatorRepoCreate" href="#internalClient.PhabricatorRepoCreate">func (c *internalClient) PhabricatorRepoCreate(ctx context.Context, repo RepoName, callsign, url string) error</a>

```
searchKey: api.internalClient.PhabricatorRepoCreate
tags: [private]
```

```Go
func (c *internalClient) PhabricatorRepoCreate(ctx context.Context, repo RepoName, callsign, url string) error
```

#### <a id="internalClient.ExternalServiceConfigs" href="#internalClient.ExternalServiceConfigs">func (c *internalClient) ExternalServiceConfigs(ctx context.Context, kind string, result interface{}) error</a>

```
searchKey: api.internalClient.ExternalServiceConfigs
tags: [private]
```

```Go
func (c *internalClient) ExternalServiceConfigs(ctx context.Context, kind string, result interface{}) error
```

ExternalServiceConfigs fetches external service configs of a single kind into the result parameter, which should be a slice of the expected config type. 

#### <a id="internalClient.ExternalServicesList" href="#internalClient.ExternalServicesList">func (c *internalClient) ExternalServicesList(ctx context.Context, opts ExternalServicesListRequest) ([]*ExternalService, error)</a>

```
searchKey: api.internalClient.ExternalServicesList
tags: [private]
```

```Go
func (c *internalClient) ExternalServicesList(ctx context.Context, opts ExternalServicesListRequest) ([]*ExternalService, error)
```

ExternalServicesList returns all external services of the given kind. 

#### <a id="internalClient.LogTelemetry" href="#internalClient.LogTelemetry">func (c *internalClient) LogTelemetry(ctx context.Context, reqBody interface{}) error</a>

```
searchKey: api.internalClient.LogTelemetry
tags: [private]
```

```Go
func (c *internalClient) LogTelemetry(ctx context.Context, reqBody interface{}) error
```

#### <a id="internalClient.postInternal" href="#internalClient.postInternal">func (c *internalClient) postInternal(ctx context.Context, route string, reqBody, respBody interface{}) error</a>

```
searchKey: api.internalClient.postInternal
tags: [private]
```

```Go
func (c *internalClient) postInternal(ctx context.Context, route string, reqBody, respBody interface{}) error
```

postInternal sends an HTTP post request to the internal route. 

#### <a id="internalClient.meteredPost" href="#internalClient.meteredPost">func (c *internalClient) meteredPost(ctx context.Context, route string, reqBody, respBody interface{}) error</a>

```
searchKey: api.internalClient.meteredPost
tags: [private]
```

```Go
func (c *internalClient) meteredPost(ctx context.Context, route string, reqBody, respBody interface{}) error
```

#### <a id="internalClient.post" href="#internalClient.post">func (c *internalClient) post(ctx context.Context, route string, reqBody, respBody interface{}) (int, error)</a>

```
searchKey: api.internalClient.post
tags: [private]
```

```Go
func (c *internalClient) post(ctx context.Context, route string, reqBody, respBody interface{}) (int, error)
```

post sends an HTTP post request to the provided route. If reqBody is non-nil it will Marshal it as JSON and set that as the Request body. If respBody is non-nil the response body will be JSON unmarshalled to resp. 

### <a id="SavedQueryIDSpec" href="#SavedQueryIDSpec">type SavedQueryIDSpec struct</a>

```
searchKey: api.SavedQueryIDSpec
```

```Go
type SavedQueryIDSpec struct {
	Subject SettingsSubject
	Key     string
}
```

### <a id="ConfigSavedQuery" href="#ConfigSavedQuery">type ConfigSavedQuery struct</a>

```
searchKey: api.ConfigSavedQuery
```

```Go
type ConfigSavedQuery struct {
	Key             string  `json:"key,omitempty"`
	Description     string  `json:"description"`
	Query           string  `json:"query"`
	Notify          bool    `json:"notify,omitempty"`
	NotifySlack     bool    `json:"notifySlack,omitempty"`
	UserID          *int32  `json:"userID"`
	OrgID           *int32  `json:"orgID"`
	SlackWebhookURL *string `json:"slackWebhookURL"`
}
```

ConfigSavedQuery is the JSON shape of a saved query entry in the JSON configuration (i.e., an entry in the {"search.savedQueries": [...]} array). 

#### <a id="ConfigSavedQuery.Equals" href="#ConfigSavedQuery.Equals">func (sq ConfigSavedQuery) Equals(other ConfigSavedQuery) bool</a>

```
searchKey: api.ConfigSavedQuery.Equals
```

```Go
func (sq ConfigSavedQuery) Equals(other ConfigSavedQuery) bool
```

### <a id="PartialConfigSavedQueries" href="#PartialConfigSavedQueries">type PartialConfigSavedQueries struct</a>

```
searchKey: api.PartialConfigSavedQueries
```

```Go
type PartialConfigSavedQueries struct {
	SavedQueries []ConfigSavedQuery `json:"search.savedQueries"`
}
```

PartialConfigSavedQueries is the JSON configuration shape, including only the search.savedQueries section. 

### <a id="SavedQuerySpecAndConfig" href="#SavedQuerySpecAndConfig">type SavedQuerySpecAndConfig struct</a>

```
searchKey: api.SavedQuerySpecAndConfig
```

```Go
type SavedQuerySpecAndConfig struct {
	Spec   SavedQueryIDSpec
	Config ConfigSavedQuery
}
```

SavedQuerySpecAndConfig represents a saved query configuration its unique ID. 

### <a id="SavedQueryInfo" href="#SavedQueryInfo">type SavedQueryInfo struct</a>

```
searchKey: api.SavedQueryInfo
```

```Go
type SavedQueryInfo struct {
	// Query is the search query in question.
	Query string

	// LastExecuted is the timestamp of the last time that the search query was
	// executed.
	LastExecuted time.Time

	// LatestResult is the timestamp of the latest-known result for the search
	// query. Therefore, searching `after:<LatestResult>` will return the new
	// search results not yet seen.
	LatestResult time.Time

	// ExecDuration is the amount of time it took for the query to execute.
	ExecDuration time.Duration
}
```

SavedQueryInfo represents information about a saved query that was executed. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="cmp" href="#cmp">func cmp(a, b string) int</a>

```
searchKey: api.cmp
tags: [private]
```

```Go
func cmp(a, b string) int
```

### <a id="checkAPIResponse" href="#checkAPIResponse">func checkAPIResponse(resp *http.Response) error</a>

```
searchKey: api.checkAPIResponse
tags: [private]
```

```Go
func checkAPIResponse(resp *http.Response) error
```

