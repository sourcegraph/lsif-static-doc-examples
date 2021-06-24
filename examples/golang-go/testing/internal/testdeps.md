# Package testdeps

Package testdeps provides access to dependencies needed by test execution. 

This package is imported by the generated main package, which passes TestDeps into testing.Main. This allows tests to use packages at run time without making those packages direct dependencies of package testing. Direct dependencies of package testing are harder to write tests for. 

## Index

* [Variables](#var)
    * [var ImportPath](#ImportPath)
    * [var log](#log)
    * [var matchPat](#matchPat)
    * [var matchRe](#matchRe)
* [Types](#type)
    * [type TestDeps struct{}](#TestDeps)
        * [func (TestDeps) ImportPath() string](#TestDeps.ImportPath)
        * [func (TestDeps) MatchString(pat, str string) (result bool, err error)](#TestDeps.MatchString)
        * [func (TestDeps) SetPanicOnExit0(v bool)](#TestDeps.SetPanicOnExit0)
        * [func (TestDeps) StartCPUProfile(w io.Writer) error](#TestDeps.StartCPUProfile)
        * [func (TestDeps) StartTestLog(w io.Writer)](#TestDeps.StartTestLog)
        * [func (TestDeps) StopCPUProfile()](#TestDeps.StopCPUProfile)
        * [func (TestDeps) StopTestLog() error](#TestDeps.StopTestLog)
        * [func (TestDeps) WriteProfileTo(name string, w io.Writer, debug int) error](#TestDeps.WriteProfileTo)
    * [type testLog struct](#testLog)
        * [func (l *testLog) Chdir(name string)](#testLog.Chdir)
        * [func (l *testLog) Getenv(key string)](#testLog.Getenv)
        * [func (l *testLog) Open(name string)](#testLog.Open)
        * [func (l *testLog) Stat(name string)](#testLog.Stat)
        * [func (l *testLog) add(op, name string)](#testLog.add)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="ImportPath" href="#ImportPath">var ImportPath</a>

```
searchKey: testdeps.ImportPath
tags: [variable string]
```

```Go
var ImportPath string
```

ImportPath is the import path of the testing binary, set by the generated main function. 

### <a id="log" href="#log">var log</a>

```
searchKey: testdeps.log
tags: [variable struct private]
```

```Go
var log testLog
```

### <a id="matchPat" href="#matchPat">var matchPat</a>

```
searchKey: testdeps.matchPat
tags: [variable string private]
```

```Go
var matchPat string
```

### <a id="matchRe" href="#matchRe">var matchRe</a>

```
searchKey: testdeps.matchRe
tags: [variable struct private]
```

```Go
var matchRe *regexp.Regexp
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="TestDeps" href="#TestDeps">type TestDeps struct{}</a>

```
searchKey: testdeps.TestDeps
tags: [struct]
```

```Go
type TestDeps struct{}
```

TestDeps is an implementation of the testing.testDeps interface, suitable for passing to testing.MainStart. 

#### <a id="TestDeps.ImportPath" href="#TestDeps.ImportPath">func (TestDeps) ImportPath() string</a>

```
searchKey: testdeps.TestDeps.ImportPath
tags: [function]
```

```Go
func (TestDeps) ImportPath() string
```

#### <a id="TestDeps.MatchString" href="#TestDeps.MatchString">func (TestDeps) MatchString(pat, str string) (result bool, err error)</a>

```
searchKey: testdeps.TestDeps.MatchString
tags: [method]
```

```Go
func (TestDeps) MatchString(pat, str string) (result bool, err error)
```

#### <a id="TestDeps.SetPanicOnExit0" href="#TestDeps.SetPanicOnExit0">func (TestDeps) SetPanicOnExit0(v bool)</a>

```
searchKey: testdeps.TestDeps.SetPanicOnExit0
tags: [method]
```

```Go
func (TestDeps) SetPanicOnExit0(v bool)
```

SetPanicOnExit0 tells the os package whether to panic on os.Exit(0). 

#### <a id="TestDeps.StartCPUProfile" href="#TestDeps.StartCPUProfile">func (TestDeps) StartCPUProfile(w io.Writer) error</a>

```
searchKey: testdeps.TestDeps.StartCPUProfile
tags: [method]
```

```Go
func (TestDeps) StartCPUProfile(w io.Writer) error
```

#### <a id="TestDeps.StartTestLog" href="#TestDeps.StartTestLog">func (TestDeps) StartTestLog(w io.Writer)</a>

```
searchKey: testdeps.TestDeps.StartTestLog
tags: [method]
```

```Go
func (TestDeps) StartTestLog(w io.Writer)
```

#### <a id="TestDeps.StopCPUProfile" href="#TestDeps.StopCPUProfile">func (TestDeps) StopCPUProfile()</a>

```
searchKey: testdeps.TestDeps.StopCPUProfile
tags: [function]
```

```Go
func (TestDeps) StopCPUProfile()
```

#### <a id="TestDeps.StopTestLog" href="#TestDeps.StopTestLog">func (TestDeps) StopTestLog() error</a>

```
searchKey: testdeps.TestDeps.StopTestLog
tags: [function]
```

```Go
func (TestDeps) StopTestLog() error
```

#### <a id="TestDeps.WriteProfileTo" href="#TestDeps.WriteProfileTo">func (TestDeps) WriteProfileTo(name string, w io.Writer, debug int) error</a>

```
searchKey: testdeps.TestDeps.WriteProfileTo
tags: [method]
```

```Go
func (TestDeps) WriteProfileTo(name string, w io.Writer, debug int) error
```

### <a id="testLog" href="#testLog">type testLog struct</a>

```
searchKey: testdeps.testLog
tags: [struct private]
```

```Go
type testLog struct {
	mu  sync.Mutex
	w   *bufio.Writer
	set bool
}
```

testLog implements testlog.Interface, logging actions by package os. 

#### <a id="testLog.Chdir" href="#testLog.Chdir">func (l *testLog) Chdir(name string)</a>

```
searchKey: testdeps.testLog.Chdir
tags: [method private]
```

```Go
func (l *testLog) Chdir(name string)
```

#### <a id="testLog.Getenv" href="#testLog.Getenv">func (l *testLog) Getenv(key string)</a>

```
searchKey: testdeps.testLog.Getenv
tags: [method private]
```

```Go
func (l *testLog) Getenv(key string)
```

#### <a id="testLog.Open" href="#testLog.Open">func (l *testLog) Open(name string)</a>

```
searchKey: testdeps.testLog.Open
tags: [method private]
```

```Go
func (l *testLog) Open(name string)
```

#### <a id="testLog.Stat" href="#testLog.Stat">func (l *testLog) Stat(name string)</a>

```
searchKey: testdeps.testLog.Stat
tags: [method private]
```

```Go
func (l *testLog) Stat(name string)
```

#### <a id="testLog.add" href="#testLog.add">func (l *testLog) add(op, name string)</a>

```
searchKey: testdeps.testLog.add
tags: [method private]
```

```Go
func (l *testLog) add(op, name string)
```

add adds the (op, name) pair to the test log. 

