# Package mocks

## Index

* [Types](#type)
    * [type MockStore struct](#MockStore)
        * [func NewMockStore() *MockStore](#NewMockStore)
        * [func NewMockStoreFrom(i uploadstore.Store) *MockStore](#NewMockStoreFrom)
        * [func (m *MockStore) Compose(v0 context.Context, v1 string, v2 ...string) (int64, error)](#MockStore.Compose)
        * [func (m *MockStore) Delete(v0 context.Context, v1 string) error](#MockStore.Delete)
        * [func (m *MockStore) Get(v0 context.Context, v1 string) (io.ReadCloser, error)](#MockStore.Get)
        * [func (m *MockStore) Init(v0 context.Context) error](#MockStore.Init)
        * [func (m *MockStore) Upload(v0 context.Context, v1 string, v2 io.Reader) (int64, error)](#MockStore.Upload)
    * [type StoreComposeFunc struct](#StoreComposeFunc)
        * [func (f *StoreComposeFunc) SetDefaultHook(hook func(context.Context, string, ...string) (int64, error))](#StoreComposeFunc.SetDefaultHook)
        * [func (f *StoreComposeFunc) PushHook(hook func(context.Context, string, ...string) (int64, error))](#StoreComposeFunc.PushHook)
        * [func (f *StoreComposeFunc) SetDefaultReturn(r0 int64, r1 error)](#StoreComposeFunc.SetDefaultReturn)
        * [func (f *StoreComposeFunc) PushReturn(r0 int64, r1 error)](#StoreComposeFunc.PushReturn)
        * [func (f *StoreComposeFunc) nextHook() func(context.Context, string, ...string) (int64, error)](#StoreComposeFunc.nextHook)
        * [func (f *StoreComposeFunc) appendCall(r0 StoreComposeFuncCall)](#StoreComposeFunc.appendCall)
        * [func (f *StoreComposeFunc) History() []StoreComposeFuncCall](#StoreComposeFunc.History)
    * [type StoreComposeFuncCall struct](#StoreComposeFuncCall)
        * [func (c StoreComposeFuncCall) Args() []interface{}](#StoreComposeFuncCall.Args)
        * [func (c StoreComposeFuncCall) Results() []interface{}](#StoreComposeFuncCall.Results)
    * [type StoreDeleteFunc struct](#StoreDeleteFunc)
        * [func (f *StoreDeleteFunc) SetDefaultHook(hook func(context.Context, string) error)](#StoreDeleteFunc.SetDefaultHook)
        * [func (f *StoreDeleteFunc) PushHook(hook func(context.Context, string) error)](#StoreDeleteFunc.PushHook)
        * [func (f *StoreDeleteFunc) SetDefaultReturn(r0 error)](#StoreDeleteFunc.SetDefaultReturn)
        * [func (f *StoreDeleteFunc) PushReturn(r0 error)](#StoreDeleteFunc.PushReturn)
        * [func (f *StoreDeleteFunc) nextHook() func(context.Context, string) error](#StoreDeleteFunc.nextHook)
        * [func (f *StoreDeleteFunc) appendCall(r0 StoreDeleteFuncCall)](#StoreDeleteFunc.appendCall)
        * [func (f *StoreDeleteFunc) History() []StoreDeleteFuncCall](#StoreDeleteFunc.History)
    * [type StoreDeleteFuncCall struct](#StoreDeleteFuncCall)
        * [func (c StoreDeleteFuncCall) Args() []interface{}](#StoreDeleteFuncCall.Args)
        * [func (c StoreDeleteFuncCall) Results() []interface{}](#StoreDeleteFuncCall.Results)
    * [type StoreGetFunc struct](#StoreGetFunc)
        * [func (f *StoreGetFunc) SetDefaultHook(hook func(context.Context, string) (io.ReadCloser, error))](#StoreGetFunc.SetDefaultHook)
        * [func (f *StoreGetFunc) PushHook(hook func(context.Context, string) (io.ReadCloser, error))](#StoreGetFunc.PushHook)
        * [func (f *StoreGetFunc) SetDefaultReturn(r0 io.ReadCloser, r1 error)](#StoreGetFunc.SetDefaultReturn)
        * [func (f *StoreGetFunc) PushReturn(r0 io.ReadCloser, r1 error)](#StoreGetFunc.PushReturn)
        * [func (f *StoreGetFunc) nextHook() func(context.Context, string) (io.ReadCloser, error)](#StoreGetFunc.nextHook)
        * [func (f *StoreGetFunc) appendCall(r0 StoreGetFuncCall)](#StoreGetFunc.appendCall)
        * [func (f *StoreGetFunc) History() []StoreGetFuncCall](#StoreGetFunc.History)
    * [type StoreGetFuncCall struct](#StoreGetFuncCall)
        * [func (c StoreGetFuncCall) Args() []interface{}](#StoreGetFuncCall.Args)
        * [func (c StoreGetFuncCall) Results() []interface{}](#StoreGetFuncCall.Results)
    * [type StoreInitFunc struct](#StoreInitFunc)
        * [func (f *StoreInitFunc) SetDefaultHook(hook func(context.Context) error)](#StoreInitFunc.SetDefaultHook)
        * [func (f *StoreInitFunc) PushHook(hook func(context.Context) error)](#StoreInitFunc.PushHook)
        * [func (f *StoreInitFunc) SetDefaultReturn(r0 error)](#StoreInitFunc.SetDefaultReturn)
        * [func (f *StoreInitFunc) PushReturn(r0 error)](#StoreInitFunc.PushReturn)
        * [func (f *StoreInitFunc) nextHook() func(context.Context) error](#StoreInitFunc.nextHook)
        * [func (f *StoreInitFunc) appendCall(r0 StoreInitFuncCall)](#StoreInitFunc.appendCall)
        * [func (f *StoreInitFunc) History() []StoreInitFuncCall](#StoreInitFunc.History)
    * [type StoreInitFuncCall struct](#StoreInitFuncCall)
        * [func (c StoreInitFuncCall) Args() []interface{}](#StoreInitFuncCall.Args)
        * [func (c StoreInitFuncCall) Results() []interface{}](#StoreInitFuncCall.Results)
    * [type StoreUploadFunc struct](#StoreUploadFunc)
        * [func (f *StoreUploadFunc) SetDefaultHook(hook func(context.Context, string, io.Reader) (int64, error))](#StoreUploadFunc.SetDefaultHook)
        * [func (f *StoreUploadFunc) PushHook(hook func(context.Context, string, io.Reader) (int64, error))](#StoreUploadFunc.PushHook)
        * [func (f *StoreUploadFunc) SetDefaultReturn(r0 int64, r1 error)](#StoreUploadFunc.SetDefaultReturn)
        * [func (f *StoreUploadFunc) PushReturn(r0 int64, r1 error)](#StoreUploadFunc.PushReturn)
        * [func (f *StoreUploadFunc) nextHook() func(context.Context, string, io.Reader) (int64, error)](#StoreUploadFunc.nextHook)
        * [func (f *StoreUploadFunc) appendCall(r0 StoreUploadFuncCall)](#StoreUploadFunc.appendCall)
        * [func (f *StoreUploadFunc) History() []StoreUploadFuncCall](#StoreUploadFunc.History)
    * [type StoreUploadFuncCall struct](#StoreUploadFuncCall)
        * [func (c StoreUploadFuncCall) Args() []interface{}](#StoreUploadFuncCall.Args)
        * [func (c StoreUploadFuncCall) Results() []interface{}](#StoreUploadFuncCall.Results)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="MockStore" href="#MockStore">type MockStore struct</a>

```
searchKey: mocks.MockStore
```

```Go
type MockStore struct {
	// ComposeFunc is an instance of a mock function object controlling the
	// behavior of the method Compose.
	ComposeFunc *StoreComposeFunc
	// DeleteFunc is an instance of a mock function object controlling the
	// behavior of the method Delete.
	DeleteFunc *StoreDeleteFunc
	// GetFunc is an instance of a mock function object controlling the
	// behavior of the method Get.
	GetFunc *StoreGetFunc
	// InitFunc is an instance of a mock function object controlling the
	// behavior of the method Init.
	InitFunc *StoreInitFunc
	// UploadFunc is an instance of a mock function object controlling the
	// behavior of the method Upload.
	UploadFunc *StoreUploadFunc
}
```

MockStore is a mock implementation of the Store interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/uploadstore) used for unit testing. 

#### <a id="NewMockStore" href="#NewMockStore">func NewMockStore() *MockStore</a>

```
searchKey: mocks.NewMockStore
```

```Go
func NewMockStore() *MockStore
```

NewMockStore creates a new mock of the Store interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockStoreFrom" href="#NewMockStoreFrom">func NewMockStoreFrom(i uploadstore.Store) *MockStore</a>

```
searchKey: mocks.NewMockStoreFrom
```

```Go
func NewMockStoreFrom(i uploadstore.Store) *MockStore
```

NewMockStoreFrom creates a new mock of the MockStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockStore.Compose" href="#MockStore.Compose">func (m *MockStore) Compose(v0 context.Context, v1 string, v2 ...string) (int64, error)</a>

```
searchKey: mocks.MockStore.Compose
```

```Go
func (m *MockStore) Compose(v0 context.Context, v1 string, v2 ...string) (int64, error)
```

Compose delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.Delete" href="#MockStore.Delete">func (m *MockStore) Delete(v0 context.Context, v1 string) error</a>

```
searchKey: mocks.MockStore.Delete
```

```Go
func (m *MockStore) Delete(v0 context.Context, v1 string) error
```

Delete delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.Get" href="#MockStore.Get">func (m *MockStore) Get(v0 context.Context, v1 string) (io.ReadCloser, error)</a>

```
searchKey: mocks.MockStore.Get
```

```Go
func (m *MockStore) Get(v0 context.Context, v1 string) (io.ReadCloser, error)
```

Get delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.Init" href="#MockStore.Init">func (m *MockStore) Init(v0 context.Context) error</a>

```
searchKey: mocks.MockStore.Init
```

```Go
func (m *MockStore) Init(v0 context.Context) error
```

Init delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockStore.Upload" href="#MockStore.Upload">func (m *MockStore) Upload(v0 context.Context, v1 string, v2 io.Reader) (int64, error)</a>

```
searchKey: mocks.MockStore.Upload
```

```Go
func (m *MockStore) Upload(v0 context.Context, v1 string, v2 io.Reader) (int64, error)
```

Upload delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="StoreComposeFunc" href="#StoreComposeFunc">type StoreComposeFunc struct</a>

```
searchKey: mocks.StoreComposeFunc
```

```Go
type StoreComposeFunc struct {
	defaultHook func(context.Context, string, ...string) (int64, error)
	hooks       []func(context.Context, string, ...string) (int64, error)
	history     []StoreComposeFuncCall
	mutex       sync.Mutex
}
```

StoreComposeFunc describes the behavior when the Compose method of the parent MockStore instance is invoked. 

#### <a id="StoreComposeFunc.SetDefaultHook" href="#StoreComposeFunc.SetDefaultHook">func (f *StoreComposeFunc) SetDefaultHook(hook func(context.Context, string, ...string) (int64, error))</a>

```
searchKey: mocks.StoreComposeFunc.SetDefaultHook
```

```Go
func (f *StoreComposeFunc) SetDefaultHook(hook func(context.Context, string, ...string) (int64, error))
```

SetDefaultHook sets function that is called when the Compose method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreComposeFunc.PushHook" href="#StoreComposeFunc.PushHook">func (f *StoreComposeFunc) PushHook(hook func(context.Context, string, ...string) (int64, error))</a>

```
searchKey: mocks.StoreComposeFunc.PushHook
```

```Go
func (f *StoreComposeFunc) PushHook(hook func(context.Context, string, ...string) (int64, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Compose method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreComposeFunc.SetDefaultReturn" href="#StoreComposeFunc.SetDefaultReturn">func (f *StoreComposeFunc) SetDefaultReturn(r0 int64, r1 error)</a>

```
searchKey: mocks.StoreComposeFunc.SetDefaultReturn
```

```Go
func (f *StoreComposeFunc) SetDefaultReturn(r0 int64, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreComposeFunc.PushReturn" href="#StoreComposeFunc.PushReturn">func (f *StoreComposeFunc) PushReturn(r0 int64, r1 error)</a>

```
searchKey: mocks.StoreComposeFunc.PushReturn
```

```Go
func (f *StoreComposeFunc) PushReturn(r0 int64, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreComposeFunc.nextHook" href="#StoreComposeFunc.nextHook">func (f *StoreComposeFunc) nextHook() func(context.Context, string, ...string) (int64, error)</a>

```
searchKey: mocks.StoreComposeFunc.nextHook
tags: [private]
```

```Go
func (f *StoreComposeFunc) nextHook() func(context.Context, string, ...string) (int64, error)
```

#### <a id="StoreComposeFunc.appendCall" href="#StoreComposeFunc.appendCall">func (f *StoreComposeFunc) appendCall(r0 StoreComposeFuncCall)</a>

```
searchKey: mocks.StoreComposeFunc.appendCall
tags: [private]
```

```Go
func (f *StoreComposeFunc) appendCall(r0 StoreComposeFuncCall)
```

#### <a id="StoreComposeFunc.History" href="#StoreComposeFunc.History">func (f *StoreComposeFunc) History() []StoreComposeFuncCall</a>

```
searchKey: mocks.StoreComposeFunc.History
```

```Go
func (f *StoreComposeFunc) History() []StoreComposeFuncCall
```

History returns a sequence of StoreComposeFuncCall objects describing the invocations of this function. 

### <a id="StoreComposeFuncCall" href="#StoreComposeFuncCall">type StoreComposeFuncCall struct</a>

```
searchKey: mocks.StoreComposeFuncCall
```

```Go
type StoreComposeFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 string
	// Arg2 is a slice containing the values of the variadic arguments
	// passed to this method invocation.
	Arg2 []string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 int64
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

StoreComposeFuncCall is an object that describes an invocation of method Compose on an instance of MockStore. 

#### <a id="StoreComposeFuncCall.Args" href="#StoreComposeFuncCall.Args">func (c StoreComposeFuncCall) Args() []interface{}</a>

```
searchKey: mocks.StoreComposeFuncCall.Args
```

```Go
func (c StoreComposeFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. The variadic slice argument is flattened in this array such that one positional argument and three variadic arguments would result in a slice of four, not two. 

#### <a id="StoreComposeFuncCall.Results" href="#StoreComposeFuncCall.Results">func (c StoreComposeFuncCall) Results() []interface{}</a>

```
searchKey: mocks.StoreComposeFuncCall.Results
```

```Go
func (c StoreComposeFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreDeleteFunc" href="#StoreDeleteFunc">type StoreDeleteFunc struct</a>

```
searchKey: mocks.StoreDeleteFunc
```

```Go
type StoreDeleteFunc struct {
	defaultHook func(context.Context, string) error
	hooks       []func(context.Context, string) error
	history     []StoreDeleteFuncCall
	mutex       sync.Mutex
}
```

StoreDeleteFunc describes the behavior when the Delete method of the parent MockStore instance is invoked. 

#### <a id="StoreDeleteFunc.SetDefaultHook" href="#StoreDeleteFunc.SetDefaultHook">func (f *StoreDeleteFunc) SetDefaultHook(hook func(context.Context, string) error)</a>

```
searchKey: mocks.StoreDeleteFunc.SetDefaultHook
```

```Go
func (f *StoreDeleteFunc) SetDefaultHook(hook func(context.Context, string) error)
```

SetDefaultHook sets function that is called when the Delete method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreDeleteFunc.PushHook" href="#StoreDeleteFunc.PushHook">func (f *StoreDeleteFunc) PushHook(hook func(context.Context, string) error)</a>

```
searchKey: mocks.StoreDeleteFunc.PushHook
```

```Go
func (f *StoreDeleteFunc) PushHook(hook func(context.Context, string) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Delete method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreDeleteFunc.SetDefaultReturn" href="#StoreDeleteFunc.SetDefaultReturn">func (f *StoreDeleteFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: mocks.StoreDeleteFunc.SetDefaultReturn
```

```Go
func (f *StoreDeleteFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreDeleteFunc.PushReturn" href="#StoreDeleteFunc.PushReturn">func (f *StoreDeleteFunc) PushReturn(r0 error)</a>

```
searchKey: mocks.StoreDeleteFunc.PushReturn
```

```Go
func (f *StoreDeleteFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreDeleteFunc.nextHook" href="#StoreDeleteFunc.nextHook">func (f *StoreDeleteFunc) nextHook() func(context.Context, string) error</a>

```
searchKey: mocks.StoreDeleteFunc.nextHook
tags: [private]
```

```Go
func (f *StoreDeleteFunc) nextHook() func(context.Context, string) error
```

#### <a id="StoreDeleteFunc.appendCall" href="#StoreDeleteFunc.appendCall">func (f *StoreDeleteFunc) appendCall(r0 StoreDeleteFuncCall)</a>

```
searchKey: mocks.StoreDeleteFunc.appendCall
tags: [private]
```

```Go
func (f *StoreDeleteFunc) appendCall(r0 StoreDeleteFuncCall)
```

#### <a id="StoreDeleteFunc.History" href="#StoreDeleteFunc.History">func (f *StoreDeleteFunc) History() []StoreDeleteFuncCall</a>

```
searchKey: mocks.StoreDeleteFunc.History
```

```Go
func (f *StoreDeleteFunc) History() []StoreDeleteFuncCall
```

History returns a sequence of StoreDeleteFuncCall objects describing the invocations of this function. 

### <a id="StoreDeleteFuncCall" href="#StoreDeleteFuncCall">type StoreDeleteFuncCall struct</a>

```
searchKey: mocks.StoreDeleteFuncCall
```

```Go
type StoreDeleteFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

StoreDeleteFuncCall is an object that describes an invocation of method Delete on an instance of MockStore. 

#### <a id="StoreDeleteFuncCall.Args" href="#StoreDeleteFuncCall.Args">func (c StoreDeleteFuncCall) Args() []interface{}</a>

```
searchKey: mocks.StoreDeleteFuncCall.Args
```

```Go
func (c StoreDeleteFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreDeleteFuncCall.Results" href="#StoreDeleteFuncCall.Results">func (c StoreDeleteFuncCall) Results() []interface{}</a>

```
searchKey: mocks.StoreDeleteFuncCall.Results
```

```Go
func (c StoreDeleteFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreGetFunc" href="#StoreGetFunc">type StoreGetFunc struct</a>

```
searchKey: mocks.StoreGetFunc
```

```Go
type StoreGetFunc struct {
	defaultHook func(context.Context, string) (io.ReadCloser, error)
	hooks       []func(context.Context, string) (io.ReadCloser, error)
	history     []StoreGetFuncCall
	mutex       sync.Mutex
}
```

StoreGetFunc describes the behavior when the Get method of the parent MockStore instance is invoked. 

#### <a id="StoreGetFunc.SetDefaultHook" href="#StoreGetFunc.SetDefaultHook">func (f *StoreGetFunc) SetDefaultHook(hook func(context.Context, string) (io.ReadCloser, error))</a>

```
searchKey: mocks.StoreGetFunc.SetDefaultHook
```

```Go
func (f *StoreGetFunc) SetDefaultHook(hook func(context.Context, string) (io.ReadCloser, error))
```

SetDefaultHook sets function that is called when the Get method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreGetFunc.PushHook" href="#StoreGetFunc.PushHook">func (f *StoreGetFunc) PushHook(hook func(context.Context, string) (io.ReadCloser, error))</a>

```
searchKey: mocks.StoreGetFunc.PushHook
```

```Go
func (f *StoreGetFunc) PushHook(hook func(context.Context, string) (io.ReadCloser, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Get method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreGetFunc.SetDefaultReturn" href="#StoreGetFunc.SetDefaultReturn">func (f *StoreGetFunc) SetDefaultReturn(r0 io.ReadCloser, r1 error)</a>

```
searchKey: mocks.StoreGetFunc.SetDefaultReturn
```

```Go
func (f *StoreGetFunc) SetDefaultReturn(r0 io.ReadCloser, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreGetFunc.PushReturn" href="#StoreGetFunc.PushReturn">func (f *StoreGetFunc) PushReturn(r0 io.ReadCloser, r1 error)</a>

```
searchKey: mocks.StoreGetFunc.PushReturn
```

```Go
func (f *StoreGetFunc) PushReturn(r0 io.ReadCloser, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreGetFunc.nextHook" href="#StoreGetFunc.nextHook">func (f *StoreGetFunc) nextHook() func(context.Context, string) (io.ReadCloser, error)</a>

```
searchKey: mocks.StoreGetFunc.nextHook
tags: [private]
```

```Go
func (f *StoreGetFunc) nextHook() func(context.Context, string) (io.ReadCloser, error)
```

#### <a id="StoreGetFunc.appendCall" href="#StoreGetFunc.appendCall">func (f *StoreGetFunc) appendCall(r0 StoreGetFuncCall)</a>

```
searchKey: mocks.StoreGetFunc.appendCall
tags: [private]
```

```Go
func (f *StoreGetFunc) appendCall(r0 StoreGetFuncCall)
```

#### <a id="StoreGetFunc.History" href="#StoreGetFunc.History">func (f *StoreGetFunc) History() []StoreGetFuncCall</a>

```
searchKey: mocks.StoreGetFunc.History
```

```Go
func (f *StoreGetFunc) History() []StoreGetFuncCall
```

History returns a sequence of StoreGetFuncCall objects describing the invocations of this function. 

### <a id="StoreGetFuncCall" href="#StoreGetFuncCall">type StoreGetFuncCall struct</a>

```
searchKey: mocks.StoreGetFuncCall
```

```Go
type StoreGetFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 io.ReadCloser
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

StoreGetFuncCall is an object that describes an invocation of method Get on an instance of MockStore. 

#### <a id="StoreGetFuncCall.Args" href="#StoreGetFuncCall.Args">func (c StoreGetFuncCall) Args() []interface{}</a>

```
searchKey: mocks.StoreGetFuncCall.Args
```

```Go
func (c StoreGetFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreGetFuncCall.Results" href="#StoreGetFuncCall.Results">func (c StoreGetFuncCall) Results() []interface{}</a>

```
searchKey: mocks.StoreGetFuncCall.Results
```

```Go
func (c StoreGetFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreInitFunc" href="#StoreInitFunc">type StoreInitFunc struct</a>

```
searchKey: mocks.StoreInitFunc
```

```Go
type StoreInitFunc struct {
	defaultHook func(context.Context) error
	hooks       []func(context.Context) error
	history     []StoreInitFuncCall
	mutex       sync.Mutex
}
```

StoreInitFunc describes the behavior when the Init method of the parent MockStore instance is invoked. 

#### <a id="StoreInitFunc.SetDefaultHook" href="#StoreInitFunc.SetDefaultHook">func (f *StoreInitFunc) SetDefaultHook(hook func(context.Context) error)</a>

```
searchKey: mocks.StoreInitFunc.SetDefaultHook
```

```Go
func (f *StoreInitFunc) SetDefaultHook(hook func(context.Context) error)
```

SetDefaultHook sets function that is called when the Init method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreInitFunc.PushHook" href="#StoreInitFunc.PushHook">func (f *StoreInitFunc) PushHook(hook func(context.Context) error)</a>

```
searchKey: mocks.StoreInitFunc.PushHook
```

```Go
func (f *StoreInitFunc) PushHook(hook func(context.Context) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Init method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreInitFunc.SetDefaultReturn" href="#StoreInitFunc.SetDefaultReturn">func (f *StoreInitFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: mocks.StoreInitFunc.SetDefaultReturn
```

```Go
func (f *StoreInitFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreInitFunc.PushReturn" href="#StoreInitFunc.PushReturn">func (f *StoreInitFunc) PushReturn(r0 error)</a>

```
searchKey: mocks.StoreInitFunc.PushReturn
```

```Go
func (f *StoreInitFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreInitFunc.nextHook" href="#StoreInitFunc.nextHook">func (f *StoreInitFunc) nextHook() func(context.Context) error</a>

```
searchKey: mocks.StoreInitFunc.nextHook
tags: [private]
```

```Go
func (f *StoreInitFunc) nextHook() func(context.Context) error
```

#### <a id="StoreInitFunc.appendCall" href="#StoreInitFunc.appendCall">func (f *StoreInitFunc) appendCall(r0 StoreInitFuncCall)</a>

```
searchKey: mocks.StoreInitFunc.appendCall
tags: [private]
```

```Go
func (f *StoreInitFunc) appendCall(r0 StoreInitFuncCall)
```

#### <a id="StoreInitFunc.History" href="#StoreInitFunc.History">func (f *StoreInitFunc) History() []StoreInitFuncCall</a>

```
searchKey: mocks.StoreInitFunc.History
```

```Go
func (f *StoreInitFunc) History() []StoreInitFuncCall
```

History returns a sequence of StoreInitFuncCall objects describing the invocations of this function. 

### <a id="StoreInitFuncCall" href="#StoreInitFuncCall">type StoreInitFuncCall struct</a>

```
searchKey: mocks.StoreInitFuncCall
```

```Go
type StoreInitFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

StoreInitFuncCall is an object that describes an invocation of method Init on an instance of MockStore. 

#### <a id="StoreInitFuncCall.Args" href="#StoreInitFuncCall.Args">func (c StoreInitFuncCall) Args() []interface{}</a>

```
searchKey: mocks.StoreInitFuncCall.Args
```

```Go
func (c StoreInitFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreInitFuncCall.Results" href="#StoreInitFuncCall.Results">func (c StoreInitFuncCall) Results() []interface{}</a>

```
searchKey: mocks.StoreInitFuncCall.Results
```

```Go
func (c StoreInitFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="StoreUploadFunc" href="#StoreUploadFunc">type StoreUploadFunc struct</a>

```
searchKey: mocks.StoreUploadFunc
```

```Go
type StoreUploadFunc struct {
	defaultHook func(context.Context, string, io.Reader) (int64, error)
	hooks       []func(context.Context, string, io.Reader) (int64, error)
	history     []StoreUploadFuncCall
	mutex       sync.Mutex
}
```

StoreUploadFunc describes the behavior when the Upload method of the parent MockStore instance is invoked. 

#### <a id="StoreUploadFunc.SetDefaultHook" href="#StoreUploadFunc.SetDefaultHook">func (f *StoreUploadFunc) SetDefaultHook(hook func(context.Context, string, io.Reader) (int64, error))</a>

```
searchKey: mocks.StoreUploadFunc.SetDefaultHook
```

```Go
func (f *StoreUploadFunc) SetDefaultHook(hook func(context.Context, string, io.Reader) (int64, error))
```

SetDefaultHook sets function that is called when the Upload method of the parent MockStore instance is invoked and the hook queue is empty. 

#### <a id="StoreUploadFunc.PushHook" href="#StoreUploadFunc.PushHook">func (f *StoreUploadFunc) PushHook(hook func(context.Context, string, io.Reader) (int64, error))</a>

```
searchKey: mocks.StoreUploadFunc.PushHook
```

```Go
func (f *StoreUploadFunc) PushHook(hook func(context.Context, string, io.Reader) (int64, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Upload method of the parent MockStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="StoreUploadFunc.SetDefaultReturn" href="#StoreUploadFunc.SetDefaultReturn">func (f *StoreUploadFunc) SetDefaultReturn(r0 int64, r1 error)</a>

```
searchKey: mocks.StoreUploadFunc.SetDefaultReturn
```

```Go
func (f *StoreUploadFunc) SetDefaultReturn(r0 int64, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="StoreUploadFunc.PushReturn" href="#StoreUploadFunc.PushReturn">func (f *StoreUploadFunc) PushReturn(r0 int64, r1 error)</a>

```
searchKey: mocks.StoreUploadFunc.PushReturn
```

```Go
func (f *StoreUploadFunc) PushReturn(r0 int64, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="StoreUploadFunc.nextHook" href="#StoreUploadFunc.nextHook">func (f *StoreUploadFunc) nextHook() func(context.Context, string, io.Reader) (int64, error)</a>

```
searchKey: mocks.StoreUploadFunc.nextHook
tags: [private]
```

```Go
func (f *StoreUploadFunc) nextHook() func(context.Context, string, io.Reader) (int64, error)
```

#### <a id="StoreUploadFunc.appendCall" href="#StoreUploadFunc.appendCall">func (f *StoreUploadFunc) appendCall(r0 StoreUploadFuncCall)</a>

```
searchKey: mocks.StoreUploadFunc.appendCall
tags: [private]
```

```Go
func (f *StoreUploadFunc) appendCall(r0 StoreUploadFuncCall)
```

#### <a id="StoreUploadFunc.History" href="#StoreUploadFunc.History">func (f *StoreUploadFunc) History() []StoreUploadFuncCall</a>

```
searchKey: mocks.StoreUploadFunc.History
```

```Go
func (f *StoreUploadFunc) History() []StoreUploadFuncCall
```

History returns a sequence of StoreUploadFuncCall objects describing the invocations of this function. 

### <a id="StoreUploadFuncCall" href="#StoreUploadFuncCall">type StoreUploadFuncCall struct</a>

```
searchKey: mocks.StoreUploadFuncCall
```

```Go
type StoreUploadFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 string
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 io.Reader
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 int64
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

StoreUploadFuncCall is an object that describes an invocation of method Upload on an instance of MockStore. 

#### <a id="StoreUploadFuncCall.Args" href="#StoreUploadFuncCall.Args">func (c StoreUploadFuncCall) Args() []interface{}</a>

```
searchKey: mocks.StoreUploadFuncCall.Args
```

```Go
func (c StoreUploadFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="StoreUploadFuncCall.Results" href="#StoreUploadFuncCall.Results">func (c StoreUploadFuncCall) Results() []interface{}</a>

```
searchKey: mocks.StoreUploadFuncCall.Results
```

```Go
func (c StoreUploadFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

