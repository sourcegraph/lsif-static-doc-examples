# Package state

## Index

* [Constants](#const)
    * [const timestampCount](#timestampCount)
* [Variables](#var)
    * [var RequiredEventTypesForHistory](#RequiredEventTypesForHistory)
    * [var ComputeLabelsRequiredEventTypes](#ComputeLabelsRequiredEventTypes)
* [Types](#type)
    * [type ChangesetEvents []*types.ChangesetEvent](#ChangesetEvents)
        * [func (ce ChangesetEvents) Len() int](#ChangesetEvents.Len)
        * [func (ce ChangesetEvents) Swap(i, j int)](#ChangesetEvents.Swap)
        * [func (ce ChangesetEvents) Less(i, j int) bool](#ChangesetEvents.Less)
    * [type changesetHistory []state.changesetStatesAtTime](#changesetHistory)
        * [func computeHistory(ch *btypes.Changeset, ce ChangesetEvents) (changesetHistory, error)](#computeHistory)
        * [func (h changesetHistory) StatesAtTime(t time.Time) (changesetStatesAtTime, bool)](#changesetHistory.StatesAtTime)
    * [type changesetStatesAtTime struct](#changesetStatesAtTime)
    * [type ChangesetCounts struct](#ChangesetCounts)
        * [func (cc *ChangesetCounts) String() string](#ChangesetCounts.String)
* [Functions](#func)
    * [func reduceReviewStates(statesByAuthor map[string]btypes.ChangesetReviewState) btypes.ChangesetReviewState](#reduceReviewStates)
    * [func initialExternalState(ch *btypes.Changeset, ce ChangesetEvents) btypes.ChangesetExternalState](#initialExternalState)
    * [func CalcCounts(start, end time.Time, cs []*btypes.Changeset, es ...*btypes.ChangesetEvent) ([]*ChangesetCounts, error)](#CalcCounts)
    * [func GenerateTimestamps(start, end time.Time) []time.Time](#GenerateTimestamps)
    * [func SetDerivedState(ctx context.Context, repoStore *database.RepoStore, c *btypes.Changeset, es []*btypes.ChangesetEvent)](#SetDerivedState)
    * [func computeCheckState(c *btypes.Changeset, events ChangesetEvents) btypes.ChangesetCheckState](#computeCheckState)
    * [func computeExternalState(c *btypes.Changeset, history []changesetStatesAtTime) (btypes.ChangesetExternalState, error)](#computeExternalState)
    * [func computeReviewState(c *btypes.Changeset, history []changesetStatesAtTime) (btypes.ChangesetReviewState, error)](#computeReviewState)
    * [func computeBitbucketBuildStatus(lastSynced time.Time, pr *bitbucketserver.PullRequest, events []*btypes.ChangesetEvent) btypes.ChangesetCheckState](#computeBitbucketBuildStatus)
    * [func parseBitbucketBuildState(s string) btypes.ChangesetCheckState](#parseBitbucketBuildState)
    * [func computeGitHubCheckState(lastSynced time.Time, pr *github.PullRequest, events []*btypes.ChangesetEvent) btypes.ChangesetCheckState](#computeGitHubCheckState)
    * [func combineCheckStates(states []btypes.ChangesetCheckState) btypes.ChangesetCheckState](#combineCheckStates)
    * [func parseGithubCheckState(s string) btypes.ChangesetCheckState](#parseGithubCheckState)
    * [func parseGithubCheckSuiteState(status, conclusion string) btypes.ChangesetCheckState](#parseGithubCheckSuiteState)
    * [func computeGitLabCheckState(lastSynced time.Time, mr *gitlab.MergeRequest, events []*btypes.ChangesetEvent) btypes.ChangesetCheckState](#computeGitLabCheckState)
    * [func parseGitLabPipelineStatus(status gitlab.PipelineStatus) btypes.ChangesetCheckState](#parseGitLabPipelineStatus)
    * [func computeSingleChangesetExternalState(c *btypes.Changeset) (s btypes.ChangesetExternalState, err error)](#computeSingleChangesetExternalState)
    * [func computeSingleChangesetReviewState(c *btypes.Changeset) (s btypes.ChangesetReviewState, err error)](#computeSingleChangesetReviewState)
    * [func selectReviewState(states map[btypes.ChangesetReviewState]bool) btypes.ChangesetReviewState](#selectReviewState)
    * [func computeDiffStat(ctx context.Context, c *btypes.Changeset, repo api.RepoName) (*diff.Stat, error)](#computeDiffStat)
    * [func computeSyncState(ctx context.Context, c *btypes.Changeset, repo api.RepoName) (*btypes.ChangesetSyncState, error)](#computeSyncState)
    * [func computeRev(ctx context.Context, repo api.RepoName, getOid, getRef func() (string, error)) (string, error)](#computeRev)
    * [func changesetRepoName(ctx context.Context, repoStore *database.RepoStore, c *btypes.Changeset) (api.RepoName, error)](#changesetRepoName)
    * [func unixMilliToTime(ms int64) time.Time](#unixMilliToTime)
    * [func ComputeLabels(c *btypes.Changeset, events ChangesetEvents) []btypes.ChangesetLabel](#ComputeLabels)
    * [func TestCalcCounts(t *testing.T)](#TestCalcCounts)
    * [func ghChangeset(id int64, t time.Time) *btypes.Changeset](#ghChangeset)
    * [func bbsChangeset(id int64, t time.Time) *btypes.Changeset](#bbsChangeset)
    * [func glChangeset(id int64, t time.Time) *btypes.Changeset](#glChangeset)
    * [func setExternalDeletedAt(c *btypes.Changeset, t time.Time) *btypes.Changeset](#setExternalDeletedAt)
    * [func event(t *testing.T, ti time.Time, kind btypes.ChangesetEventKind, id int64) *btypes.ChangesetEvent](#event)
    * [func ghReview(id int64, t time.Time, login, state string) *btypes.ChangesetEvent](#ghReview)
    * [func ghReviewDismissed(id int64, t time.Time, login, reviewer string) *btypes.ChangesetEvent](#ghReviewDismissed)
    * [func ghReadyForReview(id int64, t time.Time, login string) *btypes.ChangesetEvent](#ghReadyForReview)
    * [func ghConvertToDraft(id int64, t time.Time, login string) *btypes.ChangesetEvent](#ghConvertToDraft)
    * [func glUnmarkWorkInProgress(id int64, t time.Time, login string) *btypes.ChangesetEvent](#glUnmarkWorkInProgress)
    * [func glMarkWorkInProgress(id int64, t time.Time, login string) *btypes.ChangesetEvent](#glMarkWorkInProgress)
    * [func glClosed(id int64, t time.Time, login string) *btypes.ChangesetEvent](#glClosed)
    * [func glReopen(id int64, t time.Time, login string) *btypes.ChangesetEvent](#glReopen)
    * [func bbsActivity(id int64, t time.Time, username string, kind btypes.ChangesetEventKind) *btypes.ChangesetEvent](#bbsActivity)
    * [func bbsParticipantEvent(id int64, t time.Time, username string, kind btypes.ChangesetEventKind) *btypes.ChangesetEvent](#bbsParticipantEvent)
    * [func setDraft(c *btypes.Changeset) *btypes.Changeset](#setDraft)
    * [func timeToUnixMilli(t time.Time) int](#timeToUnixMilli)
    * [func TestComputeGithubCheckState(t *testing.T)](#TestComputeGithubCheckState)
    * [func TestComputeBitbucketBuildStatus(t *testing.T)](#TestComputeBitbucketBuildStatus)
    * [func TestComputeGitLabCheckState(t *testing.T)](#TestComputeGitLabCheckState)
    * [func TestComputeReviewState(t *testing.T)](#TestComputeReviewState)
    * [func TestComputeExternalState(t *testing.T)](#TestComputeExternalState)
    * [func TestComputeLabels(t *testing.T)](#TestComputeLabels)
    * [func bitbucketChangeset(updatedAt time.Time, state, reviewStatus string) *btypes.Changeset](#bitbucketChangeset)
    * [func githubChangeset(updatedAt time.Time, state string) *btypes.Changeset](#githubChangeset)
    * [func gitLabChangeset(updatedAt time.Time, state gitlab.MergeRequestState, notes []*gitlab.Note) *btypes.Changeset](#gitLabChangeset)
    * [func setDeletedAt(c *btypes.Changeset, deletedAt time.Time) *btypes.Changeset](#setDeletedAt)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="timestampCount" href="#timestampCount">const timestampCount</a>

```
searchKey: state.timestampCount
tags: [private]
```

```Go
const timestampCount = 150
```

timestampCount defines how many timestamps we will return for a given dateframe. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="RequiredEventTypesForHistory" href="#RequiredEventTypesForHistory">var RequiredEventTypesForHistory</a>

```
searchKey: state.RequiredEventTypesForHistory
```

```Go
var RequiredEventTypesForHistory = ...
```

RequiredEventTypesForHistory keeps track of all event kinds required for calculating the history of a changeset. 

We specifically ignore ChangesetEventKindGitHubReviewDismissed events since GitHub updates the original ChangesetEventKindGitHubReviewed event when a review has been dismissed. See: [https://github.com/sourcegraph/sourcegraph/pull/9461](https://github.com/sourcegraph/sourcegraph/pull/9461) 

### <a id="ComputeLabelsRequiredEventTypes" href="#ComputeLabelsRequiredEventTypes">var ComputeLabelsRequiredEventTypes</a>

```
searchKey: state.ComputeLabelsRequiredEventTypes
```

```Go
var ComputeLabelsRequiredEventTypes = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="ChangesetEvents" href="#ChangesetEvents">type ChangesetEvents []*types.ChangesetEvent</a>

```
searchKey: state.ChangesetEvents
```

```Go
type ChangesetEvents []*btypes.ChangesetEvent
```

ChangesetEvents is a collection of changeset events 

#### <a id="ChangesetEvents.Len" href="#ChangesetEvents.Len">func (ce ChangesetEvents) Len() int</a>

```
searchKey: state.ChangesetEvents.Len
```

```Go
func (ce ChangesetEvents) Len() int
```

#### <a id="ChangesetEvents.Swap" href="#ChangesetEvents.Swap">func (ce ChangesetEvents) Swap(i, j int)</a>

```
searchKey: state.ChangesetEvents.Swap
```

```Go
func (ce ChangesetEvents) Swap(i, j int)
```

#### <a id="ChangesetEvents.Less" href="#ChangesetEvents.Less">func (ce ChangesetEvents) Less(i, j int) bool</a>

```
searchKey: state.ChangesetEvents.Less
```

```Go
func (ce ChangesetEvents) Less(i, j int) bool
```

Less sorts changeset events by their Timestamps 

### <a id="changesetHistory" href="#changesetHistory">type changesetHistory []state.changesetStatesAtTime</a>

```
searchKey: state.changesetHistory
tags: [private]
```

```Go
type changesetHistory []changesetStatesAtTime
```

changesetHistory is a collection of external changeset states (open/closed/merged state and review state) over time. 

#### <a id="computeHistory" href="#computeHistory">func computeHistory(ch *btypes.Changeset, ce ChangesetEvents) (changesetHistory, error)</a>

```
searchKey: state.computeHistory
tags: [private]
```

```Go
func computeHistory(ch *btypes.Changeset, ce ChangesetEvents) (changesetHistory, error)
```

computeHistory calculates the changesetHistory for the given Changeset and its ChangesetEvents. The ChangesetEvents MUST be sorted by their Timestamp. 

#### <a id="changesetHistory.StatesAtTime" href="#changesetHistory.StatesAtTime">func (h changesetHistory) StatesAtTime(t time.Time) (changesetStatesAtTime, bool)</a>

```
searchKey: state.changesetHistory.StatesAtTime
tags: [private]
```

```Go
func (h changesetHistory) StatesAtTime(t time.Time) (changesetStatesAtTime, bool)
```

StatesAtTime returns the changeset's states valid at the given time. If the changeset didn't exist yet, the second parameter is false. 

### <a id="changesetStatesAtTime" href="#changesetStatesAtTime">type changesetStatesAtTime struct</a>

```
searchKey: state.changesetStatesAtTime
tags: [private]
```

```Go
type changesetStatesAtTime struct {
	t             time.Time
	externalState btypes.ChangesetExternalState
	reviewState   btypes.ChangesetReviewState
}
```

### <a id="ChangesetCounts" href="#ChangesetCounts">type ChangesetCounts struct</a>

```
searchKey: state.ChangesetCounts
```

```Go
type ChangesetCounts struct {
	Time                 time.Time
	Total                int32
	Merged               int32
	Closed               int32
	Draft                int32
	Open                 int32
	OpenApproved         int32
	OpenChangesRequested int32
	OpenPending          int32
}
```

ChangesetCounts represents the states in which a given set of Changesets was at a given point in time 

#### <a id="ChangesetCounts.String" href="#ChangesetCounts.String">func (cc *ChangesetCounts) String() string</a>

```
searchKey: state.ChangesetCounts.String
```

```Go
func (cc *ChangesetCounts) String() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="reduceReviewStates" href="#reduceReviewStates">func reduceReviewStates(statesByAuthor map[string]btypes.ChangesetReviewState) btypes.ChangesetReviewState</a>

```
searchKey: state.reduceReviewStates
tags: [private]
```

```Go
func reduceReviewStates(statesByAuthor map[string]btypes.ChangesetReviewState) btypes.ChangesetReviewState
```

reduceReviewStates reduces the given a map of review per author down to a single overall ChangesetReviewState. 

### <a id="initialExternalState" href="#initialExternalState">func initialExternalState(ch *btypes.Changeset, ce ChangesetEvents) btypes.ChangesetExternalState</a>

```
searchKey: state.initialExternalState
tags: [private]
```

```Go
func initialExternalState(ch *btypes.Changeset, ce ChangesetEvents) btypes.ChangesetExternalState
```

initialExternalState infers from the changeset state and the list of events in which ChangesetExternalState the changeset must have been when it has been created. 

### <a id="CalcCounts" href="#CalcCounts">func CalcCounts(start, end time.Time, cs []*btypes.Changeset, es ...*btypes.ChangesetEvent) ([]*ChangesetCounts, error)</a>

```
searchKey: state.CalcCounts
```

```Go
func CalcCounts(start, end time.Time, cs []*btypes.Changeset, es ...*btypes.ChangesetEvent) ([]*ChangesetCounts, error)
```

CalcCounts calculates ChangesetCounts for the given Changesets and their ChangesetEvents in the timeframe specified by the start and end parameters. The number of ChangesetCounts returned is always `timestampCount`. Between start and end, it generates `timestampCount` datapoints with each ChangesetCounts representing a point in time. `es` are expected to be pre-sorted. 

### <a id="GenerateTimestamps" href="#GenerateTimestamps">func GenerateTimestamps(start, end time.Time) []time.Time</a>

```
searchKey: state.GenerateTimestamps
```

```Go
func GenerateTimestamps(start, end time.Time) []time.Time
```

### <a id="SetDerivedState" href="#SetDerivedState">func SetDerivedState(ctx context.Context, repoStore *database.RepoStore, c *btypes.Changeset, es []*btypes.ChangesetEvent)</a>

```
searchKey: state.SetDerivedState
```

```Go
func SetDerivedState(ctx context.Context, repoStore *database.RepoStore, c *btypes.Changeset, es []*btypes.ChangesetEvent)
```

SetDerivedState will update the external state fields on the Changeset based on the current state of the changeset and associated events. 

### <a id="computeCheckState" href="#computeCheckState">func computeCheckState(c *btypes.Changeset, events ChangesetEvents) btypes.ChangesetCheckState</a>

```
searchKey: state.computeCheckState
tags: [private]
```

```Go
func computeCheckState(c *btypes.Changeset, events ChangesetEvents) btypes.ChangesetCheckState
```

computeCheckState computes the overall check state based on the current synced check state and any webhook events that have arrived after the most recent sync. 

### <a id="computeExternalState" href="#computeExternalState">func computeExternalState(c *btypes.Changeset, history []changesetStatesAtTime) (btypes.ChangesetExternalState, error)</a>

```
searchKey: state.computeExternalState
tags: [private]
```

```Go
func computeExternalState(c *btypes.Changeset, history []changesetStatesAtTime) (btypes.ChangesetExternalState, error)
```

computeExternalState computes the external state for the changeset and its associated events. 

### <a id="computeReviewState" href="#computeReviewState">func computeReviewState(c *btypes.Changeset, history []changesetStatesAtTime) (btypes.ChangesetReviewState, error)</a>

```
searchKey: state.computeReviewState
tags: [private]
```

```Go
func computeReviewState(c *btypes.Changeset, history []changesetStatesAtTime) (btypes.ChangesetReviewState, error)
```

computeReviewState computes the review state for the changeset and its associated events. The events should be presorted. 

### <a id="computeBitbucketBuildStatus" href="#computeBitbucketBuildStatus">func computeBitbucketBuildStatus(lastSynced time.Time, pr *bitbucketserver.PullRequest, events []*btypes.ChangesetEvent) btypes.ChangesetCheckState</a>

```
searchKey: state.computeBitbucketBuildStatus
tags: [private]
```

```Go
func computeBitbucketBuildStatus(lastSynced time.Time, pr *bitbucketserver.PullRequest, events []*btypes.ChangesetEvent) btypes.ChangesetCheckState
```

### <a id="parseBitbucketBuildState" href="#parseBitbucketBuildState">func parseBitbucketBuildState(s string) btypes.ChangesetCheckState</a>

```
searchKey: state.parseBitbucketBuildState
tags: [private]
```

```Go
func parseBitbucketBuildState(s string) btypes.ChangesetCheckState
```

### <a id="computeGitHubCheckState" href="#computeGitHubCheckState">func computeGitHubCheckState(lastSynced time.Time, pr *github.PullRequest, events []*btypes.ChangesetEvent) btypes.ChangesetCheckState</a>

```
searchKey: state.computeGitHubCheckState
tags: [private]
```

```Go
func computeGitHubCheckState(lastSynced time.Time, pr *github.PullRequest, events []*btypes.ChangesetEvent) btypes.ChangesetCheckState
```

### <a id="combineCheckStates" href="#combineCheckStates">func combineCheckStates(states []btypes.ChangesetCheckState) btypes.ChangesetCheckState</a>

```
searchKey: state.combineCheckStates
tags: [private]
```

```Go
func combineCheckStates(states []btypes.ChangesetCheckState) btypes.ChangesetCheckState
```

combineCheckStates combines multiple check states into an overall state pending takes highest priority followed by error success return only if all successful 

### <a id="parseGithubCheckState" href="#parseGithubCheckState">func parseGithubCheckState(s string) btypes.ChangesetCheckState</a>

```
searchKey: state.parseGithubCheckState
tags: [private]
```

```Go
func parseGithubCheckState(s string) btypes.ChangesetCheckState
```

### <a id="parseGithubCheckSuiteState" href="#parseGithubCheckSuiteState">func parseGithubCheckSuiteState(status, conclusion string) btypes.ChangesetCheckState</a>

```
searchKey: state.parseGithubCheckSuiteState
tags: [private]
```

```Go
func parseGithubCheckSuiteState(status, conclusion string) btypes.ChangesetCheckState
```

### <a id="computeGitLabCheckState" href="#computeGitLabCheckState">func computeGitLabCheckState(lastSynced time.Time, mr *gitlab.MergeRequest, events []*btypes.ChangesetEvent) btypes.ChangesetCheckState</a>

```
searchKey: state.computeGitLabCheckState
tags: [private]
```

```Go
func computeGitLabCheckState(lastSynced time.Time, mr *gitlab.MergeRequest, events []*btypes.ChangesetEvent) btypes.ChangesetCheckState
```

### <a id="parseGitLabPipelineStatus" href="#parseGitLabPipelineStatus">func parseGitLabPipelineStatus(status gitlab.PipelineStatus) btypes.ChangesetCheckState</a>

```
searchKey: state.parseGitLabPipelineStatus
tags: [private]
```

```Go
func parseGitLabPipelineStatus(status gitlab.PipelineStatus) btypes.ChangesetCheckState
```

### <a id="computeSingleChangesetExternalState" href="#computeSingleChangesetExternalState">func computeSingleChangesetExternalState(c *btypes.Changeset) (s btypes.ChangesetExternalState, err error)</a>

```
searchKey: state.computeSingleChangesetExternalState
tags: [private]
```

```Go
func computeSingleChangesetExternalState(c *btypes.Changeset) (s btypes.ChangesetExternalState, err error)
```

computeSingleChangesetExternalState of a Changeset based on the metadata. It does NOT reflect the final calculated state, use `ExternalState` instead. 

### <a id="computeSingleChangesetReviewState" href="#computeSingleChangesetReviewState">func computeSingleChangesetReviewState(c *btypes.Changeset) (s btypes.ChangesetReviewState, err error)</a>

```
searchKey: state.computeSingleChangesetReviewState
tags: [private]
```

```Go
func computeSingleChangesetReviewState(c *btypes.Changeset) (s btypes.ChangesetReviewState, err error)
```

computeSingleChangesetReviewState computes the review state of a Changeset. GitHub doesn't keep the review state on a changeset, so a GitHub Changeset will always return ChangesetReviewStatePending. 

This method should NOT be called directly. Use computeReviewState instead. 

### <a id="selectReviewState" href="#selectReviewState">func selectReviewState(states map[btypes.ChangesetReviewState]bool) btypes.ChangesetReviewState</a>

```
searchKey: state.selectReviewState
tags: [private]
```

```Go
func selectReviewState(states map[btypes.ChangesetReviewState]bool) btypes.ChangesetReviewState
```

selectReviewState computes the single review state for a given set of ChangesetReviewStates. Since a pull request, for example, can have multiple reviews with different states, we need a function to determine what the state for the pull request is. 

### <a id="computeDiffStat" href="#computeDiffStat">func computeDiffStat(ctx context.Context, c *btypes.Changeset, repo api.RepoName) (*diff.Stat, error)</a>

```
searchKey: state.computeDiffStat
tags: [private]
```

```Go
func computeDiffStat(ctx context.Context, c *btypes.Changeset, repo api.RepoName) (*diff.Stat, error)
```

computeDiffStat computes the up to date diffstat for the changeset, based on the values in c.SyncState. 

### <a id="computeSyncState" href="#computeSyncState">func computeSyncState(ctx context.Context, c *btypes.Changeset, repo api.RepoName) (*btypes.ChangesetSyncState, error)</a>

```
searchKey: state.computeSyncState
tags: [private]
```

```Go
func computeSyncState(ctx context.Context, c *btypes.Changeset, repo api.RepoName) (*btypes.ChangesetSyncState, error)
```

computeSyncState computes the up to date sync state based on the changeset as it currently exists on the external provider. 

### <a id="computeRev" href="#computeRev">func computeRev(ctx context.Context, repo api.RepoName, getOid, getRef func() (string, error)) (string, error)</a>

```
searchKey: state.computeRev
tags: [private]
```

```Go
func computeRev(ctx context.Context, repo api.RepoName, getOid, getRef func() (string, error)) (string, error)
```

### <a id="changesetRepoName" href="#changesetRepoName">func changesetRepoName(ctx context.Context, repoStore *database.RepoStore, c *btypes.Changeset) (api.RepoName, error)</a>

```
searchKey: state.changesetRepoName
tags: [private]
```

```Go
func changesetRepoName(ctx context.Context, repoStore *database.RepoStore, c *btypes.Changeset) (api.RepoName, error)
```

changesetRepoName looks up a api.RepoName based on the RepoID within a changeset. 

### <a id="unixMilliToTime" href="#unixMilliToTime">func unixMilliToTime(ms int64) time.Time</a>

```
searchKey: state.unixMilliToTime
tags: [private]
```

```Go
func unixMilliToTime(ms int64) time.Time
```

### <a id="ComputeLabels" href="#ComputeLabels">func ComputeLabels(c *btypes.Changeset, events ChangesetEvents) []btypes.ChangesetLabel</a>

```
searchKey: state.ComputeLabels
```

```Go
func ComputeLabels(c *btypes.Changeset, events ChangesetEvents) []btypes.ChangesetLabel
```

ComputeLabels returns a sorted list of current labels based the starting set of labels found in the Changeset and looking at ChangesetEvents that have occurred after the Changeset.UpdatedAt. The events should be presorted. 

### <a id="TestCalcCounts" href="#TestCalcCounts">func TestCalcCounts(t *testing.T)</a>

```
searchKey: state.TestCalcCounts
tags: [private]
```

```Go
func TestCalcCounts(t *testing.T)
```

### <a id="ghChangeset" href="#ghChangeset">func ghChangeset(id int64, t time.Time) *btypes.Changeset</a>

```
searchKey: state.ghChangeset
tags: [private]
```

```Go
func ghChangeset(id int64, t time.Time) *btypes.Changeset
```

### <a id="bbsChangeset" href="#bbsChangeset">func bbsChangeset(id int64, t time.Time) *btypes.Changeset</a>

```
searchKey: state.bbsChangeset
tags: [private]
```

```Go
func bbsChangeset(id int64, t time.Time) *btypes.Changeset
```

### <a id="glChangeset" href="#glChangeset">func glChangeset(id int64, t time.Time) *btypes.Changeset</a>

```
searchKey: state.glChangeset
tags: [private]
```

```Go
func glChangeset(id int64, t time.Time) *btypes.Changeset
```

### <a id="setExternalDeletedAt" href="#setExternalDeletedAt">func setExternalDeletedAt(c *btypes.Changeset, t time.Time) *btypes.Changeset</a>

```
searchKey: state.setExternalDeletedAt
tags: [private]
```

```Go
func setExternalDeletedAt(c *btypes.Changeset, t time.Time) *btypes.Changeset
```

### <a id="event" href="#event">func event(t *testing.T, ti time.Time, kind btypes.ChangesetEventKind, id int64) *btypes.ChangesetEvent</a>

```
searchKey: state.event
tags: [private]
```

```Go
func event(t *testing.T, ti time.Time, kind btypes.ChangesetEventKind, id int64) *btypes.ChangesetEvent
```

### <a id="ghReview" href="#ghReview">func ghReview(id int64, t time.Time, login, state string) *btypes.ChangesetEvent</a>

```
searchKey: state.ghReview
tags: [private]
```

```Go
func ghReview(id int64, t time.Time, login, state string) *btypes.ChangesetEvent
```

### <a id="ghReviewDismissed" href="#ghReviewDismissed">func ghReviewDismissed(id int64, t time.Time, login, reviewer string) *btypes.ChangesetEvent</a>

```
searchKey: state.ghReviewDismissed
tags: [private]
```

```Go
func ghReviewDismissed(id int64, t time.Time, login, reviewer string) *btypes.ChangesetEvent
```

### <a id="ghReadyForReview" href="#ghReadyForReview">func ghReadyForReview(id int64, t time.Time, login string) *btypes.ChangesetEvent</a>

```
searchKey: state.ghReadyForReview
tags: [private]
```

```Go
func ghReadyForReview(id int64, t time.Time, login string) *btypes.ChangesetEvent
```

### <a id="ghConvertToDraft" href="#ghConvertToDraft">func ghConvertToDraft(id int64, t time.Time, login string) *btypes.ChangesetEvent</a>

```
searchKey: state.ghConvertToDraft
tags: [private]
```

```Go
func ghConvertToDraft(id int64, t time.Time, login string) *btypes.ChangesetEvent
```

### <a id="glUnmarkWorkInProgress" href="#glUnmarkWorkInProgress">func glUnmarkWorkInProgress(id int64, t time.Time, login string) *btypes.ChangesetEvent</a>

```
searchKey: state.glUnmarkWorkInProgress
tags: [private]
```

```Go
func glUnmarkWorkInProgress(id int64, t time.Time, login string) *btypes.ChangesetEvent
```

### <a id="glMarkWorkInProgress" href="#glMarkWorkInProgress">func glMarkWorkInProgress(id int64, t time.Time, login string) *btypes.ChangesetEvent</a>

```
searchKey: state.glMarkWorkInProgress
tags: [private]
```

```Go
func glMarkWorkInProgress(id int64, t time.Time, login string) *btypes.ChangesetEvent
```

### <a id="glClosed" href="#glClosed">func glClosed(id int64, t time.Time, login string) *btypes.ChangesetEvent</a>

```
searchKey: state.glClosed
tags: [private]
```

```Go
func glClosed(id int64, t time.Time, login string) *btypes.ChangesetEvent
```

### <a id="glReopen" href="#glReopen">func glReopen(id int64, t time.Time, login string) *btypes.ChangesetEvent</a>

```
searchKey: state.glReopen
tags: [private]
```

```Go
func glReopen(id int64, t time.Time, login string) *btypes.ChangesetEvent
```

### <a id="bbsActivity" href="#bbsActivity">func bbsActivity(id int64, t time.Time, username string, kind btypes.ChangesetEventKind) *btypes.ChangesetEvent</a>

```
searchKey: state.bbsActivity
tags: [private]
```

```Go
func bbsActivity(id int64, t time.Time, username string, kind btypes.ChangesetEventKind) *btypes.ChangesetEvent
```

### <a id="bbsParticipantEvent" href="#bbsParticipantEvent">func bbsParticipantEvent(id int64, t time.Time, username string, kind btypes.ChangesetEventKind) *btypes.ChangesetEvent</a>

```
searchKey: state.bbsParticipantEvent
tags: [private]
```

```Go
func bbsParticipantEvent(id int64, t time.Time, username string, kind btypes.ChangesetEventKind) *btypes.ChangesetEvent
```

### <a id="setDraft" href="#setDraft">func setDraft(c *btypes.Changeset) *btypes.Changeset</a>

```
searchKey: state.setDraft
tags: [private]
```

```Go
func setDraft(c *btypes.Changeset) *btypes.Changeset
```

### <a id="timeToUnixMilli" href="#timeToUnixMilli">func timeToUnixMilli(t time.Time) int</a>

```
searchKey: state.timeToUnixMilli
tags: [private]
```

```Go
func timeToUnixMilli(t time.Time) int
```

### <a id="TestComputeGithubCheckState" href="#TestComputeGithubCheckState">func TestComputeGithubCheckState(t *testing.T)</a>

```
searchKey: state.TestComputeGithubCheckState
tags: [private]
```

```Go
func TestComputeGithubCheckState(t *testing.T)
```

### <a id="TestComputeBitbucketBuildStatus" href="#TestComputeBitbucketBuildStatus">func TestComputeBitbucketBuildStatus(t *testing.T)</a>

```
searchKey: state.TestComputeBitbucketBuildStatus
tags: [private]
```

```Go
func TestComputeBitbucketBuildStatus(t *testing.T)
```

### <a id="TestComputeGitLabCheckState" href="#TestComputeGitLabCheckState">func TestComputeGitLabCheckState(t *testing.T)</a>

```
searchKey: state.TestComputeGitLabCheckState
tags: [private]
```

```Go
func TestComputeGitLabCheckState(t *testing.T)
```

### <a id="TestComputeReviewState" href="#TestComputeReviewState">func TestComputeReviewState(t *testing.T)</a>

```
searchKey: state.TestComputeReviewState
tags: [private]
```

```Go
func TestComputeReviewState(t *testing.T)
```

### <a id="TestComputeExternalState" href="#TestComputeExternalState">func TestComputeExternalState(t *testing.T)</a>

```
searchKey: state.TestComputeExternalState
tags: [private]
```

```Go
func TestComputeExternalState(t *testing.T)
```

### <a id="TestComputeLabels" href="#TestComputeLabels">func TestComputeLabels(t *testing.T)</a>

```
searchKey: state.TestComputeLabels
tags: [private]
```

```Go
func TestComputeLabels(t *testing.T)
```

### <a id="bitbucketChangeset" href="#bitbucketChangeset">func bitbucketChangeset(updatedAt time.Time, state, reviewStatus string) *btypes.Changeset</a>

```
searchKey: state.bitbucketChangeset
tags: [private]
```

```Go
func bitbucketChangeset(updatedAt time.Time, state, reviewStatus string) *btypes.Changeset
```

### <a id="githubChangeset" href="#githubChangeset">func githubChangeset(updatedAt time.Time, state string) *btypes.Changeset</a>

```
searchKey: state.githubChangeset
tags: [private]
```

```Go
func githubChangeset(updatedAt time.Time, state string) *btypes.Changeset
```

### <a id="gitLabChangeset" href="#gitLabChangeset">func gitLabChangeset(updatedAt time.Time, state gitlab.MergeRequestState, notes []*gitlab.Note) *btypes.Changeset</a>

```
searchKey: state.gitLabChangeset
tags: [private]
```

```Go
func gitLabChangeset(updatedAt time.Time, state gitlab.MergeRequestState, notes []*gitlab.Note) *btypes.Changeset
```

### <a id="setDeletedAt" href="#setDeletedAt">func setDeletedAt(c *btypes.Changeset, deletedAt time.Time) *btypes.Changeset</a>

```
searchKey: state.setDeletedAt
tags: [private]
```

```Go
func setDeletedAt(c *btypes.Changeset, deletedAt time.Time) *btypes.Changeset
```

