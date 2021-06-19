# Package envvar

Package envvar contains helpers for reading common environment variables. 

## Index

* [Variables](#var)
    * [var HTTPAddrInternal](#HTTPAddrInternal)
    * [var sourcegraphDotComMode](#sourcegraphDotComMode)
    * [var disableProfiler](#disableProfiler)
    * [var openGraphPreviewServiceURL](#openGraphPreviewServiceURL)
* [Functions](#func)
    * [func SourcegraphDotComMode() bool](#SourcegraphDotComMode)
    * [func MockSourcegraphDotComMode(value bool)](#MockSourcegraphDotComMode)
    * [func DisableProfiler() bool](#DisableProfiler)
    * [func OpenGraphPreviewServiceURL() string](#OpenGraphPreviewServiceURL)


## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="HTTPAddrInternal" href="#HTTPAddrInternal">var HTTPAddrInternal</a>

```
searchKey: envvar.HTTPAddrInternal
tags: [exported]
```

```Go
var HTTPAddrInternal = ...
```

### <a id="sourcegraphDotComMode" href="#sourcegraphDotComMode">var sourcegraphDotComMode</a>

```
searchKey: envvar.sourcegraphDotComMode
```

```Go
var sourcegraphDotComMode, _ = ...
```

### <a id="disableProfiler" href="#disableProfiler">var disableProfiler</a>

```
searchKey: envvar.disableProfiler
```

```Go
var disableProfiler, _ = ...
```

### <a id="openGraphPreviewServiceURL" href="#openGraphPreviewServiceURL">var openGraphPreviewServiceURL</a>

```
searchKey: envvar.openGraphPreviewServiceURL
```

```Go
var openGraphPreviewServiceURL = ...
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="SourcegraphDotComMode" href="#SourcegraphDotComMode">func SourcegraphDotComMode() bool</a>

```
searchKey: envvar.SourcegraphDotComMode
tags: [exported]
```

```Go
func SourcegraphDotComMode() bool
```

SourcegraphDotComMode is true if this server is running Sourcegraph.com (solely by checking the SOURCEGRAPHDOTCOM_MODE env var). Sourcegraph.com shows additional marketing and sets up some additional redirects. 

### <a id="MockSourcegraphDotComMode" href="#MockSourcegraphDotComMode">func MockSourcegraphDotComMode(value bool)</a>

```
searchKey: envvar.MockSourcegraphDotComMode
tags: [exported]
```

```Go
func MockSourcegraphDotComMode(value bool)
```

MockSourcegraphDotComMode is used by tests to mock the result of SourcegraphDotComMode. 

### <a id="DisableProfiler" href="#DisableProfiler">func DisableProfiler() bool</a>

```
searchKey: envvar.DisableProfiler
tags: [exported]
```

```Go
func DisableProfiler() bool
```

### <a id="OpenGraphPreviewServiceURL" href="#OpenGraphPreviewServiceURL">func OpenGraphPreviewServiceURL() string</a>

```
searchKey: envvar.OpenGraphPreviewServiceURL
tags: [exported]
```

```Go
func OpenGraphPreviewServiceURL() string
```

