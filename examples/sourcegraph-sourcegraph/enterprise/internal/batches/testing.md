# Package testing

## Index

* [Constants](#const)
    * [const ChangesetSpecAuthorEmail](#ChangesetSpecAuthorEmail)
    * [const ChangesetSpecDiff](#ChangesetSpecDiff)
    * [const TestRawBatchSpec](#TestRawBatchSpec)
    * [const TestRawBatchSpecYAML](#TestRawBatchSpecYAML)
* [Variables](#var)
    * [var ChangesetSpecDiffStat](#ChangesetSpecDiffStat)
    * [var CreateTestUser](#CreateTestUser)
    * [var FailedChangesetFailureMessage](#FailedChangesetFailureMessage)
    * [var TestChangsetSpecDiffStat](#TestChangsetSpecDiffStat)
    * [var baseChangesetSpecGitBranch](#baseChangesetSpecGitBranch)
* [Types](#type)
    * [type ChangesetAssertions struct](#ChangesetAssertions)
    * [type Clock interface](#Clock)
    * [type CreateBatchChanger interface](#CreateBatchChanger)
    * [type CreateBatchSpecer interface](#CreateBatchSpecer)
    * [type CreateChangesetSpecer interface](#CreateChangesetSpecer)
    * [type CreateChangeseter interface](#CreateChangeseter)
    * [type FakeGitserverClient struct](#FakeGitserverClient)
        * [func (f *FakeGitserverClient) CreateCommitFromPatch(ctx context.Context, req protocol.CreateCommitFromPatchRequest) (string, error)](#FakeGitserverClient.CreateCommitFromPatch)
    * [type GetChangesetByIDer interface](#GetChangesetByIDer)
    * [type MockedChangesetSyncState struct](#MockedChangesetSyncState)
        * [func MockChangesetSyncState(repo *protocol.RepoInfo) *MockedChangesetSyncState](#MockChangesetSyncState)
        * [func (state *MockedChangesetSyncState) Unmock()](#MockedChangesetSyncState.Unmock)
    * [type TestChangesetOpts struct](#TestChangesetOpts)
    * [type TestClock struct](#TestClock)
        * [func (c *TestClock) Add(d time.Duration) time.Time](#TestClock.Add)
        * [func (c *TestClock) Now() time.Time](#TestClock.Now)
    * [type TestSpecOpts struct](#TestSpecOpts)
    * [type UpdateChangeseter interface](#UpdateChangeseter)
    * [type createSiteCredentialer interface](#createSiteCredentialer)
* [Functions](#func)
    * [func AssertChangeset(t *testing.T, c *btypes.Changeset, a ChangesetAssertions)](#AssertChangeset)
    * [func BuildBatchChange(store CreateBatchChanger, name string, userID int32, spec int64) *btypes.BatchChange](#BuildBatchChange)
    * [func BuildChangeset(opts TestChangesetOpts) *btypes.Changeset](#BuildChangeset)
    * [func BuildChangesetSpec(t *testing.T, opts TestSpecOpts) *btypes.ChangesetSpec](#BuildChangesetSpec)
    * [func CreateBatchChange(t *testing.T, ctx context.Context, store CreateBatchChanger, name string, userID int32, spec int64) *btypes.BatchChange](#CreateBatchChange)
    * [func CreateBatchSpec(t *testing.T, ctx context.Context, store CreateBatchSpecer, name string, userID int32) *btypes.BatchSpec](#CreateBatchSpec)
    * [func CreateBbsSSHTestRepos(t *testing.T, ctx context.Context, db dbutil.DB, count int) ([]*types.Repo, *types.ExternalService)](#CreateBbsSSHTestRepos)
    * [func CreateBbsTestRepos(t *testing.T, ctx context.Context, db *sql.DB, count int) ([]*types.Repo, *types.ExternalService)](#CreateBbsTestRepos)
    * [func CreateChangeset(t *testing.T,...](#CreateChangeset)
    * [func CreateChangesetSpec(t *testing.T,...](#CreateChangesetSpec)
    * [func CreateGitHubSSHTestRepos(t *testing.T, ctx context.Context, db dbutil.DB, count int) ([]*types.Repo, *types.ExternalService)](#CreateGitHubSSHTestRepos)
    * [func CreateGitlabTestRepos(t *testing.T, ctx context.Context, db *sql.DB, count int) ([]*types.Repo, *types.ExternalService)](#CreateGitlabTestRepos)
    * [func CreateTestRepos(t *testing.T, ctx context.Context, db dbutil.DB, count int) ([]*types.Repo, *types.ExternalService)](#CreateTestRepos)
    * [func CreateTestSiteCredential(t *testing.T, bstore createSiteCredentialer, repo *types.Repo) *btypes.SiteCredential](#CreateTestSiteCredential)
    * [func InsertTestOrg(t *testing.T, db dbutil.DB, name string) (orgID int32)](#InsertTestOrg)
    * [func MarshalJSON(t testing.TB, v interface{}) string](#MarshalJSON)
    * [func MockConfig(t testing.TB, mockery *conf.Unified)](#MockConfig)
    * [func MockRSAKeygen(t *testing.T)](#MockRSAKeygen)
    * [func MockRepoPermissions(t *testing.T, db dbutil.DB, userID int32, repoIDs ...api.RepoID)](#MockRepoPermissions)
    * [func NewPublishedRawChangesetSpecGitBranch(repo graphql.ID, baseRev string, published batches.PublishedValue) string](#NewPublishedRawChangesetSpecGitBranch)
    * [func NewRawChangesetSpecExisting(repo graphql.ID, externalID string) string](#NewRawChangesetSpecExisting)
    * [func NewRawChangesetSpecGitBranch(repo graphql.ID, baseRev string) string](#NewRawChangesetSpecGitBranch)
    * [func ReloadAndAssertChangeset(t *testing.T, ctx context.Context, s GetChangesetByIDer, c *btypes.Changeset, a ChangesetAssertions) (reloaded *btypes.Changeset)](#ReloadAndAssertChangeset)
    * [func SetChangesetClosed(t *testing.T, ctx context.Context, s UpdateChangeseter, c *btypes.Changeset)](#SetChangesetClosed)
    * [func SetChangesetFailed(t *testing.T, ctx context.Context, s UpdateChangeseter, c *btypes.Changeset)](#SetChangesetFailed)
    * [func SetChangesetPublished(t *testing.T, ctx context.Context, s UpdateChangeseter, c *btypes.Changeset, externalID, externalBranch string)](#SetChangesetPublished)
    * [func TestRepo(t *testing.T, store *database.ExternalServiceStore, serviceKind string) *types.Repo](#TestRepo)
    * [func TestRepoWithService(t *testing.T, store *database.ExternalServiceStore, name string, svc *types.ExternalService) *types.Repo](#TestRepoWithService)
    * [func TruncateTables(t *testing.T, db *sql.DB, tables ...string)](#TruncateTables)
    * [func createBbsRepos(t *testing.T, ctx context.Context, db dbutil.DB, ext *types.ExternalService, count int, cloneBaseURL string) ([]*types.Repo, *types.ExternalService)](#createBbsRepos)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="ChangesetSpecAuthorEmail" href="#ChangesetSpecAuthorEmail">const ChangesetSpecAuthorEmail</a>

```
searchKey: testing.ChangesetSpecAuthorEmail
tags: [constant string]
```

```Go
const ChangesetSpecAuthorEmail = "mary@example.com"
```

### <a id="ChangesetSpecDiff" href="#ChangesetSpecDiff">const ChangesetSpecDiff</a>

```
searchKey: testing.ChangesetSpecDiff
tags: [constant string]
```

```Go
const ChangesetSpecDiff = ...
```

### <a id="TestRawBatchSpec" href="#TestRawBatchSpec">const TestRawBatchSpec</a>

```
searchKey: testing.TestRawBatchSpec
tags: [constant string]
```

```Go
const TestRawBatchSpec = ...
```

### <a id="TestRawBatchSpecYAML" href="#TestRawBatchSpecYAML">const TestRawBatchSpecYAML</a>

```
searchKey: testing.TestRawBatchSpecYAML
tags: [constant string]
```

```Go
const TestRawBatchSpecYAML = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="ChangesetSpecDiffStat" href="#ChangesetSpecDiffStat">var ChangesetSpecDiffStat</a>

```
searchKey: testing.ChangesetSpecDiffStat
tags: [variable struct]
```

```Go
var ChangesetSpecDiffStat = &diff.Stat{Added: 1, Changed: 2, Deleted: 1}
```

### <a id="CreateTestUser" href="#CreateTestUser">var CreateTestUser</a>

```
searchKey: testing.CreateTestUser
tags: [variable function]
```

```Go
var CreateTestUser = ...
```

### <a id="FailedChangesetFailureMessage" href="#FailedChangesetFailureMessage">var FailedChangesetFailureMessage</a>

```
searchKey: testing.FailedChangesetFailureMessage
tags: [variable string]
```

```Go
var FailedChangesetFailureMessage = "Failed test"
```

### <a id="TestChangsetSpecDiffStat" href="#TestChangsetSpecDiffStat">var TestChangsetSpecDiffStat</a>

```
searchKey: testing.TestChangsetSpecDiffStat
tags: [variable struct]
```

```Go
var TestChangsetSpecDiffStat = &diff.Stat{Added: 10, Changed: 5, Deleted: 2}
```

### <a id="baseChangesetSpecGitBranch" href="#baseChangesetSpecGitBranch">var baseChangesetSpecGitBranch</a>

```
searchKey: testing.baseChangesetSpecGitBranch
tags: [variable struct private]
```

```Go
var baseChangesetSpecGitBranch = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="ChangesetAssertions" href="#ChangesetAssertions">type ChangesetAssertions struct</a>

```
searchKey: testing.ChangesetAssertions
tags: [struct]
```

```Go
type ChangesetAssertions struct {
	Repo               api.RepoID
	CurrentSpec        int64
	PreviousSpec       int64
	OwnedByBatchChange int64
	ReconcilerState    btypes.ReconcilerState
	PublicationState   btypes.ChangesetPublicationState
	ExternalState      btypes.ChangesetExternalState
	ExternalID         string
	ExternalBranch     string
	DiffStat           *diff.Stat
	Closing            bool

	Title string
	Body  string

	FailureMessage   *string
	SyncErrorMessage *string
	NumFailures      int64
	NumResets        int64

	AttachedTo []int64
	DetachFrom []int64

	ArchiveIn                  int64
	ArchivedInOwnerBatchChange bool
}
```

### <a id="Clock" href="#Clock">type Clock interface</a>

```
searchKey: testing.Clock
tags: [interface]
```

```Go
type Clock interface {
	Now() time.Time
	Add(time.Duration) time.Time
}
```

### <a id="CreateBatchChanger" href="#CreateBatchChanger">type CreateBatchChanger interface</a>

```
searchKey: testing.CreateBatchChanger
tags: [interface]
```

```Go
type CreateBatchChanger interface {
	CreateBatchChange(ctx context.Context, batchChange *btypes.BatchChange) error
	Clock() func() time.Time
}
```

### <a id="CreateBatchSpecer" href="#CreateBatchSpecer">type CreateBatchSpecer interface</a>

```
searchKey: testing.CreateBatchSpecer
tags: [interface]
```

```Go
type CreateBatchSpecer interface {
	CreateBatchSpec(ctx context.Context, batchSpec *btypes.BatchSpec) error
}
```

### <a id="CreateChangesetSpecer" href="#CreateChangesetSpecer">type CreateChangesetSpecer interface</a>

```
searchKey: testing.CreateChangesetSpecer
tags: [interface]
```

```Go
type CreateChangesetSpecer interface {
	CreateChangesetSpec(ctx context.Context, changesetSpec *btypes.ChangesetSpec) error
}
```

### <a id="CreateChangeseter" href="#CreateChangeseter">type CreateChangeseter interface</a>

```
searchKey: testing.CreateChangeseter
tags: [interface]
```

```Go
type CreateChangeseter interface {
	CreateChangeset(ctx context.Context, changeset *btypes.Changeset) error
}
```

### <a id="FakeGitserverClient" href="#FakeGitserverClient">type FakeGitserverClient struct</a>

```
searchKey: testing.FakeGitserverClient
tags: [struct]
```

```Go
type FakeGitserverClient struct {
	Response    string
	ResponseErr error

	CreateCommitFromPatchCalled bool
	CreateCommitFromPatchReq    *protocol.CreateCommitFromPatchRequest
}
```

FakeGitserverClient is a test implementation of the GitserverClient interface required by ExecChangesetJob. 

#### <a id="FakeGitserverClient.CreateCommitFromPatch" href="#FakeGitserverClient.CreateCommitFromPatch">func (f *FakeGitserverClient) CreateCommitFromPatch(ctx context.Context, req protocol.CreateCommitFromPatchRequest) (string, error)</a>

```
searchKey: testing.FakeGitserverClient.CreateCommitFromPatch
tags: [method]
```

```Go
func (f *FakeGitserverClient) CreateCommitFromPatch(ctx context.Context, req protocol.CreateCommitFromPatchRequest) (string, error)
```

### <a id="GetChangesetByIDer" href="#GetChangesetByIDer">type GetChangesetByIDer interface</a>

```
searchKey: testing.GetChangesetByIDer
tags: [interface]
```

```Go
type GetChangesetByIDer interface {
	GetChangesetByID(ctx context.Context, id int64) (*btypes.Changeset, error)
}
```

### <a id="MockedChangesetSyncState" href="#MockedChangesetSyncState">type MockedChangesetSyncState struct</a>

```
searchKey: testing.MockedChangesetSyncState
tags: [struct]
```

```Go
type MockedChangesetSyncState struct {
	// DiffStat is the diff.Stat of the mocked "git diff" call to gitserver.
	DiffStat *diff.Stat

	execReader      func([]string) (io.ReadCloser, error)
	mockRepoLookup  func(protocol.RepoLookupArgs) (*protocol.RepoLookupResult, error)
	resolveRevision func(string, git.ResolveRevisionOptions) (api.CommitID, error)
}
```

#### <a id="MockChangesetSyncState" href="#MockChangesetSyncState">func MockChangesetSyncState(repo *protocol.RepoInfo) *MockedChangesetSyncState</a>

```
searchKey: testing.MockChangesetSyncState
tags: [method]
```

```Go
func MockChangesetSyncState(repo *protocol.RepoInfo) *MockedChangesetSyncState
```

MockChangesetSyncState sets up mocks such that invoking SetDerivedState() with a Changeset will use the same diff (+1, ~1, -3) when setting the SyncState on a Changeset. 

state.Unmock() must called to clean up, usually via defer. 

#### <a id="MockedChangesetSyncState.Unmock" href="#MockedChangesetSyncState.Unmock">func (state *MockedChangesetSyncState) Unmock()</a>

```
searchKey: testing.MockedChangesetSyncState.Unmock
tags: [function]
```

```Go
func (state *MockedChangesetSyncState) Unmock()
```

Unmock resets the mocks set up by MockGitHubChangesetSync. 

### <a id="TestChangesetOpts" href="#TestChangesetOpts">type TestChangesetOpts struct</a>

```
searchKey: testing.TestChangesetOpts
tags: [struct]
```

```Go
type TestChangesetOpts struct {
	Repo         api.RepoID
	BatchChange  int64
	CurrentSpec  int64
	PreviousSpec int64
	BatchChanges []btypes.BatchChangeAssoc

	ExternalServiceType string
	ExternalID          string
	ExternalBranch      string
	ExternalState       btypes.ChangesetExternalState
	ExternalReviewState btypes.ChangesetReviewState
	ExternalCheckState  btypes.ChangesetCheckState

	DiffStatAdded   int32
	DiffStatChanged int32
	DiffStatDeleted int32

	PublicationState btypes.ChangesetPublicationState

	ReconcilerState btypes.ReconcilerState
	FailureMessage  string
	NumFailures     int64

	OwnedByBatchChange int64

	Closing    bool
	IsArchived bool
	Archive    bool

	Metadata interface{}
}
```

### <a id="TestClock" href="#TestClock">type TestClock struct</a>

```
searchKey: testing.TestClock
tags: [struct]
```

```Go
type TestClock struct {
	Time time.Time
}
```

#### <a id="TestClock.Add" href="#TestClock.Add">func (c *TestClock) Add(d time.Duration) time.Time</a>

```
searchKey: testing.TestClock.Add
tags: [method]
```

```Go
func (c *TestClock) Add(d time.Duration) time.Time
```

#### <a id="TestClock.Now" href="#TestClock.Now">func (c *TestClock) Now() time.Time</a>

```
searchKey: testing.TestClock.Now
tags: [function]
```

```Go
func (c *TestClock) Now() time.Time
```

### <a id="TestSpecOpts" href="#TestSpecOpts">type TestSpecOpts struct</a>

```
searchKey: testing.TestSpecOpts
tags: [struct]
```

```Go
type TestSpecOpts struct {
	ID        int64
	User      int32
	Repo      api.RepoID
	BatchSpec int64

	// If this is non-blank, the changesetSpec will be an import/track spec for
	// the changeset with the given ExternalID in the given repo.
	ExternalID string

	// If this is set, the changesetSpec will be a "create commit on this
	// branch" changeset spec.
	HeadRef string

	// If this is set along with headRef, the changesetSpec will have Published
	// set.
	Published interface{}

	Title             string
	Body              string
	CommitMessage     string
	CommitDiff        string
	CommitAuthorEmail string
	CommitAuthorName  string

	BaseRev string
	BaseRef string
}
```

### <a id="UpdateChangeseter" href="#UpdateChangeseter">type UpdateChangeseter interface</a>

```
searchKey: testing.UpdateChangeseter
tags: [interface]
```

```Go
type UpdateChangeseter interface {
	UpdateChangeset(ctx context.Context, changeset *btypes.Changeset) error
}
```

### <a id="createSiteCredentialer" href="#createSiteCredentialer">type createSiteCredentialer interface</a>

```
searchKey: testing.createSiteCredentialer
tags: [interface private]
```

```Go
type createSiteCredentialer interface {
	CreateSiteCredential(context.Context, *btypes.SiteCredential, auth.Authenticator) error
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="AssertChangeset" href="#AssertChangeset">func AssertChangeset(t *testing.T, c *btypes.Changeset, a ChangesetAssertions)</a>

```
searchKey: testing.AssertChangeset
tags: [method]
```

```Go
func AssertChangeset(t *testing.T, c *btypes.Changeset, a ChangesetAssertions)
```

### <a id="BuildBatchChange" href="#BuildBatchChange">func BuildBatchChange(store CreateBatchChanger, name string, userID int32, spec int64) *btypes.BatchChange</a>

```
searchKey: testing.BuildBatchChange
tags: [method]
```

```Go
func BuildBatchChange(store CreateBatchChanger, name string, userID int32, spec int64) *btypes.BatchChange
```

### <a id="BuildChangeset" href="#BuildChangeset">func BuildChangeset(opts TestChangesetOpts) *btypes.Changeset</a>

```
searchKey: testing.BuildChangeset
tags: [method]
```

```Go
func BuildChangeset(opts TestChangesetOpts) *btypes.Changeset
```

### <a id="BuildChangesetSpec" href="#BuildChangesetSpec">func BuildChangesetSpec(t *testing.T, opts TestSpecOpts) *btypes.ChangesetSpec</a>

```
searchKey: testing.BuildChangesetSpec
tags: [method]
```

```Go
func BuildChangesetSpec(t *testing.T, opts TestSpecOpts) *btypes.ChangesetSpec
```

### <a id="CreateBatchChange" href="#CreateBatchChange">func CreateBatchChange(t *testing.T, ctx context.Context, store CreateBatchChanger, name string, userID int32, spec int64) *btypes.BatchChange</a>

```
searchKey: testing.CreateBatchChange
tags: [method]
```

```Go
func CreateBatchChange(t *testing.T, ctx context.Context, store CreateBatchChanger, name string, userID int32, spec int64) *btypes.BatchChange
```

### <a id="CreateBatchSpec" href="#CreateBatchSpec">func CreateBatchSpec(t *testing.T, ctx context.Context, store CreateBatchSpecer, name string, userID int32) *btypes.BatchSpec</a>

```
searchKey: testing.CreateBatchSpec
tags: [method]
```

```Go
func CreateBatchSpec(t *testing.T, ctx context.Context, store CreateBatchSpecer, name string, userID int32) *btypes.BatchSpec
```

### <a id="CreateBbsSSHTestRepos" href="#CreateBbsSSHTestRepos">func CreateBbsSSHTestRepos(t *testing.T, ctx context.Context, db dbutil.DB, count int) ([]*types.Repo, *types.ExternalService)</a>

```
searchKey: testing.CreateBbsSSHTestRepos
tags: [method]
```

```Go
func CreateBbsSSHTestRepos(t *testing.T, ctx context.Context, db dbutil.DB, count int) ([]*types.Repo, *types.ExternalService)
```

### <a id="CreateBbsTestRepos" href="#CreateBbsTestRepos">func CreateBbsTestRepos(t *testing.T, ctx context.Context, db *sql.DB, count int) ([]*types.Repo, *types.ExternalService)</a>

```
searchKey: testing.CreateBbsTestRepos
tags: [method]
```

```Go
func CreateBbsTestRepos(t *testing.T, ctx context.Context, db *sql.DB, count int) ([]*types.Repo, *types.ExternalService)
```

### <a id="CreateChangeset" href="#CreateChangeset">func CreateChangeset(t *testing.T,...</a>

```
searchKey: testing.CreateChangeset
tags: [method]
```

```Go
func CreateChangeset(
	t *testing.T,
	ctx context.Context,
	store CreateChangeseter,
	opts TestChangesetOpts,
) *btypes.Changeset
```

### <a id="CreateChangesetSpec" href="#CreateChangesetSpec">func CreateChangesetSpec(t *testing.T,...</a>

```
searchKey: testing.CreateChangesetSpec
tags: [method]
```

```Go
func CreateChangesetSpec(
	t *testing.T,
	ctx context.Context,
	store CreateChangesetSpecer,
	opts TestSpecOpts,
) *btypes.ChangesetSpec
```

### <a id="CreateGitHubSSHTestRepos" href="#CreateGitHubSSHTestRepos">func CreateGitHubSSHTestRepos(t *testing.T, ctx context.Context, db dbutil.DB, count int) ([]*types.Repo, *types.ExternalService)</a>

```
searchKey: testing.CreateGitHubSSHTestRepos
tags: [method]
```

```Go
func CreateGitHubSSHTestRepos(t *testing.T, ctx context.Context, db dbutil.DB, count int) ([]*types.Repo, *types.ExternalService)
```

### <a id="CreateGitlabTestRepos" href="#CreateGitlabTestRepos">func CreateGitlabTestRepos(t *testing.T, ctx context.Context, db *sql.DB, count int) ([]*types.Repo, *types.ExternalService)</a>

```
searchKey: testing.CreateGitlabTestRepos
tags: [method]
```

```Go
func CreateGitlabTestRepos(t *testing.T, ctx context.Context, db *sql.DB, count int) ([]*types.Repo, *types.ExternalService)
```

### <a id="CreateTestRepos" href="#CreateTestRepos">func CreateTestRepos(t *testing.T, ctx context.Context, db dbutil.DB, count int) ([]*types.Repo, *types.ExternalService)</a>

```
searchKey: testing.CreateTestRepos
tags: [method]
```

```Go
func CreateTestRepos(t *testing.T, ctx context.Context, db dbutil.DB, count int) ([]*types.Repo, *types.ExternalService)
```

### <a id="CreateTestSiteCredential" href="#CreateTestSiteCredential">func CreateTestSiteCredential(t *testing.T, bstore createSiteCredentialer, repo *types.Repo) *btypes.SiteCredential</a>

```
searchKey: testing.CreateTestSiteCredential
tags: [method]
```

```Go
func CreateTestSiteCredential(t *testing.T, bstore createSiteCredentialer, repo *types.Repo) *btypes.SiteCredential
```

### <a id="InsertTestOrg" href="#InsertTestOrg">func InsertTestOrg(t *testing.T, db dbutil.DB, name string) (orgID int32)</a>

```
searchKey: testing.InsertTestOrg
tags: [method]
```

```Go
func InsertTestOrg(t *testing.T, db dbutil.DB, name string) (orgID int32)
```

### <a id="MarshalJSON" href="#MarshalJSON">func MarshalJSON(t testing.TB, v interface{}) string</a>

```
searchKey: testing.MarshalJSON
tags: [method]
```

```Go
func MarshalJSON(t testing.TB, v interface{}) string
```

### <a id="MockConfig" href="#MockConfig">func MockConfig(t testing.TB, mockery *conf.Unified)</a>

```
searchKey: testing.MockConfig
tags: [method]
```

```Go
func MockConfig(t testing.TB, mockery *conf.Unified)
```

### <a id="MockRSAKeygen" href="#MockRSAKeygen">func MockRSAKeygen(t *testing.T)</a>

```
searchKey: testing.MockRSAKeygen
tags: [method]
```

```Go
func MockRSAKeygen(t *testing.T)
```

### <a id="MockRepoPermissions" href="#MockRepoPermissions">func MockRepoPermissions(t *testing.T, db dbutil.DB, userID int32, repoIDs ...api.RepoID)</a>

```
searchKey: testing.MockRepoPermissions
tags: [method]
```

```Go
func MockRepoPermissions(t *testing.T, db dbutil.DB, userID int32, repoIDs ...api.RepoID)
```

MockRepoPermissions mocks repository permissions to include repositories by IDs for the given user. 

### <a id="NewPublishedRawChangesetSpecGitBranch" href="#NewPublishedRawChangesetSpecGitBranch">func NewPublishedRawChangesetSpecGitBranch(repo graphql.ID, baseRev string, published batches.PublishedValue) string</a>

```
searchKey: testing.NewPublishedRawChangesetSpecGitBranch
tags: [method]
```

```Go
func NewPublishedRawChangesetSpecGitBranch(repo graphql.ID, baseRev string, published batches.PublishedValue) string
```

### <a id="NewRawChangesetSpecExisting" href="#NewRawChangesetSpecExisting">func NewRawChangesetSpecExisting(repo graphql.ID, externalID string) string</a>

```
searchKey: testing.NewRawChangesetSpecExisting
tags: [method]
```

```Go
func NewRawChangesetSpecExisting(repo graphql.ID, externalID string) string
```

### <a id="NewRawChangesetSpecGitBranch" href="#NewRawChangesetSpecGitBranch">func NewRawChangesetSpecGitBranch(repo graphql.ID, baseRev string) string</a>

```
searchKey: testing.NewRawChangesetSpecGitBranch
tags: [method]
```

```Go
func NewRawChangesetSpecGitBranch(repo graphql.ID, baseRev string) string
```

### <a id="ReloadAndAssertChangeset" href="#ReloadAndAssertChangeset">func ReloadAndAssertChangeset(t *testing.T, ctx context.Context, s GetChangesetByIDer, c *btypes.Changeset, a ChangesetAssertions) (reloaded *btypes.Changeset)</a>

```
searchKey: testing.ReloadAndAssertChangeset
tags: [method]
```

```Go
func ReloadAndAssertChangeset(t *testing.T, ctx context.Context, s GetChangesetByIDer, c *btypes.Changeset, a ChangesetAssertions) (reloaded *btypes.Changeset)
```

### <a id="SetChangesetClosed" href="#SetChangesetClosed">func SetChangesetClosed(t *testing.T, ctx context.Context, s UpdateChangeseter, c *btypes.Changeset)</a>

```
searchKey: testing.SetChangesetClosed
tags: [method]
```

```Go
func SetChangesetClosed(t *testing.T, ctx context.Context, s UpdateChangeseter, c *btypes.Changeset)
```

### <a id="SetChangesetFailed" href="#SetChangesetFailed">func SetChangesetFailed(t *testing.T, ctx context.Context, s UpdateChangeseter, c *btypes.Changeset)</a>

```
searchKey: testing.SetChangesetFailed
tags: [method]
```

```Go
func SetChangesetFailed(t *testing.T, ctx context.Context, s UpdateChangeseter, c *btypes.Changeset)
```

### <a id="SetChangesetPublished" href="#SetChangesetPublished">func SetChangesetPublished(t *testing.T, ctx context.Context, s UpdateChangeseter, c *btypes.Changeset, externalID, externalBranch string)</a>

```
searchKey: testing.SetChangesetPublished
tags: [method]
```

```Go
func SetChangesetPublished(t *testing.T, ctx context.Context, s UpdateChangeseter, c *btypes.Changeset, externalID, externalBranch string)
```

### <a id="TestRepo" href="#TestRepo">func TestRepo(t *testing.T, store *database.ExternalServiceStore, serviceKind string) *types.Repo</a>

```
searchKey: testing.TestRepo
tags: [method]
```

```Go
func TestRepo(t *testing.T, store *database.ExternalServiceStore, serviceKind string) *types.Repo
```

### <a id="TestRepoWithService" href="#TestRepoWithService">func TestRepoWithService(t *testing.T, store *database.ExternalServiceStore, name string, svc *types.ExternalService) *types.Repo</a>

```
searchKey: testing.TestRepoWithService
tags: [method]
```

```Go
func TestRepoWithService(t *testing.T, store *database.ExternalServiceStore, name string, svc *types.ExternalService) *types.Repo
```

### <a id="TruncateTables" href="#TruncateTables">func TruncateTables(t *testing.T, db *sql.DB, tables ...string)</a>

```
searchKey: testing.TruncateTables
tags: [method]
```

```Go
func TruncateTables(t *testing.T, db *sql.DB, tables ...string)
```

### <a id="createBbsRepos" href="#createBbsRepos">func createBbsRepos(t *testing.T, ctx context.Context, db dbutil.DB, ext *types.ExternalService, count int, cloneBaseURL string) ([]*types.Repo, *types.ExternalService)</a>

```
searchKey: testing.createBbsRepos
tags: [method private]
```

```Go
func createBbsRepos(t *testing.T, ctx context.Context, db dbutil.DB, ext *types.ExternalService, count int, cloneBaseURL string) ([]*types.Repo, *types.ExternalService)
```

