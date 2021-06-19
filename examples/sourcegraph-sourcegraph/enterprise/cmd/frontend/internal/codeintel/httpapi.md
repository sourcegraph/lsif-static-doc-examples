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
    * [type DBStoreShim struct](#DBStoreShim)
        * [func (s *DBStoreShim) Transact(ctx context.Context) (DBStore, error)](#DBStoreShim.Transact)
    * [type UploadHandler struct](#UploadHandler)
        * [func (h *UploadHandler) handleEnqueue(w http.ResponseWriter, r *http.Request)](#UploadHandler.handleEnqueue)
        * [func (h *UploadHandler) handleEnqueueErr(w http.ResponseWriter, r *http.Request, repositoryID int) (interface{}, error)](#UploadHandler.handleEnqueueErr)
        * [func (h *UploadHandler) handleEnqueueSinglePayload(r *http.Request, uploadArgs UploadArgs) (interface{}, error)](#UploadHandler.handleEnqueueSinglePayload)
        * [func (h *UploadHandler) handleEnqueueMultipartSetup(r *http.Request, uploadArgs UploadArgs, numParts int) (interface{}, error)](#UploadHandler.handleEnqueueMultipartSetup)
        * [func (h *UploadHandler) handleEnqueueMultipartUpload(r *http.Request, upload store.Upload, partIndex int) (interface{}, error)](#UploadHandler.handleEnqueueMultipartUpload)
        * [func (h *UploadHandler) handleEnqueueMultipartFinalize(r *http.Request, upload store.Upload) (interface{}, error)](#UploadHandler.handleEnqueueMultipartFinalize)
        * [func (h *UploadHandler) markUploadAsFailed(ctx context.Context, tx DBStore, uploadID int, err error)](#UploadHandler.markUploadAsFailed)
    * [type UploadArgs struct](#UploadArgs)
    * [type enqueuePayload struct](#enqueuePayload)
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
    * [type DBStoreAddUploadPartFunc struct](#DBStoreAddUploadPartFunc)
        * [func (f *DBStoreAddUploadPartFunc) SetDefaultHook(hook func(context.Context, int, int) error)](#DBStoreAddUploadPartFunc.SetDefaultHook)
        * [func (f *DBStoreAddUploadPartFunc) PushHook(hook func(context.Context, int, int) error)](#DBStoreAddUploadPartFunc.PushHook)
        * [func (f *DBStoreAddUploadPartFunc) SetDefaultReturn(r0 error)](#DBStoreAddUploadPartFunc.SetDefaultReturn)
        * [func (f *DBStoreAddUploadPartFunc) PushReturn(r0 error)](#DBStoreAddUploadPartFunc.PushReturn)
        * [func (f *DBStoreAddUploadPartFunc) nextHook() func(context.Context, int, int) error](#DBStoreAddUploadPartFunc.nextHook)
        * [func (f *DBStoreAddUploadPartFunc) appendCall(r0 DBStoreAddUploadPartFuncCall)](#DBStoreAddUploadPartFunc.appendCall)
        * [func (f *DBStoreAddUploadPartFunc) History() []DBStoreAddUploadPartFuncCall](#DBStoreAddUploadPartFunc.History)
    * [type DBStoreAddUploadPartFuncCall struct](#DBStoreAddUploadPartFuncCall)
        * [func (c DBStoreAddUploadPartFuncCall) Args() []interface{}](#DBStoreAddUploadPartFuncCall.Args)
        * [func (c DBStoreAddUploadPartFuncCall) Results() []interface{}](#DBStoreAddUploadPartFuncCall.Results)
    * [type DBStoreDoneFunc struct](#DBStoreDoneFunc)
        * [func (f *DBStoreDoneFunc) SetDefaultHook(hook func(error) error)](#DBStoreDoneFunc.SetDefaultHook)
        * [func (f *DBStoreDoneFunc) PushHook(hook func(error) error)](#DBStoreDoneFunc.PushHook)
        * [func (f *DBStoreDoneFunc) SetDefaultReturn(r0 error)](#DBStoreDoneFunc.SetDefaultReturn)
        * [func (f *DBStoreDoneFunc) PushReturn(r0 error)](#DBStoreDoneFunc.PushReturn)
        * [func (f *DBStoreDoneFunc) nextHook() func(error) error](#DBStoreDoneFunc.nextHook)
        * [func (f *DBStoreDoneFunc) appendCall(r0 DBStoreDoneFuncCall)](#DBStoreDoneFunc.appendCall)
        * [func (f *DBStoreDoneFunc) History() []DBStoreDoneFuncCall](#DBStoreDoneFunc.History)
    * [type DBStoreDoneFuncCall struct](#DBStoreDoneFuncCall)
        * [func (c DBStoreDoneFuncCall) Args() []interface{}](#DBStoreDoneFuncCall.Args)
        * [func (c DBStoreDoneFuncCall) Results() []interface{}](#DBStoreDoneFuncCall.Results)
    * [type DBStoreGetUploadByIDFunc struct](#DBStoreGetUploadByIDFunc)
        * [func (f *DBStoreGetUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Upload, bool, error))](#DBStoreGetUploadByIDFunc.SetDefaultHook)
        * [func (f *DBStoreGetUploadByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Upload, bool, error))](#DBStoreGetUploadByIDFunc.PushHook)
        * [func (f *DBStoreGetUploadByIDFunc) SetDefaultReturn(r0 dbstore.Upload, r1 bool, r2 error)](#DBStoreGetUploadByIDFunc.SetDefaultReturn)
        * [func (f *DBStoreGetUploadByIDFunc) PushReturn(r0 dbstore.Upload, r1 bool, r2 error)](#DBStoreGetUploadByIDFunc.PushReturn)
        * [func (f *DBStoreGetUploadByIDFunc) nextHook() func(context.Context, int) (dbstore.Upload, bool, error)](#DBStoreGetUploadByIDFunc.nextHook)
        * [func (f *DBStoreGetUploadByIDFunc) appendCall(r0 DBStoreGetUploadByIDFuncCall)](#DBStoreGetUploadByIDFunc.appendCall)
        * [func (f *DBStoreGetUploadByIDFunc) History() []DBStoreGetUploadByIDFuncCall](#DBStoreGetUploadByIDFunc.History)
    * [type DBStoreGetUploadByIDFuncCall struct](#DBStoreGetUploadByIDFuncCall)
        * [func (c DBStoreGetUploadByIDFuncCall) Args() []interface{}](#DBStoreGetUploadByIDFuncCall.Args)
        * [func (c DBStoreGetUploadByIDFuncCall) Results() []interface{}](#DBStoreGetUploadByIDFuncCall.Results)
    * [type DBStoreInsertUploadFunc struct](#DBStoreInsertUploadFunc)
        * [func (f *DBStoreInsertUploadFunc) SetDefaultHook(hook func(context.Context, dbstore.Upload) (int, error))](#DBStoreInsertUploadFunc.SetDefaultHook)
        * [func (f *DBStoreInsertUploadFunc) PushHook(hook func(context.Context, dbstore.Upload) (int, error))](#DBStoreInsertUploadFunc.PushHook)
        * [func (f *DBStoreInsertUploadFunc) SetDefaultReturn(r0 int, r1 error)](#DBStoreInsertUploadFunc.SetDefaultReturn)
        * [func (f *DBStoreInsertUploadFunc) PushReturn(r0 int, r1 error)](#DBStoreInsertUploadFunc.PushReturn)
        * [func (f *DBStoreInsertUploadFunc) nextHook() func(context.Context, dbstore.Upload) (int, error)](#DBStoreInsertUploadFunc.nextHook)
        * [func (f *DBStoreInsertUploadFunc) appendCall(r0 DBStoreInsertUploadFuncCall)](#DBStoreInsertUploadFunc.appendCall)
        * [func (f *DBStoreInsertUploadFunc) History() []DBStoreInsertUploadFuncCall](#DBStoreInsertUploadFunc.History)
    * [type DBStoreInsertUploadFuncCall struct](#DBStoreInsertUploadFuncCall)
        * [func (c DBStoreInsertUploadFuncCall) Args() []interface{}](#DBStoreInsertUploadFuncCall.Args)
        * [func (c DBStoreInsertUploadFuncCall) Results() []interface{}](#DBStoreInsertUploadFuncCall.Results)
    * [type DBStoreMarkFailedFunc struct](#DBStoreMarkFailedFunc)
        * [func (f *DBStoreMarkFailedFunc) SetDefaultHook(hook func(context.Context, int, string) error)](#DBStoreMarkFailedFunc.SetDefaultHook)
        * [func (f *DBStoreMarkFailedFunc) PushHook(hook func(context.Context, int, string) error)](#DBStoreMarkFailedFunc.PushHook)
        * [func (f *DBStoreMarkFailedFunc) SetDefaultReturn(r0 error)](#DBStoreMarkFailedFunc.SetDefaultReturn)
        * [func (f *DBStoreMarkFailedFunc) PushReturn(r0 error)](#DBStoreMarkFailedFunc.PushReturn)
        * [func (f *DBStoreMarkFailedFunc) nextHook() func(context.Context, int, string) error](#DBStoreMarkFailedFunc.nextHook)
        * [func (f *DBStoreMarkFailedFunc) appendCall(r0 DBStoreMarkFailedFuncCall)](#DBStoreMarkFailedFunc.appendCall)
        * [func (f *DBStoreMarkFailedFunc) History() []DBStoreMarkFailedFuncCall](#DBStoreMarkFailedFunc.History)
    * [type DBStoreMarkFailedFuncCall struct](#DBStoreMarkFailedFuncCall)
        * [func (c DBStoreMarkFailedFuncCall) Args() []interface{}](#DBStoreMarkFailedFuncCall.Args)
        * [func (c DBStoreMarkFailedFuncCall) Results() []interface{}](#DBStoreMarkFailedFuncCall.Results)
    * [type DBStoreMarkQueuedFunc struct](#DBStoreMarkQueuedFunc)
        * [func (f *DBStoreMarkQueuedFunc) SetDefaultHook(hook func(context.Context, int, *int64) error)](#DBStoreMarkQueuedFunc.SetDefaultHook)
        * [func (f *DBStoreMarkQueuedFunc) PushHook(hook func(context.Context, int, *int64) error)](#DBStoreMarkQueuedFunc.PushHook)
        * [func (f *DBStoreMarkQueuedFunc) SetDefaultReturn(r0 error)](#DBStoreMarkQueuedFunc.SetDefaultReturn)
        * [func (f *DBStoreMarkQueuedFunc) PushReturn(r0 error)](#DBStoreMarkQueuedFunc.PushReturn)
        * [func (f *DBStoreMarkQueuedFunc) nextHook() func(context.Context, int, *int64) error](#DBStoreMarkQueuedFunc.nextHook)
        * [func (f *DBStoreMarkQueuedFunc) appendCall(r0 DBStoreMarkQueuedFuncCall)](#DBStoreMarkQueuedFunc.appendCall)
        * [func (f *DBStoreMarkQueuedFunc) History() []DBStoreMarkQueuedFuncCall](#DBStoreMarkQueuedFunc.History)
    * [type DBStoreMarkQueuedFuncCall struct](#DBStoreMarkQueuedFuncCall)
        * [func (c DBStoreMarkQueuedFuncCall) Args() []interface{}](#DBStoreMarkQueuedFuncCall.Args)
        * [func (c DBStoreMarkQueuedFuncCall) Results() []interface{}](#DBStoreMarkQueuedFuncCall.Results)
    * [type DBStoreTransactFunc struct](#DBStoreTransactFunc)
        * [func (f *DBStoreTransactFunc) SetDefaultHook(hook func(context.Context) (DBStore, error))](#DBStoreTransactFunc.SetDefaultHook)
        * [func (f *DBStoreTransactFunc) PushHook(hook func(context.Context) (DBStore, error))](#DBStoreTransactFunc.PushHook)
        * [func (f *DBStoreTransactFunc) SetDefaultReturn(r0 DBStore, r1 error)](#DBStoreTransactFunc.SetDefaultReturn)
        * [func (f *DBStoreTransactFunc) PushReturn(r0 DBStore, r1 error)](#DBStoreTransactFunc.PushReturn)
        * [func (f *DBStoreTransactFunc) nextHook() func(context.Context) (DBStore, error)](#DBStoreTransactFunc.nextHook)
        * [func (f *DBStoreTransactFunc) appendCall(r0 DBStoreTransactFuncCall)](#DBStoreTransactFunc.appendCall)
        * [func (f *DBStoreTransactFunc) History() []DBStoreTransactFuncCall](#DBStoreTransactFunc.History)
    * [type DBStoreTransactFuncCall struct](#DBStoreTransactFuncCall)
        * [func (c DBStoreTransactFuncCall) Args() []interface{}](#DBStoreTransactFuncCall.Args)
        * [func (c DBStoreTransactFuncCall) Results() []interface{}](#DBStoreTransactFuncCall.Results)
* [Functions](#func)
    * [func isSiteAdmin(ctx context.Context) bool](#isSiteAdmin)
    * [func enforceAuth(ctx context.Context, w http.ResponseWriter, r *http.Request, repoName string) bool](#enforceAuth)
    * [func enforceAuthGithub(ctx context.Context, w http.ResponseWriter, r *http.Request, repoName string) (int, error)](#enforceAuthGithub)
    * [func clientError(message string, vals ...interface{}) error](#clientError)
    * [func NewUploadHandler(dbStore DBStore, uploadStore uploadstore.Store, internal bool) http.Handler](#NewUploadHandler)
    * [func inferIndexer(r *http.Request) (string, error)](#inferIndexer)
    * [func ensureRepoAndCommitExist(ctx context.Context, w http.ResponseWriter, repoName, commit string) (*types.Repo, bool)](#ensureRepoAndCommitExist)
    * [func formatAWSError(err error) string](#formatAWSError)
    * [func sanitizeRoot(s string) string](#sanitizeRoot)
    * [func hasQuery(r *http.Request, name string) bool](#hasQuery)
    * [func getQuery(r *http.Request, name string) string](#getQuery)
    * [func getQueryInt(r *http.Request, name string) int](#getQueryInt)
    * [func copyAll(w http.ResponseWriter, r io.Reader)](#copyAll)
    * [func writeJSON(w http.ResponseWriter, payload interface{})](#writeJSON)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestHandleEnqueueSinglePayload(t *testing.T)](#TestHandleEnqueueSinglePayload)
    * [func TestHandleEnqueueSinglePayloadNoIndexerName(t *testing.T)](#TestHandleEnqueueSinglePayloadNoIndexerName)
    * [func TestHandleEnqueueMultipartSetup(t *testing.T)](#TestHandleEnqueueMultipartSetup)
    * [func TestHandleEnqueueMultipartUpload(t *testing.T)](#TestHandleEnqueueMultipartUpload)
    * [func TestHandleEnqueueMultipartFinalize(t *testing.T)](#TestHandleEnqueueMultipartFinalize)
    * [func TestHandleEnqueueMultipartFinalizeIncompleteUpload(t *testing.T)](#TestHandleEnqueueMultipartFinalizeIncompleteUpload)
    * [func setupRepoMocks(t testing.TB)](#setupRepoMocks)


## <a id="const" href="#const">Constants</a>

### <a id="testCommit" href="#testCommit">const testCommit</a>

```
searchKey: httpapi.testCommit
```

```Go
const testCommit = "deadbeef01deadbeef02deadbeef03deadbeef04"
```

## <a id="var" href="#var">Variables</a>

### <a id="githubURL" href="#githubURL">var githubURL</a>

```
searchKey: httpapi.githubURL
```

```Go
var githubURL = url.URL{Scheme: "https", Host: "api.github.com"}
```

### <a id="revhashPattern" href="#revhashPattern">var revhashPattern</a>

```
searchKey: httpapi.revhashPattern
```

```Go
var revhashPattern = lazyregexp.New(`^[a-z0-9]{40}$`)
```

## <a id="type" href="#type">Types</a>

### <a id="ClientError" href="#ClientError">type ClientError struct</a>

```
searchKey: httpapi.ClientError
tags: [exported]
```

```Go
type ClientError struct {
	err error
}
```

#### <a id="ClientError.Error" href="#ClientError.Error">func (e *ClientError) Error() string</a>

```
searchKey: httpapi.ClientError.Error
tags: [exported]
```

```Go
func (e *ClientError) Error() string
```

### <a id="DBStore" href="#DBStore">type DBStore interface</a>

```
searchKey: httpapi.DBStore
tags: [exported]
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

### <a id="DBStoreShim" href="#DBStoreShim">type DBStoreShim struct</a>

```
searchKey: httpapi.DBStoreShim
tags: [exported]
```

```Go
type DBStoreShim struct {
	*dbstore.Store
}
```

#### <a id="DBStoreShim.Transact" href="#DBStoreShim.Transact">func (s *DBStoreShim) Transact(ctx context.Context) (DBStore, error)</a>

```
searchKey: httpapi.DBStoreShim.Transact
tags: [exported]
```

```Go
func (s *DBStoreShim) Transact(ctx context.Context) (DBStore, error)
```

### <a id="UploadHandler" href="#UploadHandler">type UploadHandler struct</a>

```
searchKey: httpapi.UploadHandler
tags: [exported]
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
```

```Go
func (h *UploadHandler) handleEnqueue(w http.ResponseWriter, r *http.Request)
```

POST /upload 

#### <a id="UploadHandler.handleEnqueueErr" href="#UploadHandler.handleEnqueueErr">func (h *UploadHandler) handleEnqueueErr(w http.ResponseWriter, r *http.Request, repositoryID int) (interface{}, error)</a>

```
searchKey: httpapi.UploadHandler.handleEnqueueErr
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
#### <a id="UploadHandler.handleEnqueueSinglePayload" href="#UploadHandler.handleEnqueueSinglePayload">func (h *UploadHandler) handleEnqueueSinglePayload(r *http.Request, uploadArgs UploadArgs) (interface{}, error)</a>

```
searchKey: httpapi.UploadHandler.handleEnqueueSinglePayload
```

```Go
func (h *UploadHandler) handleEnqueueSinglePayload(r *http.Request, uploadArgs UploadArgs) (interface{}, error)
```

handleEnqueueSinglePayload handles a non-multipart upload. This creates an upload record with state 'queued', proxies the data to the bundle manager, and returns the generated ID. 

#### <a id="UploadHandler.handleEnqueueMultipartSetup" href="#UploadHandler.handleEnqueueMultipartSetup">func (h *UploadHandler) handleEnqueueMultipartSetup(r *http.Request, uploadArgs UploadArgs, numParts int) (interface{}, error)</a>

```
searchKey: httpapi.UploadHandler.handleEnqueueMultipartSetup
```

```Go
func (h *UploadHandler) handleEnqueueMultipartSetup(r *http.Request, uploadArgs UploadArgs, numParts int) (interface{}, error)
```

handleEnqueueMultipartSetup handles the first request in a multipart upload. This creates a new upload record with state 'uploading' and returns the generated ID to be used in subsequent requests for the same upload. 

#### <a id="UploadHandler.handleEnqueueMultipartUpload" href="#UploadHandler.handleEnqueueMultipartUpload">func (h *UploadHandler) handleEnqueueMultipartUpload(r *http.Request, upload store.Upload, partIndex int) (interface{}, error)</a>

```
searchKey: httpapi.UploadHandler.handleEnqueueMultipartUpload
```

```Go
func (h *UploadHandler) handleEnqueueMultipartUpload(r *http.Request, upload store.Upload, partIndex int) (interface{}, error)
```

handleEnqueueMultipartUpload handles a partial upload in a multipart upload. This proxies the data to the bundle manager and marks the part index in the upload record. 

#### <a id="UploadHandler.handleEnqueueMultipartFinalize" href="#UploadHandler.handleEnqueueMultipartFinalize">func (h *UploadHandler) handleEnqueueMultipartFinalize(r *http.Request, upload store.Upload) (interface{}, error)</a>

```
searchKey: httpapi.UploadHandler.handleEnqueueMultipartFinalize
```

```Go
func (h *UploadHandler) handleEnqueueMultipartFinalize(r *http.Request, upload store.Upload) (interface{}, error)
```

handleEnqueueMultipartFinalize handles the final request of a multipart upload. This transitions the upload from 'uploading' to 'queued', then instructs the bundle manager to concatenate all of the part files together. 

#### <a id="UploadHandler.markUploadAsFailed" href="#UploadHandler.markUploadAsFailed">func (h *UploadHandler) markUploadAsFailed(ctx context.Context, tx DBStore, uploadID int, err error)</a>

```
searchKey: httpapi.UploadHandler.markUploadAsFailed
```

```Go
func (h *UploadHandler) markUploadAsFailed(ctx context.Context, tx DBStore, uploadID int, err error)
```

markUploadAsFailed attempts to mark the given upload as failed, extracting a human-meaningful error message from the given error. We assume this method to whenever an error occurs when interacting with the upload store so that the status of the upload is accurately reflected in the UI. 

This method does not return an error as it's best-effort cleanup. If an error occurs when trying to modify the record, it will be logged but will not be directly visible to the user. 

### <a id="UploadArgs" href="#UploadArgs">type UploadArgs struct</a>

```
searchKey: httpapi.UploadArgs
tags: [exported]
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

### <a id="enqueuePayload" href="#enqueuePayload">type enqueuePayload struct</a>

```
searchKey: httpapi.enqueuePayload
```

```Go
type enqueuePayload struct {
	ID string `json:"id"`
}
```

### <a id="MockDBStore" href="#MockDBStore">type MockDBStore struct</a>

```
searchKey: httpapi.MockDBStore
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
```

```Go
func NewMockDBStore() *MockDBStore
```

NewMockDBStore creates a new mock of the DBStore interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockDBStoreFrom" href="#NewMockDBStoreFrom">func NewMockDBStoreFrom(i DBStore) *MockDBStore</a>

```
searchKey: httpapi.NewMockDBStoreFrom
```

```Go
func NewMockDBStoreFrom(i DBStore) *MockDBStore
```

NewMockDBStoreFrom creates a new mock of the MockDBStore interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockDBStore.AddUploadPart" href="#MockDBStore.AddUploadPart">func (m *MockDBStore) AddUploadPart(v0 context.Context, v1 int, v2 int) error</a>

```
searchKey: httpapi.MockDBStore.AddUploadPart
```

```Go
func (m *MockDBStore) AddUploadPart(v0 context.Context, v1 int, v2 int) error
```

AddUploadPart delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.Done" href="#MockDBStore.Done">func (m *MockDBStore) Done(v0 error) error</a>

```
searchKey: httpapi.MockDBStore.Done
```

```Go
func (m *MockDBStore) Done(v0 error) error
```

Done delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.GetUploadByID" href="#MockDBStore.GetUploadByID">func (m *MockDBStore) GetUploadByID(v0 context.Context, v1 int) (dbstore.Upload, bool, error)</a>

```
searchKey: httpapi.MockDBStore.GetUploadByID
```

```Go
func (m *MockDBStore) GetUploadByID(v0 context.Context, v1 int) (dbstore.Upload, bool, error)
```

GetUploadByID delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.InsertUpload" href="#MockDBStore.InsertUpload">func (m *MockDBStore) InsertUpload(v0 context.Context, v1 dbstore.Upload) (int, error)</a>

```
searchKey: httpapi.MockDBStore.InsertUpload
```

```Go
func (m *MockDBStore) InsertUpload(v0 context.Context, v1 dbstore.Upload) (int, error)
```

InsertUpload delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.MarkFailed" href="#MockDBStore.MarkFailed">func (m *MockDBStore) MarkFailed(v0 context.Context, v1 int, v2 string) error</a>

```
searchKey: httpapi.MockDBStore.MarkFailed
```

```Go
func (m *MockDBStore) MarkFailed(v0 context.Context, v1 int, v2 string) error
```

MarkFailed delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.MarkQueued" href="#MockDBStore.MarkQueued">func (m *MockDBStore) MarkQueued(v0 context.Context, v1 int, v2 *int64) error</a>

```
searchKey: httpapi.MockDBStore.MarkQueued
```

```Go
func (m *MockDBStore) MarkQueued(v0 context.Context, v1 int, v2 *int64) error
```

MarkQueued delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockDBStore.Transact" href="#MockDBStore.Transact">func (m *MockDBStore) Transact(v0 context.Context) (DBStore, error)</a>

```
searchKey: httpapi.MockDBStore.Transact
```

```Go
func (m *MockDBStore) Transact(v0 context.Context) (DBStore, error)
```

Transact delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="DBStoreAddUploadPartFunc" href="#DBStoreAddUploadPartFunc">type DBStoreAddUploadPartFunc struct</a>

```
searchKey: httpapi.DBStoreAddUploadPartFunc
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

#### <a id="DBStoreAddUploadPartFunc.SetDefaultHook" href="#DBStoreAddUploadPartFunc.SetDefaultHook">func (f *DBStoreAddUploadPartFunc) SetDefaultHook(hook func(context.Context, int, int) error)</a>

```
searchKey: httpapi.DBStoreAddUploadPartFunc.SetDefaultHook
```

```Go
func (f *DBStoreAddUploadPartFunc) SetDefaultHook(hook func(context.Context, int, int) error)
```

SetDefaultHook sets function that is called when the AddUploadPart method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreAddUploadPartFunc.PushHook" href="#DBStoreAddUploadPartFunc.PushHook">func (f *DBStoreAddUploadPartFunc) PushHook(hook func(context.Context, int, int) error)</a>

```
searchKey: httpapi.DBStoreAddUploadPartFunc.PushHook
```

```Go
func (f *DBStoreAddUploadPartFunc) PushHook(hook func(context.Context, int, int) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the AddUploadPart method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreAddUploadPartFunc.SetDefaultReturn" href="#DBStoreAddUploadPartFunc.SetDefaultReturn">func (f *DBStoreAddUploadPartFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: httpapi.DBStoreAddUploadPartFunc.SetDefaultReturn
```

```Go
func (f *DBStoreAddUploadPartFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreAddUploadPartFunc.PushReturn" href="#DBStoreAddUploadPartFunc.PushReturn">func (f *DBStoreAddUploadPartFunc) PushReturn(r0 error)</a>

```
searchKey: httpapi.DBStoreAddUploadPartFunc.PushReturn
```

```Go
func (f *DBStoreAddUploadPartFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreAddUploadPartFunc.nextHook" href="#DBStoreAddUploadPartFunc.nextHook">func (f *DBStoreAddUploadPartFunc) nextHook() func(context.Context, int, int) error</a>

```
searchKey: httpapi.DBStoreAddUploadPartFunc.nextHook
```

```Go
func (f *DBStoreAddUploadPartFunc) nextHook() func(context.Context, int, int) error
```

#### <a id="DBStoreAddUploadPartFunc.appendCall" href="#DBStoreAddUploadPartFunc.appendCall">func (f *DBStoreAddUploadPartFunc) appendCall(r0 DBStoreAddUploadPartFuncCall)</a>

```
searchKey: httpapi.DBStoreAddUploadPartFunc.appendCall
```

```Go
func (f *DBStoreAddUploadPartFunc) appendCall(r0 DBStoreAddUploadPartFuncCall)
```

#### <a id="DBStoreAddUploadPartFunc.History" href="#DBStoreAddUploadPartFunc.History">func (f *DBStoreAddUploadPartFunc) History() []DBStoreAddUploadPartFuncCall</a>

```
searchKey: httpapi.DBStoreAddUploadPartFunc.History
```

```Go
func (f *DBStoreAddUploadPartFunc) History() []DBStoreAddUploadPartFuncCall
```

History returns a sequence of DBStoreAddUploadPartFuncCall objects describing the invocations of this function. 

### <a id="DBStoreAddUploadPartFuncCall" href="#DBStoreAddUploadPartFuncCall">type DBStoreAddUploadPartFuncCall struct</a>

```
searchKey: httpapi.DBStoreAddUploadPartFuncCall
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
```

```Go
func (c DBStoreAddUploadPartFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreAddUploadPartFuncCall.Results" href="#DBStoreAddUploadPartFuncCall.Results">func (c DBStoreAddUploadPartFuncCall) Results() []interface{}</a>

```
searchKey: httpapi.DBStoreAddUploadPartFuncCall.Results
```

```Go
func (c DBStoreAddUploadPartFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreDoneFunc" href="#DBStoreDoneFunc">type DBStoreDoneFunc struct</a>

```
searchKey: httpapi.DBStoreDoneFunc
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

#### <a id="DBStoreDoneFunc.SetDefaultHook" href="#DBStoreDoneFunc.SetDefaultHook">func (f *DBStoreDoneFunc) SetDefaultHook(hook func(error) error)</a>

```
searchKey: httpapi.DBStoreDoneFunc.SetDefaultHook
```

```Go
func (f *DBStoreDoneFunc) SetDefaultHook(hook func(error) error)
```

SetDefaultHook sets function that is called when the Done method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreDoneFunc.PushHook" href="#DBStoreDoneFunc.PushHook">func (f *DBStoreDoneFunc) PushHook(hook func(error) error)</a>

```
searchKey: httpapi.DBStoreDoneFunc.PushHook
```

```Go
func (f *DBStoreDoneFunc) PushHook(hook func(error) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Done method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreDoneFunc.SetDefaultReturn" href="#DBStoreDoneFunc.SetDefaultReturn">func (f *DBStoreDoneFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: httpapi.DBStoreDoneFunc.SetDefaultReturn
```

```Go
func (f *DBStoreDoneFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDoneFunc.PushReturn" href="#DBStoreDoneFunc.PushReturn">func (f *DBStoreDoneFunc) PushReturn(r0 error)</a>

```
searchKey: httpapi.DBStoreDoneFunc.PushReturn
```

```Go
func (f *DBStoreDoneFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreDoneFunc.nextHook" href="#DBStoreDoneFunc.nextHook">func (f *DBStoreDoneFunc) nextHook() func(error) error</a>

```
searchKey: httpapi.DBStoreDoneFunc.nextHook
```

```Go
func (f *DBStoreDoneFunc) nextHook() func(error) error
```

#### <a id="DBStoreDoneFunc.appendCall" href="#DBStoreDoneFunc.appendCall">func (f *DBStoreDoneFunc) appendCall(r0 DBStoreDoneFuncCall)</a>

```
searchKey: httpapi.DBStoreDoneFunc.appendCall
```

```Go
func (f *DBStoreDoneFunc) appendCall(r0 DBStoreDoneFuncCall)
```

#### <a id="DBStoreDoneFunc.History" href="#DBStoreDoneFunc.History">func (f *DBStoreDoneFunc) History() []DBStoreDoneFuncCall</a>

```
searchKey: httpapi.DBStoreDoneFunc.History
```

```Go
func (f *DBStoreDoneFunc) History() []DBStoreDoneFuncCall
```

History returns a sequence of DBStoreDoneFuncCall objects describing the invocations of this function. 

### <a id="DBStoreDoneFuncCall" href="#DBStoreDoneFuncCall">type DBStoreDoneFuncCall struct</a>

```
searchKey: httpapi.DBStoreDoneFuncCall
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
```

```Go
func (c DBStoreDoneFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreDoneFuncCall.Results" href="#DBStoreDoneFuncCall.Results">func (c DBStoreDoneFuncCall) Results() []interface{}</a>

```
searchKey: httpapi.DBStoreDoneFuncCall.Results
```

```Go
func (c DBStoreDoneFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreGetUploadByIDFunc" href="#DBStoreGetUploadByIDFunc">type DBStoreGetUploadByIDFunc struct</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFunc
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

#### <a id="DBStoreGetUploadByIDFunc.SetDefaultHook" href="#DBStoreGetUploadByIDFunc.SetDefaultHook">func (f *DBStoreGetUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Upload, bool, error))</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFunc.SetDefaultHook
```

```Go
func (f *DBStoreGetUploadByIDFunc) SetDefaultHook(hook func(context.Context, int) (dbstore.Upload, bool, error))
```

SetDefaultHook sets function that is called when the GetUploadByID method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreGetUploadByIDFunc.PushHook" href="#DBStoreGetUploadByIDFunc.PushHook">func (f *DBStoreGetUploadByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Upload, bool, error))</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFunc.PushHook
```

```Go
func (f *DBStoreGetUploadByIDFunc) PushHook(hook func(context.Context, int) (dbstore.Upload, bool, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetUploadByID method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreGetUploadByIDFunc.SetDefaultReturn" href="#DBStoreGetUploadByIDFunc.SetDefaultReturn">func (f *DBStoreGetUploadByIDFunc) SetDefaultReturn(r0 dbstore.Upload, r1 bool, r2 error)</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFunc.SetDefaultReturn
```

```Go
func (f *DBStoreGetUploadByIDFunc) SetDefaultReturn(r0 dbstore.Upload, r1 bool, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetUploadByIDFunc.PushReturn" href="#DBStoreGetUploadByIDFunc.PushReturn">func (f *DBStoreGetUploadByIDFunc) PushReturn(r0 dbstore.Upload, r1 bool, r2 error)</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFunc.PushReturn
```

```Go
func (f *DBStoreGetUploadByIDFunc) PushReturn(r0 dbstore.Upload, r1 bool, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreGetUploadByIDFunc.nextHook" href="#DBStoreGetUploadByIDFunc.nextHook">func (f *DBStoreGetUploadByIDFunc) nextHook() func(context.Context, int) (dbstore.Upload, bool, error)</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFunc.nextHook
```

```Go
func (f *DBStoreGetUploadByIDFunc) nextHook() func(context.Context, int) (dbstore.Upload, bool, error)
```

#### <a id="DBStoreGetUploadByIDFunc.appendCall" href="#DBStoreGetUploadByIDFunc.appendCall">func (f *DBStoreGetUploadByIDFunc) appendCall(r0 DBStoreGetUploadByIDFuncCall)</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFunc.appendCall
```

```Go
func (f *DBStoreGetUploadByIDFunc) appendCall(r0 DBStoreGetUploadByIDFuncCall)
```

#### <a id="DBStoreGetUploadByIDFunc.History" href="#DBStoreGetUploadByIDFunc.History">func (f *DBStoreGetUploadByIDFunc) History() []DBStoreGetUploadByIDFuncCall</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFunc.History
```

```Go
func (f *DBStoreGetUploadByIDFunc) History() []DBStoreGetUploadByIDFuncCall
```

History returns a sequence of DBStoreGetUploadByIDFuncCall objects describing the invocations of this function. 

### <a id="DBStoreGetUploadByIDFuncCall" href="#DBStoreGetUploadByIDFuncCall">type DBStoreGetUploadByIDFuncCall struct</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFuncCall
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
```

```Go
func (c DBStoreGetUploadByIDFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreGetUploadByIDFuncCall.Results" href="#DBStoreGetUploadByIDFuncCall.Results">func (c DBStoreGetUploadByIDFuncCall) Results() []interface{}</a>

```
searchKey: httpapi.DBStoreGetUploadByIDFuncCall.Results
```

```Go
func (c DBStoreGetUploadByIDFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreInsertUploadFunc" href="#DBStoreInsertUploadFunc">type DBStoreInsertUploadFunc struct</a>

```
searchKey: httpapi.DBStoreInsertUploadFunc
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

#### <a id="DBStoreInsertUploadFunc.SetDefaultHook" href="#DBStoreInsertUploadFunc.SetDefaultHook">func (f *DBStoreInsertUploadFunc) SetDefaultHook(hook func(context.Context, dbstore.Upload) (int, error))</a>

```
searchKey: httpapi.DBStoreInsertUploadFunc.SetDefaultHook
```

```Go
func (f *DBStoreInsertUploadFunc) SetDefaultHook(hook func(context.Context, dbstore.Upload) (int, error))
```

SetDefaultHook sets function that is called when the InsertUpload method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreInsertUploadFunc.PushHook" href="#DBStoreInsertUploadFunc.PushHook">func (f *DBStoreInsertUploadFunc) PushHook(hook func(context.Context, dbstore.Upload) (int, error))</a>

```
searchKey: httpapi.DBStoreInsertUploadFunc.PushHook
```

```Go
func (f *DBStoreInsertUploadFunc) PushHook(hook func(context.Context, dbstore.Upload) (int, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the InsertUpload method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreInsertUploadFunc.SetDefaultReturn" href="#DBStoreInsertUploadFunc.SetDefaultReturn">func (f *DBStoreInsertUploadFunc) SetDefaultReturn(r0 int, r1 error)</a>

```
searchKey: httpapi.DBStoreInsertUploadFunc.SetDefaultReturn
```

```Go
func (f *DBStoreInsertUploadFunc) SetDefaultReturn(r0 int, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreInsertUploadFunc.PushReturn" href="#DBStoreInsertUploadFunc.PushReturn">func (f *DBStoreInsertUploadFunc) PushReturn(r0 int, r1 error)</a>

```
searchKey: httpapi.DBStoreInsertUploadFunc.PushReturn
```

```Go
func (f *DBStoreInsertUploadFunc) PushReturn(r0 int, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreInsertUploadFunc.nextHook" href="#DBStoreInsertUploadFunc.nextHook">func (f *DBStoreInsertUploadFunc) nextHook() func(context.Context, dbstore.Upload) (int, error)</a>

```
searchKey: httpapi.DBStoreInsertUploadFunc.nextHook
```

```Go
func (f *DBStoreInsertUploadFunc) nextHook() func(context.Context, dbstore.Upload) (int, error)
```

#### <a id="DBStoreInsertUploadFunc.appendCall" href="#DBStoreInsertUploadFunc.appendCall">func (f *DBStoreInsertUploadFunc) appendCall(r0 DBStoreInsertUploadFuncCall)</a>

```
searchKey: httpapi.DBStoreInsertUploadFunc.appendCall
```

```Go
func (f *DBStoreInsertUploadFunc) appendCall(r0 DBStoreInsertUploadFuncCall)
```

#### <a id="DBStoreInsertUploadFunc.History" href="#DBStoreInsertUploadFunc.History">func (f *DBStoreInsertUploadFunc) History() []DBStoreInsertUploadFuncCall</a>

```
searchKey: httpapi.DBStoreInsertUploadFunc.History
```

```Go
func (f *DBStoreInsertUploadFunc) History() []DBStoreInsertUploadFuncCall
```

History returns a sequence of DBStoreInsertUploadFuncCall objects describing the invocations of this function. 

### <a id="DBStoreInsertUploadFuncCall" href="#DBStoreInsertUploadFuncCall">type DBStoreInsertUploadFuncCall struct</a>

```
searchKey: httpapi.DBStoreInsertUploadFuncCall
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
```

```Go
func (c DBStoreInsertUploadFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreInsertUploadFuncCall.Results" href="#DBStoreInsertUploadFuncCall.Results">func (c DBStoreInsertUploadFuncCall) Results() []interface{}</a>

```
searchKey: httpapi.DBStoreInsertUploadFuncCall.Results
```

```Go
func (c DBStoreInsertUploadFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreMarkFailedFunc" href="#DBStoreMarkFailedFunc">type DBStoreMarkFailedFunc struct</a>

```
searchKey: httpapi.DBStoreMarkFailedFunc
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

#### <a id="DBStoreMarkFailedFunc.SetDefaultHook" href="#DBStoreMarkFailedFunc.SetDefaultHook">func (f *DBStoreMarkFailedFunc) SetDefaultHook(hook func(context.Context, int, string) error)</a>

```
searchKey: httpapi.DBStoreMarkFailedFunc.SetDefaultHook
```

```Go
func (f *DBStoreMarkFailedFunc) SetDefaultHook(hook func(context.Context, int, string) error)
```

SetDefaultHook sets function that is called when the MarkFailed method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreMarkFailedFunc.PushHook" href="#DBStoreMarkFailedFunc.PushHook">func (f *DBStoreMarkFailedFunc) PushHook(hook func(context.Context, int, string) error)</a>

```
searchKey: httpapi.DBStoreMarkFailedFunc.PushHook
```

```Go
func (f *DBStoreMarkFailedFunc) PushHook(hook func(context.Context, int, string) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkFailed method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreMarkFailedFunc.SetDefaultReturn" href="#DBStoreMarkFailedFunc.SetDefaultReturn">func (f *DBStoreMarkFailedFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: httpapi.DBStoreMarkFailedFunc.SetDefaultReturn
```

```Go
func (f *DBStoreMarkFailedFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreMarkFailedFunc.PushReturn" href="#DBStoreMarkFailedFunc.PushReturn">func (f *DBStoreMarkFailedFunc) PushReturn(r0 error)</a>

```
searchKey: httpapi.DBStoreMarkFailedFunc.PushReturn
```

```Go
func (f *DBStoreMarkFailedFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreMarkFailedFunc.nextHook" href="#DBStoreMarkFailedFunc.nextHook">func (f *DBStoreMarkFailedFunc) nextHook() func(context.Context, int, string) error</a>

```
searchKey: httpapi.DBStoreMarkFailedFunc.nextHook
```

```Go
func (f *DBStoreMarkFailedFunc) nextHook() func(context.Context, int, string) error
```

#### <a id="DBStoreMarkFailedFunc.appendCall" href="#DBStoreMarkFailedFunc.appendCall">func (f *DBStoreMarkFailedFunc) appendCall(r0 DBStoreMarkFailedFuncCall)</a>

```
searchKey: httpapi.DBStoreMarkFailedFunc.appendCall
```

```Go
func (f *DBStoreMarkFailedFunc) appendCall(r0 DBStoreMarkFailedFuncCall)
```

#### <a id="DBStoreMarkFailedFunc.History" href="#DBStoreMarkFailedFunc.History">func (f *DBStoreMarkFailedFunc) History() []DBStoreMarkFailedFuncCall</a>

```
searchKey: httpapi.DBStoreMarkFailedFunc.History
```

```Go
func (f *DBStoreMarkFailedFunc) History() []DBStoreMarkFailedFuncCall
```

History returns a sequence of DBStoreMarkFailedFuncCall objects describing the invocations of this function. 

### <a id="DBStoreMarkFailedFuncCall" href="#DBStoreMarkFailedFuncCall">type DBStoreMarkFailedFuncCall struct</a>

```
searchKey: httpapi.DBStoreMarkFailedFuncCall
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
```

```Go
func (c DBStoreMarkFailedFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreMarkFailedFuncCall.Results" href="#DBStoreMarkFailedFuncCall.Results">func (c DBStoreMarkFailedFuncCall) Results() []interface{}</a>

```
searchKey: httpapi.DBStoreMarkFailedFuncCall.Results
```

```Go
func (c DBStoreMarkFailedFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreMarkQueuedFunc" href="#DBStoreMarkQueuedFunc">type DBStoreMarkQueuedFunc struct</a>

```
searchKey: httpapi.DBStoreMarkQueuedFunc
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

#### <a id="DBStoreMarkQueuedFunc.SetDefaultHook" href="#DBStoreMarkQueuedFunc.SetDefaultHook">func (f *DBStoreMarkQueuedFunc) SetDefaultHook(hook func(context.Context, int, *int64) error)</a>

```
searchKey: httpapi.DBStoreMarkQueuedFunc.SetDefaultHook
```

```Go
func (f *DBStoreMarkQueuedFunc) SetDefaultHook(hook func(context.Context, int, *int64) error)
```

SetDefaultHook sets function that is called when the MarkQueued method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreMarkQueuedFunc.PushHook" href="#DBStoreMarkQueuedFunc.PushHook">func (f *DBStoreMarkQueuedFunc) PushHook(hook func(context.Context, int, *int64) error)</a>

```
searchKey: httpapi.DBStoreMarkQueuedFunc.PushHook
```

```Go
func (f *DBStoreMarkQueuedFunc) PushHook(hook func(context.Context, int, *int64) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the MarkQueued method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreMarkQueuedFunc.SetDefaultReturn" href="#DBStoreMarkQueuedFunc.SetDefaultReturn">func (f *DBStoreMarkQueuedFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: httpapi.DBStoreMarkQueuedFunc.SetDefaultReturn
```

```Go
func (f *DBStoreMarkQueuedFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreMarkQueuedFunc.PushReturn" href="#DBStoreMarkQueuedFunc.PushReturn">func (f *DBStoreMarkQueuedFunc) PushReturn(r0 error)</a>

```
searchKey: httpapi.DBStoreMarkQueuedFunc.PushReturn
```

```Go
func (f *DBStoreMarkQueuedFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreMarkQueuedFunc.nextHook" href="#DBStoreMarkQueuedFunc.nextHook">func (f *DBStoreMarkQueuedFunc) nextHook() func(context.Context, int, *int64) error</a>

```
searchKey: httpapi.DBStoreMarkQueuedFunc.nextHook
```

```Go
func (f *DBStoreMarkQueuedFunc) nextHook() func(context.Context, int, *int64) error
```

#### <a id="DBStoreMarkQueuedFunc.appendCall" href="#DBStoreMarkQueuedFunc.appendCall">func (f *DBStoreMarkQueuedFunc) appendCall(r0 DBStoreMarkQueuedFuncCall)</a>

```
searchKey: httpapi.DBStoreMarkQueuedFunc.appendCall
```

```Go
func (f *DBStoreMarkQueuedFunc) appendCall(r0 DBStoreMarkQueuedFuncCall)
```

#### <a id="DBStoreMarkQueuedFunc.History" href="#DBStoreMarkQueuedFunc.History">func (f *DBStoreMarkQueuedFunc) History() []DBStoreMarkQueuedFuncCall</a>

```
searchKey: httpapi.DBStoreMarkQueuedFunc.History
```

```Go
func (f *DBStoreMarkQueuedFunc) History() []DBStoreMarkQueuedFuncCall
```

History returns a sequence of DBStoreMarkQueuedFuncCall objects describing the invocations of this function. 

### <a id="DBStoreMarkQueuedFuncCall" href="#DBStoreMarkQueuedFuncCall">type DBStoreMarkQueuedFuncCall struct</a>

```
searchKey: httpapi.DBStoreMarkQueuedFuncCall
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
```

```Go
func (c DBStoreMarkQueuedFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreMarkQueuedFuncCall.Results" href="#DBStoreMarkQueuedFuncCall.Results">func (c DBStoreMarkQueuedFuncCall) Results() []interface{}</a>

```
searchKey: httpapi.DBStoreMarkQueuedFuncCall.Results
```

```Go
func (c DBStoreMarkQueuedFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="DBStoreTransactFunc" href="#DBStoreTransactFunc">type DBStoreTransactFunc struct</a>

```
searchKey: httpapi.DBStoreTransactFunc
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

#### <a id="DBStoreTransactFunc.SetDefaultHook" href="#DBStoreTransactFunc.SetDefaultHook">func (f *DBStoreTransactFunc) SetDefaultHook(hook func(context.Context) (DBStore, error))</a>

```
searchKey: httpapi.DBStoreTransactFunc.SetDefaultHook
```

```Go
func (f *DBStoreTransactFunc) SetDefaultHook(hook func(context.Context) (DBStore, error))
```

SetDefaultHook sets function that is called when the Transact method of the parent MockDBStore instance is invoked and the hook queue is empty. 

#### <a id="DBStoreTransactFunc.PushHook" href="#DBStoreTransactFunc.PushHook">func (f *DBStoreTransactFunc) PushHook(hook func(context.Context) (DBStore, error))</a>

```
searchKey: httpapi.DBStoreTransactFunc.PushHook
```

```Go
func (f *DBStoreTransactFunc) PushHook(hook func(context.Context) (DBStore, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Transact method of the parent MockDBStore instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="DBStoreTransactFunc.SetDefaultReturn" href="#DBStoreTransactFunc.SetDefaultReturn">func (f *DBStoreTransactFunc) SetDefaultReturn(r0 DBStore, r1 error)</a>

```
searchKey: httpapi.DBStoreTransactFunc.SetDefaultReturn
```

```Go
func (f *DBStoreTransactFunc) SetDefaultReturn(r0 DBStore, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="DBStoreTransactFunc.PushReturn" href="#DBStoreTransactFunc.PushReturn">func (f *DBStoreTransactFunc) PushReturn(r0 DBStore, r1 error)</a>

```
searchKey: httpapi.DBStoreTransactFunc.PushReturn
```

```Go
func (f *DBStoreTransactFunc) PushReturn(r0 DBStore, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="DBStoreTransactFunc.nextHook" href="#DBStoreTransactFunc.nextHook">func (f *DBStoreTransactFunc) nextHook() func(context.Context) (DBStore, error)</a>

```
searchKey: httpapi.DBStoreTransactFunc.nextHook
```

```Go
func (f *DBStoreTransactFunc) nextHook() func(context.Context) (DBStore, error)
```

#### <a id="DBStoreTransactFunc.appendCall" href="#DBStoreTransactFunc.appendCall">func (f *DBStoreTransactFunc) appendCall(r0 DBStoreTransactFuncCall)</a>

```
searchKey: httpapi.DBStoreTransactFunc.appendCall
```

```Go
func (f *DBStoreTransactFunc) appendCall(r0 DBStoreTransactFuncCall)
```

#### <a id="DBStoreTransactFunc.History" href="#DBStoreTransactFunc.History">func (f *DBStoreTransactFunc) History() []DBStoreTransactFuncCall</a>

```
searchKey: httpapi.DBStoreTransactFunc.History
```

```Go
func (f *DBStoreTransactFunc) History() []DBStoreTransactFuncCall
```

History returns a sequence of DBStoreTransactFuncCall objects describing the invocations of this function. 

### <a id="DBStoreTransactFuncCall" href="#DBStoreTransactFuncCall">type DBStoreTransactFuncCall struct</a>

```
searchKey: httpapi.DBStoreTransactFuncCall
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
```

```Go
func (c DBStoreTransactFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="DBStoreTransactFuncCall.Results" href="#DBStoreTransactFuncCall.Results">func (c DBStoreTransactFuncCall) Results() []interface{}</a>

```
searchKey: httpapi.DBStoreTransactFuncCall.Results
```

```Go
func (c DBStoreTransactFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

## <a id="func" href="#func">Functions</a>

### <a id="isSiteAdmin" href="#isSiteAdmin">func isSiteAdmin(ctx context.Context) bool</a>

```
searchKey: httpapi.isSiteAdmin
```

```Go
func isSiteAdmin(ctx context.Context) bool
```

### <a id="enforceAuth" href="#enforceAuth">func enforceAuth(ctx context.Context, w http.ResponseWriter, r *http.Request, repoName string) bool</a>

```
searchKey: httpapi.enforceAuth
```

```Go
func enforceAuth(ctx context.Context, w http.ResponseWriter, r *http.Request, repoName string) bool
```

### <a id="enforceAuthGithub" href="#enforceAuthGithub">func enforceAuthGithub(ctx context.Context, w http.ResponseWriter, r *http.Request, repoName string) (int, error)</a>

```
searchKey: httpapi.enforceAuthGithub
```

```Go
func enforceAuthGithub(ctx context.Context, w http.ResponseWriter, r *http.Request, repoName string) (int, error)
```

### <a id="clientError" href="#clientError">func clientError(message string, vals ...interface{}) error</a>

```
searchKey: httpapi.clientError
```

```Go
func clientError(message string, vals ...interface{}) error
```

### <a id="NewUploadHandler" href="#NewUploadHandler">func NewUploadHandler(dbStore DBStore, uploadStore uploadstore.Store, internal bool) http.Handler</a>

```
searchKey: httpapi.NewUploadHandler
tags: [exported]
```

```Go
func NewUploadHandler(dbStore DBStore, uploadStore uploadstore.Store, internal bool) http.Handler
```

### <a id="inferIndexer" href="#inferIndexer">func inferIndexer(r *http.Request) (string, error)</a>

```
searchKey: httpapi.inferIndexer
```

```Go
func inferIndexer(r *http.Request) (string, error)
```

inferIndexer returns the tool name from the metadata vertex at the start of the the given input stream. This method must destructively read the request body, but will re-assign the Body field with a reader that holds the same information as the original request. 

Newer versions of src-cli will do this same check before uploading the file. However, older versions of src-cli will not guarantee that the index name query parameter is sent. Requiring it now will break valid workflows. We only need ot maintain backwards compatibility on single payload uploads, as everything else is as new as the version of src-cli that always sends the indexer name. 

### <a id="ensureRepoAndCommitExist" href="#ensureRepoAndCommitExist">func ensureRepoAndCommitExist(ctx context.Context, w http.ResponseWriter, repoName, commit string) (*types.Repo, bool)</a>

```
searchKey: httpapi.ensureRepoAndCommitExist
```

```Go
func ensureRepoAndCommitExist(ctx context.Context, w http.ResponseWriter, repoName, commit string) (*types.Repo, bool)
```

🚨 SECURITY: It is critical to call this function after necessary authz check because this function would bypass authz to for testing if the repository and commit exists in Sourcegraph. 

### <a id="formatAWSError" href="#formatAWSError">func formatAWSError(err error) string</a>

```
searchKey: httpapi.formatAWSError
```

```Go
func formatAWSError(err error) string
```

formatAWSError returns the unwrapped, root AWS/S3 error. This method returns an empty string when the given error value is neither an AWS nor an S3 error. 

### <a id="sanitizeRoot" href="#sanitizeRoot">func sanitizeRoot(s string) string</a>

```
searchKey: httpapi.sanitizeRoot
```

```Go
func sanitizeRoot(s string) string
```

### <a id="hasQuery" href="#hasQuery">func hasQuery(r *http.Request, name string) bool</a>

```
searchKey: httpapi.hasQuery
```

```Go
func hasQuery(r *http.Request, name string) bool
```

### <a id="getQuery" href="#getQuery">func getQuery(r *http.Request, name string) string</a>

```
searchKey: httpapi.getQuery
```

```Go
func getQuery(r *http.Request, name string) string
```

### <a id="getQueryInt" href="#getQueryInt">func getQueryInt(r *http.Request, name string) int</a>

```
searchKey: httpapi.getQueryInt
```

```Go
func getQueryInt(r *http.Request, name string) int
```

### <a id="copyAll" href="#copyAll">func copyAll(w http.ResponseWriter, r io.Reader)</a>

```
searchKey: httpapi.copyAll
```

```Go
func copyAll(w http.ResponseWriter, r io.Reader)
```

copyAll writes the contents of r to w and logs on write failure. 

### <a id="writeJSON" href="#writeJSON">func writeJSON(w http.ResponseWriter, payload interface{})</a>

```
searchKey: httpapi.writeJSON
```

```Go
func writeJSON(w http.ResponseWriter, payload interface{})
```

writeJSON writes the JSON-encoded payload to w and logs on write failure. If there is an encoding error, then a 500-level status is written to w. 

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: httpapi.TestMain
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestHandleEnqueueSinglePayload" href="#TestHandleEnqueueSinglePayload">func TestHandleEnqueueSinglePayload(t *testing.T)</a>

```
searchKey: httpapi.TestHandleEnqueueSinglePayload
```

```Go
func TestHandleEnqueueSinglePayload(t *testing.T)
```

### <a id="TestHandleEnqueueSinglePayloadNoIndexerName" href="#TestHandleEnqueueSinglePayloadNoIndexerName">func TestHandleEnqueueSinglePayloadNoIndexerName(t *testing.T)</a>

```
searchKey: httpapi.TestHandleEnqueueSinglePayloadNoIndexerName
```

```Go
func TestHandleEnqueueSinglePayloadNoIndexerName(t *testing.T)
```

### <a id="TestHandleEnqueueMultipartSetup" href="#TestHandleEnqueueMultipartSetup">func TestHandleEnqueueMultipartSetup(t *testing.T)</a>

```
searchKey: httpapi.TestHandleEnqueueMultipartSetup
```

```Go
func TestHandleEnqueueMultipartSetup(t *testing.T)
```

### <a id="TestHandleEnqueueMultipartUpload" href="#TestHandleEnqueueMultipartUpload">func TestHandleEnqueueMultipartUpload(t *testing.T)</a>

```
searchKey: httpapi.TestHandleEnqueueMultipartUpload
```

```Go
func TestHandleEnqueueMultipartUpload(t *testing.T)
```

### <a id="TestHandleEnqueueMultipartFinalize" href="#TestHandleEnqueueMultipartFinalize">func TestHandleEnqueueMultipartFinalize(t *testing.T)</a>

```
searchKey: httpapi.TestHandleEnqueueMultipartFinalize
```

```Go
func TestHandleEnqueueMultipartFinalize(t *testing.T)
```

### <a id="TestHandleEnqueueMultipartFinalizeIncompleteUpload" href="#TestHandleEnqueueMultipartFinalizeIncompleteUpload">func TestHandleEnqueueMultipartFinalizeIncompleteUpload(t *testing.T)</a>

```
searchKey: httpapi.TestHandleEnqueueMultipartFinalizeIncompleteUpload
```

```Go
func TestHandleEnqueueMultipartFinalizeIncompleteUpload(t *testing.T)
```

### <a id="setupRepoMocks" href="#setupRepoMocks">func setupRepoMocks(t testing.TB)</a>

```
searchKey: httpapi.setupRepoMocks
```

```Go
func setupRepoMocks(t testing.TB)
```

