# Package pprof

Package pprof serves via its HTTP server runtime profiling data in the format expected by the pprof visualization tool. 

The package is typically only imported for the side effect of registering its HTTP handlers. The handled paths all begin with /debug/pprof/. 

To use pprof, link this package into your program: 

```
import _ "net/http/pprof"

```
If your application is not already running an http server, you need to start one. Add "net/http" and "log" to your imports and the following code to your main function: 

```
go func() {
	log.Println(http.ListenAndServe("localhost:6060", nil))
}()

```
If you are not using DefaultServeMux, you will have to register handlers with the mux you are using. 

Then use the pprof tool to look at the heap profile: 

```
go tool pprof [http://localhost:6060/debug/pprof/heap](http://localhost:6060/debug/pprof/heap)

```
Or to look at a 30-second CPU profile: 

```
go tool pprof [http://localhost:6060/debug/pprof/profile?seconds=30](http://localhost:6060/debug/pprof/profile?seconds=30)

```
Or to look at the goroutine blocking profile, after calling runtime.SetBlockProfileRate in your program: 

```
go tool pprof [http://localhost:6060/debug/pprof/block](http://localhost:6060/debug/pprof/block)

```
Or to look at the holders of contended mutexes, after calling runtime.SetMutexProfileFraction in your program: 

```
go tool pprof [http://localhost:6060/debug/pprof/mutex](http://localhost:6060/debug/pprof/mutex)

```
The package also exports a handler that serves execution trace data for the "go tool trace" command. To collect a 5-second execution trace: 

