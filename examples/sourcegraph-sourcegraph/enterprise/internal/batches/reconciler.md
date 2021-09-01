# Package reconciler

## Index

* [Variables](#var)
    * [var internalClient](#internalClient)
    * [var operationPrecedence](#operationPrecedence)
* [Types](#type)
    * [type ChangesetSpecDelta struct](#ChangesetSpecDelta)
        * [func compareChangesetSpecs(previous, current *btypes.ChangesetSpec) (*ChangesetSpecDelta, error)](#compareChangesetSpecs)
        * [func (d *ChangesetSpecDelta) AttributesChanged() bool](#ChangesetSpecDelta.AttributesChanged)
        * [func (d *ChangesetSpecDelta) NeedCodeHostUpdate() bool](#ChangesetSpecDelta.NeedCodeHostUpdate)
        * [func (d *ChangesetSpecDelta) NeedCommitUpdate() bool](#ChangesetSpecDelta.NeedCommitUpdate)
        * [func (d *ChangesetSpecDelta) String() string](#ChangesetSpecDelta.String)
    * [type FakeStore struct](#FakeStore)
        * [func (fs *FakeStore) GetBatchChange(ctx context.Context, opts store.GetBatchChangeOpts) (*btypes.BatchChange, error)](#FakeStore.GetBatchChange)
    * [type GitserverClient interface](#GitserverClient)
    * [type Operations []types.ReconcilerOperation](#Operations)
        * [func (ops Operations) Equal(b Operations) bool](#Operations.Equal)
        * [func (ops Operations) ExecutionOrder() []btypes.ReconcilerOperation](#Operations.ExecutionOrder)
        * [func (ops Operations) IsNone() bool](#Operations.IsNone)
        * [func (ops Operations) String() string](#Operations.String)
    * [type Plan struct](#Plan)
        * [func DeterminePlan(previousSpec, currentSpec *btypes.ChangesetSpec, ch *btypes.Changeset) (*Plan, error)](#DeterminePlan)
        * [func (p *Plan) AddOp(op btypes.ReconcilerOperation)](#Plan.AddOp)
        * [func (p *Plan) SetOp(op btypes.ReconcilerOperation)](#Plan.SetOp)
    * [type Reconciler struct](#Reconciler)
        * [func New(gitClient GitserverClient, sourcer sources.Sourcer, store *store.Store) *Reconciler](#New)
        * [func (r *Reconciler) HandlerFunc() dbworker.HandlerFunc](#Reconciler.HandlerFunc)
        * [func (r *Reconciler) process(ctx context.Context, tx *store.Store, ch *btypes.Changeset) error](#Reconciler.process)
    * [type errMissingCredentials struct](#errMissingCredentials)
        * [func (e errMissingCredentials) Error() string](#errMissingCredentials.Error)
        * [func (e errMissingCredentials) Is(target error) bool](#errMissingCredentials.Is)
        * [func (e errMissingCredentials) NonRetryable() bool](#errMissingCredentials.NonRetryable)
    * [type errNoPushCredentials struct](#errNoPushCredentials)
        * [func (e errNoPushCredentials) Error() string](#errNoPushCredentials.Error)
        * [func (e errNoPushCredentials) NonRetryable() bool](#errNoPushCredentials.NonRetryable)
    * [type errNoSSHCredential struct{}](#errNoSSHCredential)
        * [func (e errNoSSHCredential) Error() string](#errNoSSHCredential.Error)
        * [func (e errNoSSHCredential) NonRetryable() bool](#errNoSSHCredential.NonRetryable)
    * [type errPublishSameBranch struct{}](#errPublishSameBranch)
        * [func (e errPublishSameBranch) Error() string](#errPublishSameBranch.Error)
        * [func (e errPublishSameBranch) NonRetryable() bool](#errPublishSameBranch.NonRetryable)
    * [type executor struct](#executor)
        * [func (e *executor) Run(ctx context.Context, plan *Plan) (err error)](#executor.Run)
        * [func (e *executor) archiveChangeset()](#executor.archiveChangeset)
        * [func (e *executor) closeChangeset(ctx context.Context) (err error)](#executor.closeChangeset)
        * [func (e *executor) detachChangeset()](#executor.detachChangeset)
        * [func (e *executor) importChangeset(ctx context.Context) error](#executor.importChangeset)
        * [func (e *executor) loadChangeset(ctx context.Context) error](#executor.loadChangeset)
        * [func (e *executor) publishChangeset(ctx context.Context, asDraft bool) (err error)](#executor.publishChangeset)
        * [func (e *executor) pushChangesetPatch(ctx context.Context) (err error)](#executor.pushChangesetPatch)
        * [func (e *executor) pushCommit(ctx context.Context, opts protocol.CreateCommitFromPatchRequest) error](#executor.pushCommit)
        * [func (e *executor) reopenChangeset(ctx context.Context) (err error)](#executor.reopenChangeset)
        * [func (e *executor) sleep()](#executor.sleep)
        * [func (e *executor) syncChangeset(ctx context.Context) error](#executor.syncChangeset)
        * [func (e *executor) undraftChangeset(ctx context.Context) (err error)](#executor.undraftChangeset)
        * [func (e *executor) updateChangeset(ctx context.Context) (err error)](#executor.updateChangeset)
    * [type getBatchChanger interface](#getBatchChanger)
    * [type getNamespacer interface](#getNamespacer)
    * [type mockInternalClient struct](#mockInternalClient)
        * [func (c *mockInternalClient) ExternalURL(ctx context.Context) (string, error)](#mockInternalClient.ExternalURL)
    * [type mockMissingErr struct](#mockMissingErr)
        * [func (e mockMissingErr) Error() string](#mockMissingErr.Error)
* [Functions](#func)
    * [func TestBatchChangeURL(t *testing.T)](#TestBatchChangeURL)
    * [func TestDecorateChangesetBody(t *testing.T)](#TestDecorateChangesetBody)
    * [func TestDetermineReconcilerPlan(t *testing.T)](#TestDetermineReconcilerPlan)
    * [func TestExecutor_ExecutePlan(t *testing.T)](#TestExecutor_ExecutePlan)
    * [func TestExecutor_ExecutePlan_PublishedChangesetDuplicateBranch(t *testing.T)](#TestExecutor_ExecutePlan_PublishedChangesetDuplicateBranch)
    * [func TestExecutor_UserCredentialsForGitserver(t *testing.T)](#TestExecutor_UserCredentialsForGitserver)
    * [func TestLoadChangesetSource(t *testing.T)](#TestLoadChangesetSource)
    * [func TestNamespaceURL(t *testing.T)](#TestNamespaceURL)
    * [func TestReconcilerProcess_IntegrationTest(t *testing.T)](#TestReconcilerProcess_IntegrationTest)
    * [func batchChangeURL(ctx context.Context, ns *database.Namespace, c *btypes.BatchChange) (string, error)](#batchChangeURL)
    * [func buildCommitOpts(repo *types.Repo, spec *btypes.ChangesetSpec, pushOpts *protocol.PushConfig) (opts protocol.CreateCommitFromPatchRequest, err error)](#buildCommitOpts)
    * [func buildGithubPR(now time.Time, externalState btypes.ChangesetExternalState) *github.PullRequest](#buildGithubPR)
    * [func decorateChangesetBody(ctx context.Context, tx getBatchChanger, nsStore getNamespacer, cs *sources.Changeset) error](#decorateChangesetBody)
    * [func executePlan(ctx context.Context, gitserverClient GitserverClient, sourcer sources.Sourcer, noSleepBeforeSync bool, tx *store.Store, plan *Plan) (err error)](#executePlan)
    * [func loadBatchChange(ctx context.Context, tx getBatchChanger, id int64) (*btypes.BatchChange, error)](#loadBatchChange)
    * [func loadChangesetSource(ctx context.Context, s *store.Store, sourcer sources.Sourcer, ch *btypes.Changeset, repo *types.Repo) (sources.ChangesetSource, error)](#loadChangesetSource)
    * [func loadChangesetSpecs(ctx context.Context, tx *store.Store, ch *btypes.Changeset) (prev, curr *btypes.ChangesetSpec, err error)](#loadChangesetSpecs)
    * [func namespaceURL(ns *database.Namespace) string](#namespaceURL)
    * [func reopenAfterDetach(ch *btypes.Changeset) bool](#reopenAfterDetach)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="internalClient" href="#internalClient">var internalClient</a>

```
searchKey: reconciler.internalClient
tags: [variable interface private]
```

```Go
var internalClient interface {
	ExternalURL(context.Context) (string, error)
} = api.InternalClient
```

internalClient is here for mocking reasons. 

### <a id="operationPrecedence" href="#operationPrecedence">var operationPrecedence</a>

```
searchKey: reconciler.operationPrecedence
tags: [variable object private]
```

```Go
var operationPrecedence = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="ChangesetSpecDelta" href="#ChangesetSpecDelta">type ChangesetSpecDelta struct</a>

```
searchKey: reconciler.ChangesetSpecDelta
tags: [struct]
```

```Go
type ChangesetSpecDelta struct {
	TitleChanged         bool
	BodyChanged          bool
	Undraft              bool
	BaseRefChanged       bool
	DiffChanged          bool
	CommitMessageChanged bool
	AuthorNameChanged    bool
	AuthorEmailChanged   bool
}
```

#### <a id="compareChangesetSpecs" href="#compareChangesetSpecs">func compareChangesetSpecs(previous, current *btypes.ChangesetSpec) (*ChangesetSpecDelta, error)</a>

```
searchKey: reconciler.compareChangesetSpecs
tags: [function private]
```

```Go
func compareChangesetSpecs(previous, current *btypes.ChangesetSpec) (*ChangesetSpecDelta, error)
```

#### <a id="ChangesetSpecDelta.AttributesChanged" href="#ChangesetSpecDelta.AttributesChanged">func (d *ChangesetSpecDelta) AttributesChanged() bool</a>

```
searchKey: reconciler.ChangesetSpecDelta.AttributesChanged
tags: [method]
```

```Go
func (d *ChangesetSpecDelta) AttributesChanged() bool
```

#### <a id="ChangesetSpecDelta.NeedCodeHostUpdate" href="#ChangesetSpecDelta.NeedCodeHostUpdate">func (d *ChangesetSpecDelta) NeedCodeHostUpdate() bool</a>

```
searchKey: reconciler.ChangesetSpecDelta.NeedCodeHostUpdate
tags: [method]
```

```Go
func (d *ChangesetSpecDelta) NeedCodeHostUpdate() bool
```

#### <a id="ChangesetSpecDelta.NeedCommitUpdate" href="#ChangesetSpecDelta.NeedCommitUpdate">func (d *ChangesetSpecDelta) NeedCommitUpdate() bool</a>

```
searchKey: reconciler.ChangesetSpecDelta.NeedCommitUpdate
tags: [method]
```

```Go
func (d *ChangesetSpecDelta) NeedCommitUpdate() bool
```

#### <a id="ChangesetSpecDelta.String" href="#ChangesetSpecDelta.String">func (d *ChangesetSpecDelta) String() string</a>

```
searchKey: reconciler.ChangesetSpecDelta.String
tags: [method]
```

```Go
func (d *ChangesetSpecDelta) String() string
```

### <a id="FakeStore" href="#FakeStore">type FakeStore struct</a>

```
searchKey: reconciler.FakeStore
tags: [struct private]
```

```Go
type FakeStore struct {
	GetBatchChangeMock func(context.Context, store.GetBatchChangeOpts) (*btypes.BatchChange, error)
}
```

#### <a id="FakeStore.GetBatchChange" href="#FakeStore.GetBatchChange">func (fs *FakeStore) GetBatchChange(ctx context.Context, opts store.GetBatchChangeOpts) (*btypes.BatchChange, error)</a>

```
searchKey: reconciler.FakeStore.GetBatchChange
tags: [method private]
```

```Go
func (fs *FakeStore) GetBatchChange(ctx context.Context, opts store.GetBatchChangeOpts) (*btypes.BatchChange, error)
```

### <a id="GitserverClient" href="#GitserverClient">type GitserverClient interface</a>

```
searchKey: reconciler.GitserverClient
tags: [interface]
```

```Go
type GitserverClient interface {
	CreateCommitFromPatch(ctx context.Context, req protocol.CreateCommitFromPatchRequest) (string, error)
}
```

### <a id="Operations" href="#Operations">type Operations []types.ReconcilerOperation</a>

```
searchKey: reconciler.Operations
tags: [array string]
```

```Go
type Operations []btypes.ReconcilerOperation
```

#### <a id="Operations.Equal" href="#Operations.Equal">func (ops Operations) Equal(b Operations) bool</a>

```
searchKey: reconciler.Operations.Equal
tags: [method]
```

```Go
func (ops Operations) Equal(b Operations) bool
```

#### <a id="Operations.ExecutionOrder" href="#Operations.ExecutionOrder">func (ops Operations) ExecutionOrder() []btypes.ReconcilerOperation</a>

```
searchKey: reconciler.Operations.ExecutionOrder
tags: [method]
```

```Go
func (ops Operations) ExecutionOrder() []btypes.ReconcilerOperation
```

#### <a id="Operations.IsNone" href="#Operations.IsNone">func (ops Operations) IsNone() bool</a>

```
searchKey: reconciler.Operations.IsNone
tags: [method]
```

```Go
func (ops Operations) IsNone() bool
```

#### <a id="Operations.String" href="#Operations.String">func (ops Operations) String() string</a>

```
searchKey: reconciler.Operations.String
tags: [method]
```

```Go
func (ops Operations) String() string
```

### <a id="Plan" href="#Plan">type Plan struct</a>

```
searchKey: reconciler.Plan
tags: [struct]
```

```Go
type Plan struct {
	// The changeset that is targeted in this plan.
	Changeset *btypes.Changeset

	// The changeset spec that is used in this plan.
	ChangesetSpec *btypes.ChangesetSpec

	// The operations that need to be done to reconcile the changeset.
	Ops Operations

	// The Delta between a possible previous ChangesetSpec and the current
	// ChangesetSpec.
	Delta *ChangesetSpecDelta
}
```

Plan represents the possible operations the reconciler needs to do to reconcile the current and the desired state of a changeset. 

#### <a id="DeterminePlan" href="#DeterminePlan">func DeterminePlan(previousSpec, currentSpec *btypes.ChangesetSpec, ch *btypes.Changeset) (*Plan, error)</a>

```
searchKey: reconciler.DeterminePlan
tags: [function]
```

```Go
func DeterminePlan(previousSpec, currentSpec *btypes.ChangesetSpec, ch *btypes.Changeset) (*Plan, error)
```

DeterminePlan looks at the given changeset to determine what action the reconciler should take. It consumes the current and the previous changeset spec, if they exist. If the current ChangesetSpec is not applied to a batch change, it returns an error. 

#### <a id="Plan.AddOp" href="#Plan.AddOp">func (p *Plan) AddOp(op btypes.ReconcilerOperation)</a>

```
searchKey: reconciler.Plan.AddOp
tags: [method]
```

```Go
func (p *Plan) AddOp(op btypes.ReconcilerOperation)
```

#### <a id="Plan.SetOp" href="#Plan.SetOp">func (p *Plan) SetOp(op btypes.ReconcilerOperation)</a>

```
searchKey: reconciler.Plan.SetOp
tags: [method]
```

```Go
func (p *Plan) SetOp(op btypes.ReconcilerOperation)
```

### <a id="Reconciler" href="#Reconciler">type Reconciler struct</a>

```
searchKey: reconciler.Reconciler
tags: [struct]
```

```Go
type Reconciler struct {
	gitserverClient GitserverClient
	sourcer         sources.Sourcer
	store           *store.Store

	// This is used to disable a time.Sleep for operationSleep so that the
	// tests don't run slower.
	noSleepBeforeSync bool
}
```

Reconciler processes changesets and reconciles their current state — in Sourcegraph or on the code host — with that described in the current ChangesetSpec associated with the changeset. 

#### <a id="New" href="#New">func New(gitClient GitserverClient, sourcer sources.Sourcer, store *store.Store) *Reconciler</a>

```
searchKey: reconciler.New
tags: [function]
```

```Go
func New(gitClient GitserverClient, sourcer sources.Sourcer, store *store.Store) *Reconciler
```

#### <a id="Reconciler.HandlerFunc" href="#Reconciler.HandlerFunc">func (r *Reconciler) HandlerFunc() dbworker.HandlerFunc</a>

```
searchKey: reconciler.Reconciler.HandlerFunc
tags: [method]
```

```Go
func (r *Reconciler) HandlerFunc() dbworker.HandlerFunc
```

HandlerFunc returns a dbworker.HandlerFunc that can be passed to a workerutil.Worker to process queued changesets. 

#### <a id="Reconciler.process" href="#Reconciler.process">func (r *Reconciler) process(ctx context.Context, tx *store.Store, ch *btypes.Changeset) error</a>

```
searchKey: reconciler.Reconciler.process
tags: [method private]
```

```Go
func (r *Reconciler) process(ctx context.Context, tx *store.Store, ch *btypes.Changeset) error
```

process is the main entry point of the reconciler and processes changesets that were marked as queued in the database. 

For each changeset, the reconciler computes an execution plan to run to reconcile a possible divergence between the changeset's current state and the desired state (for example expressed in a changeset spec). 

To do that, the reconciler looks at the changeset's current state (publication state, external state, sync state, ...), its (if set) current ChangesetSpec, and (if it exists) its previous ChangesetSpec. 

If an error is returned, the workerutil.Worker that called this function (through the HandlerFunc) will set the changeset's ReconcilerState to errored and set its FailureMessage to the error. 

### <a id="errMissingCredentials" href="#errMissingCredentials">type errMissingCredentials struct</a>

```
searchKey: reconciler.errMissingCredentials
tags: [struct private]
```

```Go
type errMissingCredentials struct{ repo string }
```

errMissingCredentials is returned if the user that applied the last batch change /changeset spec doesn't have a user credential for the given repository and is not a site-admin (so no fallback to the global credentials is possible). 

#### <a id="errMissingCredentials.Error" href="#errMissingCredentials.Error">func (e errMissingCredentials) Error() string</a>

```
searchKey: reconciler.errMissingCredentials.Error
tags: [method private]
```

```Go
func (e errMissingCredentials) Error() string
```

#### <a id="errMissingCredentials.Is" href="#errMissingCredentials.Is">func (e errMissingCredentials) Is(target error) bool</a>

```
searchKey: reconciler.errMissingCredentials.Is
tags: [method private]
```

```Go
func (e errMissingCredentials) Is(target error) bool
```

#### <a id="errMissingCredentials.NonRetryable" href="#errMissingCredentials.NonRetryable">func (e errMissingCredentials) NonRetryable() bool</a>

```
searchKey: reconciler.errMissingCredentials.NonRetryable
tags: [method private]
```

```Go
func (e errMissingCredentials) NonRetryable() bool
```

### <a id="errNoPushCredentials" href="#errNoPushCredentials">type errNoPushCredentials struct</a>

```
searchKey: reconciler.errNoPushCredentials
tags: [struct private]
```

```Go
type errNoPushCredentials struct{ credentialsType string }
```

errNoPushCredentials is returned if the authenticator cannot be used by git to authenticate a `git push`. 

#### <a id="errNoPushCredentials.Error" href="#errNoPushCredentials.Error">func (e errNoPushCredentials) Error() string</a>

```
searchKey: reconciler.errNoPushCredentials.Error
tags: [method private]
```

```Go
func (e errNoPushCredentials) Error() string
```

#### <a id="errNoPushCredentials.NonRetryable" href="#errNoPushCredentials.NonRetryable">func (e errNoPushCredentials) NonRetryable() bool</a>

```
searchKey: reconciler.errNoPushCredentials.NonRetryable
tags: [method private]
```

```Go
func (e errNoPushCredentials) NonRetryable() bool
```

### <a id="errNoSSHCredential" href="#errNoSSHCredential">type errNoSSHCredential struct{}</a>

```
searchKey: reconciler.errNoSSHCredential
tags: [struct private]
```

```Go
type errNoSSHCredential struct{}
```

errNoSSHCredential is returned, if the  clone URL of the repository uses the ssh:// scheme, but the authenticator doesn't support SSH pushes. 

#### <a id="errNoSSHCredential.Error" href="#errNoSSHCredential.Error">func (e errNoSSHCredential) Error() string</a>

```
searchKey: reconciler.errNoSSHCredential.Error
tags: [method private]
```

```Go
func (e errNoSSHCredential) Error() string
```

#### <a id="errNoSSHCredential.NonRetryable" href="#errNoSSHCredential.NonRetryable">func (e errNoSSHCredential) NonRetryable() bool</a>

```
searchKey: reconciler.errNoSSHCredential.NonRetryable
tags: [method private]
```

```Go
func (e errNoSSHCredential) NonRetryable() bool
```

### <a id="errPublishSameBranch" href="#errPublishSameBranch">type errPublishSameBranch struct{}</a>

```
searchKey: reconciler.errPublishSameBranch
tags: [struct private]
```

```Go
type errPublishSameBranch struct{}
```

errPublishSameBranch is returned by publish changeset if a changeset with the same external branch already exists in the database and is owned by another batch change. It is a terminal error that won't be fixed by retrying to publish the changeset with the same spec. 

#### <a id="errPublishSameBranch.Error" href="#errPublishSameBranch.Error">func (e errPublishSameBranch) Error() string</a>

```
searchKey: reconciler.errPublishSameBranch.Error
tags: [method private]
```

```Go
func (e errPublishSameBranch) Error() string
```

#### <a id="errPublishSameBranch.NonRetryable" href="#errPublishSameBranch.NonRetryable">func (e errPublishSameBranch) NonRetryable() bool</a>

```
searchKey: reconciler.errPublishSameBranch.NonRetryable
tags: [method private]
```

```Go
func (e errPublishSameBranch) NonRetryable() bool
```

### <a id="executor" href="#executor">type executor struct</a>

```
searchKey: reconciler.executor
tags: [struct private]
```

```Go
type executor struct {
	gitserverClient   GitserverClient
	sourcer           sources.Sourcer
	noSleepBeforeSync bool
	tx                *store.Store
	ch                *btypes.Changeset
	spec              *btypes.ChangesetSpec
	delta             *ChangesetSpecDelta

	css  sources.ChangesetSource
	repo *types.Repo
}
```

#### <a id="executor.Run" href="#executor.Run">func (e *executor) Run(ctx context.Context, plan *Plan) (err error)</a>

```
searchKey: reconciler.executor.Run
tags: [method private]
```

```Go
func (e *executor) Run(ctx context.Context, plan *Plan) (err error)
```

#### <a id="executor.archiveChangeset" href="#executor.archiveChangeset">func (e *executor) archiveChangeset()</a>

```
searchKey: reconciler.executor.archiveChangeset
tags: [method private]
```

```Go
func (e *executor) archiveChangeset()
```

archiveChangeset sets all associations to archived that are marked as "to-be-archived". 

#### <a id="executor.closeChangeset" href="#executor.closeChangeset">func (e *executor) closeChangeset(ctx context.Context) (err error)</a>

```
searchKey: reconciler.executor.closeChangeset
tags: [method private]
```

```Go
func (e *executor) closeChangeset(ctx context.Context) (err error)
```

closeChangeset closes the given changeset on its code host if its ExternalState is OPEN or DRAFT. 

#### <a id="executor.detachChangeset" href="#executor.detachChangeset">func (e *executor) detachChangeset()</a>

```
searchKey: reconciler.executor.detachChangeset
tags: [method private]
```

```Go
func (e *executor) detachChangeset()
```

#### <a id="executor.importChangeset" href="#executor.importChangeset">func (e *executor) importChangeset(ctx context.Context) error</a>

```
searchKey: reconciler.executor.importChangeset
tags: [method private]
```

```Go
func (e *executor) importChangeset(ctx context.Context) error
```

#### <a id="executor.loadChangeset" href="#executor.loadChangeset">func (e *executor) loadChangeset(ctx context.Context) error</a>

```
searchKey: reconciler.executor.loadChangeset
tags: [method private]
```

```Go
func (e *executor) loadChangeset(ctx context.Context) error
```

#### <a id="executor.publishChangeset" href="#executor.publishChangeset">func (e *executor) publishChangeset(ctx context.Context, asDraft bool) (err error)</a>

```
searchKey: reconciler.executor.publishChangeset
tags: [method private]
```

```Go
func (e *executor) publishChangeset(ctx context.Context, asDraft bool) (err error)
```

publishChangeset creates the given changeset on its code host. 

#### <a id="executor.pushChangesetPatch" href="#executor.pushChangesetPatch">func (e *executor) pushChangesetPatch(ctx context.Context) (err error)</a>

```
searchKey: reconciler.executor.pushChangesetPatch
tags: [method private]
```

```Go
func (e *executor) pushChangesetPatch(ctx context.Context) (err error)
```

pushChangesetPatch creates the commits for the changeset on its codehost. 

#### <a id="executor.pushCommit" href="#executor.pushCommit">func (e *executor) pushCommit(ctx context.Context, opts protocol.CreateCommitFromPatchRequest) error</a>

```
searchKey: reconciler.executor.pushCommit
tags: [method private]
```

```Go
func (e *executor) pushCommit(ctx context.Context, opts protocol.CreateCommitFromPatchRequest) error
```

#### <a id="executor.reopenChangeset" href="#executor.reopenChangeset">func (e *executor) reopenChangeset(ctx context.Context) (err error)</a>

```
searchKey: reconciler.executor.reopenChangeset
tags: [method private]
```

```Go
func (e *executor) reopenChangeset(ctx context.Context) (err error)
```

reopenChangeset reopens the given changeset attribute on the code host. 

#### <a id="executor.sleep" href="#executor.sleep">func (e *executor) sleep()</a>

```
searchKey: reconciler.executor.sleep
tags: [method private]
```

```Go
func (e *executor) sleep()
```

sleep sleeps for 3 seconds. 

#### <a id="executor.syncChangeset" href="#executor.syncChangeset">func (e *executor) syncChangeset(ctx context.Context) error</a>

```
searchKey: reconciler.executor.syncChangeset
tags: [method private]
```

```Go
func (e *executor) syncChangeset(ctx context.Context) error
```

#### <a id="executor.undraftChangeset" href="#executor.undraftChangeset">func (e *executor) undraftChangeset(ctx context.Context) (err error)</a>

```
searchKey: reconciler.executor.undraftChangeset
tags: [method private]
```

```Go
func (e *executor) undraftChangeset(ctx context.Context) (err error)
```

undraftChangeset marks the given changeset on its code host as ready for review. 

#### <a id="executor.updateChangeset" href="#executor.updateChangeset">func (e *executor) updateChangeset(ctx context.Context) (err error)</a>

```
searchKey: reconciler.executor.updateChangeset
tags: [method private]
```

```Go
func (e *executor) updateChangeset(ctx context.Context) (err error)
```

updateChangeset updates the given changeset's attribute on the code host according to its ChangesetSpec and the delta previously computed. 

### <a id="getBatchChanger" href="#getBatchChanger">type getBatchChanger interface</a>

```
searchKey: reconciler.getBatchChanger
tags: [interface private]
```

```Go
type getBatchChanger interface {
	GetBatchChange(ctx context.Context, opts store.GetBatchChangeOpts) (*btypes.BatchChange, error)
}
```

### <a id="getNamespacer" href="#getNamespacer">type getNamespacer interface</a>

```
searchKey: reconciler.getNamespacer
tags: [interface private]
```

```Go
type getNamespacer interface {
	GetByID(ctx context.Context, orgID, userID int32) (*database.Namespace, error)
}
```

### <a id="mockInternalClient" href="#mockInternalClient">type mockInternalClient struct</a>

```
searchKey: reconciler.mockInternalClient
tags: [struct private]
```

```Go
type mockInternalClient struct {
	externalURL string
	err         error
}
```

#### <a id="mockInternalClient.ExternalURL" href="#mockInternalClient.ExternalURL">func (c *mockInternalClient) ExternalURL(ctx context.Context) (string, error)</a>

```
searchKey: reconciler.mockInternalClient.ExternalURL
tags: [method private]
```

```Go
func (c *mockInternalClient) ExternalURL(ctx context.Context) (string, error)
```

### <a id="mockMissingErr" href="#mockMissingErr">type mockMissingErr struct</a>

```
searchKey: reconciler.mockMissingErr
tags: [struct private]
```

```Go
type mockMissingErr struct {
	mockName string
}
```

#### <a id="mockMissingErr.Error" href="#mockMissingErr.Error">func (e mockMissingErr) Error() string</a>

```
searchKey: reconciler.mockMissingErr.Error
tags: [method private]
```

```Go
func (e mockMissingErr) Error() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestBatchChangeURL" href="#TestBatchChangeURL">func TestBatchChangeURL(t *testing.T)</a>

```
searchKey: reconciler.TestBatchChangeURL
tags: [function private test]
```

```Go
func TestBatchChangeURL(t *testing.T)
```

### <a id="TestDecorateChangesetBody" href="#TestDecorateChangesetBody">func TestDecorateChangesetBody(t *testing.T)</a>

```
searchKey: reconciler.TestDecorateChangesetBody
tags: [function private test]
```

```Go
func TestDecorateChangesetBody(t *testing.T)
```

### <a id="TestDetermineReconcilerPlan" href="#TestDetermineReconcilerPlan">func TestDetermineReconcilerPlan(t *testing.T)</a>

```
searchKey: reconciler.TestDetermineReconcilerPlan
tags: [function private test]
```

```Go
func TestDetermineReconcilerPlan(t *testing.T)
```

### <a id="TestExecutor_ExecutePlan" href="#TestExecutor_ExecutePlan">func TestExecutor_ExecutePlan(t *testing.T)</a>

```
searchKey: reconciler.TestExecutor_ExecutePlan
tags: [function private test]
```

```Go
func TestExecutor_ExecutePlan(t *testing.T)
```

### <a id="TestExecutor_ExecutePlan_PublishedChangesetDuplicateBranch" href="#TestExecutor_ExecutePlan_PublishedChangesetDuplicateBranch">func TestExecutor_ExecutePlan_PublishedChangesetDuplicateBranch(t *testing.T)</a>

```
searchKey: reconciler.TestExecutor_ExecutePlan_PublishedChangesetDuplicateBranch
tags: [function private test]
```

```Go
func TestExecutor_ExecutePlan_PublishedChangesetDuplicateBranch(t *testing.T)
```

### <a id="TestExecutor_UserCredentialsForGitserver" href="#TestExecutor_UserCredentialsForGitserver">func TestExecutor_UserCredentialsForGitserver(t *testing.T)</a>

```
searchKey: reconciler.TestExecutor_UserCredentialsForGitserver
tags: [function private test]
```

```Go
func TestExecutor_UserCredentialsForGitserver(t *testing.T)
```

### <a id="TestLoadChangesetSource" href="#TestLoadChangesetSource">func TestLoadChangesetSource(t *testing.T)</a>

```
searchKey: reconciler.TestLoadChangesetSource
tags: [function private test]
```

```Go
func TestLoadChangesetSource(t *testing.T)
```

### <a id="TestNamespaceURL" href="#TestNamespaceURL">func TestNamespaceURL(t *testing.T)</a>

```
searchKey: reconciler.TestNamespaceURL
tags: [function private test]
```

```Go
func TestNamespaceURL(t *testing.T)
```

### <a id="TestReconcilerProcess_IntegrationTest" href="#TestReconcilerProcess_IntegrationTest">func TestReconcilerProcess_IntegrationTest(t *testing.T)</a>

```
searchKey: reconciler.TestReconcilerProcess_IntegrationTest
tags: [function private test]
```

```Go
func TestReconcilerProcess_IntegrationTest(t *testing.T)
```

### <a id="batchChangeURL" href="#batchChangeURL">func batchChangeURL(ctx context.Context, ns *database.Namespace, c *btypes.BatchChange) (string, error)</a>

```
searchKey: reconciler.batchChangeURL
tags: [function private]
```

```Go
func batchChangeURL(ctx context.Context, ns *database.Namespace, c *btypes.BatchChange) (string, error)
```

### <a id="buildCommitOpts" href="#buildCommitOpts">func buildCommitOpts(repo *types.Repo, spec *btypes.ChangesetSpec, pushOpts *protocol.PushConfig) (opts protocol.CreateCommitFromPatchRequest, err error)</a>

```
searchKey: reconciler.buildCommitOpts
tags: [function private]
```

```Go
func buildCommitOpts(repo *types.Repo, spec *btypes.ChangesetSpec, pushOpts *protocol.PushConfig) (opts protocol.CreateCommitFromPatchRequest, err error)
```

### <a id="buildGithubPR" href="#buildGithubPR">func buildGithubPR(now time.Time, externalState btypes.ChangesetExternalState) *github.PullRequest</a>

```
searchKey: reconciler.buildGithubPR
tags: [function private]
```

```Go
func buildGithubPR(now time.Time, externalState btypes.ChangesetExternalState) *github.PullRequest
```

### <a id="decorateChangesetBody" href="#decorateChangesetBody">func decorateChangesetBody(ctx context.Context, tx getBatchChanger, nsStore getNamespacer, cs *sources.Changeset) error</a>

```
searchKey: reconciler.decorateChangesetBody
tags: [function private]
```

```Go
func decorateChangesetBody(ctx context.Context, tx getBatchChanger, nsStore getNamespacer, cs *sources.Changeset) error
```

### <a id="executePlan" href="#executePlan">func executePlan(ctx context.Context, gitserverClient GitserverClient, sourcer sources.Sourcer, noSleepBeforeSync bool, tx *store.Store, plan *Plan) (err error)</a>

```
searchKey: reconciler.executePlan
tags: [function private]
```

```Go
func executePlan(ctx context.Context, gitserverClient GitserverClient, sourcer sources.Sourcer, noSleepBeforeSync bool, tx *store.Store, plan *Plan) (err error)
```

executePlan executes the given reconciler plan. 

### <a id="loadBatchChange" href="#loadBatchChange">func loadBatchChange(ctx context.Context, tx getBatchChanger, id int64) (*btypes.BatchChange, error)</a>

```
searchKey: reconciler.loadBatchChange
tags: [function private]
```

```Go
func loadBatchChange(ctx context.Context, tx getBatchChanger, id int64) (*btypes.BatchChange, error)
```

### <a id="loadChangesetSource" href="#loadChangesetSource">func loadChangesetSource(ctx context.Context, s *store.Store, sourcer sources.Sourcer, ch *btypes.Changeset, repo *types.Repo) (sources.ChangesetSource, error)</a>

```
searchKey: reconciler.loadChangesetSource
tags: [function private]
```

```Go
func loadChangesetSource(ctx context.Context, s *store.Store, sourcer sources.Sourcer, ch *btypes.Changeset, repo *types.Repo) (sources.ChangesetSource, error)
```

### <a id="loadChangesetSpecs" href="#loadChangesetSpecs">func loadChangesetSpecs(ctx context.Context, tx *store.Store, ch *btypes.Changeset) (prev, curr *btypes.ChangesetSpec, err error)</a>

```
searchKey: reconciler.loadChangesetSpecs
tags: [function private]
```

```Go
func loadChangesetSpecs(ctx context.Context, tx *store.Store, ch *btypes.Changeset) (prev, curr *btypes.ChangesetSpec, err error)
```

### <a id="namespaceURL" href="#namespaceURL">func namespaceURL(ns *database.Namespace) string</a>

```
searchKey: reconciler.namespaceURL
tags: [function private]
```

```Go
func namespaceURL(ns *database.Namespace) string
```

### <a id="reopenAfterDetach" href="#reopenAfterDetach">func reopenAfterDetach(ch *btypes.Changeset) bool</a>

```
searchKey: reconciler.reopenAfterDetach
tags: [function private]
```

```Go
func reopenAfterDetach(ch *btypes.Changeset) bool
```

