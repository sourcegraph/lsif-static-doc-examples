# Package tracer

Package tracer initializes distributed tracing and log15 behavior. It also updates distributed tracing behavior in response to changes in site configuration. When the Init function of this package is invoked, opentracing.SetGlobalTracer is called (and subsequently called again after every Sourcegraph site configuration change). Importing programs should not invoke opentracing.SetGlobalTracer anywhere else. 

## Index

* [Constants](#const)
    * [const tracingNotEnabledURL](#tracingNotEnabledURL)
* [Types](#type)
    * [type Options struct](#Options)
    * [type Option func(*github.com/sourcegraph/sourcegraph/internal/tracer.Options)](#Option)
        * [func ServiceName(s string) Option](#ServiceName)
    * [type jaegerOpts struct](#jaegerOpts)
    * [type switchableTracer struct](#switchableTracer)
        * [func newSwitchableTracer() *switchableTracer](#newSwitchableTracer)
        * [func (t *switchableTracer) StartSpan(operationName string, opts ...opentracing.StartSpanOption) opentracing.Span](#switchableTracer.StartSpan)
        * [func (t *switchableTracer) Inject(sm opentracing.SpanContext, format interface{}, carrier interface{}) error](#switchableTracer.Inject)
        * [func (t *switchableTracer) Extract(format interface{}, carrier interface{}) (opentracing.SpanContext, error)](#switchableTracer.Extract)
        * [func (t *switchableTracer) set(tracer opentracing.Tracer, tracerCloser io.Closer, log bool)](#switchableTracer.set)
* [Functions](#func)
    * [func init()](#init.tracer.go)
    * [func Init(options ...Option)](#Init)
    * [func initTracer(serviceName string)](#initTracer)
    * [func newTracer(opts *jaegerOpts) (opentracing.Tracer, func(span opentracing.Span) string, io.Closer, error)](#newTracer)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="tracingNotEnabledURL" href="#tracingNotEnabledURL">const tracingNotEnabledURL</a>

```
searchKey: tracer.tracingNotEnabledURL
tags: [private]
```

```Go
const tracingNotEnabledURL = "#tracing_not_enabled_for_this_request_add_?trace=1_to_url_to_enable"
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Options" href="#Options">type Options struct</a>

```
searchKey: tracer.Options
```

```Go
type Options struct {
	serviceName string
}
```

Options control the behavior of a tracer. 

### <a id="Option" href="#Option">type Option func(*github.com/sourcegraph/sourcegraph/internal/tracer.Options)</a>

```
searchKey: tracer.Option
```

```Go
type Option func(*Options)
```

If this idiom seems strange: [https://github.com/tmrts/go-patterns/blob/master/idiom/functional-options.md](https://github.com/tmrts/go-patterns/blob/master/idiom/functional-options.md) 

#### <a id="ServiceName" href="#ServiceName">func ServiceName(s string) Option</a>

```
searchKey: tracer.ServiceName
```

```Go
func ServiceName(s string) Option
```

### <a id="jaegerOpts" href="#jaegerOpts">type jaegerOpts struct</a>

```
searchKey: tracer.jaegerOpts
tags: [private]
```

```Go
type jaegerOpts struct {
	ServiceName string
	ExternalURL string
	Enabled     bool
	Debug       bool
}
```

### <a id="switchableTracer" href="#switchableTracer">type switchableTracer struct</a>

```
searchKey: tracer.switchableTracer
tags: [private]
```

```Go
type switchableTracer struct {
	mu           sync.RWMutex
	tracer       opentracing.Tracer
	tracerCloser io.Closer
	log          bool
}
```

switchableTracer implements opentracing.Tracer. The underlying tracer used is switchable (set via the `set` method). 

#### <a id="newSwitchableTracer" href="#newSwitchableTracer">func newSwitchableTracer() *switchableTracer</a>

```
searchKey: tracer.newSwitchableTracer
tags: [private]
```

```Go
func newSwitchableTracer() *switchableTracer
```

#### <a id="switchableTracer.StartSpan" href="#switchableTracer.StartSpan">func (t *switchableTracer) StartSpan(operationName string, opts ...opentracing.StartSpanOption) opentracing.Span</a>

```
searchKey: tracer.switchableTracer.StartSpan
tags: [private]
```

```Go
func (t *switchableTracer) StartSpan(operationName string, opts ...opentracing.StartSpanOption) opentracing.Span
```

#### <a id="switchableTracer.Inject" href="#switchableTracer.Inject">func (t *switchableTracer) Inject(sm opentracing.SpanContext, format interface{}, carrier interface{}) error</a>

```
searchKey: tracer.switchableTracer.Inject
tags: [private]
```

```Go
func (t *switchableTracer) Inject(sm opentracing.SpanContext, format interface{}, carrier interface{}) error
```

#### <a id="switchableTracer.Extract" href="#switchableTracer.Extract">func (t *switchableTracer) Extract(format interface{}, carrier interface{}) (opentracing.SpanContext, error)</a>

```
searchKey: tracer.switchableTracer.Extract
tags: [private]
```

```Go
func (t *switchableTracer) Extract(format interface{}, carrier interface{}) (opentracing.SpanContext, error)
```

#### <a id="switchableTracer.set" href="#switchableTracer.set">func (t *switchableTracer) set(tracer opentracing.Tracer, tracerCloser io.Closer, log bool)</a>

```
searchKey: tracer.switchableTracer.set
tags: [private]
```

```Go
func (t *switchableTracer) set(tracer opentracing.Tracer, tracerCloser io.Closer, log bool)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="init.tracer.go" href="#init.tracer.go">func init()</a>

```
searchKey: tracer.init
tags: [private]
```

```Go
func init()
```

### <a id="Init" href="#Init">func Init(options ...Option)</a>

```
searchKey: tracer.Init
```

```Go
func Init(options ...Option)
```

### <a id="initTracer" href="#initTracer">func initTracer(serviceName string)</a>

```
searchKey: tracer.initTracer
tags: [private]
```

```Go
func initTracer(serviceName string)
```

initTracer is a helper that should be called exactly once (from Init). 

### <a id="newTracer" href="#newTracer">func newTracer(opts *jaegerOpts) (opentracing.Tracer, func(span opentracing.Span) string, io.Closer, error)</a>

```
searchKey: tracer.newTracer
tags: [private]
```

```Go
func newTracer(opts *jaegerOpts) (opentracing.Tracer, func(span opentracing.Span) string, io.Closer, error)
```

