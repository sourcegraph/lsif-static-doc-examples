# Package mocks

## Index

* [Types](#type)
    * [type MockStore struct](#MockStore)
        * [func NewMockStore() *MockStore](#NewMockStore)
        * [func NewMockStoreFrom(i store.Store) *MockStore](#NewMockStoreFrom)
        * [func (m *MockStore) AddExecutionLogEntry(v0 context.Context, v1 int, v2 workerutil.ExecutionLogEntry) error](#MockStore.AddExecutionLogEntry)
        * [func (m *MockStore) Dequeue(v0 context.Context, v1 []*sqlf.Query) (workerutil.Record, store.Store, bool, error)](#MockStore.Dequeue)
        * [func (m *MockStore) DequeueWithIndependentTransactionContext(v0 context.Context, v1 []*sqlf.Query) (workerutil.Record, store.Store, bool, error)](#MockStore.DequeueWithIndependentTransactionContext)
        * [func (m *MockStore) Done(v0 error) error](#MockStore.Done)
        * [func (m *MockStore) Handle() *basestore.TransactableHandle](#MockStore.Handle)
        * [func (m *MockStore) MarkComplete(v0 context.Context, v1 int) (bool, error)](#MockStore.MarkComplete)
        * [func (m *MockStore) MarkErrored(v0 context.Context, v1 int, v2 string) (bool, error)](#MockStore.MarkErrored)
        * [func (m *MockStore) MarkFailed(v0 context.Context, v1 int, v2 string) (bool, error)](#MockStore.MarkFailed)
        * [func (m *MockStore) QueuedCount(v0 context.Context, v1 []*sqlf.Query) (int, error)](#MockStore.QueuedCount)
        * [func (m *MockStore) Requeue(v0 context.Context, v1 int, v2 time.Time) error](#MockStore.Requeue)
        * [func (m *MockStore) ResetStalled(v0 context.Context) ([]int, []int, error)](#MockStore.ResetStalled)
    * [type StoreAddExecutionLogEntryFunc struct](#StoreAddExecutionLogEntryFunc)
        * [func (f *StoreAddExecutionLogEntryFunc) History() []StoreAddExecutionLogEntryFuncCall](#StoreAddExecutionLogEntryFunc.History)
        * [func (f *StoreAddExecutionLogEntryFunc) PushHook(hook func(context.Context, int, workerutil.ExecutionLogEntry) error)](#StoreAddExecutionLogEntryFunc.PushHook)
        * [func (f *StoreAddExecutionLogEntryFunc) PushReturn(r0 error)](#StoreAddExecutionLogEntryFunc.PushReturn)
        * [func (f *StoreAddExecutionLogEntryFunc) SetDefaultHook(hook func(context.Context, int, workerutil.ExecutionLogEntry) error)](#StoreAddExecutionLogEntryFunc.SetDefaultHook)
        * [func (f *StoreAddExecutionLogEntryFunc) SetDefaultReturn(r0 error)](#StoreAddExecutionLogEntryFunc.SetDefaultReturn)
        * [func (f *StoreAddExecutionLogEntryFunc) appendCall(r0 StoreAddExecutionLogEntryFuncCall)](#StoreAddExecutionLogEntryFunc.appendCall)
        * [func (f *StoreAddExecutionLogEntryFunc) nextHook() func(context.Context, int, workerutil.ExecutionLogEntry) error](#StoreAddExecutionLogEntryFunc.nextHook)
    * [type StoreAddExecutionLogEntryFuncCall struct](#StoreAddExecutionLogEntryFuncCall)
        * [func (c StoreAddExecutionLogEntryFuncCall) Args() []interface{}](#StoreAddExecutionLogEntryFuncCall.Args)
        * [func (c StoreAddExecutionLogEntryFuncCall) Results() []interface{}](#StoreAddExecutionLogEntryFuncCall.Results)
    * [type StoreDequeueFunc struct](#StoreDequeueFunc)
        * [func (f *StoreDequeueFunc) History() []StoreDequeueFuncCall](#StoreDequeueFunc.History)
        * [func (f *StoreDequeueFunc) PushHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))](#StoreDequeueFunc.PushHook)
        * [func (f *StoreDequeueFunc) PushReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)](#StoreDequeueFunc.PushReturn)
        * [func (f *StoreDequeueFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))](#StoreDequeueFunc.SetDefaultHook)
        * [func (f *StoreDequeueFunc) SetDefaultReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)](#StoreDequeueFunc.SetDefaultReturn)
        * [func (f *StoreDequeueFunc) appendCall(r0 StoreDequeueFuncCall)](#StoreDequeueFunc.appendCall)
        * [func (f *StoreDequeueFunc) nextHook() func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)](#StoreDequeueFunc.nextHook)
    * [type StoreDequeueFuncCall struct](#StoreDequeueFuncCall)
        * [func (c StoreDequeueFuncCall) Args() []interface{}](#StoreDequeueFuncCall.Args)
        * [func (c StoreDequeueFuncCall) Results() []interface{}](#StoreDequeueFuncCall.Results)
    * [type StoreDequeueWithIndependentTransactionContextFunc struct](#StoreDequeueWithIndependentTransactionContextFunc)
        * [func (f *StoreDequeueWithIndependentTransactionContextFunc) History() []StoreDequeueWithIndependentTransactionContextFuncCall](#StoreDequeueWithIndependentTransactionContextFunc.History)
        * [func (f *StoreDequeueWithIndependentTransactionContextFunc) PushHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))](#StoreDequeueWithIndependentTransactionContextFunc.PushHook)
        * [func (f *StoreDequeueWithIndependentTransactionContextFunc) PushReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)](#StoreDequeueWithIndependentTransactionContextFunc.PushReturn)
        * [func (f *StoreDequeueWithIndependentTransactionContextFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))](#StoreDequeueWithIndependentTransactionContextFunc.SetDefaultHook)
        * [func (f *StoreDequeueWithIndependentTransactionContextFunc) SetDefaultReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)](#StoreDequeueWithIndependentTransactionContextFunc.SetDefaultReturn)
        * [func (f *StoreDequeueWithIndependentTransactionContextFunc) appendCall(r0 StoreDequeueWithIndependentTransactionContextFuncCall)](#StoreDequeueWithIndependentTransactionContextFunc.appendCall)
        * [func (f *StoreDequeueWithIndependentTransactionContextFunc) nextHook() func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)](#StoreDequeueWithIndependentTransactionContextFunc.nextHook)
    * [type StoreDequeueWithIndependentTransactionContextFuncCall struct](#StoreDequeueWithIndependentTransactionContextFuncCall)
        * [func (c StoreDequeueWithIndependentTransactionContextFuncCall) Args() []interface{}](#StoreDequeueWithIndependentTransactionContextFuncCall.Args)
        * [func (c StoreDequeueWithIndependentTransactionContextFuncCall) Results() []interface{}](#StoreDequeueWithIndependentTransactionContextFuncCall.Results)
    * [type StoreDoneFunc struct](#StoreDoneFunc)
        * [func (f *StoreDoneFunc) History() []StoreDoneFuncCall](#StoreDoneFunc.History)
        * [func (f *StoreDoneFunc) PushHook(hook func(error) error)](#StoreDoneFunc.PushHook)
        * [func (f *StoreDoneFunc) PushReturn(r0 error)](#StoreDoneFunc.PushReturn)
        * [func (f *StoreDoneFunc) SetDefaultHook(hook func(error) error)](#StoreDoneFunc.SetDefaultHook)
        * [func (f *StoreDoneFunc) SetDefaultReturn(r0 error)](#StoreDoneFunc.SetDefaultReturn)
        * [func (f *StoreDoneFunc) appendCall(r0 StoreDoneFuncCall)](#StoreDoneFunc.appendCall)
        * [func (f *StoreDoneFunc) nextHook() func(error) error](#StoreDoneFunc.nextHook)
    * [type StoreDoneFuncCall struct](#StoreDoneFuncCall)
        * [func (c StoreDoneFuncCall) Args() []interface{}](#StoreDoneFuncCall.Args)
        * [func (c StoreDoneFuncCall) Results() []interface{}](#StoreDoneFuncCall.Results)
    * [type StoreHandleFunc struct](#StoreHandleFunc)
        * [func (f *StoreHandleFunc) History() []StoreHandleFuncCall](#StoreHandleFunc.History)
        * [func (f *StoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)](#StoreHandleFunc.PushHook)
        * [func (f *StoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)](#StoreHandleFunc.PushReturn)
        * [func (f *StoreHandleFunc) SetDefaultHook(hook func() *basestore.TransactableHandle)](#StoreHandleFunc.SetDefaultHook)
        * [func (f *StoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)](#StoreHandleFunc.SetDefaultReturn)
        * [func (f *StoreHandleFunc) appendCall(r0 StoreHandleFuncCall)](#StoreHandleFunc.appendCall)
        * [func (f *StoreHandleFunc) nextHook() func() *basestore.TransactableHandle](#StoreHandleFunc.nextHook)
    * [type StoreHandleFuncCall struct](#StoreHandleFuncCall)
        * [func (c StoreHandleFuncCall) Args() []interface{}](#StoreHandleFuncCall.Args)
        * [func (c StoreHandleFuncCall) Results() []interface{}](#StoreHandleFuncCall.Results)
    * [type StoreMarkCompleteFunc struct](#StoreMarkCompleteFunc)
        * [func (f *StoreMarkCompleteFunc) History() []StoreMarkCompleteFuncCall](#StoreMarkCompleteFunc.History)
        * [func (f *StoreMarkCompleteFunc) PushHook(hook func(context.Context, int) (bool, error))](#StoreMarkCompleteFunc.PushHook)
        * [func (f *StoreMarkCompleteFunc) PushReturn(r0 bool, r1 error)](#StoreMarkCompleteFunc.PushReturn)
        * [func (f *StoreMarkCompleteFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))](#StoreMarkCompleteFunc.SetDefaultHook)
        * [func (f *StoreMarkCompleteFunc) SetDefaultReturn(r0 bool, r1 error)](#StoreMarkCompleteFunc.SetDefaultReturn)
        * [func (f *StoreMarkCompleteFunc) appendCall(r0 StoreMarkCompleteFuncCall)](#StoreMarkCompleteFunc.appendCall)
        * [func (f *StoreMarkCompleteFunc) nextHook() func(context.Context, int) (bool, error)](#StoreMarkCompleteFunc.nextHook)
    * [type StoreMarkCompleteFuncCall struct](#StoreMarkCompleteFuncCall)
        * [func (c StoreMarkCompleteFuncCall) Args() []interface{}](#StoreMarkCompleteFuncCall.Args)
        * [func (c StoreMarkCompleteFuncCall) Results() []interface{}](#StoreMarkCompleteFuncCall.Results)
    * [type StoreMarkErroredFunc struct](#StoreMarkErroredFunc)
        * [func (f *StoreMarkErroredFunc) History() []StoreMarkErroredFuncCall](#StoreMarkErroredFunc.History)
        * [func (f *StoreMarkErroredFunc) PushHook(hook func(context.Context, int, string) (bool, error))](#StoreMarkErroredFunc.PushHook)
        * [func (f *StoreMarkErroredFunc) PushReturn(r0 bool, r1 error)](#StoreMarkErroredFunc.PushReturn)
        * [func (f *StoreMarkErroredFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))](#StoreMarkErroredFunc.SetDefaultHook)
        * [func (f *StoreMarkErroredFunc) SetDefaultReturn(r0 bool, r1 error)](#StoreMarkErroredFunc.SetDefaultReturn)
        * [func (f *StoreMarkErroredFunc) appendCall(r0 StoreMarkErroredFuncCall)](#StoreMarkErroredFunc.appendCall)
        * [func (f *StoreMarkErroredFunc) nextHook() func(context.Context, int, string) (bool, error)](#StoreMarkErroredFunc.nextHook)
    * [type StoreMarkErroredFuncCall struct](#StoreMarkErroredFuncCall)
        * [func (c StoreMarkErroredFuncCall) Args() []interface{}](#StoreMarkErroredFuncCall.Args)
        * [func (c StoreMarkErroredFuncCall) Results() []interface{}](#StoreMarkErroredFuncCall.Results)
    * [type StoreMarkFailedFunc struct](#StoreMarkFailedFunc)
        * [func (f *StoreMarkFailedFunc) History() []StoreMarkFailedFuncCall](#StoreMarkFailedFunc.History)
        * [func (f *StoreMarkFailedFunc) PushHook(hook func(context.Context, int, string) (bool, error))](#StoreMarkFailedFunc.PushHook)
        * [func (f *StoreMarkFailedFunc) PushReturn(r0 bool, r1 error)](#StoreMarkFailedFunc.PushReturn)
        * [func (f *StoreMarkFailedFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))](#StoreMarkFailedFunc.SetDefaultHook)
        * [func (f *StoreMarkFailedFunc) SetDefaultReturn(r0 bool, r1 error)](#StoreMarkFailedFunc.SetDefaultReturn)
        * [func (f *StoreMarkFailedFunc) appendCall(r0 StoreMarkFailedFuncCall)](#StoreMarkFailedFunc.appendCall)
        * [func (f *StoreMarkFailedFunc) nextHook() func(context.Context, int, string) (bool, error)](#StoreMarkFailedFunc.nextHook)
    * [type StoreMarkFailedFuncCall struct](#StoreMarkFailedFuncCall)
        * [func (c StoreMarkFailedFuncCall) Args() []interface{}](#StoreMarkFailedFuncCall.Args)
        * [func (c StoreMarkFailedFuncCall) Results() []interface{}](#StoreMarkFailedFuncCall.Results)
    * [type StoreQueuedCountFunc struct](#StoreQueuedCountFunc)
        * [func (f *StoreQueuedCountFunc) History() []StoreQueuedCountFuncCall](#StoreQueuedCountFunc.History)
        * [func (f *StoreQueuedCountFunc) PushHook(hook func(context.Context, []*sqlf.Query) (int, error))](#StoreQueuedCountFunc.PushHook)
        * [func (f *StoreQueuedCountFunc) PushReturn(r0 int, r1 error)](#StoreQueuedCountFunc.PushReturn)
        * [func (f *StoreQueuedCountFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (int, error))](#StoreQueuedCountFunc.SetDefaultHook)
        * [func (f *StoreQueuedCountFunc) SetDefaultReturn(r0 int, r1 error)](#StoreQueuedCountFunc.SetDefaultReturn)
        * [func (f *StoreQueuedCountFunc) appendCall(r0 StoreQueuedCountFuncCall)](#StoreQueuedCountFunc.appendCall)
        * [func (f *StoreQueuedCountFunc) nextHook() func(context.Context, []*sqlf.Query) (int, error)](#StoreQueuedCountFunc.nextHook)
    * [type StoreQueuedCountFuncCall struct](#StoreQueuedCountFuncCall)
        * [func (c StoreQueuedCountFuncCall) Args() []interface{}](#StoreQueuedCountFuncCall.Args)
        * [func (c StoreQueuedCountFuncCall) Results() []interface{}](#StoreQueuedCountFuncCall.Results)
    * [type StoreRequeueFunc struct](#StoreRequeueFunc)
        * [func (f *StoreRequeueFunc) History() []StoreRequeueFuncCall](#StoreRequeueFunc.History)
        * [func (f *StoreRequeueFunc) PushHook(hook func(context.Context, int, time.Time) error)](#StoreRequeueFunc.PushHook)
        * [func (f *StoreRequeueFunc) PushReturn(r0 error)](#StoreRequeueFunc.PushReturn)
        * [func (f *StoreRequeueFunc) SetDefaultHook(hook func(context.Context, int, time.Time) error)](#StoreRequeueFunc.SetDefaultHook)
        * [func (f *StoreRequeueFunc) SetDefaultReturn(r0 error)](#StoreRequeueFunc.SetDefaultReturn)
        * [func (f *StoreRequeueFunc) appendCall(r0 StoreRequeueFuncCall)](#StoreRequeueFunc.appendCall)
        * [func (f *StoreRequeueFunc) nextHook() func(context.Context, int, time.Time) error](#StoreRequeueFunc.nextHook)
    * [type StoreRequeueFuncCall struct](#StoreRequeueFuncCall)
        * [func (c StoreRequeueFuncCall) Args() []interface{}](#StoreRequeueFuncCall.Args)
        * [func (c StoreRequeueFuncCall) Results() []interface{}](#StoreRequeueFuncCall.Results)
    * [type StoreResetStalledFunc struct](#StoreResetStalledFunc)
        * [func (f *StoreResetStalledFunc) History() []StoreResetStalledFuncCall](#StoreResetStalledFunc.History)
        * [func (f *StoreResetStalledFunc) PushHook(hook func(context.Context) ([]int, []int, error))](#StoreResetStalledFunc.PushHook)
        * [func (f *StoreResetStalledFunc) PushReturn(r0 []int, r1 []int, r2 error)](#StoreResetStalledFunc.PushReturn)
        * [func (f *StoreResetStalledFunc) SetDefaultHook(hook func(context.Context) ([]int, []int, error))](#StoreResetStalledFunc.SetDefaultHook)
        * [func (f *StoreResetStalledFunc) SetDefaultReturn(r0 []int, r1 []int, r2 error)](#StoreResetStalledFunc.SetDefaultReturn)
        * [func (f *StoreResetStalledFunc) appendCall(r0 StoreResetStalledFuncCall)](#StoreResetStalledFunc.appendCall)
        * [func (f *StoreResetStalledFunc) nextHook() func(context.Context) ([]int, []int, error)](#StoreResetStalledFunc.nextHook)
    * [type StoreResetStalledFuncCall struct](#StoreResetStalledFuncCall)
        * [func (c StoreResetStalledFuncCall) Args() []interface{}](#StoreResetStalledFuncCall.Args)
        * [func (c StoreResetStalledFuncCall) Results() []interface{}](#StoreResetStalledFuncCall.Results)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="MockStore" href="#MockStore">type MockStore struct</a>

```
searchKey: mocks.MockStore
tags: [struct]
```

```Go
type MockStore struct {
	// AddExecutionLogEntryFunc is an instance of a mock function object
	// controlling the behavior of the method AddExecutionLogEntry.
	AddExecutionLogEntryFunc *StoreAddExecutionLogEntryFunc
	// DequeueFunc is an instance of a mock function object controlling the
	// behavior of the method Dequeue.
	DequeueFunc *StoreDequeueFunc
	// DequeueWithIndependentTransactionContextFunc is an instance of a mock
	// function object controlling the behavior of the method
	// DequeueWithIndependentTransactionContext.
	DequeueWithIndependentTransactionContextFunc *StoreDequeueWithIndependentTransactionContextFunc
	// DoneFunc is an instance of a mock function object controlling the
	// behavior of the method Done.
	DoneFunc *StoreDoneFunc
	// HandleFunc is an instance of a mock function object controlling the
	// behavior of the method Handle.
	HandleFunc *StoreHandleFunc
	// MarkCompleteFunc is an instance of a mock function object controlling
	// the behavior of the method MarkComplete.
	MarkCompleteFunc *StoreMarkCompleteFunc
	// MarkErroredFunc is an instance of a mock function object controlling
	// the behavior of the method MarkErrored.
	MarkErroredFunc *StoreMarkErroredFunc
	// MarkFailedFunc is an instance of a mock function object controlling
	// the behavior of the method MarkFailed.
	MarkFailedFunc *StoreMarkFailedFunc
	// QueuedCountFunc is an instance of a mock function object controlling
	// the behavior of the method QueuedCount.
	QueuedCountFunc *StoreQueuedCountFunc
	// RequeueFunc is an instance of a mock function object controlling the
	// behavior of the method Requeue.
	RequeueFunc *StoreRequeueFunc
	// ResetStalledFunc is an instance of a mock function object controlling
	// the behavior of the method ResetStalled.
	ResetStalledFunc *StoreResetStalledFunc
}
```

MockStore is a mock implementation of the Store interface (from the package github.com/sourcegraph/sourcegraph/internal/workerutil/dbworker/store) used for unit testing. 

#### <a id="NewMockStore" href="#NewMockStore">func NewMockStore() *MockStore</a>

```
searchKey: mocks.NewMockStore
tags: [function]
```

```Go
func NewMockStore() *MockStore
```

NewMockStore creates a new mock of the Store interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockStoreFrom" href="#NewMockStoreFrom">func NewMockStoreFrom(i store.Store) *MockStore</a>

```
searchKey: mocks.NewMockStoreFrom
tags: [method]
```

```Go
func NewMockStoreFrom(i store.Store) *MockStore
```

NewMockStoreFrom creates a new mock of the MockStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockStore.AddExecutionLogEntry" href="#MockStore.AddExecutionLogEntry">func (m *MockStore) AddExecutionLogEntry(v0 context.Context, v1 int, v2 workerutil.ExecutionLogEntry) error</a>

```
searchKey: mocks.MockStore.AddExecutionLogEntry
tags: [method]
```

```Go
func (m *MockStore) AddExecutionLogEntry(v0 context.Context, v1 int, v2 workerutil.ExecutionLogEntry) error
```

AddExecutionLogEntry delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.Dequeue" href="#MockStore.Dequeue">func (m *MockStore) Dequeue(v0 context.Context, v1 []*sqlf.Query) (workerutil.Record, store.Store, bool, error)</a>

```
searchKey: mocks.MockStore.Dequeue
tags: [method]
```

```Go
func (m *MockStore) Dequeue(v0 context.Context, v1 []*sqlf.Query) (workerutil.Record, store.Store, bool, error)
```

Dequeue delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.DequeueWithIndependentTransactionContext" href="#MockStore.DequeueWithIndependentTransactionContext">func (m *MockStore) DequeueWithIndependentTransactionContext(v0 context.Context, v1 []*sqlf.Query) (workerutil.Record, store.Store, bool, error)</a>

```
searchKey: mocks.MockStore.DequeueWithIndependentTransactionContext
tags: [method]
```

```Go
func (m *MockStore) DequeueWithIndependentTransactionContext(v0 context.Context, v1 []*sqlf.Query) (workerutil.Record, store.Store, bool, error)
```

DequeueWithIndependentTransactionContext delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.Done" href="#MockStore.Done">func (m *MockStore) Done(v0 error) error</a>

```
searchKey: mocks.MockStore.Done
tags: [method]
```

```Go
func (m *MockStore) Done(v0 error) error
```

Done delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.Handle" href="#MockStore.Handle">func (m *MockStore) Handle() *basestore.TransactableHandle</a>

```
searchKey: mocks.MockStore.Handle
tags: [function]
```

```Go
func (m *MockStore) Handle() *basestore.TransactableHandle
```

Handle delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.MarkComplete" href="#MockStore.MarkComplete">func (m *MockStore) MarkComplete(v0 context.Context, v1 int) (bool, error)</a>

```
searchKey: mocks.MockStore.MarkComplete
tags: [method]
```

```Go
func (m *MockStore) MarkComplete(v0 context.Context, v1 int) (bool, error)
```

MarkComplete delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.MarkErrored" href="#MockStore.MarkErrored">func (m *MockStore) MarkErrored(v0 context.Context, v1 int, v2 string) (bool, error)</a>

```
searchKey: mocks.MockStore.MarkErrored
tags: [method]
```

```Go
func (m *MockStore) MarkErrored(v0 context.Context, v1 int, v2 string) (bool, error)
```

MarkErrored delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.MarkFailed" href="#MockStore.MarkFailed">func (m *MockStore) MarkFailed(v0 context.Context, v1 int, v2 string) (bool, error)</a>

```
searchKey: mocks.MockStore.MarkFailed
tags: [method]
```

```Go
func (m *MockStore) MarkFailed(v0 context.Context, v1 int, v2 string) (bool, error)
```

MarkFailed delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.QueuedCount" href="#MockStore.QueuedCount">func (m *MockStore) QueuedCount(v0 context.Context, v1 []*sqlf.Query) (int, error)</a>

```
searchKey: mocks.MockStore.QueuedCount
tags: [method]
```

```Go
func (m *MockStore) QueuedCount(v0 context.Context, v1 []*sqlf.Query) (int, error)
```

QueuedCount delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.Requeue" href="#MockStore.Requeue">func (m *MockStore) Requeue(v0 context.Context, v1 int, v2 time.Time) error</a>

```
searchKey: mocks.MockStore.Requeue
tags: [method]
```

```Go
func (m *MockStore) Requeue(v0 context.Context, v1 int, v2 time.Time) error
```

Requeue delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.ResetStalled" href="#MockStore.ResetStalled">func (m *MockStore) ResetStalled(v0 context.Context) ([]int, []int, error)</a>

```
searchKey: mocks.MockStore.ResetStalled
tags: [method]
```

```Go
func (m *MockStore) ResetStalled(v0 context.Context) ([]int, []int, error)
```

ResetStalled delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="StoreAddExecutionLogEntryFunc" href="#StoreAddExecutionLogEntryFunc">type StoreAddExecutionLogEntryFunc struct</a>

```
searchKey: mocks.StoreAddExecutionLogEntryFunc
tags: [struct]
```

```Go
type StoreAddExecutionLogEntryFunc struct {
	defaultHook func(context.Context, int, workerutil.ExecutionLogEntry) error
	hooks       []func(context.Context, int, workerutil.ExecutionLogEntry) error
	history     []StoreAddExecutionLogEntryFuncCall
	mutex       sync.Mutex
}
```

StoreAddExecutionLogEntryFunc describes the behavior when the AddExecutionLogEntry method of the parent MockStore instance is invoked. 

#### <a id="StoreAddExecutionLogEntryFunc.History" href="#StoreAddExecutionLogEntryFunc.History">func (f *StoreAddExecutionLogEntryFunc) History() []StoreAddExecutionLogEntryFuncCall</a>

```
searchKey: mocks.StoreAddExecutionLogEntryFunc.History
tags: [function]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) History() []StoreAddExecutionLogEntryFuncCall
```

History returns a sequence of StoreAddExecutionLogEntryFuncCall objects describing the invocations of this function. 

#### <a id="StoreAddExecutionLogEntryFunc.PushHook" href="#StoreAddExecutionLogEntryFunc.PushHook">func (f *StoreAddExecutionLogEntryFunc) PushHook(hook func(context.Context, int, workerutil.ExecutionLogEntry) error)</a>

```
searchKey: mocks.StoreAddExecutionLogEntryFunc.PushHook
tags: [method]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) PushHook(hook func(context.Context, int, workerutil.ExecutionLogEntry) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the AddExecutionLogEntry method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreAddExecutionLogEntryFunc.PushReturn" href="#StoreAddExecutionLogEntryFunc.PushReturn">func (f *StoreAddExecutionLogEntryFunc) PushReturn(r0 error)</a>

```
searchKey: mocks.StoreAddExecutionLogEntryFunc.PushReturn
tags: [method]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreAddExecutionLogEntryFunc.SetDefaultHook" href="#StoreAddExecutionLogEntryFunc.SetDefaultHook">func (f *StoreAddExecutionLogEntryFunc) SetDefaultHook(hook func(context.Context, int, workerutil.ExecutionLogEntry) error)</a>

```
searchKey: mocks.StoreAddExecutionLogEntryFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) SetDefaultHook(hook func(context.Context, int, workerutil.ExecutionLogEntry) error)
```

SetDefaultHook sets function that is called when the AddExecutionLogEntry method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreAddExecutionLogEntryFunc.SetDefaultReturn" href="#StoreAddExecutionLogEntryFunc.SetDefaultReturn">func (f *StoreAddExecutionLogEntryFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: mocks.StoreAddExecutionLogEntryFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreAddExecutionLogEntryFunc.appendCall" href="#StoreAddExecutionLogEntryFunc.appendCall">func (f *StoreAddExecutionLogEntryFunc) appendCall(r0 StoreAddExecutionLogEntryFuncCall)</a>

```
searchKey: mocks.StoreAddExecutionLogEntryFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) appendCall(r0 StoreAddExecutionLogEntryFuncCall)
```

#### <a id="StoreAddExecutionLogEntryFunc.nextHook" href="#StoreAddExecutionLogEntryFunc.nextHook">func (f *StoreAddExecutionLogEntryFunc) nextHook() func(context.Context, int, workerutil.ExecutionLogEntry) error</a>

```
searchKey: mocks.StoreAddExecutionLogEntryFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) nextHook() func(context.Context, int, workerutil.ExecutionLogEntry) error
```

### <a id="StoreAddExecutionLogEntryFuncCall" href="#StoreAddExecutionLogEntryFuncCall">type StoreAddExecutionLogEntryFuncCall struct</a>

```
searchKey: mocks.StoreAddExecutionLogEntryFuncCall
tags: [struct]
```

```Go
type StoreAddExecutionLogEntryFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 workerutil.ExecutionLogEntry
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

StoreAddExecutionLogEntryFuncCall is an object that describes an invocation of method AddExecutionLogEntry on an instance of MockStore. 

#### <a id="StoreAddExecutionLogEntryFuncCall.Args" href="#StoreAddExecutionLogEntryFuncCall.Args">func (c StoreAddExecutionLogEntryFuncCall) Args() []interface{}</a>

```
searchKey: mocks.StoreAddExecutionLogEntryFuncCall.Args
tags: [function]
```

```Go
func (c StoreAddExecutionLogEntryFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreAddExecutionLogEntryFuncCall.Results" href="#StoreAddExecutionLogEntryFuncCall.Results">func (c StoreAddExecutionLogEntryFuncCall) Results() []interface{}</a>

```
searchKey: mocks.StoreAddExecutionLogEntryFuncCall.Results
tags: [function]
```

```Go
func (c StoreAddExecutionLogEntryFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreDequeueFunc" href="#StoreDequeueFunc">type StoreDequeueFunc struct</a>

```
searchKey: mocks.StoreDequeueFunc
tags: [struct]
```

```Go
type StoreDequeueFunc struct {
	defaultHook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)
	hooks       []func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)
	history     []StoreDequeueFuncCall
	mutex       sync.Mutex
}
```

StoreDequeueFunc describes the behavior when the Dequeue method of the parent MockStore instance is invoked. 

#### <a id="StoreDequeueFunc.History" href="#StoreDequeueFunc.History">func (f *StoreDequeueFunc) History() []StoreDequeueFuncCall</a>

```
searchKey: mocks.StoreDequeueFunc.History
tags: [function]
```

```Go
func (f *StoreDequeueFunc) History() []StoreDequeueFuncCall
```

History returns a sequence of StoreDequeueFuncCall objects describing the invocations of this function. 

#### <a id="StoreDequeueFunc.PushHook" href="#StoreDequeueFunc.PushHook">func (f *StoreDequeueFunc) PushHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))</a>

```
searchKey: mocks.StoreDequeueFunc.PushHook
tags: [method]
```

```Go
func (f *StoreDequeueFunc) PushHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Dequeue method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreDequeueFunc.PushReturn" href="#StoreDequeueFunc.PushReturn">func (f *StoreDequeueFunc) PushReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)</a>

```
searchKey: mocks.StoreDequeueFunc.PushReturn
tags: [method]
```

```Go
func (f *StoreDequeueFunc) PushReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreDequeueFunc.SetDefaultHook" href="#StoreDequeueFunc.SetDefaultHook">func (f *StoreDequeueFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))</a>

```
searchKey: mocks.StoreDequeueFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *StoreDequeueFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))
```

SetDefaultHook sets function that is called when the Dequeue method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreDequeueFunc.SetDefaultReturn" href="#StoreDequeueFunc.SetDefaultReturn">func (f *StoreDequeueFunc) SetDefaultReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)</a>

```
searchKey: mocks.StoreDequeueFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *StoreDequeueFunc) SetDefaultReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreDequeueFunc.appendCall" href="#StoreDequeueFunc.appendCall">func (f *StoreDequeueFunc) appendCall(r0 StoreDequeueFuncCall)</a>

```
searchKey: mocks.StoreDequeueFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreDequeueFunc) appendCall(r0 StoreDequeueFuncCall)
```

#### <a id="StoreDequeueFunc.nextHook" href="#StoreDequeueFunc.nextHook">func (f *StoreDequeueFunc) nextHook() func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)</a>

```
searchKey: mocks.StoreDequeueFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreDequeueFunc) nextHook() func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)
```

### <a id="StoreDequeueFuncCall" href="#StoreDequeueFuncCall">type StoreDequeueFuncCall struct</a>

```
searchKey: mocks.StoreDequeueFuncCall
tags: [struct]
```

```Go
type StoreDequeueFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 []*sqlf.Query
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 workerutil.Record
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 store.Store
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 bool
	// Result3 is the value of the 4th result returned from this method
	// invocation.
	Result3 error
}
```

StoreDequeueFuncCall is an object that describes an invocation of method Dequeue on an instance of MockStore. 

#### <a id="StoreDequeueFuncCall.Args" href="#StoreDequeueFuncCall.Args">func (c StoreDequeueFuncCall) Args() []interface{}</a>

```
searchKey: mocks.StoreDequeueFuncCall.Args
tags: [function]
```

```Go
func (c StoreDequeueFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreDequeueFuncCall.Results" href="#StoreDequeueFuncCall.Results">func (c StoreDequeueFuncCall) Results() []interface{}</a>

```
searchKey: mocks.StoreDequeueFuncCall.Results
tags: [function]
```

```Go
func (c StoreDequeueFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreDequeueWithIndependentTransactionContextFunc" href="#StoreDequeueWithIndependentTransactionContextFunc">type StoreDequeueWithIndependentTransactionContextFunc struct</a>

```
searchKey: mocks.StoreDequeueWithIndependentTransactionContextFunc
tags: [struct]
```

```Go
type StoreDequeueWithIndependentTransactionContextFunc struct {
	defaultHook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)
	hooks       []func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)
	history     []StoreDequeueWithIndependentTransactionContextFuncCall
	mutex       sync.Mutex
}
```

StoreDequeueWithIndependentTransactionContextFunc describes the behavior when the DequeueWithIndependentTransactionContext method of the parent MockStore instance is invoked. 

#### <a id="StoreDequeueWithIndependentTransactionContextFunc.History" href="#StoreDequeueWithIndependentTransactionContextFunc.History">func (f *StoreDequeueWithIndependentTransactionContextFunc) History() []StoreDequeueWithIndependentTransactionContextFuncCall</a>

```
searchKey: mocks.StoreDequeueWithIndependentTransactionContextFunc.History
tags: [function]
```

```Go
func (f *StoreDequeueWithIndependentTransactionContextFunc) History() []StoreDequeueWithIndependentTransactionContextFuncCall
```

History returns a sequence of StoreDequeueWithIndependentTransactionContextFuncCall objects describing the invocations of this function. 

#### <a id="StoreDequeueWithIndependentTransactionContextFunc.PushHook" href="#StoreDequeueWithIndependentTransactionContextFunc.PushHook">func (f *StoreDequeueWithIndependentTransactionContextFunc) PushHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))</a>

```
searchKey: mocks.StoreDequeueWithIndependentTransactionContextFunc.PushHook
tags: [method]
```

```Go
func (f *StoreDequeueWithIndependentTransactionContextFunc) PushHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DequeueWithIndependentTransactionContext method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreDequeueWithIndependentTransactionContextFunc.PushReturn" href="#StoreDequeueWithIndependentTransactionContextFunc.PushReturn">func (f *StoreDequeueWithIndependentTransactionContextFunc) PushReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)</a>

```
searchKey: mocks.StoreDequeueWithIndependentTransactionContextFunc.PushReturn
tags: [method]
```

```Go
func (f *StoreDequeueWithIndependentTransactionContextFunc) PushReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreDequeueWithIndependentTransactionContextFunc.SetDefaultHook" href="#StoreDequeueWithIndependentTransactionContextFunc.SetDefaultHook">func (f *StoreDequeueWithIndependentTransactionContextFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))</a>

```
searchKey: mocks.StoreDequeueWithIndependentTransactionContextFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *StoreDequeueWithIndependentTransactionContextFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error))
```

SetDefaultHook sets function that is called when the DequeueWithIndependentTransactionContext method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreDequeueWithIndependentTransactionContextFunc.SetDefaultReturn" href="#StoreDequeueWithIndependentTransactionContextFunc.SetDefaultReturn">func (f *StoreDequeueWithIndependentTransactionContextFunc) SetDefaultReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)</a>

```
searchKey: mocks.StoreDequeueWithIndependentTransactionContextFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *StoreDequeueWithIndependentTransactionContextFunc) SetDefaultReturn(r0 workerutil.Record, r1 store.Store, r2 bool, r3 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreDequeueWithIndependentTransactionContextFunc.appendCall" href="#StoreDequeueWithIndependentTransactionContextFunc.appendCall">func (f *StoreDequeueWithIndependentTransactionContextFunc) appendCall(r0 StoreDequeueWithIndependentTransactionContextFuncCall)</a>

```
searchKey: mocks.StoreDequeueWithIndependentTransactionContextFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreDequeueWithIndependentTransactionContextFunc) appendCall(r0 StoreDequeueWithIndependentTransactionContextFuncCall)
```

#### <a id="StoreDequeueWithIndependentTransactionContextFunc.nextHook" href="#StoreDequeueWithIndependentTransactionContextFunc.nextHook">func (f *StoreDequeueWithIndependentTransactionContextFunc) nextHook() func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)</a>

```
searchKey: mocks.StoreDequeueWithIndependentTransactionContextFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreDequeueWithIndependentTransactionContextFunc) nextHook() func(context.Context, []*sqlf.Query) (workerutil.Record, store.Store, bool, error)
```

### <a id="StoreDequeueWithIndependentTransactionContextFuncCall" href="#StoreDequeueWithIndependentTransactionContextFuncCall">type StoreDequeueWithIndependentTransactionContextFuncCall struct</a>

```
searchKey: mocks.StoreDequeueWithIndependentTransactionContextFuncCall
tags: [struct]
```

```Go
type StoreDequeueWithIndependentTransactionContextFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 []*sqlf.Query
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 workerutil.Record
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 store.Store
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 bool
	// Result3 is the value of the 4th result returned from this method
	// invocation.
	Result3 error
}
```

StoreDequeueWithIndependentTransactionContextFuncCall is an object that describes an invocation of method DequeueWithIndependentTransactionContext on an instance of MockStore. 

#### <a id="StoreDequeueWithIndependentTransactionContextFuncCall.Args" href="#StoreDequeueWithIndependentTransactionContextFuncCall.Args">func (c StoreDequeueWithIndependentTransactionContextFuncCall) Args() []interface{}</a>

```
searchKey: mocks.StoreDequeueWithIndependentTransactionContextFuncCall.Args
tags: [function]
```

```Go
func (c StoreDequeueWithIndependentTransactionContextFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreDequeueWithIndependentTransactionContextFuncCall.Results" href="#StoreDequeueWithIndependentTransactionContextFuncCall.Results">func (c StoreDequeueWithIndependentTransactionContextFuncCall) Results() []interface{}</a>

```
searchKey: mocks.StoreDequeueWithIndependentTransactionContextFuncCall.Results
tags: [function]
```

```Go
func (c StoreDequeueWithIndependentTransactionContextFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreDoneFunc" href="#StoreDoneFunc">type StoreDoneFunc struct</a>

```
searchKey: mocks.StoreDoneFunc
tags: [struct]
```

```Go
type StoreDoneFunc struct {
	defaultHook func(error) error
	hooks       []func(error) error
	history     []StoreDoneFuncCall
	mutex       sync.Mutex
}
```

StoreDoneFunc describes the behavior when the Done method of the parent MockStore instance is invoked. 

#### <a id="StoreDoneFunc.History" href="#StoreDoneFunc.History">func (f *StoreDoneFunc) History() []StoreDoneFuncCall</a>

```
searchKey: mocks.StoreDoneFunc.History
tags: [function]
```

```Go
func (f *StoreDoneFunc) History() []StoreDoneFuncCall
```

History returns a sequence of StoreDoneFuncCall objects describing the invocations of this function. 

#### <a id="StoreDoneFunc.PushHook" href="#StoreDoneFunc.PushHook">func (f *StoreDoneFunc) PushHook(hook func(error) error)</a>

```
searchKey: mocks.StoreDoneFunc.PushHook
tags: [method]
```

```Go
func (f *StoreDoneFunc) PushHook(hook func(error) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Done method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreDoneFunc.PushReturn" href="#StoreDoneFunc.PushReturn">func (f *StoreDoneFunc) PushReturn(r0 error)</a>

```
searchKey: mocks.StoreDoneFunc.PushReturn
tags: [method]
```

```Go
func (f *StoreDoneFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreDoneFunc.SetDefaultHook" href="#StoreDoneFunc.SetDefaultHook">func (f *StoreDoneFunc) SetDefaultHook(hook func(error) error)</a>

```
searchKey: mocks.StoreDoneFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *StoreDoneFunc) SetDefaultHook(hook func(error) error)
```

SetDefaultHook sets function that is called when the Done method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreDoneFunc.SetDefaultReturn" href="#StoreDoneFunc.SetDefaultReturn">func (f *StoreDoneFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: mocks.StoreDoneFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *StoreDoneFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreDoneFunc.appendCall" href="#StoreDoneFunc.appendCall">func (f *StoreDoneFunc) appendCall(r0 StoreDoneFuncCall)</a>

```
searchKey: mocks.StoreDoneFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreDoneFunc) appendCall(r0 StoreDoneFuncCall)
```

#### <a id="StoreDoneFunc.nextHook" href="#StoreDoneFunc.nextHook">func (f *StoreDoneFunc) nextHook() func(error) error</a>

```
searchKey: mocks.StoreDoneFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreDoneFunc) nextHook() func(error) error
```

### <a id="StoreDoneFuncCall" href="#StoreDoneFuncCall">type StoreDoneFuncCall struct</a>

```
searchKey: mocks.StoreDoneFuncCall
tags: [struct]
```

```Go
type StoreDoneFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 error
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

StoreDoneFuncCall is an object that describes an invocation of method Done on an instance of MockStore. 

#### <a id="StoreDoneFuncCall.Args" href="#StoreDoneFuncCall.Args">func (c StoreDoneFuncCall) Args() []interface{}</a>

```
searchKey: mocks.StoreDoneFuncCall.Args
tags: [function]
```

```Go
func (c StoreDoneFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreDoneFuncCall.Results" href="#StoreDoneFuncCall.Results">func (c StoreDoneFuncCall) Results() []interface{}</a>

```
searchKey: mocks.StoreDoneFuncCall.Results
tags: [function]
```

```Go
func (c StoreDoneFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreHandleFunc" href="#StoreHandleFunc">type StoreHandleFunc struct</a>

```
searchKey: mocks.StoreHandleFunc
tags: [struct]
```

```Go
type StoreHandleFunc struct {
	defaultHook func() *basestore.TransactableHandle
	hooks       []func() *basestore.TransactableHandle
	history     []StoreHandleFuncCall
	mutex       sync.Mutex
}
```

StoreHandleFunc describes the behavior when the Handle method of the parent MockStore instance is invoked. 

#### <a id="StoreHandleFunc.History" href="#StoreHandleFunc.History">func (f *StoreHandleFunc) History() []StoreHandleFuncCall</a>

```
searchKey: mocks.StoreHandleFunc.History
tags: [function]
```

```Go
func (f *StoreHandleFunc) History() []StoreHandleFuncCall
```

History returns a sequence of StoreHandleFuncCall objects describing the invocations of this function. 

#### <a id="StoreHandleFunc.PushHook" href="#StoreHandleFunc.PushHook">func (f *StoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)</a>

```
searchKey: mocks.StoreHandleFunc.PushHook
tags: [method]
```

```Go
func (f *StoreHandleFunc) PushHook(hook func() *basestore.TransactableHandle)
```

PushHook adds a function to the end of hook queue. Each invocation of the Handle method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreHandleFunc.PushReturn" href="#StoreHandleFunc.PushReturn">func (f *StoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)</a>

```
searchKey: mocks.StoreHandleFunc.PushReturn
tags: [method]
```

```Go
func (f *StoreHandleFunc) PushReturn(r0 *basestore.TransactableHandle)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreHandleFunc.SetDefaultHook" href="#StoreHandleFunc.SetDefaultHook">func (f *StoreHandleFunc) SetDefaultHook(hook func() *basestore.TransactableHandle)</a>

```
searchKey: mocks.StoreHandleFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *StoreHandleFunc) SetDefaultHook(hook func() *basestore.TransactableHandle)
```

SetDefaultHook sets function that is called when the Handle method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreHandleFunc.SetDefaultReturn" href="#StoreHandleFunc.SetDefaultReturn">func (f *StoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)</a>

```
searchKey: mocks.StoreHandleFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *StoreHandleFunc) SetDefaultReturn(r0 *basestore.TransactableHandle)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreHandleFunc.appendCall" href="#StoreHandleFunc.appendCall">func (f *StoreHandleFunc) appendCall(r0 StoreHandleFuncCall)</a>

```
searchKey: mocks.StoreHandleFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreHandleFunc) appendCall(r0 StoreHandleFuncCall)
```

#### <a id="StoreHandleFunc.nextHook" href="#StoreHandleFunc.nextHook">func (f *StoreHandleFunc) nextHook() func() *basestore.TransactableHandle</a>

```
searchKey: mocks.StoreHandleFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreHandleFunc) nextHook() func() *basestore.TransactableHandle
```

### <a id="StoreHandleFuncCall" href="#StoreHandleFuncCall">type StoreHandleFuncCall struct</a>

```
searchKey: mocks.StoreHandleFuncCall
tags: [struct]
```

```Go
type StoreHandleFuncCall struct {
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *basestore.TransactableHandle
}
```

StoreHandleFuncCall is an object that describes an invocation of method Handle on an instance of MockStore. 

#### <a id="StoreHandleFuncCall.Args" href="#StoreHandleFuncCall.Args">func (c StoreHandleFuncCall) Args() []interface{}</a>

```
searchKey: mocks.StoreHandleFuncCall.Args
tags: [function]
```

```Go
func (c StoreHandleFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreHandleFuncCall.Results" href="#StoreHandleFuncCall.Results">func (c StoreHandleFuncCall) Results() []interface{}</a>

```
searchKey: mocks.StoreHandleFuncCall.Results
tags: [function]
```

```Go
func (c StoreHandleFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreMarkCompleteFunc" href="#StoreMarkCompleteFunc">type StoreMarkCompleteFunc struct</a>

```
searchKey: mocks.StoreMarkCompleteFunc
tags: [struct]
```

```Go
type StoreMarkCompleteFunc struct {
	defaultHook func(context.Context, int) (bool, error)
	hooks       []func(context.Context, int) (bool, error)
	history     []StoreMarkCompleteFuncCall
	mutex       sync.Mutex
}
```

StoreMarkCompleteFunc describes the behavior when the MarkComplete method of the parent MockStore instance is invoked. 

#### <a id="StoreMarkCompleteFunc.History" href="#StoreMarkCompleteFunc.History">func (f *StoreMarkCompleteFunc) History() []StoreMarkCompleteFuncCall</a>

```
searchKey: mocks.StoreMarkCompleteFunc.History
tags: [function]
```

```Go
func (f *StoreMarkCompleteFunc) History() []StoreMarkCompleteFuncCall
```

History returns a sequence of StoreMarkCompleteFuncCall objects describing the invocations of this function. 

#### <a id="StoreMarkCompleteFunc.PushHook" href="#StoreMarkCompleteFunc.PushHook">func (f *StoreMarkCompleteFunc) PushHook(hook func(context.Context, int) (bool, error))</a>

```
searchKey: mocks.StoreMarkCompleteFunc.PushHook
tags: [method]
```

```Go
func (f *StoreMarkCompleteFunc) PushHook(hook func(context.Context, int) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkComplete method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreMarkCompleteFunc.PushReturn" href="#StoreMarkCompleteFunc.PushReturn">func (f *StoreMarkCompleteFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: mocks.StoreMarkCompleteFunc.PushReturn
tags: [method]
```

```Go
func (f *StoreMarkCompleteFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkCompleteFunc.SetDefaultHook" href="#StoreMarkCompleteFunc.SetDefaultHook">func (f *StoreMarkCompleteFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))</a>

```
searchKey: mocks.StoreMarkCompleteFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *StoreMarkCompleteFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))
```

SetDefaultHook sets function that is called when the MarkComplete method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreMarkCompleteFunc.SetDefaultReturn" href="#StoreMarkCompleteFunc.SetDefaultReturn">func (f *StoreMarkCompleteFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: mocks.StoreMarkCompleteFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *StoreMarkCompleteFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkCompleteFunc.appendCall" href="#StoreMarkCompleteFunc.appendCall">func (f *StoreMarkCompleteFunc) appendCall(r0 StoreMarkCompleteFuncCall)</a>

```
searchKey: mocks.StoreMarkCompleteFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreMarkCompleteFunc) appendCall(r0 StoreMarkCompleteFuncCall)
```

#### <a id="StoreMarkCompleteFunc.nextHook" href="#StoreMarkCompleteFunc.nextHook">func (f *StoreMarkCompleteFunc) nextHook() func(context.Context, int) (bool, error)</a>

```
searchKey: mocks.StoreMarkCompleteFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreMarkCompleteFunc) nextHook() func(context.Context, int) (bool, error)
```

### <a id="StoreMarkCompleteFuncCall" href="#StoreMarkCompleteFuncCall">type StoreMarkCompleteFuncCall struct</a>

```
searchKey: mocks.StoreMarkCompleteFuncCall
tags: [struct]
```

```Go
type StoreMarkCompleteFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 bool
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

StoreMarkCompleteFuncCall is an object that describes an invocation of method MarkComplete on an instance of MockStore. 

#### <a id="StoreMarkCompleteFuncCall.Args" href="#StoreMarkCompleteFuncCall.Args">func (c StoreMarkCompleteFuncCall) Args() []interface{}</a>

```
searchKey: mocks.StoreMarkCompleteFuncCall.Args
tags: [function]
```

```Go
func (c StoreMarkCompleteFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreMarkCompleteFuncCall.Results" href="#StoreMarkCompleteFuncCall.Results">func (c StoreMarkCompleteFuncCall) Results() []interface{}</a>

```
searchKey: mocks.StoreMarkCompleteFuncCall.Results
tags: [function]
```

```Go
func (c StoreMarkCompleteFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreMarkErroredFunc" href="#StoreMarkErroredFunc">type StoreMarkErroredFunc struct</a>

```
searchKey: mocks.StoreMarkErroredFunc
tags: [struct]
```

```Go
type StoreMarkErroredFunc struct {
	defaultHook func(context.Context, int, string) (bool, error)
	hooks       []func(context.Context, int, string) (bool, error)
	history     []StoreMarkErroredFuncCall
	mutex       sync.Mutex
}
```

StoreMarkErroredFunc describes the behavior when the MarkErrored method of the parent MockStore instance is invoked. 

#### <a id="StoreMarkErroredFunc.History" href="#StoreMarkErroredFunc.History">func (f *StoreMarkErroredFunc) History() []StoreMarkErroredFuncCall</a>

```
searchKey: mocks.StoreMarkErroredFunc.History
tags: [function]
```

```Go
func (f *StoreMarkErroredFunc) History() []StoreMarkErroredFuncCall
```

History returns a sequence of StoreMarkErroredFuncCall objects describing the invocations of this function. 

#### <a id="StoreMarkErroredFunc.PushHook" href="#StoreMarkErroredFunc.PushHook">func (f *StoreMarkErroredFunc) PushHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: mocks.StoreMarkErroredFunc.PushHook
tags: [method]
```

```Go
func (f *StoreMarkErroredFunc) PushHook(hook func(context.Context, int, string) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkErrored method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreMarkErroredFunc.PushReturn" href="#StoreMarkErroredFunc.PushReturn">func (f *StoreMarkErroredFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: mocks.StoreMarkErroredFunc.PushReturn
tags: [method]
```

```Go
func (f *StoreMarkErroredFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkErroredFunc.SetDefaultHook" href="#StoreMarkErroredFunc.SetDefaultHook">func (f *StoreMarkErroredFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: mocks.StoreMarkErroredFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *StoreMarkErroredFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))
```

SetDefaultHook sets function that is called when the MarkErrored method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreMarkErroredFunc.SetDefaultReturn" href="#StoreMarkErroredFunc.SetDefaultReturn">func (f *StoreMarkErroredFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: mocks.StoreMarkErroredFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *StoreMarkErroredFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkErroredFunc.appendCall" href="#StoreMarkErroredFunc.appendCall">func (f *StoreMarkErroredFunc) appendCall(r0 StoreMarkErroredFuncCall)</a>

```
searchKey: mocks.StoreMarkErroredFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreMarkErroredFunc) appendCall(r0 StoreMarkErroredFuncCall)
```

#### <a id="StoreMarkErroredFunc.nextHook" href="#StoreMarkErroredFunc.nextHook">func (f *StoreMarkErroredFunc) nextHook() func(context.Context, int, string) (bool, error)</a>

```
searchKey: mocks.StoreMarkErroredFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreMarkErroredFunc) nextHook() func(context.Context, int, string) (bool, error)
```

### <a id="StoreMarkErroredFuncCall" href="#StoreMarkErroredFuncCall">type StoreMarkErroredFuncCall struct</a>

```
searchKey: mocks.StoreMarkErroredFuncCall
tags: [struct]
```

```Go
type StoreMarkErroredFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 bool
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

StoreMarkErroredFuncCall is an object that describes an invocation of method MarkErrored on an instance of MockStore. 

#### <a id="StoreMarkErroredFuncCall.Args" href="#StoreMarkErroredFuncCall.Args">func (c StoreMarkErroredFuncCall) Args() []interface{}</a>

```
searchKey: mocks.StoreMarkErroredFuncCall.Args
tags: [function]
```

```Go
func (c StoreMarkErroredFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreMarkErroredFuncCall.Results" href="#StoreMarkErroredFuncCall.Results">func (c StoreMarkErroredFuncCall) Results() []interface{}</a>

```
searchKey: mocks.StoreMarkErroredFuncCall.Results
tags: [function]
```

```Go
func (c StoreMarkErroredFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreMarkFailedFunc" href="#StoreMarkFailedFunc">type StoreMarkFailedFunc struct</a>

```
searchKey: mocks.StoreMarkFailedFunc
tags: [struct]
```

```Go
type StoreMarkFailedFunc struct {
	defaultHook func(context.Context, int, string) (bool, error)
	hooks       []func(context.Context, int, string) (bool, error)
	history     []StoreMarkFailedFuncCall
	mutex       sync.Mutex
}
```

StoreMarkFailedFunc describes the behavior when the MarkFailed method of the parent MockStore instance is invoked. 

#### <a id="StoreMarkFailedFunc.History" href="#StoreMarkFailedFunc.History">func (f *StoreMarkFailedFunc) History() []StoreMarkFailedFuncCall</a>

```
searchKey: mocks.StoreMarkFailedFunc.History
tags: [function]
```

```Go
func (f *StoreMarkFailedFunc) History() []StoreMarkFailedFuncCall
```

History returns a sequence of StoreMarkFailedFuncCall objects describing the invocations of this function. 

#### <a id="StoreMarkFailedFunc.PushHook" href="#StoreMarkFailedFunc.PushHook">func (f *StoreMarkFailedFunc) PushHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: mocks.StoreMarkFailedFunc.PushHook
tags: [method]
```

```Go
func (f *StoreMarkFailedFunc) PushHook(hook func(context.Context, int, string) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkFailed method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreMarkFailedFunc.PushReturn" href="#StoreMarkFailedFunc.PushReturn">func (f *StoreMarkFailedFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: mocks.StoreMarkFailedFunc.PushReturn
tags: [method]
```

```Go
func (f *StoreMarkFailedFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkFailedFunc.SetDefaultHook" href="#StoreMarkFailedFunc.SetDefaultHook">func (f *StoreMarkFailedFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: mocks.StoreMarkFailedFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *StoreMarkFailedFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))
```

SetDefaultHook sets function that is called when the MarkFailed method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreMarkFailedFunc.SetDefaultReturn" href="#StoreMarkFailedFunc.SetDefaultReturn">func (f *StoreMarkFailedFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: mocks.StoreMarkFailedFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *StoreMarkFailedFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkFailedFunc.appendCall" href="#StoreMarkFailedFunc.appendCall">func (f *StoreMarkFailedFunc) appendCall(r0 StoreMarkFailedFuncCall)</a>

```
searchKey: mocks.StoreMarkFailedFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreMarkFailedFunc) appendCall(r0 StoreMarkFailedFuncCall)
```

#### <a id="StoreMarkFailedFunc.nextHook" href="#StoreMarkFailedFunc.nextHook">func (f *StoreMarkFailedFunc) nextHook() func(context.Context, int, string) (bool, error)</a>

```
searchKey: mocks.StoreMarkFailedFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreMarkFailedFunc) nextHook() func(context.Context, int, string) (bool, error)
```

### <a id="StoreMarkFailedFuncCall" href="#StoreMarkFailedFuncCall">type StoreMarkFailedFuncCall struct</a>

```
searchKey: mocks.StoreMarkFailedFuncCall
tags: [struct]
```

```Go
type StoreMarkFailedFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 bool
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

StoreMarkFailedFuncCall is an object that describes an invocation of method MarkFailed on an instance of MockStore. 

#### <a id="StoreMarkFailedFuncCall.Args" href="#StoreMarkFailedFuncCall.Args">func (c StoreMarkFailedFuncCall) Args() []interface{}</a>

```
searchKey: mocks.StoreMarkFailedFuncCall.Args
tags: [function]
```

```Go
func (c StoreMarkFailedFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreMarkFailedFuncCall.Results" href="#StoreMarkFailedFuncCall.Results">func (c StoreMarkFailedFuncCall) Results() []interface{}</a>

```
searchKey: mocks.StoreMarkFailedFuncCall.Results
tags: [function]
```

```Go
func (c StoreMarkFailedFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreQueuedCountFunc" href="#StoreQueuedCountFunc">type StoreQueuedCountFunc struct</a>

```
searchKey: mocks.StoreQueuedCountFunc
tags: [struct]
```

```Go
type StoreQueuedCountFunc struct {
	defaultHook func(context.Context, []*sqlf.Query) (int, error)
	hooks       []func(context.Context, []*sqlf.Query) (int, error)
	history     []StoreQueuedCountFuncCall
	mutex       sync.Mutex
}
```

StoreQueuedCountFunc describes the behavior when the QueuedCount method of the parent MockStore instance is invoked. 

#### <a id="StoreQueuedCountFunc.History" href="#StoreQueuedCountFunc.History">func (f *StoreQueuedCountFunc) History() []StoreQueuedCountFuncCall</a>

```
searchKey: mocks.StoreQueuedCountFunc.History
tags: [function]
```

```Go
func (f *StoreQueuedCountFunc) History() []StoreQueuedCountFuncCall
```

History returns a sequence of StoreQueuedCountFuncCall objects describing the invocations of this function. 

#### <a id="StoreQueuedCountFunc.PushHook" href="#StoreQueuedCountFunc.PushHook">func (f *StoreQueuedCountFunc) PushHook(hook func(context.Context, []*sqlf.Query) (int, error))</a>

```
searchKey: mocks.StoreQueuedCountFunc.PushHook
tags: [method]
```

```Go
func (f *StoreQueuedCountFunc) PushHook(hook func(context.Context, []*sqlf.Query) (int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the QueuedCount method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreQueuedCountFunc.PushReturn" href="#StoreQueuedCountFunc.PushReturn">func (f *StoreQueuedCountFunc) PushReturn(r0 int, r1 error)</a>

```
searchKey: mocks.StoreQueuedCountFunc.PushReturn
tags: [method]
```

```Go
func (f *StoreQueuedCountFunc) PushReturn(r0 int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreQueuedCountFunc.SetDefaultHook" href="#StoreQueuedCountFunc.SetDefaultHook">func (f *StoreQueuedCountFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (int, error))</a>

```
searchKey: mocks.StoreQueuedCountFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *StoreQueuedCountFunc) SetDefaultHook(hook func(context.Context, []*sqlf.Query) (int, error))
```

SetDefaultHook sets function that is called when the QueuedCount method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreQueuedCountFunc.SetDefaultReturn" href="#StoreQueuedCountFunc.SetDefaultReturn">func (f *StoreQueuedCountFunc) SetDefaultReturn(r0 int, r1 error)</a>

```
searchKey: mocks.StoreQueuedCountFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *StoreQueuedCountFunc) SetDefaultReturn(r0 int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreQueuedCountFunc.appendCall" href="#StoreQueuedCountFunc.appendCall">func (f *StoreQueuedCountFunc) appendCall(r0 StoreQueuedCountFuncCall)</a>

```
searchKey: mocks.StoreQueuedCountFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreQueuedCountFunc) appendCall(r0 StoreQueuedCountFuncCall)
```

#### <a id="StoreQueuedCountFunc.nextHook" href="#StoreQueuedCountFunc.nextHook">func (f *StoreQueuedCountFunc) nextHook() func(context.Context, []*sqlf.Query) (int, error)</a>

```
searchKey: mocks.StoreQueuedCountFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreQueuedCountFunc) nextHook() func(context.Context, []*sqlf.Query) (int, error)
```

### <a id="StoreQueuedCountFuncCall" href="#StoreQueuedCountFuncCall">type StoreQueuedCountFuncCall struct</a>

```
searchKey: mocks.StoreQueuedCountFuncCall
tags: [struct]
```

```Go
type StoreQueuedCountFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 []*sqlf.Query
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

StoreQueuedCountFuncCall is an object that describes an invocation of method QueuedCount on an instance of MockStore. 

#### <a id="StoreQueuedCountFuncCall.Args" href="#StoreQueuedCountFuncCall.Args">func (c StoreQueuedCountFuncCall) Args() []interface{}</a>

```
searchKey: mocks.StoreQueuedCountFuncCall.Args
tags: [function]
```

```Go
func (c StoreQueuedCountFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreQueuedCountFuncCall.Results" href="#StoreQueuedCountFuncCall.Results">func (c StoreQueuedCountFuncCall) Results() []interface{}</a>

```
searchKey: mocks.StoreQueuedCountFuncCall.Results
tags: [function]
```

```Go
func (c StoreQueuedCountFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreRequeueFunc" href="#StoreRequeueFunc">type StoreRequeueFunc struct</a>

```
searchKey: mocks.StoreRequeueFunc
tags: [struct]
```

```Go
type StoreRequeueFunc struct {
	defaultHook func(context.Context, int, time.Time) error
	hooks       []func(context.Context, int, time.Time) error
	history     []StoreRequeueFuncCall
	mutex       sync.Mutex
}
```

StoreRequeueFunc describes the behavior when the Requeue method of the parent MockStore instance is invoked. 

#### <a id="StoreRequeueFunc.History" href="#StoreRequeueFunc.History">func (f *StoreRequeueFunc) History() []StoreRequeueFuncCall</a>

```
searchKey: mocks.StoreRequeueFunc.History
tags: [function]
```

```Go
func (f *StoreRequeueFunc) History() []StoreRequeueFuncCall
```

History returns a sequence of StoreRequeueFuncCall objects describing the invocations of this function. 

#### <a id="StoreRequeueFunc.PushHook" href="#StoreRequeueFunc.PushHook">func (f *StoreRequeueFunc) PushHook(hook func(context.Context, int, time.Time) error)</a>

```
searchKey: mocks.StoreRequeueFunc.PushHook
tags: [method]
```

```Go
func (f *StoreRequeueFunc) PushHook(hook func(context.Context, int, time.Time) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Requeue method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreRequeueFunc.PushReturn" href="#StoreRequeueFunc.PushReturn">func (f *StoreRequeueFunc) PushReturn(r0 error)</a>

```
searchKey: mocks.StoreRequeueFunc.PushReturn
tags: [method]
```

```Go
func (f *StoreRequeueFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreRequeueFunc.SetDefaultHook" href="#StoreRequeueFunc.SetDefaultHook">func (f *StoreRequeueFunc) SetDefaultHook(hook func(context.Context, int, time.Time) error)</a>

```
searchKey: mocks.StoreRequeueFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *StoreRequeueFunc) SetDefaultHook(hook func(context.Context, int, time.Time) error)
```

SetDefaultHook sets function that is called when the Requeue method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreRequeueFunc.SetDefaultReturn" href="#StoreRequeueFunc.SetDefaultReturn">func (f *StoreRequeueFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: mocks.StoreRequeueFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *StoreRequeueFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreRequeueFunc.appendCall" href="#StoreRequeueFunc.appendCall">func (f *StoreRequeueFunc) appendCall(r0 StoreRequeueFuncCall)</a>

```
searchKey: mocks.StoreRequeueFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreRequeueFunc) appendCall(r0 StoreRequeueFuncCall)
```

#### <a id="StoreRequeueFunc.nextHook" href="#StoreRequeueFunc.nextHook">func (f *StoreRequeueFunc) nextHook() func(context.Context, int, time.Time) error</a>

```
searchKey: mocks.StoreRequeueFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreRequeueFunc) nextHook() func(context.Context, int, time.Time) error
```

### <a id="StoreRequeueFuncCall" href="#StoreRequeueFuncCall">type StoreRequeueFuncCall struct</a>

```
searchKey: mocks.StoreRequeueFuncCall
tags: [struct]
```

```Go
type StoreRequeueFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

StoreRequeueFuncCall is an object that describes an invocation of method Requeue on an instance of MockStore. 

#### <a id="StoreRequeueFuncCall.Args" href="#StoreRequeueFuncCall.Args">func (c StoreRequeueFuncCall) Args() []interface{}</a>

```
searchKey: mocks.StoreRequeueFuncCall.Args
tags: [function]
```

```Go
func (c StoreRequeueFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreRequeueFuncCall.Results" href="#StoreRequeueFuncCall.Results">func (c StoreRequeueFuncCall) Results() []interface{}</a>

```
searchKey: mocks.StoreRequeueFuncCall.Results
tags: [function]
```

```Go
func (c StoreRequeueFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreResetStalledFunc" href="#StoreResetStalledFunc">type StoreResetStalledFunc struct</a>

```
searchKey: mocks.StoreResetStalledFunc
tags: [struct]
```

```Go
type StoreResetStalledFunc struct {
	defaultHook func(context.Context) ([]int, []int, error)
	hooks       []func(context.Context) ([]int, []int, error)
	history     []StoreResetStalledFuncCall
	mutex       sync.Mutex
}
```

StoreResetStalledFunc describes the behavior when the ResetStalled method of the parent MockStore instance is invoked. 

#### <a id="StoreResetStalledFunc.History" href="#StoreResetStalledFunc.History">func (f *StoreResetStalledFunc) History() []StoreResetStalledFuncCall</a>

```
searchKey: mocks.StoreResetStalledFunc.History
tags: [function]
```

```Go
func (f *StoreResetStalledFunc) History() []StoreResetStalledFuncCall
```

History returns a sequence of StoreResetStalledFuncCall objects describing the invocations of this function. 

#### <a id="StoreResetStalledFunc.PushHook" href="#StoreResetStalledFunc.PushHook">func (f *StoreResetStalledFunc) PushHook(hook func(context.Context) ([]int, []int, error))</a>

```
searchKey: mocks.StoreResetStalledFunc.PushHook
tags: [method]
```

```Go
func (f *StoreResetStalledFunc) PushHook(hook func(context.Context) ([]int, []int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the ResetStalled method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreResetStalledFunc.PushReturn" href="#StoreResetStalledFunc.PushReturn">func (f *StoreResetStalledFunc) PushReturn(r0 []int, r1 []int, r2 error)</a>

```
searchKey: mocks.StoreResetStalledFunc.PushReturn
tags: [method]
```

```Go
func (f *StoreResetStalledFunc) PushReturn(r0 []int, r1 []int, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreResetStalledFunc.SetDefaultHook" href="#StoreResetStalledFunc.SetDefaultHook">func (f *StoreResetStalledFunc) SetDefaultHook(hook func(context.Context) ([]int, []int, error))</a>

```
searchKey: mocks.StoreResetStalledFunc.SetDefaultHook
tags: [method]
```

```Go
func (f *StoreResetStalledFunc) SetDefaultHook(hook func(context.Context) ([]int, []int, error))
```

SetDefaultHook sets function that is called when the ResetStalled method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreResetStalledFunc.SetDefaultReturn" href="#StoreResetStalledFunc.SetDefaultReturn">func (f *StoreResetStalledFunc) SetDefaultReturn(r0 []int, r1 []int, r2 error)</a>

```
searchKey: mocks.StoreResetStalledFunc.SetDefaultReturn
tags: [method]
```

```Go
func (f *StoreResetStalledFunc) SetDefaultReturn(r0 []int, r1 []int, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreResetStalledFunc.appendCall" href="#StoreResetStalledFunc.appendCall">func (f *StoreResetStalledFunc) appendCall(r0 StoreResetStalledFuncCall)</a>

```
searchKey: mocks.StoreResetStalledFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreResetStalledFunc) appendCall(r0 StoreResetStalledFuncCall)
```

#### <a id="StoreResetStalledFunc.nextHook" href="#StoreResetStalledFunc.nextHook">func (f *StoreResetStalledFunc) nextHook() func(context.Context) ([]int, []int, error)</a>

```
searchKey: mocks.StoreResetStalledFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreResetStalledFunc) nextHook() func(context.Context) ([]int, []int, error)
```

### <a id="StoreResetStalledFuncCall" href="#StoreResetStalledFuncCall">type StoreResetStalledFuncCall struct</a>

```
searchKey: mocks.StoreResetStalledFuncCall
tags: [struct]
```

```Go
type StoreResetStalledFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 []int
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

StoreResetStalledFuncCall is an object that describes an invocation of method ResetStalled on an instance of MockStore. 

#### <a id="StoreResetStalledFuncCall.Args" href="#StoreResetStalledFuncCall.Args">func (c StoreResetStalledFuncCall) Args() []interface{}</a>

```
searchKey: mocks.StoreResetStalledFuncCall.Args
tags: [function]
```

```Go
func (c StoreResetStalledFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreResetStalledFuncCall.Results" href="#StoreResetStalledFuncCall.Results">func (c StoreResetStalledFuncCall) Results() []interface{}</a>

```
searchKey: mocks.StoreResetStalledFuncCall.Results
tags: [function]
```

```Go
func (c StoreResetStalledFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

