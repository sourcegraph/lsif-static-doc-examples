# Package observation

Package observation provides a unified way to wrap an operation with logging, tracing, and metrics. 

High-level ideas: 

```
- Each service creates an observation Context that carries a root logger, tracer,
  and a metrics registerer as its context.

- An observation Context can create an observation Operation which represents a
  section of code that can be invoked many times. An observation Operation is
  configured with state that applies to all invocation of the code.

- An observation Operation can wrap a an invocation of a section of code by calling its
  With method. This prepares a trace and some state to be reconciled after the invocation
  has completed. The With method returns a function that, when deferred, will emit metrics,
  additional logs, and finalize the trace span.

```
Sample usage: 

```
observationContext := observation.NewContex(
    log15.Root(),
    &trace.Tracer{Tracer: opentracing.GlobalTracer()},
    prometheus.DefaultRegisterer,
)

metrics := metrics.NewOperationMetrics(
    observationContext.Registerer,
    "thing",
    metrics.WithLabels("op"),
)

operation := observationContext.Operation(observation.Op{
    Name:         "Thing.SomeOperation",
    MetricLabels: []string{"some_operation"},
    Metrics:      metrics,
})

function SomeOperation(ctx context.Context) (err error) {
    // logs and metrics may be available before or after the operation, so they
    // can be supplied either at the start of the operation, or after in the
    // defer of endObservation.

    ctx, endObservation := operation.With(ctx, &err, observation.Args{ /* logs and metrics */ })
    defer func() { endObservation(1, observation.Args{ /* additional logs and metrics */ }) }()

    // ...
}

```
Log fields and metric labels can be supplied at construction of an Operation, at invocation of an operation (the With function), or after the invocation completes but before the observation has terminated (the endObservation function). Log fields and metric labels are concatenated together in the order they are attached to an operation. 

## Index

