# Package buildcfg

Package buildcfg provides access to the build configuration described by the current environment. It is for use by build tools such as cmd/go or cmd/compile and for setting up go/build's Default context. 

Note that it does NOT provide access to the build configuration used to build the currently-running binary. For that, use runtime.GOOS etc as well as internal/goexperiment. 

## Index

* [Variables](#var)
    * [var defaultGOROOT](#defaultGOROOT)
    * [var GOROOT](#GOROOT)
    * [var GOARCH](#GOARCH)
    * [var GOOS](#GOOS)
    * [var GO386](#GO386)
    * [var GOARM](#GOARM)
    * [var GOMIPS](#GOMIPS)
    * [var GOMIPS64](#GOMIPS64)
    * [var GOPPC64](#GOPPC64)
    * [var GOWASM](#GOWASM)
    * [var GO_LDSO](#GO_LDSO)
    * [var Version](#Version)
    * [var Error](#Error)
    * [var Experiment](#Experiment)
    * [var regabiSupported](#regabiSupported)
    * [var experimentBaseline](#experimentBaseline)
    * [var FramePointerEnabled](#FramePointerEnabled)
* [Types](#type)
    * [type gowasmFeatures struct](#gowasmFeatures)
        * [func gowasm() (f gowasmFeatures)](#gowasm)
        * [func (f gowasmFeatures) String() string](#gowasmFeatures.String)
* [Functions](#func)
    * [func Check()](#Check)
    * [func envOr(key, value string) string](#envOr)
    * [func goarm() int](#goarm)
    * [func gomips() string](#gomips)
    * [func gomips64() string](#gomips64)
    * [func goppc64() int](#goppc64)
    * [func Getgoextlinkenabled() string](#Getgoextlinkenabled)
    * [func parseExperiments() goexperiment.Flags](#parseExperiments)
    * [func expList(exp, base *goexperiment.Flags, all bool) []string](#expList)
    * [func GOEXPERIMENT() string](#GOEXPERIMENT)
    * [func EnabledExperiments() []string](#EnabledExperiments)
    * [func AllExperiments() []string](#AllExperiments)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="defaultGOROOT" href="#defaultGOROOT">var defaultGOROOT</a>

```
searchKey: buildcfg.defaultGOROOT
tags: [private]
```

```Go
var defaultGOROOT string // set by linker

```

### <a id="GOROOT" href="#GOROOT">var GOROOT</a>

```
searchKey: buildcfg.GOROOT
```

```Go
var GOROOT = envOr("GOROOT", defaultGOROOT)
```

### <a id="GOARCH" href="#GOARCH">var GOARCH</a>

```
searchKey: buildcfg.GOARCH
```

```Go
var GOARCH = envOr("GOARCH", defaultGOARCH)
```

### <a id="GOOS" href="#GOOS">var GOOS</a>

```
searchKey: buildcfg.GOOS
```

```Go
var GOOS = envOr("GOOS", defaultGOOS)
```

### <a id="GO386" href="#GO386">var GO386</a>

```
searchKey: buildcfg.GO386
```

```Go
var GO386 = envOr("GO386", defaultGO386)
```

### <a id="GOARM" href="#GOARM">var GOARM</a>

```
searchKey: buildcfg.GOARM
```

```Go
var GOARM = goarm()
```

### <a id="GOMIPS" href="#GOMIPS">var GOMIPS</a>

```
searchKey: buildcfg.GOMIPS
```

```Go
var GOMIPS = gomips()
```

### <a id="GOMIPS64" href="#GOMIPS64">var GOMIPS64</a>

```
searchKey: buildcfg.GOMIPS64
```

```Go
var GOMIPS64 = gomips64()
```

### <a id="GOPPC64" href="#GOPPC64">var GOPPC64</a>

```
searchKey: buildcfg.GOPPC64
```

```Go
var GOPPC64 = goppc64()
```

### <a id="GOWASM" href="#GOWASM">var GOWASM</a>

```
searchKey: buildcfg.GOWASM
```

```Go
var GOWASM = gowasm()
```

### <a id="GO_LDSO" href="#GO_LDSO">var GO_LDSO</a>

```
searchKey: buildcfg.GO_LDSO
```

```Go
var GO_LDSO = defaultGO_LDSO
```

### <a id="Version" href="#Version">var Version</a>

```
searchKey: buildcfg.Version
```

```Go
var Version = version
```

### <a id="Error" href="#Error">var Error</a>

```
searchKey: buildcfg.Error
```

```Go
var Error error
```

Error is one of the errors found (if any) in the build configuration. 

### <a id="Experiment" href="#Experiment">var Experiment</a>

```
searchKey: buildcfg.Experiment
```

```Go
var Experiment goexperiment.Flags = parseExperiments()
```

Experiment contains the toolchain experiments enabled for the current build. 

(This is not necessarily the set of experiments the compiler itself was built with.) 

### <a id="regabiSupported" href="#regabiSupported">var regabiSupported</a>

```
searchKey: buildcfg.regabiSupported
tags: [private]
```

```Go
var regabiSupported = ...
```

### <a id="experimentBaseline" href="#experimentBaseline">var experimentBaseline</a>

```
searchKey: buildcfg.experimentBaseline
tags: [private]
```

```Go
var experimentBaseline = ...
```

experimentBaseline specifies the experiment flags that are enabled by default in the current toolchain. This is, in effect, the "control" configuration and any variation from this is an experiment. 

### <a id="FramePointerEnabled" href="#FramePointerEnabled">var FramePointerEnabled</a>

```
searchKey: buildcfg.FramePointerEnabled
```

```Go
var FramePointerEnabled = GOARCH == "amd64" || GOARCH == "arm64"
```

FramePointerEnabled enables the use of platform conventions for saving frame pointers. 

This used to be an experiment, but now it's always enabled on platforms that support it. 

Note: must agree with runtime.framepointer_enabled. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="gowasmFeatures" href="#gowasmFeatures">type gowasmFeatures struct</a>

```
searchKey: buildcfg.gowasmFeatures
tags: [private]
```

```Go
type gowasmFeatures struct {
	SignExt bool
	SatConv bool
}
```

#### <a id="gowasm" href="#gowasm">func gowasm() (f gowasmFeatures)</a>

```
searchKey: buildcfg.gowasm
tags: [private]
```

```Go
func gowasm() (f gowasmFeatures)
```

#### <a id="gowasmFeatures.String" href="#gowasmFeatures.String">func (f gowasmFeatures) String() string</a>

```
searchKey: buildcfg.gowasmFeatures.String
tags: [private]
```

```Go
func (f gowasmFeatures) String() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Check" href="#Check">func Check()</a>

```
searchKey: buildcfg.Check
```

```Go
func Check()
```

Check exits the program with a fatal error if Error is non-nil. 

### <a id="envOr" href="#envOr">func envOr(key, value string) string</a>

```
searchKey: buildcfg.envOr
tags: [private]
```

```Go
func envOr(key, value string) string
```

### <a id="goarm" href="#goarm">func goarm() int</a>

```
searchKey: buildcfg.goarm
tags: [private]
```

```Go
func goarm() int
```

### <a id="gomips" href="#gomips">func gomips() string</a>

```
searchKey: buildcfg.gomips
tags: [private]
```

```Go
func gomips() string
```

### <a id="gomips64" href="#gomips64">func gomips64() string</a>

```
searchKey: buildcfg.gomips64
tags: [private]
```

```Go
func gomips64() string
```

### <a id="goppc64" href="#goppc64">func goppc64() int</a>

```
searchKey: buildcfg.goppc64
tags: [private]
```

```Go
func goppc64() int
```

### <a id="Getgoextlinkenabled" href="#Getgoextlinkenabled">func Getgoextlinkenabled() string</a>

```
searchKey: buildcfg.Getgoextlinkenabled
```

```Go
func Getgoextlinkenabled() string
```

### <a id="parseExperiments" href="#parseExperiments">func parseExperiments() goexperiment.Flags</a>

```
searchKey: buildcfg.parseExperiments
tags: [private]
```

```Go
func parseExperiments() goexperiment.Flags
```

### <a id="expList" href="#expList">func expList(exp, base *goexperiment.Flags, all bool) []string</a>

```
searchKey: buildcfg.expList
tags: [private]
```

```Go
func expList(exp, base *goexperiment.Flags, all bool) []string
```

expList returns the list of lower-cased experiment names for experiments that differ from base. base may be nil to indicate no experiments. If all is true, then include all experiment flags, regardless of base. 

### <a id="GOEXPERIMENT" href="#GOEXPERIMENT">func GOEXPERIMENT() string</a>

```
searchKey: buildcfg.GOEXPERIMENT
```

```Go
func GOEXPERIMENT() string
```

GOEXPERIMENT is a comma-separated list of enabled or disabled experiments that differ from the baseline experiment configuration. GOEXPERIMENT is exactly what a user would set on the command line to get the set of enabled experiments. 

### <a id="EnabledExperiments" href="#EnabledExperiments">func EnabledExperiments() []string</a>

```
searchKey: buildcfg.EnabledExperiments
```

```Go
func EnabledExperiments() []string
```

EnabledExperiments returns a list of enabled experiments, as lower-cased experiment names. 

### <a id="AllExperiments" href="#AllExperiments">func AllExperiments() []string</a>

```
searchKey: buildcfg.AllExperiments
```

```Go
func AllExperiments() []string
```

AllExperiments returns a list of all experiment settings. Disabled experiments appear in the list prefixed by "no". 

