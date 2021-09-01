# Package ot

Package ot wraps github.com/opentracing/opentracing-go and github.com./opentracing-contrib/go-stdlib with selective tracing behavior that is toggled on and off with the presence of a context item (uses context.Context). This context item is propagated across API boundaries through a HTTP header (X-Sourcegraph-Should-Trace). 

## Index

* [Constants](#const)
    * [const TraceAll](#TraceAll)
    * [const TraceNone](#TraceNone)
    * [const TraceSelective](#TraceSelective)
    * [const shouldTraceKey](#shouldTraceKey)
    * [const traceHeader](#traceHeader)
    * [const traceQuery](#traceQuery)
* [Variables](#var)
    * [var trPolicy](#trPolicy)
* [Types](#type)
    * [type Transport struct](#Transport)
        * [func (r *Transport) RoundTrip(req *http.Request) (*http.Response, error)](#Transport.RoundTrip)
    * [type key int](#key)
    * [type tracePolicy string](#tracePolicy)
        * [func GetTracePolicy() tracePolicy](#GetTracePolicy)
* [Functions](#func)
    * [func GetTracer(ctx context.Context) opentracing.Tracer](#GetTracer)
    * [func Middleware(h http.Handler, opts ...nethttp.MWOption) http.Handler](#Middleware)
    * [func MiddlewareWithTracer(tr opentracing.Tracer, h http.Handler, opts ...nethttp.MWOption) http.Handler](#MiddlewareWithTracer)
    * [func SetTracePolicy(newTracePolicy tracePolicy)](#SetTracePolicy)
    * [func ShouldTrace(ctx context.Context) bool](#ShouldTrace)
    * [func StartSpanFromContext(ctx context.Context, operationName string, opts ...opentracing.StartSpanOption) (opentracing.Span, context.Context)](#StartSpanFromContext)
    * [func StartSpanFromContextWithTracer(ctx context.Context, tracer opentracing.Tracer, operationName string, opts ...opentracing.StartSpanOption) (opentracing.Span, context.Context)](#StartSpanFromContextWithTracer)
    * [func WithShouldTrace(ctx context.Context, shouldTrace bool) context.Context](#WithShouldTrace)
    * [func getTracer(ctx context.Context, tracer opentracing.Tracer) opentracing.Tracer](#getTracer)
    * [func requestWantsTracing(r *http.Request) bool](#requestWantsTracing)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="TraceAll" href="#TraceAll">const TraceAll</a>

```
searchKey: ot.TraceAll
tags: [constant string]
```

```Go
const TraceAll tracePolicy = "all"
```

Comprehensive turns on tracing for all requests. 

### <a id="TraceNone" href="#TraceNone">const TraceNone</a>

```
searchKey: ot.TraceNone
tags: [constant string]
```

```Go
const TraceNone tracePolicy = "none"
```

TraceNone turns off tracing. 

### <a id="TraceSelective" href="#TraceSelective">const TraceSelective</a>

```
searchKey: ot.TraceSelective
tags: [constant string]
```

```Go
const TraceSelective tracePolicy = "selective"
```

TraceSelective turns on tracing only for requests with the X-Sourcegraph-Should-Trace header set to a truthy value. 

### <a id="shouldTraceKey" href="#shouldTraceKey">const shouldTraceKey</a>

```
searchKey: ot.shouldTraceKey
tags: [constant number private]
```

```Go
const shouldTraceKey key = iota
```

### <a id="traceHeader" href="#traceHeader">const traceHeader</a>

```
searchKey: ot.traceHeader
tags: [constant string private]
```

```Go
const traceHeader = "X-Sourcegraph-Should-Trace"
```

### <a id="traceQuery" href="#traceQuery">const traceQuery</a>

```
searchKey: ot.traceQuery
tags: [constant string private]
```

```Go
const traceQuery = "trace"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="trPolicy" href="#trPolicy">var trPolicy</a>

```
searchKey: ot.trPolicy
tags: [variable struct private]
```

```Go
var trPolicy = atomic.NewString(string(TraceNone))
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Transport" href="#Transport">type Transport struct</a>

```
searchKey: ot.Transport
tags: [struct]
```

```Go
type Transport struct {
	http.RoundTripper
}
```

Transport wraps an underlying HTTP RoundTripper, injecting the X-Sourcegraph-Should-Trace header into outgoing requests whenever the shouldTraceKey context value is true. 

#### <a id="Transport.RoundTrip" href="#Transport.RoundTrip">func (r *Transport) RoundTrip(req *http.Request) (*http.Response, error)</a>

```
searchKey: ot.Transport.RoundTrip
tags: [method]
```

```Go
func (r *Transport) RoundTrip(req *http.Request) (*http.Response, error)
```

### <a id="key" href="#key">type key int</a>

```
searchKey: ot.key
tags: [number private]
```

```Go
type key int
```

### <a id="tracePolicy" href="#tracePolicy">type tracePolicy string</a>

```
searchKey: ot.tracePolicy
tags: [string private]
```

```Go
type tracePolicy string
```

#### <a id="GetTracePolicy" href="#GetTracePolicy">func GetTracePolicy() tracePolicy</a>

```
searchKey: ot.GetTracePolicy
tags: [function]
```

```Go
func GetTracePolicy() tracePolicy
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="GetTracer" href="#GetTracer">func GetTracer(ctx context.Context) opentracing.Tracer</a>

```
searchKey: ot.GetTracer
tags: [function]
```

```Go
func GetTracer(ctx context.Context) opentracing.Tracer
```

GetTracer returns the tracer to use for the given context. If ShouldTrace returns true, it returns the global tracer. Otherwise, it returns the NoopTracer. 

### <a id="Middleware" href="#Middleware">func Middleware(h http.Handler, opts ...nethttp.MWOption) http.Handler</a>

```
searchKey: ot.Middleware
tags: [function]
```

```Go
func Middleware(h http.Handler, opts ...nethttp.MWOption) http.Handler
```

Middleware wraps the handler with the following: 

- If the HTTP header, X-Sourcegraph-Should-Trace, is set to a truthy value, set the 

```
shouldTraceKey context.Context value to true

```
- github.com/opentracing-contrib/go-stdlib/nethttp.Middleware, which creates a new span to track 

```
the request handler from the global tracer.

```
### <a id="MiddlewareWithTracer" href="#MiddlewareWithTracer">func MiddlewareWithTracer(tr opentracing.Tracer, h http.Handler, opts ...nethttp.MWOption) http.Handler</a>

```
searchKey: ot.MiddlewareWithTracer
tags: [function]
```

```Go
func MiddlewareWithTracer(tr opentracing.Tracer, h http.Handler, opts ...nethttp.MWOption) http.Handler
```

MiddlewareWithTracer is like Middleware, but uses the specified tracer instead of the global tracer. 

### <a id="SetTracePolicy" href="#SetTracePolicy">func SetTracePolicy(newTracePolicy tracePolicy)</a>

```
searchKey: ot.SetTracePolicy
tags: [function]
```

```Go
func SetTracePolicy(newTracePolicy tracePolicy)
```

### <a id="ShouldTrace" href="#ShouldTrace">func ShouldTrace(ctx context.Context) bool</a>

```
searchKey: ot.ShouldTrace
tags: [function]
```

```Go
func ShouldTrace(ctx context.Context) bool
```

ShouldTrace returns true if the shouldTraceKey context value is true. 

### <a id="StartSpanFromContext" href="#StartSpanFromContext">func StartSpanFromContext(ctx context.Context, operationName string, opts ...opentracing.StartSpanOption) (opentracing.Span, context.Context)</a>

```
searchKey: ot.StartSpanFromContext
tags: [function]
```

```Go
func StartSpanFromContext(ctx context.Context, operationName string, opts ...opentracing.StartSpanOption) (opentracing.Span, context.Context)
```

StartSpanFromContext starts a span using the tracer returned by GetTracer. 

### <a id="StartSpanFromContextWithTracer" href="#StartSpanFromContextWithTracer">func StartSpanFromContextWithTracer(ctx context.Context, tracer opentracing.Tracer, operationName string, opts ...opentracing.StartSpanOption) (opentracing.Span, context.Context)</a>

```
searchKey: ot.StartSpanFromContextWithTracer
tags: [function]
```

```Go
func StartSpanFromContextWithTracer(ctx context.Context, tracer opentracing.Tracer, operationName string, opts ...opentracing.StartSpanOption) (opentracing.Span, context.Context)
```

StartSpanFromContext starts a span using the tracer returned by invoking getTracer with the passed-in tracer. 

### <a id="WithShouldTrace" href="#WithShouldTrace">func WithShouldTrace(ctx context.Context, shouldTrace bool) context.Context</a>

```
searchKey: ot.WithShouldTrace
tags: [function]
```

```Go
func WithShouldTrace(ctx context.Context, shouldTrace bool) context.Context
```

WithShouldTrace sets the shouldTraceKey context value. 

### <a id="getTracer" href="#getTracer">func getTracer(ctx context.Context, tracer opentracing.Tracer) opentracing.Tracer</a>

```
searchKey: ot.getTracer
tags: [function private]
```

```Go
func getTracer(ctx context.Context, tracer opentracing.Tracer) opentracing.Tracer
```

getTracer is like GetTracer, but accepts a tracer as an argument. If ShouldTrace returns false, it returns the NoopTracer. If it returns true and the passed-in tracer is not nil, it returns the passed-in tracer. Otherwise, it returns the global tracer. 

### <a id="requestWantsTracing" href="#requestWantsTracing">func requestWantsTracing(r *http.Request) bool</a>

```
searchKey: ot.requestWantsTracing
tags: [function private]
```

```Go
func requestWantsTracing(r *http.Request) bool
```

requestWantsTrace returns true if a request is opting into tracing either via our HTTP Header or our URL Query. 

