# Package main

Command "src-expose" serves directories as git repositories over HTTP. 

## Index

* [Constants](#const)
    * [const testAddress](#testAddress)
* [Variables](#var)
    * [var errSilent](#errSilent)
    * [var indexHTML](#indexHTML)
    * [var postUpdateHook](#postUpdateHook)
    * [var discardLogger](#discardLogger)
* [Types](#type)
    * [type usageError struct](#usageError)
        * [func (e *usageError) Error() string](#usageError.Error)
    * [type Serve struct](#Serve)
        * [func (s *Serve) Start() error](#Serve.Start)
        * [func (s *Serve) handler() (http.Handler, error)](#Serve.handler)
        * [func (s *Serve) configureRepos() []string](#Serve.configureRepos)
        * [func (s *Serve) allUpdateServerInfo(gitDirs []string)](#Serve.allUpdateServerInfo)
    * [type Repo struct](#Repo)
    * [type httpDir struct](#httpDir)
        * [func (d httpDir) Open(name string) (http.File, error)](#httpDir.Open)
    * [type lineCountWriter struct](#lineCountWriter)
        * [func (w *lineCountWriter) Write(b []byte) (int, error)](#lineCountWriter.Write)
        * [func (w *lineCountWriter) Close() error](#lineCountWriter.Close)
    * [type SyncDir struct](#SyncDir)
    * [type Snapshotter struct](#Snapshotter)
        * [func (o *Snapshotter) SetDefaults() error](#Snapshotter.SetDefaults)
        * [func (o *Snapshotter) Run(logger *log.Logger) error](#Snapshotter.Run)
    * [type testWriter struct](#testWriter)
        * [func (tw testWriter) Write(p []byte) (n int, err error)](#testWriter.Write)
* [Functions](#func)
    * [func explainAddr(addr string) string](#explainAddr)
    * [func explainSnapshotter(s *Snapshotter) string](#explainSnapshotter)
    * [func usageErrorOutput(cmd *ffcli.Command, cmdPath string, err error) string](#usageErrorOutput)
    * [func shortenErrHelp(cmd *ffcli.Command, cmdPath string)](#shortenErrHelp)
    * [func main()](#main)
    * [func configurePostUpdateHook(logger *log.Logger, gitDir string) error](#configurePostUpdateHook)
    * [func updateServerInfo(gitDir string) error](#updateServerInfo)
    * [func snapshot(logger *log.Logger, src, dst string) error](#snapshot)
    * [func run(logger *log.Logger, name string, cmd *exec.Cmd) (int, error)](#run)
    * [func abs(root, dir string) (string, error)](#abs)
    * [func TestExplain(t *testing.T)](#TestExplain)
    * [func TestReposHandler(t *testing.T)](#TestReposHandler)
    * [func testReposHandler(t *testing.T, h http.Handler, repos []Repo)](#testReposHandler)
    * [func gitInitRepos(t *testing.T, names ...string) string](#gitInitRepos)
    * [func TestIgnoreGitSubmodules(t *testing.T)](#TestIgnoreGitSubmodules)
    * [func testLogger(t *testing.T) *log.Logger](#testLogger)


## <a id="const" href="#const">Constants</a>

### <a id="testAddress" href="#testAddress">const testAddress</a>

```
searchKey: main.testAddress
tags: [private]
```

```Go
const testAddress = "test.local:3939"
```

## <a id="var" href="#var">Variables</a>

### <a id="errSilent" href="#errSilent">var errSilent</a>

```
searchKey: main.errSilent
tags: [private]
```

```Go
var errSilent = errors.New("silent error")
```

### <a id="indexHTML" href="#indexHTML">var indexHTML</a>

```
searchKey: main.indexHTML
tags: [private]
```

```Go
var indexHTML = ...
```

### <a id="postUpdateHook" href="#postUpdateHook">var postUpdateHook</a>

```
searchKey: main.postUpdateHook
tags: [private]
```

```Go
var postUpdateHook = []byte("#!/bin/sh\nexec git update-server-info\n")
```

### <a id="discardLogger" href="#discardLogger">var discardLogger</a>

```
searchKey: main.discardLogger
tags: [private]
```

```Go
var discardLogger = log.New(io.Discard, "", log.LstdFlags)
```

## <a id="type" href="#type">Types</a>

### <a id="usageError" href="#usageError">type usageError struct</a>

```
searchKey: main.usageError
tags: [private]
```

```Go
type usageError struct {
	Msg string
}
```

#### <a id="usageError.Error" href="#usageError.Error">func (e *usageError) Error() string</a>

```
searchKey: main.usageError.Error
tags: [private]
```

```Go
func (e *usageError) Error() string
```

### <a id="Serve" href="#Serve">type Serve struct</a>

```
searchKey: main.Serve
```

```Go
type Serve struct {
	Addr  string
	Root  string
	Info  *log.Logger
	Debug *log.Logger

	// updatingServerInfo is used to ensure we only have 1 goroutine running
	// git update-server-info.
	updatingServerInfo uint64
}
```

#### <a id="Serve.Start" href="#Serve.Start">func (s *Serve) Start() error</a>

```
searchKey: main.Serve.Start
```

```Go
func (s *Serve) Start() error
```

#### <a id="Serve.handler" href="#Serve.handler">func (s *Serve) handler() (http.Handler, error)</a>

```
searchKey: main.Serve.handler
tags: [private]
```

```Go
func (s *Serve) handler() (http.Handler, error)
```

#### <a id="Serve.configureRepos" href="#Serve.configureRepos">func (s *Serve) configureRepos() []string</a>

```
searchKey: main.Serve.configureRepos
tags: [private]
```

```Go
func (s *Serve) configureRepos() []string
```

configureRepos finds all .git directories and configures them to be served. It returns a slice of all the git directories it finds. The paths are relative to root. 

#### <a id="Serve.allUpdateServerInfo" href="#Serve.allUpdateServerInfo">func (s *Serve) allUpdateServerInfo(gitDirs []string)</a>

```
searchKey: main.Serve.allUpdateServerInfo
tags: [private]
```

```Go
func (s *Serve) allUpdateServerInfo(gitDirs []string)
```

allUpdateServerInfo will run updateServerInfo on each gitDirs. To prevent too many of these processes running, it will only run one at a time. 

### <a id="Repo" href="#Repo">type Repo struct</a>

```
searchKey: main.Repo
```

```Go
type Repo struct {
	Name string
	URI  string
}
```

### <a id="httpDir" href="#httpDir">type httpDir struct</a>

```
searchKey: main.httpDir
tags: [private]
```

```Go
type httpDir struct {
	http.Dir
}
```

#### <a id="httpDir.Open" href="#httpDir.Open">func (d httpDir) Open(name string) (http.File, error)</a>

```
searchKey: main.httpDir.Open
tags: [private]
```

```Go
func (d httpDir) Open(name string) (http.File, error)
```

Wraps the http.Dir to inject subdir "/.git" to the path. 

### <a id="lineCountWriter" href="#lineCountWriter">type lineCountWriter struct</a>

```
searchKey: main.lineCountWriter
tags: [private]
```

```Go
type lineCountWriter struct {
	w      io.Writer
	prefix []byte

	inline bool
	lines  int
}
```

#### <a id="lineCountWriter.Write" href="#lineCountWriter.Write">func (w *lineCountWriter) Write(b []byte) (int, error)</a>

```
searchKey: main.lineCountWriter.Write
tags: [private]
```

```Go
func (w *lineCountWriter) Write(b []byte) (int, error)
```

#### <a id="lineCountWriter.Close" href="#lineCountWriter.Close">func (w *lineCountWriter) Close() error</a>

```
searchKey: main.lineCountWriter.Close
tags: [private]
```

```Go
func (w *lineCountWriter) Close() error
```

### <a id="SyncDir" href="#SyncDir">type SyncDir struct</a>

```
searchKey: main.SyncDir
```

```Go
type SyncDir struct {
	// Before if non-empty is a command run before syncing.
	Before string `yaml:",omitempty"`

	// Dir is the directory to treat as the git working directory.
	Dir string `yaml:",omitempty"`

	// Destination is the directory containing the bare git repo.
	Destination string `yaml:",omitempty"`

	// MinDuration defines the minimum wait between syncs for Dir.
	MinDuration time.Duration `yaml:",omitempty"`

	// last stores the time of the last sync. Compared against MinDuration to
	// determine if we should run.
	last time.Time
}
```

SyncDir creates a commit of Dir into the bare git repo Destination. 

### <a id="Snapshotter" href="#Snapshotter">type Snapshotter struct</a>

```
searchKey: main.Snapshotter
```

```Go
type Snapshotter struct {
	// Root is the directory Before is run from. If a SyncDir's Dir is
	// relative, it will be resolved relative to this directory. Defaults to
	// PWD.
	Root string

	// If a SyncDir's Destination is relative, it will be resolved relative to
	// Destination. Defaults to ~/.sourcegraph/src-expose-repos
	Destination string

	// Before is a command run before sync. Before is run from Dir.
	Before string

	// Dirs is a list of directories to sync.
	Dirs []*SyncDir

	// DirMode defines what behaviour to use if Dir is missing.
	//
	//  - fail (default)
	//  - ignore
	//  - remove_dest
	DirMode string

	// Duration defines how often sync should run.
	Duration time.Duration
}
```

Snapshotter manages the running over several syncs. 

#### <a id="Snapshotter.SetDefaults" href="#Snapshotter.SetDefaults">func (o *Snapshotter) SetDefaults() error</a>

```
searchKey: main.Snapshotter.SetDefaults
```

```Go
func (o *Snapshotter) SetDefaults() error
```

#### <a id="Snapshotter.Run" href="#Snapshotter.Run">func (o *Snapshotter) Run(logger *log.Logger) error</a>

```
searchKey: main.Snapshotter.Run
```

```Go
func (o *Snapshotter) Run(logger *log.Logger) error
```

### <a id="testWriter" href="#testWriter">type testWriter struct</a>

```
searchKey: main.testWriter
tags: [private]
```

```Go
type testWriter struct {
	*testing.T
}
```

#### <a id="testWriter.Write" href="#testWriter.Write">func (tw testWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: main.testWriter.Write
tags: [private]
```

```Go
func (tw testWriter) Write(p []byte) (n int, err error)
```

## <a id="func" href="#func">Functions</a>

### <a id="explainAddr" href="#explainAddr">func explainAddr(addr string) string</a>

```
searchKey: main.explainAddr
tags: [private]
```

```Go
func explainAddr(addr string) string
```

### <a id="explainSnapshotter" href="#explainSnapshotter">func explainSnapshotter(s *Snapshotter) string</a>

```
searchKey: main.explainSnapshotter
tags: [private]
```

```Go
func explainSnapshotter(s *Snapshotter) string
```

### <a id="usageErrorOutput" href="#usageErrorOutput">func usageErrorOutput(cmd *ffcli.Command, cmdPath string, err error) string</a>

```
searchKey: main.usageErrorOutput
tags: [private]
```

```Go
func usageErrorOutput(cmd *ffcli.Command, cmdPath string, err error) string
```

### <a id="shortenErrHelp" href="#shortenErrHelp">func shortenErrHelp(cmd *ffcli.Command, cmdPath string)</a>

```
searchKey: main.shortenErrHelp
tags: [private]
```

```Go
func shortenErrHelp(cmd *ffcli.Command, cmdPath string)
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [private]
```

```Go
func main()
```

### <a id="configurePostUpdateHook" href="#configurePostUpdateHook">func configurePostUpdateHook(logger *log.Logger, gitDir string) error</a>

```
searchKey: main.configurePostUpdateHook
tags: [private]
```

```Go
func configurePostUpdateHook(logger *log.Logger, gitDir string) error
```

configureOneRepos tweaks a .git repo such that it can be git cloned. See [https://theartofmachinery.com/2016/07/02/git_over_http.html](https://theartofmachinery.com/2016/07/02/git_over_http.html) for background. 

### <a id="updateServerInfo" href="#updateServerInfo">func updateServerInfo(gitDir string) error</a>

```
searchKey: main.updateServerInfo
tags: [private]
```

```Go
func updateServerInfo(gitDir string) error
```

### <a id="snapshot" href="#snapshot">func snapshot(logger *log.Logger, src, dst string) error</a>

```
searchKey: main.snapshot
tags: [private]
```

```Go
func snapshot(logger *log.Logger, src, dst string) error
```

### <a id="run" href="#run">func run(logger *log.Logger, name string, cmd *exec.Cmd) (int, error)</a>

```
searchKey: main.run
tags: [private]
```

```Go
func run(logger *log.Logger, name string, cmd *exec.Cmd) (int, error)
```

### <a id="abs" href="#abs">func abs(root, dir string) (string, error)</a>

```
searchKey: main.abs
tags: [private]
```

```Go
func abs(root, dir string) (string, error)
```

### <a id="TestExplain" href="#TestExplain">func TestExplain(t *testing.T)</a>

```
searchKey: main.TestExplain
tags: [private]
```

```Go
func TestExplain(t *testing.T)
```

### <a id="TestReposHandler" href="#TestReposHandler">func TestReposHandler(t *testing.T)</a>

```
searchKey: main.TestReposHandler
tags: [private]
```

```Go
func TestReposHandler(t *testing.T)
```

### <a id="testReposHandler" href="#testReposHandler">func testReposHandler(t *testing.T, h http.Handler, repos []Repo)</a>

```
searchKey: main.testReposHandler
tags: [private]
```

```Go
func testReposHandler(t *testing.T, h http.Handler, repos []Repo)
```

### <a id="gitInitRepos" href="#gitInitRepos">func gitInitRepos(t *testing.T, names ...string) string</a>

```
searchKey: main.gitInitRepos
tags: [private]
```

```Go
func gitInitRepos(t *testing.T, names ...string) string
```

### <a id="TestIgnoreGitSubmodules" href="#TestIgnoreGitSubmodules">func TestIgnoreGitSubmodules(t *testing.T)</a>

```
searchKey: main.TestIgnoreGitSubmodules
tags: [private]
```

```Go
func TestIgnoreGitSubmodules(t *testing.T)
```

### <a id="testLogger" href="#testLogger">func testLogger(t *testing.T) *log.Logger</a>

```
searchKey: main.testLogger
tags: [private]
```

```Go
func testLogger(t *testing.T) *log.Logger
```

