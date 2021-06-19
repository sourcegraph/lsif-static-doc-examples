# Package compression

## Index

* [Constants](#const)
    * [const getCommitsInRangeStr](#getCommitsInRangeStr)
    * [const insertCommitIndexStr](#insertCommitIndexStr)
    * [const getCommitIndexMetadataStr](#getCommitIndexMetadataStr)
    * [const upsertCommitIndexMetadataStampStr](#upsertCommitIndexMetadataStampStr)
* [Types](#type)
    * [type DBCommitStore struct](#DBCommitStore)
        * [func NewCommitStore(db dbutil.DB) *DBCommitStore](#NewCommitStore)
        * [func (c *DBCommitStore) With(other basestore.ShareableStore) *DBCommitStore](#DBCommitStore.With)
        * [func (c *DBCommitStore) Transact(ctx context.Context) (*DBCommitStore, error)](#DBCommitStore.Transact)
        * [func (c *DBCommitStore) Save(ctx context.Context, id api.RepoID, commit *git.Commit) error](#DBCommitStore.Save)
        * [func (c *DBCommitStore) InsertCommits(ctx context.Context, id api.RepoID, commits []*git.Commit) (err error)](#DBCommitStore.InsertCommits)
        * [func (c *DBCommitStore) Get(ctx context.Context, id api.RepoID, start time.Time, end time.Time) (_ []CommitStamp, err error)](#DBCommitStore.Get)
        * [func (c *DBCommitStore) GetMetadata(ctx context.Context, id api.RepoID) (CommitIndexMetadata, error)](#DBCommitStore.GetMetadata)
        * [func (c *DBCommitStore) UpsertMetadataStamp(ctx context.Context, id api.RepoID) (CommitIndexMetadata, error)](#DBCommitStore.UpsertMetadataStamp)
    * [type CommitStore interface](#CommitStore)
    * [type CommitStamp struct](#CommitStamp)
    * [type CommitIndexMetadata struct](#CommitIndexMetadata)
        * [func getMetadata(ctx context.Context, id api.RepoID, store CommitStore) (CommitIndexMetadata, error)](#getMetadata)
    * [type MockCommitStore struct](#MockCommitStore)
        * [func NewMockCommitStore() *MockCommitStore](#NewMockCommitStore)
        * [func NewMockCommitStoreFrom(i CommitStore) *MockCommitStore](#NewMockCommitStoreFrom)
        * [func (m *MockCommitStore) Get(v0 context.Context, v1 api.RepoID, v2 time.Time, v3 time.Time) ([]CommitStamp, error)](#MockCommitStore.Get)
        * [func (m *MockCommitStore) GetMetadata(v0 context.Context, v1 api.RepoID) (CommitIndexMetadata, error)](#MockCommitStore.GetMetadata)
        * [func (m *MockCommitStore) InsertCommits(v0 context.Context, v1 api.RepoID, v2 []*git.Commit) error](#MockCommitStore.InsertCommits)
        * [func (m *MockCommitStore) Save(v0 context.Context, v1 api.RepoID, v2 *git.Commit) error](#MockCommitStore.Save)
        * [func (m *MockCommitStore) UpsertMetadataStamp(v0 context.Context, v1 api.RepoID) (CommitIndexMetadata, error)](#MockCommitStore.UpsertMetadataStamp)
    * [type CommitStoreGetFunc struct](#CommitStoreGetFunc)
        * [func (f *CommitStoreGetFunc) SetDefaultHook(hook func(context.Context, api.RepoID, time.Time, time.Time) ([]CommitStamp, error))](#CommitStoreGetFunc.SetDefaultHook)
        * [func (f *CommitStoreGetFunc) PushHook(hook func(context.Context, api.RepoID, time.Time, time.Time) ([]CommitStamp, error))](#CommitStoreGetFunc.PushHook)
        * [func (f *CommitStoreGetFunc) SetDefaultReturn(r0 []CommitStamp, r1 error)](#CommitStoreGetFunc.SetDefaultReturn)
        * [func (f *CommitStoreGetFunc) PushReturn(r0 []CommitStamp, r1 error)](#CommitStoreGetFunc.PushReturn)
        * [func (f *CommitStoreGetFunc) nextHook() func(context.Context, api.RepoID, time.Time, time.Time) ([]CommitStamp, error)](#CommitStoreGetFunc.nextHook)
        * [func (f *CommitStoreGetFunc) appendCall(r0 CommitStoreGetFuncCall)](#CommitStoreGetFunc.appendCall)
        * [func (f *CommitStoreGetFunc) History() []CommitStoreGetFuncCall](#CommitStoreGetFunc.History)
    * [type CommitStoreGetFuncCall struct](#CommitStoreGetFuncCall)
        * [func (c CommitStoreGetFuncCall) Args() []interface{}](#CommitStoreGetFuncCall.Args)
        * [func (c CommitStoreGetFuncCall) Results() []interface{}](#CommitStoreGetFuncCall.Results)
    * [type CommitStoreGetMetadataFunc struct](#CommitStoreGetMetadataFunc)
        * [func (f *CommitStoreGetMetadataFunc) SetDefaultHook(hook func(context.Context, api.RepoID) (CommitIndexMetadata, error))](#CommitStoreGetMetadataFunc.SetDefaultHook)
        * [func (f *CommitStoreGetMetadataFunc) PushHook(hook func(context.Context, api.RepoID) (CommitIndexMetadata, error))](#CommitStoreGetMetadataFunc.PushHook)
        * [func (f *CommitStoreGetMetadataFunc) SetDefaultReturn(r0 CommitIndexMetadata, r1 error)](#CommitStoreGetMetadataFunc.SetDefaultReturn)
        * [func (f *CommitStoreGetMetadataFunc) PushReturn(r0 CommitIndexMetadata, r1 error)](#CommitStoreGetMetadataFunc.PushReturn)
        * [func (f *CommitStoreGetMetadataFunc) nextHook() func(context.Context, api.RepoID) (CommitIndexMetadata, error)](#CommitStoreGetMetadataFunc.nextHook)
        * [func (f *CommitStoreGetMetadataFunc) appendCall(r0 CommitStoreGetMetadataFuncCall)](#CommitStoreGetMetadataFunc.appendCall)
        * [func (f *CommitStoreGetMetadataFunc) History() []CommitStoreGetMetadataFuncCall](#CommitStoreGetMetadataFunc.History)
    * [type CommitStoreGetMetadataFuncCall struct](#CommitStoreGetMetadataFuncCall)
        * [func (c CommitStoreGetMetadataFuncCall) Args() []interface{}](#CommitStoreGetMetadataFuncCall.Args)
        * [func (c CommitStoreGetMetadataFuncCall) Results() []interface{}](#CommitStoreGetMetadataFuncCall.Results)
    * [type CommitStoreInsertCommitsFunc struct](#CommitStoreInsertCommitsFunc)
        * [func (f *CommitStoreInsertCommitsFunc) SetDefaultHook(hook func(context.Context, api.RepoID, []*git.Commit) error)](#CommitStoreInsertCommitsFunc.SetDefaultHook)
        * [func (f *CommitStoreInsertCommitsFunc) PushHook(hook func(context.Context, api.RepoID, []*git.Commit) error)](#CommitStoreInsertCommitsFunc.PushHook)
        * [func (f *CommitStoreInsertCommitsFunc) SetDefaultReturn(r0 error)](#CommitStoreInsertCommitsFunc.SetDefaultReturn)
        * [func (f *CommitStoreInsertCommitsFunc) PushReturn(r0 error)](#CommitStoreInsertCommitsFunc.PushReturn)
        * [func (f *CommitStoreInsertCommitsFunc) nextHook() func(context.Context, api.RepoID, []*git.Commit) error](#CommitStoreInsertCommitsFunc.nextHook)
        * [func (f *CommitStoreInsertCommitsFunc) appendCall(r0 CommitStoreInsertCommitsFuncCall)](#CommitStoreInsertCommitsFunc.appendCall)
        * [func (f *CommitStoreInsertCommitsFunc) History() []CommitStoreInsertCommitsFuncCall](#CommitStoreInsertCommitsFunc.History)
    * [type CommitStoreInsertCommitsFuncCall struct](#CommitStoreInsertCommitsFuncCall)
        * [func (c CommitStoreInsertCommitsFuncCall) Args() []interface{}](#CommitStoreInsertCommitsFuncCall.Args)
        * [func (c CommitStoreInsertCommitsFuncCall) Results() []interface{}](#CommitStoreInsertCommitsFuncCall.Results)
    * [type CommitStoreSaveFunc struct](#CommitStoreSaveFunc)
        * [func (f *CommitStoreSaveFunc) SetDefaultHook(hook func(context.Context, api.RepoID, *git.Commit) error)](#CommitStoreSaveFunc.SetDefaultHook)
        * [func (f *CommitStoreSaveFunc) PushHook(hook func(context.Context, api.RepoID, *git.Commit) error)](#CommitStoreSaveFunc.PushHook)
        * [func (f *CommitStoreSaveFunc) SetDefaultReturn(r0 error)](#CommitStoreSaveFunc.SetDefaultReturn)
        * [func (f *CommitStoreSaveFunc) PushReturn(r0 error)](#CommitStoreSaveFunc.PushReturn)
        * [func (f *CommitStoreSaveFunc) nextHook() func(context.Context, api.RepoID, *git.Commit) error](#CommitStoreSaveFunc.nextHook)
        * [func (f *CommitStoreSaveFunc) appendCall(r0 CommitStoreSaveFuncCall)](#CommitStoreSaveFunc.appendCall)
        * [func (f *CommitStoreSaveFunc) History() []CommitStoreSaveFuncCall](#CommitStoreSaveFunc.History)
    * [type CommitStoreSaveFuncCall struct](#CommitStoreSaveFuncCall)
        * [func (c CommitStoreSaveFuncCall) Args() []interface{}](#CommitStoreSaveFuncCall.Args)
        * [func (c CommitStoreSaveFuncCall) Results() []interface{}](#CommitStoreSaveFuncCall.Results)
    * [type CommitStoreUpsertMetadataStampFunc struct](#CommitStoreUpsertMetadataStampFunc)
        * [func (f *CommitStoreUpsertMetadataStampFunc) SetDefaultHook(hook func(context.Context, api.RepoID) (CommitIndexMetadata, error))](#CommitStoreUpsertMetadataStampFunc.SetDefaultHook)
        * [func (f *CommitStoreUpsertMetadataStampFunc) PushHook(hook func(context.Context, api.RepoID) (CommitIndexMetadata, error))](#CommitStoreUpsertMetadataStampFunc.PushHook)
        * [func (f *CommitStoreUpsertMetadataStampFunc) SetDefaultReturn(r0 CommitIndexMetadata, r1 error)](#CommitStoreUpsertMetadataStampFunc.SetDefaultReturn)
        * [func (f *CommitStoreUpsertMetadataStampFunc) PushReturn(r0 CommitIndexMetadata, r1 error)](#CommitStoreUpsertMetadataStampFunc.PushReturn)
        * [func (f *CommitStoreUpsertMetadataStampFunc) nextHook() func(context.Context, api.RepoID) (CommitIndexMetadata, error)](#CommitStoreUpsertMetadataStampFunc.nextHook)
        * [func (f *CommitStoreUpsertMetadataStampFunc) appendCall(r0 CommitStoreUpsertMetadataStampFuncCall)](#CommitStoreUpsertMetadataStampFunc.appendCall)
        * [func (f *CommitStoreUpsertMetadataStampFunc) History() []CommitStoreUpsertMetadataStampFuncCall](#CommitStoreUpsertMetadataStampFunc.History)
    * [type CommitStoreUpsertMetadataStampFuncCall struct](#CommitStoreUpsertMetadataStampFuncCall)
        * [func (c CommitStoreUpsertMetadataStampFuncCall) Args() []interface{}](#CommitStoreUpsertMetadataStampFuncCall.Args)
        * [func (c CommitStoreUpsertMetadataStampFuncCall) Results() []interface{}](#CommitStoreUpsertMetadataStampFuncCall.Results)
    * [type RepoStore interface](#RepoStore)
    * [type CommitIndexer struct](#CommitIndexer)
        * [func NewCommitIndexer(background context.Context, base dbutil.DB, insights dbutil.DB) *CommitIndexer](#NewCommitIndexer)
        * [func (i *CommitIndexer) Handler(ctx context.Context) goroutine.BackgroundRoutine](#CommitIndexer.Handler)
        * [func (i *CommitIndexer) indexAll(ctx context.Context) error](#CommitIndexer.indexAll)
        * [func (i *CommitIndexer) indexRepository(name string) error](#CommitIndexer.indexRepository)
        * [func (i *CommitIndexer) index(name string) error](#CommitIndexer.index)
* [Functions](#func)
    * [func NewCommitIndexerWorker(ctx context.Context, base dbutil.DB, insights dbutil.DB) goroutine.BackgroundRoutine](#NewCommitIndexerWorker)
    * [func getCommits(ctx context.Context, name api.RepoName, after time.Time) ([]*git.Commit, error)](#getCommits)
    * [func max(a, b time.Time) time.Time](#max)
    * [func TestCommitIndexer_indexAll(t *testing.T)](#TestCommitIndexer_indexAll)
    * [func Test_getMetadata_InsertNewRecord(t *testing.T)](#Test_getMetadata_InsertNewRecord)
    * [func Test_getMetadata_NoInsertRequired(t *testing.T)](#Test_getMetadata_NoInsertRequired)
    * [func mockIterator(repos []string) func(ctx context.Context, each func(repoName string) error) error](#mockIterator)
    * [func commit(ref string, commitTime string) *git.Commit](#commit)
    * [func mockCommits(commits map[string][]*git.Commit) func(ctx context.Context, name api.RepoName, after time.Time) ([]*git.Commit, error)](#mockCommits)
    * [func mockIds(ids map[string]int) func(ctx context.Context, name api.RepoName) (*types.Repo, error)](#mockIds)


## <a id="const" href="#const">Constants</a>

### <a id="getCommitsInRangeStr" href="#getCommitsInRangeStr">const getCommitsInRangeStr</a>

```
searchKey: compression.getCommitsInRangeStr
```

```Go
const getCommitsInRangeStr = ...
```

### <a id="insertCommitIndexStr" href="#insertCommitIndexStr">const insertCommitIndexStr</a>

```
searchKey: compression.insertCommitIndexStr
```

```Go
const insertCommitIndexStr = ...
```

### <a id="getCommitIndexMetadataStr" href="#getCommitIndexMetadataStr">const getCommitIndexMetadataStr</a>

```
searchKey: compression.getCommitIndexMetadataStr
```

```Go
const getCommitIndexMetadataStr = ...
```

### <a id="upsertCommitIndexMetadataStampStr" href="#upsertCommitIndexMetadataStampStr">const upsertCommitIndexMetadataStampStr</a>

```
searchKey: compression.upsertCommitIndexMetadataStampStr
```

```Go
const upsertCommitIndexMetadataStampStr = ...
```

## <a id="type" href="#type">Types</a>

### <a id="DBCommitStore" href="#DBCommitStore">type DBCommitStore struct</a>

```
searchKey: compression.DBCommitStore
tags: [exported]
```

```Go
type DBCommitStore struct {
	*basestore.Store
}
```

#### <a id="NewCommitStore" href="#NewCommitStore">func NewCommitStore(db dbutil.DB) *DBCommitStore</a>

```
searchKey: compression.NewCommitStore
tags: [exported]
```

```Go
func NewCommitStore(db dbutil.DB) *DBCommitStore
```

#### <a id="DBCommitStore.With" href="#DBCommitStore.With">func (c *DBCommitStore) With(other basestore.ShareableStore) *DBCommitStore</a>

```
searchKey: compression.DBCommitStore.With
tags: [exported]
```

```Go
func (c *DBCommitStore) With(other basestore.ShareableStore) *DBCommitStore
```

#### <a id="DBCommitStore.Transact" href="#DBCommitStore.Transact">func (c *DBCommitStore) Transact(ctx context.Context) (*DBCommitStore, error)</a>

```
searchKey: compression.DBCommitStore.Transact
tags: [exported]
```

```Go
func (c *DBCommitStore) Transact(ctx context.Context) (*DBCommitStore, error)
```

#### <a id="DBCommitStore.Save" href="#DBCommitStore.Save">func (c *DBCommitStore) Save(ctx context.Context, id api.RepoID, commit *git.Commit) error</a>

```
searchKey: compression.DBCommitStore.Save
tags: [exported]
```

```Go
func (c *DBCommitStore) Save(ctx context.Context, id api.RepoID, commit *git.Commit) error
```

#### <a id="DBCommitStore.InsertCommits" href="#DBCommitStore.InsertCommits">func (c *DBCommitStore) InsertCommits(ctx context.Context, id api.RepoID, commits []*git.Commit) (err error)</a>

```
searchKey: compression.DBCommitStore.InsertCommits
tags: [exported]
```

```Go
func (c *DBCommitStore) InsertCommits(ctx context.Context, id api.RepoID, commits []*git.Commit) (err error)
```

#### <a id="DBCommitStore.Get" href="#DBCommitStore.Get">func (c *DBCommitStore) Get(ctx context.Context, id api.RepoID, start time.Time, end time.Time) (_ []CommitStamp, err error)</a>

```
searchKey: compression.DBCommitStore.Get
tags: [exported]
```

```Go
func (c *DBCommitStore) Get(ctx context.Context, id api.RepoID, start time.Time, end time.Time) (_ []CommitStamp, err error)
```

Get Fetch all commits that occur for a specific repository and fall in a specific time range. The time range is start inclusive and end exclusive [start, end) 

#### <a id="DBCommitStore.GetMetadata" href="#DBCommitStore.GetMetadata">func (c *DBCommitStore) GetMetadata(ctx context.Context, id api.RepoID) (CommitIndexMetadata, error)</a>

```
searchKey: compression.DBCommitStore.GetMetadata
tags: [exported]
```

```Go
func (c *DBCommitStore) GetMetadata(ctx context.Context, id api.RepoID) (CommitIndexMetadata, error)
```

GetMetadata Returns commit index metadata for a given repository 

#### <a id="DBCommitStore.UpsertMetadataStamp" href="#DBCommitStore.UpsertMetadataStamp">func (c *DBCommitStore) UpsertMetadataStamp(ctx context.Context, id api.RepoID) (CommitIndexMetadata, error)</a>

```
searchKey: compression.DBCommitStore.UpsertMetadataStamp
tags: [exported]
```

```Go
func (c *DBCommitStore) UpsertMetadataStamp(ctx context.Context, id api.RepoID) (CommitIndexMetadata, error)
```

UpsertMetadataStamp inserts (or updates, if the row already exists) the index metadata timestamp for a given repository 

### <a id="CommitStore" href="#CommitStore">type CommitStore interface</a>

```
searchKey: compression.CommitStore
tags: [exported]
```

```Go
type CommitStore interface {
	Save(ctx context.Context, id api.RepoID, commit *git.Commit) error
	Get(ctx context.Context, id api.RepoID, start time.Time, end time.Time) ([]CommitStamp, error)
	GetMetadata(ctx context.Context, id api.RepoID) (CommitIndexMetadata, error)
	UpsertMetadataStamp(ctx context.Context, id api.RepoID) (CommitIndexMetadata, error)
	InsertCommits(ctx context.Context, id api.RepoID, commits []*git.Commit) error
}
```

### <a id="CommitStamp" href="#CommitStamp">type CommitStamp struct</a>

```
searchKey: compression.CommitStamp
tags: [exported]
```

```Go
type CommitStamp struct {
	RepoID      int
	Commit      dbutil.CommitBytea
	CommittedAt time.Time
}
```

### <a id="CommitIndexMetadata" href="#CommitIndexMetadata">type CommitIndexMetadata struct</a>

```
searchKey: compression.CommitIndexMetadata
tags: [exported]
```

```Go
type CommitIndexMetadata struct {
	RepoId        int
	Enabled       bool
	LastIndexedAt time.Time
}
```

#### <a id="getMetadata" href="#getMetadata">func getMetadata(ctx context.Context, id api.RepoID, store CommitStore) (CommitIndexMetadata, error)</a>

```
searchKey: compression.getMetadata
```

```Go
func getMetadata(ctx context.Context, id api.RepoID, store CommitStore) (CommitIndexMetadata, error)
```

getMetadata gets the index metadata for a repository. The metadata will be generated if it doesn't already exist, such as in the case of a newly installed repository. 

### <a id="MockCommitStore" href="#MockCommitStore">type MockCommitStore struct</a>

```
searchKey: compression.MockCommitStore
tags: [exported]
```

```Go
type MockCommitStore struct {
	// GetFunc is an instance of a mock function object controlling the
	// behavior of the method Get.
	GetFunc *CommitStoreGetFunc
	// GetMetadataFunc is an instance of a mock function object controlling
	// the behavior of the method GetMetadata.
	GetMetadataFunc *CommitStoreGetMetadataFunc
	// InsertCommitsFunc is an instance of a mock function object
	// controlling the behavior of the method InsertCommits.
	InsertCommitsFunc *CommitStoreInsertCommitsFunc
	// SaveFunc is an instance of a mock function object controlling the
	// behavior of the method Save.
	SaveFunc *CommitStoreSaveFunc
	// UpsertMetadataStampFunc is an instance of a mock function object
	// controlling the behavior of the method UpsertMetadataStamp.
	UpsertMetadataStampFunc *CommitStoreUpsertMetadataStampFunc
}
```

MockCommitStore is a mock implementation of the CommitStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/insights/compression) used for unit testing. 

#### <a id="NewMockCommitStore" href="#NewMockCommitStore">func NewMockCommitStore() *MockCommitStore</a>

```
searchKey: compression.NewMockCommitStore
tags: [exported]
```

```Go
func NewMockCommitStore() *MockCommitStore
```

NewMockCommitStore creates a new mock of the CommitStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockCommitStoreFrom" href="#NewMockCommitStoreFrom">func NewMockCommitStoreFrom(i CommitStore) *MockCommitStore</a>

```
searchKey: compression.NewMockCommitStoreFrom
tags: [exported]
```

```Go
func NewMockCommitStoreFrom(i CommitStore) *MockCommitStore
```

NewMockCommitStoreFrom creates a new mock of the MockCommitStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockCommitStore.Get" href="#MockCommitStore.Get">func (m *MockCommitStore) Get(v0 context.Context, v1 api.RepoID, v2 time.Time, v3 time.Time) ([]CommitStamp, error)</a>

```
searchKey: compression.MockCommitStore.Get
tags: [exported]
```

```Go
func (m *MockCommitStore) Get(v0 context.Context, v1 api.RepoID, v2 time.Time, v3 time.Time) ([]CommitStamp, error)
```

Get delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockCommitStore.GetMetadata" href="#MockCommitStore.GetMetadata">func (m *MockCommitStore) GetMetadata(v0 context.Context, v1 api.RepoID) (CommitIndexMetadata, error)</a>

```
searchKey: compression.MockCommitStore.GetMetadata
tags: [exported]
```

```Go
func (m *MockCommitStore) GetMetadata(v0 context.Context, v1 api.RepoID) (CommitIndexMetadata, error)
```

GetMetadata delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockCommitStore.InsertCommits" href="#MockCommitStore.InsertCommits">func (m *MockCommitStore) InsertCommits(v0 context.Context, v1 api.RepoID, v2 []*git.Commit) error</a>

```
searchKey: compression.MockCommitStore.InsertCommits
tags: [exported]
```

```Go
func (m *MockCommitStore) InsertCommits(v0 context.Context, v1 api.RepoID, v2 []*git.Commit) error
```

InsertCommits delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockCommitStore.Save" href="#MockCommitStore.Save">func (m *MockCommitStore) Save(v0 context.Context, v1 api.RepoID, v2 *git.Commit) error</a>

```
searchKey: compression.MockCommitStore.Save
tags: [exported]
```

```Go
func (m *MockCommitStore) Save(v0 context.Context, v1 api.RepoID, v2 *git.Commit) error
```

Save delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockCommitStore.UpsertMetadataStamp" href="#MockCommitStore.UpsertMetadataStamp">func (m *MockCommitStore) UpsertMetadataStamp(v0 context.Context, v1 api.RepoID) (CommitIndexMetadata, error)</a>

```
searchKey: compression.MockCommitStore.UpsertMetadataStamp
tags: [exported]
```

```Go
func (m *MockCommitStore) UpsertMetadataStamp(v0 context.Context, v1 api.RepoID) (CommitIndexMetadata, error)
```

UpsertMetadataStamp delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="CommitStoreGetFunc" href="#CommitStoreGetFunc">type CommitStoreGetFunc struct</a>

```
searchKey: compression.CommitStoreGetFunc
tags: [exported]
```

```Go
type CommitStoreGetFunc struct {
	defaultHook func(context.Context, api.RepoID, time.Time, time.Time) ([]CommitStamp, error)
	hooks       []func(context.Context, api.RepoID, time.Time, time.Time) ([]CommitStamp, error)
	history     []CommitStoreGetFuncCall
	mutex       sync.Mutex
}
```

CommitStoreGetFunc describes the behavior when the Get method of the parent MockCommitStore instance is invoked. 

#### <a id="CommitStoreGetFunc.SetDefaultHook" href="#CommitStoreGetFunc.SetDefaultHook">func (f *CommitStoreGetFunc) SetDefaultHook(hook func(context.Context, api.RepoID, time.Time, time.Time) ([]CommitStamp, error))</a>

```
searchKey: compression.CommitStoreGetFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *CommitStoreGetFunc) SetDefaultHook(hook func(context.Context, api.RepoID, time.Time, time.Time) ([]CommitStamp, error))
```

SetDefaultHook sets function that is called when the Get method of the parent MockCommitStore instance is invoked and the hook queue is empty. 

#### <a id="CommitStoreGetFunc.PushHook" href="#CommitStoreGetFunc.PushHook">func (f *CommitStoreGetFunc) PushHook(hook func(context.Context, api.RepoID, time.Time, time.Time) ([]CommitStamp, error))</a>

```
searchKey: compression.CommitStoreGetFunc.PushHook
tags: [exported]
```

```Go
func (f *CommitStoreGetFunc) PushHook(hook func(context.Context, api.RepoID, time.Time, time.Time) ([]CommitStamp, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Get method of the parent MockCommitStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="CommitStoreGetFunc.SetDefaultReturn" href="#CommitStoreGetFunc.SetDefaultReturn">func (f *CommitStoreGetFunc) SetDefaultReturn(r0 []CommitStamp, r1 error)</a>

```
searchKey: compression.CommitStoreGetFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *CommitStoreGetFunc) SetDefaultReturn(r0 []CommitStamp, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="CommitStoreGetFunc.PushReturn" href="#CommitStoreGetFunc.PushReturn">func (f *CommitStoreGetFunc) PushReturn(r0 []CommitStamp, r1 error)</a>

```
searchKey: compression.CommitStoreGetFunc.PushReturn
tags: [exported]
```

```Go
func (f *CommitStoreGetFunc) PushReturn(r0 []CommitStamp, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="CommitStoreGetFunc.nextHook" href="#CommitStoreGetFunc.nextHook">func (f *CommitStoreGetFunc) nextHook() func(context.Context, api.RepoID, time.Time, time.Time) ([]CommitStamp, error)</a>

```
searchKey: compression.CommitStoreGetFunc.nextHook
```

```Go
func (f *CommitStoreGetFunc) nextHook() func(context.Context, api.RepoID, time.Time, time.Time) ([]CommitStamp, error)
```

#### <a id="CommitStoreGetFunc.appendCall" href="#CommitStoreGetFunc.appendCall">func (f *CommitStoreGetFunc) appendCall(r0 CommitStoreGetFuncCall)</a>

```
searchKey: compression.CommitStoreGetFunc.appendCall
```

```Go
func (f *CommitStoreGetFunc) appendCall(r0 CommitStoreGetFuncCall)
```

#### <a id="CommitStoreGetFunc.History" href="#CommitStoreGetFunc.History">func (f *CommitStoreGetFunc) History() []CommitStoreGetFuncCall</a>

```
searchKey: compression.CommitStoreGetFunc.History
tags: [exported]
```

```Go
func (f *CommitStoreGetFunc) History() []CommitStoreGetFuncCall
```

History returns a sequence of CommitStoreGetFuncCall objects describing the invocations of this function. 

### <a id="CommitStoreGetFuncCall" href="#CommitStoreGetFuncCall">type CommitStoreGetFuncCall struct</a>

```
searchKey: compression.CommitStoreGetFuncCall
tags: [exported]
```

```Go
type CommitStoreGetFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 api.RepoID
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 time.Time
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []CommitStamp
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

CommitStoreGetFuncCall is an object that describes an invocation of method Get on an instance of MockCommitStore. 

#### <a id="CommitStoreGetFuncCall.Args" href="#CommitStoreGetFuncCall.Args">func (c CommitStoreGetFuncCall) Args() []interface{}</a>

```
searchKey: compression.CommitStoreGetFuncCall.Args
tags: [exported]
```

```Go
func (c CommitStoreGetFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="CommitStoreGetFuncCall.Results" href="#CommitStoreGetFuncCall.Results">func (c CommitStoreGetFuncCall) Results() []interface{}</a>

```
searchKey: compression.CommitStoreGetFuncCall.Results
tags: [exported]
```

```Go
func (c CommitStoreGetFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="CommitStoreGetMetadataFunc" href="#CommitStoreGetMetadataFunc">type CommitStoreGetMetadataFunc struct</a>

```
searchKey: compression.CommitStoreGetMetadataFunc
tags: [exported]
```

```Go
type CommitStoreGetMetadataFunc struct {
	defaultHook func(context.Context, api.RepoID) (CommitIndexMetadata, error)
	hooks       []func(context.Context, api.RepoID) (CommitIndexMetadata, error)
	history     []CommitStoreGetMetadataFuncCall
	mutex       sync.Mutex
}
```

CommitStoreGetMetadataFunc describes the behavior when the GetMetadata method of the parent MockCommitStore instance is invoked. 

#### <a id="CommitStoreGetMetadataFunc.SetDefaultHook" href="#CommitStoreGetMetadataFunc.SetDefaultHook">func (f *CommitStoreGetMetadataFunc) SetDefaultHook(hook func(context.Context, api.RepoID) (CommitIndexMetadata, error))</a>

```
searchKey: compression.CommitStoreGetMetadataFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *CommitStoreGetMetadataFunc) SetDefaultHook(hook func(context.Context, api.RepoID) (CommitIndexMetadata, error))
```

SetDefaultHook sets function that is called when the GetMetadata method of the parent MockCommitStore instance is invoked and the hook queue is empty. 

#### <a id="CommitStoreGetMetadataFunc.PushHook" href="#CommitStoreGetMetadataFunc.PushHook">func (f *CommitStoreGetMetadataFunc) PushHook(hook func(context.Context, api.RepoID) (CommitIndexMetadata, error))</a>

```
searchKey: compression.CommitStoreGetMetadataFunc.PushHook
tags: [exported]
```

```Go
func (f *CommitStoreGetMetadataFunc) PushHook(hook func(context.Context, api.RepoID) (CommitIndexMetadata, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetMetadata method of the parent MockCommitStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="CommitStoreGetMetadataFunc.SetDefaultReturn" href="#CommitStoreGetMetadataFunc.SetDefaultReturn">func (f *CommitStoreGetMetadataFunc) SetDefaultReturn(r0 CommitIndexMetadata, r1 error)</a>

```
searchKey: compression.CommitStoreGetMetadataFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *CommitStoreGetMetadataFunc) SetDefaultReturn(r0 CommitIndexMetadata, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="CommitStoreGetMetadataFunc.PushReturn" href="#CommitStoreGetMetadataFunc.PushReturn">func (f *CommitStoreGetMetadataFunc) PushReturn(r0 CommitIndexMetadata, r1 error)</a>

```
searchKey: compression.CommitStoreGetMetadataFunc.PushReturn
tags: [exported]
```

```Go
func (f *CommitStoreGetMetadataFunc) PushReturn(r0 CommitIndexMetadata, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="CommitStoreGetMetadataFunc.nextHook" href="#CommitStoreGetMetadataFunc.nextHook">func (f *CommitStoreGetMetadataFunc) nextHook() func(context.Context, api.RepoID) (CommitIndexMetadata, error)</a>

```
searchKey: compression.CommitStoreGetMetadataFunc.nextHook
```

```Go
func (f *CommitStoreGetMetadataFunc) nextHook() func(context.Context, api.RepoID) (CommitIndexMetadata, error)
```

#### <a id="CommitStoreGetMetadataFunc.appendCall" href="#CommitStoreGetMetadataFunc.appendCall">func (f *CommitStoreGetMetadataFunc) appendCall(r0 CommitStoreGetMetadataFuncCall)</a>

```
searchKey: compression.CommitStoreGetMetadataFunc.appendCall
```

```Go
func (f *CommitStoreGetMetadataFunc) appendCall(r0 CommitStoreGetMetadataFuncCall)
```

#### <a id="CommitStoreGetMetadataFunc.History" href="#CommitStoreGetMetadataFunc.History">func (f *CommitStoreGetMetadataFunc) History() []CommitStoreGetMetadataFuncCall</a>

```
searchKey: compression.CommitStoreGetMetadataFunc.History
tags: [exported]
```

```Go
func (f *CommitStoreGetMetadataFunc) History() []CommitStoreGetMetadataFuncCall
```

History returns a sequence of CommitStoreGetMetadataFuncCall objects describing the invocations of this function. 

### <a id="CommitStoreGetMetadataFuncCall" href="#CommitStoreGetMetadataFuncCall">type CommitStoreGetMetadataFuncCall struct</a>

```
searchKey: compression.CommitStoreGetMetadataFuncCall
tags: [exported]
```

```Go
type CommitStoreGetMetadataFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 api.RepoID
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 CommitIndexMetadata
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

CommitStoreGetMetadataFuncCall is an object that describes an invocation of method GetMetadata on an instance of MockCommitStore. 

#### <a id="CommitStoreGetMetadataFuncCall.Args" href="#CommitStoreGetMetadataFuncCall.Args">func (c CommitStoreGetMetadataFuncCall) Args() []interface{}</a>

```
searchKey: compression.CommitStoreGetMetadataFuncCall.Args
tags: [exported]
```

```Go
func (c CommitStoreGetMetadataFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="CommitStoreGetMetadataFuncCall.Results" href="#CommitStoreGetMetadataFuncCall.Results">func (c CommitStoreGetMetadataFuncCall) Results() []interface{}</a>

```
searchKey: compression.CommitStoreGetMetadataFuncCall.Results
tags: [exported]
```

```Go
func (c CommitStoreGetMetadataFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="CommitStoreInsertCommitsFunc" href="#CommitStoreInsertCommitsFunc">type CommitStoreInsertCommitsFunc struct</a>

```
searchKey: compression.CommitStoreInsertCommitsFunc
tags: [exported]
```

```Go
type CommitStoreInsertCommitsFunc struct {
	defaultHook func(context.Context, api.RepoID, []*git.Commit) error
	hooks       []func(context.Context, api.RepoID, []*git.Commit) error
	history     []CommitStoreInsertCommitsFuncCall
	mutex       sync.Mutex
}
```

CommitStoreInsertCommitsFunc describes the behavior when the InsertCommits method of the parent MockCommitStore instance is invoked. 

#### <a id="CommitStoreInsertCommitsFunc.SetDefaultHook" href="#CommitStoreInsertCommitsFunc.SetDefaultHook">func (f *CommitStoreInsertCommitsFunc) SetDefaultHook(hook func(context.Context, api.RepoID, []*git.Commit) error)</a>

```
searchKey: compression.CommitStoreInsertCommitsFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *CommitStoreInsertCommitsFunc) SetDefaultHook(hook func(context.Context, api.RepoID, []*git.Commit) error)
```

SetDefaultHook sets function that is called when the InsertCommits method of the parent MockCommitStore instance is invoked and the hook queue is empty. 

#### <a id="CommitStoreInsertCommitsFunc.PushHook" href="#CommitStoreInsertCommitsFunc.PushHook">func (f *CommitStoreInsertCommitsFunc) PushHook(hook func(context.Context, api.RepoID, []*git.Commit) error)</a>

```
searchKey: compression.CommitStoreInsertCommitsFunc.PushHook
tags: [exported]
```

```Go
func (f *CommitStoreInsertCommitsFunc) PushHook(hook func(context.Context, api.RepoID, []*git.Commit) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the InsertCommits method of the parent MockCommitStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="CommitStoreInsertCommitsFunc.SetDefaultReturn" href="#CommitStoreInsertCommitsFunc.SetDefaultReturn">func (f *CommitStoreInsertCommitsFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: compression.CommitStoreInsertCommitsFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *CommitStoreInsertCommitsFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="CommitStoreInsertCommitsFunc.PushReturn" href="#CommitStoreInsertCommitsFunc.PushReturn">func (f *CommitStoreInsertCommitsFunc) PushReturn(r0 error)</a>

```
searchKey: compression.CommitStoreInsertCommitsFunc.PushReturn
tags: [exported]
```

```Go
func (f *CommitStoreInsertCommitsFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="CommitStoreInsertCommitsFunc.nextHook" href="#CommitStoreInsertCommitsFunc.nextHook">func (f *CommitStoreInsertCommitsFunc) nextHook() func(context.Context, api.RepoID, []*git.Commit) error</a>

```
searchKey: compression.CommitStoreInsertCommitsFunc.nextHook
```

```Go
func (f *CommitStoreInsertCommitsFunc) nextHook() func(context.Context, api.RepoID, []*git.Commit) error
```

#### <a id="CommitStoreInsertCommitsFunc.appendCall" href="#CommitStoreInsertCommitsFunc.appendCall">func (f *CommitStoreInsertCommitsFunc) appendCall(r0 CommitStoreInsertCommitsFuncCall)</a>

```
searchKey: compression.CommitStoreInsertCommitsFunc.appendCall
```

```Go
func (f *CommitStoreInsertCommitsFunc) appendCall(r0 CommitStoreInsertCommitsFuncCall)
```

#### <a id="CommitStoreInsertCommitsFunc.History" href="#CommitStoreInsertCommitsFunc.History">func (f *CommitStoreInsertCommitsFunc) History() []CommitStoreInsertCommitsFuncCall</a>

```
searchKey: compression.CommitStoreInsertCommitsFunc.History
tags: [exported]
```

```Go
func (f *CommitStoreInsertCommitsFunc) History() []CommitStoreInsertCommitsFuncCall
```

History returns a sequence of CommitStoreInsertCommitsFuncCall objects describing the invocations of this function. 

### <a id="CommitStoreInsertCommitsFuncCall" href="#CommitStoreInsertCommitsFuncCall">type CommitStoreInsertCommitsFuncCall struct</a>

```
searchKey: compression.CommitStoreInsertCommitsFuncCall
tags: [exported]
```

```Go
type CommitStoreInsertCommitsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 api.RepoID
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 []*git.Commit
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

CommitStoreInsertCommitsFuncCall is an object that describes an invocation of method InsertCommits on an instance of MockCommitStore. 

#### <a id="CommitStoreInsertCommitsFuncCall.Args" href="#CommitStoreInsertCommitsFuncCall.Args">func (c CommitStoreInsertCommitsFuncCall) Args() []interface{}</a>

```
searchKey: compression.CommitStoreInsertCommitsFuncCall.Args
tags: [exported]
```

```Go
func (c CommitStoreInsertCommitsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="CommitStoreInsertCommitsFuncCall.Results" href="#CommitStoreInsertCommitsFuncCall.Results">func (c CommitStoreInsertCommitsFuncCall) Results() []interface{}</a>

```
searchKey: compression.CommitStoreInsertCommitsFuncCall.Results
tags: [exported]
```

```Go
func (c CommitStoreInsertCommitsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="CommitStoreSaveFunc" href="#CommitStoreSaveFunc">type CommitStoreSaveFunc struct</a>

```
searchKey: compression.CommitStoreSaveFunc
tags: [exported]
```

```Go
type CommitStoreSaveFunc struct {
	defaultHook func(context.Context, api.RepoID, *git.Commit) error
	hooks       []func(context.Context, api.RepoID, *git.Commit) error
	history     []CommitStoreSaveFuncCall
	mutex       sync.Mutex
}
```

CommitStoreSaveFunc describes the behavior when the Save method of the parent MockCommitStore instance is invoked. 

#### <a id="CommitStoreSaveFunc.SetDefaultHook" href="#CommitStoreSaveFunc.SetDefaultHook">func (f *CommitStoreSaveFunc) SetDefaultHook(hook func(context.Context, api.RepoID, *git.Commit) error)</a>

```
searchKey: compression.CommitStoreSaveFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *CommitStoreSaveFunc) SetDefaultHook(hook func(context.Context, api.RepoID, *git.Commit) error)
```

SetDefaultHook sets function that is called when the Save method of the parent MockCommitStore instance is invoked and the hook queue is empty. 

#### <a id="CommitStoreSaveFunc.PushHook" href="#CommitStoreSaveFunc.PushHook">func (f *CommitStoreSaveFunc) PushHook(hook func(context.Context, api.RepoID, *git.Commit) error)</a>

```
searchKey: compression.CommitStoreSaveFunc.PushHook
tags: [exported]
```

```Go
func (f *CommitStoreSaveFunc) PushHook(hook func(context.Context, api.RepoID, *git.Commit) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Save method of the parent MockCommitStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="CommitStoreSaveFunc.SetDefaultReturn" href="#CommitStoreSaveFunc.SetDefaultReturn">func (f *CommitStoreSaveFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: compression.CommitStoreSaveFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *CommitStoreSaveFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="CommitStoreSaveFunc.PushReturn" href="#CommitStoreSaveFunc.PushReturn">func (f *CommitStoreSaveFunc) PushReturn(r0 error)</a>

```
searchKey: compression.CommitStoreSaveFunc.PushReturn
tags: [exported]
```

```Go
func (f *CommitStoreSaveFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="CommitStoreSaveFunc.nextHook" href="#CommitStoreSaveFunc.nextHook">func (f *CommitStoreSaveFunc) nextHook() func(context.Context, api.RepoID, *git.Commit) error</a>

```
searchKey: compression.CommitStoreSaveFunc.nextHook
```

```Go
func (f *CommitStoreSaveFunc) nextHook() func(context.Context, api.RepoID, *git.Commit) error
```

#### <a id="CommitStoreSaveFunc.appendCall" href="#CommitStoreSaveFunc.appendCall">func (f *CommitStoreSaveFunc) appendCall(r0 CommitStoreSaveFuncCall)</a>

```
searchKey: compression.CommitStoreSaveFunc.appendCall
```

```Go
func (f *CommitStoreSaveFunc) appendCall(r0 CommitStoreSaveFuncCall)
```

#### <a id="CommitStoreSaveFunc.History" href="#CommitStoreSaveFunc.History">func (f *CommitStoreSaveFunc) History() []CommitStoreSaveFuncCall</a>

```
searchKey: compression.CommitStoreSaveFunc.History
tags: [exported]
```

```Go
func (f *CommitStoreSaveFunc) History() []CommitStoreSaveFuncCall
```

History returns a sequence of CommitStoreSaveFuncCall objects describing the invocations of this function. 

### <a id="CommitStoreSaveFuncCall" href="#CommitStoreSaveFuncCall">type CommitStoreSaveFuncCall struct</a>

```
searchKey: compression.CommitStoreSaveFuncCall
tags: [exported]
```

```Go
type CommitStoreSaveFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 api.RepoID
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 *git.Commit
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

CommitStoreSaveFuncCall is an object that describes an invocation of method Save on an instance of MockCommitStore. 

#### <a id="CommitStoreSaveFuncCall.Args" href="#CommitStoreSaveFuncCall.Args">func (c CommitStoreSaveFuncCall) Args() []interface{}</a>

```
searchKey: compression.CommitStoreSaveFuncCall.Args
tags: [exported]
```

```Go
func (c CommitStoreSaveFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="CommitStoreSaveFuncCall.Results" href="#CommitStoreSaveFuncCall.Results">func (c CommitStoreSaveFuncCall) Results() []interface{}</a>

```
searchKey: compression.CommitStoreSaveFuncCall.Results
tags: [exported]
```

```Go
func (c CommitStoreSaveFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="CommitStoreUpsertMetadataStampFunc" href="#CommitStoreUpsertMetadataStampFunc">type CommitStoreUpsertMetadataStampFunc struct</a>

```
searchKey: compression.CommitStoreUpsertMetadataStampFunc
tags: [exported]
```

```Go
type CommitStoreUpsertMetadataStampFunc struct {
	defaultHook func(context.Context, api.RepoID) (CommitIndexMetadata, error)
	hooks       []func(context.Context, api.RepoID) (CommitIndexMetadata, error)
	history     []CommitStoreUpsertMetadataStampFuncCall
	mutex       sync.Mutex
}
```

CommitStoreUpsertMetadataStampFunc describes the behavior when the UpsertMetadataStamp method of the parent MockCommitStore instance is invoked. 

#### <a id="CommitStoreUpsertMetadataStampFunc.SetDefaultHook" href="#CommitStoreUpsertMetadataStampFunc.SetDefaultHook">func (f *CommitStoreUpsertMetadataStampFunc) SetDefaultHook(hook func(context.Context, api.RepoID) (CommitIndexMetadata, error))</a>

```
searchKey: compression.CommitStoreUpsertMetadataStampFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *CommitStoreUpsertMetadataStampFunc) SetDefaultHook(hook func(context.Context, api.RepoID) (CommitIndexMetadata, error))
```

SetDefaultHook sets function that is called when the UpsertMetadataStamp method of the parent MockCommitStore instance is invoked and the hook queue is empty. 

#### <a id="CommitStoreUpsertMetadataStampFunc.PushHook" href="#CommitStoreUpsertMetadataStampFunc.PushHook">func (f *CommitStoreUpsertMetadataStampFunc) PushHook(hook func(context.Context, api.RepoID) (CommitIndexMetadata, error))</a>

```
searchKey: compression.CommitStoreUpsertMetadataStampFunc.PushHook
tags: [exported]
```

```Go
func (f *CommitStoreUpsertMetadataStampFunc) PushHook(hook func(context.Context, api.RepoID) (CommitIndexMetadata, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the UpsertMetadataStamp method of the parent MockCommitStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="CommitStoreUpsertMetadataStampFunc.SetDefaultReturn" href="#CommitStoreUpsertMetadataStampFunc.SetDefaultReturn">func (f *CommitStoreUpsertMetadataStampFunc) SetDefaultReturn(r0 CommitIndexMetadata, r1 error)</a>

```
searchKey: compression.CommitStoreUpsertMetadataStampFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *CommitStoreUpsertMetadataStampFunc) SetDefaultReturn(r0 CommitIndexMetadata, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="CommitStoreUpsertMetadataStampFunc.PushReturn" href="#CommitStoreUpsertMetadataStampFunc.PushReturn">func (f *CommitStoreUpsertMetadataStampFunc) PushReturn(r0 CommitIndexMetadata, r1 error)</a>

```
searchKey: compression.CommitStoreUpsertMetadataStampFunc.PushReturn
tags: [exported]
```

```Go
func (f *CommitStoreUpsertMetadataStampFunc) PushReturn(r0 CommitIndexMetadata, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="CommitStoreUpsertMetadataStampFunc.nextHook" href="#CommitStoreUpsertMetadataStampFunc.nextHook">func (f *CommitStoreUpsertMetadataStampFunc) nextHook() func(context.Context, api.RepoID) (CommitIndexMetadata, error)</a>

```
searchKey: compression.CommitStoreUpsertMetadataStampFunc.nextHook
```

```Go
func (f *CommitStoreUpsertMetadataStampFunc) nextHook() func(context.Context, api.RepoID) (CommitIndexMetadata, error)
```

#### <a id="CommitStoreUpsertMetadataStampFunc.appendCall" href="#CommitStoreUpsertMetadataStampFunc.appendCall">func (f *CommitStoreUpsertMetadataStampFunc) appendCall(r0 CommitStoreUpsertMetadataStampFuncCall)</a>

```
searchKey: compression.CommitStoreUpsertMetadataStampFunc.appendCall
```

```Go
func (f *CommitStoreUpsertMetadataStampFunc) appendCall(r0 CommitStoreUpsertMetadataStampFuncCall)
```

#### <a id="CommitStoreUpsertMetadataStampFunc.History" href="#CommitStoreUpsertMetadataStampFunc.History">func (f *CommitStoreUpsertMetadataStampFunc) History() []CommitStoreUpsertMetadataStampFuncCall</a>

```
searchKey: compression.CommitStoreUpsertMetadataStampFunc.History
tags: [exported]
```

```Go
func (f *CommitStoreUpsertMetadataStampFunc) History() []CommitStoreUpsertMetadataStampFuncCall
```

History returns a sequence of CommitStoreUpsertMetadataStampFuncCall objects describing the invocations of this function. 

### <a id="CommitStoreUpsertMetadataStampFuncCall" href="#CommitStoreUpsertMetadataStampFuncCall">type CommitStoreUpsertMetadataStampFuncCall struct</a>

```
searchKey: compression.CommitStoreUpsertMetadataStampFuncCall
tags: [exported]
```

```Go
type CommitStoreUpsertMetadataStampFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 api.RepoID
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 CommitIndexMetadata
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

CommitStoreUpsertMetadataStampFuncCall is an object that describes an invocation of method UpsertMetadataStamp on an instance of MockCommitStore. 

#### <a id="CommitStoreUpsertMetadataStampFuncCall.Args" href="#CommitStoreUpsertMetadataStampFuncCall.Args">func (c CommitStoreUpsertMetadataStampFuncCall) Args() []interface{}</a>

```
searchKey: compression.CommitStoreUpsertMetadataStampFuncCall.Args
tags: [exported]
```

```Go
func (c CommitStoreUpsertMetadataStampFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="CommitStoreUpsertMetadataStampFuncCall.Results" href="#CommitStoreUpsertMetadataStampFuncCall.Results">func (c CommitStoreUpsertMetadataStampFuncCall) Results() []interface{}</a>

```
searchKey: compression.CommitStoreUpsertMetadataStampFuncCall.Results
tags: [exported]
```

```Go
func (c CommitStoreUpsertMetadataStampFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="RepoStore" href="#RepoStore">type RepoStore interface</a>

```
searchKey: compression.RepoStore
tags: [exported]
```

```Go
type RepoStore interface {
	GetByName(ctx context.Context, repoName api.RepoName) ([]*types.Repo, error)
}
```

### <a id="CommitIndexer" href="#CommitIndexer">type CommitIndexer struct</a>

```
searchKey: compression.CommitIndexer
tags: [exported]
```

```Go
type CommitIndexer struct {
	limiter           *rate.Limiter
	allReposIterator  func(ctx context.Context, each func(repoName string) error) error
	getRepoID         func(ctx context.Context, name api.RepoName) (*types.Repo, error)
	getCommits        func(ctx context.Context, name api.RepoName, after time.Time) ([]*git.Commit, error)
	commitStore       CommitStore
	maxHistoricalTime time.Time
	background        context.Context
}
```

#### <a id="NewCommitIndexer" href="#NewCommitIndexer">func NewCommitIndexer(background context.Context, base dbutil.DB, insights dbutil.DB) *CommitIndexer</a>

```
searchKey: compression.NewCommitIndexer
tags: [exported]
```

```Go
func NewCommitIndexer(background context.Context, base dbutil.DB, insights dbutil.DB) *CommitIndexer
```

#### <a id="CommitIndexer.Handler" href="#CommitIndexer.Handler">func (i *CommitIndexer) Handler(ctx context.Context) goroutine.BackgroundRoutine</a>

```
searchKey: compression.CommitIndexer.Handler
tags: [exported]
```

```Go
func (i *CommitIndexer) Handler(ctx context.Context) goroutine.BackgroundRoutine
```

#### <a id="CommitIndexer.indexAll" href="#CommitIndexer.indexAll">func (i *CommitIndexer) indexAll(ctx context.Context) error</a>

```
searchKey: compression.CommitIndexer.indexAll
```

```Go
func (i *CommitIndexer) indexAll(ctx context.Context) error
```

#### <a id="CommitIndexer.indexRepository" href="#CommitIndexer.indexRepository">func (i *CommitIndexer) indexRepository(name string) error</a>

```
searchKey: compression.CommitIndexer.indexRepository
```

```Go
func (i *CommitIndexer) indexRepository(name string) error
```

indexRepository attempts to index the commits given a repository name. This method will absorb any errors that occur during execution and skip the index for this repository. If this repository already has some commits indexed, only commits made more recently than the previous index will be added. 

#### <a id="CommitIndexer.index" href="#CommitIndexer.index">func (i *CommitIndexer) index(name string) error</a>

```
searchKey: compression.CommitIndexer.index
```

```Go
func (i *CommitIndexer) index(name string) error
```

## <a id="func" href="#func">Functions</a>

### <a id="NewCommitIndexerWorker" href="#NewCommitIndexerWorker">func NewCommitIndexerWorker(ctx context.Context, base dbutil.DB, insights dbutil.DB) goroutine.BackgroundRoutine</a>

```
searchKey: compression.NewCommitIndexerWorker
tags: [exported]
```

```Go
func NewCommitIndexerWorker(ctx context.Context, base dbutil.DB, insights dbutil.DB) goroutine.BackgroundRoutine
```

### <a id="getCommits" href="#getCommits">func getCommits(ctx context.Context, name api.RepoName, after time.Time) ([]*git.Commit, error)</a>

```
searchKey: compression.getCommits
```

```Go
func getCommits(ctx context.Context, name api.RepoName, after time.Time) ([]*git.Commit, error)
```

getCommits fetches the commits from the remote gitserver for a repository after a certain time. 

### <a id="max" href="#max">func max(a, b time.Time) time.Time</a>

```
searchKey: compression.max
```

```Go
func max(a, b time.Time) time.Time
```

### <a id="TestCommitIndexer_indexAll" href="#TestCommitIndexer_indexAll">func TestCommitIndexer_indexAll(t *testing.T)</a>

```
searchKey: compression.TestCommitIndexer_indexAll
```

```Go
func TestCommitIndexer_indexAll(t *testing.T)
```

### <a id="Test_getMetadata_InsertNewRecord" href="#Test_getMetadata_InsertNewRecord">func Test_getMetadata_InsertNewRecord(t *testing.T)</a>

```
searchKey: compression.Test_getMetadata_InsertNewRecord
```

```Go
func Test_getMetadata_InsertNewRecord(t *testing.T)
```

### <a id="Test_getMetadata_NoInsertRequired" href="#Test_getMetadata_NoInsertRequired">func Test_getMetadata_NoInsertRequired(t *testing.T)</a>

```
searchKey: compression.Test_getMetadata_NoInsertRequired
```

```Go
func Test_getMetadata_NoInsertRequired(t *testing.T)
```

### <a id="mockIterator" href="#mockIterator">func mockIterator(repos []string) func(ctx context.Context, each func(repoName string) error) error</a>

```
searchKey: compression.mockIterator
```

```Go
func mockIterator(repos []string) func(ctx context.Context, each func(repoName string) error) error
```

mockIterator generates iterator methods given a list of repo names for test scenarios 

### <a id="commit" href="#commit">func commit(ref string, commitTime string) *git.Commit</a>

```
searchKey: compression.commit
```

```Go
func commit(ref string, commitTime string) *git.Commit
```

commit build a fake commit for test scenarios 

### <a id="mockCommits" href="#mockCommits">func mockCommits(commits map[string][]*git.Commit) func(ctx context.Context, name api.RepoName, after time.Time) ([]*git.Commit, error)</a>

```
searchKey: compression.mockCommits
```

```Go
func mockCommits(commits map[string][]*git.Commit) func(ctx context.Context, name api.RepoName, after time.Time) ([]*git.Commit, error)
```

### <a id="mockIds" href="#mockIds">func mockIds(ids map[string]int) func(ctx context.Context, name api.RepoName) (*types.Repo, error)</a>

```
searchKey: compression.mockIds
```

```Go
func mockIds(ids map[string]int) func(ctx context.Context, name api.RepoName) (*types.Repo, error)
```

