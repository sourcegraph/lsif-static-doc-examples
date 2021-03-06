# Package webhooks

## Index

* [Variables](#var)
    * [var errExternalServiceNotFound](#errExternalServiceNotFound)
    * [var errExternalServiceWrongKind](#errExternalServiceWrongKind)
    * [var errPipelineMissingMergeRequest](#errPipelineMissingMergeRequest)
    * [var githubEvents](#githubEvents)
    * [var update](#update)
* [Types](#type)
    * [type BitbucketServerWebhook struct](#BitbucketServerWebhook)
        * [func NewBitbucketServerWebhook(store *store.Store) *BitbucketServerWebhook](#NewBitbucketServerWebhook)
        * [func (h *BitbucketServerWebhook) ServeHTTP(w http.ResponseWriter, r *http.Request)](#BitbucketServerWebhook.ServeHTTP)
        * [func (h *BitbucketServerWebhook) convertEvent(theirs interface{}) (prs []PR, ours keyer)](#BitbucketServerWebhook.convertEvent)
        * [func (h *BitbucketServerWebhook) parseEvent(r *http.Request) (interface{}, *types.ExternalService, *httpError)](#BitbucketServerWebhook.parseEvent)
    * [type GitHubWebhook struct](#GitHubWebhook)
        * [func NewGitHubWebhook(store *store.Store) *GitHubWebhook](#NewGitHubWebhook)
        * [func (h *GitHubWebhook) Register(router *webhooks.GitHubWebhook)](#GitHubWebhook.Register)
        * [func (*GitHubWebhook) assignedEvent(e *gh.PullRequestEvent) *github.AssignedEvent](#GitHubWebhook.assignedEvent)
        * [func (h *GitHubWebhook) checkRunEvent(cr *gh.CheckRun) *github.CheckRun](#GitHubWebhook.checkRunEvent)
        * [func (h *GitHubWebhook) checkSuiteEvent(cs *gh.CheckSuite) *github.CheckSuite](#GitHubWebhook.checkSuiteEvent)
        * [func (*GitHubWebhook) closedOrMergeEvent(e *gh.PullRequestEvent) keyer](#GitHubWebhook.closedOrMergeEvent)
        * [func (h *GitHubWebhook) commitStatusEvent(e *gh.StatusEvent) *github.CommitStatus](#GitHubWebhook.commitStatusEvent)
        * [func (h *GitHubWebhook) convertEvent(ctx context.Context, externalServiceID string, theirs interface{}) (prs []PR, ours keyer)](#GitHubWebhook.convertEvent)
        * [func (*GitHubWebhook) convertToDraftEvent(e *gh.PullRequestEvent) *github.ConvertToDraftEvent](#GitHubWebhook.convertToDraftEvent)
        * [func (h *GitHubWebhook) handleGitHubWebhook(ctx context.Context, extSvc *types.ExternalService, payload interface{}) error](#GitHubWebhook.handleGitHubWebhook)
        * [func (*GitHubWebhook) issueComment(e *gh.IssueCommentEvent) *github.IssueComment](#GitHubWebhook.issueComment)
        * [func (*GitHubWebhook) labeledEvent(e *gh.PullRequestEvent) *github.LabelEvent](#GitHubWebhook.labeledEvent)
        * [func (*GitHubWebhook) pullRequestReviewCommentEvent(e *gh.PullRequestReviewCommentEvent) *github.PullRequestReviewComment](#GitHubWebhook.pullRequestReviewCommentEvent)
        * [func (*GitHubWebhook) pullRequestReviewEvent(e *gh.PullRequestReviewEvent) *github.PullRequestReview](#GitHubWebhook.pullRequestReviewEvent)
        * [func (*GitHubWebhook) readyForReviewEvent(e *gh.PullRequestEvent) *github.ReadyForReviewEvent](#GitHubWebhook.readyForReviewEvent)
        * [func (*GitHubWebhook) renamedTitleEvent(e *gh.PullRequestEvent) *github.RenamedTitleEvent](#GitHubWebhook.renamedTitleEvent)
        * [func (*GitHubWebhook) reopenedEvent(e *gh.PullRequestEvent) *github.ReopenedEvent](#GitHubWebhook.reopenedEvent)
        * [func (*GitHubWebhook) reviewRequestRemovedEvent(e *gh.PullRequestEvent) *github.ReviewRequestRemovedEvent](#GitHubWebhook.reviewRequestRemovedEvent)
        * [func (*GitHubWebhook) reviewRequestedEvent(e *gh.PullRequestEvent) *github.ReviewRequestedEvent](#GitHubWebhook.reviewRequestedEvent)
        * [func (*GitHubWebhook) unassignedEvent(e *gh.PullRequestEvent) *github.UnassignedEvent](#GitHubWebhook.unassignedEvent)
    * [type GitLabWebhook struct](#GitLabWebhook)
        * [func NewGitLabWebhook(store *store.Store) *GitLabWebhook](#NewGitLabWebhook)
        * [func (h *GitLabWebhook) ServeHTTP(w http.ResponseWriter, r *http.Request)](#GitLabWebhook.ServeHTTP)
        * [func (h *GitLabWebhook) enqueueChangesetSyncFromEvent(ctx context.Context, esID string, event *webhooks.MergeRequestEventCommon) error](#GitLabWebhook.enqueueChangesetSyncFromEvent)
        * [func (h *GitLabWebhook) getChangesetForPR(ctx context.Context, tx *store.Store, pr *PR, repo *types.Repo) (*btypes.Changeset, error)](#GitLabWebhook.getChangesetForPR)
        * [func (h *GitLabWebhook) getExternalServiceFromRawID(ctx context.Context, raw string) (*types.ExternalService, error)](#GitLabWebhook.getExternalServiceFromRawID)
        * [func (h *GitLabWebhook) handleEvent(ctx context.Context, extSvc *types.ExternalService, event interface{}) *httpError](#GitLabWebhook.handleEvent)
        * [func (h *GitLabWebhook) handlePipelineEvent(ctx context.Context, esID string, event *webhooks.PipelineEvent) error](#GitLabWebhook.handlePipelineEvent)
    * [type PR struct](#PR)
        * [func gitlabToPR(project *gitlab.ProjectCommon, mr *gitlab.MergeRequest) PR](#gitlabToPR)
    * [type Webhook struct](#Webhook)
        * [func (h Webhook) getRepoForPR(ctx context.Context,...](#Webhook.getRepoForPR)
        * [func (h Webhook) upsertChangesetEvent(ctx context.Context,...](#Webhook.upsertChangesetEvent)
    * [type brokenDB struct](#brokenDB)
        * [func (db *brokenDB) ExecContext(ctx context.Context, q string, args ...interface{}) (sql.Result, error)](#brokenDB.ExecContext)
        * [func (db *brokenDB) QueryContext(ctx context.Context, q string, args ...interface{}) (*sql.Rows, error)](#brokenDB.QueryContext)
        * [func (db *brokenDB) QueryRowContext(ctx context.Context, q string, args ...interface{}) *sql.Row](#brokenDB.QueryRowContext)
    * [type brokenReader struct](#brokenReader)
        * [func (br *brokenReader) Close() error](#brokenReader.Close)
        * [func (br *brokenReader) Read(p []byte) (int, error)](#brokenReader.Read)
    * [type httpError struct](#httpError)
        * [func (e httpError) Error() string](#httpError.Error)
    * [type keyer interface](#keyer)
    * [type nestedTx struct](#nestedTx)
        * [func (ntx *nestedTx) BeginTx(ctx context.Context, opts *sql.TxOptions) error](#nestedTx.BeginTx)
        * [func (ntx *nestedTx) Commit() error](#nestedTx.Commit)
        * [func (ntx *nestedTx) Rollback() error](#nestedTx.Rollback)
    * [type noNestingTx struct](#noNestingTx)
        * [func (nntx *noNestingTx) BeginTx(ctx context.Context, opts *sql.TxOptions) error](#noNestingTx.BeginTx)
    * [type webhookTestCase struct](#webhookTestCase)
        * [func loadWebhookTestCase(t testing.TB, path string) webhookTestCase](#loadWebhookTestCase)
* [Functions](#func)
    * [func TestValidateGitLabSecret(t *testing.T)](#TestValidateGitLabSecret)
    * [func TestWebhooksIntegration(t *testing.T)](#TestWebhooksIntegration)
    * [func assertBodyIncludes(t *testing.T, r io.Reader, want string)](#assertBodyIncludes)
    * [func assertChangesetEventForChangeset(t *testing.T, ctx context.Context, tx *store.Store, changeset *btypes.Changeset, want btypes.ChangesetEventKind)](#assertChangesetEventForChangeset)
    * [func createGitLabChangeset(t *testing.T, ctx context.Context, store *store.Store, repo *types.Repo) *btypes.Changeset](#createGitLabChangeset)
    * [func createGitLabExternalService(t *testing.T, ctx context.Context, esStore *database.ExternalServiceStore) *types.ExternalService](#createGitLabExternalService)
    * [func createGitLabRepo(t *testing.T, ctx context.Context, rstore *database.RepoStore, es *types.ExternalService) *types.Repo](#createGitLabRepo)
    * [func createMergeRequestPayload(t *testing.T, repo *types.Repo, changeset *btypes.Changeset, action string) string](#createMergeRequestPayload)
    * [func createPipelinePayload(t *testing.T, repo *types.Repo, changeset *btypes.Changeset, pipeline gitlab.Pipeline) string](#createPipelinePayload)
    * [func extractExternalServiceID(extSvc *types.ExternalService) (string, error)](#extractExternalServiceID)
    * [func getSingleRepo(ctx context.Context, bitbucketSource *repos.BitbucketServerSource, name string) (*types.Repo, error)](#getSingleRepo)
    * [func gitLabTestSetup(t *testing.T, db *sql.DB) *store.Store](#gitLabTestSetup)
    * [func respond(w http.ResponseWriter, code int, v interface{})](#respond)
    * [func sign(t *testing.T, message, secret []byte) string](#sign)
    * [func testBitbucketWebhook(db *sql.DB, userID int32) func(*testing.T)](#testBitbucketWebhook)
    * [func testGitHubWebhook(db *sql.DB, userID int32) func(*testing.T)](#testGitHubWebhook)
    * [func testGitLabWebhook(db *sql.DB, userID int32) func(*testing.T)](#testGitLabWebhook)
    * [func validateGitLabSecret(extSvc *types.ExternalService, secret string) (bool, error)](#validateGitLabSecret)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="errExternalServiceNotFound" href="#errExternalServiceNotFound">var errExternalServiceNotFound</a>

```
searchKey: webhooks.errExternalServiceNotFound
tags: [variable interface private]
```

```Go
var errExternalServiceNotFound = errors.New("external service not found")
```

### <a id="errExternalServiceWrongKind" href="#errExternalServiceWrongKind">var errExternalServiceWrongKind</a>

```
searchKey: webhooks.errExternalServiceWrongKind
tags: [variable interface private]
```

```Go
var errExternalServiceWrongKind = errors.New("external service is not of the expected kind")
```

### <a id="errPipelineMissingMergeRequest" href="#errPipelineMissingMergeRequest">var errPipelineMissingMergeRequest</a>

```
searchKey: webhooks.errPipelineMissingMergeRequest
tags: [variable interface private]
```

```Go
var errPipelineMissingMergeRequest = errors.New("pipeline event does not include a merge request")
```

### <a id="githubEvents" href="#githubEvents">var githubEvents</a>

```
searchKey: webhooks.githubEvents
tags: [variable array string private]
```

```Go
var githubEvents = ...
```

githubEvents is the set of events this webhook handler listens to you can find info about what these events contain here: [https://docs.github.com/en/free-pro-team](https://docs.github.com/en/free-pro-team)@latest/developers/webhooks-and-events/webhook-events-and-payloads 

### <a id="update" href="#update">var update</a>

```
searchKey: webhooks.update
tags: [variable boolean private]
```

```Go
var update = flag.Bool("update", false, "update testdata")
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="BitbucketServerWebhook" href="#BitbucketServerWebhook">type BitbucketServerWebhook struct</a>

```
searchKey: webhooks.BitbucketServerWebhook
tags: [struct]
```

```Go
type BitbucketServerWebhook struct {
	*Webhook
}
```

#### <a id="NewBitbucketServerWebhook" href="#NewBitbucketServerWebhook">func NewBitbucketServerWebhook(store *store.Store) *BitbucketServerWebhook</a>

```
searchKey: webhooks.NewBitbucketServerWebhook
tags: [function]
```

```Go
func NewBitbucketServerWebhook(store *store.Store) *BitbucketServerWebhook
```

#### <a id="BitbucketServerWebhook.ServeHTTP" href="#BitbucketServerWebhook.ServeHTTP">func (h *BitbucketServerWebhook) ServeHTTP(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: webhooks.BitbucketServerWebhook.ServeHTTP
tags: [method]
```

```Go
func (h *BitbucketServerWebhook) ServeHTTP(w http.ResponseWriter, r *http.Request)
```

#### <a id="BitbucketServerWebhook.convertEvent" href="#BitbucketServerWebhook.convertEvent">func (h *BitbucketServerWebhook) convertEvent(theirs interface{}) (prs []PR, ours keyer)</a>

```
searchKey: webhooks.BitbucketServerWebhook.convertEvent
tags: [method private]
```

```Go
func (h *BitbucketServerWebhook) convertEvent(theirs interface{}) (prs []PR, ours keyer)
```

#### <a id="BitbucketServerWebhook.parseEvent" href="#BitbucketServerWebhook.parseEvent">func (h *BitbucketServerWebhook) parseEvent(r *http.Request) (interface{}, *types.ExternalService, *httpError)</a>

```
searchKey: webhooks.BitbucketServerWebhook.parseEvent
tags: [method private]
```

```Go
func (h *BitbucketServerWebhook) parseEvent(r *http.Request) (interface{}, *types.ExternalService, *httpError)
```

### <a id="GitHubWebhook" href="#GitHubWebhook">type GitHubWebhook struct</a>

```
searchKey: webhooks.GitHubWebhook
tags: [struct]
```

```Go
type GitHubWebhook struct {
	*Webhook
}
```

GitHubWebhook receives GitHub organization webhook events that are relevant to Batch Changes, normalizes those events into ChangesetEvents and upserts them to the database. 

#### <a id="NewGitHubWebhook" href="#NewGitHubWebhook">func NewGitHubWebhook(store *store.Store) *GitHubWebhook</a>

```
searchKey: webhooks.NewGitHubWebhook
tags: [function]
```

```Go
func NewGitHubWebhook(store *store.Store) *GitHubWebhook
```

#### <a id="GitHubWebhook.Register" href="#GitHubWebhook.Register">func (h *GitHubWebhook) Register(router *webhooks.GitHubWebhook)</a>

```
searchKey: webhooks.GitHubWebhook.Register
tags: [method]
```

```Go
func (h *GitHubWebhook) Register(router *webhooks.GitHubWebhook)
```

Register registers this webhook handler to handle events with the passed webhook router 

#### <a id="GitHubWebhook.assignedEvent" href="#GitHubWebhook.assignedEvent">func (*GitHubWebhook) assignedEvent(e *gh.PullRequestEvent) *github.AssignedEvent</a>

```
searchKey: webhooks.GitHubWebhook.assignedEvent
tags: [method private]
```

```Go
func (*GitHubWebhook) assignedEvent(e *gh.PullRequestEvent) *github.AssignedEvent
```

#### <a id="GitHubWebhook.checkRunEvent" href="#GitHubWebhook.checkRunEvent">func (h *GitHubWebhook) checkRunEvent(cr *gh.CheckRun) *github.CheckRun</a>

```
searchKey: webhooks.GitHubWebhook.checkRunEvent
tags: [method private]
```

```Go
func (h *GitHubWebhook) checkRunEvent(cr *gh.CheckRun) *github.CheckRun
```

#### <a id="GitHubWebhook.checkSuiteEvent" href="#GitHubWebhook.checkSuiteEvent">func (h *GitHubWebhook) checkSuiteEvent(cs *gh.CheckSuite) *github.CheckSuite</a>

```
searchKey: webhooks.GitHubWebhook.checkSuiteEvent
tags: [method private]
```

```Go
func (h *GitHubWebhook) checkSuiteEvent(cs *gh.CheckSuite) *github.CheckSuite
```

#### <a id="GitHubWebhook.closedOrMergeEvent" href="#GitHubWebhook.closedOrMergeEvent">func (*GitHubWebhook) closedOrMergeEvent(e *gh.PullRequestEvent) keyer</a>

```
searchKey: webhooks.GitHubWebhook.closedOrMergeEvent
tags: [method private]
```

```Go
func (*GitHubWebhook) closedOrMergeEvent(e *gh.PullRequestEvent) keyer
```

closed events from github have a 'merged flag which identifies them as merge events instead. 

#### <a id="GitHubWebhook.commitStatusEvent" href="#GitHubWebhook.commitStatusEvent">func (h *GitHubWebhook) commitStatusEvent(e *gh.StatusEvent) *github.CommitStatus</a>

```
searchKey: webhooks.GitHubWebhook.commitStatusEvent
tags: [method private]
```

```Go
func (h *GitHubWebhook) commitStatusEvent(e *gh.StatusEvent) *github.CommitStatus
```

#### <a id="GitHubWebhook.convertEvent" href="#GitHubWebhook.convertEvent">func (h *GitHubWebhook) convertEvent(ctx context.Context, externalServiceID string, theirs interface{}) (prs []PR, ours keyer)</a>

```
searchKey: webhooks.GitHubWebhook.convertEvent
tags: [method private]
```

```Go
func (h *GitHubWebhook) convertEvent(ctx context.Context, externalServiceID string, theirs interface{}) (prs []PR, ours keyer)
```

#### <a id="GitHubWebhook.convertToDraftEvent" href="#GitHubWebhook.convertToDraftEvent">func (*GitHubWebhook) convertToDraftEvent(e *gh.PullRequestEvent) *github.ConvertToDraftEvent</a>

```
searchKey: webhooks.GitHubWebhook.convertToDraftEvent
tags: [method private]
```

```Go
func (*GitHubWebhook) convertToDraftEvent(e *gh.PullRequestEvent) *github.ConvertToDraftEvent
```

#### <a id="GitHubWebhook.handleGitHubWebhook" href="#GitHubWebhook.handleGitHubWebhook">func (h *GitHubWebhook) handleGitHubWebhook(ctx context.Context, extSvc *types.ExternalService, payload interface{}) error</a>

```
searchKey: webhooks.GitHubWebhook.handleGitHubWebhook
tags: [method private]
```

```Go
func (h *GitHubWebhook) handleGitHubWebhook(ctx context.Context, extSvc *types.ExternalService, payload interface{}) error
```

handleGithubWebhook is the entry point for webhooks from the webhook router, see the events it's registered to handle in GitHubWebhook.Register 

#### <a id="GitHubWebhook.issueComment" href="#GitHubWebhook.issueComment">func (*GitHubWebhook) issueComment(e *gh.IssueCommentEvent) *github.IssueComment</a>

```
searchKey: webhooks.GitHubWebhook.issueComment
tags: [method private]
```

```Go
func (*GitHubWebhook) issueComment(e *gh.IssueCommentEvent) *github.IssueComment
```

#### <a id="GitHubWebhook.labeledEvent" href="#GitHubWebhook.labeledEvent">func (*GitHubWebhook) labeledEvent(e *gh.PullRequestEvent) *github.LabelEvent</a>

```
searchKey: webhooks.GitHubWebhook.labeledEvent
tags: [method private]
```

```Go
func (*GitHubWebhook) labeledEvent(e *gh.PullRequestEvent) *github.LabelEvent
```

#### <a id="GitHubWebhook.pullRequestReviewCommentEvent" href="#GitHubWebhook.pullRequestReviewCommentEvent">func (*GitHubWebhook) pullRequestReviewCommentEvent(e *gh.PullRequestReviewCommentEvent) *github.PullRequestReviewComment</a>

```
searchKey: webhooks.GitHubWebhook.pullRequestReviewCommentEvent
tags: [method private]
```

```Go
func (*GitHubWebhook) pullRequestReviewCommentEvent(e *gh.PullRequestReviewCommentEvent) *github.PullRequestReviewComment
```

#### <a id="GitHubWebhook.pullRequestReviewEvent" href="#GitHubWebhook.pullRequestReviewEvent">func (*GitHubWebhook) pullRequestReviewEvent(e *gh.PullRequestReviewEvent) *github.PullRequestReview</a>

```
searchKey: webhooks.GitHubWebhook.pullRequestReviewEvent
tags: [method private]
```

```Go
func (*GitHubWebhook) pullRequestReviewEvent(e *gh.PullRequestReviewEvent) *github.PullRequestReview
```

#### <a id="GitHubWebhook.readyForReviewEvent" href="#GitHubWebhook.readyForReviewEvent">func (*GitHubWebhook) readyForReviewEvent(e *gh.PullRequestEvent) *github.ReadyForReviewEvent</a>

```
searchKey: webhooks.GitHubWebhook.readyForReviewEvent
tags: [method private]
```

```Go
func (*GitHubWebhook) readyForReviewEvent(e *gh.PullRequestEvent) *github.ReadyForReviewEvent
```

#### <a id="GitHubWebhook.renamedTitleEvent" href="#GitHubWebhook.renamedTitleEvent">func (*GitHubWebhook) renamedTitleEvent(e *gh.PullRequestEvent) *github.RenamedTitleEvent</a>

```
searchKey: webhooks.GitHubWebhook.renamedTitleEvent
tags: [method private]
```

```Go
func (*GitHubWebhook) renamedTitleEvent(e *gh.PullRequestEvent) *github.RenamedTitleEvent
```

#### <a id="GitHubWebhook.reopenedEvent" href="#GitHubWebhook.reopenedEvent">func (*GitHubWebhook) reopenedEvent(e *gh.PullRequestEvent) *github.ReopenedEvent</a>

```
searchKey: webhooks.GitHubWebhook.reopenedEvent
tags: [method private]
```

```Go
func (*GitHubWebhook) reopenedEvent(e *gh.PullRequestEvent) *github.ReopenedEvent
```

#### <a id="GitHubWebhook.reviewRequestRemovedEvent" href="#GitHubWebhook.reviewRequestRemovedEvent">func (*GitHubWebhook) reviewRequestRemovedEvent(e *gh.PullRequestEvent) *github.ReviewRequestRemovedEvent</a>

```
searchKey: webhooks.GitHubWebhook.reviewRequestRemovedEvent
tags: [method private]
```

```Go
func (*GitHubWebhook) reviewRequestRemovedEvent(e *gh.PullRequestEvent) *github.ReviewRequestRemovedEvent
```

#### <a id="GitHubWebhook.reviewRequestedEvent" href="#GitHubWebhook.reviewRequestedEvent">func (*GitHubWebhook) reviewRequestedEvent(e *gh.PullRequestEvent) *github.ReviewRequestedEvent</a>

```
searchKey: webhooks.GitHubWebhook.reviewRequestedEvent
tags: [method private]
```

```Go
func (*GitHubWebhook) reviewRequestedEvent(e *gh.PullRequestEvent) *github.ReviewRequestedEvent
```

#### <a id="GitHubWebhook.unassignedEvent" href="#GitHubWebhook.unassignedEvent">func (*GitHubWebhook) unassignedEvent(e *gh.PullRequestEvent) *github.UnassignedEvent</a>

```
searchKey: webhooks.GitHubWebhook.unassignedEvent
tags: [method private]
```

```Go
func (*GitHubWebhook) unassignedEvent(e *gh.PullRequestEvent) *github.UnassignedEvent
```

### <a id="GitLabWebhook" href="#GitLabWebhook">type GitLabWebhook struct</a>

```
searchKey: webhooks.GitLabWebhook
tags: [struct]
```

```Go
type GitLabWebhook struct {
	*Webhook
}
```

#### <a id="NewGitLabWebhook" href="#NewGitLabWebhook">func NewGitLabWebhook(store *store.Store) *GitLabWebhook</a>

```
searchKey: webhooks.NewGitLabWebhook
tags: [function]
```

```Go
func NewGitLabWebhook(store *store.Store) *GitLabWebhook
```

#### <a id="GitLabWebhook.ServeHTTP" href="#GitLabWebhook.ServeHTTP">func (h *GitLabWebhook) ServeHTTP(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: webhooks.GitLabWebhook.ServeHTTP
tags: [method]
```

```Go
func (h *GitLabWebhook) ServeHTTP(w http.ResponseWriter, r *http.Request)
```

ServeHTTP implements the http.Handler interface. 

#### <a id="GitLabWebhook.enqueueChangesetSyncFromEvent" href="#GitLabWebhook.enqueueChangesetSyncFromEvent">func (h *GitLabWebhook) enqueueChangesetSyncFromEvent(ctx context.Context, esID string, event *webhooks.MergeRequestEventCommon) error</a>

```
searchKey: webhooks.GitLabWebhook.enqueueChangesetSyncFromEvent
tags: [method private]
```

```Go
func (h *GitLabWebhook) enqueueChangesetSyncFromEvent(ctx context.Context, esID string, event *webhooks.MergeRequestEventCommon) error
```

#### <a id="GitLabWebhook.getChangesetForPR" href="#GitLabWebhook.getChangesetForPR">func (h *GitLabWebhook) getChangesetForPR(ctx context.Context, tx *store.Store, pr *PR, repo *types.Repo) (*btypes.Changeset, error)</a>

```
searchKey: webhooks.GitLabWebhook.getChangesetForPR
tags: [method private]
```

```Go
func (h *GitLabWebhook) getChangesetForPR(ctx context.Context, tx *store.Store, pr *PR, repo *types.Repo) (*btypes.Changeset, error)
```

#### <a id="GitLabWebhook.getExternalServiceFromRawID" href="#GitLabWebhook.getExternalServiceFromRawID">func (h *GitLabWebhook) getExternalServiceFromRawID(ctx context.Context, raw string) (*types.ExternalService, error)</a>

```
searchKey: webhooks.GitLabWebhook.getExternalServiceFromRawID
tags: [method private]
```

```Go
func (h *GitLabWebhook) getExternalServiceFromRawID(ctx context.Context, raw string) (*types.ExternalService, error)
```

getExternalServiceFromRawID retrieves the external service matching the given raw ID, which is usually going to be the string in the externalServiceID URL parameter. 

On failure, errExternalServiceNotFound is returned if the ID doesn't match any GitLab service. 

#### <a id="GitLabWebhook.handleEvent" href="#GitLabWebhook.handleEvent">func (h *GitLabWebhook) handleEvent(ctx context.Context, extSvc *types.ExternalService, event interface{}) *httpError</a>

```
searchKey: webhooks.GitLabWebhook.handleEvent
tags: [method private]
```

```Go
func (h *GitLabWebhook) handleEvent(ctx context.Context, extSvc *types.ExternalService, event interface{}) *httpError
```

handleEvent is essentially a router: it dispatches based on the event type to perform whatever changeset action is appropriate for that event. 

#### <a id="GitLabWebhook.handlePipelineEvent" href="#GitLabWebhook.handlePipelineEvent">func (h *GitLabWebhook) handlePipelineEvent(ctx context.Context, esID string, event *webhooks.PipelineEvent) error</a>

```
searchKey: webhooks.GitLabWebhook.handlePipelineEvent
tags: [method private]
```

```Go
func (h *GitLabWebhook) handlePipelineEvent(ctx context.Context, esID string, event *webhooks.PipelineEvent) error
```

### <a id="PR" href="#PR">type PR struct</a>

```
searchKey: webhooks.PR
tags: [struct]
```

```Go
type PR struct {
	ID             int64
	RepoExternalID string
}
```

#### <a id="gitlabToPR" href="#gitlabToPR">func gitlabToPR(project *gitlab.ProjectCommon, mr *gitlab.MergeRequest) PR</a>

```
searchKey: webhooks.gitlabToPR
tags: [function private]
```

```Go
func gitlabToPR(project *gitlab.ProjectCommon, mr *gitlab.MergeRequest) PR
```

gitlabToPR instantiates a new PR instance given fields that are commonly available in GitLab webhook payloads. 

### <a id="Webhook" href="#Webhook">type Webhook struct</a>

```
searchKey: webhooks.Webhook
tags: [struct]
```

```Go
type Webhook struct {
	Store *store.Store

	// ServiceType corresponds to api.ExternalRepoSpec.ServiceType
	// Example values: extsvc.TypeBitbucketServer, extsvc.TypeGitHub
	ServiceType string
}
```

#### <a id="Webhook.getRepoForPR" href="#Webhook.getRepoForPR">func (h Webhook) getRepoForPR(ctx context.Context,...</a>

```
searchKey: webhooks.Webhook.getRepoForPR
tags: [method private]
```

```Go
func (h Webhook) getRepoForPR(
	ctx context.Context,
	tx *store.Store,
	pr PR,
	externalServiceID string,
) (*types.Repo, error)
```

#### <a id="Webhook.upsertChangesetEvent" href="#Webhook.upsertChangesetEvent">func (h Webhook) upsertChangesetEvent(ctx context.Context,...</a>

```
searchKey: webhooks.Webhook.upsertChangesetEvent
tags: [method private]
```

```Go
func (h Webhook) upsertChangesetEvent(
	ctx context.Context,
	externalServiceID string,
	pr PR,
	ev keyer,
) (err error)
```

### <a id="brokenDB" href="#brokenDB">type brokenDB struct</a>

```
searchKey: webhooks.brokenDB
tags: [struct private]
```

```Go
type brokenDB struct{ err error }
```

brokenDB provides a dbutil.DB that always fails: for methods that return an error, the err field will be returned; otherwise nil will be returned. 

#### <a id="brokenDB.ExecContext" href="#brokenDB.ExecContext">func (db *brokenDB) ExecContext(ctx context.Context, q string, args ...interface{}) (sql.Result, error)</a>

```
searchKey: webhooks.brokenDB.ExecContext
tags: [method private]
```

```Go
func (db *brokenDB) ExecContext(ctx context.Context, q string, args ...interface{}) (sql.Result, error)
```

#### <a id="brokenDB.QueryContext" href="#brokenDB.QueryContext">func (db *brokenDB) QueryContext(ctx context.Context, q string, args ...interface{}) (*sql.Rows, error)</a>

```
searchKey: webhooks.brokenDB.QueryContext
tags: [method private]
```

```Go
func (db *brokenDB) QueryContext(ctx context.Context, q string, args ...interface{}) (*sql.Rows, error)
```

#### <a id="brokenDB.QueryRowContext" href="#brokenDB.QueryRowContext">func (db *brokenDB) QueryRowContext(ctx context.Context, q string, args ...interface{}) *sql.Row</a>

```
searchKey: webhooks.brokenDB.QueryRowContext
tags: [method private]
```

```Go
func (db *brokenDB) QueryRowContext(ctx context.Context, q string, args ...interface{}) *sql.Row
```

### <a id="brokenReader" href="#brokenReader">type brokenReader struct</a>

```
searchKey: webhooks.brokenReader
tags: [struct private]
```

```Go
type brokenReader struct{ err error }
```

brokenReader implements an io.ReadCloser that always returns an error when read. 

#### <a id="brokenReader.Close" href="#brokenReader.Close">func (br *brokenReader) Close() error</a>

```
searchKey: webhooks.brokenReader.Close
tags: [method private]
```

```Go
func (br *brokenReader) Close() error
```

#### <a id="brokenReader.Read" href="#brokenReader.Read">func (br *brokenReader) Read(p []byte) (int, error)</a>

```
searchKey: webhooks.brokenReader.Read
tags: [method private]
```

```Go
func (br *brokenReader) Read(p []byte) (int, error)
```

### <a id="httpError" href="#httpError">type httpError struct</a>

```
searchKey: webhooks.httpError
tags: [struct private]
```

```Go
type httpError struct {
	code int
	err  error
}
```

#### <a id="httpError.Error" href="#httpError.Error">func (e httpError) Error() string</a>

```
searchKey: webhooks.httpError.Error
tags: [method private]
```

```Go
func (e httpError) Error() string
```

### <a id="keyer" href="#keyer">type keyer interface</a>

```
searchKey: webhooks.keyer
tags: [interface private]
```

```Go
type keyer interface {
	Key() string
}
```

### <a id="nestedTx" href="#nestedTx">type nestedTx struct</a>

```
searchKey: webhooks.nestedTx
tags: [struct private]
```

```Go
type nestedTx struct{ *sql.Tx }
```

nestedTx wraps an existing transaction and overrides its transaction methods to be no-ops. This allows us to have a master transaction used in tests that test functions that attempt to create and commit transactions: since PostgreSQL doesn't support nested transactions, we can still use the master transaction to manage the test database state without rollback/commit already performed errors. 

It would be theoretically possible to use savepoints to implement something resembling the semantics of a true nested transaction, but that's unnecessary for these tests. 

#### <a id="nestedTx.BeginTx" href="#nestedTx.BeginTx">func (ntx *nestedTx) BeginTx(ctx context.Context, opts *sql.TxOptions) error</a>

```
searchKey: webhooks.nestedTx.BeginTx
tags: [method private]
```

```Go
func (ntx *nestedTx) BeginTx(ctx context.Context, opts *sql.TxOptions) error
```

#### <a id="nestedTx.Commit" href="#nestedTx.Commit">func (ntx *nestedTx) Commit() error</a>

```
searchKey: webhooks.nestedTx.Commit
tags: [method private]
```

```Go
func (ntx *nestedTx) Commit() error
```

#### <a id="nestedTx.Rollback" href="#nestedTx.Rollback">func (ntx *nestedTx) Rollback() error</a>

```
searchKey: webhooks.nestedTx.Rollback
tags: [method private]
```

```Go
func (ntx *nestedTx) Rollback() error
```

### <a id="noNestingTx" href="#noNestingTx">type noNestingTx struct</a>

```
searchKey: webhooks.noNestingTx
tags: [struct private]
```

```Go
type noNestingTx struct{ dbutil.DB }
```

noNestingTx is another transaction wrapper that always returns an error when a transaction is attempted. 

#### <a id="noNestingTx.BeginTx" href="#noNestingTx.BeginTx">func (nntx *noNestingTx) BeginTx(ctx context.Context, opts *sql.TxOptions) error</a>

```
searchKey: webhooks.noNestingTx.BeginTx
tags: [method private]
```

```Go
func (nntx *noNestingTx) BeginTx(ctx context.Context, opts *sql.TxOptions) error
```

### <a id="webhookTestCase" href="#webhookTestCase">type webhookTestCase struct</a>

```
searchKey: webhooks.webhookTestCase
tags: [struct private]
```

```Go
type webhookTestCase struct {
	Payloads []struct {
		PayloadType string          `json:"payload_type"`
		Data        json.RawMessage `json:"data"`
	} `json:"payloads"`
	ChangesetEvents []*btypes.ChangesetEvent `json:"changeset_events"`
}
```

#### <a id="loadWebhookTestCase" href="#loadWebhookTestCase">func loadWebhookTestCase(t testing.TB, path string) webhookTestCase</a>

```
searchKey: webhooks.loadWebhookTestCase
tags: [function private]
```

```Go
func loadWebhookTestCase(t testing.TB, path string) webhookTestCase
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestValidateGitLabSecret" href="#TestValidateGitLabSecret">func TestValidateGitLabSecret(t *testing.T)</a>

```
searchKey: webhooks.TestValidateGitLabSecret
tags: [function private test]
```

```Go
func TestValidateGitLabSecret(t *testing.T)
```

### <a id="TestWebhooksIntegration" href="#TestWebhooksIntegration">func TestWebhooksIntegration(t *testing.T)</a>

```
searchKey: webhooks.TestWebhooksIntegration
tags: [function private test]
```

```Go
func TestWebhooksIntegration(t *testing.T)
```

### <a id="assertBodyIncludes" href="#assertBodyIncludes">func assertBodyIncludes(t *testing.T, r io.Reader, want string)</a>

```
searchKey: webhooks.assertBodyIncludes
tags: [function private]
```

```Go
func assertBodyIncludes(t *testing.T, r io.Reader, want string)
```

assertBodyIncludes checks for a specific substring within the given response body, and generates a test error if the substring is not found. This is mostly useful to look for wrapped errors in the output. 

### <a id="assertChangesetEventForChangeset" href="#assertChangesetEventForChangeset">func assertChangesetEventForChangeset(t *testing.T, ctx context.Context, tx *store.Store, changeset *btypes.Changeset, want btypes.ChangesetEventKind)</a>

```
searchKey: webhooks.assertChangesetEventForChangeset
tags: [function private]
```

```Go
func assertChangesetEventForChangeset(t *testing.T, ctx context.Context, tx *store.Store, changeset *btypes.Changeset, want btypes.ChangesetEventKind)
```

assertChangesetEventForChangeset checks that one (and only one) changeset event has been created on the given changeset, and that it is of the given kind. 

### <a id="createGitLabChangeset" href="#createGitLabChangeset">func createGitLabChangeset(t *testing.T, ctx context.Context, store *store.Store, repo *types.Repo) *btypes.Changeset</a>

```
searchKey: webhooks.createGitLabChangeset
tags: [function private]
```

```Go
func createGitLabChangeset(t *testing.T, ctx context.Context, store *store.Store, repo *types.Repo) *btypes.Changeset
```

createGitLabChangeset creates a mock GitLab changeset. 

### <a id="createGitLabExternalService" href="#createGitLabExternalService">func createGitLabExternalService(t *testing.T, ctx context.Context, esStore *database.ExternalServiceStore) *types.ExternalService</a>

```
searchKey: webhooks.createGitLabExternalService
tags: [function private]
```

```Go
func createGitLabExternalService(t *testing.T, ctx context.Context, esStore *database.ExternalServiceStore) *types.ExternalService
```

createGitLabExternalService creates a mock GitLab service with a valid configuration, including the secrets "super" and "secret". 

### <a id="createGitLabRepo" href="#createGitLabRepo">func createGitLabRepo(t *testing.T, ctx context.Context, rstore *database.RepoStore, es *types.ExternalService) *types.Repo</a>

```
searchKey: webhooks.createGitLabRepo
tags: [function private]
```

```Go
func createGitLabRepo(t *testing.T, ctx context.Context, rstore *database.RepoStore, es *types.ExternalService) *types.Repo
```

createGitLabRepo creates a mock GitLab repo attached to the given external service. 

### <a id="createMergeRequestPayload" href="#createMergeRequestPayload">func createMergeRequestPayload(t *testing.T, repo *types.Repo, changeset *btypes.Changeset, action string) string</a>

```
searchKey: webhooks.createMergeRequestPayload
tags: [function private]
```

```Go
func createMergeRequestPayload(t *testing.T, repo *types.Repo, changeset *btypes.Changeset, action string) string
```

createMergeRequestPayload creates a mock GitLab webhook payload of the merge request object kind. 

### <a id="createPipelinePayload" href="#createPipelinePayload">func createPipelinePayload(t *testing.T, repo *types.Repo, changeset *btypes.Changeset, pipeline gitlab.Pipeline) string</a>

```
searchKey: webhooks.createPipelinePayload
tags: [function private]
```

```Go
func createPipelinePayload(t *testing.T, repo *types.Repo, changeset *btypes.Changeset, pipeline gitlab.Pipeline) string
```

createPipelinePayload creates a mock GitLab webhook payload of the pipeline object kind. 

### <a id="extractExternalServiceID" href="#extractExternalServiceID">func extractExternalServiceID(extSvc *types.ExternalService) (string, error)</a>

```
searchKey: webhooks.extractExternalServiceID
tags: [function private]
```

```Go
func extractExternalServiceID(extSvc *types.ExternalService) (string, error)
```

### <a id="getSingleRepo" href="#getSingleRepo">func getSingleRepo(ctx context.Context, bitbucketSource *repos.BitbucketServerSource, name string) (*types.Repo, error)</a>

```
searchKey: webhooks.getSingleRepo
tags: [function private]
```

```Go
func getSingleRepo(ctx context.Context, bitbucketSource *repos.BitbucketServerSource, name string) (*types.Repo, error)
```

### <a id="gitLabTestSetup" href="#gitLabTestSetup">func gitLabTestSetup(t *testing.T, db *sql.DB) *store.Store</a>

```
searchKey: webhooks.gitLabTestSetup
tags: [function private]
```

```Go
func gitLabTestSetup(t *testing.T, db *sql.DB) *store.Store
```

gitLabTestSetup instantiates the stores and a clock for use within tests. Any changes made to the stores will be rolled back after the test is complete. 

### <a id="respond" href="#respond">func respond(w http.ResponseWriter, code int, v interface{})</a>

```
searchKey: webhooks.respond
tags: [function private]
```

```Go
func respond(w http.ResponseWriter, code int, v interface{})
```

### <a id="sign" href="#sign">func sign(t *testing.T, message, secret []byte) string</a>

```
searchKey: webhooks.sign
tags: [function private]
```

```Go
func sign(t *testing.T, message, secret []byte) string
```

### <a id="testBitbucketWebhook" href="#testBitbucketWebhook">func testBitbucketWebhook(db *sql.DB, userID int32) func(*testing.T)</a>

```
searchKey: webhooks.testBitbucketWebhook
tags: [function private]
```

```Go
func testBitbucketWebhook(db *sql.DB, userID int32) func(*testing.T)
```

Run from integration_test.go 

### <a id="testGitHubWebhook" href="#testGitHubWebhook">func testGitHubWebhook(db *sql.DB, userID int32) func(*testing.T)</a>

```
searchKey: webhooks.testGitHubWebhook
tags: [function private]
```

```Go
func testGitHubWebhook(db *sql.DB, userID int32) func(*testing.T)
```

Run from integration_test.go 

### <a id="testGitLabWebhook" href="#testGitLabWebhook">func testGitLabWebhook(db *sql.DB, userID int32) func(*testing.T)</a>

```
searchKey: webhooks.testGitLabWebhook
tags: [function private]
```

```Go
func testGitLabWebhook(db *sql.DB, userID int32) func(*testing.T)
```

### <a id="validateGitLabSecret" href="#validateGitLabSecret">func validateGitLabSecret(extSvc *types.ExternalService, secret string) (bool, error)</a>

```
searchKey: webhooks.validateGitLabSecret
tags: [function private]
```

```Go
func validateGitLabSecret(extSvc *types.ExternalService, secret string) (bool, error)
```

validateGitLabSecret validates that the given secret matches one of the webhooks in the external service. 

