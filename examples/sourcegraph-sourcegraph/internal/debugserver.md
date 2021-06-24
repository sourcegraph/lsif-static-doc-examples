# Package debugserver

## Index

* [Variables](#var)
    * [var Services](#Services)
    * [var addr](#addr)
* [Types](#type)
    * [type Dumper interface](#Dumper)
    * [type Endpoint struct](#Endpoint)
    * [type Service struct](#Service)
* [Functions](#func)
    * [func NewServerRoutine(ready <-chan struct{}, extra ...Endpoint) goroutine.BackgroundRoutine](#NewServerRoutine)
    * [func expvarHandler(w http.ResponseWriter, r *http.Request)](#expvarHandler)
    * [func freeOSMemoryHandler(w http.ResponseWriter, r *http.Request)](#freeOSMemoryHandler)
    * [func gcHandler(w http.ResponseWriter, r *http.Request)](#gcHandler)
    * [func healthzHandler(w http.ResponseWriter, r *http.Request)](#healthzHandler)
    * [func init()](#init.debug.go)
    * [func readyHandler(ready <-chan struct{}) http.HandlerFunc](#readyHandler)
    * [func registerMetadataGauge()](#registerMetadataGauge)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="Services" href="#Services">var Services</a>

```
searchKey: debugserver.Services
tags: [variable array struct]
```

```Go
var Services []Service
```

Services is the list of registered services' debug addresses. Populated from SRC_PROF_MAP. 

### <a id="addr" href="#addr">var addr</a>

```
searchKey: debugserver.addr
tags: [variable string private]
```

```Go
var addr = env.Get("SRC_PROF_HTTP", ":6060", "net/http/pprof http bind address.")
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Dumper" href="#Dumper">type Dumper interface</a>

```
searchKey: debugserver.Dumper
tags: [interface]
```

```Go
type Dumper interface {
	// DebugDump returns a snapshot of the current state.
	DebugDump() interface{}
}
```

Dumper is a service which can dump its state for debugging. 

### <a id="Endpoint" href="#Endpoint">type Endpoint struct</a>

```
searchKey: debugserver.Endpoint
tags: [struct]
```

```Go
type Endpoint struct {
	// Name is the name shown on the index page for the endpoint
	Name string
	// Path is passed to http.Mux.Handle as the pattern.
	Path string
	// Handler is the debug handler
	Handler http.Handler
}
```

Endpoint is a handler for the debug server. It will be displayed on the debug index page. 

### <a id="Service" href="#Service">type Service struct</a>

```
searchKey: debugserver.Service
tags: [struct]
```

```Go
type Service struct {
	// Name of the service. Always the binary name. example: "gitserver"
	Name string

	// Host is the host:port for the services SRC_PROF_HTTP. example:
	// "127.0.0.1:6060"
	Host string

	// DefaultPath is the path to the service we should link to.
	DefaultPath string
}
```

Service is a service's debug addr (host:port). 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="NewServerRoutine" href="#NewServerRoutine">func NewServerRoutine(ready <-chan struct{}, extra ...Endpoint) goroutine.BackgroundRoutine</a>

```
searchKey: debugserver.NewServerRoutine
tags: [method]
```

```Go
func NewServerRoutine(ready <-chan struct{}, extra ...Endpoint) goroutine.BackgroundRoutine
```

NewServerRoutine returns a background routine that exposes pprof and metrics endpoints. The given channel should be closed once the ready endpoint should begin to return 200 OK. Any extra endpoints supplied will be registered via their own declared path. 

### <a id="expvarHandler" href="#expvarHandler">func expvarHandler(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: debugserver.expvarHandler
tags: [method private]
```

```Go
func expvarHandler(w http.ResponseWriter, r *http.Request)
```

expvarHandler is copied from package expvar and exported so that it can be mounted on any ServeMux, not just http.DefaultServeMux. 

### <a id="freeOSMemoryHandler" href="#freeOSMemoryHandler">func freeOSMemoryHandler(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: debugserver.freeOSMemoryHandler
tags: [method private]
```

```Go
func freeOSMemoryHandler(w http.ResponseWriter, r *http.Request)
```

### <a id="gcHandler" href="#gcHandler">func gcHandler(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: debugserver.gcHandler
tags: [method private]
```

```Go
func gcHandler(w http.ResponseWriter, r *http.Request)
```

### <a id="healthzHandler" href="#healthzHandler">func healthzHandler(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: debugserver.healthzHandler
tags: [method private]
```

```Go
func healthzHandler(w http.ResponseWriter, r *http.Request)
```

healthzHandler is the http.HandlerFunc that responds to /healthz requests on the debugserver port. This always returns a 200 OK while the binary can be reached. 

### <a id="init.debug.go" href="#init.debug.go">func init()</a>

```
searchKey: debugserver.init
tags: [function private]
```

```Go
func init()
```

### <a id="readyHandler" href="#readyHandler">func readyHandler(ready <-chan struct{}) http.HandlerFunc</a>

```
searchKey: debugserver.readyHandler
tags: [method private]
```

```Go
func readyHandler(ready <-chan struct{}) http.HandlerFunc
```

readyHandler returns an http.HandlerFunc that responds to the /ready requests on the debugserver port. This will return a 200 OK once the given channel is closed, and a 503 Service Unavailable otherwise. 

### <a id="registerMetadataGauge" href="#registerMetadataGauge">func registerMetadataGauge()</a>

```
searchKey: debugserver.registerMetadataGauge
tags: [function private]
```

```Go
func registerMetadataGauge()
```

