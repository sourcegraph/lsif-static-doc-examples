# Package httpserver

## Index

* [Types](#type)
    * [type server struct](#server)
        * [func (s *server) Start()](#server.Start)
        * [func (s *server) Stop()](#server.Stop)
* [Functions](#func)
    * [func NewHandler(setupRoutes func(router *mux.Router)) http.Handler](#NewHandler)
    * [func NewListener(addr string) (_ net.Listener, err error)](#NewListener)
    * [func SanitizeAddr(addr string) (string, error)](#SanitizeAddr)
    * [func New(listener net.Listener, httpServer *http.Server) goroutine.BackgroundRoutine](#New)
    * [func NewFromAddr(addr string, httpServer *http.Server) goroutine.BackgroundRoutine](#NewFromAddr)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="server" href="#server">type server struct</a>

```
searchKey: httpserver.server
tags: [private]
```

```Go
type server struct {
	server       *http.Server
	makeListener func() (net.Listener, error)
	once         sync.Once
}
```

#### <a id="server.Start" href="#server.Start">func (s *server) Start()</a>

```
searchKey: httpserver.server.Start
tags: [private]
```

```Go
func (s *server) Start()
```

#### <a id="server.Stop" href="#server.Stop">func (s *server) Stop()</a>

```
searchKey: httpserver.server.Stop
tags: [private]
```

```Go
func (s *server) Stop()
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="NewHandler" href="#NewHandler">func NewHandler(setupRoutes func(router *mux.Router)) http.Handler</a>

```
searchKey: httpserver.NewHandler
```

```Go
func NewHandler(setupRoutes func(router *mux.Router)) http.Handler
```

NewHandler creates an HTTP handler with a default /healthz endpoint. If a function is provided, it will be invoked with a router on which additional routes can be installed. 

### <a id="NewListener" href="#NewListener">func NewListener(addr string) (_ net.Listener, err error)</a>

```
searchKey: httpserver.NewListener
```

```Go
func NewListener(addr string) (_ net.Listener, err error)
```

NewListener returns a TCP listener accepting connections on the given address. 

### <a id="SanitizeAddr" href="#SanitizeAddr">func SanitizeAddr(addr string) (string, error)</a>

```
searchKey: httpserver.SanitizeAddr
```

```Go
func SanitizeAddr(addr string) (string, error)
```

SanitizeAddr replaces the host in the given address with 127.0.0.1 if no host is supplied or if running in insecure dev mode. 

### <a id="New" href="#New">func New(listener net.Listener, httpServer *http.Server) goroutine.BackgroundRoutine</a>

```
searchKey: httpserver.New
```

```Go
func New(listener net.Listener, httpServer *http.Server) goroutine.BackgroundRoutine
```

New returns a BackgroundRoutine that serves the given server on the given listener. 

### <a id="NewFromAddr" href="#NewFromAddr">func NewFromAddr(addr string, httpServer *http.Server) goroutine.BackgroundRoutine</a>

```
searchKey: httpserver.NewFromAddr
```

```Go
func NewFromAddr(addr string, httpServer *http.Server) goroutine.BackgroundRoutine
```

New returns a BackgroundRoutine that serves the given handler on the given address. 

