# Package locker

## Index

* [Constants](#const)
    * [const lockQuery](#lockQuery)
    * [const tryLockQuery](#tryLockQuery)
    * [const unlockQuery](#unlockQuery)
* [Types](#type)
    * [type Locker struct](#Locker)
        * [func NewWithDB(db dbutil.DB, namespace string) *Locker](#NewWithDB)
        * [func (l *Locker) With(other basestore.ShareableStore) *Locker](#Locker.With)
        * [func (l *Locker) Transact(ctx context.Context) (*Locker, error)](#Locker.Transact)
        * [func (l *Locker) Lock(ctx context.Context, key int, blocking bool) (locked bool, _ UnlockFunc, err error)](#Locker.Lock)
        * [func (l *Locker) lock(ctx context.Context, key int) (bool, error)](#Locker.lock)
        * [func (l *Locker) tryLock(ctx context.Context, key int) (bool, error)](#Locker.tryLock)
        * [func (l *Locker) unlock(key int) error](#Locker.unlock)
    * [type UnlockFunc func(err error) error](#UnlockFunc)
* [Functions](#func)
    * [func init()](#init.locker_test.go)
    * [func TestLock(t *testing.T)](#TestLock)
    * [func TestLockBlockingAcquire(t *testing.T)](#TestLockBlockingAcquire)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="lockQuery" href="#lockQuery">const lockQuery</a>

```
searchKey: locker.lockQuery
tags: [private]
```

```Go
const lockQuery = ...
```

### <a id="tryLockQuery" href="#tryLockQuery">const tryLockQuery</a>

```
searchKey: locker.tryLockQuery
tags: [private]
```

```Go
const tryLockQuery = ...
```

### <a id="unlockQuery" href="#unlockQuery">const unlockQuery</a>

```
searchKey: locker.unlockQuery
tags: [private]
```

```Go
const unlockQuery = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Locker" href="#Locker">type Locker struct</a>

```
searchKey: locker.Locker
```

```Go
type Locker struct {
	*basestore.Store
	namespace int32
}
```

Locker is a wrapper around a base store with methods that control advisory locks. A locker should be used when work needs to be coordinated with other remote services. 

For example, an advisory lock can be taken around an expensive calculation related to a particular repository to ensure that no other service is performing the same task. 

#### <a id="NewWithDB" href="#NewWithDB">func NewWithDB(db dbutil.DB, namespace string) *Locker</a>

```
searchKey: locker.NewWithDB
```

```Go
func NewWithDB(db dbutil.DB, namespace string) *Locker
```

NewWithDB creates a new Locker with the given namespace. 

#### <a id="Locker.With" href="#Locker.With">func (l *Locker) With(other basestore.ShareableStore) *Locker</a>

```
searchKey: locker.Locker.With
```

```Go
func (l *Locker) With(other basestore.ShareableStore) *Locker
```

#### <a id="Locker.Transact" href="#Locker.Transact">func (l *Locker) Transact(ctx context.Context) (*Locker, error)</a>

```
searchKey: locker.Locker.Transact
```

```Go
func (l *Locker) Transact(ctx context.Context) (*Locker, error)
```

#### <a id="Locker.Lock" href="#Locker.Lock">func (l *Locker) Lock(ctx context.Context, key int, blocking bool) (locked bool, _ UnlockFunc, err error)</a>

```
searchKey: locker.Locker.Lock
```

```Go
func (l *Locker) Lock(ctx context.Context, key int, blocking bool) (locked bool, _ UnlockFunc, err error)
```

Lock attempts to take an advisory lock on the given key. If successful, this method will return a true-valued flag along with a function that must be called to release the lock. 

#### <a id="Locker.lock" href="#Locker.lock">func (l *Locker) lock(ctx context.Context, key int) (bool, error)</a>

```
searchKey: locker.Locker.lock
tags: [private]
```

```Go
func (l *Locker) lock(ctx context.Context, key int) (bool, error)
```

lock blocks until an advisory lock is taken on the given key. 

#### <a id="Locker.tryLock" href="#Locker.tryLock">func (l *Locker) tryLock(ctx context.Context, key int) (bool, error)</a>

```
searchKey: locker.Locker.tryLock
tags: [private]
```

```Go
func (l *Locker) tryLock(ctx context.Context, key int) (bool, error)
```

tryLock attempts to take an advisory lock on the given key. Returns true on success and false on failure. 

#### <a id="Locker.unlock" href="#Locker.unlock">func (l *Locker) unlock(key int) error</a>

```
searchKey: locker.Locker.unlock
tags: [private]
```

```Go
func (l *Locker) unlock(key int) error
```

unlock releases the advisory lock on the given key. 

### <a id="UnlockFunc" href="#UnlockFunc">type UnlockFunc func(err error) error</a>

```
searchKey: locker.UnlockFunc
```

```Go
type UnlockFunc func(err error) error
```

UnlockFunc unlocks the advisory lock taken by a successful call to Lock. If an error occurs during unlock, the error is added to the resulting error value. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="init.locker_test.go" href="#init.locker_test.go">func init()</a>

```
searchKey: locker.init
tags: [private]
```

```Go
func init()
```

### <a id="TestLock" href="#TestLock">func TestLock(t *testing.T)</a>

```
searchKey: locker.TestLock
tags: [private]
```

```Go
func TestLock(t *testing.T)
```

### <a id="TestLockBlockingAcquire" href="#TestLockBlockingAcquire">func TestLockBlockingAcquire(t *testing.T)</a>

```
searchKey: locker.TestLockBlockingAcquire
tags: [private]
```

```Go
func TestLockBlockingAcquire(t *testing.T)
```

