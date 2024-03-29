# Package github

Package github implements a GitHub API client. 

## Index

* [Constants](#const)
    * [const VisibilityAll](#VisibilityAll)
    * [const VisibilityPrivate](#VisibilityPrivate)
    * [const VisibilityPublic](#VisibilityPublic)
    * [const convertToDraftEventFmtstr](#convertToDraftEventFmtstr)
    * [const createPullRequestCommentMutation](#createPullRequestCommentMutation)
    * [const graphqlErrTypeNotFound](#graphqlErrTypeNotFound)
    * [const mergePullRequestMutation](#mergePullRequestMutation)
    * [const prCommonFragments](#prCommonFragments)
    * [const pullRequestFragmentsFmtstr](#pullRequestFragmentsFmtstr)
    * [const timelineItemTypesFmtStr](#timelineItemTypesFmtStr)
    * [const timelineItemsFragmentFmtstr](#timelineItemsFragmentFmtstr)
    * [const versionCacheResetTime](#versionCacheResetTime)
* [Variables](#var)
    * [var ErrBatchTooLarge](#ErrBatchTooLarge)
    * [var ErrIncompleteResults](#ErrIncompleteResults)
    * [var ErrPullRequestAlreadyExists](#ErrPullRequestAlreadyExists)
    * [var ErrRepoNotFound](#ErrRepoNotFound)
    * [var GetRepositoryMock](#GetRepositoryMock)
    * [var MockGetAuthenticatedUserEmails](#MockGetAuthenticatedUserEmails)
    * [var MockGetAuthenticatedUserOAuthScopes](#MockGetAuthenticatedUserOAuthScopes)
    * [var MockGetAuthenticatedUserOrgs](#MockGetAuthenticatedUserOrgs)
    * [var allMatchingSemver](#allMatchingSemver)
    * [var errInternalRateLimitExceeded](#errInternalRateLimitExceeded)
    * [var ghe220Semver](#ghe220Semver)
    * [var ghe221PlusOrDotComSemver](#ghe221PlusOrDotComSemver)
    * [var ghe300PlusOrDotComSemver](#ghe300PlusOrDotComSemver)
    * [var gitHubDisable](#gitHubDisable)
    * [var githubProxyURL](#githubProxyURL)
    * [var globalVersionCache](#globalVersionCache)
    * [var reposGitHubCacheCounter](#reposGitHubCacheCounter)
    * [var requestCounter](#requestCounter)
    * [var updateRegex](#updateRegex)
* [Types](#type)
    * [type APIError struct](#APIError)
        * [func (e *APIError) AccountSuspended() bool](#APIError.AccountSuspended)
        * [func (e *APIError) Error() string](#APIError.Error)
        * [func (e *APIError) Unauthorized() bool](#APIError.Unauthorized)
    * [type Actor struct](#Actor)
    * [type AssignedEvent struct](#AssignedEvent)
        * [func (e AssignedEvent) Key() string](#AssignedEvent.Key)
    * [type CheckRun struct](#CheckRun)
        * [func (c *CheckRun) Key() string](#CheckRun.Key)
    * [type CheckSuite struct](#CheckSuite)
        * [func (c *CheckSuite) Key() string](#CheckSuite.Key)
    * [type ClosedEvent struct](#ClosedEvent)
        * [func (e ClosedEvent) Key() string](#ClosedEvent.Key)
    * [type Collaborator struct](#Collaborator)
    * [type Commit struct](#Commit)
    * [type CommitStatus struct](#CommitStatus)
        * [func (c *CommitStatus) Key() string](#CommitStatus.Key)
    * [type CommitWithChecks struct](#CommitWithChecks)
    * [type Context struct](#Context)
    * [type ConvertToDraftEvent struct](#ConvertToDraftEvent)
        * [func (e ConvertToDraftEvent) Key() string](#ConvertToDraftEvent.Key)
    * [type CreatePullRequestInput struct](#CreatePullRequestInput)
    * [type ErrPullRequestNotFound int](#ErrPullRequestNotFound)
        * [func (e ErrPullRequestNotFound) Error() string](#ErrPullRequestNotFound.Error)
    * [type GitActor struct](#GitActor)
    * [type IssueComment struct](#IssueComment)
        * [func (e IssueComment) Key() string](#IssueComment.Key)
    * [type Label struct](#Label)
    * [type LabelEvent struct](#LabelEvent)
        * [func (e LabelEvent) Key() string](#LabelEvent.Key)
    * [type MergedEvent struct](#MergedEvent)
        * [func (e MergedEvent) Key() string](#MergedEvent.Key)
    * [type Org struct](#Org)
    * [type PageInfo struct](#PageInfo)
    * [type PullRequest struct](#PullRequest)
    * [type PullRequestCommit struct](#PullRequestCommit)
        * [func (p PullRequestCommit) Key() string](#PullRequestCommit.Key)
    * [type PullRequestReview struct](#PullRequestReview)
        * [func (e PullRequestReview) Key() string](#PullRequestReview.Key)
    * [type PullRequestReviewComment struct](#PullRequestReviewComment)
        * [func (e PullRequestReviewComment) Key() string](#PullRequestReviewComment.Key)
    * [type PullRequestReviewThread struct](#PullRequestReviewThread)
    * [type ReadyForReviewEvent struct](#ReadyForReviewEvent)
        * [func (e ReadyForReviewEvent) Key() string](#ReadyForReviewEvent.Key)
    * [type RenamedTitleEvent struct](#RenamedTitleEvent)
        * [func (e RenamedTitleEvent) Key() string](#RenamedTitleEvent.Key)
    * [type ReopenedEvent struct](#ReopenedEvent)
        * [func (e ReopenedEvent) Key() string](#ReopenedEvent.Key)
    * [type Repository struct](#Repository)
        * [func convertRestRepo(restRepo restRepository) *Repository](#convertRestRepo)
    * [type RepositoryListPage struct](#RepositoryListPage)
    * [type Review struct](#Review)
    * [type ReviewDismissedEvent struct](#ReviewDismissedEvent)
        * [func (e ReviewDismissedEvent) Key() string](#ReviewDismissedEvent.Key)
    * [type ReviewRequestRemovedEvent struct](#ReviewRequestRemovedEvent)
        * [func (e ReviewRequestRemovedEvent) Key() string](#ReviewRequestRemovedEvent.Key)
    * [type ReviewRequestedEvent struct](#ReviewRequestedEvent)
        * [func (e ReviewRequestedEvent) Key() string](#ReviewRequestedEvent.Key)
        * [func (e ReviewRequestedEvent) ReviewerDeleted() bool](#ReviewRequestedEvent.ReviewerDeleted)
    * [type Status struct](#Status)
    * [type Team struct](#Team)
    * [type TimelineItem struct](#TimelineItem)
        * [func (i *TimelineItem) UnmarshalJSON(data []byte) error](#TimelineItem.UnmarshalJSON)
    * [type TimelineItemConnection struct](#TimelineItemConnection)
    * [type UnassignedEvent struct](#UnassignedEvent)
        * [func (e UnassignedEvent) Key() string](#UnassignedEvent.Key)
    * [type UpdatePullRequestInput struct](#UpdatePullRequestInput)
    * [type User struct](#User)
    * [type UserEmail struct](#UserEmail)
    * [type V3Client struct](#V3Client)
        * [func NewV3Client(apiURL *url.URL, a auth.Authenticator, cli httpcli.Doer) *V3Client](#NewV3Client)
        * [func NewV3SearchClient(apiURL *url.URL, a auth.Authenticator, cli httpcli.Doer) *V3Client](#NewV3SearchClient)
        * [func newTestClient(t *testing.T, cli httpcli.Doer) *V3Client](#newTestClient)
        * [func newTestClientWithAuthenticator(t *testing.T, auth auth.Authenticator, cli httpcli.Doer) *V3Client](#newTestClientWithAuthenticator)
        * [func newV3Client(apiURL *url.URL, a auth.Authenticator, resource string, cli httpcli.Doer) *V3Client](#newV3Client)
        * [func newV3TestClient(t testing.TB, name string) (*V3Client, func())](#newV3TestClient)
        * [func (c *V3Client) GetAuthenticatedUser(ctx context.Context) (*User, error)](#V3Client.GetAuthenticatedUser)
        * [func (c *V3Client) GetAuthenticatedUserEmails(ctx context.Context) ([]*UserEmail, error)](#V3Client.GetAuthenticatedUserEmails)
        * [func (c *V3Client) GetAuthenticatedUserOAuthScopes(ctx context.Context) ([]string, error)](#V3Client.GetAuthenticatedUserOAuthScopes)
        * [func (c *V3Client) GetAuthenticatedUserOrgs(ctx context.Context) ([]*Org, error)](#V3Client.GetAuthenticatedUserOrgs)
        * [func (c *V3Client) GetRepository(ctx context.Context, owner, name string) (*Repository, error)](#V3Client.GetRepository)
        * [func (c *V3Client) ListAffiliatedRepositories(ctx context.Context, visibility Visibility, page int) (repos []*Repository,...](#V3Client.ListAffiliatedRepositories)
        * [func (c *V3Client) ListInstallationRepositories(ctx context.Context) ([]*Repository, error)](#V3Client.ListInstallationRepositories)
        * [func (c *V3Client) ListOrgRepositories(ctx context.Context, org string, page int) (repos []*Repository, hasNextPage bool, rateLimitCost int, err error)](#V3Client.ListOrgRepositories)
        * [func (c *V3Client) ListPublicRepositories(ctx context.Context, sinceRepoID int64) ([]*Repository, error)](#V3Client.ListPublicRepositories)
        * [func (c *V3Client) ListRepositoriesForSearch(ctx context.Context, searchString string, page int) (RepositoryListPage, error)](#V3Client.ListRepositoriesForSearch)
        * [func (c *V3Client) ListRepositoryCollaborators(ctx context.Context, owner, repo string, page int) (users []*Collaborator, hasNextPage bool, _ error)](#V3Client.ListRepositoryCollaborators)
        * [func (c *V3Client) ListTopicsOnRepository(ctx context.Context, ownerAndName string) ([]string, error)](#V3Client.ListTopicsOnRepository)
        * [func (c *V3Client) ListUserRepositories(ctx context.Context, user string, page int) (repos []*Repository, hasNextPage bool, rateLimitCost int, err error)](#V3Client.ListUserRepositories)
        * [func (c *V3Client) RateLimitMonitor() *ratelimit.Monitor](#V3Client.RateLimitMonitor)
        * [func (c *V3Client) WithAuthenticator(a auth.Authenticator) *V3Client](#V3Client.WithAuthenticator)
        * [func (c *V3Client) addRepositoriesToCache(repos []*Repository)](#V3Client.addRepositoriesToCache)
        * [func (c *V3Client) addRepositoryToCache(keys []string, repo *cachedRepo)](#V3Client.addRepositoryToCache)
        * [func (c *V3Client) cachedGetRepository(ctx context.Context, key string, getRepositoryFromAPI func(ctx context.Context) (repo *Repository, keys []string, err error), nocache bool) (*Repository, error)](#V3Client.cachedGetRepository)
        * [func (c *V3Client) get(ctx context.Context, requestURI string, result interface{}) (http.Header, error)](#V3Client.get)
        * [func (c *V3Client) getPublicRepositories(ctx context.Context, sinceRepoID int64) ([]*Repository, error)](#V3Client.getPublicRepositories)
        * [func (c *V3Client) getRepositoryFromAPI(ctx context.Context, owner, name string) (*Repository, error)](#V3Client.getRepositoryFromAPI)
        * [func (c *V3Client) getRepositoryFromCache(ctx context.Context, key string) *cachedRepo](#V3Client.getRepositoryFromCache)
        * [func (c *V3Client) listRepositories(ctx context.Context, requestURI string) ([]*Repository, error)](#V3Client.listRepositories)
        * [func (c *V3Client) requestGet(ctx context.Context, requestURI string, result interface{}) error](#V3Client.requestGet)
        * [func (c *V3Client) requestGetWithHeader(ctx context.Context, requestURI string, result interface{}) (http.Header, error)](#V3Client.requestGetWithHeader)
    * [type V4Client struct](#V4Client)
        * [func NewV4Client(apiURL *url.URL, a auth.Authenticator, cli httpcli.Doer) *V4Client](#NewV4Client)
        * [func newV4Client(t testing.TB, name string) (*V4Client, func())](#newV4Client)
        * [func (c *V4Client) ClosePullRequest(ctx context.Context, pr *PullRequest) error](#V4Client.ClosePullRequest)
        * [func (c *V4Client) CreatePullRequest(ctx context.Context, in *CreatePullRequestInput) (*PullRequest, error)](#V4Client.CreatePullRequest)
        * [func (c *V4Client) CreatePullRequestComment(ctx context.Context, pr *PullRequest, body string) error](#V4Client.CreatePullRequestComment)
        * [func (c *V4Client) GetAuthenticatedUser(ctx context.Context) (*Actor, error)](#V4Client.GetAuthenticatedUser)
        * [func (c *V4Client) GetOpenPullRequestByRefs(ctx context.Context, owner, name, baseRef, headRef string) (*PullRequest, error)](#V4Client.GetOpenPullRequestByRefs)
        * [func (c *V4Client) GetReposByNameWithOwner(ctx context.Context, namesWithOwners ...string) ([]*Repository, error)](#V4Client.GetReposByNameWithOwner)
        * [func (c *V4Client) LoadPullRequest(ctx context.Context, pr *PullRequest) error](#V4Client.LoadPullRequest)
        * [func (c *V4Client) MarkPullRequestReadyForReview(ctx context.Context, pr *PullRequest) error](#V4Client.MarkPullRequestReadyForReview)
        * [func (c *V4Client) MergePullRequest(ctx context.Context, pr *PullRequest, squash bool) error](#V4Client.MergePullRequest)
        * [func (c *V4Client) RateLimitMonitor() *ratelimit.Monitor](#V4Client.RateLimitMonitor)
        * [func (c *V4Client) ReopenPullRequest(ctx context.Context, pr *PullRequest) error](#V4Client.ReopenPullRequest)
        * [func (c *V4Client) UpdatePullRequest(ctx context.Context, in *UpdatePullRequestInput) (*PullRequest, error)](#V4Client.UpdatePullRequest)
        * [func (c *V4Client) WithAuthenticator(a auth.Authenticator) *V4Client](#V4Client.WithAuthenticator)
        * [func (c *V4Client) buildGetReposBatchQuery(ctx context.Context, namesWithOwners []string) (string, error)](#V4Client.buildGetReposBatchQuery)
        * [func (c *V4Client) determineGitHubVersion(ctx context.Context) *semver.Version](#V4Client.determineGitHubVersion)
        * [func (c *V4Client) fetchGitHubVersion(ctx context.Context) *semver.Version](#V4Client.fetchGitHubVersion)
        * [func (c *V4Client) loadRemainingTimelineItems(ctx context.Context, prID string, pageInfo PageInfo) (items []TimelineItem, err error)](#V4Client.loadRemainingTimelineItems)
        * [func (c *V4Client) repositoryFieldsGraphQLFragment(ctx context.Context) string](#V4Client.repositoryFieldsGraphQLFragment)
        * [func (c *V4Client) requestGraphQL(ctx context.Context, query string, vars map[string]interface{}, result interface{}) (err error)](#V4Client.requestGraphQL)
    * [type Visibility string](#Visibility)
    * [type cachedRepo struct](#cachedRepo)
    * [type disabledClient struct{}](#disabledClient)
        * [func (t disabledClient) Do(r *http.Request) (*http.Response, error)](#disabledClient.Do)
    * [type graphqlErrors []struct](#graphqlErrors)
        * [func (e graphqlErrors) Error() string](#graphqlErrors.Error)
    * [type limitDepth struct](#limitDepth)
    * [type mockHTTPEmptyResponse struct](#mockHTTPEmptyResponse)
        * [func (s mockHTTPEmptyResponse) Do(req *http.Request) (*http.Response, error)](#mockHTTPEmptyResponse.Do)
    * [type mockHTTPResponseBody struct](#mockHTTPResponseBody)
        * [func (s *mockHTTPResponseBody) Do(req *http.Request) (*http.Response, error)](#mockHTTPResponseBody.Do)
    * [type restRepository struct](#restRepository)
    * [type restRepositoryPermissions struct](#restRepositoryPermissions)
    * [type restSearchResponse struct](#restSearchResponse)
    * [type restTopicsResponse struct](#restTopicsResponse)
    * [type versionCache struct](#versionCache)
* [Functions](#func)
    * [func APIRoot(baseURL *url.URL) (apiURL *url.URL, githubDotCom bool)](#APIRoot)
    * [func ExternalRepoSpec(repo *Repository, baseURL *url.URL) api.ExternalRepoSpec](#ExternalRepoSpec)
    * [func GetExternalAccountData(data *extsvc.AccountData) (usr *github.User, tok *oauth2.Token, err error)](#GetExternalAccountData)
    * [func HTTPErrorCode(err error) int](#HTTPErrorCode)
    * [func IsNotFound(err error) bool](#IsNotFound)
    * [func IsNotMergeable(err error) bool](#IsNotMergeable)
    * [func IsRateLimitExceeded(err error) bool](#IsRateLimitExceeded)
    * [func SetExternalAccountData(data *extsvc.AccountData, user *github.User, token *oauth2.Token)](#SetExternalAccountData)
    * [func SplitRepositoryNameWithOwner(nameWithOwner string) (owner, repo string, err error)](#SplitRepositoryNameWithOwner)
    * [func TestClient_GetReposByNameWithOwner(t *testing.T)](#TestClient_GetReposByNameWithOwner)
    * [func TestClient_GetRepository(t *testing.T)](#TestClient_GetRepository)
    * [func TestClient_GetRepository_nonexistent(t *testing.T)](#TestClient_GetRepository_nonexistent)
    * [func TestClient_ListOrgRepositories(t *testing.T)](#TestClient_ListOrgRepositories)
    * [func TestClient_ListRepositoriesForSearch(t *testing.T)](#TestClient_ListRepositoriesForSearch)
    * [func TestClient_ListRepositoriesForSearch_incomplete(t *testing.T)](#TestClient_ListRepositoriesForSearch_incomplete)
    * [func TestClient_buildGetRepositoriesBatchQuery(t *testing.T)](#TestClient_buildGetRepositoriesBatchQuery)
    * [func TestClosePullRequest(t *testing.T)](#TestClosePullRequest)
    * [func TestCreatePullRequest(t *testing.T)](#TestCreatePullRequest)
    * [func TestCreatePullRequestComment(t *testing.T)](#TestCreatePullRequestComment)
    * [func TestEstimateGraphQLCost(t *testing.T)](#TestEstimateGraphQLCost)
    * [func TestGetAuthenticatedUserOrgs(t *testing.T)](#TestGetAuthenticatedUserOrgs)
    * [func TestGetAuthenticatedUserV4(t *testing.T)](#TestGetAuthenticatedUserV4)
    * [func TestListAffiliatedRepositories(t *testing.T)](#TestListAffiliatedRepositories)
    * [func TestListRepositoryCollaborators(t *testing.T)](#TestListRepositoryCollaborators)
    * [func TestLoadPullRequest(t *testing.T)](#TestLoadPullRequest)
    * [func TestMarkPullRequestReadyForReview(t *testing.T)](#TestMarkPullRequestReadyForReview)
    * [func TestMergePullRequest(t *testing.T)](#TestMergePullRequest)
    * [func TestNewRepoCache(t *testing.T)](#TestNewRepoCache)
    * [func TestReopenPullRequest(t *testing.T)](#TestReopenPullRequest)
    * [func TestSplitRepositoryNameWithOwner(t *testing.T)](#TestSplitRepositoryNameWithOwner)
    * [func TestUnmarshal(t *testing.T)](#TestUnmarshal)
    * [func TestV3Client_WithAuthenticator(t *testing.T)](#TestV3Client_WithAuthenticator)
    * [func TestV4Client_WithAuthenticator(t *testing.T)](#TestV4Client_WithAuthenticator)
    * [func Test_GetAuthenticatedUserOAuthScopes(t *testing.T)](#Test_GetAuthenticatedUserOAuthScopes)
    * [func abbreviateRef(ref string) string](#abbreviateRef)
    * [func calcDefinitionCost(def ast.Node) int](#calcDefinitionCost)
    * [func canonicalizedURL(apiURL *url.URL) *url.URL](#canonicalizedURL)
    * [func convertRestRepoPermissions(restRepoPermissions restRepositoryPermissions) string](#convertRestRepoPermissions)
    * [func doRequest(ctx context.Context, apiURL *url.URL, auth auth.Authenticator, rateLimitMonitor *ratelimit.Monitor, httpClient httpcli.Doer, req *http.Request, result interface{}) (headers http.Header, err error)](#doRequest)
    * [func estimateGraphQLCost(query string) (int, error)](#estimateGraphQLCost)
    * [func filterInPlace(limitStack []limitDepth, depth int) []limitDepth](#filterInPlace)
    * [func nameWithOwnerCacheKey(nameWithOwner string) string](#nameWithOwnerCacheKey)
    * [func newRepoCache(apiURL *url.URL, a auth.Authenticator) *rcache.Cache](#newRepoCache)
    * [func nodeIDCacheKey(id string) string](#nodeIDCacheKey)
    * [func normalizeURL(rawURL string) string](#normalizeURL)
    * [func ownerNameCacheKey(owner, name string) string](#ownerNameCacheKey)
    * [func pullRequestFragments(version *semver.Version) (string, error)](#pullRequestFragments)
    * [func repoListsAreEqual(a []*Repository, b []*Repository) bool](#repoListsAreEqual)
    * [func stringForRepoList(repos []*Repository) string](#stringForRepoList)
    * [func timelineItemTypes(version *semver.Version) (string, error)](#timelineItemTypes)
    * [func timelineItemsFragment(version *semver.Version) (string, error)](#timelineItemsFragment)
    * [func unmarshal(data []byte, v interface{}) error](#unmarshal)
    * [func update(name string) bool](#update)
    * [func urlIsGitHubDotCom(apiURL *url.URL) bool](#urlIsGitHubDotCom)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="VisibilityAll" href="#VisibilityAll">const VisibilityAll</a>

```
searchKey: github.VisibilityAll
tags: [constant string]
```

```Go
const VisibilityAll Visibility = "all"
```

### <a id="VisibilityPrivate" href="#VisibilityPrivate">const VisibilityPrivate</a>

```
searchKey: github.VisibilityPrivate
tags: [constant string]
```

```Go
const VisibilityPrivate Visibility = "private"
```

### <a id="VisibilityPublic" href="#VisibilityPublic">const VisibilityPublic</a>

```
searchKey: github.VisibilityPublic
tags: [constant string]
```

```Go
const VisibilityPublic Visibility = "public"
```

### <a id="convertToDraftEventFmtstr" href="#convertToDraftEventFmtstr">const convertToDraftEventFmtstr</a>

```
searchKey: github.convertToDraftEventFmtstr
tags: [constant string private]
```

```Go
const convertToDraftEventFmtstr = ...
```

### <a id="createPullRequestCommentMutation" href="#createPullRequestCommentMutation">const createPullRequestCommentMutation</a>

```
searchKey: github.createPullRequestCommentMutation
tags: [constant string private]
```

```Go
const createPullRequestCommentMutation = ...
```

### <a id="graphqlErrTypeNotFound" href="#graphqlErrTypeNotFound">const graphqlErrTypeNotFound</a>

```
searchKey: github.graphqlErrTypeNotFound
tags: [constant string private]
```

```Go
const graphqlErrTypeNotFound = "NOT_FOUND"
```

### <a id="mergePullRequestMutation" href="#mergePullRequestMutation">const mergePullRequestMutation</a>

```
searchKey: github.mergePullRequestMutation
tags: [constant string private]
```

```Go
const mergePullRequestMutation = ...
```

### <a id="prCommonFragments" href="#prCommonFragments">const prCommonFragments</a>

```
searchKey: github.prCommonFragments
tags: [constant string private]
```

```Go
const prCommonFragments = ...
```

This fragment was formatted using the "prettify" button in the GitHub API explorer: [https://developer.github.com/v4/explorer/](https://developer.github.com/v4/explorer/) 

### <a id="pullRequestFragmentsFmtstr" href="#pullRequestFragmentsFmtstr">const pullRequestFragmentsFmtstr</a>

```
searchKey: github.pullRequestFragmentsFmtstr
tags: [constant string private]
```

```Go
const pullRequestFragmentsFmtstr = ...
```

This fragment was formatted using the "prettify" button in the GitHub API explorer: [https://developer.github.com/v4/explorer/](https://developer.github.com/v4/explorer/) 

### <a id="timelineItemTypesFmtStr" href="#timelineItemTypesFmtStr">const timelineItemTypesFmtStr</a>

```
searchKey: github.timelineItemTypesFmtStr
tags: [constant string private]
```

```Go
const timelineItemTypesFmtStr = ...
```

timelineItemTypes contains all the types requested via GraphQL from the timelineItems connection on a pull request. 

### <a id="timelineItemsFragmentFmtstr" href="#timelineItemsFragmentFmtstr">const timelineItemsFragmentFmtstr</a>

```
searchKey: github.timelineItemsFragmentFmtstr
tags: [constant string private]
```

```Go
const timelineItemsFragmentFmtstr = ...
```

This fragment was formatted using the "prettify" button in the GitHub API explorer: [https://developer.github.com/v4/explorer/](https://developer.github.com/v4/explorer/) 

### <a id="versionCacheResetTime" href="#versionCacheResetTime">const versionCacheResetTime</a>

```
searchKey: github.versionCacheResetTime
tags: [constant number private]
```

```Go
const versionCacheResetTime = 6 * 60 * time.Minute
```

versionCacheResetTime stores the time until a version cache is reset. It's set to 6 hours. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ErrBatchTooLarge" href="#ErrBatchTooLarge">var ErrBatchTooLarge</a>

```
searchKey: github.ErrBatchTooLarge
tags: [variable interface]
```

```Go
var ErrBatchTooLarge = errors.New("requested batch of GitHub repositories too large")
```

ErrBatchTooLarge is when the requested batch of GitHub repositories to fetch is too large and goes over the limit of what can be requested in a single GraphQL call 

### <a id="ErrIncompleteResults" href="#ErrIncompleteResults">var ErrIncompleteResults</a>

```
searchKey: github.ErrIncompleteResults
tags: [variable interface]
```

```Go
var ErrIncompleteResults = ...
```

ErrIncompleteResults is returned when the GitHub Search API returns an `incomplete_results: true` field in their response 

### <a id="ErrPullRequestAlreadyExists" href="#ErrPullRequestAlreadyExists">var ErrPullRequestAlreadyExists</a>

```
searchKey: github.ErrPullRequestAlreadyExists
tags: [variable interface]
```

```Go
var ErrPullRequestAlreadyExists = errors.New("GitHub pull request already exists")
```

ErrPullRequestAlreadyExists is thrown when the requested GitHub Pull Request already exists. 

### <a id="ErrRepoNotFound" href="#ErrRepoNotFound">var ErrRepoNotFound</a>

```
searchKey: github.ErrRepoNotFound
tags: [variable interface]
```

```Go
var ErrRepoNotFound = errors.New("GitHub repository not found")
```

ErrRepoNotFound is when the requested GitHub repository is not found. 

### <a id="GetRepositoryMock" href="#GetRepositoryMock">var GetRepositoryMock</a>

```
searchKey: github.GetRepositoryMock
tags: [variable function]
```

```Go
var GetRepositoryMock func(ctx context.Context, owner, name string) (*Repository, error)
```

GetRepositoryMock is set by tests to mock (*Client).GetRepository. 

### <a id="MockGetAuthenticatedUserEmails" href="#MockGetAuthenticatedUserEmails">var MockGetAuthenticatedUserEmails</a>

```
searchKey: github.MockGetAuthenticatedUserEmails
tags: [variable function]
```

```Go
var MockGetAuthenticatedUserEmails func(ctx context.Context) ([]*UserEmail, error)
```

### <a id="MockGetAuthenticatedUserOAuthScopes" href="#MockGetAuthenticatedUserOAuthScopes">var MockGetAuthenticatedUserOAuthScopes</a>

```
searchKey: github.MockGetAuthenticatedUserOAuthScopes
tags: [variable function]
```

```Go
var MockGetAuthenticatedUserOAuthScopes func(ctx context.Context) ([]string, error)
```

### <a id="MockGetAuthenticatedUserOrgs" href="#MockGetAuthenticatedUserOrgs">var MockGetAuthenticatedUserOrgs</a>

```
searchKey: github.MockGetAuthenticatedUserOrgs
tags: [variable function]
```

```Go
var MockGetAuthenticatedUserOrgs func(ctx context.Context) ([]*Org, error)
```

### <a id="allMatchingSemver" href="#allMatchingSemver">var allMatchingSemver</a>

```
searchKey: github.allMatchingSemver
tags: [variable struct private]
```

```Go
var allMatchingSemver = semver.MustParse("99.99.99")
```

allMatchingSemver is a *semver.Version that will always match for the latest GitHub, which is either the latest GHE or the current deployment on GitHub.com. 

### <a id="errInternalRateLimitExceeded" href="#errInternalRateLimitExceeded">var errInternalRateLimitExceeded</a>

```
searchKey: github.errInternalRateLimitExceeded
tags: [variable interface private]
```

```Go
var errInternalRateLimitExceeded = errors.New("internal rate limit exceeded")
```

### <a id="ghe220Semver" href="#ghe220Semver">var ghe220Semver</a>

```
searchKey: github.ghe220Semver
tags: [variable struct private]
```

```Go
var ghe220Semver, _ = semver.NewConstraint("~2.20.0")
```

### <a id="ghe221PlusOrDotComSemver" href="#ghe221PlusOrDotComSemver">var ghe221PlusOrDotComSemver</a>

```
searchKey: github.ghe221PlusOrDotComSemver
tags: [variable struct private]
```

```Go
var ghe221PlusOrDotComSemver, _ = semver.NewConstraint(">= 2.21.0")
```

### <a id="ghe300PlusOrDotComSemver" href="#ghe300PlusOrDotComSemver">var ghe300PlusOrDotComSemver</a>

```
searchKey: github.ghe300PlusOrDotComSemver
tags: [variable struct private]
```

```Go
var ghe300PlusOrDotComSemver, _ = semver.NewConstraint(">= 3.0.0")
```

### <a id="gitHubDisable" href="#gitHubDisable">var gitHubDisable</a>

```
searchKey: github.gitHubDisable
tags: [variable boolean private]
```

```Go
var gitHubDisable, _ = ...
```

### <a id="githubProxyURL" href="#githubProxyURL">var githubProxyURL</a>

```
searchKey: github.githubProxyURL
tags: [variable struct private]
```

```Go
var githubProxyURL = ...
```

### <a id="globalVersionCache" href="#globalVersionCache">var globalVersionCache</a>

```
searchKey: github.globalVersionCache
tags: [variable struct private]
```

```Go
var globalVersionCache = &versionCache{
	versions: make(map[string]*semver.Version),
}
```

### <a id="reposGitHubCacheCounter" href="#reposGitHubCacheCounter">var reposGitHubCacheCounter</a>

```
searchKey: github.reposGitHubCacheCounter
tags: [variable struct private]
```

```Go
var reposGitHubCacheCounter = ...
```

### <a id="requestCounter" href="#requestCounter">var requestCounter</a>

```
searchKey: github.requestCounter
tags: [variable struct private]
```

```Go
var requestCounter = ...
```

### <a id="updateRegex" href="#updateRegex">var updateRegex</a>

```
searchKey: github.updateRegex
tags: [variable string private]
```

```Go
var updateRegex = flag.String("update", "", "Update testdata of tests matching the given regex")
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="APIError" href="#APIError">type APIError struct</a>

```
searchKey: github.APIError
tags: [struct]
```

```Go
type APIError struct {
	URL              string
	Code             int
	Message          string
	DocumentationURL string `json:"documentation_url"`
}
```

APIError is an error type returned by Client when the GitHub API responds with an error. 

#### <a id="APIError.AccountSuspended" href="#APIError.AccountSuspended">func (e *APIError) AccountSuspended() bool</a>

```
searchKey: github.APIError.AccountSuspended
tags: [method]
```

```Go
func (e *APIError) AccountSuspended() bool
```

#### <a id="APIError.Error" href="#APIError.Error">func (e *APIError) Error() string</a>

```
searchKey: github.APIError.Error
tags: [method]
```

```Go
func (e *APIError) Error() string
```

#### <a id="APIError.Unauthorized" href="#APIError.Unauthorized">func (e *APIError) Unauthorized() bool</a>

```
searchKey: github.APIError.Unauthorized
tags: [method]
```

```Go
func (e *APIError) Unauthorized() bool
```

### <a id="Actor" href="#Actor">type Actor struct</a>

```
searchKey: github.Actor
tags: [struct]
```

```Go
type Actor struct {
	AvatarURL string
	Login     string
	URL       string
}
```

An Actor represents an object which can take actions on GitHub. Typically a User or Bot. 

### <a id="AssignedEvent" href="#AssignedEvent">type AssignedEvent struct</a>

```
searchKey: github.AssignedEvent
tags: [struct]
```

```Go
type AssignedEvent struct {
	Actor     Actor
	Assignee  Actor
	CreatedAt time.Time
}
```

AssignedEvent represents an 'assigned' event on a PullRequest. 

#### <a id="AssignedEvent.Key" href="#AssignedEvent.Key">func (e AssignedEvent) Key() string</a>

```
searchKey: github.AssignedEvent.Key
tags: [method]
```

```Go
func (e AssignedEvent) Key() string
```

Key is a unique key identifying this event in the context of its pull request. 

### <a id="CheckRun" href="#CheckRun">type CheckRun struct</a>

```
searchKey: github.CheckRun
tags: [struct]
```

```Go
type CheckRun struct {
	ID string
	// One of COMPLETED, IN_PROGRESS, QUEUED, REQUESTED
	Status string
	// One of ACTION_REQUIRED, CANCELLED, FAILURE, NEUTRAL, SUCCESS, TIMED_OUT
	Conclusion string
	// When the run was received via a webhook
	ReceivedAt time.Time
}
```

CheckRun represents the status of a checkrun 

#### <a id="CheckRun.Key" href="#CheckRun.Key">func (c *CheckRun) Key() string</a>

```
searchKey: github.CheckRun.Key
tags: [method]
```

```Go
func (c *CheckRun) Key() string
```

### <a id="CheckSuite" href="#CheckSuite">type CheckSuite struct</a>

```
searchKey: github.CheckSuite
tags: [struct]
```

```Go
type CheckSuite struct {
	ID string
	// One of COMPLETED, IN_PROGRESS, QUEUED, REQUESTED
	Status string
	// One of ACTION_REQUIRED, CANCELLED, FAILURE, NEUTRAL, SUCCESS, TIMED_OUT
	Conclusion string
	ReceivedAt time.Time
	// When the suite was received via a webhook
	CheckRuns struct{ Nodes []CheckRun }
}
```

CheckSuite represents the status of a checksuite 

#### <a id="CheckSuite.Key" href="#CheckSuite.Key">func (c *CheckSuite) Key() string</a>

```
searchKey: github.CheckSuite.Key
tags: [method]
```

```Go
func (c *CheckSuite) Key() string
```

### <a id="ClosedEvent" href="#ClosedEvent">type ClosedEvent struct</a>

```
searchKey: github.ClosedEvent
tags: [struct]
```

```Go
type ClosedEvent struct {
	Actor     Actor
	CreatedAt time.Time
	URL       string
}
```

ClosedEvent represents a 'closed' event on a PullRequest. 

#### <a id="ClosedEvent.Key" href="#ClosedEvent.Key">func (e ClosedEvent) Key() string</a>

```
searchKey: github.ClosedEvent.Key
tags: [method]
```

```Go
func (e ClosedEvent) Key() string
```

Key is a unique key identifying this event in the context of its pull request. 

### <a id="Collaborator" href="#Collaborator">type Collaborator struct</a>

```
searchKey: github.Collaborator
tags: [struct]
```

```Go
type Collaborator struct {
	ID         string `json:"node_id"` // GraphQL ID
	DatabaseID int64  `json:"id"`
}
```

Collaborator is a collaborator of a repository. 

### <a id="Commit" href="#Commit">type Commit struct</a>

```
searchKey: github.Commit
tags: [struct]
```

```Go
type Commit struct {
	OID             string
	Message         string
	MessageHeadline string
	URL             string
	Committer       GitActor
	CommittedDate   time.Time
	PushedDate      time.Time
}
```

A Commit in a Repository. 

### <a id="CommitStatus" href="#CommitStatus">type CommitStatus struct</a>

```
searchKey: github.CommitStatus
tags: [struct]
```

```Go
type CommitStatus struct {
	SHA        string
	Context    string
	State      string
	ReceivedAt time.Time
}
```

CommitStatus represents the state of a commit context received via the StatusEvent webhook 

#### <a id="CommitStatus.Key" href="#CommitStatus.Key">func (c *CommitStatus) Key() string</a>

```
searchKey: github.CommitStatus.Key
tags: [method]
```

```Go
func (c *CommitStatus) Key() string
```

### <a id="CommitWithChecks" href="#CommitWithChecks">type CommitWithChecks struct</a>

```
searchKey: github.CommitWithChecks
tags: [struct]
```

```Go
type CommitWithChecks struct {
	Commit struct {
		OID           string
		CheckSuites   struct{ Nodes []CheckSuite }
		Status        Status
		CommittedDate time.Time
	}
}
```

CommitWithChecks represents check/build status of a commit. When we load the PR from GitHub we fetch the most recent commit into this type to check build status. 

### <a id="Context" href="#Context">type Context struct</a>

```
searchKey: github.Context
tags: [struct]
```

```Go
type Context struct {
	ID          string
	Context     string
	Description string
	State       string
}
```

Context represent the individual commit status context 

### <a id="ConvertToDraftEvent" href="#ConvertToDraftEvent">type ConvertToDraftEvent struct</a>

```
searchKey: github.ConvertToDraftEvent
tags: [struct]
```

```Go
type ConvertToDraftEvent struct {
	Actor     Actor
	CreatedAt time.Time
}
```

ConvertToDraftEvent represents a 'convert_to_draft' event on a pull request. 

#### <a id="ConvertToDraftEvent.Key" href="#ConvertToDraftEvent.Key">func (e ConvertToDraftEvent) Key() string</a>

```
searchKey: github.ConvertToDraftEvent.Key
tags: [method]
```

```Go
func (e ConvertToDraftEvent) Key() string
```

Key is a unique key identifying this event in the context of its pull request. 

### <a id="CreatePullRequestInput" href="#CreatePullRequestInput">type CreatePullRequestInput struct</a>

```
searchKey: github.CreatePullRequestInput
tags: [struct]
```

```Go
type CreatePullRequestInput struct {
	// The Node ID of the repository.
	RepositoryID string `json:"repositoryId"`
	// The name of the branch you want your changes pulled into. This should be
	// an existing branch on the current repository.
	BaseRefName string `json:"baseRefName"`
	// The name of the branch where your changes are implemented.
	HeadRefName string `json:"headRefName"`
	// The title of the pull request.
	Title string `json:"title"`
	// The body of the pull request (optional).
	Body string `json:"body"`
	// When true the PR will be in draft mode initially.
	Draft bool `json:"draft"`
}
```

### <a id="ErrPullRequestNotFound" href="#ErrPullRequestNotFound">type ErrPullRequestNotFound int</a>

```
searchKey: github.ErrPullRequestNotFound
tags: [number]
```

```Go
type ErrPullRequestNotFound int
```

ErrPullRequestNotFound is when the requested GitHub Pull Request doesn't exist. 

#### <a id="ErrPullRequestNotFound.Error" href="#ErrPullRequestNotFound.Error">func (e ErrPullRequestNotFound) Error() string</a>

```
searchKey: github.ErrPullRequestNotFound.Error
tags: [method]
```

```Go
func (e ErrPullRequestNotFound) Error() string
```

### <a id="GitActor" href="#GitActor">type GitActor struct</a>

```
searchKey: github.GitActor
tags: [struct]
```

```Go
type GitActor struct {
	AvatarURL string
	Email     string
	Name      string
	User      *Actor `json:"User,omitempty"`
}
```

A GitActor represents an actor in a Git commit (ie. an author or committer). 

### <a id="IssueComment" href="#IssueComment">type IssueComment struct</a>

```
searchKey: github.IssueComment
tags: [struct]
```

```Go
type IssueComment struct {
	DatabaseID          int64
	Author              Actor
	Editor              *Actor
	AuthorAssociation   string
	Body                string
	URL                 string
	CreatedAt           time.Time
	UpdatedAt           time.Time
	IncludesCreatedEdit bool
}
```

IssueComment represents a comment on an PullRequest that isn't a commit or review comment. 

#### <a id="IssueComment.Key" href="#IssueComment.Key">func (e IssueComment) Key() string</a>

```
searchKey: github.IssueComment.Key
tags: [method]
```

```Go
func (e IssueComment) Key() string
```

Key is a unique key identifying this event in the context of its pull request. 

### <a id="Label" href="#Label">type Label struct</a>

```
searchKey: github.Label
tags: [struct]
```

```Go
type Label struct {
	ID          string
	Color       string
	Description string
	Name        string
}
```

### <a id="LabelEvent" href="#LabelEvent">type LabelEvent struct</a>

```
searchKey: github.LabelEvent
tags: [struct]
```

```Go
type LabelEvent struct {
	Actor     Actor
	Label     Label
	CreatedAt time.Time
	// Will be true if we had an "unlabeled" event
	Removed bool
}
```

LabelEvent represents a label being added or removed from a pull request 

#### <a id="LabelEvent.Key" href="#LabelEvent.Key">func (e LabelEvent) Key() string</a>

```
searchKey: github.LabelEvent.Key
tags: [method]
```

```Go
func (e LabelEvent) Key() string
```

### <a id="MergedEvent" href="#MergedEvent">type MergedEvent struct</a>

```
searchKey: github.MergedEvent
tags: [struct]
```

```Go
type MergedEvent struct {
	Actor        Actor
	MergeRefName string
	URL          string
	Commit       Commit
	CreatedAt    time.Time
}
```

MergedEvent represents a 'merged' event on a given pull request. 

#### <a id="MergedEvent.Key" href="#MergedEvent.Key">func (e MergedEvent) Key() string</a>

```
searchKey: github.MergedEvent.Key
tags: [method]
```

```Go
func (e MergedEvent) Key() string
```

Key is a unique key identifying this event in the context of its pull request. 

### <a id="Org" href="#Org">type Org struct</a>

```
searchKey: github.Org
tags: [struct]
```

```Go
type Org struct {
	Login string `json:"login,omitempty"`
}
```

### <a id="PageInfo" href="#PageInfo">type PageInfo struct</a>

```
searchKey: github.PageInfo
tags: [struct]
```

```Go
type PageInfo struct {
	HasNextPage bool
	EndCursor   string
}
```

PageInfo contains the paging information based on the Redux conventions. 

### <a id="PullRequest" href="#PullRequest">type PullRequest struct</a>

```
searchKey: github.PullRequest
tags: [struct]
```

```Go
type PullRequest struct {
	RepoWithOwner string `json:"-"`
	ID            string
	Title         string
	Body          string
	State         string
	URL           string
	HeadRefOid    string
	BaseRefOid    string
	HeadRefName   string
	BaseRefName   string
	Number        int64
	Author        Actor
	Participants  []Actor
	Labels        struct{ Nodes []Label }
	TimelineItems []TimelineItem
	Commits       struct{ Nodes []CommitWithChecks }
	IsDraft       bool
	CreatedAt     time.Time
	UpdatedAt     time.Time
}
```

PullRequest is a GitHub pull request. 

### <a id="PullRequestCommit" href="#PullRequestCommit">type PullRequestCommit struct</a>

```
searchKey: github.PullRequestCommit
tags: [struct]
```

```Go
type PullRequestCommit struct {
	Commit Commit
}
```

#### <a id="PullRequestCommit.Key" href="#PullRequestCommit.Key">func (p PullRequestCommit) Key() string</a>

```
searchKey: github.PullRequestCommit.Key
tags: [method]
```

```Go
func (p PullRequestCommit) Key() string
```

### <a id="PullRequestReview" href="#PullRequestReview">type PullRequestReview struct</a>

```
searchKey: github.PullRequestReview
tags: [struct]
```

```Go
type PullRequestReview struct {
	DatabaseID          int64
	Author              Actor
	AuthorAssociation   string
	Body                string
	State               string
	URL                 string
	CreatedAt           time.Time
	UpdatedAt           time.Time
	Commit              Commit
	IncludesCreatedEdit bool
}
```

PullRequestReview represents a review on a given pull request. 

#### <a id="PullRequestReview.Key" href="#PullRequestReview.Key">func (e PullRequestReview) Key() string</a>

```
searchKey: github.PullRequestReview.Key
tags: [method]
```

```Go
func (e PullRequestReview) Key() string
```

Key is a unique key identifying this event in the context of its pull request. 

### <a id="PullRequestReviewComment" href="#PullRequestReviewComment">type PullRequestReviewComment struct</a>

```
searchKey: github.PullRequestReviewComment
tags: [struct]
```

```Go
type PullRequestReviewComment struct {
	DatabaseID          int64
	Author              Actor
	AuthorAssociation   string
	Editor              Actor
	Commit              Commit
	Body                string
	State               string
	URL                 string
	CreatedAt           time.Time
	UpdatedAt           time.Time
	IncludesCreatedEdit bool
}
```

PullRequestReviewComment represents a review comment on a given pull request. 

#### <a id="PullRequestReviewComment.Key" href="#PullRequestReviewComment.Key">func (e PullRequestReviewComment) Key() string</a>

```
searchKey: github.PullRequestReviewComment.Key
tags: [method]
```

```Go
func (e PullRequestReviewComment) Key() string
```

Key is a unique key identifying this event in the context of its pull request. 

### <a id="PullRequestReviewThread" href="#PullRequestReviewThread">type PullRequestReviewThread struct</a>

```
searchKey: github.PullRequestReviewThread
tags: [struct]
```

```Go
type PullRequestReviewThread struct {
	Comments []*PullRequestReviewComment
}
```

PullRequestReviewThread represents a thread of review comments on a given pull request. Since webhooks only send pull request review comment payloads, we normalize each thread we receive via GraphQL, and don't store this event as the metadata of a ChangesetEvent, instead storing each contained comment as a separate ChangesetEvent. That's why this type doesn't have a Key method like the others. 

### <a id="ReadyForReviewEvent" href="#ReadyForReviewEvent">type ReadyForReviewEvent struct</a>

```
searchKey: github.ReadyForReviewEvent
tags: [struct]
```

```Go
type ReadyForReviewEvent struct {
	Actor     Actor
	CreatedAt time.Time
}
```

ReadyForReviewEvent represents a 'ready_for_review' event on a pull request. 

#### <a id="ReadyForReviewEvent.Key" href="#ReadyForReviewEvent.Key">func (e ReadyForReviewEvent) Key() string</a>

```
searchKey: github.ReadyForReviewEvent.Key
tags: [method]
```

```Go
func (e ReadyForReviewEvent) Key() string
```

Key is a unique key identifying this event in the context of its pull request. 

### <a id="RenamedTitleEvent" href="#RenamedTitleEvent">type RenamedTitleEvent struct</a>

```
searchKey: github.RenamedTitleEvent
tags: [struct]
```

```Go
type RenamedTitleEvent struct {
	Actor         Actor
	PreviousTitle string
	CurrentTitle  string
	CreatedAt     time.Time
}
```

RenamedTitleEvent represents a 'renamed' event on a given pull request. 

#### <a id="RenamedTitleEvent.Key" href="#RenamedTitleEvent.Key">func (e RenamedTitleEvent) Key() string</a>

```
searchKey: github.RenamedTitleEvent.Key
tags: [method]
```

```Go
func (e RenamedTitleEvent) Key() string
```

Key is a unique key identifying this event in the context of its pull request. 

### <a id="ReopenedEvent" href="#ReopenedEvent">type ReopenedEvent struct</a>

```
searchKey: github.ReopenedEvent
tags: [struct]
```

```Go
type ReopenedEvent struct {
	Actor     Actor
	CreatedAt time.Time
}
```

ReopenedEvent represents a 'reopened' event on a pull request. 

#### <a id="ReopenedEvent.Key" href="#ReopenedEvent.Key">func (e ReopenedEvent) Key() string</a>

```
searchKey: github.ReopenedEvent.Key
tags: [method]
```

```Go
func (e ReopenedEvent) Key() string
```

Key is a unique key identifying this event in the context of its pull request. 

### <a id="Repository" href="#Repository">type Repository struct</a>

```
searchKey: github.Repository
tags: [struct]
```

```Go
type Repository struct {
	ID            string // ID of repository (GitHub GraphQL ID, not GitHub database ID)
	DatabaseID    int64  // The integer database id
	NameWithOwner string // full name of repository ("owner/name")
	Description   string // description of repository
	URL           string // the web URL of this repository ("https://github.com/foo/bar")
	IsPrivate     bool   // whether the repository is private
	IsFork        bool   // whether the repository is a fork of another repository
	IsArchived    bool   // whether the repository is archived on the code host
	IsLocked      bool   `json:"-"` // whether the repository is locked on the code host
	IsDisabled    bool   `json:"-"` // whether the repository is disabled on the code host
	// This field will always be blank on repos stored in our database because the value will be different
	// depending on which token was used to fetch it
	ViewerPermission string // ADMIN, WRITE, READ, or empty if unknown. Only the graphql api populates this. https://developer.github.com/v4/enum/repositorypermission/

	// Metadata retained for ranking
	StargazerCount int `json:",omitempty"`
	ForkCount      int `json:",omitempty"`
}
```

Repository is a GitHub repository. 

#### <a id="convertRestRepo" href="#convertRestRepo">func convertRestRepo(restRepo restRepository) *Repository</a>

```
searchKey: github.convertRestRepo
tags: [function private]
```

```Go
func convertRestRepo(restRepo restRepository) *Repository
```

convertRestRepo converts repo information returned by the rest API to a standard format. 

### <a id="RepositoryListPage" href="#RepositoryListPage">type RepositoryListPage struct</a>

```
searchKey: github.RepositoryListPage
tags: [struct]
```

```Go
type RepositoryListPage struct {
	TotalCount  int
	Repos       []*Repository
	HasNextPage bool
}
```

RepositoryListPage is a page of repositories returned from the GitHub Search API. 

### <a id="Review" href="#Review">type Review struct</a>

```
searchKey: github.Review
tags: [struct]
```

```Go
type Review struct {
	Body        string
	State       string
	URL         string
	Author      Actor
	Commit      Commit
	CreatedAt   time.Time
	SubmittedAt time.Time
}
```

A Review of a PullRequest. 

### <a id="ReviewDismissedEvent" href="#ReviewDismissedEvent">type ReviewDismissedEvent struct</a>

```
searchKey: github.ReviewDismissedEvent
tags: [struct]
```

```Go
type ReviewDismissedEvent struct {
	Actor            Actor
	Review           PullRequestReview
	DismissalMessage string
	CreatedAt        time.Time
}
```

ReviewDismissedEvent represents a 'review_dismissed' event on a pull request. 

#### <a id="ReviewDismissedEvent.Key" href="#ReviewDismissedEvent.Key">func (e ReviewDismissedEvent) Key() string</a>

```
searchKey: github.ReviewDismissedEvent.Key
tags: [method]
```

```Go
func (e ReviewDismissedEvent) Key() string
```

Key is a unique key identifying this event in the context of its pull request. 

### <a id="ReviewRequestRemovedEvent" href="#ReviewRequestRemovedEvent">type ReviewRequestRemovedEvent struct</a>

```
searchKey: github.ReviewRequestRemovedEvent
tags: [struct]
```

```Go
type ReviewRequestRemovedEvent struct {
	Actor             Actor
	RequestedReviewer Actor
	RequestedTeam     Team
	CreatedAt         time.Time
}
```

ReviewRequestRemovedEvent represents a 'review_request_removed' event on a pull request. 

#### <a id="ReviewRequestRemovedEvent.Key" href="#ReviewRequestRemovedEvent.Key">func (e ReviewRequestRemovedEvent) Key() string</a>

```
searchKey: github.ReviewRequestRemovedEvent.Key
tags: [method]
```

```Go
func (e ReviewRequestRemovedEvent) Key() string
```

Key is a unique key identifying this event in the context of its pull request. 

### <a id="ReviewRequestedEvent" href="#ReviewRequestedEvent">type ReviewRequestedEvent struct</a>

```
searchKey: github.ReviewRequestedEvent
tags: [struct]
```

```Go
type ReviewRequestedEvent struct {
	Actor             Actor
	RequestedReviewer Actor
	RequestedTeam     Team
	CreatedAt         time.Time
}
```

ReviewRequestedRevent represents a 'review_requested' event on a pull request. 

#### <a id="ReviewRequestedEvent.Key" href="#ReviewRequestedEvent.Key">func (e ReviewRequestedEvent) Key() string</a>

```
searchKey: github.ReviewRequestedEvent.Key
tags: [method]
```

```Go
func (e ReviewRequestedEvent) Key() string
```

Key is a unique key identifying this event in the context of its pull request. 

#### <a id="ReviewRequestedEvent.ReviewerDeleted" href="#ReviewRequestedEvent.ReviewerDeleted">func (e ReviewRequestedEvent) ReviewerDeleted() bool</a>

```
searchKey: github.ReviewRequestedEvent.ReviewerDeleted
tags: [method]
```

```Go
func (e ReviewRequestedEvent) ReviewerDeleted() bool
```

ReviewerDeleted returns true if both RequestedReviewer and RequestedTeam are blank, indicating that one or the other has been deleted. We use it to drop the event. 

### <a id="Status" href="#Status">type Status struct</a>

```
searchKey: github.Status
tags: [struct]
```

```Go
type Status struct {
	State    string
	Contexts []Context
}
```

A Status represents a Commit status. 

### <a id="Team" href="#Team">type Team struct</a>

```
searchKey: github.Team
tags: [struct]
```

```Go
type Team struct {
	Name string
	URL  string
}
```

A Team represents a team on Github. 

### <a id="TimelineItem" href="#TimelineItem">type TimelineItem struct</a>

```
searchKey: github.TimelineItem
tags: [struct]
```

```Go
type TimelineItem struct {
	Type string
	Item interface{}
}
```

TimelineItem is a union type of all supported pull request timeline items. 

#### <a id="TimelineItem.UnmarshalJSON" href="#TimelineItem.UnmarshalJSON">func (i *TimelineItem) UnmarshalJSON(data []byte) error</a>

```
searchKey: github.TimelineItem.UnmarshalJSON
tags: [method]
```

```Go
func (i *TimelineItem) UnmarshalJSON(data []byte) error
```

UnmarshalJSON knows how to unmarshal a TimelineItem as produced by json.Marshal or as returned by the GitHub GraphQL API. 

### <a id="TimelineItemConnection" href="#TimelineItemConnection">type TimelineItemConnection struct</a>

```
searchKey: github.TimelineItemConnection
tags: [struct]
```

```Go
type TimelineItemConnection struct {
	PageInfo PageInfo
	Nodes    []TimelineItem
}
```

### <a id="UnassignedEvent" href="#UnassignedEvent">type UnassignedEvent struct</a>

```
searchKey: github.UnassignedEvent
tags: [struct]
```

```Go
type UnassignedEvent struct {
	Actor     Actor
	Assignee  Actor
	CreatedAt time.Time
}
```

UnassignedEvent represents an 'unassigned' event on a pull request. 

#### <a id="UnassignedEvent.Key" href="#UnassignedEvent.Key">func (e UnassignedEvent) Key() string</a>

```
searchKey: github.UnassignedEvent.Key
tags: [method]
```

```Go
func (e UnassignedEvent) Key() string
```

Key is a unique key identifying this event in the context of its pull request. 

### <a id="UpdatePullRequestInput" href="#UpdatePullRequestInput">type UpdatePullRequestInput struct</a>

```
searchKey: github.UpdatePullRequestInput
tags: [struct]
```

```Go
type UpdatePullRequestInput struct {
	// The Node ID of the pull request.
	PullRequestID string `json:"pullRequestId"`
	// The name of the branch you want your changes pulled into. This should be
	// an existing branch on the current repository.
	BaseRefName string `json:"baseRefName"`
	// The title of the pull request.
	Title string `json:"title"`
	// The body of the pull request (optional).
	Body string `json:"body"`
}
```

### <a id="User" href="#User">type User struct</a>

```
searchKey: github.User
tags: [struct]
```

```Go
type User struct {
	Login  string `json:"login,omitempty"`
	ID     int    `json:"id,omitempty"`
	NodeID string `json:"node_id,omitempty"`
}
```

### <a id="UserEmail" href="#UserEmail">type UserEmail struct</a>

```
searchKey: github.UserEmail
tags: [struct]
```

```Go
type UserEmail struct {
	Email      string `json:"email,omitempty"`
	Primary    bool   `json:"primary,omitempty"`
	Verified   bool   `json:"verified,omitempty"`
	Visibility string `json:"visibility,omitempty"`
}
```

### <a id="V3Client" href="#V3Client">type V3Client struct</a>

```
searchKey: github.V3Client
tags: [struct]
```

```Go
type V3Client struct {
	// apiURL is the base URL of a GitHub API. It must point to the base URL of the GitHub API. This
	// is https://api.github.com for GitHub.com and http[s]://[github-enterprise-hostname]/api for
	// GitHub Enterprise.
	apiURL *url.URL

	// githubDotCom is true if this client connects to github.com.
	githubDotCom bool

	// auth is used to authenticate requests. May be empty, in which case the
	// default behavior is to make unauthenticated requests.
	// 🚨 SECURITY: Should not be changed after client creation to prevent
	// unauthorized access to the repository cache. Use `WithAuthenticator` to
	// create a new client with a different authenticator instead.
	auth auth.Authenticator

	// httpClient is the HTTP client used to make requests to the GitHub API.
	httpClient httpcli.Doer

	// repoCache is the repository cache associated with the token.
	repoCache *rcache.Cache

	// rateLimitMonitor is the API rate limit monitor.
	rateLimitMonitor *ratelimit.Monitor

	// rateLimit is our self imposed rate limiter
	rateLimit *rate.Limiter

	// resource specifies which API this client is intended for.
	// One of 'rest' or 'search'.
	resource string
}
```

V3Client is a caching GitHub API client for GitHub's REST API v3. 

All instances use a map of rcache.Cache instances for caching (see the `repoCache` field). These separate instances have consistent naming prefixes so that different instances will share the same Redis cache entries (provided they were computed with the same API URL and access token). The cache keys are agnostic of the http.RoundTripper transport. 

#### <a id="NewV3Client" href="#NewV3Client">func NewV3Client(apiURL *url.URL, a auth.Authenticator, cli httpcli.Doer) *V3Client</a>

```
searchKey: github.NewV3Client
tags: [function]
```

```Go
func NewV3Client(apiURL *url.URL, a auth.Authenticator, cli httpcli.Doer) *V3Client
```

NewV3Client creates a new GitHub API client with an optional default authenticator. 

apiURL must point to the base URL of the GitHub API. See the docstring for V3Client.apiURL. 

#### <a id="NewV3SearchClient" href="#NewV3SearchClient">func NewV3SearchClient(apiURL *url.URL, a auth.Authenticator, cli httpcli.Doer) *V3Client</a>

```
searchKey: github.NewV3SearchClient
tags: [function]
```

```Go
func NewV3SearchClient(apiURL *url.URL, a auth.Authenticator, cli httpcli.Doer) *V3Client
```

NewV3SearchClient creates a new GitHub API client intended for use with the search API with an optional default authenticator. 

apiURL must point to the base URL of the GitHub API. See the docstring for V3Client.apiURL. 

#### <a id="newTestClient" href="#newTestClient">func newTestClient(t *testing.T, cli httpcli.Doer) *V3Client</a>

```
searchKey: github.newTestClient
tags: [function private]
```

```Go
func newTestClient(t *testing.T, cli httpcli.Doer) *V3Client
```

#### <a id="newTestClientWithAuthenticator" href="#newTestClientWithAuthenticator">func newTestClientWithAuthenticator(t *testing.T, auth auth.Authenticator, cli httpcli.Doer) *V3Client</a>

```
searchKey: github.newTestClientWithAuthenticator
tags: [function private]
```

```Go
func newTestClientWithAuthenticator(t *testing.T, auth auth.Authenticator, cli httpcli.Doer) *V3Client
```

#### <a id="newV3Client" href="#newV3Client">func newV3Client(apiURL *url.URL, a auth.Authenticator, resource string, cli httpcli.Doer) *V3Client</a>

```
searchKey: github.newV3Client
tags: [function private]
```

```Go
func newV3Client(apiURL *url.URL, a auth.Authenticator, resource string, cli httpcli.Doer) *V3Client
```

#### <a id="newV3TestClient" href="#newV3TestClient">func newV3TestClient(t testing.TB, name string) (*V3Client, func())</a>

```
searchKey: github.newV3TestClient
tags: [function private]
```

```Go
func newV3TestClient(t testing.TB, name string) (*V3Client, func())
```

#### <a id="V3Client.GetAuthenticatedUser" href="#V3Client.GetAuthenticatedUser">func (c *V3Client) GetAuthenticatedUser(ctx context.Context) (*User, error)</a>

```
searchKey: github.V3Client.GetAuthenticatedUser
tags: [method]
```

```Go
func (c *V3Client) GetAuthenticatedUser(ctx context.Context) (*User, error)
```

#### <a id="V3Client.GetAuthenticatedUserEmails" href="#V3Client.GetAuthenticatedUserEmails">func (c *V3Client) GetAuthenticatedUserEmails(ctx context.Context) ([]*UserEmail, error)</a>

```
searchKey: github.V3Client.GetAuthenticatedUserEmails
tags: [method]
```

```Go
func (c *V3Client) GetAuthenticatedUserEmails(ctx context.Context) ([]*UserEmail, error)
```

GetAuthenticatedUserEmails returns the first 100 emails associated with the currently authenticated user. 

#### <a id="V3Client.GetAuthenticatedUserOAuthScopes" href="#V3Client.GetAuthenticatedUserOAuthScopes">func (c *V3Client) GetAuthenticatedUserOAuthScopes(ctx context.Context) ([]string, error)</a>

```
searchKey: github.V3Client.GetAuthenticatedUserOAuthScopes
tags: [method]
```

```Go
func (c *V3Client) GetAuthenticatedUserOAuthScopes(ctx context.Context) ([]string, error)
```

GetAuthenticatedUserOAuthScopes gets the list of OAuth scopes granted to the currently authenticate user. 

#### <a id="V3Client.GetAuthenticatedUserOrgs" href="#V3Client.GetAuthenticatedUserOrgs">func (c *V3Client) GetAuthenticatedUserOrgs(ctx context.Context) ([]*Org, error)</a>

```
searchKey: github.V3Client.GetAuthenticatedUserOrgs
tags: [method]
```

```Go
func (c *V3Client) GetAuthenticatedUserOrgs(ctx context.Context) ([]*Org, error)
```

GetAuthenticatedUserOrgs returns the first 100 organizations associated with the currently authenticated user. 

#### <a id="V3Client.GetRepository" href="#V3Client.GetRepository">func (c *V3Client) GetRepository(ctx context.Context, owner, name string) (*Repository, error)</a>

```
searchKey: github.V3Client.GetRepository
tags: [method]
```

```Go
func (c *V3Client) GetRepository(ctx context.Context, owner, name string) (*Repository, error)
```

GetRepository gets a repository from GitHub by owner and repository name. 

#### <a id="V3Client.ListAffiliatedRepositories" href="#V3Client.ListAffiliatedRepositories">func (c *V3Client) ListAffiliatedRepositories(ctx context.Context, visibility Visibility, page int) (repos []*Repository,...</a>

```
searchKey: github.V3Client.ListAffiliatedRepositories
tags: [method]
```

```Go
func (c *V3Client) ListAffiliatedRepositories(ctx context.Context, visibility Visibility, page int) (
	repos []*Repository,
	hasNextPage bool,
	rateLimitCost int,
	err error,
)
```

ListAffiliatedRepositories lists GitHub repositories affiliated with the client token. page is the page of results to return. Pages are 1-indexed (so the first call should be for page 1). 

#### <a id="V3Client.ListInstallationRepositories" href="#V3Client.ListInstallationRepositories">func (c *V3Client) ListInstallationRepositories(ctx context.Context) ([]*Repository, error)</a>

```
searchKey: github.V3Client.ListInstallationRepositories
tags: [method]
```

```Go
func (c *V3Client) ListInstallationRepositories(ctx context.Context) ([]*Repository, error)
```

ListInstallationRepositories lists repositories on which the authenticated GitHub App has been installed. 

#### <a id="V3Client.ListOrgRepositories" href="#V3Client.ListOrgRepositories">func (c *V3Client) ListOrgRepositories(ctx context.Context, org string, page int) (repos []*Repository, hasNextPage bool, rateLimitCost int, err error)</a>

```
searchKey: github.V3Client.ListOrgRepositories
tags: [method]
```

```Go
func (c *V3Client) ListOrgRepositories(ctx context.Context, org string, page int) (repos []*Repository, hasNextPage bool, rateLimitCost int, err error)
```

ListOrgRepositories lists GitHub repositories from the specified organization. org is the name of the organization. page is the page of results to return. Pages are 1-indexed (so the first call should be for page 1). 

#### <a id="V3Client.ListPublicRepositories" href="#V3Client.ListPublicRepositories">func (c *V3Client) ListPublicRepositories(ctx context.Context, sinceRepoID int64) ([]*Repository, error)</a>

```
searchKey: github.V3Client.ListPublicRepositories
tags: [method]
```

```Go
func (c *V3Client) ListPublicRepositories(ctx context.Context, sinceRepoID int64) ([]*Repository, error)
```

#### <a id="V3Client.ListRepositoriesForSearch" href="#V3Client.ListRepositoriesForSearch">func (c *V3Client) ListRepositoriesForSearch(ctx context.Context, searchString string, page int) (RepositoryListPage, error)</a>

```
searchKey: github.V3Client.ListRepositoriesForSearch
tags: [method]
```

```Go
func (c *V3Client) ListRepositoriesForSearch(ctx context.Context, searchString string, page int) (RepositoryListPage, error)
```

#### <a id="V3Client.ListRepositoryCollaborators" href="#V3Client.ListRepositoryCollaborators">func (c *V3Client) ListRepositoryCollaborators(ctx context.Context, owner, repo string, page int) (users []*Collaborator, hasNextPage bool, _ error)</a>

```
searchKey: github.V3Client.ListRepositoryCollaborators
tags: [method]
```

```Go
func (c *V3Client) ListRepositoryCollaborators(ctx context.Context, owner, repo string, page int) (users []*Collaborator, hasNextPage bool, _ error)
```

ListRepositoryCollaborators lists all GitHub users that has access to the repository. The page is the page of results to return, and is 1-indexed (so the first call should be for page 1). 

#### <a id="V3Client.ListTopicsOnRepository" href="#V3Client.ListTopicsOnRepository">func (c *V3Client) ListTopicsOnRepository(ctx context.Context, ownerAndName string) ([]string, error)</a>

```
searchKey: github.V3Client.ListTopicsOnRepository
tags: [method]
```

```Go
func (c *V3Client) ListTopicsOnRepository(ctx context.Context, ownerAndName string) ([]string, error)
```

ListTopicsOnRepository lists topics on the given repository. 

#### <a id="V3Client.ListUserRepositories" href="#V3Client.ListUserRepositories">func (c *V3Client) ListUserRepositories(ctx context.Context, user string, page int) (repos []*Repository, hasNextPage bool, rateLimitCost int, err error)</a>

```
searchKey: github.V3Client.ListUserRepositories
tags: [method]
```

```Go
func (c *V3Client) ListUserRepositories(ctx context.Context, user string, page int) (repos []*Repository, hasNextPage bool, rateLimitCost int, err error)
```

ListUserRepositories lists GitHub repositories from the specified user. Pages are 1-indexed (so the first call should be for page 1) 

#### <a id="V3Client.RateLimitMonitor" href="#V3Client.RateLimitMonitor">func (c *V3Client) RateLimitMonitor() *ratelimit.Monitor</a>

```
searchKey: github.V3Client.RateLimitMonitor
tags: [method]
```

```Go
func (c *V3Client) RateLimitMonitor() *ratelimit.Monitor
```

RateLimitMonitor exposes the rate limit monitor. 

#### <a id="V3Client.WithAuthenticator" href="#V3Client.WithAuthenticator">func (c *V3Client) WithAuthenticator(a auth.Authenticator) *V3Client</a>

```
searchKey: github.V3Client.WithAuthenticator
tags: [method]
```

```Go
func (c *V3Client) WithAuthenticator(a auth.Authenticator) *V3Client
```

WithAuthenticator returns a new V3Client that uses the same configuration as the current V3Client, except authenticated as the GitHub user with the given authenticator instance (most likely a token). 

#### <a id="V3Client.addRepositoriesToCache" href="#V3Client.addRepositoriesToCache">func (c *V3Client) addRepositoriesToCache(repos []*Repository)</a>

```
searchKey: github.V3Client.addRepositoriesToCache
tags: [method private]
```

```Go
func (c *V3Client) addRepositoriesToCache(repos []*Repository)
```

addRepositoriesToCache will cache repositories that exist under relevant cache keys. 

#### <a id="V3Client.addRepositoryToCache" href="#V3Client.addRepositoryToCache">func (c *V3Client) addRepositoryToCache(keys []string, repo *cachedRepo)</a>

```
searchKey: github.V3Client.addRepositoryToCache
tags: [method private]
```

```Go
func (c *V3Client) addRepositoryToCache(keys []string, repo *cachedRepo)
```

addRepositoryToCache will cache the value for repo. The caller can provide multiple cache keys for the multiple ways that this repository can be retrieved (e.g., both "owner/name" and the GraphQL node ID). 

#### <a id="V3Client.cachedGetRepository" href="#V3Client.cachedGetRepository">func (c *V3Client) cachedGetRepository(ctx context.Context, key string, getRepositoryFromAPI func(ctx context.Context) (repo *Repository, keys []string, err error), nocache bool) (*Repository, error)</a>

```
searchKey: github.V3Client.cachedGetRepository
tags: [method private]
```

```Go
func (c *V3Client) cachedGetRepository(ctx context.Context, key string, getRepositoryFromAPI func(ctx context.Context) (repo *Repository, keys []string, err error), nocache bool) (*Repository, error)
```

cachedGetRepository caches the getRepositoryFromAPI call. 

#### <a id="V3Client.get" href="#V3Client.get">func (c *V3Client) get(ctx context.Context, requestURI string, result interface{}) (http.Header, error)</a>

```
searchKey: github.V3Client.get
tags: [method private]
```

```Go
func (c *V3Client) get(ctx context.Context, requestURI string, result interface{}) (http.Header, error)
```

#### <a id="V3Client.getPublicRepositories" href="#V3Client.getPublicRepositories">func (c *V3Client) getPublicRepositories(ctx context.Context, sinceRepoID int64) ([]*Repository, error)</a>

```
searchKey: github.V3Client.getPublicRepositories
tags: [method private]
```

```Go
func (c *V3Client) getPublicRepositories(ctx context.Context, sinceRepoID int64) ([]*Repository, error)
```

getPublicRepositories returns a page of public repositories that were created after the repository identified by sinceRepoID. An empty sinceRepoID returns the first page of results. This is only intended to be called for GitHub Enterprise, so no rate limit information is returned. [https://developer.github.com/v3/repos/#list-all-public-repositories](https://developer.github.com/v3/repos/#list-all-public-repositories) 

#### <a id="V3Client.getRepositoryFromAPI" href="#V3Client.getRepositoryFromAPI">func (c *V3Client) getRepositoryFromAPI(ctx context.Context, owner, name string) (*Repository, error)</a>

```
searchKey: github.V3Client.getRepositoryFromAPI
tags: [method private]
```

```Go
func (c *V3Client) getRepositoryFromAPI(ctx context.Context, owner, name string) (*Repository, error)
```

getRepositoryFromAPI attempts to fetch a repository from the GitHub API without use of the redis cache. 

#### <a id="V3Client.getRepositoryFromCache" href="#V3Client.getRepositoryFromCache">func (c *V3Client) getRepositoryFromCache(ctx context.Context, key string) *cachedRepo</a>

```
searchKey: github.V3Client.getRepositoryFromCache
tags: [method private]
```

```Go
func (c *V3Client) getRepositoryFromCache(ctx context.Context, key string) *cachedRepo
```

getRepositoryFromCache attempts to get a response from the redis cache. It returns nil error for cache-hit condition and non-nil error for cache-miss. 

#### <a id="V3Client.listRepositories" href="#V3Client.listRepositories">func (c *V3Client) listRepositories(ctx context.Context, requestURI string) ([]*Repository, error)</a>

```
searchKey: github.V3Client.listRepositories
tags: [method private]
```

```Go
func (c *V3Client) listRepositories(ctx context.Context, requestURI string) ([]*Repository, error)
```

listRepositories is a generic method that unmarshals the given JSON HTTP endpoint into a []restRepository. It will return an error if it fails. 

This is used to extract repositories from the GitHub API endpoints: - /users/:user/repos - /orgs/:org/repos - /user/repos 

#### <a id="V3Client.requestGet" href="#V3Client.requestGet">func (c *V3Client) requestGet(ctx context.Context, requestURI string, result interface{}) error</a>

```
searchKey: github.V3Client.requestGet
tags: [method private]
```

```Go
func (c *V3Client) requestGet(ctx context.Context, requestURI string, result interface{}) error
```

#### <a id="V3Client.requestGetWithHeader" href="#V3Client.requestGetWithHeader">func (c *V3Client) requestGetWithHeader(ctx context.Context, requestURI string, result interface{}) (http.Header, error)</a>

```
searchKey: github.V3Client.requestGetWithHeader
tags: [method private]
```

```Go
func (c *V3Client) requestGetWithHeader(ctx context.Context, requestURI string, result interface{}) (http.Header, error)
```

### <a id="V4Client" href="#V4Client">type V4Client struct</a>

```
searchKey: github.V4Client
tags: [struct]
```

```Go
type V4Client struct {
	// apiURL is the base URL of a GitHub API. It must point to the base URL of the GitHub API. This
	// is https://api.github.com for GitHub.com and http[s]://[github-enterprise-hostname]/api for
	// GitHub Enterprise.
	apiURL *url.URL

	// githubDotCom is true if this client connects to github.com.
	githubDotCom bool

	// auth is used to authenticate requests. May be empty, in which case the
	// default behavior is to make unauthenticated requests.
	// 🚨 SECURITY: Should not be changed after client creation to prevent
	// unauthorized access to the repository cache. Use `WithAuthenticator` to
	// create a new client with a different authenticator instead.
	auth auth.Authenticator

	// httpClient is the HTTP client used to make requests to the GitHub API.
	httpClient httpcli.Doer

	// rateLimitMonitor is the API rate limit monitor.
	rateLimitMonitor *ratelimit.Monitor

	// rateLimit is our self imposed rate limiter.
	rateLimit *rate.Limiter
}
```

V4Client is a GitHub GraphQL API client. 

#### <a id="NewV4Client" href="#NewV4Client">func NewV4Client(apiURL *url.URL, a auth.Authenticator, cli httpcli.Doer) *V4Client</a>

```
searchKey: github.NewV4Client
tags: [function]
```

```Go
func NewV4Client(apiURL *url.URL, a auth.Authenticator, cli httpcli.Doer) *V4Client
```

NewV4Client creates a new GitHub GraphQL API client with an optional default authenticator. 

apiURL must point to the base URL of the GitHub API. See the docstring for V4Client.apiURL. 

#### <a id="newV4Client" href="#newV4Client">func newV4Client(t testing.TB, name string) (*V4Client, func())</a>

```
searchKey: github.newV4Client
tags: [function private]
```

```Go
func newV4Client(t testing.TB, name string) (*V4Client, func())
```

#### <a id="V4Client.ClosePullRequest" href="#V4Client.ClosePullRequest">func (c *V4Client) ClosePullRequest(ctx context.Context, pr *PullRequest) error</a>

```
searchKey: github.V4Client.ClosePullRequest
tags: [method]
```

```Go
func (c *V4Client) ClosePullRequest(ctx context.Context, pr *PullRequest) error
```

ClosePullRequest closes the PullRequest on Github. 

#### <a id="V4Client.CreatePullRequest" href="#V4Client.CreatePullRequest">func (c *V4Client) CreatePullRequest(ctx context.Context, in *CreatePullRequestInput) (*PullRequest, error)</a>

```
searchKey: github.V4Client.CreatePullRequest
tags: [method]
```

```Go
func (c *V4Client) CreatePullRequest(ctx context.Context, in *CreatePullRequestInput) (*PullRequest, error)
```

CreatePullRequest creates a PullRequest on Github. 

#### <a id="V4Client.CreatePullRequestComment" href="#V4Client.CreatePullRequestComment">func (c *V4Client) CreatePullRequestComment(ctx context.Context, pr *PullRequest, body string) error</a>

```
searchKey: github.V4Client.CreatePullRequestComment
tags: [method]
```

```Go
func (c *V4Client) CreatePullRequestComment(ctx context.Context, pr *PullRequest, body string) error
```

CreatePullRequestComment creates a comment on the PullRequest on Github. 

#### <a id="V4Client.GetAuthenticatedUser" href="#V4Client.GetAuthenticatedUser">func (c *V4Client) GetAuthenticatedUser(ctx context.Context) (*Actor, error)</a>

```
searchKey: github.V4Client.GetAuthenticatedUser
tags: [method]
```

```Go
func (c *V4Client) GetAuthenticatedUser(ctx context.Context) (*Actor, error)
```

#### <a id="V4Client.GetOpenPullRequestByRefs" href="#V4Client.GetOpenPullRequestByRefs">func (c *V4Client) GetOpenPullRequestByRefs(ctx context.Context, owner, name, baseRef, headRef string) (*PullRequest, error)</a>

```
searchKey: github.V4Client.GetOpenPullRequestByRefs
tags: [method]
```

```Go
func (c *V4Client) GetOpenPullRequestByRefs(ctx context.Context, owner, name, baseRef, headRef string) (*PullRequest, error)
```

GetOpenPullRequestByRefs fetches the the pull request associated with the supplied refs. GitHub only allows one open PR by ref at a time. If nothing is found an error is returned. 

#### <a id="V4Client.GetReposByNameWithOwner" href="#V4Client.GetReposByNameWithOwner">func (c *V4Client) GetReposByNameWithOwner(ctx context.Context, namesWithOwners ...string) ([]*Repository, error)</a>

```
searchKey: github.V4Client.GetReposByNameWithOwner
tags: [method]
```

```Go
func (c *V4Client) GetReposByNameWithOwner(ctx context.Context, namesWithOwners ...string) ([]*Repository, error)
```

GetReposByNameWithOwner fetches the specified repositories (namesWithOwners) from the GitHub GraphQL API and returns a slice of repositories. If a repository is not found, it will return an error. 

The maximum number of repositories to be fetched is 30. If more namesWithOwners are given, the method returns an error. 30 is not a official limit of the API, but based on the observation that the GitHub GraphQL does not return results when more than 37 aliases are specified in a query. 30 is the conservative step back from 37. 

This method does not cache. 

#### <a id="V4Client.LoadPullRequest" href="#V4Client.LoadPullRequest">func (c *V4Client) LoadPullRequest(ctx context.Context, pr *PullRequest) error</a>

```
searchKey: github.V4Client.LoadPullRequest
tags: [method]
```

```Go
func (c *V4Client) LoadPullRequest(ctx context.Context, pr *PullRequest) error
```

LoadPullRequest loads a PullRequest from Github. 

#### <a id="V4Client.MarkPullRequestReadyForReview" href="#V4Client.MarkPullRequestReadyForReview">func (c *V4Client) MarkPullRequestReadyForReview(ctx context.Context, pr *PullRequest) error</a>

```
searchKey: github.V4Client.MarkPullRequestReadyForReview
tags: [method]
```

```Go
func (c *V4Client) MarkPullRequestReadyForReview(ctx context.Context, pr *PullRequest) error
```

MarkPullRequestReadyForReview marks the PullRequest on Github as ready for review. 

#### <a id="V4Client.MergePullRequest" href="#V4Client.MergePullRequest">func (c *V4Client) MergePullRequest(ctx context.Context, pr *PullRequest, squash bool) error</a>

```
searchKey: github.V4Client.MergePullRequest
tags: [method]
```

```Go
func (c *V4Client) MergePullRequest(ctx context.Context, pr *PullRequest, squash bool) error
```

MergePullRequest tries to merge the PullRequest on Github. 

#### <a id="V4Client.RateLimitMonitor" href="#V4Client.RateLimitMonitor">func (c *V4Client) RateLimitMonitor() *ratelimit.Monitor</a>

```
searchKey: github.V4Client.RateLimitMonitor
tags: [method]
```

```Go
func (c *V4Client) RateLimitMonitor() *ratelimit.Monitor
```

RateLimitMonitor exposes the rate limit monitor. 

#### <a id="V4Client.ReopenPullRequest" href="#V4Client.ReopenPullRequest">func (c *V4Client) ReopenPullRequest(ctx context.Context, pr *PullRequest) error</a>

```
searchKey: github.V4Client.ReopenPullRequest
tags: [method]
```

```Go
func (c *V4Client) ReopenPullRequest(ctx context.Context, pr *PullRequest) error
```

ReopenPullRequest reopens the PullRequest on Github. 

#### <a id="V4Client.UpdatePullRequest" href="#V4Client.UpdatePullRequest">func (c *V4Client) UpdatePullRequest(ctx context.Context, in *UpdatePullRequestInput) (*PullRequest, error)</a>

```
searchKey: github.V4Client.UpdatePullRequest
tags: [method]
```

```Go
func (c *V4Client) UpdatePullRequest(ctx context.Context, in *UpdatePullRequestInput) (*PullRequest, error)
```

UpdatePullRequest creates a PullRequest on Github. 

#### <a id="V4Client.WithAuthenticator" href="#V4Client.WithAuthenticator">func (c *V4Client) WithAuthenticator(a auth.Authenticator) *V4Client</a>

```
searchKey: github.V4Client.WithAuthenticator
tags: [method]
```

```Go
func (c *V4Client) WithAuthenticator(a auth.Authenticator) *V4Client
```

WithAuthenticator returns a new V4Client that uses the same configuration as the current V4Client, except authenticated as the GitHub user with the given authenticator instance (most likely a token). 

#### <a id="V4Client.buildGetReposBatchQuery" href="#V4Client.buildGetReposBatchQuery">func (c *V4Client) buildGetReposBatchQuery(ctx context.Context, namesWithOwners []string) (string, error)</a>

```
searchKey: github.V4Client.buildGetReposBatchQuery
tags: [method private]
```

```Go
func (c *V4Client) buildGetReposBatchQuery(ctx context.Context, namesWithOwners []string) (string, error)
```

#### <a id="V4Client.determineGitHubVersion" href="#V4Client.determineGitHubVersion">func (c *V4Client) determineGitHubVersion(ctx context.Context) *semver.Version</a>

```
searchKey: github.V4Client.determineGitHubVersion
tags: [method private]
```

```Go
func (c *V4Client) determineGitHubVersion(ctx context.Context) *semver.Version
```

determineGitHubVersion returns a *semver.Version for the targetted GitHub instance by this client. When an error occurs, we print a warning to the logs but don't fail and return the allMatchingSemver. 

#### <a id="V4Client.fetchGitHubVersion" href="#V4Client.fetchGitHubVersion">func (c *V4Client) fetchGitHubVersion(ctx context.Context) *semver.Version</a>

```
searchKey: github.V4Client.fetchGitHubVersion
tags: [method private]
```

```Go
func (c *V4Client) fetchGitHubVersion(ctx context.Context) *semver.Version
```

#### <a id="V4Client.loadRemainingTimelineItems" href="#V4Client.loadRemainingTimelineItems">func (c *V4Client) loadRemainingTimelineItems(ctx context.Context, prID string, pageInfo PageInfo) (items []TimelineItem, err error)</a>

```
searchKey: github.V4Client.loadRemainingTimelineItems
tags: [method private]
```

```Go
func (c *V4Client) loadRemainingTimelineItems(ctx context.Context, prID string, pageInfo PageInfo) (items []TimelineItem, err error)
```

#### <a id="V4Client.repositoryFieldsGraphQLFragment" href="#V4Client.repositoryFieldsGraphQLFragment">func (c *V4Client) repositoryFieldsGraphQLFragment(ctx context.Context) string</a>

```
searchKey: github.V4Client.repositoryFieldsGraphQLFragment
tags: [method private]
```

```Go
func (c *V4Client) repositoryFieldsGraphQLFragment(ctx context.Context) string
```

repositoryFieldsGraphQLFragment returns a GraphQL fragment that contains the fields needed to populate the Repository struct. 

#### <a id="V4Client.requestGraphQL" href="#V4Client.requestGraphQL">func (c *V4Client) requestGraphQL(ctx context.Context, query string, vars map[string]interface{}, result interface{}) (err error)</a>

```
searchKey: github.V4Client.requestGraphQL
tags: [method private]
```

```Go
func (c *V4Client) requestGraphQL(ctx context.Context, query string, vars map[string]interface{}, result interface{}) (err error)
```

### <a id="Visibility" href="#Visibility">type Visibility string</a>

```
searchKey: github.Visibility
tags: [string]
```

```Go
type Visibility string
```

Visibility is the visibility filter for listing repositories. 

### <a id="cachedRepo" href="#cachedRepo">type cachedRepo struct</a>

```
searchKey: github.cachedRepo
tags: [struct private]
```

```Go
type cachedRepo struct {
	Repository

	// NotFound indicates that the GitHub API reported that the repository was not found.
	NotFound bool
}
```

### <a id="disabledClient" href="#disabledClient">type disabledClient struct{}</a>

```
searchKey: github.disabledClient
tags: [struct private]
```

```Go
type disabledClient struct{}
```

#### <a id="disabledClient.Do" href="#disabledClient.Do">func (t disabledClient) Do(r *http.Request) (*http.Response, error)</a>

```
searchKey: github.disabledClient.Do
tags: [method private]
```

```Go
func (t disabledClient) Do(r *http.Request) (*http.Response, error)
```

### <a id="graphqlErrors" href="#graphqlErrors">type graphqlErrors []struct</a>

```
searchKey: github.graphqlErrors
tags: [array struct private]
```

```Go
type graphqlErrors []struct {
	Message   string        `json:"message"`
	Type      string        `json:"type"`
	Path      []interface{} `json:"path"`
	Locations []struct {
		Line   int `json:"line"`
		Column int `json:"column"`
	} `json:"locations,omitempty"`
}
```

graphqlErrors describes the errors in a GraphQL response. It contains at least 1 element when returned by requestGraphQL. See [https://graphql.github.io/graphql-spec/June2018/#sec-Errors](https://graphql.github.io/graphql-spec/June2018/#sec-Errors). 

#### <a id="graphqlErrors.Error" href="#graphqlErrors.Error">func (e graphqlErrors) Error() string</a>

```
searchKey: github.graphqlErrors.Error
tags: [method private]
```

```Go
func (e graphqlErrors) Error() string
```

### <a id="limitDepth" href="#limitDepth">type limitDepth struct</a>

```
searchKey: github.limitDepth
tags: [struct private]
```

```Go
type limitDepth struct {
	// The 'first' or 'last' limit
	limit int
	// The depth at which it was added
	depth int
}
```

### <a id="mockHTTPEmptyResponse" href="#mockHTTPEmptyResponse">type mockHTTPEmptyResponse struct</a>

```
searchKey: github.mockHTTPEmptyResponse
tags: [struct private]
```

```Go
type mockHTTPEmptyResponse struct {
	statusCode int
}
```

#### <a id="mockHTTPEmptyResponse.Do" href="#mockHTTPEmptyResponse.Do">func (s mockHTTPEmptyResponse) Do(req *http.Request) (*http.Response, error)</a>

```
searchKey: github.mockHTTPEmptyResponse.Do
tags: [method private]
```

```Go
func (s mockHTTPEmptyResponse) Do(req *http.Request) (*http.Response, error)
```

### <a id="mockHTTPResponseBody" href="#mockHTTPResponseBody">type mockHTTPResponseBody struct</a>

```
searchKey: github.mockHTTPResponseBody
tags: [struct private]
```

```Go
type mockHTTPResponseBody struct {
	count        int
	responseBody string
	status       int
}
```

#### <a id="mockHTTPResponseBody.Do" href="#mockHTTPResponseBody.Do">func (s *mockHTTPResponseBody) Do(req *http.Request) (*http.Response, error)</a>

```
searchKey: github.mockHTTPResponseBody.Do
tags: [method private]
```

```Go
func (s *mockHTTPResponseBody) Do(req *http.Request) (*http.Response, error)
```

### <a id="restRepository" href="#restRepository">type restRepository struct</a>

```
searchKey: github.restRepository
tags: [struct private]
```

```Go
type restRepository struct {
	ID          string `json:"node_id"` // GraphQL ID
	DatabaseID  int64  `json:"id"`
	FullName    string `json:"full_name"` // same as nameWithOwner
	Description string
	HTMLURL     string                    `json:"html_url"` // web URL
	Private     bool                      `json:"private"`
	Fork        bool                      `json:"fork"`
	Archived    bool                      `json:"archived"`
	Locked      bool                      `json:"locked"`
	Disabled    bool                      `json:"disabled"`
	Permissions restRepositoryPermissions `json:"permissions"`
	Stars       int                       `json:"stargazers_count"`
	Forks       int                       `json:"forks_count"`
}
```

### <a id="restRepositoryPermissions" href="#restRepositoryPermissions">type restRepositoryPermissions struct</a>

```
searchKey: github.restRepositoryPermissions
tags: [struct private]
```

```Go
type restRepositoryPermissions struct {
	Admin bool `json:"admin"`
	Push  bool `json:"push"`
	Pull  bool `json:"pull"`
}
```

### <a id="restSearchResponse" href="#restSearchResponse">type restSearchResponse struct</a>

```
searchKey: github.restSearchResponse
tags: [struct private]
```

```Go
type restSearchResponse struct {
	TotalCount        int              `json:"total_count"`
	IncompleteResults bool             `json:"incomplete_results"`
	Items             []restRepository `json:"items"`
}
```

### <a id="restTopicsResponse" href="#restTopicsResponse">type restTopicsResponse struct</a>

```
searchKey: github.restTopicsResponse
tags: [struct private]
```

```Go
type restTopicsResponse struct {
	Names []string `json:"names"`
}
```

### <a id="versionCache" href="#versionCache">type versionCache struct</a>

```
searchKey: github.versionCache
tags: [struct private]
```

```Go
type versionCache struct {
	mu        sync.Mutex
	versions  map[string]*semver.Version
	lastReset time.Time
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="APIRoot" href="#APIRoot">func APIRoot(baseURL *url.URL) (apiURL *url.URL, githubDotCom bool)</a>

```
searchKey: github.APIRoot
tags: [function]
```

```Go
func APIRoot(baseURL *url.URL) (apiURL *url.URL, githubDotCom bool)
```

APIRoot returns the root URL of the API using the base URL of the GitHub instance. 

### <a id="ExternalRepoSpec" href="#ExternalRepoSpec">func ExternalRepoSpec(repo *Repository, baseURL *url.URL) api.ExternalRepoSpec</a>

```
searchKey: github.ExternalRepoSpec
tags: [function]
```

```Go
func ExternalRepoSpec(repo *Repository, baseURL *url.URL) api.ExternalRepoSpec
```

ExternalRepoSpec returns an api.ExternalRepoSpec that refers to the specified GitHub repository. 

### <a id="GetExternalAccountData" href="#GetExternalAccountData">func GetExternalAccountData(data *extsvc.AccountData) (usr *github.User, tok *oauth2.Token, err error)</a>

```
searchKey: github.GetExternalAccountData
tags: [function]
```

```Go
func GetExternalAccountData(data *extsvc.AccountData) (usr *github.User, tok *oauth2.Token, err error)
```

### <a id="HTTPErrorCode" href="#HTTPErrorCode">func HTTPErrorCode(err error) int</a>

```
searchKey: github.HTTPErrorCode
tags: [function]
```

```Go
func HTTPErrorCode(err error) int
```

HTTPErrorCode returns err's HTTP status code, if it is an HTTP error from this package. Otherwise it returns 0. 

### <a id="IsNotFound" href="#IsNotFound">func IsNotFound(err error) bool</a>

```
searchKey: github.IsNotFound
tags: [function]
```

```Go
func IsNotFound(err error) bool
```

IsNotFound reports whether err is a GitHub API error of type NOT_FOUND, the equivalent cached response error, or HTTP 404. 

### <a id="IsNotMergeable" href="#IsNotMergeable">func IsNotMergeable(err error) bool</a>

```
searchKey: github.IsNotMergeable
tags: [function]
```

```Go
func IsNotMergeable(err error) bool
```

IsNotMergeable reports whether err is a GitHub API error reporting that a PR was not in a mergeable state. 

### <a id="IsRateLimitExceeded" href="#IsRateLimitExceeded">func IsRateLimitExceeded(err error) bool</a>

```
searchKey: github.IsRateLimitExceeded
tags: [function]
```

```Go
func IsRateLimitExceeded(err error) bool
```

IsRateLimitExceeded reports whether err is a GitHub API error reporting that the GitHub API rate limit was exceeded. 

### <a id="SetExternalAccountData" href="#SetExternalAccountData">func SetExternalAccountData(data *extsvc.AccountData, user *github.User, token *oauth2.Token)</a>

```
searchKey: github.SetExternalAccountData
tags: [function]
```

```Go
func SetExternalAccountData(data *extsvc.AccountData, user *github.User, token *oauth2.Token)
```

### <a id="SplitRepositoryNameWithOwner" href="#SplitRepositoryNameWithOwner">func SplitRepositoryNameWithOwner(nameWithOwner string) (owner, repo string, err error)</a>

```
searchKey: github.SplitRepositoryNameWithOwner
tags: [function]
```

```Go
func SplitRepositoryNameWithOwner(nameWithOwner string) (owner, repo string, err error)
```

SplitRepositoryNameWithOwner splits a GitHub repository's "owner/name" string into "owner" and "name", with validation. 

### <a id="TestClient_GetReposByNameWithOwner" href="#TestClient_GetReposByNameWithOwner">func TestClient_GetReposByNameWithOwner(t *testing.T)</a>

```
searchKey: github.TestClient_GetReposByNameWithOwner
tags: [function private test]
```

```Go
func TestClient_GetReposByNameWithOwner(t *testing.T)
```

### <a id="TestClient_GetRepository" href="#TestClient_GetRepository">func TestClient_GetRepository(t *testing.T)</a>

```
searchKey: github.TestClient_GetRepository
tags: [function private test]
```

```Go
func TestClient_GetRepository(t *testing.T)
```

TestClient_GetRepository tests the behavior of GetRepository. 

### <a id="TestClient_GetRepository_nonexistent" href="#TestClient_GetRepository_nonexistent">func TestClient_GetRepository_nonexistent(t *testing.T)</a>

```
searchKey: github.TestClient_GetRepository_nonexistent
tags: [function private test]
```

```Go
func TestClient_GetRepository_nonexistent(t *testing.T)
```

TestClient_GetRepository_nonexistent tests the behavior of GetRepository when called on a repository that does not exist. 

### <a id="TestClient_ListOrgRepositories" href="#TestClient_ListOrgRepositories">func TestClient_ListOrgRepositories(t *testing.T)</a>

```
searchKey: github.TestClient_ListOrgRepositories
tags: [function private test]
```

```Go
func TestClient_ListOrgRepositories(t *testing.T)
```

### <a id="TestClient_ListRepositoriesForSearch" href="#TestClient_ListRepositoriesForSearch">func TestClient_ListRepositoriesForSearch(t *testing.T)</a>

```
searchKey: github.TestClient_ListRepositoriesForSearch
tags: [function private test]
```

```Go
func TestClient_ListRepositoriesForSearch(t *testing.T)
```

### <a id="TestClient_ListRepositoriesForSearch_incomplete" href="#TestClient_ListRepositoriesForSearch_incomplete">func TestClient_ListRepositoriesForSearch_incomplete(t *testing.T)</a>

```
searchKey: github.TestClient_ListRepositoriesForSearch_incomplete
tags: [function private test]
```

```Go
func TestClient_ListRepositoriesForSearch_incomplete(t *testing.T)
```

### <a id="TestClient_buildGetRepositoriesBatchQuery" href="#TestClient_buildGetRepositoriesBatchQuery">func TestClient_buildGetRepositoriesBatchQuery(t *testing.T)</a>

```
searchKey: github.TestClient_buildGetRepositoriesBatchQuery
tags: [function private test]
```

```Go
func TestClient_buildGetRepositoriesBatchQuery(t *testing.T)
```

### <a id="TestClosePullRequest" href="#TestClosePullRequest">func TestClosePullRequest(t *testing.T)</a>

```
searchKey: github.TestClosePullRequest
tags: [function private test]
```

```Go
func TestClosePullRequest(t *testing.T)
```

### <a id="TestCreatePullRequest" href="#TestCreatePullRequest">func TestCreatePullRequest(t *testing.T)</a>

```
searchKey: github.TestCreatePullRequest
tags: [function private test]
```

```Go
func TestCreatePullRequest(t *testing.T)
```

### <a id="TestCreatePullRequestComment" href="#TestCreatePullRequestComment">func TestCreatePullRequestComment(t *testing.T)</a>

```
searchKey: github.TestCreatePullRequestComment
tags: [function private test]
```

```Go
func TestCreatePullRequestComment(t *testing.T)
```

### <a id="TestEstimateGraphQLCost" href="#TestEstimateGraphQLCost">func TestEstimateGraphQLCost(t *testing.T)</a>

```
searchKey: github.TestEstimateGraphQLCost
tags: [function private test]
```

```Go
func TestEstimateGraphQLCost(t *testing.T)
```

### <a id="TestGetAuthenticatedUserOrgs" href="#TestGetAuthenticatedUserOrgs">func TestGetAuthenticatedUserOrgs(t *testing.T)</a>

```
searchKey: github.TestGetAuthenticatedUserOrgs
tags: [function private test]
```

```Go
func TestGetAuthenticatedUserOrgs(t *testing.T)
```

### <a id="TestGetAuthenticatedUserV4" href="#TestGetAuthenticatedUserV4">func TestGetAuthenticatedUserV4(t *testing.T)</a>

```
searchKey: github.TestGetAuthenticatedUserV4
tags: [function private test]
```

```Go
func TestGetAuthenticatedUserV4(t *testing.T)
```

### <a id="TestListAffiliatedRepositories" href="#TestListAffiliatedRepositories">func TestListAffiliatedRepositories(t *testing.T)</a>

```
searchKey: github.TestListAffiliatedRepositories
tags: [function private test]
```

```Go
func TestListAffiliatedRepositories(t *testing.T)
```

NOTE: To update VCR for this test, please use the token of "sourcegraph-vcr" for GITHUB_TOKEN, which can be found in 1Password. 

### <a id="TestListRepositoryCollaborators" href="#TestListRepositoryCollaborators">func TestListRepositoryCollaborators(t *testing.T)</a>

```
searchKey: github.TestListRepositoryCollaborators
tags: [function private test]
```

```Go
func TestListRepositoryCollaborators(t *testing.T)
```

NOTE: To update VCR for this test, please use the token of "sourcegraph-vcr" for GITHUB_TOKEN, which can be found in 1Password. 

### <a id="TestLoadPullRequest" href="#TestLoadPullRequest">func TestLoadPullRequest(t *testing.T)</a>

```
searchKey: github.TestLoadPullRequest
tags: [function private test]
```

```Go
func TestLoadPullRequest(t *testing.T)
```

### <a id="TestMarkPullRequestReadyForReview" href="#TestMarkPullRequestReadyForReview">func TestMarkPullRequestReadyForReview(t *testing.T)</a>

```
searchKey: github.TestMarkPullRequestReadyForReview
tags: [function private test]
```

```Go
func TestMarkPullRequestReadyForReview(t *testing.T)
```

### <a id="TestMergePullRequest" href="#TestMergePullRequest">func TestMergePullRequest(t *testing.T)</a>

```
searchKey: github.TestMergePullRequest
tags: [function private test]
```

```Go
func TestMergePullRequest(t *testing.T)
```

### <a id="TestNewRepoCache" href="#TestNewRepoCache">func TestNewRepoCache(t *testing.T)</a>

```
searchKey: github.TestNewRepoCache
tags: [function private test]
```

```Go
func TestNewRepoCache(t *testing.T)
```

### <a id="TestReopenPullRequest" href="#TestReopenPullRequest">func TestReopenPullRequest(t *testing.T)</a>

```
searchKey: github.TestReopenPullRequest
tags: [function private test]
```

```Go
func TestReopenPullRequest(t *testing.T)
```

### <a id="TestSplitRepositoryNameWithOwner" href="#TestSplitRepositoryNameWithOwner">func TestSplitRepositoryNameWithOwner(t *testing.T)</a>

```
searchKey: github.TestSplitRepositoryNameWithOwner
tags: [function private test]
```

```Go
func TestSplitRepositoryNameWithOwner(t *testing.T)
```

### <a id="TestUnmarshal" href="#TestUnmarshal">func TestUnmarshal(t *testing.T)</a>

```
searchKey: github.TestUnmarshal
tags: [function private test]
```

```Go
func TestUnmarshal(t *testing.T)
```

### <a id="TestV3Client_WithAuthenticator" href="#TestV3Client_WithAuthenticator">func TestV3Client_WithAuthenticator(t *testing.T)</a>

```
searchKey: github.TestV3Client_WithAuthenticator
tags: [function private test]
```

```Go
func TestV3Client_WithAuthenticator(t *testing.T)
```

### <a id="TestV4Client_WithAuthenticator" href="#TestV4Client_WithAuthenticator">func TestV4Client_WithAuthenticator(t *testing.T)</a>

```
searchKey: github.TestV4Client_WithAuthenticator
tags: [function private test]
```

```Go
func TestV4Client_WithAuthenticator(t *testing.T)
```

### <a id="Test_GetAuthenticatedUserOAuthScopes" href="#Test_GetAuthenticatedUserOAuthScopes">func Test_GetAuthenticatedUserOAuthScopes(t *testing.T)</a>

```
searchKey: github.Test_GetAuthenticatedUserOAuthScopes
tags: [function private test]
```

```Go
func Test_GetAuthenticatedUserOAuthScopes(t *testing.T)
```

NOTE: To update VCR for this test, please use the token of "sourcegraph-vcr" for GITHUB_TOKEN, which can be found in 1Password. 

### <a id="abbreviateRef" href="#abbreviateRef">func abbreviateRef(ref string) string</a>

```
searchKey: github.abbreviateRef
tags: [function private]
```

```Go
func abbreviateRef(ref string) string
```

abbreviateRef removes the "refs/heads/" prefix from a given ref. If the ref doesn't have the prefix, it returns it unchanged. 

Copied from internal/vcs/git to avoid a cyclic import 

### <a id="calcDefinitionCost" href="#calcDefinitionCost">func calcDefinitionCost(def ast.Node) int</a>

```
searchKey: github.calcDefinitionCost
tags: [function private]
```

```Go
func calcDefinitionCost(def ast.Node) int
```

### <a id="canonicalizedURL" href="#canonicalizedURL">func canonicalizedURL(apiURL *url.URL) *url.URL</a>

```
searchKey: github.canonicalizedURL
tags: [function private]
```

```Go
func canonicalizedURL(apiURL *url.URL) *url.URL
```

### <a id="convertRestRepoPermissions" href="#convertRestRepoPermissions">func convertRestRepoPermissions(restRepoPermissions restRepositoryPermissions) string</a>

```
searchKey: github.convertRestRepoPermissions
tags: [function private]
```

```Go
func convertRestRepoPermissions(restRepoPermissions restRepositoryPermissions) string
```

convertRestRepoPermissions converts repo information returned by the rest API to a standard format. 

### <a id="doRequest" href="#doRequest">func doRequest(ctx context.Context, apiURL *url.URL, auth auth.Authenticator, rateLimitMonitor *ratelimit.Monitor, httpClient httpcli.Doer, req *http.Request, result interface{}) (headers http.Header, err error)</a>

```
searchKey: github.doRequest
tags: [function private]
```

```Go
func doRequest(ctx context.Context, apiURL *url.URL, auth auth.Authenticator, rateLimitMonitor *ratelimit.Monitor, httpClient httpcli.Doer, req *http.Request, result interface{}) (headers http.Header, err error)
```

### <a id="estimateGraphQLCost" href="#estimateGraphQLCost">func estimateGraphQLCost(query string) (int, error)</a>

```
searchKey: github.estimateGraphQLCost
tags: [function private]
```

```Go
func estimateGraphQLCost(query string) (int, error)
```

estimateGraphQLCost estimates the cost of the query as described here: [https://developer.github.com/v4/guides/resource-limitations/#calculating-a-rate-limit-score-before-running-the-call](https://developer.github.com/v4/guides/resource-limitations/#calculating-a-rate-limit-score-before-running-the-call) 

### <a id="filterInPlace" href="#filterInPlace">func filterInPlace(limitStack []limitDepth, depth int) []limitDepth</a>

```
searchKey: github.filterInPlace
tags: [function private]
```

```Go
func filterInPlace(limitStack []limitDepth, depth int) []limitDepth
```

### <a id="nameWithOwnerCacheKey" href="#nameWithOwnerCacheKey">func nameWithOwnerCacheKey(nameWithOwner string) string</a>

```
searchKey: github.nameWithOwnerCacheKey
tags: [function private]
```

```Go
func nameWithOwnerCacheKey(nameWithOwner string) string
```

### <a id="newRepoCache" href="#newRepoCache">func newRepoCache(apiURL *url.URL, a auth.Authenticator) *rcache.Cache</a>

```
searchKey: github.newRepoCache
tags: [function private]
```

```Go
func newRepoCache(apiURL *url.URL, a auth.Authenticator) *rcache.Cache
```

newRepoCache creates a new cache for GitHub repository metadata. The backing store is Redis. A checksum of the authenticator and API URL are used as a Redis key prefix to prevent collisions with caches for different authentication and API URLs. 

### <a id="nodeIDCacheKey" href="#nodeIDCacheKey">func nodeIDCacheKey(id string) string</a>

```
searchKey: github.nodeIDCacheKey
tags: [function private]
```

```Go
func nodeIDCacheKey(id string) string
```

### <a id="normalizeURL" href="#normalizeURL">func normalizeURL(rawURL string) string</a>

```
searchKey: github.normalizeURL
tags: [function private]
```

```Go
func normalizeURL(rawURL string) string
```

normalizeURL will attempt to normalize rawURL. If there is an error parsing it, we'll just return rawURL lower cased. 

### <a id="ownerNameCacheKey" href="#ownerNameCacheKey">func ownerNameCacheKey(owner, name string) string</a>

```
searchKey: github.ownerNameCacheKey
tags: [function private]
```

```Go
func ownerNameCacheKey(owner, name string) string
```

### <a id="pullRequestFragments" href="#pullRequestFragments">func pullRequestFragments(version *semver.Version) (string, error)</a>

```
searchKey: github.pullRequestFragments
tags: [function private]
```

```Go
func pullRequestFragments(version *semver.Version) (string, error)
```

### <a id="repoListsAreEqual" href="#repoListsAreEqual">func repoListsAreEqual(a []*Repository, b []*Repository) bool</a>

```
searchKey: github.repoListsAreEqual
tags: [function private]
```

```Go
func repoListsAreEqual(a []*Repository, b []*Repository) bool
```

### <a id="stringForRepoList" href="#stringForRepoList">func stringForRepoList(repos []*Repository) string</a>

```
searchKey: github.stringForRepoList
tags: [function private]
```

```Go
func stringForRepoList(repos []*Repository) string
```

### <a id="timelineItemTypes" href="#timelineItemTypes">func timelineItemTypes(version *semver.Version) (string, error)</a>

```
searchKey: github.timelineItemTypes
tags: [function private]
```

```Go
func timelineItemTypes(version *semver.Version) (string, error)
```

### <a id="timelineItemsFragment" href="#timelineItemsFragment">func timelineItemsFragment(version *semver.Version) (string, error)</a>

```
searchKey: github.timelineItemsFragment
tags: [function private]
```

```Go
func timelineItemsFragment(version *semver.Version) (string, error)
```

### <a id="unmarshal" href="#unmarshal">func unmarshal(data []byte, v interface{}) error</a>

```
searchKey: github.unmarshal
tags: [function private]
```

```Go
func unmarshal(data []byte, v interface{}) error
```

unmarshal wraps json.Unmarshal, but includes extra context in the case of json.UnmarshalTypeError 

### <a id="update" href="#update">func update(name string) bool</a>

```
searchKey: github.update
tags: [function private]
```

```Go
func update(name string) bool
```

### <a id="urlIsGitHubDotCom" href="#urlIsGitHubDotCom">func urlIsGitHubDotCom(apiURL *url.URL) bool</a>

```
searchKey: github.urlIsGitHubDotCom
tags: [function private]
```

```Go
func urlIsGitHubDotCom(apiURL *url.URL) bool
```

