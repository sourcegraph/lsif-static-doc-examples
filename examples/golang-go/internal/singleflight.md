# Package singleflight

Package singleflight provides a duplicate function call suppression mechanism. 

## Index

* [Types](#type)
    * [type call struct](#call)
    * [type Group struct](#Group)
        * [func (g *Group) Do(key string, fn func() (interface{}, error)) (v interface{}, err error, shared bool)](#Group.Do)
        * [func (g *Group) DoChan(key string, fn func() (interface{}, error)) (<-chan Result, bool)](#Group.DoChan)
        * [func (g *Group) doCall(c *call, key string, fn func() (interface{}, error))](#Group.doCall)
        * [func (g *Group) ForgetUnshared(key string) bool](#Group.ForgetUnshared)
    * [type Result struct](#Result)
* [Functions](#func)
    * [func TestDo(t *testing.T)](#TestDo)
    * [func TestDoErr(t *testing.T)](#TestDoErr)
    * [func TestDoDupSuppress(t *testing.T)](#TestDoDupSuppress)


## <a id="type" href="#type">Types</a>

### <a id="call" href="#call">type call struct</a>

```
searchKey: singleflight.call
```

```Go
type call struct {
	wg sync.WaitGroup

	// These fields are written once before the WaitGroup is done
	// and are only read after the WaitGroup is done.
	val interface{}
	err error

	// These fields are read and written with the singleflight
	// mutex held before the WaitGroup is done, and are read but
	// not written after the WaitGroup is done.
	dups  int
	chans []chan<- Result
}
```

call is an in-flight or completed singleflight.Do call 

### <a id="Group" href="#Group">type Group struct</a>

```
searchKey: singleflight.Group
tags: [exported]
```

```Go
type Group struct {
	mu sync.Mutex       // protects m
	m  map[string]*call // lazily initialized
}
```

Group represents a class of work and forms a namespace in which units of work can be executed with duplicate suppression. 

#### <a id="Group.Do" href="#Group.Do">func (g *Group) Do(key string, fn func() (interface{}, error)) (v interface{}, err error, shared bool)</a>

```
searchKey: singleflight.Group.Do
tags: [exported]
```

```Go
func (g *Group) Do(key string, fn func() (interface{}, error)) (v interface{}, err error, shared bool)
```

Do executes and returns the results of the given function, making sure that only one execution is in-flight for a given key at a time. If a duplicate comes in, the duplicate caller waits for the original to complete and receives the same results. The return value shared indicates whether v was given to multiple callers. 

#### <a id="Group.DoChan" href="#Group.DoChan">func (g *Group) DoChan(key string, fn func() (interface{}, error)) (<-chan Result, bool)</a>

```
searchKey: singleflight.Group.DoChan
tags: [exported]
```

```Go
func (g *Group) DoChan(key string, fn func() (interface{}, error)) (<-chan Result, bool)
```

DoChan is like Do but returns a channel that will receive the results when they are ready. The second result is true if the function will eventually be called, false if it will not (because there is a pending request with this key). 

#### <a id="Group.doCall" href="#Group.doCall">func (g *Group) doCall(c *call, key string, fn func() (interface{}, error))</a>

```
searchKey: singleflight.Group.doCall
```

```Go
func (g *Group) doCall(c *call, key string, fn func() (interface{}, error))
```

doCall handles the single call for a key. 

#### <a id="Group.ForgetUnshared" href="#Group.ForgetUnshared">func (g *Group) ForgetUnshared(key string) bool</a>

```
searchKey: singleflight.Group.ForgetUnshared
tags: [exported]
```

```Go
func (g *Group) ForgetUnshared(key string) bool
```

ForgetUnshared tells the singleflight to forget about a key if it is not shared with any other goroutines. Future calls to Do for a forgotten key will call the function rather than waiting for an earlier call to complete. Returns whether the key was forgotten or unknown--that is, whether no other goroutines are waiting for the result. 

### <a id="Result" href="#Result">type Result struct</a>

```
searchKey: singleflight.Result
tags: [exported]
```

```Go
type Result struct {
	Val    interface{}
	Err    error
	Shared bool
}
```

Result holds the results of Do, so they can be passed on a channel. 

## <a id="func" href="#func">Functions</a>

### <a id="TestDo" href="#TestDo">func TestDo(t *testing.T)</a>

```
searchKey: singleflight.TestDo
```

```Go
func TestDo(t *testing.T)
```

### <a id="TestDoErr" href="#TestDoErr">func TestDoErr(t *testing.T)</a>

```
searchKey: singleflight.TestDoErr
```

```Go
func TestDoErr(t *testing.T)
```

### <a id="TestDoDupSuppress" href="#TestDoDupSuppress">func TestDoDupSuppress(t *testing.T)</a>

```
searchKey: singleflight.TestDoDupSuppress
```

```Go
func TestDoDupSuppress(t *testing.T)
```

