# Package context

Package context defines the Context type, which carries deadlines, cancellation signals, and other request-scoped values across API boundaries and between processes. 

Incoming requests to a server should create a Context, and outgoing calls to servers should accept a Context. The chain of function calls between them must propagate the Context, optionally replacing it with a derived Context created using WithCancel, WithDeadline, WithTimeout, or WithValue. When a Context is canceled, all Contexts derived from it are also canceled. 

The WithCancel, WithDeadline, and WithTimeout functions take a Context (the parent) and return a derived Context (the child) and a CancelFunc. Calling the CancelFunc cancels the child and its children, removes the parent's reference to the child, and stops any associated timers. Failing to call the CancelFunc leaks the child and its children until the parent is canceled or the timer fires. The go vet tool checks that CancelFuncs are used on all control-flow paths. 

Programs that use Contexts should follow these rules to keep interfaces consistent across packages and enable static analysis tools to check context propagation: 

Do not store Contexts inside a struct type; instead, pass a Context explicitly to each function that needs it. The Context should be the first parameter, typically named ctx: 

```
func DoSomething(ctx context.Context, arg Arg) error {
	// ... use ctx ...
}

```
Do not pass a nil Context, even if a function permits it. Pass context.TODO if you are unsure about which Context to use. 

Use context Values only for request-scoped data that transits processes and APIs, not for passing optional parameters to functions. 

The same Context may be passed to functions running in different goroutines; Contexts are safe for simultaneous use by multiple goroutines. 

