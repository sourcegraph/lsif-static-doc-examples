# Package shared

## Index

* [Constants](#const)
    * [const addr](#addr)
* [Variables](#var)
    * [var builtins](#builtins)
    * [var config](#config)
    * [var initDatabaseMemo](#initDatabaseMemo)
* [Types](#type)
    * [type Config struct](#Config)
        * [func (c *Config) Load()](#Config.Load)
        * [func (c *Config) Validate() error](#Config.Validate)
    * [type Job interface](#Job)
    * [type MemoizedConstructor struct](#MemoizedConstructor)
        * [func NewMemoizedConstructor(ctor func() (interface{}, error)) *MemoizedConstructor](#NewMemoizedConstructor)
        * [func (m *MemoizedConstructor) Init() (interface{}, error)](#MemoizedConstructor.Init)
    * [type routinesResult struct](#routinesResult)
* [Functions](#func)
    * [func InitDatabase() (*sql.DB, error)](#InitDatabase)
    * [func Start(additionalJobs map[string]Job)](#Start)
    * [func WatchServiceConnectionValue(f func(serviceConnections conftypes.ServiceConnections) string) string](#WatchServiceConnectionValue)
    * [func emitJobCountMetrics(jobs map[string]Job)](#emitJobCountMetrics)
    * [func jobNames(jobs map[string]Job) []string](#jobNames)
    * [func loadConfigs(jobs map[string]Job)](#loadConfigs)
    * [func mustCreateBackgroundRoutines(jobs map[string]Job) []goroutine.BackgroundRoutine](#mustCreateBackgroundRoutines)
    * [func mustValidateConfigs(jobs map[string]Job)](#mustValidateConfigs)
    * [func runRoutinesConcurrently(jobs map[string]Job) chan routinesResult](#runRoutinesConcurrently)
    * [func safeSplit(text, sep string) []string](#safeSplit)
    * [func shouldRunJob(name string) bool](#shouldRunJob)


## <a id="const" href="#const">Constants</a>

### <a id="addr" href="#addr">const addr</a>

```
searchKey: shared.addr
tags: [constant string private]
```

```Go
const addr = ":3189"
```

## <a id="var" href="#var">Variables</a>

### <a id="builtins" href="#builtins">var builtins</a>

```
searchKey: shared.builtins
tags: [variable object private]
```

```Go
var builtins = map[string]Job{}
```

### <a id="config" href="#config">var config</a>

```
searchKey: shared.config
tags: [variable struct private]
```

```Go
var config = &Config{}
```

### <a id="initDatabaseMemo" href="#initDatabaseMemo">var initDatabaseMemo</a>

```
searchKey: shared.initDatabaseMemo
tags: [variable struct private]
```

```Go
var initDatabaseMemo = ...
```

## <a id="type" href="#type">Types</a>

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: shared.Config
tags: [struct]
```

```Go
type Config struct {
	env.BaseConfig
	names []string

	JobAllowlist []string
	JobBlocklist []string
}
```

Config is the configuration that controls what jobs will be initialized and monitored. By default, all jobs are enabled. Individual jobs can be explicit allowed or blocked from running on a particular instance. 

#### <a id="Config.Load" href="#Config.Load">func (c *Config) Load()</a>

```
searchKey: shared.Config.Load
tags: [method]
```

```Go
func (c *Config) Load()
```

Load reads from the environment and stores the transformed data on the config object for later retrieval. 

#### <a id="Config.Validate" href="#Config.Validate">func (c *Config) Validate() error</a>

```
searchKey: shared.Config.Validate
tags: [method]
```

```Go
func (c *Config) Validate() error
```

Validate returns an error indicating if there was an invalid environment read during Load. The environment is invalid when a supplied job name is not recognized by the set of names registered to the worker (at compile time). 

This method assumes that the name field has been set externally. 

### <a id="Job" href="#Job">type Job interface</a>

```
searchKey: shared.Job
tags: [interface]
```

```Go
type Job interface {
	// Config returns a set of configuration struct pointers that should be loaded
	// and validated as part of application startup.
	//
	// If called multiple times, the same pointers should be returned.
	//
	// Note that the Load function of every config object is invoked even if the
	// job is not enabled. It is assumed safe to call this method with an invalid
	// configuration (and all configuration errors should be surfaced via Validate).
	Config() []env.Config

	// Routines constructs and returns the set of background routines that
	// should run as part of the worker process. Service initialization should
	// be shared between setup hooks when possible (e.g. sync.Once initialization).
	//
	// Note that the given context is meant to be used _only_ for setup. A context
	// passed to a periodic routine should be a fresh context unattached to this,
	// as the argument to this function will be canceled after all Routine invocations
	// have exited after application startup.
	Routines(ctx context.Context) ([]goroutine.BackgroundRoutine, error)
}
```

Job creates configuration struct and background routine instances to be run as part of the worker process. 

### <a id="MemoizedConstructor" href="#MemoizedConstructor">type MemoizedConstructor struct</a>

```
searchKey: shared.MemoizedConstructor
tags: [struct]
```

```Go
type MemoizedConstructor struct {
	ctor  func() (interface{}, error)
	value interface{}
	err   error
	once  sync.Once
}
```

MemoizedConstructor wraps a function returning a value and an error and memoizes its result. Multiple calls to Init will result in the underlying constructor being called once. All callers will receive the same return values. 

#### <a id="NewMemoizedConstructor" href="#NewMemoizedConstructor">func NewMemoizedConstructor(ctor func() (interface{}, error)) *MemoizedConstructor</a>

```
searchKey: shared.NewMemoizedConstructor
tags: [function]
```

```Go
func NewMemoizedConstructor(ctor func() (interface{}, error)) *MemoizedConstructor
```

NewMemoizedConstructor memoizes the given constructor 

#### <a id="MemoizedConstructor.Init" href="#MemoizedConstructor.Init">func (m *MemoizedConstructor) Init() (interface{}, error)</a>

```
searchKey: shared.MemoizedConstructor.Init
tags: [method]
```

```Go
func (m *MemoizedConstructor) Init() (interface{}, error)
```

Init ensures that the given constructor has been called exactly once, then returns the constructor's result value and error. 

### <a id="routinesResult" href="#routinesResult">type routinesResult struct</a>

```
searchKey: shared.routinesResult
tags: [struct private]
```

```Go
type routinesResult struct {
	name     string
	routines []goroutine.BackgroundRoutine
	err      error
}
```

## <a id="func" href="#func">Functions</a>

### <a id="InitDatabase" href="#InitDatabase">func InitDatabase() (*sql.DB, error)</a>

```
searchKey: shared.InitDatabase
tags: [function]
```

```Go
func InitDatabase() (*sql.DB, error)
```

InitDatabase initializes and returns a connection to the frontend database. 

### <a id="Start" href="#Start">func Start(additionalJobs map[string]Job)</a>

```
searchKey: shared.Start
tags: [function]
```

```Go
func Start(additionalJobs map[string]Job)
```

Start runs the worker. This method does not return. 

### <a id="WatchServiceConnectionValue" href="#WatchServiceConnectionValue">func WatchServiceConnectionValue(f func(serviceConnections conftypes.ServiceConnections) string) string</a>

```
searchKey: shared.WatchServiceConnectionValue
tags: [function]
```

```Go
func WatchServiceConnectionValue(f func(serviceConnections conftypes.ServiceConnections) string) string
```

WatchServiceConnectionValue returns the value returned by the given function when passed the current service connection configuration. If this function returns a different value in the future for an updated service connection configuration, a fatal log will be emitted to restart the service to pick up changes. 

This method should only be called for critical values like database connection config. 

### <a id="emitJobCountMetrics" href="#emitJobCountMetrics">func emitJobCountMetrics(jobs map[string]Job)</a>

```
searchKey: shared.emitJobCountMetrics
tags: [function private]
```

```Go
func emitJobCountMetrics(jobs map[string]Job)
```

emitJobCountMetrics registers and emits an initial value for gauges referencing each of the jobs that will be run by this instance of the worker. Since these metrics are summed over all instances (and we don't change the jobs that are registered to a running worker), we only need to emit an initial count once. 

### <a id="jobNames" href="#jobNames">func jobNames(jobs map[string]Job) []string</a>

```
searchKey: shared.jobNames
tags: [function private]
```

```Go
func jobNames(jobs map[string]Job) []string
```

jobNames returns an ordered slice of keys from the given map. 

### <a id="loadConfigs" href="#loadConfigs">func loadConfigs(jobs map[string]Job)</a>

```
searchKey: shared.loadConfigs
tags: [function private]
```

```Go
func loadConfigs(jobs map[string]Job)
```

loadConfigs calls Load on the configs of each of the jobs registered in this binary. All configs will be loaded regardless if they would later be validated - this is the best place we have to manipulate the environment before the call to env.Lock. 

### <a id="mustCreateBackgroundRoutines" href="#mustCreateBackgroundRoutines">func mustCreateBackgroundRoutines(jobs map[string]Job) []goroutine.BackgroundRoutine</a>

```
searchKey: shared.mustCreateBackgroundRoutines
tags: [function private]
```

```Go
func mustCreateBackgroundRoutines(jobs map[string]Job) []goroutine.BackgroundRoutine
```

mustCreateBackgroundRoutines runs the Routines function of each of the given jobs concurrently. If an error occurs from any of them, a fatal log message will be emitted. Otherwise, the set of background routines from each job will be returned. 

### <a id="mustValidateConfigs" href="#mustValidateConfigs">func mustValidateConfigs(jobs map[string]Job)</a>

```
searchKey: shared.mustValidateConfigs
tags: [function private]
```

```Go
func mustValidateConfigs(jobs map[string]Job)
```

mustValidateConfigs calls Validate on the configs of each of the jobs that will be run by this instance of the worker. If any config has a validation error, a fatal log message will be emitted. 

### <a id="runRoutinesConcurrently" href="#runRoutinesConcurrently">func runRoutinesConcurrently(jobs map[string]Job) chan routinesResult</a>

```
searchKey: shared.runRoutinesConcurrently
tags: [function private]
```

```Go
func runRoutinesConcurrently(jobs map[string]Job) chan routinesResult
```

runRoutinesConcurrently returns a channel that will be populated with the return value of the Routines function from each given job. Each function is called concurrently. If an error occurs in one function, the context passed to all its siblings will be canceled. 

### <a id="safeSplit" href="#safeSplit">func safeSplit(text, sep string) []string</a>

```
searchKey: shared.safeSplit
tags: [function private]
```

```Go
func safeSplit(text, sep string) []string
```

safeSplit is strings.Split but returns nil (not a []string{""}) on empty input. 

### <a id="shouldRunJob" href="#shouldRunJob">func shouldRunJob(name string) bool</a>

```
searchKey: shared.shouldRunJob
tags: [function private]
```

```Go
func shouldRunJob(name string) bool
```

shouldRunJob returns true if the given job should be run. 

