# Package buildkite

Package buildkite defines data types that reflect Buildkite's YAML pipeline format. 

Usage: 

```
pipeline := buildkite.Pipeline{}
pipeline.AddStep("check_mark", buildkite.Cmd("./dev/check/all.sh"))

```
## Index

* [Variables](#var)
    * [var Plugins](#Plugins)
    * [var BeforeEveryStepOpts](#BeforeEveryStepOpts)
    * [var AfterEveryStepOpts](#AfterEveryStepOpts)
* [Types](#type)
    * [type Pipeline struct](#Pipeline)
        * [func (p *Pipeline) AddStep(label string, opts ...StepOpt)](#Pipeline.AddStep)
        * [func (p *Pipeline) AddTrigger(label string, opts ...StepOpt)](#Pipeline.AddTrigger)
        * [func (p *Pipeline) WriteTo(w io.Writer) (int64, error)](#Pipeline.WriteTo)
        * [func (p *Pipeline) AddWait()](#Pipeline.AddWait)
    * [type BuildOptions struct](#BuildOptions)
    * [type Step struct](#Step)
    * [type RetryOptions struct](#RetryOptions)
    * [type AutomaticRetryOptions struct](#AutomaticRetryOptions)
    * [type StepOpt func(step *github.com/sourcegraph/sourcegraph/enterprise/dev/ci/internal/buildkite.Step)](#StepOpt)
        * [func Cmd(command string) StepOpt](#Cmd)
        * [func Trigger(pipeline string) StepOpt](#Trigger)
        * [func Async(async bool) StepOpt](#Async)
        * [func Build(buildOptions BuildOptions) StepOpt](#Build)
        * [func ConcurrencyGroup(group string) StepOpt](#ConcurrencyGroup)
        * [func Concurrency(limit int) StepOpt](#Concurrency)
        * [func Env(name, value string) StepOpt](#Env)
        * [func SoftFail(softFail bool) StepOpt](#SoftFail)
        * [func AutomaticRetry(limit int) StepOpt](#AutomaticRetry)
        * [func ArtifactPaths(paths string) StepOpt](#ArtifactPaths)
        * [func Agent(key, value string) StepOpt](#Agent)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="Plugins" href="#Plugins">var Plugins</a>

```
searchKey: buildkite.Plugins
```

```Go
var Plugins = make(map[string]interface{})
```

### <a id="BeforeEveryStepOpts" href="#BeforeEveryStepOpts">var BeforeEveryStepOpts</a>

```
searchKey: buildkite.BeforeEveryStepOpts
```

```Go
var BeforeEveryStepOpts []StepOpt
```

BeforeEveryStepOpts are e.g. commands that are run before every AddStep, similar to Plugins. 

### <a id="AfterEveryStepOpts" href="#AfterEveryStepOpts">var AfterEveryStepOpts</a>

```
searchKey: buildkite.AfterEveryStepOpts
```

```Go
var AfterEveryStepOpts []StepOpt
```

AfterEveryStepOpts are e.g. that are run at the end of every AddStep, helpful for post-processing 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Pipeline" href="#Pipeline">type Pipeline struct</a>

```
searchKey: buildkite.Pipeline
```

```Go
type Pipeline struct {
	Env   map[string]string `json:"env,omitempty"`
	Steps []interface{}     `json:"steps"`
}
```

#### <a id="Pipeline.AddStep" href="#Pipeline.AddStep">func (p *Pipeline) AddStep(label string, opts ...StepOpt)</a>

```
searchKey: buildkite.Pipeline.AddStep
```

```Go
func (p *Pipeline) AddStep(label string, opts ...StepOpt)
```

#### <a id="Pipeline.AddTrigger" href="#Pipeline.AddTrigger">func (p *Pipeline) AddTrigger(label string, opts ...StepOpt)</a>

```
searchKey: buildkite.Pipeline.AddTrigger
```

```Go
func (p *Pipeline) AddTrigger(label string, opts ...StepOpt)
```

#### <a id="Pipeline.WriteTo" href="#Pipeline.WriteTo">func (p *Pipeline) WriteTo(w io.Writer) (int64, error)</a>

```
searchKey: buildkite.Pipeline.WriteTo
```

```Go
func (p *Pipeline) WriteTo(w io.Writer) (int64, error)
```

#### <a id="Pipeline.AddWait" href="#Pipeline.AddWait">func (p *Pipeline) AddWait()</a>

```
searchKey: buildkite.Pipeline.AddWait
```

```Go
func (p *Pipeline) AddWait()
```

### <a id="BuildOptions" href="#BuildOptions">type BuildOptions struct</a>

```
searchKey: buildkite.BuildOptions
```

```Go
type BuildOptions struct {
	Message  string                 `json:"message,omitempty"`
	Commit   string                 `json:"commit,omitempty"`
	Branch   string                 `json:"branch,omitempty"`
	MetaData map[string]interface{} `json:"meta_data,omitempty"`
	Env      map[string]string      `json:"env,omitempty"`
}
```

### <a id="Step" href="#Step">type Step struct</a>

```
searchKey: buildkite.Step
```

```Go
type Step struct {
	Label            string                 `json:"label"`
	Command          []string               `json:"command,omitempty"`
	TimeoutInMinutes string                 `json:"timeout_in_minutes,omitempty"`
	Trigger          string                 `json:"trigger,omitempty"`
	Async            bool                   `json:"async,omitempty"`
	Build            *BuildOptions          `json:"build,omitempty"`
	Env              map[string]string      `json:"env,omitempty"`
	Plugins          map[string]interface{} `json:"plugins,omitempty"`
	ArtifactPaths    string                 `json:"artifact_paths,omitempty"`
	ConcurrencyGroup string                 `json:"concurrency_group,omitempty"`
	Concurrency      int                    `json:"concurrency,omitempty"`
	SoftFail         bool                   `json:"soft_fail,omitempty"`
	Retry            *RetryOptions          `json:"retry,omitempty"`
	Agents           map[string]string      `json:"agents,omitempty"`
}
```

### <a id="RetryOptions" href="#RetryOptions">type RetryOptions struct</a>

```
searchKey: buildkite.RetryOptions
```

```Go
type RetryOptions struct {
	Automatic *AutomaticRetryOptions `json:"automatic,omitempty"`
}
```

### <a id="AutomaticRetryOptions" href="#AutomaticRetryOptions">type AutomaticRetryOptions struct</a>

```
searchKey: buildkite.AutomaticRetryOptions
```

```Go
type AutomaticRetryOptions struct {
	Limit int `json:"limit,omitempty"`
}
```

### <a id="StepOpt" href="#StepOpt">type StepOpt func(step *github.com/sourcegraph/sourcegraph/enterprise/dev/ci/internal/buildkite.Step)</a>

```
searchKey: buildkite.StepOpt
```

```Go
type StepOpt func(step *Step)
```

#### <a id="Cmd" href="#Cmd">func Cmd(command string) StepOpt</a>

```
searchKey: buildkite.Cmd
```

```Go
func Cmd(command string) StepOpt
```

#### <a id="Trigger" href="#Trigger">func Trigger(pipeline string) StepOpt</a>

```
searchKey: buildkite.Trigger
```

```Go
func Trigger(pipeline string) StepOpt
```

#### <a id="Async" href="#Async">func Async(async bool) StepOpt</a>

```
searchKey: buildkite.Async
```

```Go
func Async(async bool) StepOpt
```

#### <a id="Build" href="#Build">func Build(buildOptions BuildOptions) StepOpt</a>

```
searchKey: buildkite.Build
```

```Go
func Build(buildOptions BuildOptions) StepOpt
```

#### <a id="ConcurrencyGroup" href="#ConcurrencyGroup">func ConcurrencyGroup(group string) StepOpt</a>

```
searchKey: buildkite.ConcurrencyGroup
```

```Go
func ConcurrencyGroup(group string) StepOpt
```

#### <a id="Concurrency" href="#Concurrency">func Concurrency(limit int) StepOpt</a>

```
searchKey: buildkite.Concurrency
```

```Go
func Concurrency(limit int) StepOpt
```

#### <a id="Env" href="#Env">func Env(name, value string) StepOpt</a>

```
searchKey: buildkite.Env
```

```Go
func Env(name, value string) StepOpt
```

#### <a id="SoftFail" href="#SoftFail">func SoftFail(softFail bool) StepOpt</a>

```
searchKey: buildkite.SoftFail
```

```Go
func SoftFail(softFail bool) StepOpt
```

#### <a id="AutomaticRetry" href="#AutomaticRetry">func AutomaticRetry(limit int) StepOpt</a>

```
searchKey: buildkite.AutomaticRetry
```

```Go
func AutomaticRetry(limit int) StepOpt
```

#### <a id="ArtifactPaths" href="#ArtifactPaths">func ArtifactPaths(paths string) StepOpt</a>

```
searchKey: buildkite.ArtifactPaths
```

```Go
func ArtifactPaths(paths string) StepOpt
```

#### <a id="Agent" href="#Agent">func Agent(key, value string) StepOpt</a>

```
searchKey: buildkite.Agent
```

```Go
func Agent(key, value string) StepOpt
```