See [https://blog.golang.org/context](https://blog.golang.org/context) for example code for a server that uses Contexts. 

## Index

* [Constants](#const)
    * [const shortDuration](#shortDuration)
    * [const veryLongDuration](#veryLongDuration)
* [Variables](#var)
    * [var Canceled](#Canceled)
    * [var DeadlineExceeded](#DeadlineExceeded)
    * [var background](#background)
    * [var todo](#todo)
    * [var goroutines](#goroutines)
    * [var cancelCtxKey](#cancelCtxKey)
    * [var closedchan](#closedchan)
    * [var k1](#k1)
    * [var k2](#k2)
    * [var k3](#k3)
* [Types](#type)
    * [type Context interface](#Context)
        * [func Background() Context](#Background)
        * [func TODO() Context](#TODO)
        * [func WithCancel(parent Context) (ctx Context, cancel CancelFunc)](#WithCancel)
        * [func WithDeadline(parent Context, d time.Time) (Context, CancelFunc)](#WithDeadline)
        * [func WithTimeout(parent Context, timeout time.Duration) (Context, CancelFunc)](#WithTimeout)
        * [func WithValue(parent Context, key, val interface{}) Context](#WithValue)
    * [type deadlineExceededError struct{}](#deadlineExceededError)
        * [func (deadlineExceededError) Error() string](#deadlineExceededError.Error)
        * [func (deadlineExceededError) Timeout() bool](#deadlineExceededError.Timeout)
        * [func (deadlineExceededError) Temporary() bool](#deadlineExceededError.Temporary)
    * [type emptyCtx int](#emptyCtx)
        * [func (*emptyCtx) Deadline() (deadline time.Time, ok bool)](#emptyCtx.Deadline)
        * [func (*emptyCtx) Done() <-chan struct{}](#emptyCtx.Done)
        * [func (*emptyCtx) Err() error](#emptyCtx.Err)
        * [func (*emptyCtx) Value(key interface{}) interface{}](#emptyCtx.Value)
        * [func (e *emptyCtx) String() string](#emptyCtx.String)
    * [type CancelFunc func()](#CancelFunc)
        * [func WithCancel(parent Context) (ctx Context, cancel CancelFunc)](#WithCancel)
        * [func WithDeadline(parent Context, d time.Time) (Context, CancelFunc)](#WithDeadline)
        * [func WithTimeout(parent Context, timeout time.Duration) (Context, CancelFunc)](#WithTimeout)
    * [type canceler interface](#canceler)
    * [type cancelCtx struct](#cancelCtx)
        * [func newCancelCtx(parent Context) cancelCtx](#newCancelCtx)
        * [func parentCancelCtx(parent Context) (*cancelCtx, bool)](#parentCancelCtx)
        * [func (c *cancelCtx) Value(key interface{}) interface{}](#cancelCtx.Value)
        * [func (c *cancelCtx) Done() <-chan struct{}](#cancelCtx.Done)
        * [func (c *cancelCtx) Err() error](#cancelCtx.Err)
        * [func (c *cancelCtx) String() string](#cancelCtx.String)
        * [func (c *cancelCtx) cancel(removeFromParent bool, err error)](#cancelCtx.cancel)
    * [type stringer interface](#stringer)
    * [type timerCtx struct](#timerCtx)
        * [func (c *timerCtx) Deadline() (deadline time.Time, ok bool)](#timerCtx.Deadline)
        * [func (c *timerCtx) String() string](#timerCtx.String)
        * [func (c *timerCtx) cancel(removeFromParent bool, err error)](#timerCtx.cancel)
    * [type valueCtx struct](#valueCtx)
        * [func (c *valueCtx) String() string](#valueCtx.String)
        * [func (c *valueCtx) Value(key interface{}) interface{}](#valueCtx.Value)
    * [type testingT interface](#testingT)
    * [type otherContext struct](#otherContext)
    * [type key1 int](#key1)
    * [type key2 int](#key2)
    * [type myCtx struct](#myCtx)
    * [type myDoneCtx struct](#myDoneCtx)
        * [func (d *myDoneCtx) Done() <-chan struct{}](#myDoneCtx.Done)
* [Functions](#func)
    * [func propagateCancel(parent Context, child canceler)](#propagateCancel)
    * [func removeChild(parent Context, child canceler)](#removeChild)
    * [func init()](#init)
    * [func contextName(c Context) string](#contextName)
    * [func stringify(v interface{}) string](#stringify)
    * [func quiescent(t testingT) time.Duration](#quiescent)
    * [func XTestBackground(t testingT)](#XTestBackground)
    * [func XTestTODO(t testingT)](#XTestTODO)
    * [func XTestWithCancel(t testingT)](#XTestWithCancel)
    * [func contains(m map[canceler]struct{}, key canceler) bool](#contains)
    * [func XTestParentFinishesChild(t testingT)](#XTestParentFinishesChild)
    * [func XTestChildFinishesFirst(t testingT)](#XTestChildFinishesFirst)
    * [func testDeadline(c Context, name string, t testingT)](#testDeadline)
    * [func XTestDeadline(t testingT)](#XTestDeadline)
    * [func XTestTimeout(t testingT)](#XTestTimeout)
    * [func XTestCanceledTimeout(t testingT)](#XTestCanceledTimeout)
    * [func XTestValues(t testingT)](#XTestValues)
    * [func XTestAllocs(t testingT, testingShort func() bool, testingAllocsPerRun func(int, func()) float64)](#XTestAllocs)
    * [func XTestSimultaneousCancels(t testingT)](#XTestSimultaneousCancels)
    * [func XTestInterlockedCancels(t testingT)](#XTestInterlockedCancels)
    * [func XTestLayersCancel(t testingT)](#XTestLayersCancel)
    * [func XTestLayersTimeout(t testingT)](#XTestLayersTimeout)
    * [func testLayers(t testingT, seed int64, testTimeout bool)](#testLayers)
    * [func XTestCancelRemoves(t testingT)](#XTestCancelRemoves)
    * [func XTestWithCancelCanceledParent(t testingT)](#XTestWithCancelCanceledParent)
    * [func XTestWithValueChecksKey(t testingT)](#XTestWithValueChecksKey)
    * [func XTestInvalidDerivedFail(t testingT)](#XTestInvalidDerivedFail)
    * [func recoveredValue(fn func()) (v interface{})](#recoveredValue)
    * [func XTestDeadlineExceededSupportsTimeout(t testingT)](#XTestDeadlineExceededSupportsTimeout)
    * [func XTestCustomContextGoroutines(t testingT)](#XTestCustomContextGoroutines)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="shortDuration" href="#shortDuration">const shortDuration</a>

```
searchKey: context.shortDuration
```

```Go
const shortDuration = 1 * time.Millisecond // a reasonable duration to block in a test

```

### <a id="veryLongDuration" href="#veryLongDuration">const veryLongDuration</a>

```
searchKey: context.veryLongDuration
```

```Go
const veryLongDuration = 1000 * time.Hour // an arbitrary upper bound on the test's running time

```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="Canceled" href="#Canceled">var Canceled</a>

```
searchKey: context.Canceled
tags: [exported]
```

```Go
var Canceled = errors.New("context canceled")
```

Canceled is the error returned by Context.Err when the context is canceled. 

### <a id="DeadlineExceeded" href="#DeadlineExceeded">var DeadlineExceeded</a>

```
searchKey: context.DeadlineExceeded
tags: [exported]
```

```Go
var DeadlineExceeded error = deadlineExceededError{}
```

DeadlineExceeded is the error returned by Context.Err when the context's deadline passes. 

### <a id="background" href="#background">var background</a>

```
searchKey: context.background
```

```Go
var background = new(emptyCtx)
```

### <a id="todo" href="#todo">var todo</a>

```
searchKey: context.todo
```

```Go
var todo = new(emptyCtx)
```

### <a id="goroutines" href="#goroutines">var goroutines</a>

```
searchKey: context.goroutines
```

```Go
var goroutines int32
```

goroutines counts the number of goroutines ever created; for testing. 

### <a id="cancelCtxKey" href="#cancelCtxKey">var cancelCtxKey</a>

```
searchKey: context.cancelCtxKey
```

```Go
var cancelCtxKey int
```

&cancelCtxKey is the key that a cancelCtx returns itself for. 

### <a id="closedchan" href="#closedchan">var closedchan</a>

```
searchKey: context.closedchan
```

```Go
var closedchan = make(chan struct{})
```

closedchan is a reusable closed channel. 

### <a id="k1" href="#k1">var k1</a>

```
searchKey: context.k1
```

```Go
var k1 = key1(1)
```

### <a id="k2" href="#k2">var k2</a>

```
searchKey: context.k2
```

```Go
var k2 = key2(1) // same int as k1, different type

```

### <a id="k3" href="#k3">var k3</a>

```
searchKey: context.k3
```

```Go
var k3 = key2(3) // same type as k2, different int

```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Context" href="#Context">type Context interface</a>

```
searchKey: context.Context
tags: [exported]
```

```Go
type Context interface {
	// Deadline returns the time when work done on behalf of this context
	// should be canceled. Deadline returns ok==false when no deadline is
	// set. Successive calls to Deadline return the same results.
	Deadline() (deadline time.Time, ok bool)

	// Done returns a channel that's closed when work done on behalf of this
	// context should be canceled. Done may return nil if this context can
	// never be canceled. Successive calls to Done return the same value.
	// The close of the Done channel may happen asynchronously,
	// after the cancel function returns.
	//
	// WithCancel arranges for Done to be closed when cancel is called;
	// WithDeadline arranges for Done to be closed when the deadline
	// expires; WithTimeout arranges for Done to be closed when the timeout
	// elapses.
	//
	// Done is provided for use in select statements:
	//
	//  // Stream generates values with DoSomething and sends them to out
	//  // until DoSomething returns an error or ctx.Done is closed.
	//  func Stream(ctx context.Context, out chan<- Value) error {
	//  	for {
	//  		v, err := DoSomething(ctx)
	//  		if err != nil {
	//  			return err
	//  		}
	//  		select {
	//  		case <-ctx.Done():
	//  			return ctx.Err()
	//  		case out <- v:
	//  		}
	//  	}
	//  }
	//
	// See https://blog.golang.org/pipelines for more examples of how to use
	// a Done channel for cancellation.
	Done() <-chan struct{}

	// If Done is not yet closed, Err returns nil.
	// If Done is closed, Err returns a non-nil error explaining why:
	// Canceled if the context was canceled
	// or DeadlineExceeded if the context's deadline passed.
	// After Err returns a non-nil error, successive calls to Err return the same error.
	Err() error

	// Value returns the value associated with this context for key, or nil
	// if no value is associated with key. Successive calls to Value with
	// the same key returns the same result.
	//
	// Use context values only for request-scoped data that transits
	// processes and API boundaries, not for passing optional parameters to
	// functions.
	//
	// A key identifies a specific value in a Context. Functions that wish
	// to store values in Context typically allocate a key in a global
	// variable then use that key as the argument to context.WithValue and
	// Context.Value. A key can be any type that supports equality;
	// packages should define keys as an unexported type to avoid
	// collisions.
	//
	// Packages that define a Context key should provide type-safe accessors
	// for the values stored using that key:
	//
	// 	// Package user defines a User type that's stored in Contexts.
	// 	package user
	//
	// 	import "context"
	//
	// 	// User is the type of value stored in the Contexts.
	// 	type User struct {...}
	//
	// 	// key is an unexported type for keys defined in this package.
	// 	// This prevents collisions with keys defined in other packages.
	// 	type key int
	//
	// 	// userKey is the key for user.User values in Contexts. It is
	// 	// unexported; clients use user.NewContext and user.FromContext
	// 	// instead of using this key directly.
	// 	var userKey key
	//
	// 	// NewContext returns a new Context that carries value u.
	// 	func NewContext(ctx context.Context, u *User) context.Context {
	// 		return context.WithValue(ctx, userKey, u)
	// 	}
	//
	// 	// FromContext returns the User value stored in ctx, if any.
	// 	func FromContext(ctx context.Context) (*User, bool) {
	// 		u, ok := ctx.Value(userKey).(*User)
	// 		return u, ok
	// 	}
	Value(key interface{}) interface{}
}
```

A Context carries a deadline, a cancellation signal, and other values across API boundaries. 

Context's methods may be called by multiple goroutines simultaneously. 

#### <a id="Background" href="#Background">func Background() Context</a>

```
searchKey: context.Background
tags: [exported]
```

```Go
func Background() Context
```

Background returns a non-nil, empty Context. It is never canceled, has no values, and has no deadline. It is typically used by the main function, initialization, and tests, and as the top-level Context for incoming requests. 

#### <a id="TODO" href="#TODO">func TODO() Context</a>

```
searchKey: context.TODO
tags: [exported]
```

```Go
func TODO() Context
```

TODO returns a non-nil, empty Context. Code should use context.TODO when it's unclear which Context to use or it is not yet available (because the surrounding function has not yet been extended to accept a Context parameter). 

#### <a id="WithCancel" href="#WithCancel">func WithCancel(parent Context) (ctx Context, cancel CancelFunc)</a>

```
searchKey: context.WithCancel
tags: [exported]
```

```Go
func WithCancel(parent Context) (ctx Context, cancel CancelFunc)
```

WithCancel returns a copy of parent with a new Done channel. The returned context's Done channel is closed when the returned cancel function is called or when the parent context's Done channel is closed, whichever happens first. 

Canceling this context releases resources associated with it, so code should call cancel as soon as the operations running in this Context complete. 

#### <a id="WithDeadline" href="#WithDeadline">func WithDeadline(parent Context, d time.Time) (Context, CancelFunc)</a>

```
searchKey: context.WithDeadline
tags: [exported]
```

```Go
func WithDeadline(parent Context, d time.Time) (Context, CancelFunc)
```

WithDeadline returns a copy of the parent context with the deadline adjusted to be no later than d. If the parent's deadline is already earlier than d, WithDeadline(parent, d) is semantically equivalent to parent. The returned context's Done channel is closed when the deadline expires, when the returned cancel function is called, or when the parent context's Done channel is closed, whichever happens first. 

Canceling this context releases resources associated with it, so code should call cancel as soon as the operations running in this Context complete. 

#### <a id="WithTimeout" href="#WithTimeout">func WithTimeout(parent Context, timeout time.Duration) (Context, CancelFunc)</a>

```
searchKey: context.WithTimeout
tags: [exported]
```

```Go
func WithTimeout(parent Context, timeout time.Duration) (Context, CancelFunc)
```

WithTimeout returns WithDeadline(parent, time.Now().Add(timeout)). 

Canceling this context releases resources associated with it, so code should call cancel as soon as the operations running in this Context complete: 

```
func slowOperationWithTimeout(ctx context.Context) (Result, error) {
	ctx, cancel := context.WithTimeout(ctx, 100*time.Millisecond)
	defer cancel()  // releases resources if slowOperation completes before timeout elapses
	return slowOperation(ctx)
}

```
#### <a id="WithValue" href="#WithValue">func WithValue(parent Context, key, val interface{}) Context</a>

```
searchKey: context.WithValue
tags: [exported]
```

```Go
func WithValue(parent Context, key, val interface{}) Context
```

WithValue returns a copy of parent in which the value associated with key is val. 

Use context Values only for request-scoped data that transits processes and APIs, not for passing optional parameters to functions. 

The provided key must be comparable and should not be of type string or any other built-in type to avoid collisions between packages using context. Users of WithValue should define their own types for keys. To avoid allocating when assigning to an interface{}, context keys often have concrete type struct{}. Alternatively, exported context key variables' static type should be a pointer or interface. 

### <a id="deadlineExceededError" href="#deadlineExceededError">type deadlineExceededError struct{}</a>

```
searchKey: context.deadlineExceededError
```

```Go
type deadlineExceededError struct{}
```

#### <a id="deadlineExceededError.Error" href="#deadlineExceededError.Error">func (deadlineExceededError) Error() string</a>

```
searchKey: context.deadlineExceededError.Error
```

```Go
func (deadlineExceededError) Error() string
```

#### <a id="deadlineExceededError.Timeout" href="#deadlineExceededError.Timeout">func (deadlineExceededError) Timeout() bool</a>

```
searchKey: context.deadlineExceededError.Timeout
```

```Go
func (deadlineExceededError) Timeout() bool
```

#### <a id="deadlineExceededError.Temporary" href="#deadlineExceededError.Temporary">func (deadlineExceededError) Temporary() bool</a>

```
searchKey: context.deadlineExceededError.Temporary
```

```Go
func (deadlineExceededError) Temporary() bool
```

### <a id="emptyCtx" href="#emptyCtx">type emptyCtx int</a>

```
searchKey: context.emptyCtx
```

```Go
type emptyCtx int
```

An emptyCtx is never canceled, has no values, and has no deadline. It is not struct{}, since vars of this type must have distinct addresses. 

#### <a id="emptyCtx.Deadline" href="#emptyCtx.Deadline">func (*emptyCtx) Deadline() (deadline time.Time, ok bool)</a>

```
searchKey: context.emptyCtx.Deadline
```

```Go
func (*emptyCtx) Deadline() (deadline time.Time, ok bool)
```

#### <a id="emptyCtx.Done" href="#emptyCtx.Done">func (*emptyCtx) Done() <-chan struct{}</a>

```
searchKey: context.emptyCtx.Done
```

```Go
func (*emptyCtx) Done() <-chan struct{}
```

#### <a id="emptyCtx.Err" href="#emptyCtx.Err">func (*emptyCtx) Err() error</a>

```
searchKey: context.emptyCtx.Err
```

```Go
func (*emptyCtx) Err() error
```

#### <a id="emptyCtx.Value" href="#emptyCtx.Value">func (*emptyCtx) Value(key interface{}) interface{}</a>

```
searchKey: context.emptyCtx.Value
```

```Go
func (*emptyCtx) Value(key interface{}) interface{}
```

#### <a id="emptyCtx.String" href="#emptyCtx.String">func (e *emptyCtx) String() string</a>

```
searchKey: context.emptyCtx.String
```

```Go
func (e *emptyCtx) String() string
```

### <a id="CancelFunc" href="#CancelFunc">type CancelFunc func()</a>

```
searchKey: context.CancelFunc
tags: [exported]
```

```Go
type CancelFunc func()
```

A CancelFunc tells an operation to abandon its work. A CancelFunc does not wait for the work to stop. A CancelFunc may be called by multiple goroutines simultaneously. After the first call, subsequent calls to a CancelFunc do nothing. 

#### <a id="WithCancel" href="#WithCancel">func WithCancel(parent Context) (ctx Context, cancel CancelFunc)</a>

```
searchKey: context.WithCancel
tags: [exported]
```

```Go
func WithCancel(parent Context) (ctx Context, cancel CancelFunc)
```

WithCancel returns a copy of parent with a new Done channel. The returned context's Done channel is closed when the returned cancel function is called or when the parent context's Done channel is closed, whichever happens first. 

Canceling this context releases resources associated with it, so code should call cancel as soon as the operations running in this Context complete. 

#### <a id="WithDeadline" href="#WithDeadline">func WithDeadline(parent Context, d time.Time) (Context, CancelFunc)</a>

```
searchKey: context.WithDeadline
tags: [exported]
```

```Go
func WithDeadline(parent Context, d time.Time) (Context, CancelFunc)
```

WithDeadline returns a copy of the parent context with the deadline adjusted to be no later than d. If the parent's deadline is already earlier than d, WithDeadline(parent, d) is semantically equivalent to parent. The returned context's Done channel is closed when the deadline expires, when the returned cancel function is called, or when the parent context's Done channel is closed, whichever happens first. 

Canceling this context releases resources associated with it, so code should call cancel as soon as the operations running in this Context complete. 

#### <a id="WithTimeout" href="#WithTimeout">func WithTimeout(parent Context, timeout time.Duration) (Context, CancelFunc)</a>

```
searchKey: context.WithTimeout
tags: [exported]
```

```Go
func WithTimeout(parent Context, timeout time.Duration) (Context, CancelFunc)
```

WithTimeout returns WithDeadline(parent, time.Now().Add(timeout)). 

Canceling this context releases resources associated with it, so code should call cancel as soon as the operations running in this Context complete: 

```
func slowOperationWithTimeout(ctx context.Context) (Result, error) {
	ctx, cancel := context.WithTimeout(ctx, 100*time.Millisecond)
	defer cancel()  // releases resources if slowOperation completes before timeout elapses
	return slowOperation(ctx)
}

```
### <a id="canceler" href="#canceler">type canceler interface</a>

```
searchKey: context.canceler
```

```Go
type canceler interface {
	cancel(removeFromParent bool, err error)
	Done() <-chan struct{}
}
```

A canceler is a context type that can be canceled directly. The implementations are *cancelCtx and *timerCtx. 

### <a id="cancelCtx" href="#cancelCtx">type cancelCtx struct</a>

```
searchKey: context.cancelCtx
```

```Go
type cancelCtx struct {
	Context

	mu       sync.Mutex            // protects following fields
	done     atomic.Value          // of chan struct{}, created lazily, closed by first cancel call
	children map[canceler]struct{} // set to nil by the first cancel call
	err      error                 // set to non-nil by the first cancel call
}
```

A cancelCtx can be canceled. When canceled, it also cancels any children that implement canceler. 

#### <a id="newCancelCtx" href="#newCancelCtx">func newCancelCtx(parent Context) cancelCtx</a>

```
searchKey: context.newCancelCtx
```

```Go
func newCancelCtx(parent Context) cancelCtx
```

newCancelCtx returns an initialized cancelCtx. 

#### <a id="parentCancelCtx" href="#parentCancelCtx">func parentCancelCtx(parent Context) (*cancelCtx, bool)</a>

```
searchKey: context.parentCancelCtx
```

```Go
func parentCancelCtx(parent Context) (*cancelCtx, bool)
```

parentCancelCtx returns the underlying *cancelCtx for parent. It does this by looking up parent.Value(&cancelCtxKey) to find the innermost enclosing *cancelCtx and then checking whether parent.Done() matches that *cancelCtx. (If not, the *cancelCtx has been wrapped in a custom implementation providing a different done channel, in which case we should not bypass it.) 

#### <a id="cancelCtx.Value" href="#cancelCtx.Value">func (c *cancelCtx) Value(key interface{}) interface{}</a>

```
searchKey: context.cancelCtx.Value
```

```Go
func (c *cancelCtx) Value(key interface{}) interface{}
```

#### <a id="cancelCtx.Done" href="#cancelCtx.Done">func (c *cancelCtx) Done() <-chan struct{}</a>

```
searchKey: context.cancelCtx.Done
```

```Go
func (c *cancelCtx) Done() <-chan struct{}
```

#### <a id="cancelCtx.Err" href="#cancelCtx.Err">func (c *cancelCtx) Err() error</a>

```
searchKey: context.cancelCtx.Err
```

```Go
func (c *cancelCtx) Err() error
```

#### <a id="cancelCtx.String" href="#cancelCtx.String">func (c *cancelCtx) String() string</a>

```
searchKey: context.cancelCtx.String
```

```Go
func (c *cancelCtx) String() string
```

#### <a id="cancelCtx.cancel" href="#cancelCtx.cancel">func (c *cancelCtx) cancel(removeFromParent bool, err error)</a>

```
searchKey: context.cancelCtx.cancel
```

```Go
func (c *cancelCtx) cancel(removeFromParent bool, err error)
```

cancel closes c.done, cancels each of c's children, and, if removeFromParent is true, removes c from its parent's children. 

### <a id="stringer" href="#stringer">type stringer interface</a>

```
searchKey: context.stringer
```

```Go
type stringer interface {
	String() string
}
```

### <a id="timerCtx" href="#timerCtx">type timerCtx struct</a>

```
searchKey: context.timerCtx
```

```Go
type timerCtx struct {
	cancelCtx
	timer *time.Timer // Under cancelCtx.mu.

	deadline time.Time
}
```

A timerCtx carries a timer and a deadline. It embeds a cancelCtx to implement Done and Err. It implements cancel by stopping its timer then delegating to cancelCtx.cancel. 

#### <a id="timerCtx.Deadline" href="#timerCtx.Deadline">func (c *timerCtx) Deadline() (deadline time.Time, ok bool)</a>

```
searchKey: context.timerCtx.Deadline
```

```Go
func (c *timerCtx) Deadline() (deadline time.Time, ok bool)
```

#### <a id="timerCtx.String" href="#timerCtx.String">func (c *timerCtx) String() string</a>

```
searchKey: context.timerCtx.String
```

```Go
func (c *timerCtx) String() string
```

#### <a id="timerCtx.cancel" href="#timerCtx.cancel">func (c *timerCtx) cancel(removeFromParent bool, err error)</a>

```
searchKey: context.timerCtx.cancel
```

```Go
func (c *timerCtx) cancel(removeFromParent bool, err error)
```

### <a id="valueCtx" href="#valueCtx">type valueCtx struct</a>

```
searchKey: context.valueCtx
```

```Go
type valueCtx struct {
	Context
	key, val interface{}
}
```

A valueCtx carries a key-value pair. It implements Value for that key and delegates all other calls to the embedded Context. 

#### <a id="valueCtx.String" href="#valueCtx.String">func (c *valueCtx) String() string</a>

```
searchKey: context.valueCtx.String
```

```Go
func (c *valueCtx) String() string
```

#### <a id="valueCtx.Value" href="#valueCtx.Value">func (c *valueCtx) Value(key interface{}) interface{}</a>

```
searchKey: context.valueCtx.Value
```

```Go
func (c *valueCtx) Value(key interface{}) interface{}
```

### <a id="testingT" href="#testingT">type testingT interface</a>

```
searchKey: context.testingT
```

```Go
type testingT interface {
	Deadline() (time.Time, bool)
	Error(args ...interface{})
	Errorf(format string, args ...interface{})
	Fail()
	FailNow()
	Failed() bool
	Fatal(args ...interface{})
	Fatalf(format string, args ...interface{})
	Helper()
	Log(args ...interface{})
	Logf(format string, args ...interface{})
	Name() string
	Parallel()
	Skip(args ...interface{})
	SkipNow()
	Skipf(format string, args ...interface{})
	Skipped() bool
}
```

### <a id="otherContext" href="#otherContext">type otherContext struct</a>

```
searchKey: context.otherContext
```

```Go
type otherContext struct {
	Context
}
```

otherContext is a Context that's not one of the types defined in context.go. This lets us test code paths that differ based on the underlying type of the Context. 

### <a id="key1" href="#key1">type key1 int</a>

```
searchKey: context.key1
```

```Go
type key1 int
```

### <a id="key2" href="#key2">type key2 int</a>

```
searchKey: context.key2
```

```Go
type key2 int
```

### <a id="myCtx" href="#myCtx">type myCtx struct</a>

```
searchKey: context.myCtx
```

```Go
type myCtx struct {
	Context
}
```

### <a id="myDoneCtx" href="#myDoneCtx">type myDoneCtx struct</a>

```
searchKey: context.myDoneCtx
```

```Go
type myDoneCtx struct {
	Context
}
```

#### <a id="myDoneCtx.Done" href="#myDoneCtx.Done">func (d *myDoneCtx) Done() <-chan struct{}</a>

```
searchKey: context.myDoneCtx.Done
```

```Go
func (d *myDoneCtx) Done() <-chan struct{}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="propagateCancel" href="#propagateCancel">func propagateCancel(parent Context, child canceler)</a>

```
searchKey: context.propagateCancel
```

```Go
func propagateCancel(parent Context, child canceler)
```

propagateCancel arranges for child to be canceled when parent is. 

### <a id="removeChild" href="#removeChild">func removeChild(parent Context, child canceler)</a>

```
searchKey: context.removeChild
```

```Go
func removeChild(parent Context, child canceler)
```

removeChild removes a context from its parent. 

### <a id="init" href="#init">func init()</a>

```
searchKey: context.init
```

```Go
func init()
```

### <a id="contextName" href="#contextName">func contextName(c Context) string</a>

```
searchKey: context.contextName
```

```Go
func contextName(c Context) string
```

### <a id="stringify" href="#stringify">func stringify(v interface{}) string</a>

```
searchKey: context.stringify
```

```Go
func stringify(v interface{}) string
```

stringify tries a bit to stringify v, without using fmt, since we don't want context depending on the unicode tables. This is only used by *valueCtx.String(). 

### <a id="quiescent" href="#quiescent">func quiescent(t testingT) time.Duration</a>

```
searchKey: context.quiescent
```

```Go
func quiescent(t testingT) time.Duration
```

quiescent returns an arbitrary duration by which the program should have completed any remaining work and reached a steady (idle) state. 

### <a id="XTestBackground" href="#XTestBackground">func XTestBackground(t testingT)</a>

```
searchKey: context.XTestBackground
```

```Go
func XTestBackground(t testingT)
```

### <a id="XTestTODO" href="#XTestTODO">func XTestTODO(t testingT)</a>

```
searchKey: context.XTestTODO
```

```Go
func XTestTODO(t testingT)
```

### <a id="XTestWithCancel" href="#XTestWithCancel">func XTestWithCancel(t testingT)</a>

```
searchKey: context.XTestWithCancel
```

```Go
func XTestWithCancel(t testingT)
```

### <a id="contains" href="#contains">func contains(m map[canceler]struct{}, key canceler) bool</a>

```
searchKey: context.contains
```

```Go
func contains(m map[canceler]struct{}, key canceler) bool
```

### <a id="XTestParentFinishesChild" href="#XTestParentFinishesChild">func XTestParentFinishesChild(t testingT)</a>

```
searchKey: context.XTestParentFinishesChild
```

```Go
func XTestParentFinishesChild(t testingT)
```

### <a id="XTestChildFinishesFirst" href="#XTestChildFinishesFirst">func XTestChildFinishesFirst(t testingT)</a>

```
searchKey: context.XTestChildFinishesFirst
```

```Go
func XTestChildFinishesFirst(t testingT)
```

### <a id="testDeadline" href="#testDeadline">func testDeadline(c Context, name string, t testingT)</a>

```
searchKey: context.testDeadline
```

```Go
func testDeadline(c Context, name string, t testingT)
```

### <a id="XTestDeadline" href="#XTestDeadline">func XTestDeadline(t testingT)</a>

```
searchKey: context.XTestDeadline
```

```Go
func XTestDeadline(t testingT)
```

### <a id="XTestTimeout" href="#XTestTimeout">func XTestTimeout(t testingT)</a>

```
searchKey: context.XTestTimeout
```

```Go
func XTestTimeout(t testingT)
```

### <a id="XTestCanceledTimeout" href="#XTestCanceledTimeout">func XTestCanceledTimeout(t testingT)</a>

```
searchKey: context.XTestCanceledTimeout
```

```Go
func XTestCanceledTimeout(t testingT)
```

### <a id="XTestValues" href="#XTestValues">func XTestValues(t testingT)</a>

```
searchKey: context.XTestValues
```

```Go
func XTestValues(t testingT)
```

### <a id="XTestAllocs" href="#XTestAllocs">func XTestAllocs(t testingT, testingShort func() bool, testingAllocsPerRun func(int, func()) float64)</a>

```
searchKey: context.XTestAllocs
```

```Go
func XTestAllocs(t testingT, testingShort func() bool, testingAllocsPerRun func(int, func()) float64)
```

### <a id="XTestSimultaneousCancels" href="#XTestSimultaneousCancels">func XTestSimultaneousCancels(t testingT)</a>

```
searchKey: context.XTestSimultaneousCancels
```

```Go
func XTestSimultaneousCancels(t testingT)
```

### <a id="XTestInterlockedCancels" href="#XTestInterlockedCancels">func XTestInterlockedCancels(t testingT)</a>

```
searchKey: context.XTestInterlockedCancels
```

```Go
func XTestInterlockedCancels(t testingT)
```

### <a id="XTestLayersCancel" href="#XTestLayersCancel">func XTestLayersCancel(t testingT)</a>

```
searchKey: context.XTestLayersCancel
```

```Go
func XTestLayersCancel(t testingT)
```

### <a id="XTestLayersTimeout" href="#XTestLayersTimeout">func XTestLayersTimeout(t testingT)</a>

```
searchKey: context.XTestLayersTimeout
```

```Go
func XTestLayersTimeout(t testingT)
```

### <a id="testLayers" href="#testLayers">func testLayers(t testingT, seed int64, testTimeout bool)</a>

```
searchKey: context.testLayers
```

```Go
func testLayers(t testingT, seed int64, testTimeout bool)
```

### <a id="XTestCancelRemoves" href="#XTestCancelRemoves">func XTestCancelRemoves(t testingT)</a>

```
searchKey: context.XTestCancelRemoves
```

```Go
func XTestCancelRemoves(t testingT)
```

### <a id="XTestWithCancelCanceledParent" href="#XTestWithCancelCanceledParent">func XTestWithCancelCanceledParent(t testingT)</a>

```
searchKey: context.XTestWithCancelCanceledParent
```

```Go
func XTestWithCancelCanceledParent(t testingT)
```

### <a id="XTestWithValueChecksKey" href="#XTestWithValueChecksKey">func XTestWithValueChecksKey(t testingT)</a>

```
searchKey: context.XTestWithValueChecksKey
```

```Go
func XTestWithValueChecksKey(t testingT)
```

### <a id="XTestInvalidDerivedFail" href="#XTestInvalidDerivedFail">func XTestInvalidDerivedFail(t testingT)</a>

```
searchKey: context.XTestInvalidDerivedFail
```

```Go
func XTestInvalidDerivedFail(t testingT)
```

### <a id="recoveredValue" href="#recoveredValue">func recoveredValue(fn func()) (v interface{})</a>

```
searchKey: context.recoveredValue
```

```Go
func recoveredValue(fn func()) (v interface{})
```

### <a id="XTestDeadlineExceededSupportsTimeout" href="#XTestDeadlineExceededSupportsTimeout">func XTestDeadlineExceededSupportsTimeout(t testingT)</a>

```
searchKey: context.XTestDeadlineExceededSupportsTimeout
```

```Go
func XTestDeadlineExceededSupportsTimeout(t testingT)
```

### <a id="XTestCustomContextGoroutines" href="#XTestCustomContextGoroutines">func XTestCustomContextGoroutines(t testingT)</a>

```
searchKey: context.XTestCustomContextGoroutines
```

```Go
func XTestCustomContextGoroutines(t testingT)
```

