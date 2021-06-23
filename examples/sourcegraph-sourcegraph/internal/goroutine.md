# Package goroutine

## Index

* [Variables](#var)
    * [var exiter](#exiter)
* [Types](#type)
    * [type StartableRoutine interface](#StartableRoutine)
    * [type BackgroundRoutine interface](#BackgroundRoutine)
        * [func NoopRoutine() BackgroundRoutine](#NoopRoutine)
    * [type CombinedRoutine []goroutine.BackgroundRoutine](#CombinedRoutine)
        * [func (r CombinedRoutine) Start()](#CombinedRoutine.Start)
        * [func (r CombinedRoutine) Stop()](#CombinedRoutine.Stop)
    * [type noopRoutine struct{}](#noopRoutine)
        * [func (r noopRoutine) Start()](#noopRoutine.Start)
        * [func (r noopRoutine) Stop()](#noopRoutine.Stop)
    * [type Bounded struct](#Bounded)
        * [func NewBounded(capacity int) *Bounded](#NewBounded)
        * [func (s *Bounded) Go(f func() error)](#Bounded.Go)
        * [func (s *Bounded) Wait() error](#Bounded.Wait)
    * [type PeriodicGoroutine struct](#PeriodicGoroutine)
        * [func NewPeriodicGoroutine(ctx context.Context, interval time.Duration, handler Handler) *PeriodicGoroutine](#NewPeriodicGoroutine)
        * [func NewPeriodicGoroutineWithMetrics(ctx context.Context, interval time.Duration, handler Handler, operation *observation.Operation) *PeriodicGoroutine](#NewPeriodicGoroutineWithMetrics)
        * [func newPeriodicGoroutine(ctx context.Context, interval time.Duration, handler Handler, operation *observation.Operation, clock glock.Clock) *PeriodicGoroutine](#newPeriodicGoroutine)
        * [func (r *PeriodicGoroutine) Start()](#PeriodicGoroutine.Start)
        * [func (r *PeriodicGoroutine) Stop()](#PeriodicGoroutine.Stop)
    * [type Handler interface](#Handler)
        * [func NewHandlerWithErrorMessage(name string, handler func(ctx context.Context) error) Handler](#NewHandlerWithErrorMessage)
    * [type ErrorHandler interface](#ErrorHandler)
    * [type Finalizer interface](#Finalizer)
    * [type HandlerFunc func(ctx context.Context) error](#HandlerFunc)
        * [func (f HandlerFunc) Handle(ctx context.Context) error](#HandlerFunc.Handle)
    * [type simpleHandler struct](#simpleHandler)
        * [func (h *simpleHandler) Handle(ctx context.Context) error](#simpleHandler.Handle)
        * [func (h *simpleHandler) HandleError(err error)](#simpleHandler.HandleError)
    * [type PoolWorker func(errs chan<- error)](#PoolWorker)
        * [func SimplePoolWorker(fn func() error) PoolWorker](#SimplePoolWorker)
        * [func indexedStringWorker(ch <-chan indexedString, worker func(index int, value string) error) PoolWorker](#indexedStringWorker)
    * [type indexedString struct](#indexedString)
    * [type exampleRoutine struct](#exampleRoutine)
        * [func (m *exampleRoutine) Start()](#exampleRoutine.Start)
        * [func (m *exampleRoutine) Stop()](#exampleRoutine.Stop)
    * [type closeOnError chan bool](#closeOnError)
        * [func (e closeOnError) Error() string](#closeOnError.Error)
    * [type MockBackgroundRoutine struct](#MockBackgroundRoutine)
        * [func NewMockBackgroundRoutine() *MockBackgroundRoutine](#NewMockBackgroundRoutine)
        * [func NewMockBackgroundRoutineFrom(i BackgroundRoutine) *MockBackgroundRoutine](#NewMockBackgroundRoutineFrom)
        * [func (m *MockBackgroundRoutine) Start()](#MockBackgroundRoutine.Start)
        * [func (m *MockBackgroundRoutine) Stop()](#MockBackgroundRoutine.Stop)
    * [type BackgroundRoutineStartFunc struct](#BackgroundRoutineStartFunc)
        * [func (f *BackgroundRoutineStartFunc) SetDefaultHook(hook func())](#BackgroundRoutineStartFunc.SetDefaultHook)
        * [func (f *BackgroundRoutineStartFunc) PushHook(hook func())](#BackgroundRoutineStartFunc.PushHook)
        * [func (f *BackgroundRoutineStartFunc) SetDefaultReturn()](#BackgroundRoutineStartFunc.SetDefaultReturn)
        * [func (f *BackgroundRoutineStartFunc) PushReturn()](#BackgroundRoutineStartFunc.PushReturn)
        * [func (f *BackgroundRoutineStartFunc) nextHook() func()](#BackgroundRoutineStartFunc.nextHook)
        * [func (f *BackgroundRoutineStartFunc) appendCall(r0 BackgroundRoutineStartFuncCall)](#BackgroundRoutineStartFunc.appendCall)
        * [func (f *BackgroundRoutineStartFunc) History() []BackgroundRoutineStartFuncCall](#BackgroundRoutineStartFunc.History)
    * [type BackgroundRoutineStartFuncCall struct{}](#BackgroundRoutineStartFuncCall)
        * [func (c BackgroundRoutineStartFuncCall) Args() []interface{}](#BackgroundRoutineStartFuncCall.Args)
        * [func (c BackgroundRoutineStartFuncCall) Results() []interface{}](#BackgroundRoutineStartFuncCall.Results)
    * [type BackgroundRoutineStopFunc struct](#BackgroundRoutineStopFunc)
        * [func (f *BackgroundRoutineStopFunc) SetDefaultHook(hook func())](#BackgroundRoutineStopFunc.SetDefaultHook)
        * [func (f *BackgroundRoutineStopFunc) PushHook(hook func())](#BackgroundRoutineStopFunc.PushHook)
        * [func (f *BackgroundRoutineStopFunc) SetDefaultReturn()](#BackgroundRoutineStopFunc.SetDefaultReturn)
        * [func (f *BackgroundRoutineStopFunc) PushReturn()](#BackgroundRoutineStopFunc.PushReturn)
        * [func (f *BackgroundRoutineStopFunc) nextHook() func()](#BackgroundRoutineStopFunc.nextHook)
        * [func (f *BackgroundRoutineStopFunc) appendCall(r0 BackgroundRoutineStopFuncCall)](#BackgroundRoutineStopFunc.appendCall)
        * [func (f *BackgroundRoutineStopFunc) History() []BackgroundRoutineStopFuncCall](#BackgroundRoutineStopFunc.History)
    * [type BackgroundRoutineStopFuncCall struct{}](#BackgroundRoutineStopFuncCall)
        * [func (c BackgroundRoutineStopFuncCall) Args() []interface{}](#BackgroundRoutineStopFuncCall.Args)
        * [func (c BackgroundRoutineStopFuncCall) Results() []interface{}](#BackgroundRoutineStopFuncCall.Results)
    * [type MockErrorHandler struct](#MockErrorHandler)
        * [func NewMockErrorHandler() *MockErrorHandler](#NewMockErrorHandler)
        * [func NewMockErrorHandlerFrom(i ErrorHandler) *MockErrorHandler](#NewMockErrorHandlerFrom)
        * [func (m *MockErrorHandler) HandleError(v0 error)](#MockErrorHandler.HandleError)
    * [type ErrorHandlerHandleErrorFunc struct](#ErrorHandlerHandleErrorFunc)
        * [func (f *ErrorHandlerHandleErrorFunc) SetDefaultHook(hook func(error))](#ErrorHandlerHandleErrorFunc.SetDefaultHook)
        * [func (f *ErrorHandlerHandleErrorFunc) PushHook(hook func(error))](#ErrorHandlerHandleErrorFunc.PushHook)
        * [func (f *ErrorHandlerHandleErrorFunc) SetDefaultReturn()](#ErrorHandlerHandleErrorFunc.SetDefaultReturn)
        * [func (f *ErrorHandlerHandleErrorFunc) PushReturn()](#ErrorHandlerHandleErrorFunc.PushReturn)
        * [func (f *ErrorHandlerHandleErrorFunc) nextHook() func(error)](#ErrorHandlerHandleErrorFunc.nextHook)
        * [func (f *ErrorHandlerHandleErrorFunc) appendCall(r0 ErrorHandlerHandleErrorFuncCall)](#ErrorHandlerHandleErrorFunc.appendCall)
        * [func (f *ErrorHandlerHandleErrorFunc) History() []ErrorHandlerHandleErrorFuncCall](#ErrorHandlerHandleErrorFunc.History)
    * [type ErrorHandlerHandleErrorFuncCall struct](#ErrorHandlerHandleErrorFuncCall)
        * [func (c ErrorHandlerHandleErrorFuncCall) Args() []interface{}](#ErrorHandlerHandleErrorFuncCall.Args)
        * [func (c ErrorHandlerHandleErrorFuncCall) Results() []interface{}](#ErrorHandlerHandleErrorFuncCall.Results)
    * [type MockFinalizer struct](#MockFinalizer)
        * [func NewMockFinalizer() *MockFinalizer](#NewMockFinalizer)
        * [func NewMockFinalizerFrom(i Finalizer) *MockFinalizer](#NewMockFinalizerFrom)
        * [func (m *MockFinalizer) OnShutdown()](#MockFinalizer.OnShutdown)
    * [type FinalizerOnShutdownFunc struct](#FinalizerOnShutdownFunc)
        * [func (f *FinalizerOnShutdownFunc) SetDefaultHook(hook func())](#FinalizerOnShutdownFunc.SetDefaultHook)
        * [func (f *FinalizerOnShutdownFunc) PushHook(hook func())](#FinalizerOnShutdownFunc.PushHook)
        * [func (f *FinalizerOnShutdownFunc) SetDefaultReturn()](#FinalizerOnShutdownFunc.SetDefaultReturn)
        * [func (f *FinalizerOnShutdownFunc) PushReturn()](#FinalizerOnShutdownFunc.PushReturn)
        * [func (f *FinalizerOnShutdownFunc) nextHook() func()](#FinalizerOnShutdownFunc.nextHook)
        * [func (f *FinalizerOnShutdownFunc) appendCall(r0 FinalizerOnShutdownFuncCall)](#FinalizerOnShutdownFunc.appendCall)
        * [func (f *FinalizerOnShutdownFunc) History() []FinalizerOnShutdownFuncCall](#FinalizerOnShutdownFunc.History)
    * [type FinalizerOnShutdownFuncCall struct{}](#FinalizerOnShutdownFuncCall)
        * [func (c FinalizerOnShutdownFuncCall) Args() []interface{}](#FinalizerOnShutdownFuncCall.Args)
        * [func (c FinalizerOnShutdownFuncCall) Results() []interface{}](#FinalizerOnShutdownFuncCall.Results)
    * [type MockHandler struct](#MockHandler)
        * [func NewMockHandler() *MockHandler](#NewMockHandler)
        * [func NewMockHandlerFrom(i Handler) *MockHandler](#NewMockHandlerFrom)
        * [func (m *MockHandler) Handle(v0 context.Context) error](#MockHandler.Handle)
    * [type HandlerHandleFunc struct](#HandlerHandleFunc)
        * [func (f *HandlerHandleFunc) SetDefaultHook(hook func(context.Context) error)](#HandlerHandleFunc.SetDefaultHook)
        * [func (f *HandlerHandleFunc) PushHook(hook func(context.Context) error)](#HandlerHandleFunc.PushHook)
        * [func (f *HandlerHandleFunc) SetDefaultReturn(r0 error)](#HandlerHandleFunc.SetDefaultReturn)
        * [func (f *HandlerHandleFunc) PushReturn(r0 error)](#HandlerHandleFunc.PushReturn)
        * [func (f *HandlerHandleFunc) nextHook() func(context.Context) error](#HandlerHandleFunc.nextHook)
        * [func (f *HandlerHandleFunc) appendCall(r0 HandlerHandleFuncCall)](#HandlerHandleFunc.appendCall)
        * [func (f *HandlerHandleFunc) History() []HandlerHandleFuncCall](#HandlerHandleFunc.History)
    * [type HandlerHandleFuncCall struct](#HandlerHandleFuncCall)
        * [func (c HandlerHandleFuncCall) Args() []interface{}](#HandlerHandleFuncCall.Args)
        * [func (c HandlerHandleFuncCall) Results() []interface{}](#HandlerHandleFuncCall.Results)
    * [type MockHandlerWithErrorHandler struct](#MockHandlerWithErrorHandler)
        * [func NewMockHandlerWithErrorHandler() *MockHandlerWithErrorHandler](#NewMockHandlerWithErrorHandler)
    * [type MockHandlerWithFinalizer struct](#MockHandlerWithFinalizer)
        * [func NewMockHandlerWithFinalizer() *MockHandlerWithFinalizer](#NewMockHandlerWithFinalizer)
* [Functions](#func)
    * [func MonitorBackgroundRoutines(ctx context.Context, routines ...BackgroundRoutine)](#MonitorBackgroundRoutines)
    * [func monitorBackgroundRoutines(ctx context.Context, signals <-chan os.Signal, routines ...BackgroundRoutine)](#monitorBackgroundRoutines)
    * [func startAll(wg *sync.WaitGroup, routines ...BackgroundRoutine)](#startAll)
    * [func stopAll(wg *sync.WaitGroup, routines ...BackgroundRoutine)](#stopAll)
    * [func waitForSignal(ctx context.Context, signals <-chan os.Signal)](#waitForSignal)
    * [func exitAfterSignals(signals <-chan os.Signal, numSignals int)](#exitAfterSignals)
    * [func Go(f func())](#Go)
    * [func Parallel(fns ...func() error) (err error)](#Parallel)
    * [func runPeriodicHandler(ctx context.Context, handler Handler, operation *observation.Operation) (_ bool, err error)](#runPeriodicHandler)
    * [func RunWorkers(worker PoolWorker) error](#RunWorkers)
    * [func RunWorkersN(n int, worker PoolWorker) (err error)](#RunWorkersN)
    * [func RunWorkersOverStrings(values []string, worker func(index int, value string) error) error](#RunWorkersOverStrings)
    * [func RunWorkersOverStringsN(n int, values []string, worker func(index int, value string) error) error](#RunWorkersOverStringsN)
    * [func loadIndexedStringChannel(values []string) <-chan indexedString](#loadIndexedStringChannel)
    * [func init()](#init.background_test.go)
    * [func TestMonitorBackgroundRoutinesSignal(t *testing.T)](#TestMonitorBackgroundRoutinesSignal)
    * [func TestMonitorBackgroundRoutinesContextCancel(t *testing.T)](#TestMonitorBackgroundRoutinesContextCancel)
    * [func TestBounded(t *testing.T)](#TestBounded)
    * [func TestBounded_error(t *testing.T)](#TestBounded_error)
    * [func ExampleBackgroundRoutine()](#ExampleBackgroundRoutine)
    * [func ExamplePeriodicGoroutine()](#ExamplePeriodicGoroutine)
    * [func TestGo(t *testing.T)](#TestGo)
    * [func TestParallel(t *testing.T)](#TestParallel)
    * [func TestPeriodicGoroutine(t *testing.T)](#TestPeriodicGoroutine)
    * [func TestPeriodicGoroutineError(t *testing.T)](#TestPeriodicGoroutineError)
    * [func TestPeriodicGoroutineContextError(t *testing.T)](#TestPeriodicGoroutineContextError)
    * [func TestPeriodicGoroutineFinalizer(t *testing.T)](#TestPeriodicGoroutineFinalizer)
    * [func TestRunWorkersN(t *testing.T)](#TestRunWorkersN)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="exiter" href="#exiter">var exiter</a>

```
searchKey: goroutine.exiter
tags: [private]
```

```Go
var exiter = func() { os.Exit(0) }
```

exiter exits the process with a status code of zero. This is declared here so it can be replaced by tests without risk of aborting the tests without a good indication to the calling program that the tests didn't in fact pass. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="StartableRoutine" href="#StartableRoutine">type StartableRoutine interface</a>

```
searchKey: goroutine.StartableRoutine
```

```Go
type StartableRoutine interface {
	// Start begins the long-running process. This routine may also implement
	// a Stop method that should signal this process the application is going
	// to shut down.
	Start()
}
```

StartableRoutine represents a component of a binary that consists of a long running process. 

### <a id="BackgroundRoutine" href="#BackgroundRoutine">type BackgroundRoutine interface</a>

```
searchKey: goroutine.BackgroundRoutine
```

```Go
type BackgroundRoutine interface {
	StartableRoutine

	// Stop signals the Start method to stop accepting new work and complete its
	// current work. This method can but is not required to block until Start has
	// returned.
	Stop()
}
```

BackgroundRoutine represents a component of a binary that consists of a long running process with a graceful shutdown mechanism. 

See [https://docs.sourcegraph.com/dev/background-information/backgroundroutine](https://docs.sourcegraph.com/dev/background-information/backgroundroutine) for more information and a step-by-step guide on how to implement a BackgroundRoutine. 

#### <a id="NoopRoutine" href="#NoopRoutine">func NoopRoutine() BackgroundRoutine</a>

```
searchKey: goroutine.NoopRoutine
```

```Go
func NoopRoutine() BackgroundRoutine
```

NoopRoutine does nothing for start or stop. 

### <a id="CombinedRoutine" href="#CombinedRoutine">type CombinedRoutine []goroutine.BackgroundRoutine</a>

```
searchKey: goroutine.CombinedRoutine
```

```Go
type CombinedRoutine []BackgroundRoutine
```

CombinedRoutine is a list of routines which are started and stopped in unison. 

#### <a id="CombinedRoutine.Start" href="#CombinedRoutine.Start">func (r CombinedRoutine) Start()</a>

```
searchKey: goroutine.CombinedRoutine.Start
```

```Go
func (r CombinedRoutine) Start()
```

#### <a id="CombinedRoutine.Stop" href="#CombinedRoutine.Stop">func (r CombinedRoutine) Stop()</a>

```
searchKey: goroutine.CombinedRoutine.Stop
```

```Go
func (r CombinedRoutine) Stop()
```

### <a id="noopRoutine" href="#noopRoutine">type noopRoutine struct{}</a>

```
searchKey: goroutine.noopRoutine
tags: [private]
```

```Go
type noopRoutine struct{}
```

#### <a id="noopRoutine.Start" href="#noopRoutine.Start">func (r noopRoutine) Start()</a>

```
searchKey: goroutine.noopRoutine.Start
tags: [private]
```

```Go
func (r noopRoutine) Start()
```

#### <a id="noopRoutine.Stop" href="#noopRoutine.Stop">func (r noopRoutine) Stop()</a>

```
searchKey: goroutine.noopRoutine.Stop
tags: [private]
```

```Go
func (r noopRoutine) Stop()
```

### <a id="Bounded" href="#Bounded">type Bounded struct</a>

```
searchKey: goroutine.Bounded
```

```Go
type Bounded struct {
	sema chan struct{}
	mu   sync.Mutex
	err  error
}
```

Bounded runs a bounded number of goroutines. It supports waiting for them all to run, as well as reporting any error that may occur. 

#### <a id="NewBounded" href="#NewBounded">func NewBounded(capacity int) *Bounded</a>

```
searchKey: goroutine.NewBounded
```

```Go
func NewBounded(capacity int) *Bounded
```

NewBounded initializes Bounded with a capacity. 

#### <a id="Bounded.Go" href="#Bounded.Go">func (s *Bounded) Go(f func() error)</a>

```
searchKey: goroutine.Bounded.Go
```

```Go
func (s *Bounded) Go(f func() error)
```

Go runs f in a new goroutine. It will only run upto Bounded.N goroutines at a time. Go will block until it can start the goroutine. 

The first f to return a non-nil error will have that error returned by Wait. If an f fails, this does not stop future runs. 

#### <a id="Bounded.Wait" href="#Bounded.Wait">func (s *Bounded) Wait() error</a>

```
searchKey: goroutine.Bounded.Wait
```

```Go
func (s *Bounded) Wait() error
```

Wait until all goroutines have finished running. If a goroutine returns a non-nil error, the first non-nil error recorded will be returned. 

### <a id="PeriodicGoroutine" href="#PeriodicGoroutine">type PeriodicGoroutine struct</a>

```
searchKey: goroutine.PeriodicGoroutine
```

```Go
type PeriodicGoroutine struct {
	interval  time.Duration
	handler   Handler
	operation *observation.Operation
	clock     glock.Clock
	ctx       context.Context    // root context passed to the handler
	cancel    context.CancelFunc // cancels the root context
	finished  chan struct{}      // signals that Start has finished
}
```

PeriodicGoroutine represents a goroutine whose main behavior is reinvoked periodically. 

See [https://docs.sourcegraph.com/dev/background-information/backgroundroutine](https://docs.sourcegraph.com/dev/background-information/backgroundroutine) for more information and a step-by-step guide on how to implement a PeriodicBackgroundRoutine. 

#### <a id="NewPeriodicGoroutine" href="#NewPeriodicGoroutine">func NewPeriodicGoroutine(ctx context.Context, interval time.Duration, handler Handler) *PeriodicGoroutine</a>

```
searchKey: goroutine.NewPeriodicGoroutine
```

```Go
func NewPeriodicGoroutine(ctx context.Context, interval time.Duration, handler Handler) *PeriodicGoroutine
```

NewPeriodicGoroutine creates a new PeriodicGoroutine with the given handler. 

#### <a id="NewPeriodicGoroutineWithMetrics" href="#NewPeriodicGoroutineWithMetrics">func NewPeriodicGoroutineWithMetrics(ctx context.Context, interval time.Duration, handler Handler, operation *observation.Operation) *PeriodicGoroutine</a>

```
searchKey: goroutine.NewPeriodicGoroutineWithMetrics
```

```Go
func NewPeriodicGoroutineWithMetrics(ctx context.Context, interval time.Duration, handler Handler, operation *observation.Operation) *PeriodicGoroutine
```

NewPeriodicGoroutine creates a new PeriodicGoroutine with the given handler. 

#### <a id="newPeriodicGoroutine" href="#newPeriodicGoroutine">func newPeriodicGoroutine(ctx context.Context, interval time.Duration, handler Handler, operation *observation.Operation, clock glock.Clock) *PeriodicGoroutine</a>

```
searchKey: goroutine.newPeriodicGoroutine
tags: [private]
```

```Go
func newPeriodicGoroutine(ctx context.Context, interval time.Duration, handler Handler, operation *observation.Operation, clock glock.Clock) *PeriodicGoroutine
```

#### <a id="PeriodicGoroutine.Start" href="#PeriodicGoroutine.Start">func (r *PeriodicGoroutine) Start()</a>

```
searchKey: goroutine.PeriodicGoroutine.Start
```

```Go
func (r *PeriodicGoroutine) Start()
```

Start begins the process of calling the registered handler in a loop. This process will wait the interval supplied at construction between invocations. 

#### <a id="PeriodicGoroutine.Stop" href="#PeriodicGoroutine.Stop">func (r *PeriodicGoroutine) Stop()</a>

```
searchKey: goroutine.PeriodicGoroutine.Stop
```

```Go
func (r *PeriodicGoroutine) Stop()
```

Stop will cancel the context passed to the handler function to stop the current iteration of work, then break the loop in the Start method so that no new work is accepted. This method blocks until Start has returned. 

### <a id="Handler" href="#Handler">type Handler interface</a>

```
searchKey: goroutine.Handler
```

```Go
type Handler interface {
	// Handle performs an action with the given context.
	Handle(ctx context.Context) error
}
```

Handler represents the main behavior of a PeriodicGoroutine. 

#### <a id="NewHandlerWithErrorMessage" href="#NewHandlerWithErrorMessage">func NewHandlerWithErrorMessage(name string, handler func(ctx context.Context) error) Handler</a>

```
searchKey: goroutine.NewHandlerWithErrorMessage
```

```Go
func NewHandlerWithErrorMessage(name string, handler func(ctx context.Context) error) Handler
```

NewHandlerWithErrorMessage wraps the given function to be used as a handler, and prints a canned failure message containing the given name. 

### <a id="ErrorHandler" href="#ErrorHandler">type ErrorHandler interface</a>

```
searchKey: goroutine.ErrorHandler
```

```Go
type ErrorHandler interface {
	// HandleError is called with error values returned from Handle. This will not
	// be called with error values due to a context cancellation during a graceful
	// shutdown.
	HandleError(err error)
}
```

ErrorHandler is an optional extension of the Handler interface. 

### <a id="Finalizer" href="#Finalizer">type Finalizer interface</a>

```
searchKey: goroutine.Finalizer
```

```Go
type Finalizer interface {
	// OnShutdown is called after the last call to Handle during a graceful shutdown.
	OnShutdown()
}
```

Finalizer is an optional extension of the Handler interface. 

### <a id="HandlerFunc" href="#HandlerFunc">type HandlerFunc func(ctx context.Context) error</a>

```
searchKey: goroutine.HandlerFunc
```

```Go
type HandlerFunc func(ctx context.Context) error
```

HandlerFunc wraps a function so it can be used as a Handler. 

#### <a id="HandlerFunc.Handle" href="#HandlerFunc.Handle">func (f HandlerFunc) Handle(ctx context.Context) error</a>

```
searchKey: goroutine.HandlerFunc.Handle
```

```Go
func (f HandlerFunc) Handle(ctx context.Context) error
```

### <a id="simpleHandler" href="#simpleHandler">type simpleHandler struct</a>

```
searchKey: goroutine.simpleHandler
tags: [private]
```

```Go
type simpleHandler struct {
	name    string
	handler HandlerFunc
}
```

#### <a id="simpleHandler.Handle" href="#simpleHandler.Handle">func (h *simpleHandler) Handle(ctx context.Context) error</a>

```
searchKey: goroutine.simpleHandler.Handle
tags: [private]
```

```Go
func (h *simpleHandler) Handle(ctx context.Context) error
```

#### <a id="simpleHandler.HandleError" href="#simpleHandler.HandleError">func (h *simpleHandler) HandleError(err error)</a>

```
searchKey: goroutine.simpleHandler.HandleError
tags: [private]
```

```Go
func (h *simpleHandler) HandleError(err error)
```

### <a id="PoolWorker" href="#PoolWorker">type PoolWorker func(errs chan<- error)</a>

```
searchKey: goroutine.PoolWorker
```

```Go
type PoolWorker func(errs chan<- error)
```

Pool worker is a function invoked by RunWorkers that sends any errors that occur during execution down a shared channel. 

#### <a id="SimplePoolWorker" href="#SimplePoolWorker">func SimplePoolWorker(fn func() error) PoolWorker</a>

```
searchKey: goroutine.SimplePoolWorker
```

```Go
func SimplePoolWorker(fn func() error) PoolWorker
```

SimplePoolWorker converts a function returning a single error value into a PoolWorker. 

#### <a id="indexedStringWorker" href="#indexedStringWorker">func indexedStringWorker(ch <-chan indexedString, worker func(index int, value string) error) PoolWorker</a>

```
searchKey: goroutine.indexedStringWorker
tags: [private]
```

```Go
func indexedStringWorker(ch <-chan indexedString, worker func(index int, value string) error) PoolWorker
```

### <a id="indexedString" href="#indexedString">type indexedString struct</a>

```
searchKey: goroutine.indexedString
tags: [private]
```

```Go
type indexedString struct {
	Index int
	Value string
}
```

### <a id="exampleRoutine" href="#exampleRoutine">type exampleRoutine struct</a>

```
searchKey: goroutine.exampleRoutine
tags: [private]
```

```Go
type exampleRoutine struct {
	done chan struct{}
}
```

#### <a id="exampleRoutine.Start" href="#exampleRoutine.Start">func (m *exampleRoutine) Start()</a>

```
searchKey: goroutine.exampleRoutine.Start
tags: [private]
```

```Go
func (m *exampleRoutine) Start()
```

#### <a id="exampleRoutine.Stop" href="#exampleRoutine.Stop">func (m *exampleRoutine) Stop()</a>

```
searchKey: goroutine.exampleRoutine.Stop
tags: [private]
```

```Go
func (m *exampleRoutine) Stop()
```

### <a id="closeOnError" href="#closeOnError">type closeOnError chan bool</a>

```
searchKey: goroutine.closeOnError
tags: [private]
```

```Go
type closeOnError chan bool
```

#### <a id="closeOnError.Error" href="#closeOnError.Error">func (e closeOnError) Error() string</a>

```
searchKey: goroutine.closeOnError.Error
tags: [private]
```

```Go
func (e closeOnError) Error() string
```

### <a id="MockBackgroundRoutine" href="#MockBackgroundRoutine">type MockBackgroundRoutine struct</a>

```
searchKey: goroutine.MockBackgroundRoutine
tags: [private]
```

```Go
type MockBackgroundRoutine struct {
	// StartFunc is an instance of a mock function object controlling the
	// behavior of the method Start.
	StartFunc *BackgroundRoutineStartFunc
	// StopFunc is an instance of a mock function object controlling the
	// behavior of the method Stop.
	StopFunc *BackgroundRoutineStopFunc
}
```

MockBackgroundRoutine is a mock implementation of the BackgroundRoutine interface (from the package github.com/sourcegraph/sourcegraph/internal/goroutine) used for unit testing. 

#### <a id="NewMockBackgroundRoutine" href="#NewMockBackgroundRoutine">func NewMockBackgroundRoutine() *MockBackgroundRoutine</a>

```
searchKey: goroutine.NewMockBackgroundRoutine
tags: [private]
```

```Go
func NewMockBackgroundRoutine() *MockBackgroundRoutine
```

NewMockBackgroundRoutine creates a new mock of the BackgroundRoutine interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockBackgroundRoutineFrom" href="#NewMockBackgroundRoutineFrom">func NewMockBackgroundRoutineFrom(i BackgroundRoutine) *MockBackgroundRoutine</a>

```
searchKey: goroutine.NewMockBackgroundRoutineFrom
tags: [private]
```

```Go
func NewMockBackgroundRoutineFrom(i BackgroundRoutine) *MockBackgroundRoutine
```

NewMockBackgroundRoutineFrom creates a new mock of the MockBackgroundRoutine interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockBackgroundRoutine.Start" href="#MockBackgroundRoutine.Start">func (m *MockBackgroundRoutine) Start()</a>

```
searchKey: goroutine.MockBackgroundRoutine.Start
tags: [private]
```

```Go
func (m *MockBackgroundRoutine) Start()
```

Start delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockBackgroundRoutine.Stop" href="#MockBackgroundRoutine.Stop">func (m *MockBackgroundRoutine) Stop()</a>

```
searchKey: goroutine.MockBackgroundRoutine.Stop
tags: [private]
```

```Go
func (m *MockBackgroundRoutine) Stop()
```

Stop delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="BackgroundRoutineStartFunc" href="#BackgroundRoutineStartFunc">type BackgroundRoutineStartFunc struct</a>

```
searchKey: goroutine.BackgroundRoutineStartFunc
tags: [private]
```

```Go
type BackgroundRoutineStartFunc struct {
	defaultHook func()
	hooks       []func()
	history     []BackgroundRoutineStartFuncCall
	mutex       sync.Mutex
}
```

BackgroundRoutineStartFunc describes the behavior when the Start method of the parent MockBackgroundRoutine instance is invoked. 

#### <a id="BackgroundRoutineStartFunc.SetDefaultHook" href="#BackgroundRoutineStartFunc.SetDefaultHook">func (f *BackgroundRoutineStartFunc) SetDefaultHook(hook func())</a>

```
searchKey: goroutine.BackgroundRoutineStartFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *BackgroundRoutineStartFunc) SetDefaultHook(hook func())
```

SetDefaultHook sets function that is called when the Start method of the parent MockBackgroundRoutine instance is invoked and the hook queue is empty. 

#### <a id="BackgroundRoutineStartFunc.PushHook" href="#BackgroundRoutineStartFunc.PushHook">func (f *BackgroundRoutineStartFunc) PushHook(hook func())</a>

```
searchKey: goroutine.BackgroundRoutineStartFunc.PushHook
tags: [private]
```

```Go
func (f *BackgroundRoutineStartFunc) PushHook(hook func())
```

PushHook adds a function to the end of hook queue. Each invocation of the Start method of the parent MockBackgroundRoutine instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="BackgroundRoutineStartFunc.SetDefaultReturn" href="#BackgroundRoutineStartFunc.SetDefaultReturn">func (f *BackgroundRoutineStartFunc) SetDefaultReturn()</a>

```
searchKey: goroutine.BackgroundRoutineStartFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *BackgroundRoutineStartFunc) SetDefaultReturn()
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="BackgroundRoutineStartFunc.PushReturn" href="#BackgroundRoutineStartFunc.PushReturn">func (f *BackgroundRoutineStartFunc) PushReturn()</a>

```
searchKey: goroutine.BackgroundRoutineStartFunc.PushReturn
tags: [private]
```

```Go
func (f *BackgroundRoutineStartFunc) PushReturn()
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="BackgroundRoutineStartFunc.nextHook" href="#BackgroundRoutineStartFunc.nextHook">func (f *BackgroundRoutineStartFunc) nextHook() func()</a>

```
searchKey: goroutine.BackgroundRoutineStartFunc.nextHook
tags: [private]
```

```Go
func (f *BackgroundRoutineStartFunc) nextHook() func()
```

#### <a id="BackgroundRoutineStartFunc.appendCall" href="#BackgroundRoutineStartFunc.appendCall">func (f *BackgroundRoutineStartFunc) appendCall(r0 BackgroundRoutineStartFuncCall)</a>

```
searchKey: goroutine.BackgroundRoutineStartFunc.appendCall
tags: [private]
```

```Go
func (f *BackgroundRoutineStartFunc) appendCall(r0 BackgroundRoutineStartFuncCall)
```

#### <a id="BackgroundRoutineStartFunc.History" href="#BackgroundRoutineStartFunc.History">func (f *BackgroundRoutineStartFunc) History() []BackgroundRoutineStartFuncCall</a>

```
searchKey: goroutine.BackgroundRoutineStartFunc.History
tags: [private]
```

```Go
func (f *BackgroundRoutineStartFunc) History() []BackgroundRoutineStartFuncCall
```

History returns a sequence of BackgroundRoutineStartFuncCall objects describing the invocations of this function. 

### <a id="BackgroundRoutineStartFuncCall" href="#BackgroundRoutineStartFuncCall">type BackgroundRoutineStartFuncCall struct{}</a>

```
searchKey: goroutine.BackgroundRoutineStartFuncCall
tags: [private]
```

```Go
type BackgroundRoutineStartFuncCall struct{}
```

BackgroundRoutineStartFuncCall is an object that describes an invocation of method Start on an instance of MockBackgroundRoutine. 

#### <a id="BackgroundRoutineStartFuncCall.Args" href="#BackgroundRoutineStartFuncCall.Args">func (c BackgroundRoutineStartFuncCall) Args() []interface{}</a>

```
searchKey: goroutine.BackgroundRoutineStartFuncCall.Args
tags: [private]
```

```Go
func (c BackgroundRoutineStartFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="BackgroundRoutineStartFuncCall.Results" href="#BackgroundRoutineStartFuncCall.Results">func (c BackgroundRoutineStartFuncCall) Results() []interface{}</a>

```
searchKey: goroutine.BackgroundRoutineStartFuncCall.Results
tags: [private]
```

```Go
func (c BackgroundRoutineStartFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="BackgroundRoutineStopFunc" href="#BackgroundRoutineStopFunc">type BackgroundRoutineStopFunc struct</a>

```
searchKey: goroutine.BackgroundRoutineStopFunc
tags: [private]
```

```Go
type BackgroundRoutineStopFunc struct {
	defaultHook func()
	hooks       []func()
	history     []BackgroundRoutineStopFuncCall
	mutex       sync.Mutex
}
```

BackgroundRoutineStopFunc describes the behavior when the Stop method of the parent MockBackgroundRoutine instance is invoked. 

#### <a id="BackgroundRoutineStopFunc.SetDefaultHook" href="#BackgroundRoutineStopFunc.SetDefaultHook">func (f *BackgroundRoutineStopFunc) SetDefaultHook(hook func())</a>

```
searchKey: goroutine.BackgroundRoutineStopFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *BackgroundRoutineStopFunc) SetDefaultHook(hook func())
```

SetDefaultHook sets function that is called when the Stop method of the parent MockBackgroundRoutine instance is invoked and the hook queue is empty. 

#### <a id="BackgroundRoutineStopFunc.PushHook" href="#BackgroundRoutineStopFunc.PushHook">func (f *BackgroundRoutineStopFunc) PushHook(hook func())</a>

```
searchKey: goroutine.BackgroundRoutineStopFunc.PushHook
tags: [private]
```

```Go
func (f *BackgroundRoutineStopFunc) PushHook(hook func())
```

PushHook adds a function to the end of hook queue. Each invocation of the Stop method of the parent MockBackgroundRoutine instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="BackgroundRoutineStopFunc.SetDefaultReturn" href="#BackgroundRoutineStopFunc.SetDefaultReturn">func (f *BackgroundRoutineStopFunc) SetDefaultReturn()</a>

```
searchKey: goroutine.BackgroundRoutineStopFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *BackgroundRoutineStopFunc) SetDefaultReturn()
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="BackgroundRoutineStopFunc.PushReturn" href="#BackgroundRoutineStopFunc.PushReturn">func (f *BackgroundRoutineStopFunc) PushReturn()</a>

```
searchKey: goroutine.BackgroundRoutineStopFunc.PushReturn
tags: [private]
```

```Go
func (f *BackgroundRoutineStopFunc) PushReturn()
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="BackgroundRoutineStopFunc.nextHook" href="#BackgroundRoutineStopFunc.nextHook">func (f *BackgroundRoutineStopFunc) nextHook() func()</a>

```
searchKey: goroutine.BackgroundRoutineStopFunc.nextHook
tags: [private]
```

```Go
func (f *BackgroundRoutineStopFunc) nextHook() func()
```

#### <a id="BackgroundRoutineStopFunc.appendCall" href="#BackgroundRoutineStopFunc.appendCall">func (f *BackgroundRoutineStopFunc) appendCall(r0 BackgroundRoutineStopFuncCall)</a>

```
searchKey: goroutine.BackgroundRoutineStopFunc.appendCall
tags: [private]
```

```Go
func (f *BackgroundRoutineStopFunc) appendCall(r0 BackgroundRoutineStopFuncCall)
```

#### <a id="BackgroundRoutineStopFunc.History" href="#BackgroundRoutineStopFunc.History">func (f *BackgroundRoutineStopFunc) History() []BackgroundRoutineStopFuncCall</a>

```
searchKey: goroutine.BackgroundRoutineStopFunc.History
tags: [private]
```

```Go
func (f *BackgroundRoutineStopFunc) History() []BackgroundRoutineStopFuncCall
```

History returns a sequence of BackgroundRoutineStopFuncCall objects describing the invocations of this function. 

### <a id="BackgroundRoutineStopFuncCall" href="#BackgroundRoutineStopFuncCall">type BackgroundRoutineStopFuncCall struct{}</a>

```
searchKey: goroutine.BackgroundRoutineStopFuncCall
tags: [private]
```

```Go
type BackgroundRoutineStopFuncCall struct{}
```

BackgroundRoutineStopFuncCall is an object that describes an invocation of method Stop on an instance of MockBackgroundRoutine. 

#### <a id="BackgroundRoutineStopFuncCall.Args" href="#BackgroundRoutineStopFuncCall.Args">func (c BackgroundRoutineStopFuncCall) Args() []interface{}</a>

```
searchKey: goroutine.BackgroundRoutineStopFuncCall.Args
tags: [private]
```

```Go
func (c BackgroundRoutineStopFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="BackgroundRoutineStopFuncCall.Results" href="#BackgroundRoutineStopFuncCall.Results">func (c BackgroundRoutineStopFuncCall) Results() []interface{}</a>

```
searchKey: goroutine.BackgroundRoutineStopFuncCall.Results
tags: [private]
```

```Go
func (c BackgroundRoutineStopFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockErrorHandler" href="#MockErrorHandler">type MockErrorHandler struct</a>

```
searchKey: goroutine.MockErrorHandler
tags: [private]
```

```Go
type MockErrorHandler struct {
	// HandleErrorFunc is an instance of a mock function object controlling
	// the behavior of the method HandleError.
	HandleErrorFunc *ErrorHandlerHandleErrorFunc
}
```

MockErrorHandler is a mock implementation of the ErrorHandler interface (from the package github.com/sourcegraph/sourcegraph/internal/goroutine) used for unit testing. 

#### <a id="NewMockErrorHandler" href="#NewMockErrorHandler">func NewMockErrorHandler() *MockErrorHandler</a>

```
searchKey: goroutine.NewMockErrorHandler
tags: [private]
```

```Go
func NewMockErrorHandler() *MockErrorHandler
```

NewMockErrorHandler creates a new mock of the ErrorHandler interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockErrorHandlerFrom" href="#NewMockErrorHandlerFrom">func NewMockErrorHandlerFrom(i ErrorHandler) *MockErrorHandler</a>

```
searchKey: goroutine.NewMockErrorHandlerFrom
tags: [private]
```

```Go
func NewMockErrorHandlerFrom(i ErrorHandler) *MockErrorHandler
```

NewMockErrorHandlerFrom creates a new mock of the MockErrorHandler interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockErrorHandler.HandleError" href="#MockErrorHandler.HandleError">func (m *MockErrorHandler) HandleError(v0 error)</a>

```
searchKey: goroutine.MockErrorHandler.HandleError
tags: [private]
```

```Go
func (m *MockErrorHandler) HandleError(v0 error)
```

HandleError delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="ErrorHandlerHandleErrorFunc" href="#ErrorHandlerHandleErrorFunc">type ErrorHandlerHandleErrorFunc struct</a>

```
searchKey: goroutine.ErrorHandlerHandleErrorFunc
tags: [private]
```

```Go
type ErrorHandlerHandleErrorFunc struct {
	defaultHook func(error)
	hooks       []func(error)
	history     []ErrorHandlerHandleErrorFuncCall
	mutex       sync.Mutex
}
```

ErrorHandlerHandleErrorFunc describes the behavior when the HandleError method of the parent MockErrorHandler instance is invoked. 

#### <a id="ErrorHandlerHandleErrorFunc.SetDefaultHook" href="#ErrorHandlerHandleErrorFunc.SetDefaultHook">func (f *ErrorHandlerHandleErrorFunc) SetDefaultHook(hook func(error))</a>

```
searchKey: goroutine.ErrorHandlerHandleErrorFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *ErrorHandlerHandleErrorFunc) SetDefaultHook(hook func(error))
```

SetDefaultHook sets function that is called when the HandleError method of the parent MockErrorHandler instance is invoked and the hook queue is empty. 

#### <a id="ErrorHandlerHandleErrorFunc.PushHook" href="#ErrorHandlerHandleErrorFunc.PushHook">func (f *ErrorHandlerHandleErrorFunc) PushHook(hook func(error))</a>

```
searchKey: goroutine.ErrorHandlerHandleErrorFunc.PushHook
tags: [private]
```

```Go
func (f *ErrorHandlerHandleErrorFunc) PushHook(hook func(error))
```

PushHook adds a function to the end of hook queue. Each invocation of the HandleError method of the parent MockErrorHandler instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="ErrorHandlerHandleErrorFunc.SetDefaultReturn" href="#ErrorHandlerHandleErrorFunc.SetDefaultReturn">func (f *ErrorHandlerHandleErrorFunc) SetDefaultReturn()</a>

```
searchKey: goroutine.ErrorHandlerHandleErrorFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *ErrorHandlerHandleErrorFunc) SetDefaultReturn()
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="ErrorHandlerHandleErrorFunc.PushReturn" href="#ErrorHandlerHandleErrorFunc.PushReturn">func (f *ErrorHandlerHandleErrorFunc) PushReturn()</a>

```
searchKey: goroutine.ErrorHandlerHandleErrorFunc.PushReturn
tags: [private]
```

```Go
func (f *ErrorHandlerHandleErrorFunc) PushReturn()
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="ErrorHandlerHandleErrorFunc.nextHook" href="#ErrorHandlerHandleErrorFunc.nextHook">func (f *ErrorHandlerHandleErrorFunc) nextHook() func(error)</a>

```
searchKey: goroutine.ErrorHandlerHandleErrorFunc.nextHook
tags: [private]
```

```Go
func (f *ErrorHandlerHandleErrorFunc) nextHook() func(error)
```

#### <a id="ErrorHandlerHandleErrorFunc.appendCall" href="#ErrorHandlerHandleErrorFunc.appendCall">func (f *ErrorHandlerHandleErrorFunc) appendCall(r0 ErrorHandlerHandleErrorFuncCall)</a>

```
searchKey: goroutine.ErrorHandlerHandleErrorFunc.appendCall
tags: [private]
```

```Go
func (f *ErrorHandlerHandleErrorFunc) appendCall(r0 ErrorHandlerHandleErrorFuncCall)
```

#### <a id="ErrorHandlerHandleErrorFunc.History" href="#ErrorHandlerHandleErrorFunc.History">func (f *ErrorHandlerHandleErrorFunc) History() []ErrorHandlerHandleErrorFuncCall</a>

```
searchKey: goroutine.ErrorHandlerHandleErrorFunc.History
tags: [private]
```

```Go
func (f *ErrorHandlerHandleErrorFunc) History() []ErrorHandlerHandleErrorFuncCall
```

History returns a sequence of ErrorHandlerHandleErrorFuncCall objects describing the invocations of this function. 

### <a id="ErrorHandlerHandleErrorFuncCall" href="#ErrorHandlerHandleErrorFuncCall">type ErrorHandlerHandleErrorFuncCall struct</a>

```
searchKey: goroutine.ErrorHandlerHandleErrorFuncCall
tags: [private]
```

```Go
type ErrorHandlerHandleErrorFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 error
}
```

ErrorHandlerHandleErrorFuncCall is an object that describes an invocation of method HandleError on an instance of MockErrorHandler. 

#### <a id="ErrorHandlerHandleErrorFuncCall.Args" href="#ErrorHandlerHandleErrorFuncCall.Args">func (c ErrorHandlerHandleErrorFuncCall) Args() []interface{}</a>

```
searchKey: goroutine.ErrorHandlerHandleErrorFuncCall.Args
tags: [private]
```

```Go
func (c ErrorHandlerHandleErrorFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="ErrorHandlerHandleErrorFuncCall.Results" href="#ErrorHandlerHandleErrorFuncCall.Results">func (c ErrorHandlerHandleErrorFuncCall) Results() []interface{}</a>

```
searchKey: goroutine.ErrorHandlerHandleErrorFuncCall.Results
tags: [private]
```

```Go
func (c ErrorHandlerHandleErrorFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockFinalizer" href="#MockFinalizer">type MockFinalizer struct</a>

```
searchKey: goroutine.MockFinalizer
tags: [private]
```

```Go
type MockFinalizer struct {
	// OnShutdownFunc is an instance of a mock function object controlling
	// the behavior of the method OnShutdown.
	OnShutdownFunc *FinalizerOnShutdownFunc
}
```

MockFinalizer is a mock implementation of the Finalizer interface (from the package github.com/sourcegraph/sourcegraph/internal/goroutine) used for unit testing. 

#### <a id="NewMockFinalizer" href="#NewMockFinalizer">func NewMockFinalizer() *MockFinalizer</a>

```
searchKey: goroutine.NewMockFinalizer
tags: [private]
```

```Go
func NewMockFinalizer() *MockFinalizer
```

NewMockFinalizer creates a new mock of the Finalizer interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockFinalizerFrom" href="#NewMockFinalizerFrom">func NewMockFinalizerFrom(i Finalizer) *MockFinalizer</a>

```
searchKey: goroutine.NewMockFinalizerFrom
tags: [private]
```

```Go
func NewMockFinalizerFrom(i Finalizer) *MockFinalizer
```

NewMockFinalizerFrom creates a new mock of the MockFinalizer interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockFinalizer.OnShutdown" href="#MockFinalizer.OnShutdown">func (m *MockFinalizer) OnShutdown()</a>

```
searchKey: goroutine.MockFinalizer.OnShutdown
tags: [private]
```

```Go
func (m *MockFinalizer) OnShutdown()
```

OnShutdown delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="FinalizerOnShutdownFunc" href="#FinalizerOnShutdownFunc">type FinalizerOnShutdownFunc struct</a>

```
searchKey: goroutine.FinalizerOnShutdownFunc
tags: [private]
```

```Go
type FinalizerOnShutdownFunc struct {
	defaultHook func()
	hooks       []func()
	history     []FinalizerOnShutdownFuncCall
	mutex       sync.Mutex
}
```

FinalizerOnShutdownFunc describes the behavior when the OnShutdown method of the parent MockFinalizer instance is invoked. 

#### <a id="FinalizerOnShutdownFunc.SetDefaultHook" href="#FinalizerOnShutdownFunc.SetDefaultHook">func (f *FinalizerOnShutdownFunc) SetDefaultHook(hook func())</a>

```
searchKey: goroutine.FinalizerOnShutdownFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *FinalizerOnShutdownFunc) SetDefaultHook(hook func())
```

SetDefaultHook sets function that is called when the OnShutdown method of the parent MockFinalizer instance is invoked and the hook queue is empty. 

#### <a id="FinalizerOnShutdownFunc.PushHook" href="#FinalizerOnShutdownFunc.PushHook">func (f *FinalizerOnShutdownFunc) PushHook(hook func())</a>

```
searchKey: goroutine.FinalizerOnShutdownFunc.PushHook
tags: [private]
```

```Go
func (f *FinalizerOnShutdownFunc) PushHook(hook func())
```

PushHook adds a function to the end of hook queue. Each invocation of the OnShutdown method of the parent MockFinalizer instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="FinalizerOnShutdownFunc.SetDefaultReturn" href="#FinalizerOnShutdownFunc.SetDefaultReturn">func (f *FinalizerOnShutdownFunc) SetDefaultReturn()</a>

```
searchKey: goroutine.FinalizerOnShutdownFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *FinalizerOnShutdownFunc) SetDefaultReturn()
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="FinalizerOnShutdownFunc.PushReturn" href="#FinalizerOnShutdownFunc.PushReturn">func (f *FinalizerOnShutdownFunc) PushReturn()</a>

```
searchKey: goroutine.FinalizerOnShutdownFunc.PushReturn
tags: [private]
```

```Go
func (f *FinalizerOnShutdownFunc) PushReturn()
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="FinalizerOnShutdownFunc.nextHook" href="#FinalizerOnShutdownFunc.nextHook">func (f *FinalizerOnShutdownFunc) nextHook() func()</a>

```
searchKey: goroutine.FinalizerOnShutdownFunc.nextHook
tags: [private]
```

```Go
func (f *FinalizerOnShutdownFunc) nextHook() func()
```

#### <a id="FinalizerOnShutdownFunc.appendCall" href="#FinalizerOnShutdownFunc.appendCall">func (f *FinalizerOnShutdownFunc) appendCall(r0 FinalizerOnShutdownFuncCall)</a>

```
searchKey: goroutine.FinalizerOnShutdownFunc.appendCall
tags: [private]
```

```Go
func (f *FinalizerOnShutdownFunc) appendCall(r0 FinalizerOnShutdownFuncCall)
```

#### <a id="FinalizerOnShutdownFunc.History" href="#FinalizerOnShutdownFunc.History">func (f *FinalizerOnShutdownFunc) History() []FinalizerOnShutdownFuncCall</a>

```
searchKey: goroutine.FinalizerOnShutdownFunc.History
tags: [private]
```

```Go
func (f *FinalizerOnShutdownFunc) History() []FinalizerOnShutdownFuncCall
```

History returns a sequence of FinalizerOnShutdownFuncCall objects describing the invocations of this function. 

### <a id="FinalizerOnShutdownFuncCall" href="#FinalizerOnShutdownFuncCall">type FinalizerOnShutdownFuncCall struct{}</a>

```
searchKey: goroutine.FinalizerOnShutdownFuncCall
tags: [private]
```

```Go
type FinalizerOnShutdownFuncCall struct{}
```

FinalizerOnShutdownFuncCall is an object that describes an invocation of method OnShutdown on an instance of MockFinalizer. 

#### <a id="FinalizerOnShutdownFuncCall.Args" href="#FinalizerOnShutdownFuncCall.Args">func (c FinalizerOnShutdownFuncCall) Args() []interface{}</a>

```
searchKey: goroutine.FinalizerOnShutdownFuncCall.Args
tags: [private]
```

```Go
func (c FinalizerOnShutdownFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="FinalizerOnShutdownFuncCall.Results" href="#FinalizerOnShutdownFuncCall.Results">func (c FinalizerOnShutdownFuncCall) Results() []interface{}</a>

```
searchKey: goroutine.FinalizerOnShutdownFuncCall.Results
tags: [private]
```

```Go
func (c FinalizerOnShutdownFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockHandler" href="#MockHandler">type MockHandler struct</a>

```
searchKey: goroutine.MockHandler
tags: [private]
```

```Go
type MockHandler struct {
	// HandleFunc is an instance of a mock function object controlling the
	// behavior of the method Handle.
	HandleFunc *HandlerHandleFunc
}
```

MockHandler is a mock implementation of the Handler interface (from the package github.com/sourcegraph/sourcegraph/internal/goroutine) used for unit testing. 

#### <a id="NewMockHandler" href="#NewMockHandler">func NewMockHandler() *MockHandler</a>

```
searchKey: goroutine.NewMockHandler
tags: [private]
```

```Go
func NewMockHandler() *MockHandler
```

NewMockHandler creates a new mock of the Handler interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockHandlerFrom" href="#NewMockHandlerFrom">func NewMockHandlerFrom(i Handler) *MockHandler</a>

```
searchKey: goroutine.NewMockHandlerFrom
tags: [private]
```

```Go
func NewMockHandlerFrom(i Handler) *MockHandler
```

NewMockHandlerFrom creates a new mock of the MockHandler interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockHandler.Handle" href="#MockHandler.Handle">func (m *MockHandler) Handle(v0 context.Context) error</a>

```
searchKey: goroutine.MockHandler.Handle
tags: [private]
```

```Go
func (m *MockHandler) Handle(v0 context.Context) error
```

Handle delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="HandlerHandleFunc" href="#HandlerHandleFunc">type HandlerHandleFunc struct</a>

```
searchKey: goroutine.HandlerHandleFunc
tags: [private]
```

```Go
type HandlerHandleFunc struct {
	defaultHook func(context.Context) error
	hooks       []func(context.Context) error
	history     []HandlerHandleFuncCall
	mutex       sync.Mutex
}
```

HandlerHandleFunc describes the behavior when the Handle method of the parent MockHandler instance is invoked. 

#### <a id="HandlerHandleFunc.SetDefaultHook" href="#HandlerHandleFunc.SetDefaultHook">func (f *HandlerHandleFunc) SetDefaultHook(hook func(context.Context) error)</a>

```
searchKey: goroutine.HandlerHandleFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *HandlerHandleFunc) SetDefaultHook(hook func(context.Context) error)
```

SetDefaultHook sets function that is called when the Handle method of the parent MockHandler instance is invoked and the hook queue is empty. 

#### <a id="HandlerHandleFunc.PushHook" href="#HandlerHandleFunc.PushHook">func (f *HandlerHandleFunc) PushHook(hook func(context.Context) error)</a>

```
searchKey: goroutine.HandlerHandleFunc.PushHook
tags: [private]
```

```Go
func (f *HandlerHandleFunc) PushHook(hook func(context.Context) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Handle method of the parent MockHandler instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="HandlerHandleFunc.SetDefaultReturn" href="#HandlerHandleFunc.SetDefaultReturn">func (f *HandlerHandleFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: goroutine.HandlerHandleFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *HandlerHandleFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="HandlerHandleFunc.PushReturn" href="#HandlerHandleFunc.PushReturn">func (f *HandlerHandleFunc) PushReturn(r0 error)</a>

```
searchKey: goroutine.HandlerHandleFunc.PushReturn
tags: [private]
```

```Go
func (f *HandlerHandleFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="HandlerHandleFunc.nextHook" href="#HandlerHandleFunc.nextHook">func (f *HandlerHandleFunc) nextHook() func(context.Context) error</a>

```
searchKey: goroutine.HandlerHandleFunc.nextHook
tags: [private]
```

```Go
func (f *HandlerHandleFunc) nextHook() func(context.Context) error
```

#### <a id="HandlerHandleFunc.appendCall" href="#HandlerHandleFunc.appendCall">func (f *HandlerHandleFunc) appendCall(r0 HandlerHandleFuncCall)</a>

```
searchKey: goroutine.HandlerHandleFunc.appendCall
tags: [private]
```

```Go
func (f *HandlerHandleFunc) appendCall(r0 HandlerHandleFuncCall)
```

#### <a id="HandlerHandleFunc.History" href="#HandlerHandleFunc.History">func (f *HandlerHandleFunc) History() []HandlerHandleFuncCall</a>

```
searchKey: goroutine.HandlerHandleFunc.History
tags: [private]
```

```Go
func (f *HandlerHandleFunc) History() []HandlerHandleFuncCall
```

History returns a sequence of HandlerHandleFuncCall objects describing the invocations of this function. 

### <a id="HandlerHandleFuncCall" href="#HandlerHandleFuncCall">type HandlerHandleFuncCall struct</a>

```
searchKey: goroutine.HandlerHandleFuncCall
tags: [private]
```

```Go
type HandlerHandleFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

HandlerHandleFuncCall is an object that describes an invocation of method Handle on an instance of MockHandler. 

#### <a id="HandlerHandleFuncCall.Args" href="#HandlerHandleFuncCall.Args">func (c HandlerHandleFuncCall) Args() []interface{}</a>

```
searchKey: goroutine.HandlerHandleFuncCall.Args
tags: [private]
```

```Go
func (c HandlerHandleFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="HandlerHandleFuncCall.Results" href="#HandlerHandleFuncCall.Results">func (c HandlerHandleFuncCall) Results() []interface{}</a>

```
searchKey: goroutine.HandlerHandleFuncCall.Results
tags: [private]
```

```Go
func (c HandlerHandleFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockHandlerWithErrorHandler" href="#MockHandlerWithErrorHandler">type MockHandlerWithErrorHandler struct</a>

```
searchKey: goroutine.MockHandlerWithErrorHandler
tags: [private]
```

```Go
type MockHandlerWithErrorHandler struct {
	*MockHandler
	*MockErrorHandler
}
```

#### <a id="NewMockHandlerWithErrorHandler" href="#NewMockHandlerWithErrorHandler">func NewMockHandlerWithErrorHandler() *MockHandlerWithErrorHandler</a>

```
searchKey: goroutine.NewMockHandlerWithErrorHandler
tags: [private]
```

```Go
func NewMockHandlerWithErrorHandler() *MockHandlerWithErrorHandler
```

### <a id="MockHandlerWithFinalizer" href="#MockHandlerWithFinalizer">type MockHandlerWithFinalizer struct</a>

```
searchKey: goroutine.MockHandlerWithFinalizer
tags: [private]
```

```Go
type MockHandlerWithFinalizer struct {
	*MockHandler
	*MockFinalizer
}
```

#### <a id="NewMockHandlerWithFinalizer" href="#NewMockHandlerWithFinalizer">func NewMockHandlerWithFinalizer() *MockHandlerWithFinalizer</a>

```
searchKey: goroutine.NewMockHandlerWithFinalizer
tags: [private]
```

```Go
func NewMockHandlerWithFinalizer() *MockHandlerWithFinalizer
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="MonitorBackgroundRoutines" href="#MonitorBackgroundRoutines">func MonitorBackgroundRoutines(ctx context.Context, routines ...BackgroundRoutine)</a>

```
searchKey: goroutine.MonitorBackgroundRoutines
```

```Go
func MonitorBackgroundRoutines(ctx context.Context, routines ...BackgroundRoutine)
```

MonitorBackgroundRoutines will start the given background routines in their own goroutine. If the given context is canceled or a signal is received, the Stop method of each routine will be called. This method blocks until the Stop methods of each routine have returned. Two signals will cause the app to shutdown immediately. 

### <a id="monitorBackgroundRoutines" href="#monitorBackgroundRoutines">func monitorBackgroundRoutines(ctx context.Context, signals <-chan os.Signal, routines ...BackgroundRoutine)</a>

```
searchKey: goroutine.monitorBackgroundRoutines
tags: [private]
```

```Go
func monitorBackgroundRoutines(ctx context.Context, signals <-chan os.Signal, routines ...BackgroundRoutine)
```

### <a id="startAll" href="#startAll">func startAll(wg *sync.WaitGroup, routines ...BackgroundRoutine)</a>

```
searchKey: goroutine.startAll
tags: [private]
```

```Go
func startAll(wg *sync.WaitGroup, routines ...BackgroundRoutine)
```

startAll calls each routine's Start method in its own goroutine and registers each running goroutine with the given waitgroup. 

### <a id="stopAll" href="#stopAll">func stopAll(wg *sync.WaitGroup, routines ...BackgroundRoutine)</a>

```
searchKey: goroutine.stopAll
tags: [private]
```

```Go
func stopAll(wg *sync.WaitGroup, routines ...BackgroundRoutine)
```

stopAll calls each routine's Stop method in its own goroutine and and registers each running goroutine with the given waitgroup. 

### <a id="waitForSignal" href="#waitForSignal">func waitForSignal(ctx context.Context, signals <-chan os.Signal)</a>

```
searchKey: goroutine.waitForSignal
tags: [private]
```

```Go
func waitForSignal(ctx context.Context, signals <-chan os.Signal)
```

waitForSignal blocks until the given context is canceled or signal has been received on the given channel. If two signals are received, os.Exit(0) will be called immediately. 

### <a id="exitAfterSignals" href="#exitAfterSignals">func exitAfterSignals(signals <-chan os.Signal, numSignals int)</a>

```
searchKey: goroutine.exitAfterSignals
tags: [private]
```

```Go
func exitAfterSignals(signals <-chan os.Signal, numSignals int)
```

exitAfterSignals waits for a number of signals on the given channel, then calls os.Exit(0) to exit the program. 

### <a id="Go" href="#Go">func Go(f func())</a>

```
searchKey: goroutine.Go
```

```Go
func Go(f func())
```

Go runs the given function in a goroutine and catches and logs panics. 

This prevents a single panicking goroutine from crashing the entire binary, which is undesirable for services with many different components, like our frontend service, where one location of code panicking could be catastrophic. 

More advanced use cases should copy this implementation and modify it. 

### <a id="Parallel" href="#Parallel">func Parallel(fns ...func() error) (err error)</a>

```
searchKey: goroutine.Parallel
```

```Go
func Parallel(fns ...func() error) (err error)
```

Parallel calls each of the given functions in a goroutine. This method blocks until all goroutines have unblocked. The errors from each of the function invocations will be combined into a single error. 

### <a id="runPeriodicHandler" href="#runPeriodicHandler">func runPeriodicHandler(ctx context.Context, handler Handler, operation *observation.Operation) (_ bool, err error)</a>

```
searchKey: goroutine.runPeriodicHandler
tags: [private]
```

```Go
func runPeriodicHandler(ctx context.Context, handler Handler, operation *observation.Operation) (_ bool, err error)
```

### <a id="RunWorkers" href="#RunWorkers">func RunWorkers(worker PoolWorker) error</a>

```
searchKey: goroutine.RunWorkers
```

```Go
func RunWorkers(worker PoolWorker) error
```

RunWorkers invokes the given worker a number of times proportional to the maximum number of CPUs that can be executing simultaneously. 

### <a id="RunWorkersN" href="#RunWorkersN">func RunWorkersN(n int, worker PoolWorker) (err error)</a>

```
searchKey: goroutine.RunWorkersN
```

```Go
func RunWorkersN(n int, worker PoolWorker) (err error)
```

RunWorkersN invokes the given worker n times and collects the errors from each invocation. 

### <a id="RunWorkersOverStrings" href="#RunWorkersOverStrings">func RunWorkersOverStrings(values []string, worker func(index int, value string) error) error</a>

```
searchKey: goroutine.RunWorkersOverStrings
```

```Go
func RunWorkersOverStrings(values []string, worker func(index int, value string) error) error
```

RunWorkersOverStrings invokes the given worker once for each of the given string values. The worker function will receive the index as well as the string value as parameters. Workers will be invoked in a number of concurrent routines proportional to the maximum number of CPUs that can be executing simultaneously. 

### <a id="RunWorkersOverStringsN" href="#RunWorkersOverStringsN">func RunWorkersOverStringsN(n int, values []string, worker func(index int, value string) error) error</a>

```
searchKey: goroutine.RunWorkersOverStringsN
```

```Go
func RunWorkersOverStringsN(n int, values []string, worker func(index int, value string) error) error
```

RunWorkersOverStrings invokes the given worker once for each of the given string values. The worker function will receive the index as well as the string value as parameters. Workers will be invoked in n concurrent routines. 

### <a id="loadIndexedStringChannel" href="#loadIndexedStringChannel">func loadIndexedStringChannel(values []string) <-chan indexedString</a>

```
searchKey: goroutine.loadIndexedStringChannel
tags: [private]
```

```Go
func loadIndexedStringChannel(values []string) <-chan indexedString
```

### <a id="init.background_test.go" href="#init.background_test.go">func init()</a>

```
searchKey: goroutine.init
tags: [private]
```

```Go
func init()
```

Make the exiter a no-op in tests 

### <a id="TestMonitorBackgroundRoutinesSignal" href="#TestMonitorBackgroundRoutinesSignal">func TestMonitorBackgroundRoutinesSignal(t *testing.T)</a>

```
searchKey: goroutine.TestMonitorBackgroundRoutinesSignal
tags: [private]
```

```Go
func TestMonitorBackgroundRoutinesSignal(t *testing.T)
```

### <a id="TestMonitorBackgroundRoutinesContextCancel" href="#TestMonitorBackgroundRoutinesContextCancel">func TestMonitorBackgroundRoutinesContextCancel(t *testing.T)</a>

```
searchKey: goroutine.TestMonitorBackgroundRoutinesContextCancel
tags: [private]
```

```Go
func TestMonitorBackgroundRoutinesContextCancel(t *testing.T)
```

### <a id="TestBounded" href="#TestBounded">func TestBounded(t *testing.T)</a>

```
searchKey: goroutine.TestBounded
tags: [private]
```

```Go
func TestBounded(t *testing.T)
```

### <a id="TestBounded_error" href="#TestBounded_error">func TestBounded_error(t *testing.T)</a>

```
searchKey: goroutine.TestBounded_error
tags: [private]
```

```Go
func TestBounded_error(t *testing.T)
```

### <a id="ExampleBackgroundRoutine" href="#ExampleBackgroundRoutine">func ExampleBackgroundRoutine()</a>

```
searchKey: goroutine.ExampleBackgroundRoutine
tags: [private]
```

```Go
func ExampleBackgroundRoutine()
```

### <a id="ExamplePeriodicGoroutine" href="#ExamplePeriodicGoroutine">func ExamplePeriodicGoroutine()</a>

```
searchKey: goroutine.ExamplePeriodicGoroutine
tags: [private]
```

```Go
func ExamplePeriodicGoroutine()
```

### <a id="TestGo" href="#TestGo">func TestGo(t *testing.T)</a>

```
searchKey: goroutine.TestGo
tags: [private]
```

```Go
func TestGo(t *testing.T)
```

### <a id="TestParallel" href="#TestParallel">func TestParallel(t *testing.T)</a>

```
searchKey: goroutine.TestParallel
tags: [private]
```

```Go
func TestParallel(t *testing.T)
```

### <a id="TestPeriodicGoroutine" href="#TestPeriodicGoroutine">func TestPeriodicGoroutine(t *testing.T)</a>

```
searchKey: goroutine.TestPeriodicGoroutine
tags: [private]
```

```Go
func TestPeriodicGoroutine(t *testing.T)
```

### <a id="TestPeriodicGoroutineError" href="#TestPeriodicGoroutineError">func TestPeriodicGoroutineError(t *testing.T)</a>

```
searchKey: goroutine.TestPeriodicGoroutineError
tags: [private]
```

```Go
func TestPeriodicGoroutineError(t *testing.T)
```

### <a id="TestPeriodicGoroutineContextError" href="#TestPeriodicGoroutineContextError">func TestPeriodicGoroutineContextError(t *testing.T)</a>

```
searchKey: goroutine.TestPeriodicGoroutineContextError
tags: [private]
```

```Go
func TestPeriodicGoroutineContextError(t *testing.T)
```

### <a id="TestPeriodicGoroutineFinalizer" href="#TestPeriodicGoroutineFinalizer">func TestPeriodicGoroutineFinalizer(t *testing.T)</a>

```
searchKey: goroutine.TestPeriodicGoroutineFinalizer
tags: [private]
```

```Go
func TestPeriodicGoroutineFinalizer(t *testing.T)
```

### <a id="TestRunWorkersN" href="#TestRunWorkersN">func TestRunWorkersN(t *testing.T)</a>

```
searchKey: goroutine.TestRunWorkersN
tags: [private]
```

```Go
func TestRunWorkersN(t *testing.T)
```

