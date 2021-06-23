# Package authz

## Index

* [Constants](#const)
    * [const priorityLow](#priorityLow)
    * [const priorityHigh](#priorityHigh)
    * [const requestTypeRepo](#requestTypeRepo)
    * [const requestTypeUser](#requestTypeUser)
* [Variables](#var)
    * [var metricsNoPerms](#metricsNoPerms)
    * [var metricsStalePerms](#metricsStalePerms)
    * [var metricsPermsGap](#metricsPermsGap)
    * [var metricsSyncDuration](#metricsSyncDuration)
    * [var metricsSyncErrors](#metricsSyncErrors)
    * [var metricsQueueSize](#metricsQueueSize)
    * [var updateRegex](#updateRegex)
    * [var dsn](#dsn)
    * [var cmpOpts](#cmpOpts)
* [Types](#type)
    * [type PermsSyncer struct](#PermsSyncer)
        * [func NewPermsSyncer(reposStore *repos.Store,...](#NewPermsSyncer)
        * [func (s *PermsSyncer) ScheduleUsers(ctx context.Context, userIDs ...int32)](#PermsSyncer.ScheduleUsers)
        * [func (s *PermsSyncer) scheduleUsers(ctx context.Context, users ...scheduledUser)](#PermsSyncer.scheduleUsers)
        * [func (s *PermsSyncer) ScheduleRepos(ctx context.Context, repoIDs ...api.RepoID)](#PermsSyncer.ScheduleRepos)
        * [func (s *PermsSyncer) scheduleRepos(ctx context.Context, repos ...scheduledRepo)](#PermsSyncer.scheduleRepos)
        * [func (s *PermsSyncer) providersByServiceID() map[string]authz.Provider](#PermsSyncer.providersByServiceID)
        * [func (s *PermsSyncer) providersByURNs() map[string]authz.Provider](#PermsSyncer.providersByURNs)
        * [func (s *PermsSyncer) syncUserPerms(ctx context.Context, userID int32, noPerms bool) (err error)](#PermsSyncer.syncUserPerms)
        * [func (s *PermsSyncer) syncRepoPerms(ctx context.Context, repoID api.RepoID, noPerms bool) (err error)](#PermsSyncer.syncRepoPerms)
        * [func (s *PermsSyncer) waitForRateLimit(ctx context.Context, serviceID string, n int) error](#PermsSyncer.waitForRateLimit)
        * [func (s *PermsSyncer) syncPerms(ctx context.Context, request *syncRequest) error](#PermsSyncer.syncPerms)
        * [func (s *PermsSyncer) runSync(ctx context.Context)](#PermsSyncer.runSync)
        * [func (s *PermsSyncer) scheduleUsersWithNoPerms(ctx context.Context) ([]scheduledUser, error)](#PermsSyncer.scheduleUsersWithNoPerms)
        * [func (s *PermsSyncer) scheduleReposWithNoPerms(ctx context.Context) ([]scheduledRepo, error)](#PermsSyncer.scheduleReposWithNoPerms)
        * [func (s *PermsSyncer) scheduleUsersWithOldestPerms(ctx context.Context, limit int) ([]scheduledUser, error)](#PermsSyncer.scheduleUsersWithOldestPerms)
        * [func (s *PermsSyncer) scheduleReposWithOldestPerms(ctx context.Context, limit int) ([]scheduledRepo, error)](#PermsSyncer.scheduleReposWithOldestPerms)
        * [func (s *PermsSyncer) schedule(ctx context.Context) (*schedule, error)](#PermsSyncer.schedule)
        * [func (s *PermsSyncer) isDisabled() bool](#PermsSyncer.isDisabled)
        * [func (s *PermsSyncer) runSchedule(ctx context.Context)](#PermsSyncer.runSchedule)
        * [func (s *PermsSyncer) DebugDump() interface{}](#PermsSyncer.DebugDump)
        * [func (s *PermsSyncer) observe(ctx context.Context, family, title string) (context.Context, func(requestType, int32, *error))](#PermsSyncer.observe)
        * [func (s *PermsSyncer) collectMetrics(ctx context.Context)](#PermsSyncer.collectMetrics)
        * [func (s *PermsSyncer) Run(ctx context.Context)](#PermsSyncer.Run)
    * [type schedule struct](#schedule)
    * [type scheduledUser struct](#scheduledUser)
    * [type scheduledRepo struct](#scheduledRepo)
    * [type priority int](#priority)
    * [type requestType int](#requestType)
        * [func (t1 requestType) higherPriorityThan(t2 requestType) bool](#requestType.higherPriorityThan)
    * [type requestMeta struct](#requestMeta)
    * [type syncRequest struct](#syncRequest)
    * [type requestQueueKey struct](#requestQueueKey)
    * [type requestQueue struct](#requestQueue)
        * [func newRequestQueue() *requestQueue](#newRequestQueue)
        * [func (q *requestQueue) enqueue(meta *requestMeta) (updated bool)](#requestQueue.enqueue)
        * [func (q *requestQueue) remove(typ requestType, id int32, acquired bool) (removed bool)](#requestQueue.remove)
        * [func (q *requestQueue) acquireNext() *syncRequest](#requestQueue.acquireNext)
        * [func (q *requestQueue) release(typ requestType, id int32)](#requestQueue.release)
        * [func (q *requestQueue) Len() int](#requestQueue.Len)
        * [func (q *requestQueue) Less(i, j int) bool](#requestQueue.Less)
        * [func (q *requestQueue) Swap(i, j int)](#requestQueue.Swap)
        * [func (q *requestQueue) Push(x interface{})](#requestQueue.Push)
        * [func (q *requestQueue) Pop() interface{}](#requestQueue.Pop)
    * [type mockProvider struct](#mockProvider)
        * [func (*mockProvider) FetchAccount(context.Context, *types.User, []*extsvc.Account, []string) (*extsvc.Account, error)](#mockProvider.FetchAccount)
        * [func (p *mockProvider) ServiceType() string](#mockProvider.ServiceType)
        * [func (p *mockProvider) ServiceID() string](#mockProvider.ServiceID)
        * [func (p *mockProvider) URN() string](#mockProvider.URN)
        * [func (*mockProvider) Validate() []string](#mockProvider.Validate)
        * [func (p *mockProvider) FetchUserPerms(ctx context.Context, acct *extsvc.Account) (*authz.ExternalUserPermissions, error)](#mockProvider.FetchUserPerms)
        * [func (p *mockProvider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)](#mockProvider.FetchRepoPerms)
* [Functions](#func)
    * [func notify(ch chan struct{})](#notify)
    * [func update(name string) bool](#update)
    * [func TestIntegration_GitHubPermissions(t *testing.T)](#TestIntegration_GitHubPermissions)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestPermsSyncer_ScheduleUsers(t *testing.T)](#TestPermsSyncer_ScheduleUsers)
    * [func TestPermsSyncer_ScheduleRepos(t *testing.T)](#TestPermsSyncer_ScheduleRepos)
    * [func TestPermsSyncer_syncUserPerms(t *testing.T)](#TestPermsSyncer_syncUserPerms)
    * [func TestPermsSyncer_syncUserPerms_tokenExpire(t *testing.T)](#TestPermsSyncer_syncUserPerms_tokenExpire)
    * [func TestPermsSyncer_syncUserPerms_prefixSpecs(t *testing.T)](#TestPermsSyncer_syncUserPerms_prefixSpecs)
    * [func TestPermsSyncer_syncRepoPerms(t *testing.T)](#TestPermsSyncer_syncRepoPerms)
    * [func TestPermsSyncer_waitForRateLimit(t *testing.T)](#TestPermsSyncer_waitForRateLimit)
    * [func TestPermsSyncer_syncPerms(t *testing.T)](#TestPermsSyncer_syncPerms)
    * [func Test_requestQueue_enqueue(t *testing.T)](#Test_requestQueue_enqueue)
    * [func Test_requestQueue_remove(t *testing.T)](#Test_requestQueue_remove)
    * [func Test_requestQueue_acquireNext(t *testing.T)](#Test_requestQueue_acquireNext)
    * [func Test_requestQueue_release(t *testing.T)](#Test_requestQueue_release)
    * [func Test_requestQueue_Less(t *testing.T)](#Test_requestQueue_Less)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="priorityLow" href="#priorityLow">const priorityLow</a>

```
searchKey: authz.priorityLow
tags: [private]
```

```Go
const priorityLow priority = iota
```

### <a id="priorityHigh" href="#priorityHigh">const priorityHigh</a>

```
searchKey: authz.priorityHigh
tags: [private]
```

```Go
const priorityHigh
```

### <a id="requestTypeRepo" href="#requestTypeRepo">const requestTypeRepo</a>

```
searchKey: authz.requestTypeRepo
tags: [private]
```

```Go
const requestTypeRepo requestType = iota + 1
```

A list of request types, the larger the value, the higher the priority. requestTypeUser had the highest because it is often triggered by a user action (e.g. sign up, log in). 

### <a id="requestTypeUser" href="#requestTypeUser">const requestTypeUser</a>

```
searchKey: authz.requestTypeUser
tags: [private]
```

```Go
const requestTypeUser
```

A list of request types, the larger the value, the higher the priority. requestTypeUser had the highest because it is often triggered by a user action (e.g. sign up, log in). 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="metricsNoPerms" href="#metricsNoPerms">var metricsNoPerms</a>

```
searchKey: authz.metricsNoPerms
tags: [private]
```

```Go
var metricsNoPerms = ...
```

The metrics that are exposed to Prometheus. 

### <a id="metricsStalePerms" href="#metricsStalePerms">var metricsStalePerms</a>

```
searchKey: authz.metricsStalePerms
tags: [private]
```

```Go
var metricsStalePerms = ...
```

The metrics that are exposed to Prometheus. 

### <a id="metricsPermsGap" href="#metricsPermsGap">var metricsPermsGap</a>

```
searchKey: authz.metricsPermsGap
tags: [private]
```

```Go
var metricsPermsGap = ...
```

The metrics that are exposed to Prometheus. 

### <a id="metricsSyncDuration" href="#metricsSyncDuration">var metricsSyncDuration</a>

```
searchKey: authz.metricsSyncDuration
tags: [private]
```

```Go
var metricsSyncDuration = ...
```

The metrics that are exposed to Prometheus. 

### <a id="metricsSyncErrors" href="#metricsSyncErrors">var metricsSyncErrors</a>

```
searchKey: authz.metricsSyncErrors
tags: [private]
```

```Go
var metricsSyncErrors = ...
```

The metrics that are exposed to Prometheus. 

### <a id="metricsQueueSize" href="#metricsQueueSize">var metricsQueueSize</a>

```
searchKey: authz.metricsQueueSize
tags: [private]
```

```Go
var metricsQueueSize = ...
```

The metrics that are exposed to Prometheus. 

### <a id="updateRegex" href="#updateRegex">var updateRegex</a>

```
searchKey: authz.updateRegex
tags: [private]
```

```Go
var updateRegex = flag.String("update", "", "Update testdata of tests matching the given regex")
```

### <a id="dsn" href="#dsn">var dsn</a>

```
searchKey: authz.dsn
tags: [private]
```

```Go
var dsn = flag.String("dsn", "", "Database connection string to use in integration tests")
```

### <a id="cmpOpts" href="#cmpOpts">var cmpOpts</a>

```
searchKey: authz.cmpOpts
tags: [private]
```

```Go
var cmpOpts = cmp.AllowUnexported(syncRequest{}, requestMeta{}, requestQueueKey{})
```

The options to allow cmp to compare unexported fields. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="PermsSyncer" href="#PermsSyncer">type PermsSyncer struct</a>

```
searchKey: authz.PermsSyncer
```

```Go
type PermsSyncer struct {
	// The priority queue to maintain the permissions syncing requests.
	queue *requestQueue
	// The database interface for any repos and external services operations.
	reposStore *repos.Store
	// The database interface for any permissions operations.
	permsStore *edb.PermsStore
	// The mockable function to return the current time.
	clock func() time.Time
	// The rate limit registry for code hosts.
	rateLimiterRegistry *ratelimit.Registry
	// The time duration of how often to re-compute schedule for users and repositories.
	scheduleInterval time.Duration
}
```

PermsSyncer is a permissions syncing manager that is in charge of keeping permissions up-to-date for users and repositories. 

It is meant to be running in the background. 

#### <a id="NewPermsSyncer" href="#NewPermsSyncer">func NewPermsSyncer(reposStore *repos.Store,...</a>

```
searchKey: authz.NewPermsSyncer
```

```Go
func NewPermsSyncer(
	reposStore *repos.Store,
	permsStore *edb.PermsStore,
	clock func() time.Time,
	rateLimiterRegistry *ratelimit.Registry,
) *PermsSyncer
```

NewPermsSyncer returns a new permissions syncing manager. 

#### <a id="PermsSyncer.ScheduleUsers" href="#PermsSyncer.ScheduleUsers">func (s *PermsSyncer) ScheduleUsers(ctx context.Context, userIDs ...int32)</a>

```
searchKey: authz.PermsSyncer.ScheduleUsers
```

```Go
func (s *PermsSyncer) ScheduleUsers(ctx context.Context, userIDs ...int32)
```

ScheduleUsers schedules new permissions syncing requests for given users. By design, all schedules triggered by user actions are in high priority. 

This method implements the repoupdater.Server.PermsSyncer in the OSS namespace. 

#### <a id="PermsSyncer.scheduleUsers" href="#PermsSyncer.scheduleUsers">func (s *PermsSyncer) scheduleUsers(ctx context.Context, users ...scheduledUser)</a>

```
searchKey: authz.PermsSyncer.scheduleUsers
tags: [private]
```

```Go
func (s *PermsSyncer) scheduleUsers(ctx context.Context, users ...scheduledUser)
```

#### <a id="PermsSyncer.ScheduleRepos" href="#PermsSyncer.ScheduleRepos">func (s *PermsSyncer) ScheduleRepos(ctx context.Context, repoIDs ...api.RepoID)</a>

```
searchKey: authz.PermsSyncer.ScheduleRepos
```

```Go
func (s *PermsSyncer) ScheduleRepos(ctx context.Context, repoIDs ...api.RepoID)
```

ScheduleRepos schedules new permissions syncing requests for given repositories. By design, all schedules triggered by user actions are in high priority. 

This method implements the repoupdater.Server.PermsSyncer in the OSS namespace. 

#### <a id="PermsSyncer.scheduleRepos" href="#PermsSyncer.scheduleRepos">func (s *PermsSyncer) scheduleRepos(ctx context.Context, repos ...scheduledRepo)</a>

```
searchKey: authz.PermsSyncer.scheduleRepos
tags: [private]
```

```Go
func (s *PermsSyncer) scheduleRepos(ctx context.Context, repos ...scheduledRepo)
```

#### <a id="PermsSyncer.providersByServiceID" href="#PermsSyncer.providersByServiceID">func (s *PermsSyncer) providersByServiceID() map[string]authz.Provider</a>

```
searchKey: authz.PermsSyncer.providersByServiceID
tags: [private]
```

```Go
func (s *PermsSyncer) providersByServiceID() map[string]authz.Provider
```

providersByServiceID returns a list of authz.Provider configured in the external services. Keys are ServiceID, e.g. "[https://github.com/](https://github.com/)". 

#### <a id="PermsSyncer.providersByURNs" href="#PermsSyncer.providersByURNs">func (s *PermsSyncer) providersByURNs() map[string]authz.Provider</a>

```
searchKey: authz.PermsSyncer.providersByURNs
tags: [private]
```

```Go
func (s *PermsSyncer) providersByURNs() map[string]authz.Provider
```

providersByURNs returns a list of authz.Provider configured in the external services. Keys are URN, e.g. "extsvc:github:1". 

#### <a id="PermsSyncer.syncUserPerms" href="#PermsSyncer.syncUserPerms">func (s *PermsSyncer) syncUserPerms(ctx context.Context, userID int32, noPerms bool) (err error)</a>

```
searchKey: authz.PermsSyncer.syncUserPerms
tags: [private]
```

```Go
func (s *PermsSyncer) syncUserPerms(ctx context.Context, userID int32, noPerms bool) (err error)
```

syncUserPerms processes permissions syncing request in user-centric way. When `noPerms` is true, the method will use partial results to update permissions tables even when error occurs. 

#### <a id="PermsSyncer.syncRepoPerms" href="#PermsSyncer.syncRepoPerms">func (s *PermsSyncer) syncRepoPerms(ctx context.Context, repoID api.RepoID, noPerms bool) (err error)</a>

```
searchKey: authz.PermsSyncer.syncRepoPerms
tags: [private]
```

```Go
func (s *PermsSyncer) syncRepoPerms(ctx context.Context, repoID api.RepoID, noPerms bool) (err error)
```

syncRepoPerms processes permissions syncing request in repository-centric way. When `noPerms` is true, the method will use partial results to update permissions tables even when error occurs. 

#### <a id="PermsSyncer.waitForRateLimit" href="#PermsSyncer.waitForRateLimit">func (s *PermsSyncer) waitForRateLimit(ctx context.Context, serviceID string, n int) error</a>

```
searchKey: authz.PermsSyncer.waitForRateLimit
tags: [private]
```

```Go
func (s *PermsSyncer) waitForRateLimit(ctx context.Context, serviceID string, n int) error
```

waitForRateLimit blocks until rate limit permits n events to happen. It returns an error if n exceeds the limiter's burst size, the context is canceled, or the expected wait time exceeds the context's deadline. The burst limit is ignored if the rate limit is Inf. 

#### <a id="PermsSyncer.syncPerms" href="#PermsSyncer.syncPerms">func (s *PermsSyncer) syncPerms(ctx context.Context, request *syncRequest) error</a>

```
searchKey: authz.PermsSyncer.syncPerms
tags: [private]
```

```Go
func (s *PermsSyncer) syncPerms(ctx context.Context, request *syncRequest) error
```

syncPerms processes the permissions syncing request and remove the request from the queue once it is done (independent of success or failure). 

#### <a id="PermsSyncer.runSync" href="#PermsSyncer.runSync">func (s *PermsSyncer) runSync(ctx context.Context)</a>

```
searchKey: authz.PermsSyncer.runSync
tags: [private]
```

```Go
func (s *PermsSyncer) runSync(ctx context.Context)
```

#### <a id="PermsSyncer.scheduleUsersWithNoPerms" href="#PermsSyncer.scheduleUsersWithNoPerms">func (s *PermsSyncer) scheduleUsersWithNoPerms(ctx context.Context) ([]scheduledUser, error)</a>

```
searchKey: authz.PermsSyncer.scheduleUsersWithNoPerms
tags: [private]
```

```Go
func (s *PermsSyncer) scheduleUsersWithNoPerms(ctx context.Context) ([]scheduledUser, error)
```

scheduleUsersWithNoPerms returns computed schedules for users who have no permissions found in database. 

#### <a id="PermsSyncer.scheduleReposWithNoPerms" href="#PermsSyncer.scheduleReposWithNoPerms">func (s *PermsSyncer) scheduleReposWithNoPerms(ctx context.Context) ([]scheduledRepo, error)</a>

```
searchKey: authz.PermsSyncer.scheduleReposWithNoPerms
tags: [private]
```

```Go
func (s *PermsSyncer) scheduleReposWithNoPerms(ctx context.Context) ([]scheduledRepo, error)
```

scheduleReposWithNoPerms returns computed schedules for private repositories that have no permissions found in database. 

#### <a id="PermsSyncer.scheduleUsersWithOldestPerms" href="#PermsSyncer.scheduleUsersWithOldestPerms">func (s *PermsSyncer) scheduleUsersWithOldestPerms(ctx context.Context, limit int) ([]scheduledUser, error)</a>

```
searchKey: authz.PermsSyncer.scheduleUsersWithOldestPerms
tags: [private]
```

```Go
func (s *PermsSyncer) scheduleUsersWithOldestPerms(ctx context.Context, limit int) ([]scheduledUser, error)
```

scheduleUsersWithOldestPerms returns computed schedules for users who have oldest permissions in database and capped results by the limit. 

#### <a id="PermsSyncer.scheduleReposWithOldestPerms" href="#PermsSyncer.scheduleReposWithOldestPerms">func (s *PermsSyncer) scheduleReposWithOldestPerms(ctx context.Context, limit int) ([]scheduledRepo, error)</a>

```
searchKey: authz.PermsSyncer.scheduleReposWithOldestPerms
tags: [private]
```

```Go
func (s *PermsSyncer) scheduleReposWithOldestPerms(ctx context.Context, limit int) ([]scheduledRepo, error)
```

scheduleReposWithOldestPerms returns computed schedules for private repositories that have oldest permissions in database. 

#### <a id="PermsSyncer.schedule" href="#PermsSyncer.schedule">func (s *PermsSyncer) schedule(ctx context.Context) (*schedule, error)</a>

```
searchKey: authz.PermsSyncer.schedule
tags: [private]
```

```Go
func (s *PermsSyncer) schedule(ctx context.Context) (*schedule, error)
```

schedule computes schedule four lists in the following order: 

```
1. Users with no permissions, because they can't do anything meaningful (e.g. not able to search).
2. Private repositories with no permissions, because those can't be viewed by anyone except site admins.
3. Rolling updating user permissions over time from oldest ones.
4. Rolling updating repository permissions over time from oldest ones.

```
#### <a id="PermsSyncer.isDisabled" href="#PermsSyncer.isDisabled">func (s *PermsSyncer) isDisabled() bool</a>

```
searchKey: authz.PermsSyncer.isDisabled
tags: [private]
```

```Go
func (s *PermsSyncer) isDisabled() bool
```

isDisabled returns true if the background permissions syncing is not enabled. It is not enabled if: 

```
- Permissions user mapping is enabled
- No authz provider is configured
- Not purchased with the current license
- `disableAutoCodeHostSyncs` site setting is set to true

```
#### <a id="PermsSyncer.runSchedule" href="#PermsSyncer.runSchedule">func (s *PermsSyncer) runSchedule(ctx context.Context)</a>

```
searchKey: authz.PermsSyncer.runSchedule
tags: [private]
```

```Go
func (s *PermsSyncer) runSchedule(ctx context.Context)
```

#### <a id="PermsSyncer.DebugDump" href="#PermsSyncer.DebugDump">func (s *PermsSyncer) DebugDump() interface{}</a>

```
searchKey: authz.PermsSyncer.DebugDump
```

```Go
func (s *PermsSyncer) DebugDump() interface{}
```

DebugDump returns the state of the permissions syncer for debugging. 

#### <a id="PermsSyncer.observe" href="#PermsSyncer.observe">func (s *PermsSyncer) observe(ctx context.Context, family, title string) (context.Context, func(requestType, int32, *error))</a>

```
searchKey: authz.PermsSyncer.observe
tags: [private]
```

```Go
func (s *PermsSyncer) observe(ctx context.Context, family, title string) (context.Context, func(requestType, int32, *error))
```

#### <a id="PermsSyncer.collectMetrics" href="#PermsSyncer.collectMetrics">func (s *PermsSyncer) collectMetrics(ctx context.Context)</a>

```
searchKey: authz.PermsSyncer.collectMetrics
tags: [private]
```

```Go
func (s *PermsSyncer) collectMetrics(ctx context.Context)
```

collectMetrics periodically collecting metrics values from both database and memory objects. 

#### <a id="PermsSyncer.Run" href="#PermsSyncer.Run">func (s *PermsSyncer) Run(ctx context.Context)</a>

```
searchKey: authz.PermsSyncer.Run
```

```Go
func (s *PermsSyncer) Run(ctx context.Context)
```

Run kicks off the permissions syncing process, this method is blocking and should be called as a goroutine. 

### <a id="schedule" href="#schedule">type schedule struct</a>

```
searchKey: authz.schedule
tags: [private]
```

```Go
type schedule struct {
	Users []scheduledUser
	Repos []scheduledRepo
}
```

schedule contains information for scheduling users and repositories. 

### <a id="scheduledUser" href="#scheduledUser">type scheduledUser struct</a>

```
searchKey: authz.scheduledUser
tags: [private]
```

```Go
type scheduledUser struct {
	priority   priority
	userID     int32
	nextSyncAt time.Time

	// Whether the user has no permissions when scheduled. Currently used to
	// accept partial results from authz provider in case of error.
	noPerms bool
}
```

scheduledUser contains information for scheduling a user. 

### <a id="scheduledRepo" href="#scheduledRepo">type scheduledRepo struct</a>

```
searchKey: authz.scheduledRepo
tags: [private]
```

```Go
type scheduledRepo struct {
	priority   priority
	repoID     api.RepoID
	nextSyncAt time.Time

	// Whether the repository has no permissions when scheduled. Currently used
	// to accept partial results from authz provider in case of error.
	noPerms bool
}
```

scheduledRepo contains for scheduling a repository. 

### <a id="priority" href="#priority">type priority int</a>

```
searchKey: authz.priority
tags: [private]
```

```Go
type priority int
```

priority defines how urgent the permissions syncing request is. Generally, if the request is driven from a user action (e.g. sign up, log in) then it should be priorityHigh. All other cases should be priorityLow. 

### <a id="requestType" href="#requestType">type requestType int</a>

```
searchKey: authz.requestType
tags: [private]
```

```Go
type requestType int
```

requestType is the type of the permissions syncing request. It defines the permissions syncing is either repository-centric or user-centric. 

#### <a id="requestType.higherPriorityThan" href="#requestType.higherPriorityThan">func (t1 requestType) higherPriorityThan(t2 requestType) bool</a>

```
searchKey: authz.requestType.higherPriorityThan
tags: [private]
```

```Go
func (t1 requestType) higherPriorityThan(t2 requestType) bool
```

higherPriorityThan returns true if the current request type has higher priority than the other one. 

### <a id="requestMeta" href="#requestMeta">type requestMeta struct</a>

```
searchKey: authz.requestMeta
tags: [private]
```

```Go
type requestMeta struct {
	Priority   priority
	Type       requestType
	ID         int32
	NextSyncAt time.Time
	NoPerms    bool
}
```

requestMeta contains metadata of a permissions syncing request. 

### <a id="syncRequest" href="#syncRequest">type syncRequest struct</a>

```
searchKey: authz.syncRequest
tags: [private]
```

```Go
type syncRequest struct {
	*requestMeta

	acquired bool // Whether the request has been acquired
	index    int  // The index in the heap
}
```

syncRequest is a permissions syncing request with its current status in the queue. 

### <a id="requestQueueKey" href="#requestQueueKey">type requestQueueKey struct</a>

```
searchKey: authz.requestQueueKey
tags: [private]
```

```Go
type requestQueueKey struct {
	typ requestType
	id  int32
}
```

requestQueueKey is the key type for index in a requestQueue. 

### <a id="requestQueue" href="#requestQueue">type requestQueue struct</a>

```
searchKey: authz.requestQueue
tags: [private]
```

```Go
type requestQueue struct {
	mu    sync.RWMutex
	heap  []*syncRequest
	index map[requestQueueKey]*syncRequest

	// The queue performs a non-blocking send on this channel
	// when a new value is enqueued so that the update loop
	// can wake up if it is idle.
	notifyEnqueue chan struct{}
}
```

requestQueue is a priority queue of permissions syncing requests. Requests with same requestType and id are guaranteed to only have one instance in the queue. 

#### <a id="newRequestQueue" href="#newRequestQueue">func newRequestQueue() *requestQueue</a>

```
searchKey: authz.newRequestQueue
tags: [private]
```

```Go
func newRequestQueue() *requestQueue
```

#### <a id="requestQueue.enqueue" href="#requestQueue.enqueue">func (q *requestQueue) enqueue(meta *requestMeta) (updated bool)</a>

```
searchKey: authz.requestQueue.enqueue
tags: [private]
```

```Go
func (q *requestQueue) enqueue(meta *requestMeta) (updated bool)
```

enqueue adds a sync request to the queue with the given metadata. 

If the sync request is already in the queue and it isn't yet acquired, the request is updated. 

If the given priority is higher than the one in the queue, the sync request's position in the queue is updated accordingly. 

#### <a id="requestQueue.remove" href="#requestQueue.remove">func (q *requestQueue) remove(typ requestType, id int32, acquired bool) (removed bool)</a>

```
searchKey: authz.requestQueue.remove
tags: [private]
```

```Go
func (q *requestQueue) remove(typ requestType, id int32, acquired bool) (removed bool)
```

remove removes the sync request from the queue if the request.acquired matches the acquired argument. 

#### <a id="requestQueue.acquireNext" href="#requestQueue.acquireNext">func (q *requestQueue) acquireNext() *syncRequest</a>

```
searchKey: authz.requestQueue.acquireNext
tags: [private]
```

```Go
func (q *requestQueue) acquireNext() *syncRequest
```

acquireNext acquires the next sync request. The acquired request must be removed from the queue when the request finishes (independent of success or failure). This is to prevent enqueuing a new request while an earlier and identical one is being processed. 

#### <a id="requestQueue.release" href="#requestQueue.release">func (q *requestQueue) release(typ requestType, id int32)</a>

```
searchKey: authz.requestQueue.release
tags: [private]
```

```Go
func (q *requestQueue) release(typ requestType, id int32)
```

release releases the acquired sync request from the queue (i.e. sets the acquired state back to false). 

#### <a id="requestQueue.Len" href="#requestQueue.Len">func (q *requestQueue) Len() int</a>

```
searchKey: authz.requestQueue.Len
tags: [private]
```

```Go
func (q *requestQueue) Len() int
```

#### <a id="requestQueue.Less" href="#requestQueue.Less">func (q *requestQueue) Less(i, j int) bool</a>

```
searchKey: authz.requestQueue.Less
tags: [private]
```

```Go
func (q *requestQueue) Less(i, j int) bool
```

#### <a id="requestQueue.Swap" href="#requestQueue.Swap">func (q *requestQueue) Swap(i, j int)</a>

```
searchKey: authz.requestQueue.Swap
tags: [private]
```

```Go
func (q *requestQueue) Swap(i, j int)
```

#### <a id="requestQueue.Push" href="#requestQueue.Push">func (q *requestQueue) Push(x interface{})</a>

```
searchKey: authz.requestQueue.Push
tags: [private]
```

```Go
func (q *requestQueue) Push(x interface{})
```

#### <a id="requestQueue.Pop" href="#requestQueue.Pop">func (q *requestQueue) Pop() interface{}</a>

```
searchKey: authz.requestQueue.Pop
tags: [private]
```

```Go
func (q *requestQueue) Pop() interface{}
```

### <a id="mockProvider" href="#mockProvider">type mockProvider struct</a>

```
searchKey: authz.mockProvider
tags: [private]
```

```Go
type mockProvider struct {
	id          int64
	serviceType string
	serviceID   string

	fetchUserPerms func(context.Context, *extsvc.Account) (*authz.ExternalUserPermissions, error)
	fetchRepoPerms func(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)
}
```

#### <a id="mockProvider.FetchAccount" href="#mockProvider.FetchAccount">func (*mockProvider) FetchAccount(context.Context, *types.User, []*extsvc.Account, []string) (*extsvc.Account, error)</a>

```
searchKey: authz.mockProvider.FetchAccount
tags: [private]
```

```Go
func (*mockProvider) FetchAccount(context.Context, *types.User, []*extsvc.Account, []string) (*extsvc.Account, error)
```

#### <a id="mockProvider.ServiceType" href="#mockProvider.ServiceType">func (p *mockProvider) ServiceType() string</a>

```
searchKey: authz.mockProvider.ServiceType
tags: [private]
```

```Go
func (p *mockProvider) ServiceType() string
```

#### <a id="mockProvider.ServiceID" href="#mockProvider.ServiceID">func (p *mockProvider) ServiceID() string</a>

```
searchKey: authz.mockProvider.ServiceID
tags: [private]
```

```Go
func (p *mockProvider) ServiceID() string
```

#### <a id="mockProvider.URN" href="#mockProvider.URN">func (p *mockProvider) URN() string</a>

```
searchKey: authz.mockProvider.URN
tags: [private]
```

```Go
func (p *mockProvider) URN() string
```

#### <a id="mockProvider.Validate" href="#mockProvider.Validate">func (*mockProvider) Validate() []string</a>

```
searchKey: authz.mockProvider.Validate
tags: [private]
```

```Go
func (*mockProvider) Validate() []string
```

#### <a id="mockProvider.FetchUserPerms" href="#mockProvider.FetchUserPerms">func (p *mockProvider) FetchUserPerms(ctx context.Context, acct *extsvc.Account) (*authz.ExternalUserPermissions, error)</a>

```
searchKey: authz.mockProvider.FetchUserPerms
tags: [private]
```

```Go
func (p *mockProvider) FetchUserPerms(ctx context.Context, acct *extsvc.Account) (*authz.ExternalUserPermissions, error)
```

#### <a id="mockProvider.FetchRepoPerms" href="#mockProvider.FetchRepoPerms">func (p *mockProvider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)</a>

```
searchKey: authz.mockProvider.FetchRepoPerms
tags: [private]
```

```Go
func (p *mockProvider) FetchRepoPerms(ctx context.Context, repo *extsvc.Repository) ([]extsvc.AccountID, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="notify" href="#notify">func notify(ch chan struct{})</a>

```
searchKey: authz.notify
tags: [private]
```

```Go
func notify(ch chan struct{})
```

notify performs a non-blocking send to the channel, so the channel must be buffered. When the channel is blocked (i.e. buffer is full), it skips the notify thus will not send anything to the channel. 

### <a id="update" href="#update">func update(name string) bool</a>

```
searchKey: authz.update
tags: [private]
```

```Go
func update(name string) bool
```

### <a id="TestIntegration_GitHubPermissions" href="#TestIntegration_GitHubPermissions">func TestIntegration_GitHubPermissions(t *testing.T)</a>

```
searchKey: authz.TestIntegration_GitHubPermissions
tags: [private]
```

```Go
func TestIntegration_GitHubPermissions(t *testing.T)
```

This integration test performs a repository-centric permissions syncing against [https://github.com](https://github.com), then check if permissions are correctly granted for the test user "sourcegraph-vcr-bob", who is a outside collaborator of the repository "sourcegraph-vcr-repos/private-org-repo-1". 

NOTE: To update VCR for this test, please use the token of "sourcegraph-vcr" for GITHUB_TOKEN, which can be found in 1Password. 

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: authz.TestMain
tags: [private]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestPermsSyncer_ScheduleUsers" href="#TestPermsSyncer_ScheduleUsers">func TestPermsSyncer_ScheduleUsers(t *testing.T)</a>

```
searchKey: authz.TestPermsSyncer_ScheduleUsers
tags: [private]
```

```Go
func TestPermsSyncer_ScheduleUsers(t *testing.T)
```

### <a id="TestPermsSyncer_ScheduleRepos" href="#TestPermsSyncer_ScheduleRepos">func TestPermsSyncer_ScheduleRepos(t *testing.T)</a>

```
searchKey: authz.TestPermsSyncer_ScheduleRepos
tags: [private]
```

```Go
func TestPermsSyncer_ScheduleRepos(t *testing.T)
```

### <a id="TestPermsSyncer_syncUserPerms" href="#TestPermsSyncer_syncUserPerms">func TestPermsSyncer_syncUserPerms(t *testing.T)</a>

```
searchKey: authz.TestPermsSyncer_syncUserPerms
tags: [private]
```

```Go
func TestPermsSyncer_syncUserPerms(t *testing.T)
```

### <a id="TestPermsSyncer_syncUserPerms_tokenExpire" href="#TestPermsSyncer_syncUserPerms_tokenExpire">func TestPermsSyncer_syncUserPerms_tokenExpire(t *testing.T)</a>

```
searchKey: authz.TestPermsSyncer_syncUserPerms_tokenExpire
tags: [private]
```

```Go
func TestPermsSyncer_syncUserPerms_tokenExpire(t *testing.T)
```

### <a id="TestPermsSyncer_syncUserPerms_prefixSpecs" href="#TestPermsSyncer_syncUserPerms_prefixSpecs">func TestPermsSyncer_syncUserPerms_prefixSpecs(t *testing.T)</a>

```
searchKey: authz.TestPermsSyncer_syncUserPerms_prefixSpecs
tags: [private]
```

```Go
func TestPermsSyncer_syncUserPerms_prefixSpecs(t *testing.T)
```

### <a id="TestPermsSyncer_syncRepoPerms" href="#TestPermsSyncer_syncRepoPerms">func TestPermsSyncer_syncRepoPerms(t *testing.T)</a>

```
searchKey: authz.TestPermsSyncer_syncRepoPerms
tags: [private]
```

```Go
func TestPermsSyncer_syncRepoPerms(t *testing.T)
```

### <a id="TestPermsSyncer_waitForRateLimit" href="#TestPermsSyncer_waitForRateLimit">func TestPermsSyncer_waitForRateLimit(t *testing.T)</a>

```
searchKey: authz.TestPermsSyncer_waitForRateLimit
tags: [private]
```

```Go
func TestPermsSyncer_waitForRateLimit(t *testing.T)
```

### <a id="TestPermsSyncer_syncPerms" href="#TestPermsSyncer_syncPerms">func TestPermsSyncer_syncPerms(t *testing.T)</a>

```
searchKey: authz.TestPermsSyncer_syncPerms
tags: [private]
```

```Go
func TestPermsSyncer_syncPerms(t *testing.T)
```

### <a id="Test_requestQueue_enqueue" href="#Test_requestQueue_enqueue">func Test_requestQueue_enqueue(t *testing.T)</a>

```
searchKey: authz.Test_requestQueue_enqueue
tags: [private]
```

```Go
func Test_requestQueue_enqueue(t *testing.T)
```

### <a id="Test_requestQueue_remove" href="#Test_requestQueue_remove">func Test_requestQueue_remove(t *testing.T)</a>

```
searchKey: authz.Test_requestQueue_remove
tags: [private]
```

```Go
func Test_requestQueue_remove(t *testing.T)
```

### <a id="Test_requestQueue_acquireNext" href="#Test_requestQueue_acquireNext">func Test_requestQueue_acquireNext(t *testing.T)</a>

```
searchKey: authz.Test_requestQueue_acquireNext
tags: [private]
```

```Go
func Test_requestQueue_acquireNext(t *testing.T)
```

### <a id="Test_requestQueue_release" href="#Test_requestQueue_release">func Test_requestQueue_release(t *testing.T)</a>

```
searchKey: authz.Test_requestQueue_release
tags: [private]
```

```Go
func Test_requestQueue_release(t *testing.T)
```

### <a id="Test_requestQueue_Less" href="#Test_requestQueue_Less">func Test_requestQueue_Less(t *testing.T)</a>

```
searchKey: authz.Test_requestQueue_Less
tags: [private]
```

```Go
func Test_requestQueue_Less(t *testing.T)
```

