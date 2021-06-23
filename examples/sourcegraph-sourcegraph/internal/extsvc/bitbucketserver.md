# Package bitbucketserver

## Index

* [Constants](#const)
    * [const defaultRateLimit](#defaultRateLimit)
    * [const defaultRateLimitBurst](#defaultRateLimitBurst)
    * [const userFiltersLimit](#userFiltersLimit)
    * [const PermSysAdmin](#PermSysAdmin)
    * [const PermAdmin](#PermAdmin)
    * [const PermLicensedUser](#PermLicensedUser)
    * [const PermProjectCreate](#PermProjectCreate)
    * [const PermProjectAdmin](#PermProjectAdmin)
    * [const PermProjectWrite](#PermProjectWrite)
    * [const PermProjectView](#PermProjectView)
    * [const PermProjectRead](#PermProjectRead)
    * [const PermRepoAdmin](#PermRepoAdmin)
    * [const PermRepoRead](#PermRepoRead)
    * [const PermRepoWrite](#PermRepoWrite)
    * [const ApprovedActivityAction](#ApprovedActivityAction)
    * [const UnapprovedActivityAction](#UnapprovedActivityAction)
    * [const DeclinedActivityAction](#DeclinedActivityAction)
    * [const ReviewedActivityAction](#ReviewedActivityAction)
    * [const OpenedActivityAction](#OpenedActivityAction)
    * [const ReopenedActivityAction](#ReopenedActivityAction)
    * [const RescopedActivityAction](#RescopedActivityAction)
    * [const UpdatedActivityAction](#UpdatedActivityAction)
    * [const CommentedActivityAction](#CommentedActivityAction)
    * [const MergedActivityAction](#MergedActivityAction)
    * [const bitbucketDuplicatePRException](#bitbucketDuplicatePRException)
    * [const bitbucketNoSuchLabelException](#bitbucketNoSuchLabelException)
    * [const bitbucketNoSuchPullRequestException](#bitbucketNoSuchPullRequestException)
    * [const eventTypeHeader](#eventTypeHeader)
* [Variables](#var)
    * [var requestCounter](#requestCounter)
    * [var ErrUserFiltersLimit](#ErrUserFiltersLimit)
    * [var ErrPullRequestNotFound](#ErrPullRequestNotFound)
    * [var ErrNotMergeable](#ErrNotMergeable)
    * [var normalizer](#normalizer)
    * [var update](#update)
* [Types](#type)
    * [type SudoableOAuthClient struct](#SudoableOAuthClient)
        * [func newSudoableOAuthClient(token, secret, username string) *SudoableOAuthClient](#newSudoableOAuthClient)
        * [func (c *SudoableOAuthClient) Authenticate(req *http.Request) error](#SudoableOAuthClient.Authenticate)
        * [func (c *SudoableOAuthClient) Hash() string](#SudoableOAuthClient.Hash)
    * [type Client struct](#Client)
        * [func NewClient(config *schema.BitbucketServerConnection, httpClient httpcli.Doer) (*Client, error)](#NewClient)
        * [func newClient(config *schema.BitbucketServerConnection, httpClient httpcli.Doer) (*Client, error)](#newClient)
        * [func NewTestClient(t testing.TB, name string, update bool) (*Client, func())](#NewTestClient)
        * [func (c *Client) WithAuthenticator(a auth.Authenticator) *Client](#Client.WithAuthenticator)
        * [func (c *Client) SetOAuth(consumerKey, signingKey string) error](#Client.SetOAuth)
        * [func (c *Client) Sudo(username string) (*Client, error)](#Client.Sudo)
        * [func (c *Client) Username() (string, error)](#Client.Username)
        * [func (c *Client) Users(ctx context.Context, pageToken *PageToken, fs ...UserFilter) ([]*User, *PageToken, error)](#Client.Users)
        * [func (c *Client) UserPermissions(ctx context.Context, username string) (perms []Perm, _ error)](#Client.UserPermissions)
        * [func (c *Client) CreateUser(ctx context.Context, u *User) error](#Client.CreateUser)
        * [func (c *Client) LoadUser(ctx context.Context, u *User) error](#Client.LoadUser)
        * [func (c *Client) LoadGroup(ctx context.Context, g *Group) error](#Client.LoadGroup)
        * [func (c *Client) CreateGroup(ctx context.Context, g *Group) error](#Client.CreateGroup)
        * [func (c *Client) CreateGroupMembership(ctx context.Context, g *Group) error](#Client.CreateGroupMembership)
        * [func (c *Client) CreateUserRepoPermission(ctx context.Context, p *UserRepoPermission) error](#Client.CreateUserRepoPermission)
        * [func (c *Client) CreateUserProjectPermission(ctx context.Context, p *UserProjectPermission) error](#Client.CreateUserProjectPermission)
        * [func (c *Client) CreateGroupProjectPermission(ctx context.Context, p *GroupProjectPermission) error](#Client.CreateGroupProjectPermission)
        * [func (c *Client) CreateGroupRepoPermission(ctx context.Context, p *GroupRepoPermission) error](#Client.CreateGroupRepoPermission)
        * [func (c *Client) createPermission(ctx context.Context, path, name string, p Perm) error](#Client.createPermission)
        * [func (c *Client) CreateRepo(ctx context.Context, r *Repo) error](#Client.CreateRepo)
        * [func (c *Client) LoadProject(ctx context.Context, p *Project) error](#Client.LoadProject)
        * [func (c *Client) CreateProject(ctx context.Context, p *Project) error](#Client.CreateProject)
        * [func (c *Client) LoadPullRequest(ctx context.Context, pr *PullRequest) error](#Client.LoadPullRequest)
        * [func (c *Client) UpdatePullRequest(ctx context.Context, in *UpdatePullRequestInput) (*PullRequest, error)](#Client.UpdatePullRequest)
        * [func (c *Client) CreatePullRequest(ctx context.Context, pr *PullRequest) error](#Client.CreatePullRequest)
        * [func (c *Client) FetchDefaultReviewers(ctx context.Context, pr *PullRequest) ([]string, error)](#Client.FetchDefaultReviewers)
        * [func (c *Client) DeclinePullRequest(ctx context.Context, pr *PullRequest) error](#Client.DeclinePullRequest)
        * [func (c *Client) ReopenPullRequest(ctx context.Context, pr *PullRequest) error](#Client.ReopenPullRequest)
        * [func (c *Client) LoadPullRequestActivities(ctx context.Context, pr *PullRequest) (err error)](#Client.LoadPullRequestActivities)
        * [func (c *Client) LoadPullRequestCommits(ctx context.Context, pr *PullRequest) (err error)](#Client.LoadPullRequestCommits)
        * [func (c *Client) LoadPullRequestBuildStatuses(ctx context.Context, pr *PullRequest) (err error)](#Client.LoadPullRequestBuildStatuses)
        * [func (c *Client) Repo(ctx context.Context, projectKey, repoSlug string) (*Repo, error)](#Client.Repo)
        * [func (c *Client) Repos(ctx context.Context, pageToken *PageToken, searchQueries ...string) ([]*Repo, *PageToken, error)](#Client.Repos)
        * [func (c *Client) LabeledRepos(ctx context.Context, pageToken *PageToken, label string) ([]*Repo, *PageToken, error)](#Client.LabeledRepos)
        * [func (c *Client) RepoIDs(ctx context.Context, permission string) ([]uint32, error)](#Client.RepoIDs)
        * [func (c *Client) RecentRepos(ctx context.Context, pageToken *PageToken) ([]*Repo, *PageToken, error)](#Client.RecentRepos)
        * [func (c *Client) page(ctx context.Context, path string, qry url.Values, token *PageToken, results interface{}) (*PageToken, error)](#Client.page)
        * [func (c *Client) send(ctx context.Context, method, path string, qry url.Values, payload, result interface{}) (*http.Response, error)](#Client.send)
        * [func (c *Client) do(ctx context.Context, req *http.Request, result interface{}) (*http.Response, error)](#Client.do)
        * [func (c *Client) AuthenticatedUsername(ctx context.Context) (username string, err error)](#Client.AuthenticatedUsername)
        * [func (c *Client) CreatePullRequestComment(ctx context.Context, pr *PullRequest, body string) error](#Client.CreatePullRequestComment)
        * [func (c *Client) MergePullRequest(ctx context.Context, pr *PullRequest) error](#Client.MergePullRequest)
    * [type UserFilters []bitbucketserver.UserFilter](#UserFilters)
        * [func (fs UserFilters) EncodeTo(qry url.Values)](#UserFilters.EncodeTo)
    * [type UserFilter struct](#UserFilter)
        * [func (f UserFilter) EncodeTo(qry url.Values)](#UserFilter.EncodeTo)
    * [type PermissionFilter struct](#PermissionFilter)
        * [func (p PermissionFilter) EncodeTo(qry url.Values)](#PermissionFilter.EncodeTo)
    * [type UpdatePullRequestInput struct](#UpdatePullRequestInput)
    * [type ErrAlreadyExists struct](#ErrAlreadyExists)
        * [func (e ErrAlreadyExists) Error() string](#ErrAlreadyExists.Error)
    * [type PageToken struct](#PageToken)
        * [func (t *PageToken) HasMore() bool](#PageToken.HasMore)
        * [func (t *PageToken) Query() string](#PageToken.Query)
        * [func (t *PageToken) Values() url.Values](#PageToken.Values)
    * [type Perm string](#Perm)
    * [type User struct](#User)
    * [type Group struct](#Group)
    * [type UserRepoPermission struct](#UserRepoPermission)
    * [type GroupRepoPermission struct](#GroupRepoPermission)
    * [type UserProjectPermission struct](#UserProjectPermission)
    * [type GroupProjectPermission struct](#GroupProjectPermission)
    * [type Repo struct](#Repo)
        * [func (r *Repo) IsPersonalRepository() bool](#Repo.IsPersonalRepository)
    * [type Project struct](#Project)
    * [type Ref struct](#Ref)
    * [type PullRequest struct](#PullRequest)
        * [func ExtractDuplicatePullRequest(err error) (*PullRequest, error)](#ExtractDuplicatePullRequest)
    * [type PullRequestAuthor struct](#PullRequestAuthor)
    * [type Reviewer struct](#Reviewer)
    * [type Participant struct](#Participant)
    * [type Activity struct](#Activity)
        * [func (a *Activity) Key() string](#Activity.Key)
    * [type BuildStatus struct](#BuildStatus)
    * [type CommitStatus struct](#CommitStatus)
        * [func (s *CommitStatus) Key() string](#CommitStatus.Key)
    * [type ActivityAction string](#ActivityAction)
    * [type Comment struct](#Comment)
    * [type CommentAnchor struct](#CommentAnchor)
    * [type Task struct](#Task)
    * [type PermittedOperations struct](#PermittedOperations)
    * [type Commit struct](#Commit)
    * [type httpError struct](#httpError)
        * [func (e *httpError) Error() string](#httpError.Error)
        * [func (e *httpError) Unauthorized() bool](#httpError.Unauthorized)
        * [func (e *httpError) NotFound() bool](#httpError.NotFound)
        * [func (e *httpError) DuplicatePullRequest() bool](#httpError.DuplicatePullRequest)
        * [func (e *httpError) NoSuchPullRequestException() bool](#httpError.NoSuchPullRequestException)
        * [func (e *httpError) NoSuchLabelException() bool](#httpError.NoSuchLabelException)
        * [func (e *httpError) MergePreconditionFailedException() bool](#httpError.MergePreconditionFailedException)
        * [func (e *httpError) ExtractExistingPullRequest() (*PullRequest, error)](#httpError.ExtractExistingPullRequest)
    * [type PingEvent struct{}](#PingEvent)
    * [type PullRequestActivityEvent struct](#PullRequestActivityEvent)
    * [type PullRequestParticipantStatusEvent struct](#PullRequestParticipantStatusEvent)
    * [type ParticipantStatusEvent struct](#ParticipantStatusEvent)
        * [func (a *ParticipantStatusEvent) Key() string](#ParticipantStatusEvent.Key)
    * [type BuildStatusEvent struct](#BuildStatusEvent)
* [Functions](#func)
    * [func parseQueryStrings(qs ...string) (url.Values, error)](#parseQueryStrings)
    * [func categorize(u *url.URL) string](#categorize)
    * [func IsNotFound(err error) bool](#IsNotFound)
    * [func IsUnauthorized(err error) bool](#IsUnauthorized)
    * [func IsNoSuchLabel(err error) bool](#IsNoSuchLabel)
    * [func IsDuplicatePullRequest(err error) bool](#IsDuplicatePullRequest)
    * [func WebhookEventType(r *http.Request) string](#WebhookEventType)
    * [func ParseWebhookEvent(eventType string, payload []byte) (e interface{}, err error)](#ParseWebhookEvent)
    * [func normalize(path string) string](#normalize)
    * [func ignoreHostMatcher(r *http.Request, i cassette.Request) bool](#ignoreHostMatcher)
    * [func TestSudoableOAuthClient(t *testing.T)](#TestSudoableOAuthClient)
    * [func TestParseQueryStrings(t *testing.T)](#TestParseQueryStrings)
    * [func TestUserFilters(t *testing.T)](#TestUserFilters)
    * [func TestClient_Users(t *testing.T)](#TestClient_Users)
    * [func TestClient_LabeledRepos(t *testing.T)](#TestClient_LabeledRepos)
    * [func TestClient_LoadPullRequest(t *testing.T)](#TestClient_LoadPullRequest)
    * [func TestClient_CreatePullRequest(t *testing.T)](#TestClient_CreatePullRequest)
    * [func TestClient_FetchDefaultReviewers(t *testing.T)](#TestClient_FetchDefaultReviewers)
    * [func TestClient_DeclinePullRequest(t *testing.T)](#TestClient_DeclinePullRequest)
    * [func TestClient_LoadPullRequestActivities(t *testing.T)](#TestClient_LoadPullRequestActivities)
    * [func TestClient_CreatePullRequestComment(t *testing.T)](#TestClient_CreatePullRequestComment)
    * [func TestClient_MergePullRequest(t *testing.T)](#TestClient_MergePullRequest)
    * [func TestClient_RepoIDs(t *testing.T)](#TestClient_RepoIDs)
    * [func checkGolden(t *testing.T, name string, got interface{})](#checkGolden)
    * [func TestAuth(t *testing.T)](#TestAuth)
    * [func TestClient_WithAuthenticator(t *testing.T)](#TestClient_WithAuthenticator)
    * [func TestMain(m *testing.M)](#TestMain)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="defaultRateLimit" href="#defaultRateLimit">const defaultRateLimit</a>

```
searchKey: bitbucketserver.defaultRateLimit
tags: [private]
```

```Go
const defaultRateLimit = rate.Limit(8) // 480/min or 28,800/hr

```

These fields define the self-imposed Bitbucket rate limit (since Bitbucket Server does not have a concept of rate limiting in HTTP response headers). 

See [https://godoc.org/golang.org/x/time/rate#Limiter](https://godoc.org/golang.org/x/time/rate#Limiter) for an explanation of these fields. 

We chose the limits here based on the fact that Sourcegraph is a heavy consumer of the Bitbucket Server API and that a large customer had reported to us their Bitbucket instance receives ~100 req/s so it seems reasonable for us to (at max) consume ~8 req/s. 

Note that, for comparison, Bitbucket Cloud restricts "List all repositories" requests (which are a good portion of our requests) to 1,000/hr, and they restrict "List a user or team's repositories" requests (which are roughly equal to our repository lookup requests) to 1,000/hr. We perform a list repositories request for every 1000 repositories on Bitbucket every 1m by default, so for someone with 20,000 Bitbucket repositories we need 20,000/1000 requests per minute (1200/hr) + overhead for repository lookup requests by users, and requests for identifying which repositories a user has access to (if authorization is in use) and requests for changeset synchronization if it is in use. 

These are our default values, they can be changed in configuration 

### <a id="defaultRateLimitBurst" href="#defaultRateLimitBurst">const defaultRateLimitBurst</a>

```
searchKey: bitbucketserver.defaultRateLimitBurst
tags: [private]
```

```Go
const defaultRateLimitBurst = 500
```

These fields define the self-imposed Bitbucket rate limit (since Bitbucket Server does not have a concept of rate limiting in HTTP response headers). 

See [https://godoc.org/golang.org/x/time/rate#Limiter](https://godoc.org/golang.org/x/time/rate#Limiter) for an explanation of these fields. 

We chose the limits here based on the fact that Sourcegraph is a heavy consumer of the Bitbucket Server API and that a large customer had reported to us their Bitbucket instance receives ~100 req/s so it seems reasonable for us to (at max) consume ~8 req/s. 

Note that, for comparison, Bitbucket Cloud restricts "List all repositories" requests (which are a good portion of our requests) to 1,000/hr, and they restrict "List a user or team's repositories" requests (which are roughly equal to our repository lookup requests) to 1,000/hr. We perform a list repositories request for every 1000 repositories on Bitbucket every 1m by default, so for someone with 20,000 Bitbucket repositories we need 20,000/1000 requests per minute (1200/hr) + overhead for repository lookup requests by users, and requests for identifying which repositories a user has access to (if authorization is in use) and requests for changeset synchronization if it is in use. 

These are our default values, they can be changed in configuration 

### <a id="userFiltersLimit" href="#userFiltersLimit">const userFiltersLimit</a>

```
searchKey: bitbucketserver.userFiltersLimit
tags: [private]
```

```Go
const userFiltersLimit = 50
```

userFiltersLimit defines the maximum number of UserFilters that can be passed to a single Client.Users call. 

### <a id="PermSysAdmin" href="#PermSysAdmin">const PermSysAdmin</a>

```
searchKey: bitbucketserver.PermSysAdmin
```

```Go
const PermSysAdmin Perm = "SYS_ADMIN"
```

Permission constants. 

### <a id="PermAdmin" href="#PermAdmin">const PermAdmin</a>

```
searchKey: bitbucketserver.PermAdmin
```

```Go
const PermAdmin Perm = "ADMIN"
```

Permission constants. 

### <a id="PermLicensedUser" href="#PermLicensedUser">const PermLicensedUser</a>

```
searchKey: bitbucketserver.PermLicensedUser
```

```Go
const PermLicensedUser Perm = "LICENSED_USER"
```

Permission constants. 

### <a id="PermProjectCreate" href="#PermProjectCreate">const PermProjectCreate</a>

```
searchKey: bitbucketserver.PermProjectCreate
```

```Go
const PermProjectCreate Perm = "PROJECT_CREATE"
```

Permission constants. 

### <a id="PermProjectAdmin" href="#PermProjectAdmin">const PermProjectAdmin</a>

```
searchKey: bitbucketserver.PermProjectAdmin
```

```Go
const PermProjectAdmin Perm = "PROJECT_ADMIN"
```

Permission constants. 

### <a id="PermProjectWrite" href="#PermProjectWrite">const PermProjectWrite</a>

```
searchKey: bitbucketserver.PermProjectWrite
```

```Go
const PermProjectWrite Perm = "PROJECT_WRITE"
```

Permission constants. 

### <a id="PermProjectView" href="#PermProjectView">const PermProjectView</a>

```
searchKey: bitbucketserver.PermProjectView
```

```Go
const PermProjectView Perm = "PROJECT_VIEW"
```

Permission constants. 

### <a id="PermProjectRead" href="#PermProjectRead">const PermProjectRead</a>

```
searchKey: bitbucketserver.PermProjectRead
```

```Go
const PermProjectRead Perm = "PROJECT_READ"
```

Permission constants. 

### <a id="PermRepoAdmin" href="#PermRepoAdmin">const PermRepoAdmin</a>

```
searchKey: bitbucketserver.PermRepoAdmin
```

```Go
const PermRepoAdmin Perm = "REPO_ADMIN"
```

Permission constants. 

### <a id="PermRepoRead" href="#PermRepoRead">const PermRepoRead</a>

```
searchKey: bitbucketserver.PermRepoRead
```

```Go
const PermRepoRead Perm = "REPO_READ"
```

Permission constants. 

### <a id="PermRepoWrite" href="#PermRepoWrite">const PermRepoWrite</a>

```
searchKey: bitbucketserver.PermRepoWrite
```

```Go
const PermRepoWrite Perm = "REPO_WRITE"
```

Permission constants. 

### <a id="ApprovedActivityAction" href="#ApprovedActivityAction">const ApprovedActivityAction</a>

```
searchKey: bitbucketserver.ApprovedActivityAction
```

```Go
const ApprovedActivityAction ActivityAction = "APPROVED"
```

Known ActivityActions 

### <a id="UnapprovedActivityAction" href="#UnapprovedActivityAction">const UnapprovedActivityAction</a>

```
searchKey: bitbucketserver.UnapprovedActivityAction
```

```Go
const UnapprovedActivityAction ActivityAction = "UNAPPROVED"
```

Known ActivityActions 

### <a id="DeclinedActivityAction" href="#DeclinedActivityAction">const DeclinedActivityAction</a>

```
searchKey: bitbucketserver.DeclinedActivityAction
```

```Go
const DeclinedActivityAction ActivityAction = "DECLINED"
```

Known ActivityActions 

### <a id="ReviewedActivityAction" href="#ReviewedActivityAction">const ReviewedActivityAction</a>

```
searchKey: bitbucketserver.ReviewedActivityAction
```

```Go
const ReviewedActivityAction ActivityAction = "REVIEWED"
```

Known ActivityActions 

### <a id="OpenedActivityAction" href="#OpenedActivityAction">const OpenedActivityAction</a>

```
searchKey: bitbucketserver.OpenedActivityAction
```

```Go
const OpenedActivityAction ActivityAction = "OPENED"
```

Known ActivityActions 

### <a id="ReopenedActivityAction" href="#ReopenedActivityAction">const ReopenedActivityAction</a>

```
searchKey: bitbucketserver.ReopenedActivityAction
```

```Go
const ReopenedActivityAction ActivityAction = "REOPENED"
```

Known ActivityActions 

### <a id="RescopedActivityAction" href="#RescopedActivityAction">const RescopedActivityAction</a>

```
searchKey: bitbucketserver.RescopedActivityAction
```

```Go
const RescopedActivityAction ActivityAction = "RESCOPED"
```

Known ActivityActions 

### <a id="UpdatedActivityAction" href="#UpdatedActivityAction">const UpdatedActivityAction</a>

```
searchKey: bitbucketserver.UpdatedActivityAction
```

```Go
const UpdatedActivityAction ActivityAction = "UPDATED"
```

Known ActivityActions 

### <a id="CommentedActivityAction" href="#CommentedActivityAction">const CommentedActivityAction</a>

```
searchKey: bitbucketserver.CommentedActivityAction
```

```Go
const CommentedActivityAction ActivityAction = "COMMENTED"
```

Known ActivityActions 

### <a id="MergedActivityAction" href="#MergedActivityAction">const MergedActivityAction</a>

```
searchKey: bitbucketserver.MergedActivityAction
```

```Go
const MergedActivityAction ActivityAction = "MERGED"
```

Known ActivityActions 

### <a id="bitbucketDuplicatePRException" href="#bitbucketDuplicatePRException">const bitbucketDuplicatePRException</a>

```
searchKey: bitbucketserver.bitbucketDuplicatePRException
tags: [private]
```

```Go
const bitbucketDuplicatePRException = "com.atlassian.bitbucket.pull.DuplicatePullRequestException"
```

### <a id="bitbucketNoSuchLabelException" href="#bitbucketNoSuchLabelException">const bitbucketNoSuchLabelException</a>

```
searchKey: bitbucketserver.bitbucketNoSuchLabelException
tags: [private]
```

```Go
const bitbucketNoSuchLabelException = "com.atlassian.bitbucket.label.NoSuchLabelException"
```

### <a id="bitbucketNoSuchPullRequestException" href="#bitbucketNoSuchPullRequestException">const bitbucketNoSuchPullRequestException</a>

```
searchKey: bitbucketserver.bitbucketNoSuchPullRequestException
tags: [private]
```

```Go
const bitbucketNoSuchPullRequestException = ...
```

### <a id="eventTypeHeader" href="#eventTypeHeader">const eventTypeHeader</a>

```
searchKey: bitbucketserver.eventTypeHeader
tags: [private]
```

```Go
const eventTypeHeader = "X-Event-Key"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="requestCounter" href="#requestCounter">var requestCounter</a>

```
searchKey: bitbucketserver.requestCounter
tags: [private]
```

```Go
var requestCounter = ...
```

### <a id="ErrUserFiltersLimit" href="#ErrUserFiltersLimit">var ErrUserFiltersLimit</a>

```
searchKey: bitbucketserver.ErrUserFiltersLimit
```

```Go
var ErrUserFiltersLimit = errors.Errorf("maximum of %d user filters exceeded", userFiltersLimit)
```

ErrUserFiltersLimit is returned by Client.Users when the UserFiltersLimit is exceeded. 

### <a id="ErrPullRequestNotFound" href="#ErrPullRequestNotFound">var ErrPullRequestNotFound</a>

```
searchKey: bitbucketserver.ErrPullRequestNotFound
```

```Go
var ErrPullRequestNotFound = errors.New("pull request not found")
```

ErrPullRequestNotFound is returned by LoadPullRequest when the pull request has been deleted on upstream, or never existed. It will NOT be thrown, if it can't be determined whether the pull request exists, because the credential used cannot view the repository. 

### <a id="ErrNotMergeable" href="#ErrNotMergeable">var ErrNotMergeable</a>

```
searchKey: bitbucketserver.ErrNotMergeable
```

```Go
var ErrNotMergeable = errors.New("pull request cannot be merged")
```

ErrNotMergeable is returned by MergePullRequest when the pull request failed to merge, because a precondition is not met. 

### <a id="normalizer" href="#normalizer">var normalizer</a>

```
searchKey: bitbucketserver.normalizer
tags: [private]
```

```Go
var normalizer = lazyregexp.New("[^A-Za-z0-9-]+")
```

### <a id="update" href="#update">var update</a>

```
searchKey: bitbucketserver.update
tags: [private]
```

```Go
var update = flag.Bool("update", false, "update testdata")
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="SudoableOAuthClient" href="#SudoableOAuthClient">type SudoableOAuthClient struct</a>

```
searchKey: bitbucketserver.SudoableOAuthClient
```

```Go
type SudoableOAuthClient struct {
	Client   auth.OAuthClient
	Username string
}
```

SudoableOAuthClient extends the generic OAuthClient type to allow for an optional username to be set, which will be attached to the request as a user_id query param if set. 

#### <a id="newSudoableOAuthClient" href="#newSudoableOAuthClient">func newSudoableOAuthClient(token, secret, username string) *SudoableOAuthClient</a>

```
searchKey: bitbucketserver.newSudoableOAuthClient
tags: [private]
```

```Go
func newSudoableOAuthClient(token, secret, username string) *SudoableOAuthClient
```

#### <a id="SudoableOAuthClient.Authenticate" href="#SudoableOAuthClient.Authenticate">func (c *SudoableOAuthClient) Authenticate(req *http.Request) error</a>

```
searchKey: bitbucketserver.SudoableOAuthClient.Authenticate
```

```Go
func (c *SudoableOAuthClient) Authenticate(req *http.Request) error
```

#### <a id="SudoableOAuthClient.Hash" href="#SudoableOAuthClient.Hash">func (c *SudoableOAuthClient) Hash() string</a>

```
searchKey: bitbucketserver.SudoableOAuthClient.Hash
```

```Go
func (c *SudoableOAuthClient) Hash() string
```

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: bitbucketserver.Client
```

```Go
type Client struct {
	// HTTP Client used to communicate with the API
	httpClient httpcli.Doer

	// URL is the base URL of Bitbucket Server.
	URL *url.URL

	// Auth is the authentication method used when accessing the server.
	// Supported types are:
	// * auth.OAuthBearerToken for a personal access token; see also
	//   https://bitbucket.example.com/plugins/servlet/access-tokens/manage
	// * auth.BasicAuth for a username and password combination. Typically
	//   these are only used when the server doesn't support personal access
	//   tokens (such as Bitbucket Server 5.4 and older).
	// * SudoableClient for an OAuth 1 client used to authenticate requests.
	//   This is generally set using SetOAuth.
	Auth auth.Authenticator

	// RateLimit is the self-imposed rate limiter (since Bitbucket does not have a concept
	// of rate limiting in HTTP response headers).
	RateLimit *rate.Limiter
}
```

Client access a Bitbucket Server via the REST API. 

#### <a id="NewClient" href="#NewClient">func NewClient(config *schema.BitbucketServerConnection, httpClient httpcli.Doer) (*Client, error)</a>

```
searchKey: bitbucketserver.NewClient
```

```Go
func NewClient(config *schema.BitbucketServerConnection, httpClient httpcli.Doer) (*Client, error)
```

NewClient returns an authenticated Bitbucket Server API client with the provided configuration. If a nil httpClient is provided, http.DefaultClient will be used. 

#### <a id="newClient" href="#newClient">func newClient(config *schema.BitbucketServerConnection, httpClient httpcli.Doer) (*Client, error)</a>

```
searchKey: bitbucketserver.newClient
tags: [private]
```

```Go
func newClient(config *schema.BitbucketServerConnection, httpClient httpcli.Doer) (*Client, error)
```

#### <a id="NewTestClient" href="#NewTestClient">func NewTestClient(t testing.TB, name string, update bool) (*Client, func())</a>

```
searchKey: bitbucketserver.NewTestClient
```

```Go
func NewTestClient(t testing.TB, name string, update bool) (*Client, func())
```

NewTestClient returns a bitbucketserver.Client that records its interactions to testdata/vcr/. 

#### <a id="Client.WithAuthenticator" href="#Client.WithAuthenticator">func (c *Client) WithAuthenticator(a auth.Authenticator) *Client</a>

```
searchKey: bitbucketserver.Client.WithAuthenticator
```

```Go
func (c *Client) WithAuthenticator(a auth.Authenticator) *Client
```

WithAuthenticator returns a new Client that uses the same configuration, HTTPClient, and RateLimiter as the current Client, except authenticated user with the given authenticator instance. 

#### <a id="Client.SetOAuth" href="#Client.SetOAuth">func (c *Client) SetOAuth(consumerKey, signingKey string) error</a>

```
searchKey: bitbucketserver.Client.SetOAuth
```

```Go
func (c *Client) SetOAuth(consumerKey, signingKey string) error
```

SetOAuth enables OAuth authentication in a Client, using the given consumer key to identify with the Bitbucket Server API and the request signing RSA key to authenticate requests. It parses the given Base64 encoded PEM encoded private key, returning an error in case of failure. 

When using OAuth authentication, it's possible to impersonate any Bitbucket Server API user by passing a ?user_id=$username query parameter. This requires the Application Link in the Bitbucket Server API to be configured with 2 legged OAuth and for it to allow user impersonation. 

#### <a id="Client.Sudo" href="#Client.Sudo">func (c *Client) Sudo(username string) (*Client, error)</a>

```
searchKey: bitbucketserver.Client.Sudo
```

```Go
func (c *Client) Sudo(username string) (*Client, error)
```

Sudo returns a copy of the Client authenticated as the Bitbucket Server user with the given username. This only works when using OAuth authentication and if the Application Link in Bitbucket Server is configured to allow user impersonation, returning an error otherwise. 

#### <a id="Client.Username" href="#Client.Username">func (c *Client) Username() (string, error)</a>

```
searchKey: bitbucketserver.Client.Username
```

```Go
func (c *Client) Username() (string, error)
```

Username returns the username that will be used when communicating with Bitbucket Server, if the authentication method includes a username. 

#### <a id="Client.Users" href="#Client.Users">func (c *Client) Users(ctx context.Context, pageToken *PageToken, fs ...UserFilter) ([]*User, *PageToken, error)</a>

```
searchKey: bitbucketserver.Client.Users
```

```Go
func (c *Client) Users(ctx context.Context, pageToken *PageToken, fs ...UserFilter) ([]*User, *PageToken, error)
```

Users retrieves a page of users, optionally run through provided filters. 

#### <a id="Client.UserPermissions" href="#Client.UserPermissions">func (c *Client) UserPermissions(ctx context.Context, username string) (perms []Perm, _ error)</a>

```
searchKey: bitbucketserver.Client.UserPermissions
```

```Go
func (c *Client) UserPermissions(ctx context.Context, username string) (perms []Perm, _ error)
```

UserPermissions retrieves the global permissions assigned to the user with the given username. Used to validate that the client is authenticated as an admin. 

#### <a id="Client.CreateUser" href="#Client.CreateUser">func (c *Client) CreateUser(ctx context.Context, u *User) error</a>

```
searchKey: bitbucketserver.Client.CreateUser
```

```Go
func (c *Client) CreateUser(ctx context.Context, u *User) error
```

CreateUser creates the given User returning an error in case of failure. 

#### <a id="Client.LoadUser" href="#Client.LoadUser">func (c *Client) LoadUser(ctx context.Context, u *User) error</a>

```
searchKey: bitbucketserver.Client.LoadUser
```

```Go
func (c *Client) LoadUser(ctx context.Context, u *User) error
```

LoadUser loads the given User returning an error in case of failure. 

#### <a id="Client.LoadGroup" href="#Client.LoadGroup">func (c *Client) LoadGroup(ctx context.Context, g *Group) error</a>

```
searchKey: bitbucketserver.Client.LoadGroup
```

```Go
func (c *Client) LoadGroup(ctx context.Context, g *Group) error
```

LoadGroup loads the given Group returning an error in case of failure. 

#### <a id="Client.CreateGroup" href="#Client.CreateGroup">func (c *Client) CreateGroup(ctx context.Context, g *Group) error</a>

```
searchKey: bitbucketserver.Client.CreateGroup
```

```Go
func (c *Client) CreateGroup(ctx context.Context, g *Group) error
```

CreateGroup creates the given Group returning an error in case of failure. 

#### <a id="Client.CreateGroupMembership" href="#Client.CreateGroupMembership">func (c *Client) CreateGroupMembership(ctx context.Context, g *Group) error</a>

```
searchKey: bitbucketserver.Client.CreateGroupMembership
```

```Go
func (c *Client) CreateGroupMembership(ctx context.Context, g *Group) error
```

CreateGroupMembership creates the given Group's membership returning an error in case of failure. 

#### <a id="Client.CreateUserRepoPermission" href="#Client.CreateUserRepoPermission">func (c *Client) CreateUserRepoPermission(ctx context.Context, p *UserRepoPermission) error</a>

```
searchKey: bitbucketserver.Client.CreateUserRepoPermission
```

```Go
func (c *Client) CreateUserRepoPermission(ctx context.Context, p *UserRepoPermission) error
```

CreateUserRepoPermission creates the given permission returning an error in case of failure. 

#### <a id="Client.CreateUserProjectPermission" href="#Client.CreateUserProjectPermission">func (c *Client) CreateUserProjectPermission(ctx context.Context, p *UserProjectPermission) error</a>

```
searchKey: bitbucketserver.Client.CreateUserProjectPermission
```

```Go
func (c *Client) CreateUserProjectPermission(ctx context.Context, p *UserProjectPermission) error
```

CreateUserProjectPermission creates the given permission returning an error in case of failure. 

#### <a id="Client.CreateGroupProjectPermission" href="#Client.CreateGroupProjectPermission">func (c *Client) CreateGroupProjectPermission(ctx context.Context, p *GroupProjectPermission) error</a>

```
searchKey: bitbucketserver.Client.CreateGroupProjectPermission
```

```Go
func (c *Client) CreateGroupProjectPermission(ctx context.Context, p *GroupProjectPermission) error
```

CreateGroupProjectPermission creates the given permission returning an error in case of failure. 

#### <a id="Client.CreateGroupRepoPermission" href="#Client.CreateGroupRepoPermission">func (c *Client) CreateGroupRepoPermission(ctx context.Context, p *GroupRepoPermission) error</a>

```
searchKey: bitbucketserver.Client.CreateGroupRepoPermission
```

```Go
func (c *Client) CreateGroupRepoPermission(ctx context.Context, p *GroupRepoPermission) error
```

CreateGroupRepoPermission creates the given permission returning an error in case of failure. 

#### <a id="Client.createPermission" href="#Client.createPermission">func (c *Client) createPermission(ctx context.Context, path, name string, p Perm) error</a>

```
searchKey: bitbucketserver.Client.createPermission
tags: [private]
```

```Go
func (c *Client) createPermission(ctx context.Context, path, name string, p Perm) error
```

#### <a id="Client.CreateRepo" href="#Client.CreateRepo">func (c *Client) CreateRepo(ctx context.Context, r *Repo) error</a>

```
searchKey: bitbucketserver.Client.CreateRepo
```

```Go
func (c *Client) CreateRepo(ctx context.Context, r *Repo) error
```

CreateRepo creates the given Repo returning an error in case of failure. 

#### <a id="Client.LoadProject" href="#Client.LoadProject">func (c *Client) LoadProject(ctx context.Context, p *Project) error</a>

```
searchKey: bitbucketserver.Client.LoadProject
```

```Go
func (c *Client) LoadProject(ctx context.Context, p *Project) error
```

LoadProject loads the given Project returning an error in case of failure. 

#### <a id="Client.CreateProject" href="#Client.CreateProject">func (c *Client) CreateProject(ctx context.Context, p *Project) error</a>

```
searchKey: bitbucketserver.Client.CreateProject
```

```Go
func (c *Client) CreateProject(ctx context.Context, p *Project) error
```

CreateProject creates the given Project returning an error in case of failure. 

#### <a id="Client.LoadPullRequest" href="#Client.LoadPullRequest">func (c *Client) LoadPullRequest(ctx context.Context, pr *PullRequest) error</a>

```
searchKey: bitbucketserver.Client.LoadPullRequest
```

```Go
func (c *Client) LoadPullRequest(ctx context.Context, pr *PullRequest) error
```

LoadPullRequest loads the given PullRequest returning an error in case of failure. 

#### <a id="Client.UpdatePullRequest" href="#Client.UpdatePullRequest">func (c *Client) UpdatePullRequest(ctx context.Context, in *UpdatePullRequestInput) (*PullRequest, error)</a>

```
searchKey: bitbucketserver.Client.UpdatePullRequest
```

```Go
func (c *Client) UpdatePullRequest(ctx context.Context, in *UpdatePullRequestInput) (*PullRequest, error)
```

#### <a id="Client.CreatePullRequest" href="#Client.CreatePullRequest">func (c *Client) CreatePullRequest(ctx context.Context, pr *PullRequest) error</a>

```
searchKey: bitbucketserver.Client.CreatePullRequest
```

```Go
func (c *Client) CreatePullRequest(ctx context.Context, pr *PullRequest) error
```

CreatePullRequest creates the given PullRequest returning an error in case of failure. 

#### <a id="Client.FetchDefaultReviewers" href="#Client.FetchDefaultReviewers">func (c *Client) FetchDefaultReviewers(ctx context.Context, pr *PullRequest) ([]string, error)</a>

```
searchKey: bitbucketserver.Client.FetchDefaultReviewers
```

```Go
func (c *Client) FetchDefaultReviewers(ctx context.Context, pr *PullRequest) ([]string, error)
```

FetchDefaultReviewers loads the suggested default reviewers for the given PR. 

#### <a id="Client.DeclinePullRequest" href="#Client.DeclinePullRequest">func (c *Client) DeclinePullRequest(ctx context.Context, pr *PullRequest) error</a>

```
searchKey: bitbucketserver.Client.DeclinePullRequest
```

```Go
func (c *Client) DeclinePullRequest(ctx context.Context, pr *PullRequest) error
```

DeclinePullRequest declines and closes the given PullRequest, returning an error in case of failure. 

#### <a id="Client.ReopenPullRequest" href="#Client.ReopenPullRequest">func (c *Client) ReopenPullRequest(ctx context.Context, pr *PullRequest) error</a>

```
searchKey: bitbucketserver.Client.ReopenPullRequest
```

```Go
func (c *Client) ReopenPullRequest(ctx context.Context, pr *PullRequest) error
```

ReopenPullRequest reopens a previously declined & closed PullRequest, returning an error in case of failure. 

#### <a id="Client.LoadPullRequestActivities" href="#Client.LoadPullRequestActivities">func (c *Client) LoadPullRequestActivities(ctx context.Context, pr *PullRequest) (err error)</a>

```
searchKey: bitbucketserver.Client.LoadPullRequestActivities
```

```Go
func (c *Client) LoadPullRequestActivities(ctx context.Context, pr *PullRequest) (err error)
```

LoadPullRequestActivities loads the given PullRequest's timeline of activities, returning an error in case of failure. 

#### <a id="Client.LoadPullRequestCommits" href="#Client.LoadPullRequestCommits">func (c *Client) LoadPullRequestCommits(ctx context.Context, pr *PullRequest) (err error)</a>

```
searchKey: bitbucketserver.Client.LoadPullRequestCommits
```

```Go
func (c *Client) LoadPullRequestCommits(ctx context.Context, pr *PullRequest) (err error)
```

#### <a id="Client.LoadPullRequestBuildStatuses" href="#Client.LoadPullRequestBuildStatuses">func (c *Client) LoadPullRequestBuildStatuses(ctx context.Context, pr *PullRequest) (err error)</a>

```
searchKey: bitbucketserver.Client.LoadPullRequestBuildStatuses
```

```Go
func (c *Client) LoadPullRequestBuildStatuses(ctx context.Context, pr *PullRequest) (err error)
```

#### <a id="Client.Repo" href="#Client.Repo">func (c *Client) Repo(ctx context.Context, projectKey, repoSlug string) (*Repo, error)</a>

```
searchKey: bitbucketserver.Client.Repo
```

```Go
func (c *Client) Repo(ctx context.Context, projectKey, repoSlug string) (*Repo, error)
```

#### <a id="Client.Repos" href="#Client.Repos">func (c *Client) Repos(ctx context.Context, pageToken *PageToken, searchQueries ...string) ([]*Repo, *PageToken, error)</a>

```
searchKey: bitbucketserver.Client.Repos
```

```Go
func (c *Client) Repos(ctx context.Context, pageToken *PageToken, searchQueries ...string) ([]*Repo, *PageToken, error)
```

#### <a id="Client.LabeledRepos" href="#Client.LabeledRepos">func (c *Client) LabeledRepos(ctx context.Context, pageToken *PageToken, label string) ([]*Repo, *PageToken, error)</a>

```
searchKey: bitbucketserver.Client.LabeledRepos
```

```Go
func (c *Client) LabeledRepos(ctx context.Context, pageToken *PageToken, label string) ([]*Repo, *PageToken, error)
```

#### <a id="Client.RepoIDs" href="#Client.RepoIDs">func (c *Client) RepoIDs(ctx context.Context, permission string) ([]uint32, error)</a>

```
searchKey: bitbucketserver.Client.RepoIDs
```

```Go
func (c *Client) RepoIDs(ctx context.Context, permission string) ([]uint32, error)
```

RepoIDs fetches a list of repository IDs that the user token has permission for. Permission: ["admin", "read", "write"] 

#### <a id="Client.RecentRepos" href="#Client.RecentRepos">func (c *Client) RecentRepos(ctx context.Context, pageToken *PageToken) ([]*Repo, *PageToken, error)</a>

```
searchKey: bitbucketserver.Client.RecentRepos
```

```Go
func (c *Client) RecentRepos(ctx context.Context, pageToken *PageToken) ([]*Repo, *PageToken, error)
```

#### <a id="Client.page" href="#Client.page">func (c *Client) page(ctx context.Context, path string, qry url.Values, token *PageToken, results interface{}) (*PageToken, error)</a>

```
searchKey: bitbucketserver.Client.page
tags: [private]
```

```Go
func (c *Client) page(ctx context.Context, path string, qry url.Values, token *PageToken, results interface{}) (*PageToken, error)
```

#### <a id="Client.send" href="#Client.send">func (c *Client) send(ctx context.Context, method, path string, qry url.Values, payload, result interface{}) (*http.Response, error)</a>

```
searchKey: bitbucketserver.Client.send
tags: [private]
```

```Go
func (c *Client) send(ctx context.Context, method, path string, qry url.Values, payload, result interface{}) (*http.Response, error)
```

#### <a id="Client.do" href="#Client.do">func (c *Client) do(ctx context.Context, req *http.Request, result interface{}) (*http.Response, error)</a>

```
searchKey: bitbucketserver.Client.do
tags: [private]
```

```Go
func (c *Client) do(ctx context.Context, req *http.Request, result interface{}) (*http.Response, error)
```

#### <a id="Client.AuthenticatedUsername" href="#Client.AuthenticatedUsername">func (c *Client) AuthenticatedUsername(ctx context.Context) (username string, err error)</a>

```
searchKey: bitbucketserver.Client.AuthenticatedUsername
```

```Go
func (c *Client) AuthenticatedUsername(ctx context.Context) (username string, err error)
```

AuthenticatedUsername returns the username associated with the credentials used by the client. Since BitbucketServer doesn't offer an endpoint in their API to query the currently-authenticated user, we send a request to list a single user on the instance and then inspect the response headers in which BitbucketServer sets the username in X-Ausername. If no username is found in the response headers, an error is returned. 

#### <a id="Client.CreatePullRequestComment" href="#Client.CreatePullRequestComment">func (c *Client) CreatePullRequestComment(ctx context.Context, pr *PullRequest, body string) error</a>

```
searchKey: bitbucketserver.Client.CreatePullRequestComment
```

```Go
func (c *Client) CreatePullRequestComment(ctx context.Context, pr *PullRequest, body string) error
```

#### <a id="Client.MergePullRequest" href="#Client.MergePullRequest">func (c *Client) MergePullRequest(ctx context.Context, pr *PullRequest) error</a>

```
searchKey: bitbucketserver.Client.MergePullRequest
```

```Go
func (c *Client) MergePullRequest(ctx context.Context, pr *PullRequest) error
```

### <a id="UserFilters" href="#UserFilters">type UserFilters []bitbucketserver.UserFilter</a>

```
searchKey: bitbucketserver.UserFilters
```

```Go
type UserFilters []UserFilter
```

UserFilters is a list of UserFilter that is ANDed together. 

#### <a id="UserFilters.EncodeTo" href="#UserFilters.EncodeTo">func (fs UserFilters) EncodeTo(qry url.Values)</a>

```
searchKey: bitbucketserver.UserFilters.EncodeTo
```

```Go
func (fs UserFilters) EncodeTo(qry url.Values)
```

EncodeTo encodes the UserFilter to the given url.Values. 

### <a id="UserFilter" href="#UserFilter">type UserFilter struct</a>

```
searchKey: bitbucketserver.UserFilter
```

```Go
type UserFilter struct {
	// Filter filters the returned users to those whose username,
	// name or email address contain this value.
	// The API doesn't support exact matches.
	Filter string
	// Group filters the returned users to those who are in the give group.
	Group string
	// Permission filters the returned users to those having the given
	// permissions.
	Permission PermissionFilter
}
```

UserFilter defines a sum type of filters to be used when listing users. 

#### <a id="UserFilter.EncodeTo" href="#UserFilter.EncodeTo">func (f UserFilter) EncodeTo(qry url.Values)</a>

```
searchKey: bitbucketserver.UserFilter.EncodeTo
```

```Go
func (f UserFilter) EncodeTo(qry url.Values)
```

EncodeTo encodes the UserFilter to the given url.Values. 

### <a id="PermissionFilter" href="#PermissionFilter">type PermissionFilter struct</a>

```
searchKey: bitbucketserver.PermissionFilter
```

```Go
type PermissionFilter struct {
	Root           Perm
	ProjectID      string
	ProjectKey     string
	RepositoryID   string
	RepositorySlug string

	index int
}
```

A PermissionFilter is a filter used to list users that have specific permissions. 

#### <a id="PermissionFilter.EncodeTo" href="#PermissionFilter.EncodeTo">func (p PermissionFilter) EncodeTo(qry url.Values)</a>

```
searchKey: bitbucketserver.PermissionFilter.EncodeTo
```

```Go
func (p PermissionFilter) EncodeTo(qry url.Values)
```

EncodeTo encodes the PermissionFilter to the given url.Values. 

### <a id="UpdatePullRequestInput" href="#UpdatePullRequestInput">type UpdatePullRequestInput struct</a>

```
searchKey: bitbucketserver.UpdatePullRequestInput
```

```Go
type UpdatePullRequestInput struct {
	PullRequestID string `json:"-"`
	Version       int    `json:"version"`

	Title       string `json:"title"`
	Description string `json:"description"`
	ToRef       Ref    `json:"toRef"`
}
```

### <a id="ErrAlreadyExists" href="#ErrAlreadyExists">type ErrAlreadyExists struct</a>

```
searchKey: bitbucketserver.ErrAlreadyExists
```

```Go
type ErrAlreadyExists struct {
	Existing *PullRequest
}
```

ErrAlreadyExists is returned by Client.CreatePullRequest when a Pull Request for the given FromRef and ToRef already exists. 

#### <a id="ErrAlreadyExists.Error" href="#ErrAlreadyExists.Error">func (e ErrAlreadyExists) Error() string</a>

```
searchKey: bitbucketserver.ErrAlreadyExists.Error
```

```Go
func (e ErrAlreadyExists) Error() string
```

### <a id="PageToken" href="#PageToken">type PageToken struct</a>

```
searchKey: bitbucketserver.PageToken
```

```Go
type PageToken struct {
	Size          int  `json:"size"`
	Limit         int  `json:"limit"`
	IsLastPage    bool `json:"isLastPage"`
	Start         int  `json:"start"`
	NextPageStart int  `json:"nextPageStart"`
}
```

#### <a id="PageToken.HasMore" href="#PageToken.HasMore">func (t *PageToken) HasMore() bool</a>

```
searchKey: bitbucketserver.PageToken.HasMore
```

```Go
func (t *PageToken) HasMore() bool
```

#### <a id="PageToken.Query" href="#PageToken.Query">func (t *PageToken) Query() string</a>

```
searchKey: bitbucketserver.PageToken.Query
```

```Go
func (t *PageToken) Query() string
```

#### <a id="PageToken.Values" href="#PageToken.Values">func (t *PageToken) Values() url.Values</a>

```
searchKey: bitbucketserver.PageToken.Values
```

```Go
func (t *PageToken) Values() url.Values
```

### <a id="Perm" href="#Perm">type Perm string</a>

```
searchKey: bitbucketserver.Perm
```

```Go
type Perm string
```

Perm represents a Bitbucket Server permission. 

### <a id="User" href="#User">type User struct</a>

```
searchKey: bitbucketserver.User
```

```Go
type User struct {
	Name         string `json:"name,omitempty"`
	Password     string `json:"-"`
	EmailAddress string `json:"emailAddress,omitempty"`
	ID           int    `json:"id,omitempty"`
	DisplayName  string `json:"displayName,omitempty"`
	Active       bool   `json:"active,omitempty"`
	Slug         string `json:"slug,omitempty"`
	Type         string `json:"type,omitempty"`
}
```

User account in a Bitbucket Server instance. 

### <a id="Group" href="#Group">type Group struct</a>

```
searchKey: bitbucketserver.Group
```

```Go
type Group struct {
	Name  string   `json:"name,omitempty"`
	Users []string `json:"users,omitempty"`
}
```

Group of users in a Bitbucket Server instance. 

### <a id="UserRepoPermission" href="#UserRepoPermission">type UserRepoPermission struct</a>

```
searchKey: bitbucketserver.UserRepoPermission
```

```Go
type UserRepoPermission struct {
	User *User
	Perm Perm
	Repo *Repo
}
```

A UserRepoPermission of a User to perform certain actions on a Repo. 

### <a id="GroupRepoPermission" href="#GroupRepoPermission">type GroupRepoPermission struct</a>

```
searchKey: bitbucketserver.GroupRepoPermission
```

```Go
type GroupRepoPermission struct {
	Group *Group
	Perm  Perm
	Repo  *Repo
}
```

A GroupRepoPermission of a Group to perform certain actions on a Repo. 

### <a id="UserProjectPermission" href="#UserProjectPermission">type UserProjectPermission struct</a>

```
searchKey: bitbucketserver.UserProjectPermission
```

```Go
type UserProjectPermission struct {
	User    *User
	Perm    Perm
	Project *Project
}
```

A UserProjectPermission of a User to perform certain actions on a Project. 

### <a id="GroupProjectPermission" href="#GroupProjectPermission">type GroupProjectPermission struct</a>

```
searchKey: bitbucketserver.GroupProjectPermission
```

```Go
type GroupProjectPermission struct {
	Group   *Group
	Perm    Perm
	Project *Project
}
```

A GroupProjectPermission of a Group to perform certain actions on a Project. 

### <a id="Repo" href="#Repo">type Repo struct</a>

```
searchKey: bitbucketserver.Repo
```

```Go
type Repo struct {
	Slug          string   `json:"slug"`
	ID            int      `json:"id"`
	Name          string   `json:"name"`
	SCMID         string   `json:"scmId"`
	State         string   `json:"state"`
	StatusMessage string   `json:"statusMessage"`
	Forkable      bool     `json:"forkable"`
	Origin        *Repo    `json:"origin"`
	Project       *Project `json:"project"`
	Public        bool     `json:"public"`
	Links         struct {
		Clone []struct {
			Href string `json:"href"`
			Name string `json:"name"`
		} `json:"clone"`
		Self []struct {
			Href string `json:"href"`
		} `json:"self"`
	} `json:"links"`
}
```

#### <a id="Repo.IsPersonalRepository" href="#Repo.IsPersonalRepository">func (r *Repo) IsPersonalRepository() bool</a>

```
searchKey: bitbucketserver.Repo.IsPersonalRepository
```

```Go
func (r *Repo) IsPersonalRepository() bool
```

IsPersonalRepository tells if the repository is a personal one. 

### <a id="Project" href="#Project">type Project struct</a>

```
searchKey: bitbucketserver.Project
```

```Go
type Project struct {
	Key    string `json:"key"`
	ID     int    `json:"id"`
	Name   string `json:"name"`
	Public bool   `json:"public"`
	Type   string `json:"type"`
	Links  struct {
		Self []struct {
			Href string `json:"href"`
		} `json:"self"`
	} `json:"links"`
}
```

### <a id="Ref" href="#Ref">type Ref struct</a>

```
searchKey: bitbucketserver.Ref
```

```Go
type Ref struct {
	ID         string `json:"id"`
	Repository struct {
		ID      int    `json:"id"`
		Slug    string `json:"slug"`
		Project struct {
			Key string `json:"key"`
		} `json:"project"`
	} `json:"repository"`
}
```

### <a id="PullRequest" href="#PullRequest">type PullRequest struct</a>

```
searchKey: bitbucketserver.PullRequest
```

```Go
type PullRequest struct {
	ID           int               `json:"id"`
	Version      int               `json:"version"`
	Title        string            `json:"title"`
	Description  string            `json:"description"`
	State        string            `json:"state"`
	Open         bool              `json:"open"`
	Closed       bool              `json:"closed"`
	CreatedDate  int               `json:"createdDate"`
	UpdatedDate  int               `json:"updatedDate"`
	FromRef      Ref               `json:"fromRef"`
	ToRef        Ref               `json:"toRef"`
	Locked       bool              `json:"locked"`
	Author       PullRequestAuthor `json:"author"`
	Reviewers    []Reviewer        `json:"reviewers"`
	Participants []Participant     `json:"participants"`
	Links        struct {
		Self []struct {
			Href string `json:"href"`
		} `json:"self"`
	} `json:"links"`

	Activities   []*Activity     `json:"activities,omitempty"`
	Commits      []*Commit       `json:"commits,omitempty"`
	CommitStatus []*CommitStatus `json:"commit_status,omitempty"`

	// Deprecated, use CommitStatus instead. BuildStatus was not tied to individual commits
	BuildStatuses []*BuildStatus `json:"buildstatuses,omitempty"`
}
```

#### <a id="ExtractDuplicatePullRequest" href="#ExtractDuplicatePullRequest">func ExtractDuplicatePullRequest(err error) (*PullRequest, error)</a>

```
searchKey: bitbucketserver.ExtractDuplicatePullRequest
```

```Go
func ExtractDuplicatePullRequest(err error) (*PullRequest, error)
```

ExtractDuplicatePullRequest will attempt to extract a duplicate PR 

### <a id="PullRequestAuthor" href="#PullRequestAuthor">type PullRequestAuthor struct</a>

```
searchKey: bitbucketserver.PullRequestAuthor
```

```Go
type PullRequestAuthor struct {
	User     *User  `json:"user"`
	Role     string `json:"role"`
	Approved bool   `json:"approved"`
	Status   string `json:"status"`
}
```

PullRequestAuthor is the author of a pull request. 

### <a id="Reviewer" href="#Reviewer">type Reviewer struct</a>

```
searchKey: bitbucketserver.Reviewer
```

```Go
type Reviewer struct {
	User               *User  `json:"user"`
	LastReviewedCommit string `json:"lastReviewedCommit"`
	Role               string `json:"role"`
	Approved           bool   `json:"approved"`
	Status             string `json:"status"`
}
```

Reviewer is a user that left feedback on a pull request. 

### <a id="Participant" href="#Participant">type Participant struct</a>

```
searchKey: bitbucketserver.Participant
```

```Go
type Participant struct {
	User     *User  `json:"user"`
	Role     string `json:"role"`
	Approved bool   `json:"approved"`
	Status   string `json:"status"`
}
```

Participant is a user that was involved in a pull request. 

### <a id="Activity" href="#Activity">type Activity struct</a>

```
searchKey: bitbucketserver.Activity
```

```Go
type Activity struct {
	ID          int            `json:"id"`
	CreatedDate int            `json:"createdDate"`
	User        User           `json:"user"`
	Action      ActivityAction `json:"action"`

	// Comment activity fields.
	CommentAction string         `json:"commentAction,omitempty"`
	Comment       *Comment       `json:"comment,omitempty"`
	CommentAnchor *CommentAnchor `json:"commentAnchor,omitempty"`

	// Reviewers change fields.
	AddedReviewers   []User `json:"addedReviewers,omitempty"`
	RemovedReviewers []User `json:"removedReviewers,omitempty"`

	// Merged event fields.
	Commit *Commit `json:"commit,omitempty"`
}
```

Activity is a union type of all supported pull request activity items. 

#### <a id="Activity.Key" href="#Activity.Key">func (a *Activity) Key() string</a>

```
searchKey: bitbucketserver.Activity.Key
```

```Go
func (a *Activity) Key() string
```

Key is a unique key identifying this activity in the context of its pull request. 

### <a id="BuildStatus" href="#BuildStatus">type BuildStatus struct</a>

```
searchKey: bitbucketserver.BuildStatus
```

```Go
type BuildStatus struct {
	State       string `json:"state,omitempty"`
	Key         string `json:"key,omitempty"`
	Name        string `json:"name,omitempty"`
	Url         string `json:"url,omitempty"`
	Description string `json:"description,omitempty"`
	DateAdded   int64  `json:"dateAdded,omitempty"`
}
```

BuildStatus represents the build status of a commit 

### <a id="CommitStatus" href="#CommitStatus">type CommitStatus struct</a>

```
searchKey: bitbucketserver.CommitStatus
```

```Go
type CommitStatus struct {
	Commit string      `json:"commit,omitempty"`
	Status BuildStatus `json:"status,omitempty"`
}
```

Commit status is the build status for a specific commit 

#### <a id="CommitStatus.Key" href="#CommitStatus.Key">func (s *CommitStatus) Key() string</a>

```
searchKey: bitbucketserver.CommitStatus.Key
```

```Go
func (s *CommitStatus) Key() string
```

### <a id="ActivityAction" href="#ActivityAction">type ActivityAction string</a>

```
searchKey: bitbucketserver.ActivityAction
```

```Go
type ActivityAction string
```

ActivityAction defines the action taken in an Activity. 

### <a id="Comment" href="#Comment">type Comment struct</a>

```
searchKey: bitbucketserver.Comment
```

```Go
type Comment struct {
	ID                  int                 `json:"id"`
	Version             int                 `json:"version"`
	Text                string              `json:"text"`
	Author              User                `json:"author"`
	CreatedDate         int                 `json:"createdDate"`
	UpdatedDate         int                 `json:"updatedDate"`
	Comments            []Comment           `json:"comments"` // Replies to the comment
	Tasks               []Task              `json:"tasks"`
	PermittedOperations PermittedOperations `json:"permittedOperations"`
}
```

A Comment in a PullRequest. 

### <a id="CommentAnchor" href="#CommentAnchor">type CommentAnchor struct</a>

```
searchKey: bitbucketserver.CommentAnchor
```

```Go
type CommentAnchor struct {
	FromHash string `json:"fromHash"`
	ToHash   string `json:"toHash"`
	Line     int    `json:"line"`
	LineType string `json:"lineType"`
	FileType string `json:"fileType"`
	Path     string `json:"path"`
	DiffType string `json:"diffType"`
	Orphaned bool   `json:"orphaned"`
}
```

A CommentAnchor captures the location of a code comment in a PullRequest. 

### <a id="Task" href="#Task">type Task struct</a>

```
searchKey: bitbucketserver.Task
```

```Go
type Task struct {
	ID                  int                 `json:"id"`
	Author              User                `json:"author"`
	Text                string              `json:"text"`
	State               string              `json:"state"`
	CreatedDate         int                 `json:"createdDate"`
	PermittedOperations PermittedOperations `json:"permittedOperations"`
}
```

A Task in a PullRequest. 

### <a id="PermittedOperations" href="#PermittedOperations">type PermittedOperations struct</a>

```
searchKey: bitbucketserver.PermittedOperations
```

```Go
type PermittedOperations struct {
	Editable       bool `json:"editable,omitempty"`
	Deletable      bool `json:"deletable,omitempty"`
	Transitionable bool `json:"transitionable,omitempty"`
}
```

PermittedOperations of a Comment or Task. 

### <a id="Commit" href="#Commit">type Commit struct</a>

```
searchKey: bitbucketserver.Commit
```

```Go
type Commit struct {
	ID                 string   `json:"id,omitempty"`
	DisplayID          string   `json:"displayId,omitempty"`
	Author             *User    `json:"user,omitempty"`
	AuthorTimestamp    int64    `json:"authorTimestamp,omitempty"`
	Committer          *User    `json:"committer,omitempty"`
	CommitterTimestamp int64    `json:"committerTimestamp,omitempty"`
	Message            string   `json:"message,omitempty"`
	Parents            []Commit `json:"parents,omitempty"`
}
```

A Commit in a Repository. 

### <a id="httpError" href="#httpError">type httpError struct</a>

```
searchKey: bitbucketserver.httpError
tags: [private]
```

```Go
type httpError struct {
	StatusCode int
	URL        *url.URL
	Body       []byte
}
```

#### <a id="httpError.Error" href="#httpError.Error">func (e *httpError) Error() string</a>

```
searchKey: bitbucketserver.httpError.Error
tags: [private]
```

```Go
func (e *httpError) Error() string
```

#### <a id="httpError.Unauthorized" href="#httpError.Unauthorized">func (e *httpError) Unauthorized() bool</a>

```
searchKey: bitbucketserver.httpError.Unauthorized
tags: [private]
```

```Go
func (e *httpError) Unauthorized() bool
```

#### <a id="httpError.NotFound" href="#httpError.NotFound">func (e *httpError) NotFound() bool</a>

```
searchKey: bitbucketserver.httpError.NotFound
tags: [private]
```

```Go
func (e *httpError) NotFound() bool
```

#### <a id="httpError.DuplicatePullRequest" href="#httpError.DuplicatePullRequest">func (e *httpError) DuplicatePullRequest() bool</a>

```
searchKey: bitbucketserver.httpError.DuplicatePullRequest
tags: [private]
```

```Go
func (e *httpError) DuplicatePullRequest() bool
```

#### <a id="httpError.NoSuchPullRequestException" href="#httpError.NoSuchPullRequestException">func (e *httpError) NoSuchPullRequestException() bool</a>

```
searchKey: bitbucketserver.httpError.NoSuchPullRequestException
tags: [private]
```

```Go
func (e *httpError) NoSuchPullRequestException() bool
```

#### <a id="httpError.NoSuchLabelException" href="#httpError.NoSuchLabelException">func (e *httpError) NoSuchLabelException() bool</a>

```
searchKey: bitbucketserver.httpError.NoSuchLabelException
tags: [private]
```

```Go
func (e *httpError) NoSuchLabelException() bool
```

#### <a id="httpError.MergePreconditionFailedException" href="#httpError.MergePreconditionFailedException">func (e *httpError) MergePreconditionFailedException() bool</a>

```
searchKey: bitbucketserver.httpError.MergePreconditionFailedException
tags: [private]
```

```Go
func (e *httpError) MergePreconditionFailedException() bool
```

#### <a id="httpError.ExtractExistingPullRequest" href="#httpError.ExtractExistingPullRequest">func (e *httpError) ExtractExistingPullRequest() (*PullRequest, error)</a>

```
searchKey: bitbucketserver.httpError.ExtractExistingPullRequest
tags: [private]
```

```Go
func (e *httpError) ExtractExistingPullRequest() (*PullRequest, error)
```

### <a id="PingEvent" href="#PingEvent">type PingEvent struct{}</a>

```
searchKey: bitbucketserver.PingEvent
```

```Go
type PingEvent struct{}
```

### <a id="PullRequestActivityEvent" href="#PullRequestActivityEvent">type PullRequestActivityEvent struct</a>

```
searchKey: bitbucketserver.PullRequestActivityEvent
```

```Go
type PullRequestActivityEvent struct {
	Date        time.Time      `json:"date"`
	Actor       User           `json:"actor"`
	PullRequest PullRequest    `json:"pullRequest"`
	Action      ActivityAction `json:"action"`
	Activity    *Activity      `json:"activity"`
}
```

### <a id="PullRequestParticipantStatusEvent" href="#PullRequestParticipantStatusEvent">type PullRequestParticipantStatusEvent struct</a>

```
searchKey: bitbucketserver.PullRequestParticipantStatusEvent
```

```Go
type PullRequestParticipantStatusEvent struct {
	*ParticipantStatusEvent
	PullRequest PullRequest `json:"pullRequest"`
}
```

### <a id="ParticipantStatusEvent" href="#ParticipantStatusEvent">type ParticipantStatusEvent struct</a>

```
searchKey: bitbucketserver.ParticipantStatusEvent
```

```Go
type ParticipantStatusEvent struct {
	CreatedDate int            `json:"createdDate"`
	User        User           `json:"user"`
	Action      ActivityAction `json:"action"`
}
```

#### <a id="ParticipantStatusEvent.Key" href="#ParticipantStatusEvent.Key">func (a *ParticipantStatusEvent) Key() string</a>

```
searchKey: bitbucketserver.ParticipantStatusEvent.Key
```

```Go
func (a *ParticipantStatusEvent) Key() string
```

### <a id="BuildStatusEvent" href="#BuildStatusEvent">type BuildStatusEvent struct</a>

```
searchKey: bitbucketserver.BuildStatusEvent
```

```Go
type BuildStatusEvent struct {
	Commit       string        `json:"commit"`
	Status       BuildStatus   `json:"status"`
	PullRequests []PullRequest `json:"pullRequests"`
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="parseQueryStrings" href="#parseQueryStrings">func parseQueryStrings(qs ...string) (url.Values, error)</a>

```
searchKey: bitbucketserver.parseQueryStrings
tags: [private]
```

```Go
func parseQueryStrings(qs ...string) (url.Values, error)
```

### <a id="categorize" href="#categorize">func categorize(u *url.URL) string</a>

```
searchKey: bitbucketserver.categorize
tags: [private]
```

```Go
func categorize(u *url.URL) string
```

categorize returns a category for an API URL. Used by metrics. 

### <a id="IsNotFound" href="#IsNotFound">func IsNotFound(err error) bool</a>

```
searchKey: bitbucketserver.IsNotFound
```

```Go
func IsNotFound(err error) bool
```

IsNotFound reports whether err is a Bitbucket Server API not found error. 

### <a id="IsUnauthorized" href="#IsUnauthorized">func IsUnauthorized(err error) bool</a>

```
searchKey: bitbucketserver.IsUnauthorized
```

```Go
func IsUnauthorized(err error) bool
```

IsUnauthorized reports whether err is a Bitbucket Server API 401 error. 

### <a id="IsNoSuchLabel" href="#IsNoSuchLabel">func IsNoSuchLabel(err error) bool</a>

```
searchKey: bitbucketserver.IsNoSuchLabel
```

```Go
func IsNoSuchLabel(err error) bool
```

IsNoSuchLabel reports whether err is a Bitbucket Server API "No Such Label" error. 

### <a id="IsDuplicatePullRequest" href="#IsDuplicatePullRequest">func IsDuplicatePullRequest(err error) bool</a>

```
searchKey: bitbucketserver.IsDuplicatePullRequest
```

```Go
func IsDuplicatePullRequest(err error) bool
```

IsDuplicatePullRequest reports whether err is a Bitbucket Server API "Duplicate Pull Request" error. 

### <a id="WebhookEventType" href="#WebhookEventType">func WebhookEventType(r *http.Request) string</a>

```
searchKey: bitbucketserver.WebhookEventType
```

```Go
func WebhookEventType(r *http.Request) string
```

### <a id="ParseWebhookEvent" href="#ParseWebhookEvent">func ParseWebhookEvent(eventType string, payload []byte) (e interface{}, err error)</a>

```
searchKey: bitbucketserver.ParseWebhookEvent
```

```Go
func ParseWebhookEvent(eventType string, payload []byte) (e interface{}, err error)
```

### <a id="normalize" href="#normalize">func normalize(path string) string</a>

```
searchKey: bitbucketserver.normalize
tags: [private]
```

```Go
func normalize(path string) string
```

### <a id="ignoreHostMatcher" href="#ignoreHostMatcher">func ignoreHostMatcher(r *http.Request, i cassette.Request) bool</a>

```
searchKey: bitbucketserver.ignoreHostMatcher
tags: [private]
```

```Go
func ignoreHostMatcher(r *http.Request, i cassette.Request) bool
```

### <a id="TestSudoableOAuthClient" href="#TestSudoableOAuthClient">func TestSudoableOAuthClient(t *testing.T)</a>

```
searchKey: bitbucketserver.TestSudoableOAuthClient
tags: [private]
```

```Go
func TestSudoableOAuthClient(t *testing.T)
```

### <a id="TestParseQueryStrings" href="#TestParseQueryStrings">func TestParseQueryStrings(t *testing.T)</a>

```
searchKey: bitbucketserver.TestParseQueryStrings
tags: [private]
```

```Go
func TestParseQueryStrings(t *testing.T)
```

### <a id="TestUserFilters" href="#TestUserFilters">func TestUserFilters(t *testing.T)</a>

```
searchKey: bitbucketserver.TestUserFilters
tags: [private]
```

```Go
func TestUserFilters(t *testing.T)
```

### <a id="TestClient_Users" href="#TestClient_Users">func TestClient_Users(t *testing.T)</a>

```
searchKey: bitbucketserver.TestClient_Users
tags: [private]
```

```Go
func TestClient_Users(t *testing.T)
```

### <a id="TestClient_LabeledRepos" href="#TestClient_LabeledRepos">func TestClient_LabeledRepos(t *testing.T)</a>

```
searchKey: bitbucketserver.TestClient_LabeledRepos
tags: [private]
```

```Go
func TestClient_LabeledRepos(t *testing.T)
```

### <a id="TestClient_LoadPullRequest" href="#TestClient_LoadPullRequest">func TestClient_LoadPullRequest(t *testing.T)</a>

```
searchKey: bitbucketserver.TestClient_LoadPullRequest
tags: [private]
```

```Go
func TestClient_LoadPullRequest(t *testing.T)
```

### <a id="TestClient_CreatePullRequest" href="#TestClient_CreatePullRequest">func TestClient_CreatePullRequest(t *testing.T)</a>

```
searchKey: bitbucketserver.TestClient_CreatePullRequest
tags: [private]
```

```Go
func TestClient_CreatePullRequest(t *testing.T)
```

### <a id="TestClient_FetchDefaultReviewers" href="#TestClient_FetchDefaultReviewers">func TestClient_FetchDefaultReviewers(t *testing.T)</a>

```
searchKey: bitbucketserver.TestClient_FetchDefaultReviewers
tags: [private]
```

```Go
func TestClient_FetchDefaultReviewers(t *testing.T)
```

### <a id="TestClient_DeclinePullRequest" href="#TestClient_DeclinePullRequest">func TestClient_DeclinePullRequest(t *testing.T)</a>

```
searchKey: bitbucketserver.TestClient_DeclinePullRequest
tags: [private]
```

```Go
func TestClient_DeclinePullRequest(t *testing.T)
```

### <a id="TestClient_LoadPullRequestActivities" href="#TestClient_LoadPullRequestActivities">func TestClient_LoadPullRequestActivities(t *testing.T)</a>

```
searchKey: bitbucketserver.TestClient_LoadPullRequestActivities
tags: [private]
```

```Go
func TestClient_LoadPullRequestActivities(t *testing.T)
```

### <a id="TestClient_CreatePullRequestComment" href="#TestClient_CreatePullRequestComment">func TestClient_CreatePullRequestComment(t *testing.T)</a>

```
searchKey: bitbucketserver.TestClient_CreatePullRequestComment
tags: [private]
```

```Go
func TestClient_CreatePullRequestComment(t *testing.T)
```

### <a id="TestClient_MergePullRequest" href="#TestClient_MergePullRequest">func TestClient_MergePullRequest(t *testing.T)</a>

```
searchKey: bitbucketserver.TestClient_MergePullRequest
tags: [private]
```

```Go
func TestClient_MergePullRequest(t *testing.T)
```

### <a id="TestClient_RepoIDs" href="#TestClient_RepoIDs">func TestClient_RepoIDs(t *testing.T)</a>

```
searchKey: bitbucketserver.TestClient_RepoIDs
tags: [private]
```

```Go
func TestClient_RepoIDs(t *testing.T)
```

NOTE: This test validates that correct repository IDs are returned from the roaring bitmap permissions endpoint. Therefore, the expected results are dependent on the user token supplied. The current golden files are generated from using the account zoom@sourcegraph.com on bitbucket.sgdev.org. 

### <a id="checkGolden" href="#checkGolden">func checkGolden(t *testing.T, name string, got interface{})</a>

```
searchKey: bitbucketserver.checkGolden
tags: [private]
```

```Go
func checkGolden(t *testing.T, name string, got interface{})
```

### <a id="TestAuth" href="#TestAuth">func TestAuth(t *testing.T)</a>

```
searchKey: bitbucketserver.TestAuth
tags: [private]
```

```Go
func TestAuth(t *testing.T)
```

### <a id="TestClient_WithAuthenticator" href="#TestClient_WithAuthenticator">func TestClient_WithAuthenticator(t *testing.T)</a>

```
searchKey: bitbucketserver.TestClient_WithAuthenticator
tags: [private]
```

```Go
func TestClient_WithAuthenticator(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: bitbucketserver.TestMain
tags: [private]
```

```Go
func TestMain(m *testing.M)
```

