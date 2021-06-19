# Package reconciler

## Index

* [Variables](#var)
    * [var internalClient](#internalClient)
    * [var operationPrecedence](#operationPrecedence)
* [Types](#type)
    * [type executor struct](#executor)
        * [func (e *executor) Run(ctx context.Context, plan *Plan) (err error)](#executor.Run)
        * [func (e *executor) pushChangesetPatch(ctx context.Context) (err error)](#executor.pushChangesetPatch)
        * [func (e *executor) publishChangeset(ctx context.Context, asDraft bool) (err error)](#executor.publishChangeset)
        * [func (e *executor) syncChangeset(ctx context.Context) error](#executor.syncChangeset)
        * [func (e *executor) importChangeset(ctx context.Context) error](#executor.importChangeset)
        * [func (e *executor) loadChangeset(ctx context.Context) error](#executor.loadChangeset)
        * [func (e *executor) updateChangeset(ctx context.Context) (err error)](#executor.updateChangeset)
        * [func (e *executor) reopenChangeset(ctx context.Context) (err error)](#executor.reopenChangeset)
        * [func (e *executor) detachChangeset()](#executor.detachChangeset)
        * [func (e *executor) archiveChangeset()](#executor.archiveChangeset)
        * [func (e *executor) closeChangeset(ctx context.Context) (err error)](#executor.closeChangeset)
        * [func (e *executor) undraftChangeset(ctx context.Context) (err error)](#executor.undraftChangeset)
        * [func (e *executor) sleep()](#executor.sleep)
        * [func (e *executor) pushCommit(ctx context.Context, opts protocol.CreateCommitFromPatchRequest) error](#executor.pushCommit)
    * [type getBatchChanger interface](#getBatchChanger)
    * [type getNamespacer interface](#getNamespacer)
    * [type errPublishSameBranch struct{}](#errPublishSameBranch)
        * [func (e errPublishSameBranch) Error() string](#errPublishSameBranch.Error)
        * [func (e errPublishSameBranch) NonRetryable() bool](#errPublishSameBranch.NonRetryable)
    * [type errNoSSHCredential struct{}](#errNoSSHCredential)
        * [func (e errNoSSHCredential) Error() string](#errNoSSHCredential.Error)
        * [func (e errNoSSHCredential) NonRetryable() bool](#errNoSSHCredential.NonRetryable)
    * [type errMissingCredentials struct](#errMissingCredentials)
        * [func (e errMissingCredentials) Error() string](#errMissingCredentials.Error)
        * [func (e errMissingCredentials) NonRetryable() bool](#errMissingCredentials.NonRetryable)
        * [func (e errMissingCredentials) Is(target error) bool](#errMissingCredentials.Is)
    * [type errNoPushCredentials struct](#errNoPushCredentials)
        * [func (e errNoPushCredentials) Error() string](#errNoPushCredentials.Error)
        * [func (e errNoPushCredentials) NonRetryable() bool](#errNoPushCredentials.NonRetryable)
    * [type Operations []types.ReconcilerOperation](#Operations)
        * [func (ops Operations) IsNone() bool](#Operations.IsNone)
        * [func (ops Operations) Equal(b Operations) bool](#Operations.Equal)
        * [func (ops Operations) String() string](#Operations.String)
        * [func (ops Operations) ExecutionOrder() []btypes.ReconcilerOperation](#Operations.ExecutionOrder)
    * [type Plan struct](#Plan)
        * [func DeterminePlan(previousSpec, currentSpec *btypes.ChangesetSpec, ch *btypes.Changeset) (*Plan, error)](#DeterminePlan)
        * [func (p *Plan) AddOp(op btypes.ReconcilerOperation)](#Plan.AddOp)
        * [func (p *Plan) SetOp(op btypes.ReconcilerOperation)](#Plan.SetOp)
    * [type ChangesetSpecDelta struct](#ChangesetSpecDelta)
        * [func compareChangesetSpecs(previous, current *btypes.ChangesetSpec) (*ChangesetSpecDelta, error)](#compareChangesetSpecs)
        * [func (d *ChangesetSpecDelta) String() string](#ChangesetSpecDelta.String)
        * [func (d *ChangesetSpecDelta) NeedCommitUpdate() bool](#ChangesetSpecDelta.NeedCommitUpdate)
        * [func (d *ChangesetSpecDelta) NeedCodeHostUpdate() bool](#ChangesetSpecDelta.NeedCodeHostUpdate)
        * [func (d *ChangesetSpecDelta) AttributesChanged() bool](#ChangesetSpecDelta.AttributesChanged)
    * [type GitserverClient interface](#GitserverClient)
    * [type Reconciler struct](#Reconciler)
        * [func New(gitClient GitserverClient, sourcer sources.Sourcer, store *store.Store) *Reconciler](#New)
        * [func (r *Reconciler) HandlerFunc() dbworker.HandlerFunc](#Reconciler.HandlerFunc)
        * [func (r *Reconciler) process(ctx context.Context, tx *store.Store, ch *btypes.Changeset) error](#Reconciler.process)
    * [type mockInternalClient struct](#mockInternalClient)
        * [func (c *mockInternalClient) ExternalURL(ctx context.Context) (string, error)](#mockInternalClient.ExternalURL)
    * [type mockMissingErr struct](#mockMissingErr)
        * [func (e mockMissingErr) Error() string](#mockMissingErr.Error)
    * [type FakeStore struct](#FakeStore)
        * [func (fs *FakeStore) GetBatchChange(ctx context.Context, opts store.GetBatchChangeOpts) (*btypes.BatchChange, error)](#FakeStore.GetBatchChange)
* [Functions](#func)
    * [func executePlan(ctx context.Context, gitserverClient GitserverClient, sourcer sources.Sourcer, noSleepBeforeSync bool, tx *store.Store, plan *Plan) (err error)](#executePlan)
    * [func loadChangesetSource(ctx context.Context, s *store.Store, sourcer sources.Sourcer, ch *btypes.Changeset, repo *types.Repo) (sources.ChangesetSource, error)](#loadChangesetSource)
    * [func buildCommitOpts(repo *types.Repo, spec *btypes.ChangesetSpec, pushOpts *protocol.PushConfig) (opts protocol.CreateCommitFromPatchRequest, err error)](#buildCommitOpts)
    * [func loadBatchChange(ctx context.Context, tx getBatchChanger, id int64) (*btypes.BatchChange, error)](#loadBatchChange)
    * [func decorateChangesetBody(ctx context.Context, tx getBatchChanger, nsStore getNamespacer, cs *sources.Changeset) error](#decorateChangesetBody)
    * [func batchChangeURL(ctx context.Context, ns *database.Namespace, c *btypes.BatchChange) (string, error)](#batchChangeURL)
    * [func namespaceURL(ns *database.Namespace) string](#namespaceURL)
    * [func reopenAfterDetach(ch *btypes.Changeset) bool](#reopenAfterDetach)
    * [func loadChangesetSpecs(ctx context.Context, tx *store.Store, ch *btypes.Changeset) (prev, curr *btypes.ChangesetSpec, err error)](#loadChangesetSpecs)
    * [func TestExecutor_ExecutePlan(t *testing.T)](#TestExecutor_ExecutePlan)
    * [func TestExecutor_ExecutePlan_PublishedChangesetDuplicateBranch(t *testing.T)](#TestExecutor_ExecutePlan_PublishedChangesetDuplicateBranch)
    * [func TestLoadChangesetSource(t *testing.T)](#TestLoadChangesetSource)
    * [func TestExecutor_UserCredentialsForGitserver(t *testing.T)](#TestExecutor_UserCredentialsForGitserver)
    * [func TestDecorateChangesetBody(t *testing.T)](#TestDecorateChangesetBody)
    * [func TestBatchChangeURL(t *testing.T)](#TestBatchChangeURL)
    * [func TestNamespaceURL(t *testing.T)](#TestNamespaceURL)
    * [func buildGithubPR(now time.Time, externalState btypes.ChangesetExternalState) *github.PullRequest](#buildGithubPR)
    * [func TestDetermineReconcilerPlan(t *testing.T)](#TestDetermineReconcilerPlan)
    * [func TestReconcilerProcess_IntegrationTest(t *testing.T)](#TestReconcilerProcess_IntegrationTest)


## <a id="var" href="#var">Variables</a>

### <a id="internalClient" href="#internalClient">var internalClient</a>

```
searchKey: reconciler.internalClient
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
```

```Go
var operationPrecedence = ...
```

## <a id="type" href="#type">Types</a>

### <a id="executor" href="#executor">type executor struct</a>

```
searchKey: reconciler.executor
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
```

```Go
func (e *executor) Run(ctx context.Context, plan *Plan) (err error)
```

#### <a id="executor.pushChangesetPatch" href="#executor.pushChangesetPatch">func (e *executor) pushChangesetPatch(ctx context.Context) (err error)</a>

```
searchKey: reconciler.executor.pushChangesetPatch
```

```Go
func (e *executor) pushChangesetPatch(ctx context.Context) (err error)
```

pushChangesetPatch creates the commits for the changeset on its codehost. 

#### <a id="executor.publishChangeset" href="#executor.publishChangeset">func (e *executor) publishChangeset(ctx context.Context, asDraft bool) (err error)</a>

```
searchKey: reconciler.executor.publishChangeset
```

```Go
func (e *executor) publishChangeset(ctx context.Context, asDraft bool) (err error)
```

publishChangeset creates the given changeset on its code host. 

#### <a id="executor.syncChangeset" href="#executor.syncChangeset">func (e *executor) syncChangeset(ctx context.Context) error</a>

```
searchKey: reconciler.executor.syncChangeset
```

```Go
func (e *executor) syncChangeset(ctx context.Context) error
```

#### <a id="executor.importChangeset" href="#executor.importChangeset">func (e *executor) importChangeset(ctx context.Context) error</a>

```
searchKey: reconciler.executor.importChangeset
```

```Go
func (e *executor) importChangeset(ctx context.Context) error
```

#### <a id="executor.loadChangeset" href="#executor.loadChangeset">func (e *executor) loadChangeset(ctx context.Context) error</a>

```
searchKey: reconciler.executor.loadChangeset
```

```Go
func (e *executor) loadChangeset(ctx context.Context) error
```

#### <a id="executor.updateChangeset" href="#executor.updateChangeset">func (e *executor) updateChangeset(ctx context.Context) (err error)</a>

```
searchKey: reconciler.executor.updateChangeset
```

```Go
func (e *executor) updateChangeset(ctx context.Context) (err error)
```

updateChangeset updates the given changeset's attribute on the code host according to its ChangesetSpec and the delta previously computed. 

#### <a id="executor.reopenChangeset" href="#executor.reopenChangeset">func (e *executor) reopenChangeset(ctx context.Context) (err error)</a>

```
searchKey: reconciler.executor.reopenChangeset
```

```Go
func (e *executor) reopenChangeset(ctx context.Context) (err error)
```

reopenChangeset reopens the given changeset attribute on the code host. 

#### <a id="executor.detachChangeset" href="#executor.detachChangeset">func (e *executor) detachChangeset()</a>

```
searchKey: reconciler.executor.detachChangeset
```

```Go
func (e *executor) detachChangeset()
```

#### <a id="executor.archiveChangeset" href="#executor.archiveChangeset">func (e *executor) archiveChangeset()</a>

```
searchKey: reconciler.executor.archiveChangeset
```

```Go
func (e *executor) archiveChangeset()
```

archiveChangeset sets all associations to archived that are marked as "to-be-archived". 

#### <a id="executor.closeChangeset" href="#executor.closeChangeset">func (e *executor) closeChangeset(ctx context.Context) (err error)</a>

```
searchKey: reconciler.executor.closeChangeset
```

```Go
func (e *executor) closeChangeset(ctx context.Context) (err error)
```

closeChangeset closes the given changeset on its code host if its ExternalState is OPEN or DRAFT. 

#### <a id="executor.undraftChangeset" href="#executor.undraftChangeset">func (e *executor) undraftChangeset(ctx context.Context) (err error)</a>

```
searchKey: reconciler.executor.undraftChangeset
```

```Go
func (e *executor) undraftChangeset(ctx context.Context) (err error)
```

undraftChangeset marks the given changeset on its code host as ready for review. 

#### <a id="executor.sleep" href="#executor.sleep">func (e *executor) sleep()</a>

```
searchKey: reconciler.executor.sleep
```

```Go
func (e *executor) sleep()
```

sleep sleeps for 3 seconds. 

#### <a id="executor.pushCommit" href="#executor.pushCommit">func (e *executor) pushCommit(ctx context.Context, opts protocol.CreateCommitFromPatchRequest) error</a>

```
searchKey: reconciler.executor.pushCommit
```

```Go
func (e *executor) pushCommit(ctx context.Context, opts protocol.CreateCommitFromPatchRequest) error
```

### <a id="getBatchChanger" href="#getBatchChanger">type getBatchChanger interface</a>

```
searchKey: reconciler.getBatchChanger
```

```Go
type getBatchChanger interface {
	GetBatchChange(ctx context.Context, opts store.GetBatchChangeOpts) (*btypes.BatchChange, error)
}
```

### <a id="getNamespacer" href="#getNamespacer">type getNamespacer interface</a>

```
searchKey: reconciler.getNamespacer
```

```Go
type getNamespacer interface {
	GetByID(ctx context.Context, orgID, userID int32) (*database.Namespace, error)
}
```

### <a id="errPublishSameBranch" href="#errPublishSameBranch">type errPublishSameBranch struct{}</a>

```
searchKey: reconciler.errPublishSameBranch
```

```Go
type errPublishSameBranch struct{}
```

errPublishSameBranch is returned by publish changeset if a changeset with the same external branch already exists in the database and is owned by another batch change. It is a terminal error that won't be fixed by retrying to publish the changeset with the same spec. 

#### <a id="errPublishSameBranch.Error" href="#errPublishSameBranch.Error">func (e errPublishSameBranch) Error() string</a>

```
searchKey: reconciler.errPublishSameBranch.Error
```

```Go
func (e errPublishSameBranch) Error() string
```

#### <a id="errPublishSameBranch.NonRetryable" href="#errPublishSameBranch.NonRetryable">func (e errPublishSameBranch) NonRetryable() bool</a>

```
searchKey: reconciler.errPublishSameBranch.NonRetryable
```

```Go
func (e errPublishSameBranch) NonRetryable() bool
```

### <a id="errNoSSHCredential" href="#errNoSSHCredential">type errNoSSHCredential struct{}</a>

```
searchKey: reconciler.errNoSSHCredential
```

```Go
type errNoSSHCredential struct{}
```

errNoSSHCredential is returned, if the  clone URL of the repository uses the ssh:// scheme, but the authenticator doesn't support SSH pushes. 

#### <a id="errNoSSHCredential.Error" href="#errNoSSHCredential.Error">func (e errNoSSHCredential) Error() string</a>

```
searchKey: reconciler.errNoSSHCredential.Error
```

```Go
func (e errNoSSHCredential) Error() string
```

#### <a id="errNoSSHCredential.NonRetryable" href="#errNoSSHCredential.NonRetryable">func (e errNoSSHCredential) NonRetryable() bool</a>

```
searchKey: reconciler.errNoSSHCredential.NonRetryable
```

```Go
func (e errNoSSHCredential) NonRetryable() bool
```

### <a id="errMissingCredentials" href="#errMissingCredentials">type errMissingCredentials struct</a>

```
searchKey: reconciler.errMissingCredentials
```

```Go
type errMissingCredentials struct{ repo string }
```

errMissingCredentials is returned if the user that applied the last batch change /changeset spec doesn't have a user credential for the given repository and is not a site-admin (so no fallback to the global credentials is possible). 

#### <a id="errMissingCredentials.Error" href="#errMissingCredentials.Error">func (e errMissingCredentials) Error() string</a>

```
searchKey: reconciler.errMissingCredentials.Error
```

```Go
func (e errMissingCredentials) Error() string
```

#### <a id="errMissingCredentials.NonRetryable" href="#errMissingCredentials.NonRetryable">func (e errMissingCredentials) NonRetryable() bool</a>

```
searchKey: reconciler.errMissingCredentials.NonRetryable
```

```Go
func (e errMissingCredentials) NonRetryable() bool
```

#### <a id="errMissingCredentials.Is" href="#errMissingCredentials.Is">func (e errMissingCredentials) Is(target error) bool</a>

```
searchKey: reconciler.errMissingCredentials.Is
```

```Go
func (e errMissingCredentials) Is(target error) bool
```

### <a id="errNoPushCredentials" href="#errNoPushCredentials">type errNoPushCredentials struct</a>

```
searchKey: reconciler.errNoPushCredentials
```

```Go
type errNoPushCredentials struct{ credentialsType string }
```

errNoPushCredentials is returned if the authenticator cannot be used by git to authenticate a `git push`. 

#### <a id="errNoPushCredentials.Error" href="#errNoPushCredentials.Error">func (e errNoPushCredentials) Error() string</a>

```
searchKey: reconciler.errNoPushCredentials.Error
```

```Go
func (e errNoPushCredentials) Error() string
```

#### <a id="errNoPushCredentials.NonRetryable" href="#errNoPushCredentials.NonRetryable">func (e errNoPushCredentials) NonRetryable() bool</a>

```
searchKey: reconciler.errNoPushCredentials.NonRetryable
```

```Go
func (e errNoPushCredentials) NonRetryable() bool
```

### <a id="Operations" href="#Operations">type Operations []types.ReconcilerOperation</a>

```
searchKey: reconciler.Operations
tags: [exported]
```

```Go
type Operations []btypes.ReconcilerOperation
```

#### <a id="Operations.IsNone" href="#Operations.IsNone">func (ops Operations) IsNone() bool</a>

```
searchKey: reconciler.Operations.IsNone
tags: [exported]
```

```Go
func (ops Operations) IsNone() bool
```

#### <a id="Operations.Equal" href="#Operations.Equal">func (ops Operations) Equal(b Operations) bool</a>

```
searchKey: reconciler.Operations.Equal
tags: [exported]
```

```Go
func (ops Operations) Equal(b Operations) bool
```

#### <a id="Operations.String" href="#Operations.String">func (ops Operations) String() string</a>

```
searchKey: reconciler.Operations.String
tags: [exported]
```

```Go
func (ops Operations) String() string
```

#### <a id="Operations.ExecutionOrder" href="#Operations.ExecutionOrder">func (ops Operations) ExecutionOrder() []btypes.ReconcilerOperation</a>

```
searchKey: reconciler.Operations.ExecutionOrder
tags: [exported]
```

```Go
func (ops Operations) ExecutionOrder() []btypes.ReconcilerOperation
```

### <a id="Plan" href="#Plan">type Plan struct</a>

```
searchKey: reconciler.Plan
tags: [exported]
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
tags: [exported]
```

```Go
func DeterminePlan(previousSpec, currentSpec *btypes.ChangesetSpec, ch *btypes.Changeset) (*Plan, error)
```

DeterminePlan looks at the given changeset to determine what action the reconciler should take. It consumes the current and the previous changeset spec, if they exist. If the current ChangesetSpec is not applied to a batch change, it returns an error. 

#### <a id="Plan.AddOp" href="#Plan.AddOp">func (p *Plan) AddOp(op btypes.ReconcilerOperation)</a>

```
searchKey: reconciler.Plan.AddOp
tags: [exported]
```

```Go
func (p *Plan) AddOp(op btypes.ReconcilerOperation)
```

#### <a id="Plan.SetOp" href="#Plan.SetOp">func (p *Plan) SetOp(op btypes.ReconcilerOperation)</a>

```
searchKey: reconciler.Plan.SetOp
tags: [exported]
```

```Go
func (p *Plan) SetOp(op btypes.ReconcilerOperation)
```

### <a id="ChangesetSpecDelta" href="#ChangesetSpecDelta">type ChangesetSpecDelta struct</a>

```
searchKey: reconciler.ChangesetSpecDelta
tags: [exported]
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
```

```Go
func compareChangesetSpecs(previous, current *btypes.ChangesetSpec) (*ChangesetSpecDelta, error)
```

#### <a id="ChangesetSpecDelta.String" href="#ChangesetSpecDelta.String">func (d *ChangesetSpecDelta) String() string</a>

```
searchKey: reconciler.ChangesetSpecDelta.String
tags: [exported]
```

```Go
func (d *ChangesetSpecDelta) String() string
```

#### <a id="ChangesetSpecDelta.NeedCommitUpdate" href="#ChangesetSpecDelta.NeedCommitUpdate">func (d *ChangesetSpecDelta) NeedCommitUpdate() bool</a>

```
searchKey: reconciler.ChangesetSpecDelta.NeedCommitUpdate
tags: [exported]
```

```Go
func (d *ChangesetSpecDelta) NeedCommitUpdate() bool
```

#### <a id="ChangesetSpecDelta.NeedCodeHostUpdate" href="#ChangesetSpecDelta.NeedCodeHostUpdate">func (d *ChangesetSpecDelta) NeedCodeHostUpdate() bool</a>

```
searchKey: reconciler.ChangesetSpecDelta.NeedCodeHostUpdate
tags: [exported]
```

```Go
func (d *ChangesetSpecDelta) NeedCodeHostUpdate() bool
```

#### <a id="ChangesetSpecDelta.AttributesChanged" href="#ChangesetSpecDelta.AttributesChanged">func (d *ChangesetSpecDelta) AttributesChanged() bool</a>

```
searchKey: reconciler.ChangesetSpecDelta.AttributesChanged
tags: [exported]
```

```Go
func (d *ChangesetSpecDelta) AttributesChanged() bool
```

### <a id="GitserverClient" href="#GitserverClient">type GitserverClient interface</a>

```
searchKey: reconciler.GitserverClient
tags: [exported]
```

```Go
type GitserverClient interface {
	CreateCommitFromPatch(ctx context.Context, req protocol.CreateCommitFromPatchRequest) (string, error)
}
```

### <a id="Reconciler" href="#Reconciler">type Reconciler struct</a>

```
searchKey: reconciler.Reconciler
tags: [exported]
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
tags: [exported]
```

```Go
func New(gitClient GitserverClient, sourcer sources.Sourcer, store *store.Store) *Reconciler
```

#### <a id="Reconciler.HandlerFunc" href="#Reconciler.HandlerFunc">func (r *Reconciler) HandlerFunc() dbworker.HandlerFunc</a>

```
searchKey: reconciler.Reconciler.HandlerFunc
tags: [exported]
```

```Go
func (r *Reconciler) HandlerFunc() dbworker.HandlerFunc
```

HandlerFunc returns a dbworker.HandlerFunc that can be passed to a workerutil.Worker to process queued changesets. 

#### <a id="Reconciler.process" href="#Reconciler.process">func (r *Reconciler) process(ctx context.Context, tx *store.Store, ch *btypes.Changeset) error</a>

```
searchKey: reconciler.Reconciler.process
```

```Go
func (r *Reconciler) process(ctx context.Context, tx *store.Store, ch *btypes.Changeset) error
```

process is the main entry point of the reconciler and processes changesets that were marked as queued in the database. 

For each changeset, the reconciler computes an execution plan to run to reconcile a possible divergence between the changeset's current state and the desired state (for example expressed in a changeset spec). 

To do that, the reconciler looks at the changeset's current state (publication state, external state, sync state, ...), its (if set) current ChangesetSpec, and (if it exists) its previous ChangesetSpec. 

If an error is returned, the workerutil.Worker that called this function (through the HandlerFunc) will set the changeset's ReconcilerState to errored and set its FailureMessage to the error. 

### <a id="mockInternalClient" href="#mockInternalClient">type mockInternalClient struct</a>

```
searchKey: reconciler.mockInternalClient
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
```

```Go
func (c *mockInternalClient) ExternalURL(ctx context.Context) (string, error)
```

### <a id="mockMissingErr" href="#mockMissingErr">type mockMissingErr struct</a>

```
searchKey: reconciler.mockMissingErr
```

```Go
type mockMissingErr struct {
	mockName string
}
```

#### <a id="mockMissingErr.Error" href="#mockMissingErr.Error">func (e mockMissingErr) Error() string</a>

```
searchKey: reconciler.mockMissingErr.Error
```

```Go
func (e mockMissingErr) Error() string
```

### <a id="FakeStore" href="#FakeStore">type FakeStore struct</a>

```
searchKey: reconciler.FakeStore
```

```Go
type FakeStore struct {
	GetBatchChangeMock func(context.Context, store.GetBatchChangeOpts) (*btypes.BatchChange, error)
}
```

#### <a id="FakeStore.GetBatchChange" href="#FakeStore.GetBatchChange">func (fs *FakeStore) GetBatchChange(ctx context.Context, opts store.GetBatchChangeOpts) (*btypes.BatchChange, error)</a>

```
searchKey: reconciler.FakeStore.GetBatchChange
```

```Go
func (fs *FakeStore) GetBatchChange(ctx context.Context, opts store.GetBatchChangeOpts) (*btypes.BatchChange, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="executePlan" href="#executePlan">func executePlan(ctx context.Context, gitserverClient GitserverClient, sourcer sources.Sourcer, noSleepBeforeSync bool, tx *store.Store, plan *Plan) (err error)</a>

```
searchKey: reconciler.executePlan
```

```Go
func executePlan(ctx context.Context, gitserverClient GitserverClient, sourcer sources.Sourcer, noSleepBeforeSync bool, tx *store.Store, plan *Plan) (err error)
```

executePlan executes the given reconciler plan. 

### <a id="loadChangesetSource" href="#loadChangesetSource">func loadChangesetSource(ctx context.Context, s *store.Store, sourcer sources.Sourcer, ch *btypes.Changeset, repo *types.Repo) (sources.ChangesetSource, error)</a>

```
searchKey: reconciler.loadChangesetSource
```

```Go
func loadChangesetSource(ctx context.Context, s *store.Store, sourcer sources.Sourcer, ch *btypes.Changeset, repo *types.Repo) (sources.ChangesetSource, error)
```

### <a id="buildCommitOpts" href="#buildCommitOpts">func buildCommitOpts(repo *types.Repo, spec *btypes.ChangesetSpec, pushOpts *protocol.PushConfig) (opts protocol.CreateCommitFromPatchRequest, err error)</a>

```
searchKey: reconciler.buildCommitOpts
```

```Go
func buildCommitOpts(repo *types.Repo, spec *btypes.ChangesetSpec, pushOpts *protocol.PushConfig) (opts protocol.CreateCommitFromPatchRequest, err error)
```

### <a id="loadBatchChange" href="#loadBatchChange">func loadBatchChange(ctx context.Context, tx getBatchChanger, id int64) (*btypes.BatchChange, error)</a>

```
searchKey: reconciler.loadBatchChange
```

```Go
func loadBatchChange(ctx context.Context, tx getBatchChanger, id int64) (*btypes.BatchChange, error)
```

### <a id="decorateChangesetBody" href="#decorateChangesetBody">func decorateChangesetBody(ctx context.Context, tx getBatchChanger, nsStore getNamespacer, cs *sources.Changeset) error</a>

```
searchKey: reconciler.decorateChangesetBody
```

```Go
func decorateChangesetBody(ctx context.Context, tx getBatchChanger, nsStore getNamespacer, cs *sources.Changeset) error
```

### <a id="batchChangeURL" href="#batchChangeURL">func batchChangeURL(ctx context.Context, ns *database.Namespace, c *btypes.BatchChange) (string, error)</a>

```
searchKey: reconciler.batchChangeURL
```

```Go
func batchChangeURL(ctx context.Context, ns *database.Namespace, c *btypes.BatchChange) (string, error)
```

### <a id="namespaceURL" href="#namespaceURL">func namespaceURL(ns *database.Namespace) string</a>

```
searchKey: reconciler.namespaceURL
```

```Go
func namespaceURL(ns *database.Namespace) string
```

### <a id="reopenAfterDetach" href="#reopenAfterDetach">func reopenAfterDetach(ch *btypes.Changeset) bool</a>

```
searchKey: reconciler.reopenAfterDetach
```

```Go
func reopenAfterDetach(ch *btypes.Changeset) bool
```

### <a id="loadChangesetSpecs" href="#loadChangesetSpecs">func loadChangesetSpecs(ctx context.Context, tx *store.Store, ch *btypes.Changeset) (prev, curr *btypes.ChangesetSpec, err error)</a>

```
searchKey: reconciler.loadChangesetSpecs
```

```Go
func loadChangesetSpecs(ctx context.Context, tx *store.Store, ch *btypes.Changeset) (prev, curr *btypes.ChangesetSpec, err error)
```

### <a id="TestExecutor_ExecutePlan" href="#TestExecutor_ExecutePlan">func TestExecutor_ExecutePlan(t *testing.T)</a>

```
searchKey: reconciler.TestExecutor_ExecutePlan
```

```Go
func TestExecutor_ExecutePlan(t *testing.T)
```

### <a id="TestExecutor_ExecutePlan_PublishedChangesetDuplicateBranch" href="#TestExecutor_ExecutePlan_PublishedChangesetDuplicateBranch">func TestExecutor_ExecutePlan_PublishedChangesetDuplicateBranch(t *testing.T)</a>

```
searchKey: reconciler.TestExecutor_ExecutePlan_PublishedChangesetDuplicateBranch
```

```Go
func TestExecutor_ExecutePlan_PublishedChangesetDuplicateBranch(t *testing.T)
```

### <a id="TestLoadChangesetSource" href="#TestLoadChangesetSource">func TestLoadChangesetSource(t *testing.T)</a>

```
searchKey: reconciler.TestLoadChangesetSource
```

```Go
func TestLoadChangesetSource(t *testing.T)
```

### <a id="TestExecutor_UserCredentialsForGitserver" href="#TestExecutor_UserCredentialsForGitserver">func TestExecutor_UserCredentialsForGitserver(t *testing.T)</a>

```
searchKey: reconciler.TestExecutor_UserCredentialsForGitserver
```

```Go
func TestExecutor_UserCredentialsForGitserver(t *testing.T)
```

### <a id="TestDecorateChangesetBody" href="#TestDecorateChangesetBody">func TestDecorateChangesetBody(t *testing.T)</a>

```
searchKey: reconciler.TestDecorateChangesetBody
```

```Go
func TestDecorateChangesetBody(t *testing.T)
```

### <a id="TestBatchChangeURL" href="#TestBatchChangeURL">func TestBatchChangeURL(t *testing.T)</a>

```
searchKey: reconciler.TestBatchChangeURL
```

```Go
func TestBatchChangeURL(t *testing.T)
```

### <a id="TestNamespaceURL" href="#TestNamespaceURL">func TestNamespaceURL(t *testing.T)</a>

```
searchKey: reconciler.TestNamespaceURL
```

```Go
func TestNamespaceURL(t *testing.T)
```

### <a id="buildGithubPR" href="#buildGithubPR">func buildGithubPR(now time.Time, externalState btypes.ChangesetExternalState) *github.PullRequest</a>

```
searchKey: reconciler.buildGithubPR
```

```Go
func buildGithubPR(now time.Time, externalState btypes.ChangesetExternalState) *github.PullRequest
```

### <a id="TestDetermineReconcilerPlan" href="#TestDetermineReconcilerPlan">func TestDetermineReconcilerPlan(t *testing.T)</a>

```
searchKey: reconciler.TestDetermineReconcilerPlan
```

```Go
func TestDetermineReconcilerPlan(t *testing.T)
```

### <a id="TestReconcilerProcess_IntegrationTest" href="#TestReconcilerProcess_IntegrationTest">func TestReconcilerProcess_IntegrationTest(t *testing.T)</a>

```
searchKey: reconciler.TestReconcilerProcess_IntegrationTest
```

```Go
func TestReconcilerProcess_IntegrationTest(t *testing.T)
```

