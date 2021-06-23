# Package testlog

Package testlog provides a back-channel communication path between tests and package os, so that cmd/go can see which environment variables and files a test consults. 

## Index

* [Variables](#var)
    * [var panicOnExit0](#panicOnExit0)
    * [var logger](#logger)
* [Types](#type)
    * [type Interface interface](#Interface)
        * [func Logger() Interface](#Logger)
* [Functions](#func)
    * [func PanicOnExit0() bool](#PanicOnExit0)
    * [func SetPanicOnExit0(v bool)](#SetPanicOnExit0)
    * [func SetLogger(impl Interface)](#SetLogger)
    * [func Getenv(name string)](#Getenv)
    * [func Open(name string)](#Open)
    * [func Stat(name string)](#Stat)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="panicOnExit0" href="#panicOnExit0">var panicOnExit0</a>

```
searchKey: testlog.panicOnExit0
tags: [private]
```

```Go
var panicOnExit0 struct {
	mu  sync.Mutex
	val bool
}
```

panicOnExit0 is the flag used for PanicOnExit0. This uses a lock because the value can be cleared via a timer call that may race with calls to os.Exit 

### <a id="logger" href="#logger">var logger</a>

```
searchKey: testlog.logger
tags: [private]
```

```Go
var logger atomic.Value
```

logger is the current logger Interface. We use an atomic.Value in case test startup is racing with goroutines started during init. That must not cause a race detector failure, although it will still result in limited visibility into exactly what those goroutines do. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Interface" href="#Interface">type Interface interface</a>

```
searchKey: testlog.Interface
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
```

```Go
func Logger() Interface
```

Logger returns the current test logger implementation. It returns nil if there is no logger. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="PanicOnExit0" href="#PanicOnExit0">func PanicOnExit0() bool</a>

```
searchKey: testlog.PanicOnExit0
```

```Go
func PanicOnExit0() bool
```

PanicOnExit0 reports whether to panic on a call to os.Exit(0). This is in the testlog package because, like other definitions in package testlog, it is a hook between the testing package and the os package. This is used to ensure that an early call to os.Exit(0) does not cause a test to pass. 

### <a id="SetPanicOnExit0" href="#SetPanicOnExit0">func SetPanicOnExit0(v bool)</a>

```
searchKey: testlog.SetPanicOnExit0
```

```Go
func SetPanicOnExit0(v bool)
```

SetPanicOnExit0 sets panicOnExit0 to v. 

### <a id="SetLogger" href="#SetLogger">func SetLogger(impl Interface)</a>

```
searchKey: testlog.SetLogger
```

```Go
func SetLogger(impl Interface)
```

SetLogger sets the test logger implementation for the current process. It must be called only once, at process startup. 

### <a id="Getenv" href="#Getenv">func Getenv(name string)</a>

```
searchKey: testlog.Getenv
```

```Go
func Getenv(name string)
```

Getenv calls Logger().Getenv, if a logger has been set. 

### <a id="Open" href="#Open">func Open(name string)</a>

```
searchKey: testlog.Open
```

```Go
func Open(name string)
```

Open calls Logger().Open, if a logger has been set. 

### <a id="Stat" href="#Stat">func Stat(name string)</a>

```
searchKey: testlog.Stat
```

```Go
func Stat(name string)
```

Stat calls Logger().Stat, if a logger has been set. 

