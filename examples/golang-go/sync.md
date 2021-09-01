# Package sync

Package sync provides basic synchronization primitives such as mutual exclusion locks. Other than the Once and WaitGroup types, most are intended for use by low-level library routines. Higher-level synchronization is better done via channels and communication. 

Values containing the types defined in this package should not be copied. 

## Index

* Subpages
  * [sync/atomic](sync/atomic.md)
  * [sync/atomic_test](sync/atomic_test.md)
* [Constants](#const)
    * [const dequeueBits](#dequeueBits)
    * [const dequeueLimit](#dequeueLimit)
    * [const mutexLocked](#mutexLocked)
    * [const mutexStarving](#mutexStarving)
    * [const mutexWaiterShift](#mutexWaiterShift)
    * [const mutexWoken](#mutexWoken)
    * [const rwmutexMaxReaders](#rwmutexMaxReaders)
    * [const starvationThresholdNs](#starvationThresholdNs)
* [Variables](#var)
    * [var Runtime_Semacquire](#Runtime_Semacquire)
    * [var Runtime_Semrelease](#Runtime_Semrelease)
    * [var Runtime_procPin](#Runtime_procPin)
    * [var Runtime_procUnpin](#Runtime_procUnpin)
    * [var allPools](#allPools)
    * [var allPoolsMu](#allPoolsMu)
    * [var expunged](#expunged)
    * [var oldPools](#oldPools)
    * [var poolRaceHash](#poolRaceHash)
* [Types](#type)
    * [type Cond struct](#Cond)
        * [func NewCond(l Locker) *Cond](#NewCond)
        * [func (c *Cond) Broadcast()](#Cond.Broadcast)
        * [func (c *Cond) Signal()](#Cond.Signal)
        * [func (c *Cond) Wait()](#Cond.Wait)
    * [type Locker interface](#Locker)
    * [type Map struct](#Map)
        * [func (m *Map) Delete(key interface{})](#Map.Delete)
        * [func (m *Map) Load(key interface{}) (value interface{}, ok bool)](#Map.Load)
        * [func (m *Map) LoadAndDelete(key interface{}) (value interface{}, loaded bool)](#Map.LoadAndDelete)
        * [func (m *Map) LoadOrStore(key, value interface{}) (actual interface{}, loaded bool)](#Map.LoadOrStore)
        * [func (m *Map) Range(f func(key, value interface{}) bool)](#Map.Range)
        * [func (m *Map) Store(key, value interface{})](#Map.Store)
        * [func (m *Map) dirtyLocked()](#Map.dirtyLocked)
        * [func (m *Map) missLocked()](#Map.missLocked)
    * [type Mutex struct](#Mutex)
        * [func (m *Mutex) Lock()](#Mutex.Lock)
        * [func (m *Mutex) Unlock()](#Mutex.Unlock)
        * [func (m *Mutex) lockSlow()](#Mutex.lockSlow)
        * [func (m *Mutex) unlockSlow(new int32)](#Mutex.unlockSlow)
    * [type Once struct](#Once)
        * [func (o *Once) Do(f func())](#Once.Do)
        * [func (o *Once) doSlow(f func())](#Once.doSlow)
    * [type Pool struct](#Pool)
        * [func (p *Pool) Get() interface{}](#Pool.Get)
        * [func (p *Pool) Put(x interface{})](#Pool.Put)
        * [func (p *Pool) getSlow(pid int) interface{}](#Pool.getSlow)
        * [func (p *Pool) pin() (*poolLocal, int)](#Pool.pin)
        * [func (p *Pool) pinSlow() (*poolLocal, int)](#Pool.pinSlow)
    * [type PoolDequeue interface](#PoolDequeue)
        * [func NewPoolChain() PoolDequeue](#NewPoolChain)
        * [func NewPoolDequeue(n int) PoolDequeue](#NewPoolDequeue)
    * [type RWMutex struct](#RWMutex)
        * [func (rw *RWMutex) Lock()](#RWMutex.Lock)
        * [func (rw *RWMutex) RLock()](#RWMutex.RLock)
        * [func (rw *RWMutex) RLocker() Locker](#RWMutex.RLocker)
        * [func (rw *RWMutex) RUnlock()](#RWMutex.RUnlock)
        * [func (rw *RWMutex) Unlock()](#RWMutex.Unlock)
        * [func (rw *RWMutex) rUnlockSlow(r int32)](#RWMutex.rUnlockSlow)
    * [type WaitGroup struct](#WaitGroup)
        * [func (wg *WaitGroup) Add(delta int)](#WaitGroup.Add)
        * [func (wg *WaitGroup) Done()](#WaitGroup.Done)
        * [func (wg *WaitGroup) Wait()](#WaitGroup.Wait)
        * [func (wg *WaitGroup) state() (statep *uint64, semap *uint32)](#WaitGroup.state)
    * [type copyChecker uintptr](#copyChecker)
        * [func (c *copyChecker) check()](#copyChecker.check)
    * [type dequeueNil *struct{}](#dequeueNil)
    * [type eface struct](#eface)
    * [type entry struct](#entry)
        * [func newEntry(i interface{}) *entry](#newEntry)
        * [func (e *entry) delete() (value interface{}, ok bool)](#entry.delete)
        * [func (e *entry) load() (value interface{}, ok bool)](#entry.load)
        * [func (e *entry) storeLocked(i *interface{})](#entry.storeLocked)
        * [func (e *entry) tryExpungeLocked() (isExpunged bool)](#entry.tryExpungeLocked)
        * [func (e *entry) tryLoadOrStore(i interface{}) (actual interface{}, loaded, ok bool)](#entry.tryLoadOrStore)
        * [func (e *entry) tryStore(i *interface{}) bool](#entry.tryStore)
        * [func (e *entry) unexpungeLocked() (wasExpunged bool)](#entry.unexpungeLocked)
    * [type noCopy struct{}](#noCopy)
        * [func (*noCopy) Lock()](#noCopy.Lock)
        * [func (*noCopy) Unlock()](#noCopy.Unlock)
    * [type notifyList struct](#notifyList)
    * [type poolChain struct](#poolChain)
        * [func (c *poolChain) PopHead() (interface{}, bool)](#poolChain.PopHead)
        * [func (c *poolChain) PopTail() (interface{}, bool)](#poolChain.PopTail)
        * [func (c *poolChain) PushHead(val interface{}) bool](#poolChain.PushHead)
        * [func (c *poolChain) popHead() (interface{}, bool)](#poolChain.popHead)
        * [func (c *poolChain) popTail() (interface{}, bool)](#poolChain.popTail)
        * [func (c *poolChain) pushHead(val interface{})](#poolChain.pushHead)
    * [type poolChainElt struct](#poolChainElt)
        * [func loadPoolChainElt(pp **poolChainElt) *poolChainElt](#loadPoolChainElt)
    * [type poolDequeue struct](#poolDequeue)
        * [func (d *poolDequeue) PopHead() (interface{}, bool)](#poolDequeue.PopHead)
        * [func (d *poolDequeue) PopTail() (interface{}, bool)](#poolDequeue.PopTail)
        * [func (d *poolDequeue) PushHead(val interface{}) bool](#poolDequeue.PushHead)
        * [func (d *poolDequeue) pack(head, tail uint32) uint64](#poolDequeue.pack)
        * [func (d *poolDequeue) popHead() (interface{}, bool)](#poolDequeue.popHead)
        * [func (d *poolDequeue) popTail() (interface{}, bool)](#poolDequeue.popTail)
        * [func (d *poolDequeue) pushHead(val interface{}) bool](#poolDequeue.pushHead)
        * [func (d *poolDequeue) unpack(ptrs uint64) (head, tail uint32)](#poolDequeue.unpack)
    * [type poolLocal struct](#poolLocal)
        * [func indexLocal(l unsafe.Pointer, i int) *poolLocal](#indexLocal)
    * [type poolLocalInternal struct](#poolLocalInternal)
    * [type readOnly struct](#readOnly)
    * [type rlocker sync.RWMutex](#rlocker)
        * [func (r *rlocker) Lock()](#rlocker.Lock)
        * [func (r *rlocker) Unlock()](#rlocker.Unlock)
* [Functions](#func)
    * [func fastrand() uint32](#fastrand)
    * [func init()](#init.pool.go)
    * [func init()](#init.runtime.go)
    * [func poolCleanup()](#poolCleanup)
    * [func poolRaceAddr(x interface{}) unsafe.Pointer](#poolRaceAddr)
    * [func runtime_LoadAcquintptr(ptr *uintptr) uintptr](#runtime_LoadAcquintptr)
    * [func runtime_Semacquire(s *uint32)](#runtime_Semacquire)
    * [func runtime_SemacquireMutex(s *uint32, lifo bool, skipframes int)](#runtime_SemacquireMutex)
    * [func runtime_Semrelease(s *uint32, handoff bool, skipframes int)](#runtime_Semrelease)
    * [func runtime_StoreReluintptr(ptr *uintptr, val uintptr) uintptr](#runtime_StoreReluintptr)
    * [func runtime_canSpin(i int) bool](#runtime_canSpin)
    * [func runtime_doSpin()](#runtime_doSpin)
    * [func runtime_nanotime() int64](#runtime_nanotime)
    * [func runtime_notifyListAdd(l *notifyList) uint32](#runtime_notifyListAdd)
    * [func runtime_notifyListCheck(size uintptr)](#runtime_notifyListCheck)
    * [func runtime_notifyListNotifyAll(l *notifyList)](#runtime_notifyListNotifyAll)
    * [func runtime_notifyListNotifyOne(l *notifyList)](#runtime_notifyListNotifyOne)
    * [func runtime_notifyListWait(l *notifyList, t uint32)](#runtime_notifyListWait)
    * [func runtime_procPin() int](#runtime_procPin)
    * [func runtime_procUnpin()](#runtime_procUnpin)
    * [func runtime_registerPoolCleanup(cleanup func())](#runtime_registerPoolCleanup)
    * [func storePoolChainElt(pp **poolChainElt, v *poolChainElt)](#storePoolChainElt)
    * [func throw(string)](#throw)


## <a id="const" href="#const">Constants</a>

### <a id="dequeueBits" href="#dequeueBits">const dequeueBits</a>

```
searchKey: sync.dequeueBits
tags: [constant number private]
```

```Go
const dequeueBits = 32
```

### <a id="dequeueLimit" href="#dequeueLimit">const dequeueLimit</a>

```
searchKey: sync.dequeueLimit
tags: [constant number private]
```

```Go
const dequeueLimit = (1 << dequeueBits) / 4
```

dequeueLimit is the maximum size of a poolDequeue. 

This must be at most (1<<dequeueBits)/2 because detecting fullness depends on wrapping around the ring buffer without wrapping around the index. We divide by 4 so this fits in an int on 32-bit. 

### <a id="mutexLocked" href="#mutexLocked">const mutexLocked</a>

```
searchKey: sync.mutexLocked
tags: [constant number private]
```

```Go
const mutexLocked = 1 << iota // mutex is locked

```

### <a id="mutexStarving" href="#mutexStarving">const mutexStarving</a>

```
searchKey: sync.mutexStarving
tags: [constant number private]
```

```Go
const mutexStarving
```

### <a id="mutexWaiterShift" href="#mutexWaiterShift">const mutexWaiterShift</a>

```
searchKey: sync.mutexWaiterShift
tags: [constant number private]
```

```Go
const mutexWaiterShift = iota
```

### <a id="mutexWoken" href="#mutexWoken">const mutexWoken</a>

```
searchKey: sync.mutexWoken
tags: [constant number private]
```

```Go
const mutexWoken
```

### <a id="rwmutexMaxReaders" href="#rwmutexMaxReaders">const rwmutexMaxReaders</a>

```
searchKey: sync.rwmutexMaxReaders
tags: [constant number private]
```

```Go
const rwmutexMaxReaders = 1 << 30
```

### <a id="starvationThresholdNs" href="#starvationThresholdNs">const starvationThresholdNs</a>

```
searchKey: sync.starvationThresholdNs
tags: [constant number private]
```

```Go
const starvationThresholdNs = 1e6
```

Mutex fairness. 

Mutex can be in 2 modes of operations: normal and starvation. In normal mode waiters are queued in FIFO order, but a woken up waiter does not own the mutex and competes with new arriving goroutines over the ownership. New arriving goroutines have an advantage -- they are already running on CPU and there can be lots of them, so a woken up waiter has good chances of losing. In such case it is queued at front of the wait queue. If a waiter fails to acquire the mutex for more than 1ms, it switches mutex to the starvation mode. 

In starvation mode ownership of the mutex is directly handed off from the unlocking goroutine to the waiter at the front of the queue. New arriving goroutines don't try to acquire the mutex even if it appears to be unlocked, and don't try to spin. Instead they queue themselves at the tail of the wait queue. 

If a waiter receives ownership of the mutex and sees that either (1) it is the last waiter in the queue, or (2) it waited for less than 1 ms, it switches mutex back to normal operation mode. 

Normal mode has considerably better performance as a goroutine can acquire a mutex several times in a row even if there are blocked waiters. Starvation mode is important to prevent pathological cases of tail latency. 

## <a id="var" href="#var">Variables</a>

### <a id="Runtime_Semacquire" href="#Runtime_Semacquire">var Runtime_Semacquire</a>

```
searchKey: sync.Runtime_Semacquire
tags: [variable function private]
```

```Go
var Runtime_Semacquire = runtime_Semacquire
```

Export for testing. 

### <a id="Runtime_Semrelease" href="#Runtime_Semrelease">var Runtime_Semrelease</a>

```
searchKey: sync.Runtime_Semrelease
tags: [variable function private]
```

```Go
var Runtime_Semrelease = runtime_Semrelease
```

### <a id="Runtime_procPin" href="#Runtime_procPin">var Runtime_procPin</a>

```
searchKey: sync.Runtime_procPin
tags: [variable function private]
```

```Go
var Runtime_procPin = runtime_procPin
```

### <a id="Runtime_procUnpin" href="#Runtime_procUnpin">var Runtime_procUnpin</a>

```
searchKey: sync.Runtime_procUnpin
tags: [variable function private]
```

```Go
var Runtime_procUnpin = runtime_procUnpin
```

### <a id="allPools" href="#allPools">var allPools</a>

```
searchKey: sync.allPools
tags: [variable array struct private]
```

```Go
var allPools []*Pool
```

allPools is the set of pools that have non-empty primary caches. Protected by either 1) allPoolsMu and pinning or 2) STW. 

### <a id="allPoolsMu" href="#allPoolsMu">var allPoolsMu</a>

```
searchKey: sync.allPoolsMu
tags: [variable struct private]
```

```Go
var allPoolsMu Mutex
```

### <a id="expunged" href="#expunged">var expunged</a>

```
searchKey: sync.expunged
tags: [variable number private]
```

```Go
var expunged = unsafe.Pointer(new(interface{}))
```

expunged is an arbitrary pointer that marks entries which have been deleted from the dirty map. 

### <a id="oldPools" href="#oldPools">var oldPools</a>

```
searchKey: sync.oldPools
tags: [variable array struct private]
```

```Go
var oldPools []*Pool
```

oldPools is the set of pools that may have non-empty victim caches. Protected by STW. 

### <a id="poolRaceHash" href="#poolRaceHash">var poolRaceHash</a>

```
searchKey: sync.poolRaceHash
tags: [variable array number private]
```

```Go
var poolRaceHash [128]uint64
```

## <a id="type" href="#type">Types</a>

### <a id="Cond" href="#Cond">type Cond struct</a>

```
searchKey: sync.Cond
tags: [struct]
```

```Go
type Cond struct {
	noCopy noCopy

	// L is held while observing or changing the condition
	L Locker

	notify  notifyList
	checker copyChecker
}
```

Cond implements a condition variable, a rendezvous point for goroutines waiting for or announcing the occurrence of an event. 

Each Cond has an associated Locker L (often a *Mutex or *RWMutex), which must be held when changing the condition and when calling the Wait method. 

A Cond must not be copied after first use. 

#### <a id="NewCond" href="#NewCond">func NewCond(l Locker) *Cond</a>

```
searchKey: sync.NewCond
tags: [function]
```

```Go
func NewCond(l Locker) *Cond
```

NewCond returns a new Cond with Locker l. 

#### <a id="Cond.Broadcast" href="#Cond.Broadcast">func (c *Cond) Broadcast()</a>

```
searchKey: sync.Cond.Broadcast
tags: [method]
```

```Go
func (c *Cond) Broadcast()
```

Broadcast wakes all goroutines waiting on c. 

It is allowed but not required for the caller to hold c.L during the call. 

#### <a id="Cond.Signal" href="#Cond.Signal">func (c *Cond) Signal()</a>

```
searchKey: sync.Cond.Signal
tags: [method]
```

```Go
func (c *Cond) Signal()
```

Signal wakes one goroutine waiting on c, if there is any. 

It is allowed but not required for the caller to hold c.L during the call. 

#### <a id="Cond.Wait" href="#Cond.Wait">func (c *Cond) Wait()</a>

```
searchKey: sync.Cond.Wait
tags: [method]
```

```Go
func (c *Cond) Wait()
```

Wait atomically unlocks c.L and suspends execution of the calling goroutine. After later resuming execution, Wait locks c.L before returning. Unlike in other systems, Wait cannot return unless awoken by Broadcast or Signal. 

Because c.L is not locked when Wait first resumes, the caller typically cannot assume that the condition is true when Wait returns. Instead, the caller should Wait in a loop: 

```
c.L.Lock()
for !condition() {
    c.Wait()
}
... make use of condition ...
c.L.Unlock()

```
### <a id="Locker" href="#Locker">type Locker interface</a>

```
searchKey: sync.Locker
tags: [interface]
```

```Go
type Locker interface {
	Lock()
	Unlock()
}
```

A Locker represents an object that can be locked and unlocked. 

### <a id="Map" href="#Map">type Map struct</a>

```
searchKey: sync.Map
tags: [struct]
```

```Go
type Map struct {
	mu Mutex

	// read contains the portion of the map's contents that are safe for
	// concurrent access (with or without mu held).
	//
	// The read field itself is always safe to load, but must only be stored with
	// mu held.
	//
	// Entries stored in read may be updated concurrently without mu, but updating
	// a previously-expunged entry requires that the entry be copied to the dirty
	// map and unexpunged with mu held.
	read atomic.Value // readOnly

	// dirty contains the portion of the map's contents that require mu to be
	// held. To ensure that the dirty map can be promoted to the read map quickly,
	// it also includes all of the non-expunged entries in the read map.
	//
	// Expunged entries are not stored in the dirty map. An expunged entry in the
	// clean map must be unexpunged and added to the dirty map before a new value
	// can be stored to it.
	//
	// If the dirty map is nil, the next write to the map will initialize it by
	// making a shallow copy of the clean map, omitting stale entries.
	dirty map[interface{}]*entry

	// misses counts the number of loads since the read map was last updated that
	// needed to lock mu to determine whether the key was present.
	//
	// Once enough misses have occurred to cover the cost of copying the dirty
	// map, the dirty map will be promoted to the read map (in the unamended
	// state) and the next store to the map will make a new dirty copy.
	misses int
}
```

Map is like a Go map[interface{}]interface{} but is safe for concurrent use by multiple goroutines without additional locking or coordination. Loads, stores, and deletes run in amortized constant time. 

The Map type is specialized. Most code should use a plain Go map instead, with separate locking or coordination, for better type safety and to make it easier to maintain other invariants along with the map content. 

The Map type is optimized for two common use cases: (1) when the entry for a given key is only ever written once but read many times, as in caches that only grow, or (2) when multiple goroutines read, write, and overwrite entries for disjoint sets of keys. In these two cases, use of a Map may significantly reduce lock contention compared to a Go map paired with a separate Mutex or RWMutex. 

The zero Map is empty and ready for use. A Map must not be copied after first use. 

#### <a id="Map.Delete" href="#Map.Delete">func (m *Map) Delete(key interface{})</a>

```
searchKey: sync.Map.Delete
tags: [method]
```

```Go
func (m *Map) Delete(key interface{})
```

Delete deletes the value for a key. 

#### <a id="Map.Load" href="#Map.Load">func (m *Map) Load(key interface{}) (value interface{}, ok bool)</a>

```
searchKey: sync.Map.Load
tags: [method]
```

```Go
func (m *Map) Load(key interface{}) (value interface{}, ok bool)
```

Load returns the value stored in the map for a key, or nil if no value is present. The ok result indicates whether value was found in the map. 

#### <a id="Map.LoadAndDelete" href="#Map.LoadAndDelete">func (m *Map) LoadAndDelete(key interface{}) (value interface{}, loaded bool)</a>

```
searchKey: sync.Map.LoadAndDelete
tags: [method]
```

```Go
func (m *Map) LoadAndDelete(key interface{}) (value interface{}, loaded bool)
```

LoadAndDelete deletes the value for a key, returning the previous value if any. The loaded result reports whether the key was present. 

#### <a id="Map.LoadOrStore" href="#Map.LoadOrStore">func (m *Map) LoadOrStore(key, value interface{}) (actual interface{}, loaded bool)</a>

```
searchKey: sync.Map.LoadOrStore
tags: [method]
```

```Go
func (m *Map) LoadOrStore(key, value interface{}) (actual interface{}, loaded bool)
```

LoadOrStore returns the existing value for the key if present. Otherwise, it stores and returns the given value. The loaded result is true if the value was loaded, false if stored. 

#### <a id="Map.Range" href="#Map.Range">func (m *Map) Range(f func(key, value interface{}) bool)</a>

```
searchKey: sync.Map.Range
tags: [method]
```

```Go
func (m *Map) Range(f func(key, value interface{}) bool)
```

Range calls f sequentially for each key and value present in the map. If f returns false, range stops the iteration. 

Range does not necessarily correspond to any consistent snapshot of the Map's contents: no key will be visited more than once, but if the value for any key is stored or deleted concurrently, Range may reflect any mapping for that key from any point during the Range call. 

Range may be O(N) with the number of elements in the map even if f returns false after a constant number of calls. 

#### <a id="Map.Store" href="#Map.Store">func (m *Map) Store(key, value interface{})</a>

```
searchKey: sync.Map.Store
tags: [method]
```

```Go
func (m *Map) Store(key, value interface{})
```

Store sets the value for a key. 

#### <a id="Map.dirtyLocked" href="#Map.dirtyLocked">func (m *Map) dirtyLocked()</a>

```
searchKey: sync.Map.dirtyLocked
tags: [method private]
```

```Go
func (m *Map) dirtyLocked()
```

#### <a id="Map.missLocked" href="#Map.missLocked">func (m *Map) missLocked()</a>

```
searchKey: sync.Map.missLocked
tags: [method private]
```

```Go
func (m *Map) missLocked()
```

### <a id="Mutex" href="#Mutex">type Mutex struct</a>

```
searchKey: sync.Mutex
tags: [struct]
```

```Go
type Mutex struct {
	state int32
	sema  uint32
}
```

A Mutex is a mutual exclusion lock. The zero value for a Mutex is an unlocked mutex. 

A Mutex must not be copied after first use. 

#### <a id="Mutex.Lock" href="#Mutex.Lock">func (m *Mutex) Lock()</a>

```
searchKey: sync.Mutex.Lock
tags: [method]
```

```Go
func (m *Mutex) Lock()
```

Lock locks m. If the lock is already in use, the calling goroutine blocks until the mutex is available. 

#### <a id="Mutex.Unlock" href="#Mutex.Unlock">func (m *Mutex) Unlock()</a>

```
searchKey: sync.Mutex.Unlock
tags: [method]
```

```Go
func (m *Mutex) Unlock()
```

Unlock unlocks m. It is a run-time error if m is not locked on entry to Unlock. 

A locked Mutex is not associated with a particular goroutine. It is allowed for one goroutine to lock a Mutex and then arrange for another goroutine to unlock it. 

#### <a id="Mutex.lockSlow" href="#Mutex.lockSlow">func (m *Mutex) lockSlow()</a>

```
searchKey: sync.Mutex.lockSlow
tags: [method private]
```

```Go
func (m *Mutex) lockSlow()
```

#### <a id="Mutex.unlockSlow" href="#Mutex.unlockSlow">func (m *Mutex) unlockSlow(new int32)</a>

```
searchKey: sync.Mutex.unlockSlow
tags: [method private]
```

```Go
func (m *Mutex) unlockSlow(new int32)
```

### <a id="Once" href="#Once">type Once struct</a>

```
searchKey: sync.Once
tags: [struct]
```

```Go
type Once struct {
	// done indicates whether the action has been performed.
	// It is first in the struct because it is used in the hot path.
	// The hot path is inlined at every call site.
	// Placing done first allows more compact instructions on some architectures (amd64/386),
	// and fewer instructions (to calculate offset) on other architectures.
	done uint32
	m    Mutex
}
```

Once is an object that will perform exactly one action. 

A Once must not be copied after first use. 

#### <a id="Once.Do" href="#Once.Do">func (o *Once) Do(f func())</a>

```
searchKey: sync.Once.Do
tags: [method]
```

```Go
func (o *Once) Do(f func())
```

Do calls the function f if and only if Do is being called for the first time for this instance of Once. In other words, given 

```
var once Once

```
if once.Do(f) is called multiple times, only the first call will invoke f, even if f has a different value in each invocation. A new instance of Once is required for each function to execute. 

Do is intended for initialization that must be run exactly once. Since f is niladic, it may be necessary to use a function literal to capture the arguments to a function to be invoked by Do: 

```
config.once.Do(func() { config.init(filename) })

```
Because no call to Do returns until the one call to f returns, if f causes Do to be called, it will deadlock. 

If f panics, Do considers it to have returned; future calls of Do return without calling f. 

#### <a id="Once.doSlow" href="#Once.doSlow">func (o *Once) doSlow(f func())</a>

```
searchKey: sync.Once.doSlow
tags: [method private]
```

```Go
func (o *Once) doSlow(f func())
```

### <a id="Pool" href="#Pool">type Pool struct</a>

```
searchKey: sync.Pool
tags: [struct]
```

```Go
type Pool struct {
	noCopy noCopy

	local     unsafe.Pointer // local fixed-size per-P pool, actual type is [P]poolLocal
	localSize uintptr        // size of the local array

	victim     unsafe.Pointer // local from previous cycle
	victimSize uintptr        // size of victims array

	// New optionally specifies a function to generate
	// a value when Get would otherwise return nil.
	// It may not be changed concurrently with calls to Get.
	New func() interface{}
}
```

A Pool is a set of temporary objects that may be individually saved and retrieved. 

Any item stored in the Pool may be removed automatically at any time without notification. If the Pool holds the only reference when this happens, the item might be deallocated. 

A Pool is safe for use by multiple goroutines simultaneously. 

Pool's purpose is to cache allocated but unused items for later reuse, relieving pressure on the garbage collector. That is, it makes it easy to build efficient, thread-safe free lists. However, it is not suitable for all free lists. 

An appropriate use of a Pool is to manage a group of temporary items silently shared among and potentially reused by concurrent independent clients of a package. Pool provides a way to amortize allocation overhead across many clients. 

An example of good use of a Pool is in the fmt package, which maintains a dynamically-sized store of temporary output buffers. The store scales under load (when many goroutines are actively printing) and shrinks when quiescent. 

On the other hand, a free list maintained as part of a short-lived object is not a suitable use for a Pool, since the overhead does not amortize well in that scenario. It is more efficient to have such objects implement their own free list. 

A Pool must not be copied after first use. 

#### <a id="Pool.Get" href="#Pool.Get">func (p *Pool) Get() interface{}</a>

```
searchKey: sync.Pool.Get
tags: [method]
```

```Go
func (p *Pool) Get() interface{}
```

Get selects an arbitrary item from the Pool, removes it from the Pool, and returns it to the caller. Get may choose to ignore the pool and treat it as empty. Callers should not assume any relation between values passed to Put and the values returned by Get. 

If Get would otherwise return nil and p.New is non-nil, Get returns the result of calling p.New. 

#### <a id="Pool.Put" href="#Pool.Put">func (p *Pool) Put(x interface{})</a>

```
searchKey: sync.Pool.Put
tags: [method]
```

```Go
func (p *Pool) Put(x interface{})
```

Put adds x to the pool. 

#### <a id="Pool.getSlow" href="#Pool.getSlow">func (p *Pool) getSlow(pid int) interface{}</a>

```
searchKey: sync.Pool.getSlow
tags: [method private]
```

```Go
func (p *Pool) getSlow(pid int) interface{}
```

#### <a id="Pool.pin" href="#Pool.pin">func (p *Pool) pin() (*poolLocal, int)</a>

```
searchKey: sync.Pool.pin
tags: [method private]
```

```Go
func (p *Pool) pin() (*poolLocal, int)
```

pin pins the current goroutine to P, disables preemption and returns poolLocal pool for the P and the P's id. Caller must call runtime_procUnpin() when done with the pool. 

#### <a id="Pool.pinSlow" href="#Pool.pinSlow">func (p *Pool) pinSlow() (*poolLocal, int)</a>

```
searchKey: sync.Pool.pinSlow
tags: [method private]
```

```Go
func (p *Pool) pinSlow() (*poolLocal, int)
```

### <a id="PoolDequeue" href="#PoolDequeue">type PoolDequeue interface</a>

```
searchKey: sync.PoolDequeue
tags: [interface private]
```

```Go
type PoolDequeue interface {
	PushHead(val interface{}) bool
	PopHead() (interface{}, bool)
	PopTail() (interface{}, bool)
}
```

poolDequeue testing. 

#### <a id="NewPoolChain" href="#NewPoolChain">func NewPoolChain() PoolDequeue</a>

```
searchKey: sync.NewPoolChain
tags: [function private]
```

```Go
func NewPoolChain() PoolDequeue
```

#### <a id="NewPoolDequeue" href="#NewPoolDequeue">func NewPoolDequeue(n int) PoolDequeue</a>

```
searchKey: sync.NewPoolDequeue
tags: [function private]
```

```Go
func NewPoolDequeue(n int) PoolDequeue
```

### <a id="RWMutex" href="#RWMutex">type RWMutex struct</a>

```
searchKey: sync.RWMutex
tags: [struct]
```

```Go
type RWMutex struct {
	w           Mutex  // held if there are pending writers
	writerSem   uint32 // semaphore for writers to wait for completing readers
	readerSem   uint32 // semaphore for readers to wait for completing writers
	readerCount int32  // number of pending readers
	readerWait  int32  // number of departing readers
}
```

A RWMutex is a reader/writer mutual exclusion lock. The lock can be held by an arbitrary number of readers or a single writer. The zero value for a RWMutex is an unlocked mutex. 

A RWMutex must not be copied after first use. 

If a goroutine holds a RWMutex for reading and another goroutine might call Lock, no goroutine should expect to be able to acquire a read lock until the initial read lock is released. In particular, this prohibits recursive read locking. This is to ensure that the lock eventually becomes available; a blocked Lock call excludes new readers from acquiring the lock. 

#### <a id="RWMutex.Lock" href="#RWMutex.Lock">func (rw *RWMutex) Lock()</a>

```
searchKey: sync.RWMutex.Lock
tags: [method]
```

```Go
func (rw *RWMutex) Lock()
```

Lock locks rw for writing. If the lock is already locked for reading or writing, Lock blocks until the lock is available. 

#### <a id="RWMutex.RLock" href="#RWMutex.RLock">func (rw *RWMutex) RLock()</a>

```
searchKey: sync.RWMutex.RLock
tags: [method]
```

```Go
func (rw *RWMutex) RLock()
```

RLock locks rw for reading. 

It should not be used for recursive read locking; a blocked Lock call excludes new readers from acquiring the lock. See the documentation on the RWMutex type. 

#### <a id="RWMutex.RLocker" href="#RWMutex.RLocker">func (rw *RWMutex) RLocker() Locker</a>

```
searchKey: sync.RWMutex.RLocker
tags: [method]
```

```Go
func (rw *RWMutex) RLocker() Locker
```

RLocker returns a Locker interface that implements the Lock and Unlock methods by calling rw.RLock and rw.RUnlock. 

#### <a id="RWMutex.RUnlock" href="#RWMutex.RUnlock">func (rw *RWMutex) RUnlock()</a>

```
searchKey: sync.RWMutex.RUnlock
tags: [method]
```

```Go
func (rw *RWMutex) RUnlock()
```

RUnlock undoes a single RLock call; it does not affect other simultaneous readers. It is a run-time error if rw is not locked for reading on entry to RUnlock. 

#### <a id="RWMutex.Unlock" href="#RWMutex.Unlock">func (rw *RWMutex) Unlock()</a>

```
searchKey: sync.RWMutex.Unlock
tags: [method]
```

```Go
func (rw *RWMutex) Unlock()
```

Unlock unlocks rw for writing. It is a run-time error if rw is not locked for writing on entry to Unlock. 

As with Mutexes, a locked RWMutex is not associated with a particular goroutine. One goroutine may RLock (Lock) a RWMutex and then arrange for another goroutine to RUnlock (Unlock) it. 

#### <a id="RWMutex.rUnlockSlow" href="#RWMutex.rUnlockSlow">func (rw *RWMutex) rUnlockSlow(r int32)</a>

```
searchKey: sync.RWMutex.rUnlockSlow
tags: [method private]
```

```Go
func (rw *RWMutex) rUnlockSlow(r int32)
```

### <a id="WaitGroup" href="#WaitGroup">type WaitGroup struct</a>

```
searchKey: sync.WaitGroup
tags: [struct]
```

```Go
type WaitGroup struct {
	noCopy noCopy

	// 64-bit value: high 32 bits are counter, low 32 bits are waiter count.
	// 64-bit atomic operations require 64-bit alignment, but 32-bit
	// compilers do not ensure it. So we allocate 12 bytes and then use
	// the aligned 8 bytes in them as state, and the other 4 as storage
	// for the sema.
	state1 [3]uint32
}
```

A WaitGroup waits for a collection of goroutines to finish. The main goroutine calls Add to set the number of goroutines to wait for. Then each of the goroutines runs and calls Done when finished. At the same time, Wait can be used to block until all goroutines have finished. 

A WaitGroup must not be copied after first use. 

#### <a id="WaitGroup.Add" href="#WaitGroup.Add">func (wg *WaitGroup) Add(delta int)</a>

```
searchKey: sync.WaitGroup.Add
tags: [method]
```

```Go
func (wg *WaitGroup) Add(delta int)
```

Add adds delta, which may be negative, to the WaitGroup counter. If the counter becomes zero, all goroutines blocked on Wait are released. If the counter goes negative, Add panics. 

Note that calls with a positive delta that occur when the counter is zero must happen before a Wait. Calls with a negative delta, or calls with a positive delta that start when the counter is greater than zero, may happen at any time. Typically this means the calls to Add should execute before the statement creating the goroutine or other event to be waited for. If a WaitGroup is reused to wait for several independent sets of events, new Add calls must happen after all previous Wait calls have returned. See the WaitGroup example. 

#### <a id="WaitGroup.Done" href="#WaitGroup.Done">func (wg *WaitGroup) Done()</a>

```
searchKey: sync.WaitGroup.Done
tags: [method]
```

```Go
func (wg *WaitGroup) Done()
```

Done decrements the WaitGroup counter by one. 

#### <a id="WaitGroup.Wait" href="#WaitGroup.Wait">func (wg *WaitGroup) Wait()</a>

```
searchKey: sync.WaitGroup.Wait
tags: [method]
```

```Go
func (wg *WaitGroup) Wait()
```

Wait blocks until the WaitGroup counter is zero. 

#### <a id="WaitGroup.state" href="#WaitGroup.state">func (wg *WaitGroup) state() (statep *uint64, semap *uint32)</a>

```
searchKey: sync.WaitGroup.state
tags: [method private]
```

```Go
func (wg *WaitGroup) state() (statep *uint64, semap *uint32)
```

state returns pointers to the state and sema fields stored within wg.state1. 

### <a id="copyChecker" href="#copyChecker">type copyChecker uintptr</a>

```
searchKey: sync.copyChecker
tags: [number private]
```

```Go
type copyChecker uintptr
```

copyChecker holds back pointer to itself to detect object copying. 

#### <a id="copyChecker.check" href="#copyChecker.check">func (c *copyChecker) check()</a>

```
searchKey: sync.copyChecker.check
tags: [method private]
```

```Go
func (c *copyChecker) check()
```

### <a id="dequeueNil" href="#dequeueNil">type dequeueNil *struct{}</a>

```
searchKey: sync.dequeueNil
tags: [struct private]
```

```Go
type dequeueNil *struct{}
```

dequeueNil is used in poolDequeue to represent interface{}(nil). Since we use nil to represent empty slots, we need a sentinel value to represent nil. 

### <a id="eface" href="#eface">type eface struct</a>

```
searchKey: sync.eface
tags: [struct private]
```

```Go
type eface struct {
	typ, val unsafe.Pointer
}
```

### <a id="entry" href="#entry">type entry struct</a>

```
searchKey: sync.entry
tags: [struct private]
```

```Go
type entry struct {
	// p points to the interface{} value stored for the entry.
	//
	// If p == nil, the entry has been deleted, and either m.dirty == nil or
	// m.dirty[key] is e.
	//
	// If p == expunged, the entry has been deleted, m.dirty != nil, and the entry
	// is missing from m.dirty.
	//
	// Otherwise, the entry is valid and recorded in m.read.m[key] and, if m.dirty
	// != nil, in m.dirty[key].
	//
	// An entry can be deleted by atomic replacement with nil: when m.dirty is
	// next created, it will atomically replace nil with expunged and leave
	// m.dirty[key] unset.
	//
	// An entry's associated value can be updated by atomic replacement, provided
	// p != expunged. If p == expunged, an entry's associated value can be updated
	// only after first setting m.dirty[key] = e so that lookups using the dirty
	// map find the entry.
	p unsafe.Pointer // *interface{}
}
```

An entry is a slot in the map corresponding to a particular key. 

#### <a id="newEntry" href="#newEntry">func newEntry(i interface{}) *entry</a>

```
searchKey: sync.newEntry
tags: [function private]
```

```Go
func newEntry(i interface{}) *entry
```

#### <a id="entry.delete" href="#entry.delete">func (e *entry) delete() (value interface{}, ok bool)</a>

```
searchKey: sync.entry.delete
tags: [method private]
```

```Go
func (e *entry) delete() (value interface{}, ok bool)
```

#### <a id="entry.load" href="#entry.load">func (e *entry) load() (value interface{}, ok bool)</a>

```
searchKey: sync.entry.load
tags: [method private]
```

```Go
func (e *entry) load() (value interface{}, ok bool)
```

#### <a id="entry.storeLocked" href="#entry.storeLocked">func (e *entry) storeLocked(i *interface{})</a>

```
searchKey: sync.entry.storeLocked
tags: [method private]
```

```Go
func (e *entry) storeLocked(i *interface{})
```

storeLocked unconditionally stores a value to the entry. 

The entry must be known not to be expunged. 

#### <a id="entry.tryExpungeLocked" href="#entry.tryExpungeLocked">func (e *entry) tryExpungeLocked() (isExpunged bool)</a>

```
searchKey: sync.entry.tryExpungeLocked
tags: [method private]
```

```Go
func (e *entry) tryExpungeLocked() (isExpunged bool)
```

#### <a id="entry.tryLoadOrStore" href="#entry.tryLoadOrStore">func (e *entry) tryLoadOrStore(i interface{}) (actual interface{}, loaded, ok bool)</a>

```
searchKey: sync.entry.tryLoadOrStore
tags: [method private]
```

```Go
func (e *entry) tryLoadOrStore(i interface{}) (actual interface{}, loaded, ok bool)
```

tryLoadOrStore atomically loads or stores a value if the entry is not expunged. 

If the entry is expunged, tryLoadOrStore leaves the entry unchanged and returns with ok==false. 

#### <a id="entry.tryStore" href="#entry.tryStore">func (e *entry) tryStore(i *interface{}) bool</a>

```
searchKey: sync.entry.tryStore
tags: [method private]
```

```Go
func (e *entry) tryStore(i *interface{}) bool
```

tryStore stores a value if the entry has not been expunged. 

If the entry is expunged, tryStore returns false and leaves the entry unchanged. 

#### <a id="entry.unexpungeLocked" href="#entry.unexpungeLocked">func (e *entry) unexpungeLocked() (wasExpunged bool)</a>

```
searchKey: sync.entry.unexpungeLocked
tags: [method private]
```

```Go
func (e *entry) unexpungeLocked() (wasExpunged bool)
```

unexpungeLocked ensures that the entry is not marked as expunged. 

If the entry was previously expunged, it must be added to the dirty map before m.mu is unlocked. 

### <a id="noCopy" href="#noCopy">type noCopy struct{}</a>

```
searchKey: sync.noCopy
tags: [struct private]
```

```Go
type noCopy struct{}
```

noCopy may be embedded into structs which must not be copied after the first use. 

See [https://golang.org/issues/8005#issuecomment-190753527](https://golang.org/issues/8005#issuecomment-190753527) for details. 

#### <a id="noCopy.Lock" href="#noCopy.Lock">func (*noCopy) Lock()</a>

```
searchKey: sync.noCopy.Lock
tags: [method private]
```

```Go
func (*noCopy) Lock()
```

Lock is a no-op used by -copylocks checker from `go vet`. 

#### <a id="noCopy.Unlock" href="#noCopy.Unlock">func (*noCopy) Unlock()</a>

```
searchKey: sync.noCopy.Unlock
tags: [method private]
```

```Go
func (*noCopy) Unlock()
```

### <a id="notifyList" href="#notifyList">type notifyList struct</a>

```
searchKey: sync.notifyList
tags: [struct private]
```

```Go
type notifyList struct {
	wait   uint32
	notify uint32
	lock   uintptr // key field of the mutex
	head   unsafe.Pointer
	tail   unsafe.Pointer
}
```

Approximation of notifyList in runtime/sema.go. Size and alignment must agree. 

### <a id="poolChain" href="#poolChain">type poolChain struct</a>

```
searchKey: sync.poolChain
tags: [struct private]
```

```Go
type poolChain struct {
	// head is the poolDequeue to push to. This is only accessed
	// by the producer, so doesn't need to be synchronized.
	head *poolChainElt

	// tail is the poolDequeue to popTail from. This is accessed
	// by consumers, so reads and writes must be atomic.
	tail *poolChainElt
}
```

poolChain is a dynamically-sized version of poolDequeue. 

This is implemented as a doubly-linked list queue of poolDequeues where each dequeue is double the size of the previous one. Once a dequeue fills up, this allocates a new one and only ever pushes to the latest dequeue. Pops happen from the other end of the list and once a dequeue is exhausted, it gets removed from the list. 

#### <a id="poolChain.PopHead" href="#poolChain.PopHead">func (c *poolChain) PopHead() (interface{}, bool)</a>

```
searchKey: sync.poolChain.PopHead
tags: [method private]
```

```Go
func (c *poolChain) PopHead() (interface{}, bool)
```

#### <a id="poolChain.PopTail" href="#poolChain.PopTail">func (c *poolChain) PopTail() (interface{}, bool)</a>

```
searchKey: sync.poolChain.PopTail
tags: [method private]
```

```Go
func (c *poolChain) PopTail() (interface{}, bool)
```

#### <a id="poolChain.PushHead" href="#poolChain.PushHead">func (c *poolChain) PushHead(val interface{}) bool</a>

```
searchKey: sync.poolChain.PushHead
tags: [method private]
```

```Go
func (c *poolChain) PushHead(val interface{}) bool
```

#### <a id="poolChain.popHead" href="#poolChain.popHead">func (c *poolChain) popHead() (interface{}, bool)</a>

```
searchKey: sync.poolChain.popHead
tags: [method private]
```

```Go
func (c *poolChain) popHead() (interface{}, bool)
```

#### <a id="poolChain.popTail" href="#poolChain.popTail">func (c *poolChain) popTail() (interface{}, bool)</a>

```
searchKey: sync.poolChain.popTail
tags: [method private]
```

```Go
func (c *poolChain) popTail() (interface{}, bool)
```

#### <a id="poolChain.pushHead" href="#poolChain.pushHead">func (c *poolChain) pushHead(val interface{})</a>

```
searchKey: sync.poolChain.pushHead
tags: [method private]
```

```Go
func (c *poolChain) pushHead(val interface{})
```

### <a id="poolChainElt" href="#poolChainElt">type poolChainElt struct</a>

```
searchKey: sync.poolChainElt
tags: [struct private]
```

```Go
type poolChainElt struct {
	poolDequeue

	// next and prev link to the adjacent poolChainElts in this
	// poolChain.
	//
	// next is written atomically by the producer and read
	// atomically by the consumer. It only transitions from nil to
	// non-nil.
	//
	// prev is written atomically by the consumer and read
	// atomically by the producer. It only transitions from
	// non-nil to nil.
	next, prev *poolChainElt
}
```

#### <a id="loadPoolChainElt" href="#loadPoolChainElt">func loadPoolChainElt(pp **poolChainElt) *poolChainElt</a>

```
searchKey: sync.loadPoolChainElt
tags: [function private]
```

```Go
func loadPoolChainElt(pp **poolChainElt) *poolChainElt
```

### <a id="poolDequeue" href="#poolDequeue">type poolDequeue struct</a>

```
searchKey: sync.poolDequeue
tags: [struct private]
```

```Go
type poolDequeue struct {
	// headTail packs together a 32-bit head index and a 32-bit
	// tail index. Both are indexes into vals modulo len(vals)-1.
	//
	// tail = index of oldest data in queue
	// head = index of next slot to fill
	//
	// Slots in the range [tail, head) are owned by consumers.
	// A consumer continues to own a slot outside this range until
	// it nils the slot, at which point ownership passes to the
	// producer.
	//
	// The head index is stored in the most-significant bits so
	// that we can atomically add to it and the overflow is
	// harmless.
	headTail uint64

	// vals is a ring buffer of interface{} values stored in this
	// dequeue. The size of this must be a power of 2.
	//
	// vals[i].typ is nil if the slot is empty and non-nil
	// otherwise. A slot is still in use until *both* the tail
	// index has moved beyond it and typ has been set to nil. This
	// is set to nil atomically by the consumer and read
	// atomically by the producer.
	vals []eface
}
```

poolDequeue is a lock-free fixed-size single-producer, multi-consumer queue. The single producer can both push and pop from the head, and consumers can pop from the tail. 

It has the added feature that it nils out unused slots to avoid unnecessary retention of objects. This is important for sync.Pool, but not typically a property considered in the literature. 

#### <a id="poolDequeue.PopHead" href="#poolDequeue.PopHead">func (d *poolDequeue) PopHead() (interface{}, bool)</a>

```
searchKey: sync.poolDequeue.PopHead
tags: [method private]
```

```Go
func (d *poolDequeue) PopHead() (interface{}, bool)
```

#### <a id="poolDequeue.PopTail" href="#poolDequeue.PopTail">func (d *poolDequeue) PopTail() (interface{}, bool)</a>

```
searchKey: sync.poolDequeue.PopTail
tags: [method private]
```

```Go
func (d *poolDequeue) PopTail() (interface{}, bool)
```

#### <a id="poolDequeue.PushHead" href="#poolDequeue.PushHead">func (d *poolDequeue) PushHead(val interface{}) bool</a>

```
searchKey: sync.poolDequeue.PushHead
tags: [method private]
```

```Go
func (d *poolDequeue) PushHead(val interface{}) bool
```

#### <a id="poolDequeue.pack" href="#poolDequeue.pack">func (d *poolDequeue) pack(head, tail uint32) uint64</a>

```
searchKey: sync.poolDequeue.pack
tags: [method private]
```

```Go
func (d *poolDequeue) pack(head, tail uint32) uint64
```

#### <a id="poolDequeue.popHead" href="#poolDequeue.popHead">func (d *poolDequeue) popHead() (interface{}, bool)</a>

```
searchKey: sync.poolDequeue.popHead
tags: [method private]
```

```Go
func (d *poolDequeue) popHead() (interface{}, bool)
```

popHead removes and returns the element at the head of the queue. It returns false if the queue is empty. It must only be called by a single producer. 

#### <a id="poolDequeue.popTail" href="#poolDequeue.popTail">func (d *poolDequeue) popTail() (interface{}, bool)</a>

```
searchKey: sync.poolDequeue.popTail
tags: [method private]
```

```Go
func (d *poolDequeue) popTail() (interface{}, bool)
```

popTail removes and returns the element at the tail of the queue. It returns false if the queue is empty. It may be called by any number of consumers. 

#### <a id="poolDequeue.pushHead" href="#poolDequeue.pushHead">func (d *poolDequeue) pushHead(val interface{}) bool</a>

```
searchKey: sync.poolDequeue.pushHead
tags: [method private]
```

```Go
func (d *poolDequeue) pushHead(val interface{}) bool
```

pushHead adds val at the head of the queue. It returns false if the queue is full. It must only be called by a single producer. 

#### <a id="poolDequeue.unpack" href="#poolDequeue.unpack">func (d *poolDequeue) unpack(ptrs uint64) (head, tail uint32)</a>

```
searchKey: sync.poolDequeue.unpack
tags: [method private]
```

```Go
func (d *poolDequeue) unpack(ptrs uint64) (head, tail uint32)
```

### <a id="poolLocal" href="#poolLocal">type poolLocal struct</a>

```
searchKey: sync.poolLocal
tags: [struct private]
```

```Go
type poolLocal struct {
	poolLocalInternal

	// Prevents false sharing on widespread platforms with
	// 128 mod (cache line size) = 0 .
	pad [128 - unsafe.Sizeof(poolLocalInternal{})%128]byte
}
```

#### <a id="indexLocal" href="#indexLocal">func indexLocal(l unsafe.Pointer, i int) *poolLocal</a>

```
searchKey: sync.indexLocal
tags: [function private]
```

```Go
func indexLocal(l unsafe.Pointer, i int) *poolLocal
```

### <a id="poolLocalInternal" href="#poolLocalInternal">type poolLocalInternal struct</a>

```
searchKey: sync.poolLocalInternal
tags: [struct private]
```

```Go
type poolLocalInternal struct {
	private interface{} // Can be used only by the respective P.
	shared  poolChain   // Local P can pushHead/popHead; any P can popTail.
}
```

Local per-P Pool appendix. 

### <a id="readOnly" href="#readOnly">type readOnly struct</a>

```
searchKey: sync.readOnly
tags: [struct private]
```

```Go
type readOnly struct {
	m       map[interface{}]*entry
	amended bool // true if the dirty map contains some key not in m.
}
```

readOnly is an immutable struct stored atomically in the Map.read field. 

### <a id="rlocker" href="#rlocker">type rlocker sync.RWMutex</a>

```
searchKey: sync.rlocker
tags: [struct private]
```

```Go
type rlocker RWMutex
```

#### <a id="rlocker.Lock" href="#rlocker.Lock">func (r *rlocker) Lock()</a>

```
searchKey: sync.rlocker.Lock
tags: [method private]
```

```Go
func (r *rlocker) Lock()
```

#### <a id="rlocker.Unlock" href="#rlocker.Unlock">func (r *rlocker) Unlock()</a>

```
searchKey: sync.rlocker.Unlock
tags: [method private]
```

```Go
func (r *rlocker) Unlock()
```

## <a id="func" href="#func">Functions</a>

### <a id="fastrand" href="#fastrand">func fastrand() uint32</a>

```
searchKey: sync.fastrand
tags: [function private]
```

```Go
func fastrand() uint32
```

from runtime 

### <a id="init.pool.go" href="#init.pool.go">func init()</a>

```
searchKey: sync.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.runtime.go" href="#init.runtime.go">func init()</a>

```
searchKey: sync.init
tags: [function private]
```

```Go
func init()
```

### <a id="poolCleanup" href="#poolCleanup">func poolCleanup()</a>

```
searchKey: sync.poolCleanup
tags: [function private]
```

```Go
func poolCleanup()
```

### <a id="poolRaceAddr" href="#poolRaceAddr">func poolRaceAddr(x interface{}) unsafe.Pointer</a>

```
searchKey: sync.poolRaceAddr
tags: [function private]
```

```Go
func poolRaceAddr(x interface{}) unsafe.Pointer
```

poolRaceAddr returns an address to use as the synchronization point for race detector logic. We don't use the actual pointer stored in x directly, for fear of conflicting with other synchronization on that address. Instead, we hash the pointer to get an index into poolRaceHash. See discussion on golang.org/cl/31589. 

### <a id="runtime_LoadAcquintptr" href="#runtime_LoadAcquintptr">func runtime_LoadAcquintptr(ptr *uintptr) uintptr</a>

```
searchKey: sync.runtime_LoadAcquintptr
tags: [function private]
```

```Go
func runtime_LoadAcquintptr(ptr *uintptr) uintptr
```

### <a id="runtime_Semacquire" href="#runtime_Semacquire">func runtime_Semacquire(s *uint32)</a>

```
searchKey: sync.runtime_Semacquire
tags: [function private]
```

```Go
func runtime_Semacquire(s *uint32)
```

Semacquire waits until *s > 0 and then atomically decrements it. It is intended as a simple sleep primitive for use by the synchronization library and should not be used directly. 

### <a id="runtime_SemacquireMutex" href="#runtime_SemacquireMutex">func runtime_SemacquireMutex(s *uint32, lifo bool, skipframes int)</a>

```
searchKey: sync.runtime_SemacquireMutex
tags: [function private]
```

```Go
func runtime_SemacquireMutex(s *uint32, lifo bool, skipframes int)
```

SemacquireMutex is like Semacquire, but for profiling contended Mutexes. If lifo is true, queue waiter at the head of wait queue. skipframes is the number of frames to omit during tracing, counting from runtime_SemacquireMutex's caller. 

### <a id="runtime_Semrelease" href="#runtime_Semrelease">func runtime_Semrelease(s *uint32, handoff bool, skipframes int)</a>

```
searchKey: sync.runtime_Semrelease
tags: [function private]
```

```Go
func runtime_Semrelease(s *uint32, handoff bool, skipframes int)
```

Semrelease atomically increments *s and notifies a waiting goroutine if one is blocked in Semacquire. It is intended as a simple wakeup primitive for use by the synchronization library and should not be used directly. If handoff is true, pass count directly to the first waiter. skipframes is the number of frames to omit during tracing, counting from runtime_Semrelease's caller. 

### <a id="runtime_StoreReluintptr" href="#runtime_StoreReluintptr">func runtime_StoreReluintptr(ptr *uintptr, val uintptr) uintptr</a>

```
searchKey: sync.runtime_StoreReluintptr
tags: [function private]
```

```Go
func runtime_StoreReluintptr(ptr *uintptr, val uintptr) uintptr
```

### <a id="runtime_canSpin" href="#runtime_canSpin">func runtime_canSpin(i int) bool</a>

```
searchKey: sync.runtime_canSpin
tags: [function private]
```

```Go
func runtime_canSpin(i int) bool
```

Active spinning runtime support. runtime_canSpin reports whether spinning makes sense at the moment. 

### <a id="runtime_doSpin" href="#runtime_doSpin">func runtime_doSpin()</a>

```
searchKey: sync.runtime_doSpin
tags: [function private]
```

```Go
func runtime_doSpin()
```

runtime_doSpin does active spinning. 

### <a id="runtime_nanotime" href="#runtime_nanotime">func runtime_nanotime() int64</a>

```
searchKey: sync.runtime_nanotime
tags: [function private]
```

```Go
func runtime_nanotime() int64
```

### <a id="runtime_notifyListAdd" href="#runtime_notifyListAdd">func runtime_notifyListAdd(l *notifyList) uint32</a>

```
searchKey: sync.runtime_notifyListAdd
tags: [function private]
```

```Go
func runtime_notifyListAdd(l *notifyList) uint32
```

See runtime/sema.go for documentation. 

### <a id="runtime_notifyListCheck" href="#runtime_notifyListCheck">func runtime_notifyListCheck(size uintptr)</a>

```
searchKey: sync.runtime_notifyListCheck
tags: [function private]
```

```Go
func runtime_notifyListCheck(size uintptr)
```

Ensure that sync and runtime agree on size of notifyList. 

### <a id="runtime_notifyListNotifyAll" href="#runtime_notifyListNotifyAll">func runtime_notifyListNotifyAll(l *notifyList)</a>

```
searchKey: sync.runtime_notifyListNotifyAll
tags: [function private]
```

```Go
func runtime_notifyListNotifyAll(l *notifyList)
```

See runtime/sema.go for documentation. 

### <a id="runtime_notifyListNotifyOne" href="#runtime_notifyListNotifyOne">func runtime_notifyListNotifyOne(l *notifyList)</a>

```
searchKey: sync.runtime_notifyListNotifyOne
tags: [function private]
```

```Go
func runtime_notifyListNotifyOne(l *notifyList)
```

See runtime/sema.go for documentation. 

### <a id="runtime_notifyListWait" href="#runtime_notifyListWait">func runtime_notifyListWait(l *notifyList, t uint32)</a>

```
searchKey: sync.runtime_notifyListWait
tags: [function private]
```

```Go
func runtime_notifyListWait(l *notifyList, t uint32)
```

See runtime/sema.go for documentation. 

### <a id="runtime_procPin" href="#runtime_procPin">func runtime_procPin() int</a>

```
searchKey: sync.runtime_procPin
tags: [function private]
```

```Go
func runtime_procPin() int
```

### <a id="runtime_procUnpin" href="#runtime_procUnpin">func runtime_procUnpin()</a>

```
searchKey: sync.runtime_procUnpin
tags: [function private]
```

```Go
func runtime_procUnpin()
```

### <a id="runtime_registerPoolCleanup" href="#runtime_registerPoolCleanup">func runtime_registerPoolCleanup(cleanup func())</a>

```
searchKey: sync.runtime_registerPoolCleanup
tags: [function private]
```

```Go
func runtime_registerPoolCleanup(cleanup func())
```

Implemented in runtime. 

### <a id="storePoolChainElt" href="#storePoolChainElt">func storePoolChainElt(pp **poolChainElt, v *poolChainElt)</a>

```
searchKey: sync.storePoolChainElt
tags: [function private]
```

```Go
func storePoolChainElt(pp **poolChainElt, v *poolChainElt)
```

### <a id="throw" href="#throw">func throw(string)</a>

```
searchKey: sync.throw
tags: [function private]
```

```Go
func throw(string)
```

