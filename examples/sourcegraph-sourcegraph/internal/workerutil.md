# Package workerutil

## Index

* Subpages
  * [internal/workerutil/dbworker](workerutil/dbworker.md)
* [Types](#type)
    * [type ExecutionLogEntry struct](#ExecutionLogEntry)
    * [type Handler interface](#Handler)
    * [type HandlerHandleFunc struct](#HandlerHandleFunc)
        * [func (f *HandlerHandleFunc) History() []HandlerHandleFuncCall](#HandlerHandleFunc.History)
        * [func (f *HandlerHandleFunc) PushHook(hook func(context.Context, Store, Record) error)](#HandlerHandleFunc.PushHook)
        * [func (f *HandlerHandleFunc) PushReturn(r0 error)](#HandlerHandleFunc.PushReturn)
        * [func (f *HandlerHandleFunc) SetDefaultHook(hook func(context.Context, Store, Record) error)](#HandlerHandleFunc.SetDefaultHook)
        * [func (f *HandlerHandleFunc) SetDefaultReturn(r0 error)](#HandlerHandleFunc.SetDefaultReturn)
        * [func (f *HandlerHandleFunc) appendCall(r0 HandlerHandleFuncCall)](#HandlerHandleFunc.appendCall)
        * [func (f *HandlerHandleFunc) nextHook() func(context.Context, Store, Record) error](#HandlerHandleFunc.nextHook)
    * [type HandlerHandleFuncCall struct](#HandlerHandleFuncCall)
        * [func (c HandlerHandleFuncCall) Args() []interface{}](#HandlerHandleFuncCall.Args)
        * [func (c HandlerHandleFuncCall) Results() []interface{}](#HandlerHandleFuncCall.Results)
    * [type MockHandler struct](#MockHandler)
        * [func NewMockHandler() *MockHandler](#NewMockHandler)
        * [func NewMockHandlerFrom(i Handler) *MockHandler](#NewMockHandlerFrom)
        * [func (m *MockHandler) Handle(v0 context.Context, v1 Store, v2 Record) error](#MockHandler.Handle)
    * [type MockHandlerWithHooks struct](#MockHandlerWithHooks)
        * [func NewMockHandlerWithHooks() *MockHandlerWithHooks](#NewMockHandlerWithHooks)
    * [type MockHandlerWithPreDequeue struct](#MockHandlerWithPreDequeue)
        * [func NewMockHandlerWithPreDequeue() *MockHandlerWithPreDequeue](#NewMockHandlerWithPreDequeue)
    * [type MockStore struct](#MockStore)
        * [func NewMockStore() *MockStore](#NewMockStore)
        * [func NewMockStoreFrom(i Store) *MockStore](#NewMockStoreFrom)
        * [func (m *MockStore) AddExecutionLogEntry(v0 context.Context, v1 int, v2 ExecutionLogEntry) error](#MockStore.AddExecutionLogEntry)
        * [func (m *MockStore) Dequeue(v0 context.Context, v1 interface{}) (Record, Store, bool, error)](#MockStore.Dequeue)
        * [func (m *MockStore) Done(v0 error) error](#MockStore.Done)
        * [func (m *MockStore) MarkComplete(v0 context.Context, v1 int) (bool, error)](#MockStore.MarkComplete)
        * [func (m *MockStore) MarkErrored(v0 context.Context, v1 int, v2 string) (bool, error)](#MockStore.MarkErrored)
        * [func (m *MockStore) MarkFailed(v0 context.Context, v1 int, v2 string) (bool, error)](#MockStore.MarkFailed)
        * [func (m *MockStore) QueuedCount(v0 context.Context, v1 interface{}) (int, error)](#MockStore.QueuedCount)
    * [type MockWithHooks struct](#MockWithHooks)
        * [func NewMockWithHooks() *MockWithHooks](#NewMockWithHooks)
        * [func NewMockWithHooksFrom(i WithHooks) *MockWithHooks](#NewMockWithHooksFrom)
        * [func (m *MockWithHooks) PostHandle(v0 context.Context, v1 Record)](#MockWithHooks.PostHandle)
        * [func (m *MockWithHooks) PreHandle(v0 context.Context, v1 Record)](#MockWithHooks.PreHandle)
    * [type MockWithPreDequeue struct](#MockWithPreDequeue)
        * [func NewMockWithPreDequeue() *MockWithPreDequeue](#NewMockWithPreDequeue)
        * [func NewMockWithPreDequeueFrom(i WithPreDequeue) *MockWithPreDequeue](#NewMockWithPreDequeueFrom)
        * [func (m *MockWithPreDequeue) PreDequeue(v0 context.Context) (bool, interface{}, error)](#MockWithPreDequeue.PreDequeue)
    * [type Record interface](#Record)
    * [type Store interface](#Store)
    * [type StoreAddExecutionLogEntryFunc struct](#StoreAddExecutionLogEntryFunc)
        * [func (f *StoreAddExecutionLogEntryFunc) History() []StoreAddExecutionLogEntryFuncCall](#StoreAddExecutionLogEntryFunc.History)
        * [func (f *StoreAddExecutionLogEntryFunc) PushHook(hook func(context.Context, int, ExecutionLogEntry) error)](#StoreAddExecutionLogEntryFunc.PushHook)
        * [func (f *StoreAddExecutionLogEntryFunc) PushReturn(r0 error)](#StoreAddExecutionLogEntryFunc.PushReturn)
        * [func (f *StoreAddExecutionLogEntryFunc) SetDefaultHook(hook func(context.Context, int, ExecutionLogEntry) error)](#StoreAddExecutionLogEntryFunc.SetDefaultHook)
        * [func (f *StoreAddExecutionLogEntryFunc) SetDefaultReturn(r0 error)](#StoreAddExecutionLogEntryFunc.SetDefaultReturn)
        * [func (f *StoreAddExecutionLogEntryFunc) appendCall(r0 StoreAddExecutionLogEntryFuncCall)](#StoreAddExecutionLogEntryFunc.appendCall)
        * [func (f *StoreAddExecutionLogEntryFunc) nextHook() func(context.Context, int, ExecutionLogEntry) error](#StoreAddExecutionLogEntryFunc.nextHook)
    * [type StoreAddExecutionLogEntryFuncCall struct](#StoreAddExecutionLogEntryFuncCall)
        * [func (c StoreAddExecutionLogEntryFuncCall) Args() []interface{}](#StoreAddExecutionLogEntryFuncCall.Args)
        * [func (c StoreAddExecutionLogEntryFuncCall) Results() []interface{}](#StoreAddExecutionLogEntryFuncCall.Results)
    * [type StoreDequeueFunc struct](#StoreDequeueFunc)
        * [func (f *StoreDequeueFunc) History() []StoreDequeueFuncCall](#StoreDequeueFunc.History)
        * [func (f *StoreDequeueFunc) PushHook(hook func(context.Context, interface{}) (Record, Store, bool, error))](#StoreDequeueFunc.PushHook)
        * [func (f *StoreDequeueFunc) PushReturn(r0 Record, r1 Store, r2 bool, r3 error)](#StoreDequeueFunc.PushReturn)
        * [func (f *StoreDequeueFunc) SetDefaultHook(hook func(context.Context, interface{}) (Record, Store, bool, error))](#StoreDequeueFunc.SetDefaultHook)
        * [func (f *StoreDequeueFunc) SetDefaultReturn(r0 Record, r1 Store, r2 bool, r3 error)](#StoreDequeueFunc.SetDefaultReturn)
        * [func (f *StoreDequeueFunc) appendCall(r0 StoreDequeueFuncCall)](#StoreDequeueFunc.appendCall)
        * [func (f *StoreDequeueFunc) nextHook() func(context.Context, interface{}) (Record, Store, bool, error)](#StoreDequeueFunc.nextHook)
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
    * [type TestRecord struct](#TestRecord)
        * [func (v TestRecord) RecordID() int](#TestRecord.RecordID)
    * [type WithHooks interface](#WithHooks)
    * [type WithHooksPostHandleFunc struct](#WithHooksPostHandleFunc)
        * [func (f *WithHooksPostHandleFunc) History() []WithHooksPostHandleFuncCall](#WithHooksPostHandleFunc.History)
        * [func (f *WithHooksPostHandleFunc) PushHook(hook func(context.Context, Record))](#WithHooksPostHandleFunc.PushHook)
        * [func (f *WithHooksPostHandleFunc) PushReturn()](#WithHooksPostHandleFunc.PushReturn)
        * [func (f *WithHooksPostHandleFunc) SetDefaultHook(hook func(context.Context, Record))](#WithHooksPostHandleFunc.SetDefaultHook)
        * [func (f *WithHooksPostHandleFunc) SetDefaultReturn()](#WithHooksPostHandleFunc.SetDefaultReturn)
        * [func (f *WithHooksPostHandleFunc) appendCall(r0 WithHooksPostHandleFuncCall)](#WithHooksPostHandleFunc.appendCall)
        * [func (f *WithHooksPostHandleFunc) nextHook() func(context.Context, Record)](#WithHooksPostHandleFunc.nextHook)
    * [type WithHooksPostHandleFuncCall struct](#WithHooksPostHandleFuncCall)
        * [func (c WithHooksPostHandleFuncCall) Args() []interface{}](#WithHooksPostHandleFuncCall.Args)
        * [func (c WithHooksPostHandleFuncCall) Results() []interface{}](#WithHooksPostHandleFuncCall.Results)
    * [type WithHooksPreHandleFunc struct](#WithHooksPreHandleFunc)
        * [func (f *WithHooksPreHandleFunc) History() []WithHooksPreHandleFuncCall](#WithHooksPreHandleFunc.History)
        * [func (f *WithHooksPreHandleFunc) PushHook(hook func(context.Context, Record))](#WithHooksPreHandleFunc.PushHook)
        * [func (f *WithHooksPreHandleFunc) PushReturn()](#WithHooksPreHandleFunc.PushReturn)
        * [func (f *WithHooksPreHandleFunc) SetDefaultHook(hook func(context.Context, Record))](#WithHooksPreHandleFunc.SetDefaultHook)
        * [func (f *WithHooksPreHandleFunc) SetDefaultReturn()](#WithHooksPreHandleFunc.SetDefaultReturn)
        * [func (f *WithHooksPreHandleFunc) appendCall(r0 WithHooksPreHandleFuncCall)](#WithHooksPreHandleFunc.appendCall)
        * [func (f *WithHooksPreHandleFunc) nextHook() func(context.Context, Record)](#WithHooksPreHandleFunc.nextHook)
    * [type WithHooksPreHandleFuncCall struct](#WithHooksPreHandleFuncCall)
        * [func (c WithHooksPreHandleFuncCall) Args() []interface{}](#WithHooksPreHandleFuncCall.Args)
        * [func (c WithHooksPreHandleFuncCall) Results() []interface{}](#WithHooksPreHandleFuncCall.Results)
    * [type WithPreDequeue interface](#WithPreDequeue)
    * [type WithPreDequeuePreDequeueFunc struct](#WithPreDequeuePreDequeueFunc)
        * [func (f *WithPreDequeuePreDequeueFunc) History() []WithPreDequeuePreDequeueFuncCall](#WithPreDequeuePreDequeueFunc.History)
        * [func (f *WithPreDequeuePreDequeueFunc) PushHook(hook func(context.Context) (bool, interface{}, error))](#WithPreDequeuePreDequeueFunc.PushHook)
        * [func (f *WithPreDequeuePreDequeueFunc) PushReturn(r0 bool, r1 interface{}, r2 error)](#WithPreDequeuePreDequeueFunc.PushReturn)
        * [func (f *WithPreDequeuePreDequeueFunc) SetDefaultHook(hook func(context.Context) (bool, interface{}, error))](#WithPreDequeuePreDequeueFunc.SetDefaultHook)
        * [func (f *WithPreDequeuePreDequeueFunc) SetDefaultReturn(r0 bool, r1 interface{}, r2 error)](#WithPreDequeuePreDequeueFunc.SetDefaultReturn)
        * [func (f *WithPreDequeuePreDequeueFunc) appendCall(r0 WithPreDequeuePreDequeueFuncCall)](#WithPreDequeuePreDequeueFunc.appendCall)
        * [func (f *WithPreDequeuePreDequeueFunc) nextHook() func(context.Context) (bool, interface{}, error)](#WithPreDequeuePreDequeueFunc.nextHook)
    * [type WithPreDequeuePreDequeueFuncCall struct](#WithPreDequeuePreDequeueFuncCall)
        * [func (c WithPreDequeuePreDequeueFuncCall) Args() []interface{}](#WithPreDequeuePreDequeueFuncCall.Args)
        * [func (c WithPreDequeuePreDequeueFuncCall) Results() []interface{}](#WithPreDequeuePreDequeueFuncCall.Results)
    * [type Worker struct](#Worker)
        * [func NewWorker(ctx context.Context, store Store, handler Handler, options WorkerOptions) *Worker](#NewWorker)
        * [func newWorker(ctx context.Context, store Store, handler Handler, options WorkerOptions, clock glock.Clock) *Worker](#newWorker)
        * [func (w *Worker) Start()](#Worker.Start)
        * [func (w *Worker) Stop()](#Worker.Stop)
        * [func (w *Worker) dequeueAndHandle() (dequeued bool, err error)](#Worker.dequeueAndHandle)
        * [func (w *Worker) handle(tx Store, record Record) (err error)](#Worker.handle)
        * [func (w *Worker) preDequeueHook() (dequeueable bool, extraDequeueArguments interface{}, err error)](#Worker.preDequeueHook)
    * [type WorkerMetrics struct](#WorkerMetrics)
        * [func NewMetrics(observationContext *observation.Context, prefix string, labels map[string]string) WorkerMetrics](#NewMetrics)
    * [type WorkerOptions struct](#WorkerOptions)
    * [type nonRetryableTestErr struct{}](#nonRetryableTestErr)
        * [func (e nonRetryableTestErr) Error() string](#nonRetryableTestErr.Error)
        * [func (e nonRetryableTestErr) NonRetryable() bool](#nonRetryableTestErr.NonRetryable)
    * [type operations struct](#operations)
        * [func newOperations(observationContext *observation.Context, prefix string, keys, values []string) *operations](#newOperations)
* [Functions](#func)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestWorkerBlockingPreDequeueHook(t *testing.T)](#TestWorkerBlockingPreDequeueHook)
    * [func TestWorkerConcurrent(t *testing.T)](#TestWorkerConcurrent)
    * [func TestWorkerConditionalPreDequeueHook(t *testing.T)](#TestWorkerConditionalPreDequeueHook)
    * [func TestWorkerHandlerFailure(t *testing.T)](#TestWorkerHandlerFailure)
    * [func TestWorkerHandlerNonRetryableFailure(t *testing.T)](#TestWorkerHandlerNonRetryableFailure)
    * [func TestWorkerHandlerSuccess(t *testing.T)](#TestWorkerHandlerSuccess)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="ExecutionLogEntry" href="#ExecutionLogEntry">type ExecutionLogEntry struct</a>

```
searchKey: workerutil.ExecutionLogEntry
tags: [struct]
```

```Go
type ExecutionLogEntry struct {
	Key        string    `json:"key"`
	Command    []string  `json:"command"`
	StartTime  time.Time `json:"startTime"`
	ExitCode   int       `json:"exitCode"`
	Out        string    `json:"out"`
	DurationMs int       `json:"durationMs"`
}
```

ExecutionLogEntry represents a command run by the executor. 

### <a id="Handler" href="#Handler">type Handler interface</a>

```
searchKey: workerutil.Handler
tags: [interface]
```

```Go
type Handler interface {
	// Handle processes a single record. The store provided by this method is the store
	// returned from the Dequeue method returning the associated record.
	Handle(ctx context.Context, store Store, record Record) error
}
```

Handler is the configurable consumer within a worker. Types that conform to this interface may also optionally conform to the PreDequeuer, PreHandler, and PostHandler interfaces to further configure the behavior of the worker routine. 

### <a id="HandlerHandleFunc" href="#HandlerHandleFunc">type HandlerHandleFunc struct</a>

```
searchKey: workerutil.HandlerHandleFunc
tags: [struct private]
```

```Go
type HandlerHandleFunc struct {
	defaultHook func(context.Context, Store, Record) error
	hooks       []func(context.Context, Store, Record) error
	history     []HandlerHandleFuncCall
	mutex       sync.Mutex
}
```

HandlerHandleFunc describes the behavior when the Handle method of the parent MockHandler instance is invoked. 

#### <a id="HandlerHandleFunc.History" href="#HandlerHandleFunc.History">func (f *HandlerHandleFunc) History() []HandlerHandleFuncCall</a>

```
searchKey: workerutil.HandlerHandleFunc.History
tags: [method private]
```

```Go
func (f *HandlerHandleFunc) History() []HandlerHandleFuncCall
```

History returns a sequence of HandlerHandleFuncCall objects describing the invocations of this function. 

#### <a id="HandlerHandleFunc.PushHook" href="#HandlerHandleFunc.PushHook">func (f *HandlerHandleFunc) PushHook(hook func(context.Context, Store, Record) error)</a>

```
searchKey: workerutil.HandlerHandleFunc.PushHook
tags: [method private]
```

```Go
func (f *HandlerHandleFunc) PushHook(hook func(context.Context, Store, Record) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Handle method of the parent MockHandler instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="HandlerHandleFunc.PushReturn" href="#HandlerHandleFunc.PushReturn">func (f *HandlerHandleFunc) PushReturn(r0 error)</a>

```
searchKey: workerutil.HandlerHandleFunc.PushReturn
tags: [method private]
```

```Go
func (f *HandlerHandleFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="HandlerHandleFunc.SetDefaultHook" href="#HandlerHandleFunc.SetDefaultHook">func (f *HandlerHandleFunc) SetDefaultHook(hook func(context.Context, Store, Record) error)</a>

```
searchKey: workerutil.HandlerHandleFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *HandlerHandleFunc) SetDefaultHook(hook func(context.Context, Store, Record) error)
```

SetDefaultHook sets function that is called when the Handle method of the parent MockHandler instance is invoked and the hook queue is empty. 

#### <a id="HandlerHandleFunc.SetDefaultReturn" href="#HandlerHandleFunc.SetDefaultReturn">func (f *HandlerHandleFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: workerutil.HandlerHandleFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *HandlerHandleFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="HandlerHandleFunc.appendCall" href="#HandlerHandleFunc.appendCall">func (f *HandlerHandleFunc) appendCall(r0 HandlerHandleFuncCall)</a>

```
searchKey: workerutil.HandlerHandleFunc.appendCall
tags: [method private]
```

```Go
func (f *HandlerHandleFunc) appendCall(r0 HandlerHandleFuncCall)
```

#### <a id="HandlerHandleFunc.nextHook" href="#HandlerHandleFunc.nextHook">func (f *HandlerHandleFunc) nextHook() func(context.Context, Store, Record) error</a>

```
searchKey: workerutil.HandlerHandleFunc.nextHook
tags: [method private]
```

```Go
func (f *HandlerHandleFunc) nextHook() func(context.Context, Store, Record) error
```

### <a id="HandlerHandleFuncCall" href="#HandlerHandleFuncCall">type HandlerHandleFuncCall struct</a>

```
searchKey: workerutil.HandlerHandleFuncCall
tags: [struct private]
```

```Go
type HandlerHandleFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 Store
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 Record
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

HandlerHandleFuncCall is an object that describes an invocation of method Handle on an instance of MockHandler. 

#### <a id="HandlerHandleFuncCall.Args" href="#HandlerHandleFuncCall.Args">func (c HandlerHandleFuncCall) Args() []interface{}</a>

```
searchKey: workerutil.HandlerHandleFuncCall.Args
tags: [method private]
```

```Go
func (c HandlerHandleFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="HandlerHandleFuncCall.Results" href="#HandlerHandleFuncCall.Results">func (c HandlerHandleFuncCall) Results() []interface{}</a>

```
searchKey: workerutil.HandlerHandleFuncCall.Results
tags: [method private]
```

```Go
func (c HandlerHandleFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockHandler" href="#MockHandler">type MockHandler struct</a>

```
searchKey: workerutil.MockHandler
tags: [struct private]
```

```Go
type MockHandler struct {
	// HandleFunc is an instance of a mock function object controlling the
	// behavior of the method Handle.
	HandleFunc *HandlerHandleFunc
}
```

MockHandler is a mock implementation of the Handler interface (from the package github.com/sourcegraph/sourcegraph/internal/workerutil) used for unit testing. 

#### <a id="NewMockHandler" href="#NewMockHandler">func NewMockHandler() *MockHandler</a>

```
searchKey: workerutil.NewMockHandler
tags: [function private]
```

```Go
func NewMockHandler() *MockHandler
```

NewMockHandler creates a new mock of the Handler interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockHandlerFrom" href="#NewMockHandlerFrom">func NewMockHandlerFrom(i Handler) *MockHandler</a>

```
searchKey: workerutil.NewMockHandlerFrom
tags: [function private]
```

```Go
func NewMockHandlerFrom(i Handler) *MockHandler
```

NewMockHandlerFrom creates a new mock of the MockHandler interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockHandler.Handle" href="#MockHandler.Handle">func (m *MockHandler) Handle(v0 context.Context, v1 Store, v2 Record) error</a>

```
searchKey: workerutil.MockHandler.Handle
tags: [method private]
```

```Go
func (m *MockHandler) Handle(v0 context.Context, v1 Store, v2 Record) error
```

Handle delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MockHandlerWithHooks" href="#MockHandlerWithHooks">type MockHandlerWithHooks struct</a>

```
searchKey: workerutil.MockHandlerWithHooks
tags: [struct private]
```

```Go
type MockHandlerWithHooks struct {
	*MockHandler
	*MockWithHooks
}
```

#### <a id="NewMockHandlerWithHooks" href="#NewMockHandlerWithHooks">func NewMockHandlerWithHooks() *MockHandlerWithHooks</a>

```
searchKey: workerutil.NewMockHandlerWithHooks
tags: [function private]
```

```Go
func NewMockHandlerWithHooks() *MockHandlerWithHooks
```

### <a id="MockHandlerWithPreDequeue" href="#MockHandlerWithPreDequeue">type MockHandlerWithPreDequeue struct</a>

```
searchKey: workerutil.MockHandlerWithPreDequeue
tags: [struct private]
```

```Go
type MockHandlerWithPreDequeue struct {
	*MockHandler
	*MockWithPreDequeue
}
```

#### <a id="NewMockHandlerWithPreDequeue" href="#NewMockHandlerWithPreDequeue">func NewMockHandlerWithPreDequeue() *MockHandlerWithPreDequeue</a>

```
searchKey: workerutil.NewMockHandlerWithPreDequeue
tags: [function private]
```

```Go
func NewMockHandlerWithPreDequeue() *MockHandlerWithPreDequeue
```

### <a id="MockStore" href="#MockStore">type MockStore struct</a>

```
searchKey: workerutil.MockStore
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
searchKey: workerutil.NewMockStore
tags: [function private]
```

```Go
func NewMockStore() *MockStore
```

NewMockStore creates a new mock of the Store interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockStoreFrom" href="#NewMockStoreFrom">func NewMockStoreFrom(i Store) *MockStore</a>

```
searchKey: workerutil.NewMockStoreFrom
tags: [function private]
```

```Go
func NewMockStoreFrom(i Store) *MockStore
```

NewMockStoreFrom creates a new mock of the MockStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockStore.AddExecutionLogEntry" href="#MockStore.AddExecutionLogEntry">func (m *MockStore) AddExecutionLogEntry(v0 context.Context, v1 int, v2 ExecutionLogEntry) error</a>

```
searchKey: workerutil.MockStore.AddExecutionLogEntry
tags: [method private]
```

```Go
func (m *MockStore) AddExecutionLogEntry(v0 context.Context, v1 int, v2 ExecutionLogEntry) error
```

AddExecutionLogEntry delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.Dequeue" href="#MockStore.Dequeue">func (m *MockStore) Dequeue(v0 context.Context, v1 interface{}) (Record, Store, bool, error)</a>

```
searchKey: workerutil.MockStore.Dequeue
tags: [method private]
```

```Go
func (m *MockStore) Dequeue(v0 context.Context, v1 interface{}) (Record, Store, bool, error)
```

Dequeue delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.Done" href="#MockStore.Done">func (m *MockStore) Done(v0 error) error</a>

```
searchKey: workerutil.MockStore.Done
tags: [method private]
```

```Go
func (m *MockStore) Done(v0 error) error
```

Done delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.MarkComplete" href="#MockStore.MarkComplete">func (m *MockStore) MarkComplete(v0 context.Context, v1 int) (bool, error)</a>

```
searchKey: workerutil.MockStore.MarkComplete
tags: [method private]
```

```Go
func (m *MockStore) MarkComplete(v0 context.Context, v1 int) (bool, error)
```

MarkComplete delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.MarkErrored" href="#MockStore.MarkErrored">func (m *MockStore) MarkErrored(v0 context.Context, v1 int, v2 string) (bool, error)</a>

```
searchKey: workerutil.MockStore.MarkErrored
tags: [method private]
```

```Go
func (m *MockStore) MarkErrored(v0 context.Context, v1 int, v2 string) (bool, error)
```

MarkErrored delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.MarkFailed" href="#MockStore.MarkFailed">func (m *MockStore) MarkFailed(v0 context.Context, v1 int, v2 string) (bool, error)</a>

```
searchKey: workerutil.MockStore.MarkFailed
tags: [method private]
```

```Go
func (m *MockStore) MarkFailed(v0 context.Context, v1 int, v2 string) (bool, error)
```

MarkFailed delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.QueuedCount" href="#MockStore.QueuedCount">func (m *MockStore) QueuedCount(v0 context.Context, v1 interface{}) (int, error)</a>

```
searchKey: workerutil.MockStore.QueuedCount
tags: [method private]
```

```Go
func (m *MockStore) QueuedCount(v0 context.Context, v1 interface{}) (int, error)
```

QueuedCount delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MockWithHooks" href="#MockWithHooks">type MockWithHooks struct</a>

```
searchKey: workerutil.MockWithHooks
tags: [struct private]
```

```Go
type MockWithHooks struct {
	// PostHandleFunc is an instance of a mock function object controlling
	// the behavior of the method PostHandle.
	PostHandleFunc *WithHooksPostHandleFunc
	// PreHandleFunc is an instance of a mock function object controlling
	// the behavior of the method PreHandle.
	PreHandleFunc *WithHooksPreHandleFunc
}
```

MockWithHooks is a mock implementation of the WithHooks interface (from the package github.com/sourcegraph/sourcegraph/internal/workerutil) used for unit testing. 

#### <a id="NewMockWithHooks" href="#NewMockWithHooks">func NewMockWithHooks() *MockWithHooks</a>

```
searchKey: workerutil.NewMockWithHooks
tags: [function private]
```

```Go
func NewMockWithHooks() *MockWithHooks
```

NewMockWithHooks creates a new mock of the WithHooks interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockWithHooksFrom" href="#NewMockWithHooksFrom">func NewMockWithHooksFrom(i WithHooks) *MockWithHooks</a>

```
searchKey: workerutil.NewMockWithHooksFrom
tags: [function private]
```

```Go
func NewMockWithHooksFrom(i WithHooks) *MockWithHooks
```

NewMockWithHooksFrom creates a new mock of the MockWithHooks interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockWithHooks.PostHandle" href="#MockWithHooks.PostHandle">func (m *MockWithHooks) PostHandle(v0 context.Context, v1 Record)</a>

```
searchKey: workerutil.MockWithHooks.PostHandle
tags: [method private]
```

```Go
func (m *MockWithHooks) PostHandle(v0 context.Context, v1 Record)
```

PostHandle delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockWithHooks.PreHandle" href="#MockWithHooks.PreHandle">func (m *MockWithHooks) PreHandle(v0 context.Context, v1 Record)</a>

```
searchKey: workerutil.MockWithHooks.PreHandle
tags: [method private]
```

```Go
func (m *MockWithHooks) PreHandle(v0 context.Context, v1 Record)
```

PreHandle delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="MockWithPreDequeue" href="#MockWithPreDequeue">type MockWithPreDequeue struct</a>

```
searchKey: workerutil.MockWithPreDequeue
tags: [struct private]
```

```Go
type MockWithPreDequeue struct {
	// PreDequeueFunc is an instance of a mock function object controlling
	// the behavior of the method PreDequeue.
	PreDequeueFunc *WithPreDequeuePreDequeueFunc
}
```

MockWithPreDequeue is a mock implementation of the WithPreDequeue interface (from the package github.com/sourcegraph/sourcegraph/internal/workerutil) used for unit testing. 

#### <a id="NewMockWithPreDequeue" href="#NewMockWithPreDequeue">func NewMockWithPreDequeue() *MockWithPreDequeue</a>

```
searchKey: workerutil.NewMockWithPreDequeue
tags: [function private]
```

```Go
func NewMockWithPreDequeue() *MockWithPreDequeue
```

NewMockWithPreDequeue creates a new mock of the WithPreDequeue interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockWithPreDequeueFrom" href="#NewMockWithPreDequeueFrom">func NewMockWithPreDequeueFrom(i WithPreDequeue) *MockWithPreDequeue</a>

```
searchKey: workerutil.NewMockWithPreDequeueFrom
tags: [function private]
```

```Go
func NewMockWithPreDequeueFrom(i WithPreDequeue) *MockWithPreDequeue
```

NewMockWithPreDequeueFrom creates a new mock of the MockWithPreDequeue interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockWithPreDequeue.PreDequeue" href="#MockWithPreDequeue.PreDequeue">func (m *MockWithPreDequeue) PreDequeue(v0 context.Context) (bool, interface{}, error)</a>

```
searchKey: workerutil.MockWithPreDequeue.PreDequeue
tags: [method private]
```

```Go
func (m *MockWithPreDequeue) PreDequeue(v0 context.Context) (bool, interface{}, error)
```

PreDequeue delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="Record" href="#Record">type Record interface</a>

```
searchKey: workerutil.Record
tags: [interface]
```

```Go
type Record interface {
	// RecordID returns the integer primary key of the record.
	RecordID() int
}
```

Record is a generic interface for record conforming to the requirements of the store. 

### <a id="Store" href="#Store">type Store interface</a>

```
searchKey: workerutil.Store
tags: [interface]
```

```Go
type Store interface {
	// QueuedCount returns the number of records in the queued state. Any extra arguments supplied will be used in
	// accordance with the concrete persistence layer (e.g. additional SQL conditions for a database layer).
	QueuedCount(ctx context.Context, extraArguments interface{}) (int, error)

	// Dequeue selects the a record for processing. Any extra arguments supplied will be used in accordance with the
	// concrete persistence layer (e.g. additional SQL conditions for a database layer). This method returns a boolean
	// flag indicating the existence of a processable record along with a refined store instance which should be used
	// for all additional operations (MarkComplete, MarkErrored, and Done) while processing the given record.
	Dequeue(ctx context.Context, extraArguments interface{}) (Record, Store, bool, error)

	// AddExecutionLogEntry adds an executor log entry to the record.
	AddExecutionLogEntry(ctx context.Context, id int, entry ExecutionLogEntry) error

	// MarkComplete attempts to update the state of the record to complete. This method returns a boolean flag indicating
	// if the record was updated.
	MarkComplete(ctx context.Context, id int) (bool, error)

	// MarkErrored attempts to update the state of the record to errored. This method returns a boolean flag indicating
	// if the record was updated.
	MarkErrored(ctx context.Context, id int, failureMessage string) (bool, error)

	// MarkFailed attempts to update the state of the record to failed. This method returns a boolean flag indicating
	// if the record was updated.
	MarkFailed(ctx context.Context, id int, failureMessage string) (bool, error)

	// Done marks the current record as complete. Depending on the store implementation, this may release locked
	// or temporary resources, or commit or rollback a transaction. This method should append any additional error
	// that occurs during finalization to the error argument.
	Done(err error) error
}
```

Store is the persistence layer for the workerutil package that handles worker-side operations. 

### <a id="StoreAddExecutionLogEntryFunc" href="#StoreAddExecutionLogEntryFunc">type StoreAddExecutionLogEntryFunc struct</a>

```
searchKey: workerutil.StoreAddExecutionLogEntryFunc
tags: [struct private]
```

```Go
type StoreAddExecutionLogEntryFunc struct {
	defaultHook func(context.Context, int, ExecutionLogEntry) error
	hooks       []func(context.Context, int, ExecutionLogEntry) error
	history     []StoreAddExecutionLogEntryFuncCall
	mutex       sync.Mutex
}
```

StoreAddExecutionLogEntryFunc describes the behavior when the AddExecutionLogEntry method of the parent MockStore instance is invoked. 

#### <a id="StoreAddExecutionLogEntryFunc.History" href="#StoreAddExecutionLogEntryFunc.History">func (f *StoreAddExecutionLogEntryFunc) History() []StoreAddExecutionLogEntryFuncCall</a>

```
searchKey: workerutil.StoreAddExecutionLogEntryFunc.History
tags: [method private]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) History() []StoreAddExecutionLogEntryFuncCall
```

History returns a sequence of StoreAddExecutionLogEntryFuncCall objects describing the invocations of this function. 

#### <a id="StoreAddExecutionLogEntryFunc.PushHook" href="#StoreAddExecutionLogEntryFunc.PushHook">func (f *StoreAddExecutionLogEntryFunc) PushHook(hook func(context.Context, int, ExecutionLogEntry) error)</a>

```
searchKey: workerutil.StoreAddExecutionLogEntryFunc.PushHook
tags: [method private]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) PushHook(hook func(context.Context, int, ExecutionLogEntry) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the AddExecutionLogEntry method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreAddExecutionLogEntryFunc.PushReturn" href="#StoreAddExecutionLogEntryFunc.PushReturn">func (f *StoreAddExecutionLogEntryFunc) PushReturn(r0 error)</a>

```
searchKey: workerutil.StoreAddExecutionLogEntryFunc.PushReturn
tags: [method private]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreAddExecutionLogEntryFunc.SetDefaultHook" href="#StoreAddExecutionLogEntryFunc.SetDefaultHook">func (f *StoreAddExecutionLogEntryFunc) SetDefaultHook(hook func(context.Context, int, ExecutionLogEntry) error)</a>

```
searchKey: workerutil.StoreAddExecutionLogEntryFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) SetDefaultHook(hook func(context.Context, int, ExecutionLogEntry) error)
```

SetDefaultHook sets function that is called when the AddExecutionLogEntry method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreAddExecutionLogEntryFunc.SetDefaultReturn" href="#StoreAddExecutionLogEntryFunc.SetDefaultReturn">func (f *StoreAddExecutionLogEntryFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: workerutil.StoreAddExecutionLogEntryFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreAddExecutionLogEntryFunc.appendCall" href="#StoreAddExecutionLogEntryFunc.appendCall">func (f *StoreAddExecutionLogEntryFunc) appendCall(r0 StoreAddExecutionLogEntryFuncCall)</a>

```
searchKey: workerutil.StoreAddExecutionLogEntryFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) appendCall(r0 StoreAddExecutionLogEntryFuncCall)
```

#### <a id="StoreAddExecutionLogEntryFunc.nextHook" href="#StoreAddExecutionLogEntryFunc.nextHook">func (f *StoreAddExecutionLogEntryFunc) nextHook() func(context.Context, int, ExecutionLogEntry) error</a>

```
searchKey: workerutil.StoreAddExecutionLogEntryFunc.nextHook
tags: [method private]
```

```Go
func (f *StoreAddExecutionLogEntryFunc) nextHook() func(context.Context, int, ExecutionLogEntry) error
```

### <a id="StoreAddExecutionLogEntryFuncCall" href="#StoreAddExecutionLogEntryFuncCall">type StoreAddExecutionLogEntryFuncCall struct</a>

```
searchKey: workerutil.StoreAddExecutionLogEntryFuncCall
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
	Arg2 ExecutionLogEntry
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

StoreAddExecutionLogEntryFuncCall is an object that describes an invocation of method AddExecutionLogEntry on an instance of MockStore. 

#### <a id="StoreAddExecutionLogEntryFuncCall.Args" href="#StoreAddExecutionLogEntryFuncCall.Args">func (c StoreAddExecutionLogEntryFuncCall) Args() []interface{}</a>

```
searchKey: workerutil.StoreAddExecutionLogEntryFuncCall.Args
tags: [method private]
```

```Go
func (c StoreAddExecutionLogEntryFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreAddExecutionLogEntryFuncCall.Results" href="#StoreAddExecutionLogEntryFuncCall.Results">func (c StoreAddExecutionLogEntryFuncCall) Results() []interface{}</a>

```
searchKey: workerutil.StoreAddExecutionLogEntryFuncCall.Results
tags: [method private]
```

```Go
func (c StoreAddExecutionLogEntryFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreDequeueFunc" href="#StoreDequeueFunc">type StoreDequeueFunc struct</a>

```
searchKey: workerutil.StoreDequeueFunc
tags: [struct private]
```

```Go
type StoreDequeueFunc struct {
	defaultHook func(context.Context, interface{}) (Record, Store, bool, error)
	hooks       []func(context.Context, interface{}) (Record, Store, bool, error)
	history     []StoreDequeueFuncCall
	mutex       sync.Mutex
}
```

StoreDequeueFunc describes the behavior when the Dequeue method of the parent MockStore instance is invoked. 

#### <a id="StoreDequeueFunc.History" href="#StoreDequeueFunc.History">func (f *StoreDequeueFunc) History() []StoreDequeueFuncCall</a>

```
searchKey: workerutil.StoreDequeueFunc.History
tags: [method private]
```

```Go
func (f *StoreDequeueFunc) History() []StoreDequeueFuncCall
```

History returns a sequence of StoreDequeueFuncCall objects describing the invocations of this function. 

#### <a id="StoreDequeueFunc.PushHook" href="#StoreDequeueFunc.PushHook">func (f *StoreDequeueFunc) PushHook(hook func(context.Context, interface{}) (Record, Store, bool, error))</a>

```
searchKey: workerutil.StoreDequeueFunc.PushHook
tags: [method private]
```

```Go
func (f *StoreDequeueFunc) PushHook(hook func(context.Context, interface{}) (Record, Store, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Dequeue method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreDequeueFunc.PushReturn" href="#StoreDequeueFunc.PushReturn">func (f *StoreDequeueFunc) PushReturn(r0 Record, r1 Store, r2 bool, r3 error)</a>

```
searchKey: workerutil.StoreDequeueFunc.PushReturn
tags: [method private]
```

```Go
func (f *StoreDequeueFunc) PushReturn(r0 Record, r1 Store, r2 bool, r3 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreDequeueFunc.SetDefaultHook" href="#StoreDequeueFunc.SetDefaultHook">func (f *StoreDequeueFunc) SetDefaultHook(hook func(context.Context, interface{}) (Record, Store, bool, error))</a>

```
searchKey: workerutil.StoreDequeueFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *StoreDequeueFunc) SetDefaultHook(hook func(context.Context, interface{}) (Record, Store, bool, error))
```

SetDefaultHook sets function that is called when the Dequeue method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreDequeueFunc.SetDefaultReturn" href="#StoreDequeueFunc.SetDefaultReturn">func (f *StoreDequeueFunc) SetDefaultReturn(r0 Record, r1 Store, r2 bool, r3 error)</a>

```
searchKey: workerutil.StoreDequeueFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *StoreDequeueFunc) SetDefaultReturn(r0 Record, r1 Store, r2 bool, r3 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreDequeueFunc.appendCall" href="#StoreDequeueFunc.appendCall">func (f *StoreDequeueFunc) appendCall(r0 StoreDequeueFuncCall)</a>

```
searchKey: workerutil.StoreDequeueFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreDequeueFunc) appendCall(r0 StoreDequeueFuncCall)
```

#### <a id="StoreDequeueFunc.nextHook" href="#StoreDequeueFunc.nextHook">func (f *StoreDequeueFunc) nextHook() func(context.Context, interface{}) (Record, Store, bool, error)</a>

```
searchKey: workerutil.StoreDequeueFunc.nextHook
tags: [method private]
```

```Go
func (f *StoreDequeueFunc) nextHook() func(context.Context, interface{}) (Record, Store, bool, error)
```

### <a id="StoreDequeueFuncCall" href="#StoreDequeueFuncCall">type StoreDequeueFuncCall struct</a>

```
searchKey: workerutil.StoreDequeueFuncCall
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
	Result0 Record
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 Store
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
searchKey: workerutil.StoreDequeueFuncCall.Args
tags: [method private]
```

```Go
func (c StoreDequeueFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreDequeueFuncCall.Results" href="#StoreDequeueFuncCall.Results">func (c StoreDequeueFuncCall) Results() []interface{}</a>

```
searchKey: workerutil.StoreDequeueFuncCall.Results
tags: [method private]
```

```Go
func (c StoreDequeueFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreDoneFunc" href="#StoreDoneFunc">type StoreDoneFunc struct</a>

```
searchKey: workerutil.StoreDoneFunc
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
searchKey: workerutil.StoreDoneFunc.History
tags: [method private]
```

```Go
func (f *StoreDoneFunc) History() []StoreDoneFuncCall
```

History returns a sequence of StoreDoneFuncCall objects describing the invocations of this function. 

#### <a id="StoreDoneFunc.PushHook" href="#StoreDoneFunc.PushHook">func (f *StoreDoneFunc) PushHook(hook func(error) error)</a>

```
searchKey: workerutil.StoreDoneFunc.PushHook
tags: [method private]
```

```Go
func (f *StoreDoneFunc) PushHook(hook func(error) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Done method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreDoneFunc.PushReturn" href="#StoreDoneFunc.PushReturn">func (f *StoreDoneFunc) PushReturn(r0 error)</a>

```
searchKey: workerutil.StoreDoneFunc.PushReturn
tags: [method private]
```

```Go
func (f *StoreDoneFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreDoneFunc.SetDefaultHook" href="#StoreDoneFunc.SetDefaultHook">func (f *StoreDoneFunc) SetDefaultHook(hook func(error) error)</a>

```
searchKey: workerutil.StoreDoneFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *StoreDoneFunc) SetDefaultHook(hook func(error) error)
```

SetDefaultHook sets function that is called when the Done method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreDoneFunc.SetDefaultReturn" href="#StoreDoneFunc.SetDefaultReturn">func (f *StoreDoneFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: workerutil.StoreDoneFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *StoreDoneFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreDoneFunc.appendCall" href="#StoreDoneFunc.appendCall">func (f *StoreDoneFunc) appendCall(r0 StoreDoneFuncCall)</a>

```
searchKey: workerutil.StoreDoneFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreDoneFunc) appendCall(r0 StoreDoneFuncCall)
```

#### <a id="StoreDoneFunc.nextHook" href="#StoreDoneFunc.nextHook">func (f *StoreDoneFunc) nextHook() func(error) error</a>

```
searchKey: workerutil.StoreDoneFunc.nextHook
tags: [method private]
```

```Go
func (f *StoreDoneFunc) nextHook() func(error) error
```

### <a id="StoreDoneFuncCall" href="#StoreDoneFuncCall">type StoreDoneFuncCall struct</a>

```
searchKey: workerutil.StoreDoneFuncCall
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
searchKey: workerutil.StoreDoneFuncCall.Args
tags: [method private]
```

```Go
func (c StoreDoneFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreDoneFuncCall.Results" href="#StoreDoneFuncCall.Results">func (c StoreDoneFuncCall) Results() []interface{}</a>

```
searchKey: workerutil.StoreDoneFuncCall.Results
tags: [method private]
```

```Go
func (c StoreDoneFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreMarkCompleteFunc" href="#StoreMarkCompleteFunc">type StoreMarkCompleteFunc struct</a>

```
searchKey: workerutil.StoreMarkCompleteFunc
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
searchKey: workerutil.StoreMarkCompleteFunc.History
tags: [method private]
```

```Go
func (f *StoreMarkCompleteFunc) History() []StoreMarkCompleteFuncCall
```

History returns a sequence of StoreMarkCompleteFuncCall objects describing the invocations of this function. 

#### <a id="StoreMarkCompleteFunc.PushHook" href="#StoreMarkCompleteFunc.PushHook">func (f *StoreMarkCompleteFunc) PushHook(hook func(context.Context, int) (bool, error))</a>

```
searchKey: workerutil.StoreMarkCompleteFunc.PushHook
tags: [method private]
```

```Go
func (f *StoreMarkCompleteFunc) PushHook(hook func(context.Context, int) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkComplete method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreMarkCompleteFunc.PushReturn" href="#StoreMarkCompleteFunc.PushReturn">func (f *StoreMarkCompleteFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: workerutil.StoreMarkCompleteFunc.PushReturn
tags: [method private]
```

```Go
func (f *StoreMarkCompleteFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkCompleteFunc.SetDefaultHook" href="#StoreMarkCompleteFunc.SetDefaultHook">func (f *StoreMarkCompleteFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))</a>

```
searchKey: workerutil.StoreMarkCompleteFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *StoreMarkCompleteFunc) SetDefaultHook(hook func(context.Context, int) (bool, error))
```

SetDefaultHook sets function that is called when the MarkComplete method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreMarkCompleteFunc.SetDefaultReturn" href="#StoreMarkCompleteFunc.SetDefaultReturn">func (f *StoreMarkCompleteFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: workerutil.StoreMarkCompleteFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *StoreMarkCompleteFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkCompleteFunc.appendCall" href="#StoreMarkCompleteFunc.appendCall">func (f *StoreMarkCompleteFunc) appendCall(r0 StoreMarkCompleteFuncCall)</a>

```
searchKey: workerutil.StoreMarkCompleteFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreMarkCompleteFunc) appendCall(r0 StoreMarkCompleteFuncCall)
```

#### <a id="StoreMarkCompleteFunc.nextHook" href="#StoreMarkCompleteFunc.nextHook">func (f *StoreMarkCompleteFunc) nextHook() func(context.Context, int) (bool, error)</a>

```
searchKey: workerutil.StoreMarkCompleteFunc.nextHook
tags: [method private]
```

```Go
func (f *StoreMarkCompleteFunc) nextHook() func(context.Context, int) (bool, error)
```

### <a id="StoreMarkCompleteFuncCall" href="#StoreMarkCompleteFuncCall">type StoreMarkCompleteFuncCall struct</a>

```
searchKey: workerutil.StoreMarkCompleteFuncCall
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
searchKey: workerutil.StoreMarkCompleteFuncCall.Args
tags: [method private]
```

```Go
func (c StoreMarkCompleteFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreMarkCompleteFuncCall.Results" href="#StoreMarkCompleteFuncCall.Results">func (c StoreMarkCompleteFuncCall) Results() []interface{}</a>

```
searchKey: workerutil.StoreMarkCompleteFuncCall.Results
tags: [method private]
```

```Go
func (c StoreMarkCompleteFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreMarkErroredFunc" href="#StoreMarkErroredFunc">type StoreMarkErroredFunc struct</a>

```
searchKey: workerutil.StoreMarkErroredFunc
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
searchKey: workerutil.StoreMarkErroredFunc.History
tags: [method private]
```

```Go
func (f *StoreMarkErroredFunc) History() []StoreMarkErroredFuncCall
```

History returns a sequence of StoreMarkErroredFuncCall objects describing the invocations of this function. 

#### <a id="StoreMarkErroredFunc.PushHook" href="#StoreMarkErroredFunc.PushHook">func (f *StoreMarkErroredFunc) PushHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: workerutil.StoreMarkErroredFunc.PushHook
tags: [method private]
```

```Go
func (f *StoreMarkErroredFunc) PushHook(hook func(context.Context, int, string) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkErrored method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreMarkErroredFunc.PushReturn" href="#StoreMarkErroredFunc.PushReturn">func (f *StoreMarkErroredFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: workerutil.StoreMarkErroredFunc.PushReturn
tags: [method private]
```

```Go
func (f *StoreMarkErroredFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkErroredFunc.SetDefaultHook" href="#StoreMarkErroredFunc.SetDefaultHook">func (f *StoreMarkErroredFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: workerutil.StoreMarkErroredFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *StoreMarkErroredFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))
```

SetDefaultHook sets function that is called when the MarkErrored method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreMarkErroredFunc.SetDefaultReturn" href="#StoreMarkErroredFunc.SetDefaultReturn">func (f *StoreMarkErroredFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: workerutil.StoreMarkErroredFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *StoreMarkErroredFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkErroredFunc.appendCall" href="#StoreMarkErroredFunc.appendCall">func (f *StoreMarkErroredFunc) appendCall(r0 StoreMarkErroredFuncCall)</a>

```
searchKey: workerutil.StoreMarkErroredFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreMarkErroredFunc) appendCall(r0 StoreMarkErroredFuncCall)
```

#### <a id="StoreMarkErroredFunc.nextHook" href="#StoreMarkErroredFunc.nextHook">func (f *StoreMarkErroredFunc) nextHook() func(context.Context, int, string) (bool, error)</a>

```
searchKey: workerutil.StoreMarkErroredFunc.nextHook
tags: [method private]
```

```Go
func (f *StoreMarkErroredFunc) nextHook() func(context.Context, int, string) (bool, error)
```

### <a id="StoreMarkErroredFuncCall" href="#StoreMarkErroredFuncCall">type StoreMarkErroredFuncCall struct</a>

```
searchKey: workerutil.StoreMarkErroredFuncCall
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
searchKey: workerutil.StoreMarkErroredFuncCall.Args
tags: [method private]
```

```Go
func (c StoreMarkErroredFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreMarkErroredFuncCall.Results" href="#StoreMarkErroredFuncCall.Results">func (c StoreMarkErroredFuncCall) Results() []interface{}</a>

```
searchKey: workerutil.StoreMarkErroredFuncCall.Results
tags: [method private]
```

```Go
func (c StoreMarkErroredFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreMarkFailedFunc" href="#StoreMarkFailedFunc">type StoreMarkFailedFunc struct</a>

```
searchKey: workerutil.StoreMarkFailedFunc
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
searchKey: workerutil.StoreMarkFailedFunc.History
tags: [method private]
```

```Go
func (f *StoreMarkFailedFunc) History() []StoreMarkFailedFuncCall
```

History returns a sequence of StoreMarkFailedFuncCall objects describing the invocations of this function. 

#### <a id="StoreMarkFailedFunc.PushHook" href="#StoreMarkFailedFunc.PushHook">func (f *StoreMarkFailedFunc) PushHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: workerutil.StoreMarkFailedFunc.PushHook
tags: [method private]
```

```Go
func (f *StoreMarkFailedFunc) PushHook(hook func(context.Context, int, string) (bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkFailed method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreMarkFailedFunc.PushReturn" href="#StoreMarkFailedFunc.PushReturn">func (f *StoreMarkFailedFunc) PushReturn(r0 bool, r1 error)</a>

```
searchKey: workerutil.StoreMarkFailedFunc.PushReturn
tags: [method private]
```

```Go
func (f *StoreMarkFailedFunc) PushReturn(r0 bool, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkFailedFunc.SetDefaultHook" href="#StoreMarkFailedFunc.SetDefaultHook">func (f *StoreMarkFailedFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))</a>

```
searchKey: workerutil.StoreMarkFailedFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *StoreMarkFailedFunc) SetDefaultHook(hook func(context.Context, int, string) (bool, error))
```

SetDefaultHook sets function that is called when the MarkFailed method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreMarkFailedFunc.SetDefaultReturn" href="#StoreMarkFailedFunc.SetDefaultReturn">func (f *StoreMarkFailedFunc) SetDefaultReturn(r0 bool, r1 error)</a>

```
searchKey: workerutil.StoreMarkFailedFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *StoreMarkFailedFunc) SetDefaultReturn(r0 bool, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreMarkFailedFunc.appendCall" href="#StoreMarkFailedFunc.appendCall">func (f *StoreMarkFailedFunc) appendCall(r0 StoreMarkFailedFuncCall)</a>

```
searchKey: workerutil.StoreMarkFailedFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreMarkFailedFunc) appendCall(r0 StoreMarkFailedFuncCall)
```

#### <a id="StoreMarkFailedFunc.nextHook" href="#StoreMarkFailedFunc.nextHook">func (f *StoreMarkFailedFunc) nextHook() func(context.Context, int, string) (bool, error)</a>

```
searchKey: workerutil.StoreMarkFailedFunc.nextHook
tags: [method private]
```

```Go
func (f *StoreMarkFailedFunc) nextHook() func(context.Context, int, string) (bool, error)
```

### <a id="StoreMarkFailedFuncCall" href="#StoreMarkFailedFuncCall">type StoreMarkFailedFuncCall struct</a>

```
searchKey: workerutil.StoreMarkFailedFuncCall
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
searchKey: workerutil.StoreMarkFailedFuncCall.Args
tags: [method private]
```

```Go
func (c StoreMarkFailedFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreMarkFailedFuncCall.Results" href="#StoreMarkFailedFuncCall.Results">func (c StoreMarkFailedFuncCall) Results() []interface{}</a>

```
searchKey: workerutil.StoreMarkFailedFuncCall.Results
tags: [method private]
```

```Go
func (c StoreMarkFailedFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreQueuedCountFunc" href="#StoreQueuedCountFunc">type StoreQueuedCountFunc struct</a>

```
searchKey: workerutil.StoreQueuedCountFunc
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
searchKey: workerutil.StoreQueuedCountFunc.History
tags: [method private]
```

```Go
func (f *StoreQueuedCountFunc) History() []StoreQueuedCountFuncCall
```

History returns a sequence of StoreQueuedCountFuncCall objects describing the invocations of this function. 

#### <a id="StoreQueuedCountFunc.PushHook" href="#StoreQueuedCountFunc.PushHook">func (f *StoreQueuedCountFunc) PushHook(hook func(context.Context, interface{}) (int, error))</a>

```
searchKey: workerutil.StoreQueuedCountFunc.PushHook
tags: [method private]
```

```Go
func (f *StoreQueuedCountFunc) PushHook(hook func(context.Context, interface{}) (int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the QueuedCount method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreQueuedCountFunc.PushReturn" href="#StoreQueuedCountFunc.PushReturn">func (f *StoreQueuedCountFunc) PushReturn(r0 int, r1 error)</a>

```
searchKey: workerutil.StoreQueuedCountFunc.PushReturn
tags: [method private]
```

```Go
func (f *StoreQueuedCountFunc) PushReturn(r0 int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreQueuedCountFunc.SetDefaultHook" href="#StoreQueuedCountFunc.SetDefaultHook">func (f *StoreQueuedCountFunc) SetDefaultHook(hook func(context.Context, interface{}) (int, error))</a>

```
searchKey: workerutil.StoreQueuedCountFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *StoreQueuedCountFunc) SetDefaultHook(hook func(context.Context, interface{}) (int, error))
```

SetDefaultHook sets function that is called when the QueuedCount method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreQueuedCountFunc.SetDefaultReturn" href="#StoreQueuedCountFunc.SetDefaultReturn">func (f *StoreQueuedCountFunc) SetDefaultReturn(r0 int, r1 error)</a>

```
searchKey: workerutil.StoreQueuedCountFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *StoreQueuedCountFunc) SetDefaultReturn(r0 int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreQueuedCountFunc.appendCall" href="#StoreQueuedCountFunc.appendCall">func (f *StoreQueuedCountFunc) appendCall(r0 StoreQueuedCountFuncCall)</a>

```
searchKey: workerutil.StoreQueuedCountFunc.appendCall
tags: [method private]
```

```Go
func (f *StoreQueuedCountFunc) appendCall(r0 StoreQueuedCountFuncCall)
```

#### <a id="StoreQueuedCountFunc.nextHook" href="#StoreQueuedCountFunc.nextHook">func (f *StoreQueuedCountFunc) nextHook() func(context.Context, interface{}) (int, error)</a>

```
searchKey: workerutil.StoreQueuedCountFunc.nextHook
tags: [method private]
```

```Go
func (f *StoreQueuedCountFunc) nextHook() func(context.Context, interface{}) (int, error)
```

### <a id="StoreQueuedCountFuncCall" href="#StoreQueuedCountFuncCall">type StoreQueuedCountFuncCall struct</a>

```
searchKey: workerutil.StoreQueuedCountFuncCall
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
searchKey: workerutil.StoreQueuedCountFuncCall.Args
tags: [method private]
```

```Go
func (c StoreQueuedCountFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreQueuedCountFuncCall.Results" href="#StoreQueuedCountFuncCall.Results">func (c StoreQueuedCountFuncCall) Results() []interface{}</a>

```
searchKey: workerutil.StoreQueuedCountFuncCall.Results
tags: [method private]
```

```Go
func (c StoreQueuedCountFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="TestRecord" href="#TestRecord">type TestRecord struct</a>

```
searchKey: workerutil.TestRecord
tags: [struct private]
```

```Go
type TestRecord struct {
	ID    int
	State string
}
```

#### <a id="TestRecord.RecordID" href="#TestRecord.RecordID">func (v TestRecord) RecordID() int</a>

```
searchKey: workerutil.TestRecord.RecordID
tags: [method private]
```

```Go
func (v TestRecord) RecordID() int
```

### <a id="WithHooks" href="#WithHooks">type WithHooks interface</a>

```
searchKey: workerutil.WithHooks
tags: [interface]
```

```Go
type WithHooks interface {
	// PreHandle is called, if implemented, directly before a invoking the handler with the given
	// record. This method is invoked before starting a handler goroutine - therefore, any expensive
	// operations in this method will block the dequeue loop from proceeding.
	PreHandle(ctx context.Context, record Record)

	// PostHandle is called, if implemented, directly after the handler for the given record has
	// completed. This method is invoked inside the handler goroutine. Note that if PreHandle and
	// PostHandle both operate on shared data, that they will be operating on the data from different
	// goroutines and it is up to the caller to properly synchronize access to it.
	PostHandle(ctx context.Context, record Record)
}
```

WithHooks is an extension of the Handler interface. 

Example use case: The processor for LSIF uploads has a maximum budget based on input size. PreHandle will subtract the input size (atomically) from the budget and PostHandle will restore the input size back to the budget. The PreDequeue hook is also implemented to supply additional SQL conditions that ensures no record with a larger input sizes than the current budget will be dequeued by the worker process. 

### <a id="WithHooksPostHandleFunc" href="#WithHooksPostHandleFunc">type WithHooksPostHandleFunc struct</a>

```
searchKey: workerutil.WithHooksPostHandleFunc
tags: [struct private]
```

```Go
type WithHooksPostHandleFunc struct {
	defaultHook func(context.Context, Record)
	hooks       []func(context.Context, Record)
	history     []WithHooksPostHandleFuncCall
	mutex       sync.Mutex
}
```

WithHooksPostHandleFunc describes the behavior when the PostHandle method of the parent MockWithHooks instance is invoked. 

#### <a id="WithHooksPostHandleFunc.History" href="#WithHooksPostHandleFunc.History">func (f *WithHooksPostHandleFunc) History() []WithHooksPostHandleFuncCall</a>

```
searchKey: workerutil.WithHooksPostHandleFunc.History
tags: [method private]
```

```Go
func (f *WithHooksPostHandleFunc) History() []WithHooksPostHandleFuncCall
```

History returns a sequence of WithHooksPostHandleFuncCall objects describing the invocations of this function. 

#### <a id="WithHooksPostHandleFunc.PushHook" href="#WithHooksPostHandleFunc.PushHook">func (f *WithHooksPostHandleFunc) PushHook(hook func(context.Context, Record))</a>

```
searchKey: workerutil.WithHooksPostHandleFunc.PushHook
tags: [method private]
```

```Go
func (f *WithHooksPostHandleFunc) PushHook(hook func(context.Context, Record))
```

PushHook adds a function to the end of hook queue. Each invocation of the PostHandle method of the parent MockWithHooks instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="WithHooksPostHandleFunc.PushReturn" href="#WithHooksPostHandleFunc.PushReturn">func (f *WithHooksPostHandleFunc) PushReturn()</a>

```
searchKey: workerutil.WithHooksPostHandleFunc.PushReturn
tags: [method private]
```

```Go
func (f *WithHooksPostHandleFunc) PushReturn()
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="WithHooksPostHandleFunc.SetDefaultHook" href="#WithHooksPostHandleFunc.SetDefaultHook">func (f *WithHooksPostHandleFunc) SetDefaultHook(hook func(context.Context, Record))</a>

```
searchKey: workerutil.WithHooksPostHandleFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *WithHooksPostHandleFunc) SetDefaultHook(hook func(context.Context, Record))
```

SetDefaultHook sets function that is called when the PostHandle method of the parent MockWithHooks instance is invoked and the hook queue is empty. 

#### <a id="WithHooksPostHandleFunc.SetDefaultReturn" href="#WithHooksPostHandleFunc.SetDefaultReturn">func (f *WithHooksPostHandleFunc) SetDefaultReturn()</a>

```
searchKey: workerutil.WithHooksPostHandleFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *WithHooksPostHandleFunc) SetDefaultReturn()
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="WithHooksPostHandleFunc.appendCall" href="#WithHooksPostHandleFunc.appendCall">func (f *WithHooksPostHandleFunc) appendCall(r0 WithHooksPostHandleFuncCall)</a>

```
searchKey: workerutil.WithHooksPostHandleFunc.appendCall
tags: [method private]
```

```Go
func (f *WithHooksPostHandleFunc) appendCall(r0 WithHooksPostHandleFuncCall)
```

#### <a id="WithHooksPostHandleFunc.nextHook" href="#WithHooksPostHandleFunc.nextHook">func (f *WithHooksPostHandleFunc) nextHook() func(context.Context, Record)</a>

```
searchKey: workerutil.WithHooksPostHandleFunc.nextHook
tags: [method private]
```

```Go
func (f *WithHooksPostHandleFunc) nextHook() func(context.Context, Record)
```

### <a id="WithHooksPostHandleFuncCall" href="#WithHooksPostHandleFuncCall">type WithHooksPostHandleFuncCall struct</a>

```
searchKey: workerutil.WithHooksPostHandleFuncCall
tags: [struct private]
```

```Go
type WithHooksPostHandleFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 Record
}
```

WithHooksPostHandleFuncCall is an object that describes an invocation of method PostHandle on an instance of MockWithHooks. 

#### <a id="WithHooksPostHandleFuncCall.Args" href="#WithHooksPostHandleFuncCall.Args">func (c WithHooksPostHandleFuncCall) Args() []interface{}</a>

```
searchKey: workerutil.WithHooksPostHandleFuncCall.Args
tags: [method private]
```

```Go
func (c WithHooksPostHandleFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="WithHooksPostHandleFuncCall.Results" href="#WithHooksPostHandleFuncCall.Results">func (c WithHooksPostHandleFuncCall) Results() []interface{}</a>

```
searchKey: workerutil.WithHooksPostHandleFuncCall.Results
tags: [method private]
```

```Go
func (c WithHooksPostHandleFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="WithHooksPreHandleFunc" href="#WithHooksPreHandleFunc">type WithHooksPreHandleFunc struct</a>

```
searchKey: workerutil.WithHooksPreHandleFunc
tags: [struct private]
```

```Go
type WithHooksPreHandleFunc struct {
	defaultHook func(context.Context, Record)
	hooks       []func(context.Context, Record)
	history     []WithHooksPreHandleFuncCall
	mutex       sync.Mutex
}
```

WithHooksPreHandleFunc describes the behavior when the PreHandle method of the parent MockWithHooks instance is invoked. 

#### <a id="WithHooksPreHandleFunc.History" href="#WithHooksPreHandleFunc.History">func (f *WithHooksPreHandleFunc) History() []WithHooksPreHandleFuncCall</a>

```
searchKey: workerutil.WithHooksPreHandleFunc.History
tags: [method private]
```

```Go
func (f *WithHooksPreHandleFunc) History() []WithHooksPreHandleFuncCall
```

History returns a sequence of WithHooksPreHandleFuncCall objects describing the invocations of this function. 

#### <a id="WithHooksPreHandleFunc.PushHook" href="#WithHooksPreHandleFunc.PushHook">func (f *WithHooksPreHandleFunc) PushHook(hook func(context.Context, Record))</a>

```
searchKey: workerutil.WithHooksPreHandleFunc.PushHook
tags: [method private]
```

```Go
func (f *WithHooksPreHandleFunc) PushHook(hook func(context.Context, Record))
```

PushHook adds a function to the end of hook queue. Each invocation of the PreHandle method of the parent MockWithHooks instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="WithHooksPreHandleFunc.PushReturn" href="#WithHooksPreHandleFunc.PushReturn">func (f *WithHooksPreHandleFunc) PushReturn()</a>

```
searchKey: workerutil.WithHooksPreHandleFunc.PushReturn
tags: [method private]
```

```Go
func (f *WithHooksPreHandleFunc) PushReturn()
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="WithHooksPreHandleFunc.SetDefaultHook" href="#WithHooksPreHandleFunc.SetDefaultHook">func (f *WithHooksPreHandleFunc) SetDefaultHook(hook func(context.Context, Record))</a>

```
searchKey: workerutil.WithHooksPreHandleFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *WithHooksPreHandleFunc) SetDefaultHook(hook func(context.Context, Record))
```

SetDefaultHook sets function that is called when the PreHandle method of the parent MockWithHooks instance is invoked and the hook queue is empty. 

#### <a id="WithHooksPreHandleFunc.SetDefaultReturn" href="#WithHooksPreHandleFunc.SetDefaultReturn">func (f *WithHooksPreHandleFunc) SetDefaultReturn()</a>

```
searchKey: workerutil.WithHooksPreHandleFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *WithHooksPreHandleFunc) SetDefaultReturn()
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="WithHooksPreHandleFunc.appendCall" href="#WithHooksPreHandleFunc.appendCall">func (f *WithHooksPreHandleFunc) appendCall(r0 WithHooksPreHandleFuncCall)</a>

```
searchKey: workerutil.WithHooksPreHandleFunc.appendCall
tags: [method private]
```

```Go
func (f *WithHooksPreHandleFunc) appendCall(r0 WithHooksPreHandleFuncCall)
```

#### <a id="WithHooksPreHandleFunc.nextHook" href="#WithHooksPreHandleFunc.nextHook">func (f *WithHooksPreHandleFunc) nextHook() func(context.Context, Record)</a>

```
searchKey: workerutil.WithHooksPreHandleFunc.nextHook
tags: [method private]
```

```Go
func (f *WithHooksPreHandleFunc) nextHook() func(context.Context, Record)
```

### <a id="WithHooksPreHandleFuncCall" href="#WithHooksPreHandleFuncCall">type WithHooksPreHandleFuncCall struct</a>

```
searchKey: workerutil.WithHooksPreHandleFuncCall
tags: [struct private]
```

```Go
type WithHooksPreHandleFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 Record
}
```

WithHooksPreHandleFuncCall is an object that describes an invocation of method PreHandle on an instance of MockWithHooks. 

#### <a id="WithHooksPreHandleFuncCall.Args" href="#WithHooksPreHandleFuncCall.Args">func (c WithHooksPreHandleFuncCall) Args() []interface{}</a>

```
searchKey: workerutil.WithHooksPreHandleFuncCall.Args
tags: [method private]
```

```Go
func (c WithHooksPreHandleFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="WithHooksPreHandleFuncCall.Results" href="#WithHooksPreHandleFuncCall.Results">func (c WithHooksPreHandleFuncCall) Results() []interface{}</a>

```
searchKey: workerutil.WithHooksPreHandleFuncCall.Results
tags: [method private]
```

```Go
func (c WithHooksPreHandleFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="WithPreDequeue" href="#WithPreDequeue">type WithPreDequeue interface</a>

```
searchKey: workerutil.WithPreDequeue
tags: [interface]
```

```Go
type WithPreDequeue interface {
	// PreDequeue is called, if implemented, directly before a call to the store's Dequeue method.
	// If this method returns false, then the current worker iteration is skipped and the next iteration
	// will begin after waiting for the configured polling interval. Any value returned by this method
	// will be used as additional parameters to the store's Dequeue method.
	PreDequeue(ctx context.Context) (dequeueable bool, extraDequeueArguments interface{}, err error)
}
```

WithPreDequeue is an extension of the Handler interface. 

### <a id="WithPreDequeuePreDequeueFunc" href="#WithPreDequeuePreDequeueFunc">type WithPreDequeuePreDequeueFunc struct</a>

```
searchKey: workerutil.WithPreDequeuePreDequeueFunc
tags: [struct private]
```

```Go
type WithPreDequeuePreDequeueFunc struct {
	defaultHook func(context.Context) (bool, interface{}, error)
	hooks       []func(context.Context) (bool, interface{}, error)
	history     []WithPreDequeuePreDequeueFuncCall
	mutex       sync.Mutex
}
```

WithPreDequeuePreDequeueFunc describes the behavior when the PreDequeue method of the parent MockWithPreDequeue instance is invoked. 

#### <a id="WithPreDequeuePreDequeueFunc.History" href="#WithPreDequeuePreDequeueFunc.History">func (f *WithPreDequeuePreDequeueFunc) History() []WithPreDequeuePreDequeueFuncCall</a>

```
searchKey: workerutil.WithPreDequeuePreDequeueFunc.History
tags: [method private]
```

```Go
func (f *WithPreDequeuePreDequeueFunc) History() []WithPreDequeuePreDequeueFuncCall
```

History returns a sequence of WithPreDequeuePreDequeueFuncCall objects describing the invocations of this function. 

#### <a id="WithPreDequeuePreDequeueFunc.PushHook" href="#WithPreDequeuePreDequeueFunc.PushHook">func (f *WithPreDequeuePreDequeueFunc) PushHook(hook func(context.Context) (bool, interface{}, error))</a>

```
searchKey: workerutil.WithPreDequeuePreDequeueFunc.PushHook
tags: [method private]
```

```Go
func (f *WithPreDequeuePreDequeueFunc) PushHook(hook func(context.Context) (bool, interface{}, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the PreDequeue method of the parent MockWithPreDequeue instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="WithPreDequeuePreDequeueFunc.PushReturn" href="#WithPreDequeuePreDequeueFunc.PushReturn">func (f *WithPreDequeuePreDequeueFunc) PushReturn(r0 bool, r1 interface{}, r2 error)</a>

```
searchKey: workerutil.WithPreDequeuePreDequeueFunc.PushReturn
tags: [method private]
```

```Go
func (f *WithPreDequeuePreDequeueFunc) PushReturn(r0 bool, r1 interface{}, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="WithPreDequeuePreDequeueFunc.SetDefaultHook" href="#WithPreDequeuePreDequeueFunc.SetDefaultHook">func (f *WithPreDequeuePreDequeueFunc) SetDefaultHook(hook func(context.Context) (bool, interface{}, error))</a>

```
searchKey: workerutil.WithPreDequeuePreDequeueFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *WithPreDequeuePreDequeueFunc) SetDefaultHook(hook func(context.Context) (bool, interface{}, error))
```

SetDefaultHook sets function that is called when the PreDequeue method of the parent MockWithPreDequeue instance is invoked and the hook queue is empty. 

#### <a id="WithPreDequeuePreDequeueFunc.SetDefaultReturn" href="#WithPreDequeuePreDequeueFunc.SetDefaultReturn">func (f *WithPreDequeuePreDequeueFunc) SetDefaultReturn(r0 bool, r1 interface{}, r2 error)</a>

```
searchKey: workerutil.WithPreDequeuePreDequeueFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *WithPreDequeuePreDequeueFunc) SetDefaultReturn(r0 bool, r1 interface{}, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="WithPreDequeuePreDequeueFunc.appendCall" href="#WithPreDequeuePreDequeueFunc.appendCall">func (f *WithPreDequeuePreDequeueFunc) appendCall(r0 WithPreDequeuePreDequeueFuncCall)</a>

```
searchKey: workerutil.WithPreDequeuePreDequeueFunc.appendCall
tags: [method private]
```

```Go
func (f *WithPreDequeuePreDequeueFunc) appendCall(r0 WithPreDequeuePreDequeueFuncCall)
```

#### <a id="WithPreDequeuePreDequeueFunc.nextHook" href="#WithPreDequeuePreDequeueFunc.nextHook">func (f *WithPreDequeuePreDequeueFunc) nextHook() func(context.Context) (bool, interface{}, error)</a>

```
searchKey: workerutil.WithPreDequeuePreDequeueFunc.nextHook
tags: [method private]
```

```Go
func (f *WithPreDequeuePreDequeueFunc) nextHook() func(context.Context) (bool, interface{}, error)
```

### <a id="WithPreDequeuePreDequeueFuncCall" href="#WithPreDequeuePreDequeueFuncCall">type WithPreDequeuePreDequeueFuncCall struct</a>

```
searchKey: workerutil.WithPreDequeuePreDequeueFuncCall
tags: [struct private]
```

```Go
type WithPreDequeuePreDequeueFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 bool
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 interface{}
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

WithPreDequeuePreDequeueFuncCall is an object that describes an invocation of method PreDequeue on an instance of MockWithPreDequeue. 

#### <a id="WithPreDequeuePreDequeueFuncCall.Args" href="#WithPreDequeuePreDequeueFuncCall.Args">func (c WithPreDequeuePreDequeueFuncCall) Args() []interface{}</a>

```
searchKey: workerutil.WithPreDequeuePreDequeueFuncCall.Args
tags: [method private]
```

```Go
func (c WithPreDequeuePreDequeueFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="WithPreDequeuePreDequeueFuncCall.Results" href="#WithPreDequeuePreDequeueFuncCall.Results">func (c WithPreDequeuePreDequeueFuncCall) Results() []interface{}</a>

```
searchKey: workerutil.WithPreDequeuePreDequeueFuncCall.Results
tags: [method private]
```

```Go
func (c WithPreDequeuePreDequeueFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="Worker" href="#Worker">type Worker struct</a>

```
searchKey: workerutil.Worker
tags: [struct]
```

```Go
type Worker struct {
	store            Store
	handler          Handler
	options          WorkerOptions
	clock            glock.Clock
	handlerSemaphore chan struct{}   // tracks available handler slots
	ctx              context.Context // root context passed to the handler
	cancel           func()          // cancels the root context
	wg               sync.WaitGroup  // tracks active handler routines
	finished         chan struct{}   // signals that Start has finished
}
```

Worker is a generic consumer of records from the workerutil store. 

#### <a id="NewWorker" href="#NewWorker">func NewWorker(ctx context.Context, store Store, handler Handler, options WorkerOptions) *Worker</a>

```
searchKey: workerutil.NewWorker
tags: [function]
```

```Go
func NewWorker(ctx context.Context, store Store, handler Handler, options WorkerOptions) *Worker
```

#### <a id="newWorker" href="#newWorker">func newWorker(ctx context.Context, store Store, handler Handler, options WorkerOptions, clock glock.Clock) *Worker</a>

```
searchKey: workerutil.newWorker
tags: [function private]
```

```Go
func newWorker(ctx context.Context, store Store, handler Handler, options WorkerOptions, clock glock.Clock) *Worker
```

#### <a id="Worker.Start" href="#Worker.Start">func (w *Worker) Start()</a>

```
searchKey: workerutil.Worker.Start
tags: [method]
```

```Go
func (w *Worker) Start()
```

Start begins polling for work from the underlying store and processing records. 

#### <a id="Worker.Stop" href="#Worker.Stop">func (w *Worker) Stop()</a>

```
searchKey: workerutil.Worker.Stop
tags: [method]
```

```Go
func (w *Worker) Stop()
```

Stop will cause the worker loop to exit after the current iteration. This is done by canceling the context passed to the database and the handler functions (which may cause the currently processing unit of work to fail). This method blocks until all handler goroutines have exited. 

#### <a id="Worker.dequeueAndHandle" href="#Worker.dequeueAndHandle">func (w *Worker) dequeueAndHandle() (dequeued bool, err error)</a>

```
searchKey: workerutil.Worker.dequeueAndHandle
tags: [method private]
```

```Go
func (w *Worker) dequeueAndHandle() (dequeued bool, err error)
```

dequeueAndHandle selects a queued record to process. This method returns false if no such record can be dequeued and returns an error only on failure to dequeue a new record - no handler errors will bubble up. 

#### <a id="Worker.handle" href="#Worker.handle">func (w *Worker) handle(tx Store, record Record) (err error)</a>

```
searchKey: workerutil.Worker.handle
tags: [method private]
```

```Go
func (w *Worker) handle(tx Store, record Record) (err error)
```

handle processes the given record locked by the given transaction. This method returns an error only if there is an issue committing the transaction - no handler errors will bubble up. 

#### <a id="Worker.preDequeueHook" href="#Worker.preDequeueHook">func (w *Worker) preDequeueHook() (dequeueable bool, extraDequeueArguments interface{}, err error)</a>

```
searchKey: workerutil.Worker.preDequeueHook
tags: [method private]
```

```Go
func (w *Worker) preDequeueHook() (dequeueable bool, extraDequeueArguments interface{}, err error)
```

preDequeueHook invokes the handler's pre-dequeue hook if it exists. 

### <a id="WorkerMetrics" href="#WorkerMetrics">type WorkerMetrics struct</a>

```
searchKey: workerutil.WorkerMetrics
tags: [struct]
```

```Go
type WorkerMetrics struct {
	operations *operations
	numJobs    prometheus.Gauge
}
```

#### <a id="NewMetrics" href="#NewMetrics">func NewMetrics(observationContext *observation.Context, prefix string, labels map[string]string) WorkerMetrics</a>

```
searchKey: workerutil.NewMetrics
tags: [function]
```

```Go
func NewMetrics(observationContext *observation.Context, prefix string, labels map[string]string) WorkerMetrics
```

NewMetrics creates and registers the following metrics for a generic worker instance. 

```
- {prefix}_duration_seconds_bucket: handler operation latency histogram
- {prefix}_total: number of handler operations
- {prefix}_error_total: number of handler operations resulting in an error
- {prefix}_handlers: the number of active handler routines

```
The given labels are emitted on each metric. 

### <a id="WorkerOptions" href="#WorkerOptions">type WorkerOptions struct</a>

```
searchKey: workerutil.WorkerOptions
tags: [struct]
```

```Go
type WorkerOptions struct {
	// Name denotes the name of the worker used to distinguish log messages and
	// emitted metrics. The worker constructor will fail if this field is not
	// supplied.
	Name string

	// NumHandlers is the maximum number of handlers that can be invoked
	// concurrently. The underlying store will not be queried while the current
	// number of handlers exceeds this value.
	NumHandlers int

	// Interval is the frequency to poll the underlying store for new work.
	Interval time.Duration

	// Metrics configures logging, tracing, and metrics for the work loop.
	Metrics WorkerMetrics
}
```

### <a id="nonRetryableTestErr" href="#nonRetryableTestErr">type nonRetryableTestErr struct{}</a>

```
searchKey: workerutil.nonRetryableTestErr
tags: [struct private]
```

```Go
type nonRetryableTestErr struct{}
```

#### <a id="nonRetryableTestErr.Error" href="#nonRetryableTestErr.Error">func (e nonRetryableTestErr) Error() string</a>

```
searchKey: workerutil.nonRetryableTestErr.Error
tags: [method private]
```

```Go
func (e nonRetryableTestErr) Error() string
```

#### <a id="nonRetryableTestErr.NonRetryable" href="#nonRetryableTestErr.NonRetryable">func (e nonRetryableTestErr) NonRetryable() bool</a>

```
searchKey: workerutil.nonRetryableTestErr.NonRetryable
tags: [method private]
```

```Go
func (e nonRetryableTestErr) NonRetryable() bool
```

### <a id="operations" href="#operations">type operations struct</a>

```
searchKey: workerutil.operations
tags: [struct private]
```

```Go
type operations struct {
	handle *observation.Operation
}
```

#### <a id="newOperations" href="#newOperations">func newOperations(observationContext *observation.Context, prefix string, keys, values []string) *operations</a>

```
searchKey: workerutil.newOperations
tags: [function private]
```

```Go
func newOperations(observationContext *observation.Context, prefix string, keys, values []string) *operations
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: workerutil.TestMain
tags: [function private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestWorkerBlockingPreDequeueHook" href="#TestWorkerBlockingPreDequeueHook">func TestWorkerBlockingPreDequeueHook(t *testing.T)</a>

```
searchKey: workerutil.TestWorkerBlockingPreDequeueHook
tags: [function private test]
```

```Go
func TestWorkerBlockingPreDequeueHook(t *testing.T)
```

### <a id="TestWorkerConcurrent" href="#TestWorkerConcurrent">func TestWorkerConcurrent(t *testing.T)</a>

```
searchKey: workerutil.TestWorkerConcurrent
tags: [function private test]
```

```Go
func TestWorkerConcurrent(t *testing.T)
```

### <a id="TestWorkerConditionalPreDequeueHook" href="#TestWorkerConditionalPreDequeueHook">func TestWorkerConditionalPreDequeueHook(t *testing.T)</a>

```
searchKey: workerutil.TestWorkerConditionalPreDequeueHook
tags: [function private test]
```

```Go
func TestWorkerConditionalPreDequeueHook(t *testing.T)
```

### <a id="TestWorkerHandlerFailure" href="#TestWorkerHandlerFailure">func TestWorkerHandlerFailure(t *testing.T)</a>

```
searchKey: workerutil.TestWorkerHandlerFailure
tags: [function private test]
```

```Go
func TestWorkerHandlerFailure(t *testing.T)
```

### <a id="TestWorkerHandlerNonRetryableFailure" href="#TestWorkerHandlerNonRetryableFailure">func TestWorkerHandlerNonRetryableFailure(t *testing.T)</a>

```
searchKey: workerutil.TestWorkerHandlerNonRetryableFailure
tags: [function private test]
```

```Go
func TestWorkerHandlerNonRetryableFailure(t *testing.T)
```

### <a id="TestWorkerHandlerSuccess" href="#TestWorkerHandlerSuccess">func TestWorkerHandlerSuccess(t *testing.T)</a>

```
searchKey: workerutil.TestWorkerHandlerSuccess
tags: [function private test]
```

```Go
func TestWorkerHandlerSuccess(t *testing.T)
```

