# Package testenv

Package testenv provides information about what functionality is available in different testing environments run by the Go team. 

It is an internal package because these details are specific to the Go team's test setup (on build.golang.org) and not fundamental to tests in general. 

## Index

* [Variables](#var)
    * [var execPaths](#execPaths)
    * [var flaky](#flaky)
    * [var haveCGO](#haveCGO)
* [Functions](#func)
    * [func Builder() string](#Builder)
    * [func CPUIsSlow() bool](#CPUIsSlow)
    * [func CanInternalLink() bool](#CanInternalLink)
    * [func CleanCmdEnv(cmd *exec.Cmd) *exec.Cmd](#CleanCmdEnv)
    * [func GoTool() (string, error)](#GoTool)
    * [func GoToolPath(t testing.TB) string](#GoToolPath)
    * [func HasCGO() bool](#HasCGO)
    * [func HasExec() bool](#HasExec)
    * [func HasExternalNetwork() bool](#HasExternalNetwork)
    * [func HasGoBuild() bool](#HasGoBuild)
    * [func HasGoRun() bool](#HasGoRun)
    * [func HasLink() bool](#HasLink)
    * [func HasSrc() bool](#HasSrc)
    * [func HasSymlink() bool](#HasSymlink)
    * [func MustHaveCGO(t testing.TB)](#MustHaveCGO)
    * [func MustHaveExec(t testing.TB)](#MustHaveExec)
    * [func MustHaveExecPath(t testing.TB, path string)](#MustHaveExecPath)
    * [func MustHaveExternalNetwork(t testing.TB)](#MustHaveExternalNetwork)
    * [func MustHaveGoBuild(t testing.TB)](#MustHaveGoBuild)
    * [func MustHaveGoRun(t testing.TB)](#MustHaveGoRun)
    * [func MustHaveLink(t testing.TB)](#MustHaveLink)
    * [func MustHaveSymlink(t testing.TB)](#MustHaveSymlink)
    * [func MustInternalLink(t testing.TB)](#MustInternalLink)
    * [func SkipFlaky(t testing.TB, issue int)](#SkipFlaky)
    * [func SkipFlakyNet(t testing.TB)](#SkipFlakyNet)
    * [func SkipIfShortAndSlow(t testing.TB)](#SkipIfShortAndSlow)
    * [func hasSymlink() (ok bool, reason string)](#hasSymlink)
    * [func init()](#init.testenv_cgo.go)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="execPaths" href="#execPaths">var execPaths</a>

```
searchKey: testenv.execPaths
tags: [variable struct private]
```

```Go
var execPaths sync.Map // path -> error

```

### <a id="flaky" href="#flaky">var flaky</a>

```
searchKey: testenv.flaky
tags: [variable boolean private]
```

```Go
var flaky = flag.Bool("flaky", false, "run known-flaky tests too")
```

### <a id="haveCGO" href="#haveCGO">var haveCGO</a>

```
searchKey: testenv.haveCGO
tags: [variable boolean private]
```

```Go
var haveCGO bool
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Builder" href="#Builder">func Builder() string</a>

```
searchKey: testenv.Builder
tags: [function]
```

```Go
func Builder() string
```

Builder reports the name of the builder running this test (for example, "linux-amd64" or "windows-386-gce"). If the test is not running on the build infrastructure, Builder returns the empty string. 

### <a id="CPUIsSlow" href="#CPUIsSlow">func CPUIsSlow() bool</a>

```
searchKey: testenv.CPUIsSlow
tags: [function]
```

```Go
func CPUIsSlow() bool
```

CPUIsSlow reports whether the CPU running the test is suspected to be slow. 

### <a id="CanInternalLink" href="#CanInternalLink">func CanInternalLink() bool</a>

```
searchKey: testenv.CanInternalLink
tags: [function]
```

```Go
func CanInternalLink() bool
```

CanInternalLink reports whether the current system can link programs with internal linking. (This is the opposite of cmd/internal/sys.MustLinkExternal. Keep them in sync.) 

### <a id="CleanCmdEnv" href="#CleanCmdEnv">func CleanCmdEnv(cmd *exec.Cmd) *exec.Cmd</a>

```
searchKey: testenv.CleanCmdEnv
tags: [function]
```

```Go
func CleanCmdEnv(cmd *exec.Cmd) *exec.Cmd
```

CleanCmdEnv will fill cmd.Env with the environment, excluding certain variables that could modify the behavior of the Go tools such as GODEBUG and GOTRACEBACK. 

### <a id="GoTool" href="#GoTool">func GoTool() (string, error)</a>

```
searchKey: testenv.GoTool
tags: [function]
```

```Go
func GoTool() (string, error)
```

GoTool reports the path to the Go tool. 

### <a id="GoToolPath" href="#GoToolPath">func GoToolPath(t testing.TB) string</a>

```
searchKey: testenv.GoToolPath
tags: [function]
```

```Go
func GoToolPath(t testing.TB) string
```

GoToolPath reports the path to the Go tool. It is a convenience wrapper around GoTool. If the tool is unavailable GoToolPath calls t.Skip. If the tool should be available and isn't, GoToolPath calls t.Fatal. 

### <a id="HasCGO" href="#HasCGO">func HasCGO() bool</a>

```
searchKey: testenv.HasCGO
tags: [function]
```

```Go
func HasCGO() bool
```

HasCGO reports whether the current system can use cgo. 

### <a id="HasExec" href="#HasExec">func HasExec() bool</a>

```
searchKey: testenv.HasExec
tags: [function]
```

```Go
func HasExec() bool
```

HasExec reports whether the current system can start new processes using os.StartProcess or (more commonly) exec.Command. 

### <a id="HasExternalNetwork" href="#HasExternalNetwork">func HasExternalNetwork() bool</a>

```
searchKey: testenv.HasExternalNetwork
tags: [function]
```

```Go
func HasExternalNetwork() bool
```

HasExternalNetwork reports whether the current system can use external (non-localhost) networks. 

### <a id="HasGoBuild" href="#HasGoBuild">func HasGoBuild() bool</a>

```
searchKey: testenv.HasGoBuild
tags: [function]
```

```Go
func HasGoBuild() bool
```

HasGoBuild reports whether the current system can build programs with `go build' and then run them with os.StartProcess or exec.Command. 

### <a id="HasGoRun" href="#HasGoRun">func HasGoRun() bool</a>

```
searchKey: testenv.HasGoRun
tags: [function]
```

```Go
func HasGoRun() bool
```

HasGoRun reports whether the current system can run programs with `go run.' 

### <a id="HasLink" href="#HasLink">func HasLink() bool</a>

```
searchKey: testenv.HasLink
tags: [function]
```

```Go
func HasLink() bool
```

HasLink reports whether the current system can use os.Link. 

### <a id="HasSrc" href="#HasSrc">func HasSrc() bool</a>

```
searchKey: testenv.HasSrc
tags: [function]
```

```Go
func HasSrc() bool
```

HasSrc reports whether the entire source tree is available under GOROOT. 

### <a id="HasSymlink" href="#HasSymlink">func HasSymlink() bool</a>

```
searchKey: testenv.HasSymlink
tags: [function]
```

```Go
func HasSymlink() bool
```

HasSymlink reports whether the current system can use os.Symlink. 

### <a id="MustHaveCGO" href="#MustHaveCGO">func MustHaveCGO(t testing.TB)</a>

```
searchKey: testenv.MustHaveCGO
tags: [function]
```

```Go
func MustHaveCGO(t testing.TB)
```

MustHaveCGO calls t.Skip if cgo is not available. 

### <a id="MustHaveExec" href="#MustHaveExec">func MustHaveExec(t testing.TB)</a>

```
searchKey: testenv.MustHaveExec
tags: [function]
```

```Go
func MustHaveExec(t testing.TB)
```

MustHaveExec checks that the current system can start new processes using os.StartProcess or (more commonly) exec.Command. If not, MustHaveExec calls t.Skip with an explanation. 

### <a id="MustHaveExecPath" href="#MustHaveExecPath">func MustHaveExecPath(t testing.TB, path string)</a>

```
searchKey: testenv.MustHaveExecPath
tags: [function]
```

```Go
func MustHaveExecPath(t testing.TB, path string)
```

MustHaveExecPath checks that the current system can start the named executable using os.StartProcess or (more commonly) exec.Command. If not, MustHaveExecPath calls t.Skip with an explanation. 

### <a id="MustHaveExternalNetwork" href="#MustHaveExternalNetwork">func MustHaveExternalNetwork(t testing.TB)</a>

```
searchKey: testenv.MustHaveExternalNetwork
tags: [function]
```

```Go
func MustHaveExternalNetwork(t testing.TB)
```

MustHaveExternalNetwork checks that the current system can use external (non-localhost) networks. If not, MustHaveExternalNetwork calls t.Skip with an explanation. 

### <a id="MustHaveGoBuild" href="#MustHaveGoBuild">func MustHaveGoBuild(t testing.TB)</a>

```
searchKey: testenv.MustHaveGoBuild
tags: [function]
```

```Go
func MustHaveGoBuild(t testing.TB)
```

MustHaveGoBuild checks that the current system can build programs with `go build' and then run them with os.StartProcess or exec.Command. If not, MustHaveGoBuild calls t.Skip with an explanation. 

### <a id="MustHaveGoRun" href="#MustHaveGoRun">func MustHaveGoRun(t testing.TB)</a>

```
searchKey: testenv.MustHaveGoRun
tags: [function]
```

```Go
func MustHaveGoRun(t testing.TB)
```

MustHaveGoRun checks that the current system can run programs with `go run.' If not, MustHaveGoRun calls t.Skip with an explanation. 

### <a id="MustHaveLink" href="#MustHaveLink">func MustHaveLink(t testing.TB)</a>

```
searchKey: testenv.MustHaveLink
tags: [function]
```

```Go
func MustHaveLink(t testing.TB)
```

MustHaveLink reports whether the current system can use os.Link. If not, MustHaveLink calls t.Skip with an explanation. 

### <a id="MustHaveSymlink" href="#MustHaveSymlink">func MustHaveSymlink(t testing.TB)</a>

```
searchKey: testenv.MustHaveSymlink
tags: [function]
```

```Go
func MustHaveSymlink(t testing.TB)
```

MustHaveSymlink reports whether the current system can use os.Symlink. If not, MustHaveSymlink calls t.Skip with an explanation. 

### <a id="MustInternalLink" href="#MustInternalLink">func MustInternalLink(t testing.TB)</a>

```
searchKey: testenv.MustInternalLink
tags: [function]
```

```Go
func MustInternalLink(t testing.TB)
```

MustInternalLink checks that the current system can link programs with internal linking. If not, MustInternalLink calls t.Skip with an explanation. 

### <a id="SkipFlaky" href="#SkipFlaky">func SkipFlaky(t testing.TB, issue int)</a>

```
searchKey: testenv.SkipFlaky
tags: [function]
```

```Go
func SkipFlaky(t testing.TB, issue int)
```

### <a id="SkipFlakyNet" href="#SkipFlakyNet">func SkipFlakyNet(t testing.TB)</a>

```
searchKey: testenv.SkipFlakyNet
tags: [function]
```

```Go
func SkipFlakyNet(t testing.TB)
```

### <a id="SkipIfShortAndSlow" href="#SkipIfShortAndSlow">func SkipIfShortAndSlow(t testing.TB)</a>

```
searchKey: testenv.SkipIfShortAndSlow
tags: [function]
```

```Go
func SkipIfShortAndSlow(t testing.TB)
```

SkipIfShortAndSlow skips t if -short is set and the CPU running the test is suspected to be slow. 

(This is useful for CPU-intensive tests that otherwise complete quickly.) 

### <a id="hasSymlink" href="#hasSymlink">func hasSymlink() (ok bool, reason string)</a>

```
searchKey: testenv.hasSymlink
tags: [function private]
```

```Go
func hasSymlink() (ok bool, reason string)
```

### <a id="init.testenv_cgo.go" href="#init.testenv_cgo.go">func init()</a>

```
searchKey: testenv.init
tags: [function private]
```

```Go
func init()
```

