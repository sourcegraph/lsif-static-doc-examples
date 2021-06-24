# Package testlog

Package testlog provides a back-channel communication path between tests and package os, so that cmd/go can see which environment variables and files a test consults. 

## Index

* [Variables](#var)
    * [var logger](#logger)
    * [var panicOnExit0](#panicOnExit0)
* [Types](#type)
    * [type Interface interface](#Interface)
        * [func Logger() Interface](#Logger)
* [Functions](#func)
    * [func Getenv(name string)](#Getenv)
    * [func Open(name string)](#Open)
    * [func PanicOnExit0() bool](#PanicOnExit0)
    * [func SetLogger(impl Interface)](#SetLogger)
    * [func SetPanicOnExit0(v bool)](#SetPanicOnExit0)
    * [func Stat(name string)](#Stat)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="logger" href="#logger">var logger</a>

```
searchKey: testlog.logger
tags: [variable struct private]
```

```Go
var logger atomic.Value
```

logger is the current logger Interface. We use an atomic.Value in case test startup is racing with goroutines started during init. That must not cause a race detector failure, although it will still result in limited visibility into exactly what those goroutines do. 

### <a id="panicOnExit0" href="#panicOnExit0">var panicOnExit0</a>

```
searchKey: testlog.panicOnExit0
tags: [variable struct private]
```

```Go
var panicOnExit0 struct {
	mu  sync.Mutex
	val bool
}
```

panicOnExit0 is the flag used for PanicOnExit0. This uses a lock because the value can be cleared via a timer call that may race with calls to os.Exit 

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Interface" href="#Interface">type Interface interface</a>

```
searchKey: testlog.Interface
tags: [interface]
```

```Go
type Interface interface {
	Getenv(key string)
	Stat(file string)
	Open(file string)
	Chdir(dir string)
}
```

Interface is the interface required of test loggers. The os package will invoke the interface's methods to indicate that it is inspecting the given environment variables or files. Multiple goroutines may call these methods simultaneously. 

#### <a id="Logger" href="#Logger">func Logger() Interface</a>

```
searchKey: testlog.Logger
tags: [function]
```

```Go
func Logger() Interface
```

Logger returns the current test logger implementation. It returns nil if there is no logger. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Getenv" href="#Getenv">func Getenv(name string)</a>

```
searchKey: testlog.Getenv
tags: [method]
```

```Go
func Getenv(name string)
```

Getenv calls Logger().Getenv, if a logger has been set. 

### <a id="Open" href="#Open">func Open(name string)</a>

```
searchKey: testlog.Open
tags: [method]
```

```Go
func Open(name string)
```

Open calls Logger().Open, if a logger has been set. 

### <a id="PanicOnExit0" href="#PanicOnExit0">func PanicOnExit0() bool</a>

```
searchKey: testlog.PanicOnExit0
tags: [function]
```

```Go
func PanicOnExit0() bool
```

PanicOnExit0 reports whether to panic on a call to os.Exit(0). This is in the testlog package because, like other definitions in package testlog, it is a hook between the testing package and the os package. This is used to ensure that an early call to os.Exit(0) does not cause a test to pass. 

### <a id="SetLogger" href="#SetLogger">func SetLogger(impl Interface)</a>

```
searchKey: testlog.SetLogger
tags: [method]
```

```Go
func SetLogger(impl Interface)
```

SetLogger sets the test logger implementation for the current process. It must be called only once, at process startup. 

### <a id="SetPanicOnExit0" href="#SetPanicOnExit0">func SetPanicOnExit0(v bool)</a>

```
searchKey: testlog.SetPanicOnExit0
tags: [method]
```

```Go
func SetPanicOnExit0(v bool)
```

SetPanicOnExit0 sets panicOnExit0 to v. 

### <a id="Stat" href="#Stat">func Stat(name string)</a>

```
searchKey: testlog.Stat
tags: [method]
```

```Go
func Stat(name string)
```

Stat calls Logger().Stat, if a logger has been set. 

