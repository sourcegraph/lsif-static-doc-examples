# Package discovery

## Index

* [Variables](#var)
    * [var settingsExample](#settingsExample)
* [Types](#type)
    * [type DefaultRepoLister interface](#DefaultRepoLister)
    * [type RepoStore interface](#RepoStore)
    * [type AllReposIterator struct](#AllReposIterator)
        * [func (a *AllReposIterator) timeSince(t time.Time) time.Duration](#AllReposIterator.timeSince)
        * [func (a *AllReposIterator) ForEach(ctx context.Context, forEach func(repoName string) error) error](#AllReposIterator.ForEach)
        * [func (a *AllReposIterator) cachedRepoStoreList(ctx context.Context, page database.LimitOffset) ([]*types.Repo, error)](#AllReposIterator.cachedRepoStoreList)
    * [type cachedPageRequest struct](#cachedPageRequest)
    * [type SettingStore interface](#SettingStore)
    * [type MockDefaultRepoLister struct](#MockDefaultRepoLister)
        * [func NewMockDefaultRepoLister() *MockDefaultRepoLister](#NewMockDefaultRepoLister)
        * [func NewMockDefaultRepoListerFrom(i DefaultRepoLister) *MockDefaultRepoLister](#NewMockDefaultRepoListerFrom)
        * [func (m *MockDefaultRepoLister) List(v0 context.Context) ([]types.RepoName, error)](#MockDefaultRepoLister.List)
    * [type DefaultRepoListerListFunc struct](#DefaultRepoListerListFunc)
        * [func (f *DefaultRepoListerListFunc) SetDefaultHook(hook func(context.Context) ([]types.RepoName, error))](#DefaultRepoListerListFunc.SetDefaultHook)
        * [func (f *DefaultRepoListerListFunc) PushHook(hook func(context.Context) ([]types.RepoName, error))](#DefaultRepoListerListFunc.PushHook)
        * [func (f *DefaultRepoListerListFunc) SetDefaultReturn(r0 []types.RepoName, r1 error)](#DefaultRepoListerListFunc.SetDefaultReturn)
        * [func (f *DefaultRepoListerListFunc) PushReturn(r0 []types.RepoName, r1 error)](#DefaultRepoListerListFunc.PushReturn)
        * [func (f *DefaultRepoListerListFunc) nextHook() func(context.Context) ([]types.RepoName, error)](#DefaultRepoListerListFunc.nextHook)
        * [func (f *DefaultRepoListerListFunc) appendCall(r0 DefaultRepoListerListFuncCall)](#DefaultRepoListerListFunc.appendCall)
        * [func (f *DefaultRepoListerListFunc) History() []DefaultRepoListerListFuncCall](#DefaultRepoListerListFunc.History)
    * [type DefaultRepoListerListFuncCall struct](#DefaultRepoListerListFuncCall)
        * [func (c DefaultRepoListerListFuncCall) Args() []interface{}](#DefaultRepoListerListFuncCall.Args)
        * [func (c DefaultRepoListerListFuncCall) Results() []interface{}](#DefaultRepoListerListFuncCall.Results)
    * [type MockRepoStore struct](#MockRepoStore)
        * [func NewMockRepoStore() *MockRepoStore](#NewMockRepoStore)
        * [func NewMockRepoStoreFrom(i RepoStore) *MockRepoStore](#NewMockRepoStoreFrom)
        * [func (m *MockRepoStore) List(v0 context.Context, v1 database.ReposListOptions) ([]*types.Repo, error)](#MockRepoStore.List)
    * [type RepoStoreListFunc struct](#RepoStoreListFunc)
        * [func (f *RepoStoreListFunc) SetDefaultHook(hook func(context.Context, database.ReposListOptions) ([]*types.Repo, error))](#RepoStoreListFunc.SetDefaultHook)
        * [func (f *RepoStoreListFunc) PushHook(hook func(context.Context, database.ReposListOptions) ([]*types.Repo, error))](#RepoStoreListFunc.PushHook)
        * [func (f *RepoStoreListFunc) SetDefaultReturn(r0 []*types.Repo, r1 error)](#RepoStoreListFunc.SetDefaultReturn)
        * [func (f *RepoStoreListFunc) PushReturn(r0 []*types.Repo, r1 error)](#RepoStoreListFunc.PushReturn)
        * [func (f *RepoStoreListFunc) nextHook() func(context.Context, database.ReposListOptions) ([]*types.Repo, error)](#RepoStoreListFunc.nextHook)
        * [func (f *RepoStoreListFunc) appendCall(r0 RepoStoreListFuncCall)](#RepoStoreListFunc.appendCall)
        * [func (f *RepoStoreListFunc) History() []RepoStoreListFuncCall](#RepoStoreListFunc.History)
    * [type RepoStoreListFuncCall struct](#RepoStoreListFuncCall)
        * [func (c RepoStoreListFuncCall) Args() []interface{}](#RepoStoreListFuncCall.Args)
        * [func (c RepoStoreListFuncCall) Results() []interface{}](#RepoStoreListFuncCall.Results)
    * [type MockSettingStore struct](#MockSettingStore)
        * [func NewMockSettingStore() *MockSettingStore](#NewMockSettingStore)
        * [func NewMockSettingStoreFrom(i SettingStore) *MockSettingStore](#NewMockSettingStoreFrom)
        * [func (m *MockSettingStore) GetLastestSchemaSettings(v0 context.Context, v1 api.SettingsSubject) (*schema.Settings, error)](#MockSettingStore.GetLastestSchemaSettings)
        * [func (m *MockSettingStore) GetLatest(v0 context.Context, v1 api.SettingsSubject) (*api.Settings, error)](#MockSettingStore.GetLatest)
    * [type SettingStoreGetLastestSchemaSettingsFunc struct](#SettingStoreGetLastestSchemaSettingsFunc)
        * [func (f *SettingStoreGetLastestSchemaSettingsFunc) SetDefaultHook(hook func(context.Context, api.SettingsSubject) (*schema.Settings, error))](#SettingStoreGetLastestSchemaSettingsFunc.SetDefaultHook)
        * [func (f *SettingStoreGetLastestSchemaSettingsFunc) PushHook(hook func(context.Context, api.SettingsSubject) (*schema.Settings, error))](#SettingStoreGetLastestSchemaSettingsFunc.PushHook)
        * [func (f *SettingStoreGetLastestSchemaSettingsFunc) SetDefaultReturn(r0 *schema.Settings, r1 error)](#SettingStoreGetLastestSchemaSettingsFunc.SetDefaultReturn)
        * [func (f *SettingStoreGetLastestSchemaSettingsFunc) PushReturn(r0 *schema.Settings, r1 error)](#SettingStoreGetLastestSchemaSettingsFunc.PushReturn)
        * [func (f *SettingStoreGetLastestSchemaSettingsFunc) nextHook() func(context.Context, api.SettingsSubject) (*schema.Settings, error)](#SettingStoreGetLastestSchemaSettingsFunc.nextHook)
        * [func (f *SettingStoreGetLastestSchemaSettingsFunc) appendCall(r0 SettingStoreGetLastestSchemaSettingsFuncCall)](#SettingStoreGetLastestSchemaSettingsFunc.appendCall)
        * [func (f *SettingStoreGetLastestSchemaSettingsFunc) History() []SettingStoreGetLastestSchemaSettingsFuncCall](#SettingStoreGetLastestSchemaSettingsFunc.History)
    * [type SettingStoreGetLastestSchemaSettingsFuncCall struct](#SettingStoreGetLastestSchemaSettingsFuncCall)
        * [func (c SettingStoreGetLastestSchemaSettingsFuncCall) Args() []interface{}](#SettingStoreGetLastestSchemaSettingsFuncCall.Args)
        * [func (c SettingStoreGetLastestSchemaSettingsFuncCall) Results() []interface{}](#SettingStoreGetLastestSchemaSettingsFuncCall.Results)
    * [type SettingStoreGetLatestFunc struct](#SettingStoreGetLatestFunc)
        * [func (f *SettingStoreGetLatestFunc) SetDefaultHook(hook func(context.Context, api.SettingsSubject) (*api.Settings, error))](#SettingStoreGetLatestFunc.SetDefaultHook)
        * [func (f *SettingStoreGetLatestFunc) PushHook(hook func(context.Context, api.SettingsSubject) (*api.Settings, error))](#SettingStoreGetLatestFunc.PushHook)
        * [func (f *SettingStoreGetLatestFunc) SetDefaultReturn(r0 *api.Settings, r1 error)](#SettingStoreGetLatestFunc.SetDefaultReturn)
        * [func (f *SettingStoreGetLatestFunc) PushReturn(r0 *api.Settings, r1 error)](#SettingStoreGetLatestFunc.PushReturn)
        * [func (f *SettingStoreGetLatestFunc) nextHook() func(context.Context, api.SettingsSubject) (*api.Settings, error)](#SettingStoreGetLatestFunc.nextHook)
        * [func (f *SettingStoreGetLatestFunc) appendCall(r0 SettingStoreGetLatestFuncCall)](#SettingStoreGetLatestFunc.appendCall)
        * [func (f *SettingStoreGetLatestFunc) History() []SettingStoreGetLatestFuncCall](#SettingStoreGetLatestFunc.History)
    * [type SettingStoreGetLatestFuncCall struct](#SettingStoreGetLatestFuncCall)
        * [func (c SettingStoreGetLatestFuncCall) Args() []interface{}](#SettingStoreGetLatestFuncCall.Args)
        * [func (c SettingStoreGetLatestFuncCall) Results() []interface{}](#SettingStoreGetLatestFuncCall.Results)
* [Functions](#func)
    * [func Discover(ctx context.Context, settingStore SettingStore) ([]*schema.Insight, error)](#Discover)
    * [func parseUserSettings(settings *api.Settings) (*schema.Settings, error)](#parseUserSettings)
    * [func EncodeSeriesID(series *schema.InsightSeries) (string, error)](#EncodeSeriesID)
    * [func sha256String(s string) string](#sha256String)
    * [func TestAllReposIterator(t *testing.T)](#TestAllReposIterator)
    * [func TestAllReposIterator_DotCom(t *testing.T)](#TestAllReposIterator_DotCom)
    * [func TestDiscover(t *testing.T)](#TestDiscover)
    * [func Test_parseUserSettings(t *testing.T)](#Test_parseUserSettings)
    * [func TestEncodeSeriesID(t *testing.T)](#TestEncodeSeriesID)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="settingsExample" href="#settingsExample">var settingsExample</a>

```
searchKey: discovery.settingsExample
tags: [private]
```

```Go
var settingsExample = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="DefaultRepoLister" href="#DefaultRepoLister">type DefaultRepoLister interface</a>

```
searchKey: discovery.DefaultRepoLister
```

```Go
type DefaultRepoLister interface {
	List(ctx context.Context) ([]types.RepoName, error)
}
```

DefaultRepoLister is a subset of the API exposed by the backend.CachedDefaultRepoLister. 

### <a id="RepoStore" href="#RepoStore">type RepoStore interface</a>

```
searchKey: discovery.RepoStore
```

```Go
type RepoStore interface {
	List(ctx context.Context, opt database.ReposListOptions) (results []*types.Repo, err error)
}
```

RepoStore is a subset of the API exposed by the database.Repos() store. 

### <a id="AllReposIterator" href="#AllReposIterator">type AllReposIterator struct</a>

```
searchKey: discovery.AllReposIterator
```

```Go
type AllReposIterator struct {
	DefaultRepoLister     DefaultRepoLister
	RepoStore             RepoStore
	Clock                 func() time.Time
	SourcegraphDotComMode bool // result of envvar.SourcegraphDotComMode()

	// RepositoryListCacheTime describes how long to cache repository lists for. These API calls
	// can result in hundreds of thousands of repositories, so choose wisely as it can be expensive
	// to pull such large numbers of rows from the DB frequently.
	RepositoryListCacheTime time.Duration

	// Internal fields below.
	cachedRepoNamesAge time.Time
	cachedRepoNames    []string
	cachedPageRequests map[database.LimitOffset]cachedPageRequest
}
```

AllReposIterator implements an efficient way to iterate over every single repository on Sourcegraph that should be considered for code insights. 

It caches multiple consecutive uses in order to ensure repository lists (which can be quite large, e.g. 500,000+ repositories) are only fetched as frequently as needed. 

#### <a id="AllReposIterator.timeSince" href="#AllReposIterator.timeSince">func (a *AllReposIterator) timeSince(t time.Time) time.Duration</a>

```
searchKey: discovery.AllReposIterator.timeSince
tags: [private]
```

```Go
func (a *AllReposIterator) timeSince(t time.Time) time.Duration
```

#### <a id="AllReposIterator.ForEach" href="#AllReposIterator.ForEach">func (a *AllReposIterator) ForEach(ctx context.Context, forEach func(repoName string) error) error</a>

```
searchKey: discovery.AllReposIterator.ForEach
```

```Go
func (a *AllReposIterator) ForEach(ctx context.Context, forEach func(repoName string) error) error
```

ForEach invokes the given function for every repository that we should consider gathering data for historically. 

This takes into account paginating repository names from the database (as there could be e.g. 500,000+ of them). It also takes into account Sourcegraph.com, where we only gather historical data for the same subset of repos we index for search. 

If the forEach function returns an error, pagination is stopped and the error returned. 

#### <a id="AllReposIterator.cachedRepoStoreList" href="#AllReposIterator.cachedRepoStoreList">func (a *AllReposIterator) cachedRepoStoreList(ctx context.Context, page database.LimitOffset) ([]*types.Repo, error)</a>

```
searchKey: discovery.AllReposIterator.cachedRepoStoreList
tags: [private]
```

```Go
func (a *AllReposIterator) cachedRepoStoreList(ctx context.Context, page database.LimitOffset) ([]*types.Repo, error)
```

cachedRepoStoreList calls a.repoStore.List to do a paginated list of repositories, and caches the results in-memory for some time. 

This is primarily useful because we call this function e.g. 1 time per 365 days. 

### <a id="cachedPageRequest" href="#cachedPageRequest">type cachedPageRequest struct</a>

```
searchKey: discovery.cachedPageRequest
tags: [private]
```

```Go
type cachedPageRequest struct {
	age     time.Time
	results []*types.Repo
}
```

### <a id="SettingStore" href="#SettingStore">type SettingStore interface</a>

```
searchKey: discovery.SettingStore
```

```Go
type SettingStore interface {
	GetLatest(context.Context, api.SettingsSubject) (*api.Settings, error)
	GetLastestSchemaSettings(context.Context, api.SettingsSubject) (*schema.Settings, error)
}
```

SettingStore is a subset of the API exposed by the database.Settings() store. 

### <a id="MockDefaultRepoLister" href="#MockDefaultRepoLister">type MockDefaultRepoLister struct</a>

```
searchKey: discovery.MockDefaultRepoLister
```

```Go
type MockDefaultRepoLister struct {
	// ListFunc is an instance of a mock function object controlling the
	// behavior of the method List.
	ListFunc *DefaultRepoListerListFunc
}
```

MockDefaultRepoLister is a mock implementation of the DefaultRepoLister interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/insights/discovery) used for unit testing. 

#### <a id="NewMockDefaultRepoLister" href="#NewMockDefaultRepoLister">func NewMockDefaultRepoLister() *MockDefaultRepoLister</a>

```
searchKey: discovery.NewMockDefaultRepoLister
```

```Go
func NewMockDefaultRepoLister() *MockDefaultRepoLister
```

NewMockDefaultRepoLister creates a new mock of the DefaultRepoLister interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockDefaultRepoListerFrom" href="#NewMockDefaultRepoListerFrom">func NewMockDefaultRepoListerFrom(i DefaultRepoLister) *MockDefaultRepoLister</a>

```
searchKey: discovery.NewMockDefaultRepoListerFrom
```

```Go
func NewMockDefaultRepoListerFrom(i DefaultRepoLister) *MockDefaultRepoLister
```

NewMockDefaultRepoListerFrom creates a new mock of the MockDefaultRepoLister interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockDefaultRepoLister.List" href="#MockDefaultRepoLister.List">func (m *MockDefaultRepoLister) List(v0 context.Context) ([]types.RepoName, error)</a>

```
searchKey: discovery.MockDefaultRepoLister.List
```

```Go
func (m *MockDefaultRepoLister) List(v0 context.Context) ([]types.RepoName, error)
```

List delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="DefaultRepoListerListFunc" href="#DefaultRepoListerListFunc">type DefaultRepoListerListFunc struct</a>

```
searchKey: discovery.DefaultRepoListerListFunc
```

```Go
type DefaultRepoListerListFunc struct {
	defaultHook func(context.Context) ([]types.RepoName, error)
	hooks       []func(context.Context) ([]types.RepoName, error)
	history     []DefaultRepoListerListFuncCall
	mutex       sync.Mutex
}
```

DefaultRepoListerListFunc describes the behavior when the List method of the parent MockDefaultRepoLister instance is invoked. 

#### <a id="DefaultRepoListerListFunc.SetDefaultHook" href="#DefaultRepoListerListFunc.SetDefaultHook">func (f *DefaultRepoListerListFunc) SetDefaultHook(hook func(context.Context) ([]types.RepoName, error))</a>

```
searchKey: discovery.DefaultRepoListerListFunc.SetDefaultHook
```

```Go
func (f *DefaultRepoListerListFunc) SetDefaultHook(hook func(context.Context) ([]types.RepoName, error))
```

SetDefaultHook sets function that is called when the List method of the parent MockDefaultRepoLister instance is invoked and the hook queue is empty. 

#### <a id="DefaultRepoListerListFunc.PushHook" href="#DefaultRepoListerListFunc.PushHook">func (f *DefaultRepoListerListFunc) PushHook(hook func(context.Context) ([]types.RepoName, error))</a>

```
searchKey: discovery.DefaultRepoListerListFunc.PushHook
```

```Go
func (f *DefaultRepoListerListFunc) PushHook(hook func(context.Context) ([]types.RepoName, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the List method of the parent MockDefaultRepoLister instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DefaultRepoListerListFunc.SetDefaultReturn" href="#DefaultRepoListerListFunc.SetDefaultReturn">func (f *DefaultRepoListerListFunc) SetDefaultReturn(r0 []types.RepoName, r1 error)</a>

```
searchKey: discovery.DefaultRepoListerListFunc.SetDefaultReturn
```

```Go
func (f *DefaultRepoListerListFunc) SetDefaultReturn(r0 []types.RepoName, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DefaultRepoListerListFunc.PushReturn" href="#DefaultRepoListerListFunc.PushReturn">func (f *DefaultRepoListerListFunc) PushReturn(r0 []types.RepoName, r1 error)</a>

```
searchKey: discovery.DefaultRepoListerListFunc.PushReturn
```

```Go
func (f *DefaultRepoListerListFunc) PushReturn(r0 []types.RepoName, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DefaultRepoListerListFunc.nextHook" href="#DefaultRepoListerListFunc.nextHook">func (f *DefaultRepoListerListFunc) nextHook() func(context.Context) ([]types.RepoName, error)</a>

```
searchKey: discovery.DefaultRepoListerListFunc.nextHook
tags: [private]
```

```Go
func (f *DefaultRepoListerListFunc) nextHook() func(context.Context) ([]types.RepoName, error)
```

#### <a id="DefaultRepoListerListFunc.appendCall" href="#DefaultRepoListerListFunc.appendCall">func (f *DefaultRepoListerListFunc) appendCall(r0 DefaultRepoListerListFuncCall)</a>

```
searchKey: discovery.DefaultRepoListerListFunc.appendCall
tags: [private]
```

```Go
func (f *DefaultRepoListerListFunc) appendCall(r0 DefaultRepoListerListFuncCall)
```

#### <a id="DefaultRepoListerListFunc.History" href="#DefaultRepoListerListFunc.History">func (f *DefaultRepoListerListFunc) History() []DefaultRepoListerListFuncCall</a>

```
searchKey: discovery.DefaultRepoListerListFunc.History
```

```Go
func (f *DefaultRepoListerListFunc) History() []DefaultRepoListerListFuncCall
```

History returns a sequence of DefaultRepoListerListFuncCall objects describing the invocations of this function. 

### <a id="DefaultRepoListerListFuncCall" href="#DefaultRepoListerListFuncCall">type DefaultRepoListerListFuncCall struct</a>

```
searchKey: discovery.DefaultRepoListerListFuncCall
```

```Go
type DefaultRepoListerListFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []types.RepoName
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DefaultRepoListerListFuncCall is an object that describes an invocation of method List on an instance of MockDefaultRepoLister. 

#### <a id="DefaultRepoListerListFuncCall.Args" href="#DefaultRepoListerListFuncCall.Args">func (c DefaultRepoListerListFuncCall) Args() []interface{}</a>

```
searchKey: discovery.DefaultRepoListerListFuncCall.Args
```

```Go
func (c DefaultRepoListerListFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DefaultRepoListerListFuncCall.Results" href="#DefaultRepoListerListFuncCall.Results">func (c DefaultRepoListerListFuncCall) Results() []interface{}</a>

```
searchKey: discovery.DefaultRepoListerListFuncCall.Results
```

```Go
func (c DefaultRepoListerListFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockRepoStore" href="#MockRepoStore">type MockRepoStore struct</a>

```
searchKey: discovery.MockRepoStore
```

```Go
type MockRepoStore struct {
	// ListFunc is an instance of a mock function object controlling the
	// behavior of the method List.
	ListFunc *RepoStoreListFunc
}
```

MockRepoStore is a mock implementation of the RepoStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/insights/discovery) used for unit testing. 

#### <a id="NewMockRepoStore" href="#NewMockRepoStore">func NewMockRepoStore() *MockRepoStore</a>

```
searchKey: discovery.NewMockRepoStore
```

```Go
func NewMockRepoStore() *MockRepoStore
```

NewMockRepoStore creates a new mock of the RepoStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockRepoStoreFrom" href="#NewMockRepoStoreFrom">func NewMockRepoStoreFrom(i RepoStore) *MockRepoStore</a>

```
searchKey: discovery.NewMockRepoStoreFrom
```

```Go
func NewMockRepoStoreFrom(i RepoStore) *MockRepoStore
```

NewMockRepoStoreFrom creates a new mock of the MockRepoStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockRepoStore.List" href="#MockRepoStore.List">func (m *MockRepoStore) List(v0 context.Context, v1 database.ReposListOptions) ([]*types.Repo, error)</a>

```
searchKey: discovery.MockRepoStore.List
```

```Go
func (m *MockRepoStore) List(v0 context.Context, v1 database.ReposListOptions) ([]*types.Repo, error)
```

List delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="RepoStoreListFunc" href="#RepoStoreListFunc">type RepoStoreListFunc struct</a>

```
searchKey: discovery.RepoStoreListFunc
```

```Go
type RepoStoreListFunc struct {
	defaultHook func(context.Context, database.ReposListOptions) ([]*types.Repo, error)
	hooks       []func(context.Context, database.ReposListOptions) ([]*types.Repo, error)
	history     []RepoStoreListFuncCall
	mutex       sync.Mutex
}
```

RepoStoreListFunc describes the behavior when the List method of the parent MockRepoStore instance is invoked. 

#### <a id="RepoStoreListFunc.SetDefaultHook" href="#RepoStoreListFunc.SetDefaultHook">func (f *RepoStoreListFunc) SetDefaultHook(hook func(context.Context, database.ReposListOptions) ([]*types.Repo, error))</a>

```
searchKey: discovery.RepoStoreListFunc.SetDefaultHook
```

```Go
func (f *RepoStoreListFunc) SetDefaultHook(hook func(context.Context, database.ReposListOptions) ([]*types.Repo, error))
```

SetDefaultHook sets function that is called when the List method of the parent MockRepoStore instance is invoked and the hook queue is empty. 

#### <a id="RepoStoreListFunc.PushHook" href="#RepoStoreListFunc.PushHook">func (f *RepoStoreListFunc) PushHook(hook func(context.Context, database.ReposListOptions) ([]*types.Repo, error))</a>

```
searchKey: discovery.RepoStoreListFunc.PushHook
```

```Go
func (f *RepoStoreListFunc) PushHook(hook func(context.Context, database.ReposListOptions) ([]*types.Repo, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the List method of the parent MockRepoStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="RepoStoreListFunc.SetDefaultReturn" href="#RepoStoreListFunc.SetDefaultReturn">func (f *RepoStoreListFunc) SetDefaultReturn(r0 []*types.Repo, r1 error)</a>

```
searchKey: discovery.RepoStoreListFunc.SetDefaultReturn
```

```Go
func (f *RepoStoreListFunc) SetDefaultReturn(r0 []*types.Repo, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="RepoStoreListFunc.PushReturn" href="#RepoStoreListFunc.PushReturn">func (f *RepoStoreListFunc) PushReturn(r0 []*types.Repo, r1 error)</a>

```
searchKey: discovery.RepoStoreListFunc.PushReturn
```

```Go
func (f *RepoStoreListFunc) PushReturn(r0 []*types.Repo, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="RepoStoreListFunc.nextHook" href="#RepoStoreListFunc.nextHook">func (f *RepoStoreListFunc) nextHook() func(context.Context, database.ReposListOptions) ([]*types.Repo, error)</a>

```
searchKey: discovery.RepoStoreListFunc.nextHook
tags: [private]
```

```Go
func (f *RepoStoreListFunc) nextHook() func(context.Context, database.ReposListOptions) ([]*types.Repo, error)
```

#### <a id="RepoStoreListFunc.appendCall" href="#RepoStoreListFunc.appendCall">func (f *RepoStoreListFunc) appendCall(r0 RepoStoreListFuncCall)</a>

```
searchKey: discovery.RepoStoreListFunc.appendCall
tags: [private]
```

```Go
func (f *RepoStoreListFunc) appendCall(r0 RepoStoreListFuncCall)
```

#### <a id="RepoStoreListFunc.History" href="#RepoStoreListFunc.History">func (f *RepoStoreListFunc) History() []RepoStoreListFuncCall</a>

```
searchKey: discovery.RepoStoreListFunc.History
```

```Go
func (f *RepoStoreListFunc) History() []RepoStoreListFuncCall
```

History returns a sequence of RepoStoreListFuncCall objects describing the invocations of this function. 

### <a id="RepoStoreListFuncCall" href="#RepoStoreListFuncCall">type RepoStoreListFuncCall struct</a>

```
searchKey: discovery.RepoStoreListFuncCall
```

```Go
type RepoStoreListFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 database.ReposListOptions
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []*types.Repo
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

RepoStoreListFuncCall is an object that describes an invocation of method List on an instance of MockRepoStore. 

#### <a id="RepoStoreListFuncCall.Args" href="#RepoStoreListFuncCall.Args">func (c RepoStoreListFuncCall) Args() []interface{}</a>

```
searchKey: discovery.RepoStoreListFuncCall.Args
```

```Go
func (c RepoStoreListFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="RepoStoreListFuncCall.Results" href="#RepoStoreListFuncCall.Results">func (c RepoStoreListFuncCall) Results() []interface{}</a>

```
searchKey: discovery.RepoStoreListFuncCall.Results
```

```Go
func (c RepoStoreListFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockSettingStore" href="#MockSettingStore">type MockSettingStore struct</a>

```
searchKey: discovery.MockSettingStore
```

```Go
type MockSettingStore struct {
	// GetLastestSchemaSettingsFunc is an instance of a mock function object
	// controlling the behavior of the method GetLastestSchemaSettings.
	GetLastestSchemaSettingsFunc *SettingStoreGetLastestSchemaSettingsFunc
	// GetLatestFunc is an instance of a mock function object controlling
	// the behavior of the method GetLatest.
	GetLatestFunc *SettingStoreGetLatestFunc
}
```

MockSettingStore is a mock implementation of the SettingStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/insights/discovery) used for unit testing. 

#### <a id="NewMockSettingStore" href="#NewMockSettingStore">func NewMockSettingStore() *MockSettingStore</a>

```
searchKey: discovery.NewMockSettingStore
```

```Go
func NewMockSettingStore() *MockSettingStore
```

NewMockSettingStore creates a new mock of the SettingStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockSettingStoreFrom" href="#NewMockSettingStoreFrom">func NewMockSettingStoreFrom(i SettingStore) *MockSettingStore</a>

```
searchKey: discovery.NewMockSettingStoreFrom
```

```Go
func NewMockSettingStoreFrom(i SettingStore) *MockSettingStore
```

NewMockSettingStoreFrom creates a new mock of the MockSettingStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockSettingStore.GetLastestSchemaSettings" href="#MockSettingStore.GetLastestSchemaSettings">func (m *MockSettingStore) GetLastestSchemaSettings(v0 context.Context, v1 api.SettingsSubject) (*schema.Settings, error)</a>

```
searchKey: discovery.MockSettingStore.GetLastestSchemaSettings
```

```Go
func (m *MockSettingStore) GetLastestSchemaSettings(v0 context.Context, v1 api.SettingsSubject) (*schema.Settings, error)
```

GetLastestSchemaSettings delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockSettingStore.GetLatest" href="#MockSettingStore.GetLatest">func (m *MockSettingStore) GetLatest(v0 context.Context, v1 api.SettingsSubject) (*api.Settings, error)</a>

```
searchKey: discovery.MockSettingStore.GetLatest
```

```Go
func (m *MockSettingStore) GetLatest(v0 context.Context, v1 api.SettingsSubject) (*api.Settings, error)
```

GetLatest delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="SettingStoreGetLastestSchemaSettingsFunc" href="#SettingStoreGetLastestSchemaSettingsFunc">type SettingStoreGetLastestSchemaSettingsFunc struct</a>

```
searchKey: discovery.SettingStoreGetLastestSchemaSettingsFunc
```

```Go
type SettingStoreGetLastestSchemaSettingsFunc struct {
	defaultHook func(context.Context, api.SettingsSubject) (*schema.Settings, error)
	hooks       []func(context.Context, api.SettingsSubject) (*schema.Settings, error)
	history     []SettingStoreGetLastestSchemaSettingsFuncCall
	mutex       sync.Mutex
}
```

SettingStoreGetLastestSchemaSettingsFunc describes the behavior when the GetLastestSchemaSettings method of the parent MockSettingStore instance is invoked. 

#### <a id="SettingStoreGetLastestSchemaSettingsFunc.SetDefaultHook" href="#SettingStoreGetLastestSchemaSettingsFunc.SetDefaultHook">func (f *SettingStoreGetLastestSchemaSettingsFunc) SetDefaultHook(hook func(context.Context, api.SettingsSubject) (*schema.Settings, error))</a>

```
searchKey: discovery.SettingStoreGetLastestSchemaSettingsFunc.SetDefaultHook
```

```Go
func (f *SettingStoreGetLastestSchemaSettingsFunc) SetDefaultHook(hook func(context.Context, api.SettingsSubject) (*schema.Settings, error))
```

SetDefaultHook sets function that is called when the GetLastestSchemaSettings method of the parent MockSettingStore instance is invoked and the hook queue is empty. 

#### <a id="SettingStoreGetLastestSchemaSettingsFunc.PushHook" href="#SettingStoreGetLastestSchemaSettingsFunc.PushHook">func (f *SettingStoreGetLastestSchemaSettingsFunc) PushHook(hook func(context.Context, api.SettingsSubject) (*schema.Settings, error))</a>

```
searchKey: discovery.SettingStoreGetLastestSchemaSettingsFunc.PushHook
```

```Go
func (f *SettingStoreGetLastestSchemaSettingsFunc) PushHook(hook func(context.Context, api.SettingsSubject) (*schema.Settings, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetLastestSchemaSettings method of the parent MockSettingStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="SettingStoreGetLastestSchemaSettingsFunc.SetDefaultReturn" href="#SettingStoreGetLastestSchemaSettingsFunc.SetDefaultReturn">func (f *SettingStoreGetLastestSchemaSettingsFunc) SetDefaultReturn(r0 *schema.Settings, r1 error)</a>

```
searchKey: discovery.SettingStoreGetLastestSchemaSettingsFunc.SetDefaultReturn
```

```Go
func (f *SettingStoreGetLastestSchemaSettingsFunc) SetDefaultReturn(r0 *schema.Settings, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="SettingStoreGetLastestSchemaSettingsFunc.PushReturn" href="#SettingStoreGetLastestSchemaSettingsFunc.PushReturn">func (f *SettingStoreGetLastestSchemaSettingsFunc) PushReturn(r0 *schema.Settings, r1 error)</a>

```
searchKey: discovery.SettingStoreGetLastestSchemaSettingsFunc.PushReturn
```

```Go
func (f *SettingStoreGetLastestSchemaSettingsFunc) PushReturn(r0 *schema.Settings, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="SettingStoreGetLastestSchemaSettingsFunc.nextHook" href="#SettingStoreGetLastestSchemaSettingsFunc.nextHook">func (f *SettingStoreGetLastestSchemaSettingsFunc) nextHook() func(context.Context, api.SettingsSubject) (*schema.Settings, error)</a>

```
searchKey: discovery.SettingStoreGetLastestSchemaSettingsFunc.nextHook
tags: [private]
```

```Go
func (f *SettingStoreGetLastestSchemaSettingsFunc) nextHook() func(context.Context, api.SettingsSubject) (*schema.Settings, error)
```

#### <a id="SettingStoreGetLastestSchemaSettingsFunc.appendCall" href="#SettingStoreGetLastestSchemaSettingsFunc.appendCall">func (f *SettingStoreGetLastestSchemaSettingsFunc) appendCall(r0 SettingStoreGetLastestSchemaSettingsFuncCall)</a>

```
searchKey: discovery.SettingStoreGetLastestSchemaSettingsFunc.appendCall
tags: [private]
```

```Go
func (f *SettingStoreGetLastestSchemaSettingsFunc) appendCall(r0 SettingStoreGetLastestSchemaSettingsFuncCall)
```

#### <a id="SettingStoreGetLastestSchemaSettingsFunc.History" href="#SettingStoreGetLastestSchemaSettingsFunc.History">func (f *SettingStoreGetLastestSchemaSettingsFunc) History() []SettingStoreGetLastestSchemaSettingsFuncCall</a>

```
searchKey: discovery.SettingStoreGetLastestSchemaSettingsFunc.History
```

```Go
func (f *SettingStoreGetLastestSchemaSettingsFunc) History() []SettingStoreGetLastestSchemaSettingsFuncCall
```

History returns a sequence of SettingStoreGetLastestSchemaSettingsFuncCall objects describing the invocations of this function. 

### <a id="SettingStoreGetLastestSchemaSettingsFuncCall" href="#SettingStoreGetLastestSchemaSettingsFuncCall">type SettingStoreGetLastestSchemaSettingsFuncCall struct</a>

```
searchKey: discovery.SettingStoreGetLastestSchemaSettingsFuncCall
```

```Go
type SettingStoreGetLastestSchemaSettingsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 api.SettingsSubject
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *schema.Settings
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

SettingStoreGetLastestSchemaSettingsFuncCall is an object that describes an invocation of method GetLastestSchemaSettings on an instance of MockSettingStore. 

#### <a id="SettingStoreGetLastestSchemaSettingsFuncCall.Args" href="#SettingStoreGetLastestSchemaSettingsFuncCall.Args">func (c SettingStoreGetLastestSchemaSettingsFuncCall) Args() []interface{}</a>

```
searchKey: discovery.SettingStoreGetLastestSchemaSettingsFuncCall.Args
```

```Go
func (c SettingStoreGetLastestSchemaSettingsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="SettingStoreGetLastestSchemaSettingsFuncCall.Results" href="#SettingStoreGetLastestSchemaSettingsFuncCall.Results">func (c SettingStoreGetLastestSchemaSettingsFuncCall) Results() []interface{}</a>

```
searchKey: discovery.SettingStoreGetLastestSchemaSettingsFuncCall.Results
```

```Go
func (c SettingStoreGetLastestSchemaSettingsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="SettingStoreGetLatestFunc" href="#SettingStoreGetLatestFunc">type SettingStoreGetLatestFunc struct</a>

```
searchKey: discovery.SettingStoreGetLatestFunc
```

```Go
type SettingStoreGetLatestFunc struct {
	defaultHook func(context.Context, api.SettingsSubject) (*api.Settings, error)
	hooks       []func(context.Context, api.SettingsSubject) (*api.Settings, error)
	history     []SettingStoreGetLatestFuncCall
	mutex       sync.Mutex
}
```

SettingStoreGetLatestFunc describes the behavior when the GetLatest method of the parent MockSettingStore instance is invoked. 

#### <a id="SettingStoreGetLatestFunc.SetDefaultHook" href="#SettingStoreGetLatestFunc.SetDefaultHook">func (f *SettingStoreGetLatestFunc) SetDefaultHook(hook func(context.Context, api.SettingsSubject) (*api.Settings, error))</a>

```
searchKey: discovery.SettingStoreGetLatestFunc.SetDefaultHook
```

```Go
func (f *SettingStoreGetLatestFunc) SetDefaultHook(hook func(context.Context, api.SettingsSubject) (*api.Settings, error))
```

SetDefaultHook sets function that is called when the GetLatest method of the parent MockSettingStore instance is invoked and the hook queue is empty. 

#### <a id="SettingStoreGetLatestFunc.PushHook" href="#SettingStoreGetLatestFunc.PushHook">func (f *SettingStoreGetLatestFunc) PushHook(hook func(context.Context, api.SettingsSubject) (*api.Settings, error))</a>

```
searchKey: discovery.SettingStoreGetLatestFunc.PushHook
```

```Go
func (f *SettingStoreGetLatestFunc) PushHook(hook func(context.Context, api.SettingsSubject) (*api.Settings, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetLatest method of the parent MockSettingStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="SettingStoreGetLatestFunc.SetDefaultReturn" href="#SettingStoreGetLatestFunc.SetDefaultReturn">func (f *SettingStoreGetLatestFunc) SetDefaultReturn(r0 *api.Settings, r1 error)</a>

```
searchKey: discovery.SettingStoreGetLatestFunc.SetDefaultReturn
```

```Go
func (f *SettingStoreGetLatestFunc) SetDefaultReturn(r0 *api.Settings, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="SettingStoreGetLatestFunc.PushReturn" href="#SettingStoreGetLatestFunc.PushReturn">func (f *SettingStoreGetLatestFunc) PushReturn(r0 *api.Settings, r1 error)</a>

```
searchKey: discovery.SettingStoreGetLatestFunc.PushReturn
```

```Go
func (f *SettingStoreGetLatestFunc) PushReturn(r0 *api.Settings, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="SettingStoreGetLatestFunc.nextHook" href="#SettingStoreGetLatestFunc.nextHook">func (f *SettingStoreGetLatestFunc) nextHook() func(context.Context, api.SettingsSubject) (*api.Settings, error)</a>

```
searchKey: discovery.SettingStoreGetLatestFunc.nextHook
tags: [private]
```

```Go
func (f *SettingStoreGetLatestFunc) nextHook() func(context.Context, api.SettingsSubject) (*api.Settings, error)
```

#### <a id="SettingStoreGetLatestFunc.appendCall" href="#SettingStoreGetLatestFunc.appendCall">func (f *SettingStoreGetLatestFunc) appendCall(r0 SettingStoreGetLatestFuncCall)</a>

```
searchKey: discovery.SettingStoreGetLatestFunc.appendCall
tags: [private]
```

```Go
func (f *SettingStoreGetLatestFunc) appendCall(r0 SettingStoreGetLatestFuncCall)
```

#### <a id="SettingStoreGetLatestFunc.History" href="#SettingStoreGetLatestFunc.History">func (f *SettingStoreGetLatestFunc) History() []SettingStoreGetLatestFuncCall</a>

```
searchKey: discovery.SettingStoreGetLatestFunc.History
```

```Go
func (f *SettingStoreGetLatestFunc) History() []SettingStoreGetLatestFuncCall
```

History returns a sequence of SettingStoreGetLatestFuncCall objects describing the invocations of this function. 

### <a id="SettingStoreGetLatestFuncCall" href="#SettingStoreGetLatestFuncCall">type SettingStoreGetLatestFuncCall struct</a>

```
searchKey: discovery.SettingStoreGetLatestFuncCall
```

```Go
type SettingStoreGetLatestFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 api.SettingsSubject
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *api.Settings
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

SettingStoreGetLatestFuncCall is an object that describes an invocation of method GetLatest on an instance of MockSettingStore. 

#### <a id="SettingStoreGetLatestFuncCall.Args" href="#SettingStoreGetLatestFuncCall.Args">func (c SettingStoreGetLatestFuncCall) Args() []interface{}</a>

```
searchKey: discovery.SettingStoreGetLatestFuncCall.Args
```

```Go
func (c SettingStoreGetLatestFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="SettingStoreGetLatestFuncCall.Results" href="#SettingStoreGetLatestFuncCall.Results">func (c SettingStoreGetLatestFuncCall) Results() []interface{}</a>

```
searchKey: discovery.SettingStoreGetLatestFuncCall.Results
```

```Go
func (c SettingStoreGetLatestFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Discover" href="#Discover">func Discover(ctx context.Context, settingStore SettingStore) ([]*schema.Insight, error)</a>

```
searchKey: discovery.Discover
```

```Go
func Discover(ctx context.Context, settingStore SettingStore) ([]*schema.Insight, error)
```

Discover uses the given settings store to look for insights in the global user settings. 

TODO(slimsag): future: include user/org settings and consider security implications of doing so. In the future, this will be expanded to also include insights from users/orgs. 

### <a id="parseUserSettings" href="#parseUserSettings">func parseUserSettings(settings *api.Settings) (*schema.Settings, error)</a>

```
searchKey: discovery.parseUserSettings
tags: [private]
```

```Go
func parseUserSettings(settings *api.Settings) (*schema.Settings, error)
```

### <a id="EncodeSeriesID" href="#EncodeSeriesID">func EncodeSeriesID(series *schema.InsightSeries) (string, error)</a>

```
searchKey: discovery.EncodeSeriesID
```

```Go
func EncodeSeriesID(series *schema.InsightSeries) (string, error)
```

EncodeSeriesID hashes the hashes the input series to return a string which uniquely identifies the data series being described. It is possible the same series is described in multiple user's settings, e.g. if multiple users declare an insight with the same search query - in which case we have an opportunity to deduplicate them. 

Note that since the series ID hash is stored in the database, it must remain stable or else past data will not be queryable. 

### <a id="sha256String" href="#sha256String">func sha256String(s string) string</a>

```
searchKey: discovery.sha256String
tags: [private]
```

```Go
func sha256String(s string) string
```

### <a id="TestAllReposIterator" href="#TestAllReposIterator">func TestAllReposIterator(t *testing.T)</a>

```
searchKey: discovery.TestAllReposIterator
tags: [private]
```

```Go
func TestAllReposIterator(t *testing.T)
```

TestAllReposIterator tests the AllReposIterator in the common use cases. 

### <a id="TestAllReposIterator_DotCom" href="#TestAllReposIterator_DotCom">func TestAllReposIterator_DotCom(t *testing.T)</a>

```
searchKey: discovery.TestAllReposIterator_DotCom
tags: [private]
```

```Go
func TestAllReposIterator_DotCom(t *testing.T)
```

TestAllReposIterator tests the AllReposIterator for Sourcegraph.com mode. Unfortunately, that mode is different because the repos list comes from a completely different table/store (this is technical debt for Sourcegraph.com, there is no reason the same store could not interface with both tables and handle pagination etc. the same way. The Search codebase also must deal with this cruft.) 

### <a id="TestDiscover" href="#TestDiscover">func TestDiscover(t *testing.T)</a>

```
searchKey: discovery.TestDiscover
tags: [private]
```

```Go
func TestDiscover(t *testing.T)
```

### <a id="Test_parseUserSettings" href="#Test_parseUserSettings">func Test_parseUserSettings(t *testing.T)</a>

```
searchKey: discovery.Test_parseUserSettings
tags: [private]
```

```Go
func Test_parseUserSettings(t *testing.T)
```

### <a id="TestEncodeSeriesID" href="#TestEncodeSeriesID">func TestEncodeSeriesID(t *testing.T)</a>

```
searchKey: discovery.TestEncodeSeriesID
tags: [private]
```

```Go
func TestEncodeSeriesID(t *testing.T)
```

