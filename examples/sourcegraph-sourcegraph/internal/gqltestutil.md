# Package gqltestutil

## Index

* [Constants](#const)
    * [const SearchContextsOrderBySpec](#SearchContextsOrderBySpec)
    * [const SearchContextsOrderByUpdatedAt](#SearchContextsOrderByUpdatedAt)
* [Variables](#var)
    * [var ErrContinueRetry](#ErrContinueRetry)
    * [var graphqlQueryNameRe](#graphqlQueryNameRe)
* [Types](#type)
    * [type AddExternalServiceInput struct](#AddExternalServiceInput)
    * [type AnyResult struct](#AnyResult)
        * [func (r *AnyResult) UnmarshalJSON(b []byte) error](#AnyResult.UnmarshalJSON)
    * [type Client struct](#Client)
        * [func SignIn(baseURL, email, password string) (*Client, error)](#SignIn)
        * [func SignUp(baseURL, email, username, password string) (*Client, error)](#SignUp)
        * [func SiteAdminInit(baseURL, email, username, password string) (*Client, error)](#SiteAdminInit)
        * [func authenticate(baseURL, path string, body interface{}) (*Client, error)](#authenticate)
        * [func newClient(baseURL string) (*Client, error)](#newClient)
        * [func (c *Client) AddExternalService(input AddExternalServiceInput) (string, error)](#Client.AddExternalService)
        * [func (c *Client) AuthenticatedUserID() string](#Client.AuthenticatedUserID)
        * [func (c *Client) CreateAccessToken(note string, scopes []string) (string, error)](#Client.CreateAccessToken)
        * [func (c *Client) CreateOrganization(name, displayName string) (string, error)](#Client.CreateOrganization)
        * [func (c *Client) CreateSearchContext(input CreateSearchContextInput, repositories []SearchContextRepositoryRevisionsInput) (string, error)](#Client.CreateSearchContext)
        * [func (c *Client) CreateUser(username, email string) (string, error)](#Client.CreateUser)
        * [func (c *Client) CurrentUserID(token string) (string, error)](#Client.CurrentUserID)
        * [func (c *Client) DeleteAccessToken(token string) error](#Client.DeleteAccessToken)
        * [func (c *Client) DeleteExternalService(id string) error](#Client.DeleteExternalService)
        * [func (c *Client) DeleteOrganization(id string) error](#Client.DeleteOrganization)
        * [func (c *Client) DeleteSearchContext(id string) error](#Client.DeleteSearchContext)
        * [func (c *Client) DeleteUser(id string, hard bool) error](#Client.DeleteUser)
        * [func (c *Client) FileExternalLinks(repoName, revision, filePath string) ([]*ExternalLink, error)](#Client.FileExternalLinks)
        * [func (c *Client) Get(url string) (*http.Response, error)](#Client.Get)
        * [func (c *Client) GetSearchContext(id string) (*GetSearchContextResult, error)](#Client.GetSearchContext)
        * [func (c *Client) GitBlob(repoName, revision, filePath string) (string, error)](#Client.GitBlob)
        * [func (c *Client) GraphQL(token, query string, variables map[string]interface{}, target interface{}) error](#Client.GraphQL)
        * [func (c *Client) InviteUserToOrganization(orgID, username string) (*InviteUserToOrganizationResult, error)](#Client.InviteUserToOrganization)
        * [func (c *Client) ListSearchContexts(options ListSearchContextsOptions) (*ListSearchContextsResult, error)](#Client.ListSearchContexts)
        * [func (c *Client) Organization(name string) (*Organization, error)](#Client.Organization)
        * [func (c *Client) OrganizationMembers(id string) ([]*OrganizationMember, error)](#Client.OrganizationMembers)
        * [func (c *Client) OverwriteSettings(subjectID, contents string) error](#Client.OverwriteSettings)
        * [func (c *Client) Post(url string, body io.Reader) (*http.Response, error)](#Client.Post)
        * [func (c *Client) RemoveUserFromOrganization(userID, orgID string) error](#Client.RemoveUserFromOrganization)
        * [func (c *Client) Repository(name string) (*Repository, error)](#Client.Repository)
        * [func (c *Client) RepositoryPermissionsInfo(name string) (*PermissionsInfo, error)](#Client.RepositoryPermissionsInfo)
        * [func (c *Client) ScheduleRepositoryPermissionsSync(id string) error](#Client.ScheduleRepositoryPermissionsSync)
        * [func (c *Client) SearchAll(query string) ([]*AnyResult, error)](#Client.SearchAll)
        * [func (c *Client) SearchCommits(query string) (*SearchCommitResults, error)](#Client.SearchCommits)
        * [func (c *Client) SearchFiles(query string) (*SearchFileResults, error)](#Client.SearchFiles)
        * [func (c *Client) SearchRepositories(query string) (SearchRepositoryResults, error)](#Client.SearchRepositories)
        * [func (c *Client) SearchStats(query string) (*SearchStatsResult, error)](#Client.SearchStats)
        * [func (c *Client) SearchSuggestions(query string) ([]SearchSuggestionsResult, error)](#Client.SearchSuggestions)
        * [func (c *Client) SettingsCascade(subjectID string) ([]*SettingsSubject, error)](#Client.SettingsCascade)
        * [func (c *Client) SiteConfiguration() (*schema.SiteConfiguration, error)](#Client.SiteConfiguration)
        * [func (c *Client) UpdateOrganization(id, displayName string) error](#Client.UpdateOrganization)
        * [func (c *Client) UpdateSearchContext(id string, input UpdateSearchContextInput, repos []SearchContextRepositoryRevisionsInput) (string, error)](#Client.UpdateSearchContext)
        * [func (c *Client) UpdateSiteConfiguration(config *schema.SiteConfiguration) error](#Client.UpdateSiteConfiguration)
        * [func (c *Client) UserOrganizations(username string) ([]string, error)](#Client.UserOrganizations)
        * [func (c *Client) ViewerSettings() (string, error)](#Client.ViewerSettings)
        * [func (c *Client) WaitForReposToBeCloned(repos ...string) error](#Client.WaitForReposToBeCloned)
        * [func (c *Client) WaitForReposToBeIndex(repos ...string) error](#Client.WaitForReposToBeIndex)
        * [func (c *Client) addCookies(req *http.Request)](#Client.addCookies)
        * [func (c *Client) authenticate(path string, body interface{}) error](#Client.authenticate)
        * [func (c *Client) lastSettingsID(subjectID string) (int, error)](#Client.lastSettingsID)
        * [func (c *Client) waitForReposByQuery(query string, repos ...string) ([]string, error)](#Client.waitForReposByQuery)
    * [type CommitResult struct](#CommitResult)
    * [type CreateSearchContextInput struct](#CreateSearchContextInput)
    * [type ExternalLink struct](#ExternalLink)
    * [type FileResult struct](#FileResult)
    * [type FileSuggestionResult struct](#FileSuggestionResult)
    * [type GetSearchContextResult struct](#GetSearchContextResult)
    * [type InviteUserToOrganizationResult struct](#InviteUserToOrganizationResult)
    * [type LanguageSuggestionResult struct](#LanguageSuggestionResult)
    * [type ListSearchContextsOptions struct](#ListSearchContextsOptions)
    * [type ListSearchContextsResult struct](#ListSearchContextsResult)
    * [type Organization struct](#Organization)
    * [type OrganizationMember struct](#OrganizationMember)
    * [type PermissionsInfo struct](#PermissionsInfo)
    * [type ProposedQuery struct](#ProposedQuery)
    * [type Repository struct](#Repository)
    * [type RepositoryResult struct](#RepositoryResult)
    * [type RepositorySuggestionResult struct](#RepositorySuggestionResult)
    * [type SearchAlert struct](#SearchAlert)
    * [type SearchCommitResults struct](#SearchCommitResults)
    * [type SearchContextRepositoryRevisionsInput struct](#SearchContextRepositoryRevisionsInput)
    * [type SearchContextSuggestionResult struct](#SearchContextSuggestionResult)
    * [type SearchContextsOrderBy string](#SearchContextsOrderBy)
    * [type SearchFileResult struct](#SearchFileResult)
    * [type SearchFileResults struct](#SearchFileResults)
    * [type SearchRepositoryResult struct](#SearchRepositoryResult)
    * [type SearchRepositoryResults []*gqltestutil.SearchRepositoryResult](#SearchRepositoryResults)
        * [func (rs SearchRepositoryResults) Exists(names ...string) []string](#SearchRepositoryResults.Exists)
        * [func (rs SearchRepositoryResults) String() string](#SearchRepositoryResults.String)
    * [type SearchStatsResult struct](#SearchStatsResult)
    * [type SearchStreamClient struct](#SearchStreamClient)
        * [func (s *SearchStreamClient) AuthenticatedUserID() string](#SearchStreamClient.AuthenticatedUserID)
        * [func (s *SearchStreamClient) OverwriteSettings(subjectID, contents string) error](#SearchStreamClient.OverwriteSettings)
        * [func (s *SearchStreamClient) SearchAll(query string) ([]*AnyResult, error)](#SearchStreamClient.SearchAll)
        * [func (s *SearchStreamClient) SearchFiles(query string) (*SearchFileResults, error)](#SearchStreamClient.SearchFiles)
        * [func (s *SearchStreamClient) SearchRepositories(query string) (SearchRepositoryResults, error)](#SearchStreamClient.SearchRepositories)
        * [func (s *SearchStreamClient) search(query string, dec streamhttp.Decoder) error](#SearchStreamClient.search)
    * [type SearchSuggestionsResult struct](#SearchSuggestionsResult)
        * [func (srr *SearchSuggestionsResult) UnmarshalJSON(data []byte) error](#SearchSuggestionsResult.UnmarshalJSON)
    * [type SettingsSubject struct](#SettingsSubject)
    * [type SymbolSuggestionResult struct](#SymbolSuggestionResult)
    * [type UpdateSearchContextInput struct](#UpdateSearchContextInput)
* [Functions](#func)
    * [func NeedsSiteInit(baseURL string) (bool, error)](#NeedsSiteInit)
    * [func Retry(timeout time.Duration, fn func() error) error](#Retry)
    * [func extractCSRFToken(body string) string](#extractCSRFToken)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="SearchContextsOrderBySpec" href="#SearchContextsOrderBySpec">const SearchContextsOrderBySpec</a>

```
searchKey: gqltestutil.SearchContextsOrderBySpec
tags: [constant string]
```

```Go
const SearchContextsOrderBySpec SearchContextsOrderBy = "SEARCH_CONTEXT_SPEC"
```

### <a id="SearchContextsOrderByUpdatedAt" href="#SearchContextsOrderByUpdatedAt">const SearchContextsOrderByUpdatedAt</a>

```
searchKey: gqltestutil.SearchContextsOrderByUpdatedAt
tags: [constant string]
```

```Go
const SearchContextsOrderByUpdatedAt SearchContextsOrderBy = "SEARCH_CONTEXT_UPDATED_AT"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="ErrContinueRetry" href="#ErrContinueRetry">var ErrContinueRetry</a>

```
searchKey: gqltestutil.ErrContinueRetry
tags: [variable interface]
```

```Go
var ErrContinueRetry = errors.New("continue Retry")
```

### <a id="graphqlQueryNameRe" href="#graphqlQueryNameRe">var graphqlQueryNameRe</a>

```
searchKey: gqltestutil.graphqlQueryNameRe
tags: [variable struct private]
```

```Go
var graphqlQueryNameRe = lazyregexp.New(`(query|mutation) +(\w)+`)
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="AddExternalServiceInput" href="#AddExternalServiceInput">type AddExternalServiceInput struct</a>

```
searchKey: gqltestutil.AddExternalServiceInput
tags: [struct]
```

```Go
type AddExternalServiceInput struct {
	Kind        string `json:"kind"`
	DisplayName string `json:"displayName"`
	Config      string `json:"config"`
}
```

### <a id="AnyResult" href="#AnyResult">type AnyResult struct</a>

```
searchKey: gqltestutil.AnyResult
tags: [struct]
```

```Go
type AnyResult struct {
	Inner interface{}
}
```

#### <a id="AnyResult.UnmarshalJSON" href="#AnyResult.UnmarshalJSON">func (r *AnyResult) UnmarshalJSON(b []byte) error</a>

```
searchKey: gqltestutil.AnyResult.UnmarshalJSON
tags: [method]
```

```Go
func (r *AnyResult) UnmarshalJSON(b []byte) error
```

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: gqltestutil.Client
tags: [struct]
```

```Go
type Client struct {
	baseURL       string
	csrfToken     string
	csrfCookie    *http.Cookie
	sessionCookie *http.Cookie

	userID string
}
```

Client is an authenticated client for a Sourcegraph user for doing e2e testing. The user may or may not be a site admin depends on how the client is instantiated. It works by simulating how the browser would send HTTP requests to the server. 

#### <a id="SignIn" href="#SignIn">func SignIn(baseURL, email, password string) (*Client, error)</a>

```
searchKey: gqltestutil.SignIn
tags: [method]
```

```Go
func SignIn(baseURL, email, password string) (*Client, error)
```

SignIn performs the sign in with given user credentials. It returns an authenticated client as the user for doing testing. 

#### <a id="SignUp" href="#SignUp">func SignUp(baseURL, email, username, password string) (*Client, error)</a>

```
searchKey: gqltestutil.SignUp
tags: [method]
```

```Go
func SignUp(baseURL, email, username, password string) (*Client, error)
```

SignUp signs up a new user with given credentials. It returns an authenticated client as the user for doing testing. 

#### <a id="SiteAdminInit" href="#SiteAdminInit">func SiteAdminInit(baseURL, email, username, password string) (*Client, error)</a>

```
searchKey: gqltestutil.SiteAdminInit
tags: [method]
```

```Go
func SiteAdminInit(baseURL, email, username, password string) (*Client, error)
```

SiteAdminInit initializes the instance with given admin account. It returns an authenticated client as the admin for doing testing. 

#### <a id="authenticate" href="#authenticate">func authenticate(baseURL, path string, body interface{}) (*Client, error)</a>

```
searchKey: gqltestutil.authenticate
tags: [method private]
```

```Go
func authenticate(baseURL, path string, body interface{}) (*Client, error)
```

authenticate initializes an authenticated client with given request body. 

#### <a id="newClient" href="#newClient">func newClient(baseURL string) (*Client, error)</a>

```
searchKey: gqltestutil.newClient
tags: [method private]
```

```Go
func newClient(baseURL string) (*Client, error)
```

newClient instantiates a new client by performing a GET request then obtains the CSRF token and cookie from its response. 

#### <a id="Client.AddExternalService" href="#Client.AddExternalService">func (c *Client) AddExternalService(input AddExternalServiceInput) (string, error)</a>

```
searchKey: gqltestutil.Client.AddExternalService
tags: [method]
```

```Go
func (c *Client) AddExternalService(input AddExternalServiceInput) (string, error)
```

AddExternalService adds a new external service with given input. It returns GraphQL node ID of newly created external service. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.AuthenticatedUserID" href="#Client.AuthenticatedUserID">func (c *Client) AuthenticatedUserID() string</a>

```
searchKey: gqltestutil.Client.AuthenticatedUserID
tags: [function]
```

```Go
func (c *Client) AuthenticatedUserID() string
```

AuthenticatedUserID returns the GraphQL node ID of current authenticated user. 

#### <a id="Client.CreateAccessToken" href="#Client.CreateAccessToken">func (c *Client) CreateAccessToken(note string, scopes []string) (string, error)</a>

```
searchKey: gqltestutil.Client.CreateAccessToken
tags: [method]
```

```Go
func (c *Client) CreateAccessToken(note string, scopes []string) (string, error)
```

CreateAccessToken creates a new access token with given note and scopes for the authenticated user. It returns the new access token created. 

#### <a id="Client.CreateOrganization" href="#Client.CreateOrganization">func (c *Client) CreateOrganization(name, displayName string) (string, error)</a>

```
searchKey: gqltestutil.Client.CreateOrganization
tags: [method]
```

```Go
func (c *Client) CreateOrganization(name, displayName string) (string, error)
```

CreateOrganization creates a new organization with given name and display name. It returns GraphQL node ID of newly created organization. 

#### <a id="Client.CreateSearchContext" href="#Client.CreateSearchContext">func (c *Client) CreateSearchContext(input CreateSearchContextInput, repositories []SearchContextRepositoryRevisionsInput) (string, error)</a>

```
searchKey: gqltestutil.Client.CreateSearchContext
tags: [method]
```

```Go
func (c *Client) CreateSearchContext(input CreateSearchContextInput, repositories []SearchContextRepositoryRevisionsInput) (string, error)
```

CreateSearchContext creates a new search context with the given input and repository revisions to be searched. It returns the GraphQL node ID of the newly created search context. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.CreateUser" href="#Client.CreateUser">func (c *Client) CreateUser(username, email string) (string, error)</a>

```
searchKey: gqltestutil.Client.CreateUser
tags: [method]
```

```Go
func (c *Client) CreateUser(username, email string) (string, error)
```

CreateUser creates a new user with the given username and email. It returns the GraphQL node ID of newly created user. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.CurrentUserID" href="#Client.CurrentUserID">func (c *Client) CurrentUserID(token string) (string, error)</a>

```
searchKey: gqltestutil.Client.CurrentUserID
tags: [method]
```

```Go
func (c *Client) CurrentUserID(token string) (string, error)
```

CurrentUserID returns the current authenticated user's GraphQL node ID. An optional token can be passed to impersonate other users. 

#### <a id="Client.DeleteAccessToken" href="#Client.DeleteAccessToken">func (c *Client) DeleteAccessToken(token string) error</a>

```
searchKey: gqltestutil.Client.DeleteAccessToken
tags: [method]
```

```Go
func (c *Client) DeleteAccessToken(token string) error
```

DeleteAccessToken deletes the given access token of the authenticated user. 

#### <a id="Client.DeleteExternalService" href="#Client.DeleteExternalService">func (c *Client) DeleteExternalService(id string) error</a>

```
searchKey: gqltestutil.Client.DeleteExternalService
tags: [method]
```

```Go
func (c *Client) DeleteExternalService(id string) error
```

DeleteExternalService deletes the external service by given GraphQL node ID. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.DeleteOrganization" href="#Client.DeleteOrganization">func (c *Client) DeleteOrganization(id string) error</a>

```
searchKey: gqltestutil.Client.DeleteOrganization
tags: [method]
```

```Go
func (c *Client) DeleteOrganization(id string) error
```

DeleteOrganization deletes the organization by given GraphQL node ID. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.DeleteSearchContext" href="#Client.DeleteSearchContext">func (c *Client) DeleteSearchContext(id string) error</a>

```
searchKey: gqltestutil.Client.DeleteSearchContext
tags: [method]
```

```Go
func (c *Client) DeleteSearchContext(id string) error
```

DeleteSearchContext deletes a search context with the given id. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.DeleteUser" href="#Client.DeleteUser">func (c *Client) DeleteUser(id string, hard bool) error</a>

```
searchKey: gqltestutil.Client.DeleteUser
tags: [method]
```

```Go
func (c *Client) DeleteUser(id string, hard bool) error
```

DeleteUser deletes a user by given GraphQL node ID. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.FileExternalLinks" href="#Client.FileExternalLinks">func (c *Client) FileExternalLinks(repoName, revision, filePath string) ([]*ExternalLink, error)</a>

```
searchKey: gqltestutil.Client.FileExternalLinks
tags: [method]
```

```Go
func (c *Client) FileExternalLinks(repoName, revision, filePath string) ([]*ExternalLink, error)
```

FileExternalLinks external links for a file or directory in a repository. 

#### <a id="Client.Get" href="#Client.Get">func (c *Client) Get(url string) (*http.Response, error)</a>

```
searchKey: gqltestutil.Client.Get
tags: [method]
```

```Go
func (c *Client) Get(url string) (*http.Response, error)
```

Get performs a GET request to the URL with authenticated user. 

#### <a id="Client.GetSearchContext" href="#Client.GetSearchContext">func (c *Client) GetSearchContext(id string) (*GetSearchContextResult, error)</a>

```
searchKey: gqltestutil.Client.GetSearchContext
tags: [method]
```

```Go
func (c *Client) GetSearchContext(id string) (*GetSearchContextResult, error)
```

#### <a id="Client.GitBlob" href="#Client.GitBlob">func (c *Client) GitBlob(repoName, revision, filePath string) (string, error)</a>

```
searchKey: gqltestutil.Client.GitBlob
tags: [method]
```

```Go
func (c *Client) GitBlob(repoName, revision, filePath string) (string, error)
```

GitBlob returns blob content of the file in given repository at given revision. 

#### <a id="Client.GraphQL" href="#Client.GraphQL">func (c *Client) GraphQL(token, query string, variables map[string]interface{}, target interface{}) error</a>

```
searchKey: gqltestutil.Client.GraphQL
tags: [method]
```

```Go
func (c *Client) GraphQL(token, query string, variables map[string]interface{}, target interface{}) error
```

GraphQL makes a GraphQL request to the server on behalf of the user authenticated by the client. An optional token can be passed to impersonate other users. A nil target will skip unmarshalling the returned JSON response. 

#### <a id="Client.InviteUserToOrganization" href="#Client.InviteUserToOrganization">func (c *Client) InviteUserToOrganization(orgID, username string) (*InviteUserToOrganizationResult, error)</a>

```
searchKey: gqltestutil.Client.InviteUserToOrganization
tags: [method]
```

```Go
func (c *Client) InviteUserToOrganization(orgID, username string) (*InviteUserToOrganizationResult, error)
```

InviteUserToOrganization invites a user to the given organization. 

#### <a id="Client.ListSearchContexts" href="#Client.ListSearchContexts">func (c *Client) ListSearchContexts(options ListSearchContextsOptions) (*ListSearchContextsResult, error)</a>

```
searchKey: gqltestutil.Client.ListSearchContexts
tags: [method]
```

```Go
func (c *Client) ListSearchContexts(options ListSearchContextsOptions) (*ListSearchContextsResult, error)
```

ListSearchContexts list search contexts filtered by the given options. 

#### <a id="Client.Organization" href="#Client.Organization">func (c *Client) Organization(name string) (*Organization, error)</a>

```
searchKey: gqltestutil.Client.Organization
tags: [method]
```

```Go
func (c *Client) Organization(name string) (*Organization, error)
```

Organization returns basic information of the given organization. 

#### <a id="Client.OrganizationMembers" href="#Client.OrganizationMembers">func (c *Client) OrganizationMembers(id string) ([]*OrganizationMember, error)</a>

```
searchKey: gqltestutil.Client.OrganizationMembers
tags: [method]
```

```Go
func (c *Client) OrganizationMembers(id string) ([]*OrganizationMember, error)
```

OrganizationMembers returns a list of members of the given organization. 

#### <a id="Client.OverwriteSettings" href="#Client.OverwriteSettings">func (c *Client) OverwriteSettings(subjectID, contents string) error</a>

```
searchKey: gqltestutil.Client.OverwriteSettings
tags: [method]
```

```Go
func (c *Client) OverwriteSettings(subjectID, contents string) error
```

OverwriteSettings overwrites settings for given subject ID with contents. 

#### <a id="Client.Post" href="#Client.Post">func (c *Client) Post(url string, body io.Reader) (*http.Response, error)</a>

```
searchKey: gqltestutil.Client.Post
tags: [method]
```

```Go
func (c *Client) Post(url string, body io.Reader) (*http.Response, error)
```

Post performs a POST request to the URL with authenticated user. 

#### <a id="Client.RemoveUserFromOrganization" href="#Client.RemoveUserFromOrganization">func (c *Client) RemoveUserFromOrganization(userID, orgID string) error</a>

```
searchKey: gqltestutil.Client.RemoveUserFromOrganization
tags: [method]
```

```Go
func (c *Client) RemoveUserFromOrganization(userID, orgID string) error
```

RemoveUserFromOrganization removes user from given organization. 

#### <a id="Client.Repository" href="#Client.Repository">func (c *Client) Repository(name string) (*Repository, error)</a>

```
searchKey: gqltestutil.Client.Repository
tags: [method]
```

```Go
func (c *Client) Repository(name string) (*Repository, error)
```

Repository returns basic information of the given repository. 

#### <a id="Client.RepositoryPermissionsInfo" href="#Client.RepositoryPermissionsInfo">func (c *Client) RepositoryPermissionsInfo(name string) (*PermissionsInfo, error)</a>

```
searchKey: gqltestutil.Client.RepositoryPermissionsInfo
tags: [method]
```

```Go
func (c *Client) RepositoryPermissionsInfo(name string) (*PermissionsInfo, error)
```

RepositoryPermissionsInfo returns permissions information of the given repository. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.ScheduleRepositoryPermissionsSync" href="#Client.ScheduleRepositoryPermissionsSync">func (c *Client) ScheduleRepositoryPermissionsSync(id string) error</a>

```
searchKey: gqltestutil.Client.ScheduleRepositoryPermissionsSync
tags: [method]
```

```Go
func (c *Client) ScheduleRepositoryPermissionsSync(id string) error
```

ScheduleRepositoryPermissionsSync schedules a permissions syncing request for the given repository. 

#### <a id="Client.SearchAll" href="#Client.SearchAll">func (c *Client) SearchAll(query string) ([]*AnyResult, error)</a>

```
searchKey: gqltestutil.Client.SearchAll
tags: [method]
```

```Go
func (c *Client) SearchAll(query string) ([]*AnyResult, error)
```

SearchAll searches for all matches with a given query corresponding file matches. 

#### <a id="Client.SearchCommits" href="#Client.SearchCommits">func (c *Client) SearchCommits(query string) (*SearchCommitResults, error)</a>

```
searchKey: gqltestutil.Client.SearchCommits
tags: [method]
```

```Go
func (c *Client) SearchCommits(query string) (*SearchCommitResults, error)
```

SearchCommits searches commits with given query. It returns the match count and corresponding file matches. 

#### <a id="Client.SearchFiles" href="#Client.SearchFiles">func (c *Client) SearchFiles(query string) (*SearchFileResults, error)</a>

```
searchKey: gqltestutil.Client.SearchFiles
tags: [method]
```

```Go
func (c *Client) SearchFiles(query string) (*SearchFileResults, error)
```

SearchFiles searches files with given query. It returns the match count and corresponding file matches. Search alert is also included if any. 

#### <a id="Client.SearchRepositories" href="#Client.SearchRepositories">func (c *Client) SearchRepositories(query string) (SearchRepositoryResults, error)</a>

```
searchKey: gqltestutil.Client.SearchRepositories
tags: [method]
```

```Go
func (c *Client) SearchRepositories(query string) (SearchRepositoryResults, error)
```

SearchRepositories search repositories with given query. 

#### <a id="Client.SearchStats" href="#Client.SearchStats">func (c *Client) SearchStats(query string) (*SearchStatsResult, error)</a>

```
searchKey: gqltestutil.Client.SearchStats
tags: [method]
```

```Go
func (c *Client) SearchStats(query string) (*SearchStatsResult, error)
```

SearchStats returns statistics of given query. 

#### <a id="Client.SearchSuggestions" href="#Client.SearchSuggestions">func (c *Client) SearchSuggestions(query string) ([]SearchSuggestionsResult, error)</a>

```
searchKey: gqltestutil.Client.SearchSuggestions
tags: [method]
```

```Go
func (c *Client) SearchSuggestions(query string) ([]SearchSuggestionsResult, error)
```

#### <a id="Client.SettingsCascade" href="#Client.SettingsCascade">func (c *Client) SettingsCascade(subjectID string) ([]*SettingsSubject, error)</a>

```
searchKey: gqltestutil.Client.SettingsCascade
tags: [method]
```

```Go
func (c *Client) SettingsCascade(subjectID string) ([]*SettingsSubject, error)
```

SettingsCascade returns settings of given subject ID with contents. 

#### <a id="Client.SiteConfiguration" href="#Client.SiteConfiguration">func (c *Client) SiteConfiguration() (*schema.SiteConfiguration, error)</a>

```
searchKey: gqltestutil.Client.SiteConfiguration
tags: [function]
```

```Go
func (c *Client) SiteConfiguration() (*schema.SiteConfiguration, error)
```

SiteConfiguration returns current effective site configuration. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.UpdateOrganization" href="#Client.UpdateOrganization">func (c *Client) UpdateOrganization(id, displayName string) error</a>

```
searchKey: gqltestutil.Client.UpdateOrganization
tags: [method]
```

```Go
func (c *Client) UpdateOrganization(id, displayName string) error
```

UpdateOrganization updates display name of the given organization. 

#### <a id="Client.UpdateSearchContext" href="#Client.UpdateSearchContext">func (c *Client) UpdateSearchContext(id string, input UpdateSearchContextInput, repos []SearchContextRepositoryRevisionsInput) (string, error)</a>

```
searchKey: gqltestutil.Client.UpdateSearchContext
tags: [method]
```

```Go
func (c *Client) UpdateSearchContext(id string, input UpdateSearchContextInput, repos []SearchContextRepositoryRevisionsInput) (string, error)
```

#### <a id="Client.UpdateSiteConfiguration" href="#Client.UpdateSiteConfiguration">func (c *Client) UpdateSiteConfiguration(config *schema.SiteConfiguration) error</a>

```
searchKey: gqltestutil.Client.UpdateSiteConfiguration
tags: [method]
```

```Go
func (c *Client) UpdateSiteConfiguration(config *schema.SiteConfiguration) error
```

UpdateSiteConfiguration updates site configuration. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.UserOrganizations" href="#Client.UserOrganizations">func (c *Client) UserOrganizations(username string) ([]string, error)</a>

```
searchKey: gqltestutil.Client.UserOrganizations
tags: [method]
```

```Go
func (c *Client) UserOrganizations(username string) ([]string, error)
```

UserOrganizations returns organizations name the given user belongs to. 

#### <a id="Client.ViewerSettings" href="#Client.ViewerSettings">func (c *Client) ViewerSettings() (string, error)</a>

```
searchKey: gqltestutil.Client.ViewerSettings
tags: [function]
```

```Go
func (c *Client) ViewerSettings() (string, error)
```

ViewerSettings returns the latest cascaded settings of authenticated user. 

#### <a id="Client.WaitForReposToBeCloned" href="#Client.WaitForReposToBeCloned">func (c *Client) WaitForReposToBeCloned(repos ...string) error</a>

```
searchKey: gqltestutil.Client.WaitForReposToBeCloned
tags: [method]
```

```Go
func (c *Client) WaitForReposToBeCloned(repos ...string) error
```

WaitForReposToBeCloned waits (up to two minutes) for all repositories in the list to be cloned. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.WaitForReposToBeIndex" href="#Client.WaitForReposToBeIndex">func (c *Client) WaitForReposToBeIndex(repos ...string) error</a>

```
searchKey: gqltestutil.Client.WaitForReposToBeIndex
tags: [method]
```

```Go
func (c *Client) WaitForReposToBeIndex(repos ...string) error
```

WaitForReposToBeIndex waits (up to 30 seconds) for all repositories in the list to be indexed. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.addCookies" href="#Client.addCookies">func (c *Client) addCookies(req *http.Request)</a>

```
searchKey: gqltestutil.Client.addCookies
tags: [method private]
```

```Go
func (c *Client) addCookies(req *http.Request)
```

#### <a id="Client.authenticate" href="#Client.authenticate">func (c *Client) authenticate(path string, body interface{}) error</a>

```
searchKey: gqltestutil.Client.authenticate
tags: [method private]
```

```Go
func (c *Client) authenticate(path string, body interface{}) error
```

authenticate is used to send a HTTP POST request to an URL that is able to authenticate a user with given body (marshalled to JSON), e.g. site admin init, sign in. Once the client is authenticated, the session cookie will be stored as a proof of authentication. 

#### <a id="Client.lastSettingsID" href="#Client.lastSettingsID">func (c *Client) lastSettingsID(subjectID string) (int, error)</a>

```
searchKey: gqltestutil.Client.lastSettingsID
tags: [method private]
```

```Go
func (c *Client) lastSettingsID(subjectID string) (int, error)
```

lastSettingsID returns the ID of last settings of given subject. It is required to be used to update corresponding settings. 

#### <a id="Client.waitForReposByQuery" href="#Client.waitForReposByQuery">func (c *Client) waitForReposByQuery(query string, repos ...string) ([]string, error)</a>

```
searchKey: gqltestutil.Client.waitForReposByQuery
tags: [method private]
```

```Go
func (c *Client) waitForReposByQuery(query string, repos ...string) ([]string, error)
```

### <a id="CommitResult" href="#CommitResult">type CommitResult struct</a>

```
searchKey: gqltestutil.CommitResult
tags: [struct]
```

```Go
type CommitResult struct {
	URL string
}
```

### <a id="CreateSearchContextInput" href="#CreateSearchContextInput">type CreateSearchContextInput struct</a>

```
searchKey: gqltestutil.CreateSearchContextInput
tags: [struct]
```

```Go
type CreateSearchContextInput struct {
	Name        string `json:"name"`
	Description string `json:"description"`
	Public      bool   `json:"public"`
}
```

### <a id="ExternalLink" href="#ExternalLink">type ExternalLink struct</a>

```
searchKey: gqltestutil.ExternalLink
tags: [struct]
```

```Go
type ExternalLink struct {
	URL         string `json:"url"`         // The URL to the resource
	ServiceKind string `json:"serviceKind"` // The kind of service that the URL points to
	ServiceType string `json:"serviceType"` // The type of service that the URL points to
}
```

ExternalLink is a link to an external service. 

### <a id="FileResult" href="#FileResult">type FileResult struct</a>

```
searchKey: gqltestutil.FileResult
tags: [struct]
```

```Go
type FileResult struct {
	File struct {
		Path string
	} `json:"file"`
	Repository  RepositoryResult
	LineMatches []struct {
		OffsetAndLengths [][2]int32 `json:"offsetAndLengths"`
	} `json:"lineMatches"`
	Symbols []interface{} `json:"symbols"`
}
```

### <a id="FileSuggestionResult" href="#FileSuggestionResult">type FileSuggestionResult struct</a>

```
searchKey: gqltestutil.FileSuggestionResult
tags: [struct]
```

```Go
type FileSuggestionResult struct {
	Path        string
	Name        string
	IsDirectory bool   `json:"isDirectory"`
	URL         string `json:"url"`
	Repository  struct {
		Name string
	}
}
```

### <a id="GetSearchContextResult" href="#GetSearchContextResult">type GetSearchContextResult struct</a>

```
searchKey: gqltestutil.GetSearchContextResult
tags: [struct]
```

```Go
type GetSearchContextResult struct {
	ID           string `json:"id"`
	Description  string `json:"description"`
	Spec         string `json:"spec"`
	AutoDefined  bool   `json:"autoDefined"`
	Repositories []struct {
		Repository struct {
			Name string `json:"name"`
		} `json:"repository"`
		Revisions []string `json:"revisions"`
	} `json:"repositories"`
}
```

### <a id="InviteUserToOrganizationResult" href="#InviteUserToOrganizationResult">type InviteUserToOrganizationResult struct</a>

```
searchKey: gqltestutil.InviteUserToOrganizationResult
tags: [struct]
```

```Go
type InviteUserToOrganizationResult struct {
	SentInvitationEmail bool   `json:"sentInvitationEmail"`
	InvitationURL       string `json:"invitationURL"`
}
```

InviteUserToOrganizationResult contains information of a user invitation to an organization. 

### <a id="LanguageSuggestionResult" href="#LanguageSuggestionResult">type LanguageSuggestionResult struct</a>

```
searchKey: gqltestutil.LanguageSuggestionResult
tags: [struct]
```

```Go
type LanguageSuggestionResult struct {
	Name string
}
```

### <a id="ListSearchContextsOptions" href="#ListSearchContextsOptions">type ListSearchContextsOptions struct</a>

```
searchKey: gqltestutil.ListSearchContextsOptions
tags: [struct]
```

```Go
type ListSearchContextsOptions struct {
	First      int32                  `json:"first"`
	After      *string                `json:"after"`
	Query      *string                `json:"query"`
	Namespaces []*string              `json:"namespaces"`
	OrderBy    *SearchContextsOrderBy `json:"orderBy"`
	Descending bool                   `json:"descending"`
}
```

### <a id="ListSearchContextsResult" href="#ListSearchContextsResult">type ListSearchContextsResult struct</a>

```
searchKey: gqltestutil.ListSearchContextsResult
tags: [struct]
```

```Go
type ListSearchContextsResult struct {
	TotalCount int32 `json:"totalCount"`
	PageInfo   struct {
		HasNextPage bool    `json:"hasNextPage"`
		EndCursor   *string `json:"endCursor"`
	} `json:"pageInfo"`
	Nodes []GetSearchContextResult `json:"nodes"`
}
```

### <a id="Organization" href="#Organization">type Organization struct</a>

```
searchKey: gqltestutil.Organization
tags: [struct]
```

```Go
type Organization struct {
	ID             string `json:"id"`
	ViewerIsMember bool   `json:"viewerIsMember"`
}
```

Organization contains basic information of an organization. 

### <a id="OrganizationMember" href="#OrganizationMember">type OrganizationMember struct</a>

```
searchKey: gqltestutil.OrganizationMember
tags: [struct]
```

```Go
type OrganizationMember struct {
	ID       string `json:"id"`
	Username string `json:"username"`
}
```

OrganizationMember contains basic information of an organization member. 

### <a id="PermissionsInfo" href="#PermissionsInfo">type PermissionsInfo struct</a>

```
searchKey: gqltestutil.PermissionsInfo
tags: [struct]
```

```Go
type PermissionsInfo struct {
	SyncedAt time.Time
}
```

PermissionsInfo contains permissions information of a repository from GraphQL. 

### <a id="ProposedQuery" href="#ProposedQuery">type ProposedQuery struct</a>

```
searchKey: gqltestutil.ProposedQuery
tags: [struct]
```

```Go
type ProposedQuery struct {
	Description string `json:"description"`
	Query       string `json:"query"`
}
```

### <a id="Repository" href="#Repository">type Repository struct</a>

```
searchKey: gqltestutil.Repository
tags: [struct]
```

```Go
type Repository struct {
	ID  string `json:"id"`
	URL string `json:"url"`
}
```

Repository contains basic information of a repository from GraphQL. 

### <a id="RepositoryResult" href="#RepositoryResult">type RepositoryResult struct</a>

```
searchKey: gqltestutil.RepositoryResult
tags: [struct]
```

```Go
type RepositoryResult struct {
	Name string
}
```

### <a id="RepositorySuggestionResult" href="#RepositorySuggestionResult">type RepositorySuggestionResult struct</a>

```
searchKey: gqltestutil.RepositorySuggestionResult
tags: [struct]
```

```Go
type RepositorySuggestionResult struct {
	Name string
}
```

### <a id="SearchAlert" href="#SearchAlert">type SearchAlert struct</a>

```
searchKey: gqltestutil.SearchAlert
tags: [struct]
```

```Go
type SearchAlert struct {
	Title           string          `json:"title"`
	Description     string          `json:"description"`
	ProposedQueries []ProposedQuery `json:"proposedQueries"`
}
```

SearchAlert is an alert specific to searches (i.e. not site alert). 

### <a id="SearchCommitResults" href="#SearchCommitResults">type SearchCommitResults struct</a>

```
searchKey: gqltestutil.SearchCommitResults
tags: [struct]
```

```Go
type SearchCommitResults struct {
	MatchCount int64 `json:"matchCount"`
	Results    []*struct {
		URL string `json:"url"`
	} `json:"results"`
}
```

### <a id="SearchContextRepositoryRevisionsInput" href="#SearchContextRepositoryRevisionsInput">type SearchContextRepositoryRevisionsInput struct</a>

```
searchKey: gqltestutil.SearchContextRepositoryRevisionsInput
tags: [struct]
```

```Go
type SearchContextRepositoryRevisionsInput struct {
	RepositoryID string   `json:"repositoryID"`
	Revisions    []string `json:"revisions"`
}
```

### <a id="SearchContextSuggestionResult" href="#SearchContextSuggestionResult">type SearchContextSuggestionResult struct</a>

```
searchKey: gqltestutil.SearchContextSuggestionResult
tags: [struct]
```

```Go
type SearchContextSuggestionResult struct {
	Spec        string `json:"spec"`
	Description string `json:"description"`
}
```

### <a id="SearchContextsOrderBy" href="#SearchContextsOrderBy">type SearchContextsOrderBy string</a>

```
searchKey: gqltestutil.SearchContextsOrderBy
tags: [string]
```

```Go
type SearchContextsOrderBy string
```

### <a id="SearchFileResult" href="#SearchFileResult">type SearchFileResult struct</a>

```
searchKey: gqltestutil.SearchFileResult
tags: [struct]
```

```Go
type SearchFileResult struct {
	File struct {
		Name string `json:"name"`
	} `json:"file"`
	Repository struct {
		Name string `json:"name"`
	} `json:"repository"`
	RevSpec struct {
		Expr string `json:"expr"`
	} `json:"revSpec"`
}
```

### <a id="SearchFileResults" href="#SearchFileResults">type SearchFileResults struct</a>

```
searchKey: gqltestutil.SearchFileResults
tags: [struct]
```

```Go
type SearchFileResults struct {
	MatchCount int64               `json:"matchCount"`
	Alert      *SearchAlert        `json:"alert"`
	Results    []*SearchFileResult `json:"results"`
}
```

### <a id="SearchRepositoryResult" href="#SearchRepositoryResult">type SearchRepositoryResult struct</a>

```
searchKey: gqltestutil.SearchRepositoryResult
tags: [struct]
```

```Go
type SearchRepositoryResult struct {
	Name string `json:"name"`
}
```

### <a id="SearchRepositoryResults" href="#SearchRepositoryResults">type SearchRepositoryResults []*gqltestutil.SearchRepositoryResult</a>

```
searchKey: gqltestutil.SearchRepositoryResults
tags: [array struct]
```

```Go
type SearchRepositoryResults []*SearchRepositoryResult
```

#### <a id="SearchRepositoryResults.Exists" href="#SearchRepositoryResults.Exists">func (rs SearchRepositoryResults) Exists(names ...string) []string</a>

```
searchKey: gqltestutil.SearchRepositoryResults.Exists
tags: [method]
```

```Go
func (rs SearchRepositoryResults) Exists(names ...string) []string
```

Exists returns the list of missing repositories from given names that do not exist in search results. If all of given names are found, it returns empty list. 

#### <a id="SearchRepositoryResults.String" href="#SearchRepositoryResults.String">func (rs SearchRepositoryResults) String() string</a>

```
searchKey: gqltestutil.SearchRepositoryResults.String
tags: [function]
```

```Go
func (rs SearchRepositoryResults) String() string
```

### <a id="SearchStatsResult" href="#SearchStatsResult">type SearchStatsResult struct</a>

```
searchKey: gqltestutil.SearchStatsResult
tags: [struct]
```

```Go
type SearchStatsResult struct {
	Languages []struct {
		Name       string `json:"name"`
		TotalLines int    `json:"totalLines"`
	} `json:"languages"`
}
```

### <a id="SearchStreamClient" href="#SearchStreamClient">type SearchStreamClient struct</a>

```
searchKey: gqltestutil.SearchStreamClient
tags: [struct]
```

```Go
type SearchStreamClient struct {
	Client *Client
}
```

#### <a id="SearchStreamClient.AuthenticatedUserID" href="#SearchStreamClient.AuthenticatedUserID">func (s *SearchStreamClient) AuthenticatedUserID() string</a>

```
searchKey: gqltestutil.SearchStreamClient.AuthenticatedUserID
tags: [function]
```

```Go
func (s *SearchStreamClient) AuthenticatedUserID() string
```

#### <a id="SearchStreamClient.OverwriteSettings" href="#SearchStreamClient.OverwriteSettings">func (s *SearchStreamClient) OverwriteSettings(subjectID, contents string) error</a>

```
searchKey: gqltestutil.SearchStreamClient.OverwriteSettings
tags: [method]
```

```Go
func (s *SearchStreamClient) OverwriteSettings(subjectID, contents string) error
```

#### <a id="SearchStreamClient.SearchAll" href="#SearchStreamClient.SearchAll">func (s *SearchStreamClient) SearchAll(query string) ([]*AnyResult, error)</a>

```
searchKey: gqltestutil.SearchStreamClient.SearchAll
tags: [method]
```

```Go
func (s *SearchStreamClient) SearchAll(query string) ([]*AnyResult, error)
```

#### <a id="SearchStreamClient.SearchFiles" href="#SearchStreamClient.SearchFiles">func (s *SearchStreamClient) SearchFiles(query string) (*SearchFileResults, error)</a>

```
searchKey: gqltestutil.SearchStreamClient.SearchFiles
tags: [method]
```

```Go
func (s *SearchStreamClient) SearchFiles(query string) (*SearchFileResults, error)
```

#### <a id="SearchStreamClient.SearchRepositories" href="#SearchStreamClient.SearchRepositories">func (s *SearchStreamClient) SearchRepositories(query string) (SearchRepositoryResults, error)</a>

```
searchKey: gqltestutil.SearchStreamClient.SearchRepositories
tags: [method]
```

```Go
func (s *SearchStreamClient) SearchRepositories(query string) (SearchRepositoryResults, error)
```

#### <a id="SearchStreamClient.search" href="#SearchStreamClient.search">func (s *SearchStreamClient) search(query string, dec streamhttp.Decoder) error</a>

```
searchKey: gqltestutil.SearchStreamClient.search
tags: [method private]
```

```Go
func (s *SearchStreamClient) search(query string, dec streamhttp.Decoder) error
```

### <a id="SearchSuggestionsResult" href="#SearchSuggestionsResult">type SearchSuggestionsResult struct</a>

```
searchKey: gqltestutil.SearchSuggestionsResult
tags: [struct]
```

```Go
type SearchSuggestionsResult struct {
	inner interface{}
}
```

#### <a id="SearchSuggestionsResult.UnmarshalJSON" href="#SearchSuggestionsResult.UnmarshalJSON">func (srr *SearchSuggestionsResult) UnmarshalJSON(data []byte) error</a>

```
searchKey: gqltestutil.SearchSuggestionsResult.UnmarshalJSON
tags: [method]
```

```Go
func (srr *SearchSuggestionsResult) UnmarshalJSON(data []byte) error
```

### <a id="SettingsSubject" href="#SettingsSubject">type SettingsSubject struct</a>

```
searchKey: gqltestutil.SettingsSubject
tags: [struct]
```

```Go
type SettingsSubject struct {
	ID       int64  `json:"id"`
	Contents string `json:"contents"`
}
```

SettingsSubject contains contents of a setting. 

### <a id="SymbolSuggestionResult" href="#SymbolSuggestionResult">type SymbolSuggestionResult struct</a>

```
searchKey: gqltestutil.SymbolSuggestionResult
tags: [struct]
```

```Go
type SymbolSuggestionResult struct {
	Name          string
	ContainerName string `json:"containerName"`
	URL           string `json:"url"`
	Kind          string
	Location      struct {
		Resource struct {
			Path       string
			Repository struct {
				Name string
			}
		}
	}
}
```

### <a id="UpdateSearchContextInput" href="#UpdateSearchContextInput">type UpdateSearchContextInput struct</a>

```
searchKey: gqltestutil.UpdateSearchContextInput
tags: [struct]
```

```Go
type UpdateSearchContextInput struct {
	Name        string `json:"name"`
	Description string `json:"description"`
	Public      bool   `json:"public"`
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="NeedsSiteInit" href="#NeedsSiteInit">func NeedsSiteInit(baseURL string) (bool, error)</a>

```
searchKey: gqltestutil.NeedsSiteInit
tags: [method]
```

```Go
func NeedsSiteInit(baseURL string) (bool, error)
```

NeedsSiteInit returns true if the instance hasn't done "Site admin init" step. 

### <a id="Retry" href="#Retry">func Retry(timeout time.Duration, fn func() error) error</a>

```
searchKey: gqltestutil.Retry
tags: [method]
```

```Go
func Retry(timeout time.Duration, fn func() error) error
```

Retry retries the given function until the timeout is reached. The function should return ErrContinueRetry to indicate another retry. 

### <a id="extractCSRFToken" href="#extractCSRFToken">func extractCSRFToken(body string) string</a>

```
searchKey: gqltestutil.extractCSRFToken
tags: [method private]
```

```Go
func extractCSRFToken(body string) string
```

extractCSRFToken extracts CSRF token from HTML response body. 

