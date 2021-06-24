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
    * [var cancelCtxKey](#cancelCtxKey)
    * [var closedchan](#closedchan)
    * [var goroutines](#goroutines)
    * [var k1](#k1)
    * [var k2](#k2)
    * [var k3](#k3)
    * [var todo](#todo)
* [Types](#type)
    * [type CancelFunc func()](#CancelFunc)
        * [func WithCancel(parent Context) (ctx Context, cancel CancelFunc)](#WithCancel)
        * [func WithDeadline(parent Context, d time.Time) (Context, CancelFunc)](#WithDeadline)
        * [func WithTimeout(parent Context, timeout time.Duration) (Context, CancelFunc)](#WithTimeout)
    * [type Context interface](#Context)
        * [func Background() Context](#Background)
        * [func TODO() Context](#TODO)
        * [func WithValue(parent Context, key, val interface{}) Context](#WithValue)
    * [type cancelCtx struct](#cancelCtx)
        * [func newCancelCtx(parent Context) cancelCtx](#newCancelCtx)
        * [func parentCancelCtx(parent Context) (*cancelCtx, bool)](#parentCancelCtx)
        * [func (c *cancelCtx) Done() <-chan struct{}](#cancelCtx.Done)
        * [func (c *cancelCtx) Err() error](#cancelCtx.Err)
        * [func (c *cancelCtx) String() string](#cancelCtx.String)
        * [func (c *cancelCtx) Value(key interface{}) interface{}](#cancelCtx.Value)
        * [func (c *cancelCtx) cancel(removeFromParent bool, err error)](#cancelCtx.cancel)
    * [type canceler interface](#canceler)
    * [type deadlineExceededError struct{}](#deadlineExceededError)
        * [func (deadlineExceededError) Error() string](#deadlineExceededError.Error)
        * [func (deadlineExceededError) Temporary() bool](#deadlineExceededError.Temporary)
        * [func (deadlineExceededError) Timeout() bool](#deadlineExceededError.Timeout)
    * [type emptyCtx int](#emptyCtx)
        * [func (*emptyCtx) Deadline() (deadline time.Time, ok bool)](#emptyCtx.Deadline)
        * [func (*emptyCtx) Done() <-chan struct{}](#emptyCtx.Done)
        * [func (*emptyCtx) Err() error](#emptyCtx.Err)
        * [func (e *emptyCtx) String() string](#emptyCtx.String)
        * [func (*emptyCtx) Value(key interface{}) interface{}](#emptyCtx.Value)
    * [type key1 int](#key1)
    * [type key2 int](#key2)
    * [type myCtx struct](#myCtx)
    * [type myDoneCtx struct](#myDoneCtx)
        * [func (d *myDoneCtx) Done() <-chan struct{}](#myDoneCtx.Done)
    * [type otherContext struct](#otherContext)
    * [type stringer interface](#stringer)
    * [type testingT interface](#testingT)
    * [type timerCtx struct](#timerCtx)
        * [func (c *timerCtx) Deadline() (deadline time.Time, ok bool)](#timerCtx.Deadline)
        * [func (c *timerCtx) String() string](#timerCtx.String)
        * [func (c *timerCtx) cancel(removeFromParent bool, err error)](#timerCtx.cancel)
    * [type valueCtx struct](#valueCtx)
        * [func (c *valueCtx) String() string](#valueCtx.String)
        * [func (c *valueCtx) Value(key interface{}) interface{}](#valueCtx.Value)
* [Functions](#func)
    * [func XTestAllocs(t testingT, testingShort func() bool, testingAllocsPerRun func(int, func()) float64)](#XTestAllocs)
    * [func XTestBackground(t testingT)](#XTestBackground)
    * [func XTestCancelRemoves(t testingT)](#XTestCancelRemoves)
    * [func XTestCanceledTimeout(t testingT)](#XTestCanceledTimeout)
    * [func XTestChildFinishesFirst(t testingT)](#XTestChildFinishesFirst)
    * [func XTestCustomContextGoroutines(t testingT)](#XTestCustomContextGoroutines)
    * [func XTestDeadline(t testingT)](#XTestDeadline)
    * [func XTestDeadlineExceededSupportsTimeout(t testingT)](#XTestDeadlineExceededSupportsTimeout)
    * [func XTestInterlockedCancels(t testingT)](#XTestInterlockedCancels)
    * [func XTestInvalidDerivedFail(t testingT)](#XTestInvalidDerivedFail)
    * [func XTestLayersCancel(t testingT)](#XTestLayersCancel)
    * [func XTestLayersTimeout(t testingT)](#XTestLayersTimeout)
    * [func XTestParentFinishesChild(t testingT)](#XTestParentFinishesChild)
    * [func XTestSimultaneousCancels(t testingT)](#XTestSimultaneousCancels)
    * [func XTestTODO(t testingT)](#XTestTODO)
    * [func XTestTimeout(t testingT)](#XTestTimeout)
    * [func XTestValues(t testingT)](#XTestValues)
    * [func XTestWithCancel(t testingT)](#XTestWithCancel)
    * [func XTestWithCancelCanceledParent(t testingT)](#XTestWithCancelCanceledParent)
    * [func XTestWithValueChecksKey(t testingT)](#XTestWithValueChecksKey)
    * [func contains(m map[canceler]struct{}, key canceler) bool](#contains)
    * [func contextName(c Context) string](#contextName)
    * [func init()](#init.context.go)
    * [func propagateCancel(parent Context, child canceler)](#propagateCancel)
    * [func quiescent(t testingT) time.Duration](#quiescent)
    * [func recoveredValue(fn func()) (v interface{})](#recoveredValue)
    * [func removeChild(parent Context, child canceler)](#removeChild)
    * [func stringify(v interface{}) string](#stringify)
    * [func testDeadline(c Context, name string, t testingT)](#testDeadline)
    * [func testLayers(t testingT, seed int64, testTimeout bool)](#testLayers)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="shortDuration" href="#shortDuration">const shortDuration</a>

```
searchKey: context.shortDuration
tags: [constant number private]
```

```Go
const shortDuration = 1 * time.Millisecond // a reasonable duration to block in a test

```

### <a id="veryLongDuration" href="#veryLongDuration">const veryLongDuration</a>

```
searchKey: context.veryLongDuration
tags: [constant number private]
```

```Go
const veryLongDuration = 1000 * time.Hour // an arbitrary upper bound on the test's running time

```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="Canceled" href="#Canceled">var Canceled</a>

```
searchKey: context.Canceled
tags: [variable interface]
```

```Go
var Canceled = errors.New("context canceled")
```

Canceled is the error returned by Context.Err when the context is canceled. 

### <a id="DeadlineExceeded" href="#DeadlineExceeded">var DeadlineExceeded</a>

```
searchKey: context.DeadlineExceeded
tags: [variable interface]
```

```Go
var DeadlineExceeded error = deadlineExceededError{}
```

DeadlineExceeded is the error returned by Context.Err when the context's deadline passes. 

### <a id="background" href="#background">var background</a>

```
searchKey: context.background
tags: [variable number private]
```

```Go
var background = new(emptyCtx)
```

### <a id="cancelCtxKey" href="#cancelCtxKey">var cancelCtxKey</a>

```
searchKey: context.cancelCtxKey
tags: [variable number private]
```

```Go
var cancelCtxKey int
```

&cancelCtxKey is the key that a cancelCtx returns itself for. 

### <a id="closedchan" href="#closedchan">var closedchan</a>

```
searchKey: context.closedchan
tags: [variable private]
```

```Go
var closedchan = make(chan struct{})
```

closedchan is a reusable closed channel. 

### <a id="goroutines" href="#goroutines">var goroutines</a>

```
searchKey: context.goroutines
tags: [variable number private]
```

```Go
var goroutines int32
```

goroutines counts the number of goroutines ever created; for testing. 

### <a id="k1" href="#k1">var k1</a>

```
searchKey: context.k1
tags: [variable number private]
```

```Go
var k1 = key1(1)
```

### <a id="k2" href="#k2">var k2</a>

```
searchKey: context.k2
tags: [variable number private]
```

```Go
var k2 = key2(1) // same int as k1, different type

```

### <a id="k3" href="#k3">var k3</a>

```
searchKey: context.k3
tags: [variable number private]
```

```Go
var k3 = key2(3) // same type as k2, different int

```

### <a id="todo" href="#todo">var todo</a>

```
searchKey: context.todo
tags: [variable number private]
```

```Go
var todo = new(emptyCtx)
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="CancelFunc" href="#CancelFunc">type CancelFunc func()</a>

```
searchKey: context.CancelFunc
tags: [function]
```

```Go
type CancelFunc func()
```

A CancelFunc tells an operation to abandon its work. A CancelFunc does not wait for the work to stop. A CancelFunc may be called by multiple goroutines simultaneously. After the first call, subsequent calls to a CancelFunc do nothing. 

#### <a id="WithCancel" href="#WithCancel">func WithCancel(parent Context) (ctx Context, cancel CancelFunc)</a>

```
searchKey: context.WithCancel
tags: [method]
```

```Go
func WithCancel(parent Context) (ctx Context, cancel CancelFunc)
```

WithCancel returns a copy of parent with a new Done channel. The returned context's Done channel is closed when the returned cancel function is called or when the parent context's Done channel is closed, whichever happens first. 

Canceling this context releases resources associated with it, so code should call cancel as soon as the operations running in this Context complete. 

#### <a id="WithDeadline" href="#WithDeadline">func WithDeadline(parent Context, d time.Time) (Context, CancelFunc)</a>

```
searchKey: context.WithDeadline
tags: [method]
```

```Go
func WithDeadline(parent Context, d time.Time) (Context, CancelFunc)
```

WithDeadline returns a copy of the parent context with the deadline adjusted to be no later than d. If the parent's deadline is already earlier than d, WithDeadline(parent, d) is semantically equivalent to parent. The returned context's Done channel is closed when the deadline expires, when the returned cancel function is called, or when the parent context's Done channel is closed, whichever happens first. 

Canceling this context releases resources associated with it, so code should call cancel as soon as the operations running in this Context complete. 

#### <a id="WithTimeout" href="#WithTimeout">func WithTimeout(parent Context, timeout time.Duration) (Context, CancelFunc)</a>

```
searchKey: context.WithTimeout
tags: [method]
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
### <a id="Context" href="#Context">type Context interface</a>

```
searchKey: context.Context
tags: [interface]
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
tags: [function]
```

```Go
func Background() Context
```

Background returns a non-nil, empty Context. It is never canceled, has no values, and has no deadline. It is typically used by the main function, initialization, and tests, and as the top-level Context for incoming requests. 

#### <a id="TODO" href="#TODO">func TODO() Context</a>

```
searchKey: context.TODO
tags: [function]
```

```Go
func TODO() Context
```

TODO returns a non-nil, empty Context. Code should use context.TODO when it's unclear which Context to use or it is not yet available (because the surrounding function has not yet been extended to accept a Context parameter). 

#### <a id="WithValue" href="#WithValue">func WithValue(parent Context, key, val interface{}) Context</a>

```
searchKey: context.WithValue
tags: [method]
```

```Go
func WithValue(parent Context, key, val interface{}) Context
```

WithValue returns a copy of parent in which the value associated with key is val. 

Use context Values only for request-scoped data that transits processes and APIs, not for passing optional parameters to functions. 

The provided key must be comparable and should not be of type string or any other built-in type to avoid collisions between packages using context. Users of WithValue should define their own types for keys. To avoid allocating when assigning to an interface{}, context keys often have concrete type struct{}. Alternatively, exported context key variables' static type should be a pointer or interface. 

### <a id="cancelCtx" href="#cancelCtx">type cancelCtx struct</a>

```
searchKey: context.cancelCtx
tags: [struct private]
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
tags: [method private]
```

```Go
func newCancelCtx(parent Context) cancelCtx
```

newCancelCtx returns an initialized cancelCtx. 

#### <a id="parentCancelCtx" href="#parentCancelCtx">func parentCancelCtx(parent Context) (*cancelCtx, bool)</a>

```
searchKey: context.parentCancelCtx
tags: [method private]
```

```Go
func parentCancelCtx(parent Context) (*cancelCtx, bool)
```

parentCancelCtx returns the underlying *cancelCtx for parent. It does this by looking up parent.Value(&cancelCtxKey) to find the innermost enclosing *cancelCtx and then checking whether parent.Done() matches that *cancelCtx. (If not, the *cancelCtx has been wrapped in a custom implementation providing a different done channel, in which case we should not bypass it.) 

#### <a id="cancelCtx.Done" href="#cancelCtx.Done">func (c *cancelCtx) Done() <-chan struct{}</a>

```
searchKey: context.cancelCtx.Done
tags: [function private]
```

```Go
func (c *cancelCtx) Done() <-chan struct{}
```

#### <a id="cancelCtx.Err" href="#cancelCtx.Err">func (c *cancelCtx) Err() error</a>

```
searchKey: context.cancelCtx.Err
tags: [function private]
```

```Go
func (c *cancelCtx) Err() error
```

#### <a id="cancelCtx.String" href="#cancelCtx.String">func (c *cancelCtx) String() string</a>

```
searchKey: context.cancelCtx.String
tags: [function private]
```

```Go
func (c *cancelCtx) String() string
```

#### <a id="cancelCtx.Value" href="#cancelCtx.Value">func (c *cancelCtx) Value(key interface{}) interface{}</a>

```
searchKey: context.cancelCtx.Value
tags: [method private]
```

```Go
func (c *cancelCtx) Value(key interface{}) interface{}
```

#### <a id="cancelCtx.cancel" href="#cancelCtx.cancel">func (c *cancelCtx) cancel(removeFromParent bool, err error)</a>

```
searchKey: context.cancelCtx.cancel
tags: [method private]
```

```Go
func (c *cancelCtx) cancel(removeFromParent bool, err error)
```

cancel closes c.done, cancels each of c's children, and, if removeFromParent is true, removes c from its parent's children. 

### <a id="canceler" href="#canceler">type canceler interface</a>

```
searchKey: context.canceler
tags: [interface private]
```

```Go
type canceler interface {
	cancel(removeFromParent bool, err error)
	Done() <-chan struct{}
}
```

A canceler is a context type that can be canceled directly. The implementations are *cancelCtx and *timerCtx. 

### <a id="deadlineExceededError" href="#deadlineExceededError">type deadlineExceededError struct{}</a>

```
searchKey: context.deadlineExceededError
tags: [struct private]
```

```Go
type deadlineExceededError struct{}
```

#### <a id="deadlineExceededError.Error" href="#deadlineExceededError.Error">func (deadlineExceededError) Error() string</a>

```
searchKey: context.deadlineExceededError.Error
tags: [function private]
```

```Go
func (deadlineExceededError) Error() string
```

#### <a id="deadlineExceededError.Temporary" href="#deadlineExceededError.Temporary">func (deadlineExceededError) Temporary() bool</a>

```
searchKey: context.deadlineExceededError.Temporary
tags: [function private]
```

```Go
func (deadlineExceededError) Temporary() bool
```

#### <a id="deadlineExceededError.Timeout" href="#deadlineExceededError.Timeout">func (deadlineExceededError) Timeout() bool</a>

```
searchKey: context.deadlineExceededError.Timeout
tags: [function private]
```

```Go
func (deadlineExceededError) Timeout() bool
```

### <a id="emptyCtx" href="#emptyCtx">type emptyCtx int</a>

```
searchKey: context.emptyCtx
tags: [number private]
```

```Go
type emptyCtx int
```

An emptyCtx is never canceled, has no values, and has no deadline. It is not struct{}, since vars of this type must have distinct addresses. 

#### <a id="emptyCtx.Deadline" href="#emptyCtx.Deadline">func (*emptyCtx) Deadline() (deadline time.Time, ok bool)</a>

```
searchKey: context.emptyCtx.Deadline
tags: [function private]
```

```Go
func (*emptyCtx) Deadline() (deadline time.Time, ok bool)
```

#### <a id="emptyCtx.Done" href="#emptyCtx.Done">func (*emptyCtx) Done() <-chan struct{}</a>

```
searchKey: context.emptyCtx.Done
tags: [function private]
```

```Go
func (*emptyCtx) Done() <-chan struct{}
```

#### <a id="emptyCtx.Err" href="#emptyCtx.Err">func (*emptyCtx) Err() error</a>

```
searchKey: context.emptyCtx.Err
tags: [function private]
```

```Go
func (*emptyCtx) Err() error
```

#### <a id="emptyCtx.String" href="#emptyCtx.String">func (e *emptyCtx) String() string</a>

```
searchKey: context.emptyCtx.String
tags: [function private]
```

```Go
func (e *emptyCtx) String() string
```

#### <a id="emptyCtx.Value" href="#emptyCtx.Value">func (*emptyCtx) Value(key interface{}) interface{}</a>

```
searchKey: context.emptyCtx.Value
tags: [method private]
```

```Go
func (*emptyCtx) Value(key interface{}) interface{}
```

### <a id="key1" href="#key1">type key1 int</a>

```
searchKey: context.key1
tags: [number private]
```

```Go
type key1 int
```

### <a id="key2" href="#key2">type key2 int</a>

```
searchKey: context.key2
tags: [number private]
```

```Go
type key2 int
```

### <a id="myCtx" href="#myCtx">type myCtx struct</a>

```
searchKey: context.myCtx
tags: [struct private]
```

```Go
type myCtx struct {
	Context
}
```

### <a id="myDoneCtx" href="#myDoneCtx">type myDoneCtx struct</a>

```
searchKey: context.myDoneCtx
tags: [struct private]
```

```Go
type myDoneCtx struct {
	Context
}
```

#### <a id="myDoneCtx.Done" href="#myDoneCtx.Done">func (d *myDoneCtx) Done() <-chan struct{}</a>

```
searchKey: context.myDoneCtx.Done
tags: [function private]
```

```Go
func (d *myDoneCtx) Done() <-chan struct{}
```

### <a id="otherContext" href="#otherContext">type otherContext struct</a>

```
searchKey: context.otherContext
tags: [struct private]
```

```Go
type otherContext struct {
	Context
}
```

otherContext is a Context that's not one of the types defined in context.go. This lets us test code paths that differ based on the underlying type of the Context. 

### <a id="stringer" href="#stringer">type stringer interface</a>

```
searchKey: context.stringer
tags: [interface private]
```

```Go
type stringer interface {
	String() string
}
```

### <a id="testingT" href="#testingT">type testingT interface</a>

```
searchKey: context.testingT
tags: [interface private]
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

### <a id="timerCtx" href="#timerCtx">type timerCtx struct</a>

```
searchKey: context.timerCtx
tags: [struct private]
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
tags: [function private]
```

```Go
func (c *timerCtx) Deadline() (deadline time.Time, ok bool)
```

#### <a id="timerCtx.String" href="#timerCtx.String">func (c *timerCtx) String() string</a>

```
searchKey: context.timerCtx.String
tags: [function private]
```

```Go
func (c *timerCtx) String() string
```

#### <a id="timerCtx.cancel" href="#timerCtx.cancel">func (c *timerCtx) cancel(removeFromParent bool, err error)</a>

```
searchKey: context.timerCtx.cancel
tags: [method private]
```

```Go
func (c *timerCtx) cancel(removeFromParent bool, err error)
```

### <a id="valueCtx" href="#valueCtx">type valueCtx struct</a>

```
searchKey: context.valueCtx
tags: [struct private]
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
tags: [function private]
```

```Go
func (c *valueCtx) String() string
```

#### <a id="valueCtx.Value" href="#valueCtx.Value">func (c *valueCtx) Value(key interface{}) interface{}</a>

```
searchKey: context.valueCtx.Value
tags: [method private]
```

```Go
func (c *valueCtx) Value(key interface{}) interface{}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="XTestAllocs" href="#XTestAllocs">func XTestAllocs(t testingT, testingShort func() bool, testingAllocsPerRun func(int, func()) float64)</a>

```
searchKey: context.XTestAllocs
tags: [method private]
```

```Go
func XTestAllocs(t testingT, testingShort func() bool, testingAllocsPerRun func(int, func()) float64)
```

### <a id="XTestBackground" href="#XTestBackground">func XTestBackground(t testingT)</a>

```
searchKey: context.XTestBackground
tags: [method private]
```

```Go
func XTestBackground(t testingT)
```

### <a id="XTestCancelRemoves" href="#XTestCancelRemoves">func XTestCancelRemoves(t testingT)</a>

```
searchKey: context.XTestCancelRemoves
tags: [method private]
```

```Go
func XTestCancelRemoves(t testingT)
```

### <a id="XTestCanceledTimeout" href="#XTestCanceledTimeout">func XTestCanceledTimeout(t testingT)</a>

```
searchKey: context.XTestCanceledTimeout
tags: [method private]
```

```Go
func XTestCanceledTimeout(t testingT)
```

### <a id="XTestChildFinishesFirst" href="#XTestChildFinishesFirst">func XTestChildFinishesFirst(t testingT)</a>

```
searchKey: context.XTestChildFinishesFirst
tags: [method private]
```

```Go
func XTestChildFinishesFirst(t testingT)
```

### <a id="XTestCustomContextGoroutines" href="#XTestCustomContextGoroutines">func XTestCustomContextGoroutines(t testingT)</a>

```
searchKey: context.XTestCustomContextGoroutines
tags: [method private]
```

```Go
func XTestCustomContextGoroutines(t testingT)
```

### <a id="XTestDeadline" href="#XTestDeadline">func XTestDeadline(t testingT)</a>

```
searchKey: context.XTestDeadline
tags: [method private]
```

```Go
func XTestDeadline(t testingT)
```

### <a id="XTestDeadlineExceededSupportsTimeout" href="#XTestDeadlineExceededSupportsTimeout">func XTestDeadlineExceededSupportsTimeout(t testingT)</a>

```
searchKey: context.XTestDeadlineExceededSupportsTimeout
tags: [method private]
```

```Go
func XTestDeadlineExceededSupportsTimeout(t testingT)
```

### <a id="XTestInterlockedCancels" href="#XTestInterlockedCancels">func XTestInterlockedCancels(t testingT)</a>

```
searchKey: context.XTestInterlockedCancels
tags: [method private]
```

```Go
func XTestInterlockedCancels(t testingT)
```

### <a id="XTestInvalidDerivedFail" href="#XTestInvalidDerivedFail">func XTestInvalidDerivedFail(t testingT)</a>

```
searchKey: context.XTestInvalidDerivedFail
tags: [method private]
```

```Go
func XTestInvalidDerivedFail(t testingT)
```

### <a id="XTestLayersCancel" href="#XTestLayersCancel">func XTestLayersCancel(t testingT)</a>

```
searchKey: context.XTestLayersCancel
tags: [method private]
```

```Go
func XTestLayersCancel(t testingT)
```

### <a id="XTestLayersTimeout" href="#XTestLayersTimeout">func XTestLayersTimeout(t testingT)</a>

```
searchKey: context.XTestLayersTimeout
tags: [method private]
```

```Go
func XTestLayersTimeout(t testingT)
```

### <a id="XTestParentFinishesChild" href="#XTestParentFinishesChild">func XTestParentFinishesChild(t testingT)</a>

```
searchKey: context.XTestParentFinishesChild
tags: [method private]
```

```Go
func XTestParentFinishesChild(t testingT)
```

### <a id="XTestSimultaneousCancels" href="#XTestSimultaneousCancels">func XTestSimultaneousCancels(t testingT)</a>

```
searchKey: context.XTestSimultaneousCancels
tags: [method private]
```

```Go
func XTestSimultaneousCancels(t testingT)
```

### <a id="XTestTODO" href="#XTestTODO">func XTestTODO(t testingT)</a>

```
searchKey: context.XTestTODO
tags: [method private]
```

```Go
func XTestTODO(t testingT)
```

### <a id="XTestTimeout" href="#XTestTimeout">func XTestTimeout(t testingT)</a>

```
searchKey: context.XTestTimeout
tags: [method private]
```

```Go
func XTestTimeout(t testingT)
```

### <a id="XTestValues" href="#XTestValues">func XTestValues(t testingT)</a>

```
searchKey: context.XTestValues
tags: [method private]
```

```Go
func XTestValues(t testingT)
```

### <a id="XTestWithCancel" href="#XTestWithCancel">func XTestWithCancel(t testingT)</a>

```
searchKey: context.XTestWithCancel
tags: [method private]
```

```Go
func XTestWithCancel(t testingT)
```

### <a id="XTestWithCancelCanceledParent" href="#XTestWithCancelCanceledParent">func XTestWithCancelCanceledParent(t testingT)</a>

```
searchKey: context.XTestWithCancelCanceledParent
tags: [method private]
```

```Go
func XTestWithCancelCanceledParent(t testingT)
```

### <a id="XTestWithValueChecksKey" href="#XTestWithValueChecksKey">func XTestWithValueChecksKey(t testingT)</a>

```
searchKey: context.XTestWithValueChecksKey
tags: [method private]
```

```Go
func XTestWithValueChecksKey(t testingT)
```

### <a id="contains" href="#contains">func contains(m map[canceler]struct{}, key canceler) bool</a>

```
searchKey: context.contains
tags: [method private]
```

```Go
func contains(m map[canceler]struct{}, key canceler) bool
```

### <a id="contextName" href="#contextName">func contextName(c Context) string</a>

```
searchKey: context.contextName
tags: [method private]
```

```Go
func contextName(c Context) string
```

### <a id="init.context.go" href="#init.context.go">func init()</a>

```
searchKey: context.init
tags: [function private]
```

```Go
func init()
```

### <a id="propagateCancel" href="#propagateCancel">func propagateCancel(parent Context, child canceler)</a>

```
searchKey: context.propagateCancel
tags: [method private]
```

```Go
func propagateCancel(parent Context, child canceler)
```

propagateCancel arranges for child to be canceled when parent is. 

### <a id="quiescent" href="#quiescent">func quiescent(t testingT) time.Duration</a>

```
searchKey: context.quiescent
tags: [method private]
```

```Go
func quiescent(t testingT) time.Duration
```

quiescent returns an arbitrary duration by which the program should have completed any remaining work and reached a steady (idle) state. 

### <a id="recoveredValue" href="#recoveredValue">func recoveredValue(fn func()) (v interface{})</a>

```
searchKey: context.recoveredValue
tags: [method private]
```

```Go
func recoveredValue(fn func()) (v interface{})
```

### <a id="removeChild" href="#removeChild">func removeChild(parent Context, child canceler)</a>

```
searchKey: context.removeChild
tags: [method private]
```

```Go
func removeChild(parent Context, child canceler)
```

removeChild removes a context from its parent. 

### <a id="stringify" href="#stringify">func stringify(v interface{}) string</a>

```
searchKey: context.stringify
tags: [method private]
```

```Go
func stringify(v interface{}) string
```

stringify tries a bit to stringify v, without using fmt, since we don't want context depending on the unicode tables. This is only used by *valueCtx.String(). 

### <a id="testDeadline" href="#testDeadline">func testDeadline(c Context, name string, t testingT)</a>

```
searchKey: context.testDeadline
tags: [method private]
```

```Go
func testDeadline(c Context, name string, t testingT)
```

### <a id="testLayers" href="#testLayers">func testLayers(t testingT, seed int64, testTimeout bool)</a>

```
searchKey: context.testLayers
tags: [method private]
```

```Go
func testLayers(t testingT, seed int64, testTimeout bool)
```

