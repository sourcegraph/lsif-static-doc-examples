# Package sources

## Index

* [Variables](#var)
    * [var ErrMissingCredentials](#ErrMissingCredentials)
    * [var ErrNoSSHCredential](#ErrNoSSHCredential)
    * [var NoReposErr](#NoReposErr)
    * [var fakeNotImplemented](#fakeNotImplemented)
    * [var updateRegex](#updateRegex)
* [Types](#type)
    * [type BitbucketServerSource struct](#BitbucketServerSource)
        * [func NewBitbucketServerSource(svc *types.ExternalService, cf *httpcli.Factory) (*BitbucketServerSource, error)](#NewBitbucketServerSource)
        * [func newBitbucketServerSource(c *schema.BitbucketServerConnection, cf *httpcli.Factory, au auth.Authenticator) (*BitbucketServerSource, error)](#newBitbucketServerSource)
        * [func (s BitbucketServerSource) AuthenticatedUsername(ctx context.Context) (string, error)](#BitbucketServerSource.AuthenticatedUsername)
        * [func (s BitbucketServerSource) CloseChangeset(ctx context.Context, c *Changeset) error](#BitbucketServerSource.CloseChangeset)
        * [func (s BitbucketServerSource) CreateChangeset(ctx context.Context, c *Changeset) (bool, error)](#BitbucketServerSource.CreateChangeset)
        * [func (s BitbucketServerSource) CreateComment(ctx context.Context, c *Changeset, text string) error](#BitbucketServerSource.CreateComment)
        * [func (s BitbucketServerSource) GitserverPushConfig(ctx context.Context, store *database.ExternalServiceStore, repo *types.Repo) (*protocol.PushConfig, error)](#BitbucketServerSource.GitserverPushConfig)
        * [func (s BitbucketServerSource) LoadChangeset(ctx context.Context, cs *Changeset) error](#BitbucketServerSource.LoadChangeset)
        * [func (s BitbucketServerSource) MergeChangeset(ctx context.Context, c *Changeset, squash bool) error](#BitbucketServerSource.MergeChangeset)
        * [func (s BitbucketServerSource) ReopenChangeset(ctx context.Context, c *Changeset) error](#BitbucketServerSource.ReopenChangeset)
        * [func (s BitbucketServerSource) UpdateChangeset(ctx context.Context, c *Changeset) error](#BitbucketServerSource.UpdateChangeset)
        * [func (s BitbucketServerSource) ValidateAuthenticator(ctx context.Context) error](#BitbucketServerSource.ValidateAuthenticator)
        * [func (s BitbucketServerSource) WithAuthenticator(a auth.Authenticator) (ChangesetSource, error)](#BitbucketServerSource.WithAuthenticator)
        * [func (s BitbucketServerSource) loadPullRequestData(ctx context.Context, pr *bitbucketserver.PullRequest) error](#BitbucketServerSource.loadPullRequestData)
    * [type Changeset struct](#Changeset)
        * [func (c *Changeset) IsOutdated() (bool, error)](#Changeset.IsOutdated)
    * [type ChangesetNotFoundError struct](#ChangesetNotFoundError)
        * [func (e ChangesetNotFoundError) Error() string](#ChangesetNotFoundError.Error)
        * [func (e ChangesetNotFoundError) NonRetryable() bool](#ChangesetNotFoundError.NonRetryable)
    * [type ChangesetNotMergeableError struct](#ChangesetNotMergeableError)
        * [func (e ChangesetNotMergeableError) Error() string](#ChangesetNotMergeableError.Error)
        * [func (e ChangesetNotMergeableError) NonRetryable() bool](#ChangesetNotMergeableError.NonRetryable)
    * [type ChangesetSource interface](#ChangesetSource)
        * [func WithAuthenticatorForUser(ctx context.Context, tx SourcerStore, css ChangesetSource, userID int32, repo *types.Repo) (ChangesetSource, error)](#WithAuthenticatorForUser)
        * [func WithSiteAuthenticator(ctx context.Context, tx SourcerStore, css ChangesetSource, repo *types.Repo) (ChangesetSource, error)](#WithSiteAuthenticator)
        * [func buildChangesetSource(store SourcerStore, cf *httpcli.Factory, externalService *types.ExternalService) (ChangesetSource, error)](#buildChangesetSource)
    * [type DraftChangesetSource interface](#DraftChangesetSource)
        * [func ToDraftChangesetSource(css ChangesetSource) (DraftChangesetSource, error)](#ToDraftChangesetSource)
    * [type ErrNoPushCredentials struct](#ErrNoPushCredentials)
        * [func (e ErrNoPushCredentials) Error() string](#ErrNoPushCredentials.Error)
    * [type FakeChangesetSource struct](#FakeChangesetSource)
        * [func (s *FakeChangesetSource) AuthenticatedUsername(ctx context.Context) (string, error)](#FakeChangesetSource.AuthenticatedUsername)
        * [func (s *FakeChangesetSource) CloseChangeset(ctx context.Context, c *Changeset) error](#FakeChangesetSource.CloseChangeset)
        * [func (s *FakeChangesetSource) CreateChangeset(ctx context.Context, c *Changeset) (bool, error)](#FakeChangesetSource.CreateChangeset)
        * [func (s *FakeChangesetSource) CreateComment(ctx context.Context, c *Changeset, body string) error](#FakeChangesetSource.CreateComment)
        * [func (s *FakeChangesetSource) CreateDraftChangeset(ctx context.Context, c *Changeset) (bool, error)](#FakeChangesetSource.CreateDraftChangeset)
        * [func (s *FakeChangesetSource) ExternalServices() types.ExternalServices](#FakeChangesetSource.ExternalServices)
        * [func (s *FakeChangesetSource) GitserverPushConfig(ctx context.Context, store *database.ExternalServiceStore, repo *types.Repo) (*protocol.PushConfig, error)](#FakeChangesetSource.GitserverPushConfig)
        * [func (s *FakeChangesetSource) ListRepos(ctx context.Context, results chan repos.SourceResult)](#FakeChangesetSource.ListRepos)
        * [func (s *FakeChangesetSource) LoadChangeset(ctx context.Context, c *Changeset) error](#FakeChangesetSource.LoadChangeset)
        * [func (s *FakeChangesetSource) MergeChangeset(ctx context.Context, c *Changeset, squash bool) error](#FakeChangesetSource.MergeChangeset)
        * [func (s *FakeChangesetSource) ReopenChangeset(ctx context.Context, c *Changeset) error](#FakeChangesetSource.ReopenChangeset)
        * [func (s *FakeChangesetSource) UndraftChangeset(ctx context.Context, c *Changeset) error](#FakeChangesetSource.UndraftChangeset)
        * [func (s *FakeChangesetSource) UpdateChangeset(ctx context.Context, c *Changeset) error](#FakeChangesetSource.UpdateChangeset)
        * [func (s *FakeChangesetSource) ValidateAuthenticator(context.Context) error](#FakeChangesetSource.ValidateAuthenticator)
        * [func (s *FakeChangesetSource) WithAuthenticator(a auth.Authenticator) (ChangesetSource, error)](#FakeChangesetSource.WithAuthenticator)
    * [type GitLabSource struct](#GitLabSource)
        * [func NewGitLabSource(svc *types.ExternalService, cf *httpcli.Factory) (*GitLabSource, error)](#NewGitLabSource)
        * [func newGitLabSource(c *schema.GitLabConnection, cf *httpcli.Factory, au auth.Authenticator) (*GitLabSource, error)](#newGitLabSource)
        * [func (s *GitLabSource) CloseChangeset(ctx context.Context, c *Changeset) error](#GitLabSource.CloseChangeset)
        * [func (s *GitLabSource) CreateChangeset(ctx context.Context, c *Changeset) (bool, error)](#GitLabSource.CreateChangeset)
        * [func (s *GitLabSource) CreateComment(ctx context.Context, c *Changeset, text string) error](#GitLabSource.CreateComment)
        * [func (s *GitLabSource) CreateDraftChangeset(ctx context.Context, c *Changeset) (bool, error)](#GitLabSource.CreateDraftChangeset)
        * [func (s GitLabSource) GitserverPushConfig(ctx context.Context, store *database.ExternalServiceStore, repo *types.Repo) (*protocol.PushConfig, error)](#GitLabSource.GitserverPushConfig)
        * [func (s *GitLabSource) LoadChangeset(ctx context.Context, cs *Changeset) error](#GitLabSource.LoadChangeset)
        * [func (s *GitLabSource) MergeChangeset(ctx context.Context, c *Changeset, squash bool) error](#GitLabSource.MergeChangeset)
        * [func (s *GitLabSource) ReopenChangeset(ctx context.Context, c *Changeset) error](#GitLabSource.ReopenChangeset)
        * [func (s *GitLabSource) UndraftChangeset(ctx context.Context, c *Changeset) error](#GitLabSource.UndraftChangeset)
        * [func (s *GitLabSource) UpdateChangeset(ctx context.Context, c *Changeset) error](#GitLabSource.UpdateChangeset)
        * [func (s GitLabSource) ValidateAuthenticator(ctx context.Context) error](#GitLabSource.ValidateAuthenticator)
        * [func (s GitLabSource) WithAuthenticator(a auth.Authenticator) (ChangesetSource, error)](#GitLabSource.WithAuthenticator)
        * [func (s *GitLabSource) decorateMergeRequestData(ctx context.Context, project *gitlab.Project, mr *gitlab.MergeRequest) error](#GitLabSource.decorateMergeRequestData)
        * [func (s *GitLabSource) getMergeRequestNotes(ctx context.Context, project *gitlab.Project, mr *gitlab.MergeRequest) ([]*gitlab.Note, error)](#GitLabSource.getMergeRequestNotes)
        * [func (s *GitLabSource) getMergeRequestPipelines(ctx context.Context, project *gitlab.Project, mr *gitlab.MergeRequest) ([]*gitlab.Pipeline, error)](#GitLabSource.getMergeRequestPipelines)
        * [func (s *GitLabSource) getMergeRequestResourceStateEvents(ctx context.Context, project *gitlab.Project, mr *gitlab.MergeRequest) ([]*gitlab.ResourceStateEvent, error)](#GitLabSource.getMergeRequestResourceStateEvents)
    * [type GithubSource struct](#GithubSource)
        * [func NewGithubSource(svc *types.ExternalService, cf *httpcli.Factory) (*GithubSource, error)](#NewGithubSource)
        * [func newGithubSource(c *schema.GitHubConnection, cf *httpcli.Factory, au auth.Authenticator) (*GithubSource, error)](#newGithubSource)
        * [func (s GithubSource) CloseChangeset(ctx context.Context, c *Changeset) error](#GithubSource.CloseChangeset)
        * [func (s GithubSource) CreateChangeset(ctx context.Context, c *Changeset) (bool, error)](#GithubSource.CreateChangeset)
        * [func (s GithubSource) CreateComment(ctx context.Context, c *Changeset, text string) error](#GithubSource.CreateComment)
        * [func (s GithubSource) CreateDraftChangeset(ctx context.Context, c *Changeset) (bool, error)](#GithubSource.CreateDraftChangeset)
        * [func (s GithubSource) GitserverPushConfig(ctx context.Context, store *database.ExternalServiceStore, repo *types.Repo) (*protocol.PushConfig, error)](#GithubSource.GitserverPushConfig)
        * [func (s GithubSource) LoadChangeset(ctx context.Context, cs *Changeset) error](#GithubSource.LoadChangeset)
        * [func (s GithubSource) MergeChangeset(ctx context.Context, c *Changeset, squash bool) error](#GithubSource.MergeChangeset)
        * [func (s GithubSource) ReopenChangeset(ctx context.Context, c *Changeset) error](#GithubSource.ReopenChangeset)
        * [func (s GithubSource) UndraftChangeset(ctx context.Context, c *Changeset) error](#GithubSource.UndraftChangeset)
        * [func (s GithubSource) UpdateChangeset(ctx context.Context, c *Changeset) error](#GithubSource.UpdateChangeset)
        * [func (s GithubSource) ValidateAuthenticator(ctx context.Context) error](#GithubSource.ValidateAuthenticator)
        * [func (s GithubSource) WithAuthenticator(a auth.Authenticator) (ChangesetSource, error)](#GithubSource.WithAuthenticator)
        * [func (s GithubSource) createChangeset(ctx context.Context, c *Changeset, prInput *github.CreatePullRequestInput) (bool, error)](#GithubSource.createChangeset)
    * [type Sourcer interface](#Sourcer)
        * [func NewFakeSourcer(err error, source ChangesetSource) Sourcer](#NewFakeSourcer)
        * [func NewSourcer(cf *httpcli.Factory) Sourcer](#NewSourcer)
    * [type SourcerStore interface](#SourcerStore)
    * [type UnsupportedAuthenticatorError struct](#UnsupportedAuthenticatorError)
        * [func newUnsupportedAuthenticatorError(source string, a auth.Authenticator) UnsupportedAuthenticatorError](#newUnsupportedAuthenticatorError)
        * [func (e UnsupportedAuthenticatorError) Error() string](#UnsupportedAuthenticatorError.Error)
    * [type fakeSourcer struct](#fakeSourcer)
        * [func (s *fakeSourcer) ForChangeset(ctx context.Context, tx SourcerStore, ch *btypes.Changeset) (ChangesetSource, error)](#fakeSourcer.ForChangeset)
        * [func (s *fakeSourcer) ForExternalService(ctx context.Context, tx SourcerStore, opts store.GetExternalServiceIDsOpts) (ChangesetSource, error)](#fakeSourcer.ForExternalService)
        * [func (s *fakeSourcer) ForRepo(ctx context.Context, tx SourcerStore, repo *types.Repo) (ChangesetSource, error)](#fakeSourcer.ForRepo)
    * [type gitLabChangesetSourceTestProvider struct](#gitLabChangesetSourceTestProvider)
        * [func newGitLabChangesetSourceTestProvider(t *testing.T) *gitLabChangesetSourceTestProvider](#newGitLabChangesetSourceTestProvider)
        * [func (p *gitLabChangesetSourceTestProvider) mockCreateComment(expected string, mr *gitlab.MergeRequest, err error)](#gitLabChangesetSourceTestProvider.mockCreateComment)
        * [func (p *gitLabChangesetSourceTestProvider) mockCreateMergeRequest(expected gitlab.CreateMergeRequestOpts, mr *gitlab.MergeRequest, err error)](#gitLabChangesetSourceTestProvider.mockCreateMergeRequest)
        * [func (p *gitLabChangesetSourceTestProvider) mockGetMergeRequest(expected gitlab.ID, mr *gitlab.MergeRequest, err error)](#gitLabChangesetSourceTestProvider.mockGetMergeRequest)
        * [func (p *gitLabChangesetSourceTestProvider) mockGetMergeRequestNotes(expectedIID gitlab.ID, notes []*gitlab.Note, pageSize int, err error)](#gitLabChangesetSourceTestProvider.mockGetMergeRequestNotes)
        * [func (p *gitLabChangesetSourceTestProvider) mockGetMergeRequestPipelines(expectedIID gitlab.ID, pipelines []*gitlab.Pipeline, pageSize int, err error)](#gitLabChangesetSourceTestProvider.mockGetMergeRequestPipelines)
        * [func (p *gitLabChangesetSourceTestProvider) mockGetMergeRequestResourceStateEvents(expectedIID gitlab.ID, events []*gitlab.ResourceStateEvent, pageSize int, err error)](#gitLabChangesetSourceTestProvider.mockGetMergeRequestResourceStateEvents)
        * [func (p *gitLabChangesetSourceTestProvider) mockGetOpenMergeRequestByRefs(mr *gitlab.MergeRequest, err error)](#gitLabChangesetSourceTestProvider.mockGetOpenMergeRequestByRefs)
        * [func (p *gitLabChangesetSourceTestProvider) mockUpdateMergeRequest(expectedMR, updated *gitlab.MergeRequest, expectedStateEvent gitlab.UpdateMergeRequestStateEvent, err error)](#gitLabChangesetSourceTestProvider.mockUpdateMergeRequest)
        * [func (p *gitLabChangesetSourceTestProvider) testCommonParams(ctx context.Context, client *gitlab.Client, project *gitlab.Project)](#gitLabChangesetSourceTestProvider.testCommonParams)
        * [func (p *gitLabChangesetSourceTestProvider) unmock()](#gitLabChangesetSourceTestProvider.unmock)
    * [type panicDoer struct{}](#panicDoer)
        * [func (d *panicDoer) Do(r *http.Request) (*http.Response, error)](#panicDoer.Do)
    * [type sourcer struct](#sourcer)
        * [func (s *sourcer) ForChangeset(ctx context.Context, tx SourcerStore, ch *btypes.Changeset) (ChangesetSource, error)](#sourcer.ForChangeset)
        * [func (s *sourcer) ForExternalService(ctx context.Context, tx SourcerStore, opts store.GetExternalServiceIDsOpts) (ChangesetSource, error)](#sourcer.ForExternalService)
        * [func (s *sourcer) ForRepo(ctx context.Context, tx SourcerStore, repo *types.Repo) (ChangesetSource, error)](#sourcer.ForRepo)
        * [func (s *sourcer) loadBatchesSource(ctx context.Context, tx SourcerStore, externalServiceIDs []int64) (ChangesetSource, error)](#sourcer.loadBatchesSource)
* [Functions](#func)
    * [func TestBitbucketServerSource_CloseChangeset(t *testing.T)](#TestBitbucketServerSource_CloseChangeset)
    * [func TestBitbucketServerSource_CreateChangeset(t *testing.T)](#TestBitbucketServerSource_CreateChangeset)
    * [func TestBitbucketServerSource_CreateComment(t *testing.T)](#TestBitbucketServerSource_CreateComment)
    * [func TestBitbucketServerSource_LoadChangeset(t *testing.T)](#TestBitbucketServerSource_LoadChangeset)
    * [func TestBitbucketServerSource_ReopenChangeset(t *testing.T)](#TestBitbucketServerSource_ReopenChangeset)
    * [func TestBitbucketServerSource_UpdateChangeset(t *testing.T)](#TestBitbucketServerSource_UpdateChangeset)
    * [func TestBitbucketServerSource_WithAuthenticator(t *testing.T)](#TestBitbucketServerSource_WithAuthenticator)
    * [func TestExtractCloneURL(t *testing.T)](#TestExtractCloneURL)
    * [func TestGitLabSource_ChangesetSource(t *testing.T)](#TestGitLabSource_ChangesetSource)
    * [func TestGitLabSource_WithAuthenticator(t *testing.T)](#TestGitLabSource_WithAuthenticator)
    * [func TestGithubSource_CloseChangeset(t *testing.T)](#TestGithubSource_CloseChangeset)
    * [func TestGithubSource_CreateChangeset(t *testing.T)](#TestGithubSource_CreateChangeset)
    * [func TestGithubSource_CreateComment(t *testing.T)](#TestGithubSource_CreateComment)
    * [func TestGithubSource_LoadChangeset(t *testing.T)](#TestGithubSource_LoadChangeset)
    * [func TestGithubSource_ReopenChangeset(t *testing.T)](#TestGithubSource_ReopenChangeset)
    * [func TestGithubSource_UpdateChangeset(t *testing.T)](#TestGithubSource_UpdateChangeset)
    * [func TestGithubSource_WithAuthenticator(t *testing.T)](#TestGithubSource_WithAuthenticator)
    * [func TestGitserverPushConfig(t *testing.T)](#TestGitserverPushConfig)
    * [func TestLoadExternalService(t *testing.T)](#TestLoadExternalService)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestReadNotesUntilSeen(t *testing.T)](#TestReadNotesUntilSeen)
    * [func TestReadPipelinesUntilSeen(t *testing.T)](#TestReadPipelinesUntilSeen)
    * [func buildCreatePullRequestInput(c *Changeset) *github.CreatePullRequestInput](#buildCreatePullRequestInput)
    * [func extractCloneURL(ctx context.Context, s *database.ExternalServiceStore, repo *types.Repo) (string, error)](#extractCloneURL)
    * [func gitserverPushConfig(ctx context.Context, store *database.ExternalServiceStore, repo *types.Repo, au auth.Authenticator) (*protocol.PushConfig, error)](#gitserverPushConfig)
    * [func gitserverRedirectMiddleware(cli httpcli.Doer) httpcli.Doer](#gitserverRedirectMiddleware)
    * [func loadExternalService(ctx context.Context, s *database.ExternalServiceStore, opts database.ExternalServicesListOptions) (*types.ExternalService, error)](#loadExternalService)
    * [func loadSiteCredential(ctx context.Context, s SourcerStore, repo *types.Repo) (auth.Authenticator, error)](#loadSiteCredential)
    * [func loadUserCredential(ctx context.Context, s SourcerStore, userID int32, repo *types.Repo) (auth.Authenticator, error)](#loadUserCredential)
    * [func marshalJSON(t testing.TB, v interface{}) string](#marshalJSON)
    * [func newClientFactory(t testing.TB, name string, mws ...httpcli.Middleware) (*httpcli.Factory, func(testing.TB))](#newClientFactory)
    * [func newRecorder(t testing.TB, file string, record bool) *recorder.Recorder](#newRecorder)
    * [func paginatedNoteIterator(notes []*gitlab.Note, pageSize int) func() ([]*gitlab.Note, error)](#paginatedNoteIterator)
    * [func paginatedPipelineIterator(pipelines []*gitlab.Pipeline, pageSize int) func() ([]*gitlab.Pipeline, error)](#paginatedPipelineIterator)
    * [func paginatedResourceStateEventIterator(events []*gitlab.ResourceStateEvent, pageSize int) func() ([]*gitlab.ResourceStateEvent, error)](#paginatedResourceStateEventIterator)
    * [func readMergeRequestResourceStateEvents(it func() ([]*gitlab.ResourceStateEvent, error)) ([]*gitlab.ResourceStateEvent, error)](#readMergeRequestResourceStateEvents)
    * [func readPipelines(it func() ([]*gitlab.Pipeline, error)) ([]*gitlab.Pipeline, error)](#readPipelines)
    * [func readSystemNotes(it func() ([]*gitlab.Note, error)) ([]*gitlab.Note, error)](#readSystemNotes)
    * [func save(t testing.TB, rec *recorder.Recorder)](#save)
    * [func setBasicAuth(u *vcs.URL, extSvcType, username, password string) error](#setBasicAuth)
    * [func setOAuthTokenAuth(u *vcs.URL, extSvcType, token string) error](#setOAuthTokenAuth)
    * [func update(name string) bool](#update)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ErrMissingCredentials" href="#ErrMissingCredentials">var ErrMissingCredentials</a>

```
searchKey: sources.ErrMissingCredentials
tags: [variable interface]
```

```Go
var ErrMissingCredentials = errors.New("no credential found to authenticate ChangesetSource")
```

ErrMissingCredentials is returned by WithAuthenticatorForUser, if the user that applied the last batch change/changeset spec doesn't have UserCredentials for the given repository and is not a site-admin (so no fallback to the global credentials is possible). 

### <a id="ErrNoSSHCredential" href="#ErrNoSSHCredential">var ErrNoSSHCredential</a>

```
searchKey: sources.ErrNoSSHCredential
tags: [variable interface]
```

```Go
var ErrNoSSHCredential = errors.New("authenticator doesn't support SSH")
```

ErrNoSSHCredential is returned by gitserverPushConfig, if the clone URL of the repository uses the ssh:// scheme, but the authenticator doesn't support SSH pushes. 

### <a id="NoReposErr" href="#NoReposErr">var NoReposErr</a>

```
searchKey: sources.NoReposErr
tags: [variable interface]
```

```Go
var NoReposErr = errors.New("no repository set on Changeset")
```

### <a id="fakeNotImplemented" href="#fakeNotImplemented">var fakeNotImplemented</a>

```
searchKey: sources.fakeNotImplemented
tags: [variable interface private]
```

```Go
var fakeNotImplemented = errors.New("not implemented in FakeChangesetSource")
```

### <a id="updateRegex" href="#updateRegex">var updateRegex</a>

```
searchKey: sources.updateRegex
tags: [variable string private]
```

```Go
var updateRegex = flag.String("update", "", "Update testdata of tests matching the given regex")
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="BitbucketServerSource" href="#BitbucketServerSource">type BitbucketServerSource struct</a>

```
searchKey: sources.BitbucketServerSource
tags: [struct]
```

```Go
type BitbucketServerSource struct {
	client *bitbucketserver.Client
	au     auth.Authenticator
}
```

#### <a id="NewBitbucketServerSource" href="#NewBitbucketServerSource">func NewBitbucketServerSource(svc *types.ExternalService, cf *httpcli.Factory) (*BitbucketServerSource, error)</a>

```
searchKey: sources.NewBitbucketServerSource
tags: [function]
```

```Go
func NewBitbucketServerSource(svc *types.ExternalService, cf *httpcli.Factory) (*BitbucketServerSource, error)
```

NewBitbucketServerSource returns a new BitbucketServerSource from the given external service. 

#### <a id="newBitbucketServerSource" href="#newBitbucketServerSource">func newBitbucketServerSource(c *schema.BitbucketServerConnection, cf *httpcli.Factory, au auth.Authenticator) (*BitbucketServerSource, error)</a>

```
searchKey: sources.newBitbucketServerSource
tags: [function private]
```

```Go
func newBitbucketServerSource(c *schema.BitbucketServerConnection, cf *httpcli.Factory, au auth.Authenticator) (*BitbucketServerSource, error)
```

#### <a id="BitbucketServerSource.AuthenticatedUsername" href="#BitbucketServerSource.AuthenticatedUsername">func (s BitbucketServerSource) AuthenticatedUsername(ctx context.Context) (string, error)</a>

```
searchKey: sources.BitbucketServerSource.AuthenticatedUsername
tags: [method]
```

```Go
func (s BitbucketServerSource) AuthenticatedUsername(ctx context.Context) (string, error)
```

AuthenticatedUsername uses the underlying bitbucketserver.Client to get the username belonging to the credentials associated with the BitbucketServerSource. 

#### <a id="BitbucketServerSource.CloseChangeset" href="#BitbucketServerSource.CloseChangeset">func (s BitbucketServerSource) CloseChangeset(ctx context.Context, c *Changeset) error</a>

```
searchKey: sources.BitbucketServerSource.CloseChangeset
tags: [method]
```

```Go
func (s BitbucketServerSource) CloseChangeset(ctx context.Context, c *Changeset) error
```

CloseChangeset closes the given *Changeset on the code host and updates the Metadata column in the *batches.Changeset to the newly closed pull request. 

#### <a id="BitbucketServerSource.CreateChangeset" href="#BitbucketServerSource.CreateChangeset">func (s BitbucketServerSource) CreateChangeset(ctx context.Context, c *Changeset) (bool, error)</a>

```
searchKey: sources.BitbucketServerSource.CreateChangeset
tags: [method]
```

```Go
func (s BitbucketServerSource) CreateChangeset(ctx context.Context, c *Changeset) (bool, error)
```

CreateChangeset creates the given *Changeset in the code host. 

#### <a id="BitbucketServerSource.CreateComment" href="#BitbucketServerSource.CreateComment">func (s BitbucketServerSource) CreateComment(ctx context.Context, c *Changeset, text string) error</a>

```
searchKey: sources.BitbucketServerSource.CreateComment
tags: [method]
```

```Go
func (s BitbucketServerSource) CreateComment(ctx context.Context, c *Changeset, text string) error
```

CreateComment posts a comment on the Changeset. 

#### <a id="BitbucketServerSource.GitserverPushConfig" href="#BitbucketServerSource.GitserverPushConfig">func (s BitbucketServerSource) GitserverPushConfig(ctx context.Context, store *database.ExternalServiceStore, repo *types.Repo) (*protocol.PushConfig, error)</a>

```
searchKey: sources.BitbucketServerSource.GitserverPushConfig
tags: [method]
```

```Go
func (s BitbucketServerSource) GitserverPushConfig(ctx context.Context, store *database.ExternalServiceStore, repo *types.Repo) (*protocol.PushConfig, error)
```

#### <a id="BitbucketServerSource.LoadChangeset" href="#BitbucketServerSource.LoadChangeset">func (s BitbucketServerSource) LoadChangeset(ctx context.Context, cs *Changeset) error</a>

```
searchKey: sources.BitbucketServerSource.LoadChangeset
tags: [method]
```

```Go
func (s BitbucketServerSource) LoadChangeset(ctx context.Context, cs *Changeset) error
```

LoadChangeset loads the latest state of the given Changeset from the codehost. 

#### <a id="BitbucketServerSource.MergeChangeset" href="#BitbucketServerSource.MergeChangeset">func (s BitbucketServerSource) MergeChangeset(ctx context.Context, c *Changeset, squash bool) error</a>

```
searchKey: sources.BitbucketServerSource.MergeChangeset
tags: [method]
```

```Go
func (s BitbucketServerSource) MergeChangeset(ctx context.Context, c *Changeset, squash bool) error
```

MergeChangeset merges a Changeset on the code host, if in a mergeable state. The squash parameter is ignored, as Bitbucket Server does not support squash merges. 

#### <a id="BitbucketServerSource.ReopenChangeset" href="#BitbucketServerSource.ReopenChangeset">func (s BitbucketServerSource) ReopenChangeset(ctx context.Context, c *Changeset) error</a>

```
searchKey: sources.BitbucketServerSource.ReopenChangeset
tags: [method]
```

```Go
func (s BitbucketServerSource) ReopenChangeset(ctx context.Context, c *Changeset) error
```

ReopenChangeset reopens the *Changeset on the code host and updates the Metadata column in the *batches.Changeset. 

#### <a id="BitbucketServerSource.UpdateChangeset" href="#BitbucketServerSource.UpdateChangeset">func (s BitbucketServerSource) UpdateChangeset(ctx context.Context, c *Changeset) error</a>

```
searchKey: sources.BitbucketServerSource.UpdateChangeset
tags: [method]
```

```Go
func (s BitbucketServerSource) UpdateChangeset(ctx context.Context, c *Changeset) error
```

#### <a id="BitbucketServerSource.ValidateAuthenticator" href="#BitbucketServerSource.ValidateAuthenticator">func (s BitbucketServerSource) ValidateAuthenticator(ctx context.Context) error</a>

```
searchKey: sources.BitbucketServerSource.ValidateAuthenticator
tags: [method]
```

```Go
func (s BitbucketServerSource) ValidateAuthenticator(ctx context.Context) error
```

#### <a id="BitbucketServerSource.WithAuthenticator" href="#BitbucketServerSource.WithAuthenticator">func (s BitbucketServerSource) WithAuthenticator(a auth.Authenticator) (ChangesetSource, error)</a>

```
searchKey: sources.BitbucketServerSource.WithAuthenticator
tags: [method]
```

```Go
func (s BitbucketServerSource) WithAuthenticator(a auth.Authenticator) (ChangesetSource, error)
```

#### <a id="BitbucketServerSource.loadPullRequestData" href="#BitbucketServerSource.loadPullRequestData">func (s BitbucketServerSource) loadPullRequestData(ctx context.Context, pr *bitbucketserver.PullRequest) error</a>

```
searchKey: sources.BitbucketServerSource.loadPullRequestData
tags: [method private]
```

```Go
func (s BitbucketServerSource) loadPullRequestData(ctx context.Context, pr *bitbucketserver.PullRequest) error
```

### <a id="Changeset" href="#Changeset">type Changeset struct</a>

```
searchKey: sources.Changeset
tags: [struct]
```

```Go
type Changeset struct {
	Title   string
	Body    string
	HeadRef string
	BaseRef string

	*btypes.Changeset
	*types.Repo
}
```

A Changeset of an existing Repo. 

#### <a id="Changeset.IsOutdated" href="#Changeset.IsOutdated">func (c *Changeset) IsOutdated() (bool, error)</a>

```
searchKey: sources.Changeset.IsOutdated
tags: [method]
```

```Go
func (c *Changeset) IsOutdated() (bool, error)
```

IsOutdated returns true when the attributes of the nested batches.Changeset do not match the attributes (title, body, ...) set on the Changeset. 

### <a id="ChangesetNotFoundError" href="#ChangesetNotFoundError">type ChangesetNotFoundError struct</a>

```
searchKey: sources.ChangesetNotFoundError
tags: [struct]
```

```Go
type ChangesetNotFoundError struct {
	Changeset *Changeset
}
```

ChangesetNotFoundError is returned by LoadChangeset if the changeset could not be found on the codehost. This is only returned, if the changeset is actually not found. Other not found errors, such as repo not found should NOT raise this error, since it will cause the changeset to be marked as deleted. 

#### <a id="ChangesetNotFoundError.Error" href="#ChangesetNotFoundError.Error">func (e ChangesetNotFoundError) Error() string</a>

```
searchKey: sources.ChangesetNotFoundError.Error
tags: [method]
```

```Go
func (e ChangesetNotFoundError) Error() string
```

#### <a id="ChangesetNotFoundError.NonRetryable" href="#ChangesetNotFoundError.NonRetryable">func (e ChangesetNotFoundError) NonRetryable() bool</a>

```
searchKey: sources.ChangesetNotFoundError.NonRetryable
tags: [method]
```

```Go
func (e ChangesetNotFoundError) NonRetryable() bool
```

### <a id="ChangesetNotMergeableError" href="#ChangesetNotMergeableError">type ChangesetNotMergeableError struct</a>

```
searchKey: sources.ChangesetNotMergeableError
tags: [struct]
```

```Go
type ChangesetNotMergeableError struct {
	ErrorMsg string
}
```

ChangesetNotMergeableError is returned by MergeChangeset if the changeset could not be merged on the codehost, because some precondition is not met. This is only returned, if the changeset is not mergeable. Other errors, such as network or auth errors should NOT raise this error. 

#### <a id="ChangesetNotMergeableError.Error" href="#ChangesetNotMergeableError.Error">func (e ChangesetNotMergeableError) Error() string</a>

```
searchKey: sources.ChangesetNotMergeableError.Error
tags: [method]
```

```Go
func (e ChangesetNotMergeableError) Error() string
```

#### <a id="ChangesetNotMergeableError.NonRetryable" href="#ChangesetNotMergeableError.NonRetryable">func (e ChangesetNotMergeableError) NonRetryable() bool</a>

```
searchKey: sources.ChangesetNotMergeableError.NonRetryable
tags: [method]
```

```Go
func (e ChangesetNotMergeableError) NonRetryable() bool
```

### <a id="ChangesetSource" href="#ChangesetSource">type ChangesetSource interface</a>

```
searchKey: sources.ChangesetSource
tags: [interface]
```

```Go
type ChangesetSource interface {
	// GitserverPushConfig returns an authenticated push config used for pushing
	// commits to the code host.
	GitserverPushConfig(context.Context, *database.ExternalServiceStore, *types.Repo) (*protocol.PushConfig, error)
	// WithAuthenticator returns a copy of the original Source configured to use
	// the given authenticator, provided that authenticator type is supported by
	// the code host.
	WithAuthenticator(auth.Authenticator) (ChangesetSource, error)
	// ValidateAuthenticator validates the currently set authenticator is usable.
	// Returns an error, when validating the Authenticator yielded an error.
	ValidateAuthenticator(ctx context.Context) error

	// LoadChangeset loads the given Changeset from the source and updates it.
	// If the Changeset could not be found on the source, a ChangesetNotFoundError is returned.
	LoadChangeset(context.Context, *Changeset) error
	// CreateChangeset will create the Changeset on the source. If it already
	// exists, *Changeset will be populated and the return value will be
	// true.
	CreateChangeset(context.Context, *Changeset) (bool, error)
	// CloseChangeset will close the Changeset on the source, where "close"
	// means the appropriate final state on the codehost (e.g. "declined" on
	// Bitbucket Server).
	CloseChangeset(context.Context, *Changeset) error
	// UpdateChangeset can update Changesets.
	UpdateChangeset(context.Context, *Changeset) error
	// ReopenChangeset will reopen the Changeset on the source, if it's closed.
	// If not, it's a noop.
	ReopenChangeset(context.Context, *Changeset) error
	// CreateComment posts a comment on the Changeset.
	CreateComment(context.Context, *Changeset, string) error
	// MergeChangeset merges a Changeset on the code host, if in a mergeable state.
	// If squash is true, and the code host supports squash merges, the source
	// must attempt a squash merge. Otherwise, it is expected to perform a regular
	// merge. If the changeset cannot be merged, because it is in an unmergeable
	// state, ChangesetNotMergeableError must be returned.
	MergeChangeset(ctx context.Context, ch *Changeset, squash bool) error
}
```

A ChangesetSource can load the latest state of a list of Changesets. 

#### <a id="WithAuthenticatorForUser" href="#WithAuthenticatorForUser">func WithAuthenticatorForUser(ctx context.Context, tx SourcerStore, css ChangesetSource, userID int32, repo *types.Repo) (ChangesetSource, error)</a>

```
searchKey: sources.WithAuthenticatorForUser
tags: [function]
```

```Go
func WithAuthenticatorForUser(ctx context.Context, tx SourcerStore, css ChangesetSource, userID int32, repo *types.Repo) (ChangesetSource, error)
```

WithAuthenticatorForUser authenticates the given ChangesetSource with a credential usable by the given user with userID. User credentials are preferred, with a fallback to site credentials. If none of these exist, ErrMissingCredentials is returned. 

#### <a id="WithSiteAuthenticator" href="#WithSiteAuthenticator">func WithSiteAuthenticator(ctx context.Context, tx SourcerStore, css ChangesetSource, repo *types.Repo) (ChangesetSource, error)</a>

```
searchKey: sources.WithSiteAuthenticator
tags: [function]
```

```Go
func WithSiteAuthenticator(ctx context.Context, tx SourcerStore, css ChangesetSource, repo *types.Repo) (ChangesetSource, error)
```

WithSiteAuthenticator uses the site credential of the code host of the passed-in repo. If no credential is found, the original source is returned and uses the external service config. 

#### <a id="buildChangesetSource" href="#buildChangesetSource">func buildChangesetSource(store SourcerStore, cf *httpcli.Factory, externalService *types.ExternalService) (ChangesetSource, error)</a>

```
searchKey: sources.buildChangesetSource
tags: [function private]
```

```Go
func buildChangesetSource(store SourcerStore, cf *httpcli.Factory, externalService *types.ExternalService) (ChangesetSource, error)
```

buildChangesetSource get an authenticated ChangesetSource for the given repo to load the changeset state from. 

### <a id="DraftChangesetSource" href="#DraftChangesetSource">type DraftChangesetSource interface</a>

```
searchKey: sources.DraftChangesetSource
tags: [interface]
```

```Go
type DraftChangesetSource interface {
	// CreateDraftChangeset will create the Changeset on the source. If it already
	// exists, *Changeset will be populated and the return value will be
	// true.
	CreateDraftChangeset(context.Context, *Changeset) (bool, error)
	// UndraftChangeset will update the Changeset on the source to be not in draft mode anymore.
	UndraftChangeset(context.Context, *Changeset) error
}
```

A DraftChangesetSource can create draft changesets and undraft them. 

#### <a id="ToDraftChangesetSource" href="#ToDraftChangesetSource">func ToDraftChangesetSource(css ChangesetSource) (DraftChangesetSource, error)</a>

```
searchKey: sources.ToDraftChangesetSource
tags: [function]
```

```Go
func ToDraftChangesetSource(css ChangesetSource) (DraftChangesetSource, error)
```

DraftChangesetSource returns a DraftChangesetSource, if the underlying source supports it. Returns an error if not. 

### <a id="ErrNoPushCredentials" href="#ErrNoPushCredentials">type ErrNoPushCredentials struct</a>

```
searchKey: sources.ErrNoPushCredentials
tags: [struct]
```

```Go
type ErrNoPushCredentials struct{ CredentialsType string }
```

ErrNoPushCredentials is returned by gitserverPushConfig if the authenticator cannot be used by git to authenticate a `git push`. 

#### <a id="ErrNoPushCredentials.Error" href="#ErrNoPushCredentials.Error">func (e ErrNoPushCredentials) Error() string</a>

```
searchKey: sources.ErrNoPushCredentials.Error
tags: [method]
```

```Go
func (e ErrNoPushCredentials) Error() string
```

### <a id="FakeChangesetSource" href="#FakeChangesetSource">type FakeChangesetSource struct</a>

```
searchKey: sources.FakeChangesetSource
tags: [struct]
```

```Go
type FakeChangesetSource struct {
	Svc *types.ExternalService

	CurrentAuthenticator auth.Authenticator

	CreateDraftChangesetCalled  bool
	UndraftedChangesetsCalled   bool
	CreateChangesetCalled       bool
	UpdateChangesetCalled       bool
	ListReposCalled             bool
	ExternalServicesCalled      bool
	LoadChangesetCalled         bool
	CloseChangesetCalled        bool
	ReopenChangesetCalled       bool
	CreateCommentCalled         bool
	AuthenticatedUsernameCalled bool
	ValidateAuthenticatorCalled bool
	MergeChangesetCalled        bool

	// The Changeset.HeadRef to be expected in CreateChangeset/UpdateChangeset calls.
	WantHeadRef string
	// The Changeset.BaseRef to be expected in CreateChangeset/UpdateChangeset calls.
	WantBaseRef string

	// The metadata the FakeChangesetSource should set on the created/updated
	// Changeset with changeset.SetMetadata.
	FakeMetadata interface{}

	// Whether or not the changeset already ChangesetExists on the code host at the time
	// when CreateChangeset is called.
	ChangesetExists bool

	// When true, ValidateAuthenticator will return no error.
	AuthenticatorIsValid bool

	// error to be returned from every method
	Err error

	// ClosedChangesets contains the changesets that were passed to CloseChangeset
	ClosedChangesets []*Changeset

	// CreatedChangesets contains the changesets that were passed to
	// CreateChangeset
	CreatedChangesets []*Changeset

	// LoadedChangesets contains the changesets that were passed to LoadChangeset
	LoadedChangesets []*Changeset

	// UpdateChangesets contains the changesets that were passed to
	// UpdateChangeset
	UpdatedChangesets []*Changeset

	// ReopenedChangesets contains the changesets that were passed to ReopenedChangeset
	ReopenedChangesets []*Changeset

	// UndraftedChangesets contains the changesets that were passed to UndraftChangeset
	UndraftedChangesets []*Changeset

	// Username is the username returned by AuthenticatedUsername
	Username string
}
```

FakeChangesetSource is a fake implementation of the ChangesetSource interface to be used in tests. 

#### <a id="FakeChangesetSource.AuthenticatedUsername" href="#FakeChangesetSource.AuthenticatedUsername">func (s *FakeChangesetSource) AuthenticatedUsername(ctx context.Context) (string, error)</a>

```
searchKey: sources.FakeChangesetSource.AuthenticatedUsername
tags: [method]
```

```Go
func (s *FakeChangesetSource) AuthenticatedUsername(ctx context.Context) (string, error)
```

#### <a id="FakeChangesetSource.CloseChangeset" href="#FakeChangesetSource.CloseChangeset">func (s *FakeChangesetSource) CloseChangeset(ctx context.Context, c *Changeset) error</a>

```
searchKey: sources.FakeChangesetSource.CloseChangeset
tags: [method]
```

```Go
func (s *FakeChangesetSource) CloseChangeset(ctx context.Context, c *Changeset) error
```

#### <a id="FakeChangesetSource.CreateChangeset" href="#FakeChangesetSource.CreateChangeset">func (s *FakeChangesetSource) CreateChangeset(ctx context.Context, c *Changeset) (bool, error)</a>

```
searchKey: sources.FakeChangesetSource.CreateChangeset
tags: [method]
```

```Go
func (s *FakeChangesetSource) CreateChangeset(ctx context.Context, c *Changeset) (bool, error)
```

#### <a id="FakeChangesetSource.CreateComment" href="#FakeChangesetSource.CreateComment">func (s *FakeChangesetSource) CreateComment(ctx context.Context, c *Changeset, body string) error</a>

```
searchKey: sources.FakeChangesetSource.CreateComment
tags: [method]
```

```Go
func (s *FakeChangesetSource) CreateComment(ctx context.Context, c *Changeset, body string) error
```

#### <a id="FakeChangesetSource.CreateDraftChangeset" href="#FakeChangesetSource.CreateDraftChangeset">func (s *FakeChangesetSource) CreateDraftChangeset(ctx context.Context, c *Changeset) (bool, error)</a>

```
searchKey: sources.FakeChangesetSource.CreateDraftChangeset
tags: [method]
```

```Go
func (s *FakeChangesetSource) CreateDraftChangeset(ctx context.Context, c *Changeset) (bool, error)
```

#### <a id="FakeChangesetSource.ExternalServices" href="#FakeChangesetSource.ExternalServices">func (s *FakeChangesetSource) ExternalServices() types.ExternalServices</a>

```
searchKey: sources.FakeChangesetSource.ExternalServices
tags: [method]
```

```Go
func (s *FakeChangesetSource) ExternalServices() types.ExternalServices
```

#### <a id="FakeChangesetSource.GitserverPushConfig" href="#FakeChangesetSource.GitserverPushConfig">func (s *FakeChangesetSource) GitserverPushConfig(ctx context.Context, store *database.ExternalServiceStore, repo *types.Repo) (*protocol.PushConfig, error)</a>

```
searchKey: sources.FakeChangesetSource.GitserverPushConfig
tags: [method]
```

```Go
func (s *FakeChangesetSource) GitserverPushConfig(ctx context.Context, store *database.ExternalServiceStore, repo *types.Repo) (*protocol.PushConfig, error)
```

#### <a id="FakeChangesetSource.ListRepos" href="#FakeChangesetSource.ListRepos">func (s *FakeChangesetSource) ListRepos(ctx context.Context, results chan repos.SourceResult)</a>

```
searchKey: sources.FakeChangesetSource.ListRepos
tags: [method]
```

```Go
func (s *FakeChangesetSource) ListRepos(ctx context.Context, results chan repos.SourceResult)
```

#### <a id="FakeChangesetSource.LoadChangeset" href="#FakeChangesetSource.LoadChangeset">func (s *FakeChangesetSource) LoadChangeset(ctx context.Context, c *Changeset) error</a>

```
searchKey: sources.FakeChangesetSource.LoadChangeset
tags: [method]
```

```Go
func (s *FakeChangesetSource) LoadChangeset(ctx context.Context, c *Changeset) error
```

#### <a id="FakeChangesetSource.MergeChangeset" href="#FakeChangesetSource.MergeChangeset">func (s *FakeChangesetSource) MergeChangeset(ctx context.Context, c *Changeset, squash bool) error</a>

```
searchKey: sources.FakeChangesetSource.MergeChangeset
tags: [method]
```

```Go
func (s *FakeChangesetSource) MergeChangeset(ctx context.Context, c *Changeset, squash bool) error
```

#### <a id="FakeChangesetSource.ReopenChangeset" href="#FakeChangesetSource.ReopenChangeset">func (s *FakeChangesetSource) ReopenChangeset(ctx context.Context, c *Changeset) error</a>

```
searchKey: sources.FakeChangesetSource.ReopenChangeset
tags: [method]
```

```Go
func (s *FakeChangesetSource) ReopenChangeset(ctx context.Context, c *Changeset) error
```

#### <a id="FakeChangesetSource.UndraftChangeset" href="#FakeChangesetSource.UndraftChangeset">func (s *FakeChangesetSource) UndraftChangeset(ctx context.Context, c *Changeset) error</a>

```
searchKey: sources.FakeChangesetSource.UndraftChangeset
tags: [method]
```

```Go
func (s *FakeChangesetSource) UndraftChangeset(ctx context.Context, c *Changeset) error
```

#### <a id="FakeChangesetSource.UpdateChangeset" href="#FakeChangesetSource.UpdateChangeset">func (s *FakeChangesetSource) UpdateChangeset(ctx context.Context, c *Changeset) error</a>

```
searchKey: sources.FakeChangesetSource.UpdateChangeset
tags: [method]
```

```Go
func (s *FakeChangesetSource) UpdateChangeset(ctx context.Context, c *Changeset) error
```

#### <a id="FakeChangesetSource.ValidateAuthenticator" href="#FakeChangesetSource.ValidateAuthenticator">func (s *FakeChangesetSource) ValidateAuthenticator(context.Context) error</a>

```
searchKey: sources.FakeChangesetSource.ValidateAuthenticator
tags: [method]
```

```Go
func (s *FakeChangesetSource) ValidateAuthenticator(context.Context) error
```

#### <a id="FakeChangesetSource.WithAuthenticator" href="#FakeChangesetSource.WithAuthenticator">func (s *FakeChangesetSource) WithAuthenticator(a auth.Authenticator) (ChangesetSource, error)</a>

```
searchKey: sources.FakeChangesetSource.WithAuthenticator
tags: [method]
```

```Go
func (s *FakeChangesetSource) WithAuthenticator(a auth.Authenticator) (ChangesetSource, error)
```

### <a id="GitLabSource" href="#GitLabSource">type GitLabSource struct</a>

```
searchKey: sources.GitLabSource
tags: [struct]
```

```Go
type GitLabSource struct {
	client *gitlab.Client
	au     auth.Authenticator
}
```

#### <a id="NewGitLabSource" href="#NewGitLabSource">func NewGitLabSource(svc *types.ExternalService, cf *httpcli.Factory) (*GitLabSource, error)</a>

```
searchKey: sources.NewGitLabSource
tags: [function]
```

```Go
func NewGitLabSource(svc *types.ExternalService, cf *httpcli.Factory) (*GitLabSource, error)
```

NewGitLabSource returns a new GitLabSource from the given external service. 

#### <a id="newGitLabSource" href="#newGitLabSource">func newGitLabSource(c *schema.GitLabConnection, cf *httpcli.Factory, au auth.Authenticator) (*GitLabSource, error)</a>

```
searchKey: sources.newGitLabSource
tags: [function private]
```

```Go
func newGitLabSource(c *schema.GitLabConnection, cf *httpcli.Factory, au auth.Authenticator) (*GitLabSource, error)
```

#### <a id="GitLabSource.CloseChangeset" href="#GitLabSource.CloseChangeset">func (s *GitLabSource) CloseChangeset(ctx context.Context, c *Changeset) error</a>

```
searchKey: sources.GitLabSource.CloseChangeset
tags: [method]
```

```Go
func (s *GitLabSource) CloseChangeset(ctx context.Context, c *Changeset) error
```

CloseChangeset closes the merge request on GitLab, leaving it unlocked. 

#### <a id="GitLabSource.CreateChangeset" href="#GitLabSource.CreateChangeset">func (s *GitLabSource) CreateChangeset(ctx context.Context, c *Changeset) (bool, error)</a>

```
searchKey: sources.GitLabSource.CreateChangeset
tags: [method]
```

```Go
func (s *GitLabSource) CreateChangeset(ctx context.Context, c *Changeset) (bool, error)
```

CreateChangeset creates a GitLab merge request. If it already exists, *Changeset will be populated and the return value will be true. 

#### <a id="GitLabSource.CreateComment" href="#GitLabSource.CreateComment">func (s *GitLabSource) CreateComment(ctx context.Context, c *Changeset, text string) error</a>

```
searchKey: sources.GitLabSource.CreateComment
tags: [method]
```

```Go
func (s *GitLabSource) CreateComment(ctx context.Context, c *Changeset, text string) error
```

CreateComment posts a comment on the Changeset. 

#### <a id="GitLabSource.CreateDraftChangeset" href="#GitLabSource.CreateDraftChangeset">func (s *GitLabSource) CreateDraftChangeset(ctx context.Context, c *Changeset) (bool, error)</a>

```
searchKey: sources.GitLabSource.CreateDraftChangeset
tags: [method]
```

```Go
func (s *GitLabSource) CreateDraftChangeset(ctx context.Context, c *Changeset) (bool, error)
```

CreateDraftChangeset creates a GitLab merge request. If it already exists, *Changeset will be populated and the return value will be true. 

#### <a id="GitLabSource.GitserverPushConfig" href="#GitLabSource.GitserverPushConfig">func (s GitLabSource) GitserverPushConfig(ctx context.Context, store *database.ExternalServiceStore, repo *types.Repo) (*protocol.PushConfig, error)</a>

```
searchKey: sources.GitLabSource.GitserverPushConfig
tags: [method]
```

```Go
func (s GitLabSource) GitserverPushConfig(ctx context.Context, store *database.ExternalServiceStore, repo *types.Repo) (*protocol.PushConfig, error)
```

#### <a id="GitLabSource.LoadChangeset" href="#GitLabSource.LoadChangeset">func (s *GitLabSource) LoadChangeset(ctx context.Context, cs *Changeset) error</a>

```
searchKey: sources.GitLabSource.LoadChangeset
tags: [method]
```

```Go
func (s *GitLabSource) LoadChangeset(ctx context.Context, cs *Changeset) error
```

LoadChangeset loads the given merge request from GitLab and updates it. 

#### <a id="GitLabSource.MergeChangeset" href="#GitLabSource.MergeChangeset">func (s *GitLabSource) MergeChangeset(ctx context.Context, c *Changeset, squash bool) error</a>

```
searchKey: sources.GitLabSource.MergeChangeset
tags: [method]
```

```Go
func (s *GitLabSource) MergeChangeset(ctx context.Context, c *Changeset, squash bool) error
```

MergeChangeset merges a Changeset on the code host, if in a mergeable state. If squash is true, a squash-then-merge merge will be performed. 

#### <a id="GitLabSource.ReopenChangeset" href="#GitLabSource.ReopenChangeset">func (s *GitLabSource) ReopenChangeset(ctx context.Context, c *Changeset) error</a>

```
searchKey: sources.GitLabSource.ReopenChangeset
tags: [method]
```

```Go
func (s *GitLabSource) ReopenChangeset(ctx context.Context, c *Changeset) error
```

ReopenChangeset closes the merge request on GitLab, leaving it unlocked. 

#### <a id="GitLabSource.UndraftChangeset" href="#GitLabSource.UndraftChangeset">func (s *GitLabSource) UndraftChangeset(ctx context.Context, c *Changeset) error</a>

```
searchKey: sources.GitLabSource.UndraftChangeset
tags: [method]
```

```Go
func (s *GitLabSource) UndraftChangeset(ctx context.Context, c *Changeset) error
```

UndraftChangeset marks the changeset as *not* work in progress anymore. 

#### <a id="GitLabSource.UpdateChangeset" href="#GitLabSource.UpdateChangeset">func (s *GitLabSource) UpdateChangeset(ctx context.Context, c *Changeset) error</a>

```
searchKey: sources.GitLabSource.UpdateChangeset
tags: [method]
```

```Go
func (s *GitLabSource) UpdateChangeset(ctx context.Context, c *Changeset) error
```

UpdateChangeset updates the merge request on GitLab to reflect the local state of the Changeset. 

#### <a id="GitLabSource.ValidateAuthenticator" href="#GitLabSource.ValidateAuthenticator">func (s GitLabSource) ValidateAuthenticator(ctx context.Context) error</a>

```
searchKey: sources.GitLabSource.ValidateAuthenticator
tags: [method]
```

```Go
func (s GitLabSource) ValidateAuthenticator(ctx context.Context) error
```

#### <a id="GitLabSource.WithAuthenticator" href="#GitLabSource.WithAuthenticator">func (s GitLabSource) WithAuthenticator(a auth.Authenticator) (ChangesetSource, error)</a>

```
searchKey: sources.GitLabSource.WithAuthenticator
tags: [method]
```

```Go
func (s GitLabSource) WithAuthenticator(a auth.Authenticator) (ChangesetSource, error)
```

#### <a id="GitLabSource.decorateMergeRequestData" href="#GitLabSource.decorateMergeRequestData">func (s *GitLabSource) decorateMergeRequestData(ctx context.Context, project *gitlab.Project, mr *gitlab.MergeRequest) error</a>

```
searchKey: sources.GitLabSource.decorateMergeRequestData
tags: [method private]
```

```Go
func (s *GitLabSource) decorateMergeRequestData(ctx context.Context, project *gitlab.Project, mr *gitlab.MergeRequest) error
```

#### <a id="GitLabSource.getMergeRequestNotes" href="#GitLabSource.getMergeRequestNotes">func (s *GitLabSource) getMergeRequestNotes(ctx context.Context, project *gitlab.Project, mr *gitlab.MergeRequest) ([]*gitlab.Note, error)</a>

```
searchKey: sources.GitLabSource.getMergeRequestNotes
tags: [method private]
```

```Go
func (s *GitLabSource) getMergeRequestNotes(ctx context.Context, project *gitlab.Project, mr *gitlab.MergeRequest) ([]*gitlab.Note, error)
```

getMergeRequestNotes retrieves the notes attached to a merge request in descending time order. 

#### <a id="GitLabSource.getMergeRequestPipelines" href="#GitLabSource.getMergeRequestPipelines">func (s *GitLabSource) getMergeRequestPipelines(ctx context.Context, project *gitlab.Project, mr *gitlab.MergeRequest) ([]*gitlab.Pipeline, error)</a>

```
searchKey: sources.GitLabSource.getMergeRequestPipelines
tags: [method private]
```

```Go
func (s *GitLabSource) getMergeRequestPipelines(ctx context.Context, project *gitlab.Project, mr *gitlab.MergeRequest) ([]*gitlab.Pipeline, error)
```

getMergeRequestPipelines retrieves the pipelines attached to a merge request in descending time order. 

#### <a id="GitLabSource.getMergeRequestResourceStateEvents" href="#GitLabSource.getMergeRequestResourceStateEvents">func (s *GitLabSource) getMergeRequestResourceStateEvents(ctx context.Context, project *gitlab.Project, mr *gitlab.MergeRequest) ([]*gitlab.ResourceStateEvent, error)</a>

```
searchKey: sources.GitLabSource.getMergeRequestResourceStateEvents
tags: [method private]
```

```Go
func (s *GitLabSource) getMergeRequestResourceStateEvents(ctx context.Context, project *gitlab.Project, mr *gitlab.MergeRequest) ([]*gitlab.ResourceStateEvent, error)
```

getMergeRequestResourceStateEvents retrieves the events attached to a merge request in descending time order. 

### <a id="GithubSource" href="#GithubSource">type GithubSource struct</a>

```
searchKey: sources.GithubSource
tags: [struct]
```

```Go
type GithubSource struct {
	client *github.V4Client
	au     auth.Authenticator
}
```

#### <a id="NewGithubSource" href="#NewGithubSource">func NewGithubSource(svc *types.ExternalService, cf *httpcli.Factory) (*GithubSource, error)</a>

```
searchKey: sources.NewGithubSource
tags: [function]
```

```Go
func NewGithubSource(svc *types.ExternalService, cf *httpcli.Factory) (*GithubSource, error)
```

#### <a id="newGithubSource" href="#newGithubSource">func newGithubSource(c *schema.GitHubConnection, cf *httpcli.Factory, au auth.Authenticator) (*GithubSource, error)</a>

```
searchKey: sources.newGithubSource
tags: [function private]
```

```Go
func newGithubSource(c *schema.GitHubConnection, cf *httpcli.Factory, au auth.Authenticator) (*GithubSource, error)
```

#### <a id="GithubSource.CloseChangeset" href="#GithubSource.CloseChangeset">func (s GithubSource) CloseChangeset(ctx context.Context, c *Changeset) error</a>

```
searchKey: sources.GithubSource.CloseChangeset
tags: [method]
```

```Go
func (s GithubSource) CloseChangeset(ctx context.Context, c *Changeset) error
```

CloseChangeset closes the given *Changeset on the code host and updates the Metadata column in the *batches.Changeset to the newly closed pull request. 

#### <a id="GithubSource.CreateChangeset" href="#GithubSource.CreateChangeset">func (s GithubSource) CreateChangeset(ctx context.Context, c *Changeset) (bool, error)</a>

```
searchKey: sources.GithubSource.CreateChangeset
tags: [method]
```

```Go
func (s GithubSource) CreateChangeset(ctx context.Context, c *Changeset) (bool, error)
```

CreateChangeset creates the given changeset on the code host. 

#### <a id="GithubSource.CreateComment" href="#GithubSource.CreateComment">func (s GithubSource) CreateComment(ctx context.Context, c *Changeset, text string) error</a>

```
searchKey: sources.GithubSource.CreateComment
tags: [method]
```

```Go
func (s GithubSource) CreateComment(ctx context.Context, c *Changeset, text string) error
```

CreateComment posts a comment on the Changeset. 

#### <a id="GithubSource.CreateDraftChangeset" href="#GithubSource.CreateDraftChangeset">func (s GithubSource) CreateDraftChangeset(ctx context.Context, c *Changeset) (bool, error)</a>

```
searchKey: sources.GithubSource.CreateDraftChangeset
tags: [method]
```

```Go
func (s GithubSource) CreateDraftChangeset(ctx context.Context, c *Changeset) (bool, error)
```

CreateDraftChangeset creates the given changeset on the code host in draft mode. 

#### <a id="GithubSource.GitserverPushConfig" href="#GithubSource.GitserverPushConfig">func (s GithubSource) GitserverPushConfig(ctx context.Context, store *database.ExternalServiceStore, repo *types.Repo) (*protocol.PushConfig, error)</a>

```
searchKey: sources.GithubSource.GitserverPushConfig
tags: [method]
```

```Go
func (s GithubSource) GitserverPushConfig(ctx context.Context, store *database.ExternalServiceStore, repo *types.Repo) (*protocol.PushConfig, error)
```

#### <a id="GithubSource.LoadChangeset" href="#GithubSource.LoadChangeset">func (s GithubSource) LoadChangeset(ctx context.Context, cs *Changeset) error</a>

```
searchKey: sources.GithubSource.LoadChangeset
tags: [method]
```

```Go
func (s GithubSource) LoadChangeset(ctx context.Context, cs *Changeset) error
```

LoadChangeset loads the latest state of the given Changeset from the codehost. 

#### <a id="GithubSource.MergeChangeset" href="#GithubSource.MergeChangeset">func (s GithubSource) MergeChangeset(ctx context.Context, c *Changeset, squash bool) error</a>

```
searchKey: sources.GithubSource.MergeChangeset
tags: [method]
```

```Go
func (s GithubSource) MergeChangeset(ctx context.Context, c *Changeset, squash bool) error
```

MergeChangeset merges a Changeset on the code host, if in a mergeable state. If squash is true, a squash-then-merge merge will be performed. 

#### <a id="GithubSource.ReopenChangeset" href="#GithubSource.ReopenChangeset">func (s GithubSource) ReopenChangeset(ctx context.Context, c *Changeset) error</a>

```
searchKey: sources.GithubSource.ReopenChangeset
tags: [method]
```

```Go
func (s GithubSource) ReopenChangeset(ctx context.Context, c *Changeset) error
```

ReopenChangeset reopens the given *Changeset on the code host. 

#### <a id="GithubSource.UndraftChangeset" href="#GithubSource.UndraftChangeset">func (s GithubSource) UndraftChangeset(ctx context.Context, c *Changeset) error</a>

```
searchKey: sources.GithubSource.UndraftChangeset
tags: [method]
```

```Go
func (s GithubSource) UndraftChangeset(ctx context.Context, c *Changeset) error
```

UndraftChangeset will update the Changeset on the source to be not in draft mode anymore. 

#### <a id="GithubSource.UpdateChangeset" href="#GithubSource.UpdateChangeset">func (s GithubSource) UpdateChangeset(ctx context.Context, c *Changeset) error</a>

```
searchKey: sources.GithubSource.UpdateChangeset
tags: [method]
```

```Go
func (s GithubSource) UpdateChangeset(ctx context.Context, c *Changeset) error
```

UpdateChangeset updates the given *Changeset in the code host. 

#### <a id="GithubSource.ValidateAuthenticator" href="#GithubSource.ValidateAuthenticator">func (s GithubSource) ValidateAuthenticator(ctx context.Context) error</a>

```
searchKey: sources.GithubSource.ValidateAuthenticator
tags: [method]
```

```Go
func (s GithubSource) ValidateAuthenticator(ctx context.Context) error
```

#### <a id="GithubSource.WithAuthenticator" href="#GithubSource.WithAuthenticator">func (s GithubSource) WithAuthenticator(a auth.Authenticator) (ChangesetSource, error)</a>

```
searchKey: sources.GithubSource.WithAuthenticator
tags: [method]
```

```Go
func (s GithubSource) WithAuthenticator(a auth.Authenticator) (ChangesetSource, error)
```

#### <a id="GithubSource.createChangeset" href="#GithubSource.createChangeset">func (s GithubSource) createChangeset(ctx context.Context, c *Changeset, prInput *github.CreatePullRequestInput) (bool, error)</a>

```
searchKey: sources.GithubSource.createChangeset
tags: [method private]
```

```Go
func (s GithubSource) createChangeset(ctx context.Context, c *Changeset, prInput *github.CreatePullRequestInput) (bool, error)
```

### <a id="Sourcer" href="#Sourcer">type Sourcer interface</a>

```
searchKey: sources.Sourcer
tags: [interface]
```

```Go
type Sourcer interface {
	ForChangeset(ctx context.Context, tx SourcerStore, ch *btypes.Changeset) (ChangesetSource, error)
	ForRepo(ctx context.Context, tx SourcerStore, repo *types.Repo) (ChangesetSource, error)
	ForExternalService(ctx context.Context, tx SourcerStore, opts store.GetExternalServiceIDsOpts) (ChangesetSource, error)
}
```

Sourcer exposes methods to get a ChangesetSource based on a changeset, repo or external service. 

#### <a id="NewFakeSourcer" href="#NewFakeSourcer">func NewFakeSourcer(err error, source ChangesetSource) Sourcer</a>

```
searchKey: sources.NewFakeSourcer
tags: [function]
```

```Go
func NewFakeSourcer(err error, source ChangesetSource) Sourcer
```

NewFakeSourcer returns a new faked Sourcer to be used for testing Batch Changes. 

#### <a id="NewSourcer" href="#NewSourcer">func NewSourcer(cf *httpcli.Factory) Sourcer</a>

```
searchKey: sources.NewSourcer
tags: [function]
```

```Go
func NewSourcer(cf *httpcli.Factory) Sourcer
```

NewSourcer returns a new Sourcer to be used in Batch Changes. 

### <a id="SourcerStore" href="#SourcerStore">type SourcerStore interface</a>

```
searchKey: sources.SourcerStore
tags: [interface]
```

```Go
type SourcerStore interface {
	DB() dbutil.DB
	GetSiteCredential(ctx context.Context, opts store.GetSiteCredentialOpts) (*btypes.SiteCredential, error)
	GetExternalServiceIDs(ctx context.Context, opts store.GetExternalServiceIDsOpts) ([]int64, error)
	Repos() *database.RepoStore
	ExternalServices() *database.ExternalServiceStore
	UserCredentials() *database.UserCredentialsStore
}
```

### <a id="UnsupportedAuthenticatorError" href="#UnsupportedAuthenticatorError">type UnsupportedAuthenticatorError struct</a>

```
searchKey: sources.UnsupportedAuthenticatorError
tags: [struct]
```

```Go
type UnsupportedAuthenticatorError struct {
	have   string
	source string
}
```

UnsupportedAuthenticatorError is returned by WithAuthenticator if the authenticator isn't supported on that code host. 

#### <a id="newUnsupportedAuthenticatorError" href="#newUnsupportedAuthenticatorError">func newUnsupportedAuthenticatorError(source string, a auth.Authenticator) UnsupportedAuthenticatorError</a>

```
searchKey: sources.newUnsupportedAuthenticatorError
tags: [function private]
```

```Go
func newUnsupportedAuthenticatorError(source string, a auth.Authenticator) UnsupportedAuthenticatorError
```

#### <a id="UnsupportedAuthenticatorError.Error" href="#UnsupportedAuthenticatorError.Error">func (e UnsupportedAuthenticatorError) Error() string</a>

```
searchKey: sources.UnsupportedAuthenticatorError.Error
tags: [method]
```

```Go
func (e UnsupportedAuthenticatorError) Error() string
```

### <a id="fakeSourcer" href="#fakeSourcer">type fakeSourcer struct</a>

```
searchKey: sources.fakeSourcer
tags: [struct private]
```

```Go
type fakeSourcer struct {
	err    error
	source ChangesetSource
}
```

#### <a id="fakeSourcer.ForChangeset" href="#fakeSourcer.ForChangeset">func (s *fakeSourcer) ForChangeset(ctx context.Context, tx SourcerStore, ch *btypes.Changeset) (ChangesetSource, error)</a>

```
searchKey: sources.fakeSourcer.ForChangeset
tags: [method private]
```

```Go
func (s *fakeSourcer) ForChangeset(ctx context.Context, tx SourcerStore, ch *btypes.Changeset) (ChangesetSource, error)
```

#### <a id="fakeSourcer.ForExternalService" href="#fakeSourcer.ForExternalService">func (s *fakeSourcer) ForExternalService(ctx context.Context, tx SourcerStore, opts store.GetExternalServiceIDsOpts) (ChangesetSource, error)</a>

```
searchKey: sources.fakeSourcer.ForExternalService
tags: [method private]
```

```Go
func (s *fakeSourcer) ForExternalService(ctx context.Context, tx SourcerStore, opts store.GetExternalServiceIDsOpts) (ChangesetSource, error)
```

#### <a id="fakeSourcer.ForRepo" href="#fakeSourcer.ForRepo">func (s *fakeSourcer) ForRepo(ctx context.Context, tx SourcerStore, repo *types.Repo) (ChangesetSource, error)</a>

```
searchKey: sources.fakeSourcer.ForRepo
tags: [method private]
```

```Go
func (s *fakeSourcer) ForRepo(ctx context.Context, tx SourcerStore, repo *types.Repo) (ChangesetSource, error)
```

### <a id="gitLabChangesetSourceTestProvider" href="#gitLabChangesetSourceTestProvider">type gitLabChangesetSourceTestProvider struct</a>

```
searchKey: sources.gitLabChangesetSourceTestProvider
tags: [struct private]
```

```Go
type gitLabChangesetSourceTestProvider struct {
	changeset *Changeset
	ctx       context.Context
	mr        *gitlab.MergeRequest
	source    *GitLabSource
	t         *testing.T
}
```

#### <a id="newGitLabChangesetSourceTestProvider" href="#newGitLabChangesetSourceTestProvider">func newGitLabChangesetSourceTestProvider(t *testing.T) *gitLabChangesetSourceTestProvider</a>

```
searchKey: sources.newGitLabChangesetSourceTestProvider
tags: [function private]
```

```Go
func newGitLabChangesetSourceTestProvider(t *testing.T) *gitLabChangesetSourceTestProvider
```

newGitLabChangesetSourceTestProvider provides a set of useful pre-canned objects, along with a handful of methods to mock underlying internal/extsvc/gitlab functions. 

#### <a id="gitLabChangesetSourceTestProvider.mockCreateComment" href="#gitLabChangesetSourceTestProvider.mockCreateComment">func (p *gitLabChangesetSourceTestProvider) mockCreateComment(expected string, mr *gitlab.MergeRequest, err error)</a>

```
searchKey: sources.gitLabChangesetSourceTestProvider.mockCreateComment
tags: [method private]
```

```Go
func (p *gitLabChangesetSourceTestProvider) mockCreateComment(expected string, mr *gitlab.MergeRequest, err error)
```

#### <a id="gitLabChangesetSourceTestProvider.mockCreateMergeRequest" href="#gitLabChangesetSourceTestProvider.mockCreateMergeRequest">func (p *gitLabChangesetSourceTestProvider) mockCreateMergeRequest(expected gitlab.CreateMergeRequestOpts, mr *gitlab.MergeRequest, err error)</a>

```
searchKey: sources.gitLabChangesetSourceTestProvider.mockCreateMergeRequest
tags: [method private]
```

```Go
func (p *gitLabChangesetSourceTestProvider) mockCreateMergeRequest(expected gitlab.CreateMergeRequestOpts, mr *gitlab.MergeRequest, err error)
```

mockCreateMergeRequest mocks a gitlab.CreateMergeRequest call. Note that only the SourceBranch and TargetBranch fields of the expected options are checked. 

#### <a id="gitLabChangesetSourceTestProvider.mockGetMergeRequest" href="#gitLabChangesetSourceTestProvider.mockGetMergeRequest">func (p *gitLabChangesetSourceTestProvider) mockGetMergeRequest(expected gitlab.ID, mr *gitlab.MergeRequest, err error)</a>

```
searchKey: sources.gitLabChangesetSourceTestProvider.mockGetMergeRequest
tags: [method private]
```

```Go
func (p *gitLabChangesetSourceTestProvider) mockGetMergeRequest(expected gitlab.ID, mr *gitlab.MergeRequest, err error)
```

#### <a id="gitLabChangesetSourceTestProvider.mockGetMergeRequestNotes" href="#gitLabChangesetSourceTestProvider.mockGetMergeRequestNotes">func (p *gitLabChangesetSourceTestProvider) mockGetMergeRequestNotes(expectedIID gitlab.ID, notes []*gitlab.Note, pageSize int, err error)</a>

```
searchKey: sources.gitLabChangesetSourceTestProvider.mockGetMergeRequestNotes
tags: [method private]
```

```Go
func (p *gitLabChangesetSourceTestProvider) mockGetMergeRequestNotes(expectedIID gitlab.ID, notes []*gitlab.Note, pageSize int, err error)
```

#### <a id="gitLabChangesetSourceTestProvider.mockGetMergeRequestPipelines" href="#gitLabChangesetSourceTestProvider.mockGetMergeRequestPipelines">func (p *gitLabChangesetSourceTestProvider) mockGetMergeRequestPipelines(expectedIID gitlab.ID, pipelines []*gitlab.Pipeline, pageSize int, err error)</a>

```
searchKey: sources.gitLabChangesetSourceTestProvider.mockGetMergeRequestPipelines
tags: [method private]
```

```Go
func (p *gitLabChangesetSourceTestProvider) mockGetMergeRequestPipelines(expectedIID gitlab.ID, pipelines []*gitlab.Pipeline, pageSize int, err error)
```

#### <a id="gitLabChangesetSourceTestProvider.mockGetMergeRequestResourceStateEvents" href="#gitLabChangesetSourceTestProvider.mockGetMergeRequestResourceStateEvents">func (p *gitLabChangesetSourceTestProvider) mockGetMergeRequestResourceStateEvents(expectedIID gitlab.ID, events []*gitlab.ResourceStateEvent, pageSize int, err error)</a>

```
searchKey: sources.gitLabChangesetSourceTestProvider.mockGetMergeRequestResourceStateEvents
tags: [method private]
```

```Go
func (p *gitLabChangesetSourceTestProvider) mockGetMergeRequestResourceStateEvents(expectedIID gitlab.ID, events []*gitlab.ResourceStateEvent, pageSize int, err error)
```

#### <a id="gitLabChangesetSourceTestProvider.mockGetOpenMergeRequestByRefs" href="#gitLabChangesetSourceTestProvider.mockGetOpenMergeRequestByRefs">func (p *gitLabChangesetSourceTestProvider) mockGetOpenMergeRequestByRefs(mr *gitlab.MergeRequest, err error)</a>

```
searchKey: sources.gitLabChangesetSourceTestProvider.mockGetOpenMergeRequestByRefs
tags: [method private]
```

```Go
func (p *gitLabChangesetSourceTestProvider) mockGetOpenMergeRequestByRefs(mr *gitlab.MergeRequest, err error)
```

#### <a id="gitLabChangesetSourceTestProvider.mockUpdateMergeRequest" href="#gitLabChangesetSourceTestProvider.mockUpdateMergeRequest">func (p *gitLabChangesetSourceTestProvider) mockUpdateMergeRequest(expectedMR, updated *gitlab.MergeRequest, expectedStateEvent gitlab.UpdateMergeRequestStateEvent, err error)</a>

```
searchKey: sources.gitLabChangesetSourceTestProvider.mockUpdateMergeRequest
tags: [method private]
```

```Go
func (p *gitLabChangesetSourceTestProvider) mockUpdateMergeRequest(expectedMR, updated *gitlab.MergeRequest, expectedStateEvent gitlab.UpdateMergeRequestStateEvent, err error)
```

#### <a id="gitLabChangesetSourceTestProvider.testCommonParams" href="#gitLabChangesetSourceTestProvider.testCommonParams">func (p *gitLabChangesetSourceTestProvider) testCommonParams(ctx context.Context, client *gitlab.Client, project *gitlab.Project)</a>

```
searchKey: sources.gitLabChangesetSourceTestProvider.testCommonParams
tags: [method private]
```

```Go
func (p *gitLabChangesetSourceTestProvider) testCommonParams(ctx context.Context, client *gitlab.Client, project *gitlab.Project)
```

#### <a id="gitLabChangesetSourceTestProvider.unmock" href="#gitLabChangesetSourceTestProvider.unmock">func (p *gitLabChangesetSourceTestProvider) unmock()</a>

```
searchKey: sources.gitLabChangesetSourceTestProvider.unmock
tags: [method private]
```

```Go
func (p *gitLabChangesetSourceTestProvider) unmock()
```

### <a id="panicDoer" href="#panicDoer">type panicDoer struct{}</a>

```
searchKey: sources.panicDoer
tags: [struct private]
```

```Go
type panicDoer struct{}
```

panicDoer provides a httpcli.Doer implementation that panics if any attempt is made to issue a HTTP request; thereby ensuring that our unit tests don't actually try to talk to GitLab. 

#### <a id="panicDoer.Do" href="#panicDoer.Do">func (d *panicDoer) Do(r *http.Request) (*http.Response, error)</a>

```
searchKey: sources.panicDoer.Do
tags: [method private]
```

```Go
func (d *panicDoer) Do(r *http.Request) (*http.Response, error)
```

### <a id="sourcer" href="#sourcer">type sourcer struct</a>

```
searchKey: sources.sourcer
tags: [struct private]
```

```Go
type sourcer struct {
	cf *httpcli.Factory
}
```

#### <a id="sourcer.ForChangeset" href="#sourcer.ForChangeset">func (s *sourcer) ForChangeset(ctx context.Context, tx SourcerStore, ch *btypes.Changeset) (ChangesetSource, error)</a>

```
searchKey: sources.sourcer.ForChangeset
tags: [method private]
```

```Go
func (s *sourcer) ForChangeset(ctx context.Context, tx SourcerStore, ch *btypes.Changeset) (ChangesetSource, error)
```

ForChangeset returns a ChangesetSource for the given changeset. The changeset.RepoID is used to find the matching code host. 

#### <a id="sourcer.ForExternalService" href="#sourcer.ForExternalService">func (s *sourcer) ForExternalService(ctx context.Context, tx SourcerStore, opts store.GetExternalServiceIDsOpts) (ChangesetSource, error)</a>

```
searchKey: sources.sourcer.ForExternalService
tags: [method private]
```

```Go
func (s *sourcer) ForExternalService(ctx context.Context, tx SourcerStore, opts store.GetExternalServiceIDsOpts) (ChangesetSource, error)
```

ForExternalService returns a ChangesetSource based on the provided external service opts. 

#### <a id="sourcer.ForRepo" href="#sourcer.ForRepo">func (s *sourcer) ForRepo(ctx context.Context, tx SourcerStore, repo *types.Repo) (ChangesetSource, error)</a>

```
searchKey: sources.sourcer.ForRepo
tags: [method private]
```

```Go
func (s *sourcer) ForRepo(ctx context.Context, tx SourcerStore, repo *types.Repo) (ChangesetSource, error)
```

ForRepo returns a ChangesetSource for the given repo. 

#### <a id="sourcer.loadBatchesSource" href="#sourcer.loadBatchesSource">func (s *sourcer) loadBatchesSource(ctx context.Context, tx SourcerStore, externalServiceIDs []int64) (ChangesetSource, error)</a>

```
searchKey: sources.sourcer.loadBatchesSource
tags: [method private]
```

```Go
func (s *sourcer) loadBatchesSource(ctx context.Context, tx SourcerStore, externalServiceIDs []int64) (ChangesetSource, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestBitbucketServerSource_CloseChangeset" href="#TestBitbucketServerSource_CloseChangeset">func TestBitbucketServerSource_CloseChangeset(t *testing.T)</a>

```
searchKey: sources.TestBitbucketServerSource_CloseChangeset
tags: [function private test]
```

```Go
func TestBitbucketServerSource_CloseChangeset(t *testing.T)
```

### <a id="TestBitbucketServerSource_CreateChangeset" href="#TestBitbucketServerSource_CreateChangeset">func TestBitbucketServerSource_CreateChangeset(t *testing.T)</a>

```
searchKey: sources.TestBitbucketServerSource_CreateChangeset
tags: [function private test]
```

```Go
func TestBitbucketServerSource_CreateChangeset(t *testing.T)
```

### <a id="TestBitbucketServerSource_CreateComment" href="#TestBitbucketServerSource_CreateComment">func TestBitbucketServerSource_CreateComment(t *testing.T)</a>

```
searchKey: sources.TestBitbucketServerSource_CreateComment
tags: [function private test]
```

```Go
func TestBitbucketServerSource_CreateComment(t *testing.T)
```

### <a id="TestBitbucketServerSource_LoadChangeset" href="#TestBitbucketServerSource_LoadChangeset">func TestBitbucketServerSource_LoadChangeset(t *testing.T)</a>

```
searchKey: sources.TestBitbucketServerSource_LoadChangeset
tags: [function private test]
```

```Go
func TestBitbucketServerSource_LoadChangeset(t *testing.T)
```

### <a id="TestBitbucketServerSource_ReopenChangeset" href="#TestBitbucketServerSource_ReopenChangeset">func TestBitbucketServerSource_ReopenChangeset(t *testing.T)</a>

```
searchKey: sources.TestBitbucketServerSource_ReopenChangeset
tags: [function private test]
```

```Go
func TestBitbucketServerSource_ReopenChangeset(t *testing.T)
```

### <a id="TestBitbucketServerSource_UpdateChangeset" href="#TestBitbucketServerSource_UpdateChangeset">func TestBitbucketServerSource_UpdateChangeset(t *testing.T)</a>

```
searchKey: sources.TestBitbucketServerSource_UpdateChangeset
tags: [function private test]
```

```Go
func TestBitbucketServerSource_UpdateChangeset(t *testing.T)
```

### <a id="TestBitbucketServerSource_WithAuthenticator" href="#TestBitbucketServerSource_WithAuthenticator">func TestBitbucketServerSource_WithAuthenticator(t *testing.T)</a>

```
searchKey: sources.TestBitbucketServerSource_WithAuthenticator
tags: [function private test]
```

```Go
func TestBitbucketServerSource_WithAuthenticator(t *testing.T)
```

### <a id="TestExtractCloneURL" href="#TestExtractCloneURL">func TestExtractCloneURL(t *testing.T)</a>

```
searchKey: sources.TestExtractCloneURL
tags: [function private test]
```

```Go
func TestExtractCloneURL(t *testing.T)
```

### <a id="TestGitLabSource_ChangesetSource" href="#TestGitLabSource_ChangesetSource">func TestGitLabSource_ChangesetSource(t *testing.T)</a>

```
searchKey: sources.TestGitLabSource_ChangesetSource
tags: [function private test]
```

```Go
func TestGitLabSource_ChangesetSource(t *testing.T)
```

TestGitLabSource_ChangesetSource tests the various Changeset functions that implement the ChangesetSource interface. 

### <a id="TestGitLabSource_WithAuthenticator" href="#TestGitLabSource_WithAuthenticator">func TestGitLabSource_WithAuthenticator(t *testing.T)</a>

```
searchKey: sources.TestGitLabSource_WithAuthenticator
tags: [function private test]
```

```Go
func TestGitLabSource_WithAuthenticator(t *testing.T)
```

### <a id="TestGithubSource_CloseChangeset" href="#TestGithubSource_CloseChangeset">func TestGithubSource_CloseChangeset(t *testing.T)</a>

```
searchKey: sources.TestGithubSource_CloseChangeset
tags: [function private test]
```

```Go
func TestGithubSource_CloseChangeset(t *testing.T)
```

### <a id="TestGithubSource_CreateChangeset" href="#TestGithubSource_CreateChangeset">func TestGithubSource_CreateChangeset(t *testing.T)</a>

```
searchKey: sources.TestGithubSource_CreateChangeset
tags: [function private test]
```

```Go
func TestGithubSource_CreateChangeset(t *testing.T)
```

### <a id="TestGithubSource_CreateComment" href="#TestGithubSource_CreateComment">func TestGithubSource_CreateComment(t *testing.T)</a>

```
searchKey: sources.TestGithubSource_CreateComment
tags: [function private test]
```

```Go
func TestGithubSource_CreateComment(t *testing.T)
```

### <a id="TestGithubSource_LoadChangeset" href="#TestGithubSource_LoadChangeset">func TestGithubSource_LoadChangeset(t *testing.T)</a>

```
searchKey: sources.TestGithubSource_LoadChangeset
tags: [function private test]
```

```Go
func TestGithubSource_LoadChangeset(t *testing.T)
```

### <a id="TestGithubSource_ReopenChangeset" href="#TestGithubSource_ReopenChangeset">func TestGithubSource_ReopenChangeset(t *testing.T)</a>

```
searchKey: sources.TestGithubSource_ReopenChangeset
tags: [function private test]
```

```Go
func TestGithubSource_ReopenChangeset(t *testing.T)
```

### <a id="TestGithubSource_UpdateChangeset" href="#TestGithubSource_UpdateChangeset">func TestGithubSource_UpdateChangeset(t *testing.T)</a>

```
searchKey: sources.TestGithubSource_UpdateChangeset
tags: [function private test]
```

```Go
func TestGithubSource_UpdateChangeset(t *testing.T)
```

### <a id="TestGithubSource_WithAuthenticator" href="#TestGithubSource_WithAuthenticator">func TestGithubSource_WithAuthenticator(t *testing.T)</a>

```
searchKey: sources.TestGithubSource_WithAuthenticator
tags: [function private test]
```

```Go
func TestGithubSource_WithAuthenticator(t *testing.T)
```

### <a id="TestGitserverPushConfig" href="#TestGitserverPushConfig">func TestGitserverPushConfig(t *testing.T)</a>

```
searchKey: sources.TestGitserverPushConfig
tags: [function private test]
```

```Go
func TestGitserverPushConfig(t *testing.T)
```

### <a id="TestLoadExternalService" href="#TestLoadExternalService">func TestLoadExternalService(t *testing.T)</a>

```
searchKey: sources.TestLoadExternalService
tags: [function private test]
```

```Go
func TestLoadExternalService(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: sources.TestMain
tags: [function private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestReadNotesUntilSeen" href="#TestReadNotesUntilSeen">func TestReadNotesUntilSeen(t *testing.T)</a>

```
searchKey: sources.TestReadNotesUntilSeen
tags: [function private test]
```

```Go
func TestReadNotesUntilSeen(t *testing.T)
```

### <a id="TestReadPipelinesUntilSeen" href="#TestReadPipelinesUntilSeen">func TestReadPipelinesUntilSeen(t *testing.T)</a>

```
searchKey: sources.TestReadPipelinesUntilSeen
tags: [function private test]
```

```Go
func TestReadPipelinesUntilSeen(t *testing.T)
```

### <a id="buildCreatePullRequestInput" href="#buildCreatePullRequestInput">func buildCreatePullRequestInput(c *Changeset) *github.CreatePullRequestInput</a>

```
searchKey: sources.buildCreatePullRequestInput
tags: [function private]
```

```Go
func buildCreatePullRequestInput(c *Changeset) *github.CreatePullRequestInput
```

### <a id="extractCloneURL" href="#extractCloneURL">func extractCloneURL(ctx context.Context, s *database.ExternalServiceStore, repo *types.Repo) (string, error)</a>

```
searchKey: sources.extractCloneURL
tags: [function private]
```

```Go
func extractCloneURL(ctx context.Context, s *database.ExternalServiceStore, repo *types.Repo) (string, error)
```

extractCloneURL returns a remote URL from the repo, preferring HTTPS over SSH. 

### <a id="gitserverPushConfig" href="#gitserverPushConfig">func gitserverPushConfig(ctx context.Context, store *database.ExternalServiceStore, repo *types.Repo, au auth.Authenticator) (*protocol.PushConfig, error)</a>

```
searchKey: sources.gitserverPushConfig
tags: [function private]
```

```Go
func gitserverPushConfig(ctx context.Context, store *database.ExternalServiceStore, repo *types.Repo, au auth.Authenticator) (*protocol.PushConfig, error)
```

### <a id="gitserverRedirectMiddleware" href="#gitserverRedirectMiddleware">func gitserverRedirectMiddleware(cli httpcli.Doer) httpcli.Doer</a>

```
searchKey: sources.gitserverRedirectMiddleware
tags: [function private]
```

```Go
func gitserverRedirectMiddleware(cli httpcli.Doer) httpcli.Doer
```

### <a id="loadExternalService" href="#loadExternalService">func loadExternalService(ctx context.Context, s *database.ExternalServiceStore, opts database.ExternalServicesListOptions) (*types.ExternalService, error)</a>

```
searchKey: sources.loadExternalService
tags: [function private]
```

```Go
func loadExternalService(ctx context.Context, s *database.ExternalServiceStore, opts database.ExternalServicesListOptions) (*types.ExternalService, error)
```

loadExternalService looks up all external services that are connected to the given repo. The first external service to have a token configured will be returned then. If no external service matching the above criteria is found, an error is returned. 

### <a id="loadSiteCredential" href="#loadSiteCredential">func loadSiteCredential(ctx context.Context, s SourcerStore, repo *types.Repo) (auth.Authenticator, error)</a>

```
searchKey: sources.loadSiteCredential
tags: [function private]
```

```Go
func loadSiteCredential(ctx context.Context, s SourcerStore, repo *types.Repo) (auth.Authenticator, error)
```

loadSiteCredential attempts to find a site credential for the given repo. When no credential is found, nil is returned. 

### <a id="loadUserCredential" href="#loadUserCredential">func loadUserCredential(ctx context.Context, s SourcerStore, userID int32, repo *types.Repo) (auth.Authenticator, error)</a>

```
searchKey: sources.loadUserCredential
tags: [function private]
```

```Go
func loadUserCredential(ctx context.Context, s SourcerStore, userID int32, repo *types.Repo) (auth.Authenticator, error)
```

loadUserCredential attempts to find a user credential for the given repo. When no credential is found, nil is returned. 

### <a id="marshalJSON" href="#marshalJSON">func marshalJSON(t testing.TB, v interface{}) string</a>

```
searchKey: sources.marshalJSON
tags: [function private]
```

```Go
func marshalJSON(t testing.TB, v interface{}) string
```

### <a id="newClientFactory" href="#newClientFactory">func newClientFactory(t testing.TB, name string, mws ...httpcli.Middleware) (*httpcli.Factory, func(testing.TB))</a>

```
searchKey: sources.newClientFactory
tags: [function private]
```

```Go
func newClientFactory(t testing.TB, name string, mws ...httpcli.Middleware) (*httpcli.Factory, func(testing.TB))
```

### <a id="newRecorder" href="#newRecorder">func newRecorder(t testing.TB, file string, record bool) *recorder.Recorder</a>

```
searchKey: sources.newRecorder
tags: [function private]
```

```Go
func newRecorder(t testing.TB, file string, record bool) *recorder.Recorder
```

### <a id="paginatedNoteIterator" href="#paginatedNoteIterator">func paginatedNoteIterator(notes []*gitlab.Note, pageSize int) func() ([]*gitlab.Note, error)</a>

```
searchKey: sources.paginatedNoteIterator
tags: [function private]
```

```Go
func paginatedNoteIterator(notes []*gitlab.Note, pageSize int) func() ([]*gitlab.Note, error)
```

paginatedNoteIterator essentially fakes the pagination behaviour implemented by gitlab.GetMergeRequestNotes with a canned notes list. 

### <a id="paginatedPipelineIterator" href="#paginatedPipelineIterator">func paginatedPipelineIterator(pipelines []*gitlab.Pipeline, pageSize int) func() ([]*gitlab.Pipeline, error)</a>

```
searchKey: sources.paginatedPipelineIterator
tags: [function private]
```

```Go
func paginatedPipelineIterator(pipelines []*gitlab.Pipeline, pageSize int) func() ([]*gitlab.Pipeline, error)
```

paginatedPipelineIterator essentially fakes the pagination behaviour implemented by gitlab.GetMergeRequestPipelines with a canned pipelines list. 

### <a id="paginatedResourceStateEventIterator" href="#paginatedResourceStateEventIterator">func paginatedResourceStateEventIterator(events []*gitlab.ResourceStateEvent, pageSize int) func() ([]*gitlab.ResourceStateEvent, error)</a>

```
searchKey: sources.paginatedResourceStateEventIterator
tags: [function private]
```

```Go
func paginatedResourceStateEventIterator(events []*gitlab.ResourceStateEvent, pageSize int) func() ([]*gitlab.ResourceStateEvent, error)
```

paginatedResourceStateEventIterator essentially fakes the pagination behaviour implemented by gitlab.GetMergeRequestResourceStateEvents with a canned resource state events list. 

### <a id="readMergeRequestResourceStateEvents" href="#readMergeRequestResourceStateEvents">func readMergeRequestResourceStateEvents(it func() ([]*gitlab.ResourceStateEvent, error)) ([]*gitlab.ResourceStateEvent, error)</a>

```
searchKey: sources.readMergeRequestResourceStateEvents
tags: [function private]
```

```Go
func readMergeRequestResourceStateEvents(it func() ([]*gitlab.ResourceStateEvent, error)) ([]*gitlab.ResourceStateEvent, error)
```

### <a id="readPipelines" href="#readPipelines">func readPipelines(it func() ([]*gitlab.Pipeline, error)) ([]*gitlab.Pipeline, error)</a>

```
searchKey: sources.readPipelines
tags: [function private]
```

```Go
func readPipelines(it func() ([]*gitlab.Pipeline, error)) ([]*gitlab.Pipeline, error)
```

### <a id="readSystemNotes" href="#readSystemNotes">func readSystemNotes(it func() ([]*gitlab.Note, error)) ([]*gitlab.Note, error)</a>

```
searchKey: sources.readSystemNotes
tags: [function private]
```

```Go
func readSystemNotes(it func() ([]*gitlab.Note, error)) ([]*gitlab.Note, error)
```

### <a id="save" href="#save">func save(t testing.TB, rec *recorder.Recorder)</a>

```
searchKey: sources.save
tags: [function private]
```

```Go
func save(t testing.TB, rec *recorder.Recorder)
```

### <a id="setBasicAuth" href="#setBasicAuth">func setBasicAuth(u *vcs.URL, extSvcType, username, password string) error</a>

```
searchKey: sources.setBasicAuth
tags: [function private]
```

```Go
func setBasicAuth(u *vcs.URL, extSvcType, username, password string) error
```

setBasicAuth sets the user part of the given URL to use the provided username/ password combination, with the specific quirks per code host. 

### <a id="setOAuthTokenAuth" href="#setOAuthTokenAuth">func setOAuthTokenAuth(u *vcs.URL, extSvcType, token string) error</a>

```
searchKey: sources.setOAuthTokenAuth
tags: [function private]
```

```Go
func setOAuthTokenAuth(u *vcs.URL, extSvcType, token string) error
```

setOAuthTokenAuth sets the user part of the given URL to use the provided OAuth token, with the specific quirks per code host. 

### <a id="update" href="#update">func update(name string) bool</a>

```
searchKey: sources.update
tags: [function private]
```

```Go
func update(name string) bool
```

