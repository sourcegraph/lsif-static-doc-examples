# Package trace

## Index

* Subpages
  * [internal/trace/ot](trace/ot.md)
* [Constants](#const)
    * [const routeNameKey](#routeNameKey)
    * [const userKey](#userKey)
    * [const requestErrorCauseKey](#requestErrorCauseKey)
    * [const graphQLRequestNameKey](#graphQLRequestNameKey)
    * [const originKey](#originKey)
    * [const sourceKey](#sourceKey)
    * [const GraphQLQueryKey](#GraphQLQueryKey)
    * [const SourceBrowser](#SourceBrowser)
    * [const SourceOther](#SourceOther)
    * [const traceKey](#traceKey)
* [Variables](#var)
    * [var UserLatencyBuckets](#UserLatencyBuckets)
    * [var trackOrigin](#trackOrigin)
    * [var metricLabels](#metricLabels)
    * [var requestDuration](#requestDuration)
    * [var requestHeartbeat](#requestHeartbeat)
    * [var spanURL](#spanURL)
* [Types](#type)
    * [type key int](#key)
    * [type SourceType string](#SourceType)
        * [func RequestSource(ctx context.Context) SourceType](#RequestSource)
    * [type httpErr struct](#httpErr)
        * [func (e *httpErr) Error() string](#httpErr.Error)
    * [type Tracer struct](#Tracer)
        * [func (t Tracer) New(ctx context.Context, family, title string, tags ...Tag) (*Trace, context.Context)](#Tracer.New)
    * [type traceContextKey string](#traceContextKey)
    * [type Trace struct](#Trace)
        * [func New(ctx context.Context, family, title string, tags ...Tag) (*Trace, context.Context)](#New)
        * [func TraceFromContext(ctx context.Context) *Trace](#TraceFromContext)
        * [func (t *Trace) LazyPrintf(format string, a ...interface{})](#Trace.LazyPrintf)
        * [func (t *Trace) LogFields(fields ...log.Field)](#Trace.LogFields)
        * [func (t *Trace) SetError(err error)](#Trace.SetError)
        * [func (t *Trace) SetErrorIfNotContext(err error)](#Trace.SetErrorIfNotContext)
        * [func (t *Trace) Finish()](#Trace.Finish)
    * [type Tag struct](#Tag)
    * [type tagsOpt struct](#tagsOpt)
        * [func (t tagsOpt) Apply(o *opentracing.StartSpanOptions)](#tagsOpt.Apply)
    * [type fieldsStringer []log.Field](#fieldsStringer)
        * [func (fs fieldsStringer) String() string](#fieldsStringer.String)
    * [type encoder struct](#encoder)
        * [func (e *encoder) EmitString(key, value string)](#encoder.EmitString)
        * [func (e *encoder) EmitBool(key string, value bool)](#encoder.EmitBool)
        * [func (e *encoder) EmitInt(key string, value int)](#encoder.EmitInt)
        * [func (e *encoder) EmitInt32(key string, value int32)](#encoder.EmitInt32)
        * [func (e *encoder) EmitInt64(key string, value int64)](#encoder.EmitInt64)
        * [func (e *encoder) EmitUint32(key string, value uint32)](#encoder.EmitUint32)
        * [func (e *encoder) EmitUint64(key string, value uint64)](#encoder.EmitUint64)
        * [func (e *encoder) EmitFloat32(key string, value float32)](#encoder.EmitFloat32)
        * [func (e *encoder) EmitFloat64(key string, value float64)](#encoder.EmitFloat64)
        * [func (e *encoder) EmitObject(key string, value interface{})](#encoder.EmitObject)
        * [func (e *encoder) EmitLazyLogger(value log.LazyLogger)](#encoder.EmitLazyLogger)
* [Functions](#func)
    * [func Init(shouldInitSentry bool)](#Init)
    * [func GraphQLRequestName(ctx context.Context) string](#GraphQLRequestName)
    * [func WithGraphQLRequestName(ctx context.Context, name string) context.Context](#WithGraphQLRequestName)
    * [func RequestOrigin(ctx context.Context) string](#RequestOrigin)
    * [func WithRequestOrigin(ctx context.Context, name string) context.Context](#WithRequestOrigin)
    * [func WithRequestSource(ctx context.Context, source SourceType) context.Context](#WithRequestSource)
    * [func HTTPTraceMiddleware(next http.Handler) http.Handler](#HTTPTraceMiddleware)
    * [func Route(next http.Handler) http.Handler](#Route)
    * [func User(ctx context.Context, userID int32)](#User)
    * [func SetRequestErrorCause(ctx context.Context, err error)](#SetRequestErrorCause)
    * [func SetRouteName(r *http.Request, routeName string)](#SetRouteName)
    * [func SpanURL(span opentracing.Span) string](#SpanURL)
    * [func SpanURLFromContext(ctx context.Context) string](#SpanURLFromContext)
    * [func SetSpanURLFunc(f func(span opentracing.Span) string)](#SetSpanURLFunc)
    * [func contextWithTrace(ctx context.Context, tr *Trace) context.Context](#contextWithTrace)
    * [func CopyContext(ctx context.Context, from context.Context) context.Context](#CopyContext)
    * [func Printf(key, f string, args ...interface{}) log.Field](#Printf)
    * [func Stringer(key string, v fmt.Stringer) log.Field](#Stringer)
    * [func SQL(q *sqlf.Query) log.Field](#SQL)
    * [func TestSpanURL(t *testing.T)](#TestSpanURL)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="routeNameKey" href="#routeNameKey">const routeNameKey</a>

```
searchKey: trace.routeNameKey
tags: [private]
```

```Go
const routeNameKey key = iota
```

### <a id="userKey" href="#userKey">const userKey</a>

```
searchKey: trace.userKey
tags: [private]
```

```Go
const userKey
```

### <a id="requestErrorCauseKey" href="#requestErrorCauseKey">const requestErrorCauseKey</a>

```
searchKey: trace.requestErrorCauseKey
tags: [private]
```

```Go
const requestErrorCauseKey
```

### <a id="graphQLRequestNameKey" href="#graphQLRequestNameKey">const graphQLRequestNameKey</a>

```
searchKey: trace.graphQLRequestNameKey
tags: [private]
```

```Go
const graphQLRequestNameKey
```

### <a id="originKey" href="#originKey">const originKey</a>

```
searchKey: trace.originKey
tags: [private]
```

```Go
const originKey
```

### <a id="sourceKey" href="#sourceKey">const sourceKey</a>

```
searchKey: trace.sourceKey
tags: [private]
```

```Go
const sourceKey
```

### <a id="GraphQLQueryKey" href="#GraphQLQueryKey">const GraphQLQueryKey</a>

```
searchKey: trace.GraphQLQueryKey
```

```Go
const GraphQLQueryKey
```

### <a id="SourceBrowser" href="#SourceBrowser">const SourceBrowser</a>

```
searchKey: trace.SourceBrowser
```

```Go
const SourceBrowser SourceType = "browser"
```

SourceBrowser indicates the request likely came from a web browser. 

### <a id="SourceOther" href="#SourceOther">const SourceOther</a>

```
searchKey: trace.SourceOther
```

```Go
const SourceOther SourceType = "other"
```

SourceOther indicates the request likely came from a non-browser HTTP client. 

### <a id="traceKey" href="#traceKey">const traceKey</a>

```
searchKey: trace.traceKey
tags: [private]
```

```Go
const traceKey = traceContextKey("trace")
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="UserLatencyBuckets" href="#UserLatencyBuckets">var UserLatencyBuckets</a>

```
searchKey: trace.UserLatencyBuckets
```

```Go
var UserLatencyBuckets = []float64{0.2, 0.5, 1, 2, 5, 10, 30}
```

UserLatencyBuckets is a recommended list of buckets for use in prometheus histograms when measuring latency to users. Motivation: longer than 30s we don't care about. 2 is a general SLA we have. Otherwise rest is somewhat evenly spreadout to get good data 

### <a id="trackOrigin" href="#trackOrigin">var trackOrigin</a>

```
searchKey: trace.trackOrigin
tags: [private]
```

```Go
var trackOrigin = "https://gitlab.com"
```

trackOrigin specifies a URL value. When an incoming request has the request header "Origin" set and the header value equals the `trackOrigin` value then the `requestDuration` metric (and other metrics downstream) gets labeled with this value for the "origin" label  (otherwise the metric is labeled with "unknown"). The tracked value can be changed with the METRICS_TRACK_ORIGIN environmental variable. 

### <a id="metricLabels" href="#metricLabels">var metricLabels</a>

```
searchKey: trace.metricLabels
tags: [private]
```

```Go
var metricLabels = []string{"route", "method", "code", "repo", "origin"}
```

### <a id="requestDuration" href="#requestDuration">var requestDuration</a>

```
searchKey: trace.requestDuration
tags: [private]
```

```Go
var requestDuration = ...
```

### <a id="requestHeartbeat" href="#requestHeartbeat">var requestHeartbeat</a>

```
searchKey: trace.requestHeartbeat
tags: [private]
```

```Go
var requestHeartbeat = ...
```

### <a id="spanURL" href="#spanURL">var spanURL</a>

```
searchKey: trace.spanURL
tags: [private]
```

```Go
var spanURL atomic.Value
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="key" href="#key">type key int</a>

```
searchKey: trace.key
tags: [private]
```

```Go
type key int
```

### <a id="SourceType" href="#SourceType">type SourceType string</a>

```
searchKey: trace.SourceType
```

```Go
type SourceType string
```

SourceType indicates the type of source that likely created the request. 

#### <a id="RequestSource" href="#RequestSource">func RequestSource(ctx context.Context) SourceType</a>

```
searchKey: trace.RequestSource
```

```Go
func RequestSource(ctx context.Context) SourceType
```

RequestSource returns the request source constant for a request context. 

### <a id="httpErr" href="#httpErr">type httpErr struct</a>

```
searchKey: trace.httpErr
tags: [private]
```

```Go
type httpErr struct {
	status int
	method string
	path   string
}
```

#### <a id="httpErr.Error" href="#httpErr.Error">func (e *httpErr) Error() string</a>

```
searchKey: trace.httpErr.Error
tags: [private]
```

```Go
func (e *httpErr) Error() string
```

### <a id="Tracer" href="#Tracer">type Tracer struct</a>

```
searchKey: trace.Tracer
```

```Go
type Tracer struct {
	Tracer opentracing.Tracer
}
```

A Tracer for trace creation, parameterised over an opentracing.Tracer. Use this if you don't want to use the global tracer. 

#### <a id="Tracer.New" href="#Tracer.New">func (t Tracer) New(ctx context.Context, family, title string, tags ...Tag) (*Trace, context.Context)</a>

```
searchKey: trace.Tracer.New
```

```Go
func (t Tracer) New(ctx context.Context, family, title string, tags ...Tag) (*Trace, context.Context)
```

New returns a new Trace with the specified family and title. 

### <a id="traceContextKey" href="#traceContextKey">type traceContextKey string</a>

```
searchKey: trace.traceContextKey
tags: [private]
```

```Go
type traceContextKey string
```

### <a id="Trace" href="#Trace">type Trace struct</a>

```
searchKey: trace.Trace
```

```Go
type Trace struct {
	trace  nettrace.Trace
	span   opentracing.Span
	family string
}
```

Trace is a combined version of golang.org/x/net/trace.Trace and opentracing.Span. Use New to construct one. 

#### <a id="New" href="#New">func New(ctx context.Context, family, title string, tags ...Tag) (*Trace, context.Context)</a>

```
searchKey: trace.New
```

```Go
func New(ctx context.Context, family, title string, tags ...Tag) (*Trace, context.Context)
```

New returns a new Trace with the specified family and title. 

#### <a id="TraceFromContext" href="#TraceFromContext">func TraceFromContext(ctx context.Context) *Trace</a>

```
searchKey: trace.TraceFromContext
```

```Go
func TraceFromContext(ctx context.Context) *Trace
```

TraceFromContext returns the Trace previously associated with ctx, or nil if no such Trace could be found. 

#### <a id="Trace.LazyPrintf" href="#Trace.LazyPrintf">func (t *Trace) LazyPrintf(format string, a ...interface{})</a>

```
searchKey: trace.Trace.LazyPrintf
```

```Go
func (t *Trace) LazyPrintf(format string, a ...interface{})
```

LazyPrintf evaluates its arguments with fmt.Sprintf each time the /debug/requests page is rendered. Any memory referenced by a will be pinned until the trace is finished and later discarded. 

#### <a id="Trace.LogFields" href="#Trace.LogFields">func (t *Trace) LogFields(fields ...log.Field)</a>

```
searchKey: trace.Trace.LogFields
```

```Go
func (t *Trace) LogFields(fields ...log.Field)
```

LogFields logs fields to the opentracing.Span as well as the nettrace.Trace. 

#### <a id="Trace.SetError" href="#Trace.SetError">func (t *Trace) SetError(err error)</a>

```
searchKey: trace.Trace.SetError
```

```Go
func (t *Trace) SetError(err error)
```

SetError declares that this trace and span resulted in an error. 

#### <a id="Trace.SetErrorIfNotContext" href="#Trace.SetErrorIfNotContext">func (t *Trace) SetErrorIfNotContext(err error)</a>

```
searchKey: trace.Trace.SetErrorIfNotContext
```

```Go
func (t *Trace) SetErrorIfNotContext(err error)
```

SetErrorIfNotContext calls SetError unless err is context.Canceled or context.DeadlineExceeded. 

#### <a id="Trace.Finish" href="#Trace.Finish">func (t *Trace) Finish()</a>

```
searchKey: trace.Trace.Finish
```

```Go
func (t *Trace) Finish()
```

Finish declares that this trace and span is complete. The trace should not be used after calling this method. 

### <a id="Tag" href="#Tag">type Tag struct</a>

```
searchKey: trace.Tag
```

```Go
type Tag struct {
	Key   string
	Value string
}
```

Tag may be passed when creating a new span. See [https://github.com/opentracing/specification/blob/master/semantic_conventions.md](https://github.com/opentracing/specification/blob/master/semantic_conventions.md) for common tags. 

### <a id="tagsOpt" href="#tagsOpt">type tagsOpt struct</a>

```
searchKey: trace.tagsOpt
tags: [private]
```

```Go
type tagsOpt struct {
	tags  []Tag
	title string
}
```

tagsOpt is an opentracing.StartSpanOption which applies all the tags 

#### <a id="tagsOpt.Apply" href="#tagsOpt.Apply">func (t tagsOpt) Apply(o *opentracing.StartSpanOptions)</a>

```
searchKey: trace.tagsOpt.Apply
tags: [private]
```

```Go
func (t tagsOpt) Apply(o *opentracing.StartSpanOptions)
```

Apply satisfies the StartSpanOption interface. 

### <a id="fieldsStringer" href="#fieldsStringer">type fieldsStringer []log.Field</a>

```
searchKey: trace.fieldsStringer
tags: [private]
```

```Go
type fieldsStringer []log.Field
```

fieldsStringer lazily marshals a slice of log.Field into a string for printing in net/trace. 

#### <a id="fieldsStringer.String" href="#fieldsStringer.String">func (fs fieldsStringer) String() string</a>

```
searchKey: trace.fieldsStringer.String
tags: [private]
```

```Go
func (fs fieldsStringer) String() string
```

### <a id="encoder" href="#encoder">type encoder struct</a>

```
searchKey: trace.encoder
tags: [private]
```

```Go
type encoder struct {
	strings.Builder
	prefixNewline bool
}
```

encoder is a log.Encoder used by fieldsStringer. 

#### <a id="encoder.EmitString" href="#encoder.EmitString">func (e *encoder) EmitString(key, value string)</a>

```
searchKey: trace.encoder.EmitString
tags: [private]
```

```Go
func (e *encoder) EmitString(key, value string)
```

#### <a id="encoder.EmitBool" href="#encoder.EmitBool">func (e *encoder) EmitBool(key string, value bool)</a>

```
searchKey: trace.encoder.EmitBool
tags: [private]
```

```Go
func (e *encoder) EmitBool(key string, value bool)
```

#### <a id="encoder.EmitInt" href="#encoder.EmitInt">func (e *encoder) EmitInt(key string, value int)</a>

```
searchKey: trace.encoder.EmitInt
tags: [private]
```

```Go
func (e *encoder) EmitInt(key string, value int)
```

#### <a id="encoder.EmitInt32" href="#encoder.EmitInt32">func (e *encoder) EmitInt32(key string, value int32)</a>

```
searchKey: trace.encoder.EmitInt32
tags: [private]
```

```Go
func (e *encoder) EmitInt32(key string, value int32)
```

#### <a id="encoder.EmitInt64" href="#encoder.EmitInt64">func (e *encoder) EmitInt64(key string, value int64)</a>

```
searchKey: trace.encoder.EmitInt64
tags: [private]
```

```Go
func (e *encoder) EmitInt64(key string, value int64)
```

#### <a id="encoder.EmitUint32" href="#encoder.EmitUint32">func (e *encoder) EmitUint32(key string, value uint32)</a>

```
searchKey: trace.encoder.EmitUint32
tags: [private]
```

```Go
func (e *encoder) EmitUint32(key string, value uint32)
```

#### <a id="encoder.EmitUint64" href="#encoder.EmitUint64">func (e *encoder) EmitUint64(key string, value uint64)</a>

```
searchKey: trace.encoder.EmitUint64
tags: [private]
```

```Go
func (e *encoder) EmitUint64(key string, value uint64)
```

#### <a id="encoder.EmitFloat32" href="#encoder.EmitFloat32">func (e *encoder) EmitFloat32(key string, value float32)</a>

```
searchKey: trace.encoder.EmitFloat32
tags: [private]
```

```Go
func (e *encoder) EmitFloat32(key string, value float32)
```

#### <a id="encoder.EmitFloat64" href="#encoder.EmitFloat64">func (e *encoder) EmitFloat64(key string, value float64)</a>

```
searchKey: trace.encoder.EmitFloat64
tags: [private]
```

```Go
func (e *encoder) EmitFloat64(key string, value float64)
```

#### <a id="encoder.EmitObject" href="#encoder.EmitObject">func (e *encoder) EmitObject(key string, value interface{})</a>

```
searchKey: trace.encoder.EmitObject
tags: [private]
```

```Go
func (e *encoder) EmitObject(key string, value interface{})
```

#### <a id="encoder.EmitLazyLogger" href="#encoder.EmitLazyLogger">func (e *encoder) EmitLazyLogger(value log.LazyLogger)</a>

```
searchKey: trace.encoder.EmitLazyLogger
tags: [private]
```

```Go
func (e *encoder) EmitLazyLogger(value log.LazyLogger)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Init" href="#Init">func Init(shouldInitSentry bool)</a>

```
searchKey: trace.Init
```

```Go
func Init(shouldInitSentry bool)
```

### <a id="GraphQLRequestName" href="#GraphQLRequestName">func GraphQLRequestName(ctx context.Context) string</a>

```
searchKey: trace.GraphQLRequestName
```

```Go
func GraphQLRequestName(ctx context.Context) string
```

GraphQLRequestName returns the GraphQL request name for a request context. For example, a request to /.api/graphql?Foobar would have the name `Foobar`. If the request had no name, or the context is not a GraphQL request, "unknown" is returned. 

### <a id="WithGraphQLRequestName" href="#WithGraphQLRequestName">func WithGraphQLRequestName(ctx context.Context, name string) context.Context</a>

```
searchKey: trace.WithGraphQLRequestName
```

```Go
func WithGraphQLRequestName(ctx context.Context, name string) context.Context
```

WithGraphQLRequestName sets the GraphQL request name in the context. 

### <a id="RequestOrigin" href="#RequestOrigin">func RequestOrigin(ctx context.Context) string</a>

```
searchKey: trace.RequestOrigin
```

```Go
func RequestOrigin(ctx context.Context) string
```

RequestOrigin returns the request origin (the value of the request header "Origin") for a request context. If the request didn't have this header set "unknown" is returned. 

### <a id="WithRequestOrigin" href="#WithRequestOrigin">func WithRequestOrigin(ctx context.Context, name string) context.Context</a>

```
searchKey: trace.WithRequestOrigin
```

```Go
func WithRequestOrigin(ctx context.Context, name string) context.Context
```

WithRequestOrigin sets the request origin in the context. 

### <a id="WithRequestSource" href="#WithRequestSource">func WithRequestSource(ctx context.Context, source SourceType) context.Context</a>

```
searchKey: trace.WithRequestSource
```

```Go
func WithRequestSource(ctx context.Context, source SourceType) context.Context
```

WithRequestSource sets the request source type in the context. 

### <a id="HTTPTraceMiddleware" href="#HTTPTraceMiddleware">func HTTPTraceMiddleware(next http.Handler) http.Handler</a>

```
searchKey: trace.HTTPTraceMiddleware
```

```Go
func HTTPTraceMiddleware(next http.Handler) http.Handler
```

HTTPTraceMiddleware captures and exports metrics to Prometheus, etc. 

🚨 SECURITY: This handler is served to all clients, even on private servers to clients who have not authenticated. It must not reveal any sensitive information. 

### <a id="Route" href="#Route">func Route(next http.Handler) http.Handler</a>

```
searchKey: trace.Route
```

```Go
func Route(next http.Handler) http.Handler
```

### <a id="User" href="#User">func User(ctx context.Context, userID int32)</a>

```
searchKey: trace.User
```

```Go
func User(ctx context.Context, userID int32)
```

### <a id="SetRequestErrorCause" href="#SetRequestErrorCause">func SetRequestErrorCause(ctx context.Context, err error)</a>

```
searchKey: trace.SetRequestErrorCause
```

```Go
func SetRequestErrorCause(ctx context.Context, err error)
```

SetRequestErrorCause will set the error for the request to err. This is used in the reporting layer to inspect the error for richer reporting to Sentry. 

### <a id="SetRouteName" href="#SetRouteName">func SetRouteName(r *http.Request, routeName string)</a>

```
searchKey: trace.SetRouteName
```

```Go
func SetRouteName(r *http.Request, routeName string)
```

SetRouteName manually sets the name for the route. This should only be used for non-mux routed routes (ie middlewares). 

### <a id="SpanURL" href="#SpanURL">func SpanURL(span opentracing.Span) string</a>

```
searchKey: trace.SpanURL
```

```Go
func SpanURL(span opentracing.Span) string
```

SpanURL returns the URL to the tracing UI for the given span. The span must be non-nil. 

### <a id="SpanURLFromContext" href="#SpanURLFromContext">func SpanURLFromContext(ctx context.Context) string</a>

```
searchKey: trace.SpanURLFromContext
```

```Go
func SpanURLFromContext(ctx context.Context) string
```

SpanURLFromContext returns the URL to the tracing UI for the span attached to the given context. An empty string is returned if there is no span associated with the given context. 

### <a id="SetSpanURLFunc" href="#SetSpanURLFunc">func SetSpanURLFunc(f func(span opentracing.Span) string)</a>

```
searchKey: trace.SetSpanURLFunc
```

```Go
func SetSpanURLFunc(f func(span opentracing.Span) string)
```

SetSpanURLFunc sets the function that SpanURL sets. 

### <a id="contextWithTrace" href="#contextWithTrace">func contextWithTrace(ctx context.Context, tr *Trace) context.Context</a>

```
searchKey: trace.contextWithTrace
tags: [private]
```

```Go
func contextWithTrace(ctx context.Context, tr *Trace) context.Context
```

contextWithTrace returns a new context.Context that holds a reference to trace's SpanContext. External callers should likely use CopyContext, as this properly propagates all tracing context from one context to another. 

### <a id="CopyContext" href="#CopyContext">func CopyContext(ctx context.Context, from context.Context) context.Context</a>

```
searchKey: trace.CopyContext
```

```Go
func CopyContext(ctx context.Context, from context.Context) context.Context
```

CopyContext copies the tracing-related context items from one context to another and returns that context. 

### <a id="Printf" href="#Printf">func Printf(key, f string, args ...interface{}) log.Field</a>

```
searchKey: trace.Printf
```

```Go
func Printf(key, f string, args ...interface{}) log.Field
```

Printf is an opentracing log.Field which is a LazyLogger. So the format string will only be evaluated if the trace is collected. In the case of net/trace, it will only be evaluated on page load. 

### <a id="Stringer" href="#Stringer">func Stringer(key string, v fmt.Stringer) log.Field</a>

```
searchKey: trace.Stringer
```

```Go
func Stringer(key string, v fmt.Stringer) log.Field
```

Stringer is an opentracing log.Field which is a LazyLogger. So the String() will only be called if the trace is collected. In the case of net/trace, it will only be evaluated on page load. 

### <a id="SQL" href="#SQL">func SQL(q *sqlf.Query) log.Field</a>

```
searchKey: trace.SQL
```

```Go
func SQL(q *sqlf.Query) log.Field
```

SQL is an opentracing log.Field which is a LazyLogger. It will log the query as well as each argument. 

### <a id="TestSpanURL" href="#TestSpanURL">func TestSpanURL(t *testing.T)</a>

```
searchKey: trace.TestSpanURL
tags: [private]
```

```Go
func TestSpanURL(t *testing.T)
```

