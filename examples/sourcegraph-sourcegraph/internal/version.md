# Package version

## Index

* Subpages
  * [internal/version/minversion](version/minversion.md)
* [Constants](#const)
    * [const devVersion](#devVersion)
* [Variables](#var)
    * [var devTimestamp](#devTimestamp)
    * [var version](#version)
    * [var timestamp](#timestamp)
* [Functions](#func)
    * [func init()](#init.version.go)
    * [func Version() string](#Version)
    * [func IsDev(version string) bool](#IsDev)
    * [func Mock(mockVersion string)](#Mock)
    * [func MockTimestamp(mockTimestamp string)](#MockTimestamp)
    * [func HowLongOutOfDate(now time.Time) (int, error)](#HowLongOutOfDate)
    * [func monthsFromDays(days float64) int](#monthsFromDays)
    * [func TestVersion(t *testing.T)](#TestVersion)
    * [func TestIsDev(t *testing.T)](#TestIsDev)
    * [func Test_monthsFromDays(t *testing.T)](#Test_monthsFromDays)
    * [func TestHowLongOutOfDate(t *testing.T)](#TestHowLongOutOfDate)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="devVersion" href="#devVersion">const devVersion</a>

```
searchKey: version.devVersion
tags: [private]
```

```Go
const devVersion = "0.0.0+dev" // version string for unreleased development builds

```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="devTimestamp" href="#devTimestamp">var devTimestamp</a>

```
searchKey: version.devTimestamp
tags: [private]
```

```Go
var devTimestamp // build timestamp for unreleased development builds
 = ...
```

### <a id="version" href="#version">var version</a>

```
searchKey: version.version
tags: [private]
```

```Go
var version = devVersion
```

version is configured at build time via ldflags like this: -ldflags "-X github.com/sourcegraph/sourcegraph/internal/version.version=1.2.3" 

The version may not be semver-compatible, e.g. `insiders` or `65769_2020-06-05_9bd91a3`. 

### <a id="timestamp" href="#timestamp">var timestamp</a>

```
searchKey: version.timestamp
tags: [private]
```

```Go
var timestamp = devTimestamp
```

timestamp is the build timestamp configured at build time via ldflags like this: -ldflags "-X github.com/sourcegraph/sourcegraph/internal/version.timestamp=$UNIX_SECONDS" 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="init.version.go" href="#init.version.go">func init()</a>

```
searchKey: version.init
tags: [private]
```

```Go
func init()
```

### <a id="Version" href="#Version">func Version() string</a>

```
searchKey: version.Version
```

```Go
func Version() string
```

Version returns the version string configured at build time. 

### <a id="IsDev" href="#IsDev">func IsDev(version string) bool</a>

```
searchKey: version.IsDev
```

```Go
func IsDev(version string) bool
```

IsDev reports whether the version string is an unreleased development build. 

### <a id="Mock" href="#Mock">func Mock(mockVersion string)</a>

```
searchKey: version.Mock
```

```Go
func Mock(mockVersion string)
```

Mock is used by tests to mock the result of Version and IsDev. 

### <a id="MockTimestamp" href="#MockTimestamp">func MockTimestamp(mockTimestamp string)</a>

```
searchKey: version.MockTimestamp
```

```Go
func MockTimestamp(mockTimestamp string)
```

MockTimeStamp is used by tests to mock the current build timestamp 

### <a id="HowLongOutOfDate" href="#HowLongOutOfDate">func HowLongOutOfDate(now time.Time) (int, error)</a>

```
searchKey: version.HowLongOutOfDate
```

```Go
func HowLongOutOfDate(now time.Time) (int, error)
```

HowLongOutOfDate returns a time in months since this build of Sourcegraph was created. It is based on a constant baked into the Go binary at build time. 

### <a id="monthsFromDays" href="#monthsFromDays">func monthsFromDays(days float64) int</a>

```
searchKey: version.monthsFromDays
tags: [private]
```

```Go
func monthsFromDays(days float64) int
```

monthsFromDays roughly determines the number of months given days 

### <a id="TestVersion" href="#TestVersion">func TestVersion(t *testing.T)</a>

```
searchKey: version.TestVersion
tags: [private]
```

```Go
func TestVersion(t *testing.T)
```

### <a id="TestIsDev" href="#TestIsDev">func TestIsDev(t *testing.T)</a>

```
searchKey: version.TestIsDev
tags: [private]
```

```Go
func TestIsDev(t *testing.T)
```

### <a id="Test_monthsFromDays" href="#Test_monthsFromDays">func Test_monthsFromDays(t *testing.T)</a>

```
searchKey: version.Test_monthsFromDays
tags: [private]
```

```Go
func Test_monthsFromDays(t *testing.T)
```

### <a id="TestHowLongOutOfDate" href="#TestHowLongOutOfDate">func TestHowLongOutOfDate(t *testing.T)</a>

```
searchKey: version.TestHowLongOutOfDate
tags: [private]
```

```Go
func TestHowLongOutOfDate(t *testing.T)
```

