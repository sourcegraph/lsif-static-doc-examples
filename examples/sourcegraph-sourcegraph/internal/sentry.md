# Package sentry

## Index

* [Variables](#var)
    * [var sentryDebug](#sentryDebug)
* [Functions](#func)
    * [func Init()](#Init)
    * [func captureError(err error, level sentry.Level, tags map[string]string)](#captureError)
    * [func CaptureError(err error, tags map[string]string)](#CaptureError)
    * [func CapturePanic(err error, tags map[string]string)](#CapturePanic)
    * [func Recoverer(handler http.Handler) http.Handler](#Recoverer)


## <a id="var" href="#var">Variables</a>

### <a id="sentryDebug" href="#sentryDebug">var sentryDebug</a>

```
searchKey: sentry.sentryDebug
```

```Go
var sentryDebug, _ = ...
```

## <a id="func" href="#func">Functions</a>

### <a id="Init" href="#Init">func Init()</a>

```
searchKey: sentry.Init
tags: [exported]
```

```Go
func Init()
```

Init initializes the default Sentry client that uses SENTRY_DSN_BACKEND environment variable as the DSN. It then watches site configuration for any subsequent changes. SENTRY_DEBUG can be set as a boolean to print debug messages. 

### <a id="captureError" href="#captureError">func captureError(err error, level sentry.Level, tags map[string]string)</a>

```
searchKey: sentry.captureError
```

```Go
func captureError(err error, level sentry.Level, tags map[string]string)
```

### <a id="CaptureError" href="#CaptureError">func CaptureError(err error, tags map[string]string)</a>

```
searchKey: sentry.CaptureError
tags: [exported]
```

```Go
func CaptureError(err error, tags map[string]string)
```

CaptureError adds the given error to the default Sentry client delivery queue for reporting. 

### <a id="CapturePanic" href="#CapturePanic">func CapturePanic(err error, tags map[string]string)</a>

```
searchKey: sentry.CapturePanic
tags: [exported]
```

```Go
func CapturePanic(err error, tags map[string]string)
```

CapturePanic does same thing as CaptureError, and adds additional tags to mark the report as "fatal" level. 

### <a id="Recoverer" href="#Recoverer">func Recoverer(handler http.Handler) http.Handler</a>

```
searchKey: sentry.Recoverer
tags: [exported]
```

```Go
func Recoverer(handler http.Handler) http.Handler
```

Recovery handler to wrap the stdlib net/http Mux. Example: 

```
 mux := http.NewServeMux
 ...
	http.Handle("/", sentry.Recoverer(mux))

```
