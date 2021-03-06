# Package envvar

Package envvar contains helpers for reading common environment variables. 

## Index

* [Variables](#var)
    * [var HTTPAddrInternal](#HTTPAddrInternal)
    * [var disableProfiler](#disableProfiler)
    * [var openGraphPreviewServiceURL](#openGraphPreviewServiceURL)
    * [var sourcegraphDotComMode](#sourcegraphDotComMode)
* [Functions](#func)
    * [func DisableProfiler() bool](#DisableProfiler)
    * [func MockSourcegraphDotComMode(value bool)](#MockSourcegraphDotComMode)
    * [func OpenGraphPreviewServiceURL() string](#OpenGraphPreviewServiceURL)
    * [func SourcegraphDotComMode() bool](#SourcegraphDotComMode)


## <a id="var" href="#var">Variables</a>

### <a id="HTTPAddrInternal" href="#HTTPAddrInternal">var HTTPAddrInternal</a>

```
searchKey: envvar.HTTPAddrInternal
tags: [variable string]
```

```Go
var HTTPAddrInternal = ...
```

### <a id="disableProfiler" href="#disableProfiler">var disableProfiler</a>

```
searchKey: envvar.disableProfiler
tags: [variable boolean private]
```

```Go
var disableProfiler, _ = ...
```

### <a id="openGraphPreviewServiceURL" href="#openGraphPreviewServiceURL">var openGraphPreviewServiceURL</a>

```
searchKey: envvar.openGraphPreviewServiceURL
tags: [variable string private]
```

```Go
var openGraphPreviewServiceURL = ...
```

### <a id="sourcegraphDotComMode" href="#sourcegraphDotComMode">var sourcegraphDotComMode</a>

```
searchKey: envvar.sourcegraphDotComMode
tags: [variable boolean private]
```

```Go
var sourcegraphDotComMode, _ = ...
```

## <a id="func" href="#func">Functions</a>

### <a id="DisableProfiler" href="#DisableProfiler">func DisableProfiler() bool</a>

```
searchKey: envvar.DisableProfiler
tags: [function]
```

```Go
func DisableProfiler() bool
```

### <a id="MockSourcegraphDotComMode" href="#MockSourcegraphDotComMode">func MockSourcegraphDotComMode(value bool)</a>

```
searchKey: envvar.MockSourcegraphDotComMode
tags: [function]
```

```Go
func MockSourcegraphDotComMode(value bool)
```

MockSourcegraphDotComMode is used by tests to mock the result of SourcegraphDotComMode. 

### <a id="OpenGraphPreviewServiceURL" href="#OpenGraphPreviewServiceURL">func OpenGraphPreviewServiceURL() string</a>

```
searchKey: envvar.OpenGraphPreviewServiceURL
tags: [function]
```

```Go
func OpenGraphPreviewServiceURL() string
```

### <a id="SourcegraphDotComMode" href="#SourcegraphDotComMode">func SourcegraphDotComMode() bool</a>

```
searchKey: envvar.SourcegraphDotComMode
tags: [function]
```

```Go
func SourcegraphDotComMode() bool
```

SourcegraphDotComMode is true if this server is running Sourcegraph.com (solely by checking the SOURCEGRAPHDOTCOM_MODE env var). Sourcegraph.com shows additional marketing and sets up some additional redirects. 

