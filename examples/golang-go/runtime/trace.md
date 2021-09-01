# Package trace

Package trace contains facilities for programs to generate traces for the Go execution tracer. 

### hdr-Tracing_runtime_activitiesTracing runtime activities
The execution trace captures a wide range of execution events such as goroutine creation/blocking/unblocking, syscall enter/exit/block, GC-related events, changes of heap size, processor start/stop, etc. A precise nanosecond-precision timestamp and a stack trace is captured for most events. The generated trace can be interpreted using `go tool trace`. 

Support for tracing tests and benchmarks built with the standard testing package is built into `go test`. For example, the following command runs the test in the current directory and writes the trace file (trace.out). 

```
go test -trace=trace.out

```
This runtime/trace package provides APIs to add equivalent tracing support to a standalone program. See the Example that demonstrates how to use this API to enable tracing. 

There is also a standard HTTP interface to trace data. Adding the following line will install a handler under the /debug/pprof/trace URL to download a live trace: 

```
import _ "net/http/pprof"

```
See the net/http/pprof package for more details about all of the debug endpoints installed by this import. 

### hdr-User_annotationUser annotation
Package trace provides user annotation APIs that can be used to log interesting events during execution. 

There are three types of user annotations: log messages, regions, and tasks. 

Log emits a timestamped message to the execution trace along with additional information such as the category of the message and which goroutine called Log. The execution tracer provides UIs to filter and group goroutines using the log category and the message supplied in Log. 

A region is for logging a time interval during a goroutine's execution. By definition, a region starts and ends in the same goroutine. Regions can be nested to represent subintervals. For example, the following code records four regions in the execution trace to trace the durations of sequential steps in a cappuccino making operation. 

```
trace.WithRegion(ctx, "makeCappuccino", func() {

   // orderID allows to identify a specific order
   // among many cappuccino order region records.
   trace.Log(ctx, "orderID", orderID)

   trace.WithRegion(ctx, "steamMilk", steamMilk)
   trace.WithRegion(ctx, "extractCoffee", extractCoffee)
   trace.WithRegion(ctx, "mixMilkCoffee", mixMilkCoffee)
})

```
A task is a higher-level component that aids tracing of logical operations such as an RPC request, an HTTP request, or an interesting local operation which may require multiple goroutines working together. Since tasks can involve multiple goroutines, they are tracked via a context.Context object. NewTask creates a new task and embeds it in the returned context.Context object. Log messages and regions are attached to the task, if any, in the Context passed to Log and WithRegion. 

For example, assume that we decided to froth milk, extract coffee, and mix milk and coffee in separate goroutines. With a task, the trace tool can identify the goroutines involved in a specific cappuccino order. 

```
ctx, task := trace.NewTask(ctx, "makeCappuccino")
trace.Log(ctx, "orderID", orderID)

milk := make(chan bool)
espresso := make(chan bool)

go func() {
        trace.WithRegion(ctx, "steamMilk", steamMilk)
        milk <- true
}()
go func() {
        trace.WithRegion(ctx, "extractCoffee", extractCoffee)
        espresso <- true
}()
go func() {
        defer task.End() // When assemble is done, the order is complete.
        <-espresso
        <-milk
        trace.WithRegion(ctx, "mixMilkCoffee", mixMilkCoffee)
}()

```
The trace tool computes the latency of a task by measuring the time between the task creation and the task end and provides latency distributions for each task type found in the trace. 

## Index

