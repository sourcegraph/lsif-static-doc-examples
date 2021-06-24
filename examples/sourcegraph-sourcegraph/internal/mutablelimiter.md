# Package mutablelimiter

package mutablelimiter provides a Limiter (Semaphore) which supports havings its limit (capacity) adjusted and is integrated with context.Context. 

## Index

* [Types](#type)
    * [type Limiter struct](#Limiter)
        * [func New(limit int) *Limiter](#New)
        * [func (l *Limiter) Acquire(ctx context.Context) (context.Context, context.CancelFunc, error)](#Limiter.Acquire)
        * [func (l Limiter) GetLimit() (cap, len int)](#Limiter.GetLimit)
        * [func (l *Limiter) SetLimit(limit int)](#Limiter.SetLimit)
        * [func (l *Limiter) do(limit int)](#Limiter.do)
    * [type acquireRequest struct](#acquireRequest)
    * [type acquireResponse struct](#acquireResponse)
* [Functions](#func)
    * [func TestLimiter(t *testing.T)](#TestLimiter)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Limiter" href="#Limiter">type Limiter struct</a>

```
searchKey: mutablelimiter.Limiter
tags: [struct]
```

```Go
type Limiter struct {
	adjustLimit chan int
	acquire     chan acquireRequest
	getLimit    chan struct{ cap, len int }
}
```

Limiter is a semaphore which supports having it's limit (capacity) adjusted. It integrates with context.Context to handle adjusting the limit down. 

Note: Each Limiter has an associated goroutine managing the semaphore state. We do not expose a way to stop this goroutine, so ensure the number of Limiters created is bounded. 

#### <a id="New" href="#New">func New(limit int) *Limiter</a>

```
searchKey: mutablelimiter.New
tags: [method]
```

```Go
func New(limit int) *Limiter
```

New returns a new Limiter (Semaphore). 

#### <a id="Limiter.Acquire" href="#Limiter.Acquire">func (l *Limiter) Acquire(ctx context.Context) (context.Context, context.CancelFunc, error)</a>

```
searchKey: mutablelimiter.Limiter.Acquire
tags: [method]
```

```Go
func (l *Limiter) Acquire(ctx context.Context) (context.Context, context.CancelFunc, error)
```

Acquire tries to acquire a context. On success a child context of ctx is returned. The cancel function must be called to release the acquired context. Cancel will also cancel the child context and is safe to call more than once (idempotent). 

If ctx is Done before we can acquire, then the context error is returned. 

#### <a id="Limiter.GetLimit" href="#Limiter.GetLimit">func (l Limiter) GetLimit() (cap, len int)</a>

```
searchKey: mutablelimiter.Limiter.GetLimit
tags: [function]
```

```Go
func (l Limiter) GetLimit() (cap, len int)
```

GetLimit reports the current state of the limiter, returning the capacity and length (maximum and currently-in-use). 

#### <a id="Limiter.SetLimit" href="#Limiter.SetLimit">func (l *Limiter) SetLimit(limit int)</a>

```
searchKey: mutablelimiter.Limiter.SetLimit
tags: [method]
```

```Go
func (l *Limiter) SetLimit(limit int)
```

SetLimit adjusts the limit. If we currently have more than limit context acquired, then contexts are canceled until we are within limit. Contexts are canceled such that the older contexts are canceled. 

#### <a id="Limiter.do" href="#Limiter.do">func (l *Limiter) do(limit int)</a>

```
searchKey: mutablelimiter.Limiter.do
tags: [method private]
```

```Go
func (l *Limiter) do(limit int)
```

### <a id="acquireRequest" href="#acquireRequest">type acquireRequest struct</a>

```
searchKey: mutablelimiter.acquireRequest
tags: [struct private]
```

```Go
type acquireRequest struct {
	ctx  context.Context
	resp chan<- acquireResponse
}
```

### <a id="acquireResponse" href="#acquireResponse">type acquireResponse struct</a>

```
searchKey: mutablelimiter.acquireResponse
tags: [struct private]
```

```Go
type acquireResponse struct {
	ctx    context.Context
	cancel context.CancelFunc
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="TestLimiter" href="#TestLimiter">func TestLimiter(t *testing.T)</a>

```
searchKey: mutablelimiter.TestLimiter
tags: [method private test]
```

```Go
func TestLimiter(t *testing.T)
```

