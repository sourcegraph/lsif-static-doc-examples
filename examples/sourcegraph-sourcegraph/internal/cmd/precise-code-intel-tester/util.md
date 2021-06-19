# Package util

## Index

* [Constants](#const)
    * [const MaxDisplayLines](#MaxDisplayLines)
    * [const MaxDisplayWidth](#MaxDisplayWidth)
* [Variables](#var)
    * [var braille](#braille)
* [Types](#type)
    * [type ErrorPayload struct](#ErrorPayload)
    * [type GraphQLError struct](#GraphQLError)
    * [type Limiter struct](#Limiter)
        * [func NewLimiter(concurrency int) *Limiter](#NewLimiter)
        * [func (l *Limiter) Acquire(ctx context.Context) error](#Limiter.Acquire)
        * [func (l *Limiter) Release()](#Limiter.Release)
        * [func (l *Limiter) Close()](#Limiter.Close)
    * [type ParallelFn struct](#ParallelFn)
    * [type errPair struct](#errPair)
    * [type pendingMap struct](#pendingMap)
        * [func newPendingMap(n int) *pendingMap](#newPendingMap)
        * [func (m *pendingMap) remove(i int)](#pendingMap.remove)
        * [func (m *pendingMap) keys() (keys []int)](#pendingMap.keys)
        * [func (m *pendingMap) set(i int)](#pendingMap.set)
        * [func (m *pendingMap) get(i int) bool](#pendingMap.get)
        * [func (m *pendingMap) size() int](#pendingMap.size)
* [Functions](#func)
    * [func SignalSensitiveContext() (context.Context, func())](#SignalSensitiveContext)
    * [func QueryGraphQL(ctx context.Context, endpoint, queryName string, token, query string, variables map[string]interface{}, target interface{}) error](#QueryGraphQL)
    * [func RunParallel(ctx context.Context, concurrency int, fns []ParallelFn) error](#RunParallel)
    * [func runFunctions(ctx context.Context, fns []ParallelFn, pendingMap *pendingMap, queue <-chan int, errs chan<- errPair)](#runFunctions)
    * [func monitor(ctx context.Context, fns []ParallelFn, pendingMap *pendingMap, errs <-chan errPair, concurrency int) error](#monitor)
    * [func formatUpdate(fns []ParallelFn, pendingMap *pendingMap, concurrency int) *pentimento.Content](#formatUpdate)
    * [func numLines(concurrency, numTasks int) int](#numLines)
    * [func formatProgressBar(total, finished int) string](#formatProgressBar)
    * [func digits(n int) int](#digits)


## <a id="const" href="#const">Constants</a>

### <a id="MaxDisplayLines" href="#MaxDisplayLines">const MaxDisplayLines</a>

```
searchKey: util.MaxDisplayLines
tags: [exported]
```

```Go
const MaxDisplayLines = 50
```

MaxDisplayLines is the number of lines that will be displayed before truncation. 

### <a id="MaxDisplayWidth" href="#MaxDisplayWidth">const MaxDisplayWidth</a>

```
searchKey: util.MaxDisplayWidth
tags: [exported]
```

```Go
const MaxDisplayWidth = 80
```

MaxDisplayWidth is the number of columns that can be used to draw a progress bar. 

## <a id="var" href="#var">Variables</a>

### <a id="braille" href="#braille">var braille</a>

```
searchKey: util.braille
```

```Go
var braille = ...
```

braille is an animated spinner based off of the characters used by yarn. 

## <a id="type" href="#type">Types</a>

### <a id="ErrorPayload" href="#ErrorPayload">type ErrorPayload struct</a>

```
searchKey: util.ErrorPayload
tags: [exported]
```

```Go
type ErrorPayload struct {
	Errors []GraphQLError `json:"errors"`
}
```

### <a id="GraphQLError" href="#GraphQLError">type GraphQLError struct</a>

```
searchKey: util.GraphQLError
tags: [exported]
```

```Go
type GraphQLError struct {
	Message string `json:"message"`
}
```

### <a id="Limiter" href="#Limiter">type Limiter struct</a>

```
searchKey: util.Limiter
tags: [exported]
```

```Go
type Limiter struct {
	ch chan struct{}
}
```

Limiter implements a counting semaphore. 

#### <a id="NewLimiter" href="#NewLimiter">func NewLimiter(concurrency int) *Limiter</a>

```
searchKey: util.NewLimiter
tags: [exported]
```

```Go
func NewLimiter(concurrency int) *Limiter
```

NewLimiter creates a new limiter with the given maximum concurrency. 

#### <a id="Limiter.Acquire" href="#Limiter.Acquire">func (l *Limiter) Acquire(ctx context.Context) error</a>

```
searchKey: util.Limiter.Acquire
tags: [exported]
```

```Go
func (l *Limiter) Acquire(ctx context.Context) error
```

Acquire blocks until it can acquire a value from the inner channel. 

#### <a id="Limiter.Release" href="#Limiter.Release">func (l *Limiter) Release()</a>

```
searchKey: util.Limiter.Release
tags: [exported]
```

```Go
func (l *Limiter) Release()
```

Release adds a value back to the limiter, unblocking one waiter. 

#### <a id="Limiter.Close" href="#Limiter.Close">func (l *Limiter) Close()</a>

```
searchKey: util.Limiter.Close
tags: [exported]
```

```Go
func (l *Limiter) Close()
```

Close closes the underlying channel. 

### <a id="ParallelFn" href="#ParallelFn">type ParallelFn struct</a>

```
searchKey: util.ParallelFn
tags: [exported]
```

```Go
type ParallelFn struct {
	Fn          func(ctx context.Context) error
	Description func() string
	Total       func() int
	Finished    func() int
}
```

ParallelFn groups an error-returning function with a description that can be displayed by runParallel. 

### <a id="errPair" href="#errPair">type errPair struct</a>

```
searchKey: util.errPair
```

```Go
type errPair struct {
	i   int
	err error
}
```

errPair bundles an error value with the function index from which it was produced. 

### <a id="pendingMap" href="#pendingMap">type pendingMap struct</a>

```
searchKey: util.pendingMap
```

```Go
type pendingMap struct {
	sync.RWMutex
	pending map[int]bool
}
```

#### <a id="newPendingMap" href="#newPendingMap">func newPendingMap(n int) *pendingMap</a>

```
searchKey: util.newPendingMap
```

```Go
func newPendingMap(n int) *pendingMap
```

newPendingMap creates a new pending map with n pending tasks. 

#### <a id="pendingMap.remove" href="#pendingMap.remove">func (m *pendingMap) remove(i int)</a>

```
searchKey: util.pendingMap.remove
```

```Go
func (m *pendingMap) remove(i int)
```

#### <a id="pendingMap.keys" href="#pendingMap.keys">func (m *pendingMap) keys() (keys []int)</a>

```
searchKey: util.pendingMap.keys
```

```Go
func (m *pendingMap) keys() (keys []int)
```

#### <a id="pendingMap.set" href="#pendingMap.set">func (m *pendingMap) set(i int)</a>

```
searchKey: util.pendingMap.set
```

```Go
func (m *pendingMap) set(i int)
```

#### <a id="pendingMap.get" href="#pendingMap.get">func (m *pendingMap) get(i int) bool</a>

```
searchKey: util.pendingMap.get
```

```Go
func (m *pendingMap) get(i int) bool
```

#### <a id="pendingMap.size" href="#pendingMap.size">func (m *pendingMap) size() int</a>

```
searchKey: util.pendingMap.size
```

```Go
func (m *pendingMap) size() int
```

## <a id="func" href="#func">Functions</a>

### <a id="SignalSensitiveContext" href="#SignalSensitiveContext">func SignalSensitiveContext() (context.Context, func())</a>

```
searchKey: util.SignalSensitiveContext
tags: [exported]
```

```Go
func SignalSensitiveContext() (context.Context, func())
```

SignalSensitiveContext returns a background context that is canceled after receiving an interrupt or terminate signal. A second signal will abort the program. This function returns the context and a function that should be  deferred by the caller to clean up internal channels. 

### <a id="QueryGraphQL" href="#QueryGraphQL">func QueryGraphQL(ctx context.Context, endpoint, queryName string, token, query string, variables map[string]interface{}, target interface{}) error</a>

```
searchKey: util.QueryGraphQL
tags: [exported]
```

```Go
func QueryGraphQL(ctx context.Context, endpoint, queryName string, token, query string, variables map[string]interface{}, target interface{}) error
```

QueryGraphQL performs GraphQL query on the frontend. 

The queryName is the name of the GraphQL query, which uniquely identifies the source of the GraphQL query and helps e.g. a site admin know where such a query may be coming from. Importantly, unnamed queries (empty string) are considered to be unknown end-user API requests and as such will have the entire GraphQL request logged by the frontend, and cannot be uniquely identified in monitoring. 

### <a id="RunParallel" href="#RunParallel">func RunParallel(ctx context.Context, concurrency int, fns []ParallelFn) error</a>

```
searchKey: util.RunParallel
tags: [exported]
```

```Go
func RunParallel(ctx context.Context, concurrency int, fns []ParallelFn) error
```

RunParallel runs each function in parallel. Returns the first error to occur. The number of invocations is limited by concurrency. 

### <a id="runFunctions" href="#runFunctions">func runFunctions(ctx context.Context, fns []ParallelFn, pendingMap *pendingMap, queue <-chan int, errs chan<- errPair)</a>

```
searchKey: util.runFunctions
```

```Go
func runFunctions(ctx context.Context, fns []ParallelFn, pendingMap *pendingMap, queue <-chan int, errs chan<- errPair)
```

runFunctions is the worker body. It will pull an index off of the work queue, mark that index as pending, then send the index and the value resulting from the invocation of the function at that index onto the errors channel. 

### <a id="monitor" href="#monitor">func monitor(ctx context.Context, fns []ParallelFn, pendingMap *pendingMap, errs <-chan errPair, concurrency int) error</a>

```
searchKey: util.monitor
```

```Go
func monitor(ctx context.Context, fns []ParallelFn, pendingMap *pendingMap, errs <-chan errPair, concurrency int) error
```

monitor waits for all functions to complete, an error, or the context to be canceled. The first error encountered is returned. The current state of the pending map is periodically written to the screen. All content written to the screen is removed at exit of this function. 

### <a id="formatUpdate" href="#formatUpdate">func formatUpdate(fns []ParallelFn, pendingMap *pendingMap, concurrency int) *pentimento.Content</a>

```
searchKey: util.formatUpdate
```

```Go
func formatUpdate(fns []ParallelFn, pendingMap *pendingMap, concurrency int) *pentimento.Content
```

formatUpdate constructs a content object with a number of lines indicating the in progress and head-of-queue tasks, as well as a progress bar. 

### <a id="numLines" href="#numLines">func numLines(concurrency, numTasks int) int</a>

```
searchKey: util.numLines
```

```Go
func numLines(concurrency, numTasks int) int
```

numLines determines how many lines to display in formatUpdate. 

### <a id="formatProgressBar" href="#formatProgressBar">func formatProgressBar(total, finished int) string</a>

```
searchKey: util.formatProgressBar
```

```Go
func formatProgressBar(total, finished int) string
```

formatProgressBar constructs a progress bar string based on the relationship between the total and finished parameters. 

### <a id="digits" href="#digits">func digits(n int) int</a>

```
searchKey: util.digits
```

```Go
func digits(n int) int
```

digits returns the number of digits of n. 

