# Package server

## Index

* [Variables](#var)
    * [var ErrUnknownQueue](#ErrUnknownQueue)
    * [var ErrUnknownJob](#ErrUnknownJob)
    * [var shutdownErr](#shutdownErr)
* [Types](#type)
    * [type handler struct](#handler)
        * [func newHandler(options Options, clock glock.Clock) *handler](#newHandler)
        * [func newHandlerWithMetrics(options Options, clock glock.Clock, observationContext *observation.Context) *handler](#newHandlerWithMetrics)
        * [func (m *handler) dequeue(ctx context.Context, queueName, executorName string) (_ apiclient.Job, dequeued bool, _ error)](#handler.dequeue)
        * [func (m *handler) addExecutionLogEntry(ctx context.Context, queueName, executorName string, jobID int, entry workerutil.ExecutionLogEntry) error](#handler.addExecutionLogEntry)
        * [func (m *handler) markComplete(ctx context.Context, queueName, executorName string, jobID int) error](#handler.markComplete)
        * [func (m *handler) markErrored(ctx context.Context, queueName, executorName string, jobID int, errorMessage string) error](#handler.markErrored)
        * [func (m *handler) markFailed(ctx context.Context, queueName, executorName string, jobID int, errorMessage string) error](#handler.markFailed)
        * [func (m *handler) findMeta(queueName, executorName string, jobID int, remove bool) (jobMeta, error)](#handler.findMeta)
        * [func (m *handler) addMeta(executorName string, job jobMeta)](#handler.addMeta)
        * [func (m *handler) updateMetrics()](#handler.updateMetrics)
        * [func (h *handler) heartbeat(ctx context.Context, executorName string, jobIDs []int) ([]int, error)](#handler.heartbeat)
        * [func (h *handler) cleanup(ctx context.Context) error](#handler.cleanup)
        * [func (h *handler) shutdown()](#handler.shutdown)
        * [func (h *handler) unknownJobs(executorName string, ids []int) []int](#handler.unknownJobs)
        * [func (h *handler) pruneJobs(executorName string, ids []int) (dead []jobMeta)](#handler.pruneJobs)
        * [func (h *handler) pruneExecutors() (jobs []jobMeta)](#handler.pruneExecutors)
        * [func (h *handler) requeueJobs(ctx context.Context, jobs []jobMeta) (errs error)](#handler.requeueJobs)
        * [func (h *handler) requeueJob(ctx context.Context, job jobMeta) error](#handler.requeueJob)
        * [func (h *handler) setupRoutes(router *mux.Router)](#handler.setupRoutes)
        * [func (h *handler) handleDequeue(w http.ResponseWriter, r *http.Request)](#handler.handleDequeue)
        * [func (h *handler) handleAddExecutionLogEntry(w http.ResponseWriter, r *http.Request)](#handler.handleAddExecutionLogEntry)
        * [func (h *handler) handleMarkComplete(w http.ResponseWriter, r *http.Request)](#handler.handleMarkComplete)
        * [func (h *handler) handleMarkErrored(w http.ResponseWriter, r *http.Request)](#handler.handleMarkErrored)
        * [func (h *handler) handleMarkFailed(w http.ResponseWriter, r *http.Request)](#handler.handleMarkFailed)
        * [func (h *handler) handleHeartbeat(w http.ResponseWriter, r *http.Request)](#handler.handleHeartbeat)
        * [func (h *handler) wrapHandler(w http.ResponseWriter, r *http.Request, payload interface{}, handler func() (int, interface{}, error))](#handler.wrapHandler)
    * [type Options struct](#Options)
    * [type QueueOptions struct](#QueueOptions)
    * [type executorMeta struct](#executorMeta)
    * [type jobMeta struct](#jobMeta)
    * [type QueueMetrics struct](#QueueMetrics)
        * [func newQueueMetrics(observationContext *observation.Context) *QueueMetrics](#newQueueMetrics)
    * [type errorResponse struct](#errorResponse)
    * [type handlerWrapper struct](#handlerWrapper)
        * [func (hw *handlerWrapper) Handle(ctx context.Context) error](#handlerWrapper.Handle)
        * [func (hw *handlerWrapper) HandleError(err error)](#handlerWrapper.HandleError)
        * [func (hw *handlerWrapper) OnShutdown()](#handlerWrapper.OnShutdown)
    * [type testRecord struct](#testRecord)
        * [func (r testRecord) RecordID() int](#testRecord.RecordID)
* [Functions](#func)
    * [func NewServer(options Options, observationContext *observation.Context) goroutine.BackgroundRoutine](#NewServer)
    * [func TestDequeue(t *testing.T)](#TestDequeue)
    * [func TestDequeueNoRecord(t *testing.T)](#TestDequeueNoRecord)
    * [func TestDequeueUnknownQueue(t *testing.T)](#TestDequeueUnknownQueue)
    * [func TestDequeueMaxTransactions(t *testing.T)](#TestDequeueMaxTransactions)
    * [func TestAddExecutionLogEntry(t *testing.T)](#TestAddExecutionLogEntry)
    * [func TestAddExecutionLogEntryUnknownQueue(t *testing.T)](#TestAddExecutionLogEntryUnknownQueue)
    * [func TestAddExecutionLogEntryUnknownJob(t *testing.T)](#TestAddExecutionLogEntryUnknownJob)
    * [func TestMarkComplete(t *testing.T)](#TestMarkComplete)
    * [func TestMarkCompleteUnknownJob(t *testing.T)](#TestMarkCompleteUnknownJob)
    * [func TestMarkCompleteUnknownQueue(t *testing.T)](#TestMarkCompleteUnknownQueue)
    * [func TestMarkErrored(t *testing.T)](#TestMarkErrored)
    * [func TestMarkErroredUnknownJob(t *testing.T)](#TestMarkErroredUnknownJob)
    * [func TestMarkErroredUnknownQueue(t *testing.T)](#TestMarkErroredUnknownQueue)
    * [func TestMarkFailed(t *testing.T)](#TestMarkFailed)
    * [func TestHeartbeat(t *testing.T)](#TestHeartbeat)
    * [func TestCleanup(t *testing.T)](#TestCleanup)


## <a id="var" href="#var">Variables</a>

### <a id="ErrUnknownQueue" href="#ErrUnknownQueue">var ErrUnknownQueue</a>

```
searchKey: server.ErrUnknownQueue
tags: [exported]
```

```Go
var ErrUnknownQueue = errors.New("unknown queue")
```

### <a id="ErrUnknownJob" href="#ErrUnknownJob">var ErrUnknownJob</a>

```
searchKey: server.ErrUnknownJob
tags: [exported]
```

```Go
var ErrUnknownJob = errors.New("unknown job")
```

### <a id="shutdownErr" href="#shutdownErr">var shutdownErr</a>

```
searchKey: server.shutdownErr
```

```Go
var shutdownErr = errors.New("server shutting down")
```

## <a id="type" href="#type">Types</a>

### <a id="handler" href="#handler">type handler struct</a>

```
searchKey: server.handler
```

```Go
type handler struct {
	options          Options
	clock            glock.Clock
	executors        map[string]*executorMeta
	dequeueSemaphore chan struct{} // tracks available dequeue slots
	m                sync.Mutex    // protects executors
	queueMetrics     *QueueMetrics
}
```

#### <a id="newHandler" href="#newHandler">func newHandler(options Options, clock glock.Clock) *handler</a>

```
searchKey: server.newHandler
```

```Go
func newHandler(options Options, clock glock.Clock) *handler
```

#### <a id="newHandlerWithMetrics" href="#newHandlerWithMetrics">func newHandlerWithMetrics(options Options, clock glock.Clock, observationContext *observation.Context) *handler</a>

```
searchKey: server.newHandlerWithMetrics
```

```Go
func newHandlerWithMetrics(options Options, clock glock.Clock, observationContext *observation.Context) *handler
```

#### <a id="handler.dequeue" href="#handler.dequeue">func (m *handler) dequeue(ctx context.Context, queueName, executorName string) (_ apiclient.Job, dequeued bool, _ error)</a>

```
searchKey: server.handler.dequeue
```

```Go
func (m *handler) dequeue(ctx context.Context, queueName, executorName string) (_ apiclient.Job, dequeued bool, _ error)
```

dequeue selects a job record from the database and stashes metadata including the job record and the locking transaction. If no job is available for processing, or the server has hit its maximum transactions, a false-valued flag is returned. 

#### <a id="handler.addExecutionLogEntry" href="#handler.addExecutionLogEntry">func (m *handler) addExecutionLogEntry(ctx context.Context, queueName, executorName string, jobID int, entry workerutil.ExecutionLogEntry) error</a>

```
searchKey: server.handler.addExecutionLogEntry
```

```Go
func (m *handler) addExecutionLogEntry(ctx context.Context, queueName, executorName string, jobID int, entry workerutil.ExecutionLogEntry) error
```

addExecutionLogEntry calls AddExecutionLogEntry for the given job. If the job identifier is not known, a false-valued flag is returned. 

#### <a id="handler.markComplete" href="#handler.markComplete">func (m *handler) markComplete(ctx context.Context, queueName, executorName string, jobID int) error</a>

```
searchKey: server.handler.markComplete
```

```Go
func (m *handler) markComplete(ctx context.Context, queueName, executorName string, jobID int) error
```

markComplete calls MarkComplete for the given job, then commits the job's transaction. The job is removed from the executor's job list on success. 

#### <a id="handler.markErrored" href="#handler.markErrored">func (m *handler) markErrored(ctx context.Context, queueName, executorName string, jobID int, errorMessage string) error</a>

```
searchKey: server.handler.markErrored
```

```Go
func (m *handler) markErrored(ctx context.Context, queueName, executorName string, jobID int, errorMessage string) error
```

markErrored calls MarkErrored for the given job, then commits the job's transaction. The job is removed from the executor's job list on success. 

#### <a id="handler.markFailed" href="#handler.markFailed">func (m *handler) markFailed(ctx context.Context, queueName, executorName string, jobID int, errorMessage string) error</a>

```
searchKey: server.handler.markFailed
```

```Go
func (m *handler) markFailed(ctx context.Context, queueName, executorName string, jobID int, errorMessage string) error
```

markFailed calls MarkFailed for the given job, then commits the job's transaction. The job is removed from the executor's job list on success. 

#### <a id="handler.findMeta" href="#handler.findMeta">func (m *handler) findMeta(queueName, executorName string, jobID int, remove bool) (jobMeta, error)</a>

```
searchKey: server.handler.findMeta
```

```Go
func (m *handler) findMeta(queueName, executorName string, jobID int, remove bool) (jobMeta, error)
```

findMeta returns the job with the given id and executor name. If the job is unknown, an error is returned. If the remove parameter is true, the job will be removed from the executor's job list on success. 

#### <a id="handler.addMeta" href="#handler.addMeta">func (m *handler) addMeta(executorName string, job jobMeta)</a>

```
searchKey: server.handler.addMeta
```

```Go
func (m *handler) addMeta(executorName string, job jobMeta)
```

addMeta adds a job to the given executor's job list. 

#### <a id="handler.updateMetrics" href="#handler.updateMetrics">func (m *handler) updateMetrics()</a>

```
searchKey: server.handler.updateMetrics
```

```Go
func (m *handler) updateMetrics()
```

#### <a id="handler.heartbeat" href="#handler.heartbeat">func (h *handler) heartbeat(ctx context.Context, executorName string, jobIDs []int) ([]int, error)</a>

```
searchKey: server.handler.heartbeat
```

```Go
func (h *handler) heartbeat(ctx context.Context, executorName string, jobIDs []int) ([]int, error)
```

heartbeat will release the transaction for any job that is not confirmed to be in-progress by the given executor. This method is called when the executor POSTs its in-progress job identifiers to the /heartbeat route. This method returns the set of identifiers which the executor erroneously claims to hold (and are sent back as a hint to stop processing). 

#### <a id="handler.cleanup" href="#handler.cleanup">func (h *handler) cleanup(ctx context.Context) error</a>

```
searchKey: server.handler.cleanup
```

```Go
func (h *handler) cleanup(ctx context.Context) error
```

cleanup will release the transactions held by any executor that has not sent a heartbeat in a while. This method is called periodically in the background. 

#### <a id="handler.shutdown" href="#handler.shutdown">func (h *handler) shutdown()</a>

```
searchKey: server.handler.shutdown
```

```Go
func (h *handler) shutdown()
```

shutdown releases all transactions. This method is called on process shutdown. 

#### <a id="handler.unknownJobs" href="#handler.unknownJobs">func (h *handler) unknownJobs(executorName string, ids []int) []int</a>

```
searchKey: server.handler.unknownJobs
```

```Go
func (h *handler) unknownJobs(executorName string, ids []int) []int
```

unknownJobs returns the set of job identifiers reported by the executor which do not have an associated transaction held by this instance of the executor queue. This can occur when the executor-queue restarts and loses its transaction state. We send these identifiers back to the executor as a hint to stop processing. 

#### <a id="handler.pruneJobs" href="#handler.pruneJobs">func (h *handler) pruneJobs(executorName string, ids []int) (dead []jobMeta)</a>

```
searchKey: server.handler.pruneJobs
```

```Go
func (h *handler) pruneJobs(executorName string, ids []int) (dead []jobMeta)
```

pruneJobs updates the set of job identifiers assigned to the given executor and returns any job that was known to us but not reported by the executor. 

#### <a id="handler.pruneExecutors" href="#handler.pruneExecutors">func (h *handler) pruneExecutors() (jobs []jobMeta)</a>

```
searchKey: server.handler.pruneExecutors
```

```Go
func (h *handler) pruneExecutors() (jobs []jobMeta)
```

pruneExecutors will release the transactions held by any executor that has not sent a heartbeat in a while and return the attached jobs. 

#### <a id="handler.requeueJobs" href="#handler.requeueJobs">func (h *handler) requeueJobs(ctx context.Context, jobs []jobMeta) (errs error)</a>

```
searchKey: server.handler.requeueJobs
```

```Go
func (h *handler) requeueJobs(ctx context.Context, jobs []jobMeta) (errs error)
```

requeueJobs releases and requeues each of the given jobs. 

#### <a id="handler.requeueJob" href="#handler.requeueJob">func (h *handler) requeueJob(ctx context.Context, job jobMeta) error</a>

```
searchKey: server.handler.requeueJob
```

```Go
func (h *handler) requeueJob(ctx context.Context, job jobMeta) error
```

requeueJob requeues the given job and releases the associated transaction. 

#### <a id="handler.setupRoutes" href="#handler.setupRoutes">func (h *handler) setupRoutes(router *mux.Router)</a>

```
searchKey: server.handler.setupRoutes
```

```Go
func (h *handler) setupRoutes(router *mux.Router)
```

#### <a id="handler.handleDequeue" href="#handler.handleDequeue">func (h *handler) handleDequeue(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.handler.handleDequeue
```

```Go
func (h *handler) handleDequeue(w http.ResponseWriter, r *http.Request)
```

POST /{queueName}/dequeue 

#### <a id="handler.handleAddExecutionLogEntry" href="#handler.handleAddExecutionLogEntry">func (h *handler) handleAddExecutionLogEntry(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.handler.handleAddExecutionLogEntry
```

```Go
func (h *handler) handleAddExecutionLogEntry(w http.ResponseWriter, r *http.Request)
```

POST /{queueName}/addExecutionLogEntry 

#### <a id="handler.handleMarkComplete" href="#handler.handleMarkComplete">func (h *handler) handleMarkComplete(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.handler.handleMarkComplete
```

```Go
func (h *handler) handleMarkComplete(w http.ResponseWriter, r *http.Request)
```

POST /{queueName}/markComplete 

#### <a id="handler.handleMarkErrored" href="#handler.handleMarkErrored">func (h *handler) handleMarkErrored(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.handler.handleMarkErrored
```

```Go
func (h *handler) handleMarkErrored(w http.ResponseWriter, r *http.Request)
```

POST /{queueName}/markErrored 

#### <a id="handler.handleMarkFailed" href="#handler.handleMarkFailed">func (h *handler) handleMarkFailed(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.handler.handleMarkFailed
```

```Go
func (h *handler) handleMarkFailed(w http.ResponseWriter, r *http.Request)
```

POST /{queueName}/markFailed 

#### <a id="handler.handleHeartbeat" href="#handler.handleHeartbeat">func (h *handler) handleHeartbeat(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.handler.handleHeartbeat
```

```Go
func (h *handler) handleHeartbeat(w http.ResponseWriter, r *http.Request)
```

POST /heartbeat 

#### <a id="handler.wrapHandler" href="#handler.wrapHandler">func (h *handler) wrapHandler(w http.ResponseWriter, r *http.Request, payload interface{}, handler func() (int, interface{}, error))</a>

```
searchKey: server.handler.wrapHandler
```

```Go
func (h *handler) wrapHandler(w http.ResponseWriter, r *http.Request, payload interface{}, handler func() (int, interface{}, error))
```

wrapHandler decodes the request body into the given payload pointer, then calls the given handler function. If the body cannot be decoded, a 400 BadRequest is returned and the handler function is not called. If the handler function returns an error, a 500 Internal Server Error is returned. Otherwise, the response status will match the status code value returned from the handler, and the payload value returned from the handler is encoded and written to the response body. 

### <a id="Options" href="#Options">type Options struct</a>

```
searchKey: server.Options
tags: [exported]
```

```Go
type Options struct {
	// Port is the port on which to listen for HTTP connections.
	Port int

	// QueueOptions is a map from queue name to options specific to that queue.
	QueueOptions map[string]QueueOptions

	// MaximumNumTransactions is the maximum number of active records that can be given out
	// to executors from this machine. The dequeue method will stop returning records while
	// the number of outstanding transactions is at or above this threshold.
	MaximumNumTransactions int

	// RequeueDelay controls how far into the future to make a job record visible to the job
	// queue once the currently processing executor has become unresponsive.
	RequeueDelay time.Duration

	// UnreportedMaxAge is the maximum time between a record being dequeued and it appearing
	// in the executor's heartbeat requests before it being considered lost.
	UnreportedMaxAge time.Duration

	// DeathThreshold is the minimum time since the last heartbeat of an executor before that
	// executor can be considered as unresponsive. This should be configured to be longer than
	// the duration between heartbeat interval.
	DeathThreshold time.Duration

	// CleanupInterval is the duration between periodic invocations of Cleanup, which will
	// requeue any records that are "lost" according to the thresholds described above.
	CleanupInterval time.Duration
}
```

### <a id="QueueOptions" href="#QueueOptions">type QueueOptions struct</a>

```
searchKey: server.QueueOptions
tags: [exported]
```

```Go
type QueueOptions struct {
	// Store is a required dbworker store store for each registered queue.
	Store store.Store

	// RecordTransformer is a required hook for each registered queue that transforms a generic
	// record from that queue into the job to be given to an executor.
	RecordTransformer func(record workerutil.Record) (apiclient.Job, error)
}
```

### <a id="executorMeta" href="#executorMeta">type executorMeta struct</a>

```
searchKey: server.executorMeta
```

```Go
type executorMeta struct {
	lastUpdate time.Time
	jobs       []jobMeta
}
```

### <a id="jobMeta" href="#jobMeta">type jobMeta struct</a>

```
searchKey: server.jobMeta
```

```Go
type jobMeta struct {
	queueName string
	record    workerutil.Record
	tx        store.Store
	started   time.Time
}
```

### <a id="QueueMetrics" href="#QueueMetrics">type QueueMetrics struct</a>

```
searchKey: server.QueueMetrics
tags: [exported]
```

```Go
type QueueMetrics struct {
	NumJobs      *prometheus.GaugeVec
	NumExecutors *prometheus.GaugeVec
}
```

#### <a id="newQueueMetrics" href="#newQueueMetrics">func newQueueMetrics(observationContext *observation.Context) *QueueMetrics</a>

```
searchKey: server.newQueueMetrics
```

```Go
func newQueueMetrics(observationContext *observation.Context) *QueueMetrics
```

### <a id="errorResponse" href="#errorResponse">type errorResponse struct</a>

```
searchKey: server.errorResponse
```

```Go
type errorResponse struct {
	Error string `json:"error"`
}
```

### <a id="handlerWrapper" href="#handlerWrapper">type handlerWrapper struct</a>

```
searchKey: server.handlerWrapper
```

```Go
type handlerWrapper struct{ handler *handler }
```

#### <a id="handlerWrapper.Handle" href="#handlerWrapper.Handle">func (hw *handlerWrapper) Handle(ctx context.Context) error</a>

```
searchKey: server.handlerWrapper.Handle
```

```Go
func (hw *handlerWrapper) Handle(ctx context.Context) error
```

#### <a id="handlerWrapper.HandleError" href="#handlerWrapper.HandleError">func (hw *handlerWrapper) HandleError(err error)</a>

```
searchKey: server.handlerWrapper.HandleError
```

```Go
func (hw *handlerWrapper) HandleError(err error)
```

#### <a id="handlerWrapper.OnShutdown" href="#handlerWrapper.OnShutdown">func (hw *handlerWrapper) OnShutdown()</a>

```
searchKey: server.handlerWrapper.OnShutdown
```

```Go
func (hw *handlerWrapper) OnShutdown()
```

### <a id="testRecord" href="#testRecord">type testRecord struct</a>

```
searchKey: server.testRecord
```

```Go
type testRecord struct {
	ID      int
	Payload string
}
```

#### <a id="testRecord.RecordID" href="#testRecord.RecordID">func (r testRecord) RecordID() int</a>

```
searchKey: server.testRecord.RecordID
```

```Go
func (r testRecord) RecordID() int
```

## <a id="func" href="#func">Functions</a>

### <a id="NewServer" href="#NewServer">func NewServer(options Options, observationContext *observation.Context) goroutine.BackgroundRoutine</a>

```
searchKey: server.NewServer
tags: [exported]
```

```Go
func NewServer(options Options, observationContext *observation.Context) goroutine.BackgroundRoutine
```

NewServer returns an HTTP job queue server. 

### <a id="TestDequeue" href="#TestDequeue">func TestDequeue(t *testing.T)</a>

```
searchKey: server.TestDequeue
```

```Go
func TestDequeue(t *testing.T)
```

### <a id="TestDequeueNoRecord" href="#TestDequeueNoRecord">func TestDequeueNoRecord(t *testing.T)</a>

```
searchKey: server.TestDequeueNoRecord
```

```Go
func TestDequeueNoRecord(t *testing.T)
```

### <a id="TestDequeueUnknownQueue" href="#TestDequeueUnknownQueue">func TestDequeueUnknownQueue(t *testing.T)</a>

```
searchKey: server.TestDequeueUnknownQueue
```

```Go
func TestDequeueUnknownQueue(t *testing.T)
```

### <a id="TestDequeueMaxTransactions" href="#TestDequeueMaxTransactions">func TestDequeueMaxTransactions(t *testing.T)</a>

```
searchKey: server.TestDequeueMaxTransactions
```

```Go
func TestDequeueMaxTransactions(t *testing.T)
```

### <a id="TestAddExecutionLogEntry" href="#TestAddExecutionLogEntry">func TestAddExecutionLogEntry(t *testing.T)</a>

```
searchKey: server.TestAddExecutionLogEntry
```

```Go
func TestAddExecutionLogEntry(t *testing.T)
```

### <a id="TestAddExecutionLogEntryUnknownQueue" href="#TestAddExecutionLogEntryUnknownQueue">func TestAddExecutionLogEntryUnknownQueue(t *testing.T)</a>

```
searchKey: server.TestAddExecutionLogEntryUnknownQueue
```

```Go
func TestAddExecutionLogEntryUnknownQueue(t *testing.T)
```

### <a id="TestAddExecutionLogEntryUnknownJob" href="#TestAddExecutionLogEntryUnknownJob">func TestAddExecutionLogEntryUnknownJob(t *testing.T)</a>

```
searchKey: server.TestAddExecutionLogEntryUnknownJob
```

```Go
func TestAddExecutionLogEntryUnknownJob(t *testing.T)
```

### <a id="TestMarkComplete" href="#TestMarkComplete">func TestMarkComplete(t *testing.T)</a>

```
searchKey: server.TestMarkComplete
```

```Go
func TestMarkComplete(t *testing.T)
```

### <a id="TestMarkCompleteUnknownJob" href="#TestMarkCompleteUnknownJob">func TestMarkCompleteUnknownJob(t *testing.T)</a>

```
searchKey: server.TestMarkCompleteUnknownJob
```

```Go
func TestMarkCompleteUnknownJob(t *testing.T)
```

### <a id="TestMarkCompleteUnknownQueue" href="#TestMarkCompleteUnknownQueue">func TestMarkCompleteUnknownQueue(t *testing.T)</a>

```
searchKey: server.TestMarkCompleteUnknownQueue
```

```Go
func TestMarkCompleteUnknownQueue(t *testing.T)
```

### <a id="TestMarkErrored" href="#TestMarkErrored">func TestMarkErrored(t *testing.T)</a>

```
searchKey: server.TestMarkErrored
```

```Go
func TestMarkErrored(t *testing.T)
```

### <a id="TestMarkErroredUnknownJob" href="#TestMarkErroredUnknownJob">func TestMarkErroredUnknownJob(t *testing.T)</a>

```
searchKey: server.TestMarkErroredUnknownJob
```

```Go
func TestMarkErroredUnknownJob(t *testing.T)
```

### <a id="TestMarkErroredUnknownQueue" href="#TestMarkErroredUnknownQueue">func TestMarkErroredUnknownQueue(t *testing.T)</a>

```
searchKey: server.TestMarkErroredUnknownQueue
```

```Go
func TestMarkErroredUnknownQueue(t *testing.T)
```

### <a id="TestMarkFailed" href="#TestMarkFailed">func TestMarkFailed(t *testing.T)</a>

```
searchKey: server.TestMarkFailed
```

```Go
func TestMarkFailed(t *testing.T)
```

### <a id="TestHeartbeat" href="#TestHeartbeat">func TestHeartbeat(t *testing.T)</a>

```
searchKey: server.TestHeartbeat
```

```Go
func TestHeartbeat(t *testing.T)
```

### <a id="TestCleanup" href="#TestCleanup">func TestCleanup(t *testing.T)</a>

```
searchKey: server.TestCleanup
```

```Go
func TestCleanup(t *testing.T)
```