```
wget -O trace.out [http://localhost:6060/debug/pprof/trace?seconds=5](http://localhost:6060/debug/pprof/trace?seconds=5)
go tool trace trace.out

```
To view all available profiles, open [http://localhost:6060/debug/pprof/](http://localhost:6060/debug/pprof/) in your browser. 

For a study of the facility in action, visit 

```
[https://blog.golang.org/2011/06/profiling-go-programs.html](https://blog.golang.org/2011/06/profiling-go-programs.html)

```
## Index

* [Variables](#var)
    * [var Sink](#Sink)
    * [var profileDescriptions](#profileDescriptions)
    * [var profileSupportsDelta](#profileSupportsDelta)
    * [var srv](#srv)
* [Types](#type)
    * [type handler string](#handler)
        * [func (name handler) ServeHTTP(w http.ResponseWriter, r *http.Request)](#handler.ServeHTTP)
        * [func (name handler) serveDeltaProfile(w http.ResponseWriter, r *http.Request, p *pprof.Profile, secStr string)](#handler.serveDeltaProfile)
    * [type profileEntry struct](#profileEntry)
* [Functions](#func)
    * [func Cmdline(w http.ResponseWriter, r *http.Request)](#Cmdline)
    * [func Handler(name string) http.Handler](#Handler)
    * [func Index(w http.ResponseWriter, r *http.Request)](#Index)
    * [func Profile(w http.ResponseWriter, r *http.Request)](#Profile)
    * [func Symbol(w http.ResponseWriter, r *http.Request)](#Symbol)
    * [func TestDeltaProfile(t *testing.T)](#TestDeltaProfile)
    * [func TestDescriptions(t *testing.T)](#TestDescriptions)
    * [func TestHandlers(t *testing.T)](#TestHandlers)
    * [func Trace(w http.ResponseWriter, r *http.Request)](#Trace)
    * [func collectProfile(p *pprof.Profile) (*profile.Profile, error)](#collectProfile)
    * [func durationExceedsWriteTimeout(r *http.Request, seconds float64) bool](#durationExceedsWriteTimeout)
    * [func indexTmplExecute(w io.Writer, profiles []profileEntry) error](#indexTmplExecute)
    * [func init()](#init.pprof.go)
    * [func mutexHog(duration time.Duration, hogger func(mu1, mu2 *sync.Mutex, start time.Time, dt time.Duration))](#mutexHog)
    * [func mutexHog1(mu1, mu2 *sync.Mutex, start time.Time, dt time.Duration)](#mutexHog1)
    * [func mutexHog2(mu1, mu2 *sync.Mutex, start time.Time, dt time.Duration)](#mutexHog2)
    * [func query(endpoint string) (*profile.Profile, error)](#query)
    * [func seen(p *profile.Profile, fname string) bool](#seen)
    * [func serveError(w http.ResponseWriter, status int, txt string)](#serveError)
    * [func sleep(r *http.Request, d time.Duration)](#sleep)


## <a id="var" href="#var">Variables</a>

### <a id="Sink" href="#Sink">var Sink</a>

```
searchKey: pprof.Sink
tags: [variable number private]
```

```Go
var Sink uint32
```

### <a id="profileDescriptions" href="#profileDescriptions">var profileDescriptions</a>

```
searchKey: pprof.profileDescriptions
tags: [variable object private]
```

```Go
var profileDescriptions = ...
```

### <a id="profileSupportsDelta" href="#profileSupportsDelta">var profileSupportsDelta</a>

```
searchKey: pprof.profileSupportsDelta
tags: [variable object private]
```

```Go
var profileSupportsDelta = ...
```

### <a id="srv" href="#srv">var srv</a>

```
searchKey: pprof.srv
tags: [variable struct private]
```

```Go
var srv = httptest.NewServer(nil)
```

## <a id="type" href="#type">Types</a>

### <a id="handler" href="#handler">type handler string</a>

```
searchKey: pprof.handler
tags: [string private]
```

```Go
type handler string
```

#### <a id="handler.ServeHTTP" href="#handler.ServeHTTP">func (name handler) ServeHTTP(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: pprof.handler.ServeHTTP
tags: [method private]
```

```Go
func (name handler) ServeHTTP(w http.ResponseWriter, r *http.Request)
```

#### <a id="handler.serveDeltaProfile" href="#handler.serveDeltaProfile">func (name handler) serveDeltaProfile(w http.ResponseWriter, r *http.Request, p *pprof.Profile, secStr string)</a>

```
searchKey: pprof.handler.serveDeltaProfile
tags: [method private]
```

```Go
func (name handler) serveDeltaProfile(w http.ResponseWriter, r *http.Request, p *pprof.Profile, secStr string)
```

### <a id="profileEntry" href="#profileEntry">type profileEntry struct</a>

```
searchKey: pprof.profileEntry
tags: [struct private]
```

```Go
type profileEntry struct {
	Name  string
	Href  string
	Desc  string
	Count int
}
```

## <a id="func" href="#func">Functions</a>

### <a id="Cmdline" href="#Cmdline">func Cmdline(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: pprof.Cmdline
tags: [function]
```

```Go
func Cmdline(w http.ResponseWriter, r *http.Request)
```

Cmdline responds with the running program's command line, with arguments separated by NUL bytes. The package initialization registers it as /debug/pprof/cmdline. 

### <a id="Handler" href="#Handler">func Handler(name string) http.Handler</a>

```
searchKey: pprof.Handler
tags: [function]
```

```Go
func Handler(name string) http.Handler
```

Handler returns an HTTP handler that serves the named profile. 

### <a id="Index" href="#Index">func Index(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: pprof.Index
tags: [function]
```

```Go
func Index(w http.ResponseWriter, r *http.Request)
```

Index responds with the pprof-formatted profile named by the request. For example, "/debug/pprof/heap" serves the "heap" profile. Index responds to a request for "/debug/pprof/" with an HTML page listing the available profiles. 

### <a id="Profile" href="#Profile">func Profile(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: pprof.Profile
tags: [function]
```

```Go
func Profile(w http.ResponseWriter, r *http.Request)
```

Profile responds with the pprof-formatted cpu profile. Profiling lasts for duration specified in seconds GET parameter, or for 30 seconds if not specified. The package initialization registers it as /debug/pprof/profile. 

### <a id="Symbol" href="#Symbol">func Symbol(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: pprof.Symbol
tags: [function]
```

```Go
func Symbol(w http.ResponseWriter, r *http.Request)
```

Symbol looks up the program counters listed in the request, responding with a table mapping program counters to function names. The package initialization registers it as /debug/pprof/symbol. 

### <a id="TestDeltaProfile" href="#TestDeltaProfile">func TestDeltaProfile(t *testing.T)</a>

```
searchKey: pprof.TestDeltaProfile
tags: [function private test]
```

```Go
func TestDeltaProfile(t *testing.T)
```

### <a id="TestDescriptions" href="#TestDescriptions">func TestDescriptions(t *testing.T)</a>

```
searchKey: pprof.TestDescriptions
tags: [function private test]
```

```Go
func TestDescriptions(t *testing.T)
```

TestDescriptions checks that the profile names under runtime/pprof package have a key in the description map. 

### <a id="TestHandlers" href="#TestHandlers">func TestHandlers(t *testing.T)</a>

```
searchKey: pprof.TestHandlers
tags: [function private test]
```

```Go
func TestHandlers(t *testing.T)
```

### <a id="Trace" href="#Trace">func Trace(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: pprof.Trace
tags: [function]
```

```Go
func Trace(w http.ResponseWriter, r *http.Request)
```

Trace responds with the execution trace in binary form. Tracing lasts for duration specified in seconds GET parameter, or for 1 second if not specified. The package initialization registers it as /debug/pprof/trace. 

### <a id="collectProfile" href="#collectProfile">func collectProfile(p *pprof.Profile) (*profile.Profile, error)</a>

```
searchKey: pprof.collectProfile
tags: [function private]
```

```Go
func collectProfile(p *pprof.Profile) (*profile.Profile, error)
```

### <a id="durationExceedsWriteTimeout" href="#durationExceedsWriteTimeout">func durationExceedsWriteTimeout(r *http.Request, seconds float64) bool</a>

```
searchKey: pprof.durationExceedsWriteTimeout
tags: [function private]
```

```Go
func durationExceedsWriteTimeout(r *http.Request, seconds float64) bool
```

### <a id="indexTmplExecute" href="#indexTmplExecute">func indexTmplExecute(w io.Writer, profiles []profileEntry) error</a>

```
searchKey: pprof.indexTmplExecute
tags: [function private]
```

```Go
func indexTmplExecute(w io.Writer, profiles []profileEntry) error
```

### <a id="init.pprof.go" href="#init.pprof.go">func init()</a>

```
searchKey: pprof.init
tags: [function private]
```

```Go
func init()
```

### <a id="mutexHog" href="#mutexHog">func mutexHog(duration time.Duration, hogger func(mu1, mu2 *sync.Mutex, start time.Time, dt time.Duration))</a>

```
searchKey: pprof.mutexHog
tags: [function private]
```

```Go
func mutexHog(duration time.Duration, hogger func(mu1, mu2 *sync.Mutex, start time.Time, dt time.Duration))
```

mutexHog starts multiple goroutines that runs the given hogger function for the specified duration. The hogger function will be given two mutexes to lock & unlock. 

### <a id="mutexHog1" href="#mutexHog1">func mutexHog1(mu1, mu2 *sync.Mutex, start time.Time, dt time.Duration)</a>

```
searchKey: pprof.mutexHog1
tags: [function private]
```

```Go
func mutexHog1(mu1, mu2 *sync.Mutex, start time.Time, dt time.Duration)
```

### <a id="mutexHog2" href="#mutexHog2">func mutexHog2(mu1, mu2 *sync.Mutex, start time.Time, dt time.Duration)</a>

```
searchKey: pprof.mutexHog2
tags: [function private]
```

```Go
func mutexHog2(mu1, mu2 *sync.Mutex, start time.Time, dt time.Duration)
```

mutexHog2 is almost identical to mutexHog but we keep them separate in order to distinguish them with function names in the stack trace. We make them slightly different, using Sink, because otherwise gccgo -c opt will merge them. 

### <a id="query" href="#query">func query(endpoint string) (*profile.Profile, error)</a>

```
searchKey: pprof.query
tags: [function private]
```

```Go
func query(endpoint string) (*profile.Profile, error)
```

### <a id="seen" href="#seen">func seen(p *profile.Profile, fname string) bool</a>

```
searchKey: pprof.seen
tags: [function private]
```

```Go
func seen(p *profile.Profile, fname string) bool
```

seen returns true if the profile includes samples whose stacks include the specified function name (fname). 

### <a id="serveError" href="#serveError">func serveError(w http.ResponseWriter, status int, txt string)</a>

```
searchKey: pprof.serveError
tags: [function private]
```

```Go
func serveError(w http.ResponseWriter, status int, txt string)
```

### <a id="sleep" href="#sleep">func sleep(r *http.Request, d time.Duration)</a>

```
searchKey: pprof.sleep
tags: [function private]
```

```Go
func sleep(r *http.Request, d time.Duration)
```

