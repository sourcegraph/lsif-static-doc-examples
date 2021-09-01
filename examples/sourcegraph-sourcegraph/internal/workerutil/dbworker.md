# Package dbworker

## Index

* Subpages
  * [internal/workerutil/dbworker/store](dbworker/store.md)
* [Variables](#var)
    * [var ErrNotConditions](#ErrNotConditions)
* [Types](#type)
    * [type Handler interface](#Handler)
    * [type HandlerFunc func(ctx context.Context, store github.com/sourcegraph/sourcegraph/internal/workerutil/dbworker/store.Store, record github.com/sourcegraph/sourcegraph/internal/workerutil.Record) error](#HandlerFunc)
        * [func (f HandlerFunc) Handle(ctx context.Context, store store.Store, record workerutil.Record) error](#HandlerFunc.Handle)
    * [type Resetter struct](#Resetter)
        * [func NewResetter(store store.Store, options ResetterOptions) *Resetter](#NewResetter)
        * [func newResetter(store store.Store, options ResetterOptions, clock glock.Clock) *Resetter](#newResetter)
        * [func (r *Resetter) Start()](#Resetter.Start)
        * [func (r *Resetter) Stop()](#Resetter.Stop)
    * [type ResetterMetrics struct](#ResetterMetrics)
    * [type ResetterOptions struct](#ResetterOptions)
    * [type handlerShim struct](#handlerShim)
        * [func (s *handlerShim) Handle(ctx context.Context, store workerutil.Store, record workerutil.Record) error](#handlerShim.Handle)
        * [func (s *handlerShim) PostHandle(ctx context.Context, record workerutil.Record)](#handlerShim.PostHandle)
        * [func (s *handlerShim) PreDequeue(ctx context.Context) (dequeueable bool, extraDequeueArguments interface{}, err error)](#handlerShim.PreDequeue)
        * [func (s *handlerShim) PreHandle(ctx context.Context, record workerutil.Record)](#handlerShim.PreHandle)
    * [type storeShim struct](#storeShim)
        * [func (s *storeShim) Dequeue(ctx context.Context, extraArguments interface{}) (workerutil.Record, workerutil.Store, bool, error)](#storeShim.Dequeue)
        * [func (s *storeShim) QueuedCount(ctx context.Context, extraArguments interface{}) (int, error)](#storeShim.QueuedCount)
* [Functions](#func)
    * [func NewWorker(ctx context.Context, store store.Store, handler Handler, options workerutil.WorkerOptions) *workerutil.Worker](#NewWorker)
    * [func TestResetter(t *testing.T)](#TestResetter)
    * [func convertArguments(v interface{}) ([]*sqlf.Query, error)](#convertArguments)
    * [func newHandlerShim(handler Handler) workerutil.Handler](#newHandlerShim)
    * [func newStoreShim(store store.Store) workerutil.Store](#newStoreShim)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ErrNotConditions" href="#ErrNotConditions">var ErrNotConditions</a>

```
searchKey: dbworker.ErrNotConditions
tags: [variable interface]
```

```Go
var ErrNotConditions = errors.New("expected slice of *sqlf.Query values")
```

ErrNotConditions occurs when a PreDequeue handler returns non-sql query extra arguments. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Handler" href="#Handler">type Handler interface</a>

```
searchKey: dbworker.Handler
tags: [interface]
```

```Go
type Handler interface {
	// Handle processes a single record. The store provided by this method is a store backed
	// by the transaction that is locking the given record. If use of a database is necessary
	// within this handler, other stores should take the underlying handler to keep work
	// within the same transaction.
	//
	//     func (h *handler) Handle(ctx context.Context, tx dbworker.Store, record workerutil.Record) error {
	//         myStore := h.myStore.With(tx) // combine store handles
	//         myRecord := record.(MyType)   // convert type of record
	//         // do processing ...
	//         return nil
	//     }
	Handle(ctx context.Context, store store.Store, record workerutil.Record) error
}
```

Handler is a version of workerutil.Handler that refines the store type. 

### <a id="HandlerFunc" href="#HandlerFunc">type HandlerFunc func(ctx context.Context, store github.com/sourcegraph/sourcegraph/internal/workerutil/dbworker/store.Store, record github.com/sourcegraph/sourcegraph/internal/workerutil.Record) error</a>

```
searchKey: dbworker.HandlerFunc
tags: [function]
```

```Go
type HandlerFunc func(ctx context.Context, store store.Store, record workerutil.Record) error
```

HandlerFunc is a function version of the Handler interface. 

#### <a id="HandlerFunc.Handle" href="#HandlerFunc.Handle">func (f HandlerFunc) Handle(ctx context.Context, store store.Store, record workerutil.Record) error</a>

```
searchKey: dbworker.HandlerFunc.Handle
tags: [method]
```

```Go
func (f HandlerFunc) Handle(ctx context.Context, store store.Store, record workerutil.Record) error
```

Handle processes a single record. See the Handler interface for additional details. 

### <a id="Resetter" href="#Resetter">type Resetter struct</a>

```
searchKey: dbworker.Resetter
tags: [struct]
```

```Go
type Resetter struct {
	store    store.Store
	options  ResetterOptions
	clock    glock.Clock
	ctx      context.Context // root context passed to the database
	cancel   func()          // cancels the root context
	finished chan struct{}   // signals that Start has finished
}
```

Resetter periodically moves all unlocked records that have been in the processing state for a while back to queued. 

An unlocked record signifies that it is not actively being processed and records in this state for more than a few seconds are very likely to be stuck after the worker processing them has crashed. 

#### <a id="NewResetter" href="#NewResetter">func NewResetter(store store.Store, options ResetterOptions) *Resetter</a>

```
searchKey: dbworker.NewResetter
tags: [function]
```

```Go
func NewResetter(store store.Store, options ResetterOptions) *Resetter
```

#### <a id="newResetter" href="#newResetter">func newResetter(store store.Store, options ResetterOptions, clock glock.Clock) *Resetter</a>

```
searchKey: dbworker.newResetter
tags: [function private]
```

```Go
func newResetter(store store.Store, options ResetterOptions, clock glock.Clock) *Resetter
```

#### <a id="Resetter.Start" href="#Resetter.Start">func (r *Resetter) Start()</a>

```
searchKey: dbworker.Resetter.Start
tags: [method]
```

```Go
func (r *Resetter) Start()
```

Start begins periodically calling reset stalled on the underlying store. 

#### <a id="Resetter.Stop" href="#Resetter.Stop">func (r *Resetter) Stop()</a>

```
searchKey: dbworker.Resetter.Stop
tags: [method]
```

```Go
func (r *Resetter) Stop()
```

Stop will cause the resetter loop to exit after the current iteration. 

### <a id="ResetterMetrics" href="#ResetterMetrics">type ResetterMetrics struct</a>

```
searchKey: dbworker.ResetterMetrics
tags: [struct]
```

```Go
type ResetterMetrics struct {
	RecordResets        prometheus.Counter
	RecordResetFailures prometheus.Counter
	Errors              prometheus.Counter
}
```

### <a id="ResetterOptions" href="#ResetterOptions">type ResetterOptions struct</a>

```
searchKey: dbworker.ResetterOptions
tags: [struct]
```

```Go
type ResetterOptions struct {
	Name     string
	Interval time.Duration
	Metrics  ResetterMetrics
}
```

### <a id="handlerShim" href="#handlerShim">type handlerShim struct</a>

```
searchKey: dbworker.handlerShim
tags: [struct private]
```

```Go
type handlerShim struct {
	Handler
}
```

handlerShim converts a Handler into a workerutil.Handler. 

#### <a id="handlerShim.Handle" href="#handlerShim.Handle">func (s *handlerShim) Handle(ctx context.Context, store workerutil.Store, record workerutil.Record) error</a>

```
searchKey: dbworker.handlerShim.Handle
tags: [method private]
```

```Go
func (s *handlerShim) Handle(ctx context.Context, store workerutil.Store, record workerutil.Record) error
```

Handle processes a single record. 

#### <a id="handlerShim.PostHandle" href="#handlerShim.PostHandle">func (s *handlerShim) PostHandle(ctx context.Context, record workerutil.Record)</a>

```
searchKey: dbworker.handlerShim.PostHandle
tags: [method private]
```

```Go
func (s *handlerShim) PostHandle(ctx context.Context, record workerutil.Record)
```

PostHandle calls into the inner handler if it implements the HandlerWithHooks interface. 

#### <a id="handlerShim.PreDequeue" href="#handlerShim.PreDequeue">func (s *handlerShim) PreDequeue(ctx context.Context) (dequeueable bool, extraDequeueArguments interface{}, err error)</a>

```
searchKey: dbworker.handlerShim.PreDequeue
tags: [method private]
```

```Go
func (s *handlerShim) PreDequeue(ctx context.Context) (dequeueable bool, extraDequeueArguments interface{}, err error)
```

PreDequeue calls into the inner handler if it implements the HandlerWithPreDequeue interface. 

#### <a id="handlerShim.PreHandle" href="#handlerShim.PreHandle">func (s *handlerShim) PreHandle(ctx context.Context, record workerutil.Record)</a>

```
searchKey: dbworker.handlerShim.PreHandle
tags: [method private]
```

```Go
func (s *handlerShim) PreHandle(ctx context.Context, record workerutil.Record)
```

PreHandle calls into the inner handler if it implements the HandlerWithHooks interface. 

### <a id="storeShim" href="#storeShim">type storeShim struct</a>

```
searchKey: dbworker.storeShim
tags: [struct private]
```

```Go
type storeShim struct {
	store.Store
}
```

storeShim converts a store.Store into a workerutil.Store. 

#### <a id="storeShim.Dequeue" href="#storeShim.Dequeue">func (s *storeShim) Dequeue(ctx context.Context, extraArguments interface{}) (workerutil.Record, workerutil.Store, bool, error)</a>

```
searchKey: dbworker.storeShim.Dequeue
tags: [method private]
```

```Go
func (s *storeShim) Dequeue(ctx context.Context, extraArguments interface{}) (workerutil.Record, workerutil.Store, bool, error)
```

Dequeue calls into the inner store. 

#### <a id="storeShim.QueuedCount" href="#storeShim.QueuedCount">func (s *storeShim) QueuedCount(ctx context.Context, extraArguments interface{}) (int, error)</a>

```
searchKey: dbworker.storeShim.QueuedCount
tags: [method private]
```

```Go
func (s *storeShim) QueuedCount(ctx context.Context, extraArguments interface{}) (int, error)
```

QueuedCount calls into the inner store. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="NewWorker" href="#NewWorker">func NewWorker(ctx context.Context, store store.Store, handler Handler, options workerutil.WorkerOptions) *workerutil.Worker</a>

```
searchKey: dbworker.NewWorker
tags: [function]
```

```Go
func NewWorker(ctx context.Context, store store.Store, handler Handler, options workerutil.WorkerOptions) *workerutil.Worker
```

### <a id="TestResetter" href="#TestResetter">func TestResetter(t *testing.T)</a>

```
searchKey: dbworker.TestResetter
tags: [function private test]
```

```Go
func TestResetter(t *testing.T)
```

### <a id="convertArguments" href="#convertArguments">func convertArguments(v interface{}) ([]*sqlf.Query, error)</a>

```
searchKey: dbworker.convertArguments
tags: [function private]
```

```Go
func convertArguments(v interface{}) ([]*sqlf.Query, error)
```

convertArguments converts the given interface value into a slice of *sqlf.Query values. 

### <a id="newHandlerShim" href="#newHandlerShim">func newHandlerShim(handler Handler) workerutil.Handler</a>

```
searchKey: dbworker.newHandlerShim
tags: [function private]
```

```Go
func newHandlerShim(handler Handler) workerutil.Handler
```

newHandlerShim wraps the given handler in a shim. 

### <a id="newStoreShim" href="#newStoreShim">func newStoreShim(store store.Store) workerutil.Store</a>

```
searchKey: dbworker.newStoreShim
tags: [function private]
```

```Go
func newStoreShim(store store.Store) workerutil.Store
```

newStoreShim wraps the given store in a shim. 

