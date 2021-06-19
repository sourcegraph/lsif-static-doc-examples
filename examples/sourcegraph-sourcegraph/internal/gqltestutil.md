# Package gqltestutil

## Index

* [Constants](#const)
    * [const SearchContextsOrderByUpdatedAt](#SearchContextsOrderByUpdatedAt)
    * [const SearchContextsOrderBySpec](#SearchContextsOrderBySpec)
* [Variables](#var)
    * [var graphqlQueryNameRe](#graphqlQueryNameRe)
    * [var ErrContinueRetry](#ErrContinueRetry)
* [Types](#type)
    * [type Client struct](#Client)
        * [func SiteAdminInit(baseURL, email, username, password string) (*Client, error)](#SiteAdminInit)
        * [func SignUp(baseURL, email, username, password string) (*Client, error)](#SignUp)
        * [func SignIn(baseURL, email, password string) (*Client, error)](#SignIn)
        * [func authenticate(baseURL, path string, body interface{}) (*Client, error)](#authenticate)
        * [func newClient(baseURL string) (*Client, error)](#newClient)
        * [func (c *Client) CreateAccessToken(note string, scopes []string) (string, error)](#Client.CreateAccessToken)
        * [func (c *Client) DeleteAccessToken(token string) error](#Client.DeleteAccessToken)
        * [func (c *Client) authenticate(path string, body interface{}) error](#Client.authenticate)
        * [func (c *Client) CurrentUserID(token string) (string, error)](#Client.CurrentUserID)
        * [func (c *Client) AuthenticatedUserID() string](#Client.AuthenticatedUserID)
        * [func (c *Client) GraphQL(token, query string, variables map[string]interface{}, target interface{}) error](#Client.GraphQL)
        * [func (c *Client) Get(url string) (*http.Response, error)](#Client.Get)
        * [func (c *Client) Post(url string, body io.Reader) (*http.Response, error)](#Client.Post)
        * [func (c *Client) addCookies(req *http.Request)](#Client.addCookies)
        * [func (c *Client) AddExternalService(input AddExternalServiceInput) (string, error)](#Client.AddExternalService)
        * [func (c *Client) DeleteExternalService(id string) error](#Client.DeleteExternalService)
        * [func (c *Client) GitBlob(repoName, revision, filePath string) (string, error)](#Client.GitBlob)
        * [func (c *Client) Organization(name string) (*Organization, error)](#Client.Organization)
        * [func (c *Client) OrganizationMembers(id string) ([]*OrganizationMember, error)](#Client.OrganizationMembers)
        * [func (c *Client) InviteUserToOrganization(orgID, username string) (*InviteUserToOrganizationResult, error)](#Client.InviteUserToOrganization)
        * [func (c *Client) CreateOrganization(name, displayName string) (string, error)](#Client.CreateOrganization)
        * [func (c *Client) UpdateOrganization(id, displayName string) error](#Client.UpdateOrganization)
        * [func (c *Client) DeleteOrganization(id string) error](#Client.DeleteOrganization)
        * [func (c *Client) RemoveUserFromOrganization(userID, orgID string) error](#Client.RemoveUserFromOrganization)
        * [func (c *Client) ScheduleRepositoryPermissionsSync(id string) error](#Client.ScheduleRepositoryPermissionsSync)
        * [func (c *Client) WaitForReposToBeCloned(repos ...string) error](#Client.WaitForReposToBeCloned)
        * [func (c *Client) WaitForReposToBeIndex(repos ...string) error](#Client.WaitForReposToBeIndex)
        * [func (c *Client) waitForReposByQuery(query string, repos ...string) ([]string, error)](#Client.waitForReposByQuery)
        * [func (c *Client) FileExternalLinks(repoName, revision, filePath string) ([]*ExternalLink, error)](#Client.FileExternalLinks)
        * [func (c *Client) Repository(name string) (*Repository, error)](#Client.Repository)
        * [func (c *Client) RepositoryPermissionsInfo(name string) (*PermissionsInfo, error)](#Client.RepositoryPermissionsInfo)
        * [func (c *Client) SearchRepositories(query string) (SearchRepositoryResults, error)](#Client.SearchRepositories)
        * [func (c *Client) SearchFiles(query string) (*SearchFileResults, error)](#Client.SearchFiles)
        * [func (c *Client) SearchCommits(query string) (*SearchCommitResults, error)](#Client.SearchCommits)
        * [func (c *Client) SearchAll(query string) ([]*AnyResult, error)](#Client.SearchAll)
        * [func (c *Client) SearchStats(query string) (*SearchStatsResult, error)](#Client.SearchStats)
        * [func (c *Client) SearchSuggestions(query string) ([]SearchSuggestionsResult, error)](#Client.SearchSuggestions)
        * [func (c *Client) CreateSearchContext(input CreateSearchContextInput, repositories []SearchContextRepositoryRevisionsInput) (string, error)](#Client.CreateSearchContext)
        * [func (c *Client) GetSearchContext(id string) (*GetSearchContextResult, error)](#Client.GetSearchContext)
        * [func (c *Client) UpdateSearchContext(id string, input UpdateSearchContextInput, repos []SearchContextRepositoryRevisionsInput) (string, error)](#Client.UpdateSearchContext)
        * [func (c *Client) DeleteSearchContext(id string) error](#Client.DeleteSearchContext)
        * [func (c *Client) ListSearchContexts(options ListSearchContextsOptions) (*ListSearchContextsResult, error)](#Client.ListSearchContexts)
        * [func (c *Client) SettingsCascade(subjectID string) ([]*SettingsSubject, error)](#Client.SettingsCascade)
        * [func (c *Client) OverwriteSettings(subjectID, contents string) error](#Client.OverwriteSettings)
        * [func (c *Client) lastSettingsID(subjectID string) (int, error)](#Client.lastSettingsID)
        * [func (c *Client) ViewerSettings() (string, error)](#Client.ViewerSettings)
        * [func (c *Client) SiteConfiguration() (*schema.SiteConfiguration, error)](#Client.SiteConfiguration)
        * [func (c *Client) UpdateSiteConfiguration(config *schema.SiteConfiguration) error](#Client.UpdateSiteConfiguration)
        * [func (c *Client) CreateUser(username, email string) (string, error)](#Client.CreateUser)
        * [func (c *Client) DeleteUser(id string, hard bool) error](#Client.DeleteUser)
        * [func (c *Client) UserOrganizations(username string) ([]string, error)](#Client.UserOrganizations)
    * [type AddExternalServiceInput struct](#AddExternalServiceInput)
    * [type Organization struct](#Organization)
    * [type OrganizationMember struct](#OrganizationMember)
    * [type InviteUserToOrganizationResult struct](#InviteUserToOrganizationResult)
    * [type ExternalLink struct](#ExternalLink)
    * [type Repository struct](#Repository)
    * [type PermissionsInfo struct](#PermissionsInfo)
    * [type SearchRepositoryResult struct](#SearchRepositoryResult)
    * [type SearchRepositoryResults []*gqltestutil.SearchRepositoryResult](#SearchRepositoryResults)
        * [func (rs SearchRepositoryResults) Exists(names ...string) []string](#SearchRepositoryResults.Exists)
        * [func (rs SearchRepositoryResults) String() string](#SearchRepositoryResults.String)
    * [type SearchFileResults struct](#SearchFileResults)
    * [type SearchFileResult struct](#SearchFileResult)
    * [type ProposedQuery struct](#ProposedQuery)
    * [type SearchAlert struct](#SearchAlert)
    * [type SearchCommitResults struct](#SearchCommitResults)
    * [type AnyResult struct](#AnyResult)
        * [func (r *AnyResult) UnmarshalJSON(b []byte) error](#AnyResult.UnmarshalJSON)
    * [type FileResult struct](#FileResult)
    * [type CommitResult struct](#CommitResult)
    * [type RepositoryResult struct](#RepositoryResult)
    * [type SearchStatsResult struct](#SearchStatsResult)
    * [type SearchSuggestionsResult struct](#SearchSuggestionsResult)
        * [func (srr *SearchSuggestionsResult) UnmarshalJSON(data []byte) error](#SearchSuggestionsResult.UnmarshalJSON)
    * [type RepositorySuggestionResult struct](#RepositorySuggestionResult)
    * [type FileSuggestionResult struct](#FileSuggestionResult)
    * [type SymbolSuggestionResult struct](#SymbolSuggestionResult)
    * [type LanguageSuggestionResult struct](#LanguageSuggestionResult)
    * [type SearchContextSuggestionResult struct](#SearchContextSuggestionResult)
    * [type SearchStreamClient struct](#SearchStreamClient)
        * [func (s *SearchStreamClient) SearchRepositories(query string) (SearchRepositoryResults, error)](#SearchStreamClient.SearchRepositories)
        * [func (s *SearchStreamClient) SearchFiles(query string) (*SearchFileResults, error)](#SearchStreamClient.SearchFiles)
        * [func (s *SearchStreamClient) SearchAll(query string) ([]*AnyResult, error)](#SearchStreamClient.SearchAll)
        * [func (s *SearchStreamClient) OverwriteSettings(subjectID, contents string) error](#SearchStreamClient.OverwriteSettings)
        * [func (s *SearchStreamClient) AuthenticatedUserID() string](#SearchStreamClient.AuthenticatedUserID)
        * [func (s *SearchStreamClient) search(query string, dec streamhttp.Decoder) error](#SearchStreamClient.search)
    * [type CreateSearchContextInput struct](#CreateSearchContextInput)
    * [type UpdateSearchContextInput struct](#UpdateSearchContextInput)
    * [type SearchContextRepositoryRevisionsInput struct](#SearchContextRepositoryRevisionsInput)
    * [type GetSearchContextResult struct](#GetSearchContextResult)
    * [type SearchContextsOrderBy string](#SearchContextsOrderBy)
    * [type ListSearchContextsOptions struct](#ListSearchContextsOptions)
    * [type ListSearchContextsResult struct](#ListSearchContextsResult)
    * [type SettingsSubject struct](#SettingsSubject)
* [Functions](#func)
    * [func NeedsSiteInit(baseURL string) (bool, error)](#NeedsSiteInit)
    * [func extractCSRFToken(body string) string](#extractCSRFToken)
    * [func Retry(timeout time.Duration, fn func() error) error](#Retry)


## <a id="const" href="#const">Constants</a>

### <a id="SearchContextsOrderByUpdatedAt" href="#SearchContextsOrderByUpdatedAt">const SearchContextsOrderByUpdatedAt</a>

```
searchKey: gqltestutil.SearchContextsOrderByUpdatedAt
tags: [exported]
```

```Go
const SearchContextsOrderByUpdatedAt SearchContextsOrderBy = "SEARCH_CONTEXT_UPDATED_AT"
```

### <a id="SearchContextsOrderBySpec" href="#SearchContextsOrderBySpec">const SearchContextsOrderBySpec</a>

```
searchKey: gqltestutil.SearchContextsOrderBySpec
tags: [exported]
```

```Go
const SearchContextsOrderBySpec SearchContextsOrderBy = "SEARCH_CONTEXT_SPEC"
```

## <a id="var" href="#var">Variables</a>

### <a id="graphqlQueryNameRe" href="#graphqlQueryNameRe">var graphqlQueryNameRe</a>

```
searchKey: gqltestutil.graphqlQueryNameRe
```

```Go
var graphqlQueryNameRe = lazyregexp.New(`(query|mutation) +(\w)+`)
```

### <a id="ErrContinueRetry" href="#ErrContinueRetry">var ErrContinueRetry</a>

```
searchKey: gqltestutil.ErrContinueRetry
tags: [exported]
```

```Go
var ErrContinueRetry = errors.New("continue Retry")
```

## <a id="type" href="#type">Types</a>

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: gqltestutil.Client
tags: [exported]
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

#### <a id="SiteAdminInit" href="#SiteAdminInit">func SiteAdminInit(baseURL, email, username, password string) (*Client, error)</a>

```
searchKey: gqltestutil.SiteAdminInit
tags: [exported]
```

```Go
func SiteAdminInit(baseURL, email, username, password string) (*Client, error)
```

SiteAdminInit initializes the instance with given admin account. It returns an authenticated client as the admin for doing testing. 

#### <a id="SignUp" href="#SignUp">func SignUp(baseURL, email, username, password string) (*Client, error)</a>

```
searchKey: gqltestutil.SignUp
tags: [exported]
```

```Go
func SignUp(baseURL, email, username, password string) (*Client, error)
```

SignUp signs up a new user with given credentials. It returns an authenticated client as the user for doing testing. 

#### <a id="SignIn" href="#SignIn">func SignIn(baseURL, email, password string) (*Client, error)</a>

```
searchKey: gqltestutil.SignIn
tags: [exported]
```

```Go
func SignIn(baseURL, email, password string) (*Client, error)
```

SignIn performs the sign in with given user credentials. It returns an authenticated client as the user for doing testing. 

#### <a id="authenticate" href="#authenticate">func authenticate(baseURL, path string, body interface{}) (*Client, error)</a>

```
searchKey: gqltestutil.authenticate
```

```Go
func authenticate(baseURL, path string, body interface{}) (*Client, error)
```

authenticate initializes an authenticated client with given request body. 

#### <a id="newClient" href="#newClient">func newClient(baseURL string) (*Client, error)</a>

```
searchKey: gqltestutil.newClient
```

```Go
func newClient(baseURL string) (*Client, error)
```

newClient instantiates a new client by performing a GET request then obtains the CSRF token and cookie from its response. 

#### <a id="Client.CreateAccessToken" href="#Client.CreateAccessToken">func (c *Client) CreateAccessToken(note string, scopes []string) (string, error)</a>

```
searchKey: gqltestutil.Client.CreateAccessToken
tags: [exported]
```

```Go
func (c *Client) CreateAccessToken(note string, scopes []string) (string, error)
```

CreateAccessToken creates a new access token with given note and scopes for the authenticated user. It returns the new access token created. 

#### <a id="Client.DeleteAccessToken" href="#Client.DeleteAccessToken">func (c *Client) DeleteAccessToken(token string) error</a>

```
searchKey: gqltestutil.Client.DeleteAccessToken
tags: [exported]
```

```Go
func (c *Client) DeleteAccessToken(token string) error
```

DeleteAccessToken deletes the given access token of the authenticated user. 

#### <a id="Client.authenticate" href="#Client.authenticate">func (c *Client) authenticate(path string, body interface{}) error</a>

```
searchKey: gqltestutil.Client.authenticate
```

```Go
func (c *Client) authenticate(path string, body interface{}) error
```

authenticate is used to send a HTTP POST request to an URL that is able to authenticate a user with given body (marshalled to JSON), e.g. site admin init, sign in. Once the client is authenticated, the session cookie will be stored as a proof of authentication. 

#### <a id="Client.CurrentUserID" href="#Client.CurrentUserID">func (c *Client) CurrentUserID(token string) (string, error)</a>

```
searchKey: gqltestutil.Client.CurrentUserID
tags: [exported]
```

```Go
func (c *Client) CurrentUserID(token string) (string, error)
```

CurrentUserID returns the current authenticated user's GraphQL node ID. An optional token can be passed to impersonate other users. 

#### <a id="Client.AuthenticatedUserID" href="#Client.AuthenticatedUserID">func (c *Client) AuthenticatedUserID() string</a>

```
searchKey: gqltestutil.Client.AuthenticatedUserID
tags: [exported]
```

```Go
func (c *Client) AuthenticatedUserID() string
```

AuthenticatedUserID returns the GraphQL node ID of current authenticated user. 

#### <a id="Client.GraphQL" href="#Client.GraphQL">func (c *Client) GraphQL(token, query string, variables map[string]interface{}, target interface{}) error</a>

```
searchKey: gqltestutil.Client.GraphQL
tags: [exported]
```

```Go
func (c *Client) GraphQL(token, query string, variables map[string]interface{}, target interface{}) error
```

GraphQL makes a GraphQL request to the server on behalf of the user authenticated by the client. An optional token can be passed to impersonate other users. A nil target will skip unmarshalling the returned JSON response. 

#### <a id="Client.Get" href="#Client.Get">func (c *Client) Get(url string) (*http.Response, error)</a>

```
searchKey: gqltestutil.Client.Get
tags: [exported]
```

```Go
func (c *Client) Get(url string) (*http.Response, error)
```

Get performs a GET request to the URL with authenticated user. 

#### <a id="Client.Post" href="#Client.Post">func (c *Client) Post(url string, body io.Reader) (*http.Response, error)</a>

```
searchKey: gqltestutil.Client.Post
tags: [exported]
```

```Go
func (c *Client) Post(url string, body io.Reader) (*http.Response, error)
```

Post performs a POST request to the URL with authenticated user. 

#### <a id="Client.addCookies" href="#Client.addCookies">func (c *Client) addCookies(req *http.Request)</a>

```
searchKey: gqltestutil.Client.addCookies
```

```Go
func (c *Client) addCookies(req *http.Request)
```

#### <a id="Client.AddExternalService" href="#Client.AddExternalService">func (c *Client) AddExternalService(input AddExternalServiceInput) (string, error)</a>

```
searchKey: gqltestutil.Client.AddExternalService
tags: [exported]
```

```Go
func (c *Client) AddExternalService(input AddExternalServiceInput) (string, error)
```

AddExternalService adds a new external service with given input. It returns GraphQL node ID of newly created external service. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.DeleteExternalService" href="#Client.DeleteExternalService">func (c *Client) DeleteExternalService(id string) error</a>

```
searchKey: gqltestutil.Client.DeleteExternalService
tags: [exported]
```

```Go
func (c *Client) DeleteExternalService(id string) error
```

DeleteExternalService deletes the external service by given GraphQL node ID. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.GitBlob" href="#Client.GitBlob">func (c *Client) GitBlob(repoName, revision, filePath string) (string, error)</a>

```
searchKey: gqltestutil.Client.GitBlob
tags: [exported]
```

```Go
func (c *Client) GitBlob(repoName, revision, filePath string) (string, error)
```

GitBlob returns blob content of the file in given repository at given revision. 

#### <a id="Client.Organization" href="#Client.Organization">func (c *Client) Organization(name string) (*Organization, error)</a>

```
searchKey: gqltestutil.Client.Organization
tags: [exported]
```

```Go
func (c *Client) Organization(name string) (*Organization, error)
```

Organization returns basic information of the given organization. 

#### <a id="Client.OrganizationMembers" href="#Client.OrganizationMembers">func (c *Client) OrganizationMembers(id string) ([]*OrganizationMember, error)</a>

```
searchKey: gqltestutil.Client.OrganizationMembers
tags: [exported]
```

```Go
func (c *Client) OrganizationMembers(id string) ([]*OrganizationMember, error)
```

OrganizationMembers returns a list of members of the given organization. 

#### <a id="Client.InviteUserToOrganization" href="#Client.InviteUserToOrganization">func (c *Client) InviteUserToOrganization(orgID, username string) (*InviteUserToOrganizationResult, error)</a>

```
searchKey: gqltestutil.Client.InviteUserToOrganization
tags: [exported]
```

```Go
func (c *Client) InviteUserToOrganization(orgID, username string) (*InviteUserToOrganizationResult, error)
```

InviteUserToOrganization invites a user to the given organization. 

#### <a id="Client.CreateOrganization" href="#Client.CreateOrganization">func (c *Client) CreateOrganization(name, displayName string) (string, error)</a>

```
searchKey: gqltestutil.Client.CreateOrganization
tags: [exported]
```

```Go
func (c *Client) CreateOrganization(name, displayName string) (string, error)
```

CreateOrganization creates a new organization with given name and display name. It returns GraphQL node ID of newly created organization. 

#### <a id="Client.UpdateOrganization" href="#Client.UpdateOrganization">func (c *Client) UpdateOrganization(id, displayName string) error</a>

```
searchKey: gqltestutil.Client.UpdateOrganization
tags: [exported]
```

```Go
func (c *Client) UpdateOrganization(id, displayName string) error
```

UpdateOrganization updates display name of the given organization. 

#### <a id="Client.DeleteOrganization" href="#Client.DeleteOrganization">func (c *Client) DeleteOrganization(id string) error</a>

```
searchKey: gqltestutil.Client.DeleteOrganization
tags: [exported]
```

```Go
func (c *Client) DeleteOrganization(id string) error
```

DeleteOrganization deletes the organization by given GraphQL node ID. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.RemoveUserFromOrganization" href="#Client.RemoveUserFromOrganization">func (c *Client) RemoveUserFromOrganization(userID, orgID string) error</a>

```
searchKey: gqltestutil.Client.RemoveUserFromOrganization
tags: [exported]
```

```Go
func (c *Client) RemoveUserFromOrganization(userID, orgID string) error
```

RemoveUserFromOrganization removes user from given organization. 

#### <a id="Client.ScheduleRepositoryPermissionsSync" href="#Client.ScheduleRepositoryPermissionsSync">func (c *Client) ScheduleRepositoryPermissionsSync(id string) error</a>

```
searchKey: gqltestutil.Client.ScheduleRepositoryPermissionsSync
tags: [exported]
```

```Go
func (c *Client) ScheduleRepositoryPermissionsSync(id string) error
```

ScheduleRepositoryPermissionsSync schedules a permissions syncing request for the given repository. 

#### <a id="Client.WaitForReposToBeCloned" href="#Client.WaitForReposToBeCloned">func (c *Client) WaitForReposToBeCloned(repos ...string) error</a>

```
searchKey: gqltestutil.Client.WaitForReposToBeCloned
tags: [exported]
```

```Go
func (c *Client) WaitForReposToBeCloned(repos ...string) error
```

WaitForReposToBeCloned waits (up to two minutes) for all repositories in the list to be cloned. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.WaitForReposToBeIndex" href="#Client.WaitForReposToBeIndex">func (c *Client) WaitForReposToBeIndex(repos ...string) error</a>

```
searchKey: gqltestutil.Client.WaitForReposToBeIndex
tags: [exported]
```

```Go
func (c *Client) WaitForReposToBeIndex(repos ...string) error
```

WaitForReposToBeIndex waits (up to 30 seconds) for all repositories in the list to be indexed. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.waitForReposByQuery" href="#Client.waitForReposByQuery">func (c *Client) waitForReposByQuery(query string, repos ...string) ([]string, error)</a>

```
searchKey: gqltestutil.Client.waitForReposByQuery
```

```Go
func (c *Client) waitForReposByQuery(query string, repos ...string) ([]string, error)
```

#### <a id="Client.FileExternalLinks" href="#Client.FileExternalLinks">func (c *Client) FileExternalLinks(repoName, revision, filePath string) ([]*ExternalLink, error)</a>

```
searchKey: gqltestutil.Client.FileExternalLinks
tags: [exported]
```

```Go
func (c *Client) FileExternalLinks(repoName, revision, filePath string) ([]*ExternalLink, error)
```

FileExternalLinks external links for a file or directory in a repository. 

#### <a id="Client.Repository" href="#Client.Repository">func (c *Client) Repository(name string) (*Repository, error)</a>

```
searchKey: gqltestutil.Client.Repository
tags: [exported]
```

```Go
func (c *Client) Repository(name string) (*Repository, error)
```

Repository returns basic information of the given repository. 

#### <a id="Client.RepositoryPermissionsInfo" href="#Client.RepositoryPermissionsInfo">func (c *Client) RepositoryPermissionsInfo(name string) (*PermissionsInfo, error)</a>

```
searchKey: gqltestutil.Client.RepositoryPermissionsInfo
tags: [exported]
```

```Go
func (c *Client) RepositoryPermissionsInfo(name string) (*PermissionsInfo, error)
```

RepositoryPermissionsInfo returns permissions information of the given repository. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.SearchRepositories" href="#Client.SearchRepositories">func (c *Client) SearchRepositories(query string) (SearchRepositoryResults, error)</a>

```
searchKey: gqltestutil.Client.SearchRepositories
tags: [exported]
```

```Go
func (c *Client) SearchRepositories(query string) (SearchRepositoryResults, error)
```

SearchRepositories search repositories with given query. 

#### <a id="Client.SearchFiles" href="#Client.SearchFiles">func (c *Client) SearchFiles(query string) (*SearchFileResults, error)</a>

```
searchKey: gqltestutil.Client.SearchFiles
tags: [exported]
```

```Go
func (c *Client) SearchFiles(query string) (*SearchFileResults, error)
```

SearchFiles searches files with given query. It returns the match count and corresponding file matches. Search alert is also included if any. 

#### <a id="Client.SearchCommits" href="#Client.SearchCommits">func (c *Client) SearchCommits(query string) (*SearchCommitResults, error)</a>

```
searchKey: gqltestutil.Client.SearchCommits
tags: [exported]
```

```Go
func (c *Client) SearchCommits(query string) (*SearchCommitResults, error)
```

SearchCommits searches commits with given query. It returns the match count and corresponding file matches. 

#### <a id="Client.SearchAll" href="#Client.SearchAll">func (c *Client) SearchAll(query string) ([]*AnyResult, error)</a>

```
searchKey: gqltestutil.Client.SearchAll
tags: [exported]
```

```Go
func (c *Client) SearchAll(query string) ([]*AnyResult, error)
```

SearchAll searches for all matches with a given query corresponding file matches. 

#### <a id="Client.SearchStats" href="#Client.SearchStats">func (c *Client) SearchStats(query string) (*SearchStatsResult, error)</a>

```
searchKey: gqltestutil.Client.SearchStats
tags: [exported]
```

```Go
func (c *Client) SearchStats(query string) (*SearchStatsResult, error)
```

SearchStats returns statistics of given query. 

#### <a id="Client.SearchSuggestions" href="#Client.SearchSuggestions">func (c *Client) SearchSuggestions(query string) ([]SearchSuggestionsResult, error)</a>

```
searchKey: gqltestutil.Client.SearchSuggestions
tags: [exported]
```

```Go
func (c *Client) SearchSuggestions(query string) ([]SearchSuggestionsResult, error)
```

#### <a id="Client.CreateSearchContext" href="#Client.CreateSearchContext">func (c *Client) CreateSearchContext(input CreateSearchContextInput, repositories []SearchContextRepositoryRevisionsInput) (string, error)</a>

```
searchKey: gqltestutil.Client.CreateSearchContext
tags: [exported]
```

```Go
func (c *Client) CreateSearchContext(input CreateSearchContextInput, repositories []SearchContextRepositoryRevisionsInput) (string, error)
```

CreateSearchContext creates a new search context with the given input and repository revisions to be searched. It returns the GraphQL node ID of the newly created search context. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.GetSearchContext" href="#Client.GetSearchContext">func (c *Client) GetSearchContext(id string) (*GetSearchContextResult, error)</a>

```
searchKey: gqltestutil.Client.GetSearchContext
tags: [exported]
```

```Go
func (c *Client) GetSearchContext(id string) (*GetSearchContextResult, error)
```

#### <a id="Client.UpdateSearchContext" href="#Client.UpdateSearchContext">func (c *Client) UpdateSearchContext(id string, input UpdateSearchContextInput, repos []SearchContextRepositoryRevisionsInput) (string, error)</a>

```
searchKey: gqltestutil.Client.UpdateSearchContext
tags: [exported]
```

```Go
func (c *Client) UpdateSearchContext(id string, input UpdateSearchContextInput, repos []SearchContextRepositoryRevisionsInput) (string, error)
```

#### <a id="Client.DeleteSearchContext" href="#Client.DeleteSearchContext">func (c *Client) DeleteSearchContext(id string) error</a>

```
searchKey: gqltestutil.Client.DeleteSearchContext
tags: [exported]
```

```Go
func (c *Client) DeleteSearchContext(id string) error
```

DeleteSearchContext deletes a search context with the given id. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.ListSearchContexts" href="#Client.ListSearchContexts">func (c *Client) ListSearchContexts(options ListSearchContextsOptions) (*ListSearchContextsResult, error)</a>

```
searchKey: gqltestutil.Client.ListSearchContexts
tags: [exported]
```

```Go
func (c *Client) ListSearchContexts(options ListSearchContextsOptions) (*ListSearchContextsResult, error)
```

ListSearchContexts list search contexts filtered by the given options. 

#### <a id="Client.SettingsCascade" href="#Client.SettingsCascade">func (c *Client) SettingsCascade(subjectID string) ([]*SettingsSubject, error)</a>

```
searchKey: gqltestutil.Client.SettingsCascade
tags: [exported]
```

```Go
func (c *Client) SettingsCascade(subjectID string) ([]*SettingsSubject, error)
```

SettingsCascade returns settings of given subject ID with contents. 

#### <a id="Client.OverwriteSettings" href="#Client.OverwriteSettings">func (c *Client) OverwriteSettings(subjectID, contents string) error</a>

```
searchKey: gqltestutil.Client.OverwriteSettings
tags: [exported]
```

```Go
func (c *Client) OverwriteSettings(subjectID, contents string) error
```

OverwriteSettings overwrites settings for given subject ID with contents. 

#### <a id="Client.lastSettingsID" href="#Client.lastSettingsID">func (c *Client) lastSettingsID(subjectID string) (int, error)</a>

```
searchKey: gqltestutil.Client.lastSettingsID
```

```Go
func (c *Client) lastSettingsID(subjectID string) (int, error)
```

lastSettingsID returns the ID of last settings of given subject. It is required to be used to update corresponding settings. 

#### <a id="Client.ViewerSettings" href="#Client.ViewerSettings">func (c *Client) ViewerSettings() (string, error)</a>

```
searchKey: gqltestutil.Client.ViewerSettings
tags: [exported]
```

```Go
func (c *Client) ViewerSettings() (string, error)
```

ViewerSettings returns the latest cascaded settings of authenticated user. 

#### <a id="Client.SiteConfiguration" href="#Client.SiteConfiguration">func (c *Client) SiteConfiguration() (*schema.SiteConfiguration, error)</a>

```
searchKey: gqltestutil.Client.SiteConfiguration
tags: [exported]
```

```Go
func (c *Client) SiteConfiguration() (*schema.SiteConfiguration, error)
```

SiteConfiguration returns current effective site configuration. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.UpdateSiteConfiguration" href="#Client.UpdateSiteConfiguration">func (c *Client) UpdateSiteConfiguration(config *schema.SiteConfiguration) error</a>

```
searchKey: gqltestutil.Client.UpdateSiteConfiguration
tags: [exported]
```

```Go
func (c *Client) UpdateSiteConfiguration(config *schema.SiteConfiguration) error
```

UpdateSiteConfiguration updates site configuration. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.CreateUser" href="#Client.CreateUser">func (c *Client) CreateUser(username, email string) (string, error)</a>

```
searchKey: gqltestutil.Client.CreateUser
tags: [exported]
```

```Go
func (c *Client) CreateUser(username, email string) (string, error)
```

CreateUser creates a new user with the given username and email. It returns the GraphQL node ID of newly created user. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.DeleteUser" href="#Client.DeleteUser">func (c *Client) DeleteUser(id string, hard bool) error</a>

```
searchKey: gqltestutil.Client.DeleteUser
tags: [exported]
```

```Go
func (c *Client) DeleteUser(id string, hard bool) error
```

DeleteUser deletes a user by given GraphQL node ID. 

This method requires the authenticated user to be a site admin. 

#### <a id="Client.UserOrganizations" href="#Client.UserOrganizations">func (c *Client) UserOrganizations(username string) ([]string, error)</a>

```
searchKey: gqltestutil.Client.UserOrganizations
tags: [exported]
```

```Go
func (c *Client) UserOrganizations(username string) ([]string, error)
```

UserOrganizations returns organizations name the given user belongs to. 

### <a id="AddExternalServiceInput" href="#AddExternalServiceInput">type AddExternalServiceInput struct</a>

```
searchKey: gqltestutil.AddExternalServiceInput
tags: [exported]
```

```Go
type AddExternalServiceInput struct {
	Kind        string `json:"kind"`
	DisplayName string `json:"displayName"`
	Config      string `json:"config"`
}
```

### <a id="Organization" href="#Organization">type Organization struct</a>

```
searchKey: gqltestutil.Organization
tags: [exported]
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
tags: [exported]
```

```Go
type OrganizationMember struct {
	ID       string `json:"id"`
	Username string `json:"username"`
}
```

OrganizationMember contains basic information of an organization member. 

### <a id="InviteUserToOrganizationResult" href="#InviteUserToOrganizationResult">type InviteUserToOrganizationResult struct</a>

```
searchKey: gqltestutil.InviteUserToOrganizationResult
tags: [exported]
```

```Go
type InviteUserToOrganizationResult struct {
	SentInvitationEmail bool   `json:"sentInvitationEmail"`
	InvitationURL       string `json:"invitationURL"`
}
```

InviteUserToOrganizationResult contains information of a user invitation to an organization. 

### <a id="ExternalLink" href="#ExternalLink">type ExternalLink struct</a>

```
searchKey: gqltestutil.ExternalLink
tags: [exported]
```

```Go
type ExternalLink struct {
	URL         string `json:"url"`         // The URL to the resource
	ServiceKind string `json:"serviceKind"` // The kind of service that the URL points to
	ServiceType string `json:"serviceType"` // The type of service that the URL points to
}
```

ExternalLink is a link to an external service. 

### <a id="Repository" href="#Repository">type Repository struct</a>

```
searchKey: gqltestutil.Repository
tags: [exported]
```

```Go
type Repository struct {
	ID  string `json:"id"`
	URL string `json:"url"`
}
```

Repository contains basic information of a repository from GraphQL. 

### <a id="PermissionsInfo" href="#PermissionsInfo">type PermissionsInfo struct</a>

```
searchKey: gqltestutil.PermissionsInfo
tags: [exported]
```

```Go
type PermissionsInfo struct {
	SyncedAt time.Time
}
```

PermissionsInfo contains permissions information of a repository from GraphQL. 

### <a id="SearchRepositoryResult" href="#SearchRepositoryResult">type SearchRepositoryResult struct</a>

```
searchKey: gqltestutil.SearchRepositoryResult
tags: [exported]
```

```Go
type SearchRepositoryResult struct {
	Name string `json:"name"`
}
```

### <a id="SearchRepositoryResults" href="#SearchRepositoryResults">type SearchRepositoryResults []*gqltestutil.SearchRepositoryResult</a>

```
searchKey: gqltestutil.SearchRepositoryResults
tags: [exported]
```

```Go
type SearchRepositoryResults []*SearchRepositoryResult
```

#### <a id="SearchRepositoryResults.Exists" href="#SearchRepositoryResults.Exists">func (rs SearchRepositoryResults) Exists(names ...string) []string</a>

```
searchKey: gqltestutil.SearchRepositoryResults.Exists
tags: [exported]
```

```Go
func (rs SearchRepositoryResults) Exists(names ...string) []string
```

Exists returns the list of missing repositories from given names that do not exist in search results. If all of given names are found, it returns empty list. 

#### <a id="SearchRepositoryResults.String" href="#SearchRepositoryResults.String">func (rs SearchRepositoryResults) String() string</a>

```
searchKey: gqltestutil.SearchRepositoryResults.String
tags: [exported]
```

```Go
func (rs SearchRepositoryResults) String() string
```

### <a id="SearchFileResults" href="#SearchFileResults">type SearchFileResults struct</a>

```
searchKey: gqltestutil.SearchFileResults
tags: [exported]
```

```Go
type SearchFileResults struct {
	MatchCount int64               `json:"matchCount"`
	Alert      *SearchAlert        `json:"alert"`
	Results    []*SearchFileResult `json:"results"`
}
```

### <a id="SearchFileResult" href="#SearchFileResult">type SearchFileResult struct</a>

```
searchKey: gqltestutil.SearchFileResult
tags: [exported]
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

### <a id="ProposedQuery" href="#ProposedQuery">type ProposedQuery struct</a>

```
searchKey: gqltestutil.ProposedQuery
tags: [exported]
```

```Go
type ProposedQuery struct {
	Description string `json:"description"`
	Query       string `json:"query"`
}
```

### <a id="SearchAlert" href="#SearchAlert">type SearchAlert struct</a>

```
searchKey: gqltestutil.SearchAlert
tags: [exported]
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
tags: [exported]
```

```Go
type SearchCommitResults struct {
	MatchCount int64 `json:"matchCount"`
	Results    []*struct {
		URL string `json:"url"`
	} `json:"results"`
}
```

### <a id="AnyResult" href="#AnyResult">type AnyResult struct</a>

```
searchKey: gqltestutil.AnyResult
tags: [exported]
```

```Go
type AnyResult struct {
	Inner interface{}
}
```

#### <a id="AnyResult.UnmarshalJSON" href="#AnyResult.UnmarshalJSON">func (r *AnyResult) UnmarshalJSON(b []byte) error</a>

```
searchKey: gqltestutil.AnyResult.UnmarshalJSON
tags: [exported]
```

```Go
func (r *AnyResult) UnmarshalJSON(b []byte) error
```

### <a id="FileResult" href="#FileResult">type FileResult struct</a>

```
searchKey: gqltestutil.FileResult
tags: [exported]
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

### <a id="CommitResult" href="#CommitResult">type CommitResult struct</a>

```
searchKey: gqltestutil.CommitResult
tags: [exported]
```

```Go
type CommitResult struct {
	URL string
}
```

### <a id="RepositoryResult" href="#RepositoryResult">type RepositoryResult struct</a>

```
searchKey: gqltestutil.RepositoryResult
tags: [exported]
```

```Go
type RepositoryResult struct {
	Name string
}
```

### <a id="SearchStatsResult" href="#SearchStatsResult">type SearchStatsResult struct</a>

```
searchKey: gqltestutil.SearchStatsResult
tags: [exported]
```

```Go
type SearchStatsResult struct {
	Languages []struct {
		Name       string `json:"name"`
		TotalLines int    `json:"totalLines"`
	} `json:"languages"`
}
```

### <a id="SearchSuggestionsResult" href="#SearchSuggestionsResult">type SearchSuggestionsResult struct</a>

```
searchKey: gqltestutil.SearchSuggestionsResult
tags: [exported]
```

```Go
type SearchSuggestionsResult struct {
	inner interface{}
}
```

#### <a id="SearchSuggestionsResult.UnmarshalJSON" href="#SearchSuggestionsResult.UnmarshalJSON">func (srr *SearchSuggestionsResult) UnmarshalJSON(data []byte) error</a>

```
searchKey: gqltestutil.SearchSuggestionsResult.UnmarshalJSON
tags: [exported]
```

```Go
func (srr *SearchSuggestionsResult) UnmarshalJSON(data []byte) error
```

### <a id="RepositorySuggestionResult" href="#RepositorySuggestionResult">type RepositorySuggestionResult struct</a>

```
searchKey: gqltestutil.RepositorySuggestionResult
tags: [exported]
```

```Go
type RepositorySuggestionResult struct {
	Name string
}
```

### <a id="FileSuggestionResult" href="#FileSuggestionResult">type FileSuggestionResult struct</a>

```
searchKey: gqltestutil.FileSuggestionResult
tags: [exported]
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

### <a id="SymbolSuggestionResult" href="#SymbolSuggestionResult">type SymbolSuggestionResult struct</a>

```
searchKey: gqltestutil.SymbolSuggestionResult
tags: [exported]
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

### <a id="LanguageSuggestionResult" href="#LanguageSuggestionResult">type LanguageSuggestionResult struct</a>

```
searchKey: gqltestutil.LanguageSuggestionResult
tags: [exported]
```

```Go
type LanguageSuggestionResult struct {
	Name string
}
```

### <a id="SearchContextSuggestionResult" href="#SearchContextSuggestionResult">type SearchContextSuggestionResult struct</a>

```
searchKey: gqltestutil.SearchContextSuggestionResult
tags: [exported]
```

```Go
type SearchContextSuggestionResult struct {
	Spec        string `json:"spec"`
	Description string `json:"description"`
}
```

### <a id="SearchStreamClient" href="#SearchStreamClient">type SearchStreamClient struct</a>

```
searchKey: gqltestutil.SearchStreamClient
tags: [exported]
```

```Go
type SearchStreamClient struct {
	Client *Client
}
```

#### <a id="SearchStreamClient.SearchRepositories" href="#SearchStreamClient.SearchRepositories">func (s *SearchStreamClient) SearchRepositories(query string) (SearchRepositoryResults, error)</a>

```
searchKey: gqltestutil.SearchStreamClient.SearchRepositories
tags: [exported]
```

```Go
func (s *SearchStreamClient) SearchRepositories(query string) (SearchRepositoryResults, error)
```

#### <a id="SearchStreamClient.SearchFiles" href="#SearchStreamClient.SearchFiles">func (s *SearchStreamClient) SearchFiles(query string) (*SearchFileResults, error)</a>

```
searchKey: gqltestutil.SearchStreamClient.SearchFiles
tags: [exported]
```

```Go
func (s *SearchStreamClient) SearchFiles(query string) (*SearchFileResults, error)
```

#### <a id="SearchStreamClient.SearchAll" href="#SearchStreamClient.SearchAll">func (s *SearchStreamClient) SearchAll(query string) ([]*AnyResult, error)</a>

```
searchKey: gqltestutil.SearchStreamClient.SearchAll
tags: [exported]
```

```Go
func (s *SearchStreamClient) SearchAll(query string) ([]*AnyResult, error)
```

#### <a id="SearchStreamClient.OverwriteSettings" href="#SearchStreamClient.OverwriteSettings">func (s *SearchStreamClient) OverwriteSettings(subjectID, contents string) error</a>

```
searchKey: gqltestutil.SearchStreamClient.OverwriteSettings
tags: [exported]
```

```Go
func (s *SearchStreamClient) OverwriteSettings(subjectID, contents string) error
```

#### <a id="SearchStreamClient.AuthenticatedUserID" href="#SearchStreamClient.AuthenticatedUserID">func (s *SearchStreamClient) AuthenticatedUserID() string</a>

```
searchKey: gqltestutil.SearchStreamClient.AuthenticatedUserID
tags: [exported]
```

```Go
func (s *SearchStreamClient) AuthenticatedUserID() string
```

#### <a id="SearchStreamClient.search" href="#SearchStreamClient.search">func (s *SearchStreamClient) search(query string, dec streamhttp.Decoder) error</a>

```
searchKey: gqltestutil.SearchStreamClient.search
```

```Go
func (s *SearchStreamClient) search(query string, dec streamhttp.Decoder) error
```

### <a id="CreateSearchContextInput" href="#CreateSearchContextInput">type CreateSearchContextInput struct</a>

```
searchKey: gqltestutil.CreateSearchContextInput
tags: [exported]
```

```Go
type CreateSearchContextInput struct {
	Name        string `json:"name"`
	Description string `json:"description"`
	Public      bool   `json:"public"`
}
```

### <a id="UpdateSearchContextInput" href="#UpdateSearchContextInput">type UpdateSearchContextInput struct</a>

```
searchKey: gqltestutil.UpdateSearchContextInput
tags: [exported]
```

```Go
type UpdateSearchContextInput struct {
	Name        string `json:"name"`
	Description string `json:"description"`
	Public      bool   `json:"public"`
}
```

### <a id="SearchContextRepositoryRevisionsInput" href="#SearchContextRepositoryRevisionsInput">type SearchContextRepositoryRevisionsInput struct</a>

```
searchKey: gqltestutil.SearchContextRepositoryRevisionsInput
tags: [exported]
```

```Go
type SearchContextRepositoryRevisionsInput struct {
	RepositoryID string   `json:"repositoryID"`
	Revisions    []string `json:"revisions"`
}
```

### <a id="GetSearchContextResult" href="#GetSearchContextResult">type GetSearchContextResult struct</a>

```
searchKey: gqltestutil.GetSearchContextResult
tags: [exported]
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

### <a id="SearchContextsOrderBy" href="#SearchContextsOrderBy">type SearchContextsOrderBy string</a>

```
searchKey: gqltestutil.SearchContextsOrderBy
tags: [exported]
```

```Go
type SearchContextsOrderBy string
```

### <a id="ListSearchContextsOptions" href="#ListSearchContextsOptions">type ListSearchContextsOptions struct</a>

```
searchKey: gqltestutil.ListSearchContextsOptions
tags: [exported]
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
tags: [exported]
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

### <a id="SettingsSubject" href="#SettingsSubject">type SettingsSubject struct</a>

```
searchKey: gqltestutil.SettingsSubject
tags: [exported]
```

```Go
type SettingsSubject struct {
	ID       int64  `json:"id"`
	Contents string `json:"contents"`
}
```

SettingsSubject contains contents of a setting. 

## <a id="func" href="#func">Functions</a>

### <a id="NeedsSiteInit" href="#NeedsSiteInit">func NeedsSiteInit(baseURL string) (bool, error)</a>

```
searchKey: gqltestutil.NeedsSiteInit
tags: [exported]
```

```Go
func NeedsSiteInit(baseURL string) (bool, error)
```

NeedsSiteInit returns true if the instance hasn't done "Site admin init" step. 

### <a id="extractCSRFToken" href="#extractCSRFToken">func extractCSRFToken(body string) string</a>

```
searchKey: gqltestutil.extractCSRFToken
```

```Go
func extractCSRFToken(body string) string
```

extractCSRFToken extracts CSRF token from HTML response body. 

### <a id="Retry" href="#Retry">func Retry(timeout time.Duration, fn func() error) error</a>

```
searchKey: gqltestutil.Retry
tags: [exported]
```

```Go
func Retry(timeout time.Duration, fn func() error) error
```

Retry retries the given function until the timeout is reached. The function should return ErrContinueRetry to indicate another retry. 

