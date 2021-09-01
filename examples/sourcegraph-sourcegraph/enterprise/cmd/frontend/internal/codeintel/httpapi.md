# Package httpapi

## Index

* [Constants](#const)
    * [const testCommit](#testCommit)
* [Variables](#var)
    * [var githubURL](#githubURL)
    * [var revhashPattern](#revhashPattern)
* [Types](#type)
    * [type ClientError struct](#ClientError)
        * [func (e *ClientError) Error() string](#ClientError.Error)
    * [type DBStore interface](#DBStore)
    * [type DBStoreAddUploadPartFunc struct](#DBStoreAddUploadPartFunc)
        * [func (f *DBStoreAddUploadPartFunc) History() []DBStoreAddUploadPartFuncCall](#DBStoreAddUploadPartFunc.History)
        * [func (f *DBStoreAddUploadPartFunc) PushHook(hook func(context.Context, int, int) error)](#DBStoreAddUploadPartFunc.PushHook)
        * [func (f *DBStoreAddUploadPartFunc) PushReturn(r0 error)](#DBStoreAddUploadPartFunc.PushReturn)
        * [func (f *DBStoreAddUploadPartFunc) SetDefaultHook(hook func(context.Context, int, int) error)](#DBStoreAddUploadPartFunc.SetDefaultHook)
        * [func (f *DBStoreAddUploadPartFunc) SetDefaultReturn(r0 error)](#DBStoreAddUploadPartFunc.SetDefaultReturn)
        * [func (f *DBStoreAddUploadPartFunc) appendCall(r0 DBStoreAddUploadPartFuncCall)](#DBStoreAddUploadPartFunc.appendCall)
        * [func (f *DBStoreAddUploadPartFunc) nextHook() func(context.Context, int, int) error](#DBStoreAddUploadPartFunc.nextHook)
    * [type DBStoreAddUploadPartFuncCall struct](#DBStoreAddUploadPartFuncCall)
        * [func (c DBStoreAddUploadPartFuncCall) Args() []interface{}](#DBStoreAddUploadPartFuncCall.Args)
        * [func (c DBStoreAddUploadPartFuncCall) Results() []interface{}](#DBStoreAddUploadPartFuncCall.Results)
    * [type DBStoreDoneFunc struct](#DBStoreDoneFunc)
        * [func (f *DBStoreDoneFunc) History() []DBStoreDoneFuncCall](#DBStoreDoneFunc.History)
        * [func (f *DBStoreDoneFunc) PushHook(hook func(error) error)](#DBStoreDoneFunc.PushHook)
        * [func (f *DBStoreDoneFunc) PushReturn(r0 error)](#DBStoreDoneFunc.PushReturn)
        * [func (f *DBStoreDoneFunc) SetDefaultHook(hook func(error) error)](#DBStoreDoneFunc.SetDefaultHook)
        * [func (f *DBStoreDoneFunc) SetDefaultReturn(r0 error)](#DBStoreDoneFunc.SetDefaultReturn)
        * [func (f *DBStoreDoneFunc) appendCall(r0 DBStoreDoneFuncCall)](#DBStoreDoneFunc.appendCall)
        * [func (f *DBStoreDoneFunc) nextHook() func(error) error](#DBStoreDoneFunc.nextHook)
    * [type DBStoreDoneFuncCall struct](#DBStoreDoneFuncCall)
        * [func (c DBStoreDoneFuncCall) Args() []interface{}](#DBStoreDoneFuncCall.Args)
        * [func (c DBStoreDoneFuncCall) Results() []interface{}](#DBStoreDoneFuncCall.Results)
    * [type DBStoreGetUploadByIDFunc struct](#DBStoreGetUploadByIDFunc)
        * [func (f *DBStoreGetUploadByIDFunc) History() []DBStoreGetUploadByIDFuncCall](#DBStoreGetUploadByIDFunc.History)
        * [func (f *DBStoreGetUploadByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Upload, bool, error))](#DBStoreGetUploadByIDFunc.PushHook)
        * [func (f *DBStoreGetUploadByIDFunc) PushReturn(r0 dbstore.Upload, r1 bool, r2 error)](#DBStoreGetUploadByIDFunc.PushReturn)
        * [func (f *DBStoreGetUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Upload, bool, error))](#DBStoreGetUploadByIDFunc.SetDefaultHook)
        * [func (f *DBStoreGetUploadByIDFunc) SetDefaultReturn(r0 dbstore.Upload, r1 bool, r2 error)](#DBStoreGetUploadByIDFunc.SetDefaultReturn)
        * [func (f *DBStoreGetUploadByIDFunc) appendCall(r0 DBStoreGetUploadByIDFuncCall)](#DBStoreGetUploadByIDFunc.appendCall)
        * [func (f *DBStoreGetUploadByIDFunc) nextHook() func(context.Context, int) (dbstore.Upload, bool, error)](#DBStoreGetUploadByIDFunc.nextHook)
    * [type DBStoreGetUploadByIDFuncCall struct](#DBStoreGetUploadByIDFuncCall)
        * [func (c DBStoreGetUploadByIDFuncCall) Args() []interface{}](#DBStoreGetUploadByIDFuncCall.Args)
        * [func (c DBStoreGetUploadByIDFuncCall) Results() []interface{}](#DBStoreGetUploadByIDFuncCall.Results)
    * [type DBStoreInsertUploadFunc struct](#DBStoreInsertUploadFunc)
        * [func (f *DBStoreInsertUploadFunc) History() []DBStoreInsertUploadFuncCall](#DBStoreInsertUploadFunc.History)
        * [func (f *DBStoreInsertUploadFunc) PushHook(hook func(context.Context, dbstore.Upload) (int, error))](#DBStoreInsertUploadFunc.PushHook)
        * [func (f *DBStoreInsertUploadFunc) PushReturn(r0 int, r1 error)](#DBStoreInsertUploadFunc.PushReturn)
        * [func (f *DBStoreInsertUploadFunc) SetDefaultHook(hook func(context.Context, dbstore.Upload) (int, error))](#DBStoreInsertUploadFunc.SetDefaultHook)
        * [func (f *DBStoreInsertUploadFunc) SetDefaultReturn(r0 int, r1 error)](#DBStoreInsertUploadFunc.SetDefaultReturn)
        * [func (f *DBStoreInsertUploadFunc) appendCall(r0 DBStoreInsertUploadFuncCall)](#DBStoreInsertUploadFunc.appendCall)
        * [func (f *DBStoreInsertUploadFunc) nextHook() func(context.Context, dbstore.Upload) (int, error)](#DBStoreInsertUploadFunc.nextHook)
    * [type DBStoreInsertUploadFuncCall struct](#DBStoreInsertUploadFuncCall)
        * [func (c DBStoreInsertUploadFuncCall) Args() []interface{}](#DBStoreInsertUploadFuncCall.Args)
        * [func (c DBStoreInsertUploadFuncCall) Results() []interface{}](#DBStoreInsertUploadFuncCall.Results)
    * [type DBStoreMarkFailedFunc struct](#DBStoreMarkFailedFunc)
        * [func (f *DBStoreMarkFailedFunc) History() []DBStoreMarkFailedFuncCall](#DBStoreMarkFailedFunc.History)
        * [func (f *DBStoreMarkFailedFunc) PushHook(hook func(context.Context, int, string) error)](#DBStoreMarkFailedFunc.PushHook)
        * [func (f *DBStoreMarkFailedFunc) PushReturn(r0 error)](#DBStoreMarkFailedFunc.PushReturn)
        * [func (f *DBStoreMarkFailedFunc) SetDefaultHook(hook func(context.Context, int, string) error)](#DBStoreMarkFailedFunc.SetDefaultHook)
        * [func (f *DBStoreMarkFailedFunc) SetDefaultReturn(r0 error)](#DBStoreMarkFailedFunc.SetDefaultReturn)
        * [func (f *DBStoreMarkFailedFunc) appendCall(r0 DBStoreMarkFailedFuncCall)](#DBStoreMarkFailedFunc.appendCall)
        * [func (f *DBStoreMarkFailedFunc) nextHook() func(context.Context, int, string) error](#DBStoreMarkFailedFunc.nextHook)
    * [type DBStoreMarkFailedFuncCall struct](#DBStoreMarkFailedFuncCall)
        * [func (c DBStoreMarkFailedFuncCall) Args() []interface{}](#DBStoreMarkFailedFuncCall.Args)
        * [func (c DBStoreMarkFailedFuncCall) Results() []interface{}](#DBStoreMarkFailedFuncCall.Results)
    * [type DBStoreMarkQueuedFunc struct](#DBStoreMarkQueuedFunc)
        * [func (f *DBStoreMarkQueuedFunc) History() []DBStoreMarkQueuedFuncCall](#DBStoreMarkQueuedFunc.History)
        * [func (f *DBStoreMarkQueuedFunc) PushHook(hook func(context.Context, int, *int64) error)](#DBStoreMarkQueuedFunc.PushHook)
        * [func (f *DBStoreMarkQueuedFunc) PushReturn(r0 error)](#DBStoreMarkQueuedFunc.PushReturn)
        * [func (f *DBStoreMarkQueuedFunc) SetDefaultHook(hook func(context.Context, int, *int64) error)](#DBStoreMarkQueuedFunc.SetDefaultHook)
        * [func (f *DBStoreMarkQueuedFunc) SetDefaultReturn(r0 error)](#DBStoreMarkQueuedFunc.SetDefaultReturn)
        * [func (f *DBStoreMarkQueuedFunc) appendCall(r0 DBStoreMarkQueuedFuncCall)](#DBStoreMarkQueuedFunc.appendCall)
        * [func (f *DBStoreMarkQueuedFunc) nextHook() func(context.Context, int, *int64) error](#DBStoreMarkQueuedFunc.nextHook)
    * [type DBStoreMarkQueuedFuncCall struct](#DBStoreMarkQueuedFuncCall)
        * [func (c DBStoreMarkQueuedFuncCall) Args() []interface{}](#DBStoreMarkQueuedFuncCall.Args)
        * [func (c DBStoreMarkQueuedFuncCall) Results() []interface{}](#DBStoreMarkQueuedFuncCall.Results)
    * [type DBStoreShim struct](#DBStoreShim)
        * [func (s *DBStoreShim) Transact(ctx context.Context) (DBStore, error)](#DBStoreShim.Transact)
    * [type DBStoreTransactFunc struct](#DBStoreTransactFunc)
        * [func (f *DBStoreTransactFunc) History() []DBStoreTransactFuncCall](#DBStoreTransactFunc.History)
        * [func (f *DBStoreTransactFunc) PushHook(hook func(context.Context) (DBStore, error))](#DBStoreTransactFunc.PushHook)
        * [func (f *DBStoreTransactFunc) PushReturn(r0 DBStore, r1 error)](#DBStoreTransactFunc.PushReturn)
        * [func (f *DBStoreTransactFunc) SetDefaultHook(hook func(context.Context) (DBStore, error))](#DBStoreTransactFunc.SetDefaultHook)
        * [func (f *DBStoreTransactFunc) SetDefaultReturn(r0 DBStore, r1 error)](#DBStoreTransactFunc.SetDefaultReturn)
        * [func (f *DBStoreTransactFunc) appendCall(r0 DBStoreTransactFuncCall)](#DBStoreTransactFunc.appendCall)
        * [func (f *DBStoreTransactFunc) nextHook() func(context.Context) (DBStore, error)](#DBStoreTransactFunc.nextHook)
    * [type DBStoreTransactFuncCall struct](#DBStoreTransactFuncCall)
        * [func (c DBStoreTransactFuncCall) Args() []interface{}](#DBStoreTransactFuncCall.Args)
        * [func (c DBStoreTransactFuncCall) Results() []interface{}](#DBStoreTransactFuncCall.Results)
    * [type MockDBStore struct](#MockDBStore)
        * [func NewMockDBStore() *MockDBStore](#NewMockDBStore)
        * [func NewMockDBStoreFrom(i DBStore) *MockDBStore](#NewMockDBStoreFrom)
        * [func (m *MockDBStore) AddUploadPart(v0 context.Context, v1 int, v2 int) error](#MockDBStore.AddUploadPart)
        * [func (m *MockDBStore) Done(v0 error) error](#MockDBStore.Done)
        * [func (m *MockDBStore) GetUploadByID(v0 context.Context, v1 int) (dbstore.Upload, bool, error)](#MockDBStore.GetUploadByID)
        * [func (m *MockDBStore) InsertUpload(v0 context.Context, v1 dbstore.Upload) (int, error)](#MockDBStore.InsertUpload)
        * [func (m *MockDBStore) MarkFailed(v0 context.Context, v1 int, v2 string) error](#MockDBStore.MarkFailed)
        * [func (m *MockDBStore) MarkQueued(v0 context.Context, v1 int, v2 *int64) error](#MockDBStore.MarkQueued)
        * [func (m *MockDBStore) Transact(v0 context.Context) (DBStore, error)](#MockDBStore.Transact)
    * [type UploadArgs struct](#UploadArgs)
    * [type UploadHandler struct](#UploadHandler)
        * [func (h *UploadHandler) handleEnqueue(w http.ResponseWriter, r *http.Request)](#UploadHandler.handleEnqueue)
        * [func (h *UploadHandler) handleEnqueueErr(w http.ResponseWriter, r *http.Request, repositoryID int) (interface{}, error)](#UploadHandler.handleEnqueueErr)
        * [func (h *UploadHandler) handleEnqueueMultipartFinalize(r *http.Request, upload store.Upload) (interface{}, error)](#UploadHandler.handleEnqueueMultipartFinalize)
        * [func (h *UploadHandler) handleEnqueueMultipartSetup(r *http.Request, uploadArgs UploadArgs, numParts int) (interface{}, error)](#UploadHandler.handleEnqueueMultipartSetup)
        * [func (h *UploadHandler) handleEnqueueMultipartUpload(r *http.Request, upload store.Upload, partIndex int) (interface{}, error)](#UploadHandler.handleEnqueueMultipartUpload)
        * [func (h *UploadHandler) handleEnqueueSinglePayload(r *http.Request, uploadArgs UploadArgs) (interface{}, error)](#UploadHandler.handleEnqueueSinglePayload)
        * [func (h *UploadHandler) markUploadAsFailed(ctx context.Context, tx DBStore, uploadID int, err error)](#UploadHandler.markUploadAsFailed)
    * [type enqueuePayload struct](#enqueuePayload)
* [Functions](#func)
    * [func NewUploadHandler(dbStore DBStore, uploadStore uploadstore.Store, internal bool) http.Handler](#NewUploadHandler)
    * [func TestHandleEnqueueMultipartFinalize(t *testing.T)](#TestHandleEnqueueMultipartFinalize)
    * [func TestHandleEnqueueMultipartFinalizeIncompleteUpload(t *testing.T)](#TestHandleEnqueueMultipartFinalizeIncompleteUpload)
    * [func TestHandleEnqueueMultipartSetup(t *testing.T)](#TestHandleEnqueueMultipartSetup)
    * [func TestHandleEnqueueMultipartUpload(t *testing.T)](#TestHandleEnqueueMultipartUpload)
    * [func TestHandleEnqueueSinglePayload(t *testing.T)](#TestHandleEnqueueSinglePayload)
    * [func TestHandleEnqueueSinglePayloadNoIndexerName(t *testing.T)](#TestHandleEnqueueSinglePayloadNoIndexerName)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func clientError(message string, vals ...interface{}) error](#clientError)
    * [func copyAll(w http.ResponseWriter, r io.Reader)](#copyAll)
    * [func enforceAuth(ctx context.Context, w http.ResponseWriter, r *http.Request, repoName string) bool](#enforceAuth)
    * [func enforceAuthGithub(ctx context.Context, w http.ResponseWriter, r *http.Request, repoName string) (int, error)](#enforceAuthGithub)
    * [func ensureRepoAndCommitExist(ctx context.Context, w http.ResponseWriter, repoName, commit string) (*types.Repo, bool)](#ensureRepoAndCommitExist)
    * [func formatAWSError(err error) string](#formatAWSError)
    * [func getQuery(r *http.Request, name string) string](#getQuery)
    * [func getQueryInt(r *http.Request, name string) int](#getQueryInt)
    * [func hasQuery(r *http.Request, name string) bool](#hasQuery)
    * [func inferIndexer(r *http.Request) (string, error)](#inferIndexer)
    * [func isSiteAdmin(ctx context.Context) bool](#isSiteAdmin)
    * [func sanitizeRoot(s string) string](#sanitizeRoot)
    * [func setupRepoMocks(t testing.TB)](#setupRepoMocks)
    * [func writeJSON(w http.ResponseWriter, payload interface{})](#writeJSON)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="testCommit" href="#testCommit">const testCommit</a>

```
searchKey: httpapi.testCommit
tags: [constant string private]
```

```Go
const testCommit = "deadbeef01deadbeef02deadbeef03deadbeef04"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="githubURL" href="#githubURL">var githubURL</a>

```
searchKey: httpapi.githubURL
tags: [variable struct private]
```

```Go
var githubURL = url.URL{Scheme: "https", Host: "api.github.com"}
```

### <a id="revhashPattern" href="#revhashPattern">var revhashPattern</a>

```
searchKey: httpapi.revhashPattern
tags: [variable struct private]
```

```Go
var revhashPattern = lazyregexp.New(`^[a-z0-9]{40}$`)
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="ClientError" href="#ClientError">type ClientError struct</a>

```
searchKey: httpapi.ClientError
tags: [struct]
```

```Go
type ClientError struct {
	err error
}
```

#### <a id="ClientError.Error" href="#ClientError.Error">func (e *ClientError) Error() string</a>

```
searchKey: httpapi.ClientError.Error
tags: [method]
```

```Go
func (e *ClientError) Error() string
```

### <a id="DBStore" href="#DBStore">type DBStore interface</a>

```
searchKey: httpapi.DBStore
tags: [interface]
```

```Go
type DBStore interface {
	Transact(ctx context.Context) (DBStore, error)
	Done(err error) error

	GetUploadByID(ctx context.Context, uploadID int) (dbstore.Upload, bool, error)
	InsertUpload(ctx context.Context, upload dbstore.Upload) (int, error)
	AddUploadPart(ctx context.Context, uploadID, partIndex int) error
	MarkQueued(ctx context.Context, id int, uploadSize *int64) error
	MarkFailed(ctx context.Context, id int, reason string) error
}
```

### <a id="DBStoreAddUploadPartFunc" href="#DBStoreAddUploadPartFunc">type DBStoreAddUploadPartFunc struct</a>

```
searchKey: httpapi.DBStoreAddUploadPartFunc
tags: [struct private]
```

```Go
type DBStoreAddUploadPartFunc struct {
	defaultHook func(context.Context, int, int) error
	hooks       []func(context.Context, int, int) error
	history     []DBStoreAddUploadPartFuncCall
	mutex       sync.Mutex
}
```

DBStoreAddUploadPartFunc describes the behavior when the AddUploadPart method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreAddUploadPartFunc.History" href="#DBStoreAddUploadPartFunc.History">func (f *DBStoreAddUploadPartFunc) History() []DBStoreAddUploadPartFuncCall</a>

```
searchKey: httpapi.DBStoreAddUploadPartFunc.History
tags: [method private]
```

```Go
func (f *DBStoreAddUploadPartFunc) History() []DBStoreAddUploadPartFuncCall
```

History returns a sequence of DBStoreAddUploadPartFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreAddUploadPartFunc.PushHook" href="#DBStoreAddUploadPartFunc.PushHook">func (f *DBStoreAddUploadPartFunc) PushHook(hook func(context.Context, int, int) error)</a>

```
searchKey: httpapi.DBStoreAddUploadPartFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreAddUploadPartFunc) PushHook(hook func(context.Context, int, int) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the AddUploadPart method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreAddUploadPartFunc.PushReturn" href="#DBStoreAddUploadPartFunc.PushReturn">func (f *DBStoreAddUploadPartFunc) PushReturn(r0 error)</a>

```
searchKey: httpapi.DBStoreAddUploadPartFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreAddUploadPartFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreAddUploadPartFunc.SetDefaultHook" href="#DBStoreAddUploadPartFunc.SetDefaultHook">func (f *DBStoreAddUploadPartFunc) SetDefaultHook(hook func(context.Context, int, int) error)</a>

```
searchKey: httpapi.DBStoreAddUploadPartFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreAddUploadPartFunc) SetDefaultHook(hook func(context.Context, int, int) error)
```

SetDefaultHook sets function that is called when the AddUploadPart method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreAddUploadPartFunc.SetDefaultReturn" href="#DBStoreAddUploadPartFunc.SetDefaultReturn">func (f *DBStoreAddUploadPartFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: httpapi.DBStoreAddUploadPartFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreAddUploadPartFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreAddUploadPartFunc.appendCall" href="#DBStoreAddUploadPartFunc.appendCall">func (f *DBStoreAddUploadPartFunc) appendCall(r0 DBStoreAddUploadPartFuncCall)</a>

```
searchKey: httpapi.DBStoreAddUploadPartFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreAddUploadPartFunc) appendCall(r0 DBStoreAddUploadPartFuncCall)
```

#### <a id="DBStoreAddUploadPartFunc.nextHook" href="#DBStoreAddUploadPartFunc.nextHook">func (f *DBStoreAddUploadPartFunc) nextHook() func(context.Context, int, int) error</a>

```
searchKey: httpapi.DBStoreAddUploadPartFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreAddUploadPartFunc) nextHook() func(context.Context, int, int) error
```

### <a id="DBStoreAddUploadPartFuncCall" href="#DBStoreAddUploadPartFuncCall">type DBStoreAddUploadPartFuncCall struct</a>

```
searchKey: httpapi.DBStoreAddUploadPartFuncCall
tags: [struct private]
```

```Go
type DBStoreAddUploadPartFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

DBStoreAddUploadPartFuncCall is an object that describes an invocation of method AddUploadPart on an instance of MockDBStore. 

#### <a id="DBStoreAddUploadPartFuncCall.Args" href="#DBStoreAddUploadPartFuncCall.Args">func (c DBStoreAddUploadPartFuncCall) Args() []interface{}</a>

```
searchKey: httpapi.DBStoreAddUploadPartFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreAddUploadPartFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreAddUploadPartFuncCall.Results" href="#DBStoreAddUploadPartFuncCall.Results">func (c DBStoreAddUploadPartFuncCall) Results() []interface{}</a>

```
searchKey: httpapi.DBStoreAddUploadPartFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreAddUploadPartFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreDoneFunc" href="#DBStoreDoneFunc">type DBStoreDoneFunc struct</a>

```
searchKey: httpapi.DBStoreDoneFunc
tags: [struct private]
```

```Go
type DBStoreDoneFunc struct {
	defaultHook func(error) error
	hooks       []func(error) error
	history     []DBStoreDoneFuncCall
	mutex       sync.Mutex
}
```

DBStoreDoneFunc describes the behavior when the Done method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreDoneFunc.History" href="#DBStoreDoneFunc.History">func (f *DBStoreDoneFunc) History() []DBStoreDoneFuncCall</a>

```
searchKey: httpapi.DBStoreDoneFunc.History
tags: [method private]
```

```Go
func (f *DBStoreDoneFunc) History() []DBStoreDoneFuncCall
```

History returns a sequence of DBStoreDoneFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreDoneFunc.PushHook" href="#DBStoreDoneFunc.PushHook">func (f *DBStoreDoneFunc) PushHook(hook func(error) error)</a>

```
searchKey: httpapi.DBStoreDoneFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreDoneFunc) PushHook(hook func(error) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Done method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreDoneFunc.PushReturn" href="#DBStoreDoneFunc.PushReturn">func (f *DBStoreDoneFunc) PushReturn(r0 error)</a>

```
searchKey: httpapi.DBStoreDoneFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreDoneFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDoneFunc.SetDefaultHook" href="#DBStoreDoneFunc.SetDefaultHook">func (f *DBStoreDoneFunc) SetDefaultHook(hook func(error) error)</a>

```
searchKey: httpapi.DBStoreDoneFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreDoneFunc) SetDefaultHook(hook func(error) error)
```

SetDefaultHook sets function that is called when the Done method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreDoneFunc.SetDefaultReturn" href="#DBStoreDoneFunc.SetDefaultReturn">func (f *DBStoreDoneFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: httpapi.DBStoreDoneFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreDoneFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDoneFunc.appendCall" href="#DBStoreDoneFunc.appendCall">func (f *DBStoreDoneFunc) appendCall(r0 DBStoreDoneFuncCall)</a>

```
searchKey: httpapi.DBStoreDoneFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreDoneFunc) appendCall(r0 DBStoreDoneFuncCall)
```

#### <a id="DBStoreDoneFunc.nextHook" href="#DBStoreDoneFunc.nextHook">func (f *DBStoreDoneFunc) nextHook() func(error) error</a>

```
searchKey: httpapi.DBStoreDoneFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreDoneFunc) nextHook() func(error) error
```

### <a id="DBStoreDoneFuncCall" href="#DBStoreDoneFuncCall">type DBStoreDoneFuncCall struct</a>

```
searchKey: httpapi.DBStoreDoneFuncCall
tags: [struct private]
```

```Go
type DBStoreDoneFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 error
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

DBStoreDoneFuncCall is an object that describes an invocation of method Done on an instance of MockDBStore. 

#### <a id="DBStoreDoneFuncCall.Args" href="#DBStoreDoneFuncCall.Args">func (c DBStoreDoneFuncCall) Args() []interface{}</a>

```
searchKey: httpapi.DBStoreDoneFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreDoneFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreDoneFuncCall.Results" href="#DBStoreDoneFuncCall.Results">func (c DBStoreDoneFuncCall) Results() []interface{}</a>

```
searchKey: httpapi.DBStoreDoneFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreDoneFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetUploadByIDFunc" href="#DBStoreGetUploadByIDFunc">type DBStoreGetUploadByIDFunc struct</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFunc
tags: [struct private]
```

```Go
type DBStoreGetUploadByIDFunc struct {
	defaultHook func(context.Context, int) (dbstore.Upload, bool, error)
	hooks       []func(context.Context, int) (dbstore.Upload, bool, error)
	history     []DBStoreGetUploadByIDFuncCall
	mutex       sync.Mutex
}
```

DBStoreGetUploadByIDFunc describes the behavior when the GetUploadByID method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreGetUploadByIDFunc.History" href="#DBStoreGetUploadByIDFunc.History">func (f *DBStoreGetUploadByIDFunc) History() []DBStoreGetUploadByIDFuncCall</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFunc.History
tags: [method private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) History() []DBStoreGetUploadByIDFuncCall
```

History returns a sequence of DBStoreGetUploadByIDFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreGetUploadByIDFunc.PushHook" href="#DBStoreGetUploadByIDFunc.PushHook">func (f *DBStoreGetUploadByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Upload, bool, error))</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Upload, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetUploadByID method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetUploadByIDFunc.PushReturn" href="#DBStoreGetUploadByIDFunc.PushReturn">func (f *DBStoreGetUploadByIDFunc) PushReturn(r0 dbstore.Upload, r1 bool, r2 error)</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) PushReturn(r0 dbstore.Upload, r1 bool, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetUploadByIDFunc.SetDefaultHook" href="#DBStoreGetUploadByIDFunc.SetDefaultHook">func (f *DBStoreGetUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Upload, bool, error))</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Upload, bool, error))
```

SetDefaultHook sets function that is called when the GetUploadByID method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetUploadByIDFunc.SetDefaultReturn" href="#DBStoreGetUploadByIDFunc.SetDefaultReturn">func (f *DBStoreGetUploadByIDFunc) SetDefaultReturn(r0 dbstore.Upload, r1 bool, r2 error)</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) SetDefaultReturn(r0 dbstore.Upload, r1 bool, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetUploadByIDFunc.appendCall" href="#DBStoreGetUploadByIDFunc.appendCall">func (f *DBStoreGetUploadByIDFunc) appendCall(r0 DBStoreGetUploadByIDFuncCall)</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) appendCall(r0 DBStoreGetUploadByIDFuncCall)
```

#### <a id="DBStoreGetUploadByIDFunc.nextHook" href="#DBStoreGetUploadByIDFunc.nextHook">func (f *DBStoreGetUploadByIDFunc) nextHook() func(context.Context, int) (dbstore.Upload, bool, error)</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreGetUploadByIDFunc) nextHook() func(context.Context, int) (dbstore.Upload, bool, error)
```

### <a id="DBStoreGetUploadByIDFuncCall" href="#DBStoreGetUploadByIDFuncCall">type DBStoreGetUploadByIDFuncCall struct</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFuncCall
tags: [struct private]
```

```Go
type DBStoreGetUploadByIDFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 dbstore.Upload
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 bool
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

DBStoreGetUploadByIDFuncCall is an object that describes an invocation of method GetUploadByID on an instance of MockDBStore. 

#### <a id="DBStoreGetUploadByIDFuncCall.Args" href="#DBStoreGetUploadByIDFuncCall.Args">func (c DBStoreGetUploadByIDFuncCall) Args() []interface{}</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreGetUploadByIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreGetUploadByIDFuncCall.Results" href="#DBStoreGetUploadByIDFuncCall.Results">func (c DBStoreGetUploadByIDFuncCall) Results() []interface{}</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreGetUploadByIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreInsertUploadFunc" href="#DBStoreInsertUploadFunc">type DBStoreInsertUploadFunc struct</a>

```
searchKey: httpapi.DBStoreInsertUploadFunc
tags: [struct private]
```

```Go
type DBStoreInsertUploadFunc struct {
	defaultHook func(context.Context, dbstore.Upload) (int, error)
	hooks       []func(context.Context, dbstore.Upload) (int, error)
	history     []DBStoreInsertUploadFuncCall
	mutex       sync.Mutex
}
```

DBStoreInsertUploadFunc describes the behavior when the InsertUpload method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreInsertUploadFunc.History" href="#DBStoreInsertUploadFunc.History">func (f *DBStoreInsertUploadFunc) History() []DBStoreInsertUploadFuncCall</a>

```
searchKey: httpapi.DBStoreInsertUploadFunc.History
tags: [method private]
```

```Go
func (f *DBStoreInsertUploadFunc) History() []DBStoreInsertUploadFuncCall
```

History returns a sequence of DBStoreInsertUploadFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreInsertUploadFunc.PushHook" href="#DBStoreInsertUploadFunc.PushHook">func (f *DBStoreInsertUploadFunc) PushHook(hook func(context.Context, dbstore.Upload) (int, error))</a>

```
searchKey: httpapi.DBStoreInsertUploadFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreInsertUploadFunc) PushHook(hook func(context.Context, dbstore.Upload) (int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the InsertUpload method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreInsertUploadFunc.PushReturn" href="#DBStoreInsertUploadFunc.PushReturn">func (f *DBStoreInsertUploadFunc) PushReturn(r0 int, r1 error)</a>

```
searchKey: httpapi.DBStoreInsertUploadFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreInsertUploadFunc) PushReturn(r0 int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreInsertUploadFunc.SetDefaultHook" href="#DBStoreInsertUploadFunc.SetDefaultHook">func (f *DBStoreInsertUploadFunc) SetDefaultHook(hook func(context.Context, dbstore.Upload) (int, error))</a>

```
searchKey: httpapi.DBStoreInsertUploadFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreInsertUploadFunc) SetDefaultHook(hook func(context.Context, dbstore.Upload) (int, error))
```

SetDefaultHook sets function that is called when the InsertUpload method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreInsertUploadFunc.SetDefaultReturn" href="#DBStoreInsertUploadFunc.SetDefaultReturn">func (f *DBStoreInsertUploadFunc) SetDefaultReturn(r0 int, r1 error)</a>

```
searchKey: httpapi.DBStoreInsertUploadFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreInsertUploadFunc) SetDefaultReturn(r0 int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreInsertUploadFunc.appendCall" href="#DBStoreInsertUploadFunc.appendCall">func (f *DBStoreInsertUploadFunc) appendCall(r0 DBStoreInsertUploadFuncCall)</a>

```
searchKey: httpapi.DBStoreInsertUploadFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreInsertUploadFunc) appendCall(r0 DBStoreInsertUploadFuncCall)
```

#### <a id="DBStoreInsertUploadFunc.nextHook" href="#DBStoreInsertUploadFunc.nextHook">func (f *DBStoreInsertUploadFunc) nextHook() func(context.Context, dbstore.Upload) (int, error)</a>

```
searchKey: httpapi.DBStoreInsertUploadFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreInsertUploadFunc) nextHook() func(context.Context, dbstore.Upload) (int, error)
```

### <a id="DBStoreInsertUploadFuncCall" href="#DBStoreInsertUploadFuncCall">type DBStoreInsertUploadFuncCall struct</a>

```
searchKey: httpapi.DBStoreInsertUploadFuncCall
tags: [struct private]
```

```Go
type DBStoreInsertUploadFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 dbstore.Upload
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 int
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreInsertUploadFuncCall is an object that describes an invocation of method InsertUpload on an instance of MockDBStore. 

#### <a id="DBStoreInsertUploadFuncCall.Args" href="#DBStoreInsertUploadFuncCall.Args">func (c DBStoreInsertUploadFuncCall) Args() []interface{}</a>

```
searchKey: httpapi.DBStoreInsertUploadFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreInsertUploadFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreInsertUploadFuncCall.Results" href="#DBStoreInsertUploadFuncCall.Results">func (c DBStoreInsertUploadFuncCall) Results() []interface{}</a>

```
searchKey: httpapi.DBStoreInsertUploadFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreInsertUploadFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreMarkFailedFunc" href="#DBStoreMarkFailedFunc">type DBStoreMarkFailedFunc struct</a>

```
searchKey: httpapi.DBStoreMarkFailedFunc
tags: [struct private]
```

```Go
type DBStoreMarkFailedFunc struct {
	defaultHook func(context.Context, int, string) error
	hooks       []func(context.Context, int, string) error
	history     []DBStoreMarkFailedFuncCall
	mutex       sync.Mutex
}
```

DBStoreMarkFailedFunc describes the behavior when the MarkFailed method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreMarkFailedFunc.History" href="#DBStoreMarkFailedFunc.History">func (f *DBStoreMarkFailedFunc) History() []DBStoreMarkFailedFuncCall</a>

```
searchKey: httpapi.DBStoreMarkFailedFunc.History
tags: [method private]
```

```Go
func (f *DBStoreMarkFailedFunc) History() []DBStoreMarkFailedFuncCall
```

History returns a sequence of DBStoreMarkFailedFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreMarkFailedFunc.PushHook" href="#DBStoreMarkFailedFunc.PushHook">func (f *DBStoreMarkFailedFunc) PushHook(hook func(context.Context, int, string) error)</a>

```
searchKey: httpapi.DBStoreMarkFailedFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreMarkFailedFunc) PushHook(hook func(context.Context, int, string) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkFailed method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreMarkFailedFunc.PushReturn" href="#DBStoreMarkFailedFunc.PushReturn">func (f *DBStoreMarkFailedFunc) PushReturn(r0 error)</a>

```
searchKey: httpapi.DBStoreMarkFailedFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreMarkFailedFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreMarkFailedFunc.SetDefaultHook" href="#DBStoreMarkFailedFunc.SetDefaultHook">func (f *DBStoreMarkFailedFunc) SetDefaultHook(hook func(context.Context, int, string) error)</a>

```
searchKey: httpapi.DBStoreMarkFailedFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreMarkFailedFunc) SetDefaultHook(hook func(context.Context, int, string) error)
```

SetDefaultHook sets function that is called when the MarkFailed method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreMarkFailedFunc.SetDefaultReturn" href="#DBStoreMarkFailedFunc.SetDefaultReturn">func (f *DBStoreMarkFailedFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: httpapi.DBStoreMarkFailedFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreMarkFailedFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreMarkFailedFunc.appendCall" href="#DBStoreMarkFailedFunc.appendCall">func (f *DBStoreMarkFailedFunc) appendCall(r0 DBStoreMarkFailedFuncCall)</a>

```
searchKey: httpapi.DBStoreMarkFailedFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreMarkFailedFunc) appendCall(r0 DBStoreMarkFailedFuncCall)
```

#### <a id="DBStoreMarkFailedFunc.nextHook" href="#DBStoreMarkFailedFunc.nextHook">func (f *DBStoreMarkFailedFunc) nextHook() func(context.Context, int, string) error</a>

```
searchKey: httpapi.DBStoreMarkFailedFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreMarkFailedFunc) nextHook() func(context.Context, int, string) error
```

### <a id="DBStoreMarkFailedFuncCall" href="#DBStoreMarkFailedFuncCall">type DBStoreMarkFailedFuncCall struct</a>

```
searchKey: httpapi.DBStoreMarkFailedFuncCall
tags: [struct private]
```

```Go
type DBStoreMarkFailedFuncCall struct {
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
	Result0 error
}
```

DBStoreMarkFailedFuncCall is an object that describes an invocation of method MarkFailed on an instance of MockDBStore. 

#### <a id="DBStoreMarkFailedFuncCall.Args" href="#DBStoreMarkFailedFuncCall.Args">func (c DBStoreMarkFailedFuncCall) Args() []interface{}</a>

```
searchKey: httpapi.DBStoreMarkFailedFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreMarkFailedFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreMarkFailedFuncCall.Results" href="#DBStoreMarkFailedFuncCall.Results">func (c DBStoreMarkFailedFuncCall) Results() []interface{}</a>

```
searchKey: httpapi.DBStoreMarkFailedFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreMarkFailedFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreMarkQueuedFunc" href="#DBStoreMarkQueuedFunc">type DBStoreMarkQueuedFunc struct</a>

```
searchKey: httpapi.DBStoreMarkQueuedFunc
tags: [struct private]
```

```Go
type DBStoreMarkQueuedFunc struct {
	defaultHook func(context.Context, int, *int64) error
	hooks       []func(context.Context, int, *int64) error
	history     []DBStoreMarkQueuedFuncCall
	mutex       sync.Mutex
}
```

DBStoreMarkQueuedFunc describes the behavior when the MarkQueued method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreMarkQueuedFunc.History" href="#DBStoreMarkQueuedFunc.History">func (f *DBStoreMarkQueuedFunc) History() []DBStoreMarkQueuedFuncCall</a>

```
searchKey: httpapi.DBStoreMarkQueuedFunc.History
tags: [method private]
```

```Go
func (f *DBStoreMarkQueuedFunc) History() []DBStoreMarkQueuedFuncCall
```

History returns a sequence of DBStoreMarkQueuedFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreMarkQueuedFunc.PushHook" href="#DBStoreMarkQueuedFunc.PushHook">func (f *DBStoreMarkQueuedFunc) PushHook(hook func(context.Context, int, *int64) error)</a>

```
searchKey: httpapi.DBStoreMarkQueuedFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreMarkQueuedFunc) PushHook(hook func(context.Context, int, *int64) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkQueued method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreMarkQueuedFunc.PushReturn" href="#DBStoreMarkQueuedFunc.PushReturn">func (f *DBStoreMarkQueuedFunc) PushReturn(r0 error)</a>

```
searchKey: httpapi.DBStoreMarkQueuedFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreMarkQueuedFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreMarkQueuedFunc.SetDefaultHook" href="#DBStoreMarkQueuedFunc.SetDefaultHook">func (f *DBStoreMarkQueuedFunc) SetDefaultHook(hook func(context.Context, int, *int64) error)</a>

```
searchKey: httpapi.DBStoreMarkQueuedFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreMarkQueuedFunc) SetDefaultHook(hook func(context.Context, int, *int64) error)
```

SetDefaultHook sets function that is called when the MarkQueued method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreMarkQueuedFunc.SetDefaultReturn" href="#DBStoreMarkQueuedFunc.SetDefaultReturn">func (f *DBStoreMarkQueuedFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: httpapi.DBStoreMarkQueuedFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreMarkQueuedFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreMarkQueuedFunc.appendCall" href="#DBStoreMarkQueuedFunc.appendCall">func (f *DBStoreMarkQueuedFunc) appendCall(r0 DBStoreMarkQueuedFuncCall)</a>

```
searchKey: httpapi.DBStoreMarkQueuedFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreMarkQueuedFunc) appendCall(r0 DBStoreMarkQueuedFuncCall)
```

#### <a id="DBStoreMarkQueuedFunc.nextHook" href="#DBStoreMarkQueuedFunc.nextHook">func (f *DBStoreMarkQueuedFunc) nextHook() func(context.Context, int, *int64) error</a>

```
searchKey: httpapi.DBStoreMarkQueuedFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreMarkQueuedFunc) nextHook() func(context.Context, int, *int64) error
```

### <a id="DBStoreMarkQueuedFuncCall" href="#DBStoreMarkQueuedFuncCall">type DBStoreMarkQueuedFuncCall struct</a>

```
searchKey: httpapi.DBStoreMarkQueuedFuncCall
tags: [struct private]
```

```Go
type DBStoreMarkQueuedFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 *int64
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

DBStoreMarkQueuedFuncCall is an object that describes an invocation of method MarkQueued on an instance of MockDBStore. 

#### <a id="DBStoreMarkQueuedFuncCall.Args" href="#DBStoreMarkQueuedFuncCall.Args">func (c DBStoreMarkQueuedFuncCall) Args() []interface{}</a>

```
searchKey: httpapi.DBStoreMarkQueuedFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreMarkQueuedFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreMarkQueuedFuncCall.Results" href="#DBStoreMarkQueuedFuncCall.Results">func (c DBStoreMarkQueuedFuncCall) Results() []interface{}</a>

```
searchKey: httpapi.DBStoreMarkQueuedFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreMarkQueuedFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreShim" href="#DBStoreShim">type DBStoreShim struct</a>

```
searchKey: httpapi.DBStoreShim
tags: [struct]
```

```Go
type DBStoreShim struct {
	*dbstore.Store
}
```

#### <a id="DBStoreShim.Transact" href="#DBStoreShim.Transact">func (s *DBStoreShim) Transact(ctx context.Context) (DBStore, error)</a>

```
searchKey: httpapi.DBStoreShim.Transact
tags: [method]
```

```Go
func (s *DBStoreShim) Transact(ctx context.Context) (DBStore, error)
```

### <a id="DBStoreTransactFunc" href="#DBStoreTransactFunc">type DBStoreTransactFunc struct</a>

```
searchKey: httpapi.DBStoreTransactFunc
tags: [struct private]
```

```Go
type DBStoreTransactFunc struct {
	defaultHook func(context.Context) (DBStore, error)
	hooks       []func(context.Context) (DBStore, error)
	history     []DBStoreTransactFuncCall
	mutex       sync.Mutex
}
```

DBStoreTransactFunc describes the behavior when the Transact method of the parent MockDBStore instance is invoked. 

#### <a id="DBStoreTransactFunc.History" href="#DBStoreTransactFunc.History">func (f *DBStoreTransactFunc) History() []DBStoreTransactFuncCall</a>

```
searchKey: httpapi.DBStoreTransactFunc.History
tags: [method private]
```

```Go
func (f *DBStoreTransactFunc) History() []DBStoreTransactFuncCall
```

History returns a sequence of DBStoreTransactFuncCall objects describing the invocations of this function. 

#### <a id="DBStoreTransactFunc.PushHook" href="#DBStoreTransactFunc.PushHook">func (f *DBStoreTransactFunc) PushHook(hook func(context.Context) (DBStore, error))</a>

```
searchKey: httpapi.DBStoreTransactFunc.PushHook
tags: [method private]
```

```Go
func (f *DBStoreTransactFunc) PushHook(hook func(context.Context) (DBStore, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Transact method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreTransactFunc.PushReturn" href="#DBStoreTransactFunc.PushReturn">func (f *DBStoreTransactFunc) PushReturn(r0 DBStore, r1 error)</a>

```
searchKey: httpapi.DBStoreTransactFunc.PushReturn
tags: [method private]
```

```Go
func (f *DBStoreTransactFunc) PushReturn(r0 DBStore, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreTransactFunc.SetDefaultHook" href="#DBStoreTransactFunc.SetDefaultHook">func (f *DBStoreTransactFunc) SetDefaultHook(hook func(context.Context) (DBStore, error))</a>

```
searchKey: httpapi.DBStoreTransactFunc.SetDefaultHook
tags: [method private]
```

```Go
func (f *DBStoreTransactFunc) SetDefaultHook(hook func(context.Context) (DBStore, error))
```

SetDefaultHook sets function that is called when the Transact method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreTransactFunc.SetDefaultReturn" href="#DBStoreTransactFunc.SetDefaultReturn">func (f *DBStoreTransactFunc) SetDefaultReturn(r0 DBStore, r1 error)</a>

```
searchKey: httpapi.DBStoreTransactFunc.SetDefaultReturn
tags: [method private]
```

```Go
func (f *DBStoreTransactFunc) SetDefaultReturn(r0 DBStore, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreTransactFunc.appendCall" href="#DBStoreTransactFunc.appendCall">func (f *DBStoreTransactFunc) appendCall(r0 DBStoreTransactFuncCall)</a>

```
searchKey: httpapi.DBStoreTransactFunc.appendCall
tags: [method private]
```

```Go
func (f *DBStoreTransactFunc) appendCall(r0 DBStoreTransactFuncCall)
```

#### <a id="DBStoreTransactFunc.nextHook" href="#DBStoreTransactFunc.nextHook">func (f *DBStoreTransactFunc) nextHook() func(context.Context) (DBStore, error)</a>

```
searchKey: httpapi.DBStoreTransactFunc.nextHook
tags: [method private]
```

```Go
func (f *DBStoreTransactFunc) nextHook() func(context.Context) (DBStore, error)
```

### <a id="DBStoreTransactFuncCall" href="#DBStoreTransactFuncCall">type DBStoreTransactFuncCall struct</a>

```
searchKey: httpapi.DBStoreTransactFuncCall
tags: [struct private]
```

```Go
type DBStoreTransactFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 DBStore
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

DBStoreTransactFuncCall is an object that describes an invocation of method Transact on an instance of MockDBStore. 

#### <a id="DBStoreTransactFuncCall.Args" href="#DBStoreTransactFuncCall.Args">func (c DBStoreTransactFuncCall) Args() []interface{}</a>

```
searchKey: httpapi.DBStoreTransactFuncCall.Args
tags: [method private]
```

```Go
func (c DBStoreTransactFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreTransactFuncCall.Results" href="#DBStoreTransactFuncCall.Results">func (c DBStoreTransactFuncCall) Results() []interface{}</a>

```
searchKey: httpapi.DBStoreTransactFuncCall.Results
tags: [method private]
```

```Go
func (c DBStoreTransactFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockDBStore" href="#MockDBStore">type MockDBStore struct</a>

```
searchKey: httpapi.MockDBStore
tags: [struct private]
```

```Go
type MockDBStore struct {
	// AddUploadPartFunc is an instance of a mock function object
	// controlling the behavior of the method AddUploadPart.
	AddUploadPartFunc *DBStoreAddUploadPartFunc
	// DoneFunc is an instance of a mock function object controlling the
	// behavior of the method Done.
	DoneFunc *DBStoreDoneFunc
	// GetUploadByIDFunc is an instance of a mock function object
	// controlling the behavior of the method GetUploadByID.
	GetUploadByIDFunc *DBStoreGetUploadByIDFunc
	// InsertUploadFunc is an instance of a mock function object controlling
	// the behavior of the method InsertUpload.
	InsertUploadFunc *DBStoreInsertUploadFunc
	// MarkFailedFunc is an instance of a mock function object controlling
	// the behavior of the method MarkFailed.
	MarkFailedFunc *DBStoreMarkFailedFunc
	// MarkQueuedFunc is an instance of a mock function object controlling
	// the behavior of the method MarkQueued.
	MarkQueuedFunc *DBStoreMarkQueuedFunc
	// TransactFunc is an instance of a mock function object controlling the
	// behavior of the method Transact.
	TransactFunc *DBStoreTransactFunc
}
```

MockDBStore is a mock implementation of the DBStore interface (from the package github.com/sourcegraph/sourcegraph/enterprise/cmd/frontend/internal/codeintel/httpapi) used for unit testing. 

#### <a id="NewMockDBStore" href="#NewMockDBStore">func NewMockDBStore() *MockDBStore</a>

```
searchKey: httpapi.NewMockDBStore
tags: [function private]
```

```Go
func NewMockDBStore() *MockDBStore
```

NewMockDBStore creates a new mock of the DBStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockDBStoreFrom" href="#NewMockDBStoreFrom">func NewMockDBStoreFrom(i DBStore) *MockDBStore</a>

```
searchKey: httpapi.NewMockDBStoreFrom
tags: [function private]
```

```Go
func NewMockDBStoreFrom(i DBStore) *MockDBStore
```

NewMockDBStoreFrom creates a new mock of the MockDBStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockDBStore.AddUploadPart" href="#MockDBStore.AddUploadPart">func (m *MockDBStore) AddUploadPart(v0 context.Context, v1 int, v2 int) error</a>

```
searchKey: httpapi.MockDBStore.AddUploadPart
tags: [method private]
```

```Go
func (m *MockDBStore) AddUploadPart(v0 context.Context, v1 int, v2 int) error
```

AddUploadPart delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.Done" href="#MockDBStore.Done">func (m *MockDBStore) Done(v0 error) error</a>

```
searchKey: httpapi.MockDBStore.Done
tags: [method private]
```

```Go
func (m *MockDBStore) Done(v0 error) error
```

Done delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetUploadByID" href="#MockDBStore.GetUploadByID">func (m *MockDBStore) GetUploadByID(v0 context.Context, v1 int) (dbstore.Upload, bool, error)</a>

```
searchKey: httpapi.MockDBStore.GetUploadByID
tags: [method private]
```

```Go
func (m *MockDBStore) GetUploadByID(v0 context.Context, v1 int) (dbstore.Upload, bool, error)
```

GetUploadByID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.InsertUpload" href="#MockDBStore.InsertUpload">func (m *MockDBStore) InsertUpload(v0 context.Context, v1 dbstore.Upload) (int, error)</a>

```
searchKey: httpapi.MockDBStore.InsertUpload
tags: [method private]
```

```Go
func (m *MockDBStore) InsertUpload(v0 context.Context, v1 dbstore.Upload) (int, error)
```

InsertUpload delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.MarkFailed" href="#MockDBStore.MarkFailed">func (m *MockDBStore) MarkFailed(v0 context.Context, v1 int, v2 string) error</a>

```
searchKey: httpapi.MockDBStore.MarkFailed
tags: [method private]
```

```Go
func (m *MockDBStore) MarkFailed(v0 context.Context, v1 int, v2 string) error
```

MarkFailed delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.MarkQueued" href="#MockDBStore.MarkQueued">func (m *MockDBStore) MarkQueued(v0 context.Context, v1 int, v2 *int64) error</a>

```
searchKey: httpapi.MockDBStore.MarkQueued
tags: [method private]
```

```Go
func (m *MockDBStore) MarkQueued(v0 context.Context, v1 int, v2 *int64) error
```

MarkQueued delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.Transact" href="#MockDBStore.Transact">func (m *MockDBStore) Transact(v0 context.Context) (DBStore, error)</a>

```
searchKey: httpapi.MockDBStore.Transact
tags: [method private]
```

```Go
func (m *MockDBStore) Transact(v0 context.Context) (DBStore, error)
```

Transact delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="UploadArgs" href="#UploadArgs">type UploadArgs struct</a>

```
searchKey: httpapi.UploadArgs
tags: [struct]
```

```Go
type UploadArgs struct {
	Commit            string
	Root              string
	RepositoryID      int
	Indexer           string
	AssociatedIndexID int
}
```

UploadArgs are common arguments required to enqueue an upload for both single-payload and multipart uploads. 

### <a id="UploadHandler" href="#UploadHandler">type UploadHandler struct</a>

```
searchKey: httpapi.UploadHandler
tags: [struct]
```

```Go
type UploadHandler struct {
	dbStore     DBStore
	uploadStore uploadstore.Store
	internal    bool
}
```

#### <a id="UploadHandler.handleEnqueue" href="#UploadHandler.handleEnqueue">func (h *UploadHandler) handleEnqueue(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: httpapi.UploadHandler.handleEnqueue
tags: [method private]
```

```Go
func (h *UploadHandler) handleEnqueue(w http.ResponseWriter, r *http.Request)
```

POST /upload 

#### <a id="UploadHandler.handleEnqueueErr" href="#UploadHandler.handleEnqueueErr">func (h *UploadHandler) handleEnqueueErr(w http.ResponseWriter, r *http.Request, repositoryID int) (interface{}, error)</a>

```
searchKey: httpapi.UploadHandler.handleEnqueueErr
tags: [method private]
```

```Go
func (h *UploadHandler) handleEnqueueErr(w http.ResponseWriter, r *http.Request, repositoryID int) (interface{}, error)
```

handleEnqueueErr dispatches to the correct handler function based on query args. Running the `src lsif upload` command will cause one of two sequences of requests to occur. For uploads that are small enough repos (that can be uploaded in one-shot), only one request will be made: 

```
- POST `/upload?repositoryId,commit,root,indexerName`

```
For larger uploads, the requests are broken up into a setup request, a serires of upload requests, and a finalization request: 

```
- POST `/upload?repositoryId,commit,root,indexerName,multiPart=true,numParts={n}`
- POST `/upload?uploadId={id},index={i}`
- POST `/upload?uploadId={id},done=true`

```
See the functions the following functions for details on how each request is handled: 

```
- handleEnqueueSinglePayload
- handleEnqueueMultipartSetup
- handleEnqueueMultipartUpload
- handleEnqueueMultipartFinalize

```
#### <a id="UploadHandler.handleEnqueueMultipartFinalize" href="#UploadHandler.handleEnqueueMultipartFinalize">func (h *UploadHandler) handleEnqueueMultipartFinalize(r *http.Request, upload store.Upload) (interface{}, error)</a>

```
searchKey: httpapi.UploadHandler.handleEnqueueMultipartFinalize
tags: [method private]
```

```Go
func (h *UploadHandler) handleEnqueueMultipartFinalize(r *http.Request, upload store.Upload) (interface{}, error)
```

handleEnqueueMultipartFinalize handles the final request of a multipart upload. This transitions the upload from 'uploading' to 'queued', then instructs the bundle manager to concatenate all of the part files together. 

#### <a id="UploadHandler.handleEnqueueMultipartSetup" href="#UploadHandler.handleEnqueueMultipartSetup">func (h *UploadHandler) handleEnqueueMultipartSetup(r *http.Request, uploadArgs UploadArgs, numParts int) (interface{}, error)</a>

```
searchKey: httpapi.UploadHandler.handleEnqueueMultipartSetup
tags: [method private]
```

```Go
func (h *UploadHandler) handleEnqueueMultipartSetup(r *http.Request, uploadArgs UploadArgs, numParts int) (interface{}, error)
```

handleEnqueueMultipartSetup handles the first request in a multipart upload. This creates a new upload record with state 'uploading' and returns the generated ID to be used in subsequent requests for the same upload. 

#### <a id="UploadHandler.handleEnqueueMultipartUpload" href="#UploadHandler.handleEnqueueMultipartUpload">func (h *UploadHandler) handleEnqueueMultipartUpload(r *http.Request, upload store.Upload, partIndex int) (interface{}, error)</a>

```
searchKey: httpapi.UploadHandler.handleEnqueueMultipartUpload
tags: [method private]
```

```Go
func (h *UploadHandler) handleEnqueueMultipartUpload(r *http.Request, upload store.Upload, partIndex int) (interface{}, error)
```

handleEnqueueMultipartUpload handles a partial upload in a multipart upload. This proxies the data to the bundle manager and marks the part index in the upload record. 

#### <a id="UploadHandler.handleEnqueueSinglePayload" href="#UploadHandler.handleEnqueueSinglePayload">func (h *UploadHandler) handleEnqueueSinglePayload(r *http.Request, uploadArgs UploadArgs) (interface{}, error)</a>

```
searchKey: httpapi.UploadHandler.handleEnqueueSinglePayload
tags: [method private]
```

```Go
func (h *UploadHandler) handleEnqueueSinglePayload(r *http.Request, uploadArgs UploadArgs) (interface{}, error)
```

handleEnqueueSinglePayload handles a non-multipart upload. This creates an upload record with state 'queued', proxies the data to the bundle manager, and returns the generated ID. 

#### <a id="UploadHandler.markUploadAsFailed" href="#UploadHandler.markUploadAsFailed">func (h *UploadHandler) markUploadAsFailed(ctx context.Context, tx DBStore, uploadID int, err error)</a>

```
searchKey: httpapi.UploadHandler.markUploadAsFailed
tags: [method private]
```

```Go
func (h *UploadHandler) markUploadAsFailed(ctx context.Context, tx DBStore, uploadID int, err error)
```

markUploadAsFailed attempts to mark the given upload as failed, extracting a human-meaningful error message from the given error. We assume this method to whenever an error occurs when interacting with the upload store so that the status of the upload is accurately reflected in the UI. 

This method does not return an error as it's best-effort cleanup. If an error occurs when trying to modify the record, it will be logged but will not be directly visible to the user. 

### <a id="enqueuePayload" href="#enqueuePayload">type enqueuePayload struct</a>

```
searchKey: httpapi.enqueuePayload
tags: [struct private]
```

```Go
type enqueuePayload struct {
	ID string `json:"id"`
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="NewUploadHandler" href="#NewUploadHandler">func NewUploadHandler(dbStore DBStore, uploadStore uploadstore.Store, internal bool) http.Handler</a>

```
searchKey: httpapi.NewUploadHandler
tags: [function]
```

```Go
func NewUploadHandler(dbStore DBStore, uploadStore uploadstore.Store, internal bool) http.Handler
```

### <a id="TestHandleEnqueueMultipartFinalize" href="#TestHandleEnqueueMultipartFinalize">func TestHandleEnqueueMultipartFinalize(t *testing.T)</a>

```
searchKey: httpapi.TestHandleEnqueueMultipartFinalize
tags: [function private test]
```

```Go
func TestHandleEnqueueMultipartFinalize(t *testing.T)
```

### <a id="TestHandleEnqueueMultipartFinalizeIncompleteUpload" href="#TestHandleEnqueueMultipartFinalizeIncompleteUpload">func TestHandleEnqueueMultipartFinalizeIncompleteUpload(t *testing.T)</a>

```
searchKey: httpapi.TestHandleEnqueueMultipartFinalizeIncompleteUpload
tags: [function private test]
```

```Go
func TestHandleEnqueueMultipartFinalizeIncompleteUpload(t *testing.T)
```

### <a id="TestHandleEnqueueMultipartSetup" href="#TestHandleEnqueueMultipartSetup">func TestHandleEnqueueMultipartSetup(t *testing.T)</a>

```
searchKey: httpapi.TestHandleEnqueueMultipartSetup
tags: [function private test]
```

```Go
func TestHandleEnqueueMultipartSetup(t *testing.T)
```

### <a id="TestHandleEnqueueMultipartUpload" href="#TestHandleEnqueueMultipartUpload">func TestHandleEnqueueMultipartUpload(t *testing.T)</a>

```
searchKey: httpapi.TestHandleEnqueueMultipartUpload
tags: [function private test]
```

```Go
func TestHandleEnqueueMultipartUpload(t *testing.T)
```

### <a id="TestHandleEnqueueSinglePayload" href="#TestHandleEnqueueSinglePayload">func TestHandleEnqueueSinglePayload(t *testing.T)</a>

```
searchKey: httpapi.TestHandleEnqueueSinglePayload
tags: [function private test]
```

```Go
func TestHandleEnqueueSinglePayload(t *testing.T)
```

### <a id="TestHandleEnqueueSinglePayloadNoIndexerName" href="#TestHandleEnqueueSinglePayloadNoIndexerName">func TestHandleEnqueueSinglePayloadNoIndexerName(t *testing.T)</a>

```
searchKey: httpapi.TestHandleEnqueueSinglePayloadNoIndexerName
tags: [function private test]
```

```Go
func TestHandleEnqueueSinglePayloadNoIndexerName(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: httpapi.TestMain
tags: [function private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="clientError" href="#clientError">func clientError(message string, vals ...interface{}) error</a>

```
searchKey: httpapi.clientError
tags: [function private]
```

```Go
func clientError(message string, vals ...interface{}) error
```

### <a id="copyAll" href="#copyAll">func copyAll(w http.ResponseWriter, r io.Reader)</a>

```
searchKey: httpapi.copyAll
tags: [function private]
```

```Go
func copyAll(w http.ResponseWriter, r io.Reader)
```

copyAll writes the contents of r to w and logs on write failure. 

### <a id="enforceAuth" href="#enforceAuth">func enforceAuth(ctx context.Context, w http.ResponseWriter, r *http.Request, repoName string) bool</a>

```
searchKey: httpapi.enforceAuth
tags: [function private]
```

```Go
func enforceAuth(ctx context.Context, w http.ResponseWriter, r *http.Request, repoName string) bool
```

### <a id="enforceAuthGithub" href="#enforceAuthGithub">func enforceAuthGithub(ctx context.Context, w http.ResponseWriter, r *http.Request, repoName string) (int, error)</a>

```
searchKey: httpapi.enforceAuthGithub
tags: [function private]
```

```Go
func enforceAuthGithub(ctx context.Context, w http.ResponseWriter, r *http.Request, repoName string) (int, error)
```

### <a id="ensureRepoAndCommitExist" href="#ensureRepoAndCommitExist">func ensureRepoAndCommitExist(ctx context.Context, w http.ResponseWriter, repoName, commit string) (*types.Repo, bool)</a>

```
searchKey: httpapi.ensureRepoAndCommitExist
tags: [function private]
```

```Go
func ensureRepoAndCommitExist(ctx context.Context, w http.ResponseWriter, repoName, commit string) (*types.Repo, bool)
```

🚨 SECURITY: It is critical to call this function after necessary authz check because this function would bypass authz to for testing if the repository and commit exists in Sourcegraph. 

### <a id="formatAWSError" href="#formatAWSError">func formatAWSError(err error) string</a>

```
searchKey: httpapi.formatAWSError
tags: [function private]
```

```Go
func formatAWSError(err error) string
```

formatAWSError returns the unwrapped, root AWS/S3 error. This method returns an empty string when the given error value is neither an AWS nor an S3 error. 

### <a id="getQuery" href="#getQuery">func getQuery(r *http.Request, name string) string</a>

```
searchKey: httpapi.getQuery
tags: [function private]
```

```Go
func getQuery(r *http.Request, name string) string
```

### <a id="getQueryInt" href="#getQueryInt">func getQueryInt(r *http.Request, name string) int</a>

```
searchKey: httpapi.getQueryInt
tags: [function private]
```

```Go
func getQueryInt(r *http.Request, name string) int
```

### <a id="hasQuery" href="#hasQuery">func hasQuery(r *http.Request, name string) bool</a>

```
searchKey: httpapi.hasQuery
tags: [function private]
```

```Go
func hasQuery(r *http.Request, name string) bool
```

### <a id="inferIndexer" href="#inferIndexer">func inferIndexer(r *http.Request) (string, error)</a>

```
searchKey: httpapi.inferIndexer
tags: [function private]
```

```Go
func inferIndexer(r *http.Request) (string, error)
```

inferIndexer returns the tool name from the metadata vertex at the start of the the given input stream. This method must destructively read the request body, but will re-assign the Body field with a reader that holds the same information as the original request. 

Newer versions of src-cli will do this same check before uploading the file. However, older versions of src-cli will not guarantee that the index name query parameter is sent. Requiring it now will break valid workflows. We only need ot maintain backwards compatibility on single payload uploads, as everything else is as new as the version of src-cli that always sends the indexer name. 

### <a id="isSiteAdmin" href="#isSiteAdmin">func isSiteAdmin(ctx context.Context) bool</a>

```
searchKey: httpapi.isSiteAdmin
tags: [function private]
```

```Go
func isSiteAdmin(ctx context.Context) bool
```

### <a id="sanitizeRoot" href="#sanitizeRoot">func sanitizeRoot(s string) string</a>

```
searchKey: httpapi.sanitizeRoot
tags: [function private]
```

```Go
func sanitizeRoot(s string) string
```

### <a id="setupRepoMocks" href="#setupRepoMocks">func setupRepoMocks(t testing.TB)</a>

```
searchKey: httpapi.setupRepoMocks
tags: [function private]
```

```Go
func setupRepoMocks(t testing.TB)
```

### <a id="writeJSON" href="#writeJSON">func writeJSON(w http.ResponseWriter, payload interface{})</a>

```
searchKey: httpapi.writeJSON
tags: [function private]
```

```Go
func writeJSON(w http.ResponseWriter, payload interface{})
```

writeJSON writes the JSON-encoded payload to w and logs on write failure. If there is an encoding error, then a 500-level status is written to w. 

