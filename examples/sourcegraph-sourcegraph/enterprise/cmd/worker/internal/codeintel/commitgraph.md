# Package commitgraph

## Index

* [Types](#type)
    * [type DBStore interface](#DBStore)
    * [type DBStoreCalculateVisibleUploadsFunc struct](#DBStoreCalculateVisibleUploadsFunc)
        * [func (f *DBStoreCalculateVisibleUploadsFunc) History() []DBStoreCalculateVisibleUploadsFuncCall](#DBStoreCalculateVisibleUploadsFunc.History)
        * [func (f *DBStoreCalculateVisibleUploadsFunc) PushHook(hook func(context.Context, int, *gitserver.CommitGraph, string, int, time.Time) error)](#DBStoreCalculateVisibleUploadsFunc.PushHook)
        * [func (f *DBStoreCalculateVisibleUploadsFunc) PushReturn(r0 error)](#DBStoreCalculateVisibleUploadsFunc.PushReturn)
        * [func (f *DBStoreCalculateVisibleUploadsFunc) SetDefaultHook(hook func(context.Context, int, *gitserver.CommitGraph, string, int, time.Time) error)](#DBStoreCalculateVisibleUploadsFunc.SetDefaultHook)
        * [func (f *DBStoreCalculateVisibleUploadsFunc) SetDefaultReturn(r0 error)](#DBStoreCalculateVisibleUploadsFunc.SetDefaultReturn)
        * [func (f *DBStoreCalculateVisibleUploadsFunc) appendCall(r0 DBStoreCalculateVisibleUploadsFuncCall)](#DBStoreCalculateVisibleUploadsFunc.appendCall)
        * [func (f *DBStoreCalculateVisibleUploadsFunc) nextHook() func(context.Context, int, *gitserver.CommitGraph, string, int, time.Time) error](#DBStoreCalculateVisibleUploadsFunc.nextHook)
    * [type DBStoreCalculateVisibleUploadsFuncCall struct](#DBStoreCalculateVisibleUploadsFuncCall)
        * [func (c DBStoreCalculateVisibleUploadsFuncCall) Args() []interface{}](#DBStoreCalculateVisibleUploadsFuncCall.Args)
        * [func (c DBStoreCalculateVisibleUploadsFuncCall) Results() []interface{}](#DBStoreCalculateVisibleUploadsFuncCall.Results)
    * [type DBStoreDirtyRepositoriesFunc struct](#DBStoreDirtyRepositoriesFunc)
        * [func (f *DBStoreDirtyRepositoriesFunc) History() []DBStoreDirtyRepositoriesFuncCall](#DBStoreDirtyRepositoriesFunc.History)
        * [func (f *DBStoreDirtyRepositoriesFunc) PushHook(hook func(context.Context) (map[int]int, error))](#DBStoreDirtyRepositoriesFunc.PushHook)
        * [func (f *DBStoreDirtyRepositoriesFunc) PushReturn(r0 map[int]int, r1 error)](#DBStoreDirtyRepositoriesFunc.PushReturn)
        * [func (f *DBStoreDirtyRepositoriesFunc) SetDefaultHook(hook func(context.Context) (map[int]int, error))](#DBStoreDirtyRepositoriesFunc.SetDefaultHook)
        * [func (f *DBStoreDirtyRepositoriesFunc) SetDefaultReturn(r0 map[int]int, r1 error)](#DBStoreDirtyRepositoriesFunc.SetDefaultReturn)
        * [func (f *DBStoreDirtyRepositoriesFunc) appendCall(r0 DBStoreDirtyRepositoriesFuncCall)](#DBStoreDirtyRepositoriesFunc.appendCall)
        * [func (f *DBStoreDirtyRepositoriesFunc) nextHook() func(context.Context) (map[int]int, error)](#DBStoreDirtyRepositoriesFunc.nextHook)
    * [type DBStoreDirtyRepositoriesFuncCall struct](#DBStoreDirtyRepositoriesFuncCall)
        * [func (c DBStoreDirtyRepositoriesFuncCall) Args() []interface{}](#DBStoreDirtyRepositoriesFuncCall.Args)
        * [func (c DBStoreDirtyRepositoriesFuncCall) Results() []interface{}](#DBStoreDirtyRepositoriesFuncCall.Results)
    * [type DBStoreGetOldestCommitDateFunc struct](#DBStoreGetOldestCommitDateFunc)
        * [func (f *DBStoreGetOldestCommitDateFunc) History() []DBStoreGetOldestCommitDateFuncCall](#DBStoreGetOldestCommitDateFunc.History)
        * [func (f *DBStoreGetOldestCommitDateFunc) PushHook(hook func(context.Context, int) (time.Time, bool, error))](#DBStoreGetOldestCommitDateFunc.PushHook)
        * [func (f *DBStoreGetOldestCommitDateFunc) PushReturn(r0 time.Time, r1 bool, r2 error)](#DBStoreGetOldestCommitDateFunc.PushReturn)
        * [func (f *DBStoreGetOldestCommitDateFunc) SetDefaultHook(hook func(context.Context, int) (time.Time, bool, error))](#DBStoreGetOldestCommitDateFunc.SetDefaultHook)
        * [func (f *DBStoreGetOldestCommitDateFunc) SetDefaultReturn(r0 time.Time, r1 bool, r2 error)](#DBStoreGetOldestCommitDateFunc.SetDefaultReturn)
        * [func (f *DBStoreGetOldestCommitDateFunc) appendCall(r0 DBStoreGetOldestCommitDateFuncCall)](#DBStoreGetOldestCommitDateFunc.appendCall)
        * [func (f *DBStoreGetOldestCommitDateFunc) nextHook() func(context.Context, int) (time.Time, bool, error)](#DBStoreGetOldestCommitDateFunc.nextHook)
    * [type DBStoreGetOldestCommitDateFuncCall struct](#DBStoreGetOldestCommitDateFuncCall)
        * [func (c DBStoreGetOldestCommitDateFuncCall) Args() []interface{}](#DBStoreGetOldestCommitDateFuncCall.Args)
        * [func (c DBStoreGetOldestCommitDateFuncCall) Results() []interface{}](#DBStoreGetOldestCommitDateFuncCall.Results)
    * [type GitserverClient interface](#GitserverClient)
    * [type GitserverClientCommitGraphFunc struct](#GitserverClientCommitGraphFunc)
        * [func (f *GitserverClientCommitGraphFunc) History() []GitserverClientCommitGraphFuncCall](#GitserverClientCommitGraphFunc.History)
        * [func (f *GitserverClientCommitGraphFunc) PushHook(hook func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error))](#GitserverClientCommitGraphFunc.PushHook)
        * [func (f *GitserverClientCommitGraphFunc) PushReturn(r0 *gitserver.CommitGraph, r1 error)](#GitserverClientCommitGraphFunc.PushReturn)
        * [func (f *GitserverClientCommitGraphFunc) SetDefaultHook(hook func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error))](#GitserverClientCommitGraphFunc.SetDefaultHook)
        * [func (f *GitserverClientCommitGraphFunc) SetDefaultReturn(r0 *gitserver.CommitGraph, r1 error)](#GitserverClientCommitGraphFunc.SetDefaultReturn)
        * [func (f *GitserverClientCommitGraphFunc) appendCall(r0 GitserverClientCommitGraphFuncCall)](#GitserverClientCommitGraphFunc.appendCall)
        * [func (f *GitserverClientCommitGraphFunc) nextHook() func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)](#GitserverClientCommitGraphFunc.nextHook)
    * [type GitserverClientCommitGraphFuncCall struct](#GitserverClientCommitGraphFuncCall)
        * [func (c GitserverClientCommitGraphFuncCall) Args() []interface{}](#GitserverClientCommitGraphFuncCall.Args)
        * [func (c GitserverClientCommitGraphFuncCall) Results() []interface{}](#GitserverClientCommitGraphFuncCall.Results)
    * [type GitserverClientHeadFunc struct](#GitserverClientHeadFunc)
        * [func (f *GitserverClientHeadFunc) History() []GitserverClientHeadFuncCall](#GitserverClientHeadFunc.History)
        * [func (f *GitserverClientHeadFunc) PushHook(hook func(context.Context, int) (string, error))](#GitserverClientHeadFunc.PushHook)
        * [func (f *GitserverClientHeadFunc) PushReturn(r0 string, r1 error)](#GitserverClientHeadFunc.PushReturn)
        * [func (f *GitserverClientHeadFunc) SetDefaultHook(hook func(context.Context, int) (string, error))](#GitserverClientHeadFunc.SetDefaultHook)
        * [func (f *GitserverClientHeadFunc) SetDefaultReturn(r0 string, r1 error)](#GitserverClientHeadFunc.SetDefaultReturn)
        * [func (f *GitserverClientHeadFunc) appendCall(r0 GitserverClientHeadFuncCall)](#GitserverClientHeadFunc.appendCall)
        * [func (f *GitserverClientHeadFunc) nextHook() func(context.Context, int) (string, error)](#GitserverClientHeadFunc.nextHook)
    * [type GitserverClientHeadFuncCall struct](#GitserverClientHeadFuncCall)
        * [func (c GitserverClientHeadFuncCall) Args() []interface{}](#GitserverClientHeadFuncCall.Args)
        * [func (c GitserverClientHeadFuncCall) Results() []interface{}](#GitserverClientHeadFuncCall.Results)
    * [type Locker interface](#Locker)
    * [type LockerLockFunc struct](#LockerLockFunc)
        * [func (f *LockerLockFunc) History() []LockerLockFuncCall](#LockerLockFunc.History)
        * [func (f *LockerLockFunc) PushHook(hook func(context.Context, int, bool) (bool, locker.UnlockFunc, error))](#LockerLockFunc.PushHook)
        * [func (f *LockerLockFunc) PushReturn(r0 bool, r1 locker.UnlockFunc, r2 error)](#LockerLockFunc.PushReturn)
        * [func (f *LockerLockFunc) SetDefaultHook(hook func(context.Context, int, bool) (bool, locker.UnlockFunc, error))](#LockerLockFunc.SetDefaultHook)
        * [func (f *LockerLockFunc) SetDefaultReturn(r0 bool, r1 locker.UnlockFunc, r2 error)](#LockerLockFunc.SetDefaultReturn)
        * [func (f *LockerLockFunc) appendCall(r0 LockerLockFuncCall)](#LockerLockFunc.appendCall)
        * [func (f *LockerLockFunc) nextHook() func(context.Context, int, bool) (bool, locker.UnlockFunc, error)](#LockerLockFunc.nextHook)
    * [type LockerLockFuncCall struct](#LockerLockFuncCall)
        * [func (c LockerLockFuncCall) Args() []interface{}](#LockerLockFuncCall.Args)
        * [func (c LockerLockFuncCall) Results() []interface{}](#LockerLockFuncCall.Results)
    * [type MockDBStore struct](#MockDBStore)
        * [func NewMockDBStore() *MockDBStore](#NewMockDBStore)
        * [func NewMockDBStoreFrom(i DBStore) *MockDBStore](#NewMockDBStoreFrom)
        * [func (m *MockDBStore) CalculateVisibleUploads(v0 context.Context, v1 int, v2 *gitserver.CommitGraph, v3 string, v4 int, v5 time.Time) error](#MockDBStore.CalculateVisibleUploads)
        * [func (m *MockDBStore) DirtyRepositories(v0 context.Context) (map[int]int, error)](#MockDBStore.DirtyRepositories)
        * [func (m *MockDBStore) GetOldestCommitDate(v0 context.Context, v1 int) (time.Time, bool, error)](#MockDBStore.GetOldestCommitDate)
    * [type MockGitserverClient struct](#MockGitserverClient)
        * [func NewMockGitserverClient() *MockGitserverClient](#NewMockGitserverClient)
        * [func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient](#NewMockGitserverClientFrom)
        * [func (m *MockGitserverClient) CommitGraph(v0 context.Context, v1 int, v2 gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)](#MockGitserverClient.CommitGraph)
        * [func (m *MockGitserverClient) Head(v0 context.Context, v1 int) (string, error)](#MockGitserverClient.Head)
    * [type MockLocker struct](#MockLocker)
        * [func NewMockLocker() *MockLocker](#NewMockLocker)
        * [func NewMockLockerFrom(i Locker) *MockLocker](#NewMockLockerFrom)
        * [func (m *MockLocker) Lock(v0 context.Context, v1 int, v2 bool) (bool, locker.UnlockFunc, error)](#MockLocker.Lock)
    * [type Updater struct](#Updater)
        * [func (u *Updater) Handle(ctx context.Context) error](#Updater.Handle)
        * [func (u *Updater) HandleError(err error)](#Updater.HandleError)
        * [func (u *Updater) getCommitGraph(ctx context.Context, repositoryID int) (*gitserver.CommitGraph, error)](#Updater.getCommitGraph)
        * [func (u *Updater) tryUpdate(ctx context.Context, repositoryID, dirtyToken int) (err error)](#Updater.tryUpdate)
        * [func (u *Updater) update(ctx context.Context, repositoryID, dirtyToken int) (err error)](#Updater.update)
    * [type operations struct](#operations)
        * [func newOperations(dbStore DBStore, observationContext *observation.Context) *operations](#newOperations)
* [Functions](#func)
    * [func NewUpdater(dbStore DBStore,...](#NewUpdater)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestUpdater(t *testing.T)](#TestUpdater)
    * [func TestUpdaterLocked(t *testing.T)](#TestUpdaterLocked)
    * [func TestUpdaterNoUploads(t *testing.T)](#TestUpdaterNoUploads)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="DBStore" href="#DBStore">type DBStore interface</a>

```
searchKey: commitgraph.DBStore
tags: [interface]
```

```Go
type DBStore interface {
	DirtyRepositories(ctx context.Context) (map[int]int, error)
	CalculateVisibleUploads(ctx context.Context, repositoryID int, graph *gitserver.CommitGraph, tipCommit string, dirtyToken int, now time.Time) error
	GetOldestCommitDate(ctx context.Context, repositoryID int) (time.Time, bool, error)
}
```

### <a id="DBStoreCalculateVisibleUploadsFunc" href="#DBStoreCalculateVisibleUploadsFunc">type DBStoreCalculateVisibleUploadsFunc struct</a>

```
searchKey: commitgraph.DBStoreCalculateVisibleUploadsFunc
tags: [struct private]
```

```Go
type DBStoreCalculateVisibleUploadsFunc struct {
	defaultHook func(context.Context, int, *gitserver.CommitGraph, string, int, time.Time) error
	hooks       []func(context.Context, int, *gitserver.CommitGraph, string, int, time.Time) error
	history     []DBStoreCalculateVisibleUploadsFuncCall
	mutex       sync.Mutex
}
```

DBStoreCalculateVisibleUploadsFunc describes the behavior when the CalculateVisibleUploads method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreCalculateVisibleUploadsFunc.History" href="#DBStoreCalculateVisibleUploadsFunc.History">func (f *DBStoreCalculateVisibleUploadsFunc) History() []DBStoreCalculateVisibleUploadsFuncCall</a>

```
searchKey: commitgraph.DBStoreCalculateVisibleUploadsFunc.History
tags: [function private]
```

```Go
func (f *DBStoreCalculateVisibleUploadsFunc) History() []DBStoreCalculateVisibleUploadsFuncCall
```

History returns a sequence of DBStoreCalculateVisibleUploadsFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreCalculateVisibleUploadsFunc.PushHook" href="#DBStoreCalculateVisibleUploadsFunc.PushHook">func (f *DBStoreCalculateVisibleUploadsFunc) PushHook(hook func(context.Context, int, *gitserver.CommitGraph, string, int, time.Time) error)</a>

```
searchKey: commitgraph.DBStoreCalculateVisibleUploadsFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreCalculateVisibleUploadsFunc) PushHook(hook func(context.Context, int, *gitserver.CommitGraph, string, int, time.Time) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the CalculateVisibleUploads method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreCalculateVisibleUploadsFunc.PushReturn" href="#DBStoreCalculateVisibleUploadsFunc.PushReturn">func (f *DBStoreCalculateVisibleUploadsFunc) PushReturn(r0 error)</a>

```
searchKey: commitgraph.DBStoreCalculateVisibleUploadsFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreCalculateVisibleUploadsFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreCalculateVisibleUploadsFunc.SetDefaultHook" href="#DBStoreCalculateVisibleUploadsFunc.SetDefaultHook">func (f *DBStoreCalculateVisibleUploadsFunc) SetDefaultHook(hook func(context.Context, int, *gitserver.CommitGraph, string, int, time.Time) error)</a>

```
searchKey: commitgraph.DBStoreCalculateVisibleUploadsFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreCalculateVisibleUploadsFunc) SetDefaultHook(hook func(context.Context, int, *gitserver.CommitGraph, string, int, time.Time) error)
```

SetDefaultHook sets function that is called when the CalculateVisibleUploads method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreCalculateVisibleUploadsFunc.SetDefaultReturn" href="#DBStoreCalculateVisibleUploadsFunc.SetDefaultReturn">func (f *DBStoreCalculateVisibleUploadsFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: commitgraph.DBStoreCalculateVisibleUploadsFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreCalculateVisibleUploadsFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreCalculateVisibleUploadsFunc.appendCall" href="#DBStoreCalculateVisibleUploadsFunc.appendCall">func (f *DBStoreCalculateVisibleUploadsFunc) appendCall(r0 DBStoreCalculateVisibleUploadsFuncCall)</a>

```
searchKey: commitgraph.DBStoreCalculateVisibleUploadsFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreCalculateVisibleUploadsFunc) appendCall(r0 DBStoreCalculateVisibleUploadsFuncCall)
```

#### <a id="DBStoreCalculateVisibleUploadsFunc.nextHook" href="#DBStoreCalculateVisibleUploadsFunc.nextHook">func (f *DBStoreCalculateVisibleUploadsFunc) nextHook() func(context.Context, int, *gitserver.CommitGraph, string, int, time.Time) error</a>

```
searchKey: commitgraph.DBStoreCalculateVisibleUploadsFunc.nextHook
tags: [function private]
```

```Go
func (f *DBStoreCalculateVisibleUploadsFunc) nextHook() func(context.Context, int, *gitserver.CommitGraph, string, int, time.Time) error
```

### <a id="DBStoreCalculateVisibleUploadsFuncCall" href="#DBStoreCalculateVisibleUploadsFuncCall">type DBStoreCalculateVisibleUploadsFuncCall struct</a>

```
searchKey: commitgraph.DBStoreCalculateVisibleUploadsFuncCall
tags: [struct private]
```

```Go
type DBStoreCalculateVisibleUploadsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 *gitserver.CommitGraph
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 string
	// Arg4 is the value of the 5th argument passed to this method
	// invocation.
	Arg4 int
	// Arg5 is the value of the 6th argument passed to this method
	// invocation.
	Arg5 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

DBStoreCalculateVisibleUploadsFuncCall is an object that describes an invocation of method CalculateVisibleUploads on an instance of MockDBStore. 

#### <a id="DBStoreCalculateVisibleUploadsFuncCall.Args" href="#DBStoreCalculateVisibleUploadsFuncCall.Args">func (c DBStoreCalculateVisibleUploadsFuncCall) Args() []interface{}</a>

```
searchKey: commitgraph.DBStoreCalculateVisibleUploadsFuncCall.Args
tags: [function private]
```

```Go
func (c DBStoreCalculateVisibleUploadsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreCalculateVisibleUploadsFuncCall.Results" href="#DBStoreCalculateVisibleUploadsFuncCall.Results">func (c DBStoreCalculateVisibleUploadsFuncCall) Results() []interface{}</a>

```
searchKey: commitgraph.DBStoreCalculateVisibleUploadsFuncCall.Results
tags: [function private]
```

```Go
func (c DBStoreCalculateVisibleUploadsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreDirtyRepositoriesFunc" href="#DBStoreDirtyRepositoriesFunc">type DBStoreDirtyRepositoriesFunc struct</a>

```
searchKey: commitgraph.DBStoreDirtyRepositoriesFunc
tags: [struct private]
```

```Go
type DBStoreDirtyRepositoriesFunc struct {
	defaultHook func(context.Context) (map[int]int, error)
	hooks       []func(context.Context) (map[int]int, error)
	history     []DBStoreDirtyRepositoriesFuncCall
	mutex       sync.Mutex
}
```

DBStoreDirtyRepositoriesFunc describes the behavior when the DirtyRepositories method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreDirtyRepositoriesFunc.History" href="#DBStoreDirtyRepositoriesFunc.History">func (f *DBStoreDirtyRepositoriesFunc) History() []DBStoreDirtyRepositoriesFuncCall</a>

```
searchKey: commitgraph.DBStoreDirtyRepositoriesFunc.History
tags: [function private]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) History() []DBStoreDirtyRepositoriesFuncCall
```

History returns a sequence of DBStoreDirtyRepositoriesFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreDirtyRepositoriesFunc.PushHook" href="#DBStoreDirtyRepositoriesFunc.PushHook">func (f *DBStoreDirtyRepositoriesFunc) PushHook(hook func(context.Context) (map[int]int, error))</a>

```
searchKey: commitgraph.DBStoreDirtyRepositoriesFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) PushHook(hook func(context.Context) (map[int]int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DirtyRepositories method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreDirtyRepositoriesFunc.PushReturn" href="#DBStoreDirtyRepositoriesFunc.PushReturn">func (f *DBStoreDirtyRepositoriesFunc) PushReturn(r0 map[int]int, r1 error)</a>

```
searchKey: commitgraph.DBStoreDirtyRepositoriesFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) PushReturn(r0 map[int]int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDirtyRepositoriesFunc.SetDefaultHook" href="#DBStoreDirtyRepositoriesFunc.SetDefaultHook">func (f *DBStoreDirtyRepositoriesFunc) SetDefaultHook(hook func(context.Context) (map[int]int, error))</a>

```
searchKey: commitgraph.DBStoreDirtyRepositoriesFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) SetDefaultHook(hook func(context.Context) (map[int]int, error))
```

SetDefaultHook sets function that is called when the DirtyRepositories method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreDirtyRepositoriesFunc.SetDefaultReturn" href="#DBStoreDirtyRepositoriesFunc.SetDefaultReturn">func (f *DBStoreDirtyRepositoriesFunc) SetDefaultReturn(r0 map[int]int, r1 error)</a>

```
searchKey: commitgraph.DBStoreDirtyRepositoriesFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) SetDefaultReturn(r0 map[int]int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDirtyRepositoriesFunc.appendCall" href="#DBStoreDirtyRepositoriesFunc.appendCall">func (f *DBStoreDirtyRepositoriesFunc) appendCall(r0 DBStoreDirtyRepositoriesFuncCall)</a>

```
searchKey: commitgraph.DBStoreDirtyRepositoriesFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) appendCall(r0 DBStoreDirtyRepositoriesFuncCall)
```

#### <a id="DBStoreDirtyRepositoriesFunc.nextHook" href="#DBStoreDirtyRepositoriesFunc.nextHook">func (f *DBStoreDirtyRepositoriesFunc) nextHook() func(context.Context) (map[int]int, error)</a>

```
searchKey: commitgraph.DBStoreDirtyRepositoriesFunc.nextHook
tags: [function private]
```

```Go
func (f *DBStoreDirtyRepositoriesFunc) nextHook() func(context.Context) (map[int]int, error)
```

### <a id="DBStoreDirtyRepositoriesFuncCall" href="#DBStoreDirtyRepositoriesFuncCall">type DBStoreDirtyRepositoriesFuncCall struct</a>

```
searchKey: commitgraph.DBStoreDirtyRepositoriesFuncCall
tags: [struct private]
```

```Go
type DBStoreDirtyRepositoriesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 map[int]int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreDirtyRepositoriesFuncCall is an object that describes an invocation of method DirtyRepositories on an instance of MockDBStore. 

#### <a id="DBStoreDirtyRepositoriesFuncCall.Args" href="#DBStoreDirtyRepositoriesFuncCall.Args">func (c DBStoreDirtyRepositoriesFuncCall) Args() []interface{}</a>

```
searchKey: commitgraph.DBStoreDirtyRepositoriesFuncCall.Args
tags: [function private]
```

```Go
func (c DBStoreDirtyRepositoriesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreDirtyRepositoriesFuncCall.Results" href="#DBStoreDirtyRepositoriesFuncCall.Results">func (c DBStoreDirtyRepositoriesFuncCall) Results() []interface{}</a>

```
searchKey: commitgraph.DBStoreDirtyRepositoriesFuncCall.Results
tags: [function private]
```

```Go
func (c DBStoreDirtyRepositoriesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetOldestCommitDateFunc" href="#DBStoreGetOldestCommitDateFunc">type DBStoreGetOldestCommitDateFunc struct</a>

```
searchKey: commitgraph.DBStoreGetOldestCommitDateFunc
tags: [struct private]
```

```Go
type DBStoreGetOldestCommitDateFunc struct {
	defaultHook func(context.Context, int) (time.Time, bool, error)
	hooks       []func(context.Context, int) (time.Time, bool, error)
	history     []DBStoreGetOldestCommitDateFuncCall
	mutex       sync.Mutex
}
```

DBStoreGetOldestCommitDateFunc describes the behavior when the GetOldestCommitDate method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreGetOldestCommitDateFunc.History" href="#DBStoreGetOldestCommitDateFunc.History">func (f *DBStoreGetOldestCommitDateFunc) History() []DBStoreGetOldestCommitDateFuncCall</a>

```
searchKey: commitgraph.DBStoreGetOldestCommitDateFunc.History
tags: [function private]
```

```Go
func (f *DBStoreGetOldestCommitDateFunc) History() []DBStoreGetOldestCommitDateFuncCall
```

History returns a sequence of DBStoreGetOldestCommitDateFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreGetOldestCommitDateFunc.PushHook" href="#DBStoreGetOldestCommitDateFunc.PushHook">func (f *DBStoreGetOldestCommitDateFunc) PushHook(hook func(context.Context, int) (time.Time, bool, error))</a>

```
searchKey: commitgraph.DBStoreGetOldestCommitDateFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreGetOldestCommitDateFunc) PushHook(hook func(context.Context, int) (time.Time, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetOldestCommitDate method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetOldestCommitDateFunc.PushReturn" href="#DBStoreGetOldestCommitDateFunc.PushReturn">func (f *DBStoreGetOldestCommitDateFunc) PushReturn(r0 time.Time, r1 bool, r2 error)</a>

```
searchKey: commitgraph.DBStoreGetOldestCommitDateFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreGetOldestCommitDateFunc) PushReturn(r0 time.Time, r1 bool, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetOldestCommitDateFunc.SetDefaultHook" href="#DBStoreGetOldestCommitDateFunc.SetDefaultHook">func (f *DBStoreGetOldestCommitDateFunc) SetDefaultHook(hook func(context.Context, int) (time.Time, bool, error))</a>

```
searchKey: commitgraph.DBStoreGetOldestCommitDateFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreGetOldestCommitDateFunc) SetDefaultHook(hook func(context.Context, int) (time.Time, bool, error))
```

SetDefaultHook sets function that is called when the GetOldestCommitDate method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetOldestCommitDateFunc.SetDefaultReturn" href="#DBStoreGetOldestCommitDateFunc.SetDefaultReturn">func (f *DBStoreGetOldestCommitDateFunc) SetDefaultReturn(r0 time.Time, r1 bool, r2 error)</a>

```
searchKey: commitgraph.DBStoreGetOldestCommitDateFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreGetOldestCommitDateFunc) SetDefaultReturn(r0 time.Time, r1 bool, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetOldestCommitDateFunc.appendCall" href="#DBStoreGetOldestCommitDateFunc.appendCall">func (f *DBStoreGetOldestCommitDateFunc) appendCall(r0 DBStoreGetOldestCommitDateFuncCall)</a>

```
searchKey: commitgraph.DBStoreGetOldestCommitDateFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreGetOldestCommitDateFunc) appendCall(r0 DBStoreGetOldestCommitDateFuncCall)
```

#### <a id="DBStoreGetOldestCommitDateFunc.nextHook" href="#DBStoreGetOldestCommitDateFunc.nextHook">func (f *DBStoreGetOldestCommitDateFunc) nextHook() func(context.Context, int) (time.Time, bool, error)</a>

```
searchKey: commitgraph.DBStoreGetOldestCommitDateFunc.nextHook
tags: [function private]
```

```Go
func (f *DBStoreGetOldestCommitDateFunc) nextHook() func(context.Context, int) (time.Time, bool, error)
```

### <a id="DBStoreGetOldestCommitDateFuncCall" href="#DBStoreGetOldestCommitDateFuncCall">type DBStoreGetOldestCommitDateFuncCall struct</a>

```
searchKey: commitgraph.DBStoreGetOldestCommitDateFuncCall
tags: [struct private]
```

```Go
type DBStoreGetOldestCommitDateFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 time.Time
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 bool
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

DBStoreGetOldestCommitDateFuncCall is an object that describes an invocation of method GetOldestCommitDate on an instance of MockDBStore. 

#### <a id="DBStoreGetOldestCommitDateFuncCall.Args" href="#DBStoreGetOldestCommitDateFuncCall.Args">func (c DBStoreGetOldestCommitDateFuncCall) Args() []interface{}</a>

```
searchKey: commitgraph.DBStoreGetOldestCommitDateFuncCall.Args
tags: [function private]
```

```Go
func (c DBStoreGetOldestCommitDateFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreGetOldestCommitDateFuncCall.Results" href="#DBStoreGetOldestCommitDateFuncCall.Results">func (c DBStoreGetOldestCommitDateFuncCall) Results() []interface{}</a>

```
searchKey: commitgraph.DBStoreGetOldestCommitDateFuncCall.Results
tags: [function private]
```

```Go
func (c DBStoreGetOldestCommitDateFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GitserverClient" href="#GitserverClient">type GitserverClient interface</a>

```
searchKey: commitgraph.GitserverClient
tags: [interface]
```

```Go
type GitserverClient interface {
	Head(ctx context.Context, repositoryID int) (string, error)
	CommitGraph(ctx context.Context, repositoryID int, options gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)
}
```

### <a id="GitserverClientCommitGraphFunc" href="#GitserverClientCommitGraphFunc">type GitserverClientCommitGraphFunc struct</a>

```
searchKey: commitgraph.GitserverClientCommitGraphFunc
tags: [struct private]
```

```Go
type GitserverClientCommitGraphFunc struct {
	defaultHook func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)
	hooks       []func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)
	history     []GitserverClientCommitGraphFuncCall
	mutex       sync.Mutex
}
```

GitserverClientCommitGraphFunc describes the behavior when the CommitGraph method of the parent MockGitserverClient instance is invoked. 

#### <a id="GitserverClientCommitGraphFunc.History" href="#GitserverClientCommitGraphFunc.History">func (f *GitserverClientCommitGraphFunc) History() []GitserverClientCommitGraphFuncCall</a>

```
searchKey: commitgraph.GitserverClientCommitGraphFunc.History
tags: [function private]
```

```Go
func (f *GitserverClientCommitGraphFunc) History() []GitserverClientCommitGraphFuncCall
```

History returns a sequence of GitserverClientCommitGraphFuncCall objects describing the invocations of this function. 

#### <a id="GitserverClientCommitGraphFunc.PushHook" href="#GitserverClientCommitGraphFunc.PushHook">func (f *GitserverClientCommitGraphFunc) PushHook(hook func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error))</a>

```
searchKey: commitgraph.GitserverClientCommitGraphFunc.PushHook
tags: [method private]
```

```Go
func (f *GitserverClientCommitGraphFunc) PushHook(hook func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the CommitGraph method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientCommitGraphFunc.PushReturn" href="#GitserverClientCommitGraphFunc.PushReturn">func (f *GitserverClientCommitGraphFunc) PushReturn(r0 *gitserver.CommitGraph, r1 error)</a>

```
searchKey: commitgraph.GitserverClientCommitGraphFunc.PushReturn
tags: [method private]
```

```Go
func (f *GitserverClientCommitGraphFunc) PushReturn(r0 *gitserver.CommitGraph, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientCommitGraphFunc.SetDefaultHook" href="#GitserverClientCommitGraphFunc.SetDefaultHook">func (f *GitserverClientCommitGraphFunc) SetDefaultHook(hook func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error))</a>

```
searchKey: commitgraph.GitserverClientCommitGraphFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *GitserverClientCommitGraphFunc) SetDefaultHook(hook func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error))
```

SetDefaultHook sets function that is called when the CommitGraph method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientCommitGraphFunc.SetDefaultReturn" href="#GitserverClientCommitGraphFunc.SetDefaultReturn">func (f *GitserverClientCommitGraphFunc) SetDefaultReturn(r0 *gitserver.CommitGraph, r1 error)</a>

```
searchKey: commitgraph.GitserverClientCommitGraphFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *GitserverClientCommitGraphFunc) SetDefaultReturn(r0 *gitserver.CommitGraph, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientCommitGraphFunc.appendCall" href="#GitserverClientCommitGraphFunc.appendCall">func (f *GitserverClientCommitGraphFunc) appendCall(r0 GitserverClientCommitGraphFuncCall)</a>

```
searchKey: commitgraph.GitserverClientCommitGraphFunc.appendCall
tags: [method private]
```

```Go
func (f *GitserverClientCommitGraphFunc) appendCall(r0 GitserverClientCommitGraphFuncCall)
```

#### <a id="GitserverClientCommitGraphFunc.nextHook" href="#GitserverClientCommitGraphFunc.nextHook">func (f *GitserverClientCommitGraphFunc) nextHook() func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)</a>

```
searchKey: commitgraph.GitserverClientCommitGraphFunc.nextHook
tags: [function private]
```

```Go
func (f *GitserverClientCommitGraphFunc) nextHook() func(context.Context, int, gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)
```

### <a id="GitserverClientCommitGraphFuncCall" href="#GitserverClientCommitGraphFuncCall">type GitserverClientCommitGraphFuncCall struct</a>

```
searchKey: commitgraph.GitserverClientCommitGraphFuncCall
tags: [struct private]
```

```Go
type GitserverClientCommitGraphFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 gitserver.CommitGraphOptions
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *gitserver.CommitGraph
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

GitserverClientCommitGraphFuncCall is an object that describes an invocation of method CommitGraph on an instance of MockGitserverClient. 

#### <a id="GitserverClientCommitGraphFuncCall.Args" href="#GitserverClientCommitGraphFuncCall.Args">func (c GitserverClientCommitGraphFuncCall) Args() []interface{}</a>

```
searchKey: commitgraph.GitserverClientCommitGraphFuncCall.Args
tags: [function private]
```

```Go
func (c GitserverClientCommitGraphFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientCommitGraphFuncCall.Results" href="#GitserverClientCommitGraphFuncCall.Results">func (c GitserverClientCommitGraphFuncCall) Results() []interface{}</a>

```
searchKey: commitgraph.GitserverClientCommitGraphFuncCall.Results
tags: [function private]
```

```Go
func (c GitserverClientCommitGraphFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GitserverClientHeadFunc" href="#GitserverClientHeadFunc">type GitserverClientHeadFunc struct</a>

```
searchKey: commitgraph.GitserverClientHeadFunc
tags: [struct private]
```

```Go
type GitserverClientHeadFunc struct {
	defaultHook func(context.Context, int) (string, error)
	hooks       []func(context.Context, int) (string, error)
	history     []GitserverClientHeadFuncCall
	mutex       sync.Mutex
}
```

GitserverClientHeadFunc describes the behavior when the Head method of the parent MockGitserverClient instance is invoked. 

#### <a id="GitserverClientHeadFunc.History" href="#GitserverClientHeadFunc.History">func (f *GitserverClientHeadFunc) History() []GitserverClientHeadFuncCall</a>

```
searchKey: commitgraph.GitserverClientHeadFunc.History
tags: [function private]
```

```Go
func (f *GitserverClientHeadFunc) History() []GitserverClientHeadFuncCall
```

History returns a sequence of GitserverClientHeadFuncCall objects describing the invocations of this function. 

#### <a id="GitserverClientHeadFunc.PushHook" href="#GitserverClientHeadFunc.PushHook">func (f *GitserverClientHeadFunc) PushHook(hook func(context.Context, int) (string, error))</a>

```
searchKey: commitgraph.GitserverClientHeadFunc.PushHook
tags: [method private]
```

```Go
func (f *GitserverClientHeadFunc) PushHook(hook func(context.Context, int) (string, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Head method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientHeadFunc.PushReturn" href="#GitserverClientHeadFunc.PushReturn">func (f *GitserverClientHeadFunc) PushReturn(r0 string, r1 error)</a>

```
searchKey: commitgraph.GitserverClientHeadFunc.PushReturn
tags: [method private]
```

```Go
func (f *GitserverClientHeadFunc) PushReturn(r0 string, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientHeadFunc.SetDefaultHook" href="#GitserverClientHeadFunc.SetDefaultHook">func (f *GitserverClientHeadFunc) SetDefaultHook(hook func(context.Context, int) (string, error))</a>

```
searchKey: commitgraph.GitserverClientHeadFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *GitserverClientHeadFunc) SetDefaultHook(hook func(context.Context, int) (string, error))
```

SetDefaultHook sets function that is called when the Head method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientHeadFunc.SetDefaultReturn" href="#GitserverClientHeadFunc.SetDefaultReturn">func (f *GitserverClientHeadFunc) SetDefaultReturn(r0 string, r1 error)</a>

```
searchKey: commitgraph.GitserverClientHeadFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *GitserverClientHeadFunc) SetDefaultReturn(r0 string, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientHeadFunc.appendCall" href="#GitserverClientHeadFunc.appendCall">func (f *GitserverClientHeadFunc) appendCall(r0 GitserverClientHeadFuncCall)</a>

```
searchKey: commitgraph.GitserverClientHeadFunc.appendCall
tags: [method private]
```

```Go
func (f *GitserverClientHeadFunc) appendCall(r0 GitserverClientHeadFuncCall)
```

#### <a id="GitserverClientHeadFunc.nextHook" href="#GitserverClientHeadFunc.nextHook">func (f *GitserverClientHeadFunc) nextHook() func(context.Context, int) (string, error)</a>

```
searchKey: commitgraph.GitserverClientHeadFunc.nextHook
tags: [function private]
```

```Go
func (f *GitserverClientHeadFunc) nextHook() func(context.Context, int) (string, error)
```

### <a id="GitserverClientHeadFuncCall" href="#GitserverClientHeadFuncCall">type GitserverClientHeadFuncCall struct</a>

```
searchKey: commitgraph.GitserverClientHeadFuncCall
tags: [struct private]
```

```Go
type GitserverClientHeadFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 string
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

GitserverClientHeadFuncCall is an object that describes an invocation of method Head on an instance of MockGitserverClient. 

#### <a id="GitserverClientHeadFuncCall.Args" href="#GitserverClientHeadFuncCall.Args">func (c GitserverClientHeadFuncCall) Args() []interface{}</a>

```
searchKey: commitgraph.GitserverClientHeadFuncCall.Args
tags: [function private]
```

```Go
func (c GitserverClientHeadFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientHeadFuncCall.Results" href="#GitserverClientHeadFuncCall.Results">func (c GitserverClientHeadFuncCall) Results() []interface{}</a>

```
searchKey: commitgraph.GitserverClientHeadFuncCall.Results
tags: [function private]
```

```Go
func (c GitserverClientHeadFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="Locker" href="#Locker">type Locker interface</a>

```
searchKey: commitgraph.Locker
tags: [interface]
```

```Go
type Locker interface {
	Lock(ctx context.Context, key int, blocking bool) (bool, locker.UnlockFunc, error)
}
```

### <a id="LockerLockFunc" href="#LockerLockFunc">type LockerLockFunc struct</a>

```
searchKey: commitgraph.LockerLockFunc
tags: [struct private]
```

```Go
type LockerLockFunc struct {
	defaultHook func(context.Context, int, bool) (bool, locker.UnlockFunc, error)
	hooks       []func(context.Context, int, bool) (bool, locker.UnlockFunc, error)
	history     []LockerLockFuncCall
	mutex       sync.Mutex
}
```

LockerLockFunc describes the behavior when the Lock method of the parent MockLocker instance is invoked. 

#### <a id="LockerLockFunc.History" href="#LockerLockFunc.History">func (f *LockerLockFunc) History() []LockerLockFuncCall</a>

```
searchKey: commitgraph.LockerLockFunc.History
tags: [function private]
```

```Go
func (f *LockerLockFunc) History() []LockerLockFuncCall
```

History returns a sequence of LockerLockFuncCall objects describing the invocations of this function. 

#### <a id="LockerLockFunc.PushHook" href="#LockerLockFunc.PushHook">func (f *LockerLockFunc) PushHook(hook func(context.Context, int, bool) (bool, locker.UnlockFunc, error))</a>

```
searchKey: commitgraph.LockerLockFunc.PushHook
tags: [method private]
```

```Go
func (f *LockerLockFunc) PushHook(hook func(context.Context, int, bool) (bool, locker.UnlockFunc, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Lock method of the parent MockLocker instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="LockerLockFunc.PushReturn" href="#LockerLockFunc.PushReturn">func (f *LockerLockFunc) PushReturn(r0 bool, r1 locker.UnlockFunc, r2 error)</a>

```
searchKey: commitgraph.LockerLockFunc.PushReturn
tags: [method private]
```

```Go
func (f *LockerLockFunc) PushReturn(r0 bool, r1 locker.UnlockFunc, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="LockerLockFunc.SetDefaultHook" href="#LockerLockFunc.SetDefaultHook">func (f *LockerLockFunc) SetDefaultHook(hook func(context.Context, int, bool) (bool, locker.UnlockFunc, error))</a>

```
searchKey: commitgraph.LockerLockFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *LockerLockFunc) SetDefaultHook(hook func(context.Context, int, bool) (bool, locker.UnlockFunc, error))
```

SetDefaultHook sets function that is called when the Lock method of the parent MockLocker instance is invoked and the hook queue is empty. 

#### <a id="LockerLockFunc.SetDefaultReturn" href="#LockerLockFunc.SetDefaultReturn">func (f *LockerLockFunc) SetDefaultReturn(r0 bool, r1 locker.UnlockFunc, r2 error)</a>

```
searchKey: commitgraph.LockerLockFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *LockerLockFunc) SetDefaultReturn(r0 bool, r1 locker.UnlockFunc, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="LockerLockFunc.appendCall" href="#LockerLockFunc.appendCall">func (f *LockerLockFunc) appendCall(r0 LockerLockFuncCall)</a>

```
searchKey: commitgraph.LockerLockFunc.appendCall
tags: [method private]
```

```Go
func (f *LockerLockFunc) appendCall(r0 LockerLockFuncCall)
```

#### <a id="LockerLockFunc.nextHook" href="#LockerLockFunc.nextHook">func (f *LockerLockFunc) nextHook() func(context.Context, int, bool) (bool, locker.UnlockFunc, error)</a>

```
searchKey: commitgraph.LockerLockFunc.nextHook
tags: [function private]
```

```Go
func (f *LockerLockFunc) nextHook() func(context.Context, int, bool) (bool, locker.UnlockFunc, error)
```

### <a id="LockerLockFuncCall" href="#LockerLockFuncCall">type LockerLockFuncCall struct</a>

```
searchKey: commitgraph.LockerLockFuncCall
tags: [struct private]
```

```Go
type LockerLockFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 bool
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 bool
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 locker.UnlockFunc
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

LockerLockFuncCall is an object that describes an invocation of method Lock on an instance of MockLocker. 

#### <a id="LockerLockFuncCall.Args" href="#LockerLockFuncCall.Args">func (c LockerLockFuncCall) Args() []interface{}</a>

```
searchKey: commitgraph.LockerLockFuncCall.Args
tags: [function private]
```

```Go
func (c LockerLockFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="LockerLockFuncCall.Results" href="#LockerLockFuncCall.Results">func (c LockerLockFuncCall) Results() []interface{}</a>

```
searchKey: commitgraph.LockerLockFuncCall.Results
tags: [function private]
```

```Go
func (c LockerLockFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockDBStore" href="#MockDBStore">type MockDBStore struct</a>

```
searchKey: commitgraph.MockDBStore
tags: [struct private]
```

```Go
type MockDBStore struct {
	// CalculateVisibleUploadsFunc is an instance of a mock function object
	// controlling the behavior of the method CalculateVisibleUploads.
	CalculateVisibleUploadsFunc *DBStoreCalculateVisibleUploadsFunc
	// DirtyRepositoriesFunc is an instance of a mock function object
	// controlling the behavior of the method DirtyRepositories.
	DirtyRepositoriesFunc *DBStoreDirtyRepositoriesFunc
	// GetOldestCommitDateFunc is an instance of a mock function object
	// controlling the behavior of the method GetOldestCommitDate.
	GetOldestCommitDateFunc *DBStoreGetOldestCommitDateFunc
}
```

MockDBStore is a mock implementation of the DBStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/worker/internal/codeintel/commitgraph) used for unit testing. 

#### <a id="NewMockDBStore" href="#NewMockDBStore">func NewMockDBStore() *MockDBStore</a>

```
searchKey: commitgraph.NewMockDBStore
tags: [function private]
```

```Go
func NewMockDBStore() *MockDBStore
```

NewMockDBStore creates a new mock of the DBStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockDBStoreFrom" href="#NewMockDBStoreFrom">func NewMockDBStoreFrom(i DBStore) *MockDBStore</a>

```
searchKey: commitgraph.NewMockDBStoreFrom
tags: [method private]
```

```Go
func NewMockDBStoreFrom(i DBStore) *MockDBStore
```

NewMockDBStoreFrom creates a new mock of the MockDBStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockDBStore.CalculateVisibleUploads" href="#MockDBStore.CalculateVisibleUploads">func (m *MockDBStore) CalculateVisibleUploads(v0 context.Context, v1 int, v2 *gitserver.CommitGraph, v3 string, v4 int, v5 time.Time) error</a>

```
searchKey: commitgraph.MockDBStore.CalculateVisibleUploads
tags: [method private]
```

```Go
func (m *MockDBStore) CalculateVisibleUploads(v0 context.Context, v1 int, v2 *gitserver.CommitGraph, v3 string, v4 int, v5 time.Time) error
```

CalculateVisibleUploads delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.DirtyRepositories" href="#MockDBStore.DirtyRepositories">func (m *MockDBStore) DirtyRepositories(v0 context.Context) (map[int]int, error)</a>

```
searchKey: commitgraph.MockDBStore.DirtyRepositories
tags: [method private]
```

```Go
func (m *MockDBStore) DirtyRepositories(v0 context.Context) (map[int]int, error)
```

DirtyRepositories delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetOldestCommitDate" href="#MockDBStore.GetOldestCommitDate">func (m *MockDBStore) GetOldestCommitDate(v0 context.Context, v1 int) (time.Time, bool, error)</a>

```
searchKey: commitgraph.MockDBStore.GetOldestCommitDate
tags: [method private]
```

```Go
func (m *MockDBStore) GetOldestCommitDate(v0 context.Context, v1 int) (time.Time, bool, error)
```

GetOldestCommitDate delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MockGitserverClient" href="#MockGitserverClient">type MockGitserverClient struct</a>

```
searchKey: commitgraph.MockGitserverClient
tags: [struct private]
```

```Go
type MockGitserverClient struct {
	// CommitGraphFunc is an instance of a mock function object controlling
	// the behavior of the method CommitGraph.
	CommitGraphFunc *GitserverClientCommitGraphFunc
	// HeadFunc is an instance of a mock function object controlling the
	// behavior of the method Head.
	HeadFunc *GitserverClientHeadFunc
}
```

MockGitserverClient is a mock implementation of the GitserverClient interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/worker/internal/codeintel/commitgraph) used for unit testing. 

#### <a id="NewMockGitserverClient" href="#NewMockGitserverClient">func NewMockGitserverClient() *MockGitserverClient</a>

```
searchKey: commitgraph.NewMockGitserverClient
tags: [function private]
```

```Go
func NewMockGitserverClient() *MockGitserverClient
```

NewMockGitserverClient creates a new mock of the GitserverClient interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockGitserverClientFrom" href="#NewMockGitserverClientFrom">func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient</a>

```
searchKey: commitgraph.NewMockGitserverClientFrom
tags: [method private]
```

```Go
func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient
```

NewMockGitserverClientFrom creates a new mock of the MockGitserverClient interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockGitserverClient.CommitGraph" href="#MockGitserverClient.CommitGraph">func (m *MockGitserverClient) CommitGraph(v0 context.Context, v1 int, v2 gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)</a>

```
searchKey: commitgraph.MockGitserverClient.CommitGraph
tags: [method private]
```

```Go
func (m *MockGitserverClient) CommitGraph(v0 context.Context, v1 int, v2 gitserver.CommitGraphOptions) (*gitserver.CommitGraph, error)
```

CommitGraph delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGitserverClient.Head" href="#MockGitserverClient.Head">func (m *MockGitserverClient) Head(v0 context.Context, v1 int) (string, error)</a>

```
searchKey: commitgraph.MockGitserverClient.Head
tags: [method private]
```

```Go
func (m *MockGitserverClient) Head(v0 context.Context, v1 int) (string, error)
```

Head delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MockLocker" href="#MockLocker">type MockLocker struct</a>

```
searchKey: commitgraph.MockLocker
tags: [struct private]
```

```Go
type MockLocker struct {
	// LockFunc is an instance of a mock function object controlling the
	// behavior of the method Lock.
	LockFunc *LockerLockFunc
}
```

MockLocker is a mock implementation of the Locker interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/worker/internal/codeintel/commitgraph) used for unit testing. 

#### <a id="NewMockLocker" href="#NewMockLocker">func NewMockLocker() *MockLocker</a>

```
searchKey: commitgraph.NewMockLocker
tags: [function private]
```

```Go
func NewMockLocker() *MockLocker
```

NewMockLocker creates a new mock of the Locker interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockLockerFrom" href="#NewMockLockerFrom">func NewMockLockerFrom(i Locker) *MockLocker</a>

```
searchKey: commitgraph.NewMockLockerFrom
tags: [method private]
```

```Go
func NewMockLockerFrom(i Locker) *MockLocker
```

NewMockLockerFrom creates a new mock of the MockLocker interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockLocker.Lock" href="#MockLocker.Lock">func (m *MockLocker) Lock(v0 context.Context, v1 int, v2 bool) (bool, locker.UnlockFunc, error)</a>

```
searchKey: commitgraph.MockLocker.Lock
tags: [method private]
```

```Go
func (m *MockLocker) Lock(v0 context.Context, v1 int, v2 bool) (bool, locker.UnlockFunc, error)
```

Lock delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="Updater" href="#Updater">type Updater struct</a>

```
searchKey: commitgraph.Updater
tags: [struct]
```

```Go
type Updater struct {
	dbStore         DBStore
	locker          Locker
	gitserverClient GitserverClient
	operations      *operations
}
```

Updater periodically re-calculates the commit and upload visibility graph for repositories that are marked as dirty by the worker process. This is done out-of-band from the rest of the upload processing as it is likely that we are processing multiple uploads concurrently for the same repository and should not repeat the work since the last calculation performed will always be the one we want. 

#### <a id="Updater.Handle" href="#Updater.Handle">func (u *Updater) Handle(ctx context.Context) error</a>

```
searchKey: commitgraph.Updater.Handle
tags: [method]
```

```Go
func (u *Updater) Handle(ctx context.Context) error
```

Handle checks for dirty repositories and invokes the underlying updater on each one. 

#### <a id="Updater.HandleError" href="#Updater.HandleError">func (u *Updater) HandleError(err error)</a>

```
searchKey: commitgraph.Updater.HandleError
tags: [method]
```

```Go
func (u *Updater) HandleError(err error)
```

#### <a id="Updater.getCommitGraph" href="#Updater.getCommitGraph">func (u *Updater) getCommitGraph(ctx context.Context, repositoryID int) (*gitserver.CommitGraph, error)</a>

```
searchKey: commitgraph.Updater.getCommitGraph
tags: [method private]
```

```Go
func (u *Updater) getCommitGraph(ctx context.Context, repositoryID int) (*gitserver.CommitGraph, error)
```

getCommitGraph builds a partial commit graph that includes the most recent commits on each branch extending back as as the date of the oldest commit for which we have a processed upload for this repository. 

This optimization is necessary as decorating the commit graph is an operation that scales with the size of both the git graph and the number of uploads (multiplicatively). For repositories with a very large number of commits or distinct roots (most monorepos) this is a necessary optimization. 

The number of commits pulled back here should not grow over time unless the repo is growing at an accelerating rate, as we routinely expire old information for active repositories in a janitor process. 

#### <a id="Updater.tryUpdate" href="#Updater.tryUpdate">func (u *Updater) tryUpdate(ctx context.Context, repositoryID, dirtyToken int) (err error)</a>

```
searchKey: commitgraph.Updater.tryUpdate
tags: [method private]
```

```Go
func (u *Updater) tryUpdate(ctx context.Context, repositoryID, dirtyToken int) (err error)
```

tryUpdate will call update while holding an advisory lock to give exclusive access to the update procedure for this repository. If the lock is already held, this method will simply do nothing. 

#### <a id="Updater.update" href="#Updater.update">func (u *Updater) update(ctx context.Context, repositoryID, dirtyToken int) (err error)</a>

```
searchKey: commitgraph.Updater.update
tags: [method private]
```

```Go
func (u *Updater) update(ctx context.Context, repositoryID, dirtyToken int) (err error)
```

update pulls the commit graph for the given repository from gitserver, pulls the set of LSIF upload objects for the given repository from Postgres, and correlates them into a visibility graph. This graph is then upserted back into Postgres for use by find closest dumps queries. 

The user should supply a dirty token that is associated with the given repository so that the repository can be unmarked as long as the repository is not marked as dirty again before the update completes. 

### <a id="operations" href="#operations">type operations struct</a>

```
searchKey: commitgraph.operations
tags: [struct private]
```

```Go
type operations struct {
	commitUpdate *observation.Operation
}
```

#### <a id="newOperations" href="#newOperations">func newOperations(dbStore DBStore, observationContext *observation.Context) *operations</a>

```
searchKey: commitgraph.newOperations
tags: [method private]
```

```Go
func newOperations(dbStore DBStore, observationContext *observation.Context) *operations
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="NewUpdater" href="#NewUpdater">func NewUpdater(dbStore DBStore,...</a>

```
searchKey: commitgraph.NewUpdater
tags: [method]
```

```Go
func NewUpdater(
	dbStore DBStore,
	locker Locker,
	gitserverClient GitserverClient,
	interval time.Duration,
	observationContext *observation.Context,
) goroutine.BackgroundRoutine
```

NewUpdater returns a background routine that periodically updates the commit graph and visible uploads for each repository marked as dirty. 

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: commitgraph.TestMain
tags: [method private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestUpdater" href="#TestUpdater">func TestUpdater(t *testing.T)</a>

```
searchKey: commitgraph.TestUpdater
tags: [method private test]
```

```Go
func TestUpdater(t *testing.T)
```

### <a id="TestUpdaterLocked" href="#TestUpdaterLocked">func TestUpdaterLocked(t *testing.T)</a>

```
searchKey: commitgraph.TestUpdaterLocked
tags: [method private test]
```

```Go
func TestUpdaterLocked(t *testing.T)
```

### <a id="TestUpdaterNoUploads" href="#TestUpdaterNoUploads">func TestUpdaterNoUploads(t *testing.T)</a>

```
searchKey: commitgraph.TestUpdaterNoUploads
tags: [method private test]
```

```Go
func TestUpdaterNoUploads(t *testing.T)
```

