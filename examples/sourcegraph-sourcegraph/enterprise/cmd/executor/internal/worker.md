# Package worker

## Index

* [Variables](#var)
    * [var ErrJobAlreadyExists](#ErrJobAlreadyExists)
    * [var makeTempDir](#makeTempDir)
    * [var scriptPreamble](#scriptPreamble)
* [Types](#type)
    * [type IDSet struct](#IDSet)
        * [func newIDSet() *IDSet](#newIDSet)
        * [func (i *IDSet) Add(id int, cancel context.CancelFunc) bool](#IDSet.Add)
        * [func (i *IDSet) Remove(id int)](#IDSet.Remove)
        * [func (i *IDSet) Slice() []int](#IDSet.Slice)
    * [type MockRunner struct](#MockRunner)
        * [func NewMockRunner() *MockRunner](#NewMockRunner)
        * [func NewMockRunnerFrom(i command.Runner) *MockRunner](#NewMockRunnerFrom)
        * [func (m *MockRunner) Run(v0 context.Context, v1 command.CommandSpec) error](#MockRunner.Run)
        * [func (m *MockRunner) Setup(v0 context.Context, v1 []string, v2 []string) error](#MockRunner.Setup)
        * [func (m *MockRunner) Teardown(v0 context.Context) error](#MockRunner.Teardown)
    * [type MockStore struct](#MockStore)
        * [func NewMockStore() *MockStore](#NewMockStore)
        * [func NewMockStoreFrom(i workerutil.Store) *MockStore](#NewMockStoreFrom)
        * [func (m *MockStore) AddExecutionLogEntry(v0 context.Context, v1 int, v2 workerutil.ExecutionLogEntry) error](#MockStore.AddExecutionLogEntry)
        * [func (m *MockStore) Dequeue(v0 context.Context, v1 interface{}) (workerutil.Record, workerutil.Store, bool, error)](#MockStore.Dequeue)
        * [func (m *MockStore) Done(v0 error) error](#MockStore.Done)
        * [func (m *MockStore) MarkComplete(v0 context.Context, v1 int) (bool, error)](#MockStore.MarkComplete)
        * [func (m *MockStore) MarkErrored(v0 context.Context, v1 int, v2 string) (bool, error)](#MockStore.MarkErrored)
        * [func (m *MockStore) MarkFailed(v0 context.Context, v1 int, v2 string) (bool, error)](#MockStore.MarkFailed)
        * [func (m *MockStore) QueuedCount(v0 context.Context, v1 interface{}) (int, error)](#MockStore.QueuedCount)
    * [type Options struct](#Options)
    * [type QueueStore interface](#QueueStore)
    * [type RunnerRunFunc struct](#RunnerRunFunc)
        * [func (f *RunnerRunFunc) History() []RunnerRunFuncCall](#RunnerRunFunc.History)
        * [func (f *RunnerRunFunc) PushHook(hook func(context.Context, command.CommandSpec) error)](#RunnerRunFunc.PushHook)
        * [func (f *RunnerRunFunc) PushReturn(r0 error)](#RunnerRunFunc.PushReturn)
        * [func (f *RunnerRunFunc) SetDefaultHook(hook func(context.Context, command.CommandSpec) error)](#RunnerRunFunc.SetDefaultHook)
        * [func (f *RunnerRunFunc) SetDefaultReturn(r0 error)](#RunnerRunFunc.SetDefaultReturn)
        * [func (f *RunnerRunFunc) appendCall(r0 RunnerRunFuncCall)](#RunnerRunFunc.appendCall)
        * [func (f *RunnerRunFunc) nextHook() func(context.Context, command.CommandSpec) error](#RunnerRunFunc.nextHook)
    * [type RunnerRunFuncCall struct](#RunnerRunFuncCall)
        * [func (c RunnerRunFuncCall) Args() []interface{}](#RunnerRunFuncCall.Args)
        * [func (c RunnerRunFuncCall) Results() []interface{}](#RunnerRunFuncCall.Results)
    * [type RunnerSetupFunc struct](#RunnerSetupFunc)
        * [func (f *RunnerSetupFunc) History() []RunnerSetupFuncCall](#RunnerSetupFunc.History)
        * [func (f *RunnerSetupFunc) PushHook(hook func(context.Context, []string, []string) error)](#RunnerSetupFunc.PushHook)
        * [func (f *RunnerSetupFunc) PushReturn(r0 error)](#RunnerSetupFunc.PushReturn)
        * [func (f *RunnerSetupFunc) SetDefaultHook(hook func(context.Context, []string, []string) error)](#RunnerSetupFunc.SetDefaultHook)
        * [func (f *RunnerSetupFunc) SetDefaultReturn(r0 error)](#RunnerSetupFunc.SetDefaultReturn)
        * [func (f *RunnerSetupFunc) appendCall(r0 RunnerSetupFuncCall)](#RunnerSetupFunc.appendCall)
        * [func (f *RunnerSetupFunc) nextHook() func(context.Context, []string, []string) error](#RunnerSetupFunc.nextHook)
    * [type RunnerSetupFuncCall struct](#RunnerSetupFuncCall)
        * [func (c RunnerSetupFuncCall) Args() []interface{}](#RunnerSetupFuncCall.Args)
        * [func (c RunnerSetupFuncCall) Results() []interface{}](#RunnerSetupFuncCall.Results)
    * [type RunnerTeardownFunc struct](#RunnerTeardownFunc)
        * [func (f *RunnerTeardownFunc) History() []RunnerTeardownFuncCall](#RunnerTeardownFunc.History)
        * [func (f *RunnerTeardownFunc) PushHook(hook func(context.Context) error)](#RunnerTeardownFunc.PushHook)
        * [func (f *RunnerTeardownFunc) PushReturn(r0 error)](#RunnerTeardownFunc.PushReturn)
        * [func (f *RunnerTeardownFunc) SetDefaultHook(hook func(context.Context) error)](#RunnerTeardownFunc.SetDefaultHook)
        * [func (f *RunnerTeardownFunc) SetDefaultReturn(r0 error)](#RunnerTeardownFunc.SetDefaultReturn)
        * [func (f *RunnerTeardownFunc) appendCall(r0 RunnerTeardownFuncCall)](#RunnerTeardownFunc.appendCall)
        * [func (f *RunnerTeardownFunc) nextHook() func(context.Context) error](#RunnerTeardownFunc.nextHook)
    * [type RunnerTeardownFuncCall struct](#RunnerTeardownFuncCall)
        * [func (c RunnerTeardownFuncCall) Args() []interface{}](#RunnerTeardownFuncCall.Args)
        * [func (c RunnerTeardownFuncCall) Results() []interface{}](#RunnerTeardownFuncCall.Results)
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
        * [func (f *StoreDequeueFunc) PushHook(hook func(context.Context, interface{}) (workerutil.Record, workerutil.Store, bool, error))](#StoreDequeueFunc.PushHook)
        * [func (f *StoreDequeueFunc) PushReturn(r0 workerutil.Record, r1 workerutil.Store, r2 bool, r3 error)](#StoreDequeueFunc.PushReturn)
        * [func (f *StoreDequeueFunc) SetDefaultHook(hook func(context.Context, interface{}) (workerutil.Record, workerutil.Store, bool, error))](#StoreDequeueFunc.SetDefaultHook)
        * [func (f *StoreDequeueFunc) SetDefaultReturn(r0 workerutil.Record, r1 workerutil.Store, r2 bool, r3 error)](#StoreDequeueFunc.SetDefaultReturn)
        * [func (f *StoreDequeueFunc) appendCall(r0 StoreDequeueFuncCall)](#StoreDequeueFunc.appendCall)
        * [func (f *StoreDequeueFunc) nextHook() func(context.Context, interface{}) (workerutil.Record, workerutil.Store, bool, error)](#StoreDequeueFunc.nextHook)
    * [type StoreDequeueFuncCall struct](#StoreDequeueFuncCall)
        * [func (c StoreDequeueFuncCall) Args() []interface{}](#StoreDequeueFuncCall.Args)
        * [func (c StoreDequeueFuncCall) Results() []interface{}](#StoreDequeueFuncCall.Results)
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
        * [func (f *StoreQueuedCountFunc) PushHook(hook func(context.Context, interface{}) (int, error))](#StoreQueuedCountFunc.PushHook)
        * [func (f *StoreQueuedCountFunc) PushReturn(r0 int, r1 error)](#StoreQueuedCountFunc.PushReturn)
        * [func (f *StoreQueuedCountFunc) SetDefaultHook(hook func(context.Context, interface{}) (int, error))](#StoreQueuedCountFunc.SetDefaultHook)
        * [func (f *StoreQueuedCountFunc) SetDefaultReturn(r0 int, r1 error)](#StoreQueuedCountFunc.SetDefaultReturn)
        * [func (f *StoreQueuedCountFunc) appendCall(r0 StoreQueuedCountFuncCall)](#StoreQueuedCountFunc.appendCall)
        * [func (f *StoreQueuedCountFunc) nextHook() func(context.Context, interface{}) (int, error)](#StoreQueuedCountFunc.nextHook)
    * [type StoreQueuedCountFuncCall struct](#StoreQueuedCountFuncCall)
        * [func (c StoreQueuedCountFuncCall) Args() []interface{}](#StoreQueuedCountFuncCall.Args)
        * [func (c StoreQueuedCountFuncCall) Results() []interface{}](#StoreQueuedCountFuncCall.Results)
    * [type handler struct](#handler)
        * [func (h *handler) Handle(ctx context.Context, s workerutil.Store, record workerutil.Record) (err error)](#handler.Handle)
        * [func (h *handler) prepareWorkspace(ctx context.Context, commandRunner command.Runner, repositoryName, commit string) (_ string, err error)](#handler.prepareWorkspace)
    * [type storeShim struct](#storeShim)
        * [func (s *storeShim) AddExecutionLogEntry(ctx context.Context, id int, entry workerutil.ExecutionLogEntry) error](#storeShim.AddExecutionLogEntry)
        * [func (s *storeShim) Dequeue(ctx context.Context, extraArguments interface{}) (workerutil.Record, workerutil.Store, bool, error)](#storeShim.Dequeue)
        * [func (s *storeShim) Done(err error) error](#storeShim.Done)
        * [func (s *storeShim) MarkComplete(ctx context.Context, id int) (bool, error)](#storeShim.MarkComplete)
        * [func (s *storeShim) MarkErrored(ctx context.Context, id int, errorMessage string) (bool, error)](#storeShim.MarkErrored)
        * [func (s *storeShim) MarkFailed(ctx context.Context, id int, errorMessage string) (bool, error)](#storeShim.MarkFailed)
        * [func (s *storeShim) QueuedCount(ctx context.Context, extraArguments interface{}) (int, error)](#storeShim.QueuedCount)
* [Functions](#func)
    * [func NewWorker(options Options, observationContext *observation.Context) goroutine.BackgroundRoutine](#NewWorker)
    * [func TestHandle(t *testing.T)](#TestHandle)
    * [func TestIDAddRemove(t *testing.T)](#TestIDAddRemove)
    * [func TestIDSetSlice(t *testing.T)](#TestIDSetSlice)
    * [func TestPrepareWorkspace(t *testing.T)](#TestPrepareWorkspace)
    * [func TestPrepareWorkspaceNoRepository(t *testing.T)](#TestPrepareWorkspaceNoRepository)
    * [func buildScript(dockerStep executor.DockerStep) []byte](#buildScript)
    * [func connectToFrontend(queueStore *apiclient.Client, options Options) bool](#connectToFrontend)
    * [func createHoneyEvent(ctx context.Context, job executor.Job, err error, duration time.Duration) *libhoney.Event](#createHoneyEvent)
    * [func makeRelativeURL(base string, path ...string) (*url.URL, error)](#makeRelativeURL)
    * [func makeTemporaryDirectory() (string, error)](#makeTemporaryDirectory)
    * [func makeURL(base, username, password string, path ...string) (*url.URL, error)](#makeURL)
    * [func scriptNameFromJobStep(job executor.Job, i int) string](#scriptNameFromJobStep)
    * [func union(a, b map[string]string) map[string]string](#union)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="ErrJobAlreadyExists" href="#ErrJobAlreadyExists">var ErrJobAlreadyExists</a>

```
searchKey: worker.ErrJobAlreadyExists
tags: [variable interface]
```

```Go
var ErrJobAlreadyExists = errors.New("job already exists")
```

ErrJobAlreadyExists occurs when a duplicate job identifier is dequeued. 

### <a id="makeTempDir" href="#makeTempDir">var makeTempDir</a>

```
searchKey: worker.makeTempDir
tags: [variable function private]
```

```Go
var makeTempDir = makeTemporaryDirectory
```

makeTempDir defaults to makeTemporaryDirectory and can be replaced for testing with determinstic workspace/scripts directories. 

### <a id="scriptPreamble" href="#scriptPreamble">var scriptPreamble</a>

```
searchKey: worker.scriptPreamble
tags: [variable string private]
```

```Go
var scriptPreamble = `
set -x
`
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="IDSet" href="#IDSet">type IDSet struct</a>

```
searchKey: worker.IDSet
tags: [struct]
```

```Go
type IDSet struct {
	sync.RWMutex
	ids map[int]context.CancelFunc
}
```

#### <a id="newIDSet" href="#newIDSet">func newIDSet() *IDSet</a>

```
searchKey: worker.newIDSet
tags: [function private]
```

```Go
func newIDSet() *IDSet
```

#### <a id="IDSet.Add" href="#IDSet.Add">func (i *IDSet) Add(id int, cancel context.CancelFunc) bool</a>

```
searchKey: worker.IDSet.Add
tags: [method]
```

```Go
func (i *IDSet) Add(id int, cancel context.CancelFunc) bool
```

Add associates the given identifier with the given cancel function in the set. If the identifier was already present then the set is unchanged. 

#### <a id="IDSet.Remove" href="#IDSet.Remove">func (i *IDSet) Remove(id int)</a>

```
searchKey: worker.IDSet.Remove
tags: [method]
```

```Go
func (i *IDSet) Remove(id int)
```

Remove invokes the cancel function associated with the given identifier in the setand removes the identifier from the set. If the identifier is not a member of the set, then no action is performed. 

#### <a id="IDSet.Slice" href="#IDSet.Slice">func (i *IDSet) Slice() []int</a>

```
searchKey: worker.IDSet.Slice
tags: [function]
```

```Go
func (i *IDSet) Slice() []int
```

Slice returns an ordered copy of the identifiers composing the set. 

### <a id="MockRunner" href="#MockRunner">type MockRunner struct</a>

```
searchKey: worker.MockRunner
tags: [struct private]
```

```Go
type MockRunner struct {
	// RunFunc is an instance of a mock function object controlling the
	// behavior of the method Run.
	RunFunc *RunnerRunFunc
	// SetupFunc is an instance of a mock function object controlling the
	// behavior of the method Setup.
	SetupFunc *RunnerSetupFunc
	// TeardownFunc is an instance of a mock function object controlling the
	// behavior of the method Teardown.
	TeardownFunc *RunnerTeardownFunc
}
```

MockRunner is a mock implementation of the Runner interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/executor/internal/command) used for unit testing. 

#### <a id="NewMockRunner" href="#NewMockRunner">func NewMockRunner() *MockRunner</a>

```
searchKey: worker.NewMockRunner
tags: [function private]
```

```Go
func NewMockRunner() *MockRunner
```

NewMockRunner creates a new mock of the Runner interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockRunnerFrom" href="#NewMockRunnerFrom">func NewMockRunnerFrom(i command.Runner) *MockRunner</a>

```
searchKey: worker.NewMockRunnerFrom
tags: [method private]
```

```Go
func NewMockRunnerFrom(i command.Runner) *MockRunner
```

NewMockRunnerFrom creates a new mock of the MockRunner interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockRunner.Run" href="#MockRunner.Run">func (m *MockRunner) Run(v0 context.Context, v1 command.CommandSpec) error</a>

```
searchKey: worker.MockRunner.Run
tags: [method private]
```

```Go
func (m *MockRunner) Run(v0 context.Context, v1 command.CommandSpec) error
```

Run delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockRunner.Setup" href="#MockRunner.Setup">func (m *MockRunner) Setup(v0 context.Context, v1 []string, v2 []string) error</a>

```
searchKey: worker.MockRunner.Setup
tags: [method private]
```

```Go
func (m *MockRunner) Setup(v0 context.Context, v1 []string, v2 []string) error
```

Setup delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockRunner.Teardown" href="#MockRunner.Teardown">func (m *MockRunner) Teardown(v0 context.Context) error</a>

```
searchKey: worker.MockRunner.Teardown
tags: [method private]
```

```Go
func (m *MockRunner) Teardown(v0 context.Context) error
```

Teardown delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MockStore" href="#MockStore">type MockStore struct</a>

```
searchKey: worker.MockStore
tags: [struct private]
```

```Go
type MockStore struct {
	// AddExecutionLogEntryFunc is an instance of a mock function object
	// controlling the behavior of the method AddExecutionLogEntry.
	AddExecutionLogEntryFunc *StoreAddExecutionLogEntryFunc
	// DequeueFunc is an instance of a mock function object controlling the
	// behavior of the method Dequeue.
	DequeueFunc *StoreDequeueFunc
	// DoneFunc is an instance of a mock function object controlling the
	// behavior of the method Done.
	DoneFunc *StoreDoneFunc
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
}
```

MockStore is a mock implementation of the Store interface (from the package github.com/sourcegraph/sourcegraph/internal/workerutil) used for unit testing. 

#### <a id="NewMockStore" href="#NewMockStore">func NewMockStore() *MockStore</a>

```
searchKey: worker.NewMockStore
tags: [function private]
```

```Go
func NewMockStore() *MockStore
```

NewMockStore creates a new mock of the Store interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockStoreFrom" href="#NewMockStoreFrom">func NewMockStoreFrom(i workerutil.Store) *MockStore</a>

```
searchKey: worker.NewMockStoreFrom
tags: [method private]
```

```Go
func NewMockStoreFrom(i workerutil.Store) *MockStore
```

NewMockStoreFrom creates a new mock of the MockStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockStore.AddExecutionLogEntry" href="#MockStore.AddExecutionLogEntry">func (m *MockStore) AddExecutionLogEntry(v0 context.Context, v1 int, v2 workerutil.ExecutionLogEntry) error</a>

```
searchKey: worker.MockStore.AddExecutionLogEntry
tags: [method private]
```

```Go
func (m *MockStore) AddExecutionLogEntry(v0 context.Context, v1 int, v2 workerutil.ExecutionLogEntry) error
```

AddExecutionLogEntry delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.Dequeue" href="#MockStore.Dequeue">func (m *MockStore) Dequeue(v0 context.Context, v1 interface{}) (workerutil.Record, workerutil.Store, bool, error)</a>

```
searchKey: worker.MockStore.Dequeue
tags: [method private]
```

```Go
func (m *MockStore) Dequeue(v0 context.Context, v1 interface{}) (workerutil.Record, workerutil.Store, bool, error)
```

Dequeue delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.Done" href="#MockStore.Done">func (m *MockStore) Done(v0 error) error</a>

```
searchKey: worker.MockStore.Done
tags: [method private]
```

```Go
func (m *MockStore) Done(v0 error) error
```

Done delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.MarkComplete" href="#MockStore.MarkComplete">func (m *MockStore) MarkComplete(v0 context.Context, v1 int) (bool, error)</a>

```
searchKey: worker.MockStore.MarkComplete
tags: [method private]
```

```Go
func (m *MockStore) MarkComplete(v0 context.Context, v1 int) (bool, error)
```

MarkComplete delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.MarkErrored" href="#MockStore.MarkErrored">func (m *MockStore) MarkErrored(v0 context.Context, v1 int, v2 string) (bool, error)</a>

```
searchKey: worker.MockStore.MarkErrored
tags: [method private]
```

```Go
func (m *MockStore) MarkErrored(v0 context.Context, v1 int, v2 string) (bool, error)
```

MarkErrored delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.MarkFailed" href="#MockStore.MarkFailed">func (m *MockStore) MarkFailed(v0 context.Context, v1 int, v2 string) (bool, error)</a>

```
searchKey: worker.MockStore.MarkFailed
tags: [method private]
```

```Go
func (m *MockStore) MarkFailed(v0 context.Context, v1 int, v2 string) (bool, error)
```

MarkFailed delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.QueuedCount" href="#MockStore.QueuedCount">func (m *MockStore) QueuedCount(v0 context.Context, v1 interface{}) (int, error)</a>

```
searchKey: worker.MockStore.QueuedCount
tags: [method private]
```

```Go
func (m *MockStore) QueuedCount(v0 context.Context, v1 interface{}) (int, error)
```

QueuedCount delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="Options" href="#Options">type Options struct</a>

```
searchKey: worker.Options
tags: [struct]
```

```Go
type Options struct {
	// QueueName is the name of the queue to process work from. Having this configurable
	// allows us to have multiple worker pools with different resource requirements and
	// horizontal scaling factors while still uniformly processing events.
	QueueName string

	// HeartbeatInterval denotes the time between heartbeat requests to the queue API.
	HeartbeatInterval time.Duration

	// GitServicePath is the path to the internal git service API proxy in the frontend.
	// This path should contain the endpoints info/refs and git-upload-pack.
	GitServicePath string

	// RedactedValues is a map from strings to replace to their replacement in the command
	// output before sending it to the underlying job store. This should contain all worker
	// environment variables, as well as secret values passed along with the dequeued job
	// payload, which may be sensitive (e.g. shared API tokens, URLs with credentials).
	RedactedValues map[string]string

	// WorkerOptions configures the worker behavior.
	WorkerOptions workerutil.WorkerOptions

	// ClientOptions configures the client that interacts with the queue API.
	ClientOptions apiclient.Options

	// FirecrackerOptions configures the behavior of Firecracker virtual machine creation.
	FirecrackerOptions command.FirecrackerOptions

	// ResourceOptions configures the resource limits of docker container and Firecracker
	// virtual machines running on the executor.
	ResourceOptions command.ResourceOptions

	// MaximumRuntimePerJob is the maximum wall time that can be spent on a single job.
	MaximumRuntimePerJob time.Duration
}
```

### <a id="QueueStore" href="#QueueStore">type QueueStore interface</a>

```
searchKey: worker.QueueStore
tags: [interface]
```

```Go
type QueueStore interface {
	Dequeue(ctx context.Context, queueName string, payload *executor.Job) (bool, error)

	AddExecutionLogEntry(ctx context.Context, queueName string, jobID int, entry workerutil.ExecutionLogEntry) error
	MarkComplete(ctx context.Context, queueName string, jobID int) error
	MarkErrored(ctx context.Context, queueName string, jobID int, errorMessage string) error
	MarkFailed(ctx context.Context, queueName string, jobID int, errorMessage string) error
}
```

### <a id="RunnerRunFunc" href="#RunnerRunFunc">type RunnerRunFunc struct</a>

```
searchKey: worker.RunnerRunFunc
tags: [struct private]
```

```Go
type RunnerRunFunc struct {
	defaultHook func(context.Context, command.CommandSpec) error
	hooks       []func(context.Context, command.CommandSpec) error
	history     []RunnerRunFuncCall
	mutex       sync.Mutex
}
```

RunnerRunFunc describes the behavior when the Run method of the parent MockRunner instance is invoked. 

#### <a id="RunnerRunFunc.History" href="#RunnerRunFunc.History">func (f *RunnerRunFunc) History() []RunnerRunFuncCall</a>

```
searchKey: worker.RunnerRunFunc.History
tags: [function private]
```

```Go
func (f *RunnerRunFunc) History() []RunnerRunFuncCall
```

History returns a sequence of RunnerRunFuncCall objects describing the invocations of this function. 

#### <a id="RunnerRunFunc.PushHook" href="#RunnerRunFunc.PushHook">func (f *RunnerRunFunc) PushHook(hook func(context.Context, command.CommandSpec) error)</a>

```
searchKey: worker.RunnerRunFunc.PushHook
tags: [method private]
```

```Go
func (f *RunnerRunFunc) PushHook(hook func(context.Context, command.CommandSpec) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Run method of the parent MockRunner instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="RunnerRunFunc.PushReturn" href="#RunnerRunFunc.PushReturn">func (f *RunnerRunFunc) PushReturn(r0 error)</a>

```
searchKey: worker.RunnerRunFunc.PushReturn
tags: [method private]
```

```Go
func (f *RunnerRunFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="RunnerRunFunc.SetDefaultHook" href="#RunnerRunFunc.SetDefaultHook">func (f *RunnerRunFunc) SetDefaultHook(hook func(context.Context, command.CommandSpec) error)</a>

```
searchKey: worker.RunnerRunFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *RunnerRunFunc) SetDefaultHook(hook func(context.Context, command.CommandSpec) error)
```

SetDefaultHook sets function that is called when the Run method of the parent MockRunner instance is invoked and the hook queue is empty. 

#### <a id="RunnerRunFunc.SetDefaultReturn" href="#RunnerRunFunc.SetDefaultReturn">func (f *RunnerRunFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.RunnerRunFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *RunnerRunFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="RunnerRunFunc.appendCall" href="#RunnerRunFunc.appendCall">func (f *RunnerRunFunc) appendCall(r0 RunnerRunFuncCall)</a>

```
searchKey: worker.RunnerRunFunc.appendCall
tags: [method private]
```

```Go
func (f *RunnerRunFunc) appendCall(r0 RunnerRunFuncCall)
```

#### <a id="RunnerRunFunc.nextHook" href="#RunnerRunFunc.nextHook">func (f *RunnerRunFunc) nextHook() func(context.Context, command.CommandSpec) error</a>

```
searchKey: worker.RunnerRunFunc.nextHook
tags: [function private]
```

```Go
func (f *RunnerRunFunc) nextHook() func(context.Context, command.CommandSpec) error
```

### <a id="RunnerRunFuncCall" href="#RunnerRunFuncCall">type RunnerRunFuncCall struct</a>

```
searchKey: worker.RunnerRunFuncCall
tags: [struct private]
```

```Go
type RunnerRunFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 command.CommandSpec
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

RunnerRunFuncCall is an object that describes an invocation of method Run on an instance of MockRunner. 

#### <a id="RunnerRunFuncCall.Args" href="#RunnerRunFuncCall.Args">func (c RunnerRunFuncCall) Args() []interface{}</a>

```
searchKey: worker.RunnerRunFuncCall.Args
tags: [function private]
```

```Go
func (c RunnerRunFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="RunnerRunFuncCall.Results" href="#RunnerRunFuncCall.Results">func (c RunnerRunFuncCall) Results() []interface{}</a>

```
searchKey: worker.RunnerRunFuncCall.Results
tags: [function private]
```

```Go
func (c RunnerRunFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="RunnerSetupFunc" href="#RunnerSetupFunc">type RunnerSetupFunc struct</a>

```
searchKey: worker.RunnerSetupFunc
tags: [struct private]
```

```Go
type RunnerSetupFunc struct {
	defaultHook func(context.Context, []string, []string) error
	hooks       []func(context.Context, []string, []string) error
	history     []RunnerSetupFuncCall
	mutex       sync.Mutex
}
```

RunnerSetupFunc describes the behavior when the Setup method of the parent MockRunner instance is invoked. 

#### <a id="RunnerSetupFunc.History" href="#RunnerSetupFunc.History">func (f *RunnerSetupFunc) History() []RunnerSetupFuncCall</a>

```
searchKey: worker.RunnerSetupFunc.History
tags: [function private]
```

```Go
func (f *RunnerSetupFunc) History() []RunnerSetupFuncCall
```

History returns a sequence of RunnerSetupFuncCall objects describing the invocations of this function. 

#### <a id="RunnerSetupFunc.PushHook" href="#RunnerSetupFunc.PushHook">func (f *RunnerSetupFunc) PushHook(hook func(context.Context, []string, []string) error)</a>

```
searchKey: worker.RunnerSetupFunc.PushHook
tags: [method private]
```

```Go
func (f *RunnerSetupFunc) PushHook(hook func(context.Context, []string, []string) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Setup method of the parent MockRunner instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="RunnerSetupFunc.PushReturn" href="#RunnerSetupFunc.PushReturn">func (f *RunnerSetupFunc) PushReturn(r0 error)</a>

```
searchKey: worker.RunnerSetupFunc.PushReturn
tags: [method private]
```

```Go
func (f *RunnerSetupFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="RunnerSetupFunc.SetDefaultHook" href="#RunnerSetupFunc.SetDefaultHook">func (f *RunnerSetupFunc) SetDefaultHook(hook func(context.Context, []string, []string) error)</a>

```
searchKey: worker.RunnerSetupFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *RunnerSetupFunc) SetDefaultHook(hook func(context.Context, []string, []string) error)
```

SetDefaultHook sets function that is called when the Setup method of the parent MockRunner instance is invoked and the hook queue is empty. 

#### <a id="RunnerSetupFunc.SetDefaultReturn" href="#RunnerSetupFunc.SetDefaultReturn">func (f *RunnerSetupFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.RunnerSetupFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *RunnerSetupFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="RunnerSetupFunc.appendCall" href="#RunnerSetupFunc.appendCall">func (f *RunnerSetupFunc) appendCall(r0 RunnerSetupFuncCall)</a>

```
searchKey: worker.RunnerSetupFunc.appendCall
tags: [method private]
```

```Go
func (f *RunnerSetupFunc) appendCall(r0 RunnerSetupFuncCall)
```

#### <a id="RunnerSetupFunc.nextHook" href="#RunnerSetupFunc.nextHook">func (f *RunnerSetupFunc) nextHook() func(context.Context, []string, []string) error</a>

```
searchKey: worker.RunnerSetupFunc.nextHook
tags: [function private]
```

```Go
func (f *RunnerSetupFunc) nextHook() func(context.Context, []string, []string) error
```

### <a id="RunnerSetupFuncCall" href="#RunnerSetupFuncCall">type RunnerSetupFuncCall struct</a>

```
searchKey: worker.RunnerSetupFuncCall
tags: [struct private]
```

```Go
type RunnerSetupFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 []string
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 []string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

RunnerSetupFuncCall is an object that describes an invocation of method Setup on an instance of MockRunner. 

#### <a id="RunnerSetupFuncCall.Args" href="#RunnerSetupFuncCall.Args">func (c RunnerSetupFuncCall) Args() []interface{}</a>

```
searchKey: worker.RunnerSetupFuncCall.Args
tags: [function private]
```

```Go
func (c RunnerSetupFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="RunnerSetupFuncCall.Results" href="#RunnerSetupFuncCall.Results">func (c RunnerSetupFuncCall) Results() []interface{}</a>

```
searchKey: worker.RunnerSetupFuncCall.Results
tags: [function private]
```

```Go
func (c RunnerSetupFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="RunnerTeardownFunc" href="#RunnerTeardownFunc">type RunnerTeardownFunc struct</a>

```
searchKey: worker.RunnerTeardownFunc
tags: [struct private]
```

```Go
type RunnerTeardownFunc struct {
	defaultHook func(context.Context) error
	hooks       []func(context.Context) error
	history     []RunnerTeardownFuncCall
	mutex       sync.Mutex
}
```

RunnerTeardownFunc describes the behavior when the Teardown method of the parent MockRunner instance is invoked. 

#### <a id="RunnerTeardownFunc.History" href="#RunnerTeardownFunc.History">func (f *RunnerTeardownFunc) History() []RunnerTeardownFuncCall</a>

```
searchKey: worker.RunnerTeardownFunc.History
tags: [function private]
```

```Go
func (f *RunnerTeardownFunc) History() []RunnerTeardownFuncCall
```

History returns a sequence of RunnerTeardownFuncCall objects describing the invocations of this function. 

#### <a id="RunnerTeardownFunc.PushHook" href="#RunnerTeardownFunc.PushHook">func (f *RunnerTeardownFunc) PushHook(hook func(context.Context) error)</a>

```
searchKey: worker.RunnerTeardownFunc.PushHook
tags: [method private]
```

```Go
func (f *RunnerTeardownFunc) PushHook(hook func(context.Context) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Teardown method of the parent MockRunner instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="RunnerTeardownFunc.PushReturn" href="#RunnerTeardownFunc.PushReturn">func (f *RunnerTeardownFunc) PushReturn(r0 error)</a>

```
searchKey: worker.RunnerTeardownFunc.PushReturn
tags: [method private]
```

```Go
func (f *RunnerTeardownFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="RunnerTeardownFunc.SetDefaultHook" href="#RunnerTeardownFunc.SetDefaultHook">func (f *RunnerTeardownFunc) SetDefaultHook(hook func(context.Context) error)</a>

```
searchKey: worker.RunnerTeardownFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *RunnerTeardownFunc) SetDefaultHook(hook func(context.Context) error)
```

SetDefaultHook sets function that is called when the Teardown method of the parent MockRunner instance is invoked and the hook queue is empty. 

#### <a id="RunnerTeardownFunc.SetDefaultReturn" href="#RunnerTeardownFunc.SetDefaultReturn">func (f *RunnerTeardownFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.RunnerTeardownFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *RunnerTeardownFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="RunnerTeardownFunc.appendCall" href="#RunnerTeardownFunc.appendCall">func (f *RunnerTeardownFunc) appendCall(r0 RunnerTeardownFuncCall)</a>

```
searchKey: worker.RunnerTeardownFunc.appendCall
tags: [method private]
```

```Go
func (f *RunnerTeardownFunc) appendCall(r0 RunnerTeardownFuncCall)
```

#### <a id="RunnerTeardownFunc.nextHook" href="#RunnerTeardownFunc.nextHook">func (f *RunnerTeardownFunc) nextHook() func(context.Context) error</a>

```
searchKey: worker.RunnerTeardownFunc.nextHook
tags: [function private]
```

```Go
func (f *RunnerTeardownFunc) nextHook() func(context.Context) error
```

### <a id="RunnerTeardownFuncCall" href="#RunnerTeardownFuncCall">type RunnerTeardownFuncCall struct</a>

```
searchKey: worker.RunnerTeardownFuncCall
tags: [struct private]
```

```Go
type RunnerTeardownFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

RunnerTeardownFuncCall is an object that describes an invocation of method Teardown on an instance of MockRunner. 

#### <a id="RunnerTeardownFuncCall.Args" href="#RunnerTeardownFuncCall.Args">func (c RunnerTeardownFuncCall) Args() []interface{}</a>

```
searchKey: worker.RunnerTeardownFuncCall.Args
tags: [function private]
```

```Go
func (c RunnerTeardownFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="RunnerTeardownFuncCall.Results" href="#RunnerTeardownFuncCall.Results">func (c RunnerTeardownFuncCall) Results() []interface{}</a>

```
searchKey: worker.RunnerTeardownFuncCall.Results
tags: [function private]
```

```Go
func (c RunnerTeardownFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreAddExecutionLogEntryFunc" href="#StoreAddExecutionLogEntryFunc">type StoreAddExecutionLogEntryFunc struct</a>

```
searchKey: worker.StoreAddExecutionLogEntryFunc
tags: [struct private]
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
searchKey: worker.StoreAddExecutionLogEntryFunc.History
tags: [function private]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) History() []StoreAddExecutionLogEntryFuncCall
```

History returns a sequence of StoreAddExecutionLogEntryFuncCall objects describing the invocations of this function. 

#### <a id="StoreAddExecutionLogEntryFunc.PushHook" href="#StoreAddExecutionLogEntryFunc.PushHook">func (f *StoreAddExecutionLogEntryFunc) PushHook(hook func(context.Context, int, workerutil.ExecutionLogEntry) error)</a>

```
searchKey: worker.StoreAddExecutionLogEntryFunc.PushHook
tags: [method private]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) PushHook(hook func(context.Context, int, workerutil.ExecutionLogEntry) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the AddExecutionLogEntry method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreAddExecutionLogEntryFunc.PushReturn" href="#StoreAddExecutionLogEntryFunc.PushReturn">func (f *StoreAddExecutionLogEntryFunc) PushReturn(r0 error)</a>

```
searchKey: worker.StoreAddExecutionLogEntryFunc.PushReturn
tags: [method private]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreAddExecutionLogEntryFunc.SetDefaultHook" href="#StoreAddExecutionLogEntryFunc.SetDefaultHook">func (f *StoreAddExecutionLogEntryFunc) SetDefaultHook(hook func(context.Context, int, workerutil.ExecutionLogEntry) error)</a>

```
searchKey: worker.StoreAddExecutionLogEntryFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) SetDefaultHook(hook func(context.Context, int, workerutil.ExecutionLogEntry) error)
```

SetDefaultHook sets function that is called when the AddExecutionLogEntry method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreAddExecutionLogEntryFunc.SetDefaultReturn" href="#StoreAddExecutionLogEntryFunc.SetDefaultReturn">func (f *StoreAddExecutionLogEntryFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.StoreAddExecutionLogEntryFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreAddExecutionLogEntryFunc.appendCall" href="#StoreAddExecutionLogEntryFunc.appendCall">func (f *StoreAddExecutionLogEntryFunc) appendCall(r0 StoreAddExecutionLogEntryFuncCall)</a>

```
searchKey: worker.StoreAddExecutionLogEntryFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) appendCall(r0 StoreAddExecutionLogEntryFuncCall)
```

#### <a id="StoreAddExecutionLogEntryFunc.nextHook" href="#StoreAddExecutionLogEntryFunc.nextHook">func (f *StoreAddExecutionLogEntryFunc) nextHook() func(context.Context, int, workerutil.ExecutionLogEntry) error</a>

```
searchKey: worker.StoreAddExecutionLogEntryFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) nextHook() func(context.Context, int, workerutil.ExecutionLogEntry) error
```

### <a id="StoreAddExecutionLogEntryFuncCall" href="#StoreAddExecutionLogEntryFuncCall">type StoreAddExecutionLogEntryFuncCall struct</a>

```
searchKey: worker.StoreAddExecutionLogEntryFuncCall
tags: [struct private]
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
searchKey: worker.StoreAddExecutionLogEntryFuncCall.Args
tags: [function private]
```

```Go
func (c StoreAddExecutionLogEntryFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreAddExecutionLogEntryFuncCall.Results" href="#StoreAddExecutionLogEntryFuncCall.Results">func (c StoreAddExecutionLogEntryFuncCall) Results() []interface{}</a>

```
searchKey: worker.StoreAddExecutionLogEntryFuncCall.Results
tags: [function private]
```

```Go
func (c StoreAddExecutionLogEntryFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreDequeueFunc" href="#StoreDequeueFunc">type StoreDequeueFunc struct</a>

```
searchKey: worker.StoreDequeueFunc
tags: [struct private]
```

```Go
type StoreDequeueFunc struct {
	defaultHook func(context.Context, interface{}) (workerutil.Record, workerutil.Store, bool, error)
	hooks       []func(context.Context, interface{}) (workerutil.Record, workerutil.Store, bool, error)
	history     []StoreDequeueFuncCall
	mutex       sync.Mutex
}
```

StoreDequeueFunc describes the behavior when the Dequeue method of the parent MockStore instance is invoked. 

#### <a id="StoreDequeueFunc.History" href="#StoreDequeueFunc.History">func (f *StoreDequeueFunc) History() []StoreDequeueFuncCall</a>

```
searchKey: worker.StoreDequeueFunc.History
tags: [function private]
```

```Go
func (f *StoreDequeueFunc) History() []StoreDequeueFuncCall
```

History returns a sequence of StoreDequeueFuncCall objects describing the invocations of this function. 

#### <a id="StoreDequeueFunc.PushHook" href="#StoreDequeueFunc.PushHook">func (f *StoreDequeueFunc) PushHook(hook func(context.Context, interface{}) (workerutil.Record, workerutil.Store, bool, error))</a>

```
searchKey: worker.StoreDequeueFunc.PushHook
tags: [method private]
```

```Go
func (f *StoreDequeueFunc) PushHook(hook func(context.Context, interface{}) (workerutil.Record, workerutil.Store, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Dequeue method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreDequeueFunc.PushReturn" href="#StoreDequeueFunc.PushReturn">func (f *StoreDequeueFunc) PushReturn(r0 workerutil.Record, r1 workerutil.Store, r2 bool, r3 error)</a>

```
searchKey: worker.StoreDequeueFunc.PushReturn
tags: [method private]
```

```Go
func (f *StoreDequeueFunc) PushReturn(r0 workerutil.Record, r1 workerutil.Store, r2 bool, r3 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreDequeueFunc.SetDefaultHook" href="#StoreDequeueFunc.SetDefaultHook">func (f *StoreDequeueFunc) SetDefaultHook(hook func(context.Context, interface{}) (workerutil.Record, workerutil.Store, bool, error))</a>

```
searchKey: worker.StoreDequeueFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *StoreDequeueFunc) SetDefaultHook(hook func(context.Context, interface{}) (workerutil.Record, workerutil.Store, bool, error))
```

SetDefaultHook sets function that is called when the Dequeue method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreDequeueFunc.SetDefaultReturn" href="#StoreDequeueFunc.SetDefaultReturn">func (f *StoreDequeueFunc) SetDefaultReturn(r0 workerutil.Record, r1 workerutil.Store, r2 bool, r3 error)</a>

```
searchKey: worker.StoreDequeueFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *StoreDequeueFunc) SetDefaultReturn(r0 workerutil.Record, r1 workerutil.Store, r2 bool, r3 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreDequeueFunc.appendCall" href="#StoreDequeueFunc.appendCall">func (f *StoreDequeueFunc) appendCall(r0 StoreDequeueFuncCall)</a>

```
searchKey: worker.StoreDequeueFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreDequeueFunc) appendCall(r0 StoreDequeueFuncCall)
```

#### <a id="StoreDequeueFunc.nextHook" href="#StoreDequeueFunc.nextHook">func (f *StoreDequeueFunc) nextHook() func(context.Context, interface{}) (workerutil.Record, workerutil.Store, bool, error)</a>

```
searchKey: worker.StoreDequeueFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreDequeueFunc) nextHook() func(context.Context, interface{}) (workerutil.Record, workerutil.Store, bool, error)
```

### <a id="StoreDequeueFuncCall" href="#StoreDequeueFuncCall">type StoreDequeueFuncCall struct</a>

```
searchKey: worker.StoreDequeueFuncCall
tags: [struct private]
```

```Go
type StoreDequeueFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 interface{}
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 workerutil.Record
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 workerutil.Store
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
searchKey: worker.StoreDequeueFuncCall.Args
tags: [function private]
```

```Go
func (c StoreDequeueFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreDequeueFuncCall.Results" href="#StoreDequeueFuncCall.Results">func (c StoreDequeueFuncCall) Results() []interface{}</a>

```
searchKey: worker.StoreDequeueFuncCall.Results
tags: [function private]
```

```Go
func (c StoreDequeueFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreDoneFunc" href="#StoreDoneFunc">type StoreDoneFunc struct</a>

```
searchKey: worker.StoreDoneFunc
tags: [struct private]
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
searchKey: worker.StoreDoneFunc.History
tags: [function private]
```

```Go
func (f *StoreDoneFunc) History() []StoreDoneFuncCall
```

History returns a sequence of StoreDoneFuncCall objects describing the invocations of this function. 

#### <a id="StoreDoneFunc.PushHook" href="#StoreDoneFunc.PushHook">func (f *StoreDoneFunc) PushHook(hook func(error) error)</a>

```
searchKey: worker.StoreDoneFunc.PushHook
tags: [method private]
```

```Go
func (f *StoreDoneFunc) PushHook(hook func(error) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Done method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreDoneFunc.PushReturn" href="#StoreDoneFunc.PushReturn">func (f *StoreDoneFunc) PushReturn(r0 error)</a>

```
searchKey: worker.StoreDoneFunc.PushReturn
tags: [method private]
```

```Go
func (f *StoreDoneFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreDoneFunc.SetDefaultHook" href="#StoreDoneFunc.SetDefaultHook">func (f *StoreDoneFunc) SetDefaultHook(hook func(error) error)</a>

```
searchKey: worker.StoreDoneFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *StoreDoneFunc) SetDefaultHook(hook func(error) error)
```

SetDefaultHook sets function that is called when the Done method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreDoneFunc.SetDefaultReturn" href="#StoreDoneFunc.SetDefaultReturn">func (f *StoreDoneFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: worker.StoreDoneFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *StoreDoneFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreDoneFunc.appendCall" href="#StoreDoneFunc.appendCall">func (f *StoreDoneFunc) appendCall(r0 StoreDoneFuncCall)</a>

```
searchKey: worker.StoreDoneFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreDoneFunc) appendCall(r0 StoreDoneFuncCall)
```

#### <a id="StoreDoneFunc.nextHook" href="#StoreDoneFunc.nextHook">func (f *StoreDoneFunc) nextHook() func(error) error</a>

```
searchKey: worker.StoreDoneFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreDoneFunc) nextHook() func(error) error
```

### <a id="StoreDoneFuncCall" href="#StoreDoneFuncCall">type StoreDoneFuncCall struct</a>

```
searchKey: worker.StoreDoneFuncCall
tags: [struct private]
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
searchKey: worker.StoreDoneFuncCall.Args
tags: [function private]
```

```Go
func (c StoreDoneFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreDoneFuncCall.Results" href="#StoreDoneFuncCall.Results">func (c StoreDoneFuncCall) Results() []interface{}</a>

```
searchKey: worker.StoreDoneFuncCall.Results
tags: [function private]
```

```Go
func (c StoreDoneFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreMarkCompleteFunc" href="#StoreMarkCompleteFunc">type StoreMarkCompleteFunc struct</a>

```
searchKey: worker.StoreMarkCompleteFunc
tags: [struct private]
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
searchKey: worker.StoreMarkCompleteFunc.History
tags: [function private]
```

```Go
func (f *StoreMarkCompleteFunc) History() []StoreMarkCompleteFuncCall
```

History returns a sequence of StoreMarkCompleteFuncCall objects describing the invocations of this function. 

#### <a id="StoreMarkCompleteFunc.PushHook" href="#StoreMarkCompleteFunc.PushHook">func (f *StoreMarkCompleteFunc) PushHook(hook func(context.Context, int) (bool, error))</a>

```
searchKey: worker.StoreMarkCompleteFunc.PushHook
tags: [method private]
```

```Go
func (f *StoreMarkCompleteFunc) PushHook(hook func(context.Context, int) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkComplete method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreMarkCompleteFunc.PushReturn" href="#StoreMarkCompleteFunc.PushReturn">func (f *StoreMarkCompleteFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: worker.StoreMarkCompleteFunc.PushReturn
tags: [method private]
```

```Go
func (f *StoreMarkCompleteFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkCompleteFunc.SetDefaultHook" href="#StoreMarkCompleteFunc.SetDefaultHook">func (f *StoreMarkCompleteFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))</a>

```
searchKey: worker.StoreMarkCompleteFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *StoreMarkCompleteFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))
```

SetDefaultHook sets function that is called when the MarkComplete method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreMarkCompleteFunc.SetDefaultReturn" href="#StoreMarkCompleteFunc.SetDefaultReturn">func (f *StoreMarkCompleteFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: worker.StoreMarkCompleteFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *StoreMarkCompleteFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkCompleteFunc.appendCall" href="#StoreMarkCompleteFunc.appendCall">func (f *StoreMarkCompleteFunc) appendCall(r0 StoreMarkCompleteFuncCall)</a>

```
searchKey: worker.StoreMarkCompleteFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreMarkCompleteFunc) appendCall(r0 StoreMarkCompleteFuncCall)
```

#### <a id="StoreMarkCompleteFunc.nextHook" href="#StoreMarkCompleteFunc.nextHook">func (f *StoreMarkCompleteFunc) nextHook() func(context.Context, int) (bool, error)</a>

```
searchKey: worker.StoreMarkCompleteFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreMarkCompleteFunc) nextHook() func(context.Context, int) (bool, error)
```

### <a id="StoreMarkCompleteFuncCall" href="#StoreMarkCompleteFuncCall">type StoreMarkCompleteFuncCall struct</a>

```
searchKey: worker.StoreMarkCompleteFuncCall
tags: [struct private]
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
searchKey: worker.StoreMarkCompleteFuncCall.Args
tags: [function private]
```

```Go
func (c StoreMarkCompleteFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreMarkCompleteFuncCall.Results" href="#StoreMarkCompleteFuncCall.Results">func (c StoreMarkCompleteFuncCall) Results() []interface{}</a>

```
searchKey: worker.StoreMarkCompleteFuncCall.Results
tags: [function private]
```

```Go
func (c StoreMarkCompleteFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreMarkErroredFunc" href="#StoreMarkErroredFunc">type StoreMarkErroredFunc struct</a>

```
searchKey: worker.StoreMarkErroredFunc
tags: [struct private]
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
searchKey: worker.StoreMarkErroredFunc.History
tags: [function private]
```

```Go
func (f *StoreMarkErroredFunc) History() []StoreMarkErroredFuncCall
```

History returns a sequence of StoreMarkErroredFuncCall objects describing the invocations of this function. 

#### <a id="StoreMarkErroredFunc.PushHook" href="#StoreMarkErroredFunc.PushHook">func (f *StoreMarkErroredFunc) PushHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: worker.StoreMarkErroredFunc.PushHook
tags: [method private]
```

```Go
func (f *StoreMarkErroredFunc) PushHook(hook func(context.Context, int, string) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkErrored method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreMarkErroredFunc.PushReturn" href="#StoreMarkErroredFunc.PushReturn">func (f *StoreMarkErroredFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: worker.StoreMarkErroredFunc.PushReturn
tags: [method private]
```

```Go
func (f *StoreMarkErroredFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkErroredFunc.SetDefaultHook" href="#StoreMarkErroredFunc.SetDefaultHook">func (f *StoreMarkErroredFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: worker.StoreMarkErroredFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *StoreMarkErroredFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))
```

SetDefaultHook sets function that is called when the MarkErrored method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreMarkErroredFunc.SetDefaultReturn" href="#StoreMarkErroredFunc.SetDefaultReturn">func (f *StoreMarkErroredFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: worker.StoreMarkErroredFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *StoreMarkErroredFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkErroredFunc.appendCall" href="#StoreMarkErroredFunc.appendCall">func (f *StoreMarkErroredFunc) appendCall(r0 StoreMarkErroredFuncCall)</a>

```
searchKey: worker.StoreMarkErroredFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreMarkErroredFunc) appendCall(r0 StoreMarkErroredFuncCall)
```

#### <a id="StoreMarkErroredFunc.nextHook" href="#StoreMarkErroredFunc.nextHook">func (f *StoreMarkErroredFunc) nextHook() func(context.Context, int, string) (bool, error)</a>

```
searchKey: worker.StoreMarkErroredFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreMarkErroredFunc) nextHook() func(context.Context, int, string) (bool, error)
```

### <a id="StoreMarkErroredFuncCall" href="#StoreMarkErroredFuncCall">type StoreMarkErroredFuncCall struct</a>

```
searchKey: worker.StoreMarkErroredFuncCall
tags: [struct private]
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
searchKey: worker.StoreMarkErroredFuncCall.Args
tags: [function private]
```

```Go
func (c StoreMarkErroredFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreMarkErroredFuncCall.Results" href="#StoreMarkErroredFuncCall.Results">func (c StoreMarkErroredFuncCall) Results() []interface{}</a>

```
searchKey: worker.StoreMarkErroredFuncCall.Results
tags: [function private]
```

```Go
func (c StoreMarkErroredFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreMarkFailedFunc" href="#StoreMarkFailedFunc">type StoreMarkFailedFunc struct</a>

```
searchKey: worker.StoreMarkFailedFunc
tags: [struct private]
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
searchKey: worker.StoreMarkFailedFunc.History
tags: [function private]
```

```Go
func (f *StoreMarkFailedFunc) History() []StoreMarkFailedFuncCall
```

History returns a sequence of StoreMarkFailedFuncCall objects describing the invocations of this function. 

#### <a id="StoreMarkFailedFunc.PushHook" href="#StoreMarkFailedFunc.PushHook">func (f *StoreMarkFailedFunc) PushHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: worker.StoreMarkFailedFunc.PushHook
tags: [method private]
```

```Go
func (f *StoreMarkFailedFunc) PushHook(hook func(context.Context, int, string) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkFailed method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreMarkFailedFunc.PushReturn" href="#StoreMarkFailedFunc.PushReturn">func (f *StoreMarkFailedFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: worker.StoreMarkFailedFunc.PushReturn
tags: [method private]
```

```Go
func (f *StoreMarkFailedFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkFailedFunc.SetDefaultHook" href="#StoreMarkFailedFunc.SetDefaultHook">func (f *StoreMarkFailedFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: worker.StoreMarkFailedFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *StoreMarkFailedFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))
```

SetDefaultHook sets function that is called when the MarkFailed method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreMarkFailedFunc.SetDefaultReturn" href="#StoreMarkFailedFunc.SetDefaultReturn">func (f *StoreMarkFailedFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: worker.StoreMarkFailedFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *StoreMarkFailedFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkFailedFunc.appendCall" href="#StoreMarkFailedFunc.appendCall">func (f *StoreMarkFailedFunc) appendCall(r0 StoreMarkFailedFuncCall)</a>

```
searchKey: worker.StoreMarkFailedFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreMarkFailedFunc) appendCall(r0 StoreMarkFailedFuncCall)
```

#### <a id="StoreMarkFailedFunc.nextHook" href="#StoreMarkFailedFunc.nextHook">func (f *StoreMarkFailedFunc) nextHook() func(context.Context, int, string) (bool, error)</a>

```
searchKey: worker.StoreMarkFailedFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreMarkFailedFunc) nextHook() func(context.Context, int, string) (bool, error)
```

### <a id="StoreMarkFailedFuncCall" href="#StoreMarkFailedFuncCall">type StoreMarkFailedFuncCall struct</a>

```
searchKey: worker.StoreMarkFailedFuncCall
tags: [struct private]
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
searchKey: worker.StoreMarkFailedFuncCall.Args
tags: [function private]
```

```Go
func (c StoreMarkFailedFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreMarkFailedFuncCall.Results" href="#StoreMarkFailedFuncCall.Results">func (c StoreMarkFailedFuncCall) Results() []interface{}</a>

```
searchKey: worker.StoreMarkFailedFuncCall.Results
tags: [function private]
```

```Go
func (c StoreMarkFailedFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreQueuedCountFunc" href="#StoreQueuedCountFunc">type StoreQueuedCountFunc struct</a>

```
searchKey: worker.StoreQueuedCountFunc
tags: [struct private]
```

```Go
type StoreQueuedCountFunc struct {
	defaultHook func(context.Context, interface{}) (int, error)
	hooks       []func(context.Context, interface{}) (int, error)
	history     []StoreQueuedCountFuncCall
	mutex       sync.Mutex
}
```

StoreQueuedCountFunc describes the behavior when the QueuedCount method of the parent MockStore instance is invoked. 

#### <a id="StoreQueuedCountFunc.History" href="#StoreQueuedCountFunc.History">func (f *StoreQueuedCountFunc) History() []StoreQueuedCountFuncCall</a>

```
searchKey: worker.StoreQueuedCountFunc.History
tags: [function private]
```

```Go
func (f *StoreQueuedCountFunc) History() []StoreQueuedCountFuncCall
```

History returns a sequence of StoreQueuedCountFuncCall objects describing the invocations of this function. 

#### <a id="StoreQueuedCountFunc.PushHook" href="#StoreQueuedCountFunc.PushHook">func (f *StoreQueuedCountFunc) PushHook(hook func(context.Context, interface{}) (int, error))</a>

```
searchKey: worker.StoreQueuedCountFunc.PushHook
tags: [method private]
```

```Go
func (f *StoreQueuedCountFunc) PushHook(hook func(context.Context, interface{}) (int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the QueuedCount method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreQueuedCountFunc.PushReturn" href="#StoreQueuedCountFunc.PushReturn">func (f *StoreQueuedCountFunc) PushReturn(r0 int, r1 error)</a>

```
searchKey: worker.StoreQueuedCountFunc.PushReturn
tags: [method private]
```

```Go
func (f *StoreQueuedCountFunc) PushReturn(r0 int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreQueuedCountFunc.SetDefaultHook" href="#StoreQueuedCountFunc.SetDefaultHook">func (f *StoreQueuedCountFunc) SetDefaultHook(hook func(context.Context, interface{}) (int, error))</a>

```
searchKey: worker.StoreQueuedCountFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *StoreQueuedCountFunc) SetDefaultHook(hook func(context.Context, interface{}) (int, error))
```

SetDefaultHook sets function that is called when the QueuedCount method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreQueuedCountFunc.SetDefaultReturn" href="#StoreQueuedCountFunc.SetDefaultReturn">func (f *StoreQueuedCountFunc) SetDefaultReturn(r0 int, r1 error)</a>

```
searchKey: worker.StoreQueuedCountFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *StoreQueuedCountFunc) SetDefaultReturn(r0 int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreQueuedCountFunc.appendCall" href="#StoreQueuedCountFunc.appendCall">func (f *StoreQueuedCountFunc) appendCall(r0 StoreQueuedCountFuncCall)</a>

```
searchKey: worker.StoreQueuedCountFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreQueuedCountFunc) appendCall(r0 StoreQueuedCountFuncCall)
```

#### <a id="StoreQueuedCountFunc.nextHook" href="#StoreQueuedCountFunc.nextHook">func (f *StoreQueuedCountFunc) nextHook() func(context.Context, interface{}) (int, error)</a>

```
searchKey: worker.StoreQueuedCountFunc.nextHook
tags: [function private]
```

```Go
func (f *StoreQueuedCountFunc) nextHook() func(context.Context, interface{}) (int, error)
```

### <a id="StoreQueuedCountFuncCall" href="#StoreQueuedCountFuncCall">type StoreQueuedCountFuncCall struct</a>

```
searchKey: worker.StoreQueuedCountFuncCall
tags: [struct private]
```

```Go
type StoreQueuedCountFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 interface{}
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
searchKey: worker.StoreQueuedCountFuncCall.Args
tags: [function private]
```

```Go
func (c StoreQueuedCountFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreQueuedCountFuncCall.Results" href="#StoreQueuedCountFuncCall.Results">func (c StoreQueuedCountFuncCall) Results() []interface{}</a>

```
searchKey: worker.StoreQueuedCountFuncCall.Results
tags: [function private]
```

```Go
func (c StoreQueuedCountFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="handler" href="#handler">type handler struct</a>

```
searchKey: worker.handler
tags: [struct private]
```

```Go
type handler struct {
	idSet         *IDSet
	options       Options
	operations    *command.Operations
	runnerFactory func(dir string, logger *command.Logger, options command.Options, operations *command.Operations) command.Runner
}
```

#### <a id="handler.Handle" href="#handler.Handle">func (h *handler) Handle(ctx context.Context, s workerutil.Store, record workerutil.Record) (err error)</a>

```
searchKey: worker.handler.Handle
tags: [method private]
```

```Go
func (h *handler) Handle(ctx context.Context, s workerutil.Store, record workerutil.Record) (err error)
```

Handle clones the target code into a temporary directory, invokes the target indexer in a fresh docker container, and uploads the results to the external frontend API. 

#### <a id="handler.prepareWorkspace" href="#handler.prepareWorkspace">func (h *handler) prepareWorkspace(ctx context.Context, commandRunner command.Runner, repositoryName, commit string) (_ string, err error)</a>

```
searchKey: worker.handler.prepareWorkspace
tags: [method private]
```

```Go
func (h *handler) prepareWorkspace(ctx context.Context, commandRunner command.Runner, repositoryName, commit string) (_ string, err error)
```

prepareWorkspace creates and returns a temporary director in which acts the workspace while processing a single job. It is up to the caller to ensure that this directory is removed after the job has finished processing. If a repository name is supplied, then that repository will be cloned (through the frontend API) into the workspace. 

### <a id="storeShim" href="#storeShim">type storeShim struct</a>

```
searchKey: worker.storeShim
tags: [struct private]
```

```Go
type storeShim struct {
	queueName  string
	queueStore QueueStore
}
```

#### <a id="storeShim.AddExecutionLogEntry" href="#storeShim.AddExecutionLogEntry">func (s *storeShim) AddExecutionLogEntry(ctx context.Context, id int, entry workerutil.ExecutionLogEntry) error</a>

```
searchKey: worker.storeShim.AddExecutionLogEntry
tags: [method private]
```

```Go
func (s *storeShim) AddExecutionLogEntry(ctx context.Context, id int, entry workerutil.ExecutionLogEntry) error
```

#### <a id="storeShim.Dequeue" href="#storeShim.Dequeue">func (s *storeShim) Dequeue(ctx context.Context, extraArguments interface{}) (workerutil.Record, workerutil.Store, bool, error)</a>

```
searchKey: worker.storeShim.Dequeue
tags: [method private]
```

```Go
func (s *storeShim) Dequeue(ctx context.Context, extraArguments interface{}) (workerutil.Record, workerutil.Store, bool, error)
```

#### <a id="storeShim.Done" href="#storeShim.Done">func (s *storeShim) Done(err error) error</a>

```
searchKey: worker.storeShim.Done
tags: [method private]
```

```Go
func (s *storeShim) Done(err error) error
```

#### <a id="storeShim.MarkComplete" href="#storeShim.MarkComplete">func (s *storeShim) MarkComplete(ctx context.Context, id int) (bool, error)</a>

```
searchKey: worker.storeShim.MarkComplete
tags: [method private]
```

```Go
func (s *storeShim) MarkComplete(ctx context.Context, id int) (bool, error)
```

#### <a id="storeShim.MarkErrored" href="#storeShim.MarkErrored">func (s *storeShim) MarkErrored(ctx context.Context, id int, errorMessage string) (bool, error)</a>

```
searchKey: worker.storeShim.MarkErrored
tags: [method private]
```

```Go
func (s *storeShim) MarkErrored(ctx context.Context, id int, errorMessage string) (bool, error)
```

#### <a id="storeShim.MarkFailed" href="#storeShim.MarkFailed">func (s *storeShim) MarkFailed(ctx context.Context, id int, errorMessage string) (bool, error)</a>

```
searchKey: worker.storeShim.MarkFailed
tags: [method private]
```

```Go
func (s *storeShim) MarkFailed(ctx context.Context, id int, errorMessage string) (bool, error)
```

#### <a id="storeShim.QueuedCount" href="#storeShim.QueuedCount">func (s *storeShim) QueuedCount(ctx context.Context, extraArguments interface{}) (int, error)</a>

```
searchKey: worker.storeShim.QueuedCount
tags: [method private]
```

```Go
func (s *storeShim) QueuedCount(ctx context.Context, extraArguments interface{}) (int, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="NewWorker" href="#NewWorker">func NewWorker(options Options, observationContext *observation.Context) goroutine.BackgroundRoutine</a>

```
searchKey: worker.NewWorker
tags: [method]
```

```Go
func NewWorker(options Options, observationContext *observation.Context) goroutine.BackgroundRoutine
```

NewWorker creates a worker that polls a remote job queue API for work. The returned routine contains both a worker that periodically polls for new work to perform, as well as a heartbeat routine that will periodically hit the remote API with the work that is currently being performed, which is necessary so the job queue API doesn't hand out jobs it thinks may have been dropped. 

### <a id="TestHandle" href="#TestHandle">func TestHandle(t *testing.T)</a>

```
searchKey: worker.TestHandle
tags: [method private test]
```

```Go
func TestHandle(t *testing.T)
```

### <a id="TestIDAddRemove" href="#TestIDAddRemove">func TestIDAddRemove(t *testing.T)</a>

```
searchKey: worker.TestIDAddRemove
tags: [method private test]
```

```Go
func TestIDAddRemove(t *testing.T)
```

### <a id="TestIDSetSlice" href="#TestIDSetSlice">func TestIDSetSlice(t *testing.T)</a>

```
searchKey: worker.TestIDSetSlice
tags: [method private test]
```

```Go
func TestIDSetSlice(t *testing.T)
```

### <a id="TestPrepareWorkspace" href="#TestPrepareWorkspace">func TestPrepareWorkspace(t *testing.T)</a>

```
searchKey: worker.TestPrepareWorkspace
tags: [method private test]
```

```Go
func TestPrepareWorkspace(t *testing.T)
```

### <a id="TestPrepareWorkspaceNoRepository" href="#TestPrepareWorkspaceNoRepository">func TestPrepareWorkspaceNoRepository(t *testing.T)</a>

```
searchKey: worker.TestPrepareWorkspaceNoRepository
tags: [method private test]
```

```Go
func TestPrepareWorkspaceNoRepository(t *testing.T)
```

### <a id="buildScript" href="#buildScript">func buildScript(dockerStep executor.DockerStep) []byte</a>

```
searchKey: worker.buildScript
tags: [method private]
```

```Go
func buildScript(dockerStep executor.DockerStep) []byte
```

### <a id="connectToFrontend" href="#connectToFrontend">func connectToFrontend(queueStore *apiclient.Client, options Options) bool</a>

```
searchKey: worker.connectToFrontend
tags: [method private]
```

```Go
func connectToFrontend(queueStore *apiclient.Client, options Options) bool
```

connectToFrontend will ping the configured Sourcegraph instance until it receives a 200 response. For the first minute, "connection refused" errors will not be emitted. This is to stop log spam in dev environments where the executor may start up before the frontend. This method returns true after a ping is successful and returns false if a user signal is received. 

### <a id="createHoneyEvent" href="#createHoneyEvent">func createHoneyEvent(ctx context.Context, job executor.Job, err error, duration time.Duration) *libhoney.Event</a>

```
searchKey: worker.createHoneyEvent
tags: [method private]
```

```Go
func createHoneyEvent(ctx context.Context, job executor.Job, err error, duration time.Duration) *libhoney.Event
```

### <a id="makeRelativeURL" href="#makeRelativeURL">func makeRelativeURL(base string, path ...string) (*url.URL, error)</a>

```
searchKey: worker.makeRelativeURL
tags: [method private]
```

```Go
func makeRelativeURL(base string, path ...string) (*url.URL, error)
```

### <a id="makeTemporaryDirectory" href="#makeTemporaryDirectory">func makeTemporaryDirectory() (string, error)</a>

```
searchKey: worker.makeTemporaryDirectory
tags: [function private]
```

```Go
func makeTemporaryDirectory() (string, error)
```

### <a id="makeURL" href="#makeURL">func makeURL(base, username, password string, path ...string) (*url.URL, error)</a>

```
searchKey: worker.makeURL
tags: [method private]
```

```Go
func makeURL(base, username, password string, path ...string) (*url.URL, error)
```

### <a id="scriptNameFromJobStep" href="#scriptNameFromJobStep">func scriptNameFromJobStep(job executor.Job, i int) string</a>

```
searchKey: worker.scriptNameFromJobStep
tags: [method private]
```

```Go
func scriptNameFromJobStep(job executor.Job, i int) string
```

### <a id="union" href="#union">func union(a, b map[string]string) map[string]string</a>

```
searchKey: worker.union
tags: [method private]
```

```Go
func union(a, b map[string]string) map[string]string
```