* [Constants](#const)
    * [const regionEndCode](#regionEndCode)
    * [const regionStartCode](#regionStartCode)
* [Variables](#var)
    * [var bgTask](#bgTask)
    * [var lastTaskID](#lastTaskID)
    * [var noopRegion](#noopRegion)
    * [var tracing](#tracing)
* [Types](#type)
    * [type Region struct](#Region)
        * [func StartRegion(ctx context.Context, regionType string) *Region](#StartRegion)
        * [func (r *Region) End()](#Region.End)
    * [type Task struct](#Task)
        * [func NewTask(pctx context.Context, taskType string) (ctx context.Context, task *Task)](#NewTask)
        * [func fromContext(ctx context.Context) *Task](#fromContext)
        * [func (t *Task) End()](#Task.End)
    * [type traceContextKey struct{}](#traceContextKey)
* [Functions](#func)
    * [func IsEnabled() bool](#IsEnabled)
    * [func Log(ctx context.Context, category, message string)](#Log)
    * [func Logf(ctx context.Context, category, format string, args ...interface{})](#Logf)
    * [func Start(w io.Writer) error](#Start)
    * [func Stop()](#Stop)
    * [func WithRegion(ctx context.Context, regionType string, fn func())](#WithRegion)
    * [func newID() uint64](#newID)
    * [func userLog(id uint64, category, message string)](#userLog)
    * [func userRegion(id, mode uint64, regionType string)](#userRegion)
    * [func userTaskCreate(id, parentID uint64, taskType string)](#userTaskCreate)
    * [func userTaskEnd(id uint64)](#userTaskEnd)


## <a id="const" href="#const">Constants</a>

### <a id="regionEndCode" href="#regionEndCode">const regionEndCode</a>

```
searchKey: trace.regionEndCode
tags: [constant number private]
```

```Go
const regionEndCode = uint64(1)
```

### <a id="regionStartCode" href="#regionStartCode">const regionStartCode</a>

```
searchKey: trace.regionStartCode
tags: [constant number private]
```

```Go
const regionStartCode = uint64(0)
```

## <a id="var" href="#var">Variables</a>

### <a id="bgTask" href="#bgTask">var bgTask</a>

```
searchKey: trace.bgTask
tags: [variable struct private]
```

```Go
var bgTask = Task{id: uint64(0)}
```

### <a id="lastTaskID" href="#lastTaskID">var lastTaskID</a>

```
searchKey: trace.lastTaskID
tags: [variable number private]
```

```Go
var lastTaskID uint64 = 0 // task id issued last time

```

### <a id="noopRegion" href="#noopRegion">var noopRegion</a>

```
searchKey: trace.noopRegion
tags: [variable struct private]
```

```Go
var noopRegion = &Region{}
```

### <a id="tracing" href="#tracing">var tracing</a>

```
searchKey: trace.tracing
tags: [variable struct private]
```

```Go
var tracing struct {
	sync.Mutex       // gate mutators (Start, Stop)
	enabled    int32 // accessed via atomic
} = ...
```

## <a id="type" href="#type">Types</a>

### <a id="Region" href="#Region">type Region struct</a>

```
searchKey: trace.Region
tags: [struct]
```

```Go
type Region struct {
	id         uint64
	regionType string
}
```

Region is a region of code whose execution time interval is traced. 

#### <a id="StartRegion" href="#StartRegion">func StartRegion(ctx context.Context, regionType string) *Region</a>

```
searchKey: trace.StartRegion
tags: [function]
```

```Go
func StartRegion(ctx context.Context, regionType string) *Region
```

StartRegion starts a region and returns a function for marking the end of the region. The returned Region's End function must be called from the same goroutine where the region was started. Within each goroutine, regions must nest. That is, regions started after this region must be ended before this region can be ended. Recommended usage is 

```
defer trace.StartRegion(ctx, "myTracedRegion").End()

```
#### <a id="Region.End" href="#Region.End">func (r *Region) End()</a>

```
searchKey: trace.Region.End
tags: [method]
```

```Go
func (r *Region) End()
```

End marks the end of the traced code region. 

### <a id="Task" href="#Task">type Task struct</a>

```
searchKey: trace.Task
tags: [struct]
```

```Go
type Task struct {
	id uint64
}
```

Task is a data type for tracing a user-defined, logical operation. 

#### <a id="NewTask" href="#NewTask">func NewTask(pctx context.Context, taskType string) (ctx context.Context, task *Task)</a>

```
searchKey: trace.NewTask
tags: [function]
```

```Go
func NewTask(pctx context.Context, taskType string) (ctx context.Context, task *Task)
```

NewTask creates a task instance with the type taskType and returns it along with a Context that carries the task. If the input context contains a task, the new task is its subtask. 

The taskType is used to classify task instances. Analysis tools like the Go execution tracer may assume there are only a bounded number of unique task types in the system. 

The returned end function is used to mark the task's end. The trace tool measures task latency as the time between task creation and when the end function is called, and provides the latency distribution per task type. If the end function is called multiple times, only the first call is used in the latency measurement. 

```
ctx, task := trace.NewTask(ctx, "awesomeTask")
trace.WithRegion(ctx, "preparation", prepWork)
// preparation of the task
go func() {  // continue processing the task in a separate goroutine.
    defer task.End()
    trace.WithRegion(ctx, "remainingWork", remainingWork)
}()

```
#### <a id="fromContext" href="#fromContext">func fromContext(ctx context.Context) *Task</a>

```
searchKey: trace.fromContext
tags: [function private]
```

```Go
func fromContext(ctx context.Context) *Task
```

#### <a id="Task.End" href="#Task.End">func (t *Task) End()</a>

```
searchKey: trace.Task.End
tags: [method]
```

```Go
func (t *Task) End()
```

End marks the end of the operation represented by the Task. 

### <a id="traceContextKey" href="#traceContextKey">type traceContextKey struct{}</a>

```
searchKey: trace.traceContextKey
tags: [struct private]
```

```Go
type traceContextKey struct{}
```

## <a id="func" href="#func">Functions</a>

### <a id="IsEnabled" href="#IsEnabled">func IsEnabled() bool</a>

```
searchKey: trace.IsEnabled
tags: [function]
```

```Go
func IsEnabled() bool
```

IsEnabled reports whether tracing is enabled. The information is advisory only. The tracing status may have changed by the time this function returns. 

### <a id="Log" href="#Log">func Log(ctx context.Context, category, message string)</a>

```
searchKey: trace.Log
tags: [function]
```

```Go
func Log(ctx context.Context, category, message string)
```

Log emits a one-off event with the given category and message. Category can be empty and the API assumes there are only a handful of unique categories in the system. 

### <a id="Logf" href="#Logf">func Logf(ctx context.Context, category, format string, args ...interface{})</a>

```
searchKey: trace.Logf
tags: [function]
```

```Go
func Logf(ctx context.Context, category, format string, args ...interface{})
```

Logf is like Log, but the value is formatted using the specified format spec. 

### <a id="Start" href="#Start">func Start(w io.Writer) error</a>

```
searchKey: trace.Start
tags: [function]
```

```Go
func Start(w io.Writer) error
```

Start enables tracing for the current program. While tracing, the trace will be buffered and written to w. Start returns an error if tracing is already enabled. 

### <a id="Stop" href="#Stop">func Stop()</a>

```
searchKey: trace.Stop
tags: [function]
```

```Go
func Stop()
```

Stop stops the current tracing, if any. Stop only returns after all the writes for the trace have completed. 

### <a id="WithRegion" href="#WithRegion">func WithRegion(ctx context.Context, regionType string, fn func())</a>

```
searchKey: trace.WithRegion
tags: [function]
```

```Go
func WithRegion(ctx context.Context, regionType string, fn func())
```

WithRegion starts a region associated with its calling goroutine, runs fn, and then ends the region. If the context carries a task, the region is associated with the task. Otherwise, the region is attached to the background task. 

The regionType is used to classify regions, so there should be only a handful of unique region types. 

### <a id="newID" href="#newID">func newID() uint64</a>

```
searchKey: trace.newID
tags: [function private]
```

```Go
func newID() uint64
```

### <a id="userLog" href="#userLog">func userLog(id uint64, category, message string)</a>

```
searchKey: trace.userLog
tags: [function private]
```

```Go
func userLog(id uint64, category, message string)
```

emits UserLog event. 

### <a id="userRegion" href="#userRegion">func userRegion(id, mode uint64, regionType string)</a>

```
searchKey: trace.userRegion
tags: [function private]
```

```Go
func userRegion(id, mode uint64, regionType string)
```

emits UserRegion event. 

### <a id="userTaskCreate" href="#userTaskCreate">func userTaskCreate(id, parentID uint64, taskType string)</a>

```
searchKey: trace.userTaskCreate
tags: [function private]
```

```Go
func userTaskCreate(id, parentID uint64, taskType string)
```

emits UserTaskCreate event. 

### <a id="userTaskEnd" href="#userTaskEnd">func userTaskEnd(id uint64)</a>

```
searchKey: trace.userTaskEnd
tags: [function private]
```

```Go
func userTaskEnd(id uint64)
```

emits UserTaskEnd event. 

