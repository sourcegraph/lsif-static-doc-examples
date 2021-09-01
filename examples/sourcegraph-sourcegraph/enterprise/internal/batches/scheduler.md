# Package scheduler

## Index

* [Types](#type)
    * [type Scheduler struct](#Scheduler)
        * [func NewScheduler(ctx context.Context, bstore *store.Store) *Scheduler](#NewScheduler)
        * [func (s *Scheduler) Start()](#Scheduler.Start)
        * [func (s *Scheduler) Stop()](#Scheduler.Stop)
        * [func (s *Scheduler) enqueueChangeset() error](#Scheduler.enqueueChangeset)
    * [type backoff struct](#backoff)
        * [func newBackoff(init time.Duration, multiplier int, limit time.Duration) *backoff](#newBackoff)
        * [func (b *backoff) next() time.Duration](#backoff.next)
        * [func (b *backoff) reset()](#backoff.reset)
    * [type ticker struct](#ticker)
        * [func newTicker(schedule *window.Schedule) *ticker](#newTicker)
        * [func (t *ticker) stop()](#ticker.stop)
* [Functions](#func)
    * [func TestTickerGoBrrr(t *testing.T)](#TestTickerGoBrrr)
    * [func TestTickerRateLimited(t *testing.T)](#TestTickerRateLimited)
    * [func TestTickerZero(t *testing.T)](#TestTickerZero)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Scheduler" href="#Scheduler">type Scheduler struct</a>

```
searchKey: scheduler.Scheduler
tags: [struct]
```

```Go
type Scheduler struct {
	ctx   context.Context
	done  chan struct{}
	store *store.Store
}
```

Scheduler provides a scheduling service that moves changesets from the scheduled state to the queued state based on the current rate limit, if anything. Changesets are processed in a FIFO manner. 

#### <a id="NewScheduler" href="#NewScheduler">func NewScheduler(ctx context.Context, bstore *store.Store) *Scheduler</a>

```
searchKey: scheduler.NewScheduler
tags: [function]
```

```Go
func NewScheduler(ctx context.Context, bstore *store.Store) *Scheduler
```

#### <a id="Scheduler.Start" href="#Scheduler.Start">func (s *Scheduler) Start()</a>

```
searchKey: scheduler.Scheduler.Start
tags: [method]
```

```Go
func (s *Scheduler) Start()
```

#### <a id="Scheduler.Stop" href="#Scheduler.Stop">func (s *Scheduler) Stop()</a>

```
searchKey: scheduler.Scheduler.Stop
tags: [method]
```

```Go
func (s *Scheduler) Stop()
```

#### <a id="Scheduler.enqueueChangeset" href="#Scheduler.enqueueChangeset">func (s *Scheduler) enqueueChangeset() error</a>

```
searchKey: scheduler.Scheduler.enqueueChangeset
tags: [method private]
```

```Go
func (s *Scheduler) enqueueChangeset() error
```

### <a id="backoff" href="#backoff">type backoff struct</a>

```
searchKey: scheduler.backoff
tags: [struct private]
```

```Go
type backoff struct {
	init       time.Duration
	multiplier int
	limit      time.Duration

	current time.Duration
}
```

backoff implements a very simple bounded exponential backoff strategy. 

#### <a id="newBackoff" href="#newBackoff">func newBackoff(init time.Duration, multiplier int, limit time.Duration) *backoff</a>

```
searchKey: scheduler.newBackoff
tags: [function private]
```

```Go
func newBackoff(init time.Duration, multiplier int, limit time.Duration) *backoff
```

#### <a id="backoff.next" href="#backoff.next">func (b *backoff) next() time.Duration</a>

```
searchKey: scheduler.backoff.next
tags: [method private]
```

```Go
func (b *backoff) next() time.Duration
```

#### <a id="backoff.reset" href="#backoff.reset">func (b *backoff) reset()</a>

```
searchKey: scheduler.backoff.reset
tags: [method private]
```

```Go
func (b *backoff) reset()
```

### <a id="ticker" href="#ticker">type ticker struct</a>

```
searchKey: scheduler.ticker
tags: [struct private]
```

```Go
type ticker struct {
	// C is the channel that will receive messages when a changeset can be
	// scheduled. The receiver must respond on the channel embedded in the
	// message to indicate if the next tick should be delayed: if so, the
	// duration must be that value, otherwise a zero duration must be sent.
	//
	// If nil is sent over this channel, an error occurred, and this ticker must
	// be stopped and discarded immediately.
	C chan chan time.Duration

	done     chan struct{}
	schedule *window.Schedule
}
```

ticker wraps the Take() method provided by schedules to return a stream of messages indicating when a changeset should be scheduled, in essentially the same way a time.Ticker periodically sends messages over a channel. The scheduler can optionally ask the ticker to delay the next Take() call if no changesets were ready when consuming the last message: this is important to avoid a busy-wait loop. 

Note that ticker does not check the validity period of the schedule it is given; the caller should do this and stop the ticker if the schedule expires or the configuration updates. 

It is important that the caller calls stop() when the ticker is no longer in use, otherwise a goroutine, channel, and probably a rate limiter will be leaked. 

#### <a id="newTicker" href="#newTicker">func newTicker(schedule *window.Schedule) *ticker</a>

```
searchKey: scheduler.newTicker
tags: [function private]
```

```Go
func newTicker(schedule *window.Schedule) *ticker
```

#### <a id="ticker.stop" href="#ticker.stop">func (t *ticker) stop()</a>

```
searchKey: scheduler.ticker.stop
tags: [method private]
```

```Go
func (t *ticker) stop()
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestTickerGoBrrr" href="#TestTickerGoBrrr">func TestTickerGoBrrr(t *testing.T)</a>

```
searchKey: scheduler.TestTickerGoBrrr
tags: [function private test]
```

```Go
func TestTickerGoBrrr(t *testing.T)
```

### <a id="TestTickerRateLimited" href="#TestTickerRateLimited">func TestTickerRateLimited(t *testing.T)</a>

```
searchKey: scheduler.TestTickerRateLimited
tags: [function private test]
```

```Go
func TestTickerRateLimited(t *testing.T)
```

### <a id="TestTickerZero" href="#TestTickerZero">func TestTickerZero(t *testing.T)</a>

```
searchKey: scheduler.TestTickerZero
tags: [function private test]
```

```Go
func TestTickerZero(t *testing.T)
```

