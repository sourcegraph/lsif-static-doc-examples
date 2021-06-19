# Package types

## Index

* Subpages
  * [enterprise/internal/batches/types/scheduler](types/scheduler.md)
* [Constants](#const)
    * [const BatchChangeStateAny](#BatchChangeStateAny)
    * [const BatchChangeStateOpen](#BatchChangeStateOpen)
    * [const BatchChangeStateClosed](#BatchChangeStateClosed)
    * [const BatchSpecTTL](#BatchSpecTTL)
    * [const BulkOperationStateProcessing](#BulkOperationStateProcessing)
    * [const BulkOperationStateFailed](#BulkOperationStateFailed)
    * [const BulkOperationStateCompleted](#BulkOperationStateCompleted)
    * [const ChangesetStateUnpublished](#ChangesetStateUnpublished)
    * [const ChangesetStateScheduled](#ChangesetStateScheduled)
    * [const ChangesetStateProcessing](#ChangesetStateProcessing)
    * [const ChangesetStateOpen](#ChangesetStateOpen)
    * [const ChangesetStateDraft](#ChangesetStateDraft)
    * [const ChangesetStateClosed](#ChangesetStateClosed)
    * [const ChangesetStateMerged](#ChangesetStateMerged)
    * [const ChangesetStateDeleted](#ChangesetStateDeleted)
    * [const ChangesetStateRetrying](#ChangesetStateRetrying)
    * [const ChangesetStateFailed](#ChangesetStateFailed)
    * [const ChangesetPublicationStateUnpublished](#ChangesetPublicationStateUnpublished)
    * [const ChangesetPublicationStatePublished](#ChangesetPublicationStatePublished)
    * [const ReconcilerStateScheduled](#ReconcilerStateScheduled)
    * [const ReconcilerStateQueued](#ReconcilerStateQueued)
    * [const ReconcilerStateProcessing](#ReconcilerStateProcessing)
    * [const ReconcilerStateErrored](#ReconcilerStateErrored)
    * [const ReconcilerStateFailed](#ReconcilerStateFailed)
    * [const ReconcilerStateCompleted](#ReconcilerStateCompleted)
    * [const ChangesetExternalStateDraft](#ChangesetExternalStateDraft)
    * [const ChangesetExternalStateOpen](#ChangesetExternalStateOpen)
    * [const ChangesetExternalStateClosed](#ChangesetExternalStateClosed)
    * [const ChangesetExternalStateMerged](#ChangesetExternalStateMerged)
    * [const ChangesetExternalStateDeleted](#ChangesetExternalStateDeleted)
    * [const ChangesetReviewStateApproved](#ChangesetReviewStateApproved)
    * [const ChangesetReviewStateChangesRequested](#ChangesetReviewStateChangesRequested)
    * [const ChangesetReviewStatePending](#ChangesetReviewStatePending)
    * [const ChangesetReviewStateCommented](#ChangesetReviewStateCommented)
    * [const ChangesetReviewStateDismissed](#ChangesetReviewStateDismissed)
    * [const ChangesetCheckStateUnknown](#ChangesetCheckStateUnknown)
    * [const ChangesetCheckStatePending](#ChangesetCheckStatePending)
    * [const ChangesetCheckStatePassed](#ChangesetCheckStatePassed)
    * [const ChangesetCheckStateFailed](#ChangesetCheckStateFailed)
    * [const ChangesetEventKindGitHubAssigned](#ChangesetEventKindGitHubAssigned)
    * [const ChangesetEventKindGitHubClosed](#ChangesetEventKindGitHubClosed)
    * [const ChangesetEventKindGitHubCommented](#ChangesetEventKindGitHubCommented)
    * [const ChangesetEventKindGitHubRenamedTitle](#ChangesetEventKindGitHubRenamedTitle)
    * [const ChangesetEventKindGitHubMerged](#ChangesetEventKindGitHubMerged)
    * [const ChangesetEventKindGitHubReviewed](#ChangesetEventKindGitHubReviewed)
    * [const ChangesetEventKindGitHubReopened](#ChangesetEventKindGitHubReopened)
    * [const ChangesetEventKindGitHubReviewDismissed](#ChangesetEventKindGitHubReviewDismissed)
    * [const ChangesetEventKindGitHubReviewRequestRemoved](#ChangesetEventKindGitHubReviewRequestRemoved)
    * [const ChangesetEventKindGitHubReviewRequested](#ChangesetEventKindGitHubReviewRequested)
    * [const ChangesetEventKindGitHubReviewCommented](#ChangesetEventKindGitHubReviewCommented)
    * [const ChangesetEventKindGitHubReadyForReview](#ChangesetEventKindGitHubReadyForReview)
    * [const ChangesetEventKindGitHubConvertToDraft](#ChangesetEventKindGitHubConvertToDraft)
    * [const ChangesetEventKindGitHubUnassigned](#ChangesetEventKindGitHubUnassigned)
    * [const ChangesetEventKindGitHubCommit](#ChangesetEventKindGitHubCommit)
    * [const ChangesetEventKindGitHubLabeled](#ChangesetEventKindGitHubLabeled)
    * [const ChangesetEventKindGitHubUnlabeled](#ChangesetEventKindGitHubUnlabeled)
    * [const ChangesetEventKindCommitStatus](#ChangesetEventKindCommitStatus)
    * [const ChangesetEventKindCheckSuite](#ChangesetEventKindCheckSuite)
    * [const ChangesetEventKindCheckRun](#ChangesetEventKindCheckRun)
    * [const ChangesetEventKindBitbucketServerApproved](#ChangesetEventKindBitbucketServerApproved)
    * [const ChangesetEventKindBitbucketServerUnapproved](#ChangesetEventKindBitbucketServerUnapproved)
    * [const ChangesetEventKindBitbucketServerDeclined](#ChangesetEventKindBitbucketServerDeclined)
    * [const ChangesetEventKindBitbucketServerReviewed](#ChangesetEventKindBitbucketServerReviewed)
    * [const ChangesetEventKindBitbucketServerOpened](#ChangesetEventKindBitbucketServerOpened)
    * [const ChangesetEventKindBitbucketServerReopened](#ChangesetEventKindBitbucketServerReopened)
    * [const ChangesetEventKindBitbucketServerRescoped](#ChangesetEventKindBitbucketServerRescoped)
    * [const ChangesetEventKindBitbucketServerUpdated](#ChangesetEventKindBitbucketServerUpdated)
    * [const ChangesetEventKindBitbucketServerCommented](#ChangesetEventKindBitbucketServerCommented)
    * [const ChangesetEventKindBitbucketServerMerged](#ChangesetEventKindBitbucketServerMerged)
    * [const ChangesetEventKindBitbucketServerCommitStatus](#ChangesetEventKindBitbucketServerCommitStatus)
    * [const ChangesetEventKindBitbucketServerDismissed](#ChangesetEventKindBitbucketServerDismissed)
    * [const ChangesetEventKindGitLabApproved](#ChangesetEventKindGitLabApproved)
    * [const ChangesetEventKindGitLabClosed](#ChangesetEventKindGitLabClosed)
    * [const ChangesetEventKindGitLabMerged](#ChangesetEventKindGitLabMerged)
    * [const ChangesetEventKindGitLabPipeline](#ChangesetEventKindGitLabPipeline)
    * [const ChangesetEventKindGitLabReopened](#ChangesetEventKindGitLabReopened)
    * [const ChangesetEventKindGitLabUnapproved](#ChangesetEventKindGitLabUnapproved)
    * [const ChangesetEventKindGitLabMarkWorkInProgress](#ChangesetEventKindGitLabMarkWorkInProgress)
    * [const ChangesetEventKindGitLabUnmarkWorkInProgress](#ChangesetEventKindGitLabUnmarkWorkInProgress)
    * [const ChangesetEventKindInvalid](#ChangesetEventKindInvalid)
    * [const ChangesetJobStateQueued](#ChangesetJobStateQueued)
    * [const ChangesetJobStateProcessing](#ChangesetJobStateProcessing)
    * [const ChangesetJobStateErrored](#ChangesetJobStateErrored)
    * [const ChangesetJobStateFailed](#ChangesetJobStateFailed)
    * [const ChangesetJobStateCompleted](#ChangesetJobStateCompleted)
    * [const ChangesetSpecTTL](#ChangesetSpecTTL)
    * [const ChangesetSpecDescriptionTypeExisting](#ChangesetSpecDescriptionTypeExisting)
    * [const ChangesetSpecDescriptionTypeBranch](#ChangesetSpecDescriptionTypeBranch)
    * [const ReconcilerOperationPush](#ReconcilerOperationPush)
    * [const ReconcilerOperationUpdate](#ReconcilerOperationUpdate)
    * [const ReconcilerOperationUndraft](#ReconcilerOperationUndraft)
    * [const ReconcilerOperationPublish](#ReconcilerOperationPublish)
    * [const ReconcilerOperationPublishDraft](#ReconcilerOperationPublishDraft)
    * [const ReconcilerOperationSync](#ReconcilerOperationSync)
    * [const ReconcilerOperationImport](#ReconcilerOperationImport)
    * [const ReconcilerOperationClose](#ReconcilerOperationClose)
    * [const ReconcilerOperationReopen](#ReconcilerOperationReopen)
    * [const ReconcilerOperationSleep](#ReconcilerOperationSleep)
    * [const ReconcilerOperationDetach](#ReconcilerOperationDetach)
    * [const ReconcilerOperationArchive](#ReconcilerOperationArchive)
    * [const SiteCredentialPlaceholderEncryptionKeyID](#SiteCredentialPlaceholderEncryptionKeyID)
    * [const CodehostCapabilityLabels](#CodehostCapabilityLabels)
    * [const CodehostCapabilityDraftChangesets](#CodehostCapabilityDraftChangesets)
* [Variables](#var)
    * [var ChangesetJobTypeComment](#ChangesetJobTypeComment)
    * [var ChangesetJobTypeDetach](#ChangesetJobTypeDetach)
    * [var ChangesetJobTypeReenqueue](#ChangesetJobTypeReenqueue)
    * [var ChangesetJobTypeMerge](#ChangesetJobTypeMerge)
    * [var ErrHeadBaseMismatch](#ErrHeadBaseMismatch)
    * [var ErrNoCommits](#ErrNoCommits)
    * [var SupportedExternalServices](#SupportedExternalServices)
* [Types](#type)
    * [type BatchChangeState string](#BatchChangeState)
    * [type BatchChange struct](#BatchChange)
        * [func (c *BatchChange) Clone() *BatchChange](#BatchChange.Clone)
        * [func (c *BatchChange) Closed() bool](#BatchChange.Closed)
    * [type BatchSpec struct](#BatchSpec)
        * [func NewBatchSpecFromRaw(rawSpec string) (*BatchSpec, error)](#NewBatchSpecFromRaw)
        * [func (cs *BatchSpec) Clone() *BatchSpec](#BatchSpec.Clone)
        * [func (cs *BatchSpec) UnmarshalValidate() error](#BatchSpec.UnmarshalValidate)
        * [func (cs *BatchSpec) ExpiresAt() time.Time](#BatchSpec.ExpiresAt)
    * [type BatchSpecFields struct](#BatchSpecFields)
    * [type BatchSpecOn struct](#BatchSpecOn)
    * [type BatchSpecStep struct](#BatchSpecStep)
    * [type BatchChangeImportChangeset struct](#BatchChangeImportChangeset)
    * [type ChangesetTemplate struct](#ChangesetTemplate)
    * [type CommitTemplate struct](#CommitTemplate)
    * [type BulkOperationState string](#BulkOperationState)
        * [func (s BulkOperationState) Valid() bool](#BulkOperationState.Valid)
    * [type BulkOperation struct](#BulkOperation)
    * [type BulkOperationError struct](#BulkOperationError)
    * [type ChangesetState string](#ChangesetState)
        * [func (s ChangesetState) Valid() bool](#ChangesetState.Valid)
    * [type ChangesetPublicationState string](#ChangesetPublicationState)
        * [func (s ChangesetPublicationState) Valid() bool](#ChangesetPublicationState.Valid)
        * [func (s ChangesetPublicationState) Published() bool](#ChangesetPublicationState.Published)
        * [func (s ChangesetPublicationState) Unpublished() bool](#ChangesetPublicationState.Unpublished)
    * [type ReconcilerState string](#ReconcilerState)
        * [func (s ReconcilerState) Valid() bool](#ReconcilerState.Valid)
        * [func (s ReconcilerState) ToDB() string](#ReconcilerState.ToDB)
    * [type ChangesetExternalState string](#ChangesetExternalState)
        * [func (s ChangesetExternalState) Valid() bool](#ChangesetExternalState.Valid)
    * [type ChangesetLabel struct](#ChangesetLabel)
    * [type ChangesetReviewState string](#ChangesetReviewState)
        * [func (s ChangesetReviewState) Valid() bool](#ChangesetReviewState.Valid)
    * [type ChangesetCheckState string](#ChangesetCheckState)
        * [func (s ChangesetCheckState) Valid() bool](#ChangesetCheckState.Valid)
    * [type BatchChangeAssoc struct](#BatchChangeAssoc)
    * [type Changeset struct](#Changeset)
        * [func (c *Changeset) RecordID() int](#Changeset.RecordID)
        * [func (c *Changeset) Clone() *Changeset](#Changeset.Clone)
        * [func (c *Changeset) Closeable() bool](#Changeset.Closeable)
        * [func (c *Changeset) Complete() bool](#Changeset.Complete)
        * [func (c *Changeset) Published() bool](#Changeset.Published)
        * [func (c *Changeset) Unpublished() bool](#Changeset.Unpublished)
        * [func (c *Changeset) IsImporting() bool](#Changeset.IsImporting)
        * [func (c *Changeset) SetCurrentSpec(spec *ChangesetSpec)](#Changeset.SetCurrentSpec)
        * [func (c *Changeset) DiffStat() *diff.Stat](#Changeset.DiffStat)
        * [func (c *Changeset) SetDiffStat(stat *diff.Stat)](#Changeset.SetDiffStat)
        * [func (c *Changeset) SetMetadata(meta interface{}) error](#Changeset.SetMetadata)
        * [func (c *Changeset) RemoveBatchChangeID(id int64)](#Changeset.RemoveBatchChangeID)
        * [func (c *Changeset) Title() (string, error)](#Changeset.Title)
        * [func (c *Changeset) AuthorName() (string, error)](#Changeset.AuthorName)
        * [func (c *Changeset) AuthorEmail() (string, error)](#Changeset.AuthorEmail)
        * [func (c *Changeset) ExternalCreatedAt() time.Time](#Changeset.ExternalCreatedAt)
        * [func (c *Changeset) Body() (string, error)](#Changeset.Body)
        * [func (c *Changeset) SetDeleted()](#Changeset.SetDeleted)
        * [func (c *Changeset) IsDeleted() bool](#Changeset.IsDeleted)
        * [func (c *Changeset) HasDiff() bool](#Changeset.HasDiff)
        * [func (c *Changeset) URL() (s string, err error)](#Changeset.URL)
        * [func (c *Changeset) Events() (events []*ChangesetEvent, err error)](#Changeset.Events)
        * [func (c *Changeset) HeadRefOid() (string, error)](#Changeset.HeadRefOid)
        * [func (c *Changeset) HeadRef() (string, error)](#Changeset.HeadRef)
        * [func (c *Changeset) BaseRefOid() (string, error)](#Changeset.BaseRefOid)
        * [func (c *Changeset) BaseRef() (string, error)](#Changeset.BaseRef)
        * [func (c *Changeset) AttachedTo(batchChangeID int64) bool](#Changeset.AttachedTo)
        * [func (c *Changeset) Attach(batchChangeID int64)](#Changeset.Attach)
        * [func (c *Changeset) Detach(batchChangeID int64) bool](#Changeset.Detach)
        * [func (c *Changeset) Archive(batchChangeID int64) bool](#Changeset.Archive)
        * [func (c *Changeset) ArchivedIn(batchChangeID int64) bool](#Changeset.ArchivedIn)
        * [func (c *Changeset) SupportsLabels() bool](#Changeset.SupportsLabels)
        * [func (c *Changeset) SupportsDraft() bool](#Changeset.SupportsDraft)
        * [func (c *Changeset) Labels() []ChangesetLabel](#Changeset.Labels)
        * [func (c *Changeset) ResetReconcilerState(state ReconcilerState)](#Changeset.ResetReconcilerState)
    * [type Changesets []*types.Changeset](#Changesets)
        * [func (cs Changesets) IDs() []int64](#Changesets.IDs)
        * [func (cs Changesets) RepoIDs() []api.RepoID](#Changesets.RepoIDs)
        * [func (cs Changesets) Filter(predicate func(*Changeset) bool) (filtered Changesets)](#Changesets.Filter)
        * [func (cs Changesets) Find(predicate func(*Changeset) bool) *Changeset](#Changesets.Find)
    * [type ChangesetsStats struct](#ChangesetsStats)
    * [type changesetEventUpdateMismatchError struct](#changesetEventUpdateMismatchError)
        * [func (e *changesetEventUpdateMismatchError) Error() string](#changesetEventUpdateMismatchError.Error)
    * [type ChangesetEventKind string](#ChangesetEventKind)
        * [func ChangesetEventKindFor(e interface{}) (ChangesetEventKind, error)](#ChangesetEventKindFor)
    * [type ChangesetEvent struct](#ChangesetEvent)
        * [func (e *ChangesetEvent) Clone() *ChangesetEvent](#ChangesetEvent.Clone)
        * [func (e *ChangesetEvent) ReviewAuthor() string](#ChangesetEvent.ReviewAuthor)
        * [func (e *ChangesetEvent) ReviewState() (ChangesetReviewState, error)](#ChangesetEvent.ReviewState)
        * [func (e *ChangesetEvent) Type() ChangesetEventKind](#ChangesetEvent.Type)
        * [func (e *ChangesetEvent) Changeset() int64](#ChangesetEvent.Changeset)
        * [func (e *ChangesetEvent) Timestamp() time.Time](#ChangesetEvent.Timestamp)
        * [func (e *ChangesetEvent) Update(o *ChangesetEvent) error](#ChangesetEvent.Update)
    * [type ChangesetJobState string](#ChangesetJobState)
        * [func (s ChangesetJobState) Valid() bool](#ChangesetJobState.Valid)
        * [func (s ChangesetJobState) ToDB() string](#ChangesetJobState.ToDB)
    * [type ChangesetJobType string](#ChangesetJobType)
    * [type ChangesetJobCommentPayload struct](#ChangesetJobCommentPayload)
    * [type ChangesetJobDetachPayload struct{}](#ChangesetJobDetachPayload)
    * [type ChangesetJobReenqueuePayload struct{}](#ChangesetJobReenqueuePayload)
    * [type ChangesetJobMergePayload struct](#ChangesetJobMergePayload)
    * [type ChangesetJob struct](#ChangesetJob)
        * [func (j *ChangesetJob) RecordID() int](#ChangesetJob.RecordID)
    * [type ChangesetSpec struct](#ChangesetSpec)
        * [func NewChangesetSpecFromRaw(rawSpec string) (*ChangesetSpec, error)](#NewChangesetSpecFromRaw)
        * [func (cs *ChangesetSpec) Clone() *ChangesetSpec](#ChangesetSpec.Clone)
        * [func (cs *ChangesetSpec) computeDiffStat() error](#ChangesetSpec.computeDiffStat)
        * [func (cs *ChangesetSpec) DiffStat() diff.Stat](#ChangesetSpec.DiffStat)
        * [func (cs *ChangesetSpec) UnmarshalValidate() error](#ChangesetSpec.UnmarshalValidate)
        * [func (cs *ChangesetSpec) ExpiresAt() time.Time](#ChangesetSpec.ExpiresAt)
    * [type GitCommitDescription struct](#GitCommitDescription)
    * [type ChangesetSpecs []*types.ChangesetSpec](#ChangesetSpecs)
        * [func (cs ChangesetSpecs) RepoIDs() []api.RepoID](#ChangesetSpecs.RepoIDs)
    * [type ChangesetSpecDescription struct](#ChangesetSpecDescription)
        * [func (d *ChangesetSpecDescription) Type() ChangesetSpecDescriptionType](#ChangesetSpecDescription.Type)
        * [func (d *ChangesetSpecDescription) IsImportingExisting() bool](#ChangesetSpecDescription.IsImportingExisting)
        * [func (d *ChangesetSpecDescription) IsBranch() bool](#ChangesetSpecDescription.IsBranch)
        * [func (d *ChangesetSpecDescription) Diff() (string, error)](#ChangesetSpecDescription.Diff)
        * [func (d *ChangesetSpecDescription) CommitMessage() (string, error)](#ChangesetSpecDescription.CommitMessage)
        * [func (d *ChangesetSpecDescription) AuthorName() (string, error)](#ChangesetSpecDescription.AuthorName)
        * [func (d *ChangesetSpecDescription) AuthorEmail() (string, error)](#ChangesetSpecDescription.AuthorEmail)
    * [type ChangesetSpecDescriptionType string](#ChangesetSpecDescriptionType)
    * [type CodeHost struct](#CodeHost)
        * [func (c *CodeHost) IsSupported() bool](#CodeHost.IsSupported)
    * [type ReconcilerOperation string](#ReconcilerOperation)
        * [func (r ReconcilerOperation) Valid() bool](#ReconcilerOperation.Valid)
    * [type RewirerMapping struct](#RewirerMapping)
    * [type RewirerMappings []*types.RewirerMapping](#RewirerMappings)
        * [func (rm RewirerMappings) ChangesetIDs() []int64](#RewirerMappings.ChangesetIDs)
        * [func (rm RewirerMappings) ChangesetSpecIDs() []int64](#RewirerMappings.ChangesetSpecIDs)
        * [func (rm RewirerMappings) RepoIDs() []api.RepoID](#RewirerMappings.RepoIDs)
    * [type SiteCredential struct](#SiteCredential)
        * [func (sc *SiteCredential) Authenticator(ctx context.Context) (auth.Authenticator, error)](#SiteCredential.Authenticator)
        * [func (sc *SiteCredential) SetAuthenticator(ctx context.Context, a auth.Authenticator) error](#SiteCredential.SetAuthenticator)
    * [type ChangesetSyncState struct](#ChangesetSyncState)
        * [func (state *ChangesetSyncState) Equals(old *ChangesetSyncState) bool](#ChangesetSyncState.Equals)
    * [type ChangesetSyncData struct](#ChangesetSyncData)
    * [type CodehostCapability string](#CodehostCapability)
    * [type CodehostCapabilities map[types.CodehostCapability]bool](#CodehostCapabilities)
    * [type Keyer interface](#Keyer)
    * [type changesetSyncStateTestCase struct](#changesetSyncStateTestCase)
* [Functions](#func)
    * [func WithCurrentSpecID(id int64) func(*Changeset) bool](#WithCurrentSpecID)
    * [func WithExternalID(id string) func(*Changeset) bool](#WithExternalID)
    * [func NewChangesetEventMetadata(k ChangesetEventKind) (interface{}, error)](#NewChangesetEventMetadata)
    * [func updateGitHubPullRequestReview(e, o *github.PullRequestReview)](#updateGitHubPullRequestReview)
    * [func updateGitHubCommit(e, o *github.Commit)](#updateGitHubCommit)
    * [func init()](#init)
    * [func keyID(ctx context.Context, key encryption.Key) (string, error)](#keyID)
    * [func IsRepoSupported(spec *api.ExternalRepoSpec) bool](#IsRepoSupported)
    * [func IsKindSupported(extSvcKind string) bool](#IsKindSupported)
    * [func ExternalServiceSupports(extSvcType string, capability CodehostCapability) bool](#ExternalServiceSupports)
    * [func unixMilliToTime(ms int64) time.Time](#unixMilliToTime)
    * [func TestBatchSpecUnmarshalValidate(t *testing.T)](#TestBatchSpecUnmarshalValidate)
    * [func TestChangesetEvent(t *testing.T)](#TestChangesetEvent)
    * [func TestChangesetSpecUnmarshalValidate(t *testing.T)](#TestChangesetSpecUnmarshalValidate)
    * [func TestChangeset_Clone(t *testing.T)](#TestChangeset_Clone)
    * [func TestChangeset_DiffStat(t *testing.T)](#TestChangeset_DiffStat)
    * [func TestChangeset_SetMetadata(t *testing.T)](#TestChangeset_SetMetadata)
    * [func TestChangeset_Title(t *testing.T)](#TestChangeset_Title)
    * [func TestChangeset_ExternalCreatedAt(t *testing.T)](#TestChangeset_ExternalCreatedAt)
    * [func TestChangeset_Body(t *testing.T)](#TestChangeset_Body)
    * [func TestChangeset_URL(t *testing.T)](#TestChangeset_URL)
    * [func TestChangeset_HeadRefOid(t *testing.T)](#TestChangeset_HeadRefOid)
    * [func TestChangeset_HeadRef(t *testing.T)](#TestChangeset_HeadRef)
    * [func TestChangeset_BaseRefOid(t *testing.T)](#TestChangeset_BaseRefOid)
    * [func TestChangeset_BaseRef(t *testing.T)](#TestChangeset_BaseRef)
    * [func TestChangeset_Labels(t *testing.T)](#TestChangeset_Labels)
    * [func TestChangesetMetadata(t *testing.T)](#TestChangesetMetadata)
    * [func TestChangeset_ResetReconcilerState(t *testing.T)](#TestChangeset_ResetReconcilerState)
    * [func TestChangesetSyncStateEquals(t *testing.T)](#TestChangesetSyncStateEquals)


## <a id="const" href="#const">Constants</a>

### <a id="BatchChangeStateAny" href="#BatchChangeStateAny">const BatchChangeStateAny</a>

```
searchKey: types.BatchChangeStateAny
tags: [exported]
```

```Go
const BatchChangeStateAny BatchChangeState = "ANY"
```

### <a id="BatchChangeStateOpen" href="#BatchChangeStateOpen">const BatchChangeStateOpen</a>

```
searchKey: types.BatchChangeStateOpen
tags: [exported]
```

```Go
const BatchChangeStateOpen BatchChangeState = "OPEN"
```

### <a id="BatchChangeStateClosed" href="#BatchChangeStateClosed">const BatchChangeStateClosed</a>

```
searchKey: types.BatchChangeStateClosed
tags: [exported]
```

```Go
const BatchChangeStateClosed BatchChangeState = "CLOSED"
```

### <a id="BatchSpecTTL" href="#BatchSpecTTL">const BatchSpecTTL</a>

```
searchKey: types.BatchSpecTTL
tags: [exported]
```

```Go
const BatchSpecTTL = 7 * 24 * time.Hour
```

BatchSpecTTL specifies the TTL of BatchSpecs that haven't been applied yet. It's set to 1 week. 

### <a id="BulkOperationStateProcessing" href="#BulkOperationStateProcessing">const BulkOperationStateProcessing</a>

```
searchKey: types.BulkOperationStateProcessing
tags: [exported]
```

```Go
const BulkOperationStateProcessing BulkOperationState = "PROCESSING"
```

BulkOperationState constants. 

### <a id="BulkOperationStateFailed" href="#BulkOperationStateFailed">const BulkOperationStateFailed</a>

```
searchKey: types.BulkOperationStateFailed
tags: [exported]
```

```Go
const BulkOperationStateFailed BulkOperationState = "FAILED"
```

BulkOperationState constants. 

### <a id="BulkOperationStateCompleted" href="#BulkOperationStateCompleted">const BulkOperationStateCompleted</a>

```
searchKey: types.BulkOperationStateCompleted
tags: [exported]
```

```Go
const BulkOperationStateCompleted BulkOperationState = "COMPLETED"
```

BulkOperationState constants. 

### <a id="ChangesetStateUnpublished" href="#ChangesetStateUnpublished">const ChangesetStateUnpublished</a>

```
searchKey: types.ChangesetStateUnpublished
tags: [exported]
```

```Go
const ChangesetStateUnpublished ChangesetState = "UNPUBLISHED"
```

ChangesetState constants. 

### <a id="ChangesetStateScheduled" href="#ChangesetStateScheduled">const ChangesetStateScheduled</a>

```
searchKey: types.ChangesetStateScheduled
tags: [exported]
```

```Go
const ChangesetStateScheduled ChangesetState = "SCHEDULED"
```

ChangesetState constants. 

### <a id="ChangesetStateProcessing" href="#ChangesetStateProcessing">const ChangesetStateProcessing</a>

```
searchKey: types.ChangesetStateProcessing
tags: [exported]
```

```Go
const ChangesetStateProcessing ChangesetState = "PROCESSING"
```

ChangesetState constants. 

### <a id="ChangesetStateOpen" href="#ChangesetStateOpen">const ChangesetStateOpen</a>

```
searchKey: types.ChangesetStateOpen
tags: [exported]
```

```Go
const ChangesetStateOpen ChangesetState = "OPEN"
```

ChangesetState constants. 

### <a id="ChangesetStateDraft" href="#ChangesetStateDraft">const ChangesetStateDraft</a>

```
searchKey: types.ChangesetStateDraft
tags: [exported]
```

```Go
const ChangesetStateDraft ChangesetState = "DRAFT"
```

ChangesetState constants. 

### <a id="ChangesetStateClosed" href="#ChangesetStateClosed">const ChangesetStateClosed</a>

```
searchKey: types.ChangesetStateClosed
tags: [exported]
```

```Go
const ChangesetStateClosed ChangesetState = "CLOSED"
```

ChangesetState constants. 

### <a id="ChangesetStateMerged" href="#ChangesetStateMerged">const ChangesetStateMerged</a>

```
searchKey: types.ChangesetStateMerged
tags: [exported]
```

```Go
const ChangesetStateMerged ChangesetState = "MERGED"
```

ChangesetState constants. 

### <a id="ChangesetStateDeleted" href="#ChangesetStateDeleted">const ChangesetStateDeleted</a>

```
searchKey: types.ChangesetStateDeleted
tags: [exported]
```

```Go
const ChangesetStateDeleted ChangesetState = "DELETED"
```

ChangesetState constants. 

### <a id="ChangesetStateRetrying" href="#ChangesetStateRetrying">const ChangesetStateRetrying</a>

```
searchKey: types.ChangesetStateRetrying
tags: [exported]
```

```Go
const ChangesetStateRetrying ChangesetState = "RETRYING"
```

ChangesetState constants. 

### <a id="ChangesetStateFailed" href="#ChangesetStateFailed">const ChangesetStateFailed</a>

```
searchKey: types.ChangesetStateFailed
tags: [exported]
```

```Go
const ChangesetStateFailed ChangesetState = "FAILED"
```

ChangesetState constants. 

### <a id="ChangesetPublicationStateUnpublished" href="#ChangesetPublicationStateUnpublished">const ChangesetPublicationStateUnpublished</a>

```
searchKey: types.ChangesetPublicationStateUnpublished
tags: [exported]
```

```Go
const ChangesetPublicationStateUnpublished ChangesetPublicationState = "UNPUBLISHED"
```

ChangesetPublicationState constants. 

### <a id="ChangesetPublicationStatePublished" href="#ChangesetPublicationStatePublished">const ChangesetPublicationStatePublished</a>

```
searchKey: types.ChangesetPublicationStatePublished
tags: [exported]
```

```Go
const ChangesetPublicationStatePublished ChangesetPublicationState = "PUBLISHED"
```

ChangesetPublicationState constants. 

### <a id="ReconcilerStateScheduled" href="#ReconcilerStateScheduled">const ReconcilerStateScheduled</a>

```
searchKey: types.ReconcilerStateScheduled
tags: [exported]
```

```Go
const ReconcilerStateScheduled ReconcilerState = "SCHEDULED"
```

ReconcilerState constants. 

### <a id="ReconcilerStateQueued" href="#ReconcilerStateQueued">const ReconcilerStateQueued</a>

```
searchKey: types.ReconcilerStateQueued
tags: [exported]
```

```Go
const ReconcilerStateQueued ReconcilerState = "QUEUED"
```

ReconcilerState constants. 

### <a id="ReconcilerStateProcessing" href="#ReconcilerStateProcessing">const ReconcilerStateProcessing</a>

```
searchKey: types.ReconcilerStateProcessing
tags: [exported]
```

```Go
const ReconcilerStateProcessing ReconcilerState = "PROCESSING"
```

ReconcilerState constants. 

### <a id="ReconcilerStateErrored" href="#ReconcilerStateErrored">const ReconcilerStateErrored</a>

```
searchKey: types.ReconcilerStateErrored
tags: [exported]
```

```Go
const ReconcilerStateErrored ReconcilerState = "ERRORED"
```

ReconcilerState constants. 

### <a id="ReconcilerStateFailed" href="#ReconcilerStateFailed">const ReconcilerStateFailed</a>

```
searchKey: types.ReconcilerStateFailed
tags: [exported]
```

```Go
const ReconcilerStateFailed ReconcilerState = "FAILED"
```

ReconcilerState constants. 

### <a id="ReconcilerStateCompleted" href="#ReconcilerStateCompleted">const ReconcilerStateCompleted</a>

```
searchKey: types.ReconcilerStateCompleted
tags: [exported]
```

```Go
const ReconcilerStateCompleted ReconcilerState = "COMPLETED"
```

ReconcilerState constants. 

### <a id="ChangesetExternalStateDraft" href="#ChangesetExternalStateDraft">const ChangesetExternalStateDraft</a>

```
searchKey: types.ChangesetExternalStateDraft
tags: [exported]
```

```Go
const ChangesetExternalStateDraft ChangesetExternalState = "DRAFT"
```

ChangesetExternalState constants. 

### <a id="ChangesetExternalStateOpen" href="#ChangesetExternalStateOpen">const ChangesetExternalStateOpen</a>

```
searchKey: types.ChangesetExternalStateOpen
tags: [exported]
```

```Go
const ChangesetExternalStateOpen ChangesetExternalState = "OPEN"
```

ChangesetExternalState constants. 

### <a id="ChangesetExternalStateClosed" href="#ChangesetExternalStateClosed">const ChangesetExternalStateClosed</a>

```
searchKey: types.ChangesetExternalStateClosed
tags: [exported]
```

```Go
const ChangesetExternalStateClosed ChangesetExternalState = "CLOSED"
```

ChangesetExternalState constants. 

### <a id="ChangesetExternalStateMerged" href="#ChangesetExternalStateMerged">const ChangesetExternalStateMerged</a>

```
searchKey: types.ChangesetExternalStateMerged
tags: [exported]
```

```Go
const ChangesetExternalStateMerged ChangesetExternalState = "MERGED"
```

ChangesetExternalState constants. 

### <a id="ChangesetExternalStateDeleted" href="#ChangesetExternalStateDeleted">const ChangesetExternalStateDeleted</a>

```
searchKey: types.ChangesetExternalStateDeleted
tags: [exported]
```

```Go
const ChangesetExternalStateDeleted ChangesetExternalState = "DELETED"
```

ChangesetExternalState constants. 

### <a id="ChangesetReviewStateApproved" href="#ChangesetReviewStateApproved">const ChangesetReviewStateApproved</a>

```
searchKey: types.ChangesetReviewStateApproved
tags: [exported]
```

```Go
const ChangesetReviewStateApproved ChangesetReviewState = "APPROVED"
```

ChangesetReviewState constants. 

### <a id="ChangesetReviewStateChangesRequested" href="#ChangesetReviewStateChangesRequested">const ChangesetReviewStateChangesRequested</a>

```
searchKey: types.ChangesetReviewStateChangesRequested
tags: [exported]
```

```Go
const ChangesetReviewStateChangesRequested ChangesetReviewState = "CHANGES_REQUESTED"
```

ChangesetReviewState constants. 

### <a id="ChangesetReviewStatePending" href="#ChangesetReviewStatePending">const ChangesetReviewStatePending</a>

```
searchKey: types.ChangesetReviewStatePending
tags: [exported]
```

```Go
const ChangesetReviewStatePending ChangesetReviewState = "PENDING"
```

ChangesetReviewState constants. 

### <a id="ChangesetReviewStateCommented" href="#ChangesetReviewStateCommented">const ChangesetReviewStateCommented</a>

```
searchKey: types.ChangesetReviewStateCommented
tags: [exported]
```

```Go
const ChangesetReviewStateCommented ChangesetReviewState = "COMMENTED"
```

ChangesetReviewState constants. 

### <a id="ChangesetReviewStateDismissed" href="#ChangesetReviewStateDismissed">const ChangesetReviewStateDismissed</a>

```
searchKey: types.ChangesetReviewStateDismissed
tags: [exported]
```

```Go
const ChangesetReviewStateDismissed ChangesetReviewState = "DISMISSED"
```

ChangesetReviewState constants. 

### <a id="ChangesetCheckStateUnknown" href="#ChangesetCheckStateUnknown">const ChangesetCheckStateUnknown</a>

```
searchKey: types.ChangesetCheckStateUnknown
tags: [exported]
```

```Go
const ChangesetCheckStateUnknown ChangesetCheckState = "UNKNOWN"
```

### <a id="ChangesetCheckStatePending" href="#ChangesetCheckStatePending">const ChangesetCheckStatePending</a>

```
searchKey: types.ChangesetCheckStatePending
tags: [exported]
```

```Go
const ChangesetCheckStatePending ChangesetCheckState = "PENDING"
```

### <a id="ChangesetCheckStatePassed" href="#ChangesetCheckStatePassed">const ChangesetCheckStatePassed</a>

```
searchKey: types.ChangesetCheckStatePassed
tags: [exported]
```

```Go
const ChangesetCheckStatePassed ChangesetCheckState = "PASSED"
```

### <a id="ChangesetCheckStateFailed" href="#ChangesetCheckStateFailed">const ChangesetCheckStateFailed</a>

```
searchKey: types.ChangesetCheckStateFailed
tags: [exported]
```

```Go
const ChangesetCheckStateFailed ChangesetCheckState = "FAILED"
```

### <a id="ChangesetEventKindGitHubAssigned" href="#ChangesetEventKindGitHubAssigned">const ChangesetEventKindGitHubAssigned</a>

```
searchKey: types.ChangesetEventKindGitHubAssigned
tags: [exported]
```

```Go
const ChangesetEventKindGitHubAssigned ChangesetEventKind = "github:assigned"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitHubClosed" href="#ChangesetEventKindGitHubClosed">const ChangesetEventKindGitHubClosed</a>

```
searchKey: types.ChangesetEventKindGitHubClosed
tags: [exported]
```

```Go
const ChangesetEventKindGitHubClosed ChangesetEventKind = "github:closed"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitHubCommented" href="#ChangesetEventKindGitHubCommented">const ChangesetEventKindGitHubCommented</a>

```
searchKey: types.ChangesetEventKindGitHubCommented
tags: [exported]
```

```Go
const ChangesetEventKindGitHubCommented ChangesetEventKind = "github:commented"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitHubRenamedTitle" href="#ChangesetEventKindGitHubRenamedTitle">const ChangesetEventKindGitHubRenamedTitle</a>

```
searchKey: types.ChangesetEventKindGitHubRenamedTitle
tags: [exported]
```

```Go
const ChangesetEventKindGitHubRenamedTitle ChangesetEventKind = "github:renamed"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitHubMerged" href="#ChangesetEventKindGitHubMerged">const ChangesetEventKindGitHubMerged</a>

```
searchKey: types.ChangesetEventKindGitHubMerged
tags: [exported]
```

```Go
const ChangesetEventKindGitHubMerged ChangesetEventKind = "github:merged"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitHubReviewed" href="#ChangesetEventKindGitHubReviewed">const ChangesetEventKindGitHubReviewed</a>

```
searchKey: types.ChangesetEventKindGitHubReviewed
tags: [exported]
```

```Go
const ChangesetEventKindGitHubReviewed ChangesetEventKind = "github:reviewed"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitHubReopened" href="#ChangesetEventKindGitHubReopened">const ChangesetEventKindGitHubReopened</a>

```
searchKey: types.ChangesetEventKindGitHubReopened
tags: [exported]
```

```Go
const ChangesetEventKindGitHubReopened ChangesetEventKind = "github:reopened"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitHubReviewDismissed" href="#ChangesetEventKindGitHubReviewDismissed">const ChangesetEventKindGitHubReviewDismissed</a>

```
searchKey: types.ChangesetEventKindGitHubReviewDismissed
tags: [exported]
```

```Go
const ChangesetEventKindGitHubReviewDismissed ChangesetEventKind = "github:review_dismissed"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitHubReviewRequestRemoved" href="#ChangesetEventKindGitHubReviewRequestRemoved">const ChangesetEventKindGitHubReviewRequestRemoved</a>

```
searchKey: types.ChangesetEventKindGitHubReviewRequestRemoved
tags: [exported]
```

```Go
const ChangesetEventKindGitHubReviewRequestRemoved ChangesetEventKind = ...
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitHubReviewRequested" href="#ChangesetEventKindGitHubReviewRequested">const ChangesetEventKindGitHubReviewRequested</a>

```
searchKey: types.ChangesetEventKindGitHubReviewRequested
tags: [exported]
```

```Go
const ChangesetEventKindGitHubReviewRequested ChangesetEventKind = "github:review_requested"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitHubReviewCommented" href="#ChangesetEventKindGitHubReviewCommented">const ChangesetEventKindGitHubReviewCommented</a>

```
searchKey: types.ChangesetEventKindGitHubReviewCommented
tags: [exported]
```

```Go
const ChangesetEventKindGitHubReviewCommented ChangesetEventKind = "github:review_commented"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitHubReadyForReview" href="#ChangesetEventKindGitHubReadyForReview">const ChangesetEventKindGitHubReadyForReview</a>

```
searchKey: types.ChangesetEventKindGitHubReadyForReview
tags: [exported]
```

```Go
const ChangesetEventKindGitHubReadyForReview ChangesetEventKind = "github:ready_for_review"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitHubConvertToDraft" href="#ChangesetEventKindGitHubConvertToDraft">const ChangesetEventKindGitHubConvertToDraft</a>

```
searchKey: types.ChangesetEventKindGitHubConvertToDraft
tags: [exported]
```

```Go
const ChangesetEventKindGitHubConvertToDraft ChangesetEventKind = "github:convert_to_draft"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitHubUnassigned" href="#ChangesetEventKindGitHubUnassigned">const ChangesetEventKindGitHubUnassigned</a>

```
searchKey: types.ChangesetEventKindGitHubUnassigned
tags: [exported]
```

```Go
const ChangesetEventKindGitHubUnassigned ChangesetEventKind = "github:unassigned"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitHubCommit" href="#ChangesetEventKindGitHubCommit">const ChangesetEventKindGitHubCommit</a>

```
searchKey: types.ChangesetEventKindGitHubCommit
tags: [exported]
```

```Go
const ChangesetEventKindGitHubCommit ChangesetEventKind = "github:commit"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitHubLabeled" href="#ChangesetEventKindGitHubLabeled">const ChangesetEventKindGitHubLabeled</a>

```
searchKey: types.ChangesetEventKindGitHubLabeled
tags: [exported]
```

```Go
const ChangesetEventKindGitHubLabeled ChangesetEventKind = "github:labeled"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitHubUnlabeled" href="#ChangesetEventKindGitHubUnlabeled">const ChangesetEventKindGitHubUnlabeled</a>

```
searchKey: types.ChangesetEventKindGitHubUnlabeled
tags: [exported]
```

```Go
const ChangesetEventKindGitHubUnlabeled ChangesetEventKind = "github:unlabeled"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindCommitStatus" href="#ChangesetEventKindCommitStatus">const ChangesetEventKindCommitStatus</a>

```
searchKey: types.ChangesetEventKindCommitStatus
tags: [exported]
```

```Go
const ChangesetEventKindCommitStatus ChangesetEventKind = "github:commit_status"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindCheckSuite" href="#ChangesetEventKindCheckSuite">const ChangesetEventKindCheckSuite</a>

```
searchKey: types.ChangesetEventKindCheckSuite
tags: [exported]
```

```Go
const ChangesetEventKindCheckSuite ChangesetEventKind = "github:check_suite"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindCheckRun" href="#ChangesetEventKindCheckRun">const ChangesetEventKindCheckRun</a>

```
searchKey: types.ChangesetEventKindCheckRun
tags: [exported]
```

```Go
const ChangesetEventKindCheckRun ChangesetEventKind = "github:check_run"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindBitbucketServerApproved" href="#ChangesetEventKindBitbucketServerApproved">const ChangesetEventKindBitbucketServerApproved</a>

```
searchKey: types.ChangesetEventKindBitbucketServerApproved
tags: [exported]
```

```Go
const ChangesetEventKindBitbucketServerApproved ChangesetEventKind = "bitbucketserver:approved"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindBitbucketServerUnapproved" href="#ChangesetEventKindBitbucketServerUnapproved">const ChangesetEventKindBitbucketServerUnapproved</a>

```
searchKey: types.ChangesetEventKindBitbucketServerUnapproved
tags: [exported]
```

```Go
const ChangesetEventKindBitbucketServerUnapproved ChangesetEventKind = "bitbucketserver:unapproved"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindBitbucketServerDeclined" href="#ChangesetEventKindBitbucketServerDeclined">const ChangesetEventKindBitbucketServerDeclined</a>

```
searchKey: types.ChangesetEventKindBitbucketServerDeclined
tags: [exported]
```

```Go
const ChangesetEventKindBitbucketServerDeclined ChangesetEventKind = "bitbucketserver:declined"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindBitbucketServerReviewed" href="#ChangesetEventKindBitbucketServerReviewed">const ChangesetEventKindBitbucketServerReviewed</a>

```
searchKey: types.ChangesetEventKindBitbucketServerReviewed
tags: [exported]
```

```Go
const ChangesetEventKindBitbucketServerReviewed ChangesetEventKind = "bitbucketserver:reviewed"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindBitbucketServerOpened" href="#ChangesetEventKindBitbucketServerOpened">const ChangesetEventKindBitbucketServerOpened</a>

```
searchKey: types.ChangesetEventKindBitbucketServerOpened
tags: [exported]
```

```Go
const ChangesetEventKindBitbucketServerOpened ChangesetEventKind = "bitbucketserver:opened"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindBitbucketServerReopened" href="#ChangesetEventKindBitbucketServerReopened">const ChangesetEventKindBitbucketServerReopened</a>

```
searchKey: types.ChangesetEventKindBitbucketServerReopened
tags: [exported]
```

```Go
const ChangesetEventKindBitbucketServerReopened ChangesetEventKind = "bitbucketserver:reopened"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindBitbucketServerRescoped" href="#ChangesetEventKindBitbucketServerRescoped">const ChangesetEventKindBitbucketServerRescoped</a>

```
searchKey: types.ChangesetEventKindBitbucketServerRescoped
tags: [exported]
```

```Go
const ChangesetEventKindBitbucketServerRescoped ChangesetEventKind = "bitbucketserver:rescoped"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindBitbucketServerUpdated" href="#ChangesetEventKindBitbucketServerUpdated">const ChangesetEventKindBitbucketServerUpdated</a>

```
searchKey: types.ChangesetEventKindBitbucketServerUpdated
tags: [exported]
```

```Go
const ChangesetEventKindBitbucketServerUpdated ChangesetEventKind = "bitbucketserver:updated"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindBitbucketServerCommented" href="#ChangesetEventKindBitbucketServerCommented">const ChangesetEventKindBitbucketServerCommented</a>

```
searchKey: types.ChangesetEventKindBitbucketServerCommented
tags: [exported]
```

```Go
const ChangesetEventKindBitbucketServerCommented ChangesetEventKind = "bitbucketserver:commented"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindBitbucketServerMerged" href="#ChangesetEventKindBitbucketServerMerged">const ChangesetEventKindBitbucketServerMerged</a>

```
searchKey: types.ChangesetEventKindBitbucketServerMerged
tags: [exported]
```

```Go
const ChangesetEventKindBitbucketServerMerged ChangesetEventKind = "bitbucketserver:merged"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindBitbucketServerCommitStatus" href="#ChangesetEventKindBitbucketServerCommitStatus">const ChangesetEventKindBitbucketServerCommitStatus</a>

```
searchKey: types.ChangesetEventKindBitbucketServerCommitStatus
tags: [exported]
```

```Go
const ChangesetEventKindBitbucketServerCommitStatus ChangesetEventKind = ...
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindBitbucketServerDismissed" href="#ChangesetEventKindBitbucketServerDismissed">const ChangesetEventKindBitbucketServerDismissed</a>

```
searchKey: types.ChangesetEventKindBitbucketServerDismissed
tags: [exported]
```

```Go
const ChangesetEventKindBitbucketServerDismissed ChangesetEventKind = ...
```

Valid ChangesetEvent kinds 

BitbucketServer calls this an Unapprove event but we've called it Dismissed to more clearly convey that it only occurs when a request for changes has been dismissed. 

### <a id="ChangesetEventKindGitLabApproved" href="#ChangesetEventKindGitLabApproved">const ChangesetEventKindGitLabApproved</a>

```
searchKey: types.ChangesetEventKindGitLabApproved
tags: [exported]
```

```Go
const ChangesetEventKindGitLabApproved ChangesetEventKind = "gitlab:approved"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitLabClosed" href="#ChangesetEventKindGitLabClosed">const ChangesetEventKindGitLabClosed</a>

```
searchKey: types.ChangesetEventKindGitLabClosed
tags: [exported]
```

```Go
const ChangesetEventKindGitLabClosed ChangesetEventKind = "gitlab:closed"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitLabMerged" href="#ChangesetEventKindGitLabMerged">const ChangesetEventKindGitLabMerged</a>

```
searchKey: types.ChangesetEventKindGitLabMerged
tags: [exported]
```

```Go
const ChangesetEventKindGitLabMerged ChangesetEventKind = "gitlab:merged"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitLabPipeline" href="#ChangesetEventKindGitLabPipeline">const ChangesetEventKindGitLabPipeline</a>

```
searchKey: types.ChangesetEventKindGitLabPipeline
tags: [exported]
```

```Go
const ChangesetEventKindGitLabPipeline ChangesetEventKind = "gitlab:pipeline"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitLabReopened" href="#ChangesetEventKindGitLabReopened">const ChangesetEventKindGitLabReopened</a>

```
searchKey: types.ChangesetEventKindGitLabReopened
tags: [exported]
```

```Go
const ChangesetEventKindGitLabReopened ChangesetEventKind = "gitlab:reopened"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitLabUnapproved" href="#ChangesetEventKindGitLabUnapproved">const ChangesetEventKindGitLabUnapproved</a>

```
searchKey: types.ChangesetEventKindGitLabUnapproved
tags: [exported]
```

```Go
const ChangesetEventKindGitLabUnapproved ChangesetEventKind = "gitlab:unapproved"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitLabMarkWorkInProgress" href="#ChangesetEventKindGitLabMarkWorkInProgress">const ChangesetEventKindGitLabMarkWorkInProgress</a>

```
searchKey: types.ChangesetEventKindGitLabMarkWorkInProgress
tags: [exported]
```

```Go
const ChangesetEventKindGitLabMarkWorkInProgress ChangesetEventKind = "gitlab:mark_wip"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindGitLabUnmarkWorkInProgress" href="#ChangesetEventKindGitLabUnmarkWorkInProgress">const ChangesetEventKindGitLabUnmarkWorkInProgress</a>

```
searchKey: types.ChangesetEventKindGitLabUnmarkWorkInProgress
tags: [exported]
```

```Go
const ChangesetEventKindGitLabUnmarkWorkInProgress ChangesetEventKind = "gitlab:unmark_wip"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetEventKindInvalid" href="#ChangesetEventKindInvalid">const ChangesetEventKindInvalid</a>

```
searchKey: types.ChangesetEventKindInvalid
tags: [exported]
```

```Go
const ChangesetEventKindInvalid ChangesetEventKind = "invalid"
```

Valid ChangesetEvent kinds 

### <a id="ChangesetJobStateQueued" href="#ChangesetJobStateQueued">const ChangesetJobStateQueued</a>

```
searchKey: types.ChangesetJobStateQueued
tags: [exported]
```

```Go
const ChangesetJobStateQueued ChangesetJobState = "QUEUED"
```

ChangesetJobState constants. 

### <a id="ChangesetJobStateProcessing" href="#ChangesetJobStateProcessing">const ChangesetJobStateProcessing</a>

```
searchKey: types.ChangesetJobStateProcessing
tags: [exported]
```

```Go
const ChangesetJobStateProcessing ChangesetJobState = "PROCESSING"
```

ChangesetJobState constants. 

### <a id="ChangesetJobStateErrored" href="#ChangesetJobStateErrored">const ChangesetJobStateErrored</a>

```
searchKey: types.ChangesetJobStateErrored
tags: [exported]
```

```Go
const ChangesetJobStateErrored ChangesetJobState = "ERRORED"
```

ChangesetJobState constants. 

### <a id="ChangesetJobStateFailed" href="#ChangesetJobStateFailed">const ChangesetJobStateFailed</a>

```
searchKey: types.ChangesetJobStateFailed
tags: [exported]
```

```Go
const ChangesetJobStateFailed ChangesetJobState = "FAILED"
```

ChangesetJobState constants. 

### <a id="ChangesetJobStateCompleted" href="#ChangesetJobStateCompleted">const ChangesetJobStateCompleted</a>

```
searchKey: types.ChangesetJobStateCompleted
tags: [exported]
```

```Go
const ChangesetJobStateCompleted ChangesetJobState = "COMPLETED"
```

ChangesetJobState constants. 

### <a id="ChangesetSpecTTL" href="#ChangesetSpecTTL">const ChangesetSpecTTL</a>

```
searchKey: types.ChangesetSpecTTL
tags: [exported]
```

```Go
const ChangesetSpecTTL = 2 * 24 * time.Hour
```

ChangesetSpecTTL specifies the TTL of ChangesetSpecs that haven't been attached to a BatchSpec. It's lower than BatchSpecTTL because ChangesetSpecs should be attached to a BatchSpec immediately after having been created, whereas a BatchSpec might take a while to be complete and might also go through a lengthy review phase. 

### <a id="ChangesetSpecDescriptionTypeExisting" href="#ChangesetSpecDescriptionTypeExisting">const ChangesetSpecDescriptionTypeExisting</a>

```
searchKey: types.ChangesetSpecDescriptionTypeExisting
tags: [exported]
```

```Go
const ChangesetSpecDescriptionTypeExisting ChangesetSpecDescriptionType = "EXISTING"
```

Valid ChangesetSpecDescriptionTypes kinds 

### <a id="ChangesetSpecDescriptionTypeBranch" href="#ChangesetSpecDescriptionTypeBranch">const ChangesetSpecDescriptionTypeBranch</a>

```
searchKey: types.ChangesetSpecDescriptionTypeBranch
tags: [exported]
```

```Go
const ChangesetSpecDescriptionTypeBranch ChangesetSpecDescriptionType = "BRANCH"
```

Valid ChangesetSpecDescriptionTypes kinds 

### <a id="ReconcilerOperationPush" href="#ReconcilerOperationPush">const ReconcilerOperationPush</a>

```
searchKey: types.ReconcilerOperationPush
tags: [exported]
```

```Go
const ReconcilerOperationPush ReconcilerOperation = "PUSH"
```

### <a id="ReconcilerOperationUpdate" href="#ReconcilerOperationUpdate">const ReconcilerOperationUpdate</a>

```
searchKey: types.ReconcilerOperationUpdate
tags: [exported]
```

```Go
const ReconcilerOperationUpdate ReconcilerOperation = "UPDATE"
```

### <a id="ReconcilerOperationUndraft" href="#ReconcilerOperationUndraft">const ReconcilerOperationUndraft</a>

```
searchKey: types.ReconcilerOperationUndraft
tags: [exported]
```

```Go
const ReconcilerOperationUndraft ReconcilerOperation = "UNDRAFT"
```

### <a id="ReconcilerOperationPublish" href="#ReconcilerOperationPublish">const ReconcilerOperationPublish</a>

```
searchKey: types.ReconcilerOperationPublish
tags: [exported]
```

```Go
const ReconcilerOperationPublish ReconcilerOperation = "PUBLISH"
```

### <a id="ReconcilerOperationPublishDraft" href="#ReconcilerOperationPublishDraft">const ReconcilerOperationPublishDraft</a>

```
searchKey: types.ReconcilerOperationPublishDraft
tags: [exported]
```

```Go
const ReconcilerOperationPublishDraft ReconcilerOperation = "PUBLISH_DRAFT"
```

### <a id="ReconcilerOperationSync" href="#ReconcilerOperationSync">const ReconcilerOperationSync</a>

```
searchKey: types.ReconcilerOperationSync
tags: [exported]
```

```Go
const ReconcilerOperationSync ReconcilerOperation = "SYNC"
```

### <a id="ReconcilerOperationImport" href="#ReconcilerOperationImport">const ReconcilerOperationImport</a>

```
searchKey: types.ReconcilerOperationImport
tags: [exported]
```

```Go
const ReconcilerOperationImport ReconcilerOperation = "IMPORT"
```

### <a id="ReconcilerOperationClose" href="#ReconcilerOperationClose">const ReconcilerOperationClose</a>

```
searchKey: types.ReconcilerOperationClose
tags: [exported]
```

```Go
const ReconcilerOperationClose ReconcilerOperation = "CLOSE"
```

### <a id="ReconcilerOperationReopen" href="#ReconcilerOperationReopen">const ReconcilerOperationReopen</a>

```
searchKey: types.ReconcilerOperationReopen
tags: [exported]
```

```Go
const ReconcilerOperationReopen ReconcilerOperation = "REOPEN"
```

### <a id="ReconcilerOperationSleep" href="#ReconcilerOperationSleep">const ReconcilerOperationSleep</a>

```
searchKey: types.ReconcilerOperationSleep
tags: [exported]
```

```Go
const ReconcilerOperationSleep ReconcilerOperation = "SLEEP"
```

### <a id="ReconcilerOperationDetach" href="#ReconcilerOperationDetach">const ReconcilerOperationDetach</a>

```
searchKey: types.ReconcilerOperationDetach
tags: [exported]
```

```Go
const ReconcilerOperationDetach ReconcilerOperation = "DETACH"
```

### <a id="ReconcilerOperationArchive" href="#ReconcilerOperationArchive">const ReconcilerOperationArchive</a>

```
searchKey: types.ReconcilerOperationArchive
tags: [exported]
```

```Go
const ReconcilerOperationArchive ReconcilerOperation = "ARCHIVE"
```

### <a id="SiteCredentialPlaceholderEncryptionKeyID" href="#SiteCredentialPlaceholderEncryptionKeyID">const SiteCredentialPlaceholderEncryptionKeyID</a>

```
searchKey: types.SiteCredentialPlaceholderEncryptionKeyID
tags: [exported]
```

```Go
const SiteCredentialPlaceholderEncryptionKeyID = "previously-migrated"
```

### <a id="CodehostCapabilityLabels" href="#CodehostCapabilityLabels">const CodehostCapabilityLabels</a>

```
searchKey: types.CodehostCapabilityLabels
tags: [exported]
```

```Go
const CodehostCapabilityLabels CodehostCapability = "Labels"
```

### <a id="CodehostCapabilityDraftChangesets" href="#CodehostCapabilityDraftChangesets">const CodehostCapabilityDraftChangesets</a>

```
searchKey: types.CodehostCapabilityDraftChangesets
tags: [exported]
```

```Go
const CodehostCapabilityDraftChangesets CodehostCapability = "DraftChangesets"
```

## <a id="var" href="#var">Variables</a>

### <a id="ChangesetJobTypeComment" href="#ChangesetJobTypeComment">var ChangesetJobTypeComment</a>

```
searchKey: types.ChangesetJobTypeComment
tags: [exported]
```

```Go
var ChangesetJobTypeComment ChangesetJobType = "commentatore"
```

### <a id="ChangesetJobTypeDetach" href="#ChangesetJobTypeDetach">var ChangesetJobTypeDetach</a>

```
searchKey: types.ChangesetJobTypeDetach
tags: [exported]
```

```Go
var ChangesetJobTypeDetach ChangesetJobType = "detach"
```

### <a id="ChangesetJobTypeReenqueue" href="#ChangesetJobTypeReenqueue">var ChangesetJobTypeReenqueue</a>

```
searchKey: types.ChangesetJobTypeReenqueue
tags: [exported]
```

```Go
var ChangesetJobTypeReenqueue ChangesetJobType = "reenqueue"
```

### <a id="ChangesetJobTypeMerge" href="#ChangesetJobTypeMerge">var ChangesetJobTypeMerge</a>

```
searchKey: types.ChangesetJobTypeMerge
tags: [exported]
```

```Go
var ChangesetJobTypeMerge ChangesetJobType = "merge"
```

### <a id="ErrHeadBaseMismatch" href="#ErrHeadBaseMismatch">var ErrHeadBaseMismatch</a>

```
searchKey: types.ErrHeadBaseMismatch
tags: [exported]
```

```Go
var ErrHeadBaseMismatch = errors.New("headRepository does not match baseRepository")
```

ErrHeadBaseMismatch is returned by (*ChangesetSpec).UnmarshalValidate() if the head and base repositories do not match (a case which we do not support yet). 

### <a id="ErrNoCommits" href="#ErrNoCommits">var ErrNoCommits</a>

```
searchKey: types.ErrNoCommits
tags: [exported]
```

```Go
var ErrNoCommits = errors.New("changeset description doesn't contain commit descriptions")
```

ErrNoCommits is returned by (*ChangesetSpecDescription).Diff if the description doesn't have any commits descriptions. 

### <a id="SupportedExternalServices" href="#SupportedExternalServices">var SupportedExternalServices</a>

```
searchKey: types.SupportedExternalServices
tags: [exported]
```

```Go
var SupportedExternalServices = ...
```

SupportedExternalServices are the external service types currently supported by the batch changes feature. Repos that are associated with external services whose type is not in this list will simply be filtered out from the search results. 

## <a id="type" href="#type">Types</a>

### <a id="BatchChangeState" href="#BatchChangeState">type BatchChangeState string</a>

```
searchKey: types.BatchChangeState
tags: [exported]
```

```Go
type BatchChangeState string
```

BatchChangeState defines the possible states of a BatchChange 

### <a id="BatchChange" href="#BatchChange">type BatchChange struct</a>

```
searchKey: types.BatchChange
tags: [exported]
```

```Go
type BatchChange struct {
	ID          int64
	Name        string
	Description string

	BatchSpecID int64

	InitialApplierID int32
	LastApplierID    int32
	LastAppliedAt    time.Time

	NamespaceUserID int32
	NamespaceOrgID  int32

	ClosedAt time.Time

	CreatedAt time.Time
	UpdatedAt time.Time
}
```

A BatchChange of changesets over multiple Repos over time. 

#### <a id="BatchChange.Clone" href="#BatchChange.Clone">func (c *BatchChange) Clone() *BatchChange</a>

```
searchKey: types.BatchChange.Clone
tags: [exported]
```

```Go
func (c *BatchChange) Clone() *BatchChange
```

Clone returns a clone of a BatchChange. 

#### <a id="BatchChange.Closed" href="#BatchChange.Closed">func (c *BatchChange) Closed() bool</a>

```
searchKey: types.BatchChange.Closed
tags: [exported]
```

```Go
func (c *BatchChange) Closed() bool
```

Closed returns true when the ClosedAt timestamp has been set. 

### <a id="BatchSpec" href="#BatchSpec">type BatchSpec struct</a>

```
searchKey: types.BatchSpec
tags: [exported]
```

```Go
type BatchSpec struct {
	ID     int64
	RandID string

	RawSpec string
	Spec    BatchSpecFields

	NamespaceUserID int32
	NamespaceOrgID  int32

	UserID int32

	CreatedAt time.Time
	UpdatedAt time.Time
}
```

#### <a id="NewBatchSpecFromRaw" href="#NewBatchSpecFromRaw">func NewBatchSpecFromRaw(rawSpec string) (*BatchSpec, error)</a>

```
searchKey: types.NewBatchSpecFromRaw
tags: [exported]
```

```Go
func NewBatchSpecFromRaw(rawSpec string) (*BatchSpec, error)
```

#### <a id="BatchSpec.Clone" href="#BatchSpec.Clone">func (cs *BatchSpec) Clone() *BatchSpec</a>

```
searchKey: types.BatchSpec.Clone
tags: [exported]
```

```Go
func (cs *BatchSpec) Clone() *BatchSpec
```

Clone returns a clone of a BatchSpec. 

#### <a id="BatchSpec.UnmarshalValidate" href="#BatchSpec.UnmarshalValidate">func (cs *BatchSpec) UnmarshalValidate() error</a>

```
searchKey: types.BatchSpec.UnmarshalValidate
tags: [exported]
```

```Go
func (cs *BatchSpec) UnmarshalValidate() error
```

UnmarshalValidate unmarshals the RawSpec into Spec and validates it against the BatchSpec schema and does additional semantic validation. 

#### <a id="BatchSpec.ExpiresAt" href="#BatchSpec.ExpiresAt">func (cs *BatchSpec) ExpiresAt() time.Time</a>

```
searchKey: types.BatchSpec.ExpiresAt
tags: [exported]
```

```Go
func (cs *BatchSpec) ExpiresAt() time.Time
```

ExpiresAt returns the time when the BatchSpec will be deleted if not applied. 

### <a id="BatchSpecFields" href="#BatchSpecFields">type BatchSpecFields struct</a>

```
searchKey: types.BatchSpecFields
tags: [exported]
```

```Go
type BatchSpecFields struct {
	Name              string                       `json:"name" yaml:"name"`
	Description       string                       `json:"description,omitempty" yaml:"description,omitempty"`
	On                []BatchSpecOn                `json:"on,omitempty" yaml:"on,omitempty"`
	Steps             []BatchSpecStep              `json:"steps,omitempty" yaml:"steps,omitempty"`
	ImportChangeset   []BatchChangeImportChangeset `json:"importChangesets,omitempty" yaml:"importChangesets,omitempty"`
	ChangesetTemplate ChangesetTemplate            `json:"changesetTemplate,omitempty" yaml:"changesetTemplate,omitempty"`
}
```

### <a id="BatchSpecOn" href="#BatchSpecOn">type BatchSpecOn struct</a>

```
searchKey: types.BatchSpecOn
tags: [exported]
```

```Go
type BatchSpecOn struct {
	RepositoriesMatchingQuery string `json:"repositoriesMatchingQuery,omitempty" yaml:"repositoriesMatchingQuery,omitempty"`
	Repository                string `json:"repository,omitempty" yaml:"repository,omitempty"`
}
```

### <a id="BatchSpecStep" href="#BatchSpecStep">type BatchSpecStep struct</a>

```
searchKey: types.BatchSpecStep
tags: [exported]
```

```Go
type BatchSpecStep struct {
	Run       string          `json:"run" yaml:"run"`
	Container string          `json:"container" yaml:"container"`
	Env       env.Environment `json:"env,omitempty" yaml:"env,omitempty"`
}
```

### <a id="BatchChangeImportChangeset" href="#BatchChangeImportChangeset">type BatchChangeImportChangeset struct</a>

```
searchKey: types.BatchChangeImportChangeset
tags: [exported]
```

```Go
type BatchChangeImportChangeset struct {
	Repository  string        `json:"repository" yaml:"repository"`
	ExternalIDs []interface{} `json:"externalIDs" yaml:"externalIDs"`
}
```

### <a id="ChangesetTemplate" href="#ChangesetTemplate">type ChangesetTemplate struct</a>

```
searchKey: types.ChangesetTemplate
tags: [exported]
```

```Go
type ChangesetTemplate struct {
	Title     string                   `json:"title,omitempty" yaml:"title,omitempty"`
	Body      string                   `json:"body,omitempty" yaml:"body,omitempty"`
	Branch    string                   `json:"branch,omitempty" yaml:"branch,omitempty"`
	Commit    CommitTemplate           `json:"commit,omitempty" yaml:"commit,omitempty"`
	Published overridable.BoolOrString `json:"published,omitempty" yaml:"published,omitempty"`
}
```

### <a id="CommitTemplate" href="#CommitTemplate">type CommitTemplate struct</a>

```
searchKey: types.CommitTemplate
tags: [exported]
```

```Go
type CommitTemplate struct {
	Message string `json:"message,omitempty" yaml:"message,omitempty"`
}
```

### <a id="BulkOperationState" href="#BulkOperationState">type BulkOperationState string</a>

```
searchKey: types.BulkOperationState
tags: [exported]
```

```Go
type BulkOperationState string
```

BulkOperationState defines the possible states of a bulk operation. 

#### <a id="BulkOperationState.Valid" href="#BulkOperationState.Valid">func (s BulkOperationState) Valid() bool</a>

```
searchKey: types.BulkOperationState.Valid
tags: [exported]
```

```Go
func (s BulkOperationState) Valid() bool
```

Valid returns true if the given BulkOperationState is valid. 

### <a id="BulkOperation" href="#BulkOperation">type BulkOperation struct</a>

```
searchKey: types.BulkOperation
tags: [exported]
```

```Go
type BulkOperation struct {
	ID string
	// DBID is only used internally for pagination. Don't make any assumptions
	// about this field.
	DBID           int64
	Type           ChangesetJobType
	State          BulkOperationState
	Progress       float64
	UserID         int32
	ChangesetCount int32
	CreatedAt      time.Time
	FinishedAt     time.Time
}
```

BulkOperation represents a virtual entity of a bulk operation, as represented in the database. 

### <a id="BulkOperationError" href="#BulkOperationError">type BulkOperationError struct</a>

```
searchKey: types.BulkOperationError
tags: [exported]
```

```Go
type BulkOperationError struct {
	ChangesetID int64
	Error       string
}
```

BulkOperationError represents an error on a changeset that occurred within a bulk job while executing. 

### <a id="ChangesetState" href="#ChangesetState">type ChangesetState string</a>

```
searchKey: types.ChangesetState
tags: [exported]
```

```Go
type ChangesetState string
```

ChangesetState defines the possible states of a Changeset. These are displayed in the UI as well. 

#### <a id="ChangesetState.Valid" href="#ChangesetState.Valid">func (s ChangesetState) Valid() bool</a>

```
searchKey: types.ChangesetState.Valid
tags: [exported]
```

```Go
func (s ChangesetState) Valid() bool
```

Valid returns true if the given ChangesetState is valid. 

### <a id="ChangesetPublicationState" href="#ChangesetPublicationState">type ChangesetPublicationState string</a>

```
searchKey: types.ChangesetPublicationState
tags: [exported]
```

```Go
type ChangesetPublicationState string
```

ChangesetPublicationState defines the possible publication states of a Changeset. 

#### <a id="ChangesetPublicationState.Valid" href="#ChangesetPublicationState.Valid">func (s ChangesetPublicationState) Valid() bool</a>

```
searchKey: types.ChangesetPublicationState.Valid
tags: [exported]
```

```Go
func (s ChangesetPublicationState) Valid() bool
```

Valid returns true if the given ChangesetPublicationState is valid. 

#### <a id="ChangesetPublicationState.Published" href="#ChangesetPublicationState.Published">func (s ChangesetPublicationState) Published() bool</a>

```
searchKey: types.ChangesetPublicationState.Published
tags: [exported]
```

```Go
func (s ChangesetPublicationState) Published() bool
```

Published returns true if the given state is ChangesetPublicationStatePublished. 

#### <a id="ChangesetPublicationState.Unpublished" href="#ChangesetPublicationState.Unpublished">func (s ChangesetPublicationState) Unpublished() bool</a>

```
searchKey: types.ChangesetPublicationState.Unpublished
tags: [exported]
```

```Go
func (s ChangesetPublicationState) Unpublished() bool
```

Unpublished returns true if the given state is ChangesetPublicationStateUnpublished. 

### <a id="ReconcilerState" href="#ReconcilerState">type ReconcilerState string</a>

```
searchKey: types.ReconcilerState
tags: [exported]
```

```Go
type ReconcilerState string
```

ReconcilerState defines the possible states of a Reconciler. 

#### <a id="ReconcilerState.Valid" href="#ReconcilerState.Valid">func (s ReconcilerState) Valid() bool</a>

```
searchKey: types.ReconcilerState.Valid
tags: [exported]
```

```Go
func (s ReconcilerState) Valid() bool
```

Valid returns true if the given ReconcilerState is valid. 

#### <a id="ReconcilerState.ToDB" href="#ReconcilerState.ToDB">func (s ReconcilerState) ToDB() string</a>

```
searchKey: types.ReconcilerState.ToDB
tags: [exported]
```

```Go
func (s ReconcilerState) ToDB() string
```

ToDB returns the database representation of the reconciler state. That's needed because we want to use UPPERCASE ReconcilerStates in the application and GraphQL layer, but need to use lowercase in the database to make it work with workerutil.Worker. 

### <a id="ChangesetExternalState" href="#ChangesetExternalState">type ChangesetExternalState string</a>

```
searchKey: types.ChangesetExternalState
tags: [exported]
```

```Go
type ChangesetExternalState string
```

ChangesetExternalState defines the possible states of a Changeset on a code host. 

#### <a id="ChangesetExternalState.Valid" href="#ChangesetExternalState.Valid">func (s ChangesetExternalState) Valid() bool</a>

```
searchKey: types.ChangesetExternalState.Valid
tags: [exported]
```

```Go
func (s ChangesetExternalState) Valid() bool
```

Valid returns true if the given ChangesetExternalState is valid. 

### <a id="ChangesetLabel" href="#ChangesetLabel">type ChangesetLabel struct</a>

```
searchKey: types.ChangesetLabel
tags: [exported]
```

```Go
type ChangesetLabel struct {
	Name        string
	Color       string
	Description string
}
```

ChangesetLabel represents a label applied to a changeset 

### <a id="ChangesetReviewState" href="#ChangesetReviewState">type ChangesetReviewState string</a>

```
searchKey: types.ChangesetReviewState
tags: [exported]
```

```Go
type ChangesetReviewState string
```

ChangesetReviewState defines the possible states of a Changeset's review. 

#### <a id="ChangesetReviewState.Valid" href="#ChangesetReviewState.Valid">func (s ChangesetReviewState) Valid() bool</a>

```
searchKey: types.ChangesetReviewState.Valid
tags: [exported]
```

```Go
func (s ChangesetReviewState) Valid() bool
```

Valid returns true if the given Changeset review state is valid. 

### <a id="ChangesetCheckState" href="#ChangesetCheckState">type ChangesetCheckState string</a>

```
searchKey: types.ChangesetCheckState
tags: [exported]
```

```Go
type ChangesetCheckState string
```

ChangesetCheckState constants. 

#### <a id="ChangesetCheckState.Valid" href="#ChangesetCheckState.Valid">func (s ChangesetCheckState) Valid() bool</a>

```
searchKey: types.ChangesetCheckState.Valid
tags: [exported]
```

```Go
func (s ChangesetCheckState) Valid() bool
```

Valid returns true if the given Changeset check state is valid. 

### <a id="BatchChangeAssoc" href="#BatchChangeAssoc">type BatchChangeAssoc struct</a>

```
searchKey: types.BatchChangeAssoc
tags: [exported]
```

```Go
type BatchChangeAssoc struct {
	BatchChangeID int64 `json:"-"`
	Detach        bool  `json:"detach,omitempty"`
	Archive       bool  `json:"archive,omitempty"`
	IsArchived    bool  `json:"isArchived,omitempty"`
}
```

BatchChangeAssoc stores the details of a association to a BatchChange. 

### <a id="Changeset" href="#Changeset">type Changeset struct</a>

```
searchKey: types.Changeset
tags: [exported]
```

```Go
type Changeset struct {
	ID                  int64
	RepoID              api.RepoID
	CreatedAt           time.Time
	UpdatedAt           time.Time
	Metadata            interface{}
	BatchChanges        []BatchChangeAssoc
	ExternalID          string
	ExternalServiceType string
	// ExternalBranch should always be prefixed with refs/heads/. Call git.EnsureRefPrefix before setting this value.
	ExternalBranch      string
	ExternalDeletedAt   time.Time
	ExternalUpdatedAt   time.Time
	ExternalState       ChangesetExternalState
	ExternalReviewState ChangesetReviewState
	ExternalCheckState  ChangesetCheckState
	DiffStatAdded       *int32
	DiffStatChanged     *int32
	DiffStatDeleted     *int32
	SyncState           ChangesetSyncState

	// The batch change that "owns" this changeset: it can create/close
	// it on code host. If this is 0, it is imported/tracked by a batch change.
	OwnedByBatchChangeID int64

	// This is 0 if the Changeset isn't owned by Sourcegraph.
	CurrentSpecID  int64
	PreviousSpecID int64

	PublicationState ChangesetPublicationState // "unpublished", "published"

	// All of the following fields are used by workerutil.Worker.
	ReconcilerState  ReconcilerState
	FailureMessage   *string
	StartedAt        time.Time
	FinishedAt       time.Time
	ProcessAfter     time.Time
	NumResets        int64
	NumFailures      int64
	SyncErrorMessage *string

	// Closing is set to true (along with the ReocncilerState) when the
	// reconciler should close the changeset.
	Closing bool
}
```

A Changeset is a changeset on a code host belonging to a Repository and many BatchChanges. 

#### <a id="Changeset.RecordID" href="#Changeset.RecordID">func (c *Changeset) RecordID() int</a>

```
searchKey: types.Changeset.RecordID
tags: [exported]
```

```Go
func (c *Changeset) RecordID() int
```

RecordID is needed to implement the workerutil.Record interface. 

#### <a id="Changeset.Clone" href="#Changeset.Clone">func (c *Changeset) Clone() *Changeset</a>

```
searchKey: types.Changeset.Clone
tags: [exported]
```

```Go
func (c *Changeset) Clone() *Changeset
```

Clone returns a clone of a Changeset. 

#### <a id="Changeset.Closeable" href="#Changeset.Closeable">func (c *Changeset) Closeable() bool</a>

```
searchKey: types.Changeset.Closeable
tags: [exported]
```

```Go
func (c *Changeset) Closeable() bool
```

Closeable returns whether the Changeset is already closed or merged. 

#### <a id="Changeset.Complete" href="#Changeset.Complete">func (c *Changeset) Complete() bool</a>

```
searchKey: types.Changeset.Complete
tags: [exported]
```

```Go
func (c *Changeset) Complete() bool
```

Complete returns whether the Changeset has been published and its ExternalState is in a final state. 

#### <a id="Changeset.Published" href="#Changeset.Published">func (c *Changeset) Published() bool</a>

```
searchKey: types.Changeset.Published
tags: [exported]
```

```Go
func (c *Changeset) Published() bool
```

Published returns whether the Changeset's PublicationState is Published. 

#### <a id="Changeset.Unpublished" href="#Changeset.Unpublished">func (c *Changeset) Unpublished() bool</a>

```
searchKey: types.Changeset.Unpublished
tags: [exported]
```

```Go
func (c *Changeset) Unpublished() bool
```

Unpublished returns whether the Changeset's PublicationState is Unpublished. 

#### <a id="Changeset.IsImporting" href="#Changeset.IsImporting">func (c *Changeset) IsImporting() bool</a>

```
searchKey: types.Changeset.IsImporting
tags: [exported]
```

```Go
func (c *Changeset) IsImporting() bool
```

IsImporting returns whether the Changeset is being imported but it's not finished yet. 

#### <a id="Changeset.SetCurrentSpec" href="#Changeset.SetCurrentSpec">func (c *Changeset) SetCurrentSpec(spec *ChangesetSpec)</a>

```
searchKey: types.Changeset.SetCurrentSpec
tags: [exported]
```

```Go
func (c *Changeset) SetCurrentSpec(spec *ChangesetSpec)
```

SetCurrentSpec sets the CurrentSpecID field and copies the diff stat over from the spec. 

#### <a id="Changeset.DiffStat" href="#Changeset.DiffStat">func (c *Changeset) DiffStat() *diff.Stat</a>

```
searchKey: types.Changeset.DiffStat
tags: [exported]
```

```Go
func (c *Changeset) DiffStat() *diff.Stat
```

DiffStat returns a *diff.Stat if DiffStatAdded, DiffStatChanged, and DiffStatDeleted are set, or nil if one or more is not. 

#### <a id="Changeset.SetDiffStat" href="#Changeset.SetDiffStat">func (c *Changeset) SetDiffStat(stat *diff.Stat)</a>

```
searchKey: types.Changeset.SetDiffStat
tags: [exported]
```

```Go
func (c *Changeset) SetDiffStat(stat *diff.Stat)
```

#### <a id="Changeset.SetMetadata" href="#Changeset.SetMetadata">func (c *Changeset) SetMetadata(meta interface{}) error</a>

```
searchKey: types.Changeset.SetMetadata
tags: [exported]
```

```Go
func (c *Changeset) SetMetadata(meta interface{}) error
```

#### <a id="Changeset.RemoveBatchChangeID" href="#Changeset.RemoveBatchChangeID">func (c *Changeset) RemoveBatchChangeID(id int64)</a>

```
searchKey: types.Changeset.RemoveBatchChangeID
tags: [exported]
```

```Go
func (c *Changeset) RemoveBatchChangeID(id int64)
```

RemoveBatchChangeID removes the given id from the Changesets BatchChangesIDs slice. If the id is not in BatchChangesIDs calling this method doesn't have an effect. 

#### <a id="Changeset.Title" href="#Changeset.Title">func (c *Changeset) Title() (string, error)</a>

```
searchKey: types.Changeset.Title
tags: [exported]
```

```Go
func (c *Changeset) Title() (string, error)
```

Title of the Changeset. 

#### <a id="Changeset.AuthorName" href="#Changeset.AuthorName">func (c *Changeset) AuthorName() (string, error)</a>

```
searchKey: types.Changeset.AuthorName
tags: [exported]
```

```Go
func (c *Changeset) AuthorName() (string, error)
```

AuthorName of the Changeset. 

#### <a id="Changeset.AuthorEmail" href="#Changeset.AuthorEmail">func (c *Changeset) AuthorEmail() (string, error)</a>

```
searchKey: types.Changeset.AuthorEmail
tags: [exported]
```

```Go
func (c *Changeset) AuthorEmail() (string, error)
```

AuthorEmail of the Changeset. 

#### <a id="Changeset.ExternalCreatedAt" href="#Changeset.ExternalCreatedAt">func (c *Changeset) ExternalCreatedAt() time.Time</a>

```
searchKey: types.Changeset.ExternalCreatedAt
tags: [exported]
```

```Go
func (c *Changeset) ExternalCreatedAt() time.Time
```

ExternalCreatedAt is when the Changeset was created on the codehost. When it cannot be determined when the changeset was created, a zero-value timestamp is returned. 

#### <a id="Changeset.Body" href="#Changeset.Body">func (c *Changeset) Body() (string, error)</a>

```
searchKey: types.Changeset.Body
tags: [exported]
```

```Go
func (c *Changeset) Body() (string, error)
```

Body of the Changeset. 

#### <a id="Changeset.SetDeleted" href="#Changeset.SetDeleted">func (c *Changeset) SetDeleted()</a>

```
searchKey: types.Changeset.SetDeleted
tags: [exported]
```

```Go
func (c *Changeset) SetDeleted()
```

SetDeleted sets the internal state of a Changeset so that its State is ChangesetStateDeleted. 

#### <a id="Changeset.IsDeleted" href="#Changeset.IsDeleted">func (c *Changeset) IsDeleted() bool</a>

```
searchKey: types.Changeset.IsDeleted
tags: [exported]
```

```Go
func (c *Changeset) IsDeleted() bool
```

IsDeleted returns true when the Changeset's ExternalDeletedAt is a non-zero timestamp. 

#### <a id="Changeset.HasDiff" href="#Changeset.HasDiff">func (c *Changeset) HasDiff() bool</a>

```
searchKey: types.Changeset.HasDiff
tags: [exported]
```

```Go
func (c *Changeset) HasDiff() bool
```

HasDiff returns true when the changeset is in an open state. That is because currently we do not support diff rendering for historic branches, because we can't guarantee that we have the refs on gitserver. 

#### <a id="Changeset.URL" href="#Changeset.URL">func (c *Changeset) URL() (s string, err error)</a>

```
searchKey: types.Changeset.URL
tags: [exported]
```

```Go
func (c *Changeset) URL() (s string, err error)
```

URL of a Changeset. 

#### <a id="Changeset.Events" href="#Changeset.Events">func (c *Changeset) Events() (events []*ChangesetEvent, err error)</a>

```
searchKey: types.Changeset.Events
tags: [exported]
```

```Go
func (c *Changeset) Events() (events []*ChangesetEvent, err error)
```

Events returns the deduplicated list of ChangesetEvents from the Changeset's metadata. 

#### <a id="Changeset.HeadRefOid" href="#Changeset.HeadRefOid">func (c *Changeset) HeadRefOid() (string, error)</a>

```
searchKey: types.Changeset.HeadRefOid
tags: [exported]
```

```Go
func (c *Changeset) HeadRefOid() (string, error)
```

HeadRefOid returns the git ObjectID of the HEAD reference associated with Changeset on the codehost. If the codehost doesn't include the ObjectID, an empty string is returned. 

#### <a id="Changeset.HeadRef" href="#Changeset.HeadRef">func (c *Changeset) HeadRef() (string, error)</a>

```
searchKey: types.Changeset.HeadRef
tags: [exported]
```

```Go
func (c *Changeset) HeadRef() (string, error)
```

HeadRef returns the full ref (e.g. `refs/heads/my-branch`) of the HEAD reference associated with the Changeset on the codehost. 

#### <a id="Changeset.BaseRefOid" href="#Changeset.BaseRefOid">func (c *Changeset) BaseRefOid() (string, error)</a>

```
searchKey: types.Changeset.BaseRefOid
tags: [exported]
```

```Go
func (c *Changeset) BaseRefOid() (string, error)
```

BaseRefOid returns the git ObjectID of the base reference associated with the Changeset on the codehost. If the codehost doesn't include the ObjectID, an empty string is returned. 

#### <a id="Changeset.BaseRef" href="#Changeset.BaseRef">func (c *Changeset) BaseRef() (string, error)</a>

```
searchKey: types.Changeset.BaseRef
tags: [exported]
```

```Go
func (c *Changeset) BaseRef() (string, error)
```

BaseRef returns the full ref (e.g. `refs/heads/my-branch`) of the base ref associated with the Changeset on the codehost. 

#### <a id="Changeset.AttachedTo" href="#Changeset.AttachedTo">func (c *Changeset) AttachedTo(batchChangeID int64) bool</a>

```
searchKey: types.Changeset.AttachedTo
tags: [exported]
```

```Go
func (c *Changeset) AttachedTo(batchChangeID int64) bool
```

AttachedTo returns true if the changeset is currently attached to the batch change with the given batchChangeID. 

#### <a id="Changeset.Attach" href="#Changeset.Attach">func (c *Changeset) Attach(batchChangeID int64)</a>

```
searchKey: types.Changeset.Attach
tags: [exported]
```

```Go
func (c *Changeset) Attach(batchChangeID int64)
```

Attach attaches the batch change with the given ID to the changeset. If the batch change is already attached, this is a noop. If the batch change is still attached but is marked as to be detached, the detach flag is removed. 

#### <a id="Changeset.Detach" href="#Changeset.Detach">func (c *Changeset) Detach(batchChangeID int64) bool</a>

```
searchKey: types.Changeset.Detach
tags: [exported]
```

```Go
func (c *Changeset) Detach(batchChangeID int64) bool
```

Detach marks the given batch change as to-be-detached. Returns true, if the batch change currently is attached to the batch change. This function is a noop, if the given batch change was not attached to the changeset. 

#### <a id="Changeset.Archive" href="#Changeset.Archive">func (c *Changeset) Archive(batchChangeID int64) bool</a>

```
searchKey: types.Changeset.Archive
tags: [exported]
```

```Go
func (c *Changeset) Archive(batchChangeID int64) bool
```

Archive marks the given batch change as to-be-archived. Returns true, if the batch change currently is attached to the batch change and *not* archived. This function is a noop, if the given changeset was already archived. 

#### <a id="Changeset.ArchivedIn" href="#Changeset.ArchivedIn">func (c *Changeset) ArchivedIn(batchChangeID int64) bool</a>

```
searchKey: types.Changeset.ArchivedIn
tags: [exported]
```

```Go
func (c *Changeset) ArchivedIn(batchChangeID int64) bool
```

ArchivedIn checks whether the changeset is archived in the given batch change. 

#### <a id="Changeset.SupportsLabels" href="#Changeset.SupportsLabels">func (c *Changeset) SupportsLabels() bool</a>

```
searchKey: types.Changeset.SupportsLabels
tags: [exported]
```

```Go
func (c *Changeset) SupportsLabels() bool
```

SupportsLabels returns whether the code host on which the changeset is hosted supports labels and whether it's safe to call the (*Changeset).Labels() method. 

#### <a id="Changeset.SupportsDraft" href="#Changeset.SupportsDraft">func (c *Changeset) SupportsDraft() bool</a>

```
searchKey: types.Changeset.SupportsDraft
tags: [exported]
```

```Go
func (c *Changeset) SupportsDraft() bool
```

SupportsDraft returns whether the code host on which the changeset is hosted supports draft changesets. 

#### <a id="Changeset.Labels" href="#Changeset.Labels">func (c *Changeset) Labels() []ChangesetLabel</a>

```
searchKey: types.Changeset.Labels
tags: [exported]
```

```Go
func (c *Changeset) Labels() []ChangesetLabel
```

#### <a id="Changeset.ResetReconcilerState" href="#Changeset.ResetReconcilerState">func (c *Changeset) ResetReconcilerState(state ReconcilerState)</a>

```
searchKey: types.Changeset.ResetReconcilerState
tags: [exported]
```

```Go
func (c *Changeset) ResetReconcilerState(state ReconcilerState)
```

ResetReconcilerState resets the failure message and reset count and sets the changeset's ReconcilerState to the given value. 

### <a id="Changesets" href="#Changesets">type Changesets []*types.Changeset</a>

```
searchKey: types.Changesets
tags: [exported]
```

```Go
type Changesets []*Changeset
```

Changesets is a slice of *Changesets. 

#### <a id="Changesets.IDs" href="#Changesets.IDs">func (cs Changesets) IDs() []int64</a>

```
searchKey: types.Changesets.IDs
tags: [exported]
```

```Go
func (cs Changesets) IDs() []int64
```

IDs returns the IDs of all changesets in the slice. 

#### <a id="Changesets.RepoIDs" href="#Changesets.RepoIDs">func (cs Changesets) RepoIDs() []api.RepoID</a>

```
searchKey: types.Changesets.RepoIDs
tags: [exported]
```

```Go
func (cs Changesets) RepoIDs() []api.RepoID
```

IDs returns the unique RepoIDs of all changesets in the slice. 

#### <a id="Changesets.Filter" href="#Changesets.Filter">func (cs Changesets) Filter(predicate func(*Changeset) bool) (filtered Changesets)</a>

```
searchKey: types.Changesets.Filter
tags: [exported]
```

```Go
func (cs Changesets) Filter(predicate func(*Changeset) bool) (filtered Changesets)
```

Filter returns a new Changesets slice in which changesets have been filtered out for which the predicate didn't return true. 

#### <a id="Changesets.Find" href="#Changesets.Find">func (cs Changesets) Find(predicate func(*Changeset) bool) *Changeset</a>

```
searchKey: types.Changesets.Find
tags: [exported]
```

```Go
func (cs Changesets) Find(predicate func(*Changeset) bool) *Changeset
```

Find returns the first changeset in the slice for which the predicate returned true. 

### <a id="ChangesetsStats" href="#ChangesetsStats">type ChangesetsStats struct</a>

```
searchKey: types.ChangesetsStats
tags: [exported]
```

```Go
type ChangesetsStats struct {
	Retrying    int32
	Failed      int32
	Scheduled   int32
	Processing  int32
	Unpublished int32
	Draft       int32
	Open        int32
	Merged      int32
	Closed      int32
	Deleted     int32
	Archived    int32
	Total       int32
}
```

ChangesetsStats holds stats information on a list of changesets. 

### <a id="changesetEventUpdateMismatchError" href="#changesetEventUpdateMismatchError">type changesetEventUpdateMismatchError struct</a>

```
searchKey: types.changesetEventUpdateMismatchError
```

```Go
type changesetEventUpdateMismatchError struct {
	field    string
	original interface{}
	revised  interface{}
}
```

#### <a id="changesetEventUpdateMismatchError.Error" href="#changesetEventUpdateMismatchError.Error">func (e *changesetEventUpdateMismatchError) Error() string</a>

```
searchKey: types.changesetEventUpdateMismatchError.Error
```

```Go
func (e *changesetEventUpdateMismatchError) Error() string
```

### <a id="ChangesetEventKind" href="#ChangesetEventKind">type ChangesetEventKind string</a>

```
searchKey: types.ChangesetEventKind
tags: [exported]
```

```Go
type ChangesetEventKind string
```

ChangesetEventKind defines the kind of a ChangesetEvent. This type is unexported so that users of ChangesetEvent can't instantiate it with a Kind being an arbitrary string. 

#### <a id="ChangesetEventKindFor" href="#ChangesetEventKindFor">func ChangesetEventKindFor(e interface{}) (ChangesetEventKind, error)</a>

```
searchKey: types.ChangesetEventKindFor
tags: [exported]
```

```Go
func ChangesetEventKindFor(e interface{}) (ChangesetEventKind, error)
```

ChangesetEventKindFor returns the ChangesetEventKind for the given specific code host event. 

### <a id="ChangesetEvent" href="#ChangesetEvent">type ChangesetEvent struct</a>

```
searchKey: types.ChangesetEvent
tags: [exported]
```

```Go
type ChangesetEvent struct {
	ID          int64
	ChangesetID int64
	Kind        ChangesetEventKind
	Key         string // Deduplication key
	CreatedAt   time.Time
	UpdatedAt   time.Time
	Metadata    interface{}
}
```

A ChangesetEvent is an event that happened in the lifetime and context of a Changeset. 

#### <a id="ChangesetEvent.Clone" href="#ChangesetEvent.Clone">func (e *ChangesetEvent) Clone() *ChangesetEvent</a>

```
searchKey: types.ChangesetEvent.Clone
tags: [exported]
```

```Go
func (e *ChangesetEvent) Clone() *ChangesetEvent
```

Clone returns a clone of a ChangesetEvent. 

#### <a id="ChangesetEvent.ReviewAuthor" href="#ChangesetEvent.ReviewAuthor">func (e *ChangesetEvent) ReviewAuthor() string</a>

```
searchKey: types.ChangesetEvent.ReviewAuthor
tags: [exported]
```

```Go
func (e *ChangesetEvent) ReviewAuthor() string
```

ReviewAuthor returns the author of the review if the ChangesetEvent is related to a review. Returns an empty string if not a review event or the author has been deleted. 

#### <a id="ChangesetEvent.ReviewState" href="#ChangesetEvent.ReviewState">func (e *ChangesetEvent) ReviewState() (ChangesetReviewState, error)</a>

```
searchKey: types.ChangesetEvent.ReviewState
tags: [exported]
```

```Go
func (e *ChangesetEvent) ReviewState() (ChangesetReviewState, error)
```

ReviewState returns the review state of the ChangesetEvent if it is a review event. 

#### <a id="ChangesetEvent.Type" href="#ChangesetEvent.Type">func (e *ChangesetEvent) Type() ChangesetEventKind</a>

```
searchKey: types.ChangesetEvent.Type
tags: [exported]
```

```Go
func (e *ChangesetEvent) Type() ChangesetEventKind
```

Type returns the ChangesetEventKind of the ChangesetEvent. 

#### <a id="ChangesetEvent.Changeset" href="#ChangesetEvent.Changeset">func (e *ChangesetEvent) Changeset() int64</a>

```
searchKey: types.ChangesetEvent.Changeset
tags: [exported]
```

```Go
func (e *ChangesetEvent) Changeset() int64
```

Changeset returns the changeset ID of the ChangesetEvent. 

#### <a id="ChangesetEvent.Timestamp" href="#ChangesetEvent.Timestamp">func (e *ChangesetEvent) Timestamp() time.Time</a>

```
searchKey: types.ChangesetEvent.Timestamp
tags: [exported]
```

```Go
func (e *ChangesetEvent) Timestamp() time.Time
```

Timestamp returns the time when the ChangesetEvent happened (or was updated) on the codehost, not when it was created in Sourcegraph's database. 

#### <a id="ChangesetEvent.Update" href="#ChangesetEvent.Update">func (e *ChangesetEvent) Update(o *ChangesetEvent) error</a>

```
searchKey: types.ChangesetEvent.Update
tags: [exported]
```

```Go
func (e *ChangesetEvent) Update(o *ChangesetEvent) error
```

Update updates the metadata of e with new metadata in o. 

### <a id="ChangesetJobState" href="#ChangesetJobState">type ChangesetJobState string</a>

```
searchKey: types.ChangesetJobState
tags: [exported]
```

```Go
type ChangesetJobState string
```

ChangesetJobState defines the possible states of a changeset job. 

#### <a id="ChangesetJobState.Valid" href="#ChangesetJobState.Valid">func (s ChangesetJobState) Valid() bool</a>

```
searchKey: types.ChangesetJobState.Valid
tags: [exported]
```

```Go
func (s ChangesetJobState) Valid() bool
```

Valid returns true if the given ChangesetJobState is valid. 

#### <a id="ChangesetJobState.ToDB" href="#ChangesetJobState.ToDB">func (s ChangesetJobState) ToDB() string</a>

```
searchKey: types.ChangesetJobState.ToDB
tags: [exported]
```

```Go
func (s ChangesetJobState) ToDB() string
```

ToDB returns the database representation of the worker state. That's needed because we want to use UPPERCASE in the application and GraphQL layer, but need to use lowercase in the database to make it work with workerutil.Worker. 

### <a id="ChangesetJobType" href="#ChangesetJobType">type ChangesetJobType string</a>

```
searchKey: types.ChangesetJobType
tags: [exported]
```

```Go
type ChangesetJobType string
```

ChangesetJobType specifies all valid type of jobs that the bulk processor understands. 

### <a id="ChangesetJobCommentPayload" href="#ChangesetJobCommentPayload">type ChangesetJobCommentPayload struct</a>

```
searchKey: types.ChangesetJobCommentPayload
tags: [exported]
```

```Go
type ChangesetJobCommentPayload struct {
	Message string `json:"message"`
}
```

### <a id="ChangesetJobDetachPayload" href="#ChangesetJobDetachPayload">type ChangesetJobDetachPayload struct{}</a>

```
searchKey: types.ChangesetJobDetachPayload
tags: [exported]
```

```Go
type ChangesetJobDetachPayload struct{}
```

### <a id="ChangesetJobReenqueuePayload" href="#ChangesetJobReenqueuePayload">type ChangesetJobReenqueuePayload struct{}</a>

```
searchKey: types.ChangesetJobReenqueuePayload
tags: [exported]
```

```Go
type ChangesetJobReenqueuePayload struct{}
```

### <a id="ChangesetJobMergePayload" href="#ChangesetJobMergePayload">type ChangesetJobMergePayload struct</a>

```
searchKey: types.ChangesetJobMergePayload
tags: [exported]
```

```Go
type ChangesetJobMergePayload struct {
	Squash bool `json:"squash,omitempty"`
}
```

### <a id="ChangesetJob" href="#ChangesetJob">type ChangesetJob struct</a>

```
searchKey: types.ChangesetJob
tags: [exported]
```

```Go
type ChangesetJob struct {
	ID int64
	// BulkGroup is a random string that can be used to group jobs together in a
	// single invocation.
	BulkGroup     string
	BatchChangeID int64
	UserID        int32
	ChangesetID   int64
	JobType       ChangesetJobType
	Payload       interface{}

	State          ChangesetJobState
	FailureMessage *string
	StartedAt      time.Time
	FinishedAt     time.Time
	ProcessAfter   time.Time
	NumResets      int64
	NumFailures    int64

	CreatedAt time.Time
	UpdatedAt time.Time
}
```

ChangesetJob describes a one-time action to be taken on a changeset. 

#### <a id="ChangesetJob.RecordID" href="#ChangesetJob.RecordID">func (j *ChangesetJob) RecordID() int</a>

```
searchKey: types.ChangesetJob.RecordID
tags: [exported]
```

```Go
func (j *ChangesetJob) RecordID() int
```

### <a id="ChangesetSpec" href="#ChangesetSpec">type ChangesetSpec struct</a>

```
searchKey: types.ChangesetSpec
tags: [exported]
```

```Go
type ChangesetSpec struct {
	ID     int64
	RandID string

	RawSpec string
	// TODO(mrnugget): should we rename the "spec" column to "description"?
	Spec *ChangesetSpecDescription

	DiffStatAdded   int32
	DiffStatChanged int32
	DiffStatDeleted int32

	BatchSpecID int64
	RepoID      api.RepoID
	UserID      int32

	CreatedAt time.Time
	UpdatedAt time.Time
}
```

#### <a id="NewChangesetSpecFromRaw" href="#NewChangesetSpecFromRaw">func NewChangesetSpecFromRaw(rawSpec string) (*ChangesetSpec, error)</a>

```
searchKey: types.NewChangesetSpecFromRaw
tags: [exported]
```

```Go
func NewChangesetSpecFromRaw(rawSpec string) (*ChangesetSpec, error)
```

#### <a id="ChangesetSpec.Clone" href="#ChangesetSpec.Clone">func (cs *ChangesetSpec) Clone() *ChangesetSpec</a>

```
searchKey: types.ChangesetSpec.Clone
tags: [exported]
```

```Go
func (cs *ChangesetSpec) Clone() *ChangesetSpec
```

Clone returns a clone of a ChangesetSpec. 

#### <a id="ChangesetSpec.computeDiffStat" href="#ChangesetSpec.computeDiffStat">func (cs *ChangesetSpec) computeDiffStat() error</a>

```
searchKey: types.ChangesetSpec.computeDiffStat
```

```Go
func (cs *ChangesetSpec) computeDiffStat() error
```

computeDiffStat parses the Diff of the ChangesetSpecDescription and sets the diff stat fields that can be retrieved with DiffStat(). If the Diff is invalid or parsing failed, an error is returned. 

#### <a id="ChangesetSpec.DiffStat" href="#ChangesetSpec.DiffStat">func (cs *ChangesetSpec) DiffStat() diff.Stat</a>

```
searchKey: types.ChangesetSpec.DiffStat
tags: [exported]
```

```Go
func (cs *ChangesetSpec) DiffStat() diff.Stat
```

DiffStat returns a *diff.Stat. 

#### <a id="ChangesetSpec.UnmarshalValidate" href="#ChangesetSpec.UnmarshalValidate">func (cs *ChangesetSpec) UnmarshalValidate() error</a>

```
searchKey: types.ChangesetSpec.UnmarshalValidate
tags: [exported]
```

```Go
func (cs *ChangesetSpec) UnmarshalValidate() error
```

UnmarshalValidate unmarshals the RawSpec into Spec and validates it against the ChangesetSpec schema and does additional semantic validation. 

#### <a id="ChangesetSpec.ExpiresAt" href="#ChangesetSpec.ExpiresAt">func (cs *ChangesetSpec) ExpiresAt() time.Time</a>

```
searchKey: types.ChangesetSpec.ExpiresAt
tags: [exported]
```

```Go
func (cs *ChangesetSpec) ExpiresAt() time.Time
```

ExpiresAt returns the time when the ChangesetSpec will be deleted if not attached to a BatchSpec. 

### <a id="GitCommitDescription" href="#GitCommitDescription">type GitCommitDescription struct</a>

```
searchKey: types.GitCommitDescription
tags: [exported]
```

```Go
type GitCommitDescription struct {
	Message     string `json:"message,omitempty"`
	Diff        string `json:"diff,omitempty"`
	AuthorName  string `json:"authorName,omitempty"`
	AuthorEmail string `json:"authorEmail,omitempty"`
}
```

### <a id="ChangesetSpecs" href="#ChangesetSpecs">type ChangesetSpecs []*types.ChangesetSpec</a>

```
searchKey: types.ChangesetSpecs
tags: [exported]
```

```Go
type ChangesetSpecs []*ChangesetSpec
```

ChangesetSpecs is a slice of *ChangesetSpecs. 

#### <a id="ChangesetSpecs.RepoIDs" href="#ChangesetSpecs.RepoIDs">func (cs ChangesetSpecs) RepoIDs() []api.RepoID</a>

```
searchKey: types.ChangesetSpecs.RepoIDs
tags: [exported]
```

```Go
func (cs ChangesetSpecs) RepoIDs() []api.RepoID
```

IDs returns the unique RepoIDs of all changeset specs in the slice. 

### <a id="ChangesetSpecDescription" href="#ChangesetSpecDescription">type ChangesetSpecDescription struct</a>

```
searchKey: types.ChangesetSpecDescription
tags: [exported]
```

```Go
type ChangesetSpecDescription struct {
	BaseRepository graphql.ID `json:"baseRepository,omitempty"`

	// If this is not empty, the description is a reference to an existing
	// changeset and the rest of these fields are empty.
	ExternalID string `json:"externalID,omitempty"`

	BaseRev string `json:"baseRev,omitempty"`
	BaseRef string `json:"baseRef,omitempty"`

	HeadRepository graphql.ID `json:"headRepository,omitempty"`
	HeadRef        string     `json:"headRef,omitempty"`

	Title string `json:"title,omitempty"`
	Body  string `json:"body,omitempty"`

	Commits []GitCommitDescription `json:"commits,omitempty"`

	Published batches.PublishedValue `json:"published,omitempty"`
}
```

#### <a id="ChangesetSpecDescription.Type" href="#ChangesetSpecDescription.Type">func (d *ChangesetSpecDescription) Type() ChangesetSpecDescriptionType</a>

```
searchKey: types.ChangesetSpecDescription.Type
tags: [exported]
```

```Go
func (d *ChangesetSpecDescription) Type() ChangesetSpecDescriptionType
```

Type returns the ChangesetSpecDescriptionType of the ChangesetSpecDescription. 

#### <a id="ChangesetSpecDescription.IsImportingExisting" href="#ChangesetSpecDescription.IsImportingExisting">func (d *ChangesetSpecDescription) IsImportingExisting() bool</a>

```
searchKey: types.ChangesetSpecDescription.IsImportingExisting
tags: [exported]
```

```Go
func (d *ChangesetSpecDescription) IsImportingExisting() bool
```

IsExisting returns whether the description is of type ChangesetSpecDescriptionTypeExisting. 

#### <a id="ChangesetSpecDescription.IsBranch" href="#ChangesetSpecDescription.IsBranch">func (d *ChangesetSpecDescription) IsBranch() bool</a>

```
searchKey: types.ChangesetSpecDescription.IsBranch
tags: [exported]
```

```Go
func (d *ChangesetSpecDescription) IsBranch() bool
```

IsBranch returns whether the description is of type ChangesetSpecDescriptionTypeBranch. 

#### <a id="ChangesetSpecDescription.Diff" href="#ChangesetSpecDescription.Diff">func (d *ChangesetSpecDescription) Diff() (string, error)</a>

```
searchKey: types.ChangesetSpecDescription.Diff
tags: [exported]
```

```Go
func (d *ChangesetSpecDescription) Diff() (string, error)
```

Diff returns the Diff of the first GitCommitDescription in Commits. If the ChangesetSpecDescription doesn't have Commits it returns ErrNoCommits. 

We currently only support a single commit in Commits. Once we support more, this method will need to be revisited. 

#### <a id="ChangesetSpecDescription.CommitMessage" href="#ChangesetSpecDescription.CommitMessage">func (d *ChangesetSpecDescription) CommitMessage() (string, error)</a>

```
searchKey: types.ChangesetSpecDescription.CommitMessage
tags: [exported]
```

```Go
func (d *ChangesetSpecDescription) CommitMessage() (string, error)
```

CommitMessage returns the Message of the first GitCommitDescription in Commits. If the ChangesetSpecDescription doesn't have Commits it returns ErrNoCommits. 

We currently only support a single commit in Commits. Once we support more, this method will need to be revisited. 

#### <a id="ChangesetSpecDescription.AuthorName" href="#ChangesetSpecDescription.AuthorName">func (d *ChangesetSpecDescription) AuthorName() (string, error)</a>

```
searchKey: types.ChangesetSpecDescription.AuthorName
tags: [exported]
```

```Go
func (d *ChangesetSpecDescription) AuthorName() (string, error)
```

AuthorName returns the author name of the first GitCommitDescription in Commits. If the ChangesetSpecDescription doesn't have Commits it returns ErrNoCommits. 

We currently only support a single commit in Commits. Once we support more, this method will need to be revisited. 

#### <a id="ChangesetSpecDescription.AuthorEmail" href="#ChangesetSpecDescription.AuthorEmail">func (d *ChangesetSpecDescription) AuthorEmail() (string, error)</a>

```
searchKey: types.ChangesetSpecDescription.AuthorEmail
tags: [exported]
```

```Go
func (d *ChangesetSpecDescription) AuthorEmail() (string, error)
```

AuthorEmail returns the author email of the first GitCommitDescription in Commits. If the ChangesetSpecDescription doesn't have Commits it returns ErrNoCommits. 

We currently only support a single commit in Commits. Once we support more, this method will need to be revisited. 

### <a id="ChangesetSpecDescriptionType" href="#ChangesetSpecDescriptionType">type ChangesetSpecDescriptionType string</a>

```
searchKey: types.ChangesetSpecDescriptionType
tags: [exported]
```

```Go
type ChangesetSpecDescriptionType string
```

ChangesetSpecDescriptionType tells the consumer what the type of a ChangesetSpecDescription is without having to look into the description. Useful in the GraphQL when a HiddenChangesetSpec is returned. 

### <a id="CodeHost" href="#CodeHost">type CodeHost struct</a>

```
searchKey: types.CodeHost
tags: [exported]
```

```Go
type CodeHost struct {
	ExternalServiceType string
	ExternalServiceID   string
	RequiresSSH         bool
}
```

CodeHost represents one configured external code host available on this Sourcegraph instance. 

#### <a id="CodeHost.IsSupported" href="#CodeHost.IsSupported">func (c *CodeHost) IsSupported() bool</a>

```
searchKey: types.CodeHost.IsSupported
tags: [exported]
```

```Go
func (c *CodeHost) IsSupported() bool
```

IsSupported returns true, when this code host is supported by the batch changes feature. 

### <a id="ReconcilerOperation" href="#ReconcilerOperation">type ReconcilerOperation string</a>

```
searchKey: types.ReconcilerOperation
tags: [exported]
```

```Go
type ReconcilerOperation string
```

ReconcilerOperation is an enum to distinguish between different reconciler operations. 

#### <a id="ReconcilerOperation.Valid" href="#ReconcilerOperation.Valid">func (r ReconcilerOperation) Valid() bool</a>

```
searchKey: types.ReconcilerOperation.Valid
tags: [exported]
```

```Go
func (r ReconcilerOperation) Valid() bool
```

Valid returns true if the given ReconcilerOperation is valid. 

### <a id="RewirerMapping" href="#RewirerMapping">type RewirerMapping struct</a>

```
searchKey: types.RewirerMapping
tags: [exported]
```

```Go
type RewirerMapping struct {
	ChangesetSpecID int64
	ChangesetSpec   *ChangesetSpec
	ChangesetID     int64
	Changeset       *Changeset
	RepoID          api.RepoID
	Repo            *types.Repo
}
```

RewirerMapping maps a connection between ChangesetSpec and Changeset. If the ChangesetSpec doesn't match a Changeset (ie. it describes a to-be-created Changeset), ChangesetID is 0. If the ChangesetSpec is 0, the Changeset will be non-zero and means "to be closed". If both are non-zero values, the changeset should be updated with the changeset spec in the mapping. 

### <a id="RewirerMappings" href="#RewirerMappings">type RewirerMappings []*types.RewirerMapping</a>

```
searchKey: types.RewirerMappings
tags: [exported]
```

```Go
type RewirerMappings []*RewirerMapping
```

#### <a id="RewirerMappings.ChangesetIDs" href="#RewirerMappings.ChangesetIDs">func (rm RewirerMappings) ChangesetIDs() []int64</a>

```
searchKey: types.RewirerMappings.ChangesetIDs
tags: [exported]
```

```Go
func (rm RewirerMappings) ChangesetIDs() []int64
```

ChangesetIDs returns a list of unique changeset IDs in the slice of mappings. 

#### <a id="RewirerMappings.ChangesetSpecIDs" href="#RewirerMappings.ChangesetSpecIDs">func (rm RewirerMappings) ChangesetSpecIDs() []int64</a>

```
searchKey: types.RewirerMappings.ChangesetSpecIDs
tags: [exported]
```

```Go
func (rm RewirerMappings) ChangesetSpecIDs() []int64
```

ChangesetSpecIDs returns a list of unique changeset spec IDs in the slice of mappings. 

#### <a id="RewirerMappings.RepoIDs" href="#RewirerMappings.RepoIDs">func (rm RewirerMappings) RepoIDs() []api.RepoID</a>

```
searchKey: types.RewirerMappings.RepoIDs
tags: [exported]
```

```Go
func (rm RewirerMappings) RepoIDs() []api.RepoID
```

RepoIDs returns a list of unique repo IDs in the slice of mappings. 

### <a id="SiteCredential" href="#SiteCredential">type SiteCredential struct</a>

```
searchKey: types.SiteCredential
tags: [exported]
```

```Go
type SiteCredential struct {
	ID                  int64
	ExternalServiceType string
	ExternalServiceID   string
	EncryptedCredential []byte
	EncryptionKeyID     string
	CreatedAt           time.Time
	UpdatedAt           time.Time

	Key encryption.Key
}
```

#### <a id="SiteCredential.Authenticator" href="#SiteCredential.Authenticator">func (sc *SiteCredential) Authenticator(ctx context.Context) (auth.Authenticator, error)</a>

```
searchKey: types.SiteCredential.Authenticator
tags: [exported]
```

```Go
func (sc *SiteCredential) Authenticator(ctx context.Context) (auth.Authenticator, error)
```

Authenticator decrypts and creates the authenticator associated with the site credential. 

#### <a id="SiteCredential.SetAuthenticator" href="#SiteCredential.SetAuthenticator">func (sc *SiteCredential) SetAuthenticator(ctx context.Context, a auth.Authenticator) error</a>

```
searchKey: types.SiteCredential.SetAuthenticator
tags: [exported]
```

```Go
func (sc *SiteCredential) SetAuthenticator(ctx context.Context, a auth.Authenticator) error
```

SetAuthenticator encrypts and sets the authenticator within the site credential. 

### <a id="ChangesetSyncState" href="#ChangesetSyncState">type ChangesetSyncState struct</a>

```
searchKey: types.ChangesetSyncState
tags: [exported]
```

```Go
type ChangesetSyncState struct {
	BaseRefOid string
	HeadRefOid string

	// This is essentially the result of c.ExternalState != BatchChangeStateOpen
	// the last time a sync occured. We use this to short circuit computing the
	// sync state if the changeset remains closed.
	IsComplete bool
}
```

#### <a id="ChangesetSyncState.Equals" href="#ChangesetSyncState.Equals">func (state *ChangesetSyncState) Equals(old *ChangesetSyncState) bool</a>

```
searchKey: types.ChangesetSyncState.Equals
tags: [exported]
```

```Go
func (state *ChangesetSyncState) Equals(old *ChangesetSyncState) bool
```

### <a id="ChangesetSyncData" href="#ChangesetSyncData">type ChangesetSyncData struct</a>

```
searchKey: types.ChangesetSyncData
tags: [exported]
```

```Go
type ChangesetSyncData struct {
	ChangesetID int64
	// UpdatedAt is the time we last updated / synced the changeset in our DB
	UpdatedAt time.Time
	// LatestEvent is the time we received the most recent changeset event
	LatestEvent time.Time
	// ExternalUpdatedAt is the time the external changeset last changed
	ExternalUpdatedAt time.Time
	// RepoExternalServiceID is the external_service_id in the repo table, usually
	// represented by the code host URL
	RepoExternalServiceID string
}
```

ChangesetSyncData represents data about the sync status of a changeset 

### <a id="CodehostCapability" href="#CodehostCapability">type CodehostCapability string</a>

```
searchKey: types.CodehostCapability
tags: [exported]
```

```Go
type CodehostCapability string
```

### <a id="CodehostCapabilities" href="#CodehostCapabilities">type CodehostCapabilities map[types.CodehostCapability]bool</a>

```
searchKey: types.CodehostCapabilities
tags: [exported]
```

```Go
type CodehostCapabilities map[CodehostCapability]bool
```

### <a id="Keyer" href="#Keyer">type Keyer interface</a>

```
searchKey: types.Keyer
tags: [exported]
```

```Go
type Keyer interface {
	Key() string
}
```

Keyer represents items that return a unique key 

### <a id="changesetSyncStateTestCase" href="#changesetSyncStateTestCase">type changesetSyncStateTestCase struct</a>

```
searchKey: types.changesetSyncStateTestCase
```

```Go
type changesetSyncStateTestCase struct {
	state [2]ChangesetSyncState
	want  bool
}
```

## <a id="func" href="#func">Functions</a>

### <a id="WithCurrentSpecID" href="#WithCurrentSpecID">func WithCurrentSpecID(id int64) func(*Changeset) bool</a>

```
searchKey: types.WithCurrentSpecID
tags: [exported]
```

```Go
func WithCurrentSpecID(id int64) func(*Changeset) bool
```

WithCurrentSpecID returns a predicate function that can be passed to Changesets.Filter/Find, etc. 

### <a id="WithExternalID" href="#WithExternalID">func WithExternalID(id string) func(*Changeset) bool</a>

```
searchKey: types.WithExternalID
tags: [exported]
```

```Go
func WithExternalID(id string) func(*Changeset) bool
```

WithExternalID returns a predicate function that can be passed to Changesets.Filter/Find, etc. 

### <a id="NewChangesetEventMetadata" href="#NewChangesetEventMetadata">func NewChangesetEventMetadata(k ChangesetEventKind) (interface{}, error)</a>

```
searchKey: types.NewChangesetEventMetadata
tags: [exported]
```

```Go
func NewChangesetEventMetadata(k ChangesetEventKind) (interface{}, error)
```

NewChangesetEventMetadata returns a new metadata object for the given ChangesetEventKind. 

### <a id="updateGitHubPullRequestReview" href="#updateGitHubPullRequestReview">func updateGitHubPullRequestReview(e, o *github.PullRequestReview)</a>

```
searchKey: types.updateGitHubPullRequestReview
```

```Go
func updateGitHubPullRequestReview(e, o *github.PullRequestReview)
```

### <a id="updateGitHubCommit" href="#updateGitHubCommit">func updateGitHubCommit(e, o *github.Commit)</a>

```
searchKey: types.updateGitHubCommit
```

```Go
func updateGitHubCommit(e, o *github.Commit)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: types.init
```

```Go
func init()
```

### <a id="keyID" href="#keyID">func keyID(ctx context.Context, key encryption.Key) (string, error)</a>

```
searchKey: types.keyID
```

```Go
func keyID(ctx context.Context, key encryption.Key) (string, error)
```

### <a id="IsRepoSupported" href="#IsRepoSupported">func IsRepoSupported(spec *api.ExternalRepoSpec) bool</a>

```
searchKey: types.IsRepoSupported
tags: [exported]
```

```Go
func IsRepoSupported(spec *api.ExternalRepoSpec) bool
```

IsRepoSupported returns whether the given ExternalRepoSpec is supported by the batch changes feature, based on the external service type. 

### <a id="IsKindSupported" href="#IsKindSupported">func IsKindSupported(extSvcKind string) bool</a>

```
searchKey: types.IsKindSupported
tags: [exported]
```

```Go
func IsKindSupported(extSvcKind string) bool
```

IsKindSupported returns whether the given extsvc Kind is supported by batch changes. 

### <a id="ExternalServiceSupports" href="#ExternalServiceSupports">func ExternalServiceSupports(extSvcType string, capability CodehostCapability) bool</a>

```
searchKey: types.ExternalServiceSupports
tags: [exported]
```

```Go
func ExternalServiceSupports(extSvcType string, capability CodehostCapability) bool
```

### <a id="unixMilliToTime" href="#unixMilliToTime">func unixMilliToTime(ms int64) time.Time</a>

```
searchKey: types.unixMilliToTime
```

```Go
func unixMilliToTime(ms int64) time.Time
```

### <a id="TestBatchSpecUnmarshalValidate" href="#TestBatchSpecUnmarshalValidate">func TestBatchSpecUnmarshalValidate(t *testing.T)</a>

```
searchKey: types.TestBatchSpecUnmarshalValidate
```

```Go
func TestBatchSpecUnmarshalValidate(t *testing.T)
```

### <a id="TestChangesetEvent" href="#TestChangesetEvent">func TestChangesetEvent(t *testing.T)</a>

```
searchKey: types.TestChangesetEvent
```

```Go
func TestChangesetEvent(t *testing.T)
```

### <a id="TestChangesetSpecUnmarshalValidate" href="#TestChangesetSpecUnmarshalValidate">func TestChangesetSpecUnmarshalValidate(t *testing.T)</a>

```
searchKey: types.TestChangesetSpecUnmarshalValidate
```

```Go
func TestChangesetSpecUnmarshalValidate(t *testing.T)
```

### <a id="TestChangeset_Clone" href="#TestChangeset_Clone">func TestChangeset_Clone(t *testing.T)</a>

```
searchKey: types.TestChangeset_Clone
```

```Go
func TestChangeset_Clone(t *testing.T)
```

### <a id="TestChangeset_DiffStat" href="#TestChangeset_DiffStat">func TestChangeset_DiffStat(t *testing.T)</a>

```
searchKey: types.TestChangeset_DiffStat
```

```Go
func TestChangeset_DiffStat(t *testing.T)
```

### <a id="TestChangeset_SetMetadata" href="#TestChangeset_SetMetadata">func TestChangeset_SetMetadata(t *testing.T)</a>

```
searchKey: types.TestChangeset_SetMetadata
```

```Go
func TestChangeset_SetMetadata(t *testing.T)
```

### <a id="TestChangeset_Title" href="#TestChangeset_Title">func TestChangeset_Title(t *testing.T)</a>

```
searchKey: types.TestChangeset_Title
```

```Go
func TestChangeset_Title(t *testing.T)
```

### <a id="TestChangeset_ExternalCreatedAt" href="#TestChangeset_ExternalCreatedAt">func TestChangeset_ExternalCreatedAt(t *testing.T)</a>

```
searchKey: types.TestChangeset_ExternalCreatedAt
```

```Go
func TestChangeset_ExternalCreatedAt(t *testing.T)
```

### <a id="TestChangeset_Body" href="#TestChangeset_Body">func TestChangeset_Body(t *testing.T)</a>

```
searchKey: types.TestChangeset_Body
```

```Go
func TestChangeset_Body(t *testing.T)
```

### <a id="TestChangeset_URL" href="#TestChangeset_URL">func TestChangeset_URL(t *testing.T)</a>

```
searchKey: types.TestChangeset_URL
```

```Go
func TestChangeset_URL(t *testing.T)
```

### <a id="TestChangeset_HeadRefOid" href="#TestChangeset_HeadRefOid">func TestChangeset_HeadRefOid(t *testing.T)</a>

```
searchKey: types.TestChangeset_HeadRefOid
```

```Go
func TestChangeset_HeadRefOid(t *testing.T)
```

### <a id="TestChangeset_HeadRef" href="#TestChangeset_HeadRef">func TestChangeset_HeadRef(t *testing.T)</a>

```
searchKey: types.TestChangeset_HeadRef
```

```Go
func TestChangeset_HeadRef(t *testing.T)
```

### <a id="TestChangeset_BaseRefOid" href="#TestChangeset_BaseRefOid">func TestChangeset_BaseRefOid(t *testing.T)</a>

```
searchKey: types.TestChangeset_BaseRefOid
```

```Go
func TestChangeset_BaseRefOid(t *testing.T)
```

### <a id="TestChangeset_BaseRef" href="#TestChangeset_BaseRef">func TestChangeset_BaseRef(t *testing.T)</a>

```
searchKey: types.TestChangeset_BaseRef
```

```Go
func TestChangeset_BaseRef(t *testing.T)
```

### <a id="TestChangeset_Labels" href="#TestChangeset_Labels">func TestChangeset_Labels(t *testing.T)</a>

```
searchKey: types.TestChangeset_Labels
```

```Go
func TestChangeset_Labels(t *testing.T)
```

### <a id="TestChangesetMetadata" href="#TestChangesetMetadata">func TestChangesetMetadata(t *testing.T)</a>

```
searchKey: types.TestChangesetMetadata
```

```Go
func TestChangesetMetadata(t *testing.T)
```

### <a id="TestChangeset_ResetReconcilerState" href="#TestChangeset_ResetReconcilerState">func TestChangeset_ResetReconcilerState(t *testing.T)</a>

```
searchKey: types.TestChangeset_ResetReconcilerState
```

```Go
func TestChangeset_ResetReconcilerState(t *testing.T)
```

### <a id="TestChangesetSyncStateEquals" href="#TestChangesetSyncStateEquals">func TestChangesetSyncStateEquals(t *testing.T)</a>

```
searchKey: types.TestChangesetSyncStateEquals
```

```Go
func TestChangesetSyncStateEquals(t *testing.T)
```