* [Variables](#var)
    * [var TestContext](#TestContext)
    * [var commonAcronyms](#commonAcronyms)
    * [var acronymsReplacer](#acronymsReplacer)
* [Types](#type)
    * [type Context struct](#Context)
        * [func (c *Context) Operation(args Op) *Operation](#Context.Operation)
    * [type Op struct](#Op)
    * [type Operation struct](#Operation)
        * [func (op *Operation) With(ctx context.Context, err *error, args Args) (context.Context, FinishFunc)](#Operation.With)
        * [func (op *Operation) WithAndLogger(ctx context.Context, err *error, args Args) (context.Context, TraceLogger, FinishFunc)](#Operation.WithAndLogger)
        * [func (op *Operation) trace(ctx context.Context, args Args) (*trace.Trace, context.Context)](#Operation.trace)
        * [func (op *Operation) emitErrorLogs(err *error, logFields []log.Field)](#Operation.emitErrorLogs)
        * [func (op *Operation) emitMetrics(err *error, count, elapsed float64, labels []string)](#Operation.emitMetrics)
        * [func (op *Operation) finishTrace(err *error, tr *trace.Trace, logFields []log.Field)](#Operation.finishTrace)
        * [func (op *Operation) applyErrorFilter(err *error) *error](#Operation.applyErrorFilter)
    * [type TraceLogger func(fields ...github.com/opentracing/opentracing-go/log.Field)](#TraceLogger)
    * [type FinishFunc func(count float64, args github.com/sourcegraph/sourcegraph/internal/observation.Args)](#FinishFunc)
    * [type Args struct](#Args)
        * [func (args Args) LogFieldMap() map[string]interface{}](#Args.LogFieldMap)
        * [func (args Args) LogFieldPairs() []interface{}](#Args.LogFieldPairs)
* [Functions](#func)
    * [func mergeLabels(groups ...[]string) []string](#mergeLabels)
    * [func mergeLogFields(groups ...[]log.Field) []log.Field](#mergeLogFields)
    * [func init()](#init.util.go)
    * [func kebabCase(s string) string](#kebabCase)
    * [func TestKebabCase(t *testing.T)](#TestKebabCase)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="TestContext" href="#TestContext">var TestContext</a>

```
searchKey: observation.TestContext
```

```Go
var TestContext = Context{Registerer: metrics.TestRegisterer}
```

TestContext is a behaviorless Context usable for unit tests. 

### <a id="commonAcronyms" href="#commonAcronyms">var commonAcronyms</a>

```
searchKey: observation.commonAcronyms
tags: [private]
```

```Go
var commonAcronyms = []string{
	"API",
	"ID",
	"LSIF",
}
```

commonAcronyms includes acronyms that malform the expected output of kebabCase due to unexpected adjacent upper-case letters. Add items to this list to stop kebabCase from transforming `FromLSIF` into `from-l-s-i-f`. 

### <a id="acronymsReplacer" href="#acronymsReplacer">var acronymsReplacer</a>

```
searchKey: observation.acronymsReplacer
tags: [private]
```

```Go
var acronymsReplacer *strings.Replacer
```

acronymsReplacer is a string replacer that normalizes the acronyms above. For example, `API` will be transformed into `Api` so that it appears as one word. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Context" href="#Context">type Context struct</a>

```
searchKey: observation.Context
```

```Go
type Context struct {
	Logger     logging.ErrorLogger
	Tracer     *trace.Tracer
	Registerer prometheus.Registerer
}
```

Context carries context about where to send logs, trace spans, and register metrics. It should be created once on service startup, and passed around to any location that wants to use it for observing operations. 

#### <a id="Context.Operation" href="#Context.Operation">func (c *Context) Operation(args Op) *Operation</a>

```
searchKey: observation.Context.Operation
```

```Go
func (c *Context) Operation(args Op) *Operation
```

Operation combines the state of the parent context to create a new operation. This value should be owned and used by the code that performs the operation it represents. 

### <a id="Op" href="#Op">type Op struct</a>

```
searchKey: observation.Op
```

```Go
type Op struct {
	Metrics *metrics.OperationMetrics
	// Name configures the trace and error log names. This string should be of the
	// format {GroupName}.{OperationName}, where both sections are title cased
	// (e.g. Store.GetRepoByID).
	Name string
	// MetricLabels that apply for every invocation of this operation.
	MetricLabels []string
	// LogFields that apply for for every invocation of this operation.
	LogFields []log.Field
	// ErrorFilter returns false for any error that should be converted to nil
	// for the purposes of metrics and tracing. If this field is not set then
	// error values are unaltered.
	//
	// This is useful when, for example, a revision not found error is expected by
	// a process interfacing with gitserver. Such an error should not be treated as
	// an unexpected value in metrics and traces but should be handled higher up in
	// the stack.
	ErrorFilter func(err error) bool
}
```

Op configures an Operation instance. 

### <a id="Operation" href="#Operation">type Operation struct</a>

```
searchKey: observation.Operation
```

```Go
type Operation struct {
	context      *Context
	metrics      *metrics.OperationMetrics
	name         string
	kebabName    string
	metricLabels []string
	logFields    []log.Field
	errorFilter  func(err error) bool
}
```

Operation represents an interesting section of code that can be invoked. 

#### <a id="Operation.With" href="#Operation.With">func (op *Operation) With(ctx context.Context, err *error, args Args) (context.Context, FinishFunc)</a>

```
searchKey: observation.Operation.With
```

```Go
func (op *Operation) With(ctx context.Context, err *error, args Args) (context.Context, FinishFunc)
```

With prepares the necessary timers, loggers, and metrics to observe the invocation  of an operation. This method returns a modified context and a function to be deferred until the end of the operation. 

#### <a id="Operation.WithAndLogger" href="#Operation.WithAndLogger">func (op *Operation) WithAndLogger(ctx context.Context, err *error, args Args) (context.Context, TraceLogger, FinishFunc)</a>

```
searchKey: observation.Operation.WithAndLogger
```

```Go
func (op *Operation) WithAndLogger(ctx context.Context, err *error, args Args) (context.Context, TraceLogger, FinishFunc)
```

WithAndLogger prepares the necessary timers, loggers, and metrics to observe the invocation of an operation. This method returns a modified context, a function that will add a log field to the active trace, and a function to be deferred until the end of the operation. 

#### <a id="Operation.trace" href="#Operation.trace">func (op *Operation) trace(ctx context.Context, args Args) (*trace.Trace, context.Context)</a>

```
searchKey: observation.Operation.trace
tags: [private]
```

```Go
func (op *Operation) trace(ctx context.Context, args Args) (*trace.Trace, context.Context)
```

trace creates a new Trace object and returns the wrapped context. If any log fields are attached to the operation or to the args to With, they are emitted immediately. This returns an unmodified context and a nil trace if no tracer was supplied on the observation context. 

#### <a id="Operation.emitErrorLogs" href="#Operation.emitErrorLogs">func (op *Operation) emitErrorLogs(err *error, logFields []log.Field)</a>

```
searchKey: observation.Operation.emitErrorLogs
tags: [private]
```

```Go
func (op *Operation) emitErrorLogs(err *error, logFields []log.Field)
```

emitErrorLogs will log as message if the operation has failed. This log contains the error as well as all of the log fields attached ot the operation, the args to With, and the args to the finish function. This does nothing if the no logger was supplied on the observation context. 

#### <a id="Operation.emitMetrics" href="#Operation.emitMetrics">func (op *Operation) emitMetrics(err *error, count, elapsed float64, labels []string)</a>

```
searchKey: observation.Operation.emitMetrics
tags: [private]
```

```Go
func (op *Operation) emitMetrics(err *error, count, elapsed float64, labels []string)
```

emitMetrics will emit observe the duration, operation/result, and error counter metrics for this operation. This does nothing if no metric was supplied to the observation. 

#### <a id="Operation.finishTrace" href="#Operation.finishTrace">func (op *Operation) finishTrace(err *error, tr *trace.Trace, logFields []log.Field)</a>

```
searchKey: observation.Operation.finishTrace
tags: [private]
```

```Go
func (op *Operation) finishTrace(err *error, tr *trace.Trace, logFields []log.Field)
```

finishTrace will set the error value, log additional fields supplied after the operation's execution, and finalize the trace span. This does nothing if no trace was constructed at the start of the operation. 

#### <a id="Operation.applyErrorFilter" href="#Operation.applyErrorFilter">func (op *Operation) applyErrorFilter(err *error) *error</a>

```
searchKey: observation.Operation.applyErrorFilter
tags: [private]
```

```Go
func (op *Operation) applyErrorFilter(err *error) *error
```

applyErrorFilter returns nil if the given error does not pass the registered error filter. The original value is returned otherwise. 

### <a id="TraceLogger" href="#TraceLogger">type TraceLogger func(fields ...github.com/opentracing/opentracing-go/log.Field)</a>

```
searchKey: observation.TraceLogger
```

```Go
type TraceLogger func(fields ...log.Field)
```

TraceLogger is returned from WithAndLogger and can be used to add timestamped key and value pairs into a related opentracing span. 

### <a id="FinishFunc" href="#FinishFunc">type FinishFunc func(count float64, args github.com/sourcegraph/sourcegraph/internal/observation.Args)</a>

```
searchKey: observation.FinishFunc
```

```Go
type FinishFunc func(count float64, args Args)
```

FinishFunc is the shape of the function returned by With and should be invoked within a defer directly before the observed function returns. 

### <a id="Args" href="#Args">type Args struct</a>

```
searchKey: observation.Args
```

```Go
type Args struct {
	// MetricLabels that apply only to this invocation of the operation.
	MetricLabels []string
	// LogFields that apply only to this invocation of the operation.
	LogFields []log.Field
}
```

Args configures the observation behavior of an invocation of an operation. 

#### <a id="Args.LogFieldMap" href="#Args.LogFieldMap">func (args Args) LogFieldMap() map[string]interface{}</a>

```
searchKey: observation.Args.LogFieldMap
```

```Go
func (args Args) LogFieldMap() map[string]interface{}
```

LogFieldMap returns a string-to-interface map containing the contents of this Arg value's log fields. 

#### <a id="Args.LogFieldPairs" href="#Args.LogFieldPairs">func (args Args) LogFieldPairs() []interface{}</a>

```
searchKey: observation.Args.LogFieldPairs
```

```Go
func (args Args) LogFieldPairs() []interface{}
```

LogFieldPairs returns a slice of key, value, key, value, ... pairs containing the contents of this Arg value's log fields. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="mergeLabels" href="#mergeLabels">func mergeLabels(groups ...[]string) []string</a>

```
searchKey: observation.mergeLabels
tags: [private]
```

```Go
func mergeLabels(groups ...[]string) []string
```

mergeLabels flattens slices of slices of strings. 

### <a id="mergeLogFields" href="#mergeLogFields">func mergeLogFields(groups ...[]log.Field) []log.Field</a>

```
searchKey: observation.mergeLogFields
tags: [private]
```

```Go
func mergeLogFields(groups ...[]log.Field) []log.Field
```

mergeLogFields flattens slices of slices of log fields. 

### <a id="init.util.go" href="#init.util.go">func init()</a>

```
searchKey: observation.init
tags: [private]
```

```Go
func init()
```

### <a id="kebabCase" href="#kebabCase">func kebabCase(s string) string</a>

```
searchKey: observation.kebabCase
tags: [private]
```

```Go
func kebabCase(s string) string
```

kebab transforms a string into lower-kebab-case. 

### <a id="TestKebabCase" href="#TestKebabCase">func TestKebabCase(t *testing.T)</a>

```
searchKey: observation.TestKebabCase
tags: [private]
```

```Go
func TestKebabCase(t *testing.T)
```

