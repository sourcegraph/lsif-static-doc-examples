# Package siteid

Package siteid provides access to the site ID, a stable identifier for the current Sourcegraph site. 

All servers that are part of the same logical Sourcegraph site have the same site ID (although it is possible for an admin to misconfigure the servers so that this is not true). 

The "site ID" was formerly known as the "app ID". 

## Index

* [Variables](#var)
    * [var inited](#inited)
    * [var siteID](#siteID)
    * [var fatalln](#fatalln)
* [Functions](#func)
    * [func Init()](#Init)
    * [func Get() string](#Get)
    * [func TestNotInited(t *testing.T)](#TestNotInited)
    * [func TestGet(t *testing.T)](#TestGet)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="inited" href="#inited">var inited</a>

```
searchKey: siteid.inited
tags: [private]
```

```Go
var inited bool
```

### <a id="siteID" href="#siteID">var siteID</a>

```
searchKey: siteid.siteID
tags: [private]
```

```Go
var siteID string
```

### <a id="fatalln" href="#fatalln">var fatalln</a>

```
searchKey: siteid.fatalln
tags: [private]
```

```Go
var fatalln = log.Fatalln // overridden in tests

```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Init" href="#Init">func Init()</a>

```
searchKey: siteid.Init
```

```Go
func Init()
```

Init reads (or generates) the site ID. This func must be called exactly once before Get can be called. 

### <a id="Get" href="#Get">func Get() string</a>

```
searchKey: siteid.Get
```

```Go
func Get() string
```

Get returns the site ID. 

Get may only be called after Init has been called. 

### <a id="TestNotInited" href="#TestNotInited">func TestNotInited(t *testing.T)</a>

```
searchKey: siteid.TestNotInited
tags: [private]
```

```Go
func TestNotInited(t *testing.T)
```

### <a id="TestGet" href="#TestGet">func TestGet(t *testing.T)</a>

```
searchKey: siteid.TestGet
tags: [private]
```

```Go
func TestGet(t *testing.T)
```

