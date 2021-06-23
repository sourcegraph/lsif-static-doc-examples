# Package service

## Index

* [Variables](#var)
    * [var Mocks](#Mocks)
    * [var ErrNoNamespace](#ErrNoNamespace)
    * [var ErrChangesetsForJobNotFound](#ErrChangesetsForJobNotFound)
    * [var ErrApplyClosedBatchChange](#ErrApplyClosedBatchChange)
    * [var ErrMatchingBatchChangeExists](#ErrMatchingBatchChangeExists)
    * [var ErrEnsureBatchChangeFailed](#ErrEnsureBatchChangeFailed)
* [Types](#type)
    * [type ServiceMocks struct](#ServiceMocks)
        * [func (sm ServiceMocks) Reset()](#ServiceMocks.Reset)
    * [type Service struct](#Service)
        * [func New(store *store.Store) *Service](#New)
        * [func NewWithClock(store *store.Store, clock func() time.Time) *Service](#NewWithClock)
        * [func (s *Service) WithStore(store *store.Store) *Service](#Service.WithStore)
        * [func (s *Service) CreateBatchSpec(ctx context.Context, opts CreateBatchSpecOpts) (spec *btypes.BatchSpec, err error)](#Service.CreateBatchSpec)
        * [func (s *Service) CreateChangesetSpec(ctx context.Context, rawSpec string, userID int32) (spec *btypes.ChangesetSpec, err error)](#Service.CreateChangesetSpec)
        * [func (s *Service) GetBatchChangeMatchingBatchSpec(ctx context.Context, spec *btypes.BatchSpec) (*btypes.BatchChange, error)](#Service.GetBatchChangeMatchingBatchSpec)
        * [func (s *Service) GetNewestBatchSpec(ctx context.Context, tx *store.Store, spec *btypes.BatchSpec, userID int32) (*btypes.BatchSpec, error)](#Service.GetNewestBatchSpec)
        * [func (s *Service) MoveBatchChange(ctx context.Context, opts MoveBatchChangeOpts) (batchChange *btypes.BatchChange, err error)](#Service.MoveBatchChange)
        * [func (s *Service) CloseBatchChange(ctx context.Context, id int64, closeChangesets bool) (batchChange *btypes.BatchChange, err error)](#Service.CloseBatchChange)
        * [func (s *Service) DeleteBatchChange(ctx context.Context, id int64) (err error)](#Service.DeleteBatchChange)
        * [func (s *Service) EnqueueChangesetSync(ctx context.Context, id int64) (err error)](#Service.EnqueueChangesetSync)
        * [func (s *Service) ReenqueueChangeset(ctx context.Context, id int64) (changeset *btypes.Changeset, repo *types.Repo, err error)](#Service.ReenqueueChangeset)
        * [func (s *Service) FetchUsernameForBitbucketServerToken(ctx context.Context, externalServiceID, externalServiceType, token string) (string, error)](#Service.FetchUsernameForBitbucketServerToken)
        * [func (s *Service) ValidateAuthenticator(ctx context.Context, externalServiceID, externalServiceType string, a auth.Authenticator) error](#Service.ValidateAuthenticator)
        * [func (s *Service) CreateChangesetJobs(ctx context.Context, batchChangeID int64, ids []int64, jobType btypes.ChangesetJobType, payload interface{}, listOpts store.ListChangesetsOpts) (bulkGroupID string, err error)](#Service.CreateChangesetJobs)
        * [func (s *Service) ApplyBatchChange(ctx context.Context, opts ApplyBatchChangeOpts) (batchChange *btypes.BatchChange, err error)](#Service.ApplyBatchChange)
        * [func (s *Service) ReconcileBatchChange(ctx context.Context, batchSpec *btypes.BatchSpec) (batchChange *btypes.BatchChange, previousSpecID int64, err error)](#Service.ReconcileBatchChange)
    * [type CreateBatchSpecOpts struct](#CreateBatchSpecOpts)
    * [type changesetSpecNotFoundErr struct](#changesetSpecNotFoundErr)
        * [func (e *changesetSpecNotFoundErr) Error() string](#changesetSpecNotFoundErr.Error)
        * [func (e *changesetSpecNotFoundErr) NotFound() bool](#changesetSpecNotFoundErr.NotFound)
    * [type MoveBatchChangeOpts struct](#MoveBatchChangeOpts)
        * [func (o MoveBatchChangeOpts) String() string](#MoveBatchChangeOpts.String)
    * [type usernameSource interface](#usernameSource)
    * [type ApplyBatchChangeOpts struct](#ApplyBatchChangeOpts)
        * [func (o ApplyBatchChangeOpts) String() string](#ApplyBatchChangeOpts.String)
* [Functions](#func)
    * [func checkNamespaceAccess(ctx context.Context, db dbutil.DB, namespaceUserID, namespaceOrgID int32) error](#checkNamespaceAccess)
    * [func TestServiceApplyBatchChange(t *testing.T)](#TestServiceApplyBatchChange)
    * [func applyAndListChangesets(ctx context.Context, t *testing.T, svc *Service, batchSpecRandID string, wantChangesets int) (*btypes.BatchChange, btypes.Changesets)](#applyAndListChangesets)
    * [func TestServicePermissionLevels(t *testing.T)](#TestServicePermissionLevels)
    * [func TestService(t *testing.T)](#TestService)
    * [func testBatchChange(user int32, spec *btypes.BatchSpec) *btypes.BatchChange](#testBatchChange)
    * [func testBatchSpec(user int32) *btypes.BatchSpec](#testBatchSpec)
    * [func testChangeset(repoID api.RepoID, batchChange int64, extState btypes.ChangesetExternalState) *btypes.Changeset](#testChangeset)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="Mocks" href="#Mocks">var Mocks</a>

```
searchKey: service.Mocks
```

```Go
var Mocks = ServiceMocks{}
```

### <a id="ErrNoNamespace" href="#ErrNoNamespace">var ErrNoNamespace</a>

```
searchKey: service.ErrNoNamespace
```

```Go
var ErrNoNamespace = errors.New("no namespace given")
```

ErrNoNamespace is returned by checkNamespaceAccess if no valid namespace ID is given. 

### <a id="ErrChangesetsForJobNotFound" href="#ErrChangesetsForJobNotFound">var ErrChangesetsForJobNotFound</a>

```
searchKey: service.ErrChangesetsForJobNotFound
```

```Go
var ErrChangesetsForJobNotFound = errors.New("some changesets could not be found")
```

ErrChangesetsForJobNotFound can be returned by (*Service).CreateChangesetJobs if the number of changesets returned from the database doesn't match the number if IDs passed in. That can happen if some of the changesets are not published. 

### <a id="ErrApplyClosedBatchChange" href="#ErrApplyClosedBatchChange">var ErrApplyClosedBatchChange</a>

```
searchKey: service.ErrApplyClosedBatchChange
```

```Go
var ErrApplyClosedBatchChange = errors.New("existing batch change matched by batch spec is closed")
```

ErrApplyClosedBatchChange is returned by ApplyBatchChange when the batch change matched by the batch spec is already closed. 

### <a id="ErrMatchingBatchChangeExists" href="#ErrMatchingBatchChangeExists">var ErrMatchingBatchChangeExists</a>

```
searchKey: service.ErrMatchingBatchChangeExists
```

```Go
var ErrMatchingBatchChangeExists = ...
```

ErrMatchingBatchChangeExists is returned by ApplyBatchChange if a batch change matching the batch spec already exists and FailIfExists was set. 

### <a id="ErrEnsureBatchChangeFailed" href="#ErrEnsureBatchChangeFailed">var ErrEnsureBatchChangeFailed</a>

```
searchKey: service.ErrEnsureBatchChangeFailed
```

```Go
var ErrEnsureBatchChangeFailed = ...
```

ErrEnsureBatchChangeFailed is returned by AppplyBatchChange when a ensureBatchChangeID is provided but a batch change with the name specified the batchSpec exists in the given namespace but has a different ID. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="ServiceMocks" href="#ServiceMocks">type ServiceMocks struct</a>

```
searchKey: service.ServiceMocks
```

```Go
type ServiceMocks struct {
	ValidateAuthenticator func(ctx context.Context, externalServiceID, externalServiceType string, a auth.Authenticator) error
}
```

#### <a id="ServiceMocks.Reset" href="#ServiceMocks.Reset">func (sm ServiceMocks) Reset()</a>

```
searchKey: service.ServiceMocks.Reset
```

```Go
func (sm ServiceMocks) Reset()
```

### <a id="Service" href="#Service">type Service struct</a>

```
searchKey: service.Service
```

```Go
type Service struct {
	store *store.Store

	sourcer sources.Sourcer

	clock func() time.Time
}
```

#### <a id="New" href="#New">func New(store *store.Store) *Service</a>

```
searchKey: service.New
```

```Go
func New(store *store.Store) *Service
```

New returns a Service. 

#### <a id="NewWithClock" href="#NewWithClock">func NewWithClock(store *store.Store, clock func() time.Time) *Service</a>

```
searchKey: service.NewWithClock
```

```Go
func NewWithClock(store *store.Store, clock func() time.Time) *Service
```

NewWithClock returns a Service the given clock used to generate timestamps. 

#### <a id="Service.WithStore" href="#Service.WithStore">func (s *Service) WithStore(store *store.Store) *Service</a>

```
searchKey: service.Service.WithStore
```

```Go
func (s *Service) WithStore(store *store.Store) *Service
```

WithStore returns a copy of the Service with its store attribute set to the given Store. 

#### <a id="Service.CreateBatchSpec" href="#Service.CreateBatchSpec">func (s *Service) CreateBatchSpec(ctx context.Context, opts CreateBatchSpecOpts) (spec *btypes.BatchSpec, err error)</a>

```
searchKey: service.Service.CreateBatchSpec
```

```Go
func (s *Service) CreateBatchSpec(ctx context.Context, opts CreateBatchSpecOpts) (spec *btypes.BatchSpec, err error)
```

CreateBatchSpec creates the BatchSpec. 

#### <a id="Service.CreateChangesetSpec" href="#Service.CreateChangesetSpec">func (s *Service) CreateChangesetSpec(ctx context.Context, rawSpec string, userID int32) (spec *btypes.ChangesetSpec, err error)</a>

```
searchKey: service.Service.CreateChangesetSpec
```

```Go
func (s *Service) CreateChangesetSpec(ctx context.Context, rawSpec string, userID int32) (spec *btypes.ChangesetSpec, err error)
```

CreateChangesetSpec validates the given raw spec input and creates the ChangesetSpec. 

#### <a id="Service.GetBatchChangeMatchingBatchSpec" href="#Service.GetBatchChangeMatchingBatchSpec">func (s *Service) GetBatchChangeMatchingBatchSpec(ctx context.Context, spec *btypes.BatchSpec) (*btypes.BatchChange, error)</a>

```
searchKey: service.Service.GetBatchChangeMatchingBatchSpec
```

```Go
func (s *Service) GetBatchChangeMatchingBatchSpec(ctx context.Context, spec *btypes.BatchSpec) (*btypes.BatchChange, error)
```

GetBatchChangeMatchingBatchSpec returns the batch change that the BatchSpec applies to, if that BatchChange already exists. If it doesn't exist yet, both return values are nil. It accepts a *store.Store so that it can be used inside a transaction. 

#### <a id="Service.GetNewestBatchSpec" href="#Service.GetNewestBatchSpec">func (s *Service) GetNewestBatchSpec(ctx context.Context, tx *store.Store, spec *btypes.BatchSpec, userID int32) (*btypes.BatchSpec, error)</a>

```
searchKey: service.Service.GetNewestBatchSpec
```

```Go
func (s *Service) GetNewestBatchSpec(ctx context.Context, tx *store.Store, spec *btypes.BatchSpec, userID int32) (*btypes.BatchSpec, error)
```

GetNewestBatchSpec returns the newest batch spec that matches the given spec's namespace and name and is owned by the given user, or nil if none is found. 

#### <a id="Service.MoveBatchChange" href="#Service.MoveBatchChange">func (s *Service) MoveBatchChange(ctx context.Context, opts MoveBatchChangeOpts) (batchChange *btypes.BatchChange, err error)</a>

```
searchKey: service.Service.MoveBatchChange
```

```Go
func (s *Service) MoveBatchChange(ctx context.Context, opts MoveBatchChangeOpts) (batchChange *btypes.BatchChange, err error)
```

MoveBatchChange moves the batch change from one namespace to another and/or renames the batch change. 

#### <a id="Service.CloseBatchChange" href="#Service.CloseBatchChange">func (s *Service) CloseBatchChange(ctx context.Context, id int64, closeChangesets bool) (batchChange *btypes.BatchChange, err error)</a>

```
searchKey: service.Service.CloseBatchChange
```

```Go
func (s *Service) CloseBatchChange(ctx context.Context, id int64, closeChangesets bool) (batchChange *btypes.BatchChange, err error)
```

CloseBatchChange closes the BatchChange with the given ID if it has not been closed yet. 

#### <a id="Service.DeleteBatchChange" href="#Service.DeleteBatchChange">func (s *Service) DeleteBatchChange(ctx context.Context, id int64) (err error)</a>

```
searchKey: service.Service.DeleteBatchChange
```

```Go
func (s *Service) DeleteBatchChange(ctx context.Context, id int64) (err error)
```

DeleteBatchChange deletes the BatchChange with the given ID if it hasn't been deleted yet. 

#### <a id="Service.EnqueueChangesetSync" href="#Service.EnqueueChangesetSync">func (s *Service) EnqueueChangesetSync(ctx context.Context, id int64) (err error)</a>

```
searchKey: service.Service.EnqueueChangesetSync
```

```Go
func (s *Service) EnqueueChangesetSync(ctx context.Context, id int64) (err error)
```

EnqueueChangesetSync loads the given changeset from the database, checks whether the actor in the context has permission to enqueue a sync and then enqueues a sync by calling the repoupdater client. 

#### <a id="Service.ReenqueueChangeset" href="#Service.ReenqueueChangeset">func (s *Service) ReenqueueChangeset(ctx context.Context, id int64) (changeset *btypes.Changeset, repo *types.Repo, err error)</a>

```
searchKey: service.Service.ReenqueueChangeset
```

```Go
func (s *Service) ReenqueueChangeset(ctx context.Context, id int64) (changeset *btypes.Changeset, repo *types.Repo, err error)
```

ReenqueueChangeset loads the given changeset from the database, checks whether the actor in the context has permission to enqueue a reconciler run and then enqueues it by calling ResetReconcilerState. 

#### <a id="Service.FetchUsernameForBitbucketServerToken" href="#Service.FetchUsernameForBitbucketServerToken">func (s *Service) FetchUsernameForBitbucketServerToken(ctx context.Context, externalServiceID, externalServiceType, token string) (string, error)</a>

```
searchKey: service.Service.FetchUsernameForBitbucketServerToken
```

```Go
func (s *Service) FetchUsernameForBitbucketServerToken(ctx context.Context, externalServiceID, externalServiceType, token string) (string, error)
```

FetchUsernameForBitbucketServerToken fetches the username associated with a Bitbucket server token. 

We need the username in order to use the token as the password in a HTTP BasicAuth username/password pair used by gitserver to push commits. 

In order to not require from users to type in their BitbucketServer username we only ask for a token and then use that token to talk to the BitbucketServer API and get their username. 

Since Bitbucket sends the username as a header in REST responses, we can take it from there and complete the UserCredential. 

#### <a id="Service.ValidateAuthenticator" href="#Service.ValidateAuthenticator">func (s *Service) ValidateAuthenticator(ctx context.Context, externalServiceID, externalServiceType string, a auth.Authenticator) error</a>

```
searchKey: service.Service.ValidateAuthenticator
```

```Go
func (s *Service) ValidateAuthenticator(ctx context.Context, externalServiceID, externalServiceType string, a auth.Authenticator) error
```

ValidateAuthenticator creates a ChangesetSource, configures it with the given authenticator and validates it can correctly access the remote server. 

#### <a id="Service.CreateChangesetJobs" href="#Service.CreateChangesetJobs">func (s *Service) CreateChangesetJobs(ctx context.Context, batchChangeID int64, ids []int64, jobType btypes.ChangesetJobType, payload interface{}, listOpts store.ListChangesetsOpts) (bulkGroupID string, err error)</a>

```
searchKey: service.Service.CreateChangesetJobs
```

```Go
func (s *Service) CreateChangesetJobs(ctx context.Context, batchChangeID int64, ids []int64, jobType btypes.ChangesetJobType, payload interface{}, listOpts store.ListChangesetsOpts) (bulkGroupID string, err error)
```

CreateChangesetJobs creates one changeset job for each given Changeset in the given BatchChange, checking whether the actor in the context has permission to trigger a job, and enqueues it. 

#### <a id="Service.ApplyBatchChange" href="#Service.ApplyBatchChange">func (s *Service) ApplyBatchChange(ctx context.Context, opts ApplyBatchChangeOpts) (batchChange *btypes.BatchChange, err error)</a>

```
searchKey: service.Service.ApplyBatchChange
```

```Go
func (s *Service) ApplyBatchChange(ctx context.Context, opts ApplyBatchChangeOpts) (batchChange *btypes.BatchChange, err error)
```

ApplyBatchChange creates the BatchChange. 

#### <a id="Service.ReconcileBatchChange" href="#Service.ReconcileBatchChange">func (s *Service) ReconcileBatchChange(ctx context.Context, batchSpec *btypes.BatchSpec) (batchChange *btypes.BatchChange, previousSpecID int64, err error)</a>

```
searchKey: service.Service.ReconcileBatchChange
```

```Go
func (s *Service) ReconcileBatchChange(ctx context.Context, batchSpec *btypes.BatchSpec) (batchChange *btypes.BatchChange, previousSpecID int64, err error)
```

### <a id="CreateBatchSpecOpts" href="#CreateBatchSpecOpts">type CreateBatchSpecOpts struct</a>

```
searchKey: service.CreateBatchSpecOpts
```

```Go
type CreateBatchSpecOpts struct {
	RawSpec string `json:"raw_spec"`

	NamespaceUserID int32 `json:"namespace_user_id"`
	NamespaceOrgID  int32 `json:"namespace_org_id"`

	ChangesetSpecRandIDs []string `json:"changeset_spec_rand_ids"`
}
```

### <a id="changesetSpecNotFoundErr" href="#changesetSpecNotFoundErr">type changesetSpecNotFoundErr struct</a>

```
searchKey: service.changesetSpecNotFoundErr
tags: [private]
```

```Go
type changesetSpecNotFoundErr struct {
	RandID string
}
```

changesetSpecNotFoundErr is returned by CreateBatchSpec if a ChangesetSpec with the given RandID doesn't exist. It fulfills the interface required by errcode.IsNotFound. 

#### <a id="changesetSpecNotFoundErr.Error" href="#changesetSpecNotFoundErr.Error">func (e *changesetSpecNotFoundErr) Error() string</a>

```
searchKey: service.changesetSpecNotFoundErr.Error
tags: [private]
```

```Go
func (e *changesetSpecNotFoundErr) Error() string
```

#### <a id="changesetSpecNotFoundErr.NotFound" href="#changesetSpecNotFoundErr.NotFound">func (e *changesetSpecNotFoundErr) NotFound() bool</a>

```
searchKey: service.changesetSpecNotFoundErr.NotFound
tags: [private]
```

```Go
func (e *changesetSpecNotFoundErr) NotFound() bool
```

### <a id="MoveBatchChangeOpts" href="#MoveBatchChangeOpts">type MoveBatchChangeOpts struct</a>

```
searchKey: service.MoveBatchChangeOpts
```

```Go
type MoveBatchChangeOpts struct {
	BatchChangeID int64

	NewName string

	NewNamespaceUserID int32
	NewNamespaceOrgID  int32
}
```

#### <a id="MoveBatchChangeOpts.String" href="#MoveBatchChangeOpts.String">func (o MoveBatchChangeOpts) String() string</a>

```
searchKey: service.MoveBatchChangeOpts.String
```

```Go
func (o MoveBatchChangeOpts) String() string
```

### <a id="usernameSource" href="#usernameSource">type usernameSource interface</a>

```
searchKey: service.usernameSource
tags: [private]
```

```Go
type usernameSource interface {
	// AuthenticatedUsername makes a request to the code host to fetch the
	// username associated with the credentials.
	// If no username could be determined an error is returned.
	AuthenticatedUsername(ctx context.Context) (string, error)
}
```

A usernameSource can fetch the username associated with the credentials used by the Source. It's only used by FetchUsernameForBitbucketServerToken. 

### <a id="ApplyBatchChangeOpts" href="#ApplyBatchChangeOpts">type ApplyBatchChangeOpts struct</a>

```
searchKey: service.ApplyBatchChangeOpts
```

```Go
type ApplyBatchChangeOpts struct {
	BatchSpecRandID     string
	EnsureBatchChangeID int64

	// When FailIfBatchChangeExists is true, ApplyBatchChange will fail if a batch change
	// matching the given batch spec already exists.
	FailIfBatchChangeExists bool
}
```

#### <a id="ApplyBatchChangeOpts.String" href="#ApplyBatchChangeOpts.String">func (o ApplyBatchChangeOpts) String() string</a>

```
searchKey: service.ApplyBatchChangeOpts.String
```

```Go
func (o ApplyBatchChangeOpts) String() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="checkNamespaceAccess" href="#checkNamespaceAccess">func checkNamespaceAccess(ctx context.Context, db dbutil.DB, namespaceUserID, namespaceOrgID int32) error</a>

```
searchKey: service.checkNamespaceAccess
tags: [private]
```

```Go
func checkNamespaceAccess(ctx context.Context, db dbutil.DB, namespaceUserID, namespaceOrgID int32) error
```

checkNamespaceAccess checks whether the current user in the ctx has access to either the user ID or the org ID as a namespace. If the userID is non-zero that will be checked. Otherwise the org ID will be checked. If the current user is an admin, true will be returned. Otherwise it checks whether the current user _is_ the namespace user or has access to the namespace org. If both values are zero, an error is returned. 

### <a id="TestServiceApplyBatchChange" href="#TestServiceApplyBatchChange">func TestServiceApplyBatchChange(t *testing.T)</a>

```
searchKey: service.TestServiceApplyBatchChange
tags: [private]
```

```Go
func TestServiceApplyBatchChange(t *testing.T)
```

### <a id="applyAndListChangesets" href="#applyAndListChangesets">func applyAndListChangesets(ctx context.Context, t *testing.T, svc *Service, batchSpecRandID string, wantChangesets int) (*btypes.BatchChange, btypes.Changesets)</a>

```
searchKey: service.applyAndListChangesets
tags: [private]
```

```Go
func applyAndListChangesets(ctx context.Context, t *testing.T, svc *Service, batchSpecRandID string, wantChangesets int) (*btypes.BatchChange, btypes.Changesets)
```

### <a id="TestServicePermissionLevels" href="#TestServicePermissionLevels">func TestServicePermissionLevels(t *testing.T)</a>

```
searchKey: service.TestServicePermissionLevels
tags: [private]
```

```Go
func TestServicePermissionLevels(t *testing.T)
```

### <a id="TestService" href="#TestService">func TestService(t *testing.T)</a>

```
searchKey: service.TestService
tags: [private]
```

```Go
func TestService(t *testing.T)
```

### <a id="testBatchChange" href="#testBatchChange">func testBatchChange(user int32, spec *btypes.BatchSpec) *btypes.BatchChange</a>

```
searchKey: service.testBatchChange
tags: [private]
```

```Go
func testBatchChange(user int32, spec *btypes.BatchSpec) *btypes.BatchChange
```

### <a id="testBatchSpec" href="#testBatchSpec">func testBatchSpec(user int32) *btypes.BatchSpec</a>

```
searchKey: service.testBatchSpec
tags: [private]
```

```Go
func testBatchSpec(user int32) *btypes.BatchSpec
```

### <a id="testChangeset" href="#testChangeset">func testChangeset(repoID api.RepoID, batchChange int64, extState btypes.ChangesetExternalState) *btypes.Changeset</a>

```
searchKey: service.testChangeset
tags: [private]
```

```Go
func testChangeset(repoID api.RepoID, batchChange int64, extState btypes.ChangesetExternalState) *btypes.Changeset
```

