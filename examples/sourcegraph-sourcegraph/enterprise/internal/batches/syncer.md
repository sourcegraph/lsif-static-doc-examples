# Package syncer

## Index

* [Constants](#const)
    * [const priorityNormal](#priorityNormal)
    * [const priorityHigh](#priorityHigh)
* [Variables](#var)
    * [var minSyncDelay](#minSyncDelay)
    * [var maxSyncDelay](#maxSyncDelay)
    * [var syncerMetrics](#syncerMetrics)
* [Types](#type)
    * [type scheduledSync struct](#scheduledSync)
    * [type changesetPriorityQueue struct](#changesetPriorityQueue)
        * [func newChangesetPriorityQueue() *changesetPriorityQueue](#newChangesetPriorityQueue)
        * [func (pq *changesetPriorityQueue) Len() int](#changesetPriorityQueue.Len)
        * [func (pq *changesetPriorityQueue) Less(i, j int) bool](#changesetPriorityQueue.Less)
        * [func (pq *changesetPriorityQueue) Swap(i, j int)](#changesetPriorityQueue.Swap)
        * [func (pq *changesetPriorityQueue) Push(x interface{})](#changesetPriorityQueue.Push)
        * [func (pq *changesetPriorityQueue) Pop() interface{}](#changesetPriorityQueue.Pop)
        * [func (pq *changesetPriorityQueue) Peek() (scheduledSync, bool)](#changesetPriorityQueue.Peek)
        * [func (pq *changesetPriorityQueue) Upsert(ss ...scheduledSync)](#changesetPriorityQueue.Upsert)
        * [func (pq *changesetPriorityQueue) Get(id int64) (scheduledSync, bool)](#changesetPriorityQueue.Get)
        * [func (pq *changesetPriorityQueue) Remove(id int64)](#changesetPriorityQueue.Remove)
    * [type priority int](#priority)
    * [type SyncRegistry struct](#SyncRegistry)
        * [func NewSyncRegistry(ctx context.Context, cstore SyncStore, cf *httpcli.Factory) *SyncRegistry](#NewSyncRegistry)
        * [func (s *SyncRegistry) Add(codeHost *btypes.CodeHost)](#SyncRegistry.Add)
        * [func (s *SyncRegistry) EnqueueChangesetSyncs(ctx context.Context, ids []int64) error](#SyncRegistry.EnqueueChangesetSyncs)
        * [func (s *SyncRegistry) HandleExternalServiceSync(es api.ExternalService)](#SyncRegistry.HandleExternalServiceSync)
        * [func (s *SyncRegistry) handlePriorityItems()](#SyncRegistry.handlePriorityItems)
        * [func (s *SyncRegistry) syncCodeHosts(ctx context.Context) error](#SyncRegistry.syncCodeHosts)
    * [type SyncStore interface](#SyncStore)
    * [type changesetSyncer struct](#changesetSyncer)
        * [func (s *changesetSyncer) Run(ctx context.Context)](#changesetSyncer.Run)
        * [func (s *changesetSyncer) computeSchedule(ctx context.Context) ([]scheduledSync, error)](#changesetSyncer.computeSchedule)
        * [func (s *changesetSyncer) SyncChangeset(ctx context.Context, id int64) error](#changesetSyncer.SyncChangeset)
    * [type MockSyncStore struct](#MockSyncStore)
        * [func (m MockSyncStore) ListChangesetSyncData(ctx context.Context, opts store.ListChangesetSyncDataOpts) ([]*btypes.ChangesetSyncData, error)](#MockSyncStore.ListChangesetSyncData)
        * [func (m MockSyncStore) GetChangeset(ctx context.Context, opts store.GetChangesetOpts) (*btypes.Changeset, error)](#MockSyncStore.GetChangeset)
        * [func (m MockSyncStore) UpdateChangeset(ctx context.Context, c *btypes.Changeset) error](#MockSyncStore.UpdateChangeset)
        * [func (m MockSyncStore) UpsertChangesetEvents(ctx context.Context, cs ...*btypes.ChangesetEvent) error](#MockSyncStore.UpsertChangesetEvents)
        * [func (m MockSyncStore) GetSiteCredential(ctx context.Context, opts store.GetSiteCredentialOpts) (*btypes.SiteCredential, error)](#MockSyncStore.GetSiteCredential)
        * [func (m MockSyncStore) GetExternalServiceIDs(ctx context.Context, opts store.GetExternalServiceIDsOpts) ([]int64, error)](#MockSyncStore.GetExternalServiceIDs)
        * [func (m MockSyncStore) Transact(ctx context.Context) (*store.Store, error)](#MockSyncStore.Transact)
        * [func (m MockSyncStore) Repos() *database.RepoStore](#MockSyncStore.Repos)
        * [func (m MockSyncStore) ExternalServices() *database.ExternalServiceStore](#MockSyncStore.ExternalServices)
        * [func (m MockSyncStore) UserCredentials() *database.UserCredentialsStore](#MockSyncStore.UserCredentials)
        * [func (m MockSyncStore) DB() dbutil.DB](#MockSyncStore.DB)
        * [func (m MockSyncStore) Clock() func() time.Time](#MockSyncStore.Clock)
        * [func (m MockSyncStore) ListCodeHosts(ctx context.Context, opts store.ListCodeHostsOpts) ([]*btypes.CodeHost, error)](#MockSyncStore.ListCodeHosts)
* [Functions](#func)
    * [func NextSync(clock func() time.Time, h *btypes.ChangesetSyncData) time.Time](#NextSync)
    * [func maxTime(a, b time.Time) time.Time](#maxTime)
    * [func absDuration(d time.Duration) time.Duration](#absDuration)
    * [func init()](#init.syncer.go)
    * [func SyncChangeset(ctx context.Context, syncStore SyncStore, source sources.ChangesetSource, repo *types.Repo, c *btypes.Changeset) (err error)](#SyncChangeset)
    * [func loadChangesetSource(ctx context.Context, cf *httpcli.Factory, syncStore SyncStore, repo *types.Repo) (sources.ChangesetSource, error)](#loadChangesetSource)
    * [func TestChangesetPriorityQueue(t *testing.T)](#TestChangesetPriorityQueue)
    * [func TestNextSync(t *testing.T)](#TestNextSync)
    * [func TestSyncerRun(t *testing.T)](#TestSyncerRun)
    * [func TestSyncRegistry(t *testing.T)](#TestSyncRegistry)
    * [func TestLoadChangesetSource(t *testing.T)](#TestLoadChangesetSource)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="priorityNormal" href="#priorityNormal">const priorityNormal</a>

```
searchKey: syncer.priorityNormal
tags: [private]
```

```Go
const priorityNormal priority = iota
```

### <a id="priorityHigh" href="#priorityHigh">const priorityHigh</a>

```
searchKey: syncer.priorityHigh
tags: [private]
```

```Go
const priorityHigh
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="minSyncDelay" href="#minSyncDelay">var minSyncDelay</a>

```
searchKey: syncer.minSyncDelay
tags: [private]
```

```Go
var minSyncDelay = 2 * time.Minute
```

### <a id="maxSyncDelay" href="#maxSyncDelay">var maxSyncDelay</a>

```
searchKey: syncer.maxSyncDelay
tags: [private]
```

```Go
var maxSyncDelay = 8 * time.Hour
```

### <a id="syncerMetrics" href="#syncerMetrics">var syncerMetrics</a>

```
searchKey: syncer.syncerMetrics
tags: [private]
```

```Go
var syncerMetrics = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="scheduledSync" href="#scheduledSync">type scheduledSync struct</a>

```
searchKey: syncer.scheduledSync
tags: [private]
```

```Go
type scheduledSync struct {
	changesetID int64
	nextSync    time.Time
	priority    priority
}
```

### <a id="changesetPriorityQueue" href="#changesetPriorityQueue">type changesetPriorityQueue struct</a>

```
searchKey: syncer.changesetPriorityQueue
tags: [private]
```

```Go
type changesetPriorityQueue struct {
	items []scheduledSync
	index map[int64]int // changesetID -> index
}
```

changesetPriorityQueue is a min heap that sorts syncs by priority and time of next sync. It is not safe for concurrent use. 

#### <a id="newChangesetPriorityQueue" href="#newChangesetPriorityQueue">func newChangesetPriorityQueue() *changesetPriorityQueue</a>

```
searchKey: syncer.newChangesetPriorityQueue
tags: [private]
```

```Go
func newChangesetPriorityQueue() *changesetPriorityQueue
```

newChangesetPriorityQueue creates a new queue for holding changeset sync instructions in chronological order. items with a high priority will always appear at the front of the queue. 

#### <a id="changesetPriorityQueue.Len" href="#changesetPriorityQueue.Len">func (pq *changesetPriorityQueue) Len() int</a>

```
searchKey: syncer.changesetPriorityQueue.Len
tags: [private]
```

```Go
func (pq *changesetPriorityQueue) Len() int
```

#### <a id="changesetPriorityQueue.Less" href="#changesetPriorityQueue.Less">func (pq *changesetPriorityQueue) Less(i, j int) bool</a>

```
searchKey: syncer.changesetPriorityQueue.Less
tags: [private]
```

```Go
func (pq *changesetPriorityQueue) Less(i, j int) bool
```

#### <a id="changesetPriorityQueue.Swap" href="#changesetPriorityQueue.Swap">func (pq *changesetPriorityQueue) Swap(i, j int)</a>

```
searchKey: syncer.changesetPriorityQueue.Swap
tags: [private]
```

```Go
func (pq *changesetPriorityQueue) Swap(i, j int)
```

#### <a id="changesetPriorityQueue.Push" href="#changesetPriorityQueue.Push">func (pq *changesetPriorityQueue) Push(x interface{})</a>

```
searchKey: syncer.changesetPriorityQueue.Push
tags: [private]
```

```Go
func (pq *changesetPriorityQueue) Push(x interface{})
```

Push is here to implement the Heap interface, please use Upsert 

#### <a id="changesetPriorityQueue.Pop" href="#changesetPriorityQueue.Pop">func (pq *changesetPriorityQueue) Pop() interface{}</a>

```
searchKey: syncer.changesetPriorityQueue.Pop
tags: [private]
```

```Go
func (pq *changesetPriorityQueue) Pop() interface{}
```

Pop is not to be used directly, use heap.Pop(pq) 

#### <a id="changesetPriorityQueue.Peek" href="#changesetPriorityQueue.Peek">func (pq *changesetPriorityQueue) Peek() (scheduledSync, bool)</a>

```
searchKey: syncer.changesetPriorityQueue.Peek
tags: [private]
```

```Go
func (pq *changesetPriorityQueue) Peek() (scheduledSync, bool)
```

Peek fetches the highest priority item without removing it. 

#### <a id="changesetPriorityQueue.Upsert" href="#changesetPriorityQueue.Upsert">func (pq *changesetPriorityQueue) Upsert(ss ...scheduledSync)</a>

```
searchKey: syncer.changesetPriorityQueue.Upsert
tags: [private]
```

```Go
func (pq *changesetPriorityQueue) Upsert(ss ...scheduledSync)
```

Upsert modifies at item if it exists or adds a new item if not. NOTE: If an existing item is high priority, it will not be changed back to normal. This allows high priority items to stay that way through reschedules. 

#### <a id="changesetPriorityQueue.Get" href="#changesetPriorityQueue.Get">func (pq *changesetPriorityQueue) Get(id int64) (scheduledSync, bool)</a>

```
searchKey: syncer.changesetPriorityQueue.Get
tags: [private]
```

```Go
func (pq *changesetPriorityQueue) Get(id int64) (scheduledSync, bool)
```

Get fetches the item with the supplied id without removing it. 

#### <a id="changesetPriorityQueue.Remove" href="#changesetPriorityQueue.Remove">func (pq *changesetPriorityQueue) Remove(id int64)</a>

```
searchKey: syncer.changesetPriorityQueue.Remove
tags: [private]
```

```Go
func (pq *changesetPriorityQueue) Remove(id int64)
```

### <a id="priority" href="#priority">type priority int</a>

```
searchKey: syncer.priority
tags: [private]
```

```Go
type priority int
```

### <a id="SyncRegistry" href="#SyncRegistry">type SyncRegistry struct</a>

```
searchKey: syncer.SyncRegistry
```

```Go
type SyncRegistry struct {
	ctx         context.Context
	syncStore   SyncStore
	httpFactory *httpcli.Factory

	// Used to receive high priority sync requests
	priorityNotify chan []int64

	mu sync.Mutex
	// key is normalized code host url, also called external_service_id on the repo table
	syncers map[string]*changesetSyncer
}
```

SyncRegistry manages a changesetSyncer per code host 

#### <a id="NewSyncRegistry" href="#NewSyncRegistry">func NewSyncRegistry(ctx context.Context, cstore SyncStore, cf *httpcli.Factory) *SyncRegistry</a>

```
searchKey: syncer.NewSyncRegistry
```

```Go
func NewSyncRegistry(ctx context.Context, cstore SyncStore, cf *httpcli.Factory) *SyncRegistry
```

NewSyncRegistry creates a new sync registry which starts a syncer for each code host and will update them when external services are changed, added or removed. 

#### <a id="SyncRegistry.Add" href="#SyncRegistry.Add">func (s *SyncRegistry) Add(codeHost *btypes.CodeHost)</a>

```
searchKey: syncer.SyncRegistry.Add
```

```Go
func (s *SyncRegistry) Add(codeHost *btypes.CodeHost)
```

Add adds a syncer for the code host associated with the supplied code host if the syncer hasn't already been added and starts it. 

#### <a id="SyncRegistry.EnqueueChangesetSyncs" href="#SyncRegistry.EnqueueChangesetSyncs">func (s *SyncRegistry) EnqueueChangesetSyncs(ctx context.Context, ids []int64) error</a>

```
searchKey: syncer.SyncRegistry.EnqueueChangesetSyncs
```

```Go
func (s *SyncRegistry) EnqueueChangesetSyncs(ctx context.Context, ids []int64) error
```

EnqueueChangesetSyncs will enqueue the changesets with the supplied ids for high priority syncing. An error indicates that no changesets have been enqueued. 

#### <a id="SyncRegistry.HandleExternalServiceSync" href="#SyncRegistry.HandleExternalServiceSync">func (s *SyncRegistry) HandleExternalServiceSync(es api.ExternalService)</a>

```
searchKey: syncer.SyncRegistry.HandleExternalServiceSync
```

```Go
func (s *SyncRegistry) HandleExternalServiceSync(es api.ExternalService)
```

HandleExternalServiceSync handles changes to external services. 

#### <a id="SyncRegistry.handlePriorityItems" href="#SyncRegistry.handlePriorityItems">func (s *SyncRegistry) handlePriorityItems()</a>

```
searchKey: syncer.SyncRegistry.handlePriorityItems
tags: [private]
```

```Go
func (s *SyncRegistry) handlePriorityItems()
```

handlePriorityItems fetches changesets in the priority queue from the database and passes them to the appropriate syncer. 

#### <a id="SyncRegistry.syncCodeHosts" href="#SyncRegistry.syncCodeHosts">func (s *SyncRegistry) syncCodeHosts(ctx context.Context) error</a>

```
searchKey: syncer.SyncRegistry.syncCodeHosts
tags: [private]
```

```Go
func (s *SyncRegistry) syncCodeHosts(ctx context.Context) error
```

syncCodeHosts fetches the list of currently active code hosts on the Sourcegraph instance. The running syncers will then be matched against those and missing ones are spawned and excess ones are stopped. 

### <a id="SyncStore" href="#SyncStore">type SyncStore interface</a>

```
searchKey: syncer.SyncStore
```

```Go
type SyncStore interface {
	ListCodeHosts(ctx context.Context, opts store.ListCodeHostsOpts) ([]*btypes.CodeHost, error)
	ListChangesetSyncData(context.Context, store.ListChangesetSyncDataOpts) ([]*btypes.ChangesetSyncData, error)
	GetChangeset(context.Context, store.GetChangesetOpts) (*btypes.Changeset, error)
	UpdateChangeset(ctx context.Context, cs *btypes.Changeset) error
	UpsertChangesetEvents(ctx context.Context, cs ...*btypes.ChangesetEvent) error
	GetSiteCredential(ctx context.Context, opts store.GetSiteCredentialOpts) (*btypes.SiteCredential, error)
	Transact(context.Context) (*store.Store, error)
	Repos() *database.RepoStore
	ExternalServices() *database.ExternalServiceStore
	Clock() func() time.Time
	DB() dbutil.DB
	GetExternalServiceIDs(ctx context.Context, opts store.GetExternalServiceIDsOpts) ([]int64, error)
	UserCredentials() *database.UserCredentialsStore
}
```

### <a id="changesetSyncer" href="#changesetSyncer">type changesetSyncer struct</a>

```
searchKey: syncer.changesetSyncer
tags: [private]
```

```Go
type changesetSyncer struct {
	syncStore   SyncStore
	httpFactory *httpcli.Factory

	codeHostURL string

	// scheduleInterval determines how often a new schedule will be computed.
	// NOTE: It involves a DB query but no communication with code hosts.
	scheduleInterval time.Duration

	queue          *changesetPriorityQueue
	priorityNotify chan []int64

	// Replaceable for testing
	syncFunc func(ctx context.Context, id int64) error

	// cancel should be called to stop this syncer
	cancel context.CancelFunc
}
```

A changesetSyncer periodically syncs metadata of changesets saved in the database. 

#### <a id="changesetSyncer.Run" href="#changesetSyncer.Run">func (s *changesetSyncer) Run(ctx context.Context)</a>

```
searchKey: syncer.changesetSyncer.Run
tags: [private]
```

```Go
func (s *changesetSyncer) Run(ctx context.Context)
```

Run will start the process of changeset syncing. It is long running and is expected to be launched once at startup. 

#### <a id="changesetSyncer.computeSchedule" href="#changesetSyncer.computeSchedule">func (s *changesetSyncer) computeSchedule(ctx context.Context) ([]scheduledSync, error)</a>

```
searchKey: syncer.changesetSyncer.computeSchedule
tags: [private]
```

```Go
func (s *changesetSyncer) computeSchedule(ctx context.Context) ([]scheduledSync, error)
```

#### <a id="changesetSyncer.SyncChangeset" href="#changesetSyncer.SyncChangeset">func (s *changesetSyncer) SyncChangeset(ctx context.Context, id int64) error</a>

```
searchKey: syncer.changesetSyncer.SyncChangeset
tags: [private]
```

```Go
func (s *changesetSyncer) SyncChangeset(ctx context.Context, id int64) error
```

SyncChangeset will sync a single changeset given its id. 

### <a id="MockSyncStore" href="#MockSyncStore">type MockSyncStore struct</a>

```
searchKey: syncer.MockSyncStore
tags: [private]
```

```Go
type MockSyncStore struct {
	listCodeHosts         func(context.Context, store.ListCodeHostsOpts) ([]*btypes.CodeHost, error)
	listChangesetSyncData func(context.Context, store.ListChangesetSyncDataOpts) ([]*btypes.ChangesetSyncData, error)
	getChangeset          func(context.Context, store.GetChangesetOpts) (*btypes.Changeset, error)
	updateChangeset       func(context.Context, *btypes.Changeset) error
	upsertChangesetEvents func(context.Context, ...*btypes.ChangesetEvent) error
	getSiteCredential     func(ctx context.Context, opts store.GetSiteCredentialOpts) (*btypes.SiteCredential, error)
	getExternalServiceIDs func(ctx context.Context, opts store.GetExternalServiceIDsOpts) ([]int64, error)
	transact              func(context.Context) (*store.Store, error)
}
```

#### <a id="MockSyncStore.ListChangesetSyncData" href="#MockSyncStore.ListChangesetSyncData">func (m MockSyncStore) ListChangesetSyncData(ctx context.Context, opts store.ListChangesetSyncDataOpts) ([]*btypes.ChangesetSyncData, error)</a>

```
searchKey: syncer.MockSyncStore.ListChangesetSyncData
tags: [private]
```

```Go
func (m MockSyncStore) ListChangesetSyncData(ctx context.Context, opts store.ListChangesetSyncDataOpts) ([]*btypes.ChangesetSyncData, error)
```

#### <a id="MockSyncStore.GetChangeset" href="#MockSyncStore.GetChangeset">func (m MockSyncStore) GetChangeset(ctx context.Context, opts store.GetChangesetOpts) (*btypes.Changeset, error)</a>

```
searchKey: syncer.MockSyncStore.GetChangeset
tags: [private]
```

```Go
func (m MockSyncStore) GetChangeset(ctx context.Context, opts store.GetChangesetOpts) (*btypes.Changeset, error)
```

#### <a id="MockSyncStore.UpdateChangeset" href="#MockSyncStore.UpdateChangeset">func (m MockSyncStore) UpdateChangeset(ctx context.Context, c *btypes.Changeset) error</a>

```
searchKey: syncer.MockSyncStore.UpdateChangeset
tags: [private]
```

```Go
func (m MockSyncStore) UpdateChangeset(ctx context.Context, c *btypes.Changeset) error
```

#### <a id="MockSyncStore.UpsertChangesetEvents" href="#MockSyncStore.UpsertChangesetEvents">func (m MockSyncStore) UpsertChangesetEvents(ctx context.Context, cs ...*btypes.ChangesetEvent) error</a>

```
searchKey: syncer.MockSyncStore.UpsertChangesetEvents
tags: [private]
```

```Go
func (m MockSyncStore) UpsertChangesetEvents(ctx context.Context, cs ...*btypes.ChangesetEvent) error
```

#### <a id="MockSyncStore.GetSiteCredential" href="#MockSyncStore.GetSiteCredential">func (m MockSyncStore) GetSiteCredential(ctx context.Context, opts store.GetSiteCredentialOpts) (*btypes.SiteCredential, error)</a>

```
searchKey: syncer.MockSyncStore.GetSiteCredential
tags: [private]
```

```Go
func (m MockSyncStore) GetSiteCredential(ctx context.Context, opts store.GetSiteCredentialOpts) (*btypes.SiteCredential, error)
```

#### <a id="MockSyncStore.GetExternalServiceIDs" href="#MockSyncStore.GetExternalServiceIDs">func (m MockSyncStore) GetExternalServiceIDs(ctx context.Context, opts store.GetExternalServiceIDsOpts) ([]int64, error)</a>

```
searchKey: syncer.MockSyncStore.GetExternalServiceIDs
tags: [private]
```

```Go
func (m MockSyncStore) GetExternalServiceIDs(ctx context.Context, opts store.GetExternalServiceIDsOpts) ([]int64, error)
```

#### <a id="MockSyncStore.Transact" href="#MockSyncStore.Transact">func (m MockSyncStore) Transact(ctx context.Context) (*store.Store, error)</a>

```
searchKey: syncer.MockSyncStore.Transact
tags: [private]
```

```Go
func (m MockSyncStore) Transact(ctx context.Context) (*store.Store, error)
```

#### <a id="MockSyncStore.Repos" href="#MockSyncStore.Repos">func (m MockSyncStore) Repos() *database.RepoStore</a>

```
searchKey: syncer.MockSyncStore.Repos
tags: [private]
```

```Go
func (m MockSyncStore) Repos() *database.RepoStore
```

#### <a id="MockSyncStore.ExternalServices" href="#MockSyncStore.ExternalServices">func (m MockSyncStore) ExternalServices() *database.ExternalServiceStore</a>

```
searchKey: syncer.MockSyncStore.ExternalServices
tags: [private]
```

```Go
func (m MockSyncStore) ExternalServices() *database.ExternalServiceStore
```

#### <a id="MockSyncStore.UserCredentials" href="#MockSyncStore.UserCredentials">func (m MockSyncStore) UserCredentials() *database.UserCredentialsStore</a>

```
searchKey: syncer.MockSyncStore.UserCredentials
tags: [private]
```

```Go
func (m MockSyncStore) UserCredentials() *database.UserCredentialsStore
```

#### <a id="MockSyncStore.DB" href="#MockSyncStore.DB">func (m MockSyncStore) DB() dbutil.DB</a>

```
searchKey: syncer.MockSyncStore.DB
tags: [private]
```

```Go
func (m MockSyncStore) DB() dbutil.DB
```

#### <a id="MockSyncStore.Clock" href="#MockSyncStore.Clock">func (m MockSyncStore) Clock() func() time.Time</a>

```
searchKey: syncer.MockSyncStore.Clock
tags: [private]
```

```Go
func (m MockSyncStore) Clock() func() time.Time
```

#### <a id="MockSyncStore.ListCodeHosts" href="#MockSyncStore.ListCodeHosts">func (m MockSyncStore) ListCodeHosts(ctx context.Context, opts store.ListCodeHostsOpts) ([]*btypes.CodeHost, error)</a>

```
searchKey: syncer.MockSyncStore.ListCodeHosts
tags: [private]
```

```Go
func (m MockSyncStore) ListCodeHosts(ctx context.Context, opts store.ListCodeHostsOpts) ([]*btypes.CodeHost, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="NextSync" href="#NextSync">func NextSync(clock func() time.Time, h *btypes.ChangesetSyncData) time.Time</a>

```
searchKey: syncer.NextSync
```

```Go
func NextSync(clock func() time.Time, h *btypes.ChangesetSyncData) time.Time
```

NextSync computes the time we want the next sync to happen. 

### <a id="maxTime" href="#maxTime">func maxTime(a, b time.Time) time.Time</a>

```
searchKey: syncer.maxTime
tags: [private]
```

```Go
func maxTime(a, b time.Time) time.Time
```

### <a id="absDuration" href="#absDuration">func absDuration(d time.Duration) time.Duration</a>

```
searchKey: syncer.absDuration
tags: [private]
```

```Go
func absDuration(d time.Duration) time.Duration
```

### <a id="init.syncer.go" href="#init.syncer.go">func init()</a>

```
searchKey: syncer.init
tags: [private]
```

```Go
func init()
```

### <a id="SyncChangeset" href="#SyncChangeset">func SyncChangeset(ctx context.Context, syncStore SyncStore, source sources.ChangesetSource, repo *types.Repo, c *btypes.Changeset) (err error)</a>

```
searchKey: syncer.SyncChangeset
```

```Go
func SyncChangeset(ctx context.Context, syncStore SyncStore, source sources.ChangesetSource, repo *types.Repo, c *btypes.Changeset) (err error)
```

SyncChangeset refreshes the metadata of the given changeset and updates them in the database. 

### <a id="loadChangesetSource" href="#loadChangesetSource">func loadChangesetSource(ctx context.Context, cf *httpcli.Factory, syncStore SyncStore, repo *types.Repo) (sources.ChangesetSource, error)</a>

```
searchKey: syncer.loadChangesetSource
tags: [private]
```

```Go
func loadChangesetSource(ctx context.Context, cf *httpcli.Factory, syncStore SyncStore, repo *types.Repo) (sources.ChangesetSource, error)
```

### <a id="TestChangesetPriorityQueue" href="#TestChangesetPriorityQueue">func TestChangesetPriorityQueue(t *testing.T)</a>

```
searchKey: syncer.TestChangesetPriorityQueue
tags: [private]
```

```Go
func TestChangesetPriorityQueue(t *testing.T)
```

### <a id="TestNextSync" href="#TestNextSync">func TestNextSync(t *testing.T)</a>

```
searchKey: syncer.TestNextSync
tags: [private]
```

```Go
func TestNextSync(t *testing.T)
```

### <a id="TestSyncerRun" href="#TestSyncerRun">func TestSyncerRun(t *testing.T)</a>

```
searchKey: syncer.TestSyncerRun
tags: [private]
```

```Go
func TestSyncerRun(t *testing.T)
```

### <a id="TestSyncRegistry" href="#TestSyncRegistry">func TestSyncRegistry(t *testing.T)</a>

```
searchKey: syncer.TestSyncRegistry
tags: [private]
```

```Go
func TestSyncRegistry(t *testing.T)
```

### <a id="TestLoadChangesetSource" href="#TestLoadChangesetSource">func TestLoadChangesetSource(t *testing.T)</a>

```
searchKey: syncer.TestLoadChangesetSource
tags: [private]
```

```Go
func TestLoadChangesetSource(t *testing.T)
```

