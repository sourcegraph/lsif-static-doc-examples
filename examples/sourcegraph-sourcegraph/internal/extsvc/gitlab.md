# Package gitlab

Package gitlab implements a GitLab API client. 

## Index

* Subpages
  * [internal/extsvc/gitlab/webhooks](gitlab/webhooks.md)
* [Constants](#const)
    * [const TokenTypePAT](#TokenTypePAT)
    * [const TokenTypeOAuth](#TokenTypeOAuth)
    * [const MergeRequestStateOpened](#MergeRequestStateOpened)
    * [const MergeRequestStateClosed](#MergeRequestStateClosed)
    * [const MergeRequestStateLocked](#MergeRequestStateLocked)
    * [const MergeRequestStateMerged](#MergeRequestStateMerged)
    * [const UpdateMergeRequestStateEventClose](#UpdateMergeRequestStateEventClose)
    * [const UpdateMergeRequestStateEventReopen](#UpdateMergeRequestStateEventReopen)
    * [const UpdateMergeRequestStateEventUnchanged](#UpdateMergeRequestStateEventUnchanged)
    * [const SystemNoteBodyReviewApproved](#SystemNoteBodyReviewApproved)
    * [const SystemNoteBodyReviewUnapproved](#SystemNoteBodyReviewUnapproved)
    * [const SystemNoteBodyUnmarkedWorkInProgress](#SystemNoteBodyUnmarkedWorkInProgress)
    * [const SystemNoteBodyMarkedWorkInProgress](#SystemNoteBodyMarkedWorkInProgress)
    * [const SystemNoteBodyMarkedDraft](#SystemNoteBodyMarkedDraft)
    * [const SystemNoteBodyMarkedReady](#SystemNoteBodyMarkedReady)
    * [const PipelineStatusRunning](#PipelineStatusRunning)
    * [const PipelineStatusPending](#PipelineStatusPending)
    * [const PipelineStatusSuccess](#PipelineStatusSuccess)
    * [const PipelineStatusFailed](#PipelineStatusFailed)
    * [const PipelineStatusCanceled](#PipelineStatusCanceled)
    * [const PipelineStatusSkipped](#PipelineStatusSkipped)
    * [const PipelineStatusCreated](#PipelineStatusCreated)
    * [const PipelineStatusManual](#PipelineStatusManual)
    * [const Public](#Public)
    * [const Private](#Private)
    * [const Internal](#Internal)
    * [const ResourceStateEventStateClosed](#ResourceStateEventStateClosed)
    * [const ResourceStateEventStateReopened](#ResourceStateEventStateReopened)
    * [const ResourceStateEventStateMerged](#ResourceStateEventStateMerged)
* [Variables](#var)
    * [var requestCounter](#requestCounter)
    * [var traceEnabled](#traceEnabled)
    * [var ErrProjectNotFound](#ErrProjectNotFound)
    * [var ErrMergeRequestNotFound](#ErrMergeRequestNotFound)
    * [var ErrMergeRequestAlreadyExists](#ErrMergeRequestAlreadyExists)
    * [var ErrTooManyMergeRequests](#ErrTooManyMergeRequests)
    * [var ErrNotMergeable](#ErrNotMergeable)
    * [var MockListProjects](#MockListProjects)
    * [var MockListUsers](#MockListUsers)
    * [var MockGetUser](#MockGetUser)
    * [var MockGetProject](#MockGetProject)
    * [var MockListTree](#MockListTree)
    * [var MockCreateMergeRequest](#MockCreateMergeRequest)
    * [var MockGetMergeRequest](#MockGetMergeRequest)
    * [var MockGetMergeRequestResourceStateEvents](#MockGetMergeRequestResourceStateEvents)
    * [var MockGetMergeRequestNotes](#MockGetMergeRequestNotes)
    * [var MockGetMergeRequestPipelines](#MockGetMergeRequestPipelines)
    * [var MockGetOpenMergeRequestByRefs](#MockGetOpenMergeRequestByRefs)
    * [var MockUpdateMergeRequest](#MockUpdateMergeRequest)
    * [var MockMergeMergeRequest](#MockMergeMergeRequest)
    * [var MockCreateMergeRequestNote](#MockCreateMergeRequestNote)
    * [var projectsGitLabCacheCounter](#projectsGitLabCacheCounter)
    * [var ListTreeMock](#ListTreeMock)
    * [var updateRegex](#updateRegex)
* [Types](#type)
    * [type SudoableToken struct](#SudoableToken)
        * [func (pat *SudoableToken) Authenticate(req *http.Request) error](#SudoableToken.Authenticate)
        * [func (pat *SudoableToken) Hash() string](#SudoableToken.Hash)
    * [type TokenType string](#TokenType)
    * [type ClientProvider struct](#ClientProvider)
        * [func NewClientProvider(baseURL *url.URL, cli httpcli.Doer) *ClientProvider](#NewClientProvider)
        * [func createTestProvider(t *testing.T) *ClientProvider](#createTestProvider)
        * [func (p *ClientProvider) GetAuthenticatorClient(a auth.Authenticator) *Client](#ClientProvider.GetAuthenticatorClient)
        * [func (p *ClientProvider) GetPATClient(personalAccessToken, sudo string) *Client](#ClientProvider.GetPATClient)
        * [func (p *ClientProvider) GetOAuthClient(oauthToken string) *Client](#ClientProvider.GetOAuthClient)
        * [func (p *ClientProvider) GetClient() *Client](#ClientProvider.GetClient)
        * [func (p *ClientProvider) getClient(a auth.Authenticator) *Client](#ClientProvider.getClient)
        * [func (p *ClientProvider) newClient(baseURL *url.URL, a auth.Authenticator, httpClient httpcli.Doer) *Client](#ClientProvider.newClient)
    * [type CommonOp struct](#CommonOp)
    * [type Client struct](#Client)
        * [func newTestClient(t *testing.T) *Client](#newTestClient)
        * [func (c *Client) do(ctx context.Context, req *http.Request, result interface{}) (responseHeader http.Header, responseCode int, err error)](#Client.do)
        * [func (c *Client) doWithBaseURL(ctx context.Context, req *http.Request, result interface{}) (responseHeader http.Header, responseCode int, err error)](#Client.doWithBaseURL)
        * [func (c *Client) RateLimitMonitor() *ratelimit.Monitor](#Client.RateLimitMonitor)
        * [func (c *Client) WithAuthenticator(a auth.Authenticator) *Client](#Client.WithAuthenticator)
        * [func (c *Client) ValidateToken(ctx context.Context) error](#Client.ValidateToken)
        * [func (c *Client) GetAuthenticatedUserOAuthScopes(ctx context.Context) ([]string, error)](#Client.GetAuthenticatedUserOAuthScopes)
        * [func (c *Client) ListMembers(ctx context.Context, urlStr string) (members []*Member, nextPageURL *string, err error)](#Client.ListMembers)
        * [func (c *Client) CreateMergeRequest(ctx context.Context, project *Project, opts CreateMergeRequestOpts) (*MergeRequest, error)](#Client.CreateMergeRequest)
        * [func (c *Client) GetMergeRequest(ctx context.Context, project *Project, iid ID) (*MergeRequest, error)](#Client.GetMergeRequest)
        * [func (c *Client) GetOpenMergeRequestByRefs(ctx context.Context, project *Project, source, target string) (*MergeRequest, error)](#Client.GetOpenMergeRequestByRefs)
        * [func (c *Client) UpdateMergeRequest(ctx context.Context, project *Project, mr *MergeRequest, opts UpdateMergeRequestOpts) (*MergeRequest, error)](#Client.UpdateMergeRequest)
        * [func (c *Client) MergeMergeRequest(ctx context.Context, project *Project, mr *MergeRequest, squash bool) (*MergeRequest, error)](#Client.MergeMergeRequest)
        * [func (c *Client) CreateMergeRequestNote(ctx context.Context, project *Project, mr *MergeRequest, body string) error](#Client.CreateMergeRequestNote)
        * [func (c *Client) GetMergeRequestNotes(ctx context.Context, project *Project, iid ID) func() ([]*Note, error)](#Client.GetMergeRequestNotes)
        * [func (c *Client) GetMergeRequestPipelines(ctx context.Context, project *Project, iid ID) func() ([]*Pipeline, error)](#Client.GetMergeRequestPipelines)
        * [func (c *Client) GetProject(ctx context.Context, op GetProjectOp) (*Project, error)](#Client.GetProject)
        * [func (c *Client) cachedGetProject(ctx context.Context, key string, forceFetch bool, getProjectFromAPI func(context.Context) (proj *Project, keys []string, err error)) (*Project, error)](#Client.cachedGetProject)
        * [func (c *Client) getProjectFromCache(ctx context.Context, key string) *cachedProj](#Client.getProjectFromCache)
        * [func (c *Client) addProjectToCache(keys []string, proj *cachedProj)](#Client.addProjectToCache)
        * [func (c *Client) getProjectFromAPI(ctx context.Context, id int, pathWithNamespace string) (proj *Project, err error)](#Client.getProjectFromAPI)
        * [func (c *Client) ListProjects(ctx context.Context, urlStr string) (projs []*Project, nextPageURL *string, err error)](#Client.ListProjects)
        * [func (c *Client) ListTree(ctx context.Context, op ListTreeOp) ([]*Tree, error)](#Client.ListTree)
        * [func (c *Client) listTreeFromAPI(ctx context.Context, projID int, projPathWithNamespace string) (tree []*Tree, err error)](#Client.listTreeFromAPI)
        * [func (c *Client) GetMergeRequestResourceStateEvents(ctx context.Context, project *Project, iid ID) func() ([]*ResourceStateEvent, error)](#Client.GetMergeRequestResourceStateEvents)
        * [func (c *Client) ListUsers(ctx context.Context, urlStr string) (users []*User, nextPageURL *string, err error)](#Client.ListUsers)
        * [func (c *Client) GetUser(ctx context.Context, id string) (*User, error)](#Client.GetUser)
    * [type HTTPError struct](#HTTPError)
        * [func NewHTTPError(code int, body []byte) HTTPError](#NewHTTPError)
        * [func (err HTTPError) Code() int](#HTTPError.Code)
        * [func (err HTTPError) Message() string](#HTTPError.Message)
        * [func (err HTTPError) Error() string](#HTTPError.Error)
        * [func (err HTTPError) Unauthorized() bool](#HTTPError.Unauthorized)
        * [func (err HTTPError) Forbidden() bool](#HTTPError.Forbidden)
    * [type Label struct](#Label)
    * [type Member struct](#Member)
    * [type ID int64](#ID)
    * [type MergeRequestState string](#MergeRequestState)
    * [type MergeRequest struct](#MergeRequest)
    * [type DiffRefs struct](#DiffRefs)
    * [type CreateMergeRequestOpts struct](#CreateMergeRequestOpts)
    * [type UpdateMergeRequestOpts struct](#UpdateMergeRequestOpts)
    * [type UpdateMergeRequestStateEvent string](#UpdateMergeRequestStateEvent)
    * [type SystemNoteBody string](#SystemNoteBody)
    * [type Note struct](#Note)
        * [func (n *Note) ToEvent() keyer](#Note.ToEvent)
    * [type ReviewApprovedEvent struct](#ReviewApprovedEvent)
        * [func (e *ReviewApprovedEvent) Key() string](#ReviewApprovedEvent.Key)
    * [type ReviewUnapprovedEvent struct](#ReviewUnapprovedEvent)
        * [func (e *ReviewUnapprovedEvent) Key() string](#ReviewUnapprovedEvent.Key)
    * [type MarkWorkInProgressEvent struct](#MarkWorkInProgressEvent)
        * [func (e *MarkWorkInProgressEvent) Key() string](#MarkWorkInProgressEvent.Key)
    * [type UnmarkWorkInProgressEvent struct](#UnmarkWorkInProgressEvent)
        * [func (e *UnmarkWorkInProgressEvent) Key() string](#UnmarkWorkInProgressEvent.Key)
    * [type keyer interface](#keyer)
    * [type Pipeline struct](#Pipeline)
        * [func (p *Pipeline) Key() string](#Pipeline.Key)
    * [type PipelineStatus string](#PipelineStatus)
    * [type Visibility string](#Visibility)
    * [type Project struct](#Project)
        * [func (p Project) RequiresAuthentication() bool](#Project.RequiresAuthentication)
    * [type ProjectCommon struct](#ProjectCommon)
    * [type GetProjectOp struct](#GetProjectOp)
    * [type cachedProj struct](#cachedProj)
    * [type Tree struct](#Tree)
    * [type ListTreeOp struct](#ListTreeOp)
    * [type ResourceStateEventState string](#ResourceStateEventState)
    * [type ResourceStateEvent struct](#ResourceStateEvent)
        * [func (rse *ResourceStateEvent) ToEvent() interface{}](#ResourceStateEvent.ToEvent)
    * [type MergeRequestClosedEvent struct](#MergeRequestClosedEvent)
        * [func (e *MergeRequestClosedEvent) Key() string](#MergeRequestClosedEvent.Key)
    * [type MergeRequestReopenedEvent struct](#MergeRequestReopenedEvent)
        * [func (e *MergeRequestReopenedEvent) Key() string](#MergeRequestReopenedEvent.Key)
    * [type MergeRequestMergedEvent struct](#MergeRequestMergedEvent)
        * [func (e *MergeRequestMergedEvent) Key() string](#MergeRequestMergedEvent.Key)
    * [type mockHTTPResponseBody struct](#mockHTTPResponseBody)
        * [func (s *mockHTTPResponseBody) Do(req *http.Request) (*http.Response, error)](#mockHTTPResponseBody.Do)
    * [type mockHTTPEmptyResponse struct](#mockHTTPEmptyResponse)
        * [func (s mockHTTPEmptyResponse) Do(req *http.Request) (*http.Response, error)](#mockHTTPEmptyResponse.Do)
    * [type Time struct](#Time)
        * [func (t *Time) UnmarshalJSON(data []byte) error](#Time.UnmarshalJSON)
    * [type User struct](#User)
        * [func GetExternalAccountData(data *extsvc.AccountData) (usr *User, tok *oauth2.Token, err error)](#GetExternalAccountData)
    * [type Identity struct](#Identity)
* [Functions](#func)
    * [func init()](#init)
    * [func trace(msg string, ctx ...interface{})](#trace)
    * [func isGitLabDotComURL(baseURL *url.URL) bool](#isGitLabDotComURL)
    * [func HTTPErrorCode(err error) int](#HTTPErrorCode)
    * [func IsNotFound(err error) bool](#IsNotFound)
    * [func ExternalRepoSpec(proj *Project, baseURL url.URL) api.ExternalRepoSpec](#ExternalRepoSpec)
    * [func IsWIP(title string) bool](#IsWIP)
    * [func SetWIP(title string) string](#SetWIP)
    * [func UnsetWIP(title string) string](#UnsetWIP)
    * [func idCacheKey(id int) string](#idCacheKey)
    * [func pathWithNamespaceCacheKey(pathWithNamespace string) string](#pathWithNamespaceCacheKey)
    * [func MockGetProject_Return(returns *Project)](#MockGetProject_Return)
    * [func SetExternalAccountData(data *extsvc.AccountData, user *User, token *oauth2.Token)](#SetExternalAccountData)
    * [func TestSudoableToken(t *testing.T)](#TestSudoableToken)
    * [func TestGetAuthenticatedUserOAuthScopes(t *testing.T)](#TestGetAuthenticatedUserOAuthScopes)
    * [func update(name string) bool](#update)
    * [func TestWIP(t *testing.T)](#TestWIP)
    * [func TestCreateMergeRequest(t *testing.T)](#TestCreateMergeRequest)
    * [func TestGetMergeRequest(t *testing.T)](#TestGetMergeRequest)
    * [func TestGetOpenMergeRequestByRefs(t *testing.T)](#TestGetOpenMergeRequestByRefs)
    * [func TestUpdateMergeRequest(t *testing.T)](#TestUpdateMergeRequest)
    * [func TestCreateMergeRequestNote(t *testing.T)](#TestCreateMergeRequestNote)
    * [func TestMergeMergeRequest(t *testing.T)](#TestMergeMergeRequest)
    * [func TestGetMergeRequestNotes(t *testing.T)](#TestGetMergeRequestNotes)
    * [func TestNoteToEvent(t *testing.T)](#TestNoteToEvent)
    * [func TestGetMergeRequestPipelines(t *testing.T)](#TestGetMergeRequestPipelines)
    * [func TestPipelineKey(t *testing.T)](#TestPipelineKey)
    * [func TestClient_GetProject(t *testing.T)](#TestClient_GetProject)
    * [func TestClient_GetProject_nonexistent(t *testing.T)](#TestClient_GetProject_nonexistent)
    * [func TestListTree(t *testing.T)](#TestListTree)
    * [func TestTimeUnmarshal(t *testing.T)](#TestTimeUnmarshal)


## <a id="const" href="#const">Constants</a>

### <a id="TokenTypePAT" href="#TokenTypePAT">const TokenTypePAT</a>

```
searchKey: gitlab.TokenTypePAT
tags: [exported]
```

```Go
const TokenTypePAT TokenType = "pat" // "pat" represents personal access token.

```

### <a id="TokenTypeOAuth" href="#TokenTypeOAuth">const TokenTypeOAuth</a>

```
searchKey: gitlab.TokenTypeOAuth
tags: [exported]
```

```Go
const TokenTypeOAuth TokenType = "oauth" // "oauth" represents OAuth token.

```

### <a id="MergeRequestStateOpened" href="#MergeRequestStateOpened">const MergeRequestStateOpened</a>

```
searchKey: gitlab.MergeRequestStateOpened
tags: [exported]
```

```Go
const MergeRequestStateOpened MergeRequestState = "opened"
```

### <a id="MergeRequestStateClosed" href="#MergeRequestStateClosed">const MergeRequestStateClosed</a>

```
searchKey: gitlab.MergeRequestStateClosed
tags: [exported]
```

```Go
const MergeRequestStateClosed MergeRequestState = "closed"
```

### <a id="MergeRequestStateLocked" href="#MergeRequestStateLocked">const MergeRequestStateLocked</a>

```
searchKey: gitlab.MergeRequestStateLocked
tags: [exported]
```

```Go
const MergeRequestStateLocked MergeRequestState = "locked"
```

### <a id="MergeRequestStateMerged" href="#MergeRequestStateMerged">const MergeRequestStateMerged</a>

```
searchKey: gitlab.MergeRequestStateMerged
tags: [exported]
```

```Go
const MergeRequestStateMerged MergeRequestState = "merged"
```

### <a id="UpdateMergeRequestStateEventClose" href="#UpdateMergeRequestStateEventClose">const UpdateMergeRequestStateEventClose</a>

```
searchKey: gitlab.UpdateMergeRequestStateEventClose
tags: [exported]
```

```Go
const UpdateMergeRequestStateEventClose UpdateMergeRequestStateEvent = "close"
```

### <a id="UpdateMergeRequestStateEventReopen" href="#UpdateMergeRequestStateEventReopen">const UpdateMergeRequestStateEventReopen</a>

```
searchKey: gitlab.UpdateMergeRequestStateEventReopen
tags: [exported]
```

```Go
const UpdateMergeRequestStateEventReopen UpdateMergeRequestStateEvent = "reopen"
```

### <a id="UpdateMergeRequestStateEventUnchanged" href="#UpdateMergeRequestStateEventUnchanged">const UpdateMergeRequestStateEventUnchanged</a>

```
searchKey: gitlab.UpdateMergeRequestStateEventUnchanged
tags: [exported]
```

```Go
const UpdateMergeRequestStateEventUnchanged UpdateMergeRequestStateEvent = ""
```

GitLab's update MR API is also used to perform state transitions on MRs: they can be closed or reopened by setting a specific field exposed via UpdateMergeRequestOpts above. To update a merge request _without_ changing the state, you omit that field, which is done via the combination of this empty string constant and the omitempty JSON option above on the relevant field. 

### <a id="SystemNoteBodyReviewApproved" href="#SystemNoteBodyReviewApproved">const SystemNoteBodyReviewApproved</a>

```
searchKey: gitlab.SystemNoteBodyReviewApproved
tags: [exported]
```

```Go
const SystemNoteBodyReviewApproved SystemNoteBody = "approved this merge request"
```

### <a id="SystemNoteBodyReviewUnapproved" href="#SystemNoteBodyReviewUnapproved">const SystemNoteBodyReviewUnapproved</a>

```
searchKey: gitlab.SystemNoteBodyReviewUnapproved
tags: [exported]
```

```Go
const SystemNoteBodyReviewUnapproved SystemNoteBody = "unapproved this merge request"
```

### <a id="SystemNoteBodyUnmarkedWorkInProgress" href="#SystemNoteBodyUnmarkedWorkInProgress">const SystemNoteBodyUnmarkedWorkInProgress</a>

```
searchKey: gitlab.SystemNoteBodyUnmarkedWorkInProgress
tags: [exported]
```

```Go
const SystemNoteBodyUnmarkedWorkInProgress SystemNoteBody = "unmarked as a **Work In Progress**"
```

### <a id="SystemNoteBodyMarkedWorkInProgress" href="#SystemNoteBodyMarkedWorkInProgress">const SystemNoteBodyMarkedWorkInProgress</a>

```
searchKey: gitlab.SystemNoteBodyMarkedWorkInProgress
tags: [exported]
```

```Go
const SystemNoteBodyMarkedWorkInProgress SystemNoteBody = "marked as a **Work In Progress**"
```

### <a id="SystemNoteBodyMarkedDraft" href="#SystemNoteBodyMarkedDraft">const SystemNoteBodyMarkedDraft</a>

```
searchKey: gitlab.SystemNoteBodyMarkedDraft
tags: [exported]
```

```Go
const SystemNoteBodyMarkedDraft SystemNoteBody = "marked this merge request as **draft**"
```

### <a id="SystemNoteBodyMarkedReady" href="#SystemNoteBodyMarkedReady">const SystemNoteBodyMarkedReady</a>

```
searchKey: gitlab.SystemNoteBodyMarkedReady
tags: [exported]
```

```Go
const SystemNoteBodyMarkedReady SystemNoteBody = "marked this merge request as **ready**"
```

### <a id="PipelineStatusRunning" href="#PipelineStatusRunning">const PipelineStatusRunning</a>

```
searchKey: gitlab.PipelineStatusRunning
tags: [exported]
```

```Go
const PipelineStatusRunning PipelineStatus = "running"
```

### <a id="PipelineStatusPending" href="#PipelineStatusPending">const PipelineStatusPending</a>

```
searchKey: gitlab.PipelineStatusPending
tags: [exported]
```

```Go
const PipelineStatusPending PipelineStatus = "pending"
```

### <a id="PipelineStatusSuccess" href="#PipelineStatusSuccess">const PipelineStatusSuccess</a>

```
searchKey: gitlab.PipelineStatusSuccess
tags: [exported]
```

```Go
const PipelineStatusSuccess PipelineStatus = "success"
```

### <a id="PipelineStatusFailed" href="#PipelineStatusFailed">const PipelineStatusFailed</a>

```
searchKey: gitlab.PipelineStatusFailed
tags: [exported]
```

```Go
const PipelineStatusFailed PipelineStatus = "failed"
```

### <a id="PipelineStatusCanceled" href="#PipelineStatusCanceled">const PipelineStatusCanceled</a>

```
searchKey: gitlab.PipelineStatusCanceled
tags: [exported]
```

```Go
const PipelineStatusCanceled PipelineStatus = "canceled"
```

### <a id="PipelineStatusSkipped" href="#PipelineStatusSkipped">const PipelineStatusSkipped</a>

```
searchKey: gitlab.PipelineStatusSkipped
tags: [exported]
```

```Go
const PipelineStatusSkipped PipelineStatus = "skipped"
```

### <a id="PipelineStatusCreated" href="#PipelineStatusCreated">const PipelineStatusCreated</a>

```
searchKey: gitlab.PipelineStatusCreated
tags: [exported]
```

```Go
const PipelineStatusCreated PipelineStatus = "created"
```

### <a id="PipelineStatusManual" href="#PipelineStatusManual">const PipelineStatusManual</a>

```
searchKey: gitlab.PipelineStatusManual
tags: [exported]
```

```Go
const PipelineStatusManual PipelineStatus = "manual"
```

### <a id="Public" href="#Public">const Public</a>

```
searchKey: gitlab.Public
tags: [exported]
```

```Go
const Public Visibility = "public"
```

### <a id="Private" href="#Private">const Private</a>

```
searchKey: gitlab.Private
tags: [exported]
```

```Go
const Private Visibility = "private"
```

### <a id="Internal" href="#Internal">const Internal</a>

```
searchKey: gitlab.Internal
tags: [exported]
```

```Go
const Internal Visibility = "internal"
```

### <a id="ResourceStateEventStateClosed" href="#ResourceStateEventStateClosed">const ResourceStateEventStateClosed</a>

```
searchKey: gitlab.ResourceStateEventStateClosed
tags: [exported]
```

```Go
const ResourceStateEventStateClosed ResourceStateEventState = "closed"
```

### <a id="ResourceStateEventStateReopened" href="#ResourceStateEventStateReopened">const ResourceStateEventStateReopened</a>

```
searchKey: gitlab.ResourceStateEventStateReopened
tags: [exported]
```

```Go
const ResourceStateEventStateReopened ResourceStateEventState = "reopened"
```

### <a id="ResourceStateEventStateMerged" href="#ResourceStateEventStateMerged">const ResourceStateEventStateMerged</a>

```
searchKey: gitlab.ResourceStateEventStateMerged
tags: [exported]
```

```Go
const ResourceStateEventStateMerged ResourceStateEventState = "merged"
```

## <a id="var" href="#var">Variables</a>

### <a id="requestCounter" href="#requestCounter">var requestCounter</a>

```
searchKey: gitlab.requestCounter
```

```Go
var requestCounter = ...
```

### <a id="traceEnabled" href="#traceEnabled">var traceEnabled</a>

```
searchKey: gitlab.traceEnabled
```

```Go
var traceEnabled int32 = 0
```

Whether debug logging is turned on 

### <a id="ErrProjectNotFound" href="#ErrProjectNotFound">var ErrProjectNotFound</a>

```
searchKey: gitlab.ErrProjectNotFound
tags: [exported]
```

```Go
var ErrProjectNotFound = errors.New("GitLab project not found")
```

ErrProjectNotFound is when the requested GitLab project is not found. 

### <a id="ErrMergeRequestNotFound" href="#ErrMergeRequestNotFound">var ErrMergeRequestNotFound</a>

```
searchKey: gitlab.ErrMergeRequestNotFound
tags: [exported]
```

```Go
var ErrMergeRequestNotFound = errors.New("GitLab merge request not found")
```

ErrMergeRequestNotFound is when the requested GitLab merge request is not found. 

### <a id="ErrMergeRequestAlreadyExists" href="#ErrMergeRequestAlreadyExists">var ErrMergeRequestAlreadyExists</a>

```
searchKey: gitlab.ErrMergeRequestAlreadyExists
tags: [exported]
```

```Go
var ErrMergeRequestAlreadyExists = errors.New("merge request already exists")
```

### <a id="ErrTooManyMergeRequests" href="#ErrTooManyMergeRequests">var ErrTooManyMergeRequests</a>

```
searchKey: gitlab.ErrTooManyMergeRequests
tags: [exported]
```

```Go
var ErrTooManyMergeRequests = errors.New("retrieved too many merge requests")
```

### <a id="ErrNotMergeable" href="#ErrNotMergeable">var ErrNotMergeable</a>

```
searchKey: gitlab.ErrNotMergeable
tags: [exported]
```

```Go
var ErrNotMergeable = errors.New("merge request is not in a mergeable state")
```

ErrNotMergeable is returned by MergeMergeRequest when the merge request cannot be merged, because a precondition isn't met. 

### <a id="MockListProjects" href="#MockListProjects">var MockListProjects</a>

```
searchKey: gitlab.MockListProjects
tags: [exported]
```

```Go
var MockListProjects func(c *Client, ctx context.Context, urlStr string) (proj []*Project, nextPageURL *string, err error) = ...
```

MockListProjects, if non-nil, will be called instead of every invocation of Client.ListProjects. 

### <a id="MockListUsers" href="#MockListUsers">var MockListUsers</a>

```
searchKey: gitlab.MockListUsers
tags: [exported]
```

```Go
var MockListUsers func(c *Client, ctx context.Context, urlStr string) (users []*User, nextPageURL *string, err error) = ...
```

MockListUsers, if non-nil, will be called instead of Client.ListUsers 

### <a id="MockGetUser" href="#MockGetUser">var MockGetUser</a>

```
searchKey: gitlab.MockGetUser
tags: [exported]
```

```Go
var MockGetUser func(c *Client, ctx context.Context, id string) (*User, error)
```

MockGetUser, if non-nil, will be called instead of Client.GetUser 

### <a id="MockGetProject" href="#MockGetProject">var MockGetProject</a>

```
searchKey: gitlab.MockGetProject
tags: [exported]
```

```Go
var MockGetProject func(c *Client, ctx context.Context, op GetProjectOp) (*Project, error)
```

MockGetProject, if non-nil, will be called instead of Client.GetProject 

### <a id="MockListTree" href="#MockListTree">var MockListTree</a>

```
searchKey: gitlab.MockListTree
tags: [exported]
```

```Go
var MockListTree func(c *Client, ctx context.Context, op ListTreeOp) ([]*Tree, error)
```

MockListTree, if non-nil, will be called instead of Client.ListTree 

### <a id="MockCreateMergeRequest" href="#MockCreateMergeRequest">var MockCreateMergeRequest</a>

```
searchKey: gitlab.MockCreateMergeRequest
tags: [exported]
```

```Go
var MockCreateMergeRequest func(c *Client, ctx context.Context, project *Project, opts CreateMergeRequestOpts) (*MergeRequest, error) = ...
```

MockCreateMergeRequest, if non-nil, will be called instead of Client.CreateMergeRequest 

### <a id="MockGetMergeRequest" href="#MockGetMergeRequest">var MockGetMergeRequest</a>

```
searchKey: gitlab.MockGetMergeRequest
tags: [exported]
```

```Go
var MockGetMergeRequest func(c *Client, ctx context.Context, project *Project, iid ID) (*MergeRequest, error) = ...
```

MockGetMergeRequest, if non-nil, will be called instead of Client.GetMergeRequest 

### <a id="MockGetMergeRequestResourceStateEvents" href="#MockGetMergeRequestResourceStateEvents">var MockGetMergeRequestResourceStateEvents</a>

```
searchKey: gitlab.MockGetMergeRequestResourceStateEvents
tags: [exported]
```

```Go
var MockGetMergeRequestResourceStateEvents func(c *Client, ctx context.Context, project *Project, iid ID) func() ([]*ResourceStateEvent, error) = ...
```

MockGetMergeRequestResourceStateEvents, if non-nil, will be called instead of Client.GetMergeRequestResourceStateEvents 

### <a id="MockGetMergeRequestNotes" href="#MockGetMergeRequestNotes">var MockGetMergeRequestNotes</a>

```
searchKey: gitlab.MockGetMergeRequestNotes
tags: [exported]
```

```Go
var MockGetMergeRequestNotes func(c *Client, ctx context.Context, project *Project, iid ID) func() ([]*Note, error) = ...
```

MockGetMergeRequestNotes, if non-nil, will be called instead of Client.GetMergeRequestNotes 

### <a id="MockGetMergeRequestPipelines" href="#MockGetMergeRequestPipelines">var MockGetMergeRequestPipelines</a>

```
searchKey: gitlab.MockGetMergeRequestPipelines
tags: [exported]
```

```Go
var MockGetMergeRequestPipelines func(c *Client, ctx context.Context, project *Project, iid ID) func() ([]*Pipeline, error) = ...
```

MockGetMergeRequestPipelines, if non-nil, will be called instead of Client.GetMergeRequestPipelines 

### <a id="MockGetOpenMergeRequestByRefs" href="#MockGetOpenMergeRequestByRefs">var MockGetOpenMergeRequestByRefs</a>

```
searchKey: gitlab.MockGetOpenMergeRequestByRefs
tags: [exported]
```

```Go
var MockGetOpenMergeRequestByRefs func(c *Client, ctx context.Context, project *Project, source, target string) (*MergeRequest, error) = ...
```

MockGetOpenMergeRequestByRefs, if non-nil, will be called instead of Client.GetOpenMergeRequestByRefs 

### <a id="MockUpdateMergeRequest" href="#MockUpdateMergeRequest">var MockUpdateMergeRequest</a>

```
searchKey: gitlab.MockUpdateMergeRequest
tags: [exported]
```

```Go
var MockUpdateMergeRequest func(c *Client, ctx context.Context, project *Project, mr *MergeRequest, opts UpdateMergeRequestOpts) (*MergeRequest, error) = ...
```

MockUpdateMergeRequest, if non-nil, will be called instead of Client.UpdateMergeRequest 

### <a id="MockMergeMergeRequest" href="#MockMergeMergeRequest">var MockMergeMergeRequest</a>

```
searchKey: gitlab.MockMergeMergeRequest
tags: [exported]
```

```Go
var MockMergeMergeRequest func(c *Client, ctx context.Context, project *Project, mr *MergeRequest, squash bool) (*MergeRequest, error) = ...
```

MockMergeMergeRequest, if non-nil, will be called instead of Client.MergeMergeRequest 

### <a id="MockCreateMergeRequestNote" href="#MockCreateMergeRequestNote">var MockCreateMergeRequestNote</a>

```
searchKey: gitlab.MockCreateMergeRequestNote
tags: [exported]
```

```Go
var MockCreateMergeRequestNote func(c *Client, ctx context.Context, project *Project, mr *MergeRequest, body string) error = ...
```

MockCreateMergeRequestNote, if non-nil, will be called instead of Client.CreateMergeRequestNote 

### <a id="projectsGitLabCacheCounter" href="#projectsGitLabCacheCounter">var projectsGitLabCacheCounter</a>

```
searchKey: gitlab.projectsGitLabCacheCounter
```

```Go
var projectsGitLabCacheCounter = ...
```

### <a id="ListTreeMock" href="#ListTreeMock">var ListTreeMock</a>

```
searchKey: gitlab.ListTreeMock
tags: [exported]
```

```Go
var ListTreeMock func(ctx context.Context, op ListTreeOp) ([]*Tree, error)
```

### <a id="updateRegex" href="#updateRegex">var updateRegex</a>

```
searchKey: gitlab.updateRegex
```

```Go
var updateRegex = flag.String("update", "", "Update testdata of tests matching the given regex")
```

## <a id="type" href="#type">Types</a>

### <a id="SudoableToken" href="#SudoableToken">type SudoableToken struct</a>

```
searchKey: gitlab.SudoableToken
tags: [exported]
```

```Go
type SudoableToken struct {
	Token string
	Sudo  string
}
```

SudoableToken represents a personal access token with an optional sudo scope. 

#### <a id="SudoableToken.Authenticate" href="#SudoableToken.Authenticate">func (pat *SudoableToken) Authenticate(req *http.Request) error</a>

```
searchKey: gitlab.SudoableToken.Authenticate
tags: [exported]
```

```Go
func (pat *SudoableToken) Authenticate(req *http.Request) error
```

#### <a id="SudoableToken.Hash" href="#SudoableToken.Hash">func (pat *SudoableToken) Hash() string</a>

```
searchKey: gitlab.SudoableToken.Hash
tags: [exported]
```

```Go
func (pat *SudoableToken) Hash() string
```

### <a id="TokenType" href="#TokenType">type TokenType string</a>

```
searchKey: gitlab.TokenType
tags: [exported]
```

```Go
type TokenType string
```

TokenType is the type of an access token. 

### <a id="ClientProvider" href="#ClientProvider">type ClientProvider struct</a>

```
searchKey: gitlab.ClientProvider
tags: [exported]
```

```Go
type ClientProvider struct {
	// baseURL is the base URL of GitLab; e.g., https://gitlab.com or https://gitlab.example.com
	baseURL *url.URL

	// httpClient is the underlying the HTTP client to use
	httpClient httpcli.Doer

	gitlabClients   map[string]*Client
	gitlabClientsMu sync.Mutex
}
```

ClientProvider creates GitLab API clients. Each client has separate authentication creds and a separate cache, but they share an underlying HTTP client and rate limiter. Callers who want a simple unauthenticated API client should use `NewClientProvider(baseURL, transport).GetClient()`. 

#### <a id="NewClientProvider" href="#NewClientProvider">func NewClientProvider(baseURL *url.URL, cli httpcli.Doer) *ClientProvider</a>

```
searchKey: gitlab.NewClientProvider
tags: [exported]
```

```Go
func NewClientProvider(baseURL *url.URL, cli httpcli.Doer) *ClientProvider
```

#### <a id="createTestProvider" href="#createTestProvider">func createTestProvider(t *testing.T) *ClientProvider</a>

```
searchKey: gitlab.createTestProvider
```

```Go
func createTestProvider(t *testing.T) *ClientProvider
```

#### <a id="ClientProvider.GetAuthenticatorClient" href="#ClientProvider.GetAuthenticatorClient">func (p *ClientProvider) GetAuthenticatorClient(a auth.Authenticator) *Client</a>

```
searchKey: gitlab.ClientProvider.GetAuthenticatorClient
tags: [exported]
```

```Go
func (p *ClientProvider) GetAuthenticatorClient(a auth.Authenticator) *Client
```

GetAuthenticatorClient returns a client authenticated by the given authenticator. 

#### <a id="ClientProvider.GetPATClient" href="#ClientProvider.GetPATClient">func (p *ClientProvider) GetPATClient(personalAccessToken, sudo string) *Client</a>

```
searchKey: gitlab.ClientProvider.GetPATClient
tags: [exported]
```

```Go
func (p *ClientProvider) GetPATClient(personalAccessToken, sudo string) *Client
```

GetPATClient returns a client authenticated by the personal access token. 

#### <a id="ClientProvider.GetOAuthClient" href="#ClientProvider.GetOAuthClient">func (p *ClientProvider) GetOAuthClient(oauthToken string) *Client</a>

```
searchKey: gitlab.ClientProvider.GetOAuthClient
tags: [exported]
```

```Go
func (p *ClientProvider) GetOAuthClient(oauthToken string) *Client
```

GetOAuthClient returns a client authenticated by the OAuth token. 

#### <a id="ClientProvider.GetClient" href="#ClientProvider.GetClient">func (p *ClientProvider) GetClient() *Client</a>

```
searchKey: gitlab.ClientProvider.GetClient
tags: [exported]
```

```Go
func (p *ClientProvider) GetClient() *Client
```

GetClient returns an unauthenticated client. 

#### <a id="ClientProvider.getClient" href="#ClientProvider.getClient">func (p *ClientProvider) getClient(a auth.Authenticator) *Client</a>

```
searchKey: gitlab.ClientProvider.getClient
```

```Go
func (p *ClientProvider) getClient(a auth.Authenticator) *Client
```

#### <a id="ClientProvider.newClient" href="#ClientProvider.newClient">func (p *ClientProvider) newClient(baseURL *url.URL, a auth.Authenticator, httpClient httpcli.Doer) *Client</a>

```
searchKey: gitlab.ClientProvider.newClient
```

```Go
func (p *ClientProvider) newClient(baseURL *url.URL, a auth.Authenticator, httpClient httpcli.Doer) *Client
```

newClient creates a new GitLab API client with an optional personal access token to authenticate requests. 

The URL must point to the base URL of the GitLab instance. This is [https://gitlab.com](https://gitlab.com) for GitLab.com and http[s]://[gitlab-hostname] for self-hosted GitLab instances. 

See the docstring of Client for the meaning of the parameters. 

### <a id="CommonOp" href="#CommonOp">type CommonOp struct</a>

```
searchKey: gitlab.CommonOp
tags: [exported]
```

```Go
type CommonOp struct {
	// NoCache, if true, will bypass any caching done in this package
	NoCache bool
}
```

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: gitlab.Client
tags: [exported]
```

```Go
type Client struct {
	baseURL          *url.URL
	httpClient       httpcli.Doer
	projCache        *rcache.Cache
	Auth             auth.Authenticator
	rateLimitMonitor *ratelimit.Monitor
	rateLimiter      *rate.Limiter // Our internal rate limiter
}
```

Client is a GitLab API client. Clients are associated with a particular user identity, which is defined by the Auth implementation. In addition to the generic types provided by the auth package, Client also supports SudoableToken: if this is used and its Sudo field is non-empty, then the user identity will be the user ID specified by Sudo (rather than the user that owns the token). 

The Client's cache is keyed by Auth.Hash(). It is NOT keyed by the actual user ID that is defined by the authentication method. So if an OAuth token and personal access token belong to the same user and there are two corresponding Client instances, those Client instances will NOT share the same cache. However, two Client instances sharing the exact same values for those fields WILL share a cache. 

#### <a id="newTestClient" href="#newTestClient">func newTestClient(t *testing.T) *Client</a>

```
searchKey: gitlab.newTestClient
```

```Go
func newTestClient(t *testing.T) *Client
```

#### <a id="Client.do" href="#Client.do">func (c *Client) do(ctx context.Context, req *http.Request, result interface{}) (responseHeader http.Header, responseCode int, err error)</a>

```
searchKey: gitlab.Client.do
```

```Go
func (c *Client) do(ctx context.Context, req *http.Request, result interface{}) (responseHeader http.Header, responseCode int, err error)
```

do is the default method for making API requests and will prepare the correct base path. 

#### <a id="Client.doWithBaseURL" href="#Client.doWithBaseURL">func (c *Client) doWithBaseURL(ctx context.Context, req *http.Request, result interface{}) (responseHeader http.Header, responseCode int, err error)</a>

```
searchKey: gitlab.Client.doWithBaseURL
```

```Go
func (c *Client) doWithBaseURL(ctx context.Context, req *http.Request, result interface{}) (responseHeader http.Header, responseCode int, err error)
```

doWithBaseURL will not amend the request URL. 

#### <a id="Client.RateLimitMonitor" href="#Client.RateLimitMonitor">func (c *Client) RateLimitMonitor() *ratelimit.Monitor</a>

```
searchKey: gitlab.Client.RateLimitMonitor
tags: [exported]
```

```Go
func (c *Client) RateLimitMonitor() *ratelimit.Monitor
```

RateLimitMonitor exposes the rate limit monitor. 

#### <a id="Client.WithAuthenticator" href="#Client.WithAuthenticator">func (c *Client) WithAuthenticator(a auth.Authenticator) *Client</a>

```
searchKey: gitlab.Client.WithAuthenticator
tags: [exported]
```

```Go
func (c *Client) WithAuthenticator(a auth.Authenticator) *Client
```

#### <a id="Client.ValidateToken" href="#Client.ValidateToken">func (c *Client) ValidateToken(ctx context.Context) error</a>

```
searchKey: gitlab.Client.ValidateToken
tags: [exported]
```

```Go
func (c *Client) ValidateToken(ctx context.Context) error
```

#### <a id="Client.GetAuthenticatedUserOAuthScopes" href="#Client.GetAuthenticatedUserOAuthScopes">func (c *Client) GetAuthenticatedUserOAuthScopes(ctx context.Context) ([]string, error)</a>

```
searchKey: gitlab.Client.GetAuthenticatedUserOAuthScopes
tags: [exported]
```

```Go
func (c *Client) GetAuthenticatedUserOAuthScopes(ctx context.Context) ([]string, error)
```

#### <a id="Client.ListMembers" href="#Client.ListMembers">func (c *Client) ListMembers(ctx context.Context, urlStr string) (members []*Member, nextPageURL *string, err error)</a>

```
searchKey: gitlab.Client.ListMembers
tags: [exported]
```

```Go
func (c *Client) ListMembers(ctx context.Context, urlStr string) (members []*Member, nextPageURL *string, err error)
```

ListMembers returns a list of members parsed from reponse of given URL. 

#### <a id="Client.CreateMergeRequest" href="#Client.CreateMergeRequest">func (c *Client) CreateMergeRequest(ctx context.Context, project *Project, opts CreateMergeRequestOpts) (*MergeRequest, error)</a>

```
searchKey: gitlab.Client.CreateMergeRequest
tags: [exported]
```

```Go
func (c *Client) CreateMergeRequest(ctx context.Context, project *Project, opts CreateMergeRequestOpts) (*MergeRequest, error)
```

#### <a id="Client.GetMergeRequest" href="#Client.GetMergeRequest">func (c *Client) GetMergeRequest(ctx context.Context, project *Project, iid ID) (*MergeRequest, error)</a>

```
searchKey: gitlab.Client.GetMergeRequest
tags: [exported]
```

```Go
func (c *Client) GetMergeRequest(ctx context.Context, project *Project, iid ID) (*MergeRequest, error)
```

#### <a id="Client.GetOpenMergeRequestByRefs" href="#Client.GetOpenMergeRequestByRefs">func (c *Client) GetOpenMergeRequestByRefs(ctx context.Context, project *Project, source, target string) (*MergeRequest, error)</a>

```
searchKey: gitlab.Client.GetOpenMergeRequestByRefs
tags: [exported]
```

```Go
func (c *Client) GetOpenMergeRequestByRefs(ctx context.Context, project *Project, source, target string) (*MergeRequest, error)
```

#### <a id="Client.UpdateMergeRequest" href="#Client.UpdateMergeRequest">func (c *Client) UpdateMergeRequest(ctx context.Context, project *Project, mr *MergeRequest, opts UpdateMergeRequestOpts) (*MergeRequest, error)</a>

```
searchKey: gitlab.Client.UpdateMergeRequest
tags: [exported]
```

```Go
func (c *Client) UpdateMergeRequest(ctx context.Context, project *Project, mr *MergeRequest, opts UpdateMergeRequestOpts) (*MergeRequest, error)
```

#### <a id="Client.MergeMergeRequest" href="#Client.MergeMergeRequest">func (c *Client) MergeMergeRequest(ctx context.Context, project *Project, mr *MergeRequest, squash bool) (*MergeRequest, error)</a>

```
searchKey: gitlab.Client.MergeMergeRequest
tags: [exported]
```

```Go
func (c *Client) MergeMergeRequest(ctx context.Context, project *Project, mr *MergeRequest, squash bool) (*MergeRequest, error)
```

#### <a id="Client.CreateMergeRequestNote" href="#Client.CreateMergeRequestNote">func (c *Client) CreateMergeRequestNote(ctx context.Context, project *Project, mr *MergeRequest, body string) error</a>

```
searchKey: gitlab.Client.CreateMergeRequestNote
tags: [exported]
```

```Go
func (c *Client) CreateMergeRequestNote(ctx context.Context, project *Project, mr *MergeRequest, body string) error
```

#### <a id="Client.GetMergeRequestNotes" href="#Client.GetMergeRequestNotes">func (c *Client) GetMergeRequestNotes(ctx context.Context, project *Project, iid ID) func() ([]*Note, error)</a>

```
searchKey: gitlab.Client.GetMergeRequestNotes
tags: [exported]
```

```Go
func (c *Client) GetMergeRequestNotes(ctx context.Context, project *Project, iid ID) func() ([]*Note, error)
```

GetMergeRequestNotes retrieves the notes for the given merge request. As the notes are paginated, a function is returned that may be invoked to return the next page of results. An empty slice and a nil error indicates that all pages have been returned. 

#### <a id="Client.GetMergeRequestPipelines" href="#Client.GetMergeRequestPipelines">func (c *Client) GetMergeRequestPipelines(ctx context.Context, project *Project, iid ID) func() ([]*Pipeline, error)</a>

```
searchKey: gitlab.Client.GetMergeRequestPipelines
tags: [exported]
```

```Go
func (c *Client) GetMergeRequestPipelines(ctx context.Context, project *Project, iid ID) func() ([]*Pipeline, error)
```

GetMergeRequestPipelines retrieves the pipelines that have been executed as part of the given merge request. As the pipelines are paginated, a function is returned that may be invoked to return the next page of results. An empty slice and a nil error indicates that all pages have been returned. 

#### <a id="Client.GetProject" href="#Client.GetProject">func (c *Client) GetProject(ctx context.Context, op GetProjectOp) (*Project, error)</a>

```
searchKey: gitlab.Client.GetProject
tags: [exported]
```

```Go
func (c *Client) GetProject(ctx context.Context, op GetProjectOp) (*Project, error)
```

GetProject gets a project from GitLab by either ID or path with namespace. 

#### <a id="Client.cachedGetProject" href="#Client.cachedGetProject">func (c *Client) cachedGetProject(ctx context.Context, key string, forceFetch bool, getProjectFromAPI func(context.Context) (proj *Project, keys []string, err error)) (*Project, error)</a>

```
searchKey: gitlab.Client.cachedGetProject
```

```Go
func (c *Client) cachedGetProject(ctx context.Context, key string, forceFetch bool, getProjectFromAPI func(context.Context) (proj *Project, keys []string, err error)) (*Project, error)
```

cachedGetProject caches the getProjectFromAPI call. 

#### <a id="Client.getProjectFromCache" href="#Client.getProjectFromCache">func (c *Client) getProjectFromCache(ctx context.Context, key string) *cachedProj</a>

```
searchKey: gitlab.Client.getProjectFromCache
```

```Go
func (c *Client) getProjectFromCache(ctx context.Context, key string) *cachedProj
```

getProjectFromCache attempts to get a response from the redis cache. It returns nil error for cache-hit condition and non-nil error for cache-miss. 

#### <a id="Client.addProjectToCache" href="#Client.addProjectToCache">func (c *Client) addProjectToCache(keys []string, proj *cachedProj)</a>

```
searchKey: gitlab.Client.addProjectToCache
```

```Go
func (c *Client) addProjectToCache(keys []string, proj *cachedProj)
```

addProjectToCache will cache the value for proj. The caller can provide multiple cache keys for the multiple ways that this project can be retrieved (e.g., both ID and path with namespace). 

#### <a id="Client.getProjectFromAPI" href="#Client.getProjectFromAPI">func (c *Client) getProjectFromAPI(ctx context.Context, id int, pathWithNamespace string) (proj *Project, err error)</a>

```
searchKey: gitlab.Client.getProjectFromAPI
```

```Go
func (c *Client) getProjectFromAPI(ctx context.Context, id int, pathWithNamespace string) (proj *Project, err error)
```

getProjectFromAPI attempts to fetch a project from the GitLab API without use of the redis cache. 

#### <a id="Client.ListProjects" href="#Client.ListProjects">func (c *Client) ListProjects(ctx context.Context, urlStr string) (projs []*Project, nextPageURL *string, err error)</a>

```
searchKey: gitlab.Client.ListProjects
tags: [exported]
```

```Go
func (c *Client) ListProjects(ctx context.Context, urlStr string) (projs []*Project, nextPageURL *string, err error)
```

ListProjects lists GitLab projects. 

#### <a id="Client.ListTree" href="#Client.ListTree">func (c *Client) ListTree(ctx context.Context, op ListTreeOp) ([]*Tree, error)</a>

```
searchKey: gitlab.Client.ListTree
tags: [exported]
```

```Go
func (c *Client) ListTree(ctx context.Context, op ListTreeOp) ([]*Tree, error)
```

ListTree lists the repository tree of the specified project. The underlying GitLab API has more options, but for now, we only support non-recursive queries of the root directory. Requests results are not cached by the client at the moment (i.e., setting op.NoCache to true does not alter behavior). 

#### <a id="Client.listTreeFromAPI" href="#Client.listTreeFromAPI">func (c *Client) listTreeFromAPI(ctx context.Context, projID int, projPathWithNamespace string) (tree []*Tree, err error)</a>

```
searchKey: gitlab.Client.listTreeFromAPI
```

```Go
func (c *Client) listTreeFromAPI(ctx context.Context, projID int, projPathWithNamespace string) (tree []*Tree, err error)
```

#### <a id="Client.GetMergeRequestResourceStateEvents" href="#Client.GetMergeRequestResourceStateEvents">func (c *Client) GetMergeRequestResourceStateEvents(ctx context.Context, project *Project, iid ID) func() ([]*ResourceStateEvent, error)</a>

```
searchKey: gitlab.Client.GetMergeRequestResourceStateEvents
tags: [exported]
```

```Go
func (c *Client) GetMergeRequestResourceStateEvents(ctx context.Context, project *Project, iid ID) func() ([]*ResourceStateEvent, error)
```

GetMergeRequestResourceStateEvents retrieves the events for the given merge request. As the events are paginated, a function is returned that may be invoked to return the next page of results. An empty slice and a nil error indicates that all pages have been returned. 

#### <a id="Client.ListUsers" href="#Client.ListUsers">func (c *Client) ListUsers(ctx context.Context, urlStr string) (users []*User, nextPageURL *string, err error)</a>

```
searchKey: gitlab.Client.ListUsers
tags: [exported]
```

```Go
func (c *Client) ListUsers(ctx context.Context, urlStr string) (users []*User, nextPageURL *string, err error)
```

#### <a id="Client.GetUser" href="#Client.GetUser">func (c *Client) GetUser(ctx context.Context, id string) (*User, error)</a>

```
searchKey: gitlab.Client.GetUser
tags: [exported]
```

```Go
func (c *Client) GetUser(ctx context.Context, id string) (*User, error)
```

### <a id="HTTPError" href="#HTTPError">type HTTPError struct</a>

```
searchKey: gitlab.HTTPError
tags: [exported]
```

```Go
type HTTPError struct {
	code int
	body []byte
}
```

#### <a id="NewHTTPError" href="#NewHTTPError">func NewHTTPError(code int, body []byte) HTTPError</a>

```
searchKey: gitlab.NewHTTPError
tags: [exported]
```

```Go
func NewHTTPError(code int, body []byte) HTTPError
```

#### <a id="HTTPError.Code" href="#HTTPError.Code">func (err HTTPError) Code() int</a>

```
searchKey: gitlab.HTTPError.Code
tags: [exported]
```

```Go
func (err HTTPError) Code() int
```

#### <a id="HTTPError.Message" href="#HTTPError.Message">func (err HTTPError) Message() string</a>

```
searchKey: gitlab.HTTPError.Message
tags: [exported]
```

```Go
func (err HTTPError) Message() string
```

#### <a id="HTTPError.Error" href="#HTTPError.Error">func (err HTTPError) Error() string</a>

```
searchKey: gitlab.HTTPError.Error
tags: [exported]
```

```Go
func (err HTTPError) Error() string
```

#### <a id="HTTPError.Unauthorized" href="#HTTPError.Unauthorized">func (err HTTPError) Unauthorized() bool</a>

```
searchKey: gitlab.HTTPError.Unauthorized
tags: [exported]
```

```Go
func (err HTTPError) Unauthorized() bool
```

#### <a id="HTTPError.Forbidden" href="#HTTPError.Forbidden">func (err HTTPError) Forbidden() bool</a>

```
searchKey: gitlab.HTTPError.Forbidden
tags: [exported]
```

```Go
func (err HTTPError) Forbidden() bool
```

### <a id="Label" href="#Label">type Label struct</a>

```
searchKey: gitlab.Label
tags: [exported]
```

```Go
type Label struct {
	ID          ID     `json:"id"`
	Name        string `json:"name"`
	Color       string `json:"color"`
	TextColor   string `json:"text_color"`
	Description string `json:"description"`
	Type        string `json:"type"`
	CreatedAt   Time   `json:"created_at"`
	UpdatedAt   Time   `json:"updated_at"`
}
```

### <a id="Member" href="#Member">type Member struct</a>

```
searchKey: gitlab.Member
tags: [exported]
```

```Go
type Member struct {
	ID                int32  `json:"id"`
	Username          string `json:"username"`
	Name              string `json:"name"`
	State             string `json:"state"`
	AvatarURL         string `json:"avatar_url"`
	WebURL            string `json:"web_url"`
	ExpiresAt         string `json:"expires_at"`
	AccessLevel       int    `json:"access_level"`
	GroupSAMLIdentity *struct {
		Provider       string `json:"provider"`
		ExternUID      string `json:"extern_uid"`
		SAMLProviderID int    `json:"saml_provider_id"`
	} `json:"group_saml_identity"`
}
```

Member contains fields for a group or project membership. 

### <a id="ID" href="#ID">type ID int64</a>

```
searchKey: gitlab.ID
tags: [exported]
```

```Go
type ID int64
```

### <a id="MergeRequestState" href="#MergeRequestState">type MergeRequestState string</a>

```
searchKey: gitlab.MergeRequestState
tags: [exported]
```

```Go
type MergeRequestState string
```

### <a id="MergeRequest" href="#MergeRequest">type MergeRequest struct</a>

```
searchKey: gitlab.MergeRequest
tags: [exported]
```

```Go
type MergeRequest struct {
	ID             ID                `json:"id"`
	IID            ID                `json:"iid"`
	ProjectID      ID                `json:"project_id"`
	Title          string            `json:"title"`
	Description    string            `json:"description"`
	State          MergeRequestState `json:"state"`
	CreatedAt      Time              `json:"created_at"`
	UpdatedAt      Time              `json:"updated_at"`
	MergedAt       *Time             `json:"merged_at"`
	ClosedAt       *Time             `json:"closed_at"`
	HeadPipeline   *Pipeline         `json:"head_pipeline"`
	Labels         []string          `json:"labels"`
	SourceBranch   string            `json:"source_branch"`
	TargetBranch   string            `json:"target_branch"`
	WebURL         string            `json:"web_url"`
	WorkInProgress bool              `json:"work_in_progress"`
	Author         User              `json:"author"`

	DiffRefs DiffRefs `json:"diff_refs"`

	// The fields below are computed from other REST API requests when getting a
	// Merge Request. Once our minimum version is GitLab 12.0, we can use the
	// GraphQL API to retrieve all of this data at once, but until then, we have
	// to do it the old fashioned way with lots of REST requests.
	Notes               []*Note
	Pipelines           []*Pipeline
	ResourceStateEvents []*ResourceStateEvent
}
```

### <a id="DiffRefs" href="#DiffRefs">type DiffRefs struct</a>

```
searchKey: gitlab.DiffRefs
tags: [exported]
```

```Go
type DiffRefs struct {
	BaseSHA  string `json:"base_sha"`
	HeadSHA  string `json:"head_sha"`
	StartSHA string `json:"start_sha"`
}
```

### <a id="CreateMergeRequestOpts" href="#CreateMergeRequestOpts">type CreateMergeRequestOpts struct</a>

```
searchKey: gitlab.CreateMergeRequestOpts
tags: [exported]
```

```Go
type CreateMergeRequestOpts struct {
	SourceBranch string `json:"source_branch"`
	TargetBranch string `json:"target_branch"`
	Title        string `json:"title"`
	Description  string `json:"description,omitempty"`
}
```

### <a id="UpdateMergeRequestOpts" href="#UpdateMergeRequestOpts">type UpdateMergeRequestOpts struct</a>

```
searchKey: gitlab.UpdateMergeRequestOpts
tags: [exported]
```

```Go
type UpdateMergeRequestOpts struct {
	TargetBranch string                       `json:"target_branch"`
	Title        string                       `json:"title"`
	Description  string                       `json:"description,omitempty"`
	StateEvent   UpdateMergeRequestStateEvent `json:"state_event,omitempty"`
}
```

### <a id="UpdateMergeRequestStateEvent" href="#UpdateMergeRequestStateEvent">type UpdateMergeRequestStateEvent string</a>

```
searchKey: gitlab.UpdateMergeRequestStateEvent
tags: [exported]
```

```Go
type UpdateMergeRequestStateEvent string
```

### <a id="SystemNoteBody" href="#SystemNoteBody">type SystemNoteBody string</a>

```
searchKey: gitlab.SystemNoteBody
tags: [exported]
```

```Go
type SystemNoteBody string
```

SystemNoteBody is a type of all known system message bodies. 

### <a id="Note" href="#Note">type Note struct</a>

```
searchKey: gitlab.Note
tags: [exported]
```

```Go
type Note struct {
	ID        ID             `json:"id"`
	Body      SystemNoteBody `json:"body"`
	Author    User           `json:"author"`
	CreatedAt Time           `json:"created_at"`
	System    bool           `json:"system"`
}
```

#### <a id="Note.ToEvent" href="#Note.ToEvent">func (n *Note) ToEvent() keyer</a>

```
searchKey: gitlab.Note.ToEvent
tags: [exported]
```

```Go
func (n *Note) ToEvent() keyer
```

ToEvent returns a pointer to a more specific struct, or nil if the Note is not of a known kind. 

### <a id="ReviewApprovedEvent" href="#ReviewApprovedEvent">type ReviewApprovedEvent struct</a>

```
searchKey: gitlab.ReviewApprovedEvent
tags: [exported]
```

```Go
type ReviewApprovedEvent struct{ *Note }
```

#### <a id="ReviewApprovedEvent.Key" href="#ReviewApprovedEvent.Key">func (e *ReviewApprovedEvent) Key() string</a>

```
searchKey: gitlab.ReviewApprovedEvent.Key
tags: [exported]
```

```Go
func (e *ReviewApprovedEvent) Key() string
```

### <a id="ReviewUnapprovedEvent" href="#ReviewUnapprovedEvent">type ReviewUnapprovedEvent struct</a>

```
searchKey: gitlab.ReviewUnapprovedEvent
tags: [exported]
```

```Go
type ReviewUnapprovedEvent struct{ *Note }
```

#### <a id="ReviewUnapprovedEvent.Key" href="#ReviewUnapprovedEvent.Key">func (e *ReviewUnapprovedEvent) Key() string</a>

```
searchKey: gitlab.ReviewUnapprovedEvent.Key
tags: [exported]
```

```Go
func (e *ReviewUnapprovedEvent) Key() string
```

### <a id="MarkWorkInProgressEvent" href="#MarkWorkInProgressEvent">type MarkWorkInProgressEvent struct</a>

```
searchKey: gitlab.MarkWorkInProgressEvent
tags: [exported]
```

```Go
type MarkWorkInProgressEvent struct{ *Note }
```

#### <a id="MarkWorkInProgressEvent.Key" href="#MarkWorkInProgressEvent.Key">func (e *MarkWorkInProgressEvent) Key() string</a>

```
searchKey: gitlab.MarkWorkInProgressEvent.Key
tags: [exported]
```

```Go
func (e *MarkWorkInProgressEvent) Key() string
```

### <a id="UnmarkWorkInProgressEvent" href="#UnmarkWorkInProgressEvent">type UnmarkWorkInProgressEvent struct</a>

```
searchKey: gitlab.UnmarkWorkInProgressEvent
tags: [exported]
```

```Go
type UnmarkWorkInProgressEvent struct{ *Note }
```

#### <a id="UnmarkWorkInProgressEvent.Key" href="#UnmarkWorkInProgressEvent.Key">func (e *UnmarkWorkInProgressEvent) Key() string</a>

```
searchKey: gitlab.UnmarkWorkInProgressEvent.Key
tags: [exported]
```

```Go
func (e *UnmarkWorkInProgressEvent) Key() string
```

### <a id="keyer" href="#keyer">type keyer interface</a>

```
searchKey: gitlab.keyer
```

```Go
type keyer interface {
	Key() string
}
```

### <a id="Pipeline" href="#Pipeline">type Pipeline struct</a>

```
searchKey: gitlab.Pipeline
tags: [exported]
```

```Go
type Pipeline struct {
	ID        ID             `json:"id"`
	SHA       string         `json:"sha"`
	Ref       string         `json:"ref"`
	Status    PipelineStatus `json:"status"`
	WebURL    string         `json:"web_url"`
	CreatedAt Time           `json:"created_at"`
	UpdatedAt Time           `json:"updated_at"`
}
```

#### <a id="Pipeline.Key" href="#Pipeline.Key">func (p *Pipeline) Key() string</a>

```
searchKey: gitlab.Pipeline.Key
tags: [exported]
```

```Go
func (p *Pipeline) Key() string
```

### <a id="PipelineStatus" href="#PipelineStatus">type PipelineStatus string</a>

```
searchKey: gitlab.PipelineStatus
tags: [exported]
```

```Go
type PipelineStatus string
```

### <a id="Visibility" href="#Visibility">type Visibility string</a>

```
searchKey: gitlab.Visibility
tags: [exported]
```

```Go
type Visibility string
```

### <a id="Project" href="#Project">type Project struct</a>

```
searchKey: gitlab.Project
tags: [exported]
```

```Go
type Project struct {
	ProjectCommon
	Visibility        Visibility     `json:"visibility"`                    // "private", "internal", or "public"
	ForkedFromProject *ProjectCommon `json:"forked_from_project,omitempty"` // If non-nil, the project from which this project was forked
	Archived          bool           `json:"archived"`
	StarCount         int            `json:"star_count"`
	ForksCount        int            `json:"forks_count"`
}
```

Project is a GitLab project (equivalent to a GitHub repository). 

#### <a id="Project.RequiresAuthentication" href="#Project.RequiresAuthentication">func (p Project) RequiresAuthentication() bool</a>

```
searchKey: gitlab.Project.RequiresAuthentication
tags: [exported]
```

```Go
func (p Project) RequiresAuthentication() bool
```

RequiresAuthentication reports whether this project requires authentication to view (i.e., its visibility is "private" or "internal"). 

### <a id="ProjectCommon" href="#ProjectCommon">type ProjectCommon struct</a>

```
searchKey: gitlab.ProjectCommon
tags: [exported]
```

```Go
type ProjectCommon struct {
	ID                int    `json:"id"`                  // ID of project
	PathWithNamespace string `json:"path_with_namespace"` // full path name of project ("namespace1/namespace2/name")
	Description       string `json:"description"`         // description of project
	WebURL            string `json:"web_url"`             // the web URL of this project ("https://gitlab.com/foo/bar")i
	HTTPURLToRepo     string `json:"http_url_to_repo"`    // HTTP clone URL
	SSHURLToRepo      string `json:"ssh_url_to_repo"`     // SSH clone URL ("git@example.com:foo/bar.git")
}
```

### <a id="GetProjectOp" href="#GetProjectOp">type GetProjectOp struct</a>

```
searchKey: gitlab.GetProjectOp
tags: [exported]
```

```Go
type GetProjectOp struct {
	ID                int
	PathWithNamespace string
	CommonOp
}
```

### <a id="cachedProj" href="#cachedProj">type cachedProj struct</a>

```
searchKey: gitlab.cachedProj
```

```Go
type cachedProj struct {
	Project

	// NotFound indicates that the GitLab API reported that the project was not found.
	NotFound bool
}
```

### <a id="Tree" href="#Tree">type Tree struct</a>

```
searchKey: gitlab.Tree
tags: [exported]
```

```Go
type Tree struct {
	ID   string `json:"id"`
	Name string `json:"name"`
	Type string `json:"type"`
	Path string `json:"path"`
	Mode string `json:"mode"`
}
```

### <a id="ListTreeOp" href="#ListTreeOp">type ListTreeOp struct</a>

```
searchKey: gitlab.ListTreeOp
tags: [exported]
```

```Go
type ListTreeOp struct {
	ProjID                int
	ProjPathWithNamespace string
	CommonOp
}
```

### <a id="ResourceStateEventState" href="#ResourceStateEventState">type ResourceStateEventState string</a>

```
searchKey: gitlab.ResourceStateEventState
tags: [exported]
```

```Go
type ResourceStateEventState string
```

ResourceStateEventState is a type of all known resource state event states. 

### <a id="ResourceStateEvent" href="#ResourceStateEvent">type ResourceStateEvent struct</a>

```
searchKey: gitlab.ResourceStateEvent
tags: [exported]
```

```Go
type ResourceStateEvent struct {
	ID           ID                      `json:"id"`
	User         User                    `json:"user"`
	CreatedAt    Time                    `json:"created_at"`
	ResourceType string                  `json:"resource_type"`
	ResourceID   ID                      `json:"resource_id"`
	State        ResourceStateEventState `json:"state"`
}
```

#### <a id="ResourceStateEvent.ToEvent" href="#ResourceStateEvent.ToEvent">func (rse *ResourceStateEvent) ToEvent() interface{}</a>

```
searchKey: gitlab.ResourceStateEvent.ToEvent
tags: [exported]
```

```Go
func (rse *ResourceStateEvent) ToEvent() interface{}
```

ToEvent returns a pointer to a more specific struct, or nil if the ResourceStateEvent is not of a known kind. 

### <a id="MergeRequestClosedEvent" href="#MergeRequestClosedEvent">type MergeRequestClosedEvent struct</a>

```
searchKey: gitlab.MergeRequestClosedEvent
tags: [exported]
```

```Go
type MergeRequestClosedEvent struct{ *ResourceStateEvent }
```

#### <a id="MergeRequestClosedEvent.Key" href="#MergeRequestClosedEvent.Key">func (e *MergeRequestClosedEvent) Key() string</a>

```
searchKey: gitlab.MergeRequestClosedEvent.Key
tags: [exported]
```

```Go
func (e *MergeRequestClosedEvent) Key() string
```

### <a id="MergeRequestReopenedEvent" href="#MergeRequestReopenedEvent">type MergeRequestReopenedEvent struct</a>

```
searchKey: gitlab.MergeRequestReopenedEvent
tags: [exported]
```

```Go
type MergeRequestReopenedEvent struct{ *ResourceStateEvent }
```

#### <a id="MergeRequestReopenedEvent.Key" href="#MergeRequestReopenedEvent.Key">func (e *MergeRequestReopenedEvent) Key() string</a>

```
searchKey: gitlab.MergeRequestReopenedEvent.Key
tags: [exported]
```

```Go
func (e *MergeRequestReopenedEvent) Key() string
```

### <a id="MergeRequestMergedEvent" href="#MergeRequestMergedEvent">type MergeRequestMergedEvent struct</a>

```
searchKey: gitlab.MergeRequestMergedEvent
tags: [exported]
```

```Go
type MergeRequestMergedEvent struct{ *ResourceStateEvent }
```

#### <a id="MergeRequestMergedEvent.Key" href="#MergeRequestMergedEvent.Key">func (e *MergeRequestMergedEvent) Key() string</a>

```
searchKey: gitlab.MergeRequestMergedEvent.Key
tags: [exported]
```

```Go
func (e *MergeRequestMergedEvent) Key() string
```

### <a id="mockHTTPResponseBody" href="#mockHTTPResponseBody">type mockHTTPResponseBody struct</a>

```
searchKey: gitlab.mockHTTPResponseBody
```

```Go
type mockHTTPResponseBody struct {
	count        int
	header       http.Header
	responseBody string
}
```

#### <a id="mockHTTPResponseBody.Do" href="#mockHTTPResponseBody.Do">func (s *mockHTTPResponseBody) Do(req *http.Request) (*http.Response, error)</a>

```
searchKey: gitlab.mockHTTPResponseBody.Do
```

```Go
func (s *mockHTTPResponseBody) Do(req *http.Request) (*http.Response, error)
```

### <a id="mockHTTPEmptyResponse" href="#mockHTTPEmptyResponse">type mockHTTPEmptyResponse struct</a>

```
searchKey: gitlab.mockHTTPEmptyResponse
```

```Go
type mockHTTPEmptyResponse struct {
	statusCode int
}
```

#### <a id="mockHTTPEmptyResponse.Do" href="#mockHTTPEmptyResponse.Do">func (s mockHTTPEmptyResponse) Do(req *http.Request) (*http.Response, error)</a>

```
searchKey: gitlab.mockHTTPEmptyResponse.Do
```

```Go
func (s mockHTTPEmptyResponse) Do(req *http.Request) (*http.Response, error)
```

### <a id="Time" href="#Time">type Time struct</a>

```
searchKey: gitlab.Time
tags: [exported]
```

```Go
type Time struct{ time.Time }
```

Time is a type that can unmarshal the multiple date/time formats that GitLab webhooks may include. While GitLab's normal API uses RFC 3339 dates, some objects in webhook payloads include a more legacy format, even though they generally adhere to the REST API otherwise. We need to be able to handle both to be able to handle those types in a unified way. 

The underlying GitLab issue is [https://gitlab.com/gitlab-org/gitlab/-/issues/19567](https://gitlab.com/gitlab-org/gitlab/-/issues/19567) 

#### <a id="Time.UnmarshalJSON" href="#Time.UnmarshalJSON">func (t *Time) UnmarshalJSON(data []byte) error</a>

```
searchKey: gitlab.Time.UnmarshalJSON
tags: [exported]
```

```Go
func (t *Time) UnmarshalJSON(data []byte) error
```

### <a id="User" href="#User">type User struct</a>

```
searchKey: gitlab.User
tags: [exported]
```

```Go
type User struct {
	ID         int32      `json:"id"`
	Name       string     `json:"name"`
	Username   string     `json:"username"`
	Email      string     `json:"email"`
	State      string     `json:"state"`
	AvatarURL  string     `json:"avatar_url"`
	WebURL     string     `json:"web_url"`
	Identities []Identity `json:"identities"`
}
```

#### <a id="GetExternalAccountData" href="#GetExternalAccountData">func GetExternalAccountData(data *extsvc.AccountData) (usr *User, tok *oauth2.Token, err error)</a>

```
searchKey: gitlab.GetExternalAccountData
tags: [exported]
```

```Go
func GetExternalAccountData(data *extsvc.AccountData) (usr *User, tok *oauth2.Token, err error)
```

GetExternalAccountData returns the deserialized user and token from the external account data JSON blob in a typesafe way. 

### <a id="Identity" href="#Identity">type Identity struct</a>

```
searchKey: gitlab.Identity
tags: [exported]
```

```Go
type Identity struct {
	Provider  string `json:"provider"`
	ExternUID string `json:"extern_uid"`
}
```

## <a id="func" href="#func">Functions</a>

### <a id="init" href="#init">func init()</a>

```
searchKey: gitlab.init
```

```Go
func init()
```

### <a id="trace" href="#trace">func trace(msg string, ctx ...interface{})</a>

```
searchKey: gitlab.trace
```

```Go
func trace(msg string, ctx ...interface{})
```

### <a id="isGitLabDotComURL" href="#isGitLabDotComURL">func isGitLabDotComURL(baseURL *url.URL) bool</a>

```
searchKey: gitlab.isGitLabDotComURL
```

```Go
func isGitLabDotComURL(baseURL *url.URL) bool
```

### <a id="HTTPErrorCode" href="#HTTPErrorCode">func HTTPErrorCode(err error) int</a>

```
searchKey: gitlab.HTTPErrorCode
tags: [exported]
```

```Go
func HTTPErrorCode(err error) int
```

HTTPErrorCode returns err's HTTP status code, if it is an HTTP error from this package. Otherwise it returns 0. 

### <a id="IsNotFound" href="#IsNotFound">func IsNotFound(err error) bool</a>

```
searchKey: gitlab.IsNotFound
tags: [exported]
```

```Go
func IsNotFound(err error) bool
```

IsNotFound reports whether err is a GitLab API error of type NOT_FOUND, the equivalent cached response error, or HTTP 404. 

### <a id="ExternalRepoSpec" href="#ExternalRepoSpec">func ExternalRepoSpec(proj *Project, baseURL url.URL) api.ExternalRepoSpec</a>

```
searchKey: gitlab.ExternalRepoSpec
tags: [exported]
```

```Go
func ExternalRepoSpec(proj *Project, baseURL url.URL) api.ExternalRepoSpec
```

ExternalRepoSpec returns an api.ExternalRepoSpec that refers to the specified GitLab project. 

### <a id="IsWIP" href="#IsWIP">func IsWIP(title string) bool</a>

```
searchKey: gitlab.IsWIP
tags: [exported]
```

```Go
func IsWIP(title string) bool
```

IsWIP returns true if the given title would result in GitLab rendering the MR as 'work in progress'. 

### <a id="SetWIP" href="#SetWIP">func SetWIP(title string) string</a>

```
searchKey: gitlab.SetWIP
tags: [exported]
```

```Go
func SetWIP(title string) string
```

SetWIP ensures a "WIP:" prefix on the given title. If a "Draft:" prefix is found, that one is retained instead. 

### <a id="UnsetWIP" href="#UnsetWIP">func UnsetWIP(title string) string</a>

```
searchKey: gitlab.UnsetWIP
tags: [exported]
```

```Go
func UnsetWIP(title string) string
```

UnsetWIP removes "WIP:" and "Draft:" prefixes from the given title. Depending on the GitLab version, either of them are used so we need to strip them both. 

### <a id="idCacheKey" href="#idCacheKey">func idCacheKey(id int) string</a>

```
searchKey: gitlab.idCacheKey
```

```Go
func idCacheKey(id int) string
```

### <a id="pathWithNamespaceCacheKey" href="#pathWithNamespaceCacheKey">func pathWithNamespaceCacheKey(pathWithNamespace string) string</a>

```
searchKey: gitlab.pathWithNamespaceCacheKey
```

```Go
func pathWithNamespaceCacheKey(pathWithNamespace string) string
```

### <a id="MockGetProject_Return" href="#MockGetProject_Return">func MockGetProject_Return(returns *Project)</a>

```
searchKey: gitlab.MockGetProject_Return
tags: [exported]
```

```Go
func MockGetProject_Return(returns *Project)
```

MockGetProject_Return is called by tests to mock (*Client).GetProject. 

### <a id="SetExternalAccountData" href="#SetExternalAccountData">func SetExternalAccountData(data *extsvc.AccountData, user *User, token *oauth2.Token)</a>

```
searchKey: gitlab.SetExternalAccountData
tags: [exported]
```

```Go
func SetExternalAccountData(data *extsvc.AccountData, user *User, token *oauth2.Token)
```

SetExternalAccountData sets the user and token into the external account data blob. 

### <a id="TestSudoableToken" href="#TestSudoableToken">func TestSudoableToken(t *testing.T)</a>

```
searchKey: gitlab.TestSudoableToken
```

```Go
func TestSudoableToken(t *testing.T)
```

### <a id="TestGetAuthenticatedUserOAuthScopes" href="#TestGetAuthenticatedUserOAuthScopes">func TestGetAuthenticatedUserOAuthScopes(t *testing.T)</a>

```
searchKey: gitlab.TestGetAuthenticatedUserOAuthScopes
```

```Go
func TestGetAuthenticatedUserOAuthScopes(t *testing.T)
```

### <a id="update" href="#update">func update(name string) bool</a>

```
searchKey: gitlab.update
```

```Go
func update(name string) bool
```

### <a id="TestWIP" href="#TestWIP">func TestWIP(t *testing.T)</a>

```
searchKey: gitlab.TestWIP
```

```Go
func TestWIP(t *testing.T)
```

### <a id="TestCreateMergeRequest" href="#TestCreateMergeRequest">func TestCreateMergeRequest(t *testing.T)</a>

```
searchKey: gitlab.TestCreateMergeRequest
```

```Go
func TestCreateMergeRequest(t *testing.T)
```

### <a id="TestGetMergeRequest" href="#TestGetMergeRequest">func TestGetMergeRequest(t *testing.T)</a>

```
searchKey: gitlab.TestGetMergeRequest
```

```Go
func TestGetMergeRequest(t *testing.T)
```

### <a id="TestGetOpenMergeRequestByRefs" href="#TestGetOpenMergeRequestByRefs">func TestGetOpenMergeRequestByRefs(t *testing.T)</a>

```
searchKey: gitlab.TestGetOpenMergeRequestByRefs
```

```Go
func TestGetOpenMergeRequestByRefs(t *testing.T)
```

### <a id="TestUpdateMergeRequest" href="#TestUpdateMergeRequest">func TestUpdateMergeRequest(t *testing.T)</a>

```
searchKey: gitlab.TestUpdateMergeRequest
```

```Go
func TestUpdateMergeRequest(t *testing.T)
```

### <a id="TestCreateMergeRequestNote" href="#TestCreateMergeRequestNote">func TestCreateMergeRequestNote(t *testing.T)</a>

```
searchKey: gitlab.TestCreateMergeRequestNote
```

```Go
func TestCreateMergeRequestNote(t *testing.T)
```

### <a id="TestMergeMergeRequest" href="#TestMergeMergeRequest">func TestMergeMergeRequest(t *testing.T)</a>

```
searchKey: gitlab.TestMergeMergeRequest
```

```Go
func TestMergeMergeRequest(t *testing.T)
```

### <a id="TestGetMergeRequestNotes" href="#TestGetMergeRequestNotes">func TestGetMergeRequestNotes(t *testing.T)</a>

```
searchKey: gitlab.TestGetMergeRequestNotes
```

```Go
func TestGetMergeRequestNotes(t *testing.T)
```

### <a id="TestNoteToEvent" href="#TestNoteToEvent">func TestNoteToEvent(t *testing.T)</a>

```
searchKey: gitlab.TestNoteToEvent
```

```Go
func TestNoteToEvent(t *testing.T)
```

### <a id="TestGetMergeRequestPipelines" href="#TestGetMergeRequestPipelines">func TestGetMergeRequestPipelines(t *testing.T)</a>

```
searchKey: gitlab.TestGetMergeRequestPipelines
```

```Go
func TestGetMergeRequestPipelines(t *testing.T)
```

### <a id="TestPipelineKey" href="#TestPipelineKey">func TestPipelineKey(t *testing.T)</a>

```
searchKey: gitlab.TestPipelineKey
```

```Go
func TestPipelineKey(t *testing.T)
```

### <a id="TestClient_GetProject" href="#TestClient_GetProject">func TestClient_GetProject(t *testing.T)</a>

```
searchKey: gitlab.TestClient_GetProject
```

```Go
func TestClient_GetProject(t *testing.T)
```

TestClient_GetProject tests the behavior of GetProject. 

### <a id="TestClient_GetProject_nonexistent" href="#TestClient_GetProject_nonexistent">func TestClient_GetProject_nonexistent(t *testing.T)</a>

```
searchKey: gitlab.TestClient_GetProject_nonexistent
```

```Go
func TestClient_GetProject_nonexistent(t *testing.T)
```

TestClient_GetProject_nonexistent tests the behavior of GetProject when called on a project that does not exist. 

### <a id="TestListTree" href="#TestListTree">func TestListTree(t *testing.T)</a>

```
searchKey: gitlab.TestListTree
```

```Go
func TestListTree(t *testing.T)
```

### <a id="TestTimeUnmarshal" href="#TestTimeUnmarshal">func TestTimeUnmarshal(t *testing.T)</a>

```
searchKey: gitlab.TestTimeUnmarshal
```

```Go
func TestTimeUnmarshal(t *testing.T)
```
